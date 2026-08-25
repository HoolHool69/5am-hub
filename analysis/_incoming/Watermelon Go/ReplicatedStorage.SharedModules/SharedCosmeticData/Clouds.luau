-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local u1 = Vector2.new(256, 256)
local u2 = NumberRange.new(2, 4)
local tbl_upv_2 = {
    {
        SpriteSheet = "rbxassetid://100052255725432",
        Clouds = {
            Yellow = {Rarity = "Common", Awake = Vector2.new(0, 0), Sleep = Vector2.new(0, 256)},
            Red = {Rarity = "Rare", Awake = Vector2.new(256, 0), Sleep = Vector2.new(256, 256)},
            Purple = {Rarity = "Uncommon", Awake = Vector2.new(512, 0), Sleep = Vector2.new(512, 256)},
            Pink = {Rarity = "Uncommon", Awake = Vector2.new(768, 0), Sleep = Vector2.new(768, 256)},
            Green = {Rarity = "Rare", Awake = Vector2.new(0, 512), Sleep = Vector2.new(0, 768)},
            White = {Rarity = "Rare", Awake = Vector2.new(256, 512), Sleep = Vector2.new(256, 768)},
            Orange = {Rarity = "Uncommon", Awake = Vector2.new(512, 512), Sleep = Vector2.new(512, 768)},
            Cyan = {Rarity = "Uncommon", Awake = Vector2.new(768, 512), Sleep = Vector2.new(768, 768)}
        }
    },
    {
        SpriteSheet = "rbxassetid://75215795170418",
        Clouds = {
            Angel = {Rarity = "Epic", Awake = Vector2.new(0, 0)},
            Wise = {Rarity = "Legendary", Awake = Vector2.new(256, 0)},
            Santa = {Rarity = "Epic", Awake = Vector2.new(512, 0)},
            Storm = {Rarity = "Legendary", Awake = Vector2.new(768, 0)},
            Good = {Rarity = "Epic", Awake = Vector2.new(0, 256)},
            Angry = {Rarity = "Epic", Awake = Vector2.new(512, 256)},
            Devil = {Rarity = "Legendary", Awake = Vector2.new(768, 256)},
            Blue = {Rarity = "Rare", Awake = Vector2.new(0, 512), Sleep = Vector2.new(0, 768)},
            Peach = {Rarity = "Uncommon", Awake = Vector2.new(256, 512), Sleep = Vector2.new(256, 768)}
        }
    }
}
local tbl_upv_3 = {}
function tbl_1.GetIds()
    --[[
      name: GetIds
      line: 111
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local tbl_4 = {}
    for key_1 in tbl_upv_3 do
        table.insert(tbl_4, key_1)
    end
    table.sort(tbl_4)
    return tbl_4
end
function tbl_1.GetCloud(a1)
    --[[
      name: GetCloud
      line: 124
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    return tbl_upv_3[a1]
end
function tbl_1.GetDisplayName(a1)
    --[[
      name: GetDisplayName
      line: 132
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local v1 = tbl_upv_3[a1]
    if v1 and v1.DisplayName then
        return v1.DisplayName
    end
    return a1
end
function tbl_1.GetRarity(a1)
    --[[
      name: GetRarity
      line: 146
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local v2 = tbl_upv_3[a1]
    if v2 then
        return v2.Rarity
    end
    return nil
end
function tbl_1.GetIconSpec(a1)
    --[[
      name: GetIconSpec
      line: 162
      upvalues:
        tbl_upv_3 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v3 = tbl_upv_3[a1]
    if v3 then
        local tbl_5 = {}
        tbl_5.Image = v3.SpriteSheet
        tbl_5.ImageRectSize = u1
        tbl_5.ImageRectOffset = v3.Awake
        return tbl_5
    end
    warn(string.format("[Clouds] GetIconSpec: unknown cloud id '%s'", tostring(a1)))
    return nil
end
function tbl_1.GetPlayback(a1)
    --[[
      name: GetPlayback
      line: 183
      upvalues:
        tbl_upv_3 (copy, index: 1)
        u2 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v4 = tbl_upv_3[a1]
    if v4 then
        local tbl_6 = {{Offset = v4.Awake, Hold = u2}}
        if v4.Sleep then
            table.insert(tbl_6, {Hold = 0.1, Offset = v4.Sleep})
        end
        local tbl_7 = {Loop = true}
        tbl_7.Image = v4.SpriteSheet
        tbl_7.RectSize = u1
        tbl_7.Frames = tbl_6
        return tbl_7
    end
    warn(string.format("[Clouds] GetPlayback: unknown cloud id '%s'", tostring(a1)))
    return nil
end
function BuildIndex()
    --[[
      name: BuildIndex
      line: 212
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    for _, value_1 in tbl_upv_2 do
        for key_2, value_2 in value_1.Clouds do
            if tbl_upv_3[key_2] then
                warn(string.format("[Clouds] Duplicate cloud id '%s' across sheets; overwriting", key_2))
            end
            tbl_upv_3[key_2] = {SpriteSheet = value_1.SpriteSheet, Awake = value_2.Awake, Sleep = value_2.Sleep, DisplayName = value_2.DisplayName, Rarity = value_2.Rarity}
        end
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 231
    ]]
    BuildIndex()
end
Initialize()
return tbl_1