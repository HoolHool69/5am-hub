-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local getSfxSoundGroup_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-groups").getSfxSoundGroup
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local makeStagePart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeStagePart
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "highway-rider", "highway-rider-vehicles")
local deriveVehicleFront_upv_1 = v1.deriveVehicleFront
local vehicleSpec_upv_1 = v1.vehicleSpec
local TRAFFIC_RUSH_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-config").TRAFFIC_RUSH_CONFIG
local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
tbl_upv_1.car = {Color3.fromRGB(196, 72, 64), Color3.fromRGB(224, 230, 238)}
tbl_upv_1.sport = {Color3.fromRGB(64, 120, 196), Color3.fromRGB(224, 230, 238)}
tbl_upv_1.truck = {Color3.fromRGB(120, 126, 134), Color3.fromRGB(232, 168, 64)}
tbl_upv_1.heavy = {Color3.fromRGB(94, 100, 110), Color3.fromRGB(226, 184, 66)}
tbl_upv_1.moto = {Color3.fromRGB(70, 70, 76), Color3.fromRGB(196, 72, 64)}
tbl_upv_1.emergency = {Color3.fromRGB(240, 240, 244), Color3.fromRGB(52, 54, 60)}
local function partWorldExtents_upv_1(a1)
    --[[
      name: partWorldExtents
      line: 53
    ]]
    local CFrame_1 = a1.CFrame
    local v2 = a1.Size * 0.5
    return (Vector3.new(((math.abs(CFrame_1.RightVector.X) * v2.X) + (math.abs(CFrame_1.UpVector.X) * v2.Y)) + (math.abs(CFrame_1.LookVector.X) * v2.Z), ((math.abs(CFrame_1.RightVector.Y) * v2.X) + (math.abs(CFrame_1.UpVector.Y) * v2.Y)) + (math.abs(CFrame_1.LookVector.Y) * v2.Z), ((math.abs(CFrame_1.RightVector.Z) * v2.X) + (math.abs(CFrame_1.UpVector.Z) * v2.Y)) + (math.abs(CFrame_1.LookVector.Z) * v2.Z)))
end
local function colorKey_1(a1)
    --[[
      name: colorKey
      line: 81
    ]]
    return (("%*:%*:%*"):format(math.round(a1.R * 255), math.round(a1.G * 255), math.round(a1.B * 255)))
end
local function worldBounds_upv_1(a1)
    --[[
      name: worldBounds
      line: 59
      upvalues:
        partWorldExtents_upv_1 (copy, index: 1)
    ]]
    local v3 = nil
    local v4 = nil
    local v5 = nil
    local v6 = nil
    local v7 = nil
    local v8 = nil
    for _, value_1 in a1:GetDescendants() do
        v8 = value_1:IsA("BasePart")
        if not (v8) then
            continue
        end
        v7 = partWorldExtents_upv_1(value_1)
        v5 = value_1.Position - v7
        v6 = value_1.Position + v7
        if v3 ~= nil then
            v3 = Vector3.new(math.min(v3.X, v5.X), math.min(v3.Y, v5.Y), math.min(v3.Z, v5.Z))
        else
            v3 = v5
        end
        if v4 ~= nil then
            v4 = Vector3.new(math.max(v4.X, v6.X), math.max(v4.Y, v6.Y), math.max(v4.Z, v6.Z))
        else
            v4 = v6
        end
    end
    if v3 ~= nil and v4 ~= nil then
        local tbl_5 = {}
        tbl_5.min = v3
        tbl_5.max = v4
        return tbl_5
    end
    return nil
end
local function yawToNoseNegZ_1(a1)
    --[[
      name: yawToNoseNegZ
      line: 102
    ]]
    if a1 ~= "+Z" then
        if a1 ~= "-Z" then
            if a1 ~= "+X" then
                return -1.5707963267948966
            end
            return 1.5707963267948966
        end
        return 0
    end
    return math.pi
end
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 139
    ]]
    return "VehicleSkin"
end
local u2 = setmetatable(tbl_6, tbl_7)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 144
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v9 = setmetatable({}, u2)
    return v9:constructor(...) or v9
end
u2.constructor = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
    --[[
      name: constructor
      line: 148
    ]]
    a1.relPivot = a3
    a1.relPivotInverse = a4
    a1.tintParts = a5
    a1.beacons = a8
    a1.siren = a9
    a1.pushSound = a10
    a1.beaconBank = -1
    a1.model = a2
    a1.size = a6
    a1.emergency = a7
end
local function largestPart_upv_1(a1)
    --[[
      name: largestPart
      line: 112
    ]]
    local v10 = nil
    local v11 = 0
    v10 = v10
    local v12 = nil
    local v13 = nil
    local v14 = nil
    for _, value_2 in a1:GetDescendants() do
        v14 = value_2:IsA("BasePart")
        if not (v14) then
            continue
        end
        v13 = value_2.Size
        v12 = v13.X * v13.Y * v13.Z
        if v11 < v12 then
            v11, v10 = v12, value_2
        end
    end
    return v10
end
local function rotateAboutBoundsCenter_upv_1(a1, a2)
    --[[
      name: rotateAboutBoundsCenter
      line: 85
      upvalues:
        worldBounds_upv_1 (copy, index: 1)
    ]]
    local v15 = worldBounds_upv_1(a1)
    if v15 ~= nil then
        local v16 = (v15.min + v15.max) * 0.5
        a1:PivotTo((CFrame.new(v16) * CFrame.Angles(0, a2, 0)) * CFrame.new(v16 * -1) * a1:GetPivot())
    else
        return nil
    end
end
u2.make = function(a1, a2, a3, a4)
    --[[
      name: make
      line: 160
      upvalues:
        rotateAboutBoundsCenter_upv_1 (copy, index: 1)
        worldBounds_upv_1 (copy, index: 2)
        largestPart_upv_1 (copy, index: 3)
        createGameLoopSound_upv_1 (copy, index: 4)
        SOUND_IDS_upv_1 (copy, index: 5)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 6)
        getSfxSoundGroup_upv_1 (copy, index: 7)
        u1 (copy, index: 8)
        u2 (ref,  index: 9)
    ]]
    local v17 = a2:Clone()
    for v18, value_3 in v17:GetDescendants() do
        if value_3:IsA("BasePart") then
            value_3.Anchored = true
            value_3.CanCollide = false
            value_3.CanQuery = false
            value_3.CanTouch = false
            value_3.CastShadow = false
            continue
        end
        if value_3:IsA("Light") or value_3:IsA("Beam") or value_3:IsA("ParticleEmitter") then
            value_3.Enabled = false
            continue
        end
        if value_3:IsA("Sound") then
            value_3:Destroy()
        end
    end
    local front_1 = a4.front
    local v19 = ((front_1 == "+Z") and math.pi) or (((front_1 == "-Z") and 0) or (((front_1 ~= "+X") and -1.5707963267948966) or 1.5707963267948966))
    if v19 ~= 0 then
        rotateAboutBoundsCenter_upv_1(v17, v19)
    end
    local v20 = worldBounds_upv_1(v17)
    if v20 ~= nil then
        local v21 = Vector3.new((v20.min.X + v20.max.X) / 2, v20.min.Y, (v20.min.Z + v20.max.Z) / 2)
        local v18 = v17:GetPivot()
        local v22 = CFrame.new(v18.Position - v21) * v18.Rotation
        local v23 = v20.max - v20.min
        if a4.livery ~= nil then
            local _ = nil
            local v38 = nil
            for v39, value_4 in v17:GetDescendants() do
                if not (value_4:IsA("BasePart")) then
                    continue
                end
                for v40, value_5 in a4.livery do
                    if table.find(value_5.parts, value_4.Name) ~= nil then
                        value_4.Color = value_5.color
                    end
                end
            end
        end
        local v24 = {}
        local v30 = nil
        local tbl_9
        if a4.emergency == nil then
            if a4.paintParts ~= nil then
                for _, value_6 in v17:GetDescendants() do
                    if not (value_6:IsA("BasePart")) then
                        continue
                    end
                    if table.find(a4.paintParts, value_6.Name) ~= nil then
                        table.insert(v24, value_6)
                    end
                end
            end
            if #v24 == 0 then
                tbl_9 = {}
                local v25 = nil
                local v26 = nil
                local v27 = nil
                for _, value_7 in v17:GetDescendants() do
                    v27 = value_7:IsA("BasePart")
                    if not (v27) or value_7.Material == Enum.Material.Neon then
                        continue
                    end
                    v25 = value_7.Color
                    v26 = ("%*:%*:%*"):format(math.round(v25.R * 255), math.round(v25.G * 255), math.round(v25.B * 255))
                    v25 = tbl_9[v26]
                    if not (v25) then
                        v25 = {}
                        v25.parts = {}
                    end
                    v25.volume = v25.volume + ((value_7.Size.X * value_7.Size.Y) * value_7.Size.Z)
                    table.insert(v25.parts, value_7)
                    tbl_9[v26] = v25
                end
                local v28 = 0
                v24, v30 = v24, v28
                for _, value_8 in tbl_9 do
                    if v30 < value_8.volume then
                        local volume_1 = value_8.volume
                        v24, v30 = value_8.parts, volume_1
                    end
                end
            end
        end
        tbl_9 = {}
        if a4.emergency == nil then
            v30 = nil
        else
            v30 = v17:FindFirstChild("EmergencyLight", true)
        end
        for v31, value_9 in v17:GetDescendants() do
            if not (value_9:IsA("BasePart")) or value_9.Material ~= Enum.Material.Neon then
                continue
            end
            if v30 == nil then
                value_9.Material = Enum.Material.SmoothPlastic
                continue
            end
            if value_9:IsDescendantOf(v30) then
                table.insert(tbl_9, {part = value_9, color = value_9.Color})
            else
                value_9.Material = Enum.Material.SmoothPlastic
            end
        end
        local v32 = largestPart_upv_1(v17)
        local v33 = nil
        local v34
        local v37 = nil
        if a4.emergency == nil or v32 == nil then
            v34 = v33
        else
            local v31 = {}
            if a4.emergency ~= "police" then
                v37 = SOUND_IDS_upv_1.sirenAmbulance
            else
                v37 = SOUND_IDS_upv_1.sirenPolice
            end
            v31.soundId = v37
            v31.parent = v32
            v31.volume = TRAFFIC_RUSH_CONFIG_upv_1.emergency.sirenVolume
            local v36 = createGameLoopSound_upv_1(v31)
            v36.RollOffMode = Enum.RollOffMode.InverseTapered
            v36.RollOffMinDistance = TRAFFIC_RUSH_CONFIG_upv_1.emergency.sirenRollOffMin
            v36.RollOffMaxDistance = TRAFFIC_RUSH_CONFIG_upv_1.emergency.sirenRollOffMax
            v34 = v36
        end
        v37 = Instance.new("Sound")
        v37.Name = "DashSend"
        v37.SoundId = SOUND_IDS_upv_1.bikeRevUp
        v37.SoundGroup = getSfxSoundGroup_upv_1()
        v37.Volume = TRAFFIC_RUSH_CONFIG_upv_1.pushSound.volume
        v37.RollOffMode = Enum.RollOffMode.LinearSquare
        v37.RollOffMinDistance = 90
        v37.RollOffMaxDistance = 90 + TRAFFIC_RUSH_CONFIG_upv_1.pushSound.rollOffSpread
        v37.Parent = v32 or v17
        v17.Parent = a3
        v17:PivotTo(u1)
        return u2.new(v17, v22, v22:Inverse(), v24, v23, a4.emergency, tbl_9, v34, v37)
    end
    v17:Destroy()
    return nil
end
u2.pose = function(a1, a2, a3, a4, a5)
    --[[
      name: pose
      line: 316
    ]]
    a1.model:PivotTo((CFrame.new(a2, a3, a4) * a5) * a1.relPivot)
end
u2.park = function(a1)
    --[[
      name: park
      line: 323
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.model:PivotTo(u1)
    a1.pushSound:Stop()
    a1:stopSiren()
    if #a1.beacons <= 0 then
        return
    end
    a1.beaconBank = -1
    for _, value_10 in a1.beacons do
        value_10.part.Color = value_10.color:Lerp(Color3.fromRGB(0, 0, 0), 0.8)
    end
end
u2.setLivery = function(a1, a2)
    --[[
      name: setLivery
      line: 334
    ]]
    for _, value_11 in a1.tintParts do
        if value_11:IsA("PartOperation") then
            value_11.UsePartColor = true
        end
        value_11.Color = a2
    end
end
u2.canonicalToWorld = function(a1, a2)
    --[[
      name: canonicalToWorld
      line: 342
    ]]
    return (a1.model:GetPivot() * a1.relPivotInverse) * a2
end
u2.setBeaconPhase = function(a1, a2)
    --[[
      name: setBeaconPhase
      line: 348
    ]]
    local v38 = ((a2 >= 0.5) and 1) or 0
    if v38 ~= a1.beaconBank then
        a1.beaconBank = v38
        for n_1 = 0, #a1.beacons - 1 do
            local v39 = a1.beacons[n_1 + 1]
            local v40 = n_1 % 2 == v38
            local part_1 = v39.part
            local v41
            if v40 then
                v41 = v39.color
            else
                v41 = v39.color:Lerp(Color3.fromRGB(0, 0, 0), 0.8)
            end
            part_1.Color = v41
        end
    else
        return nil
    end
end
u2.startSiren = function(a1)
    --[[
      name: startSiren
      line: 360
    ]]
    if a1.siren ~= nil and not (a1.siren.Playing) then
        a1.siren.Playing = true
    else
        return nil
    end
end
u2.stopSiren = function(a1)
    --[[
      name: stopSiren
      line: 366
    ]]
    if a1.siren ~= nil and a1.siren.Playing then
        a1.siren.Playing = false
    else
        return nil
    end
end
u2.playPush = function(a1, a2)
    --[[
      name: playPush
      line: 372
    ]]
    a1.pushSound.PlaybackSpeed = a2
    a1.pushSound:Play()
end
u2.setPushRollOff = function(a1, a2, a3)
    --[[
      name: setPushRollOff
      line: 376
    ]]
    a1.pushSound.RollOffMinDistance = a2
    a1.pushSound.RollOffMaxDistance = a3
end
local tbl_10 = {}
local tbl_11 = {}
tbl_11.__tostring = function()
    --[[
      name: __tostring
      line: 393
    ]]
    return "TrafficRushAssets"
end
local u3 = setmetatable(tbl_10, tbl_11)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 398
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v42 = setmetatable({}, u3)
    return v42:constructor(...) or v42
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 402
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    a1.container = a2
    a1.templatesBySkin = {}
    a1.proceduralBySkin = {}
    a1.frontByTemplate = {}
    local v43 = waitForSceneryRoot_upv_1("TP", "traffic-rush")
    local v44 = waitForSceneryRoot_upv_1("FP", "traffic-rush")
    local v45
    if v43 == nil then
        v45 = v43
    else
        v45 = v43:FindFirstChild("Vehicles")
    end
    a1:adoptTree(v45)
    local v46
    if v43 == nil then
        v46 = v43
    else
        v46 = v43:FindFirstChild("PlayerCar")
    end
    a1:adoptModel(v46)
    local v47
    if v44 == nil then
        v47 = v44
    else
        v47 = v44:FindFirstChild("Motorcycle")
    end
    a1:adoptModel(v47)
end
u3.makeSkin = function(a1, a2, a3, a4)
    --[[
      name: makeSkin
      line: 428
      upvalues:
        vehicleSpec_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
    ]]
    local v48 = vehicleSpec_upv_1(a3.skin)
    local v49 = a1.templatesBySkin[a3.skin]
    local v50 = nil
    if v49 == nil then
        local v51
        local v51 = a1:proceduralTemplate(a2, a3)
        v52 = a1.container
        local tbl_12 = {}
        if v48 == nil then
            v50 = v48
        else
            v50 = v48.emergency
        end
    elseif #v49 <= 0 then
        local v51
        local v51 = a1:proceduralTemplate(a2, a3)
        local v52
        v52 = a1.container
        local tbl_12 = {}
        if v48 == nil then
            v50 = v48
        else
            v50 = v48.emergency
        end
    else
        local v53 = v49[(a4 % #v49) + 1]
        local v52 = a1:resolveFront(v53)
        local v54, v55 = nil, nil
        if v52 == nil then
            local v51 = a1:proceduralTemplate(a2, a3)
            v52 = a1.container
            local tbl_12 = {}
            if v48 == nil then
                v50 = v48
            else
                v50 = v48.emergency
            end
        else
            local container_1 = a1.container
            v50 = {}
            v50.front = v52
            v54 = v48
            if v54 ~= nil then
                v54 = v54.emergency
            end
            v50.emergency = v54
            v55 = v48
            if v55 ~= nil then
                v55 = v55.paintParts
            end
            v50.paintParts = v55
            local v56
            if v48 == nil then
                v56 = v48
            else
                v56 = v48.livery
            end
            v50.livery = v56
            return u2:make(v53, container_1, v50)
        end
    end
    tbl_12.emergency = v50
    return u2:make(v51, v52, tbl_12)
end
u3.adoptTree = function(a1, a2)
    --[[
      name: adoptTree
      line: 477
    ]]
    if a2 ~= nil then
        for _, value_12 in a2:GetChildren() do
            if value_12:IsA("Folder") then
                a1:adoptTree(value_12)
            else
                a1:adoptModel(value_12)
            end
        end
    else
        return nil
    end
end
u3.adoptModel = function(a1, a2)
    --[[
      name: adoptModel
      line: 491
    ]]
    if a2 ~= nil then
        local v57 = nil
        if a2:IsA("Model") then
            v57 = a1.templatesBySkin[a2.Name]
            if v57 == nil then
                v57 = {}
            end
            table.insert(v57, a2)
            a1.templatesBySkin[a2.Name] = v57
            return
        end
    end
    return nil
end
u3.resolveFront = function(a1, a2)
    --[[
      name: resolveFront
      line: 508
      upvalues:
        worldBounds_upv_1 (copy, index: 1)
        deriveVehicleFront_upv_1 (copy, index: 2)
    ]]
    local v58 = a1.frontByTemplate[a2]
    local v59, v60 = nil, nil
    if v58 == nil then
        v59 = worldBounds_upv_1(a2)
        local v61 = nil
        if v59 ~= nil then
            v61 = deriveVehicleFront_upv_1(a2, (v59.min + v59.max) * 0.5)
        end
        if v61 == nil then
            warn((("[traffic-rush] no facing cue on \"%*\" \226\128\148 using the procedural block"):format(a2.Name)))
        end
        local frontByTemplate_1 = a1.frontByTemplate
        v60 = v61
        if v60 == nil then
            v60 = false
        end
        frontByTemplate_1[a2] = v60
        return v61
    elseif v58 ~= false then
        return v58
    else
        return nil
    end
end
u3.proceduralTemplate = function(a1, a2, a3)
    --[[
      name: proceduralTemplate
      line: 535
      upvalues:
        tbl_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v62 = ("%*:%*"):format(a2.name, a3.skin)
    local v63 = a1.proceduralBySkin[v62]
    local v64 = nil
    if v63 == nil then
        warn((("[traffic-rush] missing authored vehicle \"%*\" \226\128\148 using the procedural block"):format(a3.skin)))
        v64 = tbl_upv_1[a2.name]
        if v64 == nil then
            v64 = {Color3.fromRGB(180, 180, 188), Color3.fromRGB(224, 230, 238)}
        end
        local v65 = Instance.new("Model")
        local v66 = makeStagePart_upv_1(v65)
        v66.Size = Vector3.new(a3.width, 1.6, a3.length)
        v66.Color = v64[1]
        v66.CFrame = CFrame.new(0, 0.8, 0)
        local v67 = makeStagePart_upv_1(v65)
        v67.Size = Vector3.new(a3.width * 0.82, 1.1, a3.length * 0.42)
        v67.Color = v64[2]
        v67.CFrame = CFrame.new(0, 2.1500000000000004, -a3.length * 0.12)
        v65.PrimaryPart = v66
        v65.Parent = a1.container
        v65:PivotTo(u1)
        a1.proceduralBySkin[v62] = v65
        return v65
    end
    return v63
end
local tbl_14 = {}
tbl_14.VehicleSkin = u2
tbl_14.TrafficRushAssets = u3
return tbl_14