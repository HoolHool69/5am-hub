-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {"moveLeft", "moveRight", "softDrop", "hardDrop", "rotateCw", "rotateCcw", "rotate180", "hold", "restart", "pause"}
local tbl_2 = {}
local tbl_upv_3 = {}
tbl_upv_3.moveLeft = {Enum.KeyCode.Left, Enum.KeyCode.A}
tbl_upv_3.moveRight = {Enum.KeyCode.Right, Enum.KeyCode.D}
tbl_upv_3.softDrop = {Enum.KeyCode.Down, Enum.KeyCode.S}
tbl_upv_3.hardDrop = {Enum.KeyCode.Space}
tbl_upv_3.rotateCw = {Enum.KeyCode.X, Enum.KeyCode.Up, Enum.KeyCode.W}
tbl_upv_3.rotateCcw = {Enum.KeyCode.Z}
tbl_upv_3.rotate180 = {}
tbl_upv_3.hold = {Enum.KeyCode.C, Enum.KeyCode.LeftShift}
tbl_upv_3.restart = {Enum.KeyCode.R}
tbl_upv_3.pause = {Enum.KeyCode.P}
local tbl_upv_4 = {}
local tbl_upv_5 = {"Button", "DPad", "Thumbstick"}
local tbl_upv_6 = {}
tbl_upv_6.Unknown = true
tbl_upv_6.Escape = true
local tbl_upv_7 = {}
for _, value_1 in Enum.KeyCode:GetEnumItems() do
    tbl_upv_7[value_1.Name] = value_1
end
local function toStored_upv_1(a1)
    --[[
      name: toStored
      line: 137
    ]]
    local tbl_8 = {}
    for _, value_2 in a1 do
        table.insert(tbl_8, value_2.Name)
    end
    return table.concat(tbl_8, " ")
end
local function parseStored_upv_1(a1)
    --[[
      name: parseStored
      line: 119
      upvalues:
        tbl_upv_7 (copy, index: 1)
        tbl_upv_6 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
    ]]
    local tbl_9 = {}
    local v1 = nil
    local v2 = nil
    local v3 = nil
    for _, value_3 in string.split(a1, " ") do
        if value_3 == "" then
            continue
        end
        v1 = tbl_upv_7[value_3]
        if v1 == nil then
            continue
        end
        v2 = v1.Name
        if tbl_upv_6[v2] == nil then
            for v4, value_4 in tbl_upv_5 do
                if string.sub(v2, 1, #value_4) == value_4 then
                    v3 = false
                end
            end
        else
            v3 = false
        end
        if not (v3) then
            continue
        end
        if table.find(tbl_9, v1) == nil then
            table.insert(tbl_9, v1)
        end
    end
    return tbl_9
end
local tbl_10 = {}
tbl_10.isBindableKey = function(a1)
    --[[
      name: isBindableKey
      line: 105
      upvalues:
        tbl_upv_6 (copy, index: 1)
        tbl_upv_5 (copy, index: 2)
    ]]
    local Name_1 = a1.Name
    if tbl_upv_6[Name_1] == nil then
        for _, value_5 in tbl_upv_5 do
            if string.sub(Name_1, 1, #value_5) ~= value_5 then
                continue
            end
            return false
        end
        return true
    end
    return false
end
tbl_10.resolveTetrisKeys = function(a1, a2)
    --[[
      name: resolveTetrisKeys
      line: 152
      upvalues:
        tbl_upv_3 (copy, index: 1)
        parseStored_upv_1 (copy, index: 2)
    ]]
    local v4 = a1[a2]
    if v4 ~= nil then
        return (parseStored_upv_1(v4))
    end
    return tbl_upv_3[a2]
end
tbl_10.withBinding = function(a1, a2, a3)
    --[[
      name: withBinding
      line: 169
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        parseStored_upv_1 (copy, index: 3)
        toStored_upv_1 (copy, index: 4)
    ]]
    local tbl_11 = {}
    local v5 = nil
    local v6 = nil
    local _ = nil
    local v7 = nil
    local value_6 = nil
    local v8 = nil
    for v9, value_6 in tbl_upv_1 do
        if value_6 == a2 then
            continue
        end
        v5 = a1[value_6]
        if v5 ~= nil then
            v6 = parseStored_upv_1(v5)
        else
            v6 = tbl_upv_3[value_6]
        end
        v5 = {}
        v7 = 0
        for v10, value_7 in v6 do
            if value_7 ~= a3 == true then
                v7 = v7 + 1
                v5[v7] = value_7
            end
        end
        if #v5 ~= #v6 then
            tbl_11[value_6] = toStored_upv_1(v5)
            continue
        end
        v8 = a1[value_6]
        if v8 ~= nil then
            tbl_11[value_6] = v8
        end
    end
    tbl_11[a2] = a3.Name
    return tbl_11
end
tbl_10.sanitizeTetrisKeybinds = function(a1)
    --[[
      name: sanitizeTetrisKeybinds
      line: 209
      upvalues:
        tbl_upv_4 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        parseStored_upv_1 (copy, index: 3)
        toStored_upv_1 (copy, index: 4)
    ]]
    if a1 ~= nil then
        local tbl_12 = {}
        local tbl_13 = {}
        local v9 = nil
        local _ = nil
        local v11 = nil
        local v10 = nil
        for v12, value_8 in tbl_upv_1 do
            v10 = a1[value_8]
            if v10 == nil or type(v10) ~= "string" then
                continue
            end
            v9 = {}
            for v13, value_9 in parseStored_upv_1(v10) do
                if tbl_13[value_9] == nil then
                    tbl_13[value_9] = true
                    table.insert(v9, value_9)
                end
            end
            tbl_12[value_8] = toStored_upv_1(v9)
        end
        return tbl_12
    end
    return tbl_upv_4
end
tbl_10.TETRIS_ACTIONS = tbl_upv_1
tbl_10.TETRIS_ACTION_LABELS = tbl_2
tbl_10.DEFAULT_TETRIS_KEYS = tbl_upv_3
tbl_10.DEFAULT_TETRIS_KEYBINDS = tbl_upv_4
return tbl_10