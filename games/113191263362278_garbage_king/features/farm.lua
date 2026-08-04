--!strict

local Workspace = game:GetService("Workspace")

local Farm = {
    Name = "Farm",
}

local function ReadNumber(container: Instance?, name: string, fallback: number): number
    local valueObject = if container then container:FindFirstChild(name) else nil
    if valueObject and (valueObject:IsA("NumberValue") or valueObject:IsA("IntValue")) then
        return valueObject.Value
    end
    return fallback
end

local function PromptPosition(prompt: ProximityPrompt): Vector3?
    local parent = prompt.Parent
    if parent and parent:IsA("Attachment") then
        return parent.WorldPosition
    end
    if parent and parent:IsA("BasePart") then
        return parent.Position
    end
    local part = if parent
        then parent:FindFirstChildWhichIsA("BasePart", true) :: BasePart?
        else nil
    return if part then part.Position else nil
end

function Farm.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Farm" })
    local searchSection = tab:AddSection("Trash Search")
    local sellSection = tab:AddSection("Selling")

    local searchGeneration = 0
    local sellGeneration = 0
    local destroyed = false
    local promptConnection: RBXScriptConnection? = nil
    local promptOriginals: {[ProximityPrompt]: any} = {}
    local unavailableNotified = false

    local firePrompt = context.Environment.fireproximityprompt
        or context.Environment.fire_proximity_prompt

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function GetTrashFolder(): Instance?
        return Workspace:FindFirstChild("Trashcans")
    end

    local function GetTrashPrompts(): {ProximityPrompt}
        local prompts = {}
        local trashFolder = GetTrashFolder()
        if not trashFolder then
            return prompts
        end

        for _, descendant in trashFolder:GetDescendants() do
            if descendant:IsA("ProximityPrompt") then
                table.insert(prompts, descendant)
            end
        end
        return prompts
    end

    local function RememberPrompt(prompt: ProximityPrompt)
        if promptOriginals[prompt] then
            return
        end
        promptOriginals[prompt] = {
            HoldDuration = prompt.HoldDuration,
            MaxActivationDistance = prompt.MaxActivationDistance,
            RequiresLineOfSight = prompt.RequiresLineOfSight,
        }
    end

    local function ApplyPromptAssist(prompt: ProximityPrompt)
        RememberPrompt(prompt)
        if Flag("GarbageKingPromptAssist", false) == true then
            prompt.HoldDuration = 0
            prompt.MaxActivationDistance = tonumber(Flag("GarbageKingPromptRange", 30)) or 30
            prompt.RequiresLineOfSight = false
        end
    end

    local function RestorePrompts()
        for prompt, original in promptOriginals do
            if prompt.Parent then
                pcall(function()
                    prompt.HoldDuration = original.HoldDuration
                    prompt.MaxActivationDistance = original.MaxActivationDistance
                    prompt.RequiresLineOfSight = original.RequiresLineOfSight
                end)
            end
        end
        table.clear(promptOriginals)
    end

    local function RefreshPromptAssist()
        if Flag("GarbageKingPromptAssist", false) ~= true then
            RestorePrompts()
            return
        end
        for _, prompt in GetTrashPrompts() do
            ApplyPromptAssist(prompt)
        end
    end

    local function PromptDistance(prompt: ProximityPrompt, root: BasePart?): number
        local position = PromptPosition(prompt)
        if not position or not root then
            return math.huge
        end
        return (root.Position - position).Magnitude
    end

    local function SortedPrompts(): {ProximityPrompt}
        local root = context.GetRoot()
        local prompts = GetTrashPrompts()
        table.sort(prompts, function(left, right)
            local leftDistance = PromptDistance(left, root)
            local rightDistance = PromptDistance(right, root)
            if leftDistance == rightDistance then
                return left:GetFullName() < right:GetFullName()
            end
            return leftDistance < rightDistance
        end)
        return prompts
    end

    local function TriggerPrompt(prompt: ProximityPrompt): boolean
        if type(firePrompt) ~= "function" then
            if not unavailableNotified then
                unavailableNotified = true
                context.Notify(
                    "Trash Search Unavailable",
                    "This executor does not expose fireproximityprompt.",
                    6
                )
            end
            return false
        end

        local position = PromptPosition(prompt)
        local root = context.GetRoot()
        if Flag("GarbageKingTeleportSearch", false) == true and position and root then
            root.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
            root.AssemblyLinearVelocity = Vector3.zero
            task.wait()
        end

        local radius = tonumber(Flag("GarbageKingSearchRadius", 30)) or 30
        if Flag("GarbageKingTeleportSearch", false) ~= true
            and PromptDistance(prompt, root) > radius
        then
            return false
        end

        ApplyPromptAssist(prompt)
        local ok = pcall(firePrompt, prompt, 0)
        return ok
    end

    local function SearchNearestOnce()
        for _, prompt in SortedPrompts() do
            if prompt.Enabled and TriggerPrompt(prompt) then
                return true
            end
        end
        return false
    end

    local function StartAutoSearch()
        searchGeneration += 1
        local thisGeneration = searchGeneration
        if Flag("GarbageKingAutoSearch", false) ~= true then
            return
        end
        if type(firePrompt) ~= "function" then
            if not unavailableNotified then
                unavailableNotified = true
                context.Notify(
                    "Trash Search Unavailable",
                    "This executor does not expose fireproximityprompt.",
                    6
                )
            end
            return
        end

        task.spawn(function()
            while not destroyed
                and thisGeneration == searchGeneration
                and Flag("GarbageKingAutoSearch", false) == true
            do
                local triggered = false
                for _, prompt in SortedPrompts() do
                    if destroyed
                        or thisGeneration ~= searchGeneration
                        or Flag("GarbageKingAutoSearch", false) ~= true
                    then
                        return
                    end

                    if prompt.Parent and prompt.Enabled and TriggerPrompt(prompt) then
                        triggered = true
                        local delay = tonumber(Flag("GarbageKingSearchDelay", 0.6)) or 0.6
                        task.wait(math.max(0.05, delay))
                    end
                end

                if not triggered then
                    task.wait(0.25)
                end
            end
        end)
    end

    local function InventoryUsage(): (number, number)
        local inventory = context.GetInventory()
        if not inventory then
            return 0, ReadNumber(context.LocalPlayer, "MaxBackpack", 0)
        end

        local used = 0
        for _, item in inventory:GetChildren() do
            used += math.max(0, ReadNumber(item, "Amount", 1))
        end
        return used, ReadNumber(context.LocalPlayer, "MaxBackpack", 0)
    end

    local function Sell(mode: string, showSuccess: boolean)
        local result = context.Remotes:Fire("SellRequest", mode)
        if not result.Success then
            context.Notify("Sell Failed", result.Message, 6)
        elseif showSuccess then
            context.Notify("Garbage King", if mode == "All" then "Sell All requested." else "Sell Held requested.")
        end
    end

    local function StartAutoSell()
        sellGeneration += 1
        local thisGeneration = sellGeneration
        if Flag("GarbageKingAutoSell", false) ~= true then
            return
        end

        task.spawn(function()
            local lastSell = 0
            while not destroyed
                and thisGeneration == sellGeneration
                and Flag("GarbageKingAutoSell", false) == true
            do
                local used, maximum = InventoryUsage()
                local threshold = tonumber(Flag("GarbageKingAutoSellPercent", 100)) or 100
                local fillPercent = if maximum > 0 then (used / maximum) * 100 else 0
                if maximum > 0 and fillPercent >= threshold and os.clock() - lastSell >= 1 then
                    lastSell = os.clock()
                    Sell("All", false)
                end
                task.wait(0.25)
            end
        end)
    end

    searchSection:AddSlider("GarbageKingSearchRadius", {
        Title = "Search Radius",
        Min = 5,
        Max = 250,
        Default = 30,
        Increment = 5,
        Suffix = " studs",
        Flag = "GarbageKingSearchRadius",
    })
    searchSection:AddSlider("GarbageKingSearchDelay", {
        Title = "Search Delay",
        Min = 0.05,
        Max = 3,
        Default = 0.6,
        Increment = 0.05,
        Suffix = "s",
        Flag = "GarbageKingSearchDelay",
    })
    searchSection:AddToggle("GarbageKingTeleportSearch", {
        Title = "Teleport Between Trashcans",
        Description = "Visits every trashcan instead of limiting searches to the radius.",
        Default = false,
        Flag = "GarbageKingTeleportSearch",
    })
    searchSection:AddToggle("GarbageKingPromptAssist", {
        Title = "Instant Prompt",
        Description = "Removes hold time, line-of-sight, and extends prompt range.",
        Default = false,
        Flag = "GarbageKingPromptAssist",
        Callback = RefreshPromptAssist,
    })
    searchSection:AddSlider("GarbageKingPromptRange", {
        Title = "Prompt Range",
        Min = 10,
        Max = 250,
        Default = 30,
        Increment = 5,
        Suffix = " studs",
        Flag = "GarbageKingPromptRange",
        Callback = function()
            RefreshPromptAssist()
        end,
    })
    searchSection:AddToggle("GarbageKingAutoSearch", {
        Title = "Auto Search Trash",
        Description = "Triggers available trashcan ProximityPrompts.",
        Default = false,
        Flag = "GarbageKingAutoSearch",
        Callback = StartAutoSearch,
    })
    searchSection:AddButton({
        Title = "Search Nearest Once",
        Callback = function()
            task.spawn(function()
                if not SearchNearestOnce() then
                    context.Notify("Trash Search", "No enabled trashcan prompt is in range.")
                end
            end)
        end,
    })

    sellSection:AddSlider("GarbageKingAutoSellPercent", {
        Title = "Sell at Capacity",
        Min = 25,
        Max = 100,
        Default = 100,
        Increment = 5,
        Suffix = "%",
        Flag = "GarbageKingAutoSellPercent",
    })
    sellSection:AddToggle("GarbageKingAutoSell", {
        Title = "Auto Sell",
        Description = "Sells all items when the selected backpack fill level is reached.",
        Default = false,
        Flag = "GarbageKingAutoSell",
        Callback = StartAutoSell,
    })
    sellSection:AddButton({
        Title = "Sell All",
        Callback = function()
            Sell("All", true)
        end,
    })
    sellSection:AddButton({
        Title = "Sell Held",
        Callback = function()
            Sell("Held", true)
        end,
    })

    local trashFolder = GetTrashFolder()
    if trashFolder then
        promptConnection = trashFolder.DescendantAdded:Connect(function(descendant)
            if descendant:IsA("ProximityPrompt") then
                ApplyPromptAssist(descendant)
            end
        end)
    end

    return function()
        destroyed = true
        searchGeneration += 1
        sellGeneration += 1
        if promptConnection then
            promptConnection:Disconnect()
            promptConnection = nil
        end
        RestorePrompts()
        tab:Destroy()
    end
end

return Farm
