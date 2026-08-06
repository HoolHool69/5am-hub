-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local SCENERY_FOLDER_NAME_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").SCENERY_FOLDER_NAME
local TOWER_BUILDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(216, 97, 97)
local function asModel_1(a1)
    --[[
      name: asModel
      line: 46
    ]]
    if a1 ~= nil and a1:IsA("Model") then
        return a1
    end
    return nil
end
local function flattenToProp_upv_1(a1, a2)
    --[[
      name: flattenToProp
      line: 65
    ]]
    for _, value_1 in a1:GetDescendants() do
        if value_1:IsA("BasePart") then
            value_1.Anchored = true
            value_1.CanCollide = false
            value_1.CanQuery = false
            value_1.CanTouch = false
            value_1.CastShadow = a2.castShadow
        end
    end
end
local function partWorldHalfExtents_upv_1(a1)
    --[[
      name: partWorldHalfExtents
      line: 77
    ]]
    local CFrame_1 = a1.CFrame
    local Size_1 = a1.Size
    return (Vector3.new((((math.abs(CFrame_1.XVector.X) * Size_1.X) + (math.abs(CFrame_1.YVector.X) * Size_1.Y)) + (math.abs(CFrame_1.ZVector.X) * Size_1.Z)) / 2, (((math.abs(CFrame_1.XVector.Y) * Size_1.X) + (math.abs(CFrame_1.YVector.Y) * Size_1.Y)) + (math.abs(CFrame_1.ZVector.Y) * Size_1.Z)) / 2, (((math.abs(CFrame_1.XVector.Z) * Size_1.X) + (math.abs(CFrame_1.YVector.Z) * Size_1.Y)) + (math.abs(CFrame_1.ZVector.Z) * Size_1.Z)) / 2))
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 123
    ]]
    return "TowerBuilderAssets"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 128
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u3)
    return v1:constructor(...) or v1
end
u3.constructor = function(a1)
    --[[
      name: constructor
      line: 132
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    a1.available = false
    a1.crane = nil
    a1.details = nil
    a1.lighting = nil
    a1.tile = nil
    local tbl_3 = {}
    a1.clouds = tbl_3
    local v2 = waitForSceneryRoot_upv_1("TowerBuilder", "tower-builder")
    local v3, v4, v5, v6 = nil, nil, nil, nil
    if v2 ~= nil then
        a1.available = true
        v3 = v2:FindFirstChild("Crane")
        v6 = v3 == nil or not (v3:IsA("Model")) or v3
        a1.crane = v6
        v4 = v2:FindFirstChild("Details")
        v6 = v4 == nil or not (v4:IsA("Model")) or v4
        a1.details = v6
        a1.lighting = v2:FindFirstChild("Lighting")
        v5 = v2:FindFirstChild("Tile")
        v6 = v5 == nil or not (v5:IsA("Model")) or v5
        a1.tile = v6
        v6 = v2:FindFirstChild("Clouds")
        if v6 ~= nil then
            for _, value_2 in v6:GetChildren() do
                if value_2:IsA("BasePart") then
                    table.insert(tbl_3, value_2)
                end
            end
        end
    else
        return nil
    end
end
local function modelAabb_upv_1(a1)
    --[[
      name: modelAabb
      line: 86
      upvalues:
        partWorldHalfExtents_upv_1 (copy, index: 1)
    ]]
    local v7 = nil
    local v8 = nil
    local v9 = nil
    local v10 = nil
    local v11 = nil
    local Position_1 = nil
    local v12 = nil
    for _, value_3 in a1:GetDescendants() do
        v12 = value_3:IsA("BasePart")
        if not (v12) then
            continue
        end
        v11 = partWorldHalfExtents_upv_1(value_3)
        Position_1 = value_3.Position
        v9 = Position_1 - v11
        v10 = Position_1 + v11
        if v7 ~= nil then
            v7 = Vector3.new(math.min(v7.X, v9.X), math.min(v7.Y, v9.Y), math.min(v7.Z, v9.Z))
        else
            v7 = v9
        end
        if v8 ~= nil then
            v8 = Vector3.new(math.max(v8.X, v10.X), math.max(v8.Y, v10.Y), math.max(v8.Z, v10.Z))
        else
            v8 = v10
        end
    end
    if v7 ~= nil and v8 ~= nil then
        local tbl_4 = {}
        tbl_4.min = v7
        tbl_4.max = v8
        tbl_4.center = (v7 + v8) / 2
        return tbl_4
    end
    return nil
end
local function listChildNames_upv_1(a1)
    --[[
      name: listChildNames
      line: 50
    ]]
    local tbl_5 = {}
    for _, value_4 in a1:GetChildren() do
        table.insert(tbl_5, value_4.Name)
    end
    if #tbl_5 <= 0 then
        return "(none)"
    end
    return (table.concat(tbl_5, ", "))
end
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 277
    ]]
    return "AuthoredCraneVisual"
end
local u4 = setmetatable(tbl_6, tbl_7)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 282
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v13 = setmetatable({}, u4)
    return v13:constructor(...) or v13
end
u4.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 286
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        modelAabb_upv_1 (copy, index: 2)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local v14 = a2:Clone()
    flattenToProp_upv_1(v14, {})
    local v15 = modelAabb_upv_1(v14)
    local v16 = ((v15 == nil) and 0) or (v15.max.X - v15.min.X)
    local v17
    if v16 <= 0.01 then
        v17 = 1
    else
        v17 = TOWER_BUILDER_CONFIG_upv_1.craneSpanTarget / v16
    end
    local v18 = ((v15 == nil) and 0) or (v14:GetPivot().Position.X - v15.center.X)
    if v15 ~= nil then
        v14.WorldPivot = CFrame.new(v15.center)
        v14:ScaleTo(v14:GetScale() * v17)
    end
    a1.offset = Vector3.new(a4 - (v18 * v17), TOWER_BUILDER_CONFIG_upv_1.craneOffsetY, a5)
    a1.model = v14
    v14:PivotTo(u1)
    v14.Parent = a3
end
u4.follow = function(a1, a2)
    --[[
      name: follow
      line: 308
    ]]
    a1.model:PivotTo(CFrame.new(a2.X + a1.offset.X, a2.Y + a1.offset.Y, a2.Z + a1.offset.Z))
end
tbl_7 = {}
tbl_7.prepareAuthoredTile = function(a1, a2)
    --[[
      name: prepareAuthoredTile
      line: 179
      upvalues:
        SCENERY_FOLDER_NAME_upv_1 (copy, index: 1)
        modelAabb_upv_1 (copy, index: 2)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 3)
        listChildNames_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
    ]]
    local v19 = nil
    if a1 ~= nil then
        v19 = modelAabb_upv_1(a1)
        local v20 = nil
        if v19 ~= nil then
            v20 = v19.max.Y - v19.min.Y
            local v21, v22 = nil, nil
            if math.abs(v20 - TOWER_BUILDER_CONFIG_upv_1.blockHeight) <= 0.25 then
                v21 = v19.max.X - v19.min.X
                if math.abs(v21 - TOWER_BUILDER_CONFIG_upv_1.blockWidth) > 0.5 then
                    warn(("[tower-builder] authored Tile is %* studs wide vs blockWidth "):format(string.format("%.2f", v21)) .. ("%* \226\128\148 the landing bands are measured on blockWidth, so the art will not match the "):format(TOWER_BUILDER_CONFIG_upv_1.blockWidth) .. "stick/perfect windows the player feels. Using it anyway.")
                end
                local v23 = v19.min.Y - a1:GetPivot().Position.Y
                local v24
                if a2 ~= -1 then
                    v24 = CFrame.Angles(0, math.pi, 0)
                else
                    v24 = CFrame.identity
                end
                local v25 = CFrame.new(0, (-TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2) - v23, 0) * v24
                v22 = a1:FindFirstChild("Body")
                if v22 == nil or not (v22:IsA("BasePart")) then
                    warn("[tower-builder] authored Tile has no Body BasePart \226\128\148 the debris and the tower shaft below the visible span sample its colour, so they will not match the tile. Using it anyway.")
                end
                local tbl_8 = {}
                for n_1 = 1, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock do
                    local v26 = ("Window%*"):format(n_1)
                    local v27
                    v27 = a1:FindFirstChild(v26)
                    if v27 == nil then
                        continue
                    end
                    local v28
                    v28 = v27:IsA("BasePart")
                    if v28 then
                        table.insert(tbl_8, v26)
                    end
                end
                if #tbl_8 < TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock then
                    warn(("[tower-builder] authored Tile has %* of %* "):format(#tbl_8, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock) .. ("Window1..%* parts \226\128\148 the residents' move-in light-up will be partial. "):format(TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock) .. ("Names present: %*"):format(listChildNames_upv_1(a1)))
                end
                local tbl_9 = {}
                tbl_9.template = a1
                tbl_9.seat = v25
                local v29
                if v22 ~= nil and (v22:IsA("BasePart")) then
                    v29 = v22.Color
                else
                    v29 = u2
                end
                tbl_9.bodyColor = v29
                tbl_9.windowNames = tbl_8
                return tbl_9
            end
            warn(("[tower-builder] authored Tile is %* studs tall but the floor pitch is "):format(string.format("%.2f", v20)) .. ("blockHeight %* \226\128\148 it would seam or clip on every floor, so floors stay procedural bricks. "):format(TOWER_BUILDER_CONFIG_upv_1.blockHeight) .. "Resize the tile to the cell, or change blockHeight (which also moves the landing bands and the crane reach).")
        else
            warn("[tower-builder] authored Tile has no BaseParts \226\128\148 floors stay procedural bricks")
        end
    else
        warn((("[tower-builder] missing %*.TowerBuilder.Tile \226\128\148 floors stay procedural bricks"):format(SCENERY_FOLDER_NAME_upv_1)))
    end
    return nil
end
tbl_7.cloneAuthoredTile = function(a1, a2)
    --[[
      name: cloneAuthoredTile
      line: 229
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v30 = a1.template:Clone()
    flattenToProp_upv_1(v30, {})
    v30:PivotTo(u1)
    v30.Parent = a2
    return v30
end
tbl_7.authoredTileBodyColor = function()
    --[[
      name: authoredTileBodyColor
      line: 248
      upvalues:
        ReplicatedStorage_upv_1 (copy, index: 1)
        SCENERY_FOLDER_NAME_upv_1 (copy, index: 2)
    ]]
    local v31 = ReplicatedStorage_upv_1:FindFirstChild(SCENERY_FOLDER_NAME_upv_1)
    if v31 ~= nil then
        v31 = v31:FindFirstChild("TowerBuilder")
        if v31 ~= nil then
            v31 = v31:FindFirstChild("Tile")
            if v31 ~= nil then
                v31 = v31:FindFirstChild("Body")
            end
        end
    end
    if v31 ~= nil and v31:IsA("BasePart") then
        return v31.Color
    end
    return nil
end
tbl_7.seatAuthoredDetails = function(a1, a2, a3)
    --[[
      name: seatAuthoredDetails
      line: 320
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v32 = a1:Clone()
    flattenToProp_upv_1(v32, {})
    v32.WorldPivot = CFrame.new(TOWER_BUILDER_CONFIG_upv_1.detailsAnchorX, TOWER_BUILDER_CONFIG_upv_1.detailsAnchorY, TOWER_BUILDER_CONFIG_upv_1.detailsAnchorZ)
    if TOWER_BUILDER_CONFIG_upv_1.detailsScale ~= 1 then
        v32:ScaleTo(v32:GetScale() * TOWER_BUILDER_CONFIG_upv_1.detailsScale)
    end
    v32:PivotTo(CFrame.new(a3 + Vector3.new(TOWER_BUILDER_CONFIG_upv_1.detailsNudgeX, TOWER_BUILDER_CONFIG_upv_1.detailsNudgeY, TOWER_BUILDER_CONFIG_upv_1.detailsNudgeZ)))
    v32.Parent = a2
    return v32
end
tbl_7.prepareAuthoredCloud = function(a1, a2)
    --[[
      name: prepareAuthoredCloud
      line: 336
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v33 = a1:Clone()
    v33.Anchored = true
    v33.CanCollide = false
    v33.CanQuery = false
    v33.CanTouch = false
    v33.CastShadow = false
    v33.CFrame = u1
    v33.Parent = a2
    local tbl_10 = {}
    tbl_10.part = v33
    tbl_10.rotation = a1.CFrame.Rotation
    return tbl_10
end
tbl_7.TowerBuilderAssets = u3
tbl_7.AuthoredCraneVisual = u4
return tbl_7