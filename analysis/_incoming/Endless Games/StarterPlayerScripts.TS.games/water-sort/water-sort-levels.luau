-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "water-sort-sim")
local isTubeMonochrome_upv_1 = v1.isTubeMonochrome
local solveBoard_upv_1 = v1.solveBoard
local topRun_upv_1 = v1.topRun
local TUBE_CAPACITY_upv_1 = v1.TUBE_CAPACITY
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 81
    ]]
    local v2 = math.min(a1, 22)
    local v3 = math.min(math.floor(((v2 - 1) * 3) / 7) + 3, 12)
    local v4 = (v2 - 1) / 21
    local tbl_1 = {}
    tbl_1.colors = v3
    tbl_1.tubeCount = v3 + 2
    tbl_1.scramblePours = math.ceil(v3 * ((v4 * 1.2) + 2))
    tbl_1.minPar = math.max(3, math.ceil(v3 * 1.5))
    tbl_1.budgetMarginFactor = 0.35 - (v4 * 0.1)
    return tbl_1
end
local function headroomOf_1(a1)
    --[[
      name: headroomOf
      line: 99
      upvalues:
        TUBE_CAPACITY_upv_1 (copy, index: 1)
    ]]
    return TUBE_CAPACITY_upv_1 - #a1
end
local function topColorOf_1(a1)
    --[[
      name: topColorOf
      line: 102
    ]]
    local v5 = #a1
    if v5 <= 0 then
        return nil
    end
    return a1[v5]
end
local function wouldCorkReceiver_1(a1, a2, a3)
    --[[
      name: wouldCorkReceiver
      line: 121
      upvalues:
        TUBE_CAPACITY_upv_1 (copy, index: 1)
        isTubeMonochrome_upv_1 (copy, index: 2)
    ]]
    if #a1 + a3 == TUBE_CAPACITY_upv_1 then
        local v6 = nil
        if #a1 ~= 0 then
            v6 = isTubeMonochrome_upv_1(a1)
            local v7 = nil
            if v6 then
                v7 = #a1
                local v8
                if v7 <= 0 then
                    v8 = nil
                else
                    v8 = a1[v7]
                end
                if v8 == a2 then
                    v6 = true
                else
                    v6 = false
                end
            end
            return v6
        end
        return true
    end
    return false
end
local function countSegments_upv_1(a1)
    --[[
      name: countSegments
      line: 131
    ]]
    local v9 = 0
    for _, value_1 in a1 do
        v9 = v9
        for n_1 = 0, #value_1 - 1 do
            if n_1 == 0 or value_1[n_1 + 1] ~= value_1[n_1] then
                v9 = v9 + 1
            end
        end
    end
    return v9
end
local function trivialDeal_upv_1(a1, a2)
    --[[
      name: trivialDeal
      line: 593
      upvalues:
        solveBoard_upv_1 (copy, index: 1)
    ]]
    local tbl_2 = {}
    local v10 = 0
    local tbl_3 = false
    while true do
        if tbl_3 then
            v10 = v10 + 1
        else
            tbl_3 = true
        end
        if v10 >= a1 then
            break
        end
        local v11 = v10 + 1
        local v12 = (v10 + 1) % a1 + 1
        table.insert(tbl_2, {v11, v11, v12, v12})
    end
    table.insert(tbl_2, {})
    table.insert(tbl_2, {})
    tbl_3 = {}
    table.insert(tbl_3, {to = a1})
    local v13 = a1 + 1
    local v14 = 1
    local v15 = false
    local v12 = a1
    while true do
        if v15 then
            v14 = v14 + 1
        else
            v15 = true
        end
        if v14 >= a1 then
            break
        end
        table.insert(tbl_3, {from = v14, to = v13})
        table.insert(tbl_3, {from = v12, to = v14})
        v12, v13 = v13, v12
    end
    table.insert(tbl_3, {from = v12})
    v15 = solveBoard_upv_1(tbl_2, 2000)
    local tbl_4 = {}
    tbl_4.spec = {colors = a1, tubes = tbl_2}
    local v16 = v15.moves
    if v16 == nil then
        v16 = #tbl_3
    end
    tbl_4.par = v16
    tbl_4.parExact = v15.moves ~= nil
    tbl_4.attempts = a2
    tbl_4.fallback = true
    tbl_4.solution = tbl_3
    return tbl_4
end
local function buildDeal_upv_1(a1, a2, a3, a4)
    --[[
      name: buildDeal
      line: 148
      upvalues:
        TUBE_CAPACITY_upv_1 (copy, index: 1)
        topRun_upv_1 (copy, index: 2)
        isTubeMonochrome_upv_1 (copy, index: 3)
        countSegments_upv_1 (copy, index: 4)
        solveBoard_upv_1 (copy, index: 5)
    ]]
    local v17 = a2 + 2
    local tbl_5 = {}
    local tbl_6 = 0
    local tbl_7 = false
    if tbl_7 then
        tbl_6 = tbl_6 + 1
    else
        tbl_7 = true
    end
    if tbl_6 < a2 then
        local tbl_8 = {}
        for _ = 0, TUBE_CAPACITY_upv_1 - 1 do
            table.insert(tbl_8, tbl_6 + 1)
        end
        table.insert(tbl_5, tbl_8)
        if tbl_7 then
            tbl_6 = tbl_6 + 1
        else
            tbl_7 = true
        end
        --[[ goto label_3 ]]--
    end
    table.insert(tbl_5, {})
    table.insert(tbl_5, {})
    tbl_6 = {}
    tbl_7 = {}
    local source_1 = -1
    local receiver_1 = -1
    local v18 = 0
    local v19 = 0
    local v20 = false
    local v21 = nil
    if v20 then
        v19 = v19 + 1
    else
        v20 = true
    end
    local v22, v23, v24 = nil, nil, nil
    local v27 = nil
    if v19 < a3 then
        table.clear(tbl_7)
        local v25 = 0
        v27 = 0
        v21 = false
        if v21 then
            v27 = v27 + 1
        else
            v21 = true
        end
        while v27 < v17 do
            v22 = topRun_upv_1(tbl_5[v27 + 1])
            local _, v44
            if v22 ~= nil then
                v44 = 0
                _ = false
                local v28 = nil
                if v29 then
                    local v30 = nil
                    v30 = v30 + 1
                else
                    local v29
                    v29 = true
                end
                while v30 < v17 do
                    if v30 ~= v27 then
                        if v27 ~= receiver_1 then
                            local v31
                            v31 = tbl_5[v30 + 1]
                            if #v31 <= 0 then
                                local v28
                                v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                local v32
                                v32 = 1
                                local v33 = false
                                local v34 = nil
                                if v33 then
                                    v32 = v32 + 1
                                else
                                    v33 = true
                                end
                                while v32 <= v28 do
                                    if v32 ~= v22.count then
                                        local v35
                                        v35 = v22.color
                                        if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                            if #v31 ~= 0 then
                                                v23 = isTubeMonochrome_upv_1(v31)
                                                if v23 then
                                                    v24 = #v31
                                                    if v24 <= 0 then
                                                        local v34
                                                        v34 = nil
                                                    else
                                                        local v34
                                                        v34 = v31[v24]
                                                    end
                                                    if v34 == v35 then
                                                        v23 = true
                                                    else
                                                        v23 = false
                                                    end
                                                end
                                            else
                                                v23 = true
                                            end
                                        else
                                            v23 = false
                                        end
                                        if not (v23) then
                                            v35 = ((v30 >= a2) and 1) or 3
                                            v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                            v25 = v25 + v23
                                            table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                        end
                                    else
                                        local v35 = nil
                                        if v22.count >= #tbl_5[v27 + 1] then
                                            v35 = v22.color
                                            if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                if #v31 ~= 0 then
                                                    v23 = isTubeMonochrome_upv_1(v31)
                                                    if v23 then
                                                        v24 = #v31
                                                        if v24 <= 0 then
                                                            local v34
                                                            v34 = nil
                                                        else
                                                            local v34
                                                            v34 = v31[v24]
                                                        end
                                                        if v34 == v35 then
                                                            v23 = true
                                                        else
                                                            v23 = false
                                                        end
                                                    end
                                                else
                                                    v23 = true
                                                end
                                            else
                                                v23 = false
                                            end
                                            if not (v23) then
                                                v35 = ((v30 >= a2) and 1) or 3
                                                v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                v25 = v25 + v23
                                                table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                            end
                                        end
                                    end
                                    if v33 then
                                        local v32 = nil
                                        v32 = v32 + 1
                                    else
                                        local v33
                                        v33 = true
                                    end
                                end
                            else
                                local v32 = nil
                                if a2 > v30 then
                                    v32 = #v31
                                    if v32 <= 0 then
                                        local v28
                                        v28 = nil
                                    else
                                        local v28
                                        v28 = v31[v32]
                                    end
                                    if v28 ~= v22.color then
                                        local v28
                                        v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                        v32 = 1
                                        local v33 = false
                                        local v34 = nil
                                        if v33 then
                                            v32 = v32 + 1
                                        else
                                            v33 = true
                                        end
                                        if v32 <= v28 then
                                            if v32 ~= v22.count then
                                                local v35
                                                v35 = v22.color
                                                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                    if #v31 ~= 0 then
                                                        v23 = isTubeMonochrome_upv_1(v31)
                                                        if v23 then
                                                            v24 = #v31
                                                            if v24 <= 0 then
                                                                local v34
                                                                v34 = nil
                                                            else
                                                                local v34
                                                                v34 = v31[v24]
                                                            end
                                                            if v34 == v35 then
                                                                v23 = true
                                                            else
                                                                v23 = false
                                                            end
                                                        end
                                                    else
                                                        v23 = true
                                                    end
                                                else
                                                    v23 = false
                                                end
                                                if not (v23) then
                                                    v35 = ((v30 >= a2) and 1) or 3
                                                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                    v25 = v25 + v23
                                                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                end
                                            else
                                                local v35 = nil
                                                if v22.count >= #tbl_5[v27 + 1] then
                                                    v35 = v22.color
                                                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                        if #v31 ~= 0 then
                                                            v23 = isTubeMonochrome_upv_1(v31)
                                                            if v23 then
                                                                v24 = #v31
                                                                if v24 <= 0 then
                                                                    local v34
                                                                    v34 = nil
                                                                else
                                                                    local v34
                                                                    v34 = v31[v24]
                                                                end
                                                                if v34 == v35 then
                                                                    v23 = true
                                                                else
                                                                    v23 = false
                                                                end
                                                            end
                                                        else
                                                            v23 = true
                                                        end
                                                    else
                                                        v23 = false
                                                    end
                                                    if not (v23) then
                                                        v35 = ((v30 >= a2) and 1) or 3
                                                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                        v25 = v25 + v23
                                                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                    end
                                                end
                                            end
                                            if v33 then
                                                local v32 = nil
                                                v32 = v32 + 1
                                            else
                                                local v33
                                                v33 = true
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            local v31 = nil
                            if v30 ~= source_1 then
                                v31 = tbl_5[v30 + 1]
                                if #v31 <= 0 then
                                    local v28
                                    v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                    local v32
                                    v32 = 1
                                    local v33 = false
                                    local v34 = nil
                                    if v33 then
                                        v32 = v32 + 1
                                    else
                                        v33 = true
                                    end
                                    while v32 <= v28 do
                                        if v32 ~= v22.count then
                                            local v35
                                            v35 = v22.color
                                            if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                if #v31 ~= 0 then
                                                    v23 = isTubeMonochrome_upv_1(v31)
                                                    if v23 then
                                                        v24 = #v31
                                                        if v24 <= 0 then
                                                            local v34
                                                            v34 = nil
                                                        else
                                                            local v34
                                                            v34 = v31[v24]
                                                        end
                                                        if v34 == v35 then
                                                            v23 = true
                                                        else
                                                            v23 = false
                                                        end
                                                    end
                                                else
                                                    v23 = true
                                                end
                                            else
                                                v23 = false
                                            end
                                            if not (v23) then
                                                v35 = ((v30 >= a2) and 1) or 3
                                                v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                v25 = v25 + v23
                                                table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                            end
                                        else
                                            local v35 = nil
                                            if v22.count >= #tbl_5[v27 + 1] then
                                                v35 = v22.color
                                                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                    if #v31 ~= 0 then
                                                        v23 = isTubeMonochrome_upv_1(v31)
                                                        if v23 then
                                                            v24 = #v31
                                                            if v24 <= 0 then
                                                                local v34
                                                                v34 = nil
                                                            else
                                                                local v34
                                                                v34 = v31[v24]
                                                            end
                                                            if v34 == v35 then
                                                                v23 = true
                                                            else
                                                                v23 = false
                                                            end
                                                        end
                                                    else
                                                        v23 = true
                                                    end
                                                else
                                                    v23 = false
                                                end
                                                if not (v23) then
                                                    v35 = ((v30 >= a2) and 1) or 3
                                                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                    v25 = v25 + v23
                                                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                end
                                            end
                                        end
                                        if v33 then
                                            local v32 = nil
                                            v32 = v32 + 1
                                        else
                                            local v33
                                            v33 = true
                                        end
                                    end
                                else
                                    local v32 = nil
                                    if a2 > v30 then
                                        v32 = #v31
                                        if v32 <= 0 then
                                            local v28
                                            v28 = nil
                                        else
                                            local v28
                                            v28 = v31[v32]
                                        end
                                        if v28 ~= v22.color then
                                            local v28
                                            v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                            v32 = 1
                                            local v33 = false
                                            local v34 = nil
                                            if v33 then
                                                v32 = v32 + 1
                                            else
                                                v33 = true
                                            end
                                            if v32 <= v28 then
                                                if v32 ~= v22.count then
                                                    local v35
                                                    v35 = v22.color
                                                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                        if #v31 ~= 0 then
                                                            v23 = isTubeMonochrome_upv_1(v31)
                                                            if v23 then
                                                                v24 = #v31
                                                                if v24 <= 0 then
                                                                    local v34
                                                                    v34 = nil
                                                                else
                                                                    local v34
                                                                    v34 = v31[v24]
                                                                end
                                                                if v34 == v35 then
                                                                    v23 = true
                                                                else
                                                                    v23 = false
                                                                end
                                                            end
                                                        else
                                                            v23 = true
                                                        end
                                                    else
                                                        v23 = false
                                                    end
                                                    if not (v23) then
                                                        v35 = ((v30 >= a2) and 1) or 3
                                                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                        v25 = v25 + v23
                                                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                    end
                                                else
                                                    local v35 = nil
                                                    if v22.count >= #tbl_5[v27 + 1] then
                                                        v35 = v22.color
                                                        if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                            if #v31 ~= 0 then
                                                                v23 = isTubeMonochrome_upv_1(v31)
                                                                if v23 then
                                                                    v24 = #v31
                                                                    if v24 <= 0 then
                                                                        local v34
                                                                        v34 = nil
                                                                    else
                                                                        local v34
                                                                        v34 = v31[v24]
                                                                    end
                                                                    if v34 == v35 then
                                                                        v23 = true
                                                                    else
                                                                        v23 = false
                                                                    end
                                                                end
                                                            else
                                                                v23 = true
                                                            end
                                                        else
                                                            v23 = false
                                                        end
                                                        if not (v23) then
                                                            v35 = ((v30 >= a2) and 1) or 3
                                                            v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                            v25 = v25 + v23
                                                            table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                        end
                                                    end
                                                end
                                                if v33 then
                                                    local v32 = nil
                                                    v32 = v32 + 1
                                                else
                                                    local v33
                                                    v33 = true
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if v29 then
                        local v30 = nil
                        v30 = v30 + 1
                    else
                        local v29
                        v29 = true
                    end
                end
            end
            if v21 then
                v27 = v27 + 1
            else
                v21 = true
            end
        end
        if #tbl_7 ~= 0 then
            v27 = a1:NextInteger(1, v25)
            v21 = tbl_7[1]
            for v29, value_2 in tbl_7 do
                v27 = v27 - value_2.weight
                if v27 <= 0 then
                    v21 = value_2
                end
            end
            local v36 = tbl_5[v21.source + 1]
            local v37 = v36[#v36]
            local v29, v30
            v29, v30 = false, 0
            while true do
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
                if v30 >= v21.count then
                    break
                end
                v36[#v36] = nil
            end
            v29, v30 = false, 0
            while true do
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
                if v30 >= v21.count then
                    break
                end
                table.insert(tbl_5[v21.receiver + 1], v37)
            end
            table.insert(tbl_6, {source = v21.source, receiver = v21.receiver, count = v21.count})
            source_1 = v21.source
            receiver_1 = v21.receiver
            v18 = v18 + 1
            if v20 then
                v19 = v19 + 1
            else
                v20 = true
            end
        end
    end
    v19 = 0
    if #tbl_5[a2 + 1] <= 0 and #tbl_5[a2 + 2] <= 0 then
        local v25
        v25, v20 = false, 0
        if v25 then
            v20 = v20 + 1
        else
            v25 = true
        end
        if v20 >= a2 then
            if countSegments_upv_1(tbl_5) >= a2 + math.ceil(v18 * 0.35) then
                v20 = solveBoard_upv_1(tbl_5, 2000)
                local v37 = nil
                if v20.moves == nil then
                    if v20.capped then
                        v37, v27 = #tbl_6, false
                    else
                        return nil
                    end
                else
                    v37 = v20.moves
                    v27 = true
                    if v37 < a4 then
                        return nil
                    end
                end
                v21 = {}
                v37, v22 = false, 0
                while true do
                    if v37 then
                        v22 = v22 + 1
                    else
                        v37 = true
                    end
                    if v22 >= v17 then
                        break
                    end
                    table.insert(v21, v22)
                end
                v37, v22 = false, v17 - 1
                local v30 = nil
                while true do
                    if v37 then
                        v22 = v22 - 1
                    else
                        v37 = true
                    end
                    if v22 < 1 then
                        break
                    end
                    v30 = a1:NextInteger(0, v22)
                    v30 = v21[v22 + 1]
                    v21[v22 + 1] = v21[v30 + 1]
                    v21[v30 + 1] = v30
                end
                v22 = {}
                v30, v37 = false, 0
                while true do
                    if v30 then
                        v37 = v37 + 1
                    else
                        v30 = true
                    end
                    if v37 >= v17 then
                        break
                    end
                    v22[v21[v37 + 1] + 1] = v37
                end
                v37 = {}
                local v29
                v29, v30 = false, 0
                while true do
                    if v29 then
                        v30 = v30 + 1
                    else
                        v29 = true
                    end
                    if v30 >= v17 then
                        break
                    end
                    table.insert(v37, tbl_5[v21[v30 + 1] + 1])
                end
                v30 = {}
                for n_2 = #tbl_6 - 1, 0, -1 do
                    local v38 = tbl_6[n_2 + 1]
                    table.insert(v30, {from = v22[v38.receiver + 1], to = v22[v38.source + 1], count = v38.count})
                end
                local tbl_9 = {}
                tbl_9.spec = {colors = a2, tubes = v37}
                tbl_9.par = v37
                tbl_9.parExact = v27
                tbl_9.solution = v30
                return tbl_9
            end
            return nil
        elseif #tbl_5[v20 + 1] == TUBE_CAPACITY_upv_1 then
            if isTubeMonochrome_upv_1(tbl_5[v20 + 1]) then
                return nil
            end
            continue
        else
            return nil
        end
    else
        v19 = v19 + 1
        local v39 = nil
        if v19 <= 12 then
            if #tbl_5[a2 + 1] <= 0 then
                v20 = a2 + 1
            else
                v20 = a2
            end
            v39 = topRun_upv_1(tbl_5[v20 + 1])
            local _, v40, v41 = nil, nil, nil
            if v39 ~= nil then
                v27 = false
                v22, v21, v27 = false, v39.count, v27
                if v22 then
                    v21 = v21 - 1
                else
                    v22 = true
                end
                if v21 >= 1 and not (v27) then
                    table.clear(tbl_7)
                    local v30, v37
                    v30, v37 = false, 0
                    local v33 = nil
                    if v30 then
                        v37 = v37 + 1
                    else
                        v30 = true
                    end
                    while v37 < a2 do
                        local v29
                        v29 = tbl_5[v37 + 1]
                        if TUBE_CAPACITY_upv_1 - #v29 >= v21 then
                            if #v29 <= 0 then
                                local v43
                                v43 = v39.color
                                if #v29 + v21 == TUBE_CAPACITY_upv_1 then
                                    if #v29 ~= 0 then
                                        local v40
                                        v40 = isTubeMonochrome_upv_1(v29)
                                        if v40 then
                                            v23 = #v29
                                            if v23 <= 0 then
                                                local v33
                                                v33 = nil
                                            else
                                                local v33
                                                v33 = v29[v23]
                                            end
                                            if v33 == v43 then
                                                v40 = true
                                            else
                                                v40 = false
                                            end
                                        end
                                    else
                                        local v40
                                        v40 = true
                                    end
                                else
                                    local v40
                                    v40 = false
                                end
                                if not (v40) then
                                    table.insert(tbl_7, {source = v20, receiver = v37, count = v21})
                                end
                            else
                                local v41
                                v41 = #v29
                                local v43
                                if v41 <= 0 then
                                    v43 = nil
                                else
                                    v43 = v29[v41]
                                end
                                if v43 ~= v39.color then
                                    v43 = v39.color
                                    if #v29 + v21 == TUBE_CAPACITY_upv_1 then
                                        if #v29 ~= 0 then
                                            local v40
                                            v40 = isTubeMonochrome_upv_1(v29)
                                            if v40 then
                                                v23 = #v29
                                                if v23 <= 0 then
                                                    local v33
                                                    v33 = nil
                                                else
                                                    local v33
                                                    v33 = v29[v23]
                                                end
                                                if v33 == v43 then
                                                    v40 = true
                                                else
                                                    v40 = false
                                                end
                                            end
                                        else
                                            local v40
                                            v40 = true
                                        end
                                    else
                                        local v40
                                        v40 = false
                                    end
                                    if not (v40) then
                                        table.insert(tbl_7, {source = v20, receiver = v37, count = v21})
                                    end
                                end
                            end
                        end
                        if v30 then
                            local v37 = nil
                            v37 = v37 + 1
                        else
                            local v30
                            v30 = true
                        end
                    end
                    if #tbl_7 ~= 0 then
                        local v29
                        v29 = false
                        v30 = 0
                        v37 = tbl_7[a1:NextInteger(0, #tbl_7 - 1) + 1]
                        while true do
                            if v29 then
                                v30 = v30 + 1
                            else
                                v29 = true
                            end
                            if v30 >= v37.count then
                                break
                            end
                            local v40
                            v40 = tbl_5[v20 + 1]
                            v40[#v40] = nil
                        end
                        v29, v30 = false, 0
                        while true do
                            if v29 then
                                v30 = v30 + 1
                            else
                                v29 = true
                            end
                            if v30 >= v37.count then
                                break
                            end
                            table.insert(tbl_5[v37.receiver + 1], v39.color)
                        end
                        table.insert(tbl_6, {source = v37.source, receiver = v37.receiver, count = v37.count})
                        v27 = true
                    end
                    if v22 then
                        v21 = v21 - 1
                    else
                        v22 = true
                    end
                    continue
                end
                if not v27 then
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    end
    --[[ label_3 ]]--
    while true do
        if v27 < v17 then
            v22 = topRun_upv_1(tbl_5[v27 + 1])
            local _, v44, v25 = nil, nil, nil
            if v22 ~= nil then
                v44 = 0
                _ = false
                local v28 = nil
                if v29 then
                    local v30 = nil
                    v30 = v30 + 1
                else
                    local v29
                    v29 = true
                end
                while v30 < v17 do
                    if v30 ~= v27 then
                        if v27 ~= receiver_1 then
                            local v31
                            v31 = tbl_5[v30 + 1]
                            if #v31 <= 0 then
                                local v28
                                v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                local v32
                                v32 = 1
                                local v33 = false
                                local v34 = nil
                                if v33 then
                                    v32 = v32 + 1
                                else
                                    v33 = true
                                end
                                while v32 <= v28 do
                                    if v32 ~= v22.count then
                                        local v35
                                        v35 = v22.color
                                        if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                            if #v31 ~= 0 then
                                                v23 = isTubeMonochrome_upv_1(v31)
                                                if v23 then
                                                    v24 = #v31
                                                    if v24 <= 0 then
                                                        local v34
                                                        v34 = nil
                                                    else
                                                        local v34
                                                        v34 = v31[v24]
                                                    end
                                                    if v34 == v35 then
                                                        v23 = true
                                                    else
                                                        v23 = false
                                                    end
                                                end
                                            else
                                                v23 = true
                                            end
                                        else
                                            v23 = false
                                        end
                                        if not (v23) then
                                            v35 = ((v30 >= a2) and 1) or 3
                                            v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                            v25 = v25 + v23
                                            table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                        end
                                    else
                                        local v35 = nil
                                        if v22.count >= #tbl_5[v27 + 1] then
                                            v35 = v22.color
                                            if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                if #v31 ~= 0 then
                                                    v23 = isTubeMonochrome_upv_1(v31)
                                                    if v23 then
                                                        v24 = #v31
                                                        if v24 <= 0 then
                                                            local v34
                                                            v34 = nil
                                                        else
                                                            local v34
                                                            v34 = v31[v24]
                                                        end
                                                        if v34 == v35 then
                                                            v23 = true
                                                        else
                                                            v23 = false
                                                        end
                                                    end
                                                else
                                                    v23 = true
                                                end
                                            else
                                                v23 = false
                                            end
                                            if not (v23) then
                                                v35 = ((v30 >= a2) and 1) or 3
                                                v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                v25 = v25 + v23
                                                table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                            end
                                        end
                                    end
                                    if v33 then
                                        local v32 = nil
                                        v32 = v32 + 1
                                    else
                                        local v33
                                        v33 = true
                                    end
                                end
                            else
                                local v32 = nil
                                if a2 > v30 then
                                    v32 = #v31
                                    if v32 <= 0 then
                                        local v28
                                        v28 = nil
                                    else
                                        local v28
                                        v28 = v31[v32]
                                    end
                                    if v28 ~= v22.color then
                                        local v28
                                        v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                        v32 = 1
                                        local v33 = false
                                        local v34 = nil
                                        if v33 then
                                            v32 = v32 + 1
                                        else
                                            v33 = true
                                        end
                                        if v32 <= v28 then
                                            if v32 ~= v22.count then
                                                local v35
                                                v35 = v22.color
                                                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                    if #v31 ~= 0 then
                                                        v23 = isTubeMonochrome_upv_1(v31)
                                                        if v23 then
                                                            v24 = #v31
                                                            if v24 <= 0 then
                                                                local v34
                                                                v34 = nil
                                                            else
                                                                local v34
                                                                v34 = v31[v24]
                                                            end
                                                            if v34 == v35 then
                                                                v23 = true
                                                            else
                                                                v23 = false
                                                            end
                                                        end
                                                    else
                                                        v23 = true
                                                    end
                                                else
                                                    v23 = false
                                                end
                                                if not (v23) then
                                                    v35 = ((v30 >= a2) and 1) or 3
                                                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                    v25 = v25 + v23
                                                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                end
                                            else
                                                local v35 = nil
                                                if v22.count >= #tbl_5[v27 + 1] then
                                                    v35 = v22.color
                                                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                        if #v31 ~= 0 then
                                                            v23 = isTubeMonochrome_upv_1(v31)
                                                            if v23 then
                                                                v24 = #v31
                                                                if v24 <= 0 then
                                                                    local v34
                                                                    v34 = nil
                                                                else
                                                                    local v34
                                                                    v34 = v31[v24]
                                                                end
                                                                if v34 == v35 then
                                                                    v23 = true
                                                                else
                                                                    v23 = false
                                                                end
                                                            end
                                                        else
                                                            v23 = true
                                                        end
                                                    else
                                                        v23 = false
                                                    end
                                                    if not (v23) then
                                                        v35 = ((v30 >= a2) and 1) or 3
                                                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                        v25 = v25 + v23
                                                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                    end
                                                end
                                            end
                                            if v33 then
                                                local v32 = nil
                                                v32 = v32 + 1
                                            else
                                                local v33
                                                v33 = true
                                            end
                                        end
                                    end
                                end
                            end
                        else
                            local v31 = nil
                            if v30 ~= source_1 then
                                v31 = tbl_5[v30 + 1]
                                if #v31 <= 0 then
                                    local v28
                                    v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                    local v32
                                    v32 = 1
                                    local v33 = false
                                    local v34 = nil
                                    if v33 then
                                        v32 = v32 + 1
                                    else
                                        v33 = true
                                    end
                                    while v32 <= v28 do
                                        if v32 ~= v22.count then
                                            local v35
                                            v35 = v22.color
                                            if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                if #v31 ~= 0 then
                                                    v23 = isTubeMonochrome_upv_1(v31)
                                                    if v23 then
                                                        v24 = #v31
                                                        if v24 <= 0 then
                                                            local v34
                                                            v34 = nil
                                                        else
                                                            local v34
                                                            v34 = v31[v24]
                                                        end
                                                        if v34 == v35 then
                                                            v23 = true
                                                        else
                                                            v23 = false
                                                        end
                                                    end
                                                else
                                                    v23 = true
                                                end
                                            else
                                                v23 = false
                                            end
                                            if not (v23) then
                                                v35 = ((v30 >= a2) and 1) or 3
                                                v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                v25 = v25 + v23
                                                table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                            end
                                        else
                                            local v35 = nil
                                            if v22.count >= #tbl_5[v27 + 1] then
                                                v35 = v22.color
                                                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                    if #v31 ~= 0 then
                                                        v23 = isTubeMonochrome_upv_1(v31)
                                                        if v23 then
                                                            v24 = #v31
                                                            if v24 <= 0 then
                                                                local v34
                                                                v34 = nil
                                                            else
                                                                local v34
                                                                v34 = v31[v24]
                                                            end
                                                            if v34 == v35 then
                                                                v23 = true
                                                            else
                                                                v23 = false
                                                            end
                                                        end
                                                    else
                                                        v23 = true
                                                    end
                                                else
                                                    v23 = false
                                                end
                                                if not (v23) then
                                                    v35 = ((v30 >= a2) and 1) or 3
                                                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                    v25 = v25 + v23
                                                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                end
                                            end
                                        end
                                        if v33 then
                                            local v32 = nil
                                            v32 = v32 + 1
                                        else
                                            local v33
                                            v33 = true
                                        end
                                    end
                                else
                                    local v32 = nil
                                    if a2 > v30 then
                                        v32 = #v31
                                        if v32 <= 0 then
                                            local v28
                                            v28 = nil
                                        else
                                            local v28
                                            v28 = v31[v32]
                                        end
                                        if v28 ~= v22.color then
                                            local v28
                                            v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                            v32 = 1
                                            local v33 = false
                                            local v34 = nil
                                            if v33 then
                                                v32 = v32 + 1
                                            else
                                                v33 = true
                                            end
                                            if v32 <= v28 then
                                                if v32 ~= v22.count then
                                                    local v35
                                                    v35 = v22.color
                                                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                        if #v31 ~= 0 then
                                                            v23 = isTubeMonochrome_upv_1(v31)
                                                            if v23 then
                                                                v24 = #v31
                                                                if v24 <= 0 then
                                                                    local v34
                                                                    v34 = nil
                                                                else
                                                                    local v34
                                                                    v34 = v31[v24]
                                                                end
                                                                if v34 == v35 then
                                                                    v23 = true
                                                                else
                                                                    v23 = false
                                                                end
                                                            end
                                                        else
                                                            v23 = true
                                                        end
                                                    else
                                                        v23 = false
                                                    end
                                                    if not (v23) then
                                                        v35 = ((v30 >= a2) and 1) or 3
                                                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                        v25 = v25 + v23
                                                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                    end
                                                else
                                                    local v35 = nil
                                                    if v22.count >= #tbl_5[v27 + 1] then
                                                        v35 = v22.color
                                                        if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                            if #v31 ~= 0 then
                                                                v23 = isTubeMonochrome_upv_1(v31)
                                                                if v23 then
                                                                    v24 = #v31
                                                                    if v24 <= 0 then
                                                                        local v34
                                                                        v34 = nil
                                                                    else
                                                                        local v34
                                                                        v34 = v31[v24]
                                                                    end
                                                                    if v34 == v35 then
                                                                        v23 = true
                                                                    else
                                                                        v23 = false
                                                                    end
                                                                end
                                                            else
                                                                v23 = true
                                                            end
                                                        else
                                                            v23 = false
                                                        end
                                                        if not (v23) then
                                                            v35 = ((v30 >= a2) and 1) or 3
                                                            v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                            v25 = v25 + v23
                                                            table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                        end
                                                    end
                                                end
                                                if v33 then
                                                    local v32 = nil
                                                    v32 = v32 + 1
                                                else
                                                    local v33
                                                    v33 = true
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if v29 then
                        local v30 = nil
                        v30 = v30 + 1
                    else
                        local v29
                        v29 = true
                    end
                end
            end
            if v21 then
                v27 = v27 + 1
            else
                v21 = true
            end
            continue
        end
        break
    end
    while true do
        if #tbl_7 ~= 0 then
            local v26
            v27 = a1:NextInteger(1, v25)
            v21 = tbl_7[1]
            for v29, value_2 in tbl_7 do
                v27 = v27 - value_2.weight
                if v27 <= 0 then
                    v21 = value_2
                end
            end
            local v36 = tbl_5[v21.source + 1]
            local v37 = v36[#v36]
            local v29, v30
            v29, v30 = false, 0
            while true do
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
                if v30 >= v21.count then
                    break
                end
                v36[#v36] = nil
            end
            v29, v30 = false, 0
            while true do
                if v29 then
                    v30 = v30 + 1
                else
                    v29 = true
                end
                if v30 >= v21.count then
                    break
                end
                table.insert(tbl_5[v21.receiver + 1], v37)
            end
            table.insert(tbl_6, {source = v21.source, receiver = v21.receiver, count = v21.count})
            source_1 = v21.source
            receiver_1 = v21.receiver
            v18 = v18 + 1
            
            if v20 then
                v19 = v19 + 1
            else
                v20 = true
            end
            continue
        end
        break
    end
    --[[ goto label_31 ]]--
    --[[ label_31 ]]--
    while true do
        if v21 >= 1 and not (v27) then
            table.clear(tbl_7)
            local v30, v37
            v30, v37 = false, 0
            local v33 = nil
            if v30 then
                v37 = v37 + 1
            else
                v30 = true
            end
            while v37 < a2 do
                local v29
                v29 = tbl_5[v37 + 1]
                if TUBE_CAPACITY_upv_1 - #v29 >= v21 then
                    if #v29 <= 0 then
                        local v43
                        v43 = v39.color
                        if #v29 + v21 == TUBE_CAPACITY_upv_1 then
                            if #v29 ~= 0 then
                                local v40
                                v40 = isTubeMonochrome_upv_1(v29)
                                if v40 then
                                    v23 = #v29
                                    if v23 <= 0 then
                                        local v33
                                        v33 = nil
                                    else
                                        local v33
                                        v33 = v29[v23]
                                    end
                                    if v33 == v43 then
                                        v40 = true
                                    else
                                        v40 = false
                                    end
                                end
                            else
                                local v40
                                v40 = true
                            end
                        else
                            local v40
                            v40 = false
                        end
                        if not (v40) then
                            table.insert(tbl_7, {source = v20, receiver = v37, count = v21})
                        end
                    else
                        local v41
                        v41 = #v29
                        local v43
                        if v41 <= 0 then
                            v43 = nil
                        else
                            v43 = v29[v41]
                        end
                        if v43 ~= v39.color then
                            v43 = v39.color
                            if #v29 + v21 == TUBE_CAPACITY_upv_1 then
                                if #v29 ~= 0 then
                                    local v40
                                    v40 = isTubeMonochrome_upv_1(v29)
                                    if v40 then
                                        v23 = #v29
                                        if v23 <= 0 then
                                            local v33
                                            v33 = nil
                                        else
                                            local v33
                                            v33 = v29[v23]
                                        end
                                        if v33 == v43 then
                                            v40 = true
                                        else
                                            v40 = false
                                        end
                                    end
                                else
                                    local v40
                                    v40 = true
                                end
                            else
                                local v40
                                v40 = false
                            end
                            if not (v40) then
                                table.insert(tbl_7, {source = v20, receiver = v37, count = v21})
                            end
                        end
                    end
                end
                if v30 then
                    local v37 = nil
                    v37 = v37 + 1
                else
                    local v30
                    v30 = true
                end
            end
            if #tbl_7 ~= 0 then
                local v29
                v29 = false
                v30 = 0
                v37 = tbl_7[a1:NextInteger(0, #tbl_7 - 1) + 1]
                while true do
                    if v29 then
                        v30 = v30 + 1
                    else
                        v29 = true
                    end
                    if v30 >= v37.count then
                        break
                    end
                    local v40
                    v40 = tbl_5[v20 + 1]
                    v40[#v40] = nil
                end
                v29, v30 = false, 0
                while true do
                    if v29 then
                        v30 = v30 + 1
                    else
                        v29 = true
                    end
                    if v30 >= v37.count then
                        break
                    end
                    table.insert(tbl_5[v37.receiver + 1], v39.color)
                end
                table.insert(tbl_6, {source = v37.source, receiver = v37.receiver, count = v37.count})
                v27 = true
            end
            if v22 then
                v21 = v21 - 1
            else
                v22 = true
            end
            continue
        end
        break
    end
    while true do
        if v27 then
            continue
        else
            return nil
        end
    end
    while true do
        if v37 < a2 then
            local v29
            v29 = tbl_5[v37 + 1]
            if TUBE_CAPACITY_upv_1 - #v29 >= v21 then
                if #v29 <= 0 then
                    local v43
                    v43 = v39.color
                    if #v29 + v21 == TUBE_CAPACITY_upv_1 then
                        if #v29 ~= 0 then
                            local v40
                            v40 = isTubeMonochrome_upv_1(v29)
                            if v40 then
                                v23 = #v29
                                if v23 <= 0 then
                                    local v33
                                    v33 = nil
                                else
                                    local v33
                                    v33 = v29[v23]
                                end
                                if v33 == v43 then
                                    v40 = true
                                else
                                    v40 = false
                                end
                            end
                        else
                            local v40
                            v40 = true
                        end
                    else
                        local v40
                        v40 = false
                    end
                    if not (v40) then
                        table.insert(tbl_7, {source = v20, receiver = v37, count = v21})
                    end
                else
                    local v41
                    v41 = #v29
                    local v43
                    if v41 <= 0 then
                        v43 = nil
                    else
                        v43 = v29[v41]
                    end
                    if v43 ~= v39.color then
                        v43 = v39.color
                        if #v29 + v21 == TUBE_CAPACITY_upv_1 then
                            if #v29 ~= 0 then
                                local v40
                                v40 = isTubeMonochrome_upv_1(v29)
                                if v40 then
                                    v23 = #v29
                                    if v23 <= 0 then
                                        local v33
                                        v33 = nil
                                    else
                                        local v33
                                        v33 = v29[v23]
                                    end
                                    if v33 == v43 then
                                        v40 = true
                                    else
                                        v40 = false
                                    end
                                end
                            else
                                local v40
                                v40 = true
                            end
                        else
                            local v40
                            v40 = false
                        end
                        if not (v40) then
                            table.insert(tbl_7, {source = v20, receiver = v37, count = v21})
                        end
                    end
                end
            end
            if v30 then
                local v37 = nil
                v37 = v37 + 1
            else
                local v30
                v30 = true
            end
            continue
        end
        break
    end
    if #tbl_7 ~= 0 then
        local v29, v30, v37
        v29 = false
        v30 = 0
        v37 = tbl_7[a1:NextInteger(0, #tbl_7 - 1) + 1]
        while true do
            if v29 then
                v30 = v30 + 1
            else
                v29 = true
            end
            if v30 >= v37.count then
                break
            end
            local v40
            v40 = tbl_5[v20 + 1]
            v40[#v40] = nil
        end
        v29, v30 = false, 0
        while true do
            if v29 then
                v30 = v30 + 1
            else
                v29 = true
            end
            if v30 >= v37.count then
                break
            end
            table.insert(tbl_5[v37.receiver + 1], v39.color)
        end
        table.insert(tbl_6, {source = v37.source, receiver = v37.receiver, count = v37.count})
        v27 = true
    end
    if v22 then
        v21 = v21 - 1
    else
        v22 = true
    end
    if v25 then
        v20 = v20 + 1
    else
        local v25
        v25 = true
    end
    while true do
        if v20 >= a2 then
            if countSegments_upv_1(tbl_5) >= a2 + math.ceil(v18 * 0.35) then
                v20 = solveBoard_upv_1(tbl_5, 2000)
                local v37 = nil
                if v20.moves == nil then
                    if v20.capped then
                        v37, v27 = #tbl_6, false
                    else
                        return nil
                    end
                else
                    v37 = v20.moves
                    v27 = true
                    if v37 < a4 then
                        return nil
                    end
                end
                v21 = {}
                v37, v22 = false, 0
                while true do
                    if v37 then
                        v22 = v22 + 1
                    else
                        v37 = true
                    end
                    if v22 >= v17 then
                        break
                    end
                    table.insert(v21, v22)
                end
                v37, v22 = false, v17 - 1
                local v30 = nil
                while true do
                    if v37 then
                        v22 = v22 - 1
                    else
                        v37 = true
                    end
                    if v22 < 1 then
                        break
                    end
                    v30 = a1:NextInteger(0, v22)
                    v30 = v21[v22 + 1]
                    v21[v22 + 1] = v21[v30 + 1]
                    v21[v30 + 1] = v30
                end
                v22 = {}
                v30, v37 = false, 0
                while true do
                    if v30 then
                        v37 = v37 + 1
                    else
                        v30 = true
                    end
                    if v37 >= v17 then
                        break
                    end
                    v22[v21[v37 + 1] + 1] = v37
                end
                v37 = {}
                local v29
                v29, v30 = false, 0
                while true do
                    if v29 then
                        v30 = v30 + 1
                    else
                        v29 = true
                    end
                    if v30 >= v17 then
                        break
                    end
                    table.insert(v37, tbl_5[v21[v30 + 1] + 1])
                end
                v30 = {}
                for n_2 = #tbl_6 - 1, 0, -1 do
                    local v38 = tbl_6[n_2 + 1]
                    table.insert(v30, {from = v22[v38.receiver + 1], to = v22[v38.source + 1], count = v38.count})
                end
                local tbl_9 = {}
                tbl_9.spec = {colors = a2, tubes = v37}
                tbl_9.par = v37
                tbl_9.parExact = v27
                tbl_9.solution = v30
                return tbl_9
            end
        elseif #tbl_5[v20 + 1] == TUBE_CAPACITY_upv_1 then
            if isTubeMonochrome_upv_1(tbl_5[v20 + 1]) then
                return nil
            end
            continue
        else
            return nil
        end
    end
    local v25 = nil
    while true do
        if v30 < v17 then
            if v30 ~= v27 then
                if v27 ~= receiver_1 then
                    local v31
                    v31 = tbl_5[v30 + 1]
                    if #v31 <= 0 then
                        local v28
                        v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                        local v32
                        v32 = 1
                        local v33 = false
                        local v34 = nil
                        if v33 then
                            v32 = v32 + 1
                        else
                            v33 = true
                        end
                        while v32 <= v28 do
                            if v32 ~= v22.count then
                                local v35
                                v35 = v22.color
                                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                    if #v31 ~= 0 then
                                        v23 = isTubeMonochrome_upv_1(v31)
                                        if v23 then
                                            v24 = #v31
                                            if v24 <= 0 then
                                                local v34
                                                v34 = nil
                                            else
                                                local v34
                                                v34 = v31[v24]
                                            end
                                            if v34 == v35 then
                                                v23 = true
                                            else
                                                v23 = false
                                            end
                                        end
                                    else
                                        v23 = true
                                    end
                                else
                                    v23 = false
                                end
                                if not (v23) then
                                    v35 = ((v30 >= a2) and 1) or 3
                                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                    v25 = v25 + v23
                                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                end
                            else
                                local v35 = nil
                                if v22.count >= #tbl_5[v27 + 1] then
                                    v35 = v22.color
                                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                        if #v31 ~= 0 then
                                            v23 = isTubeMonochrome_upv_1(v31)
                                            if v23 then
                                                v24 = #v31
                                                if v24 <= 0 then
                                                    local v34
                                                    v34 = nil
                                                else
                                                    local v34
                                                    v34 = v31[v24]
                                                end
                                                if v34 == v35 then
                                                    v23 = true
                                                else
                                                    v23 = false
                                                end
                                            end
                                        else
                                            v23 = true
                                        end
                                    else
                                        v23 = false
                                    end
                                    if not (v23) then
                                        v35 = ((v30 >= a2) and 1) or 3
                                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                        v25 = v25 + v23
                                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                    end
                                end
                            end
                            if v33 then
                                local v32 = nil
                                v32 = v32 + 1
                            else
                                local v33
                                v33 = true
                            end
                        end
                    else
                        local v32 = nil
                        if a2 > v30 then
                            v32 = #v31
                            if v32 <= 0 then
                                local v28
                                v28 = nil
                            else
                                local v28
                                v28 = v31[v32]
                            end
                            if v28 ~= v22.color then
                                local v28
                                v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                v32 = 1
                                local v33 = false
                                local v34 = nil
                                if v33 then
                                    v32 = v32 + 1
                                else
                                    v33 = true
                                end
                                if v32 <= v28 then
                                    if v32 ~= v22.count then
                                        local v35
                                        v35 = v22.color
                                        if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                            if #v31 ~= 0 then
                                                v23 = isTubeMonochrome_upv_1(v31)
                                                if v23 then
                                                    v24 = #v31
                                                    if v24 <= 0 then
                                                        local v34
                                                        v34 = nil
                                                    else
                                                        local v34
                                                        v34 = v31[v24]
                                                    end
                                                    if v34 == v35 then
                                                        v23 = true
                                                    else
                                                        v23 = false
                                                    end
                                                end
                                            else
                                                v23 = true
                                            end
                                        else
                                            v23 = false
                                        end
                                        if not (v23) then
                                            v35 = ((v30 >= a2) and 1) or 3
                                            v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                            v25 = v25 + v23
                                            table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                        end
                                    else
                                        local v35 = nil
                                        if v22.count >= #tbl_5[v27 + 1] then
                                            v35 = v22.color
                                            if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                if #v31 ~= 0 then
                                                    v23 = isTubeMonochrome_upv_1(v31)
                                                    if v23 then
                                                        v24 = #v31
                                                        if v24 <= 0 then
                                                            local v34
                                                            v34 = nil
                                                        else
                                                            local v34
                                                            v34 = v31[v24]
                                                        end
                                                        if v34 == v35 then
                                                            v23 = true
                                                        else
                                                            v23 = false
                                                        end
                                                    end
                                                else
                                                    v23 = true
                                                end
                                            else
                                                v23 = false
                                            end
                                            if not (v23) then
                                                v35 = ((v30 >= a2) and 1) or 3
                                                v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                v25 = v25 + v23
                                                table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                            end
                                        end
                                    end
                                    if v33 then
                                        local v32 = nil
                                        v32 = v32 + 1
                                    else
                                        local v33
                                        v33 = true
                                    end
                                end
                            end
                        end
                    end
                else
                    local v31 = nil
                    if v30 ~= source_1 then
                        v31 = tbl_5[v30 + 1]
                        if #v31 <= 0 then
                            local v28
                            v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                            local v32
                            v32 = 1
                            local v33 = false
                            local v34 = nil
                            if v33 then
                                v32 = v32 + 1
                            else
                                v33 = true
                            end
                            while v32 <= v28 do
                                if v32 ~= v22.count then
                                    local v35
                                    v35 = v22.color
                                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                        if #v31 ~= 0 then
                                            v23 = isTubeMonochrome_upv_1(v31)
                                            if v23 then
                                                v24 = #v31
                                                if v24 <= 0 then
                                                    local v34
                                                    v34 = nil
                                                else
                                                    local v34
                                                    v34 = v31[v24]
                                                end
                                                if v34 == v35 then
                                                    v23 = true
                                                else
                                                    v23 = false
                                                end
                                            end
                                        else
                                            v23 = true
                                        end
                                    else
                                        v23 = false
                                    end
                                    if not (v23) then
                                        v35 = ((v30 >= a2) and 1) or 3
                                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                        v25 = v25 + v23
                                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                    end
                                else
                                    local v35 = nil
                                    if v22.count >= #tbl_5[v27 + 1] then
                                        v35 = v22.color
                                        if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                            if #v31 ~= 0 then
                                                v23 = isTubeMonochrome_upv_1(v31)
                                                if v23 then
                                                    v24 = #v31
                                                    if v24 <= 0 then
                                                        local v34
                                                        v34 = nil
                                                    else
                                                        local v34
                                                        v34 = v31[v24]
                                                    end
                                                    if v34 == v35 then
                                                        v23 = true
                                                    else
                                                        v23 = false
                                                    end
                                                end
                                            else
                                                v23 = true
                                            end
                                        else
                                            v23 = false
                                        end
                                        if not (v23) then
                                            v35 = ((v30 >= a2) and 1) or 3
                                            v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                            v25 = v25 + v23
                                            table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                        end
                                    end
                                end
                                if v33 then
                                    local v32 = nil
                                    v32 = v32 + 1
                                else
                                    local v33
                                    v33 = true
                                end
                            end
                        else
                            local v32 = nil
                            if a2 > v30 then
                                v32 = #v31
                                if v32 <= 0 then
                                    local v28
                                    v28 = nil
                                else
                                    local v28
                                    v28 = v31[v32]
                                end
                                if v28 ~= v22.color then
                                    local v28
                                    v28 = math.min(v22.count, TUBE_CAPACITY_upv_1 - #v31)
                                    v32 = 1
                                    local v33 = false
                                    local v34 = nil
                                    if v33 then
                                        v32 = v32 + 1
                                    else
                                        v33 = true
                                    end
                                    if v32 <= v28 then
                                        if v32 ~= v22.count then
                                            local v35
                                            v35 = v22.color
                                            if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                if #v31 ~= 0 then
                                                    v23 = isTubeMonochrome_upv_1(v31)
                                                    if v23 then
                                                        v24 = #v31
                                                        if v24 <= 0 then
                                                            local v34
                                                            v34 = nil
                                                        else
                                                            local v34
                                                            v34 = v31[v24]
                                                        end
                                                        if v34 == v35 then
                                                            v23 = true
                                                        else
                                                            v23 = false
                                                        end
                                                    end
                                                else
                                                    v23 = true
                                                end
                                            else
                                                v23 = false
                                            end
                                            if not (v23) then
                                                v35 = ((v30 >= a2) and 1) or 3
                                                v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                v25 = v25 + v23
                                                table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                            end
                                        else
                                            local v35 = nil
                                            if v22.count >= #tbl_5[v27 + 1] then
                                                v35 = v22.color
                                                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                                                    if #v31 ~= 0 then
                                                        v23 = isTubeMonochrome_upv_1(v31)
                                                        if v23 then
                                                            v24 = #v31
                                                            if v24 <= 0 then
                                                                local v34
                                                                v34 = nil
                                                            else
                                                                local v34
                                                                v34 = v31[v24]
                                                            end
                                                            if v34 == v35 then
                                                                v23 = true
                                                            else
                                                                v23 = false
                                                            end
                                                        end
                                                    else
                                                        v23 = true
                                                    end
                                                else
                                                    v23 = false
                                                end
                                                if not (v23) then
                                                    v35 = ((v30 >= a2) and 1) or 3
                                                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                                                    v25 = v25 + v23
                                                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                                                end
                                            end
                                        end
                                        if v33 then
                                            local v32 = nil
                                            v32 = v32 + 1
                                        else
                                            local v33
                                            v33 = true
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if v29 then
                local v30 = nil
                v30 = v30 + 1
            else
                local v29
                v29 = true
            end
            continue
        end
        break
    end
    if v21 then
        v27 = v27 + 1
    else
        v21 = true
    end
    while true do
        if v32 <= v28 then
            if v32 ~= v22.count then
                local v35
                v35 = v22.color
                if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                    if #v31 ~= 0 then
                        v23 = isTubeMonochrome_upv_1(v31)
                        if v23 then
                            v24 = #v31
                            if v24 <= 0 then
                                local v34
                                v34 = nil
                            else
                                local v34
                                v34 = v31[v24]
                            end
                            if v34 == v35 then
                                v23 = true
                            else
                                v23 = false
                            end
                        end
                    else
                        v23 = true
                    end
                else
                    v23 = false
                end
                if not (v23) then
                    v35 = ((v30 >= a2) and 1) or 3
                    v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                    v25 = v25 + v23
                    table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                end
            else
                local v35 = nil
                if v22.count >= #tbl_5[v27 + 1] then
                    v35 = v22.color
                    if #v31 + v32 == TUBE_CAPACITY_upv_1 then
                        if #v31 ~= 0 then
                            v23 = isTubeMonochrome_upv_1(v31)
                            if v23 then
                                v24 = #v31
                                if v24 <= 0 then
                                    local v34
                                    v34 = nil
                                else
                                    local v34
                                    v34 = v31[v24]
                                end
                                if v34 == v35 then
                                    v23 = true
                                else
                                    v23 = false
                                end
                            end
                        else
                            v23 = true
                        end
                    else
                        v23 = false
                    end
                    if not (v23) then
                        v35 = ((v30 >= a2) and 1) or 3
                        v23 = v35 * (((v32 >= v22.count) and 1) or 2)
                        v25 = v25 + v23
                        table.insert(tbl_7, {source = v27, receiver = v30, count = v32, weight = v23})
                    end
                end
            end
            if v33 then
                local v32 = nil
                v32 = v32 + 1
            else
                local v33
                v33 = true
            end
            continue
        end
        break
    end
    if v29 then
        local v30 = nil
        v30 = v30 + 1
    else
        local v29
        v29 = true
    end
end
local tbl_10 = {}
tbl_10.levelBand = levelBand_upv_1
tbl_10.moveBudgetFor = function(a1, a2)
    --[[
      name: moveBudgetFor
      line: 94
      upvalues:
        levelBand_upv_1 (copy, index: 1)
    ]]
    return a1 + math.max(4, math.ceil(a1 * levelBand_upv_1(a2).budgetMarginFactor))
end
tbl_10.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 681
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        buildDeal_upv_1 (copy, index: 3)
        trivialDeal_upv_1 (copy, index: 4)
    ]]
    local v44 = levelBand_upv_1(a2)
    local v46 = nil
    for n_3 = 0, 59 do
        v46 = buildDeal_upv_1(deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + n_3), v44.colors, v44.scramblePours, v44.minPar)
        if v46 == nil then
            continue
        end
        local tbl_11 = {}
        tbl_11.spec = v46.spec
        tbl_11.par = v46.par
        tbl_11.parExact = v46.parExact
        tbl_11.attempts = n_3 + 1
        tbl_11.solution = v46.solution
        return tbl_11
    end
    v46 = math.max(v44.colors, math.ceil(v44.scramblePours * 0.6))
    for n_4 = 0, 59 do
        local v47
        v47 = buildDeal_upv_1(deriveRandom_upv_1(a1, ((5e+06 + (a2 * 1000)) + 500) + n_4), v44.colors, v46, math.max(3, v44.colors))
        if v47 == nil then
            continue
        end
        local tbl_12 = {}
        tbl_12.spec = v47.spec
        tbl_12.par = v47.par
        tbl_12.parExact = v47.parExact
        tbl_12.attempts = (n_4 + 60) + 1
        tbl_12.solution = v47.solution
        return tbl_12
    end
    return (trivialDeal_upv_1(v44.colors, 120))
end
return tbl_10