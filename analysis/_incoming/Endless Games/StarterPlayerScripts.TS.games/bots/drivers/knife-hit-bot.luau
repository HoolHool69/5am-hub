-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "knife-hit", "knife-hit-config")
local KNIFE_HIT_CONFIG_upv_1 = v1.KNIFE_HIT_CONFIG
local KNIFE_ROTATION_BANDS_upv_1 = v1.KNIFE_ROTATION_BANDS
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target")
local minAngleDiff_upv_1 = v2.minAngleDiff
local normalizeAngle_upv_1 = v2.normalizeAngle
local overlapsAny_upv_1 = v2.overlapsAny
local TAU_upv_1 = v2.TAU
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v3.chance
local jitteredDelay_upv_1 = v3.jitteredDelay
local jitterNormal_upv_1 = v3.jitterNormal
local SubStepper_upv_1 = v3.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local u1 = math.floor(360 / (KNIFE_HIT_CONFIG_upv_1.collisionArcDegrees * 2)) - KNIFE_HIT_CONFIG_upv_1.preStuckMax
local tbl_upv_1 = {"constant", "pulse", "reverse", "oscillate"}
local function rollOscillation_1(a1, a2, a3)
    --[[
      name: rollOscillation
      line: 41
      upvalues:
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.oscillateAmplitude = math.rad(a2:NextNumber(KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMinDegrees, KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMaxDegrees))
    local v4 = -a1.direction
    a1.oscillateCenter = a3 - (v4 * a1.oscillateAmplitude)
    a1.patternPhase = ((v4 <= 0) and -1.5707963267948966) or 1.5707963267948966
    a1.oscillateSwings = 0
end
local function pickPattern_upv_1(a1, a2)
    --[[
      name: pickPattern
      line: 87
      upvalues:
        KNIFE_ROTATION_BANDS_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v5 = KNIFE_ROTATION_BANDS_upv_1[1]
    for _, value_1 in KNIFE_ROTATION_BANDS_upv_1 do
        if value_1.fromWave <= a1 then
            v5 = value_1
        end
    end
    local v7 = 0
    for _, value_2 in tbl_upv_1 do
        v7 = v7 + v5.weights[value_2]
    end
    local v8
    v8 = a2:NextNumber(0, v7)
    for _, value_3 in tbl_upv_1 do
        v8 = v8 - v5.weights[value_3]
        if v8 > 0 then
            continue
        end
        return value_3
    end
    return "constant"
end
local function advanceRotation_upv_1(a1, a2, a3, a4, a5)
    --[[
      name: advanceRotation
      line: 49
      upvalues:
        TAU_upv_1 (copy, index: 1)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 2)
        normalizeAngle_upv_1 (copy, index: 3)
    ]]
    if a3 == "pulse" then
        a1.patternPhase = a1.patternPhase + ((TAU_upv_1 / KNIFE_HIT_CONFIG_upv_1.pulsePeriodSeconds) * a5)
        a1.logAngle = normalizeAngle_upv_1(a1.logAngle + (((a1.direction * a4) * (KNIFE_HIT_CONFIG_upv_1.pulseMinMultiplier + ((1 - KNIFE_HIT_CONFIG_upv_1.pulseMinMultiplier) * (0.5 - (math.cos(a1.patternPhase) * 0.5))))) * a5))
        return nil
    elseif a3 ~= "reverse" then
        local v9 = nil
        if a3 ~= "oscillate" then
            a1.logAngle = normalizeAngle_upv_1(a1.logAngle + ((a1.direction * a4) * a5))
        else
            v9 = a1.patternPhase
            a1.patternPhase = a1.patternPhase + ((a4 / a1.oscillateAmplitude) * a5)
            a1.oscillateCenter = normalizeAngle_upv_1(a1.oscillateCenter + (((a1.direction * a4) * KNIFE_HIT_CONFIG_upv_1.oscillateDriftFraction) * a5))
            a1.logAngle = normalizeAngle_upv_1(a1.oscillateCenter + (a1.oscillateAmplitude * math.sin(a1.patternPhase)))
            if math.floor((v9 + 1.5707963267948966) / math.pi) < math.floor((a1.patternPhase + 1.5707963267948966) / math.pi) then
                a1.oscillateSwings = a1.oscillateSwings + 1
                if KNIFE_HIT_CONFIG_upv_1.oscillateSwingsPerRoll <= a1.oscillateSwings then
                    local logAngle_1 = a1.logAngle
                    a1.oscillateAmplitude = math.rad(a2:NextNumber(KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMinDegrees, KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMaxDegrees))
                    local v10 = -a1.direction
                    a1.oscillateCenter = logAngle_1 - (v10 * a1.oscillateAmplitude)
                    a1.patternPhase = ((v10 <= 0) and -1.5707963267948966) or 1.5707963267948966
                    a1.oscillateSwings = 0
                end
            end
            return nil
        end
    else
        a1.reversalTimer = a1.reversalTimer - a5
        if a1.reversalTimer <= 0 then
            a1.direction = a1.direction * -1
            a1.reversalTimer = a2:NextNumber(KNIFE_HIT_CONFIG_upv_1.reversalMinSeconds, KNIFE_HIT_CONFIG_upv_1.reversalMaxSeconds)
        end
        local v11 = KNIFE_HIT_CONFIG_upv_1.reverseRampRate * a5
        a1.directionBlend = a1.directionBlend + math.clamp(a1.direction - a1.directionBlend, -v11, v11)
        a1.logAngle = normalizeAngle_upv_1(a1.logAngle + ((a1.directionBlend * a4) * a5))
        return nil
    end
end
local tbl_2 = {}
tbl_2.createKnifeHitBot = function(a1)
    --[[
      name: createKnifeHitBot
      line: 121
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        KNIFE_HIT_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        pickPattern_upv_1 (copy, index: 5)
        overlapsAny_upv_1 (copy, index: 6)
        TAU_upv_1 (copy, index: 7)
        minAngleDiff_upv_1 (copy, index: 8)
        chance_upv_1 (copy, index: 9)
        normalizeAngle_upv_1 (copy, index: 10)
        advanceRotation_upv_1 (copy, index: 11)
        jitterNormal_upv_1 (copy, index: 12)
        jitteredDelay_upv_1 (copy, index: 13)
        SubStepper_upv_1 (copy, index: 14)
    ]]
    local u2 = BOT_TUNING_upv_1["knife-hit"][a1.difficulty]
    local u3 = 1
    local tbl_upv_3 = {}
    local u4 = {}
    local u5 = 0
    local u6 = 0
    local u7 = "constant"
    local u8 = Random.new(0)
    local waveBreakSeconds_upv_1 = 0
    local tbl_upv_4 = {}
    local u9 = 0
    local u10 = false
    local u11 = 0
    local u12 = nil
    local function u13()
        --[[
          line: 148
          upvalues:
            u8 (ref,  index: 1)
            deriveRandom_upv_1 (copy, index: 2)
            a1 (copy, index: 3)
            u3 (ref,  index: 4)
            waveBreakSeconds_upv_1 (ref,  index: 5)
            tbl_upv_3 (ref,  index: 6)
            u5 (ref,  index: 7)
            KNIFE_HIT_CONFIG_upv_1 (copy, index: 8)
            u1 (copy, index: 9)
            u6 (ref,  index: 10)
            u7 (ref,  index: 11)
            pickPattern_upv_1 (copy, index: 12)
            tbl_upv_4 (copy, index: 13)
            overlapsAny_upv_1 (copy, index: 14)
            u4 (ref,  index: 15)
        ]]
        u8 = deriveRandom_upv_1(a1.seed, u3 + 16)
        waveBreakSeconds_upv_1 = 0
        tbl_upv_3 = {}
        u5 = math.min(math.floor(KNIFE_HIT_CONFIG_upv_1.knivesFirstWave + ((u3 - 1) * KNIFE_HIT_CONFIG_upv_1.knivesPerWaveGrowth)), KNIFE_HIT_CONFIG_upv_1.knivesMax, u1)
        u6 = math.rad(KNIFE_HIT_CONFIG_upv_1.speedMaxDegrees - ((KNIFE_HIT_CONFIG_upv_1.speedMaxDegrees - KNIFE_HIT_CONFIG_upv_1.speedStartDegrees) * math.pow(0.5, (u3 - 1) / KNIFE_HIT_CONFIG_upv_1.speedHalfLifeWaves)))
        u7 = pickPattern_upv_1(u3, u8)
        tbl_upv_4.patternPhase = 0
        local v12 = ((u8:NextNumber() >= 0.5) and 1) or -1
        tbl_upv_4.direction = v12
        tbl_upv_4.directionBlend = tbl_upv_4.direction
        tbl_upv_4.reversalTimer = u8:NextNumber(KNIFE_HIT_CONFIG_upv_1.reversalMinSeconds, KNIFE_HIT_CONFIG_upv_1.reversalMaxSeconds)
        if u7 == "oscillate" then
            tbl_upv_4.oscillateAmplitude = math.rad(u8:NextNumber(KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMinDegrees, KNIFE_HIT_CONFIG_upv_1.oscillateAmplitudeMaxDegrees))
            local v13 = -tbl_upv_4.direction
            tbl_upv_4.oscillateCenter = tbl_upv_4.logAngle - (v13 * tbl_upv_4.oscillateAmplitude)
            tbl_upv_4.patternPhase = ((v13 <= 0) and -1.5707963267948966) or 1.5707963267948966
            tbl_upv_4.oscillateSwings = 0
        end
        local v14 = math.min(math.floor((u3 - 1) / KNIFE_HIT_CONFIG_upv_1.preStuckWavesPerSeed), KNIFE_HIT_CONFIG_upv_1.preStuckMax)
        local _ = 0
        local v15 = false
        if v15 then
            v12 = v12 + 1
        else
            v15 = true
        end
        if v12 < v14 then
            local v16 = u8:NextNumber(0, math.tau)
            local v17 = 0
            while overlapsAny_upv_1(tbl_upv_3, v16, math.rad(KNIFE_HIT_CONFIG_upv_1.collisionArcDegrees * 2)) and v17 < 12 do
                v16, v17 = u8:NextNumber(0, math.tau), v17 + 1
            end
            table.insert(tbl_upv_3, v16)
            if v15 then
                v12 = v12 + 1
            else
                v15 = true
            end
            --[[ goto label_5 ]]--
        end
        u4 = {}
        v12 = u3 % 2 + 1
        local v18 = 0
        u4 = false
        local v19
        v19, v15 = nil, v18
        if v19 then
            v15 = v15 + 1
        else
            v19 = true
        end
        if v15 < v12 then
            local v20 = u8:NextNumber(0, math.tau)
            local v21 = 0
            while overlapsAny_upv_1(tbl_upv_3, v20, math.rad(KNIFE_HIT_CONFIG_upv_1.appleArcDegrees * 2)) and v21 < 12 do
                local v22 = u8:NextNumber(0, math.tau)
                v21 = v21 + 1
                v20 = v22
            end
            table.insert(u4, {angle = v20})
            if v19 then
                v15 = v15 + 1
            else
                v19 = true
            end
            --[[ goto label_9 ]]--
        end
    end
    local function u14()
        --[[
          line: 226
          upvalues:
            u4 (ref,  index: 1)
            TAU_upv_1 (copy, index: 2)
            tbl_upv_3 (ref,  index: 3)
            minAngleDiff_upv_1 (copy, index: 4)
            u2 (copy, index: 5)
            chance_upv_1 (copy, index: 6)
            a1 (copy, index: 7)
            normalizeAngle_upv_1 (copy, index: 8)
        ]]
        local v23 = nil
        local v24 = -1
        local v25 = nil
        local _ = nil
        local v34 = nil
        local v35 = nil
        local v26 = nil
        for v27, value_4 in u4 do
            if value_4.eaten then
                continue
            end
            v25 = value_4.angle
            for v36, value_5 in tbl_upv_3 do
                v35 = math.min(TAU_upv_1, minAngleDiff_upv_1(value_5, v25))
            end
            v26 = TAU_upv_1
            if v24 < v26 then
                v24, v23 = v26, value_4.angle
            end
        end
        if v23 ~= nil and (u2.safetyMarginDeg <= math.deg(v24 * 2) or chance_upv_1(a1.random, u2.appleGreed)) then
            return v23
        elseif #tbl_upv_3 ~= 0 then
            local v28 = table.create(#tbl_upv_3)
            for key_1, value_6 in tbl_upv_3 do
                v28[key_1] = normalizeAngle_upv_1(value_6)
            end
            table.sort(
                v28,
                function(a2, a3)
                    --[[
                      line: 258
                    ]]
                    return a2 < a3
                end
            )
            local v29 = -1
            local v30 = 0
            local v31, v27 = nil, nil
            v31, v27 = v29, v30
            for n_1 = 0, #v28 - 1 do
                local v32 = v28[n_1 + 1]
                local v33
                v33 = (((n_1 + 1 >= #v28) and (v28[1] + TAU_upv_1)) or (v28[n_1 + 2])) - v32
                if v31 < v33 then
                    v31, v27 = v33, normalizeAngle_upv_1(v32 + (v33 / 2))
                end
            end
            return v27
        else
            return nil
        end
    end
    local function u15(a4)
        --[[
          line: 279
          upvalues:
            tbl_upv_4 (copy, index: 1)
            u8 (ref,  index: 2)
            u6 (ref,  index: 3)
            advanceRotation_upv_1 (copy, index: 4)
            u7 (ref,  index: 5)
            normalizeAngle_upv_1 (copy, index: 6)
            minAngleDiff_upv_1 (copy, index: 7)
            TAU_upv_1 (copy, index: 8)
            tbl_upv_3 (ref,  index: 9)
        ]]
        local v34 = table.clone(tbl_upv_4)
        setmetatable(v34, nil)
        local v35 = u8:Clone()
        local v36 = 0
        local v37 = -1
        local v38 = 1
        local v39 = false
        v39, v38, v36, v37 = v39, v38, v36, v37
        if v39 then
            v38 = v38 + 1
        else
            v39 = true
        end
        local v40
        if v38 > 240 then
            return v36
        end
        advanceRotation_upv_1(v34, v35, u7, u6, 0.008333333333333333)
        v40 = normalizeAngle_upv_1(math.pi - v34.logAngle)
        if minAngleDiff_upv_1(v40, a4) > u6 * 0.008333333333333333 then
            local v41 = TAU_upv_1
            for _, value_7 in tbl_upv_3 do
                v41 = math.min(v41, minAngleDiff_upv_1(value_7, v40))
            end
            if v37 >= v41 then
                return
            end
            v36, v37 = v38 * 0.008333333333333333, v41
        else
            return v38 * 0.008333333333333333
        end
    end
    local function u16()
        --[[
          line: 334
          upvalues:
            normalizeAngle_upv_1 (copy, index: 1)
            tbl_upv_4 (copy, index: 2)
            overlapsAny_upv_1 (copy, index: 3)
            tbl_upv_3 (ref,  index: 4)
            KNIFE_HIT_CONFIG_upv_1 (copy, index: 5)
            u9 (ref,  index: 6)
            u5 (ref,  index: 7)
            u4 (ref,  index: 8)
            minAngleDiff_upv_1 (copy, index: 9)
            u10 (ref,  index: 10)
            u11 (ref,  index: 11)
            jitteredDelay_upv_1 (copy, index: 12)
            a1 (copy, index: 13)
            u2 (copy, index: 14)
            u3 (ref,  index: 15)
            waveBreakSeconds_upv_1 (ref,  index: 16)
        ]]
        local v42 = normalizeAngle_upv_1(math.pi - tbl_upv_4.logAngle)
        local v43 = overlapsAny_upv_1(tbl_upv_3, v42, math.rad(KNIFE_HIT_CONFIG_upv_1.collisionArcDegrees))
        if not (v43) then
            table.insert(tbl_upv_3, v42)
            u9 = u9 + 1
            u5 = u5 - 1
        end
        local v44 = nil
        for _, value_8 in u4 do
            if value_8.eaten then
                continue
            end
            v44 = minAngleDiff_upv_1(value_8.angle, v42)
            if math.rad(KNIFE_HIT_CONFIG_upv_1.appleArcDegrees) > v44 then
                value_8.eaten = true
                u9 = u9 + 2
            end
        end
        if v43 then
            u10 = true
            return nil
        end
        u11 = math.max(KNIFE_HIT_CONFIG_upv_1.minThrowIntervalSeconds, jitteredDelay_upv_1(a1.random, u2.throwCadence, 0.25))
        if u5 <= 0 then
            u3 = u3 + 1
            waveBreakSeconds_upv_1 = KNIFE_HIT_CONFIG_upv_1.waveBreakSeconds
        end
    end
    local function u17(a5)
        --[[
          line: 362
          upvalues:
            u10 (ref,  index: 1)
            waveBreakSeconds_upv_1 (ref,  index: 2)
            u13 (copy, index: 3)
            advanceRotation_upv_1 (copy, index: 4)
            tbl_upv_4 (copy, index: 5)
            u8 (ref,  index: 6)
            u7 (ref,  index: 7)
            u6 (ref,  index: 8)
            u12 (ref,  index: 9)
            u16 (copy, index: 10)
            u11 (ref,  index: 11)
            chance_upv_1 (copy, index: 12)
            a1 (copy, index: 13)
            u2 (copy, index: 14)
            u14 (copy, index: 15)
            u15 (copy, index: 16)
            jitterNormal_upv_1 (copy, index: 17)
        ]]
        if u10 then
            return nil
        elseif waveBreakSeconds_upv_1 <= 0 then
            advanceRotation_upv_1(tbl_upv_4, u8, u7, u6, a5)
            if u12 == nil then
                if u11 <= 0 then
                    local v45 = nil
                    if chance_upv_1(a1.random, u2.lapseChance) then
                        u12 = 0
                    else
                        v45 = u14()
                        if v45 ~= nil then
                            u12 = math.max(u15(v45) + jitterNormal_upv_1(a1.random, u2.timingSigmaSeconds), 0)
                        else
                            u12 = 0
                        end
                    end
                else
                    u11 = u11 - a5
                    return nil
                end
            else
                u12 = u12 - a5
                if u12 <= 0 then
                    u12 = nil
                    u16()
                end
                return nil
            end
        else
            waveBreakSeconds_upv_1 = waveBreakSeconds_upv_1 - a5
            if waveBreakSeconds_upv_1 <= 0 then
                u13()
            end
            return nil
        end
    end
    local u18 = SubStepper_upv_1.new(0.008333333333333333)
    u13()
    local tbl_5 = {}
    tbl_5.step = function(a6, a7)
        --[[
          name: step
          line: 392
          upvalues:
            u10 (ref,  index: 1)
            u18 (copy, index: 2)
            u17 (copy, index: 3)
        ]]
        if u10 then
            return nil
        end
        u18:step(a7, u17)
    end
    tbl_5.snapshot = function(a8)
        --[[
          name: snapshot
          line: 398
          upvalues:
            u3 (ref,  index: 1)
            tbl_upv_3 (ref,  index: 2)
            normalizeAngle_upv_1 (copy, index: 3)
            tbl_upv_4 (copy, index: 4)
            u9 (ref,  index: 5)
        ]]
        local tbl_6 = {}
        table.insert(tbl_6, u3)
        for _, value_9 in tbl_upv_3 do
            if #tbl_6 >= 20 then
                break
            else
                table.insert(tbl_6, (math.deg(normalizeAngle_upv_1(value_9 + tbl_upv_4.logAngle))))
            end
        end
        local tbl_7 = {}
        tbl_7.score = u9
        tbl_7.values = tbl_6
        return tbl_7
    end
    tbl_5.isDead = function(a9)
        --[[
          name: isDead
          line: 414
          upvalues:
            u10 (ref, index: 1)
        ]]
        return u10
    end
    tbl_5.score = function(a10)
        --[[
          name: score
          line: 417
          upvalues:
            u9 (ref, index: 1)
        ]]
        return u9
    end
    return tbl_5
end
return tbl_2