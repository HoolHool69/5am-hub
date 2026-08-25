--!strict

local Workspace = game:GetService("Workspace")

local Visuals = {
    Name = "Visuals",
}

local LEVEL_COLORS = {
    Color3.fromRGB(244, 63, 94),
    Color3.fromRGB(251, 113, 133),
    Color3.fromRGB(168, 85, 247),
    Color3.fromRGB(249, 115, 22),
    Color3.fromRGB(239, 68, 68),
    Color3.fromRGB(132, 204, 22),
    Color3.fromRGB(250, 204, 21),
    Color3.fromRGB(251, 146, 60),
    Color3.fromRGB(234, 179, 8),
    Color3.fromRGB(34, 197, 94),
    Color3.fromRGB(22, 163, 74),
}

function Visuals.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Fruit ESP" })
    local espSection = tab:AddSection("Active Fruit ESP")
    local labelSection = tab:AddSection("Label Details")

    local destroyed = false
    local records: {[BasePart]: any} = {}

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function RemoveRecord(part: BasePart)
        local record = records[part]
        if not record then
            return
        end
        record.Highlight:Destroy()
        record.Billboard:Destroy()
        records[part] = nil
    end

    local function ClearRecords()
        local parts = {}
        for part in records do
            table.insert(parts, part)
        end
        for _, part in parts do
            RemoveRecord(part)
        end
    end

    local function AddRecord(fruit: any)
        local part = fruit.Part
        if records[part] then
            return records[part]
        end

        local color = LEVEL_COLORS[fruit.Level] or Color3.fromRGB(139, 92, 246)
        local highlight = Instance.new("Highlight")
        highlight.Name = "FiveAMWatermelonFruitESP"
        highlight.Adornee = fruit.Instance
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = color
        highlight.FillTransparency = 0.82
        highlight.OutlineColor = color
        highlight.OutlineTransparency = 0
        highlight.Parent = Workspace

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "FiveAMWatermelonFruitLabel"
        billboard.Adornee = part
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        billboard.Size = UDim2.fromOffset(150, 42)
        billboard.StudsOffset = Vector3.new(0, part.Size.Y * 0.65 + 0.4, 0)
        billboard.Parent = context.UI.RootGui or Workspace

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamSemibold
        label.Size = UDim2.fromScale(1, 1)
        label.TextColor3 = color
        label.TextSize = 13
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextStrokeTransparency = 0.15
        label.TextWrapped = true
        label.Parent = billboard

        local record = {
            Highlight = highlight,
            Billboard = billboard,
            Label = label,
            Name = fruit.Name,
            Level = fruit.Level,
            Points = fruit.Points,
        }
        records[part] = record
        return record
    end

    local function Refresh()
        if Flag("WatermelonGoFruitESP", false) ~= true then
            ClearRecords()
            return
        end

        local activeParts: {[BasePart]: boolean} = {}
        local showNames = Flag("WatermelonGoEspNames", true) ~= false
        local showLevels = Flag("WatermelonGoEspLevels", true) ~= false
        local showPoints = Flag("WatermelonGoEspPoints", false) == true

        for _, fruit in context.Runtime:GetActiveFruits() do
            local part = fruit.Part
            activeParts[part] = true
            local record = AddRecord(fruit)
            local lines = {}
            if showNames then
                table.insert(lines, fruit.Name)
            end
            if showLevels then
                table.insert(lines, string.format("Tier %d", fruit.Level))
            end
            if showPoints then
                table.insert(lines, string.format("%d merge points", fruit.Points))
            end
            record.Label.Text = table.concat(lines, " | ")
            record.Billboard.Enabled = #lines > 0
            record.Billboard.StudsOffset = Vector3.new(0, part.Size.Y * 0.65 + 0.4, 0)
        end

        local staleParts = {}
        for part in records do
            if not part.Parent or not activeParts[part] then
                table.insert(staleParts, part)
            end
        end
        for _, part in staleParts do
            RemoveRecord(part)
        end
    end

    espSection:AddToggle("WatermelonGoFruitESP", {
        Title = "Fruit ESP",
        Description = "Highlights every replicated fruit in the active solo or duel board.",
        Default = false,
        Flag = "WatermelonGoFruitESP",
        Callback = Refresh,
    })
    labelSection:AddToggle("WatermelonGoEspNames", {
        Title = "Fruit Names",
        Default = true,
        Flag = "WatermelonGoEspNames",
    })
    labelSection:AddToggle("WatermelonGoEspLevels", {
        Title = "Tier Numbers",
        Default = true,
        Flag = "WatermelonGoEspLevels",
    })
    labelSection:AddToggle("WatermelonGoEspPoints", {
        Title = "Merge Points",
        Default = false,
        Flag = "WatermelonGoEspPoints",
    })

    task.spawn(function()
        while not destroyed do
            Refresh()
            task.wait(0.2)
        end
    end)

    return function()
        destroyed = true
        ClearRecords()
        tab:Destroy()
    end
end

return Visuals
