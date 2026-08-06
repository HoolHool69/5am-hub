-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "flow-free-sim")
local cellKey_upv_1 = v1.cellKey
local manhattan_upv_1 = v1.manhattan
local propagationForcedFraction_upv_1 = v1.propagationForcedFraction
local function serpentinePath_upv_1(a1)
    --[[
      name: serpentinePath
      line: 57
      upvalues:
        cellKey_upv_1 (copy, index: 1)
    ]]
    local tbl_1 = {}
    local v2 = 0
    local v3 = false
    if v3 then
        v2 = v2 + 1
    else
        v3 = true
    end
    if v2 < a1 then
        if v2 % 2 ~= 0 then
            local v4 = nil
            local v4, v5 = false, a1 - 1
            while true do
                if v4 then
                    v5 = v5 - 1
                else
                    v4 = true
                end
                if v5 < 0 then
                    break
                end
                table.insert(tbl_1, (cellKey_upv_1(a1, v5, v2)))
            end
        else
            local v5 = 0
            local v4 = false
            while true do
                if v4 then
                    v5 = v5 + 1
                else
                    v4 = true
                end
                if v5 >= a1 then
                    break
                end
                table.insert(tbl_1, (cellKey_upv_1(a1, v5, v2)))
            end
        end
        if v3 then
            v2 = v2 + 1
        else
            v3 = true
        end
    end
    return tbl_1
end
local function cutPath_upv_1(a1, a2, a3, a4)
    --[[
      name: cutPath
      line: 233
      upvalues:
        manhattan_upv_1 (copy, index: 1)
    ]]
    local v6 = #a1 - a3 * 4
    local tbl_2 = {}
    local v7 = nil
    for _ = 0, 19 do
        while #tbl_2 > 0 do
            tbl_2[#tbl_2] = nil
        end
        local v8 = 0
        local v9 = false
        while true do
            if v9 then
                v8 = v8 + 1
            else
                v9 = true
            end
            if v8 >= a3 then
                break
            end
            table.insert(tbl_2, 4)
        end
        v9, v8 = false, 0
        while true do
            if v9 then
                v8 = v8 + 1
            else
                v9 = true
            end
            if v8 >= v6 then
                break
            end
            local v10 = a4:NextInteger(0, a3 - 1) + 1
            tbl_2[v10] = tbl_2[v10] + 1
        end
        v8 = {}
        v9 = 0
        v7 = true
        local v11 = 0
        local v12 = false
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
        if v11 < a3 then
            local tbl_3 = {}
            local v13 = 0
            local v14 = false
            while true do
                if v14 then
                    v13 = v13 + 1
                else
                    v14 = true
                end
                if v13 >= tbl_2[v11 + 1] then
                    break
                end
                table.insert(tbl_3, a1[v9 + 1])
                v9 = v9 + 1
            end
            if manhattan_upv_1(a2, tbl_3[1], tbl_3[#tbl_3]) >= 3 then
                table.insert(v8, tbl_3)
                if v12 then
                    v11 = v11 + 1
                else
                    v12 = true
                end
                --[[ goto label_14 ]]--
            else
                v7 = false
            end
        end
        if not (v7) then
            continue
        end
        return v8
    end
    return nil
end
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 43
    ]]
    local v15 = math.min(a1, 25)
    local v16 = math.min(math.floor(v15 / 5) + 5, 10)
    local v17 = v16 * v16
    local tbl_4 = {}
    tbl_4.size = v16
    tbl_4.colorCount = math.clamp(math.round(v17 / ((((v15 - 1) * 3) / 24) + 5)), 4, math.min(14, math.floor(v17 / 4)))
    tbl_4.margin = 8 - math.round(((v15 - 1) * 4) / 24)
    tbl_4.maxForced = 1 - (((v15 - 1) * 0.4) / 24)
    return tbl_4
end
local function specFrom_upv_1(a1, a2)
    --[[
      name: specFrom
      line: 318
    ]]
    local tbl_5 = {}
    for _, value_1 in a1 do
        table.insert(tbl_5, {a = value_1[1], b = value_1[#value_1]})
    end
    local tbl_6 = {}
    tbl_6.columns = a2
    tbl_6.rows = a2
    tbl_6.endpoints = tbl_5
    return tbl_6
end
local function backbite_upv_1(a1, a2, a3)
    --[[
      name: backbite
      line: 118
    ]]
    local v18 = #a1
    local tbl_7 = {}
    local tbl_8 = 0
    local v19 = false
    while true do
        if v19 then
            tbl_8 = tbl_8 + 1
        else
            v19 = true
        end
        if tbl_8 >= v18 then
            break
        end
        table.insert(tbl_7, 0)
    end
    v19, tbl_8 = false, 0
    while true do
        if v19 then
            tbl_8 = tbl_8 + 1
        else
            v19 = true
        end
        local v20, v21, v21, v20
        if tbl_8 >= v18 then
            break
        end
        tbl_7[a1[tbl_8 + 1] + 1] = tbl_8
    end
    tbl_8 = {}
    v19 = v18 * 10
    local v20
    v20 = 0
    local v21
    v21 = false
    if v21 then
        v20 = v20 + 1
    else
        local _ = true
    end
    if v20 < v19 then
        local v22 = a3:NextInteger(0, 1) == 0
        local v23
        if v22 then
            v23 = a1[1]
        else
            v23 = a1[v18]
        end
        local v24 = v23 % a2
        local v25 = math.floor(v23 / a2)
        while #tbl_8 > 0 do
            tbl_8[#tbl_8] = nil
        end
        if v24 > 0 then
            table.insert(tbl_8, v23 - 1)
        end
        if v24 < a2 - 1 then
            table.insert(tbl_8, v23 + 1)
        end
        if v25 > 0 then
            table.insert(tbl_8, v23 - a2)
        end
        if v25 < a2 - 1 then
            table.insert(tbl_8, v23 + a2)
        end
        local v26 = tbl_7[tbl_8[a3:NextInteger(0, #tbl_8 - 1) + 1] + 1]
        if v22 then
            local v27, v28 = nil, nil
            if v26 > 1 then
                v27 = 0
                v28 = v26 - 1
                while v27 < v28 do
                    local v29 = a1[v27 + 1]
                    a1[v27 + 1] = a1[v28 + 1]
                    a1[v28 + 1] = v29
                    tbl_7[a1[v27 + 1] + 1] = v27
                    tbl_7[a1[v28 + 1] + 1] = v28
                    v27 = v27 + 1
                    v28 = v28 - 1
                end
            end
        else
            local v27, v28 = nil, nil
            if v18 - 2 > v26 then
                v27, v28 = v26 + 1, v18 - 1
                while v27 < v28 do
                    local v30 = a1[v27 + 1]
                    a1[v27 + 1] = a1[v28 + 1]
                    a1[v28 + 1] = v30
                    tbl_7[a1[v27 + 1] + 1] = v27
                    tbl_7[a1[v28 + 1] + 1] = v28
                    v27 = v27 + 1
                    v28 = v28 - 1
                end
            end
        end
        if v21 then
            v20 = v20 + 1
        else
            local _ = true
        end
    end
end
local tbl_9 = {}
tbl_9.levelBand = levelBand_upv_1
tbl_9.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 334
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        serpentinePath_upv_1 (copy, index: 3)
        backbite_upv_1 (copy, index: 4)
        cutPath_upv_1 (copy, index: 5)
        specFrom_upv_1 (copy, index: 6)
        propagationForcedFraction_upv_1 (copy, index: 7)
    ]]
    local v31 = levelBand_upv_1(a2)
    local v32 = v31.colorCount + v31.margin
    local v33 = nil
    local v34 = math.huge
    for n_1 = 0, 59 do
        local v35 = deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + n_1)
        local v36 = serpentinePath_upv_1(v31.size)
        backbite_upv_1(v36, v31.size, v35)
        local v37
        v37 = cutPath_upv_1(v36, v31.size, v31.colorCount, v35)
        if v37 == nil then
            continue
        end
        local v38 = specFrom_upv_1(v37, v31.size)
        local v39
        v39 = propagationForcedFraction_upv_1(v38)
        if v39 > v31.maxForced then
            if v39 < v34 then
                v34, v33 = v39, v37
            end
            continue
        else
            local tbl_10 = {}
            tbl_10.spec = v38
            tbl_10.par = v31.colorCount
            tbl_10.drawBudget = v32
            tbl_10.forcedFraction = v39
            tbl_10.attempts = n_1 + 1
            tbl_10.solution = v37
            return tbl_10
        end
    end
    if v33 == nil then
        local v40 = serpentinePath_upv_1(v31.size)
        local v41 = #v40
        local v42 = math.floor(v41 / v31.colorCount)
        local tbl_11 = {}
        local v43 = 0
        local v44 = 0
        local tbl_12 = false
        if tbl_12 then
            v44 = v44 + 1
        else
            tbl_12 = true
        end
        while v44 < v31.colorCount do
            local tbl_13 = {}
            local v45 = v42 + (((v44 >= v41 % v31.colorCount) and 0) or 1)
            local v46 = 0
            local v47 = false
            while true do
                if v47 then
                    v46 = v46 + 1
                else
                    v47 = true
                end
                if v46 >= v45 then
                    break
                end
                table.insert(tbl_13, v40[v43 + 1])
                v43 = v43 + 1
            end
            table.insert(tbl_11, tbl_13)
            if tbl_12 then
                v44 = v44 + 1
            else
                tbl_12 = true
            end
        end
        v44 = specFrom_upv_1(tbl_11, v31.size)
        tbl_12 = {}
        tbl_12.spec = v44
        tbl_12.par = v31.colorCount
        tbl_12.drawBudget = v32
        tbl_12.forcedFraction = propagationForcedFraction_upv_1(v44)
        tbl_12.solution = tbl_11
        return tbl_12
    else
        local tbl_14 = {}
        tbl_14.spec = specFrom_upv_1(v33, v31.size)
        tbl_14.par = v31.colorCount
        tbl_14.drawBudget = v32
        tbl_14.forcedFraction = v34
        tbl_14.solution = v33
        return tbl_14
    end
end
return tbl_9