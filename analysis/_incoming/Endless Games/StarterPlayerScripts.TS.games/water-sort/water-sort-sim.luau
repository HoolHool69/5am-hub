-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function isTubeComplete_1(a1)
    --[[
      name: isTubeComplete
      line: 51
    ]]
    if #a1 == 4 then
        local v1 = a1[1]
        for _, value_1 in a1 do
            if value_1 == v1 then
                continue
            end
            return false
        end
        return true
    end
    return false
end
local function topRun_upv_1(a1)
    --[[
      name: topRun
      line: 20
    ]]
    local v2 = #a1
    if v2 ~= 0 then
        local v3 = a1[v2]
        local v4 = 1
        local tbl_1 = v2 - 2
        local v5 = false
        while true do
            if v5 then
                tbl_1 = tbl_1 - 1
            else
                v5 = true
            end
            if tbl_1 < 0 or a1[tbl_1 + 1] ~= v3 then
                break
            end
            v4 = v4 + 1
        end
        tbl_1 = {}
        tbl_1.color = v3
        tbl_1.count = v4
        return tbl_1
    end
    return nil
end
local function canPour_upv_1(a1, a2, a3)
    --[[
      name: canPour
      line: 84
    ]]
    local v6 = nil
    if a2 ~= a3 then
        v6 = a1[a2 + 1]
        local v7 = a1[a3 + 1]
        if v6 ~= nil and v7 ~= nil and #v6 ~= 0 then
            local v8 = nil
            if #v6 == 4 then
                local v9 = v6[1]
                for _, value_2 in v6 do
                    if value_2 ~= v9 then
                        v8 = false
                    end
                end
            else
                v8 = false
            end
            if not v8 and #v7 < 4 then
                if #v7 ~= 0 then
                    return v7[#v7] == v6[#v6]
                end
                return true
            end
        end
    end
    return false
end
local function legalPours_1(a1)
    --[[
      name: legalPours
      line: 183
      upvalues:
        topRun_upv_1 (copy, index: 1)
        canPour_upv_1 (copy, index: 2)
    ]]
    local tbl_2 = {}
    for n_1 = 0, #a1 - 1 do
        local v10
        v10 = topRun_upv_1(a1[n_1 + 1])
        if v10 == nil then
            continue
        end
        for n_2 = 0, #a1 - 1 do
            local v11
            v11 = canPour_upv_1(a1, n_1, n_2)
            if v11 then
                table.insert(tbl_2, {from = n_1, to = n_2, count = math.min(v10.count, 4 - #a1[n_2 + 1])})
            end
        end
        local v11
    end
    return tbl_2
end
local function isSolved_upv_1(a1)
    --[[
      name: isSolved
      line: 205
    ]]
    local v12 = nil
    for _, value_3 in a1 do
        if #value_3 == 0 then
            continue
        end
        if #value_3 == 4 then
            local v13 = value_3[1]
            for v14, value_4 in value_3 do
                if value_4 ~= v13 then
                    v12 = false
                end
            end
        else
            v12 = false
        end
        if v12 then
            continue
        end
        return false
    end
    return true
end
local function applyPour_upv_1(a1, a2, a3)
    --[[
      name: applyPour
      line: 112
      upvalues:
        canPour_upv_1 (copy, index: 1)
        topRun_upv_1 (copy, index: 2)
    ]]
    local v14 = nil
    if canPour_upv_1(a1, a2, a3) then
        local v15 = a1[a2 + 1]
        local v16 = a1[a3 + 1]
        v14 = topRun_upv_1(v15)
        if v14 ~= nil then
            local v17 = math.min(v14.count, 4 - #v16)
            local tbl_3 = {}
            local tbl_4 = 0
            local tbl_5 = false
            while true do
                if tbl_5 then
                    tbl_4 = tbl_4 + 1
                else
                    tbl_5 = true
                end
                if tbl_4 >= #v15 - v17 then
                    break
                end
                table.insert(tbl_3, v15[tbl_4 + 1])
            end
            tbl_4 = {}
            for _, value_5 in v16 do
                table.insert(tbl_4, value_5)
            end
            local v18
            v18, tbl_5 = false, 0
            while true do
                if v18 then
                    tbl_5 = tbl_5 + 1
                else
                    v18 = true
                end
                if tbl_5 >= v17 then
                    break
                end
                table.insert(tbl_4, v14.color)
            end
            tbl_5 = {}
            for n_3 = 0, #a1 - 1 do
                if n_3 == a2 then
                    table.insert(tbl_5, tbl_3)
                    continue
                end
                if n_3 ~= a3 then
                    table.insert(tbl_5, a1[n_3 + 1])
                else
                    table.insert(tbl_5, tbl_4)
                end
            end
            local tbl_6 = {}
            tbl_6.board = tbl_5
            tbl_6.moved = v17
            return tbl_6
        else
            local tbl_7 = {}
            tbl_7.board = a1
            return tbl_7
        end
    else
        local tbl_8 = {}
        tbl_8.board = a1
        return tbl_8
    end
end
local function canonicalKey_upv_1(a1)
    --[[
      name: canonicalKey
      line: 238
    ]]
    local tbl_9 = {}
    for _, value_6 in a1 do
        table.insert(tbl_9, (table.concat(value_6, ",")))
    end
    table.sort(tbl_9)
    return table.concat(tbl_9, ";")
end
local tbl_10 = {}
tbl_10.topRun = topRun_upv_1
tbl_10.isTubeComplete = isTubeComplete_1
tbl_10.isTubeMonochrome = function(a1)
    --[[
      name: isTubeMonochrome
      line: 64
    ]]
    if #a1 ~= 0 then
        local v19 = a1[1]
        for _, value_7 in a1 do
            if value_7 == v19 then
                continue
            end
            return false
        end
        return true
    end
    return false
end
tbl_10.canPour = canPour_upv_1
tbl_10.applyPour = applyPour_upv_1
tbl_10.legalPours = legalPours_1
tbl_10.isSolved = isSolved_upv_1
tbl_10.isStuck = function(a1)
    --[[
      name: isStuck
      line: 217
      upvalues:
        isSolved_upv_1 (copy, index: 1)
        canPour_upv_1 (copy, index: 2)
    ]]
    if isSolved_upv_1(a1) then
        return false
    end
    for n_4 = 0, #a1 - 1 do
        for n_5 = 0, #a1 - 1 do
            local v20
            v20 = canPour_upv_1(a1, n_4, n_5)
            if not (v20) then
                continue
            end
            return false
        end
        local v20
    end
    return true
end
tbl_10.canonicalKey = canonicalKey_upv_1
tbl_10.solveBoard = function(a1, a2)
    --[[
      name: solveBoard
      line: 258
      upvalues:
        isSolved_upv_1 (copy, index: 1)
        canonicalKey_upv_1 (copy, index: 2)
        canPour_upv_1 (copy, index: 3)
        applyPour_upv_1 (copy, index: 4)
    ]]
    if isSolved_upv_1(a1) then
        return {}
    else
        local tbl_11 = {}
        tbl_11[canonicalKey_upv_1(a1)] = true
        local v21 = 1
        local v22 = {}
        table.insert(v22, {tubes = a1})
        local v23 = 0
        while true do
            local v24 = nil
            if #v22 <= 0 then
                break
            end
            v23 = v23 + 1
            local tbl_12 = {}
            local v25 = nil
            local v26 = nil
            local v27 = nil
            v21 = nil
            local v28 = nil
            local v29 = nil
            for _, value_8 in v22 do
                v29 = #value_8.tubes
                v25 = 0
                v26 = false
                if v26 then
                    v25 = v25 + 1
                else
                    v26 = true
                end
                if v25 >= v29 then
                    continue
                end
                v28 = value_8.tubes[v25 + 1]
                if #v28 == 0 then
                    --[[ goto label_8 ]]--
                else
                    if #v28 == 4 then
                        local v30 = v28[1]
                        for v36, value_9 in v28 do
                            if value_9 ~= v30 then
                                v27 = false
                            end
                        end
                    else
                        v27 = false
                    end
                    if v27 then
                        --[[ goto label_8 ]]--
                    else
                        if #v28 ~= 0 then
                            local v31 = v28[1]
                            for v37, value_10 in v28 do
                                if value_10 ~= v31 then
                                    v27 = false
                                end
                            end
                        else
                            v27 = false
                        end
                        local v32, v30
                        v32, v30 = false, 0
                        if v32 then
                            v30 = v30 + 1
                        else
                            v32 = true
                        end
                        if v30 >= v29 then
                            --[[ goto label_8 ]]--
                        elseif v30 ~= v25 then
                            if v25 ~= value_8.lastTo then
                                if not v27 or #value_8.tubes[v30 + 1] ~= 0 then
                                    v24 = canPour_upv_1(value_8.tubes, v25, v30)
                                    if v24 then
                                        v24 = applyPour_upv_1(value_8.tubes, v25, v30)
                                        local v33
                                        if isSolved_upv_1(v24.board) then
                                            local tbl_13 = {}
                                            tbl_13.moves = v23
                                            tbl_13.statesExplored = v21
                                            return tbl_13
                                        end
                                        v33 = canonicalKey_upv_1(v24.board)
                                        if tbl_11[v33] == nil then
                                            tbl_11[v33] = true
                                            v21 = v21 + 1
                                            if a2 >= v21 then
                                                table.insert(tbl_12, {tubes = v24.board, lastFrom = v25, lastTo = v30})
                                            else
                                                local tbl_14 = {}
                                                tbl_14.statesExplored = v21
                                                return tbl_14
                                            end
                                        end
                                    end
                                end
                            elseif v30 ~= value_8.lastFrom and (not v27 or #value_8.tubes[v30 + 1] ~= 0) then
                                v24 = canPour_upv_1(value_8.tubes, v25, v30)
                                if v24 then
                                    v24 = applyPour_upv_1(value_8.tubes, v25, v30)
                                    local v33
                                    if isSolved_upv_1(v24.board) then
                                        local tbl_13 = {}
                                        tbl_13.moves = v23
                                        tbl_13.statesExplored = v21
                                        return tbl_13
                                    end
                                    v33 = canonicalKey_upv_1(v24.board)
                                    if tbl_11[v33] == nil then
                                        tbl_11[v33] = true
                                        v21 = v21 + 1
                                        if a2 >= v21 then
                                            table.insert(tbl_12, {tubes = v24.board, lastFrom = v25, lastTo = v30})
                                        else
                                            local tbl_14 = {}
                                            tbl_14.statesExplored = v21
                                            return tbl_14
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            v22 = tbl_12
        end
        local tbl_15 = {}
        tbl_15.statesExplored = v21
        return tbl_15
    end
    --[[ label_8 ]]--
    local v21 = nil
    if v26 then
        local v25 = nil
        v25 = v25 + 1
    else
        local v26
        v26 = true
    end
    local v28 = nil
    if v25 >= v29 then
        -- GenericForNext _, value_8 = v34(v35, [control])
        local v29, v26, v25
        v29 = #value_8.tubes
        v25 = 0
        v26 = false
        local v27
        --[[ goto label_8 ]]--
    else
        v28 = value_8.tubes[v25 + 1]
        if #v28 == 0 then
            --[[ goto label_8 ]]--
        else
            local v27 = nil
            if #v28 == 4 then
                local v30 = v28[1]
                for v36, value_9 in v28 do
                    if value_9 ~= v30 then
                        v27 = false
                    end
                end
            else
                v27 = false
            end
            if v27 then
                --[[ goto label_8 ]]--
            else
                if #v28 ~= 0 then
                    local v31 = v28[1]
                    for v37, value_10 in v28 do
                        if value_10 ~= v31 then
                            v27 = false
                        end
                    end
                else
                    v27 = false
                end
                local v32, v30
                v32, v30 = false, 0
                if v32 then
                    v30 = v30 + 1
                else
                    v32 = true
                end
                while true do
                    if v30 >= v29 then
                        --[[ goto label_8 ]]--
                    elseif v30 == v25 then
                        continue
                    elseif v25 ~= value_8.lastTo then
                        if v27 and #value_8.tubes[v30 + 1] == 0 then
                            continue
                        else
                            local v24
                            v24 = canPour_upv_1(value_8.tubes, v25, v30)
                            if v24 then
                                v24 = applyPour_upv_1(value_8.tubes, v25, v30)
                                local v33
                                if isSolved_upv_1(v24.board) then
                                    local tbl_13 = {}
                                    tbl_13.moves = v23
                                    tbl_13.statesExplored = v21
                                    return tbl_13
                                end
                                v33 = canonicalKey_upv_1(v24.board)
                                if tbl_11[v33] ~= nil then
                                    continue
                                else
                                    tbl_11[v33] = true
                                    v21 = v21 + 1
                                    if a2 >= v21 then
                                        table.insert(tbl_12, {tubes = v24.board, lastFrom = v25, lastTo = v30})
                                        continue
                                    else
                                        local tbl_14 = {}
                                        tbl_14.statesExplored = v21
                                        return tbl_14
                                    end
                                end
                            else
                                continue
                            end
                        end
                    elseif v30 == value_8.lastFrom or v27 and #value_8.tubes[v30 + 1] == 0 then
                        continue
                    else
                        local v24
                        v24 = canPour_upv_1(value_8.tubes, v25, v30)
                        if v24 then
                            v24 = applyPour_upv_1(value_8.tubes, v25, v30)
                            local v33
                            if isSolved_upv_1(v24.board) then
                                local tbl_13 = {}
                                tbl_13.moves = v23
                                tbl_13.statesExplored = v21
                                return tbl_13
                            end
                            v33 = canonicalKey_upv_1(v24.board)
                            if tbl_11[v33] ~= nil then
                                continue
                            else
                                tbl_11[v33] = true
                                v21 = v21 + 1
                                if a2 >= v21 then
                                    table.insert(tbl_12, {tubes = v24.board, lastFrom = v25, lastTo = v30})
                                    continue
                                else
                                    local tbl_14 = {}
                                    tbl_14.statesExplored = v21
                                    return tbl_14
                                end
                            end
                        else
                            continue
                        end
                    end
                end
            end
        end
    end
end
return tbl_10