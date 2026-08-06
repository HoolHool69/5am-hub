-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {10, 20, 60, 120, 200, 300}
local tbl_2 = {"#"}
local tbl_3 = {"##"}
local tbl_4 = {"###"}
local tbl_5 = {"####"}
local tbl_6 = {"#####"}
local tbl_7 = {"#", "#"}
local tbl_8 = {"#", "#", "#"}
local tbl_9 = {"#", "#", "#", "#"}
local tbl_10 = {"#", "#", "#", "#", "#"}
local tbl_11 = {"##", "##"}
local tbl_12 = {"###", "###", "###"}
local tbl_13 = {"###", "###"}
local tbl_14 = {"##", "##", "##"}
local tbl_15 = {"#.", "#.", "##"}
local tbl_16 = {"###", "#.."}
local tbl_17 = {"##", ".#", ".#"}
local function buildPiece_1(a1, a2, a3, a4)
    --[[
      name: buildPiece
      line: 33
    ]]
    local tbl_18 = {}
    local v1 = 0
    v1 = v1
    for n_1 = 0, #a4 - 1 do
        local v2 = a4[n_1 + 1]
        v1 = math.max(v1, #v2)
        for n_2 = 0, #v2 - 1 do
            if string.sub(v2, n_2 + 1, n_2 + 1) == "#" then
                table.insert(tbl_18, {x = n_2, y = n_1})
            end
        end
    end
    local tbl_19 = {}
    tbl_19.cells = tbl_18
    tbl_19.width = v1
    tbl_19.height = #a4
    tbl_19.colorIndex = a3
    tbl_19.earlyWeight = a1
    tbl_19.lateWeight = a2
    return tbl_19
end
local tbl_upv_20 = {
    buildPiece_1(2, 2.5, 2, tbl_2),
    buildPiece_1(8, 5, 4, tbl_3),
    buildPiece_1(8, 6, 5, tbl_4),
    buildPiece_1(6, 5, 6, tbl_5),
    buildPiece_1(3, 4, 0, tbl_6),
    buildPiece_1(8, 5, 4, tbl_7),
    buildPiece_1(8, 6, 5, tbl_8),
    buildPiece_1(6, 5, 6, tbl_9),
    buildPiece_1(3, 4, 0, tbl_10),
    buildPiece_1(8, 6, 3, tbl_11),
    buildPiece_1(3, 5, 2, tbl_12),
    buildPiece_1(5, 5, 2, tbl_13),
    buildPiece_1(5, 5, 2, tbl_14),
    buildPiece_1(1.5, 2.5, 1, tbl_15),
    buildPiece_1(1.5, 2.5, 1, tbl_16),
    buildPiece_1(1.5, 2.5, 1, tbl_17)
}
local tbl_21 = {"..#", "###"}
local tbl_22 = {".#", ".#", "##"}
local tbl_23 = {"#..", "###"}
local tbl_24 = {"##", "#.", "#."}
local tbl_25 = {"###", "..#"}
local tbl_26 = {"###", ".#."}
local tbl_27 = {".#", "##", ".#"}
local tbl_28 = {".#.", "###"}
local tbl_29 = {"#.", "##", "#."}
local tbl_30 = {".##", "##."}
local tbl_31 = {"#.", "##", ".#"}
local tbl_32 = {"##.", ".##"}
local tbl_33 = {".#", "##", "#."}
local tbl_34 = {"##", "#."}
local tbl_35 = {"##", ".#"}
local tbl_36 = {"#.", "##"}
tbl_upv_20[17] = buildPiece_1(1.5, 2.5, 1, tbl_21)
tbl_upv_20[18] = buildPiece_1(1.5, 2.5, 5, tbl_22)
tbl_upv_20[19] = buildPiece_1(1.5, 2.5, 5, tbl_23)
tbl_upv_20[20] = buildPiece_1(1.5, 2.5, 5, tbl_24)
tbl_upv_20[21] = buildPiece_1(1.5, 2.5, 5, tbl_25)
tbl_upv_20[22] = buildPiece_1(1.5, 2.5, 6, tbl_26)
tbl_upv_20[23] = buildPiece_1(1.5, 2.5, 6, tbl_27)
tbl_upv_20[24] = buildPiece_1(1.5, 2.5, 6, tbl_28)
tbl_upv_20[25] = buildPiece_1(1.5, 2.5, 6, tbl_29)
tbl_upv_20[26] = buildPiece_1(1, 3, 3, tbl_30)
tbl_upv_20[27] = buildPiece_1(1, 3, 3, tbl_31)
tbl_upv_20[28] = buildPiece_1(1, 3, 0, tbl_32)
tbl_upv_20[29] = buildPiece_1(1, 3, 0, tbl_33)
tbl_upv_20[30] = buildPiece_1(2, 2.5, 7, tbl_34)
tbl_upv_20[31] = buildPiece_1(2, 2.5, 7, tbl_35)
tbl_upv_20[32] = buildPiece_1(2, 2.5, 7, tbl_36)
local tbl_37 = {".#", "##"}
local tbl_38 = {"#..", "#..", "###"}
local tbl_39 = {"###", "#..", "#.."}
local tbl_40 = {"###", "..#", "..#"}
local tbl_41 = {"..#", "..#", "###"}
tbl_upv_20[33] = buildPiece_1(2, 2.5, 7, tbl_37)
tbl_upv_20[34] = buildPiece_1(0.5, 2.5, 4, tbl_38)
tbl_upv_20[35] = buildPiece_1(0.5, 2.5, 4, tbl_39)
tbl_upv_20[36] = buildPiece_1(0.5, 2.5, 4, tbl_40)
tbl_upv_20[37] = buildPiece_1(0.5, 2.5, 4, tbl_41)
local function countFilled_1(a1)
    --[[
      name: countFilled
      line: 91
    ]]
    local v3 = 0
    for _, value_1 in a1 do
        v3 = (value_1 and (v3 + 1)) or v3
    end
    return v3
end
local function canPlace_upv_1(a1, a2, a3, a4)
    --[[
      name: canPlace
      line: 101
      upvalues:
        tbl_upv_20 (copy, index: 1)
    ]]
    local v4 = tbl_upv_20[a2 + 1]
    if a3 >= 0 and a4 >= 0 and a3 + v4.width <= 8 and a4 + v4.height <= 8 then
        for _, value_2 in v4.cells do
            if not (a1[(((a4 + value_2.y) * 8) + (a3 + value_2.x)) + 1]) then
                continue
            end
            return false
        end
        return true
    end
    return false
end
local function anyPlacementFor_upv_1(a1, a2)
    --[[
      name: anyPlacementFor
      line: 114
      upvalues:
        canPlace_upv_1 (copy, index: 2)
    ]]
    for n_3 = 0, 8 do
        for n_4 = 0, 8 do
            local v5
            v5 = canPlace_upv_1(a1, a2, n_4, n_3)
            if not (v5) then
                continue
            end
            return true
        end
        local v5
    end
    return false
end
local tbl_upv_42 = {2, 1, 0}
local function emptyBoard_upv_1()
    --[[
      name: emptyBoard
      line: 72
    ]]
    local tbl_43 = {}
    local v6 = 0
    local v7 = false
    v7, v6 = v7, v6
    while true do
        if v7 then
            v6 = v6 + 1
        else
            v7 = true
        end
        if v6 >= 64 then
            break
        end
        table.insert(tbl_43, false)
    end
    return tbl_43
end
local tbl_44 = {}
tbl_44.cellIndex = function(a1, a2)
    --[[
      name: cellIndex
      line: 69
    ]]
    return (a2 * 8) + a1
end
tbl_44.emptyBoard = emptyBoard_upv_1
tbl_44.countFilled = countFilled_1
tbl_44.canPlace = canPlace_upv_1
tbl_44.anyPlacementFor = anyPlacementFor_upv_1
tbl_44.anyTrayPieceFits = function(a1, a2)
    --[[
      name: anyTrayPieceFits
      line: 126
      upvalues:
        anyPlacementFor_upv_1 (copy, index: 1)
    ]]
    for _, value_3 in a2 do
        if value_3 < 0 or not (anyPlacementFor_upv_1(a1, value_3)) then
            continue
        end
        return true
    end
    return false
end
tbl_44.comboMultiplier = function(a1)
    --[[
      name: comboMultiplier
      line: 135
    ]]
    return (math.min(1 + (0.5 * (a1 - 1)), 8))
end
tbl_44.placePiece = function(a1, a2, a3, a4, a5)
    --[[
      name: placePiece
      line: 145
      upvalues:
        tbl_upv_20 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v8 = tbl_upv_20[a2 + 1]
    local tbl_45 = {}
    local v9 = nil
    for _, v10 in v8.cells do
        v9 = (a4 + v10.y) * 8 + (a3 + v10.x)
        a1[v9 + 1] = true
        table.insert(tbl_45, v9)
    end
    local tbl_46 = {}
    local v10 = nil
    for n_5 = 0, 7 do
        v10 = true
        for n_6 = 0, 7 do
            if not (a1[((n_5 * 8) + n_6) + 1]) then
                v10 = false
                break
            end
        end
        if v10 then
            table.insert(tbl_46, n_5)
        end
    end
    local tbl_47 = {}
    for n_7 = 0, 7 do
        v9 = true
        for n_8 = 0, 7 do
            if not (a1[((n_8 * 8) + n_7) + 1]) then
                v9 = false
                break
            end
        end
        if v9 then
            table.insert(tbl_47, n_7)
        end
    end
    local tbl_48 = {}
    local tbl_49 = {}
    for _, value_4 in tbl_46 do
        for n_9 = 0, 7 do
            local v11
            v11 = value_4 * 8 + n_9
            if tbl_49[v11] == nil then
                tbl_49[v11] = true
                table.insert(tbl_48, v11)
            end
        end
    end
    for _, value_5 in tbl_47 do
        for n_10 = 0, 7 do
            local v12
            v12 = n_10 * 8 + value_5
            if tbl_49[v12] == nil then
                tbl_49[v12] = true
                table.insert(tbl_48, v12)
            end
        end
    end
    for v13, v14 in tbl_48 do
        a1[v14 + 1] = false
    end
    local v15 = #tbl_46 + #tbl_47
    v9 = ((v15 <= 0) and 0) or (a5 + 1)
    local v16 = #v8.cells
    if v15 > 0 then
        v16 = v16 + math.floor(tbl_upv_1[math.min(v15, #tbl_upv_1)] * math.min(1 + (0.5 * (v9 - 1)), 8))
    end
    local v13 = false
    if v15 > 0 then
        local v17 = 0
        for _, value_6 in a1 do
            v17 = (value_6 and (v17 + 1)) or v17
        end
        v13 = v17 == 0
    end
    local v14 = {}
    v14.cellsPlaced = #v8.cells
    v14.placedCells = tbl_45
    v14.rowsCleared = tbl_46
    v14.columnsCleared = tbl_47
    v14.clearedCells = tbl_48
    v14.linesCleared = v15
    v14.gained = v16
    v14.comboAfter = v9
    v14.boardCleared = v13
    return v14
end
tbl_44.bagRamp = function(a1)
    --[[
      name: bagRamp
      line: 225
    ]]
    if a1 > 10 then
        if a1 < 40 then
            return (a1 - 10) / 30
        end
        return 1
    end
    return 0
end
tbl_44.pieceWeight = function(a1, a2)
    --[[
      name: pieceWeight
      line: 234
      upvalues:
        tbl_upv_20 (copy, index: 1)
    ]]
    local v18 = tbl_upv_20[a1 + 1]
    return v18.earlyWeight + ((v18.lateWeight - v18.earlyWeight) * (((a2 <= 10) and 0) or (((a2 < 40) and ((a2 - 10) / 30)) or 1)))
end
tbl_44.pickPieceIndex = function(a1, a2)
    --[[
      name: pickPieceIndex
      line: 240
      upvalues:
        tbl_upv_20 (copy, index: 1)
    ]]
    local v19 = 0
    for n_11 = 0, #tbl_upv_20 - 1 do
        local v20 = tbl_upv_20[n_11 + 1]
        v19 = v19 + (v20.earlyWeight + ((v20.lateWeight - v20.earlyWeight) * (((a1 <= 10) and 0) or (((a1 < 40) and ((a1 - 10) / 30)) or 1))))
    end
    local v22 = a2 * v19
    for n_12 = 0, #tbl_upv_20 - 1 do
        local v23 = tbl_upv_20[n_12 + 1]
        local v24
        v24 = v22 - (v23.earlyWeight + ((v23.lateWeight - v23.earlyWeight) * (((a1 <= 10) and 0) or (((a1 < 40) and ((a1 - 10) / 30)) or 1))))
        if v24 >= 0 then
            v22 = v24
            continue
        end
        return n_12
    end
    return #tbl_upv_20 - 1
end
tbl_44.rescueTray = function(a1, a2, a3)
    --[[
      name: rescueTray
      line: 266
      upvalues:
        anyPlacementFor_upv_1 (copy, index: 1)
        tbl_upv_42 (copy, index: 2)
    ]]
    for _, value_7 in a2 do
        local v25
        if value_7 >= 0 then
            if anyPlacementFor_upv_1(a1, value_7) then
                v25 = true
            else
                continue
            end
        end
    end
    if v25 then
        return {}
    else
        local v26 = 0
        local v25
        v25 = v26
        local v27 = nil
        for _, value_8 in tbl_upv_42 do
            for v29 = 0, 9 do
                v25 = v25 + 1
                local v28 = a3(v25)
                v27 = anyPlacementFor_upv_1(a1, v28)
                if not (v27) then
                    continue
                end
                a2[value_8 + 1] = v28
                local tbl_50 = {}
                tbl_50.rerolls = v25
                return tbl_50
            end
        end
        a2[1] = 0
        local tbl_51 = {}
        tbl_51.rerolls = v25
        return tbl_51
    end
end
tbl_44.clearCenterBand = function(a1)
    --[[
      name: clearCenterBand
      line: 300
    ]]
    local tbl_52 = {}
    for n_13 = 0, 7 do
        local v29 = nil
        for n_14 = 0, 7 do
            if n_13 < 2 then
                v29 = false
                if n_14 >= 2 then
                    v29 = n_14 <= 5
                end
            else
                v29 = true
                if n_13 > 5 then
                    v29 = false
                    if n_14 >= 2 then
                        v29 = n_14 <= 5
                    end
                end
            end
            local v30
            if not (v29) then
                continue
            end
            v30 = n_13 * 8 + n_14
            if a1[v30 + 1] then
                a1[v30 + 1] = false
                table.insert(tbl_52, v30)
            end
        end
    end
    return tbl_52
end
tbl_44.boardToHex = function(a1)
    --[[
      name: boardToHex
      line: 318
    ]]
    local v31 = ""
    v31 = v31
    for n_15 = 0, 7 do
        local v32 = 0
        v32 = v32
        for n_16 = 0, 7 do
            v32 = ((a1[((n_15 * 8) + n_16) + 1]) and (v32 + 2 ^ n_16)) or v32
        end
        v31 = v31 .. string.format("%02X", v32)
    end
    return v31
end
tbl_44.boardFromHex = function(a1)
    --[[
      name: boardFromHex
      line: 332
      upvalues:
        emptyBoard_upv_1 (copy, index: 1)
    ]]
    if #a1 == 16 then
        local v33 = emptyBoard_upv_1()
        for n_17 = 0, 7 do
            local v34
            v34 = tonumber(string.sub(a1, (n_17 * 2) + 1, (n_17 * 2) + 2), 16)
            if v34 ~= nil then
                for n_18 = 0, 7 do
                    local v35
                    v35 = math.floor(v34 / (2 ^ n_18)) % 2 == 1
                    v33[((n_17 * 8) + n_18) + 1] = v35
                end
                continue
            else
                return nil
            end
        end
        return v33
    end
    return nil
end
tbl_44.LINE_BONUSES = tbl_upv_1
tbl_44.PIECES = tbl_upv_20
return tbl_44