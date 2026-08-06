-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "scenery-assets").waitForSceneryRoot
local u1 = CFrame.new(0, -1000, 0)
local tbl_1 = {}
local partWorldExtents_upv_1 = {}
partWorldExtents_upv_1.__tostring = function()
    --[[
      name: __tostring
      line: 19
    ]]
    return "SceneryKit"
end
local u2 = setmetatable(tbl_1, partWorldExtents_upv_1)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 24
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 28
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    a1.templates = {}
    local v2 = waitForSceneryRoot_upv_1(a2, a3)
    if v2 ~= nil then
        a1.available = true
        a1.lighting = v2:FindFirstChild("Lighting")
        a1:indexModels(v2)
        local v3 = nil
        for _, value_1 in a4 do
            v3 = v2:FindFirstChild(value_1)
            if v3 ~= nil then
                a1:indexModels(v3)
            end
        end
    else
        a1.available = false
        return nil
    end
end
u2.indexModels = function(a1, a2)
    --[[
      name: indexModels
      line: 45
    ]]
    local value_2 = nil
    for _, value_2 in a2:GetChildren() do
        if value_2:IsA("Model") then
            a1.templates[value_2.Name] = value_2
        end
    end
end
u2.template = function(a1, a2)
    --[[
      name: template
      line: 54
    ]]
    return a1.templates[a2]
end
u2.has = function(a1, a2)
    --[[
      name: has
      line: 59
    ]]
    return a1.templates[a2] ~= nil
end
partWorldExtents_upv_1 = function(a1)
    --[[
      name: partWorldExtents
      line: 106
    ]]
    local CFrame_1 = a1.CFrame
    local v4 = a1.Size * 0.5
    return (Vector3.new(((math.abs(CFrame_1.RightVector.X) * v4.X) + (math.abs(CFrame_1.UpVector.X) * v4.Y)) + (math.abs(CFrame_1.LookVector.X) * v4.Z), ((math.abs(CFrame_1.RightVector.Y) * v4.X) + (math.abs(CFrame_1.UpVector.Y) * v4.Y)) + (math.abs(CFrame_1.LookVector.Y) * v4.Z), ((math.abs(CFrame_1.RightVector.Z) * v4.X) + (math.abs(CFrame_1.UpVector.Z) * v4.Y)) + (math.abs(CFrame_1.LookVector.Z) * v4.Z)))
end
local function translateModel_1(a1, a2)
    --[[
      name: translateModel
      line: 151
    ]]
    a1:PivotTo(a1:GetPivot() + a2)
end
local function modelWorldAabb_upv_1(a1)
    --[[
      name: modelWorldAabb
      line: 119
      upvalues:
        partWorldExtents_upv_1 (copy, index: 1)
    ]]
    local v5 = nil
    local v6 = nil
    local v7 = nil
    local v8 = nil
    local v9 = nil
    local Position_1 = nil
    local v10 = nil
    for _, value_3 in a1:GetDescendants() do
        v10 = value_3:IsA("BasePart")
        if not (v10) then
            continue
        end
        v9 = partWorldExtents_upv_1(value_3)
        Position_1 = value_3.Position
        v7 = Position_1 - v9
        v8 = Position_1 + v9
        if v5 ~= nil then
            v5 = Vector3.new(math.min(v5.X, v7.X), math.min(v5.Y, v7.Y), math.min(v5.Z, v7.Z))
        else
            v5 = v7
        end
        if v6 ~= nil then
            v6 = Vector3.new(math.max(v6.X, v8.X), math.max(v6.Y, v8.Y), math.max(v6.Z, v8.Z))
        else
            v6 = v8
        end
    end
    if v5 ~= nil and v6 ~= nil then
        local tbl_2 = {}
        tbl_2.min = v5
        tbl_2.max = v6
        tbl_2.center = (v5 + v6) / 2
        tbl_2.size = v6 - v5
        return tbl_2
    end
    return nil
end
local tbl_3 = {}
tbl_3.flattenKitPart = function(a1)
    --[[
      name: flattenKitPart
      line: 66
    ]]
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = false
end
tbl_3.cloneKitPart = function(a1, a2)
    --[[
      name: cloneKitPart
      line: 88
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1 ~= nil then
        local v11 = a1:Clone()
        local v12 = v11.PrimaryPart or (v11:FindFirstChildWhichIsA("BasePart", true))
        if v12 ~= nil then
            v12.Anchored = true
            v12.CanCollide = false
            v12.CanQuery = false
            v12.CanTouch = false
            v12.CastShadow = false
            v12.Parent = a2
            v12.CFrame = u1
            v11:Destroy()
            return v12
        end
        v11:Destroy()
    end
    return nil
end
tbl_3.modelWorldAabb = modelWorldAabb_upv_1
tbl_3.translateModel = translateModel_1
tbl_3.placeModelPoint = function(a1, a2, a3)
    --[[
      name: placeModelPoint
      line: 163
    ]]
    a1:PivotTo(a1:GetPivot() + (a3 - a2))
end
tbl_3.placeModelCenter = function(a1, a2)
    --[[
      name: placeModelCenter
      line: 175
      upvalues:
        modelWorldAabb_upv_1 (copy, index: 1)
    ]]
    local v13 = modelWorldAabb_upv_1(a1)
    if v13 ~= nil then
        a1:PivotTo(a1:GetPivot() + (a2 - v13.center))
        return true
    end
    return false
end
tbl_3.findLargestBasePart = function(a1)
    --[[
      name: findLargestBasePart
      line: 187
    ]]
    local v14 = nil
    local v15 = -1
    v14 = v14
    local v16 = nil
    local v17 = nil
    local v18 = nil
    for _, value_4 in a1:GetDescendants() do
        v18 = value_4:IsA("BasePart")
        if not (v18) then
            continue
        end
        v17 = value_4.Size
        v16 = v17.X * v17.Y * v17.Z
        if v15 < v16 then
            v15, v14 = v16, value_4
        end
    end
    return v14
end
tbl_3.fitModelExtent = function(a1, a2, a3)
    --[[
      name: fitModelExtent
      line: 211
      upvalues:
        modelWorldAabb_upv_1 (copy, index: 1)
    ]]
    local v19 = modelWorldAabb_upv_1(a1)
    if v19 ~= nil then
        local size_1 = v19.size
        local v20
        if a2 == "x" then
            v20 = size_1.X
        elseif a2 == "y" then
            v20 = size_1.Y
        elseif a2 ~= "z" then
            v20 = math.max(size_1.X, size_1.Y)
        else
            v20 = size_1.Z
        end
        if v20 >= 0.01 then
            local v21 = a3 / v20
            a1:ScaleTo(a1:GetScale() * v21)
            return v21
        end
    end
    return 1
end
tbl_3.cloneKitModel = function(a1, a2)
    --[[
      name: cloneKitModel
      line: 240
      upvalues:
        u1 (copy, index: 1)
        modelWorldAabb_upv_1 (copy, index: 2)
    ]]
    if a1 ~= nil then
        local v22 = a1:Clone()
        local v23 = false
        local v24 = nil
        for _, value_5 in v22:GetDescendants() do
            v24 = value_5:IsA("BasePart")
            if v24 then
                value_5.Anchored = true
                value_5.CanCollide = false
                value_5.CanQuery = false
                value_5.CanTouch = false
                value_5.CastShadow = false
                v23 = true
            end
        end
        local v25 = nil
        if v23 then
            v22.Parent = a2
            local Position_2 = u1.Position
            v25 = modelWorldAabb_upv_1(v22)
            if v25 ~= nil then
                v22:PivotTo(v22:GetPivot() + (Position_2 - v25.center))
            end
            return v22
        end
        v22:Destroy()
        warn((("[kit] %* has no BasePart \226\128\148 using procedural"):format(a1.Name)))
    end
    return nil
end
tbl_3.SceneryKit = u2
return tbl_3