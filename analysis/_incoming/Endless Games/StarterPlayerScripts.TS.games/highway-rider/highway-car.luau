-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(214, 88, 70)
local u3 = Color3.fromRGB(40, 44, 52)
local u4 = Color3.fromRGB(26, 26, 30)
local u5 = Color3.fromRGB(255, 244, 190)
local u6 = Color3.fromRGB(255, 70, 56)
local u7 = Color3.fromRGB(150, 180, 205)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 23
    ]]
    return "CarRig"
end
local u8 = setmetatable(tbl_1, tbl_2)
u8.__index = u8
u8.new = function(...)
    --[[
      name: new
      line: 28
      upvalues:
        u8 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u8)
    return v2:constructor(...) or v2
end
u8.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 32
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u3 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u5 (copy, index: 5)
        u7 (copy, index: 6)
        u6 (copy, index: 7)
        u4 (copy, index: 8)
    ]]
    a1.pieces = {}
    a1:addPiece(makeStagePart_upv_1(a2), Vector3.new(3.5999999046325684, 1.2999999523162842, 5.800000190734863), u2, CFrame.new(0, 1.25, 0), false)
    a1:addPiece(makeStagePart_upv_1(a2), Vector3.new(3, 1.100000023841858, 2.799999952316284), u3, CFrame.new(0, 2.4, -0.5), false)
    local v3 = makeSmoothPart_upv_1(a2)
    v3.Material = Enum.Material.Neon
    a1:addPiece(v3, Vector3.new(2.799999952316284, 0.3499999940395355, 0.20000000298023224), u5, CFrame.new(0, 1.2, 2.95), false)
    local v4 = makeSmoothPart_upv_1(a2)
    v4.Material = Enum.Material.Glass
    v4.Transparency = 0.35
    a1:addPiece(v4, Vector3.new(2.5999999046325684, 0.8500000238418579, 0.14000000059604645), u7, CFrame.new(0, 2.45, -1.92) * CFrame.Angles(0.24434609527920614, 0, 0), false)
    local v5 = makeSmoothPart_upv_1(a2)
    v5.Material = Enum.Material.Neon
    a1:addPiece(v5, Vector3.new(2.9000000953674316, 0.3199999928474426, 0.18000000715255737), u6, CFrame.new(0, 1.4, -2.95), false)
    for _, value_1 in {-1, 1} do
        a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.1599999964237213, 0.44999998807907104, 0.1599999964237213), u3, CFrame.new(value_1 * 1.15, 2.1, -2.55), false)
    end
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(3.4000000953674316, 0.14000000059604645, 0.8500000238418579), u3, CFrame.new(0, 2.36, -2.6), false)
    local v6 = nil
    for _, value_2 in {{-1.7, 1.9}, {1.7, 1.9}, {-1.7, -1.9}, {1.7, -1.9}} do
        v6 = makeSmoothPart_upv_1(a2)
        v6.Shape = Enum.PartType.Cylinder
        a1:addPiece(v6, Vector3.new(0.5, 1.2999999523162842, 1.2999999523162842), u4, CFrame.new(value_2[1], 0.65, value_2[2]), true)
    end
end
u8.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 63
    ]]
    local v7 = nil
    local v8 = nil
    for _, value_3 in a1.pieces do
        v7 = a2 * value_3.offset
        if value_3.isWheel then
            v8 = v7 * CFrame.Angles(a3, 0, 0)
        else
            v8 = v7
        end
        value_3.part.CFrame = v8
    end
end
u8.fling = function(a1, a2, a3, a4)
    --[[
      name: fling
      line: 78
    ]]
    for _, value_4 in a1.pieces do
        value_4.part.Anchored = false
        value_4.part.AssemblyLinearVelocity = Vector3.new(a3 * a2:NextNumber(6, 16), a2:NextNumber(10, 20), (a4 * 0.12) + a2:NextNumber(-4, 4))
        value_4.part.AssemblyAngularVelocity = Vector3.new(a2:NextNumber(-12, 12), a2:NextNumber(-12, 12), a2:NextNumber(-12, 12))
    end
end
u8.park = function(a1)
    --[[
      name: park
      line: 85
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_5 in a1.pieces do
        value_5.part.Anchored = true
        value_5.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_5.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_5.part.CFrame = u1
    end
end
u8.addPiece = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: addPiece
      line: 93
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.Size = a3
    a2.Color = a4
    a2.CFrame = u1
    table.insert(a1.pieces, {part = a2, offset = a5, isWheel = a6})
end
local tbl_3 = {}
tbl_3.CarRig = u8
return tbl_3