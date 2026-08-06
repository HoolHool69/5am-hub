-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local u1 = CFrame.new(0, -1000, 0)
local function asModel_1(a1)
    --[[
      name: asModel
      line: 18
    ]]
    if a1 ~= nil and a1:IsA("Model") then
        return a1
    end
    return nil
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 44
    ]]
    return "BallzAssets"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 49
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u3)
    return v1:constructor(...) or v1
end
local function u2(a1)
    --[[
      name: constructor
      line: 53
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
    ]]
    a1.available = false
    a1.brick = nil
    a1.ball = nil
    a1.dot = nil
    a1.backdrop = nil
    a1.lighting = nil
    local v2 = waitForSceneryRoot_upv_1("Ballz", "ballz")
    local v3, v4, v5, v6 = nil, nil, nil, nil
    if v2 ~= nil then
        a1.available = true
        v3 = v2:FindFirstChild("Brick")
        local v7
        v7 = v3 == nil or not (v3:IsA("Model")) or v3
        a1.brick = v7
        v4 = v2:FindFirstChild("Ball")
        v7 = v4 == nil or not (v4:IsA("Model")) or v4
        a1.ball = v7
        v5 = v2:FindFirstChild("Dot")
        v7 = v5 == nil or not (v5:IsA("Model")) or v5
        a1.dot = v7
        v6 = v2:FindFirstChild("Backdrop")
        v7 = v6 == nil or not (v6:IsA("Model")) or v6
        a1.backdrop = v7
        a1.lighting = v2:FindFirstChild("Lighting")
        if a1.brick ~= nil then
            u2(a1.brick)
        end
    else
        return nil
    end
end
u3.constructor = u2
u2 = function(a1)
    --[[
      name: prepareBrickTemplate
      line: 84
      upvalues:
        markWorldArt_upv_1 (copy, index: 1)
    ]]
    local v8 = a1:FindFirstChild("HP", true)
    if v8 ~= nil then
        v8 = v8:FindFirstAncestorWhichIsA("SurfaceGui")
    end
    local v9 = nil
    if v8 ~= nil then
        v8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        markWorldArt_upv_1(v8)
        v9 = v8.Parent
        if v9 ~= nil and v9:IsA("BasePart") then
            a1.WorldPivot = CFrame.new(a1:GetPivot().Position) * v9.CFrame.Rotation
        end
    else
        return nil
    end
end
local function flattenToProp_upv_1(a1)
    --[[
      name: flattenToProp
      line: 22
    ]]
    for _, value_1 in a1:GetDescendants() do
        if value_1:IsA("BasePart") then
            value_1.Anchored = true
            value_1.CanCollide = false
            value_1.CanQuery = false
            value_1.CanTouch = false
            value_1.CastShadow = false
        end
    end
end
tbl_2 = {}
tbl_2.cloneFittedProp = function(a1, a2, a3)
    --[[
      name: cloneFittedProp
      line: 118
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v10 = a1:Clone()
    flattenToProp_upv_1(v10)
    local _, v11 = v10:GetBoundingBox()
    local v12 = math.max(v11.X, v11.Y)
    if v12 > 0.01 then
        v10:ScaleTo((v10:GetScale() * a3) / v12)
    end
    v10:PivotTo(u1)
    v10.Parent = a2
    return v10
end
tbl_2.findDominantPart = function(a1)
    --[[
      name: findDominantPart
      line: 137
    ]]
    local v13 = nil
    local v14 = 0
    v13 = v13
    local v15 = nil
    local v16 = nil
    local v17 = nil
    for _, value_2 in a1:GetDescendants() do
        v17 = value_2:IsA("BasePart")
        if not (v17) then
            continue
        end
        v16 = value_2.Size
        v15 = v16.X * v16.Y * v16.Z
        if v14 < v15 then
            v14, v13 = v15, value_2
        end
    end
    return v13
end
tbl_2.BallzAssets = u3
return tbl_2