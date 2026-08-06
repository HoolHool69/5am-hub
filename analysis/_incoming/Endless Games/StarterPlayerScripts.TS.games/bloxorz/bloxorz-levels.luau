-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "bloxorz-sim")
local cellKey_upv_1 = v1.cellKey
local occupiedCells_upv_1 = v1.occupiedCells
local ROLL_DIRECTIONS_upv_1 = v1.ROLL_DIRECTIONS
local rolledPose_upv_1 = v1.rolledPose
local solveLevel_upv_1 = v1.solveLevel
local function poseInsideBox_upv_1(a1, a2)
    --[[
      name: poseInsideBox
      line: 58
      upvalues:
        occupiedCells_upv_1 (copy, index: 1)
    ]]
    for _, value_1 in occupiedCells_upv_1(a1) do
        if value_1.X >= 0 and value_1.Y >= 0 and a2.boxWidth > value_1.X and a2.boxHeight > value_1.Y then
            continue
        end
        return false
    end
    return true
end
local function buildSpec_upv_1(a1, a2, a3, a4, a5, a6)
    --[[
      name: buildSpec
      line: 127
      upvalues:
        cellKey_upv_1 (copy, index: 1)
    ]]
    local tbl_upv_1 = {}
    local u1 = cellKey_upv_1(13, a1.goalX, a1.goalY)
    local function v2(a7)
        --[[
          line: 130
          upvalues:
            tbl_upv_1 (copy, index: 1)
            u1 (copy, index: 2)
            a4 (copy, index: 3)
            a3 (copy, index: 4)
            a2 (copy, index: 5)
        ]]
        if tbl_upv_1[a7] == nil then
            local v3 = nil
            if a7 ~= u1 then
                v3 = a4[a7]
                local v4 = nil
                if v3 == nil then
                    v4 = a3[a7]
                    if v4 == nil then
                        if a2[a7] == nil then
                            tbl_upv_1[a7] = {}
                        else
                            tbl_upv_1[a7] = {}
                            return nil
                        end
                    else
                        tbl_upv_1[a7] = {bridgeGroup = v4}
                        return nil
                    end
                else
                    tbl_upv_1[a7] = v3
                    return nil
                end
            else
                tbl_upv_1[a7] = {}
                return nil
            end
        else
            return nil
        end
    end
    for _, value_2 in a1.order do
        v2(value_2)
    end
    for key_1 in a5 do
        v2(key_1)
    end
    local tbl_2 = {}
    local v5, tbl_3
    v5, tbl_3 = false, 0
    while true do
        if v5 then
            tbl_3 = tbl_3 + 1
        else
            v5 = true
        end
        if tbl_3 >= a6 then
            break
        end
        table.insert(tbl_2, false)
    end
    tbl_3 = {}
    tbl_3.tiles = tbl_upv_1
    tbl_3.start = a1.start
    tbl_3.goalX = a1.goalX
    tbl_3.goalY = a1.goalY
    tbl_3.bridgesInitiallyOpen = tbl_2
    return tbl_3
end
local function carveWalk_upv_1(a1, a2)
    --[[
      name: carveWalk
      line: 67
      upvalues:
        occupiedCells_upv_1 (copy, index: 1)
        cellKey_upv_1 (copy, index: 2)
        ROLL_DIRECTIONS_upv_1 (copy, index: 3)
        rolledPose_upv_1 (copy, index: 4)
        poseInsideBox_upv_1 (copy, index: 5)
    ]]
    local tbl_4 = {}
    tbl_4.x = a1:NextInteger(1, math.max(a2.boxWidth - 2, 1))
    tbl_4.y = a1:NextInteger(1, math.max(a2.boxHeight - 2, 1))
    local tbl_upv_5 = {}
    local tbl_upv_6 = {}
    local tbl_7 = {}
    local v6 = function(a3)
        --[[
          line: 76
          upvalues:
            occupiedCells_upv_1 (copy, index: 1)
            cellKey_upv_1 (copy, index: 2)
            tbl_upv_5 (copy, index: 3)
            tbl_upv_6 (copy, index: 4)
        ]]
        local v7 = nil
        for _, value_3 in occupiedCells_upv_1(a3) do
            v7 = cellKey_upv_1(13, value_3.X, value_3.Y)
            if tbl_upv_5[v7] == nil then
                tbl_upv_5[v7] = true
                table.insert(tbl_upv_6, v7)
            end
        end
    end
    v6(tbl_4)
    table.insert(tbl_7, tbl_4)
    local v8 = 0
    local v9 = 0
    local v10
    v10 = tbl_4
    if v8 < a2.walkSteps or v10.orient ~= 0 then
        local v11 = nil
        if a2.walkSteps + 14 > v8 then
            v11 = rolledPose_upv_1(v10, ROLL_DIRECTIONS_upv_1[a1:NextInteger(0, 3) + 1])
            if poseInsideBox_upv_1(v11, a2) then
                v9 = 0
                v6(v11)
                table.insert(tbl_7, v11)
                v8 = v8 + 1
                v10 = v11
            else
                v9 = v9 + 1
                if v9 > 40 then
                    return nil
                end
            end
            --[[ goto label_1 ]]--
        end
    end
    if v10.orient == 0 then
        if v10.x == tbl_4.x and v10.y == tbl_4.y then
            return nil
        else
            local tbl_8 = {}
            tbl_8.cells = tbl_upv_5
            tbl_8.order = tbl_upv_6
            tbl_8.start = tbl_4
            tbl_8.goalX = v10.x
            tbl_8.goalY = v10.y
            tbl_8.poses = tbl_7
            return tbl_8
        end
    else
        return nil
    end
    --[[ label_1 ]]--
end
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 43
    ]]
    local v12 = math.min(a1, 25)
    local v13 = math.min(math.floor(v12 * 0.9) + 4, 26)
    local tbl_9 = {}
    tbl_9.boxWidth = math.min(math.ceil(v12 / 2) + 5, 13)
    tbl_9.boxHeight = math.min(math.ceil(v12 / 2.5) + 4, 11)
    tbl_9.walkSteps = v13
    tbl_9.fragiles = v12 < 4 and 0 or math.min(math.floor((v12 - 2) / 3), 5)
    tbl_9.bridgeCuts = ((v12 < 7) and 0) or (((v12 >= 15) and 2) or 1)
    tbl_9.heavyAllowed = v12 >= 10
    tbl_9.togglesAllowed = v12 >= 12
    tbl_9.decoys = math.min(math.floor(v12 / 4) + 2, 8)
    tbl_9.minDepth = math.max(3, math.floor(v13 * 0.55))
    return tbl_9
end
local tbl_10 = {}
tbl_10.levelBand = levelBand_upv_1
tbl_10.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 209
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        carveWalk_upv_1 (copy, index: 3)
        cellKey_upv_1 (copy, index: 4)
        occupiedCells_upv_1 (copy, index: 5)
        buildSpec_upv_1 (copy, index: 6)
        solveLevel_upv_1 (copy, index: 7)
    ]]
    local v15 = levelBand_upv_1(a2)
    for n_1 = 0, 59 do
        local v16 = deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + n_1)
        local v17
        v17 = carveWalk_upv_1(v16, v15)
        local v18, v19, v20
        if v17 == nil then
            continue
        end
        v18 = cellKey_upv_1(13, v17.goalX, v17.goalY)
        v19 = {}
        for v21, v22 in occupiedCells_upv_1(v17.start) do
            v19[cellKey_upv_1(13, v22.X, v22.Y)] = true
        end
        local tbl_11 = {}
        local tbl_12
        tbl_12, v20 = false, 0
        if tbl_12 then
            v20 = v20 + 1
        else
            tbl_12 = true
        end
        if v20 < v15.fragiles then
            local v21
            v21 = v17.order[v16:NextInteger(0, #v17.order - 1) + 1]
            if v21 ~= v18 and v19[v21] == nil and tbl_11[v21] == nil then
                tbl_11[v21] = true
            end
            if tbl_12 then
                v20 = v20 + 1
            else
                tbl_12 = true
            end
            --[[ goto label_9 ]]--
        end
        local tbl_13 = {}
        tbl_12 = {}
        local v21 = 0
        local v22 = 0
        local v23 = false
        if v23 then
            v22 = v22 + 1
        else
            v23 = true
        end
        if v22 < v15.bridgeCuts then
            local v24
            v24 = #v17.order
            if v24 >= 8 then
                local v25 = v16:NextInteger(math.floor(v24 * 0.45), v24 - 3)
                local tbl_14 = {v17.order[v25 + 1], v17.order[v25 + 2]}
                local v26 = true
                for v41, value_4 in tbl_14 do
                    if value_4 == v18 or v19[value_4] ~= nil or tbl_13[value_4] ~= nil or tbl_11[value_4] ~= nil then
                        v26 = false
                    end
                end
                local v27 = nil
                if v26 then
                    v27 = v17.order[v16:NextInteger(1, math.max(v25 - 2, 1)) + 1]
                    if v27 ~= v18 and v19[v27] == nil and tbl_13[v27] == nil and tbl_12[v27] == nil then
                        local v28 = nil
                        if tbl_11[v27] == nil then
                            v28 = v15.heavyAllowed and v16:NextNumber() < 0.45
                            local v29 = v15.togglesAllowed and (v16:NextNumber() < 0.5)
                            local v30 = nil
                            for v42, value_5 in tbl_14 do
                                tbl_13[value_5] = v21
                            end
                            v30 = {}
                            v30.kind = (v28 and "heavySwitch") or "softSwitch"
                            v30.bridgeGroup = v21
                            v30.toggles = v29
                            tbl_12[v27] = v30
                            v21 = v21 + 1
                        end
                    end
                end
                if v23 then
                    v22 = v22 + 1
                else
                    v23 = true
                end
                --[[ goto label_13 ]]--
            end
        end
        v22 = {}
        local v24
        v24, v23 = false, 0
        if v24 then
            v23 = v23 + 1
        else
            v24 = true
        end
        if v23 < v15.decoys then
            local v31 = v17.order[v16:NextInteger(0, #v17.order - 1) + 1]
            local v32 = math.floor(v31 / 13)
            local v33
            v33 = v31 % 13 + v16:NextInteger(-1, 1)
            local v34 = v32 + v16:NextInteger(-1, 1)
            if v33 >= 0 and v34 >= 0 and v15.boxWidth > v33 then
                local v35 = nil
                if v15.boxHeight > v34 then
                    v35 = cellKey_upv_1(13, v33, v34)
                    if v17.cells[v35] == nil and v22[v35] == nil then
                        v22[v35] = true
                    end
                end
            end
            if v24 then
                v23 = v23 + 1
            else
                v24 = true
            end
            --[[ goto label_17 ]]--
        end
        v23 = buildSpec_upv_1(v17, tbl_11, tbl_13, tbl_12, v22, v21)
        v24 = solveLevel_upv_1(v23)
        if v24 == nil or v15.minDepth > v24 then
            continue
        end
        local tbl_15 = {}
        tbl_15.spec = v23
        tbl_15.par = v24
        tbl_15.attempts = n_1 + 1
        return tbl_15
    end
    for n_2 = 0, 59 do
        local v36
        v36 = carveWalk_upv_1(deriveRandom_upv_1(a1, ((5e+06 + (a2 * 1000)) + 500) + n_2), v15)
        if v36 == nil then
            continue
        end
        local v37 = buildSpec_upv_1(v36, {}, {}, {}, {}, 0)
        local v38
        v38 = solveLevel_upv_1(v37)
        if v38 == nil then
            continue
        end
        local tbl_16 = {}
        tbl_16.spec = v37
        tbl_16.par = v38
        tbl_16.attempts = (n_2 + 60) + 1
        return tbl_16
    end
    local tbl_17 = {}
    for n_3 = 1, 5 do
        local v39 = cellKey_upv_1(13, n_3, 1)
        local tbl_18 = {}
        tbl_18.kind = ((n_3 ~= 5) and "floor") or "goal"
        tbl_17[v39] = tbl_18
    end
    local tbl_19 = {}
    tbl_19.tiles = tbl_17
    tbl_19.start = {}
    tbl_19.bridgesInitiallyOpen = {}
    local tbl_20 = {}
    tbl_20.spec = tbl_19
    local v40 = solveLevel_upv_1(tbl_19)
    if v40 == nil then
        v40 = 4
    end
    tbl_20.par = v40
    tbl_20.attempts = 120
    tbl_20.fallback = true
    return tbl_20
end
tbl_10.applyRoll = v1.applyRoll
tbl_10.freshAttempt = v1.freshAttempt
return tbl_10