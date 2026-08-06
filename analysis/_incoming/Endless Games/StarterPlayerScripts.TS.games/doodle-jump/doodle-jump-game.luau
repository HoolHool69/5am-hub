-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local MEDAL_THRESHOLDS_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "medals").MEDAL_THRESHOLDS
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local DOODLE_JUMP_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "doodle-jump-config").DOODLE_JUMP_CONFIG
local DoodlerRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "doodler-rig").DoodlerRig
local u1 = CFrame.new(0, -1000, 0)
local u2 = CFrame.Angles(0, 0, 1.5707963267948966)
local u3 = CFrame.Angles(0, 0, 0.13962634015954636)
local playfieldHalfWidth_upv_1 = DOODLE_JUMP_CONFIG_upv_1.playfieldHalfWidth
local u4 = playfieldHalfWidth_upv_1 * 2
local platinum_upv_1 = MEDAL_THRESHOLDS_1["doodle-jump"].platinum
local diamond_upv_1 = MEDAL_THRESHOLDS_1["doodle-jump"].diamond
local u5 = Color3.fromRGB(10, 9, 26)
local u6 = Color3.fromRGB(235, 238, 255)
local u7 = Color3.fromRGB(247, 242, 224)
local u8 = Color3.fromRGB(196, 182, 148)
local u9 = Color3.fromRGB(110, 186, 92)
local u10 = Color3.fromRGB(116, 196, 88)
local u11 = Color3.fromRGB(90, 158, 232)
local u12 = Color3.fromRGB(172, 120, 70)
local u13 = Color3.fromRGB(105, 70, 38)
local u14 = Color3.fromRGB(139, 178, 122)
local u15 = Color3.fromRGB(152, 154, 162)
local u16 = Color3.fromRGB(212, 70, 58)
local u17 = Color3.fromRGB(214, 200, 168)
local u18 = Color3.fromRGB(150, 210, 120)
local u19 = Color3.fromRGB(240, 240, 250)
local u20 = Color3.fromRGB(255, 216, 102)
local u21 = Color3.fromRGB(235, 240, 255)
local tbl_upv_1 = {Color3.fromRGB(146, 106, 216), Color3.fromRGB(88, 168, 222), Color3.fromRGB(80, 190, 172)}
local tbl_upv_2 = {Color3.fromRGB(104, 72, 162), Color3.fromRGB(58, 122, 168), Color3.fromRGB(52, 138, 124)}
local u22 = Color3.fromRGB(248, 248, 244)
local u23 = Color3.fromRGB(30, 30, 34)
local u24 = Color3.fromRGB(52, 38, 48)
local u25 = Color3.fromRGB(255, 232, 120)
local u26 = Color3.fromRGB(158, 160, 172)
local u27 = Color3.fromRGB(140, 220, 235)
local u28 = Color3.fromRGB(190, 255, 150)
local u29 = Color3.fromRGB(255, 214, 84)
local tbl_upv_3 = {-1.7, 0, 1.7}
local u30 = Color3.fromRGB(214, 74, 74)
local u31 = Color3.fromRGB(70, 72, 86)
local u32 = Color3.fromRGB(154, 158, 172)
local u33 = Color3.fromRGB(255, 148, 54)
local u34 = Color3.fromRGB(96, 176, 255)
local tbl_upv_4 = {"static", "moving", "breakable", "spring", "trap"}
local tbl_upv_5 = {"propeller", "jetpack", "shield"}
local function wrapDelta_1(a1)
    --[[
      name: wrapDelta
      line: 123
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    return ((((a1 + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
end
local function wrapIntoField_1(a1)
    --[[
      name: wrapIntoField
      line: 126
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    return ((((a1 + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
end
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 151
    ]]
    return "DoodleJumpGame"
end
tbl_7.__index = BaseWorldGame_upv_1
local u35 = setmetatable(tbl_6, tbl_7)
u35.__index = u35
u35.new = function(...)
    --[[
      name: new
      line: 157
      upvalues:
        u35 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u35)
    return v3:constructor(...) or v3
end
u35.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 161
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.springRingRemaining = 0
    a1.springRingX = 0
    a1.springRingY = 0
    a1.stars = {}
    a1.lastSpaceBlend = -1
    a1.platforms = {}
    a1.debris = {}
    a1.gridVerticals = {}
    a1.gridHorizontals = {}
    a1.monsters = {}
    a1.monsterCursor = 0
    a1.ufos = {}
    a1.pellets = {}
    a1.powerUps = {}
    a1.playerX = 0
    a1.playerY = 0
    a1.renderPrevX = 0
    a1.renderPrevY = 0
    a1.velocityX = 0
    a1.velocityY = 0
    a1.facingYaw = 0
    a1.pointerHeld = false
    a1.pointerSteer = 0
    a1.fireKeyWasDown = false
    a1.lastFireAt = 0
    a1.springSoundToggle = false
    a1.maxAltitude = 0
    a1.targetCameraY = 0
    a1.cameraX = 0
    a1.cameraY = 0
    a1.chainY = 0
    a1.chainXs = {}
    a1.highestGeneratedY = 0
    a1.levelRungKinds = {}
    a1.levelPlacements = {}
    a1.lastMonsterY = 0
    a1.lastUfoY = 0
    a1.lastPowerUpY = 0
    a1.flightRemaining = 0
    a1.shieldRemaining = 0
    a1.score = 0
    a1.invulnRemaining = 0
    a1.dead = false
    a1.deathCause = "tumble"
    a1.deathVelocityY = 0
    a1.deathSpin = 0
    a1.abductTargetX = 0
    a1.abductTargetY = 0
    a1.roundToken = 0
    a1.random = Random.new()
    a1.ladderSeed = 1
    a1.ladderRandom = Random.new()
end
u35.buildScene = function(a1)
    --[[
      name: buildScene
      line: 216
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u8 (copy, index: 4)
        u1 (copy, index: 5)
        u5 (copy, index: 6)
        u6 (copy, index: 7)
        makeStagePart_upv_1 (copy, index: 8)
        u9 (copy, index: 9)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 10)
        makeEllipsoidPart_upv_1 (copy, index: 11)
        u16 (copy, index: 12)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 13)
        u20 (copy, index: 14)
        SOUND_IDS_upv_1 (copy, index: 15)
        DoodlerRig_upv_1 (copy, index: 16)
        PopupTextPool_upv_1 (copy, index: 17)
        UserInputService_upv_1 (copy, index: 18)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(40)
    a1.paperBackdrop = makeFrontalBackdrop_upv_1(a1.stage, u7, Enum.Material.SmoothPlastic)
    for _ = 0, 27 do
        local v4 = makeSmoothPart_upv_1(container_1)
        v4.Material = Enum.Material.SmoothPlastic
        v4.Color = u8
        v4.Size = Vector3.new(0.14000000059604645, 130, 0.15000000596046448)
        v4.CFrame = u1
        table.insert(a1.gridVerticals, v4)
    end
    for _ = 0, 25 do
        local v5 = makeSmoothPart_upv_1(container_1)
        v5.Material = Enum.Material.SmoothPlastic
        v5.Color = u8
        v5.Size = Vector3.new(120, 0.14000000059604645, 0.15000000596046448)
        v5.CFrame = u1
        table.insert(a1.gridHorizontals, v5)
    end
    a1.spaceBackdrop = makeFrontalBackdrop_upv_1(a1.stage, u5)
    a1.spaceBackdrop.Transparency = 1
    for n_1 = 0, 25 do
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Material = Enum.Material.Neon
        v6.Color = u6
        local v7 = ((n_1 * 29) % 5) * 0.12 + 0.35
        v6.Size = Vector3.new(v7, v7, 0.2)
        v6.Transparency = 1
        v6.CFrame = u1
        table.insert(a1.stars, v6)
    end
    a1.ground = makeStagePart_upv_1(container_1)
    a1.ground.Color = u9
    a1.ground.Size = Vector3.new(220, 6, 6)
    a1.ground.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -5, 0))
    for _ = 0, DOODLE_JUMP_CONFIG_upv_1.platformPoolSize - 1 do
        local v8 = makeStagePart_upv_1(container_1)
        v8.Size = Vector3.new(DOODLE_JUMP_CONFIG_upv_1.platformWidthMin, DOODLE_JUMP_CONFIG_upv_1.platformHeight, DOODLE_JUMP_CONFIG_upv_1.platformDepth)
        v8.CFrame = u1
        local v9 = makeSmoothPart_upv_1(container_1)
        v9.CFrame = u1
        local v10 = makeEllipsoidPart_upv_1(container_1)
        v10.Color = u16
        v10.Size = Vector3.new(1.600000023841858, 0.4000000059604645, 1.600000023841858)
        v10.CFrame = u1
        table.insert(a1.platforms, {part = v8, accent = v9, cap = v10, width = DOODLE_JUMP_CONFIG_upv_1.platformWidthMin})
    end
    a1.impactDustAnchor = makeSmoothPart_upv_1(container_1)
    a1.impactDustAnchor.Transparency = 1
    a1.impactDustAnchor.Size = Vector3.new(1.600000023841858, 0.30000001192092896, 0.6000000238418579)
    a1.impactDustAnchor.CFrame = u1
    a1.impactDust = Instance.new("ParticleEmitter")
    a1.impactDust.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.impactDust.Rate = 0
    a1.impactDust.Lifetime = NumberRange.new(0.22, 0.45)
    a1.impactDust.Speed = NumberRange.new(5, 12)
    a1.impactDust.SpreadAngle = Vector2.new(65, 65)
    a1.impactDust.EmissionDirection = Enum.NormalId.Top
    a1.impactDust.Acceleration = Vector3.new(0, -36, 0)
    a1.impactDust.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.1)})
    a1.impactDust.Rotation = NumberRange.new(0, 90)
    a1.impactDust.RotSpeed = NumberRange.new(-160, 160)
    a1.impactDust.Parent = a1.impactDustAnchor
    a1.springRing = makeEllipsoidPart_upv_1(container_1)
    a1.springRing.Material = Enum.Material.Neon
    a1.springRing.Color = u20
    a1.springRing.Transparency = 1
    a1.springRing.CFrame = u1
    a1:buildDebrisPool(container_1)
    a1:buildMonsterPool(container_1)
    a1:buildUfoPool(container_1)
    a1:buildPelletPool(container_1)
    a1:buildPowerUpPool(container_1)
    a1:buildWornGear(container_1)
    a1.propellerSound = a1:makeLoopSound(container_1, SOUND_IDS_upv_1.doodlePropeller, 0.45)
    a1.jetpackSound = a1:makeLoopSound(container_1, SOUND_IDS_upv_1.doodleJetpack, 0.5)
    a1.doodler = DoodlerRig_upv_1.new(container_1)
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 339
                  upvalues:
                    UserInputService_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                if a3 ~= "key" then
                    if UserInputService_upv_1:GetLastInputType() == Enum.UserInputType.Touch then
                        a1.pointerHeld = true
                        a1.pointerSteer = a1:steerFromScreenX(a2.X)
                    end
                    a1:firePellet(a1:aimWorldXFromScreenX(a2.X))
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.drag:Connect(
            function(a4, a5)
                --[[
                  line: 349
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if not a1.pointerHeld then
                    return
                end
                a1.pointerSteer = a1:steerFromScreenX(a5.X)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 354
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a8 ~= "key" then
                    a1.pointerHeld = false
                    a1.pointerSteer = 0
                else
                    return nil
                end
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_8 = {}
        tbl_8.scoreToStuds = function(a9)
            --[[
              name: scoreToStuds
              line: 370
              upvalues:
                DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a9 * DOODLE_JUMP_CONFIG_upv_1.altitudePerPoint
        end
        tbl_8.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 373
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.playerY
        end
        tbl_8.poseMarker = function(a10)
            --[[
              name: poseMarker
              line: 376
              upvalues:
                origin_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            return CFrame.new(origin_upv_1.X + a1.cameraX, origin_upv_1.Y + a10, origin_upv_1.Z - 0.5)
        end
        tbl_8.marginHalfSpan = function()
            --[[
              name: marginHalfSpan
              line: 381
              upvalues:
                a1 (copy, index: 1)
            ]]
            return (a1.stage.getFrameWidth() / 2) - 2.5
        end
        registerRivalMarkers_1(tbl_8)
    end
end
u35.isFireHeld = function(a1)
    --[[
      name: isFireHeld
      line: 392
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
    ]]
    local v11 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Space) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Up) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.W) or (gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA))))
    return v11
end
u35.resetRound = function(a1)
    --[[
      name: resetRound
      line: 395
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 3)
        u4 (copy, index: 4)
        playfieldHalfWidth_upv_1 (copy, index: 5)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.ladderSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    a1.ladderRandom = Random.new(a1.ladderSeed)
    a1.dead = false
    a1.deathCause = "tumble"
    a1.springRingRemaining = 0
    a1.springRing.Transparency = 1
    a1.springRing.CFrame = u1
    a1.playerX = 0
    a1.playerY = 1
    a1.renderPrevX = 0
    a1.renderPrevY = 1
    a1.velocityX = 0
    a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity * 0.9
    a1.facingYaw = 0
    a1.pointerHeld = false
    a1.pointerSteer = 0
    a1.fireKeyWasDown = a1:isFireHeld()
    a1.maxAltitude = 0
    a1.targetCameraY = 0
    a1.cameraX = 0
    a1.cameraY = 0
    a1.score = 0
    a1.invulnRemaining = 0
    a1.flightRemaining = 0
    a1.flightKind = nil
    a1.shieldRemaining = 0
    a1.lastMonsterY = 0
    a1.lastUfoY = 0
    a1.lastPowerUpY = 0
    a1.lastSpaceBlend = -1
    a1:reclaimAllPlatforms()
    a1:reclaimAllActors()
    a1:parkWornGear()
    a1:stopFlightSounds()
    a1:placePlatform(0, 0, "static", DOODLE_JUMP_CONFIG_upv_1.platformWidthMax)
    a1.chainY = 0
    table.clear(a1.chainXs)
    for n_2 = 0, DOODLE_JUMP_CONFIG_upv_1.chainCount - 1 do
        table.insert(a1.chainXs, ((((((n_2 * u4) / DOODLE_JUMP_CONFIG_upv_1.chainCount) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)
    end
    a1.highestGeneratedY = 0
    a1:generateAhead()
    a1.context.reportScore(0)
end
u35.captureRound = function(a1)
    --[[
      name: captureRound
      line: 449
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        tbl_upv_5 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    else
        local tbl_upv_9 = {}
        local v12 = 0
        for key_1, value_1 in a1.platforms do
            if value_1.active == true then
                v12 = v12 + 1
                tbl_upv_9[v12] = value_1
            end
        end
        local tbl_upv_10 = {}
        local key_1 = 0
        for key_2, value_2 in a1.monsters do
            if value_2.active == true then
                key_1 = key_1 + 1
                tbl_upv_10[key_1] = value_2
            end
        end
        local tbl_upv_11 = {}
        local key_2 = 0
        for key_3, value_3 in a1.ufos do
            if value_3.active == true then
                key_2 = key_2 + 1
                tbl_upv_11[key_2] = value_3
            end
        end
        local tbl_upv_12 = {}
        local key_3 = 0
        for _, value_4 in a1.powerUps do
            if value_4.active == true then
                key_3 = key_3 + 1
                tbl_upv_12[key_3] = value_4
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 513
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_5 (copy, index: 2)
                    tbl_upv_9 (copy, index: 3)
                    tbl_upv_4 (copy, index: 4)
                    tbl_upv_10 (copy, index: 5)
                    tbl_upv_11 (copy, index: 6)
                    tbl_upv_12 (copy, index: 7)
                ]]
                a2:int(a1.score)
                a2:num(a1.playerX):num(a1.playerY):num(a1.velocityX):num(a1.velocityY):num(a1.facingYaw)
                a2:num(a1.maxAltitude):num(a1.targetCameraY):num(a1.cameraX):num(a1.cameraY)
                a2:num(a1.invulnRemaining):num(a1.flightRemaining):num(a1.shieldRemaining)
                local v13 = ((a1.flightKind ~= nil) and ((table.find(tbl_upv_5, a1.flightKind) or 0) - 1)) or -1
                a2:int(v13)
                a2:num(a1.chainY):num(a1.highestGeneratedY)
                a2:num(a1.lastMonsterY):num(a1.lastUfoY):num(a1.lastPowerUpY)
                a2:int(#a1.chainXs)
                for _, value_5 in a1.chainXs do
                    a2:num(value_5)
                end
                a2:int(#tbl_upv_9)
                for _, value_6 in tbl_upv_9 do
                    a2:int((math.max((table.find(tbl_upv_4, value_6.kind) or 0) - 1, 0)))
                    a2:num(value_6.x):num(value_6.y):num(value_6.width)
                    a2:num(value_6.slideCenter):num(value_6.slideAmplitude):num(value_6.slidePhase):num(value_6.slideSpeed)
                    a2:num(value_6.springOffsetX)
                end
                a2:int(#tbl_upv_10)
                for _, value_7 in tbl_upv_10 do
                    a2:num(value_7.x):num(value_7.y):num(value_7.bobPhase)
                end
                a2:int(#tbl_upv_11)
                for _, value_8 in tbl_upv_11 do
                    a2:num(value_8.swayCenter):num(value_8.x):num(value_8.y):num(value_8.swayPhase):int(value_8.hitPoints)
                end
                a2:int(#tbl_upv_12)
                for _, value_9 in tbl_upv_12 do
                    a2:int((math.max((table.find(tbl_upv_5, value_9.kind) or 0) - 1, 0)))
                    a2:num(value_9.x):num(value_9.y):num(value_9.bobPhase)
                end
            end
        )
    end
end
u35.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 559
      upvalues:
        readResume_upv_1 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
        deriveSeed_upv_1 (copy, index: 4)
    ]]
    local v14 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 560
              upvalues:
                tbl_upv_4 (copy, index: 1)
                tbl_upv_5 (copy, index: 2)
            ]]
            local tbl_13 = {}
            tbl_13.score = a3:int()
            tbl_13.playerX = a3:num()
            tbl_13.playerY = a3:num()
            tbl_13.velocityX = a3:num()
            tbl_13.velocityY = a3:num()
            tbl_13.facingYaw = a3:num()
            tbl_13.maxAltitude = a3:num()
            tbl_13.targetCameraY = a3:num()
            tbl_13.cameraX = a3:num()
            tbl_13.cameraY = a3:num()
            tbl_13.invulnRemaining = a3:num()
            tbl_13.flightRemaining = a3:num()
            tbl_13.shieldRemaining = a3:num()
            tbl_13.flightKindIndex = a3:int()
            tbl_13.chainY = a3:num()
            tbl_13.highestGeneratedY = a3:num()
            tbl_13.lastMonsterY = a3:num()
            tbl_13.lastUfoY = a3:num()
            tbl_13.lastPowerUpY = a3:num()
            local v15 = a3:int()
            local tbl_14 = {}
            local v16 = 0
            local tbl_15 = false
            tbl_15, v16 = tbl_15, v16
            while true do
                if tbl_15 then
                    v16 = v16 + 1
                else
                    tbl_15 = true
                end
                if v16 >= v15 then
                    break
                end
                table.insert(tbl_14, (a3:num()))
            end
            v16 = a3:int()
            tbl_15 = {}
            local v17 = 0
            local tbl_16 = false
            tbl_16, v17 = tbl_16, v17
            if tbl_16 then
                v17 = v17 + 1
            else
                tbl_16 = true
            end
            local v18 = nil
            if v17 < v16 then
                v18 = tbl_upv_4[a3:int() + 1]
                if v18 == nil then
                    error("doodle-jump: bad platform kind")
                end
                table.insert(tbl_15, {kind = v18, x = a3:num(), y = a3:num(), width = a3:num(), slideCenter = a3:num(), slideAmplitude = a3:num(), slidePhase = a3:num(), slideSpeed = a3:num(), springOffsetX = a3:num()})
                if tbl_16 then
                    v17 = v17 + 1
                else
                    tbl_16 = true
                end
                --[[ goto label_7 ]]--
            end
            v17 = a3:int()
            tbl_16 = {}
            local _ = 0
            local tbl_17 = false
            while true do
                if tbl_17 then
                    v18 = v18 + 1
                else
                    tbl_17 = true
                end
                if v18 >= v17 then
                    break
                end
                table.insert(tbl_16, {x = a3:num(), y = a3:num(), bobPhase = a3:num()})
            end
            v18 = a3:int()
            tbl_17 = {}
            local v19 = 0
            local tbl_18 = false
            tbl_18, v19 = tbl_18, v19
            while true do
                if tbl_18 then
                    v19 = v19 + 1
                else
                    tbl_18 = true
                end
                if v19 >= v18 then
                    break
                end
                table.insert(tbl_17, {swayCenter = a3:num(), x = a3:num(), y = a3:num(), swayPhase = a3:num(), hitPoints = a3:int()})
            end
            v19 = a3:int()
            tbl_18 = {}
            local v20 = 0
            local v21 = false
            v21, v20 = v21, v20
            if v21 then
                v20 = v20 + 1
            else
                v21 = true
            end
            local v22 = nil
            if v20 < v19 then
                v22 = tbl_upv_5[a3:int() + 1]
                if v22 == nil then
                    error("doodle-jump: bad power-up kind")
                end
                table.insert(tbl_18, {kind = v22, x = a3:num(), y = a3:num(), bobPhase = a3:num()})
                if v21 then
                    v20 = v20 + 1
                else
                    v21 = true
                end
                --[[ goto label_19 ]]--
            end
            v20 = table.clone(tbl_13)
            setmetatable(v20, nil)
            v20.chainXs = tbl_14
            v20.pads = tbl_15
            v20.aliens = tbl_16
            v20.saucers = tbl_17
            v20.pickups = tbl_18
            return v20
        end
    )
    if v14 ~= nil and #a1.platforms >= #v14.pads and #v14.chainXs ~= 0 then
        a1:reclaimAllPlatforms()
        a1:reclaimAllActors()
        a1:parkWornGear()
        a1:stopFlightSounds()
        a1.score = a2.score
        a1.playerX = v14.playerX
        a1.playerY = v14.playerY
        a1.renderPrevX = v14.playerX
        a1.renderPrevY = v14.playerY
        a1.velocityX = v14.velocityX
        a1.velocityY = v14.velocityY
        a1.facingYaw = v14.facingYaw
        a1.maxAltitude = v14.maxAltitude
        a1.targetCameraY = v14.targetCameraY
        a1.cameraX = v14.cameraX
        a1.cameraY = v14.cameraY
        a1.invulnRemaining = v14.invulnRemaining
        a1.flightRemaining = v14.flightRemaining
        a1.shieldRemaining = v14.shieldRemaining
        a1.flightKind = tbl_upv_5[v14.flightKindIndex + 1]
        a1.chainY = v14.chainY
        a1.highestGeneratedY = v14.highestGeneratedY
        a1.lastMonsterY = v14.lastMonsterY
        a1.lastUfoY = v14.lastUfoY
        a1.lastPowerUpY = v14.lastPowerUpY
        a1.dead = false
        a1.deathCause = "tumble"
        a1.pointerHeld = false
        a1.pointerSteer = 0
        a1.fireKeyWasDown = a1:isFireHeld()
        a1.springRingRemaining = 0
        a1.lastSpaceBlend = -1
        a1.roundToken = a1.roundToken + 1
        table.clear(a1.chainXs)
        for _, value_10 in v14.chainXs do
            table.insert(a1.chainXs, value_10)
        end
        local v23 = nil
        for _, value_11 in v14.pads do
            v23 = a1:placePlatform(value_11.x, value_11.y, value_11.kind, value_11.width)
            if v23 ~= nil then
                v23.slideCenter = value_11.slideCenter
                v23.slideAmplitude = value_11.slideAmplitude
                v23.slidePhase = value_11.slidePhase
                v23.slideSpeed = value_11.slideSpeed
                v23.springOffsetX = value_11.springOffsetX
            end
        end
        local _ = nil
        for key_4, value_12 in v14.aliens do
            _ = a1:placeMonster(value_12.x, value_12.y, value_12.bobPhase, key_4 - 1)
        end
        local v24 = nil
        for v25, value_13 in v14.saucers do
            a1:placeUfo(value_13.swayCenter, value_13.y, value_13.swayPhase)
            v24 = nil
            for v26, value_14 in a1.ufos do
                if (value_14.active and (value_14.swayCenter == value_13.swayCenter)) == true then
                    v24 = value_14
                    break
                end
            end
            if v24 ~= nil then
                v24.x = value_13.x
                v24.hitPoints = value_13.hitPoints
            end
        end
        for v27, value_15 in v14.pickups do
            a1:placePowerUp(value_15.x, value_15.y, value_15.kind, value_15.bobPhase)
        end
        a1.ladderRandom = Random.new(deriveSeed_upv_1(a1.ladderSeed, math.floor(a1.highestGeneratedY) + 1))
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u35.revive = function(a1)
    --[[
      name: revive
      line: 810
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        playfieldHalfWidth_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.deathCause = "tumble"
    a1.invulnRemaining = DOODLE_JUMP_CONFIG_upv_1.reviveInvulnSeconds
    a1.pointerHeld = false
    a1.pointerSteer = 0
    a1.fireKeyWasDown = a1:isFireHeld()
    local v25 = (((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
    local v26 = a1.targetCameraY - 6
    for _, value_16 in a1.platforms do
        if not (value_16.active) or DOODLE_JUMP_CONFIG_upv_1.platformHeight + 0.5 <= math.abs(value_16.y - v26) then
            continue
        end
        if math.abs((((((value_16.slideCenter - v25) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) < (((value_16.width / 2) + value_16.slideAmplitude) + (DOODLE_JUMP_CONFIG_upv_1.platformWidthMax / 2)) + 1 then
            a1:parkPlatform(value_16)
        end
    end
    a1:placePlatform(v25, v26, "static", DOODLE_JUMP_CONFIG_upv_1.platformWidthMax)
    a1.playerY = v26 + (DOODLE_JUMP_CONFIG_upv_1.platformHeight / 2)
    a1.velocityX = 0
    a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity * DOODLE_JUMP_CONFIG_upv_1.reviveBoostMultiplier
    for _, value_17 in a1.monsters do
        if not (value_17.active) then
            continue
        end
        if math.abs(value_17.y - a1.playerY) < DOODLE_JUMP_CONFIG_upv_1.reviveThreatClearance then
            a1:parkMonster(value_17)
        end
    end
    for _, value_18 in a1.ufos do
        if not (value_18.active) then
            continue
        end
        if math.abs(value_18.y - a1.playerY) < DOODLE_JUMP_CONFIG_upv_1.reviveThreatClearance + 15 then
            a1:parkUfo(value_18)
        end
    end
    for _, value_19 in a1.pellets do
        a1:parkPellet(value_19)
    end
    a1:setRunning(true)
end
u35.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 853
      upvalues:
        u1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
        gamepadInput_upv_1 (copy, index: 3)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 4)
        playfieldHalfWidth_upv_1 (copy, index: 5)
        u4 (copy, index: 6)
        u20 (copy, index: 7)
    ]]
    local v27, v28, v29 = nil, nil, nil
    if a1.dead then
        return nil
    else
        a1.renderPrevX = a1.playerX
        a1.renderPrevY = a1.playerY
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        if a1.shieldRemaining > 0 then
            a1.shieldRemaining = a1.shieldRemaining - a2
            if a1.shieldRemaining <= 0 then
                a1.wornShield.CFrame = u1
            end
        end
        local v30 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Left) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.A))
        local v31 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Right) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.D))
        local v32
        if v31 then
            v32 = 1
        else
            v32 = 0
        end
        local v33 = math.clamp((a1.pointerSteer + (v32 - ((v30 and 1) or 0))) + gamepadInput_upv_1:moveX(), -1, 1)
        v27 = a1:isFireHeld()
        if v27 and not (a1.fireKeyWasDown) then
            a1:firePellet(nil)
        end
        a1.fireKeyWasDown = v27
        local v34 = v33 * DOODLE_JUMP_CONFIG_upv_1.steerMaxSpeed
        local v35
        if v33 ~= 0 then
            v35 = DOODLE_JUMP_CONFIG_upv_1.steerAccel
        else
            v35 = DOODLE_JUMP_CONFIG_upv_1.steerFriction
        end
        v28 = v34 - a1.velocityX
        v29 = v35 * a2
        local v36
        if math.abs(v28) > v29 then
            v36 = a1.velocityX + math.sign(v28) * v29
        else
            v36 = v34
        end
        a1.velocityX = v36
        a1.playerX = a1.playerX + (a1.velocityX * a2)
        local playerY_1 = a1.playerY
        if a1.flightRemaining <= 0 then
            a1.velocityY = math.max(a1.velocityY + (DOODLE_JUMP_CONFIG_upv_1.gravity * a2), DOODLE_JUMP_CONFIG_upv_1.terminalVelocity)
        else
            a1.flightRemaining = a1.flightRemaining - a2
            local v37
            if a1.flightKind ~= "jetpack" then
                v37 = DOODLE_JUMP_CONFIG_upv_1.propellerLiftSpeed
            else
                v37 = DOODLE_JUMP_CONFIG_upv_1.jetpackLiftSpeed
            end
            a1.velocityY = a1.velocityY + ((v37 - a1.velocityY) * math.min(DOODLE_JUMP_CONFIG_upv_1.flightEaseRate * a2, 1))
            if a1.flightRemaining <= 0 then
                a1:endFlight()
            end
        end
        a1.playerY = a1.playerY + (a1.velocityY * a2)
        for _, value_20 in a1.platforms do
            if not (value_20.active) then
                continue
            end
            if value_20.kind == "moving" then
                value_20.slidePhase = value_20.slidePhase + (value_20.slideSpeed * a2)
                value_20.x = (((((value_20.slideCenter + (math.sin(value_20.slidePhase) * value_20.slideAmplitude)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
            end
        end
        if a1.flightRemaining <= 0 and a1.velocityY < 0 then
            a1:resolveLanding(playerY_1)
        end
        a1:updatePellets(a2)
        a1:updateMonsters(playerY_1)
        if a1.dead then
            return nil
        else
            a1:updateUfos(a2, playerY_1)
            local v38
            if a1.dead then
                return nil
            end
            a1:updatePowerUpPickups()
            if a1.maxAltitude < a1.playerY then
                a1.maxAltitude = a1.playerY
                a1.targetCameraY = math.max(a1.targetCameraY, a1.playerY - DOODLE_JUMP_CONFIG_upv_1.cameraFollowOffset)
            end
            a1:generateAhead()
            a1:recycleBelow()
            v38 = math.floor(a1.maxAltitude / DOODLE_JUMP_CONFIG_upv_1.altitudePerPoint)
            if a1.score < v38 then
                a1.score = v38
                a1.context.reportScore(a1.score)
                if a1.score % DOODLE_JUMP_CONFIG_upv_1.milestoneEvery == 0 then
                    a1.context.audio.play("perfect", {})
                    a1.popups:show(a1:playerPosition() + Vector3.new(0, 3, 2), ("%*"):format(a1.score), u20, 1.1)
                end
            end
            if a1.flightRemaining <= 0 and a1.invulnRemaining <= 0 and a1.playerY < a1.targetCameraY - (a1.stage.getVisibleHeight() / 2) - DOODLE_JUMP_CONFIG_upv_1.killMargin then
                a1:die("tumble")
            end
        end
    end
end
u35.render = function(a1, a2)
    --[[
      name: render
      line: 955
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        playfieldHalfWidth_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        u2 (copy, index: 4)
        u3 (copy, index: 5)
        u1 (copy, index: 6)
        tbl_upv_3 (copy, index: 7)
        platinum_upv_1 (copy, index: 8)
        diamond_upv_1 (copy, index: 9)
    ]]
    a1.cameraX = a1.cameraX + ((a1.playerX - a1.cameraX) * math.min(a2 * DOODLE_JUMP_CONFIG_upv_1.cameraFollowRateX, 1))
    a1.cameraY = a1.cameraY + ((a1.targetCameraY - a1.cameraY) * math.min(a2 * DOODLE_JUMP_CONFIG_upv_1.cameraFollowRate, 1))
    a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
    a1:posePlayer(a2)
    local origin_2 = a1.stage.origin
    local v39 = os.clock()
    local v40 = (((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
    local v41 = nil
    local v42 = nil
    for _, value_21 in a1.platforms do
        if not (value_21.active) then
            continue
        end
        v41 = a1.playerX + ((((((value_21.x - v40) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)
        v42 = value_21.y
        if v39 < value_21.pressedUntil then
            v42 = v42 - math.sin(((value_21.pressedUntil - v39) / 0.16) * math.pi) * 0.45
        end
        value_21.part.CFrame = CFrame.new(origin_2 + Vector3.new(v41, v42, 0))
        if value_21.kind == "spring" then
            local v43 = v39 < value_21.springStretchUntil
            if v43 ~= value_21.springStretched then
                value_21.springStretched = v43
                value_21.accent.Size = (v43 and Vector3.new(1.5, 0.6499999761581421, 0.6499999761581421)) or Vector3.new(0.699999988079071, 0.800000011920929, 0.800000011920929)
            end
            local v44 = (v43 and 1.5) or 0.699999988079071
            local v45 = v41 + value_21.springOffsetX
            local v46 = v42 + DOODLE_JUMP_CONFIG_upv_1.platformHeight / 2
            value_21.accent.CFrame = CFrame.new(origin_2 + Vector3.new(v45, v46 + (v44 / 2), 0)) * u2
            value_21.cap.CFrame = CFrame.new(origin_2 + Vector3.new(v45, (v46 + v44) + 0.18, 0))
        elseif value_21.kind == "breakable" then
            value_21.accent.CFrame = CFrame.new(origin_2 + Vector3.new(v41, v42, 0)) * u3
        end
    end
    if a1.springRingRemaining > 0 then
        a1.springRingRemaining = math.max(a1.springRingRemaining - a2, 0)
        local v47 = 1 - a1.springRingRemaining / 0.28
        if a1.springRingRemaining ~= 0 then
            a1.springRing.Size = Vector3.new(2 + (6.5 * v47), 0.2 + 0.5 * (1 - v47), 0.8)
            a1.springRing.Transparency = 0.15 + (0.85 * v47)
            a1.springRing.CFrame = CFrame.new(origin_2 + Vector3.new(a1.springRingX, a1.springRingY, 0.6))
        else
            a1.springRing.Transparency = 1
            a1.springRing.CFrame = u1
        end
    end
    local v48 = nil
    local _ = nil
    local v60 = nil
    local v49 = nil
    local v50 = nil
    local v51 = nil
    for v61, value_22 in a1.monsters do
        if not (value_22.active) then
            continue
        end
        v49 = value_22.y + math.sin((v39 * 2) + value_22.bobPhase) * 0.45
        v50 = math.sin((v39 * 1.7) + value_22.bobPhase) * 0.07
        v48 = CFrame.new(origin_2 + Vector3.new(a1.playerX + ((((((value_22.x - v40) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1), v49, 0)) * CFrame.Angles(0, 0, v50)
        for v62, value_23 in value_22.pieces do
            value_23.part.CFrame = v48 * value_23.offset
        end
        v51 = math.sin((v39 * 9) + value_22.bobPhase) * 0.6
        for v63, value_24 in value_22.wings do
            value_24.part.CFrame = ((v48 * value_24.hinge) * CFrame.Angles(0, 0, v51 * value_24.side)) * value_24.rest
        end
    end
    local v52 = nil
    local v53 = nil
    for v64, value_25 in a1.ufos do
        if not (value_25.active) then
            continue
        end
        v52 = a1.playerX + ((((((value_25.x - v40) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)
        v53 = value_25.y + math.sin((v39 * 1.6) + value_25.swayPhase) * 0.4
        value_25.disc.CFrame = CFrame.new(origin_2 + Vector3.new(v52, v53, 0)) * u2
        value_25.dome.CFrame = CFrame.new(origin_2 + Vector3.new(v52, v53 + 0.9, 0))
        value_25.beam.CFrame = CFrame.new(origin_2 + Vector3.new(v52, (v53 - DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight) - (DOODLE_JUMP_CONFIG_upv_1.ufoBeamDepth / 2), 0)) * u2
        value_25.beam.Transparency = (math.sin((v39 * 6) + value_25.swayPhase) * 0.13) + 0.62
        for n_3 = 0, #value_25.lights - 1 do
            local v54 = value_25.lights[n_3 + 1]
            v54.CFrame = CFrame.new(origin_2 + Vector3.new(v52 + tbl_upv_3[n_3 + 1], v53 - 0.5, 1))
            v54.Transparency = (((math.sin((v39 * 5) + (n_3 * 2.1)) * 0.5) + 0.5) * 0.55) + 0.1
        end
    end
    local v55 = nil
    local v56 = nil
    for v65, value_26 in a1.powerUps do
        if not (value_26.active) then
            continue
        end
        v55 = a1.playerX + ((((((value_26.x - v40) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)
        v56 = value_26.y + math.sin((v39 * 2.4) + value_26.bobPhase) * 0.3
        value_26.main.CFrame = CFrame.new(origin_2 + Vector3.new(v55, v56, 0))
        if value_26.kind == "propeller" then
            value_26.accent.CFrame = CFrame.new(origin_2 + Vector3.new(v55, v56 + 0.75, 0)) * CFrame.Angles(0, v39 * 10, 0)
            continue
        end
        if value_26.kind == "jetpack" then
            value_26.accent.CFrame = CFrame.new(origin_2 + Vector3.new(v55, v56 - 0.2, 0))
        end
    end
    for v66, value_27 in a1.pellets do
        if value_27.active then
            value_27.part.CFrame = CFrame.new(origin_2 + Vector3.new(value_27.x, value_27.y, 1.4))
        end
    end
    a1:renderWornGear(v39)
    local v57 = math.floor((a1.cameraX - 56) / 4)
    for n_4 = 0, #a1.gridVerticals - 1 do
        a1.gridVerticals[n_4 + 1].CFrame = CFrame.new(origin_2 + Vector3.new((v57 + n_4) * 4, a1.cameraY, -1.2))
    end
    local v58 = math.floor((a1.cameraY - 52) / 4)
    for n_5 = 0, #a1.gridHorizontals - 1 do
        a1.gridHorizontals[n_5 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX, (v58 + n_5) * 4, -1.2))
    end
    a1.paperBackdrop.CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX, a1.cameraY, -44))
    a1.spaceBackdrop.CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX, a1.cameraY, -40))
    local n_5 = math.floor((a1.cameraY - 52) / 4) * 4
    for n_6 = 0, #a1.stars - 1 do
        a1.stars[n_6 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX + (((n_6 * 53) % 96) - 48), n_5 + (n_6 * 4), -35))
    end
    local v59 = math.clamp((a1.score - platinum_upv_1) / (diamond_upv_1 - platinum_upv_1), 0, 1)
    if math.abs(v59 - a1.lastSpaceBlend) > 0.004 then
        a1.lastSpaceBlend = v59
        a1.spaceBackdrop.Transparency = 1 - v59
        v42 = nil
        local v67 = nil
        for v68, value_28 in a1.gridVerticals do
            value_28.Transparency = v59
        end
        for v69, value_29 in a1.gridHorizontals do
            value_29.Transparency = v59
        end
        for n_7 = 0, #a1.stars - 1 do
            a1.stars[n_7 + 1].Transparency = 1 - (v59 * ((((n_7 * 17) % 4) * 0.08) + 0.75))
        end
    end
end
u35.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 1126
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        if a1.deathCause ~= "abduct" then
            a1.deathVelocityY = a1.deathVelocityY + (DOODLE_JUMP_CONFIG_upv_1.gravity * a2)
            a1.playerY = a1.playerY + (a1.deathVelocityY * a2)
            a1.deathSpin = a1.deathSpin + (540 * a2)
            a1:poseDeathPivot(CFrame.new(a1:playerPosition() + Vector3.new(0, a1:pivotOffset(), 0)) * CFrame.Angles(0, 0, math.rad(a1.deathSpin)))
        else
            a1.playerX = a1.playerX + ((a1.abductTargetX - a1.playerX) * math.min(a2 * 5, 1))
            a1.playerY = math.min(a1.playerY + (DOODLE_JUMP_CONFIG_upv_1.abductRiseSpeed * a2), a1.abductTargetY)
            a1.deathSpin = a1.deathSpin + (900 * a2)
            a1:poseDeathPivot(CFrame.new(a1:playerPosition() + Vector3.new(0, a1:pivotOffset(), 0)) * CFrame.Angles(0, math.rad(a1.deathSpin), 0))
            return nil
        end
    else
        a1:render(a2)
        return nil
    end
end
u35.resolveLanding = function(a1, a2)
    --[[
      name: resolveLanding
      line: 1153
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 3)
        u18 (copy, index: 4)
        u20 (copy, index: 5)
        u17 (copy, index: 6)
    ]]
    local v60 = (((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
    local v61 = nil
    local v62 = -math.huge
    local v63 = nil
    for _, value_30 in a1.platforms do
        if not (value_30.active) then
            continue
        end
        v63 = value_30.y + DOODLE_JUMP_CONFIG_upv_1.platformHeight / 2
        if v63 > a2 or a1.playerY >= v63 or (value_30.width / 2) + DOODLE_JUMP_CONFIG_upv_1.playerHalfWidth <= math.abs((((((v60 - value_30.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) then
            continue
        end
        if value_30.kind == "trap" then
            a1:breakPlatform(value_30)
            continue
        end
        if v62 < v63 then
            v62, v61 = v63, value_30
        end
    end
    if v61 ~= nil then
        a1.playerY = v62
        v61.pressedUntil = os.clock() + 0.16
        if v61.kind ~= "spring" or math.abs((((((v60 - ((((((v61.x + v61.springOffsetX) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) >= 1.8 then
            a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity
            a1:puffImpact(a1.playerX, v62, u17, 8)
            a1.context.audio.play("pop", {pitch = ((math.floor(a1.maxAltitude / 40) % 8) * 0.05) + 1})
        else
            a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity * DOODLE_JUMP_CONFIG_upv_1.springMultiplier
            v61.springStretchUntil = os.clock() + 0.3
            a1:puffImpact(a1.playerX, v62, u20, 14)
            a1.springRingRemaining = 0.28
            a1.springRingX = a1.playerX
            a1.springRingY = v62 + 0.4
            a1.springSoundToggle = not a1.springSoundToggle
            a1.context.audio.play(((a1.springSoundToggle) and "doodleSpring") or "doodleSpring2", {})
        end
        if v61.kind == "breakable" then
            a1:breakPlatform(v61)
        end
    else
        if a2 >= -2 and a1.playerY < -2 then
            a1.playerY = -2
            a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity
            a1:puffImpact(a1.playerX, -2, u18, 10)
            a1.context.audio.play("pop", {})
        end
        return nil
    end
end
u35.puffImpact = function(a1, a2, a3, a4, a5)
    --[[
      name: puffImpact
      line: 1223
    ]]
    a1.impactDustAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2, a3, 0.8))
    a1.impactDust.Color = ColorSequence.new(a4)
    a1.impactDust:Emit(a5)
end
u35.breakPlatform = function(a1, a2)
    --[[
      name: breakPlatform
      line: 1230
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u14 (copy, index: 3)
        u12 (copy, index: 4)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 5)
    ]]
    local v64 = a2.kind == "trap"
    local v65 = a1.playerX + ((((((a2.x - (((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)
    local u36 = a1:claimDebris()
    if u36 ~= nil then
        u36.token = u36.token + 1
        local token_upv_1 = u36.token
        u36.active = true
        local v66
        if v64 then
            v66 = u14
        else
            v66 = u12
        end
        local v67 = Vector3.new(a2.width / 2, DOODLE_JUMP_CONFIG_upv_1.platformHeight, DOODLE_JUMP_CONFIG_upv_1.platformDepth)
        local origin_3 = a1.stage.origin
        local v68 = a1.random:NextNumber(5, 8)
        u36.left.Color = v66
        u36.left.Size = v67
        u36.left.CFrame = CFrame.new(origin_3 + Vector3.new(v65 - (a2.width / 4), a2.y, 0))
        u36.left.Anchored = false
        u36.left.AssemblyLinearVelocity = Vector3.new((a1.velocityX * 0.25) - 3.5, -9, 0)
        u36.left.AssemblyAngularVelocity = Vector3.new(0, a1.random:NextNumber(-1.5, 1.5), -v68)
        u36.right.Color = v66
        u36.right.Size = v67
        u36.right.CFrame = CFrame.new(origin_3 + Vector3.new(v65 + (a2.width / 4), a2.y, 0))
        u36.right.Anchored = false
        u36.right.AssemblyLinearVelocity = Vector3.new((a1.velocityX * 0.25) + 3.5, -9, 0)
        u36.right.AssemblyAngularVelocity = Vector3.new(0, a1.random:NextNumber(-1.5, 1.5), v68)
        task.delay(
            2.5,
            function()
                --[[
                  line: 1257
                  upvalues:
                    u36 (copy, index: 1)
                    token_upv_1 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                if u36.token == token_upv_1 and u36.active then
                    a1:parkDebris(u36)
                else
                    return nil
                end
            end
        )
    end
    a1:parkPlatform(a2)
    local play_1 = a1.context.audio.play
    local tbl_19 = {}
    tbl_19.volume = (v64 and 0.4) or 0.45
    tbl_19.pitch = (v64 and 0.8) or 1.1
    play_1("woodBreak", tbl_19)
end
u35.claimDebris = function(a1)
    --[[
      name: claimDebris
      line: 1271
    ]]
    local v69
    v69 = nil
    for _, value_31 in a1.debris do
        if not value_31.active then
            v69 = value_31
            break
        end
    end
    local v70 = nil
    if v69 == nil then
        v70 = a1.debris[1]
        if v70 ~= nil then
            a1:parkDebris(v70)
        end
        return v70
    end
    return v69
end
u35.parkDebris = function(a1, a2)
    --[[
      name: parkDebris
      line: 1295
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.token = a2.token + 1
    for _, value_32 in {a2.left, a2.right} do
        value_32.Anchored = true
        value_32.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_32.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_32.CFrame = u1
    end
end
u35.generateAhead = function(a1)
    --[[
      name: generateAhead
      line: 1305
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        playfieldHalfWidth_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    while true do
        local v71, v72 = nil, nil
        if a1.highestGeneratedY >= a1.targetCameraY + (a1.stage.getVisibleHeight() / 2) + DOODLE_JUMP_CONFIG_upv_1.lookaheadAbove then
            break
        end
        local v73 = math.min(a1.chainY / DOODLE_JUMP_CONFIG_upv_1.rampAltitude, 1)
        local v74 = DOODLE_JUMP_CONFIG_upv_1.gapStart + ((DOODLE_JUMP_CONFIG_upv_1.gapMax - DOODLE_JUMP_CONFIG_upv_1.gapStart) * v73) + a1.ladderRandom:NextNumber(-DOODLE_JUMP_CONFIG_upv_1.gapJitter, DOODLE_JUMP_CONFIG_upv_1.gapJitter)
        local chainY_1 = a1.chainY
        a1.chainY = a1.chainY + math.max(v74, 3)
        local v75 = a1.chainY < (DOODLE_JUMP_CONFIG_upv_1.gapStart * DOODLE_JUMP_CONFIG_upv_1.safeStartRungs) + 2
        for n_8 = 0, #a1.chainXs - 1 do
            a1.chainXs[n_8 + 1] = (((((a1.chainXs[n_8 + 1] + a1.ladderRandom:NextNumber(-DOODLE_JUMP_CONFIG_upv_1.chainMaxStep, DOODLE_JUMP_CONFIG_upv_1.chainMaxStep)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
        end
        a1:separateChains()
        table.clear(a1.levelPlacements)
        local tbl_20 = {}
        local v76 = nil
        for n_9 = 0, #a1.chainXs - 1 do
            if v75 or a1.ladderRandom:NextNumber() >= DOODLE_JUMP_CONFIG_upv_1.movingChanceStart + ((DOODLE_JUMP_CONFIG_upv_1.movingChanceMax - DOODLE_JUMP_CONFIG_upv_1.movingChanceStart) * v73) then
                v76 = "static"
            else
                v76 = "moving"
            end
            if not (v75) and v76 == "static" and a1.ladderRandom:NextNumber() < DOODLE_JUMP_CONFIG_upv_1.springChance then
                v76 = "spring"
            end
            a1.levelRungKinds[n_9 + 1] = v76
            v71 = a1:placePlatform(a1.chainXs[n_9 + 1], a1.chainY, v76, a1:rollWidth(v73))
            if v71 ~= nil then
                table.insert(tbl_20, v71)
            end
        end
        a1:clampMoverTracks(tbl_20)
        for _, value_33 in tbl_20 do
            table.insert(a1.levelPlacements, {x = value_33.slideCenter, halfExtent = (value_33.width / 2) + value_33.slideAmplitude, y = value_33.y})
        end
        for n_10 = 0, #a1.chainXs - 1 do
            if v75 or DOODLE_JUMP_CONFIG_upv_1.extraChance <= a1.ladderRandom:NextNumber() then
                continue
            end
            v71 = ((a1.ladderRandom:NextNumber() >= DOODLE_JUMP_CONFIG_upv_1.extraBreakableWeightStart + ((DOODLE_JUMP_CONFIG_upv_1.extraBreakableWeightMax - DOODLE_JUMP_CONFIG_upv_1.extraBreakableWeightStart) * v73)) and "static") or "breakable"
            local v77 = chainY_1 + (v74 * 0.5) + a1.ladderRandom:NextNumber(-1, 1)
            local v78 = ((((a1.chainXs[n_10 + 1] + a1.ladderRandom:NextNumber(-DOODLE_JUMP_CONFIG_upv_1.extraMaxOffset, DOODLE_JUMP_CONFIG_upv_1.extraMaxOffset)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
            local v79 = a1:rollWidth(v73)
            v72 = a1:overlapsLevelPlacement(v78, v79 / 2, v77)
            if not (v72) then
                a1:placePlatform(v78, v77, v71, v79)
                table.insert(a1.levelPlacements, {x = v78, halfExtent = v79 / 2, y = v77})
            end
        end
        a1:generateHazardsForLevel(v73)
        a1.highestGeneratedY = a1.chainY
    end
end
u35.separateChains = function(a1)
    --[[
      name: separateChains
      line: 1371
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    local chainXs_1 = a1.chainXs
    for _ = 0, 2 do
        local v80 = false
        local v80, v81, v82 = v80, v81, v82
        for n_11 = 0, #chainXs_1 - 1 do
            local v83 = n_11 + 1
            local v84 = false
            if v84 then
                v83 = v83 + 1
            else
                v84 = true
            end
            local v85, v86
            if v83 >= #chainXs_1 then
                continue
            end
            v85 = ((((chainXs_1[v83 + 1] - chainXs_1[n_11 + 1]) + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
            v86 = math.abs(v85)
            local v87, v88 = nil, nil
            if v86 < 17 then
                v87 = (17 - v86) / 2
                v88 = v85 < 0 and -1 or 1
                chainXs_1[n_11 + 1] = (((((chainXs_1[n_11 + 1] - (v88 * v87)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
                chainXs_1[v83 + 1] = (((((chainXs_1[v83 + 1] + (v88 * v87)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
                v80 = true
            end
            v81, v82 = nil, nil
        end
        if not (v80) then
            break
        end
    end
end
u35.clampMoverTracks = function(a1, a2)
    --[[
      name: clampMoverTracks
      line: 1406
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    for n_12 = 0, #a2 - 1 do
        local v89 = a2[n_12 + 1]
        local v90 = n_12 + 1
        local v91 = false
        if v91 then
            v90 = v90 + 1
        else
            v91 = true
        end
        local v92, v93, v94
        if v90 >= #a2 then
            continue
        end
        v92 = a2[v90 + 1]
        v93 = math.abs((((((v89.slideCenter - v92.slideCenter) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) - ((v89.width + v92.width) / 2) - 1
        v94 = v89.slideAmplitude + v92.slideAmplitude
        if v94 > v93 then
            local v95 = math.max(v93, 0) / math.max(v94, 0.001)
            v89.slideAmplitude = v89.slideAmplitude * v95
            v92.slideAmplitude = v92.slideAmplitude * v95
        end
    end
end
u35.overlapsLevelPlacement = function(a1, a2, a3, a4)
    --[[
      name: overlapsLevelPlacement
      line: 1435
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        playfieldHalfWidth_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    for _, value_34 in a1.levelPlacements do
        if DOODLE_JUMP_CONFIG_upv_1.platformHeight + 0.5 <= math.abs(value_34.y - a4) or math.abs((((((a2 - value_34.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) >= (value_34.halfExtent + a3) + 1 then
            continue
        end
        return true
    end
    return false
end
u35.generateHazardsForLevel = function(a1, a2)
    --[[
      name: generateHazardsForLevel
      line: 1446
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        playfieldHalfWidth_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
    ]]
    if DOODLE_JUMP_CONFIG_upv_1.trapMinAltitude <= a1.chainY and a1.ladderRandom:NextNumber() < DOODLE_JUMP_CONFIG_upv_1.trapChance then
        local v96 = a1.ladderRandom:NextInteger(0, #a1.chainXs - 1)
        local v97 = ((a1.ladderRandom:NextNumber() >= 0.5) and 1) or -1
        local v98 = ((((a1.chainXs[v96 + 1] + (v97 * a1.ladderRandom:NextNumber(DOODLE_JUMP_CONFIG_upv_1.trapOffsetMin, DOODLE_JUMP_CONFIG_upv_1.trapOffsetMax))) + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
        local v99 = a1.chainY + a1.ladderRandom:NextNumber(-1, 1)
        local v100 = a1:rollWidth(a2)
        if not (a1:overlapsLevelPlacement(v98, v100 / 2, v99)) then
            a1:placePlatform(v98, v99, "trap", v100)
            table.insert(a1.levelPlacements, {x = v98, halfExtent = v100 / 2, y = v99})
        end
    end
    if DOODLE_JUMP_CONFIG_upv_1.monsterMinAltitude <= a1.chainY and DOODLE_JUMP_CONFIG_upv_1.monsterMinSpacing <= a1.chainY - a1.lastMonsterY and a1.ladderRandom:NextNumber() < DOODLE_JUMP_CONFIG_upv_1.monsterChance then
        a1.lastMonsterY = a1.chainY
        local v101 = a1.ladderRandom:NextInteger(0, #a1.chainXs - 1)
        local v102 = ((a1.ladderRandom:NextNumber() >= 0.5) and 1) or -1
        a1:placeMonster((((((a1.chainXs[v101 + 1] + (v102 * a1.ladderRandom:NextNumber(DOODLE_JUMP_CONFIG_upv_1.monsterOffsetMin, DOODLE_JUMP_CONFIG_upv_1.monsterOffsetMax))) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1, a1.chainY + a1.ladderRandom:NextNumber(DOODLE_JUMP_CONFIG_upv_1.monsterHoverMin, DOODLE_JUMP_CONFIG_upv_1.monsterHoverMax), a1.ladderRandom:NextNumber(0, math.tau), (a1.ladderRandom:NextInteger(0, #tbl_upv_1 - 1)))
    end
    if DOODLE_JUMP_CONFIG_upv_1.ufoMinAltitude <= a1.chainY and DOODLE_JUMP_CONFIG_upv_1.ufoMinSpacing <= a1.chainY - a1.lastUfoY and a1.ladderRandom:NextNumber() < DOODLE_JUMP_CONFIG_upv_1.ufoChance then
        a1.lastUfoY = a1.chainY
        for _ = 0, 3 do
            local v103
            v103 = a1.ladderRandom:NextNumber(-playfieldHalfWidth_upv_1, playfieldHalfWidth_upv_1)
            local v99 = false
            for v109, value_35 in a1.chainXs do
                if math.abs((((((v103 - value_35) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) < DOODLE_JUMP_CONFIG_upv_1.ufoChainClearance then
                    v99 = true
                end
            end
            if not (v99) then
                a1:placeUfo(v103, a1.chainY + DOODLE_JUMP_CONFIG_upv_1.ufoHoverAboveRung, (a1.ladderRandom:NextNumber(0, math.tau)))
                break
            end
        end
    end
    if DOODLE_JUMP_CONFIG_upv_1.powerUpMinAltitude > a1.chainY or DOODLE_JUMP_CONFIG_upv_1.powerUpMinSpacing > a1.chainY - a1.lastPowerUpY then
        return
    end
    if a1.ladderRandom:NextNumber() < DOODLE_JUMP_CONFIG_upv_1.powerUpChance then
        a1.lastPowerUpY = a1.chainY
        local v105 = a1.ladderRandom:NextInteger(0, #a1.chainXs - 1)
        local v106
        v106 = v105
        local v108 = nil
        for n_13 = 0, #a1.chainXs - 1 do
            v108 = (v105 + n_13) % #a1.chainXs
            if a1.levelRungKinds[v108 + 1] ~= "moving" then
                v106 = v108
                break
            end
        end
        v108 = a1.ladderRandom:NextNumber()
        a1:placePowerUp(a1.chainXs[v106 + 1], (a1.chainY + (DOODLE_JUMP_CONFIG_upv_1.platformHeight / 2)) + 1.3, ((v108 < 0.45) and "propeller") or (((v108 >= 0.8) and "jetpack") or "shield"), (a1.ladderRandom:NextNumber(0, math.tau)))
    end
end
u35.rollWidth = function(a1, a2)
    --[[
      name: rollWidth
      line: 1516
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    return DOODLE_JUMP_CONFIG_upv_1.platformWidthMin + ((DOODLE_JUMP_CONFIG_upv_1.platformWidthMax - DOODLE_JUMP_CONFIG_upv_1.platformWidthMin) * math.pow(a1.ladderRandom:NextNumber(), 1 + (DOODLE_JUMP_CONFIG_upv_1.platformWidthBiasMax * a2)))
end
u35.placePlatform = function(a1, a2, a3, a4, a5)
    --[[
      name: placePlatform
      line: 1521
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        u11 (copy, index: 2)
        u12 (copy, index: 3)
        u14 (copy, index: 4)
        u10 (copy, index: 5)
        u15 (copy, index: 6)
        u13 (copy, index: 7)
        u1 (copy, index: 8)
    ]]
    local v109
    v109 = nil
    for v110, value_36 in a1.platforms do
        if not value_36.active then
            v109 = value_36
            break
        end
    end
    local v111 = nil
    if v109 ~= nil then
        v111 = v109
        v111.active = true
        v111.kind = a4
        v111.x = a2
        v111.y = a3
        v111.width = a5
        v111.part.Size = Vector3.new(a5, DOODLE_JUMP_CONFIG_upv_1.platformHeight, DOODLE_JUMP_CONFIG_upv_1.platformDepth)
        v111.slideCenter = a2
        v111.slidePhase = a1.ladderRandom:NextNumber(0, math.tau)
        if a4 ~= "moving" then
            v111.slideAmplitude = 0
            v111.slideSpeed = 0
        else
            v111.slideAmplitude = a1.ladderRandom:NextNumber(3, 8)
            v111.slideSpeed = a1.ladderRandom:NextNumber(DOODLE_JUMP_CONFIG_upv_1.movingSlideSpeedMin, DOODLE_JUMP_CONFIG_upv_1.movingSlideSpeedMax) * (math.min(a3 / DOODLE_JUMP_CONFIG_upv_1.rampAltitude, 1) + 1)
        end
        local v112 = ((a4 ~= "spring") and 0) or (a1.ladderRandom:NextNumber(-a5 / 4, a5 / 4))
        v111.springOffsetX = v112
        v112 = v111.part
        local v113
        if a4 == "moving" then
            v113 = u11
        elseif a4 == "breakable" then
            v113 = u12
        elseif a4 ~= "trap" then
            v113 = u10
        else
            v113 = u14
        end
        v112.Color = v113
        if a4 ~= "trap" then
            v112 = true
        else
            v112 = false
        end
        local part_1 = v111.part
        local v110
        if v112 then
            v110 = Enum.SurfaceType.Studs
        else
            v110 = Enum.SurfaceType.Smooth
        end
        part_1.TopSurface = v110
        local part_2 = v111.part
        if v112 then
            v110 = Enum.SurfaceType.Studs
        else
            v110 = Enum.SurfaceType.Smooth
        end
        part_2.BackSurface = v110
        v111.springStretchUntil = 0
        v111.springStretched = false
        v111.pressedUntil = 0
        if a4 == "spring" then
            v111.accent.Shape = Enum.PartType.Cylinder
            v111.accent.Color = u15
            v111.accent.Size = Vector3.new(0.699999988079071, 0.800000011920929, 0.800000011920929)
        elseif a4 ~= "breakable" then
            v111.accent.CFrame = u1
        else
            v111.accent.Shape = Enum.PartType.Block
            v111.accent.Color = u13
            v111.accent.Size = Vector3.new(0.3, DOODLE_JUMP_CONFIG_upv_1.platformHeight + 0.3, DOODLE_JUMP_CONFIG_upv_1.platformDepth + 0.4)
        end
        if a4 ~= "spring" then
            v111.cap.CFrame = u1
        end
        return v111
    end
    v111 = v109
    for _, value_37 in a1.platforms do
        if v111 == nil or value_37.y < v111.y then
            v111 = value_37
        end
    end
    if v111 ~= nil then
        a1:parkPlatform(v111)
        v111.active = true
        v111.kind = a4
        v111.x = a2
        v111.y = a3
        v111.width = a5
        v111.part.Size = Vector3.new(a5, DOODLE_JUMP_CONFIG_upv_1.platformHeight, DOODLE_JUMP_CONFIG_upv_1.platformDepth)
        v111.slideCenter = a2
        v111.slidePhase = a1.ladderRandom:NextNumber(0, math.tau)
        if a4 ~= "moving" then
            v111.slideAmplitude = 0
            v111.slideSpeed = 0
        else
            v111.slideAmplitude = a1.ladderRandom:NextNumber(3, 8)
            v111.slideSpeed = a1.ladderRandom:NextNumber(DOODLE_JUMP_CONFIG_upv_1.movingSlideSpeedMin, DOODLE_JUMP_CONFIG_upv_1.movingSlideSpeedMax) * (math.min(a3 / DOODLE_JUMP_CONFIG_upv_1.rampAltitude, 1) + 1)
        end
        local v112 = ((a4 ~= "spring") and 0) or (a1.ladderRandom:NextNumber(-a5 / 4, a5 / 4))
        v111.springOffsetX = v112
        v112 = v111.part
        local v113
        if a4 == "moving" then
            v113 = u11
        elseif a4 == "breakable" then
            v113 = u12
        elseif a4 ~= "trap" then
            v113 = u10
        else
            v113 = u14
        end
        v112.Color = v113
        if a4 ~= "trap" then
            v112 = true
        else
            v112 = false
        end
        local part_1 = v111.part
        local v110
        if v112 then
            v110 = Enum.SurfaceType.Studs
        else
            v110 = Enum.SurfaceType.Smooth
        end
        part_1.TopSurface = v110
        local part_2 = v111.part
        if v112 then
            v110 = Enum.SurfaceType.Studs
        else
            v110 = Enum.SurfaceType.Smooth
        end
        part_2.BackSurface = v110
        v111.springStretchUntil = 0
        v111.springStretched = false
        v111.pressedUntil = 0
        if a4 == "spring" then
            v111.accent.Shape = Enum.PartType.Cylinder
            v111.accent.Color = u15
            v111.accent.Size = Vector3.new(0.699999988079071, 0.800000011920929, 0.800000011920929)
        elseif a4 ~= "breakable" then
            v111.accent.CFrame = u1
        else
            v111.accent.Shape = Enum.PartType.Block
            v111.accent.Color = u13
            v111.accent.Size = Vector3.new(0.3, DOODLE_JUMP_CONFIG_upv_1.platformHeight + 0.3, DOODLE_JUMP_CONFIG_upv_1.platformDepth + 0.4)
        end
        if a4 ~= "spring" then
            v111.cap.CFrame = u1
        end
        return v111
    end
    return nil
end
u35.recycleBelow = function(a1)
    --[[
      name: recycleBelow
      line: 1590
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v114 = a1.targetCameraY - (a1.stage.getVisibleHeight() / 2) - DOODLE_JUMP_CONFIG_upv_1.despawnBelow
    for _, value_38 in a1.platforms do
        if not (value_38.active) then
            continue
        end
        if value_38.y < v114 then
            a1:parkPlatform(value_38)
        end
    end
    for _, value_39 in a1.monsters do
        if not (value_39.active) then
            continue
        end
        if value_39.y < v114 then
            a1:parkMonster(value_39)
        end
    end
    for _, value_40 in a1.ufos do
        if not (value_40.active) then
            continue
        end
        if value_40.y < v114 then
            a1:parkUfo(value_40)
        end
    end
    for _, value_41 in a1.powerUps do
        if not (value_41.active) then
            continue
        end
        if value_41.y < v114 then
            a1:parkPowerUp(value_41)
        end
    end
end
u35.parkPlatform = function(a1, a2)
    --[[
      name: parkPlatform
      line: 1613
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.CFrame = u1
    a2.accent.CFrame = u1
    a2.cap.CFrame = u1
end
u35.reclaimAllPlatforms = function(a1)
    --[[
      name: reclaimAllPlatforms
      line: 1619
    ]]
    for _, value_42 in a1.platforms do
        a1:parkPlatform(value_42)
    end
    for _, value_43 in a1.debris do
        a1:parkDebris(value_43)
    end
end
u35.reclaimAllActors = function(a1)
    --[[
      name: reclaimAllActors
      line: 1627
    ]]
    for _, value_44 in a1.monsters do
        a1:parkMonster(value_44)
    end
    for _, value_45 in a1.ufos do
        a1:parkUfo(value_45)
    end
    for _, value_46 in a1.pellets do
        a1:parkPellet(value_46)
    end
    for _, value_47 in a1.powerUps do
        a1:parkPowerUp(value_47)
    end
end
u35.buildDebrisPool = function(a1, a2)
    --[[
      name: buildDebrisPool
      line: 1641
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    for _ = 0, 4 do
        local v115 = makeStagePart_upv_1(a2)
        v115.CFrame = u1
        local v116 = makeStagePart_upv_1(a2)
        v116.CFrame = u1
        table.insert(a1.debris, {left = v115, right = v116})
    end
end
u35.buildMonsterPool = function(a1, a2)
    --[[
      name: buildMonsterPool
      line: 1657
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_14 = 0, DOODLE_JUMP_CONFIG_upv_1.monsterPoolSize - 1 do
        table.insert(a1.monsters, (a1:buildMonster(a2, n_14 % 3)))
    end
end
u35.buildMonster = function(a1, a2, a3)
    --[[
      name: buildMonster
      line: 1664
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        u22 (copy, index: 4)
        u23 (copy, index: 5)
        u24 (copy, index: 6)
        tbl_upv_2 (copy, index: 7)
    ]]
    local tbl_upv_21 = {}
    local tbl_22 = {}
    local tbl_23 = {}
    local tbl_24 = {}
    local function v117(a4, a5, a6, a7)
        --[[
          line: 1689
          upvalues:
            u22 (copy, index: 1)
            makeSmoothPart_upv_1 (copy, index: 2)
            a2 (copy, index: 3)
            u1 (copy, index: 4)
            tbl_upv_21 (copy, index: 5)
            u23 (copy, index: 6)
        ]]
        local v118 = nil
        local v119 = nil
        local v120 = nil
        local v121 = nil
        local v122 = nil
        local v123 = nil
        for _, value_48 in {-1, 1} do
            v118 = Vector3.new(a6, a6 * 1.15, 0.18)
            v119 = CFrame.new(value_48 * a4, a5, a7 + 0.1)
            v120 = makeSmoothPart_upv_1(a2)
            v120.Size = v118
            v120.Color = u22
            v120.CFrame = u1
            table.insert(tbl_upv_21, {part = v120, offset = v119})
            v121 = Vector3.new(a6 * 0.42, a6 * 0.46, 0.12)
            v122 = CFrame.new((value_48 * a4) * 1.05, a5 - 0.04, a7 + 0.22)
            v123 = makeSmoothPart_upv_1(a2)
            v123.Size = v121
            v123.Color = u23
            v123.CFrame = u1
            table.insert(tbl_upv_21, {part = v123, offset = v122})
        end
    end
    if a3 == 0 then
        local v124 = CFrame.new(0, 0, 0)
        local v125 = makeSmoothPart_upv_1(a2)
        v125.Size = Vector3.new(3.4000000953674316, 2, 1.7999999523162842)
        v125.Color = tbl_upv_1[a3 + 1]
        v125.CFrame = u1
        table.insert(tbl_upv_21, {part = v125, offset = v124})
        v125.TopSurface = Enum.SurfaceType.Studs
        table.insert(tbl_23, v125)
        v117(0.68, 0.5, 0.85, 0.9)
        local v126 = CFrame.new(0, -0.4, 1)
        local v127 = makeSmoothPart_upv_1(a2)
        v127.Size = Vector3.new(1, 0.20000000298023224, 0.11999999731779099)
        v127.Color = u24
        v127.CFrame = u1
        table.insert(tbl_upv_21, {part = v127, offset = v126})
        local v128 = CFrame.new(-0.9, 1.3, 0)
        local v129 = makeSmoothPart_upv_1(a2)
        v129.Size = Vector3.new(0.5, 0.699999988079071, 0.5)
        v129.Color = tbl_upv_2[1]
        v129.CFrame = u1
        table.insert(tbl_upv_21, {part = v129, offset = v128})
        table.insert(tbl_24, v129)
        local v130 = CFrame.new(0.9, 1.22, 0)
        local v131 = makeSmoothPart_upv_1(a2)
        v131.Size = Vector3.new(0.5, 0.550000011920929, 0.5)
        v131.Color = tbl_upv_2[1]
        v131.CFrame = u1
        table.insert(tbl_upv_21, {part = v131, offset = v130})
        table.insert(tbl_24, v131)
    elseif a3 ~= 1 then
        local v132 = CFrame.new(0, 0, 0)
        local v133 = makeSmoothPart_upv_1(a2)
        v133.Size = Vector3.new(2.5999999046325684, 2.299999952316284, 1.7999999523162842)
        v133.Color = tbl_upv_1[a3 + 1]
        v133.CFrame = u1
        table.insert(tbl_upv_21, {part = v133, offset = v132})
        v133.TopSurface = Enum.SurfaceType.Studs
        table.insert(tbl_23, v133)
        v117(0.5, 0.55, 0.68, 0.9)
        local v134 = CFrame.new(0, -0.25, 1)
        local v135 = makeSmoothPart_upv_1(a2)
        v135.Size = Vector3.new(0.550000011920929, 0.1599999964237213, 0.11999999731779099)
        v135.Color = u24
        v135.CFrame = u1
        table.insert(tbl_upv_21, {part = v135, offset = v134})
        local v136 = nil
        for _, value_49 in {-1, 1} do
            v136 = makeSmoothPart_upv_1(a2)
            v136.Size = Vector3.new(1.25, 0.6000000238418579, 0.2800000011920929)
            v136.Color = tbl_upv_2[3]
            v136.CFrame = u1
            table.insert(tbl_22, {part = v136, hinge = CFrame.new(value_49 * 1.28, 0.35, 0), rest = CFrame.new(value_49 * 0.6, 0.1, 0), side = value_49})
            table.insert(tbl_24, v136)
        end
    else
        local v137 = CFrame.new(0, 0, 0)
        local v138 = makeSmoothPart_upv_1(a2)
        v138.Size = Vector3.new(2.799999952316284, 2.0999999046325684, 1.899999976158142)
        v138.Color = tbl_upv_1[a3 + 1]
        v138.CFrame = u1
        table.insert(tbl_upv_21, {part = v138, offset = v137})
        v138.TopSurface = Enum.SurfaceType.Studs
        table.insert(tbl_23, v138)
        local v139 = CFrame.new(0, 0.3, 1.05)
        local v140 = makeSmoothPart_upv_1(a2)
        v140.Size = Vector3.new(1.100000023841858, 1.2000000476837158, 0.18000000715255737)
        v140.Color = u22
        v140.CFrame = u1
        table.insert(tbl_upv_21, {part = v140, offset = v139})
        local v141 = CFrame.new(0, 0.26, 1.18)
        local v142 = makeSmoothPart_upv_1(a2)
        v142.Size = Vector3.new(0.4399999976158142, 0.5, 0.11999999731779099)
        v142.Color = u23
        v142.CFrame = u1
        table.insert(tbl_upv_21, {part = v142, offset = v141})
        local v143 = CFrame.new(0, -0.55, 1.02)
        local v144 = makeSmoothPart_upv_1(a2)
        v144.Size = Vector3.new(0.699999988079071, 0.18000000715255737, 0.11999999731779099)
        v144.Color = u24
        v144.CFrame = u1
        table.insert(tbl_upv_21, {part = v144, offset = v143})
        local v145 = nil
        local v146 = nil
        local v147 = nil
        local v148 = nil
        for _, value_50 in {{-0.85, 20}, {0, 0}, {0.85, -20}} do
            v145 = value_50[1]
            v146 = value_50[2]
            v147 = CFrame.new(v145, ((v145 ~= 0) and 1.2) or 1.35, 0) * CFrame.Angles(0, 0, math.rad(v146))
            v148 = makeSmoothPart_upv_1(a2)
            v148.Size = Vector3.new(0.30000001192092896, 0.8500000238418579, 0.30000001192092896)
            v148.Color = tbl_upv_2[2]
            v148.CFrame = u1
            table.insert(tbl_upv_21, {part = v148, offset = v147})
            table.insert(tbl_24, v148)
        end
    end
    local tbl_25 = {}
    tbl_25.pieces = tbl_upv_21
    tbl_25.wings = tbl_22
    tbl_25.tintMain = tbl_23
    tbl_25.tintDark = tbl_24
    return tbl_25
end
u35.buildUfoPool = function(a1, a2)
    --[[
      name: buildUfoPool
      line: 1750
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u26 (copy, index: 3)
        u1 (copy, index: 4)
        u27 (copy, index: 5)
        u28 (copy, index: 6)
        tbl_upv_3 (copy, index: 7)
        u29 (copy, index: 8)
    ]]
    for _ = 0, DOODLE_JUMP_CONFIG_upv_1.ufoPoolSize - 1 do
        local v149 = makeSmoothPart_upv_1(a2)
        v149.Shape = Enum.PartType.Cylinder
        v149.Size = Vector3.new(DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight * 2, DOODLE_JUMP_CONFIG_upv_1.ufoHalfWidth * 2, DOODLE_JUMP_CONFIG_upv_1.ufoHalfWidth * 2)
        v149.Color = u26
        v149.CFrame = u1
        local v150 = makeSmoothPart_upv_1(a2)
        v150.Shape = Enum.PartType.Ball
        v150.Size = Vector3.new(2.200000047683716, 2.200000047683716, 2.200000047683716)
        v150.Color = u27
        v150.Transparency = 0.25
        v150.CFrame = u1
        local v151 = makeSmoothPart_upv_1(a2)
        v151.Shape = Enum.PartType.Cylinder
        v151.Material = Enum.Material.Neon
        v151.Size = Vector3.new(DOODLE_JUMP_CONFIG_upv_1.ufoBeamDepth, DOODLE_JUMP_CONFIG_upv_1.ufoBeamRadius * 2, DOODLE_JUMP_CONFIG_upv_1.ufoBeamRadius * 2)
        v151.Color = u28
        v151.Transparency = 0.7
        v151.CFrame = u1
        local tbl_26 = {}
        local v152 = nil
        for v154, v153 in tbl_upv_3 do
            v152 = makeSmoothPart_upv_1(a2)
            v152.Shape = Enum.PartType.Ball
            v152.Material = Enum.Material.Neon
            v152.Size = Vector3.new(0.41999998688697815, 0.41999998688697815, 0.41999998688697815)
            v152.Color = u29
            v152.CFrame = u1
            table.insert(tbl_26, v152)
        end
        table.insert(a1.ufos, {disc = v149, dome = v150, beam = v151, lights = tbl_26, hitPoints = DOODLE_JUMP_CONFIG_upv_1.ufoHitPoints})
    end
end
u35.buildPelletPool = function(a1, a2)
    --[[
      name: buildPelletPool
      line: 1796
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u25 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    for _ = 0, DOODLE_JUMP_CONFIG_upv_1.pelletPoolSize - 1 do
        local v154 = makeSmoothPart_upv_1(a2)
        v154.Shape = Enum.PartType.Ball
        v154.Material = Enum.Material.Neon
        v154.Size = Vector3.new(DOODLE_JUMP_CONFIG_upv_1.pelletRadius * 2, DOODLE_JUMP_CONFIG_upv_1.pelletRadius * 2, DOODLE_JUMP_CONFIG_upv_1.pelletRadius * 2)
        v154.Color = u25
        v154.CFrame = u1
        table.insert(a1.pellets, {part = v154})
    end
end
u35.buildPowerUpPool = function(a1, a2)
    --[[
      name: buildPowerUpPool
      line: 1817
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    for _ = 0, DOODLE_JUMP_CONFIG_upv_1.powerUpPoolSize - 1 do
        local v155 = makeSmoothPart_upv_1(a2)
        v155.CFrame = u1
        local v156 = makeSmoothPart_upv_1(a2)
        v156.CFrame = u1
        table.insert(a1.powerUps, {main = v155, accent = v156})
    end
end
u35.buildWornGear = function(a1, a2)
    --[[
      name: buildWornGear
      line: 1836
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u30 (copy, index: 2)
        u1 (copy, index: 3)
        u31 (copy, index: 4)
        u32 (copy, index: 5)
        u33 (copy, index: 6)
        u34 (copy, index: 7)
    ]]
    a1.wornPropellerHub = makeSmoothPart_upv_1(a2)
    a1.wornPropellerHub.Shape = Enum.PartType.Ball
    a1.wornPropellerHub.Size = Vector3.new(0.699999988079071, 0.699999988079071, 0.699999988079071)
    a1.wornPropellerHub.Color = u30
    a1.wornPropellerHub.CFrame = u1
    a1.wornPropellerBlade = makeSmoothPart_upv_1(a2)
    a1.wornPropellerBlade.Size = Vector3.new(2.5999999046325684, 0.14000000059604645, 0.44999998807907104)
    a1.wornPropellerBlade.Color = u31
    a1.wornPropellerBlade.CFrame = u1
    a1.wornJetpack = makeSmoothPart_upv_1(a2)
    a1.wornJetpack.Size = Vector3.new(1.2999999523162842, 1.899999976158142, 0.800000011920929)
    a1.wornJetpack.Color = u32
    a1.wornJetpack.CFrame = u1
    a1.wornFlame = makeSmoothPart_upv_1(a2)
    a1.wornFlame.Shape = Enum.PartType.Ball
    a1.wornFlame.Material = Enum.Material.Neon
    a1.wornFlame.Size = Vector3.new(0.800000011920929, 1.5, 0.800000011920929)
    a1.wornFlame.Color = u33
    a1.wornFlame.CFrame = u1
    a1.wornShield = makeSmoothPart_upv_1(a2)
    a1.wornShield.Shape = Enum.PartType.Ball
    a1.wornShield.Size = Vector3.new(4.599999904632568, 4.599999904632568, 4.599999904632568)
    a1.wornShield.Color = u34
    a1.wornShield.Transparency = 0.68
    a1.wornShield.CFrame = u1
end
u35.makeLoopSound = function(a1, a2, a3, a4)
    --[[
      name: makeLoopSound
      line: 1863
      upvalues:
        createGameLoopSound_upv_1 (copy, index: 1)
    ]]
    return createGameLoopSound_upv_1({soundId = a3, parent = a2, volume = a4})
end
u35.placeMonster = function(a1, a2, a3, a4, a5)
    --[[
      name: placeMonster
      line: 1871
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v157
    v157 = nil
    local v158 = #a1.monsters
    local v159 = 0
    local v160 = false
    local v161 = nil
    if v160 then
        v159 = v159 + 1
    else
        v160 = true
    end
    if v159 < v158 then
        v161 = a1.monsters[((a1.monsterCursor + v159) % v158) + 1]
        if v161.active then
            if v160 then
                v159 = v159 + 1
            else
                v160 = true
            end
            --[[ goto label_3 ]]--
        else
            a1.monsterCursor = ((a1.monsterCursor + v159) + 1) % v158
            v157 = v161
        end
    end
    if v157 ~= nil then
        v157.active = true
        v157.x = a2
        v157.y = a3
        v157.bobPhase = a4
        v159 = a5 % #tbl_upv_1
        for _, value_51 in v157.tintMain do
            value_51.Color = tbl_upv_1[v159 + 1]
        end
        for _, value_52 in v157.tintDark do
            value_52.Color = tbl_upv_2[v159 + 1]
        end
        return
    end
    return nil
end
u35.parkMonster = function(a1, a2)
    --[[
      name: parkMonster
      line: 1911
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    local _ = nil
    local v1 = nil
    for v2, value_53 in a2.pieces do
        value_53.part.CFrame = u1
    end
    for v3, value_54 in a2.wings do
        value_54.part.CFrame = u1
    end
end
u35.placeUfo = function(a1, a2, a3, a4)
    --[[
      name: placeUfo
      line: 1920
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v162
    v162 = nil
    for _, value_55 in a1.ufos do
        if not value_55.active then
            v162 = value_55
            break
        end
    end
    if v162 ~= nil then
        v162.active = true
        v162.swayCenter = a2
        v162.x = a2
        v162.y = a3
        v162.swayPhase = a4
        v162.hitPoints = DOODLE_JUMP_CONFIG_upv_1.ufoHitPoints
    else
        return nil
    end
end
u35.parkUfo = function(a1, a2)
    --[[
      name: parkUfo
      line: 1945
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.disc.CFrame = u1
    a2.dome.CFrame = u1
    a2.beam.CFrame = u1
    for _, value_56 in a2.lights do
        value_56.CFrame = u1
    end
end
u35.updateMonsters = function(a1, a2)
    --[[
      name: updateMonsters
      line: 1954
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 3)
        u19 (copy, index: 4)
    ]]
    local v163 = nil
    for _, value_57 in a1.monsters do
        if not (value_57.active) or DOODLE_JUMP_CONFIG_upv_1.monsterHalfWidth + DOODLE_JUMP_CONFIG_upv_1.playerHalfWidth <= math.abs((((((((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1 - value_57.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) then
            continue
        end
        v163 = value_57.y + DOODLE_JUMP_CONFIG_upv_1.monsterHalfHeight
        if a1.velocityY < 0 and v163 <= a2 and a1.playerY < v163 then
            a1:killMonster(value_57, "stomp")
            a1.playerY = v163
            a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity
            a1:puffImpact(a1.playerX, v163, u19, 10)
            continue
        end
        if DOODLE_JUMP_CONFIG_upv_1.monsterHalfHeight + 1.2 <= math.abs(a1.playerY + 1.2 - value_57.y) then
            continue
        end
        if a1:isProtected() then
            a1:killMonster(value_57, "plow")
            continue
        end
        a1:die("tumble")
        return nil
    end
end
u35.updateUfos = function(a1, a2, a3)
    --[[
      name: updateUfos
      line: 1985
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 3)
        u19 (copy, index: 4)
    ]]
    local v164 = nil
    local v165 = nil
    local v166 = nil
    for _, value_58 in a1.ufos do
        if not (value_58.active) then
            continue
        end
        value_58.swayPhase = value_58.swayPhase + (DOODLE_JUMP_CONFIG_upv_1.ufoSwaySpeed * a2)
        value_58.x = (((((value_58.swayCenter + (math.sin(value_58.swayPhase) * DOODLE_JUMP_CONFIG_upv_1.ufoSwayAmplitude)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1
        v164 = ((((((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1 - value_58.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
        v165 = value_58.y + DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight
        v166 = math.abs(v164) < DOODLE_JUMP_CONFIG_upv_1.ufoHalfWidth + DOODLE_JUMP_CONFIG_upv_1.playerHalfWidth
        if a1.velocityY < 0 and v166 then
            if v165 > a3 then
                local v167 = v166 and (math.abs(a1.playerY + 1.2 - value_58.y) < DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight + 1.2)
                if a1:isProtected() then
                    if v167 then
                        value_58.hitPoints = 1
                        a1:damageUfo(value_58)
                    end
                else
                    local v168 = value_58.y - DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight
                    if math.abs(v164) >= DOODLE_JUMP_CONFIG_upv_1.ufoBeamRadius or a1.playerY >= v168 or v168 - DOODLE_JUMP_CONFIG_upv_1.ufoBeamDepth >= a1.playerY + 2.4 then
                        if not (v167) then
                            continue
                        end
                        a1:die("tumble")
                    else
                        a1:abduct(value_58)
                    end
                    return nil
                end
            else
                if a1.playerY < v165 then
                    a1.playerY = v165
                    a1.velocityY = DOODLE_JUMP_CONFIG_upv_1.bounceVelocity
                    a1:puffImpact(a1.playerX, v165, u19, 10)
                    value_58.hitPoints = 1
                    a1:damageUfo(value_58)
                    continue
                end
                local v167 = v166 and (math.abs(a1.playerY + 1.2 - value_58.y) < DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight + 1.2)
                if a1:isProtected() then
                    if v167 then
                        value_58.hitPoints = 1
                        a1:damageUfo(value_58)
                    end
                else
                    local v168 = value_58.y - DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight
                    if math.abs(v164) >= DOODLE_JUMP_CONFIG_upv_1.ufoBeamRadius or a1.playerY >= v168 or v168 - DOODLE_JUMP_CONFIG_upv_1.ufoBeamDepth >= a1.playerY + 2.4 then
                        if not (v167) then
                            continue
                        end
                        a1:die("tumble")
                    else
                        a1:abduct(value_58)
                    end
                end
            end
        else
            local v167 = v166 and (math.abs(a1.playerY + 1.2 - value_58.y) < DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight + 1.2)
            if a1:isProtected() then
                if v167 then
                    value_58.hitPoints = 1
                    a1:damageUfo(value_58)
                end
            else
                local v168 = value_58.y - DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight
                if math.abs(v164) >= DOODLE_JUMP_CONFIG_upv_1.ufoBeamRadius or a1.playerY >= v168 or v168 - DOODLE_JUMP_CONFIG_upv_1.ufoBeamDepth >= a1.playerY + 2.4 then
                    if not (v167) then
                        continue
                    end
                    a1:die("tumble")
                else
                    a1:abduct(value_58)
                end
                return nil
            end
        end
    end
end
u35.killMonster = function(a1, a2, a3)
    --[[
      name: killMonster
      line: 2026
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u21 (copy, index: 3)
    ]]
    local v169 = a1.stage.origin + Vector3.new(a1.playerX + ((((((a2.x - (((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1), a2.y + 1.5, 2)
    a1:parkMonster(a2)
    if a3 ~= "stomp" then
        local play_2 = a1.context.audio.play
        local tbl_27 = {}
        tbl_27.pitch = ((a3 ~= "shot") and 0.9) or 1.15
        play_2("pop", tbl_27)
    else
        a1.context.audio.play("pop", {})
        a1.popups:show(v169, "BOP!", u21, 0.8)
        return nil
    end
end
u35.damageUfo = function(a1, a2)
    --[[
      name: damageUfo
      line: 2045
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u20 (copy, index: 3)
    ]]
    a2.hitPoints = a2.hitPoints - 1
    if a2.hitPoints <= 0 then
        local v170 = a1.stage.origin + Vector3.new(a1.playerX + ((((((a2.x - (((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1), a2.y + 1, 2)
        a1:parkUfo(a2)
        a1.context.audio.play("explosion", {})
        a1.popups:show(v170, "BOOM!", u20, 1)
        a1.stage.shake(0.5)
    else
        a1.context.audio.play("thud", {})
        return nil
    end
end
u35.abduct = function(a1, a2)
    --[[
      name: abduct
      line: 2065
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    a1.abductTargetX = a1.playerX + ((((((a2.x - (((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1)
    a1.abductTargetY = a2.y - 1
    a1:die("abduct")
end
u35.firePellet = function(a1, a2)
    --[[
      name: firePellet
      line: 2070
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        local v171 = nil
        if a1:isRunning() then
            v171 = os.clock()
            if v171 - a1.lastFireAt >= DOODLE_JUMP_CONFIG_upv_1.fireCooldownSeconds then
                local v172
                v172 = nil
                for _, value_59 in a1.pellets do
                    if not value_59.active then
                        v172 = value_59
                        break
                    end
                end
                if v172 ~= nil then
                    a1.lastFireAt = v171
                    local v173 = 0
                    local v174 = DOODLE_JUMP_CONFIG_upv_1.pelletSpeed
                    if a2 ~= nil then
                        local pelletAimRise_1 = DOODLE_JUMP_CONFIG_upv_1.pelletAimRise
                        local v175 = pelletAimRise_1 * math.tan(math.rad(DOODLE_JUMP_CONFIG_upv_1.pelletMaxAimDegrees))
                        local v176 = math.clamp(a2 - a1.playerX, -v175, v175)
                        local v177 = math.sqrt((v176 * v176) + (pelletAimRise_1 * pelletAimRise_1))
                        v173, v174 = v176 / v177 * DOODLE_JUMP_CONFIG_upv_1.pelletSpeed, pelletAimRise_1 / v177 * DOODLE_JUMP_CONFIG_upv_1.pelletSpeed
                    end
                    v172.active = true
                    v172.x = a1.playerX
                    v172.y = a1.playerY + DOODLE_JUMP_CONFIG_upv_1.pelletNoseHeight
                    v172.velocityX = v173
                    v172.velocityY = v174
                    v172.lifeRemaining = DOODLE_JUMP_CONFIG_upv_1.pelletLifeSeconds
                    a1.context.audio.play("doodleShoot", {})
                else
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
u35.updatePellets = function(a1, a2)
    --[[
      name: updatePellets
      line: 2118
    ]]
    local v178 = a1.targetCameraY + (a1.stage.getVisibleHeight() / 2) + 6
    for _, value_60 in a1.pellets do
        if not (value_60.active) then
            continue
        end
        value_60.lifeRemaining = value_60.lifeRemaining - a2
        value_60.x = value_60.x + (value_60.velocityX * a2)
        value_60.y = value_60.y + (value_60.velocityY * a2)
        if value_60.lifeRemaining <= 0 or v178 < value_60.y or a1:hitEnemyWithPellet(value_60) then
            a1:parkPellet(value_60)
        end
    end
end
u35.hitEnemyWithPellet = function(a1, a2)
    --[[
      name: hitEnemyWithPellet
      line: 2136
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v179 = (((a2.x + playfieldHalfWidth_upv_1) % u4) + u4) % u4 - playfieldHalfWidth_upv_1
    for _, value_61 in a1.monsters do
        if not (value_61.active) or DOODLE_JUMP_CONFIG_upv_1.monsterHalfWidth + DOODLE_JUMP_CONFIG_upv_1.pelletRadius <= math.abs((((((v179 - value_61.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) or DOODLE_JUMP_CONFIG_upv_1.monsterHalfHeight + DOODLE_JUMP_CONFIG_upv_1.pelletRadius <= math.abs(a2.y - value_61.y) then
            continue
        end
        a1:killMonster(value_61, "shot")
        return true
    end
    for _, value_62 in a1.ufos do
        if not (value_62.active) or DOODLE_JUMP_CONFIG_upv_1.ufoHalfWidth + DOODLE_JUMP_CONFIG_upv_1.pelletRadius <= math.abs((((((v179 - value_62.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) or (DOODLE_JUMP_CONFIG_upv_1.ufoBodyHalfHeight + 1) + DOODLE_JUMP_CONFIG_upv_1.pelletRadius <= math.abs(a2.y - value_62.y) then
            continue
        end
        a1:damageUfo(value_62)
        return true
    end
    return false
end
u35.parkPellet = function(a1, a2)
    --[[
      name: parkPellet
      line: 2167
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.CFrame = u1
end
u35.placePowerUp = function(a1, a2, a3, a4, a5)
    --[[
      name: placePowerUp
      line: 2171
      upvalues:
        u1 (copy, index: 1)
        u30 (copy, index: 2)
        u31 (copy, index: 3)
        u32 (copy, index: 4)
        u33 (copy, index: 5)
        u34 (copy, index: 6)
    ]]
    local v180
    v180 = nil
    for _, value_63 in a1.powerUps do
        if not value_63.active then
            v180 = value_63
            break
        end
    end
    if v180 ~= nil then
        v180.active = true
        v180.kind = a4
        v180.x = a2
        v180.y = a3
        v180.bobPhase = a5
        local main_1 = v180.main
        local accent_1 = v180.accent
        accent_1.CFrame = u1
        if a4 == "propeller" then
            main_1.Shape = Enum.PartType.Ball
            main_1.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
            main_1.Color = u30
            main_1.Transparency = 0
            accent_1.Shape = Enum.PartType.Block
            accent_1.Size = Vector3.new(2.4000000953674316, 0.14000000059604645, 0.41999998688697815)
            accent_1.Color = u31
        elseif a4 ~= "jetpack" then
            main_1.Shape = Enum.PartType.Ball
            main_1.Size = Vector3.new(1.5, 1.5, 1.5)
            main_1.Color = u34
            main_1.Transparency = 0.3
        else
            main_1.Shape = Enum.PartType.Block
            main_1.Size = Vector3.new(1.100000023841858, 1.7000000476837158, 0.699999988079071)
            main_1.Color = u32
            main_1.Transparency = 0
            accent_1.Shape = Enum.PartType.Block
            accent_1.Size = Vector3.new(1.2000000476837158, 0.3199999928474426, 0.800000011920929)
            accent_1.Color = u33
        end
    else
        return nil
    end
end
u35.parkPowerUp = function(a1, a2)
    --[[
      name: parkPowerUp
      line: 2220
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.main.CFrame = u1
    a2.accent.CFrame = u1
end
u35.updatePowerUpPickups = function(a1)
    --[[
      name: updatePowerUpPickups
      line: 2225
      upvalues:
        playfieldHalfWidth_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 3)
    ]]
    if a1.flightRemaining <= 0 and a1.shieldRemaining <= 0 then
        for _, value_64 in a1.powerUps do
            if not (value_64.active) or DOODLE_JUMP_CONFIG_upv_1.powerUpPickupRadius <= math.abs((((((((((a1.playerX + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1 - value_64.x) + playfieldHalfWidth_upv_1) % u4) + u4) % u4) - playfieldHalfWidth_upv_1) or DOODLE_JUMP_CONFIG_upv_1.powerUpPickupRadius + 1 <= math.abs(a1.playerY + 1.2 - value_64.y) then
                continue
            end
            a1:collectPowerUp(value_64)
            return
        end
    else
        return nil
    end
end
u35.collectPowerUp = function(a1, a2)
    --[[
      name: collectPowerUp
      line: 2245
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        u34 (copy, index: 2)
        u20 (copy, index: 3)
    ]]
    local kind_1 = a2.kind
    a1:parkPowerUp(a2)
    if kind_1 ~= "shield" then
        a1.flightKind = kind_1
        local v181
        if kind_1 ~= "jetpack" then
            v181 = DOODLE_JUMP_CONFIG_upv_1.propellerDurationSeconds
        else
            v181 = DOODLE_JUMP_CONFIG_upv_1.jetpackDurationSeconds
        end
        a1.flightRemaining = v181
        a1:startFlightSound(kind_1)
        local play_3 = a1.context.audio.play
        local tbl_28 = {}
        tbl_28.pitch = ((kind_1 ~= "jetpack") and 1.2) or 0.9
        play_3("perfect", tbl_28)
        local popups_1 = a1.popups
        local v182 = a1:playerPosition() + Vector3.new(0, 4, 2)
        popups_1:show(v182, ((kind_1 ~= "jetpack") and "PROPELLER!") or "JETPACK!", u20, 0.9)
    else
        a1.shieldRemaining = DOODLE_JUMP_CONFIG_upv_1.shieldDurationSeconds
        a1.context.audio.play("perfect", {})
        a1.popups:show(a1:playerPosition() + Vector3.new(0, 4, 2), "SHIELD!", u34, 0.9)
        return nil
    end
end
u35.endFlight = function(a1)
    --[[
      name: endFlight
      line: 2272
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    a1.flightRemaining = 0
    a1.flightKind = nil
    a1.invulnRemaining = math.max(a1.invulnRemaining, DOODLE_JUMP_CONFIG_upv_1.flightEndInvulnSeconds)
    a1.wornPropellerHub.CFrame = u1
    a1.wornPropellerBlade.CFrame = u1
    a1.wornJetpack.CFrame = u1
    a1.wornFlame.CFrame = u1
    a1:stopFlightSounds()
    a1.context.audio.play("pop", {})
end
u35.startFlightSound = function(a1, a2)
    --[[
      name: startFlightSound
      line: 2286
    ]]
    a1:stopFlightSounds()
    local v183
    if a2 ~= "jetpack" then
        v183 = a1.propellerSound
    else
        v183 = a1.jetpackSound
    end
    v183.TimePosition = 0
    v183:Play()
end
u35.stopFlightSounds = function(a1)
    --[[
      name: stopFlightSounds
      line: 2292
    ]]
    a1.propellerSound:Stop()
    a1.jetpackSound:Stop()
end
u35.parkWornGear = function(a1)
    --[[
      name: parkWornGear
      line: 2296
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.wornPropellerHub.CFrame = u1
    a1.wornPropellerBlade.CFrame = u1
    a1.wornJetpack.CFrame = u1
    a1.wornFlame.CFrame = u1
    a1.wornShield.CFrame = u1
end
u35.renderWornGear = function(a1, a2)
    --[[
      name: renderWornGear
      line: 2303
    ]]
    if a1.dead then
        return nil
    else
        local v184 = a1:playerPosition()
        if a1.flightRemaining > 0 then
            if a1.flightKind ~= "propeller" then
                a1.wornJetpack.CFrame = CFrame.new(v184 + Vector3.new(0, a1:pivotOffset(), -1.5))
                a1.wornFlame.CFrame = CFrame.new(v184 + Vector3.new(0, a1:pivotOffset() - 1.9, -1.5))
                a1.wornFlame.Transparency = (math.abs(math.sin(a2 * 14)) * 0.2) + 0.1
            else
                local v185 = a1:pivotOffset() * 2 + 0.7
                a1.wornPropellerHub.CFrame = CFrame.new(v184 + Vector3.new(0, v185, 0))
                a1.wornPropellerBlade.CFrame = CFrame.new(v184 + Vector3.new(0, v185 + 0.22, 0)) * CFrame.Angles(0, a2 * 18, 0)
            end
        end
        if a1.shieldRemaining > 0 then
            a1.wornShield.CFrame = CFrame.new(v184 + Vector3.new(0, a1:pivotOffset(), 0))
            a1.wornShield.Transparency = (math.sin(a2 * 3) * 0.08) + 0.62
        end
    end
end
u35.isProtected = function(a1)
    --[[
      name: isProtected
      line: 2331
    ]]
    local v186 = true
    if a1.invulnRemaining <= 0 then
        v186 = true
        if a1.shieldRemaining <= 0 then
            v186 = a1.flightRemaining > 0
        end
    end
    return v186
end
u35.posePlayer = function(a1, a2)
    --[[
      name: posePlayer
      line: 2334
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    local v187 = ((math.abs(a1.velocityX) <= 2) and 0) or (math.sign(a1.velocityX) * 65)
    a1.facingYaw = a1.facingYaw + ((v187 - a1.facingYaw) * math.min(a2 * 10, 1))
    local v188 = math.clamp(-a1.velocityX * 0.45, -12, 12)
    local renderAlpha_1 = a1.renderAlpha
    a1.doodler:pose((CFrame.new(a1.stage.origin + Vector3.new(lerp_upv_1(a1.renderPrevX, a1.playerX, renderAlpha_1), lerp_upv_1(a1.renderPrevY, a1.playerY, renderAlpha_1), 0) + Vector3.new(0, a1:pivotOffset(), 0)) * CFrame.Angles(0, math.rad(a1.facingYaw), 0)) * CFrame.Angles(0, 0, math.rad(v188)), a1.velocityY, os.clock())
end
u35.poseDeathPivot = function(a1, a2)
    --[[
      name: poseDeathPivot
      line: 2352
    ]]
    a1.doodler:pose(a2, 0, os.clock())
end
u35.playerPosition = function(a1)
    --[[
      name: playerPosition
      line: 2355
    ]]
    return a1.stage.origin + Vector3.new(a1.playerX, a1.playerY, 0)
end
u35.pivotOffset = function(a1)
    --[[
      name: pivotOffset
      line: 2360
    ]]
    return a1.doodler.pivotYOffset
end
u35.steerFromScreenX = function(a1, a2)
    --[[
      name: steerFromScreenX
      line: 2363
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local X_1 = a1.stage.camera.ViewportSize.X
    local v189 = math.clamp((a2 - (X_1 / 2)) / (X_1 * DOODLE_JUMP_CONFIG_upv_1.steerFullDeflectionFraction), -1, 1)
    if math.abs(v189) >= DOODLE_JUMP_CONFIG_upv_1.steerDeadzone then
        return v189
    end
    return 0
end
u35.aimWorldXFromScreenX = function(a1, a2)
    --[[
      name: aimWorldXFromScreenX
      line: 2369
    ]]
    local X_2 = a1.stage.camera.ViewportSize.X
    return a1.cameraX + (((a2 - (X_2 / 2)) / X_2) * a1.stage.getFrameWidth())
end
u35.die = function(a1, a2)
    --[[
      name: die
      line: 2373
      upvalues:
        DOODLE_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1.deathCause = a2
        a1:setRunning(false)
        a1.flightRemaining = 0
        a1.flightKind = nil
        a1.shieldRemaining = 0
        a1:parkWornGear()
        a1:stopFlightSounds()
        if a2 ~= "abduct" then
            a1.context.audio.play("buzz", {})
            a1.context.audio.play("thud", {})
        else
            a1.context.audio.play("buzz", {})
            a1.context.audio.play("whoosh", {})
        end
        a1.stage.shake(1)
        a1.deathVelocityY = math.min(a1.velocityY, 0)
        a1.deathSpin = 0
        local score_upv_1 = a1.score
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            DOODLE_JUMP_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 2411
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
local tbl_29 = {}
tbl_29.DoodleJumpGame = u35
return tbl_29