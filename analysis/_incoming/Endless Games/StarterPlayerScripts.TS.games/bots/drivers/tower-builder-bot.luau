-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TOWER_BUILDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "tower-builder", "tower-builder-config").TOWER_BUILDER_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "tower-builder", "tower-builder-drop")
local ropeAngularVelocity_upv_1 = v1.ropeAngularVelocity
local settledDropHeight_upv_1 = v1.settledDropHeight
local solveDrop_upv_1 = v1.solveDrop
local swayAmplitudeFor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "tower-builder", "tower-builder-sway").swayAmplitudeFor
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v2.chance
local jitterNormal_upv_1 = v2.jitterNormal
local SubStepper_upv_1 = v2.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local u1 = math.sqrt((2 * TOWER_BUILDER_CONFIG_upv_1.dropDistance) / TOWER_BUILDER_CONFIG_upv_1.dropGravity)
local tbl_1 = {}
tbl_1.createTowerBuilderBot = function(a1)
    --[[
      name: createTowerBuilderBot
      line: 43
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        SubStepper_upv_1 (copy, index: 3)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 4)
        solveDrop_upv_1 (copy, index: 5)
        ropeAngularVelocity_upv_1 (copy, index: 6)
        settledDropHeight_upv_1 (copy, index: 7)
        u1 (copy, index: 8)
        chance_upv_1 (copy, index: 9)
        jitterNormal_upv_1 (copy, index: 10)
        swayAmplitudeFor_upv_1 (copy, index: 11)
    ]]
    local random_upv_1 = a1.random
    local u2 = BOT_TUNING_upv_1["tower-builder"][a1.difficulty]
    local v3 = deriveRandom_upv_1(a1.seed, 0)
    local u3 = v3:NextNumber(0.37, 1024.37)
    local u4 = v3:NextNumber(0.37, 1024.37)
    local u5 = SubStepper_upv_1.new(0.008333333333333333)
    local u6 = math.sin(TOWER_BUILDER_CONFIG_upv_1.swingAmplitudeRadians - TOWER_BUILDER_CONFIG_upv_1.windMaxJitterRadians) * TOWER_BUILDER_CONFIG_upv_1.ropeLength - 0.5
    local tbl_upv_2 = {}
    local u7 = 0
    local u8 = 0
    local u9 = 0
    local u10 = 0
    local respawnDelaySeconds_upv_1 = 0
    local u11 = false
    local u12 = 0
    local durationSeconds_upv_1 = 0
    local landingX_upv_1 = 0
    local u13 = 0
    local u14 = (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2) + TOWER_BUILDER_CONFIG_upv_1.ropeLength + TOWER_BUILDER_CONFIG_upv_1.dropDistance
    local u15 = 0
    local u16 = 0
    local u17 = 0
    local u18 = 0
    local u19 = 0
    local u20 = false
    local u21 = false
    local u22 = 0
    local u23 = nil
    local function u24()
        --[[
          line: 119
          upvalues:
            TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
            u8 (ref,  index: 2)
            u7 (ref,  index: 3)
            u13 (ref,  index: 4)
            u3 (copy, index: 5)
            u4 (copy, index: 6)
            u14 (ref,  index: 7)
            ropeAngularVelocity_upv_1 (copy, index: 8)
            solveDrop_upv_1 (copy, index: 9)
        ]]
        local v4 = TOWER_BUILDER_CONFIG_upv_1.swingAmplitudeRadians * math.sin(u8)
        local v5 = math.clamp((u13 - TOWER_BUILDER_CONFIG_upv_1.windStartFloor) / TOWER_BUILDER_CONFIG_upv_1.windRampFloors, 0, 1)
        local v6 = ((v5 > 0) and (v5 * TOWER_BUILDER_CONFIG_upv_1.windMaxJitterRadians * math.clamp(math.noise((u7 * TOWER_BUILDER_CONFIG_upv_1.windFrequencyHz) + u3, u4), -1, 1))) or 0
        local v7 = v4 + v6
        local v8 = math.cos(v7)
        return solveDrop_upv_1(v7, ropeAngularVelocity_upv_1(u8, math.max(TOWER_BUILDER_CONFIG_upv_1.swingPeriodMinSeconds, TOWER_BUILDER_CONFIG_upv_1.swingPeriodBaseSeconds - (TOWER_BUILDER_CONFIG_upv_1.swingPeriodDecayPerFloor * u13))), (u14 - (v8 * TOWER_BUILDER_CONFIG_upv_1.ropeLength)) - ((u13 * TOWER_BUILDER_CONFIG_upv_1.blockHeight) + (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2)))
    end
    local function u25()
        --[[
          line: 142
          upvalues:
            TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
            u13 (ref,  index: 2)
            tbl_upv_2 (copy, index: 3)
            u15 (ref,  index: 4)
        ]]
        local v9 = 0
        local v10 = 0
        while v9 < TOWER_BUILDER_CONFIG_upv_1.maxFloorsShearedPerMiss and u13 > 1 do
            local v11 = tbl_upv_2[u13]
            v10 = v10 + math.abs(v11.centerX - tbl_upv_2[u13 - 1].centerX)
            if v10 <= TOWER_BUILDER_CONFIG_upv_1.shearOverhangThresholdFrac * TOWER_BUILDER_CONFIG_upv_1.blockWidth then
                break
            else
                u15 = u15 - v11.offsetAbs
                tbl_upv_2[#tbl_upv_2] = nil
                u13 = u13 - 1
                v9 = v9 + 1
            end
        end
    end
    local function u26()
        --[[
          line: 160
          upvalues:
            u11 (ref,  index: 1)
            u13 (ref,  index: 2)
            u10 (ref,  index: 3)
            u9 (ref,  index: 4)
            tbl_upv_2 (copy, index: 5)
            landingX_upv_1 (ref,  index: 6)
            TOWER_BUILDER_CONFIG_upv_1 (copy, index: 7)
            u17 (ref,  index: 8)
            u19 (ref,  index: 9)
            u18 (ref,  index: 10)
            u25 (copy, index: 11)
            u20 (ref,  index: 12)
            u16 (ref,  index: 13)
            u15 (ref,  index: 14)
        ]]
        u11 = false
        local v12 = ((u13 ~= 0) and (u10 * math.sin(u9))) or 0
        local v13 = ((u13 == 0) and 0) or (tbl_upv_2[u13].centerX)
        local v14 = landingX_upv_1 - (v13 + v12)
        local v15 = math.abs(v14) / TOWER_BUILDER_CONFIG_upv_1.blockWidth
        if TOWER_BUILDER_CONFIG_upv_1.stickToleranceFrac >= v15 then
            local v16 = v15 <= TOWER_BUILDER_CONFIG_upv_1.perfectToleranceFrac
            if v16 then
                u18 = u18 + 1
                u19 = TOWER_BUILDER_CONFIG_upv_1.comboMeterSeconds
            end
            local baseResidentsPerBlock_1 = TOWER_BUILDER_CONFIG_upv_1.baseResidentsPerBlock
            local v17
            if u19 <= 0 then
                v17 = 0
            else
                v17 = u18 * TOWER_BUILDER_CONFIG_upv_1.comboBonusPerLevel
            end
            u16 = u16 + (baseResidentsPerBlock_1 + v17)
            local tbl_3 = {}
            local v18
            if v16 then
                v18 = v13
            else
                v18 = landingX_upv_1 - v12
            end
            tbl_3.centerX = v18
            v18 = (v16 and 0) or (math.abs(v14))
            tbl_3.offsetAbs = v18
            table.insert(tbl_upv_2, tbl_3)
            local v19 = (v16 and 0) or (math.abs(v14))
            u15 = u15 + v19
            u13 = u13 + 1
        else
            u17 = u17 + 1
            u19 = 0
            u18 = 0
            if u13 > 0 and v15 < 1 then
                u25()
            end
            if TOWER_BUILDER_CONFIG_upv_1.lives <= u17 then
                u20 = true
            end
            return nil
        end
    end
    local function u27()
        --[[
          line: 194
          upvalues:
            u21 (ref,  index: 1)
            u23 (ref,  index: 2)
            chance_upv_1 (copy, index: 3)
            random_upv_1 (copy, index: 4)
            u2 (copy, index: 5)
            TOWER_BUILDER_CONFIG_upv_1 (copy, index: 6)
            u13 (ref,  index: 7)
            u22 (ref,  index: 8)
            jitterNormal_upv_1 (copy, index: 9)
            u7 (ref,  index: 10)
            u8 (ref,  index: 11)
            solveDrop_upv_1 (copy, index: 12)
            ropeAngularVelocity_upv_1 (copy, index: 13)
            settledDropHeight_upv_1 (copy, index: 14)
            u1 (copy, index: 15)
            u10 (ref,  index: 16)
            u9 (ref,  index: 17)
            tbl_upv_2 (copy, index: 18)
            u6 (copy, index: 19)
            u24 (copy, index: 20)
            landingX_upv_1 (ref,  index: 21)
            durationSeconds_upv_1 (ref,  index: 22)
            u11 (ref,  index: 23)
            u12 (ref,  index: 24)
            respawnDelaySeconds_upv_1 (ref,  index: 25)
        ]]
        if not (u21) then
            u21 = true
            u23 = nil
            if chance_upv_1(random_upv_1, u2.lapseChance) then
                local v20 = math.max(TOWER_BUILDER_CONFIG_upv_1.swingPeriodMinSeconds, TOWER_BUILDER_CONFIG_upv_1.swingPeriodBaseSeconds - TOWER_BUILDER_CONFIG_upv_1.swingPeriodDecayPerFloor * u13) / 4 * random_upv_1:NextNumber(0.1, 1)
                local v21 = ((chance_upv_1(random_upv_1, 0.5)) and -1) or 1
                u22 = (v21 * v20) + jitterNormal_upv_1(random_upv_1, u2.lapseSigmaSeconds)
            else
                u22 = jitterNormal_upv_1(random_upv_1, u2.releaseSigmaSeconds)
            end
        end
        local v22 = u7 - u22
        local v23 = math.max(TOWER_BUILDER_CONFIG_upv_1.swingPeriodMinSeconds, TOWER_BUILDER_CONFIG_upv_1.swingPeriodBaseSeconds - (TOWER_BUILDER_CONFIG_upv_1.swingPeriodDecayPerFloor * u13))
        local v24 = u8 + (math.tau / v23) * (v22 - u7)
        local v25 = TOWER_BUILDER_CONFIG_upv_1.swingAmplitudeRadians * math.sin(v24)
        local landingX_2 = solveDrop_upv_1(v25, ropeAngularVelocity_upv_1(v24, v23), settledDropHeight_upv_1(v25)).landingX
        local v26 = ((u13 == 0) and 0) or (math.clamp(tbl_upv_2[u13].centerX + u10 * math.sin(u9 + ((math.tau / TOWER_BUILDER_CONFIG_upv_1.swayPeriodSeconds) * ((v22 + (u1 * 0.75)) - u7))), -u6, u6))
        local v27 = landingX_2 - v26
        local v28 = u23
        u23 = v27
        if v28 ~= nil and v28 * v27 <= 0 then
            local v29 = u24()
            landingX_upv_1 = v29.landingX
            durationSeconds_upv_1 = v29.durationSeconds
            u11 = true
            u12 = 0
            respawnDelaySeconds_upv_1 = TOWER_BUILDER_CONFIG_upv_1.respawnDelaySeconds
            u21 = false
        else
            return nil
        end
    end
    local function u28(a2)
        --[[
          line: 234
          upvalues:
            u20 (ref,  index: 1)
            u7 (ref,  index: 2)
            u8 (ref,  index: 3)
            TOWER_BUILDER_CONFIG_upv_1 (copy, index: 4)
            u13 (ref,  index: 5)
            u14 (ref,  index: 6)
            u9 (ref,  index: 7)
            swayAmplitudeFor_upv_1 (copy, index: 8)
            u15 (ref,  index: 9)
            u10 (ref,  index: 10)
            u19 (ref,  index: 11)
            u18 (ref,  index: 12)
            respawnDelaySeconds_upv_1 (ref,  index: 13)
            u11 (ref,  index: 14)
            u12 (ref,  index: 15)
            durationSeconds_upv_1 (ref,  index: 16)
            u26 (copy, index: 17)
            u27 (copy, index: 18)
        ]]
        if u20 then
            return nil
        else
            u7 = u7 + a2
            u8 = u8 + ((math.tau / math.max(TOWER_BUILDER_CONFIG_upv_1.swingPeriodMinSeconds, TOWER_BUILDER_CONFIG_upv_1.swingPeriodBaseSeconds - (TOWER_BUILDER_CONFIG_upv_1.swingPeriodDecayPerFloor * u13))) * a2)
            u14 = u14 + ((((((u13 * TOWER_BUILDER_CONFIG_upv_1.blockHeight) + (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2)) + TOWER_BUILDER_CONFIG_upv_1.ropeLength) + TOWER_BUILDER_CONFIG_upv_1.dropDistance) - u14) * math.min(a2 * TOWER_BUILDER_CONFIG_upv_1.cameraEaseRate, 1))
            u9 = u9 + ((math.tau / TOWER_BUILDER_CONFIG_upv_1.swayPeriodSeconds) * a2)
            local v30 = swayAmplitudeFor_upv_1(u13, u15)
            local v31 = TOWER_BUILDER_CONFIG_upv_1.swayAmplitudeEaseRate * a2
            u10 = u10 + math.clamp(v30 - u10, -v31, v31)
            if u19 > 0 then
                u19 = math.max(0, u19 - a2)
                if u19 == 0 then
                    u18 = 0
                end
            end
            if respawnDelaySeconds_upv_1 > 0 then
                respawnDelaySeconds_upv_1 = respawnDelaySeconds_upv_1 - a2
            end
            if u11 then
                u12 = math.min(u12 + a2, durationSeconds_upv_1)
                if durationSeconds_upv_1 <= u12 then
                    u26()
                end
                if u20 then
                    return nil
                end
            end
            if not (u11) and respawnDelaySeconds_upv_1 <= 0 then
                u27()
            end
        end
    end
    local tbl_4 = {}
    tbl_4.step = function(a3, a4)
        --[[
          name: step
          line: 268
          upvalues:
            u20 (ref,  index: 1)
            u5 (copy, index: 2)
            u28 (copy, index: 3)
        ]]
        if u20 then
            return nil
        end
        u5:step(a4, u28)
    end
    tbl_4.snapshot = function(a5)
        --[[
          name: snapshot
          line: 274
          upvalues:
            u13 (ref,  index: 1)
            TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
            tbl_upv_2 (copy, index: 3)
            u16 (ref,  index: 4)
        ]]
        local tbl_5 = {}
        local v32 = math.min(u13, TOWER_BUILDER_CONFIG_upv_1.visibleTower)
        table.insert(tbl_5, u13)
        table.insert(tbl_5, v32)
        local v33 = u13 - v32 + 1
        local v34 = false
        v34, v33 = v34, v33
        while true do
            if v34 then
                v33 = v33 + 1
            else
                v34 = true
            end
            if v33 > u13 then
                break
            end
            table.insert(tbl_5, tbl_upv_2[v33].centerX)
        end
        local tbl_6 = {}
        tbl_6.score = u16
        tbl_6.values = tbl_5
        return tbl_6
    end
    tbl_4.isDead = function(a6)
        --[[
          name: isDead
          line: 305
          upvalues:
            u20 (ref, index: 1)
        ]]
        return u20
    end
    tbl_4.score = function(a7)
        --[[
          name: score
          line: 308
          upvalues:
            u16 (ref, index: 1)
        ]]
        return u16
    end
    return tbl_4
end
return tbl_1