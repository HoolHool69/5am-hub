-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow")
local SpectateFollow_upv_1 = v2.SpectateFollow
local approach_upv_1 = v2.approach
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local FLAPPY_BASKET_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "flappy-basket-config").FLAPPY_BASKET_CONFIG
local u1 = Color3.fromRGB(238, 126, 44)
local u2 = Color3.fromRGB(74, 44, 26)
local u3 = Color3.fromRGB(248, 248, 244)
local u4 = Color3.fromRGB(226, 54, 40)
local u5 = Color3.fromRGB(168, 34, 26)
local u6 = Color3.fromRGB(120, 116, 108)
local u7 = Color3.fromRGB(214, 207, 192)
local u8 = Color3.fromRGB(201, 193, 176)
local u9 = Color3.fromRGB(240, 236, 226)
local u10 = Color3.fromRGB(255, 176, 32)
local u11 = Color3.fromRGB(150, 143, 132)
local u12 = Color3.fromRGB(76, 200, 90)
local u13 = Color3.fromRGB(230, 90, 40)
local tbl_upv_1 = {Color3.fromRGB(255, 96, 48), Color3.fromRGB(255, 150, 40), Color3.fromRGB(226, 54, 40)}
local u14 = Color3.fromRGB(255, 214, 150)
local u15 = ColorSequence.new(Color3.fromRGB(255, 190, 120))
local u16 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(1, 1)})
local u17 = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)})
local u18 = Color3.fromRGB(255, 58, 44)
local tbl_upv_2 = {"parked", "preview", "active", "fading"}
local tbl_upv_3 = {"none", "vertical", "diagonal"}
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 147
    ]]
    return "FlappyBasketGame"
end
tbl_5.__index = BaseWorldGame_upv_1
local u19 = setmetatable(tbl_4, tbl_5)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 153
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u19)
    return v4:constructor(...) or v4
end
u19.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 157
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
        SpectateFollow_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.wings = {}
    a1.ballOrientation = CFrame.identity
    a1.hoops = {}
    a1.wallTiles = {}
    a1.wallOffsets = {}
    a1.floorTiles = {}
    a1.floorOffsets = {}
    a1.sparkles = {}
    a1.burstShards = {}
    a1.missWallBlinkPhase = 0
    a1.ballX = 0
    a1.ballY = 0
    a1.velocityX = FLAPPY_BASKET_CONFIG_upv_1.cruiseSpeedX
    a1.velocityY = 0
    a1.renderPrevBallX = 0
    a1.renderPrevBallY = 0
    a1.tiltDegrees = 0
    a1.spinDegrees = 0
    a1.renderPrevSpinDegrees = 0
    a1.spinVelocityDegrees = 0
    a1.flapQueued = false
    a1.wingFlapRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.score = 0
    a1.swishStreak = 0
    a1.basketCount = 0
    a1.swishBonusTotal = 0
    a1.generationRandom = Random.new()
    a1.hoopsSpawned = 0
    a1.lastHoopY = 0
    a1.nextAnchorX = 0
    a1.frameWidthCurrent = FLAPPY_BASKET_CONFIG_upv_1.portraitFrameWidthFloor
    a1.swishTextAge = math.huge
    a1.rimSoundCooldown = 0
    a1.trailFlashRemaining = 0
    a1.trailIsHot = false
    a1.trailClearPending = false
    a1.watermarkPulseAge = math.huge
    a1.watermarkPulseColor = u11
    a1.deathVelocityY = 0
    a1.deathSpinDegrees = 0
    a1.deathAge = 0
    a1.wingDetached = false
    a1.cosmeticRandom = Random.new()
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
end
u19.buildScene = function(a1)
    --[[
      name: buildScene
      line: 207
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(FLAPPY_BASKET_CONFIG_upv_1.portraitFrameWidthFloor)
    a1:buildBall(container_1)
    for _ = 0, FLAPPY_BASKET_CONFIG_upv_1.hoopPoolSize - 1 do
        table.insert(a1.hoops, (a1:buildHoop(container_1)))
    end
    a1:buildBackdropAndTiles(container_1)
    a1:buildWatermark(container_1)
    a1:buildSwishText(container_1)
    for _ = 0, 7 do
        table.insert(a1.sparkles, (a1:buildSparkle(container_1)))
    end
    a1:buildBurstPool(container_1)
    a1:buildBallTrail()
    a1:buildMissWall(container_1)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 229
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_6 = {}
        tbl_6.scoreToStuds = function(a2)
            --[[
              name: scoreToStuds
              line: 239
              upvalues:
                FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
            ]]
            return FLAPPY_BASKET_CONFIG_upv_1.firstHoopDistance + (a2 * 13)
        end
        tbl_6.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 242
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.ballX
        end
        tbl_6.poseMarker = function(a3)
            --[[
              name: poseMarker
              line: 245
              upvalues:
                a1 (copy, index: 1)
                FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
            ]]
            local v5 = a3 - a1.ballX
            if v5 <= 52 and v5 >= -40 then
                return CFrame.new(a1.stage.origin + Vector3.new(a3, FLAPPY_BASKET_CONFIG_upv_1.ceilingY + 1, -3))
            end
            return nil
        end
        registerRivalMarkers_1(tbl_6)
    end
end
u19.resetRound = function(a1)
    --[[
      name: resetRound
      line: 264
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
    ]]
    a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.ballX = 0
    a1.ballY = 0
    a1.renderPrevBallX = 0
    a1.renderPrevBallY = 0
    a1.velocityY = FLAPPY_BASKET_CONFIG_upv_1.flapVelocity * 0.6
    a1.velocityX = FLAPPY_BASKET_CONFIG_upv_1.cruiseSpeedX
    a1.tiltDegrees = 0
    a1.spinDegrees = 0
    a1.renderPrevSpinDegrees = 0
    a1.spinVelocityDegrees = 0
    a1.flapQueued = false
    a1.wingFlapRemaining = 0
    a1.dead = false
    a1.spectating = false
    a1.ballTrail.Enabled = true
    a1.roundToken = a1.roundToken + 1
    a1.score = 0
    a1.swishStreak = 0
    a1.basketCount = 0
    a1.swishBonusTotal = 0
    a1.hoopsSpawned = 0
    a1.lastHoopY = 0
    a1.nextAnchorX = FLAPPY_BASKET_CONFIG_upv_1.firstHoopDistance
    for _, value_1 in a1.hoops do
        a1:parkHoop(value_1)
    end
    a1:spawnHoop("active")
    a1:spawnHoop("preview")
    a1.frameWidthCurrent = FLAPPY_BASKET_CONFIG_upv_1.portraitFrameWidthFloor
    a1.swishTextAge = math.huge
    a1.rimSoundCooldown = 0
    a1.wingDetached = false
    a1:clearMissWall()
    a1.fireEmitter.Enabled = false
    for _, value_2 in a1.sparkles do
        a1:parkSparkle(value_2)
    end
    for _, value_3 in a1.burstShards do
        a1:parkShard(value_3)
    end
    a1.trailFlashRemaining = 0
    a1:applyTrailLook(false)
    a1.trailClearPending = true
    a1.watermarkPulseAge = math.huge
    a1.watermarkLabel.Text = "0"
    a1.watermarkLabel.TextColor3 = u11
    a1.watermarkLabel.TextTransparency = 0.72
    a1.swishLabel.TextTransparency = 1
    a1.context.reportScore(0)
end
u19.captureRound = function(a1)
    --[[
      name: captureRound
      line: 317
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    else
        local tbl_upv_7 = {}
        local v6 = 0
        for _, value_4 in a1.hoops do
            if value_4.state ~= "parked" == true then
                v6 = v6 + 1
                tbl_upv_7[v6] = value_4
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 336
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_7 (copy, index: 2)
                    tbl_upv_3 (copy, index: 3)
                    tbl_upv_2 (copy, index: 4)
                ]]
                a2:int(a1.score):int(a1.swishStreak):int(a1.basketCount):int(a1.swishBonusTotal)
                a2:num(a1.ballX):num(a1.ballY):num(a1.velocityX):num(a1.velocityY)
                a2:num(a1.tiltDegrees):num(a1.spinDegrees):num(a1.spinVelocityDegrees)
                a2:int(a1.hoopsSpawned):num(a1.lastHoopY):num(a1.nextAnchorX)
                local v7 = a2:bool(a1.missWallX ~= nil)
                local v8 = a1.missWallX
                if v8 == nil then
                    v8 = 0
                end
                v7:num(v8)
                a2:int(#tbl_upv_7)
                for _, value_5 in tbl_upv_7 do
                    a2:num(value_5.anchorX):num(value_5.anchorY):num(value_5.tiltRadians)
                    a2:int((math.max((table.find(tbl_upv_3, value_5.railKind) or 0) - 1, 0)))
                    a2:num(value_5.railAmplitude):num(value_5.railAngularSpeed):num(value_5.railPhase)
                    a2:int(value_5.index):int((math.max((table.find(tbl_upv_2, value_5.state) or 0) - 1, 0)))
                    a2:bool(value_5.touchedRim):num(value_5.fadeAge):num(value_5.prevLocalY)
                end
            end
        )
    end
end
u19.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 361
      upvalues:
        readResume_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        deriveRandom_upv_1 (copy, index: 4)
    ]]
    local v9 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 362
              upvalues:
                tbl_upv_3 (copy, index: 1)
                tbl_upv_2 (copy, index: 2)
            ]]
            local tbl_8 = {}
            tbl_8.score = a3:int()
            tbl_8.swishStreak = a3:int()
            tbl_8.basketCount = a3:int()
            tbl_8.swishBonusTotal = a3:int()
            tbl_8.ballX = a3:num()
            tbl_8.ballY = a3:num()
            tbl_8.velocityX = a3:num()
            tbl_8.velocityY = a3:num()
            tbl_8.tiltDegrees = a3:num()
            tbl_8.spinDegrees = a3:num()
            tbl_8.spinVelocityDegrees = a3:num()
            tbl_8.hoopsSpawned = a3:int()
            tbl_8.lastHoopY = a3:num()
            tbl_8.nextAnchorX = a3:num()
            tbl_8.hasMissWall = a3:bool()
            tbl_8.missWallX = a3:num()
            local v10 = a3:int()
            local tbl_9 = {}
            local v11 = 0
            local v12 = false
            v12, v11 = v12, v11
            if v12 then
                v11 = v11 + 1
            else
                v12 = true
            end
            local v13 = nil
            if v11 < v10 then
                local v14 = a3:num()
                local v15 = a3:num()
                local v16 = a3:num()
                v13 = tbl_upv_3[a3:int() + 1]
                local v17 = a3:num()
                local v18 = a3:num()
                local v19 = a3:num()
                local v20 = a3:int()
                local v21 = tbl_upv_2[a3:int() + 1]
                local v22 = a3:bool()
                local v23 = a3:num()
                local v24 = a3:num()
                if v13 == nil or v21 == nil then
                    error("flappy-basket: bad hoop enum")
                end
                table.insert(tbl_9, {anchorX = v14, anchorY = v15, tiltRadians = v16, railKind = v13, railAmplitude = v17, railAngularSpeed = v18, railPhase = v19, index = v20, state = v21, touchedRim = v22, fadeAge = v23, prevLocalY = v24})
                if v12 then
                    v11 = v11 + 1
                else
                    v12 = true
                end
                --[[ goto label_3 ]]--
            end
            v11 = table.clone(tbl_8)
            setmetatable(v11, nil)
            v11.hoops = tbl_9
            return v11
        end
    )
    if v9 ~= nil and #a1.hoops >= #v9.hoops then
        for _, value_6 in a1.hoops do
            a1:parkHoop(value_6)
        end
        a1.score = a2.score
        a1.swishStreak = v9.swishStreak
        a1.basketCount = v9.basketCount
        a1.swishBonusTotal = v9.swishBonusTotal
        a1.ballX = v9.ballX
        a1.ballY = v9.ballY
        a1.renderPrevBallX = v9.ballX
        a1.renderPrevBallY = v9.ballY
        a1.velocityX = v9.velocityX
        a1.velocityY = v9.velocityY
        a1.tiltDegrees = v9.tiltDegrees
        a1.spinDegrees = v9.spinDegrees
        a1.renderPrevSpinDegrees = v9.spinDegrees
        a1.spinVelocityDegrees = v9.spinVelocityDegrees
        a1.hoopsSpawned = v9.hoopsSpawned
        a1.lastHoopY = v9.lastHoopY
        a1.nextAnchorX = v9.nextAnchorX
        a1.dead = false
        a1.flapQueued = false
        a1.wingDetached = false
        a1.roundToken = a1.roundToken + 1
        a1.trailClearPending = true
        local hoops_1 = v9.hoops
        local function v25(a4, a5)
            --[[
              line: 466
              upvalues:
                a1 (copy, index: 1)
            ]]
            local v26 = a1.hoops[a5 + 1]
            if v26 ~= nil then
                v26.anchorX = a4.anchorX
                v26.anchorY = a4.anchorY
                v26.tiltRadians = a4.tiltRadians
                v26.railKind = a4.railKind
                v26.railAmplitude = a4.railAmplitude
                v26.railAngularSpeed = a4.railAngularSpeed
                v26.railPhase = a4.railPhase
                v26.index = a4.index
                v26.state = a4.state
                v26.touchedRim = a4.touchedRim
                v26.fadeAge = a4.fadeAge
                v26.prevLocalY = a4.prevLocalY
                v26.centerX = a4.anchorX
                v26.centerY = a4.anchorY
                v26.prevCenterX = a4.anchorX
                v26.prevCenterY = a4.anchorY
            else
                return nil
            end
        end
        for key_1, value_7 in hoops_1 do
            v25(value_7, key_1 - 1, hoops_1)
        end
        if v9.hasMissWall then
            a1.missWallX = v9.missWallX
        end
        a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), a1.hoopsSpawned + 1)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u19.revive = function(a1)
    --[[
      name: revive
      line: 499
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.swishStreak = 0
    a1.fireEmitter.Enabled = false
    a1.trailFlashRemaining = 0
    a1:applyTrailLook(false)
    a1.trailClearPending = true
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    a1.velocityY = FLAPPY_BASKET_CONFIG_upv_1.flapVelocity * 0.6
    a1.velocityX = FLAPPY_BASKET_CONFIG_upv_1.cruiseSpeedX
    a1.tiltDegrees = 0
    a1.spinDegrees = 0
    a1.renderPrevSpinDegrees = 0
    a1.spinVelocityDegrees = 0
    a1.flapQueued = false
    a1.wingDetached = false
    a1:clearMissWall()
    a1.swishTextAge = math.huge
    a1.swishLabel.TextTransparency = 1
    local v27 = a1:activeHoop()
    local v28 = nil
    if v27 ~= nil then
        v27.anchorX = a1.ballX + FLAPPY_BASKET_CONFIG_upv_1.reviveRespawnDistance
        v27.anchorY = math.clamp(a1.ballY, FLAPPY_BASKET_CONFIG_upv_1.heightMin, FLAPPY_BASKET_CONFIG_upv_1.heightMax)
        v27.touchedRim = false
        v27.railPhase = 0
        a1:updateHoopCenter(v27, 0)
        v27.prevCenterX = v27.centerX
        v27.prevCenterY = v27.centerY
        v27.prevLocalY = a1:rimLocalY(v27)
        a1.lastHoopY = v27.anchorY
        a1.nextAnchorX = math.max(a1.nextAnchorX, v27.anchorX + FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMin)
        v28 = nil
        for _, value_8 in a1.hoops do
            if value_8.state == "preview" == true then
                v28 = value_8
                break
            end
        end
        if v28 ~= nil and v28.anchorX < v27.anchorX + FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMin then
            v28.anchorX = v27.anchorX + FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMin
            a1:updateHoopCenter(v28, 0)
        end
    end
    a1:setRunning(true)
end
u19.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 554
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevBallX = a1.ballX
        a1.renderPrevBallY = a1.ballY
        a1.renderPrevSpinDegrees = a1.spinDegrees
        if a1.flapQueued then
            a1.flapQueued = false
            a1.velocityY = FLAPPY_BASKET_CONFIG_upv_1.flapVelocity
            a1.wingFlapRemaining = FLAPPY_BASKET_CONFIG_upv_1.wingFlapSeconds
            a1.context.audio.play("flap", {})
        end
        if a1.wingFlapRemaining > 0 then
            a1.wingFlapRemaining = math.max(a1.wingFlapRemaining - a2, 0)
        end
        local v29 = nil
        if a1.wingFlapRemaining > 0 then
            a1.spinVelocityDegrees = a1.spinVelocityDegrees * math.max(1 - (FLAPPY_BASKET_CONFIG_upv_1.flapSpinBrakePerSecond * a2), 0)
            v29 = a1.spinDegrees % 360
            if v29 <= 0.5 or v29 >= 359.5 then
                a1.spinDegrees = math.round(a1.spinDegrees / 360) * 360
            else
                local v30
                if FLAPPY_BASKET_CONFIG_upv_1.uprightShortestPathBelow >= math.abs(a1.spinVelocityDegrees) then
                    v30 = ((v29 > 180) and (360 - v29)) or (-v29)
                else
                    v30 = ((a1.spinVelocityDegrees > 0) and (360 - v29)) or (-v29)
                end
                a1.spinDegrees = a1.spinDegrees + (v30 * math.min(FLAPPY_BASKET_CONFIG_upv_1.flapUprightRatePerSecond * a2, 1))
            end
        end
        if a1.rimSoundCooldown > 0 then
            a1.rimSoundCooldown = a1.rimSoundCooldown - a2
        end
        a1.velocityY = math.max(a1.velocityY + (FLAPPY_BASKET_CONFIG_upv_1.gravity * a2), FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity)
        a1.velocityX = math.clamp(a1.velocityX + math.clamp(FLAPPY_BASKET_CONFIG_upv_1.cruiseSpeedX - a1.velocityX, -FLAPPY_BASKET_CONFIG_upv_1.cruiseRecoveryPerSecond * a2, FLAPPY_BASKET_CONFIG_upv_1.cruiseRecoveryPerSecond * a2), FLAPPY_BASKET_CONFIG_upv_1.minSpeedX, FLAPPY_BASKET_CONFIG_upv_1.maxSpeedX)
        a1.ballX = a1.ballX + (a1.velocityX * a2)
        a1.ballY = a1.ballY + (a1.velocityY * a2)
        a1.spinVelocityDegrees = a1.spinVelocityDegrees * math.max(1 - (FLAPPY_BASKET_CONFIG_upv_1.spinDecayPerSecond * a2), 0)
        a1.spinDegrees = a1.spinDegrees + (a1.spinVelocityDegrees * a2)
        if FLAPPY_BASKET_CONFIG_upv_1.ceilingY < a1.ballY then
            a1.ballY = FLAPPY_BASKET_CONFIG_upv_1.ceilingY
            a1.velocityY = math.min(a1.velocityY, 0)
        end
        local v31 = nil
        if a1.ballY - FLAPPY_BASKET_CONFIG_upv_1.ballRadius > FLAPPY_BASKET_CONFIG_upv_1.floorY then
            for _, value_9 in a1.hoops do
                if value_9.state ~= "parked" then
                    a1:updateHoopCenter(value_9, a2)
                end
            end
            v31 = a1:activeHoop()
            if v31 ~= nil then
                a1:collideWithRim(v31, a2)
                local v32 = a1:rimLocalY(v31)
                local v33 = a1:rimLocalX(v31)
                if v31.prevLocalY > 0 and v32 <= 0 and math.abs(v33) < FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 then
                    a1:onBasket(v31)
                    return nil
                end
                v31.prevLocalY = v32
                if a1.missWallX == nil and (v31.centerX + (FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2)) + FLAPPY_BASKET_CONFIG_upv_1.missMarginStuds < a1.ballX - FLAPPY_BASKET_CONFIG_upv_1.ballRadius then
                    a1:armMissWall(v31)
                end
                if a1.missWallX ~= nil and a1.missWallX <= a1.ballX + FLAPPY_BASKET_CONFIG_upv_1.ballRadius then
                    a1:die()
                end
            else
                return nil
            end
        else
            a1:die()
            return nil
        end
    end
end
u19.render = function(a1, a2)
    --[[
      name: render
      line: 644
      upvalues:
        lerp_upv_1 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1:updateGhosts(a2)
    local renderAlpha_1 = a1.renderAlpha
    local v34
    if a1.dead then
        v34 = a1.ballX
    else
        v34 = lerp_upv_1(a1.renderPrevBallX, a1.ballX, renderAlpha_1)
    end
    local v35
    if a1.dead then
        v35 = a1.ballY
    else
        v35 = lerp_upv_1(a1.renderPrevBallY, a1.ballY, renderAlpha_1)
    end
    a1.tiltDegrees = a1.tiltDegrees + (((FLAPPY_BASKET_CONFIG_upv_1.tiltDownDegrees + (math.clamp((a1.velocityY - FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity) / (FLAPPY_BASKET_CONFIG_upv_1.flapVelocity - FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity), 0, 1) * (FLAPPY_BASKET_CONFIG_upv_1.tiltUpDegrees - FLAPPY_BASKET_CONFIG_upv_1.tiltDownDegrees))) - a1.tiltDegrees) * math.min(a2 * FLAPPY_BASKET_CONFIG_upv_1.tiltEasePerSecond, 1))
    local v36 = a1:activeHoop()
    if v36 == nil then
        local v37
        v37 = nil
        for _, value_10 in a1.hoops do
            if value_10.state == "preview" == true then
                v37 = value_10
                break
            end
        end
        v36 = v37
    end
    a1.frameWidthCurrent = a1.frameWidthCurrent + ((math.max((((((v36 == nil) and (a1.ballX + 16)) or (v36.centerX)) - v34) + FLAPPY_BASKET_CONFIG_upv_1.zoomMarginStuds) / (1 - FLAPPY_BASKET_CONFIG_upv_1.ballFrameFraction), FLAPPY_BASKET_CONFIG_upv_1.portraitFrameWidthFloor) - a1.frameWidthCurrent) * math.min(a2 * FLAPPY_BASKET_CONFIG_upv_1.zoomEasePerSecond, 1))
    a1.stage.setFrameWidthFloor(a1.frameWidthCurrent)
    local v38 = a1.stage.getFrameWidth()
    local v39 = v34 + v38 * (0.5 - FLAPPY_BASKET_CONFIG_upv_1.ballFrameFraction)
    a1.stage.setFrameCenter(Vector2.new(v39, 0))
    local v40
    if a1.dead then
        v40 = a1.spinDegrees
    else
        v40 = lerp_upv_1(a1.renderPrevSpinDegrees, a1.spinDegrees, renderAlpha_1)
    end
    local v41
    if a1.spectating then
        v41 = -400
    else
        v41 = v35
    end
    a1:poseBall(v34, v41, a1.tiltDegrees + v40)
    if a1.trailClearPending then
        a1.trailClearPending = false
        a1.ballTrail:Clear()
    end
    local v42 = nil
    for _, value_11 in a1.hoops do
        if value_11.state == "parked" then
            continue
        end
        if value_11.state ~= "fading" then
            value_11.model:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(lerp_upv_1(value_11.prevCenterX, value_11.centerX, renderAlpha_1), lerp_upv_1(value_11.prevCenterY, value_11.centerY, renderAlpha_1), 0)) * CFrame.Angles(0, 0, value_11.tiltRadians))
            if value_11.railKind == "none" then
                continue
            end
            local v43 = nil
            if value_11.state ~= "fading" then
                v43 = ((value_11.railKind ~= "vertical") and (math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees) * math.sign(value_11.tiltRadians))) or 0
                value_11.rail.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_11.anchorX, value_11.anchorY, -0.7)) * CFrame.Angles(0, 0, v43)
            end
        else
            value_11.fadeAge = value_11.fadeAge + a2
            local v44 = math.min(value_11.fadeAge / 1.2, 1)
            for v45, value_12 in value_11.parts do
                value_12.part.Transparency = lerp_upv_1(value_12.authoredTransparency, 1, v44)
            end
            local rail_1 = value_11.rail
            if value_11.railKind == "none" then
                v42 = 1
            else
                v42 = v44
            end
            rail_1.Transparency = v42
            if v44 >= 1 then
                a1:parkHoop(value_11)
                continue
            end
            value_11.model:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(lerp_upv_1(value_11.prevCenterX, value_11.centerX, renderAlpha_1), lerp_upv_1(value_11.prevCenterY, value_11.centerY, renderAlpha_1), 0)) * CFrame.Angles(0, 0, value_11.tiltRadians))
            if value_11.railKind == "none" then
                continue
            end
            local v43 = nil
            if value_11.state ~= "fading" then
                v43 = ((value_11.railKind ~= "vertical") and (math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees) * math.sign(value_11.tiltRadians))) or 0
                value_11.rail.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_11.anchorX, value_11.anchorY, -0.7)) * CFrame.Angles(0, 0, v43)
            end
        end
    end
    a1:layoutTiles(v39, v38)
    a1:animateSwishText(a2, v39)
    a1:animateSparkles(a2)
    a1:animateBurstShards(a2)
    a1:updateTrailAndWatermark(a2)
    a1:animateMissWall(a2)
end
u19.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 732
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u19.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 738
      upvalues:
        approach_upv_1 (copy, index: 1)
    ]]
    a1.ballTrail.Enabled = false
    local v45 = a1.spectate:value(1)
    if v45 ~= nil then
        a1.ballX = approach_upv_1(a1.ballX, v45, 8, a2)
        a1:extendHoopsPast(v45)
    end
    a1.renderPrevBallX = a1.ballX
    a1.renderPrevBallY = a1.ballY
    a1.renderPrevSpinDegrees = a1.spinDegrees
    a1:render(a2)
end
u19.extendHoopsPast = function(a1, a2)
    --[[
      name: extendHoopsPast
      line: 754
    ]]
    for _ = 0, 3 do
        local v46
        v46 = a1:activeHoop()
        if v46 ~= nil and a2 - 4 >= v46.anchorX then
            a1:parkHoop(v46)
            local v47 = nil
            for v48, value_13 in a1.hoops do
                if value_13.state == "preview" == true then
                    v47 = value_13
                    break
                end
            end
            if v47 ~= nil then
                a1:activateHoop(v47)
            end
            a1:spawnHoop("preview")
        else
            return nil
        end
    end
end
u19.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 781
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1:updateGhosts(a2)
    a1:animateSparkles(a2)
    a1:animateBurstShards(a2)
    if a1.dead and a1.spectate:isActive() then
        a1.spectating = true
        a1:spectateStep(a2)
        return nil
    end
    if a1.dead then
        a1.deathAge = a1.deathAge + a2
        a1.deathVelocityY = math.max(a1.deathVelocityY + (FLAPPY_BASKET_CONFIG_upv_1.gravity * a2), FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity)
        a1.ballY = math.max(a1.ballY + (a1.deathVelocityY * a2), FLAPPY_BASKET_CONFIG_upv_1.floorY - 8)
        a1.deathSpinDegrees = a1.deathSpinDegrees + (420 * a2)
        a1:poseBall(a1.ballX, a1.ballY, a1.deathSpinDegrees)
        if FLAPPY_BASKET_CONFIG_upv_1.deathTumbleDelaySeconds <= a1.deathAge and #a1.wings > 0 then
            if not (a1.wingDetached) then
                a1.wingDetached = true
                local v48 = 0
                local Position_1 = nil
                for _, value_14 in a1.wings do
                    Position_1 = value_14.model:GetPivot().Position
                    value_14.fallX = Position_1.X - a1.stage.origin.X
                    value_14.fallY = Position_1.Y - a1.stage.origin.Y
                    value_14.fallVelocityY = 10
                    value_14.fallSpin = 0
                    value_14.fallDrift = v48 + 2.5
                    v48 = v48 + 1.5
                end
            end
            for _, value_15 in a1.wings do
                value_15.fallVelocityY = math.max(value_15.fallVelocityY + ((FLAPPY_BASKET_CONFIG_upv_1.gravity * 0.25) * a2), -14)
                value_15.fallY = math.max(value_15.fallY + (value_15.fallVelocityY * a2), FLAPPY_BASKET_CONFIG_upv_1.floorY - 6)
                value_15.fallX = value_15.fallX - (value_15.fallDrift * a2)
                value_15.fallSpin = value_15.fallSpin + (240 * a2)
                value_15.model:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(value_15.fallX, value_15.fallY, 0.4)) * CFrame.Angles(0, 0, math.rad(value_15.fallSpin)))
            end
        end
    else
        return nil
    end
end
u19.snapshot = function(a1)
    --[[
      name: snapshot
      line: 828
    ]]
    local v49 = a1:activeHoop()
    local tbl_10 = {}
    tbl_10.score = a1.score
    tbl_10.values = {a1.ballY, a1.ballX, ((v49 == nil) and 16) or (v49.centerX - a1.ballX), ((v49 == nil) and 0) or (v49.centerY), a1.swishStreak}
    return tbl_10
end
u19.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 835
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local function createBody_1()
            --[[
              name: createBody
              line: 842
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:createGhostBody()
        end
        local u20 = GhostPool_upv_1.new(a1.stage.container, {size = Vector3.new(FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2, FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2, FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2), shape = Enum.PartType.Ball, createBody = createBody_1})
        a1.ghostPool = u20
        a1.context.janitor:Add(
            function()
                --[[
                  line: 847
                  upvalues:
                    u20 (copy, index: 1)
                ]]
                return u20:destroy()
            end
        )
    end
end
u19.createGhostBody = function(a1)
    --[[
      name: createGhostBody
      line: 852
    ]]
    local u21 = a1.ballModel:Clone()
    u21.Name = "GhostBall"
    u21.Parent = a1.stage.container
    local v50 = u21:FindFirstChildWhichIsA("BasePart", true)
    if v50 ~= nil then
        local tbl_11 = {}
        tbl_11.root = u21
        tbl_11.anchor = v50
        tbl_11.pose = function(a2)
            --[[
              name: pose
              line: 864
              upvalues:
                a1 (copy, index: 1)
                u21 (copy, index: 2)
            ]]
            return u21:PivotTo(CFrame.new(a2) * a1.ballOrientation)
        end
        tbl_11.destroy = function()
            --[[
              name: destroy
              line: 869
              upvalues:
                u21 (copy, index: 1)
            ]]
            return u21:Destroy()
        end
        return tbl_11
    end
    u21:Destroy()
    return nil
end
u19.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 874
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local ghostPool_1 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_1 ~= nil and matchOpponents_1 ~= nil then
        local v51 = a1.stage.getFrameWidth()
        local v52 = a1.ballX + v51 * (0.5 - FLAPPY_BASKET_CONFIG_upv_1.ballFrameFraction)
        local v53 = v52 - (v51 / 2) + 2
        local v54 = nil
        local v55 = nil
        local v56 = nil
        for _, value_16 in matchOpponents_1 do
            v55 = value_16.snapshot
            if v55 == nil then
                continue
            end
            v54 = v55.values[1]
            if v54 == nil then
                v54 = 0
            end
            v56 = v55.values[2]
            if v56 == nil then
                v56 = 0
            end
            if v56 < v53 - 8 then
                continue
            end
            if (v52 + (v51 / 2)) - 2 + 8 >= v56 then
                ghostPool_1:show(value_16.userId, value_16.username, a1.stage.origin + Vector3.new(v56, math.clamp(v54, FLAPPY_BASKET_CONFIG_upv_1.floorY, FLAPPY_BASKET_CONFIG_upv_1.ceilingY), -1.5), value_16.alive)
            end
        end
        ghostPool_1:step(a2)
    else
        return nil
    end
end
u19.onPress = function(a1)
    --[[
      name: onPress
      line: 911
    ]]
    if (a1.dead) then
        return
    end
    a1.flapQueued = true
end
u19.activeHoop = function(a1)
    --[[
      name: activeHoop
      line: 916
    ]]
    for _, value_17 in a1.hoops do
        if value_17.state == "active" ~= true then
            continue
        end
        return value_17
    end
    return nil
end
u19.updateHoopCenter = function(a1, a2, a3)
    --[[
      name: updateHoopCenter
      line: 932
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a2.prevCenterX = a2.centerX
    a2.prevCenterY = a2.centerY
    if a2.railKind ~= "none" then
        a2.railPhase = a2.railPhase + (a2.railAngularSpeed * a3)
        local v57 = math.sin(a2.railPhase) * a2.railAmplitude
        if a2.railKind ~= "vertical" then
            local v58 = math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees) * math.sign(a2.tiltRadians)
            a2.centerX = a2.anchorX + (math.sin(v58) * v57)
            a2.centerY = a2.anchorY + (math.cos(v58) * v57)
        else
            a2.centerX = a2.anchorX
            a2.centerY = a2.anchorY + v57
        end
    else
        a2.centerX = a2.anchorX
        a2.centerY = a2.anchorY
        return nil
    end
end
u19.rimLocalY = function(a1, a2)
    --[[
      name: rimLocalY
      line: 952
    ]]
    return -(a1.ballX - a2.centerX) * math.sin(-a2.tiltRadians) + ((a1.ballY - a2.centerY) * math.cos(-a2.tiltRadians))
end
u19.rimLocalX = function(a1, a2)
    --[[
      name: rimLocalX
      line: 957
    ]]
    return (a1.ballX - a2.centerX) * math.cos(-a2.tiltRadians) + ((a1.ballY - a2.centerY) * math.sin(-a2.tiltRadians))
end
u19.collideWithRim = function(a1, a2, a3)
    --[[
      name: collideWithRim
      line: 962
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v59 = FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2
    local v60 = math.cos(a2.tiltRadians)
    local v61 = math.sin(a2.tiltRadians)
    local v62 = ((a3 <= 0) and 0) or ((a2.centerX - a2.prevCenterX) / a3)
    local v63 = ((a3 <= 0) and 0) or ((a2.centerY - a2.prevCenterY) / a3)
    local v64 = FLAPPY_BASKET_CONFIG_upv_1.ballRadius + FLAPPY_BASKET_CONFIG_upv_1.rimTubeRadius
    local v65 = nil
    local v66 = nil
    local v67 = nil
    local v68 = nil
    local v69 = nil
    local v70 = nil
    local v71 = nil
    local v72 = nil
    local v73 = nil
    for _, value_18 in {-1, 1} do
        v65 = a1.ballX - (a2.centerX + ((value_18 * v59) * v60))
        v66 = a1.ballY - (a2.centerY + ((value_18 * v59) * v61))
        v73 = math.sqrt((v65 * v65) + (v66 * v66))
        if v64 <= v73 or v73 < 0.001 then
            continue
        end
        v67 = v65 / v73
        v68 = v66 / v73
        v72 = v64 - v73
        a1.ballX = a1.ballX + (v67 * v72)
        a1.ballY = a1.ballY + (v68 * v72)
        v69 = a1.velocityX - v62
        v70 = a1.velocityY - v63
        v71 = v69 * v67 + v70 * v68
        if v71 >= 0 then
            a1.spinVelocityDegrees = math.clamp(a1.spinVelocityDegrees + ((math.deg(((v69 * -v68) + (v70 * v67)) / FLAPPY_BASKET_CONFIG_upv_1.ballRadius) - a1.spinVelocityDegrees) * FLAPPY_BASKET_CONFIG_upv_1.rimSpinGrip), -FLAPPY_BASKET_CONFIG_upv_1.maxSpinDegreesPerSecond, FLAPPY_BASKET_CONFIG_upv_1.maxSpinDegreesPerSecond)
            a2.touchedRim = true
            continue
        end
        a1.velocityX = math.clamp((((v69 - (v71 * v67)) * FLAPPY_BASKET_CONFIG_upv_1.rimTangentKeep) - ((v71 * FLAPPY_BASKET_CONFIG_upv_1.rimRestitution) * v67)) + v62, FLAPPY_BASKET_CONFIG_upv_1.minSpeedX, FLAPPY_BASKET_CONFIG_upv_1.maxSpeedX)
        a1.velocityY = math.max((((v70 - (v71 * v68)) * FLAPPY_BASKET_CONFIG_upv_1.rimTangentKeep) - ((v71 * FLAPPY_BASKET_CONFIG_upv_1.rimRestitution) * v68)) + v63, FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity)
        if FLAPPY_BASKET_CONFIG_upv_1.rimSoundMinImpact <= -v71 and a1.rimSoundCooldown <= 0 then
            a1.rimSoundCooldown = 0.08
            a1.context.audio.play("thud", {})
        end
        a1.spinVelocityDegrees = math.clamp(a1.spinVelocityDegrees + ((math.deg(((v69 * -v68) + (v70 * v67)) / FLAPPY_BASKET_CONFIG_upv_1.ballRadius) - a1.spinVelocityDegrees) * FLAPPY_BASKET_CONFIG_upv_1.rimSpinGrip), -FLAPPY_BASKET_CONFIG_upv_1.maxSpinDegreesPerSecond, FLAPPY_BASKET_CONFIG_upv_1.maxSpinDegreesPerSecond)
        a2.touchedRim = true
    end
end
u19.onBasket = function(a1, a2)
    --[[
      name: onBasket
      line: 1012
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    local v74
    if a2.touchedRim then
        a1.swishStreak = 0
        v74 = 1
        a1.fireEmitter.Enabled = false
        a1.context.audio.play("flappyBasketScore", {})
        a1:spawnBasketBurst(a2)
    else
        a1.swishStreak = a1.swishStreak + 1
        v74 = a1.swishStreak
        a1.context.audio.play("perfect", {pitch = (math.min(a1.swishStreak, 12) * 0.06) + 1})
        a1:popSwishText()
        a1:burstSparkles(a2.centerX, a2.centerY)
        a1:spawnSwishBurst(a2)
        a1.trailFlashRemaining = FLAPPY_BASKET_CONFIG_upv_1.swishTrailFlashSeconds
        a1.ballTrail.Color = ColorSequence.new(a1:streakHeatColor())
        if a1.swishStreak ~= FLAPPY_BASKET_CONFIG_upv_1.fireStreak then
            a1:hitStop(FLAPPY_BASKET_CONFIG_upv_1.swishHitStopSeconds)
        else
            a1.fireEmitter.Enabled = true
            a1.context.audio.play("whoosh", {})
            a1:hitStop(FLAPPY_BASKET_CONFIG_upv_1.fireIgniteHitStopSeconds)
        end
    end
    a1.score = a1.score + v74
    a1.basketCount = a1.basketCount + 1
    a1.swishBonusTotal = a1.swishBonusTotal + (v74 - 1)
    a1.context.reportScore(a1.score)
    a1.watermarkLabel.Text = tostring(a1.score)
    a1.watermarkPulseAge = 0
    local v75
    if a2.touchedRim then
        v75 = u14
    else
        v75 = a1:streakHeatColor()
    end
    a1.watermarkPulseColor = v75
    a2.state = "fading"
    a2.fadeAge = 0
    local v76 = nil
    for _, value_19 in a1.hoops do
        if value_19.state == "preview" == true then
            v76 = value_19
            break
        end
    end
    if v76 ~= nil then
        a1:activateHoop(v76)
    end
    a1:spawnHoop("preview")
end
u19.die = function(a1)
    --[[
      name: die
      line: 1076
      upvalues:
        u11 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1.context.audio.play("thud", {})
    a1.stage.shake(1.2)
    a1.fireEmitter.Enabled = false
    a1.trailFlashRemaining = 0
    a1.watermarkPulseAge = math.huge
    a1.watermarkLabel.TextColor3 = u11
    a1.watermarkLabel.TextTransparency = 0.72
    if a1.missWallX ~= nil then
        a1.missWallPart.Transparency = 0.1
    end
    a1.deathVelocityY = 12
    a1.deathSpinDegrees = a1.tiltDegrees
    a1.deathAge = 0
    local roundToken_upv_1 = a1.roundToken
    local score_upv_1 = a1.score
    task.delay(
        FLAPPY_BASKET_CONFIG_upv_1.endRunDelaySeconds,
        function()
            --[[
              line: 1099
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
u19.spawnHoop = function(a1, a2)
    --[[
      name: spawnHoop
      line: 1105
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
    ]]
    local v77 = a1:takeFreeHoop()
    if v77 ~= nil then
        local v78 = a1.generationRandom:NextNumber(FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMin, FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMax)
        local v79 = a1.generationRandom:NextNumber(-1, 1)
        local v80 = a1.generationRandom:NextNumber(-1, 1)
        local v81 = a1.generationRandom:NextNumber(0, 1)
        local v82 = a1.generationRandom:NextNumber(0, 1)
        local v83 = a1.generationRandom:NextNumber(FLAPPY_BASKET_CONFIG_upv_1.railAmplitudeMin, FLAPPY_BASKET_CONFIG_upv_1.railAmplitudeMax)
        local v84 = a1.generationRandom:NextNumber(FLAPPY_BASKET_CONFIG_upv_1.railPeriodMin, FLAPPY_BASKET_CONFIG_upv_1.railPeriodMax)
        local v85 = a1.generationRandom:NextNumber(0, math.tau)
        a1.hoopsSpawned = a1.hoopsSpawned + 1
        v77.index = a1.hoopsSpawned
        local v86 = math.clamp(a1.lastHoopY + (v79 * lerp_upv_1(FLAPPY_BASKET_CONFIG_upv_1.heightMaxDeltaEarly, FLAPPY_BASKET_CONFIG_upv_1.heightMaxDeltaLate, math.clamp(a1.score / FLAPPY_BASKET_CONFIG_upv_1.heightDeltaRampScore, 0, 1))), FLAPPY_BASKET_CONFIG_upv_1.heightMin, FLAPPY_BASKET_CONFIG_upv_1.heightMax)
        a1.lastHoopY = v86
        v77.anchorY = v86
        v77.anchorX = a1.nextAnchorX
        a1.nextAnchorX = a1.nextAnchorX + v78
        local v87 = 0
        if FLAPPY_BASKET_CONFIG_upv_1.tiltIntroScore <= a1.score then
            v87 = v80 * lerp_upv_1(FLAPPY_BASKET_CONFIG_upv_1.tiltMaxEarlyDegrees, FLAPPY_BASKET_CONFIG_upv_1.tiltMaxLateDegrees, math.clamp((a1.score - FLAPPY_BASKET_CONFIG_upv_1.tiltIntroScore) / math.max(FLAPPY_BASKET_CONFIG_upv_1.tiltLateScore - FLAPPY_BASKET_CONFIG_upv_1.tiltIntroScore, 1), 0, 1))
        end
        v77.railKind = "none"
        if FLAPPY_BASKET_CONFIG_upv_1.railIntroHoop <= v77.index and v81 < lerp_upv_1(FLAPPY_BASKET_CONFIG_upv_1.railChanceEarly, FLAPPY_BASKET_CONFIG_upv_1.railChanceLate, math.clamp((v77.index - FLAPPY_BASKET_CONFIG_upv_1.railIntroHoop) / math.max(FLAPPY_BASKET_CONFIG_upv_1.railLateHoop - FLAPPY_BASKET_CONFIG_upv_1.railIntroHoop, 1), 0, 1)) then
            local v88
            if FLAPPY_BASKET_CONFIG_upv_1.diagonalRailIntroHoop > v77.index or v82 >= 0.5 then
                v88 = "vertical"
            else
                v88 = "diagonal"
            end
            v77.railKind = v88
            if v77.railKind == "diagonal" then
                v87 = FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees * (((v80 < 0) and -1) or 1)
            end
        end
        v77.tiltRadians = math.rad(v87)
        v77.railAmplitude = v83
        if v77.railKind == "none" then
            v77.rail.Transparency = 1
        else
            local v89 = ((v77.railKind == "vertical") and 1) or (math.cos(math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees)))
            v77.railAmplitude = math.min(v83, ((FLAPPY_BASKET_CONFIG_upv_1.heightMax + 2) - v77.anchorY) / v89, (v77.anchorY - (FLAPPY_BASKET_CONFIG_upv_1.heightMin - 2)) / v89)
            v77.rail.Size = Vector3.new(0.35, (v77.railAmplitude * 2) + 8, 0.35)
            v77.rail.Transparency = 0
        end
        v77.railAngularSpeed = math.tau / v84
        v77.railPhase = v85
        v77.touchedRim = false
        v77.fadeAge = 0
        a1:updateHoopCenter(v77, 0)
        v77.prevCenterX = v77.centerX
        v77.prevCenterY = v77.centerY
        v77.prevLocalY = a1:rimLocalY(v77)
        if a2 ~= "active" then
            a1:previewHoop(v77)
        else
            a1:activateHoop(v77)
        end
    else
        return nil
    end
end
u19.takeFreeHoop = function(a1)
    --[[
      name: takeFreeHoop
      line: 1173
    ]]
    local v90
    v90 = nil
    for key_2, value_20 in a1.hoops do
        if value_20.state == "parked" == true then
            v90 = value_20
            break
        end
    end
    if v90 == nil then
        local key_2 = nil
        for _, value_21 in a1.hoops do
            if value_21.state == "fading" == true then
                key_2 = value_21
                break
            end
        end
        if key_2 == nil then
            return nil
        end
        a1:parkHoop(key_2)
        return key_2
    end
    return v90
end
u19.activateHoop = function(a1, a2)
    --[[
      name: activateHoop
      line: 1211
    ]]
    a2.state = "active"
    a2.touchedRim = false
    a2.prevLocalY = a1:rimLocalY(a2)
    for _, value_22 in a2.parts do
        value_22.part.Transparency = value_22.authoredTransparency
    end
end
u19.previewHoop = function(a1, a2)
    --[[
      name: previewHoop
      line: 1219
      upvalues:
        lerp_upv_1 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
    ]]
    a2.state = "preview"
    for _, value_23 in a2.parts do
        value_23.part.Transparency = lerp_upv_1(value_23.authoredTransparency, 1, FLAPPY_BASKET_CONFIG_upv_1.previewTransparency)
    end
    a2.rail.Transparency = ((a2.railKind == "none") and 1) or (FLAPPY_BASKET_CONFIG_upv_1.previewTransparency)
end
u19.parkHoop = function(a1, a2)
    --[[
      name: parkHoop
      line: 1226
    ]]
    a2.state = "parked"
    a2.touchedRim = false
    a2.fadeAge = 0
    a2.railKind = "none"
    a2.model:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(-4000, 0, 0)))
    a2.rail.CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, -20, -0.699999988079071))
    a2.rail.Transparency = 1
end
u19.sceneryAssets = function(a1)
    --[[
      name: sceneryAssets
      line: 1240
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    return waitForSceneryRoot_upv_1("FlappyBasket", "flappy-basket")
end
u19.normalizeClone = function(a1, a2)
    --[[
      name: normalizeClone
      line: 1243
    ]]
    for _, value_24 in a2:GetDescendants() do
        if value_24:IsA("BasePart") then
            value_24.Anchored = true
            value_24.CanCollide = false
            value_24.CanQuery = false
            value_24.CanTouch = false
            value_24.CastShadow = false
        end
    end
end
u19.buildBall = function(a1, a2)
    --[[
      name: buildBall
      line: 1254
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local Ball_1 = a1:sceneryAssets()
    if Ball_1 ~= nil then
        Ball_1 = Ball_1:FindFirstChild("Ball")
    end
    local v91
    if Ball_1 ~= nil and (Ball_1:IsA("Model")) then
        v91 = Ball_1:Clone()
        a1:normalizeClone(v91)
        v91.Parent = a2
    else
        warn("[FlappyBasket] missing scenery asset FlappyBasket.Ball \226\128\148 using the fallback ball")
        v91 = a1:buildFallbackBall(a2)
    end
    local v92 = v91:FindFirstChild("BallCore", true)
    local v93
    v93 = v92 == nil or not (v92:IsA("BasePart")) or v92
    if v93 == nil then
        local v94 = 0
        local v95 = nil
        local _ = nil
        for v102, value_25 in v91:GetDescendants() do
            v95 = value_25:IsA("BasePart")
            if not (v95) then
                continue
            end
            v95 = math.max(value_25.Size.X, value_25.Size.Y, value_25.Size.Z)
            if v94 < v95 then
                v93, v94 = value_25, v95
            end
        end
    end
    if v93 == nil then
        error("[FlappyBasket] ball model has no BasePart")
    end
    local v96 = math.max(v93.Size.X, v93.Size.Y, v93.Size.Z)
    if v96 > 0.01 then
        local v97 = FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2 / v96
        if math.abs(v97 - 1) > 0.01 then
            v91:ScaleTo(v91:GetScale() * v97)
        end
    end
    a1.ballModel = v91
    a1.ballCore = v93
    local v98 = v91:GetPivot()
    a1.ballOrientation = v98.Rotation
    local v99 = nil
    local v100 = nil
    local v101 = nil
    for _, value_26 in v91:GetChildren() do
        if not (value_26:IsA("Model")) then
            continue
        end
        if string.find(value_26.Name, "Wing", 1, true) ~= nil then
            v99 = v98:ToObjectSpace(value_26:GetPivot())
            v100 = a1.wings
            v101 = {}
            v101.model = value_26
            v101.restLocal = v99
            v101.flapSign = ((v99.Position.Y <= 0) and 1) or -1
            table.insert(v100, v101)
        end
    end
    if #a1.wings == 0 then
        warn("[FlappyBasket] no Wing sub-model on the ball \226\128\148 flap animation disabled")
    end
    a1.fireEmitter = a1:buildFireEmitter(v93)
end
u19.buildFallbackBall = function(a1, a2)
    --[[
      name: buildFallbackBall
      line: 1338
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        u2 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        u3 (copy, index: 6)
    ]]
    local v102 = Instance.new("Model")
    v102.Name = "Ball"
    v102.Parent = a2
    local v103 = makeSmoothPart_upv_1(v102)
    v103.Name = "BallCore"
    v103.Shape = Enum.PartType.Ball
    v103.Size = Vector3.new(FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2, FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2, FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2)
    v103.Color = u1
    v103.CFrame = CFrame.new(0, 0, 0)
    local v104 = makeSmoothPart_upv_1(v102)
    v104.Size = Vector3.new(0.18, (FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2) + 0.05, 0.6)
    v104.Color = u2
    v104.CFrame = CFrame.new(0, 0, 0)
    local v105 = makeSmoothPart_upv_1(v102)
    v105.Size = Vector3.new((FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 2) + 0.05, 0.18, 0.6)
    v105.Color = u2
    v105.CFrame = CFrame.new(0, 0, 0)
    local v106 = Instance.new("Model")
    v106.Name = "Wing"
    v106.Parent = v102
    local v107 = CFrame.new(-FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 0.7, FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 0.7, 0)
    local v108 = makeStagePart_upv_1(v106)
    v108.Size = Vector3.new(1.600000023841858, 0.3199999928474426, 0.23999999463558197)
    v108.Color = u3
    v108.CFrame = v107 * (CFrame.new(-0.8, 0.25, 0) * CFrame.Angles(0, 0, 0.3141592653589793))
    local v109 = makeStagePart_upv_1(v106)
    v109.Size = Vector3.new(1.100000023841858, 0.2800000011920929, 0.23999999463558197)
    v109.Color = u3
    v109.CFrame = v107 * (CFrame.new(-0.55, -0.08, 0) * CFrame.Angles(0, 0, 0.13962634015954636))
    v106.WorldPivot = v107
    v102.WorldPivot = CFrame.new(0, 0, 0)
    return v102
end
u19.buildFireEmitter = function(a1, a2)
    --[[
      name: buildFireEmitter
      line: 1377
    ]]
    local v110 = Instance.new("ParticleEmitter")
    v110.Color = ColorSequence.new(Color3.fromRGB(255, 170, 40), Color3.fromRGB(226, 54, 20))
    v110.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9), NumberSequenceKeypoint.new(1, 0)})
    local tbl_12 = {NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 1)}
    v110.Transparency = NumberSequence.new(tbl_12)
    v110.Lifetime = NumberRange.new(0.25, 0.5)
    v110.Rate = 40
    v110.Speed = NumberRange.new(3, 5)
    v110.SpreadAngle = Vector2.new(35, 35)
    v110.LightEmission = 1
    v110.EmissionDirection = Enum.NormalId.Top
    v110.Enabled = false
    v110.Parent = a2
    return v110
end
u19.buildHoop = function(a1, a2)
    --[[
      name: buildHoop
      line: 1392
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    local Rim_1 = a1:sceneryAssets()
    if Rim_1 ~= nil then
        Rim_1 = Rim_1:FindFirstChild("Rim")
    end
    local v111 = nil
    if Rim_1 == nil then
        if #a1.hoops == 0 then
            warn("[FlappyBasket] missing scenery asset FlappyBasket.Rim \226\128\148 using the fallback rim")
        end
        v111 = a1:buildFallbackRim(a2)
    else
        local v112 = nil
        if Rim_1:IsA("Model") then
            v111 = Rim_1:Clone()
            a1:normalizeClone(v111)
            v111.Parent = a2
            v112 = v111:FindFirstChild("LipLeft", true)
            local v113 = v111:FindFirstChild("LipRight", true)
            local v114 = nil
            if v112 ~= nil then
                v114 = v112:IsA("BasePart")
                if v114 and v113 ~= nil then
                    v114 = v113:IsA("BasePart")
                    local v115 = nil
                    if v114 then
                        v115 = (v113.Position - v112.Position).Magnitude
                        local v116 = nil
                        if v115 > 0.01 then
                            v116 = FLAPPY_BASKET_CONFIG_upv_1.rimOpening / v115
                            if math.abs(v116 - 1) > 0.01 then
                                v111:ScaleTo(v111:GetScale() * v116)
                            end
                        end
                    end
                end
            end
        else
            if #a1.hoops == 0 then
                warn("[FlappyBasket] missing scenery asset FlappyBasket.Rim \226\128\148 using the fallback rim")
            end
            v111 = a1:buildFallbackRim(a2)
        end
    end
    local tbl_13 = {}
    for _, value_27 in v111:GetDescendants() do
        if value_27:IsA("BasePart") then
            table.insert(tbl_13, {part = value_27, authoredTransparency = value_27.Transparency})
        end
    end
    local v117 = makeSmoothPart_upv_1(a2)
    v117.Size = Vector3.new(0.3499999940395355, 12, 0.3499999940395355)
    v117.Color = u6
    v117.Transparency = 1
    local tbl_14 = {}
    tbl_14.model = v111
    tbl_14.rail = v117
    tbl_14.parts = tbl_13
    a1:parkHoop(tbl_14)
    return tbl_14
end
u19.buildFallbackRim = function(a1, a2)
    --[[
      name: buildFallbackRim
      line: 1463
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        u5 (copy, index: 4)
    ]]
    local v118 = Instance.new("Model")
    v118.Name = "Rim"
    v118.Parent = a2
    local rimTubeRadius_1 = FLAPPY_BASKET_CONFIG_upv_1.rimTubeRadius
    local v119 = makeSmoothPart_upv_1(v118)
    v119.Size = Vector3.new(FLAPPY_BASKET_CONFIG_upv_1.rimOpening + (rimTubeRadius_1 * 2), 0.5, 0.9)
    v119.Color = u4
    v119.CFrame = CFrame.new(0, -0.35, 0.55)
    local v120 = makeSmoothPart_upv_1(v118)
    v120.Size = Vector3.new(FLAPPY_BASKET_CONFIG_upv_1.rimOpening + rimTubeRadius_1, 0.35, 0.7)
    v120.Color = u5
    v120.CFrame = CFrame.new(0, 0.3, -0.55)
    local v121 = nil
    for _, value_28 in {-1, 1} do
        v121 = makeSmoothPart_upv_1(v118)
        v121.Shape = Enum.PartType.Ball
        v121.Size = Vector3.new(rimTubeRadius_1 * 2, rimTubeRadius_1 * 2, rimTubeRadius_1 * 2)
        v121.Color = u4
        v121.CFrame = CFrame.new(value_28 * (FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2), 0, 0)
    end
    v118.WorldPivot = CFrame.new(0, 0, 0)
    return v118
end
u19.buildBackdropAndTiles = function(a1, a2)
    --[[
      name: buildBackdropAndTiles
      line: 1487
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        makeStagePart_upv_1 (copy, index: 3)
        u10 (copy, index: 4)
    ]]
    a1.backdrop = makeSmoothPart_upv_1(a2)
    a1.backdrop.Size = Vector3.new(400, 240, 1)
    a1.backdrop.Color = u7
    a1.backdrop.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, 0, -40))
    local v122 = a1:sceneryAssets()
    for n_1 = 0, 5 do
        local v123 = ((n_1 % 2 ~= 0) and "WallPanelB") or "WallPanelA"
        local v124
        if v122 == nil then
            v124 = v122
        else
            v124 = v122:FindFirstChild(v123)
        end
        local v125
        local v126
        if v124 ~= nil and (v124:IsA("Model")) then
            v125 = v124:Clone()
            a1:normalizeClone(v125)
            v125.Parent = a2
            v126 = n_1
            table.insert(a1.wallTiles, v125)
            table.insert(a1.wallOffsets, (v126 - 1) * 30)
            continue
        else
            if n_1 == 0 then
                warn("[FlappyBasket] missing scenery asset FlappyBasket.WallPanelA/B \226\128\148 using the fallback wall")
            end
            v125 = a1:buildFallbackWallPanel(a2, n_1)
            v126 = nil
            table.insert(a1.wallTiles, v125)
            table.insert(a1.wallOffsets, (v126 - 1) * 30)
        end
        table.insert(a1.wallTiles, v125)
        table.insert(a1.wallOffsets, (v126 - 1) * 30)
    end
    local v127 = nil
    for n_2 = 0, 5 do
        local v123
        if v122 == nil then
            v123 = v122
        else
            v123 = v122:FindFirstChild("FloorStrip")
        end
        if v123 == nil then
            v127 = Instance.new("Model")
            v127.Name = "FloorStrip"
            v127.Parent = a2
            local v128 = makeStagePart_upv_1(v127)
            v128.Size = Vector3.new(30, 1, 2)
            v128.Color = u10
            v128.CFrame = CFrame.new(0, 0, 0)
            v127.WorldPivot = CFrame.new(0, 0, 0)
            table.insert(a1.floorTiles, v127)
            table.insert(a1.floorOffsets, (n_2 - 1) * 30)
            continue
        end
        if v123:IsA("Model") then
            local v129 = v123:Clone()
            a1:normalizeClone(v129)
            v129.Parent = a2
        else
            v127 = Instance.new("Model")
            v127.Name = "FloorStrip"
            v127.Parent = a2
            local v128 = makeStagePart_upv_1(v127)
            v128.Size = Vector3.new(30, 1, 2)
            v128.Color = u10
            v128.CFrame = CFrame.new(0, 0, 0)
            v127.WorldPivot = CFrame.new(0, 0, 0)
        end
        table.insert(a1.floorTiles, v127)
        table.insert(a1.floorOffsets, (n_2 - 1) * 30)
    end
end
u19.buildFallbackWallPanel = function(a1, a2, a3)
    --[[
      name: buildFallbackWallPanel
      line: 1549
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u8 (copy, index: 4)
        u9 (copy, index: 5)
    ]]
    local v130 = Instance.new("Model")
    v130.Name = ((a3 % 2 ~= 0) and "WallPanelB") or "WallPanelA"
    v130.Parent = a2
    local v131 = makeStagePart_upv_1(v130)
    v131.Size = Vector3.new(30, 60, 1)
    v131.Color = u7
    v131.CFrame = CFrame.new(0, 0, 0)
    local v132 = Random.new(a3 + 7)
    for n_3 = 0, 6 do
        local v133 = v132:NextNumber(-12, 12)
        local v134 = v132:NextNumber(-26, 26)
        local v135 = v132:NextNumber(2.6, 4.2)
        local v136 = v132:NextNumber(1.2, 1.8)
        if n_3 % 2 == 0 then
            local v137 = makeSmoothPart_upv_1(v130)
            v137.Size = Vector3.new(v135, v136, 0.12)
            v137.Color = u8
            v137.CFrame = CFrame.new(v133, v134, 0.53)
            continue
        end
        local v138 = nil
        for _, value_29 in {{v135, 0.18, 0, v136 / 2}, {v135, 0.18, 0, -v136 / 2}, {0.18, v136, v135 / 2, 0}, {0.18, v136, -v135 / 2, 0}} do
            v138 = makeSmoothPart_upv_1(v130)
            v138.Size = Vector3.new(value_29[1], value_29[2], 0.12)
            v138.Color = u9
            v138.CFrame = CFrame.new(v133 + value_29[3], v134 + value_29[4], 0.53)
        end
    end
    v130.WorldPivot = CFrame.new(0, 0, 0)
    return v130
end
u19.buildWatermark = function(a1, a2)
    --[[
      name: buildWatermark
      line: 1587
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u11 (copy, index: 2)
    ]]
    a1.watermarkPart = makeSmoothPart_upv_1(a2)
    a1.watermarkPart.Size = Vector3.new(24, 14, 0.20000000298023224)
    a1.watermarkPart.Transparency = 1
    local v139 = Instance.new("SurfaceGui")
    v139.Face = Enum.NormalId.Back
    v139.CanvasSize = Vector2.new(480, 280)
    v139.Parent = a1.watermarkPart
    local v140 = Instance.new("TextLabel")
    v140.BackgroundTransparency = 1
    v140.Size = UDim2.fromScale(1, 1)
    v140.Font = Enum.Font.GothamBlack
    v140.Text = "0"
    v140.TextScaled = true
    v140.TextColor3 = u11
    v140.TextTransparency = 0.72
    v140.Parent = v139
    a1.watermarkLabel = v140
end
u19.buildSwishText = function(a1, a2)
    --[[
      name: buildSwishText
      line: 1607
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
    ]]
    a1.swishAnchor = makeSmoothPart_upv_1(a2)
    a1.swishAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.swishAnchor.Transparency = 1
    local v141 = Instance.new("BillboardGui")
    v141.Size = UDim2.fromOffset(420, 130)
    v141.AlwaysOnTop = true
    v141.Parent = a1.swishAnchor
    a1.swishBillboard = v141
    local v142 = Instance.new("TextLabel")
    v142.BackgroundTransparency = 1
    v142.Size = UDim2.fromScale(1, 1)
    v142.Font = Enum.Font.GothamBlack
    v142.Text = "SWISH!"
    v142.TextScaled = true
    v142.TextTransparency = 1
    v142.TextStrokeTransparency = 0.6
    v142.Parent = v141
    a1.swishLabel = v142
end
u19.buildSparkle = function(a1, a2)
    --[[
      name: buildSparkle
      line: 1627
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
    ]]
    local v143 = Instance.new("Model")
    v143.Name = "Sparkle"
    v143.Parent = a2
    local tbl_15 = {}
    tbl_15.model = v143
    local v144 = makeSmoothPart_upv_1(v143)
    v144.Material = Enum.Material.Neon
    v144.Size = Vector3.new(1.100000023841858, 0.18000000715255737, 0.18000000715255737)
    v144.Transparency = 1
    local v145 = makeSmoothPart_upv_1(v143)
    v145.Material = Enum.Material.Neon
    v145.Size = Vector3.new(1.100000023841858, 0.18000000715255737, 0.18000000715255737)
    v145.Transparency = 1
    tbl_15.bars = {v144, v145}
    a1:parkSparkle(tbl_15)
    return tbl_15
end
u19.parkSparkle = function(a1, a2)
    --[[
      name: parkSparkle
      line: 1652
    ]]
    a2.active = false
    a2.bars[1].Transparency = 1
    a2.bars[2].Transparency = 1
    a2.bars[1].CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, -30, 0))
    a2.bars[2].CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, -30, 0))
end
u19.burstSparkles = function(a1, a2, a3)
    --[[
      name: burstSparkles
      line: 1663
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v146 = nil
    local v147 = nil
    local v148 = nil
    for _, value_30 in a1.sparkles do
        v146 = a1.cosmeticRandom:NextNumber(0, math.tau)
        v147 = a1.cosmeticRandom:NextNumber(6, 12)
        value_30.x = a2
        value_30.y = a3
        value_30.velocityX = math.cos(v146) * v147
        value_30.velocityY = (math.sin(v146) * v147) + 3
        value_30.spinDegrees = a1.cosmeticRandom:NextNumber(0, 90)
        value_30.age = 0
        value_30.active = true
        v148 = tbl_upv_1[a1.cosmeticRandom:NextInteger(0, #tbl_upv_1 - 1) + 1]
        value_30.bars[1].Color = v148
        value_30.bars[2].Color = v148
    end
end
u19.animateSparkles = function(a1, a2)
    --[[
      name: animateSparkles
      line: 1679
    ]]
    for _, value_31 in a1.sparkles do
        if not (value_31.active) then
            continue
        end
        value_31.age = value_31.age + a2
        if value_31.age < 0.5 then
            value_31.x = value_31.x + (value_31.velocityX * a2)
            value_31.y = value_31.y + (value_31.velocityY * a2)
            value_31.velocityY = value_31.velocityY - (20 * a2)
            value_31.spinDegrees = value_31.spinDegrees + (240 * a2)
            local v149 = value_31.age / 0.5
            local v150 = CFrame.new(a1.stage.origin + Vector3.new(value_31.x, value_31.y, 0.8))
            value_31.bars[1].Transparency = v149
            value_31.bars[2].Transparency = v149
            value_31.bars[1].CFrame = v150 * CFrame.Angles(0, 0, math.rad(value_31.spinDegrees + 45))
            value_31.bars[2].CFrame = v150 * CFrame.Angles(0, 0, math.rad(value_31.spinDegrees - 45))
        else
            a1:parkSparkle(value_31)
        end
    end
end
u19.buildBurstPool = function(a1, a2)
    --[[
      name: buildBurstPool
      line: 1705
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
    ]]
    for v151 = 0, 31 do
        local v152 = makeSmoothPart_upv_1(a2)
        v152.Material = Enum.Material.Neon
        v152.Size = Vector3.new(0.6000000238418579, 0.1599999964237213, 0.1599999964237213)
        v152.Transparency = 1
        local tbl_16 = {}
        tbl_16.part = v152
        table.insert(a1.burstShards, tbl_16)
        a1:parkShard(tbl_16)
    end
    a1.burstAnchor = makeSmoothPart_upv_1(a2)
    a1.burstAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.burstAnchor.Transparency = 1
    a1.burstAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, 0, 0))
    local v153 = Instance.new("ParticleEmitter")
    v153.Color = ColorSequence.new(Color3.fromRGB(255, 224, 186), Color3.fromRGB(255, 178, 92))
    v153.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(1, 0)})
    v153.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)})
    v153.Lifetime = NumberRange.new(0.3, 0.5)
    v153.Rate = 0
    v153.Speed = NumberRange.new(4, 7)
    v153.SpreadAngle = Vector2.new(24, 24)
    v153.EmissionDirection = Enum.NormalId.Bottom
    v153.LightEmission = 0.6
    v153.Parent = a1.burstAnchor
    a1.plainPuff = v153
    local v151 = Instance.new("ParticleEmitter")
    v151.Color = ColorSequence.new(u12)
    v151.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0)})
    local tbl_17 = {NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1)}
    v151.Transparency = NumberSequence.new(tbl_17)
    v151.Lifetime = NumberRange.new(0.35, 0.6)
    v151.Rate = 0
    v151.Speed = NumberRange.new(6, 10)
    v151.SpreadAngle = Vector2.new(180, 180)
    v151.LightEmission = 1
    v151.Parent = a1.burstAnchor
    a1.swishGlitter = v151
end
u19.buildBallTrail = function(a1)
    --[[
      name: buildBallTrail
      line: 1760
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        u15 (copy, index: 3)
    ]]
    local v154 = Instance.new("Attachment")
    v154.Position = Vector3.new(0, FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 0.7, 0)
    v154.Parent = a1.ballCore
    local v155 = Instance.new("Attachment")
    v155.Position = Vector3.new(0, -FLAPPY_BASKET_CONFIG_upv_1.ballRadius * 0.7, 0)
    v155.Parent = a1.ballCore
    local v156 = Instance.new("Trail")
    v156.Attachment0 = v154
    v156.Attachment1 = v155
    v156.Lifetime = 0.16
    v156.LightEmission = 1
    v156.FaceCamera = true
    v156.Transparency = u16
    v156.Color = u15
    v156.Enabled = true
    v156.Parent = a1.ballCore
    a1.ballTrail = v156
end
u19.applyTrailLook = function(a1, a2)
    --[[
      name: applyTrailLook
      line: 1779
      upvalues:
        u15 (copy, index: 1)
        u17 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    a1.trailIsHot = a2
    local ballTrail_1 = a1.ballTrail
    local v157
    if a2 then
        v157 = ColorSequence.new(a1:streakHeatColor())
    else
        v157 = u15
    end
    ballTrail_1.Color = v157
    local ballTrail_2 = a1.ballTrail
    if a2 then
        v157 = u17
    else
        v157 = u16
    end
    ballTrail_2.Transparency = v157
    a1.ballTrail.Lifetime = (a2 and 0.22) or 0.16
end
u19.parkShard = function(a1, a2)
    --[[
      name: parkShard
      line: 1785
    ]]
    a2.active = false
    a2.part.Transparency = 1
    a2.part.CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, -40, 0))
end
u19.takeShard = function(a1)
    --[[
      name: takeShard
      line: 1792
    ]]
    local v158 = a1.burstShards[1]
    for _, value_32 in a1.burstShards do
        if value_32.active then
            if v158.age / v158.life < value_32.age / value_32.life then
                v158 = value_32
            end
        else
            return value_32
        end
    end
    return v158
end
u19.spawnShard = function(a1, a2)
    --[[
      name: spawnShard
      line: 1804
    ]]
    local v159 = a1:takeShard()
    v159.x = a2.x
    v159.y = a2.y
    v159.velocityX = a2.velocityX
    v159.velocityY = a2.velocityY
    v159.angleDegrees = a2.angleDegrees
    v159.lengthFrom = a2.lengthFrom
    v159.lengthTo = a2.lengthTo
    v159.age = 0
    v159.life = a2.life
    v159.active = true
    v159.part.Color = a2.color
end
u19.spawnShardRing = function(a1, a2, a3, a4)
    --[[
      name: spawnShardRing
      line: 1818
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v160 = FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 * 0.8
    local v161 = 0
    local v162 = false
    while true do
        if v162 then
            v161 = v161 + 1
        else
            v162 = true
        end
        if v161 >= a4.count then
            break
        end
        local v163 = ((v161 / a4.count) * math.pi) * 2 + a1.cosmeticRandom:NextNumber(-0.12, 0.12)
        local v164 = math.cos(v163)
        local v165 = math.sin(v163)
        local v166 = a4.speed * a1.cosmeticRandom:NextNumber(0.85, 1.15)
        a1:spawnShard({x = a2 + (v164 * v160), y = a3 + (v165 * v160), velocityX = v164 * v166, velocityY = v165 * v166, angleDegrees = math.deg(v163) + 90, life = a4.life, color = a4.color})
    end
end
u19.spawnShardRays = function(a1, a2, a3, a4)
    --[[
      name: spawnShardRays
      line: 1850
    ]]
    local v167 = a1.cosmeticRandom:NextNumber(0, math.tau)
    for n_4 = 0, 5 do
        local v168 = v167 + ((n_4 / 6) * math.pi) * 2
        local v169 = math.cos(v168)
        local v170 = math.sin(v168)
        a1:spawnShard({x = a2 + (v169 * 0.6), y = a3 + (v170 * 0.6), velocityX = v169 * 2.5, velocityY = v170 * 2.5, angleDegrees = math.deg(v168), color = a4})
    end
end
u19.spawnBasketBurst = function(a1, a2)
    --[[
      name: spawnBasketBurst
      line: 1869
      upvalues:
        u14 (copy, index: 1)
    ]]
    a1:spawnShardRing(a2.centerX, a2.centerY, {color = u14})
    a1.burstAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2.centerX, a2.centerY, 0.9))
    a1.plainPuff:Emit(9)
end
u19.spawnSwishBurst = function(a1, a2)
    --[[
      name: spawnSwishBurst
      line: 1881
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v171 = a1:streakHeatColor()
    a1:spawnShardRing(a2.centerX, a2.centerY, {color = v171})
    a1:spawnShardRing(a2.centerX, a2.centerY, {color = v171})
    a1:spawnShardRays(a2.centerX, a2.centerY, v171)
    a1.burstAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2.centerX, a2.centerY, 0.9))
    a1.swishGlitter.Color = ColorSequence.new(v171)
    a1.swishGlitter:Emit(((FLAPPY_BASKET_CONFIG_upv_1.fireStreak > a1.swishStreak) and 14) or 24)
end
u19.animateBurstShards = function(a1, a2)
    --[[
      name: animateBurstShards
      line: 1902
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    for _, value_33 in a1.burstShards do
        if not (value_33.active) then
            continue
        end
        value_33.age = value_33.age + a2
        if value_33.life > value_33.age then
            local v172 = value_33.age / value_33.life
            value_33.x = value_33.x + (value_33.velocityX * a2)
            value_33.y = value_33.y + (value_33.velocityY * a2)
            value_33.part.Size = Vector3.new(lerp_upv_1(value_33.lengthFrom, value_33.lengthTo, v172), 0.16, 0.16)
            value_33.part.Transparency = v172
            value_33.part.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_33.x, value_33.y, 0.9)) * CFrame.Angles(0, 0, math.rad(value_33.angleDegrees))
        else
            a1:parkShard(value_33)
        end
    end
end
u19.updateTrailAndWatermark = function(a1, a2)
    --[[
      name: updateTrailAndWatermark
      line: 1925
      upvalues:
        u11 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
    ]]
    if a1.trailFlashRemaining > 0 then
        a1.trailFlashRemaining = a1.trailFlashRemaining - a2
    end
    local v173 = a1.fireEmitter.Enabled or (a1.trailFlashRemaining > 0)
    if v173 ~= a1.trailIsHot then
        a1:applyTrailLook(v173)
    end
    if a1.watermarkPulseAge >= 0.35 then
        return
    end
    a1.watermarkPulseAge = a1.watermarkPulseAge + a2
    if a1.watermarkPulseAge < 0.35 then
        local v174 = math.sin((a1.watermarkPulseAge / 0.35) * math.pi)
        a1.watermarkLabel.TextTransparency = lerp_upv_1(0.72, 0.42, v174)
        a1.watermarkLabel.TextColor3 = u11:Lerp(a1.watermarkPulseColor, v174 * 0.8)
    else
        a1.watermarkLabel.TextTransparency = 0.72
        a1.watermarkLabel.TextColor3 = u11
    end
end
u19.buildMissWall = function(a1, a2)
    --[[
      name: buildMissWall
      line: 1945
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u18 (copy, index: 2)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.missWallPart = makeSmoothPart_upv_1(a2)
    a1.missWallPart.Material = Enum.Material.Neon
    a1.missWallPart.Color = u18
    a1.missWallPart.Size = Vector3.new(0.8, (FLAPPY_BASKET_CONFIG_upv_1.ceilingY - FLAPPY_BASKET_CONFIG_upv_1.floorY) + 4, 1.2)
    a1.missWallPart.Transparency = 1
    a1.missWallPart.CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, 0, 0))
end
u19.armMissWall = function(a1, a2)
    --[[
      name: armMissWall
      line: 1955
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v175 = a2.centerX + FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2
    local v176 = v175 + FLAPPY_BASKET_CONFIG_upv_1.missWallDistanceStuds
    local v177
    v177 = nil
    for _, value_34 in a1.hoops do
        if value_34.state == "preview" == true then
            v177 = value_34
            break
        end
    end
    if v177 ~= nil then
        v176 = math.min(v176, (v177.centerX - (FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2)) - 1)
    end
    a1.missWallX = math.max(v176, v175 + FLAPPY_BASKET_CONFIG_upv_1.missWallMinDistanceStuds)
    a1.missWallBlinkPhase = 0
    a1.context.audio.play("buzz", {})
end
u19.animateMissWall = function(a1, a2)
    --[[
      name: animateMissWall
      line: 1982
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local missWallX_1 = a1.missWallX
    if missWallX_1 ~= nil then
        a1.missWallBlinkPhase = a1.missWallBlinkPhase + ((a2 * FLAPPY_BASKET_CONFIG_upv_1.missWallBlinkHz) * (1 - math.clamp(math.max(missWallX_1 - a1.ballX, 0) / FLAPPY_BASKET_CONFIG_upv_1.missWallDistanceStuds, 0, 1) + 1))
        local v178 = a1.missWallBlinkPhase % 1 < 0.5
        local missWallPart_1 = a1.missWallPart
        local v179
        if v178 then
            v179 = 0.25
        else
            v179 = 0.85
        end
        missWallPart_1.Transparency = v179
        a1.missWallPart.CFrame = CFrame.new(a1.stage.origin + Vector3.new(missWallX_1, (FLAPPY_BASKET_CONFIG_upv_1.ceilingY + FLAPPY_BASKET_CONFIG_upv_1.floorY) / 2, 0.5))
    else
        return nil
    end
end
u19.clearMissWall = function(a1)
    --[[
      name: clearMissWall
      line: 1996
    ]]
    a1.missWallX = nil
    a1.missWallBlinkPhase = 0
    a1.missWallPart.Transparency = 1
    a1.missWallPart.CFrame = CFrame.new(a1.stage.origin + Vector3.new(-4000, 0, 0))
end
u19.streakHeatColor = function(a1)
    --[[
      name: streakHeatColor
      line: 2004
      upvalues:
        u12 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    return u12:Lerp(u13, math.clamp(a1.swishStreak / 8, 0, 1))
end
u19.popSwishText = function(a1)
    --[[
      name: popSwishText
      line: 2007
    ]]
    a1.swishTextAge = 0
    a1.swishLabel.Text = ("SWISH! X%*"):format(a1.swishStreak)
    a1.swishLabel.TextColor3 = a1:streakHeatColor()
end
u19.animateSwishText = function(a1, a2, a3)
    --[[
      name: animateSwishText
      line: 2012
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.swishTextAge < 1 then
        a1.swishTextAge = a1.swishTextAge + a2
        local v180 = math.clamp(a1.swishTextAge / 1, 0, 1)
        a1.swishLabel.TextTransparency = ((v180 >= 0.6) and ((v180 - 0.6) / 0.4)) or 0
        local v181 = math.min(a1.swishTextAge / 0.12, 1) * -0.44999999999999996 + 1.45
        a1.swishBillboard.Size = UDim2.fromOffset(v181 * 420, v181 * 130)
        a1.swishAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a3, (FLAPPY_BASKET_CONFIG_upv_1.ceilingY - 5) + (v180 * 2), 2))
    else
        a1.swishLabel.TextTransparency = 1
        return nil
    end
end
u19.layoutTiles = function(a1, a2, a3)
    --[[
      name: layoutTiles
      line: 2030
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.backdrop.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2, 0, -40))
    a1.watermarkPart.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2, 2, -9.4))
    for n_5 = 0, #a1.wallTiles - 1 do
        local v182 = a1.wallOffsets[n_5 + 1]
        while v182 - a2 < -90 do
            v182 = v182 + 180
        end
        while v182 - a2 > 90 do
            v182 = v182 - 180
        end
        a1.wallOffsets[n_5 + 1] = v182
        a1.wallTiles[n_5 + 1]:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(v182, 0, -10)))
    end
    for n_6 = 0, #a1.floorTiles - 1 do
        local v182 = a1.floorOffsets[n_6 + 1]
        while v182 - a2 < -90 do
            v182 = v182 + 180
        end
        while v182 - a2 > 90 do
            v182 = v182 - 180
        end
        a1.floorOffsets[n_6 + 1] = v182
        a1.floorTiles[n_6 + 1]:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(v182, FLAPPY_BASKET_CONFIG_upv_1.floorY - 0.5, 0)))
    end
end
u19.poseBall = function(a1, a2, a3, a4)
    --[[
      name: poseBall
      line: 2069
      upvalues:
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v183 = CFrame.new(a1.stage.origin + Vector3.new(a2, a3, 0)) * CFrame.Angles(0, 0, math.rad(a4)) * a1.ballOrientation
    a1.ballModel:PivotTo(v183)
    if a1.wingDetached then
        return nil
    else
        local v184 = ((a1.wingFlapRemaining <= 0) and 0) or (math.sin((1 - (a1.wingFlapRemaining / FLAPPY_BASKET_CONFIG_upv_1.wingFlapSeconds)) * math.pi) * math.rad(FLAPPY_BASKET_CONFIG_upv_1.wingFlapDegrees))
        for _, value_35 in a1.wings do
            value_35.model:PivotTo(v183 * a1:flappedWingLocal(value_35, v184))
        end
    end
end
u19.flappedWingLocal = function(a1, a2, a3)
    --[[
      name: flappedWingLocal
      line: 2090
    ]]
    if a3 ~= 0 then
        local v185 = CFrame.new(a2.restLocal.Position)
        return (v185 * CFrame.Angles(0, 0, a2.flapSign * a3) * v185:Inverse()) * a2.restLocal
    end
    return a2.restLocal
end
local tbl_18 = {}
tbl_18.FlappyBasketGame = u19
return tbl_18