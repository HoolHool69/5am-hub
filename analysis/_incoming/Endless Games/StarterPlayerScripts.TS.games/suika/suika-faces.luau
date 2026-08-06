-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "billboard-face")
local BillboardFace_upv_1 = v1.BillboardFace
local FACE_TEETH_COLOR_1 = v1.FACE_TEETH_COLOR
local FACE_TONGUE_COLOR_1 = v1.FACE_TONGUE_COLOR
local SUIKA_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "suika-config").SUIKA_CONFIG
local v2 = Color3.fromRGB(148, 204, 255)
local v3 = Color3.fromRGB(255, 208, 92)
local tbl_1 = {}
tbl_1.color = v2
local tbl_2 = {}
tbl_2.color = Color3.fromRGB(232, 64, 96)
local tbl_3 = {}
tbl_3.eye = {}
tbl_3.eyeShine = {}
tbl_3.cheek = {}
tbl_3.mouth = {}
tbl_3.mouthDetail = {color = FACE_TONGUE_COLOR_1}
local tbl_4 = {}
tbl_4.color = FACE_TONGUE_COLOR_1
local tbl_5 = {}
tbl_5.eye = {}
tbl_5.eyeWhite = {}
tbl_5.eyeShine = {}
tbl_5.brow = {}
tbl_5.cheek = {}
tbl_5.mouth = {}
local tbl_6 = {}
tbl_6.color = FACE_TONGUE_COLOR_1
local tbl_7 = {}
tbl_7.eye = {}
tbl_7.eyeWhite = {}
tbl_7.brow = {}
tbl_7.mouth = {}
local tbl_upv_8 = {
    {eye = {}, eyeShine = {}, brow = {}, mouth = {}, extras = {tbl_1}},
    {eye = {}, eyeShine = {}, cheek = tbl_2, mouth = {}},
    tbl_3,
    {eye = {}, eyeWhite = {}, mouth = {}, mouthDetail = {color = FACE_TEETH_COLOR_1}},
    {eye = {}, eyeWhite = {}, brow = {}, mouth = {}},
    {eye = {}, eyeWhite = {}, brow = {}, mouth = {}},
    {eye = {}, eyeShine = {}, brow = {}, cheek = {}, mouth = {}, mouthDetail = tbl_4},
    tbl_5,
    {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, mouth = {}, mouthDetail = tbl_6},
    tbl_7,
    {eye = {}, eyeWhite = {}, eyeShine = {}, brow = {}, mouth = {}, mouthDetail = {color = FACE_TEETH_COLOR_1}, extras = {{color = v3}, {color = v3}, {color = v3}, {color = v3}}}
}
local tbl_9 = {}
local tbl_10 = {}
tbl_10.__tostring = function()
    --[[
      name: __tostring
      line: 436
    ]]
    return "SuikaFace"
end
local u1 = setmetatable(tbl_9, tbl_10)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 441
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u1)
    return v4:constructor(...) or v4
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 445
      upvalues:
        BillboardFace_upv_1 (copy, index: 1)
    ]]
    a1.face = BillboardFace_upv_1.new(a2)
end
u1.applyTier = function(a1, a2, a3)
    --[[
      name: applyTier
      line: 448
      upvalues:
        tbl_upv_8 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v5 = tbl_upv_8[math.clamp(a2, 0, #tbl_upv_8 - 1) + 1]
    if v5 ~= nil then
        a1.face:apply(v5, a3 * SUIKA_CONFIG_upv_1.faceScale, (a3 / 2) + 0.2)
    else
        return nil
    end
end
u1.setEyesClosed = function(a1, a2)
    --[[
      name: setEyesClosed
      line: 455
    ]]
    a1.face:setEyesClosed(a2)
end
local tbl_11 = {}
tbl_11.SUIKA_FACES = tbl_upv_8
tbl_11.SuikaFace = u1
return tbl_11