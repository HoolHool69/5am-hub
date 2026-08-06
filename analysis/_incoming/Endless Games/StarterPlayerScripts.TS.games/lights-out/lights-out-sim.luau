-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
for n_1 = 0, 36 do
    table.insert(tbl_upv_1, 2 ^ n_1)
end
local tbl_upv_2 = {}
local function pressMasks_upv_1(a1)
    --[[
      name: pressMasks
      line: 68
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v1 = tbl_upv_2[a1]
    if v1 == nil then
        local tbl_3 = {}
        local v2 = 0
        local v3 = false
        if v3 then
            v2 = v2 + 1
        else
            v3 = true
        end
        while v2 < a1 do
            local v4 = 0
            local v5 = false
            if v5 then
                v4 = v4 + 1
            else
                v5 = true
            end
            local v6, v7 = nil, nil
            while v4 < a1 do
                v6 = v2 * a1 + v4
                v7 = tbl_upv_1[v6 + 1]
                if v4 > 0 then
                    v7 = v7 + tbl_upv_1[v6]
                end
                if v4 < a1 - 1 then
                    v7 = v7 + tbl_upv_1[v6 + 2]
                end
                if v2 > 0 then
                    v7 = v7 + tbl_upv_1[(v6 - a1) + 1]
                end
                if v2 < a1 - 1 then
                    v7 = v7 + tbl_upv_1[(v6 + a1) + 1]
                end
                table.insert(tbl_3, v7)
                if v5 then
                    v4 = v4 + 1
                else
                    v5 = true
                end
            end
            if v3 then
                v2 = v2 + 1
            else
                v3 = true
            end
        end
        tbl_upv_2[a1] = tbl_3
        return tbl_3
    end
    return v1
end
local function solveMinimal_upv_1(a1, a2)
    --[[
      name: solveMinimal
      line: 140
      upvalues:
        pressMasks_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v8 = a1 * a1
    local v9 = pressMasks_upv_1(a1)
    local tbl_4 = {}
    local tbl_5 = {}
    local tbl_6 = 0
    local tbl_7 = false
    tbl_7, tbl_6 = tbl_7, tbl_6
    while true do
        if tbl_7 then
            tbl_6 = tbl_6 + 1
        else
            tbl_7 = true
        end
        if tbl_6 >= v8 then
            break
        end
        table.insert(tbl_4, v9[tbl_6 + 1])
        local v10 = math.floor(a2 / tbl_upv_1[tbl_6 + 1]) % 2 == 1
        table.insert(tbl_5, v10)
    end
    tbl_6 = {}
    tbl_7 = {}
    local v11 = 0
    local v12 = 0
    local v13 = false
    local v14 = nil
    if v13 then
        v12 = v12 + 1
    else
        v13 = true
    end
    if v12 < v8 then
        v14 = -1
        local v15 = false
        local v16, v17 = v15, v11
        if v16 then
            v17 = v17 + 1
        else
            v16 = true
        end
        if v17 < v8 then
            local v18
            v18 = math.floor(tbl_4[v17 + 1] / tbl_upv_1[v12 + 1]) % 2 == 1
            if v18 then
                v14 = v17
            else
                if v16 then
                    v17 = v17 + 1
                else
                    v16 = true
                end
                continue
            end
        end
        if v14 ~= -1 then
            v17 = tbl_4[v11 + 1]
            tbl_4[v11 + 1] = tbl_4[v14 + 1]
            tbl_4[v14 + 1] = v17
            v16 = tbl_5[v11 + 1]
            tbl_5[v11 + 1] = tbl_5[v14 + 1]
            tbl_5[v14 + 1] = v16
            local v18
            v18 = v11 + 1
            local v19
            v19 = false
            if v19 then
                v18 = v18 + 1
            else
                v19 = true
            end
            while v18 < v8 do
                local v20 = math.floor(tbl_4[v18 + 1] / tbl_upv_1[v12 + 1]) % 2 == 1
                if v20 then
                    local v21
                    v21 = tbl_4[v18 + 1]
                    local v22 = tbl_4[v11 + 1]
                    local v23 = bit32.bxor(v21 % 262144, v22 % 262144)
                    tbl_4[v18 + 1] = (bit32.bxor(math.floor(v21 / 262144), math.floor(v22 / 262144)) * 262144) + v23
                    tbl_5[v18 + 1] = tbl_5[v18 + 1] ~= tbl_5[v11 + 1]
                end
                if v19 then
                    v18 = v18 + 1
                else
                    v19 = true
                end
            end
            table.insert(tbl_6, v12)
            v11 = v11 + 1
        else
            table.insert(tbl_7, v12)
        end
        if v13 then
            v12 = v12 + 1
        else
            v13 = true
        end
        --[[ goto label_7 ]]--
    end
    v13, v12 = false, v11
    if v13 then
        v12 = v12 + 1
    else
        v13 = true
    end
    if v12 >= v8 then
        v14, v13, v12 = false, v11 - 1, 0
        if v14 then
            v13 = v13 - 1
        else
            v14 = true
        end
        while v13 >= 0 do
            local v24 = tbl_4[v13 + 1]
            local v25 = bit32.band(v24 % 262144, v12 % 262144)
            v24 = bit32.band(math.floor(v24 / 262144), math.floor(v12 / 262144)) * 262144 + v25
            local v26 = 0
            while v24 > 0 do
                v26 = v26 + v24 % 2
                v24 = math.floor(v24 / 2)
            end
            if (v26 % 2) == 1 ~= tbl_5[v13 + 1] then
                v12 = v12 + tbl_upv_1[tbl_6[v13 + 1] + 1]
            end
            v12 = nil
            if v14 then
                v13 = v13 - 1
            else
                v14 = true
            end
        end
        v13 = {}
        local v27 = nil
        local v28 = nil
        local v21 = nil
        local v20 = nil
        local v29 = nil
        local v30 = nil
        local v31 = nil
        for v18, v19 in tbl_7 do
            v27 = tbl_upv_1[v19 + 1]
            v28 = v11 - 1
            v21 = false
            if v21 then
                v28 = v28 - 1
            else
                v21 = true
            end
            if v28 < 0 then
                table.insert(v13, v27)
                continue
            end
            v29 = tbl_4[v28 + 1]
            v30 = bit32.band(v29 % 262144, v27 % 262144)
            v29 = (bit32.band(math.floor(v29 / 262144), math.floor(v27 / 262144)) * 262144) + v30
            v31 = 0
            while v29 > 0 do
                v31 = v31 + v29 % 2
                v29 = math.floor(v29 / 2)
            end
            if v31 % 2 == 1 then
                v27 = v27 + tbl_upv_1[tbl_6[v28 + 1] + 1]
            end
            v27 = nil
        end
        local v18, v19
        v18, v19 = v12, 0
        while v18 > 0 do
            v19 = v19 + v18 % 2
            v18 = math.floor(v18 / 2)
        end
        local v17
        local v16
        v19, v18, v16, v14, v17 = false, 1, 2 ^ #v13, v12, v19
        if v19 then
            v18 = v18 + 1
        else
            v19 = true
        end
        while v18 < v16 do
            v20 = v12
            for v32 = 0, #v13 - 1 do
                if math.floor(v18 / tbl_upv_1[v32 + 1]) % 2 == 1 then
                    local v33 = v13[v32 + 1]
                    local v34 = bit32.bxor(v20 % 262144, v33 % 262144)
                    v20 = bit32.bxor(math.floor(v20 / 262144), math.floor(v33 / 262144)) * 262144 + v34
                end
            end
            local v32, v35 = v20, 0
            while v32 > 0 do
                v35 = v35 + v32 % 2
                v32 = math.floor(v32 / 2)
            end
            if v35 < v17 then
                v14, v17 = v20, v35
            end
            if v19 then
                v18 = v18 + 1
            else
                v19 = true
            end
        end
        v18 = {}
        v18.presses = v14
        v18.par = v17
        return v18
    elseif tbl_5[v12 + 1] then
        return nil
    else
        --[[ goto label_9 ]]--
    end
    --[[ label_7 ]]--
    --[[ label_9 ]]--
    while true do
        if v13 >= 0 then
            local v24 = tbl_4[v13 + 1]
            local v25 = bit32.band(v24 % 262144, v12 % 262144)
            v24 = bit32.band(math.floor(v24 / 262144), math.floor(v12 / 262144)) * 262144 + v25
            local v26 = 0
            while v24 > 0 do
                v26 = v26 + v24 % 2
                v24 = math.floor(v24 / 2)
            end
            if (v26 % 2) == 1 ~= tbl_5[v13 + 1] then
                v12 = v12 + tbl_upv_1[tbl_6[v13 + 1] + 1]
            end
            v12 = nil
            if v14 then
                v13 = v13 - 1
            else
                v14 = true
            end
            continue
        end
        break
    end
    v13 = {}
    local v27 = nil
    local v21 = nil
    local v28 = nil
    local v20 = nil
    local v29 = nil
    local v30 = nil
    local v31 = nil
    for v18, v19 in tbl_7 do
        v27 = tbl_upv_1[v19 + 1]
        v28 = v11 - 1
        v21 = false
        if v21 then
            v28 = v28 - 1
        else
            v21 = true
        end
        if v28 < 0 then
            table.insert(v13, v27)
            continue
        end
        v29 = tbl_4[v28 + 1]
        v30 = bit32.band(v29 % 262144, v27 % 262144)
        v29 = (bit32.band(math.floor(v29 / 262144), math.floor(v27 / 262144)) * 262144) + v30
        v31 = 0
        while v29 > 0 do
            v31 = v31 + v29 % 2
            v29 = math.floor(v29 / 2)
        end
        if v31 % 2 == 1 then
            v27 = v27 + tbl_upv_1[tbl_6[v28 + 1] + 1]
        end
        v27 = nil
    end
    local v18, v19
    v18, v19 = v12, 0
    while v18 > 0 do
        v19 = v19 + v18 % 2
        v18 = math.floor(v18 / 2)
    end
    local v17
    local v16
    v19, v18, v16, v14, v17 = false, 1, 2 ^ #v13, v12, v19
    if v19 then
        v18 = v18 + 1
    else
        v19 = true
    end
    while true do
        if v18 < v16 then
            v20 = v12
            for v32 = 0, #v13 - 1 do
                if math.floor(v18 / tbl_upv_1[v32 + 1]) % 2 == 1 then
                    local v33 = v13[v32 + 1]
                    local v34 = bit32.bxor(v20 % 262144, v33 % 262144)
                    v20 = bit32.bxor(math.floor(v20 / 262144), math.floor(v33 / 262144)) * 262144 + v34
                end
            end
            local v32, v35 = nil, nil
            local v32, v35 = v20, 0
            while v32 > 0 do
                v35 = v35 + v32 % 2
                v32 = math.floor(v32 / 2)
            end
            if v35 < v17 then
                v14, v17 = v20, v35
            end
            if v19 then
                v18 = v18 + 1
            else
                v19 = true
            end
            continue
        end
        break
    end
    v18 = {}
    v18.presses = v14
    v18.par = v17
    return v18
end
local tbl_8 = {}
tbl_8.maskXor = function(a1, a2)
    --[[
      name: maskXor
      line: 33
    ]]
    local v36 = bit32.bxor(a1 % 262144, a2 % 262144)
    return (bit32.bxor(math.floor(a1 / 262144), math.floor(a2 / 262144)) * 262144) + v36
end
tbl_8.maskAnd = function(a1, a2)
    --[[
      name: maskAnd
      line: 37
    ]]
    local v37 = bit32.band(a1 % 262144, a2 % 262144)
    return (bit32.band(math.floor(a1 / 262144), math.floor(a2 / 262144)) * 262144) + v37
end
tbl_8.hasBit = function(a1, a2)
    --[[
      name: hasBit
      line: 41
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v38 = math.floor(a1 / tbl_upv_1[a2 + 1]) % 2 == 1
    return v38
end
tbl_8.cellBit = function(a1)
    --[[
      name: cellBit
      line: 45
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[a1 + 1]
end
tbl_8.popcount = function(a1)
    --[[
      name: popcount
      line: 48
    ]]
    local v39 = 0
    local v40 = a1
    while v40 > 0 do
        v39 = v39 + v40 % 2
        v40 = math.floor(v40 / 2)
    end
    return v39
end
tbl_8.cellIndexAt = function(a1, a2, a3)
    --[[
      name: cellIndexAt
      line: 57
    ]]
    return (a3 * a1) + a2
end
tbl_8.pressMasks = pressMasks_upv_1
tbl_8.applyPress = function(a1, a2, a3)
    --[[
      name: applyPress
      line: 124
      upvalues:
        pressMasks_upv_1 (copy, index: 1)
    ]]
    local v41 = pressMasks_upv_1(a1)[a3 + 1]
    local v42 = bit32.bxor(a2 % 262144, v41 % 262144)
    return (bit32.bxor(math.floor(a2 / 262144), math.floor(v41 / 262144)) * 262144) + v42
end
tbl_8.isSolved = function(a1)
    --[[
      name: isSolved
      line: 127
    ]]
    return a1 == 0
end
tbl_8.solveMinimal = solveMinimal_upv_1
tbl_8.minPresses = function(a1, a2)
    --[[
      name: minPresses
      line: 331
      upvalues:
        solveMinimal_upv_1 (copy, index: 1)
    ]]
    local v43 = solveMinimal_upv_1(a1, a2)
    if v43 ~= nil then
        return v43.par
    end
    return nil
end
return tbl_8