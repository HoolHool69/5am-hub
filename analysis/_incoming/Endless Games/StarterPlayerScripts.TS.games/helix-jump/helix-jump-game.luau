-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local TweenService_upv_1 = v1.TweenService
local UserInputService_upv_1 = v1.UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local portraitCameraDistance_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "camera-framing").portraitCameraDistance
local SPLAT_DECAL_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "decal-textures").SPLAT_DECAL_TEXTURE
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local HELIX_JUMP_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").HELIX_JUMP_STAGE_LIGHTING
local HelixJumpAssets_upv_1 = RuntimeLib_1.import(script, script.Parent, "helix-jump-assets").HelixJumpAssets
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow")
local SpectateFollow_upv_1 = v3.SpectateFollow
local approach_upv_1 = v3.approach
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v4 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v4.readResume
local writeResume_upv_1 = v4.writeResume
local v5 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target")
local minAngleDiff_upv_1 = v5.minAngleDiff
local normalizeAngle_upv_1 = v5.normalizeAngle
local signedAngleDiff_upv_1 = v5.signedAngleDiff
local TAU_upv_1 = v5.TAU
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local HELIX_JUMP_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "helix-jump-config").HELIX_JUMP_CONFIG
local u1 = TAU_upv_1 / HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform
local u2 = HELIX_JUMP_CONFIG_upv_1.pillarRadius + HELIX_JUMP_CONFIG_upv_1.platformDepth / 2
local u3 = u1 * 0.5
local u4 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(198, 198, 206)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(205, 205, 212)
tbl_upv_1.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local u5 = Color3.fromRGB(235, 235, 235)
local u6 = Color3.fromRGB(28, 28, 33)
local u7 = Color3.fromRGB(224, 110, 104)
local u8 = Color3.fromRGB(240, 170, 40)
local u9 = Color3.fromRGB(255, 55, 45)
local u10 = Color3.fromRGB(90, 170, 255)
local u11 = Color3.fromRGB(205, 205, 215)
local u12 = Color3.fromRGB(132, 132, 138)
local u13 = Color3.fromRGB(205, 208, 218)
local u14 = Color3.fromRGB(255, 216, 102)
local u15 = Color3.fromRGB(245, 245, 255)
local tbl_2 = {}
tbl_2.color = Color3.fromRGB(70, 140, 255)
local tbl_3 = {}
tbl_3.color = Color3.fromRGB(160, 80, 255)
local tbl_4 = {}
tbl_4.color = Color3.fromRGB(255, 105, 200)
local tbl_upv_5 = {{color = Color3.fromRGB(255, 70, 50)}, tbl_2, tbl_3, tbl_4}
local u16 = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 70)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 200, 60)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(90, 230, 90)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(80, 200, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(160, 90, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 110, 210))})
local u17 = TweenInfo.new(0.09, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true)
local u18 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u19 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u20 = Color3.fromRGB(255, 128, 62)
local u21 = u1 * 0.5
local u22 = Color3.new(1, 1, 1)
local u23 = math.asin((HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2) / u2)
local tbl_upv_6 = {}
local tbl_upv_7 = {}
for n_1 = 0, HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - 1 do
    local v6 = CFrame.Angles(0, (n_1 + 0.5) * u1, 0)
    local u24 = v6 * CFrame.new(0, 0, u2)
    table.insert(tbl_upv_6, v6 * CFrame.new(0, ((n_1 % 2 ~= 0) and -0.008) or 0.008, u2))
    table.insert(tbl_upv_7, u24 * CFrame.new(0, (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) + 0.095, 0))
end
local u25 = CFrame.new(0, ((HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) + 0.095) + 0.04, u2)
local u26 = CFrame.new(0, 0, u2)
local function comboPopupColor_1(a1)
    --[[
      name: comboPopupColor
      line: 206
      upvalues:
        u14 (copy, index: 1)
        u15 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
    ]]
    if a1 < 12 then
        local color_1 = u15
        for _, value_1 in tbl_upv_5 do
            if value_1.from <= a1 then
                color_1 = value_1.color
            end
        end
        return color_1
    end
    return u14
end
local tbl_upv_8 = {}
local tbl_upv_9 = {}
local tbl_10 = {}
local tbl_11 = {}
tbl_11.__tostring = function()
    --[[
      name: __tostring
      line: 236
    ]]
    return "HelixJumpGame"
end
tbl_11.__index = BaseWorldGame_upv_1
local u24 = setmetatable(tbl_10, tbl_11)
u24.__index = u24
u24.new = function(...)
    --[[
      name: new
      line: 242
      upvalues:
        u24 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u24)
    return v7:constructor(...) or v7
end
u24.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 246
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        SpectateFollow_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.authoredSegments = false
    a1.platforms = {}
    a1.splats = {}
    a1.splatIndex = 0
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
    a1.walls = {}
    a1.effectClock = 0
    a1.appliedFieldOfView = 0
    a1.towerAngle = 0
    a1.ballY = 0
    a1.ballVelocityY = 0
    a1.renderPrevTowerAngle = 0
    a1.renderPrevBallY = 0
    a1.lowestY = 0
    a1.lowestPlatformY = 0
    a1.platformsPassed = 0
    a1.fallStreak = 0
    a1.fever = false
    a1.cameraY = 0
    a1.invulnRemaining = 0
    a1.pendingNudge = 0
    a1.keyAngularVelocity = 0
    a1.score = 0
    a1.dead = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.generationRandom = Random.new()
end
u24.buildScene = function(a1)
    --[[
      name: buildScene
      line: 277
      upvalues:
        HelixJumpAssets_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u12 (copy, index: 3)
        u5 (copy, index: 4)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        makeStagePart_upv_1 (copy, index: 7)
        u6 (copy, index: 8)
        u7 (copy, index: 9)
        u4 (copy, index: 10)
        u20 (copy, index: 11)
        SPLAT_DECAL_TEXTURE_upv_1 (copy, index: 12)
        u13 (copy, index: 13)
        u8 (copy, index: 14)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 15)
        u11 (copy, index: 16)
        PopupTextPool_upv_1 (copy, index: 17)
    ]]
    local container_1 = a1.stage.container
    a1:applyFieldOfView(a1.stage.camera.ViewportSize)
    a1.assets = HelixJumpAssets_upv_1.new()
    a1.authoredSegments = a1:kitOn() and a1.assets:has("Segment")
    local v9 = a1:kitPart("Backdrop", container_1)
    if v9 ~= nil then
        a1.backdrop = v9
    else
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Material = Enum.Material.Neon
        v10.Color = u12
        a1.backdrop = v10
    end
    a1.backdrop.Size = Vector3.new(3000, 2400, 1)
    local v11 = a1:kitPart("Pillar", container_1)
    if v11 ~= nil then
        a1.pillar = v11
    else
        local v12 = makeSmoothPart_upv_1(container_1)
        v12.Shape = Enum.PartType.Cylinder
        v12.Color = u5
        a1.pillar = v12
    end
    a1.pillar.Size = Vector3.new(160, HELIX_JUMP_CONFIG_upv_1.pillarRadius * 2, HELIX_JUMP_CONFIG_upv_1.pillarRadius * 2)
    local v13 = (2 * (HELIX_JUMP_CONFIG_upv_1.pillarRadius + HELIX_JUMP_CONFIG_upv_1.platformDepth)) * math.tan(u1 / 2) * 1.06
    local v14 = Vector3.new((v13 * 0.96) - 1, 0.19, HELIX_JUMP_CONFIG_upv_1.platformDepth * 0.94)
    local v15 = nil
    for _ = 0, HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1 do
        local tbl_12 = {}
        local v16 = nil
        local v21 = nil
        for v31 = 0, HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - 1 do
            v21 = a1:kitPart("Segment", container_1)
            if v21 ~= nil then
                v16 = v21
            else
                local v18 = makeStagePart_upv_1(container_1)
                v18.Color = u6
                v18.BackSurface = Enum.SurfaceType.Smooth
                v18.FrontSurface = Enum.SurfaceType.Smooth
                v16 = v18
            end
            v16.Size = Vector3.new(v13, HELIX_JUMP_CONFIG_upv_1.platformHeight, HELIX_JUMP_CONFIG_upv_1.platformDepth)
            table.insert(tbl_12, v16)
        end
        local tbl_13 = {}
        for v32 = 0, HELIX_JUMP_CONFIG_upv_1.hazardSegmentsMax - 1 do
            local v19
            v19 = a1:kitPart("KillPlate", container_1)
            local v18
            if v19 ~= nil then
                v18 = v19
            else
                local v20 = makeSmoothPart_upv_1(container_1)
                v20.Material = Enum.Material.Neon
                v20.Color = u7
                v18 = v20
            end
            v18.Size = v14
            v18.CFrame = u4
            table.insert(tbl_13, v18)
        end
        v21 = a1:kitPart("MovingPlate", container_1)
        if v21 ~= nil then
            v15 = v21
        else
            local v22 = makeSmoothPart_upv_1(container_1)
            v22.Material = Enum.Material.Neon
            v22.Color = u20
            v15 = v22
        end
        v15.Size = v14
        v15.CFrame = u4
        local tbl_14 = {}
        for v33 = 0, HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - 1 do
            table.insert(tbl_14, "safe")
        end
        table.insert(a1.platforms, {segments = tbl_12, killPlates = tbl_13, movingPlate = v15, moving = {}, pattern = tbl_14})
    end
    for _ = 0, HELIX_JUMP_CONFIG_upv_1.splatPoolSize - 1 do
        local v23 = makeSmoothPart_upv_1(container_1)
        v23.Transparency = 1
        v23.CFrame = u4
        local v24 = Instance.new("Decal")
        v24.Texture = SPLAT_DECAL_TEXTURE_upv_1
        v24.Face = Enum.NormalId.Top
        v24.Transparency = 1
        v24.Parent = v23
        table.insert(a1.splats, {part = v23, decal = v24})
    end
    for v25 = 0, HELIX_JUMP_CONFIG_upv_1.wallPoolSize - 1 do
        local tbl_15 = {}
        local v16 = nil
        for _ = 0, 1 do
            local v26
            v26 = a1:kitPart("WallSlab", container_1)
            if v26 ~= nil then
                v16 = v26
            else
                local v27 = makeSmoothPart_upv_1(container_1)
                v27.Color = u13
                v16 = v27
            end
            v16.Size = Vector3.new(v13, HELIX_JUMP_CONFIG_upv_1.platformSpacing - HELIX_JUMP_CONFIG_upv_1.platformHeight, 1.1)
            v16.CFrame = u4
            table.insert(tbl_15, v16)
        end
        table.insert(a1.walls, {parts = tbl_15})
        local v26
    end
    local v28 = a1:kitPart("Ball", container_1)
    if v28 ~= nil then
        a1.ball = v28
    else
        local v29 = makeSmoothPart_upv_1(container_1)
        v29.Shape = Enum.PartType.Ball
        v29.Material = Enum.Material.Neon
        v29.Color = u8
        a1.ball = v29
    end
    a1.ball.Size = Vector3.new(HELIX_JUMP_CONFIG_upv_1.ballDiameter, HELIX_JUMP_CONFIG_upv_1.ballDiameter, HELIX_JUMP_CONFIG_upv_1.ballDiameter)
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
    a1.passBurst = Instance.new("ParticleEmitter")
    a1.passBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.passBurst.Rate = 0
    a1.passBurst.Lifetime = NumberRange.new(0.35, 0.6)
    a1.passBurst.Speed = NumberRange.new(6, 12)
    a1.passBurst.SpreadAngle = Vector2.new(180, 180)
    a1.passBurst.Rotation = NumberRange.new(0, 90)
    a1.passBurst.RotSpeed = NumberRange.new(-180, 180)
    a1.passBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.1)})
    a1.passBurst.LightEmission = 0.9
    a1.passBurst.Color = ColorSequence.new(u8)
    a1.passBurst.Parent = a1.ball
    a1.meteor = Instance.new("ParticleEmitter")
    a1.meteor.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.meteor.Rate = 0
    a1.meteor.Lifetime = NumberRange.new(0.4, 0.7)
    a1.meteor.Speed = NumberRange.new(2, 5)
    a1.meteor.SpreadAngle = Vector2.new(180, 180)
    a1.meteor.Acceleration = Vector3.new(0, 22, 0)
    a1.meteor.Rotation = NumberRange.new(0, 90)
    a1.meteor.RotSpeed = NumberRange.new(-160, 160)
    a1.meteor.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.2), NumberSequenceKeypoint.new(1, 0.2)})
    a1.meteor.LightEmission = 0.85
    a1.meteor.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(1, 1)})
    a1.meteor.Parent = a1.ball
    local v30 = Instance.new("Attachment")
    v30.Position = Vector3.new(-HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2, 0, 0)
    v30.Parent = a1.ball
    local v25 = Instance.new("Attachment")
    v25.Position = Vector3.new(HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2, 0, 0)
    v25.Parent = a1.ball
    a1.trail = Instance.new("Trail")
    a1.trail.Attachment0 = v30
    a1.trail.Attachment1 = v25
    a1.trail.Lifetime = 0.3
    a1.trail.LightEmission = 1
    a1.trail.FaceCamera = true
    a1.trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.1)})
    a1.trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)})
    a1.trail.Color = ColorSequence.new(u8)
    a1.trail.Enabled = true
    a1.trail.Parent = a1.ball
    a1.shockwave = makeSmoothPart_upv_1(container_1)
    a1.shockwave.Material = Enum.Material.Neon
    a1.shockwave.Shape = Enum.PartType.Cylinder
    a1.shockwave.Transparency = 1
    a1.shockwave.CFrame = u4
    a1.splashRing = makeSmoothPart_upv_1(container_1)
    a1.splashRing.Material = Enum.Material.Neon
    a1.splashRing.Shape = Enum.PartType.Cylinder
    a1.splashRing.Color = u8
    a1.splashRing.Transparency = 1
    a1.splashRing.CFrame = u4
    a1.breakAnchor = makeSmoothPart_upv_1(container_1)
    a1.breakAnchor.Transparency = 1
    a1.breakAnchor.Size = Vector3.new(4, 1, 4)
    a1.breakAnchor.CFrame = u4
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
    a1.breakBurst.Color = ColorSequence.new(u11)
    a1.breakBurst.Parent = a1.breakAnchor
    a1.ballBaseSize = a1.ball.Size
    a1:applyAuthoredLighting()
    a1.popups = PopupTextPool_upv_1.new(container_1)
    a1.context.janitor:Add(
        a1.context.input.drag:Connect(
            function(a2)
                --[[
                  line: 538
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onDrag(a2)
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_16 = {}
        tbl_16.scoreToStuds = function(a3)
            --[[
              name: scoreToStuds
              line: 557
              upvalues:
                HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a3 * HELIX_JUMP_CONFIG_upv_1.platformSpacing
        end
        tbl_16.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 560
              upvalues:
                a1 (copy, index: 1)
                HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
            ]]
            return a1.score * HELIX_JUMP_CONFIG_upv_1.platformSpacing
        end
        tbl_16.poseMarker = function(a4)
            --[[
              name: poseMarker
              line: 563
              upvalues:
                a1 (copy, index: 1)
                HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
                origin_upv_1 (copy, index: 3)
            ]]
            return CFrame.new(origin_upv_1.X, ((origin_upv_1.Y + a1.ballY) - (a4 - (a1.score * HELIX_JUMP_CONFIG_upv_1.platformSpacing))) + 1, origin_upv_1.Z)
        end
        registerRivalMarkers_1(tbl_16)
    end
end
u24.resetRound = function(a1)
    --[[
      name: resetRound
      line: 577
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        u2 (copy, index: 4)
    ]]
    a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.towerAngle = 0
    a1.ballVelocityY = 0
    a1.platformsPassed = 0
    a1.fallStreak = 0
    a1.fever = false
    a1.lastGapStart = nil
    a1.invulnRemaining = 0
    a1.pendingNudge = 0
    a1.keyAngularVelocity = 0
    a1.score = 0
    a1.dead = false
    a1.spectating = false
    a1.roundToken = a1.roundToken + 1
    a1.effectClock = 0
    a1:applyMeteorLook()
    a1.lowestPlatformY = -(HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1) * HELIX_JUMP_CONFIG_upv_1.platformSpacing
    for n_2 = 0, HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1 do
        a1:layoutPlatform(a1.platforms[n_2 + 1], -n_2 * HELIX_JUMP_CONFIG_upv_1.platformSpacing, ((n_2 ~= 0) and "descent") or "starting")
    end
    a1.ballY = ((HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) + (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2)) + 2
    a1.renderPrevBallY = a1.ballY
    a1.renderPrevTowerAngle = a1.towerAngle
    a1.lowestY = a1.ballY
    a1.cameraY = a1.ballY
    a1.ball.Anchored = true
    a1.ball.Size = a1.ballBaseSize
    a1.ball.Color = u8
    a1.bounceBurst.Color = ColorSequence.new(u8)
    a1.ball.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a1.ballY, u2))
    a1.trail:Clear()
    a1.context.reportScore(0)
end
u24.captureRound = function(a1)
    --[[
      name: captureRound
      line: 616
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        tbl_upv_8 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 620
              upvalues:
                a1 (copy, index: 1)
                tbl_upv_8 (copy, index: 2)
            ]]
            a2:int(a1.score):num(a1.towerAngle):num(a1.ballY):num(a1.ballVelocityY)
            a2:num(a1.lowestY):num(a1.lowestPlatformY):num(a1.cameraY)
            a2:int(a1.platformsPassed):int(a1.fallStreak):bool(a1.fever)
            a2:num(a1.invulnRemaining):num(a1.effectClock)
            local v31 = a2:bool(a1.lastGapStart ~= nil)
            local v32 = a1.lastGapStart
            if v32 == nil then
                v32 = 0
            end
            v31:int(v32)
            a2:int(#a1.platforms)
            local pattern_1 = nil
            local v33 = nil
            local v34 = nil
            for key_1, value_2 in a1.platforms do
                pattern_1 = value_2.pattern
                v33 = table.create(#pattern_1)
                for key_2, value_3 in pattern_1 do
                    v33[key_2] = tbl_upv_8[value_3]
                end
                v34 = table.concat(v33, "")
                a2:num(value_2.y):bool(value_2.passed):bool(value_2.smashed):str(v34)
                a2:bool(value_2.moving.active)
                a2:num(value_2.moving.center):num(value_2.moving.amplitude):num(value_2.moving.phase)
            end
            local tbl_17 = {}
            local key_1 = 0
            for _, value_4 in a1.walls do
                if value_4.platform ~= nil == true then
                    key_1 = key_1 + 1
                    tbl_17[key_1] = value_4
                end
            end
            a2:int(#tbl_17)
            for _, value_5 in tbl_17 do
                a2:int((table.find(a1.platforms, value_5.platform) or 0) - 1):num(value_5.center):num(value_5.halfArc)
            end
        end
    )
end
u24.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 672
      upvalues:
        readResume_upv_1 (copy, index: 1)
        tbl_upv_9 (copy, index: 2)
        u4 (copy, index: 3)
        deriveRandom_upv_1 (copy, index: 4)
    ]]
    local v35 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 673
            ]]
            local tbl_18 = {}
            tbl_18.score = a3:int()
            tbl_18.towerAngle = a3:num()
            tbl_18.ballY = a3:num()
            tbl_18.ballVelocityY = a3:num()
            tbl_18.lowestY = a3:num()
            tbl_18.lowestPlatformY = a3:num()
            tbl_18.cameraY = a3:num()
            tbl_18.platformsPassed = a3:int()
            tbl_18.fallStreak = a3:int()
            tbl_18.fever = a3:bool()
            tbl_18.invulnRemaining = a3:num()
            tbl_18.effectClock = a3:num()
            tbl_18.hasLastGap = a3:bool()
            tbl_18.lastGapStart = a3:int()
            local v36 = a3:int()
            local tbl_19 = {}
            local v37 = 0
            local tbl_20 = false
            tbl_20, v37 = tbl_20, v37
            while true do
                if tbl_20 then
                    v37 = v37 + 1
                else
                    tbl_20 = true
                end
                if v37 >= v36 then
                    break
                end
                table.insert(tbl_19, {y = a3:num(), passed = a3:bool(), smashed = a3:bool(), pattern = a3:str(), movingActive = a3:bool(), movingCenter = a3:num(), movingAmplitude = a3:num(), movingPhase = a3:num()})
            end
            v37 = a3:int()
            tbl_20 = {}
            local v38 = 0
            local v39 = false
            v39, v38 = v39, v38
            while true do
                if v39 then
                    v38 = v38 + 1
                else
                    v39 = true
                end
                if v38 >= v37 then
                    break
                end
                table.insert(tbl_20, {ring = a3:int(), center = a3:num(), halfArc = a3:num()})
            end
            v38 = table.clone(tbl_18)
            setmetatable(v38, nil)
            v38.rings = tbl_19
            v38.walls = tbl_20
            return v38
        end
    )
    if v35 ~= nil and #v35.rings == #a1.platforms then
        a1.score = a2.score
        a1.towerAngle = v35.towerAngle
        a1.renderPrevTowerAngle = v35.towerAngle
        a1.ballY = v35.ballY
        a1.renderPrevBallY = v35.ballY
        a1.ballVelocityY = v35.ballVelocityY
        a1.lowestY = v35.lowestY
        a1.lowestPlatformY = v35.lowestPlatformY
        a1.cameraY = v35.cameraY
        a1.platformsPassed = v35.platformsPassed
        a1.fallStreak = v35.fallStreak
        a1.fever = v35.fever
        a1.invulnRemaining = v35.invulnRemaining
        a1.effectClock = v35.effectClock
        local v40
        if v35.hasLastGap then
            v40 = v35.lastGapStart
        else
            v40 = nil
        end
        a1.lastGapStart = v40
        a1.pendingNudge = 0
        a1.keyAngularVelocity = 0
        a1.dead = false
        a1.roundToken = a1.roundToken + 1
        for _, value_6 in a1.walls do
            a1:releaseWall(value_6)
        end
        for _, value_7 in a1.splats do
            a1:releaseSplat(value_7)
        end
        local rings_1 = v35.rings
        local function v41(a4, a5)
            --[[
              line: 778
              upvalues:
                a1 (copy, index: 1)
                tbl_upv_9 (copy, index: 2)
                u4 (copy, index: 3)
            ]]
            local v42 = a1.platforms[a5 + 1]
            if v42 ~= nil then
                v42.y = a4.y
                v42.passed = a4.passed
                v42.smashed = a4.smashed
                for n_3 = 0, #v42.pattern - 1 do
                    v42.pattern[n_3 + 1] = tbl_upv_9[string.sub(a4.pattern, n_3 + 1, n_3 + 1)] or "safe"
                end
                v42.moving.active = a4.movingActive
                v42.moving.center = a4.movingCenter
                v42.moving.amplitude = a4.movingAmplitude
                v42.moving.phase = a4.movingPhase
                a1:applySegmentLook(v42)
                if not (a4.movingActive) then
                    v42.movingPlate.Anchored = true
                    v42.movingPlate.CFrame = u4
                end
            else
                return nil
            end
        end
        for key_3, value_8 in rings_1 do
            v41(value_8, key_3 - 1, rings_1)
        end
        local v43 = nil
        local v44 = nil
        for _, value_9 in v35.walls do
            v43 = a1.platforms[value_9.ring + 1]
            v44 = nil
            for v45, value_10 in a1.walls do
                if value_10.platform == nil == true then
                    v44 = value_10
                    break
                end
            end
            if v43 == nil then
                continue
            end
            if v44 ~= nil then
                v44.platform = v43
                v44.center = value_9.center
                v44.halfArc = value_9.halfArc
            end
        end
        a1.ball.Anchored = true
        a1.ball.Size = a1.ballBaseSize
        a1:applyMeteorLook()
        a1.trail:Clear()
        a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), a1.platformsPassed + 1)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u24.snapshot = function(a1)
    --[[
      name: snapshot
      line: 841
    ]]
    local tbl_21 = {}
    tbl_21.score = a1.score
    tbl_21.values = {a1.platformsPassed, a1.fallStreak, ((a1.fever) and 1) or 0, a1.ballY}
    return tbl_21
end
u24.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 847
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local u27 = GhostPool_upv_1.new(a1.stage.container, {size = Vector3.new(HELIX_JUMP_CONFIG_upv_1.ballDiameter, HELIX_JUMP_CONFIG_upv_1.ballDiameter, HELIX_JUMP_CONFIG_upv_1.ballDiameter), shape = Enum.PartType.Ball})
        a1.ghostPool = u27
        a1.context.janitor:Add(
            function()
                --[[
                  line: 856
                  upvalues:
                    u27 (copy, index: 1)
                ]]
                return u27:destroy()
            end
        )
    end
end
u24.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 861
      upvalues:
        u2 (copy, index: 1)
    ]]
    local ghostPool_1 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_1 ~= nil and matchOpponents_1 ~= nil then
        local v45 = nil
        local v46 = nil
        for _, value_11 in matchOpponents_1 do
            v46 = value_11.snapshot
            if v46 == nil then
                continue
            end
            v45 = v46.values[4]
            if v45 == nil then
                continue
            end
            if math.abs(v45 - a1.ballY) <= 34 then
                ghostPool_1:show(value_11.userId, value_11.username, a1.stage.origin + Vector3.new(0.5646424733950354 * u2, v45, 0.8253356149096783 * u2), value_11.alive)
            end
        end
        ghostPool_1:step(a2)
    else
        return nil
    end
end
u24.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 891
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u24.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 897
      upvalues:
        approach_upv_1 (copy, index: 1)
    ]]
    local v47 = a1.spectate:value(3)
    if v47 ~= nil then
        a1.ballY = approach_upv_1(a1.ballY, v47, 6, a2)
        a1.lowestY = math.min(a1.lowestY, a1.ballY)
        a1:streamPlatforms()
    end
    a1.renderPrevBallY = a1.ballY
    a1.renderPrevTowerAngle = a1.towerAngle
    a1:render(a2)
end
u24.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 910
    ]]
    if a1.dead and a1.spectate:isActive() then
        a1.spectating = true
        a1:spectateStep(a2)
        return nil
    end
    a1:updateGhosts(a2)
end
u24.revive = function(a1)
    --[[
      name: revive
      line: 918
      upvalues:
        u8 (copy, index: 1)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        u2 (copy, index: 4)
    ]]
    a1.ball.Anchored = true
    a1.ball.Size = a1.ballBaseSize
    a1.ball.Color = u8
    a1.bounceBurst.Color = ColorSequence.new(u8)
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    a1.fever = false
    a1.fallStreak = 0
    a1:applyMeteorLook()
    a1.invulnRemaining = HELIX_JUMP_CONFIG_upv_1.reviveInvulnSeconds
    a1.pendingNudge = 0
    a1.keyAngularVelocity = 0
    local v48
    v48 = nil
    for _, value_12 in a1.platforms do
        if a1.ballY + 1 < value_12.y then
            continue
        end
        if v48 == nil or v48.y < value_12.y then
            v48 = value_12
        end
    end
    if v48 ~= nil then
        for n_4 = 0, #v48.pattern - 1 do
            if v48.pattern[n_4 + 1] == "hazard" then
                v48.pattern[n_4 + 1] = "safe"
                v48.segments[n_4 + 1].TopSurface = Enum.SurfaceType.Studs
            end
        end
        if v48.moving.active then
            v48.moving.active = false
            v48.movingPlate.CFrame = u4
        end
        a1:releaseWallOn(v48)
        a1.ballY = ((v48.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2)) + (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2)) + 2
    end
    a1.renderPrevBallY = a1.ballY
    a1.renderPrevTowerAngle = a1.towerAngle
    a1.ballVelocityY = 0
    a1.ball.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a1.ballY, u2))
    a1.trail:Clear()
    a1:setRunning(true)
end
u24.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 967
      upvalues:
        TAU_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        normalizeAngle_upv_1 (copy, index: 3)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevTowerAngle = a1.towerAngle
        a1.renderPrevBallY = a1.ballY
        a1.pendingNudge = a1.pendingNudge + a1:stepKeyboardSteer(a2)
        if a1.pendingNudge ~= 0 then
            local v49 = math.clamp(a1.pendingNudge, -TAU_upv_1, TAU_upv_1)
            a1.pendingNudge = 0
            while v49 ~= 0 do
                local v50 = math.clamp(v49, -u3, u3)
                a1.towerAngle = normalizeAngle_upv_1(a1.towerAngle + v50)
                a1:clampAgainstWalls()
                v49 = v49 - v50
            end
        end
        a1:advanceEffects(a2)
        a1.ballVelocityY = math.max(a1.ballVelocityY + (HELIX_JUMP_CONFIG_upv_1.gravity * a2), HELIX_JUMP_CONFIG_upv_1.terminalVelocity)
        local ballY_1 = a1.ballY
        a1.ballY = a1.ballY + (a1.ballVelocityY * a2)
        if a1.ballY < a1.lowestY then
            a1.lowestY = a1.ballY
        end
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        a1:clampAgainstWalls()
        if a1.ballVelocityY < 0 then
            a1:handleLandings(ballY_1)
        end
        if a1.dead then
            return nil
        end
        a1:streamPlatforms()
    end
end
u24.streamPlatforms = function(a1)
    --[[
      name: streamPlatforms
      line: 1007
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _, value_13 in a1.platforms do
        if a1.lowestY + 32 < value_13.y then
            a1.lowestPlatformY = a1.lowestPlatformY - HELIX_JUMP_CONFIG_upv_1.platformSpacing
            a1:layoutPlatform(value_13, a1.lowestPlatformY, "descent")
        end
    end
end
u24.advanceEffects = function(a1, a2)
    --[[
      name: advanceEffects
      line: 1015
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.effectClock = a1.effectClock + a2
    local v51 = nil
    for _, value_14 in a1.platforms do
        v51 = value_14.moving
        if not (v51.active) then
            continue
        end
        if not (value_14.smashed) then
            v51.phase = v51.phase + ((HELIX_JUMP_CONFIG_upv_1.movingHazardSweepSpeed / v51.amplitude) * a2)
        end
    end
    for _, value_15 in a1.splats do
        if value_15.platform == nil then
            continue
        end
        value_15.age = value_15.age + a2
        if HELIX_JUMP_CONFIG_upv_1.splatLifetimeSeconds <= value_15.age then
            a1:releaseSplat(value_15)
        end
    end
end
u24.clampAgainstWalls = function(a1)
    --[[
      name: clampAgainstWalls
      line: 1034
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        normalizeAngle_upv_1 (copy, index: 2)
        u23 (copy, index: 3)
        signedAngleDiff_upv_1 (copy, index: 4)
    ]]
    local v52 = nil
    local v53 = nil
    local v54 = nil
    local v55 = nil
    local v56 = nil
    for _, value_16 in a1.walls do
        v56 = value_16.platform
        if v56 == nil or v56.smashed or a1.ballY + (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2) < v56.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) or (v56.y + HELIX_JUMP_CONFIG_upv_1.platformSpacing) - (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) < a1.ballY - (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2) then
            continue
        end
        v55 = normalizeAngle_upv_1(0 - a1.towerAngle)
        v53 = value_16.halfArc + u23
        v54 = signedAngleDiff_upv_1(value_16.center, v55)
        if v53 <= math.abs(v54) then
            continue
        end
        if v54 < 0 then
            v52 = -v53
        else
            v52 = v53
        end
        a1.towerAngle = normalizeAngle_upv_1(-(value_16.center + v52))
    end
end
u24.render = function(a1, a2)
    --[[
      name: render
      line: 1058
      upvalues:
        lerp_upv_1 (copy, index: 1)
        signedAngleDiff_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        tbl_upv_6 (copy, index: 4)
        tbl_upv_7 (copy, index: 5)
        u4 (copy, index: 6)
        u25 (copy, index: 7)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 8)
        u1 (copy, index: 9)
        u26 (copy, index: 10)
        portraitCameraDistance_upv_1 (copy, index: 11)
    ]]
    a1:updateGhosts(a2)
    local origin_2 = a1.stage.origin
    local renderAlpha_1 = a1.renderAlpha
    local v57 = lerp_upv_1(a1.renderPrevBallY, a1.ballY, renderAlpha_1)
    local v58 = a1.renderPrevTowerAngle + signedAngleDiff_upv_1(a1.renderPrevTowerAngle, a1.towerAngle) * renderAlpha_1
    local v59 = ((a1.spectating) and (origin_2 + Vector3.new(0, -4000, 0))) or (origin_2 + Vector3.new(0, v57, u2))
    a1.ball.CFrame = CFrame.new(v59)
    local v60 = ((math.sin(a1.effectClock * 7) * 0.5) + 0.5) * 0.3 + 0.06
    local v61 = nil
    local n_5 = nil
    local v62 = nil
    local v63 = nil
    local v64 = nil
    for _, value_17 in a1.platforms do
        if value_17.smashed then
            continue
        end
        v61 = CFrame.new(origin_2.X, origin_2.Y + value_17.y, origin_2.Z) * CFrame.Angles(0, v58, 0)
        v62 = 0
        for n_5 = 0, #value_17.segments - 1 do
            if value_17.pattern[n_5 + 1] == "gap" then
                continue
            end
            value_17.segments[n_5 + 1].CFrame = v61 * tbl_upv_6[n_5 + 1]
            if value_17.pattern[n_5 + 1] == "hazard" and v62 < #value_17.killPlates then
                value_17.killPlates[v62 + 1].CFrame = v61 * tbl_upv_7[n_5 + 1]
                v62 = v62 + 1
            end
        end
        v63, v64 = false, v62
        while true do
            if v63 then
                v64 = v64 + 1
            else
                v63 = true
            end
            if v64 >= #value_17.killPlates then
                break
            end
            value_17.killPlates[v64 + 1].CFrame = u4
        end
        if value_17.moving.active then
            value_17.movingPlate.CFrame = (v61 * CFrame.Angles(0, value_17.moving.center + (value_17.moving.amplitude * math.sin(value_17.moving.phase)), 0)) * u25
            value_17.movingPlate.Transparency = v60
        end
    end
    local v65 = nil
    for _, value_18 in a1.splats do
        v65 = value_18.platform
        if v65 ~= nil then
            local v66 = v58 + value_18.localAngle
            value_18.part.CFrame = CFrame.new(origin_2 + Vector3.new(math.sin(v66) * u2, (v65.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2)) + 0.06, math.cos(v66) * u2)) * CFrame.Angles(0, v66 + value_18.spin, 0)
            value_18.decal.Transparency = 0.12 + (0.85 * (value_18.age / HELIX_JUMP_CONFIG_upv_1.splatLifetimeSeconds))
        end
    end
    local v67 = nil
    local v68 = nil
    for _, value_19 in a1.walls do
        v68 = value_19.platform
        if v68 == nil then
            continue
        end
        v67 = CFrame.new(origin_2.X, (origin_2.Y + v68.y) + (HELIX_JUMP_CONFIG_upv_1.platformSpacing / 2), origin_2.Z) * CFrame.Angles(0, v58, 0)
        for n_6 = 0, #value_19.parts - 1 do
            value_19.parts[n_6 + 1].CFrame = (v67 * CFrame.Angles(0, value_19.center + ((n_6 - ((#value_19.parts - 1) / 2)) * u1), 0)) * u26
        end
    end
    a1.cameraY = a1.cameraY + (((a1.lowestY + HELIX_JUMP_CONFIG_upv_1.cameraFocusAbove) - a1.cameraY) * math.min(a2 * HELIX_JUMP_CONFIG_upv_1.cameraFollowRate, 1))
    local v69 = origin_2 + Vector3.new(0, a1.cameraY, 0)
    local ViewportSize_1 = a1.stage.camera.ViewportSize
    local value_19 = a1.stage.getOrientation() == "portrait"
    if value_19 then
        v65 = portraitCameraDistance_upv_1(1, HELIX_JUMP_CONFIG_upv_1.portraitZoomOut, ViewportSize_1, HELIX_JUMP_CONFIG_upv_1.portraitMaxZoomOut)
    else
        v65 = 1
    end
    if value_19 then
        v62 = HELIX_JUMP_CONFIG_upv_1.cameraLookDownPortrait
    else
        v62 = HELIX_JUMP_CONFIG_upv_1.cameraLookDown
    end
    local v70 = v69 + Vector3.new(0, HELIX_JUMP_CONFIG_upv_1.cameraUp * v65, HELIX_JUMP_CONFIG_upv_1.cameraBack * v65)
    a1:applyFieldOfView(ViewportSize_1)
    a1.stage.setCameraCFrame(CFrame.lookAt(v70, v69 + Vector3.new(0, -v62, 0)))
    a1.pillar.CFrame = CFrame.new(origin_2 + Vector3.new(0, a1.cameraY, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
    a1.backdrop.CFrame = CFrame.new(origin_2 + Vector3.new(0, a1.cameraY - 150, -60))
end
u24.kitOn = function(a1)
    --[[
      name: kitOn
      line: 1180
    ]]
    return a1.assets.available
end
u24.kitPart = function(a1, a2, a3)
    --[[
      name: kitPart
      line: 1183
    ]]
    if a1:kitOn() then
        return a1.assets:part(a2, a3)
    end
    return nil
end
u24.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 1189
      upvalues:
        readLightingFolderProfile_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        HELIX_JUMP_STAGE_LIGHTING_upv_1 (copy, index: 3)
    ]]
    local lighting_1 = a1.assets.lighting
    if a1:kitOn() and lighting_1 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(lighting_1, tbl_upv_1, HELIX_JUMP_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u24.applyFieldOfView = function(a1, a2)
    --[[
      name: applyFieldOfView
      line: 1196
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v71
    if a2.X / a2.Y <= 1.4 then
        v71 = HELIX_JUMP_CONFIG_upv_1.fieldOfView
    else
        v71 = HELIX_JUMP_CONFIG_upv_1.fieldOfViewWide
    end
    if v71 ~= a1.appliedFieldOfView then
        a1.appliedFieldOfView = v71
        a1.stage.camera.FieldOfView = v71
    else
        return nil
    end
end
u24.onDrag = function(a1, a2)
    --[[
      name: onDrag
      line: 1204
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    a1.pendingNudge = a1.pendingNudge + (a2.X * HELIX_JUMP_CONFIG_upv_1.dragSensitivityRadians)
end
u24.stepKeyboardSteer = function(a1, a2)
    --[[
      name: stepKeyboardSteer
      line: 1210
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v72 = UserInputService_upv_1:GetFocusedTextBox() ~= nil
    local v73 = not v72 and (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Left) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.A)))
    local v74 = not v72 and (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Right) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.D)))
    local v75 = (v72 and 0) or (-gamepadInput_upv_1:moveX())
    local v76 = (v73 and 1) or 0
    local v77 = math.clamp((v76 - ((v74 and 1) or 0)) + v75, -1, 1) * HELIX_JUMP_CONFIG_upv_1.keyRotateSpeedRadians
    local v78 = false
    if v77 ~= 0 then
        local v79 = false
        if a1.keyAngularVelocity * v77 < 0 then
            v78 = v79
        else
            local v80 = math.abs(v77)
            v78 = math.abs(a1.keyAngularVelocity) < v80
        end
    end
    local v81
    if v78 then
        v81 = HELIX_JUMP_CONFIG_upv_1.keyAccelRadians
    else
        v81 = HELIX_JUMP_CONFIG_upv_1.keyBrakeRadians
    end
    local v82 = v81 * a2
    a1.keyAngularVelocity = a1.keyAngularVelocity + math.clamp(v77 - a1.keyAngularVelocity, -v82, v82)
    return a1.keyAngularVelocity * a2
end
u24.handleLandings = function(a1, a2)
    --[[
      name: handleLandings
      line: 1229
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _, value_20 in a1.platforms do
        local v83, v84 = nil, nil
        if not value_20.smashed then
            v83 = value_20.y + HELIX_JUMP_CONFIG_upv_1.platformHeight / 2
            if v83 <= a2 - (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2) and a1.ballY - (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2) < v83 then
                v84 = a1:segmentUnderBall(value_20)
                if v84 == "gap" then
                    a1:passPlatform(value_20)
                elseif a1.fever then
                    a1:smashPlatform(value_20)
                else
                    if v84 ~= "hazard" and not (a1:movingHazardUnderBall(value_20)) or a1.invulnRemaining > 0 then
                        a1:bounce(v83, value_20)
                        return nil
                    end
                    a1:die()
                    return nil
                end
            end
        end
    end
end
u24.movingHazardUnderBall = function(a1, a2)
    --[[
      name: movingHazardUnderBall
      line: 1259
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        minAngleDiff_upv_1 (copy, index: 2)
        u21 (copy, index: 3)
    ]]
    local moving_1 = a2.moving
    if moving_1.active then
        local v85 = minAngleDiff_upv_1(normalizeAngle_upv_1(0 - a1.towerAngle), moving_1.center + (moving_1.amplitude * math.sin(moving_1.phase))) < u21
        return v85
    end
    return false
end
u24.segmentUnderBall = function(a1, a2)
    --[[
      name: segmentUnderBall
      line: 1268
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v86 = normalizeAngle_upv_1(0 - a1.towerAngle) / u1
    local segmentsPerPlatform_1 = HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform
    local v87 = math.clamp(math.floor(v86), 0, segmentsPerPlatform_1 - 1)
    local v88 = a2.pattern[v87 + 1]
    local v89 = nil
    if v88 == "gap" then
        v89 = v86 - math.floor(v86)
        if v89 < 0.32 and a2.pattern[(((v87 - 1) + segmentsPerPlatform_1) % segmentsPerPlatform_1) + 1] ~= "gap" or v89 > 0.6799999999999999 and a2.pattern[((v87 + 1) % segmentsPerPlatform_1) + 1] ~= "gap" then
            return "safe"
        end
        return "gap"
    end
    return v88
end
u24.bounce = function(a1, a2, a3)
    --[[
      name: bounce
      line: 1287
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u17 (copy, index: 3)
    ]]
    a1:stampSplat(a3)
    a1.ballY = a2 + (HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2)
    a1.ballVelocityY = HELIX_JUMP_CONFIG_upv_1.bounceVelocity
    a1.fallStreak = 0
    a1.fever = false
    a1:applyMeteorLook()
    a1.bounceBurst:Emit(7)
    a1:pulseSplash(a2)
    a1.ball.Size = a1.ballBaseSize
    local tbl_22 = {}
    tbl_22.Size = a1.ballBaseSize * 0.8
    TweenService_upv_1:Create(a1.ball, u17, tbl_22):Play()
    a1.context.audio.play("pop", {})
    a1.context.audio.play("thud", {})
end
u24.pulseSplash = function(a1, a2)
    --[[
      name: pulseSplash
      line: 1313
      upvalues:
        u2 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u19 (copy, index: 3)
    ]]
    a1.splashRing.Size = Vector3.new(0.30000001192092896, 1.2000000476837158, 1.2000000476837158)
    a1.splashRing.Transparency = 0.2
    a1.splashRing.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a2 + 0.1, u2)) * CFrame.Angles(0, 0, 1.5707963267948966)
    TweenService_upv_1:Create(a1.splashRing, u19, {}):Play()
end
u24.stampSplat = function(a1, a2)
    --[[
      name: stampSplat
      line: 1326
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        TAU_upv_1 (copy, index: 2)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 3)
        u22 (copy, index: 4)
    ]]
    local v90 = a1.splats[a1.splatIndex + 1]
    a1.splatIndex = (a1.splatIndex + 1) % #a1.splats
    if v90 ~= nil then
        v90.platform = a2
        v90.localAngle = normalizeAngle_upv_1(0 - a1.towerAngle)
        v90.spin = a1.random:NextNumber(0, TAU_upv_1)
        v90.age = 0
        local v91 = a1.random:NextNumber(HELIX_JUMP_CONFIG_upv_1.splatDiameterMin, HELIX_JUMP_CONFIG_upv_1.splatDiameterMax)
        v90.part.Size = Vector3.new(v91, 0.12, v91)
        v90.decal.Color3 = a1.ball.Color:Lerp(u22, 0.55)
        v90.decal.Transparency = 0.12
    else
        return nil
    end
end
u24.releaseSplat = function(a1, a2)
    --[[
      name: releaseSplat
      line: 1342
      upvalues:
        u4 (copy, index: 1)
    ]]
    a2.platform = nil
    a2.part.CFrame = u4
    a2.decal.Transparency = 1
end
u24.passPlatform = function(a1, a2)
    --[[
      name: passPlatform
      line: 1347
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u14 (copy, index: 3)
        publishCombo_upv_1 (copy, index: 4)
        u15 (copy, index: 5)
        tbl_upv_5 (copy, index: 6)
    ]]
    if a2.passed then
        return nil
    else
        a2.passed = true
        a1.platformsPassed = a1.platformsPassed + 1
        a1.fallStreak = a1.fallStreak + 1
        a1.score = a1.score + 1
        if a1.fallStreak == HELIX_JUMP_CONFIG_upv_1.feverThreshold then
            a1.fever = true
            a1.score = a1.score + HELIX_JUMP_CONFIG_upv_1.multiFallBonus
            a1.context.audio.play("perfect", {})
            a1.popups:show(a1.stage.origin + Vector3.new(0, a1.ballY, u2), ("FEVER +%*!"):format(HELIX_JUMP_CONFIG_upv_1.multiFallBonus), u14, 1)
        end
        a1:applyMeteorLook()
        a1.context.audio.play("whoosh", {pitch = (math.min(a1.fallStreak, 6) * 0.08) + 1.2})
        a1.passBurst:Emit((math.min(8 + (a1.fallStreak * 2), 24)))
        a1:pulseShockwave(a2.y)
        a1:breakPlatform(a2, nil)
        a1.context.audio.play("woodBreak", {})
        local v92 = nil
        if a1.fallStreak >= 2 then
            a1.context.audio.play("scorePing", {pitch = math.min(0.9 + (a1.fallStreak * 0.08), 1.8)})
            local tbl_23 = {}
            tbl_23.count = a1.fallStreak
            v92 = a1.fallStreak
            local v93
            if v92 < 12 then
                local color_2 = u15
                for _, value_21 in tbl_upv_5 do
                    if value_21.from <= v92 then
                        color_2 = value_21.color
                    end
                end
                v93 = color_2
            else
                v93 = u14
            end
            tbl_23.color = v93
            tbl_23.holdSeconds = HELIX_JUMP_CONFIG_upv_1.comboHoldSeconds
            publishCombo_upv_1(tbl_23)
        end
        a1.context.reportScore(a1.score)
    end
end
u24.applyMeteorLook = function(a1)
    --[[
      name: applyMeteorLook
      line: 1399
      upvalues:
        u8 (copy, index: 1)
        u16 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
    ]]
    if a1.fever then
        local v94 = u16.Keypoints[1].Value
        local v95
        if a1.fallStreak >= 12 then
            v95 = u16
        else
            local color_3 = tbl_upv_5[1].color
            for _, value_22 in tbl_upv_5 do
                if value_22.from <= a1.fallStreak then
                    color_3 = value_22.color
                end
            end
            v95 = ColorSequence.new(color_3)
            v94 = color_3
        end
        a1.meteor.Color = v95
        a1.meteor.Rate = math.min(24 + (a1.fallStreak * 3), 70)
        a1.trail.Color = v95
        a1.passBurst.Color = v95
        a1.ball.Color = v94
    else
        a1.meteor.Rate = 0
        a1.trail.Color = ColorSequence.new(u8)
        a1.passBurst.Color = ColorSequence.new(u8)
        if not (a1.dead) then
            a1.ball.Color = u8
        end
        return nil
    end
end
u24.pulseShockwave = function(a1, a2)
    --[[
      name: pulseShockwave
      line: 1429
      upvalues:
        u8 (copy, index: 1)
        u2 (copy, index: 2)
        TweenService_upv_1 (copy, index: 3)
        u18 (copy, index: 4)
    ]]
    local shockwave_1 = a1.shockwave
    local v96
    if a1.fever then
        v96 = a1.meteor.Color.Keypoints[1].Value
    else
        v96 = u8
    end
    shockwave_1.Color = v96
    a1.shockwave.Size = Vector3.new(0.4000000059604645, 2, 2)
    a1.shockwave.Transparency = 0.15
    a1.shockwave.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a2, u2)) * CFrame.Angles(0, 0, 1.5707963267948966)
    TweenService_upv_1:Create(a1.shockwave, u18, {}):Play()
end
u24.smashPlatform = function(a1, a2)
    --[[
      name: smashPlatform
      line: 1443
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        u10 (copy, index: 2)
    ]]
    a1.context.audio.play("thud", {})
    a1.context.audio.play("perfect", {})
    if not (a2.passed) then
        a2.passed = true
        a1.platformsPassed = a1.platformsPassed + 1
        a1.score = a1.score + 1
        a1.context.reportScore(a1.score)
    end
    local v97 = nil
    for _, value_23 in a1.walls do
        v97 = value_23.platform
        if v97 == nil then
            continue
        end
        if math.abs(v97.y - (a2.y - HELIX_JUMP_CONFIG_upv_1.platformSpacing)) < 1 then
            a1:blastWall(value_23)
        end
    end
    a1:breakPlatform(a2, u10)
    a1.fever = false
    a1.fallStreak = 0
    a1:applyMeteorLook()
    a1.stage.shake(0.7)
end
u24.breakPlatform = function(a1, a2, a3)
    --[[
      name: breakPlatform
      line: 1476
      upvalues:
        u1 (copy, index: 1)
        u4 (copy, index: 2)
        u2 (copy, index: 3)
        u11 (copy, index: 4)
    ]]
    a2.smashed = true
    a2.smashCount = a2.smashCount + 1
    for n_7 = 0, #a2.segments - 1 do
        local v98
        if a2.pattern[n_7 + 1] == "gap" then
            continue
        end
        v98 = a2.segments[n_7 + 1]
        if a3 ~= nil and not a1.authoredSegments then
            v98.Color = a3
        end
        local v99 = (n_7 + 0.5) * u1 + a1.towerAngle
        local v100 = Vector3.new(math.sin(v99), 0, math.cos(v99))
        v98.Anchored = false
        v98.AssemblyLinearVelocity = (v100 * 22) + Vector3.new(0, -4, 0)
        v98.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-8, 8), 0, a1.random:NextNumber(-8, 8))
    end
    for _, value_24 in a2.killPlates do
        if value_24.CFrame ~= u4 then
            value_24.Anchored = false
            value_24.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-16, 16), 4, a1.random:NextNumber(8, 20))
            value_24.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-10, 10), 0, a1.random:NextNumber(-10, 10))
        end
    end
    if a2.moving.active then
        a2.moving.active = false
        a2.movingPlate.Anchored = false
        a2.movingPlate.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-16, 16), 4, a1.random:NextNumber(8, 20))
        a2.movingPlate.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-10, 10), 0, a1.random:NextNumber(-10, 10))
    end
    for v101, value_25 in a1.splats do
        if value_25.platform == a2 then
            a1:releaseSplat(value_25)
        end
    end
    a1:releaseWallOn(a2)
    a1.breakAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a2.y, u2))
    local u28 = a1.breakBurst
    local v101 = ColorSequence.new
    local v102
    if a3 == nil then
        v102 = u11
    else
        v102 = a3
    end
    u28.Color = v101(v102)
    a1.breakBurst:Emit(14)
    u28 = a2.smashCount
    task.delay(
        2.5,
        function()
            --[[
              line: 1526
              upvalues:
                a2 (copy, index: 1)
                u28 (copy, index: 2)
                u4 (copy, index: 3)
            ]]
            if a2.smashed and a2.smashCount == u28 then
                for _, value_26 in a2.segments do
                    value_26.Anchored = true
                    value_26.CFrame = u4
                end
                for _, value_27 in a2.killPlates do
                    value_27.Anchored = true
                    value_27.CFrame = u4
                end
                a2.movingPlate.Anchored = true
                a2.movingPlate.CFrame = u4
            else
                return nil
            end
        end
    )
end
u24.layoutPlatform = function(a1, a2, a3, a4)
    --[[
      name: layoutPlatform
      line: 1542
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    a1:releaseWallOn(a2)
    for key_4, value_28 in a1.splats do
        if value_28.platform == a2 then
            a1:releaseSplat(value_28)
        end
    end
    a2.y = a3
    a2.passed = false
    a2.smashed = false
    local v103 = math.max(0, math.round(-a3 / HELIX_JUMP_CONFIG_upv_1.platformSpacing) - (HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1))
    local v104 = math.min(v103 / HELIX_JUMP_CONFIG_upv_1.depthForMaxDifficulty, 1)
    local v105 = math.max(HELIX_JUMP_CONFIG_upv_1.gapSegmentsMin, math.round(HELIX_JUMP_CONFIG_upv_1.gapSegmentsStart - (v104 * (HELIX_JUMP_CONFIG_upv_1.gapSegmentsStart - HELIX_JUMP_CONFIG_upv_1.gapSegmentsMin))))
    local key_4 = ((a4 == "starting") and 0) or (math.round(HELIX_JUMP_CONFIG_upv_1.hazardSegmentsStart + v104 * (HELIX_JUMP_CONFIG_upv_1.hazardSegmentsMax - HELIX_JUMP_CONFIG_upv_1.hazardSegmentsStart)))
    for v106 = 0, HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - 1 do
        a2.pattern[v106 + 1] = "safe"
    end
    local v107
    v107 = a1.generationRandom:NextInteger(0, HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - 1)
    if a4 == "starting" then
        v107 = a1.generationRandom:NextInteger(1, HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - v105)
    elseif a1.lastGapStart ~= nil and a1.generationRandom:NextNumber() < 0.4 then
        v107 = (a1.lastGapStart + a1.generationRandom:NextInteger(-1, 1) + HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform) % HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform
    end
    a1.lastGapStart = v107
    local v106, v108
    v106, v108 = false, 0
    while true do
        if v106 then
            v108 = v108 + 1
        else
            v106 = true
        end
        if v108 >= v105 then
            break
        end
        a2.pattern[((v107 + v108) % HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform) + 1] = "gap"
    end
    local v109 = HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - v105 - 2
    local v110 = math.min(key_4, math.floor((v109 + 1) / 2))
    if v110 > 0 then
        local tbl_24 = {}
        local tbl_25 = 0
        local v111 = false
        while true do
            if v111 then
                tbl_25 = tbl_25 + 1
            else
                v111 = true
            end
            if tbl_25 >= v109 - v110 + 1 then
                break
            end
            table.insert(tbl_24, tbl_25)
        end
        v111, tbl_25 = false, 0
        while true do
            if v111 then
                tbl_25 = tbl_25 + 1
            else
                v111 = true
            end
            if tbl_25 >= v110 then
                break
            end
            local v112 = a1.generationRandom:NextInteger(tbl_25, #tbl_24 - 1)
            local v113 = tbl_24[tbl_25 + 1]
            tbl_24[tbl_25 + 1] = tbl_24[v112 + 1]
            tbl_24[v112 + 1] = v113
        end
        tbl_25 = {}
        local v112
        v112, v111 = false, 0
        while true do
            if v112 then
                v111 = v111 + 1
            else
                v112 = true
            end
            if v111 >= v110 then
                break
            end
            table.insert(tbl_25, tbl_24[v111 + 1])
        end
        table.sort(
            tbl_25,
            function(a5, a6)
                --[[
                  line: 1674
                ]]
                return a5 < a6
            end
        )
        for n_8 = 0, #tbl_25 - 1 do
            a2.pattern[((((v107 + v105) + 1 + tbl_25[n_8 + 1]) + n_8) % HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform) + 1] = "hazard"
        end
    end
    a1:applySegmentLook(a2)
    a2.moving.active = false
    a2.movingPlate.Anchored = true
    a2.movingPlate.CFrame = u4
    if a4 == "descent" and HELIX_JUMP_CONFIG_upv_1.movingHazardFromDepth <= v103 and a1.generationRandom:NextNumber() < HELIX_JUMP_CONFIG_upv_1.movingHazardChanceStart + (v104 * (HELIX_JUMP_CONFIG_upv_1.movingHazardChanceMax - HELIX_JUMP_CONFIG_upv_1.movingHazardChanceStart)) then
        a1:seedMovingHazard(a2, v107, v105)
    end
    if a4 ~= "descent" or HELIX_JUMP_CONFIG_upv_1.wallFromDepth > v103 or a1.generationRandom:NextNumber() >= HELIX_JUMP_CONFIG_upv_1.wallChance then
        return
    end
    a1:trySpawnWall(a2, v107, v105)
end
u24.applySegmentLook = function(a1, a2)
    --[[
      name: applySegmentLook
      line: 1697
      upvalues:
        u6 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    for n_9 = 0, #a2.segments - 1 do
        local v114 = a2.segments[n_9 + 1]
        v114.Anchored = true
        if not (a1.authoredSegments) then
            v114.Color = u6
        end
        local v115
        if a2.pattern[n_9 + 1] ~= "safe" then
            v115 = Enum.SurfaceType.Smooth
        else
            v115 = Enum.SurfaceType.Studs
        end
        v114.TopSurface = v115
        if a2.pattern[n_9 + 1] == "gap" then
            v114.CFrame = u4
        end
    end
    for _, value_29 in a2.killPlates do
        value_29.Anchored = true
        value_29.CFrame = u4
    end
end
u24.seedMovingHazard = function(a1, a2, a3, a4)
    --[[
      name: seedMovingHazard
      line: 1718
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u21 (copy, index: 3)
        normalizeAngle_upv_1 (copy, index: 4)
        TAU_upv_1 (copy, index: 5)
    ]]
    local v116 = ((HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - a4) - 2) * u1
    local v117 = v116 / 2 - u21
    if v117 >= 0.5 then
        local moving_2 = a2.moving
        moving_2.active = true
        moving_2.center = normalizeAngle_upv_1((((a3 + a4) + 1) * u1) + (v116 / 2))
        moving_2.amplitude = a1.generationRandom:NextNumber(math.max(0.5, v117 * 0.55), v117)
        moving_2.phase = a1.generationRandom:NextNumber(0, TAU_upv_1)
        a2.movingPlate.Anchored = true
    else
        return nil
    end
end
u24.trySpawnWall = function(a1, a2, a3, a4)
    --[[
      name: trySpawnWall
      line: 1733
      upvalues:
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        normalizeAngle_upv_1 (copy, index: 3)
    ]]
    if a2.moving.active then
        return nil
    else
        local v118 = nil
        for _, value_30 in a1.walls do
            v118 = value_30.platform
            if v118 == nil or math.abs(v118.y - a2.y) >= HELIX_JUMP_CONFIG_upv_1.platformSpacing * 2.5 then
                continue
            end
            return nil
        end
        local _ = nil
        local v120 = nil
        for v124, value_31 in a1.walls do
            if value_31.platform == nil then
                v120 = value_31
            end
        end
        if v120 ~= nil then
            local v121 = HELIX_JUMP_CONFIG_upv_1.wallHalfArcSegments * u1
            v120 = ((HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform - a4) - 2) * u1 - v121 * 2
            if v120 > 0 then
                local value_31 = a1:platformAt(a2.y + HELIX_JUMP_CONFIG_upv_1.platformSpacing)
                for v125 = 0, 7 do
                    local v122
                    v122 = normalizeAngle_upv_1((((a3 + a4) + 1) * u1) + v121 + a1.generationRandom:NextNumber(0, v120))
                    local v123 = nil
                    if value_31 ~= nil then
                        v123 = a1:wallBlocksGap(value_31, v122, v121)
                        if v123 then
                            continue
                        end
                    end
                    v120.platform = a2
                    v120.center = v122
                    v120.halfArc = v121
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    end
end
u24.wallBlocksGap = function(a1, a2, a3, a4)
    --[[
      name: wallBlocksGap
      line: 1774
      upvalues:
        u1 (copy, index: 1)
        minAngleDiff_upv_1 (copy, index: 2)
    ]]
    for n_10 = 0, #a2.pattern - 1 do
        if a2.pattern[n_10 + 1] ~= "gap" or minAngleDiff_upv_1(a3, (n_10 + 0.5) * u1) >= a4 + u1 then
            continue
        end
        return true
    end
    return false
end
u24.platformAt = function(a1, a2)
    --[[
      name: platformAt
      line: 1786
    ]]
    for _, value_32 in a1.platforms do
        if math.abs(value_32.y - a2) >= 1 then
            continue
        end
        return value_32
    end
    return nil
end
u24.releaseWall = function(a1, a2)
    --[[
      name: releaseWall
      line: 1794
      upvalues:
        u4 (copy, index: 1)
    ]]
    a2.platform = nil
    for _, value_33 in a2.parts do
        value_33.CFrame = u4
    end
end
u24.releaseWallOn = function(a1, a2)
    --[[
      name: releaseWallOn
      line: 1800
    ]]
    for _, value_34 in a1.walls do
        if value_34.platform == a2 then
            a1:releaseWall(value_34)
        end
    end
end
u24.blastWall = function(a1, a2)
    --[[
      name: blastWall
      line: 1807
      upvalues:
        u2 (copy, index: 1)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
        u13 (copy, index: 3)
    ]]
    local platform_1 = a2.platform
    if platform_1 ~= nil then
        local v124 = a1.towerAngle + a2.center
        a1.breakAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(math.sin(v124) * u2, platform_1.y + (HELIX_JUMP_CONFIG_upv_1.platformSpacing / 2), math.cos(v124) * u2))
        a1.breakBurst.Color = ColorSequence.new(u13)
        a1.breakBurst:Emit(10)
    end
    a1:releaseWall(a2)
end
u24.die = function(a1)
    --[[
      name: die
      line: 1819
      upvalues:
        u9 (copy, index: 1)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1.fever = false
    a1:applyMeteorLook()
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(1)
    a1.ball.Color = u9
    a1.meteor.Color = ColorSequence.new(u9)
    a1.meteor:Emit(26)
    a1.trail.Color = ColorSequence.new(u9)
    a1.bounceBurst.Color = ColorSequence.new(u9)
    a1.bounceBurst:Emit(16)
    a1.ball.Anchored = false
    a1.ball.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-6, 6), 22, 10)
    a1.ball.AssemblyAngularVelocity = Vector3.new(8, 0, 8)
    task.delay(
        2.5,
        function()
            --[[
              line: 1846
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.ball.Anchored = true
        end
    )
    local score_upv_1 = a1.score
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        0.9,
        function()
            --[[
              line: 1851
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
local tbl_26 = {}
tbl_26.HelixJumpGame = u24
return tbl_26