-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "common", "distance-score").DistanceScore
local HIGHWAY_RIDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "highway-rider", "highway-rider-config").HIGHWAY_RIDER_CONFIG
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v1.chance
local jitteredDelay_upv_1 = v1.jitteredDelay
local jitterNormal_upv_1 = v1.jitterNormal
local ReactionGate_upv_1 = v1.ReactionGate
local SubStepper_upv_1 = v1.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local tp_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.modes.tp
local u1 = #tp_upv_1.laneCenters
local collisionForgiveness_1 = tp_upv_1.collisionForgiveness
if collisionForgiveness_1 == nil then
    collisionForgiveness_1 = HIGHWAY_RIDER_CONFIG_upv_1.collisionForgiveness
end
local u2 = 4 + tp_upv_1.playerHalfLength - collisionForgiveness_1
local u3 = 2.1 + tp_upv_1.playerHalfWidth - collisionForgiveness_1
local steerResponseSeconds_upv_1 = tp_upv_1.steerResponseSeconds
if steerResponseSeconds_upv_1 == nil then
    steerResponseSeconds_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.steerResponseSeconds
end
local keySteerEaseInSeconds_upv_1 = tp_upv_1.keySteerEaseInSeconds
if keySteerEaseInSeconds_upv_1 == nil then
    keySteerEaseInSeconds_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.keySteerEaseInSeconds
end
local u4 = tp_upv_1.barrierX - tp_upv_1.playerHalfWidth - 0.2
local speedMax_1 = tp_upv_1.speedMax
if speedMax_1 == nil then
    speedMax_1 = HIGHWAY_RIDER_CONFIG_upv_1.speedMax
end
local u5 = speedMax_1
local tbl_1 = {}
tbl_1.createHighwayRiderBot = function(a1)
    --[[
      name: createHighwayRiderBot
      line: 102
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveSeed_upv_1 (copy, index: 2)
        tp_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 5)
        DistanceScore_upv_1 (copy, index: 6)
        u5 (copy, index: 7)
        jitteredDelay_upv_1 (copy, index: 8)
        ReactionGate_upv_1 (copy, index: 9)
        SubStepper_upv_1 (copy, index: 10)
        u3 (copy, index: 11)
        u2 (copy, index: 12)
        chance_upv_1 (copy, index: 13)
        jitterNormal_upv_1 (copy, index: 14)
        keySteerEaseInSeconds_upv_1 (copy, index: 15)
        steerResponseSeconds_upv_1 (copy, index: 16)
        u4 (copy, index: 17)
    ]]
    local u6 = BOT_TUNING_upv_1["highway-rider-tp"][a1.difficulty]
    local random_upv_1 = a1.random
    local u7 = Random.new(deriveSeed_upv_1(a1.seed, 0))
    local u8 = u6.reactionSeconds + 0.85
    local u9 = u8 + 0.2
    local u10 = false
    local u11 = 0
    local u12 = 0
    local u13 = 0
    local u14 = tp_upv_1.laneCenters[u1 - 1]
    local startSpeed_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.startSpeed
    local u15 = 0
    local u16 = 0
    local u17 = DistanceScore_upv_1.new(HIGHWAY_RIDER_CONFIG_upv_1.studsPerPoint)
    local u18 = 0
    local u19 = 0
    local u20 = -math.huge
    local tbl_upv_2 = {}
    local tbl_upv_3 = 0
    u20 = false
    local u21 = nil
    while true do
        if u21 then
            tbl_upv_3 = tbl_upv_3 + 1
        else
            u21 = true
        end
        if tbl_upv_3 >= u1 then
            break
        end
        table.insert(tbl_upv_2, (u7:NextNumber(HIGHWAY_RIDER_CONFIG_upv_1.sameDirSpeedMin, HIGHWAY_RIDER_CONFIG_upv_1.sameDirSpeedMax)))
    end
    tbl_upv_3 = {}
    for u22 = 0, HIGHWAY_RIDER_CONFIG_upv_1.carPoolSize - 1 do
        table.insert(tbl_upv_3, {})
    end
    u21 = function(a2, a3)
        --[[
          line: 155
          upvalues:
            tbl_upv_3 (copy, index: 1)
            tp_upv_1 (copy, index: 2)
            u7 (copy, index: 3)
            tbl_upv_2 (copy, index: 4)
        ]]
        local v2 = nil
        for _, value_1 in tbl_upv_3 do
            if not value_1.active then
                v2 = value_1
                break
            end
        end
        if v2 ~= nil then
            v2.active = true
            v2.laneIndex = a2
            v2.s = a3
            v2.x = tp_upv_1.laneCenters[a2 + 1] + u7:NextNumber(-0.25, 0.25)
            v2.speed = tbl_upv_2[a2 + 1]
            v2.overlapping = false
            v2.minGap = math.huge
            v2.nearMissAwarded = false
            u7:NextInteger(0, 5)
        else
            return nil
        end
    end
    local function u23(a4)
        --[[
          line: 184
          upvalues:
            u13 (ref,  index: 1)
            u7 (copy, index: 2)
            u1 (copy, index: 3)
            u11 (ref,  index: 4)
            HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 5)
            u5 (copy, index: 6)
            tbl_upv_2 (copy, index: 7)
            tbl_upv_3 (copy, index: 8)
            u21 (copy, index: 9)
        ]]
        local v3 = u13 + a4
        local v4 = u7:NextInteger(0, u1 - 1)
        local v5 = HIGHWAY_RIDER_CONFIG_upv_1.headwaySecondsStart - (HIGHWAY_RIDER_CONFIG_upv_1.headwaySecondsStart - HIGHWAY_RIDER_CONFIG_upv_1.headwaySecondsMin) * math.min(u11 / HIGHWAY_RIDER_CONFIG_upv_1.densityRampSeconds, 1)
        for _ = 0, 1 do
            local v6 = true
            local v7 = 0
            local v8 = false
            local v9 = 0
            local v10 = false
            if v10 then
                v9 = v9 + 1
            else
                v10 = true
            end
            if v9 < u1 then
                local v11 = false
                v11, v6 = v11, v6
                for v12, value_2 in tbl_upv_3 do
                    if not (value_2.active) or value_2.laneIndex ~= v9 then
                        continue
                    end
                    if v9 == v4 and math.abs(value_2.s - v3) < (u5 - tbl_upv_2[v4 + 1]) * v5 then
                        v6 = false
                    end
                    if math.abs(value_2.s - v3) < HIGHWAY_RIDER_CONFIG_upv_1.coverageWindowSeconds * u5 then
                        v11 = true
                    end
                end
                if v11 then
                    v7 = v7 + 1
                    if v9 == v4 then
                        v8 = true
                    end
                end
                if v10 then
                    v9 = v9 + 1
                else
                    v10 = true
                end
                --[[ goto label_5 ]]--
            end
            v9 = not v8 and (u1 - 1 <= v7)
            if not (v6) or v9 then
                v4 = (v4 + u7:NextInteger(1, u1 - 1)) % u1
                continue
            end
            u21(v4, v3)
            return nil
        end
    end
    local v12 = 60
    local u24 = false
    local u22
    u22 = v12
    while true do
        if u24 then
            u22 = u22 + HIGHWAY_RIDER_CONFIG_upv_1.spawnCheckIntervalStuds
        else
            u24 = true
        end
        if u22 > HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance then
            break
        end
        u23(u22)
    end
    u22 = HIGHWAY_RIDER_CONFIG_upv_1.spawnCheckIntervalStuds
    u24 = "cruise"
    local u25 = u14
    local u26 = jitteredDelay_upv_1(random_upv_1, u6.checkInterval, 0.3)
    local u27 = 0
    local u28 = false
    local u29 = false
    local u30 = u14
    local u31 = 0
    local u32 = ReactionGate_upv_1.new()
    local u33 = SubStepper_upv_1.new(0.008333333333333333)
    local function u34()
        --[[
          line: 266
          upvalues:
            u11 (ref,  index: 1)
            u20 (ref,  index: 2)
            HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 3)
            u19 (ref,  index: 4)
            startSpeed_upv_1 (ref,  index: 5)
            u5 (copy, index: 6)
            u18 (ref,  index: 7)
        ]]
        u19 = ((u11 - u20 > HIGHWAY_RIDER_CONFIG_upv_1.nearMissComboWindowSeconds) and 1) or (math.min(u19 + 1, HIGHWAY_RIDER_CONFIG_upv_1.nearMissComboMaxMultiplier))
        u20 = u11
        u18 = u18 + ((HIGHWAY_RIDER_CONFIG_upv_1.nearMissBasePoints + (math.floor((math.clamp((startSpeed_upv_1 - HIGHWAY_RIDER_CONFIG_upv_1.speedStart) / (u5 - HIGHWAY_RIDER_CONFIG_upv_1.speedStart), 0, 1) * (HIGHWAY_RIDER_CONFIG_upv_1.speedTiers - 1)) + 0.5) * HIGHWAY_RIDER_CONFIG_upv_1.nearMissPointsPerTier)) * u19)
    end
    local function u35(a5, a6, a7, a8)
        --[[
          line: 308
          upvalues:
            HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        ]]
        if a5 > 0 then
            if a8 ~= "hold" then
                if a7 > 0 then
                    local v13 = nil
                    if a7 > a6 then
                        local accelRate_1 = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                        local v14 = (a7 - a6) / accelRate_1
                        v13 = a6 * v14 + ((accelRate_1 * v14) * v14) / 2
                        if a5 > v13 then
                            return v14 + ((a5 - v13) / a7)
                        end
                        return (-a6 + math.sqrt((a6 * a6) + ((2 * accelRate_1) * a5))) / accelRate_1
                    end
                    return a5 / a7
                end
                return math.huge
            elseif a6 <= 0 then
                return math.huge
            else
                return a5 / a6
            end
        end
        return 0
    end
    local function u36(a9, a10)
        --[[
          line: 336
          upvalues:
            tbl_upv_3 (copy, index: 1)
            u13 (ref,  index: 2)
            u3 (copy, index: 3)
            u35 (copy, index: 4)
            u2 (copy, index: 5)
            startSpeed_upv_1 (ref,  index: 6)
            u5 (copy, index: 7)
        ]]
        local v15 = math.huge
        local v16 = nil
        local v17 = nil
        for _, value_3 in tbl_upv_3 do
            if not (value_3.active) then
                continue
            end
            v16 = value_3.s - u13
            if v16 <= 0 or u3 + 0.35 <= math.abs(value_3.x - a9) then
                continue
            end
            v17 = u35(v16 - u2, startSpeed_upv_1 - value_3.speed, u5 - value_3.speed, a10)
            if v17 < v15 then
                v15 = v17
            end
        end
        return v15
    end
    local function u37(a11)
        --[[
          line: 356
          upvalues:
            startSpeed_upv_1 (ref,  index: 1)
            tbl_upv_2 (copy, index: 2)
            u2 (copy, index: 3)
            tbl_upv_3 (copy, index: 4)
            u13 (ref,  index: 5)
        ]]
        local v18 = (math.max(startSpeed_upv_1 - tbl_upv_2[a11 + 1], 0) * 0.9) + u2 + 8
        local v19 = nil
        for _, value_4 in tbl_upv_3 do
            if not (value_4.active) or value_4.laneIndex ~= a11 then
                continue
            end
            v19 = value_4.s - u13
            if v19 <= -8 or v19 >= v18 then
                continue
            end
            return false
        end
        return true
    end
    local function u38(a12)
        --[[
          line: 370
          upvalues:
            tbl_upv_3 (copy, index: 1)
            u13 (ref,  index: 2)
        ]]
        local v20 = math.huge
        local v21 = nil
        for _, value_5 in tbl_upv_3 do
            if not (value_5.active) or value_5.laneIndex ~= a12 then
                continue
            end
            v21 = value_5.s - u13
            if v21 <= 0 then
                continue
            end
            if v21 < v20 then
                v20 = v21
            end
        end
        return v20
    end
    local function u39(a13, a14)
        --[[
          line: 410
          upvalues:
            tp_upv_1 (copy, index: 1)
            u14 (ref,  index: 2)
            u3 (copy, index: 3)
            startSpeed_upv_1 (ref,  index: 4)
            tbl_upv_2 (copy, index: 5)
            u2 (copy, index: 6)
            tbl_upv_3 (copy, index: 7)
            u13 (ref,  index: 8)
            u37 (copy, index: 9)
        ]]
        local v22 = math.min(a13, a14)
        local v23 = math.max(a13, a14)
        local v24 = false
        local v24, v25 = v24, v22
        if v24 then
            v25 = v25 + 1
        else
            v24 = true
        end
        if v25 > v23 then
            return (u37(a14))
        else
            local v26, _, v29 = nil, nil, nil
            if v25 ~= a13 then
                local v27 = math.abs(tp_upv_1.laneCenters[v25 + 1] - u14) + u3
                v26 = (math.max(startSpeed_upv_1 - tbl_upv_2[v25 + 1], 0) * ((v27 / tp_upv_1.maxSteerSpeed) + 0.12)) + u2 + 4
                local v28 = nil
                for v30, value_6 in tbl_upv_3 do
                    if not (value_6.active) or value_6.laneIndex ~= v25 then
                        continue
                    end
                    v28 = value_6.s - u13
                    if v28 <= -8 or v28 >= v26 then
                        continue
                    end
                    return false
                end
            end
        end
    end
    local function u40(a15)
        --[[
          line: 445
          upvalues:
            u1 (copy, index: 1)
            u38 (copy, index: 2)
            u2 (copy, index: 3)
            startSpeed_upv_1 (ref,  index: 4)
            tbl_upv_2 (copy, index: 5)
            u5 (copy, index: 6)
            HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 7)
            u9 (copy, index: 8)
            u39 (copy, index: 9)
        ]]
        local v29 = 0
        local v30 = false
        while true do
            if v30 then
                v29 = v29 + 1
            else
                v30 = true
            end
            local v31, v32 = nil, nil
            if v29 >= u1 then
                return false
            else
                local v33
                if v29 == a15 then
                    continue
                end
                v33 = u38(v29)
                if v33 ~= math.huge then
                    v31 = v33 - u2
                    local v34 = startSpeed_upv_1 - tbl_upv_2[v29 + 1]
                    local v35 = u5 - tbl_upv_2[v29 + 1]
                    if v31 > 0 then
                        if v35 > 0 then
                            if v35 > v34 then
                                local _ = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                local v36 = (v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                local v37 = v34 * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                v32 = v31 > v34 * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                    and (v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate + (v31 - (v34 * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v35 - v34) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2)) / v35
                                    or (-v34 + math.sqrt(v34 * v34 + 2 * HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * v31)) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                            else
                                v32 = v31 / v35
                            end
                        else
                            v32 = math.huge
                        end
                    else
                        v32 = 0
                    end
                else
                    v32 = math.huge
                end
                if u9 > v32 then
                    continue
                end
            end
            v32 = u39(a15, v29)
            if v32 then
                break
            end
        end
        return true
    end
    local function u41(a16)
        --[[
          line: 277
          upvalues:
            u1 (copy, index: 1)
            tp_upv_1 (copy, index: 2)
        ]]
        local v36 = 0
        local v37 = math.huge
        local v38 = 0
        local v39 = false
        if v39 then
            v38 = v38 + 1
        else
            v39 = true
        end
        local v40 = nil
        if v38 < u1 then
            v40 = math.abs(tp_upv_1.laneCenters[v38 + 1] - a16)
            if v40 < v37 then
                v36, v37 = v38, v40
            end
            if v39 then
                v38 = v38 + 1
            else
                v39 = true
            end
        end
        return v36
    end
    local function u42()
        --[[
          line: 477
          upvalues:
            u24 (ref,  index: 1)
            u14 (ref,  index: 3)
            u36 (copy, index: 4)
            u8 (copy, index: 5)
            u30 (ref,  index: 6)
            u32 (copy, index: 7)
            u6 (copy, index: 8)
            u28 (ref,  index: 9)
            u40 (copy, index: 10)
            u41 (copy, index: 11)
            u29 (ref,  index: 12)
            u31 (ref,  index: 13)
        ]]
        local v41 = nil
        local v42 = u36(v41, "floor")
        if u24 ~= "cruise" and u24 ~= "dodge" then
            if u24 == "brake" then
                u29 = not u40(u41(u14))
                if u8 + 1.2 > v42 then
                    if u8 <= v42 and not (u29) then
                        u24 = "cruise"
                        return
                    end
                    if u36(u14, "hold") < 0.55 or u31 >= 0.5 then
                        u30 = u14
                        u32:arm(u6.reactionSeconds * 0.5)
                        u24 = "react"
                        u28 = true
                    end
                    return
                end
                u24 = "cruise"
            end
            return
        end
        if v42 >= u8 then
            if v42 >= u8 + 1.2 or u40(u41(v41)) then
                return
            end
            u30 = v41
            u24 = "brake"
            u29 = true
            u31 = 0
        else
            u30 = v41
            u32:arm(u6.reactionSeconds * (((u24 ~= "dodge") and 1) or 0.5))
            u24 = "react"
            u24 = false
        end
    end
    local function u43()
        --[[
          line: 509
          upvalues:
            u31 (ref,  index: 1)
            u28 (ref,  index: 2)
            u41 (copy, index: 3)
            u30 (ref,  index: 4)
            u36 (copy, index: 5)
            u8 (copy, index: 6)
            u40 (copy, index: 7)
            u24 (ref,  index: 8)
            u29 (ref,  index: 9)
            chance_upv_1 (copy, index: 10)
            random_upv_1 (copy, index: 11)
            u6 (copy, index: 12)
            u1 (copy, index: 13)
            u37 (copy, index: 14)
            u25 (ref,  index: 15)
            tp_upv_1 (copy, index: 16)
            jitterNormal_upv_1 (copy, index: 17)
            u27 (ref,  index: 18)
            u39 (copy, index: 19)
            u38 (copy, index: 20)
            u2 (copy, index: 21)
            startSpeed_upv_1 (ref,  index: 22)
            tbl_upv_2 (copy, index: 23)
            u5 (copy, index: 24)
            HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 25)
            u9 (copy, index: 26)
        ]]
        u31 = 0
        local v43 = u28
        u31 = false
        local v44 = u41(u30)
        local v45 = u36(u30, "floor")
        local v46 = nil
        if u8 > v45 then
            v46 = u36(u30, "hold")
            if v46 >= 0.3 and not (v43) and chance_upv_1(random_upv_1, u6.panicBrakeChance) then
                u24 = "brake"
                u24 = false
                return nil
            end
            local v47 = nil
            if chance_upv_1(random_upv_1, u6.laneErrorChance) then
                local v48 = {}
                if v44 > 0 then
                    table.insert(v48, v44 - 1)
                end
                if v44 < u1 - 1 then
                    table.insert(v48, v44 + 1)
                end
                v47 = {}
                local v49 = 0
                for _, value_7 in v48 do
                    if not u37(value_7) then
                        local v50 = v49 + 1
                        v47[v50] = value_7
                        v49 = v50
                    end
                end
                if #v47 <= 0 then
                    local tbl_4 = {}
                    v48 = -1
                    local v51 = 0
                    v49 = 0
                    local v52
                    v52 = false
                    if v52 then
                        v49 = v49 + 1
                    else
                        v52 = true
                    end
                    local v53, v54 = nil, nil
                    while v49 < u1 do
                        if v49 ~= v44 then
                            v53 = u39(v44, v49)
                            local v55 = nil
                            if v53 then
                                v55 = u38(v49)
                                if v55 ~= math.huge then
                                    v54 = v55 - u2
                                    local v56 = startSpeed_upv_1 - tbl_upv_2[v49 + 1]
                                    local v57 = u5 - tbl_upv_2[v49 + 1]
                                    if v54 > 0 then
                                        if v57 > 0 then
                                            if v57 > v56 then
                                                local _ = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                                local v68 = (v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                                local v69 = v56 * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                                v53 = v54 > v56 * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                                    and (v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate + (v54 - (v56 * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2)) / v57
                                                    or (-v56 + math.sqrt(v56 * v56 + 2 * HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * v54)) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                            else
                                                v53 = v54 / v57
                                            end
                                        else
                                            v53 = math.huge
                                        end
                                    else
                                        v53 = 0
                                    end
                                else
                                    v53 = math.huge
                                end
                                if u9 > v53 then
                                    if math.max(v46, 0.45) < v53 and v51 < v53 and math.abs(v49 - v44) == 1 then
                                        v48, v51 = v49, v53
                                    end
                                else
                                    table.insert(tbl_4, v49)
                                end
                            end
                        end
                        if v52 then
                            v49 = v49 + 1
                        else
                            v52 = true
                        end
                    end
                    if #tbl_4 == 0 and v48 >= 0 and v46 < 0.6 then
                        table.insert(tbl_4, v48)
                    end
                    if #tbl_4 ~= 0 then
                        v49 = tbl_4[1]
                        if #tbl_4 > 1 then
                            v52 = -math.huge
                            local tbl_5 = {}
                            local v58, v59 = nil, nil
                            local v60 = nil
                            local v61 = nil
                            local v62 = nil
                            local tbl_6 = nil
                            local value_8 = nil
                            local v63 = nil
                            local v64 = nil
                            local v65 = nil
                            for _, value_8 in tbl_4 do
                                v58 = true
                                if value_8 ~= 0 then
                                    v58 = value_8 == u1 - 1
                                end
                                if v58 then
                                    v59 = ((startSpeed_upv_1 >= 80) and 0.5) or 1.5
                                else
                                    v59 = 0
                                end
                                v63 = u38(value_8)
                                if v63 ~= math.huge then
                                    v64 = v63 - u2
                                    local v66 = startSpeed_upv_1 - tbl_upv_2[value_8 + 1]
                                    local v67 = u5 - tbl_upv_2[value_8 + 1]
                                    if v64 > 0 then
                                        if v67 > 0 then
                                            if v67 > v66 then
                                                local v70 = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                                local v71 = (v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                                local v72 = v66 * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                                v60 = v64 > v66 * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                                    and (v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate + (v64 - (v66 * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2)) / v67
                                                    or (-v66 + math.sqrt(v66 * v66 + 2 * HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * v64)) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                            else
                                                v60 = v64 / v67
                                            end
                                        else
                                            v60 = math.huge
                                        end
                                    else
                                        v60 = 0
                                    end
                                else
                                    v60 = math.huge
                                end
                                v61 = math.min(v60, 2)
                                v62 = 0
                                tbl_6 = {}
                                if value_8 > 0 then
                                    table.insert(tbl_6, value_8 - 1)
                                end
                                if value_8 < u1 - 1 then
                                    table.insert(tbl_6, value_8 + 1)
                                end
                                for v73, value_9 in tbl_6 do
                                    v62 = (u37(value_9) and (v62 + 1)) or v62
                                end
                                v65 = (v61 + (0.8 * v62)) - (math.abs(value_8 - v44) * 0.25) - v59
                                if v52 + 0.05 < v65 then
                                    table.clear(tbl_5)
                                    table.insert(tbl_5, value_8)
                                    v52 = v65
                                    continue
                                end
                                if v52 - 0.05 < v65 then
                                    table.insert(tbl_5, value_8)
                                end
                            end
                            v49 = tbl_5[random_upv_1:NextInteger(0, #tbl_5 - 1) + 1]
                        end
                        u25 = (tp_upv_1.laneCenters[v49 + 1] + (math.sign(tp_upv_1.laneCenters[v44 + 1] - tp_upv_1.laneCenters[v49 + 1]) * 1.4)) + jitterNormal_upv_1(random_upv_1, 0.35)
                        u24 = "dodge"
                    else
                        u24 = "brake"
                        u29 = true
                        return nil
                    end
                else
                    u25 = tp_upv_1.laneCenters[v47[random_upv_1:NextInteger(0, #v47 - 1) + 1] + 1] + jitterNormal_upv_1(random_upv_1, 0.35)
                    u27 = 1.1
                    u24 = "dodge"
                    return nil
                end
            else
                local tbl_4 = {}
                local v48
                v48 = -1
                local v51 = 0
                local v49
                v49 = 0
                local v52
                v52 = false
                if v52 then
                    v49 = v49 + 1
                else
                    v52 = true
                end
                local v53, v54 = nil, nil
                if v49 < u1 then
                    if v49 ~= v44 then
                        v53 = u39(v44, v49)
                        local v55 = nil
                        if v53 then
                            v55 = u38(v49)
                            if v55 ~= math.huge then
                                v54 = v55 - u2
                                local v56 = startSpeed_upv_1 - tbl_upv_2[v49 + 1]
                                local v57 = u5 - tbl_upv_2[v49 + 1]
                                if v54 > 0 then
                                    if v57 > 0 then
                                        if v57 > v56 then
                                            local _ = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                            local v68 = (v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                            local v69 = v56 * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                            v53 = v54 > v56 * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                                and (v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate + (v54 - (v56 * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v57 - v56) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2)) / v57
                                                or (-v56 + math.sqrt(v56 * v56 + 2 * HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * v54)) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                        else
                                            v53 = v54 / v57
                                        end
                                    else
                                        v53 = math.huge
                                    end
                                else
                                    v53 = 0
                                end
                            else
                                v53 = math.huge
                            end
                            if u9 > v53 then
                                if math.max(v46, 0.45) < v53 and v51 < v53 and math.abs(v49 - v44) == 1 then
                                    v48, v51 = v49, v53
                                end
                            else
                                table.insert(tbl_4, v49)
                            end
                        end
                    end
                    if v52 then
                        v49 = v49 + 1
                    else
                        v52 = true
                    end
                end
                if #tbl_4 == 0 and v48 >= 0 and v46 < 0.6 then
                    table.insert(tbl_4, v48)
                end
                if #tbl_4 ~= 0 then
                    v49 = tbl_4[1]
                    if #tbl_4 > 1 then
                        v52 = -math.huge
                        local tbl_5 = {}
                        local v58, v59 = nil, nil
                        local v60 = nil
                        local v61 = nil
                        local v62 = nil
                        local tbl_6 = nil
                        local value_8 = nil
                        local v63 = nil
                        local v64 = nil
                        local v65 = nil
                        for _, value_8 in tbl_4 do
                            v58 = true
                            if value_8 ~= 0 then
                                v58 = value_8 == u1 - 1
                            end
                            if v58 then
                                v59 = ((startSpeed_upv_1 >= 80) and 0.5) or 1.5
                            else
                                v59 = 0
                            end
                            v63 = u38(value_8)
                            if v63 ~= math.huge then
                                v64 = v63 - u2
                                local v66 = startSpeed_upv_1 - tbl_upv_2[value_8 + 1]
                                local v67 = u5 - tbl_upv_2[value_8 + 1]
                                if v64 > 0 then
                                    if v67 > 0 then
                                        if v67 > v66 then
                                            local v70 = HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                            local v71 = (v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                            local v72 = v66 * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                            v60 = v64 > v66 * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2
                                                and (v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate + (v64 - (v66 * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) + HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) * ((v67 - v66) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate) / 2)) / v67
                                                or (-v66 + math.sqrt(v66 * v66 + 2 * HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * v64)) / HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate
                                        else
                                            v60 = v64 / v67
                                        end
                                    else
                                        v60 = math.huge
                                    end
                                else
                                    v60 = 0
                                end
                            else
                                v60 = math.huge
                            end
                            v61 = math.min(v60, 2)
                            v62 = 0
                            tbl_6 = {}
                            if value_8 > 0 then
                                table.insert(tbl_6, value_8 - 1)
                            end
                            if value_8 < u1 - 1 then
                                table.insert(tbl_6, value_8 + 1)
                            end
                            for v73, value_9 in tbl_6 do
                                v62 = (u37(value_9) and (v62 + 1)) or v62
                            end
                            v65 = (v61 + (0.8 * v62)) - (math.abs(value_8 - v44) * 0.25) - v59
                            if v52 + 0.05 < v65 then
                                table.clear(tbl_5)
                                table.insert(tbl_5, value_8)
                                v52 = v65
                                continue
                            end
                            if v52 - 0.05 < v65 then
                                table.insert(tbl_5, value_8)
                            end
                        end
                        v49 = tbl_5[random_upv_1:NextInteger(0, #tbl_5 - 1) + 1]
                    end
                    u25 = (tp_upv_1.laneCenters[v49 + 1] + (math.sign(tp_upv_1.laneCenters[v44 + 1] - tp_upv_1.laneCenters[v49 + 1]) * 1.4)) + jitterNormal_upv_1(random_upv_1, 0.35)
                    u24 = "dodge"
                else
                    u24 = "brake"
                    u29 = true
                    return nil
                end
            end
        else
            if v43 then
                if v45 >= u8 + 1.2 or u40(v44) then
                    u24 = "cruise"
                else
                    u24 = "brake"
                    u29 = true
                end
            else
                u24 = "cruise"
            end
            return nil
        end
    end
    local function u44(a17)
        --[[
          line: 633
          upvalues:
            u10 (ref,  index: 1)
            u12 (ref,  index: 2)
            HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 3)
            u27 (ref,  index: 4)
            u31 (ref,  index: 5)
            u26 (ref,  index: 6)
            jitteredDelay_upv_1 (copy, index: 7)
            random_upv_1 (copy, index: 8)
            u6 (copy, index: 9)
            u42 (copy, index: 10)
            u24 (ref,  index: 11)
            u32 (copy, index: 12)
            u43 (copy, index: 13)
            u25 (ref,  index: 14)
            u14 (ref,  index: 15)
            keySteerEaseInSeconds_upv_1 (copy, index: 16)
            u16 (ref,  index: 17)
            tp_upv_1 (copy, index: 18)
            u15 (ref,  index: 19)
            steerResponseSeconds_upv_1 (copy, index: 20)
            u4 (copy, index: 21)
            u11 (ref,  index: 22)
            u29 (ref,  index: 24)
            u36 (copy, index: 25)
            startSpeed_upv_1 (ref,  index: 26)
            u5 (copy, index: 27)
            u13 (ref,  index: 28)
            tbl_upv_3 (copy, index: 29)
            u2 (copy, index: 30)
            u3 (copy, index: 31)
            u34 (copy, index: 32)
            u22 (ref,  index: 33)
            u23 (copy, index: 34)
            u17 (copy, index: 35)
        ]]
        if u10 then
            return nil
        else
            local v68 = u12 < HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds
            if v68 then
                u12 = u12 + a17
            end
            if u27 > 0 then
                u27 = u27 - a17
            end
            u31 = u31 + a17
            u26 = u26 - a17
            if u26 <= 0 then
                u26 = jitteredDelay_upv_1(random_upv_1, u6.checkInterval, 0.3)
                if u27 <= 0 then
                    u42()
                end
            end
            if u24 == "react" and u32:ready(a17) then
                u43()
            end
            local v69 = (v68 and 0) or (math.clamp((u25 - u14) / 2.2, -1, 1))
            local v70 = a17 / keySteerEaseInSeconds_upv_1
            u16 = u16 + math.clamp(v69 - u16, -v70, v70)
            u15 = u15 + (((u16 * tp_upv_1.maxSteerSpeed) - u15) * (1 - math.exp(-a17 / steerResponseSeconds_upv_1)))
            u14 = u14 + (u15 * a17)
            if u4 <= math.abs(u14) then
                u14 = math.clamp(u14, -u4, u4)
                u15 = 0
            end
            u11 = u11 + a17
            if not (v68) then
                local v71 = true
                if u24 ~= "brake" then
                    local v72 = false
                    if u24 ~= "react" then
                        v71 = v72
                    end
                end
                if v71 then
                    if u29 or u36(u14, "hold") < 1.35 then
                        startSpeed_upv_1 = math.max(startSpeed_upv_1 - (HIGHWAY_RIDER_CONFIG_upv_1.directDrive.brakeRate * a17), HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed)
                    end
                elseif u24 == "cruise" or u24 == "react" then
                    startSpeed_upv_1 = math.min(startSpeed_upv_1 + (HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * a17), u5)
                end
            end
            local v73 = startSpeed_upv_1 * a17
            u13 = u13 + v73
            local v74
            if tp_upv_1.scoreFloorSpeed <= startSpeed_upv_1 then
                v74 = true
            else
                v74 = false
            end
            local v75 = nil
            local v76 = nil
            local v77 = nil
            for _, value_10 in tbl_upv_3 do
                if not (value_10.active) then
                    continue
                end
                value_10.s = value_10.s + (value_10.speed * a17)
                v75 = value_10.s - u13
                if v75 < -HIGHWAY_RIDER_CONFIG_upv_1.despawnBehindDistance then
                    value_10.active = false
                    continue
                end
                v76 = math.abs(v75) <= u2
                if v76 then
                    v77 = math.abs(value_10.x - u14)
                    if v77 > u3 then
                        if v77 < value_10.minGap then
                            value_10.minGap = v77
                        end
                        value_10.overlapping = true
                    else
                        u10 = true
                        return nil
                    end
                else
                    if not (value_10.overlapping) then
                        continue
                    end
                    value_10.overlapping = false
                    if value_10.nearMissAwarded or v75 >= 0 or value_10.minGap > tp_upv_1.nearMissMaxGap or HIGHWAY_RIDER_CONFIG_upv_1.nearMissMinClosure > startSpeed_upv_1 - value_10.speed then
                        continue
                    end
                    value_10.nearMissAwarded = true
                    if v74 then
                        u34()
                    end
                end
            end
            while u22 <= u13 do
                u22 = u22 + HIGHWAY_RIDER_CONFIG_upv_1.spawnCheckIntervalStuds
                u23(HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance)
            end
            if v74 then
                u17:advance(v73)
            end
            if u24 == "dodge" and math.abs(u14 - u25) < 0.35 then
                u24 = "cruise"
            end
        end
    end
    local tbl_7 = {}
    tbl_7.step = function(a18, a19)
        --[[
          name: step
          line: 728
          upvalues:
            u10 (ref,  index: 1)
            u33 (copy, index: 2)
            u44 (copy, index: 3)
        ]]
        if u10 then
            return nil
        end
        u33:step(a19, u44)
    end
    tbl_7.snapshot = function(a20)
        --[[
          name: snapshot
          line: 734
          upvalues:
            u17 (copy, index: 1)
            u18 (ref,  index: 2)
            u14 (ref,  index: 3)
            startSpeed_upv_1 (ref,  index: 4)
            u5 (copy, index: 5)
        ]]
        local tbl_8 = {}
        tbl_8.score = u17:current() + u18
        tbl_8.values = {u14, math.clamp(startSpeed_upv_1 / u5, 0, 1), u17:current()}
        return tbl_8
    end
    tbl_7.isDead = function(a21)
        --[[
          name: isDead
          line: 742
          upvalues:
            u10 (ref, index: 1)
        ]]
        return u10
    end
    tbl_7.score = function(a22)
        --[[
          name: score
          line: 745
          upvalues:
            u17 (copy, index: 1)
            u18 (ref,  index: 2)
        ]]
        return u17:current() + u18
    end
    return tbl_7
end
return tbl_1