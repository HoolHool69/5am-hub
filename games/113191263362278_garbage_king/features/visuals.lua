--!strict

local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Visuals = {
    Name = "Visuals",
}

local COLORS: {[string]: Color3} = {
    Trash = Color3.fromRGB(139, 92, 246),
    Item = Color3.fromRGB(251, 191, 36),
    Sell = Color3.fromRGB(52, 211, 153),
}

local function AnchorPart(target: Instance): BasePart?
    if target:IsA("BasePart") then
        return target
    end
    if target:IsA("Model") and target.PrimaryPart then
        return target.PrimaryPart
    end
    return target:FindFirstChildWhichIsA("BasePart", true) :: BasePart?
end

function Visuals.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Visuals" })
    local targetSection = tab:AddSection("World ESP")
    local detailSection = tab:AddSection("Labels")

    local destroyed = false
    local records: {[Instance]: any} = {}
    local connections: {RBXScriptConnection} = {}
    local renderConnection: RBXScriptConnection? = nil

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function RemoveRecord(target: Instance)
        local record = records[target]
        if not record then
            return
        end
        record.Highlight:Destroy()
        record.Billboard:Destroy()
        records[target] = nil
    end

    local function AddRecord(target: Instance, kind: string)
        if records[target] then
            return
        end

        local anchor = AnchorPart(target)
        if not anchor then
            return
        end
        local color = COLORS[kind] or COLORS.Trash

        local highlight = Instance.new("Highlight")
        highlight.Name = "FiveAMGarbageKing" .. kind .. "ESP"
        highlight.Adornee = if target:IsA("Model") or target:IsA("BasePart") then target else anchor
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillColor = color
        highlight.FillTransparency = 0.82
        highlight.OutlineColor = color
        highlight.OutlineTransparency = 0
        highlight.Parent = Workspace

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "FiveAMGarbageKingESPLabel"
        billboard.Adornee = anchor
        billboard.AlwaysOnTop = true
        billboard.LightInfluence = 0
        billboard.Size = UDim2.fromOffset(180, 42)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Parent = context.UI.RootGui or Workspace

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamSemibold
        label.Size = UDim2.fromScale(1, 1)
        label.TextColor3 = color
        label.TextSize = 13
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextStrokeTransparency = 0.2
        label.TextWrapped = true
        label.Parent = billboard

        records[target] = {
            Target = target,
            Anchor = anchor,
            Kind = kind,
            Highlight = highlight,
            Billboard = billboard,
            Label = label,
        }
    end

    local function AddFolderChildren(folderName: string, kind: string)
        local folder = Workspace:FindFirstChild(folderName)
        if not folder then
            return
        end
        for _, child in folder:GetChildren() do
            AddRecord(child, kind)
        end
    end

    local function AddSellAreas()
        for _, houseName in { "House", "House2" } do
            local house = Workspace:FindFirstChild(houseName)
            local sellArea = if house then house:FindFirstChild("SellArea", true) else nil
            if sellArea then
                AddRecord(sellArea, "Sell")
            end
        end
    end

    local function StopEsp()
        if renderConnection then
            renderConnection:Disconnect()
            renderConnection = nil
        end

        local targets = {}
        for target in records do
            table.insert(targets, target)
        end
        for _, target in targets do
            RemoveRecord(target)
        end
    end

    local function UpdateEsp()
        local root = context.GetRoot()
        local showName = Flag("GarbageKingEspName", true) ~= false
        local showDistance = Flag("GarbageKingEspDistance", true) ~= false
        local removeTargets = {}

        for target, record in records do
            if not target.Parent or not record.Anchor.Parent then
                table.insert(removeTargets, target)
                continue
            end

            local lines = {}
            if showName then
                local prefix = if record.Kind == "Trash"
                    then "Trash"
                    elseif record.Kind == "Sell" then "Sell"
                    else "Item"
                table.insert(lines, string.format("%s: %s", prefix, target.Name))
            end
            if showDistance and root then
                local distance = math.floor((root.Position - record.Anchor.Position).Magnitude + 0.5)
                table.insert(lines, string.format("%d studs", distance))
            end
            record.Label.Text = table.concat(lines, "\n")
            record.Billboard.Enabled = #lines > 0
        end

        for _, target in removeTargets do
            RemoveRecord(target)
        end
    end

    local function RebuildEsp()
        StopEsp()
        if destroyed then
            return
        end

        if Flag("GarbageKingTrashEsp", false) == true then
            AddFolderChildren("Trashcans", "Trash")
        end
        if Flag("GarbageKingItemEsp", false) == true then
            AddFolderChildren("ITEMS", "Item")
        end
        if Flag("GarbageKingSellEsp", false) == true then
            AddSellAreas()
        end

        if next(records) then
            renderConnection = RunService.RenderStepped:Connect(UpdateEsp)
        end
    end

    targetSection:AddToggle("GarbageKingTrashEsp", {
        Title = "Trashcan ESP",
        Description = "Highlights all 20 observed trash-search locations.",
        Default = false,
        Flag = "GarbageKingTrashEsp",
        Callback = RebuildEsp,
    })
    targetSection:AddToggle("GarbageKingItemEsp", {
        Title = "Item Landmark ESP",
        Description = "Highlights entries under Workspace.ITEMS.",
        Default = false,
        Flag = "GarbageKingItemEsp",
        Callback = RebuildEsp,
    })
    targetSection:AddToggle("GarbageKingSellEsp", {
        Title = "Sell Area ESP",
        Description = "Highlights both observed sell zones.",
        Default = false,
        Flag = "GarbageKingSellEsp",
        Callback = RebuildEsp,
    })

    detailSection:AddToggle("GarbageKingEspName", {
        Title = "Names",
        Default = true,
        Flag = "GarbageKingEspName",
    })
    detailSection:AddToggle("GarbageKingEspDistance", {
        Title = "Distance",
        Default = true,
        Flag = "GarbageKingEspDistance",
    })

    local function WatchFolder(name: string)
        local folder = Workspace:FindFirstChild(name)
        if not folder then
            return
        end
        table.insert(connections, folder.ChildAdded:Connect(function()
            if not destroyed then
                RebuildEsp()
            end
        end))
        table.insert(connections, folder.ChildRemoved:Connect(function()
            if not destroyed then
                RebuildEsp()
            end
        end))
    end
    WatchFolder("Trashcans")
    WatchFolder("ITEMS")

    return function()
        destroyed = true
        StopEsp()
        for _, connection in connections do
            connection:Disconnect()
        end
        table.clear(connections)
        tab:Destroy()
    end
end

return Visuals
