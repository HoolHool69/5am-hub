--!strict

local Runtime = {}
Runtime.__index = Runtime

local DIRECTIONS_2048 = { "down", "left", "right", "up" }
local SNAKE_WEIGHTS_2048 = { 0, 1, 2, 3, 7, 6, 5, 4, 8, 9, 10, 11, 15, 14, 13, 12 }
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

local function CloneBooleanBoard(board: any): {boolean}
    local clone = table.create(64, false)
    for index = 1, 64 do
        clone[index] = board[index] == true
    end
    return clone
end

local function SimulatePiecePlacement(
    board: any,
    pieceIndex: number,
    originColumn: number,
    originRow: number
): ({boolean}?, number)
    if not CanPlacePiece(board, pieceIndex, originColumn, originRow) then
        return nil, 0
    end

    local result = CloneBooleanBoard(board)
    local cells = PieceCells(pieceIndex)
    for _, cell in cells do
        local index = ((originRow + cell.Y) * 8) + originColumn + cell.X + 1
        result[index] = true
    end

    local fullRows = table.create(8, false)
    local fullColumns = table.create(8, false)
    local clearedLines = 0
    for row = 0, 7 do
        local full = true
        for column = 0, 7 do
            if result[(row * 8) + column + 1] ~= true then
                full = false
                break
            end
        end
        if full then
            fullRows[row + 1] = true
            clearedLines += 1
        end
    end
    for column = 0, 7 do
        local full = true
        for row = 0, 7 do
            if result[(row * 8) + column + 1] ~= true then
                full = false
                break
            end
        end
        if full then
            fullColumns[column + 1] = true
            clearedLines += 1
        end
    end
    if clearedLines > 0 then
        for row = 0, 7 do
            for column = 0, 7 do
                if fullRows[row + 1] or fullColumns[column + 1] then
                    result[(row * 8) + column + 1] = false
                end
            end
        end
    end
    return result, clearedLines
end

local function EvaluateBlockBoard(board: {boolean}): number
    local occupied = 0
    local isolatedHoles = 0
    local edgePenalty = 0
    for row = 0, 7 do
        for column = 0, 7 do
            local index = (row * 8) + column + 1
            if board[index] then
                occupied += 1
                edgePenalty += math.abs(column - 3.5) + math.abs(row - 3.5)
            else
                local neighbors = 0
                if row > 0 and board[index - 8] then
                    neighbors += 1
                end
                if row < 7 and board[index + 8] then
                    neighbors += 1
                end
                if column > 0 and board[index - 1] then
                    neighbors += 1
                end
                if column < 7 and board[index + 1] then
                    neighbors += 1
                end
                if neighbors >= 3 then
                    isolatedHoles += 1
                end
            end
        end
    end
    return -occupied * 3 - isolatedHoles * 90 - edgePenalty * 0.2
end

local function CountPiecePlacements(board: {boolean}, pieceIndex: number, cap: number): number
    local count = 0
    for row = 0, 7 do
        for column = 0, 7 do
            if CanPlacePiece(board, pieceIndex, column, row) then
                count += 1
                if count >= cap then
                    return count
                end
            end
        end
    end
    return count
end

local function CloneNumberBoard(board: {number}): {number}
    local clone = table.create(#board, 0)
    for index, value in board do
        clone[index] = value
    end
    return clone
end

local function Index2048(line: number, position: number, direction: string): number
    if direction == "left" then
        return (line * 4) + position + 1
    elseif direction == "right" then
        return (line * 4) + (3 - position) + 1
    elseif direction == "up" then
        return (position * 4) + line + 1
    end
    return ((3 - position) * 4) + line + 1
end

local function Simulate2048(board: {number}, direction: string): ({number}, boolean, number)
    local result = CloneNumberBoard(board)
    local moved = false
    local mergeScore = 0
    for line = 0, 3 do
        local compact = {}
        for position = 0, 3 do
            local value = board[Index2048(line, position, direction)] or 0
            if value > 0 then
                table.insert(compact, value)
            end
        end

        local merged = {}
        local index = 1
        while index <= #compact do
            local value = compact[index]
            if compact[index + 1] == value then
                value *= 2
                mergeScore += value
                index += 1
            end
            table.insert(merged, value)
            index += 1
        end

        for position = 0, 3 do
            local destination = Index2048(line, position, direction)
            local value = merged[position + 1] or 0
            if result[destination] ~= value then
                moved = true
            end
            result[destination] = value
        end
    end
    return result, moved, mergeScore
end

local function Evaluate2048(board: {number}): number
    local empty = 0
    local largest = 0
    local snake = 0
    local smoothness = 0
    local mergePairs = 0
    for index, value in board do
        if value == 0 then
            empty += 1
        else
            largest = math.max(largest, value)
            snake += value * (2 ^ SNAKE_WEIGHTS_2048[index])
        end
    end
    for row = 0, 3 do
        for column = 0, 3 do
            local index = (row * 4) + column + 1
            local value = board[index]
            if value > 0 then
                if column < 3 and board[index + 1] > 0 then
                    smoothness -= math.abs(math.log(value) - math.log(board[index + 1]))
                    if value == board[index + 1] then
                        mergePairs += 1
                    end
                end
                if row < 3 and board[index + 4] > 0 then
                    smoothness -= math.abs(math.log(value) - math.log(board[index + 4]))
                    if value == board[index + 4] then
                        mergePairs += 1
                    end
                end
            end
        end
    end
    local corner = math.max(board[1], board[4], board[13], board[16])
    local cornerBonus = if corner == largest then largest * 2500 else -largest * 1800
    return empty * 120000 + snake * 0.15 + smoothness * 900 + mergePairs * 5000 + cornerBonus
end

local function Search2048(board: {number}, depth: number): number
    if depth <= 0 then
        return Evaluate2048(board)
    end
    local best = -math.huge
    for _, direction in DIRECTIONS_2048 do
        local nextBoard, moved, mergeScore = Simulate2048(board, direction)
        if moved then
            best = math.max(best, mergeScore * 250 + Search2048(nextBoard, depth - 1) * 0.92)
        end
    end
    return if best > -math.huge then best else Evaluate2048(board)
end

local function CloneMergeColumns(columns: any): {{number}}
    local clone = {}
    for _, column in columns do
        local values = {}
        for _, tile in column do
            local value = tonumber(ReadField(tile, "value")) or tonumber(tile) or 0
            table.insert(values, value)
        end
        table.insert(clone, values)
    end
    return clone
end

local function CloneMergeValues(columns: {{number}}): {{number}}
    local clone = {}
    for _, column in columns do
        table.insert(clone, CloneNumberBoard(column))
    end
    return clone
end

local function MergeCellKey(column: number, row: number): string
    return string.format("%d:%d", column, row)
end

local function ResolveOneMerge(columns: {{number}}): (boolean, number)
    local visited = {}
    for columnIndex, column in columns do
        for rowIndex, value in column do
            local startKey = MergeCellKey(columnIndex, rowIndex)
            if value <= 0 or visited[startKey] then
                continue
            end

            local queue = { { Column = columnIndex, Row = rowIndex } }
            local group = {}
            visited[startKey] = true
            local cursor = 1
            while cursor <= #queue do
                local cell = queue[cursor]
                cursor += 1
                table.insert(group, cell)
                local neighbors = {
                    { Column = cell.Column - 1, Row = cell.Row },
                    { Column = cell.Column + 1, Row = cell.Row },
                    { Column = cell.Column, Row = cell.Row - 1 },
                    { Column = cell.Column, Row = cell.Row + 1 },
                }
                for _, neighbor in neighbors do
                    local neighborColumn = columns[neighbor.Column]
                    local neighborValue = if neighborColumn then neighborColumn[neighbor.Row] else nil
                    local key = MergeCellKey(neighbor.Column, neighbor.Row)
                    if neighborValue == value and not visited[key] then
                        visited[key] = true
                        table.insert(queue, neighbor)
                    end
                end
            end

            if #group >= 2 then
                local survivor = group[1]
                local removed = {}
                for groupIndex = 2, #group do
                    local cell = group[groupIndex]
                    removed[MergeCellKey(cell.Column, cell.Row)] = true
                end
                local newValue = value * (2 ^ (#group - 1))
                for currentColumnIndex, currentColumn in columns do
                    local rebuilt = {}
                    for currentRowIndex, currentValue in currentColumn do
                        local key = MergeCellKey(currentColumnIndex, currentRowIndex)
                        if not removed[key] then
                            if currentColumnIndex == survivor.Column and currentRowIndex == survivor.Row then
                                table.insert(rebuilt, newValue)
                            else
                                table.insert(rebuilt, currentValue)
                            end
                        end
                    end
                    columns[currentColumnIndex] = rebuilt
                end
                return true, newValue * #group
            end
        end
    end
    return false, 0
end

local function SimulateNumberDrop(columns: {{number}}, columnIndex: number, value: number): ({{number}}, number, number)
    local result = CloneMergeValues(columns)
    table.insert(result[columnIndex], value)
    local totalGain = 0
    local chainDepth = 0
    while chainDepth < 24 do
        local merged, gain = ResolveOneMerge(result)
        if not merged then
            break
        end
        chainDepth += 1
        totalGain += gain * chainDepth
    end
    return result, totalGain, chainDepth
end

local function EvaluateNumberBoard(columns: {{number}}): number
    local tallest = 0
    local totalHeight = 0
    local adjacentTopPairs = 0
    for columnIndex, column in columns do
        tallest = math.max(tallest, #column)
        totalHeight += #column
        local nextColumn = columns[columnIndex + 1]
        if nextColumn and #column > 0 and #nextColumn > 0 and column[#column] == nextColumn[#nextColumn] then
            adjacentTopPairs += 1
        end
    end
    return adjacentTopPairs * 1600 - tallest * tallest * 550 - totalHeight * 45
end

function Runtime.new(context: any): any
    return setmetatable({
        Context = context,
        Controller = nil,
        Hook = nil,
        Destroyed = false,
        LastFlapAt = 0,
        IcyTargetFloor = nil,
        HighwayTarget = nil,
        StrategyInstance = nil,
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
    self.Hook = nil
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
    }
    hook.EndWrapper = function(score: any)
        if self:Flag("EndlessInvincible", false) == true
            or self:Flag("EndlessAutoPlay", false) == true
        then
            reportScore(score)
            return nil
        end
        return endRun(score)
    end

    if not WriteField(gameContext, "endRun", hook.EndWrapper) then
        return nil
    end

    self.Hook = hook
    return hook
end

function Runtime:ProtectObject(object: any)
    if type(object) ~= "table" then
        return
    end

    if ReadField(object, "dead") == true and Method(object, "revive") then
        Call(object, "revive")
    elseif ReadField(object, "dead") ~= nil then
        WriteField(object, "dead", false)
    end
    if ReadField(object, "ended") ~= nil then
        WriteField(object, "ended", false)
    end
    if ReadField(object, "runEnded") ~= nil then
        WriteField(object, "runEnded", false)
    end
    if ReadField(object, "crashedA") ~= nil and Method(object, "recoverFromCrash") then
        Call(object, "recoverFromCrash")
    end
    if type(ReadField(object, "invulnRemaining")) == "number" then
        WriteField(object, "invulnRemaining", math.huge)
    end
    if type(ReadField(object, "reviveClearTimer")) == "number" then
        WriteField(object, "reviveClearTimer", math.huge)
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
    if Method(object, "setRunning") then
        Call(object, "setRunning", true)
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

    local bestPlacement = nil
    local bestScore = -math.huge
    for slotIndex = 0, 2 do
        local pieceIndex = slots[slotIndex + 1]
        if type(pieceIndex) == "number" and pieceIndex >= 0 then
            for originRow = 0, 7 do
                for originColumn = 0, 7 do
                    local nextBoard, clearedLines = SimulatePiecePlacement(
                        board,
                        pieceIndex,
                        originColumn,
                        originRow
                    )
                    if nextBoard then
                        local score = clearedLines * 100000 + EvaluateBlockBoard(nextBoard)
                        for otherSlotIndex = 0, 2 do
                            if otherSlotIndex ~= slotIndex then
                                local otherPiece = slots[otherSlotIndex + 1]
                                if type(otherPiece) == "number" and otherPiece >= 0 then
                                    local options = CountPiecePlacements(nextBoard, otherPiece, 24)
                                    score += options * 120
                                    if options == 0 then
                                        score -= 50000
                                    end
                                end
                            end
                        end
                        if score > bestScore then
                            bestScore = score
                            bestPlacement = {
                                pieceIndex = pieceIndex,
                                originColumn = originColumn,
                                originRow = originRow,
                                slot = slotIndex,
                                valid = true,
                            }
                        end
                    end
                end
            end
        end
    end

    if bestPlacement then
        return Call(instance, "placeCarried", bestPlacement)
    end
    return false
end

function Runtime:Auto2048(instance: any): boolean
    local target = ReadField(instance, "logic") or instance
    local board = ReadField(target, "board")
    local tiles = ReadField(board, "tiles")
    if type(tiles) ~= "table" then
        return false
    end

    local values = table.create(16, 0)
    for index = 0, 15 do
        local tile = tiles[index]
        values[index + 1] = tonumber(ReadField(tile, "value")) or 0
    end

    local bestDirection = nil
    local bestScore = -math.huge
    for _, direction in DIRECTIONS_2048 do
        local nextBoard, moved, mergeScore = Simulate2048(values, direction)
        if moved then
            local score = mergeScore * 500 + Search2048(nextBoard, 2)
            if score > bestScore then
                bestScore = score
                bestDirection = direction
            end
        end
    end
    if not bestDirection then
        return false
    end
    return Call(target, "applyDirection", bestDirection)
end

function Runtime:AutoFlappy(instance: any): boolean
    local birdY = tonumber(ReadField(instance, "birdY")) or 0
    local velocityY = tonumber(ReadField(instance, "birdVelocityY")) or 0
    local pipes = ReadField(instance, "pipes")
    local targetY = 4
    local timeToPipe = 0.5
    local nearestX = math.huge
    if type(pipes) == "table" then
        for _, pipe in pipes do
            local pipeX = tonumber(ReadField(pipe, "x"))
            if ReadField(pipe, "active") == true
                and ReadField(pipe, "scored") ~= true
                and pipeX
                and pipeX >= -7
                and pipeX < nearestX
            then
                nearestX = pipeX
                targetY = (tonumber(ReadField(pipe, "gapCenterY")) or targetY) + 0.2
            end
        end
    end
    if nearestX < math.huge then
        timeToPipe = math.clamp((nearestX + 5.5) / 9.375, 0.05, 0.32)
    end

    local projectedY = birdY + velocityY * timeToPipe + 0.5 * -70.3125 * timeToPipe * timeToPipe
    local shouldFlap = projectedY < targetY - 0.45
        and birdY < targetY + 2.8
        and velocityY < 17
        and os.clock() - self.LastFlapAt >= 0.11
    if shouldFlap then
        local ok = Call(instance, "onPress")
        if ok then
            self.LastFlapAt = os.clock()
        end
        return ok
    end
    return true
end

function Runtime:AutoHelix(instance: any): boolean
    local platforms = ReadField(instance, "platforms")
    local ballY = tonumber(ReadField(instance, "ballY")) or 0
    if type(platforms) ~= "table" then
        return false
    end

    local targetPlatform = nil
    local targetGapIndex = nil
    local targetY = -math.huge
    for _, platform in platforms do
        local platformY = tonumber(ReadField(platform, "y"))
        local pattern = ReadField(platform, "pattern")
        if platformY
            and platformY < ballY - 0.15
            and platformY > targetY
            and ReadField(platform, "passed") ~= true
            and ReadField(platform, "smashed") ~= true
            and type(pattern) == "table"
        then
            for gapIndex, segmentType in pattern do
                if segmentType == "gap" then
                    targetPlatform = platform
                    targetGapIndex = gapIndex
                    targetY = platformY
                    break
                end
            end
        end
    end
    if not targetPlatform or not targetGapIndex then
        return true
    end

    local pattern = ReadField(targetPlatform, "pattern")
    local segmentCount = #pattern
    local angle = -((targetGapIndex - 0.5) * math.tau / segmentCount)
    WriteField(instance, "towerAngle", angle)
    WriteField(instance, "renderPrevTowerAngle", angle)
    WriteField(instance, "pendingNudge", 0)
    WriteField(instance, "keyAngularVelocity", 0)
    local moving = ReadField(targetPlatform, "moving")
    if type(moving) == "table" then
        WriteField(moving, "active", false)
    end
    Call(instance, "releaseWallOn", targetPlatform)
    return true
end

function Runtime:AutoSuika(instance: any): boolean
    local activeFruits = ReadField(instance, "activeFruits")
    local nextTier = tonumber(ReadField(instance, "nextTier")) or 0
    local bestX = nil
    local bestY = -math.huge
    if type(activeFruits) == "table" then
        for _, fruit in activeFruits do
            if ReadField(fruit, "merging") ~= true
                and tonumber(ReadField(fruit, "tier")) == nextTier
            then
                local part = ReadField(fruit, "part")
                local okPosition, position = pcall(function()
                    return part.Position
                end)
                if okPosition then
                    local okPlane, plane = Call(instance, "toPlane", position)
                    if okPlane and plane then
                        local okCoordinates, planeX, planeY = pcall(function()
                            return plane.X, plane.Y
                        end)
                        if okCoordinates and planeY > bestY then
                            bestX = planeX
                            bestY = planeY
                        end
                    end
                end
            end
        end
    end
    if not bestX then
        local lanes = { -7.5, -3.75, 0, 3.75, 7.5 }
        bestX = lanes[(nextTier % #lanes) + 1]
    end
    local okClamp, clamped = Call(instance, "clampAim", bestX)
    WriteField(instance, "aimX", if okClamp and type(clamped) == "number" then clamped else bestX)
    return Call(instance, "attemptDrop")
end

function Runtime:AutoNumberMerge(instance: any): boolean
    if ReadField(instance, "resolving") == true then
        return true
    end
    local columns = ReadField(instance, "columns")
    local queued = ReadField(instance, "queued")
    local upcoming = ReadField(instance, "upcoming")
    local queuedValue = tonumber(ReadField(queued, "value"))
    if type(columns) ~= "table" or not queuedValue or #columns == 0 then
        return false
    end

    local values = CloneMergeColumns(columns)
    local upcomingValue = tonumber(ReadField(upcoming, "value"))
    local bestColumn = 1
    local bestScore = -math.huge
    for columnIndex = 1, #values do
        local firstBoard, firstGain, firstChain = SimulateNumberDrop(values, columnIndex, queuedValue)
        local score = firstGain * 18 + firstChain * 4500 + EvaluateNumberBoard(firstBoard)
        if upcomingValue then
            local bestSecond = -math.huge
            for secondColumn = 1, #firstBoard do
                local secondBoard, secondGain, secondChain = SimulateNumberDrop(
                    firstBoard,
                    secondColumn,
                    upcomingValue
                )
                bestSecond = math.max(
                    bestSecond,
                    secondGain * 12 + secondChain * 2800 + EvaluateNumberBoard(secondBoard)
                )
            end
            score += bestSecond * 0.35
        end
        if score > bestScore then
            bestScore = score
            bestColumn = columnIndex
        end
    end

    Call(instance, "selectColumn", bestColumn - 1)
    return Call(instance, "requestDrop", bestColumn - 1)
end

function Runtime:AutoSharpTurns(instance: any): boolean
    local gridSet = ReadField(instance, "gridSet")
    local currentGx = tonumber(ReadField(instance, "currentGx"))
    local currentGz = tonumber(ReadField(instance, "currentGz"))
    local direction = ReadField(instance, "direction")
    if type(gridSet) ~= "table" or not currentGx or not currentGz then
        return false
    end

    local forwardX = currentGx + (if direction == "x" then 1 else 0)
    local forwardZ = currentGz + (if direction == "z" then 1 else 0)
    local turnX = currentGx + (if direction == "z" then 1 else 0)
    local turnZ = currentGz + (if direction == "x" then 1 else 0)
    local forwardKey = string.format("%d,%d", forwardX, forwardZ)
    local turnKey = string.format("%d,%d", turnX, turnZ)
    if gridSet[forwardKey] == nil and gridSet[turnKey] ~= nil then
        return Call(instance, "onPress")
    end
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

    if ReadField(simulation, "crashedA") ~= nil then
        Call(simulation, "recoverFromCrash")
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

function Runtime:AutoHighway(instance: any): boolean
    WriteField(instance, "invulnRemaining", math.huge)
    WriteField(instance, "collisionForgiveness", 0.45)
    local cars = ReadField(instance, "cars")
    local playerS = tonumber(ReadField(instance, "playerS")) or 0
    local speed = tonumber(ReadField(instance, "speed")) or 0
    if type(cars) ~= "table" then
        return true
    end

    local target = self.HighwayTarget
    if type(target) ~= "table"
        or ReadField(target, "active") ~= true
        or ReadField(target, "flung") == true
        or ReadField(target, "nearMissAwarded") == true
        or (tonumber(ReadField(target, "s")) or -math.huge) < playerS - 60
    then
        target = nil
    end

    local spec = ReadField(instance, "spec")
    local scoreFloorSpeed = tonumber(ReadField(spec, "scoreFloorSpeed")) or 0
    if not target and speed >= scoreFloorSpeed then
        local bestDistance = math.huge
        for _, car in cars do
            local carS = tonumber(ReadField(car, "s"))
            local carSpeed = tonumber(ReadField(car, "speed")) or speed
            if ReadField(car, "active") == true
                and ReadField(car, "flung") ~= true
                and ReadField(car, "nearMissAwarded") ~= true
                and carS
                and carS >= playerS - 4
                and carS - playerS < bestDistance
                and speed - carSpeed >= 18
            then
                target = car
                bestDistance = carS - playerS
            end
        end
    end
    self.HighwayTarget = target

    if target then
        local targetX = tonumber(ReadField(target, "x"))
        if targetX then
            WriteField(instance, "playerX", targetX)
            WriteField(instance, "renderPrevX", targetX)
            WriteField(instance, "steerVelocity", 0)
        end
    end
    return true
end

function Runtime:AutoTinyWings(instance: any): boolean
    local terrain = ReadField(instance, "terrain")
    local x = tonumber(ReadField(instance, "x")) or 0
    local velocityX = tonumber(ReadField(instance, "velocityX")) or tonumber(ReadField(instance, "speed")) or 60
    local velocityY = tonumber(ReadField(instance, "velocityY")) or 0
    if type(terrain) ~= "table" then
        return false
    end
    local aheadX = x + math.max(2.5, velocityX * 0.12)
    local okSlope, slope = Call(terrain, "slopeAt", if ReadField(instance, "grounded") == true then x else aheadX)
    local okKind, terrainKind = Call(terrain, "kindAt", aheadX)
    local downhillAhead = (okSlope and type(slope) == "number" and slope < -0.02)
        or (okKind and terrainKind == "dive")
    local holding
    if ReadField(instance, "grounded") == true then
        holding = downhillAhead
    elseif velocityY > 0 then
        holding = false
    else
        holding = downhillAhead
    end
    WriteField(instance, "holding", holding)
    return true
end

function Runtime:AutoIcyTower(instance: any): boolean
    local currentFloor = tonumber(ReadField(instance, "currentFloor")) or 0
    Call(instance, "ensureFloors", currentFloor + 8)
    local floorSpecs = ReadField(instance, "floorSpecs")
    if type(floorSpecs) ~= "table" then
        return false
    end

    local targetFloor = tonumber(self.IcyTargetFloor)
    if not targetFloor or currentFloor >= targetFloor or not floorSpecs[targetFloor] then
        targetFloor = nil
        for candidate = currentFloor + 4, currentFloor + 1, -1 do
            if floorSpecs[candidate] then
                targetFloor = candidate
                break
            end
        end
        self.IcyTargetFloor = targetFloor
    end
    if not targetFloor then
        return true
    end

    local targetSpec = floorSpecs[targetFloor]
    local left = tonumber(ReadField(targetSpec, "collisionLeftPx"))
    local right = tonumber(ReadField(targetSpec, "collisionRightPx"))
    if not left or not right then
        return false
    end
    local targetX = (left + right) / 2
    WriteField(instance, "playerXPx", targetX)
    WriteField(instance, "renderPrevXPx", targetX)
    WriteField(instance, "velocityXPx", 0)
    if ReadField(instance, "grounded") == true then
        WriteField(instance, "velocityYPx", 24.4)
        WriteField(instance, "grounded", false)
        WriteField(instance, "spinning", true)
    end
    return true
end

function Runtime:AutoTowerBuilder(instance: any): boolean
    local floors = tonumber(ReadField(instance, "floors")) or 0
    local logicalBlocks = ReadField(instance, "logicalBlocks")
    local centerX = 0
    if floors > 0 and type(logicalBlocks) == "table" then
        centerX = tonumber(ReadField(logicalBlocks[floors], "centerX")) or 0
    end
    local swayAmplitude = tonumber(ReadField(instance, "swayAmplitudeCurrent")) or 0
    local swayPhase = tonumber(ReadField(instance, "swayPhase")) or 0
    local targetX = centerX + swayAmplitude * math.sin(swayPhase)

    if ReadField(instance, "falling") == true then
        WriteField(instance, "fallEndX", targetX)
        WriteField(instance, "fallVelocityX", 0)
        return true
    end
    if (tonumber(ReadField(instance, "hookTimer")) or 0) > 0 then
        return true
    end
    WriteField(instance, "dropQueued", false)
    local ok = Call(instance, "release")
    if ok then
        WriteField(instance, "fallEndX", targetX)
        WriteField(instance, "fallVelocityX", 0)
    end
    return ok
end

function Runtime:AutoStep(): boolean
    local instance = self:GetInstance()
    local gameId = self:GetGameId(instance)
    if type(instance) ~= "table" or not gameId then
        return false
    end

    if self.StrategyInstance ~= instance then
        self.StrategyInstance = instance
        self.LastFlapAt = 0
        self.IcyTargetFloor = nil
        self.HighwayTarget = nil
    end

    self:ApplyProtection()
    if gameId == "2048" or gameId == "2048-3d" then
        return self:Auto2048(instance)
    elseif gameId == "flappy-bird" then
        return self:AutoFlappy(instance)
    elseif gameId == "helix-jump" then
        return self:AutoHelix(instance)
    elseif gameId == "stack" then
        WriteField(instance, "movingOffset", 0)
        WriteField(instance, "renderPrevMovingOffset", 0)
        WriteField(instance, "dropQueued", false)
        return Call(instance, "drop")
    elseif gameId == "knife-hit" then
        local stuck = ReadField(instance, "stuck")
        if type(stuck) == "table" then
            table.clear(stuck)
        end
        WriteField(instance, "lastThrowAt", 0)
        return Call(instance, "onPress")
    elseif gameId == "suika" then
        return self:AutoSuika(instance)
    elseif gameId == "timberman" then
        local branchSides = ReadField(instance, "branchSides")
        local dangerousSide = if type(branchSides) == "table" then branchSides[1] else "none"
        if dangerousSide == "none" and type(branchSides) == "table" then
            dangerousSide = branchSides[2] or "none"
        end
        local side = if dangerousSide == "left" then "right" else "left"
        return Call(instance, "enqueueChop", side)
    elseif gameId == "number-merge" then
        return self:AutoNumberMerge(instance)
    elseif gameId == "zig-zag" then
        return self:AutoSharpTurns(instance)
    elseif gameId == "fruit-ninja" then
        return self:AutoFruitNinja(instance)
    elseif gameId == "traffic-rush" then
        return self:AutoTrafficRush(instance)
    elseif gameId == "crossy-road" then
        local simulation = ReadField(instance, "simulation")
        WriteField(simulation, "reviveClearTimer", math.huge)
        return Call(simulation, "queueHop", "forward")
    elseif gameId == "highway-rider-tp" or gameId == "highway-rider-fp" then
        return self:AutoHighway(instance)
    elseif gameId == "tiny-wings" then
        return self:AutoTinyWings(instance)
    elseif gameId == "block-blast" then
        return self:AutoBlockBlast(instance)
    elseif gameId == "icy-tower" then
        WriteField(instance, "reviveClearTimer", math.huge)
        return self:AutoIcyTower(instance)
    elseif gameId == "tower-builder" then
        return self:AutoTowerBuilder(instance)
    end
    return false
end

function Runtime:GetStepInterval(configuredInterval: number): number
    local gameId = self:GetGameId()
    local precisionGames = {
        ["flappy-bird"] = true,
        ["helix-jump"] = true,
        ["zig-zag"] = true,
        ["highway-rider-tp"] = true,
        ["highway-rider-fp"] = true,
        ["tiny-wings"] = true,
        ["icy-tower"] = true,
        ["tower-builder"] = true,
    }
    if gameId and precisionGames[gameId] then
        return math.min(math.max(configuredInterval, 0.02), 0.03)
    end
    return math.max(configuredInterval, 0.02)
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
