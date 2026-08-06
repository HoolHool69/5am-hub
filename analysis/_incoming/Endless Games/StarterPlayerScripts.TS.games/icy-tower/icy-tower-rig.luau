-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local v2 = RuntimeLib_1.import(script, script.Parent, "icy-tower-pose")
local limbAngles_upv_1 = v2.limbAngles
local SPIN_CENTER_Y_upv_1 = v2.SPIN_CENTER_Y
local wholeBodyPivot_upv_1 = v2.wholeBodyPivot
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(64, 148, 232)
local u3 = Color3.fromRGB(158, 204, 246)
local u4 = Color3.fromRGB(92, 196, 70)
local u5 = Color3.fromRGB(56, 126, 44)
local u6 = Color3.fromRGB(72, 96, 52)
local u7 = Color3.fromRGB(236, 236, 240)
local u8 = Color3.fromRGB(244, 204, 164)
local u9 = Color3.fromRGB(250, 250, 246)
local u10 = Color3.fromRGB(28, 30, 36)
local u11 = Color3.fromRGB(110, 62, 48)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 44
    ]]
    return "IcyTowerRig"
end
local u12 = setmetatable(tbl_1, tbl_2)
u12.__index = u12
u12.new = function(...)
    --[[
      name: new
      line: 49
      upvalues:
        u12 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u12)
    return v3:constructor(...) or v3
end
u12.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 53
      upvalues:
        u1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u5 (copy, index: 5)
        u8 (copy, index: 6)
        u2 (copy, index: 7)
        u3 (copy, index: 8)
        u9 (copy, index: 9)
        u10 (copy, index: 10)
        u11 (copy, index: 11)
        u6 (copy, index: 12)
        u7 (copy, index: 13)
    ]]
    a1.pieces = {}
    a1.arms = {}
    a1.legs = {}
    a1.shoes = {}
    a1.mouthOpen = false
    a1.angles = {}
    local v4 = makeStagePart_upv_1(a2)
    v4.CFrame = u1
    table.insert(a1.pieces, {part = v4, offset = CFrame.new(0, 1.85, 0)})
    v4.Color = u4
    v4.Size = Vector3.new(1.0199999809265137, 1.100000023841858, 0.7599999904632568)
    local v5 = makeSmoothPart_upv_1(a2)
    v5.CFrame = u1
    table.insert(a1.pieces, {part = v5, offset = CFrame.new(0, 1.85, 0.4)})
    v5.Color = u5
    v5.Size = Vector3.new(0.11999999731779099, 0.9200000166893005, 0.10000000149011612)
    local v6 = makeStagePart_upv_1(a2)
    v6.CFrame = u1
    table.insert(a1.pieces, {part = v6, offset = CFrame.new(0, 3, 0)})
    v6.Color = u8
    v6.Size = Vector3.new(1.5499999523162842, 1.2000000476837158, 1.4199999570846558)
    v6.BackSurface = Enum.SurfaceType.Smooth
    local v7 = makeStagePart_upv_1(a2)
    v7.CFrame = u1
    table.insert(a1.pieces, {part = v7, offset = CFrame.new(0, 3.6, 0)})
    v7.Color = u2
    v7.Size = Vector3.new(1.7200000286102295, 0.2199999988079071, 1.5800000429153442)
    local v8 = makeStagePart_upv_1(a2)
    v8.CFrame = u1
    table.insert(a1.pieces, {part = v8, offset = CFrame.new(0, 3.85, 0)})
    v8.Color = u2
    v8.Size = Vector3.new(1.4199999570846558, 0.4399999976158142, 1.3200000524520874)
    local v9 = makeStagePart_upv_1(a2)
    v9.CFrame = u1
    table.insert(a1.pieces, {part = v9, offset = CFrame.new(0, 4.2, 0)})
    v9.Color = u3
    v9.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    local v10 = nil
    local v11 = nil
    for _, value_1 in {-1, 1} do
        v10 = makeSmoothPart_upv_1(a2)
        v10.CFrame = u1
        table.insert(a1.pieces, {part = v10, offset = CFrame.new(value_1 * 0.34, 3.15, 0.72)})
        v10.Color = u9
        v10.Size = Vector3.new(0.2800000011920929, 0.3199999928474426, 0.11999999731779099)
        v11 = makeSmoothPart_upv_1(a2)
        v11.CFrame = u1
        table.insert(a1.pieces, {part = v11, offset = CFrame.new(value_1 * 0.36, 3.12, 0.8)})
        v11.Color = u10
        v11.Size = Vector3.new(0.12999999523162842, 0.1599999964237213, 0.09000000357627869)
    end
    local v12 = makeSmoothPart_upv_1(a2)
    v12.CFrame = u1
    table.insert(a1.pieces, {part = v12, offset = CFrame.new(0, 2.72, 0.73)})
    a1.mouth = v12
    a1.mouth.Color = u11
    a1.mouth.Size = Vector3.new(0.4000000059604645, 0.11999999731779099, 0.10999999940395355)
    local v13 = nil
    local v14 = nil
    local v15 = nil
    local v16 = nil
    for _, value_2 in {-1, 1} do
        v13 = makeStagePart_upv_1(a2)
        v13.Color = u4
        v13.Size = Vector3.new(0.3400000035762787, 0.949999988079071, 0.4399999976158142)
        v13.CFrame = u1
        table.insert(a1.arms, {part = v13, hinge = CFrame.new(value_2 * 0.58, 2.15, 0), rest = CFrame.new(0, -0.5, 0), side = value_2})
        v14 = makeStagePart_upv_1(a2)
        v14.Color = u6
        v14.Size = Vector3.new(0.4399999976158142, 1.25, 0.5400000214576721)
        v14.CFrame = u1
        v15 = CFrame.new(value_2 * 0.32, 1.3, 0)
        table.insert(a1.legs, {part = v14, hinge = v15, rest = CFrame.new(0, -0.625, 0), side = value_2})
        v16 = makeStagePart_upv_1(a2)
        v16.Color = u7
        v16.Size = Vector3.new(0.5600000023841858, 0.3199999928474426, 0.800000011920929)
        v16.CFrame = u1
        table.insert(a1.shoes, {part = v16, hinge = v15, rest = CFrame.new(0, -1.1, 0.1), side = value_2})
    end
end
u12.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 152
      upvalues:
        wholeBodyPivot_upv_1 (copy, index: 1)
        SPIN_CENTER_Y_upv_1 (copy, index: 2)
        limbAngles_upv_1 (copy, index: 3)
    ]]
    local v17 = wholeBodyPivot_upv_1(a2, a3, SPIN_CENTER_Y_upv_1)
    for v18, v19 in a1.pieces do
        v19.part.CFrame = v17 * v19.offset
    end
    limbAngles_upv_1(a3, a1.angles)
    local angles_1 = a1.angles
    local armSwing_1 = angles_1.armSwing
    local armRaise_1 = angles_1.armRaise
    local v18 = angles_1.legSwing
    local v19 = angles_1.legSplit
    v17 = nil
    local v20 = nil
    for key_1, v21 in a1.arms do
        if a3.state ~= "run" then
            v20 = armSwing_1
        else
            v20 = -armSwing_1 * v21.side
        end
        local v21 = nil
        v21.part.CFrame = ((v17 * v21.hinge) * CFrame.Angles(math.rad(v20), 0, math.rad(v21.side * armRaise_1))) * v21.rest
    end
    v19 = nil
    local v21 = nil
    for n_1 = 0, #a1.legs - 1 do
        local key_1 = a1.legs[n_1 + 1]
        if a3.state ~= "run" then
            v21 = v18
        else
            v21 = v18 * key_1.side
        end
        local v22 = CFrame.Angles(math.rad(v21), 0, math.rad(key_1.side * v19))
        key_1.part.CFrame = ((v17 * key_1.hinge) * v22) * key_1.rest
        local v23 = a1.shoes[n_1 + 1]
        v23.part.CFrame = ((v17 * v23.hinge) * v22) * v23.rest
    end
    local v24 = true
    local v25
    if a3.state == "panic" then
        v25 = v24
    else
        local v26 = true
        if a3.state == "fall" then
            v25 = v26
        else
            v25 = a3.state == "spin"
        end
    end
    if v25 == a1.mouthOpen then
        return
    end
    a1.mouthOpen = v25
    a1.mouth.Size = (v25 and Vector3.new(0.3400000035762787, 0.3799999952316284, 0.10999999940395355)) or Vector3.new(0.4000000059604645, 0.11999999731779099, 0.10999999940395355)
end
u12.park = function(a1)
    --[[
      name: park
      line: 195
      upvalues:
        u1 (copy, index: 1)
    ]]
    local _ = nil
    local v1 = nil
    for v2, value_3 in a1.pieces do
        value_3.part.CFrame = u1
    end
    local v3 = nil
    local v4 = nil
    for v5, value_4 in a1.arms do
        value_4.part.CFrame = u1
    end
    local v6 = nil
    local v7 = nil
    for v8, value_5 in a1.legs do
        value_5.part.CFrame = u1
    end
    for v9, value_6 in a1.shoes do
        value_6.part.CFrame = u1
    end
end
local tbl_3 = {}
tbl_3.IcyTowerRig = u12
return tbl_3