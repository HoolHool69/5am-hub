-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ZIG_ZAG_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "zig-zag", "zig-zag-config").ZIG_ZAG_CONFIG
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v1.chance
local jitterNormal_upv_1 = v1.jitterNormal
local SubStepper_upv_1 = v1.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local tbl_1 = {}
tbl_1.createZigZagBot = function(a1)
    --[[
      name: createZigZagBot
      line: 25
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveSeed_upv_1 (copy, index: 2)
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 3)
        jitterNormal_upv_1 (copy, index: 4)
        chance_upv_1 (copy, index: 5)
        SubStepper_upv_1 (copy, index: 6)
    ]]
    local u1 = BOT_TUNING_upv_1["zig-zag"][a1.difficulty]
    local u2 = Random.new(deriveSeed_upv_1(a1.seed, 0))
    local u3 = u2:NextInteger(ZIG_ZAG_CONFIG_upv_1.gemGapMin, ZIG_ZAG_CONFIG_upv_1.gemGapMax)
    local u4 = 0
    local u5 = 0
    local u6 = "x"
    local u7 = ZIG_ZAG_CONFIG_upv_1.startRunTiles
    local function u8()
        --[[
          line: 35
          upvalues:
            u7 (ref,  index: 1)
            u6 (ref,  index: 2)
            u2 (copy, index: 3)
            ZIG_ZAG_CONFIG_upv_1 (copy, index: 4)
            u4 (ref,  index: 5)
            u5 (ref,  index: 6)
            u3 (ref,  index: 7)
        ]]
        if u7 <= 0 then
            u6 = ((u6 ~= "x") and "x") or "z"
            u7 = u2:NextInteger(ZIG_ZAG_CONFIG_upv_1.runMin, ZIG_ZAG_CONFIG_upv_1.runMax)
        end
        if u6 ~= "x" then
            u5 = u5 + 1
        else
            u4 = u4 + 1
        end
        u7 = u7 - 1
        u3 = u3 - 1
        local v2 = u7 <= 0
        local v3 = false
        if u3 > 0 or not (v2) and u3 > -ZIG_ZAG_CONFIG_upv_1.gemCornerPatience then
            local tbl_2 = {}
            tbl_2.gx = u4
            tbl_2.gz = u5
            tbl_2.corner = v2
            tbl_2.gem = v3
            return tbl_2
        end
        u3 = u2:NextInteger(ZIG_ZAG_CONFIG_upv_1.gemGapMin, ZIG_ZAG_CONFIG_upv_1.gemGapMax)
        v3 = true
        local tbl_2 = {}
        tbl_2.gx = u4
        tbl_2.gz = u5
        tbl_2.corner = v2
        tbl_2.gem = v3
        return tbl_2
    end
    local u9 = {}
    local u10 = u8()
    local u11 = ((u9.gx >= u10.gx) and "z") or "x"
    local u12 = 0
    local u13 = 0
    local u14 = 0
    local stepEvery_upv_1 = ZIG_ZAG_CONFIG_upv_1.stepEvery
    local u15 = false
    local function u16()
        --[[
          line: 87
          upvalues:
            u9 (ref,  index: 1)
            u10 (ref,  index: 2)
            u8 (copy, index: 3)
            u11 (ref,  index: 4)
            ZIG_ZAG_CONFIG_upv_1 (copy, index: 5)
            u13 (ref,  index: 6)
            stepEvery_upv_1 (ref,  index: 7)
            u14 (ref,  index: 8)
            u1 (copy, index: 9)
            jitterNormal_upv_1 (copy, index: 10)
            a1 (copy, index: 11)
            u15 (ref,  index: 12)
            chance_upv_1 (copy, index: 13)
        ]]
        u9 = u10
        u10 = u8()
        u11 = ((u9.gx >= u10.gx) and "z") or "x"
        u13 = u13 + (((u9.gem) and (1 + ZIG_ZAG_CONFIG_upv_1.gemScore)) or 1)
        while stepEvery_upv_1 <= u13 do
            stepEvery_upv_1 = stepEvery_upv_1 + ZIG_ZAG_CONFIG_upv_1.stepEvery
            u14 = u14 + 1
        end
        if u10.corner then
            if (ZIG_ZAG_CONFIG_upv_1.turnTolerance * ZIG_ZAG_CONFIG_upv_1.tileSize) / math.min(ZIG_ZAG_CONFIG_upv_1.speedStart + (u14 * ZIG_ZAG_CONFIG_upv_1.speedStep), ZIG_ZAG_CONFIG_upv_1.speedMax) < math.abs(u1.tapDelayMean + jitterNormal_upv_1(a1.random, u1.tapJitter)) then
                u15 = true
            end
            return nil
        elseif chance_upv_1(a1.random, u1.spuriousTapChance) then
            u15 = true
        end
    end
    local function u17(a2)
        --[[
          line: 110
          upvalues:
            u15 (ref,  index: 1)
            u12 (ref,  index: 2)
            ZIG_ZAG_CONFIG_upv_1 (copy, index: 3)
            u14 (ref,  index: 4)
            u16 (copy, index: 5)
        ]]
        if u15 then
            return nil
        end
        u12 = u12 + (math.min(ZIG_ZAG_CONFIG_upv_1.speedStart + (u14 * ZIG_ZAG_CONFIG_upv_1.speedStep), ZIG_ZAG_CONFIG_upv_1.speedMax) * a2 / ZIG_ZAG_CONFIG_upv_1.tileSize)
        while u12 >= 1 do
            u12 = u12 - 1
            u16()
            if not (u15) then
                continue
            end
            return nil
        end
    end
    local u18 = SubStepper_upv_1.new(0.008333333333333333)
    local tbl_3 = {}
    tbl_3.step = function(a3, a4)
        --[[
          name: step
          line: 125
          upvalues:
            u15 (ref,  index: 1)
            u18 (copy, index: 2)
            u17 (copy, index: 3)
        ]]
        if u15 then
            return nil
        end
        u18:step(a4, u17)
    end
    tbl_3.snapshot = function(a5)
        --[[
          name: snapshot
          line: 131
          upvalues:
            u13 (ref, index: 1)
            u9 (ref, index: 2)
            u11 (ref, index: 3)
        ]]
        local tbl_4 = {}
        tbl_4.score = u13
        local gx_1 = u9.gx
        if u11 ~= "x" then
            local v4 = 0
        end
        local v4 = nil
        local v5 = gx_1 + v4
        local gz_1 = u9.gz
        if u11 ~= "z" then
            local v6 = 0
        end
        local v6 = nil
        tbl_4.values = {v5, gz_1 + v6}
        return tbl_4
    end
    tbl_3.isDead = function(a6)
        --[[
          name: isDead
          line: 138
          upvalues:
            u15 (ref, index: 1)
        ]]
        return u15
    end
    tbl_3.score = function(a7)
        --[[
          name: score
          line: 141
          upvalues:
            u13 (ref, index: 1)
        ]]
        return u13
    end
    return tbl_3
end
return tbl_1