-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local portraitCameraDistance_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "camera-framing").portraitCameraDistance
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "coin-visual")
local CoinVisual_upv_1 = v1.CoinVisual
local findCoinTemplate_upv_1 = v1.findCoinTemplate
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow")
local SpectateFollow_upv_1 = v3.SpectateFollow
local approach_upv_1 = v3.approach
local DEFAULT_GAME_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").DEFAULT_GAME_LIGHTING
local v4 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v4.readResume
local writeResume_upv_1 = v4.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v5 = RuntimeLib_1.import(script, script.Parent, "crossy-road-assets")
local AuthoredProp_upv_1 = v5.AuthoredProp
local CROSSY_ROAD_NOTE_SCALARS_upv_1 = v5.CROSSY_ROAD_NOTE_SCALARS
local CrossyRoadAssets_upv_1 = v5.CrossyRoadAssets
local LaneSkin_upv_1 = v5.LaneSkin
local CROSSY_ROAD_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "crossy-road-config").CROSSY_ROAD_CONFIG
local v6 = RuntimeLib_1.import(script, script.Parent, "crossy-road-sim")
local CAR_HEIGHT_upv_1 = v6.CAR_HEIGHT
local CrossyRoadSim_upv_1 = v6.CrossyRoadSim
local FIELD_HALF_upv_1 = v6.FIELD_HALF
local GROUND_TOP_Y_upv_1 = v6.GROUND_TOP_Y
local LOG_HEIGHT_upv_1 = v6.LOG_HEIGHT
local PAD_HEIGHT_upv_1 = v6.PAD_HEIGHT
local PLAYER_Y_upv_1 = v6.PLAYER_Y
local ROCK_HEIGHT_upv_1 = v6.ROCK_HEIGHT
local TRAIN_HEIGHT_upv_1 = v6.TRAIN_HEIGHT
local TREE_HEIGHT_upv_1 = v6.TREE_HEIGHT
local u1 = CFrame.new(0, -1000, 0)
local u2 = CFrame.new()
local tbl_upv_1 = {}
tbl_upv_1.orient = u2
tbl_upv_1.fitFootprint = CROSSY_ROAD_CONFIG_upv_1.cellWidth * CROSSY_ROAD_CONFIG_upv_1.authoredObstacleFitFraction
local tbl_upv_2 = {}
tbl_upv_2.orient = u2
tbl_upv_2.fitFootprint = CROSSY_ROAD_CONFIG_upv_1.cellWidth * 0.9
local u3 = CFrame.Angles(0, 1.5707963267948966, 0)
local u4 = CFrame.Angles(0, math.pi, 0)
local tbl_upv_3 = {}
local u5 = CFrame.Angles(0, 1.5707963267948966, 0)
local u6 = CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)
local u7 = FIELD_HALF_upv_1 * 2 + CROSSY_ROAD_CONFIG_upv_1.fieldMargin * 2
local u8 = FIELD_HALF_upv_1 * 0.22
local u9 = CROSSY_ROAD_CONFIG_upv_1.laneDepth * 0.45
local Unit_upv_1 = (Vector3.new(0.3400000035762787, -0.75, 0.5699999928474426)).Unit
local Unit_upv_2 = Unit_upv_1:Cross(Vector3.new(0, 1, 0)).Unit
local Unit_upv_3 = Unit_upv_2:Cross(Unit_upv_1).Unit
local function solveAxisLimit_1(a1, a2, a3, a4, a5)
    --[[
      name: solveAxisLimit
      line: 168
    ]]
    local v7 = a1 - a4 * a5
    local v8 = -a1 - a4 * a5
    local v9 = math.huge
    if v7 > 1e-06 then
        v9 = math.min(v9, ((a3 * a5) - a2) / v7)
    end
    if v8 > 1e-06 then
        v9 = math.min(v9, ((a3 * a5) + a2) / v8)
    end
    return v9
end
local u10 = -Unit_upv_2.Z / Unit_upv_2.X
local u11 = FIELD_HALF_upv_1 - CROSSY_ROAD_CONFIG_upv_1.cameraEdgeInsetStuds
local u12 = Color3.fromRGB(255, 206, 74)
local u13 = Color3.fromRGB(126, 205, 92)
local v10 = Color3.fromRGB(110, 190, 80)
local v11 = Color3.fromRGB(104, 178, 78)
local v12 = Color3.fromRGB(92, 164, 68)
local u14 = Color3.fromRGB(148, 152, 158)
local v13 = Color3.fromRGB(78, 82, 92)
local v14 = Color3.fromRGB(68, 72, 82)
local u15 = Color3.fromRGB(96, 88, 78)
local u16 = Color3.fromRGB(148, 74, 64)
local u17 = Color3.fromRGB(84, 158, 232)
local v15 = Color3.fromRGB(70, 142, 220)
local u18 = Color3.fromRGB(58, 148, 66)
local u19 = Color3.fromRGB(140, 96, 56)
local u20 = Color3.fromRGB(96, 200, 110)
local u21 = Color3.fromRGB(196, 72, 68)
local u22 = Color3.fromRGB(255, 64, 60)
local u23 = Color3.fromRGB(96, 40, 40)
local u24 = Color3.fromRGB(250, 250, 250)
local u25 = Color3.fromRGB(255, 150, 46)
local u26 = Color3.fromRGB(150, 206, 236)
local u27 = Color3.fromRGB(255, 216, 102)
local tbl_upv_4 = {}
tbl_upv_4.GrassLight = u13
tbl_upv_4.GrassDark = v10
tbl_upv_4.ForestLight = v11
tbl_upv_4.ForestDark = v12
tbl_upv_4.RoadLight = v13
tbl_upv_4.RoadDark = v14
tbl_upv_4.RiverLight = u17
tbl_upv_4.RiverDark = v15
tbl_upv_4.Rail = u15
local u28 = Color3.fromRGB(150, 112, 72)
local u29 = Color3.fromRGB(75, 55, 44)
local u30 = Color3.new(1, 1, 1)
local u31 = Color3.fromRGB(255, 205, 80)
local u32 = Color3.fromRGB(96, 68, 44)
local u33 = Color3.fromRGB(120, 88, 58)
local u34 = Color3.fromRGB(255, 170, 60)
local tbl_upv_5 = {Color3.fromRGB(240, 88, 88), Color3.fromRGB(250, 190, 70), Color3.fromRGB(96, 176, 255), Color3.fromRGB(160, 118, 240), Color3.fromRGB(96, 214, 150), Color3.fromRGB(255, 140, 78)}
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 345
    ]]
    return "CrossyRoadGame"
end
tbl_7.__index = BaseWorldGame_upv_1
local u35 = setmetatable(tbl_6, tbl_7)
u35.__index = u35
u35.new = function(...)
    --[[
      name: new
      line: 351
      upvalues:
        u35 (ref, index: 1)
    ]]
    local v16 = setmetatable({}, u35)
    return v16:constructor(...) or v16
end
u35.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 355
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        SpectateFollow_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.lanes = {}
    a1.laneSkinPool = {}
    a1.eaglePosition = Vector3.new(0, 0, 0)
    a1.grabPosition = Vector3.new(0, 0, 0)
    a1.eagleCircling = false
    a1.swoopOrigin = nil
    a1.cameraFocus = Vector3.new(0, 0, 0)
    a1.swipedThisPress = false
    a1.runStartClock = 0
    a1.roundToken = 0
    a1.random = Random.new()
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
    a1.spectateRow = 0
    a1.spectateX = 0
    a1.ghostFacing = {}
end
u35.buildScene = function(a1)
    --[[
      name: buildScene
      line: 374
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        CrossyRoadAssets_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u26 (copy, index: 4)
        CrossyRoadSim_upv_1 (copy, index: 5)
        makeStagePart_upv_1 (copy, index: 6)
        u24 (copy, index: 7)
        u25 (copy, index: 8)
        PopupTextPool_upv_1 (copy, index: 9)
        FIELD_HALF_upv_1 (copy, index: 10)
        GROUND_TOP_Y_upv_1 (copy, index: 11)
        TRAIN_HEIGHT_upv_1 (copy, index: 12)
    ]]
    local container_1 = a1.stage.container
    a1.stage.camera.FieldOfView = CROSSY_ROAD_CONFIG_upv_1.fieldOfView
    a1.container = container_1
    if CROSSY_ROAD_CONFIG_upv_1.useAuthoredAssets then
        local v17 = CrossyRoadAssets_upv_1.new()
        if v17.available then
            a1.assets = v17
        end
    end
    a1:applyAuthoredLighting()
    a1.backdrop = makeSmoothPart_upv_1(container_1)
    a1.backdrop.Material = Enum.Material.Neon
    a1.backdrop.Color = u26
    a1.backdrop.Size = Vector3.new(1200, 1200, 1)
    for _ = 0, CROSSY_ROAD_CONFIG_upv_1.visibleLanes - 1 do
        table.insert(a1.lanes, (a1:makeLane(container_1)))
    end
    local tbl_8 = {}
    tbl_8.onLaneConfigured = function(a2)
        --[[
          name: onLaneConfigured
          line: 398
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:dressLane(a2)
    end
    tbl_8.onHopStarted = function(a3)
        --[[
          name: onHopStarted
          line: 401
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onHopStarted(a3)
    end
    tbl_8.onHopBlocked = function()
        --[[
          name: onHopBlocked
          line: 404
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.context.audio.play("thud", {})
    end
    tbl_8.onLanded = function(a4, a5)
        --[[
          name: onLanded
          line: 410
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onLanded(a4, a5)
    end
    tbl_8.onScored = function(a6)
        --[[
          name: onScored
          line: 413
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onScored(a6)
    end
    tbl_8.onCoinCollected = function(a7, a8)
        --[[
          name: onCoinCollected
          line: 416
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCoinCollected(a7, a8)
    end
    tbl_8.onTrainNear = function(a9, a10)
        --[[
          name: onTrainNear
          line: 419
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onTrainNear(a10)
    end
    tbl_8.onDeath = function(a11)
        --[[
          name: onDeath
          line: 422
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onDeath(a11)
    end
    tbl_8.onEagleSnatch = function()
        --[[
          name: onEagleSnatch
          line: 425
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onEagleSnatch()
    end
    tbl_8.onEagleGrab = function()
        --[[
          name: onEagleGrab
          line: 428
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onEagleGrab()
    end
    tbl_8.onEagleCarryDone = function(a12)
        --[[
          name: onEagleCarryDone
          line: 431
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onEagleCarryDone(a12)
    end
    tbl_8.onEagleWarn = function()
        --[[
          name: onEagleWarn
          line: 434
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onEagleWarn()
    end
    tbl_8.onEagleCalm = function()
        --[[
          name: onEagleCalm
          line: 437
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onEagleCalm()
    end
    a1.simulation = CrossyRoadSim_upv_1.new(a1.lanes, tbl_8)
    a1.body = makeStagePart_upv_1(container_1)
    a1.body.Size = Vector3.new(CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.9, CROSSY_ROAD_CONFIG_upv_1.playerSize, CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.9)
    a1.body.Color = u24
    a1.bodyBaseSize = a1.body.Size
    a1.beak = makeSmoothPart_upv_1(container_1)
    a1.beak.Size = Vector3.new(0.6000000238418579, 0.5, 0.699999988079071)
    a1.beak.Color = u25
    a1.deathBurst = Instance.new("ParticleEmitter")
    a1.deathBurst.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    a1.deathBurst.Rate = 0
    a1.deathBurst.Lifetime = NumberRange.new(0.3, 0.6)
    a1.deathBurst.Speed = NumberRange.new(6, 12)
    a1.deathBurst.SpreadAngle = Vector2.new(180, 180)
    a1.deathBurst.Size = NumberSequence.new(0.4)
    a1.deathBurst.LightEmission = 0.8
    a1.deathBurst.Color = ColorSequence.new(u24)
    a1.deathBurst.Parent = a1.body
    a1:buildEagle(container_1)
    a1:attachCharacterProps()
    a1:buildHopVfx(container_1)
    a1:buildRouteArrow(container_1)
    a1.popups = PopupTextPool_upv_1.new(container_1)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 463
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPressBegan()
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a13, a14)
                --[[
                  line: 466
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPressEnded(a14)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a15)
                --[[
                  line: 469
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a15)
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_9 = {}
        tbl_9.scoreToStuds = function(a16)
            --[[
              name: scoreToStuds
              line: 480
              upvalues:
                CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a16 * CROSSY_ROAD_CONFIG_upv_1.laneDepth
        end
        tbl_9.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 483
              upvalues:
                a1 (copy, index: 1)
                CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
            ]]
            return a1.simulation.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth
        end
        tbl_9.poseMarker = function(a17)
            --[[
              name: poseMarker
              line: 486
              upvalues:
                origin_upv_1 (copy, index: 1)
                FIELD_HALF_upv_1 (copy, index: 2)
                GROUND_TOP_Y_upv_1 (copy, index: 3)
                TRAIN_HEIGHT_upv_1 (copy, index: 4)
            ]]
            return CFrame.new(origin_upv_1.X - (FIELD_HALF_upv_1 + 4), (((origin_upv_1.Y + GROUND_TOP_Y_upv_1) + TRAIN_HEIGHT_upv_1) + 0.4) + 2.8, origin_upv_1.Z + a17)
        end
        registerRivalMarkers_1(tbl_9)
    end
end
u35.buildEagle = function(a1, a2)
    --[[
      name: buildEagle
      line: 499
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u32 (copy, index: 2)
        u33 (copy, index: 3)
        u34 (copy, index: 4)
    ]]
    a1.eagleBody = makeSmoothPart_upv_1(a2)
    a1.eagleBody.Size = Vector3.new(2.5999999046325684, 2, 3.799999952316284)
    a1.eagleBody.Color = u32
    a1.eagleWingLeft = makeSmoothPart_upv_1(a2)
    a1.eagleWingLeft.Size = Vector3.new(4.400000095367432, 0.4000000059604645, 2.4000000953674316)
    a1.eagleWingLeft.Color = u33
    a1.eagleWingRight = makeSmoothPart_upv_1(a2)
    a1.eagleWingRight.Size = Vector3.new(4.400000095367432, 0.4000000059604645, 2.4000000953674316)
    a1.eagleWingRight.Color = u33
    a1.eagleBeak = makeSmoothPart_upv_1(a2)
    a1.eagleBeak.Size = Vector3.new(0.6000000238418579, 0.5, 1)
    a1.eagleBeak.Color = u34
end
u35.chickenPropOptions = function(a1, a2)
    --[[
      name: chickenPropOptions
      line: 513
      upvalues:
        u5 (copy, index: 1)
    ]]
    local v18, v19 = a2:GetBoundingBox()
    local tbl_10 = {}
    tbl_10.orient = CFrame.new(0, 0.3999999999999999 * (a2:GetPivot().Y - (v18.Y - (v19.Y / 2))), 0) * u5
    return tbl_10
end
u35.attachCharacterProps = function(a1)
    --[[
      name: attachCharacterProps
      line: 522
      upvalues:
        AuthoredProp_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    local v20 = nil
    if a1.assets ~= nil then
        v20 = a1:chickenTemplate()
        if v20 ~= nil then
            a1.chickenProp = AuthoredProp_upv_1:make(v20, a1.container, a1:chickenPropOptions(v20))
            a1.body.Transparency = 1
            a1.beak.Transparency = 1
        end
        local v21 = a1.assets:first("Eagle") or (a1.assets:first("Hawk"))
        if v21 ~= nil then
            a1.eagleProp = AuthoredProp_upv_1:make(v21, a1.container, {orient = u6})
            a1.eagleBody.Transparency = 1
            a1.eagleWingLeft.Transparency = 1
            a1.eagleWingRight.Transparency = 1
            a1.eagleBeak.Transparency = 1
        end
    else
        return nil
    end
end
u35.chickenTemplate = function(a1)
    --[[
      name: chickenTemplate
      line: 543
    ]]
    local assets_1 = a1.assets
    if assets_1 ~= nil then
        assets_1 = assets_1:first("Chicken")
    end
    local v22, v23 = nil, nil
    if assets_1 ~= nil then
        v23 = assets_1
    else
        v22 = a1.assets
        if v22 ~= nil then
            v22 = v22:first("Player")
        end
        v23 = v22
    end
    return v23
end
u35.buildRouteArrow = function(a1, a2)
    --[[
      name: buildRouteArrow
      line: 558
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
    ]]
    local tbl_11 = {}
    local v24 = makeSmoothPart_upv_1(a2)
    v24.Size = Vector3.new(3.200000047683716, 0.5, 0.8999999761581421)
    v24.Material = Enum.Material.Neon
    v24.Color = u12
    table.insert(tbl_11, v24)
    local v25 = makeSmoothPart_upv_1(a2)
    v25.Size = Vector3.new(3.200000047683716, 0.5, 0.8999999761581421)
    v25.Material = Enum.Material.Neon
    v25.Color = u12
    table.insert(tbl_11, v25)
    a1.routeArrowBars = {tbl_11[1], tbl_11[2]}
end
u35.buildHopVfx = function(a1, a2)
    --[[
      name: buildHopVfx
      line: 570
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
    ]]
    a1.vfxAnchor = makeSmoothPart_upv_1(a2)
    a1.vfxAnchor.Transparency = 1
    a1.vfxAnchor.Size = Vector3.new(0.800000011920929, 0.20000000298023224, 0.800000011920929)
    a1.hopPuff = a1:makePuffEmitter(0.38, 3, 5)
    a1.landPuff = a1:makePuffEmitter(0.55, 4, 8)
end
u35.makePuffEmitter = function(a1, a2, a3, a4)
    --[[
      name: makePuffEmitter
      line: 577
    ]]
    local v26 = Instance.new("ParticleEmitter")
    v26.Texture = "rbxasset://textures/particles/smoke_main.dds"
    v26.Rate = 0
    v26.Lifetime = NumberRange.new(0.22, 0.42)
    v26.Speed = NumberRange.new(a3, a4)
    v26.SpreadAngle = Vector2.new(80, 80)
    v26.EmissionDirection = Enum.NormalId.Top
    v26.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, a2), NumberSequenceKeypoint.new(1, 0)})
    local tbl_12 = {NumberSequenceKeypoint.new(0, 0.15), NumberSequenceKeypoint.new(1, 1)}
    v26.Transparency = NumberSequence.new(tbl_12)
    v26.Rotation = NumberRange.new(0, 360)
    v26.RotSpeed = NumberRange.new(-120, 120)
    v26.Drag = 5
    v26.Acceleration = Vector3.new(0, -6, 0)
    v26.LightEmission = 0.1
    v26.Parent = a1.vfxAnchor
    return v26
end
u35.surfacePuffColors = function(a1, a2)
    --[[
      name: surfacePuffColors
      line: 595
      upvalues:
        u13 (copy, index: 1)
        u28 (copy, index: 2)
        u20 (copy, index: 3)
        u17 (copy, index: 4)
        u19 (copy, index: 5)
        u30 (copy, index: 6)
        u15 (copy, index: 7)
        u29 (copy, index: 8)
    ]]
    if a2 == nil then
        local tbl_13 = {}
        tbl_13.primary = u13
        tbl_13.accent = u28
        return tbl_13
    elseif a2.kind ~= "river" then
        if a2.kind == "road" then
            local tbl_14 = {}
            tbl_14.primary = a2.strip.Color:Lerp(u30, 0.4)
            tbl_14.accent = a2.strip.Color
            return tbl_14
        elseif a2.kind ~= "rail" then
            local tbl_15 = {}
            tbl_15.primary = a2.strip.Color
            tbl_15.accent = u28
            return tbl_15
        else
            local tbl_16 = {}
            tbl_16.primary = u15:Lerp(u30, 0.3)
            tbl_16.accent = u29
            return tbl_16
        end
    elseif a1.simulation.onLilyPad then
        local tbl_17 = {}
        tbl_17.primary = u20
        tbl_17.accent = u17
        return tbl_17
    else
        local tbl_18 = {}
        tbl_18.primary = u19
        tbl_18.accent = u17
        return tbl_18
    end
end
u35.emitSurfacePuff = function(a1, a2, a3, a4)
    --[[
      name: emitSurfacePuff
      line: 631
      upvalues:
        GROUND_TOP_Y_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local simulation_1 = a1.simulation
    local v27 = a1:surfacePuffColors(simulation_1:laneAtRow(simulation_1.row))
    local origin_2 = a1.stage.origin
    a1.vfxAnchor.CFrame = CFrame.new(origin_2.X + a3, ((origin_2.Y + GROUND_TOP_Y_upv_1) + simulation_1:currentSurfaceY()) + 0.2, origin_2.Z + (simulation_1.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
    a2.Color = ColorSequence.new(v27.primary)
    a2:Emit(a4)
    a2.Color = ColorSequence.new(v27.accent)
    a2:Emit((math.ceil(a4 / 2)))
end
u35.makeLane = function(a1, a2)
    --[[
      name: makeLane
      line: 641
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u20 (copy, index: 6)
        TRAIN_HEIGHT_upv_1 (copy, index: 7)
        u21 (copy, index: 8)
        u23 (copy, index: 9)
        u31 (copy, index: 10)
        findCoinTemplate_upv_1 (copy, index: 11)
        CoinVisual_upv_1 (copy, index: 12)
    ]]
    local v28 = makeStagePart_upv_1(a2)
    v28.Size = Vector3.new(u7, CROSSY_ROAD_CONFIG_upv_1.laneThickness, CROSSY_ROAD_CONFIG_upv_1.laneDepth)
    v28.CFrame = u1
    local tbl_19 = {}
    for _ = 0, CROSSY_ROAD_CONFIG_upv_1.objectsPerLane - 1 do
        local v29 = makeStagePart_upv_1(a2)
        v29.CFrame = u1
        table.insert(tbl_19, v29)
    end
    local tbl_20 = {}
    for _ = 0, CROSSY_ROAD_CONFIG_upv_1.padsPerLane - 1 do
        local v30 = makeSmoothPart_upv_1(a2)
        v30.Shape = Enum.PartType.Cylinder
        v30.Color = u20
        v30.CFrame = u1
        table.insert(tbl_20, v30)
    end
    local v31 = makeSmoothPart_upv_1(a2)
    v31.Size = Vector3.new(CROSSY_ROAD_CONFIG_upv_1.trainLength, TRAIN_HEIGHT_upv_1, CROSSY_ROAD_CONFIG_upv_1.laneDepth * 0.9)
    v31.Color = u21
    v31.CFrame = u1
    local v32 = makeSmoothPart_upv_1(a2)
    v32.Material = Enum.Material.Neon
    v32.Size = Vector3.new(1, 1, 1)
    v32.Color = u23
    v32.CFrame = u1
    local v33 = makeSmoothPart_upv_1(a2)
    v33.Shape = Enum.PartType.Cylinder
    v33.Material = Enum.Material.Neon
    v33.Color = u31
    v33.Size = Vector3.new(0.3499999940395355, 1.7000000476837158, 1.7000000476837158)
    v33.CFrame = u1
    local v34 = Instance.new("ParticleEmitter")
    v34.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    v34.Rate = 0
    v34.Lifetime = NumberRange.new(0.25, 0.5)
    v34.Speed = NumberRange.new(4, 9)
    v34.SpreadAngle = Vector2.new(180, 180)
    v34.Size = NumberSequence.new(0.35)
    v34.LightEmission = 1
    v34.Color = ColorSequence.new(u31)
    v34.Parent = v33
    local tbl_21 = {}
    local tbl_22 = {}
    local tbl_23 = {}
    local v35
    v35 = nil
    local v36 = findCoinTemplate_upv_1()
    if v36 ~= nil then
        v35 = CoinVisual_upv_1:make(v36, a2, {})
        v33.Transparency = 1
    end
    local tbl_24 = {}
    tbl_24.strip = v28
    tbl_24.objects = tbl_19
    tbl_24.pads = tbl_20
    tbl_24.train = v31
    tbl_24.light = v32
    tbl_24.coin = v33
    tbl_24.coinSparkle = v34
    tbl_24.positions = {}
    tbl_24.treeColumns = {}
    tbl_24.rockColumns = {}
    tbl_24.padColumns = {}
    tbl_24.row = 0
    tbl_24.kind = "grass"
    tbl_24.velocity = 0
    tbl_24.moverCount = 0
    tbl_24.moverLength = 0
    tbl_24.trainPhase = "clear"
    tbl_24.trainTimer = 0
    tbl_24.trainX = 0
    tbl_24.trainDir = 1
    tbl_24.trainRandom = Random.new()
    tbl_24.blinkTimer = 0
    tbl_24.shakeArmed = false
    tbl_24.coinActive = false
    tbl_24.coinColumn = 0
    tbl_24.coinLogIndex = -1
    tbl_24.coinY = 0
    tbl_24.objectProps = tbl_21
    tbl_24.objectKeys = tbl_22
    tbl_24.padProps = tbl_23
    tbl_24.trainProp = nil
    tbl_24.lightProp = nil
    tbl_24.coinProp = v35
    tbl_24.stripStyle = nil
    tbl_24.routeColumn = 0
    tbl_24.stripSkinKey = nil
    tbl_24.stripSkin = nil
    tbl_24.cosmeticRandom = Random.new()
    return tbl_24
end
u35.resetRound = function(a1)
    --[[
      name: resetRound
      line: 742
      upvalues:
        u25 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.runStartClock = os.clock()
    a1.spectating = false
    a1:parkEagle()
    a1.simulation:reset(a1.context.getRunSeed())
    local ghostPool_1 = a1.ghostPool
    if ghostPool_1 ~= nil then
        ghostPool_1:hideAll()
    end
    a1.body.Anchored = true
    a1.body.Size = a1.bodyBaseSize
    a1.beak.Color = u25
    a1.cameraFocus = a1:focusTarget()
    a1:updateCamera(0)
    a1.context.reportScore(0)
end
u35.captureRound = function(a1)
    --[[
      name: captureRound
      line: 760
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.simulation.dead then
        return nil
    else
        local u36 = a1.simulation:resumeState()
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 765
                  upvalues:
                    u36 (copy, index: 1)
                ]]
                a2:int(u36.frontRow):int(u36.row):int(u36.column):num(u36.driftX)
                a2:str(u36.facing):int(u36.furthestRow):num(u36.deathEdgeRow)
                a2:int(u36.score):int(u36.coinsCollected):num(u36.boardClock):bool(u36.onLilyPad)
            end
        )
    end
end
u35.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 771
      upvalues:
        readResume_upv_1 (copy, index: 1)
        u25 (copy, index: 2)
    ]]
    local v37 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 772
            ]]
            local tbl_25 = {}
            tbl_25.frontRow = a3:int()
            tbl_25.row = a3:int()
            tbl_25.column = a3:int()
            tbl_25.driftX = a3:num()
            tbl_25.facing = a3:str()
            tbl_25.furthestRow = a3:int()
            tbl_25.deathEdgeRow = a3:num()
            tbl_25.score = a3:int()
            tbl_25.coinsCollected = a3:int()
            tbl_25.boardClock = a3:num()
            tbl_25.onLilyPad = a3:bool()
            return tbl_25
        end
    )
    local v38, v39 = nil, nil
    if v37 ~= nil then
        if v37.facing ~= "forward" and v37.facing ~= "back" and v37.facing ~= "left" and v37.facing ~= "right" then
            return false
        end
        v38 = a1.context.getRunSeed()
        v39 = {}
        v39.frontRow = v37.frontRow
        v39.row = v37.row
        v39.column = v37.column
        v39.driftX = v37.driftX
        v39.facing = v37.facing
        v39.furthestRow = v37.furthestRow
        v39.deathEdgeRow = v37.deathEdgeRow
        v39.score = a2.score
        v39.coinsCollected = a2.pickups
        v39.boardClock = v37.boardClock
        v39.onLilyPad = v37.onLilyPad
        local v40 = nil
        if a1.simulation:restore(v38, v39) then
            for _, value_1 in a1.simulation.lanes do
                a1:dressLane(value_1)
            end
            v40 = a1.ghostPool
            if v40 ~= nil then
                v40:hideAll()
            end
            a1:parkEagle()
            a1.roundToken = a1.roundToken + 1
            a1.runStartClock = os.clock()
            a1.body.Anchored = true
            a1.body.Size = a1.bodyBaseSize
            a1.beak.Color = u25
            a1.cameraFocus = a1:focusTarget()
            a1:updateCamera(0)
            a1.context.reportScore(a2.score)
            a1.context.reportPickup(a2.pickups)
            return true
        end
    end
    return false
end
u35.revive = function(a1)
    --[[
      name: revive
      line: 829
      upvalues:
        u25 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.runStartClock = os.clock()
    a1:parkEagle()
    a1.simulation:revive()
    a1.body.Anchored = true
    a1.body.Size = a1.bodyBaseSize
    a1.beak.Color = u25
    a1.cameraFocus = a1:focusTarget()
    a1:setRunning(true)
end
u35.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 840
    ]]
    a1.simulation:fixedUpdate(a2)
end
u35.dressLane = function(a1, a2)
    --[[
      name: dressLane
      line: 843
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
        u13 (copy, index: 3)
    ]]
    a2.cosmeticRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 1e+06 + a2.row)
    a1:parkLaneObjects(a2)
    a1:positionStrip(a2)
    local v41
    if a2.stripStyle == nil then
        v41 = nil
    else
        v41 = tbl_upv_4[a2.stripStyle]
    end
    local v42 = v41
    if v42 == nil then
        v42 = u13
    end
    a2.strip.Color = v42
    if a2.kind == "grass" then
        a1:poseGrassObstacles(a2)
    elseif a2.kind == "river" and a2.moverCount == 0 then
        a1:posePads(a2)
    elseif a2.kind == "rail" then
        a1:ensureRailProps(a2)
    end
    if a1.assets ~= nil then
        a1:applyMoverOverlays(a2)
    end
    a1:applyStripSkin(a2)
end
u35.onHopStarted = function(a1, a2)
    --[[
      name: onHopStarted
      line: 873
    ]]
    a1:emitSurfacePuff(a1.hopPuff, a2, 4)
    a1.context.audio.play("hopStep", {})
end
u35.onLanded = function(a1, a2, a3)
    --[[
      name: onLanded
      line: 881
    ]]
    if a3 then
        a1.context.audio.play("thud", {})
    end
    a1:emitSurfacePuff(a1.landPuff, a2, 7)
end
u35.onScored = function(a1, a2)
    --[[
      name: onScored
      line: 891
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u27 (copy, index: 2)
    ]]
    a1.context.reportScore(a2)
    if a2 % 100 == 0 then
        a1.context.audio.play("perfect", {})
        local origin_3 = a1.stage.origin
        local simulation_2 = a1.simulation
        a1.popups:show(Vector3.new(origin_3.X + simulation_2:playerWorldX(), origin_3.Y + 4, origin_3.Z + (simulation_2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth)), ("%*"):format(a2), u27, 1.1)
    end
end
u35.onCoinCollected = function(a1, a2, a3)
    --[[
      name: onCoinCollected
      line: 903
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.coinSparkle:Emit(10)
    a2.coin.CFrame = u1
    local coinProp_1 = a2.coinProp
    if coinProp_1 ~= nil then
        coinProp_1:park()
    end
    a1.context.reportPickup(a3)
    a1.context.audio.play("coinTick", {pitch = 1 + ((a3 % 8) * 0.05)})
end
u35.onTrainNear = function(a1, a2)
    --[[
      name: onTrainNear
      line: 917
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1:isRunning() then
        a1.stage.shake(CROSSY_ROAD_CONFIG_upv_1.trainShakeMagnitude * a2)
        a1.context.audio.play("trainPass", {volume = 0.3 + (0.4 * a2)})
    else
        return nil
    end
end
u35.onDeath = function(a1, a2)
    --[[
      name: onDeath
      line: 927
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1:setRunning(false)
    a1.context.audio.play("buzz", {})
    a1.stage.shake(0.8)
    a1.deathBurst:Emit(16)
    a1.beak.CFrame = u1
    if a2 ~= "water" then
        a1.context.audio.play("splat", {})
        a1:flingBody(a2)
    else
        a1.context.audio.play("splash", {})
        a1:sinkBody()
    end
    local score_upv_1 = a1.simulation.score
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        0.85,
        function()
            --[[
              line: 951
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_1 (copy, index: 2)
                score_upv_1 (copy, index: 3)
            ]]
            if a1.roundToken ~= roundToken_upv_1 then
                return
            end
            a1.context.endRun(score_upv_1)
        end
    )
end
u35.onEagleSnatch = function(a1)
    --[[
      name: onEagleSnatch
      line: 957
      upvalues:
        PLAYER_Y_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local simulation_3 = a1.simulation
    local origin_4 = a1.stage.origin
    a1.grabPosition = Vector3.new(origin_4.X + simulation_3:playerWorldX(), (origin_4.Y + simulation_3:poseY()) + PLAYER_Y_upv_1, origin_4.Z + (simulation_3:playerRowContinuous() * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
    a1.body.Size = a1.bodyBaseSize
    local v43 = CFrame.new(a1.grabPosition) * CFrame.Angles(0, simulation_3:facingYaw(), 0)
    a1.body.CFrame = v43
    a1.beak.CFrame = v43 * CFrame.new(0, CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.12, (CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.5) + 0.25)
    local v44
    if a1.eagleCircling then
        v44 = a1.eaglePosition
    else
        v44 = nil
    end
    a1.swoopOrigin = v44
    a1.eagleCircling = false
    if a1.swoopOrigin == nil then
        a1.eaglePosition = a1.grabPosition + Vector3.new(36, 20, 0)
    end
    a1.context.audio.play("eagleScreech", {})
    a1.context.audio.play("whoosh", {})
end
u35.onEagleWarn = function(a1)
    --[[
      name: onEagleWarn
      line: 985
    ]]
    a1.eagleCircling = true
    a1.context.audio.play("eagleScreech", {})
end
u35.onEagleCalm = function(a1)
    --[[
      name: onEagleCalm
      line: 993
    ]]
    a1:parkEagle()
end
u35.onEagleGrab = function(a1)
    --[[
      name: onEagleGrab
      line: 996
    ]]
    a1.context.audio.play("flap", {})
    a1.context.audio.play("buzz", {})
    a1.stage.shake(0.6)
end
u35.onEagleCarryDone = function(a1, a2)
    --[[
      name: onEagleCarryDone
      line: 1007
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1:parkEagle()
    a1.body.CFrame = u1
    a1.beak.CFrame = u1
    a1:setRunning(false)
    a1.context.endRun(a2)
end
u35.flingBody = function(a1, a2)
    --[[
      name: flingBody
      line: 1014
    ]]
    local simulation_4 = a1.simulation
    local v45 = simulation_4:laneAtRow(simulation_4.row)
    local v46 = ((a1.random:NextNumber() >= 0.5) and -1) or 1
    if a2 ~= "train" or v45 == nil then
        if v45 ~= nil then
            v46 = math.sign(v45.velocity)
        end
    else
        v46 = v45.trainDir
    end
    local v47 = ((a2 ~= "train") and 20) or 34
    a1.body.Anchored = false
    a1.body.AssemblyLinearVelocity = Vector3.new(v46 * v47, 12, 0)
    a1.body.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-8, 8), a1.random:NextNumber(-8, 8), a1.random:NextNumber(-8, 8))
    a1:parkGuardBody()
end
u35.sinkBody = function(a1)
    --[[
      name: sinkBody
      line: 1029
    ]]
    a1.body.Anchored = false
    a1.body.AssemblyLinearVelocity = Vector3.new(0, -4, 0)
    a1.body.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-3, 3), 0, a1.random:NextNumber(-3, 3))
    a1:parkGuardBody()
end
u35.parkGuardBody = function(a1)
    --[[
      name: parkGuardBody
      line: 1035
    ]]
    local roundToken_upv_2 = a1.roundToken
    task.delay(
        2.5,
        function()
            --[[
              line: 1037
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_2 (copy, index: 2)
            ]]
            if a1.roundToken == roundToken_upv_2 then
                a1.body.Anchored = true
                a1.body.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                a1.body.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            else
                return nil
            end
        end
    )
end
u35.snapshot = function(a1)
    --[[
      name: snapshot
      line: 1046
    ]]
    local simulation_5 = a1.simulation
    local v48 = simulation_5:ridingLogIndex()
    local v49
    if v48 < 0 then
        v49 = nil
    else
        v49 = simulation_5:laneAtRow(simulation_5.row)
    end
    local v50
    if v49 == nil then
        v50 = 0
    else
        v50 = simulation_5:playerWorldX() - v49.positions[v48 + 1]
    end
    local tbl_26 = {}
    tbl_26.score = simulation_5.score
    tbl_26.values = {simulation_5.boardClock, simulation_5:playerRowContinuous(), simulation_5:playerWorldX(), simulation_5:poseY(), simulation_5:facingYaw(), v48, v50}
    return tbl_26
end
u35.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 1056
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local function createBody_1(a3)
            --[[
              name: createBody
              line: 1062
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:createGhostBody(a3)
        end
        local u37 = GhostPool_upv_1.new(a1.stage.container, {size = Vector3.new(CROSSY_ROAD_CONFIG_upv_1.playerSize, CROSSY_ROAD_CONFIG_upv_1.playerSize, CROSSY_ROAD_CONFIG_upv_1.playerSize), createBody = createBody_1})
        a1.ghostPool = u37
        a1.context.janitor:Add(
            function()
                --[[
                  line: 1067
                  upvalues:
                    u37 (copy, index: 1)
                ]]
                return u37:destroy()
            end
        )
    end
end
u35.createGhostBody = function(a1, a2)
    --[[
      name: createGhostBody
      line: 1072
      upvalues:
        AuthoredProp_upv_1 (copy, index: 1)
    ]]
    local v51 = a1:chickenTemplate()
    local v52 = nil
    if v51 ~= nil then
        local u38 = Instance.new("Folder")
        u38.Name = "GhostChicken"
        u38.Parent = a1.stage.container
        local u39 = AuthoredProp_upv_1:make(v51, u38, a1:chickenPropOptions(v51))
        v52 = u38:FindFirstChildWhichIsA("BasePart", true)
        if v52 ~= nil then
            local tbl_27 = {}
            tbl_27.root = u38
            tbl_27.anchor = v52
            tbl_27.pose = function(a3, a4, a5, a6)
                --[[
                  name: pose
                  line: 1089
                  upvalues:
                    a1 (copy, index: 1)
                    a2 (copy, index: 2)
                    u39 (copy, index: 3)
                ]]
                local v53 = CFrame.new(a3)
                local v54, v54
                if a6 ~= nil then
                    v54 = a6
                else
                    v54 = a1.ghostFacing[a2]
                    if v54 == nil then
                        v54 = 0
                    end
                end
                u39:pose(v53 * CFrame.Angles(0, v54, 0))
            end
            tbl_27.destroy = function()
                --[[
                  name: destroy
                  line: 1103
                  upvalues:
                    u38 (copy, index: 1)
                ]]
                return u38:Destroy()
            end
            return tbl_27
        end
        u38:Destroy()
    end
    return nil
end
u35.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 1108
      upvalues:
        PLAYER_Y_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local ghostPool_2 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_2 ~= nil and matchOpponents_1 ~= nil then
        local simulation_6 = a1.simulation
        local origin_5 = a1.stage.origin
        local v55 = nil
        local v56 = nil
        local v57 = nil
        local _ = nil
        local v58 = nil
        local v59 = nil
        local v60 = nil
        for v62, value_2 in matchOpponents_1 do
            v59 = value_2.snapshot
            if v59 == nil or #v59.values < 7 then
                continue
            end
            v56 = v59.values[2]
            if a1.spectating then
                v57 = a1.spectateRow
            else
                v57 = simulation_6.row
            end
            v60 = v56 - v57
            if v60 < -14 or v60 > 34 then
                continue
            end
            v57 = simulation_6:laneAtRow(math.round(v56))
            if v57 == nil then
                continue
            end
            v55 = v59.values[3]
            v58 = v59.values[6]
            if (value_2.alive) and v58 >= 0 and v57.kind == "river" and v58 < v57.moverCount and math.abs(v60) < 1 then
                v55 = v57.positions[v58 + 1] + v59.values[7]
            end
            local v61 = Vector3.new(origin_5.X + v55, (origin_5.Y + v59.values[4]) + PLAYER_Y_upv_1, origin_5.Z + (v56 * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
            a1.ghostFacing[value_2.userId] = v59.values[5]
            ghostPool_2:show(value_2.userId, value_2.username, v61, value_2.alive, v59.values[5])
        end
        ghostPool_2:step(a2)
    else
        return nil
    end
end
u35.render = function(a1, a2)
    --[[
      name: render
      line: 1149
    ]]
    local simulation_7 = a1.simulation
    local origin_6 = a1.stage.origin
    for _, value_3 in a1.lanes do
        if value_3.kind == "road" or value_3.kind == "river" then
            a1:renderMovers(value_3, origin_6)
            continue
        end
        if value_3.kind == "rail" then
            a1:renderRail(value_3, origin_6)
        end
    end
    a1:renderCoins(origin_6)
    if not (simulation_7.dead) then
        a1:renderPlayer(origin_6)
    end
    if simulation_7.eagleState ~= "none" or simulation_7.eagleWarning then
        a1:renderEagle()
    end
    local chickenProp_1 = a1.chickenProp
    if chickenProp_1 ~= nil then
        chickenProp_1:pose(a1.body.CFrame)
    end
    a1:updateGhosts(a2)
    a1:updateCamera(a2)
end
u35.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 1177
    ]]
    if a1.matchOpponents ~= nil and a1.simulation.dead then
        a1.simulation:advanceBoardOnly((math.min(a2, 0.25)))
    end
    if a1.simulation.dead and a1.spectate:isActive() then
        a1:spectateStep(a2)
    end
    a1:render(a2)
end
u35.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 1186
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u35.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 1192
      upvalues:
        approach_upv_1 (copy, index: 1)
    ]]
    local v62 = a1.spectate:value(1)
    local v63 = a1.spectate:value(2)
    if v62 ~= nil and v63 ~= nil then
        if not (a1.spectating) then
            a1.spectating = true
            a1.spectateRow = a1.simulation:playerRowContinuous()
            a1.spectateX = a1.simulation:playerWorldX()
            a1.body.Anchored = true
            a1.body.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -400, 0))
        end
        a1.spectateRow = approach_upv_1(a1.spectateRow, v62, 6, a2)
        a1.spectateX = approach_upv_1(a1.spectateX, v63, 6, a2)
        a1.simulation:advanceLaneWindowTo((math.round(a1.spectateRow)))
        return
    end
    return nil
end
u35.renderCoins = function(a1, a2)
    --[[
      name: renderCoins
      line: 1210
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        GROUND_TOP_Y_upv_1 (copy, index: 2)
    ]]
    local v64 = os.clock() * 3
    local v65 = nil
    for _, value_4 in a1.lanes do
        if not (value_4.coinActive) then
            continue
        end
        value_4.coin.CFrame = CFrame.new(a2.X + (((value_4.coinLogIndex < 0) and (value_4.coinColumn * CROSSY_ROAD_CONFIG_upv_1.cellWidth)) or (value_4.positions[value_4.coinLogIndex + 1])), (((a2.Y + GROUND_TOP_Y_upv_1) + value_4.coinY) + 1.05) + (math.sin((v64 * 0.7) + value_4.row) * 0.12), a2.Z + (value_4.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth)) * CFrame.Angles(0, v64 + value_4.row, 0)
        v65 = value_4.coinProp
        if v65 ~= nil then
            v65:pose(value_4.coin.CFrame)
        end
    end
end
u35.renderMovers = function(a1, a2, a3)
    --[[
      name: renderMovers
      line: 1227
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        CAR_HEIGHT_upv_1 (copy, index: 2)
        LOG_HEIGHT_upv_1 (copy, index: 3)
        tbl_upv_5 (copy, index: 4)
        u19 (copy, index: 5)
        GROUND_TOP_Y_upv_1 (copy, index: 6)
    ]]
    local v66 = a3.Z + a2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth
    local v67 = a2.kind == "road"
    local v68
    if v67 then
        v68 = CAR_HEIGHT_upv_1
    else
        v68 = LOG_HEIGHT_upv_1
    end
    local v69 = 0
    local v70 = false
    if v70 then
        v69 = v69 + 1
    else
        v70 = true
    end
    local v71 = nil
    if v69 < a2.moverCount then
        local v72 = a2.objects[v69 + 1]
        v72.Size = Vector3.new(a2.moverLength, v68, CROSSY_ROAD_CONFIG_upv_1.laneDepth * ((v67 and 0.72) or 0.86))
        local v73
        if v67 then
            v73 = tbl_upv_5[(((a2.row * 3) + v69) % #tbl_upv_5) + 1]
        else
            v73 = u19
        end
        v72.Color = v73
        v72.CFrame = CFrame.new(a3.X + a2.positions[v69 + 1], (a3.Y + GROUND_TOP_Y_upv_1) + (v68 / 2), v66)
        v71 = a2.objectProps[v69]
        if v71 ~= nil then
            v71:pose(v72.CFrame)
        end
        if v70 then
            v69 = v69 + 1
        else
            v70 = true
        end
    end
end
u35.renderRail = function(a1, a2, a3)
    --[[
      name: renderRail
      line: 1256
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u22 (copy, index: 2)
        u23 (copy, index: 3)
        u8 (copy, index: 4)
        GROUND_TOP_Y_upv_1 (copy, index: 5)
        u9 (copy, index: 6)
        u16 (copy, index: 7)
        u15 (copy, index: 8)
        TRAIN_HEIGHT_upv_1 (copy, index: 9)
        u1 (copy, index: 10)
    ]]
    local v74 = a3.Z + a2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth
    local v75 = true
    if a2.trainPhase ~= "passing" then
        v75 = false
        if a2.trainPhase == "warning" then
            v75 = (a2.blinkTimer * 6) % 2 < 1
        end
    end
    local light_1 = a2.light
    local v76
    if v75 then
        v76 = u22
    else
        v76 = u23
    end
    light_1.Color = v76
    a2.light.CFrame = CFrame.new(a3.X + u8, (a3.Y + GROUND_TOP_Y_upv_1) + 1.5, v74 - u9)
    local lightProp_1 = a2.lightProp
    if lightProp_1 ~= nil then
        lightProp_1:pose(a2.light.CFrame)
    end
    local lightProp_2 = a2.lightProp
    if lightProp_2 ~= nil then
        local v77
        if v75 then
            v77 = u22
        else
            v77 = u23
        end
        lightProp_2:setColor(v77)
    end
    if a2.stripSkin == nil then
        local strip_1 = a2.strip
        local v78
        if v75 then
            v78 = u16
        else
            v78 = u15
        end
        strip_1.Color = v78
    elseif v75 then
        a2.stripSkin:flash(u16)
    else
        a2.stripSkin:resetColors()
    end
    local v79, v80 = nil, nil
    if a2.trainPhase ~= "passing" then
        a2.train.CFrame = u1
        v79 = a2.trainProp
        if v79 == nil then
            return
        end
        v79:pose(u1)
    else
        a2.train.CFrame = CFrame.new(a3.X + a2.trainX, (a3.Y + GROUND_TOP_Y_upv_1) + (TRAIN_HEIGHT_upv_1 / 2), v74)
        v80 = a2.trainProp
        if v80 == nil then
            return
        end
        v80:pose(a2.train.CFrame)
    end
end
u35.renderPlayer = function(a1, a2)
    --[[
      name: renderPlayer
      line: 1297
      upvalues:
        PLAYER_Y_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local simulation_8 = a1.simulation
    local v81 = ((not (simulation_8.hopping)) and 0) or (math.sin(simulation_8.hopProgress * math.pi))
    local v82 = CFrame.new(Vector3.new(a2.X + simulation_8:playerWorldX(), (a2.Y + simulation_8:poseY()) + PLAYER_Y_upv_1, a2.Z + (simulation_8:playerRowContinuous() * CROSSY_ROAD_CONFIG_upv_1.laneDepth))) * CFrame.Angles(0, simulation_8:facingYaw(), 0)
    a1.body.Size = a1.bodyBaseSize * Vector3.new(1 - (v81 * 0.18), (v81 * 0.3) + 1, 1 - (v81 * 0.18))
    a1.body.CFrame = v82
    a1.beak.CFrame = v82 * CFrame.new(0, CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.12, (CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.5) + 0.25)
end
u35.renderEagle = function(a1)
    --[[
      name: renderEagle
      line: 1311
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local simulation_9 = a1.simulation
    local v83 = Vector3.new(-1, 0, 0)
    if simulation_9.eagleState == "none" then
        local Position_1 = a1.body.Position
        local v84 = os.clock() * 2.1
        local v85 = math.cos(v84)
        local v86 = math.sin(v84)
        a1.eaglePosition = Vector3.new(Position_1.X + (v85 * 13), Position_1.Y + 17, Position_1.Z + (v86 * 13))
        v83 = Vector3.new(-v86, 0, v85)
    elseif simulation_9.eagleState ~= "swoop" then
        local v87 = math.min(simulation_9.eagleTimer / CROSSY_ROAD_CONFIG_upv_1.eagleCarrySeconds, 1)
        a1.eaglePosition = a1.grabPosition + Vector3.new(-(((v87 * 46) * v87) + (v87 * 8)), ((v87 * 30) * v87) + (v87 * 5), 0)
    else
        local v88 = math.min(simulation_9.eagleTimer / CROSSY_ROAD_CONFIG_upv_1.eagleSwoopSeconds, 1)
        local v89 = a1.swoopOrigin or (a1.grabPosition + Vector3.new(36, 20, 0))
        local v90 = v89:Lerp(a1.grabPosition, 0.6) - Vector3.new(0, 5, 0)
        a1.eaglePosition = v89:Lerp(v90, v88):Lerp(v90:Lerp(a1.grabPosition, v88), v88)
    end
    local v91 = math.sin(os.clock() * 13) * 0.55
    local v92 = CFrame.lookAt(a1.eaglePosition, a1.eaglePosition + v83)
    a1.eagleBody.CFrame = v92
    local eagleProp_1 = a1.eagleProp
    if eagleProp_1 ~= nil then
        eagleProp_1:pose(v92)
    end
    a1.eagleBeak.CFrame = v92 * CFrame.new(0, 0.35, -2.2)
    a1.eagleWingLeft.CFrame = v92 * (CFrame.new(-2.9, 0.6, 0) * CFrame.Angles(0, 0, -v91))
    a1.eagleWingRight.CFrame = v92 * (CFrame.new(2.9, 0.6, 0) * CFrame.Angles(0, 0, v91))
    if simulation_9.eagleState == "carry" then
        local v93 = CFrame.new(a1.eaglePosition + Vector3.new(0, -2.299999952316284, 0))
        a1.body.CFrame = v93
        a1.beak.CFrame = v93 * CFrame.new(0, CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.12, (CROSSY_ROAD_CONFIG_upv_1.playerSize * 0.5) + 0.25)
    end
end
u35.parkEagle = function(a1)
    --[[
      name: parkEagle
      line: 1370
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.eagleCircling = false
    a1.swoopOrigin = nil
    a1.eagleBody.CFrame = u1
    a1.eagleWingLeft.CFrame = u1
    a1.eagleWingRight.CFrame = u1
    a1.eagleBeak.CFrame = u1
    local eagleProp_2 = a1.eagleProp
    if eagleProp_2 == nil then
        return
    end
    eagleProp_2:pose(u1)
end
u35.updateCamera = function(a1, a2)
    --[[
      name: updateCamera
      line: 1382
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        portraitCameraDistance_upv_1 (copy, index: 2)
        Unit_upv_1 (copy, index: 3)
    ]]
    if a1.simulation.eagleState == "none" then
        a1.cameraFocus = a1.cameraFocus:Lerp(a1:focusTarget(), math.min(a2 * CROSSY_ROAD_CONFIG_upv_1.cameraFollowRate, 1))
        local v94 = portraitCameraDistance_upv_1(CROSSY_ROAD_CONFIG_upv_1.cameraDistance, CROSSY_ROAD_CONFIG_upv_1.cameraPortraitZoomOut, a1.stage.camera.ViewportSize, CROSSY_ROAD_CONFIG_upv_1.cameraPortraitMaxZoomOut)
        a1.stage.setCameraCFrame(CFrame.lookAt(a1.cameraFocus - (Unit_upv_1 * v94), a1.cameraFocus))
        local v95 = a1.cameraFocus + Unit_upv_1 * 260
        a1.backdrop.CFrame = CFrame.lookAt(v95, v95 - Unit_upv_1)
        a1:updateRouteArrow(a1.stage.origin, v94)
    else
        a1:parkRouteArrow()
        return nil
    end
end
u35.visibleWorldXLimit = function(a1, a2, a3, a4, a5)
    --[[
      name: visibleWorldXLimit
      line: 1409
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        Unit_upv_1 (copy, index: 2)
        Unit_upv_2 (copy, index: 3)
        Unit_upv_3 (copy, index: 4)
    ]]
    local ViewportSize_1 = a1.stage.camera.ViewportSize
    local v96 = ViewportSize_1.X / math.max(ViewportSize_1.Y, 1)
    local v97 = math.tan(math.rad(CROSSY_ROAD_CONFIG_upv_1.fieldOfView) / 2)
    local v98 = a2 + (a4 * Unit_upv_1.Y) + a5 * Unit_upv_1.Z
    local v99 = a3 * Unit_upv_2.X
    local v100 = a5 * Unit_upv_2.Z
    local v101 = a3 * Unit_upv_1.X
    local v102 = v97 * v96
    local v103 = v99 - v101 * v102
    local v104 = -v99 - v101 * v102
    local v105 = math.huge
    if v103 > 1e-06 then
        v105 = math.min(v105, ((v98 * v102) - v100) / v103)
    end
    if v104 > 1e-06 then
        v105 = math.min(v105, ((v98 * v102) + v100) / v104)
    end
    local v106 = a3 * Unit_upv_3.X
    local v107 = a4 * Unit_upv_3.Y + a5 * Unit_upv_3.Z
    local v108 = a3 * Unit_upv_1.X
    local v109 = v106 - v108 * v97
    local v110 = -v106 - v108 * v97
    v105 = math.huge
    local v111
    if v109 <= 1e-06 then
        v111 = v105
    else
        v111 = math.min(v105, ((v98 * v97) - v107) / v109)
    end
    if v110 > 1e-06 then
        v111 = math.min(v111, ((v98 * v97) + v107) / v110)
    end
    return (math.max(math.min(v105, v111), 0))
end
u35.parkRouteArrow = function(a1)
    --[[
      name: parkRouteArrow
      line: 1419
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_5 in a1.routeArrowBars do
        value_5.CFrame = u1
    end
end
u35.updateRouteArrow = function(a1, a2, a3)
    --[[
      name: updateRouteArrow
      line: 1424
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        GROUND_TOP_Y_upv_1 (copy, index: 2)
    ]]
    local simulation_10 = a1.simulation
    local v112 = simulation_10:laneAtRow(simulation_10.row + 1) or (simulation_10:laneAtRow(simulation_10.row))
    if v112 == nil or simulation_10.dead then
        a1:parkRouteArrow()
        return nil
    else
        local v113 = nil
        if a1.spectating then
            a1:parkRouteArrow()
            return nil
        else
            local v114 = a1.cameraFocus.X - a2.X
            local v115 = GROUND_TOP_Y_upv_1 + 5.2 + math.sin(os.clock() * 6) * 0.45
            local v116 = (simulation_10:playerRowContinuous() * CROSSY_ROAD_CONFIG_upv_1.laneDepth) + a2.Z - a1.cameraFocus.Z
            local v117 = v112.routeColumn * CROSSY_ROAD_CONFIG_upv_1.cellWidth - v114
            local v118 = ((v117 < 0) and -1) or 1
            v113 = a1:visibleWorldXLimit(a3, v118, v115, v116)
            if math.abs(v117) >= v113 - 4 then
                local v119 = Vector3.new((a2.X + v114) + (v118 * math.max(v113 - 5, 0)), a2.Y + v115, a2.Z + (simulation_10:playerRowContinuous() * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
                for n_1 = 0, 1 do
                    local v120 = ((n_1 ~= 0) and -1) or 1
                    local v121 = -v118 * 0.7071067811865476
                    local v122 = v120 * 0.7071067811865476
                    local v123 = CFrame.Angles(0, math.atan2(-v122, v121), 0)
                    a1.routeArrowBars[n_1 + 1].CFrame = CFrame.new(v119 + Vector3.new(v121 * 1.600000023841858, 0, v122 * 1.600000023841858)) * v123
                end
            else
                a1:parkRouteArrow()
                return nil
            end
        end
    end
end
u35.focusTarget = function(a1)
    --[[
      name: focusTarget
      line: 1466
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local simulation_11 = a1.simulation
    local origin_7 = a1.stage.origin
    if a1.spectating then
        return a1:framedFocus(origin_7, a1.spectateX, a1.spectateRow, a1.spectateRow + CROSSY_ROAD_CONFIG_upv_1.cameraForwardBias)
    else
        local v124 = math.max(simulation_11:playerRowContinuous() + CROSSY_ROAD_CONFIG_upv_1.cameraForwardBias, simulation_11.deathEdgeRow + CROSSY_ROAD_CONFIG_upv_1.viewCenterRows)
        return a1:framedFocus(origin_7, simulation_11:playerWorldX(), simulation_11:playerRowContinuous(), v124)
    end
end
u35.framedFocus = function(a1, a2, a3, a4, a5)
    --[[
      name: framedFocus
      line: 1478
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u11 (copy, index: 2)
        u10 (copy, index: 3)
    ]]
    return (Vector3.new(a2.X + (math.clamp(a3, -u11, u11) + (((a5 - a4) * CROSSY_ROAD_CONFIG_upv_1.laneDepth) * u10)), a2.Y, a2.Z + (a5 * CROSSY_ROAD_CONFIG_upv_1.laneDepth)))
end
u35.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 1489
      upvalues:
        readLightingFolderProfile_upv_1 (copy, index: 1)
        CROSSY_ROAD_NOTE_SCALARS_upv_1 (copy, index: 2)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 3)
    ]]
    local assets_2 = a1.assets
    if assets_2 ~= nil then
        assets_2 = assets_2.lighting
    end
    if assets_2 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(a1.assets.lighting, CROSSY_ROAD_NOTE_SCALARS_upv_1, DEFAULT_GAME_LIGHTING_upv_1))
    else
        return nil
    end
end
u35.positionStrip = function(a1, a2)
    --[[
      name: positionStrip
      line: 1499
      upvalues:
        GROUND_TOP_Y_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local origin_8 = a1.stage.origin
    a2.strip.CFrame = CFrame.new(origin_8.X, (origin_8.Y + GROUND_TOP_Y_upv_1) - (CROSSY_ROAD_CONFIG_upv_1.laneThickness / 2), origin_8.Z + (a2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
end
u35.parkLaneObjects = function(a1, a2)
    --[[
      name: parkLaneObjects
      line: 1503
      upvalues:
        u1 (copy, index: 1)
    ]]
    local _ = nil
    local v1 = nil
    for v2, value_6 in a2.objects do
        value_6.CFrame = u1
    end
    local v3 = nil
    local v4 = nil
    for v5, value_7 in a2.pads do
        value_7.CFrame = u1
    end
    a2.train.CFrame = u1
    a2.light.CFrame = u1
    a2.coin.CFrame = u1
    for v6, value_8 in a2.objectProps do
        value_8:pose(u1)
    end
    for v7, value_9 in a2.padProps do
        value_9:pose(u1)
    end
    local trainProp_1 = a2.trainProp
    if trainProp_1 ~= nil then
        trainProp_1:pose(u1)
    end
    local lightProp_3 = a2.lightProp
    if lightProp_3 ~= nil then
        lightProp_3:pose(u1)
    end
    local coinProp_2 = a2.coinProp
    if coinProp_2 == nil then
        return
    end
    coinProp_2:park()
end
u35.poseGrassObstacles = function(a1, a2)
    --[[
      name: poseGrassObstacles
      line: 1533
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        GROUND_TOP_Y_upv_1 (copy, index: 2)
        TREE_HEIGHT_upv_1 (copy, index: 3)
        u18 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
        ROCK_HEIGHT_upv_1 (copy, index: 6)
        u14 (copy, index: 7)
    ]]
    local origin_9 = a1.stage.origin
    local v125 = origin_9.Z + a2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth
    local v126 = origin_9.Y + GROUND_TOP_Y_upv_1
    local v127 = 0
    local v128 = nil
    local v129 = nil
    local v130 = nil
    for _, value_10 in a2.treeColumns do
        v128 = a2.objects[v127 + 1]
        v127 = v127 + 1
        v128.Size = Vector3.new(CROSSY_ROAD_CONFIG_upv_1.cellWidth * 0.82, TREE_HEIGHT_upv_1, CROSSY_ROAD_CONFIG_upv_1.laneDepth * 0.82)
        v128.Color = u18
        v128.CFrame = CFrame.new(origin_9.X + (value_10 * CROSSY_ROAD_CONFIG_upv_1.cellWidth), v126 + (TREE_HEIGHT_upv_1 / 2), v125)
        v129 = a1:variantFor(a2, "Tree")
        if v129 == nil then
            a1:clearObjectProp(a2, v127)
            continue
        end
        a1:ensureObjectProp(a2, v127, v129.key, v129.template, tbl_upv_1)
        v130 = a2.objectProps[v127]
        if v130 ~= nil then
            v130:poseOnGround(CFrame.new(origin_9.X + (value_10 * CROSSY_ROAD_CONFIG_upv_1.cellWidth), v126, v125))
        end
    end
    local v131 = nil
    local v132 = nil
    local v133 = nil
    for _, value_11 in a2.rockColumns do
        v131 = a2.objects[v127 + 1]
        v127 = v127 + 1
        v131.Size = Vector3.new(CROSSY_ROAD_CONFIG_upv_1.cellWidth * 0.66, ROCK_HEIGHT_upv_1, CROSSY_ROAD_CONFIG_upv_1.laneDepth * 0.6)
        v131.Color = u14
        v131.CFrame = CFrame.new(origin_9.X + (value_11 * CROSSY_ROAD_CONFIG_upv_1.cellWidth), v126 + (ROCK_HEIGHT_upv_1 / 2), v125)
        v132 = a1:variantFor(a2, "Rock")
        if v132 == nil then
            a1:clearObjectProp(a2, v127)
            continue
        end
        a1:ensureObjectProp(a2, v127, v132.key, v132.template, tbl_upv_1, u14)
        v133 = a2.objectProps[v127]
        if v133 ~= nil then
            v133:poseOnGround(CFrame.new(origin_9.X + (value_11 * CROSSY_ROAD_CONFIG_upv_1.cellWidth), v126, v125))
        end
    end
end
u35.posePads = function(a1, a2)
    --[[
      name: posePads
      line: 1577
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        PAD_HEIGHT_upv_1 (copy, index: 2)
        GROUND_TOP_Y_upv_1 (copy, index: 3)
    ]]
    a1:ensurePadProps(a2)
    local origin_10 = a1.stage.origin
    for n_2 = 0, #a2.padColumns - 1 do
        local v134 = a2.pads[n_2 + 1]
        v134.Size = Vector3.new(PAD_HEIGHT_upv_1, CROSSY_ROAD_CONFIG_upv_1.cellWidth * 0.9, CROSSY_ROAD_CONFIG_upv_1.laneDepth * 0.9)
        local v135 = CFrame.new(origin_10.X + (a2.padColumns[n_2 + 1] * CROSSY_ROAD_CONFIG_upv_1.cellWidth), (origin_10.Y + GROUND_TOP_Y_upv_1) + (PAD_HEIGHT_upv_1 / 2), origin_10.Z + (a2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
        v134.CFrame = v135 * CFrame.Angles(0, 0, 1.5707963267948966)
        local v136
        v136 = a2.padProps[n_2]
        if v136 ~= nil then
            v136:pose(v135)
        end
    end
end
u35.ensureRailProps = function(a1, a2)
    --[[
      name: ensureRailProps
      line: 1597
      upvalues:
        AuthoredProp_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    if a1.assets ~= nil then
        if a2.trainProp == nil then
            local v137 = a1.assets:first("Train") or (a1.assets:first("Track"))
            if v137 ~= nil then
                a2.trainProp = AuthoredProp_upv_1:make(v137, a1.container, {orient = u2})
                a2.train.Transparency = 1
            end
        end
        if a2.lightProp == nil then
            local v138 = a1.assets:first("WarningLight") or (a1.assets:first("Warning") or (a1.assets:first("Signal")))
            if v138 ~= nil then
                a2.lightProp = AuthoredProp_upv_1:make(v138, a1.container, {orient = u2})
                a2.light.Transparency = 1
            end
        end
    else
        return nil
    end
end
u35.ensurePadProps = function(a1, a2)
    --[[
      name: ensurePadProps
      line: 1622
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        AuthoredProp_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    local v139 = a1.assets == nil
    if not (v139) then
        local v140 = 0
        for _ in a2.padProps do
            v140 = v140 + 1
        end
        v139 = 0 < v140
    end
    if v139 then
        return nil
    else
        local v141 = a1.assets:first("LilyPad") or (a1.assets:first("Pad") or (a1.assets:first("Lily")))
        if v141 ~= nil then
            for n_3 = 0, CROSSY_ROAD_CONFIG_upv_1.padsPerLane - 1 do
                a2.padProps[n_3] = AuthoredProp_upv_1:make(v141, a1.container, tbl_upv_2)
                a2.pads[n_3 + 1].Transparency = 1
            end
        else
            return nil
        end
    end
end
u35.applyStripSkin = function(a1, a2)
    --[[
      name: applyStripSkin
      line: 1648
      upvalues:
        LaneSkin_upv_1 (copy, index: 1)
        GROUND_TOP_Y_upv_1 (copy, index: 2)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 3)
    ]]
    local stripStyle_1 = a2.stripStyle
    local v142, v143 = nil, nil
    if stripStyle_1 == nil then
        v142 = nil
    else
        v143 = a1.assets
        if v143 ~= nil then
            v143 = v143:template(stripStyle_1)
        end
        v142 = v143
    end
    if stripStyle_1 ~= nil then
        local v144 = nil
        if v142 ~= nil then
            if a2.stripSkinKey ~= stripStyle_1 then
                a1:releaseStripSkin(a2)
                v144 = a1.laneSkinPool[stripStyle_1]
                if v144 ~= nil then
                    local v145 = #v144
                    local v146 = v144[#v144]
                    v144[v145] = nil
                    v144 = v146
                end
                if v144 ~= nil then
                    local v145 = v144
                else
                    local v145 = LaneSkin_upv_1:make(v142, a1.container)
                end
                local v145 = nil
                if v145 ~= nil then
                    a2.stripSkin = v145
                    a2.stripSkinKey = stripStyle_1
                    a2.strip.Transparency = 1
                else
                    return nil
                end
            end
            v144 = a2.stripSkin
            if v144 ~= nil then
                local origin_11 = a1.stage.origin
                v144:poseAt(origin_11.X, (origin_11.Y + GROUND_TOP_Y_upv_1) - math.min(v144.height, CROSSY_ROAD_CONFIG_upv_1.laneThickness), origin_11.Z + (a2.row * CROSSY_ROAD_CONFIG_upv_1.laneDepth))
                return
            end
            return nil
        end
    end
    a1:releaseStripSkin(a2)
    return nil
end
u35.releaseStripSkin = function(a1, a2)
    --[[
      name: releaseStripSkin
      line: 1695
      upvalues:
        u1 (copy, index: 1)
    ]]
    local stripSkin_1 = a2.stripSkin
    local stripSkinKey_1 = a2.stripSkinKey
    a2.stripSkin = nil
    a2.stripSkinKey = nil
    a2.strip.Transparency = 0
    if stripSkin_1 ~= nil then
        local v147 = nil
        if stripSkinKey_1 ~= nil then
            stripSkin_1:resetColors()
            stripSkin_1:poseAt(u1.X, u1.Y, u1.Z)
            v147 = a1.laneSkinPool[stripSkinKey_1]
            if v147 == nil then
                v147 = {}
                a1.laneSkinPool[stripSkinKey_1] = v147
            end
            table.insert(v147, stripSkin_1)
            return
        end
    end
    return nil
end
u35.applyMoverOverlays = function(a1, a2)
    --[[
      name: applyMoverOverlays
      line: 1715
      upvalues:
        u3 (copy, index: 1)
        u2 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
        tbl_upv_3 (copy, index: 4)
        u4 (copy, index: 5)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 6)
    ]]
    if a2.kind == "road" then
        local v148 = 0
        local v149 = false
        local v150, v151, v152 = nil, nil, nil
        if v149 then
            v148 = v148 + 1
        else
            v149 = true
        end
        local v153, v154 = nil, nil
        while v148 < a2.moverCount do
            v153 = a1:variantFor(a2, "Car", "Bus", "Truck")
            if v153 ~= nil then
                v154 = v153.template:GetExtentsSize()
                if v154.X >= v154.Z then
                    v150 = u2
                else
                    v150 = u3
                end
                local v155 = a2.moverLength / math.max(v154.X, v154.Z, 1)
                local v156 = math.round(v155 * 20)
                local v157 = tbl_upv_5[(((a2.row * 3) + v148) % #tbl_upv_5) + 1]
                v151 = tbl_upv_3[v153.template.Name]
                if v151 == nil then
                    v151 = -1
                end
                local v158
                if math.sign(a2.velocity) == v151 then
                    v158 = true
                else
                    v158 = false
                end
                if v158 then
                    v152 = v150
                else
                    v152 = u4 * v150
                end
                a1:ensureObjectProp(a2, v148, ("%*@%*%*"):format(v153.key, v156, (v158 and "") or "R"), v153.template, {orient = v152, scale = v155}, v157)
            else
                a1:clearObjectProp(a2, v148)
            end
            if v149 then
                v148 = v148 + 1
            else
                v149 = true
            end
        end
    elseif a2.kind == "river" then
        if a2.moverCount > 0 then
            local v149, v148
            v149, v148 = false, 0
            local v159 = nil
            if v149 then
                v148 = v148 + 1
            else
                v149 = true
            end
            local v160, v161 = nil, nil
            if v148 >= a2.moverCount then
                return
            end
            v160 = a1:variantFor(a2, "Log")
            if v160 ~= nil then
                v161 = v160.template:GetExtentsSize()
                if v161.X >= v161.Z then
                    v159 = u2
                else
                    v159 = u3
                end
                local v162 = math.max(v161.X, v161.Z, 1)
                local v163 = a2.moverLength / CROSSY_ROAD_CONFIG_upv_1.logLengthStart
                a1:ensureObjectProp(a2, v148, ("%*@%*"):format(v160.key, math.round(v163 * 20)), v160.template, {orient = v159, scale = CROSSY_ROAD_CONFIG_upv_1.logLengthStart / v162, lengthStretch = v163})
            else
                a1:clearObjectProp(a2, v148)
            end
            if v149 then
                v148 = v148 + 1
            else
                v149 = true
            end
        end
    end
end
u35.variantFor = function(a1, a2, ...)
    --[[
      name: variantFor
      line: 1803
    ]]
    local tbl_28 = {...}
    if a1.assets ~= nil then
        local tbl_29 = {}
        for _, value_12 in tbl_28 do
            for v165, value_13 in a1.assets:variants(value_12) do
                table.insert(tbl_29, value_13)
            end
        end
        if #tbl_29 ~= 0 then
            local v164 = a2.cosmeticRandom:NextInteger(0, #tbl_29 - 1)
            local tbl_30 = {}
            tbl_30.template = tbl_29[v164 + 1]
            tbl_30.key = ("%*#%*"):format(tbl_28[1], v164)
            return tbl_30
        end
    end
    return nil
end
u35.ensureObjectProp = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: ensureObjectProp
      line: 1823
      upvalues:
        AuthoredProp_upv_1 (copy, index: 1)
    ]]
    local v165 = nil
    if a2.objectKeys[a3] ~= a4 then
        v165 = a2.objectProps[a3]
        if v165 ~= nil then
            v165:destroy()
        end
        a2.objectProps[a3] = AuthoredProp_upv_1:make(a5, a1.container, a6)
        a2.objectKeys[a3] = a4
        a2.objects[a3 + 1].Transparency = 1
    end
    if a7 ~= nil then
        local v166 = a2.objectProps[a3]
        if v166 == nil then
            return
        end
        v166:setColor(a7)
    end
end
u35.clearObjectProp = function(a1, a2, a3)
    --[[
      name: clearObjectProp
      line: 1852
    ]]
    local v167 = a2.objectProps[a3]
    if v167 ~= nil then
        v167:destroy()
        a2.objectProps[a3] = nil
        a2.objectKeys[a3] = nil
    end
    a2.objects[a3 + 1].Transparency = 0
end
u35.onPressBegan = function(a1)
    --[[
      name: onPressBegan
      line: 1867
    ]]
    a1.swipedThisPress = false
end
u35.onPressEnded = function(a1, a2)
    --[[
      name: onPressEnded
      line: 1872
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.swipedThisPress or os.clock() - a1.runStartClock < CROSSY_ROAD_CONFIG_upv_1.startTapGrace then
        return nil
    elseif a2 <= CROSSY_ROAD_CONFIG_upv_1.tapMaxSeconds then
        a1.simulation:queueHop("forward")
    end
end
u35.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 1883
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.swipedThisPress = true
    if os.clock() - a1.runStartClock >= CROSSY_ROAD_CONFIG_upv_1.startTapGrace then
        if a2 == "up" then
            a1.simulation:queueHop("forward")
        elseif a2 == "down" then
            a1.simulation:queueHop("back")
        elseif a2 ~= "left" then
            a1.simulation:queueHop("right")
        else
            a1.simulation:queueHop("left")
        end
    else
        return nil
    end
end
local tbl_31 = {}
tbl_31.CrossyRoadGame = u35
return tbl_31