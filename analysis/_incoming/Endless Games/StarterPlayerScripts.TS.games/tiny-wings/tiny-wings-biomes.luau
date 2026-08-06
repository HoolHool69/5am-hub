-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "medals")
local MEDAL_THRESHOLDS_1 = v1.MEDAL_THRESHOLDS
local MEDAL_TIERS_1 = v1.MEDAL_TIERS
local TINY_WINGS_CONFIG_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-config").TINY_WINGS_CONFIG
local tbl_1 = {}
tbl_1.crustA = Color3.fromRGB(235, 222, 175)
tbl_1.crustB = Color3.fromRGB(230, 105, 45)
tbl_1.fill = Color3.fromRGB(150, 135, 105)
tbl_1.sky = Color3.fromRGB(201, 229, 204)
local tbl_2 = {}
tbl_2.crustA = Color3.fromRGB(245, 196, 58)
tbl_2.crustB = Color3.fromRGB(244, 155, 50)
tbl_2.fill = Color3.fromRGB(200, 120, 40)
tbl_2.sky = Color3.fromRGB(183, 225, 189)
local tbl_3 = {}
tbl_3.crustA = Color3.fromRGB(235, 150, 62)
tbl_3.crustB = Color3.fromRGB(60, 165, 158)
tbl_3.fill = Color3.fromRGB(214, 72, 36)
tbl_3.sky = Color3.fromRGB(150, 211, 197)
local tbl_4 = {}
tbl_4.crustA = Color3.fromRGB(214, 120, 10)
tbl_4.crustB = Color3.fromRGB(160, 100, 48)
tbl_4.fill = Color3.fromRGB(55, 17, 38)
tbl_4.sky = Color3.fromRGB(139, 166, 71)
local tbl_5 = {}
tbl_5.crustA = Color3.fromRGB(101, 99, 187)
tbl_5.crustB = Color3.fromRGB(30, 45, 148)
tbl_5.fill = Color3.fromRGB(86, 62, 156)
tbl_5.sky = Color3.fromRGB(78, 116, 165)
local tbl_6 = {}
tbl_6.crustA = Color3.fromRGB(154, 20, 82)
tbl_6.crustB = Color3.fromRGB(85, 215, 25)
tbl_6.fill = Color3.fromRGB(250, 140, 126)
tbl_6.sky = Color3.fromRGB(200, 225, 205)
local tbl_7 = {}
tbl_7.crustA = Color3.fromRGB(204, 212, 95)
tbl_7.crustB = Color3.fromRGB(150, 185, 60)
tbl_7.fill = Color3.fromRGB(85, 108, 36)
tbl_7.sky = Color3.fromRGB(183, 189, 110)
local tbl_upv_8 = {{crustA = Color3.fromRGB(240, 250, 58), crustB = Color3.fromRGB(115, 205, 73), fill = Color3.fromRGB(62, 158, 59), sky = Color3.fromRGB(190, 222, 220)}, tbl_1, tbl_2, tbl_3, tbl_4, tbl_5, tbl_6, tbl_7}
local v2 = Color3.fromRGB(131, 193, 215)
local v3 = Color3.fromRGB(44, 81, 151)
local u1 = table.create(#MEDAL_TIERS_1)
for v4, value_1 in MEDAL_TIERS_1 do
    u1[v4] = (MEDAL_THRESHOLDS_1["tiny-wings"][value_1] * TINY_WINGS_CONFIG_1.studsPerPoint) * TINY_WINGS_CONFIG_1.biomeBoundaryScale
end
local u2 = TINY_WINGS_CONFIG_1.biomeCycleStuds * TINY_WINGS_CONFIG_1.biomeBoundaryScale
local v4 = {}
v4.boundaryForIsland = function(a1)
    --[[
      name: boundaryForIsland
      line: 85
      upvalues:
        u1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    if a1 >= #u1 then
        return u1[#u1] + (((a1 - #u1) + 1) * u2)
    end
    return u1[a1 + 1]
end
v4.paletteForIsland = function(a1)
    --[[
      name: paletteForIsland
      line: 93
      upvalues:
        tbl_upv_8 (copy, index: 1)
    ]]
    return tbl_upv_8[(a1 % #tbl_upv_8) + 1]
end
v4.BIOME_PALETTES = tbl_upv_8
v4.WATER_SURFACE_COLOR = v2
v4.WATER_DEEP_COLOR = v3
return v4