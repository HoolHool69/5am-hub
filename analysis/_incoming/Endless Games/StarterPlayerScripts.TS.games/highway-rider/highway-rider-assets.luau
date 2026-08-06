-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-biomes")
local HIGHWAY_BIOME_CHUNK_NAMES_upv_1 = v1.HIGHWAY_BIOME_CHUNK_NAMES
local HIGHWAY_OBSTRUCTION_FOLDER_NAME_upv_1 = v1.HIGHWAY_OBSTRUCTION_FOLDER_NAME
local HIGHWAY_OBSTRUCTION_NAMES_upv_1 = v1.HIGHWAY_OBSTRUCTION_NAMES
local HIGHWAY_TUNNEL_FOLDER_NAME_upv_1 = v1.HIGHWAY_TUNNEL_FOLDER_NAME
local HIGHWAY_TUNNEL_PIECE_NAMES_upv_1 = v1.HIGHWAY_TUNNEL_PIECE_NAMES
local HIGHWAY_RIDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-config").HIGHWAY_RIDER_CONFIG
local v2 = RuntimeLib_1.import(script, script.Parent, "highway-rider-vehicles")
local deriveVehicleFront_upv_1 = v2.deriveVehicleFront
local EXTRA_TRAFFIC_FOLDERS_upv_1 = v2.EXTRA_TRAFFIC_FOLDERS
local VEHICLE_PAINT_COLORS_upv_1 = v2.VEHICLE_PAINT_COLORS
local vehicleSpec_upv_1 = v2.vehicleSpec
local eyeHeight_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.modes.fp.camera.eyeHeight
local rider_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.rider
local tunnel_upv_1 = HIGHWAY_RIDER_CONFIG_upv_1.tunnel
local u1 = CFrame.new(0, -1000, 0)
local function flattenPart_1(a1)
    --[[
      name: flattenPart
      line: 183
    ]]
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
end
local stretchPartWorldX = nil
local function stretchRoadX_upv_1(a1, a2)
    --[[
      name: stretchRoadX
      line: 191
      upvalues:
        stretchPartWorldX (ref, index: 1)
    ]]
    for _, value_1 in a1:GetDescendants() do
        if value_1:IsA("BasePart") then
            local Position_1 = value_1.Position
            value_1.Position = Vector3.new(a2 + ((Position_1.X - a2) * 1.1666666666666667), Position_1.Y, Position_1.Z)
            stretchPartWorldX(value_1, 1.1666666666666667)
        end
    end
end
local function partWorldHalfExtents_upv_1(a1)
    --[[
      name: partWorldHalfExtents
      line: 228
    ]]
    local CFrame_1 = a1.CFrame
    local Size_1 = a1.Size
    return (Vector3.new((((math.abs(CFrame_1.XVector.X) * Size_1.X) + (math.abs(CFrame_1.YVector.X) * Size_1.Y)) + (math.abs(CFrame_1.ZVector.X) * Size_1.Z)) / 2, (((math.abs(CFrame_1.XVector.Y) * Size_1.X) + (math.abs(CFrame_1.YVector.Y) * Size_1.Y)) + (math.abs(CFrame_1.ZVector.Y) * Size_1.Z)) / 2, (((math.abs(CFrame_1.XVector.Z) * Size_1.X) + (math.abs(CFrame_1.YVector.Z) * Size_1.Y)) + (math.abs(CFrame_1.ZVector.Z) * Size_1.Z)) / 2))
end
stretchPartWorldX = function(a1, a2)
    --[[
      name: stretchPartWorldX
      line: 257
    ]]
    local Size_2 = a1.Size
    local CFrame_2 = a1.CFrame
    if math.abs(CFrame_2.RightVector.X) <= 0.9 then
        if math.abs(CFrame_2.LookVector.X) <= 0.9 then
            if math.abs(CFrame_2.UpVector.X) <= 0.9 then
                warn((("[highway-rider] part \"%*\" is not axis-aligned \226\128\148 world-X stretch skipped its size"):format(a1.Name)))
            else
                a1.Size = Vector3.new(Size_2.X, Size_2.Y * a2, Size_2.Z)
            end
        else
            a1.Size = Vector3.new(Size_2.X, Size_2.Y, Size_2.Z * a2)
        end
    else
        a1.Size = Vector3.new(Size_2.X * a2, Size_2.Y, Size_2.Z)
    end
end
local function sampleGrassColor_upv_1(a1)
    --[[
      name: sampleGrassColor
      line: 202
    ]]
    local v3 = nil
    local v4 = 0
    v3 = v3
    local _ = nil
    local v8 = nil
    local v5 = nil
    local v6 = nil
    local v9 = nil
    for v10, value_2 in a1:GetChildren() do
        if value_2.Name ~= "Grass" then
            continue
        end
        v5 = nil
        for v11, value_3 in value_2:GetDescendants() do
            v6 = value_3:IsA("BasePart")
            if not (v6) then
                continue
            end
            v6 = value_3.Size
            v5 = v6.X * v6.Y * v6.Z
            if v4 < v5 then
                v4, v3 = v5, value_3
            end
        end
    end
    local v7
    if v3 == nil then
        v7 = v3
    else
        v7 = v3.Color
    end
    return v7
end
local function resolveSlabFrame_upv_1(a1)
    --[[
      name: resolveSlabFrame
      line: 291
      upvalues:
        partWorldHalfExtents_upv_1 (copy, index: 1)
    ]]
    local Road_1 = a1:FindFirstChild("Road")
    if Road_1 ~= nil then
        local v8 = nil
        local v9 = 0
        local v10 = nil
        local v11 = nil
        local v12 = nil
        for _, value_4 in Road_1:GetDescendants() do
            v12 = value_4:IsA("BasePart")
            if not (v12) then
                continue
            end
            v11 = value_4.Size
            v10 = v11.X * v11.Y * v11.Z
            if v9 < v10 then
                v9, v8 = v10, value_4
            end
        end
        if v8 ~= nil then
            local v13 = nil
            if math.abs(v8.CFrame.RightVector.X) > 0.9 then
                v13 = partWorldHalfExtents_upv_1(v8)
                if math.abs((v13.Z * 2) - 150) <= 15 then
                    local Position_2 = v8.Position
                    local tbl_1 = {}
                    tbl_1.centerX = Position_2.X
                    tbl_1.topY = Position_2.Y + v13.Y
                    tbl_1.centerZ = Position_2.Z
                    return tbl_1
                end
                return nil
            end
        end
    end
    return nil
end
local function resolveBiomeRungs_upv_1(a1, a2, a3, a4, a5)
    --[[
      name: resolveBiomeRungs
      line: 347
      upvalues:
        resolveSlabFrame_upv_1 (copy, index: 1)
        sampleGrassColor_upv_1 (copy, index: 2)
    ]]
    local v14
    v14 = a5
    local v15, v16, v17 = nil, nil, nil
    local v18 = nil
    for _, value_5 in a2 do
        if a1 == nil then
            v18 = a1
        else
            v18 = a1:FindFirstChild(value_5)
        end
        v15 = v18 == nil or not (v18:IsA("Model")) or v18
        if v15 == nil then
            v16 = nil
        else
            v16 = resolveSlabFrame_upv_1(v15)
        end
        if v15 ~= nil and v16 ~= nil then
            if v14 == nil or math.abs(v16.centerX - v14.centerX) <= 0.5 and math.abs(v16.topY - v14.topY) <= 0.5 then
                if v14 == nil then
                    v14 = v16
                end
                local tbl_2 = {}
                tbl_2.name = value_5
                tbl_2.source = v15
                local centerZ_1 = v16.centerZ
                if v14 == nil then
                    local centerZ_2 = v14
                else
                    local centerZ_2 = centerZ_2.centerZ
                end
                local centerZ_2
                if centerZ_2 ~= nil then
                    v17 = centerZ_2
                else
                    v17 = v16.centerZ
                end
                tbl_2.slabOffsetZ = centerZ_1 - v17
                tbl_2.grassColor = sampleGrassColor_upv_1(v15)
                table.insert(a4, tbl_2)
            end
            warn((("[highway-rider] %*.%*: road deck at x %* / top y %* does not line up with %*.%* (x %* / top y %*) \226\128\148 biome skipped"):format(a3, value_5, v16.centerX, v16.topY, a3, a2[1], v14.centerX, v14.topY)))
            continue
        else
            if v14 ~= nil then
                warn((("[highway-rider] %*.%*: missing or no measurable road deck \226\128\148 biome skipped"):format(a3, value_5)))
                continue
            end
            return nil
        end
    end
    return v14
end
local prepareObstruction_upv_1 = {}
local resolveObstructions_upv_1 = {}
resolveObstructions_upv_1.__tostring = function()
    --[[
      name: __tostring
      line: 461
    ]]
    return "ObstructionVisual"
end
local u2 = setmetatable(prepareObstruction_upv_1, resolveObstructions_upv_1)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 466
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v19 = setmetatable({}, u2)
    return v19:constructor(...) or v19
end
u2.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 470
    ]]
    a1.name = a2
    a1.model = a3
    a1.props = a4
    local v20 = math.huge
    local v21 = -math.huge
    local v22 = 0
    for _, value_6 in a4 do
        if value_6.propClass ~= "decal" then
            v20, v21, v22 = math.min(v20, value_6.offsetX - value_6.halfWidth), math.max(v21, value_6.offsetX + value_6.halfWidth), math.max(v22, math.abs(value_6.offsetZ) + value_6.halfLength)
        end
    end
    a1.minX = v20
    a1.maxX = v21
    a1.halfLength = v22
end
u2.poseAt = function(a1, a2, a3, a4, a5)
    --[[
      name: poseAt
      line: 489
    ]]
    local v23 = a1.props[a2 + 1]
    if v23 ~= nil then
        v23.host:PivotTo(v23.localPivot + Vector3.new(a3.X, a3.Y + a4, a3.Z + a5))
    else
        return nil
    end
end
u2.poseFlung = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: poseFlung
      line: 499
    ]]
    local v24 = a1.props[a2 + 1]
    if v24 ~= nil then
        v24.host:PivotTo((CFrame.new(a3 + Vector3.new(a4, a5, a6)) * a7) * v24.localPivot.Rotation)
    else
        return nil
    end
end
u2.park = function(a1)
    --[[
      name: park
      line: 512
    ]]
    for _, value_7 in a1.props do
        value_7.host:PivotTo(value_7.localPivot + Vector3.new(0, -1000, 0))
    end
end
u2.parkProp = function(a1, a2)
    --[[
      name: parkProp
      line: 517
    ]]
    local v25 = a1.props[a2 + 1]
    if v25 ~= nil then
        v25.host:PivotTo(v25.localPivot + Vector3.new(0, -1000, 0))
    else
        return nil
    end
end
u2.destroy = function(a1)
    --[[
      name: destroy
      line: 524
    ]]
    a1.model:Destroy()
end
local isHeadlightBeam = nil
local function modelAabb_upv_1(a1)
    --[[
      name: modelAabb
      line: 234
      upvalues:
        partWorldHalfExtents_upv_1 (copy, index: 1)
    ]]
    local v26 = nil
    local v27 = nil
    local v28 = nil
    local v29 = nil
    local v30 = nil
    local Position_3 = nil
    local v31 = nil
    for _, value_8 in a1:GetDescendants() do
        v31 = value_8:IsA("BasePart")
        if not (v31) then
            continue
        end
        v30 = partWorldHalfExtents_upv_1(value_8)
        Position_3 = value_8.Position
        v28 = Position_3 - v30
        v29 = Position_3 + v30
        if v26 ~= nil then
            v26 = Vector3.new(math.min(v26.X, v28.X), math.min(v26.Y, v28.Y), math.min(v26.Z, v28.Z))
        else
            v26 = v28
        end
        if v27 ~= nil then
            v27 = Vector3.new(math.max(v27.X, v29.X), math.max(v27.Y, v29.Y), math.max(v27.Z, v29.Z))
        else
            v27 = v29
        end
    end
    if v26 ~= nil and v27 ~= nil then
        local tbl_3 = {}
        tbl_3.min = v26
        tbl_3.max = v27
        return tbl_3
    end
    return nil
end
prepareObstruction_upv_1 = function(a1, a2, a3)
    --[[
      name: prepareObstruction
      line: 546
      upvalues:
        isHeadlightBeam (ref,  index: 1)
        modelAabb_upv_1 (copy, index: 2)
        partWorldHalfExtents_upv_1 (copy, index: 3)
        u2 (ref,  index: 4)
    ]]
    local v32 = a1:Clone()
    for _, value_9 in v32:GetDescendants() do
        if value_9:IsA("BasePart") then
            value_9.Anchored = true
            value_9.CanCollide = false
            value_9.CanQuery = false
            value_9.CanTouch = false
            continue
        end
        if not (value_9:IsA("Beam")) then
            continue
        end
        if isHeadlightBeam(value_9) then
            value_9.Enabled = false
        end
    end
    local v33 = modelAabb_upv_1(v32)
    if v33 ~= nil then
        local v34 = (v33.min.Z + v33.max.Z) / 2
        local tbl_4 = {}
        local v35 = v34
        local _, v36, v37 = nil, nil, nil
        local v38 = nil
        for v46, value_10 in v32:GetChildren() do
            if value_10:IsA("Model") or value_10:IsA("BasePart") then
                if value_10:IsA("Model") then
                    v38 = modelAabb_upv_1(value_10)
                else
                    v38 = nil
                end
                local min_1
                if v38 == nil then
                    min_1 = v38
                else
                    min_1 = min_1.min
                end
                if min_1 ~= nil then
                    v36 = min_1
                else
                    v36 = value_10.Position - partWorldHalfExtents_upv_1(value_10)
                end
                local max_1
                if v38 == nil then
                    max_1 = v38
                else
                    max_1 = max_1.max
                end
                if max_1 ~= nil then
                    v37 = max_1
                else
                    v37 = value_10.Position + partWorldHalfExtents_upv_1(value_10)
                end
                local v39 = v37.Y - v36.Y
                local v40 = (v37.X - v36.X) / 2
                local v41 = (v37.Z - v36.Z) / 2
                local v42 = math.max(v40, v41) * 2
                local v43 = ((v39 < 0.3) and "decal") or (((v39 > 2.2) and "solid") or (((v42 > 3) and "debris") or "cone"))
                local v44 = (v36.X + v37.X) / 2 + a3.X
                table.insert(tbl_4, {host = value_10, localPivot = (value_10:GetPivot() + a3) + Vector3.new(v44 * 0.16666666666666674, 0, -v35), offsetX = v44 * 1.1666666666666667, offsetZ = ((v36.Z + v37.Z) / 2) - v35, halfWidth = v40, halfLength = v41, height = v39, propClass = v43})
            end
        end
        if #tbl_4 ~= 0 then
            v32.Parent = a2
            local v45 = u2.new(a1.Name, v32, tbl_4)
            v45:park()
            return v45
        end
    end
    v32:Destroy()
    return nil
end
local function prepareBiome_upv_1(a1, a2, a3)
    --[[
      name: prepareBiome
      line: 675
      upvalues:
        stretchRoadX_upv_1 (copy, index: 1)
        tunnel_upv_1 (copy, index: 2)
    ]]
    local v46 = a1.source:Clone()
    local Streaks_1 = v46:FindFirstChild("Streaks")
    if Streaks_1 ~= nil then
        Streaks_1:Destroy()
    end
    if a3 ~= nil then
        local Road_2 = v46:FindFirstChild("Road")
        if Road_2 ~= nil then
            stretchRoadX_upv_1(Road_2, a3)
        end
    end
    for _, value_11 in v46:GetDescendants() do
        if value_11:IsA("BasePart") then
            value_11.Anchored = true
            value_11.CanCollide = false
            value_11.CanQuery = false
            value_11.CanTouch = false
            continue
        end
        if value_11:IsA("Light") then
            value_11.Shadows = false
            if not (tunnel_upv_1.interiorLights) then
                value_11.Enabled = false
            end
        else
            if not (value_11:IsA("Beam")) then
                continue
            end
            if not (tunnel_upv_1.interiorBeams) then
                value_11.Enabled = false
            end
        end
    end
    local tbl_5 = {}
    tbl_5.template = v46
    tbl_5.localPivot = (v46:GetPivot() + a2) + Vector3.new(0, 0, -a1.slabOffsetZ)
    return tbl_5
end
local function ensurePreparedBiome_1(a1, a2, a3, a4)
    --[[
      name: ensurePreparedBiome
      line: 720
      upvalues:
        prepareBiome_upv_1 (copy, index: 1)
    ]]
    if a2 >= 0 then
        local v47 = nil
        if #a1 > a2 then
            local v48 = a1[a2 + 1]
            v47 = v48.prepared
            if v47 == nil then
                local v49 = prepareBiome_upv_1(v48, a3, a4)
                v48.prepared = v49
                return v49
            end
            return v47
        end
    end
    return nil
end
local function frontToDriverYaw_upv_1(a1)
    --[[
      name: frontToDriverYaw
      line: 735
    ]]
    if a1 ~= "+Z" then
        if a1 ~= "-Z" then
            return CFrame.Angles(0, ((a1 ~= "+X") and 1.5707963267948966) or -1.5707963267948966, 0)
        end
        return CFrame.Angles(0, math.pi, 0)
    end
    return CFrame.new()
end
local function carOrient_1(a1, a2)
    --[[
      name: carOrient
      line: 754
      upvalues:
        deriveVehicleFront_upv_1 (copy, index: 1)
        frontToDriverYaw_upv_1 (copy, index: 2)
    ]]
    local v50 = deriveVehicleFront_upv_1(a1, a2)
    if v50 == nil then
        warn((("[highway-rider] vehicle \"%*\" has no facing cue \226\128\148 assuming front = +Z"):format(a1.Name)))
        return CFrame.new()
    end
    return frontToDriverYaw_upv_1(v50)
end
local tbl_upv_6 = {1, 1.017, 0.984, 1.009, 0.992}
local tbl_upv_7 = {1, 0.85, 0.75, 0.7, 0.7}
local tbl_upv_8 = {0, 0.37, 0.71, 1.13, 1.51}
local paintTrafficClone_upv_1 = {}
local tbl_9 = {}
tbl_9.__tostring = function()
    --[[
      name: __tostring
      line: 785
    ]]
    return "CarVisual"
end
local u3 = setmetatable(paintTrafficClone_upv_1, tbl_9)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 790
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v51 = setmetatable({}, u3)
    return v51:constructor(...) or v51
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 794
    ]]
    a1.beaconBank = -1
    a1.fadeStep = -1
    a1.headlightsWanted = false
    a1.beamsEnabled = false
    a1.model = a2.model
    a1.correction = a2.correction
    a1.kind = a2.kind
    a1.weight = a2.weight
    a1.halfLength = a2.halfLength
    a1.halfWidth = a2.halfWidth
    a1.height = a2.height
    a1.special = a2.special
    a1.headlights = a2.headlights
    a1.beacons = a2.beacons
    a1.siren = a2.siren
    a1.emergency = a2.emergency
    a1.fadeParts = a2.fadeParts
    a1.sirenDetune = a2.sirenDetune
    a1.sirenVolumeFactor = a2.sirenVolumeFactor
    a1.beaconPhaseOffset = a2.beaconPhaseOffset
end
u3.setFade = function(a1, a2)
    --[[
      name: setFade
      line: 816
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local trafficFade_1 = HIGHWAY_RIDER_CONFIG_upv_1.trafficFade
    local v52 = math.floor((math.clamp(a2, 0, 1) * trafficFade_1.steps) + 0.5)
    if v52 ~= a1.fadeStep then
        a1.fadeStep = v52
        for _, value_12 in a1.fadeParts do
            value_12.part.Transparency = 1 - ((1 - value_12.base) * (v52 / trafficFade_1.steps))
        end
        a1:applyBeams(trafficFade_1.beamStep <= v52)
    else
        return nil
    end
end
u3.applyBeams = function(a1, a2)
    --[[
      name: applyBeams
      line: 832
    ]]
    local v53 = a1.headlightsWanted and a2
    if v53 ~= a1.beamsEnabled then
        a1.beamsEnabled = v53
        for _, value_13 in a1.headlights do
            value_13.Enabled = v53
        end
    else
        return nil
    end
end
u3.startSiren = function(a1, a2)
    --[[
      name: startSiren
      line: 842
    ]]
    local siren_1 = a1.siren
    if siren_1 ~= nil then
        siren_1.Volume = 0.6 * a1.sirenVolumeFactor
        local v54
        if siren_1.Playing then
            return nil
        end
        siren_1.Playing = true
        v54 = siren_1.TimeLength
        if v54 > 0 and a2 > 0 then
            siren_1.TimePosition = a2 % v54
        end
    else
        return nil
    end
end
u3.stopSiren = function(a1)
    --[[
      name: stopSiren
      line: 857
    ]]
    local siren_2 = a1.siren
    if siren_2 ~= nil and siren_2.Playing then
        siren_2.Playing = false
    else
        return nil
    end
end
u3.setSirenPitch = function(a1, a2)
    --[[
      name: setSirenPitch
      line: 864
    ]]
    local siren_3 = a1.siren
    local v55 = nil
    if siren_3 ~= nil then
        v55 = a2 * a1.sirenDetune
        if math.abs(siren_3.PlaybackSpeed - v55) >= 0.02 then
            siren_3.PlaybackSpeed = v55
        else
            return nil
        end
    else
        return nil
    end
end
u3.follow = function(a1, a2)
    --[[
      name: follow
      line: 876
    ]]
    a1.model:PivotTo(a2 * a1.correction)
end
u3.park = function(a1)
    --[[
      name: park
      line: 882
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.model:PivotTo(u1)
    a1:setBeaconsLit(false)
    a1:stopSiren()
end
u3.setHeadlights = function(a1, a2)
    --[[
      name: setHeadlights
      line: 889
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.headlightsWanted = a2
    local v56 = true
    if a1.fadeStep >= 0 then
        v56 = HIGHWAY_RIDER_CONFIG_upv_1.trafficFade.beamStep <= a1.fadeStep
    end
    a1:applyBeams(v56)
end
u3.setBeaconPhase = function(a1, a2)
    --[[
      name: setBeaconPhase
      line: 893
    ]]
    local v57 = ((a2 >= 0.5) and 1) or 0
    if v57 ~= a1.beaconBank then
        a1.beaconBank = v57
        for n_1 = 0, #a1.beacons - 1 do
            local v58 = a1.beacons[n_1 + 1]
            local v59 = n_1 % 2 == v57
            local part_1 = v58.part
            local v60
            if v59 then
                v60 = v58.color
            else
                v60 = v58.color:Lerp(Color3.fromRGB(0, 0, 0), 0.8)
            end
            part_1.Color = v60
        end
    else
        return nil
    end
end
u3.setBeaconsLit = function(a1, a2)
    --[[
      name: setBeaconsLit
      line: 905
    ]]
    if #a1.beacons ~= 0 then
        a1.beaconBank = -1
        local part_2 = nil
        local v61 = nil
        for _, value_14 in a1.beacons do
            part_2 = value_14.part
            if a2 then
                v61 = value_14.color
            else
                v61 = value_14.color:Lerp(Color3.fromRGB(0, 0, 0), 0.8)
            end
            part_2.Color = v61
        end
    else
        return nil
    end
end
local function prepareTrafficVariants_upv_1(a1, a2, a3, a4, a5, a6)
    --[[
      name: prepareTrafficVariants
      line: 926
      upvalues:
        prepareTrafficVariants_upv_1 (copy, index: 1)
        modelAabb_upv_1 (copy, index: 2)
        deriveVehicleFront_upv_1 (copy, index: 3)
        vehicleSpec_upv_1 (copy, index: 4)
    ]]
    if a6 == nil then
        local tbl_10 = {}
        a6 = tbl_10
    end
    if a1 ~= nil then
        local v62, v63, v64, v65, v66 = nil, nil, nil, nil, nil
        local v67 = nil
        for _, value_15 in a1:GetChildren() do
            if value_15:IsA("Folder") then
                if table.find(a6, value_15.Name) == nil then
                    prepareTrafficVariants_upv_1(value_15, a2, a3, a4, a5, a6)
                end
            else
                local v68, v69
                if not (value_15:IsA("Model")) then
                    continue
                end
                v68 = value_15:Clone()
                v68:ScaleTo(v68:GetScale() * 1)
                v69 = modelAabb_upv_1(v68)
                local v70, v71
                if v69 == nil then
                    continue
                end
                local v72 = (v69.min + v69.max) * 0.5
                v68.WorldPivot = CFrame.new(v72)
                v70 = CFrame.new(0, (v72.Y - v69.min.Y) - 1, 0)
                v71 = deriveVehicleFront_upv_1(v68, v72)
                local v73
                if v71 == nil then
                    warn((("[highway-rider] vehicle \"%*\" has no facing cue \226\128\148 assuming front = +Z"):format(v68.Name)))
                    v73 = CFrame.new()
                elseif v71 == "+Z" then
                    v73 = CFrame.new()
                elseif v71 ~= "-Z" then
                    v73 = CFrame.Angles(0, ((v71 ~= "+X") and 1.5707963267948966) or -1.5707963267948966, 0)
                else
                    v73 = CFrame.Angles(0, math.pi, 0)
                end
                v67 = vehicleSpec_upv_1(value_15.Name)
                if v67 == nil then
                    v62 = v67
                else
                    v62 = v67.kind
                end
                if v62 ~= nil then
                    v63 = v62
                else
                    v63 = "car"
                end
                local tbl_11 = {}
                tbl_11.name = value_15.Name
                tbl_11.template = v68
                tbl_11.correction = v70 * v73
                tbl_11.kind = v63
                local v74
                if v67 == nil then
                    v74 = v67
                else
                    v74 = v67.weight
                end
                if v74 ~= nil then
                    v64 = v74
                else
                    v64 = "medium"
                end
                tbl_11.weight = v64
                local v75
                if v67 == nil then
                    v75 = v67
                else
                    v75 = v67.emergency
                end
                tbl_11.emergency = v75
                local v76
                if v67 == nil then
                    v76 = v67
                else
                    v76 = v67.special
                end
                tbl_11.special = v76
                local v77
                if v67 == nil then
                    v77 = v67
                else
                    v77 = v67.paintParts
                end
                if v77 ~= nil then
                    v65 = v77
                else
                    v65 = {}
                end
                tbl_11.paintParts = v65
                local v78
                if v67 == nil then
                    v78 = v67
                else
                    v78 = v67.livery
                end
                if v78 ~= nil then
                    v66 = v78
                else
                    v66 = {}
                end
                tbl_11.livery = v66
                tbl_11.halfLength = math.max(4, (v69.max.Z - v69.min.Z) / 2)
                tbl_11.halfWidth = math.max(2.1, (v69.max.X - v69.min.X) / 2)
                tbl_11.height = v69.max.Y - v69.min.Y
                local v79
                if v67 == nil then
                    v79 = v67
                else
                    v79 = v67.special
                end
                if v79 ~= nil then
                    table.insert(a5, tbl_11)
                    continue
                end
                if v63 == "emergency" then
                    table.insert(a4, tbl_11)
                    continue
                end
                if v63 ~= "truck" then
                    table.insert(a2, tbl_11)
                else
                    table.insert(a3, tbl_11)
                end
            end
        end
    else
        return nil
    end
end
local u4 = nil
local function makePooledCarVisual_upv_1(a1, a2, a3, a4)
    --[[
      name: makePooledCarVisual
      line: 1101
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v80 = false
    if #a4 > 0 then
        v80 = a2 % 4 == 3
    end
    local v81
    if v80 then
        v81 = a4
    else
        v81 = a3
    end
    if #v81 ~= 0 then
        return u4(a1, v81[(math.floor(a2 / ((v80 and 4) or 1)) % #v81) + 1], a2)
    end
    return nil
end
local makeSiren = nil
paintTrafficClone_upv_1 = function(a1, a2, a3)
    --[[
      name: paintTrafficClone
      line: 1060
      upvalues:
        VEHICLE_PAINT_COLORS_upv_1 (copy, index: 1)
    ]]
    if #a2.livery > 0 then
        local _ = nil
        local v83 = nil
        for v84, value_16 in a1:GetDescendants() do
            if not (value_16:IsA("BasePart")) then
                continue
            end
            for v85, value_17 in a2.livery do
                if table.find(value_17.parts, value_16.Name) ~= nil then
                    value_16.Color = value_17.color
                end
            end
        end
    end
    if #a2.paintParts ~= 0 then
        local v82 = VEHICLE_PAINT_COLORS_upv_1[(a3 % #VEHICLE_PAINT_COLORS_upv_1) + 1]
        local value_18 = nil
        for _, value_18 in a1:GetDescendants() do
            if not (value_18:IsA("BasePart")) then
                continue
            end
            if table.find(a2.paintParts, value_18.Name) ~= nil then
                value_18.Color = v82
            end
        end
    else
        return nil
    end
end
local function u5(a1, a2, a3, a4)
    --[[
      name: dressTrafficSlot
      line: 1115
      upvalues:
        isHeadlightBeam (ref,  index: 1)
        paintTrafficClone_upv_1 (copy, index: 2)
        makeSiren (ref,  index: 3)
        u1 (copy, index: 4)
        tbl_upv_6 (copy, index: 5)
        u3 (ref,  index: 6)
        tbl_upv_7 (copy, index: 7)
    ]]
    if a4 == nil then
        a4 = 0
    end
    local v83 = a2.template:Clone()
    local tbl_12 = {}
    local tbl_13 = {}
    local tbl_14 = {}
    local v84 = v83:FindFirstChild("EmergencyLight", true)
    for _, value_19 in v83:GetDescendants() do
        if value_19:IsA("BasePart") then
            value_19.Anchored = true
            value_19.CanCollide = false
            value_19.CanQuery = false
            value_19.CanTouch = false
            table.insert(tbl_14, {part = value_19, base = value_19.Transparency})
            if v84 ~= nil and value_19.Material == Enum.Material.Neon and value_19:IsDescendantOf(v84) then
                table.insert(tbl_13, {part = value_19, color = value_19.Color})
            end
        end
        if not (value_19:IsA("Beam")) then
            continue
        end
        if isHeadlightBeam(value_19) then
            value_19.Enabled = false
            table.insert(tbl_12, value_19)
        end
    end
    paintTrafficClone_upv_1(v83, a2, a3)
    local v85
    if a2.emergency == nil then
        v85 = nil
    else
        v85 = makeSiren(v83, a2.emergency)
    end
    v83:PivotTo(u1)
    v83.Parent = a1
    local v86 = a4 % #tbl_upv_6
    return u3.new({model = v83, correction = a2.correction, kind = a2.kind, weight = a2.weight, halfLength = a2.halfLength, halfWidth = a2.halfWidth, height = a2.height, special = a2.special, headlights = tbl_12, beacons = tbl_13, siren = v85, emergency = a2.emergency, fadeParts = tbl_14, sirenDetune = tbl_upv_6[v86 + 1], sirenVolumeFactor = tbl_upv_7[v86 + 1], beaconPhaseOffset = (a4 * 0.618) % 1})
end
isHeadlightBeam = function(a1)
    --[[
      name: isHeadlightBeam
      line: 1198
    ]]
    local Parent_1 = a1.Parent
    if Parent_1 ~= nil then
        Parent_1 = Parent_1.Parent
        if Parent_1 ~= nil then
            Parent_1 = Parent_1.Name
        end
    end
    local v87
    if Parent_1 == "BodyColor" then
        v87 = true
    else
        v87 = false
    end
    return v87 or (a1.Width0 * 2 < a1.Width1)
end
makeSiren = function(a1, a2)
    --[[
      name: makeSiren
      line: 1210
      upvalues:
        createGameLoopSound_upv_1 (copy, index: 1)
        SOUND_IDS_upv_1 (copy, index: 2)
    ]]
    local v88 = nil
    local v89 = 0
    local v90 = nil
    local v91 = nil
    local v92 = nil
    for _, value_20 in a1:GetDescendants() do
        v92 = value_20:IsA("BasePart")
        if not (v92) then
            continue
        end
        v91 = value_20.Size
        v90 = v91.X * v91.Y * v91.Z
        if v89 < v90 then
            v89, v88 = v90, value_20
        end
    end
    if v88 ~= nil then
        local tbl_15 = {}
        local v93
        if a2 ~= "police" then
            v93 = SOUND_IDS_upv_1.sirenAmbulance
        else
            v93 = SOUND_IDS_upv_1.sirenPolice
        end
        tbl_15.soundId = v93
        tbl_15.parent = v88
        local v94 = createGameLoopSound_upv_1(tbl_15)
        v94.RollOffMode = Enum.RollOffMode.InverseTapered
        v94.RollOffMinDistance = 22
        v94.RollOffMaxDistance = 480
        return v94
    end
    return nil
end
local function parkPieces_1(a1)
    --[[
      name: parkPieces
      line: 1252
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_21 in a1 do
        value_21.part.Anchored = true
        value_21.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_21.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_21.part.CFrame = u1
    end
end
local tbl_16 = {}
local tbl_17 = {}
tbl_17.__tostring = function()
    --[[
      name: __tostring
      line: 1276
    ]]
    return "AuthoredBikeRig"
end
local u6 = setmetatable(tbl_16, tbl_17)
u6.__index = u6
u6.new = function(...)
    --[[
      name: new
      line: 1281
      upvalues:
        u6 (ref, index: 1)
    ]]
    local v95 = setmetatable({}, u6)
    return v95:constructor(...) or v95
end
u6.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 1285
      upvalues:
        partWorldHalfExtents_upv_1 (copy, index: 1)
        modelAabb_upv_1 (copy, index: 2)
        rider_upv_1 (copy, index: 3)
        eyeHeight_upv_1 (copy, index: 4)
    ]]
    a1.pieces = {}
    a1.headlights = {}
    a1.needleArm = 0
    a1.lastSpeedFraction = -1
    local v96 = a2:Clone()
    local tbl_18 = {}
    for _, value_22 in v96:GetDescendants() do
        if value_22:IsA("BasePart") then
            value_22.Anchored = true
            value_22.CanCollide = false
            value_22.CanQuery = false
            value_22.CanTouch = false
            table.insert(tbl_18, value_22)
            continue
        end
        if value_22:IsA("Beam") then
            value_22.Enabled = false
            table.insert(a1.headlights, value_22)
        end
    end
    local v97 = nil
    local v98 = 0
    local v99, v100 = v98, v97
    local v101 = nil
    for _, value_23 in tbl_18 do
        v101 = partWorldHalfExtents_upv_1(value_23).X * 2
        if v99 < v101 then
            v99, v100 = v101, value_23
        end
    end
    local v102
    if v100 == nil or v99 <= 0.5 then
        v102 = 1
    else
        v102 = math.clamp(v99 / 2.5, 0.5, 1.5)
    end
    a1.riderScale = v102
    v96:ScaleTo(v96:GetScale() * 1.1)
    local v103 = modelAabb_upv_1(v96)
    local v104 = nil
    if v103 ~= nil then
        local v105 = (v103.min + v103.max) * 0.5
        local value_23 = CFrame.new(v105)
        if v100 == nil then
            v101 = v105
        else
            v101 = v100.Position
        end
        local riderScale_1 = a1.riderScale
        a1.riderLift = ((v101.Y - v103.min.Y) - ((1.59 - rider_upv_1.rootHeight) * riderScale_1)) - rider_upv_1.rootHeight
        a1.cameraLift = a1.riderLift + ((eyeHeight_upv_1 - rider_upv_1.rootHeight) * (riderScale_1 - 1))
        local v106 = (rider_upv_1.rootBack + ((1.69 - rider_upv_1.rootBack) * riderScale_1)) - (v101.Z - v105.Z) + 0.32
        local v107 = CFrame.new(0, v105.Y - v103.min.Y, v106)
        local v108 = nil
        local v109 = nil
        for _, value_24 in tbl_18 do
            if v103.min.Y + 0.05 < value_24.Position.Y - partWorldHalfExtents_upv_1(value_24).Y then
                continue
            end
            if v105.Z > value_24.Position.Z then
                if v109 == nil or value_24.Position.Z < v109.Z then
                    v109 = value_24.Position
                end
            elseif v108 == nil or v108.Z < value_24.Position.Z then
                v108 = value_24.Position
            end
        end
        a1.wheeliePivotZ = ((v109 == nil) and -1.5) or (v109.Z - v105.Z + v106)
        local v110, v111, v111 = nil, nil, nil
        for v112, v113 in tbl_18 do
            if v108 == nil then
                if v109 == nil then
                    v110 = nil
                else
                    v111 = false
                    if math.abs(v113.Position.Y - v109.Y) <= 0.2 then
                        v111 = math.abs(v113.Position.Z - v109.Z) <= 0.2
                    end
                    if v111 then
                        v110 = v109
                    else
                        v110 = nil
                    end
                end
            else
                v111 = false
                if math.abs(v113.Position.Y - v108.Y) <= 0.2 then
                    v111 = math.abs(v113.Position.Z - v108.Z) <= 0.2
                end
                if v111 then
                    v110 = v108
                elseif v109 == nil then
                    v110 = nil
                else
                    v111 = false
                    if math.abs(v113.Position.Y - v109.Y) <= 0.2 then
                        v111 = math.abs(v113.Position.Z - v109.Z) <= 0.2
                    end
                    if v111 then
                        v110 = v109
                    else
                        v110 = nil
                    end
                end
            end
            if v110 == nil then
                table.insert(a1.pieces, {part = v113, offset = v107 * value_23:ToObjectSpace(v113.CFrame)})
            else
                local v114 = CFrame.new(v110)
                table.insert(a1.pieces, {part = v113, offset = v107 * value_23:ToObjectSpace(v114), spinLocal = v114:ToObjectSpace(v113.CFrame)})
            end
        end
        v104 = v96:FindFirstChild("Needle", true)
        local v115 = v96:FindFirstChild("GaugeHub", true)
        local v116 = v96:FindFirstChild("GaugeFace", true)
        local v112
        v112 = v104 == nil or not (v104:IsA("BasePart")) or v104
        local v113
        v113 = v115 == nil or not (v115:IsA("BasePart")) or v115
        v110 = v116 == nil or not (v116:IsA("BasePart")) or v116
        if v112 ~= nil and v113 ~= nil and v110 ~= nil then
            v111 = v110.CFrame.XVector
            if v111.Z > 0 then
                v111 = v111 * -1
            end
            local YVector_1 = v112.CFrame.YVector
            a1.needleHub = v107 * value_23:ToObjectSpace(CFrame.fromMatrix(v113.Position, v111:Cross(YVector_1), YVector_1))
            a1.needleArm = (v112.Position - v113.Position).Magnitude
            local v117
            v117 = nil
            for _, value_25 in a1.pieces do
                if value_25.part == v112 == true then
                    v117 = value_25
                    break
                end
            end
            a1.needlePiece = v117
        end
        v96.Parent = a3
        a1:setSpeedFraction(0)
        a1:park()
    else
        a1.riderScale = 1
        a1.riderLift = 0
        a1.cameraLift = 0
        a1.wheeliePivotZ = -1.5
        v96:Destroy()
        return nil
    end
end
u6.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 1428
    ]]
    local v118 = nil
    local v119 = nil
    for _, value_26 in a1.pieces do
        v118 = a2 * value_26.offset
        if value_26.spinLocal == nil then
            v119 = v118
        else
            v119 = v118 * CFrame.Angles(a3, 0, 0) * value_26.spinLocal
        end
        value_26.part.CFrame = v119
    end
end
u6.setSpeedFraction = function(a1, a2)
    --[[
      name: setSpeedFraction
      line: 1445
    ]]
    local needlePiece_1 = a1.needlePiece
    local needleHub_1 = a1.needleHub
    if needlePiece_1 ~= nil and needleHub_1 ~= nil then
        if math.abs(a2 - a1.lastSpeedFraction) >= 0.01 then
            a1.lastSpeedFraction = a2
            needlePiece_1.offset = needleHub_1 * CFrame.Angles(0, 0, math.rad(-135 + (270 * a2))) * CFrame.new(0, a1.needleArm, 0)
            return
        end
        return nil
    end
    return nil
end
local function flingPieces_upv_1(a1, a2, a3, a4)
    --[[
      name: flingPieces
      line: 1244
    ]]
    for _, value_27 in a1 do
        value_27.part.Anchored = false
        value_27.part.AssemblyLinearVelocity = Vector3.new(a3 * a2:NextNumber(6, 16), a2:NextNumber(10, 20), (a4 * 0.12) + a2:NextNumber(-4, 4))
        value_27.part.AssemblyAngularVelocity = Vector3.new(a2:NextNumber(-12, 12), a2:NextNumber(-12, 12), a2:NextNumber(-12, 12))
    end
end
u6.fling = function(a1, a2, a3, a4)
    --[[
      name: fling
      line: 1461
      upvalues:
        flingPieces_upv_1 (copy, index: 1)
    ]]
    flingPieces_upv_1(a1.pieces, a2, a3, a4)
end
u6.park = function(a1)
    --[[
      name: park
      line: 1464
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_28 in a1.pieces do
        value_28.part.Anchored = true
        value_28.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_28.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_28.part.CFrame = u1
    end
end
u6.setHeadlights = function(a1, a2)
    --[[
      name: setHeadlights
      line: 1467
    ]]
    for _, value_29 in a1.headlights do
        value_29.Enabled = a2
    end
end
local tbl_19 = {}
local tbl_20 = {}
tbl_20.__tostring = function()
    --[[
      name: __tostring
      line: 1488
    ]]
    return "AuthoredCarRig"
end
local u7 = setmetatable(tbl_19, tbl_20)
u7.__index = u7
u7.new = function(...)
    --[[
      name: new
      line: 1493
      upvalues:
        u7 (ref, index: 1)
    ]]
    local v120 = setmetatable({}, u7)
    return v120:constructor(...) or v120
end
u7.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 1497
      upvalues:
        modelAabb_upv_1 (copy, index: 1)
        deriveVehicleFront_upv_1 (copy, index: 2)
        partWorldHalfExtents_upv_1 (copy, index: 3)
    ]]
    a1.pieces = {}
    a1.headlights = {}
    local v121 = a2:Clone()
    local tbl_21 = {}
    for _, v122 in v121:GetDescendants() do
        if v122:IsA("BasePart") then
            v122.Anchored = true
            v122.CanCollide = false
            v122.CanQuery = false
            v122.CanTouch = false
            table.insert(tbl_21, v122)
            continue
        end
        if v122:IsA("Beam") then
            v122.Enabled = false
            table.insert(a1.headlights, v122)
        end
    end
    local v123 = modelAabb_upv_1(v121)
    local v124 = nil
    if v123 ~= nil then
        local v125 = (v123.min + v123.max) * 0.5
        local v122 = CFrame.new(v125)
        local v126 = CFrame.new(0, v125.Y - v123.min.Y, 0)
        v124 = deriveVehicleFront_upv_1(v121, v125)
        local v127
        if v124 == nil then
            warn((("[highway-rider] vehicle \"%*\" has no facing cue \226\128\148 assuming front = +Z"):format(v121.Name)))
            v127 = CFrame.new()
        elseif v124 == "+Z" then
            v127 = CFrame.new()
        elseif v124 ~= "-Z" then
            v127 = CFrame.Angles(0, ((v124 ~= "+X") and 1.5707963267948966) or -1.5707963267948966, 0)
        else
            v127 = CFrame.Angles(0, math.pi, 0)
        end
        local v128 = v126 * v127
        local v129 = nil
        local v130 = nil
        for _, value_30 in tbl_21 do
            if v123.min.Y + 0.05 < value_30.Position.Y - partWorldHalfExtents_upv_1(value_30).Y then
                continue
            end
            if v125.Z > value_30.Position.Z then
                if v130 == nil or value_30.Position.Z < v130.Z then
                    v130 = value_30.Position
                end
            elseif v129 == nil or v129.Z < value_30.Position.Z then
                v129 = value_30.Position
            end
        end
        local v131, v132, v132 = nil, nil, nil
        for _, value_31 in tbl_21 do
            if v129 == nil then
                if v130 == nil then
                    v131 = nil
                else
                    v132 = false
                    if math.abs(value_31.Position.Y - v130.Y) <= 0.2 then
                        v132 = math.abs(value_31.Position.Z - v130.Z) <= 0.2
                    end
                    if v132 then
                        v131 = v130
                    else
                        v131 = nil
                    end
                end
            else
                v132 = false
                if math.abs(value_31.Position.Y - v129.Y) <= 0.2 then
                    v132 = math.abs(value_31.Position.Z - v129.Z) <= 0.2
                end
                if v132 then
                    v131 = v129
                elseif v130 == nil then
                    v131 = nil
                else
                    v132 = false
                    if math.abs(value_31.Position.Y - v130.Y) <= 0.2 then
                        v132 = math.abs(value_31.Position.Z - v130.Z) <= 0.2
                    end
                    if v132 then
                        v131 = v130
                    else
                        v131 = nil
                    end
                end
            end
            if v131 == nil then
                table.insert(a1.pieces, {part = value_31, offset = v128 * v122:ToObjectSpace(value_31.CFrame)})
            else
                local v133 = CFrame.new(v131)
                table.insert(a1.pieces, {part = value_31, offset = v128 * v122:ToObjectSpace(v133), spinLocal = v133:ToObjectSpace(value_31.CFrame)})
            end
        end
        v121.Parent = a3
        a1:park()
    else
        v121:Destroy()
        return nil
    end
end
u7.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 1570
    ]]
    local v134 = nil
    local v135 = nil
    for _, value_32 in a1.pieces do
        v134 = a2 * value_32.offset
        if value_32.spinLocal == nil then
            v135 = v134
        else
            v135 = v134 * CFrame.Angles(a3, 0, 0) * value_32.spinLocal
        end
        value_32.part.CFrame = v135
    end
end
u7.fling = function(a1, a2, a3, a4)
    --[[
      name: fling
      line: 1587
      upvalues:
        flingPieces_upv_1 (copy, index: 1)
    ]]
    flingPieces_upv_1(a1.pieces, a2, a3, a4)
end
u7.park = function(a1)
    --[[
      name: park
      line: 1590
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_33 in a1.pieces do
        value_33.part.Anchored = true
        value_33.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_33.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        value_33.part.CFrame = u1
    end
end
u7.setHeadlights = function(a1, a2)
    --[[
      name: setHeadlights
      line: 1593
    ]]
    for _, value_34 in a1.headlights do
        value_34.Enabled = a2
    end
end
local tbl_22 = {}
local cloneNightLight_upv_1 = {}
cloneNightLight_upv_1.__tostring = function()
    --[[
      name: __tostring
      line: 1609
    ]]
    return "ChunkTile"
end
local u8 = setmetatable(tbl_22, cloneNightLight_upv_1)
u8.__index = u8
u8.new = function(...)
    --[[
      name: new
      line: 1614
      upvalues:
        u8 (ref, index: 1)
    ]]
    local v136 = setmetatable({}, u8)
    return v136:constructor(...) or v136
end
u8.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 1618
    ]]
    a1.model = a2
    a1.localPivot = a3
end
u8.poseAt = function(a1, a2, a3, a4)
    --[[
      name: poseAt
      line: 1622
    ]]
    a1.model:PivotTo(a1.localPivot + Vector3.new(a2.X, a2.Y + a3, a2.Z + a4))
end
u8.park = function(a1)
    --[[
      name: park
      line: 1628
    ]]
    a1.model:PivotTo(a1.localPivot + Vector3.new(0, -1000, 0))
end
local function cloneNightRays_upv_1(a1, a2)
    --[[
      name: cloneNightRays
      line: 1688
      upvalues:
        u8 (ref, index: 1)
    ]]
    local raysTemplate_1 = a1.raysTemplate
    local raysLocalPivot_1 = a1.raysLocalPivot
    if raysTemplate_1 ~= nil and raysLocalPivot_1 ~= nil then
        local v137 = raysTemplate_1:Clone()
        local tbl_23 = {}
        for _, value_35 in v137:GetDescendants() do
            if value_35:IsA("BasePart") then
                value_35.Anchored = true
                value_35.CanCollide = false
                value_35.CanQuery = false
                value_35.CanTouch = false
                value_35.Transparency = 1
                continue
            end
            if value_35:IsA("Beam") then
                value_35.Enabled = false
                table.insert(tbl_23, {beam = value_35, authoredTransparency = value_35.Transparency})
            end
        end
        v137.Parent = a2
        local tbl_24 = {}
        tbl_24.tile = u8.new(v137, raysLocalPivot_1)
        tbl_24.beams = tbl_23
        return tbl_24
    end
    return nil
end
local function cloneChunkTile_upv_1(a1, a2)
    --[[
      name: cloneChunkTile
      line: 1750
      upvalues:
        u8 (ref, index: 1)
    ]]
    if a2 ~= nil then
        local v138 = a2.template:Clone()
        v138.Parent = a1
        return u8.new(v138, a2.localPivot)
    end
    return nil
end
local tbl_25 = {}
local tbl_26 = {}
tbl_26.__tostring = function()
    --[[
      name: __tostring
      line: 1785
    ]]
    return "HighwayRiderFpAssets"
end
local u9 = setmetatable(tbl_25, tbl_26)
u9.__index = u9
u9.new = function(...)
    --[[
      name: new
      line: 1790
      upvalues:
        u9 (ref, index: 1)
    ]]
    local v139 = setmetatable({}, u9)
    return v139:constructor(...) or v139
end
local function resolveNightProps_upv_1(a1, a2)
    --[[
      name: resolveNightProps
      line: 1638
    ]]
    local v140
    if a1 == nil then
        v140 = a1
    else
        v140 = a1:FindFirstChild("NightStuff")
    end
    local v141 = nil
    if v140 == nil then
        v141 = v140
    else
        v141 = v141:FindFirstChild("Rays")
    end
    local v142 = nil
    if v140 == nil then
        v142 = v140
    else
        v142 = v142:FindFirstChild("Light")
    end
    local tbl_27 = {}
    local v143
    v143 = v141 == nil or not (v141:IsA("Model")) or v141
    tbl_27.raysTemplate = v143
    v143 = v141 == nil or not (v141:IsA("Model")) or v141:GetPivot() + a2
    tbl_27.raysLocalPivot = v143
    local v144
    v144 = v142 == nil or not (v142:IsA("BasePart")) or v142
    tbl_27.lightTemplate = v144
    v144 = v142 == nil or not (v142:IsA("BasePart")) or v142.Position + a2
    tbl_27.lightLocalOffset = v144
    return tbl_27
end
local function resolveTunnelRungs_upv_1(a1, a2, a3, a4)
    --[[
      name: resolveTunnelRungs
      line: 404
      upvalues:
        HIGHWAY_TUNNEL_FOLDER_NAME_upv_1 (copy, index: 1)
        resolveBiomeRungs_upv_1 (copy, index: 2)
        HIGHWAY_TUNNEL_PIECE_NAMES_upv_1 (copy, index: 3)
    ]]
    if a1 ~= nil then
        local v145 = nil
        if a4 ~= nil then
            v145 = a1:FindFirstChild(HIGHWAY_TUNNEL_FOLDER_NAME_upv_1)
            local v146 = nil
            if v145 ~= nil then
                v146 = #a3
                resolveBiomeRungs_upv_1(v145, HIGHWAY_TUNNEL_PIECE_NAMES_upv_1, ("%*.%*"):format(a2, HIGHWAY_TUNNEL_FOLDER_NAME_upv_1), a3, a4)
                if #a3 - v146 ~= #HIGHWAY_TUNNEL_PIECE_NAMES_upv_1 then
                    while v146 < #a3 do
                        a3[#a3] = nil
                    end
                    warn((("[highway-rider] %*: tunnel pieces incomplete \226\128\148 tunnels disabled for this kit"):format(a2)))
                    return nil
                end
                return v146
            end
        end
    end
    return nil
end
u9.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 1794
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        resolveBiomeRungs_upv_1 (copy, index: 2)
        HIGHWAY_BIOME_CHUNK_NAMES_upv_1 (copy, index: 3)
        resolveTunnelRungs_upv_1 (copy, index: 4)
        resolveNightProps_upv_1 (copy, index: 5)
        prepareTrafficVariants_upv_1 (copy, index: 6)
        EXTRA_TRAFFIC_FOLDERS_upv_1 (copy, index: 7)
    ]]
    if a2 == nil then
        local tbl_28 = {}
        a2 = tbl_28
    end
    a1.biomeRungs = {}
    a1.biomeRungCount = 0
    a1.carVariants = {}
    a1.truckVariants = {}
    a1.emergencyVariants = {}
    a1.specialVariants = {}
    local v147 = waitForSceneryRoot_upv_1("FP", "highway-rider")
    local v148
    if v147 == nil then
        v148 = v147
    else
        v148 = v147:FindFirstChild("Chunk")
    end
    local v149
    if v147 == nil then
        v149 = v147
    else
        v149 = v147:FindFirstChild("Mountains")
    end
    if v148 ~= nil and v148:IsA("Model") and v149 ~= nil and v149:IsA("Model") then
        local v150 = resolveBiomeRungs_upv_1(v147, HIGHWAY_BIOME_CHUNK_NAMES_upv_1.fp, "FP", a1.biomeRungs)
        a1.biomeRungCount = #a1.biomeRungs
        a1.tunnelBase = resolveTunnelRungs_upv_1(v147, "FP", a1.biomeRungs, v150)
        if #a1.biomeRungs ~= 0 then
            a1.available = true
            a1.grassColor = a1.biomeRungs[1].grassColor
            local v151
            if v147 == nil then
                v151 = v147
            else
                v151 = v147:FindFirstChild("Lighting")
            end
            a1.lighting = v151
            local v152
            if v147 == nil then
                v152 = v147
            else
                v152 = v147:FindFirstChild("NightLighting")
            end
            a1.nightLighting = v152
            a1.nightProps = resolveNightProps_upv_1(v147, Vector3.new(-1116, -200, 0))
            a1.mountainsTemplate = v149
            a1.mountainsLocalPivot = v149:GetPivot() + Vector3.new(-1116, -200, 0)
            local v153
            if v147 == nil then
                v153 = v147
            else
                v153 = v147:FindFirstChild("Cars")
            end
            prepareTrafficVariants_upv_1(v153, a1.carVariants, a1.truckVariants, a1.emergencyVariants, a1.specialVariants, EXTRA_TRAFFIC_FOLDERS_upv_1.fp)
            local v154
            if a2.newVehicles ~= true then
                v154 = {}
            else
                v154 = EXTRA_TRAFFIC_FOLDERS_upv_1.fp
            end
            local v155 = nil
            for _, value_36 in v154 do
                if v147 == nil then
                    v155 = v147
                else
                    v155 = v147:FindFirstChild(value_36)
                end
                prepareTrafficVariants_upv_1(v155, a1.carVariants, a1.truckVariants, a1.emergencyVariants, a1.specialVariants)
            end
            if v147 == nil then
                v154 = v147
            else
                v154 = v147:FindFirstChild("Motorcycle")
            end
            a1.motorcycleTemplate = v154 == nil or not (v154:IsA("Model")) or v154
            a1.obstructionsFolder = v147
        else
            warn("[highway-rider] FP.Chunk has no measurable road deck \226\128\148 using procedural fp world")
            a1.available = false
            return nil
        end
    else
        warn("[highway-rider] missing scenery kit FP (Chunk + Mountains) \226\128\148 using procedural fp world")
        a1.available = false
        return nil
    end
end
u9.makeBike = function(a1, a2)
    --[[
      name: makeBike
      line: 1866
      upvalues:
        u6 (ref, index: 1)
    ]]
    local motorcycleTemplate_1 = a1.motorcycleTemplate
    if motorcycleTemplate_1 ~= nil then
        return u6.new(motorcycleTemplate_1, a2)
    end
    return nil
end
resolveObstructions_upv_1 = function(a1, a2, a3, a4)
    --[[
      name: resolveObstructions
      line: 638
      upvalues:
        HIGHWAY_OBSTRUCTION_FOLDER_NAME_upv_1 (copy, index: 1)
        HIGHWAY_OBSTRUCTION_NAMES_upv_1 (copy, index: 2)
        prepareObstruction_upv_1 (copy, index: 3)
    ]]
    local tbl_30 = {}
    local v156
    if a1 == nil then
        v156 = a1
    else
        v156 = a1:FindFirstChild(HIGHWAY_OBSTRUCTION_FOLDER_NAME_upv_1)
    end
    if v156 ~= nil then
        local v157 = nil
        local v158 = nil
        for _, value_37 in HIGHWAY_OBSTRUCTION_NAMES_upv_1 do
            v157 = v156:FindFirstChild(value_37)
            if v157 == nil or not (v157:IsA("Model")) then
                warn((("[highway-rider] %*.%*.%*: missing \226\128\148 hazard skipped"):format(a3, HIGHWAY_OBSTRUCTION_FOLDER_NAME_upv_1, value_37)))
                continue
            end
            v158 = prepareObstruction_upv_1(v157, a2, a4)
            if v158 ~= nil then
                table.insert(tbl_30, v158)
            else
                warn((("[highway-rider] %*.%*.%*: nothing measurable \226\128\148 skipped"):format(a3, HIGHWAY_OBSTRUCTION_FOLDER_NAME_upv_1, value_37)))
            end
        end
    end
    return tbl_30
end
u9.makeObstructions = function(a1, a2)
    --[[
      name: makeObstructions
      line: 1873
      upvalues:
        resolveObstructions_upv_1 (copy, index: 1)
    ]]
    return (resolveObstructions_upv_1(a1.obstructionsFolder, a2, "FP", Vector3.new(-1116, -200, 0)))
end
u9.hasCars = function(a1)
    --[[
      name: hasCars
      line: 1876
    ]]
    return #a1.carVariants > 0
end
u9.emergencyKinds = function(a1)
    --[[
      name: emergencyKinds
      line: 1879
    ]]
    local tbl_31 = {}
    for _, value_38 in a1.emergencyVariants do
        if value_38.emergency ~= nil then
            table.insert(tbl_31, value_38.emergency)
        end
    end
    return tbl_31
end
u5 = function(a1, a2, a3, a4)
    --[[
      name: makeEmergencyVisual
      line: 1889
      upvalues:
        u5 (ref, index: 1)
    ]]
    if a4 == nil then
        a4 = 0
    end
    local v159
    v159 = nil
    for _, value_39 in a1.emergencyVariants do
        if value_39.emergency == a3 == true then
            v159 = value_39
            break
        end
    end
    if v159 == nil then
        return nil
    end
    return (u5(a2, v159, 0, a4))
end
u9.makeEmergencyVisual = u5
u9.specialKinds = function(a1)
    --[[
      name: specialKinds
      line: 1909
    ]]
    local tbl_32 = {}
    for _, value_40 in a1.specialVariants do
        if value_40.special ~= nil then
            table.insert(tbl_32, value_40.special)
        end
    end
    return tbl_32
end
u5 = function(a1, a2, a3)
    --[[
      name: makeSpecialVisual
      line: 1919
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v160
    v160 = nil
    for _, value_41 in a1.specialVariants do
        if value_41.special == a3 == true then
            v160 = value_41
            break
        end
    end
    if v160 == nil then
        return nil
    end
    return (u5(a2, v160, 0))
end
u9.makeSpecialVisual = u5
u9.makeCarVisual = function(a1, a2, a3)
    --[[
      name: makeCarVisual
      line: 1936
      upvalues:
        makePooledCarVisual_upv_1 (copy, index: 1)
    ]]
    return makePooledCarVisual_upv_1(a2, a3, a1.carVariants, a1.truckVariants)
end
u9.biomeCount = function(a1)
    --[[
      name: biomeCount
      line: 1939
    ]]
    return a1.biomeRungCount
end
u9.tunnelRungBase = function(a1)
    --[[
      name: tunnelRungBase
      line: 1942
    ]]
    return a1.tunnelBase
end
u9.biomeName = function(a1, a2)
    --[[
      name: biomeName
      line: 1945
    ]]
    if a2 >= 0 and a2 < #a1.biomeRungs then
        return a1.biomeRungs[a2 + 1].name
    end
    return "Chunk"
end
u9.biomeGrassColor = function(a1, a2)
    --[[
      name: biomeGrassColor
      line: 1948
    ]]
    if a2 >= 0 and a2 < #a1.biomeRungs then
        return a1.biomeRungs[a2 + 1].grassColor
    end
    return nil
end
u9.makeChunkTile = function(a1, a2, a3)
    --[[
      name: makeChunkTile
      line: 1951
      upvalues:
        prepareBiome_upv_1 (copy, index: 1)
        cloneChunkTile_upv_1 (copy, index: 2)
    ]]
    local biomeRungs_1 = a1.biomeRungs
    local v161
    if a3 < 0 then
        v161 = nil
    else
        local v162 = nil
        if #biomeRungs_1 > a3 then
            local v163 = biomeRungs_1[a3 + 1]
            v162 = v163.prepared
            if v162 == nil then
                local v164 = prepareBiome_upv_1(v163, Vector3.new(-1116, -200, 0), 1116)
                v163.prepared = v164
                v161 = v164
            else
                v161 = v162
            end
        else
            v161 = nil
        end
    end
    return cloneChunkTile_upv_1(a2, v161)
end
local function cloneMountains_upv_1(a1, a2, a3, a4, a5, a6)
    --[[
      name: cloneMountains
      line: 1759
    ]]
    if a2 ~= nil and a3 ~= nil then
        local v165 = a2:Clone()
        for _, value_42 in v165:GetDescendants() do
            if value_42:IsA("BasePart") then
                value_42.Anchored = true
                value_42.CanCollide = false
                value_42.CanQuery = false
                value_42.CanTouch = false
            end
        end
        v165:PivotTo(a3 + Vector3.new(a4.X, a4.Y + a5, a4.Z + a6))
        v165.Parent = a1
    else
        return nil
    end
end
u9.placeMountains = function(a1, a2, a3, a4, a5)
    --[[
      name: placeMountains
      line: 1957
      upvalues:
        cloneMountains_upv_1 (copy, index: 1)
    ]]
    cloneMountains_upv_1(a2, a1.mountainsTemplate, a1.mountainsLocalPivot, a3, a4, a5)
end
u9.makeNightRays = function(a1, a2)
    --[[
      name: makeNightRays
      line: 1960
      upvalues:
        cloneNightRays_upv_1 (copy, index: 1)
    ]]
    local nightProps_1 = a1.nightProps
    if nightProps_1 == nil then
        return nil
    end
    return (cloneNightRays_upv_1(nightProps_1, a2))
end
cloneNightLight_upv_1 = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: cloneNightLight
      line: 1723
    ]]
    local lightTemplate_1 = a1.lightTemplate
    local lightLocalOffset_1 = a1.lightLocalOffset
    if lightTemplate_1 ~= nil then
        local v166 = nil
        if lightLocalOffset_1 ~= nil then
            local v167 = lightTemplate_1:Clone()
            v167.Anchored = true
            v167.CanCollide = false
            v167.CanQuery = false
            v167.CanTouch = false
            v167.Size = Vector3.new(v167.Size.X, v167.Size.Y, a6)
            v167.CFrame = CFrame.new(a3 + Vector3.new(lightLocalOffset_1.X, a4 + lightLocalOffset_1.Y, a5)) * lightTemplate_1.CFrame.Rotation
            v166 = v167:FindFirstChildWhichIsA("SurfaceLight")
            if v166 ~= nil then
                v166.Enabled = false
            end
            v167.Parent = a2
            return v166
        end
    end
    return nil
end
u9.placeNightLight = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: placeNightLight
      line: 1964
      upvalues:
        cloneNightLight_upv_1 (copy, index: 1)
    ]]
    local nightProps_2 = a1.nightProps
    if nightProps_2 == nil then
        return nil
    end
    return (cloneNightLight_upv_1(nightProps_2, a2, a3, a4, a5, a6))
end
u9.destroy = function(a1)
    --[[
      name: destroy
      line: 1968
    ]]
    local v168 = nil
    for _, value_43 in a1.biomeRungs do
        v168 = value_43.prepared
        if v168 ~= nil then
            local v169 = v168.template:Destroy()
        end
    end
    for _, value_44 in a1.carVariants do
        value_44.template:Destroy()
    end
    for _, value_45 in a1.truckVariants do
        value_45.template:Destroy()
    end
    for _, value_46 in a1.emergencyVariants do
        value_46.template:Destroy()
    end
    for _, value_47 in a1.specialVariants do
        value_47.template:Destroy()
    end
end
local tbl_33 = {}
local tbl_34 = {}
tbl_34.__tostring = function()
    --[[
      name: __tostring
      line: 2000
    ]]
    return "HighwayRiderTpAssets"
end
local u10 = setmetatable(tbl_33, tbl_34)
u10.__index = u10
u10.new = function(...)
    --[[
      name: new
      line: 2005
      upvalues:
        u10 (ref, index: 1)
    ]]
    local v169 = setmetatable({}, u10)
    return v169:constructor(...) or v169
end
u10.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 2009
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        resolveBiomeRungs_upv_1 (copy, index: 2)
        HIGHWAY_BIOME_CHUNK_NAMES_upv_1 (copy, index: 3)
        resolveTunnelRungs_upv_1 (copy, index: 4)
        resolveNightProps_upv_1 (copy, index: 5)
        prepareTrafficVariants_upv_1 (copy, index: 6)
        EXTRA_TRAFFIC_FOLDERS_upv_1 (copy, index: 7)
    ]]
    if a2 == nil then
        local tbl_35 = {}
        a2 = tbl_35
    end
    a1.biomeRungs = {}
    a1.biomeRungCount = 0
    a1.carVariants = {}
    a1.truckVariants = {}
    a1.emergencyVariants = {}
    a1.specialVariants = {}
    local v170 = waitForSceneryRoot_upv_1("TP", "highway-rider")
    local v171
    if v170 == nil then
        v171 = v170
    else
        v171 = v170:FindFirstChild("Chunk")
    end
    local v172
    if v170 == nil then
        v172 = v170
    else
        v172 = v170:FindFirstChild("Mountains")
    end
    if v171 ~= nil and v171:IsA("Model") and v172 ~= nil and v172:IsA("Model") then
        local v173 = resolveBiomeRungs_upv_1(v170, HIGHWAY_BIOME_CHUNK_NAMES_upv_1.tp, "TP", a1.biomeRungs)
        a1.biomeRungCount = #a1.biomeRungs
        a1.tunnelBase = resolveTunnelRungs_upv_1(v170, "TP", a1.biomeRungs, v173)
        if #a1.biomeRungs ~= 0 then
            a1.available = true
            a1.grassColor = a1.biomeRungs[1].grassColor
            local v174
            if v170 == nil then
                v174 = v170
            else
                v174 = v170:FindFirstChild("Lighting")
            end
            a1.lighting = v174
            local v175
            if v170 == nil then
                v175 = v170
            else
                v175 = v170:FindFirstChild("NightLighting")
            end
            a1.nightLighting = v175
            a1.nightProps = resolveNightProps_upv_1(v170, Vector3.new(-2130.449951171875, -200, 0))
            a1.mountainsTemplate = v172
            a1.mountainsLocalPivot = v172:GetPivot() + Vector3.new(-2130.449951171875, -200, 0)
            local v176
            if v170 == nil then
                v176 = v170
            else
                v176 = v170:FindFirstChild("Vehicles")
            end
            prepareTrafficVariants_upv_1(v176, a1.carVariants, a1.truckVariants, a1.emergencyVariants, a1.specialVariants, EXTRA_TRAFFIC_FOLDERS_upv_1.tp)
            local v177
            if a2.newVehicles ~= true then
                v177 = {}
            else
                v177 = EXTRA_TRAFFIC_FOLDERS_upv_1.tp
            end
            local v178 = nil
            for _, value_48 in v177 do
                if v176 == nil then
                    v178 = v176
                else
                    v178 = v178:FindFirstChild(value_48)
                end
                prepareTrafficVariants_upv_1(v178, a1.carVariants, a1.truckVariants, a1.emergencyVariants, a1.specialVariants)
            end
            if v170 == nil then
                v177 = v170
            else
                v177 = v170:FindFirstChild("PlayerCar")
            end
            a1.playerCarTemplate = v177 == nil or not (v177:IsA("Model")) or v177
        else
            warn("[highway-rider] TP.Chunk has no measurable road deck \226\128\148 using procedural tp world")
            a1.available = false
            return nil
        end
    else
        warn("[highway-rider] missing scenery kit TP (Chunk + Mountains) \226\128\148 using procedural tp world")
        a1.available = false
        return nil
    end
end
u10.makePlayerCar = function(a1, a2)
    --[[
      name: makePlayerCar
      line: 2084
      upvalues:
        u7 (ref, index: 1)
    ]]
    local playerCarTemplate_1 = a1.playerCarTemplate
    if playerCarTemplate_1 ~= nil then
        return u7.new(playerCarTemplate_1, a2)
    end
    return nil
end
u10.hasCars = function(a1)
    --[[
      name: hasCars
      line: 2091
    ]]
    return #a1.carVariants > 0
end
u10.emergencyKinds = function(a1)
    --[[
      name: emergencyKinds
      line: 2094
    ]]
    local tbl_37 = {}
    for _, value_49 in a1.emergencyVariants do
        if value_49.emergency ~= nil then
            table.insert(tbl_37, value_49.emergency)
        end
    end
    return tbl_37
end
u5 = function(a1, a2, a3, a4)
    --[[
      name: makeEmergencyVisual
      line: 2104
      upvalues:
        u5 (ref, index: 1)
    ]]
    if a4 == nil then
        a4 = 0
    end
    local v179
    v179 = nil
    for _, value_50 in a1.emergencyVariants do
        if value_50.emergency == a3 == true then
            v179 = value_50
            break
        end
    end
    if v179 == nil then
        return nil
    end
    return (u5(a2, v179, 0, a4))
end
u10.makeEmergencyVisual = u5
u10.specialKinds = function(a1)
    --[[
      name: specialKinds
      line: 2124
    ]]
    local tbl_38 = {}
    for _, value_51 in a1.specialVariants do
        if value_51.special ~= nil then
            table.insert(tbl_38, value_51.special)
        end
    end
    return tbl_38
end
u5 = function(a1, a2, a3)
    --[[
      name: makeSpecialVisual
      line: 2134
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v180
    v180 = nil
    for _, value_52 in a1.specialVariants do
        if value_52.special == a3 == true then
            v180 = value_52
            break
        end
    end
    if v180 == nil then
        return nil
    end
    return (u5(a2, v180, 0))
end
u10.makeSpecialVisual = u5
u10.makeCarVisual = function(a1, a2, a3)
    --[[
      name: makeCarVisual
      line: 2151
      upvalues:
        makePooledCarVisual_upv_1 (copy, index: 1)
    ]]
    return makePooledCarVisual_upv_1(a2, a3, a1.carVariants, a1.truckVariants)
end
u10.biomeCount = function(a1)
    --[[
      name: biomeCount
      line: 2154
    ]]
    return a1.biomeRungCount
end
u10.tunnelRungBase = function(a1)
    --[[
      name: tunnelRungBase
      line: 2157
    ]]
    return a1.tunnelBase
end
u10.biomeName = function(a1, a2)
    --[[
      name: biomeName
      line: 2160
    ]]
    if a2 >= 0 and a2 < #a1.biomeRungs then
        return a1.biomeRungs[a2 + 1].name
    end
    return "Chunk"
end
u10.biomeGrassColor = function(a1, a2)
    --[[
      name: biomeGrassColor
      line: 2163
    ]]
    if a2 >= 0 and a2 < #a1.biomeRungs then
        return a1.biomeRungs[a2 + 1].grassColor
    end
    return nil
end
u10.makeChunkTile = function(a1, a2, a3)
    --[[
      name: makeChunkTile
      line: 2166
      upvalues:
        cloneChunkTile_upv_1 (copy, index: 1)
        prepareBiome_upv_1 (copy, index: 2)
    ]]
    local biomeRungs_2 = a1.biomeRungs
    local v181
    if a3 < 0 then
        v181 = nil
    else
        local v182 = nil
        if #biomeRungs_2 > a3 then
            local v183 = biomeRungs_2[a3 + 1]
            v182 = v183.prepared
            if v182 == nil then
                local v184 = prepareBiome_upv_1(v183, Vector3.new(-2130.449951171875, -200, 0), nil)
                v183.prepared = v184
                v181 = v184
            else
                v181 = v182
            end
        else
            v181 = nil
        end
    end
    return cloneChunkTile_upv_1(a2, v181)
end
u10.placeMountains = function(a1, a2, a3, a4, a5)
    --[[
      name: placeMountains
      line: 2170
      upvalues:
        cloneMountains_upv_1 (copy, index: 1)
    ]]
    cloneMountains_upv_1(a2, a1.mountainsTemplate, a1.mountainsLocalPivot, a3, a4, a5)
end
u10.makeNightRays = function(a1, a2)
    --[[
      name: makeNightRays
      line: 2173
      upvalues:
        cloneNightRays_upv_1 (copy, index: 1)
    ]]
    local nightProps_3 = a1.nightProps
    if nightProps_3 == nil then
        return nil
    end
    return (cloneNightRays_upv_1(nightProps_3, a2))
end
u10.placeNightLight = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: placeNightLight
      line: 2177
      upvalues:
        cloneNightLight_upv_1 (copy, index: 1)
    ]]
    local nightProps_4 = a1.nightProps
    if nightProps_4 == nil then
        return nil
    end
    return (cloneNightLight_upv_1(nightProps_4, a2, a3, a4, a5, a6))
end
u10.destroy = function(a1)
    --[[
      name: destroy
      line: 2181
    ]]
    local v185 = nil
    for _, value_53 in a1.biomeRungs do
        v185 = value_53.prepared
        if v185 ~= nil then
            local v186 = v185.template:Destroy()
        end
    end
    for _, value_54 in a1.carVariants do
        value_54.template:Destroy()
    end
    for _, value_55 in a1.truckVariants do
        value_55.template:Destroy()
    end
    for _, value_56 in a1.emergencyVariants do
        value_56.template:Destroy()
    end
    for _, value_57 in a1.specialVariants do
        value_57.template:Destroy()
    end
end
local tbl_39 = {}
tbl_39.sirenStartOffset = function(a1)
    --[[
      name: sirenStartOffset
      line: 1186
      upvalues:
        tbl_upv_8 (copy, index: 1)
    ]]
    return tbl_upv_8[(a1 % #tbl_upv_8) + 1]
end
tbl_39.ObstructionVisual = u2
tbl_39.CarVisual = u3
tbl_39.AuthoredBikeRig = u6
tbl_39.AuthoredCarRig = u7
tbl_39.ChunkTile = u8
tbl_39.HighwayRiderFpAssets = u9
tbl_39.HighwayRiderTpAssets = u10
return tbl_39