-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local STACK_BALL_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "stack-ball", "stack-ball-config").STACK_BALL_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "stack-ball", "stack-ball-tower")
local levelSpecFor_upv_1 = v1.levelSpecFor
local ringAddressFor_upv_1 = v1.ringAddressFor
local ringPatternFor_upv_1 = v1.ringPatternFor
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target")
local normalizeAngle_upv_1 = v2.normalizeAngle
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v3.chance
local jitterNormal_upv_1 = v3.jitterNormal
local SubStepper_upv_1 = v3.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local u1 = v2.TAU / STACK_BALL_CONFIG_upv_1.segmentsPerRing
local u2 = STACK_BALL_CONFIG_upv_1.rotationSpeedMax * 2 / STACK_BALL_CONFIG_upv_1.rotationTurnaroundSeconds
local tbl_1 = {}
tbl_1.createStackBallBot = function(a1)
    --[[
      name: createStackBallBot
      line: 54
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        levelSpecFor_upv_1 (copy, index: 2)
        ringPatternFor_upv_1 (copy, index: 3)
        ringAddressFor_upv_1 (copy, index: 4)
        normalizeAngle_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        STACK_BALL_CONFIG_upv_1 (copy, index: 7)
        jitterNormal_upv_1 (copy, index: 8)
        chance_upv_1 (copy, index: 9)
        u2 (copy, index: 10)
        SubStepper_upv_1 (copy, index: 11)
    ]]
    local u3 = BOT_TUNING_upv_1["stack-ball"][a1.difficulty]
    local random_upv_1 = a1.random
    local seed_upv_1 = a1.seed
    local u4 = 0
    local u5 = 0
    local u6 = 0
    local bounceVelocity_upv_1 = 0
    local u7 = 1
    local u8 = levelSpecFor_upv_1(seed_upv_1, 1, 6)
    local u9 = -1
    local u10 = 0
    local u11 = 0
    local u12 = 0
    local u13 = 0
    local u14 = false
    local u15 = false
    local u16 = 0
    local u17 = false
    local u18 = true
    local u19 = false
    local tbl_upv_2 = {}
    local function patternFor_1(a2)
        --[[
          name: patternFor
          line: 86
          upvalues:
            tbl_upv_2 (copy, index: 1)
            ringPatternFor_upv_1 (copy, index: 2)
            seed_upv_1 (copy, index: 3)
            ringAddressFor_upv_1 (copy, index: 4)
        ]]
        local v4 = tbl_upv_2[a2]
        if v4 == nil then
            local v5 = ringPatternFor_upv_1(seed_upv_1, a2, ringAddressFor_upv_1(a2))
            tbl_upv_2[a2] = v5
            return v5
        end
        return v4
    end
    local function wedgeAt_upv_1(a3, a4)
        --[[
          name: wedgeAt
          line: 98
          upvalues:
            normalizeAngle_upv_1 (copy, index: 1)
            u1 (copy, index: 2)
            STACK_BALL_CONFIG_upv_1 (copy, index: 3)
            u8 (ref,  index: 4)
        ]]
        local v6 = normalizeAngle_upv_1(0 - a4) / u1
        local segmentsPerRing_1 = STACK_BALL_CONFIG_upv_1.segmentsPerRing
        local v7 = math.clamp(math.floor(v6), 0, segmentsPerRing_1 - 1)
        local v8 = a3[v7 + 1]
        local v9, v10 = nil, nil
        if v8 == "black" then
            v9 = 0.032 * u8.rotationSpeed / u1
            v10 = v6 - math.floor(v6)
            if v10 < v9 and a3[(((v7 - 1) + segmentsPerRing_1) % segmentsPerRing_1) + 1] == "paint" or 1 - v9 < v10 and a3[((v7 + 1) % segmentsPerRing_1) + 1] == "paint" then
                return "paint"
            end
            return "black"
        end
        return v8
    end
    local function surfaceOf_1(a5)
        --[[
          name: surfaceOf
          line: 116
          upvalues:
            STACK_BALL_CONFIG_upv_1 (copy, index: 1)
        ]]
        return (-(a5 + 1) * STACK_BALL_CONFIG_upv_1.ringSpacing) + (STACK_BALL_CONFIG_upv_1.ringHeight / 2)
    end
    local function readsClear_upv_1()
        --[[
          name: readsClear
          line: 126
          upvalues:
            u14 (ref,  index: 1)
            STACK_BALL_CONFIG_upv_1 (copy, index: 2)
            u9 (ref,  index: 3)
            u6 (ref,  index: 4)
            u3 (copy, index: 5)
            jitterNormal_upv_1 (copy, index: 6)
            random_upv_1 (copy, index: 7)
            u4 (ref,  index: 8)
            u8 (ref,  index: 9)
            wedgeAt_upv_1 (copy, index: 10)
            tbl_upv_2 (copy, index: 11)
            ringPatternFor_upv_1 (copy, index: 12)
            seed_upv_1 (copy, index: 13)
            ringAddressFor_upv_1 (copy, index: 14)
            chance_upv_1 (copy, index: 15)
        ]]
        local v11
        if u14 then
            v11 = STACK_BALL_CONFIG_upv_1.fireSmashSpeed
        else
            v11 = STACK_BALL_CONFIG_upv_1.smashSpeed
        end
        local v12 = u9 + 1
        local v13 = 0
        local v14 = false
        local v15 = nil
        while true do
            if v14 then
                v13 = v13 + 1
            else
                v14 = true
            end
            local v16 = nil
            if v13 >= u3.lookAheadRings then
                return true
            else
                local v17 = ((u6 - (STACK_BALL_CONFIG_upv_1.ballDiameter / 2)) - ((-(v12 + 1) * STACK_BALL_CONFIG_upv_1.ringSpacing) + (STACK_BALL_CONFIG_upv_1.ringHeight / 2)) + (v13 * STACK_BALL_CONFIG_upv_1.ringSpacing)) / v11 + jitterNormal_upv_1(random_upv_1, u3.timingSigmaSeconds)
                local v18 = v12 + v13
                v16 = tbl_upv_2[v18]
                if v16 == nil then
                    local v19 = ringPatternFor_upv_1(seed_upv_1, v18, ringAddressFor_upv_1(v18))
                    tbl_upv_2[v18] = v19
                    v15 = v19
                else
                    v15 = v16
                end
            end
            if wedgeAt_upv_1(v15, u4 + ((u8.direction * u8.rotationSpeed) * v17)) == "black" then
                break
            end
        end
        local v20 = false
        if v13 > 0 then
            v20 = chance_upv_1(random_upv_1, u3.commitGreed)
        end
        return v20
    end
    local function decideHold_1()
        --[[
          name: decideHold
          line: 154
          upvalues:
            u14 (ref,  index: 1)
            u15 (ref,  index: 2)
            u19 (ref,  index: 3)
            u12 (ref,  index: 4)
            u3 (copy, index: 5)
            u18 (ref,  index: 6)
            readsClear_upv_1 (copy, index: 7)
        ]]
        if u14 then
            u15 = true
            return nil
        elseif u19 then
            u15 = false
            return nil
        elseif u3.maxChainRings > u12 then
            if u18 then
                u15 = readsClear_upv_1()
            else
                u15 = true
                return nil
            end
        else
            u19 = true
            u19 = false
            return nil
        end
    end
    local function smash_upv_1(a6)
        --[[
          name: smash
          line: 177
          upvalues:
            ringAddressFor_upv_1 (copy, index: 1)
            u10 (ref,  index: 2)
            u12 (ref,  index: 3)
            STACK_BALL_CONFIG_upv_1 (copy, index: 4)
            u11 (ref,  index: 5)
            u14 (ref,  index: 6)
            u13 (ref,  index: 7)
            u9 (ref,  index: 8)
            u7 (ref,  index: 9)
            u8 (ref,  index: 10)
            levelSpecFor_upv_1 (copy, index: 11)
            seed_upv_1 (copy, index: 12)
            u18 (ref,  index: 13)
            chance_upv_1 (copy, index: 14)
            random_upv_1 (copy, index: 15)
            u3 (copy, index: 16)
        ]]
        local v21 = ringAddressFor_upv_1(a6)
        u10 = u10 + math.min(math.floor(u12 / STACK_BALL_CONFIG_upv_1.chainSmashesPerTier) + 1, STACK_BALL_CONFIG_upv_1.chainMultiplierMax)
        u11 = u11 + 1
        u12 = u12 + 1
        if not (u14) and u12 >= 2 then
            u13 = math.min(u13 + STACK_BALL_CONFIG_upv_1.fireChargePerSmash, 1)
            if u13 >= 1 then
                u14 = true
            end
        end
        u9 = a6
        if v21.isFloor then
            u7 = v21.level + 1
            u8 = levelSpecFor_upv_1(seed_upv_1, v21.level + 1, 6)
        end
        u18 = not chance_upv_1(random_upv_1, u3.lapseChance)
    end
    local function tick_upv_1(a7)
        --[[
          name: tick
          line: 197
          upvalues:
            u17 (ref,  index: 1)
            u16 (ref,  index: 2)
            u14 (ref,  index: 3)
            u15 (ref,  index: 4)
            u19 (ref,  index: 5)
            u12 (ref,  index: 6)
            u3 (copy, index: 7)
            u18 (ref,  index: 8)
            readsClear_upv_1 (copy, index: 9)
            u8 (ref,  index: 10)
            u2 (copy, index: 11)
            u5 (ref,  index: 12)
            u4 (ref,  index: 13)
            normalizeAngle_upv_1 (copy, index: 14)
            u6 (ref,  index: 15)
            bounceVelocity_upv_1 (ref,  index: 16)
            STACK_BALL_CONFIG_upv_1 (copy, index: 17)
            u13 (ref,  index: 18)
            u9 (ref,  index: 19)
            chance_upv_1 (copy, index: 20)
            random_upv_1 (copy, index: 21)
            wedgeAt_upv_1 (copy, index: 22)
            tbl_upv_2 (copy, index: 23)
            ringPatternFor_upv_1 (copy, index: 24)
            seed_upv_1 (copy, index: 25)
            ringAddressFor_upv_1 (copy, index: 26)
            smash_upv_1 (copy, index: 27)
        ]]
        if not u17 then
            u16 = u16 + a7
            local v22 = nil
            if u16 <= 900 then
                if u14 then
                    u15 = true
                elseif u19 then
                    u15 = false
                elseif u3.maxChainRings > u12 then
                    u15 = ((not u18) and true) or (readsClear_upv_1())
                else
                    u19 = true
                    u19 = false
                end
                local v23 = u2 * a7
                u5 = u5 + math.clamp((u8.direction * u8.rotationSpeed) - u5, -v23, v23)
                u4 = normalizeAngle_upv_1(u4 + (u5 * a7))
                local v24
                if u15 then
                    if u14 then
                        v24 = -STACK_BALL_CONFIG_upv_1.fireSmashSpeed
                    else
                        v24 = -STACK_BALL_CONFIG_upv_1.smashSpeed
                    end
                    bounceVelocity_upv_1 = v24
                else
                    v24 = bounceVelocity_upv_1 + STACK_BALL_CONFIG_upv_1.gravity * a7
                    if v24 < -55 then
                        v22 = math.min(bounceVelocity_upv_1 + (220 * a7), -55)
                    else
                        v22 = v24
                    end
                    bounceVelocity_upv_1 = v22
                    if u12 > 0 then
                        u12 = 0
                    end
                end
                if u14 then
                    u13 = u13 - (STACK_BALL_CONFIG_upv_1.fireBurnDrainPerSecond * a7)
                    if u13 <= 0 then
                        u13 = 0
                        u13 = false
                    end
                elseif not (u15) or bounceVelocity_upv_1 >= 0 then
                    u13 = math.max(u13 - (STACK_BALL_CONFIG_upv_1.fireIdleDrainPerSecond * a7), 0)
                end
                u6 = u6 + (bounceVelocity_upv_1 * a7)
                local v25 = u9 + 1
                v22 = -(v25 + 1) * STACK_BALL_CONFIG_upv_1.ringSpacing + STACK_BALL_CONFIG_upv_1.ringHeight / 2
                if v22 <= u6 - (STACK_BALL_CONFIG_upv_1.ballDiameter / 2) and u6 - (STACK_BALL_CONFIG_upv_1.ballDiameter / 2) < v22 then
                    if u15 then
                        local v26 = nil
                        if not (u14) then
                            v26 = tbl_upv_2[v25]
                            local v27
                            if v26 == nil then
                                local v28 = ringPatternFor_upv_1(seed_upv_1, v25, ringAddressFor_upv_1(v25))
                                tbl_upv_2[v25] = v28
                                v27 = v28
                            else
                                v27 = v26
                            end
                            if wedgeAt_upv_1(v27, u4) == "black" then
                                u17 = true
                                return nil
                            end
                        end
                        smash_upv_1(v25)
                        return
                    end
                    u6 = v22 + (STACK_BALL_CONFIG_upv_1.ballDiameter / 2)
                    bounceVelocity_upv_1 = STACK_BALL_CONFIG_upv_1.bounceVelocity
                    u19 = false
                    u18 = not chance_upv_1(random_upv_1, u3.lapseChance)
                    return nil
                end
            else
                u17 = true
            end
        end
        return nil
    end
    u6 = (-1 * STACK_BALL_CONFIG_upv_1.ringSpacing) + (STACK_BALL_CONFIG_upv_1.ringHeight / 2) + STACK_BALL_CONFIG_upv_1.ballDiameter / 2
    bounceVelocity_upv_1 = STACK_BALL_CONFIG_upv_1.bounceVelocity
    u5 = u8.direction * u8.rotationSpeed
    local u20 = SubStepper_upv_1.new(0.008333333333333333)
    local tbl_3 = {}
    tbl_3.step = function(a8, a9)
        --[[
          name: step
          line: 258
          upvalues:
            u17 (ref,  index: 1)
            u20 (copy, index: 2)
            tick_upv_1 (copy, index: 3)
        ]]
        if u17 then
            return nil
        end
        u20:step(a9, tick_upv_1)
    end
    tbl_3.snapshot = function(a10)
        --[[
          name: snapshot
          line: 264
          upvalues:
            u10 (ref, index: 1)
            u11 (ref, index: 2)
            u7 (ref, index: 3)
            u12 (ref, index: 4)
            u14 (ref, index: 5)
        ]]
        local tbl_4 = {}
        tbl_4.score = u10
        tbl_4.values = {u11, u7, u12, (u14 and 1) or 0}
        return tbl_4
    end
    tbl_3.isDead = function(a11)
        --[[
          name: isDead
          line: 270
          upvalues:
            u17 (ref, index: 1)
        ]]
        return u17
    end
    tbl_3.score = function(a12)
        --[[
          name: score
          line: 273
          upvalues:
            u10 (ref, index: 1)
        ]]
        return u10
    end
    return tbl_3
end
return tbl_1