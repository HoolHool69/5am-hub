-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(198, 62, 62)
local u3 = Color3.fromRGB(176, 46, 46)
local u4 = Color3.fromRGB(34, 34, 40)
local u5 = Color3.fromRGB(28, 28, 32)
local u6 = Color3.fromRGB(190, 195, 205)
local u7 = Color3.fromRGB(255, 244, 190)
local u8 = Color3.fromRGB(22, 24, 30)
local u9 = Color3.fromRGB(255, 92, 70)
local u10 = Color3.fromRGB(150, 180, 205)
local u11 = CFrame.new(0, 1.9, 1.35) * CFrame.Angles(0.4188790204786391, 0, 0)
local u12 = CFrame.new(0, 0, -0.05)
local u13 = CFrame.new(0, 0.14, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 42
    ]]
    return "BikeRig"
end
local u14 = setmetatable(tbl_1, tbl_2)
u14.__index = u14
u14.new = function(...)
    --[[
      name: new
      line: 47
      upvalues:
        u14 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u14)
    return v2:constructor(...) or v2
end
u14.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 51
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        makeStagePart_upv_1 (copy, index: 3)
        u2 (copy, index: 4)
        u4 (copy, index: 5)
        u3 (copy, index: 6)
        u6 (copy, index: 7)
        u7 (copy, index: 8)
        u10 (copy, index: 9)
        u11 (copy, index: 10)
        u8 (copy, index: 11)
        u9 (copy, index: 12)
    ]]
    a1.pieces = {}
    a1.lastSpeedFraction = -1
    local v3 = makeSmoothPart_upv_1(a2)
    v3.Shape = Enum.PartType.Cylinder
    a1:addPiece(v3, Vector3.new(0.5, 1.600000023841858, 1.600000023841858), u5, CFrame.new(0, 0.78, -1.6), true)
    local v4 = makeSmoothPart_upv_1(a2)
    v4.Shape = Enum.PartType.Cylinder
    a1:addPiece(v4, Vector3.new(0.5, 1.600000023841858, 1.600000023841858), u5, CFrame.new(0, 0.78, 2.2), true)
    a1:addPiece(makeStagePart_upv_1(a2), Vector3.new(0.949999988079071, 0.8500000238418579, 3), u2, CFrame.new(0, 1.05, 0.1), false)
    a1:addPiece(makeStagePart_upv_1(a2), Vector3.new(0.9200000166893005, 0.36000001430511475, 1.350000023841858), u4, CFrame.new(0, 0.86, -0.95), false)
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.8999999761581421, 0.6200000047683716, 1.100000023841858), u3, CFrame.new(0, 1.42, 0.7), false)
    for _, value_1 in {-1, 1} do
        a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.1599999964237213, 1.75, 0.1599999964237213), u6, CFrame.new(value_1 * 0.42, 1.2, 2.02) * CFrame.Angles(-0.4188790204786391, 0, 0), false)
    end
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.23999999463558197, 0.949999988079071, 0.23999999463558197), u6, CFrame.new(0, 1.5, 1.78) * CFrame.Angles(-0.4188790204786391, 0, 0), false)
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(2.5, 0.15000000596046448, 0.15000000596046448), u6, CFrame.new(0, 1.56, 1.62), false)
    local v5 = makeSmoothPart_upv_1(a2)
    v5.Material = Enum.Material.Neon
    a1:addPiece(v5, Vector3.new(0.6200000047683716, 0.46000000834465027, 0.23999999463558197), u7, CFrame.new(0, 1.18, 2.34), false)
    local v6 = makeSmoothPart_upv_1(a2)
    v6.Material = Enum.Material.Glass
    v6.Transparency = 0.55
    a1:addPiece(v6, Vector3.new(0.949999988079071, 0.5, 0.07999999821186066), u10, CFrame.new(0, 1.78, 1.98) * CFrame.Angles(-0.4537856055185257, 0, 0), false)
    local v7 = makeSmoothPart_upv_1(a2)
    v7.Shape = Enum.PartType.Cylinder
    a1:addPiece(v7, Vector3.new(0.07000000029802322, 0.800000011920929, 0.800000011920929), u6, u11 * CFrame.Angles(0, 1.5707963267948966, 0), false)
    local v8 = makeSmoothPart_upv_1(a2)
    v8.Shape = Enum.PartType.Cylinder
    a1:addPiece(v8, Vector3.new(0.07000000029802322, 0.6600000262260437, 0.6600000262260437), u8, u11 * CFrame.new(0, 0, -0.025) * CFrame.Angles(0, 1.5707963267948966, 0), false)
    a1:addPiece(makeSmoothPart_upv_1(a2), Vector3.new(0.05999999865889549, 0.30000001192092896, 0.03999999910593033), u9, u11, false)
    a1.needlePiece = a1.pieces[#a1.pieces]
    local v9 = makeSmoothPart_upv_1(a2)
    v9.Shape = Enum.PartType.Ball
    a1:addPiece(v9, Vector3.new(0.11999999731779099, 0.11999999731779099, 0.11999999731779099), u6, u11 * CFrame.new(0, 0, -0.065), false)
    a1:setSpeedFraction(0)
end
u14.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 121
    ]]
    local v10 = nil
    local v11 = nil
    for _, value_2 in a1.pieces do
        v10 = a2 * value_2.offset
        if value_2.isWheel then
            v11 = v10 * CFrame.Angles(a3, 0, 0)
        else
            v11 = v10
        end
        value_2.part.CFrame = v11
    end
end
u14.setSpeedFraction = function(a1, a2)
    --[[
      name: setSpeedFraction
      line: 136
      upvalues:
        u11 (copy, index: 1)
        u12 (copy, index: 2)
        u13 (copy, index: 3)
    ]]
    if math.abs(a2 - a1.lastSpeedFraction) >= 0.01 then
        a1.lastSpeedFraction = a2
        a1.needlePiece.offset = ((u11 * u12) * CFrame.Angles(0, 0, math.rad(-135 + (270 * a2)))) * u13
    else
        return nil
    end
end
u14.fling = function(a1, a2, a3, a4)
    --[[
      name: fling
      line: 148
    ]]
    for _, value_3 in a1.pieces do
        value_3.part.Anchored = false
        value_3.part.AssemblyLinearVelocity = Vector3.new(a3 * a2:NextNumber(6, 16), a2:NextNumber(10, 20), (a4 * 0.12) + a2:NextNumber(-4, 4))
        value_3.part.AssemblyAngularVelocity = Vector3.new(a2:NextNumber(-12, 12), a2:NextNumber(-12, 12), a2:NextNumber(-12, 12))
    end
end
u14.park = function(a1)
    --[[
      name: park
      line: 155
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_4 in a1.pieces do
        value_4.part.Anchored = true
        value_4.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_4.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_4.part.CFrame = u1
    end
end
u14.addPiece = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: addPiece
      line: 163
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.Size = a3
    a2.Color = a4
    a2.CastShadow = true
    a2.CFrame = u1
    table.insert(a1.pieces, {part = a2, offset = a5, isWheel = a6})
end
local tbl_3 = {}
tbl_3.BikeRig = u14
return tbl_3