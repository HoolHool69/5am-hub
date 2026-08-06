-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "unblock-me-sim")
local solveJam_upv_1 = v1.solveJam
local solveJamTrace_upv_1 = v1.solveJamTrace
local solveJamWithin_upv_1 = v1.solveJamWithin
local startPositions_upv_1 = v1.startPositions
local function moveBudget_1(a1, a2)
    --[[
      name: moveBudget
      line: 114
    ]]
    return a2 + math.max(3, math.ceil(a2 * (0.5 - (((math.min(a1, 25) - 1) * 0.2) / 24))))
end
local function newBoard_upv_1()
    --[[
      name: newBoard
      line: 133
    ]]
    local tbl_1 = {}
    tbl_1.pieces = {}
    tbl_1.occupied = table.create(36, false)
    return tbl_1
end
local function pieceCell_1(a1, a2)
    --[[
      name: pieceCell
      line: 139
    ]]
    if a1.horizontal then
        return ((a1.y * 6) + a1.x) + a2
    end
    return ((a1.y + a2) * 6) + a1.x
end
local function placePiece_upv_1(a1, a2)
    --[[
      name: placePiece
      line: 162
    ]]
    local v2 = 0
    local v3 = false
    while true do
        if v3 then
            v2 = v2 + 1
        else
            v3 = true
        end
        if v2 >= a2.length then
            break
        end
        a1.occupied[(((a2.horizontal) and ((a2.y * 6) + a2.x + v2)) or ((a2.y + v2) * 6 + a2.x)) + 1] = true
    end
    table.insert(a1.pieces, a2)
end
local function boardSpec_1(a1)
    --[[
      name: boardSpec
      line: 182
    ]]
    local tbl_2 = {}
    tbl_2.pieces = a1.pieces
    return tbl_2
end
local function solveBoard_1(a1, a2)
    --[[
      name: solveBoard
      line: 190
      upvalues:
        solveJamWithin_upv_1 (copy, index: 1)
        startPositions_upv_1 (copy, index: 2)
    ]]
    local tbl_3 = {}
    tbl_3.pieces = a1.pieces
    return solveJamWithin_upv_1(tbl_3, startPositions_upv_1(tbl_3), a2)
end
local function fitsBoard_upv_1(a1, a2)
    --[[
      name: fitsBoard
      line: 142
    ]]
    local v4 = 0
    local v5 = false
    while true do
        if v5 then
            v4 = v4 + 1
        else
            v5 = true
        end
        if v4 >= a2.length then
            return true
        end
        if a1.occupied[(((a2.horizontal) and ((a2.y * 6) + a2.x + v4)) or ((a2.y + v4) * 6 + a2.x)) + 1] == true then
            break
        end
    end
    return false
end
local function shuffledRange_upv_1(a1, a2, a3)
    --[[
      name: shuffledRange
      line: 195
    ]]
    local tbl_4 = {}
    local v6 = false
    local v7
    v7 = a2
    while true do
        if v6 then
            v7 = v7 + 1
        else
            v6 = true
        end
        if v7 > a3 then
            break
        end
        table.insert(tbl_4, v7)
    end
    for n_1 = #tbl_4 - 1, 1, -1 do
        local v8 = a1:NextInteger(0, n_1)
        local v9 = tbl_4[n_1 + 1]
        tbl_4[n_1 + 1] = tbl_4[v8 + 1]
        tbl_4[v8 + 1] = v9
    end
    return tbl_4
end
local function randomBlocker_upv_1(a1)
    --[[
      name: randomBlocker
      line: 261
    ]]
    local v10 = a1:NextNumber() >= 0.55
    local v11 = ((a1:NextNumber() >= 0.3) and 2) or 3
    local v12 = nil
    if v10 then
        v12 = a1:NextInteger(0, 4)
        if v12 >= 2 then
            v12 = v12 + 1
        end
        local tbl_5 = {}
        tbl_5.x = a1:NextInteger(0, 6 - v11)
        tbl_5.y = v12
        tbl_5.length = v11
        return tbl_5
    else
        local tbl_6 = {}
        tbl_6.x = a1:NextInteger(0, 5)
        tbl_6.y = a1:NextInteger(0, 6 - v11)
        tbl_6.length = v11
        return tbl_6
    end
end
local function heroCorridorBlocked_upv_1(a1)
    --[[
      name: heroCorridorBlocked
      line: 302
    ]]
    local v13 = a1.pieces[1].x + 2
    local v14 = false
    v14, v13 = v14, v13
    while true do
        if v14 then
            v13 = v13 + 1
        else
            v14 = true
        end
        if v13 >= 6 then
            return false
        end
        if a1.occupied[(12 + v13) + 1] == true then
            break
        end
    end
    return true
end
local function coveringBlocker_upv_1(a1, a2, a3)
    --[[
      name: coveringBlocker
      line: 222
      upvalues:
        shuffledRange_upv_1 (copy, index: 1)
        fitsBoard_upv_1 (copy, index: 2)
    ]]
    if a3.column >= 0 and a3.column < 6 and a3.row >= 0 then
        local v15, v16 = nil, nil
        if a3.row < 6 then
            if a3.horizontal and a3.row == 2 then
                return nil
            end
            local v17 = ((a2:NextNumber() >= 0.3) and 2) or 3
            local v18
            if a3.horizontal then
                v18 = a3.column
            else
                v18 = a3.row
            end
            local v19 = ((a3.horizontal) and 6) or 6
            v15 = math.max(0, (v18 - v17) + 1)
            v16 = math.min(v18, v19 - v17)
            if v16 >= v15 then
                local v20 = nil
                local v21 = nil
                for _, value_1 in shuffledRange_upv_1(a2, v15, v16) do
                    if a3.horizontal then
                        v20 = {}
                        v20.x = value_1
                        v20.y = a3.row
                    else
                        v20 = {}
                        v20.x = a3.column
                        v20.y = value_1
                    end
                    v20.length = v17
                    v21 = fitsBoard_upv_1(a1, v20)
                    if not (v21) then
                        continue
                    end
                    return v20
                end
            end
        end
    end
    return nil
end
local function corridorGates_upv_1(a1)
    --[[
      name: corridorGates
      line: 284
    ]]
    local v22 = a1.pieces[1]
    local tbl_7 = {}
    for n_2 = 1, #a1.pieces - 1 do
        local v23
        v23 = a1.pieces[n_2 + 1]
        if not v23.horizontal and v23.x >= v22.x + 2 and v23.y <= 2 and v23.y + v23.length > 2 then
            table.insert(tbl_7, v23)
        end
    end
    return tbl_7
end
local function withoutPiece_upv_1(a1, a2)
    --[[
      name: withoutPiece
      line: 435
    ]]
    local tbl_8 = {}
    for n_3 = 0, #a1.pieces - 1 do
        if n_3 ~= a2 then
            table.insert(tbl_8, a1.pieces[n_3 + 1])
        end
    end
    local tbl_9 = {}
    tbl_9.columns = a1.columns
    tbl_9.rows = a1.rows
    tbl_9.exitRow = a1.exitRow
    tbl_9.pieces = tbl_8
    return tbl_9
end
local function frozenSpec_upv_1(a1)
    --[[
      name: frozenSpec
      line: 451
    ]]
    local tbl_10 = {}
    for _, value_2 in a1.pieces do
        table.insert(tbl_10, value_2)
    end
    local tbl_11 = {}
    tbl_11.columns = a1.columns
    tbl_11.rows = a1.rows
    tbl_11.exitRow = a1.exitRow
    tbl_11.pieces = tbl_10
    return tbl_11
end
local function buildJam_upv_1(a1, a2)
    --[[
      name: buildJam
      line: 324
      upvalues:
        newBoard_upv_1 (copy, index: 1)
        placePiece_upv_1 (copy, index: 2)
        shuffledRange_upv_1 (copy, index: 3)
        fitsBoard_upv_1 (copy, index: 4)
        coveringBlocker_upv_1 (copy, index: 5)
        randomBlocker_upv_1 (copy, index: 6)
    ]]
    local v24 = newBoard_upv_1()
    local v25 = a1:NextInteger(0, 1)
    placePiece_upv_1(v24, {x = v25})
    local tbl_12 = {}
    local v26 = nil
    local v27 = nil
    for _, value_3 in shuffledRange_upv_1(a1, v25 + 2, 5) do
        if a2.gateCount <= #tbl_12 or a2.pieceTarget <= #v24.pieces then
            break
        end
        v27 = ((a1:NextNumber() >= 0.45) and 2) or 3
        v26 = {}
        v26.x = value_3
        v26.y = a1:NextInteger(math.max(0, (2 - v27) + 1), math.min(2, 6 - v27))
        v26.length = v27
        if fitsBoard_upv_1(v24, v26) then
            placePiece_upv_1(v24, v26)
            table.insert(tbl_12, v26)
        end
    end
    local tbl_13 = {}
    local v28 = nil
    for _, value_4 in tbl_12 do
        for v33, value_5 in {value_4.y - 1, value_4.y + value_4.length} do
            if a2.pieceTarget <= #v24.pieces then
                break
            end
            if a2.lockChance <= a1:NextNumber() then
                continue
            end
            v28 = coveringBlocker_upv_1(v24, a1, {column = value_4.x, row = value_5})
            if v28 ~= nil then
                placePiece_upv_1(v24, v28)
                table.insert(tbl_13, v28)
            end
        end
    end
    local v29 = nil
    local v30 = nil
    for _, value_6 in tbl_13 do
        for v34, value_7 in {value_6.x - 1, value_6.x + value_6.length} do
            if a2.pieceTarget <= #v24.pieces then
                break
            end
            if a2.pinChance <= a1:NextNumber() then
                continue
            end
            v29 = coveringBlocker_upv_1(v24, a1, {column = value_7, row = value_6.y})
            if v29 ~= nil then
                placePiece_upv_1(v24, v29)
            end
        end
    end
    while true do
        local v31 = nil
        if #v24.pieces >= a2.pieceTarget then
            break
        end
        v30 = false
        for _ = 0, 19 do
            v27 = randomBlocker_upv_1(a1)
            v31 = fitsBoard_upv_1(v24, v27)
            if v31 then
                placePiece_upv_1(v24, v27)
                v30 = true
                break
            else
                continue
            end
        end
        if not (v30) then
            break
        end
    end
    return v24
end
local function pruneDeadWeight_upv_1(a1, a2, a3)
    --[[
      name: pruneDeadWeight
      line: 483
      upvalues:
        withoutPiece_upv_1 (copy, index: 1)
        solveJamWithin_upv_1 (copy, index: 2)
        startPositions_upv_1 (copy, index: 3)
        frozenSpec_upv_1 (copy, index: 4)
    ]]
    local moves_1 = a2.moves
    local tbl_14 = {}
    for _, v33 in a2.movers do
        tbl_14[a1.pieces[v33 + 1]] = true
    end
    local tbl_15 = {}
    tbl_15.maxDepth = moves_1 - 1
    local v34, v35
    v34, v35 = a1, 1
    while true do
        local v36
        if v35 >= #v34.pieces then
            break
        end
        if tbl_14[v34.pieces[v35 + 1]] ~= nil then
            v35 = v35 + 1
            continue
        end
        v36 = withoutPiece_upv_1(v34, v35)
        if solveJamWithin_upv_1(v36, startPositions_upv_1(v36), tbl_15) ~= nil then
            v35 = v35 + 1
        else
            v34 = v36
        end
    end
    local v37 = startPositions_upv_1(v34)
    local tbl_16 = {}
    tbl_16.maxDepth = a3.maxPar
    if solveJamWithin_upv_1(v34, v37, tbl_16) == moves_1 then
        local v33 = {}
        v33.spec = frozenSpec_upv_1(v34)
        v33.par = moves_1
        return v33
    end
    return nil
end
local function growthBlocker_upv_1(a1, a2)
    --[[
      name: growthBlocker
      line: 410
      upvalues:
        corridorGates_upv_1 (copy, index: 1)
        coveringBlocker_upv_1 (copy, index: 2)
        randomBlocker_upv_1 (copy, index: 3)
        fitsBoard_upv_1 (copy, index: 4)
    ]]
    local v38 = corridorGates_upv_1(a1)
    if #v38 > 0 and a2:NextNumber() < 0.7 then
        local v39 = v38[a2:NextInteger(0, #v38 - 1) + 1]
        local tbl_17 = {v39.y - 1, v39.y + v39.length}
        local v40 = a2:NextInteger(0, 1)
        local tbl_18 = nil
        local v41 = nil
        local v42 = nil
        for _, value_8 in {v40, 1 - v40} do
            tbl_18 = {}
            tbl_18.column = v39.x
            tbl_18.row = tbl_17[value_8 + 1]
            v41 = a2:NextNumber() < 0.75
            tbl_18.horizontal = v41
            v42 = coveringBlocker_upv_1(a1, a2, tbl_18)
            if v42 == nil then
                continue
            end
            return v42
        end
    end
    for _ = 0, 19 do
        local v43 = randomBlocker_upv_1(a2)
        local v44
        v44 = fitsBoard_upv_1(a1, v43)
        if not (v44) then
            continue
        end
        return v43
    end
    return nil
end
local function parBand_upv_1(a1)
    --[[
      name: parBand
      line: 98
    ]]
    local v45 = math.min(a1, 25)
    local v46 = math.floor((v45 * 5) / 25) + 3
    local tbl_19 = {}
    tbl_19.minPar = v46
    tbl_19.maxPar = (v46 + 3) + math.floor((v45 * 3) / 25)
    tbl_19.pieceTarget = math.floor((v45 * 3) / 25) + 6
    return tbl_19
end
local function attemptLevel_upv_1(a1, a2, a3)
    --[[
      name: attemptLevel
      line: 525
      upvalues:
        buildJam_upv_1 (copy, index: 1)
        heroCorridorBlocked_upv_1 (copy, index: 2)
        solveJamWithin_upv_1 (copy, index: 3)
        startPositions_upv_1 (copy, index: 4)
        growthBlocker_upv_1 (copy, index: 5)
        placePiece_upv_1 (copy, index: 6)
        solveJamTrace_upv_1 (copy, index: 7)
        pruneDeadWeight_upv_1 (copy, index: 8)
    ]]
    local v47 = buildJam_upv_1(a1, a2)
    if heroCorridorBlocked_upv_1(v47) then
        local tbl_20 = {}
        tbl_20.maxDepth = a3.floorPar - 1
        local v48 = true
        if a3.floorPar > 1 then
            local tbl_21 = {}
            tbl_21.pieces = v47.pieces
            v48 = solveJamWithin_upv_1(tbl_21, startPositions_upv_1(tbl_21), tbl_20) == nil
        end
        local v49 = 0
        local v51 = nil
        while not (v48) and v49 < 10 do
            if #v47.pieces >= a2.pieceCeiling then
                break
            end
            v51 = growthBlocker_upv_1(v47, a1)
            v49 = v49 + 1
            if v51 == nil then
                break
            else
                placePiece_upv_1(v47, v51)
                local tbl_22 = {}
                tbl_22.pieces = v47.pieces
                v48 = solveJamWithin_upv_1(tbl_22, startPositions_upv_1(tbl_22), tbl_20) == nil
            end
        end
        if v48 then
            local tbl_23 = {}
            tbl_23.pieces = v47.pieces
            v51 = solveJamTrace_upv_1(tbl_23, startPositions_upv_1(tbl_23), {maxDepth = a3.maxPar})
            if v51 ~= nil and v51.moves >= a3.floorPar then
                return (pruneDeadWeight_upv_1(tbl_23, v51, a3))
            end
        end
    end
    return nil
end
local function jamProfile_upv_1(a1, a2)
    --[[
      name: jamProfile
      line: 120
    ]]
    local v52 = math.min(a1, 25)
    local tbl_24 = {}
    tbl_24.pieceTarget = a2.pieceTarget
    tbl_24.pieceCeiling = math.min(a2.pieceTarget + 2, 13)
    tbl_24.gateCount = math.floor((v52 * 2) / 25) + 1
    tbl_24.lockChance = ((v52 * 0.6) / 25) + 0.4
    tbl_24.pinChance = ((v52 * 0.4) / 25) + 0.1
    return tbl_24
end
local tbl_25 = {}
tbl_25.parBand = parBand_upv_1
tbl_25.moveBudget = moveBudget_1
tbl_25.generateLevel = function(a1, a2)
    --[[
      name: generateLevel
      line: 561
      upvalues:
        parBand_upv_1 (copy, index: 1)
        jamProfile_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
        attemptLevel_upv_1 (copy, index: 4)
        solveJam_upv_1 (copy, index: 5)
    ]]
    local v53 = parBand_upv_1(a2)
    local v54 = jamProfile_upv_1(a2, v53)
    v53 = nil
    for n_4 = 0, 59 do
        local v55
        v55 = n_4 < 48
        local tbl_26 = {}
        local v56
        if v55 then
            v56 = v53.minPar
        else
            v56 = math.max(2, v53.minPar - 3)
        end
        tbl_26.floorPar = v56
        tbl_26.maxPar = v53.maxPar
        local v57
        v57 = attemptLevel_upv_1(deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + n_4), v54, tbl_26)
        if v57 == nil then
            continue
        end
        local tbl_27 = {}
        tbl_27.spec = v57.spec
        tbl_27.par = v57.par
        tbl_27.attempts = n_4 + 1
        tbl_27.fallback = not v55
        return tbl_27
    end
    local tbl_28 = {}
    tbl_28.pieces = {{}, {}}
    local tbl_29 = {}
    tbl_29.spec = tbl_28
    local v58 = solveJam_upv_1(tbl_28)
    if v58 == nil then
        v58 = 2
    end
    tbl_29.par = v58
    tbl_29.attempts = 60
    tbl_29.fallback = true
    return tbl_29
end
tbl_25.slideRange = v1.slideRange
tbl_25.solveJam = solveJam_upv_1
tbl_25.startPositions = startPositions_upv_1
return tbl_25