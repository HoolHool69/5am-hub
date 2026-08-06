-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "merge-grid")
local applyMove_upv_1 = v1.applyMove
local createBoard_upv_1 = v1.createBoard
local hasMoves_upv_1 = v1.hasMoves
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local chance_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-sim").chance
local BOT_TUNING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "bot-tuning").BOT_TUNING
local tbl_upv_1 = {"up", "down", "left", "right"}
local tbl_upv_2 = {"down", "left", "right", "up"}
local tbl_upv_3 = {0, 1, 2, 3, 7, 6, 5, 4, 8, 9, 10, 11, 15, 14, 13, 12}
local function evaluateBoard_upv_1(a1)
    --[[
      name: evaluateBoard
      line: 30
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local v2 = 0
    local v3 = 0
    for n_1 = 0, 15 do
        local v4
        v4 = a1.tiles[n_1]
        if v4 ~= nil then
            v2 = v2 + v4.value * tbl_upv_3[n_1 + 1]
        else
            v3 = v3 + 1
        end
    end
    return v2 + (v3 * 256)
end
local function searchValue_upv_1(a1, a2, a3)
    --[[
      name: searchValue
      line: 52
      upvalues:
        evaluateBoard_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        applyMove_upv_1 (copy, index: 3)
        searchValue_upv_1 (copy, index: 4)
    ]]
    if a2 > 0 then
        local v5 = -math.huge
        local v6 = nil
        local v7 = nil
        local v8 = nil
        for _, value_1 in tbl_upv_1 do
            v6 = a3:Clone()
            v8 = applyMove_upv_1(a1, value_1, v6)
            if not (v8.changed) then
                continue
            end
            v7 = v8.scoreDelta * 2 + searchValue_upv_1(v8.board, a2 - 1, v6)
            if v5 < v7 then
                v5 = v7
            end
        end
        if v5 ~= -math.huge then
            return v5
        end
        return evaluateBoard_upv_1(a1) - 1e+05
    end
    return (evaluateBoard_upv_1(a1))
end
local tbl_4 = {}
tbl_4.createGame2048Bot = function(a1)
    --[[
      name: createGame2048Bot
      line: 82
      upvalues:
        BOT_TUNING_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        createBoard_upv_1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
        applyMove_upv_1 (copy, index: 5)
        tbl_upv_2 (copy, index: 6)
        searchValue_upv_1 (copy, index: 7)
        chance_upv_1 (copy, index: 8)
        hasMoves_upv_1 (copy, index: 9)
    ]]
    local random_upv_1 = a1.random
    local u1 = BOT_TUNING_upv_1["2048"][a1.difficulty]
    local u2 = deriveRandom_upv_1(a1.seed, 0)
    local board_upv_1 = createBoard_upv_1(u2)
    local u3 = 0
    local u4 = false
    local u5 = u1.moveInterval * random_upv_1:NextNumber(0.75, 1.35)
    local function u6()
        --[[
          line: 95
          upvalues:
            tbl_upv_1 (copy, index: 1)
            random_upv_1 (copy, index: 2)
            applyMove_upv_1 (copy, index: 3)
            board_upv_1 (ref,  index: 4)
            u2 (copy, index: 5)
            u3 (ref,  index: 6)
        ]]
        local tbl_5 = {}
        table.move(tbl_upv_1, 1, #tbl_upv_1, #tbl_5 + 1, tbl_5)
        for n_2 = #tbl_5 - 1, 1, -1 do
            local v9 = random_upv_1:NextInteger(0, n_2)
            local v10 = tbl_5[n_2 + 1]
            tbl_5[n_2 + 1] = tbl_5[v9 + 1]
            tbl_5[v9 + 1] = v10
        end
        local v11 = nil
        for _, value_2 in tbl_5 do
            v11 = applyMove_upv_1(board_upv_1, value_2, u2)
            if not (v11.changed) then
                continue
            end
            board_upv_1 = v11.board
            u3 = u3 + v11.scoreDelta
            return true
        end
        return false
    end
    local function u7()
        --[[
          line: 116
          upvalues:
            tbl_upv_2 (copy, index: 1)
            u2 (copy, index: 2)
            applyMove_upv_1 (copy, index: 3)
            board_upv_1 (ref,  index: 4)
            random_upv_1 (copy, index: 5)
            searchValue_upv_1 (copy, index: 6)
            u1 (copy, index: 7)
        ]]
        local v12 = nil
        local v13 = -math.huge
        for n_3 = 0, #tbl_upv_2 - 1 do
            local v14 = tbl_upv_2[n_3 + 1]
            local v15 = u2:Clone()
            local v16
            v16 = applyMove_upv_1(board_upv_1, v14, v15)
            local v17
            if not (v16.changed) then
                continue
            end
            local v18 = (#tbl_upv_2 - n_3) * 0.001 + random_upv_1:NextNumber() * 1e-04
            v17 = (v16.scoreDelta * 2) + searchValue_upv_1(v16.board, u1.searchDepth, v15) + v18
            if v13 < v17 then
                v13, v12 = v17, v14
            end
        end
        return v12
    end
    local tbl_6 = {}
    tbl_6.step = function(a2, a3)
        --[[
          name: step
          line: 150
          upvalues:
            u4 (ref,  index: 1)
            u5 (ref,  index: 2)
            u1 (copy, index: 3)
            random_upv_1 (copy, index: 4)
            chance_upv_1 (copy, index: 5)
            u6 (copy, index: 6)
            u7 (copy, index: 7)
            applyMove_upv_1 (copy, index: 8)
            board_upv_1 (ref,  index: 9)
            u2 (copy, index: 10)
            u3 (ref,  index: 11)
            hasMoves_upv_1 (copy, index: 12)
        ]]
        if u4 then
            return nil
        else
            u5 = u5 - a3
            local v19 = 0
            v19 = nil
            while u5 <= 0 and not u4 do
                local v20, v21 = nil, nil
                if v19 >= 4 then
                    break
                end
                local v22 = v19 + 1
                u5 = u5 + (u1.moveInterval * random_upv_1:NextNumber(0.75, 1.35))
                if chance_upv_1(random_upv_1, u1.randomMoveChance) then
                    u6()
                else
                    v21 = u7()
                    if v21 ~= nil then
                        local v23 = applyMove_upv_1(board_upv_1, v21, u2)
                        board_upv_1 = v23.board
                        u3 = u3 + v23.scoreDelta
                    end
                end
                v20 = hasMoves_upv_1(board_upv_1)
                if not (v20) then
                    u4 = true
                end
                v19 = v22
            end
        end
    end
    tbl_6.snapshot = function(a4)
        --[[
          name: snapshot
          line: 165
          upvalues:
            board_upv_1 (ref, index: 1)
            u3 (ref, index: 2)
        ]]
        local v24 = ""
        local tbl_7 = {}
        local v25 = nil
        for n_4 = 0, 15 do
            local v26 = board_upv_1.tiles[n_4]
            local v27 = ((v26 == nil) and 0) or (math.clamp(math.floor(math.log(v26.value, 2) + 0.5), 1, 15))
            v24 = v24 .. string.format("%X", v27)
            local v28
            if v26 == nil then
                v28 = v26
            else
                v28 = v26.id
            end
            if v28 ~= nil then
                v25 = v28
            else
                v25 = 0
            end
            table.insert(tbl_7, v25)
        end
        local tbl_8 = {}
        tbl_8.score = u3
        tbl_8.values = tbl_7
        tbl_8.board = v24
        return tbl_8
    end
    tbl_6.isDead = function(a5)
        --[[
          name: isDead
          line: 190
          upvalues:
            u4 (ref, index: 1)
        ]]
        return u4
    end
    tbl_6.score = function(a6)
        --[[
          name: score
          line: 193
          upvalues:
            u3 (ref, index: 1)
        ]]
        return u3
    end
    return tbl_6
end
return tbl_4