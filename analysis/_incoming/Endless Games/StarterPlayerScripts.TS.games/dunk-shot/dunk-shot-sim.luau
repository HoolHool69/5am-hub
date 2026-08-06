-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local DUNK_SHOT_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "dunk-shot-config").DUNK_SHOT_CONFIG
local tbl_1 = {"static", "horizontal", "vertical"}
local function placementFor_1(a1, a2)
    --[[
      name: placementFor
      line: 79
    ]]
    local tbl_2 = {}
    tbl_2.spec = a1
    tbl_2.anchorX = a1.side * a1.offsetX
    tbl_2.anchorY = ((a1.index ~= 0) and (a2 + a1.riseY)) or 0
    return tbl_2
end
local function hoopSpecAt_upv_1(a1, a2)
    --[[
      name: hoopSpecAt
      line: 57
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v1 = deriveRandom_upv_1(a1, 1000 + a2)
    local v2 = v1:NextNumber(DUNK_SHOT_CONFIG_upv_1.hoopOffsetXMin, DUNK_SHOT_CONFIG_upv_1.hoopOffsetXMax)
    local v3 = v1:NextNumber(DUNK_SHOT_CONFIG_upv_1.hoopRiseMin, DUNK_SHOT_CONFIG_upv_1.hoopRiseMax)
    local v4 = v1:NextNumber()
    local v5 = v1:NextNumber()
    local v6 = v1:NextNumber(DUNK_SHOT_CONFIG_upv_1.hoopMoveAmplitudeMin, DUNK_SHOT_CONFIG_upv_1.hoopMoveAmplitudeMax)
    local v7 = v1:NextNumber(DUNK_SHOT_CONFIG_upv_1.hoopMovePeriodMin, DUNK_SHOT_CONFIG_upv_1.hoopMovePeriodMax)
    local v8 = v1:NextNumber(0, math.tau)
    local tbl_3 = {}
    tbl_3.index = a2
    tbl_3.side = ((a2 % 2 ~= 0) and 1) or -1
    tbl_3.offsetX = v2
    tbl_3.riseY = v3
    tbl_3.moveRoll = v4
    tbl_3.motion = ((v5 >= 0.5) and "vertical") or "horizontal"
    tbl_3.amplitude = v6
    tbl_3.angularSpeed = math.tau / v7
    tbl_3.phase = v8
    return tbl_3
end
local function advanceHoopCentre(a1, a2)
    --[[
      name: advanceHoopCentre
      line: 263
    ]]
    a1.previousCenterX = a1.centerX
    a1.previousCenterY = a1.centerY
    if a1.motion ~= "static" then
        a1.phase = a1.phase + (a1.angularSpeed * a2)
        local v9 = math.sin(a1.phase) * a1.amplitude
        if a1.motion ~= "horizontal" then
            a1.centerX = a1.anchorX
            a1.centerY = a1.anchorY + v9
        else
            a1.centerX = a1.anchorX + v9
            a1.centerY = a1.anchorY
        end
    else
        a1.centerX = a1.anchorX
        a1.centerY = a1.anchorY
    end
    a1.velocityX = ((a2 <= 0) and 0) or ((a1.centerX - a1.previousCenterX) / a2)
    a1.velocityY = ((a2 <= 0) and 0) or ((a1.centerY - a1.previousCenterY) / a2)
end
local tbl_4 = {}
tbl_4.hoopSpecAt = hoopSpecAt_upv_1
tbl_4.placementFor = placementFor_1
tbl_4.buildHoopLadder = function(a1, a2)
    --[[
      name: buildHoopLadder
      line: 93
      upvalues:
        hoopSpecAt_upv_1 (copy, index: 1)
    ]]
    local tbl_5 = {}
    local v10 = 0
    local v11 = 0
    local v12 = false
    while true do
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
        if v11 >= a2 then
            break
        end
        local v13 = hoopSpecAt_upv_1(a1, v11)
        local tbl_6 = {}
        tbl_6.spec = v13
        tbl_6.anchorX = v13.side * v13.offsetX
        tbl_6.anchorY = ((v13.index ~= 0) and (v10 + v13.riseY)) or 0
        table.insert(tbl_5, tbl_6)
        v10 = tbl_6.anchorY
    end
    return tbl_5
end
tbl_4.motionForScore = function(a1, a2)
    --[[
      name: motionForScore
      line: 122
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local hoopMovePhaseScores_1 = DUNK_SHOT_CONFIG_upv_1.hoopMovePhaseScores
    if a2 >= hoopMovePhaseScores_1[1] and DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceStart + ((DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceMax - DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceStart) * math.clamp(a2 / DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceRampScore, 0, 1)) > a1.moveRoll then
        if a2 >= hoopMovePhaseScores_1[2] then
            return a1.motion
        end
        return "horizontal"
    end
    return "static"
end
tbl_4.motionSpeedFactor = function(a1)
    --[[
      name: motionSpeedFactor
      line: 139
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if DUNK_SHOT_CONFIG_upv_1.hoopMovePhaseScores[3] > a1 then
        return 1
    end
    return DUNK_SHOT_CONFIG_upv_1.hoopMoveFastFactor
end
tbl_4.makeBallState = function()
    --[[
      name: makeBallState
      line: 144
    ]]
    return {}
end
tbl_4.copyBallState = function(a1, a2)
    --[[
      name: copyBallState
      line: 153
    ]]
    a2.x = a1.x
    a2.y = a1.y
    a2.velocityX = a1.velocityX
    a2.velocityY = a1.velocityY
end
tbl_4.stepBall = function(a1, a2, a3)
    --[[
      name: stepBall
      line: 167
    ]]
    a1.velocityY = a1.velocityY + (a2 * a3)
    a1.x = a1.x + (a1.velocityX * a3)
    a1.y = a1.y + (a1.velocityY * a3)
end
tbl_4.reflectWalls = function(a1, a2)
    --[[
      name: reflectWalls
      line: 180
    ]]
    local v14 = a2.halfWidth - a2.ballRadius
    if v14 < a1.x and a1.velocityX > 0 then
        a1.x = v14 - (a1.x - v14)
        a1.velocityX = -a1.velocityX * a2.restitution
        return true
    elseif a1.x < -v14 and a1.velocityX < 0 then
        a1.x = -v14 + (-v14 - a1.x)
        a1.velocityX = -a1.velocityX * a2.restitution
        return true
    else
        return false
    end
end
tbl_4.slingSpeed = function(a1, a2, a3)
    --[[
      name: slingSpeed
      line: 195
    ]]
    return (math.min(a1 * a2, a3))
end
tbl_4.makeHoopRuntime = function()
    --[[
      name: makeHoopRuntime
      line: 206
    ]]
    return {}
end
tbl_4.adoptPlacement = function(a1, a2, a3)
    --[[
      name: adoptPlacement
      line: 233
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        advanceHoopCentre (ref,  index: 2)
    ]]
    local spec_1 = a2.spec
    a1.index = spec_1.index
    a1.anchorX = a2.anchorX
    a1.anchorY = a2.anchorY
    local hoopMovePhaseScores_2 = DUNK_SHOT_CONFIG_upv_1.hoopMovePhaseScores
    a1.motion = a3 < hoopMovePhaseScores_2[1] and "static" or DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceStart + (DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceMax - DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceStart) * math.clamp(a3 / DUNK_SHOT_CONFIG_upv_1.hoopMoveChanceRampScore, 0, 1) <= spec_1.moveRoll and "static" or a3 < hoopMovePhaseScores_2[2] and "horizontal" or spec_1.motion
    local angularSpeed_1 = spec_1.angularSpeed
    a1.angularSpeed = angularSpeed_1 * 1
    a1.phase = spec_1.phase
    if a1.motion ~= "horizontal" then
        a1.amplitude = ((a1.motion == "static") and 0) or (spec_1.amplitude)
    else
        a1.amplitude = math.max(math.min(spec_1.amplitude, (DUNK_SHOT_CONFIG_upv_1.fieldHalfWidth - DUNK_SHOT_CONFIG_upv_1.hoopHalfWidth) - math.abs(a2.anchorX)), 0)
        if a1.amplitude <= 0 then
            a1.motion = "static"
        end
    end
    a1.touchedRim = false
    a1.previousLocalY = 0
    advanceHoopCentre(a1, 0)
    a1.previousCenterX = a1.centerX
    a1.previousCenterY = a1.centerY
end
tbl_4.advanceHoopCentre = advanceHoopCentre
tbl_4.collideRim = function(a1, a2, a3)
    --[[
      name: collideRim
      line: 292
    ]]
    local velocityX_1 = a2.velocityX
    local velocityY_1 = a2.velocityY
    local v16 = 0
    v16 = v16
    for n_1 = 0, 1 do
        local v17 = a1.x - (a2.centerX + ((((n_1 ~= 0) and 1) or -1) * a3.halfWidth))
        local v18 = a1.y - a2.centerY
        local v19
        v19 = math.sqrt((v17 * v17) + (v18 * v18))
        if a3.contactDistance <= v19 then
            continue
        end
        local v20, v21, v22, v23, v24
        if v19 < 0.001 then
            continue
        end
        v20 = v17 / v19
        v21 = v18 / v19
        local v25 = a3.contactDistance - v19
        a1.x = a1.x + (v20 * v25)
        a1.y = a1.y + (v21 * v25)
        a2.touchedRim = true
        v22 = a1.velocityX - velocityX_1
        v23 = a1.velocityY - velocityY_1
        v24 = v22 * v20 + v23 * v21
        if v24 >= 0 then
            continue
        end
        a1.velocityX = (((v22 - (v24 * v20)) * a3.tangentKeep) - ((v24 * a3.restitution) * v20)) + velocityX_1
        a1.velocityY = (((v23 - (v24 * v21)) * a3.tangentKeep) - ((v24 * a3.restitution) * v21)) + velocityY_1
        if v16 < -v24 then
            v16 = -v24
        end
    end
    return v16
end
tbl_4.collideNet = function(a1, a2, a3, a4)
    --[[
      name: collideNet
      line: 340
    ]]
    local velocityX_2 = a2.velocityX
    local velocityY_2 = a2.velocityY
    local v26 = a3.contactDistance * 0.85
    local v27 = 0
    v27 = v27
    local v28 = nil
    for n_2 = 0, 3 do
        local v29 = ((n_2 % 2 ~= 0) and 1) or -1
        local v30 = n_2 >= 2
        local centerX_1 = a2.centerX
        if v30 then
            v28 = 0.52
        else
            v28 = 0.8
        end
        local centerY_1 = a2.centerY
        v28 = (v30 and 1) or 0.5
        local v31 = a1.x - (centerX_1 + (v29 * a3.halfWidth * v28))
        local v32 = a1.y - (centerY_1 - (a4 * v28))
        v28 = math.sqrt((v31 * v31) + (v32 * v32))
        if v26 <= v28 then
            continue
        end
        local v33, v34, v35, v36, v37
        if v28 < 0.001 then
            continue
        end
        v33 = v31 / v28
        v34 = v32 / v28
        local v38 = v26 - v28
        a1.x = a1.x + (v33 * v38)
        a1.y = a1.y + (v34 * v38)
        a2.touchedRim = true
        v35 = a1.velocityX - velocityX_2
        v36 = a1.velocityY - velocityY_2
        v37 = v35 * v33 + v36 * v34
        if v37 >= 0 then
            continue
        end
        a1.velocityX = (((v35 - (v37 * v33)) * a3.tangentKeep) - (((v37 * a3.restitution) * 0.6) * v33)) + velocityX_2
        a1.velocityY = (((v36 - (v37 * v34)) * a3.tangentKeep) - (((v37 * a3.restitution) * 0.6) * v34)) + velocityY_2
        if v27 < -v37 then
            v27 = -v37
        end
    end
    return v27
end
tbl_4.ringLocalX = function(a1, a2)
    --[[
      name: ringLocalX
      line: 381
    ]]
    return a2.x - a1.centerX
end
tbl_4.ringLocalY = function(a1, a2)
    --[[
      name: ringLocalY
      line: 385
    ]]
    return a2.y - a1.centerY
end
tbl_4.crossedRingDownward = function(a1, a2, a3)
    --[[
      name: crossedRingDownward
      line: 398
    ]]
    if a1.previousLocalY > 0 and a2.y - a1.centerY <= 0 then
        local v39 = math.abs(a2.x - a1.centerX) < a3
        return v39
    end
    return false
end
tbl_4.HOOP_MOTIONS = tbl_1
return tbl_4