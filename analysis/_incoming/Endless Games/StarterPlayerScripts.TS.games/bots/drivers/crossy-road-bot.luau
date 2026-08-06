-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local CROSSY_ROAD_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "crossy-road", "crossy-road-config").CROSSY_ROAD_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "crossy-road", "crossy-road-sim")
local CrossyRoadSim_upv_1 = v1.CrossyRoadSim
local FIELD_HALF_upv_1 = v1.FIELD_HALF
local makeBoardLane_upv_1 = v1.makeBoardLane
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v2.chance
local jitteredDelay_upv_1 = v2.jitteredDelay
local jitterNormal_upv_1 = v2.jitterNormal
local SubStepper_upv_1 = v2.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local tbl_1 = {}
tbl_1.createCrossyRoadBot = function(a1)
    --[[
      name: createCrossyRoadBot
      line: 33
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
        makeBoardLane_upv_1 (copy, index: 3)
        CrossyRoadSim_upv_1 (copy, index: 4)
        SubStepper_upv_1 (copy, index: 5)
        jitteredDelay_upv_1 (copy, index: 6)
        FIELD_HALF_upv_1 (copy, index: 7)
        jitterNormal_upv_1 (copy, index: 8)
        chance_upv_1 (copy, index: 9)
    ]]
    local u1 = BOT_TUNING_upv_1["crossy-road"][a1.difficulty]
    local random_upv_1 = a1.random
    local tbl_2 = {}
    for u2 = 0, CROSSY_ROAD_CONFIG_upv_1.visibleLanes - 1 do
        table.insert(tbl_2, (makeBoardLane_upv_1()))
    end
    local u3 = false
    local tbl_3 = {}
    tbl_3.onDeath = function()
        --[[
          name: onDeath
          line: 43
          upvalues:
            u3 (ref, index: 1)
        ]]
        u3 = true
    end
    tbl_3.onEagleCarryDone = function()
        --[[
          name: onEagleCarryDone
          line: 46
          upvalues:
            u3 (ref, index: 1)
        ]]
        u3 = true
    end
    local u4 = CrossyRoadSim_upv_1.new(tbl_2, tbl_3)
    u4:reset(a1.seed)
    local u2 = SubStepper_upv_1.new(0.008333333333333333)
    local u5 = jitteredDelay_upv_1(random_upv_1, u1.decisionPeriod, 0.3)
    local u6 = 0
    local function u7(a2)
        --[[
          line: 56
          upvalues:
            u4 (copy, index: 1)
            CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
            FIELD_HALF_upv_1 (copy, index: 3)
        ]]
        local v3 = u4.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth + u4.driftX
        if a2 ~= "left" and a2 ~= "right" then
            return (math.clamp(v3, -FIELD_HALF_upv_1, FIELD_HALF_upv_1))
        end
        local v4
        if a2 ~= "left" then
            v4 = -CROSSY_ROAD_CONFIG_upv_1.cellWidth
        else
            v4 = CROSSY_ROAD_CONFIG_upv_1.cellWidth
        end
        local v5 = u4:laneAtRow(u4.row)
        local v6
        if v5 == nil or v5.kind ~= "river" or v5.moverCount <= 0 or u4.onLilyPad then
            v6 = 0
        else
            v6 = v5.velocity * CROSSY_ROAD_CONFIG_upv_1.hopDuration
        end
        return (v3 + v4) + v6
    end
    local function u8(a3, a4, a5, a6)
        --[[
          line: 78
          upvalues:
            CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
            u1 (copy, index: 2)
            u4 (copy, index: 3)
            jitterNormal_upv_1 (copy, index: 4)
            random_upv_1 (copy, index: 5)
        ]]
        if a6 == nil then
            a6 = true
        end
        if a3 ~= nil then
            local hopDuration_1 = CROSSY_ROAD_CONFIG_upv_1.hopDuration
            local v7
            if a6 then
                v7 = hopDuration_1 + u1.decisionPeriod
            else
                v7 = hopDuration_1
            end
            if a3.kind == "grass" then
                return not u4:hasBlocker(a3, a5)
            elseif a3.kind == "rail" then
                if a3.trainPhase ~= "passing" then
                    return (v7 + u1.trainSafetySeconds) < (((a3.trainPhase == "clear") and (a3.trainTimer + CROSSY_ROAD_CONFIG_upv_1.trainWarnSeconds)) or (a3.trainTimer))
                end
                return false
            elseif a3.kind ~= "road" then
                local v8 = nil
                if a3.moverCount ~= 0 then
                    local v9 = jitterNormal_upv_1(random_upv_1, u1.logAimSigma)
                    v8 = (a3.moverLength / 2) + CROSSY_ROAD_CONFIG_upv_1.logLandingAssist - u1.logEdgeMargin
                    if v8 > 0 then
                        local v10 = 0
                        local v11 = false
                        while true do
                            if v11 then
                                v10 = v10 + 1
                            else
                                v11 = true
                            end
                            if v10 >= a3.moverCount then
                                return false
                            end
                            if math.abs(u4:predictMoverX(a3, v10, hopDuration_1) - (a4 + v9)) <= v8 then
                                break
                            end
                        end
                        return true
                    end
                    return false
                end
                return u4:hasPad(a3, a5)
            else
                local v12 = jitterNormal_upv_1(random_upv_1, u1.carReadSigma)
                local v13 = 0
                local v14 = false
                if v14 then
                    v13 = v13 + 1
                else
                    v14 = true
                end
                if v13 >= a3.moverCount then
                    return true
                end
                for _, value_1 in {hopDuration_1, v7} do
                    if math.abs((u4:predictMoverX(a3, v13, value_1) + v12) - a4) > ((a3.moverLength / 2) + CROSSY_ROAD_CONFIG_upv_1.playerHalf) + u1.carSafetyStuds then
                        continue
                    end
                    return false
                end
            end
        else
            return true
        end
    end
    local function u9()
        --[[
          line: 192
          upvalues:
            u4 (copy, index: 1)
            CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
            u1 (copy, index: 3)
            FIELD_HALF_upv_1 (copy, index: 4)
        ]]
        local v15 = u4:laneAtRow(u4.row)
        if v15 ~= nil then
            local v16 = CROSSY_ROAD_CONFIG_upv_1.hopDuration + u1.decisionPeriod * 2
            if v15.kind == "river" and v15.moverCount > 0 and not (u4.onLilyPad) and not (u4.hopping) and math.abs(v15.velocity) > 0.01 and ((FIELD_HALF_upv_1 + CROSSY_ROAD_CONFIG_upv_1.carriedOffMargin) - math.abs(u4:playerWorldX())) / math.abs(v15.velocity) <= u1.sweepPanicSeconds then
                return true
            end
            if v15.kind ~= "rail" then
                if v15.kind == "road" then
                    local v17 = u4:playerWorldX()
                    local v18 = 0
                    local v19 = false
                    v19, v18 = v19, v18
                    while true do
                        if v19 then
                            v18 = v18 + 1
                        else
                            v19 = true
                        end
                        local v20 = nil
                        if v18 >= v20.moverCount then
                            return false
                        end
                        if math.abs(u4:predictMoverX(v20, v18, v16) - v17) <= (v15.moverLength / 2) + CROSSY_ROAD_CONFIG_upv_1.playerHalf then
                            break
                        end
                    end
                    return true
                end
                return false
            elseif v15.trainPhase ~= "passing" then
                return (((v15.trainPhase == "clear") and (v15.trainTimer + CROSSY_ROAD_CONFIG_upv_1.trainWarnSeconds)) or (v15.trainTimer)) <= v16
            else
                return true
            end
        end
        return false
    end
    local function u10(a7, a8)
        --[[
          line: 169
          upvalues:
            u7 (copy, index: 1)
            CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
            u4 (copy, index: 3)
            u8 (copy, index: 4)
        ]]
        if a8 == nil then
            a8 = true
        end
        local v21 = u7(a7)
        local v22 = math.round(v21 / CROSSY_ROAD_CONFIG_upv_1.cellWidth)
        if v22 >= -CROSSY_ROAD_CONFIG_upv_1.columnHalf and CROSSY_ROAD_CONFIG_upv_1.columnHalf >= v22 then
            if a7 == "back" and u4.row - 1 < u4.furthestRow - CROSSY_ROAD_CONFIG_upv_1.eagleRetreatRows then
                return false
            end
            return u8(u4:laneAtRow(((a7 == "forward") and (u4.row + 1)) or (((a7 == "back") and (u4.row - 1)) or (u4.row))), v21, v22, a8)
        end
        return false
    end
    local function u11()
        --[[
          line: 269
          upvalues:
            u4 (copy, index: 1)
            CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
            u8 (copy, index: 3)
        ]]
        local v23 = u4:laneAtRow(u4.row + 1)
        local v24 = nil
        if v23 ~= nil then
            v24 = u4:laneAtRow(u4.row)
            if v24 ~= nil and v24.kind == "river" and v24.moverCount > 0 then
                return nil
            end
            local v25 = math.huge
            local v26 = nil
            local v27 = nil
            for _, value_2 in {-1, 1} do
                for n_1 = 1, CROSSY_ROAD_CONFIG_upv_1.columnHalf * 2 do
                    local v28
                    v28 = u4.column + value_2 * n_1
                    if v28 < -CROSSY_ROAD_CONFIG_upv_1.columnHalf or CROSSY_ROAD_CONFIG_upv_1.columnHalf < v28 then
                        break
                    end
                    if v24 == nil then
                        v27 = true
                    elseif v24.kind ~= "grass" then
                        v27 = ((v24.kind ~= "river") and true) or (u4:hasPad(v24, v28))
                    else
                        v27 = not u4:hasBlocker(v24, v28)
                    end
                    if not (v27) then
                        break
                    end
                    v27 = u8(v23, v28 * CROSSY_ROAD_CONFIG_upv_1.cellWidth, v28)
                    if not (v27) then
                        continue
                    end
                    if n_1 < v25 then
                        v26 = ((value_2 <= 0) and "right") or "left"
                        v25 = n_1
                    end
                    break
                end
            end
            return v26
        end
        return nil
    end
    local function u12()
        --[[
          line: 316
          upvalues:
            chance_upv_1 (copy, index: 1)
            random_upv_1 (copy, index: 2)
            u1 (copy, index: 3)
            u4 (copy, index: 4)
            u6 (ref,  index: 5)
            u10 (copy, index: 6)
            u11 (copy, index: 7)
            u9 (copy, index: 8)
        ]]
        if chance_upv_1(random_upv_1, u1.lapseChance) then
            u4:queueHop("forward")
            u6 = 0
            return nil
        else
            local v29
            if u10("forward") then
                u4:queueHop("forward")
                u6 = 0
                return nil
            end
            v29 = u11()
            if v29 ~= nil and u10(v29) then
                u4:queueHop(v29)
                return nil
            end
            if u9() then
                if u10("forward", false) then
                    u4:queueHop("forward")
                    u6 = 0
                    return nil
                else
                    local v30 = ((chance_upv_1(random_upv_1, 0.5)) and "left") or "right"
                    local v31
                    if v30 ~= "left" then
                        v31 = "left"
                    else
                        v31 = "right"
                    end
                    for _, value_3 in {v30, v31, "back"} do
                        if not (u10(value_3, false)) then
                            continue
                        end
                        u4:queueHop(value_3)
                        return nil
                    end
                    if u1.bounceAfterSeconds <= u6 and u10("back") then
                        u4:queueHop("back")
                        u6 = 0
                        return nil
                    end
                    if u1.maxWaitSeconds <= u6 then
                        u4:queueHop("forward")
                        u6 = 0
                    end
                end
            else
                if u1.bounceAfterSeconds <= u6 and u10("back") then
                    u4:queueHop("back")
                    u6 = 0
                    return nil
                end
                if u1.maxWaitSeconds <= u6 then
                    u4:queueHop("forward")
                    u6 = 0
                end
            end
        end
    end
    local tbl_4 = {}
    tbl_4.step = function(a9, a10)
        --[[
          name: step
          line: 377
          upvalues:
            u3 (ref,  index: 1)
            u2 (copy, index: 2)
            u4 (copy, index: 3)
            u5 (ref,  index: 4)
            u6 (ref,  index: 5)
            jitteredDelay_upv_1 (copy, index: 6)
            random_upv_1 (copy, index: 7)
            u1 (copy, index: 8)
            u12 (copy, index: 9)
        ]]
        if u3 then
            return nil
        end
        u2:step(
            a10,
            function(a11)
                --[[
                  line: 381
                  upvalues:
                    u3 (ref,  index: 1)
                    u4 (copy, index: 2)
                    u5 (ref,  index: 3)
                    u6 (ref,  index: 4)
                    jitteredDelay_upv_1 (copy, index: 5)
                    random_upv_1 (copy, index: 6)
                    u1 (copy, index: 7)
                    u12 (copy, index: 8)
                ]]
                if not u3 then
                    u4:fixedUpdate(a11)
                    if not (u3) and not (u4.dead) then
                        u5 = u5 - a11
                        u6 = u6 + a11
                        if u5 <= 0 and not (u4.hopping) then
                            u5 = jitteredDelay_upv_1(random_upv_1, u1.decisionPeriod, 0.3)
                            u12()
                            return
                        end
                        return nil
                    end
                end
                return nil
            end
        )
    end
    tbl_4.snapshot = function(a12)
        --[[
          name: snapshot
          line: 398
          upvalues:
            u4 (copy, index: 1)
        ]]
        local v32 = u4:ridingLogIndex()
        local v33
        if v32 < 0 then
            v33 = nil
        else
            v33 = u4:laneAtRow(u4.row)
        end
        local v34
        if v33 == nil then
            v34 = 0
        else
            v34 = u4:playerWorldX() - v33.positions[v32 + 1]
        end
        local tbl_5 = {}
        tbl_5.score = u4.score
        tbl_5.values = {u4.boardClock, u4:playerRowContinuous(), u4:playerWorldX(), u4:poseY(), u4:facingYaw(), v32, v34}
        return tbl_5
    end
    tbl_4.isDead = function(a13)
        --[[
          name: isDead
          line: 407
          upvalues:
            u3 (ref, index: 1)
        ]]
        return u3
    end
    tbl_4.score = function(a14)
        --[[
          name: score
          line: 410
          upvalues:
            u4 (copy, index: 1)
        ]]
        return u4.score
    end
    return tbl_4
end
return tbl_1