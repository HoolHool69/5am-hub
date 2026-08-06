-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local tbl_1 = {}
tbl_1.ambient = Color3.fromRGB(70, 70, 70)
tbl_1.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local function isPlainBlock_upv_1(a1)
    --[[
      name: isPlainBlock
      line: 50
    ]]
    local v1 = 0
    for _, value_1 in a1:GetDescendants() do
        if not (value_1:IsA("MeshPart")) and not (value_1:IsA("SpecialMesh")) then
            v1 = (value_1:IsA("BasePart") and (v1 + 1)) or v1
            if v1 <= 1 then
                continue
            end
            return false
        end
        return false
    end
    return v1 == 1
end
local worldBounds_upv_1 = {}
local stretchAlongAxis_upv_1 = {}
stretchAlongAxis_upv_1.__tostring = function()
    --[[
      name: __tostring
      line: 77
    ]]
    return "CrossyRoadAssets"
end
local u1 = setmetatable(worldBounds_upv_1, stretchAlongAxis_upv_1)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 82
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 86
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    a1.templates = {}
    local v3 = waitForSceneryRoot_upv_1("CrossyRoad", "CrossyRoad")
    if v3 ~= nil then
        a1.available = true
        a1.lighting = v3:FindFirstChild("Lighting")
        a1:indexModels(v3)
        for _, value_2 in v3:GetChildren() do
            if value_2:IsA("Folder") then
                a1:indexModels(value_2)
            end
        end
    else
        a1.available = false
        return nil
    end
end
u1.indexModels = function(a1, a2)
    --[[
      name: indexModels
      line: 102
    ]]
    local v4 = nil
    local v5 = nil
    for _, value_3 in a2:GetChildren() do
        if not (value_3:IsA("Model")) then
            continue
        end
        v4 = value_3.Name
        v5 = 2
        while a1.templates[v4] ~= nil do
            v4 = ("%*_%*"):format(value_3.Name, v5)
            v5 = v5 + 1
        end
        a1.templates[v4] = value_3
    end
end
u1.template = function(a1, a2)
    --[[
      name: template
      line: 123
    ]]
    return a1.templates[a2]
end
local function hasVisibleGeometry_upv_1(a1)
    --[[
      name: hasVisibleGeometry
      line: 38
    ]]
    for _, value_4 in a1:GetDescendants() do
        if not (value_4:IsA("BasePart")) or value_4.Transparency >= 1 then
            continue
        end
        return true
    end
    return false
end
u1.variants = function(a1, a2)
    --[[
      name: variants
      line: 128
      upvalues:
        hasVisibleGeometry_upv_1 (copy, index: 1)
        isPlainBlock_upv_1 (copy, index: 2)
    ]]
    local tbl_2 = {}
    for v6, value_5 in a1.templates do
        if string.find(v6, a2, 1, true) == nil then
            continue
        end
        if hasVisibleGeometry_upv_1(value_5) then
            table.insert(tbl_2, value_5)
        end
    end
    local tbl_3 = {}
    local v7 = 0
    for _, value_6 in tbl_2 do
        if not isPlainBlock_upv_1(value_6) then
            v7 = v7 + 1
            tbl_3[v7] = value_6
        end
    end
    local v6
    if #tbl_3 <= 0 then
        v6 = tbl_2
    else
        v6 = tbl_3
    end
    table.sort(
        v6,
        function(a3, a4)
            --[[
              line: 156
            ]]
            return a3.Name < a4.Name
        end
    )
    return v6
end
u1.first = function(a1, a2)
    --[[
      name: first
      line: 161
    ]]
    return a1:variants(a2)[1]
end
local function partWorldExtents_upv_1(a1)
    --[[
      name: partWorldExtents
      line: 166
    ]]
    local CFrame_1 = a1.CFrame
    local v8 = a1.Size * 0.5
    return (Vector3.new(((math.abs(CFrame_1.RightVector.X) * v8.X) + (math.abs(CFrame_1.UpVector.X) * v8.Y)) + (math.abs(CFrame_1.LookVector.X) * v8.Z), ((math.abs(CFrame_1.RightVector.Y) * v8.X) + (math.abs(CFrame_1.UpVector.Y) * v8.Y)) + (math.abs(CFrame_1.LookVector.Y) * v8.Z), ((math.abs(CFrame_1.RightVector.Z) * v8.X) + (math.abs(CFrame_1.UpVector.Z) * v8.Y)) + (math.abs(CFrame_1.LookVector.Z) * v8.Z)))
end
stretchAlongAxis_upv_1 = function(a1, a2, a3)
    --[[
      name: stretchAlongAxis
      line: 207
    ]]
    local Position_1 = a1:GetPivot().Position
    local v9 = nil
    local v10 = nil
    local v11 = nil
    local v12 = nil
    for _, value_7 in a1:GetDescendants() do
        if not (value_7:IsA("BasePart")) then
            continue
        end
        value_7.Position = value_7.Position + (a2 * ((value_7.Position - Position_1):Dot(a2) * (a3 - 1)))
        v9 = value_7.Size
        v10 = math.abs(value_7.CFrame.RightVector:Dot(a2))
        v11 = math.abs(value_7.CFrame.UpVector:Dot(a2))
        v12 = math.abs(value_7.CFrame.LookVector:Dot(a2))
        if v11 > v10 or v12 > v10 then
            if v12 > v11 then
                value_7.Size = Vector3.new(v9.X, v9.Y, v9.Z * a3)
            else
                value_7.Size = Vector3.new(v9.X, v9.Y * a3, v9.Z)
            end
        else
            value_7.Size = Vector3.new(v9.X * a3, v9.Y, v9.Z)
        end
    end
end
local function stretchAlongLongAxis_1(a1, a2)
    --[[
      name: stretchAlongLongAxis
      line: 235
      upvalues:
        stretchAlongAxis_upv_1 (copy, index: 1)
    ]]
    local v13, v14 = a1:GetBoundingBox()
    local v15
    if v14.Z > v14.X then
        v15 = v13.ZVector
    else
        v15 = v13.XVector
    end
    stretchAlongAxis_upv_1(a1, v15, a2)
end
worldBounds_upv_1 = function(a1)
    --[[
      name: worldBounds
      line: 175
      upvalues:
        partWorldExtents_upv_1 (copy, index: 1)
    ]]
    local v16 = nil
    local v17 = nil
    local v18 = nil
    local v19 = nil
    local v20 = nil
    local Position_2 = nil
    local v21 = nil
    for _, value_8 in a1:GetDescendants() do
        v21 = value_8:IsA("BasePart")
        if not (v21) then
            continue
        end
        v20 = partWorldExtents_upv_1(value_8)
        Position_2 = value_8.Position
        v18 = Position_2 - v20
        v19 = Position_2 + v20
        if v16 ~= nil then
            v16 = Vector3.new(math.min(v16.X, v18.X), math.min(v16.Y, v18.Y), math.min(v16.Z, v18.Z))
        else
            v16 = v18
        end
        if v17 ~= nil then
            v17 = Vector3.new(math.max(v17.X, v19.X), math.max(v17.Y, v19.Y), math.max(v17.Z, v19.Z))
        else
            v17 = v19
        end
    end
    if v16 ~= nil and v17 ~= nil then
        local tbl_4 = {}
        tbl_4.min = v16
        tbl_4.max = v17
        return tbl_4
    end
    return nil
end
local function footprintFitScale_1(a1, a2)
    --[[
      name: footprintFitScale
      line: 246
      upvalues:
        worldBounds_upv_1 (copy, index: 1)
    ]]
    local v22 = worldBounds_upv_1(a1)
    local v23 = nil
    if v22 ~= nil then
        v23 = math.max(v22.max.X - v22.min.X, v22.max.Z - v22.min.Z)
        if v23 > a2 and v23 > 0 then
            return a2 / v23
        end
    end
    return 1
end
local function isBodyColorPart_1(a1, a2)
    --[[
      name: isBodyColorPart
      line: 264
    ]]
    local v24 = a1
    while v24 ~= nil do
        if v24.Name == "BodyColor" then
            return true
        elseif v24 == a2 then
            break
        else
            v24 = v24.Parent
        end
    end
    return false
end
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 289
    ]]
    return "AuthoredProp"
end
local u2 = setmetatable(tbl_5, tbl_6)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 294
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v25 = setmetatable({}, u2)
    return v25:constructor(...) or v25
end
u2.constructor = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: constructor
      line: 298
    ]]
    a1.model = a2
    a1.tintParts = a3
    a1.orient = a4
    a1.groundLift = a5
    a1.centerOffset = a6
end
u2.make = function(a1, a2, a3, a4)
    --[[
      name: make
      line: 305
      upvalues:
        worldBounds_upv_1 (copy, index: 1)
        stretchAlongAxis_upv_1 (copy, index: 2)
        u2 (ref,  index: 3)
    ]]
    local v26 = a2:Clone()
    if a4.fitFootprint ~= nil or a4.centerHorizontally == true then
        v26:PivotTo(a4.orient)
    end
    local v27 = a4.scale
    if v27 == nil then
        v27 = 1
    end
    if v27 ~= 1 then
        v26:ScaleTo(v26:GetScale() * v27)
    end
    local v28 = nil
    local v32 = nil
    if a4.fitFootprint ~= nil then
        local fitFootprint_1 = a4.fitFootprint
        v28 = worldBounds_upv_1(v26)
        local v30
        if v28 ~= nil then
            v32 = math.max(v28.max.X - v28.min.X, v28.max.Z - v28.min.Z)
            if v32 <= fitFootprint_1 or v32 <= 0 then
                v30 = 1
            else
                v30 = fitFootprint_1 / v32
            end
        else
            v30 = 1
        end
        if v30 < 1 then
            v26:ScaleTo(v26:GetScale() * v30)
            if a4.preserveHeight == true then
                stretchAlongAxis_upv_1(v26, Vector3.new(0, 1, 0), 1 / v30)
            end
        end
    end
    local v31 = a4.lengthStretch
    if v31 == nil then
        v31 = 1
    end
    if v31 ~= 1 then
        local v33, v32 = v26:GetBoundingBox()
        local v34
        if v32.Z > v32.X then
            v34 = v33.ZVector
        else
            v34 = v33.XVector
        end
        stretchAlongAxis_upv_1(v26, v34, v31)
    end
    local tbl_7 = {}
    local PrimaryPart_1 = v26.PrimaryPart
    v32 = PrimaryPart_1
    local v35 = nil
    local v36 = nil
    for key_1, value_9 in v26:GetDescendants() do
        v36 = value_9:IsA("BasePart")
        if not (v36) then
            continue
        end
        value_9.Anchored = true
        value_9.CanCollide = false
        value_9.CanQuery = false
        value_9.CanTouch = false
        value_9.CastShadow = false
        if v32 == nil then
            v32 = value_9
        end
        v35 = value_9
        while v35 ~= nil do
            if v35.Name == "BodyColor" then
                v36 = true
            elseif v35 == v26 then
                break
            else
                v35 = v35.Parent
                continue
            end
            if v36 or not v36 then
                break
            end
        end
        v36 = false
    end
    if #tbl_7 == 0 and v32 ~= nil then
        table.insert(tbl_7, v32)
    end
    local v37, v38 = v26:GetBoundingBox()
    local v39 = v26:GetPivot()
    local key_1 = Vector3.new(0, v39.Y - (v37.Y - (v38.Y / 2)), 0)
    local value_9 = ((a4.centerHorizontally ~= true) and Vector3.new(0, 0, 0)) or (Vector3.new(v39.X - v37.X, 0, v39.Z - v37.Z))
    v26.Parent = a3
    return u2.new(v26, tbl_7, a4.orient, key_1, value_9)
end
u2.pose = function(a1, a2)
    --[[
      name: pose
      line: 381
    ]]
    a1.model:PivotTo((a2 * a1.orient) + a1.centerOffset)
end
u2.poseOnGround = function(a1, a2)
    --[[
      name: poseOnGround
      line: 388
    ]]
    a1.model:PivotTo(((a2 * a1.orient) + a1.centerOffset) + a1.groundLift)
end
u2.setColor = function(a1, a2)
    --[[
      name: setColor
      line: 396
    ]]
    for _, value_10 in a1.tintParts do
        if value_10:IsA("PartOperation") then
            value_10.UsePartColor = true
        end
        value_10.Color = a2
    end
end
u2.destroy = function(a1)
    --[[
      name: destroy
      line: 404
    ]]
    a1.model:Destroy()
end
local tbl_8 = {}
local tbl_9 = {}
tbl_9.__tostring = function()
    --[[
      name: __tostring
      line: 421
    ]]
    return "LaneSkin"
end
local u3 = setmetatable(tbl_8, tbl_9)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 426
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v40 = setmetatable({}, u3)
    return v40:constructor(...) or v40
end
u3.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 430
    ]]
    a1.model = a2
    a1.pivotOffset = a3
    a1.rotation = a4
    a1.flashed = false
    a1.height = a5
end
u3.make = function(a1, a2, a3)
    --[[
      name: make
      line: 437
      upvalues:
        worldBounds_upv_1 (copy, index: 1)
        u3 (ref,  index: 2)
    ]]
    local v41 = a2:Clone()
    for v42, value_11 in v41:GetDescendants() do
        if value_11:IsA("BasePart") then
            value_11.Anchored = true
            value_11.CanCollide = false
            value_11.CanQuery = false
            value_11.CanTouch = false
        end
    end
    local v43 = worldBounds_upv_1(v41)
    if v43 ~= nil then
        local v44 = v41:GetPivot()
        local v42 = u3.new(v41, v44.Position - Vector3.new((v43.min.X + v43.max.X) / 2, v43.min.Y, (v43.min.Z + v43.max.Z) / 2), v44.Rotation, v43.max.Y - v43.min.Y)
        v41.Parent = a3
        return v42
    end
    v41:Destroy()
    return nil
end
u3.poseAt = function(a1, a2, a3, a4)
    --[[
      name: poseAt
      line: 459
    ]]
    a1.model:PivotTo(CFrame.new(Vector3.new(a2, a3, a4) + a1.pivotOffset) * a1.rotation)
end
u3.flash = function(a1, a2)
    --[[
      name: flash
      line: 468
    ]]
    if a1.flashed then
        return nil
    end
    if a1.originalColors == nil then
        a1.originalColors = {}
        for _, value_12 in a1.model:GetDescendants() do
            if value_12:IsA("BasePart") then
                a1.originalColors[value_12] = value_12.Color
            end
        end
    end
    for key_2 in a1.originalColors do
        key_2.Color = a2
    end
    a1.flashed = true
end
u3.resetColors = function(a1)
    --[[
      name: resetColors
      line: 487
    ]]
    if a1.flashed and a1.originalColors ~= nil then
        for key_3, value_13 in a1.originalColors do
            key_3.Color = value_13
        end
        a1.flashed = false
    else
        return nil
    end
end
u3.destroy = function(a1)
    --[[
      name: destroy
      line: 496
    ]]
    a1.model:Destroy()
end
local tbl_10 = {}
tbl_10.CROSSY_ROAD_NOTE_SCALARS = tbl_1
tbl_10.CrossyRoadAssets = u1
tbl_10.AuthoredProp = u2
tbl_10.LaneSkin = u3
return tbl_10