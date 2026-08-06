-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TETRIS_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "tetris", "tetris-config").TETRIS_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "tetris", "tetris-pieces")
local PIECE_CELLS_upv_1 = v1.PIECE_CELLS
local refillBag_upv_1 = v1.refillBag
local refillFirstBag_upv_1 = v1.refillFirstBag
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "tetris", "tetris-scoring")
local advanceBackToBack_upv_1 = v2.advanceBackToBack
local clearAward_upv_1 = v2.clearAward
local comboAward_upv_1 = v2.comboAward
local perfectClearAward_upv_1 = v2.perfectClearAward
local TETRIS_SCORING_upv_1 = v2.TETRIS_SCORING
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim")
local chance_upv_1 = v3.chance
local jitteredDelay_upv_1 = v3.jitteredDelay
local jitterNormal_upv_1 = v3.jitterNormal
local SubStepper_upv_1 = v3.SubStepper
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local boardCols_upv_1 = TETRIS_CONFIG_upv_1.boardCols
local u1 = boardCols_upv_1 * TETRIS_CONFIG_upv_1.totalRows
local tbl_1 = {}
tbl_1.createTetrisBot = function(a1)
    --[[
      name: createTetrisBot
      line: 60
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        SubStepper_upv_1 (copy, index: 2)
        deriveSeed_upv_1 (copy, index: 3)
        refillFirstBag_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        refillBag_upv_1 (copy, index: 6)
        boardCols_upv_1 (copy, index: 7)
        TETRIS_CONFIG_upv_1 (copy, index: 8)
        PIECE_CELLS_upv_1 (copy, index: 9)
        jitterNormal_upv_1 (copy, index: 10)
        chance_upv_1 (copy, index: 11)
        jitteredDelay_upv_1 (copy, index: 12)
        advanceBackToBack_upv_1 (copy, index: 13)
        clearAward_upv_1 (copy, index: 14)
        comboAward_upv_1 (copy, index: 15)
        perfectClearAward_upv_1 (copy, index: 16)
        TETRIS_SCORING_upv_1 (copy, index: 17)
    ]]
    local random_upv_1 = a1.random
    local u2 = BOT_TUNING_upv_1.tetris[a1.difficulty]
    local u3 = SubStepper_upv_1.new(0.008333333333333333)
    local u4 = Random.new(deriveSeed_upv_1(a1.seed, 0))
    local tbl_upv_2 = {}
    refillFirstBag_upv_1(tbl_upv_2, u4)
    local u5 = table.create(u1, 0)
    local tbl_upv_3 = {}
    local u6 = false
    local u7 = 0
    local u8 = 0
    local u9 = 1
    local u10 = 0
    local u11 = 0
    local u12 = 0
    local u13 = 0
    local u14 = 4
    local u15 = 20
    local u16 = 0
    local u17 = 0
    local u18 = 0
    local u19 = 0
    local u20 = 0
    local function u21(a2, a3, a4)
        --[[
          line: 124
          upvalues:
            u5 (copy, index: 1)
            TETRIS_CONFIG_upv_1 (copy, index: 2)
            boardCols_upv_1 (copy, index: 3)
        ]]
        local v4 = table.clone(u5)
        local v8 = nil
        for n_1 = 0, 7, 2 do
            v8 = a4 + a2[n_1 + 2]
            if v8 < TETRIS_CONFIG_upv_1.totalRows then
                v4[(v8 * boardCols_upv_1 + (a3 + a2[n_1 + 1])) + 1] = 1
            end
        end
        local v7 = 0
        for n_2 = 0, TETRIS_CONFIG_upv_1.totalRows - 1 do
            v8 = true
            for n_3 = 0, boardCols_upv_1 - 1 do
                if v4[((n_2 * boardCols_upv_1) + n_3) + 1] == 0 then
                    v8 = false
                    break
                end
            end
            if v8 then
                v7 = v7 + 1
            end
        end
        local v9 = 0
        local v10 = 0
        local v11, v12 = v10, v9
        for n_4 = 0, boardCols_upv_1 - 1 do
            local v13 = false
            for n_5 = TETRIS_CONFIG_upv_1.totalRows - 1, 0, -1 do
                if v4[((n_5 * boardCols_upv_1) + n_4) + 1] == 0 then
                    v11 = (v13 and (v11 + 1)) or v11
                    continue
                end
                if not (v13) then
                    v13, v12 = true, v12 + (n_5 + 1)
                end
            end
        end
        return (((v7 * 9) - (v11 * 4)) - (v12 * 0.35)) - (a4 * 0.1)
    end
    local function u22(a5, a6, a7)
        --[[
          line: 103
          upvalues:
            boardCols_upv_1 (copy, index: 1)
            TETRIS_CONFIG_upv_1 (copy, index: 2)
            u5 (copy, index: 3)
        ]]
        for n_6 = 0, 7, 2 do
            local v14
            v14 = a6 + a5[n_6 + 1]
            local v15 = a7 + a5[n_6 + 2]
            if v14 >= 0 and boardCols_upv_1 > v14 and v15 >= 0 then
                if v15 >= TETRIS_CONFIG_upv_1.totalRows or u5[((v15 * boardCols_upv_1) + v14) + 1] == 0 then
                    continue
                end
                return false
            end
            return false
        end
        return true
    end
    local function u23()
        --[[
          line: 163
          upvalues:
            tbl_upv_3 (copy, index: 1)
            PIECE_CELLS_upv_1 (copy, index: 2)
            u12 (ref,  index: 3)
            boardCols_upv_1 (copy, index: 4)
            u22 (copy, index: 5)
            u21 (copy, index: 6)
            jitterNormal_upv_1 (copy, index: 7)
            random_upv_1 (copy, index: 8)
            u2 (copy, index: 9)
            chance_upv_1 (copy, index: 10)
            u16 (ref,  index: 11)
            jitteredDelay_upv_1 (copy, index: 12)
            u17 (ref,  index: 13)
        ]]
        table.clear(tbl_upv_3)
        local v16 = PIECE_CELLS_upv_1[u12 + 1]
        local v17 = 0
        local v18 = 4
        local v19 = -math.huge
        for n_7 = 0, #v16 - 1 do
            local v20 = v16[n_7 + 1]
            for n_8 = -2, boardCols_upv_1 - 1 do
                local v21
                v21 = u22(v20, n_8, 20)
                if not (v21) then
                    continue
                end
                local v22 = 20
                while u22(v20, n_8, v22 - 1) do
                    v22 = v22 - 1
                end
                v22 = u21(v20, n_8, v22) + jitterNormal_upv_1(random_upv_1, u2.heuristicNoise)
                if v19 < v22 then
                    v19, v17, v18 = v22, n_7, n_8
                end
            end
            local v21
        end
        local v23 = chance_upv_1(random_upv_1, u2.misdropChance)
        local v24, v25 = nil, nil
        if v23 then
            local v26 = nil
            if chance_upv_1(random_upv_1, 0.5) then
                local v27 = ((chance_upv_1(random_upv_1, 0.5)) and 1) or -1
                if u22(v16[v17 + 1], v18 + v27, 20) then
                    v24, v25 = v17, v18 + v27
                else
                    v25 = u22(v16[v17 + 1], v25 - v27, 20) and v25 - v27 or v25
                    v24 = v17
                end
            else
                local v28 = ((chance_upv_1(random_upv_1, 0.5)) and 1) or 3
                local v29 = (v17 + v28) % 4
                v26 = u22(v16[v29 + 1], v18, 20)
                if v26 then
                    v24, v25 = v29, v18
                else
                    v24, v25 = v17, v18
                end
            end
        else
            v24, v25 = v17, v18
        end
        if v24 ~= 3 then
            local v30 = 0
            local v31 = false
            v23 = v30
            while true do
                if v31 then
                    v23 = v23 + 1
                else
                    v31 = true
                end
                if v23 >= v24 then
                    break
                end
                table.insert(tbl_upv_3, 2)
                v25 = nil
            end
        else
            table.insert(tbl_upv_3, -2)
        end
        if v25 <= 4 then
            v23 = -1
        else
            v23 = 1
        end
        local v32 = 0
        local v28
        v28 = false
        while true do
            if v28 then
                v32 = v32 + 1
            else
                v28 = true
            end
            if v32 >= math.abs(v25 - 4) then
                break
            end
            table.insert(tbl_upv_3, v23)
        end
        u16 = jitteredDelay_upv_1(random_upv_1, u2.decisionSeconds, 0.25)
        u17 = 0
    end
    local function u24()
        --[[
          line: 241
          upvalues:
            u12 (ref,  index: 1)
            tbl_upv_2 (copy, index: 2)
            refillBag_upv_1 (copy, index: 3)
            u4 (copy, index: 4)
            u13 (ref,  index: 5)
            u14 (ref,  index: 6)
            u15 (ref,  index: 7)
            u18 (ref,  index: 8)
            u19 (ref,  index: 9)
            u20 (ref,  index: 10)
            u22 (copy, index: 11)
            PIECE_CELLS_upv_1 (copy, index: 12)
            u6 (ref,  index: 13)
            tbl_upv_3 (copy, index: 14)
            u23 (copy, index: 15)
        ]]
        if #tbl_upv_2 == 0 then
            refillBag_upv_1(tbl_upv_2, u4)
        end
        local v33 = #tbl_upv_2
        local v34 = tbl_upv_2[v33]
        tbl_upv_2[v33] = nil
        if v34 == nil then
            v34 = 0
        end
        u12 = v34
        u13 = 0
        u14 = 4
        u15 = 20
        u18 = 0
        u19 = 0
        u20 = 0
        if u22(PIECE_CELLS_upv_1[u12 + 1][1], u14, u15) then
            u23()
        else
            u6 = true
            table.clear(tbl_upv_3)
            return nil
        end
    end
    local function u25()
        --[[
          line: 257
          upvalues:
            PIECE_CELLS_upv_1 (copy, index: 1)
            u12 (ref,  index: 2)
            u13 (ref,  index: 3)
            u15 (ref,  index: 4)
            TETRIS_CONFIG_upv_1 (copy, index: 5)
            u5 (copy, index: 6)
            boardCols_upv_1 (copy, index: 7)
            u14 (ref,  index: 8)
            u6 (ref,  index: 9)
            tbl_upv_3 (copy, index: 10)
            u11 (ref,  index: 11)
            advanceBackToBack_upv_1 (copy, index: 12)
            u7 (ref,  index: 13)
            clearAward_upv_1 (copy, index: 14)
            u9 (ref,  index: 15)
            u10 (ref,  index: 16)
            comboAward_upv_1 (copy, index: 17)
            u1 (copy, index: 18)
            perfectClearAward_upv_1 (copy, index: 19)
            u8 (ref,  index: 20)
            u24 (copy, index: 21)
        ]]
        local v35 = PIECE_CELLS_upv_1[u12 + 1][u13 + 1]
        local v36 = true
        for n_9 = 0, 7, 2 do
            local v37
            v37 = u15 + v35[n_9 + 2]
            if v37 < TETRIS_CONFIG_upv_1.totalRows then
                u5[((v37 * boardCols_upv_1) + (u14 + v35[n_9 + 1])) + 1] = u12 + 1
            end
            if v37 < TETRIS_CONFIG_upv_1.visibleRows then
                v36 = false
            end
        end
        if v36 then
            u6 = true
            table.clear(tbl_upv_3)
            return nil
        else
            local v38 = 0
            local v39 = 0
            local v40, v41 = v38, v39
            local v42 = nil
            for n_10 = 0, TETRIS_CONFIG_upv_1.totalRows - 1 do
                v42 = true
                for n_11 = 0, boardCols_upv_1 - 1 do
                    if u5[((n_10 * boardCols_upv_1) + n_11) + 1] == 0 then
                        v42 = false
                        break
                    end
                end
                if v42 then
                    v40 = v40 + 1
                    continue
                end
                if v41 == n_10 then
                    v41 = v41 + 1
                    continue
                end
                for n_12 = 0, boardCols_upv_1 - 1 do
                    u5[((v41 * boardCols_upv_1) + n_12) + 1] = u5[((n_10 * boardCols_upv_1) + n_12) + 1]
                end
                v41 = v41 + 1
            end
            local v43, v44
            v43, v44 = false, v41
            if v43 then
                v44 = v44 + 1
            else
                v43 = true
            end
            while v44 < TETRIS_CONFIG_upv_1.totalRows do
                for n_13 = 0, boardCols_upv_1 - 1 do
                    u5[((v44 * boardCols_upv_1) + n_13) + 1] = 0
                end
                if v43 then
                    v44 = v44 + 1
                else
                    v43 = true
                end
            end
            if v40 <= 0 then
                u10 = 0
            else
                u11 = advanceBackToBack_upv_1(u11, v40, "none")
                u7 = u7 + (clearAward_upv_1(v40, "none", u11) * u9)
                u10 = u10 + 1
                u7 = u7 + (comboAward_upv_1(u10) * u9)
                v44 = true
                v43 = 0
                local v45 = false
                if v45 then
                    v43 = v43 + 1
                else
                    v45 = true
                end
                if v43 < u1 then
                    if u5[v43 + 1] == 0 then
                        if v45 then
                            v43 = v43 + 1
                        else
                            v45 = true
                        end
                        continue
                    else
                        v44 = false
                    end
                end
                if v44 then
                    u7 = u7 + (perfectClearAward_upv_1(v40, u11) * u9)
                end
                u8 = u8 + v40
                u9 = math.min(math.floor(u8 / TETRIS_CONFIG_upv_1.linesPerLevel) + 1, TETRIS_CONFIG_upv_1.maxLevel)
            end
            u24()
        end
    end
    local function u26()
        --[[
          line: 351
          upvalues:
            PIECE_CELLS_upv_1 (copy, index: 1)
            u12 (ref,  index: 2)
            u13 (ref,  index: 3)
            u22 (copy, index: 4)
            u14 (ref,  index: 5)
            u15 (ref,  index: 6)
            u7 (ref,  index: 7)
            TETRIS_SCORING_upv_1 (copy, index: 8)
            u25 (copy, index: 9)
        ]]
        local v46 = PIECE_CELLS_upv_1[u12 + 1][u13 + 1]
        local v47 = 0
        while (u22(v46, u14, u15 - 1)) do
            u15 = u15 - 1
            v47 = v47 + 1
        end
        u7 = u7 + (TETRIS_SCORING_upv_1.hardDropPerCell * v47)
        u25()
    end
    local function u27()
        --[[
          line: 361
          upvalues:
            tbl_upv_3 (copy, index: 1)
            u13 (ref,  index: 2)
            u22 (copy, index: 3)
            PIECE_CELLS_upv_1 (copy, index: 4)
            u12 (ref,  index: 5)
            u14 (ref,  index: 6)
            u15 (ref,  index: 7)
            u20 (ref,  index: 8)
            TETRIS_CONFIG_upv_1 (copy, index: 9)
            u19 (ref,  index: 10)
        ]]
        local v48 = table.remove(tbl_upv_3, 1)
        local v49 = nil
        if v48 ~= nil then
            local v50 = false
            if v48 == 2 then
                local v51 = (u13 + (((v48 ~= 2) and 3) or 1)) % 4
                v49 = u22(PIECE_CELLS_upv_1[u12 + 1][v51 + 1], u14, u15)
                if v49 then
                    u13 = v51
                    v50 = true
                end
            else
                local v52 = nil
                if v48 ~= -2 then
                    v52 = u22(PIECE_CELLS_upv_1[u12 + 1][u13 + 1], u14 + v48, u15)
                    if v52 then
                        u14 = u14 + v48
                        v50 = true
                    end
                else
                    local v51 = (u13 + (((v48 ~= 2) and 3) or 1)) % 4
                    v49 = u22(PIECE_CELLS_upv_1[u12 + 1][v51 + 1], u14, u15)
                    if v49 then
                        u13 = v51
                        v50 = true
                    end
                end
            end
            if v50 and not (u22(PIECE_CELLS_upv_1[u12 + 1][u13 + 1], u14, u15 - 1)) and u20 < TETRIS_CONFIG_upv_1.maxLockResets then
                u19 = 0
                u20 = u20 + 1
            end
        else
            return nil
        end
    end
    local function u28(a8)
        --[[
          line: 386
          upvalues:
            u6 (ref,  index: 1)
            u16 (ref,  index: 2)
            tbl_upv_3 (copy, index: 3)
            u17 (ref,  index: 4)
            u27 (copy, index: 5)
            u2 (copy, index: 6)
            u26 (copy, index: 7)
            TETRIS_CONFIG_upv_1 (copy, index: 8)
            u9 (ref,  index: 9)
            u18 (ref,  index: 10)
            PIECE_CELLS_upv_1 (copy, index: 11)
            u12 (ref,  index: 12)
            u13 (ref,  index: 13)
            u22 (copy, index: 14)
            u14 (ref,  index: 15)
            u15 (ref,  index: 16)
            u19 (ref,  index: 17)
            u25 (copy, index: 18)
        ]]
        if u6 then
            return nil
        else
            if u16 <= 0 then
                if #tbl_upv_3 <= 0 then
                    u26()
                    return nil
                end
                u17 = u17 - a8
                if u17 <= 0 then
                    u27()
                    u17 = u17 + (1 / u2.inputsPerSecond)
                end
            else
                u16 = math.max(u16 - a8, 0)
            end
            u18 = u18 + (a8 / TETRIS_CONFIG_upv_1.gravitySecondsPerRow[math.min(u9, TETRIS_CONFIG_upv_1.maxLevel)])
            local v53 = PIECE_CELLS_upv_1[u12 + 1][u13 + 1]
            while u18 >= 1 do
                u18 = u18 - 1
                if u22(v53, u14, u15 - 1) then
                    u15 = u15 - 1
                    continue
                else
                    u18 = 0
                    break
                end
            end
            if u22(v53, u14, u15 - 1) then
                u19 = 0
            else
                u19 = u19 + a8
                if TETRIS_CONFIG_upv_1.lockDelaySeconds <= u19 then
                    u25()
                    return
                end
            end
        end
    end
    u24()
    local tbl_4 = {}
    tbl_4.step = function(a9, a10)
        --[[
          name: step
          line: 428
          upvalues:
            u6 (ref,  index: 1)
            u3 (copy, index: 2)
            u28 (copy, index: 3)
        ]]
        if u6 then
            return nil
        end
        u3:step(a10, u28)
    end
    tbl_4.snapshot = function(a11)
        --[[
          name: snapshot
          line: 434
          upvalues:
            TETRIS_CONFIG_upv_1 (copy, index: 1)
            boardCols_upv_1 (copy, index: 2)
            u5 (copy, index: 3)
            u6 (ref,  index: 4)
            u12 (ref,  index: 5)
            PIECE_CELLS_upv_1 (copy, index: 6)
            u13 (ref,  index: 7)
            u14 (ref,  index: 8)
            u15 (ref,  index: 9)
            u7 (ref,  index: 10)
        ]]
        local tbl_5 = {}
        for n_14 = 0, TETRIS_CONFIG_upv_1.visibleRows - 1 do
            for n_15 = 0, boardCols_upv_1 - 1 do
                table.insert(tbl_5, (string.format("%X", math.clamp(u5[((n_14 * boardCols_upv_1) + n_15) + 1], 0, 15))))
            end
        end
        local tbl_6 = {}
        if not (u6) then
            table.insert(tbl_6, u12)
            local v54 = PIECE_CELLS_upv_1[u12 + 1][u13 + 1]
            table.insert(tbl_6, u14 + v54[1])
            table.insert(tbl_6, u15 + v54[2])
            table.insert(tbl_6, u14 + v54[3])
            table.insert(tbl_6, u15 + v54[4])
            table.insert(tbl_6, u14 + v54[5])
            table.insert(tbl_6, u15 + v54[6])
            table.insert(tbl_6, u14 + v54[7])
            table.insert(tbl_6, u15 + v54[8])
        end
        local tbl_7 = {}
        tbl_7.score = u7
        tbl_7.values = tbl_6
        tbl_7.board = table.concat(tbl_5, "")
        return tbl_7
    end
    tbl_4.isDead = function(a12)
        --[[
          name: isDead
          line: 462
          upvalues:
            u6 (ref, index: 1)
        ]]
        return u6
    end
    tbl_4.score = function(a13)
        --[[
          name: score
          line: 465
          upvalues:
            u7 (ref, index: 1)
        ]]
        return u7
    end
    return tbl_4
end
return tbl_1