-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function neighborsOf_upv_1(a1, a2, a3)
    --[[
      name: neighborsOf
      line: 42
    ]]
    local v1 = math.floor(a3 / a1)
    local tbl_1 = {}
    for n_1 = -1, 1 do
        for n_2 = -1, 1 do
            if n_1 == 0 then
                local v2, v3
                if n_2 == 0 then
                    continue
                end
            end
            local v2
            v2 = a3 % a1 + n_2
            local v3
            v3 = v1 + n_1
            if v2 < 0 or v3 < 0 or a1 <= v2 then
                continue
            end
            if a2 > v3 then
                table.insert(tbl_1, (v3 * a1) + v2)
            end
        end
    end
    return tbl_1
end
local function floodReveal_upv_1(a1, a2)
    --[[
      name: floodReveal
      line: 116
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
    ]]
    local tbl_2 = {}
    a1.revealed[a2] = true
    a1.flags[a2] = nil
    local v4 = {}
    table.insert(v4, a2)
    table.insert(tbl_2, v4)
    while true do
        local v5
        if #v4 <= 0 then
            break
        end
        v5 = {}
        local _ = nil
        local v6 = nil
        for v7, value_1 in v4 do
            if a1.counts[value_1 + 1] ~= 0 then
                continue
            end
            for v8, value_2 in neighborsOf_upv_1(a1.columns, a1.rows, value_1) do
                if a1.revealed[value_2] == nil then
                    a1.revealed[value_2] = true
                    a1.flags[value_2] = nil
                    table.insert(v5, value_2)
                end
            end
        end
        if #v5 == 0 then
            break
        else
            table.insert(tbl_2, v5)
            v4 = v5
        end
    end
    return tbl_2
end
local function buildConstraints_upv_1(a1, a2)
    --[[
      name: buildConstraints
      line: 352
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
    ]]
    local tbl_3 = {}
    local v6 = nil
    local v7 = nil
    local _ = nil
    local v8 = nil
    local v11 = nil
    local v12 = nil
    local v9 = nil
    for key_1 in a1.revealed do
        v9 = a1.counts[key_1 + 1]
        if v9 <= 0 then
            continue
        end
        v8 = 0
        v6 = {}
        for v13, value_3 in neighborsOf_upv_1(a1.columns, a1.rows, key_1) do
            if a1.flags[value_3] ~= nil then
                v8 = v8 + 1
                continue
            end
            if a1.revealed[value_3] == nil then
                table.insert(v6, value_3)
            end
        end
        if #v6 == 0 then
            continue
        end
        v7 = {}
        for v14, value_4 in v6 do
            v7[value_4] = true
        end
        table.insert(tbl_3, {cells = v6, cellSet = v7, mineTotal = v9 - v8})
    end
    if #a2 > 0 then
        local tbl_4 = {}
        for v15, value_5 in a2 do
            tbl_4[value_5] = true
        end
        local tbl_5 = {}
        tbl_5.cells = a2
        tbl_5.cellSet = tbl_4
        local mineCount_1 = a1.mineCount
        local v10 = 0
        for v16 in a1.flags do
            v10 = v10 + 1
        end
        tbl_5.mineTotal = mineCount_1 - v10
        table.insert(tbl_3, tbl_5)
    end
    return tbl_3
end
local function listUndetermined_upv_1(a1)
    --[[
      name: listUndetermined
      line: 321
    ]]
    local tbl_6 = {}
    local v11 = 0
    local v12 = false
    local v13 = nil
    if v12 then
        v11 = v11 + 1
    else
        v12 = true
    end
    if v11 < a1.totalCells then
        v13 = a1.revealed[v11] == nil
        if v13 then
            v13 = a1.flags[v11] == nil
        end
        if v13 then
            table.insert(tbl_6, v11)
        end
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
    end
    return tbl_6
end
local function enumerateEndgame_upv_1(a1, a2)
    --[[
      name: enumerateEndgame
      line: 405
    ]]
    local u1 = #a1
    local tbl_7 = {}
    local tbl_upv_8 = 0
    local tbl_upv_9 = false
    while true do
        if tbl_upv_9 then
            tbl_upv_8 = tbl_upv_8 + 1
        else
            tbl_upv_9 = true
        end
        local tbl_upv_10, tbl_upv_11, tbl_upv_12, tbl_upv_13
        if tbl_upv_8 >= u1 then
            break
        end
        tbl_7[a1[tbl_upv_8 + 1]] = tbl_upv_8
    end
    tbl_upv_8 = {}
    tbl_upv_9 = {}
    local tbl_upv_10
    tbl_upv_10 = {}
    local tbl_upv_11
    tbl_upv_11 = {}
    local tbl_upv_13 = 0
    local tbl_upv_12 = false
    while true do
        if tbl_upv_12 then
            tbl_upv_13 = tbl_upv_13 + 1
        else
            tbl_upv_12 = true
        end
        if tbl_upv_13 >= u1 then
            break
        end
        table.insert(tbl_upv_11, {})
    end
    for u2 = 0, #a2 - 1 do
        local u3 = a2[u2 + 1]
        table.insert(tbl_upv_8, u3.mineTotal)
        table.insert(tbl_upv_9, 0)
        table.insert(tbl_upv_10, #u3.cells)
        local v14 = nil
        for _, value_6 in u3.cells do
            v14 = tbl_7[value_6]
            if v14 ~= nil then
                table.insert(tbl_upv_11[v14 + 1], u2)
            end
        end
    end
    tbl_upv_13 = {}
    tbl_upv_12 = {}
    local u2 = {}
    local u3 = 0
    u3 = false
    local u4 = nil
    while true do
        if u4 then
            u3 = u3 + 1
        else
            u4 = true
        end
        if u3 >= u1 then
            break
        end
        table.insert(tbl_upv_13, false)
        table.insert(tbl_upv_12, false)
        table.insert(u2, false)
    end
    u3 = 0
    u4 = 0
    local u5 = false
    local function undoBranch_1(a3, a4)
        --[[
          name: undoBranch
          line: 501
          upvalues:
            tbl_upv_11 (copy, index: 1)
            tbl_upv_10 (copy, index: 2)
            tbl_upv_9 (copy, index: 3)
        ]]
        local v15 = nil
        for _, value_7 in tbl_upv_11[a3 + 1] do
            v15 = value_7 + 1
            tbl_upv_10[v15] = tbl_upv_10[v15] + 1
            if a4 then
                local v16 = value_7 + 1
                tbl_upv_9[v16] = tbl_upv_9[v16] - 1
            end
        end
    end
    local function applyBranch_upv_1(a5, a6)
        --[[
          name: applyBranch
          line: 485
          upvalues:
            tbl_upv_11 (copy, index: 1)
            tbl_upv_10 (copy, index: 2)
            tbl_upv_9 (copy, index: 3)
            tbl_upv_8 (copy, index: 4)
        ]]
        local v17 = true
        local v18 = nil
        for _, value_8 in tbl_upv_11[a5 + 1] do
            v18 = value_8 + 1
            tbl_upv_10[v18] = tbl_upv_10[v18] - 1
            if a6 then
                local v19 = value_8 + 1
                tbl_upv_9[v19] = tbl_upv_9[v19] + 1
            end
            if tbl_upv_8[value_8 + 1] < tbl_upv_9[value_8 + 1] then
                v17 = false
            end
            if tbl_upv_10[value_8 + 1] < tbl_upv_8[value_8 + 1] - tbl_upv_9[value_8 + 1] then
                v17 = false
            end
        end
        return v17
    end
    local function search_upv_1(a7)
        --[[
          name: search
          line: 509
          upvalues:
            u5 (ref,  index: 1)
            u3 (ref,  index: 2)
            u1 (copy, index: 3)
            u4 (ref,  index: 4)
            u2 (copy, index: 5)
            tbl_upv_13 (copy, index: 6)
            tbl_upv_12 (copy, index: 7)
            applyBranch_upv_1 (copy, index: 8)
            search_upv_1 (copy, index: 9)
            tbl_upv_11 (copy, index: 10)
            tbl_upv_10 (copy, index: 11)
            tbl_upv_9 (copy, index: 12)
        ]]
        if u5 then
            return nil
        end
        u3 = u3 + 1
        if u3 <= 250000 then
            if u1 > a7 then
                u2[a7 + 1] = true
                if applyBranch_upv_1(a7, true) then
                    search_upv_1(a7 + 1)
                end
                local v20 = nil
                local v21 = nil
                for _, value_9 in tbl_upv_11[a7 + 1] do
                    v20 = value_9 + 1
                    tbl_upv_10[v20] = tbl_upv_10[v20] + 1
                    v21 = value_9 + 1
                    tbl_upv_9[v21] = tbl_upv_9[v21] - 1
                end
                u2[a7 + 1] = false
                if applyBranch_upv_1(a7, false) then
                    search_upv_1(a7 + 1)
                end
                local v22 = nil
                for _, value_10 in tbl_upv_11[a7 + 1] do
                    v22 = value_10 + 1
                    tbl_upv_10[v22] = tbl_upv_10[v22] + 1
                end
            else
                u4 = u4 + 1
                local v23 = 0
                local v24 = false
                if v24 then
                    v23 = v23 + 1
                else
                    v24 = true
                end
                if v23 < u1 then
                    if u2[v23 + 1] then
                        tbl_upv_13[v23 + 1] = true
                    else
                        tbl_upv_12[v23 + 1] = true
                    end
                    if v24 then
                        v23 = v23 + 1
                    else
                        v24 = true
                    end
                end
                return nil
            end
        else
            u5 = true
            return nil
        end
    end
    search_upv_1(0)
    if not u5 and u4 ~= 0 then
        local tbl_14 = {}
        local tbl_15 = {}
        local tbl_16 = 0
        local v25 = false
        v25 = v25
        if v25 then
            tbl_16 = tbl_16 + 1
        else
            v25 = true
        end
        while tbl_16 < u1 do
            if not (tbl_upv_12[tbl_16 + 1]) or tbl_upv_13[tbl_16 + 1] then
                if tbl_upv_13[tbl_16 + 1] and not (tbl_upv_12[tbl_16 + 1]) then
                    table.insert(tbl_15, a1[tbl_16 + 1])
                end
            else
                table.insert(tbl_14, a1[tbl_16 + 1])
            end
            if v25 then
                tbl_16 = tbl_16 + 1
            else
                v25 = true
            end
        end
        if #tbl_14 == 0 and #tbl_15 == 0 then
            return nil
        else
            tbl_16 = {}
            tbl_16.toReveal = tbl_14
            tbl_16.toFlag = tbl_15
            return tbl_16
        end
    else
        return nil
    end
end
local function freshBoard_upv_1(a1)
    --[[
      name: freshBoard
      line: 62
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
    ]]
    local v26 = a1.columns * a1.rows
    local tbl_17 = {}
    for _, value_11 in a1.mineKeys do
        tbl_17[value_11] = true
    end
    local tbl_18 = {}
    local v27, tbl_19
    v27, tbl_19 = false, 0
    while true do
        if v27 then
            tbl_19 = tbl_19 + 1
        else
            v27 = true
        end
        if tbl_19 >= v26 then
            break
        end
        table.insert(tbl_18, 0)
    end
    local v28 = nil
    for _, value_12 in a1.mineKeys do
        for v29, value_13 in neighborsOf_upv_1(a1.columns, a1.rows, value_12) do
            v28 = value_13 + 1
            tbl_18[v28] = tbl_18[v28] + 1
        end
    end
    tbl_19 = {}
    tbl_19.columns = a1.columns
    tbl_19.rows = a1.rows
    tbl_19.totalCells = v26
    v27 = 0
    for _ in tbl_17 do
        v27 = v27 + 1
    end
    tbl_19.mineCount = v27
    tbl_19.mines = tbl_17
    tbl_19.counts = tbl_18
    tbl_19.revealed = {}
    tbl_19.flags = {}
    return tbl_19
end
local function deduceOnce_upv_1(a1)
    --[[
      name: deduceOnce
      line: 588
      upvalues:
        listUndetermined_upv_1 (copy, index: 1)
        buildConstraints_upv_1 (copy, index: 2)
        enumerateEndgame_upv_1 (copy, index: 3)
    ]]
    local v29 = listUndetermined_upv_1(a1)
    local v30 = buildConstraints_upv_1(a1, v29)
    local tbl_20 = {}
    local tbl_21 = {}
    for _, value_14 in v30 do
        if value_14.mineTotal ~= 0 then
            local v41, v42
            if value_14.mineTotal ~= #value_14.cells then
                continue
            end
            for v43, value_15 in value_14.cells do
                tbl_21[value_15] = true
            end
        else
            for v44, value_16 in value_14.cells do
                tbl_20[value_16] = true
            end
        end
    end
    local v31 = 0
    for _ in tbl_20 do
        v31 = v31 + 1
    end
    local v32 = 0 < v31
    if not (v32) then
        local tbl_22 = 0
        local v33 = tbl_22
        for _ in tbl_21 do
            v33 = v33 + 1
        end
        v32 = 0 < v33
    end
    if v32 then
        local tbl_22 = {}
        local tbl_23 = {}
        for key_2 in tbl_20 do
            table.insert(tbl_22, key_2)
        end
        for key_3 in tbl_21 do
            table.insert(tbl_23, key_3)
        end
        local tbl_24 = {}
        tbl_24.toReveal = tbl_22
        tbl_24.toFlag = tbl_23
        return tbl_24
    end
    for n_3 = 0, #v30 - 1 do
        local v34 = v30[n_3 + 1]
        local v35 = nil
        for n_4 = 0, #v30 - 1 do
            local v36
            if n_3 == n_4 then
                continue
            end
            v36 = v30[n_4 + 1]
            local v37, v38
            if #v36.cells <= #v34.cells then
                continue
            end
            v35 = true
            for _, value_17 in v34.cells do
                if v36.cellSet[value_17] == nil then
                    v35 = false
                    break
                end
            end
            if not (v35) then
                continue
            end
            v37 = #v36.cells - #v34.cells
            v38 = v36.mineTotal - v34.mineTotal
            if v38 ~= v37 then
                local v39
                if v38 ~= 0 then
                    continue
                end
            end
            local v40
            v40 = {}
            for _, value_18 in v36.cells do
                if v34.cellSet[value_18] == nil then
                    table.insert(v40, value_18)
                end
            end
            if #v40 == 0 then
                continue
            end
            if v38 ~= v37 then
                local v39
                v39 = {}
                v39.toReveal = v40
                v39.toFlag = {}
            else
                local v39
                v39 = {}
                v39.toReveal = {}
                v39.toFlag = v40
            end
            return v39
        end
    end
    if #v29 > 0 and #v29 <= 16 then
        return (enumerateEndgame_upv_1(v29, v30))
    end
    return nil
end
local tbl_25 = {}
tbl_25.cellKey = function(a1, a2, a3)
    --[[
      name: cellKey
      line: 32
    ]]
    return (a3 * a1) + a2
end
tbl_25.keyColumn = function(a1, a2)
    --[[
      name: keyColumn
      line: 35
    ]]
    return a2 % a1
end
tbl_25.keyRow = function(a1, a2)
    --[[
      name: keyRow
      line: 38
    ]]
    return (math.floor(a2 / a1))
end
tbl_25.neighborsOf = neighborsOf_upv_1
tbl_25.freshBoard = freshBoard_upv_1
tbl_25.floodReveal = floodReveal_upv_1
tbl_25.revealCell = function(a1, a2)
    --[[
      name: revealCell
      line: 153
      upvalues:
        floodReveal_upv_1 (copy, index: 1)
    ]]
    local v41 = a1.revealed[a2] ~= nil or a1.flags[a2] ~= nil
    if v41 then
        return {}
    elseif a1.mines[a2] == nil then
        local tbl_26 = {}
        tbl_26.rings = floodReveal_upv_1(a1, a2)
        return tbl_26
    else
        local tbl_27 = {}
        tbl_27.hitKeys = {a2}
        return tbl_27
    end
end
tbl_25.toggleFlag = function(a1, a2)
    --[[
      name: toggleFlag
      line: 180
    ]]
    if a1.revealed[a2] == nil then
        if a1.flags[a2] == nil then
            a1.flags[a2] = true
            return "planted"
        end
        a1.flags[a2] = nil
        return "removed"
    end
    return "ignored"
end
tbl_25.adjacentFlagCount = function(a1, a2)
    --[[
      name: adjacentFlagCount
      line: 199
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
    ]]
    local v42 = 0
    for _, value_19 in neighborsOf_upv_1(a1.columns, a1.rows, a2) do
        if a1.flags[value_19] ~= nil then
            v42 = v42 + 1
        end
    end
    return v42
end
tbl_25.isNumberSatisfied = function(a1, a2)
    --[[
      name: isNumberSatisfied
      line: 209
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
    ]]
    local v43 = a1.counts[a2 + 1]
    if v43 > 0 then
        local v44 = 0
        for _, value_20 in neighborsOf_upv_1(a1.columns, a1.rows, a2) do
            if a1.flags[value_20] ~= nil then
                v44 = v44 + 1
            end
        end
        return v44 == v43
    end
    return false
end
tbl_25.chordCell = function(a1, a2)
    --[[
      name: chordCell
      line: 223
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
        floodReveal_upv_1 (copy, index: 2)
    ]]
    local v45 = nil
    if a1.revealed[a2] ~= nil then
        v45 = a1.counts[a2 + 1]
        if v45 > 0 then
            local v46 = neighborsOf_upv_1(a1.columns, a1.rows, a2)
            local v47 = 0
            for _, value_21 in v46 do
                if a1.flags[value_21] ~= nil then
                    v47 = v47 + 1
                end
            end
            if v47 == v45 then
                local tbl_28 = {}
                local tbl_29 = {}
                for _, value_22 in v46 do
                    if a1.revealed[value_22] ~= nil or a1.flags[value_22] ~= nil then
                        continue
                    end
                    if a1.mines[value_22] == nil then
                        table.insert(tbl_28, value_22)
                    else
                        table.insert(tbl_29, value_22)
                    end
                end
                if #tbl_29 <= 0 then
                    if #tbl_28 ~= 0 then
                        local tbl_30 = {}
                        local v48 = nil
                        for _, value_23 in tbl_28 do
                            if a1.revealed[value_23] ~= nil then
                                continue
                            end
                            v48 = floodReveal_upv_1(a1, value_23)
                            for n_5 = 0, #v48 - 1 do
                                local v49
                                v49 = tbl_30[n_5 + 1]
                                if v49 == nil then
                                    table.insert(tbl_30, v48[n_5 + 1])
                                    continue
                                end
                                for v50, value_24 in v48[n_5 + 1] do
                                    table.insert(v49, value_24)
                                end
                            end
                        end
                        local tbl_31 = {}
                        tbl_31.rings = tbl_30
                        return tbl_31
                    end
                    return {}
                else
                    local tbl_30 = {}
                    tbl_30.hitKeys = tbl_29
                    return tbl_30
                end
            else
                return {}
            end
        else
            return {}
        end
    else
        return {}
    end
end
tbl_25.isBoardWon = function(a1)
    --[[
      name: isBoardWon
      line: 297
    ]]
    local v50 = 0
    for _ in a1.revealed do
        v50 = v50 + 1
    end
    return v50 == (a1.totalCells - a1.mineCount)
end
tbl_25.remainingMineCount = function(a1)
    --[[
      name: remainingMineCount
      line: 307
    ]]
    local mineCount_2 = a1.mineCount
    local v51 = 0
    for _ in a1.flags do
        v51 = v51 + 1
    end
    return mineCount_2 - v51
end
tbl_25.solveFromOpening = function(a1)
    --[[
      name: solveFromOpening
      line: 695
      upvalues:
        freshBoard_upv_1 (copy, index: 1)
        floodReveal_upv_1 (copy, index: 2)
        deduceOnce_upv_1 (copy, index: 3)
        listUndetermined_upv_1 (copy, index: 4)
    ]]
    local v52 = freshBoard_upv_1(a1)
    floodReveal_upv_1(v52, a1.startKey)
    local v53 = 0
    local v54
    v54 = 0
    for _ in v52.revealed do
        v54 = v54 + 1
    end
    local v55 = nil
    if v54 ~= (v52.totalCells - v52.mineCount) then
        v55 = deduceOnce_upv_1(v52)
        if v55 ~= nil then
            for _, value_25 in v55.toFlag do
                v52.flags[value_25] = true
            end
            for _, value_26 in v55.toReveal do
                if v52.revealed[value_26] == nil then
                    floodReveal_upv_1(v52, value_26)
                end
            end
            v53 = v53 + 1
            v54 = 0
            for _ in v52.revealed do
                v54 = v54 + 1
            end
        end
    end
    local tbl_32 = {}
    local v56 = 0
    for _ in v52.revealed do
        v56 = v56 + 1
    end
    tbl_32.solved = v56 == (v52.totalCells - v52.mineCount)
    tbl_32.steps = v53
    v54 = 0
    for _ in v52.revealed do
        v54 = v54 + 1
    end
    tbl_32.revealedCount = v54
    tbl_32.undetermined = listUndetermined_upv_1(v52)
    tbl_32.provenMines = v52.flags
    tbl_32.revealed = v52.revealed
    return tbl_32
end
return tbl_25