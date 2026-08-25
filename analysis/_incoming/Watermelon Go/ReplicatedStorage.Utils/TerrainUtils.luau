-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
function tbl_upv_1.SaveFromPart(a1, a2)
    --[[
      name: SaveFromPart
      line: 3
    ]]
    local v1 = a1.Size / 2
    return SaveRegionFromMinMax(a1.Position - v1, a1.Position + v1, a2)
end
function tbl_upv_1.SaveFromArea(a1, a2, a3)
    --[[
      name: SaveFromArea
      line: 11
    ]]
    local v2 = (a1 + a2) / 2
    local v3 = Vector3.new(math.abs(a1.X - a2.X), math.abs(a1.Y - a2.Y), math.abs(a1.Z - a2.Z)) / 2
    return SaveRegionFromMinMax(v2 - v3, v2 + v3, a3)
end
function tbl_upv_1.LoadTerrainRelative(a1, a2, a3, a4)
    --[[
      name: LoadTerrainRelative
      line: 25
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local function ConvertVector(a5, a6, a7)
        --[[
          name: ConvertVector
          line: 26
        ]]
        return (a7 * a6:toObjectSpace(CFrame.new(a5))).Position, Vector3.new(a7:ToEulerAnglesYXZ()) - Vector3.new(a6:ToEulerAnglesYXZ())
    end
    local v4 = a2:toObjectSpace(CFrame.new(a1.terrainPosition.Value))
    local v5 = tbl_upv_1.CreateRotatedTerrain(a1, Vector3.new(a3:ToEulerAnglesYXZ()) - Vector3.new(a2:ToEulerAnglesYXZ()))
    v5.terrainPosition.Value = (a3 * v4).Position
    v5.Parent = workspace
    v5.Name = "PleaseExist"
    tbl_upv_1.LoadRegion(v5, a4)
end
function SaveRegionFromMinMax(a1, a2, a3)
    --[[
      name: SaveRegionFromMinMax
      line: 40
    ]]
    local Terrain_upv_1 = game.Workspace.Terrain
    local v6 = Vector3int16.new(math.round(a1.X / 4), math.round(a1.Y / 4), math.round(a1.Z / 4))
    local v7 = Vector3int16.new(math.round(a2.X / 4), math.round(a2.Y / 4), math.round(a2.Z / 4))
    local v8 = Terrain_upv_1:CopyRegion(Region3int16.new(v6, v7))
    v8.Name = "SavedTerrain"
    v8.Parent = game.Workspace
    local v9 = Instance.new("Vector3Value")
    local v10 = Instance.new("Vector3Value")
    v9.Name = "terrainPosition"
    v10.Name = "terrainSize"
    local v11 = Vector3.new(v6.X * 4, v6.Y * 4, v6.Z * 4)
    local v12 = Vector3.new(v7.X * 4, v7.Y * 4, v7.Z * 4)
    v9.Value = (v11 + v12) / 2
    local v13 = v12 - v11
    v10.Value = Vector3.new(math.abs(v13.X), math.abs(v13.Y), math.abs(v13.Z))
    v9.Parent = v8
    v10.Parent = v8
    if a3 then
        local u1 = Instance.new("Configuration", v8)
        u1.Name = "WaterProperties"
        local function SaveProperty(a4, a5)
            --[[
              name: SaveProperty
              line: 82
              upvalues:
                u1 (copy, index: 1)
                Terrain_upv_1 (copy, index: 2)
            ]]
            local u2 = Instance.new(a4, u1)
            u2.Name = a5
            xpcall(
                function()
                    --[[
                      line: 85
                      upvalues:
                        u2 (copy, index: 1)
                        Terrain_upv_1 (copy, index: 2)
                        a5 (copy, index: 3)
                    ]]
                    u2.Value = Terrain_upv_1[a5]
                end,
                function(a6)
                    --[[
                      line: 87
                    ]]
                    print("Failed to get property: " .. tostring(a6))
                end
            )
        end
        SaveProperty("Color3Value", "WaterColor")
        SaveProperty("NumberValue", "WaterReflectance")
        SaveProperty("NumberValue", "WaterTransparency")
        SaveProperty("NumberValue", "WaterWaveSize")
        SaveProperty("NumberValue", "WaterWaveSpeed")
    end
    return v8
end
function tbl_upv_1.FillPart(a1, a2)
    --[[
      name: FillPart
      line: 102
    ]]
    local v14 = Vector3.new(math.ceil(a1.Position.X / 4) * 4, math.ceil(a1.Position.Y / 4) * 4, math.ceil(a1.Position.Z / 4) * 4)
    local v15 = Vector3.new(math.ceil(a1.Size.X / 8) * 8, math.ceil(a1.Size.Y / 8) * 8, math.ceil(a1.Size.Z / 8) * 8)
    local v16 = Vector3.new(math.ceil(v14.X - (v15.X / 2)), math.ceil(v14.Y - (v15.Y / 2)), math.ceil(v14.Z - (v15.Z / 2)))
    local v17 = Vector3.new(math.ceil(v14.X + (v15.X / 2)), math.ceil(v14.Y + (v15.Y / 2)), math.ceil(v14.Z + (v15.Z / 2)))
    a1.Position = v14
    a1.Size = v15
    workspace.Terrain:FillRegion(Region3.new(v16, v17), 4, a2)
end
function tbl_upv_1.Clear()
    --[[
      name: Clear
      line: 132
    ]]
    workspace.Terrain:Clear()
end
function tbl_upv_1.LoadRegion(a1, a2)
    --[[
      name: LoadRegion
      line: 136
    ]]
    local v18 = (typeof(a1) == "Instance") and (a1:IsA("TerrainRegion"))
    assert(v18, "Load method for terrainUtils API requires a TerrainRegion object as an argument")
    local v19 = a1.terrainPosition.Value - a1.terrainSize.Value / 2
    local v20 = Vector3int16.new(v19.X / 4, v19.Y / 4, v19.Z / 4)
    local WaterProperties_upv_1 = a1:FindFirstChild("WaterProperties")
    if WaterProperties_upv_1 then
        local function LoadProperty(a3)
            --[[
              name: LoadProperty
              line: 150
              upvalues:
                WaterProperties_upv_1 (copy, index: 1)
            ]]
            local u3 = WaterProperties_upv_1:FindFirstChild(a3)
            if not u3 then
                return
            end
            xpcall(
                function()
                    --[[
                      line: 153
                      upvalues:
                        u3 (copy, index: 1)
                    ]]
                    game.Workspace.Terrain[u3.Name] = u3.Value
                end,
                function(a4)
                    --[[
                      line: 155
                    ]]
                    print("Failed to set property: " .. tostring(a4))
                end
            )
        end
        LoadProperty("WaterColor")
        LoadProperty("WaterReflectance")
        LoadProperty("WaterTransparency")
        LoadProperty("WaterWaveSize")
        LoadProperty("WaterWaveSpeed")
    end
    if a2 == nil then
        a2 = true
    end
    game.Workspace.Terrain:PasteRegion(a1, v20, a2)
end
function tbl_upv_1.ClearRegion(a1)
    --[[
      name: ClearRegion
      line: 175
    ]]
    local v21 = a1.terrainPosition.Value - a1.terrainSize.Value / 2
    local v22 = a1.terrainPosition.Value + a1.terrainSize.Value / 2
    local v23 = Vector3.new(v22.X - v21.X, v22.Y - v21.Y, v22.Z - v21.Z)
    local v24 = math.ceil(((v23.X * v23.Y) * v23.Z) / 2604166666)
    for n_1 = 1, v24 do
        workspace.Terrain:FillRegion(Region3.new(v21 + Vector3.new((v23.X / v24) * (n_1 - 1), 0, 0), v22 - Vector3.new((v23.X / v24) * math.max(0, v24 - n_1))), 4, Enum.Material.Air)
    end
end
function tbl_upv_1.CreateRotatedTerrain(a1, a2)
    --[[
      name: CreateRotatedTerrain
      line: 195
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v25 = a1
    for _, value_1 in pairs({"X", "Y", "Z"}) do
        if (a2[value_1] / 1.5707963267948966) % 4 == 0 then
            continue
        end
        local v26 = v25
        v25 = tbl_upv_1.RotateTerrainOnAxis(v25, a2[value_1], value_1)
        if v26 ~= a1 then
            v26:Destroy()
        end
    end
    if v25 == a1 then
        v25 = a1:Clone()
    end
    return v25
end
function tbl_upv_1.RotateTerrainOnAxis(a1, a2, a3)
    --[[
      name: RotateTerrainOnAxis
      line: 219
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local function rotate(a4, a5, a6, a7, a8)
        --[[
          name: rotate
          line: 220
        ]]
        if a8 ~= 1 then
            if a8 ~= 2 then
                if a8 ~= 3 then
                    return a5, a7
                end
                return a7, (a4 + 1) - a5
            end
            return (a4 + 1) - a5, (a6 + 1) - a7
        end
        return (a6 + 1) - a7, a5
    end
    local v27 = math.round((a2 / 1.5707963267948966) % 4)
    warn(v27)
    local v28 = ((a3 == "X") and (v27 * 1.5707963267948966)) or 0
    local v29 = ((a3 == "Y") and (v27 * 1.5707963267948966)) or 0
    local v30 = CFrame.Angles(v28, v29, ((a3 == "Z") and (v27 * 1.5707963267948966)) or 0)
    local Value_1 = a1.terrainPosition.Value
    a1.terrainPosition.Value = Vector3.new(1000, 1002, 1002)
    tbl_upv_1.LoadRegion(a1)
    local v31 = a1.terrainPosition.Value - a1.terrainSize.Value / 2
    local v32 = a1.terrainPosition.Value + a1.terrainSize.Value / 2
    local _, v47 = workspace.Terrain:ReadVoxels(Region3.new(v31, v32), 4)
    local v33 = v30 * (v32 - v31)
    local v34 = Vector3.new(math.round(math.abs(v33.X)), math.round(math.abs(v33.Y)), math.round(math.abs(v33.Z)))
    local v35 = Vector3.new(v32.X, v31.Y, v32.Z)
    local v36 = v35 + v34
    local v37 = Region3.new(v35, v36)
    local tbl_2 = {}
    tbl_2.region = v37
    local v38, v39 = workspace.Terrain:ReadVoxels(v37, 4)
    tbl_2.materials = v38
    tbl_2.occupancies = v39
    local tbl_3 = {}
    local tbl_4 = {}
    local v40 = v34 / 4
    local v41, v42, v43, v44, v44, v44 = nil, nil, nil, nil, nil, nil
    for n_2 = 1, v40.X do
        local tbl_5 = {}
        local tbl_6 = {}
        for n_3 = 1, v40.Y do
            local tbl_7 = {}
            local tbl_8 = {}
            for n_4 = 1, v40.Z do
                if a3 == "Y" then
                    local X_1 = v40.X
                    local Z_1 = v40.Z
                    local v45 = nil
                    if v27 == 1 then
                        v45 = Z_1 + 1 - n_4
                        v44 = n_2
                        v41, v42, v43 = v45, n_3, v44
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    if v27 == 2 then
                        v45, v44 = X_1 + 1 - n_2, Z_1 + 1 - n_4
                        v41, v42, v43 = v45, n_3, v44
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    if v27 ~= 3 then
                        v45, v44 = n_2, n_4
                    else
                        v45, v44 = n_4, X_1 + 1 - n_2
                    end
                    v41, v42, v43 = v45, n_3, v44
                elseif a3 ~= "X" then
                    if a3 ~= "Z" then
                        v41, v42, v43 = n_2, n_3, n_4
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    local Y_1 = v40.Y
                    local X_2 = v40.X
                    local v45 = nil
                    if v27 == 1 then
                        v45, v44 = X_2 + 1 - n_2, n_3
                        v41, v42, v43 = v44, v45, n_4
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    if v27 == 2 then
                        v45, v44 = Y_1 + 1 - n_3, X_2 + 1 - n_2
                        v41, v42, v43 = v44, v45, n_4
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    if v27 ~= 3 then
                        v45, v44 = n_3, n_2
                    else
                        v45, v44 = n_2, Y_1 + 1 - n_3
                    end
                    v41, v42, v43 = v44, v45, n_4
                else
                    local Z_2 = v40.Z
                    local Y_2 = v40.Y
                    local v45 = nil
                    if v27 == 1 then
                        v45, v44 = Y_2 + 1 - n_3, n_4
                        v41, v42, v43 = n_2, v44, v45
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    if v27 == 2 then
                        v45, v44 = Z_2 + 1 - n_4, Y_2 + 1 - n_3
                        v41, v42, v43 = n_2, v44, v45
                        tbl_7[n_4] = n_4[v41][v42][v43]
                        tbl_8[n_4] = n_4[v41][v42][v43]
                        continue
                    end
                    if v27 ~= 3 then
                        v45, v44 = n_4, n_3
                    else
                        v45, v44 = n_3, Z_2 + 1 - n_4
                    end
                    v41, v42, v43 = n_2, v44, v45
                end
                tbl_7[n_4] = n_4[v41][v42][v43]
                tbl_8[n_4] = n_4[v41][v42][v43]
                tbl_7[n_4] = n_4[v41][v42][v43]
                tbl_8[n_4] = n_4[v41][v42][v43]
            end
            tbl_5[n_3] = tbl_7
            tbl_6[n_3] = tbl_8
        end
        tbl_3[n_2] = tbl_5
        tbl_4[n_2] = tbl_6
    end
    tbl_upv_1.ClearRegion(a1)
    workspace.Terrain:WriteVoxels(v37, 4, tbl_3, tbl_4)
    local v46 = tbl_upv_1.SaveFromArea(v35, v36)
    tbl_upv_1.ClearRegion(v46)
    v46.terrainPosition.Value = Value_1
    a1.terrainPosition.Value = Value_1
    return v46
end
function tbl_upv_1.Remove(a1)
    --[[
      name: Remove
      line: 319
    ]]
    game.Workspace.Terrain:FillRegion(Region3.new(-a1.SizeInCells, a1.SizeInCells), 4, Enum.Material.Air)
end
function tbl_upv_1.SaveWorld()
    --[[
      name: SaveWorld
      line: 324
    ]]
    local v47 = workspace.Terrain:CopyRegion(workspace.Terrain.MaxExtents)
    v47.Name = "World"
    return v47
end
function tbl_upv_1.LoadWorld(a1)
    --[[
      name: LoadWorld
      line: 330
    ]]
    workspace.Terrain:PasteRegion(a1, workspace.Terrain.MaxExtents.Min, true)
end
local function GetAABBFromPart(a1)
    --[[
      name: GetAABBFromPart
      line: 335
    ]]
    local v48 = a1.Size / 2
    local tbl_9 = {Vector3.new(-v48.X, -v48.Y, -v48.Z), Vector3.new(-v48.X, -v48.Y, v48.Z), Vector3.new(-v48.X, v48.Y, -v48.Z), Vector3.new(-v48.X, v48.Y, v48.Z), Vector3.new(v48.X, -v48.Y, -v48.Z), Vector3.new(v48.X, -v48.Y, v48.Z), Vector3.new(v48.X, v48.Y, -v48.Z), Vector3.new(v48.X, v48.Y, v48.Z)}
    local v49 = Vector3.new(inf, inf, inf)
    local v50 = Vector3.new(-inf, -inf, -inf)
    for _, value_2 in ipairs(tbl_9) do
        local v51 = a1.CFrame:PointToWorldSpace(value_2)
        v49, v50 = Vector3.new(math.min(v49.X, v51.X), math.min(v49.Y, v51.Y), math.min(v49.Z, v51.Z)), Vector3.new(math.max(v50.X, v51.X), math.max(v50.Y, v51.Y), math.max(v50.Z, v51.Z))
    end
    return v49, v50
end
function tbl_upv_1.ReplaceMaterialFromPart(a1, a2, a3)
    --[[
      name: ReplaceMaterialFromPart
      line: 361
      upvalues:
        GetAABBFromPart (copy, index: 1)
    ]]
    local v52, v53 = GetAABBFromPart(a1)
    workspace.Terrain:ReplaceMaterial(Region3.new(v52, v53), 4, a2, a3)
end
function tbl_upv_1.UpdateOldTerrainPositionData(a1)
    --[[
      name: UpdateOldTerrainPositionData
      line: 367
    ]]
    local v54 = a1.min.Value * 4
    local v55 = a1.max.Value * 4
    local v56 = Instance.new("Vector3Value")
    local v57 = Instance.new("Vector3Value")
    v56.Name = "terrainPosition"
    v57.Name = "terrainSize"
    v56.Value = (v54 + v55) / 2
    local v58 = v55 - v54
    v57.Value = Vector3.new(math.abs(v58.X), math.abs(v58.Y), math.abs(v58.Z))
    v56.Parent = a1
    v57.Parent = a1
    a1.min:Destroy()
    a1.max:Destroy()
end
return tbl_upv_1