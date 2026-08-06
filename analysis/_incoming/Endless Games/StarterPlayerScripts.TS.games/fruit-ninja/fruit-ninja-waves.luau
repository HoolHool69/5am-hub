-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local FRUIT_NINJA_CONFIG_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "fruit-ninja-config").FRUIT_NINJA_CONFIG
local tbl_upv_1 = {"lone", "crossPair", "burst", "sweep", "mixedRain", "clusterSim"}
local tbl_upv_2 = {}
tbl_upv_2.lone = true
tbl_upv_2.clusterSim = true
local function rollBanana_1(a1)
    --[[
      name: rollBanana
      line: 79
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v1 = nil
    if FRUIT_NINJA_CONFIG_upv_1.bananaChance > a1:NextNumber() then
        v1 = a1:NextInteger(1, 3)
        if v1 ~= 1 then
            if v1 ~= 2 then
                return "double"
            end
            return "freeze"
        end
        return "frenzy"
    end
    return nil
end
local function primeSlot_1(a1, a2)
    --[[
      name: primeSlot
      line: 93
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.gravity = (FRUIT_NINJA_CONFIG_upv_1.gravity * a2.speed) * a2.speed
    a1.delay = 0
    a1.isBomb = false
    a1.banana = nil
    a1.launched = false
end
local function fillLob_1(a1, a2, a3, a4)
    --[[
      name: fillLob
      line: 101
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.x = a4
    a1.vx = (a2:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.launchVxMax, FRUIT_NINJA_CONFIG_upv_1.launchVxMax) - (a4 * FRUIT_NINJA_CONFIG_upv_1.launchInwardPull)) * a3.speed
    a1.vy = a2:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lobVyMin, FRUIT_NINJA_CONFIG_upv_1.lobVyMax) * a3.speed
end
local function fillCrossPair_1(a1, a2, a3)
    --[[
      name: fillCrossPair
      line: 111
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v2 = ((a2.sizeFloor < 3) and 1) or 2
    for n_1 = 0, v2 - 1 do
        local v3 = ((a1:NextInteger(0, 1) ~= 0) and 1) or -1
        local v4 = n_1 * FRUIT_NINJA_CONFIG_upv_1.crossSecondPairDelay
        local v5 = nil
        for n_2 = 0, 1 do
            local v6
            v6 = a3[((n_1 * 2) + n_2) + 1]
            v6.x = ((v3 * (((n_2 ~= 0) and -1) or 1)) * a2.halfWidth) * a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.crossEdgeFractionMin, FRUIT_NINJA_CONFIG_upv_1.crossEdgeFractionMax)
            v6.vx = ((-v6.x * FRUIT_NINJA_CONFIG_upv_1.crossInwardPull) + a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.crossVxJitter, FRUIT_NINJA_CONFIG_upv_1.crossVxJitter)) * a2.speed
            v6.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lobVyMin, FRUIT_NINJA_CONFIG_upv_1.lobVyMax) * a2.speed
            if n_2 ~= 0 then
                v5 = v4 + a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.crossPairStaggerMin, FRUIT_NINJA_CONFIG_upv_1.crossPairStaggerMax)
            else
                v5 = v4
            end
            v6.delay = v5
        end
    end
    return v2 * 2
end
local function fillSweep_1(a1, a2, a3)
    --[[
      name: fillSweep
      line: 157
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local sizeFloor_1 = a2.sizeFloor
    local v7 = math.min(a1:NextInteger(sizeFloor_1 + 1, sizeFloor_1 + 2), FRUIT_NINJA_CONFIG_upv_1.maxWaveSlots)
    local v8 = ((a1:NextInteger(0, 1) ~= 0) and 1) or -1
    local v9 = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.sweepStaggerMin, FRUIT_NINJA_CONFIG_upv_1.sweepStaggerMax)
    local v10 = 0
    local v11 = false
    while true do
        if v11 then
            v10 = v10 + 1
        else
            v11 = true
        end
        if v10 >= v7 then
            break
        end
        local v12 = a3[v10 + 1]
        v12.x = math.clamp(((v8 * (((v7 <= 1) and 0) or ((v10 * 2) / (v7 - 1) + -1))) * (FRUIT_NINJA_CONFIG_upv_1.sweepEdgeFraction * a2.halfWidth)) + a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.sweepXJitter, FRUIT_NINJA_CONFIG_upv_1.sweepXJitter), -a2.halfWidth, a2.halfWidth)
        v12.vx = (a1:NextNumber(-2, 2) - (v12.x * 0.25)) * a2.speed
        v12.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lobVyMin, FRUIT_NINJA_CONFIG_upv_1.launchVyMax) * a2.speed
        v12.delay = v10 * v9
    end
    return v7
end
local function fillClusterSim_1(a1, a2, a3)
    --[[
      name: fillClusterSim
      line: 218
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local sizeFloor_2 = a2.sizeFloor
    local v13 = math.min(a1:NextInteger(sizeFloor_2, sizeFloor_2 + 1), FRUIT_NINJA_CONFIG_upv_1.maxWaveSlots)
    local v14 = 0
    local v15 = false
    v15, v14 = v15, v14
    while true do
        if v15 then
            v14 = v14 + 1
        else
            v15 = true
        end
        if v14 >= v13 then
            break
        end
        local v16 = a3[v14 + 1]
        v16.x = a1:NextNumber(-a2.halfWidth, a2.halfWidth)
        v16.vx = (a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.launchVxMax, FRUIT_NINJA_CONFIG_upv_1.launchVxMax) - (v16.x * FRUIT_NINJA_CONFIG_upv_1.launchInwardPull)) * a2.speed
        v16.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.launchVyMin, FRUIT_NINJA_CONFIG_upv_1.launchVyMax) * a2.speed
    end
    return v13
end
local function fillBurst_1(a1, a2, a3)
    --[[
      name: fillBurst
      line: 128
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local sizeFloor_3 = a2.sizeFloor
    local v17 = math.min(a1:NextInteger(sizeFloor_3 + 1, sizeFloor_3 + (((sizeFloor_3 < 3) and 2) or 3)), FRUIT_NINJA_CONFIG_upv_1.maxWaveSlots)
    local v18 = a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.burstClusterFraction, FRUIT_NINJA_CONFIG_upv_1.burstClusterFraction) * a2.halfWidth
    local v19 = 0
    local v20 = 0
    local v21 = false
    while true do
        if v21 then
            v20 = v20 + 1
        else
            v21 = true
        end
        if v20 >= v17 then
            break
        end
        local v22 = a3[v20 + 1]
        v22.x = math.clamp(v18 + a1:NextNumber(-3, 3), -a2.halfWidth, a2.halfWidth)
        v22.vx = ((FRUIT_NINJA_CONFIG_upv_1.burstFanVx * (((v17 <= 1) and 0) or ((v20 - ((v17 - 1) / 2)) / ((v17 - 1) / 2)))) + a1:NextNumber(-3, 3) - (v22.x * 0.3)) * a2.speed
        v22.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lobVyMin, FRUIT_NINJA_CONFIG_upv_1.lobVyMax) * a2.speed
        v22.delay = v19
        v19 = v19 + a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.burstStaggerMin, FRUIT_NINJA_CONFIG_upv_1.burstStaggerMax)
    end
    return v17
end
local function fillLone_1(a1, a2, a3)
    --[[
      name: fillLone
      line: 106
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v23 = a3[1]
    local v24 = a1:NextNumber(-a2.halfWidth, a2.halfWidth)
    v23.x = v24
    v23.vx = (a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.launchVxMax, FRUIT_NINJA_CONFIG_upv_1.launchVxMax) - (v24 * FRUIT_NINJA_CONFIG_upv_1.launchInwardPull)) * a2.speed
    v23.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lobVyMin, FRUIT_NINJA_CONFIG_upv_1.lobVyMax) * a2.speed
    return 1
end
local function fillMixedRain_1(a1, a2, a3)
    --[[
      name: fillMixedRain
      line: 186
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local sizeFloor_4 = a2.sizeFloor
    local v25 = math.min(a1:NextInteger(sizeFloor_4, sizeFloor_4 + 1), FRUIT_NINJA_CONFIG_upv_1.maxWaveSlots)
    local v26 = 0
    local v27 = 0
    local v28 = false
    if v28 then
        v27 = v27 + 1
    else
        v28 = true
    end
    if v27 < v25 then
        local v29 = a3[v27 + 1]
        local v30 = a1:NextNumber(-a2.halfWidth, a2.halfWidth)
        if v27 % 2 ~= 0 then
            v29.x = v30
            v29.vx = (a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.lowArcVxMax, FRUIT_NINJA_CONFIG_upv_1.lowArcVxMax) - (v30 * 0.5)) * a2.speed
            v29.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lowArcVyMin, FRUIT_NINJA_CONFIG_upv_1.lowArcVyMax) * a2.speed
        else
            v29.x = v30
            v29.vx = (a1:NextNumber(-FRUIT_NINJA_CONFIG_upv_1.launchVxMax, FRUIT_NINJA_CONFIG_upv_1.launchVxMax) - (v30 * FRUIT_NINJA_CONFIG_upv_1.launchInwardPull)) * a2.speed
            v29.vy = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.lobVyMin, FRUIT_NINJA_CONFIG_upv_1.lobVyMax) * a2.speed
        end
        v29.delay = v26
        v26 = v26 + a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.rainStaggerMin, FRUIT_NINJA_CONFIG_upv_1.rainStaggerMax)
        if v28 then
            v27 = v27 + 1
        else
            v28 = true
        end
    end
    return v25
end
local tbl_upv_3 = {fillLone_1, fillCrossPair_1, fillBurst_1, fillSweep_1, fillMixedRain_1, fillClusterSim_1}
local function drawPattern_upv_1(a1, a2, a3)
    --[[
      name: drawPattern
      line: 53
      upvalues:
        tbl_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    local u1 = math.clamp(a2, 1, 4) - 1
    local function v31()
        --[[
          line: 55
          upvalues:
            a1 (copy, index: 1)
            tbl_upv_1 (copy, index: 2)
            FRUIT_NINJA_CONFIG_upv_1 (copy, index: 3)
            u1 (copy, index: 4)
        ]]
        local v32 = a1:NextNumber() * 100
        for n_3 = 0, #tbl_upv_1 - 1 do
            v32 = v32 - FRUIT_NINJA_CONFIG_upv_1.wavePatternWeights[tbl_upv_1[n_3 + 1]][u1 + 1]
            if v32 > 0 then
                continue
            end
            return n_3
        end
        return #tbl_upv_1 - 1
    end
    local v33 = v31()
    local v34 = nil
    for _ = 0, 7 do
        v34 = v33 ~= a3 or tbl_upv_2[tbl_upv_1[v33 + 1]] ~= nil
        if v34 then
            break
        else
            v33 = v31()
        end
    end
    return v33
end
local tbl_4 = {}
tbl_4.makeWaveSlot = function()
    --[[
      name: makeWaveSlot
      line: 34
      upvalues:
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tbl_5 = {}
    tbl_5.gravity = FRUIT_NINJA_CONFIG_upv_1.gravity
    return tbl_5
end
tbl_4.composeWave = function(a1, a2, a3)
    --[[
      name: composeWave
      line: 250
      upvalues:
        drawPattern_upv_1 (copy, index: 1)
        FRUIT_NINJA_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
    ]]
    local v35 = drawPattern_upv_1(a1, a2.sizeFloor, a2.lastPatternIndex)
    for v36, value_1 in a3 do
        value_1.gravity = (FRUIT_NINJA_CONFIG_upv_1.gravity * a2.speed) * a2.speed
        value_1.delay = 0
        value_1.isBomb = false
        value_1.banana = nil
        value_1.launched = false
    end
    local v37 = tbl_upv_3[v35 + 1](a1, a2, a3)
    local v38 = 0
    local v36, v39, v38 = nil, nil, nil
    v36, v39 = false, 0
    local v40 = nil
    if v36 then
        v39 = v39 + 1
    else
        v36 = true
    end
    if v39 < v37 then
        local value_1 = a3[v39 + 1]
        if FRUIT_NINJA_CONFIG_upv_1.bananaChance > a1:NextNumber() then
            local v41 = a1:NextInteger(1, 3)
            v40 = ((v41 == 1) and "frenzy") or (((v41 ~= 2) and "double") or "freeze")
        else
            v40 = nil
        end
        value_1.banana = v40
        v38 = math.max(v38, a3[v39 + 1].delay)
        if v36 then
            v39 = v39 + 1
        else
            v36 = true
        end
        --[[ goto label_6 ]]--
    end
    v39 = math.min(a2.bombCredit + (((a2.allowBombs) and (v37 * a2.bombChance)) or 0), FRUIT_NINJA_CONFIG_upv_1.bombCreditCap)
    if a2.sizeFloor < 3 then
        v36 = FRUIT_NINJA_CONFIG_upv_1.bombMaxPerWaveEarly
    else
        v36 = FRUIT_NINJA_CONFIG_upv_1.bombMaxPerWaveLate
    end
    local value_1 = ((not (a2.allowBombs)) and 0) or (math.min(math.floor(v39), v36, v37 - 1))
    local v42 = a1:NextInteger(1, v37) - 1
    local v43 = a1:NextInteger(1, v37) - 1
    if v43 == v42 then
        v43 = (v43 + 1) % v37
    end
    if value_1 >= 1 then
        a3[v42 + 1].isBomb = true
        a3[v42 + 1].banana = nil
    end
    if value_1 >= 2 then
        a3[v43 + 1].isBomb = true
        a3[v43 + 1].banana = nil
    end
    local v44 = a1:NextNumber(FRUIT_NINJA_CONFIG_upv_1.waveGapJitterMin, FRUIT_NINJA_CONFIG_upv_1.waveGapJitterMax)
    local v45 = ((a2.sizeFloor + 2 > v37) and 0) or (FRUIT_NINJA_CONFIG_upv_1.bigWaveBreatherSeconds)
    local tbl_6 = {}
    tbl_6.patternIndex = v35
    tbl_6.slotCount = v37
    tbl_6.waveSpan = v38
    tbl_6.bombCredit = v39 - value_1
    tbl_6.gapAfter = math.max(((a2.baseGap * v44) * a2.envelope) + v45, v38 + FRUIT_NINJA_CONFIG_upv_1.minGapAfterWaveSeconds)
    return tbl_6
end
return tbl_4