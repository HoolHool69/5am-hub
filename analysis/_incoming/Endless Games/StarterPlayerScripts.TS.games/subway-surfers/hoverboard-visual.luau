-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local makeSmoothPart_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(72, 205, 255)
local u3 = Color3.fromRGB(150, 235, 255)
local tbl_upv_1 = {Vector3.new(9, 14, 4), Vector3.new(-9, 15, -3), Vector3.new(6, 17, -6), Vector3.new(-6, 12, 6), Vector3.new(11, 10, -2), Vector3.new(-11, 11, 2), Vector3.new(3, 19, 5), Vector3.new(-3, 18, -5)}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 25
    ]]
    return "HoverboardVisual"
end
local u4 = setmetatable(tbl_2, tbl_3)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 30
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u4)
    return v1:constructor(...) or v1
end
u4.constructor = function(a1)
    --[[
      name: constructor
      line: 34
    ]]
    a1.debris = {}
    a1.activeDebris = 0
end
u4.build = function(a1, a2)
    --[[
      name: build
      line: 38
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u1 (copy, index: 3)
        u3 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
    ]]
    a1.deck = makeSmoothPart_upv_1(a2)
    a1.deck.Color = u2
    a1.deck.Size = Vector3.new(3.4000000953674316, 0.30000001192092896, 1.7999999523162842)
    a1.deck.CFrame = u1
    a1.glow = makeSmoothPart_upv_1(a2)
    a1.glow.Material = Enum.Material.Neon
    a1.glow.Color = u3
    a1.glow.Size = Vector3.new(2.700000047683716, 0.14000000059604645, 1.350000023841858)
    a1.glow.CFrame = u1
    local v2 = Instance.new("Attachment")
    v2.Position = Vector3.new(-1.600000023841858, -0.10000000149011612, 0)
    v2.Parent = a1.deck
    local v3 = Instance.new("Attachment")
    v3.Position = Vector3.new(1.600000023841858, -0.10000000149011612, 0)
    v3.Parent = a1.deck
    local v4 = Instance.new("Trail")
    v4.Attachment0 = v2
    v4.Attachment1 = v3
    v4.Lifetime = 0.3
    v4.LightEmission = 1
    v4.Color = ColorSequence.new(u3)
    v4.Transparency = NumberSequence.new(0.35, 1)
    v4.FaceCamera = true
    v4.Enabled = false
    v4.Parent = a1.deck
    a1.trail = v4
    local v5 = nil
    for _, value_1 in tbl_upv_1 do
        v5 = makeSmoothPart_upv_1(a2)
        v5.Color = u2
        v5.Size = Vector3.new(0.800000011920929, 0.1599999964237213, 0.6000000238418579)
        v5.CFrame = u1
        table.insert(a1.debris, {part = v5, velocity = value_1})
    end
end
u4.setRiding = function(a1, a2)
    --[[
      name: setRiding
      line: 80
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.trail.Enabled = a2
    if (a2) then
        return
    end
    a1.deck.CFrame = u1
    a1.glow.CFrame = u1
end
u4.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 87
    ]]
    local v6 = a2 + Vector3.new(0, math.sin(os.clock() * 5) * 0.07 + 0.38, 0)
    a1.deck.CFrame = CFrame.new(v6) * CFrame.Angles(0, 0, a3)
    a1.glow.CFrame = CFrame.new(v6 - Vector3.new(0, 0.18000000715255737, 0)) * CFrame.Angles(0, 0, a3)
end
u4.shatter = function(a1, a2)
    --[[
      name: shatter
      line: 100
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v7 = a2 + Vector3.new(0, 0.6000000238418579, 0)
    for n_1 = 0, #a1.debris - 1 do
        local v8 = a1.debris[n_1 + 1]
        v8.life = 0.65
        v8.position = v7
        v8.velocity = tbl_upv_1[n_1 + 1]
        v8.part.Transparency = 0
        v8.part.CFrame = CFrame.new(v7)
    end
    a1.activeDebris = #a1.debris
end
u4.update = function(a1, a2)
    --[[
      name: update
      line: 114
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.activeDebris ~= 0 then
        for _, value_2 in a1.debris do
            if value_2.life <= 0 then
                continue
            end
            value_2.life = value_2.life - a2
            if value_2.life > 0 then
                value_2.velocity = value_2.velocity - (Vector3.new(0, 70, 0) * a2)
                value_2.position = value_2.position + (value_2.velocity * a2)
                local v9 = value_2.life * 12
                value_2.part.CFrame = CFrame.new(value_2.position) * CFrame.Angles(v9, v9 * 0.7, 0)
                value_2.part.Transparency = 1 - (value_2.life / 0.65)
            else
                value_2.part.CFrame = u1
                a1.activeDebris = a1.activeDebris - 1
            end
        end
    else
        return nil
    end
end
u4.reset = function(a1)
    --[[
      name: reset
      line: 143
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1:setRiding(false)
    for _, value_3 in a1.debris do
        value_3.life = 0
        value_3.part.CFrame = u1
        value_3.part.Transparency = 0
    end
    a1.activeDebris = 0
end
local tbl_4 = {}
tbl_4.HoverboardVisual = u4
return tbl_4