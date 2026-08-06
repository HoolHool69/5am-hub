-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function mix32_upv_1(a1)
    --[[
      name: mix32
      line: 82
    ]]
    local v1 = math.floor(a1) % 4294967296
    v1 = (v1 + bit32.bnot(bit32.lshift(v1, 15))) % 4294967296
    local v2 = bit32.bxor(v1, bit32.rshift(v1, 10))
    v2 = (v2 + bit32.lshift(v2, 3)) % 4294967296
    v2 = bit32.bxor(v2, bit32.rshift(v2, 6))
    v2 = (v2 + bit32.bnot(bit32.lshift(v2, 11))) % 4294967296
    return (bit32.bxor(v2, bit32.rshift(v2, 16)))
end
local function tileHash_1(a1, a2, a3)
    --[[
      name: tileHash
      line: 92
      upvalues:
        mix32_upv_1 (copy, index: 1)
    ]]
    local v3 = mix32_upv_1((a2 * 2654435761) % 4294967296)
    return (mix32_upv_1(bit32.bxor(mix32_upv_1(a1 + (a3 * 8191)), v3)))
end
local function rampFraction_upv_1(a1, a2)
    --[[
      name: rampFraction
      line: 124
    ]]
    return (math.clamp(a1 / a2.rampEndScore, 0, 1))
end
local function forwardSpeedForScore_1(a1, a2)
    --[[
      name: forwardSpeedForScore
      line: 128
    ]]
    local startForwardSpeed_1 = a2.startForwardSpeed
    return startForwardSpeed_1 + ((a2.maxForwardSpeed - startForwardSpeed_1) * math.clamp(a1 / a2.rampEndScore, 0, 1))
end
local function lerp_upv_1(a1, a2, a3)
    --[[
      name: lerp
      line: 120
    ]]
    return a1 + ((a2 - a1) * a3)
end
local function stepLateral_1(a1, a2, a3)
    --[[
      name: stepLateral
      line: 342
    ]]
    local v4 = a2.maxLateralSpeed * a3
    a1.x = a1.x + math.clamp(a1.targetX - a1.x, -v4, v4)
end
local function seedFirstTile_1(a1, a2)
    --[[
      name: seedFirstTile
      line: 406
    ]]
    a1.index = 0
    a1.x = 0
    local ballRadiusStuds_1 = a2.ballRadiusStuds
    local v5 = a2.startHalfWidthBallRadii * ballRadiusStuds_1
    a1.halfWidth = v5 + (((a2.endHalfWidthBallRadii * ballRadiusStuds_1) - v5) * math.clamp(0 / a2.rampEndScore, 0, 1))
    a1.isMoving = false
    a1.moveAmplitude = 0
    a1.movePeriodTicks = 1
    a1.movePhaseTicks = 0
    a1.hasGem = false
    a1.gemOffset = 0
end
local function reflectIntoBand_upv_1(a1, a2)
    --[[
      name: reflectIntoBand
      line: 386
    ]]
    local v6 = a1
    for _ = 0, 2 do
        if a2 < v6 then
            v6 = 2 * a2 - v6
            continue
        end
        if v6 >= -a2 then
            break
        else
            v6 = -2 * a2 - v6
        end
    end
    return (math.clamp(v6, -a2, a2))
end
local tbl_1 = {}
tbl_1.tileRandom = function(a1, a2, a3)
    --[[
      name: tileRandom
      line: 97
      upvalues:
        mix32_upv_1 (copy, index: 1)
    ]]
    local v7 = mix32_upv_1((a2 * 2654435761) % 4294967296)
    return mix32_upv_1(bit32.bxor(mix32_upv_1(a1 + (a3 * 8191)), v7)) / 4294967296
end
tbl_1.hopTicksForScore = function(a1, a2)
    --[[
      name: hopTicksForScore
      line: 141
    ]]
    local startForwardSpeed_2 = a2.startForwardSpeed
    return (math.max(a2.minHopTicks, math.round(a2.tileSpacingStuds / ((startForwardSpeed_2 + ((a2.maxForwardSpeed - startForwardSpeed_2) * math.clamp(a1 / a2.rampEndScore, 0, 1))) * a2.stepSeconds))))
end
tbl_1.forwardSpeedForTicks = function(a1, a2)
    --[[
      name: forwardSpeedForTicks
      line: 146
    ]]
    return a2.tileSpacingStuds / (a1 * a2.stepSeconds)
end
tbl_1.halfWidthForScore = function(a1, a2)
    --[[
      name: halfWidthForScore
      line: 150
    ]]
    local ballRadiusStuds_2 = a2.ballRadiusStuds
    local v8 = a2.startHalfWidthBallRadii * ballRadiusStuds_2
    return v8 + (((a2.endHalfWidthBallRadii * ballRadiusStuds_2) - v8) * math.clamp(a1 / a2.rampEndScore, 0, 1))
end
tbl_1.gemOffsetForScore = function(a1, a2)
    --[[
      name: gemOffsetForScore
      line: 172
    ]]
    local ballRadiusStuds_3 = a2.ballRadiusStuds
    local v9 = a2.startHalfWidthBallRadii * ballRadiusStuds_3
    return (v9 + (((a2.endHalfWidthBallRadii * ballRadiusStuds_3) - v9) * math.clamp(a1 / a2.rampEndScore, 0, 1))) - (a2.gemOffsetInsetBallRadii * a2.ballRadiusStuds)
end
tbl_1.reachStudsForScore = function(a1, a2)
    --[[
      name: reachStudsForScore
      line: 176
    ]]
    local startForwardSpeed_3 = a2.startForwardSpeed
    return a2.maxLateralSpeed * math.max(a2.minHopTicks, math.round(a2.tileSpacingStuds / ((startForwardSpeed_3 + ((a2.maxForwardSpeed - startForwardSpeed_3) * math.clamp(a1 / a2.rampEndScore, 0, 1))) * a2.stepSeconds))) * a2.stepSeconds
end
tbl_1.reachMarginForScore = function(a1, a2)
    --[[
      name: reachMarginForScore
      line: 180
    ]]
    local startReachMargin_1 = a2.startReachMargin
    return startReachMargin_1 + ((a2.endReachMargin - startReachMargin_1) * math.clamp(a1 / a2.rampEndScore, 0, 1))
end
tbl_1.moveAmplitudeForScore = function(a1, a2)
    --[[
      name: moveAmplitudeForScore
      line: 187
    ]]
    local ballRadiusStuds_4 = a2.ballRadiusStuds
    local v10 = a2.startHalfWidthBallRadii * ballRadiusStuds_4
    return (math.clamp(((v10 + (((a2.endHalfWidthBallRadii * ballRadiusStuds_4) - v10) * math.clamp(a1 / a2.rampEndScore, 0, 1))) * 2) * a2.moveAmplitudeTileWidths, a2.minMoveAmplitudeStuds, a2.maxMoveAmplitudeStuds))
end
tbl_1.movingTileChanceForScore = function(a1, a2)
    --[[
      name: movingTileChanceForScore
      line: 192
    ]]
    if a1 >= a2.movingTileMinScore then
        local v11 = math.clamp((a1 - a2.movingTileMinScore) / math.max(a2.rampEndScore - a2.movingTileMinScore, 1), 0, 1)
        local startMovingTileChance_1 = a2.startMovingTileChance
        return startMovingTileChance_1 + ((a2.endMovingTileChance - startMovingTileChance_1) * v11)
    end
    return 0
end
tbl_1.lateralOffsetBudget = function(a1, a2, a3)
    --[[
      name: lateralOffsetBudget
      line: 229
    ]]
    local startForwardSpeed_4 = a3.startForwardSpeed
    local v12 = a3.maxLateralSpeed * math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / ((startForwardSpeed_4 + ((a3.maxForwardSpeed - startForwardSpeed_4) * math.clamp(a1 / a3.rampEndScore, 0, 1))) * a3.stepSeconds)))
    local startReachMargin_2 = a3.startReachMargin
    local v13 = v12 * a3.stepSeconds * (startReachMargin_2 + ((a3.endReachMargin - startReachMargin_2) * math.clamp(a1 / a3.rampEndScore, 0, 1)))
    local v14
    if a2 then
        local _ = a3.ballRadiusStuds
        local v16 = a3.startHalfWidthBallRadii * a3.ballRadiusStuds
        v14 = math.clamp((a3.startHalfWidthBallRadii * a3.ballRadiusStuds + (a3.endHalfWidthBallRadii * a3.ballRadiusStuds - a3.startHalfWidthBallRadii * a3.ballRadiusStuds) * math.clamp(a1 / a3.rampEndScore, 0, 1)) * 2 * a3.moveAmplitudeTileWidths, a3.minMoveAmplitudeStuds, a3.maxMoveAmplitudeStuds)
    else
        v14 = 0
    end
    local ballRadiusStuds_5 = a3.ballRadiusStuds
    local v15 = a3.startHalfWidthBallRadii * ballRadiusStuds_5
    return (v13 - (v15 + (((a3.endHalfWidthBallRadii * ballRadiusStuds_5) - v15) * math.clamp(a1 / a3.rampEndScore, 0, 1)))) - v14
end
tbl_1.maxLateralOffsetForScore = function(a1, a2, a3)
    --[[
      name: maxLateralOffsetForScore
      line: 242
    ]]
    local startForwardSpeed_5 = a3.startForwardSpeed
    local v16 = a3.maxLateralSpeed * math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / ((startForwardSpeed_5 + ((a3.maxForwardSpeed - startForwardSpeed_5) * math.clamp(a1 / a3.rampEndScore, 0, 1))) * a3.stepSeconds)))
    local startReachMargin_3 = a3.startReachMargin
    local v17 = v16 * a3.stepSeconds * (startReachMargin_3 + ((a3.endReachMargin - startReachMargin_3) * math.clamp(a1 / a3.rampEndScore, 0, 1)))
    local v18
    if a2 then
        local _ = a3.ballRadiusStuds
        local v20 = a3.startHalfWidthBallRadii * a3.ballRadiusStuds
        v18 = math.clamp((a3.startHalfWidthBallRadii * a3.ballRadiusStuds + (a3.endHalfWidthBallRadii * a3.ballRadiusStuds - a3.startHalfWidthBallRadii * a3.ballRadiusStuds) * math.clamp(a1 / a3.rampEndScore, 0, 1)) * 2 * a3.moveAmplitudeTileWidths, a3.minMoveAmplitudeStuds, a3.maxMoveAmplitudeStuds)
    else
        v18 = 0
    end
    local ballRadiusStuds_6 = a3.ballRadiusStuds
    local v19 = a3.startHalfWidthBallRadii * ballRadiusStuds_6
    return (math.max((v17 - (v19 + (((a3.endHalfWidthBallRadii * ballRadiusStuds_6) - v19) * math.clamp(a1 / a3.rampEndScore, 0, 1)))) - v18, a3.minLateralOffsetStuds))
end
tbl_1.reactionFramesForScore = function(a1, a2, a3)
    --[[
      name: reactionFramesForScore
      line: 260
      upvalues:
        lerp_upv_1 (copy, index: 1)
        rampFraction_upv_1 (copy, index: 2)
    ]]
    local v20
    if a2 then
        local _ = a3.ballRadiusStuds
        local v26 = a3.startHalfWidthBallRadii * a3.ballRadiusStuds
        v20 = math.clamp((a3.startHalfWidthBallRadii * a3.ballRadiusStuds + (a3.endHalfWidthBallRadii * a3.ballRadiusStuds - a3.startHalfWidthBallRadii * a3.ballRadiusStuds) * math.clamp(a1 / a3.rampEndScore, 0, 1)) * 2 * a3.moveAmplitudeTileWidths, a3.minMoveAmplitudeStuds, a3.maxMoveAmplitudeStuds)
    else
        v20 = 0
    end
    local v21 = a3.maxLateralSpeed * math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / (lerp_upv_1(a3.startForwardSpeed, a3.maxForwardSpeed, rampFraction_upv_1(a1, a3)) * a3.stepSeconds)))
    local startReachMargin_4 = a3.startReachMargin
    local v22 = v21 * a3.stepSeconds * (startReachMargin_4 + ((a3.endReachMargin - startReachMargin_4) * math.clamp(a1 / a3.rampEndScore, 0, 1)))
    local v23
    if a2 then
        local _ = a3.ballRadiusStuds
        local v27 = a3.startHalfWidthBallRadii * a3.ballRadiusStuds
        v23 = math.clamp((a3.startHalfWidthBallRadii * a3.ballRadiusStuds + (a3.endHalfWidthBallRadii * a3.ballRadiusStuds - a3.startHalfWidthBallRadii * a3.ballRadiusStuds) * math.clamp(a1 / a3.rampEndScore, 0, 1)) * 2 * a3.moveAmplitudeTileWidths, a3.minMoveAmplitudeStuds, a3.maxMoveAmplitudeStuds)
    else
        v23 = 0
    end
    local ballRadiusStuds_7 = a3.ballRadiusStuds
    local v24 = a3.startHalfWidthBallRadii * ballRadiusStuds_7
    local v25 = math.max((v22 - (v24 + (((a3.endHalfWidthBallRadii * ballRadiusStuds_7) - v24) * math.clamp(a1 / a3.rampEndScore, 0, 1)))) - v23, a3.minLateralOffsetStuds) + v20
    local startForwardSpeed_6 = a3.startForwardSpeed
    return math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / ((startForwardSpeed_6 + ((a3.maxForwardSpeed - startForwardSpeed_6) * math.clamp(a1 / a3.rampEndScore, 0, 1))) * a3.stepSeconds))) - (v25 / (a3.maxLateralSpeed * a3.stepSeconds))
end
tbl_1.solveArc = function(a1, a2, a3)
    --[[
      name: solveArc
      line: 274
    ]]
    local startForwardSpeed_7 = a3.startForwardSpeed
    local v26 = math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / ((startForwardSpeed_7 + ((a3.maxForwardSpeed - startForwardSpeed_7) * math.clamp(a2 / a3.rampEndScore, 0, 1))) * a3.stepSeconds)))
    local v27 = math.floor(v26 / 2)
    local stepSeconds_1 = a3.stepSeconds
    a1.tickCount = v26
    a1.gravity = (2 * a3.apexStuds) / (((stepSeconds_1 * stepSeconds_1) * v27) * (v26 - v27))
    a1.launchVelocity = ((a1.gravity * stepSeconds_1) * (v26 + 1)) / 2
    a1.forwardSpeed = a3.tileSpacingStuds / (v26 * a3.stepSeconds)
end
tbl_1.arcHeightAtTick = function(a1, a2, a3)
    --[[
      name: arcHeightAtTick
      line: 285
    ]]
    local stepSeconds_2 = a3.stepSeconds
    return ((((a1.gravity * stepSeconds_2) * stepSeconds_2) / 2) * a2) * (a1.tickCount - a2)
end
tbl_1.beginHop = function(a1, a2)
    --[[
      name: beginHop
      line: 290
    ]]
    a1.y = 0
    a1.verticalVelocity = a2.launchVelocity
    a1.tickInHop = 0
end
tbl_1.hopProgress = function(a1, a2)
    --[[
      name: hopProgress
      line: 296
    ]]
    return a1.tickInHop / a2.tickCount
end
tbl_1.clampToBand = function(a1, a2)
    --[[
      name: clampToBand
      line: 307
    ]]
    return (math.clamp(a1, -a2.bandHalfWidthStuds, a2.bandHalfWidthStuds))
end
tbl_1.tileCentreBand = function(a1)
    --[[
      name: tileCentreBand
      line: 327
    ]]
    return (math.max(a1.bandHalfWidthStuds - a1.maxMoveAmplitudeStuds, 0))
end
tbl_1.stepHop = function(a1, a2, a3, a4, a5)
    --[[
      name: stepHop
      line: 355
    ]]
    local v28 = a4.maxLateralSpeed * a5
    a1.x = a1.x + math.clamp(a1.targetX - a1.x, -v28, v28)
    a1.verticalVelocity = a1.verticalVelocity - (a2.gravity * a5)
    a1.y = a1.y + (a1.verticalVelocity * a5)
    a1.tickInHop = a1.tickInHop + 1
    a3.globalTick = a3.globalTick + 1
    return a2.tickCount <= a1.tickInHop
end
tbl_1.stepFall = function(a1, a2, a3, a4)
    --[[
      name: stepFall
      line: 371
    ]]
    a1.verticalVelocity = a1.verticalVelocity - (a2.gravity * a4)
    a1.y = a1.y + (a1.verticalVelocity * a4)
    a1.tickInHop = a1.tickInHop + 1
    a3.globalTick = a3.globalTick + 1
end
tbl_1.seedFirstTile = seedFirstTile_1
tbl_1.spawnTile = function(a1, a2, a3)
    --[[
      name: spawnTile
      line: 431
      upvalues:
        mix32_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
        rampFraction_upv_1 (copy, index: 3)
        reflectIntoBand_upv_1 (copy, index: 4)
    ]]
    local tileIndex_1 = a2.tileIndex
    local seed_1 = a2.seed
    a1.index = tileIndex_1
    local v29 = a3.ballRadiusStuds
    local v30 = a3.startHalfWidthBallRadii * v29
    a1.halfWidth = v30 + (((a3.endHalfWidthBallRadii * v29) - v30) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1))
    local v31 = mix32_upv_1((tileIndex_1 * 2654435761) % 4294967296)
    a1.hasGem = mix32_upv_1(bit32.bxor(mix32_upv_1(seed_1 + 40955), v31)) / 4294967296 < a3.gemChance
    local v33 = mix32_upv_1((tileIndex_1 * 2654435761) % 4294967296)
    local v34 = ((mix32_upv_1(bit32.bxor(mix32_upv_1(seed_1 + 49146), v33)) / 4294967296 >= 0.5) and 1) or -1
    if a1.hasGem then
        local _ = a3.ballRadiusStuds
        local v47 = a3.startHalfWidthBallRadii * a3.ballRadiusStuds
        v29 = (a3.startHalfWidthBallRadii * a3.ballRadiusStuds + (a3.endHalfWidthBallRadii * a3.ballRadiusStuds - a3.startHalfWidthBallRadii * a3.ballRadiusStuds) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1) - a3.gemOffsetInsetBallRadii * a3.ballRadiusStuds) * v34
    else
        v29 = 0
    end
    a1.gemOffset = v29
    if tileIndex_1 >= a3.movingTileMinScore then
        local v35 = math.clamp((tileIndex_1 - a3.movingTileMinScore) / math.max(a3.rampEndScore - a3.movingTileMinScore, 1), 0, 1)
        local startMovingTileChance_2 = a3.startMovingTileChance
        v29 = startMovingTileChance_2 + (a3.endMovingTileChance - startMovingTileChance_2) * v35
    else
        v29 = 0
    end
    v30 = not a2.isPreviousMoving
    if v30 then
        local v36 = mix32_upv_1(tileIndex_1 * 2654435761 % 4294967296)
        v30 = mix32_upv_1(bit32.bxor(mix32_upv_1(seed_1 + 24573), v36)) / 4294967296 < v29
    end
    a1.isMoving = v30
    if a1.isMoving then
        local ballRadiusStuds_8 = a3.ballRadiusStuds
        local v37 = a3.startHalfWidthBallRadii * ballRadiusStuds_8
        a1.moveAmplitude = math.clamp(((v37 + (((a3.endHalfWidthBallRadii * ballRadiusStuds_8) - v37) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1))) * 2) * a3.moveAmplitudeTileWidths, a3.minMoveAmplitudeStuds, a3.maxMoveAmplitudeStuds)
        local startForwardSpeed_8 = a3.startForwardSpeed
        a1.movePeriodTicks = math.max(2, math.round(a3.movePeriodHops * math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / ((startForwardSpeed_8 + ((a3.maxForwardSpeed - startForwardSpeed_8) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1))) * a3.stepSeconds)))))
        local v38 = mix32_upv_1((tileIndex_1 * 2654435761) % 4294967296)
        a1.movePhaseTicks = math.floor(mix32_upv_1(bit32.bxor(mix32_upv_1(seed_1 + 32764), v38)) / 4294967296 * a1.movePeriodTicks)
    else
        a1.moveAmplitude = 0
        a1.movePeriodTicks = 1
        a1.movePhaseTicks = 0
    end
    v30 = a1.isMoving or (a2.isPreviousMoving)
    local v39 = a3.maxLateralSpeed * math.max(a3.minHopTicks, math.round(a3.tileSpacingStuds / (lerp_upv_1(a3.startForwardSpeed, a3.maxForwardSpeed, rampFraction_upv_1(tileIndex_1, a3)) * a3.stepSeconds)))
    local startReachMargin_5 = a3.startReachMargin
    local v40 = v39 * a3.stepSeconds * (startReachMargin_5 + ((a3.endReachMargin - startReachMargin_5) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1)))
    local v38
    if v30 then
        local _ = a3.ballRadiusStuds
        local v48 = a3.startHalfWidthBallRadii * a3.ballRadiusStuds
        v38 = math.clamp((a3.startHalfWidthBallRadii * a3.ballRadiusStuds + (a3.endHalfWidthBallRadii * a3.ballRadiusStuds - a3.startHalfWidthBallRadii * a3.ballRadiusStuds) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1)) * 2 * a3.moveAmplitudeTileWidths, a3.minMoveAmplitudeStuds, a3.maxMoveAmplitudeStuds)
    else
        v38 = 0
    end
    local ballRadiusStuds_9 = a3.ballRadiusStuds
    local v41 = a3.startHalfWidthBallRadii * ballRadiusStuds_9
    local v42 = math.max((v40 - (v41 + (((a3.endHalfWidthBallRadii * ballRadiusStuds_9) - v41) * math.clamp(tileIndex_1 / a3.rampEndScore, 0, 1)))) - v38, a3.minLateralOffsetStuds)
    local v43 = mix32_upv_1((tileIndex_1 * 2654435761) % 4294967296)
    local v44 = ((mix32_upv_1(bit32.bxor(mix32_upv_1(seed_1 + 8191), v43)) / 4294967296 >= 0.5) and 1) or -1
    local minLateralOffsetStuds_1 = a3.minLateralOffsetStuds
    local v45 = math.max(v42, a3.minLateralOffsetStuds)
    local v46 = mix32_upv_1((tileIndex_1 * 2654435761) % 4294967296)
    a1.x = reflectIntoBand_upv_1(a2.previousX + (v44 * (minLateralOffsetStuds_1 + ((v45 - minLateralOffsetStuds_1) * (mix32_upv_1(bit32.bxor(mix32_upv_1(seed_1 + 16382), v46)) / 4294967296)))), math.max(a3.bandHalfWidthStuds - a3.maxMoveAmplitudeStuds, 0))
end
tbl_1.effectiveTileX = function(a1, a2)
    --[[
      name: effectiveTileX
      line: 487
    ]]
    if a1.isMoving then
        return a1.x + (a1.moveAmplitude * math.sin(math.tau * ((a2 + a1.movePhaseTicks) / a1.movePeriodTicks)))
    end
    return a1.x
end
tbl_1.landingTileX = function(a1, a2, a3, a4)
    --[[
      name: landingTileX
      line: 501
    ]]
    if a1.isMoving then
        return a1.x + (a1.moveAmplitude * math.sin(math.tau * (((a4.globalTick + (a3.tickCount - a2.tickInHop)) + a1.movePhaseTicks) / a1.movePeriodTicks)))
    end
    return a1.x
end
tbl_1.evaluateLanding = function(a1, a2, a3, a4)
    --[[
      name: evaluateLanding
      line: 516
    ]]
    local v47 = ((a2.isMoving) and (a2.x + a2.moveAmplitude * math.sin(math.tau * ((a3.globalTick + a2.movePhaseTicks) / a2.movePeriodTicks)))) or (a2.x)
    local v48
    if math.abs(a1.x - v47) <= a2.halfWidth + (a4.edgeGraceBallRadii * a4.ballRadiusStuds) then
        v48 = true
    else
        v48 = false
    end
    return v48
end
tbl_1.evaluateGemPickup = function(a1, a2, a3, a4)
    --[[
      name: evaluateGemPickup
      line: 536
    ]]
    if a2.hasGem then
        local v49 = ((a2.gemOffset >= 0) and 1) or -1
        local x_1 = a1.x
        local v50 = ((a2.isMoving) and (a2.x + a2.moveAmplitude * math.sin(math.tau * ((a3.globalTick + a2.movePhaseTicks) / a2.movePeriodTicks)))) or (a2.x)
        local v51
        if math.abs(a2.gemOffset) * a4.gemCommitFraction <= (x_1 - v50) * v49 then
            v51 = true
        else
            v51 = false
        end
        return v51
    end
    return false
end
tbl_1.commitLanding = function(a1, a2, a3, a4)
    --[[
      name: commitLanding
      line: 555
    ]]
    a3.tileIndex = a2.index
    a3.score = a3.score + 1
    local v52
    if a2.hasGem then
        local v53 = ((a2.gemOffset >= 0) and 1) or -1
        local x_2 = a1.x
        local v54 = ((a2.isMoving) and (a2.x + a2.moveAmplitude * math.sin(math.tau * ((a3.globalTick + a2.movePhaseTicks) / a2.movePeriodTicks)))) or (a2.x)
        if math.abs(a2.gemOffset) * a4.gemCommitFraction <= (x_2 - v54) * v53 then
            v52 = true
        else
            v52 = false
        end
    else
        v52 = false
    end
    if v52 then
        a3.gems = a3.gems + 1
    end
    return v52
end
tbl_1.rescueOntoTile = function(a1, a2, a3)
    --[[
      name: rescueOntoTile
      line: 579
    ]]
    a1.x = a2.isMoving and a2.x + a2.moveAmplitude * math.sin(math.tau * ((a3.globalTick + a2.movePhaseTicks) / a2.movePeriodTicks)) or a2.x
    a1.targetX = a1.x
    a1.y = 0
    a1.verticalVelocity = 0
    a1.tickInHop = 0
end
return tbl_1