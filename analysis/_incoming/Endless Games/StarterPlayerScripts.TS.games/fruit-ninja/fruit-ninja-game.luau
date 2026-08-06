-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local TweenService_upv_1 = v1.TweenService
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local SPLAT_DECAL_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "decal-textures").SPLAT_DECAL_TEXTURE
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local FRUIT_NINJA_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").FRUIT_NINJA_STAGE_LIGHTING
local isGamepadActive_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "input-device-atom").isGamepadActive
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v4 = RuntimeLib_1.import(script, script.Parent, "fruit-ninja-assets")
local AuthoredFruitVisual_upv_1 = v4.AuthoredFruitVisual
local FruitNinjaAssets_upv_1 = v4.FruitNinjaAssets
local FRUIT_NINJA_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "fruit-ninja-config").FRUIT_NINJA_CONFIG
local v5 = RuntimeLib_1.import(script, script.Parent, "fruit-ninja-waves")
local composeWave_upv_1 = v5.composeWave
local makeWaveSlot_upv_1 = v5.makeWaveSlot
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(138, 99, 67)
local u3 = CFrame.Angles(0, 1.5707963267948966, 0)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_upv_2 = {Color3.fromRGB(232, 64, 58), Color3.fromRGB(96, 186, 74), Color3.fromRGB(245, 150, 40), Color3.fromRGB(245, 214, 66), Color3.fromRGB(154, 210, 74), Color3.fromRGB(158, 86, 204), Color3.fromRGB(236, 120, 168), Color3.fromRGB(88, 132, 224)}
local u4 = Color3.fromRGB(26, 26, 32)
local u5 = Color3.fromRGB(255, 60, 50)
local u6 = Color3.fromRGB(104, 70, 44)
local u7 = Color3.fromRGB(66, 66, 74)
local u8 = Color3.fromRGB(110, 190, 80)
local u9 = CFrame.Angles(0, 0, 1.3962634015954636)
local u10 = CFrame.Angles(0, 0, -0.4537856055185257)
local u11 = ColorSequence.new(Color3.fromRGB(255, 210, 90), Color3.fromRGB(255, 90, 30))
local u12 = ColorSequence.new(Color3.fromRGB(60, 58, 66), Color3.fromRGB(20, 18, 22))
local u13 = Color3.fromRGB(255, 216, 102)
local u14 = Color3.fromRGB(255, 90, 100)
local u15 = Color3.fromRGB(245, 245, 255)
local u16 = Color3.fromRGB(126, 224, 118)
local tbl_3 = {}
tbl_3.color = Color3.fromRGB(255, 70, 70)
local tbl_4 = {}
tbl_4.color = Color3.fromRGB(255, 110, 40)
local tbl_5 = {}
tbl_5.color = Color3.fromRGB(255, 160, 60)
local tbl_upv_6 = {{color = Color3.fromRGB(255, 64, 160)}, tbl_3, tbl_4, tbl_5, {color = u13}}
local function comboTierFor_1(a1)
    --[[
      name: comboTierFor
      line: 132
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    for _, value_1 in tbl_upv_6 do
        if value_1.minCount > a1 then
            continue
        end
        return value_1
    end
    return tbl_upv_6[#tbl_upv_6]
end
local tbl_upv_7 = {"fruitSlice1", "fruitSlice2", "fruitSlice3", "fruitSlice4", "fruitSlice5"}
local function comboSoundFor_1(a1)
    --[[
      name: comboSoundFor
      line: 143
    ]]
    if a1 < 5 then
        if a1 ~= 4 then
            return "fruitCombo3"
        end
        return "fruitCombo4"
    end
    return "fruitCombo5"
end
local u17 = Color3.fromRGB(255, 70, 70)
local u18 = Color3.fromRGB(255, 120, 40)
local u19 = ColorSequence.new(Color3.fromRGB(255, 220, 120), Color3.fromRGB(255, 70, 20))
local u20 = TweenInfo.new(0.42, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u21 = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u22 = Color3.fromRGB(250, 220, 70)
local tbl_upv_8 = {}
tbl_upv_8.frenzy = Color3.fromRGB(255, 138, 46)
tbl_upv_8.freeze = Color3.fromRGB(126, 202, 255)
tbl_upv_8.double = Color3.fromRGB(255, 214, 92)
local tbl_upv_9 = {}
local tbl_upv_10 = {}
local u23 = Color3.fromRGB(22, 40, 68)
local u24 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u25 = Color3.fromRGB(186, 34, 58)
local tbl_upv_11 = {Vector2.new(1, 0), Vector2.new(0.5, 0.87), Vector2.new(-0.5, 0.87)}
local tbl_upv_12 = {"frenzy", "freeze", "double"}
local tbl_upv_13 = {}
local u26 = Vector2.new(1, 0)
local tbl_14 = {}
local tbl_15 = {}
tbl_15.__tostring = function()
    --[[
      name: __tostring
      line: 250
    ]]
    return "FruitNinjaGame"
end
tbl_15.__index = BaseWorldGame_upv_1
local u28 = setmetatable(tbl_14, tbl_15)
u28.__index = u28
u28.new = function(...)
    --[[
      name: new
      line: 256
      upvalues:
        u28 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u28)
    return v6:constructor(...) or v6
end
u28.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 260
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.fruits = {}
    a1.activeHalves = {}
    a1.freeHalfVisuals = {}
    a1.sphereHalves = {}
    a1.livesPips = {}
    a1.heartPips = {}
    a1.bombWarnMarkers = {}
    a1.pendingBombs = {}
    a1.splats = {}
    a1.effectStates = {}
    a1.freeVisuals = {}
    a1.pomScaleMul = 1
    a1.originX = 0
    a1.originY = 0
    a1.originZ = 0
    a1.mode = "play"
    a1.elapsed = 0
    a1.spawnTimer = FRUIT_NINJA_CONFIG_upv_1.volleyGapStart
    a1.waveSlots = {}
    a1.waveClock = 0
    a1.waveSlotCount = 0
    a1.waveSlotsLaunched = 0
    a1.lastPatternIndex = -1
    a1.bombCredit = 0
    a1.strikes = 0
    a1.score = 0
    a1.noBombsUntilElapsed = 0
    a1.dead = false
    a1.padScreen = Vector2.zero
    a1.padBladeHeld = false
    a1.roundToken = 0
    a1.fruitPoints = 0
    a1.comboPoints = 0
    a1.criticalPoints = 0
    a1.pomegranatePoints = 0
    a1.nextLifeScore = FRUIT_NINJA_CONFIG_upv_1.lifeEveryPoints
    a1.strokeSliceCount = 0
    a1.sliceSoundIndex = 0
    a1.strokeBasePoints = 0
    a1.strokeLastSliceElapsed = 0
    a1.lastSlicePosition = Vector3.new(0, 0, 0)
    a1.frenzySpawnTimer = 0
    a1.finisherRemaining = 0
    a1.pomegranateHitTimer = 0
    a1.splatIndex = 0
    a1.bladeActive = false
    a1.polyline = {}
    a1.sampleSpeeds = {}
    a1.pendingSegments = 0
    a1.curPlane = Vector2.zero
    a1.prevScreen = Vector2.zero
    a1.curScreen = Vector2.zero
    a1.prevTime = 0
    a1.curTime = 0
    a1.random = Random.new()
    a1.waveRandom = Random.new()
    a1.frenzyRandom = Random.new()
    a1.criticalRandom = Random.new()
end
u28.buildScene = function(a1)
    --[[
      name: buildScene
      line: 321
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        makeWaveSlot_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        FruitNinjaAssets_upv_1 (copy, index: 4)
        tbl_upv_13 (copy, index: 5)
        AuthoredFruitVisual_upv_1 (copy, index: 6)
        u3 (copy, index: 7)
        makeStagePart_upv_1 (copy, index: 8)
        u14 (copy, index: 9)
        u5 (copy, index: 10)
        u1 (copy, index: 11)
        PopupTextPool_upv_1 (copy, index: 12)
        u12 (copy, index: 13)
        u19 (copy, index: 14)
        u18 (copy, index: 15)
        u25 (copy, index: 16)
        u13 (copy, index: 17)
        createGameLoopSound_upv_1 (copy, index: 18)
        SOUND_IDS_upv_1 (copy, index: 19)
    ]]
    if #a1.waveSlots == 0 then
        for _ = 0, FRUIT_NINJA_CONFIG_upv_1.maxWaveSlots - 1 do
            table.insert(a1.waveSlots, (makeWaveSlot_upv_1()))
        end
    end
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.originX = origin_1.X
    a1.originY = origin_1.Y
    a1.originZ = origin_1.Z
    a1:buildBackdrop(container_1)
    a1:applyAuthoredLighting()
    a1.tintOverlay = makeSmoothPart_upv_1(container_1)
    a1.tintOverlay.Material = Enum.Material.Neon
    a1.tintOverlay.Size = Vector3.new(400, 240, 0.4000000059604645)
    a1.tintOverlay.CFrame = CFrame.new(a1.originX, a1.originY, a1.originZ + 1.2)
    a1.tintOverlay.Transparency = 1
    a1.stage.setFrameWidthFloor(FRUIT_NINJA_CONFIG_upv_1.spawnHalfWidthMax * 2)
    local v7 = nil
    if FRUIT_NINJA_CONFIG_upv_1.useAuthoredFruits then
        v7 = FruitNinjaAssets_upv_1.new()
        local v8, v9, v10 = nil, nil, nil
        if v7.available then
            a1.assets = v7
            for _, value_2 in v7.species do
                a1:prewarmEntry(value_2, 3)
            end
            v9 = v7:special("Bomb")
            if v9 ~= nil then
                a1:prewarmEntry(v9, 2)
            end
            local v11 = nil
            for _, value_3 in pairs(tbl_upv_13) do
                v11 = v7:special(value_3)
                if v11 ~= nil then
                    a1:prewarmEntry(v11, 1)
                end
            end
            v10 = v7:special("Pomegranate")
            if v10 ~= nil then
                a1.pomEntry = v10
                a1.pomScaleMul = a1:entryScale(v10)
                a1.pomegranateVisual = AuthoredFruitVisual_upv_1.new(v10.whole, container_1, v10.restOrientation)
                a1.pomegranateVisual:setScale(a1.pomScaleMul)
            end
            v8 = v7:special("Heart")
            if v8 ~= nil then
                local v12 = FRUIT_NINJA_CONFIG_upv_1.heartPipWidth / math.max(v8.bboxSize.Z, 0.1)
                for _ = 0, FRUIT_NINJA_CONFIG_upv_1.maxStrikes - 1 do
                    local v13 = AuthoredFruitVisual_upv_1.new(v8.whole, container_1, u3)
                    v13:setScale(v12)
                    table.insert(a1.heartPips, v13)
                end
            end
        end
    end
    for _ = 0, FRUIT_NINJA_CONFIG_upv_1.fruitPoolSize - 1 do
        table.insert(a1.fruits, (a1:makeFruit(container_1)))
    end
    for _ = 0, FRUIT_NINJA_CONFIG_upv_1.splatterPoolSize - 1 do
        table.insert(a1.splats, (a1:makeSplat(container_1)))
    end
    if #a1.heartPips == 0 then
        for _ = 0, FRUIT_NINJA_CONFIG_upv_1.maxStrikes - 1 do
            local v14 = makeStagePart_upv_1(container_1)
            v14.Shape = Enum.PartType.Ball
            v14.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
            v14.Color = u14
            table.insert(a1.livesPips, v14)
        end
    end
    for _ = 0, FRUIT_NINJA_CONFIG_upv_1.bombWarnPoolSize - 1 do
        local v15 = makeSmoothPart_upv_1(container_1)
        v15.Material = Enum.Material.Neon
        v15.Color = u5
        v15.Size = Vector3.new(3.4000000953674316, 0.5, 0.5)
        v15.CFrame = u1
        table.insert(a1.bombWarnMarkers, v15)
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, FRUIT_NINJA_CONFIG_upv_1.popupPoolSize)
    a1.splashAnchor = makeStagePart_upv_1(container_1)
    a1.splashAnchor.Transparency = 1
    a1.splashAnchor.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    a1.splash = a1:makeBurst(a1.splashAnchor, NumberRange.new(0.4, 0.9), NumberRange.new(10, 20))
    a1.bombAnchor = makeStagePart_upv_1(container_1)
    a1.bombAnchor.Transparency = 1
    a1.bombAnchor.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    a1.bombBurst = a1:makeBurst(a1.bombAnchor, NumberRange.new(0.6, 1.3), NumberRange.new(10, 24))
    a1.bombBurst.Color = u12
    a1.bombBurst.LightEmission = 0.2
    a1.bombFire = a1:makeBurst(a1.bombAnchor, NumberRange.new(0.4, 0.9), NumberRange.new(16, 34))
    a1.bombFire.Color = u19
    a1.bombFire.LightEmission = 1
    a1.shockwave = makeSmoothPart_upv_1(container_1)
    a1.shockwave.Material = Enum.Material.Neon
    a1.shockwave.Shape = Enum.PartType.Cylinder
    a1.shockwave.Color = u18
    a1.shockwave.Transparency = 1
    a1.shockwave.CFrame = u1
    a1.pomegranate = makeStagePart_upv_1(container_1)
    a1.pomegranate.Shape = Enum.PartType.Ball
    a1.pomegranate.Size = Vector3.new(FRUIT_NINJA_CONFIG_upv_1.pomegranateDiameter, FRUIT_NINJA_CONFIG_upv_1.pomegranateDiameter, FRUIT_NINJA_CONFIG_upv_1.pomegranateDiameter)
    a1.pomegranate.Color = u25
    a1.pomegranate.CFrame = u1
    a1.pomegranateSparkle = Instance.new("ParticleEmitter")
    a1.pomegranateSparkle.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    a1.pomegranateSparkle.Rate = 16
    a1.pomegranateSparkle.Lifetime = NumberRange.new(0.4, 0.8)
    a1.pomegranateSparkle.Speed = NumberRange.new(2, 5)
    a1.pomegranateSparkle.SpreadAngle = Vector2.new(180, 180)
    a1.pomegranateSparkle.Size = NumberSequence.new(0.5)
    a1.pomegranateSparkle.LightEmission = 1
    a1.pomegranateSparkle.Color = ColorSequence.new(u13)
    a1.pomegranateSparkle.Enabled = false
    a1.pomegranateSparkle.Parent = a1.pomegranate
    table.insert(a1.effectStates, (a1:makeEffectChip(container_1, "frenzy")))
    table.insert(a1.effectStates, (a1:makeEffectChip(container_1, "freeze")))
    table.insert(a1.effectStates, (a1:makeEffectChip(container_1, "double")))
    a1.fuseHiss = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.buzz, parent = a1.backdrop, playbackSpeed = FRUIT_NINJA_CONFIG_upv_1.fuseHissPitch})
    a1.bladeAnchor = makeStagePart_upv_1(container_1)
    a1.bladeAnchor.Transparency = 1
    a1.bladeAnchor.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896)
    local v16 = Instance.new("Attachment")
    v16.Position = Vector3.new(0, FRUIT_NINJA_CONFIG_upv_1.bladeTrailWidth * 0.5, 0)
    v16.Parent = a1.bladeAnchor
    local v17 = Instance.new("Attachment")
    v17.Position = Vector3.new(0, -FRUIT_NINJA_CONFIG_upv_1.bladeTrailWidth * 0.5, 0)
    v17.Parent = a1.bladeAnchor
    a1.bladeTrail = Instance.new("Trail")
    a1.bladeTrail.Attachment0 = v16
    a1.bladeTrail.Attachment1 = v17
    a1.bladeTrail.Lifetime = FRUIT_NINJA_CONFIG_upv_1.bladeTrailLifetime
    a1.bladeTrail.FaceCamera = true
    a1.bladeTrail.LightEmission = 1
    a1.bladeTrail.Color = ColorSequence.new(Color3.fromRGB(245, 250, 255), Color3.fromRGB(150, 210, 255))
    a1.bladeTrail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1)})
    a1.bladeTrail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.05)})
    a1.bladeTrail.Enabled = false
    a1.bladeTrail.Parent = a1.bladeAnchor
    local v18 = makeStagePart_upv_1(container_1)
    v18.Transparency = 1
    v18.Size = Vector3.new(80, 1, 1)
    v18.CFrame = CFrame.new(origin_1 + Vector3.new(0, -20, -10))
    local v19 = Instance.new("ParticleEmitter")
    v19.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    v19.Rate = 10
    v19.Lifetime = NumberRange.new(3, 6)
    v19.Speed = NumberRange.new(1, 2.5)
    v19.SpreadAngle = Vector2.new(16, 16)
    v19.Size = NumberSequence.new(0.3)
    v19.LightEmission = 0.6
    v19.EmissionDirection = Enum.NormalId.Top
    v19.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.3, 0.6), NumberSequenceKeypoint.new(1, 1)})
    v19.Parent = v18
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 515
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "pointer" then
                    return
                end
                a1:onPressBegan(a2)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.drag:Connect(
            function(a4, a5)
                --[[
                  line: 520
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if (a1.padBladeHeld) then
                    return
                end
                a1:onDrag(a5)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 525
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a8 ~= "pointer" then
                    return
                end
                a1:onPressEnded()
            end
        )
    )
    a1:buildPadCursor()
end
u28.buildPadCursor = function(a1)
    --[[
      name: buildPadCursor
      line: 532
      upvalues:
        Players_upv_1 (copy, index: 1)
    ]]
    local v20 = Instance.new("ScreenGui")
    v20.Name = "FruitNinjaBlade"
    v20.ResetOnSpawn = false
    v20.IgnoreGuiInset = true
    v20.DisplayOrder = 4
    v20.Enabled = false
    v20.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    local v21 = Instance.new("Frame")
    v21.Name = "Blade"
    v21.AnchorPoint = Vector2.new(0.5, 0.5)
    v21.Size = UDim2.fromOffset(22, 22)
    v21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v21.BackgroundTransparency = 0.25
    v21.BorderSizePixel = 0
    v21.Parent = v20
    local v22 = Instance.new("UICorner")
    v22.CornerRadius = UDim.new(0.5, 0)
    v22.Parent = v21
    local v23 = Instance.new("UIStroke")
    v23.Color = Color3.fromRGB(20, 20, 24)
    v23.Thickness = 2
    v23.Parent = v21
    a1.padCursorGui = v20
    a1.padCursor = v21
    a1.context.janitor:Add(v20)
    local v24
    if Players_upv_1.LocalPlayer:GetMouse() then
        v24 = Vector2.new(a1.stage.camera.ViewportSize.X / 2, a1.stage.camera.ViewportSize.Y / 2)
    else
        v24 = Vector2.zero
    end
    a1.padScreen = v24
end
u28.updatePadBlade = function(a1, a2)
    --[[
      name: updatePadBlade
      line: 560
      upvalues:
        isGamepadActive_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
    ]]
    local padCursorGui_1 = a1.padCursorGui
    if padCursorGui_1 ~= nil then
        local v25 = isGamepadActive_upv_1()
        padCursorGui_1.Enabled = v25 and (not a1.dead)
        local v26 = nil
        if v25 then
            local ViewportSize_1 = a1.stage.camera.ViewportSize
            v26 = gamepadInput_upv_1:leftX()
            local v27 = gamepadInput_upv_1:leftY()
            if v26 ~= 0 or v27 ~= 0 then
                local v28 = ViewportSize_1.X * 2.4 * a2
                a1.padScreen = Vector2.new(math.clamp(a1.padScreen.X + (v26 * v28), 0, ViewportSize_1.X), math.clamp(a1.padScreen.Y - (v27 * v28), 0, ViewportSize_1.Y))
            end
            if a1.padCursor ~= nil then
                a1.padCursor.Position = UDim2.fromOffset(a1.padScreen.X, a1.padScreen.Y)
            end
            local v29 = gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)
            if not v29 or a1.dead or (a1.padBladeHeld) then
                if v29 then
                    a1:onDrag(a1.padScreen)
                elseif a1.padBladeHeld then
                    a1.padBladeHeld = false
                    a1:onPressEnded()
                end
            end
            a1.padBladeHeld = true
            a1:onPressBegan(a1.padScreen)
        else
            if a1.padBladeHeld then
                a1.padBladeHeld = false
                a1:onPressEnded()
            end
            return nil
        end
    else
        return nil
    end
end
u28.resetRound = function(a1)
    --[[
      name: resetRound
      line: 596
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    a1.waveRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.frenzyRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 1)
    a1.criticalRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 2)
    a1.roundToken = a1.roundToken + 1
    a1.mode = "play"
    a1.elapsed = 0
    a1.spawnTimer = FRUIT_NINJA_CONFIG_upv_1.volleyGapStart
    a1.strikes = 0
    a1.score = 0
    a1.fruitPoints = 0
    a1.comboPoints = 0
    a1.criticalPoints = 0
    a1.pomegranatePoints = 0
    a1.nextLifeScore = FRUIT_NINJA_CONFIG_upv_1.lifeEveryPoints
    a1.strokeSliceCount = 0
    a1.strokeBasePoints = 0
    a1.strokeLastSliceElapsed = 0
    a1.sliceSoundIndex = 0
    a1.noBombsUntilElapsed = 0
    a1:clearWaveQueue()
    a1.lastPatternIndex = -1
    a1.bombCredit = 0
    a1.frenzySpawnTimer = 0
    a1.finisherRemaining = 0
    a1.pomegranateHitTimer = 0
    a1.dead = false
    a1:clearEffects()
    a1:resetBlade()
    for _, value_4 in a1.fruits do
        a1:retireFruit(value_4)
    end
    a1:releaseAllHalves()
    a1:clearPendingBombs()
    a1:clearSplatter()
    a1:parkPomegranate()
    a1:stopFuseHiss()
    a1.tintOverlay.Transparency = 1
    a1.shockwave.Transparency = 1
    a1.shockwave.CFrame = u1
    a1:updateLivesPips()
    a1.context.reportScore(0)
end
u28.captureRound = function(a1)
    --[[
      name: captureRound
      line: 640
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        tbl_upv_12 (copy, index: 2)
    ]]
    if not a1.dead and a1.mode == "play" then
        local tbl_upv_16 = {}
        local v30 = 0
        for _, value_5 in a1.fruits do
            if value_5.active == true then
                v30 = v30 + 1
                tbl_upv_16[v30] = value_5
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 659
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_16 (copy, index: 2)
                    tbl_upv_12 (copy, index: 3)
                ]]
                a2:int(a1.score):int(a1.strikes):num(a1.elapsed):num(a1.spawnTimer)
                a2:int(a1.fruitPoints):int(a1.comboPoints):int(a1.criticalPoints):int(a1.pomegranatePoints)
                a2:int(a1.nextLifeScore):int(a1.lastPatternIndex):int(a1.bombCredit)
                a2:num(a1.noBombsUntilElapsed):num(a1.frenzySpawnTimer)
                a2:int(#tbl_upv_16)
                local v31 = nil
                for _, value_6 in tbl_upv_16 do
                    a2:num(value_6.x):num(value_6.y):num(value_6.vx):num(value_6.vy):num(value_6.gravity)
                    a2:num(value_6.spin):num(value_6.spinSpeed)
                    a2:bool(value_6.isBomb):bool(value_6.sparesMiss)
                    v31 = ((value_6.banana == nil) and -1) or (math.max((table.find(tbl_upv_12, value_6.banana) or 0) - 1, 0))
                    a2:int(v31)
                end
            end
        )
    end
    return nil
end
u28.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 681
      upvalues:
        readResume_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_12 (copy, index: 3)
        u1 (copy, index: 4)
        deriveRandom_upv_1 (copy, index: 5)
    ]]
    local v32 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 682
            ]]
            local tbl_17 = {}
            tbl_17.score = a3:int()
            tbl_17.strikes = a3:int()
            tbl_17.elapsed = a3:num()
            tbl_17.spawnTimer = a3:num()
            tbl_17.fruitPoints = a3:int()
            tbl_17.comboPoints = a3:int()
            tbl_17.criticalPoints = a3:int()
            tbl_17.pomegranatePoints = a3:int()
            tbl_17.nextLifeScore = a3:int()
            tbl_17.lastPatternIndex = a3:int()
            tbl_17.bombCredit = a3:int()
            tbl_17.noBombsUntilElapsed = a3:num()
            tbl_17.frenzySpawnTimer = a3:num()
            local v33 = a3:int()
            local tbl_18 = {}
            local v34 = 0
            local v35 = false
            v35, v34 = v35, v34
            while true do
                if v35 then
                    v34 = v34 + 1
                else
                    v35 = true
                end
                if v34 >= v33 then
                    break
                end
                table.insert(tbl_18, {x = a3:num(), y = a3:num(), vx = a3:num(), vy = a3:num(), gravity = a3:num(), spin = a3:num(), spinSpeed = a3:num(), isBomb = a3:bool(), sparesMiss = a3:bool(), bananaIndex = a3:int()})
            end
            v34 = table.clone(tbl_17)
            setmetatable(v34, nil)
            v34.airborne = tbl_18
            return v34
        end
    )
    if v32 ~= nil and FRUIT_NINJA_CONFIG_upv_1.maxStrikes > v32.strikes then
        for _, value_7 in a1.fruits do
            a1:retireFruit(value_7)
        end
        a1:releaseAllHalves()
        a1:clearPendingBombs()
        a1:clearEffects()
        a1:resetBlade()
        a1:clearWaveQueue()
        a1.mode = "play"
        a1.score = a2.score
        a1.strikes = v32.strikes
        a1.elapsed = v32.elapsed
        a1.spawnTimer = v32.spawnTimer
        a1.fruitPoints = v32.fruitPoints
        a1.comboPoints = v32.comboPoints
        a1.criticalPoints = v32.criticalPoints
        a1.pomegranatePoints = v32.pomegranatePoints
        a1.nextLifeScore = v32.nextLifeScore
        a1.lastPatternIndex = v32.lastPatternIndex
        a1.bombCredit = v32.bombCredit
        a1.noBombsUntilElapsed = v32.noBombsUntilElapsed
        a1.frenzySpawnTimer = v32.frenzySpawnTimer
        a1.finisherRemaining = 0
        a1.pomegranateHitTimer = 0
        a1.strokeSliceCount = 0
        a1.strokeBasePoints = 0
        a1.strokeLastSliceElapsed = 0
        a1.dead = false
        a1.roundToken = a1.roundToken + 1
        local v36 = nil
        for _, value_8 in v32.airborne do
            a1:launchFruit({x = value_8.x, vx = value_8.vx, vy = value_8.vy, gravity = value_8.gravity, isBomb = value_8.isBomb, sparesMiss = value_8.sparesMiss, banana = tbl_upv_12[value_8.bananaIndex + 1]})
            v36 = nil
            for v38, value_9 in a1.fruits do
                if (value_9.active and (value_9.y == FRUIT_NINJA_CONFIG_upv_1.launchY)) == true then
                    v36 = value_9
                    break
                end
            end
            if v36 ~= nil then
                v36.y = value_8.y
                v36.spin = value_8.spin
                v36.spinSpeed = value_8.spinSpeed
            end
        end
        a1.tintOverlay.Transparency = 1
        a1.shockwave.Transparency = 1
        a1.shockwave.CFrame = u1
        a1:updateLivesPips()
        local v37 = math.floor(v32.elapsed) + 1
        a1.waveRandom = deriveRandom_upv_1(a1.context.getRunSeed(), v37)
        a1.frenzyRandom = deriveRandom_upv_1(a1.context.getRunSeed(), v37 + 1)
        a1.criticalRandom = deriveRandom_upv_1(a1.context.getRunSeed(), v37 + 2)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u28.revive = function(a1)
    --[[
      name: revive
      line: 811
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.mode = "play"
    a1.strikes = 0
    a1.strokeSliceCount = 0
    a1.strokeBasePoints = 0
    a1.dead = false
    a1:clearEffects()
    a1:parkPomegranate()
    a1:stopFuseHiss()
    a1.tintOverlay.Transparency = 1
    a1:clearWaveQueue()
    a1.spawnTimer = math.max(a1.spawnTimer, 0.8)
    a1.noBombsUntilElapsed = a1.elapsed + FRUIT_NINJA_CONFIG_upv_1.reviveNoBombSeconds
    for _, value_10 in a1.fruits do
        if not (value_10.active) then
            continue
        end
        if value_10.isBomb then
            a1:retireFruit(value_10)
        end
    end
    a1:clearPendingBombs()
    a1:updateLivesPips()
    a1:setRunning(true)
end
u28.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 837
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1:updatePadBlade(a2)
    a1:integrateHalves(a2)
    if not a1.dead then
        a1.elapsed = a1.elapsed + a2
        if a1.mode ~= "finisher" then
            if a1.strokeSliceCount > 0 and FRUIT_NINJA_CONFIG_upv_1.comboSwipeLapseSeconds < a1.elapsed - a1.strokeLastSliceElapsed then
                a1:resolveStroke(true)
            end
            a1:tickEffects(a2)
            a1:integrateFruits(a2)
            if not (a1.dead) and a1.mode == "play" then
                a1:advancePendingBombs(a2)
                if a1:isEffectActive("frenzy") then
                    a1.frenzySpawnTimer = a1.frenzySpawnTimer - a2
                    if a1.frenzySpawnTimer <= 0 then
                        a1.frenzySpawnTimer = FRUIT_NINJA_CONFIG_upv_1.frenzyLaunchInterval
                        a1:spawnFrenzyFruit()
                    end
                else
                    a1:launchDueSlots(a2)
                    a1.spawnTimer = a1.spawnTimer - a2
                    if a1.spawnTimer <= 0 and a1.waveSlotCount <= a1.waveSlotsLaunched then
                        a1:composeNextWave()
                    end
                end
                if a1.bladeActive and a1.pendingSegments > 0 then
                    a1:testBlade()
                end
                return
            end
        else
            a1:updateFinisher(a2)
        end
    end
    return nil
end
u28.render = function(a1)
    --[[
      name: render
      line: 880
      upvalues:
        u9 (copy, index: 1)
        u10 (copy, index: 2)
    ]]
    a1:poseHalves()
    local v38 = false
    local v39 = 0
    local v40 = nil
    v38 = nil
    local v41 = nil
    for _, value_11 in a1.fruits do
        if not (value_11.active) then
            continue
        end
        v40 = CFrame.new(a1.originX + value_11.x, a1.originY + value_11.y, a1.originZ) * CFrame.Angles(value_11.spin, value_11.spin * 0.6, 0)
        if value_11.visual == nil then
            value_11.part.CFrame = v40
            if value_11.stemVisible then
                value_11.stem.CFrame = (v40 * CFrame.new(0, value_11.stemY + 0.28, 0)) * u9
            end
            if value_11.leafVisible then
                value_11.leaf.CFrame = (v40 * CFrame.new(0.66, value_11.stemY + 0.2, 0.1)) * u10
            end
        else
            value_11.visual:pose(v40)
            if value_11.fuse.Enabled then
                value_11.part.CFrame = v40
            end
        end
        if not (value_11.isBomb) then
            continue
        end
        v38 = true
        v41 = math.clamp((14 - value_11.y) / 34, 0, 1)
        if v39 < v41 then
            v39 = v41
        end
    end
    a1:updateFuseHiss(v38, v39)
    a1:updateEffectChips()
    if a1.mode == "finisher" then
        local v42 = CFrame.new(a1.originX, a1.originY + a1:pomegranateY(), a1.originZ) * CFrame.Angles(0, 0, math.sin(a1.elapsed * 6) * 0.12)
        if a1.pomegranateVisual == nil then
            a1.pomegranate.CFrame = v42
        else
            a1.pomegranateVisual:pose(v42)
        end
    end
    if not a1.bladeActive then
        return
    end
    a1.bladeAnchor.CFrame = CFrame.new(a1.originX + a1.curPlane.X, a1.originY + a1.curPlane.Y, a1.originZ + 1.6)
end
u28.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 934
    ]]
    if #a1.activeHalves ~= 0 then
        a1:integrateHalves(a2)
        a1:poseHalves()
    else
        return nil
    end
end
u28.integrateFruits = function(a1, a2)
    --[[
      name: integrateFruits
      line: 941
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v43 = nil
    for _, value_12 in a1.fruits do
        if not (value_12.active) then
            continue
        end
        value_12.vy = value_12.vy - (value_12.gravity * a2)
        value_12.x = value_12.x + (value_12.vx * a2)
        value_12.y = value_12.y + (value_12.vy * a2)
        value_12.spin = value_12.spin + (value_12.spinSpeed * a2)
        if value_12.vy >= 0 or value_12.y >= FRUIT_NINJA_CONFIG_upv_1.missY then
            continue
        end
        v43 = not value_12.isBomb and (not value_12.sparesMiss and (a1:isReachable(value_12.x)))
        a1:retireFruit(value_12)
        if not (v43) then
            continue
        end
        a1:registerMiss()
        if a1.dead or a1.mode == "finisher" then
            return nil
        end
    end
end
u28.composeNextWave = function(a1)
    --[[
      name: composeNextWave
      line: 962
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        composeWave_upv_1 (copy, index: 2)
    ]]
    local v44 = math.clamp(a1.stage.getFrameWidth() * 0.5 - FRUIT_NINJA_CONFIG_upv_1.spawnMargin, 4, FRUIT_NINJA_CONFIG_upv_1.spawnHalfWidthMax)
    local waveRandom_1 = a1.waveRandom
    local tbl_19 = {}
    tbl_19.sizeFloor = a1:waveSizeFloor()
    tbl_19.speed = a1:speedMultiplier()
    tbl_19.halfWidth = v44
    tbl_19.bombChance = a1:bombChance()
    tbl_19.allowBombs = a1.noBombsUntilElapsed <= a1.elapsed
    tbl_19.baseGap = a1:volleyGap()
    tbl_19.envelope = a1:intensityEnvelope()
    tbl_19.lastPatternIndex = a1.lastPatternIndex
    tbl_19.bombCredit = a1.bombCredit
    local v45 = composeWave_upv_1(waveRandom_1, tbl_19, a1.waveSlots)
    a1.lastPatternIndex = v45.patternIndex
    a1.bombCredit = v45.bombCredit
    a1.waveSlotCount = v45.slotCount
    a1.waveSlotsLaunched = 0
    a1.waveClock = 0
    a1.spawnTimer = v45.gapAfter
end
u28.launchDueSlots = function(a1, a2)
    --[[
      name: launchDueSlots
      line: 982
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.waveSlotCount > a1.waveSlotsLaunched then
        a1.waveClock = a1.waveClock + a2
        local v46 = false
        local v47 = 0
        local v48 = false
        if v48 then
            v47 = v47 + 1
        else
            v48 = true
        end
        local v49 = nil
        if v47 < a1.waveSlotCount then
            v49 = a1.waveSlots[v47 + 1]
            if not (v49.launched) and a1.waveClock >= v49.delay then
                v49.launched = true
                a1.waveSlotsLaunched = a1.waveSlotsLaunched + 1
                if v49.isBomb then
                    a1:telegraphBomb(v49.x, v49.vx, v49.vy, v49.gravity)
                else
                    a1:launchFruit({x = v49.x, vx = v49.vx, vy = v49.vy, gravity = v49.gravity, banana = v49.banana})
                    if not (v46) then
                        v46 = true
                        a1.context.audio.play("whoosh", {volume = FRUIT_NINJA_CONFIG_upv_1.tossWhooshVolume, pitch = FRUIT_NINJA_CONFIG_upv_1.tossWhooshPitch})
                    end
                end
            end
            if v48 then
                v47 = v47 + 1
            else
                v48 = true
            end
        end
    else
        return nil
    end
end
u28.clearWaveQueue = function(a1)
    --[[
      name: clearWaveQueue
      line: 1029
    ]]
    a1.waveSlotCount = 0
    a1.waveSlotsLaunched = 0
    a1.waveClock = 0
end
u28.spawnFrenzyFruit = function(a1)
    --[[
      name: spawnFrenzyFruit
      line: 1034
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v50 = math.clamp(a1.stage.getFrameWidth() * 0.5 - FRUIT_NINJA_CONFIG_upv_1.spawnMargin, 4, FRUIT_NINJA_CONFIG_upv_1.spawnHalfWidthMax)
    local v51 = a1.frenzyRandom:NextNumber(-v50, v50)
    a1:launchFruit({x = v51, vx = a1.frenzyRandom:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.frenzyLaunchVxMax, FRUIT_NINJA_CONFIG_upv_1.frenzyLaunchVxMax) - (v51 * FRUIT_NINJA_CONFIG_upv_1.launchInwardPull), vy = a1.frenzyRandom:NextNumber(FRUIT_NINJA_CONFIG_upv_1.frenzyLaunchVyMin, FRUIT_NINJA_CONFIG_upv_1.frenzyLaunchVyMax), gravity = FRUIT_NINJA_CONFIG_upv_1.gravity})
end
u28.telegraphBomb = function(a1, a2, a3, a4, a5)
    --[[
      name: telegraphBomb
      line: 1047
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v52 = a1:acquireBombMarker()
    if v52 ~= nil then
        v52.CFrame = CFrame.new(a1.originX + a2, (a1.originY - (a1.stage.frameHeight * 0.5)) + 1.5, a1.originZ + 1)
        v52.Transparency = 0
        table.insert(a1.pendingBombs, {marker = v52, x = a2, vx = a3, vy = a4, gravity = a5, timer = FRUIT_NINJA_CONFIG_upv_1.bombWarnSeconds})
        a1.context.audio.play("buzz", {})
    else
        a1:launchFruit({x = a2, vx = a3, vy = a4, gravity = a5})
        return nil
    end
end
u28.launchFruit = function(a1, a2)
    --[[
      name: launchFruit
      line: 1079
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v53 = a1:acquireFruit()
    if v53 ~= nil then
        v53.active = true
        v53.isBomb = a2.isBomb == true
        v53.banana = a2.banana
        v53.sparesMiss = a2.sparesMiss == true
        v53.x = a2.x
        v53.y = FRUIT_NINJA_CONFIG_upv_1.launchY
        v53.vx = a2.vx
        v53.vy = a2.vy
        v53.gravity = a2.gravity
        local v54
        if v53.isBomb then
            v54 = FRUIT_NINJA_CONFIG_upv_1.bombCutRadius
        else
            v54 = FRUIT_NINJA_CONFIG_upv_1.fruitCutRadius
        end
        v53.cutRadius = v54
        v53.spin = 0
        v53.spinSpeed = a1.random:NextNumber(-4, 4)
        a1:dressFruit(v53)
        if v53.isBomb then
            a1.context.audio.play("thud", {})
        end
    else
        return nil
    end
end
u28.advancePendingBombs = function(a1, a2)
    --[[
      name: advancePendingBombs
      line: 1104
    ]]
    for n_1 = #a1.pendingBombs - 1, 0, -1 do
        local v55 = a1.pendingBombs[n_1 + 1]
        v55.timer = v55.timer - a2
        local marker_1 = v55.marker
        marker_1.Transparency = os.clock() * 12 % 2 >= 1 and 0.55 or 0
        if v55.timer <= 0 then
            a1:launchFruit({x = v55.x, vx = v55.vx, vy = v55.vy, gravity = v55.gravity})
            a1:parkBombMarker(v55.marker)
            a1.pendingBombs[n_1 + 1] = a1.pendingBombs[(#a1.pendingBombs - 1) + 1]
            local pendingBombs_1 = a1.pendingBombs
            pendingBombs_1[#pendingBombs_1] = nil
        end
    end
end
u28.acquireBombMarker = function(a1)
    --[[
      name: acquireBombMarker
      line: 1126
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_13 in a1.bombWarnMarkers do
        if value_13.CFrame ~= u1 then
            continue
        end
        return value_13
    end
    return nil
end
u28.parkBombMarker = function(a1, a2)
    --[[
      name: parkBombMarker
      line: 1134
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.CFrame = u1
end
u28.clearPendingBombs = function(a1)
    --[[
      name: clearPendingBombs
      line: 1137
    ]]
    for _, value_14 in a1.pendingBombs do
        a1:parkBombMarker(value_14.marker)
    end
    while #a1.pendingBombs > 0 do
        local pendingBombs_2 = a1.pendingBombs
        pendingBombs_2[#pendingBombs_2] = nil
    end
end
local function u27(a1)
    --[[
      name: testBlade
      line: 1146
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u27 (ref,  index: 2)
    ]]
    local v57 = #a1.polyline
    local v58 = math.min(a1.pendingSegments, v57 - 1)
    a1.pendingSegments = 0
    local v59 = false
    local v59, v60 = v59, v58
    if v59 then
        v60 = v60 - 1
    else
        v59 = true
    end
    local v61 = nil
    if v60 >= 1 then
        v61 = a1.polyline[v57 - v60]
        local v62 = a1.polyline[(v57 - v60) + 1]
        local v63 = a1.sampleSpeeds[(v57 - v60) + 1]
        if v61 == nil or v62 == nil then
            return
        end
        if v63 ~= nil then
            local v64
            if v63 < FRUIT_NINJA_CONFIG_upv_1.cutSpeedPxPerSecond then
                return
            end
            for v65, value_15 in a1.fruits do
                if not (value_15.active) or u27(v61.X, v61.Y, v62.X, v62.Y, value_15.x, value_15.y) > value_15.cutRadius then
                    continue
                end
                a1:slice(value_15, v62 - v61, v63)
                if a1.dead or a1.mode == "finisher" then
                    return nil
                end
            end
        end
    end
end
u28.testBlade = u27
u27 = function(a1)
    --[[
      name: testBladeFinisher
      line: 1185
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u27 (ref,  index: 2)
    ]]
    local v64 = #a1.polyline
    local v65 = math.min(a1.pendingSegments, v64 - 1)
    a1.pendingSegments = 0
    if a1.pomegranateHitTimer <= 0 then
        local v66 = a1:pomegranateY()
        local v67 = false
        local v67, v68 = v67, v65
        while true do
            if v67 then
                v68 = v68 - 1
            else
                v67 = true
            end
            local v69 = nil
            if v68 < 1 then
                return
            else
                v69 = a1.polyline[v64 - v68]
                local v70 = a1.polyline[(v64 - v68) + 1]
                local v71 = a1.sampleSpeeds[(v64 - v68) + 1]
                if v69 == nil or v70 == nil or v71 == nil or v71 < FRUIT_NINJA_CONFIG_upv_1.cutSpeedPxPerSecond then
                    continue
                end
            end
            if u27(v69.X, v69.Y, v70.X, v70.Y, 0, v66) <= FRUIT_NINJA_CONFIG_upv_1.pomegranateCutRadius then
                break
            end
        end
        a1:pomegranateHit()
    end
    return nil
end
u28.testBladeFinisher = u27
u28.slice = function(a1, a2, a3, a4)
    --[[
      name: slice
      line: 1221
      upvalues:
        u26 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_7 (copy, index: 3)
        u13 (copy, index: 4)
    ]]
    if a2.isBomb then
        a1:detonate(a2)
        return nil
    else
        local v72 = CFrame.new(a1.originX + a2.x, a1.originY + a2.y, a1.originZ) * CFrame.Angles(a2.spin, a2.spin * 0.6, 0)
        local Position_1 = v72.Position
        local color_1 = a2.color
        local entry_1 = a2.entry
        local scaleMul_1 = a2.scaleMul
        local banana_1 = a2.banana
        local x_1 = a2.x
        local y_1 = a2.y
        local v73 = math.clamp((a4 - FRUIT_NINJA_CONFIG_upv_1.cutSpeedPxPerSecond) / 1200, 0, 1) * 0.35 + 1
        a1:retireFruit(a2)
        a1:flingHalves(entry_1, scaleMul_1, v72, u26, v73, color_1)
        a1:showSplash(Position_1, color_1, (math.min(a1.strokeSliceCount * 2, 10)))
        a1:placeSplatter(x_1, y_1, color_1)
        a1.lastSlicePosition = Position_1
        a1.strokeSliceCount = a1.strokeSliceCount + 1
        a1.strokeLastSliceElapsed = a1.elapsed
        a1.strokeBasePoints = a1.strokeBasePoints + a1:addScore("fruit", a1:scoreMultiplier())
        a1.context.audio.play(tbl_upv_7[a1.sliceSoundIndex + 1], {})
        a1.sliceSoundIndex = (a1.sliceSoundIndex + 1) % #tbl_upv_7
        if a1.criticalRandom:NextNumber() < FRUIT_NINJA_CONFIG_upv_1.criticalChance then
            local v74 = a1:addScore("critical", FRUIT_NINJA_CONFIG_upv_1.criticalBonus * a1:scoreMultiplier())
            a1:showSplash(Position_1, u13)
            a1.popups:show(Position_1 + Vector3.new(0, 2, 0), ("+%* CRITICAL"):format(v74), u13, 1.05)
            a1.context.audio.play("coinSettle", {})
        end
        if banana_1 ~= nil then
            a1:activateBanana(banana_1, Position_1)
        end
    end
end
u28.resolveStroke = function(a1, a2)
    --[[
      name: resolveStroke
      line: 1269
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_6 (copy, index: 2)
        publishCombo_upv_1 (copy, index: 3)
    ]]
    local strokeSliceCount_1 = a1.strokeSliceCount
    local strokeBasePoints_1 = a1.strokeBasePoints
    a1.strokeSliceCount = 0
    a1.strokeBasePoints = 0
    if a2 and strokeSliceCount_1 >= FRUIT_NINJA_CONFIG_upv_1.comboMinFruits and strokeBasePoints_1 > 0 then
        local v75 = a1:addScore("combo", strokeBasePoints_1)
        for _, value_16 in tbl_upv_6 do
            local v76
            if value_16.minCount <= strokeSliceCount_1 then
                v76 = value_16
            end
        end
        publishCombo_upv_1({count = strokeSliceCount_1, color = v76.color, holdSeconds = FRUIT_NINJA_CONFIG_upv_1.comboHoldSeconds})
        a1:pulseHitStop(FRUIT_NINJA_CONFIG_upv_1.comboHitStopSeconds)
        if strokeSliceCount_1 >= 5 then
            a1:pulseShockwave(a1.lastSlicePosition, v76.color)
        end
        a1.popups:show(a1.lastSlicePosition + Vector3.new(0, 4.199999809265137, 0), ("%* x%*"):format(v76.label, strokeSliceCount_1), v76.color, v76.scale)
        a1.popups:show(a1.lastSlicePosition + Vector3.new(0, 2, 0), ("+%*"):format(v75), v76.color, 0.85)
        a1.context.audio.play(((strokeSliceCount_1 >= 5) and "fruitCombo5") or (((strokeSliceCount_1 ~= 4) and "fruitCombo3") or "fruitCombo4"), {})
    else
        return nil
    end
end
u28.addScore = function(a1, a2, a3)
    --[[
      name: addScore
      line: 1297
    ]]
    a1.score = a1.score + a3
    if a2 == "fruit" then
        a1.fruitPoints = a1.fruitPoints + a3
    elseif a2 == "combo" then
        a1.comboPoints = a1.comboPoints + a3
    elseif a2 ~= "critical" then
        a1.pomegranatePoints = a1.pomegranatePoints + a3
    else
        a1.criticalPoints = a1.criticalPoints + a3
    end
    a1.context.reportScore(a1.score)
    a1:checkExtraLife()
    return a3
end
u28.scoreMultiplier = function(a1)
    --[[
      name: scoreMultiplier
      line: 1312
    ]]
    if a1:isEffectActive("double") then
        return 2
    end
    return 1
end
u28.checkExtraLife = function(a1)
    --[[
      name: checkExtraLife
      line: 1315
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
    ]]
    while a1.nextLifeScore <= a1.score do
        a1.nextLifeScore = a1.nextLifeScore + FRUIT_NINJA_CONFIG_upv_1.lifeEveryPoints
        if a1.mode ~= "play" or a1.strikes <= 0 then
            continue
        end
        if FRUIT_NINJA_CONFIG_upv_1.maxStrikes > a1.strikes then
            a1.strikes = a1.strikes - 1
            a1:updateLivesPips()
            a1.popups:show(Vector3.new(a1.originX, (a1.originY + (a1.stage.frameHeight * 0.5)) - 5, a1.originZ), "+1 LIFE", u16, 0.9)
            a1.context.audio.play("uiConfirm", {})
        end
    end
end
u28.effectState = function(a1, a2)
    --[[
      name: effectState
      line: 1331
    ]]
    for _, value_17 in a1.effectStates do
        if value_17.kind ~= a2 then
            continue
        end
        return value_17
    end
    return nil
end
u28.isEffectActive = function(a1, a2)
    --[[
      name: isEffectActive
      line: 1339
    ]]
    local v77 = a1:effectState(a2)
    local v78 = false
    if v77 ~= nil then
        v78 = v77.remaining > 0
    end
    return v78
end
u28.effectDuration = function(a1, a2)
    --[[
      name: effectDuration
      line: 1343
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 ~= "frenzy" then
        if a2 ~= "freeze" then
            return FRUIT_NINJA_CONFIG_upv_1.doubleDurationSeconds
        end
        return FRUIT_NINJA_CONFIG_upv_1.freezeDurationSeconds
    end
    return FRUIT_NINJA_CONFIG_upv_1.frenzyDurationSeconds
end
u28.activateBanana = function(a1, a2, a3)
    --[[
      name: activateBanana
      line: 1352
      upvalues:
        u23 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u24 (copy, index: 3)
        tbl_upv_10 (copy, index: 4)
        tbl_upv_8 (copy, index: 5)
    ]]
    local v79 = a1:effectState(a2)
    if v79 ~= nil then
        local v80 = v79.remaining > 0
        v79.remaining = v79.remaining + a1:effectDuration(a2)
        v79.total = math.max(v79.total, v79.remaining)
        if a2 == "frenzy" and not (v80) then
            a1.frenzySpawnTimer = 0
        end
        if a2 == "freeze" then
            a1:syncTimeScale()
            a1.tintOverlay.Color = u23
            TweenService_upv_1:Create(a1.tintOverlay, u24, {}):Play()
        end
        a1.popups:show(a3 + Vector3.new(0, 2, 0), tbl_upv_10[a2], tbl_upv_8[a2], 1.2)
        if a2 == "frenzy" then
            a1.context.audio.play("whoosh", {})
            a1.context.audio.play("perfect", {})
        elseif a2 ~= "freeze" then
            a1.context.audio.play("coinSettle", {})
        else
            a1.context.audio.play("splash", {})
            a1.context.audio.play("perfect", {})
        end
    else
        return nil
    end
end
u28.tickEffects = function(a1, a2)
    --[[
      name: tickEffects
      line: 1397
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_18 in a1.effectStates do
        if value_18.remaining <= 0 then
            continue
        end
        value_18.remaining = value_18.remaining - a2
        if value_18.remaining <= 0 then
            value_18.remaining = 0
            value_18.total = 0
            a1:onEffectEnded(value_18.kind)
            value_18.chip.CFrame = u1
            value_18.bar.CFrame = u1
        end
    end
end
u28.onEffectEnded = function(a1, a2)
    --[[
      name: onEffectEnded
      line: 1412
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u24 (copy, index: 2)
    ]]
    if a2 == "freeze" then
        a1:syncTimeScale()
        TweenService_upv_1:Create(a1.tintOverlay, u24, {}):Play()
    elseif a2 == "frenzy" then
        a1.spawnTimer = math.max(a1.spawnTimer, 0.9)
    end
end
u28.clearEffects = function(a1)
    --[[
      name: clearEffects
      line: 1423
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u24 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    for _, value_19 in a1.effectStates do
        if value_19.kind == "freeze" and value_19.remaining > 0 then
            TweenService_upv_1:Create(a1.tintOverlay, u24, {}):Play()
        end
        value_19.remaining = 0
        value_19.total = 0
        value_19.chip.CFrame = u1
        value_19.bar.CFrame = u1
    end
    a1:syncTimeScale()
end
u28.syncTimeScale = function(a1)
    --[[
      name: syncTimeScale
      line: 1437
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.timeScale = not (a1:isEffectActive("freeze")) and 1 or FRUIT_NINJA_CONFIG_upv_1.freezeTimeScale
end
u28.pulseHitStop = function(a1, a2)
    --[[
      name: pulseHitStop
      line: 1440
    ]]
    a1.timeScale = 0
    task.delay(
        a2,
        function()
            --[[
              line: 1442
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:syncTimeScale()
        end
    )
end
u28.updateEffectChips = function(a1)
    --[[
      name: updateEffectChips
      line: 1446
    ]]
    local v82 = 0
    for _, value_20 in a1.effectStates do
        if value_20.remaining > 0 then
            v82 = v82 + 1
        end
    end
    if v82 ~= 0 then
        local v83 = a1.originY + (a1.stage.frameHeight * 0.5) - 5.2
        local v84 = 0
        v84 = v84
        local v85 = nil
        local v86 = nil
        for _, value_21 in a1.effectStates do
            if value_21.remaining > 0 then
                v85 = a1.originX + (v84 - ((v82 - 1) * 0.5)) * 5.5
                value_21.chip.CFrame = CFrame.new(v85, v83, a1.originZ + 1)
                v86 = ((value_21.total <= 0) and 0) or (math.clamp(value_21.remaining / value_21.total, 0, 1))
                value_21.bar.Size = Vector3.new(math.max(v86 * 3.6, 0.05), 0.35, 0.35)
                value_21.bar.CFrame = CFrame.new(v85, v83 - 1.5, a1.originZ + 1)
                v84 = v84 + 1
            end
        end
    else
        return nil
    end
end
u28.detonate = function(a1, a2)
    --[[
      name: detonate
      line: 1470
      upvalues:
        u18 (copy, index: 1)
    ]]
    local v87 = Vector3.new(a1.originX + a2.x, a1.originY + a2.y, a1.originZ)
    a1:retireFruit(a2)
    a1.bombAnchor.CFrame = CFrame.new(v87)
    a1.bombBurst:Emit(90)
    a1.bombFire:Emit(72)
    a1:showSplash(v87, u18)
    a1:pulseShockwave(v87, u18)
    a1:flashBackdrop()
    a1.context.audio.play("fruitBombExplosion", {})
    a1.context.audio.play("thud", {})
    a1.context.audio.play("buzz", {})
    a1:pulseHitStop(0.12)
    a1.stage.shake(3.6)
    a1:die("bomb")
end
u28.pulseShockwave = function(a1, a2, a3)
    --[[
      name: pulseShockwave
      line: 1497
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u21 (copy, index: 2)
    ]]
    a1.shockwave.Color = a3
    a1.shockwave.Size = Vector3.new(0.4000000059604645, 2, 2)
    a1.shockwave.Transparency = 0.1
    a1.shockwave.CFrame = CFrame.new(a2 + Vector3.new(0, 0, 1)) * CFrame.Angles(0, 1.5707963267948966, 0)
    TweenService_upv_1:Create(a1.shockwave, u21, {}):Play()
end
u28.flashBackdrop = function(a1)
    --[[
      name: flashBackdrop
      line: 1511
      upvalues:
        u18 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u20 (copy, index: 3)
    ]]
    a1.tintOverlay.Color = u18
    a1.tintOverlay.Transparency = 0.5
    TweenService_upv_1:Create(a1.tintOverlay, u20, {}):Play()
end
u28.registerMiss = function(a1)
    --[[
      name: registerMiss
      line: 1518
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    a1.strikes = a1.strikes + 1
    a1:updateLivesPips()
    a1.context.audio.play("fruitHealthDown", {})
    a1.popups:show(Vector3.new(a1.originX, (a1.originY + FRUIT_NINJA_CONFIG_upv_1.launchY) + 4, a1.originZ), "MISS", u14, 0.85)
    if FRUIT_NINJA_CONFIG_upv_1.maxStrikes > a1.strikes then
        return
    end
    a1:die("strikes")
end
u28.die = function(a1, a2)
    --[[
      name: die
      line: 1529
    ]]
    if not (a1.dead) and a1.mode ~= "finisher" then
        a1:resolveStroke(a2 == "strikes")
        a1:clearEffects()
        a1:stopFuseHiss()
        a1:resetBlade()
        if a2 ~= "strikes" then
            a1.dead = true
            a1:setRunning(false)
            a1.context.audio.play("buzz", {})
            a1.stage.shake(0.9)
            local score_upv_1 = a1.score
            local roundToken_upv_1 = a1.roundToken
            task.delay(
                0.8,
                function()
                    --[[
                      line: 1552
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
            return
        end
        a1:enterFinisher()
        return nil
    end
    return nil
end
u28.enterFinisher = function(a1)
    --[[
      name: enterFinisher
      line: 1558
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    a1.mode = "finisher"
    a1.finisherRemaining = FRUIT_NINJA_CONFIG_upv_1.pomegranateHangSeconds
    a1.pomegranateHitTimer = 0
    for _, value_22 in a1.fruits do
        a1:retireFruit(value_22)
    end
    a1:clearPendingBombs()
    a1:clearWaveQueue()
    local v88 = CFrame.new(a1.originX, a1.originY + 2, a1.originZ)
    if a1.pomegranateVisual == nil then
        a1.pomegranate.CFrame = v88
        a1.pomegranateSparkle.Enabled = true
    else
        a1.pomegranateVisual:pose(v88)
        a1.pomegranateVisual:setEmittersEnabled(true)
    end
    a1.popups:show(Vector3.new(a1.originX, (a1.originY + 2) + 6.5, a1.originZ), "FINISH IT!", u13, 1.25)
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("uiConfirm", {})
    a1.stage.shake(0.6)
end
u28.updateFinisher = function(a1, a2)
    --[[
      name: updateFinisher
      line: 1587
    ]]
    a1.finisherRemaining = a1.finisherRemaining - a2
    a1.pomegranateHitTimer = a1.pomegranateHitTimer - a2
    if a1.finisherRemaining > 0 then
        if a1.bladeActive and a1.pendingSegments > 0 then
            a1:testBladeFinisher()
        end
    else
        a1:burstPomegranate()
        return nil
    end
end
u28.pomegranateY = function(a1)
    --[[
      name: pomegranateY
      line: 1598
    ]]
    return (math.sin(a1.elapsed * 2.4) * 0.8) + 2
end
u28.pomegranateHit = function(a1)
    --[[
      name: pomegranateHit
      line: 1601
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u25 (copy, index: 2)
        u15 (copy, index: 3)
        u13 (copy, index: 4)
        u17 (copy, index: 5)
    ]]
    a1.pomegranateHitTimer = FRUIT_NINJA_CONFIG_upv_1.pomegranateHitCooldown
    a1:addScore("pomegranate", 1)
    local v89 = a1:pomegranateY()
    local v90 = Vector3.new(a1.originX, a1.originY + v89, a1.originZ)
    a1:showSplash(v90, u25)
    a1:placeSplatter(a1.random:NextNumber(-2.5, 2.5), v89 + a1.random:NextNumber(-2, 2), u25, 2)
    local pomegranatePoints_1 = a1.pomegranatePoints
    local v91 = math.min(pomegranatePoints_1 / 20, 1)
    local v92
    if v91 >= 0.5 then
        v92 = u13:Lerp(u17, (v91 - 0.5) * 2)
    else
        v92 = u15:Lerp(u13, v91 * 2)
    end
    a1.popups:show(v90 + Vector3.new(0, 2, 0), ("x%*"):format(pomegranatePoints_1), v92, (v91 * 0.95) + 0.55)
    a1.context.audio.play("splat", {})
    a1.context.audio.play("scorePing", {pitch = math.min(0.9 + (a1.pomegranatePoints * 0.03), 2)})
    a1.stage.shake(0.15)
end
u28.burstPomegranate = function(a1)
    --[[
      name: burstPomegranate
      line: 1624
      upvalues:
        u25 (copy, index: 1)
        tbl_upv_11 (copy, index: 2)
        u13 (copy, index: 3)
        u17 (copy, index: 4)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1:resetBlade()
    local v93 = Vector3.new(a1.originX, a1.originY + a1:pomegranateY(), a1.originZ)
    a1:parkPomegranate()
    a1:showSplash(v93, u25, 10)
    a1:pulseShockwave(v93, u25)
    a1:flingHalves(a1.pomEntry, a1.pomScaleMul, CFrame.new(v93), tbl_upv_11[1], 1.5, u25)
    for _, value_23 in tbl_upv_11 do
        a1:showSplash(v93 + (Vector3.new(value_23.X, value_23.Y, 0) * 2), u25)
    end
    local v94 = nil
    if a1.pomegranatePoints > 0 then
        v94 = math.min(a1.pomegranatePoints / 20, 1)
        local v95
        if v94 >= 1 then
            v95 = u17
        else
            v95 = u13
        end
        a1.popups:show(v93 + Vector3.new(0, 2, 0), ("+%*"):format(a1.pomegranatePoints), v95, (v94 * 0.5) + 1.3)
    end
    a1.context.audio.play("splat", {})
    a1.context.audio.play("pop", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(1.8)
    local score_upv_2 = a1.score
    local roundToken_upv_2 = a1.roundToken
    task.delay(
        0.9,
        function()
            --[[
              line: 1661
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_2 (copy, index: 2)
                score_upv_2 (copy, index: 3)
            ]]
            if a1.roundToken ~= roundToken_upv_2 then
                return
            end
            a1.context.endRun(score_upv_2)
        end
    )
end
u28.parkPomegranate = function(a1)
    --[[
      name: parkPomegranate
      line: 1667
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.pomegranate.CFrame = u1
    a1.pomegranateSparkle.Enabled = false
    local pomegranateVisual_1 = a1.pomegranateVisual
    if pomegranateVisual_1 == nil then
        return
    end
    pomegranateVisual_1:park()
end
u28.onPressBegan = function(a1, a2)
    --[[
      name: onPressBegan
      line: 1675
    ]]
    a1:resolveStroke(true)
    local v96 = a1:screenToPlane(a2)
    a1.bladeActive = true
    a1.polyline = {v96}
    a1.sampleSpeeds = {0}
    a1.pendingSegments = 0
    a1.curPlane = v96
    a1.prevScreen = a2
    a1.curScreen = a2
    local v97 = os.clock()
    a1.prevTime = v97
    a1.curTime = v97
    a1.bladeAnchor.CFrame = CFrame.new(a1.originX + v96.X, a1.originY + v96.Y, a1.originZ + 1.6)
    a1.bladeTrail.Enabled = true
end
u28.onDrag = function(a1, a2)
    --[[
      name: onDrag
      line: 1692
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.bladeActive then
        a1.prevScreen = a1.curScreen
        a1.prevTime = a1.curTime
        a1.curScreen = a2
        a1.curTime = os.clock()
        local v98 = a1.curTime - a1.prevTime
        local v99 = ((v98 <= 0) and 0) or ((a1.curScreen - a1.prevScreen).Magnitude / v98)
        local v100 = a1:screenToPlane(a2)
        a1.curPlane = v100
        table.insert(a1.polyline, v100)
        table.insert(a1.sampleSpeeds, v99)
        if FRUIT_NINJA_CONFIG_upv_1.polylinePoints < #a1.polyline then
            table.remove(a1.polyline, 1)
            table.remove(a1.sampleSpeeds, 1)
        end
        a1.pendingSegments = math.min(a1.pendingSegments + 1, #a1.polyline - 1)
    else
        if not a1.dead then
            a1:onPressBegan(a2)
        end
        return nil
    end
end
u28.onPressEnded = function(a1)
    --[[
      name: onPressEnded
      line: 1729
    ]]
    a1:resolveStroke(true)
    a1:resetBlade()
end
u28.resetBlade = function(a1)
    --[[
      name: resetBlade
      line: 1733
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.bladeActive = false
    a1.pendingSegments = 0
    a1.polyline = {}
    a1.sampleSpeeds = {}
    a1.bladeTrail.Enabled = false
    a1.bladeAnchor.CFrame = u1
end
u28.screenToPlane = function(a1, a2)
    --[[
      name: screenToPlane
      line: 1741
    ]]
    local v101 = a1.stage.camera:ScreenPointToRay(a2.X, a2.Y)
    local Z_1 = v101.Direction.Z
    if math.abs(Z_1) >= 1e-04 then
        local v102 = v101.Origin + v101.Direction * ((a1.originZ - v101.Origin.Z) / Z_1)
        return Vector2.new(v102.X - a1.originX, v102.Y - a1.originY)
    end
    return a1.curPlane
end
u28.acquireFruit = function(a1)
    --[[
      name: acquireFruit
      line: 1753
    ]]
    for _, value_24 in a1.fruits do
        if value_24.active then
            continue
        end
        return value_24
    end
    return nil
end
u28.retireFruit = function(a1, a2)
    --[[
      name: retireFruit
      line: 1761
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.fuse.Enabled = false
    a2.part.CFrame = u1
    a2.stem.CFrame = u1
    a2.leaf.CFrame = u1
    a2.stemVisible = false
    a2.leafVisible = false
    a1:releaseVisual(a2)
end
u28.entryScale = function(a1, a2)
    --[[
      name: entryScale
      line: 1771
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local bboxSize_1 = a2.bboxSize
    if a2.name ~= "Bomb" then
        if a2.name ~= "Pomegranate" then
            if string.match(a2.name, "^Banana") == nil then
                return FRUIT_NINJA_CONFIG_upv_1.fruitDiameter / math.max(bboxSize_1.X, bboxSize_1.Y, 0.1)
            end
            return FRUIT_NINJA_CONFIG_upv_1.bananaLength / math.max(bboxSize_1.X, bboxSize_1.Y, bboxSize_1.Z, 0.1)
        end
        return FRUIT_NINJA_CONFIG_upv_1.pomegranateDiameter / math.max(bboxSize_1.X, bboxSize_1.Y, 0.1)
    end
    return FRUIT_NINJA_CONFIG_upv_1.bombDiameter / math.max(math.min(bboxSize_1.X, bboxSize_1.Z), 0.1)
end
u28.acquireVisual = function(a1, a2, a3, a4)
    --[[
      name: acquireVisual
      line: 1786
      upvalues:
        AuthoredFruitVisual_upv_1 (copy, index: 1)
    ]]
    local v103 = a1.freeVisuals[a2]
    local v104
    if v103 == nil then
        v104 = nil
    else
        local v105 = #v103
        local v106 = v103[#v103]
        v103[v105] = nil
        v104 = v106
    end
    local v107 = v104 or (AuthoredFruitVisual_upv_1.new(a3, a1.stage.container, a4))
    return v107
end
u28.releaseVisual = function(a1, a2)
    --[[
      name: releaseVisual
      line: 1804
    ]]
    local visual_1 = a2.visual
    local visualKey_1 = a2.visualKey
    a2.visual = nil
    a2.visualKey = nil
    a2.entry = nil
    if visual_1 ~= nil then
        local v108 = nil
        if visualKey_1 ~= nil then
            visual_1:park()
            v108 = a1.freeVisuals[visualKey_1]
            if v108 == nil then
                a1.freeVisuals[visualKey_1] = {visual_1}
            else
                table.insert(v108, visual_1)
            end
            return
        end
    end
    return nil
end
u28.prewarmEntry = function(a1, a2, a3)
    --[[
      name: prewarmEntry
      line: 1823
      upvalues:
        AuthoredFruitVisual_upv_1 (copy, index: 1)
    ]]
    local v109 = a1.freeVisuals[a2.name]
    if v109 == nil then
        v109 = {}
    end
    local v110 = 0
    local v111 = false
    while true do
        if v111 then
            v110 = v110 + 1
        else
            v111 = true
        end
        if v110 >= a3 then
            break
        end
        table.insert(v109, (AuthoredFruitVisual_upv_1.new(a2.whole, a1.stage.container, a2.restOrientation)))
    end
    a1.freeVisuals[a2.name] = v109
    a1:prewarmHalf(("%*#1"):format(a2.name), a2.half1)
    a1:prewarmHalf(("%*#2"):format(a2.name), a2.half2)
end
u28.prewarmHalf = function(a1, a2, a3)
    --[[
      name: prewarmHalf
      line: 1853
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        AuthoredFruitVisual_upv_1 (copy, index: 2)
    ]]
    local v112 = nil
    if a3 ~= nil then
        v112 = a1.freeHalfVisuals[a2]
        if v112 == nil then
            v112 = {}
        end
        for _ = 0, FRUIT_NINJA_CONFIG_upv_1.halfPrewarmPerKind - 1 do
            table.insert(v112, (AuthoredFruitVisual_upv_1.new(a3, a1.stage.container)))
        end
        a1.freeHalfVisuals[a2] = v112
    else
        return nil
    end
end
u28.dressFruit = function(a1, a2)
    --[[
      name: dressFruit
      line: 1872
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u11 (copy, index: 3)
        u7 (copy, index: 4)
        u22 (copy, index: 5)
        tbl_upv_8 (copy, index: 6)
        tbl_upv_13 (copy, index: 7)
        tbl_upv_2 (copy, index: 8)
        u14 (copy, index: 9)
        u6 (copy, index: 10)
        u1 (copy, index: 11)
    ]]
    local part_1 = a2.part
    a1:releaseVisual(a2)
    local v113 = nil
    if a2.isBomb then
        part_1.Size = Vector3.new(FRUIT_NINJA_CONFIG_upv_1.bombDiameter, FRUIT_NINJA_CONFIG_upv_1.bombDiameter, FRUIT_NINJA_CONFIG_upv_1.bombDiameter)
        part_1.Color = u4
        part_1.Material = Enum.Material.Metal
        a2.color = u4
        a2.fuse.Color = u11
        a2.fuse.Enabled = true
        a2.stem.Color = u7
        a2.stemY = (FRUIT_NINJA_CONFIG_upv_1.bombDiameter / 2) - 0.15
        a2.stemVisible = true
        a2.leafVisible = false
        v113 = a1.assets
        if v113 ~= nil then
            v113 = v113:special("Bomb")
        end
        if v113 ~= nil then
            a1:wearVisual(a2, v113, a1:entryScale(v113))
        end
    else
        local v114, v115 = nil, nil
        if a2.banana == nil then
            v113 = 0.94 + a1.random:NextNumber(0, 0.14)
            local v116 = FRUIT_NINJA_CONFIG_upv_1.fruitDiameter * v113
            part_1.Size = Vector3.new(v116, v116, v116)
            v114 = a1.assets
            if v114 ~= nil then
                v114 = v114.species
            end
            if v114 == nil or #v114 <= 0 then
                v115 = tbl_upv_2[a1.random:NextInteger(0, #tbl_upv_2 - 1) + 1]
                v115 = v115 or u14
                part_1.Color = v115
                a2.color = v115
            else
                v115 = v114[a1.random:NextInteger(0, #v114 - 1) + 1]
                a2.color = v115.color
                part_1.Color = v115.color
                a1:wearVisual(a2, v115, a1:entryScale(v115) * v113)
            end
            part_1.Material = Enum.Material.Plastic
            a2.fuse.Enabled = false
            a2.stem.Color = u6
            a2.stemY = (v116 / 2) - 0.1
            a2.stemVisible = true
            a2.leafVisible = true
        else
            part_1.Size = Vector3.new(FRUIT_NINJA_CONFIG_upv_1.bananaDiameter, FRUIT_NINJA_CONFIG_upv_1.bananaDiameter, FRUIT_NINJA_CONFIG_upv_1.bananaDiameter)
            part_1.Color = u22
            part_1.Material = Enum.Material.Neon
            a2.color = tbl_upv_8[a2.banana]
            a2.fuse.Color = ColorSequence.new(tbl_upv_8[a2.banana])
            a2.fuse.Enabled = true
            a2.stemVisible = false
            a2.leafVisible = false
            v113 = a1.assets
            if v113 ~= nil then
                v113 = v113:special(tbl_upv_13[a2.banana])
            end
            if v113 ~= nil then
                a1:wearVisual(a2, v113, a1:entryScale(v113))
            end
        end
    end
    if a2.visual == nil then
        part_1.Transparency = 0
    else
        v113 = a2.isBomb or (a2.banana ~= nil)
        part_1.Transparency = 1
        a2.visual:setEmittersEnabled(v113)
        if not (v113) then
            part_1.CFrame = u1
            a2.fuse.Enabled = false
        end
        a2.stemVisible = false
        a2.leafVisible = false
    end
    if not (a2.stemVisible) then
        a2.stem.CFrame = u1
    end
    if (a2.leafVisible) then
        return
    end
    a2.leaf.CFrame = u1
end
u28.wearVisual = function(a1, a2, a3, a4)
    --[[
      name: wearVisual
      line: 1964
    ]]
    local v117 = a1:acquireVisual(a3.name, a3.whole, a3.restOrientation)
    v117:setScale(a4)
    a2.visual = v117
    a2.visualKey = a3.name
    a2.entry = a3
    a2.scaleMul = a4
end
u28.flingHalves = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: flingHalves
      line: 1972
    ]]
    local v118 = Vector3.new(-a5.Y, a5.X, 0)
    if a2 ~= nil and a2.half1 ~= nil and a2.half2 ~= nil then
        a1:spawnAuthoredHalf(a2, a2.half1, a2.half1Local, ("%*#1"):format(a2.name), a4, a3, v118, a6)
        a1:spawnAuthoredHalf(a2, a2.half2, a2.half2Local, ("%*#2"):format(a2.name), a4, a3, v118 * -1, a6)
        return nil
    end
    a1:spawnSphereHalf(a4.Position, a7, v118, a6)
    a1:spawnSphereHalf(a4.Position, a7, v118 * -1, a6)
end
u28.spawnAuthoredHalf = function(a1, a2, a3, a4, a5, a6, a7, a8, a9)
    --[[
      name: spawnAuthoredHalf
      line: 1982
    ]]
    local v119 = a6 * a2.restOrientation * (CFrame.new(a4.Position * a7) * a4.Rotation)
    local v120 = a1:acquireHalfVisual(a5, a3)
    v120:setScale(a7)
    a1:launchHalf(v120, nil, a5, v119.Position, v119.Rotation, a8, a9)
end
u28.spawnSphereHalf = function(a1, a2, a3, a4, a5)
    --[[
      name: spawnSphereHalf
      line: 1998
    ]]
    local v121 = a1:acquireSphereHalf()
    v121.Color = a3
    a1:launchHalf(nil, v121, nil, a2, CFrame.identity, a4, a5)
end
u28.launchHalf = function(a1, a2, a3, a4, a5, a6, a7, a8)
    --[[
      name: launchHalf
      line: 2003
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v122 = a7 * (FRUIT_NINJA_CONFIG_upv_1.halfSeparation * a8) + Vector3.new(0, FRUIT_NINJA_CONFIG_upv_1.halfLift * a8, FRUIT_NINJA_CONFIG_upv_1.halfForward)
    local v123 = Vector3.new(a1.random:NextNumber(-1, 1), a1.random:NextNumber(-1, 1), a1.random:NextNumber(-1, 1))
    local v124 = ((a1.random:NextNumber() >= 0.5) and 1) or -1
    local activeHalves_1 = a1.activeHalves
    local tbl_20 = {}
    tbl_20.visual = a2
    tbl_20.part = a3
    tbl_20.key = a4
    tbl_20.position = a5
    tbl_20.velocity = v122
    tbl_20.baseRotation = a6
    tbl_20.spinAxis = ((v123.Magnitude <= 0.001) and Vector3.new(0, 0, 1)) or (v123.Unit)
    tbl_20.spinSpeed = a1.random:NextNumber(FRUIT_NINJA_CONFIG_upv_1.halfSpinMin, FRUIT_NINJA_CONFIG_upv_1.halfSpinMax) * v124
    tbl_20.life = FRUIT_NINJA_CONFIG_upv_1.halfLifeSeconds
    table.insert(activeHalves_1, tbl_20)
end
u28.integrateHalves = function(a1, a2)
    --[[
      name: integrateHalves
      line: 2025
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_2 = #a1.activeHalves - 1, 0, -1 do
        local v125 = a1.activeHalves[n_2 + 1]
        v125.velocity = Vector3.new(v125.velocity.X, v125.velocity.Y - (FRUIT_NINJA_CONFIG_upv_1.halfGravity * a2), v125.velocity.Z)
        v125.position = v125.position + (v125.velocity * a2)
        v125.spin = v125.spin + (v125.spinSpeed * a2)
        v125.life = v125.life - a2
        if v125.life <= 0 then
            a1:releaseHalf(v125)
            a1.activeHalves[n_2 + 1] = a1.activeHalves[(#a1.activeHalves - 1) + 1]
            local activeHalves_2 = a1.activeHalves
            activeHalves_2[#activeHalves_2] = nil
        end
    end
end
u28.poseHalves = function(a1)
    --[[
      name: poseHalves
      line: 2044
    ]]
    local v126 = nil
    local value_25 = nil
    for _, value_25 in a1.activeHalves do
        v126 = CFrame.new(value_25.position) * CFrame.fromAxisAngle(value_25.spinAxis, value_25.spin) * value_25.baseRotation
        if value_25.visual ~= nil then
            value_25.visual:poseRaw(v126)
            continue
        end
        if value_25.part ~= nil then
            value_25.part.CFrame = v126
        end
    end
end
u28.releaseHalf = function(a1, a2)
    --[[
      name: releaseHalf
      line: 2057
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a2.visual ~= nil then
        local v127 = nil
        if a2.key ~= nil then
            a2.visual:park()
            v127 = a1.freeHalfVisuals[a2.key]
            if v127 == nil then
                a1.freeHalfVisuals[a2.key] = {a2.visual}
            else
                table.insert(v127, a2.visual)
            end
            return
        end
    end
    if a2.part == nil then
        return
    end
    a2.part.CFrame = u1
    table.insert(a1.sphereHalves, a2.part)
end
u28.releaseAllHalves = function(a1)
    --[[
      name: releaseAllHalves
      line: 2079
    ]]
    for _, value_26 in a1.activeHalves do
        a1:releaseHalf(value_26)
    end
    while #a1.activeHalves > 0 do
        local activeHalves_3 = a1.activeHalves
        activeHalves_3[#activeHalves_3] = nil
    end
end
u28.acquireHalfVisual = function(a1, a2, a3)
    --[[
      name: acquireHalfVisual
      line: 2088
      upvalues:
        AuthoredFruitVisual_upv_1 (copy, index: 1)
    ]]
    local v128 = a1.freeHalfVisuals[a2]
    local v129
    if v128 == nil then
        v129 = nil
    else
        local v130 = #v128
        local v131 = v128[#v128]
        v128[v130] = nil
        v129 = v131
    end
    local v132 = v129 or (AuthoredFruitVisual_upv_1.new(a3, a1.stage.container))
    return v132
end
u28.acquireSphereHalf = function(a1)
    --[[
      name: acquireSphereHalf
      line: 2106
    ]]
    local sphereHalves_1 = a1.sphereHalves
    local v133 = #sphereHalves_1
    local v134 = sphereHalves_1[v133]
    sphereHalves_1[v133] = nil
    if v134 == nil then
        v134 = a1:makeSphereHalf(a1.stage.container)
    end
    return v134
end
u28.showSplash = function(a1, a2, a3, a4)
    --[[
      name: showSplash
      line: 2119
    ]]
    if a4 == nil then
        a4 = 0
    end
    a1.splashAnchor.CFrame = CFrame.new(a2)
    a1.splash.Color = ColorSequence.new(a3)
    a1.splash:Emit(14 + a4)
end
u28.placeSplatter = function(a1, a2, a3, a4, a5)
    --[[
      name: placeSplatter
      line: 2127
      upvalues:
        u1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    if a5 == nil then
        a5 = 1
    end
    for _, value_27 in a1.splats do
        if value_27.part.CFrame ~= u1 then
            value_27.decal.Transparency = math.min(value_27.decal.Transparency + FRUIT_NINJA_CONFIG_upv_1.splatterFadePerSlice, FRUIT_NINJA_CONFIG_upv_1.splatterMaxTransparency)
        end
    end
    local splatIndex_1 = a1.splatIndex
    local v135 = a1.splats[splatIndex_1 + 1]
    a1.splatIndex = (splatIndex_1 + 1) % #a1.splats
    if v135 ~= nil then
        local v136 = a1.random:NextNumber(3.8, 9.4) * a5
        v135.part.Size = Vector3.new(v136, v136 * a1.random:NextNumber(0.78, 1.22), 0.2)
        v135.decal.Color3 = a4:Lerp(u2, 0.25)
        v135.decal.Transparency = FRUIT_NINJA_CONFIG_upv_1.splatterBaseTransparency
        v135.part.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, (a1.originZ + -8) - (splatIndex_1 * 0.05)) * CFrame.Angles(0, 0, a1.random:NextNumber(0, math.tau))
    else
        return nil
    end
end
u28.clearSplatter = function(a1)
    --[[
      name: clearSplatter
      line: 2156
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_28 in a1.splats do
        value_28.part.CFrame = u1
        value_28.decal.Transparency = 1
    end
    a1.splatIndex = 0
end
u28.updateFuseHiss = function(a1, a2, a3)
    --[[
      name: updateFuseHiss
      line: 2163
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 then
        if not (a1.fuseHiss.IsPlaying) then
            a1.fuseHiss:Play()
        end
        a1.fuseHiss.Volume = FRUIT_NINJA_CONFIG_upv_1.fuseHissMinVolume + ((FRUIT_NINJA_CONFIG_upv_1.fuseHissMaxVolume - FRUIT_NINJA_CONFIG_upv_1.fuseHissMinVolume) * a3)
    else
        a1:stopFuseHiss()
        return nil
    end
end
u28.stopFuseHiss = function(a1)
    --[[
      name: stopFuseHiss
      line: 2173
    ]]
    if a1.fuseHiss == nil or not a1.fuseHiss.IsPlaying then
        return
    end
    a1.fuseHiss:Stop()
end
u28.updateLivesPips = function(a1)
    --[[
      name: updateLivesPips
      line: 2178
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    for n_3 = 0, FRUIT_NINJA_CONFIG_upv_1.maxStrikes - 1 do
        local v137
        if n_3 >= FRUIT_NINJA_CONFIG_upv_1.maxStrikes - a1.strikes then
            v137 = u1
        else
            v137 = CFrame.new((a1.originX - 3) + (n_3 * 3), (a1.originY + (a1.stage.frameHeight * 0.5)) - 2, a1.originZ + 1)
        end
        local v138
        v138 = a1.heartPips[n_3 + 1]
        if v138 ~= nil then
            v138:pose(v137)
            continue
        end
        local v139
        v139 = a1.livesPips[n_3 + 1]
        if v139 ~= nil then
            v139.CFrame = v137
        end
    end
end
u28.volleyGap = function(a1)
    --[[
      name: volleyGap
      line: 2194
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    return FRUIT_NINJA_CONFIG_upv_1.volleyGapStart + ((FRUIT_NINJA_CONFIG_upv_1.volleyGapMin - FRUIT_NINJA_CONFIG_upv_1.volleyGapStart) * math.clamp(a1.elapsed / FRUIT_NINJA_CONFIG_upv_1.volleyGapRampSeconds, 0, 1))
end
u28.waveSizeFloor = function(a1)
    --[[
      name: waveSizeFloor
      line: 2198
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.min(math.floor(a1.elapsed / FRUIT_NINJA_CONFIG_upv_1.batchGrowSeconds) + 1, FRUIT_NINJA_CONFIG_upv_1.batchFloorMax))
end
u28.intensityEnvelope = function(a1)
    --[[
      name: intensityEnvelope
      line: 2201
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    return 1 + (FRUIT_NINJA_CONFIG_upv_1.intensityDepth * math.sin((math.tau * a1.elapsed) / FRUIT_NINJA_CONFIG_upv_1.intensityPeriodSeconds))
end
u28.speedMultiplier = function(a1)
    --[[
      name: speedMultiplier
      line: 2204
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.min((math.floor(a1.elapsed / FRUIT_NINJA_CONFIG_upv_1.speedRampSeconds) * 0.1) + 1, FRUIT_NINJA_CONFIG_upv_1.speedMultiplierMax))
end
u28.bombChance = function(a1)
    --[[
      name: bombChance
      line: 2207
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    return FRUIT_NINJA_CONFIG_upv_1.bombChanceStart + ((FRUIT_NINJA_CONFIG_upv_1.bombChanceMax - FRUIT_NINJA_CONFIG_upv_1.bombChanceStart) * math.clamp(a1.elapsed / FRUIT_NINJA_CONFIG_upv_1.bombChanceRampSeconds, 0, 1))
end
u28.isReachable = function(a1, a2)
    --[[
      name: isReachable
      line: 2211
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v140 = math.abs(a2) <= a1.stage.getFrameWidth() * 0.5 + FRUIT_NINJA_CONFIG_upv_1.fruitDiameter
    return v140
end
u28.makeFruit = function(a1, a2)
    --[[
      name: makeFruit
      line: 2214
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u6 (copy, index: 4)
        u1 (copy, index: 5)
        u8 (copy, index: 6)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 7)
        u11 (copy, index: 8)
        u14 (copy, index: 9)
    ]]
    local v141 = makeStagePart_upv_1(a2)
    v141.Shape = Enum.PartType.Ball
    v141.Size = Vector3.new(FRUIT_NINJA_CONFIG_upv_1.fruitDiameter, FRUIT_NINJA_CONFIG_upv_1.fruitDiameter, FRUIT_NINJA_CONFIG_upv_1.fruitDiameter)
    local v142 = makeSmoothPart_upv_1(a2)
    v142.Shape = Enum.PartType.Cylinder
    v142.Color = u6
    v142.Size = Vector3.new(1, 0.3199999928474426, 0.3199999928474426)
    v142.CFrame = u1
    local v143 = makeSmoothPart_upv_1(a2)
    v143.Color = u8
    v143.Size = Vector3.new(1.600000023841858, 0.6600000262260437, 0.3400000035762787)
    local v144 = Instance.new("SpecialMesh")
    v144.MeshType = Enum.MeshType.Sphere
    v144.Parent = v143
    v143.CFrame = u1
    local v145 = Instance.new("ParticleEmitter")
    v145.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v145.Rate = 60
    v145.Lifetime = NumberRange.new(0.3, 0.6)
    v145.Speed = NumberRange.new(3, 7)
    v145.EmissionDirection = Enum.NormalId.Top
    v145.Acceleration = Vector3.new(0, 14, 0)
    v145.SpreadAngle = Vector2.new(26, 26)
    v145.Rotation = NumberRange.new(0, 90)
    v145.RotSpeed = NumberRange.new(-180, 180)
    v145.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9), NumberSequenceKeypoint.new(1, 0.1)})
    v145.LightEmission = 1
    v145.Color = u11
    v145.Enabled = false
    v145.Parent = v141
    local tbl_21 = {}
    tbl_21.part = v141
    tbl_21.fuse = v145
    tbl_21.stem = v142
    tbl_21.leaf = v143
    tbl_21.stemY = FRUIT_NINJA_CONFIG_upv_1.fruitDiameter / 2
    tbl_21.y = FRUIT_NINJA_CONFIG_upv_1.launchY
    tbl_21.gravity = FRUIT_NINJA_CONFIG_upv_1.gravity
    tbl_21.cutRadius = FRUIT_NINJA_CONFIG_upv_1.fruitCutRadius
    tbl_21.color = u14
    return tbl_21
end
u28.makeSphereHalf = function(a1, a2)
    --[[
      name: makeSphereHalf
      line: 2275
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v146 = makeSmoothPart_upv_1(a2)
    v146.Shape = Enum.PartType.Ball
    v146.Size = Vector3.new(FRUIT_NINJA_CONFIG_upv_1.fruitDiameter, FRUIT_NINJA_CONFIG_upv_1.fruitDiameter, FRUIT_NINJA_CONFIG_upv_1.fruitDiameter)
    v146.CFrame = u1
    return v146
end
u28.buildBackdrop = function(a1, a2)
    --[[
      name: buildBackdrop
      line: 2282
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        waitForSceneryRoot_upv_1 (copy, index: 3)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 4)
    ]]
    a1.backdrop = makeFrontalBackdrop_upv_1(a1.stage, u2, Enum.Material.Wood)
    local BackdropFruitNinja_1 = waitForSceneryRoot_upv_1("FruitNinjaGameplay", "fruit-ninja")
    if BackdropFruitNinja_1 ~= nil then
        BackdropFruitNinja_1 = BackdropFruitNinja_1:FindFirstChild("BackdropFruitNinja")
    end
    if BackdropFruitNinja_1 ~= nil and BackdropFruitNinja_1:IsA("Model") then
        local v147 = BackdropFruitNinja_1:Clone()
        for _, v148 in v147:GetDescendants() do
            if v148:IsA("BasePart") then
                v148.Anchored = true
                v148.CanCollide = false
                v148.CanQuery = false
                v148.CanTouch = false
                v148.CastShadow = false
            end
        end
        local _, v149 = v147:GetBoundingBox()
        local v150 = CFrame.Angles(-1.5707963267948966, 0, 0)
        local v148 = math.max((a1.stage.frameHeight / 2) / math.tan(math.rad(a1.stage.camera.FieldOfView / 2)), 1)
        local v151 = (v148 + FRUIT_NINJA_CONFIG_upv_1.backdropDistance) / v148
        local v152 = math.max(((math.max(a1.stage.getFrameWidth(), FRUIT_NINJA_CONFIG_upv_1.spawnHalfWidthMax * 2) * v151) * 1.15) / math.max(v149.X, 0.1), ((a1.stage.frameHeight * v151) * 1.2) / math.max(v149.Z, 0.1), 1)
        v147:ScaleTo(v147:GetScale() * v152)
        v147:PivotTo(CFrame.new(a1.originX, a1.originY, a1.originZ - FRUIT_NINJA_CONFIG_upv_1.backdropDistance) * v150)
        v147.Parent = a2
        a1.backdrop.Transparency = 1
    else
        return nil
    end
end
u28.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 2321
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        readLightingFolderProfile_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        FRUIT_NINJA_STAGE_LIGHTING_upv_1 (copy, index: 4)
    ]]
    local v153 = waitForSceneryRoot_upv_1("FruitNinjaGameplay", "fruit-ninja")
    if v153 ~= nil then
        v153 = v153:FindFirstChild("Lighting")
    end
    if v153 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(v153, tbl_upv_1, FRUIT_NINJA_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u28.makeSplat = function(a1, a2)
    --[[
      name: makeSplat
      line: 2332
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        SPLAT_DECAL_TEXTURE_upv_1 (copy, index: 3)
    ]]
    local v154 = makeSmoothPart_upv_1(a2)
    v154.Transparency = 1
    v154.CFrame = u1
    local v155 = Instance.new("Decal")
    v155.Texture = SPLAT_DECAL_TEXTURE_upv_1
    v155.Face = Enum.NormalId.Back
    v155.Transparency = 1
    v155.Parent = v154
    local tbl_22 = {}
    tbl_22.part = v154
    tbl_22.decal = v155
    return tbl_22
end
u28.makeEffectChip = function(a1, a2, a3)
    --[[
      name: makeEffectChip
      line: 2347
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        tbl_upv_8 (copy, index: 3)
        tbl_upv_9 (copy, index: 4)
    ]]
    local v156 = makeSmoothPart_upv_1(a2)
    v156.Transparency = 1
    v156.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896)
    v156.CFrame = u1
    local v157 = Instance.new("BillboardGui")
    v157.Size = UDim2.fromScale(6, 1.3)
    v157.AlwaysOnTop = true
    v157.Parent = v156
    local v158 = Instance.new("TextLabel")
    v158.BackgroundTransparency = 1
    v158.Size = UDim2.fromScale(1, 1)
    v158.Font = Enum.Font.GothamBlack
    v158.TextScaled = true
    v158.TextColor3 = tbl_upv_8[a3]
    v158.TextStrokeTransparency = 0.5
    v158.Text = tbl_upv_9[a3]
    v158.Parent = v157
    local v159 = makeSmoothPart_upv_1(a2)
    v159.Material = Enum.Material.Neon
    v159.Color = tbl_upv_8[a3]
    v159.Size = Vector3.new(3.5999999046325684, 0.3499999940395355, 0.3499999940395355)
    v159.CFrame = u1
    local tbl_23 = {}
    tbl_23.kind = a3
    tbl_23.chip = v156
    tbl_23.bar = v159
    return tbl_23
end
u28.makeBurst = function(a1, a2, a3, a4)
    --[[
      name: makeBurst
      line: 2378
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    local v160 = Instance.new("ParticleEmitter")
    v160.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v160.Rate = 0
    v160.Lifetime = a3
    v160.Speed = a4
    v160.SpreadAngle = Vector2.new(180, 180)
    v160.Rotation = NumberRange.new(0, 360)
    v160.RotSpeed = NumberRange.new(-200, 200)
    v160.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9), NumberSequenceKeypoint.new(1, 0.2)})
    v160.LightEmission = 0.6
    v160.Parent = a2
    return v160
end
u27 = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: segmentPointDistance
      line: 2394
    ]]
    local v161 = a3 - a1
    local v162 = a4 - a2
    local v163 = v161 * v161 + v162 * v162
    local v164 = 0
    if v163 > 1e-06 then
        v164 = math.clamp((((a5 - a1) * v161) + ((a6 - a2) * v162)) / v163, 0, 1)
    end
    local v165 = a5 - (a1 + (v161 * v164))
    local v166 = a6 - (a2 + (v162 * v164))
    return (math.sqrt((v165 * v165) + (v166 * v166)))
end
local tbl_24 = {}
tbl_24.FruitNinjaGame = u28
return tbl_24