-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local portraitCameraDistance_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "camera-framing").portraitCameraDistance
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local SPLAT_DECAL_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "decal-textures").SPLAT_DECAL_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local STACK_BALL_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").STACK_BALL_STAGE_LIGHTING
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local pausedAtom_upv_1 = v2.pausedAtom
local publishCombo_upv_1 = v2.publishCombo
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target")
local normalizeAngle_upv_1 = v3.normalizeAngle
local signedAngleDiff_upv_1 = v3.signedAngleDiff
local TAU_upv_1 = v3.TAU
local v4 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v4.readResume
local writeResume_upv_1 = v4.writeResume
local StackBallAssets_upv_1 = RuntimeLib_1.import(script, script.Parent, "stack-ball-assets").StackBallAssets
local STACK_BALL_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "stack-ball-config").STACK_BALL_CONFIG
local v5 = RuntimeLib_1.import(script, script.Parent, "stack-ball-tower")
local levelSpecFor_upv_1 = v5.levelSpecFor
local ringAddressFor_upv_1 = v5.ringAddressFor
local ringPatternFor_upv_1 = v5.ringPatternFor
local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(198, 198, 206)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(205, 205, 212)
tbl_upv_1.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local u2 = TAU_upv_1 / STACK_BALL_CONFIG_upv_1.segmentsPerRing
local u3 = STACK_BALL_CONFIG_upv_1.pillarRadius + STACK_BALL_CONFIG_upv_1.ringDepth / 2
local u4 = (2 * (STACK_BALL_CONFIG_upv_1.pillarRadius + STACK_BALL_CONFIG_upv_1.ringDepth)) * math.tan(u2 / 2) * 1.06
local tbl_upv_2 = {}
for n_1 = 0, STACK_BALL_CONFIG_upv_1.segmentsPerRing - 1 do
    local v6 = CFrame.Angles(0, (n_1 + 0.5) * u2, 0)
    table.insert(tbl_upv_2, v6 * CFrame.new(0, ((n_1 % 2 ~= 0) and -0.008) or 0.008, u3))
end
local tbl_3 = {}
tbl_3.ringA = Color3.fromRGB(58, 178, 168)
tbl_3.ringB = Color3.fromRGB(92, 203, 192)
tbl_3.pillar = Color3.fromRGB(244, 250, 246)
local tbl_4 = {}
tbl_4.ringA = Color3.fromRGB(148, 110, 220)
tbl_4.ringB = Color3.fromRGB(174, 142, 234)
tbl_4.pillar = Color3.fromRGB(246, 243, 252)
local tbl_5 = {}
tbl_5.ringA = Color3.fromRGB(244, 168, 58)
tbl_5.ringB = Color3.fromRGB(250, 194, 94)
tbl_5.pillar = Color3.fromRGB(252, 246, 234)
local tbl_6 = {}
tbl_6.ringA = Color3.fromRGB(136, 198, 70)
tbl_6.ringB = Color3.fromRGB(162, 218, 100)
tbl_6.pillar = Color3.fromRGB(246, 250, 238)
local tbl_7 = {}
tbl_7.ringA = Color3.fromRGB(72, 140, 233)
tbl_7.ringB = Color3.fromRGB(106, 168, 244)
tbl_7.pillar = Color3.fromRGB(240, 246, 252)
local tbl_upv_8 = {{ringA = Color3.fromRGB(238, 108, 92), ringB = Color3.fromRGB(248, 138, 120), pillar = Color3.fromRGB(250, 244, 232)}, tbl_3, tbl_4, tbl_5, tbl_6, tbl_7}
local u5 = Color3.fromRGB(26, 26, 31)
local u6 = Color3.fromRGB(255, 208, 96)
local u7 = Color3.fromRGB(255, 224, 138)
local u8 = Color3.fromRGB(255, 214, 100)
local u9 = Color3.fromRGB(255, 55, 45)
local u10 = Color3.fromRGB(255, 138, 48)
local u11 = Color3.fromRGB(255, 92, 30)
local u12 = Color3.fromRGB(210, 208, 202)
local u13 = Color3.fromRGB(245, 245, 255)
local u14 = Color3.fromRGB(255, 216, 102)
local u15 = Color3.fromRGB(255, 90, 100)
local u16 = Color3.fromRGB(255, 170, 70)
local u17 = Color3.new(1, 1, 1)
local u18 = Color3.fromRGB(132, 132, 138)
local u19 = TweenInfo.new(0.09, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true)
local u20 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u21 = TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u22 = STACK_BALL_CONFIG_upv_1.rotationSpeedMax * 2 / STACK_BALL_CONFIG_upv_1.rotationTurnaroundSeconds
local tbl_9 = {}
local tbl_10 = {}
tbl_10.__tostring = function()
    --[[
      name: __tostring
      line: 203
    ]]
    return "StackBallGame"
end
tbl_10.__index = BaseWorldGame_upv_1
local u23 = setmetatable(tbl_9, tbl_10)
u23.__index = u23
u23.new = function(...)
    --[[
      name: new
      line: 209
      upvalues:
        u23 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u23)
    return v7:constructor(...) or v7
end
u23.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 213
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.rings = {}
    a1.splats = {}
    a1.deathShards = {}
    a1.towerAngle = 0
    a1.renderPrevTowerAngle = 0
    a1.appliedAngularVelocity = 0
    a1.ballY = 0
    a1.renderPrevBallY = 0
    a1.ballVelocityY = 0
    a1.lowestY = 0
    a1.globalRingCursor = 0
    a1.level = 1
    a1.levelSpecCache = {}
    a1.score = 0
    a1.fireCharge = 0
    a1.burning = false
    a1.fireWarned = false
    a1.diveSmashes = 0
    a1.invulnRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.deathCount = 0
    a1.pointerHeld = false
    a1.keyHeld = false
    a1.padSuppressed = true
    a1.heldNow = false
    a1.cameraY = 0
    a1.appliedFieldOfView = 0
    a1.splatIndex = 0
    a1.fireLookOn = false
    a1.random = Random.new()
end
u23.buildScene = function(a1)
    --[[
      name: buildScene
      line: 247
      upvalues:
        StackBallAssets_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        STACK_BALL_CONFIG_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        SPLAT_DECAL_TEXTURE_upv_1 (copy, index: 6)
        tbl_upv_8 (copy, index: 7)
        u18 (copy, index: 8)
        u8 (copy, index: 9)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 10)
        u10 (copy, index: 11)
        u11 (copy, index: 12)
        u12 (copy, index: 13)
        u9 (copy, index: 14)
        PopupTextPool_upv_1 (copy, index: 15)
        subscribe_upv_1 (copy, index: 16)
        pausedAtom_upv_1 (copy, index: 17)
    ]]
    local container_1 = a1.stage.container
    a1.assets = StackBallAssets_upv_1.new()
    local v8 = a1:kitOn() and (a1.assets:has("SegmentBlack"))
    local v9 = a1:kitOn()
    if v9 then
        local _ = a1.assets:has("SegmentFloor")
    end
    local v10 = Vector3.new(u4, STACK_BALL_CONFIG_upv_1.ringHeight, STACK_BALL_CONFIG_upv_1.ringDepth)
    local v17 = nil
    for _ = 0, STACK_BALL_CONFIG_upv_1.ringPoolSize - 1 do
        local tbl_11 = {}
        local tbl_12 = {}
        for v25 = 0, STACK_BALL_CONFIG_upv_1.segmentsPerRing - 1 do
            local v12 = a1:makeSegment("Segment", v10, container_1)
            if v8 then
                local v13 = a1:makeSegment("SegmentBlack", v10, container_1)
            else
                local v13 = nil
            end
            if v9 then
                v17 = a1:makeSegment("SegmentFloor", v10, container_1)
            else
                v17 = nil
            end
            table.insert(tbl_11, v12)
            local v13 = nil
            table.insert(tbl_12, {paint = v12, black = v13, floor = v17})
        end
        table.insert(a1.rings, {segments = tbl_11, variants = tbl_12, pattern = {}})
    end
    for v14 = 0, STACK_BALL_CONFIG_upv_1.splatPoolSize - 1 do
        local v15 = makeSmoothPart_upv_1(container_1)
        v15.Transparency = 1
        v15.CFrame = u1
        local v16 = Instance.new("Decal")
        v16.Texture = SPLAT_DECAL_TEXTURE_upv_1
        v16.Face = Enum.NormalId.Top
        v16.Transparency = 1
        v16.Parent = v15
        table.insert(a1.splats, {part = v15, decal = v16})
    end
    v17 = a1:kitPart("Pillar", container_1)
    if v17 ~= nil then
        a1.pillar = v17
    else
        local v18 = makeSmoothPart_upv_1(container_1)
        v18.Shape = Enum.PartType.Cylinder
        a1.pillar = v18
    end
    a1.pillar.Size = Vector3.new(160, STACK_BALL_CONFIG_upv_1.pillarRadius * 2, STACK_BALL_CONFIG_upv_1.pillarRadius * 2)
    a1.pillar.Color = tbl_upv_8[1].pillar
    local v19 = a1:kitPart("Backdrop", container_1)
    local v14 = nil
    if v19 ~= nil then
        a1.backdrop = v19
    else
        v14 = makeSmoothPart_upv_1(container_1)
        v14.Material = Enum.Material.Neon
        v14.Color = u18
        a1.backdrop = v14
    end
    a1.backdrop.CastShadow = false
    a1.backdrop.Size = Vector3.new(3000, 2400, 1)
    v14 = a1:kitPart("Ball", container_1)
    if v14 ~= nil then
        a1.ball = v14
    else
        local v21 = makeSmoothPart_upv_1(container_1)
        v21.Shape = Enum.PartType.Ball
        v21.Material = Enum.Material.Neon
        v21.Color = u8
        a1.ball = v21
    end
    a1.ball.Size = Vector3.new(STACK_BALL_CONFIG_upv_1.ballDiameter, STACK_BALL_CONFIG_upv_1.ballDiameter, STACK_BALL_CONFIG_upv_1.ballDiameter)
    a1.ballBaseSize = a1.ball.Size
    a1.bounceBurst = Instance.new("ParticleEmitter")
    a1.bounceBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.bounceBurst.Rate = 0
    a1.bounceBurst.Lifetime = NumberRange.new(0.25, 0.5)
    a1.bounceBurst.Speed = NumberRange.new(4, 8)
    a1.bounceBurst.SpreadAngle = Vector2.new(180, 180)
    a1.bounceBurst.Rotation = NumberRange.new(0, 90)
    a1.bounceBurst.RotSpeed = NumberRange.new(-200, 200)
    a1.bounceBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.12)})
    a1.bounceBurst.LightEmission = 0.8
    a1.bounceBurst.Color = ColorSequence.new(u8)
    a1.bounceBurst.Parent = a1.ball
    a1.flames = Instance.new("ParticleEmitter")
    a1.flames.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.flames.Rate = 0
    a1.flames.Lifetime = NumberRange.new(0.35, 0.6)
    a1.flames.Speed = NumberRange.new(2, 5)
    a1.flames.SpreadAngle = Vector2.new(180, 180)
    a1.flames.Acceleration = Vector3.new(0, 26, 0)
    a1.flames.Rotation = NumberRange.new(0, 90)
    a1.flames.RotSpeed = NumberRange.new(-160, 160)
    a1.flames.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.1), NumberSequenceKeypoint.new(1, 0.2)})
    a1.flames.LightEmission = 0.85
    a1.flames.Color = ColorSequence.new(u10, u11)
    a1.flames.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(1, 1)})
    a1.flames.Parent = a1.ball
    local v22 = Instance.new("Attachment")
    v22.Position = Vector3.new(-STACK_BALL_CONFIG_upv_1.ballDiameter / 2, 0, 0)
    v22.Parent = a1.ball
    local v23 = Instance.new("Attachment")
    v23.Position = Vector3.new(STACK_BALL_CONFIG_upv_1.ballDiameter / 2, 0, 0)
    v23.Parent = a1.ball
    a1.trail = Instance.new("Trail")
    a1.trail.Attachment0 = v22
    a1.trail.Attachment1 = v23
    a1.trail.Lifetime = 0.3
    a1.trail.LightEmission = 1
    a1.trail.FaceCamera = true
    a1.trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.1)})
    a1.trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)})
    a1.trail.Color = ColorSequence.new(u8)
    a1.trail.Enabled = true
    a1.trail.Parent = a1.ball
    a1.fireHalo = makeSmoothPart_upv_1(container_1)
    a1.fireHalo.Shape = Enum.PartType.Cylinder
    a1.fireHalo.Material = Enum.Material.Neon
    a1.fireHalo.Color = u10
    a1.fireHalo.Transparency = 1
    a1.fireHalo.CFrame = u1
    a1.splashRing = makeSmoothPart_upv_1(container_1)
    a1.splashRing.Material = Enum.Material.Neon
    a1.splashRing.Shape = Enum.PartType.Cylinder
    a1.splashRing.Color = u8
    a1.splashRing.Transparency = 1
    a1.splashRing.CFrame = u1
    a1.breakAnchor = makeSmoothPart_upv_1(container_1)
    a1.breakAnchor.Transparency = 1
    a1.breakAnchor.Size = Vector3.new(4, 1, 4)
    a1.breakAnchor.CFrame = u1
    a1.breakBurst = Instance.new("ParticleEmitter")
    a1.breakBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.breakBurst.Rate = 0
    a1.breakBurst.Lifetime = NumberRange.new(0.3, 0.6)
    a1.breakBurst.Speed = NumberRange.new(8, 16)
    a1.breakBurst.SpreadAngle = Vector2.new(180, 180)
    a1.breakBurst.Rotation = NumberRange.new(0, 90)
    a1.breakBurst.RotSpeed = NumberRange.new(-200, 200)
    a1.breakBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.6), NumberSequenceKeypoint.new(1, 0.15)})
    a1.breakBurst.LightEmission = 0.6
    a1.breakBurst.Color = ColorSequence.new(u12)
    a1.breakBurst.Parent = a1.breakAnchor
    for _ = 0, 5 do
        local v24 = makeSmoothPart_upv_1(container_1)
        v24.Material = Enum.Material.Neon
        v24.Color = u9
        v24.Size = Vector3.new(0.800000011920929, 0.800000011920929, 0.800000011920929)
        v24.CFrame = u1
        table.insert(a1.deathShards, v24)
    end
    a1:applyAuthoredLighting()
    a1.popups = PopupTextPool_upv_1.new(container_1)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 441
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "pointer" then
                    a1.keyHeld = true
                else
                    a1.pointerHeld = true
                end
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a4, a5, a6)
                --[[
                  line: 448
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a6 ~= "pointer" then
                    a1.keyHeld = false
                else
                    a1.pointerHeld = false
                end
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function()
                --[[
                  line: 457
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.padSuppressed = true
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_13 = {}
        tbl_13.scoreToStuds = function(a7)
            --[[
              name: scoreToStuds
              line: 467
              upvalues:
                STACK_BALL_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a7 * STACK_BALL_CONFIG_upv_1.ringSpacing
        end
        tbl_13.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 470
              upvalues:
                a1 (copy, index: 1)
                STACK_BALL_CONFIG_upv_1 (copy, index: 2)
            ]]
            return a1.score * STACK_BALL_CONFIG_upv_1.ringSpacing
        end
        tbl_13.poseMarker = function(a8)
            --[[
              name: poseMarker
              line: 473
              upvalues:
                a1 (copy, index: 1)
                STACK_BALL_CONFIG_upv_1 (copy, index: 2)
                origin_upv_1 (copy, index: 3)
            ]]
            return CFrame.new(origin_upv_1.X, ((origin_upv_1.Y + a1.ballY) - (a8 - (a1.score * STACK_BALL_CONFIG_upv_1.ringSpacing))) + 1, origin_upv_1.Z)
        end
        registerRivalMarkers_1(tbl_13)
    end
end
u23.resetRound = function(a1)
    --[[
      name: resetRound
      line: 487
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u3 (copy, index: 3)
        u13 (copy, index: 4)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.towerAngle = 0
    a1.renderPrevTowerAngle = 0
    a1.score = 0
    a1.level = 1
    table.clear(a1.levelSpecCache)
    a1.levelSpec = a1:specForLevel(1)
    a1:snapTowerSpin()
    a1.fireCharge = 0
    a1.burning = false
    a1.fireWarned = false
    a1.diveSmashes = 0
    a1.invulnRemaining = 0
    a1.pointerHeld = false
    a1.keyHeld = false
    a1.padSuppressed = true
    a1.heldNow = false
    a1.splatIndex = 0
    a1.globalRingCursor = 0
    for _, value_1 in a1.rings do
        a1:layoutRing(value_1, a1.globalRingCursor)
        a1.globalRingCursor = a1.globalRingCursor + 1
    end
    a1.ballY = (-STACK_BALL_CONFIG_upv_1.ringSpacing + (STACK_BALL_CONFIG_upv_1.ringHeight / 2)) + (STACK_BALL_CONFIG_upv_1.ballDiameter / 2)
    a1.renderPrevBallY = a1.ballY
    a1.ballVelocityY = STACK_BALL_CONFIG_upv_1.bounceVelocity
    a1.lowestY = a1.ballY
    a1.cameraY = a1.ballY + STACK_BALL_CONFIG_upv_1.cameraFocusAbove
    a1:restoreBall()
    a1:applyFireLook(false)
    a1:retintLevel(false)
    for _, value_2 in a1.splats do
        a1:releaseSplat(value_2)
    end
    for _, value_3 in a1.deathShards do
        value_3.Anchored = true
        value_3.CFrame = u1
    end
    a1.popups:hideAll()
    a1.popups:show(a1.stage.origin + Vector3.new(0, a1.ballY + 6, u3), "HOLD TO SMASH", u13, 1.6)
    a1.context.reportScore(0)
end
u23.revive = function(a1)
    --[[
      name: revive
      line: 543
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1:setRunning(true)
    a1.invulnRemaining = STACK_BALL_CONFIG_upv_1.reviveInvulnSeconds
    a1.burning = false
    a1.fireCharge = 0
    a1.fireWarned = false
    a1.diveSmashes = 0
    a1.padSuppressed = true
    a1:applyFireLook(false)
    a1:restoreBall()
    for v25, v26 in a1.deathShards do
        v26.Anchored = true
        v26.CFrame = u1
    end
    local v25, v27, v28, v29
    v25, v27, v28, v29 = false, 0, 0, nil
    local v30 = nil
    while true do
        if v25 then
            v27 = v27 + 1
        else
            v25 = true
        end
        if v27 >= STACK_BALL_CONFIG_upv_1.ringPoolSize * 2 then
            break
        end
        local v26
        if v28 >= STACK_BALL_CONFIG_upv_1.reviveClearRings then
            break
        end
        if v29 == nil then
            v30 = a1.ballY
        else
            v30 = v29
        end
        v26 = a1:topmostIntactBelow(v30)
        if v26 == nil then
            break
        end
        a1:clearRingBlack(v26)
        v28, v29 = v28 + 1, v26.y + STACK_BALL_CONFIG_upv_1.ringHeight / 2
    end
    v27 = a1:topmostIntactBelow(a1.ballY + (STACK_BALL_CONFIG_upv_1.ringSpacing * 2))
    if v27 ~= nil then
        a1.ballY = ((v27.y + (STACK_BALL_CONFIG_upv_1.ringHeight / 2)) + (STACK_BALL_CONFIG_upv_1.ballDiameter / 2)) + 2
    end
    a1.renderPrevBallY = a1.ballY
    a1.ballVelocityY = STACK_BALL_CONFIG_upv_1.bounceVelocity
end
u23.captureRound = function(a1)
    --[[
      name: captureRound
      line: 597
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        STACK_BALL_CONFIG_upv_1 (copy, index: 2)
    ]]
    if not (a1.dead) and not (a1.heldNow) and not (a1.burning) then
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 602
                  upvalues:
                    a1 (copy, index: 1)
                    STACK_BALL_CONFIG_upv_1 (copy, index: 2)
                ]]
                a2:int(a1.score):int(a1.level):int(a1.globalRingCursor)
                a2:num(a1.ballY):num(a1.ballVelocityY):num(a1.towerAngle)
                a2:num(a1.fireCharge):num(a1.lowestY)
                local tbl_14 = {}
                for n_2 = 0, STACK_BALL_CONFIG_upv_1.ringPoolSize - 1 do
                    local v31
                    v31 = a1:ringByGlobalIndex(a1.globalRingCursor - STACK_BALL_CONFIG_upv_1.ringPoolSize + n_2)
                    if v31 ~= nil then
                        table.insert(tbl_14, ((v31.smashed) and "1") or (((v31.cleared) and "2") or "0"))
                    else
                        table.insert(tbl_14, "1")
                    end
                end
                a2:str(table.concat(tbl_14, ""))
            end
        )
    end
    return nil
end
u23.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 622
      upvalues:
        readResume_upv_1 (copy, index: 1)
        STACK_BALL_CONFIG_upv_1 (copy, index: 2)
        normalizeAngle_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local v32 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 623
            ]]
            local tbl_15 = {}
            tbl_15.score = a3:int()
            tbl_15.level = a3:int()
            tbl_15.cursor = a3:int()
            tbl_15.ballY = a3:num()
            tbl_15.ballVelocityY = a3:num()
            tbl_15.towerAngle = a3:num()
            tbl_15.fireCharge = a3:num()
            tbl_15.lowestY = a3:num()
            tbl_15.states = a3:str()
            return tbl_15
        end
    )
    if v32 ~= nil and #v32.states == STACK_BALL_CONFIG_upv_1.ringPoolSize and v32.cursor >= STACK_BALL_CONFIG_upv_1.ringPoolSize then
        a1.level = math.max(v32.level, 1)
        a1.levelSpec = a1:specForLevel(a1.level)
        a1:snapTowerSpin()
        a1.score = a2.score
        a1.globalRingCursor = v32.cursor
        a1.towerAngle = normalizeAngle_upv_1(v32.towerAngle)
        a1.renderPrevTowerAngle = a1.towerAngle
        a1.ballY = v32.ballY
        a1.renderPrevBallY = a1.ballY
        a1.ballVelocityY = v32.ballVelocityY
        a1.lowestY = math.min(v32.lowestY, a1.ballY)
        a1.cameraY = a1.lowestY + STACK_BALL_CONFIG_upv_1.cameraFocusAbove
        a1.fireCharge = math.clamp(v32.fireCharge, 0, 1)
        for n_3 = 0, STACK_BALL_CONFIG_upv_1.ringPoolSize - 1 do
            local v33 = a1.rings[n_3 + 1]
            a1:layoutRing(v33, v32.cursor - STACK_BALL_CONFIG_upv_1.ringPoolSize + n_3)
            local v34
            v34 = string.sub(v32.states, n_3 + 1, n_3 + 1)
            if v34 == "1" then
                v33.smashed = true
                for _, value_4 in v33.segments do
                    value_4.CFrame = u1
                end
            elseif v34 == "2" then
                a1:clearRingBlack(v33)
            end
        end
        a1:retintLevel(false)
        a1.context.reportScore(a2.score)
        return true
    end
    return false
end
u23.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 683
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        normalizeAngle_upv_1 (copy, index: 2)
        STACK_BALL_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v35 = nil
    if a1.dead then
        return nil
    else
        a1.renderPrevBallY = a1.ballY
        a1.renderPrevTowerAngle = a1.towerAngle
        v35 = gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)
        if not (v35) then
            a1.padSuppressed = false
        end
        a1.heldNow = a1.pointerHeld or (a1.keyHeld or (v35 and (not a1.padSuppressed)))
        if a1.invulnRemaining > 0 and a1.heldNow then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        a1.towerAngle = normalizeAngle_upv_1(a1.towerAngle + (a1:stepTowerSpin(a2) * a2))
        local ballY_1 = a1.ballY
        if a1.heldNow then
            local v36
            if a1.burning then
                v36 = -STACK_BALL_CONFIG_upv_1.fireSmashSpeed
            else
                v36 = -STACK_BALL_CONFIG_upv_1.smashSpeed
            end
            a1.ballVelocityY = v36
        else
            a1.ballVelocityY = a1:releasedVelocity(a2)
            if a1.diveSmashes > 0 then
                a1:flushDiveCombo()
            end
        end
        a1:stepFireMeter(a2)
        a1.ballY = a1.ballY + (a1.ballVelocityY * a2)
        a1:handleCrossings(ballY_1)
        if a1.ballY < a1.lowestY then
            a1.lowestY = a1.ballY
        end
        for _, value_5 in a1.rings do
            if a1.lowestY + 30 < value_5.y then
                a1:layoutRing(value_5, a1.globalRingCursor)
                a1.globalRingCursor = a1.globalRingCursor + 1
            end
        end
        for _, value_6 in a1.splats do
            if value_6.ring == nil then
                continue
            end
            value_6.age = value_6.age + a2
            if STACK_BALL_CONFIG_upv_1.splatLifetimeSeconds <= value_6.age then
                a1:releaseSplat(value_6)
            end
        end
    end
end
u23.stepTowerSpin = function(a1, a2)
    --[[
      name: stepTowerSpin
      line: 746
      upvalues:
        u22 (copy, index: 1)
    ]]
    local v37 = u22 * a2
    a1.appliedAngularVelocity = a1.appliedAngularVelocity + math.clamp((a1.levelSpec.direction * a1.levelSpec.rotationSpeed) - a1.appliedAngularVelocity, -v37, v37)
    return a1.appliedAngularVelocity
end
u23.snapTowerSpin = function(a1)
    --[[
      name: snapTowerSpin
      line: 753
    ]]
    a1.appliedAngularVelocity = a1.levelSpec.direction * a1.levelSpec.rotationSpeed
end
u23.stepFireMeter = function(a1, a2)
    --[[
      name: stepFireMeter
      line: 756
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        u15 (copy, index: 3)
    ]]
    if a1.burning then
        a1.fireCharge = a1.fireCharge - (STACK_BALL_CONFIG_upv_1.fireBurnDrainPerSecond * a2)
        if not (a1.fireWarned) and a1.fireCharge / STACK_BALL_CONFIG_upv_1.fireBurnDrainPerSecond <= STACK_BALL_CONFIG_upv_1.fireWarnSeconds then
            a1.fireWarned = true
            a1.popups:show(a1.stage.origin + Vector3.new(0, a1.ballY + 4, u3), "!", u15, 1.1)
            a1.context.audio.play("scorePing", {})
        end
        if a1.fireCharge <= 0 then
            a1.fireCharge = 0
            a1.burning = false
            a1:applyFireLook(false)
        end
        return nil
    end
    if a1.heldNow and a1.ballVelocityY < 0 then
        return nil
    end
    a1.fireCharge = math.max(a1.fireCharge - (STACK_BALL_CONFIG_upv_1.fireIdleDrainPerSecond * a2), 0)
end
u23.bankFireCharge = function(a1)
    --[[
      name: bankFireCharge
      line: 786
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    if not (a1.burning) and a1.diveSmashes >= 2 then
        a1.fireCharge = math.min(a1.fireCharge + STACK_BALL_CONFIG_upv_1.fireChargePerSmash, 1)
        if a1.fireCharge >= 1 then
            a1.burning = true
            a1.fireWarned = false
            a1:applyFireLook(true)
            a1.context.audio.play("flameIgnite", {})
            a1.popups:show(a1.stage.origin + Vector3.new(0, a1.ballY + 4, u3), "FIREBALL!", u16, 1)
            return
        end
        return nil
    end
    return nil
end
u23.handleCrossings = function(a1, a2)
    --[[
      name: handleCrossings
      line: 805
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v38 = nil
    for _, value_7 in a1.rings do
        if value_7.smashed then
            continue
        end
        v38 = value_7.y + STACK_BALL_CONFIG_upv_1.ringHeight / 2
        if v38 > a2 - (STACK_BALL_CONFIG_upv_1.ballDiameter / 2) or a1.ballY - (STACK_BALL_CONFIG_upv_1.ballDiameter / 2) >= v38 then
            continue
        end
        if a1.heldNow then
            if a1.burning then
                a1:smashRing(value_7)
                continue
            end
            if a1.invulnRemaining > 0 then
                a1:smashRing(value_7)
                continue
            end
            if a1:segmentUnderBall(value_7) ~= "black" then
                a1:smashRing(value_7)
                continue
            end
            a1:die(value_7)
        else
            a1:bounce(v38, value_7)
        end
        return nil
    end
end
u23.segmentUnderBall = function(a1, a2)
    --[[
      name: segmentUnderBall
      line: 829
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        STACK_BALL_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v39 = normalizeAngle_upv_1(0 - a1.towerAngle) / u2
    local segmentsPerRing_1 = STACK_BALL_CONFIG_upv_1.segmentsPerRing
    local v40 = math.clamp(math.floor(v39), 0, segmentsPerRing_1 - 1)
    local v41 = a2.pattern[v40 + 1]
    local v42, v43 = nil, nil
    if v41 == "black" then
        v42 = 0.032 * a1.levelSpec.rotationSpeed / u2
        v43 = v39 - math.floor(v39)
        if v43 < v42 and a2.pattern[(((v40 - 1) + segmentsPerRing_1) % segmentsPerRing_1) + 1] == "paint" or 1 - v42 < v43 and a2.pattern[((v40 + 1) % segmentsPerRing_1) + 1] == "paint" then
            return "paint"
        end
        return "black"
    end
    return v41
end
u23.bounce = function(a1, a2, a3)
    --[[
      name: bounce
      line: 848
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u19 (copy, index: 3)
    ]]
    a1:stampSplat(a3)
    a1.ballY = a2 + (STACK_BALL_CONFIG_upv_1.ballDiameter / 2)
    a1.ballVelocityY = STACK_BALL_CONFIG_upv_1.bounceVelocity
    a1.bounceBurst:Emit(7)
    a1:pulseSplash(a2)
    a1.ball.Size = a1.ballBaseSize
    local tbl_16 = {}
    tbl_16.Size = a1.ballBaseSize * 0.8
    TweenService_upv_1:Create(a1.ball, u19, tbl_16):Play()
    a1.context.audio.play("pop", {})
    a1.context.audio.play("splat", {})
end
u23.smashRing = function(a1, a2)
    --[[
      name: smashRing
      line: 870
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        publishCombo_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
        u10 (copy, index: 4)
    ]]
    a1.context.audio.play("thud", {})
    a1.context.audio.play("woodBreak", {pitch = math.min(1 + (a1.diveSmashes * 0.045), 1.45)})
    if not (a2.smashed) then
        a1.score = a1.score + a1:chainMultiplier()
        a1.context.reportScore(a1.score)
        a1.diveSmashes = a1.diveSmashes + 1
        a1:bankFireCharge()
        if STACK_BALL_CONFIG_upv_1.comboStampFrom <= a1.diveSmashes then
            publishCombo_upv_1({count = a1.diveSmashes, color = u16})
        end
    end
    local isFloor_1 = a2.isFloor
    local v44
    if a1.burning then
        v44 = u10
    else
        v44 = nil
    end
    a1:breakRing(a2, v44)
    a1.stage.shake((isFloor_1 and 0.8) or 0.35)
    if not isFloor_1 then
        return
    end
    a1:completeLevel(a2.level)
end
u23.completeLevel = function(a1, a2)
    --[[
      name: completeLevel
      line: 906
      upvalues:
        u3 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    a1.level = a2 + 1
    a1.levelSpec = a1:specForLevel(a1.level)
    a1:retintLevel(true)
    a1.popups:show(a1.stage.origin + Vector3.new(0, a1.ballY + 5, u3), ("LEVEL %*"):format(a1.level), u14, 1.3)
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("whoosh", {})
end
u23.breakRing = function(a1, a2, a3)
    --[[
      name: breakRing
      line: 923
      upvalues:
        u2 (copy, index: 1)
        u3 (copy, index: 2)
        u12 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    a2.smashed = true
    a2.smashCount = a2.smashCount + 1
    for u24 = 0, #a2.segments - 1 do
        local v45 = a2.segments[u24 + 1]
        if a3 ~= nil and v45 == a2.variants[u24 + 1].paint then
            v45.Color = a3
        end
        local v46 = (u24 + 0.5) * u2 + a1.towerAngle
        local v47 = Vector3.new(math.sin(v46), 0, math.cos(v46))
        v45.Anchored = false
        v45.AssemblyLinearVelocity = (v47 * 24) + Vector3.new(0, -3, 0)
        v45.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-8, 8), 0, a1.random:NextNumber(-8, 8))
    end
    for v48, value_8 in a1.splats do
        if value_8.ring == a2 then
            a1:releaseSplat(value_8)
        end
    end
    a1.breakAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a2.y, u3))
    local u24 = a1.breakBurst
    local v48 = ColorSequence.new
    local v49
    if a3 == nil then
        v49 = u12
    else
        v49 = a3
    end
    u24.Color = v48(v49)
    a1.breakBurst:Emit(12)
    u24 = a2.smashCount
    task.delay(
        2.5,
        function()
            --[[
              line: 954
              upvalues:
                a2 (copy, index: 1)
                u24 (copy, index: 2)
                u1 (copy, index: 3)
            ]]
            if a2.smashed and a2.smashCount == u24 then
                for _, value_9 in a2.segments do
                    value_9.Anchored = true
                    value_9.CFrame = u1
                end
            else
                return nil
            end
        end
    )
end
u23.chainMultiplier = function(a1)
    --[[
      name: chainMultiplier
      line: 964
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.min(math.floor(a1.diveSmashes / STACK_BALL_CONFIG_upv_1.chainSmashesPerTier) + 1, STACK_BALL_CONFIG_upv_1.chainMultiplierMax))
end
u23.flushDiveCombo = function(a1)
    --[[
      name: flushDiveCombo
      line: 967
    ]]
    a1.diveSmashes = 0
end
u23.releasedVelocity = function(a1, a2)
    --[[
      name: releasedVelocity
      line: 970
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v50 = a1.ballVelocityY + STACK_BALL_CONFIG_upv_1.gravity * a2
    if v50 < -55 then
        return (math.min(a1.ballVelocityY + (220 * a2), -55))
    end
    return v50
end
u23.die = function(a1, a2)
    --[[
      name: die
      line: 977
      upvalues:
        u3 (copy, index: 1)
        u15 (copy, index: 2)
        u1 (copy, index: 3)
        STACK_BALL_CONFIG_upv_1 (copy, index: 4)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:flashKillerSegment(a2)
        a1:setRunning(false)
        a1.deathCount = a1.deathCount + 1
        a1:flushDiveCombo()
        a1.burning = false
        a1:applyFireLook(false)
        a1.stage.shake(1.1)
        a1.context.audio.play("buzz", {})
        a1.context.audio.play("explosion", {})
        a1.popups:show(a1.stage.origin + Vector3.new(0, a1.ballY + 4, u3), "BLACK!", u15, 1.2)
        a1.ball.CFrame = u1
        local v51 = a1.stage.origin + Vector3.new(0, a1.ballY, u3)
        for _, value_10 in a1.deathShards do
            value_10.CFrame = CFrame.new(v51 + Vector3.new(a1.random:NextNumber(-0.6, 0.6), 0, 0))
            value_10.Anchored = false
            value_10.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-14, 14), a1.random:NextNumber(10, 22), a1.random:NextNumber(4, 14))
            value_10.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-12, 12), a1.random:NextNumber(-12, 12), a1.random:NextNumber(-12, 12))
        end
        local deathCount_upv_1 = a1.deathCount
        task.delay(
            2.5,
            function()
                --[[
                  line: 1021
                  upvalues:
                    a1 (copy, index: 1)
                    deathCount_upv_1 (copy, index: 2)
                    u1 (copy, index: 3)
                ]]
                if a1.deathCount == deathCount_upv_1 then
                    for _, value_11 in a1.deathShards do
                        value_11.Anchored = true
                        value_11.CFrame = u1
                    end
                else
                    return nil
                end
            end
        )
        local score_upv_1 = a1.score
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            STACK_BALL_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1032
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    score_upv_1 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(score_upv_1)
            end
        )
    end
end
u23.flashKillerSegment = function(a1, a2)
    --[[
      name: flashKillerSegment
      line: 1038
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        STACK_BALL_CONFIG_upv_1 (copy, index: 3)
        u9 (copy, index: 4)
    ]]
    local v52 = math.clamp(math.floor(normalizeAngle_upv_1(0 - a1.towerAngle) / u2), 0, STACK_BALL_CONFIG_upv_1.segmentsPerRing - 1)
    local v53 = a2.segments[v52 + 1]
    if v53 ~= nil and v53 == a2.variants[v52 + 1].paint then
        v53.Color = u9
    else
        return nil
    end
end
u23.specForLevel = function(a1, a2)
    --[[
      name: specForLevel
      line: 1049
      upvalues:
        levelSpecFor_upv_1 (copy, index: 1)
        tbl_upv_8 (copy, index: 2)
    ]]
    local v54 = a1.levelSpecCache[a2]
    if v54 == nil then
        local v55 = levelSpecFor_upv_1(a1.context.getRunSeed(), a2, #tbl_upv_8)
        a1.levelSpecCache[a2] = v55
        return v55
    end
    return v54
end
u23.layoutRing = function(a1, a2, a3)
    --[[
      name: layoutRing
      line: 1062
      upvalues:
        ringAddressFor_upv_1 (copy, index: 1)
        STACK_BALL_CONFIG_upv_1 (copy, index: 2)
        ringPatternFor_upv_1 (copy, index: 3)
    ]]
    local v56 = ringAddressFor_upv_1(a3)
    a2.globalIndex = a3
    a2.level = v56.level
    a2.isFloor = v56.isFloor
    a2.y = -(a3 + 1) * STACK_BALL_CONFIG_upv_1.ringSpacing
    a2.pattern = ringPatternFor_upv_1(a1.context.getRunSeed(), a3, v56)
    a2.smashed = false
    a2.smashCount = a2.smashCount + 1
    a2.cleared = false
    a1:dressRing(a2)
end
u23.dressRing = function(a1, a2)
    --[[
      name: dressRing
      line: 1074
      upvalues:
        tbl_upv_8 (copy, index: 1)
        u1 (copy, index: 2)
        u6 (copy, index: 3)
        u7 (copy, index: 4)
        u5 (copy, index: 5)
    ]]
    local v57 = tbl_upv_8[a1:specForLevel(a2.level).paletteIndex + 1]
    local v58, v59, v60 = nil, nil, nil
    for n_4 = 0, #a2.segments - 1 do
        local v61 = a2.variants[n_4 + 1]
        local v62 = a2.pattern[n_4 + 1]
        if a2.isFloor then
            v58 = v61.floor
        elseif v62 ~= "black" then
            v58 = nil
        else
            v58 = v61.black
        end
        local v63 = v58 or (v61.paint)
        a2.segments[n_4 + 1] = v63
        for _, value_12 in {v61.paint, v61.black, v61.floor} do
            if value_12 == nil then
                continue
            end
            if value_12 ~= v63 then
                value_12.Anchored = true
                value_12.CFrame = u1
            end
        end
        v63.Anchored = true
        if v58 ~= nil then
            continue
        end
        if a2.isFloor then
            if n_4 % 2 ~= 0 then
                v59 = u7
            else
                v59 = u6
            end
            v63.Color = v59
        else
            if v62 == "black" then
                v63.Color = u5
                v63.TopSurface = Enum.SurfaceType.SmoothNoOutlines
                continue
            end
            if n_4 % 2 ~= 0 then
                v60 = v57.ringB
            else
                v60 = v57.ringA
            end
            v63.Color = v60
        end
        v63.TopSurface = Enum.SurfaceType.Studs
    end
end
u23.clearRingBlack = function(a1, a2)
    --[[
      name: clearRingBlack
      line: 1111
    ]]
    local v64 = false
    v64 = v64
    for n_5 = 0, #a2.pattern - 1 do
        if a2.pattern[n_5 + 1] == "black" then
            a2.pattern[n_5 + 1] = "paint"
            v64 = true
        end
    end
    a2.cleared = true
    if not v64 then
        return
    end
    a1:dressRing(a2)
end
u23.ringByGlobalIndex = function(a1, a2)
    --[[
      name: ringByGlobalIndex
      line: 1124
    ]]
    for _, value_13 in a1.rings do
        if value_13.globalIndex ~= a2 then
            continue
        end
        return value_13
    end
    return nil
end
u23.topmostIntactBelow = function(a1, a2)
    --[[
      name: topmostIntactBelow
      line: 1132
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v65
    v65 = nil
    local v66 = nil
    for _, value_14 in a1.rings do
        if value_14.smashed then
            continue
        end
        v66 = value_14.y + STACK_BALL_CONFIG_upv_1.ringHeight / 2
        if a2 <= v66 then
            continue
        end
        if v65 == nil or v65.y + (STACK_BALL_CONFIG_upv_1.ringHeight / 2) < v66 then
            v65 = value_14
        end
    end
    return v65
end
u23.applyFireLook = function(a1, a2)
    --[[
      name: applyFireLook
      line: 1148
      upvalues:
        u11 (copy, index: 1)
        u10 (copy, index: 3)
    ]]
    if a1.fireLookOn ~= a2 then
        a1.fireLookOn = a2
        local ball_1 = a1.ball
        ball_1.Color = u11
        local trail_1 = a1.trail
        trail_1.Color = ColorSequence.new(u10)
        a1.flames.Rate = (a2 and 45) or 0
    else
        return nil
    end
end
u23.kitOn = function(a1)
    --[[
      name: kitOn
      line: 1157
    ]]
    return a1.assets.available
end
u23.kitPart = function(a1, a2, a3)
    --[[
      name: kitPart
      line: 1160
    ]]
    if a1:kitOn() then
        return a1.assets:part(a2, a3)
    end
    return nil
end
u23.makeSegment = function(a1, a2, a3, a4)
    --[[
      name: makeSegment
      line: 1166
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v67 = a1:kitPart(a2, a4)
    local v68
    if v67 ~= nil then
        v68 = v67
    else
        local v69 = makeStagePart_upv_1(a4)
        v69.BackSurface = Enum.SurfaceType.Smooth
        v69.FrontSurface = Enum.SurfaceType.Smooth
        v68 = v69
    end
    v68.Size = a3
    v68.CFrame = u1
    return v68
end
u23.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 1181
      upvalues:
        readLightingFolderProfile_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        STACK_BALL_STAGE_LIGHTING_upv_1 (copy, index: 3)
    ]]
    local lighting_1 = a1.assets.lighting
    if a1:kitOn() and lighting_1 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(lighting_1, tbl_upv_1, STACK_BALL_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u23.retintLevel = function(a1, a2)
    --[[
      name: retintLevel
      line: 1188
      upvalues:
        tbl_upv_8 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u21 (copy, index: 3)
    ]]
    local v70 = tbl_upv_8[a1.levelSpec.paletteIndex + 1]
    if a2 then
        local tbl_17 = {}
        tbl_17.Color = v70.pillar
        TweenService_upv_1:Create(a1.pillar, u21, tbl_17):Play()
    else
        a1.pillar.Color = v70.pillar
    end
end
u23.pulseSplash = function(a1, a2)
    --[[
      name: pulseSplash
      line: 1198
      upvalues:
        u3 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u20 (copy, index: 3)
    ]]
    a1.splashRing.Size = Vector3.new(0.30000001192092896, 1.2000000476837158, 1.2000000476837158)
    a1.splashRing.Transparency = 0.2
    a1.splashRing.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a2 + 0.1, u3)) * CFrame.Angles(0, 0, 1.5707963267948966)
    TweenService_upv_1:Create(a1.splashRing, u20, {}):Play()
end
u23.stampSplat = function(a1, a2)
    --[[
      name: stampSplat
      line: 1211
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        TAU_upv_1 (copy, index: 2)
        STACK_BALL_CONFIG_upv_1 (copy, index: 3)
        u17 (copy, index: 4)
    ]]
    local v71 = a1.splats[a1.splatIndex + 1]
    a1.splatIndex = (a1.splatIndex + 1) % #a1.splats
    if v71 ~= nil then
        v71.ring = a2
        v71.localAngle = normalizeAngle_upv_1(0 - a1.towerAngle)
        v71.spin = a1.random:NextNumber(0, TAU_upv_1)
        v71.age = 0
        local v72 = a1.random:NextNumber(STACK_BALL_CONFIG_upv_1.splatDiameterMin, STACK_BALL_CONFIG_upv_1.splatDiameterMax)
        v71.part.Size = Vector3.new(v72, 0.12, v72)
        v71.decal.Color3 = a1.ball.Color:Lerp(u17, 0.55)
        v71.decal.Transparency = 0.12
    else
        return nil
    end
end
u23.releaseSplat = function(a1, a2)
    --[[
      name: releaseSplat
      line: 1226
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.ring = nil
    a2.part.CFrame = u1
    a2.decal.Transparency = 1
end
u23.restoreBall = function(a1)
    --[[
      name: restoreBall
      line: 1231
      upvalues:
        u8 (copy, index: 1)
    ]]
    a1.ball.Anchored = true
    a1.ball.Color = u8
    a1.ball.Size = a1.ballBaseSize
    a1.trail.Enabled = true
end
u23.render = function(a1, a2)
    --[[
      name: render
      line: 1237
    ]]
    a1:drawScene(a2)
end
u23.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 1240
    ]]
    a1:drawScene(a2)
end
u23.drawScene = function(a1, a2)
    --[[
      name: drawScene
      line: 1243
      upvalues:
        lerp_upv_1 (copy, index: 1)
        signedAngleDiff_upv_1 (copy, index: 2)
        u3 (copy, index: 3)
        tbl_upv_2 (copy, index: 4)
        STACK_BALL_CONFIG_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        u11 (copy, index: 7)
        u17 (copy, index: 8)
        u10 (copy, index: 9)
        portraitCameraDistance_upv_1 (copy, index: 10)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local origin_2 = a1.stage.origin
    local v73 = lerp_upv_1(a1.renderPrevBallY, a1.ballY, renderAlpha_1)
    local v74 = a1.renderPrevTowerAngle + signedAngleDiff_upv_1(a1.renderPrevTowerAngle, a1.towerAngle) * renderAlpha_1
    if not (a1.dead) then
        a1.ball.CFrame = CFrame.new(origin_2 + Vector3.new(0, v73, u3))
    end
    local v75 = nil
    local v76 = nil
    for _, value_15 in a1.rings do
        if value_15.smashed then
            continue
        end
        v75 = CFrame.new(origin_2.X, origin_2.Y + value_15.y, origin_2.Z) * CFrame.Angles(0, v74, 0)
        v76 = value_15.segments
        for n_6 = 0, #v76 - 1 do
            v76[n_6 + 1].CFrame = v75 * tbl_upv_2[n_6 + 1]
        end
    end
    local v77 = nil
    for _, value_16 in a1.splats do
        v77 = value_16.ring
        if v77 ~= nil then
            local v78 = v74 + value_16.localAngle
            value_16.part.CFrame = CFrame.new(origin_2 + Vector3.new(math.sin(v78) * u3, (v77.y + (STACK_BALL_CONFIG_upv_1.ringHeight / 2)) + 0.06, math.cos(v78) * u3)) * CFrame.Angles(0, v78 + value_16.spin, 0)
            value_16.decal.Transparency = 0.12 + (0.85 * (value_16.age / STACK_BALL_CONFIG_upv_1.splatLifetimeSeconds))
        end
    end
    if a1.dead or a1.fireCharge <= 0.02 and not (a1.burning) then
        a1.fireHalo.CFrame = u1
        a1.cameraY = a1.cameraY + (((a1.lowestY + STACK_BALL_CONFIG_upv_1.cameraFocusAbove) - a1.cameraY) * math.min(a2 * STACK_BALL_CONFIG_upv_1.cameraFollowRate, 1))
        local v79 = origin_2 + Vector3.new(0, a1.cameraY, 0)
        local ViewportSize_1 = a1.stage.camera.ViewportSize
        local value_16 = a1.stage.getOrientation() == "portrait"
        if value_16 then
            v77 = portraitCameraDistance_upv_1(1, STACK_BALL_CONFIG_upv_1.portraitZoomOut, ViewportSize_1, STACK_BALL_CONFIG_upv_1.portraitMaxZoomOut)
        else
            v77 = 1
        end
        if value_16 then
            v76 = STACK_BALL_CONFIG_upv_1.cameraLookDownPortrait
        else
            v76 = STACK_BALL_CONFIG_upv_1.cameraLookDown
        end
        local v80 = v79 + Vector3.new(0, STACK_BALL_CONFIG_upv_1.cameraUp * v77, STACK_BALL_CONFIG_upv_1.cameraBack * v77)
        a1:applyFieldOfView(ViewportSize_1)
        a1.stage.setCameraCFrame(CFrame.lookAt(v80, v79 + Vector3.new(0, -v76, 0)))
        a1.pillar.CFrame = CFrame.new(origin_2 + Vector3.new(0, a1.cameraY, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
        a1.backdrop.CFrame = CFrame.new(origin_2 + Vector3.new(0, a1.cameraY - 150, -60))
        return
    end
    local v81 = STACK_BALL_CONFIG_upv_1.ballDiameter + 0.8 + a1.fireCharge * 1.6
    a1.fireHalo.Size = Vector3.new(0.14, v81, v81)
    local fireHalo_1 = a1.fireHalo
    local v82
    if a1.burning then
        v82 = u11
    else
        v82 = u17:Lerp(u10, a1.fireCharge)
    end
    fireHalo_1.Color = v82
    a1.fireHalo.Transparency = ((a1.burning) and 0.25) or (0.75 - a1.fireCharge * 0.3)
    a1.fireHalo.CFrame = CFrame.new(origin_2 + Vector3.new(0, v73, u3 - 0.6)) * CFrame.Angles(0, 1.5707963267948966, 0)
    a1.cameraY = a1.cameraY + (((a1.lowestY + STACK_BALL_CONFIG_upv_1.cameraFocusAbove) - a1.cameraY) * math.min(a2 * STACK_BALL_CONFIG_upv_1.cameraFollowRate, 1))
    local v79 = origin_2 + Vector3.new(0, a1.cameraY, 0)
    local ViewportSize_1 = a1.stage.camera.ViewportSize
    local value_16 = a1.stage.getOrientation() == "portrait"
    if value_16 then
        v77 = portraitCameraDistance_upv_1(1, STACK_BALL_CONFIG_upv_1.portraitZoomOut, ViewportSize_1, STACK_BALL_CONFIG_upv_1.portraitMaxZoomOut)
    else
        v77 = 1
    end
    if value_16 then
        v76 = STACK_BALL_CONFIG_upv_1.cameraLookDownPortrait
    else
        v76 = STACK_BALL_CONFIG_upv_1.cameraLookDown
    end
    local v80 = v79 + Vector3.new(0, STACK_BALL_CONFIG_upv_1.cameraUp * v77, STACK_BALL_CONFIG_upv_1.cameraBack * v77)
    a1:applyFieldOfView(ViewportSize_1)
    a1.stage.setCameraCFrame(CFrame.lookAt(v80, v79 + Vector3.new(0, -v76, 0)))
    a1.pillar.CFrame = CFrame.new(origin_2 + Vector3.new(0, a1.cameraY, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
    a1.backdrop.CFrame = CFrame.new(origin_2 + Vector3.new(0, a1.cameraY - 150, -60))
end
u23.applyFieldOfView = function(a1, a2)
    --[[
      name: applyFieldOfView
      line: 1316
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v83
    if a2.X / a2.Y <= 1.4 then
        v83 = STACK_BALL_CONFIG_upv_1.fieldOfView
    else
        v83 = STACK_BALL_CONFIG_upv_1.fieldOfViewWide
    end
    if v83 ~= a1.appliedFieldOfView then
        a1.appliedFieldOfView = v83
        a1.stage.camera.FieldOfView = v83
    else
        return nil
    end
end
u23.destroy = function(a1)
    --[[
      name: destroy
      line: 1324
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.deathCount = a1.deathCount + 1
    BaseWorldGame_upv_1.destroy(a1)
end
local tbl_18 = {}
tbl_18.StackBallGame = u23
return tbl_18