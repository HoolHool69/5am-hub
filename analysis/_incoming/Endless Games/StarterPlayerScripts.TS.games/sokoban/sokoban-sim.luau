-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {"up", "down", "left", "right"}
local tbl_upv_2 = {0, 0, -1, 1}
local tbl_upv_3 = {-1, 1, 0, 0}
local tbl_upv_4 = {1, 0, 3, 2}
local tbl_upv_5 = {3, 1}
local tbl_upv_6 = {2, 0}
local function applyMove_1(a1, a2, a3, a4)
    --[[
      name: applyMove
      line: 111
    ]]
    local width_1 = a1.width
    local v1 = ((a4 == "left") and -1) or (((a4 ~= "right") and 0) or 1)
    local v2 = ((a4 == "up") and -1) or (((a4 ~= "down") and 0) or 1)
    local v3 = a2 % width_1 + v1
    local v4 = math.floor(a2 / width_1) + v2
    local v5
    if v3 >= 0 and v4 >= 0 and a1.width > v3 and a1.height > v4 then
        v5 = a1.walls[((v4 * a1.width) + v3) + 1] == true
    else
        v5 = true
    end
    if v5 then
        return {}
    else
        local v6 = v4 * width_1 + v3
        local v7 = -1
        for n_1 = 0, #a3 - 1 do
            if a3[n_1 + 1] == v6 then
                v7 = n_1
                break
            end
        end
        local v8 = nil
        if v7 ~= -1 then
            v8 = v3 + v1
            local v9 = v4 + v2
            local v10
            if v8 >= 0 and v9 >= 0 and a1.width > v8 and a1.height > v9 then
                v10 = a1.walls[((v9 * a1.width) + v8) + 1] == true
            else
                v10 = true
            end
            if v10 then
                return {}
            else
                local v11 = v9 * width_1 + v8
                for _, value_1 in a3 do
                    if value_1 ~= v11 then
                        continue
                    end
                    return {}
                end
                local tbl_7 = {}
                tbl_7.player = v6
                tbl_7.boxIndex = v7
                tbl_7.boxFrom = v6
                tbl_7.boxTo = v11
                return tbl_7
            end
        else
            local tbl_8 = {}
            tbl_8.player = v6
            return tbl_8
        end
    end
end
local tbl_9 = {}
local tbl_10 = {}
tbl_10.__tostring = function()
    --[[
      name: __tostring
      line: 192
    ]]
    return "PullQueue"
end
local u1 = setmetatable(tbl_9, tbl_10)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 197
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v12 = setmetatable({}, u1)
    return v12:constructor(...) or v12
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 201
    ]]
    a1.codes = {}
    a1.players = {}
    a1.chain = {}
    a1.headOfCode = {}
    a1.pendingHead = {}
    a1.pendingLink = {}
    a1.written = 0
end
u1.size = function(a1)
    --[[
      name: size
      line: 210
    ]]
    return a1.written
end
u1.push = function(a1, a2, a3)
    --[[
      name: push
      line: 213
    ]]
    local written_1 = a1.written
    a1.codes[written_1 + 1] = a2
    a1.players[written_1 + 1] = a3
    a1.chain[written_1 + 1] = -1
    if a1.pendingHead[a2] ~= nil then
        local v13 = a1.pendingLink[a2]
        if v13 ~= nil then
            a1.chain[v13 + 1] = written_1
        end
    else
        a1.pendingHead[a2] = written_1
    end
    a1.pendingLink[a2] = written_1
    a1.written = written_1 + 1
end
u1.openLayer = function(a1)
    --[[
      name: openLayer
      line: 238
    ]]
    a1.headOfCode = a1.pendingHead
    a1.pendingHead = {}
    a1.pendingLink = {}
end
u1.isChainHead = function(a1, a2)
    --[[
      name: isChainHead
      line: 243
    ]]
    return a1.headOfCode[a1.codes[a2 + 1]] == a2
end
u1.nextInChain = function(a1, a2)
    --[[
      name: nextInChain
      line: 248
    ]]
    return a1.chain[a2 + 1]
end
local tbl_11 = {}
local tbl_12 = {}
tbl_12.__tostring = function()
    --[[
      name: __tostring
      line: 267
    ]]
    return "SokobanEngine"
end
local u2 = setmetatable(tbl_11, tbl_12)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 272
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v14 = setmetatable({}, u2)
    return v14:constructor(...) or v14
end
u2.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 276
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    a1.regionToken = 0
    a1.regionCells = 0
    a1.boxToken = 0
    a1.assumeToken = 0
    a1.freezeCells = {}
    a1.freezeCount = 0
    local width_2 = a2.width
    local height_1 = a2.height
    local v15 = width_2 * height_1
    a1.size = v15
    a1.walls = a2.walls
    a1.boxCount = #a2.goals
    local tbl_13 = {}
    local tbl_14 = {}
    local tbl_15 = {}
    local tbl_16 = {}
    local tbl_17 = {}
    local tbl_18 = {}
    local v16 = 0
    while v16 < v15 do
        table.insert(tbl_13, false)
        table.insert(tbl_15, 0)
        table.insert(tbl_16, 0)
        table.insert(tbl_17, 0)
        table.insert(tbl_18, 0)
        local v17 = 0
        while v17 < 4 do
            table.insert(tbl_14, -1)
            v17 = v17 + 1
        end
        v16 = v16 + 1
    end
    for key_1, v18 in a2.goals do
        tbl_13[v18 + 1] = true
    end
    local v19 = 0
    while true do
        local v18, v20 = nil, nil
        if v19 >= height_1 then
            break
        end
        local tbl_19 = 0
        while tbl_19 < width_2 do
            local key_1 = 0
            while key_1 < 4 do
                v18 = tbl_19 + tbl_upv_2[key_1 + 1]
                local v21 = v19 + tbl_upv_3[key_1 + 1]
                if v18 < 0 or v21 < 0 or v18 >= width_2 or v21 >= height_1 then
                    key_1 = key_1 + 1
                    continue
                end
                v20 = v21 * width_2 + v18
                if a2.walls[v20 + 1] ~= true then
                    tbl_14[((((v19 * width_2) + tbl_19) * 4) + key_1) + 1] = v20
                end
                key_1 = key_1 + 1
            end
            tbl_19 = tbl_19 + 1
        end
        v19 = v19 + 1
    end
    local tbl_19 = {}
    local tbl_20 = {}
    v16 = 0
    while true do
        local v22 = nil
        if v16 >= v15 then
            break
        end
        table.insert(tbl_19, #tbl_20)
        local v18 = 0
        while v18 < 4 do
            v22 = tbl_14[((v16 * 4) + v18) + 1]
            if v22 >= 0 then
                table.insert(tbl_20, v22)
            end
            v18 = v18 + 1
        end
        v16 = v16 + 1
    end
    table.insert(tbl_19, #tbl_20)
    a1.goalMask = tbl_13
    a1.neighbours = tbl_14
    a1.adjacencyStart = tbl_19
    a1.adjacency = tbl_20
    a1.regionMarks = tbl_15
    a1.boxMarks = tbl_16
    a1.assumeMarks = tbl_17
    a1.floodQueue = tbl_18
    local v18 = a3 or (a1:computeLive(a2))
    a1.liveCells = v18
end
u2.computeLive = function(a1, a2)
    --[[
      name: computeLive
      line: 361
    ]]
    local tbl_21 = {}
    local v23 = 0
    while v23 < a1.size do
        table.insert(tbl_21, false)
        v23 = v23 + 1
    end
    local tbl_22 = {}
    for key_2, v24 in a2.goals do
        if tbl_21[v24 + 1] ~= true then
            tbl_21[v24 + 1] = true
            table.insert(tbl_22, v24)
        end
    end
    local neighbours_1 = a1.neighbours
    local v25 = 0
    while v25 < #tbl_22 do
        local v26 = tbl_22[v25 + 1]
        v25 = v25 + 1
        local key_2 = 0
        while true do
            local v24
            if key_2 >= 4 then
                break
            end
            v24 = neighbours_1[((v26 * 4) + key_2) + 1]
            if v24 >= 0 and neighbours_1[((v24 * 4) + key_2) + 1] >= 0 and tbl_21[v24 + 1] ~= true then
                tbl_21[v24 + 1] = true
                table.insert(tbl_22, v24)
            end
            key_2 = key_2 + 1
        end
    end
    return tbl_21
end
u2.markBoxes = function(a1, a2, a3)
    --[[
      name: markBoxes
      line: 394
    ]]
    a1.boxToken = a1.boxToken + 1
    local boxToken_1 = a1.boxToken
    local boxMarks_1 = a1.boxMarks
    local v27 = 0
    while v27 < a3 do
        boxMarks_1[a2[v27 + 1] + 1] = boxToken_1
        v27 = v27 + 1
    end
end
u2.floodRegion = function(a1, a2)
    --[[
      name: floodRegion
      line: 404
    ]]
    a1.regionToken = a1.regionToken + 1
    local regionToken_1 = a1.regionToken
    local regionMarks_1 = a1.regionMarks
    local boxMarks_2 = a1.boxMarks
    local boxToken_2 = a1.boxToken
    local adjacencyStart_1 = a1.adjacencyStart
    local adjacency_1 = a1.adjacency
    local floodQueue_1 = a1.floodQueue
    regionMarks_1[a2 + 1] = regionToken_1
    floodQueue_1[1] = a2
    local v28 = 0
    local v29 = 1
    local v30
    v30 = a2
    while true do
        local v31
        if v28 >= v29 then
            break
        end
        v31 = floodQueue_1[v28 + 1]
        v28 = v28 + 1
        if v31 < v30 then
            v30 = v31
        end
        local v32 = adjacencyStart_1[v31 + 1]
        local v33 = adjacencyStart_1[v31 + 2]
        while true do
            local v34
            if v32 >= v33 then
                break
            end
            v34 = adjacency_1[v32 + 1]
            v32 = v32 + 1
            if boxMarks_2[v34 + 1] == boxToken_2 then
                continue
            end
            if regionMarks_1[v34 + 1] ~= regionToken_1 then
                regionMarks_1[v34 + 1] = regionToken_1
                floodQueue_1[v29 + 1] = v34
                v29 = v29 + 1
            end
        end
    end
    a1.regionCells = v29
    return v30
end
u2.floodRegionFrom = function(a1, a2, a3)
    --[[
      name: floodRegionFrom
      line: 440
    ]]
    a1:markBoxes(a2, #a2)
    return a1:floodRegion(a3)
end
u2.isInRegion = function(a1, a2)
    --[[
      name: isInRegion
      line: 444
    ]]
    return a1.regionMarks[a2 + 1] == a1.regionToken
end
u2.regionCellCount = function(a1)
    --[[
      name: regionCellCount
      line: 447
    ]]
    return a1.regionCells
end
u2.hasBoxAt = function(a1, a2, a3, a4)
    --[[
      name: hasBoxAt
      line: 450
    ]]
    local v35 = 0
    while v35 < a3 do
        if a2[v35 + 1] ~= a4 then
            v35 = v35 + 1
            continue
        end
        return true
    end
    return false
end
u2.allOnGoals = function(a1, a2, a3)
    --[[
      name: allOnGoals
      line: 460
    ]]
    local goalMask_1 = a1.goalMask
    local v36 = 0
    while v36 < a3 do
        if goalMask_1[a2[v36 + 1] + 1] == true then
            v36 = v36 + 1
            continue
        end
        return false
    end
    return true
end
u2.isSolved = function(a1, a2)
    --[[
      name: isSolved
      line: 471
    ]]
    return a1:allOnGoals(a2, #a2)
end
u2.frozenAt = function(a1, a2, a3)
    --[[
      name: frozenAt
      line: 474
      upvalues:
        tbl_upv_5 (copy, index: 1)
        tbl_upv_6 (copy, index: 2)
    ]]
    if a3 <= 8 then
        local assumeMarks_1 = a1.assumeMarks
        local assumeToken_1 = a1.assumeToken
        local liveCells_1 = a1.liveCells
        local neighbours_2 = a1.neighbours
        local freezeCells_1 = a1.freezeCells
        local freezeCount_1 = a1.freezeCount
        assumeMarks_1[a2 + 1] = assumeToken_1
        local v37 = a2 * 4
        local v38 = true
        local v39 = 0
        local v40, v40 = nil, nil
        while true do
            local v41, v42, v43 = nil, nil, nil
            if v39 >= 2 then
                break
            end
            v41 = neighbours_2[(v37 + tbl_upv_5[v39 + 1]) + 1]
            local v44 = neighbours_2[(v37 + tbl_upv_6[v39 + 1]) + 1]
            v40 = true
            if v41 >= 0 then
                v40 = true
                if v44 >= 0 then
                    v40 = true
                    if assumeMarks_1[v41 + 1] ~= assumeToken_1 then
                        v40 = true
                        if assumeMarks_1[v44 + 1] ~= assumeToken_1 then
                            v40 = false
                            if liveCells_1[v41 + 1] ~= true then
                                v40 = liveCells_1[v44 + 1] ~= true
                            end
                        end
                    end
                end
            end
            if not (v40) then
                if (a1:hasBoxAt(freezeCells_1, freezeCount_1, v41)) and (a1:frozenAt(v41, a3 + 1)) then
                    v40 = true
                else
                    v42 = a1:hasBoxAt(freezeCells_1, freezeCount_1, v44)
                    if v42 then
                        v43 = a1:frozenAt(v44, a3 + 1)
                        if v43 then
                            v40 = true
                        end
                    end
                end
            end
            if not (v40) then
                v38 = false
            end
            v39 = v39 + 1
        end
        return v38
    end
    return true
end
u2.findDeadlockIn = function(a1, a2, a3)
    --[[
      name: findDeadlockIn
      line: 506
    ]]
    local liveCells_2 = a1.liveCells
    local goalMask_2 = a1.goalMask
    local v45 = 0
    while v45 < a3 do
        if liveCells_2[a2[v45 + 1] + 1] == true then
            v45 = v45 + 1
            continue
        end
        return a2[v45 + 1]
    end
    a1.freezeCells = a2
    a1.freezeCount = a3
    v45 = 0
    while true do
        local v46
        if v45 >= a3 then
            break
        end
        v46 = a2[v45 + 1]
        if goalMask_2[v46 + 1] == true then
            v45 = v45 + 1
            continue
        end
        a1.assumeToken = a1.assumeToken + 1
        if not (a1:frozenAt(v46, 0)) then
            v45 = v45 + 1
            continue
        end
        return v46
    end
    return nil
end
u2.findDeadlock = function(a1, a2)
    --[[
      name: findDeadlock
      line: 531
    ]]
    return a1:findDeadlockIn(a2, #a2)
end
u2.encode = function(a1, a2, a3)
    --[[
      name: encode
      line: 534
    ]]
    local v47 = 0
    local v48 = a3 - 1
    while v48 >= 0 do
        v47 = v47 * 128 + a2[v48 + 1]
        v48 = v48 - 1
    end
    return v47
end
u2.decodeInto = function(a1, a2, a3, a4)
    --[[
      name: decodeInto
      line: 543
    ]]
    local v49 = 0
    local v50 = a2
    while v49 < a4 do
        local v51 = v50 % 128
        a3[v49 + 1] = v51
        v50 = (v50 - v51) / 128
        v49 = v49 + 1
    end
end
u2.sortCells = function(a1, a2, a3)
    --[[
      name: sortCells
      line: 553
    ]]
    local v52 = 1
    while v52 < a3 do
        local v53 = a2[v52 + 1]
        local v54 = v52 - 1
        while v54 >= 0 and v53 < a2[v54 + 1] do
            a2[v54 + 2] = a2[v54 + 1]
            v54 = v54 - 1
        end
        a2[v54 + 2] = v53
        v52 = v52 + 1
    end
end
u2.encodeSorted = function(a1, a2, a3, a4)
    --[[
      name: encodeSorted
      line: 566
    ]]
    local v55 = 0
    while v55 < a4 do
        local v56 = a2[v55 + 1]
        local v57 = v55 - 1
        while v57 >= 0 and v56 < a3[v57 + 1] do
            a3[v57 + 2] = a3[v57 + 1]
            v57 = v57 - 1
        end
        a3[v57 + 2] = v56
        v55 = v55 + 1
    end
    local v56
    v55, v56 = a4 - 1, 0
    while v55 >= 0 do
        v56 = v56 * 128 + a3[v55 + 1]
        v55 = v55 - 1
    end
    return v56
end
u2.solve = function(a1, a2, a3)
    --[[
      name: solve
      line: 586
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    local boxCount_1 = a1.boxCount
    if #a2 == boxCount_1 then
        local tbl_23 = {}
        for v58, v59 in a2 do
            table.insert(tbl_23, v59)
        end
        a1:sortCells(tbl_23, boxCount_1)
        if a1:allOnGoals(tbl_23, boxCount_1) then
            return 0
        end
        if a1:findDeadlockIn(tbl_23, boxCount_1) == nil then
            local neighbours_3 = a1.neighbours
            local liveCells_3 = a1.liveCells
            local tbl_24 = {}
            local v58 = {}
            local v59 = {}
            local v60 = {}
            local v61 = {}
            local v62 = {}
            local tbl_25 = {}
            local tbl_26 = {}
            for v63, value_2 in tbl_23 do
                table.insert(tbl_25, value_2)
                table.insert(tbl_26, value_2)
            end
            local v64 = a1:encode(tbl_23, boxCount_1)
            table.insert(v59, v64)
            table.insert(v60, a3)
            v58[(v64 * 128) + a3] = true
            local v63 = 1
            local value_2 = 1
            local v65 = 1
            v65, v63, v59, v60, v61, v62, tbl_25, value_2 = nil, nil, nil, nil, nil, nil, nil, nil
            while true do
                local v66, v67 = nil, nil
                if v65 > 400 then
                    break
                end
                local v68 = 0
                local v69 = 0
                while v69 < v63 do
                    local v70 = v59[v69 + 1]
                    v69 = v69 + 1
                    a1:decodeInto(v70, tbl_23, boxCount_1)
                    a1:markBoxes(tbl_23, boxCount_1)
                    v66 = v70 * 128 + a1:floodRegion(v60[v69 + 1])
                    local v71, v72, v73, v74, v75
                    if tbl_24[v66] == true then
                        continue
                    end
                    tbl_24[v66] = true
                    v71 = a1.regionMarks
                    v72 = a1.regionToken
                    v73 = a1.boxMarks
                    v74 = a1.boxToken
                    v75 = 0
                    while true do
                        local v76, v77, v78
                        if v75 >= boxCount_1 then
                            break
                        end
                        v76 = tbl_23[v75 + 1]
                        v77 = v76 * 4
                        v78 = 0
                        while v78 < 4 do
                            v67 = neighbours_3[(v77 + v78) + 1]
                            local v79 = neighbours_3[(v77 + tbl_upv_4[v78 + 1]) + 1]
                            v78 = v78 + 1
                            if v67 < 0 or v79 < 0 or liveCells_3[v67 + 1] ~= true or v71[v79 + 1] ~= v72 then
                                continue
                            end
                            local v80
                            if v73[v67 + 1] == v74 then
                                continue
                            end
                            v80 = 0
                            local v81 = nil
                            while v80 < boxCount_1 do
                                local v82 = v80 + 1
                                if v80 ~= v75 then
                                    v81 = tbl_23[v80 + 1]
                                else
                                    v81 = v67
                                end
                                tbl_25[v82] = v81
                                v80 = v80 + 1
                            end
                            if a1:allOnGoals(tbl_25, boxCount_1) then
                                return v65
                            else
                                local v83
                                if a1:findDeadlockIn(tbl_25, boxCount_1) ~= nil then
                                    continue
                                end
                                v83 = a1:encodeSorted(tbl_25, tbl_26, boxCount_1)
                                v81 = v83 * 128 + v76
                                if v58[v81] == true then
                                    continue
                                end
                                v58[v81] = true
                                value_2 = value_2 + 1
                                if value_2 <= 120000 then
                                    v61[v68 + 1] = v83
                                    v62[v68 + 1] = v76
                                    v68 = v68 + 1
                                    continue
                                end
                                return nil
                            end
                        end
                        v75 = v75 + 1
                    end
                end
                if v68 ~= 0 then
                    v65 = v65 + 1
                    v63, v59, v60, v61, v62 = v68, v61, v62, v59, v60
                    continue
                end
                return nil
            end
        end
    end
    return nil
end
u2.searchPullFrontier = function(a1, a2, a3)
    --[[
      name: searchPullFrontier
      line: 711
      upvalues:
        u1 (ref,  index: 1)
        tbl_upv_4 (copy, index: 2)
    ]]
    local boxCount_2 = a1.boxCount
    local size_1 = a1.size
    local walls_1 = a1.walls
    local neighbours_4 = a1.neighbours
    local goalMask_3 = a1.goalMask
    local stopDepth_1 = a3.stopDepth
    local tbl_27 = {}
    local tbl_28 = {}
    local tbl_29 = {}
    for key_3, value_3 in a2 do
        table.insert(tbl_27, value_3)
        table.insert(tbl_28, value_3)
        table.insert(tbl_29, value_3)
    end
    a1:sortCells(tbl_29, boxCount_2)
    local v84 = a1:encode(tbl_29, boxCount_2)
    local tbl_30 = {}
    local tbl_31 = {}
    local key_3 = u1.new()
    local value_3 = 0
    while value_3 < size_1 do
        if walls_1[value_3 + 1] ~= true and goalMask_3[value_3 + 1] ~= true then
            key_3:push(v84, value_3)
            tbl_31[(v84 * 128) + value_3] = true
        end
        value_3 = value_3 + 1
    end
    key_3:openLayer()
    local tbl_32 = {}
    local tbl_33 = {}
    local tbl_34 = {}
    local v85 = 0
    local v86 = 0
    local v87 = -1
    local v88 = -1
    local v89 = 0
    local v90 = false
    local v91 = 0
    local v92 = key_3:size() - 1
    local v93 = 0
    while true do
        local v94, v95, v96, v97, v98 = nil, nil, nil, nil, nil
        if v93 > stopDepth_1 then
            break
        end
        local v99
        v99 = v91
        while v99 <= v92 do
            if not (key_3:isChainHead(v99)) then
                v99 = v99 + 1
                continue
            end
            if a3.nodeCap <= v89 then
                v90 = true
                break
            end
            local v100 = key_3.codes[v99 + 1]
            a1:decodeInto(v100, tbl_27, boxCount_2)
            a1:markBoxes(tbl_27, boxCount_2)
            local v101 = 0
            local v102
            v102 = v99
            local v103 = nil
            while v102 >= 0 do
                local v104 = key_3.players[v102 + 1]
                local v105 = a1.regionMarks[v104 + 1]
                v103 = false
                local v106 = 0
                while v106 < v101 do
                    if tbl_34[v106 + 1] ~= v105 then
                        v106 = v106 + 1
                        continue
                    else
                        v103 = true
                        break
                    end
                end
                if v103 then
                    v102 = key_3:nextInChain(v102)
                    continue
                end
                local v107 = a1:floodRegion(v104)
                tbl_34[v101 + 1] = a1.regionToken
                v101 = v101 + 1
                v94 = v100 * 128 + v107
                if tbl_30[v94] == true then
                    v102 = key_3:nextInChain(v102)
                    continue
                end
                tbl_30[v94] = true
                v89 = v89 + 1
                if v93 > 0 and a1.regionCells > 1 then
                    v95 = a1:allOnGoals(tbl_27, boxCount_2)
                    if not v95 then
                        if v86 < v93 then
                            v86, v85, v87, v88 = v93, 0, v100, v104
                        end
                        if a3.keepFrom <= v93 and v93 == v86 and v85 < 48 then
                            tbl_32[v85 + 1] = v100
                            tbl_33[v85 + 1] = v104
                            v85 = v85 + 1
                        end
                    end
                end
                if v93 >= stopDepth_1 then
                    v102 = key_3:nextInChain(v102)
                    continue
                end
                local regionMarks_2 = a1.regionMarks
                local regionToken_2 = a1.regionToken
                local boxMarks_3 = a1.boxMarks
                local boxToken_3 = a1.boxToken
                local v108 = 0
                while v108 < boxCount_2 do
                    local v109 = tbl_27[v108 + 1]
                    local v110 = 0
                    while v110 < 4 do
                        local v111 = tbl_upv_4[v110 + 1]
                        local v112 = true
                        local v113 = v109
                        while true do
                            v96 = neighbours_4[((v113 * 4) + v111) + 1]
                            if v96 < 0 then
                                break
                            end
                            v97 = neighbours_4[((v96 * 4) + v111) + 1]
                            if v97 < 0 or boxMarks_3[v96 + 1] == boxToken_3 or boxMarks_3[v97 + 1] == boxToken_3 or (v112) and regionMarks_2[v96 + 1] ~= regionToken_2 then
                                break
                            else
                                v112 = false
                                tbl_27[v108 + 1] = v96
                                local v114 = a1:encodeSorted(tbl_27, tbl_28, boxCount_2)
                                v98 = v114 * 128 + v97
                                if tbl_31[v98] ~= true then
                                    tbl_31[v98] = true
                                    key_3:push(v114, v97)
                                end
                                v113 = v96
                                continue
                            end
                        end
                        tbl_27[v108 + 1] = v109
                        v110 = v110 + 1
                    end
                    v108 = v108 + 1
                end
                v102 = key_3:nextInChain(v102)
            end
            v99 = v99 + 1
        end
        if not v90 then
            v91 = v92 + 1
            v92 = key_3:size() - 1
            if v92 >= v91 then
                key_3:openLayer()
                v93 = v93 + 1
                continue
            end
        end
        break
    end
    local tbl_35 = {}
    tbl_35.maxDepth = v86
    tbl_35.count = v85
    tbl_35.codes = tbl_32
    tbl_35.players = tbl_33
    tbl_35.deepestCode = v87
    tbl_35.deepestPlayer = v88
    tbl_35.settled = v89
    tbl_35.capped = v90
    return tbl_35
end
u2.startFault = function(a1, a2, a3)
    --[[
      name: startFault
      line: 894
    ]]
    local boxCount_3 = a1.boxCount
    if #a2 == boxCount_3 then
        if a3 >= 0 and a1.size > a3 and a1.walls[a3 + 1] ~= true then
            local tbl_36 = {}
            local v115 = 0
            while true do
                local v116
                if v115 >= boxCount_3 then
                    break
                end
                v116 = a2[v115 + 1]
                if v116 < 0 or a1.size <= v116 or a1.walls[v116 + 1] == true then
                    return "crate inside a wall"
                elseif v116 == a3 then
                    return "player inside a crate"
                elseif a1.liveCells[v116 + 1] == true then
                    local v117 = 0
                    while v117 < v115 do
                        if a2[v117 + 1] ~= v116 then
                            v117 = v117 + 1
                            continue
                        end
                        return "two crates in one cell"
                    end
                    table.insert(tbl_36, v116)
                    v115 = v115 + 1
                    continue
                else
                    return "crate on a dead square"
                end
            end
            a1:sortCells(tbl_36, boxCount_3)
            if a1:allOnGoals(tbl_36, boxCount_3) then
                return "level ships already solved"
            elseif a1:findDeadlockIn(tbl_36, boxCount_3) == nil then
                a1:markBoxes(tbl_36, boxCount_3)
                a1:floodRegion(a3)
                if a1.regionCells >= 2 then
                    a1.boxToken = a1.boxToken + 1
                    a1:floodRegion(a3)
                    local v118 = 0
                    local v117
                    v117 = 0
                    while v117 < a1.size do
                        if a1.walls[v117 + 1] ~= true then
                            v118 = v118 + 1
                        end
                        v117 = v117 + 1
                    end
                    if a1.regionCells == v118 then
                        return nil
                    end
                    return "floor region is split"
                end
                return "player is walled into a single cell"
            else
                return "start is already deadlocked"
            end
        end
        return "player inside a wall"
    end
    return "crate count is off-band"
end
local function computeGoalMask_upv_1(a1)
    --[[
      name: computeGoalMask
      line: 82
    ]]
    local tbl_37 = {}
    local v119 = 0
    local v120 = false
    while true do
        if v120 then
            v119 = v119 + 1
        else
            v120 = true
        end
        if v119 >= a1.width * a1.height then
            break
        end
        table.insert(tbl_37, false)
    end
    for _, value_4 in a1.goals do
        tbl_37[value_4 + 1] = true
    end
    return tbl_37
end
local tbl_38 = {}
tbl_38.directionDeltaX = function(a1)
    --[[
      name: directionDeltaX
      line: 48
    ]]
    if a1 ~= "left" then
        if a1 ~= "right" then
            return 0
        end
        return 1
    end
    return -1
end
tbl_38.directionDeltaY = function(a1)
    --[[
      name: directionDeltaY
      line: 57
    ]]
    if a1 ~= "up" then
        if a1 ~= "down" then
            return 0
        end
        return 1
    end
    return -1
end
tbl_38.cellKey = function(a1, a2, a3)
    --[[
      name: cellKey
      line: 66
    ]]
    return (a3 * a1) + a2
end
tbl_38.keyX = function(a1, a2)
    --[[
      name: keyX
      line: 69
    ]]
    return a2 % a1
end
tbl_38.keyY = function(a1, a2)
    --[[
      name: keyY
      line: 72
    ]]
    return (math.floor(a2 / a1))
end
tbl_38.isWall = function(a1, a2, a3)
    --[[
      name: isWall
      line: 75
    ]]
    if a2 >= 0 and a3 >= 0 and a1.width > a2 and a1.height > a3 then
        return a1.walls[((a3 * a1.width) + a2) + 1] == true
    end
    return true
end
tbl_38.computeGoalMask = computeGoalMask_upv_1
tbl_38.applyMove = applyMove_1
tbl_38.decodeStateCode = function(a1, a2)
    --[[
      name: decodeStateCode
      line: 169
    ]]
    local tbl_39 = {}
    local v121 = 0
    local v122 = a1
    while v121 < a2 do
        local v123 = v122 % 128
        table.insert(tbl_39, v123)
        v122 = (v122 - v123) / 128
        v121 = v121 + 1
    end
    return tbl_39
end
tbl_38.computeLiveCells = function(a1)
    --[[
      name: computeLiveCells
      line: 960
      upvalues:
        u2 (ref, index: 1)
    ]]
    return u2.new(a1).liveCells
end
tbl_38.isAllOnGoals = function(a1, a2)
    --[[
      name: isAllOnGoals
      line: 963
      upvalues:
        computeGoalMask_upv_1 (copy, index: 1)
    ]]
    local v124 = computeGoalMask_upv_1(a1)
    for _, value_5 in a2 do
        if v124[value_5 + 1] == true then
            continue
        end
        return false
    end
    return true
end
tbl_38.findDeadlock = function(a1, a2, a3)
    --[[
      name: findDeadlock
      line: 973
      upvalues:
        u2 (ref, index: 1)
    ]]
    return u2.new(a1, a2):findDeadlock(a3)
end
tbl_38.computeReachRegion = function(a1, a2, a3)
    --[[
      name: computeReachRegion
      line: 977
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v125 = u2.new(a1)
    local v126 = v125:floodRegionFrom(a2, a3)
    local tbl_40 = {}
    local v127 = 0
    while v127 < a1.width * a1.height do
        table.insert(tbl_40, (v125:isInRegion(v127)))
        v127 = v127 + 1
    end
    local tbl_41 = {}
    tbl_41.cells = tbl_40
    tbl_41.representative = v126
    return tbl_41
end
tbl_38.solveLevel = function(a1)
    --[[
      name: solveLevel
      line: 993
      upvalues:
        u2 (ref, index: 1)
    ]]
    return u2.new(a1):solve(a1.boxes, a1.player)
end
tbl_38.MOVE_DIRECTIONS = tbl_1
tbl_38.SokobanEngine = u2
return tbl_38