-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function rightOf_1(a1)
    --[[
      name: rightOf
      line: 128
    ]]
    return (a1 + 1) % 4
end
local function tangentHeading_1(a1, a2)
    --[[
      name: tangentHeading
      line: 143
    ]]
    return (math.atan2(a2 * math.cos(a1), -a2 * math.sin(a1)))
end
local function nextRandom_1(a1)
    --[[
      name: nextRandom
      line: 150
    ]]
    local rngState_1 = a1.rngState
    local v1 = bit32.bxor(rngState_1, bit32.lshift(rngState_1, 13))
    local v2 = bit32.bxor(v1, bit32.rshift(v1, 17))
    v2 = bit32.bxor(v2, bit32.lshift(v2, 5))
    a1.rngState = v2
    return v2 / 4294967296
end
local function seedState_1(a1)
    --[[
      name: seedState
      line: 158
    ]]
    local v3 = math.floor(math.abs(a1)) % 4294967291
    if v3 ~= 0 then
        return v3
    end
    return 2654435769
end
local function createCar_1()
    --[[
      name: createCar
      line: 182
    ]]
    return {}
end
local function zeroedArray_upv_1(a1)
    --[[
      name: zeroedArray
      line: 163
    ]]
    local tbl_1 = {}
    local v4 = 0
    local v5 = false
    while true do
        if v5 then
            v4 = v4 + 1
        else
            v5 = true
        end
        if v4 >= a1 then
            break
        end
        table.insert(tbl_1, 0)
    end
    return tbl_1
end
local function lerpNumber_1(a1, a2, a3)
    --[[
      name: lerpNumber
      line: 284
    ]]
    return a1 + ((a2 - a1) * a3)
end
local u1 = 0
local u2 = 0
local u3 = 0
local u4 = 0
local function computeRect_upv_1(a1, a2, a3, a4, a5, a6, a7, a8)
    --[[
      name: computeRect
      line: 330
      upvalues:
        u1 (ref, index: 1)
        u2 (ref, index: 2)
        u3 (ref, index: 3)
        u4 (ref, index: 4)
    ]]
    local v6 = ((a3 == 1) and 1) or (((a3 ~= 3) and 0) or -1)
    local v7 = ((a3 == 0) and 1) or (((a3 ~= 2) and 0) or -1)
    local v8 = ((a4 == 1) and 1) or (((a4 ~= 3) and 0) or -1)
    local v9 = ((a4 == 0) and 1) or (((a4 ~= 2) and 0) or -1)
    u1 = a1 + math.min(a5 * v6, a6 * v6) + math.min(a7 * v8, a8 * v8)
    u2 = a1 + math.max(a5 * v6, a6 * v6) + math.max(a7 * v8, a8 * v8)
    u3 = a2 + math.min(a5 * v7, a6 * v7) + math.min(a7 * v9, a8 * v9)
    u4 = a2 + math.max(a5 * v7, a6 * v7) + math.max(a7 * v9, a8 * v9)
end
local function writeCorner_upv_1(a1, a2, a3, a4, a5, a6, a7, a8)
    --[[
      name: writeCorner
      line: 340
      upvalues:
        computeRect_upv_1 (copy, index: 1)
        u1 (ref,  index: 2)
        u2 (ref,  index: 3)
        u3 (ref,  index: 4)
        u4 (ref,  index: 5)
    ]]
    local v10 = a2 % a1.capacity
    local postInsetStuds_1 = a8.postInsetStuds
    local roadWidthStuds_1 = a8.roadWidthStuds
    a1.apexX[v10 + 1] = a3
    a1.apexY[v10 + 1] = a4
    a1.entryDirection[v10 + 1] = a5
    a1.exitDirection[v10 + 1] = a6
    a1.rotationSign[v10 + 1] = ((a6 ~= (a5 + 1) % 4) and 1) or -1
    a1.straightLength[v10 + 1] = a7
    local postX_1 = a1.postX
    local v11 = ((a6 == 1) and 1) or (((a6 ~= 3) and 0) or -1)
    postX_1[v10 + 1] = a3 + (postInsetStuds_1 * v11) - (postInsetStuds_1 * (((a5 == 1) and 1) or (((a5 ~= 3) and 0) or -1)))
    local postY_1 = a1.postY
    local v12 = ((a6 == 0) and 1) or (((a6 ~= 2) and 0) or -1)
    postY_1[v10 + 1] = a4 + (postInsetStuds_1 * v12) - (postInsetStuds_1 * (((a5 == 0) and 1) or (((a5 ~= 2) and 0) or -1)))
    computeRect_upv_1(a3, a4, a5, a6, -postInsetStuds_1 - a7, -postInsetStuds_1, -roadWidthStuds_1, 0)
    a1.straightMinX[v10 + 1] = u1
    a1.straightMaxX[v10 + 1] = u2
    a1.straightMinY[v10 + 1] = u3
    a1.straightMaxY[v10 + 1] = u4
    computeRect_upv_1(a3, a4, a5, a6, -postInsetStuds_1, roadWidthStuds_1, -roadWidthStuds_1, postInsetStuds_1)
    a1.elbowMinX[v10 + 1] = u1
    a1.elbowMaxX[v10 + 1] = u2
    a1.elbowMinY[v10 + 1] = u3
    a1.elbowMaxY[v10 + 1] = u4
    local gateValue_1 = a1.gateValue
    gateValue_1[v10 + 1] = ((a3 * (((a6 == 1) and 1) or (((a6 ~= 3) and 0) or -1)) + (a4 * (((a6 == 0) and 1) or (((a6 ~= 2) and 0) or -1)))) + postInsetStuds_1) + a8.gateOffsetStuds
    if a1.generatedThrough >= a2 then
        return
    end
    a1.generatedThrough = a2
end
local function drawStraightLength_upv_1(a1, a2, a3)
    --[[
      name: drawStraightLength
      line: 296
    ]]
    if a2 >= a3.prologueCorners then
        local v13 = math.min((a2 - a3.prologueCorners) / math.max(a3.straightRangeCorners, 1), 1)
        local v14 = 1 - (1 - v13) * (1 - v13)
        local straightEarlyMinStuds_1 = a3.straightEarlyMinStuds
        local v15 = straightEarlyMinStuds_1 + (a3.straightLateMinStuds - straightEarlyMinStuds_1) * v14
        local straightEarlyMaxStuds_1 = a3.straightEarlyMaxStuds
        local v16 = math.min(a2 / math.max(a3.speedRampCorners, 1), 1)
        local v17 = math.max(math.min(straightEarlyMaxStuds_1 + ((a3.straightLateMaxStuds - straightEarlyMaxStuds_1) * v14), (a3.roadWidthStuds * (a3.postInsetStuds + a3.minExitOffsetStuds)) / math.max((a3.baseSpeedStudsPerSecond + ((a3.maxSpeedStudsPerSecond - a3.baseSpeedStudsPerSecond) * (1 - ((1 - v16) * (1 - v16))))) * a3.releaseWindowFloorSeconds, 1e-04)), v15)
        local rngState_2 = a1.rngState
        local v18 = bit32.bxor(rngState_2, bit32.lshift(rngState_2, 13))
        local v19 = bit32.bxor(v18, bit32.rshift(v18, 17))
        v19 = bit32.bxor(v19, bit32.lshift(v19, 5))
        a1.rngState = v19
        return v15 + ((v19 / 4294967296) * (v17 - v15))
    end
    return a3.prologueStraightStuds
end
local function generateCorner_upv_1(a1, a2, a3)
    --[[
      name: generateCorner
      line: 381
      upvalues:
        drawStraightLength_upv_1 (copy, index: 1)
        writeCorner_upv_1 (copy, index: 2)
    ]]
    local v20 = (a2 - 1) % a1.capacity
    local v21 = a1.entryDirection[v20 + 1]
    local v22 = a1.exitDirection[v20 + 1]
    local v23 = a1.rotationSign[v20 + 1]
    local v24 = 0
    if v22 == 0 then
        local v25
        if a2 >= a3.prologueCorners then
            local _ = a1.rngState
            local v26 = bit32.bxor(a1.rngState, bit32.lshift(a1.rngState, 13))
            local v27 = bit32.bxor(v26, bit32.rshift(v26, 17))
            v27 = bit32.bxor(v27, bit32.lshift(v27, 5))
            a1.rngState = v27
            v25 = v27 / 4294967296 < 0.5
        else
            v25 = true
        end
        if v25 then
            v24 = 1
        else
            v24 = 3
        end
    end
    local v25
    if v24 ~= (v22 + 1) % 4 then
        v25 = 1
    else
        v25 = -1
    end
    local v28 = drawStraightLength_upv_1(a1, a2, a3)
    local v29 = v28 + 2 * a3.postInsetStuds
    local v30
    if v25 == v23 then
        v30 = 0
    else
        v30 = a3.roadWidthStuds
    end
    local v31 = ((v22 == 1) and 1) or (((v22 ~= 3) and 0) or -1)
    writeCorner_upv_1(a1, a2, (a1.apexX[v20 + 1] + (v29 * v31)) + (v30 * (((v21 == 1) and 1) or (((v21 ~= 3) and 0) or -1))), a1.apexY[v20 + 1] + (v29 * (((v22 == 0) and 1) or (((v22 ~= 2) and 0) or -1))) + (v30 * (((v21 == 0) and 1) or (((v21 ~= 2) and 0) or -1))), v22, v24, v28, a3)
end
local function ensureGenerated_1(a1, a2, a3)
    --[[
      name: ensureGenerated
      line: 412
      upvalues:
        generateCorner_upv_1 (copy, index: 1)
    ]]
    while a1.generatedThrough < a3 do
        generateCorner_upv_1(a1, a1.generatedThrough + 1, a2)
    end
end
local function placeInLane_upv_1(a1, a2, a3, a4)
    --[[
      name: placeInLane
      line: 438
    ]]
    local v32 = a1.currentCorner % a2.capacity
    local v33 = a2.entryDirection[v32 + 1]
    local v34 = a2.exitDirection[v32 + 1]
    local v35 = a3.postInsetStuds + math.clamp(a4, 0.5, a2.straightLength[v32 + 1])
    local v36 = -a3.roadWidthStuds * 0.5
    local v37 = ((v33 == 1) and 1) or (((v33 ~= 3) and 0) or -1)
    a1.x = a2.apexX[v32 + 1] - (v35 * v37) + (v36 * (((v34 == 1) and 1) or (((v34 ~= 3) and 0) or -1)))
    local v38 = ((v33 == 0) and 1) or (((v33 ~= 2) and 0) or -1)
    a1.y = a2.apexY[v32 + 1] - (v35 * v38) + (v36 * (((v34 == 0) and 1) or (((v34 ~= 2) and 0) or -1)))
    a1.heading = ((v33 == 0) and 1.5707963267948966) or (((v33 == 1) and 0) or (((v33 ~= 2) and math.pi) or -1.5707963267948966))
    a1.tethered = false
    a1.onExitLane = false
end
local function abeamDistance_upv_1(a1, a2)
    --[[
      name: abeamDistance
      line: 518
    ]]
    local v39 = a1.currentCorner % a2.capacity
    local v40 = a2.entryDirection[v39 + 1]
    local v41 = ((v40 == 1) and 1) or (((v40 ~= 3) and 0) or -1)
    return (a2.postX[v39 + 1] - a1.x) * v41 + ((a2.postY[v39 + 1] - a1.y) * (((v40 == 0) and 1) or (((v40 ~= 2) and 0) or -1)))
end
local function releaseTether_upv_1(a1, a2, a3)
    --[[
      name: releaseTether
      line: 588
    ]]
    local v42
    if a1.tethered then
        local v43 = a1.rotationSign
        local _ = a1.tetherCorner % a2.capacity
        local v44 = a2.exitDirection[a1.tetherCorner % a2.capacity + 1]
        v42 = a1.rotationSign * ((a2.exitDirection[a1.tetherCorner % a2.capacity + 1] == 0 and 1.5707963267948966 or a2.exitDirection[a1.tetherCorner % a2.capacity + 1] == 1 and 0 or a2.exitDirection[a1.tetherCorner % a2.capacity + 1] ~= 2 and math.pi or -1.5707963267948966) - a2.rotationSign[a1.tetherCorner % a2.capacity + 1] * 1.5707963267948966 - a1.phi)
    else
        v42 = 0
    end
    a1.tethered = false
    a1.onExitLane = true
    local phi_1 = a1.phi
    local rotationSign_1 = a1.rotationSign
    a1.heading = math.atan2(rotationSign_1 * math.cos(phi_1), -rotationSign_1 * math.sin(phi_1))
    a1.lastReleaseErrorRadians = v42
    local v43
    if math.abs(v42) <= math.rad(a3.perfectToleranceDegrees) then
        v43 = true
    else
        v43 = false
    end
    a1.lastReleaseWasPerfect = v43
    if v43 then
        a1.perfectDrifts = a1.perfectDrifts + 1
        a1.perfectStreak = a1.perfectStreak + 1
        if a1.bestPerfectStreak < a1.perfectStreak then
            a1.bestPerfectStreak = a1.perfectStreak
        end
        if a1.perfectStreak == a3.feverStreak then
            a1.feverEntries = a1.feverEntries + 1
        end
        if a3.feverStreak <= a1.perfectStreak then
            a1.feverActive = true
        end
    else
        a1.perfectStreak = 0
        a1.feverActive = false
    end
    a1.releaseCount = a1.releaseCount + 1
end
local function tryLatch_upv_1(a1, a2, a3)
    --[[
      name: tryLatch
      line: 540
      upvalues:
        abeamDistance_upv_1 (copy, index: 1)
    ]]
    if not (a1.tethered) then
        local v44 = nil
        if a1.alive then
            v44 = abeamDistance_upv_1(a1, a2)
            if a3.attachLeadStuds >= v44 then
                local v45 = nil
                if v44 >= -a3.attachTrailStuds then
                    local v46 = a1.currentCorner % a2.capacity
                    local v47 = a2.postX[v46 + 1]
                    local v48 = a2.postY[v46 + 1]
                    local v49 = a1.x - v47
                    local v50 = a1.y - v48
                    v45 = math.sqrt((v49 * v49) + (v50 * v50))
                    local v51, v52 = nil, nil
                    if v45 >= 1e-04 then
                        local v53 = a2.rotationSign[v46 + 1]
                        local v54 = a1.currentCorner % a2.capacity
                        local v55 = a2.exitDirection[v54 + 1]
                        local v56 = (((v55 == 0) and 1.5707963267948966) or (((v55 == 1) and 0) or (((v55 ~= 2) and math.pi) or -1.5707963267948966))) - a2.rotationSign[v54 + 1] * 1.5707963267948966
                        v51 = v53 * (v56 - math.atan2(v50, v49)) % math.tau
                        if v51 < 0 then
                            v51 = v51 + math.tau
                        end
                        local v57 = v56 - v53 * v51
                        local v58 = math.clamp(v45, a3.postInsetStuds + a3.minExitOffsetStuds, a3.postInsetStuds + a3.roadWidthStuds)
                        local heading_1 = a1.heading
                        a1.tethered = true
                        a1.tetherCorner = a1.currentCorner
                        a1.pivotX = v47
                        a1.pivotY = v48
                        a1.radius = v58
                        a1.phi = v57
                        a1.rotationSign = v53
                        a1.x = v47 + (v58 * math.cos(v57))
                        a1.y = v48 + (v58 * math.sin(v57))
                        a1.heading = math.atan2(v53 * math.cos(v57), -v53 * math.sin(v57))
                        v52 = (a1.heading - heading_1) % math.tau
                        if v52 > math.pi then
                            v52 = v52 - math.tau
                        end
                        if v52 <= -math.pi then
                            v52 = v52 + math.tau
                        end
                        a1.lastLatchSnapRadians = v52
                        a1.latchCount = a1.latchCount + 1
                        a1.onExitLane = false
                        return true
                    end
                end
            end
            return false
        end
    end
    return false
end
local function insideStraight_1(a1, a2, a3, a4)
    --[[
      name: insideStraight
      line: 664
    ]]
    local v59 = false
    if a1.straightMinX[a2 + 1] <= a3 then
        v59 = false
        if a3 <= a1.straightMaxX[a2 + 1] then
            v59 = false
            if a1.straightMinY[a2 + 1] <= a4 then
                v59 = a4 <= a1.straightMaxY[a2 + 1]
            end
        end
    end
    return v59
end
local function insideElbow_1(a1, a2, a3, a4)
    --[[
      name: insideElbow
      line: 667
    ]]
    local v60 = false
    if a1.elbowMinX[a2 + 1] <= a3 then
        v60 = false
        if a3 <= a1.elbowMaxX[a2 + 1] then
            v60 = false
            if a1.elbowMinY[a2 + 1] <= a4 then
                v60 = a4 <= a1.elbowMaxY[a2 + 1]
            end
        end
    end
    return v60
end
local function isOnRoad_upv_1(a1, a2)
    --[[
      name: isOnRoad
      line: 678
    ]]
    local currentCorner_1 = a1.currentCorner
    local v61 = currentCorner_1 % a2.capacity
    local v62 = a1.x
    local v63 = a1.y
    local v64 = false
    if a2.straightMinX[v61 + 1] <= v62 then
        v64 = false
        if v62 <= a2.straightMaxX[v61 + 1] then
            v64 = false
            if a2.straightMinY[v61 + 1] <= v63 then
                v64 = v63 <= a2.straightMaxY[v61 + 1]
            end
        end
    end
    if v64 then
        return true
    else
        v62 = a1.x
        local y_1 = a1.y
        v64 = false
        if a2.elbowMinX[v61 + 1] <= v62 then
            v64 = false
            if v62 <= a2.elbowMaxX[v61 + 1] then
                v64 = false
                if a2.elbowMinY[v61 + 1] <= y_1 then
                    v64 = y_1 <= a2.elbowMaxY[v61 + 1]
                end
            end
        end
        if v64 then
            return true
        else
            if currentCorner_1 > 0 then
                v62 = (currentCorner_1 - 1) % a2.capacity
                v63 = a1.x
                local y_2 = a1.y
                v64 = false
                if a2.elbowMinX[v62 + 1] <= v63 then
                    v64 = false
                    if v63 <= a2.elbowMaxX[v62 + 1] then
                        v64 = false
                        if a2.elbowMinY[v62 + 1] <= y_2 then
                            v64 = y_2 <= a2.elbowMaxY[v62 + 1]
                        end
                    end
                end
                if v64 then
                    return true
                end
            end
            v62 = (currentCorner_1 + 1) % a2.capacity
            v63 = a1.x
            local y_3 = a1.y
            v64 = false
            if a2.straightMinX[v62 + 1] <= v63 then
                v64 = false
                if v63 <= a2.straightMaxX[v62 + 1] then
                    v64 = false
                    if a2.straightMinY[v62 + 1] <= y_3 then
                        v64 = y_3 <= a2.straightMaxY[v62 + 1]
                    end
                end
            end
            return v64
        end
    end
end
local tbl_2 = {}
tbl_2.directionX = function(a1)
    --[[
      name: directionX
      line: 98
    ]]
    if a1 ~= 1 then
        if a1 ~= 3 then
            return 0
        end
        return -1
    end
    return 1
end
tbl_2.directionY = function(a1)
    --[[
      name: directionY
      line: 107
    ]]
    if a1 ~= 0 then
        if a1 ~= 2 then
            return 0
        end
        return -1
    end
    return 1
end
tbl_2.directionAngle = function(a1)
    --[[
      name: directionAngle
      line: 116
    ]]
    if a1 ~= 0 then
        if a1 ~= 1 then
            if a1 ~= 2 then
                return math.pi
            end
            return -1.5707963267948966
        end
        return 0
    end
    return 1.5707963267948966
end
tbl_2.normalizeAngle = function(a1)
    --[[
      name: normalizeAngle
      line: 132
    ]]
    local v65 = a1 % math.tau
    if v65 > math.pi then
        v65 = v65 - math.tau
    end
    if v65 <= -math.pi then
        v65 = v65 + math.tau
    end
    return v65
end
tbl_2.ringSlot = function(a1, a2)
    --[[
      name: ringSlot
      line: 146
    ]]
    return a2 % a1.capacity
end
tbl_2.createCar = createCar_1
tbl_2.createTrack = function(a1)
    --[[
      name: createTrack
      line: 213
      upvalues:
        zeroedArray_upv_1 (copy, index: 1)
    ]]
    local tbl_3 = {}
    tbl_3.capacity = a1
    tbl_3.apexX = zeroedArray_upv_1(a1)
    tbl_3.apexY = zeroedArray_upv_1(a1)
    tbl_3.entryDirection = zeroedArray_upv_1(a1)
    tbl_3.exitDirection = zeroedArray_upv_1(a1)
    tbl_3.rotationSign = zeroedArray_upv_1(a1)
    tbl_3.postX = zeroedArray_upv_1(a1)
    tbl_3.postY = zeroedArray_upv_1(a1)
    tbl_3.straightLength = zeroedArray_upv_1(a1)
    tbl_3.straightMinX = zeroedArray_upv_1(a1)
    tbl_3.straightMaxX = zeroedArray_upv_1(a1)
    tbl_3.straightMinY = zeroedArray_upv_1(a1)
    tbl_3.straightMaxY = zeroedArray_upv_1(a1)
    tbl_3.elbowMinX = zeroedArray_upv_1(a1)
    tbl_3.elbowMaxX = zeroedArray_upv_1(a1)
    tbl_3.elbowMinY = zeroedArray_upv_1(a1)
    tbl_3.elbowMaxY = zeroedArray_upv_1(a1)
    tbl_3.gateValue = zeroedArray_upv_1(a1)
    return tbl_3
end
tbl_2.speedForCorner = function(a1, a2)
    --[[
      name: speedForCorner
      line: 249
    ]]
    local v66 = math.min(a1 / math.max(a2.speedRampCorners, 1), 1)
    return a2.baseSpeedStudsPerSecond + ((a2.maxSpeedStudsPerSecond - a2.baseSpeedStudsPerSecond) * (1 - ((1 - v66) * (1 - v66))))
end
tbl_2.minTetherRadius = function(a1)
    --[[
      name: minTetherRadius
      line: 261
    ]]
    return a1.postInsetStuds + a1.minExitOffsetStuds
end
tbl_2.maxStraightForSpeed = function(a1, a2)
    --[[
      name: maxStraightForSpeed
      line: 276
    ]]
    return (a2.roadWidthStuds * (a2.postInsetStuds + a2.minExitOffsetStuds)) / math.max(a1 * a2.releaseWindowFloorSeconds, 1e-04)
end
tbl_2.analyticReleaseWindowSeconds = function(a1, a2, a3, a4)
    --[[
      name: analyticReleaseWindowSeconds
      line: 281
    ]]
    return (a4.roadWidthStuds * a1) / math.max(a2 * a3, 1e-04)
end
tbl_2.generateThrough = function(a1, a2, a3)
    --[[
      name: generateThrough
      line: 424
      upvalues:
        generateCorner_upv_1 (copy, index: 1)
    ]]
    while a1.generatedThrough < a3 do
        generateCorner_upv_1(a1, a1.generatedThrough + 1, a2)
    end
end
tbl_2.resetRun = function(a1, a2, a3, a4)
    --[[
      name: resetRun
      line: 459
      upvalues:
        writeCorner_upv_1 (copy, index: 1)
        generateCorner_upv_1 (copy, index: 2)
        placeInLane_upv_1 (copy, index: 3)
    ]]
    local v67 = math.floor(math.abs(a4)) % 4294967291
    local v68
    if v67 ~= 0 then
        v68 = v67
    else
        v68 = 2654435769
    end
    a2.rngState = v68
    a2.generatedThrough = -1
    writeCorner_upv_1(a2, 0, 0, 0, 0, 1, a3.startRunStuds, a3)
    local lookaheadCorners_1 = a3.lookaheadCorners
    while a2.generatedThrough < lookaheadCorners_1 do
        generateCorner_upv_1(a2, a2.generatedThrough + 1, a3)
    end
    a1.alive = true
    a1.score = 0
    a1.elapsed = 0
    a1.currentCorner = 0
    a1.tethered = false
    a1.pressHeld = false
    a1.perfectDrifts = 0
    a1.perfectStreak = 0
    a1.bestPerfectStreak = 0
    a1.feverEntries = 0
    a1.feverActive = false
    a1.lastLatchSnapRadians = 0
    a1.lastReleaseErrorRadians = 0
    a1.lastReleaseWasPerfect = false
    a1.latchCount = 0
    a1.releaseCount = 0
    local v69 = math.min(0 / math.max(a3.speedRampCorners, 1), 1)
    a1.speed = a3.baseSpeedStudsPerSecond + ((a3.maxSpeedStudsPerSecond - a3.baseSpeedStudsPerSecond) * (1 - ((1 - v69) * (1 - v69))))
    placeInLane_upv_1(a1, a2, a3, a3.startRunStuds - 1.5)
end
tbl_2.reviveOnRoad = function(a1, a2, a3)
    --[[
      name: reviveOnRoad
      line: 490
      upvalues:
        placeInLane_upv_1 (copy, index: 1)
    ]]
    a1.alive = true
    a1.pressHeld = false
    a1.perfectStreak = 0
    a1.feverActive = false
    local v70 = math.min(a1.score / math.max(a3.speedRampCorners, 1), 1)
    a1.speed = a3.baseSpeedStudsPerSecond + ((a3.maxSpeedStudsPerSecond - a3.baseSpeedStudsPerSecond) * (1 - ((1 - v70) * (1 - v70))))
    placeInLane_upv_1(a1, a2, a3, a3.reviveBackoffStuds)
end
tbl_2.exitPhi = function(a1, a2)
    --[[
      name: exitPhi
      line: 500
    ]]
    local v71 = a2 % a1.capacity
    local v72 = a1.exitDirection[v71 + 1]
    return (((v72 == 0) and 1.5707963267948966) or (((v72 == 1) and 0) or (((v72 ~= 2) and math.pi) or -1.5707963267948966))) - (a1.rotationSign[v71 + 1] * 1.5707963267948966)
end
tbl_2.remainingSweep = function(a1, a2)
    --[[
      name: remainingSweep
      line: 511
    ]]
    if a1.tethered then
        local rotationSign_2 = a1.rotationSign
        local v73 = a1.tetherCorner % a2.capacity
        local v74 = a2.exitDirection[v73 + 1]
        return rotationSign_2 * (((((v74 == 0) and 1.5707963267948966) or (((v74 == 1) and 0) or (((v74 ~= 2) and math.pi) or -1.5707963267948966))) - (a2.rotationSign[v73 + 1] * 1.5707963267948966)) - a1.phi)
    end
    return 0
end
tbl_2.abeamDistance = abeamDistance_upv_1
tbl_2.beginPress = function(a1, a2, a3)
    --[[
      name: beginPress
      line: 625
      upvalues:
        tryLatch_upv_1 (copy, index: 1)
    ]]
    if a1.alive then
        a1.pressHeld = true
        if a1.tethered then
            return nil
        end
        tryLatch_upv_1(a1, a2, a3)
    else
        return nil
    end
end
tbl_2.endPress = function(a1, a2, a3)
    --[[
      name: endPress
      line: 642
      upvalues:
        releaseTether_upv_1 (copy, index: 1)
    ]]
    a1.pressHeld = false
    if a1.alive and a1.tethered then
        releaseTether_upv_1(a1, a2, a3)
    else
        return nil
    end
end
tbl_2.cancelPress = function(a1)
    --[[
      name: cancelPress
      line: 660
    ]]
    a1.pressHeld = false
end
tbl_2.isOnRoad = isOnRoad_upv_1
tbl_2.stepSling = function(a1, a2, a3, a4)
    --[[
      name: stepSling
      line: 711
      upvalues:
        generateCorner_upv_1 (copy, index: 1)
        tryLatch_upv_1 (copy, index: 2)
        isOnRoad_upv_1 (copy, index: 3)
    ]]
    if a1.alive then
        a1.elapsed = a1.elapsed + a4
        local v75 = math.min(a1.score / math.max(a3.speedRampCorners, 1), 1)
        a1.speed = a3.baseSpeedStudsPerSecond + ((a3.maxSpeedStudsPerSecond - a3.baseSpeedStudsPerSecond) * (1 - ((1 - v75) * (1 - v75))))
        while a2.generatedThrough < a1.currentCorner + a3.lookaheadCorners do
            generateCorner_upv_1(a2, a2.generatedThrough + 1, a3)
        end
        if a1.pressHeld and not (a1.tethered) then
            tryLatch_upv_1(a1, a2, a3)
        end
        if a1.tethered then
            a1.phi = a1.phi + (((a1.rotationSign * a1.speed) * a4) / a1.radius)
            a1.x = a1.pivotX + (a1.radius * math.cos(a1.phi))
            a1.y = a1.pivotY + (a1.radius * math.sin(a1.phi))
            local v76 = a1.phi
            local rotationSign_3 = a1.rotationSign
            a1.heading = math.atan2(rotationSign_3 * math.cos(v76), -rotationSign_3 * math.sin(v76))
        else
            a1.x = a1.x + ((math.cos(a1.heading) * a1.speed) * a4)
            a1.y = a1.y + ((math.sin(a1.heading) * a1.speed) * a4)
            if a3.headingEaseTauSeconds > 0 then
                local v77 = a1.currentCorner % a2.capacity
                local v76
                if a1.onExitLane then
                    v76 = a2.exitDirection[v77 + 1]
                else
                    v76 = a2.entryDirection[v77 + 1]
                end
                local v78
                if v76 ~= 0 then
                    v78 = ((v76 == 1) and 0) or (((v76 ~= 2) and math.pi) or -1.5707963267948966)
                else
                    v78 = 1.5707963267948966
                end
                v78 = (v78 - a1.heading) % math.tau
                if v78 > math.pi then
                    v78 = v78 - math.tau
                end
                if v78 <= -math.pi then
                    v78 = v78 + math.tau
                end
                a1.heading = a1.heading + (v78 * (1 - math.exp(-a4 / a3.headingEaseTauSeconds)))
            end
        end
        if isOnRoad_upv_1(a1, a2) then
            if a1.tethered then
                return nil
            else
                local v79 = a1.currentCorner % a2.capacity
                local v80 = a2.exitDirection[v79 + 1]
                local v81 = ((v80 == 1) and 1) or (((v80 ~= 3) and 0) or -1)
                if a2.gateValue[v79 + 1] <= a1.x * v81 + (a1.y * (((v80 == 0) and 1) or (((v80 ~= 2) and 0) or -1))) then
                    a1.score = a1.score + 1
                    a1.currentCorner = a1.currentCorner + 1
                    a1.onExitLane = false
                    while a2.generatedThrough < a1.currentCorner + a3.lookaheadCorners do
                        generateCorner_upv_1(a2, a2.generatedThrough + 1, a3)
                    end
                end
            end
        else
            a1.alive = false
            a1.tethered = false
            return nil
        end
    else
        return nil
    end
end
return tbl_2