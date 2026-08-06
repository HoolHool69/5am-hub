-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local makeSmoothPart_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(52, 70, 118)
local u3 = Color3.fromRGB(232, 190, 152)
local u4 = Color3.fromRGB(36, 36, 42)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 19
    ]]
    return "RiderRagdoll"
end
local u5 = setmetatable(tbl_1, tbl_2)
u5.__index = u5
u5.new = function(...)
    --[[
      name: new
      line: 24
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u5)
    return v1:constructor(...) or v1
end
u5.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 28
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u3 (copy, index: 3)
        u4 (copy, index: 4)
    ]]
    a1.pieces = {}
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(1.100000023841858, 1.2999999523162842, 0.699999988079071), u2, Vector3.new(0, 0, 0))
    local v2 = makeSmoothPart_upv_1(a2)
    v2.Shape = Enum.PartType.Ball
    a1:addPiece(v2, Vector3.new(0.75, 0.75, 0.75), u3, Vector3.new(0, 1.0499999523162842, 0))
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.3499999940395355, 1.100000023841858, 0.3499999940395355), u2, Vector3.new(-0.75, 0.10000000149011612, 0))
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.3499999940395355, 1.100000023841858, 0.3499999940395355), u2, Vector3.new(0.75, 0.10000000149011612, 0))
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.4000000059604645, 1.100000023841858, 0.4000000059604645), u4, Vector3.new(-0.30000001192092896, -1.149999976158142, 0.20000000298023224))
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.4000000059604645, 1.100000023841858, 0.4000000059604645), u4, Vector3.new(0.30000001192092896, -1.149999976158142, 0.20000000298023224))
end
u5.fling = function(a1, a2, a3, a4, a5)
    --[[
      name: fling
      line: 39
    ]]
    for _, value_1 in a1.pieces do
        value_1.part.CFrame = CFrame.new(a5 + value_1.offset)
        value_1.part.Anchored = false
        value_1.part.AssemblyLinearVelocity = Vector3.new(a3 * a2:NextNumber(8, 18), a2:NextNumber(14, 24), (a4 * 0.15) + a2:NextNumber(-3, 6))
        value_1.part.AssemblyAngularVelocity = Vector3.new(a2:NextNumber(-14, 14), a2:NextNumber(-14, 14), a2:NextNumber(-14, 14))
    end
end
u5.park = function(a1)
    --[[
      name: park
      line: 49
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_2 in a1.pieces do
        value_2.part.Anchored = true
        value_2.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_2.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_2.part.CFrame = u1
    end
end
u5.addPiece = function(a1, a2, a3, a4, a5)
    --[[
      name: addPiece
      line: 57
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.Size = a3
    a2.Color = a4
    a2.CFrame = u1
    table.insert(a1.pieces, {part = a2, offset = a5})
end
local tbl_3 = {}
tbl_3.RiderRagdoll = u5
return tbl_3