-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.Variants = {Ui = "Shadow", Cloud = "Regular"}
tbl_upv_1.AuthoringCellSize = Vector2.new(200, 200)
tbl_upv_1.DefaultCloudOffset = Vector2.new(0, -0.35)
tbl_upv_1.CloudBaseWidthScale = 0.289
local tbl_upv_2 = {}
tbl_upv_2.Bandaids = {Rarity = "Common", DisplayName = "Bandaids"}
tbl_upv_2.Beanie = {Rarity = "Uncommon", DisplayName = "Beanie"}
tbl_upv_2["Butterfly Bow Tie"] = {Rarity = "Epic", DisplayName = "Butterfly Bow Tie"}
tbl_upv_2.Cap = {Rarity = "Common", DisplayName = "Cap"}
tbl_upv_2["Cat Ears"] = {Rarity = "Uncommon", DisplayName = "Cat Ears"}
tbl_upv_2.Crown = {Rarity = "Legendary", DisplayName = "Crown"}
tbl_upv_2.Glasses = {Rarity = "Common", DisplayName = "Glasses"}
tbl_upv_2["Hair Clips"] = {Rarity = "Common", DisplayName = "Hair Clips"}
tbl_upv_2["Heart Glasses"] = {Rarity = "Rare", DisplayName = "Heart Glasses"}
tbl_upv_2.Horns = {Rarity = "Rare", DisplayName = "Horns"}
tbl_upv_2["Kawai Beanie"] = {Rarity = "Rare", DisplayName = "Kawai Beanie"}
tbl_upv_2["Rabbit Ears"] = {Rarity = "Uncommon", DisplayName = "Rabbit Ears"}
tbl_upv_2.Seedling = {Rarity = "Common", DisplayName = "Seedling"}
tbl_upv_2["Star Glasses"] = {Rarity = "Epic", DisplayName = "Star Glasses"}
tbl_upv_2.Starlings = {Rarity = "Uncommon", DisplayName = "Starlings"}
tbl_upv_2.Tiara = {Rarity = "Rare", DisplayName = "Tiara"}
tbl_upv_2["White Bow Tie"] = {Rarity = "Epic", DisplayName = "White Bow Tie"}
tbl_upv_2["Wolf Ears"] = {Rarity = "Uncommon", DisplayName = "Wolf Ears"}
function tbl_upv_1.Get(a1)
    --[[
      name: Get
      line: 128
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return tbl_upv_2[a1]
    end
    return nil
end
function tbl_upv_1.GetAll()
    --[[
      name: GetAll
      line: 142
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2
end
function tbl_upv_1.GetAssetName(a1)
    --[[
      name: GetAssetName
      line: 151
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Get(a1)
    if v1 then
        return v1.AssetName or a1
    end
    warn(string.format("[Charms] GetAssetName called with unknown charm '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.GetDisplayName(a1)
    --[[
      name: GetDisplayName
      line: 166
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.Get(a1)
    if not v2 then
        return (tostring(a1))
    end
    local v3 = v2.DisplayName or (tostring(a1))
    return v3
end
function tbl_upv_1.GetRarity(a1)
    --[[
      name: GetRarity
      line: 182
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v4 = tbl_upv_1.Get(a1)
    if v4 then
        return v4.Rarity
    end
    return nil
end
function tbl_upv_1.GetDefaultOffset(a1)
    --[[
      name: GetDefaultOffset
      line: 197
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v5 = tbl_upv_1.Get(a1)
    if v5 then
        return v5.DefaultOffset or (tbl_upv_1.DefaultCloudOffset)
    end
    return tbl_upv_1.DefaultCloudOffset
end
function tbl_upv_1.IsVariant(a1)
    --[[
      name: IsVariant
      line: 212
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        for _, value_1 in pairs(tbl_upv_1.Variants) do
            if value_1 ~= a1 then
                continue
            end
            return true
        end
    end
    return false
end
return tbl_upv_1