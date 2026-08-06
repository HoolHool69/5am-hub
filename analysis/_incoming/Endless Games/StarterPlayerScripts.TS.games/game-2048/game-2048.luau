-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "merge-grid")
local applyMove_upv_1 = v1.applyMove
local createBoard_upv_1 = v1.createBoard
local hasMoves_upv_1 = v1.hasMoves
local keepTopTiles_upv_1 = v1.keepTopTiles
local SLOT_COUNT_upv_1 = v1.SLOT_COUNT
local v2 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local deriveRandom_upv_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local board2048Atom_upv_1 = RuntimeLib_upv_1.import(script, script.Parent, "board-atom").board2048Atom
local tbl_upv_1 = {}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 28
    ]]
    return "Game2048"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 33
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 37
    ]]
    a1.context = a2
    a1.score = 0
    a1.locked = false
    a1.ended = false
    a1.moveSeq = 0
    a1.round = 0
    a1.milestonesReached = {}
    a1.random = Random.new()
end
u1.init = function(a1)
    --[[
      name: init
      line: 47
      upvalues:
        board2048Atom_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        createBoard_upv_1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
        RuntimeLib_upv_1 (copy, index: 5)
    ]]
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a2)
                --[[
                  line: 48
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a2)
            end
        )
    )
    a1.context.janitor:Add(
        function()
            --[[
              line: 51
              upvalues:
                board2048Atom_upv_1 (copy, index: 1)
            ]]
            return board2048Atom_upv_1(
                function()
                    --[[
                      line: 52
                    ]]
                    return nil
                end
            )
        end
    )
    a1.random = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.board = createBoard_upv_1(a1.random)
    a1:publish(tbl_upv_1)
    return RuntimeLib_upv_1.Promise.resolve()
end
u1.start = function(a1)
    --[[
      name: start
      line: 63
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        createBoard_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
    ]]
    a1.random = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.board = createBoard_upv_1(a1.random)
    a1.score = 0
    a1.locked = false
    a1.pendingDirection = nil
    a1.ended = false
    a1.round = a1.round + 1
    a1.milestonesReached = {}
    a1:publish(tbl_upv_1)
    a1.context.reportScore(0)
end
u1.snapshot = function(a1)
    --[[
      name: snapshot
      line: 75
    ]]
    local v4 = ""
    local tbl_4 = {}
    local v5 = nil
    for n_1 = 0, 15 do
        local v6 = a1.board.tiles[n_1]
        local v7 = ((v6 == nil) and 0) or (math.clamp(math.floor(math.log(v6.value, 2) + 0.5), 1, 15))
        v4 = v4 .. string.format("%X", v7)
        local v8
        if v6 == nil then
            v8 = v6
        else
            v8 = v6.id
        end
        if v8 ~= nil then
            v5 = v8
        else
            v5 = 0
        end
        table.insert(tbl_4, v5)
    end
    local tbl_5 = {}
    tbl_5.score = a1.score
    tbl_5.values = tbl_4
    tbl_5.board = v4
    return tbl_5
end
u1.captureResume = function(a1)
    --[[
      name: captureResume
      line: 100
      upvalues:
        SLOT_COUNT_upv_1 (copy, index: 1)
        writeResume_upv_1 (copy, index: 2)
    ]]
    if a1.ended then
        return nil
    else
        local u2 = ""
        local tbl_6 = {}
        local v9 = 0
        u2 = false
        local v10, u3
        v10, u3 = nil, tbl_6
        local v11 = nil
        if v10 then
            v9 = v9 + 1
        else
            v10 = true
        end
        if v9 < SLOT_COUNT_upv_1 then
            local v12 = a1.board.tiles[v9]
            local v13 = ((v12 == nil) and 0) or (math.clamp(math.floor(math.log(v12.value, 2) + 0.5), 1, 15))
            u2 = u2 .. string.format("%X", v13)
            local v14
            if v12 == nil then
                v14 = v12
            else
                v14 = v12.id
            end
            if v14 ~= nil then
                v11 = v14
            else
                v11 = 0
            end
            table.insert(tbl_6, v11)
            if v10 then
                v9 = v9 + 1
            else
                v10 = true
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 134
                  upvalues:
                    a1 (copy, index: 1)
                    u2 (ref,  index: 2)
                    u3 (copy, index: 3)
                ]]
                a2:int(a1.score):int(a1.board.nextId):str(u2)
                for _, value_1 in u3 do
                    a2:int(value_1)
                end
                local v16 = 0
                for _ in a1.milestonesReached do
                    v16 = v16 + 1
                end
                a2:int(v16)
                for key_1 in a1.milestonesReached do
                    a2:int(key_1)
                end
            end
        )
    end
end
u1.restoreResume = function(a1, a2)
    --[[
      name: restoreResume
      line: 152
      upvalues:
        readResume_upv_1 (copy, index: 1)
        SLOT_COUNT_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
    ]]
    local v17 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 153
              upvalues:
                SLOT_COUNT_upv_1 (copy, index: 1)
            ]]
            local tbl_7 = {}
            tbl_7.score = a3:int()
            tbl_7.nextId = a3:int()
            tbl_7.cells = a3:str()
            if #tbl_7.cells ~= SLOT_COUNT_upv_1 then
                error("2048: board size mismatch")
            end
            local tbl_8 = {}
            local v18 = 0
            local tbl_9 = false
            while true do
                if tbl_9 then
                    v18 = v18 + 1
                else
                    tbl_9 = true
                end
                if v18 >= SLOT_COUNT_upv_1 then
                    break
                end
                table.insert(tbl_8, (a3:int()))
            end
            v18 = a3:int()
            tbl_9 = {}
            local v19 = 0
            local v20 = false
            v20, v19 = v20, v19
            while true do
                if v20 then
                    v19 = v19 + 1
                else
                    v20 = true
                end
                if v19 >= v18 then
                    break
                end
                table.insert(tbl_9, (a3:int()))
            end
            v19 = table.clone(tbl_7)
            setmetatable(v19, nil)
            v19.ids = tbl_8
            v19.milestones = tbl_9
            return v19
        end
    )
    if v17 ~= nil then
        local tbl_10 = {}
        local v21 = 0
        local v22 = 0
        local v23 = false
        local v24, v25 = nil, nil
        if v23 then
            v22 = v22 + 1
        else
            v23 = true
        end
        while v22 < SLOT_COUNT_upv_1 do
            v24 = tonumber(string.sub(v17.cells, v22 + 1, v22 + 1), 16)
            if v24 == nil then
                v24 = 0
            end
            if v24 > 0 then
                v25 = v17.ids[v22 + 1]
                if v25 == nil then
                    v25 = v22 + 1
                end
                v21 = math.max(v21, v25)
                tbl_10[v22] = {id = v25, value = 2 ^ v24}
            end
            if v23 then
                v22 = v22 + 1
            else
                v23 = true
            end
        end
        if next(tbl_10) ~= nil then
            a1.board = {tiles = tbl_10, nextId = math.max(v17.nextId, v21 + 1)}
            a1.score = a2.score
            a1.locked = false
            a1.pendingDirection = nil
            a1.ended = false
            a1.round = a1.round + 1
            a1.milestonesReached = {}
            for _, value_2 in v17.milestones do
                a1.milestonesReached[value_2] = true
            end
            a1.random = deriveRandom_upv_1(a1.context.getRunSeed(), a1.board.nextId + 1)
            a1:publish(tbl_upv_1)
            a1.context.reportScore(a1.score)
            return true
        end
    end
    return false
end
u1.resumeStart = function(a1)
    --[[
      name: resumeStart
      line: 269
    ]]
end
u1.revive = function(a1)
    --[[
      name: revive
      line: 271
      upvalues:
        keepTopTiles_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.board = keepTopTiles_upv_1(a1.board, 4)
    a1.locked = false
    a1.pendingDirection = nil
    a1.ended = false
    a1:publish(tbl_upv_1)
end
u1.destroy = function(a1)
    --[[
      name: destroy
      line: 278
    ]]
    a1.ended = true
end
u1.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 281
    ]]
    if a1.ended then
        return nil
    end
    if a1.locked then
        a1.pendingDirection = a2
        return nil
    end
    a1:applyDirection(a2)
end
u1.applyDirection = function(a1, a2)
    --[[
      name: applyDirection
      line: 291
      upvalues:
        applyMove_upv_1 (copy, index: 1)
        hasMoves_upv_1 (copy, index: 2)
    ]]
    local v26 = applyMove_upv_1(a1.board, a2, a1.random)
    local v27 = nil
    if v26.changed then
        a1.board = v26.board
        a1.score = a1.score + v26.scoreDelta
        a1.context.reportScore(a1.score)
        local v28 = nil
        for _, value_3 in v26.merges do
            v28 = value_3.newValue >= 2048
            if v28 then
                v28 = a1.milestonesReached[value_3.newValue] == nil
            end
            if v28 then
                a1.milestonesReached[value_3.newValue] = true
                a1.pendingMilestone = value_3.newValue
                a1.context.audio.play("newBestFanfare", {})
            end
        end
        a1:publish(v26.merges)
        v27 = #v26.merges
        if v27 <= 0 then
            a1.context.audio.play("uiTap", {})
        else
            a1.context.audio.play("pop", {pitch = math.clamp((v27 * 0.12) + 0.95, 0.95, 1.5)})
            if v27 >= 2 then
                a1.context.audio.play("coinSettle", {pitch = math.min((v27 * 0.1) + 1, 1.4)})
            end
        end
        a1.locked = true
        task.delay(
            0.12,
            function()
                --[[
                  line: 345
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.locked = false
                local pendingDirection_1 = a1.pendingDirection
                a1.pendingDirection = nil
                if pendingDirection_1 == nil or (a1.ended) then
                    return
                end
                a1:applyDirection(pendingDirection_1)
            end
        )
        if not (hasMoves_upv_1(a1.board)) then
            a1.ended = true
            a1.context.endRun(a1.score)
        end
    else
        a1.context.audio.play("thud", {})
        return nil
    end
end
u1.publish = function(a1, a2)
    --[[
      name: publish
      line: 360
      upvalues:
        board2048Atom_upv_1 (copy, index: 1)
    ]]
    local tbl_upv_11 = {}
    for u4, value_4 in a1.board.tiles do
        table.insert(tbl_upv_11, {id = value_4.id, value = value_4.value, index = u4})
    end
    table.sort(
        tbl_upv_11,
        function(a3, a4)
            --[[
              line: 371
            ]]
            return a3.id < a4.id
        end
    )
    local tbl_upv_12 = {}
    for v29, u5 in a2 do
        table.insert(tbl_upv_12, {at = u5.at, value = u5.newValue})
    end
    a1.moveSeq = a1.moveSeq + 1
    local score_upv_1 = a1.score
    local moveSeq_upv_1 = a1.moveSeq
    local u4 = a1.round
    local v29 = a1.pendingMilestone
    a1.pendingMilestone = nil
    local u5
    if v29 == nil then
        u5 = nil
    else
        local tbl_13 = {}
        tbl_13.value = v29
        tbl_13.seq = moveSeq_upv_1
        u5 = tbl_13
    end
    board2048Atom_upv_1(
        function()
            --[[
              line: 392
              upvalues:
                tbl_upv_11 (copy, index: 1)
                score_upv_1 (copy, index: 2)
                moveSeq_upv_1 (copy, index: 3)
                tbl_upv_12 (copy, index: 4)
                u4 (copy, index: 5)
                u5 (copy, index: 6)
            ]]
            local tbl_14 = {}
            tbl_14.tiles = tbl_upv_11
            tbl_14.score = score_upv_1
            tbl_14.moveSeq = moveSeq_upv_1
            tbl_14.merges = tbl_upv_12
            tbl_14.round = u4
            tbl_14.milestone = u5
            return tbl_14
        end
    )
end
local tbl_15 = {}
tbl_15.Game2048 = u1
return tbl_15