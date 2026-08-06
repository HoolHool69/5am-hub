-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "billboard-face")
local FACE_TONGUE_COLOR_1 = v1.FACE_TONGUE_COLOR
local v2 = Color3.fromRGB(176, 146, 104)
local v3 = Color3.fromRGB(226, 178, 62)
local v4 = Color3.fromRGB(240, 250, 255)
local v5 = Color3.fromRGB(250, 208, 112)
local v6 = Color3.fromRGB(122, 104, 84)
local tbl_1 = {}
tbl_1.eye = {}
tbl_1.eyeShine = {}
tbl_1.cheek = {}
tbl_1.mouth = {}
local tbl_2 = {}
tbl_2.shell = Color3.fromRGB(244, 234, 210)
tbl_2.pattern = v2
tbl_2.face = {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, cheek = {}, mouth = {}, mouthDetail = {color = FACE_TONGUE_COLOR_1}}
local tbl_3 = {}
tbl_3.shell = Color3.fromRGB(250, 226, 150)
tbl_3.pattern = v3
tbl_3.face = {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, mouth = {}}
local tbl_4 = {}
tbl_4.shell = Color3.fromRGB(196, 226, 248)
tbl_4.pattern = v4
tbl_4.face = {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, cheek = {}, mouth = {}}
local tbl_5 = {}
tbl_5.shell = Color3.fromRGB(214, 186, 240)
tbl_5.pattern = v5
local tbl_6 = {}
tbl_6.color = Color3.fromRGB(255, 208, 92)
local tbl_7 = {}
tbl_7.color = Color3.fromRGB(255, 208, 92)
local tbl_8 = {}
tbl_8.color = Color3.fromRGB(255, 208, 92)
tbl_5.face = {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, mouth = {}, mouthDetail = {color = v1.FACE_TEETH_COLOR}, extras = {{color = Color3.fromRGB(255, 208, 92)}, tbl_6, tbl_7, tbl_8}}
local tbl_9 = {{shell = Color3.fromRGB(248, 244, 232), pattern = v2, face = tbl_1}, tbl_2, tbl_3, tbl_4, tbl_5}
local tbl_10 = {}
tbl_10.color = FACE_TONGUE_COLOR_1
local tbl_11 = {}
tbl_11.eye = {}
tbl_11.eyeShine = {}
tbl_11.brow = {}
tbl_11.cheek = {}
tbl_11.mouth = {}
tbl_11.mouthDetail = {color = FACE_TONGUE_COLOR_1}
local tbl_upv_12 = {}
tbl_upv_12.none = {}
tbl_upv_12.speckle = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
tbl_upv_12.marble = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
tbl_upv_12.dapple = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
tbl_upv_12.stars = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
local tbl_13 = {{}, {}, {}, {}, {}}
local tbl_14 = {}
tbl_14.eggPatternDots = function(a1)
    --[[
      name: eggPatternDots
      line: 554
      upvalues:
        tbl_upv_12 (copy, index: 1)
    ]]
    return tbl_upv_12[a1]
end
tbl_14.EGG_SKINS = tbl_9
tbl_14.EGG_CRACK_COLOR = v6
tbl_14.EGG_FRENZY_FACE = {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, cheek = {color = v1.FACE_BLUSH_COLOR}, mouth = {}, mouthDetail = tbl_10}
tbl_14.GOLDEN_EGG_FACE = tbl_11
tbl_14.EGG_CRACKS = tbl_13
return tbl_14