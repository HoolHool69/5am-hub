-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = Color3.fromRGB(119, 110, 101)
local v2 = Color3.fromRGB(249, 246, 242)
local tbl_1 = {}
tbl_1.fill = Color3.fromRGB(237, 224, 200)
tbl_1.text = v1
local tbl_2 = {}
tbl_2.fill = Color3.fromRGB(242, 177, 121)
tbl_2.text = v2
local tbl_3 = {}
tbl_3.fill = Color3.fromRGB(245, 149, 99)
tbl_3.text = v2
local tbl_4 = {}
tbl_4.fill = Color3.fromRGB(246, 124, 95)
tbl_4.text = v2
local tbl_5 = {}
tbl_5.fill = Color3.fromRGB(246, 94, 59)
tbl_5.text = v2
local tbl_6 = {}
tbl_6.fill = Color3.fromRGB(237, 207, 114)
tbl_6.text = v2
local tbl_7 = {}
tbl_7.fill = Color3.fromRGB(237, 204, 97)
tbl_7.text = v2
local tbl_8 = {}
tbl_8.fill = Color3.fromRGB(237, 200, 80)
tbl_8.text = v2
local tbl_9 = {}
tbl_9.fill = Color3.fromRGB(237, 197, 63)
tbl_9.text = v2
local tbl_10 = {}
tbl_10.fill = Color3.fromRGB(237, 194, 46)
tbl_10.text = v2
local tbl_upv_11 = {{fill = Color3.fromRGB(238, 228, 218), text = v1}, tbl_1, tbl_2, tbl_3, tbl_4, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10}
local u1 = Color3.fromRGB(12, 12, 16)
local u2 = Color3.fromRGB(255, 255, 255)
local tbl_upv_12 = {}
tbl_upv_12.fill = Color3.fromRGB(60, 58, 50)
tbl_upv_12.text = v2
local function stepsPast_1(a1, a2)
    --[[
      name: stepsPast
      line: 68
    ]]
    local v3 = 0
    local v4 = a1
    while a2 < v4 do
        v4 = v4 / 2
        v3 = v3 + 1
    end
    return v3
end
local function ringForStep_1(a1)
    --[[
      name: ringForStep
      line: 78
      upvalues:
        tbl_upv_11 (copy, index: 1)
    ]]
    local v5 = tbl_upv_11[a1 + 1]
    if v5 == nil then
        return Color3.fromHSV(((a1 - #tbl_upv_11) * 0.135) % 1, 0.85, 1)
    end
    return v5.fill
end
local tbl_13 = {}
tbl_13.tileStyle3d = function(a1)
    --[[
      name: tileStyle3d
      line: 86
      upvalues:
        u1 (copy, index: 1)
        u2 (copy, index: 2)
        tbl_upv_11 (copy, index: 3)
        tbl_upv_12 (copy, index: 4)
    ]]
    local v6, v7 = nil, nil
    if a1 < 4096 then
        local v8, v9 = a1, 0
        while v8 > 2 do
            v8 = v8 / 2
            v9 = v9 + 1
        end
        v6 = tbl_upv_11[v9 + 1]
        local tbl_14 = v6 or tbl_upv_12
        return v6
    else
        local tbl_14 = {}
        tbl_14.fill = u1
        tbl_14.text = u2
        v7 = 0
        local v9 = a1
        while v9 > 4096 do
            v9 = v9 / 2
            v7 = v7 + 1
        end
        v7 = tbl_upv_11[v7 + 1]
        local v10
        if v7 == nil then
            v10 = Color3.fromHSV(((v7 - #tbl_upv_11) * 0.135) % 1, 0.85, 1)
        else
            v10 = v7.fill
        end
        tbl_14.ring = v10
        return tbl_14
    end
end
return tbl_13