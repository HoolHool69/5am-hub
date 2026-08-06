-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Players_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local DEFAULT_GAME_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").DEFAULT_GAME_LIGHTING
local ClientFunctions_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network").ClientFunctions
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v2.gameFrozenAtom
local pausedAtom_upv_1 = v2.pausedAtom
local publishCombo_upv_1 = v2.publishCombo
local TrafficRushAssets_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-assets").TrafficRushAssets
local TRAFFIC_RUSH_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-config").TRAFFIC_RUSH_CONFIG
local v3 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-sim")
local TRAFFIC_LANES_upv_1 = v3.TRAFFIC_LANES
local TrafficRushSim_upv_1 = v3.TrafficRushSim
local vehicleWorldXAt_upv_1 = v3.vehicleWorldXAt
local vehicleWorldZAt_upv_1 = v3.vehicleWorldZAt
local TrafficRushRider_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-rider").TrafficRushRider
local buildAuthoredStreet_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-street").buildAuthoredStreet
local TrafficRushTutorial_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-tutorial").TrafficRushTutorial
local LaneWarning_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-warning").LaneWarning
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(126, 205, 92)
local u3 = Color3.fromRGB(110, 190, 80)
local u4 = Color3.fromRGB(68, 72, 82)
local u5 = Color3.fromRGB(188, 186, 178)
local u6 = Color3.fromRGB(242, 242, 238)
local u7 = Color3.fromRGB(230, 230, 226)
local u8 = Color3.fromRGB(255, 216, 102)
local u9 = Color3.fromRGB(255, 92, 80)
local u10 = Color3.fromRGB(255, 64, 60)
local u11 = Color3.fromRGB(120, 120, 124)
local u12 = Color3.fromRGB(255, 150, 46)
local tbl_upv_1 = {Color3.fromRGB(196, 70, 60), Color3.fromRGB(70, 116, 196), Color3.fromRGB(228, 196, 72), Color3.fromRGB(96, 172, 84), Color3.fromRGB(224, 140, 56), Color3.fromRGB(226, 228, 232), Color3.fromRGB(140, 104, 180), Color3.fromRGB(72, 168, 160), Color3.fromRGB(76, 78, 86), Color3.fromRGB(216, 130, 150)}
local tbl_upv_2 = {{4, 4, 12, 12}, {22, 6, 14, 10}, {6, 22, 10, 14}, {26, 24, 16, 14}, {46, 8, 12, 12}, {8, 46, 12, 10}, {44, 30, 14, 12}, {28, 44, 12, 14}}
local tbl_upv_3 = {7, 9, 11, 13, 15, 17}
local tbl_upv_4 = {Color3.fromRGB(168, 118, 96), Color3.fromRGB(196, 176, 140), Color3.fromRGB(142, 152, 166), Color3.fromRGB(208, 198, 178), Color3.fromRGB(120, 152, 148), Color3.fromRGB(150, 112, 84)}
local u13 = Color3.fromRGB(82, 94, 112)
local u14 = Color3.fromRGB(96, 98, 104)
local u15 = Color3.fromRGB(52, 54, 60)
local u16 = Color3.fromRGB(255, 70, 60)
local u17 = Color3.fromRGB(92, 44, 42)
local u18 = Color3.fromRGB(96, 220, 110)
local u19 = Color3.fromRGB(44, 92, 54)
local tbl_upv_5 = {"nearMissWhoosh1", "nearMissWhoosh2", "nearMissWhoosh3", "nearMissWhoosh4", "nearMissWhoosh5"}
local tbl_upv_6 = {}
tbl_upv_6.ambient = Color3.fromRGB(198, 198, 206)
tbl_upv_6.outdoorAmbient = Color3.fromRGB(205, 205, 212)
tbl_upv_6.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_6.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_7 = {}
local tbl_8 = {}
tbl_8.__tostring = function()
    --[[
      name: __tostring
      line: 109
    ]]
    return "TrafficRushGame"
end
tbl_8.__index = BaseWorldGame_upv_1
local u20 = setmetatable(tbl_7, tbl_8)
u20.__index = u20
u20.new = function(...)
    --[[
      name: new
      line: 115
      upvalues:
        u20 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u20)
    return v4:constructor(...) or v4
end
u20.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 119
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        TrafficRushSim_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.sim = TrafficRushSim_upv_1.new(a1)
    a1.variantPools = {}
    a1.allSkins = {}
    a1.skinByVehicleId = {}
    a1.headings = {}
    a1.stopMarkers = {}
    a1.motoSkins = {}
    a1.riders = {}
    a1.riderCrashHold = false
    a1.signalRedLamps = {}
    a1.signalGreenLamps = {}
    a1.signalLastRed = {}
    a1.laneFrontProgress = {0, 0, 0, 0}
    a1.laneFrontStopped = {false, false, false, false}
    a1.simClock = 0
    a1.comboCount = 0
    a1.lastClearAt = -math.huge
    a1.nearMissSoundIndex = 0
    a1.smashSoundPending = false
    a1.pressActive = false
    a1.pressConsumed = false
    a1.pressOrigin = Vector2.zero
    a1.cameraCFrame = CFrame.new()
    a1.lastViewportX = -1
    a1.lastViewportY = -1
end
u20.buildScene = function(a1)
    --[[
      name: buildScene
      line: 147
      upvalues:
        buildAuthoredStreet_upv_1 (copy, index: 1)
        TRAFFIC_LANES_upv_1 (copy, index: 2)
        TrafficRushAssets_upv_1 (copy, index: 3)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 4)
        LaneWarning_upv_1 (copy, index: 5)
        readLightingFolderProfile_upv_1 (copy, index: 6)
        tbl_upv_6 (copy, index: 7)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 8)
        subscribe_upv_1 (copy, index: 9)
        pausedAtom_upv_1 (copy, index: 10)
        gameFrozenAtom_upv_1 (copy, index: 11)
        makeSmoothPart_upv_1 (copy, index: 12)
        u10 (copy, index: 13)
        u1 (copy, index: 14)
        PopupTextPool_upv_1 (copy, index: 15)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 16)
        u11 (copy, index: 17)
        u12 (copy, index: 18)
        u6 (copy, index: 19)
        TrafficRushTutorial_upv_1 (copy, index: 20)
    ]]
    local container_1 = a1.stage.container
    local v5 = buildAuthoredStreet_upv_1(container_1, a1.stage.origin)
    if v5 == nil then
        a1:buildGround(container_1)
    end
    local v6 = nil
    for _, value_1 in TRAFFIC_LANES_upv_1 do
        if value_1.axis ~= "x" then
            v6 = Vector3.new(0, 0, value_1.dir)
        else
            v6 = Vector3.new(value_1.dir, 0, 0)
        end
        table.insert(a1.headings, (CFrame.lookAt(Vector3.new(0, 0, 0), v6)))
    end
    a1.assets = TrafficRushAssets_upv_1.new(container_1)
    local tbl_9 = nil
    local tbl_10 = nil
    local v7 = nil
    for _, value_2 in TRAFFIC_RUSH_CONFIG_upv_1.vehicleTypes do
        tbl_9 = {}
        for v9, value_3 in value_2.variants do
            tbl_10 = {}
            for n_1 = 0, value_3.poolSize - 1 do
                v7 = a1.assets:makeSkin(value_2, value_3, n_1)
                if v7 == nil then
                    continue
                end
                table.insert(tbl_10, v7)
                table.insert(a1.allSkins, v7)
                if value_2.name == "moto" then
                    table.insert(a1.motoSkins, v7)
                end
            end
            table.insert(tbl_9, tbl_10)
        end
        table.insert(a1.variantPools, tbl_9)
    end
    a1.laneWarning = LaneWarning_upv_1.new(container_1, a1.stage.origin)
    if v5 ~= nil then
        if v5.signals == nil then
            a1:buildTrafficSignals(container_1)
        else
            for _, value_4 in v5.signals do
                table.insert(a1.signalRedLamps, value_4.redLamp)
                table.insert(a1.signalGreenLamps, value_4.greenLamp)
            end
        end
        if v5.lighting ~= nil then
            a1.stage.setLighting(readLightingFolderProfile_upv_1(v5.lighting, tbl_upv_6, DEFAULT_GAME_LIGHTING_upv_1))
        end
    else
        a1:buildBuildings(container_1)
        a1:buildTrafficSignals(container_1)
    end
    a1:loadRiders()
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function()
                --[[
                  line: 210
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:applyRiderHalt()
            end
        ),
        true
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            gameFrozenAtom_upv_1,
            function()
                --[[
                  line: 213
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:applyRiderHalt()
            end
        ),
        true
    )
    for _ = 0, 11 do
        local v8 = makeSmoothPart_upv_1(container_1)
        v8.Material = Enum.Material.Neon
        v8.Color = u10
        v8.Size = Vector3.new(2.200000047683716, 0.25, 2.200000047683716)
        v8.CFrame = u1
        table.insert(a1.stopMarkers, v8)
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    a1.smokeAnchor = makeSmoothPart_upv_1(container_1)
    a1.smokeAnchor.Transparency = 1
    a1.smokeAnchor.Size = Vector3.new(1, 1, 1)
    a1.smokeAnchor.CFrame = u1
    a1.smokeBurst = Instance.new("ParticleEmitter")
    a1.smokeBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.smokeBurst.Rate = 0
    a1.smokeBurst.Lifetime = NumberRange.new(0.5, 1)
    a1.smokeBurst.Speed = NumberRange.new(5, 11)
    a1.smokeBurst.SpreadAngle = Vector2.new(180, 180)
    a1.smokeBurst.Rotation = NumberRange.new(0, 90)
    a1.smokeBurst.RotSpeed = NumberRange.new(-160, 160)
    a1.smokeBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 1.1), NumberSequenceKeypoint.new(1, 0.3)})
    a1.smokeBurst.Color = ColorSequence.new(u11)
    a1.smokeBurst.Parent = a1.smokeAnchor
    a1.sparkBurst = Instance.new("ParticleEmitter")
    a1.sparkBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.sparkBurst.Rate = 0
    a1.sparkBurst.Lifetime = NumberRange.new(0.2, 0.45)
    a1.sparkBurst.Speed = NumberRange.new(10, 18)
    a1.sparkBurst.SpreadAngle = Vector2.new(180, 180)
    a1.sparkBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.1)})
    a1.sparkBurst.LightEmission = 0.9
    a1.sparkBurst.Color = ColorSequence.new(u12)
    a1.sparkBurst.Parent = a1.smokeAnchor
    a1.dashBurst = Instance.new("ParticleEmitter")
    a1.dashBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.dashBurst.Rate = 0
    a1.dashBurst.Lifetime = NumberRange.new(0.18, 0.32)
    a1.dashBurst.Speed = NumberRange.new(8, 14)
    a1.dashBurst.SpreadAngle = Vector2.new(180, 180)
    a1.dashBurst.Rotation = NumberRange.new(0, 90)
    a1.dashBurst.RotSpeed = NumberRange.new(-160, 160)
    a1.dashBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(1, 0.1)})
    local tbl_11 = {NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(1, 1)}
    a1.dashBurst.Transparency = NumberSequence.new(tbl_11)
    a1.dashBurst.Color = ColorSequence.new(u6, u11)
    a1.dashBurst.Parent = a1.smokeAnchor
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 267
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "key" and not (a1.sim:isCrashed()) then
                    a1.pressActive = true
                    a1.pressConsumed = false
                    a1.pressOrigin = a2
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a4, a5)
                --[[
                  line: 275
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a5 ~= "key" and not (a1.sim:isCrashed()) then
                    if a1.pressActive and not (a1.pressConsumed) then
                        a1.pressConsumed = true
                        a1:dashAt(a1.pressOrigin)
                        return
                    end
                    return nil
                end
                return nil
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 286
                  upvalues:
                    a1 (copy, index: 1)
                    TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 2)
                ]]
                local v9 = nil
                if a8 ~= "key" then
                    v9 = a1.pressConsumed
                    a1.pressActive = false
                    a1.pressConsumed = false
                    if not (v9) and not (a1.sim:isCrashed()) then
                        if TRAFFIC_RUSH_CONFIG_upv_1.tapMaxSeconds >= a7 then
                            a1:tapAt(a6)
                            return
                        end
                        return nil
                    end
                end
                return nil
            end
        )
    )
    a1.tutorial = TrafficRushTutorial_upv_1.new(a1.context.audio)
    a1.context.janitor:Add(a1.tutorial, "destroy")
end
u20.resetRound = function(a1)
    --[[
      name: resetRound
      line: 304
    ]]
    a1:endTutorial()
    for _, value_5 in a1.sim.pool do
        if value_5.active then
            a1:releaseSkin(value_5)
        end
    end
    table.clear(a1.skinByVehicleId)
    a1.emergencyActive = nil
    a1.laneWarning:park()
    a1.riderCrashHold = false
    a1:applyRiderHalt()
    a1.sim:reset(a1.context.getRunSeed())
    a1.simClock = 0
    a1.comboCount = 0
    a1.lastClearAt = -math.huge
    a1.smashSoundPending = false
    a1.pressActive = false
    a1.pressConsumed = false
    a1.context.reportScore(0)
    a1.tutorial:arm()
end
u20.endTutorial = function(a1)
    --[[
      name: endTutorial
      line: 329
    ]]
    a1.tutorial:disarm()
    a1.timeScale = 1
end
u20.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 333
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.simClock = a1.simClock + a2
    a1.sim:step(a2)
    if not a1.smashSoundPending then
        return
    end
    a1.smashSoundPending = false
    if (a1.sim:isCrashed()) then
        return
    end
    a1.context.audio.play("carCrash", {volume = TRAFFIC_RUSH_CONFIG_upv_1.emergency.smashSoundVolume})
end
u20.render = function(a1)
    --[[
      name: render
      line: 349
      upvalues:
        lerp_upv_1 (copy, index: 1)
        vehicleWorldXAt_upv_1 (copy, index: 2)
        vehicleWorldZAt_upv_1 (copy, index: 3)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        u16 (copy, index: 6)
        u17 (copy, index: 7)
        u19 (copy, index: 8)
        u18 (copy, index: 9)
    ]]
    a1:updateCamera()
    local origin_1 = a1.stage.origin
    local v10 = 0
    a1.laneFrontProgress[1] = -1
    a1.laneFrontStopped[1] = false
    a1.laneFrontProgress[2] = -1
    a1.laneFrontStopped[2] = false
    a1.laneFrontProgress[3] = -1
    a1.laneFrontStopped[3] = false
    a1.laneFrontProgress[4] = -1
    a1.laneFrontStopped[4] = false
    local v11 = nil
    local v12 = nil
    local v13 = nil
    local v14 = nil
    local v15 = nil
    for v16, v17 in a1.sim.pool do
        if not (v17.active) then
            continue
        end
        if not (v17.cleared) and not (v17.crashed) and a1.laneFrontProgress[v17.laneIndex + 1] < v17.progress then
            a1.laneFrontProgress[v17.laneIndex + 1] = v17.progress
            a1.laneFrontStopped[v17.laneIndex + 1] = v17.stopped
        end
        v15 = a1.skinByVehicleId[v17.id]
        if v15 == nil then
            continue
        end
        v14 = lerp_upv_1(v17.prevProgress, v17.progress, a1.renderAlpha)
        v12 = origin_1.X + vehicleWorldXAt_upv_1(v17, v14)
        v13 = origin_1.Z + vehicleWorldZAt_upv_1(v17, v14)
        v15:pose(v12, origin_1.Y, v13, a1.headings[v17.laneIndex + 1])
        if not (v17.stopped) or v10 >= #a1.stopMarkers then
            continue
        end
        v11 = true
        if TRAFFIC_RUSH_CONFIG_upv_1.releaseWarnSeconds >= TRAFFIC_RUSH_CONFIG_upv_1.autoReleaseSeconds - v17.stopTimer then
            v11 = math.floor(a1.simClock * 8) % 2 == 0
        end
        if v11 then
            a1.stopMarkers[v10 + 1].CFrame = CFrame.new(v12, (origin_1.Y + v15.size.Y) + 1.2, v13)
            v10 = v10 + 1
        end
    end
    local v18, v19
    v18, v19 = false, v10
    while true do
        if v18 then
            v19 = v19 + 1
        else
            v18 = true
        end
        if v19 >= #a1.stopMarkers then
            break
        end
        a1.stopMarkers[v19 + 1].CFrame = u1
    end
    local v20, _ = nil, nil
    for n_2 = 0, #a1.signalRedLamps - 1 do
        local v16
        v16 = a1.laneFrontStopped[n_2 + 1]
        local v17
        if a1.signalLastRed[n_2 + 1] == v16 then
            continue
        end
        a1.signalLastRed[n_2 + 1] = v16
        v17 = a1.signalRedLamps[n_2 + 1]
        if v16 then
            v20 = u16
        else
            v20 = u17
        end
        v17.Color = v20
        v17 = a1.signalGreenLamps[n_2 + 1]
        if v16 then
            v20 = u19
        else
            v20 = u18
        end
        v17.Color = v20
    end
    a1:updateEmergency()
    if not a1.tutorial:isActive() then
        return
    end
    a1.timeScale = a1.tutorial:update(a1.realDelta, a1:leadFrontTravel())
end
u20.leadFrontTravel = function(a1)
    --[[
      name: leadFrontTravel
      line: 419
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v21 = -math.huge
    for n_3 = 0, 3 do
        local v22
        v22 = a1.laneFrontProgress[n_3 + 1]
        local v23
        if v22 < 0 then
            continue
        end
        v23 = v22 - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance
        if v21 < v23 then
            v21 = v23
        end
    end
    return v21
end
u20.updateEmergency = function(a1)
    --[[
      name: updateEmergency
      line: 433
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local emergencyActive_1 = a1.emergencyActive
    local v24 = nil
    if emergencyActive_1 ~= nil then
        local v25 = a1.simClock * TRAFFIC_RUSH_CONFIG_upv_1.emergency.flashHz % 1
        emergencyActive_1.skin:setBeaconPhase(v25)
        local vehicle_1 = emergencyActive_1.vehicle
        v24 = vehicle_1.progress - TRAFFIC_RUSH_CONFIG_upv_1.spawnDistance + vehicle_1.length / 2
        if v24 >= -TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth then
            a1.laneWarning:park()
        else
            a1.laneWarning:aim(vehicle_1.laneIndex)
            a1.laneWarning:update(v25, (math.clamp(1 - ((-(v24 + TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth) / math.max(vehicle_1.speed, 1)) / TRAFFIC_RUSH_CONFIG_upv_1.emergency.warning.withinSeconds), 0, 1)))
        end
    else
        return nil
    end
end
u20.revive = function(a1)
    --[[
      name: revive
      line: 452
    ]]
    a1:endTutorial()
    a1.sim:recoverFromCrash()
    local emergencyActive_2 = a1.emergencyActive
    if emergencyActive_2 ~= nil then
        local _ = emergencyActive_2.skin:startSiren()
    end
    a1.riderCrashHold = false
    a1:applyRiderHalt()
    a1:setRunning(true)
end
u20.captureRound = function(a1)
    --[[
      name: captureRound
      line: 467
    ]]
    return nil
end
u20.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 471
    ]]
    return false
end
u20.onVehicleSpawned = function(a1, a2)
    --[[
      name: onVehicleSpawned
      line: 474
      upvalues:
        tbl_upv_1 (copy, index: 1)
        vehicleWorldXAt_upv_1 (copy, index: 2)
        vehicleWorldZAt_upv_1 (copy, index: 3)
    ]]
    local v26 = a1.variantPools[a2.typeIndex + 1][a2.variantIndex + 1]
    local v27 = #v26
    local v28 = v26[v27]
    v26[v27] = nil
    if v28 ~= nil then
        a1.skinByVehicleId[a2.id] = v28
        if v28.emergency == nil then
            v28:setLivery(tbl_upv_1[(a2.id % #tbl_upv_1) + 1])
        else
            a1.emergencyActive = {vehicle = a2, skin = v28}
            v28:startSiren()
        end
        local origin_2 = a1.stage.origin
        v28:pose(origin_2.X + vehicleWorldXAt_upv_1(a2, a2.progress), origin_2.Y, origin_2.Z + vehicleWorldZAt_upv_1(a2, a2.progress), a1.headings[a2.laneIndex + 1])
    else
        return nil
    end
end
u20.onVehicleCleared = function(a1, a2)
    --[[
      name: onVehicleCleared
      line: 502
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        publishCombo_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        vehicleWorldXAt_upv_1 (copy, index: 4)
        vehicleWorldZAt_upv_1 (copy, index: 5)
        u6 (copy, index: 6)
    ]]
    a1.context.reportScore(a1.sim:score())
    a1.comboCount = ((a1.simClock - a1.lastClearAt > TRAFFIC_RUSH_CONFIG_upv_1.comboWindowSeconds) and 1) or (a1.comboCount + 1)
    a1.lastClearAt = a1.simClock
    if TRAFFIC_RUSH_CONFIG_upv_1.comboStampFrom <= a1.comboCount then
        publishCombo_upv_1({count = a1.comboCount, color = u8})
    end
    if a2.dashed then
        local origin_3 = a1.stage.origin
        a1.popups:show(Vector3.new(origin_3.X + vehicleWorldXAt_upv_1(a2, a2.progress), origin_3.Y + 4, origin_3.Z + vehicleWorldZAt_upv_1(a2, a2.progress)), "SENT!", u6, 0.8)
    end
end
u20.onVehicleDespawned = function(a1, a2)
    --[[
      name: onVehicleDespawned
      line: 520
    ]]
    a1:releaseSkin(a2)
end
u20.onVehicleSmashed = function(a1, a2, a3)
    --[[
      name: onVehicleSmashed
      line: 523
      upvalues:
        vehicleWorldXAt_upv_1 (copy, index: 1)
        vehicleWorldZAt_upv_1 (copy, index: 2)
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 3)
    ]]
    local origin_4 = a1.stage.origin
    a1.smokeAnchor.CFrame = CFrame.new(origin_4.X + vehicleWorldXAt_upv_1(a2, a2.progress), origin_4.Y + 2, origin_4.Z + vehicleWorldZAt_upv_1(a2, a2.progress))
    a1.smokeBurst:Emit(TRAFFIC_RUSH_CONFIG_upv_1.emergency.smashSmokeCount)
    a1.sparkBurst:Emit(TRAFFIC_RUSH_CONFIG_upv_1.emergency.smashSparkCount)
    a1.stage.shake(0.2)
    a1.smashSoundPending = true
end
u20.onNearMiss = function(a1, a2, a3, a4, a5)
    --[[
      name: onNearMiss
      line: 531
      upvalues:
        u8 (copy, index: 1)
        tbl_upv_5 (copy, index: 2)
    ]]
    local origin_5 = a1.stage.origin
    a1.popups:show(Vector3.new(origin_5.X + a4, origin_5.Y + 4.5, origin_5.Z + a5), "CLOSE!", u8, 1)
    a1.context.audio.play(tbl_upv_5[a1.nearMissSoundIndex + 1], {})
    a1.nearMissSoundIndex = (a1.nearMissSoundIndex + 1) % #tbl_upv_5
end
u20.onCrash = function(a1, a2, a3, a4, a5)
    --[[
      name: onCrash
      line: 540
      upvalues:
        u9 (copy, index: 1)
    ]]
    a1:endTutorial()
    local origin_6 = a1.stage.origin
    local v29 = Vector3.new(origin_6.X + a4, origin_6.Y + 2, origin_6.Z + a5)
    a1.popups:show(v29 + Vector3.new(0, 3, 0), "CRASH!", u9, 1.4)
    a1.smokeAnchor.CFrame = CFrame.new(v29)
    a1.smokeBurst:Emit(30)
    a1.sparkBurst:Emit(14)
    a1.stage.shake(0.6)
    a1.context.audio.play("carCrash", {})
    local emergencyActive_3 = a1.emergencyActive
    if emergencyActive_3 ~= nil then
        local _ = emergencyActive_3.skin:stopSiren()
    end
    a1.laneWarning:park()
    a1:poseAtSimPosition(a2)
    a1:poseAtSimPosition(a3)
    a1.riderCrashHold = true
    a1:applyRiderHalt()
    a1:setRunning(false)
    a1.context.endRun(a1.sim:score())
end
u20.poseAtSimPosition = function(a1, a2)
    --[[
      name: poseAtSimPosition
      line: 581
      upvalues:
        vehicleWorldXAt_upv_1 (copy, index: 1)
        vehicleWorldZAt_upv_1 (copy, index: 2)
    ]]
    local v30 = a1.skinByVehicleId[a2.id]
    if v30 ~= nil then
        local origin_7 = a1.stage.origin
        v30:pose(origin_7.X + vehicleWorldXAt_upv_1(a2, a2.progress), origin_7.Y, origin_7.Z + vehicleWorldZAt_upv_1(a2, a2.progress), a1.headings[a2.laneIndex + 1])
    else
        return nil
    end
end
u20.tapAt = function(a1, a2)
    --[[
      name: tapAt
      line: 591
    ]]
    local v31 = a1:screenToBoard(a2)
    local v32 = a1.sim:pickNearest(v31.X, v31.Y)
    if v32 == nil then
        return nil
    elseif a1.sim:tap(v32.id) == "stopped" then
        a1.context.audio.play("tireScreech", {})
        a1.tutorial:noteStopped()
    end
end
u20.dashAt = function(a1, a2)
    --[[
      name: dashAt
      line: 612
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        vehicleWorldXAt_upv_1 (copy, index: 2)
        vehicleWorldZAt_upv_1 (copy, index: 3)
    ]]
    local v33 = a1:screenToBoard(a2)
    local v34 = a1.sim:pickNearest(v33.X, v33.Y)
    if v34 ~= nil then
        local v35 = nil
        if a1.sim:dash(v34.id) then
            local pitchJitter_1 = TRAFFIC_RUSH_CONFIG_upv_1.pushSound.pitchJitter
            v35 = a1.skinByVehicleId[v34.id]
            if v35 ~= nil then
                v35:playPush(1 + (((math.random() * 2) - 1) * pitchJitter_1))
            end
            local origin_8 = a1.stage.origin
            local LookVector_1 = a1.headings[v34.laneIndex + 1].LookVector
            local v36 = v34.length / 2 + 0.5
            a1.smokeAnchor.CFrame = CFrame.new(origin_8.X + vehicleWorldXAt_upv_1(v34, v34.progress) - (LookVector_1.X * v36), origin_8.Y + 1.1, origin_8.Z + vehicleWorldZAt_upv_1(v34, v34.progress) - (LookVector_1.Z * v36))
            a1.dashBurst:Emit(10)
            a1.tutorial:noteDashed()
        end
    else
        return nil
    end
end
u20.screenToBoard = function(a1, a2)
    --[[
      name: screenToBoard
      line: 639
    ]]
    local v37 = a1.stage.camera:ScreenPointToRay(a2.X, a2.Y)
    local Y_1 = v37.Direction.Y
    if math.abs(Y_1) >= 1e-04 then
        local v38 = v37.Origin + v37.Direction * ((a1.stage.origin.Y - v37.Origin.Y) / Y_1)
        return Vector2.new(v38.X - a1.stage.origin.X, v38.Z - a1.stage.origin.Z)
    end
    return Vector2.new(math.huge, math.huge)
end
u20.updateCamera = function(a1)
    --[[
      name: updateCamera
      line: 651
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
    ]]
    local camera_1 = a1.stage.camera
    local ViewportSize_1 = camera_1.ViewportSize
    if ViewportSize_1.X ~= a1.lastViewportX or ViewportSize_1.Y ~= a1.lastViewportY then
        a1.lastViewportX = ViewportSize_1.X
        a1.lastViewportY = ViewportSize_1.Y
        camera_1.FieldOfView = TRAFFIC_RUSH_CONFIG_upv_1.cameraFieldOfView
        local v39 = math.rad(TRAFFIC_RUSH_CONFIG_upv_1.cameraFieldOfView / 2)
        local v40 = ViewportSize_1.X / math.max(ViewportSize_1.Y, 1)
        local v41 = math.atan(math.tan(v39) * v40)
        local v42 = math.rad(TRAFFIC_RUSH_CONFIG_upv_1.cameraPitchDegrees)
        local v43 = math.max((TRAFFIC_RUSH_CONFIG_upv_1.frameWidthStuds / 2) / math.tan(v41), ((TRAFFIC_RUSH_CONFIG_upv_1.frameDepthStuds / 2) * math.sin(v42)) / math.tan(v39))
        a1.cameraCFrame = CFrame.lookAt(a1.stage.origin + Vector3.new(0, math.sin(v42) * v43, math.cos(v42) * v43), a1.stage.origin)
        for _, value_6 in a1.allSkins do
            value_6:setPushRollOff(v43, v43 + TRAFFIC_RUSH_CONFIG_upv_1.pushSound.rollOffSpread)
        end
    end
    a1.stage.setCameraCFrame(a1.cameraCFrame)
end
u20.releaseSkin = function(a1, a2)
    --[[
      name: releaseSkin
      line: 677
    ]]
    local v44 = a1.skinByVehicleId[a2.id]
    local v45 = nil
    if v44 ~= nil then
        v44:park()
        table.insert(a1.variantPools[a2.typeIndex + 1][a2.variantIndex + 1], v44)
        a1.skinByVehicleId[a2.id] = nil
        v45 = a1.emergencyActive
        if v45 ~= nil then
            v45 = v45.vehicle
        end
        if v45 == a2 then
            a1.emergencyActive = nil
            a1.laneWarning:park()
        end
    else
        return nil
    end
end
u20.buildGround = function(a1, a2)
    --[[
      name: buildGround
      line: 699
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        u2 (copy, index: 4)
        u3 (copy, index: 5)
        u5 (copy, index: 6)
        makeSmoothPart_upv_1 (copy, index: 7)
        u6 (copy, index: 8)
        TRAFFIC_LANES_upv_1 (copy, index: 9)
        u7 (copy, index: 10)
    ]]
    local origin_9 = a1.stage.origin
    local roadHalfWidth_1 = TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth
    local fieldEdge_1 = TRAFFIC_RUSH_CONFIG_upv_1.fieldEdge
    local v46 = fieldEdge_1 - roadHalfWidth_1
    local v47 = roadHalfWidth_1 + v46 / 2
    local v48 = roadHalfWidth_1 * 2
    local v49 = fieldEdge_1 * 2
    local v50 = nil
    local key_1 = nil
    if v50 == nil then
        v50 = 0
    end
    if key_1 == nil then
        key_1 = 1
    end
    local v51 = makeStagePart_upv_1(a2)
    v51.Size = Vector3.new(v48, key_1, v49)
    v51.Color = u4
    v51.CFrame = CFrame.new(origin_9.X + 0, (origin_9.Y + v50) - (key_1 / 2), origin_9.Z + 0)
    local v52 = roadHalfWidth_1 * 2
    local v53 = nil
    v50 = nil
    if v53 == nil then
        v53 = 0
    end
    if v50 == nil then
        v50 = 1
    end
    key_1 = makeStagePart_upv_1(a2)
    key_1.Size = Vector3.new(v46, v50, v52)
    key_1.Color = u4
    key_1.CFrame = CFrame.new(origin_9.X + v47, (origin_9.Y + v53) - (v50 / 2), origin_9.Z + 0)
    local v54 = roadHalfWidth_1 * 2
    v50 = nil
    local v55 = nil
    if v50 == nil then
        v50 = 0
    end
    if v55 ~= nil then
        key_1 = v55
    else
        key_1 = 1
    end
    local v56 = makeStagePart_upv_1(a2)
    v56.Size = Vector3.new(v46, key_1, v54)
    v56.Color = u4
    v56.CFrame = CFrame.new(origin_9.X + -v47, (origin_9.Y + v50) - (key_1 / 2), origin_9.Z + 0)
    v49 = nil
    v53 = nil
    if v49 == nil then
        v49 = 0
    end
    if v53 == nil then
        v53 = 1
    end
    v50 = makeStagePart_upv_1(a2)
    v50.Size = Vector3.new(v46, v53, v46)
    v50.Color = u2
    v50.CFrame = CFrame.new(origin_9.X + v47, (origin_9.Y + v49) - (v53 / 2), origin_9.Z + v47)
    local v57 = nil
    key_1 = nil
    if v57 ~= nil then
        v50 = v57
    else
        v50 = 0
    end
    if key_1 == nil then
        key_1 = 1
    end
    local v58 = makeStagePart_upv_1(a2)
    v58.Size = Vector3.new(v46, key_1, v46)
    v58.Color = u2
    v58.CFrame = CFrame.new(origin_9.X + -v47, (origin_9.Y + v50) - (key_1 / 2), origin_9.Z + -v47)
    v53 = nil
    local v59 = nil
    if v53 == nil then
        v53 = 0
    end
    if v59 ~= nil then
        v50 = v59
    else
        v50 = 1
    end
    key_1 = makeStagePart_upv_1(a2)
    key_1.Size = Vector3.new(v46, v50, v46)
    key_1.Color = u3
    local v60 = nil
    key_1.CFrame = CFrame.new(origin_9.X + v60, (origin_9.Y + v53) - (v50 / 2), origin_9.Z + -v47)
    local v61 = nil
    local v62 = nil
    if v61 ~= nil then
        v53 = v61
    else
        v53 = 0
    end
    if v62 ~= nil then
        v50 = v62
    else
        v50 = 1
    end
    key_1 = makeStagePart_upv_1(a2)
    key_1.Size = Vector3.new(v46, v50, v46)
    key_1.Color = u3
    local v63 = nil
    key_1.CFrame = CFrame.new(origin_9.X + -v60, (origin_9.Y + v53) - (v50 / 2), origin_9.Z + v63)
    local v64 = roadHalfWidth_1 + 1.25
    v47 = v63
    local value_7 = nil
    local v65 = nil
    local v66 = nil
    local value_8 = nil
    local v67 = nil
    local v68 = nil
    local _ = nil
    local v84 = nil
    local v85 = nil
    local v69 = nil
    local v86 = nil
    for key_1, value_7 in {-1, 1} do
        v66 = nil
        value_8 = nil
        v67 = nil
        v68 = nil
        v65 = nil
        v67 = nil
        v68 = nil
        for v87, value_8 in {-1, 1} do
            v67 = value_7 * v64
            v68 = value_8 * v47
            v69 = 0.2
            v65 = 1.4
            if v69 == nil then
                v69 = 0
            end
            if v65 == nil then
                v65 = 1
            end
            v66 = makeStagePart_upv_1(a2)
            v66.Size = Vector3.new(2.5, v65, v46)
            v66.Color = u5
            v66.CFrame = CFrame.new(origin_9.X + v67, (origin_9.Y + v69) - (v65 / 2), origin_9.Z + v68)
            v67 = value_8 * v47
            v68 = value_7 * v64
            v69 = 0.2
            v65 = 1.4
            if v69 == nil then
                v69 = 0
            end
            if v65 == nil then
                v65 = 1
            end
            local v70 = makeStagePart_upv_1(a2)
            v70.Size = Vector3.new(v46, v65, 2.5)
            v70.Color = u5
            v70.CFrame = CFrame.new(origin_9.X + v67, (origin_9.Y + v69) - (v65 / 2), origin_9.Z + v68)
        end
    end
    v50, v53 = false, roadHalfWidth_1 + 8.5
    while true do
        if v50 then
            v53 = v53 + 7
        else
            v50 = true
        end
        if v53 >= fieldEdge_1 - 3 then
            break
        end
        local v71 = makeSmoothPart_upv_1(a2)
        v71.Size = Vector3.new(0.800000011920929, 0.20000000298023224, 3)
        v71.Color = u6
        v71.CFrame = CFrame.new(origin_9.X + 0, origin_9.Y + 0.1, origin_9.Z + v53)
        local v72 = makeSmoothPart_upv_1(a2)
        v72.Size = Vector3.new(0.800000011920929, 0.20000000298023224, 3)
        v72.Color = u6
        v72.CFrame = CFrame.new(origin_9.X + 0, origin_9.Y + 0.1, origin_9.Z + -v53)
        local v73 = makeSmoothPart_upv_1(a2)
        v73.Size = Vector3.new(3, 0.20000000298023224, 0.800000011920929)
        v73.Color = u6
        v73.CFrame = CFrame.new(origin_9.X + v53, origin_9.Y + 0.1, origin_9.Z + 0)
        local v74 = makeSmoothPart_upv_1(a2)
        v74.Size = Vector3.new(3, 0.20000000298023224, 0.800000011920929)
        v74.Color = u6
        v74.CFrame = CFrame.new(origin_9.X + -v53, origin_9.Y + 0.1, origin_9.Z + 0)
    end
    local v75 = nil
    for v88, value_9 in TRAFFIC_LANES_upv_1 do
        v75 = -value_9.dir * (roadHalfWidth_1 + 1.4)
        if value_9.axis ~= "z" then
            local v76 = makeSmoothPart_upv_1(a2)
            v76.Size = Vector3.new(1.100000023841858, 0.20000000298023224, 6.199999809265137)
            v76.Color = u6
            v76.CFrame = CFrame.new(origin_9.X + v75, origin_9.Y + 0.1, origin_9.Z + value_9.lateral)
        else
            local v77 = makeSmoothPart_upv_1(a2)
            v77.Size = Vector3.new(6.199999809265137, 0.20000000298023224, 1.100000023841858)
            v77.Color = u6
            v77.CFrame = CFrame.new(origin_9.X + value_9.lateral, origin_9.Y + 0.1, origin_9.Z + v75)
        end
    end
    local v78 = roadHalfWidth_1 + 4.6
    for n_4 = -2, 2 do
        local v79 = n_4 * 2.8
        local v80 = makeSmoothPart_upv_1(a2)
        v80.Size = Vector3.new(1.399999976158142, 0.20000000298023224, 2.200000047683716)
        v80.Color = u7
        v80.CFrame = CFrame.new(origin_9.X + v79, origin_9.Y + 0.1, origin_9.Z + v78)
        local v81 = makeSmoothPart_upv_1(a2)
        v81.Size = Vector3.new(1.399999976158142, 0.20000000298023224, 2.200000047683716)
        v81.Color = u7
        v81.CFrame = CFrame.new(origin_9.X + v79, origin_9.Y + 0.1, origin_9.Z + -v78)
        local v82 = makeSmoothPart_upv_1(a2)
        v82.Size = Vector3.new(2.200000047683716, 0.20000000298023224, 1.399999976158142)
        v82.Color = u7
        v82.CFrame = CFrame.new(origin_9.X + v78, origin_9.Y + 0.1, origin_9.Z + v79)
        local v83 = makeSmoothPart_upv_1(a2)
        v83.Size = Vector3.new(2.200000047683716, 0.20000000298023224, 1.399999976158142)
        v83.Color = u7
        v83.CFrame = CFrame.new(origin_9.X + -v78, origin_9.Y + 0.1, origin_9.Z + v79)
    end
end
u20.buildBuildings = function(a1, a2)
    --[[
      name: buildBuildings
      line: 780
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
        tbl_upv_4 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        makeSmoothPart_upv_1 (copy, index: 6)
        u13 (copy, index: 7)
    ]]
    local origin_10 = a1.stage.origin
    local v84 = TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth + 4
    local v85 = 0
    local v86 = nil
    local v87 = nil
    local v88 = nil
    local v89 = nil
    local v90 = nil
    local v91 = nil
    local v92 = nil
    local v93 = nil
    local v94 = nil
    local v95 = nil
    local v96 = nil
    local v97 = nil
    local _ = nil
    local v98 = nil
    local v99 = nil
    local v100 = nil
    local v101 = nil
    local v102 = nil
    local v103 = nil
    local v104 = nil
    local v105 = nil
    local v107 = nil
    for v108, v86 in {-1, 1} do
        v87 = nil
        v88 = nil
        v89 = nil
        v90 = nil
        v91 = nil
        v92 = nil
        v93 = nil
        v94 = nil
        v95 = nil
        v96 = nil
        v97 = nil
        _ = nil
        v98 = nil
        v99 = nil
        v100 = nil
        v101 = nil
        v102 = nil
        v103 = nil
        v104 = nil
        v105 = nil
        for v109, v90 in {-1, 1} do
            v88 = nil
            v86 = nil
            v89 = nil
            v90 = nil
            v91 = nil
            v92 = nil
            v93 = nil
            v94 = nil
            v95 = nil
            v96 = nil
            v97 = nil
            _ = nil
            v85 = nil
            v98 = nil
            v99 = nil
            v100 = nil
            v101 = nil
            v102 = nil
            v103 = nil
            v104 = nil
            for v110, value_10 in tbl_upv_2 do
                v100 = value_10[1]
                v101 = value_10[2]
                v102 = value_10[3]
                v103 = value_10[4]
                v104 = v85 + 1
                v105 = v104 * 2654435761 % 4294967296
                v87 = tbl_upv_3[(v105 % #tbl_upv_3) + 1]
                if v90 == 1 and v101 < 12 then
                    v87 = math.min(v87, 7)
                end
                v88 = tbl_upv_4[((v105 + v104) % #tbl_upv_4) + 1]
                v89 = origin_10.X + v86 * ((v84 + v100) + (v102 / 2))
                v91 = origin_10.Z + v90 * ((v84 + v101) + (v103 / 2))
                v92 = makeStagePart_upv_1(a2)
                v92.Size = Vector3.new(v102, v87, v103)
                v92.Color = v88
                v92.CFrame = CFrame.new(v89, origin_10.Y + (v87 / 2), v91)
                v93 = makeStagePart_upv_1(a2)
                v93.Size = Vector3.new(v102 - 1.2, 0.8, v103 - 1.2)
                v93.Color = v88:Lerp(Color3.new(0, 0, 0), 0.3)
                v93.CFrame = CFrame.new(v89, (origin_10.Y + v87) + 0.4, v91)
                v94 = math.min(math.floor((v87 - 3) / 3.2), 3)
                v95 = math.min(math.floor((v102 - 3) / 3.6), 3)
                v96 = 0
                v97 = false
                v85 = v104
                if v97 then
                    v96 = v96 + 1
                else
                    v97 = true
                end
                if v96 >= v94 then
                    continue
                end
                v99 = 0
                v98 = false
                while true do
                    if v98 then
                        v99 = v99 + 1
                    else
                        v98 = true
                    end
                    if v99 >= v95 then
                        break
                    end
                    local v106 = makeSmoothPart_upv_1(a2)
                    v106.Size = Vector3.new(1.7000000476837158, 2, 0.15000000596046448)
                    v106.Color = u13
                    v106.CFrame = CFrame.new(v89 + ((v99 - ((v95 - 1) / 2)) * 3.6), (origin_10.Y + 2.6) + (v96 * 3.2), (v91 + (v103 / 2)) + 0.08)
                    _ = nil
                end
            end
        end
    end
end
u20.buildTrafficSignals = function(a1, a2)
    --[[
      name: buildTrafficSignals
      line: 850
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        TRAFFIC_LANES_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u14 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        u15 (copy, index: 6)
        u17 (copy, index: 7)
        u18 (copy, index: 8)
    ]]
    local origin_11 = a1.stage.origin
    local roadHalfWidth_2 = TRAFFIC_RUSH_CONFIG_upv_1.roadHalfWidth
    local v107 = nil
    for _, value_11 in TRAFFIC_LANES_upv_1 do
        if value_11.axis ~= "x" then
            v107 = Vector3.new(0, 0, value_11.dir)
        else
            v107 = Vector3.new(value_11.dir, 0, 0)
        end
        local v108 = v107 * -(roadHalfWidth_2 + 2.6) + v107:Cross(Vector3.new(0, 1, 0)) * (roadHalfWidth_2 + 2.4)
        local v109 = origin_11.X + v108.X
        local v110 = origin_11.Z + v108.Z
        local v111 = makeSmoothPart_upv_1(a2)
        v111.Size = Vector3.new(0.44999998807907104, 5.400000095367432, 0.44999998807907104)
        v111.Color = u14
        v111.CFrame = CFrame.new(v109, origin_11.Y + 2.7, v110)
        local v112 = makeStagePart_upv_1(a2)
        v112.Size = Vector3.new(1.5, 2.5999999046325684, 0.8999999761581421)
        v112.Color = u15
        local v113 = Vector3.new(v109, origin_11.Y + 6.7, v110)
        v112.CFrame = CFrame.lookAt(v113, v113 - v107)
        local v114 = v107 * -0.55
        local v115 = makeSmoothPart_upv_1(a2)
        v115.Material = Enum.Material.Neon
        v115.Size = Vector3.new(0.800000011920929, 0.800000011920929, 0.800000011920929)
        v115.Color = u17
        v115.CFrame = CFrame.new((v113 + v114) + Vector3.new(0, 0.6200000047683716, 0))
        local v116 = makeSmoothPart_upv_1(a2)
        v116.Material = Enum.Material.Neon
        v116.Size = Vector3.new(0.800000011920929, 0.800000011920929, 0.800000011920929)
        v116.Color = u18
        v116.CFrame = CFrame.new((v113 + v114) + Vector3.new(0, -0.6200000047683716, 0))
        table.insert(a1.signalRedLamps, v115)
        table.insert(a1.signalGreenLamps, v116)
    end
end
u20.loadRiders = function(a1)
    --[[
      name: loadRiders
      line: 894
      upvalues:
        Players_upv_1 (copy, index: 1)
        TrafficRushRider_upv_1 (copy, index: 2)
        ClientFunctions_upv_1 (copy, index: 3)
    ]]
    local tbl_12 = {}
    for _, value_12 in Players_upv_1:GetPlayers() do
        table.insert(tbl_12, value_12.UserId)
    end
    local v118 = 0
    local v119 = nil
    for _, value_upv_13 in a1.motoSkins do
        v119 = tbl_12[v118 + 1]
        if v119 == nil then
            ClientFunctions_upv_1.requestTrafficRiderPersona:invoke():andThen(
                function(a2)
                    --[[
                      line: 910
                      upvalues:
                        a1 (copy, index: 1)
                        TrafficRushRider_upv_1 (copy, index: 2)
                        value_upv_13 (copy, index: 3)
                    ]]
                    if a2 == nil then
                        return
                    end
                    table.insert(a1.riders, (TrafficRushRider_upv_1.new(value_upv_13, a2.userId, a1.context.janitor)))
                    a1:applyRiderHalt()
                end
            ):catch(function()
                --[[
                  line: 921
                ]]
            end)
        else
            local v120 = v118 + 1
            table.insert(a1.riders, (TrafficRushRider_upv_1.new(value_upv_13, v119, a1.context.janitor)))
            v118 = v120
        end
    end
end
u20.applyRiderHalt = function(a1)
    --[[
      name: applyRiderHalt
      line: 924
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    local v121 = pausedAtom_upv_1() or (gameFrozenAtom_upv_1() or (a1.riderCrashHold))
    for _, value_14 in a1.riders do
        value_14:setHalted(v121)
    end
end
local tbl_13 = {}
tbl_13.TrafficRushGame = u20
return tbl_13