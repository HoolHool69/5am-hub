--!strict

local Workspace = game:GetService("Workspace")

local Teleports = {
    Name = "Teleports",
}

local function InstanceCFrame(instance: Instance?): CFrame?
    if not instance then
        return nil
    end
    if instance:IsA("Attachment") then
        return instance.WorldCFrame
    end
    if instance:IsA("BasePart") then
        return instance.CFrame
    end
    if instance:IsA("Model") then
        return instance:GetPivot()
    end

    local part = instance:FindFirstChildWhichIsA("BasePart", true) :: BasePart?
    return if part then part.CFrame else nil
end

function Teleports.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Teleports" })
    local locationSection = tab:AddSection("Map Locations")
    local quickSection = tab:AddSection("Quick Travel")
    local connections: {RBXScriptConnection} = {}
    local locations: {[string]: Instance} = {}
    local locationNames: {string} = {}
    local dropdown: any = nil
    local destroyed = false

    local function AddLocation(label: string, instance: Instance?)
        if not instance or not InstanceCFrame(instance) then
            return
        end

        local uniqueLabel = label
        local duplicate = 2
        while locations[uniqueLabel] do
            uniqueLabel = string.format("%s (%d)", label, duplicate)
            duplicate += 1
        end
        locations[uniqueLabel] = instance
        table.insert(locationNames, uniqueLabel)
    end

    local function ScrapeLocations()
        table.clear(locations)
        table.clear(locationNames)

        AddLocation("Spawn", Workspace:FindFirstChild("SpawnLocation"))

        for _, houseName in { "House", "House2" } do
            local house = Workspace:FindFirstChild(houseName)
            local sellZone = if house then house:FindFirstChild("SellZone") else nil
            local sellArea = if sellZone then sellZone:FindFirstChild("SellArea") else nil
            AddLocation("Sell / " .. houseName, sellArea)
        end

        local trashFolder = Workspace:FindFirstChild("Trashcans")
        if trashFolder then
            local trashcans = trashFolder:GetChildren()
            table.sort(trashcans, function(left, right)
                local leftNumber = tonumber(string.match(left.Name, "%d+")) or math.huge
                local rightNumber = tonumber(string.match(right.Name, "%d+")) or math.huge
                if leftNumber == rightNumber then
                    return left.Name < right.Name
                end
                return leftNumber < rightNumber
            end)
            for _, trashcan in trashcans do
                AddLocation("Trash / " .. trashcan.Name, trashcan)
            end
        end

        local itemFolder = Workspace:FindFirstChild("ITEMS")
        if itemFolder then
            local landmarks = itemFolder:GetChildren()
            table.sort(landmarks, function(left, right)
                return left.Name < right.Name
            end)
            for _, landmark in landmarks do
                AddLocation("Landmark / " .. landmark.Name, landmark)
            end
        end

        local ignored: {[string]: boolean} = {
            Baseplate = true,
            Camera = true,
            ITEMS = true,
            SpawnLocation = true,
            Terrain = true,
            Trashcans = true,
            ["WINDOWS XP BACKROUNDS"] = true,
        }
        for _, child in Workspace:GetChildren() do
            if not ignored[child.Name] then
                AddLocation("World / " .. child.Name, child)
            end
        end

        table.sort(locationNames)
    end

    local function RefreshDropdown()
        local previous = if dropdown then dropdown:Get() else nil
        ScrapeLocations()
        if not dropdown then
            return
        end

        dropdown:SetValues(locationNames)
        if previous and locations[previous] then
            dropdown:Set(previous)
        elseif locationNames[1] then
            dropdown:Set(locationNames[1])
        end
    end

    local function TeleportTo(instance: Instance?, label: string): boolean
        local root = context.GetRoot()
        local targetCFrame = InstanceCFrame(instance)
        if not root or not targetCFrame then
            context.Notify("Teleport Failed", string.format("%s is not currently available.", label), 5)
            return false
        end

        local position = targetCFrame.Position + Vector3.new(0, 3, 0)
        root.CFrame = CFrame.new(position, position + targetCFrame.LookVector)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        return true
    end

    local function ClosestFrom(folderName: string, descendantName: string?): (Instance?, string)
        local folder = Workspace:FindFirstChild(folderName)
        local root = context.GetRoot()
        if not folder or not root then
            return nil, folderName
        end

        local closest: Instance? = nil
        local closestDistance = math.huge
        for _, candidate in folder:GetChildren() do
            local target = candidate
            if descendantName then
                target = candidate:FindFirstChild(descendantName, true) or candidate
            end
            local targetCFrame = InstanceCFrame(target)
            if targetCFrame then
                local distance = (root.Position - targetCFrame.Position).Magnitude
                if distance < closestDistance then
                    closest = target
                    closestDistance = distance
                end
            end
        end
        return closest, folderName
    end

    ScrapeLocations()
    dropdown = locationSection:AddDropdown("GarbageKingTeleportLocation", {
        Title = "Location",
        Values = locationNames,
        Default = locationNames[1],
        Searchable = true,
        Flag = "GarbageKingTeleportLocation",
    })
    locationSection:AddButton({
        Title = "Teleport to Selected",
        Callback = function()
            local selected = dropdown:Get()
            if type(selected) ~= "string" or not locations[selected] then
                context.Notify("Teleport", "Select a valid map location first.")
                return
            end
            TeleportTo(locations[selected], selected)
        end,
    })
    locationSection:AddButton({
        Title = "Refresh Locations",
        Description = "Re-scrapes Workspace, Trashcans, sell zones, and landmark items.",
        Callback = function()
            RefreshDropdown()
            context.Notify("Teleports", string.format("Found %d map locations.", #locationNames))
        end,
    })

    quickSection:AddButton({
        Title = "Nearest Trashcan",
        Callback = function()
            local target = ClosestFrom("Trashcans")
            TeleportTo(target, "nearest trashcan")
        end,
    })
    quickSection:AddButton({
        Title = "Nearest Sell Area",
        Callback = function()
            local root = context.GetRoot()
            local closest: Instance? = nil
            local closestDistance = math.huge
            for _, houseName in { "House", "House2" } do
                local house = Workspace:FindFirstChild(houseName)
                local target = if house then house:FindFirstChild("SellArea", true) else nil
                local targetCFrame = InstanceCFrame(target)
                if root and targetCFrame then
                    local distance = (root.Position - targetCFrame.Position).Magnitude
                    if distance < closestDistance then
                        closest = target
                        closestDistance = distance
                    end
                end
            end
            TeleportTo(closest, "nearest sell area")
        end,
    })
    quickSection:AddButton({
        Title = "Spawn",
        Callback = function()
            TeleportTo(Workspace:FindFirstChild("SpawnLocation"), "spawn")
        end,
    })

    local function WatchFolder(name: string)
        local folder = Workspace:FindFirstChild(name)
        if folder then
            table.insert(connections, folder.ChildAdded:Connect(function()
                if not destroyed then
                    RefreshDropdown()
                end
            end))
            table.insert(connections, folder.ChildRemoved:Connect(function()
                if not destroyed then
                    RefreshDropdown()
                end
            end))
        end
    end
    WatchFolder("Trashcans")
    WatchFolder("ITEMS")

    return function()
        destroyed = true
        for _, connection in connections do
            connection:Disconnect()
        end
        table.clear(connections)
        table.clear(locations)
        table.clear(locationNames)
        tab:Destroy()
    end
end

return Teleports
