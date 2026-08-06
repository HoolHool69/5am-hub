--!strict

local Runtime = {}
Runtime.__index = Runtime

local DIRECTIONS_2048 = { "left", "down", "right", "down", "left", "up" }
local PIECE_ROWS = {
    { "#" },
    { "##" },
    { "###" },
    { "####" },
    { "#####" },
    { "#", "#" },
    { "#", "#", "#" },
    { "#", "#", "#", "#" },
    { "#", "#", "#", "#", "#" },
    { "##", "##" },
    { "###", "###", "###" },
    { "###", "###" },
    { "##", "##", "##" },
    { "#.", "#.", "##" },
    { "###", "#.." },
    { "##", ".#", ".#" },
    { "..#", "###" },
    { ".#", ".#", "##" },
    { "#..", "###" },
    { "##", "#.", "#." },
    { "###", "..#" },
    { "###", ".#." },
    { ".#", "##", ".#" },
    { ".#.", "###" },
    { "#.", "##", "#." },
    { ".##", "##." },
    { "#.", "##", ".#" },
    { "##.", ".##" },
    { ".#", "##", "#." },
    { "##", "#." },
    { "##", ".#" },
    { "#.", "##" },
    { ".#", "##" },
    { "#..", "#..", "###" },
    { "###", "#..", "#.." },
    { "###", "..#", "..#" },
    { "..#", "..#", "###" },
}

local function ReadField(object: any, field: string): any
    if type(object) ~= "table" then
        return nil
    end
    local ok, value = pcall(function()
        return object[field]
    end)
    return if ok then value else nil
end

local function WriteField(object: any, field: string, value: any): boolean
    if type(object) ~= "table" then
        return false
    end
    local ok = pcall(function()
        object[field] = value
    end)
    return ok
end

local function Method(object: any, methodName: string): any
    local candidate = ReadField(object, methodName)
    return if type(candidate) == "function" then candidate else nil
end

local function Call(object: any, methodName: string, ...: any): (boolean, any)
    local method = Method(object, methodName)
    if not method then
        return false, string.format("%s is unavailable", methodName)
    end

    local arguments = table.pack(...)
    return pcall(function()
        return method(object, table.unpack(arguments, 1, arguments.n))
    end)
end

local function ControllerShape(candidate: any, getRawMetatable: any): boolean
    if type(candidate) ~= "table" or type(ReadField(candidate, "input")) ~= "table" then
        return false
    end

    local metatable = nil
    if type(getRawMetatable) == "function" then
        local ok, value = pcall(getRawMetatable, candidate)
        if ok then
            metatable = value
        end
    end
    if type(metatable) ~= "table" then
        local ok, value = pcall(getmetatable, candidate)
        if ok then
            metatable = value
        end
    end

    return type(metatable) == "table"
        and type(ReadField(metatable, "prepareInstance")) == "function"
        and type(ReadField(metatable, "beginPlaying")) == "function"
        and type(ReadField(metatable, "onRunEnded")) == "function"
end

local function PieceCells(pieceIndex: number): ({any}, number, number)
    local rows = PIECE_ROWS[pieceIndex + 1]
    if not rows then
        return {}, 0, 0
    end

    local cells = {}
    local width = 0
    for rowIndex, row in rows do
        width = math.max(width, #row)
        for columnIndex = 1, #row do
            if string.sub(row, columnIndex, columnIndex) == "#" then
                table.insert(cells, {
                    X = columnIndex - 1,
                    Y = rowIndex - 1,
                })
            end
        end
    end
    return cells, width, #rows
end

local function CanPlacePiece(board: any, pieceIndex: number, originColumn: number, originRow: number): boolean
    if type(board) ~= "table" then
        return false
    end

    local cells, width, height = PieceCells(pieceIndex)
    if #cells == 0
        or originColumn < 0
        or originRow < 0
        or originColumn + width > 8
        or originRow + height > 8
    then
        return false
    end

    for _, cell in cells do
        local index = ((originRow + cell.Y) * 8) + originColumn + cell.X + 1
        if board[index] == true then
            return false
        end
    end
    return true
end

function Runtime.new(context: any): any
    return setmetatable({
        Context = context,
        Controller = nil,
        Hook = nil,
        Destroyed = false,
        ScoreAccumulator = 0,
        DirectionIndex = 0,
        NumberMergeColumn = 0,
        SuikaDirection = 1,
        SuikaAim = 0,
        FinishedContexts = setmetatable({}, { __mode = "k" }),
        LastRunSeed = nil,
        LastScanAt = 0,
    }, Runtime)
end

function Runtime:Flag(name: string, fallback: any): any
    local value = self.Context.Flags:Get(name)
    return if value == nil then fallback else value
end

function Runtime:FindController(force: boolean?): any
    if not force and ControllerShape(self.Controller, self.Context.Environment.getrawmetatable) then
        return self.Controller
    end
    if not force and os.clock() - self.LastScanAt < 0.5 then
        return nil
    end
    self.LastScanAt = os.clock()

    local getGc = self.Context.Environment.getgc
    if type(getGc) ~= "function" then
        return nil
    end

    local ok, objects = pcall(getGc, true)
    if not ok or type(objects) ~= "table" then
        ok, objects = pcall(getGc)
    end
    if not ok or type(objects) ~= "table" then
        return nil
    end

    for _, candidate in objects do
        if ControllerShape(candidate, self.Context.Environment.getrawmetatable) then
            self.Controller = candidate
            return candidate
        end
    end
    return nil
end

function Runtime:GetInstance(): any
    local controller = self:FindController(false)
    return if controller then ReadField(controller, "instance") else nil
end

function Runtime:GetGameId(instanceOverride: any?): string?
    local instance = instanceOverride or self:GetInstance()
    local gameContext = ReadField(instance, "context")
    local gameId = ReadField(gameContext, "gameId")
    return if type(gameId) == "string" then gameId else nil
end

function Runtime:GetScore(): number
    local controller = self:FindController(false)
    local controllerScore = ReadField(controller, "currentScore")
    if type(controllerScore) == "number" then
        return controllerScore
    end

    local instance = self:GetInstance()
    local instanceScore = ReadField(instance, "score")
    return if type(instanceScore) == "number" then instanceScore else 0
end

function Runtime:RestoreHook()
    local hook = self.Hook
    if type(hook) ~= "table" then
        return
    end

    if ReadField(hook.Context, "endRun") == hook.EndWrapper then
        WriteField(hook.Context, "endRun", hook.EndRun)
    end
    if ReadField(hook.Context, "reportScore") == hook.ReportWrapper then
        WriteField(hook.Context, "reportScore", hook.ReportScore)
    end
    self.Hook = nil
end

function Runtime:ScaledScore(score: any): number
    local numericScore = tonumber(score) or 0
    local multiplier = math.max(1, tonumber(self:Flag("EndlessScoreMultiplier", 1)) or 1)
    return math.max(0, math.floor(numericScore * multiplier + 0.5))
end

function Runtime:EnsureHook(): any
    local instance = self:GetInstance()
    local gameContext = ReadField(instance, "context")
    if type(gameContext) ~= "table" then
        self:RestoreHook()
        return nil
    end
    if self.Hook and self.Hook.Context == gameContext then
        return self.Hook
    end

    self:RestoreHook()
    local endRun = ReadField(gameContext, "endRun")
    local reportScore = ReadField(gameContext, "reportScore")
    if type(endRun) ~= "function" or type(reportScore) ~= "function" then
        return nil
    end

    local hook = {
        Context = gameContext,
        EndRun = endRun,
        ReportScore = reportScore,
        EndWrapper = nil,
        ReportWrapper = nil,
    }
    hook.ReportWrapper = function(score: any)
        return reportScore(self:ScaledScore(score))
    end
    hook.EndWrapper = function(score: any)
        local finalScore = self:ScaledScore(score)
        if self:Flag("EndlessInvincible", false) == true
            or self:Flag("EndlessAutoPlay", false) == true
        then
            reportScore(finalScore)
            return nil
        end
        return endRun(finalScore)
    end

    if not WriteField(gameContext, "reportScore", hook.ReportWrapper)
        or not WriteField(gameContext, "endRun", hook.EndWrapper)
    then
        WriteField(gameContext, "reportScore", reportScore)
        WriteField(gameContext, "endRun", endRun)
        return nil
    end

    self.Hook = hook
    self.ScoreAccumulator = self:GetScore()
    self.LastRunSeed = ReadField(self.Controller, "currentRunSeed")
    return hook
end

function Runtime:ProtectObject(object: any)
    if type(object) ~= "table" then
        return
    end

    if ReadField(object, "dead") ~= nil then
        WriteField(object, "dead", false)
    end
    if ReadField(object, "ended") ~= nil then
        WriteField(object, "ended", false)
    end
    if type(ReadField(object, "invulnRemaining")) == "number" then
        WriteField(object, "invulnRemaining", math.huge)
    end
    if type(ReadField(object, "reviveClearTimer")) == "number" then
        WriteField(object, "reviveClearTimer", math.huge)
    end
    if type(ReadField(object, "collisionForgiveness")) == "number" then
        WriteField(object, "collisionForgiveness", math.huge)
    end
    if type(ReadField(object, "timeRemaining")) == "number" then
        WriteField(object, "timeRemaining", math.max(ReadField(object, "timeRemaining"), 3600))
    end
    if type(ReadField(object, "overflowTimer")) == "number" then
        WriteField(object, "overflowTimer", 0)
    end
    if type(ReadField(object, "belowFloorSeconds")) == "number" then
        WriteField(object, "belowFloorSeconds", 0)
    end
    if type(ReadField(object, "strikes")) == "number" then
        WriteField(object, "strikes", 0)
    end
    if type(ReadField(object, "misses")) == "number" then
        WriteField(object, "misses", 0)
    end
    if type(ReadField(object, "lives")) == "number" then
        WriteField(object, "lives", math.max(ReadField(object, "lives"), 99))
    end
end

function Runtime:ApplyProtection()
    if self:Flag("EndlessInvincible", false) ~= true
        and self:Flag("EndlessAutoPlay", false) ~= true
    then
        return
    end

    self:EnsureHook()
    local instance = self:GetInstance()
    self:ProtectObject(instance)
    self:ProtectObject(ReadField(instance, "sim"))
    self:ProtectObject(ReadField(instance, "simulation"))
end

function Runtime:ReportScore(score: number): boolean
    local hook = self:EnsureHook()
    if not hook then
        return false
    end
    local ok = pcall(hook.ReportScore, math.max(0, math.floor(score)))
    return ok
end

function Runtime:AddAutomaticScore(deltaTime: number)
    local runSeed = ReadField(self.Controller, "currentRunSeed")
    if runSeed ~= self.LastRunSeed then
        self.LastRunSeed = runSeed
        self.ScoreAccumulator = self:GetScore()
        local hook = self.Hook
        if hook then
            self.FinishedContexts[hook.Context] = nil
        end
    end

    local rate = math.max(1, tonumber(self:Flag("EndlessScoreRate", 100)) or 100)
    self.ScoreAccumulator = math.max(self.ScoreAccumulator, self:GetScore()) + rate * deltaTime
    self:ReportScore(self.ScoreAccumulator)

    local target = math.max(1, tonumber(self:Flag("EndlessTargetScore", 10000)) or 10000)
    if self:Flag("EndlessFinishAtTarget", false) == true and self.ScoreAccumulator >= target then
        local hook = self.Hook
        if hook and not self.FinishedContexts[hook.Context] then
            self.FinishedContexts[hook.Context] = true
            pcall(hook.EndRun, math.floor(target))
        end
    end
end

function Runtime:FinishCurrent(scoreOverride: number?): (boolean, string)
    local hook = self:EnsureHook()
    if not hook then
        return false, "Start a minigame first; no active run context was found."
    end

    local score = scoreOverride or self:GetScore()
    local ok, errorMessage = pcall(hook.EndRun, math.max(0, math.floor(score)))
    if ok then
        return true, string.format("Finished the current run with score %d.", math.floor(score))
    end
    return false, tostring(errorMessage)
end

function Runtime:Launch(gameId: string): (boolean, string)
    local controller = self:FindController(true)
    if not controller then
        return false, "GameSessionController was not found. This executor must expose getgc."
    end
    local launch = Method(controller, "launch")
    if not launch then
        return false, "The session controller does not expose launch."
    end

    task.spawn(function()
        local ok, errorMessage = pcall(launch, controller, {
            gameId = gameId,
            mode = "regular",
        })
        if not ok then
            self.Context.Notify("Launch Failed", tostring(errorMessage), 7)
            return
        end
        if self:GetGameId(ReadField(controller, "instance")) == gameId then
            Call(controller, "beginPlaying")
        end
    end)
    return true, string.format("Launching %s.", gameId)
end

function Runtime:Restart(): (boolean, string)
    local controller = self:FindController(true)
    if not controller then
        return false, "GameSessionController was not found."
    end
    local ok, errorMessage = Call(controller, "restart")
    if ok then
        return true, "Restart requested."
    end
    return false, tostring(errorMessage)
end

function Runtime:AutoBlockBlast(instance: any): boolean
    local board = ReadField(instance, "board")
    local slots = ReadField(instance, "slots")
    if type(board) ~= "table" or type(slots) ~= "table" then
        return false
    end

    for slotIndex = 0, 2 do
        local pieceIndex = slots[slotIndex + 1]
        if type(pieceIndex) == "number" and pieceIndex >= 0 then
            for originRow = 0, 7 do
                for originColumn = 0, 7 do
                    if CanPlacePiece(board, pieceIndex, originColumn, originRow) then
                        local ok = Call(instance, "placeCarried", {
                            pieceIndex = pieceIndex,
                            originColumn = originColumn,
                            originRow = originRow,
                            slot = slotIndex,
                            valid = true,
                        })
                        return ok
                    end
                end
            end
        end
    end

    for index = 1, 64 do
        board[index] = false
    end
    WriteField(instance, "carried", nil)
    Call(instance, "refillTray")
    return true
end

function Runtime:AutoFruitNinja(instance: any): boolean
    local fruits = ReadField(instance, "fruits")
    if type(fruits) ~= "table" then
        return false
    end

    local sliced = false
    for _, fruit in fruits do
        if ReadField(fruit, "active") == true and ReadField(fruit, "isBomb") ~= true then
            local ok = Call(instance, "slice", fruit, Vector2.new(1, 0), 5000)
            sliced = sliced or ok
        end
    end
    if sliced then
        Call(instance, "resolveStroke", true)
    end
    return sliced
end

function Runtime:AutoTrafficRush(instance: any): boolean
    local simulation = ReadField(instance, "sim")
    local pool = ReadField(simulation, "pool")
    if type(pool) ~= "table" then
        return false
    end

    local acted = false
    for _, vehicle in pool do
        if ReadField(vehicle, "active") == true
            and ReadField(vehicle, "cleared") ~= true
            and ReadField(vehicle, "crashed") ~= true
        then
            local id = ReadField(vehicle, "id")
            if id ~= nil then
                local ok = Call(simulation, "dash", id)
                acted = acted or ok
            end
        end
    end
    return acted
end

function Runtime:AutoStep(): boolean
    local instance = self:GetInstance()
    local gameId = self:GetGameId(instance)
    if type(instance) ~= "table" or not gameId then
        return false
    end

    self:ApplyProtection()
    if gameId == "2048" or gameId == "2048-3d" then
        local target = if gameId == "2048-3d" then ReadField(instance, "logic") or instance else instance
        self.DirectionIndex = self.DirectionIndex % #DIRECTIONS_2048 + 1
        return Call(target, "applyDirection", DIRECTIONS_2048[self.DirectionIndex])
    elseif gameId == "flappy-bird" then
        return Call(instance, "onPress")
    elseif gameId == "helix-jump" then
        local angle = tonumber(ReadField(instance, "towerAngle")) or 0
        WriteField(instance, "towerAngle", angle + math.rad(25))
        WriteField(instance, "pendingNudge", 0)
        return true
    elseif gameId == "stack" then
        WriteField(instance, "movingOffset", 0)
        return Call(instance, "onPress")
    elseif gameId == "knife-hit" then
        local stuck = ReadField(instance, "stuck")
        if type(stuck) == "table" then
            table.clear(stuck)
        end
        WriteField(instance, "lastThrowAt", 0)
        return Call(instance, "onPress")
    elseif gameId == "suika" then
        self.SuikaAim += self.SuikaDirection * 0.8
        if math.abs(self.SuikaAim) >= 4 then
            self.SuikaDirection *= -1
        end
        WriteField(instance, "aimX", self.SuikaAim)
        WriteField(instance, "lastDropAt", 0)
        return Call(instance, "attemptDrop")
    elseif gameId == "timberman" then
        local branchSides = ReadField(instance, "branchSides")
        local dangerousSide = if type(branchSides) == "table" then branchSides[1] else "none"
        local side = if dangerousSide == "left" then "right" else "left"
        return Call(instance, "enqueueChop", side)
    elseif gameId == "number-merge" then
        local columns = ReadField(instance, "columns")
        local columnCount = if type(columns) == "table" then math.max(1, #columns) else 5
        self.NumberMergeColumn = (self.NumberMergeColumn + 1) % columnCount
        Call(instance, "selectColumn", self.NumberMergeColumn)
        return Call(instance, "requestDrop", self.NumberMergeColumn)
    elseif gameId == "zig-zag" then
        return Call(instance, "onPress")
    elseif gameId == "fruit-ninja" then
        return self:AutoFruitNinja(instance)
    elseif gameId == "traffic-rush" then
        return self:AutoTrafficRush(instance)
    elseif gameId == "crossy-road" then
        local simulation = ReadField(instance, "simulation")
        WriteField(simulation, "reviveClearTimer", math.huge)
        return Call(simulation, "queueHop", "forward")
    elseif gameId == "highway-rider-tp" or gameId == "highway-rider-fp" then
        WriteField(instance, "collisionForgiveness", math.huge)
        WriteField(instance, "invulnRemaining", math.huge)
        WriteField(instance, "steerVelocity", 0)
        return true
    elseif gameId == "tiny-wings" then
        local grounded = ReadField(instance, "grounded") == true
        local velocityY = tonumber(ReadField(instance, "velocityY")) or 0
        WriteField(instance, "holding", grounded or velocityY < 0)
        return true
    elseif gameId == "block-blast" then
        return self:AutoBlockBlast(instance)
    elseif gameId == "icy-tower" then
        WriteField(instance, "reviveClearTimer", math.huge)
        local velocityY = tonumber(ReadField(instance, "velocityYPx"))
        if velocityY and velocityY < -20 then
            WriteField(instance, "velocityYPx", math.abs(velocityY))
        end
        return true
    elseif gameId == "tower-builder" then
        if ReadField(instance, "falling") ~= true then
            WriteField(instance, "swingPhase", 0)
            WriteField(instance, "ropeAngle", 0)
            return Call(instance, "onPress")
        end
        return true
    end
    return false
end

function Runtime:GetStatus(): (string, string, number)
    local controller = self:FindController(false)
    if not controller then
        return "No controller", "none", 0
    end
    local instance = ReadField(controller, "instance")
    local gameId = self:GetGameId(instance) or "lobby"
    local runSeed = tostring(ReadField(controller, "currentRunSeed") or "none")
    return gameId, runSeed, self:GetScore()
end

function Runtime:Destroy()
    if self.Destroyed then
        return
    end
    self.Destroyed = true
    self:RestoreHook()
    self.Controller = nil
end

return Runtime
