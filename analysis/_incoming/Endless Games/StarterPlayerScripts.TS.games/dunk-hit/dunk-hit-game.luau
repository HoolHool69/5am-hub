-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local pausedAtom_upv_1 = v2.pausedAtom
local publishCombo_upv_1 = v2.publishCombo
local DUNK_HIT_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "dunk-hit-config").DUNK_HIT_CONFIG
local v3 = RuntimeLib_1.import(script, script.Parent, "dunk-hit-sim")
local clearPendingFlap_upv_1 = v3.clearPendingFlap
local clockLimitForScore_1 = v3.clockLimitForScore
local hoopCentreXFor_1 = v3.hoopCentreXFor
local makeRunState_upv_1 = v3.makeRunState
local multiplierForStreak_upv_1 = v3.multiplierForStreak
local pressFlap_upv_1 = v3.pressFlap
local resetRun_upv_1 = v3.resetRun
local reviveRun_upv_1 = v3.reviveRun
local stepRun_upv_1 = v3.stepRun
local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
tbl_upv_1.gravity = DUNK_HIT_CONFIG_upv_1.gravity
tbl_upv_1.flapVelocity = DUNK_HIT_CONFIG_upv_1.flapVelocity
tbl_upv_1.terminalVelocity = DUNK_HIT_CONFIG_upv_1.terminalVelocity
tbl_upv_1.ballRadius = DUNK_HIT_CONFIG_upv_1.ballRadius
tbl_upv_1.fieldHalfWidth = DUNK_HIT_CONFIG_upv_1.fieldHalfWidth
tbl_upv_1.floorY = DUNK_HIT_CONFIG_upv_1.floorY
tbl_upv_1.ceilingY = DUNK_HIT_CONFIG_upv_1.ceilingY
tbl_upv_1.floorRestitution = DUNK_HIT_CONFIG_upv_1.floorRestitution
tbl_upv_1.floorRestSpeed = DUNK_HIT_CONFIG_upv_1.floorRestSpeed
tbl_upv_1.wallRestitution = DUNK_HIT_CONFIG_upv_1.wallRestitution
tbl_upv_1.hoopHalfWidthStart = DUNK_HIT_CONFIG_upv_1.hoopHalfWidthStart
tbl_upv_1.hoopHalfWidthFloor = DUNK_HIT_CONFIG_upv_1.hoopHalfWidthFloor
tbl_upv_1.rampDecayScore = DUNK_HIT_CONFIG_upv_1.rampDecayScore
tbl_upv_1.rimKnobRadius = DUNK_HIT_CONFIG_upv_1.rimKnobRadius
tbl_upv_1.rimRestitution = DUNK_HIT_CONFIG_upv_1.rimRestitution
tbl_upv_1.rimTangentKeep = DUNK_HIT_CONFIG_upv_1.rimTangentKeep
tbl_upv_1.netDepth = DUNK_HIT_CONFIG_upv_1.netDepth
tbl_upv_1.pocketSealStuds = DUNK_HIT_CONFIG_upv_1.pocketSealStuds
tbl_upv_1.rimYMin = DUNK_HIT_CONFIG_upv_1.rimYMin
tbl_upv_1.rimYMax = DUNK_HIT_CONFIG_upv_1.rimYMax
tbl_upv_1.rimReachStuds = DUNK_HIT_CONFIG_upv_1.rimReachStuds
tbl_upv_1.bobAmplitudeStart = DUNK_HIT_CONFIG_upv_1.bobAmplitudeStart
tbl_upv_1.bobAmplitudeEnd = DUNK_HIT_CONFIG_upv_1.bobAmplitudeEnd
tbl_upv_1.bobAngularSpeed = DUNK_HIT_CONFIG_upv_1.bobAngularSpeed
tbl_upv_1.bobRampScore = DUNK_HIT_CONFIG_upv_1.bobRampScore
tbl_upv_1.boardBottomOffset = DUNK_HIT_CONFIG_upv_1.boardBottomOffset
tbl_upv_1.boardHeight = DUNK_HIT_CONFIG_upv_1.boardHeight
tbl_upv_1.boardRestitution = DUNK_HIT_CONFIG_upv_1.boardRestitution
tbl_upv_1.minHorizontalSpeed = DUNK_HIT_CONFIG_upv_1.minHorizontalSpeed
tbl_upv_1.maxHorizontalSpeed = DUNK_HIT_CONFIG_upv_1.maxHorizontalSpeed
tbl_upv_1.launchSpeed = DUNK_HIT_CONFIG_upv_1.launchSpeed
tbl_upv_1.clockStartSeconds = DUNK_HIT_CONFIG_upv_1.clockStartSeconds
tbl_upv_1.clockFloorSeconds = DUNK_HIT_CONFIG_upv_1.clockFloorSeconds
tbl_upv_1.clockGrantSeconds = DUNK_HIT_CONFIG_upv_1.clockGrantSeconds
tbl_upv_1.multiplierLadder = DUNK_HIT_CONFIG_upv_1.multiplierLadder
local u2 = Color3.fromRGB(34, 36, 46)
local u3 = Color3.fromRGB(46, 49, 62)
local u4 = Color3.fromRGB(56, 60, 76)
local u5 = Color3.fromRGB(26, 26, 30)
local u6 = Color3.fromRGB(196, 196, 198)
local u7 = Color3.fromRGB(252, 30, 100)
local v4 = Color3.fromRGB(232, 64, 160)
local u8 = Color3.fromRGB(246, 248, 253)
local u9 = Color3.fromRGB(255, 178, 40)
local u10 = Color3.fromRGB(118, 42, 24)
local u11 = Color3.fromRGB(22, 24, 30)
local u12 = Color3.fromRGB(18, 19, 24)
local u13 = Color3.fromRGB(39, 226, 252)
local u14 = Color3.fromRGB(246, 20, 80)
local u15 = Color3.fromRGB(255, 216, 102)
local u16 = Color3.fromRGB(246, 248, 253)
local u17 = Color3.fromRGB(246, 20, 80)
local u18 = Color3.fromRGB(255, 255, 255)
local u19 = Color3.fromRGB(0, 0, 0)
local u20 = Color3.fromRGB(255, 198, 120)
local u21 = DUNK_HIT_CONFIG_upv_1.rimKnobRadius * 2
local u22 = u21 * 1.25
local u23 = DUNK_HIT_CONFIG_upv_1.netDepth * 1.6
local u24 = DUNK_HIT_CONFIG_upv_1.ceilingY - 2.4
local u25 = DUNK_HIT_CONFIG_upv_1.floorY + DUNK_HIT_CONFIG_upv_1.ballRadius
local u26 = DUNK_HIT_CONFIG_upv_1.floorY + 4
local tbl_2 = {0.04, 0.15, 0.18, 0.2, 0.19, 0.14, 0.1}
local tbl_3 = {0.035, 0.115, 0.125, 0.13, 0.13, 0.125, 0.12, 0.13, 0.09}
local tbl_4 = {0.25, 0.25, 0.25, 0.25}
local function buildVoxelRamp_1(a1, a2)
    --[[
      name: buildVoxelRamp
      line: 208
    ]]
    local v5 = 0
    for v6, v7 in a2 do
        v5 = v5 + v7
    end
    local tbl_5 = {}
    local v7, v6, v8
    local v9
    v7, v6, v9, v8 = false, 0, #a1, 0
    while true do
        if v7 then
            v6 = v6 + 1
        else
            v7 = true
        end
        if v6 >= v9 then
            break
        end
        local v10 = a2[v6 + 1] / v5
        local v11 = ((v6 ~= 0) and (v8 + 0.004)) or 0
        local v12 = ((v6 ~= v9 - 1) and (v8 + v10 - 0.004)) or 1
        table.insert(tbl_5, (ColorSequenceKeypoint.new(v11, a1[v6 + 1])))
        table.insert(tbl_5, (ColorSequenceKeypoint.new(v12, a1[v6 + 1])))
        v8 = v8 + v10
    end
    return ColorSequence.new(tbl_5)
end
local tbl_upv_6 = {
    buildVoxelRamp_1({Color3.fromRGB(255, 246, 214), Color3.fromRGB(255, 206, 0), Color3.fromRGB(255, 132, 0), Color3.fromRGB(246, 58, 16), Color3.fromRGB(198, 20, 22), Color3.fromRGB(92, 12, 12), Color3.fromRGB(14, 9, 7)}, tbl_2),
    buildVoxelRamp_1({Color3.fromRGB(228, 250, 255), Color3.fromRGB(48, 226, 255), Color3.fromRGB(0, 178, 255), Color3.fromRGB(0, 104, 244), Color3.fromRGB(10, 40, 186), Color3.fromRGB(8, 14, 84), Color3.fromRGB(7, 7, 15)}, tbl_2),
    buildVoxelRamp_1({Color3.fromRGB(255, 236, 252), Color3.fromRGB(255, 64, 222), Color3.fromRGB(236, 20, 190), Color3.fromRGB(168, 16, 224), Color3.fromRGB(86, 10, 158), Color3.fromRGB(36, 6, 62), Color3.fromRGB(11, 5, 15)}, tbl_2),
    buildVoxelRamp_1({Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 206, 0), Color3.fromRGB(24, 246, 116), Color3.fromRGB(0, 196, 242), Color3.fromRGB(24, 96, 232), Color3.fromRGB(132, 40, 224), Color3.fromRGB(208, 20, 152), Color3.fromRGB(86, 8, 104), Color3.fromRGB(14, 8, 22)}, tbl_3)
}
local tbl_upv_7 = {Color3.fromRGB(255, 186, 0), Color3.fromRGB(0, 196, 255), Color3.fromRGB(255, 48, 214), Color3.fromRGB(0, 255, 140)}
local tbl_upv_8 = {"ON FIRE", "BLUE HOT", "VIOLET", "PRISM"}
local u27 = buildVoxelRamp_1({Color3.fromRGB(236, 240, 246), Color3.fromRGB(206, 212, 224), Color3.fromRGB(176, 184, 200), Color3.fromRGB(150, 158, 172)}, tbl_4)
local u28 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.62), NumberSequenceKeypoint.new(0.34, 0.62), NumberSequenceKeypoint.new(0.36, 0.46), NumberSequenceKeypoint.new(0.7, 0.46), NumberSequenceKeypoint.new(0.72, 0.28), NumberSequenceKeypoint.new(1, 0.28)})
local u29 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.95), NumberSequenceKeypoint.new(0.3, 0.95), NumberSequenceKeypoint.new(0.32, 0.7), NumberSequenceKeypoint.new(0.6, 0.7), NumberSequenceKeypoint.new(0.62, 0.46), NumberSequenceKeypoint.new(0.85, 0.46), NumberSequenceKeypoint.new(0.87, 0.26), NumberSequenceKeypoint.new(1, 0.26)})
local u30 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(0.6, 0.72), NumberSequenceKeypoint.new(1, 1)})
local u31 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.12), NumberSequenceKeypoint.new(0.55, 0.3), NumberSequenceKeypoint.new(0.82, 0.45), NumberSequenceKeypoint.new(1, 1)})
local u32 = NumberRange.new(0.28, 0.42)
local u33 = NumberRange.new(0.46, 0.62)
local u34 = NumberRange.new(0, 0.6)
local u35 = Vector2.new(180, 180)
local u36 = NumberRange.new(0, 0)
local u37 = ColorSequence.new(Color3.fromRGB(58, 26, 12), Color3.fromRGB(11, 7, 5))
local u38 = NumberSequence.new(0.2, 0.05)
local u39 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(0.75, 0.25), NumberSequenceKeypoint.new(1, 1)})
local u40 = NumberRange.new(0.45, 0.9)
local u41 = NumberRange.new(3, 8)
local u42 = NumberRange.new(0, 0)
local u43 = table.create(#tbl_upv_7)
for u44, u45 in tbl_upv_7 do
    u43[u44] = ColorSequence.new(u45:Lerp(v4, 0.12))
end
local u46 = NumberSequence.new(0.9, 0.7)
local u47 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(0.7, 0.7), NumberSequenceKeypoint.new(1, 1)})
local u48 = NumberRange.new(0.35, 0.6)
local u44 = NumberRange.new(0, 0)
local u45 = NumberRange.new(0.25, 0.45)
local u49 = NumberRange.new(9, 17)
local u50 = NumberSequence.new(0.32, 0)
local u51 = ColorSequence.new(u20)
local u52 = table.create(#tbl_upv_7)
for key_1, value_1 in tbl_upv_7 do
    u52[key_1] = ColorSequence.new(value_1)
end
local v13 = Color3.new(1, 1, 1)
local u53 = table.create(#tbl_upv_7)
local function buildColorSteps_1(a1, a2, a3)
    --[[
      name: buildColorSteps
      line: 344
    ]]
    local tbl_9 = {}
    local v14 = 0
    local v15 = false
    while true do
        if v15 then
            v14 = v14 + 1
        else
            v15 = true
        end
        if v14 >= a3 then
            break
        end
        table.insert(tbl_9, (a1:Lerp(a2, v14 / (a3 - 1))))
    end
    return tbl_9
end
for key_2, value_2 in tbl_upv_7 do
    u53[key_2] = buildColorSteps_1(v13, value_2:Lerp(v13, 0.52), 24)
end
local u54 = math.max(DUNK_HIT_CONFIG_upv_1.basketRingCount, (DUNK_HIT_CONFIG_upv_1.perfectRingCount + (DUNK_HIT_CONFIG_upv_1.perfectRingCount - 4)) + DUNK_HIT_CONFIG_upv_1.rayCount)
local tbl_10 = {}
local tbl_11 = {}
tbl_11.__tostring = function()
    --[[
      name: __tostring
      line: 408
    ]]
    return "DunkHitGame"
end
tbl_11.__index = BaseWorldGame_upv_1
local u55 = setmetatable(tbl_10, tbl_11)
u55.__index = u55
u55.new = function(...)
    --[[
      name: new
      line: 414
      upvalues:
        u55 (ref, index: 1)
    ]]
    local v16 = setmetatable({}, u55)
    return v16:constructor(...) or v16
end
u55.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 418
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        makeRunState_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.run = makeRunState_upv_1()
    a1.hasEnded = false
    a1.renderPreviousBallX = 0
    a1.renderPreviousBallY = 0
    a1.renderPreviousRimX = 0
    a1.renderPreviousRimY = 0
    a1.ballSpin = 0
    a1.renderPreviousSpin = 0
    a1.displayedTimerTicks = -1
    a1.displayedWarn = false
    a1.displayedHalfWidth = -1
    a1.displayedChipStreak = -1
    a1.shadowStep = -1
    a1.washStep = -1
    a1.lastWarnSecond = -1
    a1.fireTier = -1
    a1.washIntensity = 0
    a1.cosmeticRandom = Random.new()
    a1.ballOrientation = CFrame.new()
    a1.netStrands = {}
    a1.netRest = {}
    a1.shards = {}
    a1.shardCursor = 0
end
u55.buildScene = function(a1)
    --[[
      name: buildScene
      line: 444
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
        PopupTextPool_upv_1 (copy, index: 2)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.stage.setFrameWidthFloor(DUNK_HIT_CONFIG_upv_1.frameWidthFloorStuds)
    a1.stage.setFrameCenter(Vector2.new(0, DUNK_HIT_CONFIG_upv_1.frameCenterY))
    a1:buildVoid(container_1, origin_1)
    a1:buildHoop(container_1)
    a1:buildBall(container_1)
    a1:buildShadow(container_1)
    a1:buildTimer(container_1, origin_1)
    a1:buildChip(container_1, origin_1)
    a1:buildBurstPool(container_1, origin_1)
    a1:buildWash()
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1:connectInput()
end
u55.buildVoid = function(a1, a2, a3)
    --[[
      name: buildVoid
      line: 465
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        u3 (copy, index: 5)
        u4 (copy, index: 6)
    ]]
    local v17 = makeFrontalBackdrop_upv_1(a1.stage, u2, Enum.Material.SmoothPlastic)
    v17.CFrame = CFrame.new(a3 + Vector3.new(0, DUNK_HIT_CONFIG_upv_1.frameCenterY, -44))
    local v18 = makeStagePart_upv_1(a2)
    v18.Size = Vector3.new(420, 260, 2)
    v18.Color = u3
    v18.CFrame = CFrame.new(a3 + Vector3.new(0, DUNK_HIT_CONFIG_upv_1.frameCenterY, -34))
    local v19 = makeStagePart_upv_1(a2)
    v19.Size = Vector3.new(52, 50, 1.2000000476837158)
    v19.Color = u4
    v19.CFrame = CFrame.new(a3 + Vector3.new(0, DUNK_HIT_CONFIG_upv_1.frameCenterY, -32.2))
end
u55.buildHoop = function(a1, a2)
    --[[
      name: buildHoop
      line: 487
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 2)
        u5 (copy, index: 3)
        u1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u6 (copy, index: 6)
        u21 (copy, index: 7)
        u7 (copy, index: 8)
        u23 (copy, index: 9)
        u8 (copy, index: 10)
    ]]
    a1.board = makeStagePart_upv_1(a2)
    a1.board.Size = Vector3.new(12, DUNK_HIT_CONFIG_upv_1.boardHeight, 0.8)
    a1.board.Color = u5
    a1.board.CFrame = u1
    a1.post = makeSmoothPart_upv_1(a2)
    a1.post.Size = Vector3.new(1.600000023841858, 1, 1)
    a1.post.Color = u6
    a1.post.CFrame = u1
    a1.rimBar = makeSmoothPart_upv_1(a2)
    a1.rimBar.Shape = Enum.PartType.Cylinder
    a1.rimBar.Size = Vector3.new(DUNK_HIT_CONFIG_upv_1.hoopHalfWidthStart * 2, u21, u21)
    a1.rimBar.Color = u7
    a1.rimBar.CFrame = u1
    a1.rimCapLeft = a1:buildRimCap(a2)
    a1.rimCapRight = a1:buildRimCap(a2)
    a1.rimHaloLeft = a1:buildRimHalo(a1.rimCapLeft)
    a1.rimHaloRight = a1:buildRimHalo(a1.rimCapRight)
    for n_1 = 0, 1 do
        local v20 = 0
        local v21 = false
        v21, v20 = v21, v20
        while true do
            if v21 then
                v20 = v20 + 1
            else
                v21 = true
            end
            local v22
            if v20 >= 5 then
                break
            end
            v22 = makeSmoothPart_upv_1(a2)
            v22.Size = Vector3.new(0.16, u23, 0.16)
            v22.Color = u8
            v22.Transparency = ((n_1 ~= 0) and 0.28) or 0
            v22.CFrame = u1
            table.insert(a1.netStrands, v22)
            table.insert(a1.netRest, (CFrame.new()))
        end
    end
end
u55.buildRimCap = function(a1, a2)
    --[[
      name: buildRimCap
      line: 544
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u22 (copy, index: 2)
        u21 (copy, index: 3)
        u7 (copy, index: 4)
        u1 (copy, index: 5)
    ]]
    local v23 = makeSmoothPart_upv_1(a2)
    v23.Shape = Enum.PartType.Cylinder
    v23.Size = Vector3.new(u22, u21, u21)
    v23.Color = u7
    v23.CFrame = u1
    return v23
end
u55.buildRimHalo = function(a1, a2)
    --[[
      name: buildRimHalo
      line: 552
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
        u43 (copy, index: 2)
        u46 (copy, index: 3)
        u47 (copy, index: 4)
        u48 (copy, index: 5)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 6)
        u44 (copy, index: 7)
    ]]
    local v24 = Instance.new("ParticleEmitter")
    v24.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v24.Color = u43[1]
    v24.Size = u46
    v24.Transparency = u47
    v24.Lifetime = u48
    v24.Rate = DUNK_HIT_CONFIG_upv_1.rimHaloRate
    v24.Speed = u44
    v24.SpreadAngle = Vector2.zero
    v24.LightEmission = DUNK_HIT_CONFIG_upv_1.rimHaloLightEmission
    v24.LightInfluence = 0
    v24.LockedToPart = true
    v24.Enabled = false
    v24.Parent = a2
    return v24
end
u55.buildBall = function(a1, a2)
    --[[
      name: buildBall
      line: 570
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
        waitForSceneryRoot_upv_1 (copy, index: 2)
        createGameLoopSound_upv_1 (copy, index: 3)
        SOUND_IDS_upv_1 (copy, index: 4)
    ]]
    local v25 = nil
    if DUNK_HIT_CONFIG_upv_1.useAuthoredBall then
        v25 = waitForSceneryRoot_upv_1("FlappyBasket", "dunk-hit")
        if v25 ~= nil then
            v25 = v25:FindFirstChild("Ball")
        end
        local v26 = v25
    else
        local v26 = nil
    end
    local v26, v27 = nil, nil
    if v26 ~= nil and v26:IsA("Model") then
        v27 = v26:Clone()
        for _, value_3 in v27:GetDescendants() do
            if value_3:IsA("BasePart") then
                value_3.Anchored = true
                value_3.CanCollide = false
                value_3.CanQuery = false
                value_3.CanTouch = false
                value_3.CastShadow = false
            end
        end
        for _, value_4 in v27:GetChildren() do
            if not (value_4:IsA("Model")) then
                continue
            end
            if string.find(value_4.Name, "Wing", 1, true) ~= nil then
                value_4:Destroy()
            end
        end
        v27.Parent = a2
    else
        if DUNK_HIT_CONFIG_upv_1.useAuthoredBall then
            warn("[DunkHit] missing scenery asset FlappyBasket.Ball \226\128\148 using the fallback ball")
        end
        v27 = a1:buildFallbackBall(a2)
    end
    local v28 = v27:FindFirstChild("BallCore", true)
    local v29
    v29 = v28 == nil or not (v28:IsA("BasePart")) or v28
    if v29 == nil then
        local v30 = 0
        local v31 = nil
        local _ = nil
        for v34, value_5 in v27:GetDescendants() do
            v31 = value_5:IsA("BasePart")
            if not (v31) then
                continue
            end
            v31 = math.max(value_5.Size.X, value_5.Size.Y, value_5.Size.Z)
            if v30 < v31 then
                v29, v30 = value_5, v31
            end
        end
    end
    if v29 == nil then
        error("[DunkHit] ball model has no BasePart")
    end
    local v32 = math.max(v29.Size.X, v29.Size.Y, v29.Size.Z)
    if v32 > 0.01 then
        local v33 = DUNK_HIT_CONFIG_upv_1.ballRadius * 2 / v32
        if math.abs(v33 - 1) > 0.01 then
            v27:ScaleTo(v27:GetScale() * v33)
        end
    end
    a1.ballOrientation = v27:GetPivot().Rotation
    a1.ballModel = v27
    a1.ballCore = v29
    a1.trailPuff = a1:buildTrailEmitter(v29)
    a1.embers = a1:buildEmberEmitter(v29)
    a1.flameBed = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.flameLoop, parent = a1.stage.container})
    a1.flameBed:Play()
end
u55.buildFallbackBall = function(a1, a2)
    --[[
      name: buildFallbackBall
      line: 667
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u9 (copy, index: 3)
        u10 (copy, index: 4)
    ]]
    local v34 = Instance.new("Model")
    v34.Name = "Ball"
    v34.Parent = a2
    local v35 = DUNK_HIT_CONFIG_upv_1.ballRadius * 2
    local v36 = makeSmoothPart_upv_1(v34)
    v36.Name = "BallCore"
    v36.Shape = Enum.PartType.Ball
    v36.Size = Vector3.new(v35, v35, v35)
    v36.Color = u9
    v36.CFrame = CFrame.new(0, 0, 0)
    for n_2 = 0, 3 do
        local v37 = makeSmoothPart_upv_1(v34)
        v37.Size = Vector3.new(v35 + 0.05, 0.18, (v35 * 0.62) - (n_2 * 0.08))
        v37.Color = u10
        v37.CFrame = CFrame.Angles(0, 0, math.rad(n_2 * 45))
    end
    v34.WorldPivot = CFrame.new(0, 0, 0)
    return v34
end
u55.buildTrailEmitter = function(a1, a2)
    --[[
      name: buildTrailEmitter
      line: 690
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
        u27 (copy, index: 2)
        u28 (copy, index: 3)
        u30 (copy, index: 4)
        u32 (copy, index: 5)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 6)
        u34 (copy, index: 7)
        u35 (copy, index: 8)
        u36 (copy, index: 9)
    ]]
    local v38 = Instance.new("ParticleEmitter")
    v38.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v38.Color = u27
    v38.Size = u28
    v38.Transparency = u30
    v38.Lifetime = u32
    v38.Rate = DUNK_HIT_CONFIG_upv_1.trailRateCold
    v38.Speed = u34
    v38.SpreadAngle = u35
    v38.Rotation = u36
    v38.RotSpeed = u36
    v38.LightEmission = DUNK_HIT_CONFIG_upv_1.trailLightEmissionCold
    v38.LightInfluence = 0
    v38.Drag = 0
    v38.ZOffset = -0.25
    v38.LockedToPart = false
    v38.Enabled = true
    v38.Parent = a2
    return v38
end
u55.buildEmberEmitter = function(a1, a2)
    --[[
      name: buildEmberEmitter
      line: 712
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
        u37 (copy, index: 2)
        u38 (copy, index: 3)
        u39 (copy, index: 4)
        u40 (copy, index: 5)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 6)
        u41 (copy, index: 7)
        u35 (copy, index: 8)
        u42 (copy, index: 9)
    ]]
    local v39 = Instance.new("ParticleEmitter")
    v39.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v39.Color = u37
    v39.Size = u38
    v39.Transparency = u39
    v39.Lifetime = u40
    v39.Rate = DUNK_HIT_CONFIG_upv_1.emberRate
    v39.Speed = u41
    v39.SpreadAngle = u35
    v39.RotSpeed = u42
    v39.Acceleration = Vector3.new(0, -34, 0)
    v39.Drag = 2
    v39.LightEmission = 0
    v39.LightInfluence = 0
    v39.Enabled = false
    v39.Parent = a2
    return v39
end
u55.buildShadow = function(a1, a2)
    --[[
      name: buildShadow
      line: 731
      upvalues:
        makeEllipsoidPart_upv_1 (copy, index: 1)
        u11 (copy, index: 2)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    a1.shadow = makeEllipsoidPart_upv_1(a2)
    a1.shadow.Color = u11
    a1.shadow.Size = Vector3.new((DUNK_HIT_CONFIG_upv_1.ballRadius * 2) * DUNK_HIT_CONFIG_upv_1.shadowWidthScale, 1, 0.4)
    a1.shadow.Transparency = DUNK_HIT_CONFIG_upv_1.shadowTransparencyLow
    a1.shadow.CFrame = u1
end
u55.buildTimer = function(a1, a2, a3)
    --[[
      name: buildTimer
      line: 738
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
        u24 (copy, index: 3)
        u13 (copy, index: 4)
    ]]
    a1.timerTrack = makeSmoothPart_upv_1(a2)
    a1.timerTrack.Size = Vector3.new(30.799999237060547, 1.600000023841858, 0.5)
    a1.timerTrack.Color = u12
    a1.timerTrack.CFrame = CFrame.new(a3 + Vector3.new(0, u24, 2.4))
    a1.timerFill = makeSmoothPart_upv_1(a2)
    a1.timerFill.Size = Vector3.new(30, 1.0499999523162842, 0.5)
    a1.timerFill.Color = u13
    a1.timerFill.CFrame = CFrame.new(a3 + Vector3.new(0, u24, 2.65))
end
u55.buildChip = function(a1, a2, a3)
    --[[
      name: buildChip
      line: 755
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u26 (copy, index: 2)
        u19 (copy, index: 3)
        u18 (copy, index: 4)
    ]]
    local v40 = makeSmoothPart_upv_1(a2)
    v40.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v40.Transparency = 1
    v40.CFrame = CFrame.new(a3 + Vector3.new(0, u26, 2.4))
    local v41 = Instance.new("BillboardGui")
    v41.Size = UDim2.fromScale(7, 2.9)
    v41.AlwaysOnTop = true
    v41.LightInfluence = 0
    v41.Enabled = false
    v41.Parent = v40
    a1.chipBillboard = v41
    a1.chipCountShadow = a1:buildChipLabel(v41, 0, u19, 1)
    a1.chipCount = a1:buildChipLabel(v41, 0, u18, 2)
    a1.chipAwardShadow = a1:buildChipLabel(v41, 0.52, u19, 1)
    a1.chipAward = a1:buildChipLabel(v41, 0.52, u18, 2)
end
u55.buildChipLabel = function(a1, a2, a3, a4, a5)
    --[[
      name: buildChipLabel
      line: 774
    ]]
    local v42 = Instance.new("TextLabel")
    v42.BackgroundTransparency = 1
    v42.Size = UDim2.fromScale(1, 0.48)
    local v43
    if a5 ~= 1 then
        v43 = UDim2.fromScale(0, a3)
    else
        v43 = UDim2.fromScale(0.01, a3 + 0.045)
    end
    v42.Position = v43
    v42.Font = Enum.Font.GothamBlack
    v42.TextScaled = true
    v42.TextColor3 = a4
    v42.Text = ""
    v42.ZIndex = a5
    v42.Parent = a2
    return v42
end
u55.buildBurstPool = function(a1, a2, a3)
    --[[
      name: buildBurstPool
      line: 788
      upvalues:
        u54 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 4)
        u45 (copy, index: 5)
        u49 (copy, index: 6)
        u35 (copy, index: 7)
        u50 (copy, index: 8)
        u51 (copy, index: 9)
    ]]
    local v44 = 0
    local v45 = false
    while true do
        if v45 then
            v44 = v44 + 1
        else
            v45 = true
        end
        if v44 >= u54 then
            break
        end
        local v46 = makeSmoothPart_upv_1(a2)
        v46.Material = Enum.Material.Neon
        v46.Size = Vector3.new(0.6000000238418579, 0.1599999964237213, 0.1599999964237213)
        v46.Transparency = 1
        v46.CFrame = u1
        table.insert(a1.shards, {part = v46})
    end
    a1.burstAnchor = makeSmoothPart_upv_1(a2)
    a1.burstAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.burstAnchor.Transparency = 1
    a1.burstAnchor.CFrame = CFrame.new(a3 + Vector3.new(0, 0, 1.5))
    a1.burst = Instance.new("ParticleEmitter")
    a1.burst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.burst.Rate = 0
    a1.burst.Lifetime = u45
    a1.burst.Speed = u49
    a1.burst.SpreadAngle = u35
    a1.burst.Size = u50
    a1.burst.Color = u51
    a1.burst.Parent = a1.burstAnchor
end
u55.buildWash = function(a1)
    --[[
      name: buildWash
      line: 839
      upvalues:
        u53 (copy, index: 1)
    ]]
    a1.wash = Instance.new("ColorCorrectionEffect")
    a1.wash.Enabled = false
    a1.wash.TintColor = u53[1][1]
    a1.wash.Parent = a1.stage.camera
    a1.context.janitor:Add(a1.wash)
end
u55.connectInput = function(a1)
    --[[
      name: connectInput
      line: 846
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        pausedAtom_upv_1 (copy, index: 2)
        clearPendingFlap_upv_1 (copy, index: 3)
    ]]
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 847
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function()
                --[[
                  line: 851
                  upvalues:
                    clearPendingFlap_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                return clearPendingFlap_upv_1(a1.run)
            end
        )
    )
end
u55.onPress = function(a1)
    --[[
      name: onPress
      line: 855
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        pressFlap_upv_1 (copy, index: 2)
    ]]
    if not (pausedAtom_upv_1()) and a1:isRunning() then
        pressFlap_upv_1(a1.run)
    else
        return nil
    end
end
u55.resetRound = function(a1)
    --[[
      name: resetRound
      line: 861
      upvalues:
        resetRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.hasEnded = false
    resetRun_upv_1(a1.run, tbl_upv_1, a1.context.getRunSeed())
    a1.ballSpin = 0
    a1:syncRenderHistory()
    a1.displayedTimerTicks = -1
    a1.displayedChipStreak = -1
    a1.shadowStep = -1
    a1.lastWarnSecond = -1
    a1:snapFireOff()
    a1:clearAirborneEffects()
    a1.popups:hideAll()
    a1.context.reportScore(0)
end
u55.revive = function(a1)
    --[[
      name: revive
      line: 875
      upvalues:
        reviveRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.hasEnded = false
    reviveRun_upv_1(a1.run, tbl_upv_1)
    a1:syncRenderHistory()
    a1.displayedTimerTicks = -1
    a1.shadowStep = -1
    a1:clearAirborneEffects()
    a1:applyFireLook(a1:tierForStreak(a1.run.perfectStreak))
    a1:setRunning(true)
end
u55.captureRound = function(a1)
    --[[
      name: captureRound
      line: 889
    ]]
    return nil
end
u55.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 892
    ]]
    return false
end
u55.syncRenderHistory = function(a1)
    --[[
      name: syncRenderHistory
      line: 895
    ]]
    a1.renderPreviousBallX = a1.run.ball.x
    a1.renderPreviousBallY = a1.run.ball.y
    a1.renderPreviousRimX = a1.run.hoop.centerX
    a1.renderPreviousRimY = a1.run.hoop.centerY
    a1.renderPreviousSpin = a1.ballSpin
end
u55.clearAirborneEffects = function(a1)
    --[[
      name: clearAirborneEffects
      line: 902
    ]]
    a1.trailPuff:Clear()
    a1.embers:Clear()
    a1.rimHaloLeft:Clear()
    a1.rimHaloRight:Clear()
    for _, value_6 in a1.shards do
        a1:parkShard(value_6)
    end
end
u55.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 911
      upvalues:
        stepRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.renderPreviousBallX = a1.run.ball.x
    a1.renderPreviousBallY = a1.run.ball.y
    a1.renderPreviousRimX = a1.run.hoop.centerX
    a1.renderPreviousRimY = a1.run.hoop.centerY
    a1.renderPreviousSpin = a1.ballSpin
    local v47 = stepRun_upv_1(a1.run, tbl_upv_1, a2)
    a1.ballSpin = a1.ballSpin - ((a1.run.ball.velocityX * a2) / math.max(DUNK_HIT_CONFIG_upv_1.ballRadius, 0.01))
    a1:onEvent(v47)
    a1:tickWarningBeep()
end
u55.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 925
      upvalues:
        stepRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    if a1.hasEnded then
        a1.renderPreviousBallX = a1.run.ball.x
        a1.renderPreviousBallY = a1.run.ball.y
        a1.renderPreviousSpin = a1.ballSpin
        stepRun_upv_1(a1.run, tbl_upv_1, (math.min(a2, 0.05)))
    end
    a1:render(a2)
end
u55.onEvent = function(a1, a2)
    --[[
      name: onEvent
      line: 938
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 == "basket" then
        a1:onBasket()
        return nil
    elseif a2 == "expired" then
        a1:onExpired()
        return nil
    elseif a2 == "flapped" then
        a1.context.audio.play("whoosh", {})
        return nil
    elseif a2 == "board" then
        a1.stage.shake(DUNK_HIT_CONFIG_upv_1.boardShake)
        a1.context.audio.play("thud", {})
        return nil
    elseif a2 == "rim" then
        a1.context.audio.play("pop", {})
        return nil
    elseif a2 == "floor" then
        local v48 = math.clamp(math.abs(a1.run.ball.velocityY) / 30, 0.15, 1)
        a1.context.audio.play("thud", {volume = (v48 * 0.18) + 0.08, pitch = (v48 * 0.12) + 0.78})
    end
end
u55.onBasket = function(a1)
    --[[
      name: onBasket
      line: 984
      upvalues:
        tbl_upv_7 (copy, index: 1)
        u20 (copy, index: 2)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 3)
        u52 (copy, index: 4)
        u51 (copy, index: 5)
        u15 (copy, index: 6)
        u16 (copy, index: 7)
        publishCombo_upv_1 (copy, index: 8)
        tbl_upv_8 (copy, index: 9)
    ]]
    local lastWasPerfect_1 = a1.run.lastWasPerfect
    local renderPreviousRimX_1 = a1.renderPreviousRimX
    local renderPreviousRimY_1 = a1.renderPreviousRimY
    local v49 = a1:worldAt(renderPreviousRimX_1, renderPreviousRimY_1)
    a1.context.reportScore(a1.run.score)
    local v50 = a1:tierForStreak(a1.run.perfectStreak)
    local v51 = v50 >= 0
    local v52
    if v51 then
        v52 = tbl_upv_7[v50 + 1]
    else
        v52 = u20
    end
    if lastWasPerfect_1 then
        a1:spawnRing(renderPreviousRimX_1, renderPreviousRimY_1, DUNK_HIT_CONFIG_upv_1.perfectRingCount, DUNK_HIT_CONFIG_upv_1.perfectRingSpeed, DUNK_HIT_CONFIG_upv_1.perfectRingLife, v52)
        a1:spawnRing(renderPreviousRimX_1, renderPreviousRimY_1, DUNK_HIT_CONFIG_upv_1.perfectRingCount - 4, DUNK_HIT_CONFIG_upv_1.perfectRingInnerSpeed, DUNK_HIT_CONFIG_upv_1.perfectRingLife, v52)
        a1:spawnRays(renderPreviousRimX_1, renderPreviousRimY_1, v52)
    else
        a1:spawnRing(renderPreviousRimX_1, renderPreviousRimY_1, DUNK_HIT_CONFIG_upv_1.basketRingCount, DUNK_HIT_CONFIG_upv_1.basketRingSpeed, DUNK_HIT_CONFIG_upv_1.basketRingLife, v52)
    end
    a1.burstAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(renderPreviousRimX_1, renderPreviousRimY_1, 1.5))
    local burst_1 = a1.burst
    local v53
    if v51 then
        v53 = u52[v50 + 1]
    else
        v53 = u51
    end
    burst_1.Color = v53
    a1.burst:Emit((lastWasPerfect_1 and 22) or 12)
    local shake_1 = a1.stage.shake
    if lastWasPerfect_1 then
        v53 = DUNK_HIT_CONFIG_upv_1.perfectShake
    else
        v53 = DUNK_HIT_CONFIG_upv_1.basketShake
    end
    shake_1(v53)
    local popups_1 = a1.popups
    local v54 = ("+%*"):format(a1.run.lastAward)
    local v55
    if lastWasPerfect_1 then
        if v51 then
            v55 = tbl_upv_7[v50 + 1]
        else
            v55 = u15
        end
    else
        v55 = u16
    end
    popups_1:show(v49 + Vector3.new(0, 3, 0), v54, v55, (lastWasPerfect_1 and 1.1) or 0.9)
    if lastWasPerfect_1 then
        a1.context.audio.play("perfect", {pitch = (math.min(a1.run.perfectStreak, 4) * 0.05) + 1})
    else
        a1.context.audio.play("flappyBasketScore", {})
    end
    if v50 ~= a1.fireTier then
        v53 = a1.fireTier < v50
        a1:applyFireLook(v50)
        if v51 and v53 then
            a1.context.audio.play("flameIgnite", {pitch = 0.95 + (v50 * 0.12)})
            a1.stage.shake(DUNK_HIT_CONFIG_upv_1.fireIgniteShake)
            publishCombo_upv_1({count = a1.run.perfectStreak, label = tbl_upv_8[v50 + 1], color = tbl_upv_7[v50 + 1]})
        end
    end
    a1.renderPreviousRimX = a1.run.hoop.centerX
    a1.renderPreviousRimY = a1.run.hoop.centerY
end
u55.onExpired = function(a1)
    --[[
      name: onExpired
      line: 1060
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    if a1.hasEnded then
        return nil
    end
    a1.hasEnded = true
    a1:snapFireOff()
    a1.chipBillboard.Enabled = false
    a1.stage.shake(DUNK_HIT_CONFIG_upv_1.basketShake)
    a1.context.audio.play("buzz", {})
    a1.popups:show(a1:worldAt(a1.run.ball.x, a1.run.ball.y + 3), "TIME!", u17, 1.2)
    a1.context.endRun(a1.run.score)
end
u55.tickWarningBeep = function(a1)
    --[[
      name: tickWarningBeep
      line: 1080
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if not (a1.hasEnded) then
        local v56 = nil
        if DUNK_HIT_CONFIG_upv_1.clockWarnSeconds >= a1.run.clockRemaining then
            v56 = math.ceil(a1.run.clockRemaining)
            if v56 ~= a1.lastWarnSecond then
                a1.lastWarnSecond = v56
                a1.context.audio.play("countdownBeep", {})
                return
            end
            return nil
        end
    end
    a1.lastWarnSecond = -1
    return nil
end
u55.tierForStreak = function(a1, a2)
    --[[
      name: tierForStreak
      line: 1095
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v57 = -1
    for n_3 = 0, #DUNK_HIT_CONFIG_upv_1.fireTierStreaks - 1 do
        if DUNK_HIT_CONFIG_upv_1.fireTierStreaks[n_3 + 1] <= a2 then
            v57 = n_3
        end
    end
    return v57
end
u55.applyFireLook = function(a1, a2)
    --[[
      name: applyFireLook
      line: 1104
      upvalues:
        tbl_upv_6 (copy, index: 1)
        u27 (copy, index: 2)
        u43 (copy, index: 3)
        u29 (copy, index: 4)
        u28 (copy, index: 5)
        u31 (copy, index: 6)
        u30 (copy, index: 7)
        u33 (copy, index: 8)
        u32 (copy, index: 9)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 10)
    ]]
    a1.fireTier = a2
    local v58 = a2 >= 0
    local v59 = math.max(a2, 0)
    local trailPuff_1 = a1.trailPuff
    local v60
    if v58 then
        v60 = tbl_upv_6[v59 + 1]
    else
        v60 = u27
    end
    trailPuff_1.Color = v60
    a1.rimHaloLeft.Color = u43[v59 + 1]
    a1.rimHaloRight.Color = u43[v59 + 1]
    local trailPuff_2 = a1.trailPuff
    if v58 then
        v60 = u29
    else
        v60 = u28
    end
    trailPuff_2.Size = v60
    local trailPuff_3 = a1.trailPuff
    if v58 then
        v60 = u31
    else
        v60 = u30
    end
    trailPuff_3.Transparency = v60
    local trailPuff_4 = a1.trailPuff
    if v58 then
        v60 = u33
    else
        v60 = u32
    end
    trailPuff_4.Lifetime = v60
    local trailPuff_5 = a1.trailPuff
    if v58 then
        v60 = DUNK_HIT_CONFIG_upv_1.trailRateHot
    else
        v60 = DUNK_HIT_CONFIG_upv_1.trailRateCold
    end
    trailPuff_5.Rate = v60
    local trailPuff_6 = a1.trailPuff
    if v58 then
        v60 = DUNK_HIT_CONFIG_upv_1.trailLightEmissionHot
    else
        v60 = DUNK_HIT_CONFIG_upv_1.trailLightEmissionCold
    end
    trailPuff_6.LightEmission = v60
    a1.embers.Enabled = v58
    a1.rimHaloLeft.Enabled = v58
    a1.rimHaloRight.Enabled = v58
end
u55.snapFireOff = function(a1)
    --[[
      name: snapFireOff
      line: 1120
      upvalues:
        u53 (copy, index: 1)
    ]]
    a1:applyFireLook(-1)
    a1.washIntensity = 0
    a1.washStep = -1
    a1.wash.Enabled = false
    a1.wash.TintColor = u53[1][1]
    a1.wash.Brightness = 0
    a1.wash.Saturation = 0
    a1.wash.Contrast = 0
    a1.flameBed.Volume = 0
end
u55.updateWash = function(a1)
    --[[
      name: updateWash
      line: 1131
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
        u53 (copy, index: 2)
    ]]
    local v61
    if a1.fireTier < 0 or a1.hasEnded then
        v61 = 0
    else
        v61 = 1
    end
    a1.washIntensity = a1.washIntensity + ((v61 - a1.washIntensity) * math.min(a1.realDelta * DUNK_HIT_CONFIG_upv_1.fireWashFadeRate, 1))
    if v61 == 0 and a1.washIntensity < 0.01 then
        if a1.wash.Enabled then
            a1:snapFireOff()
        end
        return nil
    end
    a1.wash.Enabled = true
    local v62 = math.max(a1.fireTier, 0)
    local v63 = math.clamp(math.floor(a1.washIntensity * math.floor(23 * DUNK_HIT_CONFIG_upv_1.fireWashTierReach[v62 + 1])), 0, 23)
    local v64 = v62 * 24 + v63
    if v64 ~= a1.washStep then
        a1.washStep = v64
        local v65 = v63 / 23
        a1.wash.TintColor = u53[v62 + 1][v63 + 1]
        a1.wash.Brightness = DUNK_HIT_CONFIG_upv_1.fireWashBrightness * v65
        a1.wash.Saturation = -DUNK_HIT_CONFIG_upv_1.fireWashDesaturate * v65
        a1.wash.Contrast = DUNK_HIT_CONFIG_upv_1.fireWashContrast * v65
        a1.flameBed.Volume = DUNK_HIT_CONFIG_upv_1.flameLoopVolumeMax * v65
        a1.flameBed.PlaybackSpeed = (DUNK_HIT_CONFIG_upv_1.flameLoopPitchBase + (v62 * DUNK_HIT_CONFIG_upv_1.flameLoopPitchPerTier)) + (DUNK_HIT_CONFIG_upv_1.flameLoopPitchRise * v65)
    else
        return nil
    end
end
u55.parkShard = function(a1, a2)
    --[[
      name: parkShard
      line: 1165
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.Transparency = 1
    a2.part.CFrame = u1
end
u55.takeShard = function(a1)
    --[[
      name: takeShard
      line: 1170
    ]]
    local v66 = a1.shards[1]
    for _, value_7 in a1.shards do
        if value_7.active then
            if v66.age / v66.life < value_7.age / value_7.life then
                v66 = value_7
            end
        else
            return value_7
        end
    end
    if v66.age > 0 then
        return v66
    else
        local v67 = a1.shards[a1.shardCursor + 1]
        a1.shardCursor = (a1.shardCursor + 1) % #a1.shards
        return v67
    end
end
u55.spawnShard = function(a1, a2)
    --[[
      name: spawnShard
      line: 1192
    ]]
    local v68 = a1:takeShard()
    v68.x = a2.x
    v68.y = a2.y
    v68.velocityX = a2.velocityX
    v68.velocityY = a2.velocityY
    v68.angleDegrees = a2.angleDegrees
    v68.lengthFrom = a2.lengthFrom
    v68.lengthTo = a2.lengthTo
    v68.age = 0
    v68.life = a2.life
    v68.active = true
    v68.part.Color = a2.color
end
u55.spawnRing = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: spawnRing
      line: 1206
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v69 = math.max(a1.run.hoop.halfWidth * 0.85, 0.5)
    local v70 = 0
    local v71 = false
    while true do
        if v71 then
            v70 = v70 + 1
        else
            v71 = true
        end
        if v70 >= a4 then
            break
        end
        local v72 = ((v70 / a4) * math.pi) * 2 + a1.cosmeticRandom:NextNumber(-0.12, 0.12)
        local v73 = math.cos(v72)
        local v74 = math.sin(v72) * DUNK_HIT_CONFIG_upv_1.ringEllipseRatio
        local v75 = a1.cosmeticRandom:NextNumber(0.85, 1.15)
        a1:spawnShard({x = a2 + (v73 * v69), y = a3 + (v74 * v69), velocityX = (v73 * a5) * v75, velocityY = (v74 * a5) * v75, angleDegrees = math.deg(math.atan2(v74, v73)) + 90, life = a6, color = a7})
    end
end
u55.spawnRays = function(a1, a2, a3, a4)
    --[[
      name: spawnRays
      line: 1238
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v76 = a1.cosmeticRandom:NextNumber(0, math.tau)
    for n_4 = 0, DUNK_HIT_CONFIG_upv_1.rayCount - 1 do
        local v77 = v76 + ((n_4 / DUNK_HIT_CONFIG_upv_1.rayCount) * math.pi) * 2
        local v78 = math.cos(v77)
        local v79 = math.sin(v77) * DUNK_HIT_CONFIG_upv_1.ringEllipseRatio
        a1:spawnShard({x = a2 + (v78 * 0.6), y = a3 + (v79 * 0.6), velocityX = v78 * 2.5, velocityY = v79 * 2.5, angleDegrees = math.deg(math.atan2(v79, v78)), lengthFrom = DUNK_HIT_CONFIG_upv_1.rayLengthFrom, lengthTo = DUNK_HIT_CONFIG_upv_1.rayLengthTo, life = DUNK_HIT_CONFIG_upv_1.rayLife, color = a4})
    end
end
u55.animateBurstShards = function(a1, a2, a3)
    --[[
      name: animateBurstShards
      line: 1257
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    for _, value_8 in a1.shards do
        if not (value_8.active) then
            continue
        end
        value_8.age = value_8.age + a2
        if value_8.life > value_8.age then
            local v80 = value_8.age / value_8.life
            value_8.x = value_8.x + (value_8.velocityX * a2)
            value_8.y = value_8.y + (value_8.velocityY * a2)
            value_8.part.Size = Vector3.new(lerp_upv_1(value_8.lengthFrom, value_8.lengthTo, v80), 0.16, 0.16)
            value_8.part.Transparency = v80
            value_8.part.CFrame = CFrame.new(a3 + Vector3.new(value_8.x, value_8.y, 1.5)) * CFrame.Angles(0, 0, math.rad(value_8.angleDegrees))
        else
            a1:parkShard(value_8)
        end
    end
end
u55.worldAt = function(a1, a2, a3)
    --[[
      name: worldAt
      line: 1280
    ]]
    return a1.stage.origin + Vector3.new(a2, a3, 0)
end
u55.render = function(a1, a2)
    --[[
      name: render
      line: 1285
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local v81 = lerp_upv_1(a1.renderPreviousBallX, a1.run.ball.x, renderAlpha_1)
    local v82 = lerp_upv_1(a1.renderPreviousBallY, a1.run.ball.y, renderAlpha_1)
    local v83 = lerp_upv_1(a1.renderPreviousRimX, a1.run.hoop.centerX, renderAlpha_1)
    local v84 = lerp_upv_1(a1.renderPreviousRimY, a1.run.hoop.centerY, renderAlpha_1)
    local v85 = lerp_upv_1(a1.renderPreviousSpin, a1.ballSpin, renderAlpha_1)
    local origin_2 = a1.stage.origin
    a1.ballModel:PivotTo((CFrame.new(origin_2 + Vector3.new(v81, v82, 0)) * a1.ballOrientation) * CFrame.Angles(0, 0, v85))
    a1:drawHoop(origin_2, v83, v84)
    a1:drawShadow(origin_2, v81, v82)
    a1:updateTimerBar(origin_2)
    a1:updateChip()
    a1:updateWash()
    a1:animateBurstShards(a1.realDelta, origin_2)
end
u55.drawHoop = function(a1, a2, a3, a4)
    --[[
      name: drawHoop
      line: 1308
      upvalues:
        DUNK_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local halfWidth_1 = a1.run.hoop.halfWidth
    local side_1 = a1.run.hoop.side
    if halfWidth_1 ~= a1.displayedHalfWidth then
        a1:refreshHoopShape(halfWidth_1)
    end
    a1.rimBar.CFrame = CFrame.new(a2 + Vector3.new(a3, a4, 0))
    a1.rimCapLeft.CFrame = CFrame.new(a2 + Vector3.new(a3 - halfWidth_1, a4, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
    a1.rimCapRight.CFrame = CFrame.new(a2 + Vector3.new(a3 + halfWidth_1, a4, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
    a1.board.CFrame = CFrame.new(a2 + Vector3.new(side_1 * (DUNK_HIT_CONFIG_upv_1.fieldHalfWidth - 6), (a4 + DUNK_HIT_CONFIG_upv_1.boardBottomOffset) + (DUNK_HIT_CONFIG_upv_1.boardHeight / 2), -3.2))
    a1.post.CFrame = CFrame.new(a2 + Vector3.new(side_1 * (((DUNK_HIT_CONFIG_upv_1.fieldHalfWidth - DUNK_HIT_CONFIG_upv_1.rimKnobRadius) - DUNK_HIT_CONFIG_upv_1.pocketSealStuds) + 0.8), a4, -1.6))
    local v86 = CFrame.new(a2 + Vector3.new(a3, a4, 0))
    for n_5 = 0, #a1.netStrands - 1 do
        a1.netStrands[n_5 + 1].CFrame = v86 * a1.netRest[n_5 + 1]
    end
end
u55.refreshHoopShape = function(a1, a2)
    --[[
      name: refreshHoopShape
      line: 1350
      upvalues:
        u21 (copy, index: 1)
        u23 (copy, index: 2)
        lerp_upv_1 (copy, index: 3)
    ]]
    a1.displayedHalfWidth = a2
    a1.rimBar.Size = Vector3.new(a2 * 2, u21, u21)
    local v87 = a2 * 0.96
    local v88 = a2 * 0.55
    for n_6 = 0, 1 do
        local v89 = 0
        local v90 = false
        local v91
        if v90 then
            v89 = v89 + 1
        else
            v90 = true
        end
        if v89 >= 5 then
            continue
        end
        if n_6 ~= 0 then
            v91 = v89 + 1
        else
            v91 = v89
        end
        local v92
        if n_6 ~= 0 then
            v92 = v89
        else
            v92 = v89 + 1
        end
        local v93 = lerp_upv_1(-v87, v87, v91 / 5)
        local v94 = lerp_upv_1(-v88, v88, v92 / 5)
        local v95 = v94 - v93
        local v96 = n_6 * 5 + v89
        a1.netStrands[v96 + 1].Size = Vector3.new(0.16, math.sqrt((v95 * v95) + (u23 * u23)), 0.16)
        a1.netRest[v96 + 1] = CFrame.new((v93 + v94) / 2, (-0.2 + (-0.2 - u23)) / 2, ((n_6 ~= 0) and 0.9) or -0.9) * CFrame.Angles(0, 0, math.atan2(v95, u23))
    end
end
u55.drawShadow = function(a1, a2, a3, a4)
    --[[
      name: drawShadow
      line: 1385
      upvalues:
        u25 (copy, index: 1)
        DUNK_HIT_CONFIG_upv_1 (copy, index: 2)
        lerp_upv_1 (copy, index: 3)
    ]]
    a1.shadow.CFrame = CFrame.new(a2 + Vector3.new(a3, u25, -6))
    local v97 = math.floor(math.clamp((a4 - DUNK_HIT_CONFIG_upv_1.floorY) / DUNK_HIT_CONFIG_upv_1.shadowSpanStuds, 0, 1) * 23)
    if v97 ~= a1.shadowStep then
        a1.shadowStep = v97
        local v98 = v97 / 23
        local v99 = (DUNK_HIT_CONFIG_upv_1.ballRadius * 2) * DUNK_HIT_CONFIG_upv_1.shadowWidthScale * (1 + (DUNK_HIT_CONFIG_upv_1.shadowGrowth * v98))
        a1.shadow.Size = Vector3.new(v99, v99 * DUNK_HIT_CONFIG_upv_1.shadowAspect, 0.4)
        a1.shadow.Transparency = lerp_upv_1(DUNK_HIT_CONFIG_upv_1.shadowTransparencyLow, DUNK_HIT_CONFIG_upv_1.shadowTransparencyHigh, v98)
    else
        return nil
    end
end
u55.updateTimerBar = function(a1, a2)
    --[[
      name: updateTimerBar
      line: 1400
      upvalues:
        u24 (copy, index: 1)
        u14 (copy, index: 2)
        u13 (copy, index: 3)
    ]]
    local v100 = math.clamp(a1.run.clockRemaining / math.max(a1.run.clockLimit, 1e-04), 0, 1)
    local v101 = math.floor(v100 * 240)
    local v102 = v100 <= 0.5
    if v101 == a1.displayedTimerTicks and v102 == a1.displayedWarn then
        return nil
    end
    a1.displayedTimerTicks = v101
    a1.displayedWarn = v102
    local v103 = math.max(v100 * 30, 0.05)
    a1.timerFill.Size = Vector3.new(v103, 1.05, 0.5)
    a1.timerFill.CFrame = CFrame.new(a2 + Vector3.new((v103 / 2) + -15, u24, 2.65))
    local timerFill_1 = a1.timerFill
    local v104
    if v102 then
        v104 = u14
    else
        v104 = u13
    end
    timerFill_1.Color = v104
end
u55.updateChip = function(a1)
    --[[
      name: updateChip
      line: 1421
      upvalues:
        multiplierForStreak_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        tbl_upv_7 (copy, index: 3)
        u18 (copy, index: 4)
    ]]
    local v105 = ((a1.hasEnded) and 0) or (a1.run.perfectStreak)
    if v105 ~= a1.displayedChipStreak then
        a1.displayedChipStreak = v105
        a1.chipBillboard.Enabled = v105 > 0
        local v106 = nil
        if v105 ~= 0 then
            local v107 = ("PERFECT \195\151%*"):format(v105)
            local v108 = ("+%*"):format(multiplierForStreak_upv_1(v105, tbl_upv_1))
            a1.chipCount.Text = v107
            a1.chipCountShadow.Text = v107
            a1.chipAward.Text = v108
            a1.chipAwardShadow.Text = v108
            v106 = a1:tierForStreak(v105)
            local chipAward_1 = a1.chipAward
            local v109
            if v106 < 0 then
                v109 = u18
            else
                v109 = tbl_upv_7[v106 + 1]
            end
            chipAward_1.TextColor3 = v109
        else
            return nil
        end
    else
        return nil
    end
end
u55.destroy = function(a1)
    --[[
      name: destroy
      line: 1448
      upvalues:
        u1 (copy, index: 1)
        BaseWorldGame_upv_1 (copy, index: 2)
    ]]
    a1:snapFireOff()
    a1.flameBed:Stop()
    a1.ballModel:PivotTo(u1)
    BaseWorldGame_upv_1.destroy(a1)
end
tbl_10 = {}
tbl_10.DunkHitGame = u55
tbl_10.DUNK_HIT_DEBUG = {clockLimitForScore = clockLimitForScore_1, hoopCentreXFor = hoopCentreXFor_1}
return tbl_10