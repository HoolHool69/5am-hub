-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local CosmeticSlots_upv_1 = require(script.CosmeticSlots)
local Rarities_1 = require(script.Rarities)
local SkinPackData_1 = require(script.SkinPackData)
local SkinPackAssets_upv_1 = require(script.SkinPackAssets)
local Clouds_1 = require(script.Clouds)
local PlayerFrames_1 = require(script.PlayerFrames)
local Charms_1 = require(script.Charms)
local ChestSprites_1 = require(script.ChestSprites)
tbl_upv_1.PetFruitsSaleTime = DateTime.fromUniversalTime(2024, 6, 10, 12, 0)
tbl_upv_1.CosmeticTypes = {Fruits = "Fruits", Background = "Background", FruitBox = "FruitBox", Dropper = "Dropper"}
tbl_upv_1.SkinPack = SkinPackData_1.SkinPack
tbl_upv_1.Background = {}
tbl_upv_1.Dropper = {}
tbl_upv_1.FruitBox = {}
tbl_upv_1.Fruits = {}
tbl_upv_1.CosmeticSlots = CosmeticSlots_upv_1
tbl_upv_1.Rarities = Rarities_1
tbl_upv_1.SkinPackAssets = SkinPackAssets_upv_1
tbl_upv_1.Clouds = Clouds_1
tbl_upv_1.PlayerFrames = PlayerFrames_1
tbl_upv_1.Charms = Charms_1
tbl_upv_1.ChestSprites = ChestSprites_1
function tbl_upv_1.GetSlotItems(a1)
    --[[
      name: GetSlotItems
      line: 98
      upvalues:
        CosmeticSlots_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v1 = CosmeticSlots_upv_1.Get(a1)
    if v1 then
        return tbl_upv_1[v1.DataKey]
    end
    warn(string.format("[SharedCosmeticData] GetSlotItems called with unknown slot '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.GetSlotItemIds(a1)
    --[[
      name: GetSlotItemIds
      line: 118
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.GetSlotItems(a1)
    if type(v2) ~= "table" then
        return {}
    end
    if type(v2.GetIds) == "function" then
        return v2.GetIds()
    end
    local v3
    if type(v2.GetAll) ~= "function" then
        v3 = v2
    else
        v3 = v2.GetAll()
    end
    local tbl_2 = {}
    for key_1 in pairs(v3) do
        table.insert(tbl_2, key_1)
    end
    table.sort(tbl_2)
    return tbl_2
end
function tbl_upv_1.GetItemRecord(a1, a2)
    --[[
      name: GetItemRecord
      line: 152
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if type(a2) ~= "string" then
        return nil
    end
    local v4 = tbl_upv_1.GetSlotItems(a1)
    if type(v4) ~= "table" then
        return nil
    end
    local v5 = v4.Get or (v4.GetCloud)
    if type(v5) ~= "function" then
        return v4[a2]
    end
    return v5(a2)
end
function tbl_upv_1.GetItemDisplayName(a1, a2)
    --[[
      name: GetItemDisplayName
      line: 179
      upvalues:
        tbl_upv_1 (copy, index: 1)
        CosmeticSlots_upv_1 (copy, index: 2)
    ]]
    if type(a2) ~= "string" then
        return (tostring(a2))
    end
    local v6 = tbl_upv_1.GetSlotItems(a1)
    if type(v6) ~= "table" then
        return a2
    end
    if type(v6.GetDisplayName) == "function" then
        return v6.GetDisplayName(a2)
    end
    local v7 = tbl_upv_1.GetItemRecord(a1, a2)
    if type(v7) == "table" and type(v7.CosmeticName) == "string" then
        return v7.CosmeticName
    end
    local v8 = CosmeticSlots_upv_1.Get(a1)
    if v8 and v8.MemberOfBundle then
        return tbl_upv_1.GetItemDisplayName(v8.MemberOfBundle, a2)
    end
    return a2
end
function tbl_upv_1.GetItemRarity(a1, a2)
    --[[
      name: GetItemRarity
      line: 221
      upvalues:
        CosmeticSlots_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v9 = CosmeticSlots_upv_1.Get(a1)
    if v9 then
        if v9.MemberOfBundle then
            return tbl_upv_1.GetItemRarity(v9.MemberOfBundle, a2)
        end
        local v10 = ReadAuthoredRarity(a1, a2)
        if v10 then
            return v10, true
        end
        return v9.DefaultRarity, false
    end
    warn(string.format("[SharedCosmeticData] GetItemRarity called with unknown slot '%s'", tostring(a1)))
    return nil, false
end
function tbl_upv_1.IsValidCosmetic(a1, a2)
    --[[
      name: IsValidCosmetic
      line: 251
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if type(a2) ~= "string" then
        return false
    end
    local v11 = tbl_upv_1.GetSlotItems(a1)
    if not v11 then
        return false
    end
    local v12 = v11.Get or (v11.GetCloud)
    if type(v12) ~= "function" then
        if next(v11) ~= nil then
            return v11[a2] ~= nil
        end
        return true
    else
        local v13 = v12(a2) ~= nil
        return v13
    end
end
function tbl_upv_1.GetPacksProvidingSlot(a1)
    --[[
      name: GetPacksProvidingSlot
      line: 282
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v14 = tbl_upv_1.GetSlotItems(a1)
    if type(v14) ~= "table" then
        return {}
    end
    local tbl_3 = {}
    for key_2 in pairs(v14) do
        table.insert(tbl_3, key_2)
    end
    table.sort(tbl_3)
    return tbl_3
end
function tbl_upv_1.IsSlotEnumerated(a1)
    --[[
      name: IsSlotEnumerated
      line: 305
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v15 = tbl_upv_1.GetSlotItems(a1)
    if v15 then
        if type(v15.Get) ~= "function" and type(v15.GetCloud) ~= "function" then
            local v16 = next(v15) ~= nil
            return v16
        end
        return true
    end
    return false
end
function ReadAuthoredRarity(a1, a2)
    --[[
      name: ReadAuthoredRarity
      line: 327
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v17 = tbl_upv_1.GetSlotItems(a1)
    if type(v17) ~= "table" then
        return nil
    end
    if type(v17.GetRarity) == "function" then
        return v17.GetRarity(a2)
    end
    local v18 = tbl_upv_1.GetItemRecord(a1, a2)
    if type(v18) == "table" and type(v18.Rarity) == "string" then
        return v18.Rarity
    end
    return nil
end
function IndexPackSlots(a1)
    --[[
      name: IndexPackSlots
      line: 353
      upvalues:
        SkinPackAssets_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    for _, value_1 in SkinPackAssets_upv_1.GetLegacySlots() do
        local v19 = tbl_upv_1[value_1]
        if type(v19) ~= "table" then
            warn(string.format("[SharedCosmeticData] no index table for legacy slot '%s'", tostring(value_1)))
            continue
        end
        if SkinPackAssets_upv_1.HasSlot(a1, value_1) then
            v19[a1] = true
        end
    end
end
function BuildLegacySlotIndexes()
    --[[
      name: BuildLegacySlotIndexes
      line: 376
      upvalues:
        SkinPackAssets_upv_1 (copy, index: 1)
    ]]
    for _, value_2 in SkinPackAssets_upv_1.GetPackIds() do
        IndexPackSlots(value_2)
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 395
      upvalues:
        SkinPackAssets_upv_1 (copy, index: 1)
    ]]
    SkinPackAssets_upv_1.OnPackRegistered(
        function(a1)
            --[[
              line: 397
            ]]
            IndexPackSlots(a1)
        end
    )
    BuildLegacySlotIndexes()
end
Initialize()
return tbl_upv_1