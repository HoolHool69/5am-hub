-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.FrameImageName = "FrameImage"
tbl_upv_1.HeadshotImageName = "PlayerHeadshot"
local u1 = Vector2.new(512, 512)
tbl_upv_1.SpriteNativeSize = 600
local tbl_upv_2 = {
    {Rarity = "Common", Theme = "Animals", SpriteSheet = "rbxassetid://101699808320808", Frames = {{Id = "Cat", DisplayName = "Cat", Offset = Vector2.new(0, 0)}, {Id = "Rabbit", DisplayName = "Rabbit", Offset = Vector2.new(512, 0)}, {Id = "Foxy", DisplayName = "Foxy", Offset = Vector2.new(0, 512)}, {Id = "Doggo", DisplayName = "Doggo", Offset = Vector2.new(512, 512)}}},
    {Rarity = "Common", Theme = "Food", SpriteSheet = "rbxassetid://93939443398465", Frames = {{Id = "RamenRun", DisplayName = "Ramen Run", Offset = Vector2.new(0, 0)}, {Id = "TakoyakiTime", DisplayName = "Takoyaki Time", Offset = Vector2.new(512, 0)}, {Id = "SugarRush", DisplayName = "Sugar Rush", Offset = Vector2.new(0, 512)}, {Id = "BakeryBliss", DisplayName = "Bakery Bliss", Offset = Vector2.new(512, 512)}}},
    {Rarity = "Common", Theme = "Flowers", SpriteSheet = "rbxassetid://125354060658964", Frames = {{Id = "Frostbloom", DisplayName = "Frostbloom", Offset = Vector2.new(0, 0)}, {Id = "Springtide", DisplayName = "Springtide", Offset = Vector2.new(512, 0)}, {Id = "Autumnfall", DisplayName = "Autumnfall", Offset = Vector2.new(0, 512)}, {Id = "Sunburst", DisplayName = "Sunburst", Offset = Vector2.new(512, 512)}}},
    {Rarity = "Special", Theme = "Vulkan", SpriteSheet = "rbxassetid://122971400393634", Frames = {{Id = "AstralCrown", DisplayName = "Astral Crown", Offset = Vector2.new(0, 0)}, {Id = "Silverveil", DisplayName = "Silverveil", Offset = Vector2.new(512, 0)}, {Id = "Solaris", DisplayName = "Solaris", Offset = Vector2.new(0, 512)}, {Id = "Oceanheart", DisplayName = "Oceanheart", Offset = Vector2.new(512, 512)}}}
}
local tbl_upv_3 = {}
tbl_upv_3.PlayerFrame = {Rarity = "Common", DisplayName = "Classic"}
function tbl_upv_1.Get(a1)
    --[[
      name: Get
      line: 199
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return tbl_upv_3[a1]
    end
    return nil
end
function tbl_upv_1.GetAll()
    --[[
      name: GetAll
      line: 213
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    return tbl_upv_3
end
function tbl_upv_1.GetAssetName(a1)
    --[[
      name: GetAssetName
      line: 224
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Get(a1)
    if v1 then
        return v1.AssetName or a1
    end
    warn(string.format("[PlayerFrames] GetAssetName called with unknown frame '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.GetRarity(a1)
    --[[
      name: GetRarity
      line: 242
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.Get(a1)
    if v2 then
        return v2.Rarity
    end
    return nil
end
function tbl_upv_1.GetSpriteRect(a1)
    --[[
      name: GetSpriteRect
      line: 259
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = tbl_upv_1.Get(a1)
    if v3 then
        return v3.Sprite
    end
    warn(string.format("[PlayerFrames] GetSpriteRect called with unknown frame '%s'", tostring(a1)))
    return nil
end
function tbl_upv_1.GetDisplayName(a1)
    --[[
      name: GetDisplayName
      line: 275
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v4 = tbl_upv_1.Get(a1)
    if not v4 then
        return (tostring(a1))
    end
    local v5 = v4.DisplayName or (tostring(a1))
    return v5
end
function BuildSpriteIndex()
    --[[
      name: BuildSpriteIndex
      line: 293
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    for _, value_1 in tbl_upv_2 do
        for v1, value_2 in value_1.Frames do
            if tbl_upv_3[value_2.Id] then
                warn(string.format("[PlayerFrames] duplicate frame id '%s'; keeping the first", value_2.Id))
            else
                local Id_1 = value_2.Id
                local tbl_4 = {Sprite = 0, Rarity = 0}
                tbl_4.DisplayName = value_2.DisplayName
                tbl_4.Theme = value_1.Theme
                tbl_4.Rarity = value_2.Rarity or (value_1.Rarity)
                tbl_4.Sprite = {Image = value_1.SpriteSheet, RectOffset = value_2.Offset, RectSize = u1}
                tbl_upv_3[Id_1] = tbl_4
            end
        end
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 320
    ]]
    BuildSpriteIndex()
end
Initialize()
return tbl_upv_1