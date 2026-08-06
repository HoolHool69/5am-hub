-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function freshBoard_1(a1)
    --[[
      name: freshBoard
      line: 40
    ]]
    local tbl_1 = {}
    for _ = 0, #a1.endpoints - 1 do
        table.insert(tbl_1, {})
    end
    local tbl_2 = {}
    tbl_2.paths = tbl_1
    return tbl_2
end
local function pathColorAt_upv_1(a1, a2, a3)
    --[[
      name: pathColorAt
      line: 60
    ]]
    for n_1 = 0, #a2.paths - 1 do
        if (table.find(a2.paths[n_1 + 1], a3) or 0) - 1 == -1 then
            continue
        end
        return n_1
    end
    return nil
end
local function coveredCellCount_1(a1, a2)
    --[[
      name: coveredCellCount
      line: 91
    ]]
    local v1 = 0
    for _, value_1 in a2.paths do
        v1 = v1 + #value_1
    end
    return v1
end
local function connectedPairCount_upv_1(a1, a2)
    --[[
      name: connectedPairCount
      line: 81
    ]]
    local v2 = 0
    v2 = v2
    local v3 = nil
    for n_2 = 0, #a1.endpoints - 1 do
        local v4
        v4 = a2.paths[n_2 + 1]
        if #v4 >= 2 then
            local v5
            v5 = v4[1]
            local v6 = v4[#v4]
            local v7
            v7 = a1.endpoints[n_2 + 1]
            if v5 ~= v7.a then
                v3 = false
                if v5 == v7.b then
                    v3 = v6 == v7.a
                end
            else
                v3 = true
                if v6 ~= v7.b then
                    v3 = false
                    if v5 == v7.b then
                        v3 = v6 == v7.a
                    end
                end
            end
        else
            v3 = false
        end
        if v3 then
            v2 = v2 + 1
        end
    end
    return v2
end
local function endpointColorAt_upv_1(a1, a2)
    --[[
      name: endpointColorAt
      line: 50
    ]]
    for n_3 = 0, #a1.endpoints - 1 do
        local v8
        v8 = a1.endpoints[n_3 + 1]
        if v8.a ~= a2 and v8.b ~= a2 then
            continue
        end
        return n_3
    end
    return nil
end
local function areAdjacent_upv_1(a1, a2, a3)
    --[[
      name: areAdjacent
      line: 35
    ]]
    local v9 = math.abs((a2 % a1) - (a3 % a1)) + math.abs(math.floor(a2 / a1) - math.floor(a3 / a1)) == 1
    return v9
end
local tbl_3 = {}
tbl_3.cellKey = function(a1, a2, a3)
    --[[
      name: cellKey
      line: 22
    ]]
    return (a3 * a1) + a2
end
tbl_3.keyColumn = function(a1, a2)
    --[[
      name: keyColumn
      line: 25
    ]]
    return a2 % a1
end
tbl_3.keyRow = function(a1, a2)
    --[[
      name: keyRow
      line: 28
    ]]
    return (math.floor(a2 / a1))
end
tbl_3.manhattan = function(a1, a2, a3)
    --[[
      name: manhattan
      line: 31
    ]]
    return math.abs((a2 % a1) - (a3 % a1)) + math.abs(math.floor(a2 / a1) - math.floor(a3 / a1))
end
tbl_3.areAdjacent = areAdjacent_upv_1
tbl_3.freshBoard = freshBoard_1
tbl_3.endpointColorAt = endpointColorAt_upv_1
tbl_3.pathColorAt = pathColorAt_upv_1
tbl_3.isPairConnected = function(a1, a2, a3)
    --[[
      name: isPairConnected
      line: 71
    ]]
    local v10 = a2.paths[a3 + 1]
    local v11, v12 = nil, nil
    if #v10 >= 2 then
        v11 = v10[1]
        local v13 = v10[#v10]
        v12 = a1.endpoints[a3 + 1]
        local v14
        if v11 ~= v12.a then
            v14 = false
            if v11 == v12.b then
                v14 = v13 == v12.a
            end
        else
            v14 = true
            if v13 ~= v12.b then
                v14 = false
                if v11 == v12.b then
                    v14 = v13 == v12.a
                end
            end
        end
        return v14
    end
    return false
end
tbl_3.connectedPairCount = connectedPairCount_upv_1
tbl_3.coveredCellCount = coveredCellCount_1
tbl_3.isComplete = function(a1, a2)
    --[[
      name: isComplete
      line: 99
      upvalues:
        connectedPairCount_upv_1 (copy, index: 1)
    ]]
    local v15 = false
    if connectedPairCount_upv_1(a1, a2) == #a1.endpoints then
        local v16 = 0
        for _, value_2 in a2.paths do
            v16 = v16 + #value_2
        end
        v15 = v16 == a1.columns * a1.rows
    end
    return v15
end
tbl_3.grabAt = function(a1, a2, a3)
    --[[
      name: grabAt
      line: 110
      upvalues:
        endpointColorAt_upv_1 (copy, index: 1)
        pathColorAt_upv_1 (copy, index: 2)
    ]]
    local v17 = endpointColorAt_upv_1(a1, a3)
    local v18, v19 = nil, nil
    if v17 == nil then
        v18 = pathColorAt_upv_1(a1, a2, a3)
        if v18 ~= nil then
            local v20 = a2.paths[v18 + 1]
            local v21 = (table.find(v20, a3) or 0) - 1
            local v22 = false
            while v21 < #v20 - 1 do
                v20[#v20] = nil
                v22 = true
            end
            local tbl_4 = {}
            tbl_4.color = v18
            tbl_4.changed = v22
            return tbl_4
        end
        return nil
    else
        v19 = a2.paths[v17 + 1]
        local v23 = true
        if #v19 == 1 then
            v23 = v19[1] ~= a3
        end
        while #v19 > 0 do
            v19[#v19] = nil
        end
        table.insert(v19, a3)
        local tbl_5 = {}
        tbl_5.color = v17
        tbl_5.changed = v23
        return tbl_5
    end
end
tbl_3.stepPath = function(a1, a2, a3, a4)
    --[[
      name: stepPath
      line: 151
      upvalues:
        areAdjacent_upv_1 (copy, index: 1)
        endpointColorAt_upv_1 (copy, index: 2)
        pathColorAt_upv_1 (copy, index: 3)
    ]]
    local v24 = a2.paths[a3 + 1]
    local v25 = nil
    if #v24 ~= 0 then
        v25 = v24[#v24]
        if a4 ~= v25 then
            local v26 = nil
            if areAdjacent_upv_1(a1.columns, v25, a4) then
                v26 = (table.find(v24, a4) or 0) - 1
                local v27 = nil
                if v26 == -1 then
                    v27 = a2.paths[a3 + 1]
                    local v28, v29, v30 = nil, nil, nil
                    if #v27 >= 2 then
                        v28 = v27[1]
                        local v31 = v27[#v27]
                        v29 = a1.endpoints[a3 + 1]
                        if v28 ~= v29.a then
                            v30 = false
                            if v28 == v29.b then
                                v30 = v31 == v29.a
                            end
                        else
                            v30 = true
                            if v31 ~= v29.b then
                                v30 = false
                                if v28 == v29.b then
                                    v30 = v31 == v29.a
                                end
                            end
                        end
                    else
                        v30 = false
                    end
                    if v30 then
                        return {}
                    end
                    v30 = endpointColorAt_upv_1(a1, a4)
                    if v30 ~= nil and v30 ~= a3 then
                        return {}
                    end
                    if v30 ~= a3 then
                        v27 = pathColorAt_upv_1(a1, a2, a4)
                        if v27 == nil then
                            table.insert(v24, a4)
                            return {}
                        else
                            local v32 = a2.paths[v27 + 1]
                            local v33 = (table.find(v32, a4) or 0) - 1
                            while v33 < #v32 do
                                v32[#v32] = nil
                            end
                            table.insert(v24, a4)
                            local tbl_6 = {}
                            tbl_6.cutColor = v27
                            return tbl_6
                        end
                    else
                        table.insert(v24, a4)
                        return {}
                    end
                else
                    while v26 < #v24 - 1 do
                        v24[#v24] = nil
                    end
                    return {}
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
tbl_3.propagationForcedFraction = function(a1)
    --[[
      name: propagationForcedFraction
      line: 237
    ]]
    local v34 = a1.columns * a1.rows
    local v35 = #a1.endpoints
    local tbl_7 = {}
    local tbl_8 = 0
    local tbl_9 = false
    tbl_9, tbl_8 = tbl_9, tbl_8
    while true do
        if tbl_9 then
            tbl_8 = tbl_8 + 1
        else
            tbl_9 = true
        end
        if tbl_8 >= v34 then
            break
        end
        table.insert(tbl_7, -1)
    end
    tbl_8 = {}
    tbl_9 = {}
    local v36 = 0
    local v37 = false
    v37, v36 = v37, v36
    while true do
        if v37 then
            v36 = v36 + 1
        else
            v37 = true
        end
        if v36 >= v35 then
            break
        end
        local v38 = a1.endpoints[v36 + 1]
        table.insert(tbl_8, {{v38.a}, {v38.b}})
        table.insert(tbl_9, false)
        tbl_7[v38.a + 1] = v36
        tbl_7[v38.b + 1] = v36
    end
    v37 = true
    while true do
        local v39 = nil
        if not (v37) then
            break
        end
        v37 = false
        local v40 = 0
        local v41 = false
        v41 = v41
        if v41 then
            v40 = v40 + 1
        else
            v41 = true
        end
        if v40 >= v35 then
            continue
        end
        local v42, _ = nil, nil
        if not (tbl_9[v40 + 1]) then
            v42 = tbl_8[v40 + 1]
            for n_4 = 0, 1 do
                local v43
                v43 = v42[n_4 + 1]
                local v44 = v42[(1 - n_4) + 1]
                local v45
                v45 = v43[#v43]
                local v46
                v46 = v44[#v44]
                local v47 = 0
                local v48 = -1
                local v49 = false
                for n_5 = 0, 3 do
                    v39 = (function(a2, a3)
                        --[[
                          line: 279
                          upvalues:
                            a1 (copy, index: 1)
                        ]]
                        local v50 = a2 % a1.columns
                        local v51 = math.floor(a2 / a1.columns)
                        if a3 ~= 0 then
                            if a3 ~= 1 then
                                if a3 ~= 2 then
                                    if v51 >= a1.rows - 1 then
                                        return nil
                                    end
                                    return a2 + a1.columns
                                elseif v51 <= 0 then
                                    return nil
                                else
                                    return a2 - a1.columns
                                end
                            end
                            if v50 >= a1.columns - 1 then
                                return nil
                            end
                            return a2 + 1
                        elseif v50 <= 0 then
                            return nil
                        else
                            return a2 - 1
                        end
                    end)(v45, n_5)
                    if v39 == nil then
                        continue
                    end
                    if v39 == v46 then
                        v47 = v47 + 1
                        v49, v48 = true, v39
                        continue
                    end
                    if tbl_7[v39 + 1] == -1 then
                        v47 = v47 + 1
                        v49, v48 = false, v39
                    end
                end
                if v47 ~= 1 then
                    continue
                end
                v37 = true
                if v49 then
                    tbl_9[v40 + 1] = true
                    break
                else
                    tbl_7[v48 + 1] = v40
                    table.insert(v43, v48)
                end
            end
        end
    end
    local v38 = 0
    for _, value_3 in tbl_7 do
        if value_3 ~= -1 then
            v38 = v38 + 1
        end
    end
    return v38 / v34
end
return tbl_3