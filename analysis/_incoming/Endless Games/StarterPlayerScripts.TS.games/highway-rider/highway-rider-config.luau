-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.slotsPerKind = {}
tbl_1.laneGlow = {}
tbl_1.fling = {}
local tbl_2 = {}
tbl_2.landing = {}
tbl_2.airSpin = {}
tbl_2.camera = {orbit = {}}
local tbl_3 = {}
tbl_3.fling = {}
local tbl_4 = {}
tbl_4.nightBackdropColor = Color3.fromRGB(21, 28, 52)
local tbl_5 = {}
tbl_5.fp = {laneCenters = {-10.5, -3.5, 3.5, 10.5}, speedClasses = {{}, {}, {}}, camera = {}}
tbl_5.tp = {laneCenters = {-13.44, -6.72, 0, 6.72, 13.44}, speedClasses = {{}, {}, {}}, camera = {lookSpring = {}}}
local tbl_6 = {}
local tbl_7 = {}
local tbl_8 = {}
local tbl_9 = {}
tbl_9.flameColor = Color3.fromRGB(70, 215, 255)
local tbl_10 = {}
tbl_10.flameColor = Color3.fromRGB(255, 105, 210)
tbl_7.milestones = {tbl_8, {flameColor = Color3.fromRGB(255, 120, 30)}, tbl_9, tbl_10}
tbl_6.multiplier = tbl_7
tbl_6.flameSound = {}
tbl_6.camera = {}
local tbl_12 = {}
tbl_12.steerFade = {}
tbl_12.animation = {airPool = {"action1", "action2", "action3", "action4", "action5"}}
local tbl_13 = {}
tbl_13.HIGHWAY_RIDER_CONFIG = {
    useAuthoredFpWorld = true,
    useAuthoredTpWorld = true,
    tunnel = {},
    biomes = {},
    director = {},
    trafficFade = {},
    emergency = tbl_1,
    ramp = tbl_2,
    oil = {},
    obstruction = tbl_3,
    dayNight = tbl_4,
    modes = tbl_5,
    speedStart = 60,
    speedMax = 130,
    speedRampSeconds = 90,
    minCruiseSpeed = 45,
    directDrive = {},
    tpWind = {},
    engineAudio = {tunnel = {}, fp = {}, tp = {}},
    fpDrive = {},
    steerResponseSeconds = 0.16,
    keySteerEaseInSeconds = 0.25,
    tiltFullLockDegrees = 25,
    tiltDeadZoneDegrees = 1.5,
    carPoolSize = 32,
    spawnAheadDistance = 420,
    despawnBehindDistance = 50,
    despawnAheadDistance = 620,
    spawnCheckIntervalStuds = 8,
    spawnGapStudsMin = 4,
    spawnGapStudsMax = 12,
    densityWave = {},
    sameDirSpeedMin = 35,
    sameDirSpeedMax = 45,
    oncomingSpeedMin = 25,
    oncomingSpeedMax = 35,
    headwaySecondsStart = 1.4,
    headwaySecondsMin = 0.7,
    densityRampSeconds = 80,
    coverageWindowSeconds = 0.9,
    coverageWindowSecondsMin = 0.72,
    coverageTightenSeconds = 240,
    startClearSeconds = 2.5,
    startClearBubbleStuds = 26,
    collisionForgiveness = 0.45,
    nearMissMinClosure = 18,
    nearMissBasePoints = 5,
    nearMissPointsPerTier = 2,
    speedTiers = 4,
    nearMissComboWindowSeconds = 4,
    nearMissComboMaxMultiplier = 5,
    studsPerPoint = 10,
    scoreFloorGraceSeconds = 0.6,
    oncomingBonusPointsPerSecond = 2,
    wheelie = tbl_6,
    closeCallPopupSeconds = 1.8,
    crashCam = {},
    crashTumble = {},
    introOrbit = {},
    rider = tbl_12,
    reviveSpeedFactor = 0.6,
    reviveClearBehind = 40,
    reviveClearAhead = 150,
    reviveInvulnSeconds = 1.5,
    endRunDelaySeconds = 0.9
}
return tbl_13