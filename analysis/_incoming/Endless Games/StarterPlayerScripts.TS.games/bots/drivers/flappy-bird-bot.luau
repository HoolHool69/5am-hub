-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local FLAPPY_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "flappy-bird", "flappy-config").FLAPPY_CONFIG
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v1.chance
local jitteredDelay_upv_1 = v1.jitteredDelay
local jitterNormal_upv_1 = v1.jitterNormal
local SubStepper_upv_1 = v1.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local u1 = FLAPPY_CONFIG_upv_1.birdX + FLAPPY_CONFIG_upv_1.birdHitOffsetX
local u2 = FLAPPY_CONFIG_upv_1.flapVelocity * FLAPPY_CONFIG_upv_1.flapVelocity / (2 * -FLAPPY_CONFIG_upv_1.gravity)
local u3 = FLAPPY_CONFIG_upv_1.pipeWidth / 2 + FLAPPY_CONFIG_upv_1.birdHitHalfWidth
local u4 = 2 * FLAPPY_CONFIG_upv_1.flapVelocity / -FLAPPY_CONFIG_upv_1.gravity
local tbl_1 = {}
tbl_1.createFlappyBirdBot = function(a1)
    --[[
      name: createFlappyBirdBot
      line: 46
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        SubStepper_upv_1 (copy, index: 3)
        FLAPPY_CONFIG_upv_1 (copy, index: 4)
        jitteredDelay_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        u3 (copy, index: 7)
        jitterNormal_upv_1 (copy, index: 8)
        chance_upv_1 (copy, index: 9)
        u2 (copy, index: 10)
        u4 (copy, index: 11)
    ]]
    local random_upv_1 = a1.random
    local u5 = BOT_TUNING_upv_1["flappy-bird"][a1.difficulty]
    local u6 = deriveRandom_upv_1(a1.seed, 0)
    local u7 = SubStepper_upv_1.new(0.008333333333333333)
    local tbl_upv_2 = {}
    local ceilingY_upv_1 = 0
    local flapVelocity_upv_1 = FLAPPY_CONFIG_upv_1.flapVelocity * 0.6
    local u8 = 0
    local u9 = false
    local u10 = false
    local u11 = jitteredDelay_upv_1(random_upv_1, u5.decisionPeriod, 0.3)
    local u12 = 0
    local u13 = nil
    local u14 = nil
    local u15 = 0
    local openingHeadStartStuds_1 = FLAPPY_CONFIG_upv_1.openingHeadStartStuds
    local v2 = FLAPPY_CONFIG_upv_1.pipeSpacing * 0.5
    local u16
    local u18
    while v2 <= openingHeadStartStuds_1 do
        if FLAPPY_CONFIG_upv_1.pipePoolSize > #tbl_upv_2 then
            u18 = u6:NextNumber(FLAPPY_CONFIG_upv_1.gapCenterMin, FLAPPY_CONFIG_upv_1.gapCenterMax)
            local tbl_3 = {}
            tbl_3.x = FLAPPY_CONFIG_upv_1.spawnX
            tbl_3.gapCenterY = u18
            table.insert(tbl_upv_2, tbl_3)
            u16 = tbl_3
        else
            u16 = nil
        end
        if u16 ~= nil then
            u16.x = FLAPPY_CONFIG_upv_1.spawnX - (openingHeadStartStuds_1 - v2)
        end
        v2 = v2 + FLAPPY_CONFIG_upv_1.pipeSpacing
    end
    local u17 = openingHeadStartStuds_1 - (v2 - FLAPPY_CONFIG_upv_1.pipeSpacing)
    u16 = function()
        --[[
          line: 100
          upvalues:
            u1 (copy, index: 1)
            u3 (copy, index: 2)
            tbl_upv_2 (copy, index: 3)
            u14 (ref,  index: 4)
            u13 (ref,  index: 5)
            u15 (ref,  index: 6)
            jitterNormal_upv_1 (copy, index: 7)
            random_upv_1 (copy, index: 8)
            u5 (copy, index: 9)
            chance_upv_1 (copy, index: 10)
            u12 (ref,  index: 11)
            jitteredDelay_upv_1 (copy, index: 12)
        ]]
        local v4 = nil
        for _, value_1 in tbl_upv_2 do
            if u1 - u3 >= value_1.x then
                continue
            end
            if v4 == nil or value_1.x < v4.x then
                v4 = value_1
            end
        end
        local v5 = nil
        local v6
        if v4 == nil then
            v6 = v5
        else
            v6 = v5
            for _, value_2 in tbl_upv_2 do
                if v4.x + 0.1 >= value_2.x then
                    continue
                end
                if v6 == nil or value_2.x < v6.x then
                    v6 = value_2
                end
            end
        end
        u14 = v6
        if v4 ~= u13 and v4 ~= nil then
            u13 = v4
            u15 = jitterNormal_upv_1(random_upv_1, u5.aimJitterStuds)
            if chance_upv_1(random_upv_1, u5.blunderPerPipe) then
                u12 = jitteredDelay_upv_1(random_upv_1, 0.4, 0.25)
            end
            return
        end
        return nil
    end
    u18 = function()
        --[[
          line: 130
          upvalues:
            u13 (ref,  index: 1)
            FLAPPY_CONFIG_upv_1 (copy, index: 2)
            u15 (ref,  index: 3)
            u2 (copy, index: 4)
            u14 (ref,  index: 5)
            u1 (copy, index: 6)
            u3 (copy, index: 7)
            flapVelocity_upv_1 (ref,  index: 8)
            ceilingY_upv_1 (ref,  index: 9)
            u5 (copy, index: 10)
            u10 (ref,  index: 11)
            u4 (copy, index: 12)
        ]]
        local v7 = ((((u13 == nil) and 0) or (u13.gapCenterY)) - FLAPPY_CONFIG_upv_1.birdHitOffsetY) + u15 - u2 / 2
        local v17 = nil
        if u13 ~= nil and u14 ~= nil then
            v17 = math.abs(u13.x - u1) < u3 + 1
            local v9 = nil
            if v17 then
                v9 = u14.gapCenterY - u13.gapCenterY
                if v9 <= 3 then
                    if v9 < -3 then
                        local v10, v11 = nil, nil
                        if flapVelocity_upv_1 < 0 then
                            v10 = (u13.x - (u1 - u3)) / FLAPPY_CONFIG_upv_1.scrollSpeed
                            v11 = FLAPPY_CONFIG_upv_1.gapHeight / 2 - FLAPPY_CONFIG_upv_1.birdHitHalfHeight
                            local v12 = nil
                            if ((u13.gapCenterY - FLAPPY_CONFIG_upv_1.birdHitOffsetY) - v11) + 0.15 >= (ceilingY_upv_1 + (flapVelocity_upv_1 * v10)) + (((0.5 * FLAPPY_CONFIG_upv_1.gravity) * v10) * v10) then
                                v12 = ceilingY_upv_1 - ((((u13.gapCenterY - FLAPPY_CONFIG_upv_1.birdHitOffsetY) - v11) + 0.3) + (-FLAPPY_CONFIG_upv_1.terminalVelocity * ((u5.decisionPeriod * 0.5) + 0.008333333333333333)))
                                local v13 = nil
                                if v12 > 0 then
                                    local v14 = -FLAPPY_CONFIG_upv_1.gravity
                                    v13 = (flapVelocity_upv_1 + math.sqrt((flapVelocity_upv_1 * flapVelocity_upv_1) + ((2 * v14) * v12))) / v14
                                    if v13 > u5.decisionPeriod then
                                        local v15 = false
                                        if v13 < v10 then
                                            v15 = v10 - v13 < u4 * 0.55
                                        end
                                        local v16 = u4 * 0.55 <= v10
                                        if v15 and v16 and ceilingY_upv_1 + u2 <= ((u13.gapCenterY - FLAPPY_CONFIG_upv_1.birdHitOffsetY) + v11) - 0.3 then
                                            u10 = true
                                        end
                                    else
                                        u10 = true
                                    end
                                else
                                    u10 = true
                                end
                            end
                        end
                        return nil
                    end
                else
                    v7 = u13.gapCenterY - FLAPPY_CONFIG_upv_1.birdHitOffsetY + ((((FLAPPY_CONFIG_upv_1.gapHeight / 2) - FLAPPY_CONFIG_upv_1.birdHitHalfHeight) - 0.35) - u2)
                end
            end
        end
        if flapVelocity_upv_1 < 0 then
            v17 = u5.decisionPeriod * 0.5
            if (ceilingY_upv_1 + (flapVelocity_upv_1 * v17)) + (((0.5 * FLAPPY_CONFIG_upv_1.gravity) * v17) * v17) < v7 then
                u10 = true
            end
        else
            if (ceilingY_upv_1 + ((flapVelocity_upv_1 * flapVelocity_upv_1) / (2 * -FLAPPY_CONFIG_upv_1.gravity))) + u2 < v7 then
                u10 = true
            end
            return nil
        end
    end
    local function u20(a2)
        --[[
          line: 220
          upvalues:
            u9 (ref,  index: 1)
            u12 (ref,  index: 2)
            u11 (ref,  index: 3)
            jitteredDelay_upv_1 (copy, index: 4)
            random_upv_1 (copy, index: 5)
            u5 (copy, index: 6)
            u18 (copy, index: 7)
            u10 (ref,  index: 8)
            flapVelocity_upv_1 (ref,  index: 9)
            FLAPPY_CONFIG_upv_1 (copy, index: 10)
            ceilingY_upv_1 (ref,  index: 11)
            BOT_TUNING_upv_1 (ref,  index: 12)
            u17 (ref,  index: 13)
            tbl_upv_2 (copy, index: 14)
            u6 (copy, index: 15)
            u8 (ref,  index: 16)
            u1 (copy, index: 17)
            u16 (copy, index: 18)
        ]]
        if u9 then
            return nil
        else
            if u12 <= 0 then
                u11 = u11 - a2
                if u11 <= 0 then
                    u11 = jitteredDelay_upv_1(random_upv_1, u5.decisionPeriod, 0.3)
                    u18()
                end
            else
                u12 = u12 - a2
            end
            if u10 then
                u10 = false
                flapVelocity_upv_1 = FLAPPY_CONFIG_upv_1.flapVelocity
            end
            flapVelocity_upv_1 = math.max(flapVelocity_upv_1 + (FLAPPY_CONFIG_upv_1.gravity * a2), FLAPPY_CONFIG_upv_1.terminalVelocity)
            ceilingY_upv_1 = ceilingY_upv_1 + (flapVelocity_upv_1 * a2)
            if FLAPPY_CONFIG_upv_1.ceilingY < ceilingY_upv_1 then
                ceilingY_upv_1 = FLAPPY_CONFIG_upv_1.ceilingY
            end
            local v18 = FLAPPY_CONFIG_upv_1.scrollSpeed * a2
            BOT_TUNING_upv_1 = BOT_TUNING_upv_1 + v18
            u17 = u17 + v18
            if FLAPPY_CONFIG_upv_1.pipeSpacing <= u17 then
                u17 = u17 - FLAPPY_CONFIG_upv_1.pipeSpacing
                if FLAPPY_CONFIG_upv_1.pipePoolSize > #tbl_upv_2 then
                    table.insert(tbl_upv_2, {x = FLAPPY_CONFIG_upv_1.spawnX, gapCenterY = u6:NextNumber(FLAPPY_CONFIG_upv_1.gapCenterMin, FLAPPY_CONFIG_upv_1.gapCenterMax)})
                end
            end
            local v19 = ceilingY_upv_1 + FLAPPY_CONFIG_upv_1.birdHitOffsetY
            for _, value_3 in tbl_upv_2 do
                value_3.x = value_3.x - v18
                if not (value_3.scored) and value_3.x < FLAPPY_CONFIG_upv_1.birdX then
                    value_3.scored = true
                    u8 = u8 + 1
                end
                if math.abs(value_3.x - u1) >= (FLAPPY_CONFIG_upv_1.pipeWidth / 2) + FLAPPY_CONFIG_upv_1.birdHitHalfWidth then
                    continue
                end
                if value_3.gapCenterY + (FLAPPY_CONFIG_upv_1.gapHeight / 2) < v19 + FLAPPY_CONFIG_upv_1.birdHitHalfHeight or v19 - FLAPPY_CONFIG_upv_1.birdHitHalfHeight < value_3.gapCenterY - (FLAPPY_CONFIG_upv_1.gapHeight / 2) then
                    u9 = true
                    return nil
                end
            end
            local v20 = tbl_upv_2[1]
            while v20 ~= nil and v20.x < FLAPPY_CONFIG_upv_1.despawnX do
                table.remove(tbl_upv_2, 1)
                v20 = tbl_upv_2[1]
            end
            if v19 - FLAPPY_CONFIG_upv_1.birdHitHalfHeight > FLAPPY_CONFIG_upv_1.groundY then
                u16()
            else
                u9 = true
                return nil
            end
        end
    end
    u16()
    local tbl_4 = {}
    tbl_4.step = function(a3, a4)
        --[[
          name: step
          line: 282
          upvalues:
            u9 (ref,  index: 1)
            u7 (copy, index: 2)
            u20 (copy, index: 3)
        ]]
        if u9 then
            return nil
        end
        u7:step(a4, u20)
    end
    tbl_4.snapshot = function(a5)
        --[[
          name: snapshot
          line: 288
          upvalues:
            ceilingY_upv_1 (ref,  index: 1)
            BOT_TUNING_upv_1 (ref,  index: 2)
            FLAPPY_CONFIG_upv_1 (copy, index: 3)
            tbl_upv_2 (copy, index: 4)
            u8 (ref,  index: 5)
        ]]
        local tbl_5 = {}
        table.insert(tbl_5, ceilingY_upv_1)
        table.insert(tbl_5, BOT_TUNING_upv_1)
        local tbl_6 = {}
        local v21 = 0
        for _, value_4 in tbl_upv_2 do
            if (FLAPPY_CONFIG_upv_1.birdX - 6) < value_4.x == true then
                local v22 = v21 + 1
                tbl_6[v22] = value_4
                v21 = v22
            end
        end
        table.sort(
            tbl_6,
            function(a6, a7)
                --[[
                  line: 310
                ]]
                return a6.x < a7.x
            end
        )
        local v23 = tbl_6[1]
        if v23 ~= nil then
            table.insert(tbl_5, v23.x - FLAPPY_CONFIG_upv_1.birdX)
            table.insert(tbl_5, v23.gapCenterY)
            local v24 = tbl_6[2]
            if v24 ~= nil then
                table.insert(tbl_5, v24.x - FLAPPY_CONFIG_upv_1.birdX)
                table.insert(tbl_5, v24.gapCenterY)
            end
        end
        local tbl_7 = {}
        tbl_7.score = u8
        tbl_7.values = tbl_5
        return tbl_7
    end
    tbl_4.isDead = function(a8)
        --[[
          name: isDead
          line: 331
          upvalues:
            u9 (ref, index: 1)
        ]]
        return u9
    end
    tbl_4.score = function(a9)
        --[[
          name: score
          line: 334
          upvalues:
            u8 (ref, index: 1)
        ]]
        return u8
    end
    return tbl_4
end
return tbl_1