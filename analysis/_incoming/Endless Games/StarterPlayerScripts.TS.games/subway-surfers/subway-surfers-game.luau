-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local adoptAvatar_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "avatar-rig").adoptAvatar
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "coin-visual")
local CoinVisual_upv_1 = v1.CoinVisual
local findCoinTemplate_upv_1 = v1.findCoinTemplate
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "distance-score").DistanceScore
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local v3 = RuntimeLib_1.import(script, script.Parent, "guard-chaser")
local applyRunPose_upv_1 = v3.applyRunPose
local applyTuckPose_upv_1 = v3.applyTuckPose
local GuardChaser_upv_1 = v3.GuardChaser
local HoverboardVisual_upv_1 = RuntimeLib_1.import(script, script.Parent, "hoverboard-visual").HoverboardVisual
local PowerUpHud_upv_1 = RuntimeLib_1.import(script, script.Parent, "power-up-hud").PowerUpHud
local SUBWAY_SURFERS_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "subway-surfers-config").SUBWAY_SURFERS_CONFIG
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(11, 12, 17)
local u3 = Color3.fromRGB(52, 50, 58)
local u4 = Color3.fromRGB(46, 44, 52)
local u5 = Color3.fromRGB(36, 38, 46)
local u6 = Color3.fromRGB(64, 68, 80)
local u7 = Color3.fromRGB(206, 160, 60)
local u8 = Color3.fromRGB(96, 128, 196)
local u9 = Color3.fromRGB(150, 60, 56)
local u10 = Color3.fromRGB(224, 210, 180)
local u11 = Color3.fromRGB(190, 168, 110)
local u12 = Color3.fromRGB(255, 205, 80)
local u13 = Color3.fromRGB(255, 216, 102)
local u14 = Color3.fromRGB(255, 90, 100)
local u15 = Color3.fromRGB(120, 220, 255)
local u16 = Color3.fromRGB(255, 255, 255)
local tbl_upv_1 = {"jetpack", "magnet", "double", "sneakers"}
local tbl_upv_2 = {}
tbl_upv_2.jetpack = Color3.fromRGB(255, 150, 70)
tbl_upv_2.magnet = Color3.fromRGB(255, 96, 96)
tbl_upv_2.double = Color3.fromRGB(196, 130, 255)
tbl_upv_2.sneakers = Color3.fromRGB(96, 220, 130)
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
tbl_upv_5.jetpack = SUBWAY_SURFERS_CONFIG_upv_1.jetpackDurationSeconds
tbl_upv_5.magnet = SUBWAY_SURFERS_CONFIG_upv_1.magnetDurationSeconds
tbl_upv_5.double = SUBWAY_SURFERS_CONFIG_upv_1.doubleDurationSeconds
tbl_upv_5.sneakers = SUBWAY_SURFERS_CONFIG_upv_1.sneakersDurationSeconds
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 93
    ]]
    return "SubwaySurfersGame"
end
tbl_7.__index = BaseWorldGame_upv_1
local u17 = setmetatable(tbl_6, tbl_7)
u17.__index = u17
u17.new = function(...)
    --[[
      name: new
      line: 99
      upvalues:
        u17 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u17)
    return v4:constructor(...) or v4
end
u17.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 103
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        GuardChaser_upv_1 (copy, index: 2)
        HoverboardVisual_upv_1 (copy, index: 3)
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 4)
        DistanceScore_upv_1 (copy, index: 5)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.guard = GuardChaser_upv_1.new()
    a1.hoverboard = HoverboardVisual_upv_1.new()
    a1.obstacles = {}
    a1.coins = {}
    a1.powerUps = {}
    a1.floorTiles = {}
    a1.pillars = {}
    a1.laneIndex = 1
    a1.playerX = 0
    a1.hopping = false
    a1.hopFromLane = 1
    a1.hopFromX = 0
    a1.hopProgress = 0
    a1.playerY = 0
    a1.verticalVelocity = 0
    a1.airborne = false
    a1.rolling = false
    a1.rollRemaining = 0
    a1.queuedVerticalRemaining = 0
    a1.slamPending = false
    a1.swipedThisPress = false
    a1.runStartClock = 0
    a1.pressBeganClock = -math.huge
    a1.lastTapClock = -math.huge
    a1.playerS = 0
    a1.elapsed = 0
    a1.speed = SUBWAY_SURFERS_CONFIG_upv_1.speedStart
    a1.speedDipRemaining = 0
    a1.runPhase = 0
    a1.distance = DistanceScore_upv_1.new(SUBWAY_SURFERS_CONFIG_upv_1.studsPerPoint)
    a1.coinsCollected = 0
    a1.powerUpRemaining = 0
    a1.doubleRemaining = 0
    a1.hoverboardRemaining = 0
    a1.hoverboardCooldown = 0
    a1.stumbleRemaining = 0
    a1.guardDistance = SUBWAY_SURFERS_CONFIG_upv_1.guardMaxDistance
    a1.guardX = 0
    a1.caughtLungeRemaining = 0
    a1.nextRowS = 0
    a1.safeLane = 1
    a1.laneBlockedUntilS = {0, 0, 0}
    a1.sectionRowsLeft = 0
    a1.lastMovingSectionElapsed = -math.huge
    a1.lastTrainRunEndS = -math.huge
    a1.smoothedCameraX = 0
    a1.smoothedHeight = 0
    a1.invulnRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.rowSeed = 1
    a1.rowRandom = Random.new()
end
u17.buildScene = function(a1)
    --[[
      name: buildScene
      line: 158
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u5 (copy, index: 5)
        makeStagePart_upv_1 (copy, index: 6)
        u3 (copy, index: 7)
        u4 (copy, index: 8)
        u6 (copy, index: 9)
        u1 (copy, index: 10)
        findCoinTemplate_upv_1 (copy, index: 11)
        u12 (copy, index: 12)
        CoinVisual_upv_1 (copy, index: 13)
        markWorldArt_upv_1 (copy, index: 14)
        u16 (copy, index: 15)
        adoptAvatar_upv_1 (copy, index: 16)
        PowerUpHud_upv_1 (copy, index: 17)
        PopupTextPool_upv_1 (copy, index: 18)
    ]]
    local container_1 = a1.stage.container
    local origin_upv_1 = a1.stage.origin
    a1.stage.camera.FieldOfView = SUBWAY_SURFERS_CONFIG_upv_1.camera.fieldOfView
    makeFrontalBackdrop_upv_1(a1.stage, u2)
    local v5 = makeSmoothPart_upv_1(container_1)
    v5.Material = Enum.Material.Neon
    v5.Color = u2
    v5.Size = Vector3.new(400, 220, 1)
    v5.CFrame = CFrame.new(origin_upv_1 + Vector3.new(0, 70, 320))
    local v6 = nil
    for key_1, value_1 in {-1, 1} do
        v6 = makeSmoothPart_upv_1(container_1)
        v6.Color = u5
        v6.Size = Vector3.new(1, 4, 560)
        v6.CFrame = CFrame.new(origin_upv_1 + Vector3.new(value_1 * 11.4, 1.5, 200))
    end
    local v7 = nil
    for n_1 = 0, 2 do
        local v8 = makeStagePart_upv_1(container_1)
        v8.Size = Vector3.new(24, 1, 90)
        if n_1 % 2 ~= 0 then
            v7 = u4
        else
            v7 = u3
        end
        v8.Color = v7
        table.insert(a1.floorTiles, v8)
    end
    for _ = 0, 11 do
        local key_1 = makeStagePart_upv_1(container_1)
        key_1.Color = u6
        key_1.Size = Vector3.new(0.800000011920929, 6, 0.800000011920929)
        key_1.CFrame = u1
        table.insert(a1.pillars, key_1)
    end
    for n_2 = 0, SUBWAY_SURFERS_CONFIG_upv_1.obstaclePoolSize - 1 do
        table.insert(a1.obstacles, {body = makeStagePart_upv_1(container_1), accent = makeSmoothPart_upv_1(container_1)})
        a1:parkObstacle(a1.obstacles[n_2 + 1])
    end
    local v9 = findCoinTemplate_upv_1()
    for _ = 0, SUBWAY_SURFERS_CONFIG_upv_1.coinPoolSize - 1 do
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Shape = Enum.PartType.Ball
        v10.Material = Enum.Material.Neon
        v10.Color = u12
        v10.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
        v10.CFrame = u1
        v6 = nil
        if v9 ~= nil then
            local v11 = CoinVisual_upv_1:make(v9, container_1, {})
            v10.Transparency = 1
            v6 = v11
        end
        table.insert(a1.coins, {part = v10, visual = v6})
    end
    for n_3 = 0, SUBWAY_SURFERS_CONFIG_upv_1.powerUpPoolSize - 1 do
        local v12 = makeSmoothPart_upv_1(container_1)
        v12.Material = Enum.Material.Neon
        v12.Size = Vector3.new(2.200000047683716, 2.200000047683716, 2.200000047683716)
        v12.CFrame = u1
        v6 = Instance.new("BillboardGui")
        v6.Size = UDim2.fromScale(1.4, 1.4)
        v6.LightInfluence = 0
        markWorldArt_upv_1(v6)
        v6.Parent = v12
        local v13 = Instance.new("TextLabel")
        v13.BackgroundTransparency = 1
        v13.Size = UDim2.fromScale(1, 1)
        v13.Font = Enum.Font.GothamBlack
        v13.TextScaled = true
        v13.TextColor3 = u16
        v13.Parent = v6
        table.insert(a1.powerUps, {part = v12, label = v13})
        a1:parkPowerUp(a1.powerUps[n_3 + 1])
    end
    a1.fallbackBody = makeStagePart_upv_1(container_1)
    a1.fallbackBody.Size = Vector3.new(1.600000023841858, 2.200000047683716, 1.2000000476837158)
    a1.fallbackBody.Color = Color3.fromRGB(60, 120, 180)
    a1.fallbackHead = makeStagePart_upv_1(container_1)
    a1.fallbackHead.Size = Vector3.new(1, 1, 1)
    a1.fallbackHead.Color = Color3.fromRGB(245, 205, 48)
    local function onAdopted_1(a2)
        --[[
          name: onAdopted
          line: 280
          upvalues:
            a1 (copy, index: 1)
            u1 (copy, index: 2)
        ]]
        a1.avatarRig = a2
        a1.fallbackBody.CFrame = u1
        a1.fallbackHead.CFrame = u1
    end
    adoptAvatar_upv_1({container = container_1, janitor = a1.context.janitor, onAdopted = onAdopted_1})
    a1.guard:build(container_1, a1.context.janitor)
    a1.hoverboard:build(container_1)
    a1.hud = PowerUpHud_upv_1.new(container_1)
    a1.popups = PopupTextPool_upv_1.new(container_1, 5)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 290
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.swipedThisPress = false
                a1.pressBeganClock = os.clock()
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a3, a4)
                --[[
                  line: 294
                  upvalues:
                    a1 (copy, index: 1)
                    SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 2)
                ]]
                if not (a1.swipedThisPress) and SUBWAY_SURFERS_CONFIG_upv_1.tapMaxSeconds >= a4 then
                    if a1.pressBeganClock > a1.runStartClock + SUBWAY_SURFERS_CONFIG_upv_1.startTapGrace then
                        a1:onTap()
                        return
                    end
                    return nil
                end
                return nil
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a5)
                --[[
                  line: 305
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a5)
            end
        )
    )
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_8 = {}
        tbl_8.scoreToStuds = function(a6)
            --[[
              name: scoreToStuds
              line: 316
              upvalues:
                SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a6 * SUBWAY_SURFERS_CONFIG_upv_1.studsPerPoint
        end
        tbl_8.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 319
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.playerS
        end
        tbl_8.poseMarker = function(a7)
            --[[
              name: poseMarker
              line: 322
              upvalues:
                a1 (copy, index: 1)
                origin_upv_1 (copy, index: 2)
            ]]
            local v14 = a7 - a1.playerS
            if v14 <= 220 and v14 >= -20 then
                return CFrame.new(origin_upv_1.X - 10.9, origin_upv_1.Y + 5, origin_upv_1.Z + v14)
            end
            return nil
        end
        registerRivalMarkers_1(tbl_8)
    end
end
u17.resetRound = function(a1)
    --[[
      name: resetRound
      line: 339
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.rowSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    a1.rowRandom = Random.new(a1.rowSeed)
    a1.runStartClock = os.clock()
    a1.dead = false
    a1.laneIndex = 1
    a1.playerX = 0
    a1.hopping = false
    a1.playerY = 0
    a1.verticalVelocity = 0
    a1.airborne = false
    a1.rolling = false
    a1.rollRemaining = 0
    a1.queuedLane = nil
    a1.queuedVertical = nil
    a1.queuedVerticalRemaining = 0
    a1.slamPending = false
    a1.swipedThisPress = false
    a1.pressBeganClock = -math.huge
    a1.lastTapClock = -math.huge
    a1.playerS = 0
    a1.elapsed = 0
    a1.speed = SUBWAY_SURFERS_CONFIG_upv_1.speedStart
    a1.speedDipRemaining = 0
    a1.runPhase = 0
    a1.distance:reset()
    a1.coinsCollected = 0
    a1.powerUpKind = nil
    a1.powerUpRemaining = 0
    a1.doubleRemaining = 0
    a1.hoverboardRemaining = 0
    a1.hoverboardCooldown = 0
    a1.hoverboard:reset()
    a1.hud:hideAll()
    a1.stumbleRemaining = 0
    a1.guardDistance = SUBWAY_SURFERS_CONFIG_upv_1.guardMaxDistance
    a1.guardX = 0
    a1.caughtLungeRemaining = 0
    a1.invulnRemaining = 0
    a1.smoothedCameraX = 0
    a1.smoothedHeight = 0
    for _, value_2 in a1.obstacles do
        a1:parkObstacle(value_2)
    end
    for _, value_3 in a1.coins do
        a1:parkCoin(value_3)
    end
    for _, value_4 in a1.powerUps do
        a1:parkPowerUp(value_4)
    end
    a1.safeLane = 1
    a1.laneBlockedUntilS[1] = 0
    a1.laneBlockedUntilS[2] = 0
    a1.laneBlockedUntilS[3] = 0
    a1.lastMovingSectionElapsed = -math.huge
    a1.lastTrainRunEndS = -math.huge
    a1.nextRowS = 60
    a1.sectionRowsLeft = 6
    a1:generateAhead()
    a1.context.reportScore(0)
end
u17.captureRound = function(a1)
    --[[
      name: captureRound
      line: 402
    ]]
    return nil
end
u17.restoreRound = function(a1)
    --[[
      name: restoreRound
      line: 405
    ]]
    return false
end
u17.revive = function(a1)
    --[[
      name: revive
      line: 408
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.runStartClock = os.clock()
    a1.invulnRemaining = SUBWAY_SURFERS_CONFIG_upv_1.reviveInvulnSeconds
    a1.stumbleRemaining = 0
    a1.speedDipRemaining = 0
    a1.guardDistance = SUBWAY_SURFERS_CONFIG_upv_1.guardMaxDistance
    a1.caughtLungeRemaining = 0
    a1.hopping = false
    a1.playerY = 0
    a1.verticalVelocity = 0
    a1.airborne = false
    a1.rolling = false
    a1.queuedLane = nil
    a1.queuedVertical = nil
    a1.queuedVerticalRemaining = 0
    a1.slamPending = false
    a1.playerX = a1:laneX(a1.laneIndex)
    a1.powerUpKind = nil
    a1.powerUpRemaining = 0
    a1.doubleRemaining = 0
    a1.hoverboardRemaining = 0
    a1.hoverboard:setRiding(false)
    local v15 = a1.playerS + SUBWAY_SURFERS_CONFIG_upv_1.reviveClearAhead
    local v16 = true
    while v16 do
        v16 = false
        local v17 = nil
        for _, value_5 in a1.obstacles do
            if not (value_5.active) or value_5.kind ~= "train" or value_5.endS <= a1.playerS - SUBWAY_SURFERS_CONFIG_upv_1.reviveClearBehind or v15 <= value_5.startS then
                continue
            end
            v17 = value_5.endS + SUBWAY_SURFERS_CONFIG_upv_1.trainRunGapMax + 1
            if v15 < v17 then
                v15, v16 = v17, true
            end
        end
    end
    local v17
    local v18 = nil
    for _, value_6 in a1.obstacles do
        if not (value_6.active) then
            continue
        end
        v18 = true
        if value_6.kind ~= "movingTrain" then
            v18 = false
            if a1.playerS - SUBWAY_SURFERS_CONFIG_upv_1.reviveClearBehind < value_6.endS then
                v18 = value_6.startS < v15
            end
        end
        if v18 then
            a1:parkObstacle(value_6)
        end
    end
    for _, value_7 in a1.coins do
        if not (value_7.active) then
            continue
        end
        if value_7.s < a1.playerS + 6 then
            a1:parkCoin(value_7)
        end
    end
    for _, value_8 in a1.powerUps do
        if not (value_8.active) then
            continue
        end
        if value_8.s < a1.playerS + 6 then
            a1:parkPowerUp(value_8)
        end
    end
    a1:setRunning(true)
end
u17.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 481
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        if a1.stumbleRemaining > 0 then
            a1.stumbleRemaining = a1.stumbleRemaining - a2
        end
        if a1.speedDipRemaining > 0 then
            a1.speedDipRemaining = a1.speedDipRemaining - a2
        end
        a1:tickPowerUps(a2)
        a1:consumeQueuedActions(a2)
        if a1.hopping then
            a1.hopProgress = a1.hopProgress + (a2 / SUBWAY_SURFERS_CONFIG_upv_1.hopDuration)
            if a1.hopProgress < 1 then
                a1.playerX = a1.hopFromX + ((a1:laneX(a1.laneIndex) - a1.hopFromX) * ((a1.hopProgress * a1.hopProgress) * (3 - (2 * a1.hopProgress))))
            else
                a1.hopping = false
                a1.playerX = a1:laneX(a1.laneIndex)
            end
        end
        if a1.rolling then
            a1.rollRemaining = a1.rollRemaining - a2
            if a1.rollRemaining <= 0 then
                a1.rolling = false
            end
        end
        local v19 = nil
        if a1.powerUpKind ~= "jetpack" then
            v19 = a1:groundHeightAt(a1.playerS, a1.laneIndex)
            if v19 + 0.01 < a1.playerY or a1.verticalVelocity > 0 then
                a1.verticalVelocity = a1.verticalVelocity - (SUBWAY_SURFERS_CONFIG_upv_1.verticalGravity * a2)
                a1.playerY = a1.playerY + (a1.verticalVelocity * a2)
                if a1.playerY <= v19 and a1.verticalVelocity <= 0 then
                    a1.playerY = v19
                    a1.verticalVelocity = 0
                    a1.context.audio.play("thud", {})
                    if a1.slamPending then
                        a1:beginSlamRoll()
                    end
                end
                a1.airborne = (v19 + 0.05) < a1.playerY
            else
                a1.playerY = v19
                a1.verticalVelocity = 0
                a1.airborne = false
                if a1.slamPending then
                    a1:beginSlamRoll()
                end
            end
        else
            a1.playerY = a1.playerY + ((SUBWAY_SURFERS_CONFIG_upv_1.jetpackHeight - a1.playerY) * math.min(a2 * SUBWAY_SURFERS_CONFIG_upv_1.jetpackRiseRate, 1))
            a1.verticalVelocity = 0
            a1.airborne = true
            a1.rolling = false
            a1.slamPending = false
        end
        a1.elapsed = a1.elapsed + a2
        a1.speed = SUBWAY_SURFERS_CONFIG_upv_1.speedStart + ((SUBWAY_SURFERS_CONFIG_upv_1.speedMax - SUBWAY_SURFERS_CONFIG_upv_1.speedStart) * math.min(a1.elapsed / SUBWAY_SURFERS_CONFIG_upv_1.speedRampSeconds, 1))
        if a1.speedDipRemaining > 0 then
            a1.speed = a1.speed * SUBWAY_SURFERS_CONFIG_upv_1.stumbleSpeedDipFactor
        end
        local v20 = a1.speed * a2
        a1.playerS = a1.playerS + v20
        a1.runPhase = a1.runPhase + (((a2 * math.min(a1.speed / SUBWAY_SURFERS_CONFIG_upv_1.strideLength, SUBWAY_SURFERS_CONFIG_upv_1.runCycleMaxHz)) * math.pi) * 2)
        for key_2, value_9 in a1.obstacles do
            if not (value_9.active) or value_9.speed == 0 then
                continue
            end
            value_9.startS = value_9.startS + (value_9.speed * a2)
            value_9.endS = value_9.endS + (value_9.speed * a2)
            if value_9.endS < value_9.killS then
                a1:parkObstacle(value_9)
                continue
            end
            if value_9.warned then
                continue
            end
            if (value_9.startS - a1.playerS) / (a1.speed - value_9.speed) < SUBWAY_SURFERS_CONFIG_upv_1.movingTrainWarnSeconds then
                value_9.warned = true
                a1.context.audio.play("buzz", {})
            end
        end
        a1:generateAhead()
        local playerY_1 = a1.playerY
        local v21 = nil
        if a1.rolling then
            local rollHitboxHeight_1 = SUBWAY_SURFERS_CONFIG_upv_1.rollHitboxHeight
        else
            v21 = SUBWAY_SURFERS_CONFIG_upv_1.standHitboxHeight
        end
        local v22 = playerY_1 + v21
        local v23, v24 = v22, playerY_1
        local v25 = nil
        local v26 = nil
        local v27 = nil
        local v28 = nil
        for _, value_10 in a1.obstacles do
            if not (value_10.active) then
                continue
            end
            if value_10.endS < a1.playerS - SUBWAY_SURFERS_CONFIG_upv_1.despawnBehindDistance then
                a1:parkObstacle(value_10)
                continue
            end
            if a1.powerUpKind == "jetpack" or value_10.kind == "ramp" then
                continue
            end
            v25 = false
            if a1.playerS - SUBWAY_SURFERS_CONFIG_upv_1.playerHalfLength <= value_10.endS then
                v25 = value_10.startS <= a1.playerS + SUBWAY_SURFERS_CONFIG_upv_1.playerHalfLength
            end
            if not (v25) then
                continue
            end
            v26 = math.abs(a1:laneX(value_10.laneIndex) - a1.playerX)
            v27 = SUBWAY_SURFERS_CONFIG_upv_1.obstacleHalfWidth + SUBWAY_SURFERS_CONFIG_upv_1.playerHalfWidth
            if v27 <= v26 then
                continue
            end
            v28 = ((value_10.kind ~= "train") and 0.1) or (SUBWAY_SURFERS_CONFIG_upv_1.trainStepUpTolerance)
            if v23 <= value_10.bottom or value_10.top <= v24 + v28 or a1.invulnRemaining > 0 then
                continue
            end
            if a1.hopping then
                if v27 - v26 > SUBWAY_SURFERS_CONFIG_upv_1.grazeMaxPenetration then
                    a1:crash()
                    if not (a1.dead) then
                        continue
                    end
                    return nil
                end
                a1:stumble()
                if a1.dead then
                    return nil
                end
            else
                a1:crash()
                if not (a1.dead) then
                    continue
                end
                return nil
            end
        end
        local v29 = (v24 + v23) / 2
        local key_2 = a1.powerUpKind == "magnet"
        local rollHitboxHeight_1 = v29
        local v30 = nil
        local _ = nil
        local v34 = nil
        local v31 = nil
        for v35, value_11 in a1.coins do
            if not (value_11.active) then
                continue
            end
            if value_11.s < a1.playerS - 10 then
                a1:parkCoin(value_11)
                continue
            end
            if key_2 then
                v31 = value_11.s - a1.playerS
                if -SUBWAY_SURFERS_CONFIG_upv_1.magnetRangeBehind < v31 and v31 < SUBWAY_SURFERS_CONFIG_upv_1.magnetRangeAhead then
                    local v32 = math.min(a2 * SUBWAY_SURFERS_CONFIG_upv_1.magnetPullRate, 1)
                    value_11.s = value_11.s + ((a1.playerS - value_11.s) * v32)
                    value_11.x = value_11.x + ((a1.playerX - value_11.x) * v32)
                    value_11.y = value_11.y + ((rollHitboxHeight_1 - value_11.y) * v32)
                end
            end
            v30 = math.abs(value_11.s - a1.playerS)
            if v30 >= (((not key_2) and 1.8) or (SUBWAY_SURFERS_CONFIG_upv_1.magnetCollectRadius)) then
                continue
            end
            v30 = math.abs(value_11.x - a1.playerX)
            if v30 >= (((not key_2) and 2) or (SUBWAY_SURFERS_CONFIG_upv_1.magnetCollectRadius)) then
                continue
            end
            v30 = math.abs(value_11.y - rollHitboxHeight_1)
            if v30 < ((key_2 and 3) or 2.4) then
                a1:collectCoin(value_11)
            end
        end
        for v36, value_12 in a1.powerUps do
            if not (value_12.active) then
                continue
            end
            if value_12.s < a1.playerS - 10 then
                a1:parkPowerUp(value_12)
                continue
            end
            if math.abs(value_12.s - a1.playerS) >= 2 or math.abs(a1:laneX(value_12.laneIndex) - a1.playerX) >= 2.2 then
                continue
            end
            if a1.playerY < SUBWAY_SURFERS_CONFIG_upv_1.powerUpHoverHeight + 2.5 then
                a1:parkPowerUp(value_12)
                a1:activatePowerUp(value_12.kind)
            end
        end
        a1.guardDistance = math.min(a1.guardDistance + (SUBWAY_SURFERS_CONFIG_upv_1.guardRecoverRate * a2), SUBWAY_SURFERS_CONFIG_upv_1.guardMaxDistance)
        local v33
        if a1.doubleRemaining <= 0 then
            v33 = v20
        else
            v33 = v20 * 2
        end
        if a1.distance:advance(v33) then
            a1.context.reportScore(a1.distance:current())
        end
    end
end
u17.tickPowerUps = function(a1, a2)
    --[[
      name: tickPowerUps
      line: 673
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.powerUpRemaining > 0 then
        a1.powerUpRemaining = a1.powerUpRemaining - a2
        if a1.powerUpRemaining <= 0 then
            if a1.powerUpKind == "jetpack" then
                a1.invulnRemaining = math.max(a1.invulnRemaining, SUBWAY_SURFERS_CONFIG_upv_1.jetpackEndInvulnSeconds)
            end
            a1.powerUpKind = nil
        end
    end
    if a1.doubleRemaining > 0 then
        a1.doubleRemaining = a1.doubleRemaining - a2
    end
    if a1.hoverboardRemaining > 0 then
        a1.hoverboardRemaining = a1.hoverboardRemaining - a2
        if a1.hoverboardRemaining <= 0 then
            a1.hoverboardCooldown = SUBWAY_SURFERS_CONFIG_upv_1.hoverboardCooldownSeconds
            a1.hoverboard:setRiding(false)
            a1.context.audio.play("pop", {})
        end
    end
    if a1.hoverboardCooldown <= 0 then
        return
    end
    a1.hoverboardCooldown = a1.hoverboardCooldown - a2
end
u17.collectCoin = function(a1, a2)
    --[[
      name: collectCoin
      line: 702
      upvalues:
        u13 (copy, index: 1)
    ]]
    a1:parkCoin(a2)
    a1.coinsCollected = a1.coinsCollected + 1
    a1.context.audio.play("coinTick", {pitch = 1 + ((a1.coinsCollected % 10) * 0.04)})
    if a1.coinsCollected % 10 == 0 then
        a1.popups:show(a1:playerPosition() + Vector3.new(0, 5, 0), ("+%*"):format(a1.coinsCollected), u13, 0.8)
    end
    a1.context.reportPickup(a1.coinsCollected)
end
u17.beginSlamRoll = function(a1)
    --[[
      name: beginSlamRoll
      line: 717
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.slamPending = false
    a1.rolling = true
    a1.rollRemaining = SUBWAY_SURFERS_CONFIG_upv_1.rollDuration
    a1.context.audio.play("whoosh", {})
end
u17.render = function(a1, a2)
    --[[
      name: render
      line: 726
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local origin_2 = a1.stage.origin
    if not (a1.dead) then
        a1:poseRunner()
    end
    a1.guardX = a1.guardX + ((a1.playerX - a1.guardX) * math.min(a2 * SUBWAY_SURFERS_CONFIG_upv_1.guardLerpRate, 1))
    a1.guard:pose(origin_2 + Vector3.new(a1.guardX, 0, -a1.guardDistance), a1.runPhase * SUBWAY_SURFERS_CONFIG_upv_1.guardRunPhaseFactor)
    local v34 = nil
    local v35 = nil
    for _, value_13 in a1.obstacles do
        if not (value_13.active) then
            continue
        end
        v34 = (value_13.startS + value_13.endS) / 2 - a1.playerS
        v35 = a1:laneX(value_13.laneIndex)
        if value_13.kind == "ramp" then
            local v36 = math.atan(SUBWAY_SURFERS_CONFIG_upv_1.trainHeight / (value_13.endS - value_13.startS))
            value_13.body.CFrame = CFrame.new(origin_2 + Vector3.new(v35, (SUBWAY_SURFERS_CONFIG_upv_1.trainHeight / 2) - 0.5, v34)) * CFrame.Angles(-v36, 0, 0)
            value_13.accent.CFrame = u1
            continue
        end
        value_13.body.CFrame = CFrame.new(origin_2 + Vector3.new(v35, (value_13.bottom + value_13.top) / 2, v34))
        if value_13.kind == "train" then
            value_13.accent.CFrame = CFrame.new(origin_2 + Vector3.new(v35, value_13.top - 2, (value_13.startS - a1.playerS) + 0.2))
            continue
        end
        if value_13.kind ~= "movingTrain" then
            value_13.accent.CFrame = value_13.body.CFrame * CFrame.new(0, 0, -1.05)
        else
            value_13.accent.CFrame = CFrame.new(origin_2 + Vector3.new(v35, value_13.top - 2, (value_13.startS - a1.playerS) + 0.2))
        end
    end
    local v37 = os.clock() * 4
    local v38 = nil
    for _, value_14 in a1.coins do
        if not (value_14.active) then
            continue
        end
        v38 = CFrame.new(origin_2 + Vector3.new(value_14.x, value_14.y + (math.sin(v37 + value_14.s) * 0.15), value_14.s - a1.playerS)) * CFrame.Angles(0, v37, 0)
        if value_14.visual == nil then
            value_14.part.CFrame = v38
        else
            value_14.visual:pose(v38)
        end
    end
    for key_3, value_15 in a1.powerUps do
        if value_15.active then
            value_15.part.CFrame = CFrame.new(origin_2 + Vector3.new(a1:laneX(value_15.laneIndex), SUBWAY_SURFERS_CONFIG_upv_1.powerUpHoverHeight + (math.sin(v37 + value_15.s) * 0.25), value_15.s - a1.playerS)) * CFrame.Angles(0, v37 * 0.7, 0)
        end
    end
    a1.hoverboard:update(a2)
    if a1.hoverboardRemaining > 0 then
        local v39 = math.clamp((a1:laneX(a1.laneIndex) - a1.playerX) * 0.08, -0.35, 0.35)
        a1.hoverboard:pose(origin_2 + Vector3.new(a1.playerX, a1.playerY, 0), v39)
    end
    a1:updateHudChips()
    for n_4 = 0, #a1.floorTiles - 1 do
        a1.floorTiles[n_4 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(0, -0.5, ((((((n_4 * 90) - a1.playerS) % 270) + 270) % 270) - 50) + 45))
    end
    for n_5 = 0, #a1.pillars - 1 do
        local key_3 = ((n_5 % 2 ~= 0) and 1) or -1
        local v40 = math.floor(n_5 / 2) * 30 * 2
        local v41
        if key_3 ~= 1 then
            v41 = 0
        else
            v41 = 30
        end
        a1.pillars[n_5 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(key_3 * 10.6, 2.5, (((((v40 + v41) - a1.playerS) % 360) + 360) % 360) - 50))
    end
    a1:updateCamera(a2)
end
u17.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 810
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        if a1.caughtLungeRemaining > 0 then
            a1.caughtLungeRemaining = a1.caughtLungeRemaining - a2
            a1.guardDistance = SUBWAY_SURFERS_CONFIG_upv_1.guardCloseDistance * (1 - (1 - math.max(a1.caughtLungeRemaining / SUBWAY_SURFERS_CONFIG_upv_1.catchLungeSeconds, 0)))
            a1.guard:pose(a1.stage.origin + Vector3.new(a1.guardX, 0, -a1.guardDistance), a1.runPhase * SUBWAY_SURFERS_CONFIG_upv_1.guardRunPhaseFactor)
        end
    else
        a1:render(a2)
        return nil
    end
end
u17.updateCamera = function(a1, a2)
    --[[
      name: updateCamera
      line: 825
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_3 = a1.stage.origin
    a1.smoothedCameraX = a1.smoothedCameraX + (((a1.playerX * 0.6) - a1.smoothedCameraX) * math.min(a2 * SUBWAY_SURFERS_CONFIG_upv_1.camera.followRate, 1))
    a1.smoothedHeight = a1.smoothedHeight + (((a1.playerY * SUBWAY_SURFERS_CONFIG_upv_1.camera.heightFollowFactor) - a1.smoothedHeight) * math.min(a2 * 6, 1))
    a1.stage.setCameraCFrame(CFrame.lookAt(origin_3 + Vector3.new(a1.smoothedCameraX, SUBWAY_SURFERS_CONFIG_upv_1.camera.up + a1.smoothedHeight - (((not (a1.rolling)) and 0) or (SUBWAY_SURFERS_CONFIG_upv_1.camera.rollDip)), SUBWAY_SURFERS_CONFIG_upv_1.camera.back), origin_3 + Vector3.new(a1.playerX * 0.85, SUBWAY_SURFERS_CONFIG_upv_1.camera.lookHeight + a1.smoothedHeight, SUBWAY_SURFERS_CONFIG_upv_1.camera.lookAhead)))
end
u17.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 836
    ]]
    if a1.dead then
        return nil
    end
    a1.swipedThisPress = true
    if a2 ~= "left" and a2 ~= "right" then
        if a2 ~= "up" then
            a1:queueVertical("roll")
        else
            a1:queueVertical("jump")
        end
        return
    end
    a1.queuedLane = a2
end
u17.onTap = function(a1)
    --[[
      name: onTap
      line: 851
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v42
    if a1.dead then
        return nil
    end
    v42 = os.clock()
    if v42 - a1.lastTapClock > SUBWAY_SURFERS_CONFIG_upv_1.doubleTapSeconds then
        a1.lastTapClock = v42
        a1:queueVertical("jump")
    else
        a1.lastTapClock = -math.huge
        a1:tryActivateHoverboard()
        return nil
    end
end
u17.queueVertical = function(a1, a2)
    --[[
      name: queueVertical
      line: 864
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.queuedVertical = a2
    a1.queuedVerticalRemaining = SUBWAY_SURFERS_CONFIG_upv_1.actionBufferSeconds
end
u17.consumeQueuedActions = function(a1, a2)
    --[[
      name: consumeQueuedActions
      line: 868
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.queuedVertical ~= nil then
        a1.queuedVerticalRemaining = a1.queuedVerticalRemaining - a2
        if a1.queuedVerticalRemaining <= 0 then
            a1.queuedVertical = nil
        end
    end
    local queuedLane_1 = a1.queuedLane
    if queuedLane_1 ~= nil then
        if not (a1.hopping) then
            local queuedVertical_1 = a1.laneIndex + (((queuedLane_1 ~= "left") and -1) or 1)
            a1.queuedLane = nil
            if queuedVertical_1 < 0 or queuedVertical_1 > 2 then
                a1.context.audio.play("thud", {})
            else
                a1.hopFromLane = a1.laneIndex
                a1.hopFromX = a1.playerX
                a1.laneIndex = queuedVertical_1
                a1.hopping = true
                a1.hopProgress = 0
                a1.context.audio.play("whoosh", {})
            end
        end
    end
    local queuedVertical_1 = a1.queuedVertical
    if queuedVertical_1 == nil then
        return nil
    elseif a1.powerUpKind == "jetpack" then
        return nil
    elseif queuedVertical_1 ~= "jump" then
        a1.queuedVertical = nil
        if a1.airborne then
            a1.verticalVelocity = math.min(a1.verticalVelocity, -SUBWAY_SURFERS_CONFIG_upv_1.fastFallSpeed)
            a1.slamPending = true
            return nil
        end
        a1.rolling = true
        a1.rollRemaining = SUBWAY_SURFERS_CONFIG_upv_1.rollDuration
        a1.context.audio.play("whoosh", {})
    else
        if not (a1.airborne) and not (a1.rolling) then
            a1.queuedVertical = nil
            local v43
            if a1.powerUpKind ~= "sneakers" then
                v43 = SUBWAY_SURFERS_CONFIG_upv_1.jumpVelocity
            else
                v43 = SUBWAY_SURFERS_CONFIG_upv_1.sneakersJumpVelocity
            end
            a1.verticalVelocity = v43
            a1.airborne = true
            a1.context.audio.play("whoosh", {})
            return nil
        end
        return nil
    end
end
u17.tryActivateHoverboard = function(a1)
    --[[
      name: tryActivateHoverboard
      line: 933
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
    ]]
    if not (a1.dead) and a1.hoverboardRemaining <= 0 then
        if a1.hoverboardCooldown <= 0 then
            a1.hoverboardRemaining = SUBWAY_SURFERS_CONFIG_upv_1.hoverboardDurationSeconds
            a1.hoverboard:setRiding(true)
            a1.popups:show(a1:playerPosition() + Vector3.new(0, 5.5, 0), "HOVERBOARD!", u15, 1)
            a1.context.audio.play("pop", {})
            a1.context.audio.play("whoosh", {})
            return
        end
        a1.context.audio.play("buzz", {})
        return nil
    end
    return nil
end
u17.groundHeightAt = function(a1, a2, a3)
    --[[
      name: groundHeightAt
      line: 959
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v44 = 0
    for _, value_16 in a1.obstacles do
        if not (value_16.active) or value_16.laneIndex ~= a3 then
            continue
        end
        if value_16.kind == "train" then
            if value_16.startS > a2 then
                continue
            end
            if a2 <= value_16.endS then
                v44 = math.max(v44, SUBWAY_SURFERS_CONFIG_upv_1.trainHeight)
            end
        elseif value_16.kind == "ramp" and value_16.startS <= a2 then
            if a2 <= value_16.endS then
                v44 = math.max(v44, ((a2 - value_16.startS) / (value_16.endS - value_16.startS)) * SUBWAY_SURFERS_CONFIG_upv_1.trainHeight)
            end
        end
    end
    return v44
end
u17.generateAhead = function(a1)
    --[[
      name: generateAhead
      line: 978
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    while a1.nextRowS < a1.playerS + SUBWAY_SURFERS_CONFIG_upv_1.spawnAheadDistance do
        if a1.sectionRowsLeft <= 0 then
            a1:startNextSection()
        else
            a1.sectionRowsLeft = a1.sectionRowsLeft - 1
            a1:spawnRow()
        end
    end
end
u17.startNextSection = function(a1)
    --[[
      name: startNextSection
      line: 988
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v45 = a1.rowRandom:NextNumber()
    local v46 = SUBWAY_SURFERS_CONFIG_upv_1.movingSectionMinIntervalSeconds <= a1.elapsed - a1.lastMovingSectionElapsed
    local v47 = SUBWAY_SURFERS_CONFIG_upv_1.trainRunMinSpacingStuds <= a1.nextRowS - a1.lastTrainRunEndS
    if v45 >= SUBWAY_SURFERS_CONFIG_upv_1.movingSectionWeight then
        if v45 < SUBWAY_SURFERS_CONFIG_upv_1.movingSectionWeight + SUBWAY_SURFERS_CONFIG_upv_1.trainRunWeight and v47 then
            a1:buildTrainRunSection()
            return nil
        end
    elseif v46 then
        a1:buildMovingSection()
        return nil
    end
    a1.sectionRowsLeft = a1.rowRandom:NextInteger(SUBWAY_SURFERS_CONFIG_upv_1.normalSectionRowsMin, SUBWAY_SURFERS_CONFIG_upv_1.normalSectionRowsMax)
end
u17.maxLaneBlocked = function(a1)
    --[[
      name: maxLaneBlocked
      line: 1006
    ]]
    return (math.max(a1.laneBlockedUntilS[1], a1.laneBlockedUntilS[2], a1.laneBlockedUntilS[3]))
end
u17.buildMovingSection = function(a1)
    --[[
      name: buildMovingSection
      line: 1009
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v48 = math.max(a1.nextRowS + SUBWAY_SURFERS_CONFIG_upv_1.movingSectionLeadIn, a1:maxLaneBlocked() + 15)
    a1.lastMovingSectionElapsed = a1.elapsed
    local tbl_9 = {}
    if a1.safeLane ~= 0 then
        table.insert(tbl_9, 0)
    end
    if a1.safeLane ~= 1 then
        table.insert(tbl_9, 1)
    end
    if a1.safeLane ~= 2 then
        table.insert(tbl_9, 2)
    end
    local v49 = a1:spawnObstacle("movingTrain", tbl_9[1], v48 + 70, SUBWAY_SURFERS_CONFIG_upv_1.movingTrainLength)
    local v50 = a1:spawnObstacle("movingTrain", tbl_9[2], v48 + 150, SUBWAY_SURFERS_CONFIG_upv_1.movingTrainLength)
    if v49 ~= nil then
        v49.killS = v48 - 10
    end
    if v50 ~= nil then
        v50.killS = v48 - 10
    end
    local v51 = v48 + 10
    local v52 = 0
    local v53 = false
    while true do
        if v53 then
            v52 = v52 + 1
        else
            v53 = true
        end
        if v52 >= 14 or v51 >= (v48 + SUBWAY_SURFERS_CONFIG_upv_1.movingSectionLength) - 10 then
            break
        end
        a1:placeCoin(a1.safeLane, v51, 1.4)
        v51 = v51 + 10
    end
    a1.nextRowS = (v48 + SUBWAY_SURFERS_CONFIG_upv_1.movingSectionLength) + 20
end
u17.buildTrainRunSection = function(a1)
    --[[
      name: buildTrainRunSection
      line: 1047
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v54 = math.max(a1.nextRowS + SUBWAY_SURFERS_CONFIG_upv_1.trainRunLeadIn, a1:maxLaneBlocked() + 15)
    local v55 = v54
    for v56 = 0, 2 do
        local v57 = v54 + a1.rowRandom:NextNumber(0, SUBWAY_SURFERS_CONFIG_upv_1.trainRunStartJitter)
        local v58 = a1:spawnObstacle("ramp", v56, v57 - SUBWAY_SURFERS_CONFIG_upv_1.rampLength, SUBWAY_SURFERS_CONFIG_upv_1.rampLength)
        local v59 = a1.rowRandom:NextInteger(SUBWAY_SURFERS_CONFIG_upv_1.trainRunTrainsMin, SUBWAY_SURFERS_CONFIG_upv_1.trainRunTrainsMax)
        local v60 = 0
        local v61 = 0
        local v62 = false
        local v63, v64
        v63, v64 = v57, v57
        local v65 = nil
        if v62 then
            v61 = v61 + 1
        else
            v62 = true
        end
        if v61 < v59 then
            local v66 = a1.rowRandom:NextNumber(SUBWAY_SURFERS_CONFIG_upv_1.trainRunCarLengthMin, SUBWAY_SURFERS_CONFIG_upv_1.trainRunCarLengthMax)
            if v58 ~= nil then
                v65 = a1:spawnObstacle("train", v56, v64, v66)
            else
                v65 = nil
            end
            if v65 ~= nil then
                v60, v63 = v60 + 1, v65.endS
            end
            v64 = v64 + v66
            if v61 < v59 - 1 and SUBWAY_SURFERS_CONFIG_upv_1.trainRunGaplessJoinChance <= a1.rowRandom:NextNumber() then
                v64 = v64 + a1.rowRandom:NextNumber(SUBWAY_SURFERS_CONFIG_upv_1.trainRunGapMin, SUBWAY_SURFERS_CONFIG_upv_1.trainRunGapMax)
            end
            if v62 then
                v61 = v61 + 1
            else
                v62 = true
            end
            --[[ goto label_5 ]]--
        end
        if v60 ~= 0 then
            a1.laneBlockedUntilS[v56 + 1] = v63
            v55 = math.max(v55, v63)
            continue
        end
        if v58 ~= nil then
            a1:parkObstacle(v58)
        end
    end
    local safeLane_1 = a1.safeLane
    local v67, v68 = v54 + 10, safeLane_1
    while v67 < v55 - 8 do
        local v57, v56
        v57, v56 = false, 0
        while true do
            if v57 then
                v56 = v56 + 1
            else
                v57 = true
            end
            if v56 >= 4 or v67 >= v55 - 8 then
                break
            end
            a1:placeCoin(v68, v67, SUBWAY_SURFERS_CONFIG_upv_1.trainHeight + 1.5)
            v67 = v67 + (SUBWAY_SURFERS_CONFIG_upv_1.coinSpacing + 2)
        end
        v57 = ((a1.rowRandom:NextNumber() >= 0.5) and 2) or 1
        v68 = (v68 + v57) % 3
    end
    a1.lastTrainRunEndS = v55
    a1.nextRowS = v55 + SUBWAY_SURFERS_CONFIG_upv_1.trainRunTail
end
u17.spawnRow = function(a1)
    --[[
      name: spawnRow
      line: 1124
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local nextRowS_1 = a1.nextRowS
    a1.nextRowS = a1.nextRowS + math.max(a1.rowRandom:NextNumber(SUBWAY_SURFERS_CONFIG_upv_1.rowSpacingMin, SUBWAY_SURFERS_CONFIG_upv_1.rowSpacingMax), a1.speed * SUBWAY_SURFERS_CONFIG_upv_1.rowSpacingMinSeconds)
    local v69 = nil
    if a1.rowRandom:NextNumber() < 0.45 then
        local v70 = ((a1.rowRandom:NextNumber() >= 0.5) and 1) or -1
        v69 = a1.safeLane + v70
        if v69 >= 0 and v69 <= 2 and a1.laneBlockedUntilS[v69 + 1] + a1.speed * (SUBWAY_SURFERS_CONFIG_upv_1.hopDuration + 0.3) < nextRowS_1 then
            a1.safeLane = v69
        end
    end
    local v71 = a1.rowRandom:NextNumber()
    v69 = ((v71 < 0.55) and 1) or (((v71 >= 0.88) and 3) or 2)
    local v72
    if v69 ~= 1 then
        v72 = -1
    else
        v72 = a1:pickBlockedLane(nextRowS_1)
    end
    local v73 = 2
    for n_6 = 0, 2 do
        if nextRowS_1 < a1.laneBlockedUntilS[n_6 + 1] then
            v73 = v73 - 1
            continue
        end
        local v74 = n_6 == a1.safeLane
        if not (v74) or v69 >= 3 then
            if not v74 and v69 == 1 and n_6 ~= v72 then
                continue
            end
            if v74 then
                local v75 = ((a1.rowRandom:NextNumber() >= 0.5) and "highBarrier") or "lowBarrier"
                a1:spawnObstacle(v75, n_6, nextRowS_1)
                continue
            end
            local v76
            v76 = a1.rowRandom:NextNumber()
            if v76 >= 0.3 then
                a1:spawnObstacle(((v76 >= 0.65) and "highBarrier") or "lowBarrier", n_6, nextRowS_1)
                continue
            end
            if v73 <= 0 then
                a1:spawnObstacle(((v76 >= 0.65) and "highBarrier") or "lowBarrier", n_6, nextRowS_1)
            else
                v73 = v73 - 1
                local v77 = a1.rowRandom:NextNumber(SUBWAY_SURFERS_CONFIG_upv_1.trainLengthMin, SUBWAY_SURFERS_CONFIG_upv_1.trainLengthMax)
                a1.laneBlockedUntilS[n_6 + 1] = nextRowS_1 + v77
                a1:spawnObstacle("train", n_6, nextRowS_1, v77)
            end
        else
            continue
        end
        local v76
    end
    if a1.rowRandom:NextNumber() < SUBWAY_SURFERS_CONFIG_upv_1.coinLineChance then
        local v78 = a1.rowRandom:NextInteger(SUBWAY_SURFERS_CONFIG_upv_1.coinLineMin, SUBWAY_SURFERS_CONFIG_upv_1.coinLineMax)
        local v79 = 0
        local v80 = false
        local v81 = nil
        if v80 then
            v79 = v79 + 1
        else
            v80 = true
        end
        while v79 < v78 do
            v81 = false
            if v69 == 3 then
                v81 = math.abs(((nextRowS_1 - 10) + (v79 * SUBWAY_SURFERS_CONFIG_upv_1.coinSpacing)) - nextRowS_1) < 5
            end
            local safeLane_2 = a1.safeLane
            local v82 = nextRowS_1 - 10 + v79 * SUBWAY_SURFERS_CONFIG_upv_1.coinSpacing
            local v83
            if v81 then
                v83 = 3.6
            else
                v83 = 1.4
            end
            a1:placeCoin(safeLane_2, v82, v83)
            if v80 then
                v79 = v79 + 1
            else
                v80 = true
            end
        end
    end
    if a1.rowRandom:NextNumber() >= SUBWAY_SURFERS_CONFIG_upv_1.powerUpChance then
        return
    end
    a1:placePowerUp(tbl_upv_1[a1.rowRandom:NextInteger(0, #tbl_upv_1 - 1) + 1], a1.safeLane, nextRowS_1 - 14)
end
u17.pickBlockedLane = function(a1, a2)
    --[[
      name: pickBlockedLane
      line: 1196
    ]]
    local tbl_10 = {}
    if a1.safeLane ~= 0 and a1.laneBlockedUntilS[1] <= a2 then
        table.insert(tbl_10, 0)
    end
    if a1.safeLane ~= 1 and a1.laneBlockedUntilS[2] <= a2 then
        table.insert(tbl_10, 1)
    end
    if a1.safeLane ~= 2 and a1.laneBlockedUntilS[3] <= a2 then
        table.insert(tbl_10, 2)
    end
    if #tbl_10 ~= 0 then
        return tbl_10[a1.rowRandom:NextInteger(0, #tbl_10 - 1) + 1]
    end
    return -1
end
u17.placeCoin = function(a1, a2, a3, a4)
    --[[
      name: placeCoin
      line: 1210
    ]]
    local v84
    v84 = nil
    for _, value_17 in a1.coins do
        if not value_17.active then
            v84 = value_17
            break
        end
    end
    if v84 ~= nil then
        v84.active = true
        v84.s = a3
        v84.x = a1:laneX(a2)
        v84.y = a4
    else
        return nil
    end
end
u17.placePowerUp = function(a1, a2, a3, a4)
    --[[
      name: placePowerUp
      line: 1233
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    if a4 >= a1.laneBlockedUntilS[a3 + 1] then
        local v85 = nil
        for _, value_18 in a1.powerUps do
            if not value_18.active then
                v85 = value_18
                break
            end
        end
        if v85 ~= nil then
            v85.active = true
            v85.kind = a2
            v85.laneIndex = a3
            v85.s = a4
            v85.part.Color = tbl_upv_2[a2]
            v85.label.Text = tbl_upv_3[a2]
        else
            return nil
        end
    else
        return nil
    end
end
u17.parkPowerUp = function(a1, a2)
    --[[
      name: parkPowerUp
      line: 1261
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.CFrame = u1
end
u17.activatePowerUp = function(a1, a2)
    --[[
      name: activatePowerUp
      line: 1265
      upvalues:
        tbl_upv_4 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 3)
        tbl_upv_5 (copy, index: 4)
    ]]
    a1.popups:show(a1:playerPosition() + Vector3.new(0, 6, 0), tbl_upv_4[a2], tbl_upv_2[a2], 1.1)
    a1.context.audio.play("perfect", {})
    if a2 ~= "double" then
        a1.powerUpKind = a2
        a1.powerUpRemaining = tbl_upv_5[a2]
        if a2 == "jetpack" then
            a1.rolling = false
            a1.slamPending = false
            a1:spawnJetpackCoins()
            a1.context.audio.play("whoosh", {})
        end
    else
        a1.doubleRemaining = SUBWAY_SURFERS_CONFIG_upv_1.doubleDurationSeconds
        return nil
    end
end
u17.spawnJetpackCoins = function(a1)
    --[[
      name: spawnJetpackCoins
      line: 1291
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local laneIndex_1 = a1.laneIndex
    for n_7 = 0, SUBWAY_SURFERS_CONFIG_upv_1.jetpackCoinCount - 1 do
        a1:placeCoin(laneIndex_1, (a1.playerS + SUBWAY_SURFERS_CONFIG_upv_1.jetpackCoinLeadIn) + (n_7 * SUBWAY_SURFERS_CONFIG_upv_1.jetpackCoinSpacing), SUBWAY_SURFERS_CONFIG_upv_1.jetpackHeight + 1)
        if n_7 % 5 == 4 then
            laneIndex_1 = (laneIndex_1 + 1) % 3
        end
    end
end
u17.spawnObstacle = function(a1, a2, a3, a4, a5)
    --[[
      name: spawnObstacle
      line: 1301
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        u8 (copy, index: 3)
        u10 (copy, index: 4)
        u11 (copy, index: 5)
        u1 (copy, index: 6)
        u9 (copy, index: 7)
    ]]
    if a5 == nil then
        a5 = 0
    end
    local v86
    v86 = nil
    for _, value_19 in a1.obstacles do
        if not value_19.active then
            v86 = value_19
            break
        end
    end
    if v86 ~= nil then
        v86.active = true
        v86.kind = a2
        v86.laneIndex = a3
        v86.warned = false
        v86.speed = ((a2 ~= "movingTrain") and 0) or (SUBWAY_SURFERS_CONFIG_upv_1.movingTrainSpeed)
        v86.killS = -math.huge
        local v88 = nil
        if a2 ~= "lowBarrier" and a2 ~= "highBarrier" then
            if a2 ~= "ramp" then
                v86.startS = a4
                v86.endS = a4 + a5
                v86.bottom = 0
                v86.top = SUBWAY_SURFERS_CONFIG_upv_1.trainHeight
                v86.body.Size = Vector3.new((SUBWAY_SURFERS_CONFIG_upv_1.obstacleHalfWidth * 2) + 0.6, SUBWAY_SURFERS_CONFIG_upv_1.trainHeight, a5)
                v86.body.Color = u9
                v86.accent.Size = Vector3.new((SUBWAY_SURFERS_CONFIG_upv_1.obstacleHalfWidth * 2) + 0.7, 0.8, 0.3)
                v88 = v86.accent
                local v87
                if a2 ~= "movingTrain" then
                    v87 = u10
                else
                    v87 = Color3.fromRGB(255, 240, 170)
                end
                v88.Color = v87
                local accent_2 = v86.accent
                if a2 ~= "movingTrain" then
                    v87 = Enum.Material.Plastic
                else
                    v87 = Enum.Material.Neon
                end
                accent_2.Material = v87
                v86.accent.Transparency = 0
            else
                v86.startS = a4
                v86.endS = a4 + a5
                v86.bottom = 0
                v86.top = SUBWAY_SURFERS_CONFIG_upv_1.trainHeight
                v86.body.Size = Vector3.new(SUBWAY_SURFERS_CONFIG_upv_1.obstacleHalfWidth * 2, 1.2, math.sqrt((a5 * a5) + (SUBWAY_SURFERS_CONFIG_upv_1.trainHeight * SUBWAY_SURFERS_CONFIG_upv_1.trainHeight)))
                v86.body.Color = u11
                v86.accent.CFrame = u1
            end
            return v86
        end
        if a2 ~= "lowBarrier" then
            v88 = SUBWAY_SURFERS_CONFIG_upv_1.highBarrier
        else
            v88 = SUBWAY_SURFERS_CONFIG_upv_1.lowBarrier
        end
        v86.startS = a4 - (v88.depth / 2)
        v86.endS = a4 + (v88.depth / 2)
        v86.bottom = v88.bottom
        v86.top = v88.top
        v86.body.Size = Vector3.new(SUBWAY_SURFERS_CONFIG_upv_1.obstacleHalfWidth * 2, v88.top - v88.bottom, v88.depth)
        local body_1 = v86.body
        local v89
        if a2 ~= "lowBarrier" then
            v89 = u8
        else
            v89 = u7
        end
        body_1.Color = v89
        v86.accent.Size = Vector3.new((SUBWAY_SURFERS_CONFIG_upv_1.obstacleHalfWidth * 2) + 0.2, 0.35, 0.3)
        v86.accent.Color = u10
        v86.accent.Material = Enum.Material.Plastic
        v86.accent.Transparency = 0
        return v86
    end
    return nil
end
u17.parkObstacle = function(a1, a2)
    --[[
      name: parkObstacle
      line: 1363
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.body.CFrame = u1
    a2.accent.CFrame = u1
end
u17.parkCoin = function(a1, a2)
    --[[
      name: parkCoin
      line: 1368
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.CFrame = u1
    local visual_1 = a2.visual
    if visual_1 == nil then
        return
    end
    visual_1:park()
end
u17.stumble = function(a1)
    --[[
      name: stumble
      line: 1376
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    if a1.stumbleRemaining <= 0 then
        a1.laneIndex = a1.hopFromLane
        a1.playerX = a1:laneX(a1.hopFromLane)
        a1.hopping = false
        a1.queuedLane = nil
        a1.queuedVertical = nil
        a1.slamPending = false
        a1.stumbleRemaining = SUBWAY_SURFERS_CONFIG_upv_1.stumbleRecoverySeconds
        a1.speedDipRemaining = SUBWAY_SURFERS_CONFIG_upv_1.stumbleSpeedDipSeconds
        a1.guardDistance = SUBWAY_SURFERS_CONFIG_upv_1.guardCloseDistance
        a1.invulnRemaining = 0.4
        a1:hitStop(0.06)
        a1.stage.shake(0.5)
        a1.popups:show(a1:playerPosition() + Vector3.new(0, 5.5, 0), "STUMBLE!", u14, 1)
        a1.context.audio.play("thud", {})
        a1.context.audio.play("buzz", {})
    else
        a1:crash()
        return nil
    end
end
u17.crash = function(a1)
    --[[
      name: crash
      line: 1407
    ]]
    if a1.hoverboardRemaining <= 0 then
        a1:caught()
    else
        a1:shatterHoverboard()
        return nil
    end
end
u17.shatterHoverboard = function(a1)
    --[[
      name: shatterHoverboard
      line: 1414
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
    ]]
    a1.hoverboardRemaining = 0
    a1.hoverboardCooldown = SUBWAY_SURFERS_CONFIG_upv_1.hoverboardCooldownSeconds
    a1.invulnRemaining = SUBWAY_SURFERS_CONFIG_upv_1.hoverboardInvulnSeconds
    a1.stumbleRemaining = 0
    a1.speedDipRemaining = SUBWAY_SURFERS_CONFIG_upv_1.stumbleSpeedDipSeconds
    a1.guardDistance = SUBWAY_SURFERS_CONFIG_upv_1.guardCloseDistance
    a1.queuedLane = nil
    a1.queuedVertical = nil
    a1.slamPending = false
    a1.hoverboard:setRiding(false)
    a1.hoverboard:shatter(a1:playerPosition())
    a1:hitStop(0.08)
    a1.stage.shake(0.7)
    a1.popups:show(a1:playerPosition() + Vector3.new(0, 5.5, 0), "BOARD SMASHED!", u15, 1)
    a1.context.audio.play("woodBreak", {})
    a1.context.audio.play("thud", {})
end
u17.caught = function(a1)
    --[[
      name: caught
      line: 1441
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    local v90 = nil
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        a1.caughtLungeRemaining = SUBWAY_SURFERS_CONFIG_upv_1.catchLungeSeconds
        a1.powerUpKind = nil
        a1.powerUpRemaining = 0
        a1.doubleRemaining = 0
        a1.hoverboardRemaining = 0
        a1.hoverboard:setRiding(false)
        a1.hud:hideAll()
        v90 = a1.avatarRig
        local v91 = a1:playerPosition()
        if v90 == nil then
            a1.fallbackBody.CFrame = CFrame.new(v91 + Vector3.new(0, 1, 2)) * CFrame.Angles(-1.3962634015954636, 0, 0)
        else
            v90:clearPose()
            local v92 = v91 + Vector3.new(0, 1.2000000476837158, 0)
            v90:pivotTo(CFrame.lookAt(v92, v92 + Vector3.new(0, 0, 1)) * CFrame.Angles(-1.3962634015954636, 0, 0))
        end
        a1.context.audio.play("splat", {})
        a1.context.audio.play("buzz", {})
        a1.stage.shake(0.8)
        a1.popups:show(v91 + Vector3.new(0, 6, 0), "CAUGHT!", u14, 1.1)
        local u18 = a1.distance:current() + a1.coinsCollected * 2
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            SUBWAY_SURFERS_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1488
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    u18 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(u18)
            end
        )
    end
end
u17.poseRunner = function(a1)
    --[[
      name: poseRunner
      line: 1494
      upvalues:
        applyTuckPose_upv_1 (copy, index: 1)
        applyRunPose_upv_1 (copy, index: 2)
    ]]
    local v93 = a1:playerPosition()
    local avatarRig_1 = a1.avatarRig
    if avatarRig_1 == nil then
        local v94 = math.abs(math.sin(a1.runPhase)) * 0.25
        a1.fallbackBody.CFrame = CFrame.new(v93 + Vector3.new(0, v94 + 1.3, 0))
        a1.fallbackHead.CFrame = CFrame.new(v93 + Vector3.new(0, v94 + 3, 0))
    else
        if a1.rolling then
            avatarRig_1:clearPose()
            local v95 = v93 + Vector3.new(0, 1.399999976158142, 0)
            avatarRig_1:pivotTo(CFrame.lookAt(v95, v95 + Vector3.new(0, 0, 1)) * CFrame.Angles(-1.3089969389957472, 0, 0))
        else
            local v96 = ((a1.airborne) and 0) or (math.abs(math.sin(a1.runPhase)) * 0.25)
            local v97 = v93 + Vector3.new(0, avatarRig_1.pivotYOffset + v96, 0)
            avatarRig_1:pivotTo(CFrame.lookAt(v97, v97 + Vector3.new(0, 0, 1)))
            if a1.airborne then
                applyTuckPose_upv_1(avatarRig_1)
            else
                applyRunPose_upv_1(avatarRig_1, a1.runPhase)
            end
        end
        return nil
    end
end
u17.playerPosition = function(a1)
    --[[
      name: playerPosition
      line: 1524
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.stage.origin + Vector3.new(a1.playerX, a1.playerY + (((a1.hoverboardRemaining <= 0) and 0) or (SUBWAY_SURFERS_CONFIG_upv_1.hoverboardRideHeight)), 0)
end
u17.laneX = function(a1, a2)
    --[[
      name: laneX
      line: 1531
      upvalues:
        SUBWAY_SURFERS_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (a2 - 1) * SUBWAY_SURFERS_CONFIG_upv_1.laneOffset
end
u17.updateHudChips = function(a1)
    --[[
      name: updateHudChips
      line: 1534
      upvalues:
        tbl_upv_5 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    a1.hud:pose(a1:playerPosition() + Vector3.new(0, 8.199999809265137, 0))
    local powerUpKind_1 = a1.powerUpKind
    if powerUpKind_1 == nil or a1.powerUpRemaining <= 0 then
        a1.hud:hideChip(0)
    else
        a1.hud:setChip(0, tbl_upv_3[powerUpKind_1], tbl_upv_2[powerUpKind_1], a1.powerUpRemaining / tbl_upv_5[powerUpKind_1])
    end
    if a1.doubleRemaining <= 0 then
        a1.hud:hideChip(1)
    else
        a1.hud:setChip(1, "2\195\151", tbl_upv_2.double, a1.doubleRemaining / tbl_upv_5.double)
    end
end
local tbl_11 = {}
tbl_11.SubwaySurfersGame = u17
return tbl_11