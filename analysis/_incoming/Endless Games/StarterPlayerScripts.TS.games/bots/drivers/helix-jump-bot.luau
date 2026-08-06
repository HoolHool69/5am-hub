-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local HELIX_JUMP_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "helix-jump", "helix-jump-config").HELIX_JUMP_CONFIG
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target")
local minAngleDiff_upv_1 = v1.minAngleDiff
local normalizeAngle_upv_1 = v1.normalizeAngle
local signedAngleDiff_upv_1 = v1.signedAngleDiff
local TAU_upv_1 = v1.TAU
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v2.chance
local jitteredDelay_upv_1 = v2.jitteredDelay
local jitterNormal_upv_1 = v2.jitterNormal
local ReactionGate_upv_1 = v2.ReactionGate
local SubStepper_upv_1 = v2.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local segmentsPerPlatform_upv_1 = HELIX_JUMP_CONFIG_upv_1.segmentsPerPlatform
local u1 = TAU_upv_1 / segmentsPerPlatform_upv_1
local u2 = HELIX_JUMP_CONFIG_upv_1.ballDiameter / 2
local u3 = u1 * 0.5
local u4 = math.asin(u2 / (HELIX_JUMP_CONFIG_upv_1.pillarRadius + (HELIX_JUMP_CONFIG_upv_1.platformDepth / 2)))
local u5 = u1 * 0.75
local tbl_1 = {}
tbl_1.createHelixJumpBot = function(a1)
    --[[
      name: createHelixJumpBot
      line: 69
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        HELIX_JUMP_CONFIG_upv_1 (copy, index: 3)
        segmentsPerPlatform_upv_1 (copy, index: 4)
        ReactionGate_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        minAngleDiff_upv_1 (copy, index: 7)
        u3 (copy, index: 8)
        normalizeAngle_upv_1 (copy, index: 9)
        TAU_upv_1 (copy, index: 10)
        u2 (copy, index: 11)
        u4 (copy, index: 12)
        signedAngleDiff_upv_1 (copy, index: 13)
        jitteredDelay_upv_1 (copy, index: 14)
        u5 (copy, index: 15)
        chance_upv_1 (copy, index: 16)
        jitterNormal_upv_1 (copy, index: 17)
        SubStepper_upv_1 (copy, index: 18)
    ]]
    local u6 = BOT_TUNING_upv_1["helix-jump"][a1.difficulty]
    local random_upv_1 = a1.random
    local u7 = deriveRandom_upv_1(a1.seed, 0)
    local u8 = math.rad(u6.maxAngularSpeedDegPerSec)
    local tbl_upv_2 = {}
    for _ = 0, HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1 do
        local tbl_3 = {}
        for v1 = 0, segmentsPerPlatform_upv_1 - 1 do
            table.insert(tbl_3, "safe")
        end
        table.insert(tbl_upv_2, {pattern = tbl_3, moving = {}})
    end
    local tbl_upv_4 = {}
    for u9 = 0, HELIX_JUMP_CONFIG_upv_1.wallPoolSize - 1 do
        table.insert(tbl_upv_4, {})
    end
    local u10 = 0
    local u11 = 0
    local u9 = 0
    local u12 = 0
    local u13 = 0
    local u14 = 0
    local u15 = 0
    local u16 = false
    local u17 = nil
    local u18 = 0
    local u19 = false
    local u20 = ReactionGate_upv_1.new()
    local u21 = nil
    local u22 = 0
    local u23 = 0
    local u24 = 0
    local u25 = false
    local u26 = false
    local u27 = false
    local function releaseWallOn_1(a2)
        --[[
          name: releaseWallOn
          line: 127
          upvalues:
            tbl_upv_4 (copy, index: 1)
        ]]
        for _, value_1 in tbl_upv_4 do
            if value_1.platform == a2 then
                value_1.platform = nil
            end
        end
    end
    local function platformAt_1(a3)
        --[[
          name: platformAt
          line: 134
          upvalues:
            tbl_upv_2 (copy, index: 1)
        ]]
        for _, value_2 in tbl_upv_2 do
            if math.abs(value_2.y - a3) >= 1 then
                continue
            end
            return value_2
        end
        return nil
    end
    local function seedMovingHazard_upv_1(a4, a5, a6)
        --[[
          name: seedMovingHazard
          line: 154
          upvalues:
            u1 (copy, index: 1)
            segmentsPerPlatform_upv_1 (copy, index: 2)
            u3 (copy, index: 3)
            normalizeAngle_upv_1 (copy, index: 4)
            u7 (copy, index: 5)
            TAU_upv_1 (copy, index: 6)
        ]]
        local v3 = ((segmentsPerPlatform_upv_1 - a6) - 2) * u1
        local v4 = v3 / 2 - u3
        if v4 >= 0.5 then
            local moving_1 = a4.moving
            moving_1.active = true
            moving_1.center = normalizeAngle_upv_1((((a5 + a6) + 1) * u1) + (v3 / 2))
            moving_1.amplitude = u7:NextNumber(math.max(0.5, v4 * 0.55), v4)
            moving_1.phase = u7:NextNumber(0, TAU_upv_1)
        else
            return nil
        end
    end
    local function wallBlocksGap_upv_1(a7, a8, a9)
        --[[
          name: wallBlocksGap
          line: 142
          upvalues:
            segmentsPerPlatform_upv_1 (copy, index: 1)
            u1 (copy, index: 2)
            minAngleDiff_upv_1 (copy, index: 3)
        ]]
        for n_1 = 0, segmentsPerPlatform_upv_1 - 1 do
            if a7.pattern[n_1 + 1] ~= "gap" or minAngleDiff_upv_1(a8, (n_1 + 0.5) * u1) >= a9 + u1 then
                continue
            end
            return true
        end
        return false
    end
    local function trySpawnWall_upv_1(a10, a11, a12)
        --[[
          name: trySpawnWall
          line: 167
          upvalues:
            tbl_upv_4 (copy, index: 1)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
            u1 (copy, index: 3)
            segmentsPerPlatform_upv_1 (copy, index: 4)
            tbl_upv_2 (copy, index: 5)
            normalizeAngle_upv_1 (copy, index: 6)
            u7 (copy, index: 7)
            wallBlocksGap_upv_1 (copy, index: 8)
        ]]
        if a10.moving.active then
            return nil
        else
            local v5 = nil
            for _, value_3 in tbl_upv_4 do
                v5 = value_3.platform
                if v5 == nil or math.abs(v5.y - a10.y) >= HELIX_JUMP_CONFIG_upv_1.platformSpacing * 2.5 then
                    continue
                end
                return nil
            end
            local _ = nil
            local v8 = nil
            for v6, value_4 in tbl_upv_4 do
                if value_4.platform == nil then
                    v8 = value_4
                end
            end
            if v8 ~= nil then
                local v9 = HELIX_JUMP_CONFIG_upv_1.wallHalfArcSegments * u1
                v8 = ((segmentsPerPlatform_upv_1 - a12) - 2) * u1 - v9 * 2
                if v8 > 0 then
                    local v6
                    v6 = nil
                    for v10, value_5 in tbl_upv_2 do
                        if math.abs(value_5.y - (a10.y + HELIX_JUMP_CONFIG_upv_1.platformSpacing)) < 1 then
                            v6 = value_5
                            break
                        end
                    end
                    for v12 = 0, 7 do
                        local v11
                        v11 = normalizeAngle_upv_1((((a11 + a12) + 1) * u1) + v9 + u7:NextNumber(0, v8))
                        local v10 = nil
                        if v6 ~= nil then
                            v10 = wallBlocksGap_upv_1(v6, v11, v9)
                            if v10 then
                                continue
                            end
                        end
                        v8.platform = a10
                        v8.center = v11
                        v8.halfArc = v9
                        return nil
                    end
                else
                    return nil
                end
            else
                return nil
            end
        end
    end
    local function layoutPlatform_upv_1(a13, a14, a15)
        --[[
          name: layoutPlatform
          line: 206
          upvalues:
            tbl_upv_4 (copy, index: 1)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 2)
            segmentsPerPlatform_upv_1 (copy, index: 3)
            u7 (copy, index: 4)
            u17 (ref,  index: 5)
            seedMovingHazard_upv_1 (copy, index: 6)
            trySpawnWall_upv_1 (copy, index: 7)
        ]]
        for key_1, value_6 in tbl_upv_4 do
            if value_6.platform == a13 then
                value_6.platform = nil
            end
        end
        a13.y = a14
        a13.passed = false
        a13.smashed = false
        a13.moving.active = false
        local v12 = math.max(0, math.round(-a14 / HELIX_JUMP_CONFIG_upv_1.platformSpacing) - (HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1))
        local v13 = math.min(v12 / HELIX_JUMP_CONFIG_upv_1.depthForMaxDifficulty, 1)
        local v14 = math.max(HELIX_JUMP_CONFIG_upv_1.gapSegmentsMin, math.round(HELIX_JUMP_CONFIG_upv_1.gapSegmentsStart - (v13 * (HELIX_JUMP_CONFIG_upv_1.gapSegmentsStart - HELIX_JUMP_CONFIG_upv_1.gapSegmentsMin))))
        local key_1 = ((a15 == "starting") and 0) or (math.round(HELIX_JUMP_CONFIG_upv_1.hazardSegmentsStart + v13 * (HELIX_JUMP_CONFIG_upv_1.hazardSegmentsMax - HELIX_JUMP_CONFIG_upv_1.hazardSegmentsStart)))
        for v15 = 0, segmentsPerPlatform_upv_1 - 1 do
            a13.pattern[v15 + 1] = "safe"
        end
        local v16 = u7:NextInteger(0, segmentsPerPlatform_upv_1 - 1)
        if a15 == "starting" then
            v16 = u7:NextInteger(1, segmentsPerPlatform_upv_1 - v14)
        elseif u17 ~= nil and u7:NextNumber() < 0.4 then
            v16 = ((u17 + u7:NextInteger(-1, 1)) + segmentsPerPlatform_upv_1) % segmentsPerPlatform_upv_1
        end
        u17 = v16
        local v17 = 0
        u17 = false
        local v15 = nil
        while true do
            if v15 then
                v17 = v17 + 1
            else
                v15 = true
            end
            if v17 >= v14 then
                break
            end
            a13.pattern[((v16 + v17) % segmentsPerPlatform_upv_1) + 1] = "gap"
        end
        v17, v15 = 0, 0
        while v17 < key_1 do
            local v18
            if v15 >= 24 then
                break
            end
            local v19 = v15 + 1
            v18 = u7:NextInteger(0, segmentsPerPlatform_upv_1 - 1)
            local v20
            if a13.pattern[v18 + 1] ~= "safe" then
                v15 = v19
                continue
            end
            v20 = a13.pattern[((v18 + 1) % segmentsPerPlatform_upv_1) + 1]
            if a13.pattern[(((v18 - 1) + segmentsPerPlatform_upv_1) % segmentsPerPlatform_upv_1) + 1] ~= "gap" and v20 ~= "gap" then
                a13.pattern[v18 + 1] = "hazard"
                v17 = v17 + 1
            end
            v15 = v19
        end
        a13.gapStart = v16
        a13.gapCount = v14
        if a15 == "descent" and HELIX_JUMP_CONFIG_upv_1.movingHazardFromDepth <= v12 and u7:NextNumber() < HELIX_JUMP_CONFIG_upv_1.movingHazardChanceStart + (v13 * (HELIX_JUMP_CONFIG_upv_1.movingHazardChanceMax - HELIX_JUMP_CONFIG_upv_1.movingHazardChanceStart)) then
            seedMovingHazard_upv_1(a13, v16, v14)
        end
        if a15 ~= "descent" or HELIX_JUMP_CONFIG_upv_1.wallFromDepth > v12 or u7:NextNumber() >= HELIX_JUMP_CONFIG_upv_1.wallChance then
            return
        end
        trySpawnWall_upv_1(a13, v16, v14)
    end
    local function segmentUnderBall_upv_1(a16)
        --[[
          name: segmentUnderBall
          line: 273
          upvalues:
            normalizeAngle_upv_1 (copy, index: 1)
            u10 (ref,  index: 2)
            u1 (copy, index: 3)
            segmentsPerPlatform_upv_1 (copy, index: 4)
        ]]
        local v21 = normalizeAngle_upv_1(0 - u10) / u1
        local v22 = math.clamp(math.floor(v21), 0, segmentsPerPlatform_upv_1 - 1)
        local v23 = a16.pattern[v22 + 1]
        local v24 = nil
        if v23 == "gap" then
            v24 = v21 - math.floor(v21)
            if v24 < 0.32 and a16.pattern[(((v22 - 1) + segmentsPerPlatform_upv_1) % segmentsPerPlatform_upv_1) + 1] ~= "gap" or v24 > 0.6799999999999999 and a16.pattern[((v22 + 1) % segmentsPerPlatform_upv_1) + 1] ~= "gap" then
                return "safe"
            end
            return "gap"
        end
        return v23
    end
    local function movingHazardUnderBall_1(a17)
        --[[
          name: movingHazardUnderBall
          line: 290
          upvalues:
            normalizeAngle_upv_1 (copy, index: 1)
            u10 (ref,  index: 2)
            minAngleDiff_upv_1 (copy, index: 3)
            u3 (copy, index: 4)
        ]]
        local moving_2 = a17.moving
        if moving_2.active then
            local v25 = minAngleDiff_upv_1(normalizeAngle_upv_1(0 - u10), moving_2.center + (moving_2.amplitude * math.sin(moving_2.phase))) < u3
            return v25
        end
        return false
    end
    local function clampAgainstWalls_upv_1()
        --[[
          name: clampAgainstWalls
          line: 299
          upvalues:
            u11 (ref,  index: 1)
            u2 (copy, index: 2)
            tbl_upv_4 (copy, index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            normalizeAngle_upv_1 (copy, index: 5)
            u10 (ref,  index: 6)
            u4 (copy, index: 7)
            signedAngleDiff_upv_1 (copy, index: 8)
        ]]
        local v26 = nil
        local v27 = nil
        local v28 = nil
        local v29 = nil
        local v30 = nil
        for _, value_7 in tbl_upv_4 do
            v30 = value_7.platform
            if v30 == nil or v30.smashed or u11 + u2 < v30.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) or (v30.y + HELIX_JUMP_CONFIG_upv_1.platformSpacing) - (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) < u11 - u2 then
                continue
            end
            v29 = normalizeAngle_upv_1(0 - u10)
            v27 = value_7.halfArc + u4
            v28 = signedAngleDiff_upv_1(value_7.center, v29)
            if v27 <= math.abs(v28) then
                continue
            end
            if v28 < 0 then
                v26 = -v27
            else
                v26 = v27
            end
            u10 = normalizeAngle_upv_1(-(value_7.center + v26))
        end
    end
    local function breakPlatform_1(a18)
        --[[
          name: breakPlatform
          line: 322
          upvalues:
            tbl_upv_4 (copy, index: 1)
        ]]
        a18.smashed = true
        a18.moving.active = false
        for _, value_8 in tbl_upv_4 do
            if value_8.platform == a18 then
                value_8.platform = nil
            end
        end
    end
    local function passPlatform_1(a19)
        --[[
          name: passPlatform
          line: 327
          upvalues:
            u14 (ref,  index: 1)
            u15 (ref,  index: 2)
            u18 (ref,  index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            u16 (ref,  index: 5)
            tbl_upv_4 (copy, index: 6)
        ]]
        if a19.passed then
            return nil
        end
        a19.passed = true
        u14 = u14 + 1
        u15 = u15 + 1
        u18 = u18 + 1
        if u15 == HELIX_JUMP_CONFIG_upv_1.feverThreshold then
            u16 = true
            u18 = u18 + HELIX_JUMP_CONFIG_upv_1.multiFallBonus
        end
        a19.smashed = true
        a19.moving.active = false
        for _, value_9 in tbl_upv_4 do
            if value_9.platform == a19 then
                value_9.platform = nil
            end
        end
    end
    local function smashPlatform_upv_1(a20)
        --[[
          name: smashPlatform
          line: 341
          upvalues:
            u14 (ref,  index: 1)
            u18 (ref,  index: 2)
            tbl_upv_4 (copy, index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            u16 (ref,  index: 5)
            u15 (ref,  index: 6)
        ]]
        if not (a20.passed) then
            a20.passed = true
            u14 = u14 + 1
            u18 = u18 + 1
        end
        local v31 = nil
        for _, value_10 in tbl_upv_4 do
            v31 = value_10.platform
            if v31 == nil then
                continue
            end
            if math.abs(v31.y - (a20.y - HELIX_JUMP_CONFIG_upv_1.platformSpacing)) < 1 then
                value_10.platform = nil
            end
        end
        a20.smashed = true
        a20.moving.active = false
        for _, value_11 in tbl_upv_4 do
            if value_11.platform == a20 then
                value_11.platform = nil
            end
        end
        u16 = false
        u15 = 0
    end
    local function bounce_1(a21)
        --[[
          name: bounce
          line: 361
          upvalues:
            u11 (ref,  index: 1)
            u2 (copy, index: 2)
            u9 (ref,  index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            u15 (ref,  index: 5)
            u16 (ref,  index: 6)
            u20 (copy, index: 7)
            jitteredDelay_upv_1 (copy, index: 8)
            random_upv_1 (copy, index: 9)
            u6 (copy, index: 10)
            u21 (ref,  index: 11)
        ]]
        u11 = a21 + u2
        u9 = HELIX_JUMP_CONFIG_upv_1.bounceVelocity
        u15 = 0
        u16 = false
        u20:arm(jitteredDelay_upv_1(random_upv_1, u6.reactionSeconds, 0.35))
        u21 = nil
    end
    local function handleLandings_upv_1(a22)
        --[[
          name: handleLandings
          line: 370
          upvalues:
            u11 (ref,  index: 1)
            u2 (copy, index: 2)
            tbl_upv_2 (copy, index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            segmentUnderBall_upv_1 (copy, index: 5)
            u14 (ref,  index: 6)
            u15 (ref,  index: 7)
            u18 (ref,  index: 8)
            u16 (ref,  index: 9)
            tbl_upv_4 (copy, index: 10)
            smashPlatform_upv_1 (copy, index: 11)
            normalizeAngle_upv_1 (copy, index: 12)
            u10 (ref,  index: 13)
            minAngleDiff_upv_1 (copy, index: 14)
            u3 (copy, index: 15)
            u19 (ref,  index: 16)
            u9 (ref,  index: 17)
            u20 (copy, index: 18)
            jitteredDelay_upv_1 (copy, index: 19)
            random_upv_1 (copy, index: 20)
            u6 (copy, index: 21)
            u21 (ref,  index: 22)
        ]]
        for _, value_12 in tbl_upv_2 do
            local v32, v33 = nil, nil
            if not value_12.smashed then
                v32 = value_12.y + HELIX_JUMP_CONFIG_upv_1.platformHeight / 2
                if v32 <= a22 - u2 and u11 - u2 < v32 then
                    v33 = segmentUnderBall_upv_1(value_12)
                    if v33 ~= "gap" then
                        if u16 then
                            smashPlatform_upv_1(value_12)
                        else
                            local v34 = nil
                            if v33 ~= "hazard" then
                                v34 = value_12.moving
                                local v35
                                if v34.active then
                                    v35 = minAngleDiff_upv_1(normalizeAngle_upv_1(0 - u10), v34.center + (v34.amplitude * math.sin(v34.phase))) < u3
                                else
                                    v35 = false
                                end
                                if not (v35) then
                                    u11 = v32 + u2
                                    u9 = HELIX_JUMP_CONFIG_upv_1.bounceVelocity
                                    u15 = 0
                                    u16 = false
                                    u20:arm(jitteredDelay_upv_1(random_upv_1, u6.reactionSeconds, 0.35))
                                    u21 = nil
                                    return nil
                                end
                            end
                            u19 = true
                            return nil
                        end
                    elseif not (value_12.passed) then
                        value_12.passed = true
                        u14 = u14 + 1
                        u15 = u15 + 1
                        u18 = u18 + 1
                        if u15 == HELIX_JUMP_CONFIG_upv_1.feverThreshold then
                            u16 = true
                            u18 = u18 + HELIX_JUMP_CONFIG_upv_1.multiFallBonus
                        end
                        value_12.smashed = true
                        value_12.moving.active = false
                        for v36, value_13 in tbl_upv_4 do
                            if value_13.platform == value_12 then
                                value_13.platform = nil
                            end
                        end
                    end
                end
            end
        end
    end
    local function wallCovers_upv_1(a23, a24)
        --[[
          name: wallCovers
          line: 417
          upvalues:
            tbl_upv_4 (copy, index: 1)
            minAngleDiff_upv_1 (copy, index: 2)
            u4 (copy, index: 3)
            u1 (copy, index: 4)
        ]]
        for _, value_14 in tbl_upv_4 do
            if value_14.platform ~= a23 or minAngleDiff_upv_1(a24, value_14.center) >= (value_14.halfArc + u4) + (u1 * 0.25) then
                continue
            end
            return true
        end
        return false
    end
    local function gapCenterAngle_1(a25)
        --[[
          name: gapCenterAngle
          line: 472
          upvalues:
            normalizeAngle_upv_1 (copy, index: 1)
            u1 (copy, index: 2)
        ]]
        return normalizeAngle_upv_1((a25.gapStart + (a25.gapCount / 2)) * u1)
    end
    local function estimateFallSeconds_upv_1(a26, a27)
        --[[
          name: estimateFallSeconds
          line: 400
          upvalues:
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
        ]]
        local v36 = nil
        if a26 > 0 then
            local gravity_1 = HELIX_JUMP_CONFIG_upv_1.gravity
            v36 = HELIX_JUMP_CONFIG_upv_1.terminalVelocity
            local v37 = nil
            if v36 >= a27 then
                return a26 / -v36
            else
                local v38 = (v36 - a27) / gravity_1
                v37 = -((a27 * v38) + (((0.5 * gravity_1) * v38) * v38))
                if v37 >= a26 then
                    return (a27 + math.sqrt((a27 * a27) - ((2 * gravity_1) * a26))) / -gravity_1
                end
                return v38 + ((a26 - v37) / -v36)
            end
        else
            return 0
        end
    end
    local function fallSecondsTo_1(a28)
        --[[
          name: fallSecondsTo
          line: 475
          upvalues:
            estimateFallSeconds_upv_1 (copy, index: 1)
            u11 (ref,  index: 2)
            u2 (copy, index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            u9 (ref,  index: 5)
        ]]
        return (estimateFallSeconds_upv_1((u11 - u2) - (a28.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2)), u9))
    end
    local function nearestSafeAngle_upv_1(a29, a30, a31)
        --[[
          name: nearestSafeAngle
          line: 432
          upvalues:
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 1)
            segmentsPerPlatform_upv_1 (copy, index: 2)
            u1 (copy, index: 3)
            minAngleDiff_upv_1 (copy, index: 4)
            u3 (copy, index: 5)
            u5 (copy, index: 6)
            wallCovers_upv_1 (copy, index: 7)
        ]]
        local v39 = nil
        local moving_3 = a29.moving
        if moving_3.active then
            local _ = moving_3.center + moving_3.amplitude * math.sin(moving_3.phase + ((HELIX_JUMP_CONFIG_upv_1.movingHazardSweepSpeed / moving_3.amplitude) * a31))
        end
        local v40 = nil
        local v41 = math.huge
        local v42 = nil
        local v43 = math.huge
        v43, v40, v42 = v43, v40, v42
        for n_2 = 0, segmentsPerPlatform_upv_1 - 1 do
            local v44, v45
            if a29.pattern[n_2 + 1] ~= "safe" then
                continue
            end
            v44 = (n_2 + 0.5) * u1
            v45 = minAngleDiff_upv_1(a30, v44)
            if v45 < v43 then
                v43, v42 = v45, v44
            end
            if v39 == nil or minAngleDiff_upv_1(v44, v39) >= u3 + u5 then
                local v46
                v46 = wallCovers_upv_1(a29, v44)
                if v46 then
                    continue
                end
                if v45 < v41 then
                    v41, v40 = v45, v44
                end
            end
        end
        if v40 == nil then
            if v42 == nil then
                return a30
            end
            return v42
        end
        return v40
    end
    local function planFor_upv_1(a32)
        --[[
          name: planFor
          line: 478
          upvalues:
            u21 (ref,  index: 1)
            u23 (ref,  index: 2)
            u24 (ref,  index: 3)
            u26 (ref,  index: 4)
            u27 (ref,  index: 5)
            u25 (ref,  index: 6)
            chance_upv_1 (copy, index: 7)
            random_upv_1 (copy, index: 8)
            u6 (copy, index: 9)
            normalizeAngle_upv_1 (copy, index: 10)
            u10 (ref,  index: 11)
            u9 (ref,  index: 12)
            estimateFallSeconds_upv_1 (copy, index: 13)
            u11 (ref,  index: 14)
            u2 (copy, index: 15)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 16)
            u15 (ref,  index: 17)
            u1 (copy, index: 18)
            nearestSafeAngle_upv_1 (copy, index: 19)
            u16 (ref,  index: 20)
            u8 (copy, index: 21)
            jitterNormal_upv_1 (copy, index: 22)
            minAngleDiff_upv_1 (copy, index: 23)
            u22 (ref,  index: 24)
        ]]
        u21 = a32
        u23 = 0
        u24 = 0
        u26 = false
        u27 = false
        u25 = not chance_upv_1(random_upv_1, math.min(u6.angleErrorDeg * 0.014, 0.35))
        local v47 = normalizeAngle_upv_1(0 - u10)
        local v48 = ((u9 >= 0) and 0.9) or (estimateFallSeconds_upv_1((u11 - u2) - (a32.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2)), u9))
        local v49 = true
        if u15 ~= 0 then
            v49 = chance_upv_1(random_upv_1, u6.feverGreed)
        end
        local v50
        if v49 then
            v50 = normalizeAngle_upv_1((a32.gapStart + (a32.gapCount / 2)) * u1)
        else
            v50 = nearestSafeAngle_upv_1(a32, v47, v48)
        end
        if v49 and not (u16) and u9 < 0 and v48 < 0.45 and u25 then
            u26 = true
            if (u8 * math.max(v48 - (u6.reactionSeconds * 0.5), 0)) * (1 + jitterNormal_upv_1(random_upv_1, 0.3)) < minAngleDiff_upv_1(v47, v50) then
                local v51 = nearestSafeAngle_upv_1(a32, v47, v48)
                u26 = false
                v50 = v51
            end
        end
        u22 = normalizeAngle_upv_1(v50 + math.rad(jitterNormal_upv_1(random_upv_1, u6.angleErrorDeg)))
    end
    local function currentTargetPlatform_upv_1()
        --[[
          name: currentTargetPlatform
          line: 503
          upvalues:
            u11 (ref,  index: 1)
            u2 (copy, index: 2)
            tbl_upv_2 (copy, index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
        ]]
        local v52
        v52 = nil
        for _, value_15 in tbl_upv_2 do
            if value_15.smashed or u11 - u2 + 0.001 < value_15.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) then
                continue
            end
            if v52 == nil or v52.y < value_15.y then
                v52 = value_15
            end
        end
        return v52
    end
    local function steer_upv_1(a33)
        --[[
          name: steer
          line: 519
          upvalues:
            u20 (copy, index: 1)
            currentTargetPlatform_upv_1 (copy, index: 2)
            u21 (ref,  index: 3)
            jitteredDelay_upv_1 (copy, index: 4)
            random_upv_1 (copy, index: 5)
            u6 (copy, index: 6)
            planFor_upv_1 (copy, index: 7)
            u9 (ref,  index: 8)
            u16 (ref,  index: 9)
            estimateFallSeconds_upv_1 (copy, index: 10)
            u11 (ref,  index: 11)
            u2 (copy, index: 12)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 13)
            u26 (ref,  index: 14)
            minAngleDiff_upv_1 (copy, index: 15)
            normalizeAngle_upv_1 (copy, index: 16)
            u10 (ref,  index: 17)
            u22 (ref,  index: 18)
            u8 (copy, index: 19)
            nearestSafeAngle_upv_1 (copy, index: 20)
            jitterNormal_upv_1 (copy, index: 21)
            u25 (ref,  index: 22)
            u27 (ref,  index: 23)
            segmentUnderBall_upv_1 (copy, index: 24)
            u3 (copy, index: 25)
            signedAngleDiff_upv_1 (copy, index: 26)
            u23 (ref,  index: 27)
            u24 (ref,  index: 28)
            clampAgainstWalls_upv_1 (copy, index: 29)
        ]]
        local v53 = u20:ready(a33)
        local v54 = currentTargetPlatform_upv_1()
        if v54 == nil then
            return nil
        elseif v54 == u21 then
            if v53 then
                if u9 < 0 and not (u16) then
                    local v55 = estimateFallSeconds_upv_1((u11 - u2) - (v54.y + (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2)), u9)
                    if u26 and (u8 * v55) * 1.05 < minAngleDiff_upv_1(normalizeAngle_upv_1(0 - u10), u22) then
                        u22 = normalizeAngle_upv_1(nearestSafeAngle_upv_1(v54, normalizeAngle_upv_1(0 - u10), v55) + math.rad(jitterNormal_upv_1(random_upv_1, u6.angleErrorDeg)))
                        u22 = false
                    end
                    if u25 and not (u27) and v55 < 0.12 then
                        local v56 = nil
                        if segmentUnderBall_upv_1(v54) == "hazard" then
                            u27 = true
                            if jitteredDelay_upv_1(random_upv_1, u6.reactionSeconds * 0.35, 0.35) < v55 then
                                u22 = normalizeAngle_upv_1(nearestSafeAngle_upv_1(v54, normalizeAngle_upv_1(0 - u10), v55) + math.rad(jitterNormal_upv_1(random_upv_1, u6.angleErrorDeg)))
                            end
                        else
                            v56 = v54.moving
                            local v57
                            if v56.active then
                                v57 = minAngleDiff_upv_1(normalizeAngle_upv_1(0 - u10), v56.center + (v56.amplitude * math.sin(v56.phase))) < u3
                            else
                                v57 = false
                            end
                            if v57 then
                                u27 = true
                                if jitteredDelay_upv_1(random_upv_1, u6.reactionSeconds * 0.35, 0.35) < v55 then
                                    u22 = normalizeAngle_upv_1(nearestSafeAngle_upv_1(v54, normalizeAngle_upv_1(0 - u10), v55) + math.rad(jitterNormal_upv_1(random_upv_1, u6.angleErrorDeg)))
                                end
                            end
                        end
                    end
                end
                local v58 = signedAngleDiff_upv_1(u10, -u22)
                if u23 ~= 0 and (((v58 < 0) and -1) or 1) == u23 then
                    u23 = 0
                end
                local v59 = u8 * a33
                local v60 = math.clamp(v58, -v59, v59)
                if u23 ~= 0 then
                    v60 = u23 * v59
                end
                local v61 = nil
                if math.abs(v60) >= 1e-04 then
                    v61 = u10
                    u10 = normalizeAngle_upv_1(u10 + v60)
                    clampAgainstWalls_upv_1()
                    if math.abs(signedAngleDiff_upv_1(v61, u10)) >= math.abs(v60) * 0.25 then
                        u24 = 0
                    else
                        u24 = u24 + a33
                        if u24 >= 0.12 then
                            u23 = ((v58 < 0) and 1) or -1
                            u24 = 0
                            return
                        end
                    end
                else
                    u24 = 0
                    return nil
                end
            else
                return nil
            end
        else
            if u21 ~= nil then
                u20:arm(jitteredDelay_upv_1(random_upv_1, u6.reactionSeconds * 0.5, 0.35))
            end
            planFor_upv_1(v54)
            return nil
        end
    end
    local function tick_upv_1(a34)
        --[[
          name: tick
          line: 588
          upvalues:
            u19 (ref,  index: 1)
            steer_upv_1 (copy, index: 2)
            tbl_upv_2 (copy, index: 3)
            HELIX_JUMP_CONFIG_upv_1 (copy, index: 4)
            u9 (ref,  index: 5)
            u11 (ref,  index: 6)
            u12 (ref,  index: 7)
            clampAgainstWalls_upv_1 (copy, index: 8)
            handleLandings_upv_1 (copy, index: 9)
            u13 (ref,  index: 10)
            layoutPlatform_upv_1 (copy, index: 11)
        ]]
        if u19 then
            return nil
        else
            steer_upv_1(a34)
            local v62 = nil
            for _, value_16 in tbl_upv_2 do
                v62 = value_16.moving
                if not (v62.active) then
                    continue
                end
                if not (value_16.smashed) then
                    v62.phase = v62.phase + ((HELIX_JUMP_CONFIG_upv_1.movingHazardSweepSpeed / v62.amplitude) * a34)
                end
            end
            u9 = math.max(u9 + (HELIX_JUMP_CONFIG_upv_1.gravity * a34), HELIX_JUMP_CONFIG_upv_1.terminalVelocity)
            u11 = u11 + (u9 * a34)
            if u11 < u12 then
                u12 = u11
            end
            clampAgainstWalls_upv_1()
            if u9 < 0 then
                handleLandings_upv_1(u11)
            end
            if u19 then
                return nil
            end
            for _, value_17 in tbl_upv_2 do
                if u12 + 32 < value_17.y then
                    u13 = u13 - HELIX_JUMP_CONFIG_upv_1.platformSpacing
                    layoutPlatform_upv_1(value_17, u13, "descent")
                end
            end
        end
    end
    u13 = -(HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1) * HELIX_JUMP_CONFIG_upv_1.platformSpacing
    for n_3 = 0, HELIX_JUMP_CONFIG_upv_1.platformPoolSize - 1 do
        layoutPlatform_upv_1(tbl_upv_2[n_3 + 1], -n_3 * HELIX_JUMP_CONFIG_upv_1.platformSpacing, ((n_3 ~= 0) and "descent") or "starting")
    end
    u11 = (HELIX_JUMP_CONFIG_upv_1.platformHeight / 2) + u2 + 2
    u12 = u11
    u20:arm(jitteredDelay_upv_1(random_upv_1, u6.reactionSeconds, 0.35))
    local u28 = SubStepper_upv_1.new(0.008333333333333333)
    local tbl_5 = {}
    tbl_5.step = function(a35, a36)
        --[[
          name: step
          line: 629
          upvalues:
            u19 (ref,  index: 1)
            u28 (copy, index: 2)
            tick_upv_1 (copy, index: 3)
        ]]
        if u19 then
            return nil
        end
        u28:step(a36, tick_upv_1)
    end
    tbl_5.snapshot = function(a37)
        --[[
          name: snapshot
          line: 635
          upvalues:
            u18 (ref, index: 1)
            u14 (ref, index: 2)
            u15 (ref, index: 3)
            u16 (ref, index: 4)
            u11 (ref, index: 5)
        ]]
        local tbl_6 = {}
        tbl_6.score = u18
        tbl_6.values = {u14, u15, (u16 and 1) or 0, u11}
        return tbl_6
    end
    tbl_5.isDead = function(a38)
        --[[
          name: isDead
          line: 641
          upvalues:
            u19 (ref, index: 1)
        ]]
        return u19
    end
    tbl_5.score = function(a39)
        --[[
          name: score
          line: 644
          upvalues:
            u18 (ref, index: 1)
        ]]
        return u18
    end
    return tbl_5
end
return tbl_1