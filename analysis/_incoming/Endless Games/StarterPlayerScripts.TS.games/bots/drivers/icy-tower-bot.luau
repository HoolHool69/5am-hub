-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ICY_TOWER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "icy-tower", "icy-tower-config").ICY_TOWER_CONFIG
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v1.chance
local jitteredDelay_upv_1 = v1.jitteredDelay
local jitterNormal_upv_1 = v1.jitterNormal
local ReactionGate_upv_1 = v1.ReactionGate
local SubStepper_upv_1 = v1.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local u1 = 1 / ICY_TOWER_CONFIG_upv_1.simTicksPerSecond
local playerHalfWidthPx_upv_1 = ICY_TOWER_CONFIG_upv_1.playerHalfWidthPx
local floorSpacingPx_upv_1 = ICY_TOWER_CONFIG_upv_1.floorSpacingPx
local function jumpApexPx_1(a1)
    --[[
      name: jumpApexPx
      line: 100
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v2 = 0
    local v3 = a1
    while v3 > 0 do
        v2 = v2 + v3
        v3 = v3 - ICY_TOWER_CONFIG_upv_1.gravityPx
    end
    return v2
end
local function generateFloorSpec_upv_1(a1, a2)
    --[[
      name: generateFloorSpec
      line: 68
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v4 = a1:NextInteger(0, 32767)
    local v5 = a1:NextInteger(0, 32767)
    local v6 = true
    if a2 ~= 0 then
        if a2 > ICY_TOWER_CONFIG_upv_1.fullWidthHighCutoff then
            v6 = a2 % ICY_TOWER_CONFIG_upv_1.fullWidthEveryHigh == 0
        else
            v6 = true
            if a2 % ICY_TOWER_CONFIG_upv_1.fullWidthEvery ~= 0 then
                v6 = a2 % ICY_TOWER_CONFIG_upv_1.fullWidthEveryHigh == 0
            end
        end
    end
    if v6 then
        local tbl_1 = {}
        tbl_1.collisionLeftPx = -ICY_TOWER_CONFIG_upv_1.towerWidthPx
        tbl_1.collisionRightPx = ICY_TOWER_CONFIG_upv_1.towerWidthPx * 2
        return tbl_1
    else
        local v7 = ICY_TOWER_CONFIG_upv_1.widthBaseTiles
        if a2 >= ICY_TOWER_CONFIG_upv_1.widthFormulaCutoff then
            for _, value_1 in ICY_TOWER_CONFIG_upv_1.widthTailSchedule do
                if value_1[1] <= a2 then
                    v7 = value_1[2]
                end
            end
        else
            v7 = ICY_TOWER_CONFIG_upv_1.widthBaseTiles + v4 % (ICY_TOWER_CONFIG_upv_1.widthRangeBase - math.floor(a2 / ICY_TOWER_CONFIG_upv_1.widthRangeShrinkEvery))
        end
        local v8 = ICY_TOWER_CONFIG_upv_1.placementBaseTile + v5 % (ICY_TOWER_CONFIG_upv_1.placementRange - v7)
        local tbl_2 = {}
        tbl_2.collisionLeftPx = (v8 * ICY_TOWER_CONFIG_upv_1.tilePx) - ICY_TOWER_CONFIG_upv_1.floorGraceLeftPx
        tbl_2.collisionRightPx = (((v8 + v7) + 1) * ICY_TOWER_CONFIG_upv_1.tilePx) + ICY_TOWER_CONFIG_upv_1.floorGraceRightPx
        return tbl_2
    end
end
local tbl_3 = {}
tbl_3.createIcyTowerBot = function(a1)
    --[[
      name: createIcyTowerBot
      line: 109
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        ReactionGate_upv_1 (copy, index: 3)
        SubStepper_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 6)
        generateFloorSpec_upv_1 (copy, index: 7)
        floorSpacingPx_upv_1 (copy, index: 8)
        jitteredDelay_upv_1 (copy, index: 9)
        playerHalfWidthPx_upv_1 (copy, index: 10)
        jitterNormal_upv_1 (copy, index: 11)
        chance_upv_1 (copy, index: 12)
    ]]
    local random_upv_1 = a1.random
    local u2 = BOT_TUNING_upv_1["icy-tower"][a1.difficulty]
    local u3 = deriveRandom_upv_1(a1.seed, 0)
    local tbl_upv_4 = {}
    local u4 = ReactionGate_upv_1.new()
    local u5 = SubStepper_upv_1.new(u1)
    local u6 = ICY_TOWER_CONFIG_upv_1.spawnXPx
    local u7 = 0
    local u8 = 0
    local u9 = 0
    local u10 = true
    local u11 = 0
    local u12 = 0
    local u13 = -ICY_TOWER_CONFIG_upv_1.windowStartBelowFeetPx
    local u14 = 0
    local u15 = false
    local u16 = 0
    local u17 = 0
    local u18 = false
    local comboWindowTicks_upv_1 = 0
    local u19 = 0
    local u20 = 0
    local u21 = 0
    local u22 = 0
    local u23 = false
    local u24 = -1
    local u25 = 0
    local u26 = false
    local u27 = 1
    local u28 = ICY_TOWER_CONFIG_upv_1.spawnXPx
    local u29 = 0
    local u30 = 0
    local u31 = 0
    local u32 = 0
    local u33 = -1
    local u34 = 0
    local u35 = false
    local u36 = 0
    local u37 = 0
    local u38 = -1
    local u39 = 0
    local function ensureFloors_1(a2)
        --[[
          name: ensureFloors
          line: 155
          upvalues:
            u24 (ref,  index: 1)
            generateFloorSpec_upv_1 (copy, index: 2)
            u3 (copy, index: 3)
            tbl_upv_4 (copy, index: 4)
        ]]
        while u24 < a2 do
            u24 = u24 + 1
            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
        end
    end
    local function pruneFloors_upv_1()
        --[[
          name: pruneFloors
          line: 164
          upvalues:
            u13 (ref,  index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
            floorSpacingPx_upv_1 (copy, index: 3)
            u11 (ref,  index: 4)
            u25 (ref,  index: 5)
            tbl_upv_4 (copy, index: 6)
        ]]
        local v9 = math.max(math.min(math.floor(((u13 - ICY_TOWER_CONFIG_upv_1.deathBelowWindowPx) - 90) / floorSpacingPx_upv_1), u11), 0)
        local v10 = u25
        local v11 = false
        while true do
            if v11 then
                local v12 = v10 + 1
                v10, v10 = v12, v12
            else
                v11 = true
            end
            if v10 >= v9 then
                break
            end
            tbl_upv_4[v10] = nil
        end
        u25 = math.max(u25, v9)
    end
    local function steerToward_1(a3)
        --[[
          name: steerToward
          line: 185
          upvalues:
            u6 (ref, index: 1)
        ]]
        local v13 = a3 - u6
        if v13 <= 4 then
            if v13 >= -4 then
                return 0
            end
            return -1
        end
        return 1
    end
    local function cadenceSteer_1()
        --[[
          name: cadenceSteer
          line: 196
          upvalues:
            u37 (ref,  index: 1)
            u36 (ref,  index: 2)
            u28 (ref,  index: 3)
            u6 (ref,  index: 4)
            jitteredDelay_upv_1 (copy, index: 5)
            random_upv_1 (copy, index: 6)
            u2 (copy, index: 7)
            u1 (copy, index: 8)
        ]]
        if u37 <= 0 then
            local v14 = u28 - u6
            u36 = ((v14 > 4) and 1) or (((v14 >= -4) and 0) or -1)
            u37 = math.max(math.round(jitteredDelay_upv_1(random_upv_1, u2.reactionSeconds, 0.35) / u1) - 1, 0)
        else
            u37 = u37 - 1
        end
        return u36
    end
    local function aimSpanOf_1(a4)
        --[[
          name: aimSpanOf
          line: 205
          upvalues:
            playerHalfWidthPx_upv_1 (copy, index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        ]]
        local tbl_5 = {}
        tbl_5.lowPx = math.max((a4.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
        tbl_5.highPx = math.min((a4.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
        return tbl_5
    end
    local function aimCenter_1(a5)
        --[[
          name: aimCenter
          line: 211
          upvalues:
            playerHalfWidthPx_upv_1 (copy, index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        ]]
        local tbl_6 = {}
        tbl_6.lowPx = math.max((a5.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
        tbl_6.highPx = math.min((a5.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
        return (tbl_6.lowPx + tbl_6.highPx) / 2
    end
    local function setTarget_1(a6, a7)
        --[[
          name: setTarget
          line: 215
          upvalues:
            ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
            u24 (ref,  index: 2)
            generateFloorSpec_upv_1 (copy, index: 3)
            u3 (copy, index: 4)
            tbl_upv_4 (copy, index: 5)
            u27 (ref,  index: 6)
            playerHalfWidthPx_upv_1 (copy, index: 7)
            u28 (ref,  index: 8)
            jitterNormal_upv_1 (copy, index: 9)
            random_upv_1 (copy, index: 10)
            u37 (ref,  index: 11)
        ]]
        while u24 < a6 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
            u24 = u24 + 1
            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
        end
        u27 = a6
        local v15 = tbl_upv_4[a6]
        local v16
        if v15 == nil then
            v16 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
        else
            local tbl_7 = {}
            tbl_7.lowPx = math.max((v15.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
            tbl_7.highPx = math.min((v15.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
            v16 = (tbl_7.lowPx + tbl_7.highPx) / 2
        end
        u28 = math.clamp(v16 + jitterNormal_upv_1(random_upv_1, a7), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
        u37 = 0
    end
    local function instantPlan_1()
        --[[
          name: instantPlan
          line: 225
          upvalues:
            ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
            u8 (ref,  index: 2)
            floorSpacingPx_upv_1 (copy, index: 3)
            u11 (ref,  index: 4)
            u2 (copy, index: 5)
            u24 (ref,  index: 6)
            generateFloorSpec_upv_1 (copy, index: 7)
            u3 (copy, index: 8)
            tbl_upv_4 (copy, index: 9)
            u27 (ref,  index: 10)
            playerHalfWidthPx_upv_1 (copy, index: 11)
            u28 (ref,  index: 12)
            jitterNormal_upv_1 (copy, index: 13)
            random_upv_1 (copy, index: 14)
            u37 (ref,  index: 15)
            u29 (ref,  index: 16)
            u30 (ref,  index: 17)
            u32 (ref,  index: 18)
            u26 (ref,  index: 19)
        ]]
        local tbl_8 = 0
        local v17 = math.max(ICY_TOWER_CONFIG_upv_1.jumpSpeedFactor * math.abs(u8), ICY_TOWER_CONFIG_upv_1.baseJumpSpeedPx)
        while v17 > 0 do
            tbl_8 = tbl_8 + v17
            v17 = v17 - ICY_TOWER_CONFIG_upv_1.gravityPx
        end
        local v18 = u11 + math.clamp(math.floor((tbl_8 - 2) / floorSpacingPx_upv_1), 1, 4)
        local steerErrorPx_1 = u2.steerErrorPx
        while u24 < v18 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
            u24 = u24 + 1
            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
        end
        u27 = v18
        local v19 = tbl_upv_4[v18]
        local v20
        if v19 == nil then
            v20 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
        else
            tbl_8 = {}
            tbl_8.lowPx = math.max((v19.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
            tbl_8.highPx = math.min((v19.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
            v20 = (tbl_8.lowPx + tbl_8.highPx) / 2
        end
        u28 = math.clamp(v20 + jitterNormal_upv_1(random_upv_1, steerErrorPx_1), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
        u37 = 0
        u29 = 0
        u30 = 0
        u32 = 0
        u26 = true
    end
    local function ledgeAhead_1(a8)
        --[[
          name: ledgeAhead
          line: 235
          upvalues:
            u11 (ref,  index: 1)
            tbl_upv_4 (copy, index: 2)
            u8 (ref,  index: 3)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 4)
            u6 (ref,  index: 5)
            playerHalfWidthPx_upv_1 (copy, index: 6)
        ]]
        local v21 = tbl_upv_4[u11]
        local v22 = nil
        if v21 ~= nil then
            local v23 = ((a8 == 0) and (u8 * ICY_TOWER_CONFIG_upv_1.idleFriction)) or (math.clamp(u8 + (a8 * ICY_TOWER_CONFIG_upv_1.runAccelPx), -ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx))
            v22 = u6 + v23
            local v24 = true
            if (v21.collisionRightPx + playerHalfWidthPx_upv_1) - 4 >= v22 then
                v24 = v22 < (v21.collisionLeftPx - playerHalfWidthPx_upv_1) + 4
            end
            return v24
        end
        return false
    end
    local function predictHeldFlight_upv_1(a9, a10, a11)
        --[[
          name: predictHeldFlight
          line: 253
          upvalues:
            ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
            u11 (ref,  index: 2)
            floorSpacingPx_upv_1 (copy, index: 3)
            tbl_upv_4 (copy, index: 4)
            playerHalfWidthPx_upv_1 (copy, index: 5)
        ]]
        local v25 = a10 + ICY_TOWER_CONFIG_upv_1.runAccelPx
        local v26 = math.max(ICY_TOWER_CONFIG_upv_1.jumpSpeedFactor * v25, ICY_TOWER_CONFIG_upv_1.baseJumpSpeedPx)
        local v27 = math.min(v25, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx)
        local v28 = a9 + v27 * a11
        local v29
        if v28 >= ICY_TOWER_CONFIG_upv_1.playerClampMinPx then
            if ICY_TOWER_CONFIG_upv_1.playerClampMaxPx >= v28 then
                v29 = a11
            else
                local playerClampMaxPx_1 = ICY_TOWER_CONFIG_upv_1.playerClampMaxPx
                v27 = v27 * ICY_TOWER_CONFIG_upv_1.wallBounceFactor
                v29, v28 = -1, playerClampMaxPx_1
            end
        else
            local playerClampMinPx_1 = ICY_TOWER_CONFIG_upv_1.playerClampMinPx
            v27 = v27 * ICY_TOWER_CONFIG_upv_1.wallBounceFactor
            v29 = 1
            v28 = playerClampMinPx_1
        end
        local v30 = u11 * floorSpacingPx_upv_1 + v26
        v26 = v26 - ICY_TOWER_CONFIG_upv_1.gravityPx
        for _ = 0, 89 do
            v27 = math.min(v27 + ICY_TOWER_CONFIG_upv_1.runAccelPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx)
            local v31
            v31 = v28 + v27 * v29
            if v31 >= ICY_TOWER_CONFIG_upv_1.playerClampMinPx then
                if ICY_TOWER_CONFIG_upv_1.playerClampMaxPx >= v31 then
                    v28 = v31
                else
                    local playerClampMaxPx_2 = ICY_TOWER_CONFIG_upv_1.playerClampMaxPx
                    v27 = v27 * ICY_TOWER_CONFIG_upv_1.wallBounceFactor
                    v29, v28 = -1, playerClampMaxPx_2
                end
            else
                local playerClampMinPx_2 = ICY_TOWER_CONFIG_upv_1.playerClampMinPx
                v27 = v27 * ICY_TOWER_CONFIG_upv_1.wallBounceFactor
                v29, v28 = 1, playerClampMinPx_2
            end
            local v32 = v26 <= 0
            local v33 = v30 + v26
            v26 = v26 - ICY_TOWER_CONFIG_upv_1.gravityPx
            if not (v32) then
                v30 = v33
                continue
            end
            local v34, v35, v36
            if v30 <= v33 then
                v30 = v33
                continue
            end
            local v37 = math.floor(v30 / floorSpacingPx_upv_1)
            v34 = math.max(math.ceil((v33 - 1) / floorSpacingPx_upv_1), u11 + 1)
            v35 = false
            v36 = v37
            local v38 = nil
            if v35 then
                v36 = v36 - 1
            else
                v35 = true
            end
            if v34 > v36 then
                if v33 > u11 * floorSpacingPx_upv_1 then
                    v30 = v33
                    continue
                end
                return nil
            end
            local v39
            v39 = v36 * floorSpacingPx_upv_1
            if v39 <= v30 then
                local v40 = nil
                if v33 < v39 + 1 then
                    v40 = tbl_upv_4[v36]
                    if v40 ~= nil then
                        local tbl_9 = {}
                        tbl_9.lowPx = math.max((v40.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                        tbl_9.highPx = math.min((v40.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        v38 = math.min(v28 - tbl_9.lowPx, tbl_9.highPx - v28)
                        if v38 > 0 then
                            local tbl_10 = {}
                            tbl_10.floorsUp = v36 - u11
                            tbl_10.landingXPx = v28
                            tbl_10.marginPx = v38
                            return tbl_10
                        end
                    end
                end
            end
        end
        return nil
    end
    local function makePlan_upv_1(a12)
        --[[
          name: makePlan
          line: 330
          upvalues:
            u11 (ref,  index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
            u24 (ref,  index: 3)
            generateFloorSpec_upv_1 (copy, index: 4)
            u3 (copy, index: 5)
            tbl_upv_4 (copy, index: 6)
            u26 (ref,  index: 7)
            u33 (ref,  index: 8)
            jitterNormal_upv_1 (copy, index: 9)
            random_upv_1 (copy, index: 10)
            u2 (copy, index: 11)
            u1 (copy, index: 12)
            u7 (ref,  index: 13)
            u13 (ref,  index: 14)
            chance_upv_1 (copy, index: 15)
            playerHalfWidthPx_upv_1 (copy, index: 16)
            u8 (ref,  index: 17)
            u6 (ref,  index: 18)
            predictHeldFlight_upv_1 (copy, index: 19)
            u27 (ref,  index: 20)
            u28 (ref,  index: 21)
            u37 (ref,  index: 22)
            u29 (ref,  index: 23)
            u31 (ref,  index: 24)
            u30 (ref,  index: 25)
            u32 (ref,  index: 26)
            jitteredDelay_upv_1 (copy, index: 27)
        ]]
        while u24 < u11 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
            u24 = u24 + 1
            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
        end
        u26 = true
        u33 = -1
        local v41 = jitterNormal_upv_1(random_upv_1, u2.jumpSigmaSeconds) / u1
        local v42 = nil
        if (u7 - u13) <= 24 then
            local v43 = nil
            if a12 then
                while u24 < (u11 + 1) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                    u24 = u24 + 1
                    tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                end
                u27 = u11 + 1
                v42 = tbl_upv_4[u27]
                if v42 == nil then
                    local steerErrorPx_2 = u2.steerErrorPx
                    while u24 < u27 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                        u24 = u24 + 1
                        tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                    end
                    local v44
                    v44 = tbl_upv_4[u27]
                    if v44 == nil then
                        local v45
                        v45 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                    else
                        local v46
                        v46 = {}
                        v46.lowPx = math.max((v44.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                        v46.highPx = math.min((v44.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        local v45
                        v45 = (v46.lowPx + v46.highPx) / 2
                    end
                    u28 = math.clamp(v45 + jitterNormal_upv_1(random_upv_1, steerErrorPx_2), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                else
                    local v43
                    v43 = {}
                    v43.lowPx = math.max((v42.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                    v43.highPx = math.min((v42.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    u28 = math.clamp(math.clamp(u6, v43.lowPx, v43.highPx) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                end
            else
                local v47 = u11 + 1
                v42 = u2.steerErrorPx
                while u24 < v47 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                    u24 = u24 + 1
                    tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                end
                u27 = v47
                local v48
                v48 = tbl_upv_4[v47]
                if v48 == nil then
                    local v49
                    v49 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                else
                    local tbl_11 = {}
                    tbl_11.lowPx = math.max((v48.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                    tbl_11.highPx = math.min((v48.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    local v49
                    v49 = (tbl_11.lowPx + tbl_11.highPx) / 2
                end
                u28 = math.clamp(v49 + jitterNormal_upv_1(random_upv_1, v42), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
            end
            u37 = 0
            u29 = 0
            u30 = 0
            local v50 = math.max(u2.reactionSeconds - 0.1, 0.02) * 7
            v42 = (a12 and 0) or (jitteredDelay_upv_1(random_upv_1, v50, 0.5) / u1)
            u32 = math.max(math.round(v41 + v42), 0)
        else
            local v51 = nil
            if a12 then
                v42 = tbl_upv_4[u11]
                local v48
                if v42 == nil then
                    v48 = ICY_TOWER_CONFIG_upv_1.playerClampMaxPx
                else
                    v48 = math.min((v42.collisionRightPx + playerHalfWidthPx_upv_1) - 4, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                end
                local v49
                if v42 == nil then
                    v49 = ICY_TOWER_CONFIG_upv_1.playerClampMinPx
                else
                    v49 = math.max((v42.collisionLeftPx - playerHalfWidthPx_upv_1) + 4, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                end
                local v44
                if math.abs(u8) <= 3 then
                    v44 = ((u6 > ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2) and -1) or 1
                else
                    v44 = math.sign(u8)
                end
                local v45 = 0
                local v46 = 0
                local v52 = 0
                local v53 = 0
                local v54
                v54 = v44
                local v55 = nil
                local v56 = nil
                for _, value_2 in {v44, -v44} do
                    for n_1 = 0, 45 do
                        if n_1 > 0 then
                            if v55 == 0 or math.sign(v55) == value_2 then
                                v55 = v55 + value_2 * ICY_TOWER_CONFIG_upv_1.runAccelPx
                            else
                                v55 = v55 * ICY_TOWER_CONFIG_upv_1.turnFriction + value_2 * ICY_TOWER_CONFIG_upv_1.runAccelPx
                            end
                            v55 = math.clamp(v55, -ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx)
                            v56 = v56 + v55
                        end
                        if v56 < v49 or v48 < v56 then
                            break
                        end
                        if v55 * value_2 <= 0 then
                            continue
                        end
                        local v57
                        if n_1 % 2 == 1 then
                            continue
                        end
                        v57 = predictHeldFlight_upv_1(v56, math.abs(v55), value_2)
                        if v57 == nil or v57.marginPx < 14 then
                            continue
                        end
                        if v45 < v57.floorsUp or v57.floorsUp == v45 and v46 < v57.marginPx then
                            v45, v46, v53, v54, v52 = v57.floorsUp, v57.marginPx, v57.landingXPx, value_2, v56
                        end
                    end
                end
                if v45 <= 0 then
                    if a12 then
                        while u24 < (u11 + 1) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                            u24 = u24 + 1
                            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                        end
                        u27 = u11 + 1
                        v42 = tbl_upv_4[u27]
                        if v42 == nil then
                            local steerErrorPx_2 = u2.steerErrorPx
                            while u24 < u27 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                                u24 = u24 + 1
                                tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                            end
                            local v44
                            v44 = tbl_upv_4[u27]
                            if v44 == nil then
                                local v45
                                v45 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                            else
                                local v46
                                v46 = {}
                                v46.lowPx = math.max((v44.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                                v46.highPx = math.min((v44.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                                local v45
                                v45 = (v46.lowPx + v46.highPx) / 2
                            end
                            u28 = math.clamp(v45 + jitterNormal_upv_1(random_upv_1, steerErrorPx_2), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        else
                            local v43
                            v43 = {}
                            v43.lowPx = math.max((v42.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                            v43.highPx = math.min((v42.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                            u28 = math.clamp(math.clamp(u6, v43.lowPx, v43.highPx) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        end
                    else
                        local v47 = u11 + 1
                        v42 = u2.steerErrorPx
                        while u24 < v47 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                            u24 = u24 + 1
                            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                        end
                        u27 = v47
                        local v48
                        v48 = tbl_upv_4[v47]
                        if v48 == nil then
                            local v49
                            v49 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                        else
                            local tbl_11 = {}
                            tbl_11.lowPx = math.max((v48.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                            tbl_11.highPx = math.min((v48.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                            local v49
                            v49 = (tbl_11.lowPx + tbl_11.highPx) / 2
                        end
                        u28 = math.clamp(v49 + jitterNormal_upv_1(random_upv_1, v42), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    end
                    u29 = 0
                    u30 = 0
                    local v50 = math.max(u2.reactionSeconds - 0.1, 0.02) * 7
                    v42 = (a12 and 0) or (jitteredDelay_upv_1(random_upv_1, v50, 0.5) / u1)
                    u32 = math.max(math.round(v41 + v42), 0)
                else
                    u27 = u11 + v45
                    while u24 < (u11 + v45) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                        u24 = u24 + 1
                        tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                    end
                    u28 = math.clamp(v53 + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    u37 = 0
                    u29 = v54
                    u31 = math.clamp((v52 + (((v54 * v41) * ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx) * 0.6)) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    u30 = 0.5
                    u32 = 0
                    return nil
                end
            else
                v51 = chance_upv_1(random_upv_1, u2.comboGreed)
                if v51 then
                    v42 = tbl_upv_4[u11]
                    local v48
                    if v42 == nil then
                        v48 = ICY_TOWER_CONFIG_upv_1.playerClampMaxPx
                    else
                        v48 = math.min((v42.collisionRightPx + playerHalfWidthPx_upv_1) - 4, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    end
                    local v49
                    if v42 == nil then
                        v49 = ICY_TOWER_CONFIG_upv_1.playerClampMinPx
                    else
                        v49 = math.max((v42.collisionLeftPx - playerHalfWidthPx_upv_1) + 4, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                    end
                    local v44
                    if math.abs(u8) <= 3 then
                        v44 = ((u6 > ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2) and -1) or 1
                    else
                        v44 = math.sign(u8)
                    end
                    local v45 = 0
                    local v46 = 0
                    local v52 = 0
                    local v53 = 0
                    local v54
                    v54 = v44
                    local v55 = nil
                    local v56 = nil
                    for _, value_2 in {v44, -v44} do
                        for n_1 = 0, 45 do
                            if n_1 > 0 then
                                if v55 == 0 or math.sign(v55) == value_2 then
                                    v55 = v55 + value_2 * ICY_TOWER_CONFIG_upv_1.runAccelPx
                                else
                                    v55 = v55 * ICY_TOWER_CONFIG_upv_1.turnFriction + value_2 * ICY_TOWER_CONFIG_upv_1.runAccelPx
                                end
                                v55 = math.clamp(v55, -ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx)
                                v56 = v56 + v55
                            end
                            if v56 < v49 or v48 < v56 then
                                break
                            end
                            if v55 * value_2 <= 0 then
                                continue
                            end
                            local v57
                            if n_1 % 2 == 1 then
                                continue
                            end
                            v57 = predictHeldFlight_upv_1(v56, math.abs(v55), value_2)
                            if v57 == nil or v57.marginPx < 14 then
                                continue
                            end
                            if v45 < v57.floorsUp or v57.floorsUp == v45 and v46 < v57.marginPx then
                                v45, v46, v53, v54, v52 = v57.floorsUp, v57.marginPx, v57.landingXPx, value_2, v56
                            end
                        end
                    end
                    if v45 <= 0 then
                        if a12 then
                            while u24 < (u11 + 1) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                                u24 = u24 + 1
                                tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                            end
                            u27 = u11 + 1
                            v42 = tbl_upv_4[u27]
                            if v42 == nil then
                                local steerErrorPx_2 = u2.steerErrorPx
                                while u24 < u27 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                                    u24 = u24 + 1
                                    tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                                end
                                local v44
                                v44 = tbl_upv_4[u27]
                                if v44 == nil then
                                    local v45
                                    v45 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                                else
                                    local v46
                                    v46 = {}
                                    v46.lowPx = math.max((v44.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                                    v46.highPx = math.min((v44.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                                    local v45
                                    v45 = (v46.lowPx + v46.highPx) / 2
                                end
                                u28 = math.clamp(v45 + jitterNormal_upv_1(random_upv_1, steerErrorPx_2), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                            else
                                local v43
                                v43 = {}
                                v43.lowPx = math.max((v42.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                                v43.highPx = math.min((v42.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                                u28 = math.clamp(math.clamp(u6, v43.lowPx, v43.highPx) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                            end
                        else
                            local v47 = u11 + 1
                            v42 = u2.steerErrorPx
                            while u24 < v47 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                                u24 = u24 + 1
                                tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                            end
                            u27 = v47
                            local v48
                            v48 = tbl_upv_4[v47]
                            if v48 == nil then
                                local v49
                                v49 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                            else
                                local tbl_11 = {}
                                tbl_11.lowPx = math.max((v48.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                                tbl_11.highPx = math.min((v48.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                                local v49
                                v49 = (tbl_11.lowPx + tbl_11.highPx) / 2
                            end
                            u28 = math.clamp(v49 + jitterNormal_upv_1(random_upv_1, v42), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        end
                        u29 = 0
                        u30 = 0
                        local v50 = math.max(u2.reactionSeconds - 0.1, 0.02) * 7
                        v42 = (a12 and 0) or (jitteredDelay_upv_1(random_upv_1, v50, 0.5) / u1)
                        u32 = math.max(math.round(v41 + v42), 0)
                    else
                        u27 = u11 + v45
                        while u24 < (u11 + v45) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                            u24 = u24 + 1
                            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                        end
                        u28 = math.clamp(v53 + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        u37 = 0
                        u29 = v54
                        u31 = math.clamp((v52 + (((v54 * v41) * ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx) * 0.6)) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        u30 = 0.5
                        u32 = 0
                        return nil
                    end
                else
                    local v43 = nil
                    if a12 then
                        while u24 < (u11 + 1) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                            u24 = u24 + 1
                            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                        end
                        u27 = u11 + 1
                        v42 = tbl_upv_4[u27]
                        if v42 == nil then
                            local steerErrorPx_2 = u2.steerErrorPx
                            while u24 < u27 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                                u24 = u24 + 1
                                tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                            end
                            local v44
                            v44 = tbl_upv_4[u27]
                            if v44 == nil then
                                local v45
                                v45 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                            else
                                local v46
                                v46 = {}
                                v46.lowPx = math.max((v44.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                                v46.highPx = math.min((v44.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                                local v45
                                v45 = (v46.lowPx + v46.highPx) / 2
                            end
                            u28 = math.clamp(v45 + jitterNormal_upv_1(random_upv_1, steerErrorPx_2), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        else
                            local v43
                            v43 = {}
                            v43.lowPx = math.max((v42.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                            v43.highPx = math.min((v42.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                            u28 = math.clamp(math.clamp(u6, v43.lowPx, v43.highPx) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                        end
                    else
                        local v47 = u11 + 1
                        v42 = u2.steerErrorPx
                        while u24 < v47 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                            u24 = u24 + 1
                            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                        end
                        u27 = v47
                        local v48
                        v48 = tbl_upv_4[v47]
                        if v48 == nil then
                            local v49
                            v49 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                        else
                            local tbl_11 = {}
                            tbl_11.lowPx = math.max((v48.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                            tbl_11.highPx = math.min((v48.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                            local v49
                            v49 = (tbl_11.lowPx + tbl_11.highPx) / 2
                        end
                        u28 = math.clamp(v49 + jitterNormal_upv_1(random_upv_1, v42), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    end
                    u29 = 0
                    u30 = 0
                    local v50 = math.max(u2.reactionSeconds - 0.1, 0.02) * 7
                    v42 = (a12 and 0) or (jitteredDelay_upv_1(random_upv_1, v50, 0.5) / u1)
                    u32 = math.max(math.round(v41 + v42), 0)
                end
            end
        end
    end
    local function executePlan_upv_1(a13)
        --[[
          name: executePlan
          line: 422
          upvalues:
            u30 (ref,  index: 1)
            u34 (ref,  index: 2)
            u29 (ref,  index: 3)
            u8 (ref,  index: 4)
            u6 (ref,  index: 5)
            u31 (ref,  index: 6)
            u35 (ref,  index: 7)
            u37 (ref,  index: 8)
            u36 (ref,  index: 9)
            u28 (ref,  index: 10)
            jitteredDelay_upv_1 (copy, index: 11)
            random_upv_1 (copy, index: 12)
            u2 (copy, index: 13)
            u1 (copy, index: 14)
            u32 (ref,  index: 15)
            u7 (ref,  index: 16)
            u13 (ref,  index: 17)
            chance_upv_1 (copy, index: 18)
            u11 (ref,  index: 19)
            tbl_upv_4 (copy, index: 20)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 21)
            playerHalfWidthPx_upv_1 (copy, index: 22)
            floorSpacingPx_upv_1 (copy, index: 23)
            u24 (ref,  index: 24)
            generateFloorSpec_upv_1 (copy, index: 25)
            u3 (copy, index: 26)
            u27 (ref,  index: 27)
            jitterNormal_upv_1 (copy, index: 28)
            u26 (ref,  index: 29)
        ]]
        local v59 = nil
        if u30 <= 0 then
            if u37 <= 0 then
                v59 = u28 - u6
                u36 = u28 - u6 > 4 and 1 or u28 - u6 >= -4 and 0 or -1
                u37 = math.max(math.round(jitteredDelay_upv_1(random_upv_1, u2.reactionSeconds, 0.35) / u1) - 1, 0)
            else
                u37 = u37 - 1
            end
            u34 = nil
            if math.abs(u28 - u6) <= 140 then
                if u32 <= 0 then
                    u35 = true
                else
                    u32 = u32 - 1
                end
            end
        else
            u34 = u29
            if u8 * u29 > 0 and (u6 - u31) * u29 >= 0 then
                u35 = true
            end
        end
        if a13 and not (u35) then
            if u7 - u13 <= 24 then
                u35 = true
                v59 = chance_upv_1(random_upv_1, u2.jumpSigmaSeconds * 3.5)
                if v59 then
                    u36 = 0
                    u37 = 60
                end
            end
        end
        if not (u35) then
            local v60 = u34
            v59 = tbl_upv_4[u11]
            local v61, v62 = nil, nil
            local v65 = nil
            if v59 ~= nil then
                v65 = ((v60 == 0) and (u8 * ICY_TOWER_CONFIG_upv_1.idleFriction)) or (math.clamp(u8 + (v60 * ICY_TOWER_CONFIG_upv_1.runAccelPx), -ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx))
                v61 = u6 + v65
                local v64 = true
                if (v59.collisionRightPx + playerHalfWidthPx_upv_1) - 4 < v61 then
                    v62 = v64
                else
                    v62 = v61 < (v59.collisionLeftPx - playerHalfWidthPx_upv_1) + 4
                end
            else
                v62 = false
            end
            if v62 then
                local tbl_12 = 0
                local v66 = math.max(ICY_TOWER_CONFIG_upv_1.jumpSpeedFactor * math.abs(u8), ICY_TOWER_CONFIG_upv_1.baseJumpSpeedPx)
                while v66 > 0 do
                    tbl_12 = tbl_12 + v66
                    v66 = v66 - ICY_TOWER_CONFIG_upv_1.gravityPx
                end
                local v67 = u11 + math.clamp(math.floor((tbl_12 - 2) / floorSpacingPx_upv_1), 1, 4)
                local steerErrorPx_3 = u2.steerErrorPx
                while u24 < v67 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
                    u24 = u24 + 1
                    tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
                end
                u27 = v67
                v65 = tbl_upv_4[v67]
                if v65 == nil then
                    v61 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
                else
                    tbl_12 = {}
                    tbl_12.lowPx = math.max((v65.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                    tbl_12.highPx = math.min((v65.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    v61 = (tbl_12.lowPx + tbl_12.highPx) / 2
                end
                u28 = math.clamp(v61 + jitterNormal_upv_1(random_upv_1, steerErrorPx_3), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                u37 = 0
                u29 = 0
                u30 = 0
                u32 = 0
                u26 = true
                if u37 <= 0 then
                    local _ = u28 - u6
                    u36 = u28 - u6 > 4 and 1 or u28 - u6 >= -4 and 0 or -1
                    u37 = math.max(math.round(jitteredDelay_upv_1(random_upv_1, u2.reactionSeconds, 0.35) / u1) - 1, 0)
                else
                    u37 = u37 - 1
                end
                u34 = nil
                u35 = true
            end
        end
    end
    local function decide_upv_1()
        --[[
          name: decide
          line: 455
          upvalues:
            u34 (ref,  index: 1)
            u10 (ref,  index: 3)
            u26 (ref,  index: 4)
            u9 (ref,  index: 5)
            u7 (ref,  index: 6)
            u27 (ref,  index: 7)
            floorSpacingPx_upv_1 (copy, index: 8)
            u30 (ref,  index: 9)
            u8 (ref,  index: 10)
            u29 (ref,  index: 11)
            u37 (ref,  index: 12)
            u36 (ref,  index: 13)
            u28 (ref,  index: 14)
            u6 (ref,  index: 15)
            jitteredDelay_upv_1 (copy, index: 16)
            random_upv_1 (copy, index: 17)
            u2 (copy, index: 18)
            u1 (copy, index: 19)
            u33 (ref,  index: 20)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 21)
            tbl_upv_4 (copy, index: 22)
            playerHalfWidthPx_upv_1 (copy, index: 23)
            jitterNormal_upv_1 (copy, index: 24)
            u39 (ref,  index: 25)
            u4 (copy, index: 26)
            u15 (ref,  index: 27)
            u13 (ref,  index: 28)
            u38 (ref,  index: 29)
            u11 (ref,  index: 30)
            makePlan_upv_1 (copy, index: 31)
            executePlan_upv_1 (copy, index: 32)
        ]]
        u34 = 0
        u34 = false
        local v68 = nil
        if u10 then
            u39 = u39 + 1
            if u39 > 250 then
                u39 = 0
                u39 = false
            end
            local v69 = u4:ready(u1)
            if u15 and (u7 - u13 <= ICY_TOWER_CONFIG_upv_1.panicDistFromBottomPx) then
                if u38 < 0 then
                    u38 = math.max(math.round(jitteredDelay_upv_1(random_upv_1, u2.reactionSeconds, 0.35) / u1), 0)
                end
                if u38 ~= 0 then
                    u38 = u38 - 1
                else
                    if not (u26) or u27 <= u11 then
                        makePlan_upv_1(true)
                    end
                    executePlan_upv_1(true)
                    return nil
                end
            else
                u38 = -1
            end
            if v69 then
                if not (u26) then
                    makePlan_upv_1(false)
                end
                executePlan_upv_1(false)
            else
                u34 = u29
                return nil
            end
        else
            if u26 and (u9 > 0 or u27 * floorSpacingPx_upv_1 <= u7) then
                if u30 <= 0 then
                    if u37 <= 0 then
                        local _ = u28 - u6
                        u36 = u28 - u6 > 4 and 1 or u28 - u6 >= -4 and 0 or -1
                        u37 = math.max(math.round(jitteredDelay_upv_1(random_upv_1, u2.reactionSeconds, 0.35) / u1) - 1, 0)
                    else
                        u37 = u37 - 1
                    end
                elseif u8 ~= 0 then
                    local _ = math.sign(u8)
                end
                u34 = nil
                return nil
            end
            local v70 = math.max(math.floor(u7 / floorSpacingPx_upv_1), 0)
            if u33 < 0 or v70 < u33 then
                local v71 = math.max(math.abs(u9), ICY_TOWER_CONFIG_upv_1.gravityPx * 4)
                local v72
                v72 = v70
                for n_2 = 0, 1 do
                    local v73
                    v73 = v70 - n_2
                    local v74, v75, v76
                    if v73 < 0 then
                        break
                    end
                    v74 = tbl_upv_4[v73]
                    if v74 == nil then
                        continue
                    end
                    v75 = {}
                    v75.lowPx = math.max((v74.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                    v75.highPx = math.min((v74.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    v76 = math.max((u7 - (v73 * floorSpacingPx_upv_1)) / v71, 1)
                    if math.abs(((v75.lowPx + v75.highPx) / 2) - u6) <= (ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx * v76) * 0.7 then
                        v72 = v73
                        break
                    else
                        v72 = v73
                    end
                end
                u33 = v72
                v68 = tbl_upv_4[v72]
                if v68 ~= nil then
                    local tbl_13 = {}
                    tbl_13.lowPx = math.max((v68.collisionLeftPx - playerHalfWidthPx_upv_1) + 10, ICY_TOWER_CONFIG_upv_1.playerClampMinPx)
                    tbl_13.highPx = math.min((v68.collisionRightPx + playerHalfWidthPx_upv_1) - 10, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                    u28 = math.clamp(((tbl_13.lowPx + tbl_13.highPx) / 2) + jitterNormal_upv_1(random_upv_1, u2.steerErrorPx * 0.5), ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
                end
            end
            local v77 = u28 - u6
            u34 = ((v77 > 4) and 1) or (((v77 >= -4) and 0) or -1)
            return nil
        end
    end
    local function updateGroundSupport_1()
        --[[
          name: updateGroundSupport
          line: 534
          upvalues:
            u11 (ref,  index: 1)
            tbl_upv_4 (copy, index: 2)
            u6 (ref,  index: 3)
            playerHalfWidthPx_upv_1 (copy, index: 4)
            u10 (ref,  index: 5)
            u9 (ref,  index: 6)
        ]]
        local v78 = tbl_upv_4[u11]
        if v78 ~= nil then
            if math.min(u6 + playerHalfWidthPx_upv_1, v78.collisionRightPx) - math.max(u6 - playerHalfWidthPx_upv_1, v78.collisionLeftPx) > 0 then
                return true
            end
            u10 = false
            u9 = 0
            return false
        end
        return true
    end
    local function applyScroll_upv_1()
        --[[
          name: applyScroll
          line: 551
          upvalues:
            u13 (ref,  index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
            u7 (ref,  index: 3)
            u14 (ref,  index: 4)
            u15 (ref,  index: 5)
            u16 (ref,  index: 6)
            u18 (ref,  index: 7)
            u17 (ref,  index: 8)
        ]]
        local v79 = u13 + ICY_TOWER_CONFIG_upv_1.logicalWindowPx - u7
        local v80 = ICY_TOWER_CONFIG_upv_1.followAboveWindowPx
        if v79 >= 0 then
            local _ = 0
            for v81, value_3 in ICY_TOWER_CONFIG_upv_1.followCatchUpBands do
                if value_3[1] <= v79 then
                    v80 = value_3[2]
                end
            end
        end
        if ICY_TOWER_CONFIG_upv_1.autoScrollActivationPx < u14 + v80 then
            u15 = true
            if u16 <= 0 then
                if not (u18) then
                    v80 = v80 + 1
                end
            else
                v80 = v80 + u16
            end
            if u16 < ICY_TOWER_CONFIG_upv_1.autoScrollMaxLevel then
                u17 = u17 + 1
                if ICY_TOWER_CONFIG_upv_1.speedUpIntervalTicks < u17 then
                    u17 = u17 - ICY_TOWER_CONFIG_upv_1.speedUpIntervalTicks
                    u16 = u16 + 1
                end
            end
        end
        u18 = not u18
        if v80 <= 0 then
            return
        end
        u13 = u13 + v80
        u14 = u14 + v80
    end
    local function completeCombo_1()
        --[[
          name: completeCombo
          line: 585
          upvalues:
            u20 (ref,  index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
            u21 (ref,  index: 3)
            u19 (ref,  index: 4)
            u22 (ref,  index: 5)
            u12 (ref,  index: 6)
        ]]
        if ICY_TOWER_CONFIG_upv_1.comboMinJumps <= u20 then
            u21 = u21 + (u19 * u19)
            u22 = (u12 * ICY_TOWER_CONFIG_upv_1.pointsPerFloor) + u21
        end
        u19 = 0
        u20 = 0
    end
    local function handleLanding_upv_1(a14)
        --[[
          name: handleLanding
          line: 594
          upvalues:
            u11 (ref,  index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
            comboWindowTicks_upv_1 (ref,  index: 3)
            u19 (ref,  index: 4)
            u20 (ref,  index: 5)
            u12 (ref,  index: 6)
            u22 (ref,  index: 7)
            u21 (ref,  index: 8)
            u26 (ref,  index: 9)
            u33 (ref,  index: 10)
            u37 (ref,  index: 11)
            u39 (ref,  index: 12)
            u30 (ref,  index: 13)
            u2 (copy, index: 14)
            u4 (copy, index: 15)
            jitteredDelay_upv_1 (copy, index: 16)
            random_upv_1 (copy, index: 17)
            u24 (ref,  index: 18)
            generateFloorSpec_upv_1 (copy, index: 19)
            u3 (copy, index: 20)
            tbl_upv_4 (copy, index: 21)
            pruneFloors_upv_1 (copy, index: 22)
        ]]
        local v81 = a14 - u11
        local v82 = false
        if ICY_TOWER_CONFIG_upv_1.comboMinFloorsPerJump > v81 then
            if v81 ~= 0 and comboWindowTicks_upv_1 > 0 then
                comboWindowTicks_upv_1 = 1
            end
        else
            if comboWindowTicks_upv_1 <= 0 then
                u19 = v81
                u20 = 1
            else
                u19 = u19 + v81
                u20 = u20 + 1
            end
            comboWindowTicks_upv_1 = ICY_TOWER_CONFIG_upv_1.comboWindowTicks
            v82 = true
        end
        u11 = a14
        if u12 < a14 then
            u12 = a14
            u22 = a14 * ICY_TOWER_CONFIG_upv_1.pointsPerFloor + u21
        end
        u26 = false
        u33 = -1
        u37 = 0
        u39 = 0
        u4:arm(jitteredDelay_upv_1(random_upv_1, ((v82 or (u30 > 0)) and (u2.reactionSeconds * 0.25)) or (u2.reactionSeconds), 0.35))
        while u24 < a14 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors do
            u24 = u24 + 1
            tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
        end
        pruneFloors_upv_1()
    end
    local function resolveLanding_upv_1(a15, a16)
        --[[
          name: resolveLanding
          line: 628
          upvalues:
            floorSpacingPx_upv_1 (copy, index: 1)
            u7 (ref,  index: 2)
            tbl_upv_4 (copy, index: 3)
            u6 (ref,  index: 4)
            playerHalfWidthPx_upv_1 (copy, index: 5)
            u9 (ref,  index: 6)
            u10 (ref,  index: 7)
            handleLanding_upv_1 (copy, index: 8)
        ]]
        local v83 = math.floor(a16 / floorSpacingPx_upv_1)
        local v84 = math.max(math.ceil((u7 - 1) / floorSpacingPx_upv_1), 0)
        local v85 = false
        local v85, v86 = v85, v83
        local v87 = nil
        local v88 = nil
        while true do
            if v85 then
                v86 = v86 - 1
            else
                v85 = true
            end
            local v89
            if v84 > v86 or v86 < 0 then
                return
            end
            v87 = v86 * floorSpacingPx_upv_1
            if v87 > a16 or u7 >= v87 + 1 then
                continue
            end
            v89 = tbl_upv_4[v86]
            if v89 == nil then
                continue
            end
            v88 = a15 + (u6 - a15) * ((a16 - v87) / (a16 - (u7 - 1)))
            if v88 + playerHalfWidthPx_upv_1 <= v89.collisionLeftPx then
                continue
            end
            if v89.collisionRightPx > v88 - playerHalfWidthPx_upv_1 then
                break
            end
        end
        u6 = v88
        u7 = v87
        u9 = 0
        u10 = true
        handleLanding_upv_1(v86)
        return nil
    end
    local function physicsTick_upv_1()
        --[[
          name: physicsTick
          line: 673
          upvalues:
            u34 (ref,  index: 1)
            u8 (ref,  index: 2)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 3)
            u35 (ref,  index: 4)
            u10 (ref,  index: 5)
            u9 (ref,  index: 6)
            u6 (ref,  index: 7)
            u7 (ref,  index: 8)
            u11 (ref,  index: 9)
            tbl_upv_4 (copy, index: 10)
            playerHalfWidthPx_upv_1 (copy, index: 11)
            applyScroll_upv_1 (copy, index: 12)
            comboWindowTicks_upv_1 (ref,  index: 13)
            u20 (ref,  index: 14)
            u21 (ref,  index: 15)
            u19 (ref,  index: 16)
            u22 (ref,  index: 17)
            u12 (ref,  index: 18)
            resolveLanding_upv_1 (copy, index: 19)
            u13 (ref,  index: 20)
            u23 (ref,  index: 21)
        ]]
        if u34 == 0 then
            u8 = u8 * ICY_TOWER_CONFIG_upv_1.idleFriction
            if math.abs(u8) < 0.01 then
                u8 = 0
            end
        elseif u8 == 0 or math.sign(u8) == u34 then
            u8 = u8 + (u34 * ICY_TOWER_CONFIG_upv_1.runAccelPx)
        else
            u8 = (u8 * ICY_TOWER_CONFIG_upv_1.turnFriction) + (u34 * ICY_TOWER_CONFIG_upv_1.runAccelPx)
        end
        if u35 and u10 then
            u9 = math.max(ICY_TOWER_CONFIG_upv_1.jumpSpeedFactor * math.abs(u8), ICY_TOWER_CONFIG_upv_1.baseJumpSpeedPx)
            u9 = false
        end
        u8 = math.clamp(u8, -ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx)
        u6 = u6 + u8
        if u6 >= ICY_TOWER_CONFIG_upv_1.playerClampMinPx then
            if ICY_TOWER_CONFIG_upv_1.playerClampMaxPx < u6 then
                u6 = ICY_TOWER_CONFIG_upv_1.playerClampMaxPx
                u8 = u8 * -ICY_TOWER_CONFIG_upv_1.wallBounceFactor
            end
        else
            u6 = ICY_TOWER_CONFIG_upv_1.playerClampMinPx
            u8 = u8 * -ICY_TOWER_CONFIG_upv_1.wallBounceFactor
        end
        local v90 = false
        local v91 = nil
        if u10 then
            v91 = tbl_upv_4[u11]
            local v92
            if v91 == nil then
                v92 = true
            elseif math.min(u6 + playerHalfWidthPx_upv_1, v91.collisionRightPx) - math.max(u6 - playerHalfWidthPx_upv_1, v91.collisionLeftPx) > 0 then
                v92 = true
            else
                u10 = false
                u9 = 0
                v92 = false
            end
            v90 = not v92
        end
        if not (u10) and not (v90) then
            u7 = u7 + u9
            u9 = math.max(u9 - ICY_TOWER_CONFIG_upv_1.gravityPx, -ICY_TOWER_CONFIG_upv_1.terminalFallSpeedPx)
        end
        applyScroll_upv_1()
        if comboWindowTicks_upv_1 > 0 then
            comboWindowTicks_upv_1 = comboWindowTicks_upv_1 - 1
            if comboWindowTicks_upv_1 == 0 then
                if ICY_TOWER_CONFIG_upv_1.comboMinJumps <= u20 then
                    u21 = u21 + (u19 * u19)
                    u22 = (u12 * ICY_TOWER_CONFIG_upv_1.pointsPerFloor) + u21
                end
                u19 = 0
                u20 = 0
            end
        end
        if not (u10) and u9 <= 0 then
            local v93 = nil
            if v93 < u7 then
                resolveLanding_upv_1(u6, u7)
            end
        end
        if u7 >= u13 - ICY_TOWER_CONFIG_upv_1.deathBelowWindowPx then
            return
        end
        u23 = true
    end
    local function u40()
        --[[
          line: 727
          upvalues:
            u23 (ref,  index: 1)
            decide_upv_1 (copy, index: 2)
            u35 (ref,  index: 3)
            u39 (ref,  index: 4)
            physicsTick_upv_1 (copy, index: 5)
        ]]
        if u23 then
            return nil
        end
        decide_upv_1()
        if u35 then
            u39 = 0
        end
        physicsTick_upv_1()
    end
    local lookaheadFloors_1 = ICY_TOWER_CONFIG_upv_1.lookaheadFloors
    while u24 < lookaheadFloors_1 do
        u24 = u24 + 1
        tbl_upv_4[u24] = generateFloorSpec_upv_1(u3, u24)
    end
    u4:arm(jitteredDelay_upv_1(random_upv_1, u2.reactionSeconds, 0.35))
    local tbl_14 = {}
    tbl_14.step = function(a17, a18)
        --[[
          name: step
          line: 740
          upvalues:
            u23 (ref,  index: 1)
            u5 (copy, index: 2)
            u40 (copy, index: 3)
        ]]
        if u23 then
            return nil
        end
        u5:step(a18, u40)
    end
    tbl_14.snapshot = function(a19)
        --[[
          name: snapshot
          line: 746
          upvalues:
            u6 (ref,  index: 1)
            ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
            u22 (ref,  index: 3)
            u11 (ref,  index: 4)
            u19 (ref,  index: 5)
            u7 (ref,  index: 6)
        ]]
        local tbl_15 = {}
        tbl_15.score = u22
        tbl_15.values = {u11, math.clamp((u6 - ICY_TOWER_CONFIG_upv_1.playerClampMinPx) / math.max(ICY_TOWER_CONFIG_upv_1.playerClampMaxPx - ICY_TOWER_CONFIG_upv_1.playerClampMinPx, 1), 0, 1), u19, u6, u7}
        return tbl_15
    end
    tbl_14.isDead = function(a20)
        --[[
          name: isDead
          line: 753
          upvalues:
            u23 (ref, index: 1)
        ]]
        return u23
    end
    tbl_14.score = function(a21)
        --[[
          name: score
          line: 756
          upvalues:
            u22 (ref, index: 1)
        ]]
        return u22
    end
    return tbl_14
end
return tbl_3