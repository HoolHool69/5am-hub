-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local function findTileMesh_1(a1, a2)
    --[[
      name: findTileMesh
      line: 51
    ]]
    local v1
    if a1 == nil then
        v1 = a1
    else
        v1 = a1:FindFirstChild(a2)
    end
    if v1 ~= nil and v1:IsA("MeshPart") then
        return v1
    end
    return nil
end
local tbl_1 = {}
tbl_1.resolveGame2048Kit = function()
    --[[
      name: resolveGame2048Kit
      line: 29
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    local v2 = waitForSceneryRoot_upv_1("Game2048", "2048-3d")
    if v2 ~= nil and v2:IsA("Folder") then
        return v2
    end
    return nil
end
tbl_1.resolveGame2048Lighting = function()
    --[[
      name: resolveGame2048Lighting
      line: 43
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    local v3 = waitForSceneryRoot_upv_1("Game2048", "2048-3d")
    if v3 ~= nil then
        v3 = v3:FindFirstChild("Lighting")
    end
    return v3
end
tbl_1.cloneGame2048Kit = function(a1, a2, a3)
    --[[
      name: cloneGame2048Kit
      line: 69
    ]]
    local v4 = a1:FindFirstChild("Tile")
    if v4 ~= nil then
        v4 = v4:FindFirstChild("Tile")
    end
    local v5
    v5 = v4 == nil or not (v4:IsA("MeshPart")) or v4
    local TileOutline_1 = a1:FindFirstChild("TileOutline")
    if TileOutline_1 == nil then
        local Highlight_1 = TileOutline_1
    else
        local Highlight_1 = TileOutline_1:FindFirstChild("Highlight")
    end
    local Highlight_1
    v4 = Highlight_1 == nil or not (Highlight_1:IsA("MeshPart")) or Highlight_1
    local v6
    if TileOutline_1 == nil then
        v6 = TileOutline_1
    else
        v6 = TileOutline_1:FindFirstChild("Tile")
    end
    local v7
    v7 = v6 == nil or not (v6:IsA("MeshPart")) or v6
    local v8 = v7 or v5
    local Board_1 = a1:FindFirstChild("Board")
    if v5 == nil or v4 == nil or v8 == nil or Board_1 == nil then
        warn("[2048-3d] authored kit is missing Board/Tile/TileOutline.Highlight \226\128\148 using procedural fallback")
    else
        local v9, v10, v11, v12 = nil, nil, nil, nil
        if Board_1:IsA("Model") then
            local v13 = a1:Clone()
            v9 = v13:FindFirstChild("Lighting")
            if v9 ~= nil then
                v9:Destroy()
            end
            v10 = v13:FindFirstChild("Tile")
            if v10 ~= nil then
                v10:Destroy()
            end
            v11 = v13:FindFirstChild("TileOutline")
            if v11 ~= nil then
                v11:Destroy()
            end
            v12 = v13:FindFirstChild("Board")
            if v12 ~= nil and v12:IsA("Model") then
                local v14 = v12:GetBoundingBox()
                local tbl_2 = {}
                for _, value_1 in v13:GetDescendants() do
                    if not (value_1:IsA("BasePart")) then
                        continue
                    end
                    value_1.Anchored = true
                    value_1.CanCollide = false
                    value_1.CanQuery = false
                    value_1.CanTouch = false
                    value_1.CastShadow = false
                    value_1.CFrame = value_1.CFrame + (a3 - v14.Position)
                    if value_1:IsDescendantOf(v12) then
                        table.insert(tbl_2, value_1)
                    end
                end
                v13.Parent = a2
                local tbl_3 = {}
                tbl_3.boardParts = tbl_2
                tbl_3.tileSource = v5
                tbl_3.ringSource = v4
                tbl_3.tileZ = (v5.Position.Z - v14.Position.Z) + a3.Z
                tbl_3.ringZOffset = v4.Position.Z - v8.Position.Z
                return tbl_3
            end
            v13:Destroy()
        else
            warn("[2048-3d] authored kit is missing Board/Tile/TileOutline.Highlight \226\128\148 using procedural fallback")
        end
    end
    return nil
end
return tbl_1