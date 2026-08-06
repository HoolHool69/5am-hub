-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function dealBoard_1(a1, a2, a3)
    --[[
      name: dealBoard
      line: 103
    ]]
    local v1 = a1.columns * a1.rows
    if a2 * 4 ~= v1 then
        error((("dealBoard: %*x%* board cannot hold %* kinds x %*"):format(a1.columns, a1.rows, a2, 4)))
    end
    local v2 = table.create(v1)
    local v3 = 0
    local v4 = 1
    local v5 = false
    while true do
        if v5 then
            v4 = v4 + 1
        else
            v5 = true
        end
        if v4 > a2 then
            break
        end
        v2[v3 + 1] = v4
        v3 = v3 + 1
        v2[v3 + 1] = v4
        v3 = v3 + 1
        v2[v3 + 1] = v4
        v3 = v3 + 1
        v2[v3 + 1] = v4
        v3 = v3 + 1
    end
    v5, v4 = false, v1 - 1
    while true do
        if v5 then
            v4 = v4 - 1
        else
            v5 = true
        end
        if v4 < 1 then
            break
        end
        local v6 = a3:NextInteger(0, v4)
        local v7 = v2[v4 + 1]
        v2[v4 + 1] = v2[v6 + 1]
        v2[v6 + 1] = v7
    end
    local v6
    v6, v5, v4 = false, 0, 0
    if v6 then
        v5 = v5 + 1
    else
        v6 = true
    end
    if v5 < a1.rows then
        local v8 = 0
        local v9 = false
        while true do
            if v9 then
                v8 = v8 + 1
            else
                v9 = true
            end
            if v8 >= a1.columns then
                break
            end
            a1.cells[(((v5 + 1) * (a1.columns + 2)) + (v8 + 1)) + 1] = v2[v4 + 1]
            v4 = v4 + 1
        end
        if v6 then
            v5 = v5 + 1
        else
            v6 = true
        end
        --[[ goto label_12 ]]--
    end
    a1.remaining = v1
    a1.moveCacheValid = false
    a1.cachedMove = nil
end
local function columnClearBetween_upv_1(a1, a2, a3, a4)
    --[[
      name: columnClearBetween
      line: 261
    ]]
    local v10 = math.min(a3, a4)
    local v11 = math.max(a3, a4)
    local v12 = v10 + 1
    local v13 = false
    v13, v12 = v13, v12
    while true do
        if v13 then
            v12 = v12 + 1
        else
            v13 = true
        end
        local v14 = nil
        if v12 >= v11 then
            return true
        elseif a2 >= -1 and v12 >= -1 and a1.columns >= a2 and a1.rows >= v12 then
            v14 = a1.cells[(((v12 + 1) * (a1.columns + 2)) + (a2 + 1)) + 1]
        else
            v14 = 0
        end
        if v14 ~= 0 then
            break
        end
    end
    return false
end
local function rowClearBetween_upv_1(a1, a2, a3, a4)
    --[[
      name: rowClearBetween
      line: 239
    ]]
    local v15 = math.min(a3, a4)
    local v16 = math.max(a3, a4)
    local v17 = v15 + 1
    local v18 = false
    v18, v17 = v18, v17
    while true do
        if v18 then
            v17 = v17 + 1
        else
            v18 = true
        end
        local v19 = nil
        if v17 >= v16 then
            return true
        elseif v17 >= -1 and a2 >= -1 and a1.columns >= v17 and a1.rows >= a2 then
            v19 = a1.cells[(((a2 + 1) * (a1.columns + 2)) + (v17 + 1)) + 1]
        else
            v19 = 0
        end
        if v19 ~= 0 then
            break
        end
    end
    return false
end
local function sweepOrder_upv_1(a1, a2, a3)
    --[[
      name: sweepOrder
      line: 284
    ]]
    local tbl_1 = {}
    if a2 >= a1 then
        local v20 = math.clamp(math.floor(a3), a1, a2)
        local v21 = v20 + 1
        while a1 <= v20 do
            if a1 > v20 or v21 > a2 then
                if a1 > v20 then
                    table.insert(tbl_1, v21)
                    v21 = v21 + 1
                else
                    table.insert(tbl_1, v20)
                    v20 = v20 - 1
                end
            elseif math.abs(v20 - a3) > math.abs(v21 - a3) then
                table.insert(tbl_1, v21)
                v21 = v21 + 1
            else
                table.insert(tbl_1, v20)
                v20 = v20 - 1
            end
        end
        if v21 <= a2 then
            if a1 > v20 or v21 > a2 then
                if a1 > v20 then
                    table.insert(tbl_1, v21)
                    v21 = v21 + 1
                else
                    table.insert(tbl_1, v20)
                    v20 = v20 - 1
                end
            elseif math.abs(v20 - a3) > math.abs(v21 - a3) then
                table.insert(tbl_1, v21)
                v21 = v21 + 1
            else
                table.insert(tbl_1, v20)
                v20 = v20 - 1
            end
            while true do
                if a1 <= v20 then
                    if a1 > v20 or v21 > a2 then
                        if a1 > v20 then
                            table.insert(tbl_1, v21)
                            v21 = v21 + 1
                        else
                            table.insert(tbl_1, v20)
                            v20 = v20 - 1
                        end
                    elseif math.abs(v20 - a3) > math.abs(v21 - a3) then
                        table.insert(tbl_1, v21)
                        v21 = v21 + 1
                    else
                        table.insert(tbl_1, v20)
                        v20 = v20 - 1
                    end
                    continue
                end
                break
            end
        end
    end
    return tbl_1
end
local function findPath_upv_1(a1, a2, a3)
    --[[
      name: findPath
      line: 332
      upvalues:
        rowClearBetween_upv_1 (copy, index: 1)
        columnClearBetween_upv_1 (copy, index: 2)
        sweepOrder_upv_1 (copy, index: 3)
    ]]
    if a2.column == a3.column and a2.row == a3.row then
        return nil
    end
    local column_1 = a2.column
    local row_1 = a2.row
    local v22
    if column_1 >= -1 and row_1 >= -1 and a1.columns >= column_1 and a1.rows >= row_1 then
        v22 = a1.cells[(((row_1 + 1) * (a1.columns + 2)) + (column_1 + 1)) + 1]
    else
        v22 = 0
    end
    if v22 ~= 0 then
        column_1 = a3.column
        local row_2 = a3.row
        if column_1 >= -1 and row_2 >= -1 and a1.columns >= column_1 and a1.rows >= row_2 then
            v22 = a1.cells[(((row_2 + 1) * (a1.columns + 2)) + (column_1 + 1)) + 1]
        else
            v22 = 0
        end
        if v22 ~= 0 then
            if a2.row == a3.row and rowClearBetween_upv_1(a1, a2.row, a2.column, a3.column) or a2.column == a3.column and columnClearBetween_upv_1(a1, a2.column, a2.row, a3.row) then
                return {a2, a3}
            end
            column_1 = a3.column
            local row_3 = a2.row
            if column_1 >= -1 and row_3 >= -1 and a1.columns >= column_1 and a1.rows >= row_3 then
                v22 = a1.cells[(((row_3 + 1) * (a1.columns + 2)) + (column_1 + 1)) + 1]
            else
                v22 = 0
            end
            if v22 == 0 and rowClearBetween_upv_1(a1, a2.row, a2.column, a3.column) and columnClearBetween_upv_1(a1, a3.column, a2.row, a3.row) then
                return {a2, {column = a3.column, row = a2.row}, a3}
            else
                column_1 = a2.column
                local row_4 = a3.row
                if column_1 >= -1 and row_4 >= -1 and a1.columns >= column_1 and a1.rows >= row_4 then
                    v22 = a1.cells[(((row_4 + 1) * (a1.columns + 2)) + (column_1 + 1)) + 1]
                else
                    v22 = 0
                end
            end
            if v22 == 0 and columnClearBetween_upv_1(a1, a2.column, a2.row, a3.row) and rowClearBetween_upv_1(a1, a3.row, a2.column, a3.column) then
                return {a2, {column = a2.column, row = a3.row}, a3}
            end
            local v23 = nil
            local v24 = nil
            local _ = nil
            for v27, value_1 in sweepOrder_upv_1(-1, a1.columns, (a2.column + a3.column) / 2) do
                v24 = a2.row
                if value_1 >= -1 and v24 >= -1 and a1.columns >= value_1 and a1.rows >= v24 then
                    v23 = a1.cells[(((v24 + 1) * (a1.columns + 2)) + (value_1 + 1)) + 1]
                else
                    v23 = 0
                end
                if v23 ~= 0 then
                    continue
                end
                v24 = a3.row
                if value_1 >= -1 and v24 >= -1 and a1.columns >= value_1 and a1.rows >= v24 then
                    v23 = a1.cells[(((v24 + 1) * (a1.columns + 2)) + (value_1 + 1)) + 1]
                else
                    v23 = 0
                end
                if v23 ~= 0 or not (rowClearBetween_upv_1(a1, a2.row, a2.column, value_1)) or not (rowClearBetween_upv_1(a1, a3.row, a3.column, value_1)) or not (columnClearBetween_upv_1(a1, value_1, a2.row, a3.row)) then
                    continue
                end
                return {a2, {column = value_1, row = a2.row}, {column = value_1, row = a3.row}, a3}
            end
            local v25 = nil
            local v26 = nil
            for v28, value_2 in sweepOrder_upv_1(-1, a1.rows, (a2.row + a3.row) / 2) do
                v26 = a2.column
                if v26 >= -1 and value_2 >= -1 and a1.columns >= v26 and a1.rows >= value_2 then
                    v23 = a1.cells[(((value_2 + 1) * (a1.columns + 2)) + (v26 + 1)) + 1]
                else
                    v23 = 0
                end
                if v23 ~= 0 then
                    continue
                end
                v25 = a3.column
                if v25 >= -1 and value_2 >= -1 and a1.columns >= v25 and a1.rows >= value_2 then
                    v23 = a1.cells[(((value_2 + 1) * (a1.columns + 2)) + (v25 + 1)) + 1]
                else
                    v23 = 0
                end
                if v23 ~= 0 or not (columnClearBetween_upv_1(a1, a2.column, a2.row, value_2)) or not (columnClearBetween_upv_1(a1, a3.column, a3.row, value_2)) or not (rowClearBetween_upv_1(a1, value_2, a2.column, a3.column)) then
                    continue
                end
                return {a2, {column = a2.column, row = value_2}, {column = a3.column, row = value_2}, a3}
            end
        end
    end
    return nil
end
local function setKind_upv_1(a1, a2, a3, a4)
    --[[
      name: setKind
      line: 77
    ]]
    if a2 < 0 or a3 < 0 or a1.columns <= a2 or a1.rows <= a3 then
        error("setKind outside the playable board")
    end
    local v27 = (a3 + 1) * (a1.columns + 2) + (a2 + 1)
    local v28 = a1.cells[v27 + 1]
    if v28 ~= a4 then
        if v28 == 0 then
            a1.remaining = a1.remaining + 1
        end
        if a4 == 0 then
            a1.remaining = a1.remaining - 1
        end
        a1.cells[v27 + 1] = a4
        a1.moveCacheValid = false
        a1.cachedMove = nil
    else
        return nil
    end
end
local function firstOccupied_upv_1(a1)
    --[[
      name: firstOccupied
      line: 532
    ]]
    local v29 = 0
    local v30 = false
    if v30 then
        v29 = v29 + 1
    else
        v30 = true
    end
    if v29 >= a1.rows then
        return nil
    else
        local v31 = 0
        local v32 = false
        if v32 then
            v31 = v31 + 1
        else
            v32 = true
        end
        if v31 < a1.columns then
            local v33
            if v31 >= -1 and v29 >= -1 and a1.columns >= v31 and a1.rows >= v29 then
                v33 = a1.cells[(((v29 + 1) * (a1.columns + 2)) + (v31 + 1)) + 1]
            else
                v33 = 0
            end
            if v33 == 0 then
                continue
            else
                local tbl_2 = {}
                tbl_2.column = v31
                tbl_2.row = v29
                return tbl_2
            end
        end
    end
    --[[ label_1 ]]--
    if v32 then
        local v31 = nil
        v31 = v31 + 1
    else
        local v32
        v32 = true
    end
    while true do
        if v31 >= a1.columns then
            --[[ goto label_1 ]]--
        else
            local v33
            if v31 >= -1 and v29 >= -1 and a1.columns >= v31 and a1.rows >= v29 then
                v33 = a1.cells[(((v29 + 1) * (a1.columns + 2)) + (v31 + 1)) + 1]
            else
                v33 = 0
            end
            if v33 == 0 then
                continue
            else
                local tbl_2 = {}
                tbl_2.column = v31
                tbl_2.row = v29
                return tbl_2
            end
        end
    end
end
local tbl_3 = {}
tbl_3.paddedIndex = function(a1, a2, a3)
    --[[
      name: paddedIndex
      line: 34
    ]]
    return ((a3 + 1) * (a1.columns + 2)) + (a2 + 1)
end
tbl_3.kindAt = function(a1, a2, a3)
    --[[
      name: kindAt
      line: 38
    ]]
    if a2 >= -1 and a3 >= -1 and a1.columns >= a2 and a1.rows >= a3 then
        return a1.cells[(((a3 + 1) * (a1.columns + 2)) + (a2 + 1)) + 1]
    end
    return 0
end
tbl_3.createBoard = function(a1, a2)
    --[[
      name: createBoard
      line: 44
    ]]
    local v34 = (a1 + 2) * (a2 + 2)
    local v35 = table.create(v34)
    local tbl_4 = 0
    local v36 = false
    while true do
        if v36 then
            tbl_4 = tbl_4 + 1
        else
            v36 = true
        end
        if tbl_4 >= v34 then
            break
        end
        v35[tbl_4 + 1] = 0
    end
    tbl_4 = {}
    tbl_4.columns = a1
    tbl_4.rows = a2
    tbl_4.cells = v35
    return tbl_4
end
tbl_3.setKind = setKind_upv_1
tbl_3.dealBoard = dealBoard_1
tbl_3.reshuffleRemaining = function(a1, a2)
    --[[
      name: reshuffleRemaining
      line: 188
    ]]
    local tbl_5 = {}
    local tbl_6 = {}
    local v37 = 0
    local v38 = false
    if v38 then
        v37 = v37 + 1
    else
        v38 = true
    end
    if v37 < a1.rows then
        local v39 = 0
        local v40 = false
        if v40 then
            v39 = v39 + 1
        else
            v40 = true
        end
        local v41, v42 = nil, nil
        while v39 < a1.columns do
            v41 = (v37 + 1) * (a1.columns + 2) + (v39 + 1)
            v42 = a1.cells[v41 + 1]
            if v42 ~= 0 then
                table.insert(tbl_5, v41)
                table.insert(tbl_6, v42)
            end
            if v40 then
                v39 = v39 + 1
            else
                v40 = true
            end
        end
        if v38 then
            v37 = v37 + 1
        else
            v38 = true
        end
        --[[ goto label_3 ]]--
    end
    for n_1 = #tbl_6 - 1, 1, -1 do
        local v43 = a2:NextInteger(0, n_1)
        local v44 = tbl_6[n_1 + 1]
        tbl_6[n_1 + 1] = tbl_6[v43 + 1]
        tbl_6[v43 + 1] = v44
    end
    for n_2 = 0, #tbl_5 - 1 do
        a1.cells[tbl_5[n_2 + 1] + 1] = tbl_6[n_2 + 1]
    end
    a1.moveCacheValid = false
    a1.cachedMove = nil
end
tbl_3.findPath = findPath_upv_1
tbl_3.matchPath = function(a1, a2, a3)
    --[[
      name: matchPath
      line: 406
      upvalues:
        findPath_upv_1 (copy, index: 1)
    ]]
    local v45 = a2.column
    local v46 = a2.row
    local v47
    if v45 >= -1 and v46 >= -1 and a1.columns >= v45 and a1.rows >= v46 then
        v47 = a1.cells[(((v46 + 1) * (a1.columns + 2)) + (v45 + 1)) + 1]
    else
        v47 = 0
    end
    if v47 ~= 0 then
        v46 = a3.column
        local row_5 = a3.row
        if v46 >= -1 and row_5 >= -1 and a1.columns >= v46 and a1.rows >= row_5 then
            v45 = a1.cells[(((row_5 + 1) * (a1.columns + 2)) + (v46 + 1)) + 1]
        else
            v45 = 0
        end
        if v47 == v45 then
            return (findPath_upv_1(a1, a2, a3))
        end
    end
    return nil
end
tbl_3.findAnyMove = function(a1)
    --[[
      name: findAnyMove
      line: 421
      upvalues:
        findPath_upv_1 (copy, index: 1)
    ]]
    if a1.moveCacheValid then
        return a1.cachedMove
    else
        local tbl_7 = {}
        local v48 = 0
        local v49 = 0
        local v50 = false
        if v50 then
            v49 = v49 + 1
        else
            v50 = true
        end
        local v51 = nil
        local v53 = nil
        while v49 < a1.rows do
            local v52 = 0
            v53 = false
            if v53 then
                v52 = v52 + 1
            else
                v53 = true
            end
            while v52 < a1.columns do
                local v54
                if v52 >= -1 and v49 >= -1 and a1.columns >= v52 and a1.rows >= v49 then
                    v54 = a1.cells[(((v49 + 1) * (a1.columns + 2)) + (v52 + 1)) + 1]
                else
                    v54 = 0
                end
                if v54 ~= 0 then
                    if v48 < v54 then
                        local v48
                        v48 = v54
                    end
                    v51 = tbl_7[v54]
                    if v51 ~= nil then
                        table.insert(v51, {column = v52, row = v49})
                    else
                        tbl_7[v54] = {{column = v52, row = v49}}
                    end
                end
                if v53 then
                    local v52 = nil
                    v52 = v52 + 1
                else
                    v53 = true
                end
            end
            if v50 then
                local v49 = nil
                v49 = v49 + 1
            else
                local v50
                v50 = true
            end
        end
        v50, v49 = false, 1
        if v50 then
            v49 = v49 + 1
        else
            v50 = true
        end
        if v49 > v48 then
            a1.cachedMove = nil
            a1.moveCacheValid = true
            return nil
        else
            v53 = tbl_7[v49]
            local v58 = nil
            if v53 == nil then
                continue
            else
                for n_3 = 0, #v53 - 2 do
                    local v56
                    v56 = n_3 + 1
                    local v57
                    v57 = false
                    if v57 then
                        v56 = v56 + 1
                    else
                        v57 = true
                    end
                    if v56 >= #v53 then
                        v58 = n_3
                        continue
                    end
                    v58 = findPath_upv_1(a1, v53[n_3 + 1], v53[v56 + 1])
                    if v58 ~= nil then
                        local tbl_8 = {}
                        tbl_8.a = v53[n_3 + 1]
                        tbl_8.b = v53[v56 + 1]
                        tbl_8.path = v58
                        a1.cachedMove = tbl_8
                        a1.moveCacheValid = true
                        return tbl_8
                    end
                end
            end
        end
    end
    local v51 = nil
    while true do
        if v49 < a1.rows then
            local v52 = 0
            local v53
            v53 = false
            local v48 = nil
            if v53 then
                v52 = v52 + 1
            else
                v53 = true
            end
            if v52 < a1.columns then
                local v54
                if v52 >= -1 and v49 >= -1 and a1.columns >= v52 and a1.rows >= v49 then
                    v54 = a1.cells[(((v49 + 1) * (a1.columns + 2)) + (v52 + 1)) + 1]
                else
                    v54 = 0
                end
                if v54 ~= 0 then
                    if v48 < v54 then
                        local v48
                        v48 = v54
                    end
                    v51 = tbl_7[v54]
                    if v51 ~= nil then
                        table.insert(v51, {column = v52, row = v49})
                    else
                        tbl_7[v54] = {{column = v52, row = v49}}
                    end
                end
                if v53 then
                    local v52 = nil
                    v52 = v52 + 1
                else
                    v53 = true
                end
            end
            if v50 then
                local v49 = nil
                v49 = v49 + 1
            else
                local v50
                v50 = true
            end
            continue
        end
        break
    end
    local v50
    local v49
    v50, v49 = false, 1
    if v50 then
        v49 = v49 + 1
    else
        v50 = true
    end
    local v53 = nil
    local v58 = nil
    while true do
        if v49 > v48 then
            a1.cachedMove = nil
            a1.moveCacheValid = true
            return nil
        else
            v53 = tbl_7[v49]
            if v53 == nil then
                continue
            else
                for n_3 = 0, #v53 - 2 do
                    local v56
                    v56 = n_3 + 1
                    local v57
                    v57 = false
                    if v57 then
                        v56 = v56 + 1
                    else
                        v57 = true
                    end
                    if v56 >= #v53 then
                        v58 = n_3
                        continue
                    end
                    v58 = findPath_upv_1(a1, v53[n_3 + 1], v53[v56 + 1])
                    if v58 ~= nil then
                        local tbl_8 = {}
                        tbl_8.a = v53[n_3 + 1]
                        tbl_8.b = v53[v56 + 1]
                        tbl_8.path = v58
                        a1.cachedMove = tbl_8
                        a1.moveCacheValid = true
                        return tbl_8
                    end
                end
            end
        end
        break
    end
    if v57 then
        local v56 = nil
        v56 = v56 + 1
    else
        local v57
        v57 = true
    end
    while true do
        if v56 >= #v53 then
            v58 = n_3
            -- NumForNext n_3 = v58 + v60 (limit v59)
            local v57, v56
            v56 = n_3 + 1
            v57 = false
            continue
        else
            v58 = findPath_upv_1(a1, v53[n_3 + 1], v53[v56 + 1])
            if v58 == nil then
                continue
            else
                local tbl_8 = {}
                tbl_8.a = v53[n_3 + 1]
                tbl_8.b = v53[v56 + 1]
                tbl_8.path = v58
                a1.cachedMove = tbl_8
                a1.moveCacheValid = true
                return tbl_8
            end
        end
    end
    while true do
        if v52 < a1.columns then
            local v54
            if v52 >= -1 and v49 >= -1 and a1.columns >= v52 and a1.rows >= v49 then
                v54 = a1.cells[(((v49 + 1) * (a1.columns + 2)) + (v52 + 1)) + 1]
            else
                v54 = 0
            end
            if v54 ~= 0 then
                if v48 < v54 then
                    local v48
                    v48 = v54
                end
                v51 = tbl_7[v54]
                if v51 ~= nil then
                    table.insert(v51, {column = v52, row = v49})
                else
                    tbl_7[v54] = {{column = v52, row = v49}}
                end
            end
            if v53 then
                local v52 = nil
                v52 = v52 + 1
            else
                v53 = true
            end
            continue
        end
        break
    end
    if v50 then
        v49 = v49 + 1
    else
        v50 = true
    end
end
tbl_3.applyMatch = function(a1, a2, a3)
    --[[
      name: applyMatch
      line: 527
      upvalues:
        setKind_upv_1 (copy, index: 1)
    ]]
    setKind_upv_1(a1, a2.column, a2.row, 0)
    setKind_upv_1(a1, a3.column, a3.row, 0)
end
tbl_3.forcePlaceMatch = function(a1)
    --[[
      name: forcePlaceMatch
      line: 583
      upvalues:
        firstOccupied_upv_1 (copy, index: 1)
        setKind_upv_1 (copy, index: 2)
    ]]
    local v61 = nil
    local _, v69 = nil, nil
    if a1.remaining >= 2 then
        v61 = firstOccupied_upv_1(a1)
        if v61 ~= nil then
            local v62 = nil
            local v63 = 0
            _ = false
            if v69 then
                v63 = v63 + 1
            else
                v69 = true
            end
            if v63 < a1.columns and v62 == nil then
                if v63 ~= v61.column then
                    v69 = 0
                    local v68
                    v68 = false
                    if v68 then
                        v69 = v69 + 1
                    else
                        v68 = true
                    end
                    if v69 < a1.rows then
                        local v67
                        if v63 >= -1 and v69 >= -1 and a1.columns >= v63 and a1.rows >= v69 then
                            v67 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (v63 + 1)) + 1]
                        else
                            v67 = 0
                        end
                        if v67 == 0 then
                            if v68 then
                                v69 = v69 + 1
                            else
                                v68 = true
                            end
                            continue
                        else
                            local tbl_9 = {}
                            tbl_9.column = v63
                            tbl_9.row = v69
                            local v62
                            v62 = tbl_9
                        end
                    end
                end
                if v69 then
                    local v63 = nil
                    v63 = v63 + 1
                else
                    v69 = true
                end
                continue
            end
            if v62 == nil then
                local v68
                _, v68 = false, v61.row + 1
                if _ then
                    v68 = v68 + 1
                else
                    _ = true
                end
                local
                if v68 < a1.rows then
                    v68 = v61.column
                    if v68 >= -1 and v68 >= -1 and a1.columns >= v68 and a1.rows >= v68 then
                        v69 = a1.cells[(((v68 + 1) * (a1.columns + 2)) + (v68 + 1)) + 1]
                    else
                        v69 = 0
                    end
                    if v69 == 0 then
                        if _ then
                            v68 = v68 + 1
                        else
                            _ = true
                        end
                        continue
                    else
                        v69 = {}
                        v69.column = v61.column
                        v69.row = v68
                        v62 = v69
                    end
                end
            end
            if v62 ~= nil then
                _ = v61.column
                v69 = v61.row
                if _ >= -1 and v69 >= -1 and a1.columns >= _ and a1.rows >= v69 then
                    local v63
                    v63 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (_ + 1)) + 1]
                else
                    local v63
                    v63 = 0
                end
                v69 = v62.column
                local v68
                v68 = v62.row
                if v69 >= -1 and v68 >= -1 and a1.columns >= v69 and a1.rows >= v68 then
                    _ = a1.cells[(((v68 + 1) * (a1.columns + 2)) + (v69 + 1)) + 1]
                else
                    _ = 0
                end
                if v63 ~= _ then
                    v68, v69 = false, 0
                    if v68 then
                        v69 = v69 + 1
                    else
                        v68 = true
                    end
                    if v69 >= a1.rows then
                        return
                    else
                        local v71, v67
                        v71, v67 = false, 0
                        if v71 then
                            v67 = v67 + 1
                        else
                            v71 = true
                        end
                        if v67 >= a1.columns then
                            continue
                        else
                            local v72
                            if v67 >= -1 and v69 >= -1 and a1.columns >= v67 and a1.rows >= v69 then
                                v72 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (v67 + 1)) + 1]
                            else
                                v72 = 0
                            end
                            if v72 == v63 and (v67 ~= v61.column or v69 ~= v61.row) then
                                setKind_upv_1(a1, v62.column, v62.row, v63)
                                setKind_upv_1(a1, v67, v69, _)
                                return nil
                            end
                        end
                    end
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
    local v68 = nil
    while true do
        if v63 < a1.columns and v62 == nil then
            if v63 ~= v61.column then
                v69 = 0
                local v68
                v68 = false
                if v68 then
                    v69 = v69 + 1
                else
                    v68 = true
                end
                if v69 < a1.rows then
                    local v67
                    if v63 >= -1 and v69 >= -1 and a1.columns >= v63 and a1.rows >= v69 then
                        v67 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (v63 + 1)) + 1]
                    else
                        v67 = 0
                    end
                    if v67 == 0 then
                        if v68 then
                            v69 = v69 + 1
                        else
                            v68 = true
                        end
                        continue
                    else
                        local tbl_9 = {}
                        tbl_9.column = v63
                        tbl_9.row = v69
                        local v62
                        v62 = tbl_9
                    end
                end
            end
            if v69 then
                local v63 = nil
                v63 = v63 + 1
            else
                v69 = true
            end
            continue
        end
        break
    end
    local v62 = nil
    if v62 == nil then
        local v64
        _, v68 = false, v61.row + 1
        if _ then
            v68 = v68 + 1
        else
            _ = true
        end
        if v68 < a1.rows then
            v68 = v61.column
            if v68 >= -1 and v68 >= -1 and a1.columns >= v68 and a1.rows >= v68 then
                v69 = a1.cells[(((v68 + 1) * (a1.columns + 2)) + (v68 + 1)) + 1]
            else
                v69 = 0
            end
            if v69 == 0 then
                if _ then
                    v68 = v68 + 1
                else
                    _ = true
                end
                continue
            else
                v69 = {}
                v69.column = v61.column
                v69.row = v68
                v62 = v69
            end
        end
    end
    if v62 ~= nil then
        local v64
        _ = v61.column
        v69 = v61.row
        if _ >= -1 and v69 >= -1 and a1.columns >= _ and a1.rows >= v69 then
            local v63
            v63 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (_ + 1)) + 1]
        else
            local v63
            v63 = 0
        end
        v69 = v62.column
        v68 = v62.row
        if v69 >= -1 and v68 >= -1 and a1.columns >= v69 and a1.rows >= v68 then
            _ = a1.cells[(((v68 + 1) * (a1.columns + 2)) + (v69 + 1)) + 1]
        else
            _ = 0
        end
        if v63 ~= _ then
            v68, v69 = false, 0
            if v68 then
                v69 = v69 + 1
            else
                v68 = true
            end
            if v69 >= a1.rows then
                return
            else
                local v71, v67
                v71, v67 = false, 0
                if v71 then
                    v67 = v67 + 1
                else
                    v71 = true
                end
                if v67 >= a1.columns then
                    continue
                else
                    local v72
                    if v67 >= -1 and v69 >= -1 and a1.columns >= v67 and a1.rows >= v69 then
                        v72 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (v67 + 1)) + 1]
                    else
                        v72 = 0
                    end
                    if v72 == v63 and (v67 ~= v61.column or v69 ~= v61.row) then
                        setKind_upv_1(a1, v62.column, v62.row, v63)
                        setKind_upv_1(a1, v67, v69, _)
                        return nil
                    end
                end
            end
        else
            return nil
        end
    else
        return nil
    end
    while true do
        if v68 < a1.rows then
            v68 = v61.column
            if v68 >= -1 and v68 >= -1 and a1.columns >= v68 and a1.rows >= v68 then
                v69 = a1.cells[(((v68 + 1) * (a1.columns + 2)) + (v68 + 1)) + 1]
            else
                v69 = 0
            end
            if v69 == 0 then
                if _ then
                    v68 = v68 + 1
                else
                    _ = true
                end
                continue
            else
                v69 = {}
                v69.column = v61.column
                v69.row = v68
                v62 = v69
            end
        end
        break
    end
    if v68 then
        v69 = v69 + 1
    else
        v68 = true
    end
    while true do
        if v69 >= a1.rows then
            return
        else
            local v71, v67, v63
            v71, v67 = false, 0
            if v71 then
                v67 = v67 + 1
            else
                v71 = true
            end
            if v67 >= a1.columns then
                continue
            else
                local v72
                if v67 >= -1 and v69 >= -1 and a1.columns >= v67 and a1.rows >= v69 then
                    v72 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (v67 + 1)) + 1]
                else
                    v72 = 0
                end
                if v72 == v63 and (v67 ~= v61.column or v69 ~= v61.row) then
                    setKind_upv_1(a1, v62.column, v62.row, v63)
                    setKind_upv_1(a1, v67, v69, _)
                    return nil
                end
            end
        end
        break
    end
    while true do
        if v69 < a1.rows then
            local v67
            if v63 >= -1 and v69 >= -1 and a1.columns >= v63 and a1.rows >= v69 then
                v67 = a1.cells[(((v69 + 1) * (a1.columns + 2)) + (v63 + 1)) + 1]
            else
                v67 = 0
            end
            if v67 == 0 then
                if v68 then
                    v69 = v69 + 1
                else
                    v68 = true
                end
                continue
            else
                local tbl_9 = {}
                tbl_9.column = v63
                tbl_9.row = v69
                local v62
                v62 = tbl_9
            end
        end
        break
    end
    if v69 then
        local v63 = nil
        v63 = v63 + 1
    else
        v69 = true
    end
end
tbl_3.remainingKindCounts = function(a1)
    --[[
      name: remainingKindCounts
      line: 701
    ]]
    local tbl_10 = {}
    local v73 = 0
    local v74 = false
    if v74 then
        v73 = v73 + 1
    else
        v74 = true
    end
    if v73 < a1.rows then
        local v75 = 0
        local v76 = false
        local v77 = nil
        if v76 then
            v75 = v75 + 1
        else
            v76 = true
        end
        while v75 < a1.columns do
            local v78
            if v75 >= -1 and v73 >= -1 and a1.columns >= v75 and a1.rows >= v73 then
                v78 = a1.cells[(((v73 + 1) * (a1.columns + 2)) + (v75 + 1)) + 1]
            else
                v78 = 0
            end
            if v78 ~= 0 then
                v77 = tbl_10[v78]
                if v77 == nil then
                    v77 = 0
                end
                tbl_10[v78] = v77 + 1
            end
            if v76 then
                v75 = v75 + 1
            else
                v76 = true
            end
        end
        if v74 then
            v73 = v73 + 1
        else
            v74 = true
        end
    end
    return tbl_10
end
return tbl_3