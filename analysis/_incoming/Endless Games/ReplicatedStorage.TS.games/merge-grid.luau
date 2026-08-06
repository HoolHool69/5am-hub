-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function largestTileIndex(a1)
    --[[
      name: largestTileIndex
      line: 259
    ]]
    local v1 = -1
    local v2 = -1
    v1 = v1
    for key_1, value_1 in a1 do
        if v2 < value_1.value then
            v2, v1 = value_1.value, key_1
        end
    end
    return v1
end
local function spawnTile(a1, a2)
    --[[
      name: spawnTile
      line: 270
    ]]
    local tbl_1 = {}
    local v3 = 0
    local v4 = false
    v4, v3 = v4, v3
    if v4 then
        v3 = v3 + 1
    else
        v4 = true
    end
    if v3 < 16 then
        if a1.tiles[v3] == nil then
            table.insert(tbl_1, v3)
        end
        if v4 then
            v3 = v3 + 1
        else
            v4 = true
        end
        --[[ goto label_3 ]]--
    end
    if #tbl_1 ~= 0 then
        v3 = tbl_1[a2:NextInteger(1, #tbl_1)]
        v4 = ((a2:NextNumber() >= 0.1) and 2) or 4
        local tbl_2 = {}
        for key_2, value_2 in a1.tiles do
            tbl_2[key_2] = value_2
        end
        tbl_2[v3] = {id = a1.nextId, value = v4}
        local tbl_3 = {}
        tbl_3.tiles = tbl_2
        tbl_3.nextId = a1.nextId + 1
        return tbl_3
    end
    return a1
end
local function findSpawn(a1, a2)
    --[[
      name: findSpawn
      line: 311
    ]]
    local tbl_4 = nil
    for key_3, value_3 in a2.tiles do
        if a1.tiles[key_3] ~= nil then
            continue
        end
        tbl_4 = {}
        tbl_4.id = value_3.id
        tbl_4.value = value_3.value
        tbl_4.at = key_3
        return tbl_4
    end
    return nil
end
local function lineIndices(a1, a2)
    --[[
      name: lineIndices
      line: 324
    ]]
    local tbl_5 = {}
    for n_1 = 0, 3 do
        if a1 == "left" then
            table.insert(tbl_5, (a2 * 4) + n_1)
            continue
        end
        if a1 == "right" then
            table.insert(tbl_5, (a2 * 4) + (3 - n_1))
            continue
        end
        if a1 ~= "up" then
            table.insert(tbl_5, ((3 - n_1) * 4) + a2)
        else
            table.insert(tbl_5, (n_1 * 4) + a2)
        end
    end
    return tbl_5
end
local tbl_6 = {}
tbl_6.createBoard = function(a1)
    --[[
      name: createBoard
      line: 13
      upvalues:
        spawnTile (ref, index: 1)
    ]]
    return (spawnTile(spawnTile({tiles = {}}, a1), a1))
end
tbl_6.applyMove = function(a1, a2, a3)
    --[[
      name: applyMove
      line: 23
      upvalues:
        lineIndices (ref, index: 1)
        spawnTile (ref, index: 2)
        findSpawn (ref, index: 3)
    ]]
    local tbl_7 = {}
    local tbl_8 = {}
    local tbl_9 = {}
    local v5 = 0
    local v6 = false
    for n_2 = 0, 3 do
        local v7 = lineIndices(a2, n_2)
        local tbl_10 = {}
        local v8 = nil
        for v9, v10 in v7 do
            local v11
            v11 = a1.tiles[v10]
            if v11 == nil then
                continue
            end
            v8 = tbl_10[#tbl_10]
            if v8 == nil or v8.merged or v8.data.value ~= v11.value then
                table.insert(tbl_10, {data = v11, fromIndex = v10})
            else
                v8.merged = true
                v8.removed = {id = v11.id, fromIndex = v10}
                v8.data = {id = v8.data.id, value = v11.value * 2}
            end
        end
        for n_3 = 0, #tbl_10 - 1 do
            local v9
            v9 = v7[n_3 + 1]
            local v10
            v10 = tbl_10[n_3 + 1]
            tbl_7[v9] = v10.data
            if v10.fromIndex ~= v9 then
                table.insert(tbl_8, {id = v10.data.id, from = v10.fromIndex, to = v9})
                v6 = true
            end
            if (v10.merged) and v10.removed ~= nil then
                table.insert(tbl_9, {intoId = v10.data.id, removedId = v10.removed.id, newValue = v10.data.value, at = v9})
                table.insert(tbl_8, {id = v10.removed.id, from = v10.removed.fromIndex, to = v9})
                v5 = v5 + v10.data.value
                v6 = true
            end
        end
        local v11
    end
    if v6 then
        local tbl_11 = {}
        tbl_11.tiles = tbl_7
        tbl_11.nextId = a1.nextId
        local v12 = spawnTile(tbl_11, a3)
        local tbl_12 = {}
        tbl_12.board = v12
        tbl_12.moves = tbl_8
        tbl_12.merges = tbl_9
        tbl_12.spawned = findSpawn(tbl_11, v12)
        tbl_12.scoreDelta = v5
        return tbl_12
    else
        local tbl_13 = {}
        tbl_13.board = a1
        tbl_13.moves = {}
        tbl_13.merges = {}
        return tbl_13
    end
end
tbl_6.hasMoves = function(a1)
    --[[
      name: hasMoves
      line: 115
    ]]
    local v13 = 0
    local v14 = false
    v14, v13 = v14, v13
    if v14 then
        v13 = v13 + 1
    else
        v14 = true
    end
    if v13 >= 16 then
        for n_4 = 0, 3 do
            local v15, v16, v17, v18 = nil, nil, nil, nil
            for n_5 = 0, 3 do
                local v19
                v19 = n_4 * 4 + n_5
                local v20
                v20 = a1.tiles[v19]
                if v20 == nil then
                    continue
                end
                v16 = n_5 + 1 < 4
                if v16 then
                    v15 = a1.tiles[v19 + 1]
                    if v15 ~= nil then
                        v15 = v15.value
                    end
                    if v15 == v20.value then
                        v16 = true
                    else
                        v16 = false
                    end
                end
                if not v16 then
                    v18 = n_4 + 1 < 4
                    if v18 then
                        v17 = a1.tiles[v19 + 4]
                        if v17 ~= nil then
                            v17 = v17.value
                        end
                        if v17 == v20.value then
                            v18 = true
                        else
                            v18 = false
                        end
                    end
                    if not (v18) then
                        continue
                    end
                end
                return true
            end
        end
        return false
    elseif a1.tiles[v13] == nil then
        return true
    end
end
tbl_6.keepTopTiles = function(a1, a2)
    --[[
      name: keepTopTiles
      line: 178
    ]]
    local tbl_14 = {}
    for key_4, value_4 in a1.tiles do
        table.insert(tbl_14, {index = key_4, tile = value_4})
    end
    table.sort(
        tbl_14,
        function(a3, a4)
            --[[
              line: 187
            ]]
            if a3.tile.value ~= a4.tile.value then
                return a4.tile.value < a3.tile.value
            end
            return a3.tile.id < a4.tile.id
        end
    )
    local tbl_15 = {}
    local v21, tbl_16, tbl_14 = nil, nil, nil
    v21, tbl_16 = false, 0
    while true do
        if v21 then
            tbl_16 = tbl_16 + 1
        else
            v21 = true
        end
        if tbl_16 >= math.min(a2, #tbl_14) then
            break
        end
        local key_4 = tbl_14[tbl_16 + 1]
        tbl_15[key_4.index] = key_4.tile
    end
    tbl_16 = {}
    tbl_16.tiles = tbl_15
    tbl_16.nextId = a1.nextId
    return tbl_16
end
tbl_6.removeSmallestTiles = function(a1, a2)
    --[[
      name: removeSmallestTiles
      line: 216
      upvalues:
        largestTileIndex (ref, index: 1)
    ]]
    local tbl_17 = {}
    for key_5, value_5 in a1.tiles do
        table.insert(tbl_17, {index = key_5, tile = value_5})
    end
    table.sort(
        tbl_17,
        function(a3, a4)
            --[[
              line: 225
            ]]
            return a3.tile.value < a4.tile.value
        end
    )
    local tbl_18 = {}
    local tbl_19 = nil
    local _ = nil
    local v22 = nil
    for key_6, value_6 in a1.tiles do
        tbl_18[key_6] = value_6
    end
    local v23 = 0
    v22 = v23
    local v24 = nil
    for v25, value_7 in tbl_17 do
        if a2 <= v22 then
            break
        end
        v24 = 0
        for v26 in tbl_18 do
            v24 = v24 + 1
        end
        if v24 <= 1 then
            break
        end
        if value_7.index ~= largestTileIndex(tbl_18) then
            tbl_18[value_7.index] = nil
            v22 = v22 + 1
        end
    end
    tbl_19 = {}
    tbl_19.tiles = tbl_18
    tbl_19.nextId = a1.nextId
    return tbl_19
end
return tbl_6