-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = Vector2.new(0.5, 0.5)
local u2 = Instance.new("ImageLabel")
u2.BackgroundTransparency = 1
u2.AnchorPoint = u1
u2.BorderSizePixel = 0
local u3 = Instance.new("Frame")
u3.BorderSizePixel = 0
u3.Size = UDim2.new(0, 4, 0, 4)
u3.BackgroundColor3 = Color3.new(1, 1, 1)
local function draw2d(a1)
    --[[
      name: draw2d
      line: 18
      upvalues:
        u3 (copy, index: 1)
    ]]
    local v1 = u3:Clone()
    for key_1, value_1 in next, a1 do
        v1[key_1] = value_1
    end
    return v1
end
local function line2d(a1, a2, a3)
    --[[
      name: line2d
      line: 35
      upvalues:
        u1 (copy, index: 1)
        u3 (copy, index: 2)
    ]]
    local v2 = a2 - a1
    local v3 = (a1 + a2) / 2
    local tbl_1 = {}
    tbl_1.AnchorPoint = u1
    tbl_1.Position = UDim2.new(0, v3.x, 0, v3.y)
    tbl_1.Size = UDim2.new(0, 1, 0, v2.magnitude)
    tbl_1.Rotation = math.deg(math.atan2(v2.y, v2.x)) - 90
    tbl_1.BackgroundColor3 = Color3.new(1, 1, 0)
    tbl_1.Parent = a3
    local v4 = u3:Clone()
    for key_2, value_2 in next, tbl_1 do
        v4[key_2] = value_2
    end
    return v4
end
local u4 = Instance.new("WedgePart")
u4.Material = Enum.Material.SmoothPlastic
u4.Anchored = true
u4.CanCollide = false
local v5 = Instance.new("SpecialMesh")
v5.MeshType = Enum.MeshType.Wedge
v5.Scale = Vector3.new(1, 1, 1)
local u5 = Instance.new("Part")
u5.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
u5.Anchored = true
u5.CanCollide = false
u5.TopSurface = Enum.SurfaceType.Smooth
u5.BottomSurface = Enum.SurfaceType.Smooth
u5.Material = Enum.Material.SmoothPlastic
local u6 = Instance.new("SpecialMesh")
u6.MeshType = Enum.MeshType.Brick
u6.Scale = Vector3.new(0.20000000298023224, 0.20000000298023224, 1)
local function draw3d(a1)
    --[[
      name: draw3d
      line: 115
      upvalues:
        u5 (copy, index: 1)
    ]]
    local v6 = u5:Clone()
    for key_3, value_3 in next, a1 do
        v6[key_3] = value_3
    end
    return v6
end
local function line3d(a1, a2, a3, a4)
    --[[
      name: line3d
      line: 132
      upvalues:
        u5 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    local v7 = a4 or (Color3.new(1, 1, 0))
    local tbl_2 = {}
    tbl_2.CFrame = CFrame.new((a1 + a2) / 2, a2)
    tbl_2.Size = Vector3.new(0.2, 0.2, (a2 - a1).magnitude)
    tbl_2.Color = v7
    tbl_2.Parent = a3
    local v8 = u5:Clone()
    for key_4, value_4 in next, tbl_2 do
        v8[key_4] = value_4
    end
    u6:Clone().Parent = v8
    return v8
end
local tbl_3 = {}
tbl_3.triangle = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: triangle3d
      line: 177
      upvalues:
        u4 (copy, index: 1)
    ]]
    local v9 = a2 - a1
    local v10 = a3 - a1
    local v11 = a3 - a2
    local v12 = v9:Dot(v9)
    local v13 = v10:Dot(v10)
    local v14 = v11:Dot(v11)
    if v13 >= v12 or v14 >= v12 then
        if v14 < v13 and v12 < v13 then
            a2, a1 = a1, a2
        end
    else
        a1, a3 = a3, a1
    end
    local v15 = a2 - a1
    local v16 = a3 - a1
    v11 = a3 - a2
    local unit_1 = v16:Cross(v15).unit
    local unit_2 = v11:Cross(unit_1).unit
    local unit_3 = v11.unit
    local v17 = math.abs(v15:Dot(unit_2))
    local v18 = math.abs(v15:Dot(unit_3))
    local v19 = math.abs(v16:Dot(unit_3))
    local v20 = a5 or (u4:Clone())
    v20.Size = Vector3.new(0.05, v17, v18)
    v20.CFrame = CFrame.fromMatrix((a1 + a2) / 2, unit_1, unit_2, unit_3)
    v20.Parent = a4
    local v21 = a6 or (u4:Clone())
    v21.Size = Vector3.new(0.05, v17, v19)
    v21.CFrame = CFrame.fromMatrix((a1 + a3) / 2, -unit_1, unit_2, -unit_3)
    v21.Parent = a4
    return v20, v21
end
tbl_3.point = function(a1, a2, a3)
    --[[
      name: point3d
      line: 123
      upvalues:
        u5 (copy, index: 1)
    ]]
    local v22 = a3 or (Color3.new(0, 1, 0))
    local tbl_4 = {Color = 0, CFrame = 0, Parent = 0}
    tbl_4.CFrame = typeof(a1) == "CFrame" and a1 or CFrame.new(a1)
    tbl_4.Color = v22
    tbl_4.Parent = a2
    local v24 = u5:Clone()
    for key_5, value_5 in next, tbl_4 do
        v24[key_5] = value_5
    end
    return v24
end
tbl_3.line = line3d
tbl_3.ray = function(a1, a2, a3, a4)
    --[[
      name: ray3d
      line: 144
      upvalues:
        line3d (copy, index: 1)
    ]]
    return (line3d(a1, a1 + a2, a3, a4))
end
tbl_3.cframe = function(a1, a2, a3)
    --[[
      name: cframe3d
      line: 148
      upvalues:
        u5 (copy, index: 1)
    ]]
    local v25 = a3 or (Color3.new(1, 0, 0))
    a3 = v25
    local v26 = a1.p + a1.rightVector
    local tbl_5 = {Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 1)}
    tbl_5.CFrame = CFrame.new((a1.p + v26) / 2, v26)
    tbl_5.Color = a3
    tbl_5.Parent = a2
    local v27 = u5:Clone()
    for key_6, value_6 in next, tbl_5 do
        v27[key_6] = value_6
    end
    local v28 = a1.p + a1.upVector
    local tbl_6 = {Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 1)}
    tbl_6.CFrame = CFrame.new((a1.p + v28) / 2, v28)
    tbl_6.Color = Color3.new(0, 1, 0)
    tbl_6.Parent = a2
    local v29 = u5:Clone()
    for key_7, value_7 in next, tbl_6 do
        v29[key_7] = value_7
    end
    local v30 = a1.p - a1.lookVector
    local tbl_7 = {Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 1)}
    tbl_7.CFrame = CFrame.new((a1.p + v30) / 2, v30)
    tbl_7.Color = Color3.new(0, 0, 1)
    tbl_7.Parent = a2
    local v31 = u5:Clone()
    for key_8, value_8 in next, tbl_7 do
        v31[key_8] = value_8
    end
    return v27, v29, v31
end
function tbl_3.triangle2d(a1, a2, a3, a4, a5, a6)
    --[[
      name: triangle2d
      line: 52
      upvalues:
        u2 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v32 = a2 - a1
    local v33 = a3 - a1
    local v34 = a3 - a2
    local v35 = v32:Dot(v32)
    local v36 = v33:Dot(v33)
    local v37 = v34:Dot(v34)
    if v36 >= v35 or v37 >= v35 then
        if v37 < v36 and v35 < v36 then
            a2, a1 = a1, a2
        end
    else
        a1, a3 = a3, a1
    end
    local v38 = a2 - a1
    local unit_4 = (a3 - a2).unit
    local v39 = unit_4:Cross(v38)
    local v40 = v39 >= 0
    local v41 = math.deg(math.atan2(unit_4.y, unit_4.x))
    local v42
    if v40 then
        v42 = 0
    else
        v42 = 180
    end
    local v43 = v41 + v42
    local v44 = (a1 + a2) / 2
    local v45 = (a1 + a3) / 2
    local v46 = a5 or (u2:Clone())
    v46.Image = (v40 and "rbxassetid://2798177521") or "rbxassetid://2798177955"
    v46.AnchorPoint = u1
    v46.Size = UDim2.new(0, math.abs(unit_4:Dot(v38)), 0, v39)
    v46.Position = UDim2.new(0, v44.x, 0, v44.y)
    v46.Rotation = v43
    v46.Parent = a4
    local v47 = a6 or (u2:Clone())
    v47.Image = (v40 and "rbxassetid://2798177955") or "rbxassetid://2798177521"
    v47.AnchorPoint = u1
    v47.Size = UDim2.new(0, math.abs(unit_4:Dot(a3 - a1)), 0, v39)
    v47.Position = UDim2.new(0, v45.x, 0, v45.y)
    v47.Rotation = v43
    v47.Parent = a4
    return v46, v47
end
function tbl_3.point2d(a1, a2)
    --[[
      name: point2d
      line: 26
      upvalues:
        u1 (copy, index: 1)
        u3 (copy, index: 2)
    ]]
    local tbl_8 = {}
    tbl_8.AnchorPoint = u1
    tbl_8.Position = UDim2.new(0, a1.x, 0, a1.y)
    tbl_8.BackgroundColor3 = Color3.new(0, 1, 0)
    tbl_8.Parent = a2
    local v48 = u3:Clone()
    for key_9, value_9 in next, tbl_8 do
        v48[key_9] = value_9
    end
    return v48
end
tbl_3.line2d = line2d
function tbl_3.ray2d(a1, a2, a3)
    --[[
      name: ray2d
      line: 48
      upvalues:
        line2d (copy, index: 1)
    ]]
    return (line2d(a1, a1 + a2, a3))
end
return tbl_3