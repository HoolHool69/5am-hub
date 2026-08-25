-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local SharedCosmeticData_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("SharedModules"):WaitForChild("SharedCosmeticData"))
tbl_upv_1.DefaultWeight = 50
tbl_upv_1.DefaultPresentation = "Generic"
tbl_upv_1.RefusalMessages = {NotEnoughCoins = "Not enough coins", PolicyRestricted = "Paid random items are not available on your account"}
tbl_upv_1.PurchaseOptions = table.freeze({Single = table.freeze({GiftProductField = "GiftProductId", Quantity = 1, Key = "Single", ProductField = "ProductId", WrapperNames = table.freeze({"Purchase_Robux"})}), Bundle = table.freeze({Quantity = 3, Key = "Bundle", ProductField = "BundleProductId", WrapperNames = table.freeze({"Purchase_Robux_x3", "Purchase_Robux_3x"})})})
tbl_upv_1.PurchaseOptionOrder = table.freeze({"Single", "Bundle"})
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
function tbl_upv_1.GetChest(a1)
    --[[
      name: GetChest
      line: 245
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return tbl_upv_2[a1]
    end
    return nil
end
function tbl_upv_1.GetChestIds()
    --[[
      name: GetChestIds
      line: 255
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local tbl_5 = {}
    for key_1 in tbl_upv_2 do
        table.insert(tbl_5, key_1)
    end
    table.sort(tbl_5)
    return tbl_5
end
function tbl_upv_1.GetChestForCard(a1, a2)
    --[[
      name: GetChestForCard
      line: 273
      upvalues:
        tbl_upv_3 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v1 = tbl_upv_3[a1]
    local v2 = v1 and (v1[a2])
    if v2 then
        return v2, tbl_upv_2[v2]
    end
    return nil, nil
end
function tbl_upv_1.GetPurchaseOption(a1, a2)
    --[[
      name: GetPurchaseOption
      line: 290
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = tbl_upv_1.GetChest(a1)
    local v4 = tbl_upv_1.PurchaseOptions[a2]
    if v3 and v4 then
        local num_1 = tonumber(v3[v4.ProductField])
        if not num_1 then
            return nil
        end
        local tbl_6 = {GiftProductId = 0}
        tbl_6.Key = v4.Key
        tbl_6.WrapperNames = v4.WrapperNames
        tbl_6.Quantity = v4.Quantity
        tbl_6.ProductId = num_1
        tbl_6.GiftProductId = v4.GiftProductField and tonumber(v3[v4.GiftProductField]) or nil
        return tbl_6
    end
    return nil
end
function tbl_upv_1.GetPurchaseOptions(a1)
    --[[
      name: GetPurchaseOptions
      line: 314
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local tbl_7 = {}
    for _, value_1 in tbl_upv_1.PurchaseOptionOrder do
        local v6 = tbl_upv_1.GetPurchaseOption(a1, value_1)
        if v6 then
            table.insert(tbl_7, v6)
        end
    end
    return tbl_7
end
function tbl_upv_1.GetChestForProductId(a1)
    --[[
      name: GetChestForProductId
      line: 338
      upvalues:
        tbl_upv_4 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v7 = tbl_upv_4[tonumber(a1)]
    if v7 then
        return v7.ChestId, tbl_upv_1.GetPurchaseOption(v7.ChestId, v7.OptionKey)
    end
    return nil, nil
end
function tbl_upv_1.GetSectionChests(a1)
    --[[
      name: GetSectionChests
      line: 354
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local tbl_8 = {}
    for _, value_2 in tbl_upv_1.GetChestIds() do
        local v8 = tbl_upv_2[value_2]
        if v8.Section == a1 then
            local v9 = table.clone(v8)
            v9.ChestId = value_2
            table.insert(tbl_8, v9)
        end
    end
    return tbl_8
end
function tbl_upv_1.GetPoolIds(a1)
    --[[
      name: GetPoolIds
      line: 382
      upvalues:
        tbl_upv_1 (copy, index: 1)
        SharedCosmeticData_upv_1 (copy, index: 2)
    ]]
    local v10 = tbl_upv_1.GetChest(a1)
    if v10 then
        if not v10.Pool then
            return SharedCosmeticData_upv_1.GetSlotItemIds(v10.Slot)
        end
        local tbl_9 = {}
        for _, value_3 in v10.Pool do
            if (tonumber(value_3.Weight) or 50) > 0 then
                table.insert(tbl_9, value_3.ItemId)
            end
        end
        table.sort(tbl_9)
        return tbl_9
    end
    warn(string.format("[SharedShopChestData] GetPoolIds: unknown chest '%s'", tostring(a1)))
    return {}
end
function tbl_upv_1.GetPoolChances(a1)
    --[[
      name: GetPoolChances
      line: 420
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v11 = tbl_upv_1.GetChest(a1)
    if v11 then
        local tbl_10 = {}
        local v12 = 0
        for _, value_4 in tbl_upv_1.GetPoolIds(a1) do
            local v13 = GetItemWeight(v11, value_4)
            if v13 > 0 then
                v12 = v12 + v13
                table.insert(tbl_10, {Percent = 0, ItemId = value_4, Weight = v13})
            end
        end
        if v12 > 0 then
            for _, value_5 in tbl_10 do
                value_5.Percent = (value_5.Weight / v12) * 100
            end
            table.sort(
                tbl_10,
                function(a2, a3)
                    --[[
                      line: 450
                    ]]
                    if a2.Weight == a3.Weight then
                        return a2.ItemId < a3.ItemId
                    end
                    return a3.Weight < a2.Weight
                end
            )
            return tbl_10
        end
    else
        warn(string.format("[SharedShopChestData] GetPoolChances: unknown chest '%s'", tostring(a1)))
    end
    return {}
end
function tbl_upv_1.RollReward(a1, a2)
    --[[
      name: RollReward
      line: 469
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v14 = tbl_upv_1.GetChest(a1)
    if v14 then
        local tbl_11 = {}
        local v15 = 0
        for _, value_6 in tbl_upv_1.GetPoolIds(a1) do
            if not (a2) or not (a2(value_6)) then
                local v16 = GetItemWeight(v14, value_6)
                if v16 > 0 then
                    v15 = v15 + v16
                    table.insert(tbl_11, {ItemId = value_6, Weight = v16})
                end
            end
        end
        if v15 <= 0 then
            return nil
        end
        local v17 = Random.new():NextNumber(0, v15)
        local v19 = 0
        for _, value_7 in tbl_11 do
            local v20 = v19 + value_7.Weight
            if v17 > v20 then
                v19 = v20
                continue
            end
            return value_7.ItemId
        end
        return tbl_11[#tbl_11].ItemId
    end
    warn(string.format("[SharedShopChestData] RollReward: unknown chest '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.IsPurchasable(a1)
    --[[
      name: IsPurchasable
      line: 519
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v21 = tbl_upv_1.GetChest(a1)
    if v21 then
        if v21.Unavailable then
            return false, "This chest is not for sale yet"
        elseif not (v21.CoinPrice) and #tbl_upv_1.GetPurchaseOptions(a1) == 0 then
            return false, "This chest has no price"
        else
            return true, nil
        end
    end
    return false, "Unknown chest"
end
function tbl_upv_1.GetExhaustedCoins(a1)
    --[[
      name: GetExhaustedCoins
      line: 543
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v22 = tbl_upv_1.GetChest(a1)
    return (math.max(math.floor(tonumber(v22 and (v22.ExhaustedCoins)) or 0), 0))
end
function GetItemWeight(a1, a2)
    --[[
      name: GetItemWeight
      line: 554
    ]]
    if a1.Pool then
        for _, value_8 in a1.Pool do
            if value_8.ItemId ~= a2 then
                continue
            end
            return value_8.Weight or 50
        end
        return 0
    end
    return 50
end
function DiscoverChests()
    --[[
      name: DiscoverChests
      line: 574
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    for _, value_9 in script:GetChildren() do
        if not (value_9:IsA("ModuleScript")) then
            continue
        end
        local success_1, v23 = pcall(require, value_9)
        if not (success_1) then
            warn(string.format("[SharedShopChestData] chest module '%s' failed to load: %s", value_9.Name, tostring(v23)))
            continue
        end
        if type(v23) == "table" then
            tbl_upv_2[value_9.Name] = v23
        else
            warn(string.format("[SharedShopChestData] chest module '%s' must return a table", value_9.Name))
        end
    end
end
function BuildIndexes()
    --[[
      name: BuildIndexes
      line: 598
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        tbl_upv_4 (copy, index: 4)
    ]]
    for key_2, value_10 in tbl_upv_2 do
        if type(value_10.Section) ~= "string" or type(value_10.CardName) ~= "string" then
            warn(string.format("[SharedShopChestData] '%s' needs Section + CardName strings to join a shop card", key_2))
            continue
        end
        if not (tbl_upv_3[value_10.Section]) then
            tbl_upv_3[value_10.Section] = {}
        end
        tbl_upv_3[value_10.Section][value_10.CardName] = key_2
    end
    for _, value_11 in tbl_upv_1.GetChestIds() do
        for v26, value_12 in tbl_upv_1.PurchaseOptionOrder do
            local v24 = tbl_upv_1.GetPurchaseOption(value_11, value_12)
            if not (v24) then
                continue
            end
            local v25 = tbl_upv_4[v24.ProductId]
            if v25 then
                warn(string.format("[SharedShopChestData] product %d is claimed by both '%s' (%s) and '%s' (%s)", v24.ProductId, v25.ChestId, v25.OptionKey, value_11, value_12))
            else
                tbl_upv_4[v24.ProductId] = {ChestId = value_11, OptionKey = value_12}
            end
        end
    end
end
function ValidateChests()
    --[[
      name: ValidateChests
      line: 651
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        SharedCosmeticData_upv_1 (copy, index: 3)
    ]]
    for _, value_13 in tbl_upv_1.GetChestIds() do
        local v26 = tbl_upv_2[value_13]
        if not (SharedCosmeticData_upv_1.CosmeticSlots.IsSlot(v26.Slot)) then
            warn(string.format("[SharedShopChestData] '%s' names unknown slot '%s'", value_13, tostring(v26.Slot)))
            continue
        end
        for v27, value_14 in v26.Pool or {} do
            if not (SharedCosmeticData_upv_1.IsValidCosmetic(v26.Slot, value_14.ItemId)) then
                warn(string.format("[SharedShopChestData] '%s' pool has no %s called '%s'", value_13, v26.Slot, tostring(value_14.ItemId)))
            end
        end
        if not (v26.Unavailable) and #tbl_upv_1.GetPoolIds(value_13) == 0 then
            warn(string.format("[SharedShopChestData] '%s' is on sale with an empty pool", value_13))
        end
        if v26.BundleProductId and not (v26.ProductId) then
            warn(string.format("[SharedShopChestData] '%s' has a bundle product but no single one", value_13))
        end
        if v26.GiftProductId and not (v26.ProductId) then
            warn(string.format("[SharedShopChestData] '%s' has a gift product but no single one", value_13))
        end
        if #tbl_upv_1.GetPurchaseOptions(value_13) <= 0 then
            continue
        end
        if tbl_upv_1.GetExhaustedCoins(value_13) <= 0 then
            warn(string.format("[SharedShopChestData] '%s' sells for Robux but authors no ExhaustedCoins, an owned-out roll would pay nothing", value_13))
        end
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 695
    ]]
    DiscoverChests()
    BuildIndexes()
    ValidateChests()
end
Initialize()
return tbl_upv_1