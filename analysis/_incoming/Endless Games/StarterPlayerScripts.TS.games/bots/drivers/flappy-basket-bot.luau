-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "common", "interpolate").lerp
local FLAPPY_BASKET_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "flappy-basket", "flappy-basket-config").FLAPPY_BASKET_CONFIG
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v1.chance
local jitteredDelay_upv_1 = v1.jitteredDelay
local jitterNormal_upv_1 = v1.jitterNormal
local SubStepper_upv_1 = v1.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local tbl_1 = {}
tbl_1.createFlappyBasketBot = function(a1)
    --[[
      name: createFlappyBasketBot
      line: 66
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        SubStepper_upv_1 (copy, index: 3)
        FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 4)
        jitteredDelay_upv_1 (copy, index: 5)
        lerp_upv_1 (copy, index: 6)
        jitterNormal_upv_1 (copy, index: 7)
        chance_upv_1 (copy, index: 8)
    ]]
    local random_upv_1 = a1.random
    local u1 = BOT_TUNING_upv_1["flappy-basket"][a1.difficulty]
    local u2 = deriveRandom_upv_1(a1.seed, 0)
    local u3 = SubStepper_upv_1.new(0.008333333333333333)
    local u4 = 0
    local ceilingY_upv_1 = 0
    local flapVelocity_upv_1 = FLAPPY_BASKET_CONFIG_upv_1.flapVelocity * 0.6
    local cruiseSpeedX_upv_1 = FLAPPY_BASKET_CONFIG_upv_1.cruiseSpeedX
    local u5 = 0
    local u6 = 0
    local u7 = false
    local u8 = 0
    local u9 = 0
    local firstHoopDistance_upv_1 = FLAPPY_BASKET_CONFIG_upv_1.firstHoopDistance
    local u10 = nil
    local u11 = false
    local u12 = jitteredDelay_upv_1(random_upv_1, u1.decisionPeriod, 0.3)
    local u13 = 0
    local u14 = 0
    local u15 = 0
    local function u16(a2)
        --[[
          line: 123
          upvalues:
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        ]]
        if a2.railKind ~= "none" then
            local v2 = math.cos(a2.railPhase) * a2.railAmplitude * a2.railAngularSpeed
            if a2.railKind ~= "vertical" then
                local v3 = math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees) * math.sign(a2.tiltRadians)
                local tbl_2 = {}
                tbl_2.x = math.sin(v3) * v2
                tbl_2.y = math.cos(v3) * v2
                return tbl_2
            else
                local tbl_3 = {}
                tbl_3.y = v2
                return tbl_3
            end
        else
            return {}
        end
    end
    local function u17(a3, a4)
        --[[
          line: 106
          upvalues:
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
        ]]
        if a3.railKind ~= "none" then
            a3.railPhase = a3.railPhase + (a3.railAngularSpeed * a4)
            local v4 = math.sin(a3.railPhase) * a3.railAmplitude
            if a3.railKind ~= "vertical" then
                local v5 = math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees) * math.sign(a3.tiltRadians)
                a3.centerX = a3.anchorX + (math.sin(v5) * v4)
                a3.centerY = a3.anchorY + (math.cos(v5) * v4)
            else
                a3.centerX = a3.anchorX
                a3.centerY = a3.anchorY + v4
            end
        else
            a3.centerX = a3.anchorX
            a3.centerY = a3.anchorY
            return nil
        end
    end
    local function u18()
        --[[
          line: 143
          upvalues:
            u2 (copy, index: 1)
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 2)
            u8 (ref,  index: 3)
            u5 (ref,  index: 4)
            lerp_upv_1 (copy, index: 5)
            u9 (ref,  index: 6)
            firstHoopDistance_upv_1 (ref,  index: 7)
            u17 (copy, index: 8)
            u4 (ref,  index: 9)
            ceilingY_upv_1 (ref,  index: 10)
        ]]
        local v6 = u2:NextNumber(FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMin, FLAPPY_BASKET_CONFIG_upv_1.hoopSpacingMax)
        local v7 = u2:NextNumber(-1, 1)
        local v8 = u2:NextNumber(-1, 1)
        local v9 = u2:NextNumber(0, 1)
        local v10 = u2:NextNumber(0, 1)
        local v11 = u2:NextNumber(FLAPPY_BASKET_CONFIG_upv_1.railAmplitudeMin, FLAPPY_BASKET_CONFIG_upv_1.railAmplitudeMax)
        local v12 = u2:NextNumber(FLAPPY_BASKET_CONFIG_upv_1.railPeriodMin, FLAPPY_BASKET_CONFIG_upv_1.railPeriodMax)
        local v13 = u2:NextNumber(0, math.tau)
        u8 = u8 + 1
        local v14 = math.clamp(u9 + (v7 * lerp_upv_1(FLAPPY_BASKET_CONFIG_upv_1.heightMaxDeltaEarly, FLAPPY_BASKET_CONFIG_upv_1.heightMaxDeltaLate, math.clamp(u5 / FLAPPY_BASKET_CONFIG_upv_1.heightDeltaRampScore, 0, 1))), FLAPPY_BASKET_CONFIG_upv_1.heightMin, FLAPPY_BASKET_CONFIG_upv_1.heightMax)
        u9 = v14
        firstHoopDistance_upv_1 = firstHoopDistance_upv_1 + v6
        local v15 = 0
        if FLAPPY_BASKET_CONFIG_upv_1.tiltIntroScore <= u5 then
            v15 = v8 * lerp_upv_1(FLAPPY_BASKET_CONFIG_upv_1.tiltMaxEarlyDegrees, FLAPPY_BASKET_CONFIG_upv_1.tiltMaxLateDegrees, math.clamp((u5 - FLAPPY_BASKET_CONFIG_upv_1.tiltIntroScore) / math.max(FLAPPY_BASKET_CONFIG_upv_1.tiltLateScore - FLAPPY_BASKET_CONFIG_upv_1.tiltIntroScore, 1), 0, 1))
        end
        local v16 = "none"
        if FLAPPY_BASKET_CONFIG_upv_1.railIntroHoop <= u8 and v9 < lerp_upv_1(FLAPPY_BASKET_CONFIG_upv_1.railChanceEarly, FLAPPY_BASKET_CONFIG_upv_1.railChanceLate, math.clamp((u8 - FLAPPY_BASKET_CONFIG_upv_1.railIntroHoop) / math.max(FLAPPY_BASKET_CONFIG_upv_1.railLateHoop - FLAPPY_BASKET_CONFIG_upv_1.railIntroHoop, 1), 0, 1)) then
            if FLAPPY_BASKET_CONFIG_upv_1.diagonalRailIntroHoop > u8 or v10 >= 0.5 then
                v16 = "vertical"
            else
                v16 = "diagonal"
            end
            if v16 == "diagonal" then
                v15 = FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees * (((v8 < 0) and -1) or 1)
            end
        end
        local v17
        if v16 == "none" then
            v17 = v11
        else
            local v18 = v16 == "vertical" and 1 or math.cos(math.rad(FLAPPY_BASKET_CONFIG_upv_1.diagonalRailDegrees))
            v17 = math.min(v11, ((FLAPPY_BASKET_CONFIG_upv_1.heightMax + 2) - v14) / v18, (v14 - (FLAPPY_BASKET_CONFIG_upv_1.heightMin - 2)) / v18)
        end
        local tbl_4 = {}
        tbl_4.anchorX = firstHoopDistance_upv_1
        tbl_4.anchorY = v14
        tbl_4.centerX = firstHoopDistance_upv_1
        tbl_4.centerY = v14
        tbl_4.tiltRadians = math.rad(v15)
        tbl_4.railKind = v16
        tbl_4.railAmplitude = v17
        tbl_4.railAngularSpeed = math.tau / v12
        tbl_4.railPhase = v13
        u17(tbl_4, 0)
        tbl_4.prevLocalY = -(u4 - tbl_4.centerX) * math.sin(-tbl_4.tiltRadians) + ((ceilingY_upv_1 - tbl_4.centerY) * math.cos(-tbl_4.tiltRadians))
        return tbl_4
    end
    local u19 = u18()
    local u20 = u18()
    local u21 = jitterNormal_upv_1(random_upv_1, u1.aimJitterStuds)
    local u22 = jitterNormal_upv_1(random_upv_1, u1.aimJitterStuds)
    local u23 = "none"
    local v19 = chance_upv_1(random_upv_1, u1.blunderPerHoop)
    if v19 then
        u23 = ((chance_upv_1(random_upv_1, 0.5)) and "freeze") or "doubleFlap"
    end
    local function u24(a5, a6)
        --[[
          line: 221
          upvalues:
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 1)
            ceilingY_upv_1 (ref,  index: 2)
        ]]
        local v20 = -FLAPPY_BASKET_CONFIG_upv_1.gravity
        local v21 = -FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity
        local v22 = 0
        local v23, v24
        local v27 = nil
        if a6 <= 0 then
            v23, v24 = a6, a5
        else
            v27 = math.max(FLAPPY_BASKET_CONFIG_upv_1.ceilingY - ceilingY_upv_1, 0)
            if v27 >= (a6 * a6) / (2 * v20) then
                v23, v24 = a6, a5
            else
                local v26 = (a6 - math.sqrt(math.max(a6 * a6 - 2 * v20 * v27, 0))) / v20
                v24 = a5 + v27
                v23 = 0
                v22 = v26
            end
        end
        local v25 = v23 * v23 + (2 * v20) * v24
        if v25 >= 0 then
            v27 = (v23 + math.sqrt(v25)) / v20
            local v28 = nil
            if v27 > 0 then
                v28 = (v23 + v21) / v20
                if v27 > v28 then
                    return (v22 + v28) + ((v24 - -((v23 * v28) - (((0.5 * v20) * v28) * v28))) / v21)
                end
                return v22 + v27
            end
        end
        return nil
    end
    local function u25(a7)
        --[[
          line: 259
          upvalues:
            u19 (ref,  index: 1)
            u24 (copy, index: 2)
            ceilingY_upv_1 (ref,  index: 3)
            u21 (ref,  index: 4)
            u16 (copy, index: 5)
            u4 (ref,  index: 6)
            cruiseSpeedX_upv_1 (ref,  index: 7)
        ]]
        local centerX_1 = u19.centerX
        local centerY_1 = u19.centerY
        local v29 = u24(ceilingY_upv_1 - (centerY_1 + u21), a7)
        if v29 ~= nil then
            local v30 = nil
            if u19.railKind == "none" then
                local tbl_5 = {}
                tbl_5.crossX = u4 + (cruiseSpeedX_upv_1 * v29)
                tbl_5.targetX = centerX_1
                tbl_5.crossTime = v29
                return tbl_5
            else
                local v31 = u16(u19)
                v30 = u24(ceilingY_upv_1 - ((centerY_1 + (v31.y * v29)) + u21), a7)
                if v30 ~= nil then
                    local tbl_6 = {}
                    tbl_6.crossX = u4 + (cruiseSpeedX_upv_1 * v30)
                    tbl_6.targetX = centerX_1 + (v31.x * v30)
                    tbl_6.crossTime = v30
                    return tbl_6
                end
                return nil
            end
        else
            return nil
        end
    end
    local function u26()
        --[[
          line: 284
          upvalues:
            u19 (ref,  index: 1)
            u21 (ref,  index: 2)
            u4 (ref,  index: 3)
            u25 (copy, index: 4)
            flapVelocity_upv_1 (ref,  index: 5)
            u22 (ref,  index: 6)
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 7)
            u15 (ref,  index: 8)
            u23 (ref,  index: 9)
            u11 (ref,  index: 10)
            u14 (ref,  index: 11)
            u1 (copy, index: 12)
            ceilingY_upv_1 (ref,  index: 13)
            u13 (ref,  index: 14)
            jitteredDelay_upv_1 (copy, index: 15)
            random_upv_1 (copy, index: 16)
        ]]
        local v32 = u19.centerY + u21
        local v33 = u19.centerX - u4
        local v34 = u25(flapVelocity_upv_1)
        if v34 ~= nil and (v34.targetX + u22) - 1.2 <= v34.crossX and v34.crossX <= (v34.targetX + u22) + 2.4 then
            if v34.crossTime <= 0.35 and v32 < FLAPPY_BASKET_CONFIG_upv_1.floorY + 10 then
                u15 = v34.crossTime + 0.08
            end
            if u23 == "doubleFlap" and v33 < 9 then
                u23 = "none"
                u11 = true
                u14 = 0.12
            end
            return nil
        end
        if flapVelocity_upv_1 < 0 and (ceilingY_upv_1 + (flapVelocity_upv_1 * ((u1.decisionPeriod * 1.3) + 0.06))) - FLAPPY_BASKET_CONFIG_upv_1.ballRadius < FLAPPY_BASKET_CONFIG_upv_1.floorY + 1.2 then
            u11 = true
            return nil
        end
        local v35 = u25(FLAPPY_BASKET_CONFIG_upv_1.flapVelocity)
        if v35 ~= nil and (v35.targetX + u22) - 0.45 <= v35.crossX and v35.crossX <= (v35.targetX + u22) + 2.4 then
            if u23 ~= "freeze" then
                u11 = true
            else
                u23 = "none"
                u13 = jitteredDelay_upv_1(random_upv_1, 0.4, 0.2)
            end
            return nil
        end
        local v36 = (((v32 - ceilingY_upv_1) > 3) and 14) or 2
        if ceilingY_upv_1 >= v32 + 1.5 or flapVelocity_upv_1 >= v36 then
            return
        end
        if u23 == "freeze" and v33 < 12 then
            u23 = "none"
            u13 = jitteredDelay_upv_1(random_upv_1, 0.4, 0.2)
            return nil
        end
        if v35 ~= nil and u4 < v35.targetX + FLAPPY_BASKET_CONFIG_upv_1.rimOpening and (v35.targetX + u22) + 2.4 < v35.crossX then
            return nil
        end
        u11 = true
    end
    local function u27(a8)
        --[[
          line: 346
          upvalues:
            cruiseSpeedX_upv_1 (ref,  index: 1)
            flapVelocity_upv_1 (ref,  index: 2)
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 3)
            u6 (ref,  index: 4)
            u5 (ref,  index: 5)
            u19 (ref,  index: 6)
            u20 (ref,  index: 7)
            u4 (ref,  index: 8)
            ceilingY_upv_1 (ref,  index: 9)
            u18 (copy, index: 10)
            u21 (ref,  index: 11)
            jitterNormal_upv_1 (copy, index: 12)
            random_upv_1 (copy, index: 13)
            u1 (copy, index: 14)
            u22 (ref,  index: 15)
            u23 (ref,  index: 16)
            chance_upv_1 (copy, index: 17)
        ]]
        local v37 = math.abs(cruiseSpeedX_upv_1) / math.max(math.abs(flapVelocity_upv_1), 5)
        local v38 = FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 - (FLAPPY_BASKET_CONFIG_upv_1.ballRadius + FLAPPY_BASKET_CONFIG_upv_1.rimTubeRadius) * math.sqrt((v37 * v37) + 1)
        if math.abs(a8) >= v38 then
            u6 = 0
            u5 = u5 + 1
        else
            u6 = u6 + 1
            u5 = u5 + (u6 + 1)
        end
        u20.prevLocalY = -(u4 - u19.centerX) * math.sin(-u19.tiltRadians) + ((ceilingY_upv_1 - u19.centerY) * math.cos(-u19.tiltRadians))
        u20 = u18()
        u21 = jitterNormal_upv_1(random_upv_1, u1.aimJitterStuds)
        u22 = jitterNormal_upv_1(random_upv_1, u1.aimJitterStuds)
        u23 = "none"
        if chance_upv_1(random_upv_1, u1.blunderPerHoop) then
            local v39 = chance_upv_1(random_upv_1, 0.5) and "freeze" or "doubleFlap"
            u23 = v39
        end
    end
    local function u28(a9)
        --[[
          line: 366
          upvalues:
            u7 (ref,  index: 1)
            u13 (ref,  index: 2)
            u14 (ref,  index: 3)
            u11 (ref,  index: 4)
            u15 (ref,  index: 5)
            u12 (ref,  index: 6)
            jitteredDelay_upv_1 (copy, index: 7)
            random_upv_1 (copy, index: 8)
            u1 (copy, index: 9)
            u26 (copy, index: 10)
            flapVelocity_upv_1 (ref,  index: 11)
            FLAPPY_BASKET_CONFIG_upv_1 (copy, index: 12)
            cruiseSpeedX_upv_1 (ref,  index: 13)
            u4 (ref,  index: 14)
            ceilingY_upv_1 (ref,  index: 15)
            u17 (copy, index: 16)
            u19 (ref,  index: 17)
            u20 (ref,  index: 18)
            u27 (copy, index: 19)
            u10 (ref,  index: 20)
        ]]
        if u7 then
            return nil
        end
        if u13 <= 0 then
            if u14 > 0 then
                u14 = u14 - a9
                if u14 <= 0 then
                    u11 = true
                end
            end
            if u15 > 0 then
                u15 = u15 - a9
                if u15 <= 0 then
                    u11 = true
                end
            end
            u12 = u12 - a9
            if u12 <= 0 then
                u12 = jitteredDelay_upv_1(random_upv_1, u1.decisionPeriod, 0.3)
                u26()
            end
        else
            u13 = u13 - a9
        end
        if u11 then
            u11 = false
            flapVelocity_upv_1 = FLAPPY_BASKET_CONFIG_upv_1.flapVelocity
        end
        flapVelocity_upv_1 = math.max(flapVelocity_upv_1 + (FLAPPY_BASKET_CONFIG_upv_1.gravity * a9), FLAPPY_BASKET_CONFIG_upv_1.terminalVelocity)
        cruiseSpeedX_upv_1 = math.clamp(cruiseSpeedX_upv_1 + math.clamp(FLAPPY_BASKET_CONFIG_upv_1.cruiseSpeedX - cruiseSpeedX_upv_1, -FLAPPY_BASKET_CONFIG_upv_1.cruiseRecoveryPerSecond * a9, FLAPPY_BASKET_CONFIG_upv_1.cruiseRecoveryPerSecond * a9), FLAPPY_BASKET_CONFIG_upv_1.minSpeedX, FLAPPY_BASKET_CONFIG_upv_1.maxSpeedX)
        u4 = u4 + (cruiseSpeedX_upv_1 * a9)
        ceilingY_upv_1 = ceilingY_upv_1 + (flapVelocity_upv_1 * a9)
        if FLAPPY_BASKET_CONFIG_upv_1.ceilingY < ceilingY_upv_1 then
            ceilingY_upv_1 = FLAPPY_BASKET_CONFIG_upv_1.ceilingY
            flapVelocity_upv_1 = math.min(flapVelocity_upv_1, 0)
        end
        if ceilingY_upv_1 - FLAPPY_BASKET_CONFIG_upv_1.ballRadius > FLAPPY_BASKET_CONFIG_upv_1.floorY then
            u17(u19, a9)
            u17(u20, a9)
            local v40 = -(u4 - u19.centerX) * math.sin(-u19.tiltRadians) + (ceilingY_upv_1 - u19.centerY) * math.cos(-u19.tiltRadians)
            local v41 = (u4 - u19.centerX) * math.cos(-u19.tiltRadians) + (ceilingY_upv_1 - u19.centerY) * math.sin(-u19.tiltRadians)
            if u19.prevLocalY > 0 and v40 <= 0 and math.abs(v41) < FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 then
                u27(v41)
                return nil
            end
            u19.prevLocalY = v40
            if u10 == nil and (u19.centerX + (FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2)) + FLAPPY_BASKET_CONFIG_upv_1.missMarginStuds < u4 - FLAPPY_BASKET_CONFIG_upv_1.ballRadius then
                local _ = u19.centerX + FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2
                u10 = math.max(math.min(u19.centerX + FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 + FLAPPY_BASKET_CONFIG_upv_1.missWallDistanceStuds, u20.centerX - FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 - 1), u19.centerX + FLAPPY_BASKET_CONFIG_upv_1.rimOpening / 2 + FLAPPY_BASKET_CONFIG_upv_1.missWallMinDistanceStuds)
            end
            if u10 ~= nil and u10 <= u4 + FLAPPY_BASKET_CONFIG_upv_1.ballRadius then
                u7 = true
            end
        else
            u7 = true
            return nil
        end
    end
    local tbl_7 = {}
    tbl_7.step = function(a10, a11)
        --[[
          name: step
          line: 436
          upvalues:
            u7 (ref,  index: 1)
            u3 (copy, index: 2)
            u28 (copy, index: 3)
        ]]
        if u7 then
            return nil
        end
        u3:step(a11, u28)
    end
    tbl_7.snapshot = function(a12)
        --[[
          name: snapshot
          line: 442
          upvalues:
            u5 (ref, index: 1)
            ceilingY_upv_1 (ref, index: 2)
            u4 (ref, index: 3)
            u19 (ref, index: 4)
            u6 (ref, index: 5)
        ]]
        local tbl_8 = {}
        tbl_8.score = u5
        tbl_8.values = {ceilingY_upv_1, u4, u19.centerX - u4, u19.centerY, u6}
        return tbl_8
    end
    tbl_7.isDead = function(a13)
        --[[
          name: isDead
          line: 449
          upvalues:
            u7 (ref, index: 1)
        ]]
        return u7
    end
    tbl_7.score = function(a14)
        --[[
          name: score
          line: 452
          upvalues:
            u5 (ref, index: 1)
        ]]
        return u5
    end
    return tbl_7
end
return tbl_1