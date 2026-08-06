-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
for n_1 = 0, 40 do
    table.insert(tbl_upv_1, 2 ^ n_1)
end
local tbl_upv_2 = {}
table.insert(tbl_upv_2, 1)
table.insert(tbl_upv_2, 8)
table.insert(tbl_upv_2, 64)
table.insert(tbl_upv_2, 512)
table.insert(tbl_upv_2, 4096)
table.insert(tbl_upv_2, 32768)
table.insert(tbl_upv_2, 262144)
table.insert(tbl_upv_2, 2097152)
table.insert(tbl_upv_2, 16777216)
table.insert(tbl_upv_2, 134217728)
table.insert(tbl_upv_2, 1073741824)
table.insert(tbl_upv_2, 8589934592)
table.insert(tbl_upv_2, 68719476736)
table.insert(tbl_upv_2, 549755813888)
table.insert(tbl_upv_2, 4398046511104)
local function occupancyOf_upv_1(a1, a2)
    --[[
      name: occupancyOf
      line: 52
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = 0
    for n_2 = 0, #a1.pieces - 1 do
        local v2 = a1.pieces[n_2 + 1]
        local v3 = a2[n_2 + 1]
        local v4 = 0
        local v5 = false
        while true do
            if v5 then
                v4 = v4 + 1
            else
                v5 = true
            end
            if v4 >= v2.length then
                break
            end
            v1 = v1 + tbl_upv_1[(((v2.horizontal) and (v2.y * a1.columns + (v3 + v4))) or ((v3 + v4) * a1.columns + v2.x)) + 1]
        end
    end
    return v1
end
local function isOccupied_1(a1, a2)
    --[[
      name: isOccupied
      line: 76
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v6 = math.floor(a1 / tbl_upv_1[a2 + 1]) % 2 == 1
    return v6
end
local function slideRangeWithOccupancy_upv_1(a1, a2, a3, a4)
    --[[
      name: slideRangeWithOccupancy
      line: 85
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v7 = a1.pieces[a3 + 1]
    local v8 = a2[a3 + 1]
    local v9
    if v7.horizontal then
        v9 = a1.columns
    else
        v9 = a1.rows
    end
    v9 = v8
    while true do
        local v10
        if v9 <= 0 then
            break
        end
        v10 = math.floor(a4 / tbl_upv_1[(((v7.horizontal) and (v7.y * a1.columns + (v9 - 1))) or ((v9 - 1) * a1.columns + v7.x)) + 1]) % 2 == 1
        if v10 then
            break
        else
            v9 = v9 - 1
        end
    end
    local v11 = v8
    while true do
        local v12
        if v11 >= v9 - v7.length then
            break
        end
        local v13 = v11 + v7.length
        v12 = math.floor(a4 / tbl_upv_1[(((v7.horizontal) and (v7.y * a1.columns + v13)) or (v13 * a1.columns + v7.x)) + 1]) % 2 == 1
        if v12 then
            break
        else
            v11 = v11 + 1
        end
    end
    local tbl_3 = {}
    tbl_3.min = v9
    tbl_3.max = v11
    return tbl_3
end
local function runSolve_upv_1(a1, a2, a3)
    --[[
      name: runSolve
      line: 180
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local pieces_1 = a1.pieces
    local v14 = #pieces_1
    local v15 = a1.columns - pieces_1[1].length
    local v16 = 0
    for v17 = 0, #a2 - 1 do
        v16 = v16 + a2[v17 + 1] * tbl_upv_2[v17 + 1]
    end
    if a2[1] ~= v15 then
        local v18 = table.create(a1.columns * a1.rows, 0)
        local v19 = table.create(v14, 0)
        local tbl_4 = {}
        local trace_1 = a3.trace
        local v20 = 0
        local v21 = 1
        local v22 = {}
        table.insert(v22, v16)
        tbl_4[v16] = true
        local v23 = 1
        local v24 = false
        local v25, v17 = tbl_4, trace_1
        while true do
            local v26 = nil
            if v24 then
                v23 = v23 + 1
            else
                v24 = true
            end
            if v23 > a3.limits.maxDepth then
                return nil
            else
                local tbl_5 = {}
                local v27 = nil
                local v28 = nil
                local v29 = nil
                local v30 = nil
                local v31 = nil
                local v32 = nil
                local v33 = nil
                local v34 = nil
                local v35 = nil
                local v36 = nil
                for _, value_1 in v22 do
                    v20 = v20 + 1
                    v27 = 0
                    v28 = false
                    v29 = value_1
                    if v28 then
                        v27 = v27 + 1
                    else
                        v28 = true
                    end
                    while v27 < v14 do
                        local v37 = v29 % 8
                        v19[v27 + 1] = v37
                        v29 = (v29 - v37) / 8
                        local v38 = pieces_1[v27 + 1]
                        local v39 = ((v38.horizontal) and (v38.y * a1.columns + v37)) or (v37 * a1.columns + v38.x)
                        local v40 = ((v38.horizontal) and 1) or (a1.columns)
                        v34 = 0
                        v35 = false
                        while true do
                            if v35 then
                                v34 = v34 + 1
                            else
                                v35 = true
                            end
                            if v34 >= v38.length then
                                break
                            end
                            v18[(v39 + (v34 * v40)) + 1] = v20
                            v25 = nil
                        end
                        if v28 then
                            v27 = v27 + 1
                        else
                            v28 = true
                        end
                    end
                    v28, v27 = false, 0
                    if v28 then
                        v27 = v27 + 1
                    else
                        v28 = true
                    end
                    if v27 >= v14 then
                        continue
                    end
                    v30 = pieces_1[v27 + 1]
                    v31 = v19[v27 + 1]
                    v32 = tbl_upv_2[v27 + 1]
                    v33 = ((v30.horizontal) and (v30.y * a1.columns)) or (v30.x)
                    v34 = ((v30.horizontal) and 1) or (a1.columns)
                    v35 = v31
                    while v35 > 0 and v18[(v33 + ((v35 - 1) * v34)) + 1] ~= v20 do
                        v35 = v35 - 1
                        v26 = value_1 + (v35 - v31) * v32
                        if v25[v26] ~= nil then
                            continue
                        end
                        if v17 ~= nil then
                            v17[v26] = value_1
                        end
                        if v27 ~= 0 or v35 ~= v15 then
                            v25[v26] = true
                            table.insert(tbl_5, v26)
                            continue
                        end
                        v36 = {}
                        v36.moves = v23
                        v36.goalKey = v26
                        return v36
                    end
                    if v30.horizontal then
                        v36 = a1.columns
                    else
                        v36 = a1.rows
                    end
                    v35 = v31
                    while v35 < v36 - v30.length and v18[(v33 + ((v35 + v30.length) * v34)) + 1] ~= v20 do
                        v35 = v35 + 1
                        v36 = value_1 + (v35 - v31) * v32
                        if v25[v36] ~= nil then
                            continue
                        end
                        if v17 ~= nil then
                            v17[v36] = value_1
                        end
                        if v27 ~= 0 or v35 ~= v15 then
                            v25[v36] = true
                            table.insert(tbl_5, v36)
                            continue
                        end
                        local tbl_6 = {}
                        tbl_6.moves = v23
                        tbl_6.goalKey = v36
                        return tbl_6
                    end
                end
                v21 = v21 + #tbl_5
                if #tbl_5 == 0 then
                    break
                end
                if a3.limits.nodeBudget >= v21 then
                    v22 = tbl_5
                    continue
                else
                    break
                end
            end
        end
        return nil
    else
        local tbl_7 = {}
        tbl_7.goalKey = v16
        return tbl_7
    end
end
local function startPositions_upv_1(a1)
    --[[
      name: startPositions
      line: 43
    ]]
    local tbl_8 = {}
    local v41 = nil
    for _, value_2 in a1.pieces do
        if value_2.horizontal then
            v41 = value_2.x
        else
            v41 = value_2.y
        end
        table.insert(tbl_8, v41)
    end
    return tbl_8
end
local tbl_9 = {}
tbl_9.cellIndex = function(a1, a2, a3)
    --[[
      name: cellIndex
      line: 39
    ]]
    return (a3 * a1.columns) + a2
end
tbl_9.startPositions = startPositions_upv_1
tbl_9.occupancyOf = occupancyOf_upv_1
tbl_9.slideRangeWithOccupancy = slideRangeWithOccupancy_upv_1
tbl_9.slideRange = function(a1, a2, a3)
    --[[
      name: slideRange
      line: 112
      upvalues:
        slideRangeWithOccupancy_upv_1 (copy, index: 1)
        occupancyOf_upv_1 (copy, index: 2)
    ]]
    return (slideRangeWithOccupancy_upv_1(a1, a2, a3, occupancyOf_upv_1(a1, a2)))
end
tbl_9.legalSlides = function(a1, a2)
    --[[
      name: legalSlides
      line: 116
      upvalues:
        occupancyOf_upv_1 (copy, index: 1)
        slideRangeWithOccupancy_upv_1 (copy, index: 2)
    ]]
    local v42 = occupancyOf_upv_1(a1, a2)
    local tbl_10 = {}
    for n_3 = 0, #a1.pieces - 1 do
        local v43 = slideRangeWithOccupancy_upv_1(a1, a2, n_3, v42)
        local min_1 = v43.min
        local v44 = false
        v44, min_1 = v44, min_1
        if v44 then
            min_1 = min_1 + 1
        else
            v44 = true
        end
        if min_1 > v43.max then
            continue
        end
        if min_1 ~= a2[n_3 + 1] then
            table.insert(tbl_10, {pieceIndex = n_3, toPosition = min_1})
        end
    end
    return tbl_10
end
tbl_9.applySlide = function(a1, a2, a3)
    --[[
      name: applySlide
      line: 146
    ]]
    local v45 = table.clone(a1)
    v45[a2 + 1] = a3
    return v45
end
tbl_9.isSolved = function(a1, a2)
    --[[
      name: isSolved
      line: 152
    ]]
    return a2[1] == (a1.columns - a1.pieces[1].length)
end
tbl_9.positionsKey = function(a1)
    --[[
      name: positionsKey
      line: 156
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v46 = 0
    for n_4 = 0, #a1 - 1 do
        v46 = v46 + a1[n_4 + 1] * tbl_upv_2[n_4 + 1]
    end
    return v46
end
tbl_9.solveJamWithin = function(a1, a2, a3)
    --[[
      name: solveJamWithin
      line: 327
      upvalues:
        runSolve_upv_1 (copy, index: 1)
    ]]
    local v47 = runSolve_upv_1(a1, a2, {limits = a3})
    if v47 ~= nil then
        return v47.moves
    end
    return nil
end
tbl_9.solveJamTrace = function(a1, a2, a3)
    --[[
      name: solveJamTrace
      line: 342
      upvalues:
        runSolve_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local tbl_11 = {}
    local v48 = runSolve_upv_1(a1, a2, {limits = a3, trace = tbl_11})
    if v48 ~= nil then
        local v49 = #a1.pieces
        local v50 = 0
        for n_5 = 0, #a2 - 1 do
            v50 = v50 + a2[n_5 + 1] * tbl_upv_2[n_5 + 1]
        end
        local tbl_12 = {}
        local tbl_13 = {}
        local v51 = v48.goalKey
        while true do
            local v52
            if v51 == v50 then
                break
            end
            v52 = tbl_11[v51]
            if v52 == nil then
                break
            end
            local v53
            v53 = 0
            local v54 = false
            local v55, v56 = v51, v52
            if v54 then
                v53 = v53 + 1
            else
                v54 = true
            end
            if v53 >= v49 then
                v51 = v52
                continue
            end
            if v55 % 8 == v56 % 8 then
                v55 = (v55 - (v55 % 8)) / 8
                repeat
                    v56 = (v56 - (v56 % 8)) / 8
                    if v54 then
                        v53 = v53 + 1
                    else
                        v54 = true
                    end
                until v53 >= v49
            elseif tbl_12[v53] == nil then
                tbl_12[v53] = true
                table.insert(tbl_13, v53)
            end
            v51 = v52
        end
        local tbl_14 = {}
        tbl_14.moves = v48.moves
        tbl_14.movers = tbl_13
        return tbl_14
    end
    return nil
end
tbl_9.solveJamFrom = function(a1, a2)
    --[[
      name: solveJamFrom
      line: 398
      upvalues:
        runSolve_upv_1 (copy, index: 1)
    ]]
    local v57 = runSolve_upv_1(a1, a2, {limits = {}})
    if v57 ~= nil then
        return v57.moves
    end
    return nil
end
tbl_9.solveJam = function(a1)
    --[[
      name: solveJam
      line: 405
      upvalues:
        startPositions_upv_1 (copy, index: 1)
        runSolve_upv_1 (copy, index: 2)
    ]]
    local tbl_15 = {}
    local v58 = runSolve_upv_1(a1, n_1(a1), {limits = tbl_15})
    if v58 ~= nil then
        return v58.moves
    end
    return nil
end
return tbl_9