-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local tbl_upv_1 = {}
tbl_upv_1["01_Apple"] = Color3.fromRGB(232, 64, 58)
tbl_upv_1["02_Watermelon"] = Color3.fromRGB(236, 72, 86)
tbl_upv_1["03_Orange"] = Color3.fromRGB(245, 150, 40)
tbl_upv_1["04_Lemon"] = Color3.fromRGB(245, 214, 66)
tbl_upv_1["05_Lime"] = Color3.fromRGB(154, 210, 74)
tbl_upv_1["06_Grape"] = Color3.fromRGB(158, 86, 204)
tbl_upv_1["07_Guava"] = Color3.fromRGB(236, 120, 168)
tbl_upv_1["08_Blueberry"] = Color3.fromRGB(120, 150, 240)
tbl_upv_1.Pomegranate = Color3.fromRGB(186, 34, 58)
local u1 = Color3.fromRGB(236, 96, 96)
local function restOrientationFor_1(a1)
    --[[
      name: restOrientationFor
      line: 46
    ]]
    if math.max(a1.X, a1.Y) * 1.8 >= a1.Z then
        return CFrame.identity
    end
    return CFrame.Angles(0, 1.5707963267948966, 0)
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 97
    ]]
    return "FruitNinjaAssets"
end
local u2 = setmetatable(tbl_2, tbl_3)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 102
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
local function describe_upv_1(a1)
    --[[
      name: describe
      line: 53
      upvalues:
        tbl_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v2, v3 = a1:GetBoundingBox()
    local Half1_1 = a1:FindFirstChild("Half1")
    local Half2_1 = a1:FindFirstChild("Half2")
    local v4 = v2:Inverse()
    local tbl_4 = {}
    tbl_4.name = a1.Name
    tbl_4.whole = a1
    local _ = Half1_1 == nil or not (Half1_1:IsA("Model")) or Half1_1
    tbl_4.half1 = nil
    _ = Half2_1 == nil or not (Half2_1:IsA("Model")) or Half2_1
    tbl_4.half2 = nil
    local v5 = tbl_upv_1[a1.Name]
    _ = v5 or u1
    tbl_4.color = nil
    tbl_4.bboxSize = nil
    if math.max(v3.X, v3.Y) * 1.8 >= v3.Z then
        _ = CFrame.identity
    else
        _ = CFrame.Angles(0, 1.5707963267948966, 0)
    end
    tbl_4.restOrientation = nil
    if Half1_1 ~= nil and (Half1_1:IsA("Model")) then
        _ = v4 * Half1_1:GetPivot()
    else
        _ = CFrame.identity
    end
    tbl_4.half1Local = nil
    local v6
    if Half2_1 ~= nil and (Half2_1:IsA("Model")) then
        v6 = v4 * Half2_1:GetPivot()
    else
        v6 = CFrame.identity
    end
    tbl_4.half2Local = v6
    return tbl_4
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 106
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        describe_upv_1 (copy, index: 2)
    ]]
    a1.specials = {}
    local tbl_5 = {}
    a1.species = tbl_5
    local v7 = waitForSceneryRoot_upv_1("FruitNinjaGameplay", "fruit-ninja")
    local v8, v9, v10, v11 = nil, nil, nil, nil
    if v7 ~= nil then
        a1.available = true
        v8 = v7:FindFirstChild("Fruits")
        if v8 ~= nil then
            for _, value_1 in v8:GetChildren() do
                if not (value_1:IsA("Model")) then
                    continue
                end
                if string.match(value_1.Name, "^%d%d_") == nil then
                    a1.specials[value_1.Name] = describe_upv_1(value_1)
                else
                    table.insert(tbl_5, (describe_upv_1(value_1)))
                end
            end
            table.sort(
                tbl_5,
                function(a2, a3)
                    --[[
                      line: 134
                    ]]
                    return a2.name < a3.name
                end
            )
        end
        v9 = v7:FindFirstChild("Bananas")
        if v9 ~= nil then
            for _, value_2 in v9:GetChildren() do
                if value_2:IsA("Model") then
                    a1.specials[value_2.Name] = describe_upv_1(value_2)
                end
            end
        end
        v10 = v7:FindFirstChild("Bomb")
        if v10 ~= nil and v10:IsA("Model") then
            a1.specials[v10.Name] = describe_upv_1(v10)
        end
        v11 = v7:FindFirstChild("Heart")
        if v11 ~= nil and v11:IsA("Model") then
            a1.specials[v11.Name] = describe_upv_1(v11)
        end
    else
        a1.available = false
        return nil
    end
end
u2.special = function(a1, a2)
    --[[
      name: special
      line: 165
    ]]
    return a1.specials[a2]
end
local u3 = CFrame.new(0, -1000, 0)
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 184
    ]]
    return "AuthoredFruitVisual"
end
local u4 = setmetatable(tbl_6, tbl_7)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 189
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v12 = setmetatable({}, u4)
    return v12:constructor(...) or v12
end
u4.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 193
      upvalues:
        u3 (copy, index: 1)
    ]]
    if a4 == nil then
        a4 = CFrame.identity
    end
    a1.currentScale = 1
    local v13 = a2:Clone()
    local tbl_8 = {}
    for _, value_3 in v13:GetDescendants() do
        if value_3:IsA("BasePart") then
            value_3.Anchored = true
            value_3.CanCollide = false
            value_3.CanQuery = false
            value_3.CanTouch = false
            value_3.CastShadow = false
            continue
        end
        if value_3:IsA("ParticleEmitter") then
            value_3.Enabled = false
            table.insert(tbl_8, value_3)
        end
    end
    a1.baseScale = v13:GetScale()
    a1.restOrientation = a4
    v13:PivotTo(u3)
    v13.Parent = a3
    a1.model = v13
    a1.emitters = tbl_8
end
u4.pose = function(a1, a2)
    --[[
      name: pose
      line: 220
    ]]
    a1.model:PivotTo(a2 * a1.restOrientation)
end
u4.poseRaw = function(a1, a2)
    --[[
      name: poseRaw
      line: 226
    ]]
    a1.model:PivotTo(a2)
end
u4.setScale = function(a1, a2)
    --[[
      name: setScale
      line: 229
    ]]
    if math.abs(a2 - a1.currentScale) >= 0.001 then
        a1.currentScale = a2
        a1.model:ScaleTo(a1.baseScale * a2)
    else
        return nil
    end
end
u4.setEmittersEnabled = function(a1, a2)
    --[[
      name: setEmittersEnabled
      line: 236
    ]]
    for _, value_4 in a1.emitters do
        value_4.Enabled = a2
    end
end
u4.park = function(a1)
    --[[
      name: park
      line: 241
      upvalues:
        u3 (copy, index: 1)
    ]]
    a1:setEmittersEnabled(false)
    a1.model:PivotTo(u3)
end
local tbl_9 = {}
tbl_9.FruitNinjaAssets = u2
tbl_9.AuthoredFruitVisual = u4
return tbl_9