--!strict

local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local Runtime = {}
Runtime.__index = Runtime

local FRUIT_NAMES = {
    "Cherry",
    "Strawberry",
    "Grapes",
    "Orange",
    "Tomato",
    "Apple",
    "Cantaloupe",
    "Peach",
    "Pineapple",
    "Wintermelon",
    "Watermelon",
}
local FRUIT_POINTS = { 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66 }
local FRUIT_LEVELS: {[string]: number} = {}
for level, fruitName in FRUIT_NAMES do
    FRUIT_LEVELS[string.lower(fruitName)] = level
end

Runtime.FruitNames = FRUIT_NAMES
Runtime.FruitPoints = FRUIT_POINTS

local function Result(success: boolean, code: string, message: string, value: any?): any
    return {
        Success = success,
        Code = code,
        Message = message,
        Value = value,
    }
end

local function AsPart(instance: Instance?): BasePart?
    if not instance then
        return nil
    end
    if instance:IsA("BasePart") then
        return instance
    end
    if instance:IsA("Model") and instance.PrimaryPart then
        return instance.PrimaryPart
    end
    return instance:FindFirstChildWhichIsA("BasePart", true) :: BasePart?
end

local function NormalizeFruitName(value: any): (string?, number?)
    if type(value) == "number" then
        local level = math.floor(value)
        return FRUIT_NAMES[level], if FRUIT_NAMES[level] then level else nil
    end
    if type(value) ~= "string" then
        return nil, nil
    end

    local level = FRUIT_LEVELS[string.lower(value)]
    if level then
        return FRUIT_NAMES[level], level
    end
    local numericLevel = tonumber(value)
    if numericLevel then
        level = math.floor(numericLevel)
        return FRUIT_NAMES[level], if FRUIT_NAMES[level] then level else nil
    end
    return nil, nil
end

local function FruitIdentity(instance: Instance): (string?, number?)
    for _, attributeName in { "Fruit", "FruitType", "FruitName", "Type", "Level" } do
        local fruitName, level = NormalizeFruitName(instance:GetAttribute(attributeName))
        if fruitName then
            return fruitName, level
        end
    end

    local fruitName, level = NormalizeFruitName(instance.Name)
    if fruitName then
        return fruitName, level
    end
    for _, descendant in instance:GetDescendants() do
        for _, attributeName in { "Fruit", "FruitType", "FruitName", "Type", "Level" } do
            fruitName, level = NormalizeFruitName(descendant:GetAttribute(attributeName))
            if fruitName then
                return fruitName, level
            end
        end
    end
    return nil, nil
end

local function IsLeveling(instance: Instance, part: BasePart): boolean
    return instance:GetAttribute("LevelUp") == true or part:GetAttribute("LevelUp") == true
end

function Runtime.new(context: any): any
    local constraintFolder = Instance.new("Folder")
    constraintFolder.Name = "FiveAMWatermelonPhysics"
    constraintFolder.Parent = Workspace

    return setmetatable({
        Context = context,
        Destroyed = false,
        ConstraintFolder = constraintFolder,
        PhaseRecords = {},
        PhaseLookup = setmetatable({}, { __mode = "k" }),
        OriginalPhysics = setmetatable({}, { __mode = "k" }),
        OriginalTop = setmetatable({}, { __mode = "k" }),
        CooldownTables = setmetatable({}, { __mode = "k" }),
    }, Runtime)
end

function Runtime:GetPlayspaces(): Instance?
    return Workspace:FindFirstChild("Playspaces")
end

function Runtime:GetPlayspace(): Instance?
    local playspaces = self:GetPlayspaces()
    if not playspaces then
        return nil
    end

    local duelId = self.Context.LocalPlayer:GetAttribute("DuelUniqueId")
    local duelSpace = playspaces:FindFirstChild("Duels")
    if duelSpace and duelId ~= nil and tostring(duelId) ~= "" then
        return duelSpace
    end
    return playspaces:FindFirstChild("SinglePlayer") or duelSpace
end

function Runtime:GetBoxParts(playspace: Instance?): Instance?
    local current = playspace or self:GetPlayspace()
    return if current then current:FindFirstChild("LocalBoxParts") else nil
end

function Runtime:GetDropper(playspace: Instance?): BasePart?
    local boxParts = self:GetBoxParts(playspace)
    return AsPart(if boxParts then boxParts:FindFirstChild("Dropper") else nil)
end

function Runtime:GetTopPart(): BasePart?
    local boxParts = self:GetBoxParts(nil)
    return AsPart(if boxParts then boxParts:FindFirstChild("Top") else nil)
end

function Runtime:GetActiveFolder(): Instance?
    local playspace = self:GetPlayspace()
    return if playspace then playspace:FindFirstChild("ActiveFruits") else nil
end

function Runtime:GetGeometry(): any
    local playspace = self:GetPlayspace()
    local boxParts = self:GetBoxParts(playspace)
    local leftMarker = AsPart(if playspace then playspace:FindFirstChild("FarthestLeft") else nil)
    local rightMarker = AsPart(if playspace then playspace:FindFirstChild("FarthestRight") else nil)
    local leftWall = AsPart(if boxParts then boxParts:FindFirstChild("LeftWall") else nil)
    local rightWall = AsPart(if boxParts then boxParts:FindFirstChild("RightWall") else nil)
    local base = AsPart(if boxParts then boxParts:FindFirstChild("Base") else nil)
    local top = AsPart(if boxParts then boxParts:FindFirstChild("Top") else nil)

    local leftPosition = if leftMarker
        then leftMarker.Position
        elseif leftWall then leftWall.Position
        else Vector3.new(-10, 0, 0)
    local rightPosition = if rightMarker
        then rightMarker.Position
        elseif rightWall then rightWall.Position
        else Vector3.new(10, 0, 0)
    local planarDelta = Vector3.new(
        rightPosition.X - leftPosition.X,
        0,
        rightPosition.Z - leftPosition.Z
    )
    if planarDelta.Magnitude < 0.1 then
        planarDelta = Vector3.new(20, 0, 0)
    end

    local baseY = if base then base.Position.Y + base.Size.Y * 0.5 else 0
    local topY = if top then top.Position.Y else baseY + 20
    if topY <= baseY + 1 then
        topY = baseY + 20
    end
    return {
        Origin = leftPosition,
        Horizontal = planarDelta.Unit,
        Width = planarDelta.Magnitude,
        BaseY = baseY,
        TopY = topY,
        Base = base,
        Top = top,
    }
end

function Runtime:Coordinate(position: Vector3, geometry: any?): number
    local board = geometry or self:GetGeometry()
    local planarOffset = Vector3.new(
        position.X - board.Origin.X,
        0,
        position.Z - board.Origin.Z
    )
    return planarOffset:Dot(board.Horizontal)
end

function Runtime:ClampCoordinate(coordinate: number, margin: number?): number
    local geometry = self:GetGeometry()
    local padding = math.max(0, margin or 0.35)
    if geometry.Width <= padding * 2 then
        return geometry.Width * 0.5
    end
    return math.clamp(coordinate, padding, geometry.Width - padding)
end

function Runtime:PositionAt(original: Vector3, coordinate: number, y: number?): Vector3
    local geometry = self:GetGeometry()
    local currentCoordinate = self:Coordinate(original, geometry)
    local shifted = original + geometry.Horizontal * (coordinate - currentCoordinate)
    if y then
        shifted += Vector3.new(0, y - shifted.Y, 0)
    end
    return shifted
end

function Runtime:GetActiveFruits(includeLeveling: boolean?): {any}
    local folder = self:GetActiveFolder()
    local fruits = {}
    if not folder then
        return fruits
    end

    for _, child in folder:GetChildren() do
        local part = AsPart(child)
        local fruitName, level = FruitIdentity(child)
        if part
            and fruitName
            and level
            and (includeLeveling == true or not IsLeveling(child, part))
        then
            table.insert(fruits, {
                Instance = child,
                Part = part,
                Name = fruitName,
                Level = level,
                Points = FRUIT_POINTS[level] or 0,
            })
        end
    end
    return fruits
end

function Runtime:GetCurrentFruitName(): (string?, number?)
    local dropper = self:GetDropper(nil)
    if not dropper then
        return nil, nil
    end

    for _, attributeName in { "CurrentFruit", "Fruit", "FruitType", "FruitName", "NextFruit" } do
        local fruitName, level = NormalizeFruitName(dropper:GetAttribute(attributeName))
        if fruitName then
            return fruitName, level
        end
    end

    local surfaceGui = dropper:FindFirstChildWhichIsA("SurfaceGui")
    local currentFruit = if surfaceGui then surfaceGui:FindFirstChild("CurrentFruit", true) else nil
    if currentFruit then
        for _, child in currentFruit:GetChildren() do
            if child:IsA("GuiObject") and child.Visible then
                local imageVisible = not child:IsA("ImageLabel") or child.ImageTransparency < 0.95
                if imageVisible then
                    local fruitName, level = NormalizeFruitName(child.Name)
                    if fruitName then
                        return fruitName, level
                    end
                end
            end
        end
    end
    return nil, nil
end

function Runtime:TierLane(level: number): number
    local geometry = self:GetGeometry()
    local laneCount = 5
    local lane = (math.max(1, level) - 1) % laneCount
    local alpha = lane / (laneCount - 1)
    return self:ClampCoordinate(geometry.Width * alpha, 0.6)
end

function Runtime:LowestColumn(): number
    local geometry = self:GetGeometry()
    local fruits = self:GetActiveFruits()
    local samples = 11
    local bestCoordinate = geometry.Width * 0.5
    local bestHeight = math.huge

    for index = 0, samples - 1 do
        local coordinate = geometry.Width * index / (samples - 1)
        local columnHeight = geometry.BaseY
        for _, fruit in fruits do
            local fruitCoordinate = self:Coordinate(fruit.Part.Position, geometry)
            local radius = math.max(fruit.Part.Size.X, fruit.Part.Size.Z) * 0.75
            if math.abs(fruitCoordinate - coordinate) <= radius then
                columnHeight = math.max(
                    columnHeight,
                    fruit.Part.Position.Y + fruit.Part.Size.Y * 0.5
                )
            end
        end
        if columnHeight < bestHeight then
            bestHeight = columnHeight
            bestCoordinate = coordinate
        end
    end
    return self:ClampCoordinate(bestCoordinate, 0.6)
end

function Runtime:MatchingCoordinate(fruitName: string): number?
    local geometry = self:GetGeometry()
    local candidates = {}
    for _, fruit in self:GetActiveFruits() do
        if fruit.Name == fruitName then
            table.insert(candidates, fruit)
        end
    end
    table.sort(candidates, function(left, right)
        return left.Part.Position.Y > right.Part.Position.Y
    end)
    local target = candidates[1]
    if not target then
        return nil
    end
    return self:ClampCoordinate(
        self:Coordinate(target.Part.Position, geometry),
        math.max(target.Part.Size.X, target.Part.Size.Z) * 0.4
    )
end

function Runtime:ChooseDropCoordinate(strategy: string): (number, string?)
    local fruitName, level = self:GetCurrentFruitName()
    local geometry = self:GetGeometry()
    if strategy == "Center" then
        return geometry.Width * 0.5, fruitName
    end
    if strategy == "Lowest Column" then
        return self:LowestColumn(), fruitName
    end
    if strategy == "Tier Lane" then
        return self:TierLane(level or 1), fruitName
    end
    if fruitName then
        local matching = self:MatchingCoordinate(fruitName)
        if matching then
            return matching, fruitName
        end
    end
    return self:LowestColumn(), fruitName
end

function Runtime:FindDropButton(): GuiButton?
    local playerGui = self.Context.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if not playerGui then
        return nil
    end
    for _, descendant in playerGui:GetDescendants() do
        if descendant:IsA("GuiButton") and descendant.Name == "DropButton" then
            return descendant
        end
    end
    return nil
end

function Runtime:MovePointerForDrop(worldPosition: Vector3): (() -> ())?
    local camera = Workspace.CurrentCamera
    if not camera then
        return nil
    end
    local viewportPoint, onScreen = camera:WorldToViewportPoint(worldPosition)
    if not onScreen then
        return nil
    end

    local oldMousePosition = UserInputService:GetMouseLocation()
    local oldMouseIconEnabled = UserInputService.MouseIconEnabled
    local x = math.floor(viewportPoint.X + 0.5)
    local y = math.floor(oldMousePosition.Y + 0.5)
    local moveMouse = self.Context.Environment.mousemoveabs
        or self.Context.Environment.mouse_move_abs
    if type(moveMouse) == "function" then
        local moved = pcall(moveMouse, x, y)
        if moved then
            return function()
                pcall(moveMouse, oldMousePosition.X, oldMousePosition.Y)
                pcall(function()
                    UserInputService.MouseIconEnabled = oldMouseIconEnabled
                end)
            end
        end
    end

    local serviceOk, virtualInput = pcall(game.GetService, game, "VirtualInputManager")
    if serviceOk and virtualInput then
        local inputManager: any = virtualInput
        local moved = pcall(function()
            inputManager:SendMouseMoveEvent(x, y, game)
        end)
        if moved then
            return function()
                pcall(function()
                    inputManager:SendMouseMoveEvent(
                        math.floor(oldMousePosition.X + 0.5),
                        math.floor(oldMousePosition.Y + 0.5),
                        game
                    )
                    UserInputService.MouseIconEnabled = oldMouseIconEnabled
                end)
            end
        end
    end
    return nil
end

function Runtime:PatchCooldownTable(candidate: any, allowGenericGate: boolean?): number
    if type(candidate) ~= "table" then
        return 0
    end

    local tableLooksDropRelated = allowGenericGate == true
    if not tableLooksDropRelated then
        for key in candidate do
            if type(key) == "string"
                and string.find(string.lower(key), "drop", 1, true) ~= nil
            then
                tableLooksDropRelated = true
                break
            end
        end
    end
    if not tableLooksDropRelated then
        return 0
    end

    local patched = 0
    for key, value in candidate do
        if type(key) ~= "string" then
            continue
        end
        local normalized = string.lower(key):gsub("[^a-z]", "")
        local mentionsDrop = string.find(normalized, "drop", 1, true) ~= nil
        local mentionsGate = string.find(normalized, "cooldown", 1, true) ~= nil
            or string.find(normalized, "debounce", 1, true) ~= nil
            or string.find(normalized, "candrop", 1, true) ~= nil
            or string.find(normalized, "dropping", 1, true) ~= nil
            or string.find(normalized, "dropdelay", 1, true) ~= nil
            or string.find(normalized, "dropwait", 1, true) ~= nil
            or string.find(normalized, "lastdrop", 1, true) ~= nil
            or string.find(normalized, "nextdrop", 1, true) ~= nil
        if not mentionsGate
            and not (mentionsDrop and string.find(normalized, "ready", 1, true))
        then
            continue
        end

        if type(value) == "boolean" then
            local allowDrop = string.find(normalized, "candrop", 1, true) ~= nil
                or string.find(normalized, "ready", 1, true) ~= nil
                or string.find(normalized, "enabled", 1, true) ~= nil
            candidate[key] = allowDrop
            patched += 1
        elseif type(value) == "number" then
            candidate[key] = if string.find(normalized, "last", 1, true)
                then -1000000000
                else 0
            patched += 1
        end
    end
    return patched
end

function Runtime:PatchCooldownFunction(callback: any): number
    if type(callback) ~= "function" then
        return 0
    end

    local environment = self.Context.Environment
    local debugLibrary = environment.debug or debug
    local getUpvalue = environment.getupvalue
        or environment.debug_getupvalue
        or (if type(debugLibrary) == "table" then debugLibrary.getupvalue else nil)
    local setUpvalue = environment.setupvalue
        or environment.debug_setupvalue
        or (if type(debugLibrary) == "table" then debugLibrary.setupvalue else nil)
    local patched = 0

    local getUpvalues = environment.getupvalues
        or environment.debug_getupvalues
        or (if type(debugLibrary) == "table" then debugLibrary.getupvalues else nil)
    if type(getUpvalues) == "function" then
        local valuesOk, values = pcall(getUpvalues, callback)
        if valuesOk and type(values) == "table" then
            for _, value in values do
                if type(value) == "table" then
                    patched += self:PatchCooldownTable(value, true)
                    self.CooldownTables[value] = true
                end
            end
        end
    end

    if type(getUpvalue) == "function" then
        for index = 1, 32 do
            local ok, name, value = pcall(getUpvalue, callback, index)
            if not ok or name == nil then
                break
            end
            if type(value) == "table" then
                patched += self:PatchCooldownTable(value, true)
                self.CooldownTables[value] = true
            end

            if type(name) ~= "string" or type(setUpvalue) ~= "function" then
                continue
            end
            local normalized = string.lower(name):gsub("[^a-z]", "")
            local relevant = string.find(normalized, "drop", 1, true) ~= nil
                and (
                    string.find(normalized, "cooldown", 1, true) ~= nil
                    or string.find(normalized, "debounce", 1, true) ~= nil
                    or string.find(normalized, "delay", 1, true) ~= nil
                    or string.find(normalized, "last", 1, true) ~= nil
                    or string.find(normalized, "next", 1, true) ~= nil
                    or string.find(normalized, "ready", 1, true) ~= nil
                    or string.find(normalized, "can", 1, true) ~= nil
                    or string.find(normalized, "dropping", 1, true) ~= nil
                )
            if relevant and type(value) == "boolean" then
                local allowDrop = string.find(normalized, "can", 1, true) ~= nil
                    or string.find(normalized, "ready", 1, true) ~= nil
                if pcall(setUpvalue, callback, index, allowDrop) then
                    patched += 1
                end
            elseif relevant and type(value) == "number" then
                local replacement = if string.find(normalized, "last", 1, true)
                    then -1000000000
                    else 0
                if pcall(setUpvalue, callback, index, replacement) then
                    patched += 1
                end
            end
        end
    end
    return patched
end

function Runtime:ResetDropCooldown(): number
    local button = self:FindDropButton()
    local patched = 0
    if button then
        pcall(function()
            button.Active = true
            local anyButton: any = button
            anyButton.Interactable = true
        end)

        local getConnections = self.Context.Environment.getconnections
            or self.Context.Environment.get_connections
        if type(getConnections) == "function" then
            for _, signal in { button.Activated, button.MouseButton1Click, button.MouseButton1Down } do
                local ok, connections = pcall(getConnections, signal)
                if ok and type(connections) == "table" then
                    for _, connection in connections do
                        local callback = nil
                        pcall(function()
                            callback = connection.Function
                        end)
                        patched += self:PatchCooldownFunction(callback)
                    end
                end
            end
        end
    end

    for controller in self.CooldownTables do
        patched += self:PatchCooldownTable(controller, true)
    end
    return patched
end

function Runtime:ActivateDropButton(button: GuiButton): (boolean, string)
    local fireSignal = self.Context.Environment.firesignal
        or self.Context.Environment.fire_signal
    if type(fireSignal) == "function" then
        local activated = pcall(fireSignal, button.Activated)
        if activated then
            return true, "firesignal"
        end
        activated = pcall(fireSignal, button.MouseButton1Click)
        if activated then
            return true, "firesignal"
        end
    end

    local getConnections = self.Context.Environment.getconnections
        or self.Context.Environment.get_connections
    if type(getConnections) == "function" then
        local ok, connections = pcall(getConnections, button.Activated)
        if ok and type(connections) == "table" then
            for _, connection in connections do
                local callback = nil
                pcall(function()
                    callback = connection.Function or connection.Fire
                end)
                if type(callback) == "function" then
                    local called = pcall(callback)
                    if called then
                        return true, "connection"
                    end
                end
            end
        end
    end

    local activated = pcall(function()
        local anyButton: any = button
        anyButton:Activate()
    end)
    if activated then
        return true, "activate"
    end
    return false, "The executor could not activate the game's DropButton."
end

function Runtime:TriggerDrop(
    strategy: string,
    jitterPercent: number?,
    movePointer: boolean?,
    removeCooldown: boolean?
): any
    local dropper = self:GetDropper(nil)
    local button = self:FindDropButton()
    if not dropper then
        return Result(false, "NO_DROPPER", "The active dropper was not found.", nil)
    end
    if not button then
        return Result(false, "NO_DROP_BUTTON", "The live HUD DropButton was not found.", nil)
    end

    if removeCooldown == true then
        self:ResetDropCooldown()
    end

    local coordinate, fruitName = self:ChooseDropCoordinate(strategy)
    local geometry = self:GetGeometry()
    local jitter = math.max(0, jitterPercent or 0)
    if jitter > 0 then
        coordinate += (math.random() * 2 - 1) * geometry.Width * jitter / 100
    end
    coordinate = self:ClampCoordinate(coordinate, 0.5)
    local targetPosition = self:PositionAt(dropper.Position, coordinate, dropper.Position.Y)

    pcall(function()
        dropper.CFrame = CFrame.new(targetPosition) * dropper.CFrame.Rotation
        dropper.AssemblyLinearVelocity = Vector3.zero
        dropper.AssemblyAngularVelocity = Vector3.zero
    end)

    local restorePointer = if movePointer == false
        then nil
        else self:MovePointerForDrop(targetPosition)
    task.wait()
    local activated, method = self:ActivateDropButton(button)
    if removeCooldown == true then
        self:ResetDropCooldown()
    end
    task.wait()
    if restorePointer then
        restorePointer()
    end
    if not activated then
        return Result(false, "DROP_CONTROLLER_FAILED", method, nil)
    end
    return Result(
        true,
        "OK",
        string.format("Activated the live DropButton through %s.", method),
        fruitName
    )
end

function Runtime:IsPileMoving(maximumSpeed: number): boolean
    for _, fruit in self:GetActiveFruits() do
        if fruit.Part.AssemblyLinearVelocity.Magnitude > maximumSpeed
            or fruit.Part.AssemblyAngularVelocity.Magnitude > maximumSpeed * 2
        then
            return true
        end
    end
    return false
end

function Runtime:ClaimPhysicsAuthority(): boolean
    local claimed = false
    local setSimulationRadius = self.Context.Environment.setsimulationradius
        or self.Context.Environment.set_simulation_radius
    if type(setSimulationRadius) == "function" then
        claimed = pcall(setSimulationRadius, math.huge, math.huge) or claimed
    end

    local setHiddenProperty = self.Context.Environment.sethiddenproperty
        or self.Context.Environment.set_hidden_property
    if type(setHiddenProperty) == "function" then
        claimed = pcall(
            setHiddenProperty,
            self.Context.LocalPlayer,
            "SimulationRadius",
            math.huge
        ) or claimed
        pcall(
            setHiddenProperty,
            self.Context.LocalPlayer,
            "MaximumSimulationRadius",
            math.huge
        )
    end
    return claimed
end

function Runtime:IsNetworkOwner(part: BasePart): boolean?
    local isNetworkOwner = self.Context.Environment.isnetworkowner
        or self.Context.Environment.is_network_owner
    if type(isNetworkOwner) ~= "function" then
        return nil
    end
    local ok, ownsPart = pcall(isNetworkOwner, part)
    return if ok then ownsPart == true else nil
end

function Runtime:SetTopPassThrough(enabled: boolean): boolean
    local top = self:GetTopPart()
    if top and not self.OriginalTop[top] then
        self.OriginalTop[top] = {
            CanCollide = top.CanCollide,
            CanTouch = top.CanTouch,
            CanQuery = top.CanQuery,
        }
    end

    if enabled and top then
        pcall(function()
            top.CanCollide = false
            top.CanTouch = false
            top.CanQuery = false
        end)
    elseif not enabled then
        for part, original in self.OriginalTop do
            if part.Parent then
                pcall(function()
                    part.CanCollide = original.CanCollide
                    part.CanTouch = original.CanTouch
                    part.CanQuery = original.CanQuery
                end)
            end
        end
        table.clear(self.OriginalTop)
    end
    return top ~= nil
end

function Runtime:ClearPhaseConstraints()
    for _, record in self.PhaseRecords do
        record.Constraint:Destroy()
    end
    table.clear(self.PhaseRecords)
    table.clear(self.PhaseLookup)
end

function Runtime:HasPhaseConstraint(first: BasePart, second: BasePart): boolean
    local firstLookup = self.PhaseLookup[first]
    return firstLookup ~= nil and firstLookup[second] ~= nil
end

function Runtime:AddPhaseConstraint(first: BasePart, second: BasePart): boolean
    if first == second or self:HasPhaseConstraint(first, second) then
        return false
    end
    local constraint = Instance.new("NoCollisionConstraint")
    constraint.Name = "FiveAMTierPhase"
    constraint.Part0 = first
    constraint.Part1 = second
    constraint.Parent = self.ConstraintFolder

    self.PhaseLookup[first] = self.PhaseLookup[first] or setmetatable({}, { __mode = "k" })
    self.PhaseLookup[second] = self.PhaseLookup[second] or setmetatable({}, { __mode = "k" })
    self.PhaseLookup[first][second] = constraint
    self.PhaseLookup[second][first] = constraint
    table.insert(self.PhaseRecords, {
        First = first,
        Second = second,
        Constraint = constraint,
    })
    return true
end

function Runtime:UpdateTierPhasing(enabled: boolean, maximumConstraints: number?): number
    if not enabled then
        self:ClearPhaseConstraints()
        return 0
    end

    local fruits = self:GetActiveFruits(true)
    local activeLevels: {[BasePart]: number} = {}
    for _, fruit in fruits do
        activeLevels[fruit.Part] = fruit.Level
    end

    for index = #self.PhaseRecords, 1, -1 do
        local record = self.PhaseRecords[index]
        local firstLevel = activeLevels[record.First]
        local secondLevel = activeLevels[record.Second]
        if not record.First.Parent
            or not record.Second.Parent
            or not firstLevel
            or not secondLevel
            or firstLevel == secondLevel
        then
            local firstLookup = self.PhaseLookup[record.First]
            local secondLookup = self.PhaseLookup[record.Second]
            if firstLookup then
                firstLookup[record.Second] = nil
            end
            if secondLookup then
                secondLookup[record.First] = nil
            end
            record.Constraint:Destroy()
            table.remove(self.PhaseRecords, index)
        end
    end

    local limit = math.max(1, maximumConstraints or 10000)
    for firstIndex = 1, #fruits - 1 do
        local first = fruits[firstIndex]
        for secondIndex = firstIndex + 1, #fruits do
            if #self.PhaseRecords >= limit then
                return #self.PhaseRecords
            end
            local second = fruits[secondIndex]
            if first.Level == second.Level
                or self:HasPhaseConstraint(first.Part, second.Part)
            then
                continue
            end
            self:AddPhaseConstraint(first.Part, second.Part)
        end
    end
    return #self.PhaseRecords
end

function Runtime:PrimePhaseInstance(instance: Instance)
    local part = AsPart(instance)
    if not part then
        task.defer(function()
            if not self.Destroyed and instance.Parent then
                self:PrimePhaseInstance(instance)
            end
        end)
        return
    end

    local originalCanCollide = part.CanCollide
    pcall(function()
        part.CanCollide = false
    end)
    task.spawn(function()
        for _ = 1, 6 do
            if self.Destroyed or not instance.Parent then
                return
            end
            self:UpdateTierPhasing(true)
            local fruitName = FruitIdentity(instance)
            if fruitName then
                break
            end
            task.wait()
        end
        if part.Parent then
            pcall(function()
                part.CanCollide = originalCanCollide
            end)
        end
    end)
end

function Runtime:SetLowBounce(enabled: boolean)
    local activeParts: {[BasePart]: boolean} = {}
    if enabled then
        for _, fruit in self:GetActiveFruits() do
            local part = fruit.Part
            activeParts[part] = true
            if not self.OriginalPhysics[part] then
                self.OriginalPhysics[part] = {
                    CustomPhysicalProperties = part.CustomPhysicalProperties,
                }
            end
            pcall(function()
                part.CustomPhysicalProperties = PhysicalProperties.new(3, 0.85, 0, 100, 100)
                part.AssemblyAngularVelocity = Vector3.zero
            end)
        end
    end

    if not enabled then
        for part, original in self.OriginalPhysics do
            if part.Parent then
                pcall(function()
                    part.CustomPhysicalProperties = original.CustomPhysicalProperties
                end)
            end
        end
        table.clear(self.OriginalPhysics)
    else
        for part in self.OriginalPhysics do
            if not part.Parent or not activeParts[part] then
                self.OriginalPhysics[part] = nil
            end
        end
    end
end

function Runtime:ApplyDownforce(force: number)
    local downwardSpeed = math.max(0, force)
    for _, fruit in self:GetActiveFruits() do
        pcall(function()
            local velocity = fruit.Part.AssemblyLinearVelocity
            fruit.Part.AssemblyLinearVelocity = Vector3.new(
                velocity.X,
                math.min(velocity.Y, -downwardSpeed),
                velocity.Z
            )
        end)
    end
end

function Runtime:Magnetize(dt: number, strength: number, snap: boolean)
    local grouped: {[number]: {any}} = {}
    for _, fruit in self:GetActiveFruits() do
        if fruit.Level < #FRUIT_NAMES then
            grouped[fruit.Level] = grouped[fruit.Level] or {}
            table.insert(grouped[fruit.Level], fruit)
        end
    end

    for _, group in grouped do
        local used: {[BasePart]: boolean} = {}
        for _, first in group do
            if used[first.Part] then
                continue
            end
            local closest = nil
            local closestDistance = math.huge
            for _, candidate in group do
                if candidate.Part == first.Part or used[candidate.Part] then
                    continue
                end
                local delta = Vector3.new(
                    candidate.Part.Position.X - first.Part.Position.X,
                    0,
                    candidate.Part.Position.Z - first.Part.Position.Z
                )
                if delta.Magnitude < closestDistance then
                    closest = candidate
                    closestDistance = delta.Magnitude
                end
            end
            if not closest then
                continue
            end

            used[first.Part] = true
            used[closest.Part] = true
            local delta = Vector3.new(
                closest.Part.Position.X - first.Part.Position.X,
                0,
                closest.Part.Position.Z - first.Part.Position.Z
            )
            if delta.Magnitude < 0.001 then
                continue
            end

            local direction = delta.Unit
            local speed = math.min(math.max(0, strength), delta.Magnitude * strength)
            pcall(function()
                first.Part.AssemblyLinearVelocity = first.Part.AssemblyLinearVelocity
                    + direction * speed
                closest.Part.AssemblyLinearVelocity = closest.Part.AssemblyLinearVelocity
                    - direction * speed
            end)

            if snap then
                local firstRadius = math.max(first.Part.Size.X, first.Part.Size.Z) * 0.45
                local secondRadius = math.max(closest.Part.Size.X, closest.Part.Size.Z) * 0.45
                local contactDistance = firstRadius + secondRadius
                if delta.Magnitude > contactDistance then
                    local step = math.min(
                        (delta.Magnitude - contactDistance) * 0.5,
                        math.max(0, strength) * dt * 0.12
                    )
                    pcall(function()
                        first.Part.CFrame = first.Part.CFrame + direction * step
                        closest.Part.CFrame = closest.Part.CFrame - direction * step
                    end)
                end
            end
        end
    end
end

function Runtime:RecoverOverflow(margin: number): number
    local geometry = self:GetGeometry()
    local ceiling = geometry.TopY - math.max(0, margin)
    local recovered = 0
    for _, fruit in self:GetActiveFruits() do
        if fruit.Part.Position.Y + fruit.Part.Size.Y * 0.35 < ceiling then
            continue
        end

        local coordinate = self:TierLane(fruit.Level)
        local offsetDirection = if recovered % 2 == 0 then -1 else 1
        coordinate = self:ClampCoordinate(coordinate + offsetDirection * 0.15, 0.5)
        local safeY = geometry.BaseY + fruit.Part.Size.Y * 0.5 + 0.2
        local target = self:PositionAt(fruit.Part.Position, coordinate, safeY)
        pcall(function()
            fruit.Part.CFrame = CFrame.new(target) * fruit.Part.CFrame.Rotation
            fruit.Part.AssemblyLinearVelocity = Vector3.new(0, -8, 0)
            fruit.Part.AssemblyAngularVelocity = Vector3.zero
        end)
        recovered += 1
    end
    return recovered
end

function Runtime:CompactAll(): number
    local geometry = self:GetGeometry()
    local grouped: {[number]: {any}} = {}
    for _, fruit in self:GetActiveFruits() do
        grouped[fruit.Level] = grouped[fruit.Level] or {}
        table.insert(grouped[fruit.Level], fruit)
    end

    local moved = 0
    for level, group in grouped do
        local lane = self:TierLane(level)
        for index, fruit in group do
            local side = if index % 2 == 0 then 1 else -1
            local pairRow = math.floor((index - 1) / 2)
            local radius = math.max(fruit.Part.Size.X, fruit.Part.Size.Z) * 0.16
            local coordinate = self:ClampCoordinate(lane + side * radius, 0.5)
            local targetY = geometry.BaseY
                + fruit.Part.Size.Y * 0.5
                + pairRow * 0.08
            local target = self:PositionAt(fruit.Part.Position, coordinate, targetY)
            pcall(function()
                fruit.Part.CFrame = CFrame.new(target) * fruit.Part.CFrame.Rotation
                fruit.Part.AssemblyLinearVelocity = Vector3.zero
                fruit.Part.AssemblyAngularVelocity = Vector3.zero
            end)
            moved += 1
        end
    end
    return moved
end

function Runtime:GetBoardFillPercent(): number
    local geometry = self:GetGeometry()
    local highest = geometry.BaseY
    for _, fruit in self:GetActiveFruits() do
        highest = math.max(highest, fruit.Part.Position.Y + fruit.Part.Size.Y * 0.5)
    end
    return math.max(0, (highest - geometry.BaseY) / (geometry.TopY - geometry.BaseY) * 100)
end

function Runtime:GetRunSummary(): string
    local fruits = self:GetActiveFruits()
    local currentFruit = self:GetCurrentFruitName()
    local highestLevel = 0
    local boardPoints = 0
    local owned = 0
    local ownershipKnown = 0
    for _, fruit in fruits do
        highestLevel = math.max(highestLevel, fruit.Level)
        boardPoints += fruit.Points
        local ownsPart = self:IsNetworkOwner(fruit.Part)
        if ownsPart ~= nil then
            ownershipKnown += 1
            if ownsPart then
                owned += 1
            end
        end
    end

    local highestName = if highestLevel > 0 then FRUIT_NAMES[highestLevel] else "None"
    local ownership = if ownershipKnown > 0
        then string.format("%d/%d owned", owned, ownershipKnown)
        else "ownership API unavailable"
    return string.format(
        "Next: %s | Active: %d | Largest: %s | Fill: %.0f%% | %s | Board value: %d",
        currentFruit or "Unknown",
        #fruits,
        highestName,
        self:GetBoardFillPercent(),
        ownership,
        boardPoints
    )
end

function Runtime:Destroy()
    self.Destroyed = true
    self:ClearPhaseConstraints()
    self:SetTopPassThrough(false)
    self:SetLowBounce(false)
    if self.ConstraintFolder then
        self.ConstraintFolder:Destroy()
    end
end

return Runtime
