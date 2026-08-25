-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local tbl_upv_2 = {}
tbl_upv_2.Clouds = {Default = {Closed = {"rbxassetid://74295871220690", 0, 530, 493, 493}, Open = {"rbxassetid://74295871220690", 0, 0, 505, 526}}}
local tbl_3 = {}
tbl_3.Closed = {"rbxassetid://99137180219922", 499, 528, 495, 495}
tbl_3.Open = {"rbxassetid://99137180219922", 0, 0, 500, 521}
local tbl_4 = {}
tbl_4.Closed = {"rbxassetid://99137180219922", 0, 525, 495, 496}
tbl_4.Open = {"rbxassetid://99137180219922", 504, 0, 496, 524}
local tbl_5 = {}
tbl_5.Closed = {"rbxassetid://110957252062631", 0, 525, 497, 497}
tbl_5.Open = {"rbxassetid://110957252062631", 0, 0, 503, 521}
tbl_upv_2.PlayerFrames = {Animals = {Closed = {"rbxassetid://74295871220690", 509, 526, 495, 493}, Open = {"rbxassetid://74295871220690", 509, 0, 493, 522}}, Desert = tbl_3, Vulkan = tbl_4, Flower = tbl_5}
tbl_upv_2.Charms = {Default = {Closed = {"rbxassetid://110081072081186", 503, 0, 499, 499}, Open = {"rbxassetid://110081072081186", 0, 0, 499, 520}}}
local tbl_6 = {}
tbl_6.Closed = {"rbxassetid://139349500346546", 257, 785, 249, 236}
tbl_6.Open = {"rbxassetid://139349500346546", 0, 787, 242, 236}
tbl_6.Front = {"rbxassetid://139349500346546", 508, 786, 242, 236}
local tbl_7 = {}
tbl_7.Closed = {"rbxassetid://139349500346546", 260, 529, 256, 254}
tbl_7.Open = {"rbxassetid://139349500346546", 260, 272, 256, 254}
tbl_7.Front = {"rbxassetid://139349500346546", 519, 272, 256, 254}
local tbl_8 = {}
tbl_8.Closed = {"rbxassetid://139349500346546", 0, 272, 258, 256}
tbl_8.Open = {"rbxassetid://139349500346546", 0, 530, 254, 255}
tbl_8.Front = {"rbxassetid://139349500346546", 519, 529, 254, 255}
local tbl_9 = {}
tbl_9.Closed = {"rbxassetid://139349500346546", 0, 0, 267, 270}
tbl_9.Open = {"rbxassetid://139349500346546", 270, 0, 266, 270}
tbl_9.Front = {"rbxassetid://139349500346546", 538, 0, 266, 270}
tbl_upv_2.MysteryBox = {Chest_1 = {Closed = {"rbxassetid://139349500346546", 776, 759, 238, 241}, Open = {"rbxassetid://139349500346546", 777, 272, 238, 241}, Front = {"rbxassetid://139349500346546", 777, 515, 238, 241}}, Chest_2 = tbl_6, Chest_3 = tbl_7, Chest_4 = tbl_8, Chest_5 = tbl_9}
tbl_upv_1.Chests = {}
function tbl_upv_1.GetThemes(a1)
    --[[
      name: GetThemes
      line: 183
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Chests[a1]
    if v1 then
        local tbl_10 = {}
        for key_1 in v1 do
            table.insert(tbl_10, key_1)
        end
        table.sort(tbl_10)
        return tbl_10
    end
    warn(string.format("[ChestSprites] GetThemes: unknown category '%s'", tostring(a1)))
    return {}
end
function tbl_upv_1.GetStates(a1, a2)
    --[[
      name: GetStates
      line: 208
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.Chests[a1]
    local v3 = v2 and (v2[a2 or "Default"])
    if not v3 then
        return {}
    end
    local tbl_11 = {}
    for key_2 in v3 do
        table.insert(tbl_11, key_2)
    end
    table.sort(tbl_11)
    return tbl_11
end
function tbl_upv_1.Get(a1, a2, a3)
    --[[
      name: Get
      line: 231
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v4 = tbl_upv_1.Chests[a1]
    if v4 then
        local v5 = a2 or "Default"
        local v6 = v4[v5]
        if v6 then
            local v7 = v6[a3]
            if v7 then
                return v7
            end
            warn(string.format("[ChestSprites] Unknown state '%s' on '%s' / '%s'", tostring(a3), a1, v5))
        else
            warn(string.format("[ChestSprites] Category '%s' has no '%s' theme", a1, v5))
        end
    else
        warn(string.format("[ChestSprites] Unknown category '%s'", tostring(a1)))
    end
    return nil
end
function tbl_upv_1.Apply(a1, a2, a3, a4)
    --[[
      name: Apply
      line: 261
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v8 = tbl_upv_1.Get(a2, a3, a4)
    if v8 then
        a1.Image = v8.Image
        a1.ImageRectSize = v8.RectSize
        a1.ImageRectOffset = v8.RectOffset
        return v8
    end
    return nil
end
function tbl_upv_1.ApplyPair(a1, a2, a3, a4)
    --[[
      name: ApplyPair
      line: 292
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.Apply(a1, a3, a4, "Closed"), tbl_upv_1.Apply(a2, a3, a4, "Open")
end
function BuildIndex()
    --[[
      name: BuildIndex
      line: 310
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    for key_3, value_1 in tbl_upv_2 do
        local tbl_12 = {}
        for key_4, value_2 in value_1 do
            local tbl_13 = {}
            for key_5, value_3 in value_2 do
                local v9, v10, v11, v12, v13 = table.unpack(value_3)
                tbl_13[key_5] = table.freeze({Image = v9, RectSize = Vector2.new(v12, v13), RectOffset = Vector2.new(v10, v11)})
            end
            tbl_12[key_4] = table.freeze(tbl_13)
        end
        tbl_upv_1.Chests[key_3] = table.freeze(tbl_12)
    end
    table.freeze(tbl_upv_1.Chests)
end
function Initialize()
    --[[
      name: Initialize
      line: 341
    ]]
    BuildIndex()
end
Initialize()
return tbl_upv_1