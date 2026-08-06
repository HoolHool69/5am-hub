-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local Workspace_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u1 = false
local function studTemplate()
    --[[
      name: studTemplate
      line: 12
      upvalues:
        u1 (ref,  index: 1)
        Workspace_upv_1 (copy, index: 2)
        studTemplate (ref,  index: 3)
    ]]
    if not (u1) then
        u1 = true
        local v1 = Workspace_upv_1:FindFirstChild("Stud") or (Workspace_upv_1:FindFirstChild("stud"))
        local v2 = nil
        if v1 ~= nil then
            v2 = v1:IsA("Part")
            if v2 then
                studTemplate = v1
            end
        end
    end
    return studTemplate
end
local function makeStagePart_upv_1(a1)
    --[[
      name: makeStagePart
      line: 29
      upvalues:
        u1 (ref,  index: 1)
        Workspace_upv_1 (copy, index: 2)
        studTemplate (ref,  index: 3)
    ]]
    local v5 = nil
    if not (u1) then
        u1 = true
        v5 = Workspace_upv_1:FindFirstChild("Stud") or (Workspace_upv_1:FindFirstChild("stud"))
        local v4 = nil
        if v5 ~= nil then
            v4 = v5:IsA("Part")
            if v4 then
                studTemplate = v5
            end
        end
    end
    if studTemplate == nil then
        v5 = Instance.new("Part")
    else
        v5 = studTemplate:Clone()
    end
    for _, value_1 in v5:GetChildren() do
        value_1:Destroy()
    end
    v5.Anchored = true
    v5.CanCollide = false
    v5.CanQuery = false
    v5.CanTouch = false
    v5.CastShadow = false
    v5.Locked = false
    v5.Material = Enum.Material.Plastic
    v5.Transparency = 0
    v5.Reflectance = 0
    v5.Size = Vector3.new(1, 1, 1)
    v5.CFrame = CFrame.new(0, -1000, 0)
    v5.TopSurface = Enum.SurfaceType.Studs
    v5.BackSurface = Enum.SurfaceType.Studs
    v5.BottomSurface = Enum.SurfaceType.Weld
    v5.FrontSurface = Enum.SurfaceType.Weld
    v5.LeftSurface = Enum.SurfaceType.Smooth
    v5.RightSurface = Enum.SurfaceType.Smooth
    v5.Parent = a1
    return v5
end
local tbl_1 = {}
tbl_1.makeStagePart = makeStagePart_upv_1
tbl_1.makeSmoothPart = function(a1)
    --[[
      name: makeSmoothPart
      line: 58
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v6 = makeStagePart_upv_1(a1)
    v6.TopSurface = Enum.SurfaceType.Smooth
    v6.BackSurface = Enum.SurfaceType.Smooth
    v6.BottomSurface = Enum.SurfaceType.Smooth
    v6.FrontSurface = Enum.SurfaceType.Smooth
    return v6
end
tbl_1.makeEllipsoidPart = function(a1)
    --[[
      name: makeEllipsoidPart
      line: 72
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v7 = makeStagePart_upv_1(a1)
    v7.TopSurface = Enum.SurfaceType.Smooth
    v7.BackSurface = Enum.SurfaceType.Smooth
    v7.BottomSurface = Enum.SurfaceType.Smooth
    v7.FrontSurface = Enum.SurfaceType.Smooth
    local v8 = Instance.new("SpecialMesh")
    v8.MeshType = Enum.MeshType.Sphere
    v8.Parent = v7
    return v7
end
tbl_1.makeWedgePart = function(a1)
    --[[
      name: makeWedgePart
      line: 86
    ]]
    local v9 = Instance.new("WedgePart")
    v9.Anchored = true
    v9.CanCollide = false
    v9.CanQuery = false
    v9.CanTouch = false
    v9.CastShadow = false
    v9.Material = Enum.Material.Plastic
    v9.TopSurface = Enum.SurfaceType.Smooth
    v9.BottomSurface = Enum.SurfaceType.Smooth
    v9.CFrame = CFrame.new(0, -1000, 0)
    v9.Parent = a1
    return v9
end
tbl_1.makeFrontalBackdrop = function(a1, a2, a3)
    --[[
      name: makeFrontalBackdrop
      line: 107
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v10 = makeStagePart_upv_1(a1.container)
    v10.TopSurface = Enum.SurfaceType.Smooth
    v10.BackSurface = Enum.SurfaceType.Smooth
    v10.BottomSurface = Enum.SurfaceType.Smooth
    v10.FrontSurface = Enum.SurfaceType.Smooth
    v10.Material = a3 or (Enum.Material.Neon)
    v10.Color = a2
    v10.Size = Vector3.new(400, 240, 1)
    v10.CFrame = CFrame.new(a1.origin + Vector3.new(0, 0, -40))
    return v10
end
return tbl_1