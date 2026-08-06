-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local makeSmoothPart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local CrossyRoadAssets_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "crossy-road", "crossy-road-assets").CrossyRoadAssets
local ringSlot_upv_1 = RuntimeLib_1.import(script, script.Parent, "sling-drift-sim").ringSlot
local u1 = Color3.fromRGB(126, 205, 92)
local u2 = Color3.fromRGB(110, 190, 80)
local u3 = Color3.fromRGB(84, 158, 232)
local u4 = Color3.fromRGB(70, 142, 220)
local u5 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local u6 = CFrame.Angles(1.5707963267948966, 0, 0)
local function cellHash_1(a1, a2, a3)
    --[[
      name: cellHash
      line: 225
    ]]
    local v1 = bit32.bxor(bit32.bxor(a1 * 73856093, a2 * 19349663), a3 * 83492791)
    local v2 = bit32.bxor(v1, bit32.lshift(v1, 13))
    v2 = bit32.bxor(v2, bit32.rshift(v2, 17))
    return bit32.bxor(v2, bit32.lshift(v2, 5)) / 4294967296
end
local function partExtents_upv_1(a1)
    --[[
      name: partExtents
      line: 233
    ]]
    local CFrame_1 = a1.CFrame
    local v3 = a1.Size * 0.5
    return (Vector3.new(((math.abs(CFrame_1.RightVector.X) * v3.X) + (math.abs(CFrame_1.UpVector.X) * v3.Y)) + (math.abs(CFrame_1.LookVector.X) * v3.Z), ((math.abs(CFrame_1.RightVector.Y) * v3.X) + (math.abs(CFrame_1.UpVector.Y) * v3.Y)) + (math.abs(CFrame_1.LookVector.Y) * v3.Z), ((math.abs(CFrame_1.RightVector.Z) * v3.X) + (math.abs(CFrame_1.UpVector.Z) * v3.Y)) + (math.abs(CFrame_1.LookVector.Z) * v3.Z)))
end
local function stretchModelHeight_upv_1(a1, a2)
    --[[
      name: stretchModelHeight
      line: 273
    ]]
    local Y_1 = a1:GetPivot().Position.Y
    local v4 = nil
    local v5 = nil
    local v6 = nil
    local v7 = nil
    local Position_1 = nil
    local CFrame_2 = nil
    for _, value_1 in a1:GetDescendants() do
        if not (value_1:IsA("BasePart")) then
            continue
        end
        Position_1 = value_1.Position
        value_1.Position = Vector3.new(Position_1.X, Y_1 + ((Position_1.Y - Y_1) * a2), Position_1.Z)
        v4 = value_1.Size
        CFrame_2 = value_1.CFrame
        v5 = math.abs(CFrame_2.RightVector.Y)
        v6 = math.abs(CFrame_2.UpVector.Y)
        v7 = math.abs(CFrame_2.LookVector.Y)
        if v6 > v5 or v7 > v5 then
            if v7 > v6 then
                value_1.Size = Vector3.new(v4.X, v4.Y, v4.Z * a2)
            else
                value_1.Size = Vector3.new(v4.X, v4.Y * a2, v4.Z)
            end
        else
            value_1.Size = Vector3.new(v4.X * a2, v4.Y, v4.Z)
        end
    end
end
local function modelAabb_upv_1(a1)
    --[[
      name: modelAabb
      line: 242
      upvalues:
        partExtents_upv_1 (copy, index: 1)
    ]]
    local v8 = nil
    local v9 = nil
    local v10 = nil
    local v11 = nil
    local v12 = nil
    local Position_2 = nil
    local v13 = nil
    for _, value_2 in a1:GetDescendants() do
        v13 = value_2:IsA("BasePart")
        if not (v13) then
            continue
        end
        v12 = partExtents_upv_1(value_2)
        Position_2 = value_2.Position
        v10 = Position_2 - v12
        v11 = Position_2 + v12
        if v8 ~= nil then
            v8 = Vector3.new(math.min(v8.X, v10.X), math.min(v8.Y, v10.Y), math.min(v8.Z, v10.Z))
        else
            v8 = v10
        end
        if v9 ~= nil then
            v9 = Vector3.new(math.max(v9.X, v11.X), math.max(v9.Y, v11.Y), math.max(v9.Z, v11.Z))
        else
            v9 = v11
        end
    end
    if v8 ~= nil and v9 ~= nil then
        local tbl_5 = {}
        tbl_5.min = v8
        tbl_5.max = v9
        return tbl_5
    end
    return nil
end
local function stretchModelLongAxis_upv_1(a1, a2, a3)
    --[[
      name: stretchModelLongAxis
      line: 296
    ]]
    local Position_3 = a1:GetPivot().Position
    local v14 = nil
    local v15 = nil
    local value_3 = nil
    local _ = nil
    local CFrame_3 = nil
    local v16 = nil
    local v17 = nil
    local v18 = nil
    local LookVector_1 = nil
    for v19, value_3 in a1:GetDescendants() do
        if not (value_3:IsA("BasePart")) then
            continue
        end
        v14 = value_3.Position
        if a2 then
            v15 = Vector3.new(Position_3.X + ((v14.X - Position_3.X) * a3), v14.Y, v14.Z)
        else
            v15 = Vector3.new(v14.X, v14.Y, Position_3.Z + ((v14.Z - Position_3.Z) * a3))
        end
        value_3.Position = v15
        v15 = value_3.Size
        CFrame_3 = value_3.CFrame
        v16 = CFrame_3.RightVector
        if a2 then
            v17 = math.abs(v16.X)
        else
            v17 = math.abs(v16.Z)
        end
        v18 = CFrame_3.UpVector
        if a2 then
            v16 = math.abs(v18.X)
        else
            v16 = math.abs(v18.Z)
        end
        LookVector_1 = CFrame_3.LookVector
        if a2 then
            v18 = math.abs(LookVector_1.X)
        else
            v18 = math.abs(LookVector_1.Z)
        end
        if v16 > v17 or v18 > v17 then
            if v18 > v16 then
                value_3.Size = Vector3.new(v15.X, v15.Y, v15.Z * a3)
            else
                value_3.Size = Vector3.new(v15.X, v15.Y * a3, v15.Z)
            end
        else
            value_3.Size = Vector3.new(v15.X * a3, v15.Y, v15.Z)
        end
    end
end
local tbl_upv_6 = {}
tbl_upv_6.Log = {}
local tbl_upv_7 = {"Tree"}
local tbl_upv_8 = {"Rock"}
local tbl_9 = {}
local tbl_10 = {}
tbl_10.__tostring = function()
    --[[
      name: __tostring
      line: 447
    ]]
    return "SlingDecor"
end
local u7 = setmetatable(tbl_9, tbl_10)
u7.__index = u7
u7.new = function(...)
    --[[
      name: new
      line: 452
      upvalues:
        u7 (ref, index: 1)
    ]]
    local v19 = setmetatable({}, u7)
    return v19:constructor(...) or v19
end
local function collectVariants_upv_1(a1, a2)
    --[[
      name: collectVariants
      line: 411
    ]]
    local tbl_11 = {}
    local tbl_12 = {}
    for _, value_4 in a2 do
        for v1, value_5 in a1:variants(value_4) do
            if tbl_11[value_5] == nil then
                tbl_11[value_5] = true
                table.insert(tbl_12, value_5)
            end
        end
    end
    return tbl_12
end
u7.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 456
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        waitForSceneryRoot_upv_1 (copy, index: 3)
        CrossyRoadAssets_upv_1 (copy, index: 4)
        collectVariants_upv_1 (copy, index: 5)
        tbl_upv_7 (copy, index: 6)
        tbl_upv_8 (copy, index: 7)
    ]]
    a1.container = a2
    a1.origin = a3
    a1.track = a4
    a1.bands = {}
    a1.bandRow = {}
    a1.bandsCenterX = math.huge
    a1.rivers = {}
    a1.riverBand = {}
    a1.riverRowStart = {}
    a1.riverRowCount = {}
    a1.lakeSlabs = {}
    a1.lakeCellX = {}
    a1.lakeCellY = {}
    a1.land = {}
    a1.treeVariants = {}
    a1.rockVariants = {}
    a1.treeClones = 0
    a1.rockClones = 0
    a1.treeFree = {}
    a1.rockFree = {}
    a1.lilyPads = {}
    a1.logs = {}
    a1.logBand = {}
    a1.logCellX = {}
    a1.seedSalt = 0
    for _ = 0, 31 do
        local v20 = makeSmoothPart_upv_1(a2)
        v20.Size = Vector3.new(600, 4, 0.30000001192092896)
        v20.CFrame = u5
        table.insert(a1.bands, v20)
        table.insert(a1.bandRow, math.huge)
    end
    for _ = 0, 5 do
        local v21 = makeSmoothPart_upv_1(a2)
        v21.Size = Vector3.new(600, 4, 0.4000000059604645)
        v21.CFrame = u5
        table.insert(a1.rivers, v21)
    end
    table.insert(a1.riverBand, math.huge)
    table.insert(a1.riverRowStart, math.huge)
    table.insert(a1.riverRowCount, 0)
    table.insert(a1.riverBand, math.huge)
    table.insert(a1.riverRowStart, math.huge)
    table.insert(a1.riverRowCount, 0)
    table.insert(a1.riverBand, math.huge)
    table.insert(a1.riverRowStart, math.huge)
    table.insert(a1.riverRowCount, 0)
    for _ = 0, 3 do
        local tbl_13 = {}
        local v22 = 0
        local v23 = false
        v23, v22 = v23, v22
        while true do
            if v23 then
                v22 = v22 + 1
            else
                v23 = true
            end
            if v22 >= 5 then
                break
            end
            local v24 = makeSmoothPart_upv_1(a2)
            v24.CFrame = u5
            table.insert(tbl_13, v24)
        end
        table.insert(a1.lakeSlabs, tbl_13)
        table.insert(a1.lakeCellX, math.huge)
        table.insert(a1.lakeCellY, math.huge)
    end
    for _ = 0, 728 do
        table.insert(a1.land, {})
    end
    if waitForSceneryRoot_upv_1("CrossyRoad", "sling-drift") ~= nil then
        local v25 = CrossyRoadAssets_upv_1.new()
        a1.kitLighting = v25.lighting
        a1.treeVariants = collectVariants_upv_1(v25, tbl_upv_7)
        a1.rockVariants = collectVariants_upv_1(v25, tbl_upv_8)
        a1:buildWaterPool(v25:variants("LilyPad"), a1.lilyPads, #a1.lakeSlabs * 3, 3.6)
        a1:buildWaterPool(v25:variants("Log"), a1.logs, 12, 5)
    end
    for _ = 0, #a1.logs - 1 do
        table.insert(a1.logBand, math.huge)
        table.insert(a1.logCellX, math.huge)
    end
end
local function overrideFor_upv_1(a1)
    --[[
      name: overrideFor
      line: 389
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    for key_1, value_6 in tbl_upv_6 do
        if string.find(a1, key_1, 1, true) == nil then
            continue
        end
        return value_6
    end
    return nil
end
local function prepareProp_upv_1(a1, a2, a3, a4)
    --[[
      name: prepareProp
      line: 332
      upvalues:
        modelAabb_upv_1 (copy, index: 1)
        stretchModelLongAxis_upv_1 (copy, index: 2)
        stretchModelHeight_upv_1 (copy, index: 3)
        u5 (copy, index: 4)
    ]]
    local v26 = a1:Clone()
    for key_2, value_7 in v26:GetDescendants() do
        if value_7:IsA("BasePart") then
            value_7.Anchored = true
            value_7.CanCollide = false
            value_7.CanQuery = false
            value_7.CanTouch = false
            value_7.CastShadow = false
            continue
        end
        if value_7:IsA("Sound") or value_7:IsA("ParticleEmitter") or value_7:IsA("Beam") then
            value_7:Destroy()
        end
    end
    local v27 = modelAabb_upv_1(v26)
    local v28 = nil
    if v27 ~= nil then
        if a4 ~= nil and a4 ~= 1 then
            stretchModelLongAxis_upv_1(v26, (v27.max.Z - v27.min.Z) <= (v27.max.X - v27.min.X), a4)
        end
        v28 = modelAabb_upv_1(v26)
        local v29 = nil
        if v28 ~= nil then
            local v30 = math.max(v28.max.X - v28.min.X, v28.max.Z - v28.min.Z)
            if a3 < v30 then
                local key_2 = a3 / v30
                v26:ScaleTo(v26:GetScale() * key_2)
                stretchModelHeight_upv_1(v26, 1 / key_2)
            end
            v29 = modelAabb_upv_1(v26)
            if v29 ~= nil then
                v26.WorldPivot = CFrame.new((v29.min.X + v29.max.X) / 2, v29.min.Y, (v29.min.Z + v29.max.Z) / 2)
                v26.Parent = a2
                v26:PivotTo(u5)
                return v26
            end
        end
    end
    v26:Destroy()
    return nil
end
u7.buildWaterPool = function(a1, a2, a3, a4, a5)
    --[[
      name: buildWaterPool
      line: 570
      upvalues:
        overrideFor_upv_1 (copy, index: 1)
        prepareProp_upv_1 (copy, index: 2)
    ]]
    if #a2 ~= 0 then
        local v31 = 0
        local v32 = false
        if v32 then
            v31 = v31 + 1
        else
            v32 = true
        end
        local v33, v34 = nil, nil
        if v31 < a4 then
            local v35 = a2[(v31 % #a2) + 1]
            v33 = overrideFor_upv_1(v35.Name)
            local v36
            if v33 == nil then
                v36 = v33
            else
                v36 = v33.footprintFraction
            end
            local v37
            if v36 == nil then
                v37 = a5
            else
                v37 = 4 * v33.footprintFraction
            end
            local container_1 = a1.container
            local v38
            if v33 == nil then
                v38 = v33
            else
                v38 = v33.lengthStretch
            end
            v34 = prepareProp_upv_1(v35, container_1, v37, v38)
            if v34 ~= nil then
                table.insert(a3, v34)
            end
            if v32 then
                v31 = v31 + 1
            else
                v32 = true
            end
        end
    else
        return nil
    end
end
u7.setSeed = function(a1, a2)
    --[[
      name: setSeed
      line: 605
      upvalues:
        u5 (copy, index: 1)
    ]]
    a1.seedSalt = math.floor(math.abs(a2)) % 65536
    a1.bandsCenterX = math.huge
    for n_1 = 0, #a1.bands - 1 do
        a1.bandRow[n_1 + 1] = math.huge
        a1.bands[n_1 + 1].CFrame = u5
    end
    a1.riverBand[1] = math.huge
    a1.riverRowStart[1] = math.huge
    a1.riverRowCount[1] = 0
    a1.riverBand[2] = math.huge
    a1.riverRowStart[2] = math.huge
    a1.riverRowCount[2] = 0
    a1.riverBand[3] = math.huge
    a1.riverRowStart[3] = math.huge
    a1.riverRowCount[3] = 0
    for _, value_8 in a1.rivers do
        value_8.CFrame = u5
    end
    for n_2 = 0, #a1.lakeCellX - 1 do
        a1.lakeCellX[n_2 + 1] = math.huge
        a1.lakeCellY[n_2 + 1] = math.huge
        for _, value_9 in a1.lakeSlabs[n_2 + 1] do
            value_9.CFrame = u5
        end
    end
    for _, value_10 in a1.land do
        a1:parkLandSlot(value_10)
    end
    for _, value_11 in a1.lilyPads do
        value_11:PivotTo(u5)
    end
    for n_3 = 0, #a1.logs - 1 do
        a1.logBand[n_3 + 1] = math.huge
        a1.logCellX[n_3 + 1] = math.huge
        a1.logs[n_3 + 1]:PivotTo(u5)
    end
end
u7.parkLandSlot = function(a1, a2)
    --[[
      name: parkLandSlot
      line: 639
    ]]
    a1:releaseSlotModel(a2)
    a2.cellX = math.huge
    a2.cellY = math.huge
    a2.seatX = -1e+09
    a2.seatY = -1e+09
end
u7.releaseSlotModel = function(a1, a2)
    --[[
      name: releaseSlotModel
      line: 646
      upvalues:
        u5 (copy, index: 1)
    ]]
    local model_1 = a2.model
    if model_1 ~= nil then
        model_1:PivotTo(u5)
        local v39
        if a2.kind ~= 1 then
            v39 = a1.rockFree
        else
            v39 = a1.treeFree
        end
        table.insert(v39, model_1)
        a2.model = nil
        a2.kind = 0
    else
        a2.kind = 0
        return nil
    end
end
u7.hash = function(a1, a2, a3, a4)
    --[[
      name: hash
      line: 658
    ]]
    local v40 = bit32.bxor(bit32.bxor(a2 * 73856093, a3 * 19349663), (a4 + (a1.seedSalt * 197)) * 83492791)
    local v41 = bit32.bxor(v40, bit32.lshift(v40, 13))
    v41 = bit32.bxor(v41, bit32.rshift(v41, 17))
    return bit32.bxor(v41, bit32.lshift(v41, 5)) / 4294967296
end
u7.riverShape = function(a1, a2)
    --[[
      name: riverShape
      line: 661
    ]]
    if a1:hash(a2, 0, 101) < 0.55 then
        local v42 = ((a1:hash(a2, 0, 107) >= 0.45) and 1) or 2
        local tbl_14 = {}
        tbl_14.rowStart = math.round((a2 * 68) / 4) + math.round(((a1:hash(a2, 0, 103) * 2) - 1) * 3) - (v42 - 1)
        tbl_14.rowCount = v42
        return tbl_14
    end
    return nil
end
u7.lakeShape = function(a1, a2, a3)
    --[[
      name: lakeShape
      line: 672
    ]]
    if a1:hash(a2, a3, 109) < 0.4 then
        local v43 = math.floor(a1:hash(a2, a3, 131) * 3) + 3
        local v44 = a2 * 24 + math.round(((a1:hash(a2, a3, 113) * 2) - 1) * 3)
        local v45 = (a3 * 24) + math.round(((a1:hash(a2, a3, 127) * 2) - 1) * 3) - math.floor(v43 / 2)
        local tbl_15 = {}
        local tbl_16 = {}
        local tbl_17 = 0
        local v46 = false
        local v47 = v44
        local v48 = nil
        if v46 then
            tbl_17 = tbl_17 + 1
        else
            v46 = true
        end
        while tbl_17 < v43 do
            v47 = math.clamp(v47 + math.round((a1:hash(a2, a3, (tbl_17 * 17) + 151) * 2) - 1), v44 - 2, v44 + 2)
            local v49 = math.floor(a1:hash(a2, a3, (tbl_17 * 17) + 157) * 3) + 2
            if tbl_17 == 0 or tbl_17 == v43 - 1 then
                v48 = math.max(v49 - 1, 1)
            else
                v48 = v49
            end
            table.insert(tbl_15, v47)
            table.insert(tbl_16, v48)
            if v46 then
                tbl_17 = tbl_17 + 1
            else
                v46 = true
            end
        end
        tbl_17 = {}
        tbl_17.rowStart = v45
        tbl_17.rows = v43
        tbl_17.centerCell = tbl_15
        tbl_17.halfCells = tbl_16
        return tbl_17
    end
    return nil
end
u7.isWaterCell = function(a1, a2, a3, a4)
    --[[
      name: isWaterCell
      line: 714
    ]]
    local v50 = math.round((a3 * 4) / 68)
    local v53 = nil
    for v51 = -1, 1 do
        v53 = a1:riverShape(v50 + v51)
        if v53 == nil or v53.rowStart - a4 > a3 or a3 > ((v53.rowStart + v53.rowCount) - 1) + a4 then
            continue
        end
        return true
    end
    v53 = a1:lakeShape(math.round((a2 * 4) / 96), math.round((a3 * 4) / 96))
    if v53 ~= nil then
        local v54 = -a4
        local v51 = false
        local v55
        v55 = v54
        while true do
            if v51 then
                v55 = v55 + 1
            else
                v51 = true
            end
            if v55 >= v53.rows + a4 then
                return false
            else
                local v56 = math.clamp(v55, 0, v53.rows - 1)
                if a3 ~= v53.rowStart + v55 then
                    continue
                end
            end
            if math.abs(a2 - v53.centerCell[v56 + 1]) <= v53.halfCells[v56 + 1] + a4 then
                break
            end
        end
        return true
    end
    return false
end
u7.isNearRoad = function(a1, a2, a3, a4)
    --[[
      name: isNearRoad
      line: 752
      upvalues:
        ringSlot_upv_1 (copy, index: 1)
    ]]
    local track_1 = a1.track
    local v57 = math.max(0, (track_1.generatedThrough - track_1.capacity) + 1)
    local v58 = false
    while true do
        if v58 then
            v57 = v57 + 1
        else
            v58 = true
        end
        local v59
        if v57 > track_1.generatedThrough then
            return false
        end
        v59 = ringSlot_upv_1(track_1, v57)
        if track_1.straightMinX[v59 + 1] - a4 > a2 or a2 > track_1.straightMaxX[v59 + 1] + a4 or track_1.straightMinY[v59 + 1] - a4 > a3 or a3 > track_1.straightMaxY[v59 + 1] + a4 then
            if track_1.elbowMinX[v59 + 1] - a4 > a2 or a2 > track_1.elbowMaxX[v59 + 1] + a4 or track_1.elbowMinY[v59 + 1] - a4 > a3 or a2 > track_1.elbowMaxX[v59 + 1] + a4 or track_1.elbowMinY[v59 + 1] - a4 > a3 or a2 > track_1.elbowMaxX[v59 + 1] + a4 or track_1.elbowMinY[v59 + 1] - a4 > a3 or a2 > track_1.elbowMaxX[v59 + 1] + a4 or track_1.elbowMinY[v59 + 1] - a4 > a3 then
                continue
            end
        else
            return true
        end
        if a3 <= track_1.elbowMaxY[v59 + 1] + a4 then
            break
        end
    end
    return true
end
u7.update = function(a1, a2, a3)
    --[[
      name: update
      line: 778
    ]]
    local v60 = math.abs(a2 - a1.bandsCenterX) > 80
    if v60 then
        a1.bandsCenterX = a2
    end
    a1:updateBands(a3, v60)
    a1:updateRivers(a2, a3, v60)
    a1:updateLakes(a2, a3)
    a1:updateLand(a2, a3)
end
u7.updateBands = function(a1, a2, a3)
    --[[
      name: updateBands
      line: 790
      upvalues:
        u1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v61 = math.round(a2 / 4) - 16
    local v62 = nil
    for n_4 = 0, 31 do
        local v63 = a1.bands[n_4 + 1]
        local v64
        v64 = v61 + (((n_4 - v61) % 32) + 32) % 32
        if v64 ~= a1.bandRow[n_4 + 1] or a3 then
            if v64 == a1.bandRow[n_4 + 1] then
                v63.CFrame = CFrame.new(a1.origin + Vector3.new(a1.bandsCenterX, v64 * 4, -5.25))
                continue
            end
            a1.bandRow[n_4 + 1] = v64
            if v64 % 2 ~= 0 then
                v62 = u2
            else
                v62 = u1
            end
            v63.Color = v62
            v63.CFrame = CFrame.new(a1.origin + Vector3.new(a1.bandsCenterX, v64 * 4, -5.25))
        else
            continue
        end
    end
end
u7.updateRivers = function(a1, a2, a3, a4)
    --[[
      name: updateRivers
      line: 808
      upvalues:
        u5 (copy, index: 1)
        u3 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    local v65 = math.round(a3 / 68) - 1
    local v66, _, v67 = nil, nil, nil
    for n_5 = 0, 2 do
        local v68 = v65 + n_5
        v67 = a1.rivers[(n_5 * 2) + 1]
        local v69 = a1.rivers[(n_5 * 2) + 2]
        local v70 = a1.riverBand[n_5 + 1] ~= v68
        local v71 = nil
        if v70 then
            a1.riverBand[n_5 + 1] = v68
            v71 = a1:riverShape(v68)
            a1.riverRowStart[n_5 + 1] = ((v71 == nil) and math.huge) or (v71.rowStart)
            a1.riverRowCount[n_5 + 1] = ((v71 == nil) and 0) or (v71.rowCount)
            if v71 ~= nil then
                if v71.rowStart % 2 ~= 0 then
                    v66 = u4
                else
                    v66 = u3
                end
                v67.Color = v66
                if (v72.rowStart + 1) % 2 ~= 0 then
                    v66 = u4
                else
                    v66 = u3
                end
                v69.Color = v66
            else
                v67.CFrame = u5
                v69.CFrame = u5
                a1:parkRiverLogs(n_5)
            end
        end
        v71 = a1.riverRowStart[n_5 + 1]
        if v71 == math.huge then
            continue
        end
        v66 = a1.riverRowCount[n_5 + 1]
        if v70 or a4 then
            v67.CFrame = CFrame.new(a1.origin + Vector3.new(a1.bandsCenterX, v71 * 4, -4.45))
            local v73
            if v66 <= 1 then
                v73 = u5
            else
                v73 = CFrame.new(a1.origin + Vector3.new(a1.bandsCenterX, (v71 + 1) * 4, -4.45))
            end
            v69.CFrame = v73
        end
        a1:poseRiverLogs(n_5, v68, v71, v66, a2)
    end
end
u7.parkRiverLogs = function(a1, a2)
    --[[
      name: parkRiverLogs
      line: 854
      upvalues:
        u5 (copy, index: 1)
    ]]
    for n_6 = 0, 3 do
        local v74 = a2 * 4 + n_6
        local v75
        v75 = a1.logs[v74 + 1]
        if v75 ~= nil then
            a1.logBand[v74 + 1] = math.huge
            a1.logCellX[v74 + 1] = math.huge
            v75:PivotTo(u5)
        end
    end
end
u7.poseRiverLogs = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: poseRiverLogs
      line: 866
      upvalues:
        u5 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    for n_7 = 0, 3 do
        local v76 = a2 * 4 + n_7
        local v77
        v77 = a1.logs[v76 + 1]
        local v78
        if v77 == nil then
            continue
        end
        v78 = math.floor(((a6 - (n_7 * 36)) / 144) + 0.5) * 4 + n_7
        if a1.logBand[v76 + 1] == a3 and a1.logCellX[v76 + 1] == v78 then
            continue
        else
            a1.logBand[v76 + 1] = a3
            a1.logCellX[v76 + 1] = v78
            if a1:hash(v78, a3, 227) < 0.45 then
                local v79 = math.round(((v78 * 36) + (((a1:hash(v78, a3, 229) * 2) - 1) * 14)) / 4) * 4
                local v80 = a4 + math.floor(a1:hash(v78, a3, 233) * a5)
                local v81 = (a1:hash(v78, a3, 239) - 0.5) * 0.4
                v77:PivotTo((CFrame.new(a1.origin + Vector3.new(v79, v80 * 4, -4.12)) * CFrame.Angles(0, 0, v81)) * u6)
            else
                v77:PivotTo(u5)
            end
        end
    end
end
u7.updateLakes = function(a1, a2, a3)
    --[[
      name: updateLakes
      line: 897
      upvalues:
        u5 (copy, index: 1)
        u3 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    for n_8 = 0, #a1.lakeSlabs - 1 do
        local v82 = n_8 % 2
        local v83 = math.floor(n_8 / 2)
        local v84
        v84 = math.floor(((a2 - (v82 * 96)) / 192) + 0.5) * 2 + v82
        local v85 = math.floor(((a3 - (v83 * 96)) / 192) + 0.5) * 2 + v83
        local n_8
        if v84 ~= a1.lakeCellX[n_8 + 1] then
            a1.lakeCellX[n_8 + 1] = v84
            a1.lakeCellY[n_8 + 1] = v85
            local v86
            v86 = a1:lakeShape(v84, v85)
            a1:poseLakePads(n_8, v84, v85, v86)
            local v87
            v87 = a1.lakeSlabs[n_8 + 1]
            local v88
            v88 = 0
            local v89
            v89 = false
            local v90 = nil
            if v89 then
                v88 = v88 + 1
            else
                v89 = true
            end
            local v91
            if v88 >= 5 then
                continue
            end
            v91 = v87[v88 + 1]
            if v86 == nil then
                v91.CFrame = u5
            else
                local v92 = nil
                if v86.rows > v88 then
                    v92 = v86.rowStart + v88
                    v91.Size = Vector3.new(((v86.halfCells[v88 + 1] * 2) + 1) * 4, 4, 0.45)
                    if v92 % 2 ~= 0 then
                        v90 = u4
                    else
                        v90 = u3
                    end
                    v91.Color = v90
                    v91.CFrame = CFrame.new(a1.origin + Vector3.new(v86.centerCell[v88 + 1] * 4, v92 * 4, -5))
                else
                    v91.CFrame = u5
                end
            end
            local _, v93
            _, v93 = nil, nil
            --[[ goto label_4 ]]--
        else
            local v86, v87, v88, v89, v88, v86, _, v93
            if v85 == a1.lakeCellY[n_8 + 1] then
                continue
            end
            a1.lakeCellX[n_8 + 1] = v84
            a1.lakeCellY[n_8 + 1] = v85
            v86 = a1:lakeShape(v84, v85)
            a1:poseLakePads(n_8, v84, v85, v86)
            v87 = a1.lakeSlabs[n_8 + 1]
            v88 = 0
            v89 = false
            local v90 = nil
            --[[ label_4 ]]--
            if v89 then
                v88 = v88 + 1
            else
                v89 = true
            end
            local v91
            if v88 >= 5 then
                continue
            end
            v91 = v87[v88 + 1]
            if v86 == nil then
                v91.CFrame = u5
            else
                local v92 = nil
                if v86.rows > v88 then
                    v92 = v86.rowStart + v88
                    v91.Size = Vector3.new(((v86.halfCells[v88 + 1] * 2) + 1) * 4, 4, 0.45)
                    if v92 % 2 ~= 0 then
                        v90 = u4
                    else
                        v90 = u3
                    end
                    v91.Color = v90
                    v91.CFrame = CFrame.new(a1.origin + Vector3.new(v86.centerCell[v88 + 1] * 4, v92 * 4, -5))
                else
                    v91.CFrame = u5
                end
            end
            _, v93 = nil, nil
            --[[ goto label_4 ]]--
        end
    end
end
u7.poseLakePads = function(a1, a2, a3, a4, a5)
    --[[
      name: poseLakePads
      line: 944
      upvalues:
        u5 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    local v93 = ((a5 == nil) and 0) or (math.floor(a1:hash(a3, a4, 193) * 4))
    local v94 = math.huge
    local v95 = math.huge
    local v96 = math.huge
    local v97 = math.huge
    v94, v95, v96, v97 = v94, v95, v96, v97
    local v98 = nil
    for n_9 = 0, 2 do
        local v99
        v99 = a1.lilyPads[((a2 * 3) + n_9) + 1]
        if v99 == nil then
            continue
        end
        if a5 == nil or v93 <= n_9 then
            v99:PivotTo(u5)
            continue
        end
        local v100 = math.floor(a1:hash(a3, a4, (n_9 * 100) + 199) * a5.rows)
        local v101
        v101 = a5.centerCell[v100 + 1] + math.round(((a1:hash(a3, a4, (n_9 * 100) + 211) * 2) - 1) * a5.halfCells[v100 + 1])
        local v102 = a5.rowStart + v100
        if v101 ~= v94 then
            v98 = false
            if v101 == v96 then
                v98 = v102 == v97
            end
        else
            v98 = true
            if v102 ~= v95 then
                v98 = false
                if v101 == v96 then
                    v98 = v102 == v97
                end
            end
        end
        if v98 then
            v99:PivotTo(u5)
            continue
        end
        if v94 ~= math.huge then
            v96, v97 = v101, v102
        else
            v94, v95 = v101, v102
        end
        v99:PivotTo(CFrame.new(a1.origin + Vector3.new(v101 * 4, v102 * 4, -4.7)) * u6)
    end
end
u7.biomeDensity = function(a1, a2, a3)
    --[[
      name: biomeDensity
      line: 983
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
        tbl_upv_4 (copy, index: 4)
    ]]
    local v103 = math.round(a2 / 84)
    local v104 = math.round(a3 / 84)
    local v105 = a1:hash(v103, v104, 137)
    if v105 >= 0.52 then
        if v105 >= 0.75 then
            return tbl_upv_4
        end
        return tbl_upv_3
    elseif a1:hash(v103, v104, 139) >= 0.4 then
        return tbl_upv_1
    else
        return tbl_upv_2
    end
end
u7.updateLand = function(a1, a2, a3)
    --[[
      name: updateLand
      line: 995
      upvalues:
        u6 (copy, index: 1)
    ]]
    local v106, v107 = nil, nil
    for n_10 = 0, #a1.land - 1 do
        local v108
        v108 = a1.land[n_10 + 1]
        local v109 = n_10 % 27
        local v110 = math.floor(n_10 / 27)
        local v111
        v111 = math.floor(((a2 - (v109 * 4)) / 108) + 0.5) * 27 + v109
        local v112 = math.floor(((a3 - (v110 * 4)) / 108) + 0.5) * 27 + v110
        if v111 ~= v108.cellX then
            v108.cellX = v111
            v108.cellY = v112
            local v113
            v113 = v111 * 4
            local v114
            v114 = v112 * 4
            local v115 = a1:biomeDensity(v113, v114)
            local v116 = a1:hash(v111, v112, 149)
            local v117
            v117 = ((v116 < v115.tree) and 1) or (((v116 >= v115.tree + v115.rock) and 0) or 2)
            v106 = true
            if v117 ~= 0 then
                v106 = a1:isNearRoad(v113, v114, v117 ~= 1 and 1.8 or 3)
                v106 = v106 or a1:isWaterCell(v111, v112, v117 ~= 1 and 0 or 1)
            end
            if v106 then
                a1:hideLandSlot(v108)
                continue
            end
            if v117 ~= v108.kind or v108.model == nil then
                a1:releaseSlotModel(v108)
                v108.model = a1:claimModel(v117)
                if v108.model == nil then
                    v107 = 0
                else
                    v107 = v117
                end
                v108.kind = v107
            end
            v107 = v108.model
            if v107 ~= nil then
                v108.seatX = v113
                v108.seatY = v114
                v107:PivotTo(CFrame.new(a1.origin + Vector3.new(v113, v114, -3.3)) * u6)
            else
                a1:hideLandSlot(v108)
            end
        else
            local v113, v114, v117
            if v112 == v108.cellY then
                continue
            end
            v108.cellX = v111
            v108.cellY = v112
            v113 = v111 * 4
            v114 = v112 * 4
            local v115 = a1:biomeDensity(v113, v114)
            local v116 = a1:hash(v111, v112, 149)
            v117 = ((v116 < v115.tree) and 1) or (((v116 >= v115.tree + v115.rock) and 0) or 2)
            v106 = true
            if v117 ~= 0 then
                v106 = a1:isNearRoad(v113, v114, v117 ~= 1 and 1.8 or 3)
                v106 = v106 or a1:isWaterCell(v111, v112, v117 ~= 1 and 0 or 1)
            end
            if v106 then
                a1:hideLandSlot(v108)
                continue
            end
            if v117 ~= v108.kind or v108.model == nil then
                a1:releaseSlotModel(v108)
                v108.model = a1:claimModel(v117)
                if v108.model == nil then
                    v107 = 0
                else
                    v107 = v117
                end
                v108.kind = v107
            end
            v107 = v108.model
            if v107 ~= nil then
                v108.seatX = v113
                v108.seatY = v114
                v107:PivotTo(CFrame.new(a1.origin + Vector3.new(v113, v114, -3.3)) * u6)
            else
                a1:hideLandSlot(v108)
            end
        end
    end
end
u7.claimModel = function(a1, a2)
    --[[
      name: claimModel
      line: 1036
      upvalues:
        overrideFor_upv_1 (copy, index: 1)
        prepareProp_upv_1 (copy, index: 2)
    ]]
    local v118
    if a2 ~= 1 then
        v118 = a1.rockFree
    else
        v118 = a1.treeFree
    end
    local v119 = #v118
    local v120 = v118[v119]
    v118[v119] = nil
    if v120 == nil then
        local v121
        if a2 ~= 1 then
            v121 = a1.rockVariants
        else
            v121 = a1.treeVariants
        end
        if #v121 ~= 0 then
            local v122
            if a2 ~= 1 then
                v122 = a1.rockClones >= 150
            else
                v122 = a1.treeClones >= 280
            end
            local v123, v124 = nil, nil
            if not v122 then
                if a2 ~= 1 then
                    v122 = a1.rockClones
                else
                    v122 = a1.treeClones
                end
                local v125 = v121[(v122 % #v121) + 1]
                v123 = overrideFor_upv_1(v125.Name)
                local v126
                if v123 == nil then
                    v126 = v123
                else
                    v126 = v123.footprintFraction
                end
                local v127
                if v126 == nil then
                    v127 = 3.8
                else
                    v127 = 4 * v123.footprintFraction
                end
                local container_2 = a1.container
                local v128
                if v123 == nil then
                    v128 = v123
                else
                    v128 = v123.lengthStretch
                end
                v124 = prepareProp_upv_1(v125, container_2, v127, v128)
                if v124 ~= nil then
                    if a2 ~= 1 then
                        a1.rockClones = a1.rockClones + 1
                    else
                        a1.treeClones = a1.treeClones + 1
                    end
                    return v124
                end
            end
        end
        return nil
    end
    return v120
end
u7.hideLandSlot = function(a1, a2)
    --[[
      name: hideLandSlot
      line: 1078
    ]]
    if a2.seatX < -1e+08 and a2.model == nil then
        return nil
    end
    a1:releaseSlotModel(a2)
    a2.seatX = -1e+09
    a2.seatY = -1e+09
end
u7.onCornerDressed = function(a1, a2)
    --[[
      name: onCornerDressed
      line: 1086
      upvalues:
        ringSlot_upv_1 (copy, index: 1)
    ]]
    local v129 = ringSlot_upv_1(a1.track, a2)
    local track_2 = a1.track
    a1:evictInside(track_2.straightMinX[v129 + 1], track_2.straightMaxX[v129 + 1], track_2.straightMinY[v129 + 1], track_2.straightMaxY[v129 + 1])
    a1:evictInside(track_2.elbowMinX[v129 + 1], track_2.elbowMaxX[v129 + 1], track_2.elbowMinY[v129 + 1], track_2.elbowMaxY[v129 + 1])
end
u7.evictInside = function(a1, a2, a3, a4, a5)
    --[[
      name: evictInside
      line: 1092
    ]]
    local v130 = nil
    for _, value_12 in a1.land do
        if value_12.seatX < -1e+08 then
            continue
        end
        v130 = ((value_12.kind ~= 1) and 1.8) or 3
        if value_12.seatX < a2 - v130 or a3 + v130 < value_12.seatX or value_12.seatY < a4 - v130 then
            continue
        end
        if a5 + v130 >= value_12.seatY then
            a1:hideLandSlot(value_12)
        end
    end
end
local tbl_18 = {}
tbl_18.modelAabb = modelAabb_upv_1
tbl_18.SlingDecor = u7
return tbl_18