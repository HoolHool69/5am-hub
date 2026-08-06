-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "sokoban-sim")
local decodeStateCode_upv_1 = v1.decodeStateCode
local SokobanEngine_upv_1 = v1.SokobanEngine
local tbl_upv_1 = {"000000000", "000000000", "000000000", "000010000", "100000000", "001000000", "000000100", "000000001", "110000000", "011000000", "000000110", "000000011", "100100000", "001001000", "000100100", "000001001", "100010000", "001010000", "000010100", "000010001", "110100000", "011001000", "000100110", "000001011"}
local function wallNeighbourCount_upv_1(a1, a2, a3, a4, a5)
    --[[
      name: wallNeighbourCount
      line: 84
    ]]
    local v2 = 0
    if a4 - 1 < 0 or a1[(a5 * a2) + a4] == true then
        v2 = v2 + 1
    end
    if a2 <= a4 + 1 or a1[((a5 * a2) + a4) + 2] == true then
        v2 = v2 + 1
    end
    if a5 - 1 < 0 or a1[(((a5 - 1) * a2) + a4) + 1] == true then
        v2 = v2 + 1
    end
    if a3 <= a5 + 1 or a1[(((a5 + 1) * a2) + a4) + 1] == true then
        v2 = v2 + 1
    end
    return v2
end
local function keepLargestRegion_upv_1(a1, a2, a3)
    --[[
      name: keepLargestRegion
      line: 144
    ]]
    local tbl_2 = {}
    local tbl_3 = 0
    local v3 = false
    while true do
        if v3 then
            tbl_3 = tbl_3 + 1
        else
            v3 = true
        end
        if tbl_3 >= a2 * a3 then
            break
        end
        table.insert(tbl_2, 0)
    end
    tbl_3 = {}
    v3 = 0
    local v4 = 0
    local v5 = 0
    local v6 = 1
    local v7 = false
    if v7 then
        v6 = v6 + 1
    else
        v7 = true
    end
    if v6 < a3 - 1 then
        local v8 = 1
        local v9 = false
        if v9 then
            v8 = v8 + 1
        else
            v9 = true
        end
        local v10 = nil
        while v8 < a2 - 1 do
            v10 = v6 * a2 + v8
            if a1[v10 + 1] ~= true then
                local v11, v12 = nil, nil
                if tbl_2[v10 + 1] == 0 then
                    v5 = v5 + 1
                    tbl_2[v10 + 1] = v5
                    tbl_3[1] = v10
                    v11 = 0
                    v12 = 1
                    while v11 < v12 do
                        local v13 = tbl_3[v11 + 1]
                        v11 = v11 + 1
                        local v14 = v13 % a2
                        for n_1 = 0, 3 do
                            local v15 = v14 + (((n_1 == 2) and -1) or (((n_1 ~= 3) and 0) or 1))
                            local v16 = (v13 - v14) / a2 + (((n_1 == 0) and -1) or (((n_1 ~= 1) and 0) or 1))
                            if v15 < 0 or v16 < 0 or a2 <= v15 then
                                continue
                            end
                            local v17
                            if a3 <= v16 then
                                continue
                            end
                            v17 = v16 * a2 + v15
                            if a1[v17 + 1] ~= true and tbl_2[v17 + 1] == 0 then
                                tbl_2[v17 + 1] = v5
                                tbl_3[v12 + 1] = v17
                                v12 = v12 + 1
                            end
                        end
                    end
                    if v4 < v12 then
                        v4, v3 = v12, v5
                    end
                end
            end
            if v9 then
                v8 = v8 + 1
            else
                v9 = true
            end
        end
        if v7 then
            v6 = v6 + 1
        else
            v7 = true
        end
        --[[ goto label_7 ]]--
    end
    if v3 ~= 0 then
        v7, v6 = false, 0
        if v7 then
            v6 = v6 + 1
        else
            v7 = true
        end
        while v6 < a2 * a3 do
            if tbl_2[v6 + 1] ~= 0 and tbl_2[v6 + 1] ~= v3 then
                a1[v6 + 1] = true
            end
            if v7 then
                v6 = v6 + 1
            else
                v7 = true
            end
        end
        return v4
    end
    return 0
end
local function fillDeadEnds_upv_1(a1, a2, a3)
    --[[
      name: fillDeadEnds
      line: 101
      upvalues:
        wallNeighbourCount_upv_1 (copy, index: 1)
    ]]
    local v18 = true
    v18 = nil
    while v18 do
        v18 = false
        local v19 = 1
        local v20 = false
        if v20 then
            v19 = v19 + 1
        else
            v20 = true
        end
        local v21, v22
        if v19 >= a3 - 1 then
            continue
        end
        v22 = 1
        v21 = false
        if v21 then
            v22 = v22 + 1
        else
            v21 = true
        end
        local v23 = nil
        if v22 < a2 - 1 then
            v23 = v19 * a2 + v22
            if a1[v23 + 1] ~= true and wallNeighbourCount_upv_1(a1, a2, a3, v22, v19) >= 3 then
                a1[v23 + 1] = true
                v18 = true
            end
            if v21 then
                v22 = v22 + 1
            else
                v21 = true
            end
        end
    end
end
local function breakOpenHall_upv_1(a1, a2, a3, a4)
    --[[
      name: breakOpenHall
      line: 255
    ]]
    local v24 = 0
    local v25 = false
    if v25 then
        v24 = v24 + 1
    else
        v25 = true
    end
    if v24 >= a3 then
        return false
    else
        local v26 = 0
        local v27 = false
        if v27 then
            v26 = v26 + 1
        else
            v27 = true
        end
        if v26 >= a2 then
            return
        end
        for n_2 = 0, 1 do
            local v28
            v28 = ((n_2 ~= 0) and 3) or 4
            local v29 = ((n_2 ~= 0) and 4) or 3
            if a2 < v26 + v28 then
                local _ = n_2
                continue
            end
            local v30, v31, v32
            if a3 < v24 + v29 then
                local _ = n_2
                continue
            end
            v32 = true
            v31 = 0
            v30 = false
            if v30 then
                v31 = v31 + 1
            else
                v30 = true
            end
            if v31 < v29 then
                while v32 do
                    for n_3 = 0, v28 - 1 do
                        if a1[((((v24 + v31) * a2) + v26) + n_3) + 1] == true then
                            v32 = false
                            break
                        end
                    end
                    if v30 then
                        v31 = v31 + 1
                    else
                        v30 = true
                    end
                end
            end
            if not (v32) then
                local _ = n_2
                continue
            end
            v31 = ((n_2 ~= 0) and (v26 + 1)) or (v26 + 1 + a4 % 2)
            a1[(((((n_2 ~= 0) and (v24 + 1 + a4 % 2)) or (v24 + 1)) * a2) + v31) + 1] = true
            return true
        end
    end
end
local function placeGoals_upv_1(a1, a2, a3, a4, a5)
    --[[
      name: placeGoals
      line: 446
    ]]
    local tbl_4 = {}
    local v33 = 1
    local v34 = false
    if v34 then
        v33 = v33 + 1
    else
        v34 = true
    end
    if v33 < a4 - 1 then
        local v35 = 1
        local v36 = false
        if v36 then
            v35 = v35 + 1
        else
            v36 = true
        end
        while v35 < a3 - 1 do
            if a2[((v33 * a3) + v35) + 1] ~= true then
                table.insert(tbl_4, (v33 * a3) + v35)
            end
            if v36 then
                v35 = v35 + 1
            else
                v36 = true
            end
        end
        if v34 then
            v33 = v33 + 1
        else
            v34 = true
        end
        --[[ goto label_3 ]]--
    end
    for n_4 = #tbl_4 - 1, 1, -1 do
        local v37 = a1:NextInteger(0, n_4)
        local v38 = tbl_4[n_4 + 1]
        tbl_4[n_4 + 1] = tbl_4[v37 + 1]
        tbl_4[v37 + 1] = v38
    end
    local v39 = tbl_4[1]
    local v40 = v39 % a3
    local tbl_5 = {}
    table.insert(tbl_5, v39)
    while true do
        local v38
        if #tbl_5 >= a5 then
            break
        end
        local v41 = -1
        local v42 = math.huge
        local v43 = nil
        local v44 = nil
        local v45 = nil
        for _, value_1 in tbl_4 do
            v43 = false
            for v46, value_2 in tbl_5 do
                if value_2 == value_1 then
                    v43 = true
                    break
                end
            end
            if v43 then
                continue
            end
            v45 = value_1 % a3
            v44 = math.abs(v45 - v40) + math.abs(((value_1 - v45) / a3) - (v39 - v40) / a3)
            if v44 < v42 then
                v42, v41 = v44, value_1
            end
        end
        if v41 < 0 then
            break
        else
            table.insert(tbl_5, v41)
        end
    end
    table.sort(tbl_5)
    return tbl_5
end
local function carveRoom_upv_1(a1, a2, a3, a4)
    --[[
      name: carveRoom
      line: 328
      upvalues:
        tbl_upv_1 (copy, index: 1)
        fillDeadEnds_upv_1 (copy, index: 2)
        keepLargestRegion_upv_1 (copy, index: 3)
        breakOpenHall_upv_1 (copy, index: 4)
    ]]
    local tbl_6 = {}
    local v46 = 0
    local v47 = false
    while true do
        if v47 then
            v46 = v46 + 1
        else
            v47 = true
        end
        if v46 >= a2 * a3 then
            break
        end
        table.insert(tbl_6, true)
    end
    v47, v46 = false, 1
    if v47 then
        v46 = v46 + 1
    else
        v47 = true
    end
    if v46 < a3 - 1 then
        local v48 = 1
        local v49 = false
        while true do
            if v49 then
                v48 = v48 + 1
            else
                v49 = true
            end
            if v48 >= a2 - 1 then
                break
            end
            tbl_6[((v46 * a2) + v48) + 1] = false
        end
        if v47 then
            v46 = v46 + 1
        else
            v47 = true
        end
        --[[ goto label_7 ]]--
    end
    v46 = math.ceil((a2 - 2) / 3)
    v47 = math.ceil((a3 - 2) / 3)
    local v49 = nil
    local v49, v48 = false, 0
    if v49 then
        v48 = v48 + 1
    else
        v49 = true
    end
    if v48 < v47 then
        local v50 = 0
        local v51 = false
        v51, v50 = v51, v50
        if v51 then
            v50 = v50 + 1
        else
            v51 = true
        end
        local v52 = nil
        while v50 < v46 do
            v52 = tbl_upv_1[a1:NextInteger(0, #tbl_upv_1 - 1) + 1]
            for n_5 = 0, 2 do
                for n_6 = 0, 2 do
                    local v53
                    v53 = (v50 * 3) + 1 + n_6
                    local v54
                    v54 = (v48 * 3) + 1 + n_5
                    if a2 - 1 > v53 and a3 - 1 > v54 and string.sub(v52, ((n_5 * 3) + n_6) + 1, ((n_5 * 3) + n_6) + 1) == "1" then
                        tbl_6[((v54 * a2) + v53) + 1] = true
                    end
                end
            end
            if v51 then
                v50 = v50 + 1
            else
                v51 = true
            end
        end
        if v49 then
            v48 = v48 + 1
        else
            v49 = true
        end
        --[[ goto label_11 ]]--
    end
    v48 = a1:NextInteger(0, 3)
    for _ = 0, 39 do
        fillDeadEnds_upv_1(tbl_6, a2, a3)
        local v55 = nil
        if keepLargestRegion_upv_1(tbl_6, a2, a3) >= (a4 * 4) + 2 then
            v55 = breakOpenHall_upv_1(tbl_6, a2, a3, v48)
            if v55 then
                continue
            end
            return tbl_6
        end
        return nil
    end
    return nil
end
local function emit_upv_1(a1, a2, a3)
    --[[
      name: emit
      line: 590
      upvalues:
        decodeStateCode_upv_1 (copy, index: 1)
    ]]
    local v56 = decodeStateCode_upv_1(a3.code, a2.boxes)
    local v57 = nil
    if a1.engine:startFault(v56, a3.player) == nil then
        v57 = a1.engine:solve(v56, a3.player)
        if v57 ~= nil and v57 > 0 then
            local tbl_7 = {}
            tbl_7.spec = {width = a2.width, height = a2.height, walls = a1.walls, goals = a1.goals, boxes = v56, player = a3.player}
            tbl_7.par = v57
            tbl_7.boxLines = a3.boxLines
            return tbl_7
        end
    end
    return nil
end
local function corridorStamp_upv_1()
    --[[
      name: corridorStamp
      line: 530
    ]]
    local tbl_8 = {"#######", "#######", "#.$..G#", "#.#####", "#.$..G#", "#######", "#######"}
    local tbl_9 = {}
    local tbl_10 = {}
    local tbl_11 = {}
    for n_7 = 0, 6 do
        for n_8 = 0, 6 do
            local v58
            v58 = string.sub(tbl_8[n_7 + 1], n_8 + 1, n_8 + 1)
            table.insert(tbl_9, v58 == "#")
            if v58 == "G" then
                table.insert(tbl_10, (n_7 * 7) + n_8)
            end
            if v58 == "$" then
                table.insert(tbl_11, (n_7 * 7) + n_8)
            end
        end
    end
    local tbl_12 = {}
    tbl_12.walls = tbl_9
    tbl_12.goals = tbl_10
    tbl_12.boxes = tbl_11
    return tbl_12
end
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 65
    ]]
    local v59 = math.min(a1, 20)
    local tbl_13 = {}
    tbl_13.width = math.min(math.floor((v59 - 1) / 5) + 7, 10)
    tbl_13.height = math.min(math.floor(v59 / 10) + 7, 8)
    tbl_13.boxes = ((a1 < 8) and 2) or 3
    tbl_13.minBoxLines = math.floor(((v59 - 1) * 6) / 19) + 4
    tbl_13.spread = math.floor(v59 / 10) + 2
    return tbl_13
end
local function runAttempt_upv_1(a1, a2, a3)
    --[[
      name: runAttempt
      line: 567
      upvalues:
        carveRoom_upv_1 (copy, index: 1)
        placeGoals_upv_1 (copy, index: 2)
        SokobanEngine_upv_1 (copy, index: 3)
    ]]
    local v60 = carveRoom_upv_1(a1, a2.width, a2.height, a2.boxes)
    if v60 ~= nil then
        local v61 = placeGoals_upv_1(a1, v60, a2.width, a2.height, a2.boxes)
        local v62 = SokobanEngine_upv_1.new({width = a2.width, height = a2.height, walls = v60, goals = v61, boxes = v61, player = v61[1]})
        local tbl_14 = {}
        tbl_14.walls = v60
        tbl_14.goals = v61
        tbl_14.engine = v62
        tbl_14.frontier = v62:searchPullFrontier(v61, a3)
        return tbl_14
    end
    return nil
end
local tbl_15 = {}
tbl_15.levelBand = levelBand_upv_1
tbl_15.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 613
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        runAttempt_upv_1 (copy, index: 3)
        emit_upv_1 (copy, index: 4)
        corridorStamp_upv_1 (copy, index: 5)
        SokobanEngine_upv_1 (copy, index: 6)
    ]]
    local v63 = levelBand_upv_1(a2)
    local v64 = nil
    local v65 = nil
    local maxDepth_1 = 0
    local v66 = 60000
    for n_9 = 0, 15 do
        local v67 = deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + n_9)
        local v68
        v68 = runAttempt_upv_1(v67, v63, {stopDepth = v63.minBoxLines + v67:NextInteger(0, v63.spread), keepFrom = v63.minBoxLines, nodeCap = math.min(24000, v66)})
        local v69
        if v68 == nil then
            continue
        end
        v69 = v68.frontier
        v66 = v66 - v69.settled
        if v63.minBoxLines > v69.maxDepth then
            if maxDepth_1 < v69.maxDepth and v69.deepestCode >= 0 then
                maxDepth_1 = v69.maxDepth
                v65 = {code = v69.deepestCode, player = v69.deepestPlayer, boxLines = v69.maxDepth}
            end
        else
            local tbl_16 = {}
            local v70 = 0
            local v71 = false
            while true do
                if v71 then
                    v70 = v70 + 1
                else
                    v71 = true
                end
                if v70 >= v69.count then
                    break
                end
                table.insert(tbl_16, v70)
            end
            v70 = 0
            while #tbl_16 > 0 and v70 < 4 do
                v70 = v70 + 1
                v71 = v67:NextInteger(0, #tbl_16 - 1)
                local v72 = tbl_16[v71 + 1]
                tbl_16[v71 + 1] = tbl_16[#tbl_16]
                tbl_16[#tbl_16] = nil
                local v73
                v73 = emit_upv_1(v68, v63, {code = v69.codes[v72 + 1], player = v69.players[v72 + 1], boxLines = v69.maxDepth})
                if v73 == nil then
                    continue
                end
                local tbl_17 = {}
                tbl_17.spec = v73.spec
                tbl_17.par = v73.par
                tbl_17.boxLines = v73.boxLines
                tbl_17.attempts = n_9 + 1
                return tbl_17
            end
        end
        if v66 > 0 then
            local _, v76 = nil, nil
            continue
        end
        break
    end
    local v67 = nil
    if v64 == nil then
        local v74 = corridorStamp_upv_1()
        local tbl_18 = {}
        tbl_18.spec = v74
        v67 = SokobanEngine_upv_1.new(v74):solve(v74.boxes, v74.player)
        if v67 == nil then
            v67 = 6
        end
    else
        local v75 = nil
        if v65 == nil then
            local v74 = corridorStamp_upv_1()
            local tbl_18 = {}
            tbl_18.spec = v74
            v67 = SokobanEngine_upv_1.new(v74):solve(v74.boxes, v74.player)
            if v67 == nil then
                v67 = 6
            end
        else
            v75 = emit_upv_1(v64, v63, v65)
            if v75 == nil then
                local v74 = corridorStamp_upv_1()
                local tbl_18 = {}
                tbl_18.spec = v74
                v67 = SokobanEngine_upv_1.new(v74):solve(v74.boxes, v74.player)
                if v67 == nil then
                    v67 = 6
                end
            else
                local tbl_19 = {}
                tbl_19.spec = v75.spec
                tbl_19.par = v75.par
                tbl_19.boxLines = v75.boxLines
                return tbl_19
            end
        end
    end
    tbl_18.par = v67
    tbl_18.boxLines = 2
    tbl_18.attempts = 16
    tbl_18.fallback = true
    return tbl_18
end
tbl_15.sokobanLevelBand = levelBand_upv_1
return tbl_15