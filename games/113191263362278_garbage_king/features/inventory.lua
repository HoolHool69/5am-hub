--!strict

local Inventory = {
    Name = "Inventory",
}

local RARITIES = {
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary",
    "Mythic",
    "Secret",
}

local RARITY_RANK: {[string]: number} = {}
for index, rarity in RARITIES do
    RARITY_RANK[rarity] = index
end

local function ReadValue(item: Instance, name: string): any?
    local valueObject = item:FindFirstChild(name)
    if valueObject and valueObject:IsA("ValueBase") then
        return (valueObject :: any).Value
    end
    return nil
end

local function ItemValue(item: Instance): number
    return tonumber(ReadValue(item, "Value")) or 0
end

local function ItemAmount(item: Instance): number
    return math.max(0, tonumber(ReadValue(item, "Amount")) or 1)
end

local function ItemRarity(item: Instance): string
    return tostring(ReadValue(item, "Rarity") or "Common")
end

local function IsLocked(item: Instance): boolean
    return ReadValue(item, "Locked") == true
end

function Inventory.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Inventory" })
    local equipSection = tab:AddSection("Equipment")
    local lockSection = tab:AddSection("Item Protection")
    local statsSection = tab:AddSection("Backpack")

    local destroyed = false
    local inventoryConnection: RBXScriptConnection? = nil
    local playerConnection: RBXScriptConnection? = nil
    local pendingLocks: {[string]: boolean} = {}

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function NotifyFailure(action: string, result: any)
        if not result.Success then
            context.Notify(action .. " Failed", result.Message, 6)
        end
    end

    local function LockItem(item: Instance)
        if destroyed or IsLocked(item) or pendingLocks[item.Name] then
            return
        end

        pendingLocks[item.Name] = true
        local result = context.Remotes:Fire("LockItem", item.Name)
        NotifyFailure("Lock Item", result)
        task.delay(0.75, function()
            pendingLocks[item.Name] = nil
        end)
    end

    local function ShouldAutoLock(item: Instance): boolean
        if Flag("GarbageKingAutoLock", false) ~= true or IsLocked(item) then
            return false
        end
        local minimumRarity = tostring(Flag("GarbageKingAutoLockRarity", "Rare"))
        local itemRank = RARITY_RANK[ItemRarity(item)] or 1
        local minimumRank = RARITY_RANK[minimumRarity] or 3
        return itemRank >= minimumRank
    end

    local function EvaluateAutoLock(item: Instance)
        task.spawn(function()
            item:WaitForChild("Rarity", 3)
            item:WaitForChild("Locked", 3)
            if item.Parent and ShouldAutoLock(item) then
                LockItem(item)
            end
        end)
    end

    local function ScanAutoLock()
        local inventory = context.GetInventory()
        if not inventory then
            return
        end
        for _, item in inventory:GetChildren() do
            if ShouldAutoLock(item) then
                LockItem(item)
            end
        end
    end

    local function BindInventory()
        if inventoryConnection then
            inventoryConnection:Disconnect()
            inventoryConnection = nil
        end

        local inventory = context.GetInventory()
        if not inventory then
            return
        end
        inventoryConnection = inventory.ChildAdded:Connect(EvaluateAutoLock)
        ScanAutoLock()
    end

    local function BestItem(): Instance?
        local inventory = context.GetInventory()
        if not inventory then
            return nil
        end

        local best: Instance? = nil
        local bestValue = -math.huge
        for _, item in inventory:GetChildren() do
            local value = ItemValue(item)
            if value > bestValue then
                best = item
                bestValue = value
            end
        end
        return best
    end

    local function EquipBest()
        local best = BestItem()
        if not best then
            context.Notify("Inventory", "No inventory item is available to equip.")
            return
        end

        local result = context.Remotes:Fire("EquipItem", best.Name)
        if result.Success then
            context.Notify(
                "Garbage King",
                string.format("Equipped %s (value %s).", best.Name, tostring(ItemValue(best)))
            )
        else
            NotifyFailure("Equip Item", result)
        end
    end

    local function LockValuableItems()
        local inventory = context.GetInventory()
        if not inventory then
            context.Notify("Inventory", "The replicated Inventory folder is not available.")
            return
        end

        local minimumValue = tonumber(Flag("GarbageKingLockMinimumValue", 1000)) or 1000
        local count = 0
        for _, item in inventory:GetChildren() do
            if not IsLocked(item) and ItemValue(item) >= minimumValue then
                count += 1
                LockItem(item)
            end
        end
        context.Notify("Garbage King", string.format("Requested locks for %d item(s).", count))
    end

    local function ShowStats()
        local inventory = context.GetInventory()
        if not inventory then
            context.Notify("Inventory", "The replicated Inventory folder is not available.")
            return
        end

        local stacks = 0
        local items = 0
        local totalValue = 0
        local locked = 0
        local best = BestItem()
        for _, item in inventory:GetChildren() do
            local amount = ItemAmount(item)
            stacks += 1
            items += amount
            totalValue += ItemValue(item) * amount
            if IsLocked(item) then
                locked += 1
            end
        end

        local bestName = if best then best.Name else "none"
        context.Notify(
            "Backpack Summary",
            string.format(
                "%d item(s) in %d stack(s) | total value %s | %d locked | best: %s",
                items,
                stacks,
                tostring(totalValue),
                locked,
                bestName
            ),
            7
        )
    end

    equipSection:AddButton({
        Title = "Equip Most Valuable",
        Description = "Equips the inventory entry with the highest observed Value.",
        Callback = EquipBest,
    })

    lockSection:AddDropdown("GarbageKingAutoLockRarity", {
        Title = "Minimum Rarity",
        Values = RARITIES,
        Default = "Rare",
        Flag = "GarbageKingAutoLockRarity",
        Callback = function()
            ScanAutoLock()
        end,
    })
    lockSection:AddToggle("GarbageKingAutoLock", {
        Title = "Auto Lock Rare Items",
        Description = "Locks new inventory entries at or above the selected rarity.",
        Default = false,
        Flag = "GarbageKingAutoLock",
        Callback = function(enabled: boolean)
            if enabled then
                ScanAutoLock()
            end
        end,
    })
    lockSection:AddSlider("GarbageKingLockMinimumValue", {
        Title = "Minimum Value",
        Min = 0,
        Max = 100000,
        Default = 1000,
        Increment = 100,
        Flag = "GarbageKingLockMinimumValue",
    })
    lockSection:AddButton({
        Title = "Lock Valuable Items",
        Description = "Locks every unlocked stack meeting the minimum value.",
        Callback = LockValuableItems,
    })

    statsSection:AddButton({
        Title = "Show Backpack Summary",
        Callback = ShowStats,
    })

    BindInventory()
    playerConnection = context.LocalPlayer.ChildAdded:Connect(function(child)
        if child.Name == "Inventory" then
            BindInventory()
        end
    end)

    return function()
        destroyed = true
        if inventoryConnection then
            inventoryConnection:Disconnect()
            inventoryConnection = nil
        end
        if playerConnection then
            playerConnection:Disconnect()
            playerConnection = nil
        end
        table.clear(pendingLocks)
        tab:Destroy()
    end
end

return Inventory
