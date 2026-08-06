-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local cloneAuthoredTile_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-assets").cloneAuthoredTile
local TOWER_BUILDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-residents")
local WINDOW_DARK_upv_1 = v1.WINDOW_DARK
local WINDOW_LIT_upv_1 = v1.WINDOW_LIT
local u1 = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.blockWidth, TOWER_BUILDER_CONFIG_upv_1.blockHeight, TOWER_BUILDER_CONFIG_upv_1.blockDepth)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 33
    ]]
    return "TileStrip"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 38
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u2)
    return v2:constructor(...) or v2
end
u2.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 42
      upvalues:
        cloneAuthoredTile_upv_1 (copy, index: 1)
    ]]
    a1.slots = {}
    a1.settleRing = -1
    a1.settleTimer = 0
    a1.parkedCFrame = CFrame.new(a4 + Vector3.new(0, -600, 0))
    a1.seat = a2.seat
    local v3 = 0
    local v4 = false
    if v4 then
        v3 = v3 + 1
    else
        v4 = true
    end
    local v5 = nil
    if v3 < a5 then
        local v6 = cloneAuthoredTile_upv_1(a2, a3)
        local v7 = v6:GetPivot()
        local tbl_3 = {}
        for _, value_1 in v6:GetDescendants() do
            if value_1:IsA("BasePart") then
                table.insert(tbl_3, {part = value_1, size = value_1.Size, offset = v7:Inverse() * value_1.CFrame})
            end
        end
        local tbl_4 = {}
        for _, value_2 in a2.windowNames do
            v5 = v6:FindFirstChild(value_2)
            if v5 == nil then
                continue
            end
            if v5:IsA("BasePart") then
                table.insert(tbl_4, v5)
            end
        end
        v6:PivotTo(a1.parkedCFrame)
        table.insert(a1.slots, {model = v6, windows = tbl_4, parts = tbl_3})
        if v4 then
            v3 = v3 + 1
        else
            v4 = true
        end
    end
end
u2.assign = function(a1, a2, a3, a4)
    --[[
      name: assign
      line: 98
      upvalues:
        WINDOW_LIT_upv_1 (copy, index: 1)
        WINDOW_DARK_upv_1 (copy, index: 2)
    ]]
    local v8 = a1.slots[a2 + 1]
    v8.generation = v8.generation + 1
    a1:cancelSettle(a2)
    local v9 = nil
    local value_3 = nil
    for v10, value_3 in v8.windows do
        if a4 then
            v9 = Enum.Material.Neon
        else
            v9 = Enum.Material.Plastic
        end
        value_3.Material = v9
        if a4 then
            v9 = WINDOW_LIT_upv_1
        else
            v9 = WINDOW_DARK_upv_1
        end
        value_3.Color = v9
    end
    v8.model:PivotTo(a3 * a1.seat)
end
u2.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 111
    ]]
    a1.slots[a2 + 1].model:PivotTo(a3 * a1.seat)
end
u2.lightUp = function(a1, a2)
    --[[
      name: lightUp
      line: 117
      upvalues:
        WINDOW_LIT_upv_1 (copy, index: 1)
    ]]
    local u3 = a1.slots[a2 + 1]
    local generation_upv_1 = u3.generation
    for n_1 = 0, #u3.windows - 1 do
        local u4 = u3.windows[n_1 + 1]
        task.delay(
            (n_1 + 1) * 0.15,
            function()
                --[[
                  line: 122
                  upvalues:
                    u3 (copy, index: 1)
                    generation_upv_1 (copy, index: 2)
                    u4 (copy, index: 3)
                    WINDOW_LIT_upv_1 (copy, index: 4)
                ]]
                if u3.generation == generation_upv_1 then
                    u4.Material = Enum.Material.Neon
                    u4.Color = WINDOW_LIT_upv_1
                else
                    return nil
                end
            end
        )
    end
end
u2.release = function(a1, a2)
    --[[
      name: release
      line: 131
    ]]
    local v10 = a1.slots[a2 + 1]
    v10.generation = v10.generation + 1
    a1:cancelSettle(a2)
    v10.model:PivotTo(a1.parkedCFrame)
end
u2.parkAll = function(a1)
    --[[
      name: parkAll
      line: 137
    ]]
    for n_2 = 0, #a1.slots - 1 do
        a1:release(n_2)
    end
end
u2.settle = function(a1, a2, a3)
    --[[
      name: settle
      line: 142
    ]]
    a1.settleRing = a2
    a1.settleDriver = a3
    a1.settleTimer = 0
end
u2.updateSettle = function(a1, a2)
    --[[
      name: updateSettle
      line: 147
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local settleDriver_1 = a1.settleDriver
    if a1.settleRing >= 0 and settleDriver_1 ~= nil then
        a1.settleTimer = a1.settleTimer + a2
        local v11 = a1.slots[a1.settleRing + 1]
        local v12 = settleDriver_1.CFrame * a1.seat
        if TOWER_BUILDER_CONFIG_upv_1.settleSeconds > a1.settleTimer then
            local v13 = settleDriver_1.Size / u1
            for _, value_4 in v11.parts do
                value_4.part.Size = value_4.size * v13
                value_4.part.CFrame = v12 * CFrame.new(value_4.offset.Position * v13) * value_4.offset.Rotation
            end
        else
            a1:restoreRest(v11, v12)
            a1.settleRing = -1
            a1.settleDriver = nil
            return nil
        end
    else
        return nil
    end
end
u2.restoreRest = function(a1, a2, a3)
    --[[
      name: restoreRest
      line: 172
    ]]
    for _, value_5 in a2.parts do
        value_5.part.Size = value_5.size
    end
    a2.model:PivotTo(a3)
end
u2.cancelSettle = function(a1, a2)
    --[[
      name: cancelSettle
      line: 178
    ]]
    if a1.settleRing == a2 then
        for _, value_6 in a1.slots[a2 + 1].parts do
            value_6.part.Size = value_6.size
        end
        a1.settleRing = -1
        a1.settleDriver = nil
    else
        return nil
    end
end
local tbl_5 = {}
tbl_5.TileStrip = u2
return tbl_5