-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local KNIFE_HIT_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").KNIFE_HIT_STAGE_LIGHTING
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target")
local minAngleDiff_upv_1 = v3.minAngleDiff
local normalizeAngle_upv_1 = v3.normalizeAngle
local overlapsAny_upv_1 = v3.overlapsAny
local TAU_upv_1 = v3.TAU
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v4 = RuntimeLib_1.import(script, script.Parent, "knife-hit-assets")
local AuthoredAppleVisual_upv_1 = v4.AuthoredAppleVisual
local AuthoredKnifeVisual_upv_1 = v4.AuthoredKnifeVisual
local AuthoredLogShatter_upv_1 = v4.AuthoredLogShatter
local cloneLogVisual_upv_1 = v4.cloneLogVisual
local KnifeHitAssets_upv_1 = v4.KnifeHitAssets
local v5 = RuntimeLib_1.import(script, script.Parent, "knife-hit-config")
local KNIFE_HIT_CONFIG_upv_1 = v5.KNIFE_HIT_CONFIG
local KNIFE_ROTATION_BANDS_upv_1 = v5.KNIFE_ROTATION_BANDS
local u1 = Color3.fromRGB(138, 99, 67)
local u2 = Color3.fromRGB(135, 62, 38)
local u3 = CFrame.new(0, -1000, 0)
local u4 = Color3.fromRGB(112, 78, 50)
local u5 = Color3.fromRGB(148, 106, 68)
local u6 = Color3.fromRGB(92, 62, 38)
local u7 = Color3.fromRGB(214, 220, 230)
local u8 = Color3.fromRGB(74, 50, 34)
local u9 = Color3.fromRGB(255, 90, 100)
local u10 = Color3.fromRGB(232, 64, 58)
local u11 = Color3.fromRGB(255, 216, 102)
local u12 = CFrame.new(0, -1.2000000476837158, 0)
local u13 = CFrame.new(0, 2.299999952316284, 0)
local u14 = u12:Inverse()
local tbl_upv_1 = {{}, {}, {}, {}}
local u15 = TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u16 = math.floor(360 / (KNIFE_HIT_CONFIG_upv_1.collisionArcDegrees * 2)) - KNIFE_HIT_CONFIG_upv_1.preStuckMax
local u17 = Color3.fromRGB(16, 12, 11)
local u18 = Color3.fromRGB(255, 216, 128)
local tbl_upv_2 = {"constant", "pulse", "reverse", "oscillate"}
local tbl_upv_3 = {"constant", "pulse", "reverse", "oscillate"}
local u19 = ColorSequence.new(Color3.fromRGB(255, 150, 40), Color3.fromRGB(255, 90, 20))
local u20 = ColorSequence.new(Color3.fromRGB(90, 170, 255), Color3.fromRGB(50, 90, 255))
local u21 = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 80)), ColorSequenceKeypoint.new(0.25, Color3.fromRGB(255, 220, 60)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(80, 255, 140)), ColorSequenceKeypoint.new(0.75, Color3.fromRGB(80, 160, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 90, 255))})
local u22 = Color3.fromRGB(245, 245, 255)
local function comboBannerColor_1(a1)
    --[[
      name: comboBannerColor
      line: 126
      upvalues:
        u11 (copy, index: 1)
        u20 (copy, index: 2)
        u19 (copy, index: 3)
        u22 (copy, index: 4)
    ]]
    if a1 < 10 then
        if a1 < 6 then
            if a1 < 3 then
                return u22
            end
            return u19.Keypoints[1].Value
        end
        return u20.Keypoints[1].Value
    end
    return u11
end
local tbl_upv_4 = {}
tbl_upv_4.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_4.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_4.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_4.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local makeBurstEmitter = nil
local throwEase = nil
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 164
    ]]
    return "KnifeHitGame"
end
tbl_6.__index = BaseWorldGame_upv_1
local u26 = setmetatable(tbl_5, tbl_6)
u26.__index = u26
u26.new = function(...)
    --[[
      name: new
      line: 170
      upvalues:
        u26 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u26)
    return v6:constructor(...) or v6
end
u26.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 174
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.grainMarks = {}
    a1.knives = {}
    a1.indicators = {}
    a1.chunks = {}
    a1.appleParts = {}
    a1.flames = {}
    a1.combo = 0
    a1.lastStickAt = 0
    a1.logIntact = true
    a1.logAngle = 0
    a1.direction = 1
    a1.speed = math.rad(KNIFE_HIT_CONFIG_upv_1.speedStartDegrees)
    a1.stuck = {}
    a1.apples = {}
    a1.wave = 1
    a1.knivesLeft = KNIFE_HIT_CONFIG_upv_1.knivesFirstWave
    a1.reversalTimer = 0
    a1.rotationPattern = "constant"
    a1.patternPhase = 0
    a1.directionBlend = 1
    a1.oscillateCenter = 0
    a1.oscillateAmplitude = 1
    a1.oscillateSwings = 0
    a1.logJolt = 0
    a1.waveBreakTimer = 0
    a1.slowThrowsLeft = 0
    a1.score = 0
    a1.throwQueued = false
    a1.lastThrowAt = 0
    a1.dead = false
    a1.roundToken = 0
    a1.sceneToken = 0
    a1.random = Random.new()
    a1.waveRandom = Random.new()
    a1.authoredLogOn = false
    a1.authoredKnifeOn = false
    a1.authoredAppleOn = false
    a1.authoredKnives = {}
    a1.replicaKnives = {}
    a1.replicaAuthoredKnives = {}
    a1.replicaStuckCount = 0
    a1.replicaFlights = {}
    a1.authoredApples = {}
end
local function flameSizeSequence_upv_1(a1)
    --[[
      name: flameSizeSequence
      line: 121
    ]]
    return NumberSequence.new({NumberSequenceKeypoint.new(0, a1), NumberSequenceKeypoint.new(1, a1 * 0.2)})
end
local function u23(a1)
    --[[
      name: buildScene
      line: 220
      upvalues:
        KnifeHitAssets_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 3)
        u4 (copy, index: 4)
        u5 (copy, index: 5)
        cloneLogVisual_upv_1 (copy, index: 6)
        AuthoredLogShatter_upv_1 (copy, index: 7)
        tbl_upv_1 (copy, index: 8)
        u6 (copy, index: 9)
        u23 (ref,  index: 10)
        AuthoredKnifeVisual_upv_1 (copy, index: 11)
        makeSmoothPart_upv_1 (copy, index: 12)
        u17 (copy, index: 13)
        u7 (copy, index: 14)
        u8 (copy, index: 15)
        u18 (copy, index: 16)
        makeBurstEmitter (ref,  index: 17)
        u10 (copy, index: 18)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 19)
        flameSizeSequence_upv_1 (copy, index: 20)
        u2 (copy, index: 21)
        AuthoredAppleVisual_upv_1 (copy, index: 22)
        PopupTextPool_upv_1 (copy, index: 23)
    ]]
    a1.assets = KnifeHitAssets_upv_1.new()
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1:buildBackdrop(container_1)
    a1.log = makeStagePart_upv_1(container_1)
    a1.log.Shape = Enum.PartType.Cylinder
    a1.log.Size = Vector3.new(KNIFE_HIT_CONFIG_upv_1.logThickness, KNIFE_HIT_CONFIG_upv_1.logRadius * 2, KNIFE_HIT_CONFIG_upv_1.logRadius * 2)
    a1.log.Color = u4
    a1.log.CFrame = CFrame.new(origin_1) * CFrame.Angles(0, 1.5707963267948966, 0)
    a1.logFace = makeStagePart_upv_1(container_1)
    a1.logFace.Shape = Enum.PartType.Cylinder
    a1.logFace.Size = Vector3.new(KNIFE_HIT_CONFIG_upv_1.logThickness * 0.5, KNIFE_HIT_CONFIG_upv_1.logRadius * 1.6, KNIFE_HIT_CONFIG_upv_1.logRadius * 1.6)
    a1.logFace.Color = u5
    local v7
    v7 = not (KNIFE_HIT_CONFIG_upv_1.useAuthoredLog) or a1.assets.log == nil or cloneLogVisual_upv_1(a1.assets.log, container_1, KNIFE_HIT_CONFIG_upv_1.logRadius * 2)
    if v7 ~= nil and a1.assets.log ~= nil then
        a1.authoredLogOn = true
        a1.authoredLog = v7
        a1.log.Transparency = 1
        a1.logFace.Transparency = 1
        local v8 = AuthoredLogShatter_upv_1.new(a1.assets.log, container_1, KNIFE_HIT_CONFIG_upv_1.logRadius * 2, {speed = KNIFE_HIT_CONFIG_upv_1.logQuarterBurstSpeed, up = KNIFE_HIT_CONFIG_upv_1.logQuarterBurstUp, spin = KNIFE_HIT_CONFIG_upv_1.logQuarterBurstSpin})
        if v8:isAvailable() then
            a1.authoredLogShatter = v8
        end
    end
    if not (a1.authoredLogOn) then
        local v9 = nil
        for _, value_1 in tbl_upv_1 do
            v9 = makeStagePart_upv_1(container_1)
            v9.Shape = Enum.PartType.Cylinder
            v9.Size = Vector3.new(0.4, value_1.size, value_1.size)
            v9.Color = u6
            table.insert(a1.grainMarks, v9)
        end
    end
    for _ = 0, KNIFE_HIT_CONFIG_upv_1.knifePoolSize - 1 do
        table.insert(a1.knives, (a1:makeKnife(container_1)))
    end
    a1.waitingKnife = a1:makeKnife(container_1)
    if KNIFE_HIT_CONFIG_upv_1.useAuthoredKnife and a1.assets.knife ~= nil then
        a1.authoredKnifeOn = true
        for _, value_2 in a1.knives do
            u23(value_2)
            table.insert(a1.authoredKnives, (AuthoredKnifeVisual_upv_1.new(a1.assets.knife, container_1, 7)))
        end
        u23(a1.waitingKnife)
        a1.authoredWaitingKnife = AuthoredKnifeVisual_upv_1.new(a1.assets.knife, container_1, 7)
    end
    a1.throwStreak = makeStagePart_upv_1(container_1)
    a1.throwStreak.Size = Vector3.new(0.5, 9, 0.20000000298023224)
    a1.throwStreak.Color = Color3.fromRGB(255, 255, 255)
    a1.throwStreak.Transparency = 1
    a1.indicatorRack = makeSmoothPart_upv_1(container_1)
    a1.indicatorRack.Color = u17
    a1.indicatorRack.Material = Enum.Material.SmoothPlastic
    a1.indicatorRack.Transparency = 0.4
    for _ = 0, 7 do
        local v10 = makeStagePart_upv_1(container_1)
        v10.Size = Vector3.new(0.5199999809265137, 1.5499999523162842, 0.25999999046325684)
        v10.Color = u7
        v10.Material = Enum.Material.Metal
        v10.Reflectance = 0.12
        local v11 = makeStagePart_upv_1(container_1)
        v11.Size = Vector3.new(0.4399999976158142, 0.7200000286102295, 0.30000001192092896)
        v11.Color = u8
        table.insert(a1.indicators, {blade = v10, handle = v11})
    end
    a1.overflowAnchor = makeSmoothPart_upv_1(container_1)
    a1.overflowAnchor.Transparency = 1
    a1.overflowAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    local v12 = Instance.new("BillboardGui")
    v12.Size = UDim2.fromScale(4.2, 2.2)
    v12.StudsOffset = Vector3.new(2.5, 0, 0)
    v12.AlwaysOnTop = true
    v12.Parent = a1.overflowAnchor
    local v13 = Instance.new("TextLabel")
    v13.BackgroundTransparency = 1
    v13.Size = UDim2.fromScale(1, 1)
    v13.Font = Enum.Font.GothamBlack
    v13.TextScaled = true
    v13.TextColor3 = u18
    v13.TextXAlignment = Enum.TextXAlignment.Left
    v13.TextStrokeTransparency = 0.35
    v13.Visible = false
    v13.Parent = v12
    a1.overflowLabel = v13
    a1.impactAnchor = makeStagePart_upv_1(container_1)
    a1.impactAnchor.Transparency = 1
    a1.impactAnchor.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    a1.woodChips = makeBurstEmitter(a1.impactAnchor, ColorSequence.new(u6, u4), 0.45, 0.4)
    a1.appleJuice = makeBurstEmitter(a1.impactAnchor, ColorSequence.new(u10), 0.5, 0.7)
    a1.sparks = makeBurstEmitter(a1.impactAnchor, ColorSequence.new(Color3.fromRGB(255, 240, 180)), 0.3, 1)
    for n_1 = 0, 13 do
        local v14 = (n_1 / 14) * math.pi * 2
        local v15 = makeSmoothPart_upv_1(container_1)
        v15.Transparency = 1
        v15.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
        v15.CFrame = CFrame.new(origin_1 + Vector3.new(math.cos(v14) * KNIFE_HIT_CONFIG_upv_1.logRadius, math.sin(v14) * KNIFE_HIT_CONFIG_upv_1.logRadius, -1.8))
        local v16 = Instance.new("ParticleEmitter")
        v16.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
        v16.Rate = 0
        v16.Lifetime = NumberRange.new(0.4, 0.8)
        v16.Speed = NumberRange.new(3, 6)
        v16.EmissionDirection = Enum.NormalId.Top
        v16.Acceleration = Vector3.new(0, 22, 0)
        v16.SpreadAngle = Vector2.new(22, 22)
        v16.Rotation = NumberRange.new(0, 90)
        v16.RotSpeed = NumberRange.new(-140, 140)
        v16.Size = flameSizeSequence_upv_1(1.3)
        v16.LightEmission = 0.9
        v16.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1)})
        v16.Parent = v15
        table.insert(a1.flames, v16)
    end
    local v17 = makeStagePart_upv_1(container_1)
    v17.Transparency = 1
    v17.Size = Vector3.new(70, 1, 1)
    v17.CFrame = CFrame.new(origin_1 + Vector3.new(0, -20, -8))
    a1.ambientMotes = Instance.new("ParticleEmitter")
    a1.ambientMotes.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    a1.ambientMotes.Rate = 0
    a1.ambientMotes.Lifetime = NumberRange.new(3, 5)
    a1.ambientMotes.Speed = NumberRange.new(1.5, 3)
    a1.ambientMotes.SpreadAngle = Vector2.new(10, 10)
    a1.ambientMotes.Size = NumberSequence.new(0.3)
    a1.ambientMotes.LightEmission = 0.7
    a1.ambientMotes.EmissionDirection = Enum.NormalId.Top
    local tbl_7 = {NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0.5), NumberSequenceKeypoint.new(1, 1)}
    a1.ambientMotes.Transparency = NumberSequence.new(tbl_7)
    a1.ambientMotes.Parent = v17
    if a1.authoredLogShatter == nil then
        local v18 = nil
        for _ = 0, KNIFE_HIT_CONFIG_upv_1.chunkPoolSize - 1 do
            local v19 = makeStagePart_upv_1(container_1)
            v19.Size = Vector3.new(2.4, 2.8, KNIFE_HIT_CONFIG_upv_1.logThickness)
            if a1.authoredLogOn then
                v18 = u2
            else
                v18 = u4
            end
            v19.Color = v18
            table.insert(a1.chunks, v19)
        end
    end
    for _ = 0, 2 do
        local v20 = makeStagePart_upv_1(container_1)
        v20.Shape = Enum.PartType.Ball
        v20.Size = Vector3.new(KNIFE_HIT_CONFIG_upv_1.appleDiameter, KNIFE_HIT_CONFIG_upv_1.appleDiameter, KNIFE_HIT_CONFIG_upv_1.appleDiameter)
        v20.Color = u10
        table.insert(a1.appleParts, v20)
    end
    if KNIFE_HIT_CONFIG_upv_1.useAuthoredApple and a1.assets.apple ~= nil then
        a1.authoredAppleOn = true
        local tbl_8 = {}
        tbl_8.speed = KNIFE_HIT_CONFIG_upv_1.appleHalfBurstSpeed
        tbl_8.up = KNIFE_HIT_CONFIG_upv_1.appleHalfBurstUp
        tbl_8.spin = KNIFE_HIT_CONFIG_upv_1.appleHalfBurstSpin
        for _, value_3 in a1.appleParts do
            value_3.Transparency = 1
        end
        for _ = 0, #a1.appleParts - 1 do
            table.insert(a1.authoredApples, (AuthoredAppleVisual_upv_1.new(a1.assets.apple, container_1, tbl_8)))
        end
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 5)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 430
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    a1:applyAuthoredLighting()
end
u26.buildScene = u23
u26.resetRound = function(a1)
    --[[
      name: resetRound
      line: 435
    ]]
    a1.logAngle = 0
    a1.direction = 1
    a1.wave = 1
    a1.slowThrowsLeft = 0
    a1.score = 0
    a1.throwQueued = false
    a1.flight = nil
    a1.dead = false
    a1.waveBreakTimer = 0
    a1.combo = 0
    a1.lastStickAt = 0
    a1.logJolt = 0
    a1.roundToken = a1.roundToken + 1
    a1.sceneToken = a1.sceneToken + 1
    a1:applyComboLook()
    a1:startWave()
    a1.context.reportScore(0)
end
u26.captureRound = function(a1)
    --[[
      name: captureRound
      line: 454
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 458
              upvalues:
                a1 (copy, index: 1)
                tbl_upv_3 (copy, index: 2)
            ]]
            a2:int(a1.score):int(a1.wave):int(a1.knivesLeft):int(a1.combo)
            a2:int(a1.slowThrowsLeft):num(a1.waveBreakTimer)
            a2:num(a1.logAngle):int(a1.direction):num(a1.speed):num(a1.reversalTimer)
            a2:int((math.max((table.find(tbl_upv_3, a1.rotationPattern) or 0) - 1, 0)))
            a2:num(a1.patternPhase):num(a1.directionBlend)
            a2:num(a1.oscillateCenter):num(a1.oscillateAmplitude):int(a1.oscillateSwings)
            a2:int(#a1.stuck)
            for _, value_4 in a1.stuck do
                a2:num(value_4)
            end
            a2:int(#a1.apples)
            for _, value_5 in a1.apples do
                a2:num(value_5.angle):bool(value_5.eaten)
            end
        end
    )
end
u26.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 477
      upvalues:
        readResume_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    local v21 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 478
              upvalues:
                tbl_upv_3 (copy, index: 1)
            ]]
            local tbl_9 = {}
            tbl_9.score = a3:int()
            tbl_9.wave = a3:int()
            tbl_9.knivesLeft = a3:int()
            tbl_9.combo = a3:int()
            tbl_9.slowThrowsLeft = a3:int()
            tbl_9.waveBreakTimer = a3:num()
            tbl_9.logAngle = a3:num()
            tbl_9.direction = a3:int()
            tbl_9.speed = a3:num()
            tbl_9.reversalTimer = a3:num()
            tbl_9.pattern = tbl_upv_3[a3:int() + 1]
            tbl_9.patternPhase = a3:num()
            tbl_9.directionBlend = a3:num()
            tbl_9.oscillateCenter = a3:num()
            tbl_9.oscillateAmplitude = a3:num()
            tbl_9.oscillateSwings = a3:int()
            if tbl_9.pattern == nil then
                error("knife-hit: bad rotation pattern")
            end
            local v22 = a3:int()
            local tbl_10 = {}
            local v23 = 0
            local tbl_11 = false
            tbl_11, v23 = tbl_11, v23
            while true do
                if tbl_11 then
                    v23 = v23 + 1
                else
                    tbl_11 = true
                end
                if v23 >= v22 then
                    break
                end
                table.insert(tbl_10, (a3:num()))
            end
            v23 = a3:int()
            tbl_11 = {}
            local v24 = 0
            local v25 = false
            v25, v24 = v25, v24
            while true do
                if v25 then
                    v24 = v24 + 1
                else
                    v25 = true
                end
                if v24 >= v23 then
                    break
                end
                table.insert(tbl_11, {angle = a3:num(), eaten = a3:bool()})
            end
            v24 = table.clone(tbl_9)
            setmetatable(v24, nil)
            v24.stuck = tbl_10
            v24.apples = tbl_11
            return v24
        end
    )
    if v21 ~= nil and v21.wave >= 1 and #a1.knives >= #v21.stuck then
        a1.wave = v21.wave
        a1:startWave()
        a1.score = a2.score
        a1.knivesLeft = v21.knivesLeft
        a1.combo = v21.combo
        a1.slowThrowsLeft = v21.slowThrowsLeft
        a1.waveBreakTimer = v21.waveBreakTimer
        a1.logAngle = v21.logAngle
        a1.direction = ((v21.direction >= 0) and 1) or -1
        a1.speed = v21.speed
        a1.reversalTimer = v21.reversalTimer
        a1.rotationPattern = v21.pattern
        a1.patternPhase = v21.patternPhase
        a1.directionBlend = v21.directionBlend
        a1.oscillateCenter = v21.oscillateCenter
        a1.oscillateAmplitude = v21.oscillateAmplitude
        a1.oscillateSwings = v21.oscillateSwings
        a1.stuck = v21.stuck
        a1.apples = v21.apples
        a1.flight = nil
        a1.throwQueued = false
        a1.dead = false
        a1.logJolt = 0
        a1.lastStickAt = 0
        a1.roundToken = a1.roundToken + 1
        a1.sceneToken = a1.sceneToken + 1
        a1:applyComboLook()
        a1:placeWaitingKnife()
        a1:updateIndicators()
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u26.snapshot = function(a1)
    --[[
      name: snapshot
      line: 585
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
    ]]
    local tbl_12 = {}
    table.insert(tbl_12, a1.wave)
    for _, value_6 in a1.stuck do
        if #tbl_12 >= 20 then
            break
        else
            table.insert(tbl_12, (math.deg(normalizeAngle_upv_1(value_6 + a1.logAngle))))
        end
    end
    local tbl_13 = {}
    tbl_13.score = a1.score
    tbl_13.values = tbl_12
    return tbl_13
end
u26.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 601
    ]]
    a1.matchOpponents = a2
    if #a1.replicaKnives == 0 and a1.stage.getPeerWindowOffsetX() ~= nil then
        a1:buildReplica()
    end
    a1:refreshReplica()
end
u26.buildReplica = function(a1)
    --[[
      name: buildReplica
      line: 608
      upvalues:
        cloneLogVisual_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        u3 (copy, index: 3)
        AuthoredKnifeVisual_upv_1 (copy, index: 4)
    ]]
    local container_2 = a1.stage.container
    a1.replicaLogAuthored = not (a1.authoredLogOn) or a1.assets.log == nil or cloneLogVisual_upv_1(a1.assets.log, container_2, KNIFE_HIT_CONFIG_upv_1.logRadius * 2)
    if a1.replicaLogAuthored == nil then
        local v26 = a1.log:Clone()
        v26.Transparency = 0
        v26.Parent = container_2
        a1.replicaLogProcedural = v26
    end
    for _ = 0, 19 do
        local v27 = a1.waitingKnife.blade:Clone()
        local v28 = a1.waitingKnife.handle:Clone()
        local v29 = not a1.authoredKnifeOn
        v27.Transparency = (v29 and 0) or 1
        v28.Transparency = (v29 and 0) or 1
        v27.CFrame = u3
        v28.CFrame = u3
        v27.Parent = container_2
        v28.Parent = container_2
        table.insert(a1.replicaKnives, {blade = v27, handle = v28})
        if (a1.authoredKnifeOn) and a1.assets.knife ~= nil then
            table.insert(a1.replicaAuthoredKnives, (AuthoredKnifeVisual_upv_1.new(a1.assets.knife, container_2, 7)))
        end
    end
end
local function u24(a1)
    --[[
      name: refreshReplica
      line: 642
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        u24 (ref,  index: 3)
        u14 (copy, index: 4)
    ]]
    local v30 = nil
    if #a1.replicaKnives ~= 0 then
        local v31 = a1.stage.getPeerWindowOffsetX()
        v30 = a1.matchOpponents
        if v30 ~= nil then
            v30 = v30[1]
            if v30 ~= nil then
                v30 = v30.snapshot
            end
        end
        if v31 == nil then
            return nil
        else
            local v32, v33 = nil, nil
            if v30 ~= nil then
                local v34 = a1.stage.origin + Vector3.new(v31, 0, 0)
                local v35 = CFrame.new(v34) * CFrame.Angles(0, 1.5707963267948966, 0)
                v32 = a1.replicaLogAuthored
                if v32 ~= nil then
                    v32:PivotTo(v35)
                end
                if a1.replicaLogProcedural ~= nil then
                    a1.replicaLogProcedural.CFrame = v35
                end
                local values_1 = v30.values
                v33 = math.min(math.max(#values_1 - 1, 0), #a1.replicaKnives)
                local v38 = nil
                if v33 >= a1.replicaStuckCount then
                    local replicaStuckCount_1 = a1.replicaStuckCount
                    local v36 = false
                    v36, replicaStuckCount_1 = v36, replicaStuckCount_1
                    if v36 then
                        replicaStuckCount_1 = replicaStuckCount_1 + 1
                    else
                        v36 = true
                    end
                    while replicaStuckCount_1 < v33 do
                        v38 = values_1[(1 + replicaStuckCount_1) + 1]
                        if v38 ~= nil then
                            table.insert(a1.replicaFlights, {index = replicaStuckCount_1, angle = math.rad(v38), startedAt = os.clock()})
                        end
                        if v36 then
                            replicaStuckCount_1 = replicaStuckCount_1 + 1
                        else
                            v36 = true
                        end
                    end
                else
                    table.clear(a1.replicaFlights)
                end
                a1.replicaStuckCount = v33
                for n_2 = 0, #a1.replicaKnives - 1 do
                    local v39 = a1.replicaKnives[n_2 + 1]
                    local v40 = values_1[(n_2 + 1) + 1]
                    v38 = false
                    for _, value_7 in a1.replicaFlights do
                        if value_7.index == n_2 then
                            v38 = true
                            break
                        end
                    end
                    if v38 then
                        continue
                    end
                    local v41 = nil
                    if v40 ~= nil then
                        v41 = math.rad(v40)
                        u24(v39, v34 + Vector3.new(-math.sin(v41), math.cos(v41), 0) * ((KNIFE_HIT_CONFIG_upv_1.logRadius + 3.5) - KNIFE_HIT_CONFIG_upv_1.knifeEmbed), v41)
                    else
                        v39.blade.CFrame = u3
                        v39.handle.CFrame = u3
                    end
                    v41 = a1.replicaAuthoredKnives[n_2 + 1]
                    if v41 ~= nil then
                        v41:follow(v39.blade.CFrame * u14)
                    end
                end
            else
                return nil
            end
        end
    else
        return nil
    end
end
u26.refreshReplica = u24
u24 = function(a1)
    --[[
      name: animateReplicaFlights
      line: 740
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
        u24 (ref,  index: 2)
        throwEase (ref,  index: 3)
        u14 (copy, index: 4)
    ]]
    local v42 = nil
    if #a1.replicaFlights ~= 0 then
        v42 = a1.stage.getPeerWindowOffsetX()
        if v42 ~= nil then
            local v43 = a1.stage.origin + Vector3.new(v42, 0, 0)
            local v44 = v43 + Vector3.new(0, -(KNIFE_HIT_CONFIG_upv_1.logRadius + 9), 0)
            local v45 = os.clock()
            for n_3 = #a1.replicaFlights - 1, 0, -1 do
                local v46 = a1.replicaFlights[n_3 + 1]
                local v47
                v47 = a1.replicaKnives[v46.index + 1]
                if v47 == nil then
                    table.remove(a1.replicaFlights, n_3 + 1)
                    continue
                end
                local v48 = v43 + Vector3.new(-math.sin(v46.angle), math.cos(v46.angle), 0) * ((KNIFE_HIT_CONFIG_upv_1.logRadius + 3.5) - KNIFE_HIT_CONFIG_upv_1.knifeEmbed)
                local v49
                v49 = (v45 - v46.startedAt) / 0.14
                if v49 < 1 then
                    u24(v47, v44:Lerp(v48, throwEase(v49)), v46.angle)
                else
                    u24(v47, v48, v46.angle)
                    table.remove(a1.replicaFlights, n_3 + 1)
                end
                local v50
                v50 = a1.replicaAuthoredKnives[v46.index + 1]
                if v50 ~= nil then
                    v50:follow(v47.blade.CFrame * u14)
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u26.animateReplicaFlights = u24
u26.revive = function(a1)
    --[[
      name: revive
      line: 782
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.dead = false
    a1.throwQueued = false
    a1.flight = nil
    a1.roundToken = a1.roundToken + 1
    a1.slowThrowsLeft = KNIFE_HIT_CONFIG_upv_1.reviveSlowThrows
    a1:placeWaitingKnife()
    a1:setRunning(true)
end
u26.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 791
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    if a1.logJolt > 0 then
        a1.logJolt = a1.logJolt >= 0.005 and a1.logJolt * math.exp(-KNIFE_HIT_CONFIG_upv_1.stickJoltSettleRate * a2) or 0
    end
    if a1.combo > 0 and KNIFE_HIT_CONFIG_upv_1.comboWindowSeconds < os.clock() - a1.lastStickAt then
        a1.combo = 0
        a1:applyComboLook()
    end
    if a1.waveBreakTimer <= 0 then
        a1:advanceRotation(a1.speed * (((a1.slowThrowsLeft <= 0) and 1) or (KNIFE_HIT_CONFIG_upv_1.reviveSlowMultiplier)), a2)
        if a1.flight ~= nil then
            a1.flight.progress = math.min(a1.flight.progress + (a2 / KNIFE_HIT_CONFIG_upv_1.throwFlightSeconds), 1)
            if a1.flight.progress >= 1 then
                a1:resolveFlightArrival()
            end
        end
        if a1.throwQueued and a1.flight == nil then
            a1.throwQueued = false
            a1:throwKnife()
        end
    else
        a1.waveBreakTimer = a1.waveBreakTimer - a2
        if a1.waveBreakTimer <= 0 then
            a1:startWave()
        end
        return nil
    end
end
u26.advanceRotation = function(a1, a2, a3)
    --[[
      name: advanceRotation
      line: 827
      upvalues:
        TAU_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        normalizeAngle_upv_1 (copy, index: 3)
    ]]
    if a1.rotationPattern == "pulse" then
        a1.patternPhase = a1.patternPhase + ((TAU_upv_1 / KNIFE_HIT_CONFIG_upv_1.pulsePeriodSeconds) * a3)
        a1.logAngle = normalizeAngle_upv_1(a1.logAngle + (((a1.direction * a2) * (KNIFE_HIT_CONFIG_upv_1.pulseMinMultiplier + ((1 - KNIFE_HIT_CONFIG_upv_1.pulseMinMultiplier) * (0.5 - (math.cos(a1.patternPhase) * 0.5))))) * a3))
        return nil
    elseif a1.rotationPattern ~= "reverse" then
        local v52 = nil
        if a1.rotationPattern ~= "oscillate" then
            a1.logAngle = normalizeAngle_upv_1(a1.logAngle + ((a1.direction * a2) * a3))
        else
            v52 = a1.patternPhase
            a1.patternPhase = a1.patternPhase + ((a2 / a1.oscillateAmplitude) * a3)
            a1.oscillateCenter = normalizeAngle_upv_1(a1.oscillateCenter + (((a1.direction * a2) * KNIFE_HIT_CONFIG_upv_1.oscillateDriftFraction) * a3))
            a1.logAngle = normalizeAngle_upv_1(a1.oscillateCenter + (a1.oscillateAmplitude * math.sin(a1.patternPhase)))
            if math.floor((v52 + 1.5707963267948966) / math.pi) < math.floor((a1.patternPhase + 1.5707963267948966) / math.pi) then
                a1.oscillateSwings = a1.oscillateSwings + 1
                if KNIFE_HIT_CONFIG_upv_1.oscillateSwingsPerRoll <= a1.oscillateSwings then
                    a1:rollOscillation(a1.logAngle)
                end
            end
            return nil
        end
    else
        a1.reversalTimer = a1.reversalTimer - a3
        if a1.reversalTimer <= 0 then
            a1.direction = a1.direction * -1
            a1.reversalTimer = a1.waveRandom:NextNumber(KNIFE_HIT_CONFIG_upv_1.reversalMinSeconds, KNIFE_HIT_CONFIG_upv_1.reversalMaxSeconds)
        end
        local v53 = KNIFE_HIT_CONFIG_upv_1.reverseRampRate * a3
        a1.directionBlend = a1.directionBlend + math.clamp(a1.direction - a1.directionBlend, -v53, v53)
        a1.logAngle = normalizeAngle_upv_1(a1.logAngle + ((a1.directionBlend * a2) * a3))
        return nil
    end
end
u26.rollOscillation = function(a1, a2)
    --[[
      name: rollOscillation
      line: 871
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.oscillateAmplitude = math.rad(a1.waveRandom:NextNumber(KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMinDegrees, KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMaxDegrees))
    local v54 = -a1.direction
    a1.oscillateCenter = a2 - (v54 * a1.oscillateAmplitude)
    a1.patternPhase = ((v54 <= 0) and -1.5707963267948966) or 1.5707963267948966
    a1.oscillateSwings = 0
end
u26.pickPattern = function(a1)
    --[[
      name: pickPattern
      line: 879
      upvalues:
        KNIFE_ROTATION_BANDS_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v55 = KNIFE_ROTATION_BANDS_upv_1[1]
    for _, value_8 in KNIFE_ROTATION_BANDS_upv_1 do
        if value_8.fromWave <= a1.wave then
            v55 = value_8
        end
    end
    local v57 = 0
    for _, value_9 in tbl_upv_2 do
        v57 = v57 + v55.weights[value_9]
    end
    local v58
    v58 = a1.waveRandom:NextNumber(0, v57)
    for _, value_10 in tbl_upv_2 do
        v58 = v58 - v55.weights[value_10]
        if v58 > 0 then
            continue
        end
        return value_10
    end
    return "constant"
end
u24 = function(a1)
    --[[
      name: render
      line: 899
      upvalues:
        tbl_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        u24 (ref,  index: 3)
    ]]
    local v59 = ((a1.logJolt > 0) and (a1.stage.origin + Vector3.new(0, a1.logJolt, 0))) or (a1.stage.origin)
    a1.log.CFrame = (CFrame.new(v59) * CFrame.Angles(0, 0, a1.logAngle)) * CFrame.Angles(0, 1.5707963267948966, 0)
    a1.logFace.CFrame = (CFrame.new(v59 + Vector3.new(0, 0, 0.6000000238418579)) * CFrame.Angles(0, 0, a1.logAngle)) * CFrame.Angles(0, 1.5707963267948966, 0)
    if a1.logIntact then
        for n_4 = 0, #tbl_upv_1 - 1 do
            local v60 = tbl_upv_1[n_4 + 1]
            local v61
            v61 = a1.grainMarks[n_4 + 1]
            if v61 ~= nil then
                local v62 = v60.angle + a1.logAngle
                v61.CFrame = CFrame.new(v59 + Vector3.new(-math.sin(v62) * v60.radius, math.cos(v62) * v60.radius, 1)) * CFrame.Angles(0, 1.5707963267948966, 0)
            end
        end
    end
    if a1.logIntact then
        for n_5 = 0, #a1.stuck - 1 do
            if a1.flight ~= nil then
                local v63
                if a1.flight.knifeIndex == n_5 then
                    continue
                end
            end
            local v63
            v63 = a1.knives[n_5 + 1]
            if v63 ~= nil then
                local v64 = a1.stuck[n_5 + 1] + a1.logAngle
                u24(v63, v59 + Vector3.new(-math.sin(v64), math.cos(v64), 0) * ((KNIFE_HIT_CONFIG_upv_1.logRadius + 3.5) - KNIFE_HIT_CONFIG_upv_1.knifeEmbed), v64)
            end
        end
    end
    for n_6 = 0, #a1.apples - 1 do
        local v65
        v65 = a1.appleParts[n_6 + 1]
        local v66 = a1.apples[n_6 + 1]
        if v65 ~= nil and v66 ~= nil and not v66.eaten then
            local v67 = v66.angle + a1.logAngle
            v65.CFrame = CFrame.new(v59 + (Vector3.new(-math.sin(v67), math.cos(v67), 0) * (KNIFE_HIT_CONFIG_upv_1.logRadius + 1.2)))
        end
    end
    a1:renderFlight(v59)
    a1:poseAuthored()
end
u26.render = u24
u24 = function(a1, a2)
    --[[
      name: renderFlight
      line: 972
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
        u24 (ref,  index: 2)
        throwEase (ref,  index: 3)
    ]]
    local flight_1 = a1.flight
    local v68 = nil
    if flight_1 ~= nil then
        v68 = a1.knives[flight_1.knifeIndex + 1]
        if v68 ~= nil then
            local v69 = flight_1.targetRel + a1.logAngle
            u24(v68, (a2 + Vector3.new(0, -15.5, 0)):Lerp(a2 + (Vector3.new(-math.sin(v69), math.cos(v69), 0) * ((KNIFE_HIT_CONFIG_upv_1.logRadius + 3.5) - KNIFE_HIT_CONFIG_upv_1.knifeEmbed)), throwEase(flight_1.progress)), v69)
        else
            return nil
        end
    else
        return nil
    end
end
u26.renderFlight = u24
u26.onIdle = function(a1)
    --[[
      name: onIdle
      line: 991
    ]]
    a1:poseAuthored()
end
u26.logPose = function(a1)
    --[[
      name: logPose
      line: 996
    ]]
    local v70 = ((a1.logJolt > 0) and (a1.stage.origin + Vector3.new(0, a1.logJolt, 0))) or (a1.stage.origin)
    return (CFrame.new(v70) * CFrame.Angles(0, 0, a1.logAngle)) * CFrame.Angles(0, 1.5707963267948966, 0)
end
u26.poseAuthored = function(a1)
    --[[
      name: poseAuthored
      line: 1011
      upvalues:
        u3 (copy, index: 1)
        u14 (copy, index: 2)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1:animateReplicaFlights()
    if a1.authoredLog ~= nil then
        if a1.logIntact then
            a1.authoredLog:PivotTo(a1:logPose())
        else
            a1.authoredLog:PivotTo(u3)
        end
    end
    if a1.authoredKnifeOn then
        for n_7 = 0, #a1.knives - 1 do
            local v71
            v71 = a1.authoredKnives[n_7 + 1]
            local v72 = a1.knives[n_7 + 1]
            if v71 ~= nil and v72 ~= nil then
                v71:follow(v72.blade.CFrame * u14)
            end
        end
        if a1.authoredWaitingKnife ~= nil then
            a1.authoredWaitingKnife:follow(a1.waitingKnife.blade.CFrame * u14)
        end
    end
    if not a1.authoredAppleOn then
        return
    end
    for n_8 = 0, #a1.apples - 1 do
        local v73
        v73 = a1.apples[n_8 + 1]
        local v74 = a1.authoredApples[n_8 + 1]
        if v73 ~= nil and v74 ~= nil and not v73.eaten then
            local v75 = v73.angle + a1.logAngle
            v74:poseWhole(a1.stage.origin + (Vector3.new(-math.sin(v75), math.cos(v75), 0) * (KNIFE_HIT_CONFIG_upv_1.logRadius + 1.2)))
        end
    end
end
u26.buildBackdrop = function(a1, a2)
    --[[
      name: buildBackdrop
      line: 1050
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v76 = makeFrontalBackdrop_upv_1(a1.stage, u1, Enum.Material.Wood)
    if KNIFE_HIT_CONFIG_upv_1.useAuthoredBackdrop and a1.assets.backdrop ~= nil then
        local v77 = a1.assets.backdrop:Clone()
        for _, v78 in v77:GetDescendants() do
            if v78:IsA("BasePart") then
                v78.Anchored = true
                v78.CanCollide = false
                v78.CanQuery = false
                v78.CanTouch = false
                v78.CastShadow = false
            end
        end
        local _, v79 = v77:GetBoundingBox()
        local v80 = CFrame.Angles(-1.5707963267948966, 0, 0)
        local v78 = math.max((a1.stage.frameHeight / 2) / math.tan(math.rad(a1.stage.camera.FieldOfView / 2)), 1)
        local v81 = (v78 + KNIFE_HIT_CONFIG_upv_1.backdropDistance) / v78
        local v82 = math.max(((a1.stage.getFrameWidth() * v81) * 1.2) / math.max(v79.X, 0.1), ((a1.stage.frameHeight * v81) * 1.2) / math.max(v79.Z, 0.1), 1)
        v77:ScaleTo(v77:GetScale() * v82)
        local origin_2 = a1.stage.origin
        v77:PivotTo(CFrame.new(origin_2.X, origin_2.Y, origin_2.Z - KNIFE_HIT_CONFIG_upv_1.backdropDistance) * v80)
        v77.Parent = a2
        v76.Transparency = 1
    else
        return nil
    end
end
u26.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 1083
      upvalues:
        readLightingFolderProfile_upv_1 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
        KNIFE_HIT_STAGE_LIGHTING_upv_1 (copy, index: 3)
    ]]
    if a1.assets.lighting ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(a1.assets.lighting, tbl_upv_4, KNIFE_HIT_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u26.makeKnife = function(a1, a2)
    --[[
      name: makeKnife
      line: 1089
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        u8 (copy, index: 3)
    ]]
    local v83 = makeStagePart_upv_1(a2)
    v83.Size = Vector3.new(0.8999999761581421, 4.599999904632568, 0.5)
    v83.Color = u7
    v83.Material = Enum.Material.Metal
    local v84 = makeStagePart_upv_1(a2)
    v84.Size = Vector3.new(0.6499999761581421, 2.4000000953674316, 0.699999988079071)
    v84.Color = u8
    local v85 = Instance.new("WeldConstraint")
    v85.Part0 = v83
    v85.Part1 = v84
    v85.Parent = v83
    local tbl_14 = {}
    tbl_14.blade = v83
    tbl_14.handle = v84
    return tbl_14
end
u24 = function(a1)
    --[[
      name: placeWaitingKnife
      line: 1107
      upvalues:
        u24 (ref, index: 1)
    ]]
    u24(a1.waitingKnife, a1.stage.origin + Vector3.new(0, -15.5, 0), math.pi)
end
u26.placeWaitingKnife = u24
u26.updateIndicators = function(a1)
    --[[
      name: updateIndicators
      line: 1111
      upvalues:
        u3 (copy, index: 1)
    ]]
    local v86 = math.max(-24, (-a1.stage.getFrameWidth() / 2) + 2.6)
    local v87 = math.max(a1.knivesLeft, 0)
    local v88 = math.min(v87, 8)
    local v89 = v87 - v88
    for n_9 = 0, #a1.indicators - 1 do
        local v90 = a1.indicators[n_9 + 1]
        if v88 > n_9 then
            local v91 = a1.stage.origin + Vector3.new(v86, (n_9 * 2.35) + -14, 0)
            v90.blade.CFrame = CFrame.new(v91 + Vector3.new(0, 0.36000001430511475, 0))
            v90.handle.CFrame = CFrame.new(v91 - Vector3.new(0, 0.7749999761581421, 0))
        else
            v90.blade.CFrame = u3
            v90.handle.CFrame = u3
        end
    end
    if v88 <= 0 then
        a1.indicatorRack.CFrame = u3
    else
        a1.indicatorRack.Size = Vector3.new(1.6199999809265138, (((v88 - 1) * 2.35) + 2.2699999809265137) + 1.8, 0.3)
        a1.indicatorRack.CFrame = CFrame.new(a1.stage.origin + Vector3.new(v86, (((v88 - 1) * 2.35) / 2) + -14, -0.9))
    end
    if v89 > 0 and v88 > 0 then
        a1.overflowAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(v86, -14, 0))
        a1.overflowLabel.Text = ("\195\151%*"):format(v89)
        a1.overflowLabel.Visible = true
    else
        a1.overflowLabel.Visible = false
        a1.overflowAnchor.CFrame = u3
    end
end
u26.onPress = function(a1)
    --[[
      name: onPress
      line: 1158
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if not (a1.dead) and a1.waveBreakTimer <= 0 then
        local v92 = nil
        if a1.flight == nil then
            v92 = os.clock()
            if v92 - a1.lastThrowAt >= KNIFE_HIT_CONFIG_upv_1.minThrowIntervalSeconds then
                a1.lastThrowAt = v92
                a1.throwQueued = true
                return
            end
        end
        return nil
    end
    return nil
end
local function u25(a1)
    --[[
      name: throwKnife
      line: 1175
      upvalues:
        normalizeAngle_upv_1 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u15 (copy, index: 3)
        u25 (ref,  index: 4)
        overlapsAny_upv_1 (copy, index: 5)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 6)
    ]]
    local v93 = normalizeAngle_upv_1(math.pi - a1.logAngle)
    a1.context.audio.play("whoosh", {})
    a1.throwStreak.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -10.5, 0))
    a1.throwStreak.Transparency = 0.35
    TweenService_upv_1:Create(a1.throwStreak, u15, {}):Play()
    u25(a1.waitingKnife)
    if overlapsAny_upv_1(a1.stuck, v93, math.rad(KNIFE_HIT_CONFIG_upv_1.collisionArcDegrees)) then
        a1.flight = {knifeIndex = #a1.stuck, targetRel = v93}
        return nil
    else
        table.insert(a1.stuck, v93)
        a1.score = a1.score + 1
        a1.knivesLeft = a1.knivesLeft - 1
        if a1.slowThrowsLeft > 0 then
            a1.slowThrowsLeft = a1.slowThrowsLeft - 1
        end
        a1.context.reportScore(a1.score)
        local v94 = os.clock()
        a1.combo = ((v94 - a1.lastStickAt > KNIFE_HIT_CONFIG_upv_1.comboWindowSeconds) and 1) or (a1.combo + 1)
        a1.lastStickAt = v94
        a1:updateIndicators()
        a1.flight = {knifeIndex = #a1.stuck, targetRel = v93}
    end
end
u26.throwKnife = u25
u26.resolveFlightArrival = function(a1)
    --[[
      name: resolveFlightArrival
      line: 1226
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
        publishCombo_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
        u20 (copy, index: 4)
        u19 (copy, index: 5)
        u22 (copy, index: 6)
    ]]
    local flight_2 = a1.flight
    if flight_2 ~= nil then
        a1.flight = nil
        a1:resolveApples(flight_2.targetRel)
        local v95 = nil
        if flight_2.outcome ~= "clash" then
            a1.logJolt = math.min(a1.logJolt + KNIFE_HIT_CONFIG_upv_1.stickJoltStuds, KNIFE_HIT_CONFIG_upv_1.stickJoltMaxStuds)
            a1.context.audio.play("thud", {volume = math.min(0.45 + (a1.combo * 0.015), 0.58), pitch = math.max(1.12 - (a1.combo * 0.05), 0.72)})
            a1.stage.shake(KNIFE_HIT_CONFIG_upv_1.stickShake)
            a1.impactAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -KNIFE_HIT_CONFIG_upv_1.logRadius, 1))
            a1.woodChips:Emit(KNIFE_HIT_CONFIG_upv_1.stickChips)
            a1.sparks:Emit(KNIFE_HIT_CONFIG_upv_1.stickSparks)
            if a1.combo >= 2 then
                a1.context.audio.play("pop", {pitch = math.min(0.9 + (a1.combo * 0.09), 2)})
            end
            a1:applyComboLook()
            local v96 = {}
            v96.count = a1.combo
            v95 = a1.combo
            local v97
            if v95 < 10 then
                if v95 < 6 then
                    if v95 < 3 then
                        v97 = u22
                    else
                        v97 = u19.Keypoints[1].Value
                    end
                else
                    v97 = u20.Keypoints[1].Value
                end
            else
                v97 = u11
            end
            v96.color = v97
            publishCombo_upv_1(v96)
            local v98 = a1.knivesLeft <= 0
            if v98 then
                v96 = KNIFE_HIT_CONFIG_upv_1.explodeHitStopSeconds
            else
                v96 = KNIFE_HIT_CONFIG_upv_1.stickHitStopSeconds
            end
            if v96 > 0 then
                a1:hitStop(v96)
            end
            if v98 then
                a1:explodeWave()
            else
                a1:placeWaitingKnife()
            end
        else
            a1:die()
            return nil
        end
    else
        return nil
    end
end
u26.resolveApples = function(a1, a2)
    --[[
      name: resolveApples
      line: 1278
      upvalues:
        minAngleDiff_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
    ]]
    for n_10 = 0, #a1.apples - 1 do
        local v99
        v99 = a1.apples[n_10 + 1]
        if v99.eaten then
            continue
        end
        local v100
        v100 = minAngleDiff_upv_1(v99.angle, a2)
        if math.rad(KNIFE_HIT_CONFIG_upv_1.appleArcDegrees) <= v100 then
            continue
        end
        v99.eaten = true
        v100 = a1.appleParts[n_10 + 1]
        if v100 ~= nil then
            v100.CFrame = CFrame.new(0, -1000, 0)
        end
        if not (a1.authoredAppleOn) then
            a1.score = a1.score + 2
            a1.context.reportScore(a1.score)
            a1.context.audio.play("pop", {})
            a1.impactAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -KNIFE_HIT_CONFIG_upv_1.logRadius - 1, 1))
            a1.appleJuice:Emit(14)
            a1.popups:show(a1.stage.origin + Vector3.new(0, -KNIFE_HIT_CONFIG_upv_1.logRadius - 2, 0), "+2", u11, 0.8)
            continue
        end
        local u27
        u27 = a1.authoredApples[n_10 + 1]
        local v101 = v99.angle + a1.logAngle
        local v102 = Vector3.new(-math.sin(v101), math.cos(v101), 0)
        if u27 ~= nil then
            u27:burst(a1.stage.origin + (v102 * (KNIFE_HIT_CONFIG_upv_1.logRadius + 1.2)), Vector3.new(1, 0, 0))
            local sceneToken_upv_1 = a1.sceneToken
            task.delay(
                2.5,
                function()
                    --[[
                      line: 1307
                      upvalues:
                        a1 (copy, index: 1)
                        sceneToken_upv_1 (copy, index: 2)
                        u27 (copy, index: 3)
                    ]]
                    if a1.sceneToken ~= sceneToken_upv_1 then
                        return
                    end
                    u27:park()
                end
            )
        end
        a1.score = a1.score + 2
        a1.context.reportScore(a1.score)
        a1.context.audio.play("pop", {})
        a1.impactAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -KNIFE_HIT_CONFIG_upv_1.logRadius - 1, 1))
        a1.appleJuice:Emit(14)
        a1.popups:show(a1.stage.origin + Vector3.new(0, -KNIFE_HIT_CONFIG_upv_1.logRadius - 2, 0), "+2", u11, 0.8)
    end
end
u26.applyComboLook = function(a1)
    --[[
      name: applyComboLook
      line: 1330
      upvalues:
        u21 (copy, index: 1)
        u20 (copy, index: 2)
        u19 (copy, index: 3)
        flameSizeSequence_upv_1 (copy, index: 4)
    ]]
    local v103 = nil
    local v104 = 0
    local v105 = 1.3
    if a1.combo < 10 then
        if a1.combo < 6 then
            if a1.combo >= 3 then
                v105, v103, v104 = 1.3, u19, 4
            end
        else
            v105, v103, v104 = 1.7, u20, 6
        end
    else
        v105, v103, v104 = 2, u21, 9
    end
    local v106 = flameSizeSequence_upv_1(v105)
    for _, value_11 in a1.flames do
        if v103 ~= nil then
            value_11.Color = v103
        end
        value_11.Rate = v104
        value_11.Size = v106
    end
    a1.ambientMotes.Rate = math.min(a1.combo * 4, 32)
end
u25 = function(a1)
    --[[
      name: explodeWave
      line: 1358
      upvalues:
        tbl_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
        u25 (ref,  index: 4)
    ]]
    a1.combo = 0
    a1:applyComboLook()
    for n_11 = 0, #a1.stuck - 1 do
        local v107
        v107 = a1.knives[n_11 + 1]
        if v107 ~= nil then
            local v108 = a1.stuck[n_11 + 1] + a1.logAngle
            local v109 = Vector3.new(-math.sin(v108), math.cos(v108), 0)
            v107.blade.Anchored = false
            v107.handle.Anchored = false
            v107.blade.AssemblyLinearVelocity = (v109 * 24) + Vector3.new(0, 6, 0)
            v107.blade.AssemblyAngularVelocity = Vector3.new(0, 0, a1.random:NextNumber(-12, 12))
        end
    end
    local authoredLogShatter_1 = a1.authoredLogShatter
    if authoredLogShatter_1 ~= nil then
        authoredLogShatter_1:burst(a1:logPose())
    end
    for n_12 = 0, #a1.chunks - 1 do
        local v110 = a1.chunks[n_12 + 1]
        local v111 = (n_12 / #a1.chunks) * math.pi * 2
        local v112 = Vector3.new(-math.sin(v111), math.cos(v111), 0)
        v110.CFrame = CFrame.new(a1.stage.origin + (v112 * 2.5))
        v110.Anchored = false
        v110.AssemblyLinearVelocity = (v112 * 20) + Vector3.new(0, 8, 0)
        v110.AssemblyAngularVelocity = Vector3.new(0, 0, a1.random:NextNumber(-10, 10))
    end
    a1.log.Transparency = 1
    a1.logFace.Transparency = 1
    a1.logIntact = false
    for n_13 = 0, #a1.grainMarks - 1 do
        local v113 = a1.grainMarks[n_13 + 1]
        local v114 = tbl_upv_1[n_13 + 1].angle + a1.logAngle
        local v115 = Vector3.new(-math.sin(v114), math.cos(v114), 0)
        v113.Anchored = false
        v113.AssemblyLinearVelocity = (v115 * 18) + Vector3.new(0, 7, 0)
        v113.AssemblyAngularVelocity = Vector3.new(0, 0, a1.random:NextNumber(-10, 10))
    end
    for n_14 = 0, #a1.apples - 1 do
        local v116
        v116 = a1.apples[n_14 + 1]
        local v117 = a1.appleParts[n_14 + 1]
        if v116.eaten then
            continue
        end
        local v118
        if v117 == nil then
            continue
        end
        v116.eaten = true
        local v119 = v116.angle + a1.logAngle
        v118 = Vector3.new(-math.sin(v119), math.cos(v119), 0)
        v117.Anchored = false
        v117.AssemblyLinearVelocity = (v118 * 22) + Vector3.new(0, 6, 0)
        local v120
        if not (a1.authoredAppleOn) then
            continue
        end
        v120 = a1.authoredApples[n_14 + 1]
        if v120 ~= nil then
            v120:burst(a1.stage.origin + (v118 * (KNIFE_HIT_CONFIG_upv_1.logRadius + 1.2)), Vector3.new(1, 0, 0))
        end
    end
    a1.context.audio.play("woodBreak", {})
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(0.7)
    a1.popups:show(a1.stage.origin + Vector3.new(0, KNIFE_HIT_CONFIG_upv_1.logRadius + 4, 0), ("WAVE %* CLEAR!"):format(a1.wave), u11, 1.1)
    a1.wave = a1.wave + 1
    a1.waveBreakTimer = KNIFE_HIT_CONFIG_upv_1.waveBreakSeconds
    local sceneToken_upv_2 = a1.sceneToken
    task.delay(
        2.5,
        function()
            --[[
              line: 1462
              upvalues:
                a1 (copy, index: 1)
                sceneToken_upv_2 (copy, index: 2)
                u25 (ref,  index: 3)
            ]]
            if a1.sceneToken ~= sceneToken_upv_2 then
                return nil
            else
                local v121
                if a1.logIntact then
                    return nil
                end
                for _, value_12 in a1.knives do
                    u25(value_12)
                end
                v121 = a1.authoredLogShatter
                if v121 ~= nil then
                    v121:park()
                end
                for _, value_13 in a1.chunks do
                    value_13.Anchored = true
                    value_13.CFrame = CFrame.new(0, -1000, 0)
                end
                for _, value_14 in a1.grainMarks do
                    value_14.Anchored = true
                    value_14.CFrame = CFrame.new(0, -1000, 0)
                end
                for _, value_15 in a1.appleParts do
                    value_15.Anchored = true
                    value_15.CFrame = CFrame.new(0, -1000, 0)
                end
                for _, value_16 in a1.authoredApples do
                    value_16:park()
                end
            end
        end
    )
end
u26.explodeWave = u25
u25 = function(a1)
    --[[
      name: startWave
      line: 1490
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
        u25 (ref,  index: 4)
        overlapsAny_upv_1 (copy, index: 5)
    ]]
    a1.waveRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 16 + a1.wave)
    a1.waveBreakTimer = 0
    a1.stuck = {}
    a1.knivesLeft = math.min(math.floor(KNIFE_HIT_CONFIG_upv_1.knivesFirstWave + ((a1.wave - 1) * KNIFE_HIT_CONFIG_upv_1.knivesPerWaveGrowth)), KNIFE_HIT_CONFIG_upv_1.knivesMax, u16)
    a1.speed = math.rad(KNIFE_HIT_CONFIG_upv_1.speedMaxDegrees - ((KNIFE_HIT_CONFIG_upv_1.speedMaxDegrees - KNIFE_HIT_CONFIG_upv_1.speedStartDegrees) * math.pow(0.5, (a1.wave - 1) / KNIFE_HIT_CONFIG_upv_1.speedHalfLifeWaves)))
    a1.rotationPattern = a1:pickPattern()
    a1.patternPhase = 0
    a1.direction = a1.waveRandom:NextNumber() >= 0.5 and 1 or -1
    a1.directionBlend = a1.direction
    a1.reversalTimer = a1.waveRandom:NextNumber(KNIFE_HIT_CONFIG_upv_1.reversalMinSeconds, KNIFE_HIT_CONFIG_upv_1.reversalMaxSeconds)
    if a1.rotationPattern == "oscillate" then
        a1:rollOscillation(a1.logAngle)
    end
    for _, value_17 in a1.knives do
        u25(value_17)
    end
    local authoredLogShatter_2 = a1.authoredLogShatter
    if authoredLogShatter_2 ~= nil then
        authoredLogShatter_2:park()
    end
    for _, value_18 in a1.chunks do
        value_18.Anchored = true
        value_18.CFrame = CFrame.new(0, -1000, 0)
    end
    for _, value_19 in a1.authoredApples do
        value_19:park()
    end
    if not (a1.authoredLogOn) then
        a1.log.Transparency = 0
        a1.logFace.Transparency = 0
    end
    a1.logIntact = true
    for v123, v124 in a1.grainMarks do
        v124.Anchored = true
        v124.CFrame = CFrame.new(0, -1000, 0)
    end
    a1.combo = 0
    a1:applyComboLook()
    a1:placeWaitingKnife()
    a1:updateIndicators()
    local v125 = math.min(math.floor((a1.wave - 1) / KNIFE_HIT_CONFIG_upv_1.preStuckWavesPerSeed), KNIFE_HIT_CONFIG_upv_1.preStuckMax)
    local v126 = 0
    local v127 = false
    v127, v126 = nil, nil
    if v127 then
        v126 = v126 + 1
    else
        v127 = true
    end
    if v126 < v125 then
        local v123
        v123 = a1.waveRandom:NextNumber(0, math.tau)
        local v128 = 0
        while overlapsAny_upv_1(a1.stuck, v123, math.rad(KNIFE_HIT_CONFIG_upv_1.collisionArcDegrees * 2)) and v128 < 12 do
            v123, v128 = a1.waveRandom:NextNumber(0, math.tau), v128 + 1
        end
        table.insert(a1.stuck, v123)
        if v127 then
            v126 = v126 + 1
        else
            v127 = true
        end
        --[[ goto label_19 ]]--
    end
    a1.apples = {}
    local v123
    v123, v127, v126 = false, 0, 1 + a1.wave % 2
    if v123 then
        v127 = v127 + 1
    else
        v123 = true
    end
    if v127 < v126 then
        local v124 = a1.waveRandom:NextNumber(0, math.tau)
        local v129 = 0
        while overlapsAny_upv_1(a1.stuck, v124, math.rad(KNIFE_HIT_CONFIG_upv_1.appleArcDegrees * 2)) and v129 < 12 do
            v124, v129 = a1.waveRandom:NextNumber(0, math.tau), v129 + 1
        end
        table.insert(a1.apples, {angle = v124})
        if v123 then
            v127 = v127 + 1
        else
            v123 = true
        end
        --[[ goto label_23 ]]--
    end
    for _, value_20 in a1.appleParts do
        value_20.Anchored = true
        value_20.CFrame = CFrame.new(0, -1000, 0)
    end
end
u26.startWave = u25
u24 = function(a1)
    --[[
      name: die
      line: 1597
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
        u24 (ref,  index: 2)
        u9 (copy, index: 3)
        u7 (copy, index: 4)
        u25 (ref,  index: 5)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1.impactAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -KNIFE_HIT_CONFIG_upv_1.logRadius - 2, 1))
    a1.sparks:Emit(16)
    a1.combo = 0
    a1:applyComboLook()
    local u28 = a1.knives[#a1.stuck + 1]
    if u28 ~= nil then
        u24(u28, a1.stage.origin + Vector3.new(0, -(KNIFE_HIT_CONFIG_upv_1.logRadius + 3.5), 0), math.pi)
        u28.blade.Color = u9
        u28.blade.Anchored = false
        u28.handle.Anchored = false
        u28.blade.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-8, 8), -18, 0)
        u28.blade.AssemblyAngularVelocity = Vector3.new(0, 0, 16)
        task.delay(
            2.5,
            function()
                --[[
                  line: 1618
                  upvalues:
                    u28 (copy, index: 1)
                    u7 (copy, index: 2)
                    u25 (ref,  index: 3)
                ]]
                u28.blade.Color = u7
                u25(u28)
            end
        )
    end
    u25(a1.waitingKnife)
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(0.9)
    local score_upv_1 = a1.score
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        0.7,
        function()
            --[[
              line: 1636
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
u26.die = u24
throwEase = function(a1)
    --[[
      name: throwEase
      line: 1651
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local throwWindUpFraction_1 = KNIFE_HIT_CONFIG_upv_1.throwWindUpFraction
    local throwWindUpDip_1 = KNIFE_HIT_CONFIG_upv_1.throwWindUpDip
    if a1 >= throwWindUpFraction_1 then
        local throwOvershoot_1 = KNIFE_HIT_CONFIG_upv_1.throwOvershoot
        local v130 = (a1 - throwWindUpFraction_1) / (1 - throwWindUpFraction_1) - 1
        return -throwWindUpDip_1 + ((1 + throwWindUpDip_1) * ((1 + ((((throwOvershoot_1 + 1) * v130) * v130) * v130)) + ((throwOvershoot_1 * v130) * v130)))
    end
    return -throwWindUpDip_1 * math.sin(((a1 / throwWindUpFraction_1) * math.pi) / 2)
end
u24 = function(a1, a2, a3)
    --[[
      name: placeKnife
      line: 1666
      upvalues:
        u12 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    local v131 = CFrame.new(a2) * CFrame.Angles(0, 0, a3)
    a1.blade.CFrame = v131 * u12
    a1.handle.CFrame = v131 * u13
end
u25 = function(a1)
    --[[
      name: parkKnife
      line: 1673
    ]]
    a1.blade.Anchored = true
    a1.handle.Anchored = true
    a1.blade.CFrame = CFrame.new(0, -1000, 0)
    a1.handle.CFrame = CFrame.new(0, -1000, 0)
end
u23 = function(a1)
    --[[
      name: hideKnife
      line: 1680
    ]]
    a1.blade.Transparency = 1
    a1.handle.Transparency = 1
end
makeBurstEmitter = function(a1, a2, a3, a4)
    --[[
      name: makeBurstEmitter
      line: 1684
    ]]
    local v132 = Instance.new("ParticleEmitter")
    v132.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    v132.Rate = 0
    v132.Lifetime = NumberRange.new(0.35, 0.7)
    v132.Speed = NumberRange.new(8, 16)
    v132.SpreadAngle = Vector2.new(180, 180)
    v132.Size = NumberSequence.new(a3)
    v132.LightEmission = a4
    v132.Color = a2
    v132.Parent = a1
    return v132
end
local tbl_15 = {}
tbl_15.KnifeHitGame = u26
return tbl_15