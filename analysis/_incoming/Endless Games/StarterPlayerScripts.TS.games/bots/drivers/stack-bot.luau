-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local STACK_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "stack", "stack-config").STACK_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v1.chance
local jitterNormal_upv_1 = v1.jitterNormal
local SubStepper_upv_1 = v1.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local tbl_1 = {}
tbl_1.createStackBot = function(a1)
    --[[
      name: createStackBot
      line: 22
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        STACK_CONFIG_upv_1 (copy, index: 2)
        jitterNormal_upv_1 (copy, index: 3)
        chance_upv_1 (copy, index: 4)
        SubStepper_upv_1 (copy, index: 5)
    ]]
    local random_upv_1 = a1.random
    local u1 = BOT_TUNING_upv_1.stack[a1.difficulty]
    local u2 = true
    local u3 = 0
    local u4 = 0
    local u5 = STACK_CONFIG_upv_1.baseSize
    local u6 = STACK_CONFIG_upv_1.baseSize
    local u7 = 1
    local u8 = 0
    local u9 = 0
    local slideSpeedStart_upv_1 = STACK_CONFIG_upv_1.slideSpeedStart
    local u10 = -1.5707963267948966
    local u11 = 0
    local u12 = false
    local tbl_upv_2 = {}
    table.insert(tbl_upv_2, {sizeX = STACK_CONFIG_upv_1.baseSize, sizeZ = STACK_CONFIG_upv_1.baseSize})
    local function u13()
        --[[
          line: 48
          upvalues:
            slideSpeedStart_upv_1 (ref,  index: 1)
            STACK_CONFIG_upv_1 (copy, index: 2)
            u10 (ref,  index: 3)
            jitterNormal_upv_1 (copy, index: 4)
            random_upv_1 (copy, index: 5)
            u1 (copy, index: 6)
            chance_upv_1 (copy, index: 7)
            u11 (ref,  index: 8)
        ]]
        local v2 = slideSpeedStart_upv_1 / STACK_CONFIG_upv_1.slideAmplitude
        local v3 = jitterNormal_upv_1(random_upv_1, u1.tapSigmaSeconds)
        local v4 = chance_upv_1(random_upv_1, u1.lapseChance)
        if v4 then
            local v5 = 1.5707963267948966 / v2 * random_upv_1:NextNumber(0.5, 1)
            local v6 = ((chance_upv_1(random_upv_1, 0.5)) and -1) or 1
            v3 = v6 * v5 + jitterNormal_upv_1(random_upv_1, u1.lapseSigmaSeconds)
        end
        u11 = math.max((math.pi - (u10 % math.pi)) / v2 + v3, 0)
    end
    local function u14(a2)
        --[[
          line: 68
          upvalues:
            u2 (ref,  index: 1)
            u5 (ref,  index: 2)
            u6 (ref,  index: 3)
            u12 (ref,  index: 4)
            STACK_CONFIG_upv_1 (copy, index: 5)
            u8 (ref,  index: 6)
            u3 (ref,  index: 7)
            u4 (ref,  index: 8)
            u7 (ref,  index: 9)
            tbl_upv_2 (copy, index: 10)
            u9 (ref,  index: 11)
            u10 (ref,  index: 12)
            slideSpeedStart_upv_1 (ref,  index: 13)
            u13 (copy, index: 14)
        ]]
        local v7 = nil
        if v7 > math.abs(a2) then
            local v8 = math.abs(a2) <= STACK_CONFIG_upv_1.perfectEpsilon
            if v8 then
                u8 = u8 + 1
                if STACK_CONFIG_upv_1.perfectStreakForRegrow <= u8 then
                    u5 = math.min(u5 + STACK_CONFIG_upv_1.perfectRegrow, STACK_CONFIG_upv_1.baseSize)
                    u6 = math.min(u6 + STACK_CONFIG_upv_1.perfectRegrow, STACK_CONFIG_upv_1.baseSize)
                end
            else
                u8 = 0
                if u2 then
                    u5 = v7 - math.abs(a2)
                    u3 = u3 + (a2 / 2)
                else
                    u6 = v7 - math.abs(a2)
                    u4 = u4 + (a2 / 2)
                end
            end
            table.insert(tbl_upv_2, {layer = u7, centerX = u3, centerZ = u4, sizeX = u5, sizeZ = u6})
            if #tbl_upv_2 > 7 then
                table.remove(tbl_upv_2, 1)
            end
            u7 = u7 + 1
            u9 = u9 + ((v8 and 2) or 1)
            u2 = not u2
            u10 = -1.5707963267948966
            slideSpeedStart_upv_1 = math.min(slideSpeedStart_upv_1 + STACK_CONFIG_upv_1.slideSpeedPerBlock, STACK_CONFIG_upv_1.slideSpeedMax)
            u13()
        else
            u12 = true
            return nil
        end
    end
    local function u15(a3)
        --[[
          line: 109
          upvalues:
            u12 (ref,  index: 1)
            slideSpeedStart_upv_1 (ref,  index: 2)
            STACK_CONFIG_upv_1 (copy, index: 3)
            u11 (ref,  index: 4)
            u10 (ref,  index: 5)
            u14 (copy, index: 6)
        ]]
        local v9 = a3
        while true do
            local v10
            if u12 or v9 <= 0 then
                break
            end
            v10 = slideSpeedStart_upv_1 / STACK_CONFIG_upv_1.slideAmplitude
            if v9 >= u11 then
                u10 = u10 + (v10 * u11)
                v9 = v9 - u11
                u14(math.sin(u10) * STACK_CONFIG_upv_1.slideAmplitude)
                continue
            end
            u10 = u10 + (v10 * v9)
            u11 = u11 - v9
            return nil
        end
    end
    u13()
    local u16 = SubStepper_upv_1.new(0.008333333333333333)
    local tbl_3 = {}
    tbl_3.step = function(a4, a5)
        --[[
          name: step
          line: 127
          upvalues:
            u12 (ref,  index: 1)
            u16 (copy, index: 2)
            u15 (copy, index: 3)
        ]]
        if u12 then
            return nil
        end
        u16:step(a5, u15)
    end
    tbl_3.snapshot = function(a6)
        --[[
          name: snapshot
          line: 133
          upvalues:
            u7 (ref,  index: 1)
            tbl_upv_2 (copy, index: 2)
            u9 (ref,  index: 3)
        ]]
        local tbl_4 = {}
        table.insert(tbl_4, u7)
        table.insert(tbl_4, #tbl_upv_2)
        for _, value_1 in tbl_upv_2 do
            table.insert(tbl_4, value_1.layer)
            table.insert(tbl_4, value_1.centerX)
            table.insert(tbl_4, value_1.centerZ)
            table.insert(tbl_4, value_1.sizeX)
            table.insert(tbl_4, value_1.sizeZ)
        end
        local tbl_5 = {}
        tbl_5.score = u9
        tbl_5.values = tbl_4
        return tbl_5
    end
    tbl_3.isDead = function(a7)
        --[[
          name: isDead
          line: 161
          upvalues:
            u12 (ref, index: 1)
        ]]
        return u12
    end
    tbl_3.score = function(a8)
        --[[
          name: score
          line: 164
          upvalues:
            u9 (ref, index: 1)
        ]]
        return u9
    end
    return tbl_3
end
return tbl_1