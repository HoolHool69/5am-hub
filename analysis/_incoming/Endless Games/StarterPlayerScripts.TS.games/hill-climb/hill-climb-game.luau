-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "coin-visual")
local CoinVisual_upv_1 = v1.CoinVisual
local findCoinTemplate_upv_1 = v1.findCoinTemplate
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "distance-score").DistanceScore
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local kitTouchInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "kit-touch-input").kitTouchInput
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local HILL_CLIMB_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "hill-climb-config").HILL_CLIMB_CONFIG
local HillClimbTerrain_upv_1 = RuntimeLib_1.import(script, script.Parent, "hill-climb-terrain").HillClimbTerrain
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(112, 192, 82)
local u3 = Color3.fromRGB(100, 180, 72)
local u4 = Color3.fromRGB(126, 94, 60)
local u5 = Color3.fromRGB(118, 87, 55)
local u6 = Color3.fromRGB(198, 62, 48)
local u7 = Color3.fromRGB(240, 234, 220)
local u8 = Color3.fromRGB(42, 42, 46)
local u9 = Color3.fromRGB(210, 206, 196)
local u10 = Color3.fromRGB(238, 238, 232)
local u11 = Color3.fromRGB(245, 205, 160)
local u12 = Color3.fromRGB(206, 58, 46)
local u13 = Color3.fromRGB(84, 178, 74)
local u14 = Color3.fromRGB(120, 220, 96)
local u15 = Color3.fromRGB(240, 82, 70)
local u16 = Color3.fromRGB(255, 216, 102)
local u17 = Color3.fromRGB(255, 90, 100)
local u18 = Color3.fromRGB(150, 235, 120)
local u19 = Color3.fromRGB(180, 178, 172)
local u20 = Color3.fromRGB(168, 138, 100)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 69
    ]]
    return "EngineAudio"
end
local u21 = setmetatable(tbl_1, tbl_2)
u21.__index = u21
u21.new = function(...)
    --[[
      name: new
      line: 74
      upvalues:
        u21 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u21)
    return v4:constructor(...) or v4
end
u21.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 78
      upvalues:
        createGameLoopSound_upv_1 (copy, index: 1)
        SOUND_IDS_upv_1 (copy, index: 2)
    ]]
    a1.ignited = false
    a1.ignition = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.carIgnition, parent = a2})
    a3:Add(a1.ignition)
    a1.bed = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.carEngineBed, parent = a2})
    a3:Add(a1.bed)
end
u21.igniteOnce = function(a1)
    --[[
      name: igniteOnce
      line: 97
    ]]
    if a1.ignited then
        return nil
    end
    a1.ignited = true
    a1.ignition:Play()
end
u21.update = function(a1, a2, a3, a4)
    --[[
      name: update
      line: 104
    ]]
    local v5
    if a4 then
        v5 = ((a2 and 0.34) or 0.14) + 0.1 * a3
    else
        v5 = 0
    end
    if v5 > 0.02 and not (a1.bed.IsPlaying) then
        a1.bed:Play()
    end
    a1.bed.Volume = v5
    a1.bed.PlaybackSpeed = 0.72 + (0.85 * a3)
    if v5 > 0.02 or not a1.bed.IsPlaying then
        return
    end
    a1.bed:Stop()
end
u21.reset = function(a1)
    --[[
      name: reset
      line: 115
    ]]
    a1.ignited = false
    a1.bed:Stop()
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 139
    ]]
    return "HillClimbGame"
end
tbl_4.__index = BaseWorldGame_upv_1
local u22 = setmetatable(tbl_3, tbl_4)
u22.__index = u22
u22.new = function(...)
    --[[
      name: new
      line: 145
      upvalues:
        u22 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u22)
    return v6:constructor(...) or v6
end
u22.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 149
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        HillClimbTerrain_upv_1 (copy, index: 2)
        DistanceScore_upv_1 (copy, index: 3)
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.terrain = HillClimbTerrain_upv_1.new()
    a1.distance = DistanceScore_upv_1.new(HILL_CLIMB_CONFIG_upv_1.studsPerMetre)
    a1.x = 0
    a1.y = 0
    a1.angle = 0
    a1.velocityX = 0
    a1.velocityY = 0
    a1.angularVelocity = 0
    a1.renderPrevX = 0
    a1.renderPrevY = 0
    a1.renderPrevAngle = 0
    a1.maxX = 0
    a1.fuel = HILL_CLIMB_CONFIG_upv_1.fuelSeconds
    a1.outOfFuelRest = 0
    a1.airSeconds = 0
    a1.airRotation = 0
    a1.airTimeTicksPaid = 0
    a1.goldCollected = 0
    a1.invulnRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.lowFuelBeepClock = 0
    a1.gasHeldNow = false
    a1.forceX = 0
    a1.forceY = 0
    a1.torque = 0
    a1.coinPlanX = 0
    a1.canPlanX = 0
    a1.coins = {}
    a1.freeCoins = {}
    a1.cans = {}
    a1.crustTiles = {}
    a1.fillTiles = {}
    a1.segmentStart = 0
    a1.headBob = 0
    a1.headBobVelocity = 0
    a1.previousVelocityX = 0
    a1.cameraX = 0
    a1.cameraY = 0
    a1.exhaustClock = 0
end
u22.buildScene = function(a1)
    --[[
      name: buildScene
      line: 192
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        u3 (copy, index: 4)
        u1 (copy, index: 5)
        u4 (copy, index: 6)
        u5 (copy, index: 7)
        u6 (copy, index: 8)
        u7 (copy, index: 9)
        makeSmoothPart_upv_1 (copy, index: 10)
        u8 (copy, index: 11)
        u9 (copy, index: 12)
        u10 (copy, index: 13)
        u11 (copy, index: 14)
        u12 (copy, index: 15)
        u14 (copy, index: 16)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 17)
        u19 (copy, index: 18)
        u20 (copy, index: 19)
        findCoinTemplate_upv_1 (copy, index: 20)
        u16 (copy, index: 21)
        CoinVisual_upv_1 (copy, index: 22)
        u13 (copy, index: 23)
        PopupTextPool_upv_1 (copy, index: 24)
        u21 (ref,  index: 25)
        kitTouchInput_upv_1 (copy, index: 26)
    ]]
    local container_upv_1 = a1.stage.container
    local v7, v8 = nil, nil
    for v9 = 0, HILL_CLIMB_CONFIG_upv_1.segmentPoolSize - 1 do
        local v10 = makeStagePart_upv_1(container_upv_1)
        if v9 % 2 ~= 0 then
            v7 = u3
        else
            v7 = u2
        end
        v10.Color = v7
        v10.CFrame = u1
        table.insert(a1.crustTiles, v10)
        local v11 = makeStagePart_upv_1(container_upv_1)
        if v9 % 2 ~= 0 then
            v8 = u5
        else
            v8 = u4
        end
        v11.Color = v8
        v11.CFrame = u1
        table.insert(a1.fillTiles, v11)
    end
    a1.chassis = makeStagePart_upv_1(container_upv_1)
    a1.chassis.Size = Vector3.new(5.400000095367432, 1.5, 2.5)
    a1.chassis.Color = u6
    a1.cargoBed = makeStagePart_upv_1(container_upv_1)
    a1.cargoBed.Size = Vector3.new(1.7999999523162842, 1, 2.299999952316284)
    a1.cargoBed.Color = u7
    a1.rollBar = makeSmoothPart_upv_1(container_upv_1)
    a1.rollBar.Size = Vector3.new(0.3499999940395355, 1.899999976158142, 2.0999999046325684)
    a1.rollBar.Color = u8
    local function v12(a2, a3)
        --[[
          line: 219
          upvalues:
            makeSmoothPart_upv_1 (copy, index: 1)
            container_upv_1 (copy, index: 2)
            u8 (copy, index: 3)
            HILL_CLIMB_CONFIG_upv_1 (copy, index: 4)
            u1 (copy, index: 5)
            u9 (copy, index: 6)
        ]]
        local v13 = makeSmoothPart_upv_1(container_upv_1)
        v13.Shape = Enum.PartType.Cylinder
        v13.Color = u8
        v13.Size = Vector3.new(1.1, HILL_CLIMB_CONFIG_upv_1.wheelRadius * 2, HILL_CLIMB_CONFIG_upv_1.wheelRadius * 2)
        v13.CFrame = u1
        local v14 = makeSmoothPart_upv_1(container_upv_1)
        v14.Shape = Enum.PartType.Cylinder
        v14.Color = u9
        v14.Size = Vector3.new(1.2, HILL_CLIMB_CONFIG_upv_1.wheelRadius * 0.9, HILL_CLIMB_CONFIG_upv_1.wheelRadius * 0.9)
        v14.CFrame = u1
        local tbl_5 = {}
        tbl_5.offsetX = a2
        tbl_5.driveFactor = a3
        tbl_5.part = v13
        tbl_5.hubCap = v14
        return tbl_5
    end
    a1.frontWheel = v12(HILL_CLIMB_CONFIG_upv_1.wheelBaseHalf, 0.45)
    a1.rearWheel = v12(-HILL_CLIMB_CONFIG_upv_1.wheelBaseHalf, 1)
    a1.wheels = {a1.frontWheel, a1.rearWheel}
    a1.driverTorso = makeStagePart_upv_1(container_upv_1)
    a1.driverTorso.Size = Vector3.new(1.100000023841858, 1.2000000476837158, 1.2000000476837158)
    a1.driverTorso.Color = u10
    a1.driverHead = makeStagePart_upv_1(container_upv_1)
    a1.driverHead.Size = Vector3.new(1.2999999523162842, 1.2000000476837158, 1.2999999523162842)
    a1.driverHead.Color = u11
    a1.driverCap = makeSmoothPart_upv_1(container_upv_1)
    a1.driverCap.Size = Vector3.new(1.399999976158142, 0.4000000059604645, 1.399999976158142)
    a1.driverCap.Color = u12
    a1.fuelBillboard = Instance.new("BillboardGui")
    a1.fuelBillboard.Size = UDim2.fromScale(4.4, 0.62)
    a1.fuelBillboard.StudsOffsetWorldSpace = Vector3.new(0, 4.300000190734863, 0)
    a1.fuelBillboard.AlwaysOnTop = false
    a1.fuelBillboard.Parent = a1.chassis
    local v15 = Instance.new("Frame")
    v15.BackgroundColor3 = Color3.fromRGB(30, 32, 36)
    v15.BackgroundTransparency = 0.25
    v15.BorderSizePixel = 0
    v15.Size = UDim2.fromScale(1, 1)
    v15.Parent = a1.fuelBillboard
    local v9 = Instance.new("UICorner")
    v9.CornerRadius = UDim.new(0.5, 0)
    v9.Parent = v15
    a1.fuelBarFill = Instance.new("Frame")
    a1.fuelBarFill.BackgroundColor3 = u14
    a1.fuelBarFill.BorderSizePixel = 0
    a1.fuelBarFill.AnchorPoint = Vector2.new(0, 0.5)
    a1.fuelBarFill.Position = UDim2.new(0.04, 0, 0.5, 0)
    a1.fuelBarFill.Size = UDim2.fromScale(0.92, 0.62)
    a1.fuelBarFill.Parent = v15
    local v16 = Instance.new("UICorner")
    v16.CornerRadius = UDim.new(0.5, 0)
    v16.Parent = a1.fuelBarFill
    a1.exhaust = Instance.new("ParticleEmitter")
    a1.exhaust.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.exhaust.Color = ColorSequence.new(u19)
    a1.exhaust.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 1.1)})
    a1.exhaust.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.35), NumberSequenceKeypoint.new(1, 1)})
    a1.exhaust.Lifetime = NumberRange.new(0.4, 0.7)
    a1.exhaust.Speed = NumberRange.new(2, 4)
    a1.exhaust.SpreadAngle = Vector2.new(25, 25)
    a1.exhaust.EmissionDirection = Enum.NormalId.Left
    a1.exhaust.Acceleration = Vector3.new(0, 6, 0)
    a1.exhaust.Rate = 0
    a1.exhaust.Parent = a1.chassis
    a1.dustAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.dustAnchor.Transparency = 1
    a1.dustAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.dustAnchor.CFrame = u1
    a1.dust = Instance.new("ParticleEmitter")
    a1.dust.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.dust.Color = ColorSequence.new(u20)
    a1.dust.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.1)})
    local tbl_6 = {NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 1)}
    a1.dust.Transparency = NumberSequence.new(tbl_6)
    a1.dust.Lifetime = NumberRange.new(0.3, 0.5)
    a1.dust.Speed = NumberRange.new(3, 7)
    a1.dust.SpreadAngle = Vector2.new(40, 40)
    a1.dust.EmissionDirection = Enum.NormalId.Top
    a1.dust.Acceleration = Vector3.new(0, -20, 0)
    a1.dust.Rate = 0
    a1.dust.Parent = a1.dustAnchor
    local v17 = findCoinTemplate_upv_1()
    local v18 = nil
    for n_1 = 0, HILL_CLIMB_CONFIG_upv_1.coinPoolSize - 1 do
        local v19 = makeSmoothPart_upv_1(container_upv_1)
        v19.Shape = Enum.PartType.Cylinder
        v19.Material = Enum.Material.Neon
        v19.Color = u16
        v19.Size = Vector3.new(0.30000001192092896, 1.5, 1.5)
        v19.CFrame = u1
        local tbl_7 = {}
        tbl_7.index = n_1
        if v17 == nil then
            v18 = nil
        else
            v18 = CoinVisual_upv_1:make(v17, container_upv_1, {})
        end
        tbl_7.visual = v18
        tbl_7.fallback = v19
        if tbl_7.visual ~= nil then
            v19.Transparency = 1
        end
        table.insert(a1.coins, tbl_7)
        table.insert(a1.freeCoins, tbl_7)
    end
    for _ = 0, HILL_CLIMB_CONFIG_upv_1.canPoolSize - 1 do
        local v20 = makeStagePart_upv_1(container_upv_1)
        v20.Size = Vector3.new(1.5, 1.899999976158142, 1)
        v20.Color = u13
        v20.CFrame = u1
        local v21 = makeSmoothPart_upv_1(container_upv_1)
        v21.Size = Vector3.new(0.5, 0.5, 0.4000000059604645)
        v21.Color = u9
        v21.CFrame = u1
        table.insert(a1.cans, {parts = {v20, v21}})
    end
    a1.popups = PopupTextPool_upv_1.new(container_upv_1, 6)
    a1.engineAudio = u21.new(container_upv_1, a1.context.janitor)
    a1.stage.setFrameWidthFloor(46)
    a1.context.janitor:Add(
        kitTouchInput_upv_1.onPress:Connect(
            function()
                --[[
                  line: 356
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1.context.requestStart()
            end
        )
    )
end
u22.resetRound = function(a1)
    --[[
      name: resetRound
      line: 360
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 2)
        kitTouchInput_upv_1 (copy, index: 3)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.terrain:reset(deriveRandom_upv_1(a1.context.getRunSeed(), 0))
    a1.coinRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 1)
    a1.distance:reset()
    a1.x = 0
    a1.y = (((a1.terrain:heightAt(0) + HILL_CLIMB_CONFIG_upv_1.wheelRadius) + HILL_CLIMB_CONFIG_upv_1.suspensionRest) + 0.75) - 0.4
    a1.angle = 0
    a1.velocityX = 0
    a1.velocityY = 0
    a1.angularVelocity = 0
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1.renderPrevAngle = 0
    a1.maxX = 0
    a1.fuel = HILL_CLIMB_CONFIG_upv_1.fuelSeconds
    a1.outOfFuelRest = 0
    a1.airSeconds = 0
    a1.airRotation = 0
    a1.airTimeTicksPaid = 0
    a1.goldCollected = 0
    a1.invulnRemaining = 0
    a1.headBob = 0
    a1.headBobVelocity = 0
    a1.previousVelocityX = 0
    a1.cameraX = a1.x + HILL_CLIMB_CONFIG_upv_1.cameraLeadX
    a1.cameraY = a1.y + HILL_CLIMB_CONFIG_upv_1.cameraHeightOffset
    a1.frontWheel.compression = 0
    a1.frontWheel.contact = false
    a1.rearWheel.compression = 0
    a1.rearWheel.contact = false
    a1.coinPlanX = HILL_CLIMB_CONFIG_upv_1.padStuds
    a1.canPlanX = HILL_CLIMB_CONFIG_upv_1.fuelCanSpacingMetres * HILL_CLIMB_CONFIG_upv_1.studsPerMetre
    for _, value_1 in a1.coins do
        a1:releaseCoin(value_1)
    end
    for _, value_2 in a1.cans do
        a1:parkCan(value_2)
    end
    a1.terrain:ensureCoverage(a1.x + 200)
    a1.segmentStart = math.floor((a1.cameraX - HILL_CLIMB_CONFIG_upv_1.segmentWindowBehind) / HILL_CLIMB_CONFIG_upv_1.segmentLength)
    a1:layoutSegmentWindow()
    a1:planAhead()
    a1.gasHeldNow = false
    kitTouchInput_upv_1:reset()
    a1.engineAudio:reset()
    a1.popups:hideAll()
    a1:restoreChassisLook()
    a1.context.reportScore(0)
end
u22.revive = function(a1)
    --[[
      name: revive
      line: 412
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.invulnRemaining = HILL_CLIMB_CONFIG_upv_1.reviveInvulnSeconds
    a1.angle = 0
    a1.angularVelocity = 0
    a1.velocityX = 0
    a1.velocityY = 0
    a1.y = (((a1.terrain:heightAt(a1.x) + HILL_CLIMB_CONFIG_upv_1.wheelRadius) + HILL_CLIMB_CONFIG_upv_1.suspensionRest) + 0.75) - 0.4
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1.renderPrevAngle = 0
    a1.fuel = HILL_CLIMB_CONFIG_upv_1.fuelSeconds
    a1.outOfFuelRest = 0
    a1.airSeconds = 0
    a1.airRotation = 0
    a1.headBob = 0
    a1.headBobVelocity = 0
    a1:restoreChassisLook()
end
u22.captureRound = function(a1)
    --[[
      name: captureRound
      line: 434
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 438
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2:num(a1.x):num(a1.y):num(a1.angle)
            a2:num(a1.velocityX):num(a1.velocityY):num(a1.angularVelocity)
            a2:num(a1.fuel):num(a1.maxX):num(a1.distance:studs())
        end
    )
end
u22.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 444
      upvalues:
        readResume_upv_1 (copy, index: 1)
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
    ]]
    local v22 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 445
            ]]
            local tbl_8 = {}
            tbl_8.x = a3:num()
            tbl_8.y = a3:num()
            tbl_8.angle = a3:num()
            tbl_8.velocityX = a3:num()
            tbl_8.velocityY = a3:num()
            tbl_8.angularVelocity = a3:num()
            tbl_8.fuel = a3:num()
            tbl_8.maxX = a3:num()
            tbl_8.distanceStuds = a3:num()
            return tbl_8
        end
    )
    if v22 ~= nil then
        a1.x = v22.x
        a1.y = v22.y
        a1.angle = v22.angle
        a1.velocityX = v22.velocityX
        a1.velocityY = v22.velocityY
        a1.angularVelocity = v22.angularVelocity
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1.renderPrevAngle = a1.angle
        a1.fuel = math.clamp(v22.fuel, 0, HILL_CLIMB_CONFIG_upv_1.fuelSeconds)
        a1.maxX = math.max(v22.maxX, a1.x)
        a1.distance:restore((math.max(v22.distanceStuds, 0)))
        a1.goldCollected = a2.pickups
        a1.cameraX = a1.x + HILL_CLIMB_CONFIG_upv_1.cameraLeadX
        a1.cameraY = a1.y + HILL_CLIMB_CONFIG_upv_1.cameraHeightOffset
        for _, value_3 in a1.coins do
            a1:releaseCoin(value_3)
        end
        for _, value_4 in a1.cans do
            a1:parkCan(value_4)
        end
        a1.coinRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 1)
        a1.terrain:ensureCoverage(a1.x + 200)
        a1.terrain:dropBefore(a1.x - 160)
        a1.coinPlanX = math.max(a1.x - 20, HILL_CLIMB_CONFIG_upv_1.padStuds)
        a1.canPlanX = math.max(math.ceil(a1.x / (HILL_CLIMB_CONFIG_upv_1.fuelCanSpacingMetres * HILL_CLIMB_CONFIG_upv_1.studsPerMetre)) * (HILL_CLIMB_CONFIG_upv_1.fuelCanSpacingMetres * HILL_CLIMB_CONFIG_upv_1.studsPerMetre), HILL_CLIMB_CONFIG_upv_1.fuelCanSpacingMetres * HILL_CLIMB_CONFIG_upv_1.studsPerMetre)
        a1:planAhead()
        a1.segmentStart = math.floor((a1.cameraX - HILL_CLIMB_CONFIG_upv_1.segmentWindowBehind) / HILL_CLIMB_CONFIG_upv_1.segmentLength)
        a1:layoutSegmentWindow()
        a1.context.reportScore(a2.score)
        a1.context.reportPickup(a2.pickups)
        return true
    end
    return false
end
u22.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 499
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        kitTouchInput_upv_1 (copy, index: 2)
        gamepadInput_upv_1 (copy, index: 3)
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 4)
    ]]
    local v23, v24, v25 = nil, nil, nil
    if a1.dead then
        return nil
    else
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1.renderPrevAngle = a1.angle
        a1.previousVelocityX = a1.velocityX
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        local v26 = UserInputService_upv_1:GetFocusedTextBox() ~= nil
        v23 = kitTouchInput_upv_1:isHeld("gas")
        if not (v23) then
            local v27 = nil
            if v26 then
                v23 = gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonR2) or gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)
            else
                v27 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Right)
                local v28 = nil
                if v27 then
                    v23 = v27
                else
                    v28 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.D)
                    local v29 = nil
                    if v28 then
                        v23 = v28
                    else
                        v29 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Up)
                        v23 = v29 or UserInputService_upv_1:IsKeyDown(Enum.KeyCode.W) or gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonR2) or gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)
                    end
                end
            end
        end
        v24 = not v23
        if v24 then
            v24 = kitTouchInput_upv_1:isHeld("brake")
            if not v24 then
                if v26 then
                    v24 = gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonL2)
                else
                    v24 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Left)
                    v24 = v24 or UserInputService_upv_1:IsKeyDown(Enum.KeyCode.A) or UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Down) or UserInputService_upv_1:IsKeyDown(Enum.KeyCode.S) or gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonL2)
                end
            end
        end
        a1.gasHeldNow = v23
        local v30 = a1.fuel > 0
        if v23 and v30 then
            a1.engineAudio:igniteOnce()
        end
        a1.forceX = 0
        a1.forceY = HILL_CLIMB_CONFIG_upv_1.gravity
        a1.torque = 0
        a1:solveWheel(a1.frontWheel, v23, v24, v30, a2)
        a1:solveWheel(a1.rearWheel, v23, v24, v30, a2)
        local v31 = a1.frontWheel.contact or (a1.rearWheel.contact)
        a1.forceX = a1.forceX - ((HILL_CLIMB_CONFIG_upv_1.dragQuadratic * a1.velocityX) * math.abs(a1.velocityX))
        if not (v31) then
            if v23 and v30 then
                a1.torque = a1.torque + (HILL_CLIMB_CONFIG_upv_1.airTorque * HILL_CLIMB_CONFIG_upv_1.chassisInertia)
            end
            if v24 then
                a1.torque = a1.torque - (HILL_CLIMB_CONFIG_upv_1.airTorque * HILL_CLIMB_CONFIG_upv_1.chassisInertia)
            end
        end
        a1.torque = a1.torque - ((a1.angularVelocity * HILL_CLIMB_CONFIG_upv_1.angularDrag) * HILL_CLIMB_CONFIG_upv_1.chassisInertia)
        a1.velocityX = a1.velocityX + (a1.forceX * a2)
        a1.velocityY = a1.velocityY + (a1.forceY * a2)
        a1.angularVelocity = math.clamp(a1.angularVelocity + ((a1.torque / HILL_CLIMB_CONFIG_upv_1.chassisInertia) * a2), -10, 10)
        a1.x = a1.x + (a1.velocityX * a2)
        a1.y = a1.y + (a1.velocityY * a2)
        a1.angle = a1.angle + (a1.angularVelocity * a2)
        v25 = a1.terrain:heightAt(a1.x) + 0.8
        if a1.y < v25 then
            a1.y = v25
            if a1.velocityY < 0 then
                a1.velocityY = 0
            end
        end
        if v31 then
            if a1.airSeconds > 0.15 and HILL_CLIMB_CONFIG_upv_1.flipRadians <= math.abs(a1.airRotation) then
                a1:payTrick(((a1.airRotation <= 0) and "FRONTFLIP!") or "BACKFLIP!", HILL_CLIMB_CONFIG_upv_1.flipBonusCoins)
            end
            a1.airSeconds = 0
            a1.airRotation = 0
            a1.airTimeTicksPaid = 0
        else
            a1.airSeconds = a1.airSeconds + a2
            a1.airRotation = a1.airRotation + (a1.angularVelocity * a2)
            local v32 = math.floor(a1.airSeconds - HILL_CLIMB_CONFIG_upv_1.airTimeFromSeconds) + 1
            if HILL_CLIMB_CONFIG_upv_1.airTimeFromSeconds <= a1.airSeconds and a1.airTimeTicksPaid < v32 then
                a1.airTimeTicksPaid = v32
                a1:payTrick("AIR TIME", 1)
            end
        end
        local v33 = math.cos(a1.angle)
        local v34 = math.sin(a1.angle)
        if a1.invulnRemaining <= 0 and ((a1.y + (HILL_CLIMB_CONFIG_upv_1.headOffsetX * v34)) + (HILL_CLIMB_CONFIG_upv_1.headOffsetY * v33)) - HILL_CLIMB_CONFIG_upv_1.headRadius <= a1.terrain:heightAt((a1.x + (HILL_CLIMB_CONFIG_upv_1.headOffsetX * v33)) - (HILL_CLIMB_CONFIG_upv_1.headOffsetY * v34)) then
            a1:die("driver")
            return nil
        end
        a1.fuel = math.max(a1.fuel - a2, 0)
        if a1.fuel > 0 then
            if a1.fuel < HILL_CLIMB_CONFIG_upv_1.fuelSeconds * HILL_CLIMB_CONFIG_upv_1.fuelWarnFraction then
                a1.lowFuelBeepClock = a1.lowFuelBeepClock - a2
                if a1.lowFuelBeepClock <= 0 then
                    a1.lowFuelBeepClock = 1.4
                    a1.context.audio.play("scorePing", {})
                end
            end
        elseif math.abs(a1.velocityX) >= HILL_CLIMB_CONFIG_upv_1.outOfFuelCrawlSpeed then
            a1.outOfFuelRest = 0
        else
            a1.outOfFuelRest = a1.outOfFuelRest + a2
            if HILL_CLIMB_CONFIG_upv_1.outOfFuelRestSeconds <= a1.outOfFuelRest then
                a1:die("fuel")
                return nil
            end
        end
        if a1.maxX < a1.x then
            a1.maxX = a1.x
            if a1.distance:advance(a1.x - a1.maxX) then
                a1.context.reportScore(a1.distance:current())
            end
        end
        a1.terrain:ensureCoverage(a1.x + 200)
        a1.terrain:dropBefore(a1.x - 160)
        a1:planAhead()
        a1:collectPickups()
    end
end
u22.solveWheel = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: solveWheel
      line: 621
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v35 = math.cos(a1.angle)
    local v36 = math.sin(a1.angle)
    local v37 = a2.offsetX * v35 + HILL_CLIMB_CONFIG_upv_1.anchorDropY * v36
    local v38 = a2.offsetX * v36 - HILL_CLIMB_CONFIG_upv_1.anchorDropY * v35
    local v39 = a1.x + v37
    local v40 = math.clamp(((a1.terrain:heightAt(v39) + HILL_CLIMB_CONFIG_upv_1.wheelRadius) + HILL_CLIMB_CONFIG_upv_1.suspensionRest) - (a1.y + v38), 0, HILL_CLIMB_CONFIG_upv_1.suspensionTravel)
    a2.compression = v40
    a2.contact = v40 > 0
    if a2.contact then
        local v41 = a1.terrain:slopeAt(v39)
        local v42 = 1 / math.sqrt(1 + (v41 * v41))
        local v43 = -v41 * v42
        local v44 = math.clamp((HILL_CLIMB_CONFIG_upv_1.suspensionStiffness * v40) + (HILL_CLIMB_CONFIG_upv_1.suspensionDamping * ((v41 * (a1.velocityX - (a1.angularVelocity * v38))) - (a1.velocityY + (a1.angularVelocity * v37)))), 0, 420)
        a1.forceX = a1.forceX + (v43 * v44)
        a1.forceY = a1.forceY + (v42 * v44)
        a1.torque = a1.torque + ((v37 * (v42 * v44)) - (v38 * (v43 * v44)))
        local v45 = math.min((v40 / HILL_CLIMB_CONFIG_upv_1.suspensionRest) + 0.35, HILL_CLIMB_CONFIG_upv_1.gripCap) * a2.driveFactor
        local v46 = v41 * v42
        local v47 = 0
        if a3 then
            v47 = (a5 and (v47 + HILL_CLIMB_CONFIG_upv_1.engineForce * v45)) or v47
        end
        local v48 = nil
        if a4 then
            v48 = a1.velocityX * v42 + a1.velocityY * v46
            if v48 <= 0.5 then
                if not (a3) and a5 and a1.maxX - HILL_CLIMB_CONFIG_upv_1.reverseWallStuds < a1.x and -v48 < HILL_CLIMB_CONFIG_upv_1.reverseSpeedMax then
                    v47 = v47 - HILL_CLIMB_CONFIG_upv_1.reverseForce * v45
                end
            else
                v47 = v47 - math.min(HILL_CLIMB_CONFIG_upv_1.brakeForce * v45, (v48 / a6) * 0.5)
            end
        end
        if v47 ~= 0 then
            a1.forceX = a1.forceX + (v42 * v47)
            a1.forceY = a1.forceY + (v46 * v47)
            a1.torque = a1.torque + ((v37 * (v46 * v47)) - (((v38 - (HILL_CLIMB_CONFIG_upv_1.suspensionRest - v40)) - HILL_CLIMB_CONFIG_upv_1.wheelRadius) * (v42 * v47)))
        end
        a1.forceX = a1.forceX - (math.clamp(a1.velocityX, -1, 1) * HILL_CLIMB_CONFIG_upv_1.rollingResistance)
    else
        return nil
    end
end
u22.payTrick = function(a1, a2, a3)
    --[[
      name: payTrick
      line: 677
      upvalues:
        u16 (copy, index: 1)
    ]]
    a1.goldCollected = a1.goldCollected + a3
    a1.context.reportPickup(a1.goldCollected)
    a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.y + 4.5, 0), ("%* +%*"):format(a2, a3), u16, 0.9)
    a1.context.audio.play("coinTick", {})
end
u22.die = function(a1, a2)
    --[[
      name: die
      line: 689
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        u17 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1.gasHeldNow = false
        if a2 == "driver" and a1.airSeconds > 0.15 and HILL_CLIMB_CONFIG_upv_1.flipRadians <= math.abs(a1.airRotation) then
            a1.goldCollected = a1.goldCollected + HILL_CLIMB_CONFIG_upv_1.neckFlipBonusCoins
            a1.context.reportPickup(a1.goldCollected)
            a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.y + 6, 0), ("NECK FLIP +%*"):format(HILL_CLIMB_CONFIG_upv_1.neckFlipBonusCoins), u16, 1.1)
        end
        a1.engineAudio:update(false, 0, false)
        if a2 ~= "driver" then
            a1.context.audio.play("buzz", {})
            a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.y + 5, 0), "OUT OF FUEL", u17, 1.3)
        else
            a1.stage.shake(1.1)
            a1.context.audio.play("carCrash", {})
            a1.context.audio.play("buzz", {})
            a1.driverHead.Color = u17
            a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.y + 5, 0), "DRIVER DOWN", u17, 1.3)
        end
        local u23 = a1.distance:current()
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            HILL_CLIMB_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 731
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    u23 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(u23)
            end
        )
    end
end
u22.planAhead = function(a1)
    --[[
      name: planAhead
      line: 737
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v49 = a1.x + 170
    while true do
        local v50
        if a1.coinPlanX >= v49 then
            break
        end
        local v51 = a1.coinRandom:NextNumber()
        local v52 = a1.coinRandom:NextNumber()
        local v53 = a1.coinPlanX + (HILL_CLIMB_CONFIG_upv_1.coinSpacingMetres * HILL_CLIMB_CONFIG_upv_1.studsPerMetre) * (0.75 + (0.5 * v51))
        a1.terrain:ensureCoverage((v53 + ((HILL_CLIMB_CONFIG_upv_1.coinClusterMax - 1) * 2.4)) + 2)
        local v54 = math.floor(v52 * (1 + (math.clamp(v53 / HILL_CLIMB_CONFIG_upv_1.difficultyRampStuds, 0, 1) * (HILL_CLIMB_CONFIG_upv_1.coinClusterMax - 1)))) + 1
        local v55 = 0
        local v56 = false
        v56, v55 = v56, v55
        while true do
            if v56 then
                v55 = v55 + 1
            else
                v56 = true
            end
            local v57
            if v55 >= v54 then
                break
            end
            local freeCoins_1 = a1.freeCoins
            local v58 = #freeCoins_1
            v57 = freeCoins_1[v58]
            freeCoins_1[v58] = nil
            if v57 == nil then
                break
            end
            v57.x = v53 + (v55 * 2.4)
            v57.y = a1.terrain:heightAt(v57.x) + 1.6
            v57.active = true
        end
        a1.coinPlanX = v53
    end
    while a1.canPlanX < v49 do
        local v50 = false
        for _, value_5 in a1.cans do
            if not (value_5.active) then
                value_5.x = a1.canPlanX
                value_5.y = a1.terrain:heightAt(value_5.x) + 1
                value_5.active = true
                v50 = true
                break
            end
        end
        if v50 then
            a1.canPlanX = a1.canPlanX + (HILL_CLIMB_CONFIG_upv_1.fuelCanSpacingMetres * HILL_CLIMB_CONFIG_upv_1.studsPerMetre)
            continue
        else
            break
        end
    end
end
u22.collectPickups = function(a1)
    --[[
      name: collectPickups
      line: 799
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
        u18 (copy, index: 2)
    ]]
    local v59 = nil
    local v60 = nil
    for _, value_6 in a1.coins do
        if not (value_6.active) then
            continue
        end
        if value_6.x < a1.x - 70 then
            a1:releaseCoin(value_6)
            continue
        end
        v59 = value_6.x - a1.x
        v60 = value_6.y - a1.y
        if (v59 * v59) + (v60 * v60) < 9 then
            a1:releaseCoin(value_6)
            a1.goldCollected = a1.goldCollected + 1
            a1.context.reportPickup(a1.goldCollected)
            a1.context.audio.play("coinTick", {})
        end
    end
    local v61 = nil
    local v62 = nil
    for _, value_7 in a1.cans do
        if not (value_7.active) then
            continue
        end
        if value_7.x < a1.x - 70 then
            a1:parkCan(value_7)
            continue
        end
        v61 = value_7.x - a1.x
        v62 = value_7.y - a1.y
        if (v61 * v61) + (v62 * v62) < 12 then
            a1:parkCan(value_7)
            a1.fuel = HILL_CLIMB_CONFIG_upv_1.fuelSeconds
            a1.outOfFuelRest = 0
            a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.y + 4.5, 0), "FUEL", u18, 0.8)
            a1.context.audio.play("coinSettle", {})
        end
    end
end
u22.releaseCoin = function(a1, a2)
    --[[
      name: releaseCoin
      line: 846
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a2.active then
        table.insert(a1.freeCoins, a2)
    end
    a2.active = false
    a2.fallback.CFrame = u1
    local visual_1 = a2.visual
    if visual_1 == nil then
        return
    end
    visual_1:park()
end
u22.parkCan = function(a1, a2)
    --[[
      name: parkCan
      line: 859
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    for _, value_8 in a2.parts do
        value_8.CFrame = u1
    end
end
u22.restoreChassisLook = function(a1)
    --[[
      name: restoreChassisLook
      line: 865
      upvalues:
        u11 (copy, index: 1)
    ]]
    a1.driverHead.Color = u11
end
u22.render = function(a1, a2)
    --[[
      name: render
      line: 868
    ]]
    a1:drawScene(a2)
end
u22.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 871
    ]]
    a1:drawScene(a2)
end
u22.drawScene = function(a1, a2)
    --[[
      name: drawScene
      line: 874
      upvalues:
        lerp_upv_1 (copy, index: 1)
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 2)
        u15 (copy, index: 3)
        u14 (copy, index: 4)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local origin_1 = a1.stage.origin
    local v63 = lerp_upv_1(a1.renderPrevX, a1.x, renderAlpha_1)
    local v64 = lerp_upv_1(a1.renderPrevY, a1.y, renderAlpha_1)
    local v65 = lerp_upv_1(a1.renderPrevAngle, a1.angle, renderAlpha_1)
    local v66 = CFrame.new(origin_1 + Vector3.new(v63, v64, 0)) * CFrame.Angles(0, 0, v65)
    a1.chassis.CFrame = v66
    a1.cargoBed.CFrame = v66 * CFrame.new(-1.6, 1.2, 0)
    a1.rollBar.CFrame = v66 * CFrame.new(0.4, 1.6, 0)
    for _, value_9 in a1.wheels do
        if value_9.contact then
            value_9.spin = value_9.spin - (a1.velocityX / HILL_CLIMB_CONFIG_upv_1.wheelRadius * a2)
        end
        local v67 = v66 * CFrame.new(value_9.offsetX, -(HILL_CLIMB_CONFIG_upv_1.anchorDropY + (HILL_CLIMB_CONFIG_upv_1.suspensionRest - value_9.compression)), 0) * CFrame.Angles(0, 1.5707963267948966, 0) * CFrame.Angles(value_9.spin, 0, 0)
        value_9.part.CFrame = v67
        value_9.hubCap.CFrame = v67
    end
    a1.headBobVelocity = a1.headBobVelocity + ((((-a1.headBob * 60) - (a1.headBobVelocity * 9)) - ((a1.velocityX - a1.previousVelocityX) / math.max(a2, 0.004) * 0.02)) * a2)
    a1.headBob = math.clamp(a1.headBob + (a1.headBobVelocity * a2), -0.45, 0.45)
    a1.driverTorso.CFrame = v66 * CFrame.new(-0.4, 1.35, 0)
    local v68 = v66 * CFrame.new(HILL_CLIMB_CONFIG_upv_1.headOffsetX + (a1.headBob * 0.6), (HILL_CLIMB_CONFIG_upv_1.headOffsetY - 0.75) + 0.75, 0) * CFrame.Angles(0, 0, a1.headBob)
    a1.driverHead.CFrame = v68
    a1.driverCap.CFrame = v68 * CFrame.new(0.08, 0.75, 0)
    local v69 = a1.fuel / HILL_CLIMB_CONFIG_upv_1.fuelSeconds
    a1.fuelBarFill.Size = UDim2.new(math.max(v69, 0.02) * 0.92, 0, 0.62, 0)
    local v70 = v69 < HILL_CLIMB_CONFIG_upv_1.fuelWarnFraction
    local fuelBarFill_1 = a1.fuelBarFill
    local v71
    if v70 then
        v71 = u15
    else
        v71 = u14
    end
    fuelBarFill_1.BackgroundColor3 = v71
    a1.fuelBillboard.Enabled = not a1.dead
    local v72 = v70 and ((math.sin(os.clock() * 10) * 0.5) + 0.5 > 0.75)
    local fuelBarFill_2 = a1.fuelBarFill
    local v73
    if v72 then
        v73 = 0.55
    else
        v73 = 0
    end
    fuelBarFill_2.BackgroundTransparency = v73
    local gasHeldNow_1 = a1.gasHeldNow
    a1.exhaustClock = a1.exhaustClock - a2
    if not (a1.dead) and gasHeldNow_1 and a1.fuel > 0 and a1.exhaustClock <= 0 then
        a1.exhaustClock = 0.16
        a1.exhaust:Emit(2)
        if a1.rearWheel.contact then
            a1.dustAnchor.CFrame = CFrame.new(origin_1 + Vector3.new(v63 - HILL_CLIMB_CONFIG_upv_1.wheelBaseHalf, a1.terrain:heightAt(v63 - HILL_CLIMB_CONFIG_upv_1.wheelBaseHalf) + 0.3, 0))
            a1.dust:Emit(3)
        end
    end
    local v74 = math.clamp(math.abs(a1.velocityX) / 46, 0, 1)
    local v75 = a1.frontWheel.contact or (a1.rearWheel.contact)
    local v76
    if a1.dead or not gasHeldNow_1 then
        v76 = v74 * ((gasHeldNow_1 and 1) or 0.75)
    elseif a1.fuel <= 0 or v75 then
        v76 = v74 * ((gasHeldNow_1 and 1) or 0.75)
    else
        v76 = 1
    end
    local engineAudio_1 = a1.engineAudio
    local v77
    if gasHeldNow_1 then
        v77 = false
        if a1.fuel > 0 then
            v77 = not a1.dead
        end
    else
        v77 = gasHeldNow_1
    end
    local v78 = a1:isRunning() and (not a1.dead and (a1.fuel > 0))
    engineAudio_1:update(v77, v76, v78)
    local v79 = os.clock() * 2.2
    local v80 = nil
    for _, value_10 in a1.coins do
        if not (value_10.active) then
            continue
        end
        v80 = CFrame.new(origin_1 + Vector3.new(value_10.x, value_10.y, 0)) * CFrame.Angles(0, v79, 0)
        if value_10.visual == nil then
            value_10.fallback.CFrame = v80 * CFrame.Angles(0, 0, 1.5707963267948966)
        else
            value_10.visual:pose(v80)
        end
    end
    for _, value_11 in a1.cans do
        if value_11.active then
            value_11.parts[1].CFrame = CFrame.new(origin_1 + Vector3.new(value_11.x, value_11.y, 0))
            value_11.parts[2].CFrame = CFrame.new(origin_1 + Vector3.new(value_11.x + 0.45, value_11.y + 1.2, 0))
        end
    end
    a1.cameraX = a1.cameraX + (((v63 + HILL_CLIMB_CONFIG_upv_1.cameraLeadX) - a1.cameraX) * math.min(a2 * HILL_CLIMB_CONFIG_upv_1.cameraFollowRateX, 1))
    a1.cameraY = a1.cameraY + ((((a1.terrain:heightAt(v63) * 0.5) + (v64 * 0.5) + HILL_CLIMB_CONFIG_upv_1.cameraHeightOffset) - a1.cameraY) * math.min(a2 * HILL_CLIMB_CONFIG_upv_1.cameraFollowRateY, 1))
    a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
    a1.stage.camera.FieldOfView = HILL_CLIMB_CONFIG_upv_1.fieldOfViewBase + ((HILL_CLIMB_CONFIG_upv_1.fieldOfViewMax - HILL_CLIMB_CONFIG_upv_1.fieldOfViewBase) * v74)
    a1:recycleSegments()
end
u22.recycleSegments = function(a1)
    --[[
      name: recycleSegments
      line: 979
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v81 = math.floor((a1.cameraX - HILL_CLIMB_CONFIG_upv_1.segmentWindowBehind) / HILL_CLIMB_CONFIG_upv_1.segmentLength)
    while a1.segmentStart < v81 do
        a1:poseSegment(a1.segmentStart + HILL_CLIMB_CONFIG_upv_1.segmentPoolSize)
        a1.segmentStart = a1.segmentStart + 1
    end
    while v81 < a1.segmentStart do
        a1.segmentStart = a1.segmentStart - 1
        a1:poseSegment(a1.segmentStart)
    end
end
u22.layoutSegmentWindow = function(a1)
    --[[
      name: layoutSegmentWindow
      line: 992
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_2 = 0, HILL_CLIMB_CONFIG_upv_1.segmentPoolSize - 1 do
        a1:poseSegment(a1.segmentStart + n_2)
    end
end
u22.poseSegment = function(a1, a2)
    --[[
      name: poseSegment
      line: 997
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    local segmentPoolSize_1 = HILL_CLIMB_CONFIG_upv_1.segmentPoolSize
    local v82 = ((a2 % segmentPoolSize_1) + segmentPoolSize_1) % segmentPoolSize_1
    local v83 = a2 * HILL_CLIMB_CONFIG_upv_1.segmentLength
    local v84 = v83 + HILL_CLIMB_CONFIG_upv_1.segmentLength
    local v85 = a1.terrain:heightAt(v83)
    local v86 = a1.terrain:heightAt(v84)
    local v87 = math.atan2(v86 - v85, HILL_CLIMB_CONFIG_upv_1.segmentLength)
    local v88 = math.sqrt((HILL_CLIMB_CONFIG_upv_1.segmentLength * HILL_CLIMB_CONFIG_upv_1.segmentLength) + ((v86 - v85) * (v86 - v85)))
    local origin_2 = a1.stage.origin
    local v89 = (v83 + v84) / 2
    local v90 = (v85 + v86) / 2
    local v91 = a1.crustTiles[v82 + 1]
    v91.Size = Vector3.new(v88 + 0.3, 2.2, 5)
    v91.CFrame = CFrame.new(origin_2 + Vector3.new(v89, v90 - (math.cos(v87) * 1.1), 0)) * CFrame.Angles(0, 0, v87)
    local v92 = a1.fillTiles[v82 + 1]
    local v93 = v90 - 1.9
    v92.Size = Vector3.new(HILL_CLIMB_CONFIG_upv_1.segmentLength + 0.05, math.max(v93 - HILL_CLIMB_CONFIG_upv_1.fillBaseY, 0.1), 4.4)
    v92.CFrame = CFrame.new(origin_2 + Vector3.new(v89, (v93 + HILL_CLIMB_CONFIG_upv_1.fillBaseY) / 2, 0))
end
u22.destroy = function(a1)
    --[[
      name: destroy
      line: 1021
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    BaseWorldGame_upv_1.destroy(a1)
end
local tbl_9 = {}
tbl_9.HillClimbGame = u22
return tbl_9