-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local TRAFFIC_RUSH_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-config").TRAFFIC_RUSH_CONFIG
local tbl_upv_1 = {{lateral = TRAFFIC_RUSH_CONFIG_upv_1.laneLateralOffset}, {lateral = -TRAFFIC_RUSH_CONFIG_upv_1.laneLateralOffset}, {lateral = TRAFFIC_RUSH_CONFIG_upv_1.laneLateralOffset}, {lateral = -TRAFFIC_RUSH_CONFIG_upv_1.laneLateralOffset}}
local function poolCapacity_1()
    --[[
      name: poolCapacity
      line: 74
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v1 = 0
    for _, value_1 in TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes do
        v1 = v1 + value_1.maxActive
    end
    return v1
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 84
    ]]
    return "TrafficRushSim"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 89
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 93
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.listener = a2
    a1.pool = {}
    a1.laneQueues = {{}, {}, {}, {}}
    a1.activePerType = {}
    a1.activePerVariant = {}
    a1.xCandidates = {}
    a1.zCandidates = {}
    a1.smashedLeaders = {}
    a1.smashedBy = {}
    a1.nearMissPairs = {}
    a1.seed = 0
    a1.simTime = 0
    a1.spawnIndex = 0
    a1.nextSpawnAt = 0
    a1.scoreValue = 0
    a1.nearMissValue = 0
    local v3 = 0
    local v4 = false
    v4, v3 = v4, v3
    while true do
        if v4 then
            v3 = v3 + 1
        else
            v4 = true
        end
        local v5 = 0
        for _, value_2 in TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes do
            v5 = v5 + value_2.maxActive
        end
    end
    local tbl_4 = nil
    for _, value_3 in TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes do
        table.insert(a1.activePerType, 0)
        tbl_4 = {}
        for v7, v6 in value_3.variants do
            table.insert(tbl_4, 0)
        end
        table.insert(a1.activePerVariant, tbl_4)
    end
end
u1.reset = function(a1, a2)
    --[[
      name: reset
      line: 155
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.seed = a2
    a1.simTime = 0
    a1.spawnIndex = 0
    a1.nextSpawnAt = TRAFFIC_RUSH_CONFIG_upv_1.firstSpawnDelay
    a1.scoreValue = 0
    a1.nearMissValue = 0
    a1.crashedA = nil
    a1.crashedB = nil
    table.clear(a1.nearMissPairs)
    for _, value_4 in a1.laneQueues do
        while #value_4 > 0 do
            value_4[#value_4] = nil
        end
    end
    for n_1 = 0, #a1.activePerType - 1 do
        a1.activePerType[n_1 + 1] = 0
    end
    for _, value_5 in a1.activePerVariant do
        for n_2 = 0, #value_5 - 1 do
            value_5[n_2 + 1] = 0
        end
    end
    for _, value_6 in a1.pool do
        value_6.active = false
    end
    a1:prefill()
end
u1.prefill = function(a1)
    --[[
      name: prefill
      line: 183
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
    ]]
    local v7 = nil
    for n_3 = 0, TRAFFIC_RUSH_CONFIG_upv_1.prefillCount - 1 do
        local v8 = deriveRandom_upv_1(a1.seed, 1000 + a1.spawnIndex)
        local v9 = v8:NextInteger(0, #tbl_upv_1 - 1)
        local v10 = v8:NextNumber()
        v8:NextNumber(TRAFFIC_RUSH_CONFIG_upv_1.spawnJitterMin, TRAFFIC_RUSH_CONFIG_upv_1.spawnJitterMax)
        local v11 = v8:NextNumber()
        a1.spawnIndex = a1.spawnIndex + 1
        local v12 = a1:pickType(v10)
        local v13
        v13 = a1:pickVariant(v12, v11)
        if v13 == nil then
            continue
        end
        if v7 == nil then
            v7 = ((v9 >= 2) and 2) or 0
        end
        local v14 = v7 + n_3 % 2
        local v15
        v15 = a1:laneAcceptsSpawn(v14, TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[v12 + 1].variants[v13 + 1].length)
        if v15 then
            a1:spawn(v14, v12, v13, ((TRAFFIC_RUSH_CONFIG_upv_1.prefillCount - 1) - n_3) * TRAFFIC_RUSH_CONFIG_upv_1.prefillSpacingStuds)
        end
    end
end
u1.score = function(a1)
    --[[
      name: score
      line: 212
    ]]
    return a1.scoreValue
end
u1.nearMisses = function(a1)
    --[[
      name: nearMisses
      line: 215
    ]]
    return a1.nearMissValue
end
u1.isCrashed = function(a1)
    --[[
      name: isCrashed
      line: 218
    ]]
    return a1.crashedA ~= nil
end
u1.ramp = function(a1)
    --[[
      name: ramp
      line: 221
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.min(a1.scoreValue / TRAFFIC_RUSH_CONFIG_upv_1.scoreForMaxDifficulty, 1))
end
u1.step = function(a1, a2)
    --[[
      name: step
      line: 224
    ]]
    if a1.crashedA == nil then
        a1.simTime = a1.simTime + a2
        if a1.nextSpawnAt <= a1.simTime then
            a1:trySpawn()
        end
        a1:moveVehicles(a2)
        a1:scanCrossTraffic()
    else
        return nil
    end
end
u1.tap = function(a1, a2)
    --[[
      name: tap
      line: 235
    ]]
    local v16 = a1:findActive(a2)
    if v16 ~= nil and not (v16.cleared) and not (v16.crashed) and not (v16.unstoppable) then
        if v16.stopped then
            v16.stopped = false
            return "released"
        end
        v16.stopped = true
        v16.stopTimer = 0
        v16.dashed = false
        return "stopped"
    end
    return nil
end
u1.dash = function(a1, a2)
    --[[
      name: dash
      line: 250
    ]]
    local v17 = a1:findActive(a2)
    if v17 ~= nil and not (v17.cleared) and not (v17.crashed) and not (v17.unstoppable) then
        v17.dashed = true
        v17.stopped = false
        return true
    end
    return false
end
u1.pickNearest = function(a1, a2, a3)
    --[[
      name: pickNearest
      line: 259
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v18 = nil
    local v19 = TRAFFIC_RUSH_CONFIG_upv_1.pickRadius
    local v20 = math.huge
    local v21 = nil
    local v22 = nil
    local v23 = nil
    local v24 = nil
    local v25 = nil
    local v26 = nil
    local v27 = nil
    local v28 = nil
    local v29 = nil
    local v30 = nil
    for _, value_7 in a1.pool do
        if not (value_7.active) or value_7.cleared or value_7.crashed or value_7.unstoppable then
            continue
        end
        v21 = tbl_upv_1[value_7.laneIndex + 1]
        v22 = tbl_upv_1[value_7.laneIndex + 1]
        v23 = math.abs((((v22.axis == "x") and (tbl_upv_1[value_7.laneIndex + 1].dir * (value_7.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v22.lateral)) - a2)
        v24 = tbl_upv_1[value_7.laneIndex + 1]
        v25 = math.abs((((v24.axis == "z") and (tbl_upv_1[value_7.laneIndex + 1].dir * (value_7.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v24.lateral)) - a3)
        v26 = ((v21.axis ~= "x") and (value_7.width / 2)) or (value_7.length / 2)
        v22 = ((v21.axis ~= "z") and (value_7.width / 2)) or (value_7.length / 2)
        v27 = math.max(v23 - v26, 0)
        v28 = math.max(v25 - v22, 0)
        v30 = math.sqrt((v27 * v27) + (v28 * v28))
        v29 = v23 * v23 + v25 * v25
        if v30 < v19 then
            v19, v18, v20 = v30, value_7, v29
            continue
        end
        if v18 == nil or v30 ~= v19 then
            continue
        end
        if v29 < v20 then
            v19, v18, v20 = v30, value_7, v29
        end
    end
    return v18
end
u1.recoverFromCrash = function(a1)
    --[[
      name: recoverFromCrash
      line: 288
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local crashedA_1 = a1.crashedA
    local crashedB_1 = a1.crashedB
    a1.crashedA = nil
    a1.crashedB = nil
    if crashedA_1 ~= nil then
        a1:retire(crashedA_1)
    end
    if crashedB_1 ~= nil then
        a1:retire(crashedB_1)
    end
    a1.nextSpawnAt = a1.simTime + TRAFFIC_RUSH_CONFIG_upv_1.reviveSpawnHolidaySeconds
end
u1.trySpawn = function(a1)
    --[[
      name: trySpawn
      line: 301
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v31 = deriveRandom_upv_1(a1.seed, 1000 + a1.spawnIndex)
    local v32 = v31:NextInteger(0, #tbl_upv_1 - 1)
    local v33 = v31:NextNumber()
    local v34 = v31:NextNumber(TRAFFIC_RUSH_CONFIG_upv_1.spawnJitterMin, TRAFFIC_RUSH_CONFIG_upv_1.spawnJitterMax)
    local v35 = v31:NextNumber()
    a1.spawnIndex = a1.spawnIndex + 1
    local v36 = a1:pickType(v33)
    local v37 = TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[v36 + 1]
    local v38 = 0
    for _, value_8 in a1.pool do
        if not (value_8.active) then
            continue
        end
        if not (value_8.cleared) then
            v38 = v38 + 1
        end
    end
    if TRAFFIC_RUSH_CONFIG_upv_1.maxApproachingVehicles <= v38 then
        a1.nextSpawnAt = a1.simTime + TRAFFIC_RUSH_CONFIG_upv_1.spawnRetrySeconds
        return nil
    else
        local v39 = nil
        if v37.maxActive > a1.activePerType[v36 + 1] then
            v39 = a1:pickVariant(v36, v35)
            if v39 ~= nil then
                local v40 = v37.variants[v39 + 1]
                for n_4 = 0, #tbl_upv_1 - 1 do
                    local v41 = (v32 + n_4) % #tbl_upv_1
                    local v42
                    v42 = a1:laneAcceptsSpawn(v41, v40.length)
                    if not (v42) then
                        continue
                    end
                    a1:spawn(v41, v36, v39)
                    a1.nextSpawnAt = a1.simTime + ((TRAFFIC_RUSH_CONFIG_upv_1.spawnIntervalStart + ((TRAFFIC_RUSH_CONFIG_upv_1.spawnIntervalEnd - TRAFFIC_RUSH_CONFIG_upv_1.spawnIntervalStart) * a1:ramp())) * v34)
                    return nil
                end
                a1.nextSpawnAt = a1.simTime + TRAFFIC_RUSH_CONFIG_upv_1.spawnRetrySeconds
            else
                a1.nextSpawnAt = a1.simTime + TRAFFIC_RUSH_CONFIG_upv_1.spawnRetrySeconds
                return nil
            end
        else
            a1.nextSpawnAt = a1.simTime + TRAFFIC_RUSH_CONFIG_upv_1.spawnRetrySeconds
            return nil
        end
    end
end
u1.pickType = function(a1, a2)
    --[[
      name: pickType
      line: 342
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v43 = #TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes - 1
    local v44 = 0
    for n_5 = 0, #TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes - 1 do
        v44 = v44 + TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[n_5 + 1].weight
        if a2 <= v44 then
            v43 = n_5
            break
        end
    end
    local v45 = TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[v43 + 1]
    if v45.unlockScore > 0 and a1.scoreValue < v45.unlockScore then
        return 0
    end
    return v43
end
u1.pickVariant = function(a1, a2, a3)
    --[[
      name: pickVariant
      line: 360
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local variants_1 = TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[a2 + 1].variants
    local v46 = math.min(math.floor(a3 * #variants_1), #variants_1 - 1)
    for n_6 = 0, #variants_1 - 1 do
        local v47
        v47 = (v46 + n_6) % #variants_1
        if a1.activePerVariant[a2 + 1][v47 + 1] >= variants_1[v47 + 1].poolSize then
            continue
        end
        return v47
    end
    return nil
end
u1.laneAcceptsSpawn = function(a1, a2, a3)
    --[[
      name: laneAcceptsSpawn
      line: 371
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v48 = a1.laneQueues[a2 + 1]
    local v49 = v48[#v48]
    if v49 ~= nil then
        return TRAFFIC_RUSH_CONFIG_upv_1.entryClearance < ((v49.progress - (v49.length / 2)) - (a3 / 2))
    end
    return true
end
u1.spawn = function(a1, a2, a3, a4, a5)
    --[[
      name: spawn
      line: 379
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a5 == nil then
        a5 = 0
    end
    local v50
    v50 = nil
    for v51, value_9 in a1.pool do
        if not (value_9.active) then
            v50 = value_9
            break
        end
    end
    if v50 ~= nil then
        local v52 = TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[a3 + 1]
        local v53 = v52.variants[a4 + 1]
        v50.id = a1.spawnIndex - 1
        v50.laneIndex = a2
        v50.typeIndex = a3
        v50.variantIndex = a4
        v50.length = v53.length
        v50.width = v53.width
        v50.unstoppable = v53.unstoppable
        v50.smashesLeader = v53.smashesLeader
        v50.progress = a5
        v50.prevProgress = a5
        local v51 = v52.speed
        local value_9 = ((v52.speedRampExempt) and 1) or (a1:speedScale())
        v50.speed = v51 * value_9
        v50.stopped = false
        v50.stopTimer = 0
        v50.dashed = false
        v50.cleared = false
        v50.crashed = false
        v50.active = true
        table.insert(a1.laneQueues[a2 + 1], v50)
        local activePerType_1 = a1.activePerType
        local v54 = a3 + 1
        activePerType_1[v54] = activePerType_1[v54] + 1
        local v55 = a1.activePerVariant[a3 + 1]
        local v56 = a4 + 1
        v55[v56] = v55[v56] + 1
        a1.listener:onVehicleSpawned(v50)
    else
        return nil
    end
end
u1.speedScale = function(a1)
    --[[
      name: speedScale
      line: 419
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    return 1 + ((TRAFFIC_RUSH_CONFIG_upv_1.speedRampMax - 1) * a1:ramp())
end
u1.moveVehicles = function(a1, a2)
    --[[
      name: moveVehicles
      line: 422
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v57 = a1:speedScale()
    local v58 = nil
    local v59 = nil
    local v60 = nil
    local v61 = nil
    local v62 = nil
    local _ = nil
    for v69, value_10 in a1.laneQueues do
        v58 = 0
        for n_7 = 0, #value_10 - 1 do
            v59 = value_10[n_7 + 1]
            local v63 = TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes[v59.typeIndex + 1]
            v59.prevProgress = v59.progress
            if v59.stopped then
                v59.stopTimer = v59.stopTimer + a2
                if TRAFFIC_RUSH_CONFIG_upv_1.autoReleaseSeconds <= v59.stopTimer then
                    v59.stopped = false
                end
            end
            local v64
            if v63.speedRampExempt then
                v64 = 1
            else
                v64 = v57
            end
            local v65
            if v59.stopped then
                v65 = 0
            else
                v65 = v63.speed * v64 * (((not (v59.dashed)) and 1) or (TRAFFIC_RUSH_CONFIG_upv_1.dashSpeedMultiplier))
            end
            if v65 >= v59.speed then
                local v66
                if v59.dashed then
                    v66 = TRAFFIC_RUSH_CONFIG_upv_1.dashAccel
                else
                    v66 = TRAFFIC_RUSH_CONFIG_upv_1.accel
                end
                v59.speed = math.min(v65, v59.speed + (v66 * a2))
            else
                v59.speed = math.max(v65, v59.speed - (TRAFFIC_RUSH_CONFIG_upv_1.brakeDecel * a2))
            end
            v59.progress = v59.progress + (v59.speed * a2)
            if n_7 > 0 then
                local v67 = value_10[n_7]
                v62 = v67.progress - ((v67.length + v59.length) / 2) - TRAFFIC_RUSH_CONFIG_upv_1.bumperGap
                if v62 < v59.progress then
                    if v59.smashesLeader then
                        if v67.unstoppable or v67.cleared then
                            v59.progress = math.max(v62, v59.prevProgress)
                            v59.speed = math.min(v59.speed, v67.speed)
                        else
                            a1.smashedLeaders[v58 + 1] = v67
                            a1.smashedBy[v58 + 1] = v59
                            v58 = v58 + 1
                        end
                    else
                        v59.progress = math.max(v62, v59.prevProgress)
                        v59.speed = math.min(v59.speed, v67.speed)
                    end
                end
            end
            if not v59.cleared and TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth < (v59.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance) - (v59.length / 2) then
                v59.cleared = true
                a1.scoreValue = a1.scoreValue + 1
                a1.listener:onVehicleCleared(v59)
            end
        end
        v60, v61 = false, 0
        while true do
            if v60 then
                v61 = v61 + 1
            else
                v60 = true
            end
            if v61 >= v58 then
                break
            end
            local v68 = a1.smashedLeaders[v61 + 1]
            a1.listener:onVehicleSmashed(v68, a1.smashedBy[v61 + 1])
            a1:retire(v68)
        end
        v61 = value_10[1]
        if v61 == nil then
            continue
        end
        if (TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance * 2) + 4 < v61.progress - (v61.length / 2) then
            a1:retire(v61)
        end
    end
end
u1.scanCrossTraffic = function(a1)
    --[[
      name: scanCrossTraffic
      line: 503
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v69 = 0
    local v70 = 0
    for v71, v72 in a1.pool do
        if not (v72.active) or ((TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth + (v72.length / 2)) + TRAFFIC_RUSH_CONFIG_upv_1.nearMissDistance) + 1 < math.abs(v72.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance) then
            continue
        end
        if tbl_upv_1[v72.laneIndex + 1].axis ~= "x" then
            a1.zCandidates[v70 + 1] = v72
            v70 = v70 + 1
        else
            a1.xCandidates[v69 + 1] = v72
            v69 = v69 + 1
        end
    end
    local v73, v74
    v73, v74 = false, 0
    local v75, v71, v72 = nil, nil, nil
    if v73 then
        v74 = v74 + 1
    else
        v73 = true
    end
    local v76, v77 = nil, nil
    if v74 >= v69 then
        return
    else
        v75 = a1.xCandidates[v74 + 1]
        v72 = tbl_upv_1[v75.laneIndex + 1]
        v71 = ((v72.axis == "x") and (tbl_upv_1[v75.laneIndex + 1].dir * (v75.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v72.lateral)
        local v78 = tbl_upv_1[v75.laneIndex + 1]
        v72 = ((v78.axis == "z") and (tbl_upv_1[v75.laneIndex + 1].dir * (v75.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v78.lateral)
        local v79 = 0
        local v80 = false
        v78 = v79
        local v81, v82, v83 = nil, nil, nil
        if v80 then
            v78 = v78 + 1
        else
            v80 = true
        end
        if v78 < v70 then
            v81 = a1.zCandidates[v78 + 1]
            v83 = tbl_upv_1[v81.laneIndex + 1]
            v82 = ((v83.axis == "x") and (tbl_upv_1[v81.laneIndex + 1].dir * (v81.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v83.lateral)
            local v84 = tbl_upv_1[v81.laneIndex + 1]
            v83 = ((v84.axis == "z") and (tbl_upv_1[v81.laneIndex + 1].dir * (v81.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v84.lateral)
            v76 = v75.length / 2 + v81.width / 2
            local v85 = v75.width / 2 + v81.length / 2
            v77 = math.abs(v71 - v82) - v76
            local v86 = math.abs(v72 - v83) - v85
            if v77 >= -(1 - TRAFFIC_RUSH_CONFIG_upv_1.collisionShrink) * v76 or v86 >= -(1 - TRAFFIC_RUSH_CONFIG_upv_1.collisionShrink) * v85 then
                if v77 < TRAFFIC_RUSH_CONFIG_upv_1.nearMissDistance then
                    local v87 = nil
                    if v86 < TRAFFIC_RUSH_CONFIG_upv_1.nearMissDistance then
                        v87 = v75.id * 1e+06 + v81.id
                        if a1.nearMissPairs[v87] == nil then
                            a1.nearMissPairs[v87] = true
                            a1.nearMissValue = a1.nearMissValue + 1
                            a1.listener:onNearMiss(v75, v81, (v71 + v82) / 2, (v72 + v83) / 2)
                        end
                    end
                end
                continue
            else
                v75.crashed = true
                v81.crashed = true
                a1.crashedA = v75
                a1.crashedB = v81
                a1.listener:onCrash(v75, v81, (v71 + v82) / 2, (v72 + v83) / 2)
                return nil
            end
        end
    end
    --[[ label_8 ]]--
    local v81, v82, v83 = nil, nil, nil
    if v80 then
        local v78 = nil
        v78 = v78 + 1
    else
        local v80
        v80 = true
    end
    while true do
        if v78 >= v70 then
            --[[ goto label_8 ]]--
        else
            v81 = a1.zCandidates[v78 + 1]
            v83 = tbl_upv_1[v81.laneIndex + 1]
            v82 = ((v83.axis == "x") and (tbl_upv_1[v81.laneIndex + 1].dir * (v81.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v83.lateral)
            local v84 = tbl_upv_1[v81.laneIndex + 1]
            v83 = ((v84.axis == "z") and (tbl_upv_1[v81.laneIndex + 1].dir * (v81.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance))) or (v84.lateral)
            v76 = v75.length / 2 + v81.width / 2
            local v85 = v75.width / 2 + v81.length / 2
            v77 = math.abs(v71 - v82) - v76
            local v86 = math.abs(v72 - v83) - v85
            if v77 >= -(1 - TRAFFIC_RUSH_CONFIG_upv_1.collisionShrink) * v76 or v86 >= -(1 - TRAFFIC_RUSH_CONFIG_upv_1.collisionShrink) * v85 then
                if v77 < TRAFFIC_RUSH_CONFIG_upv_1.nearMissDistance then
                    local v87 = nil
                    if v86 < TRAFFIC_RUSH_CONFIG_upv_1.nearMissDistance then
                        v87 = v75.id * 1e+06 + v81.id
                        if a1.nearMissPairs[v87] == nil then
                            a1.nearMissPairs[v87] = true
                            a1.nearMissValue = a1.nearMissValue + 1
                            a1.listener:onNearMiss(v75, v81, (v71 + v82) / 2, (v72 + v83) / 2)
                        end
                    end
                end
                continue
            else
                v75.crashed = true
                v81.crashed = true
                a1.crashedA = v75
                a1.crashedB = v81
                a1.listener:onCrash(v75, v81, (v71 + v82) / 2, (v72 + v83) / 2)
                return nil
            end
        end
    end
end
u1.findActive = function(a1, a2)
    --[[
      name: findActive
      line: 582
    ]]
    for _, value_11 in a1.pool do
        if not (value_11.active) or value_11.id ~= a2 then
            continue
        end
        return value_11
    end
    return nil
end
u1.retire = function(a1, a2)
    --[[
      name: retire
      line: 590
    ]]
    local v88 = nil
    if a2.active then
        a2.active = false
        local activePerType_2 = a1.activePerType
        local v89 = a2.typeIndex + 1
        activePerType_2[v89] = activePerType_2[v89] - 1
        local v90 = a1.activePerVariant[a2.typeIndex + 1]
        local v91 = a2.variantIndex + 1
        v90[v91] = v90[v91] - 1
        local v92 = a1.laneQueues[a2.laneIndex + 1]
        v88 = (table.find(v92, a2) or 0) - 1
        if v88 >= 0 then
            table.remove(v92, v88 + 1)
        end
        a1.listener:onVehicleDespawned(a2)
    else
        return nil
    end
end
local tbl_5 = {}
tbl_5.vehicleAlong = function(a1)
    --[[
      name: vehicleAlong
      line: 52
      upvalues:
        tbl_upv_1 (copy, index: 1)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 2)
    ]]
    return tbl_upv_1[a1.laneIndex + 1].dir * (a1.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance)
end
tbl_5.vehicleWorldX = function(a1)
    --[[
      name: vehicleWorldX
      line: 56
      upvalues:
        tbl_upv_1 (copy, index: 1)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v93 = tbl_upv_1[a1.laneIndex + 1]
    if v93.axis ~= "x" then
        return v93.lateral
    end
    return tbl_upv_1[a1.laneIndex + 1].dir * (a1.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance)
end
tbl_5.vehicleWorldZ = function(a1)
    --[[
      name: vehicleWorldZ
      line: 60
      upvalues:
        tbl_upv_1 (copy, index: 1)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v94 = tbl_upv_1[a1.laneIndex + 1]
    if v94.axis ~= "z" then
        return v94.lateral
    end
    return tbl_upv_1[a1.laneIndex + 1].dir * (a1.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance)
end
tbl_5.vehicleWorldXAt = function(a1, a2)
    --[[
      name: vehicleWorldXAt
      line: 65
      upvalues:
        tbl_upv_1 (copy, index: 1)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v95 = tbl_upv_1[a1.laneIndex + 1]
    if v95.axis ~= "x" then
        return v95.lateral
    end
    return v95.dir * (a2 - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance)
end
tbl_5.vehicleWorldZAt = function(a1, a2)
    --[[
      name: vehicleWorldZAt
      line: 69
      upvalues:
        tbl_upv_1 (copy, index: 1)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v96 = tbl_upv_1[a1.laneIndex + 1]
    if v96.axis ~= "z" then
        return v96.lateral
    end
    return v96.dir * (a2 - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance)
end
tbl_5.TRAFFIC_LANES = tbl_upv_1
tbl_5.TrafficRushSim = u1
return tbl_5