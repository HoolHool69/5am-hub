-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function nextUnit_1(a1)
    --[[
      name: nextUnit
      line: 45
    ]]
    a1.randomState = (a1.randomState * 48271) % 2147483647
    return (a1.randomState - 1) / 2147483646
end
local function easeToFloor_1(a1, a2, a3, a4)
    --[[
      name: easeToFloor
      line: 62
    ]]
    if a3 > 0 then
        return a2 + ((a1 - a2) * math.exp(-a3 / math.max(a4, 1e-06)))
    end
    return a1
end
local function placeHoop_upv_1(a1, a2)
    --[[
      name: placeHoop
      line: 154
    ]]
    local hoop_1 = a1.hoop
    hoop_1.side = ((a1.swapIndex % 2 ~= 0) and -1) or 1
    local score_1 = a1.score
    local hoopHalfWidthStart_1 = a2.hoopHalfWidthStart
    local hoopHalfWidthFloor_1 = a2.hoopHalfWidthFloor
    local rampDecayScore_1 = a2.rampDecayScore
    local v1
    if score_1 > 0 then
        v1 = hoopHalfWidthFloor_1 + (hoopHalfWidthStart_1 - hoopHalfWidthFloor_1) * math.exp(-score_1 / math.max(rampDecayScore_1, 1e-06))
    else
        v1 = hoopHalfWidthStart_1
    end
    hoop_1.halfWidth = v1
    local v2 = math.max(a1.ball.y - a2.rimReachStuds, a2.rimYMin)
    local v3 = math.min(a1.ball.y + a2.rimReachStuds, a2.rimYMax)
    a1.randomState = (a1.randomState * 48271) % 2147483647
    hoop_1.anchorY = v2 + (((a1.randomState - 1) / 2147483646) * math.max(v3 - v2, 0))
    a1.randomState = (a1.randomState * 48271) % 2147483647
    hoop_1.bobPhase = (((a1.randomState - 1) / 2147483646) * math.pi) * 2
    hoop_1.bobAmplitude = a2.bobAmplitudeStart + ((a2.bobAmplitudeEnd - a2.bobAmplitudeStart) * math.clamp(a1.score / math.max(a2.bobRampScore, 1e-06), 0, 1))
    hoop_1.centerX = hoop_1.side * (((a2.fieldHalfWidth - hoop_1.halfWidth) - a2.rimKnobRadius) - a2.pocketSealStuds)
    hoop_1.centerY = hoop_1.anchorY
    hoop_1.previousCenterX = hoop_1.centerX
    hoop_1.previousCenterY = hoop_1.centerY
    hoop_1.velocityX = 0
    hoop_1.velocityY = 0
    hoop_1.touchedRim = false
    hoop_1.touchedBoard = false
end
local function ringLocalY(a1, a2)
    --[[
      name: ringLocalY
      line: 252
    ]]
    return a2.y - a1.centerY
end
local function collideNet_upv_1(a1, a2, a3, a4, a5)
    --[[
      name: collideNet
      line: 324
    ]]
    local velocityX_1 = a2.velocityX
    local velocityY_1 = a2.velocityY
    local v4 = a3.contactDistance * 0.85
    local v5 = 0
    v5 = v5
    local v6 = nil
    for n_1 = 0, 3 do
        local v7 = ((n_1 % 2 ~= 0) and 1) or -1
        local v8 = n_1 >= 2
        local centerX_1 = a2.centerX
        if v8 then
            v6 = 0.52
        else
            v6 = 0.8
        end
        local centerY_1 = a2.centerY
        v6 = (v8 and 1) or 0.5
        local v9 = a1.x - (centerX_1 + (v7 * a4 * v6))
        local v10 = a1.y - (centerY_1 - (a5 * v6))
        v6 = math.sqrt((v9 * v9) + (v10 * v10))
        if v4 <= v6 then
            continue
        end
        local v11, v12, v13, v14, v15
        if v6 < 0.001 then
            continue
        end
        v11 = v9 / v6
        v12 = v10 / v6
        local v16 = v4 - v6
        a1.x = a1.x + (v11 * v16)
        a1.y = a1.y + (v12 * v16)
        a2.touchedRim = true
        v13 = a1.velocityX - velocityX_1
        v14 = a1.velocityY - velocityY_1
        v15 = v13 * v11 + v14 * v12
        if v15 >= 0 then
            continue
        end
        a1.velocityX = (((v13 - (v15 * v11)) * a3.tangentKeep) - (((v15 * a3.restitution) * 0.6) * v11)) + velocityX_1
        a1.velocityY = (((v14 - (v15 * v12)) * a3.tangentKeep) - (((v15 * a3.restitution) * 0.6) * v12)) + velocityY_1
        if v5 < -v15 then
            v5 = -v15
        end
    end
    return v5
end
local function collideWalls_upv_1(a1, a2, a3)
    --[[
      name: collideWalls
      line: 383
    ]]
    local v17 = a3.fieldHalfWidth - a3.ballRadius
    if -v17 < a1.x and a1.x < v17 then
        return 0
    end
    local v18 = ((a1.x < 0) and -1) or 1
    a1.x = v18 * v17
    local v19 = a2.centerY + a3.boardBottomOffset
    local v20 = false
    if v18 == a2.side then
        v20 = false
        if v19 <= a1.y then
            v20 = a1.y <= v19 + a3.boardHeight
        end
    end
    local v21
    if v20 then
        v21 = a3.boardRestitution
    else
        v21 = a3.wallRestitution
    end
    if v20 then
        a2.touchedBoard = true
    end
    if a1.velocityX * v18 > 0 then
        a1.velocityX = -a1.velocityX * v21
    end
    if v20 then
        return 2
    end
    return 1
end
local function enforceSpeedBand_1(a1, a2)
    --[[
      name: enforceSpeedBand
      line: 448
    ]]
    local v22 = math.abs(a1.velocityX)
    if a2.minHorizontalSpeed <= v22 and v22 <= a2.maxHorizontalSpeed then
        return nil
    end
    a1.velocityX = (((a1.velocityX >= 0) and 1) or -1) * math.clamp(v22, a2.minHorizontalSpeed, a2.maxHorizontalSpeed)
end
local function onBasket_upv_1(a1, a2)
    --[[
      name: onBasket
      line: 458
      upvalues:
        placeHoop_upv_1 (copy, index: 1)
        ringLocalY (ref,  index: 2)
    ]]
    local v23 = not a1.hoop.touchedBoard
    a1.perfectStreak = (v23 and (a1.perfectStreak + 1)) or 0
    local v24
    if v23 then
        local _ = a2.multiplierLadder
        v24 = a2.multiplierLadder[math.clamp(math.floor(a1.perfectStreak), 0, #a2.multiplierLadder - 1) + 1]
    else
        v24 = a2.multiplierLadder[1]
    end
    a1.score = a1.score + v24
    a1.baskets = a1.baskets + 1
    a1.lastAward = v24
    a1.lastWasPerfect = v23
    local score_2 = a1.score
    local clockStartSeconds_1 = a2.clockStartSeconds
    local clockFloorSeconds_1 = a2.clockFloorSeconds
    local rampDecayScore_2 = a2.rampDecayScore
    local v25
    if score_2 > 0 then
        v25 = clockFloorSeconds_1 + (clockStartSeconds_1 - clockFloorSeconds_1) * math.exp(-score_2 / math.max(rampDecayScore_2, 1e-06))
    else
        v25 = clockStartSeconds_1
    end
    a1.clockLimit = v25
    a1.clockRemaining = math.min(a1.clockRemaining + a2.clockGrantSeconds, a1.clockLimit)
    a1.swapIndex = a1.swapIndex + 1
    placeHoop_upv_1(a1, a2)
    a1.hoop.previousLocalY = ringLocalY(a1.hoop, a1.ball)
end
local function collideFloorCeiling_upv_1(a1, a2)
    --[[
      name: collideFloorCeiling
      line: 410
    ]]
    local v26 = a2.floorY + a2.ballRadius
    local v27 = nil
    if a1.y >= v26 then
        v27 = a2.ceilingY - a2.ballRadius
        if v27 >= a1.y then
            return 0
        end
        a1.y = v27
        if a1.velocityY > 0 then
            a1.velocityY = 0
        end
        return 2
    end
    a1.y = v26
    if a1.velocityY < 0 then
        if -a1.velocityY >= a2.floorRestSpeed then
            a1.velocityY = -a1.velocityY * a2.floorRestitution
        else
            a1.velocityY = 0
            return 0
        end
    end
    return 1
end
local function stepDeadBall_1(a1, a2, a3)
    --[[
      name: stepDeadBall
      line: 485
      upvalues:
        collideFloorCeiling_upv_1 (copy, index: 1)
    ]]
    local ball_1 = a1.ball
    ball_1.velocityY = ball_1.velocityY + (a2.gravity * a3)
    ball_1.x = ball_1.x + (ball_1.velocityX * a3)
    ball_1.y = ball_1.y + (ball_1.velocityY * a3)
    if a1.ball.velocityY < a2.terminalVelocity then
        a1.ball.velocityY = a2.terminalVelocity
    end
    collideFloorCeiling_upv_1(a1.ball, a2)
end
local function advanceHoop_upv_1(a1, a2, a3)
    --[[
      name: advanceHoop
      line: 366
    ]]
    a1.previousCenterX = a1.centerX
    a1.previousCenterY = a1.centerY
    a1.bobPhase = a1.bobPhase + (a2.bobAngularSpeed * a3)
    a1.centerY = a1.anchorY + (math.sin(a1.bobPhase) * a1.bobAmplitude)
    a1.velocityX = ((a3 <= 0) and 0) or ((a1.centerX - a1.previousCenterX) / a3)
    a1.velocityY = ((a3 <= 0) and 0) or ((a1.centerY - a1.previousCenterY) / a3)
end
local function collideRim_upv_1(a1, a2, a3, a4)
    --[[
      name: collideRim
      line: 279
    ]]
    local velocityX_2 = a2.velocityX
    local velocityY_2 = a2.velocityY
    local v28 = 0
    v28 = v28
    for n_2 = 0, 1 do
        local v29 = a1.x - (a2.centerX + ((((n_2 ~= 0) and 1) or -1) * a4))
        local v30 = a1.y - a2.centerY
        local v31
        v31 = math.sqrt((v29 * v29) + (v30 * v30))
        if a3.contactDistance <= v31 then
            continue
        end
        local v32, v33, v34, v35, v36
        if v31 < 0.001 then
            continue
        end
        v32 = v29 / v31
        v33 = v30 / v31
        local v37 = a3.contactDistance - v31
        a1.x = a1.x + (v32 * v37)
        a1.y = a1.y + (v33 * v37)
        a2.touchedRim = true
        v34 = a1.velocityX - velocityX_2
        v35 = a1.velocityY - velocityY_2
        v36 = v34 * v32 + v35 * v33
        if v36 >= 0 then
            continue
        end
        a1.velocityX = (((v34 - (v36 * v32)) * a3.tangentKeep) - ((v36 * a3.restitution) * v32)) + velocityX_2
        a1.velocityY = (((v35 - (v36 * v33)) * a3.tangentKeep) - ((v36 * a3.restitution) * v33)) + velocityY_2
        if v28 < -v36 then
            v28 = -v36
        end
    end
    return v28
end
local tbl_1 = {}
tbl_1.seedRandomState = function(a1)
    --[[
      name: seedRandomState
      line: 34
    ]]
    local v38 = math.floor(math.abs(a1)) % 2147483647
    if v38 == 0 then
        v38 = 1
    end
    return (((((((((((v38 * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647
end
tbl_1.hoopHalfWidthForScore = function(a1, a2)
    --[[
      name: hoopHalfWidthForScore
      line: 68
    ]]
    local hoopHalfWidthStart_2 = a2.hoopHalfWidthStart
    local hoopHalfWidthFloor_2 = a2.hoopHalfWidthFloor
    local rampDecayScore_3 = a2.rampDecayScore
    if a1 > 0 then
        return hoopHalfWidthFloor_2 + ((hoopHalfWidthStart_2 - hoopHalfWidthFloor_2) * math.exp(-a1 / math.max(rampDecayScore_3, 1e-06)))
    end
    return hoopHalfWidthStart_2
end
tbl_1.clockLimitForScore = function(a1, a2)
    --[[
      name: clockLimitForScore
      line: 71
    ]]
    local clockStartSeconds_2 = a2.clockStartSeconds
    local clockFloorSeconds_2 = a2.clockFloorSeconds
    local rampDecayScore_4 = a2.rampDecayScore
    if a1 > 0 then
        return clockFloorSeconds_2 + ((clockStartSeconds_2 - clockFloorSeconds_2) * math.exp(-a1 / math.max(rampDecayScore_4, 1e-06)))
    end
    return clockStartSeconds_2
end
tbl_1.multiplierForStreak = function(a1, a2)
    --[[
      name: multiplierForStreak
      line: 75
    ]]
    local multiplierLadder_1 = a2.multiplierLadder
    return multiplierLadder_1[math.clamp(math.floor(a1), 0, #multiplierLadder_1 - 1) + 1]
end
tbl_1.hoopCentreXFor = function(a1, a2, a3)
    --[[
      name: hoopCentreXFor
      line: 87
    ]]
    return a1 * (((a3.fieldHalfWidth - a2) - a3.rimKnobRadius) - a3.pocketSealStuds)
end
tbl_1.makeBallState = function()
    --[[
      name: makeBallState
      line: 91
    ]]
    return {}
end
tbl_1.makeHoopState = function()
    --[[
      name: makeHoopState
      line: 99
    ]]
    return {}
end
tbl_1.makeRunState = function()
    --[[
      name: makeRunState
      line: 117
    ]]
    local tbl_2 = {}
    tbl_2.ball = {}
    tbl_2.hoop = {}
    return tbl_2
end
tbl_1.resetRun = function(a1, a2, a3)
    --[[
      name: resetRun
      line: 174
      upvalues:
        placeHoop_upv_1 (copy, index: 1)
        ringLocalY (ref,  index: 2)
    ]]
    local v39 = math.floor(math.abs(a3)) % 2147483647
    if v39 == 0 then
        v39 = 1
    end
    a1.randomState = (((((((((((v39 * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647
    a1.score = 0
    a1.baskets = 0
    a1.perfectStreak = 0
    a1.lastAward = 0
    a1.lastWasPerfect = false
    a1.elapsed = 0
    a1.pendingFlap = false
    a1.status = "playing"
    a1.swapIndex = 0
    a1.clockLimit = a2.clockStartSeconds
    a1.clockRemaining = a1.clockLimit
    a1.ball.x = 0
    a1.ball.y = 0
    a1.ball.velocityY = a2.flapVelocity * 0.6
    placeHoop_upv_1(a1, a2)
    a1.ball.velocityX = a1.hoop.side * a2.launchSpeed
    a1.hoop.previousLocalY = ringLocalY(a1.hoop, a1.ball)
end
tbl_1.reviveRun = function(a1, a2)
    --[[
      name: reviveRun
      line: 208
      upvalues:
        ringLocalY (ref, index: 1)
    ]]
    a1.status = "playing"
    local score_3 = a1.score
    local clockStartSeconds_3 = a2.clockStartSeconds
    local clockFloorSeconds_3 = a2.clockFloorSeconds
    local rampDecayScore_5 = a2.rampDecayScore
    local v40
    if score_3 > 0 then
        v40 = clockFloorSeconds_3 + (clockStartSeconds_3 - clockFloorSeconds_3) * math.exp(-score_3 / math.max(rampDecayScore_5, 1e-06))
    else
        v40 = clockStartSeconds_3
    end
    a1.clockLimit = v40
    a1.clockRemaining = a1.clockLimit
    a1.lastAward = 0
    a1.lastWasPerfect = false
    a1.pendingFlap = false
    a1.ball.x = 0
    a1.ball.y = 0
    a1.ball.velocityX = a1.hoop.side * a2.launchSpeed
    a1.ball.velocityY = a2.flapVelocity * 0.6
    a1.hoop.touchedRim = false
    a1.hoop.touchedBoard = false
    a1.hoop.previousLocalY = ringLocalY(a1.hoop, a1.ball)
end
tbl_1.pressFlap = function(a1)
    --[[
      name: pressFlap
      line: 225
    ]]
    if a1.status == "playing" then
        a1.pendingFlap = true
    else
        return nil
    end
end
tbl_1.clearPendingFlap = function(a1)
    --[[
      name: clearPendingFlap
      line: 232
    ]]
    a1.pendingFlap = false
end
tbl_1.stepBall = function(a1, a2, a3)
    --[[
      name: stepBall
      line: 242
    ]]
    a1.velocityY = a1.velocityY + (a2 * a3)
    a1.x = a1.x + (a1.velocityX * a3)
    a1.y = a1.y + (a1.velocityY * a3)
end
tbl_1.ringLocalX = function(a1, a2)
    --[[
      name: ringLocalX
      line: 248
    ]]
    return a2.x - a1.centerX
end
tbl_1.ringLocalY = ringLocalY
tbl_1.crossedRingDownward = function(a1, a2, a3)
    --[[
      name: crossedRingDownward
      line: 261
      upvalues:
        ringLocalY (ref, index: 1)
    ]]
    local v41 = ringLocalY(a1, a2)
    if a1.previousLocalY > 0 and v41 <= 0 then
        local v42 = math.abs(a2.x - a1.centerX) < a3
        return v42
    end
    return false
end
tbl_1.collideRim = collideRim_upv_1
tbl_1.collideNet = collideNet_upv_1
tbl_1.advanceHoop = advanceHoop_upv_1
tbl_1.collideWalls = collideWalls_upv_1
tbl_1.collideFloorCeiling = collideFloorCeiling_upv_1
tbl_1.enforceSpeedBand = enforceSpeedBand_1
tbl_1.stepRun = function(a1, a2, a3)
    --[[
      name: stepRun
      line: 498
      upvalues:
        collideFloorCeiling_upv_1 (copy, index: 1)
        advanceHoop_upv_1 (copy, index: 2)
        collideWalls_upv_1 (copy, index: 3)
        collideRim_upv_1 (copy, index: 4)
        ringLocalY (ref,  index: 5)
        onBasket_upv_1 (copy, index: 6)
        collideNet_upv_1 (copy, index: 7)
    ]]
    a1.lastAward = 0
    a1.lastWasPerfect = false
    local v43, v44, v45, v46 = nil, nil, nil, nil
    if a1.status == "playing" then
        local v47 = "none"
        if a1.pendingFlap then
            a1.pendingFlap = false
            a1.ball.velocityY = a2.flapVelocity
            local _ = "flapped"
        end
        a1.elapsed = a1.elapsed + a3
        advanceHoop_upv_1(a1.hoop, a2, a3)
        local ball_2 = a1.ball
        ball_2.velocityY = ball_2.velocityY + (a2.gravity * a3)
        ball_2.x = ball_2.x + (ball_2.velocityX * a3)
        ball_2.y = ball_2.y + (ball_2.velocityY * a3)
        if a1.ball.velocityY < a2.terminalVelocity then
            a1.ball.velocityY = a2.terminalVelocity
        end
        v43 = collideFloorCeiling_upv_1(a1.ball, a2)
        if v43 == 1 then
            v47 = "floor"
        elseif v43 == 2 then
            v47 = "ceiling"
        end
        v44 = collideWalls_upv_1(a1.ball, a1.hoop, a2)
        if v44 == 2 then
            v47 = "board"
        elseif v44 == 1 then
            v47 = "wall"
        end
        v45 = {}
        v45.contactDistance = a2.ballRadius + a2.rimKnobRadius
        v45.restitution = a2.rimRestitution
        v45.tangentKeep = a2.rimTangentKeep
        if collideRim_upv_1(a1.ball, a1.hoop, v45, a1.hoop.halfWidth) > 0 then
            v47 = "rim"
        end
        v46 = a1.hoop
        local ball_3 = a1.ball
        local halfWidth_1 = a1.hoop.halfWidth
        local v48 = ringLocalY(v46, ball_3)
        local v49
        if v46.previousLocalY <= 0 or v48 > 0 then
            v49 = false
        else
            v49 = math.abs(ball_3.x - v46.centerX) < halfWidth_1
        end
        if v49 then
            onBasket_upv_1(a1, a2)
            local ball_4 = a1.ball
            v46 = math.abs(ball_4.velocityX)
            if a2.minHorizontalSpeed > v46 or v46 > a2.maxHorizontalSpeed then
                ball_4.velocityX = (((ball_4.velocityX >= 0) and 1) or -1) * math.clamp(v46, a2.minHorizontalSpeed, a2.maxHorizontalSpeed)
            end
            return "basket"
        else
            if collideNet_upv_1(a1.ball, a1.hoop, v45, a1.hoop.halfWidth, a2.netDepth) > 0 then
                v47 = "net"
            end
            a1.hoop.previousLocalY = ringLocalY(a1.hoop, a1.ball)
            local ball_5 = a1.ball
            v46 = math.abs(ball_5.velocityX)
            if a2.minHorizontalSpeed > v46 or v46 > a2.maxHorizontalSpeed then
                ball_5.velocityX = (((ball_5.velocityX >= 0) and 1) or -1) * math.clamp(v46, a2.minHorizontalSpeed, a2.maxHorizontalSpeed)
            end
            a1.clockRemaining = a1.clockRemaining - a3
            if a1.clockRemaining > 0 then
                return v47
            end
            a1.clockRemaining = 0
            a1.status = "expired"
            return "expired"
        end
    else
        local ball_6 = a1.ball
        ball_6.velocityY = ball_6.velocityY + (a2.gravity * a3)
        ball_6.x = ball_6.x + (ball_6.velocityX * a3)
        ball_6.y = ball_6.y + (ball_6.velocityY * a3)
        if a1.ball.velocityY < a2.terminalVelocity then
            a1.ball.velocityY = a2.terminalVelocity
        end
        collideFloorCeiling_upv_1(a1.ball, a2)
        return "none"
    end
end
return tbl_1