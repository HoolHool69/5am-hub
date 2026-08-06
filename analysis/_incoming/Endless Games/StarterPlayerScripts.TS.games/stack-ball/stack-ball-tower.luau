-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local STACK_BALL_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "stack-ball-config").STACK_BALL_CONFIG
local u1 = math.tau / STACK_BALL_CONFIG_upv_1.segmentsPerRing
local function corridorDriftFor_1(a1, a2)
    --[[
      name: corridorDriftFor
      line: 74
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v1 = deriveRandom_upv_1(a1, 1e+07 + a2)
    v1:NextNumber()
    local v2 = ((v1:NextNumber() >= 0.5) and -1) or 1
    return ((-v2 * (STACK_BALL_CONFIG_upv_1.rotationSpeedStart + ((STACK_BALL_CONFIG_upv_1.rotationSpeedMax - STACK_BALL_CONFIG_upv_1.rotationSpeedStart) * math.clamp((a2 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1)))) * (STACK_BALL_CONFIG_upv_1.ringSpacing / STACK_BALL_CONFIG_upv_1.smashSpeed)) / u1
end
local function insideCorridor_1(a1, a2)
    --[[
      name: insideCorridor
      line: 96
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    local segmentsPerRing_1 = STACK_BALL_CONFIG_upv_1.segmentsPerRing
    local v3 = segmentsPerRing_1 / 2
    local v4 = math.abs(((((((a1 + 0.5) - a2) + v3) % segmentsPerRing_1) + segmentsPerRing_1) % segmentsPerRing_1) - v3) <= 1
    return v4
end
local function paletteRoll_1(a1, a2, a3)
    --[[
      name: paletteRoll
      line: 110
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
    ]]
    return deriveRandom_upv_1(a1, 1e+07 + a2):NextInteger(0, a3 - 1)
end
local function finalPaletteFor_upv_1(a1, a2, a3)
    --[[
      name: finalPaletteFor
      line: 121
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
    ]]
    local v5 = deriveRandom_upv_1(a1, 10000001):NextInteger(0, a3 - 1)
    local v6 = 2
    local v7 = false
    if v7 then
        v6 = v6 + 1
    else
        v7 = true
    end
    local v8 = nil
    if v6 <= a2 then
        v8 = deriveRandom_upv_1(a1, 1e+07 + v6):NextInteger(0, a3 - 1)
        if v8 == v5 then
            v8 = (v8 + 1) % a3
        end
        v5 = v8
        if v7 then
            v6 = v6 + 1
        else
            v7 = true
        end
    end
    return v5
end
local function corridorCentreFor_upv_1(a1, a2, a3)
    --[[
      name: corridorCentreFor
      line: 84
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        STACK_BALL_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v9 = math.floor(a2 / 12)
    local v10 = deriveRandom_upv_1(a1, v9 + 2e+07)
    if v10:NextNumber() < 0.4 then
        local v11 = v10:NextNumber() * STACK_BALL_CONFIG_upv_1.segmentsPerRing
        local v12 = deriveRandom_upv_1(a1, 1e+07 + a3)
        v12:NextNumber()
        local v13 = ((v12:NextNumber() >= 0.5) and -1) or 1
        return (((v11 + ((((-v13 * (STACK_BALL_CONFIG_upv_1.rotationSpeedStart + ((STACK_BALL_CONFIG_upv_1.rotationSpeedMax - STACK_BALL_CONFIG_upv_1.rotationSpeedStart) * math.clamp((a3 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1)))) * (STACK_BALL_CONFIG_upv_1.ringSpacing / STACK_BALL_CONFIG_upv_1.smashSpeed)) / u1) * (a2 - (v9 * 12)))) % STACK_BALL_CONFIG_upv_1.segmentsPerRing) + STACK_BALL_CONFIG_upv_1.segmentsPerRing) % STACK_BALL_CONFIG_upv_1.segmentsPerRing
    end
    return nil
end
local tbl_1 = {}
tbl_1.difficultyFor = function(a1)
    --[[
      name: difficultyFor
      line: 35
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.clamp((a1 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1))
end
tbl_1.coverageDifficultyFor = function(a1)
    --[[
      name: coverageDifficultyFor
      line: 45
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.clamp((a1 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxCoverage - 1), 0, 1))
end
tbl_1.rotationSpeedFor = function(a1)
    --[[
      name: rotationSpeedFor
      line: 49
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    return STACK_BALL_CONFIG_upv_1.rotationSpeedStart + ((STACK_BALL_CONFIG_upv_1.rotationSpeedMax - STACK_BALL_CONFIG_upv_1.rotationSpeedStart) * math.clamp((a1 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1))
end
tbl_1.directionFor = function(a1, a2)
    --[[
      name: directionFor
      line: 61
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
    ]]
    local v14 = deriveRandom_upv_1(a1, 1e+07 + a2)
    v14:NextNumber()
    if v14:NextNumber() >= 0.5 then
        return -1
    end
    return 1
end
tbl_1.ringCountFor = function(a1)
    --[[
      name: ringCountFor
      line: 105
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.round(STACK_BALL_CONFIG_upv_1.ringsPerLevelStart + ((STACK_BALL_CONFIG_upv_1.ringsPerLevelMax - STACK_BALL_CONFIG_upv_1.ringsPerLevelStart) * math.clamp((a1 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1))))
end
tbl_1.levelSpecFor = function(a1, a2, a3)
    --[[
      name: levelSpecFor
      line: 145
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        finalPaletteFor_upv_1 (copy, index: 3)
    ]]
    local tbl_2 = {}
    tbl_2.ringCount = math.round(STACK_BALL_CONFIG_upv_1.ringsPerLevelStart + ((STACK_BALL_CONFIG_upv_1.ringsPerLevelMax - STACK_BALL_CONFIG_upv_1.ringsPerLevelStart) * math.clamp((a2 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1)))
    tbl_2.rotationSpeed = STACK_BALL_CONFIG_upv_1.rotationSpeedStart + ((STACK_BALL_CONFIG_upv_1.rotationSpeedMax - STACK_BALL_CONFIG_upv_1.rotationSpeedStart) * math.clamp((a2 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1))
    local v15 = deriveRandom_upv_1(a1, 1e+07 + a2)
    v15:NextNumber()
    tbl_2.direction = v15:NextNumber() >= 0.5 and -1 or 1
    tbl_2.paletteIndex = finalPaletteFor_upv_1(a1, a2, a3)
    return tbl_2
end
tbl_1.ringAddressFor = function(a1)
    --[[
      name: ringAddressFor
      line: 160
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v17 = 1
    local v18 = a1
    while true do
        local v19
        v19 = math.round(STACK_BALL_CONFIG_upv_1.ringsPerLevelStart + ((STACK_BALL_CONFIG_upv_1.ringsPerLevelMax - STACK_BALL_CONFIG_upv_1.ringsPerLevelStart) * math.clamp((v17 - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxDifficulty - 1), 0, 1))) + 1
        if v18 < v19 then
            break
        end
        v18 = v18 - v19
        v17 = v17 + 1
    end
    local tbl_3 = {}
    tbl_3.level = v17
    tbl_3.indexInLevel = v18
    tbl_3.isFloor = v18 == (v19 - 1)
    return tbl_3
end
tbl_1.ringPatternFor = function(a1, a2, a3)
    --[[
      name: ringPatternFor
      line: 194
      upvalues:
        STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        corridorCentreFor_upv_1 (copy, index: 3)
    ]]
    local tbl_4 = {}
    for _ = 0, STACK_BALL_CONFIG_upv_1.segmentsPerRing - 1 do
        table.insert(tbl_4, "paint")
    end
    if not a3.isFloor and a2 >= STACK_BALL_CONFIG_upv_1.graceRings then
        local v20, v21, v22 = nil, nil, nil
        if a3.indexInLevel ~= 0 then
            local v23 = math.clamp((a3.level - 1) / (STACK_BALL_CONFIG_upv_1.levelForMaxCoverage - 1), 0, 1)
            v20 = deriveRandom_upv_1(a1, 0 + a2)
            v21 = STACK_BALL_CONFIG_upv_1.blackArcsStart + (STACK_BALL_CONFIG_upv_1.blackArcsMax - STACK_BALL_CONFIG_upv_1.blackArcsStart) * v23
            v22 = math.floor(v21)
            if v20:NextNumber() < v21 - v22 then
                v22 = v22 + 1
            end
            local v24 = corridorCentreFor_upv_1(a1, a2, a3.level)
            local v25 = 0
            local v26 = 0
            local v27 = false
            if v27 then
                v26 = v26 + 1
            else
                v27 = true
            end
            if v26 < v22 then
                local v28 = v20:NextNumber() < STACK_BALL_CONFIG_upv_1.wideArcChanceMax * v23
                local v29
                if v28 then
                    v29 = 2
                else
                    v29 = 1
                end
                if v25 + v29 <= 5 then
                    local v30 = false
                    local v31 = 0
                    local v32 = false
                    if v32 then
                        v31 = v31 + 1
                    else
                        v32 = true
                    end
                    if v31 < 20 then
                        local v33, v34, _, v34 = nil, nil, nil, nil
                        if not (v30) then
                            v33 = v20:NextInteger(0, STACK_BALL_CONFIG_upv_1.segmentsPerRing - 1)
                            v34 = true
                            for n_1 = -1, v29 do
                                if tbl_4[(((v33 + n_1) + STACK_BALL_CONFIG_upv_1.segmentsPerRing) % STACK_BALL_CONFIG_upv_1.segmentsPerRing) + 1] == "black" then
                                    v34 = false
                                end
                            end
                            if v34 and v24 ~= nil then
                                for n_2 = 0, v29 - 1 do
                                    local segmentsPerRing_2 = STACK_BALL_CONFIG_upv_1.segmentsPerRing
                                    local v35 = segmentsPerRing_2 / 2
                                    local v36 = math.abs(((((((((v33 + n_2) % STACK_BALL_CONFIG_upv_1.segmentsPerRing) + 0.5) - v24) + v35) % segmentsPerRing_2) + segmentsPerRing_2) % segmentsPerRing_2) - v35) <= 1
                                    if v36 then
                                        v34 = false
                                    end
                                end
                            end
                            if v34 then
                                for n_3 = 0, v29 - 1 do
                                    tbl_4[((v33 + n_3) % STACK_BALL_CONFIG_upv_1.segmentsPerRing) + 1] = "black"
                                end
                                v30, v25 = true, v25 + v29
                            end
                            if v32 then
                                v31 = v31 + 1
                            else
                                v32 = true
                            end
                            continue
                        end
                    end
                    if v27 then
                        v26 = v26 + 1
                    else
                        v27 = true
                    end
                end
            end
        end
    end
    return tbl_4
end
return tbl_1