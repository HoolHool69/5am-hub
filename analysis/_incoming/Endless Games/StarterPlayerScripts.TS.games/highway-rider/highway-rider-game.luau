-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService_upv_1 = v1.RunService
local UserInputService_upv_1 = v1.UserInputService
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "distance-score").DistanceScore
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local kitTouchInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "kit-touch-input").kitTouchInput
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local makeWedgePart_upv_1 = v2.makeWedgePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow")
local SpectateFollow_upv_1 = v3.SpectateFollow
local approach_upv_1 = v3.approach
local tiltInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "tilt-input").tiltInput
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network").ClientEvents
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "atoms").sessionAtom
local readLocalProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "daily-data").readLocalProfile
local highwayControlsAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "settings-atoms").highwayControlsAtom
local v4 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "player-settings")
local effectiveThrottle_upv_1 = v4.effectiveThrottle
local highwaySteerFactor_upv_1 = v4.highwaySteerFactor
local highwayThrottleFactor_upv_1 = v4.highwayThrottleFactor
local v5 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v5.gameFrozenAtom
local pausedAtom_upv_1 = v5.pausedAtom
local publishCombo_upv_1 = v5.publishCombo
local wheelieMeterAtom_upv_1 = v5.wheelieMeterAtom
local v6 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v6.readResume
local writeResume_upv_1 = v6.writeResume
local v7 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random")
local deriveRandom_upv_1 = v7.deriveRandom
local deriveSeed_upv_1 = v7.deriveSeed
local HIGHWAY_FP_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").HIGHWAY_FP_STAGE_LIGHTING
local v8 = RuntimeLib_1.import(script, script.Parent, "highway-rider-assets")
local HighwayRiderFpAssets_upv_1 = v8.HighwayRiderFpAssets
local HighwayRiderTpAssets_upv_1 = v8.HighwayRiderTpAssets
local sirenStartOffset_upv_1 = v8.sirenStartOffset
local mountBiomeDebugPanel_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-biome-debug").mountBiomeDebugPanel
local v9 = RuntimeLib_1.import(script, script.Parent, "highway-rider-biomes")
local biomeDisplayName_upv_1 = v9.biomeDisplayName
local biomeOrdinalAt_upv_1 = v9.biomeOrdinalAt
local v10 = RuntimeLib_1.import(script, script.Parent, "highway-rider-events")
local DIRECTOR_EVENTS_upv_1 = v10.DIRECTOR_EVENTS
local DIRECTOR_MAX_RESOURCE_COUNT_upv_1 = v10.DIRECTOR_MAX_RESOURCE_COUNT
local directorEvent_upv_1 = v10.directorEvent
local directorEventLabel_upv_1 = v10.directorEventLabel
local RAMP_GEOMETRY_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-vehicles").RAMP_GEOMETRY
local v11 = RuntimeLib_1.import(script, script.Parent, "highway-rider-night")
local fadeTransparency_upv_1 = v11.fadeTransparency
local HighwayDayNightCycle_upv_1 = v11.HighwayDayNightCycle
local HighwayEngineAudio_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-engine-audio").HighwayEngineAudio
local BikeRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-bike").BikeRig
local CarRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-car").CarRig
local HighwayRiderRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-rig").HighwayRiderRig
local HIGHWAY_RIDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-config").HIGHWAY_RIDER_CONFIG
local isUpdateLive_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-release").isUpdateLive
local tbl_upv_1 = {"nearMissWhoosh1", "nearMissWhoosh2", "nearMissWhoosh3", "nearMissWhoosh4", "nearMissWhoosh5"}
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(196, 34, 34)
local u3 = Color3.fromRGB(38, 84, 198)
local u4 = Color3.fromRGB(196, 188, 170)
local tbl_upv_2 = {"drive", "action1", "action2", "action3"}
local function drawFirstSeconds_1(a1, a2)
    --[[
      name: drawFirstSeconds
      line: 177
    ]]
    return a1.firstEarliestSeconds + a2:NextNumber(0, a1.firstSpreadSeconds)
end
local function flattenAngle_1(a1)
    --[[
      name: flattenAngle
      line: 195
    ]]
    return math.floor((a1 / math.pi) + 0.5) * math.pi
end
local function drawGapSeconds_1(a1, a2)
    --[[
      name: drawGapSeconds
      line: 198
    ]]
    local v12 = math.max(a1.gapSecondsMean - a1.gapSecondsMin, 0.001)
    return (math.min(a1.gapSecondsMin - (math.log(1 - a2:NextNumber()) * v12), a1.gapSecondsMax))
end
local u5 = Color3.fromRGB(26, 24, 30)
local tbl_upv_3 = {25.2, 30.2, 35.2, 40.2}
local _ = {26.75, 32.75, 38.75}
local B_upv_1 = Enum.KeyCode.B
local N_upv_1 = Enum.KeyCode.N
local function chunkWrapAt_1(a1, a2)
    --[[
      name: chunkWrapAt
      line: 336
    ]]
    return -math.floor(((a2 * 150) - a1) / 750)
end
local function chunkLocalZ_1(a1, a2)
    --[[
      name: chunkLocalZ
      line: 340
    ]]
    return (((((a2 * 150) - a1) % 750) + 750) % 750) - 80
end
local function chunkTileOrdinal_1(a1, a2)
    --[[
      name: chunkTileOrdinal
      line: 362
    ]]
    return a2 + (5 * -math.floor(((a2 * 150) - a1) / 750))
end
local u6 = Color3.fromRGB(68, 70, 76)
local u7 = Color3.fromRGB(96, 148, 84)
local u8 = Color3.fromRGB(238, 238, 228)
local u9 = Color3.fromRGB(158, 162, 170)
local u10 = Color3.fromRGB(120, 124, 132)
local u11 = Color3.fromRGB(132, 188, 235)
local u12 = Color3.fromRGB(255, 216, 102)
local u13 = Color3.fromRGB(255, 90, 100)
local u14 = Color3.fromRGB(255, 150, 70)
local tbl_upv_4 = {Color3.fromRGB(150, 150, 158), Color3.fromRGB(196, 176, 150), Color3.fromRGB(120, 130, 140), Color3.fromRGB(172, 144, 160), Color3.fromRGB(130, 148, 126), Color3.fromRGB(104, 112, 124)}
local u15 = Color3.fromRGB(90, 170, 255)
local u16 = Color3.fromRGB(245, 245, 245)
local u17 = Color3.fromRGB(238, 238, 228)
local u18 = Color3.fromRGB(226, 188, 70)
local u19 = Color3.fromRGB(61, 62, 67)
local u20 = Color3.fromRGB(176, 182, 192)
local u21 = Color3.fromRGB(105, 74, 50)
local tbl_upv_5 = {Color3.fromRGB(88, 140, 70), Color3.fromRGB(76, 132, 82), Color3.fromRGB(102, 150, 66)}
local u22 = Color3.fromRGB(84, 138, 74)
local u23 = Color3.fromRGB(108, 126, 138)
local u24 = Color3.fromRGB(126, 142, 154)
local u25 = Color3.fromRGB(138, 154, 164)
local u26 = Color3.fromRGB(255, 255, 255)
local u27 = Color3.fromRGB(26, 26, 30)
local u28 = Color3.fromRGB(110, 116, 126)
local u29 = Color3.fromRGB(255, 240, 190)
local u30 = Color3.fromRGB(30, 32, 38)
local tbl_upv_6 = {Color3.fromRGB(196, 84, 72), Color3.fromRGB(84, 128, 196), Color3.fromRGB(206, 178, 84), Color3.fromRGB(96, 168, 110), Color3.fromRGB(150, 110, 190), Color3.fromRGB(180, 184, 194)}
local tbl_upv_7 = {}
tbl_upv_7.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_7.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_7.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_7.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local function claimableByTraffic_1(a1)
    --[[
      name: claimableByTraffic
      line: 470
    ]]
    local v13 = not a1.active
    local v14 = nil
    if v13 then
        v14 = a1.visual
        if v14 ~= nil then
            v14 = v14.emergency
        end
        if v14 == nil then
            v13 = true
        else
            v13 = false
        end
        local v15 = nil
        if v13 then
            v15 = a1.visual
            if v15 ~= nil then
                v15 = v15.special
            end
            if v15 == nil then
                v13 = true
            else
                v13 = false
            end
        end
    end
    return v13
end
local tbl_8 = {}
local tbl_9 = {}
tbl_9.__tostring = function()
    --[[
      name: __tostring
      line: 528
    ]]
    return "HighwayRiderGame"
end
tbl_9.__index = BaseWorldGame_upv_1
local u31 = setmetatable(tbl_8, tbl_9)
u31.__index = u31
u31.new = function(...)
    --[[
      name: new
      line: 534
      upvalues:
        u31 (ref, index: 1)
    ]]
    local v16 = setmetatable({}, u31)
    return v16:constructor(...) or v16
end
u31.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 538
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        SpectateFollow_upv_1 (copy, index: 2)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 3)
        DistanceScore_upv_1 (copy, index: 4)
        highwayControlsAtom_upv_1 (copy, index: 5)
        isUpdateLive_upv_1 (copy, index: 6)
    ]]
    if a4 == nil then
        a4 = {}
    end
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.mode = a3
    a1.variant = a4
    a1.cars = {}
    a1.dashes = {}
    a1.posts = {}
    a1.playerS = 0
    a1.playerX = 6
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
    a1.spectateAnchorS = 0
    a1.spectateLeadStuds = 0
    a1.renderPrevS = 0
    a1.renderPrevX = 6
    a1.steerVelocity = 0
    a1.keyHeldSeconds = 0
    a1.lastKeyDirection = 0
    a1.steerFadeTarget = 0
    a1.steerFade = 0
    a1.wheelAngle = 0
    a1.elapsed = 0
    a1.speed = HIGHWAY_RIDER_CONFIG_upv_1.speedStart
    a1.runSeconds = 0
    a1.distance = DistanceScore_upv_1.new(HIGHWAY_RIDER_CONFIG_upv_1.studsPerPoint)
    a1.nearMissScore = 0
    a1.oncomingScore = 0
    a1.oncomingAccumulator = 0
    a1.oncomingBoundaryX = -math.huge
    a1.wheelieScore = 0
    a1.wheelieAccumulator = 0
    a1.lastReported = -1
    a1.belowFloorSeconds = 0
    a1.nextSpawnCheckS = 0
    a1.laneSpeeds = {}
    a1.densityWaveValues = {}
    a1.nearMissCombo = 0
    a1.bestNearMissCombo = 0
    a1.lastNearMissElapsed = -math.huge
    a1.nearMissWhooshIndex = 0
    a1.wheelieActive = false
    a1.wheeliePose = 0
    a1.wheelieComboSeconds = 0
    a1.wheelieGraceRemaining = 0
    a1.wheelieTierIndex = 0
    a1.wheelieCameraSide = 1
    a1.wheelieCameraSideTarget = 1
    a1.lastFlameQuantum = -1
    a1.lastMeterKey = ""
    a1.pressHeld = false
    a1.pressHeldSeconds = 0
    a1.lastSteering = highwayControlsAtom_upv_1().steering
    a1.crashClock = 0
    a1.wreckActive = false
    a1.wreckGrounded = false
    a1.wreckHeight = 0
    a1.wreckPrevHeight = 0
    a1.wreckVerticalVelocity = 0
    a1.wreckForwardSpeed = 0
    a1.wreckLateralVelocity = 0
    a1.wreckPitch = 0
    a1.wreckRoll = 0
    a1.wreckYaw = 0
    a1.wreckPrevPitch = 0
    a1.wreckPrevRoll = 0
    a1.wreckPrevYaw = 0
    a1.wreckAngularX = 0
    a1.wreckAngularY = 0
    a1.wreckAngularZ = 0
    a1.speedSignShown = false
    a1.smoothedCameraX = 0
    a1.currentRoll = 0
    a1.lookSpringX = 0
    a1.lookSpringVelocity = 0
    a1.bodyYaw = 0
    a1.closeCallCount = 0
    a1.orbitElapsed = HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds
    a1.appliedFieldOfView = 0
    a1.lastDisplaySpeed = -1
    a1.lastDistanceTenths = -1
    a1.buildings = {}
    a1.buildingRoofs = {}
    a1.medianLamps = {}
    a1.decorCars = {}
    a1.chunkTiles = {}
    a1.chunkSlotTiles = {}
    a1.chunkSlotBiome = {}
    a1.chunkSlotWrap = {}
    a1.chunkFarOrdinal = 4
    a1.chunkShownBiome = 0
    a1.tunnelFirstOrdinal = math.huge
    a1.tunnelTileCount = 0
    a1.tunnelExitBiome = 0
    a1.isInsideTunnel = false
    a1.chunkWorkBudget = 0
    a1.shownGrassBiome = -1
    a1.emergencyCars = {}
    a1.activeEmergencies = {}
    a1.flungThisStep = 0
    a1.yieldPassArmed = false
    a1.emergencyFlashPhase = 0
    a1.nextEventAt = math.huge
    a1.eventIndex = 0
    a1.previousEventIntensity = "low"
    a1.eventRolls = {}
    a1.laneBag = {}
    a1.dealtLanes = {}
    a1.glowLanes = {}
    a1.glowVisible = false
    a1.flungCount = 0
    a1.spawnFadeSuppressed = false
    a1.specialCars = {}
    a1.rampTutorialArmed = false
    a1.rampTutorialTaughtThisSession = false
    a1.oilLeakRemaining = 0
    a1.oilNextSlickS = 0
    a1.playerY = 0
    a1.playerVerticalVelocity = 0
    a1.renderPrevY = 0
    a1.airborne = false
    a1.onRamp = false
    a1.bounceRemaining = 0
    a1.airCamBlend = 0
    a1.airOrbitYaw = 0
    a1.airOrbitPitch = 0
    a1.landingDip = 0
    a1.landingDipClock = 0
    a1.airSpinAngle = 0
    a1.renderPrevAirSpin = 0
    a1.airSpinRate = 0
    a1.lastRenderY = 0
    a1.slipRemaining = 0
    a1.oilSlicks = {}
    a1.oilDroplets = {}
    a1.oilSprayCarry = 0
    a1.obstructions = {}
    a1.nextObstructionAt = math.huge
    a1.obstructionIndex = 0
    a1.blockedLanes = {}
    a1.anyLaneBlocked = false
    a1.nightRays = {}
    a1.nightMoonAuthoredBrightness = 0
    a1.nightSideOn = false
    a1.lastNightAlpha = -1
    a1.lastNightFadeStep = -1
    a1.seatLift = 0
    a1.cameraLift = 0
    a1.riderScale = 1
    a1.wheeliePivotZ = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.pivotZ
    a1.fpTrees = {}
    a1.fpBushes = {}
    a1.windStreaks = {}
    a1.streakTransparency = 1
    a1.invulnRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.trafficSeed = 1
    a1.trafficRandom = Random.new()
    local v17 = isUpdateLive_upv_1(((a3 ~= "fp") and "highway-rider-tp") or "highway-rider-fp")
    local tbl_10 = {}
    tbl_10.biomes = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.biomes.enabled)
    tbl_10.tunnel = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.tunnel.enabled)
    tbl_10.obstruction = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.obstruction.enabled)
    tbl_10.director = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.director.enabled)
    tbl_10.emergency = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.emergency.enabled)
    tbl_10.ramp = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.ramp.enabled)
    tbl_10.oil = v17 and (HIGHWAY_RIDER_CONFIG_upv_1.oil.enabled)
    tbl_10.newVehicles = v17
    a1.systems = tbl_10
    local _ = HIGHWAY_RIDER_CONFIG_upv_1.modes[a3]
    local v18
    if a4.forceWheelie ~= true then
        v18 = tbl_10
    else
        local v19 = table.clone(tbl_10)
        setmetatable(v19, nil)
        v19.canWheelie = true
        v18 = v19
    end
    a1.spec = v18
    local steerResponseSeconds_1 = a1.spec.steerResponseSeconds
    if steerResponseSeconds_1 == nil then
        steerResponseSeconds_1 = HIGHWAY_RIDER_CONFIG_upv_1.steerResponseSeconds
    end
    a1.steerResponseSeconds = steerResponseSeconds_1
    local keySteerEaseInSeconds_1 = a1.spec.keySteerEaseInSeconds
    if keySteerEaseInSeconds_1 == nil then
        keySteerEaseInSeconds_1 = HIGHWAY_RIDER_CONFIG_upv_1.keySteerEaseInSeconds
    end
    a1.keySteerEaseInSeconds = keySteerEaseInSeconds_1
    local v20 = a1.spec.keySteerBaseStrength
    if v20 == nil then
        v20 = 0
    end
    a1.keySteerBaseStrength = v20
    local collisionForgiveness_1 = a1.spec.collisionForgiveness
    if collisionForgiveness_1 == nil then
        collisionForgiveness_1 = HIGHWAY_RIDER_CONFIG_upv_1.collisionForgiveness
    end
    a1.collisionForgiveness = collisionForgiveness_1
    local laneCenters_1 = a1.spec.laneCenters
    local speedMax_1
    if #laneCenters_1 <= 1 then
        speedMax_1 = a1.spec.roadHalfWidth
    else
        speedMax_1 = math.abs(laneCenters_1[2] - laneCenters_1[1])
    end
    a1.laneSpacing = speedMax_1
    speedMax_1 = a1.spec.speedMax
    if speedMax_1 == nil then
        speedMax_1 = HIGHWAY_RIDER_CONFIG_upv_1.speedMax
    end
    a1.speedMax = speedMax_1
    a1.windMinSpeed = ((a3 ~= "tp") and 90) or (HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed + HIGHWAY_RIDER_CONFIG_upv_1.tpWind.bandStartFraction * (a1.speedMax - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed))
    a1.postCenterY = ((a3 ~= "fp") and 1.3) or 0.66
    local v21 = 0
    for v22, value_1 in a1.spec.speedClasses or {} do
        v21 = v21 + value_1.weight
    end
    a1.speedClassTotalWeight = v21
end
u31.buildScene = function(a1)
    --[[
      name: buildScene
      line: 773
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        HighwayRiderFpAssets_upv_1 (copy, index: 2)
        readLightingFolderProfile_upv_1 (copy, index: 3)
        tbl_upv_7 (copy, index: 4)
        HIGHWAY_FP_STAGE_LIGHTING_upv_1 (copy, index: 5)
        HighwayRiderTpAssets_upv_1 (copy, index: 6)
        makeFrontalBackdrop_upv_1 (copy, index: 7)
        u11 (copy, index: 8)
        makeSmoothPart_upv_1 (copy, index: 9)
        u7 (copy, index: 10)
        u6 (copy, index: 11)
        makeStagePart_upv_1 (copy, index: 12)
        u9 (copy, index: 13)
        u20 (copy, index: 14)
        u8 (copy, index: 15)
        u1 (copy, index: 16)
        u10 (copy, index: 17)
        CarRig_upv_1 (copy, index: 18)
        BikeRig_upv_1 (copy, index: 19)
        HighwayEngineAudio_upv_1 (copy, index: 20)
        createGameLoopSound_upv_1 (copy, index: 21)
        SOUND_IDS_upv_1 (copy, index: 22)
        HighwayRiderRig_upv_1 (copy, index: 23)
        subscribe_upv_1 (copy, index: 24)
        pausedAtom_upv_1 (copy, index: 25)
        gameFrozenAtom_upv_1 (copy, index: 26)
        wheelieMeterAtom_upv_1 (copy, index: 27)
        HighwayDayNightCycle_upv_1 (copy, index: 28)
        PopupTextPool_upv_1 (copy, index: 29)
        kitTouchInput_upv_1 (copy, index: 30)
    ]]
    local container_1 = a1.stage.container
    local origin_upv_1 = a1.stage.origin
    local spec_upv_1 = a1.spec
    a1.appliedFieldOfView = a1:cameraFieldOfView()
    a1.stage.camera.FieldOfView = a1.appliedFieldOfView
    if a1.mode == "fp" then
        local u32
        if HIGHWAY_RIDER_CONFIG_upv_1.useAuthoredFpWorld then
            u32 = HighwayRiderFpAssets_upv_1.new({newVehicles = a1.systems.newVehicles})
            if u32.available then
                a1.fpAssets = u32
                a1.context.janitor:Add(
                    function()
                        --[[
                          line: 787
                          upvalues:
                            u32 (copy, index: 1)
                        ]]
                        return u32:destroy()
                    end
                )
                if u32.lighting ~= nil then
                    a1.stage.setLighting(readLightingFolderProfile_upv_1(u32.lighting, tbl_upv_7, HIGHWAY_FP_STAGE_LIGHTING_upv_1))
                end
            end
        end
    end
    if a1.mode == "tp" then
        local u33
        if HIGHWAY_RIDER_CONFIG_upv_1.useAuthoredTpWorld then
            u33 = HighwayRiderTpAssets_upv_1.new({newVehicles = a1.systems.newVehicles})
            if u33.available then
                a1.tpAssets = u33
                a1.context.janitor:Add(
                    function()
                        --[[
                          line: 805
                          upvalues:
                            u33 (copy, index: 1)
                        ]]
                        return u33:destroy()
                    end
                )
                if u33.lighting ~= nil then
                    a1.stage.setLighting(readLightingFolderProfile_upv_1(u33.lighting, tbl_upv_7, HIGHWAY_FP_STAGE_LIGHTING_upv_1))
                end
            end
        end
    end
    local u32 = a1.fpAssets ~= nil
    local v22 = a1.tpAssets ~= nil
    local v23 = u32 or v22
    a1.frontalBackdrop = makeFrontalBackdrop_upv_1(a1.stage, u11)
    if a1.mode == "tp" then
        local v24 = makeSmoothPart_upv_1(container_1)
        v24.Material = Enum.Material.Neon
        v24.Color = u11
        v24.Size = Vector3.new(1400, 500, 1)
        v24.CFrame = CFrame.new(origin_upv_1 + Vector3.new(0, 120, (v22 and 760) or 380))
        a1.tpSkyWall = v24
    end
    local v25 = makeSmoothPart_upv_1(container_1)
    local v26, v27 = nil, nil
    if v23 then
        v26 = a1.fpAssets
        if v26 ~= nil then
            v26 = v26.grassColor
        end
        v27 = v26
        local v28 = nil
        if v27 == nil then
            v28 = a1.tpAssets
            if v28 ~= nil then
                v28 = v28.grassColor
            end
            v27 = v28
            if v27 == nil then
                v27 = u7
            end
        end
        v25.Color = v27
        v25.Size = Vector3.new(1200, 1, 720)
        v25.CFrame = CFrame.new(origin_upv_1 + Vector3.new(0, -1.100000023841858, 280))
        a1.shoulderPart = v25
    else
        v25.Color = u7
        v25.Size = Vector3.new(((a1.mode ~= "fp") and 140) or 1200, 1, 560)
        v25.CFrame = CFrame.new(origin_upv_1 + Vector3.new(0, -0.6200000047683716, 200))
    end
    if not (v23) then
        local v29 = makeSmoothPart_upv_1(container_1)
        v29.Color = u6
        v29.Size = Vector3.new((spec_upv_1.roadHalfWidth * 2) + 2, 1, 560)
        v29.CFrame = CFrame.new(origin_upv_1 + Vector3.new(0, -0.5, 200))
    end
    if a1.mode ~= "tp" then
        if not (u32) then
            local v30 = nil
            for _, value_2 in {-1, 1} do
                for v54, value_3 in {0.5, 1.02} do
                    v30 = makeSmoothPart_upv_1(container_1)
                    v30.Color = u20
                    v30.Size = Vector3.new(0.2199999988079071, 0.25999999046325684, 560)
                    v30.CFrame = CFrame.new(origin_upv_1 + Vector3.new(value_2 * (spec_upv_1.barrierX + 0.55), 0 + value_3, 200))
                end
            end
        end
    elseif not (v22) then
        local v31 = nil
        for _, value_4 in {-1, 1} do
            v31 = makeStagePart_upv_1(container_1)
            v31.Color = u9
            v31.Size = Vector3.new(1.600000023841858, 0.8999999761581421, 560)
            v31.CFrame = CFrame.new(origin_upv_1 + Vector3.new(value_4 * (spec_upv_1.barrierX + 0.8), 0.45, 200))
        end
    end
    if not (v23) then
        for n_1 = 1, #spec_upv_1.laneCenters - 1 do
            if a1.mode == "fp" and n_1 == spec_upv_1.oncomingLaneCount then
                continue
            end
            for spec_upv_1 = 0, 27 do
                local v32 = makeSmoothPart_upv_1(container_1)
                v32.Color = u8
                v32.Size = Vector3.new(0.3499999940395355, 0.10000000149011612, 3)
                v32.CFrame = u1
                v32:SetAttribute("laneX", (spec_upv_1.laneCenters[n_1] + spec_upv_1.laneCenters[n_1 + 1]) / 2)
                table.insert(a1.dashes, v32)
            end
        end
        local v33 = ((a1.mode ~= "fp") and Vector3.new(0.5, 2.5999999046325684, 0.5)) or Vector3.new(0.4000000059604645, 1.3200000524520874, 0.4000000059604645)
        local v34 = ((a1.mode ~= "fp") and (spec_upv_1.barrierX + 2.5)) or (spec_upv_1.barrierX + 0.85)
        for _, value_5 in {-1, 1} do
            for v55 = 0, 9 do
                local v35 = makeStagePart_upv_1(container_1)
                v35.Color = u10
                v35.Size = v33
                v35.CFrame = u1
                v35:SetAttribute("sideX", value_5 * v34)
                table.insert(a1.posts, v35)
            end
        end
    end
    v26 = a1.fpAssets or (a1.tpAssets)
    for v36 = 0, HIGHWAY_RIDER_CONFIG_upv_1.carPoolSize - 1 do
        if v26 == nil then
            local v37
            v37 = v26
        else
            local v37
            v37 = v26:makeCarVisual(container_1, v36)
        end
        local v38 = a1:makeTrafficCar(container_1, v37)
        table.insert(a1.cars, v38)
        a1:parkCar(v38)
    end
    if a1.systems.emergency and v26 ~= nil then
        local v39 = 0
        for _, value_6 in v26:emergencyKinds() do
            for v56 = 0, (HIGHWAY_RIDER_CONFIG_upv_1.emergency.slotsPerKind[value_6] or 1) - 1 do
                local v40
                v40 = v26:makeEmergencyVisual(container_1, value_6, v39)
                if v40 ~= nil then
                    local v41 = a1:makeTrafficCar(container_1, v40)
                    v41.slotIndex = v39
                    table.insert(a1.cars, v41)
                    table.insert(a1.emergencyCars, v41)
                    a1:parkCar(v41)
                    v39 = v39 + 1
                end
            end
        end
    end
    if v26 ~= nil then
        for _, value_7 in v26:specialKinds() do
            if value_7 ~= "ramp" or a1.systems.ramp then
                if value_7 == "oil" then
                    local v42
                    if not (a1.systems.oil) then
                        continue
                    end
                end
                local v42
                v42 = v26:makeSpecialVisual(container_1, value_7)
                if v42 ~= nil then
                    local v43 = a1:makeTrafficCar(container_1, v42)
                    table.insert(a1.cars, v43)
                    table.insert(a1.specialCars, v43)
                    a1:parkCar(v43)
                end
            end
        end
    end
    if a1.systems.obstruction then
        a1:buildObstructions(container_1)
    end
    if a1.systems.oil then
        a1:buildOilSlicks(container_1)
    end
    if a1.systems.emergency and HIGHWAY_RIDER_CONFIG_upv_1.emergency.laneGlow.enabled then
        a1:buildEmergencyGlow(container_1)
    end
    if a1.systems.ramp then
        a1:buildLandingDust(container_1)
    end
    local v44
    if a1.mode ~= "fp" then
        v44 = nil
    else
        v44 = a1.fpAssets
        local v45
        if v44 == nil then
            v45 = v44
        else
            v45 = v44:makeBike(container_1)
        end
        v44 = v45
    end
    if v27 ~= nil then
        a1.seatLift = v27.riderLift
        a1.cameraLift = v27.cameraLift
        a1.riderScale = v27.riderScale
        a1.wheeliePivotZ = v27.wheeliePivotZ
    end
    local v36, v46 = nil, nil
    if a1.mode ~= "tp" then
        local v37
        v37 = v27 or BikeRig_upv_1.new(container_1)
        v36 = v37
    else
        v46 = a1.tpAssets
        local v37
        if v46 == nil then
            v37 = v46
        else
            v37 = v46:makePlayerCar(container_1)
        end
        local v31
        if v37 ~= nil then
            v31 = v37
        else
            v31 = CarRig_upv_1.new(container_1)
        end
        v36 = v31
    end
    a1.vehicle = v36
    a1.engineAudio = HighwayEngineAudio_upv_1.new(container_1, a1.context.janitor, a1.mode, a1.context.audio)
    if a1.mode ~= "tp" then
        a1:buildFpDressing(container_1, origin_upv_1)
        if a1.fpAssets ~= nil then
            a1:buildAuthoredWorld(a1.fpAssets, container_1, origin_upv_1)
        end
        a1.rider = HighwayRiderRig_upv_1.new(container_1, a1.context.janitor, {seatLift = a1.seatLift, rigScale = a1.riderScale, useDefaultRider = a1.variant.useDefaultRider})
        a1.context.janitor:Add(
            subscribe_upv_1(
                pausedAtom_upv_1,
                function()
                    --[[
                      line: 1073
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
                      line: 1076
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:applyRiderHalt()
                end
            ),
            true
        )
        if spec_upv_1.canWheelie then
            a1:buildWheelieFlame(container_1)
        end
        a1.context.janitor:Add(
            function()
                --[[
                  line: 1086
                  upvalues:
                    wheelieMeterAtom_upv_1 (copy, index: 1)
                ]]
                return wheelieMeterAtom_upv_1(nil)
            end
        )
    else
        a1:buildDressing(container_1, origin_upv_1)
        if a1.tpAssets ~= nil then
            a1:buildAuthoredWorld(a1.tpAssets, container_1, origin_upv_1)
        end
        a1:buildSpeedLabels(container_1)
        a1:buildWindStreaks(container_1)
        local v47 = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.whoosh, parent = container_1, playbackSpeed = HIGHWAY_RIDER_CONFIG_upv_1.tpWind.pitchBase})
        a1.windSound = v47
        a1.context.janitor:Add(v47)
    end
    local v47 = a1.fpAssets or (a1.tpAssets)
    local v48
    if v47 == nil then
        v48 = v47
    else
        v48 = v47.nightLighting
    end
    local v49 = nil
    local v52 = nil
    if v48 ~= nil then
        v52 = HighwayDayNightCycle_upv_1.new(v47.nightLighting, tbl_upv_7)
        a1.nightCycle = v52
        a1.context.janitor:Add(
            function()
                --[[
                  line: 1101
                ]]
                return u34:destroy()
            end
        )
        for n_2 = 0, #a1.chunkTiles - 1 do
            local v50
            v50 = v47:makeNightRays(container_1)
            if v50 == nil then
                break
            else
                v50.tile:poseAt(origin_upv_1, 0, (n_2 * 150) - 80)
                table.insert(a1.nightRays, v50)
            end
        end
        a1.nightMoonLight = v47:placeNightLight(container_1, origin_upv_1, 0, 280, 720)
        v49 = a1.nightMoonLight
        if v49 ~= nil then
            local _ = v49.Brightness
        end
        local v51
        if v49 ~= nil then
            v51 = v49
        else
            v51 = 0
        end
        a1.nightMoonAuthoredBrightness = v51
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 4)
    a1:buildSpeedSign(container_1)
    if spec_upv_1.oncomingLaneCount <= 0 or spec_upv_1.oncomingLaneCount >= #spec_upv_1.laneCenters then
        v52 = -math.huge
    else
        v52 = (spec_upv_1.laneCenters[spec_upv_1.oncomingLaneCount] + spec_upv_1.laneCenters[spec_upv_1.oncomingLaneCount + 1]) / 2
    end
    a1.oncomingBoundaryX = v52
    if spec_upv_1.canWheelie then
        local v53 = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.whoosh, parent = container_1, playbackSpeed = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.enginePitchBase})
        a1.engineSound = v53
        a1.context.janitor:Add(v53)
    end
    a1.context.janitor:Add(
        kitTouchInput_upv_1.onPress:Connect(
            function()
                --[[
                  line: 1147
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1.context.requestStart()
            end
        ),
        "Disconnect"
    )
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 1151
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.pressHeld = true
                a1.pressHeldSeconds = 0
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function()
                --[[
                  line: 1155
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.pressHeld = false
                a1.pressHeldSeconds = 0
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.drag:Connect(
            function(a2)
                --[[
                  line: 1162
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:addAirOrbit(a2.X, a2.Y)
            end
        )
    )
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_11 = {}
        tbl_11.scoreToStuds = function(a3)
            --[[
              name: scoreToStuds
              line: 1172
              upvalues:
                HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a3 * HIGHWAY_RIDER_CONFIG_upv_1.studsPerPoint
        end
        tbl_11.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 1175
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.playerS
        end
        tbl_11.poseMarker = function(a4)
            --[[
              name: poseMarker
              line: 1178
              upvalues:
                a1 (copy, index: 1)
                origin_upv_1 (copy, index: 2)
                spec_upv_1 (copy, index: 3)
            ]]
            local v54 = a4 - a1.playerS
            if v54 <= 380 and v54 >= -30 then
                return CFrame.new((origin_upv_1.X + spec_upv_1.barrierX) + 2, (origin_upv_1.Y + 0) + 4.2, origin_upv_1.Z + v54)
            end
            return nil
        end
        registerRivalMarkers_1(tbl_11)
    end
end
u31.buildSpeedSign = function(a1, a2)
    --[[
      name: buildSpeedSign
      line: 1196
      upvalues:
        u1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    local v55 = Instance.new("Part")
    v55.Anchored = true
    v55.CanCollide = false
    v55.CanQuery = false
    v55.CanTouch = false
    v55.Transparency = 1
    v55.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v55.CFrame = u1
    v55.Parent = a2
    local v56 = Instance.new("BillboardGui")
    v56.Size = UDim2.fromScale(9, 2)
    v56.AlwaysOnTop = true
    v56.LightInfluence = 0
    v56.Parent = v55
    local v57 = Instance.new("TextLabel")
    v57.BackgroundTransparency = 1
    v57.Size = UDim2.fromScale(1, 1)
    v57.Font = Enum.Font.GothamBlack
    v57.TextScaled = true
    v57.Text = "SPEED UP!"
    v57.TextColor3 = u14
    v57.TextTransparency = 1
    v57.TextStrokeTransparency = 1
    v57.Parent = v56
    a1.speedSignPart = v55
    a1.speedSignLabel = v57
end
u31.buildDressing = function(a1, a2, a3)
    --[[
      name: buildDressing
      line: 1224
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        u6 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        tbl_upv_4 (copy, index: 6)
        u30 (copy, index: 7)
        u28 (copy, index: 8)
        u29 (copy, index: 9)
    ]]
    local v58 = a1.tpAssets ~= nil
    if not (v58) then
        local v59 = makeSmoothPart_upv_1(a2)
        v59.Color = u7
        v59.Size = Vector3.new(4.5, 1, 560)
        v59.CFrame = CFrame.new(a3 + Vector3.new(20.950000762939453, -0.550000011920929, 200))
        local v60 = makeSmoothPart_upv_1(a2)
        v60.Color = u6
        v60.Size = Vector3.new(24, 1, 560)
        v60.CFrame = CFrame.new(a3 + Vector3.new(35.20000076293945, -0.5, 200))
    end
    local v61 = nil
    for n_3 = 0, 7 do
        local v62 = makeStagePart_upv_1(a2)
        v62.Size = Vector3.new(4.199999809265137, 2, 8)
        v62.CFrame = u1
        local v63 = makeSmoothPart_upv_1(a2)
        v63.Material = Enum.Material.Neon
        v63.Color = Color3.fromRGB(255, 240, 180)
        v63.Size = Vector3.new(3.4000000953674316, 0.4000000059604645, 0.20000000298023224)
        v63.CFrame = u1
        v61 = a1.tpAssets
        if v61 ~= nil then
            v61 = v61:makeCarVisual(a2, n_3)
        end
        table.insert(a1.decorCars, {body = v62, light = v63, visual = v61})
    end
    if v58 then
        return nil
    end
    for key_1, value_8 in {-1, 1} do
        for _ = 0, 4 do
            local v64
            v64 = makeStagePart_upv_1(a2)
            local v65 = 24 + a1.random:NextNumber(0, 16)
            local v66 = 16 + a1.random:NextNumber(0, 40)
            local v67 = 24 + a1.random:NextNumber(0, 16)
            v64.Size = Vector3.new(v65, v66, v67)
            v64.Color = tbl_upv_4[a1.random:NextInteger(0, #tbl_upv_4 - 1) + 1]
            v64.CFrame = u1
            if value_8 ~= 1 or value_8 == 1 then
                v64:SetAttribute("sideX", -31)
                v64:SetAttribute("halfHeight", v66 / 2)
                table.insert(a1.buildings, v64)
                local v68 = makeSmoothPart_upv_1(a2)
                v68.Color = v64.Color:Lerp(u30, 0.45)
                v68.Size = Vector3.new(v65 - 2.5, 0.8, v67 - 2.5)
                v68.CFrame = u1
                table.insert(a1.buildingRoofs, v68)
            end
        end
    end
    for n_4 = 0, 5 do
        local key_1 = makeSmoothPart_upv_1(a2)
        key_1.Color = u28
        key_1.Size = Vector3.new(0.3499999940395355, 7.599999904632568, 0.3499999940395355)
        key_1.CFrame = u1
        local value_8 = makeSmoothPart_upv_1(a2)
        value_8.Color = u28
        value_8.Size = Vector3.new(3.5999999046325684, 0.2800000011920929, 0.2800000011920929)
        value_8.CFrame = u1
        local v69 = makeSmoothPart_upv_1(a2)
        v69.Material = Enum.Material.Neon
        v69.Color = u29
        v69.Size = Vector3.new(1.100000023841858, 0.23999999463558197, 0.550000011920929)
        v69.CFrame = u1
        table.insert(a1.medianLamps, {pole = key_1, arm = value_8, head = v69, cycle = n_4 * 70})
    end
end
u31.buildFpDressing = function(a1, a2, a3)
    --[[
      name: buildFpDressing
      line: 1322
    ]]
    if a1.fpAssets == nil then
        a1:buildFpProceduralDressing(a2, a3)
    end
    a1:buildWindStreaks(a2)
end
u31.buildWindStreaks = function(a1, a2)
    --[[
      name: buildWindStreaks
      line: 1330
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u26 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v70 = a1.mode == "tp"
    for n_5 = 0, 11 do
        local v71 = makeSmoothPart_upv_1(a2)
        v71.Material = Enum.Material.Neon
        v71.Color = u26
        v71.Transparency = 1
        v71.Size = (v70 and Vector3.new(0.14000000059604645, 0.14000000059604645, 13)) or Vector3.new(0.09000000357627869, 0.09000000357627869, 9)
        v71.CFrame = u1
        local v72 = ((n_5 % 2 ~= 0) and 1) or -1
        local windStreaks_1 = a1.windStreaks
        local tbl_12 = {}
        tbl_12.part = v71
        local v73
        if v70 then
            v73 = a1.random:NextNumber(3, 15)
        else
            v73 = a1.random:NextNumber(4, 11)
        end
        tbl_12.x = v72 * v73
        tbl_12.y = v70 and 1.6 + a1.random:NextNumber(0, 7) or 1.2 + a1.random:NextNumber(0, 3.6)
        tbl_12.cycle = (n_5 * 15) + a1.random:NextNumber(0, 8)
        table.insert(windStreaks_1, tbl_12)
    end
end
u31.buildFpProceduralDressing = function(a1, a2, a3)
    --[[
      name: buildFpProceduralDressing
      line: 1350
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
        u18 (copy, index: 3)
        u19 (copy, index: 4)
        u25 (copy, index: 5)
        makeWedgePart_upv_1 (copy, index: 6)
        u24 (copy, index: 7)
        u23 (copy, index: 8)
        u21 (copy, index: 9)
        u1 (copy, index: 10)
        makeStagePart_upv_1 (copy, index: 11)
        tbl_upv_5 (copy, index: 12)
        u22 (copy, index: 13)
    ]]
    local spec_2 = a1.spec
    local v75 = nil
    for _, value_9 in {-1, 1} do
        v75 = makeSmoothPart_upv_1(a2)
        v75.Color = u17
        v75.Size = Vector3.new(0.30000001192092896, 0.07999999821186066, 560)
        v75.CFrame = CFrame.new(a3 + Vector3.new(value_9 * (spec_2.roadHalfWidth - 0.7), 0.06, 200))
    end
    local v76 = (spec_2.laneCenters[spec_2.oncomingLaneCount] + spec_2.laneCenters[spec_2.oncomingLaneCount + 1]) / 2
    local v77 = nil
    for _, value_10 in {-1, 1} do
        v77 = makeSmoothPart_upv_1(a2)
        v77.Color = u18
        v77.Size = Vector3.new(0.2800000011920929, 0.07999999821186066, 560)
        v77.CFrame = CFrame.new(a3 + Vector3.new(v76 + (value_10 * 0.35), 0.06, 200))
    end
    local v78 = makeSmoothPart_upv_1(a2)
    v78.Color = u19
    v78.Size = Vector3.new(spec_2.roadHalfWidth + v76, 0.04, 560)
    v78.CFrame = CFrame.new(a3 + Vector3.new((v76 - spec_2.roadHalfWidth) / 2, 0.005, 200))
    local v79 = makeSmoothPart_upv_1(a2)
    v79.Color = u25
    v79.Size = Vector3.new(1150, 16, 6)
    v79.CFrame = CFrame.new(a3 + Vector3.new(0, 7, 476))
    local v80 = nil
    for n_6 = 0, 5 do
        local v81 = n_6 >= 3
        local v82 = ((n_6 % 3) * 340) + -340 + a1.random:NextNumber(-70, 70)
        if v81 then
            local _ = 170
        else
            v80 = 0
        end
        if v81 then
            v82 = a1.random:NextNumber(40, 64)
        else
            v82 = a1.random:NextNumber(24, 44)
        end
        v80 = a1.random:NextNumber(45, 75)
        local v83 = nil
        local v84 = nil
        for _, value_11 in {-1, 1} do
            v84 = makeWedgePart_upv_1(a2)
            if v81 then
                v83 = u24
            else
                v83 = u23
            end
            v84.Color = v83
            local v85 = nil
            v84.Size = Vector3.new(8, v85, v80)
            local v86 = nil
            v84.CFrame = CFrame.new(a3 + Vector3.new(v82 + v80 + ((value_11 * v86) / 2), (0 + (v85 / 2)) - 1.5, (v81 and 468) or 452)) * CFrame.Angles(0, (-value_11 * math.pi) / 2, 0)
        end
    end
    for _, value_12 in {-1, 1} do
        for n_7 = 0, 6 do
            local v87 = a1.random:NextNumber(3, 4.6)
            local v88 = a1.random:NextNumber(4.5, 7)
            local v89 = makeSmoothPart_upv_1(a2)
            v89.Color = u21
            v89.CastShadow = true
            v89.Size = Vector3.new(1.1, v87, 1.1)
            v89.CFrame = u1
            local v90 = makeStagePart_upv_1(a2)
            v90.Color = tbl_upv_5[a1.random:NextInteger(0, #tbl_upv_5 - 1) + 1]
            v90.CastShadow = true
            v90.Size = Vector3.new(v88, v88, v88)
            v90.CFrame = u1
            table.insert(a1.fpTrees, {trunk = v89, canopy = v90, x = value_12 * ((spec_2.barrierX + 9) + a1.random:NextNumber(0, 14)), cycle = (n_7 * 60) + a1.random:NextNumber(0, 26), trunkHeight = v87, canopyHalf = v88 / 2})
        end
        for n_8 = 0, 7 do
            local v91 = a1.random:NextNumber(1.4, 2.2)
            local v92 = makeStagePart_upv_1(a2)
            v92.Color = u22
            v92.Size = Vector3.new(v91, v91, v91)
            v92.CFrame = u1
            table.insert(a1.fpBushes, {part = v92, x = value_12 * ((spec_2.barrierX + 3.2) + a1.random:NextNumber(0, 2.5)), cycle = (n_8 * 47) + a1.random:NextNumber(0, 18), half = v91 / 2})
        end
    end
end
u31.makeTrafficCar = function(a1, a2, a3)
    --[[
      name: makeTrafficCar
      line: 1445
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u27 (copy, index: 3)
    ]]
    local v93 = makeStagePart_upv_1(a2)
    v93.Size = Vector3.new(4.199999809265137, 2, 8)
    v93.CastShadow = true
    local v94 = makeStagePart_upv_1(a2)
    v94.Size = Vector3.new(3.200000047683716, 1.399999976158142, 3.5999999046325684)
    v94.CastShadow = true
    local v95 = makeSmoothPart_upv_1(a2)
    v95.Material = Enum.Material.Neon
    v95.Color = Color3.fromRGB(255, 240, 180)
    v95.Size = Vector3.new(3.4000000953674316, 0.4000000059604645, 0.20000000298023224)
    local v96 = makeSmoothPart_upv_1(a2)
    v96.Color = u27
    v96.Size = Vector3.new(4.400000095367432, 0.8999999761581421, 1.2999999523162842)
    local v97 = makeSmoothPart_upv_1(a2)
    v97.Color = u27
    v97.Size = Vector3.new(4.400000095367432, 0.8999999761581421, 1.2999999523162842)
    local tbl_13 = {}
    tbl_13.body = v93
    tbl_13.cabin = v94
    tbl_13.headlight = v95
    tbl_13.axleFront = v96
    tbl_13.axleRear = v97
    tbl_13.visual = a3
    local v98
    if a3 == nil then
        v98 = a3
    else
        v98 = a3.halfLength
    end
    local v99
    if v98 ~= nil then
        v99 = v98
    else
        v99 = 4
    end
    tbl_13.halfLength = v99
    local v100
    if a3 == nil then
        v100 = a3
    else
        v100 = a3.halfWidth
    end
    local v101
    if v100 ~= nil then
        v101 = v100
    else
        v101 = 2.1
    end
    tbl_13.halfWidth = v101
    tbl_13.s = 0
    tbl_13.renderPrevS = 0
    tbl_13.x = 0
    tbl_13.targetX = 0
    tbl_13.restX = 0
    tbl_13.speed = 0
    tbl_13.laneIndex = 0
    tbl_13.active = false
    tbl_13.overlapping = false
    tbl_13.minGap = math.huge
    tbl_13.nearMissAwarded = false
    tbl_13.flung = false
    tbl_13.flungSeconds = 0
    tbl_13.flungHeight = 0
    tbl_13.renderPrevFlungHeight = 0
    tbl_13.flungVerticalVelocity = 0
    tbl_13.flungLateralVelocity = 0
    tbl_13.flungPitch = 0
    tbl_13.flungYaw = 0
    tbl_13.flungRoll = 0
    tbl_13.renderPrevFlungPitch = 0
    tbl_13.renderPrevFlungYaw = 0
    tbl_13.renderPrevFlungRoll = 0
    tbl_13.flungAngularX = 0
    tbl_13.flungAngularY = 0
    tbl_13.flungAngularZ = 0
    tbl_13.flungGrounded = false
    tbl_13.ageSeconds = math.huge
    tbl_13.slotIndex = 0
    tbl_13.glowSlot = -1
    return tbl_13
end
u31.resetFling = function(a1, a2)
    --[[
      name: resetFling
      line: 1523
    ]]
    a2.flungSeconds = 0
    a2.flungHeight = 0
    a2.renderPrevFlungHeight = 0
    a2.flungVerticalVelocity = 0
    a2.flungLateralVelocity = 0
    a2.flungPitch = 0
    a2.flungYaw = 0
    a2.flungRoll = 0
    a2.renderPrevFlungPitch = 0
    a2.renderPrevFlungYaw = 0
    a2.renderPrevFlungRoll = 0
    a2.flungAngularX = 0
    a2.flungAngularY = 0
    a2.flungAngularZ = 0
    a2.flungGrounded = false
end
u31.buildAuthoredWorld = function(a1, a2, a3, a4)
    --[[
      name: buildAuthoredWorld
      line: 1540
    ]]
    a1.worldKit = a2
    for n_9 = 0, 4 do
        local v102
        v102 = a2:makeChunkTile(a3, 0)
        if v102 == nil then
            break
        else
            v102:poseAt(a4, 0, (n_9 * 150) - 80)
            table.insert(a1.chunkTiles, v102)
            table.insert(a1.chunkSlotTiles, {[0] = v102})
            table.insert(a1.chunkSlotBiome, 0)
            table.insert(a1.chunkSlotWrap, -math.floor(((n_9 * 150) - 0) / 750))
        end
    end
    a1.tunnelRungBase = a2:tunnelRungBase()
    a2:placeMountains(a3, a4, 0, 445)
    a1:mountBiomeDebug(a2)
end
u31.activeBiomeIndex = function(a1)
    --[[
      name: activeBiomeIndex
      line: 1567
    ]]
    local worldKit_1 = a1.worldKit
    if worldKit_1 ~= nil then
        worldKit_1 = worldKit_1:biomeCount()
    end
    local v103
    if worldKit_1 ~= nil then
        v103 = worldKit_1
    else
        v103 = 1
    end
    local v104 = nil
    if v103 > 1 then
        v104 = a1.biomeOverride
        if v104 == nil then
            v104 = a1:biomeOrdinal()
        end
        return v104 % v103
    end
    return 0
end
u31.photoVariants = function(a1)
    --[[
      name: photoVariants
      line: 1586
      upvalues:
        biomeDisplayName_upv_1 (copy, index: 1)
        B_upv_1 (copy, index: 2)
        N_upv_1 (copy, index: 3)
    ]]
    local tbl_14 = {}
    local worldKit_2 = a1.worldKit
    if worldKit_2 ~= nil and a1.systems.biomes and worldKit_2:biomeCount() > 1 then
        local tbl_15 = {}
        local v105 = 0
        local getShownIndex_1 = false
        getShownIndex_1, v105 = getShownIndex_1, v105
        while true do
            if getShownIndex_1 then
                v105 = v105 + 1
            else
                getShownIndex_1 = true
            end
            if v105 >= worldKit_2:biomeCount() then
                break
            end
            table.insert(tbl_15, (biomeDisplayName_upv_1(worldKit_2:biomeName(v105))))
        end
        local function setPinnedIndex_1(a2)
            --[[
              name: setPinnedIndex
              line: 1620
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.biomeOverride = a2
            a1:resyncChunkBiomes()
        end
        getShownIndex_1 = function()
            --[[
              name: getShownIndex
              line: 1617
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:activeBiomeIndex()
        end
        table.insert(tbl_14, {hotkey = B_upv_1, labels = tbl_15, getShownIndex = getShownIndex_1, setPinnedIndex = setPinnedIndex_1})
    end
    local nightCycle_upv_1 = a1.nightCycle
    if nightCycle_upv_1 ~= nil then
        local function setPinnedIndex_2(a3)
            --[[
              name: setPinnedIndex
              line: 1643
              upvalues:
                a1 (copy, index: 1)
            ]]
            local v106
            if a3 ~= nil then
                v106 = ((a3 < 1) and 0) or 1
            else
                v106 = nil
            end
            a1.nightAlphaOverride = v106
            a1:updateNight()
        end
        local function getShownIndex_2()
            --[[
              name: getShownIndex
              line: 1636
              upvalues:
                a1 (copy, index: 1)
                nightCycle_upv_1 (copy, index: 2)
            ]]
            local v107 = a1.nightAlphaOverride
            if v107 == nil then
                v107 = nightCycle_upv_1:alphaAt(a1.elapsed)
            end
            if v107 < 0.5 then
                return 0
            end
            return 1
        end
        table.insert(tbl_14, {hotkey = N_upv_1, labels = {"DAY", "NIGHT"}, getShownIndex = getShownIndex_2, setPinnedIndex = setPinnedIndex_2})
    end
    return tbl_14
end
u31.chunkRungForOrdinal = function(a1, a2)
    --[[
      name: chunkRungForOrdinal
      line: 1656
    ]]
    local tunnelFirstOrdinal_1 = a1.tunnelFirstOrdinal
    local v108 = nil
    if a2 >= tunnelFirstOrdinal_1 then
        v108 = a2 - tunnelFirstOrdinal_1
        local v109 = nil
        if a1.tunnelTileCount > v108 then
            v109 = a1.tunnelRungBase
            if v109 == nil then
                v109 = 0
            end
            if v108 ~= 0 then
                if v108 ~= a1.tunnelTileCount - 1 then
                    return v109 + 1
                end
                return v109 + 2
            end
            return v109
        end
        return a1.tunnelExitBiome
    end
    return a1.chunkShownBiome
end
u31.latchTunnel = function(a1, a2, a3)
    --[[
      name: latchTunnel
      line: 1678
    ]]
    if a1.tunnelRungBase ~= nil then
        a1.tunnelFirstOrdinal = a1.chunkFarOrdinal + 1
        a1.tunnelTileCount = a2
        a1.tunnelExitBiome = a3
    else
        return nil
    end
end
u31.drawTunnelTileCount = function(a1, a2)
    --[[
      name: drawTunnelTileCount
      line: 1686
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tunnel_1 = HIGHWAY_RIDER_CONFIG_upv_1.tunnel
    local v110 = tunnel_1.modularMax - tunnel_1.modularMin + 1
    return (2 + tunnel_1.modularMin) + math.min(math.floor(a2 * v110), v110 - 1)
end
u31.updateTunnelSequencer = function(a1)
    --[[
      name: updateTunnelSequencer
      line: 1691
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
    ]]
    if a1.tunnelRungBase ~= nil and a1.systems.tunnel then
        local v111 = nil
        if a1.tunnelTileCount <= 0 then
            v111 = a1:activeBiomeIndex()
            if v111 ~= a1.chunkShownBiome and a1.activeRamp == nil and not (a1.onRamp) and not (a1.airborne) then
                a1:latchTunnel(a1:drawTunnelTileCount(deriveRandom_upv_1(a1.context.getRunSeed(), 31249 + a1:biomeOrdinal()):NextNumber()), v111)
                return
            end
        elseif (a1.tunnelFirstOrdinal + a1.tunnelTileCount) - 1 < a1.chunkFarOrdinal - 4 then
            a1.chunkShownBiome = a1.tunnelExitBiome
            a1.tunnelFirstOrdinal = math.huge
            a1.tunnelTileCount = 0
        end
        return nil
    end
    return nil
end
u31.tunnelHoldsRoad = function(a1)
    --[[
      name: tunnelHoldsRoad
      line: 1720
    ]]
    if a1.tunnelRungBase ~= nil and a1.systems.tunnel then
        local v112 = true
        if a1.tunnelTileCount <= 0 then
            v112 = a1:activeBiomeIndex() ~= a1.chunkShownBiome
        end
        return v112
    end
    return false
end
u31.applyChunkBiome = function(a1, a2, a3)
    --[[
      name: applyChunkBiome
      line: 1726
    ]]
    local v113 = nil
    if a1.chunkSlotBiome[a2 + 1] ~= a3 then
        local v114 = a1.chunkSlotTiles[a2 + 1]
        v113 = v114[a3]
        if v113 == nil then
            local v115 = nil
            if a1.chunkWorkBudget > 0 then
                a1.chunkWorkBudget = a1.chunkWorkBudget - 1
                v115 = a1.worldKit
                if v115 ~= nil then
                    v115 = v115:makeChunkTile(a1.stage.container, a3)
                end
                if v115 ~= nil then
                    v114[a3] = v115
                    v113 = v115
                else
                    return true
                end
            else
                return false
            end
        end
        a1.chunkTiles[a2 + 1]:park()
        a1.chunkTiles[a2 + 1] = v113
        a1.chunkSlotBiome[a2 + 1] = a3
    end
    return true
end
u31.resyncChunkBiomes = function(a1)
    --[[
      name: resyncChunkBiomes
      line: 1756
    ]]
    if #a1.chunkTiles ~= 0 then
        local v116 = a1:activeBiomeIndex()
        local origin_2 = a1.stage.origin
        a1.chunkWorkBudget = 10
        a1.tunnelFirstOrdinal = math.huge
        a1.tunnelTileCount = 0
        a1.chunkShownBiome = v116
        a1.tunnelExitBiome = v116
        a1.isInsideTunnel = false
        a1.nightHoldElapsed = nil
        local v117 = -math.huge
        v117 = v117
        for n_10 = 0, #a1.chunkTiles - 1 do
            a1:applyChunkBiome(n_10, v116)
            a1.chunkSlotWrap[n_10 + 1] = -math.floor(((n_10 * 150) - a1.playerS) / 750)
            local v118
            v118 = n_10 + 5 * -math.floor(((n_10 * 150) - a1.playerS) / 750)
            if v117 < v118 then
                v117 = v118
            end
            a1.chunkTiles[n_10 + 1]:poseAt(origin_2, 0, (((((n_10 * 150) - a1.playerS) % 750) + 750) % 750) - 80)
        end
        a1.chunkFarOrdinal = v117
        a1.shownGrassBiome = -1
        a1:updateShoulderTint(v116)
    else
        return nil
    end
end
u31.updateShoulderTint = function(a1, a2)
    --[[
      name: updateShoulderTint
      line: 1794
    ]]
    if a2 >= 0 then
        local v119 = nil
        if a2 ~= a1.shownGrassBiome then
            a1.shownGrassBiome = a2
            local shoulderPart_1 = a1.shoulderPart
            v119 = a1.worldKit
            if v119 ~= nil then
                v119 = v119:biomeGrassColor(a2)
            end
            if shoulderPart_1 ~= nil and v119 ~= nil then
                shoulderPart_1.Color = v119
                return
            end
            return nil
        end
    end
    return nil
end
u31.resetEmergency = function(a1)
    --[[
      name: resetEmergency
      line: 1810
    ]]
    local v120 = nil
    for _, value_13 in a1.activeEmergencies do
        v120 = value_13.visual
        if v120 ~= nil then
            v120:stopSiren()
        end
        value_13.glowSlot = -1
    end
    table.clear(a1.activeEmergencies)
    a1.yieldPassArmed = false
    a1:parkEmergencyGlow()
    for _, value_14 in a1.cars do
        if not (value_14.flung) then
            value_14.targetX = value_14.restX
        end
    end
end
u31.resetSpecials = function(a1)
    --[[
      name: resetSpecials
      line: 1830
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.activeRamp = nil
    a1.activeOil = nil
    a1.oilLeakRemaining = 0
    a1.oilSprayCarry = 0
    a1.playerY = 0
    a1.renderPrevY = 0
    a1.playerVerticalVelocity = 0
    a1.airborne = false
    a1.onRamp = false
    a1.bounceRemaining = 0
    a1.airCamBlend = 0
    local rider_1 = a1.rider
    if rider_1 ~= nil then
        rider_1:setClip("drive")
    end
    a1.airSpinAngle = 0
    a1.renderPrevAirSpin = 0
    a1.airSpinRate = 0
    a1.landingDip = 0
    a1.landingDipClock = 0
    a1.lastRenderY = 0
    a1.slipRemaining = 0
    for _, value_15 in a1.oilSlicks do
        value_15.active = false
        value_15.part.CFrame = u1
    end
    for _, value_16 in a1.oilDroplets do
        value_16.life = 0
        value_16.part.CFrame = u1
    end
    a1.rampTutorialArmed = a1:shouldTeachRamp()
end
u31.shouldTeachRamp = function(a1)
    --[[
      name: shouldTeachRamp
      line: 1868
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    local v121 = a1:rampTeachDeclineReason()
    if v121 ~= nil and RunService_upv_1:IsStudio() then
        warn((("[HighwayRider] not teaching the ramp this round \226\128\148 %*"):format(v121)))
    end
    return v121 == nil
end
u31.rampTeachDeclineReason = function(a1)
    --[[
      name: rampTeachDeclineReason
      line: 1877
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        readLocalProfile_upv_1 (copy, index: 2)
    ]]
    local v122 = nil
    if a1.systems.ramp then
        v122 = sessionAtom_upv_1()
        if v122 ~= nil then
            if v122.mode ~= "match" then
                if v122.mode ~= "daily" then
                    local v123
                    if a1.rampTutorialTaughtThisSession then
                        return "already taught earlier this session"
                    end
                    v123 = readLocalProfile_upv_1()
                    if v123 ~= nil then
                        if table.find(v123.tutorialsSeen, v122.gameId) == nil then
                            return nil
                        end
                        return (("already recorded in tutorialsSeen for %*"):format(v122.gameId))
                    end
                    return "player profile has not replicated yet"
                end
                return "Game of the Day \226\128\148 one seed defines one board for everybody"
            end
            return "duel/royale \226\128\148 the opponent would never get the same launch"
        end
        return "no active session"
    end
    return "the ramp mechanic is disabled in CONFIG"
end
u31.updateEmergencies = function(a1, a2)
    --[[
      name: updateEmergencies
      line: 1913
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_11 = #a1.activeEmergencies - 1, 0, -1 do
        local v124
        v124 = a1.activeEmergencies[n_11 + 1]
        if not (v124.active) then
            a1:retireEmergency(v124)
        end
    end
    a1:applyAmbulanceYields()
    if #a1.activeEmergencies ~= 0 then
        a1.emergencyFlashPhase = (a1.emergencyFlashPhase + (HIGHWAY_RIDER_CONFIG_upv_1.emergency.flashHz * a2)) % 1
        a1.flungThisStep = 0
        for _, value_17 in a1.glowLanes do
            value_17.visible = false
        end
        local visual_1 = nil
        local v125 = nil
        local v126 = nil
        local v127 = nil
        for _, value_18 in a1.activeEmergencies do
            visual_1 = value_18.visual
            v125 = ((visual_1 ~= nil) and ((a1.emergencyFlashPhase + visual_1.beaconPhaseOffset) % 1)) or 0
            if visual_1 ~= nil then
                visual_1:setBeaconPhase(v125)
            end
            v126 = math.abs(value_18.speed - a1.speed)
            v127 = (value_18.s - a1.playerS) * (value_18.speed - a1.speed) < 0
            if visual_1 ~= nil then
                visual_1:setSirenPitch((((v127 and 1) or -1) * math.clamp(v126 / 320, 0, 0.13)) + 1)
            end
            a1:applyEmergencyFling(value_18)
            a1:requestEmergencyGlow(value_18, v125)
        end
        if a1.flungThisStep > 0 then
            a1.context.audio.play("thud", {})
        end
        local v129 = false
        for _, value_19 in a1.glowLanes do
            v129 = ((value_19.visible) and true) or v129
        end
        a1.glowVisible = v129
    else
        if a1.glowVisible then
            a1:parkEmergencyGlow()
        end
        return nil
    end
end
u31.spawnEmergencyGroup = function(a1, a2, a3)
    --[[
      name: spawnEmergencyGroup
      line: 1976
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        sirenStartOffset_upv_1 (copy, index: 2)
    ]]
    local emergency_1 = HIGHWAY_RIDER_CONFIG_upv_1.emergency
    local oncomingLaneCount_1 = a1.spec.oncomingLaneCount
    local v130 = nil
    if #a1.spec.laneCenters > oncomingLaneCount_1 then
        local v131 = a3 < emergency_1.fromAheadChance
        local v132
        if not (v131) or oncomingLaneCount_1 <= 0 then
            v132 = "sameDirection"
        else
            v132 = "oncoming"
        end
        v130 = a1:dealLanes(#a2, v132)
        if v130 ~= 0 then
            if #a1.activeEmergencies == 0 then
                a1.emergencyFlashPhase = 0
            end
            local v133 = 0
            local v134 = false
            local v135, v136, v137 = nil, nil, nil
            if v134 then
                v133 = v133 + 1
            else
                v134 = true
            end
            local v138, v139, v140 = nil, nil, nil
            if v133 < v130 then
                v136 = a2[math.min(v133, #a2 - 1) + 1]
                v135 = nil
                for key_2, v140 in a1.emergencyCars do
                    v138 = not v140.active
                    if v138 then
                        v139 = v140.visual
                        if v139 ~= nil then
                            v139 = v139.emergency
                        end
                        if v139 == v136 then
                            v138 = true
                        else
                            v138 = false
                        end
                    end
                    if v138 == true then
                        v135 = v140
                        break
                    end
                end
                local v141 = nil
                if v135 ~= nil then
                    v141 = a1.dealtLanes[v133 + 1]
                    v137 = true
                    if v141 >= oncomingLaneCount_1 then
                        v137 = false
                        if oncomingLaneCount_1 == 0 then
                            v137 = v131
                        end
                    end
                    local key_2 = v133 * emergency_1.groupStaggerStuds
                    v135.active = true
                    v135.laneIndex = v141
                    if v137 then
                        v140 = a1.playerS + emergency_1.spawnAheadStuds + key_2
                    else
                        v140 = a1.playerS - emergency_1.spawnBehindStuds - key_2
                    end
                    v135.s = v140
                    v135.renderPrevS = v135.s
                    v135.x = a1.spec.laneCenters[v141 + 1]
                    v135.targetX = v135.x
                    v135.restX = v135.x
                    v135.speed = ((not v137) and (a1.speedMax + emergency_1.closingStudsPerSecond)) or (-emergency_1.oncomingStudsPerSecond)
                    v135.overlapping = false
                    v135.minGap = math.huge
                    v135.nearMissAwarded = false
                    v135.ageSeconds = 0
                    v135.glowSlot = a1:claimGlowSlot()
                    v140 = v135.visual
                    if v140 ~= nil then
                        v140:startSiren(sirenStartOffset_upv_1(v135.slotIndex))
                    end
                    table.insert(a1.activeEmergencies, v135)
                    if v136 == "ambulance" then
                        a1.yieldPassArmed = true
                    end
                end
                if v134 then
                    v133 = v133 + 1
                else
                    v134 = true
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u31.dealLanes = function(a1, a2, a3)
    --[[
      name: dealLanes
      line: 2074
    ]]
    local v142 = #a1.spec.laneCenters
    local oncomingLaneCount_2 = a1.spec.oncomingLaneCount
    table.clear(a1.laneBag)
    local function v143(a4, a5)
        --[[
          line: 2079
          upvalues:
            a1 (copy, index: 1)
        ]]
        local v144 = false
        local v145
        v145 = a4
        if v144 then
            v145 = v145 + 1
        else
            v144 = true
        end
        if v145 < a5 then
            local v146 = a1:laneBlockedByObstruction(v145)
            for _, value_20 in a1.activeEmergencies do
                if value_20.laneIndex == v145 then
                    v146 = true
                end
            end
            if not (v146) then
                table.insert(a1.laneBag, v145)
            end
            if v144 then
                v145 = v145 + 1
            else
                v144 = true
            end
        end
    end
    if a3 ~= "oncoming" then
        v143(oncomingLaneCount_2, v142)
        v143(0, oncomingLaneCount_2)
    else
        v143(0, oncomingLaneCount_2)
        v143(oncomingLaneCount_2, v142)
    end
    local v147 = math.min(a2, #a1.laneBag)
    local v148 = 0
    local v149 = false
    v149, v148 = v149, v148
    while true do
        if v149 then
            v148 = v148 + 1
        else
            v149 = true
        end
        if v148 >= v147 then
            break
        end
        local v150 = v148 + math.floor(a1.eventRolls[v148 + 1] * (#a1.laneBag - v148))
        local v151 = a1.laneBag[math.min(v150, #a1.laneBag - 1) + 1]
        a1.laneBag[math.min(v150, #a1.laneBag - 1) + 1] = a1.laneBag[v148 + 1]
        a1.laneBag[v148 + 1] = v151
        a1.dealtLanes[v148 + 1] = v151
    end
    return v147
end
u31.claimGlowSlot = function(a1)
    --[[
      name: claimGlowSlot
      line: 2140
    ]]
    for n_12 = 0, #a1.glowLanes - 1 do
        local v152 = false
        for _, value_21 in a1.activeEmergencies do
            if value_21.glowSlot == n_12 then
                v152 = true
            end
        end
        if v152 then
            continue
        end
        return n_12
    end
    return -1
end
u31.applyEmergencyFling = function(a1, a2)
    --[[
      name: applyEmergencyFling
      line: 2154
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local fling_1 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.fling
    if fling_1.enabled then
        local v153 = 0
        local v154 = nil
        for _, value_22 in a1.cars do
            if not (value_22.active) or value_22 == a2 or value_22.flung then
                continue
            end
            v154 = value_22.visual
            if v154 ~= nil then
                v154 = v154.emergency
            end
            if v154 ~= nil or value_22.halfLength + a2.halfLength < math.abs(value_22.s - a2.s) then
                continue
            end
            if (value_22.halfWidth + a2.halfWidth) * fling_1.hitWidthFactor >= math.abs(value_22.x - a2.x) then
                a1:flingCar(value_22, a2)
                v153 = v153 + 1
            end
        end
        if v153 > 0 then
            a1.context.audio.play("thud", {})
        end
    else
        return nil
    end
end
u31.flingCar = function(a1, a2, a3)
    --[[
      name: flingCar
      line: 2191
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local fling_2 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.fling
    a2.flung = true
    a2.flungSeconds = 0
    a2.flungGrounded = false
    a2.flungHeight = 0
    a2.renderPrevFlungHeight = 0
    local v155 = a2.x - a1.playerX
    local v156
    if math.abs(v155) <= 0.001 then
        v156 = ((a2.restX < 0) and -1) or 1
    else
        v156 = math.sign(v155)
    end
    a2.flungLateralVelocity = v156 * fling_2.lateralSpeed
    a2.flungVerticalVelocity = fling_2.verticalSpeed
    a2.flungYaw = ((a2.speed >= 0) and 0) or math.pi
    a2.renderPrevFlungYaw = a2.flungYaw
    a2.speed = math.max(a2.speed, a3.speed * fling_2.forwardKeep)
    local spinRadiansPerSecond_1 = fling_2.spinRadiansPerSecond
    a2.flungAngularX = a1.random:NextNumber(-spinRadiansPerSecond_1, spinRadiansPerSecond_1)
    a2.flungAngularY = a1.random:NextNumber(-spinRadiansPerSecond_1, spinRadiansPerSecond_1)
    a2.flungAngularZ = a1.random:NextNumber(-spinRadiansPerSecond_1, spinRadiansPerSecond_1)
    a2.targetX = a2.x
    a2.overlapping = false
    a2.minGap = math.huge
    a1.flungCount = a1.flungCount + 1
end
u31.updateFling = function(a1, a2, a3)
    --[[
      name: updateFling
      line: 2225
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        approach_upv_1 (copy, index: 2)
    ]]
    local crashTumble_1 = HIGHWAY_RIDER_CONFIG_upv_1.crashTumble
    a2.flungSeconds = a2.flungSeconds + a3
    a2.renderPrevFlungHeight = a2.flungHeight
    a2.renderPrevFlungPitch = a2.flungPitch
    a2.renderPrevFlungYaw = a2.flungYaw
    a2.renderPrevFlungRoll = a2.flungRoll
    a2.x = a2.x + (a2.flungLateralVelocity * a3)
    a2.flungPitch = a2.flungPitch + (a2.flungAngularX * a3)
    a2.flungYaw = a2.flungYaw + (a2.flungAngularY * a3)
    a2.flungRoll = a2.flungRoll + (a2.flungAngularZ * a3)
    if a2.flungGrounded then
        a2.flungLateralVelocity = a2.flungLateralVelocity * math.exp(-crashTumble_1.slideFrictionRate * a3)
        local v157 = math.exp(-crashTumble_1.slideSpinDecayRate * a3)
        a2.flungAngularX = a2.flungAngularX * v157
        a2.flungAngularY = a2.flungAngularY * v157
        a2.flungAngularZ = a2.flungAngularZ * v157
        a2.flungPitch = approach_upv_1(a2.flungPitch, math.floor((a2.flungPitch / math.pi) + 0.5) * math.pi, crashTumble_1.flattenRate, a3)
        a2.flungRoll = approach_upv_1(a2.flungRoll, math.floor((a2.flungRoll / math.pi) + 0.5) * math.pi, crashTumble_1.flattenRate, a3)
    else
        a2.flungVerticalVelocity = a2.flungVerticalVelocity - (crashTumble_1.gravity * a3)
        a2.flungHeight = a2.flungHeight + (a2.flungVerticalVelocity * a3)
        if a2.flungHeight <= 0 then
            a2.flungHeight = 0
            if -a2.flungVerticalVelocity > crashTumble_1.settleVerticalSpeed then
                a2.flungVerticalVelocity = -a2.flungVerticalVelocity * crashTumble_1.restitution
                a2.speed = a2.speed * crashTumble_1.bounceForwardKeep
                a2.flungLateralVelocity = a2.flungLateralVelocity * crashTumble_1.bounceLateralKeep
                a2.flungAngularX = a2.flungAngularX * crashTumble_1.bounceSpinKeep
                a2.flungAngularY = a2.flungAngularY * crashTumble_1.bounceSpinKeep
                a2.flungAngularZ = a2.flungAngularZ * crashTumble_1.bounceSpinKeep
            else
                a2.flungGrounded = true
                a2.flungVerticalVelocity = 0
            end
        end
        a2.flungLateralVelocity = a2.flungLateralVelocity * math.exp(-crashTumble_1.airDragRate * a3)
        return nil
    end
end
u31.flungExpired = function(a1, a2, a3)
    --[[
      name: flungExpired
      line: 2265
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local fling_3 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.fling
    if fling_3.lifeSeconds > a2.flungSeconds then
        return a2.flungGrounded and (a3 < -fling_3.settleBehindStuds)
    end
    return true
end
u31.retireEmergency = function(a1, a2)
    --[[
      name: retireEmergency
      line: 2274
    ]]
    local visual_2 = a2.visual
    if visual_2 ~= nil then
        visual_2:stopSiren()
    end
    local v158 = nil
    if a2.glowSlot >= 0 then
        v158 = a1.glowLanes[a2.glowSlot + 1]
        if v158 ~= nil then
            v158.visible = false
        end
        a2.glowSlot = -1
    end
    local v159 = (table.find(a1.activeEmergencies, a2) or 0) - 1
    if v159 >= 0 then
        table.remove(a1.activeEmergencies, v159 + 1)
    end
    if #a1.activeEmergencies ~= 0 then
        return
    end
    a1:parkEmergencyGlow()
end
u31.clearAllEmergencies = function(a1)
    --[[
      name: clearAllEmergencies
      line: 2298
    ]]
    if #a1.activeEmergencies == 0 and not (a1.glowVisible) then
        return nil
    end
    local v160 = nil
    for _, value_23 in a1.activeEmergencies do
        v160 = value_23.visual
        if v160 ~= nil then
            v160:stopSiren()
        end
        value_23.glowSlot = -1
    end
    table.clear(a1.activeEmergencies)
    a1.yieldPassArmed = false
    for _, value_24 in a1.cars do
        if not (value_24.flung) then
            value_24.targetX = value_24.restX
        end
    end
    a1:parkEmergencyGlow()
end
u31.applyAmbulanceYields = function(a1)
    --[[
      name: applyAmbulanceYields
      line: 2321
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.yieldPassArmed then
        local emergency_2 = HIGHWAY_RIDER_CONFIG_upv_1.emergency
        local v161 = false
        local v162 = nil
        for _, value_25 in a1.activeEmergencies do
            v162 = value_25.visual
            if v162 ~= nil then
                v162 = v162.emergency
            end
            if v162 == "ambulance" then
                v161 = true
            end
        end
        local v163, _ = nil, nil
        local v164 = nil
        local v165 = nil
        local v166 = nil
        local v167 = nil
        local v168 = nil
        for v169, value_26 in a1.cars do
            v162 = not value_26.active or (value_26.flung)
            if not (v162) then
                v163 = value_26.visual
                if v163 ~= nil then
                    v163 = v163.emergency
                end
                if v163 ~= nil then
                    v162 = true
                else
                    v162 = false
                end
            end
            if v162 then
                continue
            end
            v163 = false
            if not (v161) then
                v167 = ((value_26.restX < 0) and -1) or 1
                value_26.targetX = (v163 and (value_26.restX + v167 * emergency_2.yieldOffsetStuds)) or (value_26.restX)
                continue
            end
            v165 = nil
            for v170, value_27 in a1.activeEmergencies do
                v164 = value_27.visual
                if v164 ~= nil then
                    v164 = v164.emergency
                end
                if v164 ~= "ambulance" or value_26.laneIndex ~= value_27.laneIndex then
                    continue
                end
                v165 = ((value_27.speed < 0) and -1) or 1
                v166 = math.max(emergency_2.yieldRangeStuds, math.abs(value_27.speed - value_26.speed) * emergency_2.yieldLeadSeconds)
                v168 = (value_26.s - value_27.s) * v165
                if v168 <= 0 then
                    continue
                end
                if v168 < v166 then
                    v163 = true
                    break
                end
            end
            v167 = ((value_26.restX < 0) and -1) or 1
            value_26.targetX = (v163 and (value_26.restX + v167 * emergency_2.yieldOffsetStuds)) or (value_26.restX)
        end
        for v171, value_28 in a1.activeEmergencies do
            v162 = value_28.visual
            if v162 ~= nil then
                v162 = v162.emergency
            end
            if v162 == "ambulance" then
                value_28.targetX = value_28.restX - ((((value_28.restX < 0) and -1) or 1) * emergency_2.corridorOffsetStuds)
            end
        end
        a1.yieldPassArmed = v161
    else
        return nil
    end
end
u31.requestEmergencyGlow = function(a1, a2, a3)
    --[[
      name: requestEmergencyGlow
      line: 2404
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local laneGlow_1 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.laneGlow
    if laneGlow_1.enabled then
        local v169 = nil
        if a2.glowSlot >= 0 then
            v169 = a1.glowLanes[a2.glowSlot + 1]
            local v170, v171 = nil, nil
            if v169 ~= nil then
                v170 = a2.s - a1.playerS
                v171 = a2.speed - a1.speed
                local v172 = math.abs(v171)
                local v173 = false
                if v170 * v171 < 0 then
                    v173 = v172 > 0.001
                end
                local v174
                if v173 then
                    v174 = math.abs(v170) / v172
                else
                    v174 = math.huge
                end
                if laneGlow_1.withinSeconds >= v174 then
                    v169.visible = true
                    v169.laneX = a2.x
                    v169.phase = a3
                    v169.intensity = math.clamp(1 - (v174 / laneGlow_1.withinSeconds), 0, 1)
                    return
                end
            end
            return nil
        end
    end
    return nil
end
u31.parkEmergencyGlow = function(a1)
    --[[
      name: parkEmergencyGlow
      line: 2430
    ]]
    a1.glowVisible = false
    for _, value_29 in a1.glowLanes do
        a1:parkGlowLane(value_29)
    end
end
u31.parkGlowLane = function(a1, a2)
    --[[
      name: parkGlowLane
      line: 2436
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.visible = false
    a2.intensity = 0
    if a2.step < 0 and a2.bank < 0 then
        return nil
    end
    a2.bank = -1
    a2.step = -1
    a2.tickShown = false
    local value_30 = nil
    local v175 = nil
    for _, value_30 in a2.rungs do
        value_30.bar.CFrame = u1
        v175 = value_30.tick
        if v175 ~= nil then
            v175.CFrame = u1
        end
    end
end
u31.updateSpecials = function(a1, a2)
    --[[
      name: updateSpecials
      line: 2453
    ]]
    if a1.activeRamp ~= nil and not (a1.activeRamp.active) then
        a1.activeRamp = nil
    end
    if a1.activeOil ~= nil and not (a1.activeOil.active) then
        a1:endOilLeak()
    end
    a1:updateOilLeak(a2)
end
u31.updateDirector = function(a1)
    --[[
      name: updateDirector
      line: 2462
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        DIRECTOR_MAX_RESOURCE_COUNT_upv_1 (copy, index: 2)
        directorEvent_upv_1 (copy, index: 3)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 4)
    ]]
    if a1.systems.director then
        local v176 = nil
        if a1.elapsed >= a1.nextEventAt then
            local forcedEvent_1 = a1.forcedEvent
            a1.forcedEvent = nil
            local v177 = deriveRandom_upv_1(a1.context.getRunSeed(), 23831 + a1.eventIndex)
            local v178 = v177:NextNumber()
            local v179 = v177:NextNumber()
            local v180 = v177:NextNumber()
            for n_13 = 0, DIRECTOR_MAX_RESOURCE_COUNT_upv_1 - 1 do
                a1.eventRolls[n_13 + 1] = v177:NextNumber()
            end
            local v181
            if forcedEvent_1 == nil then
                v181 = nil
            else
                v181 = directorEvent_upv_1(forcedEvent_1)
            end
            local v182
            local v183 = nil
            if v181 ~= nil and (a1:hasCapacity(v181)) then
                v182 = forcedEvent_1
            else
                v183 = a1.previousEventIntensity ~= "high"
                v176 = a1:pickEventKind(v179, v183)
                if v176 ~= nil or v183 then
                    v182 = v176
                else
                    v182 = a1:pickEventKind(v179, true)
                end
            end
            if a1.rampTutorialArmed and a1.eventIndex == 0 then
                v182 = (a1:hasCapacityFor("rampTruck") and "rampTruck") or v182
            end
            if v182 ~= nil then
                a1:fireEvent(v182, v180)
                v183 = directorEvent_upv_1(v182)
                if v183 ~= nil then
                    a1.previousEventIntensity = v183.intensity
                end
                a1.eventIndex = a1.eventIndex + 1
                local director_1 = HIGHWAY_RIDER_CONFIG_upv_1.director
                a1.nextEventAt = (a1.elapsed + director_1.gapSecondsMin) + (v178 * (director_1.gapSecondsMax - director_1.gapSecondsMin))
            else
                a1.nextEventAt = a1.elapsed + HIGHWAY_RIDER_CONFIG_upv_1.director.retrySeconds
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u31.pickEventKind = function(a1, a2, a3)
    --[[
      name: pickEventKind
      line: 2517
      upvalues:
        DIRECTOR_EVENTS_upv_1 (copy, index: 1)
    ]]
    local v184 = 0
    for _, value_31 in DIRECTOR_EVENTS_upv_1 do
        v184 = (a1:eventEligible(value_31, a3) and (v184 + value_31.weight)) or v184
    end
    if v184 > 0 then
        local v186 = a2 * v184
        local v187 = nil
        local v188 = nil
        for _, value_32 in DIRECTOR_EVENTS_upv_1 do
            v188 = a1:eventEligible(value_32, a3)
            if not (v188) then
                continue
            end
            v187 = v186 - value_32.weight
            if v187 > 0 then
                v186 = v187
                continue
            end
            return value_32.kind
        end
    end
    return nil
end
u31.eventEligible = function(a1, a2, a3)
    --[[
      name: eventEligible
      line: 2539
    ]]
    if a1.elapsed >= a2.earliestSeconds then
        if not (a3) and a2.intensity == "high" then
            return false
        end
        return a1:hasCapacity(a2)
    end
    return false
end
u31.hasCapacityFor = function(a1, a2)
    --[[
      name: hasCapacityFor
      line: 2548
      upvalues:
        directorEvent_upv_1 (copy, index: 1)
    ]]
    local v189 = directorEvent_upv_1(a2)
    local v190 = false
    if v189 ~= nil then
        v190 = a1:hasCapacity(v189)
    end
    return v190
end
u31.hasCapacity = function(a1, a2)
    --[[
      name: hasCapacity
      line: 2552
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local resource_1 = a2.resource
    local v191 = nil
    if resource_1 == "ramp" then
        v191 = a1.systems.ramp
        if v191 then
            local v192 = false
            if a1.activeRamp ~= nil then
                v191 = v192
            else
                v191 = not a1:tunnelHoldsRoad() and (a1:hasSpecialSlot("ramp"))
            end
        end
        return v191
    elseif resource_1 == "oil" then
        v191 = a1.systems.oil
        if v191 then
            local v193 = false
            if a1.activeOil ~= nil then
                v191 = v193
            else
                v191 = a1:hasSpecialSlot("oil")
            end
        end
        return v191
    elseif resource_1 == "emergency" then
        if a1.systems.emergency and HIGHWAY_RIDER_CONFIG_upv_1.emergency.maxConcurrent >= #a1.activeEmergencies + a2.resourceCount and a1:freeEmergencySlots(a2) >= a2.resourceCount then
            v191 = a2.resourceCount <= a1:freeLaneCount()
            return v191
        end
        return false
    elseif resource_1 == "tunnel" then
        v191 = a1.systems.tunnel
        if v191 then
            local v194 = false
            local v195 = nil
            if a1.tunnelRungBase == nil then
                v191 = v194
            else
                v195 = not a1:tunnelHoldsRoad()
                if v195 then
                    local v196 = false
                    if a1.activeRamp ~= nil then
                        v191 = v196
                    else
                        v191 = not a1.onRamp and (not a1.airborne)
                    end
                else
                    v191 = v195
                end
            end
        end
        return v191
    end
end
u31.hasSpecialSlot = function(a1, a2)
    --[[
      name: hasSpecialSlot
      line: 2584
    ]]
    local v197, v198 = nil, nil
    for _, value_33 in a1.specialCars do
        v198 = not value_33.active
        if v198 then
            v197 = value_33.visual
            if v197 ~= nil then
                v197 = v197.special
            end
            if v197 == a2 then
                v198 = true
            else
                v198 = false
            end
        end
        if not (v198) then
            continue
        end
        return true
    end
    return false
end
u31.freeEmergencySlots = function(a1, a2)
    --[[
      name: freeEmergencySlots
      line: 2608
    ]]
    local emergencyRoster_1 = a2.emergencyRoster
    if emergencyRoster_1 ~= nil then
        local v199 = 0
        local v200 = nil
        local value_34 = nil
        local v201 = nil
        local value_35 = nil
        local v202 = nil
        for _, value_34 in emergencyRoster_1 do
            v200 = 0
            for v204, value_36 in a1.emergencyCars do
                value_35 = value_36.active
                if not value_35 then
                    v201 = value_36.visual
                    if v201 ~= nil then
                        v201 = v201.emergency
                    end
                    if v201 ~= value_34 then
                        value_35 = true
                    else
                        value_35 = false
                    end
                end
                if not (value_35) then
                    v200 = v200 + 1
                end
            end
            v202 = 0
            v202 = v202
            for v205, value_35 in emergencyRoster_1 do
                if value_35 == value_34 then
                    v202 = v202 + 1
                end
            end
            v199 = v199 + math.min(v200, v202)
            if #emergencyRoster_1 <= v199 then
                break
            end
        end
        return v199
    else
        local tbl_16 = {}
        local v203 = 0
        for _, value_37 in a1.emergencyCars do
            if not value_37.active then
                v203 = v203 + 1
                tbl_16[v203] = value_37
            end
        end
        return #tbl_16
    end
end
u31.freeLaneCount = function(a1)
    --[[
      name: freeLaneCount
      line: 2658
    ]]
    local v204 = 0
    v204 = v204
    for n_14 = 0, #a1.spec.laneCenters - 1 do
        local v205 = a1:laneBlockedByObstruction(n_14)
        for _, value_38 in a1.activeEmergencies do
            if value_38.laneIndex == n_14 then
                v205 = true
            end
        end
        if not (v205) then
            v204 = v204 + 1
        end
    end
    return v204
end
u31.fireEvent = function(a1, a2, a3)
    --[[
      name: fireEvent
      line: 2676
      upvalues:
        directorEvent_upv_1 (copy, index: 1)
    ]]
    if a2 == "rampTruck" then
        a1:spawnSpecial("ramp")
    elseif a2 ~= "oilTruck" then
        local v206 = nil
        if a2 ~= "tunnel" then
            local v207 = (a2 == "emergencySingle") and true
            if v207 or a2 == "emergencyPair" then
                v207 = true
            end
            if not (v207) and a2 ~= "emergencyTriple" then
                return
            end
            v206 = directorEvent_upv_1(a2)
            if v206 ~= nil then
                v206 = v206.emergencyRoster
            end
            local v208
            if v206 ~= nil then
                v208 = v206
            else
                v208 = {a1:drawEmergencyKind(a3)}
            end
            a1:spawnEmergencyGroup(v208, a3)
        else
            a1:latchTunnel(a1:drawTunnelTileCount(a3), a1.chunkShownBiome)
        end
    else
        a1:spawnSpecial("oil", a3)
    end
    return nil
end
u31.drawEmergencyKind = function(a1, a2)
    --[[
      name: drawEmergencyKind
      line: 2717
    ]]
    local tbl_18 = {}
    local v209 = 0
    for _, value_39 in a1.emergencyCars do
        if not value_39.active then
            v209 = v209 + 1
            tbl_18[v209] = value_39
        end
    end
    local v210 = nil
    if #tbl_18 ~= 0 then
        v210 = tbl_18[math.min(math.floor(a2 * #tbl_18), #tbl_18 - 1) + 1].visual
        if v210 ~= nil then
            v210 = v210.emergency
        end
        local v211
        if v210 ~= nil then
            v211 = v210
        else
            v211 = "police"
        end
        return v211
    end
    return "police"
end
u31.resetDirector = function(a1)
    --[[
      name: resetDirector
      line: 2747
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
    ]]
    a1.eventIndex = 0
    a1.previousEventIntensity = "low"
    a1.forcedEvent = nil
    if a1.systems.director then
        local director_2 = HIGHWAY_RIDER_CONFIG_upv_1.director
        local v212 = deriveRandom_upv_1(a1.context.getRunSeed(), 23831):NextNumber()
        a1.nextEventAt = math.max(a1.elapsed, ((not (a1.rampTutorialArmed)) and (director_2.firstEarliestSeconds + (v212 * director_2.firstSpreadSeconds))) or (HIGHWAY_RIDER_CONFIG_upv_1.ramp.tutorialFirstRampSeconds))
    else
        a1.nextEventAt = math.huge
        return nil
    end
end
u31.forceEvent = function(a1, a2)
    --[[
      name: forceEvent
      line: 2762
    ]]
    a1.forcedEvent = a2
    a1.nextEventAt = a1.elapsed
end
u31.spawnSpecial = function(a1, a2, a3)
    --[[
      name: spawnSpecial
      line: 2766
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a3 == nil then
        a3 = 0
    end
    local v213
    if a2 ~= "ramp" then
        v213 = HIGHWAY_RIDER_CONFIG_upv_1.oil
    else
        v213 = HIGHWAY_RIDER_CONFIG_upv_1.ramp
    end
    local v214 = nil
    local v215, v216 = nil, nil
    for _, v217 in a1.specialCars do
        v216 = not v217.active
        if v216 then
            v215 = v217.visual
            if v215 ~= nil then
                v215 = v215.special
            end
            if v215 == a2 then
                v216 = true
            else
                v216 = false
            end
        end
        if v216 == true then
            v214 = v217
            break
        end
    end
    local v218, v219 = nil, nil
    if v214 ~= nil then
        local v220 = false
        if a2 == "ramp" then
            v220 = a1.rampTutorialArmed
        end
        v218 = #a1.spec.laneCenters
        v219 = a1.spec.oncomingLaneCount
        if v218 > v219 then
            local v217
            if a2 ~= "ramp" then
                v217 = math.clamp(v219 + math.floor(a3 * (v218 - v219)), v219, v218 - 1)
            else
                v217 = math.clamp(a1:nearestLane(a1.playerX), v219, v218 - 1)
            end
            v214.active = true
            v214.laneIndex = v217
            local playerS_1 = a1.playerS
            if v220 then
                v215 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.tutorialSpawnAheadStuds
            else
                v215 = v213.spawnAheadStuds
            end
            v214.s = playerS_1 + v215
            v214.renderPrevS = v214.s
            local v221 = a1.spec.barrierX - 3
            local v222 = math.min(math.max(-v221, a1.oncomingBoundaryX + v214.halfWidth), v221)
            if a2 ~= "ramp" then
                v215 = a1.spec.laneCenters[v217 + 1]
            else
                v215 = math.clamp(a1.playerX, v222, v221)
            end
            v214.x = v215
            v214.restX = v214.x
            v214.targetX = v214.x
            v214.speed = math.min(a1.speed, a1.speedMax) * v213.speedFactor
            v214.overlapping = false
            v214.minGap = math.huge
            v214.nearMissAwarded = false
            v214.ageSeconds = 0
            if a2 ~= "ramp" then
                a1.activeOil = v214
                a1.oilLeakRemaining = HIGHWAY_RIDER_CONFIG_upv_1.oil.leakSeconds
                a1.oilNextSlickS = v214.s + -8.5
            else
                a1.activeRamp = v214
                if v220 then
                    a1:markRampTaught()
                    return
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u31.markRampTaught = function(a1)
    --[[
      name: markRampTaught
      line: 2850
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
    ]]
    a1.rampTutorialArmed = false
    a1.rampTutorialTaughtThisSession = true
    local v223 = sessionAtom_upv_1()
    if v223 ~= nil then
        ClientEvents_upv_1.markTutorialSeen:fire(v223.gameId)
    else
        return nil
    end
end
u31.nearestLane = function(a1, a2)
    --[[
      name: nearestLane
      line: 2859
    ]]
    local v224 = 0
    local v225 = math.huge
    v224 = v224
    for n_15 = 0, #a1.spec.laneCenters - 1 do
        local v226
        v226 = math.abs(a1.spec.laneCenters[n_15 + 1] - a2)
        if v226 < v225 then
            v225, v224 = v226, n_15
        end
    end
    return v224
end
u31.updateRampContact = function(a1, a2)
    --[[
      name: updateRampContact
      line: 2871
      upvalues:
        RAMP_GEOMETRY_upv_1 (copy, index: 1)
        approach_upv_1 (copy, index: 2)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 3)
    ]]
    local activeRamp_1 = a1.activeRamp
    local onRamp_1 = a1.onRamp
    a1.onRamp = false
    if not (a1.airborne) and activeRamp_1 ~= nil then
        local v227 = nil
        if activeRamp_1.active then
            v227 = a1.playerS - activeRamp_1.s
            if RAMP_GEOMETRY_upv_1.topZ >= v227 then
                local v228 = false
                if -((activeRamp_1.halfLength + a1.spec.playerHalfLength) + RAMP_GEOMETRY_upv_1.captureLeadIn) <= v227 then
                    v228 = math.abs(a1.playerX - activeRamp_1.x) <= (activeRamp_1.halfWidth + a1.spec.playerHalfWidth) + RAMP_GEOMETRY_upv_1.captureWidthMargin
                end
                if v228 then
                    a1.onRamp = true
                    a1.playerX = approach_upv_1(a1.playerX, activeRamp_1.x, HIGHWAY_RIDER_CONFIG_upv_1.ramp.centreingPerSecond, a2)
                    a1.playerY = math.clamp((v227 - RAMP_GEOMETRY_upv_1.bottomZ) / (RAMP_GEOMETRY_upv_1.topZ - RAMP_GEOMETRY_upv_1.bottomZ), 0, 1) * RAMP_GEOMETRY_upv_1.topHeight
                    return
                end
                if onRamp_1 then
                    a1:beginFlight(0)
                end
            elseif onRamp_1 then
                a1:launchFromRamp()
            end
            return nil
        end
    end
    return nil
end
u31.launchFromRamp = function(a1)
    --[[
      name: launchFromRamp
      line: 2912
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local ramp_1 = HIGHWAY_RIDER_CONFIG_upv_1.ramp
    a1:beginFlight((math.max(ramp_1.launchSpeedMin, a1.speed * ramp_1.launchSpeedFactor)))
end
u31.spinsInAir = function(a1)
    --[[
      name: spinsInAir
      line: 2917
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v229 = false
    if a1.mode == "tp" then
        v229 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.airSpin.enabled
    end
    return v229
end
u31.beginFlight = function(a1, a2)
    --[[
      name: beginFlight
      line: 2920
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.airborne = true
    a1.onRamp = false
    local airPool_1 = HIGHWAY_RIDER_CONFIG_upv_1.rider.animation.airPool
    local rider_2 = a1.rider
    if rider_2 ~= nil then
        rider_2:setClip(airPool_1[a1.random:NextInteger(0, #airPool_1 - 1) + 1])
    end
    a1.playerVerticalVelocity = a2
    a1.bounceRemaining = 1
    if not a1:spinsInAir() then
        return
    end
    a1.airSpinRate = (math.tau * HIGHWAY_RIDER_CONFIG_upv_1.ramp.airSpin.turns) / math.max((2 * a2) / HIGHWAY_RIDER_CONFIG_upv_1.ramp.gravity, 0.001)
end
u31.updateFlight = function(a1, a2)
    --[[
      name: updateFlight
      line: 2942
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.airborne then
        a1.playerVerticalVelocity = a1.playerVerticalVelocity - (HIGHWAY_RIDER_CONFIG_upv_1.ramp.gravity * a2)
        a1.playerY = a1.playerY + (a1.playerVerticalVelocity * a2)
        if a1.playerY <= 0 and a1.playerVerticalVelocity <= 0 then
            a1:landOnRoad()
        end
    else
        return nil
    end
end
u31.updateAirSpin = function(a1, a2)
    --[[
      name: updateAirSpin
      line: 2952
      upvalues:
        approach_upv_1 (copy, index: 1)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    if a1:spinsInAir() then
        a1.renderPrevAirSpin = a1.airSpinAngle
        if a1.airborne then
            a1.airSpinAngle = a1.airSpinAngle + (a1.airSpinRate * a2)
            return nil
        elseif a1.airSpinAngle ~= 0 then
            a1.airSpinAngle = approach_upv_1(a1.airSpinAngle, 0, HIGHWAY_RIDER_CONFIG_upv_1.ramp.airSpin.settleRate, a2)
            if math.abs(a1.airSpinAngle) < 0.01 then
                a1.airSpinAngle = 0
            end
        else
            return nil
        end
    else
        return nil
    end
end
u31.landOnRoad = function(a1)
    --[[
      name: landOnRoad
      line: 2969
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v230 = math.clamp(-a1.playerVerticalVelocity / HIGHWAY_RIDER_CONFIG_upv_1.ramp.landing.referenceSpeed, 0, 1)
    a1.playerY = 0
    a1.playerVerticalVelocity = 0
    a1.airborne = false
    a1.bounceRemaining = 0
    local rider_3 = a1.rider
    if rider_3 ~= nil then
        rider_3:setClip(a1:ladderClip())
    end
    a1:applyLandingImpact(v230)
    a1.airSpinAngle = a1.airSpinAngle - (math.tau * math.floor((a1.airSpinAngle / math.tau) + 0.5))
    a1.invulnRemaining = math.max(a1.invulnRemaining, HIGHWAY_RIDER_CONFIG_upv_1.ramp.landingGraceSeconds)
end
u31.applyLandingImpact = function(a1, a2)
    --[[
      name: applyLandingImpact
      line: 2993
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local landing_1 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.landing
    local v231 = nil
    if a2 > 0.02 then
        a1:hitStop(landing_1.hitStopSeconds * a2)
        a1.stage.shake(landing_1.shakeMin + ((landing_1.shakeMax - landing_1.shakeMin) * a2))
        a1.context.audio.play("metalClank", {volume = landing_1.volumeMin + ((landing_1.volumeMax - landing_1.volumeMin) * a2), pitch = 0.94 - (0.12 * a2)})
        v231 = a1.landingDust
        local landingDustAnchor_1 = a1.landingDustAnchor
        if v231 ~= nil and landingDustAnchor_1 ~= nil then
            landingDustAnchor_1.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.playerX, 0.3, 0))
            v231:Emit((math.floor((landing_1.dustMin + ((landing_1.dustMax - landing_1.dustMin) * a2)) + 0.5)))
        end
        a1.landingDip = a2
        a1.landingDipClock = 0
    else
        return nil
    end
end
u31.buildLandingDust = function(a1, a2)
    --[[
      name: buildLandingDust
      line: 3021
      upvalues:
        u1 (copy, index: 1)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    local v232 = Instance.new("Part")
    v232.Anchored = true
    v232.CanCollide = false
    v232.CanQuery = false
    v232.CanTouch = false
    v232.CastShadow = false
    v232.Transparency = 1
    v232.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v232.CFrame = u1
    v232.Parent = a2
    local v233 = Instance.new("ParticleEmitter")
    v233.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v233.Color = ColorSequence.new(u4)
    v233.Rate = 0
    v233.Enabled = false
    v233.Lifetime = NumberRange.new(0.25, 0.5)
    v233.Speed = NumberRange.new(6, 15)
    v233.SpreadAngle = Vector2.new(70, 70)
    v233.Acceleration = Vector3.new(0, -34, 0)
    v233.RotSpeed = NumberRange.new(-170, 170)
    v233.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.55), NumberSequenceKeypoint.new(1, 0.12)})
    local tbl_19 = {NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)}
    v233.Transparency = NumberSequence.new(tbl_19)
    v233.EmissionDirection = Enum.NormalId.Top
    v233.Parent = v232
    a1.landingDustAnchor = v232
    a1.landingDust = v233
end
u31.buildOilSlicks = function(a1, a2)
    --[[
      name: buildOilSlicks
      line: 3051
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u5 (copy, index: 3)
        u1 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
    ]]
    for _ = 0, HIGHWAY_RIDER_CONFIG_upv_1.oil.slickPoolSize - 1 do
        local v234 = makeSmoothPart_upv_1(a2)
        v234.Shape = Enum.PartType.Cylinder
        v234.Size = Vector3.new(0.08, HIGHWAY_RIDER_CONFIG_upv_1.oil.slickRadius * 2, HIGHWAY_RIDER_CONFIG_upv_1.oil.slickRadius * 2)
        v234.Color = u5
        v234.Reflectance = 0.18
        v234.CFrame = u1
        table.insert(a1.oilSlicks, {part = v234})
    end
    for _ = 0, 39 do
        local v235 = makeStagePart_upv_1(a2)
        v235.Size = Vector3.new(0.41999998688697815, 0.41999998688697815, 0.41999998688697815)
        v235.Color = u5
        v235.CFrame = u1
        table.insert(a1.oilDroplets, {part = v235})
    end
end
u31.updateOilLeak = function(a1, a2)
    --[[
      name: updateOilLeak
      line: 3088
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local activeOil_1 = a1.activeOil
    if activeOil_1 ~= nil and a1.oilLeakRemaining > 0 then
        a1.oilLeakRemaining = a1.oilLeakRemaining - a2
        local v236 = activeOil_1.s + -8.5
        local v237 = nil
        while a1.oilNextSlickS <= v236 do
            v237 = nil
            for _, value_40 in a1.oilSlicks do
                if not value_40.active then
                    v237 = value_40
                    break
                end
            end
            if v237 == nil then
                break
            else
                v237.active = true
                v237.s = a1.oilNextSlickS
                v237.x = activeOil_1.x
                a1.oilNextSlickS = a1.oilNextSlickS + HIGHWAY_RIDER_CONFIG_upv_1.oil.slickSpacingStuds
            end
        end
        a1:spawnOilSpray(v236, activeOil_1.x, a2)
        if a1.oilLeakRemaining <= 0 then
            a1:endOilLeak()
        end
    else
        return nil
    end
end
u31.endOilLeak = function(a1)
    --[[
      name: endOilLeak
      line: 3127
    ]]
    a1.activeOil = nil
    a1.oilLeakRemaining = 0
end
u31.spawnOilSpray = function(a1, a2, a3, a4)
    --[[
      name: spawnOilSpray
      line: 3131
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.oilSprayCarry = a1.oilSprayCarry + (HIGHWAY_RIDER_CONFIG_upv_1.oil.sprayPerSecond * a4)
    local v238 = nil
    while a1.oilSprayCarry >= 1 do
        a1.oilSprayCarry = a1.oilSprayCarry - 1
        v238 = nil
        for _, value_41 in a1.oilDroplets do
            if value_41.life <= 0 == true then
                v238 = value_41
                break
            end
        end
        if v238 ~= nil then
            v238.life = HIGHWAY_RIDER_CONFIG_upv_1.oil.sprayLifeSeconds
            v238.s = a2
            v238.x = a3 + a1.random:NextNumber(-0.8, 0.8)
            v238.y = 1.1
            v238.velocityS = -a1.random:NextNumber(2, 10)
            v238.velocityX = a1.random:NextNumber(-4, 4)
            v238.velocityY = a1.random:NextNumber(1, 6)
            continue
        end
        return nil
    end
end
u31.updateOilWorld = function(a1, a2)
    --[[
      name: updateOilWorld
      line: 3162
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    for _, value_42 in a1.oilSlicks do
        if not (value_42.active) then
            continue
        end
        if value_42.s - a1.playerS < -HIGHWAY_RIDER_CONFIG_upv_1.oil.slickDespawnBehindStuds then
            value_42.active = false
            value_42.part.CFrame = u1
        end
    end
    for _, value_43 in a1.oilDroplets do
        if value_43.life <= 0 then
            continue
        end
        value_43.life = value_43.life - a2
        value_43.velocityY = value_43.velocityY - (HIGHWAY_RIDER_CONFIG_upv_1.oil.sprayGravity * a2)
        value_43.s = value_43.s + (value_43.velocityS * a2)
        value_43.x = value_43.x + (value_43.velocityX * a2)
        value_43.y = value_43.y + (value_43.velocityY * a2)
        if value_43.y <= 0 or value_43.life <= 0 then
            value_43.life = 0
            value_43.part.CFrame = u1
        end
    end
end
u31.updateSlip = function(a1, a2)
    --[[
      name: updateSlip
      line: 3188
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.slipRemaining > 0 then
        a1.slipRemaining = a1.slipRemaining - a2
    end
    if a1.airborne then
        return nil
    end
    for _, value_44 in a1.oilSlicks do
        if not (value_44.active) or HIGHWAY_RIDER_CONFIG_upv_1.oil.slickRadius < math.abs(value_44.s - a1.playerS) or HIGHWAY_RIDER_CONFIG_upv_1.oil.slickRadius < math.abs(value_44.x - a1.playerX) then
            continue
        end
        a1.slipRemaining = HIGHWAY_RIDER_CONFIG_upv_1.oil.slipSeconds
        return nil
    end
end
u31.buildObstructions = function(a1, a2)
    --[[
      name: buildObstructions
      line: 3209
    ]]
    local fpAssets_1 = a1.fpAssets
    if fpAssets_1 ~= nil then
        fpAssets_1 = fpAssets_1:makeObstructions(a2)
    end
    if fpAssets_1 ~= nil then
        local tbl_20 = nil
        for _, value_45 in fpAssets_1 do
            tbl_20 = {}
            for n_16 = 0, #value_45.props - 1 do
                table.insert(tbl_20, (a1:makeObstructionProp(n_16)))
            end
            table.insert(a1.obstructions, {visual = value_45, props = tbl_20})
        end
    else
        return nil
    end
end
u31.makeObstructionProp = function(a1, a2)
    --[[
      name: makeObstructionProp
      line: 3234
    ]]
    local tbl_21 = {}
    tbl_21.index = a2
    return tbl_21
end
u31.updateObstructionSchedule = function(a1)
    --[[
      name: updateObstructionSchedule
      line: 3260
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
    ]]
    if a1.systems.obstruction and a1.elapsed >= a1.nextObstructionAt then
        local obstruction_1 = HIGHWAY_RIDER_CONFIG_upv_1.obstruction
        if a1.activeObstruction == nil and #a1.obstructions ~= 0 then
            local v239 = deriveRandom_upv_1(a1.context.getRunSeed(), 39939 + a1.obstructionIndex)
            local v240 = v239:NextNumber()
            a1:spawnObstruction((math.min(math.floor(v239:NextNumber() * #a1.obstructions), #a1.obstructions - 1)))
            a1.obstructionIndex = a1.obstructionIndex + 1
            a1.nextObstructionAt = (a1.elapsed + obstruction_1.gapSecondsMin) + (v240 * (obstruction_1.gapSecondsMax - obstruction_1.gapSecondsMin))
            return
        end
        a1.nextObstructionAt = a1.elapsed + obstruction_1.retrySeconds
        return nil
    end
    return nil
end
u31.spawnObstruction = function(a1, a2)
    --[[
      name: spawnObstruction
      line: 3281
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v241 = a1.obstructions[a2 + 1]
    if v241 ~= nil then
        v241.active = true
        v241.s = a1.playerS + HIGHWAY_RIDER_CONFIG_upv_1.obstruction.spawnAheadStuds
        for _, value_46 in v241.props do
            value_46.knocked = false
            value_46.shown = true
            value_46.speed = 0
            a1:resetFling(value_46)
        end
        a1.activeObstruction = v241
        a1:refreshBlockedLanes()
    else
        return nil
    end
end
u31.refreshBlockedLanes = function(a1)
    --[[
      name: refreshBlockedLanes
      line: 3297
    ]]
    local laneCenters_2 = a1.spec.laneCenters
    table.clear(a1.blockedLanes)
    a1.anyLaneBlocked = false
    local activeObstruction_1 = a1.activeObstruction
    local v242, v243 = nil, nil
    for n_17 = 0, #laneCenters_2 - 1 do
        v243 = false
        if activeObstruction_1 ~= nil then
            local v244
            v244 = laneCenters_2[n_17 + 1]
            v242 = false
            if activeObstruction_1.visual.minX < v244 + 2.1 then
                v242 = v244 - 2.1 < activeObstruction_1.visual.maxX
            end
            v243 = v242
        end
        table.insert(a1.blockedLanes, v243)
        if v243 then
            a1.anyLaneBlocked = true
        end
    end
end
u31.laneBlockedByObstruction = function(a1, a2)
    --[[
      name: laneBlockedByObstruction
      line: 3316
    ]]
    return a1.anyLaneBlocked and (a1.blockedLanes[a2 + 1] == true)
end
u31.obstructionAhead = function(a1, a2, a3)
    --[[
      name: obstructionAhead
      line: 3319
    ]]
    local activeObstruction_2 = a1.activeObstruction
    if activeObstruction_2 ~= nil then
        return ((activeObstruction_2.s - a2) * a3) > 0
    end
    return false
end
u31.updateObstructionWorld = function(a1, a2)
    --[[
      name: updateObstructionWorld
      line: 3326
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local activeObstruction_3 = a1.activeObstruction
    if activeObstruction_3 ~= nil then
        for _, value_47 in activeObstruction_3.props do
            if not (value_47.knocked) or not (value_47.shown) then
                continue
            end
            value_47.renderPrevS = value_47.s
            value_47.s = value_47.s + (value_47.speed * a2)
            a1:updateFling(value_47, a2)
            if HIGHWAY_RIDER_CONFIG_upv_1.obstruction.fling.lifeSeconds <= value_47.flungSeconds then
                value_47.shown = false
                activeObstruction_3.visual:parkProp(value_47.index)
            end
        end
        if activeObstruction_3.s - a1.playerS < -HIGHWAY_RIDER_CONFIG_upv_1.obstruction.despawnBehindStuds then
            a1:retireObstruction()
        end
    else
        return nil
    end
end
u31.retireObstruction = function(a1)
    --[[
      name: retireObstruction
      line: 3349
    ]]
    local activeObstruction_4 = a1.activeObstruction
    if activeObstruction_4 ~= nil then
        activeObstruction_4.active = false
        activeObstruction_4.visual:park()
        a1.activeObstruction = nil
        a1:refreshBlockedLanes()
    else
        return nil
    end
end
u31.updateObstructionContact = function(a1)
    --[[
      name: updateObstructionContact
      line: 3359
    ]]
    local activeObstruction_5 = a1.activeObstruction
    if activeObstruction_5 ~= nil and not a1.onRamp then
        local visual_3 = activeObstruction_5.visual
        local v245 = 0
        local v246 = nil
        for _, value_48 in activeObstruction_5.props do
            if value_48.knocked or not (value_48.shown) then
                continue
            end
            v246 = visual_3.props[value_48.index + 1]
            if v246 == nil or v246.propClass == "decal" or (v246.halfLength + a1.spec.playerHalfLength) - a1.collisionForgiveness < math.abs((activeObstruction_5.s + v246.offsetZ) - a1.playerS) or (v246.halfWidth + a1.spec.playerHalfWidth) - a1.collisionForgiveness < math.abs(v246.offsetX - a1.playerX) then
                continue
            end
            if not a1.airborne and v246.propClass ~= "cone" then
                if v246.propClass == "debris" or a1.invulnRemaining > 0 then
                    continue
                end
                a1:crash((math.sign(a1.playerX - v246.offsetX)))
                return true
            elseif v246.propClass ~= "debris" then
                a1:knockObstructionProp(activeObstruction_5, value_48, v246.offsetX)
                v245 = v245 + 1
            end
        end
        if v245 > 0 then
            a1.context.audio.play("thud", {})
        end
    end
    return false
end
u31.updateObstructionAvoidance = function(a1, a2)
    --[[
      name: updateObstructionAvoidance
      line: 3412
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local activeObstruction_6 = a1.activeObstruction
    if activeObstruction_6 ~= nil then
        local obstruction_2 = HIGHWAY_RIDER_CONFIG_upv_1.obstruction
        local visual_4 = activeObstruction_6.visual
        local v247, v248 = nil, nil
        local v249 = nil
        local v250 = nil
        local v251 = nil
        for _, value_49 in a1.cars do
            v248 = not value_49.active or (value_49.flung)
            if not (v248) then
                v247 = value_49.visual
                if v247 ~= nil then
                    v247 = v247.emergency
                end
                if v247 ~= nil then
                    v248 = true
                else
                    v248 = false
                end
            end
            if v248 then
                continue
            end
            v247 = ((value_49.speed < 0) and -1) or 1
            v250 = (activeObstruction_6.s - value_49.s) * v247
            if v250 <= 0 or math.max(obstruction_2.swerveMinLeadStuds, math.abs(value_49.speed) * obstruction_2.swerveLeadSeconds) + visual_4.halfLength < v250 or value_49.x + value_49.halfWidth <= visual_4.minX or visual_4.maxX <= value_49.x - value_49.halfWidth then
                continue
            end
            v249 = a1:pickEscapeLane(value_49)
            if v249 >= 0 then
                value_49.laneIndex = v249
                value_49.restX = a1.spec.laneCenters[v249 + 1]
                value_49.targetX = value_49.restX
                continue
            end
            v251 = math.abs(value_49.speed) * obstruction_2.swerveSlowFactor
            if v251 < math.abs(value_49.speed) then
                value_49.speed = v247 * math.max(v251, math.abs(value_49.speed) - (a2 * 40))
            end
        end
    else
        return nil
    end
end
u31.pickEscapeLane = function(a1, a2)
    --[[
      name: pickEscapeLane
      line: 3462
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v252 = #a1.spec.laneCenters
    local oncomingLaneCount_3 = a1.spec.oncomingLaneCount
    local v253 = a2.laneIndex < oncomingLaneCount_3
    local v254
    if v253 then
        v254 = 0
    else
        v254 = oncomingLaneCount_3
    end
    local v255
    if v253 then
        v255 = oncomingLaneCount_3
    else
        v255 = v252
    end
    local v256 = -1
    local v257 = HIGHWAY_RIDER_CONFIG_upv_1.obstruction.swerveGapStuds
    local v258 = false
    local v258, v259, v256, v257 = v258, v254, v256, v257
    if v258 then
        v259 = v259 + 1
    else
        v258 = true
    end
    local v260 = nil
    if v259 < v255 then
        if v259 ~= a2.laneIndex then
            v260 = a1:laneBlockedByObstruction(v259)
            local v262
            if not v260 then
                v260 = math.huge
                local v261 = nil
                for v263, value_50 in a1.cars do
                    if not (value_50.active) or value_50 == a2 or value_50.laneIndex ~= v259 then
                        continue
                    end
                    v261 = math.abs(value_50.s - a2.s) - (a2.halfLength + value_50.halfLength)
                    if v261 < v260 then
                        v260 = v261
                    end
                end
                if v257 < v260 then
                    v256, v257 = v259, v260
                end
            end
        end
        if v258 then
            v259 = v259 + 1
        else
            v258 = true
        end
    end
    return v256
end
u31.knockObstructionProp = function(a1, a2, a3, a4)
    --[[
      name: knockObstructionProp
      line: 3505
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local fling_4 = HIGHWAY_RIDER_CONFIG_upv_1.obstruction.fling
    a3.knocked = true
    a3.shown = true
    a1:resetFling(a3)
    local s_1 = a2.s
    local offsetZ_1 = a2.visual.props[a3.index + 1]
    if offsetZ_1 ~= nil then
        offsetZ_1 = offsetZ_1.offsetZ
    end
    local v262
    if offsetZ_1 ~= nil then
        v262 = offsetZ_1
    else
        v262 = 0
    end
    a3.s = s_1 + v262
    a3.renderPrevS = a3.s
    a3.x = a4
    local v263 = a4 - a1.playerX
    local v264
    if math.abs(v263) <= 0.001 then
        v264 = ((a4 < 0) and -1) or 1
    else
        v264 = math.sign(v263)
    end
    a3.flungLateralVelocity = v264 * fling_4.lateralStuds
    a3.flungVerticalVelocity = fling_4.upStuds
    a3.speed = fling_4.forwardStuds
    local spinPerSecond_1 = fling_4.spinPerSecond
    a3.flungAngularX = a1.random:NextNumber(-spinPerSecond_1, spinPerSecond_1)
    a3.flungAngularY = a1.random:NextNumber(-spinPerSecond_1, spinPerSecond_1)
    a3.flungAngularZ = a1.random:NextNumber(-spinPerSecond_1, spinPerSecond_1)
end
u31.renderObstruction = function(a1, a2, a3, a4)
    --[[
      name: renderObstruction
      line: 3537
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    local activeObstruction_7 = a1.activeObstruction
    if activeObstruction_7 ~= nil then
        local visual_5 = activeObstruction_7.visual
        for _, value_51 in activeObstruction_7.props do
            if not (value_51.shown) then
                continue
            end
            if value_51.knocked then
                visual_5:poseFlung(value_51.index, a2, value_51.x, 0 + lerp_upv_1(value_51.renderPrevFlungHeight, value_51.flungHeight, a4), lerp_upv_1(value_51.renderPrevS, value_51.s, a4) - a3, CFrame.fromOrientation(lerp_upv_1(value_51.renderPrevFlungPitch, value_51.flungPitch, a4), lerp_upv_1(value_51.renderPrevFlungYaw, value_51.flungYaw, a4), lerp_upv_1(value_51.renderPrevFlungRoll, value_51.flungRoll, a4)))
            else
                visual_5:poseAt(value_51.index, a2, 0, activeObstruction_7.s - a3)
            end
        end
    else
        return nil
    end
end
u31.resetObstructions = function(a1)
    --[[
      name: resetObstructions
      line: 3555
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
    ]]
    a1:retireObstruction()
    for _, value_52 in a1.obstructions do
        value_52.active = false
        value_52.visual:park()
    end
    a1.obstructionIndex = 0
    if a1.systems.obstruction and #a1.obstructions ~= 0 then
        local obstruction_3 = HIGHWAY_RIDER_CONFIG_upv_1.obstruction
        a1.nextObstructionAt = math.max(a1.elapsed, obstruction_3.firstEarliestSeconds + (deriveRandom_upv_1(a1.context.getRunSeed(), 39939):NextNumber() * obstruction_3.firstSpreadSeconds))
    else
        a1.nextObstructionAt = math.huge
        return nil
    end
end
u31.buildEmergencyGlow = function(a1, a2)
    --[[
      name: buildEmergencyGlow
      line: 3570
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local laneGlow_2 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.laneGlow
    for _ = 0, HIGHWAY_RIDER_CONFIG_upv_1.emergency.maxConcurrent - 1 do
        local tbl_22 = {}
        local v265 = nil
        for v268 = 0, laneGlow_2.rungCount - 1 do
            local v266 = makeSmoothPart_upv_1(a2)
            v266.Size = Vector3.new(a1.laneSpacing * laneGlow_2.laneWidthFactor, laneGlow_2.thickness, laneGlow_2.rungDepthStuds)
            v266.Color = u2
            v266.Transparency = 1
            v266.CFrame = u1
            v265 = nil
            if laneGlow_2.neonTick then
                local v267 = makeSmoothPart_upv_1(a2)
                v267.Material = Enum.Material.Neon
                v267.Size = Vector3.new(laneGlow_2.neonTickStuds, laneGlow_2.thickness, laneGlow_2.rungDepthStuds * 0.35)
                v267.Color = u2
                v267.Transparency = 1
                v267.CFrame = u1
                v265 = v267
            end
            table.insert(tbl_22, {bar = v266, tick = v265})
        end
        table.insert(a1.glowLanes, {rungs = tbl_22})
    end
end
u31.renderEmergencyGlow = function(a1, a2, a3)
    --[[
      name: renderEmergencyGlow
      line: 3610
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u3 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local laneGlow_3 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.laneGlow
    local v268 = laneGlow_3.rungCount * laneGlow_3.spacingStuds
    local v269 = -1
    local v270 = -1
    local v272 = nil
    for n_18 = 0, #a1.glowLanes - 1 do
        v272 = a1.glowLanes[n_18 + 1]
        if (v272.visible) and v270 < v272.intensity then
            v270, v269 = v272.intensity, n_18
        end
    end
    for n_19 = 0, #a1.glowLanes - 1 do
        local v273
        v273 = a1.glowLanes[n_19 + 1]
        if v273.visible then
            local v274 = ((v273.phase >= 0.5) and 1) or 0
            local v275 = math.floor(v273.intensity * laneGlow_3.intensitySteps)
            local v276 = n_19 == v269
            local v277 = v274 ~= v273.bank
            local v278 = v275 ~= v273.step
            local v279 = v276 ~= v273.tickShown
            v273.bank = v274
            v273.step = v275
            v273.tickShown = v276
            if v274 ~= 0 then
                v272 = u3
            else
                v272 = u2
            end
            local v280 = 1 - (1 - laneGlow_3.minTransparency) * v273.intensity
            for n_20 = 0, #v273.rungs - 1 do
                local v281
                v281 = v273.rungs[n_20 + 1]
                local v282 = ((((n_20 * laneGlow_3.spacingStuds) - a3) % v268) + v268) % v268 + laneGlow_3.nearAheadStuds
                v281.bar.CFrame = CFrame.new(a2 + Vector3.new(v273.laneX, 0.05, v282))
                if v277 then
                    v281.bar.Color = v272
                end
                if v278 then
                    v281.bar.Transparency = v280
                end
                local v283
                v283 = v281.tick
                if v283 == nil then
                    continue
                end
                local v284
                if v276 then
                    v284 = CFrame.new(a2 + Vector3.new(v273.laneX, 0.1, v282))
                else
                    v284 = u1
                end
                v283.CFrame = v284
                if v277 then
                    v283.Color = v272
                end
                if v278 or v279 then
                    v283.Transparency = v280
                end
            end
            continue
        else
            if v273.step >= 0 then
                a1:parkGlowLane(v273)
                continue
            end
            if v273.bank >= 0 then
                a1:parkGlowLane(v273)
            end
        end
        local v283
    end
end
u31.renderOil = function(a1, a2, a3)
    --[[
      name: renderOil
      line: 3685
    ]]
    for _, value_53 in a1.oilSlicks do
        if value_53.active then
            value_53.part.CFrame = CFrame.new(a2 + Vector3.new(value_53.x, -0.02, value_53.s - a3)) * CFrame.Angles(0, 0, 1.5707963267948966)
        end
    end
    for _, value_54 in a1.oilDroplets do
        if value_54.life > 0 then
            value_54.part.CFrame = CFrame.new(a2 + Vector3.new(value_54.x, 0 + value_54.y, value_54.s - a3))
        end
    end
end
u31.mountBiomeDebug = function(a1, a2)
    --[[
      name: mountBiomeDebug
      line: 3706
      upvalues:
        DIRECTOR_EVENTS_upv_1 (copy, index: 1)
        directorEventLabel_upv_1 (copy, index: 2)
        mountBiomeDebugPanel_upv_1 (copy, index: 3)
    ]]
    local tbl_23 = {}
    local run_1 = nil
    for _, value_upv_55 in DIRECTOR_EVENTS_upv_1 do
        run_1 = function()
            --[[
              name: run
              line: 3714
              upvalues:
                a1 (copy, index: 1)
                value_upv_55 (copy, index: 2)
            ]]
            return a1:forceEvent(value_upv_55.kind)
        end
        table.insert(tbl_23, {label = directorEventLabel_upv_1(value_upv_55.kind), run = run_1})
    end
    local v285 = nil
    for u35 = 0, #a1.obstructions - 1 do
        v285 = function()
            --[[
              name: run
              line: 3727
              upvalues:
                a1 (copy, index: 1)
                u35 (copy, index: 2)
            ]]
            a1:retireObstruction()
            a1:spawnObstruction(u35)
        end
        table.insert(tbl_23, {label = string.upper(a1.obstructions[u35 + 1].visual.name), run = v285})
    end
    if a2:biomeCount() <= 1 and #tbl_23 == 0 then
        return nil
    end
    local tbl_24 = {}
    local u35
    u35, v285 = false, 0
    while true do
        if u35 then
            v285 = v285 + 1
        else
            u35 = true
        end
        if v285 >= a2:biomeCount() then
            break
        end
        table.insert(tbl_24, (a2:biomeName(v285)))
    end
    local function onPin_1(a3)
        --[[
          name: onPin
          line: 3760
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.biomeOverride = a3
        a1:resyncChunkBiomes()
    end
    local function readStatus_1()
        --[[
          name: readStatus
          line: 3757
          upvalues:
            a1 (copy, index: 1)
            a2 (copy, index: 2)
        ]]
        return (("clock %* \194\183 t %*s"):format(a1:biomeOrdinal() % a2:biomeCount(), math.floor(a1.elapsed)))
    end
    mountBiomeDebugPanel_upv_1({janitor = a1.context.janitor, biomeLabels = tbl_24, readStatus = readStatus_1, onPin = onPin_1, actions = tbl_23})
end
u31.buildSpeedLabels = function(a1, a2)
    --[[
      name: buildSpeedLabels
      line: 3769
      upvalues:
        u1 (copy, index: 1)
        u15 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    local v286 = Instance.new("Part")
    v286.Anchored = true
    v286.CanCollide = false
    v286.CanQuery = false
    v286.CanTouch = false
    v286.Transparency = 1
    v286.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v286.CFrame = u1
    v286.Parent = a2
    local v287 = Instance.new("BillboardGui")
    v287.Size = UDim2.fromScale(8, 2.6)
    v287.LightInfluence = 0
    v287.Parent = v286
    local v288 = Instance.new("TextLabel")
    v288.BackgroundTransparency = 1
    v288.Size = UDim2.fromScale(1, 0.42)
    v288.Font = Enum.Font.GothamBlack
    v288.TextScaled = true
    v288.TextColor3 = u15
    v288.TextStrokeTransparency = 0.4
    v288.Parent = v287
    local v289 = Instance.new("TextLabel")
    v289.BackgroundTransparency = 1
    v289.Position = UDim2.fromScale(0, 0.42)
    v289.Size = UDim2.fromScale(1, 0.58)
    v289.Font = Enum.Font.GothamBlack
    v289.TextScaled = true
    v289.TextColor3 = u16
    v289.TextStrokeTransparency = 0.4
    v289.Parent = v287
    a1.labelsPart = v286
    a1.speedLabel = v288
    a1.distanceLabel = v289
end
u31.roundStartSpeed = function(a1)
    --[[
      name: roundStartSpeed
      line: 3804
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.spec.speedControl then
        return HIGHWAY_RIDER_CONFIG_upv_1.directDrive.startSpeed
    end
    return HIGHWAY_RIDER_CONFIG_upv_1.speedStart
end
u31.resetRound = function(a1)
    --[[
      name: resetRound
      line: 3807
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        kitTouchInput_upv_1 (copy, index: 2)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.trafficSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    a1.trafficRandom = Random.new(a1.trafficSeed)
    table.clear(a1.densityWaveValues)
    a1.dead = false
    a1.spectating = false
    a1.spectateAnchorS = 0
    a1.spectateLeadStuds = 0
    a1.deathCameraCFrame = nil
    a1.playerS = 0
    a1.playerX = ((not (a1.spec.speedControl)) and (a1.spec.laneCenters[#a1.spec.laneCenters] - 3)) or (a1.spec.laneCenters[#a1.spec.laneCenters - 1])
    a1.renderPrevS = a1.playerS
    a1.renderPrevX = a1.playerX
    a1.steerVelocity = 0
    kitTouchInput_upv_1:reset()
    a1.keyHeldSeconds = 0
    a1.lastKeyDirection = 0
    a1.steerFadeTarget = 0
    a1.steerFade = 0
    a1.wheelAngle = 0
    a1.elapsed = 0
    a1.runSeconds = 0
    a1.speed = a1:roundStartSpeed()
    a1.distance:reset()
    a1.nearMissScore = 0
    a1.oncomingScore = 0
    a1.oncomingAccumulator = 0
    a1.wheelieScore = 0
    a1.wheelieAccumulator = 0
    a1.lastReported = -1
    a1.belowFloorSeconds = 0
    a1.nearMissCombo = 0
    a1.bestNearMissCombo = 0
    a1.lastNearMissElapsed = -math.huge
    a1.wheelieActive = false
    a1.wheeliePose = 0
    a1.wheelieComboSeconds = 0
    a1.wheelieGraceRemaining = 0
    a1.wheelieTierIndex = 0
    a1:resetWheelieFlame()
    a1.pressHeld = false
    a1.pressHeldSeconds = 0
    a1.timeScale = 1
    a1.invulnRemaining = 0
    a1.smoothedCameraX = a1.playerX
    a1.currentRoll = 0
    a1.bodyYaw = 0
    a1.lookSpringX = a1.playerX * a1.spec.camera.lookXFactor
    a1.lookSpringVelocity = 0
    a1.closeCallCount = 0
    a1:resetWreck()
    a1.lastDisplaySpeed = -1
    a1.lastDistanceTenths = -1
    a1.orbitElapsed = ((a1.spec.speedControl) and 0) or (HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds)
    a1:stopEngine()
    a1.engineAudio:stop()
    a1:hideSpeedSign()
    for _, v290 in a1.cars do
        a1:parkCar(v290)
    end
    a1.vehicle:park()
    local rider_4 = a1.rider
    if rider_4 ~= nil then
        rider_4:park()
    end
    a1:resetDecor()
    table.clear(a1.laneSpeeds)
    for n_21 = 0, #a1.spec.laneCenters - 1 do
        local v290 = a1.laneSpeeds
        local v291
        if n_21 >= a1.spec.oncomingLaneCount then
            v291 = a1.trafficRandom:NextNumber(HIGHWAY_RIDER_CONFIG_upv_1.sameDirSpeedMin, HIGHWAY_RIDER_CONFIG_upv_1.sameDirSpeedMax)
        else
            v291 = -a1.trafficRandom:NextNumber(HIGHWAY_RIDER_CONFIG_upv_1.oncomingSpeedMin, HIGHWAY_RIDER_CONFIG_upv_1.oncomingSpeedMax)
        end
        table.insert(v290, v291)
    end
    a1.spawnFadeSuppressed = true
    local v292, v293
    v292, v293 = false, 60
    while true do
        if v292 then
            v293 = v293 + a1:drawSpawnGap()
        else
            v292 = true
        end
        if v293 > HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance then
            break
        end
        a1:trySpawnCar(v293)
    end
    a1.spawnFadeSuppressed = false
    a1.nextSpawnCheckS = a1:drawSpawnGap()
    a1:resetEmergency()
    a1:resetSpecials()
    a1:resetObstructions()
    a1:resetDirector()
    a1:resyncChunkBiomes()
    a1.context.reportScore(0)
end
u31.captureRound = function(a1)
    --[[
      name: captureRound
      line: 3920
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if not a1.dead and not a1.airborne and not a1.onRamp and a1.slipRemaining <= 0 and a1.flungCount <= 0 then
        local tbl_upv_25 = {}
        local v294 = 0
        for _, value_56 in a1.cars do
            if value_56.active == true then
                v294 = v294 + 1
                tbl_upv_25[v294] = value_56
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 3949
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_25 (copy, index: 2)
                ]]
                a2:num(a1.playerS):num(a1.playerX):num(a1.speed):num(a1.steerVelocity)
                a2:num(a1.wheelAngle):num(a1.elapsed):num(a1.runSeconds):num(a1.distance:studs())
                a2:int(a1.nearMissScore):int(a1.oncomingScore):num(a1.oncomingAccumulator)
                a2:int(a1.wheelieScore):num(a1.wheelieAccumulator)
                a2:int(a1.nearMissCombo):int(a1.bestNearMissCombo):int(a1.closeCallCount)
                a2:bool(a1.wheelieActive):num(a1.wheeliePose):num(a1.wheelieComboSeconds)
                a2:num(a1.wheelieGraceRemaining):int(a1.wheelieTierIndex)
                a2:num(a1.invulnRemaining):num(a1.nextSpawnCheckS)
                a2:int(#a1.laneSpeeds)
                for _, value_57 in a1.laneSpeeds do
                    a2:num(value_57)
                end
                a2:int(#tbl_upv_25)
                for _, value_58 in tbl_upv_25 do
                    a2:num(value_58.s):num(value_58.x):num(value_58.speed):int(value_58.laneIndex):num(value_58.halfLength)
                end
            end
        )
    end
    return nil
end
u31.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 3968
      upvalues:
        readResume_upv_1 (copy, index: 1)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 2)
        kitTouchInput_upv_1 (copy, index: 3)
        deriveSeed_upv_1 (copy, index: 4)
    ]]
    local v295 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 3969
            ]]
            local tbl_26 = {}
            tbl_26.playerS = a3:num()
            tbl_26.playerX = a3:num()
            tbl_26.speed = a3:num()
            tbl_26.steerVelocity = a3:num()
            tbl_26.wheelAngle = a3:num()
            tbl_26.elapsed = a3:num()
            tbl_26.runSeconds = a3:num()
            tbl_26.studs = a3:num()
            tbl_26.nearMissScore = a3:int()
            tbl_26.oncomingScore = a3:int()
            tbl_26.oncomingAccumulator = a3:num()
            tbl_26.wheelieScore = a3:int()
            tbl_26.wheelieAccumulator = a3:num()
            tbl_26.nearMissCombo = a3:int()
            tbl_26.bestNearMissCombo = a3:int()
            tbl_26.closeCallCount = a3:int()
            tbl_26.wheelieActive = a3:bool()
            tbl_26.wheeliePose = a3:num()
            tbl_26.wheelieComboSeconds = a3:num()
            tbl_26.wheelieGraceRemaining = a3:num()
            tbl_26.wheelieTierIndex = a3:int()
            tbl_26.invulnRemaining = a3:num()
            tbl_26.nextSpawnCheckS = a3:num()
            local v296 = a3:int()
            local tbl_27 = {}
            local v297 = 0
            local tbl_28 = false
            tbl_28, v297 = tbl_28, v297
            while true do
                if tbl_28 then
                    v297 = v297 + 1
                else
                    tbl_28 = true
                end
                if v297 >= v296 then
                    break
                end
                table.insert(tbl_27, (a3:num()))
            end
            v297 = a3:int()
            tbl_28 = {}
            local v298 = 0
            local v299 = false
            v299, v298 = v299, v298
            while true do
                if v299 then
                    v298 = v298 + 1
                else
                    v299 = true
                end
                if v298 >= v297 then
                    break
                end
                table.insert(tbl_28, {s = a3:num(), x = a3:num(), speed = a3:num(), laneIndex = a3:int(), halfLength = a3:num()})
            end
            v298 = table.clone(tbl_26)
            setmetatable(v298, nil)
            v298.laneSpeeds = tbl_27
            v298.cars = tbl_28
            return v298
        end
    )
    if v295 ~= nil and #v295.laneSpeeds == #a1.spec.laneCenters and #a1.cars >= #v295.cars then
        a1.roundToken = a1.roundToken + 1
        a1.dead = false
        a1.deathCameraCFrame = nil
        a1.playerS = v295.playerS
        a1.playerX = v295.playerX
        a1.renderPrevS = v295.playerS
        a1.renderPrevX = v295.playerX
        a1.speed = a1:roundStartSpeed()
        a1.steerVelocity = v295.steerVelocity
        a1.wheelAngle = v295.wheelAngle
        a1.elapsed = v295.elapsed
        a1.runSeconds = v295.runSeconds
        a1.distance:restore(v295.studs)
        a1.nearMissScore = v295.nearMissScore
        a1.oncomingScore = v295.oncomingScore
        a1.oncomingAccumulator = v295.oncomingAccumulator
        a1.wheelieScore = v295.wheelieScore
        a1.wheelieAccumulator = v295.wheelieAccumulator
        a1.nearMissCombo = v295.nearMissCombo
        a1.bestNearMissCombo = v295.bestNearMissCombo
        a1.closeCallCount = v295.closeCallCount
        a1.wheelieActive = v295.wheelieActive
        a1.wheeliePose = v295.wheeliePose
        a1.wheelieComboSeconds = v295.wheelieComboSeconds
        a1.wheelieGraceRemaining = v295.wheelieGraceRemaining
        a1.wheelieTierIndex = v295.wheelieTierIndex
        a1.invulnRemaining = math.max(v295.invulnRemaining, HIGHWAY_RIDER_CONFIG_upv_1.reviveInvulnSeconds)
        a1.nextSpawnCheckS = v295.nextSpawnCheckS
        a1.lastReported = -1
        a1.lastNearMissElapsed = -math.huge
        a1.belowFloorSeconds = 0
        a1.lastDisplaySpeed = -1
        a1.lastDistanceTenths = -1
        a1.pressHeld = false
        a1.pressHeldSeconds = 0
        a1.keyHeldSeconds = 0
        a1.lastKeyDirection = 0
        a1.steerFadeTarget = 0
        a1.steerFade = 0
        a1.timeScale = 1
        a1.smoothedCameraX = a1.playerX
        a1.currentRoll = 0
        a1.bodyYaw = 0
        a1.lookSpringX = a1.playerX * a1.spec.camera.lookXFactor
        a1.lookSpringVelocity = 0
        a1.orbitElapsed = HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds
        kitTouchInput_upv_1:reset()
        a1:resetWheelieFlame()
        a1:resetWreck()
        table.clear(a1.laneSpeeds)
        for _, value_59 in v295.laneSpeeds do
            table.insert(a1.laneSpeeds, value_59)
        end
        for _, value_60 in a1.cars do
            a1:parkCar(value_60)
        end
        local v300, v301 = nil, nil
        local v302 = nil
        local value_61 = nil
        local v303 = nil
        local key_3 = nil
        local value_62 = nil
        local value_63 = nil
        local v304 = nil
        local v305 = nil
        local v306 = nil
        local v307 = nil
        for _, value_63 in v295.cars do
            v302 = nil
            for v308, value_62 in a1.cars do
                key_3 = not value_62.active
                if key_3 then
                    value_61 = value_62.visual
                    if value_61 ~= nil then
                        value_61 = value_61.emergency
                    end
                    if value_61 == nil then
                        key_3 = true
                    else
                        key_3 = false
                    end
                    if key_3 then
                        v303 = value_62.visual
                        if v303 ~= nil then
                            v303 = v303.special
                        end
                        if v303 == nil then
                            key_3 = true
                        else
                            key_3 = false
                        end
                    end
                end
                v304 = key_3 and (math.abs(value_62.halfLength - value_63.halfLength) < 0.01)
                if v304 ~= true then
                    key_3 = not value_62.active
                    if key_3 then
                        value_61 = value_62.visual
                        if value_61 ~= nil then
                            value_61 = value_61.emergency
                        end
                        if value_61 == nil then
                            key_3 = true
                        else
                            key_3 = false
                        end
                        if key_3 then
                            v303 = value_62.visual
                            if v303 ~= nil then
                                v303 = v303.special
                            end
                            if v303 == nil then
                                key_3 = true
                            else
                                key_3 = false
                            end
                        end
                    end
                    v304 = key_3 and (math.abs(value_62.halfLength - value_63.halfLength) < 0.01)
                    continue
                else
                    v302 = value_62
                end
            end
            if v302 ~= nil then
                v301 = v302
            else
                v300 = nil
                for key_3, value_61 in a1.cars do
                    v305 = not value_61.active
                    if v305 then
                        v306 = value_61.visual
                        if v306 ~= nil then
                            v306 = v306.emergency
                        end
                        if v306 == nil then
                            v305 = true
                        else
                            v305 = false
                        end
                        if v305 then
                            v307 = value_61.visual
                            if v307 ~= nil then
                                v307 = v307.special
                            end
                            if v307 == nil then
                                v305 = true
                            else
                                v305 = false
                            end
                        end
                    end
                    if v305 == true then
                        v300 = value_61
                        break
                    end
                end
                v301 = v300
            end
            if v301 == nil then
                break
            end
            v301.active = true
            v301.s = value_63.s
            v301.renderPrevS = value_63.s
            v301.x = value_63.x
            if value_63.speed <= 0 then
                v300 = value_63.speed
            else
                v300 = math.min(value_63.speed, a1.speed)
            end
            v301.speed = v300
            v301.laneIndex = value_63.laneIndex
            v301.overlapping = false
            v301.minGap = math.huge
            v301.nearMissAwarded = false
            v301.ageSeconds = math.huge
        end
        a1:resetDecor()
        a1.trafficRandom = Random.new(deriveSeed_upv_1(a1.trafficSeed, math.floor(a1.playerS) + 1))
        table.clear(a1.densityWaveValues)
        a1:resetEmergency()
        a1:resetSpecials()
        a1:resetObstructions()
        a1:resetDirector()
        a1:resyncChunkBiomes()
        a1.context.reportScore(a2.score)
        return true
    end
    return false
end
u31.resetDecor = function(a1)
    --[[
      name: resetDecor
      line: 4188
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _, value_64 in a1.decorCars do
        value_64.s = a1.playerS + a1.random:NextNumber(-40, HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance)
        value_64.renderPrevS = value_64.s
        value_64.x = a1:drawDecorLaneX()
        value_64.speed = -a1.random:NextNumber(30, 42)
    end
end
u31.drawDecorLaneX = function(a1)
    --[[
      name: drawDecorLaneX
      line: 4196
      upvalues:
        tbl_upv_3 (copy, index: 2)
    ]]
    return tbl_upv_3[a1.random:NextInteger(0, #tbl_upv_3 - 1) + 1]
end
u31.snapshot = function(a1)
    --[[
      name: snapshot
      line: 4200
    ]]
    local tbl_29 = {}
    tbl_29.score = a1:totalScore()
    tbl_29.values = {a1.playerX, math.clamp(a1.speed / a1.speedMax, 0, 1), a1.distance:current()}
    return tbl_29
end
u31.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 4206
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local tbl_30 = {}
        tbl_30.createBody = function()
            --[[
              name: createBody
              line: 4212
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:createGhostBody()
        end
        local u36 = GhostPool_upv_1.new(a1.stage.container, tbl_30)
        a1.ghostPool = u36
        a1.context.janitor:Add(
            function()
                --[[
                  line: 4217
                  upvalues:
                    u36 (copy, index: 1)
                ]]
                return u36:destroy()
            end
        )
    end
end
u31.createGhostBody = function(a1)
    --[[
      name: createGhostBody
      line: 4222
      upvalues:
        CarRig_upv_1 (copy, index: 1)
        BikeRig_upv_1 (copy, index: 2)
    ]]
    local u37 = Instance.new("Folder")
    u37.Name = "GhostRider"
    u37.Parent = a1.stage.container
    local u38
    if a1.mode ~= "tp" then
        u38 = BikeRig_upv_1.new(u37)
    else
        u38 = CarRig_upv_1.new(u37)
    end
    local v308 = u37:FindFirstChildWhichIsA("BasePart", true)
    if v308 ~= nil then
        local u39 = 0
        local tbl_31 = {}
        tbl_31.root = u37
        tbl_31.anchor = v308
        tbl_31.pose = function(a2, a3, a4)
            --[[
              name: pose
              line: 4236
              upvalues:
                u39 (ref,  index: 1)
                u38 (copy, index: 2)
            ]]
            u39 = u39 + ((math.abs(a3.Z) + 40) * a4)
            local v309 = math.clamp(-a3.X * 0.02, -0.22, 0.22)
            u38:pose(CFrame.new(a2) * CFrame.Angles(0, 0, v309), u39)
        end
        tbl_31.destroy = function()
            --[[
              name: destroy
              line: 4245
              upvalues:
                u37 (copy, index: 1)
            ]]
            return u37:Destroy()
        end
        return tbl_31
    end
    u37:Destroy()
    return nil
end
u31.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 4250
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local ghostPool_1 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_1 ~= nil and matchOpponents_1 ~= nil then
        local v310 = a1.distance:current()
        local v311, v312 = nil, nil
        local v313 = nil
        local v314 = nil
        local v315 = nil
        for _, value_65 in matchOpponents_1 do
            v314 = value_65.snapshot
            if v314 == nil then
                continue
            end
            v311 = v314.values[1]
            if v311 == nil then
                v311 = 0
            end
            v313 = math.clamp(v311, -a1.spec.roadHalfWidth, a1.spec.roadHalfWidth)
            v312 = v314.values[3]
            if v312 == nil then
                v312 = 0
            end
            v315 = (v312 - v310) * HIGHWAY_RIDER_CONFIG_upv_1.studsPerPoint - a1.spectateLeadStuds
            if v315 < -30 then
                continue
            end
            if v315 <= 350 then
                ghostPool_1:show(value_65.userId, value_65.username, a1.stage.origin + Vector3.new(v313, 0, v315), value_65.alive)
            end
        end
        ghostPool_1:step(a2)
    else
        return nil
    end
end
u31.start = function(a1)
    --[[
      name: start
      line: 4289
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    BaseWorldGame_upv_1.start(a1)
    a1:zeroTilt()
    a1.engineAudio:playIgnition()
end
u31.resumeStart = function(a1)
    --[[
      name: resumeStart
      line: 4294
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    BaseWorldGame_upv_1.resumeStart(a1)
    a1:zeroTilt()
end
u31.zeroTilt = function(a1)
    --[[
      name: zeroTilt
      line: 4298
      upvalues:
        tiltInput_upv_1 (copy, index: 1)
    ]]
    tiltInput_upv_1:calibrate()
end
u31.revive = function(a1)
    --[[
      name: revive
      line: 4301
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.deathCameraCFrame = nil
    local rider_5 = a1.rider
    if rider_5 ~= nil then
        rider_5:park()
    end
    a1.invulnRemaining = HIGHWAY_RIDER_CONFIG_upv_1.reviveInvulnSeconds
    a1.steerVelocity = 0
    a1.keyHeldSeconds = 0
    a1.lastKeyDirection = 0
    a1.steerFadeTarget = 0
    a1.steerFade = 0
    a1.nearMissCombo = 0
    a1.lastNearMissElapsed = -math.huge
    a1.wheelieActive = false
    a1.wheeliePose = 0
    a1.wheelieComboSeconds = 0
    a1.wheelieGraceRemaining = 0
    a1.wheelieTierIndex = 0
    a1:resetWheelieFlame()
    a1.pressHeld = false
    a1.pressHeldSeconds = 0
    a1.belowFloorSeconds = 0
    a1.timeScale = 1
    a1.bodyYaw = 0
    a1:resetWreck()
    a1.orbitElapsed = HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds
    a1.lookSpringX = a1.playerX * a1.spec.camera.lookXFactor
    a1.lookSpringVelocity = 0
    a1:stopEngine()
    a1.engineAudio:stop()
    a1:hideSpeedSign()
    a1.playerX = math.clamp(a1.playerX, -(a1.spec.barrierX - 3), a1.spec.barrierX - 3)
    a1.renderPrevS = a1.playerS
    a1.renderPrevX = a1.playerX
    a1.speed = math.max(a1:roundStartSpeed(), a1.speed * HIGHWAY_RIDER_CONFIG_upv_1.reviveSpeedFactor)
    local v316 = nil
    for _, value_66 in a1.cars do
        if not (value_66.active) then
            continue
        end
        v316 = value_66.s - a1.playerS
        if -HIGHWAY_RIDER_CONFIG_upv_1.reviveClearBehind >= v316 then
            continue
        end
        if v316 < HIGHWAY_RIDER_CONFIG_upv_1.reviveClearAhead then
            a1:parkCar(value_66)
        end
    end
    a1.vehicle:park()
    a1:zeroTilt()
    a1:setRunning(true)
end
u31.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 4356
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        highwayControlsAtom_upv_1 (copy, index: 2)
        kitTouchInput_upv_1 (copy, index: 3)
        UserInputService_upv_1 (copy, index: 4)
        gamepadInput_upv_1 (copy, index: 5)
        tiltInput_upv_1 (copy, index: 6)
        highwaySteerFactor_upv_1 (copy, index: 7)
        effectiveThrottle_upv_1 (copy, index: 8)
        highwayThrottleFactor_upv_1 (copy, index: 9)
        approach_upv_1 (copy, index: 10)
    ]]
    a1.renderPrevS = a1.playerS
    a1.renderPrevX = a1.playerX
    a1.renderPrevY = a1.playerY
    local v317, v318 = nil, nil
    if a1.dead then
        a1:advanceTrafficAfterCrash(a2)
        a1:advanceDecor(a2)
        a1:updateWreckTumble(a2)
        return nil
    else
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        a1.runSeconds = a1.runSeconds + a2
        a1:advanceDecor(a2)
        local v319 = a1.orbitElapsed < HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds
        if v319 then
            a1.orbitElapsed = a1.orbitElapsed + a2
        end
        local v320 = highwayControlsAtom_upv_1()
        local v321 = not v319 and (kitTouchInput_upv_1:isHeld("left") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Left) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.A) or (gamepadInput_upv_1:isDown(Enum.KeyCode.DPadLeft)))))
        local v322 = not v319 and (kitTouchInput_upv_1:isHeld("right") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Right) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.D) or (gamepadInput_upv_1:isDown(Enum.KeyCode.DPadRight)))))
        local v323 = (v321 and 1) or 0
        v317 = v323 - ((v322 and 1) or 0)
        if v317 == 0 or v317 ~= a1.lastKeyDirection then
            a1.keyHeldSeconds = 0
        else
            a1.keyHeldSeconds = a1.keyHeldSeconds + a2
        end
        a1.lastKeyDirection = v317
        local v324 = math.clamp(a1.keyHeldSeconds / a1.keySteerEaseInSeconds, 0, 1)
        local v325
        if a1.keySteerBaseStrength <= 0 then
            v325 = v324 * v324 * (3 - (v324 * 2))
        else
            v325 = v324
        end
        local v326 = false
        if v320.steering == "tilt" then
            v326 = tiltInput_upv_1:isAvailable()
        end
        if v326 and (v320.steering ~= a1.lastSteering or v319) then
            a1:zeroTilt()
        end
        a1.lastSteering = v320.steering
        local v327
        if not (v326) or v319 then
            v327 = 0
        else
            v327 = a1:readTiltSteer()
        end
        local v328 = (v319 and 0) or (-gamepadInput_upv_1:leftX())
        local v329 = math.clamp((v317 * (a1.keySteerBaseStrength + ((1 - a1.keySteerBaseStrength) * v325)) + v327) + v328, -1, 1)
        a1.steerFadeTarget = math.abs(v329)
        a1:updateWheelie(v329, a2)
        local v330 = ((not (a1.wheelieActive)) and 1) or (HIGHWAY_RIDER_CONFIG_upv_1.wheelie.steerAuthorityFactor)
        local v331 = ((v329 * a1.spec.maxSteerSpeed) * v330) * (((not (a1.airborne)) and 1) or (HIGHWAY_RIDER_CONFIG_upv_1.ramp.airSteerFactor)) * highwaySteerFactor_upv_1(v320)
        a1.steerVelocity = a1.steerVelocity + ((v331 - a1.steerVelocity) * (1 - math.exp(-a2 / (((a1.slipRemaining > 0) and (a1.steerResponseSeconds * HIGHWAY_RIDER_CONFIG_upv_1.oil.slipResponseFactor)) or (a1.steerResponseSeconds)))))
        a1.playerX = a1.playerX + (a1.steerVelocity * a2)
        v318 = a1.spec.barrierX - a1.spec.playerHalfWidth - 0.2
        if v318 <= math.abs(a1.playerX) then
            a1.playerX = math.clamp(a1.playerX, -v318, v318)
            a1.steerVelocity = 0
            a1.engineAudio:onBarrierClamp(a1:speedBandFraction())
        end
        a1.elapsed = a1.elapsed + a2
        local v332
        if UserInputService_upv_1.TouchEnabled then
            v332 = effectiveThrottle_upv_1(v320)
        else
            v332 = v320.throttle
        end
        local v333
        if v332 == "auto" then
            v333 = true
        else
            v333 = false
        end
        local v334 = kitTouchInput_upv_1:isHeld("gas") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Up) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.W) or (gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonR2))))
        local v335 = kitTouchInput_upv_1:isHeld("brake") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Down) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.S) or (gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonL2) or (v333 and (UserInputService_upv_1.TouchEnabled and (a1.pressHeld))))))
        local v336 = highwayThrottleFactor_upv_1(v320)
        if a1.spec.speedControl then
            local v337
            if v319 then
                v337 = 0
            elseif v335 then
                v337 = -1
            elseif v333 or v334 then
                v337 = 1
            else
                v337 = 0
            end
            if v337 <= 0 then
                if v337 < 0 then
                    a1.speed = math.max(a1.speed + (((HIGHWAY_RIDER_CONFIG_upv_1.directDrive.brakeRate * v336) * v337) * a2), HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed)
                end
            else
                a1.speed = math.min(a1.speed + (((HIGHWAY_RIDER_CONFIG_upv_1.directDrive.accelRate * v336) * v337) * a2), a1.speedMax)
            end
            a1.engineAudio:setThrottle(v337, a1:speedBandFraction())
        else
            local v338 = v333 or v334
            if v335 then
                a1.speed = math.max(a1.speed - ((HIGHWAY_RIDER_CONFIG_upv_1.fpDrive.brakeRate * v336) * a2), HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed)
            elseif v338 then
                a1.speed = math.min(a1.speed + ((HIGHWAY_RIDER_CONFIG_upv_1.fpDrive.accelRate * v336) * a2), a1.speedMax)
            else
                a1.speed = math.max(a1.speed - (HIGHWAY_RIDER_CONFIG_upv_1.fpDrive.coastRate * a2), HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed)
            end
            a1.engineAudio:setThrottle((v335 and -1) or ((v338 and 1) or 0), a1:speedBandFraction())
        end
        local v339 = a1.speed * a2
        a1.playerS = a1.playerS + v339
        a1.wheelAngle = a1.wheelAngle + (math.min(a1.speed / 0.75, 15.707963267948966) * a2)
        local v340 = a1.spec.scoreFloorSpeed <= a1.speed
        local v341
        if v340 then
            v341 = 0
        else
            v341 = a1.belowFloorSeconds + a2
        end
        a1.belowFloorSeconds = v341
        local v342, v343 = nil, nil
        local v344 = nil
        local _ = nil
        local v345 = nil
        local v346 = nil
        local v347 = nil
        for v359, value_67 in a1.cars do
            v343 = not value_67.active
            if not (v343) then
                v342 = value_67.visual
                if v342 ~= nil then
                    v342 = v342.emergency
                end
                if v342 ~= nil then
                    v343 = true
                else
                    v343 = false
                end
            end
            if v343 then
                continue
            end
            v346 = nil
            v345 = math.huge
            for key_4, value_68 in a1.cars do
                if not (value_68.active) or value_68 == value_67 or value_68.laneIndex ~= value_67.laneIndex then
                    continue
                end
                v347 = ((value_67.speed < 0) and (value_67.s - value_68.s)) or (value_68.s - value_67.s)
                if v347 <= 0 or v347 >= (value_67.halfLength + value_68.halfLength) + 2 then
                    continue
                end
                if v347 < v345 then
                    v345, v346 = v347, value_68.speed
                end
            end
            if v346 == nil then
                continue
            end
            if value_67.speed < 0 then
                v344 = math.max(value_67.speed, v346)
            else
                v344 = math.min(value_67.speed, v346)
            end
            value_67.speed = v344
        end
        a1:updateRampContact(a2)
        a1:updateFlight(a2)
        a1:updateAirSpin(a2)
        local v348 = math.clamp((a1.speed - HIGHWAY_RIDER_CONFIG_upv_1.speedStart) / (a1.speedMax - HIGHWAY_RIDER_CONFIG_upv_1.speedStart), 0, 1)
        local v349 = nil
        local v350 = nil
        local v351 = nil
        local v352 = nil
        v345 = nil
        local v353 = nil
        local v354 = nil
        for v360, value_69 in a1.cars do
            if not (value_69.active) then
                continue
            end
            value_69.renderPrevS = value_69.s
            value_69.s = value_69.s + (value_69.speed * a2)
            value_69.ageSeconds = value_69.ageSeconds + a2
            if value_69.flung then
                a1:updateFling(value_69, a2)
            elseif value_69.x ~= value_69.targetX then
                value_69.x = approach_upv_1(value_69.x, value_69.targetX, HIGHWAY_RIDER_CONFIG_upv_1.emergency.yieldLerpPerSecond, a2)
            end
            v350 = value_69.s - a1.playerS
            v345 = value_69.visual
            if v345 ~= nil then
                v345 = v345.emergency
            end
            if v345 ~= nil then
                v344 = true
            else
                v344 = false
            end
            if v344 then
                v351 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.despawnBehindStuds
            else
                v351 = HIGHWAY_RIDER_CONFIG_upv_1.despawnBehindDistance
            end
            if v344 then
                v352 = HIGHWAY_RIDER_CONFIG_upv_1.emergency.despawnAheadStuds
            else
                v352 = HIGHWAY_RIDER_CONFIG_upv_1.despawnAheadDistance
            end
            if v350 >= -v351 and v352 >= v350 then
                if value_69.flung then
                    v353 = a1:flungExpired(value_69, v350)
                    if v353 then
                        a1:parkCar(value_69)
                    end
                else
                    local key_4 = math.abs(v350) <= (value_69.halfLength + a1.spec.playerHalfLength) - a1.collisionForgiveness
                    if key_4 then
                        local v355 = math.abs(value_69.x - a1.playerX)
                        v347 = v355 <= (value_69.halfWidth + a1.spec.playerHalfWidth) - a1.collisionForgiveness
                        if v347 and a1.airborne then
                            v354 = value_69.visual
                            if v354 ~= nil then
                                v354 = v354.height
                            end
                            if v354 ~= nil then
                                v349 = v354
                            else
                                v349 = 3.4
                            end
                            local v356 = 0 + v349
                            local v357
                            if a1.playerVerticalVelocity <= 0 then
                                v357 = true
                            else
                                v357 = false
                            end
                            if v357 and a1.bounceRemaining > 0 and math.abs(a1.playerY - v356) <= HIGHWAY_RIDER_CONFIG_upv_1.ramp.roofLandTolerance then
                                a1.bounceRemaining = a1.bounceRemaining - 1
                                a1.playerY = v356
                                a1.playerVerticalVelocity = -a1.playerVerticalVelocity * HIGHWAY_RIDER_CONFIG_upv_1.ramp.roofRestitution
                                a1.context.audio.play("thud", {})
                            end
                            if v355 < value_69.minGap then
                                value_69.minGap = v355
                            end
                            value_69.overlapping = true
                        elseif v347 then
                            if a1.invulnRemaining > 0 then
                                if v355 < value_69.minGap then
                                    value_69.minGap = v355
                                end
                                value_69.overlapping = true
                            elseif a1.onRamp then
                                if v355 < value_69.minGap then
                                    value_69.minGap = v355
                                end
                            else
                                a1:crash(math.sign(a1.playerX - value_69.x), value_69)
                                return nil
                            end
                        elseif v355 < value_69.minGap then
                            value_69.minGap = v355
                        end
                    else
                        if not (value_69.overlapping) then
                            continue
                        end
                        value_69.overlapping = false
                        if value_69.nearMissAwarded or v350 >= 0 or value_69.minGap > a1.spec.nearMissMaxGap or HIGHWAY_RIDER_CONFIG_upv_1.nearMissMinClosure > a1.speed - value_69.speed then
                            continue
                        end
                        value_69.nearMissAwarded = true
                        if v340 then
                            a1:awardNearMiss(value_69, v348)
                        end
                    end
                end
            else
                a1:parkCar(value_69)
                if v344 then
                    a1:retireEmergency(value_69)
                end
            end
        end
        if a1:updateObstructionContact() then
            return nil
        else
            a1:updateObstructionAvoidance(a2)
            while a1.nextSpawnCheckS <= a1.playerS do
                a1.nextSpawnCheckS = a1.nextSpawnCheckS + a1:drawSpawnGap()
                a1:trySpawnCar(HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance)
            end
            a1:updateEmergencies(a2)
            a1:updateSpecials(a2)
            a1:updateDirector()
            a1:updateObstructionWorld(a2)
            a1:updateObstructionSchedule()
            a1:updateOilWorld(a2)
            a1:updateSlip(a2)
            local v358, v358 = nil, nil
            if v340 then
                if a1.playerX <= a1.oncomingBoundaryX - a1.spec.playerHalfWidth then
                    a1.oncomingAccumulator = a1.oncomingAccumulator + (HIGHWAY_RIDER_CONFIG_upv_1.oncomingBonusPointsPerSecond * a2)
                    v358 = math.floor(a1.oncomingAccumulator)
                    if v358 > 0 then
                        a1.oncomingAccumulator = a1.oncomingAccumulator - v358
                        a1.oncomingScore = a1.oncomingScore + v358
                        a1:reportTotal()
                    end
                end
                if a1.wheelieActive then
                    a1.wheelieAccumulator = a1.wheelieAccumulator + ((HIGHWAY_RIDER_CONFIG_upv_1.wheelie.pointsPerSecond * a1:wheelieFactor()) * a2)
                    v358 = math.floor(a1.wheelieAccumulator)
                    if v358 > 0 then
                        a1.wheelieAccumulator = a1.wheelieAccumulator - v358
                        a1.wheelieScore = a1.wheelieScore + v358
                        a1:reportTotal()
                    end
                end
                if a1.distance:advance(v339) then
                    a1:reportTotal()
                end
            end
        end
    end
end
u31.updateWreckTumble = function(a1, a2)
    --[[
      name: updateWreckTumble
      line: 4696
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v359 = nil
    if a1.wreckActive then
        local crashTumble_2 = HIGHWAY_RIDER_CONFIG_upv_1.crashTumble
        a1.wreckPrevHeight = a1.wreckHeight
        a1.wreckPrevPitch = a1.wreckPitch
        a1.wreckPrevRoll = a1.wreckRoll
        a1.wreckPrevYaw = a1.wreckYaw
        local v360 = -a2
        local v361
        if a1.wreckGrounded then
            v361 = crashTumble_2.slideFrictionRate
        else
            v361 = crashTumble_2.airDragRate
        end
        local v362 = math.exp(v360 * v361)
        a1.wreckForwardSpeed = a1.wreckForwardSpeed * v362
        a1.wreckLateralVelocity = a1.wreckLateralVelocity * v362
        a1.playerS = a1.playerS + (a1.wreckForwardSpeed * a2)
        a1.playerX = a1.playerX + (a1.wreckLateralVelocity * a2)
        v359 = a1.spec.barrierX - a1.spec.playerHalfWidth - 0.2
        if v359 <= math.abs(a1.playerX) then
            a1.playerX = math.clamp(a1.playerX, -v359, v359)
            a1.wreckLateralVelocity = a1.wreckLateralVelocity * -crashTumble_2.barrierRestitution
            a1.context.audio.play("metalClank", {})
        end
        if a1.wreckGrounded then
            a1.wreckAngularY = a1.wreckAngularY * math.exp(-a2 * crashTumble_2.slideSpinDecayRate)
            a1.wreckYaw = a1.wreckYaw + (a1.wreckAngularY * a2)
            local v363 = math.min(a2 * crashTumble_2.flattenRate, 1)
            a1.wreckPitch = a1.wreckPitch + ((math.floor((a1.wreckPitch / math.pi) + 0.5) * math.pi - a1.wreckPitch) * v363)
            a1.wreckRoll = a1.wreckRoll + ((math.floor((a1.wreckRoll / math.pi) + 0.5) * math.pi - a1.wreckRoll) * v363)
        else
            a1.wreckVerticalVelocity = a1.wreckVerticalVelocity - (crashTumble_2.gravity * a2)
            a1.wreckHeight = a1.wreckHeight + (a1.wreckVerticalVelocity * a2)
            a1.wreckPitch = a1.wreckPitch + (a1.wreckAngularX * a2)
            a1.wreckYaw = a1.wreckYaw + (a1.wreckAngularY * a2)
            a1.wreckRoll = a1.wreckRoll + (a1.wreckAngularZ * a2)
            if a1.wreckHeight <= 0 and a1.wreckVerticalVelocity < 0 then
                local v364 = -a1.wreckVerticalVelocity
                a1.wreckHeight = 0
                a1.wreckForwardSpeed = a1.wreckForwardSpeed * crashTumble_2.bounceForwardKeep
                a1.wreckLateralVelocity = a1.wreckLateralVelocity * crashTumble_2.bounceLateralKeep
                a1.wreckAngularX = a1.wreckAngularX * crashTumble_2.bounceSpinKeep
                a1.wreckAngularY = a1.wreckAngularY * crashTumble_2.bounceSpinKeep
                a1.wreckAngularZ = a1.wreckAngularZ * crashTumble_2.bounceSpinKeep
                a1.wreckVerticalVelocity = v364 * crashTumble_2.restitution
                a1.context.audio.play("metalClank", {volume = math.clamp(0.25 + ((v364 / crashTumble_2.launchVerticalMax) * 0.5), 0.25, 0.75)})
                if a1.wreckVerticalVelocity < crashTumble_2.settleVerticalSpeed then
                    a1.wreckVerticalVelocity = 0
                    a1.wreckGrounded = true
                    a1.context.audio.play("tireScreech", {})
                end
                return
            end
        end
    end
    return nil
end
u31.resetWreck = function(a1)
    --[[
      name: resetWreck
      line: 4760
    ]]
    a1.wreckActive = false
    a1.wreckGrounded = false
    a1.wreckHeight = 0
    a1.wreckPrevHeight = 0
    a1.wreckVerticalVelocity = 0
    a1.wreckForwardSpeed = 0
    a1.wreckLateralVelocity = 0
    a1.wreckPitch = 0
    a1.wreckRoll = 0
    a1.wreckYaw = 0
    a1.wreckPrevPitch = 0
    a1.wreckPrevRoll = 0
    a1.wreckPrevYaw = 0
    a1.wreckAngularX = 0
    a1.wreckAngularY = 0
    a1.wreckAngularZ = 0
    a1.wreckRenderCenter = nil
    a1.crashCamStart = nil
end
u31.advanceTrafficAfterCrash = function(a1, a2)
    --[[
      name: advanceTrafficAfterCrash
      line: 4780
      upvalues:
        approach_upv_1 (copy, index: 1)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v365 = nil
    for _, value_70 in a1.cars do
        if not (value_70.active) then
            continue
        end
        value_70.renderPrevS = value_70.s
        value_70.s = value_70.s + (value_70.speed * a2)
        value_70.ageSeconds = value_70.ageSeconds + a2
        if value_70.flung then
            a1:updateFling(value_70, a2)
        elseif value_70.x ~= value_70.targetX then
            value_70.x = approach_upv_1(value_70.x, value_70.targetX, HIGHWAY_RIDER_CONFIG_upv_1.obstruction.swerveLerpPerSecond, a2)
        end
        v365 = value_70.s - a1.playerS
        if v365 < -HIGHWAY_RIDER_CONFIG_upv_1.despawnBehindDistance or HIGHWAY_RIDER_CONFIG_upv_1.despawnAheadDistance < v365 then
            a1:parkCar(value_70)
        end
    end
end
u31.advanceDecor = function(a1, a2)
    --[[
      name: advanceDecor
      line: 4804
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _, value_71 in a1.decorCars do
        value_71.renderPrevS = value_71.s
        value_71.s = value_71.s + (value_71.speed * a2)
        if value_71.s - a1.playerS < -60 then
            value_71.s = (a1.playerS + HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance) + a1.random:NextNumber(0, 60)
            value_71.renderPrevS = value_71.s
            value_71.x = a1:drawDecorLaneX()
            value_71.speed = -a1.random:NextNumber(30, 42)
        end
    end
end
u31.readTiltSteer = function(a1)
    --[[
      name: readTiltSteer
      line: 4816
      upvalues:
        tiltInput_upv_1 (copy, index: 1)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    return -tiltInput_upv_1:steer(HIGHWAY_RIDER_CONFIG_upv_1.tiltFullLockDegrees, HIGHWAY_RIDER_CONFIG_upv_1.tiltDeadZoneDegrees)
end
u31.updateWheelie = function(a1, a2, a3)
    --[[
      name: updateWheelie
      line: 4819
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
        gamepadInput_upv_1 (copy, index: 3)
    ]]
    local v366 = nil
    if a1.spec.canWheelie then
        if a1.pressHeld then
            a1.pressHeldSeconds = a1.pressHeldSeconds + a3
            if not (a1.wheelieActive) and HIGHWAY_RIDER_CONFIG_upv_1.wheelie.touchHoldMaxSteer <= math.abs(a2) then
                a1.pressHeldSeconds = 0
            end
        end
        local v367 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Up) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.W) or (gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonR2)))
        local v368 = a1.pressHeld and (HIGHWAY_RIDER_CONFIG_upv_1.wheelie.touchHoldSeconds <= a1.pressHeldSeconds)
        v366 = (v367 or v368) and (a1.speedMax - 0.5) <= a1.speed
        if v366 ~= a1.wheelieActive then
            a1.wheelieActive = v366
            if v366 then
                a1:startEngine()
                a1.context.audio.play("whoosh", {})
            end
        end
        a1:updateWheelieLadder(a3)
    else
        return nil
    end
end
u31.updateWheelieLadder = function(a1, a2)
    --[[
      name: updateWheelieLadder
      line: 4851
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local multiplier_1 = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.multiplier
    if a1.wheelieActive then
        a1.wheelieComboSeconds = a1.wheelieComboSeconds + a2
        a1.wheelieGraceRemaining = multiplier_1.comboGraceSeconds
    elseif a1.wheelieGraceRemaining > 0 then
        a1.wheelieGraceRemaining = a1.wheelieGraceRemaining - a2
        if a1.wheelieGraceRemaining <= 0 then
            a1.wheelieComboSeconds = 0
        end
    end
    local v369 = 0
    for n_22 = 0, #multiplier_1.milestones - 1 do
        if multiplier_1.milestones[n_22 + 1].atSeconds <= a1.wheelieComboSeconds then
            v369 = n_22
        end
    end
    local v370 = a1.wheelieTierIndex < v369
    a1.wheelieTierIndex = v369
    if not (a1.airborne) then
        local rider_6 = a1.rider
        if rider_6 ~= nil then
            rider_6:setClip(a1:ladderClip())
        end
    end
    a1:publishWheelieMeter()
    if v370 and multiplier_1.milestones[v369 + 1].factor >= 2 then
        a1.context.audio.play("flameIgnite", {pitch = (v369 * 0.12) + 0.95})
    else
        return nil
    end
end
u31.publishWheelieMeter = function(a1)
    --[[
      name: publishWheelieMeter
      line: 4890
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        wheelieMeterAtom_upv_1 (copy, index: 2)
    ]]
    local multiplier_2 = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.multiplier
    if a1.wheelieComboSeconds <= 0 and not (a1.wheelieActive) then
        if a1.lastMeterKey ~= "" then
            a1.lastMeterKey = ""
            wheelieMeterAtom_upv_1(nil)
        end
        return nil
    end
    local v371 = multiplier_2.milestones[a1.wheelieTierIndex + 1]
    local v372
    if a1.wheelieTierIndex + 1 >= #multiplier_2.milestones then
        v372 = nil
    else
        v372 = multiplier_2.milestones[a1.wheelieTierIndex + 2]
    end
    local v373
    if v372 ~= nil then
        v373 = math.clamp((a1.wheelieComboSeconds - v371.atSeconds) / math.max(v372.atSeconds - v371.atSeconds, 0.05), 0, 1)
    else
        v373 = 1
    end
    local v374 = ("%*:%*:%*"):format(a1.wheelieTierIndex, math.floor(v373 * 100), a1.wheelieActive)
    if v374 ~= a1.lastMeterKey then
        a1.lastMeterKey = v374
        local tbl_32 = {}
        tbl_32.factor = v371.factor
        local v375 = nil
        if v372 == nil then
            v375 = v372
        else
            v375 = v375.factor
        end
        tbl_32.nextFactor = v375
        tbl_32.progress = v373
        tbl_32.color = v371.flameColor or Color3.fromRGB(235, 235, 245)
        tbl_32.live = a1.wheelieActive
        wheelieMeterAtom_upv_1(tbl_32)
    else
        return nil
    end
end
u31.wheelieFactor = function(a1)
    --[[
      name: wheelieFactor
      line: 4921
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return HIGHWAY_RIDER_CONFIG_upv_1.wheelie.multiplier.milestones[a1.wheelieTierIndex + 1].factor
end
u31.ladderClip = function(a1)
    --[[
      name: ladderClip
      line: 4924
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    if not (a1.wheelieActive) and a1.wheelieTierIndex == 0 then
        return "drive"
    end
    return tbl_upv_2[math.min(a1.wheelieTierIndex, #tbl_upv_2 - 1) + 1]
end
u31.biomeOrdinal = function(a1)
    --[[
      name: biomeOrdinal
      line: 4930
      upvalues:
        biomeOrdinalAt_upv_1 (copy, index: 1)
    ]]
    if a1.systems.biomes then
        return (biomeOrdinalAt_upv_1(a1.elapsed))
    end
    return 0
end
u31.applyRiderHalt = function(a1)
    --[[
      name: applyRiderHalt
      line: 4933
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    local rider_7 = a1.rider
    if rider_7 ~= nil then
        local v377 = pausedAtom_upv_1() or (gameFrozenAtom_upv_1())
        rider_7:setHalted(v377)
    end
end
u31.addAirOrbit = function(a1, a2, a3)
    --[[
      name: addAirOrbit
      line: 4939
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local orbit_1 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.camera.orbit
    if orbit_1.enabled and a1.mode == "fp" and a1.airborne then
        a1.airOrbitYaw = a1.airOrbitYaw + (a2 * orbit_1.radiansPerPixel)
        a1.airOrbitPitch = math.clamp(a1.airOrbitPitch + (a3 * orbit_1.radiansPerPixel), math.rad(orbit_1.minPitchDegrees), math.rad(orbit_1.maxPitchDegrees))
        return
    end
    return nil
end
u31.updateAirOrbit = function(a1, a2)
    --[[
      name: updateAirOrbit
      line: 4951
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
        UserInputService_upv_1 (copy, index: 3)
        approach_upv_1 (copy, index: 4)
    ]]
    local orbit_2 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.camera.orbit
    if orbit_2.enabled and a1.mode == "fp" then
        if a1.airborne then
            a1:addAirOrbit((gamepadInput_upv_1:rightX() * orbit_2.stickRadiansPerSecond) * a2, (-gamepadInput_upv_1:rightY() * orbit_2.stickRadiansPerSecond) * a2)
            if UserInputService_upv_1:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                local v378 = nil
                if UserInputService_upv_1:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                    a1.orbitPointer = nil
                else
                    local v379 = UserInputService_upv_1:GetMouseLocation()
                    v378 = a1.orbitPointer
                    if v378 ~= nil then
                        a1:addAirOrbit(v379.X - v378.X, v379.Y - v378.Y)
                    end
                    a1.orbitPointer = v379
                end
            else
                a1.orbitPointer = nil
            end
            return nil
        end
        a1.orbitPointer = nil
        if a1.airOrbitYaw == 0 and a1.airOrbitPitch == 0 then
            return nil
        end
        a1.airOrbitYaw = approach_upv_1(a1.airOrbitYaw, 0, orbit_2.settleRate, a2)
        a1.airOrbitPitch = approach_upv_1(a1.airOrbitPitch, 0, orbit_2.settleRate, a2)
        if math.abs(a1.airOrbitYaw) < 0.001 then
            a1.airOrbitYaw = 0
        end
        if math.abs(a1.airOrbitPitch) < 0.001 then
            a1.airOrbitPitch = 0
        end
        return
    end
    return nil
end
u31.buildWheelieFlame = function(a1, a2)
    --[[
      name: buildWheelieFlame
      line: 4985
      upvalues:
        u1 (copy, index: 1)
        createGameLoopSound_upv_1 (copy, index: 2)
        SOUND_IDS_upv_1 (copy, index: 3)
    ]]
    local v380 = Instance.new("Part")
    v380.Name = "WheelieFlame"
    v380.Size = Vector3.new(1, 0.4000000059604645, 1)
    v380.Transparency = 1
    v380.Anchored = true
    v380.CanCollide = false
    v380.CanQuery = false
    v380.CanTouch = false
    v380.CastShadow = false
    v380.CFrame = u1
    local v381 = Instance.new("ParticleEmitter")
    v381.Enabled = false
    v381.Rate = 0
    v381.LightEmission = 1
    v381.LightInfluence = 0
    v381.Lifetime = NumberRange.new(0.25, 0.5)
    v381.Speed = NumberRange.new(4, 8)
    v381.SpreadAngle = Vector2.new(28, 28)
    v381.Acceleration = Vector3.new(0, 15, 0)
    v381.RotSpeed = NumberRange.new(-150, 150)
    v381.EmissionDirection = Enum.NormalId.Top
    v381.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.55, 0.45), NumberSequenceKeypoint.new(1, 1)})
    v381.Parent = v380
    local v382 = createGameLoopSound_upv_1({soundId = SOUND_IDS_upv_1.flameLoop, parent = v380})
    v382:Play()
    v380.Parent = a2
    a1.flamePart = v380
    a1.flameEmitter = v381
    a1.flameSound = v382
end
u31.updateWheelieFlame = function(a1, a2)
    --[[
      name: updateWheelieFlame
      line: 5022
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local flamePart_1 = a1.flamePart
    local flameEmitter_1 = a1.flameEmitter
    if flamePart_1 ~= nil and flameEmitter_1 ~= nil then
        if a1.wheeliePose > 0.01 then
            flamePart_1.CFrame = a2 * CFrame.new(0, 0.7, a1.wheeliePivotZ)
        end
        local multiplier_3 = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.multiplier
        local v383 = multiplier_3.milestones[a1.wheelieTierIndex + 1]
        if a1.wheelieActive then
            local v384 = nil
            if v383.flameColor ~= nil then
                local atSeconds_1 = multiplier_3.milestones[2].atSeconds
                local v385 = math.clamp((a1.wheelieComboSeconds - atSeconds_1) / math.max(multiplier_3.milestones[#multiplier_3.milestones].atSeconds - atSeconds_1, 0.1), 0, 1)
                v384 = a1.wheelieTierIndex * 100 + math.floor(v385 * 24)
                if v384 ~= a1.lastFlameQuantum then
                    a1.lastFlameQuantum = v384
                    if a1.flameSound ~= nil then
                        local flameSound_1 = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.flameSound
                        a1.flameSound.Volume = flameSound_1.volumeMax * ((v385 * 0.65) + 0.35)
                        a1.flameSound.PlaybackSpeed = flameSound_1.pitchBase + (flameSound_1.pitchRise * v385)
                    end
                    flameEmitter_1.Enabled = true
                    flameEmitter_1.Rate = (v385 * 55) + 22
                    local v386 = v385 * 1.3 + 0.8
                    flameEmitter_1.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, v386), NumberSequenceKeypoint.new(1, v386 * 0.3)})
                    local tbl_33 = {ColorSequenceKeypoint.new(0, v383.flameColor:Lerp(Color3.new(1, 1, 1), 0.45)), ColorSequenceKeypoint.new(0.45, v383.flameColor), ColorSequenceKeypoint.new(1, v383.flameColor:Lerp(Color3.new(0, 0, 0), 0.55))}
                    flameEmitter_1.Color = ColorSequence.new(tbl_33)
                    return
                end
                return nil
            end
        end
        if flameEmitter_1.Enabled then
            flameEmitter_1.Enabled = false
            a1.lastFlameQuantum = -1
            if a1.flameSound ~= nil then
                a1.flameSound.Volume = 0
            end
        end
        return nil
    end
    return nil
end
u31.resetWheelieFlame = function(a1)
    --[[
      name: resetWheelieFlame
      line: 5067
      upvalues:
        u1 (copy, index: 1)
    ]]
    local flamePart_2 = a1.flamePart
    local flameEmitter_2 = a1.flameEmitter
    if flamePart_2 ~= nil and flameEmitter_2 ~= nil then
        flameEmitter_2.Enabled = false
        flameEmitter_2.Rate = 0
        flamePart_2.CFrame = u1
        a1.lastFlameQuantum = -1
        if a1.flameSound ~= nil then
            a1.flameSound.Volume = 0
        end
        return
    end
    return nil
end
u31.render = function(a1, a2)
    --[[
      name: render
      line: 5081
      upvalues:
        lerp_upv_1 (copy, index: 1)
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1:updateGhosts(a2)
    local origin_3 = a1.stage.origin
    local renderAlpha_1 = a1.renderAlpha
    local v387 = lerp_upv_1(a1.renderPrevS, a1.playerS, renderAlpha_1)
    local v388 = lerp_upv_1(a1.renderPrevX, a1.playerX, renderAlpha_1)
    a1.wheeliePose = a1.wheeliePose + (((((a1.wheelieActive) and 1) or 0) - a1.wheeliePose) * math.min(a2 * HIGHWAY_RIDER_CONFIG_upv_1.wheelie.poseEaseRate, 1))
    a1:updateEngine(a2)
    local engineAudio_1 = a1.engineAudio
    local v389 = a1:isRunning() and (not a1.dead)
    engineAudio_1:update(a2, v389, a1:speedBandFraction(), a1.wheelieActive)
    a1:updateWind(a2)
    local bodyYawPerLateralSpeed_1 = a1.spec.bodyYawPerLateralSpeed
    local v390 = lerp_upv_1(a1.renderPrevY, a1.playerY, renderAlpha_1)
    if a1.landingDip > 0.001 then
        local landing_2 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.landing
        a1.landingDipClock = a1.landingDipClock + a1.realDelta
        v389 = math.exp(-a1.landingDipClock * landing_2.dipDecayRate)
        local v391 = v390 - (landing_2.dipStuds * a1.landingDip) * v389 * math.cos(((a1.landingDipClock * landing_2.dipWobbleHz) * 2) * math.pi)
        if v389 < 0.02 then
            a1.landingDip = 0
        end
        v390 = v391
    end
    a1.lastRenderY = v390
    a1:updateAirOrbit(a2)
    local landing_2 = ((a1.airborne) and 1) or 0
    if a1.airborne then
        v389 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.cameraRiseRate
    else
        v389 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.cameraFallRate
    end
    a1.airCamBlend = a1.airCamBlend + ((landing_2 - a1.airCamBlend) * math.min(a2 * v389, 1))
    if math.abs(landing_2 - a1.airCamBlend) < 0.004 then
        a1.airCamBlend = landing_2
    end
    local v392
    local v395 = nil
    if bodyYawPerLateralSpeed_1 == nil then
        local v393 = math.clamp(-a1.steerVelocity * 0.02, -0.3839724354387525, 0.3839724354387525)
        v392 = CFrame.new(origin_3 + Vector3.new(v388, 0 + v390, 0)) * CFrame.Angles(0, 0, v393)
    else
        a1.bodyYaw = a1.bodyYaw + ((math.clamp(a1.steerVelocity * bodyYawPerLateralSpeed_1, -0.3141592653589793, 0.3141592653589793) - a1.bodyYaw) * math.min(a2 * 15, 1))
        v395 = lerp_upv_1(a1.renderPrevAirSpin, a1.airSpinAngle, renderAlpha_1)
        v392 = CFrame.new(origin_3 + Vector3.new(v388, 0 + v390, 0)) * CFrame.Angles(0, a1.bodyYaw + v395, 0)
    end
    if a1.landingDip > 0.001 then
        local landing_3 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.landing
        a1.landingDipClock = a1.landingDipClock + a2
        v395 = math.exp(-a1.landingDipClock * landing_3.dipDecayRate)
        if v395 >= 0.02 then
            local _ = v392 * CFrame.new(0, ((-landing_3.dipStuds * a1.landingDip) * v395) * math.cos(((a1.landingDipClock * landing_3.dipWobbleHz) * math.pi) * 2), 0)
        else
            a1.landingDip = 0
        end
    end
    if a1.wheeliePose > 0.01 then
        local v396 = math.rad(HIGHWAY_RIDER_CONFIG_upv_1.wheelie.maxPitchDegrees)
        v392 = (v392 * CFrame.new(0, 0, a1.wheeliePivotZ)) * CFrame.Angles(-(v396 * a1.wheeliePose), 0, 0) * CFrame.new(0, 0, -a1.wheeliePivotZ)
    end
    local landingDustAnchor_2 = a1.landingDustAnchor
    if landingDustAnchor_2 ~= nil then
        landingDustAnchor_2.CFrame = CFrame.new(origin_3 + Vector3.new(v388, 0.4, 0))
    end
    if a1.dead then
        if a1.wreckActive then
            v395 = HIGHWAY_RIDER_CONFIG_upv_1.crashTumble
            local v397 = lerp_upv_1(a1.wreckPrevHeight, a1.wreckHeight, renderAlpha_1)
            local v398 = lerp_upv_1(a1.wreckPrevPitch, a1.wreckPitch, renderAlpha_1)
            local v399 = lerp_upv_1(a1.wreckPrevRoll, a1.wreckRoll, renderAlpha_1)
            local v400 = lerp_upv_1(a1.wreckPrevYaw, a1.wreckYaw, renderAlpha_1)
            local v401 = origin_3 + Vector3.new(v388, (0 + v395.centerHeight) + v397, 0)
            a1.wreckRenderCenter = v401
            a1.vehicle:pose((CFrame.new(v401) * CFrame.fromOrientation(v398, v400, v399)) * CFrame.new(0, -v395.centerHeight, 0), a1.wheelAngle)
        end
    else
        a1.vehicle:pose(v392, a1.wheelAngle)
        a1:updateWheelieFlame(v392)
        v395 = a1.rider
        local v402 = nil
        if v395 ~= nil then
            v395:pose(v392, a2)
            local v403
            if a1.steerFade >= a1.steerFadeTarget then
                v403 = HIGHWAY_RIDER_CONFIG_upv_1.rider.steerFade.fadeOutRate
            else
                v403 = HIGHWAY_RIDER_CONFIG_upv_1.rider.steerFade.fadeInRate
            end
            a1.steerFade = a1.steerFade + ((a1.steerFadeTarget - a1.steerFade) * math.min(a2 * v403, 1))
            if math.abs(a1.steerFadeTarget - a1.steerFade) < 0.005 then
                a1.steerFade = a1.steerFadeTarget
            end
            v402 = math.max(a1.wheeliePose, a1.airCamBlend)
            v395:setSteerFade(a1.steerFade * (1 - v402))
            local v404
            if v402 <= 0.995 then
                if v402 >= 0.005 then
                    v404 = v402
                else
                    v404 = 0
                end
            else
                v404 = 1
            end
            v395:setHeadVisible(v404)
        end
    end
    local v405 = nil
    local v406 = nil
    local key_5 = nil
    local v407 = nil
    local v408 = nil
    local v409 = nil
    for _, value_72 in a1.cars do
        if not (value_72.active) then
            continue
        end
        v405 = lerp_upv_1(value_72.renderPrevS, value_72.s, renderAlpha_1) - v387
        v406 = value_72.speed < 0
        if value_72.flung then
            key_5 = CFrame.fromOrientation(lerp_upv_1(value_72.renderPrevFlungPitch, value_72.flungPitch, renderAlpha_1), lerp_upv_1(value_72.renderPrevFlungYaw, value_72.flungYaw, renderAlpha_1), lerp_upv_1(value_72.renderPrevFlungRoll, value_72.flungRoll, renderAlpha_1))
        elseif v406 then
            key_5 = CFrame.Angles(0, math.pi, 0)
        else
            key_5 = CFrame.new()
        end
        v407 = ((not (value_72.flung)) and 0) or (lerp_upv_1(value_72.renderPrevFlungHeight, value_72.flungHeight, renderAlpha_1))
        v408 = CFrame.new(origin_3 + Vector3.new(value_72.x, 1 + v407, v405)) * key_5
        if value_72.visual ~= nil then
            value_72.visual:setFade(value_72.ageSeconds / HIGHWAY_RIDER_CONFIG_upv_1.trafficFade.seconds)
            value_72.visual:follow(v408)
            continue
        end
        value_72.body.CFrame = v408
        value_72.cabin.CFrame = v408 * CFrame.new(0, 1.7, -1.4)
        value_72.axleFront.CFrame = v408 * CFrame.new(0, -0.6, 2.5)
        value_72.axleRear.CFrame = v408 * CFrame.new(0, -0.6, -2.5)
        if v406 then
            v409 = CFrame.new(0, 0.2, 4)
        else
            v409 = CFrame.new(0, 0.2, -4.05)
        end
        value_72.headlight.CFrame = v408 * v409
    end
    local v410 = nil
    for _, value_73 in a1.decorCars do
        v410 = CFrame.new(origin_3 + Vector3.new(value_73.x, 1, lerp_upv_1(value_73.renderPrevS, value_73.s, renderAlpha_1) - v387)) * CFrame.Angles(0, math.pi, 0)
        if value_73.visual == nil then
            value_73.body.CFrame = v410
            value_73.light.CFrame = v410 * CFrame.new(0, 0.2, 4.05)
        else
            value_73.visual:follow(v410)
        end
    end
    for n_23 = 0, #a1.buildings - 1 do
        local v411 = a1.buildings[n_23 + 1]
        local v412 = v411:GetAttribute("sideX")
        local v413 = v411:GetAttribute("halfHeight")
        local v414 = ((((n_23 % 5) * 80 - v387) % 400) + 400) % 400 - 40
        v411.CFrame = CFrame.new(origin_3 + Vector3.new(v412, (0 + v413) - 0.6, v414))
        a1.buildingRoofs[n_23 + 1].CFrame = CFrame.new(origin_3 + Vector3.new(v412, (0 + (v413 * 2)) - 0.2, v414))
    end
    local v415 = nil
    for _, value_74 in a1.medianLamps do
        v415 = (((value_74.cycle - v387) % 420) + 420) % 420 - 40
        value_74.pole.CFrame = CFrame.new(origin_3 + Vector3.new(20.95, 3.8, v415))
        value_74.arm.CFrame = CFrame.new(origin_3 + Vector3.new(19.15, 7.5, v415))
        value_74.head.CFrame = CFrame.new(origin_3 + Vector3.new(17.55, 7.35, v415))
    end
    for n_24 = 0, #a1.dashes - 1 do
        local v416 = a1.dashes[n_24 + 1]
        v416.CFrame = CFrame.new(origin_3 + Vector3.new(v416:GetAttribute("laneX"), 0.06, (((((n_24 % 28) * 12 - v387) % 336) + 336) % 336) - 40))
    end
    for n_25 = 0, #a1.posts - 1 do
        local v417 = a1.posts[n_25 + 1]
        v417.CFrame = CFrame.new(origin_3 + Vector3.new(v417:GetAttribute("sideX"), 0 + a1.postCenterY, (((((n_25 % 10) * 40 - v387) % 400) + 400) % 400) - 40))
    end
    a1:updateTunnelSequencer()
    a1.chunkWorkBudget = 1
    local v418 = -1
    local v419 = -math.huge
    local v420
    v420, v395 = v419, v418
    for n_26 = 0, #a1.chunkTiles - 1 do
        local v421 = -math.floor(((n_26 * 150) - v387) / 750)
        local v422
        v422 = n_26 + 5 * v421
        if v420 < v422 then
            v420 = v422
        end
        local v423 = a1:chunkRungForOrdinal(v422)
        if v421 ~= a1.chunkSlotWrap[n_26 + 1] and a1:applyChunkBiome(n_26, v423) then
            a1.chunkSlotWrap[n_26 + 1] = v421
        end
        local v424
        v424 = ((((n_26 * 150) - v387) % 750) + 750) % 750 - 80
        if v424 > -75 and v424 <= 75 then
            v395 = a1.chunkSlotBiome[n_26 + 1]
        end
        a1.chunkTiles[n_26 + 1]:poseAt(origin_3, 0, v424)
    end
    a1.chunkFarOrdinal = v420
    local tunnelRungBase_1 = a1.tunnelRungBase
    local v425 = false
    local v426
    if tunnelRungBase_1 == nil then
        v426 = v425
    else
        v426 = tunnelRungBase_1 <= v395
    end
    a1.isInsideTunnel = v426
    a1.engineAudio:setInsideTunnel(v426, a1.realDelta)
    if not (v426) then
        a1:updateShoulderTint(v395)
    end
    for n_27 = 0, #a1.nightRays - 1 do
        key_5 = a1.chunkSlotBiome[n_27 + 1]
        if key_5 == nil then
            key_5 = 0
        end
        v410 = false
        if tunnelRungBase_1 ~= nil then
            v410 = tunnelRungBase_1 <= key_5
        end
        local tile_1 = a1.nightRays[n_27 + 1].tile
        if v410 then
            v409 = -4000
        else
            v409 = ((((n_27 * 150) - v387) % 750) + 750) % 750 - 80
        end
        tile_1:poseAt(origin_3, 0, v409)
    end
    for key_5, value_75 in a1.fpTrees do
        v410 = (((value_75.cycle - v387) % 420) + 420) % 420 - 40
        value_75.trunk.CFrame = CFrame.new(origin_3 + Vector3.new(value_75.x, -0.42 + (value_75.trunkHeight / 2), v410))
        value_75.canopy.CFrame = CFrame.new(origin_3 + Vector3.new(value_75.x, (-0.42 + value_75.trunkHeight) + (value_75.canopyHalf * 0.8), v410))
    end
    for key_5, value_76 in a1.fpBushes do
        value_76.part.CFrame = CFrame.new(origin_3 + Vector3.new(value_76.x, -0.37 + value_76.half, ((((value_76.cycle - v387) % 376) + 376) % 376) - 40))
    end
    a1:updateStreaks()
    if a1.mode == "fp" then
        local vehicle_1 = a1.vehicle
        local setSpeedFraction_1 = vehicle_1.setSpeedFraction
        if setSpeedFraction_1 ~= nil then
            setSpeedFraction_1(vehicle_1, (math.clamp((a1.speed - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed) / (a1.speedMax - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed), 0, 1)))
        end
    end
    a1:renderOil(origin_3, v387)
    a1:renderObstruction(origin_3, v387, renderAlpha_1)
    a1:renderEmergencyGlow(origin_3, v387)
    a1:updateNight()
    a1:updateSpeedLabels()
    a1:updateSpeedSign()
    a1:updateCamera(a2)
end
u31.updateNight = function(a1)
    --[[
      name: updateNight
      line: 5397
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        u11 (copy, index: 2)
        fadeTransparency_upv_1 (copy, index: 3)
    ]]
    local nightCycle_2 = a1.nightCycle
    local v427, v428, v429, v430, v431 = nil, nil, nil, nil, nil
    if nightCycle_2 ~= nil then
        if a1.isInsideTunnel then
            if a1.nightHoldElapsed == nil then
                a1.nightHoldElapsed = a1.elapsed
            end
        elseif a1.nightHoldElapsed ~= nil then
            v427 = a1.nightHoldElapsed + a1.realDelta * HIGHWAY_RIDER_CONFIG_upv_1.tunnel.nightCatchUpFactor
            local v432
            if a1.elapsed > v427 then
                v432 = v427
            else
                v432 = nil
            end
            a1.nightHoldElapsed = v432
        end
        v427 = a1.nightHoldElapsed
        if v427 == nil then
            v427 = a1.elapsed
        end
        v428 = a1.nightAlphaOverride
        local v433
        if v428 == nil then
            v433 = nightCycle_2:update(v427)
        else
            v433 = nightCycle_2:applyAlpha(v428)
        end
        local v434 = nil
        if v433 ~= a1.lastNightAlpha then
            a1.lastNightAlpha = v433
            local v435 = u11:Lerp(HIGHWAY_RIDER_CONFIG_upv_1.dayNight.nightBackdropColor, v433)
            v434 = a1.frontalBackdrop
            if v434 ~= nil then
                v434.Color = v435
                v434.Transparency = v433
            end
            v431 = a1.tpSkyWall
            if v431 ~= nil then
                v431.Color = v435
                v431.Transparency = v433
            end
        end
        v429 = math.floor((v433 * 64) + 0.5)
        if v429 ~= a1.lastNightFadeStep then
            a1.lastNightFadeStep = v429
            local v436 = v429 / 64
            v431 = v429 > 0
            for _, value_77 in a1.nightRays do
                for v439, value_78 in value_77.beams do
                    value_78.beam.Enabled = v431
                    if v431 then
                        value_78.beam.Transparency = fadeTransparency_upv_1(value_78.authoredTransparency, v436)
                    end
                end
            end
            v430 = a1.nightMoonLight
            if v430 ~= nil then
                v430.Enabled = v431
                v430.Brightness = a1.nightMoonAuthoredBrightness * v436
            end
        end
        v434 = v433 >= 0.5
        if v434 ~= a1.nightSideOn then
            a1.nightSideOn = v434
            if a1.mode == "tp" then
                local vehicle_2 = a1.vehicle
                v430 = vehicle_2.setHeadlights
                if v430 ~= nil then
                    v430(vehicle_2, v434)
                end
            end
            local v437 = nil
            for _, value_79 in a1.cars do
                v437 = value_79.visual
                if v437 ~= nil then
                    v437:setHeadlights(v434)
                end
            end
            local v438 = nil
            for _, value_80 in a1.decorCars do
                v438 = value_80.visual
                if v438 ~= nil then
                    v438:setHeadlights(v434)
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u31.updateSpeedLabels = function(a1)
    --[[
      name: updateSpeedLabels
      line: 5494
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local labelsPart_1 = a1.labelsPart
    local speedLabel_1 = a1.speedLabel
    local distanceLabel_1 = a1.distanceLabel
    if labelsPart_1 ~= nil and speedLabel_1 ~= nil and distanceLabel_1 ~= nil then
        local v439, v440
        if a1.dead then
            return nil
        end
        labelsPart_1.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.smoothedCameraX * 0.9, 1.2, 7.5))
        v439 = math.floor((HIGHWAY_RIDER_CONFIG_upv_1.directDrive.displayBase + ((a1.speed - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed) * HIGHWAY_RIDER_CONFIG_upv_1.directDrive.displayPerStud)) + 0.5)
        if v439 ~= a1.lastDisplaySpeed then
            a1.lastDisplaySpeed = v439
            speedLabel_1.Text = ("%* Km/H"):format(v439)
        end
        v440 = math.floor(a1.distance:current() / 10)
        if v440 ~= a1.lastDistanceTenths then
            a1.lastDistanceTenths = v440
            distanceLabel_1.Text = string.format("%.1fKm", v440 / 10)
        end
        return
    end
    return nil
end
u31.windSpeedFactor = function(a1)
    --[[
      name: windSpeedFactor
      line: 5518
    ]]
    return (math.clamp((a1.speed - a1.windMinSpeed) / (a1.speedMax - a1.windMinSpeed), 0, 1))
end
u31.updateStreaks = function(a1)
    --[[
      name: updateStreaks
      line: 5521
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v441 = nil
    if #a1.windStreaks ~= 0 then
        v441 = a1:windSpeedFactor()
        local v442 = 1
        if v441 > 0 then
            v442 = ((a1.mode == "tp") and (1 - HIGHWAY_RIDER_CONFIG_upv_1.tpWind.maxOpacity * v441)) or (math.clamp((0.95 - (0.5 * v441)) - (0.2 * a1.wheeliePose), 0.25, 1))
        end
        if math.abs(v442 - a1.streakTransparency) > 0.02 then
            a1.streakTransparency = v442
            for _, value_81 in a1.windStreaks do
                value_81.part.Transparency = v442
            end
        end
        if a1.streakTransparency < 0.98 then
            local origin_4 = a1.stage.origin
            for _, value_82 in a1.windStreaks do
                value_82.part.CFrame = CFrame.new(origin_4 + Vector3.new(value_82.x, value_82.y, ((((value_82.cycle - a1.playerS * 1.6) % 180) + 180) % 180) - 25))
            end
        else
            return nil
        end
    else
        return nil
    end
end
u31.updateWind = function(a1, a2)
    --[[
      name: updateWind
      line: 5547
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local windSound_1 = a1.windSound
    if windSound_1 ~= nil then
        local v443 = ((a1.dead) and 0) or (a1:windSpeedFactor())
        local v444 = HIGHWAY_RIDER_CONFIG_upv_1.tpWind.maxVolume * v443
        if not (windSound_1.IsPlaying) then
            if v444 > 0.02 then
                windSound_1.Volume = 0
                windSound_1:Play()
            else
                return nil
            end
        end
        windSound_1.Volume = windSound_1.Volume + ((v444 - windSound_1.Volume) * math.min(a2 * 6, 1))
        if v444 <= 0.02 and windSound_1.Volume < 0.02 then
            windSound_1:Stop()
            return nil
        end
        windSound_1.PlaybackSpeed = HIGHWAY_RIDER_CONFIG_upv_1.tpWind.pitchBase + (HIGHWAY_RIDER_CONFIG_upv_1.tpWind.pitchRise * v443)
    else
        return nil
    end
end
u31.stopWind = function(a1)
    --[[
      name: stopWind
      line: 5568
    ]]
    local windSound_2 = a1.windSound
    if windSound_2 ~= nil then
        windSound_2.Volume = 0
        if windSound_2.IsPlaying then
            windSound_2:Stop()
        end
    else
        return nil
    end
end
u31.speedBandFraction = function(a1)
    --[[
      name: speedBandFraction
      line: 5578
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.clamp((a1.speed - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed) / (a1.speedMax - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed), 0, 1))
end
u31.updateEngine = function(a1, a2)
    --[[
      name: updateEngine
      line: 5581
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local engineSound_1 = a1.engineSound
    if engineSound_1 ~= nil and engineSound_1.IsPlaying then
        engineSound_1.Volume = engineSound_1.Volume + (((((not (a1.wheelieActive)) and 0) or (HIGHWAY_RIDER_CONFIG_upv_1.wheelie.engineVolume)) - engineSound_1.Volume) * math.min(a2 * 10, 1))
        if not (a1.wheelieActive) and engineSound_1.Volume < 0.02 then
            engineSound_1:Stop()
            return nil
        end
        engineSound_1.PlaybackSpeed = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.enginePitchBase + ((HIGHWAY_RIDER_CONFIG_upv_1.wheelie.enginePitchRise * a1.wheeliePose) * ((math.clamp((a1.speed - HIGHWAY_RIDER_CONFIG_upv_1.speedStart) / (a1.speedMax - HIGHWAY_RIDER_CONFIG_upv_1.speedStart), 0, 1) * 0.3) + 0.7))
        return
    end
    return nil
end
u31.startEngine = function(a1)
    --[[
      name: startEngine
      line: 5595
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local engineSound_2 = a1.engineSound
    if engineSound_2 ~= nil then
        engineSound_2.PlaybackSpeed = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.enginePitchBase
        if not (engineSound_2.IsPlaying) then
            engineSound_2.Volume = 0
            engineSound_2:Play()
        end
    else
        return nil
    end
end
u31.stopEngine = function(a1)
    --[[
      name: stopEngine
      line: 5606
    ]]
    local engineSound_3 = a1.engineSound
    if engineSound_3 ~= nil then
        engineSound_3.Volume = 0
        if engineSound_3.IsPlaying then
            engineSound_3:Stop()
        end
    else
        return nil
    end
end
u31.updateSpeedSign = function(a1)
    --[[
      name: updateSpeedSign
      line: 5616
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v445 = not a1.dead
    if v445 then
        v445 = a1:isRunning()
        if v445 then
            v445 = false
            if HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds <= a1.orbitElapsed then
                v445 = HIGHWAY_RIDER_CONFIG_upv_1.scoreFloorGraceSeconds <= a1.belowFloorSeconds
            end
        end
    end
    if v445 then
        a1.speedSignShown = true
        local v446
        if a1.mode ~= "fp" then
            v446 = Vector3.new(a1.smoothedCameraX * 0.9, 7, 22)
        else
            v446 = Vector3.new(a1.smoothedCameraX, 5.4, 15)
        end
        a1.speedSignPart.CFrame = CFrame.new(a1.stage.origin + v446)
        local v447 = math.sin(a1.elapsed * 7) * 0.5 + 0.5
        a1.speedSignLabel.TextTransparency = (v447 * 0.4) + 0.1
        a1.speedSignLabel.TextStrokeTransparency = (v447 * 0.3) + 0.5
    else
        a1:hideSpeedSign()
        return nil
    end
end
u31.hideSpeedSign = function(a1)
    --[[
      name: hideSpeedSign
      line: 5629
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.speedSignShown then
        a1.speedSignShown = false
        a1.speedSignLabel.TextTransparency = 1
        a1.speedSignLabel.TextStrokeTransparency = 1
        a1.speedSignPart.CFrame = u1
    else
        return nil
    end
end
u31.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 5638
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u31.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 5644
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        approach_upv_1 (copy, index: 2)
    ]]
    local v448 = math.min(a2, 0.25)
    if not (a1.spectating) then
        a1.spectating = true
        a1.spectateAnchorS = a1.playerS
        a1.wreckActive = false
        a1.crashCamStart = nil
        a1.deathCameraCFrame = nil
        a1.vehicle:park()
        local rider_8 = a1.rider
        if rider_8 ~= nil then
            rider_8:park()
        end
    end
    local v449 = a1.spectate:value(2)
    local v450 = a1.spectate:value(0)
    if v449 ~= nil then
        a1.spectateLeadStuds = approach_upv_1(a1.spectateLeadStuds, (v449 - a1.distance:current()) * HIGHWAY_RIDER_CONFIG_upv_1.studsPerPoint, 4, v448)
        a1.playerS = a1.spectateAnchorS + a1.spectateLeadStuds
    end
    if v450 ~= nil then
        a1.playerX = approach_upv_1(a1.playerX, v450, 4, v448)
    end
    while a1.nextSpawnCheckS <= a1.playerS do
        a1.nextSpawnCheckS = a1.nextSpawnCheckS + a1:drawSpawnGap()
        a1:trySpawnCar(HIGHWAY_RIDER_CONFIG_upv_1.spawnAheadDistance)
    end
    a1:advanceTrafficAfterCrash(v448)
    a1:advanceDecor(v448)
    a1.renderPrevS = a1.playerS
    a1.renderPrevX = a1.playerX
    a1.renderPrevY = a1.playerY
    a1:render(a2)
end
u31.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 5684
    ]]
    a1:updateGhosts(a2)
    if a1.dead and a1.spectate:isActive() then
        a1:spectateStep(a2)
        return nil
    end
    if a1.dead then
        return nil
    end
    a1:render(a2)
end
u31.withStripOffset = function(a1, a2)
    --[[
      name: withStripOffset
      line: 5696
    ]]
    local v451 = a1.stage.getViewRect()
    local v452 = nil
    if v451 ~= nil then
        v452 = (v451.x0 + v451.x1) / 2
        if math.abs(v452 - 0.5) >= 0.001 then
            local ViewportSize_1 = a1.stage.camera.ViewportSize
            local v453 = ViewportSize_1.X / math.max(ViewportSize_1.Y, 1)
            return a2 * CFrame.new((0.5 - v452) * ((math.abs(a1.spec.camera.eyeBack) * 2 * math.tan(math.rad(a1:cameraFieldOfView()) / 2)) * v453), 0, 0)
        end
    end
    return a2
end
u31.updateCamera = function(a1, a2)
    --[[
      name: updateCamera
      line: 5714
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v454 = nil
    if a1.deathCameraCFrame == nil then
        if a1.dead and a1.crashCamStart ~= nil then
            a1:updateDeathCamera()
            return nil
        end
        local camera_1 = a1.spec.camera
        local origin_5 = a1.stage.origin
        v454 = a1:cameraFieldOfView()
        if v454 ~= a1.appliedFieldOfView then
            a1.appliedFieldOfView = v454
            a1.stage.camera.FieldOfView = v454
        end
        a1.smoothedCameraX = a1.smoothedCameraX + ((a1.playerX - a1.smoothedCameraX) * math.min(a2 * camera_1.followRate, 1))
        local v455 = math.rad(camera_1.maxRollDegrees)
        a1.currentRoll = a1.currentRoll + ((math.clamp(-a1.steerVelocity * 0.006, -v455, v455) - a1.currentRoll) * math.min(a2 * 8, 1))
        local lookSpring_1 = camera_1.lookSpring
        local v456 = a1.smoothedCameraX * camera_1.lookXFactor + (((a1.mode ~= "fp") and 0) or (a1.steerVelocity * 0.06))
        if lookSpring_1 ~= nil then
            local v457 = a2
            while v457 > 0 do
                local v458 = math.min(v457, 0.016666666666666666)
                v457 = v457 - v458
                a1.lookSpringVelocity = a1.lookSpringVelocity + ((((lookSpring_1.omega * lookSpring_1.omega) * (a1.playerX * camera_1.lookXFactor - a1.lookSpringX)) - (((2 * lookSpring_1.damping) * lookSpring_1.omega) * a1.lookSpringVelocity)) * v458)
                a1.lookSpringX = a1.lookSpringX + (a1.lookSpringVelocity * v458)
            end
            v456 = a1.lookSpringX
        end
        local v459 = a1.smoothedCameraX * camera_1.eyeXFactor
        local lastRenderY_1 = a1.lastRenderY
        local v460 = origin_5 + Vector3.new(v459, (camera_1.eyeHeight + a1.cameraLift) + lastRenderY_1, camera_1.eyeBack)
        local v461 = origin_5 + Vector3.new(v456, (camera_1.lookHeight + a1.cameraLift) + lastRenderY_1, camera_1.lookAhead)
        if a1.mode == "fp" and a1.airCamBlend > 0.001 then
            local camera_2 = HIGHWAY_RIDER_CONFIG_upv_1.ramp.camera
            local v462 = origin_5 + Vector3.new(v459, camera_2.eyeHeight + lastRenderY_1, camera_2.eyeBack)
            local v463 = origin_5 + Vector3.new(v456, camera_2.lookHeight + lastRenderY_1, camera_2.lookAhead)
            if a1.airOrbitYaw ~= 0 or a1.airOrbitPitch ~= 0 then
                local v464 = origin_5 + Vector3.new(v459, camera_2.lookHeight + lastRenderY_1, 0)
                local v465 = CFrame.Angles(0, a1.airOrbitYaw, 0) * CFrame.Angles(a1.airOrbitPitch, 0, 0)
                v462 = v464 + v465 * (v462 - v464)
                v463 = v464 + v465 * (v463 - v464)
            end
            v460, v461 = v460:Lerp(v462, a1.airCamBlend), v461:Lerp(v463, a1.airCamBlend)
        end
        if a1.spec.canWheelie then
            local camera_3 = HIGHWAY_RIDER_CONFIG_upv_1.wheelie.camera
            if a1.playerX <= 0.6 then
                if a1.playerX < -0.6 then
                    a1.wheelieCameraSideTarget = 1
                end
            else
                a1.wheelieCameraSideTarget = -1
            end
            a1.wheelieCameraSide = a1.wheelieCameraSide + ((a1.wheelieCameraSideTarget - a1.wheelieCameraSide) * math.min(a2 * camera_3.sideFlipRate, 1))
            if a1.wheeliePose > 0.01 then
                local v466 = origin_5 + Vector3.new(a1.smoothedCameraX + (camera_3.eyeSide * a1.wheelieCameraSide), camera_3.eyeHeight, camera_3.eyeBack)
                local v467 = origin_5 + Vector3.new(a1.smoothedCameraX, camera_3.lookHeight, camera_3.lookAhead)
                v460, v461 = v460:Lerp(v466, a1.wheeliePose), v461:Lerp(v467, a1.wheeliePose)
            end
        end
        local v468 = CFrame.lookAt(v460, v461) * CFrame.Angles(0, 0, a1.currentRoll)
        if a1.orbitElapsed >= HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds then
            a1.stage.setCameraCFrame(a1:withStripOffset(v468))
        else
            local v469 = math.clamp(a1.orbitElapsed / HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.seconds, 0, 1)
            local v470 = 1 - ((1 - v469) * (1 - v469)) * (1 - v469)
            local v471 = math.rad(HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.startAzimuthDegrees) * (1 - v470)
            local v472 = origin_5 + Vector3.new(a1.playerX, 1.5, 0)
            a1.stage.setCameraCFrame(a1:withStripOffset(CFrame.lookAt(v472 + Vector3.new(math.sin(v471) * HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.radius, HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.startHeight + ((camera_1.eyeHeight - HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.startHeight) * v470), -math.cos(v471) * HIGHWAY_RIDER_CONFIG_upv_1.introOrbit.radius), v472 + Vector3.new(0, 0.5, 4)):Lerp(v468, v470 * v470)))
            return nil
        end
    else
        a1.stage.setCameraCFrame(a1:withStripOffset(a1.deathCameraCFrame))
        return nil
    end
end
u31.updateDeathCamera = function(a1)
    --[[
      name: updateDeathCamera
      line: 5838
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
    ]]
    local crashCamStart_1 = a1.crashCamStart
    local wreckRenderCenter_1 = a1.wreckRenderCenter
    if crashCamStart_1 ~= nil and wreckRenderCenter_1 ~= nil then
        local origin_6 = a1.stage.origin
        local v473 = math.clamp((os.clock() - a1.crashClock) / HIGHWAY_RIDER_CONFIG_upv_1.crashCam.seconds, 0, 1)
        a1.stage.setCameraCFrame(a1:withStripOffset(crashCamStart_1:Lerp(CFrame.lookAt(Vector3.new(lerp_upv_1(origin_6.X, wreckRenderCenter_1.X, 0.6), (origin_6.Y + 0) + HIGHWAY_RIDER_CONFIG_upv_1.crashCam.dollyHeight, origin_6.Z - HIGHWAY_RIDER_CONFIG_upv_1.crashCam.dollyBack), Vector3.new(wreckRenderCenter_1.X, ((origin_6.Y + 0) + 1) + (((wreckRenderCenter_1.Y - origin_6.Y) - 0) * 0.35), origin_6.Z)), 1 - ((1 - v473) * (1 - v473)))))
    else
        return nil
    end
end
u31.cameraFieldOfView = function(a1)
    --[[
      name: cameraFieldOfView
      line: 5851
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local camera_4 = a1.spec.camera
    local v474
    if a1.stage.getOrientation() ~= "portrait" or camera_4.portraitFieldOfView == nil then
        v474 = camera_4.fieldOfView
    else
        v474 = camera_4.portraitFieldOfView
    end
    return v474 + (HIGHWAY_RIDER_CONFIG_upv_1.ramp.cameraFovBoost * a1.airCamBlend)
end
u31.awardNearMiss = function(a1, a2, a3)
    --[[
      name: awardNearMiss
      line: 5860
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        publishCombo_upv_1 (copy, index: 2)
        u12 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
    ]]
    if a1.elapsed - a1.lastNearMissElapsed > HIGHWAY_RIDER_CONFIG_upv_1.nearMissComboWindowSeconds then
        a1.nearMissCombo = 1
    else
        a1.nearMissCombo = math.min(a1.nearMissCombo + 1, HIGHWAY_RIDER_CONFIG_upv_1.nearMissComboMaxMultiplier)
    end
    a1.lastNearMissElapsed = a1.elapsed
    if a1.bestNearMissCombo < a1.nearMissCombo then
        a1.bestNearMissCombo = a1.nearMissCombo
    end
    a1.closeCallCount = a1.closeCallCount + 1
    if a1.mode == "fp" then
        publishCombo_upv_1({count = a1.nearMissCombo, color = u12, holdSeconds = HIGHWAY_RIDER_CONFIG_upv_1.nearMissComboWindowSeconds})
    end
    local v475 = (HIGHWAY_RIDER_CONFIG_upv_1.nearMissBasePoints + (math.floor((a3 * (HIGHWAY_RIDER_CONFIG_upv_1.speedTiers - 1)) + 0.5) * HIGHWAY_RIDER_CONFIG_upv_1.nearMissPointsPerTier)) * a1.nearMissCombo
    if a1.wheelieActive then
        v475 = math.floor((v475 * a1:wheelieFactor()) + 0.5)
    end
    a1.nearMissScore = a1.nearMissScore + v475
    a1:reportTotal()
    if a1.mode == "tp" then
        a1.popups:show(a1.stage.origin + Vector3.new(a2.x, 4, math.max(a2.s - a1.playerS, -6)), ("CLOSE CALL! x%*"):format(a1.closeCallCount), u12, 0.9, HIGHWAY_RIDER_CONFIG_upv_1.closeCallPopupSeconds)
    elseif a1.nearMissCombo == 1 then
        a1.popups:show(a1.stage.origin + Vector3.new(a1.smoothedCameraX, 5.4, 15), "CLOSE CALL", u12, 0.7)
    end
    a1.nearMissWhooshIndex = (a1.nearMissWhooshIndex + 1) % #tbl_upv_1
    a1.context.audio.play(tbl_upv_1[a1.nearMissWhooshIndex + 1], {pitch = 1 + (a1.nearMissCombo * 0.06)})
    a1.context.audio.play("scorePing", {pitch = 1.1 + (a1.nearMissCombo * 0.08)})
end
u31.totalScore = function(a1)
    --[[
      name: totalScore
      line: 5919
    ]]
    return ((a1.distance:current() + a1.nearMissScore) + a1.oncomingScore) + a1.wheelieScore
end
u31.reportTotal = function(a1)
    --[[
      name: reportTotal
      line: 5922
    ]]
    local v476 = a1:totalScore()
    if v476 ~= a1.lastReported then
        a1.lastReported = v476
        a1.context.reportScore(v476)
    else
        return nil
    end
end
u31.drawSpawnGap = function(a1)
    --[[
      name: drawSpawnGap
      line: 5930
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.trafficRandom:NextNumber(HIGHWAY_RIDER_CONFIG_upv_1.spawnGapStudsMin, HIGHWAY_RIDER_CONFIG_upv_1.spawnGapStudsMax)
end
u31.drawSpeedFactor = function(a1)
    --[[
      name: drawSpeedFactor
      line: 5933
    ]]
    local speedClasses_1 = a1.spec.speedClasses
    if speedClasses_1 == nil then
        local v477 = a1.spec.carSpeedJitterFraction
        if v477 == nil then
            v477 = 0
        end
        if v477 <= 0 then
            return 1
        end
        return 1 + a1.trafficRandom:NextNumber(-v477, v477)
    elseif a1.speedClassTotalWeight <= 0 then
        local v477 = a1.spec.carSpeedJitterFraction
        if v477 == nil then
            v477 = 0
        end
        if v477 <= 0 then
            return 1
        end
    else
        local v478 = a1.trafficRandom:NextNumber(0, a1.speedClassTotalWeight)
        for _, value_83 in speedClasses_1 do
            v478 = v478 - value_83.weight
            if v478 > 0 then
                continue
            end
            return a1.trafficRandom:NextNumber(value_83.factorMin, value_83.factorMax)
        end
        local v479 = speedClasses_1[#speedClasses_1]
        return a1.trafficRandom:NextNumber(v479.factorMin, v479.factorMax)
    end
end
u31.densityAt = function(a1, a2)
    --[[
      name: densityAt
      line: 5954
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
        lerp_upv_1 (copy, index: 3)
    ]]
    local densityWave_1 = HIGHWAY_RIDER_CONFIG_upv_1.densityWave
    local v480 = math.max(math.floor(a2 / densityWave_1.segmentStuds), 0)
    while #a1.densityWaveValues <= v480 + 1 do
        table.insert(a1.densityWaveValues, (deriveRandom_upv_1(a1.trafficSeed, #a1.densityWaveValues + 1000):NextNumber(densityWave_1.multiplierMin, densityWave_1.multiplierMax)))
    end
    local v481 = a2 / densityWave_1.segmentStuds - v480
    return lerp_upv_1(a1.densityWaveValues[v480 + 1], a1.densityWaveValues[v480 + 2], (v481 * v481) * (3 - (2 * v481)))
end
u31.trySpawnCar = function(a1, a2)
    --[[
      name: trySpawnCar
      line: 5966
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v482 = a1.spec.spawnDistanceScatter
    if v482 == nil then
        v482 = 0
    end
    local v483 = ((v482 <= 0) and 0) or (a1.trafficRandom:NextNumber(0, v482))
    local v484 = a1.playerS + a2 - v483
    local v485 = #a1.spec.laneCenters
    local _ = a1.trafficRandom:NextInteger(0, v485 - 1)
    local v486 = a1:drawSpeedFactor()
    local v487 = (HIGHWAY_RIDER_CONFIG_upv_1.headwaySecondsStart - ((HIGHWAY_RIDER_CONFIG_upv_1.headwaySecondsStart - HIGHWAY_RIDER_CONFIG_upv_1.headwaySecondsMin) * (1 - math.exp(-a1.elapsed / HIGHWAY_RIDER_CONFIG_upv_1.densityRampSeconds)))) / a1:densityAt(v484)
    local v488 = (HIGHWAY_RIDER_CONFIG_upv_1.coverageWindowSeconds - ((HIGHWAY_RIDER_CONFIG_upv_1.coverageWindowSeconds - HIGHWAY_RIDER_CONFIG_upv_1.coverageWindowSecondsMin) * math.min(a1.elapsed / HIGHWAY_RIDER_CONFIG_upv_1.coverageTightenSeconds, 1))) * a1.speedMax
    local v489 = HIGHWAY_RIDER_CONFIG_upv_1.startClearSeconds - a1.elapsed
    local v490 = v484 - a1.playerS
    for v499 = 0, 1 do
        local v491
        v491 = a1.laneSpeeds[v483 + 1] * v486
        local v492 = a1.speedMax - v491
        if v489 <= 0 then
            local v493 = true
            local v494 = 0
            local v495 = false
            local v496 = 0
            local v497 = false
            local v500, v501, v502
            if v497 then
                v496 = v496 + 1
            else
                v497 = true
            end
            while v496 < v485 do
                local v498 = a1:laneBlockedByObstruction(v496) and (a1:obstructionAhead(v484, 1))
                v498, v493 = v498, v493
                for v503, value_84 in a1.cars do
                    if not (value_84.active) or value_84.laneIndex ~= v496 then
                        continue
                    end
                    if v496 == v483 and math.abs(value_84.s - v484) < v492 * v487 then
                        v493 = false
                    end
                    if math.abs(value_84.s - v484) < v488 then
                        v498 = true
                    end
                end
                if v498 then
                    v494 = v494 + 1
                    if v496 == v483 then
                        v495 = true
                    end
                end
                v501, v502 = nil, nil
                if v497 then
                    v496 = v496 + 1
                else
                    v497 = true
                end
            end
            v496 = not v495 and (v485 - 1 <= v494)
            if not (v493) or not (v493) or v496 then
                v483 = (v483 + a1.trafficRandom:NextInteger(1, v485 - 1)) % v485
                continue
            end
            v497 = a1:laneBlockedByObstruction(v483)
            if v497 then
                v497 = a1:obstructionAhead(v484, ((a1.laneSpeeds[v483 + 1] < 0) and -1) or 1)
            end
            if not (v497) then
                a1:spawnCar(v483, v484, v491)
            end
            return nil
        elseif v492 <= 0 then
            local v493 = true
            local v494 = 0
            local v495 = false
            local v496 = 0
            local v497 = false
            local v500, v501, v502
            if v497 then
                v496 = v496 + 1
            else
                v497 = true
            end
            if v496 < v485 then
                local v498 = a1:laneBlockedByObstruction(v496) and (a1:obstructionAhead(v484, 1))
                v498, v493 = v498, v493
                for v503, value_84 in a1.cars do
                    if not (value_84.active) or value_84.laneIndex ~= v496 then
                        continue
                    end
                    if v496 == v483 and math.abs(value_84.s - v484) < v492 * v487 then
                        v493 = false
                    end
                    if math.abs(value_84.s - v484) < v488 then
                        v498 = true
                    end
                end
                if v498 then
                    v494 = v494 + 1
                    if v496 == v483 then
                        v495 = true
                    end
                end
                v501, v502 = nil, nil
                if v497 then
                    v496 = v496 + 1
                else
                    v497 = true
                end
            end
            v496 = not v495 and (v485 - 1 <= v494)
            if not (v493) or not (v493) or v496 then
                v483 = (v483 + a1.trafficRandom:NextInteger(1, v485 - 1)) % v485
                continue
            end
            v497 = a1:laneBlockedByObstruction(v483)
            if v497 then
                v497 = a1:obstructionAhead(v484, ((a1.laneSpeeds[v483 + 1] < 0) and -1) or 1)
            end
            if not (v497) then
                a1:spawnCar(v483, v484, v491)
            end
            return nil
        else
            if v490 - HIGHWAY_RIDER_CONFIG_upv_1.startClearBubbleStuds < v492 * v489 then
                v483 = (v483 + a1.trafficRandom:NextInteger(1, v485 - 1)) % v485
                continue
            end
            local v493 = true
            local v494 = 0
            local v495 = false
            local v496 = 0
            local v497 = false
            local v500, v501, v502
            if v497 then
                v496 = v496 + 1
            else
                v497 = true
            end
            while true do
                if v496 < v485 then
                    local v498 = a1:laneBlockedByObstruction(v496) and (a1:obstructionAhead(v484, 1))
                    v498 = a1:laneBlockedByObstruction(v496) and (a1:obstructionAhead(v484, 1))
                    v498, v493 = v498, v493
                    for v503, value_84 in a1.cars do
                        if not (value_84.active) or value_84.laneIndex ~= v496 then
                            continue
                        end
                        if v496 == v483 and math.abs(value_84.s - v484) < v492 * v487 then
                            v493 = false
                        end
                        if math.abs(value_84.s - v484) < v488 then
                            v498 = true
                        end
                    end
                    if v498 then
                        v494 = v494 + 1
                        if v496 == v483 then
                            v495 = true
                        end
                    end
                    v501, v502 = nil, nil
                    if v497 then
                        v496 = v496 + 1
                    else
                        v497 = true
                    end
                    continue
                end
                break
            end
            v496 = not v495 and (v485 - 1 <= v494)
            if not (v493) or v496 then
                v483 = (v483 + a1.trafficRandom:NextInteger(1, v485 - 1)) % v485
                continue
            end
            v497 = a1:laneBlockedByObstruction(v483)
            if v497 then
                v497 = a1:obstructionAhead(v484, ((a1.laneSpeeds[v483 + 1] < 0) and -1) or 1)
            end
            if not (v497) then
                a1:spawnCar(v483, v484, v491)
            end
            return nil
        end
    end
end
u31.spawnCar = function(a1, a2, a3, a4)
    --[[
      name: spawnCar
      line: 6066
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    local v499 = a1.laneSpeeds[a2 + 1]
    local v500 = ((v499 == 0) and math.huge) or (math.abs(a4 / v499))
    local carSpeedJitterFraction_1 = a1.spec.carSpeedJitterFraction
    if carSpeedJitterFraction_1 == nil then
        carSpeedJitterFraction_1 = 0
    end
    local v501
    if a1.spec.speedClasses == nil then
        v501 = false
        if carSpeedJitterFraction_1 > 0 then
            v501 = v500 <= 1 - (carSpeedJitterFraction_1 / 2)
        end
    else
        v501 = v500 <= 0.8
    end
    local v502
    if v501 then
        v502 = "truck"
    else
        v502 = "car"
    end
    local v503 = ((v500 > 0.68) and "medium") or "heavy"
    local v510
    if v501 then
        v510 = nil
        local v505, v506, v507, v507, v508, v508 = nil, nil, nil, nil, nil, nil
        local v509 = nil
        for _, value_85 in a1.cars do
            v507 = not value_85.active
            if v507 then
                v505 = value_85.visual
                if v505 ~= nil then
                    v505 = v505.emergency
                end
                if v505 == nil then
                    v509 = true
                else
                    v509 = false
                end
                if v509 then
                    v506 = value_85.visual
                    if v506 ~= nil then
                        v506 = v506.special
                    end
                    if v506 == nil then
                        v509 = true
                    else
                        v509 = false
                    end
                end
            end
            if v507 then
                v509 = value_85.visual
                if v509 == nil then
                    v507 = v509
                else
                    v507 = v509.kind
                end
                if v507 == "truck" then
                    v508 = true
                else
                    v508 = false
                end
                if v508 then
                    v508 = value_85.visual.weight == v503
                end
            else
                v508 = v507
            end
            if v508 == true then
                v510 = value_85
                break
            end
        end
        v510 = v510
    else
        v510 = nil
    end
    if v510 ~= nil then
        local v511 = v510
    else
        local v512 = nil
        for _, value_86 in a1.cars do
            local v513, v514, v515, v524 = nil, nil, nil, nil
            v513 = not value_86.active
            if v513 then
                v514 = value_86.visual
                if v514 ~= nil then
                    v514 = v514.emergency
                end
                if v514 == nil then
                    v513 = true
                else
                    v513 = false
                end
                if v513 then
                    v515 = value_86.visual
                    if v515 ~= nil then
                        v515 = v515.special
                    end
                    if v515 == nil then
                        v513 = true
                    else
                        v513 = false
                    end
                end
            end
            if v513 then
                v513 = value_86.visual
                if v513 ~= nil then
                    v513 = v513.kind
                end
                if v513 ~= nil then
                    v514 = v513
                else
                    v514 = "car"
                end
                local v505
                if v514 == v502 then
                    v505 = true
                else
                    v505 = false
                end
            else
                local v505
                v505 = v513
            end
            if v505 ~= true then
                v513 = not value_86.active
                if v513 then
                    v514 = value_86.visual
                    if v514 ~= nil then
                        v514 = v514.emergency
                    end
                    if v514 == nil then
                        v513 = true
                    else
                        v513 = false
                    end
                    if v513 then
                        v515 = value_86.visual
                        if v515 ~= nil then
                            v515 = v515.special
                        end
                        if v515 == nil then
                            v513 = true
                        else
                            v513 = false
                        end
                    end
                end
                local v505
                if v513 then
                    v513 = value_86.visual
                    if v513 ~= nil then
                        v513 = v513.kind
                    end
                    if v513 ~= nil then
                        v514 = v513
                    else
                        v514 = "car"
                    end
                    if v514 == v502 then
                        v505 = true
                    else
                        v505 = false
                    end
                else
                    v505 = v513
                end
                continue
            else
                v512 = value_86
            end
        end
        local v511 = v512
    end
    local v511, v516 = nil, nil
    if v511 ~= nil then
        v516 = v511
    else
        local v517
        if v501 then
            local v518 = nil
            for _, value_87 in a1.cars do
                local v519, v520, v521 = nil, nil, nil
                v519 = not value_87.active
                if v519 then
                    v520 = value_87.visual
                    if v520 ~= nil then
                        v520 = v520.emergency
                    end
                    if v520 == nil then
                        v519 = true
                    else
                        v519 = false
                    end
                    if v519 then
                        v521 = value_87.visual
                        if v521 ~= nil then
                            v521 = v521.special
                        end
                        if v521 == nil then
                            v519 = true
                        else
                            v519 = false
                        end
                    end
                end
                if v519 ~= true then
                    v519 = not value_87.active
                    if v519 then
                        v520 = value_87.visual
                        if v520 ~= nil then
                            v520 = v520.emergency
                        end
                        if v520 == nil then
                            v519 = true
                        else
                            v519 = false
                        end
                        if v519 then
                            v521 = value_87.visual
                            if v521 ~= nil then
                                v521 = v521.special
                            end
                            if v521 == nil then
                                v519 = true
                            else
                                v519 = false
                            end
                        end
                    end
                    continue
                else
                    v518 = value_87
                end
            end
            v517 = v518
        else
            v517 = nil
        end
        v516 = v517
    end
    if v516 ~= nil then
        v516.active = true
        v516.laneIndex = a2
        v516.s = a3
        v516.renderPrevS = a3
        v516.x = a1.spec.laneCenters[a2 + 1] + a1.trafficRandom:NextNumber(-a1.spec.laneOffsetMax, a1.spec.laneOffsetMax)
        v516.restX = v516.x
        v516.targetX = v516.x
        v516.speed = a4
        v516.overlapping = false
        v516.minGap = math.huge
        v516.nearMissAwarded = false
        v516.ageSeconds = ((a1.spawnFadeSuppressed) and math.huge) or 0
        local v522 = tbl_upv_6[a1.trafficRandom:NextInteger(0, #tbl_upv_6 - 1) + 1]
        if v516.visual == nil then
            v516.body.Color = v522
            v516.cabin.Color = v522:Lerp(Color3.fromRGB(20, 22, 26), 0.45)
            v516.headlight.Transparency = 0
            local headlight_1 = v516.headlight
            local v523
            if v516.speed >= 0 then
                v523 = Color3.fromRGB(255, 70, 60)
            else
                v523 = Color3.fromRGB(255, 240, 180)
            end
            headlight_1.Color = v523
        end
    else
        return nil
    end
end
u31.parkCar = function(a1, a2)
    --[[
      name: parkCar
      line: 6205
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a2.flung then
        a1.flungCount = math.max(a1.flungCount - 1, 0)
    end
    a2.flung = false
    a1:resetFling(a2)
    a2.active = false
    local visual_6 = a2.visual
    if visual_6 ~= nil then
        visual_6:park()
    end
    a2.body.CFrame = u1
    a2.cabin.CFrame = u1
    a2.headlight.CFrame = u1
    a2.axleFront.CFrame = u1
    a2.axleRear.CFrame = u1
end
u31.crash = function(a1, a2, a3)
    --[[
      name: crash
      line: 6222
      upvalues:
        HIGHWAY_RIDER_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        u13 (copy, index: 4)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1.wheelieActive = false
        a1.wheelieComboSeconds = 0
        a1.wheelieGraceRemaining = 0
        a1.wheelieTierIndex = 0
        a1:publishWheelieMeter()
        a1:resetWheelieFlame()
        a1:stopEngine()
        a1:stopWind()
        a1.engineAudio:stop()
        a1:hideSpeedSign()
        a1:clearAllEmergencies()
        local roundToken_upv_1 = a1.roundToken
        local endRunDelaySeconds_1 = HIGHWAY_RIDER_CONFIG_upv_1.endRunDelaySeconds
        local v524 = nil
        if a1.mode ~= "tp" then
            a1.context.audio.play("bikeCrash", {})
            a1.context.audio.play("tireScreech", {})
            a1.deathCameraCFrame = a1.stage.camera.CFrame
            a1.stage.shake(0.4)
            a1.popups:show(a1.stage.origin + Vector3.new(a1.playerX, 5, 4), "CRASH!", u13, 1.1)
            a1.vehicle:fling(a1.random, a2, a1.speed)
            v524 = a1.rider
            if v524 ~= nil then
                v524:fling(a1.random, a2, a1.speed)
            end
            a1:setRunning(false)
            task.delay(
                2.5,
                function()
                    --[[
                      line: 6313
                      upvalues:
                        a1 (copy, index: 1)
                        roundToken_upv_1 (copy, index: 2)
                    ]]
                    local v525 = nil
                    if a1.roundToken == roundToken_upv_1 then
                        a1.vehicle:park()
                        v525 = a1.rider
                        if v525 ~= nil then
                            v525:park()
                        end
                    else
                        return nil
                    end
                end
            )
        else
            a1.context.audio.play("carCrash", {})
            a1.context.audio.play("tireScreech", {})
            local crashTumble_3 = HIGHWAY_RIDER_CONFIG_upv_1.crashTumble
            local v526 = math.clamp((a1.speed - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed) / (a1.speedMax - HIGHWAY_RIDER_CONFIG_upv_1.minCruiseSpeed), 0, 1)
            if a3 ~= nil then
                a3.speed = math.max(a3.speed, a1.speed * crashTumble_3.hitCarShoveFactor)
            end
            a1.wreckActive = true
            a1.wreckGrounded = false
            a1.wreckHeight = 0
            a1.wreckPrevHeight = 0
            a1.wreckVerticalVelocity = lerp_upv_1(crashTumble_3.launchVerticalMin, crashTumble_3.launchVerticalMax, v526)
            a1.wreckForwardSpeed = a1.speed
            a1.wreckLateralVelocity = a2 * lerp_upv_1(crashTumble_3.launchLateralMin, crashTumble_3.launchLateralMax, v526)
            a1.wreckYaw = a1.bodyYaw
            a1.wreckPitch = 0
            a1.wreckRoll = 0
            a1.wreckPrevYaw = a1.wreckYaw
            a1.wreckPrevPitch = 0
            a1.wreckPrevRoll = 0
            a1.wreckAngularX = lerp_upv_1(crashTumble_3.flipRateMin, crashTumble_3.flipRateMax, v526) * a1.random:NextNumber(0.85, 1.15)
            a1.wreckAngularY = (((a2 <= 0) and 1) or -1) * lerp_upv_1(crashTumble_3.yawRateMin, crashTumble_3.yawRateMax, v526) * a1.random:NextNumber(0.7, 1.3)
            a1.wreckAngularZ = a1.random:NextNumber(-crashTumble_3.rollRateMax, crashTumble_3.rollRateMax) * v526
            a1.crashClock = os.clock()
            a1.crashCamStart = a1.stage.camera.CFrame
            if a1.labelsPart ~= nil then
                a1.labelsPart.CFrame = u1
            end
            a1.popups:hideAll()
            endRunDelaySeconds_1 = HIGHWAY_RIDER_CONFIG_upv_1.crashCam.endRunDelaySeconds
        end
        local u40 = a1:totalScore()
        task.delay(
            endRunDelaySeconds_1,
            function()
                --[[
                  line: 6325
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    u40 (copy, index: 3)
                ]]
                if a1.roundToken == roundToken_upv_1 then
                    a1:setRunning(false)
                    a1.context.endRun(u40)
                else
                    return nil
                end
            end
        )
    end
end
local tbl_34 = {}
tbl_34.HighwayRiderGame = u31
return tbl_34