-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.Kinds = {Single = "Single", Bundle = "Bundle", Multi = "Multi"}
tbl_upv_1.AssetSources = {ServerBoard = "ServerBoard", ReplicatedAssets = "ReplicatedAssets", SpriteSheet = "SpriteSheet"}
tbl_upv_1.CharmOffsetLimit = 0.5
tbl_upv_1.CharmScaleLimits = {Min = 0.5, Max = 3}
local tbl_upv_2 = {}
tbl_upv_2.SkinPack = {DataKey = "SkinPack", Default = "Classic", AssetSource = "ReplicatedAssets", Kind = "Bundle", RequiresOwnership = true, DefaultRarity = "Common", BundleSlots = {"Background", "Dropper", "FruitBox", "Fruits"}}
tbl_upv_2.Background = {MemberOfBundle = "SkinPack", DataKey = "Background", Default = "Classic", Kind = "Single", AssetSource = "ReplicatedAssets", RequiresOwnership = true}
tbl_upv_2.Dropper = {MemberOfBundle = "SkinPack", DataKey = "Dropper", Default = "Classic", Kind = "Single", AssetSource = "ReplicatedAssets", RequiresOwnership = true}
tbl_upv_2.FruitBox = {MemberOfBundle = "SkinPack", DataKey = "FruitBox", Default = "Classic", Kind = "Single", AssetSource = "ReplicatedAssets", RequiresOwnership = true}
tbl_upv_2.Fruits = {MemberOfBundle = "SkinPack", DataKey = "Fruits", Default = "Classic", Kind = "Single", AssetSource = "ReplicatedAssets", RequiresOwnership = true}
tbl_upv_2.Cloud = {DataKey = "Clouds", Default = "Yellow", AssetSource = "SpriteSheet", Kind = "Single", RequiresOwnership = true, DefaultRarity = "Common"}
tbl_upv_2.PlayerFrame = {DataKey = "PlayerFrames", Default = "PlayerFrame", AssetBoard = "PlayerFrames", AssetSource = "ServerBoard", Kind = "Single", RequiresOwnership = true, DefaultRarity = "Uncommon"}
tbl_upv_2.Charm = {RequiresOwnership = true, AssetBoard = "Charms", FreeSlotCount = 1, MaxSlotCount = 4, DataKey = "Charms", AssetSource = "ServerBoard", Kind = "Multi", SupportsOffset = true, DefaultRarity = "Common"}
function tbl_upv_1.Get(a1)
    --[[
      name: Get
      line: 186
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
      line: 200
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2
end
function tbl_upv_1.GetSlotsOfKind(a1)
    --[[
      name: GetSlotsOfKind
      line: 209
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local tbl_3 = {}
    for key_1, value_1 in pairs(tbl_upv_2) do
        if value_1.Kind == a1 then
            table.insert(tbl_3, key_1)
        end
    end
    table.sort(tbl_3)
    return tbl_3
end
function tbl_upv_1.IsSlot(a1)
    --[[
      name: IsSlot
      line: 228
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Get(a1) ~= nil
    return v1
end
function tbl_upv_1.GetDefault(a1)
    --[[
      name: GetDefault
      line: 236
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.Get(a1)
    if v2 then
        return v2.Default
    end
    warn(string.format("[CosmeticSlots] GetDefault called with unknown slot '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.GetDefaultRarity(a1)
    --[[
      name: GetDefaultRarity
      line: 256
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = tbl_upv_1.Get(a1)
    if v3 then
        return v3.DefaultRarity
    end
    warn(string.format("[CosmeticSlots] GetDefaultRarity called with unknown slot '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.ClampCharmOffset(a1, a2)
    --[[
      name: ClampCharmOffset
      line: 273
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local CharmOffsetLimit_1 = tbl_upv_1.CharmOffsetLimit
    return SanitizeOffsetAxis(a1, CharmOffsetLimit_1), SanitizeOffsetAxis(a2, CharmOffsetLimit_1)
end
function tbl_upv_1.ClampCharmScale(a1)
    --[[
      name: ClampCharmScale
      line: 286
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if type(a1) == "number" and a1 == a1 then
        return (math.clamp(a1, tbl_upv_1.CharmScaleLimits.Min, tbl_upv_1.CharmScaleLimits.Max))
    end
    return 1
end
function tbl_upv_1.NormalizeCharmRotation(a1)
    --[[
      name: NormalizeCharmRotation
      line: 300
    ]]
    if type(a1) == "number" and a1 == a1 then
        local v4 = a1 % 360
        if v4 > 180 then
            v4 = v4 - 360
        end
        return v4
    end
    return 0
end
function SanitizeOffsetAxis(a1, a2)
    --[[
      name: SanitizeOffsetAxis
      line: 321
    ]]
    if type(a1) == "number" and a1 == a1 then
        return (math.clamp(a1, -a2, a2))
    end
    return 0
end
return tbl_upv_1