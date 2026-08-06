-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local makeSmoothPart_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(197, 218, 70)
local u3 = Color3.fromRGB(229, 240, 148)
local u4 = Color3.fromRGB(140, 162, 44)
local u5 = Color3.fromRGB(105, 122, 34)
local u6 = Color3.fromRGB(248, 248, 244)
local u7 = Color3.fromRGB(30, 30, 34)
local u8 = Color3.fromRGB(96, 78, 42)
local u9 = Color3.fromRGB(232, 168, 116)
local u10 = CFrame.new(0, -0.3, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 38
    ]]
    return "DoodlerRig"
end
local u11 = setmetatable(tbl_1, tbl_2)
u11.__index = u11
u11.new = function(...)
    --[[
      name: new
      line: 43
      upvalues:
        u11 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u11)
    return v1:constructor(...) or v1
end
u11.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 47
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u2 (copy, index: 3)
        u3 (copy, index: 4)
        u6 (copy, index: 5)
        u7 (copy, index: 6)
        u9 (copy, index: 7)
        u8 (copy, index: 8)
        u4 (copy, index: 9)
        u5 (copy, index: 10)
    ]]
    a1.pivotYOffset = 1.2
    a1.pieces = {}
    a1.feet = {}
    local v2 = function(a3, a4, a5)
        --[[
          line: 51
          upvalues:
            makeSmoothPart_upv_1 (copy, index: 1)
            a2 (copy, index: 2)
            u1 (copy, index: 3)
            a1 (copy, index: 4)
        ]]
        local v3 = makeSmoothPart_upv_1(a2)
        v3.CFrame = u1
        table.insert(a1.pieces, {part = v3, offset = CFrame.new(a3, a4, a5)})
        return v3
    end
    a1.body = v2(0, 0.05, 0)
    a1.body.Color = u2
    a1.body.Size = Vector3.new(2.0999999046325684, 2.299999952316284, 1.7000000476837158)
    a1.body.TopSurface = Enum.SurfaceType.Studs
    a1.belly = v2(0, -0.2, 0.88)
    a1.belly.Color = u3
    a1.belly.Size = Vector3.new(1.399999976158142, 1.5, 0.20000000298023224)
    local tbl_3 = {0.66, 0.54}
    for v4 = 0, 1 do
        local v5 = ((v4 ~= 0) and 1) or -1
        local v6 = tbl_3[v4 + 1]
        local v7 = v2(v5 * 0.42, 0.62, 0.98)
        v7.Color = u6
        v7.Size = Vector3.new(v6, v6 * 1.15, 0.18)
        local v8 = v2(v5 * 0.44, 0.6, 1.1)
        v8.Color = u7
        v8.Size = Vector3.new(0.23999999463558197, 0.2800000011920929, 0.11999999731779099)
        local v9 = v2(v5 * 0.66, 0.14, 0.99)
        v9.Color = u9
        v9.Size = Vector3.new(0.2800000011920929, 0.18000000715255737, 0.11999999731779099)
    end
    local v10 = v2(0, 0.18, 0.99)
    v10.Color = u8
    v10.Size = Vector3.new(0.5, 0.14000000059604645, 0.11999999731779099)
    local v11 = v2(0, 1.5, 0.15)
    v11.Color = u4
    v11.Size = Vector3.new(0.550000011920929, 0.949999988079071, 0.550000011920929)
    local v4 = v2(0, 2, 0.15)
    v4.Color = u5
    v4.Size = Vector3.new(0.699999988079071, 0.18000000715255737, 0.699999988079071)
    local tbl_4 = {Vector3.new(-0.550000011920929, -0.949999988079071, 0.4000000059604645), Vector3.new(0.550000011920929, -0.949999988079071, 0.4000000059604645), Vector3.new(-0.800000011920929, -1, -0.30000001192092896), Vector3.new(0.800000011920929, -1, -0.30000001192092896)}
    for n_1 = 0, #tbl_4 - 1 do
        local v12 = makeSmoothPart_upv_1(a2)
        v12.CFrame = u1
        v12.Color = u4
        v12.Size = Vector3.new(0.550000011920929, 0.5, 0.800000011920929)
        local feet_1 = a1.feet
        local tbl_5 = {}
        tbl_5.part = v12
        tbl_5.hinge = CFrame.new(tbl_4[n_1 + 1])
        if n_1 % 2 ~= 0 or n_1 % 2 == 0 then
            tbl_5.side = -1
            table.insert(feet_1, tbl_5)
        end
    end
end
u11.pose = function(a1, a2, a3, a4)
    --[[
      name: pose
      line: 114
      upvalues:
        u10 (copy, index: 1)
    ]]
    local v13 = math.min(math.abs(a3) * 0.0035, 0.2)
    local v14 = 1 - v13 * 0.45
    local v15 = v13 + 1
    a1.body.Size = Vector3.new(v14 * 2.0999999046325684, v15 * 2.299999952316284, v14 * 1.7000000476837158)
    a1.belly.Size = Vector3.new(v14 * 1.399999976158142, v15 * 1.5, 0.20000000298023224)
    for _, value_1 in a1.pieces do
        value_1.part.CFrame = a2 * value_1.offset
    end
    local v16 = math.clamp(a3 * -0.45, -28, 28)
    for _, value_2 in a1.feet do
        value_2.part.CFrame = ((a2 * value_2.hinge) * CFrame.Angles(math.rad(v16 + (math.sin(a4 * 9) * 5 * value_2.side)), 0, 0)) * u10
    end
end
u11.park = function(a1)
    --[[
      name: park
      line: 134
      upvalues:
        u1 (copy, index: 1)
    ]]
    local _ = nil
    local v1 = nil
    for v2, value_3 in a1.pieces do
        value_3.part.CFrame = u1
    end
    for v3, value_4 in a1.feet do
        value_4.part.CFrame = u1
    end
end
local tbl_6 = {}
tbl_6.DoodlerRig = u11
return tbl_6