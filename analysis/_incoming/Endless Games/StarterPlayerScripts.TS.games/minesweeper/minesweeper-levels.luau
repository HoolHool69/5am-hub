-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "minesweeper-sim")
local cellKey_upv_1 = v1.cellKey
local neighborsOf_upv_1 = v1.neighborsOf
local solveFromOpening_upv_1 = v1.solveFromOpening
local function drawCells_upv_1(a1, a2, a3)
    --[[
      name: drawCells
      line: 72
    ]]
    local tbl_1 = {}
    local v2 = 0
    local v3 = false
    while true do
        if v3 then
            v2 = v2 + 1
        else
            v3 = true
        end
        if v2 >= a2 then
            break
        end
        local v4 = a3:NextInteger(v2, #a1 - 1)
        local v5 = a1[v2 + 1]
        a1[v2 + 1] = a1[v4 + 1]
        a1[v4 + 1] = v5
        table.insert(tbl_1, a1[v2 + 1])
    end
    return tbl_1
end
local function perturbSpec_upv_1(a1, a2, a3)
    --[[
      name: perturbSpec
      line: 106
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
        drawCells_upv_1 (copy, index: 2)
    ]]
    local undetermined_1 = a2.undetermined
    if #undetermined_1 ~= 0 then
        local tbl_2 = {}
        local v6 = 0
        for _, value_1 in a1.mineKeys do
            if a2.provenMines[value_1] == nil then
                v6 = v6 + 1
            else
                table.insert(tbl_2, value_1)
            end
        end
        if v6 ~= 0 and #undetermined_1 >= v6 then
            local tbl_3 = {}
            for _, value_2 in undetermined_1 do
                for v14, value_3 in neighborsOf_upv_1(a1.columns, a1.rows, value_2) do
                    if a2.revealed[value_3] ~= nil then
                        tbl_3[value_2] = true
                        break
                    end
                end
            end
            local tbl_4 = {}
            for _, value_4 in a1.mineKeys do
                tbl_4[value_4] = true
            end
            local tbl_5 = {}
            for _, value_5 in undetermined_1 do
                table.insert(tbl_5, value_5)
            end
            local tbl_6 = {}
            for _, value_6 in drawCells_upv_1(tbl_5, v6, a3) do
                tbl_6[value_6] = true
            end
            local v7 = false
            local v10 = nil
            for v8 in tbl_3 do
                v10 = tbl_4[v8] ~= nil
                if v10 == (tbl_6[v8] ~= nil) then
                    v10 = tbl_4[v8] ~= nil
                    continue
                else
                    v7 = true
                end
            end
            if not (v7) then
                local tbl_7 = nil
                local v11 = nil
                local v12 = nil
                local v8 = nil
                v10 = v11
                local v13 = nil
                for _, value_7 in tbl_5 do
                    v13 = tbl_6[value_7] ~= nil
                    if tbl_3[value_7] == nil then
                        if (v13) and v12 == nil then
                            v12 = value_7
                        elseif not v13 then
                            if v8 == nil then
                                v8 = value_7
                            end
                        end
                    elseif (v13) and tbl_7 == nil then
                        tbl_7 = value_7
                    elseif not v13 then
                        if v10 == nil then
                            v10 = value_7
                        end
                    end
                end
                if tbl_7 == nil or v8 == nil then
                    if v10 ~= nil and v12 ~= nil then
                        tbl_6[v12] = nil
                        tbl_6[v10] = true
                    end
                else
                    tbl_6[tbl_7] = nil
                    tbl_6[v8] = true
                end
            end
            local tbl_7 = {}
            for _, value_8 in tbl_2 do
                table.insert(tbl_7, value_8)
            end
            for key_1 in tbl_6 do
                table.insert(tbl_7, key_1)
            end
            table.sort(
                tbl_7,
                function(a4, a5)
                    --[[
                      line: 195
                    ]]
                    return a4 < a5
                end
            )
            local tbl_8 = {}
            tbl_8.columns = a1.columns
            tbl_8.rows = a1.rows
            tbl_8.mineKeys = tbl_7
            tbl_8.startKey = a1.startKey
            return tbl_8
        end
    end
    return nil
end
local function wallSpec_upv_1(a1, a2)
    --[[
      name: wallSpec
      line: 285
      upvalues:
        cellKey_upv_1 (copy, index: 1)
    ]]
    local tbl_9 = {}
    local tbl_10 = 0
    local v14 = false
    while true do
        if v14 then
            tbl_10 = tbl_10 + 1
        else
            v14 = true
        end
        if tbl_10 >= a2 then
            break
        end
        table.insert(tbl_9, (cellKey_upv_1(a1, a1 - 1, tbl_10)))
    end
    tbl_10 = {}
    tbl_10.columns = a1
    tbl_10.rows = a2
    tbl_10.mineKeys = tbl_9
    tbl_10.startKey = cellKey_upv_1(a1, 1, math.floor(a2 / 2))
    return tbl_10
end
local function attemptGenerate_upv_1(a1, a2, a3, a4)
    --[[
      name: attemptGenerate
      line: 206
      upvalues:
        cellKey_upv_1 (copy, index: 1)
        neighborsOf_upv_1 (copy, index: 2)
        drawCells_upv_1 (copy, index: 3)
        solveFromOpening_upv_1 (copy, index: 4)
        perturbSpec_upv_1 (copy, index: 5)
    ]]
    local v15 = cellKey_upv_1(a2, a1:NextInteger(1, a2 - 2), a1:NextInteger(1, a3 - 2))
    local tbl_11 = {}
    tbl_11[v15] = true
    for v16, value_9 in neighborsOf_upv_1(a2, a3, v15) do
        tbl_11[value_9] = true
    end
    local tbl_12 = {}
    local v17, v18
    v17, v18 = false, 0
    if v17 then
        v18 = v18 + 1
    else
        v17 = true
    end
    if v18 < a2 * a3 then
        if tbl_11[v18] == nil then
            table.insert(tbl_12, v18)
        end
        if v17 then
            v18 = v18 + 1
        else
            v17 = true
        end
        --[[ goto label_6 ]]--
    end
    if #tbl_12 >= a4 then
        v18 = drawCells_upv_1(tbl_12, a4, a1)
        table.sort(
            v18,
            function(a5, a6)
                --[[
                  line: 240
                ]]
                return a5 < a6
            end
        )
        v17 = {}
        v17.columns = a2
        v17.rows = a3
        v17.mineKeys = v18
        v17.startKey = v15
        local v16 = -1
        for n_1 = 0, 10 do
            local v19
            v19 = solveFromOpening_upv_1(v17)
            if v19.solved then
                local tbl_13 = {}
                tbl_13.spec = v17
                tbl_13.par = math.max(v19.steps, 1)
                tbl_13.perturbRounds = n_1
                return tbl_13
            end
            if v19.revealedCount >= v16 then
                if v16 < v19.revealedCount then
                    v16 = v19.revealedCount
                end
                local v20
                if n_1 == 10 then
                    break
                end
                v20 = perturbSpec_upv_1(v17, v19, a1)
                if v20 ~= nil then
                    v17 = v20
                    continue
                end
            end
            return nil
        end
        return nil
    end
    return nil
end
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 47
    ]]
    local v21 = math.min(a1, 15)
    if v21 > 6 then
        local tbl_14 = {}
        tbl_14.mineCount = math.min(math.floor((v21 - 7) / 4) + 27, 29)
        return tbl_14
    else
        local tbl_15 = {}
        tbl_15.mineCount = v21 + 9
        return tbl_15
    end
end
local tbl_16 = {}
tbl_16.levelBand = levelBand_upv_1
tbl_16.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 311
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        attemptGenerate_upv_1 (copy, index: 3)
        wallSpec_upv_1 (copy, index: 4)
        solveFromOpening_upv_1 (copy, index: 5)
    ]]
    local v22 = levelBand_upv_1(a2)
    local v23 = 5e+06 + a2 * 1000
    local v24 = 0
    for n_2 = 0, 59 do
        v24 = v24 + 1
        local v25
        v25 = attemptGenerate_upv_1(deriveRandom_upv_1(a1, v23 + n_2), v22.columns, v22.rows, v22.mineCount)
        if v25 == nil then
            continue
        end
        local tbl_17 = {}
        tbl_17.spec = v25.spec
        tbl_17.par = v25.par
        tbl_17.attempts = v24
        tbl_17.perturbRounds = v25.perturbRounds
        return tbl_17
    end
    for n_3 = 1, 3 do
        local v26 = math.max(6, math.floor(v22.mineCount * (1 - (n_3 * 0.2))))
        for n_4 = 0, 39 do
            v24 = v24 + 1
            local v27
            v27 = attemptGenerate_upv_1(deriveRandom_upv_1(a1, (v23 + 500) + ((n_3 - 1) * 100) + n_4), v22.columns, v22.rows, v26)
            if v27 == nil then
                continue
            end
            local tbl_18 = {}
            tbl_18.spec = v27.spec
            tbl_18.par = v27.par
            tbl_18.attempts = v24
            tbl_18.perturbRounds = v27.perturbRounds
            return tbl_18
        end
    end
    local v28 = wallSpec_upv_1(v22.columns, v22.rows)
    local tbl_19 = {}
    tbl_19.spec = v28
    tbl_19.par = math.max(solveFromOpening_upv_1(v28).steps, 1)
    tbl_19.attempts = v24
    return tbl_19
end
return tbl_16