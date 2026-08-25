-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.Order = table.freeze({"Common", "Uncommon", "Rare", "Epic", "Legendary", "Special"})
local tbl_upv_2 = {}
tbl_upv_2.Common = {DisplayName = "Common", Color = Color3.fromRGB(176, 190, 197)}
tbl_upv_2.Uncommon = {DisplayName = "Uncommon", Color = Color3.fromRGB(106, 209, 118)}
tbl_upv_2.Rare = {DisplayName = "Rare", Color = Color3.fromRGB(94, 148, 255)}
tbl_upv_2.Epic = {DisplayName = "Epic", Color = Color3.fromRGB(177, 106, 240)}
tbl_upv_2.Legendary = {DisplayName = "Legendary", Color = Color3.fromRGB(255, 196, 56)}
tbl_upv_2.Special = {ExcludedFromRewards = true, DisplayName = "Special", Color = Color3.fromRGB(240, 84, 122)}
function tbl_upv_1.Get(a1)
    --[[
      name: Get
      line: 117
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
      line: 130
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2
end
function tbl_upv_1.IsRarity(a1)
    --[[
      name: IsRarity
      line: 139
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Get(a1) ~= nil
    return v1
end
function tbl_upv_1.GetRank(a1)
    --[[
      name: GetRank
      line: 148
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return table.find(tbl_upv_1.Order, a1) or 0
    end
    return 0
end
function tbl_upv_1.IsRewardEligible(a1)
    --[[
      name: IsRewardEligible
      line: 165
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.Get(a1)
    if v2 then
        return not v2.ExcludedFromRewards
    end
    return false
end
function tbl_upv_1.GetDisplayName(a1)
    --[[
      name: GetDisplayName
      line: 179
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = tbl_upv_1.Get(a1)
    if v3 then
        return v3.DisplayName
    end
    return (tostring(a1))
end
function tbl_upv_1.GetColor(a1)
    --[[
      name: GetColor
      line: 194
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v4 = tbl_upv_1.Get(a1)
    if v4 then
        return v4.Color
    end
    local v5 = tbl_upv_2[tbl_upv_1.Order[1]]
    if v5 then
        return v5.Color
    end
    return Color3.fromRGB(176, 190, 197)
end
function ValidateLadder()
    --[[
      name: ValidateLadder
      line: 220
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    for _, value_1 in tbl_upv_1.Order do
        if not (tbl_upv_2[value_1]) then
            warn(string.format("[Rarities] Order lists '%s' but no definition exists for it", value_1))
        end
    end
    for key_1 in tbl_upv_2 do
        if not (table.find(tbl_upv_1.Order, key_1)) then
            warn(string.format("[Rarities] '%s' is defined but missing from Order, so it has no rank", key_1))
        end
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 242
    ]]
    ValidateLadder()
end
Initialize()
return tbl_upv_1