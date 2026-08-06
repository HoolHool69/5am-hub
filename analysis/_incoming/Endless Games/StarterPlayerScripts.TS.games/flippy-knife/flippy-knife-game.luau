-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local pausedAtom_upv_1 = v2.pausedAtom
local publishCombo_upv_1 = v2.publishCombo
local isTouchDevice_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-input-device").isTouchDevice
local FLIPPY_KNIFE_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "flippy-knife-config").FLIPPY_KNIFE_CONFIG
local v3 = RuntimeLib_1.import(script, script.Parent, "flippy-knife-sim")
local bladeTipY_upv_1 = v3.bladeTipY
local evaluateContact_upv_1 = v3.evaluateContact
local flipScore_upv_1 = v3.flipScore
local launchFromPull_upv_1 = v3.launchFromPull
local normalizeDegrees_upv_1 = v3.normalizeDegrees
local stepKnife_upv_1 = v3.stepKnife
local u1 = CFrame.new(0, -1000, 0)
local u2 = FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY + FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds - FLIPPY_KNIFE_CONFIG_upv_1.restTipDepthStuds
local u3 = math.max(math.round((FLIPPY_KNIFE_CONFIG_upv_1.previewSeconds / FLIPPY_KNIFE_CONFIG_upv_1.previewDots) / 0.008333333333333333), 1)
local u4 = math.tan(math.rad(FLIPPY_KNIFE_CONFIG_upv_1.cameraPitchDegrees))
local function depthCompensatedY_1(a1, a2)
    --[[
      name: depthCompensatedY
      line: 109
      upvalues:
        u4 (copy, index: 1)
    ]]
    return a1 + (a2 * u4)
end
local u5 = Color3.fromRGB(92, 174, 224)
local u6 = Color3.fromRGB(252, 253, 255)
local u7 = Color3.fromRGB(132, 158, 186)
local u8 = Color3.fromRGB(126, 118, 154)
local u9 = Color3.fromRGB(74, 116, 96)
local u10 = Color3.fromRGB(52, 92, 76)
local u11 = Color3.fromRGB(104, 158, 96)
local u12 = Color3.fromRGB(126, 205, 92)
local u13 = Color3.fromRGB(104, 176, 76)
local u14 = Color3.fromRGB(186, 128, 72)
local u15 = Color3.fromRGB(140, 92, 54)
local u16 = Color3.fromRGB(150, 88, 56)
local u17 = Color3.fromRGB(232, 196, 120)
local u18 = Color3.fromRGB(206, 158, 78)
local u19 = Color3.fromRGB(214, 220, 230)
local u20 = Color3.fromRGB(246, 250, 255)
local u21 = Color3.fromRGB(216, 126, 48)
local u22 = Color3.fromRGB(158, 84, 32)
local u23 = Color3.fromRGB(150, 152, 162)
local u24 = Color3.fromRGB(255, 236, 168)
local tbl_upv_1 = {u24, Color3.fromRGB(255, 158, 62), Color3.fromRGB(255, 86, 116)}
local u25 = Color3.fromRGB(58, 124, 236)
local u26 = Color3.fromRGB(54, 62, 86)
local u27 = Color3.fromRGB(255, 216, 102)
local u28 = Color3.fromRGB(255, 92, 80)
local u29 = Color3.fromRGB(255, 168, 72)
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
tbl_upv_5.speedPerPullStud = FLIPPY_KNIFE_CONFIG_upv_1.speedPerPullStud
tbl_upv_5.maxSpeed = FLIPPY_KNIFE_CONFIG_upv_1.maxSpeed
tbl_upv_5.baseSpinDegreesPerSecond = FLIPPY_KNIFE_CONFIG_upv_1.baseSpinDegreesPerSecond
tbl_upv_5.spinPerSpeedStud = FLIPPY_KNIFE_CONFIG_upv_1.spinPerSpeedStud
tbl_upv_5.maxTiltDegrees = FLIPPY_KNIFE_CONFIG_upv_1.maxTiltDegrees
tbl_upv_5.minSpinDegreesPerSecond = FLIPPY_KNIFE_CONFIG_upv_1.minSpinDegreesPerSecond
tbl_upv_5.maxSpinDegreesPerSecond = FLIPPY_KNIFE_CONFIG_upv_1.maxSpinDegreesPerSecond
tbl_upv_5.lateralLaunchFraction = FLIPPY_KNIFE_CONFIG_upv_1.lateralLaunchFraction
local tbl_upv_6 = {}
tbl_upv_6.tipOffsetStuds = FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds
tbl_upv_6.stickAngleToleranceDegrees = FLIPPY_KNIFE_CONFIG_upv_1.stickAngleToleranceDegrees
tbl_upv_6.minFlipDegrees = FLIPPY_KNIFE_CONFIG_upv_1.minFlipDegrees
local tbl_7 = {}
local tbl_8 = {}
tbl_8.__tostring = function()
    --[[
      name: __tostring
      line: 245
    ]]
    return "FlippyKnifeGame"
end
tbl_8.__index = BaseWorldGame_upv_1
local u30 = setmetatable(tbl_7, tbl_8)
u30.__index = u30
u30.new = function(...)
    --[[
      name: new
      line: 251
      upvalues:
        u30 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u30)
    return v4:constructor(...) or v4
end
u30.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 255
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.score = 0
    a1.lives = FLIPPY_KNIFE_CONFIG_upv_1.livesPerRun
    a1.phase = "ready"
    a1.sticks = 0
    a1.bestStreak = 0
    a1.streak = 0
    a1.comboRemaining = 0
    a1.roundToken = 0
    a1.phaseClock = 0
    a1.knife = {angleDegrees = FLIPPY_KNIFE_CONFIG_upv_1.restAngleDegrees}
    a1.previewKnife = {angleDegrees = FLIPPY_KNIFE_CONFIG_upv_1.restAngleDegrees}
    a1.renderPreviousX = 0
    a1.renderPreviousY = 0
    a1.renderPreviousAngle = FLIPPY_KNIFE_CONFIG_upv_1.restAngleDegrees
    a1.previewFlips = 0
    a1.aimSource = "none"
    a1.aimX = 0
    a1.aimY = 0
    a1.pointerOriginX = 0
    a1.pointerOriginY = 0
    a1.previewDots = {}
    a1.heartParts = {}
end
u30.buildScene = function(a1)
    --[[
      name: buildScene
      line: 296
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u5 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u24 (copy, index: 5)
        u1 (copy, index: 6)
        makeStagePart_upv_1 (copy, index: 7)
        u25 (copy, index: 8)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 9)
        u17 (copy, index: 10)
        u18 (copy, index: 11)
        PopupTextPool_upv_1 (copy, index: 12)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.stage.setFrameWidthFloor(FLIPPY_KNIFE_CONFIG_upv_1.frameWidthFloorStuds)
    a1.stage.setFramePitch((math.rad(FLIPPY_KNIFE_CONFIG_upv_1.cameraPitchDegrees)))
    a1.stage.setFrameCenter(Vector2.new(0, FLIPPY_KNIFE_CONFIG_upv_1.frameCenterY))
    a1.stump = {topY = FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY, halfWidth = FLIPPY_KNIFE_CONFIG_upv_1.stumpHalfWidthStuds}
    local v5 = makeFrontalBackdrop_upv_1(a1.stage, u5, Enum.Material.SmoothPlastic)
    v5.CFrame = CFrame.new(origin_1 + Vector3.new(0, 0, -30))
    a1:buildBackdropBands(container_1, origin_1)
    a1:buildStump(container_1, origin_1)
    a1:buildBaseProps(container_1, origin_1)
    a1:buildBlade(container_1)
    for _ = 0, FLIPPY_KNIFE_CONFIG_upv_1.previewDots - 1 do
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Size = Vector3.new(FLIPPY_KNIFE_CONFIG_upv_1.previewDotSize, FLIPPY_KNIFE_CONFIG_upv_1.previewDotSize, FLIPPY_KNIFE_CONFIG_upv_1.previewDotSize)
        v6.Color = u24
        v6.Transparency = 1
        v6.CFrame = u1
        table.insert(a1.previewDots, v6)
    end
    for _ = 0, FLIPPY_KNIFE_CONFIG_upv_1.livesPerRun - 1 do
        local v7 = makeStagePart_upv_1(container_1)
        v7.Size = Vector3.new(1.100000023841858, 1.100000023841858, 1.100000023841858)
        v7.Color = u25
        v7.CFrame = u1
        table.insert(a1.heartParts, v7)
    end
    a1:layoutHearts()
    a1.chipAnchor = makeSmoothPart_upv_1(container_1)
    a1.chipAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.chipAnchor.Transparency = 1
    a1.chipAnchor.CFrame = u1
    a1.chipBurst = Instance.new("ParticleEmitter")
    a1.chipBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.chipBurst.Rate = 0
    a1.chipBurst.Lifetime = NumberRange.new(0.28, 0.5)
    a1.chipBurst.Speed = NumberRange.new(7, 15)
    a1.chipBurst.SpreadAngle = Vector2.new(180, 180)
    a1.chipBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.42), NumberSequenceKeypoint.new(1, 0.1)})
    a1.chipBurst.Color = ColorSequence.new(u17, u18)
    a1.chipBurst.Parent = a1.chipAnchor
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1:connectInput()
end
u30.buildBackdropBands = function(a1, a2, a3)
    --[[
      name: buildBackdropBands
      line: 352
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
        u4 (copy, index: 4)
        u8 (copy, index: 5)
        u7 (copy, index: 6)
        u9 (copy, index: 7)
        u10 (copy, index: 8)
        u11 (copy, index: 9)
        makeStagePart_upv_1 (copy, index: 10)
        u12 (copy, index: 11)
        u13 (copy, index: 12)
    ]]
    local v8 = FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY - FLIPPY_KNIFE_CONFIG_upv_1.stumpHeightStuds
    local tbl_9 = {-34, -13, 15, 32}
    local tbl_10 = {15, 19.5, 16.5, 20.5}
    local tbl_11 = {Vector3.new(10, 1.899999976158142, 1), Vector3.new(4.599999904632568, 3.700000047683716, 1), Vector3.new(3.0999999046325684, 2.700000047683716, 1), Vector3.new(2.5999999046325684, 2.299999952316284, 1)}
    local tbl_12 = {Vector2.new(0, 0), Vector2.new(-0.4, 1.1), Vector2.new(3, 0.6), Vector2.new(-3.6, 0.4)}
    for n_1 = 0, #tbl_9 - 1 do
        local v9 = tbl_9[n_1 + 1]
        local v10 = tbl_10[n_1 + 1]
        for n_2 = 0, #tbl_11 - 1 do
            local v11 = makeSmoothPart_upv_1(a2)
            v11.Size = tbl_11[n_2 + 1]
            v11.Color = u6
            v11.CFrame = CFrame.new(a3 + Vector3.new(v9 + tbl_12[n_2 + 1].X, (v10 + tbl_12[n_2 + 1].Y) + (-28 * u4), -28))
        end
    end
    local tbl_13 = {-31, -19, -6, 11, 25, 36}
    local tbl_14 = {15, 23, 13, 19, 27, 14}
    local v12 = nil
    for v13 = 0, #tbl_13 - 1 do
        local v14 = tbl_14[v13 + 1]
        local v15 = makeSmoothPart_upv_1(a2)
        v15.Size = Vector3.new(v14, v14, 1)
        if v13 ~= 1 then
            v12 = u7
        else
            v12 = u8
        end
        v15.Color = v12
        local v16 = (((v13 ~= 1) and 0) or 1) + -26
        v15.CFrame = CFrame.new(a3 + Vector3.new(tbl_13[v13 + 1], (v8 + 5) + (v16 * u4), v16)) * CFrame.Angles(0, 0, 0.7853981633974483)
    end
    local v17 = makeSmoothPart_upv_1(a2)
    v17.Size = Vector3.new(260, 40, 1)
    v17.Color = u9
    v17.CFrame = CFrame.new(a3 + Vector3.new(0, (v8 - 11) + (-22 * u4), -22))
    local v13 = {-38, -18, -4, 9, 24, 40}
    for n_3 = 0, #v13 - 1 do
        local v18 = (n_3 % 3) * 11 + 26
        local v19 = makeSmoothPart_upv_1(a2)
        v19.Shape = Enum.PartType.Cylinder
        v19.Size = Vector3.new(1, v18, v18)
        v19.Color = u9
        v19.CFrame = CFrame.new(a3 + Vector3.new(v13[n_3 + 1], ((v8 + 8) - (v18 / 2)) + (-21.5 * u4), -21.5)) * CFrame.Angles(0, 1.5707963267948966, 0)
    end
    local tbl_15 = {-42, -35, -29, -23, -16, 14, 20, 25, 30, 35, 41}
    for n_4 = 0, #tbl_15 - 1 do
        local v20 = (n_4 % 3) * 1 + 5.5
        local v21 = makeSmoothPart_upv_1(a2)
        v21.Size = Vector3.new(v20, v20, 1)
        v21.Color = u10
        v21.CFrame = CFrame.new(a3 + Vector3.new(tbl_15[n_4 + 1], ((v8 + 3) + (v20 * 0.707)) + (-21 * u4), -21)) * CFrame.Angles(0, 0, 0.7853981633974483)
    end
    for n_5 = 0, 3 do
        local v22 = makeSmoothPart_upv_1(a2)
        v22.Shape = Enum.PartType.Cylinder
        local v23 = (n_5 % 2) * 10 + 26
        v22.Size = Vector3.new(1, v23, v23)
        v22.Color = u11
        v22.CFrame = CFrame.new(a3 + Vector3.new((n_5 * 23) + -34, (v8 - (v23 * 0.38)) + (-14 * u4), -14)) * CFrame.Angles(0, 1.5707963267948966, 0)
    end
    local v24 = makeStagePart_upv_1(a2)
    v24.Size = Vector3.new(220, 4, 34)
    v24.Color = u12
    v24.CFrame = CFrame.new(a3 + Vector3.new(0, v8 - 2, 3))
    local v25 = makeStagePart_upv_1(a2)
    v25.Size = Vector3.new(220, 4.400000095367432, 0.5)
    v25.Color = u13
    v25.CFrame = CFrame.new(a3 + Vector3.new(0, v8 - 2.3, 20.3))
end
u30.buildBaseProps = function(a1, a2, a3)
    --[[
      name: buildBaseProps
      line: 470
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u14 (copy, index: 3)
        u15 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u16 (copy, index: 6)
    ]]
    local v26 = FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY - FLIPPY_KNIFE_CONFIG_upv_1.stumpHeightStuds
    local tbl_16 = {-1, 1}
    local v27, v28 = nil, nil
    for n_6 = 0, #tbl_16 - 1 do
        local v29 = tbl_16[n_6 + 1]
        local v30 = n_6 * 1.1 + 3.4
        local v31 = makeStagePart_upv_1(a2)
        v31.Size = Vector3.new(4.6, v30, 4.2)
        if n_6 ~= 0 then
            v27 = u15
        else
            v27 = u14
        end
        v31.Color = v27
        v31.CFrame = CFrame.new(a3 + Vector3.new(v29 * (FLIPPY_KNIFE_CONFIG_upv_1.stumpHalfWidthStuds + 6.4), (v26 + (v30 / 2)) - 0.2, 5.5))
        local v32 = makeStagePart_upv_1(a2)
        v32.Size = Vector3.new(3, 2.200000047683716, 3)
        if n_6 ~= 0 then
            v28 = u14
        else
            v28 = u15
        end
        v32.Color = v28
        v32.CFrame = CFrame.new(a3 + Vector3.new(v29 * (FLIPPY_KNIFE_CONFIG_upv_1.stumpHalfWidthStuds + 3.4), v26 + 0.9, -7.5))
        local v33 = makeSmoothPart_upv_1(a2)
        v33.Shape = Enum.PartType.Cylinder
        v33.Size = Vector3.new(7.5, 2.4000000953674316, 2.4000000953674316)
        v33.Color = u16
        v33.CFrame = CFrame.new(a3 + Vector3.new(v29 * (FLIPPY_KNIFE_CONFIG_upv_1.stumpHalfWidthStuds + 13.5), v26 + 1, 2))
    end
end
u30.buildStump = function(a1, a2, a3)
    --[[
      name: buildStump
      line: 501
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u17 (copy, index: 5)
        u18 (copy, index: 6)
    ]]
    local v34 = FLIPPY_KNIFE_CONFIG_upv_1.stumpHalfWidthStuds * 2
    local v35 = FLIPPY_KNIFE_CONFIG_upv_1.stumpHeightStuds + 0.5
    local v36 = makeStagePart_upv_1(a2)
    v36.Size = Vector3.new(v34, v35, 11)
    v36.Color = u16
    v36.CFrame = CFrame.new(a3 + Vector3.new(0, FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY - (v35 / 2), 0))
    local v37 = makeSmoothPart_upv_1(a2)
    v37.Size = Vector3.new(v34 + 0.7, 0.5, 11.7)
    v37.Color = u17
    v37.CFrame = CFrame.new(a3 + Vector3.new(0, FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY - 0.2, 0))
    local v38 = nil
    for n_7 = 0, 2 do
        local v39 = n_7 * 1.5 + 1.5
        local v40 = makeSmoothPart_upv_1(a2)
        v40.Size = Vector3.new(v34 - (v39 * 2), 0.1, 11 - (v39 * 1.3))
        if n_7 % 2 ~= 0 then
            v38 = u17
        else
            v38 = u18
        end
        v40.Color = v38
        v40.CFrame = CFrame.new(a3 + Vector3.new(0, (FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY + 0.12) + (n_7 * 0.12), 0))
    end
end
u30.buildBlade = function(a1, a2)
    --[[
      name: buildBlade
      line: 535
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u19 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u20 (copy, index: 5)
        u23 (copy, index: 6)
        u21 (copy, index: 7)
        u22 (copy, index: 8)
    ]]
    a1.bladeModel = Instance.new("Model")
    local v41 = FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds * 2 - FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds
    local v42 = makeStagePart_upv_1(a1.bladeModel)
    v42.Size = Vector3.new(FLIPPY_KNIFE_CONFIG_upv_1.bladeWidthStuds, v41, 0.55)
    v42.Color = u19
    v42.CFrame = CFrame.new(0, -FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds / 2, 0)
    v42.PivotOffset = CFrame.new(0, FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds / 2, 0)
    a1.bladeModel.PrimaryPart = v42
    local v43 = makeSmoothPart_upv_1(a1.bladeModel)
    v43.Size = Vector3.new(FLIPPY_KNIFE_CONFIG_upv_1.bladeWidthStuds * 0.34, v41 * 0.92, 0.58)
    v43.Color = u20
    v43.CFrame = CFrame.new(-FLIPPY_KNIFE_CONFIG_upv_1.bladeWidthStuds * 0.3, -FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds / 2, 0)
    local v44 = makeSmoothPart_upv_1(a1.bladeModel)
    v44.Size = Vector3.new(FLIPPY_KNIFE_CONFIG_upv_1.handleWidthStuds * 1.6, 0.34, 0.95)
    v44.Color = u23
    v44.CFrame = CFrame.new(0, FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds - FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds, 0)
    local v45 = makeStagePart_upv_1(a1.bladeModel)
    v45.Size = Vector3.new(FLIPPY_KNIFE_CONFIG_upv_1.handleWidthStuds, FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds, 0.9)
    v45.Color = u21
    v45.CFrame = CFrame.new(0, FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds - (FLIPPY_KNIFE_CONFIG_upv_1.handleLengthStuds / 2), 0)
    local v46 = makeSmoothPart_upv_1(a1.bladeModel)
    v46.Size = Vector3.new(FLIPPY_KNIFE_CONFIG_upv_1.handleWidthStuds * 1.15, 0.5, 1)
    v46.Color = u22
    v46.CFrame = CFrame.new(0, FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds - 0.25, 0)
    a1.bladeModel.Parent = a2
end
u30.connectInput = function(a1)
    --[[
      name: connectInput
      line: 565
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        pausedAtom_upv_1 (copy, index: 2)
    ]]
    local input_1 = a1.context.input
    a1.context.janitor:Add(
        input_1.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 567
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "key" then
                    a1:beginPointerAim(a2)
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        input_1.drag:Connect(
            function(a4, a5)
                --[[
                  line: 573
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a1.aimSource == "pointer" then
                    a1:setAimFromPointer(a5)
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        input_1.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 579
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a8 ~= "key" and a1.aimSource == "pointer" then
                    a1:setAimFromPointer(a6)
                    a1:throwBlade()
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function()
                --[[
                  line: 594
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:cancelAim()
            end
        )
    )
end
u30.beginPointerAim = function(a1, a2)
    --[[
      name: beginPointerAim
      line: 598
    ]]
    if a1.phase == "ready" and a1.aimSource == "none" then
        a1.aimSource = "pointer"
        a1.pointerOriginX = a2.X
        a1.pointerOriginY = a2.Y
        a1.aimX = 0
        a1.aimY = 0
    else
        return nil
    end
end
u30.setAimFromPointer = function(a1, a2)
    --[[
      name: setAimFromPointer
      line: 608
    ]]
    local v47 = math.max(a1.stage.camera.ViewportSize.Y, 1)
    local v48 = a1.stage.getVisibleHeight() / v47
    a1:setAim((a2.X - a1.pointerOriginX) * v48, -(a2.Y - a1.pointerOriginY) * v48)
end
u30.setAim = function(a1, a2, a3)
    --[[
      name: setAim
      line: 614
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v49 = math.sqrt((a2 * a2) + (a3 * a3))
    if v49 > FLIPPY_KNIFE_CONFIG_upv_1.dragMaxStuds and v49 >= 1e-04 then
        local v50 = FLIPPY_KNIFE_CONFIG_upv_1.dragMaxStuds / v49
        a1.aimX = a2 * v50
        a1.aimY = a3 * v50
    else
        a1.aimX = a2
        a1.aimY = a3
        return nil
    end
end
u30.cancelAim = function(a1)
    --[[
      name: cancelAim
      line: 625
    ]]
    a1.aimSource = "none"
    a1.aimX = 0
    a1.aimY = 0
end
u30.aimLength = function(a1)
    --[[
      name: aimLength
      line: 630
    ]]
    return (math.sqrt((a1.aimX * a1.aimX) + (a1.aimY * a1.aimY)))
end
u30.minDragStuds = function(a1)
    --[[
      name: minDragStuds
      line: 633
      upvalues:
        isTouchDevice_upv_1 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
    ]]
    if isTouchDevice_upv_1() then
        return FLIPPY_KNIFE_CONFIG_upv_1.minDragStudsTouch
    end
    return FLIPPY_KNIFE_CONFIG_upv_1.minDragStuds
end
u30.pollGamepad = function(a1)
    --[[
      name: pollGamepad
      line: 636
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
    ]]
    if gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA) then
        if a1.aimSource == "none" and a1.phase == "ready" then
            a1.aimSource = "gamepad"
        end
        if a1.aimSource == "gamepad" then
            a1:setAim(gamepadInput_upv_1:leftX() * FLIPPY_KNIFE_CONFIG_upv_1.dragMaxStuds, gamepadInput_upv_1:leftY() * FLIPPY_KNIFE_CONFIG_upv_1.dragMaxStuds)
        end
        return nil
    elseif a1.aimSource == "gamepad" then
        a1:throwBlade()
    end
end
u30.throwBlade = function(a1)
    --[[
      name: throwBlade
      line: 654
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        launchFromPull_upv_1 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
        u2 (copy, index: 4)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 5)
    ]]
    local aimX_1 = a1.aimX
    local aimY_1 = a1.aimY
    local v51 = a1:aimLength()
    a1:cancelAim()
    a1:parkPreviewDots()
    if a1.phase == "ready" and not (pausedAtom_upv_1()) then
        if v51 >= a1:minDragStuds() then
            local v52 = launchFromPull_upv_1(aimX_1, aimY_1, tbl_upv_5)
            a1.knife.x = a1.stump.centerX
            a1.knife.y = u2
            a1.knife.velocityX = v52.velocityX
            a1.knife.velocityY = v52.velocityY
            a1.knife.angleDegrees = FLIPPY_KNIFE_CONFIG_upv_1.restAngleDegrees
            a1.knife.spinDegreesPerSecond = v52.spinDegreesPerSecond
            a1.knife.totalSpinDegrees = 0
            a1.renderPreviousX = a1.knife.x
            a1.renderPreviousY = a1.knife.y
            a1.renderPreviousAngle = a1.knife.angleDegrees
            a1.phase = "flying"
            a1.phaseClock = 0
            a1.context.audio.play("whoosh", {})
            return
        end
        return nil
    end
    return nil
end
u30.resetRound = function(a1)
    --[[
      name: resetRound
      line: 687
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.score = 0
    a1.lives = FLIPPY_KNIFE_CONFIG_upv_1.livesPerRun
    a1.sticks = 0
    a1.streak = 0
    a1.bestStreak = 0
    a1.comboRemaining = 0
    a1:cancelAim()
    a1:parkPreviewDots()
    a1:rackBlade()
    a1:updateHearts()
    a1.popups:hideAll()
    a1.context.reportScore(0)
end
u30.rackBlade = function(a1)
    --[[
      name: rackBlade
      line: 702
      upvalues:
        u2 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.phase = "ready"
    a1.phaseClock = 0
    a1.knife.x = a1.stump.centerX
    a1.knife.y = u2
    a1.knife.velocityX = 0
    a1.knife.velocityY = 0
    a1.knife.angleDegrees = FLIPPY_KNIFE_CONFIG_upv_1.restAngleDegrees
    a1.knife.spinDegreesPerSecond = 0
    a1.knife.totalSpinDegrees = 0
    a1.renderPreviousX = a1.knife.x
    a1.renderPreviousY = a1.knife.y
    a1.renderPreviousAngle = a1.knife.angleDegrees
end
u30.revive = function(a1)
    --[[
      name: revive
      line: 716
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = FLIPPY_KNIFE_CONFIG_upv_1.livesPerRun
    a1.streak = 0
    a1.comboRemaining = 0
    a1:cancelAim()
    a1:rackBlade()
    a1:updateHearts()
    a1:setRunning(true)
end
u30.captureRound = function(a1)
    --[[
      name: captureRound
      line: 726
    ]]
    return nil
end
u30.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 729
    ]]
    return false
end
u30.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 732
      upvalues:
        bladeTipY_upv_1 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
        stepKnife_upv_1 (copy, index: 3)
        evaluateContact_upv_1 (copy, index: 4)
        tbl_upv_6 (copy, index: 5)
    ]]
    a1:pollGamepad()
    if a1.comboRemaining > 0 then
        a1.comboRemaining = math.max(a1.comboRemaining - a2, 0)
    end
    a1.phaseClock = a1.phaseClock + a2
    local v53 = nil
    if a1.phase ~= "flying" then
        if a1.phase == "stuck" and FLIPPY_KNIFE_CONFIG_upv_1.stickResetSeconds <= a1.phaseClock then
            a1:rackBlade()
            return nil
        end
        if a1.phase == "lost" then
            a1.renderPreviousX = a1.knife.x
            a1.renderPreviousY = a1.knife.y
            a1.renderPreviousAngle = a1.knife.angleDegrees
            local knife_1 = a1.knife
            knife_1.velocityY = knife_1.velocityY + (FLIPPY_KNIFE_CONFIG_upv_1.gravity * a2)
            local knife_2 = a1.knife
            knife_2.x = knife_2.x + (a1.knife.velocityX * a2)
            local knife_3 = a1.knife
            knife_3.y = knife_3.y + (a1.knife.velocityY * a2)
            local knife_4 = a1.knife
            knife_4.angleDegrees = knife_4.angleDegrees + (FLIPPY_KNIFE_CONFIG_upv_1.missTumbleDegreesPerSecond * a2)
            if FLIPPY_KNIFE_CONFIG_upv_1.missResetSeconds <= a1.phaseClock and a1.lives > 0 then
                a1:rackBlade()
            end
        end
    else
        a1.renderPreviousX = a1.knife.x
        a1.renderPreviousY = a1.knife.y
        a1.renderPreviousAngle = a1.knife.angleDegrees
        local v54 = bladeTipY_upv_1(a1.knife, FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds)
        stepKnife_upv_1(a1.knife, FLIPPY_KNIFE_CONFIG_upv_1.gravity, a2)
        v53 = evaluateContact_upv_1(a1.knife, v54, a1.stump, tbl_upv_6)
        if v53 ~= "none" then
            a1:resolveThrow(v53)
        end
        return nil
    end
end
u30.resolveThrow = function(a1, a2)
    --[[
      name: resolveThrow
      line: 768
    ]]
    if a2 == "stick" then
        a1:landStick()
        return nil
    elseif a2 ~= "none" then
        a1:loseBlade(a2)
    else
        return nil
    end
end
u30.landStick = function(a1)
    --[[
      name: landStick
      line: 778
      upvalues:
        flipScore_upv_1 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
        u27 (copy, index: 3)
        u29 (copy, index: 4)
        publishCombo_upv_1 (copy, index: 5)
    ]]
    local v55 = flipScore_upv_1(a1.knife.totalSpinDegrees)
    local v56 = v55 * (((a1.comboRemaining <= 0) and 1) or (FLIPPY_KNIFE_CONFIG_upv_1.comboMultiplier))
    a1.score = a1.score + v56
    a1.sticks = a1.sticks + 1
    a1.streak = a1.streak + 1
    if a1.bestStreak < a1.streak then
        a1.bestStreak = a1.streak
    end
    a1.context.reportScore(a1.score)
    a1.knife.angleDegrees = math.round(a1.knife.angleDegrees / 360) * 360
    a1.knife.velocityX = 0
    a1.knife.velocityY = 0
    a1.knife.spinDegreesPerSecond = 0
    a1.knife.y = a1.stump.topY + (FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds * 0.72)
    a1.renderPreviousX = a1.knife.x
    a1.renderPreviousY = a1.knife.y
    a1.renderPreviousAngle = a1.knife.angleDegrees
    a1.phase = "stuck"
    a1.phaseClock = 0
    local v57 = a1:bladeWorld(a1.knife.x, a1.stump.topY)
    a1.chipAnchor.CFrame = CFrame.new(v57)
    a1.chipBurst:Emit(14)
    a1.stage.shake(FLIPPY_KNIFE_CONFIG_upv_1.stickShake)
    a1:hitStop(FLIPPY_KNIFE_CONFIG_upv_1.stickHitStopSeconds)
    a1.context.audio.play("woodBreak", {})
    a1.popups:show(v57 + Vector3.new(0, 3, 0), ("+%*"):format(v56), u27, 0.95)
    if FLIPPY_KNIFE_CONFIG_upv_1.comboFillLength <= a1.streak and a1.comboRemaining <= 0 then
        a1.comboRemaining = FLIPPY_KNIFE_CONFIG_upv_1.comboBonusSeconds
        a1.popups:show(v57 + Vector3.new(0, 5.400000095367432, 0), "DOUBLE!", u29, 1.1)
        a1.context.audio.play("perfect", {})
    end
    publishCombo_upv_1({count = a1.streak, color = u29})
end
u30.missLabel = function(a1, a2)
    --[[
      name: missLabel
      line: 833
      upvalues:
        tbl_upv_4 (copy, index: 1)
        normalizeDegrees_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        tbl_upv_3 (copy, index: 4)
    ]]
    if a2 then
        if normalizeDegrees_upv_1(a1.knife.angleDegrees) <= 0 then
            return tbl_upv_3
        end
        return tbl_upv_2
    end
    return tbl_upv_4
end
u30.loseBlade = function(a1, a2)
    --[[
      name: loseBlade
      line: 841
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
        u28 (copy, index: 2)
    ]]
    local v58 = a2 == "bounce"
    local v59 = a1:missLabel(v58)
    a1.lives = math.max(a1.lives - 1, 0)
    a1.streak = 0
    a1.comboRemaining = 0
    a1:updateHearts()
    a1.phase = "lost"
    a1.phaseClock = 0
    a1.knife.velocityX = (((a1.stump.centerX > a1.knife.x) and -1) or 1) * 9
    if v58 then
        a1.knife.velocityY = 11
    end
    a1.stage.shake(FLIPPY_KNIFE_CONFIG_upv_1.missShake)
    a1.context.audio.play((v58 and "thud") or "buzz", {})
    a1.popups:show(a1:bladeWorld(a1.knife.x, a1.knife.y) + Vector3.new(0, 2.4000000953674316, 0), v59.text, u28, v59.scale)
    if a1.lives <= 0 then
        a1.context.endRun(a1.score)
    else
        return nil
    end
end
u30.render = function(a1)
    --[[
      name: render
      line: 881
    ]]
    a1:draw()
end
u30.onIdle = function(a1)
    --[[
      name: onIdle
      line: 884
    ]]
    a1:draw()
end
u30.draw = function(a1)
    --[[
      name: draw
      line: 887
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local v60 = lerp_upv_1(a1.renderPreviousX, a1.knife.x, renderAlpha_1)
    local v61 = lerp_upv_1(a1.renderPreviousY, a1.knife.y, renderAlpha_1)
    local v62 = lerp_upv_1(a1.renderPreviousAngle, a1.knife.angleDegrees, renderAlpha_1)
    a1.bladeModel:PivotTo(CFrame.new(a1:bladeWorld(v60, v61)) * CFrame.Angles(0, 0, math.rad(-v62)))
    a1:updatePreview()
end
u30.bladeWorld = function(a1, a2, a3)
    --[[
      name: bladeWorld
      line: 899
    ]]
    return a1.stage.origin + Vector3.new(a2, a3, 0)
end
u30.updatePreview = function(a1)
    --[[
      name: updatePreview
      line: 904
      upvalues:
        launchFromPull_upv_1 (copy, index: 1)
        tbl_upv_5 (copy, index: 2)
        u2 (copy, index: 3)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 4)
        u3 (copy, index: 5)
        stepKnife_upv_1 (copy, index: 6)
        u4 (copy, index: 7)
    ]]
    if a1.aimSource ~= "none" and a1.phase == "ready" and a1:aimLength() >= a1:minDragStuds() then
        local v63 = launchFromPull_upv_1(a1.aimX, a1.aimY, tbl_upv_5)
        a1.previewKnife.x = a1.stump.centerX
        a1.previewKnife.y = u2
        a1.previewKnife.velocityX = v63.velocityX
        a1.previewKnife.velocityY = v63.velocityY
        a1.previewKnife.angleDegrees = FLIPPY_KNIFE_CONFIG_upv_1.restAngleDegrees
        a1.previewKnife.spinDegreesPerSecond = v63.spinDegreesPerSecond
        a1.previewKnife.totalSpinDegrees = 0
        for n_8 = 0, #a1.previewDots - 1 do
            local v64 = 0
            local v65 = false
            while true do
                if v65 then
                    v64 = v64 + 1
                else
                    v65 = true
                end
                if v64 >= u3 then
                    break
                end
                stepKnife_upv_1(a1.previewKnife, FLIPPY_KNIFE_CONFIG_upv_1.gravity, 0.008333333333333333)
            end
            v64 = a1.previewDots[n_8 + 1]
            v64.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.previewKnife.x, a1.previewKnife.y + (6.6 * u4), 6.6))
            v64.Transparency = (n_8 / #a1.previewDots) * 0.7
        end
        a1:dyePreviewDots(a1:predictFlips())
    else
        a1:parkPreviewDots()
        return nil
    end
end
u30.predictFlips = function(a1)
    --[[
      name: predictFlips
      line: 941
      upvalues:
        bladeTipY_upv_1 (copy, index: 1)
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 2)
        stepKnife_upv_1 (copy, index: 3)
        evaluateContact_upv_1 (copy, index: 4)
        tbl_upv_6 (copy, index: 5)
        flipScore_upv_1 (copy, index: 6)
    ]]
    local v66 = 0
    local v67 = false
    v67, v66 = v67, v66
    while true do
        if v67 then
            v66 = v66 + 1
        else
            v67 = true
        end
        local v68
        if v66 >= 300 then
            break
        end
        v68 = bladeTipY_upv_1(a1.previewKnife, FLIPPY_KNIFE_CONFIG_upv_1.tipOffsetStuds)
        stepKnife_upv_1(a1.previewKnife, FLIPPY_KNIFE_CONFIG_upv_1.gravity, 0.008333333333333333)
        if evaluateContact_upv_1(a1.previewKnife, v68, a1.stump, tbl_upv_6) ~= "none" then
            break
        end
    end
    return flipScore_upv_1(a1.previewKnife.totalSpinDegrees)
end
u30.dyePreviewDots = function(a1, a2)
    --[[
      name: dyePreviewDots
      line: 963
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a2 ~= a1.previewFlips then
        a1.previewFlips = a2
        local v69 = tbl_upv_1[math.clamp(a2, 1, #tbl_upv_1)]
        for _, value_1 in a1.previewDots do
            value_1.Color = v69
        end
    else
        return nil
    end
end
u30.parkPreviewDots = function(a1)
    --[[
      name: parkPreviewDots
      line: 973
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_2 in a1.previewDots do
        if value_2.Transparency < 1 then
            value_2.Transparency = 1
            value_2.CFrame = u1
        end
    end
end
u30.layoutHearts = function(a1)
    --[[
      name: layoutHearts
      line: 982
      upvalues:
        FLIPPY_KNIFE_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_2 = a1.stage.origin
    for n_9 = 0, #a1.heartParts - 1 do
        a1.heartParts[n_9 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(((-FLIPPY_KNIFE_CONFIG_upv_1.frameWidthFloorStuds / 2) + 1.6) + (n_9 * 1.5), FLIPPY_KNIFE_CONFIG_upv_1.stumpTopY - 1.2, 0))
    end
end
u30.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 989
      upvalues:
        u25 (copy, index: 1)
        u26 (copy, index: 2)
    ]]
    local v70 = nil
    for n_10 = 0, #a1.heartParts - 1 do
        local v71 = n_10 < a1.lives
        local v72 = a1.heartParts[n_10 + 1]
        if v71 then
            v70 = u25
        else
            v70 = u26
        end
        v72.Color = v70
        a1.heartParts[n_10 + 1].Transparency = (v71 and 0) or 0.45
    end
end
local tbl_17 = {}
tbl_17.FlippyKnifeGame = u30
return tbl_17