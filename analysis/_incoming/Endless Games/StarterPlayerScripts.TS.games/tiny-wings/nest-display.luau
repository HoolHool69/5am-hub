-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local makeSmoothPart_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(144, 108, 53)
local u3 = Color3.fromRGB(100, 72, 34)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 18
    ]]
    return "NestDisplay"
end
local u4 = setmetatable(tbl_1, tbl_2)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 23
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u4)
    return v1:constructor(...) or v1
end
u4.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 27
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u3 (copy, index: 3)
    ]]
    local container_1 = a2.stage.container
    local v2 = a2.stage.origin + Vector3.new(a2.x, a2.y, 0)
    a1.outer = makeSmoothPart_upv_1(container_1)
    a1.outer.Shape = Enum.PartType.Cylinder
    a1.outer.Size = Vector3.new(1.100000023841858, 3.4000000953674316, 3.4000000953674316)
    a1.outer.CFrame = CFrame.new(v2) * CFrame.Angles(0, 0, 1.5707963267948966)
    a1.outer.Color = u2
    a1.inner = makeSmoothPart_upv_1(container_1)
    a1.inner.Shape = Enum.PartType.Cylinder
    a1.inner.Size = Vector3.new(0.8999999761581421, 2.5, 2.5)
    a1.inner.CFrame = CFrame.new(v2 + Vector3.new(0, 0.25, 0.05000000074505806)) * CFrame.Angles(0, 0, 1.5707963267948966)
    a1.inner.Color = u3
    a1.nestCenterCFrame = CFrame.new(v2)
    a1.authoredNest = a1:makeAuthoredNest(a2.nestTemplate, container_1)
    if a1.authoredNest == nil then
        return
    end
    a1.outer.Transparency = 1
    a1.inner.Transparency = 1
end
u4.setVisible = function(a1, a2)
    --[[
      name: setVisible
      line: 57
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.authoredNest == nil then
        a1.outer.Transparency = (a2 and 0) or 1
        a1.inner.Transparency = (a2 and 0) or 1
    else
        local authoredNest_1 = a1.authoredNest
        local v3
        if a2 then
            v3 = a1.nestCenterCFrame
        else
            v3 = u1
        end
        authoredNest_1:PivotTo(v3)
    end
end
u4.makeAuthoredNest = function(a1, a2, a3)
    --[[
      name: makeAuthoredNest
      line: 66
    ]]
    if a2 ~= nil then
        local v4 = a2:Clone()
        for _, value_1 in v4:GetDescendants() do
            if value_1:IsA("BasePart") then
                value_1.Anchored = true
                value_1.CanCollide = false
                value_1.CanQuery = false
                value_1.CanTouch = false
                value_1.CastShadow = false
            end
        end
        v4:PivotTo(a1.nestCenterCFrame)
        v4.Parent = a3
        return v4
    end
    return nil
end
local tbl_3 = {}
tbl_3.NestDisplay = u4
return tbl_3