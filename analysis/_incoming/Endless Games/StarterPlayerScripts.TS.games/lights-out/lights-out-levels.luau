-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "lights-out-sim")
local cellBit_upv_1 = v1.cellBit
local maskXor_upv_1 = v1.maskXor
local pressMasks_upv_1 = v1.pressMasks
local solveMinimal_upv_1 = v1.solveMinimal
local function pressBudget_1(a1, a2)
    --[[
      name: pressBudget
      line: 82
    ]]
    return a2 + (8 - math.floor(((math.min(a1, 25) - 1) / 24) * 4)) + math.floor(a2 * 0.35)
end
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 64
    ]]
    if a1 >= 15 then
        local v2 = math.min(a1, 25) + 8 - 15
        local tbl_1 = {}
        tbl_1.parMin = math.max(2, v2 - 1)
        tbl_1.parMax = v2 + 1
        return tbl_1
    else
        local v3 = math.floor(((math.min(a1, 14) - 1) * 7) / 13) + 2
        local tbl_2 = {}
        tbl_2.parMin = math.max(2, v3 - 1)
        tbl_2.parMax = math.min(v3 + 1, 15)
        return tbl_2
    end
end
local function drawScramble_upv_1(a1, a2, a3)
    --[[
      name: drawScramble
      line: 94
      upvalues:
        pressMasks_upv_1 (copy, index: 1)
        maskXor_upv_1 (copy, index: 2)
    ]]
    local v4 = a2 * a2
    local tbl_3 = {}
    local v5 = 0
    local v6 = false
    while true do
        if v6 then
            v5 = v5 + 1
        else
            v6 = true
        end
        if v5 >= v4 then
            break
        end
        table.insert(tbl_3, v5)
    end
    v5 = pressMasks_upv_1(a2)
    v6 = 0
    local v7 = 0
    local v8 = false
    while true do
        if v8 then
            v7 = v7 + 1
        else
            v8 = true
        end
        if v7 >= a3 then
            break
        end
        local v9 = a1:NextInteger(v7, v4 - 1)
        local v10 = tbl_3[v9 + 1]
        tbl_3[v9 + 1] = tbl_3[v7 + 1]
        tbl_3[v7 + 1] = v10
        v6 = maskXor_upv_1(v6, v5[v10 + 1])
    end
    return v6
end
local tbl_4 = {}
tbl_4.levelBand = levelBand_upv_1
tbl_4.pressBudget = pressBudget_1
tbl_4.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 137
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        drawScramble_upv_1 (copy, index: 3)
        solveMinimal_upv_1 (copy, index: 4)
        pressMasks_upv_1 (copy, index: 5)
        cellBit_upv_1 (copy, index: 6)
    ]]
    local v11 = levelBand_upv_1(a2)
    local v12 = v11.size * v11.size
    local v13 = -1
    local v14 = 0
    local v15 = 0
    local v16 = math.huge
    v13, v14, v15 = v13, v14, v15
    for n_1 = 0, 59 do
        local v17 = deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + n_1)
        local v18 = drawScramble_upv_1(v17, v11.size, math.clamp(v17:NextInteger(v11.parMin, v11.parMax), 1, v12))
        local v19
        v19 = solveMinimal_upv_1(v11.size, v18)
        if v19 == nil or v19.par < 1 then
            continue
        end
        if v11.parMin > v19.par or v19.par > v11.parMax then
            local tbl_5 = ((v19.par >= v11.parMin) and (v19.par - v11.parMax)) or (v11.parMin - v19.par)
            if tbl_5 < v16 then
                v16, v13, v14, v15 = tbl_5, v18, v19.par, v19.presses
            end
            continue
        end
        local tbl_5 = {}
        tbl_5.spec = {size = v11.size, litMask = v18}
        tbl_5.par = v19.par
        tbl_5.solutionMask = v19.presses
        tbl_5.attempts = n_1 + 1
        return tbl_5
    end
    if v13 < 0 then
        local v20 = math.floor(v12 / 2)
        local tbl_6 = {}
        tbl_6.spec = {size = v11.size, litMask = pressMasks_upv_1(v11.size)[v20 + 1]}
        tbl_6.solutionMask = cellBit_upv_1(v20)
        return tbl_6
    else
        local tbl_7 = {}
        tbl_7.spec = {size = v11.size, litMask = v13}
        tbl_7.par = v14
        tbl_7.solutionMask = v15
        return tbl_7
    end
end
return tbl_4