-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local u1 = CFrame.new(0, -1000, 0)
local u2 = CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(0, 0, 1), Vector3.new(0, -1, 0))
local u3 = CFrame.Angles(1.5707963267948966, 0, 0)
local function asModel_1(a1)
    --[[
      name: asModel
      line: 33
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
      line: 61
    ]]
    return "KnifeHitAssets"
end
local u4 = setmetatable(tbl_1, tbl_2)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 66
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u4)
    return v1:constructor(...) or v1
end
u4.constructor = function(a1)
    --[[
      name: constructor
      line: 70
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    a1.available = false
    a1.log = nil
    a1.knife = nil
    a1.apple = nil
    a1.backdrop = nil
    a1.lighting = nil
    local v2 = waitForSceneryRoot_upv_1("KnifeGame", "knife-hit")
    local v3, v4, v5, v6 = nil, nil, nil, nil
    if v2 ~= nil then
        v3 = v2:FindFirstChild("Log")
        local v7
        v7 = v3 == nil or not (v3:IsA("Model")) or v3
        a1.log = v7
        v4 = v2:FindFirstChild("Knife")
        v7 = v4 == nil or not (v4:IsA("Model")) or v4
        a1.knife = v7
        v5 = v2:FindFirstChild("01_Apple")
        v7 = v5 == nil or not (v5:IsA("Model")) or v5
        a1.apple = v7
        v6 = v2:FindFirstChild("BackdropFruitNinja")
        v7 = v6 == nil or not (v6:IsA("Model")) or v6
        a1.backdrop = v7
        a1.lighting = v2:FindFirstChild("Lighting")
        v7 = true
        if a1.log == nil then
            v7 = true
            if a1.knife == nil then
                v7 = a1.apple ~= nil
            end
        end
        a1.available = v7
    else
        return nil
    end
end
local function flattenToProp_upv_1(a1)
    --[[
      name: flattenToProp
      line: 37
    ]]
    for _, value_1 in a1:GetDescendants() do
        if value_1:IsA("BasePart") then
            value_1.Anchored = true
            value_1.CanCollide = false
            value_1.CanQuery = false
            value_1.CanTouch = false
            value_1.CastShadow = true
        end
    end
end
local flingDebris_upv_1 = {}
local parkDebris_upv_1 = {}
parkDebris_upv_1.__tostring = function()
    --[[
      name: __tostring
      line: 140
    ]]
    return "AuthoredKnifeVisual"
end
local u5 = setmetatable(flingDebris_upv_1, parkDebris_upv_1)
u5.__index = u5
u5.new = function(...)
    --[[
      name: new
      line: 145
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v8 = setmetatable({}, u5)
    return v8:constructor(...) or v8
end
u5.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 149
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v9 = a2:Clone()
    local _, v10 = v9:GetBoundingBox()
    flattenToProp_upv_1(v9)
    if v10.Y > 0.01 then
        v9:ScaleTo(v9:GetScale() * a4 / v10.Y)
    end
    v9:PivotTo(u1)
    v9.Parent = a3
    a1.model = v9
end
u5.follow = function(a1, a2)
    --[[
      name: follow
      line: 160
      upvalues:
        u2 (copy, index: 1)
    ]]
    a1.model:PivotTo(a2 * u2)
end
u5.park = function(a1)
    --[[
      name: park
      line: 163
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.model:PivotTo(u1)
end
flingDebris_upv_1 = function(a1, a2, a3, a4)
    --[[
      name: flingDebris
      line: 210
    ]]
    a1.model:PivotTo(a2)
    for _, value_2 in a1.model:GetDescendants() do
        if value_2:IsA("BasePart") then
            value_2.Anchored = false
        end
    end
    a1.root.AssemblyLinearVelocity = a3
    a1.root.AssemblyAngularVelocity = a4
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 240
    ]]
    return "AuthoredAppleVisual"
end
local u6 = setmetatable(tbl_3, tbl_4)
u6.__index = u6
u6.new = function(...)
    --[[
      name: new
      line: 245
      upvalues:
        u6 (ref, index: 1)
    ]]
    local v11 = setmetatable({}, u6)
    return v11:constructor(...) or v11
end
local function prepareDebris_upv_1(a1, a2, a3)
    --[[
      name: prepareDebris
      line: 169
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v12 = a1:Clone()
    local v13
    v13 = nil
    local v14 = nil
    for _, value_3 in v12:GetDescendants() do
        v14 = value_3:IsA("BasePart")
        if not (v14) then
            continue
        end
        value_3.CanCollide = false
        value_3.CanQuery = false
        value_3.CanTouch = false
        value_3.CastShadow = true
        value_3.Anchored = true
        if v13 == nil then
            v13 = value_3
        end
    end
    if v13 ~= nil then
        for _, value_4 in v12:GetDescendants() do
            if not (value_4:IsA("BasePart")) then
                continue
            end
            if value_4 ~= v13 then
                local v15 = Instance.new("WeldConstraint")
                v15.Part0 = v13
                v15.Part1 = value_4
                v15.Parent = v13
            end
        end
        v12.PrimaryPart = v13
        v12:PivotTo(u1)
        v12.Parent = a3
        local tbl_5 = {}
        tbl_5.model = v12
        tbl_5.root = v13
        tbl_5.localOffset = a2 * v13.CFrame
        return tbl_5
    end
    return nil
end
u6.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 249
      upvalues:
        u3 (copy, index: 1)
        flattenToProp_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        prepareDebris_upv_1 (copy, index: 4)
    ]]
    a1.rest = u3
    a1.tuning = a4
    local v16 = a2:GetPivot()
    local v17 = a2:GetBoundingBox()
    a1.centerOffset = (v16:Inverse() * v17).Position
    a1.whole = a2:Clone()
    flattenToProp_upv_1(a1.whole)
    a1.whole:PivotTo(u1)
    a1.whole.Parent = a3
    local v18 = v16:Inverse()
    local Half1_1 = a2:FindFirstChild("Half1")
    local Half2_1 = a2:FindFirstChild("Half2")
    local v19
    v19 = Half1_1 == nil or not (Half1_1:IsA("Model")) or prepareDebris_upv_1(Half1_1, v18, a3)
    a1.half1 = v19
    v19 = Half2_1 == nil or not (Half2_1:IsA("Model")) or prepareDebris_upv_1(Half2_1, v18, a3)
    a1.half2 = v19
end
u6.centeredPivot = function(a1, a2)
    --[[
      name: centeredPivot
      line: 265
    ]]
    return CFrame.new(a2 - (a1.rest * a1.centerOffset)) * a1.rest
end
u6.poseWhole = function(a1, a2)
    --[[
      name: poseWhole
      line: 273
    ]]
    a1.whole:PivotTo(a1:centeredPivot(a2))
end
u6.burst = function(a1, a2, a3)
    --[[
      name: burst
      line: 276
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.whole:PivotTo(u1)
    local v20 = a1:centeredPivot(a2)
    a1:flingHalf(a1.half1, v20, a3, 1)
    a1:flingHalf(a1.half2, v20, a3, -1)
end
u6.park = function(a1)
    --[[
      name: park
      line: 282
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.whole:PivotTo(u1)
    a1:parkHalf(a1.half1)
    a1:parkHalf(a1.half2)
end
u6.flingHalf = function(a1, a2, a3, a4, a5)
    --[[
      name: flingHalf
      line: 287
      upvalues:
        flingDebris_upv_1 (copy, index: 1)
    ]]
    if a2 ~= nil then
        flingDebris_upv_1(a2, a3 * a2.localOffset, (a4 * (a1.tuning.speed * a5)) + Vector3.new(0, a1.tuning.up, 0), (Vector3.new(0, 0, a1.tuning.spin * a5)))
    else
        return nil
    end
end
parkDebris_upv_1 = function(a1)
    --[[
      name: parkDebris
      line: 221
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_5 in a1.model:GetDescendants() do
        if value_5:IsA("BasePart") then
            value_5.Anchored = true
        end
    end
    a1.model:PivotTo(u1)
end
u6.parkHalf = function(a1, a2)
    --[[
      name: parkHalf
      line: 300
      upvalues:
        parkDebris_upv_1 (copy, index: 1)
    ]]
    if a2 ~= nil then
        parkDebris_upv_1(a2)
    else
        return nil
    end
end
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 319
    ]]
    return "AuthoredLogShatter"
end
local u7 = setmetatable(tbl_6, tbl_7)
u7.__index = u7
u7.new = function(...)
    --[[
      name: new
      line: 324
      upvalues:
        u7 (ref, index: 1)
    ]]
    local v21 = setmetatable({}, u7)
    return v21:constructor(...) or v21
end
u7.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 328
      upvalues:
        prepareDebris_upv_1 (copy, index: 1)
    ]]
    a1.pieces = {}
    a1.tuning = a5
    local v22 = a2:Clone()
    local _, v23 = v22:GetBoundingBox()
    local v24 = math.max(v23.Y, v23.Z)
    if v24 > 0.01 then
        v22:ScaleTo((v22:GetScale() * a4) / v24)
    end
    local v25 = v22:GetPivot():Inverse()
    local v26 = nil
    for v27, value_6 in v22:GetChildren() do
        if not (value_6:IsA("Model")) then
            continue
        end
        v26 = prepareDebris_upv_1(value_6, v25, a3)
        if v26 ~= nil then
            table.insert(a1.pieces, v26)
        end
    end
    v22:Destroy()
end
u7.isAvailable = function(a1)
    --[[
      name: isAvailable
      line: 352
    ]]
    return #a1.pieces ~= 0
end
u7.burst = function(a1, a2)
    --[[
      name: burst
      line: 355
      upvalues:
        flingDebris_upv_1 (copy, index: 1)
    ]]
    local v27 = nil
    local v28 = nil
    local v29 = nil
    local v30 = nil
    local v31 = nil
    for _, value_7 in a1.pieces do
        v27 = a2 * value_7.localOffset
        v28 = v27.Position - a2.Position
        v29 = Vector3.new(v28.X, v28.Y, 0)
        v30 = ((v29.Magnitude <= 0.05) and Vector3.new(0, 1, 0)) or (v29.Unit)
        if v30.X < 0 then
            v31 = a1.tuning.spin
        else
            v31 = -a1.tuning.spin
        end
        flingDebris_upv_1(value_7, v27, (v30 * a1.tuning.speed) + Vector3.new(0, a1.tuning.up, 0), (Vector3.new(0, 0, v31)))
    end
end
u7.park = function(a1)
    --[[
      name: park
      line: 374
      upvalues:
        parkDebris_upv_1 (copy, index: 1)
    ]]
    for _, value_8 in a1.pieces do
        parkDebris_upv_1(value_8)
    end
end
local tbl_8 = {}
tbl_8.cloneLogVisual = function(a1, a2, a3)
    --[[
      name: cloneLogVisual
      line: 111
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local _, v32 = a1:GetBoundingBox()
    local v33 = math.max(v32.Y, v32.Z)
    if v33 > 0.01 then
        if v33 * 0.15 >= math.abs(v32.Y - v32.Z) then
            local v34 = a1:Clone()
            flattenToProp_upv_1(v34)
            v34:ScaleTo((v34:GetScale() * a3) / v33)
            v34:PivotTo(u1)
            v34.Parent = a2
            return v34
        end
        warn(("[knife-hit] authored Log is not round (Y=%*, "):format(string.format("%.2f", v32.Y)) .. ("Z=%*) \226\128\148 parts are missing; using the procedural trunk"):format(string.format("%.2f", v32.Z)))
    else
        warn("[knife-hit] authored Log has no geometry \226\128\148 using the procedural trunk")
    end
    return nil
end
tbl_8.KNIFE_VISUAL_CORRECTION = u2
tbl_8.APPLE_DISPLAY_ROTATION = u3
tbl_8.KnifeHitAssets = u4
tbl_8.AuthoredKnifeVisual = u5
tbl_8.AuthoredAppleVisual = u6
tbl_8.AuthoredLogShatter = u7
return tbl_8