-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function occupiedCells_upv_1(a1)
    --[[
      name: occupiedCells
      line: 33
    ]]
    if a1.orient == 0 then
        return {Vector2.new(a1.x, a1.y)}
    elseif a1.orient ~= 1 then
        local tbl_1 = {Vector2.new(a1.x, a1.y), Vector2.new(a1.x, a1.y + 1)}
        return tbl_1
    else
        local tbl_2 = {Vector2.new(a1.x, a1.y), Vector2.new(a1.x + 1, a1.y)}
        return tbl_2
    end
end
local function cellSupported_upv_1(a1, a2, a3, a4)
    --[[
      name: cellSupported
      line: 132
    ]]
    if a3 >= 0 and a4 >= 0 and a1.width > a3 then
        local v1 = nil
        if a1.height > a4 then
            v1 = a1.tiles[(a4 * a1.width) + a3]
            if v1 ~= nil then
                local v2 = nil
                if v1.kind ~= "bridge" then
                    return true
                else
                    v2 = v1.bridgeGroup
                    local v3 = false
                    if v2 ~= nil then
                        v3 = a2.bridgesOpen[v2 + 1] == true
                    end
                    return v3
                end
            else
                return false
            end
        end
    end
    return false
end
local function rolledPose_upv_1(a1, a2)
    --[[
      name: rolledPose
      line: 43
    ]]
    local x_1 = a1.x
    local y_1 = a1.y
    local orient_1 = a1.orient
    if orient_1 ~= 0 then
        if orient_1 ~= 1 then
            if a2 == "left" then
                local tbl_3 = {}
                tbl_3.x = x_1 - 1
                tbl_3.y = y_1
                return tbl_3
            elseif a2 == "right" then
                local tbl_4 = {}
                tbl_4.x = x_1 + 1
                tbl_4.y = y_1
                return tbl_4
            elseif a2 ~= "up" then
                local tbl_5 = {}
                tbl_5.x = x_1
                tbl_5.y = y_1 + 2
                return tbl_5
            else
                local tbl_6 = {}
                tbl_6.x = x_1
                tbl_6.y = y_1 - 1
                return tbl_6
            end
        elseif a2 == "left" then
            local tbl_7 = {}
            tbl_7.x = x_1 - 1
            tbl_7.y = y_1
            return tbl_7
        elseif a2 == "right" then
            local tbl_8 = {}
            tbl_8.x = x_1 + 2
            tbl_8.y = y_1
            return tbl_8
        elseif a2 ~= "up" then
            local tbl_9 = {}
            tbl_9.x = x_1
            tbl_9.y = y_1 + 1
            return tbl_9
        else
            local tbl_10 = {}
            tbl_10.x = x_1
            tbl_10.y = y_1 - 1
            return tbl_10
        end
    elseif a2 == "left" then
        local tbl_11 = {}
        tbl_11.x = x_1 - 2
        tbl_11.y = y_1
        return tbl_11
    elseif a2 == "right" then
        local tbl_12 = {}
        tbl_12.x = x_1 + 1
        tbl_12.y = y_1
        return tbl_12
    elseif a2 ~= "up" then
        local tbl_13 = {}
        tbl_13.x = x_1
        tbl_13.y = y_1 + 1
        return tbl_13
    else
        local tbl_14 = {}
        tbl_14.x = x_1
        tbl_14.y = y_1 - 2
        return tbl_14
    end
end
local tbl_upv_15 = {"up", "down", "left", "right"}
local function freshAttempt_upv_1(a1)
    --[[
      name: freshAttempt
      line: 23
    ]]
    local tbl_16 = {}
    for _, value_1 in a1.bridgesInitiallyOpen do
        table.insert(tbl_16, value_1)
    end
    local tbl_17 = {}
    tbl_17.bridgesOpen = tbl_16
    return tbl_17
end
local function stateKey_upv_1(a1, a2, a3)
    --[[
      name: stateKey
      line: 225
    ]]
    local v4 = 0
    v4 = v4
    for n_1 = 0, #a3.bridgesOpen - 1 do
        v4 = ((a3.bridgesOpen[n_1 + 1]) and (v4 + 2 ^ n_1)) or v4
    end
    return ((((((v4 * 3) + a2.orient) * a1.height) + a2.y) * a1.width) + a2.x) + a1.width
end
local function applyRoll_upv_1(a1, a2, a3, a4)
    --[[
      name: applyRoll
      line: 155
      upvalues:
        rolledPose_upv_1 (copy, index: 1)
        occupiedCells_upv_1 (copy, index: 2)
        cellSupported_upv_1 (copy, index: 3)
    ]]
    local v5 = rolledPose_upv_1(a3, a4)
    local v6 = occupiedCells_upv_1(v5)
    local tbl_18 = nil
    for v7, v8 in v6 do
        if cellSupported_upv_1(a1, a2, v8.X, v8.Y) then
            continue
        end
        tbl_18 = {}
        tbl_18.pose = v5
        tbl_18.outcome = {}
        return tbl_18
    end
    local v9 = v5.orient == 0
    local v7 = nil
    if v9 then
        v7 = a1.tiles[(v5.y * a1.width) + v5.x]
        if v7 ~= nil and v7.kind == "fragile" then
            local v8 = {}
            v8.pose = v5
            v8.outcome = {cellX = v5.x, cellY = v5.y}
            return v8
        end
        if v5.x == a1.goalX and v5.y == a1.goalY then
            local v8 = {}
            v8.pose = v5
            v8.outcome = {}
            return v8
        end
    end
    local v10 = nil
    for _, value_2 in v6 do
        v10 = a1.tiles[(value_2.Y * a1.width) + value_2.X]
        if v10 == nil then
            continue
        end
        if v10.kind == "softSwitch" or v10.kind == "heavySwitch" then
            if v10.kind == "heavySwitch" then
                local v11
                if not (v9) then
                    continue
                end
            end
            local v11
            v11 = v10.bridgeGroup
            if v11 == nil then
                continue
            end
            if v10.toggles ~= true then
                a2.bridgesOpen[v11 + 1] = true
            else
                a2.bridgesOpen[v11 + 1] = not a2.bridgesOpen[v11 + 1]
            end
        end
    end
    local tbl_19 = {}
    tbl_19.pose = v5
    tbl_19.outcome = {}
    return tbl_19
end
local tbl_20 = {}
tbl_20.cellKey = function(a1, a2, a3)
    --[[
      name: cellKey
      line: 20
    ]]
    return (a3 * a1) + a2
end
tbl_20.freshAttempt = freshAttempt_upv_1
tbl_20.occupiedCells = occupiedCells_upv_1
tbl_20.rolledPose = rolledPose_upv_1
tbl_20.cellSupported = cellSupported_upv_1
tbl_20.applyRoll = applyRoll_upv_1
tbl_20.stateKey = stateKey_upv_1
tbl_20.solveLevel = function(a1)
    --[[
      name: solveLevel
      line: 241
      upvalues:
        freshAttempt_upv_1 (copy, index: 1)
        stateKey_upv_1 (copy, index: 2)
        tbl_upv_15 (copy, index: 3)
        applyRoll_upv_1 (copy, index: 4)
    ]]
    local start_1 = a1.start
    local v12 = freshAttempt_upv_1(a1)
    local tbl_21 = {}
    local v13 = {}
    table.insert(v13, {pose = start_1, bridges = v12.bridgesOpen})
    tbl_21[stateKey_upv_1(a1, start_1, v12)] = true
    for n_2 = 1, 200 do
        local tbl_22 = {}
        local v14 = nil
        local v15 = nil
        for _, value_3 in v13 do
            v14 = nil
            for v17, value_4 in tbl_upv_15 do
                v14 = {}
                v14.bridgesOpen = table.clone(value_3.bridges)
                v15 = applyRoll_upv_1(a1, v14, value_3.pose, value_4)
                if v15.outcome.kind ~= "goal" then
                    local v16
                    if v15.outcome.kind ~= "moved" then
                        continue
                    end
                    v16 = stateKey_upv_1(a1, v15.pose, v14)
                    if tbl_21[v16] == nil then
                        tbl_21[v16] = true
                        table.insert(tbl_22, {pose = v15.pose, bridges = v14.bridgesOpen})
                    end
                else
                    return n_2
                end
            end
        end
        if #tbl_22 ~= 0 then
            v13 = tbl_22
            continue
        end
        return nil
    end
    return nil
end
tbl_20.ROLL_DIRECTIONS = tbl_upv_15
return tbl_20