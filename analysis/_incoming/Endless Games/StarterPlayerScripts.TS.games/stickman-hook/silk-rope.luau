-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local makeSmoothPart_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local u1 = CFrame.new(0, -1000, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 35
    ]]
    return "SilkRope"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 40
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 44
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    a1.segments = {}
    a1.pointX = {}
    a1.pointY = {}
    a1.lastLength = {}
    a1.parked = true
    for n_1 = 0, 5 do
        local v2 = makeSmoothPart_upv_1(a2)
        v2.Color = a3
        local v3 = (n_1 / 5) * -0.09000000000000001 + 0.2
        v2.Size = Vector3.new(v3, 1, v3)
        v2.CFrame = u1
        table.insert(a1.segments, v2)
        table.insert(a1.lastLength, 1)
    end
    for _ = 0, 6 do
        table.insert(a1.pointX, 0)
        table.insert(a1.pointY, 0)
    end
end
u2.pose = function(a1, a2, a3, a4, a5, a6, a7, a8)
    --[[
      name: pose
      line: 71
    ]]
    a1.parked = false
    for n_2 = 0, 6 do
        local v4 = n_2 / 6
        a1.pointX[n_2 + 1] = a4 + ((a4 + ((a2 - a4) * a8) - a4) * v4)
        a1.pointY[n_2 + 1] = (a5 + ((a5 + ((a3 - a5) * a8) - a5) * v4)) - (((a7 * 4) * v4) * (1 - v4))
    end
    for n_3 = 0, 5 do
        local v5 = a1.pointX[n_3 + 1]
        local v6 = a1.pointY[n_3 + 1]
        local v7 = a1.pointX[n_3 + 2] - v5
        local v8 = a1.pointY[n_3 + 2] - v6
        local v9
        v9 = math.max(math.sqrt((v7 * v7) + (v8 * v8)), 0.02)
        local v10 = a1.segments[n_3 + 1]
        if math.abs(v9 - a1.lastLength[n_3 + 1]) > 0.02 then
            a1.lastLength[n_3 + 1] = v9
            local X_1 = v10.Size.X
            v10.Size = Vector3.new(X_1, v9, X_1)
        end
        v10.CFrame = CFrame.new(v5 + (v7 / 2), v6 + (v8 / 2), a6) * CFrame.Angles(0, 0, math.atan2(v7, -v8))
    end
end
u2.park = function(a1)
    --[[
      name: park
      line: 104
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.parked then
        return nil
    end
    a1.parked = true
    for _, value_1 in a1.segments do
        value_1.CFrame = u1
    end
end
local tbl_3 = {}
tbl_3.SilkRope = u2
return tbl_3