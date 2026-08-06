-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = Color3.fromRGB(38, 30, 44)
local u2 = Color3.fromRGB(252, 250, 246)
local u3 = Color3.fromRGB(255, 255, 255)
local u4 = Color3.fromRGB(255, 136, 150)
local v1 = Color3.fromRGB(232, 94, 118)
local v2 = Color3.fromRGB(252, 250, 246)
local function applyPose_upv_1(a1, a2, a3, a4)
    --[[
      name: applyPose
      line: 72
    ]]
    local frame_1 = a1.frame
    if a2 ~= nil then
        local v3 = a3 == "mirrored"
        local v4
        if v3 then
            v4 = 1 - a2.x
        else
            v4 = a2.x
        end
        local v5 = ((a2.rotation == nil) and 0) or (a2.rotation)
        frame_1.Position = UDim2.fromScale(v4, a2.y)
        frame_1.Size = UDim2.fromScale(a2.width, a2.height)
        local corner_1
        if v3 then
            corner_1 = -v5
        else
            corner_1 = v5
        end
        frame_1.Rotation = corner_1
        if a2.color == nil then
            corner_1 = a4
        else
            corner_1 = a2.color
        end
        frame_1.BackgroundColor3 = corner_1
        frame_1.BackgroundTransparency = ((a2.transparency == nil) and 0) or (a2.transparency)
        corner_1 = a1.corner
        corner_1.CornerRadius = UDim.new(((a2.corner == nil) and 1) or (a2.corner), 0)
        frame_1.Visible = true
    else
        frame_1.Visible = false
        return nil
    end
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 102
    ]]
    return "BillboardFace"
end
local u5 = setmetatable(tbl_1, tbl_2)
u5.__index = u5
u5.new = function(...)
    --[[
      name: new
      line: 107
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u5)
    return v6:constructor(...) or v6
end
local function makeFeature_upv_1(a1, a2)
    --[[
      name: makeFeature
      line: 49
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v7 = Instance.new("Frame")
    v7.AnchorPoint = Vector2.new(0.5, 0.5)
    v7.BackgroundColor3 = u1
    v7.BorderSizePixel = 0
    v7.Visible = false
    v7.ZIndex = a2
    local v8 = Instance.new("UICorner")
    v8.CornerRadius = UDim.new(1, 0)
    v8.Parent = v7
    v7.Parent = a1
    local tbl_3 = {}
    tbl_3.frame = v7
    tbl_3.corner = v8
    return tbl_3
end
u5.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 111
      upvalues:
        makeFeature_upv_1 (copy, index: 1)
    ]]
    a1.eyeOpenSize = UDim2.fromScale(0.14, 0.2)
    a1.eyeClosedSize = UDim2.fromScale(0.16, 0.05)
    a1.leftEyeOpenPosition = UDim2.fromScale(0.33, 0.42)
    a1.rightEyeOpenPosition = UDim2.fromScale(0.67, 0.42)
    a1.leftEyeClosedPosition = UDim2.fromScale(0.33, 0.42)
    a1.rightEyeClosedPosition = UDim2.fromScale(0.67, 0.42)
    a1.leftShineOpenPosition = UDim2.fromScale(0.31, 0.39)
    a1.rightShineOpenPosition = UDim2.fromScale(0.69, 0.39)
    a1.hasEyeWhites = false
    a1.hasEyeShines = false
    a1.eyesClosed = false
    a1.pupilOffsetX = 0
    a1.pupilOffsetY = 0
    a1.billboard = a2
    a1.leftCheek = makeFeature_upv_1(a2, 2)
    a1.rightCheek = makeFeature_upv_1(a2, 2)
    a1.leftEyeWhite = makeFeature_upv_1(a2, 3)
    a1.rightEyeWhite = makeFeature_upv_1(a2, 3)
    a1.mouth = makeFeature_upv_1(a2, 3)
    a1.mouthDetail = makeFeature_upv_1(a2, 4)
    a1.leftEye = makeFeature_upv_1(a2, 5)
    a1.rightEye = makeFeature_upv_1(a2, 5)
    a1.leftBrow = makeFeature_upv_1(a2, 6)
    a1.rightBrow = makeFeature_upv_1(a2, 6)
    local tbl_4 = {}
    table.insert(tbl_4, (makeFeature_upv_1(a2, 6)))
    table.insert(tbl_4, (makeFeature_upv_1(a2, 6)))
    table.insert(tbl_4, (makeFeature_upv_1(a2, 6)))
    table.insert(tbl_4, (makeFeature_upv_1(a2, 6)))
    a1.extras = tbl_4
    a1.leftShine = makeFeature_upv_1(a2, 7)
    a1.rightShine = makeFeature_upv_1(a2, 7)
end
u5.apply = function(a1, a2, a3, a4)
    --[[
      name: apply
      line: 145
      upvalues:
        applyPose_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u1 (copy, index: 3)
        u3 (copy, index: 4)
        u4 (copy, index: 5)
    ]]
    local v9 = a2.scale
    if v9 == nil then
        v9 = 1
    end
    local v10 = a3 * v9
    a1.billboard.Size = UDim2.fromScale(v10, v10)
    a1.billboard.StudsOffset = Vector3.new(0, 0, a4)
    applyPose_upv_1(a1.leftEyeWhite, a2.eyeWhite, "authored", u2)
    applyPose_upv_1(a1.rightEyeWhite, a2.eyeWhite, "mirrored", u2)
    applyPose_upv_1(a1.leftEye, a2.eye, "authored", u1)
    applyPose_upv_1(a1.rightEye, a2.eye, "mirrored", u1)
    applyPose_upv_1(a1.leftShine, a2.eyeShine, "authored", u3)
    applyPose_upv_1(a1.rightShine, a2.eyeShine, "mirrored", u3)
    applyPose_upv_1(a1.leftBrow, a2.brow, "authored", u1)
    applyPose_upv_1(a1.rightBrow, a2.brow, "mirrored", u1)
    applyPose_upv_1(a1.leftCheek, a2.cheek, "authored", u4)
    applyPose_upv_1(a1.rightCheek, a2.cheek, "mirrored", u4)
    applyPose_upv_1(a1.mouth, a2.mouth, "authored", u1)
    applyPose_upv_1(a1.mouthDetail, a2.mouthDetail, "authored", u1)
    local extras_1 = a2.extras
    local v11 = nil
    for n_1 = 0, #a1.extras - 1 do
        if extras_1 == nil then
            v11 = nil
        else
            v11 = extras_1[n_1 + 1]
        end
        applyPose_upv_1(a1.extras[n_1 + 1], v11, "authored", u1)
    end
    local v12 = a2.eyeWhite or (a2.eye)
    a1.eyeOpenSize = UDim2.fromScale(a2.eye.width, a2.eye.height)
    a1.leftEyeOpenPosition = UDim2.fromScale(a2.eye.x, a2.eye.y)
    a1.rightEyeOpenPosition = UDim2.fromScale(1 - a2.eye.x, a2.eye.y)
    a1.eyeClosedSize = UDim2.fromScale(v12.width * 1.1, 0.05)
    a1.leftEyeClosedPosition = UDim2.fromScale(v12.x, v12.y)
    a1.rightEyeClosedPosition = UDim2.fromScale(1 - v12.x, v12.y)
    local eyeShine_1 = a2.eyeShine
    if eyeShine_1 ~= nil then
        a1.leftShineOpenPosition = UDim2.fromScale(eyeShine_1.x, eyeShine_1.y)
        a1.rightShineOpenPosition = UDim2.fromScale(1 - eyeShine_1.x, eyeShine_1.y)
    end
    a1.hasEyeWhites = a2.eyeWhite ~= nil
    a1.hasEyeShines = eyeShine_1 ~= nil
    a1.eyesClosed = false
    a1.pupilOffsetX = 0
    a1.pupilOffsetY = 0
end
u5.setEyesClosed = function(a1, a2)
    --[[
      name: setEyesClosed
      line: 194
    ]]
    if a2 ~= a1.eyesClosed then
        a1.eyesClosed = a2
        if a2 then
            a1.leftEye.frame.Size = a1.eyeClosedSize
            a1.rightEye.frame.Size = a1.eyeClosedSize
            a1.leftEye.frame.Position = a1.leftEyeClosedPosition
            a1.rightEye.frame.Position = a1.rightEyeClosedPosition
            if a1.hasEyeWhites then
                a1.leftEyeWhite.frame.Visible = false
                a1.rightEyeWhite.frame.Visible = false
            end
            if a1.hasEyeShines then
                a1.leftShine.frame.Visible = false
                a1.rightShine.frame.Visible = false
            end
            return nil
        end
        a1:writeGlance()
        if a1.hasEyeWhites then
            a1.leftEyeWhite.frame.Visible = true
            a1.rightEyeWhite.frame.Visible = true
        end
        if a1.hasEyeShines then
            a1.leftShine.frame.Visible = true
            a1.rightShine.frame.Visible = true
        end
    else
        return nil
    end
end
u5.setPupilOffset = function(a1, a2, a3)
    --[[
      name: setPupilOffset
      line: 224
    ]]
    if math.abs(a2 - a1.pupilOffsetX) < 0.002 and math.abs(a3 - a1.pupilOffsetY) < 0.002 then
        return nil
    end
    a1.pupilOffsetX = a2
    a1.pupilOffsetY = a3
    if a1.eyesClosed then
        return nil
    end
    a1:writeGlance()
end
u5.writeGlance = function(a1)
    --[[
      name: writeGlance
      line: 235
    ]]
    local v13 = UDim2.fromScale(a1.pupilOffsetX, a1.pupilOffsetY)
    a1.leftEye.frame.Size = a1.eyeOpenSize
    a1.rightEye.frame.Size = a1.eyeOpenSize
    a1.leftEye.frame.Position = a1.leftEyeOpenPosition + v13
    a1.rightEye.frame.Position = a1.rightEyeOpenPosition + v13
    if a1.hasEyeShines then
        a1.leftShine.frame.Position = a1.leftShineOpenPosition + v13
        a1.rightShine.frame.Position = a1.rightShineOpenPosition + v13
    else
        return nil
    end
end
local tbl_5 = {}
tbl_5.FACE_INK_COLOR = u1
tbl_5.FACE_EYE_WHITE_COLOR = u2
tbl_5.FACE_SHINE_COLOR = u3
tbl_5.FACE_BLUSH_COLOR = u4
tbl_5.FACE_TONGUE_COLOR = v1
tbl_5.FACE_TEETH_COLOR = v2
tbl_5.BillboardFace = u5
return tbl_5