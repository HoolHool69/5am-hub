-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TIMBERMAN_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "timberman", "timberman-config").TIMBERMAN_CONFIG
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local SubStepper_upv_1 = v1.SubStepper
local chance_upv_1 = v1.chance
local jitteredDelay_upv_1 = v1.jitteredDelay
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local segmentCount_upv_1 = TIMBERMAN_CONFIG_upv_1.segmentCount
local tbl_1 = {}
tbl_1.createTimbermanBot = function(a1)
    --[[
      name: createTimbermanBot
      line: 30
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 3)
        jitteredDelay_upv_1 (copy, index: 4)
        SubStepper_upv_1 (copy, index: 5)
        chance_upv_1 (copy, index: 6)
        segmentCount_upv_1 (copy, index: 7)
    ]]
    local u1 = BOT_TUNING_upv_1.timberman[a1.difficulty]
    local random_upv_1 = a1.random
    local u2 = deriveRandom_upv_1(a1.seed, 0)
    local tbl_2 = {}
    local u3 = tbl_2
    local u4, u5
    for n_1 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
        if n_1 ~= 0 then
            local u6
            u6 = u3[n_1]
            if u6 == nil then
                u6 = 0
            end
            u4 = u6
        else
            u4 = 0
        end
        if n_1 < TIMBERMAN_CONFIG_upv_1.safeStartSegments then
            u5 = 0
            table.insert(tbl_2, u5)
            continue
        end
        local v2 = u2:NextNumber()
        local v3 = ((v2 < TIMBERMAN_CONFIG_upv_1.branchNoneChance) and 0) or (((v2 >= TIMBERMAN_CONFIG_upv_1.branchNoneChance + ((1 - TIMBERMAN_CONFIG_upv_1.branchNoneChance) / 2)) and 2) or 1)
        if v3 == 0 or u4 == 0 or v3 == u4 then
            u5 = v3
        else
            u5 = 0
        end
        table.insert(tbl_2, u5)
    end
    local u7 = 0
    local u8 = 0
    local u9 = TIMBERMAN_CONFIG_upv_1.timerStart
    u4 = false
    local u6 = jitteredDelay_upv_1(random_upv_1, 1 / u1.chopsPerSecond, u1.cadenceJitterFrac)
    u5 = 0
    local u10 = SubStepper_upv_1.new(0.008333333333333333)
    local function u11()
        --[[
          line: 83
          upvalues:
            TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
            u3 (copy, index: 2)
            u2 (copy, index: 3)
        ]]
        local v4 = nil
        for n_2 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 2 do
            v4 = u3[n_2 + 2]
            if v4 == nil then
                v4 = 0
            end
            u3[n_2 + 1] = v4
        end
        local v5 = u3[TIMBERMAN_CONFIG_upv_1.segmentCount - 1]
        if v5 ~= nil then
            local v6 = v5
        else
            local v6 = 0
        end
        local segmentCount_2 = TIMBERMAN_CONFIG_upv_1.segmentCount
        local v7 = u2:NextNumber()
        local v8 = ((v7 < TIMBERMAN_CONFIG_upv_1.branchNoneChance) and 0) or (((v7 >= TIMBERMAN_CONFIG_upv_1.branchNoneChance + ((1 - TIMBERMAN_CONFIG_upv_1.branchNoneChance) / 2)) and 2) or 1)
        local v9
        if v8 == 0 or v6 == 0 or v8 == v6 then
            v9 = v8
        else
            v9 = 0
        end
        u3[segmentCount_2] = v9
    end
    local function u12(a2)
        --[[
          line: 141
          upvalues:
            u4 (ref,  index: 1)
            u6 (ref,  index: 2)
            u5 (ref,  index: 3)
            u3 (copy, index: 4)
            u7 (ref,  index: 5)
            chance_upv_1 (copy, index: 6)
            random_upv_1 (copy, index: 7)
            u1 (copy, index: 8)
            u11 (copy, index: 9)
            u8 (ref,  index: 10)
            u9 (ref,  index: 11)
            TIMBERMAN_CONFIG_upv_1 (copy, index: 12)
            jitteredDelay_upv_1 (copy, index: 13)
        ]]
        if u4 then
            return nil
        end
        u6 = u6 - a2
        u5 = math.max(u5 - a2, -a2)
        if u6 <= 0 then
            local v10, v11, v12 = nil, nil, nil
            if u5 <= 0 then
                v10 = u3[1]
                if v10 == nil then
                    v10 = 0
                end
                v11 = u3[2]
                if v11 == nil then
                    v11 = 0
                end
                local v13
                if v10 == 0 then
                    v13 = v11
                else
                    v13 = v10
                end
                if v13 == 1 then
                    local v14 = 1
                elseif v13 == 2 then
                    local v14 = 0
                end
                v12 = chance_upv_1(random_upv_1, u1.wrongSideChance)
                local v14 = nil
                if v12 then
                    v14 = ((v14 ~= 0) and 0) or 1
                end
                u7 = v14
                local v15 = ((v14 ~= 0) and 2) or 1
                if u3[1] ~= v15 then
                    u11()
                    if u3[1] ~= v15 then
                        u8 = u8 + 1
                        u9 = math.min(u9 + TIMBERMAN_CONFIG_upv_1.chopTimeGain, TIMBERMAN_CONFIG_upv_1.timerMax)
                    else
                        u4 = true
                    end
                else
                    u4 = true
                end
                u5 = u5 + (1 / TIMBERMAN_CONFIG_upv_1.maxChopsPerSecond)
                if u4 then
                    return nil
                end
                u6 = u6 + jitteredDelay_upv_1(random_upv_1, 1 / u1.chopsPerSecond, u1.cadenceJitterFrac)
                v10 = chance_upv_1(random_upv_1, u1.hesitationChance)
                if v10 then
                    u6 = u6 + jitteredDelay_upv_1(random_upv_1, 0.5, 0.4)
                end
            end
        end
        u9 = u9 - ((TIMBERMAN_CONFIG_upv_1.timerDrainBase + (math.min(math.floor(u8 / TIMBERMAN_CONFIG_upv_1.levelEveryChops), TIMBERMAN_CONFIG_upv_1.timerDrainStepsMax) * TIMBERMAN_CONFIG_upv_1.timerDrainStepAdd)) * a2)
        if u9 <= 0 then
            u9 = 0
            u4 = true
        end
    end
    local tbl_3 = {}
    tbl_3.step = function(a3, a4)
        --[[
          name: step
          line: 171
          upvalues:
            u4 (ref,  index: 1)
            u10 (copy, index: 2)
            u12 (copy, index: 3)
        ]]
        if u4 then
            return nil
        end
        u10:step(a4, u12)
    end
    tbl_3.snapshot = function(a5)
        --[[
          name: snapshot
          line: 177
          upvalues:
            u7 (ref,  index: 1)
            u9 (ref,  index: 2)
            TIMBERMAN_CONFIG_upv_1 (copy, index: 3)
            segmentCount_upv_1 (copy, index: 4)
            u3 (copy, index: 5)
            u8 (ref,  index: 6)
        ]]
        local tbl_4 = {}
        table.insert(tbl_4, u7)
        table.insert(tbl_4, (math.clamp(u9 / TIMBERMAN_CONFIG_upv_1.timerMax, 0, 1)))
        local v16 = nil
        for n_3 = 0, segmentCount_upv_1 - 1 do
            v16 = u3[n_3 + 1]
            if v16 == nil then
                v16 = 0
            end
            table.insert(tbl_4, v16)
        end
        local tbl_5 = {}
        tbl_5.score = u8
        tbl_5.values = tbl_4
        return tbl_5
    end
    tbl_3.isDead = function(a6)
        --[[
          name: isDead
          line: 195
          upvalues:
            u4 (ref, index: 1)
        ]]
        return u4
    end
    tbl_3.score = function(a7)
        --[[
          name: score
          line: 198
          upvalues:
            u8 (ref, index: 1)
        ]]
        return u8
    end
    return tbl_3
end
return tbl_1