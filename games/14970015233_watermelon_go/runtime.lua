--!strict

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
        local fruitName = FRUIT_NAMES[math.floor(value)]
        return fruitName, if fruitName then math.floor(value) else nil
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
        local fruitName = FRUIT_NAMES[math.floor(numericLevel)]
        return fruitName, if fruitName then math.floor(numericLevel) else nil
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

function Runtime.new(context: any): any
    return setmetatable({
        Context = context,
        Destroyed = false,
        MergeCooldowns = setmetatable({}, { __mode = "k" }),
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

    local singlePlayer = playspaces:FindFirstChild("SinglePlayer")
    if singlePlayer then
        return singlePlayer
    end
    return duelSpace
end

function Runtime:GetBoxParts(playspace: Instance?): Instance?
    local current = playspace or self:GetPlayspace()
    return if current then current:FindFirstChild("LocalBoxParts") else nil
end

function Runtime:GetDropper(playspace: Instance?): BasePart?
    local boxParts = self:GetBoxParts(playspace)
    return AsPart(if boxParts then boxParts:FindFirstChild("Dropper") else nil)
end

function Runtime:GetActiveFolder(playspace: Instance?): Instance?
    local current = playspace or self:GetPlayspace()
    return if current then current:FindFirstChild("ActiveFruits") else nil
end

function Runtime:GetBounds(playspace: Instance?): (number, number, number, number)
    local current = playspace or self:GetPlayspace()
    local boxParts = self:GetBoxParts(current)
    local leftMarker = AsPart(if current then current:FindFirstChild("FarthestLeft") else nil)
    local rightMarker = AsPart(if current then current:FindFirstChild("FarthestRight") else nil)
    local leftWall = AsPart(if boxParts then boxParts:FindFirstChild("LeftWall") else nil)
    local rightWall = AsPart(if boxParts then boxParts:FindFirstChild("RightWall") else nil)
    local base = AsPart(if boxParts then boxParts:FindFirstChild("Base") else nil)
    local top = AsPart(if boxParts then boxParts:FindFirstChild("Top") else nil)

    local leftX = if leftMarker
        then leftMarker.Position.X
        elseif leftWall then leftWall.Position.X + leftWall.Size.X * 0.5
        else -10
    local rightX = if rightMarker
        then rightMarker.Position.X
        elseif rightWall then rightWall.Position.X - rightWall.Size.X * 0.5
        else 10
    if leftX > rightX then
        leftX, rightX = rightX, leftX
    end

    local baseY = if base then base.Position.Y + base.Size.Y * 0.5 else 0
    local topY = if top then top.Position.Y else baseY + 20
    if topY < baseY then
        topY = baseY + 20
    end
    return leftX, rightX, baseY, topY
end

function Runtime:GetActiveFruits(): {any}
    local folder = self:GetActiveFolder(nil)
    local fruits = {}
    if not folder then
        return fruits
    end

    for _, child in folder:GetChildren() do
        local part = AsPart(child)
        local fruitName, level = FruitIdentity(child)
        if part and fruitName and level and child:GetAttribute("LevelUp") ~= true then
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

function Runtime:ClampX(x: number, margin: number?): number
    local leftX, rightX = self:GetBounds(nil)
    local padding = math.max(0, margin or 0.35)
    if rightX - leftX <= padding * 2 then
        return (leftX + rightX) * 0.5
    end
    return math.clamp(x, leftX + padding, rightX - padding)
end

function Runtime:TierLaneX(level: number): number
    local leftX, rightX = self:GetBounds(nil)
    local laneCount = 5
    local lane = (math.max(1, level) - 1) % laneCount
    local alpha = if laneCount > 1 then lane / (laneCount - 1) else 0.5
    return self:ClampX(leftX + (rightX - leftX) * alpha, 0.5)
end

function Runtime:LowestColumnX(): number
    local leftX, rightX, baseY = self:GetBounds(nil)
    local fruits = self:GetActiveFruits()
    local bestX = (leftX + rightX) * 0.5
    local bestHeight = math.huge
    local samples = 9

    for index = 0, samples - 1 do
        local alpha = index / (samples - 1)
        local x = leftX + (rightX - leftX) * alpha
        local columnHeight = baseY
        for _, fruit in fruits do
            local radius = math.max(fruit.Part.Size.X, fruit.Part.Size.Z) * 0.7
            if math.abs(fruit.Part.Position.X - x) <= radius then
                columnHeight = math.max(
                    columnHeight,
                    fruit.Part.Position.Y + fruit.Part.Size.Y * 0.5
                )
            end
        end
        if columnHeight < bestHeight then
            bestHeight = columnHeight
            bestX = x
        end
    end
    return self:ClampX(bestX, 0.5)
end

function Runtime:MatchingFruitX(fruitName: string): number?
    local candidates = {}
    for _, fruit in self:GetActiveFruits() do
        if fruit.Name == fruitName then
            table.insert(candidates, fruit)
        end
    end
    table.sort(candidates, function(left, right)
        if left.Part.Position.Y == right.Part.Position.Y then
            return left.Part.Position.X < right.Part.Position.X
        end
        return left.Part.Position.Y > right.Part.Position.Y
    end)
    local target = candidates[1]
    return if target then self:ClampX(target.Part.Position.X, target.Part.Size.X * 0.45) else nil
end

function Runtime:ChooseDropX(strategy: string): (number, string?)
    local fruitName, level = self:GetCurrentFruitName()
    local leftX, rightX = self:GetBounds(nil)
    local centerX = (leftX + rightX) * 0.5

    if strategy == "Center Stack" then
        return self:ClampX(centerX, 0.5), fruitName
    end
    if strategy == "Lowest Column" then
        return self:LowestColumnX(), fruitName
    end
    if strategy == "Tier Lanes" then
        return self:TierLaneX(level or 1), fruitName
    end

    if fruitName then
        local matchingX = self:MatchingFruitX(fruitName)
        if matchingX then
            return matchingX, fruitName
        end
    end
    return self:LowestColumnX(), fruitName
end

function Runtime:DropUsingInput(position: Vector3): any
    local camera = Workspace.CurrentCamera
    if not camera then
        return Result(false, "NO_CAMERA", "The current Roblox camera is unavailable.", nil)
    end

    local viewportPoint, onScreen = camera:WorldToViewportPoint(position)
    if not onScreen then
        return Result(false, "DROPPER_OFFSCREEN", "The active dropper is outside the camera view.", nil)
    end

    local x = math.floor(viewportPoint.X + 0.5)
    local y = math.floor(viewportPoint.Y + 0.5)
    local moveMouse = self.Context.Environment.mousemoveabs
        or self.Context.Environment.mouse_move_abs
    local clickMouse = self.Context.Environment.mouse1click
        or self.Context.Environment.mouse1_click
    if type(moveMouse) == "function" and type(clickMouse) == "function" then
        local ok, errorMessage = pcall(function()
            moveMouse(x, y)
            task.wait()
            clickMouse()
        end)
        if ok then
            return Result(true, "OK", "Dropped through the game's input controller.", nil)
        end
        return Result(false, "INPUT_FAILED", tostring(errorMessage), nil)
    end

    local serviceOk, virtualInput = pcall(game.GetService, game, "VirtualInputManager")
    if serviceOk and virtualInput then
        local inputManager: any = virtualInput
        local inputOk, inputError = pcall(function()
            inputManager:SendMouseMoveEvent(x, y, game)
            task.wait()
            inputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
            task.wait()
            inputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)
        end)
        if inputOk then
            return Result(true, "OK", "Dropped through the game's input controller.", nil)
        end
        return Result(false, "INPUT_FAILED", tostring(inputError), nil)
    end

    return Result(
        false,
        "INPUT_UNAVAILABLE",
        "This executor exposes neither absolute mouse input nor VirtualInputManager.",
        nil
    )
end

function Runtime:DropOnce(strategy: string, jitterPercent: number?, method: string?): any
    local dropper = self:GetDropper(nil)
    if not dropper then
        return Result(false, "NO_DROPPER", "The active Watermelon Go dropper was not found.", nil)
    end

    local x, fruitName = self:ChooseDropX(strategy)
    local leftX, rightX = self:GetBounds(nil)
    local jitter = math.max(0, jitterPercent or 0)
    if jitter > 0 then
        x += (math.random() * 2 - 1) * (rightX - leftX) * (jitter / 100)
    end
    x = self:ClampX(x, 0.45)

    local position = Vector3.new(x, dropper.Position.Y, dropper.Position.Z)
    pcall(function()
        dropper.CFrame = CFrame.new(position) * dropper.CFrame.Rotation
        dropper.AssemblyLinearVelocity = Vector3.zero
        dropper.AssemblyAngularVelocity = Vector3.zero
    end)

    local result = if method == "Game Input"
        then self:DropUsingInput(position)
        else self.Context.Remotes:DropFruit(position)
    if not result.Success and method == "Game Input" then
        result = self.Context.Remotes:DropFruit(position)
        if result.Success then
            result.Message = "Input was unavailable; used the adaptive drop remote instead."
        end
    end
    result.Value = result.Value or fruitName
    return result
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

function Runtime:CanMove(part: BasePart): boolean
    local isNetworkOwner = self.Context.Environment.isnetworkowner
    if type(isNetworkOwner) ~= "function" then
        return true
    end
    local ok, ownsPart = pcall(isNetworkOwner, part)
    return not ok or ownsPart == true
end

function Runtime:AlignPair(first: any, second: any)
    if not self:CanMove(first.Part) or not self:CanMove(second.Part) then
        return
    end

    local leftX, rightX, baseY = self:GetBounds(nil)
    local midpoint = (first.Part.Position + second.Part.Position) * 0.5
    local radius = math.min(first.Part.Size.X, second.Part.Size.X) * 0.22
    local centerX = math.clamp(midpoint.X, leftX + radius + 0.1, rightX - radius - 0.1)
    local centerY = math.max(
        baseY + math.max(first.Part.Size.Y, second.Part.Size.Y) * 0.5 + 0.1,
        math.min(first.Part.Position.Y, second.Part.Position.Y)
    )
    local centerZ = midpoint.Z

    pcall(function()
        first.Part.CFrame = CFrame.new(centerX - radius, centerY, centerZ)
            * first.Part.CFrame.Rotation
        second.Part.CFrame = CFrame.new(centerX + radius, centerY, centerZ)
            * second.Part.CFrame.Rotation
        first.Part.AssemblyLinearVelocity = Vector3.zero
        second.Part.AssemblyLinearVelocity = Vector3.zero
        first.Part.AssemblyAngularVelocity = Vector3.zero
        second.Part.AssemblyAngularVelocity = Vector3.zero
    end)
end

function Runtime:FindMergePairs(): {any}
    local grouped: {[number]: {any}} = {}
    for _, fruit in self:GetActiveFruits() do
        if fruit.Level < #FRUIT_NAMES then
            grouped[fruit.Level] = grouped[fruit.Level] or {}
            table.insert(grouped[fruit.Level], fruit)
        end
    end

    local pairs = {}
    for level = #FRUIT_NAMES - 1, 1, -1 do
        local group = grouped[level]
        if group then
            table.sort(group, function(left, right)
                return left.Part.Position.Y < right.Part.Position.Y
            end)
            for index = 1, #group - 1, 2 do
                table.insert(pairs, {
                    First = group[index],
                    Second = group[index + 1],
                    Level = level,
                })
            end
        end
    end
    return pairs
end

function Runtime:MergeSweep(maximumPairs: number, aggressive: boolean): (number, any?)
    local merged = 0
    local lastResult = nil
    local now = os.clock()

    for _, pair in self:FindMergePairs() do
        if merged >= maximumPairs then
            break
        end
        local firstPart = pair.First.Part
        local secondPart = pair.Second.Part
        local firstCooldown = self.MergeCooldowns[firstPart] or 0
        local secondCooldown = self.MergeCooldowns[secondPart] or 0
        if now - firstCooldown < 0.35 or now - secondCooldown < 0.35 then
            continue
        end

        if aggressive then
            self:AlignPair(pair.First, pair.Second)
        elseif (firstPart.Position - secondPart.Position).Magnitude
            > math.max(firstPart.Size.X, secondPart.Size.X) * 1.25
        then
            continue
        end

        lastResult = self.Context.Remotes:MergeFruits(firstPart, secondPart)
        if lastResult.Success then
            self.MergeCooldowns[firstPart] = now
            self.MergeCooldowns[secondPart] = now
            merged += 1
        end
    end
    return merged, lastResult
end

function Runtime:Stabilize(strength: number, downwardForce: number)
    local leftX, rightX = self:GetBounds(nil)
    local pullAlpha = math.clamp(strength / 100, 0, 1)
    for _, fruit in self:GetActiveFruits() do
        if not self:CanMove(fruit.Part) then
            continue
        end
        local laneX = self:TierLaneX(fruit.Level)
        local currentVelocity = fruit.Part.AssemblyLinearVelocity
        local targetXVelocity = math.clamp((laneX - fruit.Part.Position.X) * pullAlpha * 8, -20, 20)
        if fruit.Part.Position.X < leftX or fruit.Part.Position.X > rightX then
            targetXVelocity = (self:ClampX(fruit.Part.Position.X) - fruit.Part.Position.X) * 12
        end
        pcall(function()
            fruit.Part.AssemblyAngularVelocity = Vector3.zero
            fruit.Part.AssemblyLinearVelocity = Vector3.new(
                targetXVelocity,
                math.min(currentVelocity.Y, -math.max(0, downwardForce)),
                currentVelocity.Z * (1 - pullAlpha)
            )
        end)
    end
end

function Runtime:RecoverOverflow(margin: number): number
    local leftX, rightX, baseY, topY = self:GetBounds(nil)
    local recovered = 0
    local ceiling = topY - math.max(0, margin)

    for _, fruit in self:GetActiveFruits() do
        if fruit.Part.Position.Y + fruit.Part.Size.Y * 0.5 < ceiling
            or not self:CanMove(fruit.Part)
        then
            continue
        end

        local laneX = math.clamp(
            self:TierLaneX(fruit.Level),
            leftX + fruit.Part.Size.X * 0.5,
            rightX - fruit.Part.Size.X * 0.5
        )
        local targetY = baseY + fruit.Part.Size.Y * 0.5 + 0.15 + (recovered % 3) * 0.2
        pcall(function()
            fruit.Part.CFrame = CFrame.new(laneX, targetY, fruit.Part.Position.Z)
                * fruit.Part.CFrame.Rotation
            fruit.Part.AssemblyLinearVelocity = Vector3.new(0, -5, 0)
            fruit.Part.AssemblyAngularVelocity = Vector3.zero
        end)
        recovered += 1
    end
    return recovered
end

function Runtime:GetRunSummary(): string
    local fruits = self:GetActiveFruits()
    local currentFruit = self:GetCurrentFruitName()
    local highestLevel = 0
    local estimatedBoardPoints = 0
    for _, fruit in fruits do
        highestLevel = math.max(highestLevel, fruit.Level)
        estimatedBoardPoints += fruit.Points
    end

    local highestName = if highestLevel > 0 then FRUIT_NAMES[highestLevel] else "None"
    return string.format(
        "Next: %s | Active: %d | Largest: %s | Board value: %d",
        currentFruit or "Unknown",
        #fruits,
        highestName,
        estimatedBoardPoints
    )
end

function Runtime:Destroy()
    self.Destroyed = true
    table.clear(self.MergeCooldowns)
end

return Runtime
