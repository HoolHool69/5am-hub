-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Lighting_upv_1 = v1.Lighting
local RunService_upv_1 = v1.RunService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "coin-visual")
local CoinVisual_upv_1 = v2.CoinVisual
local findCoinTemplate_upv_1 = v2.findCoinTemplate
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "distance-score").DistanceScore
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v3.makeEllipsoidPart
local makeSmoothPart_upv_1 = v3.makeSmoothPart
local makeStagePart_upv_1 = v3.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local v4 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v4.readResume
local writeResume_upv_1 = v4.writeResume
local v5 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random")
local deriveRandom_upv_1 = v5.deriveRandom
local deriveSeed_upv_1 = v5.deriveSeed
local BirdRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "bird-rig").BirdRig
local NestDisplay_upv_1 = RuntimeLib_1.import(script, script.Parent, "nest-display").NestDisplay
local v6 = RuntimeLib_1.import(script, script.Parent, "terrain")
local TERRAIN_PAD_Y_upv_1 = v6.TERRAIN_PAD_Y
local TinyWingsTerrain_upv_1 = v6.TinyWingsTerrain
local v7 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-assets")
local PropOverlay_upv_1 = v7.PropOverlay
local TerrainSkin_upv_1 = v7.TerrainSkin
local TinyWingsAssets_upv_1 = v7.TinyWingsAssets
local v8 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-biomes")
local paletteForIsland_upv_1 = v8.paletteForIsland
local WATER_DEEP_COLOR_upv_1 = v8.WATER_DEEP_COLOR
local WATER_SURFACE_COLOR_upv_1 = v8.WATER_SURFACE_COLOR
local TINY_WINGS_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-config").TINY_WINGS_CONFIG
local TinyWingsMomentumAudio_upv_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-momentum-audio").TinyWingsMomentumAudio
local TinyWingsTutorial_upv_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-tutorial").TinyWingsTutorial
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(255, 204, 66)
local u3 = Color3.fromRGB(255, 244, 200)
local u4 = Color3.fromRGB(150, 60, 70)
local u5 = Color3.fromRGB(148, 206, 184)
local u6 = Color3.fromRGB(118, 176, 158)
local u7 = Color3.fromRGB(134, 96, 62)
local u8 = Color3.fromRGB(121, 85, 58)
local u9 = Color3.fromRGB(103, 70, 46)
local u10 = Color3.fromRGB(108, 138, 178)
local u11 = Color3.fromRGB(172, 129, 84)
local u12 = Color3.fromRGB(255, 205, 80)
local u13 = Color3.fromRGB(90, 176, 255)
local u14 = Color3.fromRGB(244, 248, 252)
local u15 = Color3.fromRGB(255, 216, 102)
local u16 = Color3.fromRGB(255, 90, 100)
local u17 = Color3.fromRGB(130, 200, 255)
local u18 = Color3.fromRGB(235, 245, 255)
local tbl_upv_1 = {"z", "Z", "z"}
local tbl_upv_2 = {0.5, 0.78, 0.62}
local tbl_upv_3 = {Vector3.new(9, 2.4000000953674316, 4.199999809265137), Vector3.new(7, 2, 3.4000000953674316), Vector3.new(11.5, 2.5999999046325684, 4.800000190734863)}
local tbl_upv_4 = {"Cloud", "Cloud2", "Cloud3"}
local u19 = CFrame.Angles(0, -1.5707963267948966, 0)
local u20 = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 120)), ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 220, 120)), ColorSequenceKeypoint.new(0.66, Color3.fromRGB(140, 235, 150)), ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 170, 255))})
local u21 = ColorSequence.new(u2)
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 134
    ]]
    return "TinyWingsGame"
end
tbl_6.__index = BaseWorldGame_upv_1
local u22 = setmetatable(tbl_5, tbl_6)
u22.__index = u22
u22.new = function(...)
    --[[
      name: new
      line: 140
      upvalues:
        u22 (ref, index: 1)
    ]]
    local v9 = setmetatable({}, u22)
    return v9:constructor(...) or v9
end
u22.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 144
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        TinyWingsTerrain_upv_1 (copy, index: 2)
        TINY_WINGS_CONFIG_upv_1 (copy, index: 3)
        DistanceScore_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.crustTiles = {}
    a1.fillTiles = {}
    a1.terrain = TinyWingsTerrain_upv_1.new()
    a1.windowStartSegment = 0
    a1.coins = {}
    a1.freeCoins = {}
    a1.coinRandom = Random.new()
    a1.coinPlanX = 0
    a1.emptyFallStreak = 0
    a1.lastStringEndX = -math.huge
    a1.goldCollected = 0
    a1.cloudParts = {}
    a1.cloudLobes = {}
    a1.cloudXs = {}
    a1.cloudTouchedThisFlight = false
    a1.pines = {}
    a1.trunks = {}
    a1.mountains = {}
    a1.cloudOverlays = {}
    a1.pineOverlays = {}
    a1.trunkOverlays = {}
    a1.mountainOverlays = {}
    a1.x = TINY_WINGS_CONFIG_upv_1.startX
    a1.y = 0
    a1.curatedOpening = false
    a1.renderPrevX = TINY_WINGS_CONFIG_upv_1.startX
    a1.renderPrevY = 0
    a1.grounded = true
    a1.speed = TINY_WINGS_CONFIG_upv_1.startSpeed
    a1.velocityX = 0
    a1.velocityY = 0
    a1.holding = false
    a1.birdTilt = 0
    a1.distance = DistanceScore_upv_1.new(TINY_WINGS_CONFIG_upv_1.studsPerPoint)
    a1.bonusScore = 0
    a1.lastReported = -1
    a1.perfectStreak = 0
    a1.fever = false
    a1.sunProgress = 0
    a1.nightX = 0
    a1.elapsed = 0
    a1.warnedSetting = false
    a1.warnedPanic = false
    a1.cameraX = 0
    a1.cameraY = 0
    a1.fieldOfView = 20
    a1.nestIntro = false
    a1.launchQueued = false
    a1.dead = false
    a1.sleeping = false
    a1.sleepPhase = "slowing"
    a1.sleepElapsed = 0
    a1.sleepOnWater = false
    a1.breathPhase = 0
    a1.breathCount = 0
    a1.settleDip = 0
    a1.runEnded = false
    a1.roundToken = 0
    a1.terrainSeed = 1
end
u22.buildScene = function(a1)
    --[[
      name: buildScene
      line: 206
      upvalues:
        TinyWingsAssets_upv_1 (copy, index: 1)
        TINY_WINGS_CONFIG_upv_1 (copy, index: 2)
        TerrainSkin_upv_1 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        findCoinTemplate_upv_1 (copy, index: 6)
        u12 (copy, index: 7)
        u1 (copy, index: 8)
        CoinVisual_upv_1 (copy, index: 9)
        u13 (copy, index: 10)
        tbl_upv_4 (copy, index: 11)
        makeEllipsoidPart_upv_1 (copy, index: 12)
        u14 (copy, index: 13)
        tbl_upv_3 (copy, index: 14)
        PropOverlay_upv_1 (copy, index: 15)
        u19 (copy, index: 16)
        u2 (copy, index: 17)
        BirdRig_upv_1 (copy, index: 18)
        u21 (copy, index: 19)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 20)
        u3 (copy, index: 21)
        PopupTextPool_upv_1 (copy, index: 22)
        NestDisplay_upv_1 (copy, index: 23)
        TERRAIN_PAD_Y_upv_1 (copy, index: 24)
        TinyWingsMomentumAudio_upv_1 (copy, index: 25)
        TinyWingsTutorial_upv_1 (copy, index: 26)
    ]]
    local container_upv_1 = a1.stage.container
    local u23 = TinyWingsAssets_upv_1.new()
    local v10
    v10 = u23 == nil or not (u23.available) or u23:template("HillCrust")
    local v11
    v11 = u23 == nil or not (u23.available) or u23:template("HillFill")
    local v12
    v12 = u23 == nil or not (u23.available) or u23:template("WaterSurface")
    local v13
    v13 = u23 == nil or not (u23.available) or u23:template("WaterDeep")
    for _ = 0, TINY_WINGS_CONFIG_upv_1.segmentPoolSize - 1 do
        table.insert(
            a1.crustTiles,
            (TerrainSkin_upv_1:create(
                container_upv_1,
                v10,
                v12,
                function()
                    --[[
                      line: 224
                      upvalues:
                        makeStagePart_upv_1 (copy, index: 1)
                        container_upv_1 (copy, index: 2)
                    ]]
                    return makeStagePart_upv_1(container_upv_1)
                end
            ))
        )
        table.insert(
            a1.fillTiles,
            (TerrainSkin_upv_1:create(
                container_upv_1,
                v11,
                v13,
                function()
                    --[[
                      line: 229
                      upvalues:
                        makeSmoothPart_upv_1 (copy, index: 1)
                        container_upv_1 (copy, index: 2)
                    ]]
                    return makeSmoothPart_upv_1(container_upv_1)
                end
            ))
        )
    end
    local function v14(a2)
        --[[
          line: 211
          upvalues:
            u23 (copy, index: 1)
        ]]
        if u23 ~= nil and u23.available then
            return (u23:template(a2))
        end
        return nil
    end
    a1:buildBackground(container_upv_1, v14)
    local v15 = findCoinTemplate_upv_1()
    local v16, v17 = nil, nil
    for _ = 0, TINY_WINGS_CONFIG_upv_1.coinPoolSize - 1 do
        local v18 = makeSmoothPart_upv_1(container_upv_1)
        v18.Shape = Enum.PartType.Cylinder
        v18.Material = Enum.Material.Neon
        v18.Color = u12
        v18.Size = Vector3.new(0.41999998688697815, 1.5, 1.5)
        v18.CFrame = u1
        v16 = nil
        v17 = nil
        if v15 ~= nil then
            local v19 = CoinVisual_upv_1:make(v15, container_upv_1, {})
            v17 = CoinVisual_upv_1:make(v15, container_upv_1, {tint = u13})
            v18.Transparency = 1
            v16 = v19
        end
        local v20 = {}
        v20.part = v18
        v20.goldVisual = v16
        v20.blueVisual = v17
        table.insert(a1.coins, v20)
        table.insert(a1.freeCoins, v20)
    end
    local tbl_7 = {}
    local v20 = nil
    for key_1, value_1 in tbl_upv_4 do
        v20 = u23 == nil or not (u23.available) or u23:template(value_1)
        if v20 ~= nil then
            table.insert(tbl_7, v20)
        end
    end
    local v21 = nil
    for v22 = 0, TINY_WINGS_CONFIG_upv_1.cloudPoolSize - 1 do
        local v23 = makeEllipsoidPart_upv_1(container_upv_1)
        v23.Color = u14
        v23.Transparency = 0.18
        v23.Size = tbl_upv_3[(v22 % #tbl_upv_3) + 1]
        table.insert(a1.cloudParts, v23)
        local v24 = makeEllipsoidPart_upv_1(container_upv_1)
        v24.Color = u14
        v24.Transparency = 0.22
        v24.Size = v23.Size * 0.55
        table.insert(a1.cloudLobes, v24)
        table.insert(a1.cloudXs, 0)
        if #tbl_7 <= 0 then
            v21 = nil
        else
            v21 = tbl_7[(v22 % #tbl_7) + 1]
        end
        if v21 ~= nil then
            v23.Transparency = 1
            v24.Transparency = 1
            a1.cloudOverlays[v22] = PropOverlay_upv_1:make(v21, container_upv_1, u19, false)
        end
    end
    a1.bird = makeStagePart_upv_1(container_upv_1)
    a1.bird.Size = Vector3.new(2.200000047683716, 2.200000047683716, 2.200000047683716)
    a1.bird.Color = u2
    a1.bird.CastShadow = false
    a1.birdRig = BirdRig_upv_1.new(container_upv_1, a1.bird)
    local v25
    v25 = u23 == nil or not (u23.available) or u23:template("Bird")
    if v25 ~= nil then
        a1.bird.Transparency = 1
        a1.birdOverlay = PropOverlay_upv_1:make(v25, container_upv_1, CFrame.identity, false)
    end
    local v26 = Instance.new("Attachment")
    v26.Position = Vector3.new(0, 0.800000011920929, 0)
    v26.Parent = a1.bird
    local v22 = Instance.new("Attachment")
    v22.Position = Vector3.new(0, -0.800000011920929, 0)
    v22.Parent = a1.bird
    a1.trail = Instance.new("Trail")
    a1.trail.Attachment0 = v26
    a1.trail.Attachment1 = v22
    a1.trail.Lifetime = 0.4
    a1.trail.FaceCamera = true
    a1.trail.LightEmission = 0.5
    a1.trail.Color = u21
    a1.trail.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.4), NumberSequenceKeypoint.new(1, 1)})
    a1.trail.Parent = a1.bird
    a1.sleepPuffAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.sleepPuffAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.sleepPuffAnchor.Transparency = 1
    a1.sleepPuffAnchor.CastShadow = false
    a1.sleepPuffAnchor.CFrame = u1
    a1.sleepPuff = Instance.new("ParticleEmitter")
    a1.sleepPuff.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.sleepPuff.Rate = 0
    a1.sleepPuff.Lifetime = NumberRange.new(0.3, 0.6)
    a1.sleepPuff.Speed = NumberRange.new(2, 5)
    a1.sleepPuff.SpreadAngle = Vector2.new(50, 50)
    a1.sleepPuff.Rotation = NumberRange.new(0, 360)
    a1.sleepPuff.Drag = 5
    a1.sleepPuff.Acceleration = Vector3.new(0, -5, 0)
    a1.sleepPuff.LightEmission = 0.2
    local tbl_8 = {NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0)}
    a1.sleepPuff.Size = NumberSequence.new(tbl_8)
    local tbl_9 = {NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)}
    a1.sleepPuff.Transparency = NumberSequence.new(tbl_9)
    a1.sleepPuff.Parent = a1.sleepPuffAnchor
    a1.sunAnchor = a1:makeSkyDecal(container_upv_1, "rbxassetid://75324982566631", 15.5)
    a1.moonAnchor = a1:makeSkyDecal(container_upv_1, "rbxassetid://138789825546962", 12)
    a1.dayBarAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.dayBarAnchor.Transparency = 1
    a1.dayBarAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    local key_1 = Instance.new("BillboardGui")
    key_1.Size = UDim2.fromScale(16, 1.6)
    key_1.AlwaysOnTop = true
    key_1.Parent = a1.dayBarAnchor
    local value_1 = Instance.new("Frame")
    value_1.AnchorPoint = Vector2.new(0.5, 0.5)
    value_1.Position = UDim2.fromScale(0.5, 0.5)
    value_1.Size = UDim2.fromScale(0.82, 0.22)
    value_1.BackgroundColor3 = Color3.fromRGB(20, 24, 34)
    value_1.BackgroundTransparency = 0.35
    value_1.BorderSizePixel = 0
    value_1.Parent = key_1
    tbl_9 = Instance.new("UICorner")
    tbl_9.CornerRadius = UDim.new(1, 0)
    tbl_9.Parent = value_1
    local v27 = Instance.new("ImageLabel")
    v27.BackgroundTransparency = 1
    v27.Size = UDim2.fromScale(0.1, 1)
    v27.AnchorPoint = Vector2.new(1, 0.5)
    v27.Position = UDim2.fromScale(0.08, 0.5)
    v27.Image = "rbxassetid://75324982566631"
    v27.ScaleType = Enum.ScaleType.Fit
    v27.Parent = key_1
    local v28 = Instance.new("ImageLabel")
    v28.BackgroundTransparency = 1
    v28.Size = UDim2.fromScale(0.1, 1)
    v28.AnchorPoint = Vector2.new(0, 0.5)
    v28.Position = UDim2.fromScale(0.92, 0.5)
    v28.Image = "rbxassetid://138789825546962"
    v28.ScaleType = Enum.ScaleType.Fit
    v28.Parent = key_1
    a1.dayBarIndicator = Instance.new("Frame")
    a1.dayBarIndicator.AnchorPoint = Vector2.new(0.5, 0.5)
    a1.dayBarIndicator.Size = UDim2.fromScale(0.035, 2.6)
    a1.dayBarIndicator.BackgroundColor3 = u3
    a1.dayBarIndicator.BorderSizePixel = 0
    a1.dayBarIndicator.Parent = value_1
    local v29 = Instance.new("UICorner")
    v29.CornerRadius = UDim.new(1, 0)
    v29.Parent = a1.dayBarIndicator
    a1.popups = PopupTextPool_upv_1.new(container_upv_1, 6)
    local new_1 = NestDisplay_upv_1.new
    local tbl_10 = {}
    tbl_10.stage = a1.stage
    tbl_10.x = a1.x
    tbl_10.y = TERRAIN_PAD_Y_upv_1 + 0.6
    tbl_10.nestTemplate = u23 == nil or not (u23.available) or u23:template("Nest")
    a1.nestDisplay = new_1(tbl_10)
    a1.momentumAudio = TinyWingsMomentumAudio_upv_1.new(container_upv_1, a1.context.janitor)
    a1.tutorial = TinyWingsTutorial_upv_1.new(
        a1.context.audio,
        function()
            --[[
              line: 418
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyTutorialPayoff()
        end
    )
    a1.context.janitor:Add(a1.tutorial, "destroy")
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 422
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if (a1.dead) then
                    return
                end
                a1.holding = true
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function()
                --[[
                  line: 427
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.holding = false
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_11 = {}
        tbl_11.scoreToStuds = function(a3)
            --[[
              name: scoreToStuds
              line: 439
              upvalues:
                TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a3 * TINY_WINGS_CONFIG_upv_1.studsPerPoint
        end
        tbl_11.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 442
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.x
        end
        tbl_11.poseMarker = function(a4)
            --[[
              name: poseMarker
              line: 445
              upvalues:
                a1 (copy, index: 1)
                origin_upv_1 (copy, index: 2)
            ]]
            if a1.x + 170 >= a4 and a4 >= a1.x - 120 then
                return CFrame.new(origin_upv_1.X + a4, (origin_upv_1.Y + a1.terrain:heightAt(a4)) + 13, origin_upv_1.Z)
            end
            return nil
        end
        registerRivalMarkers_1(tbl_11)
    end
end
u22.resetRound = function(a1)
    --[[
      name: resetRound
      line: 461
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        TINY_WINGS_CONFIG_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.tutorial:arm()
    a1.curatedOpening = a1.tutorial:usesCuratedTerrain()
    a1.terrainSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    local terrain_1 = a1.terrain
    local v30 = Random.new(a1.terrainSeed)
    terrain_1:reset(v30, ((a1.curatedOpening) and "curated") or "seeded")
    a1.dead = false
    a1:clearSleepBeat()
    a1.splashReviveX = nil
    a1.holding = false
    a1.momentumAudio:stop()
    a1.x = TINY_WINGS_CONFIG_upv_1.startX
    a1.grounded = true
    a1.speed = TINY_WINGS_CONFIG_upv_1.startSpeed
    a1.velocityX = 0
    a1.velocityY = 0
    a1.birdTilt = 0
    a1.distance:reset()
    a1.bonusScore = 0
    a1.lastReported = -1
    a1.perfectStreak = 0
    a1:setFever(false)
    a1.goldCollected = 0
    a1.cloudTouchedThisFlight = false
    a1.nightX = a1.x - (TINY_WINGS_CONFIG_upv_1.graceDistanceStuds * TINY_WINGS_CONFIG_upv_1.startGraceFraction)
    a1.sunProgress = 1 - TINY_WINGS_CONFIG_upv_1.startGraceFraction
    a1.elapsed = 0
    a1.warnedSetting = false
    a1.warnedPanic = false
    a1.terrain:ensureCoverage(a1.x + 160)
    local v31 = a1.terrain:heightAt(a1.x)
    if a1.launchQueued then
        a1.launchQueued = false
        local nestIntro_1 = a1.nestIntro
        a1.nestIntro = false
        a1.nestDisplay:setVisible(false)
        a1.grounded = false
        a1.speed = TINY_WINGS_CONFIG_upv_1.startSpeed
        a1.velocityX = TINY_WINGS_CONFIG_upv_1.startSpeed
        a1.velocityY = TINY_WINGS_CONFIG_upv_1.nestHopVelocityY
        a1.y = v31
        if not (nestIntro_1) then
            a1.cameraX = a1.x + TINY_WINGS_CONFIG_upv_1.cameraLeadX
            a1.cameraY = v31 + TINY_WINGS_CONFIG_upv_1.cameraHeightOffset
            a1.fieldOfView = 20
        end
    else
        a1.nestIntro = true
        a1.nestDisplay:setVisible(true)
        a1.y = v31
        a1.cameraX = a1.x + TINY_WINGS_CONFIG_upv_1.nestCameraOffsetX
        a1.cameraY = v31 + TINY_WINGS_CONFIG_upv_1.nestCameraOffsetY
        a1.fieldOfView = TINY_WINGS_CONFIG_upv_1.nestZoomFov
    end
    a1:parkBird()
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1:layoutSegmentWindow()
    a1.coinRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 1)
    a1.coinPlanX = a1.x
    a1.emptyFallStreak = 0
    a1.lastStringEndX = -math.huge
    a1:reclaimAllCoins()
    a1:planCoinsAhead()
    a1:layoutClouds()
    a1:layoutBackground()
    a1.context.reportScore(0)
end
u22.endTutorial = function(a1)
    --[[
      name: endTutorial
      line: 539
    ]]
    a1.tutorial:disarm()
    a1.timeScale = 1
end
u22.applyTutorialPayoff = function(a1)
    --[[
      name: applyTutorialPayoff
      line: 543
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
    ]]
    a1.speed = math.clamp(math.max(a1.speed, TINY_WINGS_CONFIG_upv_1.tutorial.boostFloor) + TINY_WINGS_CONFIG_upv_1.tutorial.boostBonus, TINY_WINGS_CONFIG_upv_1.minSpeed, TINY_WINGS_CONFIG_upv_1.maxSpeed)
    a1.stage.shake(TINY_WINGS_CONFIG_upv_1.tutorial.boostShake)
    a1.popups:show(a1:birdPosition() + Vector3.new(0, 4, 2), "GO!", u15, 0.9)
    a1.context.audio.play("flap", {})
end
u22.captureRound = function(a1)
    --[[
      name: captureRound
      line: 555
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if not (a1.dead) and not (a1.nestIntro) then
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 559
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a2:num(a1.x):num(a1.y):num(a1.speed):num(a1.velocityX):num(a1.velocityY)
                a2:bool(a1.grounded):num(a1.birdTilt)
                a2:num(a1.distance:studs()):int(a1.bonusScore):int(a1.perfectStreak):bool(a1.fever)
                a2:num(a1.sunProgress):num(a1.nightX):num(a1.elapsed)
                a2:bool(a1.warnedSetting):bool(a1.warnedPanic)
                a2:num(a1.cameraX):num(a1.cameraY)
                a2:bool(a1.curatedOpening)
            end
        )
    end
    return nil
end
u22.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 572
      upvalues:
        RunService_upv_1 (copy, index: 1)
        readResume_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
    ]]
    if a1.tutorial:isActive() and RunService_upv_1:IsStudio() then
        warn("[TinyWings] resumed a held run \226\128\148 the first-flight tutorial is skipped (it lives on the opening terrain)")
    end
    a1:endTutorial()
    local v32 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 583
            ]]
            local tbl_12 = {}
            tbl_12.x = a3:num()
            tbl_12.y = a3:num()
            tbl_12.speed = a3:num()
            tbl_12.velocityX = a3:num()
            tbl_12.velocityY = a3:num()
            tbl_12.grounded = a3:bool()
            tbl_12.birdTilt = a3:num()
            tbl_12.studs = a3:num()
            tbl_12.bonusScore = a3:int()
            tbl_12.perfectStreak = a3:int()
            tbl_12.fever = a3:bool()
            tbl_12.sunProgress = a3:num()
            tbl_12.nightX = a3:num()
            tbl_12.elapsed = a3:num()
            tbl_12.warnedSetting = a3:bool()
            tbl_12.warnedPanic = a3:bool()
            tbl_12.cameraX = a3:num()
            tbl_12.cameraY = a3:num()
            tbl_12.curatedOpening = a3:bool()
            return tbl_12
        end
    )
    if v32 ~= nil and v32.x >= v32.nightX then
        a1.roundToken = a1.roundToken + 1
        a1.dead = false
        a1:clearSleepBeat()
        a1.splashReviveX = nil
        a1.holding = false
        a1.momentumAudio:stop()
        a1.launchQueued = false
        a1.nestIntro = false
        a1.nestDisplay:setVisible(false)
        a1.curatedOpening = v32.curatedOpening
        a1.x = v32.x
        a1.y = v32.y
        a1.speed = v32.speed
        a1.velocityX = v32.velocityX
        a1.velocityY = v32.velocityY
        a1.grounded = v32.grounded
        a1.birdTilt = v32.birdTilt
        a1.distance:restore(v32.studs)
        a1.bonusScore = v32.bonusScore
        a1.lastReported = -1
        a1.perfectStreak = v32.perfectStreak
        a1:setFever(v32.fever)
        a1.goldCollected = a2.pickups
        a1.cloudTouchedThisFlight = false
        a1.sunProgress = v32.sunProgress
        a1.nightX = v32.nightX
        a1.elapsed = v32.elapsed
        a1.warnedSetting = v32.warnedSetting
        a1.warnedPanic = v32.warnedPanic
        a1.cameraX = v32.cameraX
        a1.cameraY = v32.cameraY
        a1.fieldOfView = 20
        local terrain_2 = a1.terrain
        local v33 = Random.new(a1.terrainSeed)
        terrain_2:reset(v33, ((a1.curatedOpening) and "curated") or "seeded")
        a1.terrain:ensureCoverage(a1.x + 180)
        a1:parkBird()
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1:layoutSegmentWindow()
        a1.coinRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 1)
        a1.coinPlanX = a1.x
        a1.emptyFallStreak = 0
        a1.lastStringEndX = -math.huge
        a1:reclaimAllCoins()
        a1:planCoinsAhead()
        a1:layoutClouds()
        a1:layoutBackground()
        a1.context.reportScore(a2.score)
        a1.context.reportPickup(a1.goldCollected)
        return true
    end
    return false
end
u22.start = function(a1)
    --[[
      name: start
      line: 670
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.launchQueued = true
    BaseWorldGame_upv_1.start(a1)
end
u22.destroy = function(a1)
    --[[
      name: destroy
      line: 674
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.momentumAudio:stop()
    BaseWorldGame_upv_1.destroy(a1)
end
u22.revive = function(a1)
    --[[
      name: revive
      line: 678
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1:clearSleepBeat()
    a1:endTutorial()
    a1.holding = false
    a1.momentumAudio:stop()
    local splashReviveX_1 = a1.splashReviveX
    a1.splashReviveX = nil
    if splashReviveX_1 == nil then
        splashReviveX_1 = (a1.terrain:isGapAt(a1.x) and (a1.terrain:gapEndAfter(a1.x) + TINY_WINGS_CONFIG_upv_1.splashReviveOffset)) or splashReviveX_1
    end
    if splashReviveX_1 ~= nil then
        a1.x = splashReviveX_1
        a1.speed = math.max(a1.speed, TINY_WINGS_CONFIG_upv_1.splashReviveSpeed)
        a1.velocityX = 0
        a1.velocityY = 0
        a1.terrain:ensureCoverage(a1.x + 180)
        a1.cameraX = a1.x + TINY_WINGS_CONFIG_upv_1.cameraLeadX
        a1:layoutSegmentWindow()
    end
    a1.nightX = a1.x - (TINY_WINGS_CONFIG_upv_1.graceDistanceStuds * TINY_WINGS_CONFIG_upv_1.reviveGraceFraction)
    a1.sunProgress = 1 - TINY_WINGS_CONFIG_upv_1.reviveGraceFraction
    a1.warnedSetting = false
    a1.warnedPanic = false
    a1.perfectStreak = 0
    a1:setFever(false)
    a1.cloudTouchedThisFlight = false
    a1.grounded = true
    a1.y = a1.terrain:heightAt(a1.x)
    a1:parkBird()
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1:setRunning(true)
end
u22.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 718
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1.elapsed = a1.elapsed + a2
        local x_1 = a1.x
        local y_1 = a1.y
        local v34, v35 = nil, nil
        if a1.grounded then
            local v36 = math.atan(a1.terrain:slopeAt(a1.x))
            a1.speed = math.clamp(a1.speed + (((-(-TINY_WINGS_CONFIG_upv_1.gravity * (((not (a1.holding)) and 1) or (TINY_WINGS_CONFIG_upv_1.diveGroundMultiplier))) * math.sin(v36) - TINY_WINGS_CONFIG_upv_1.rollFriction) - ((TINY_WINGS_CONFIG_upv_1.dragQuadratic * a1.speed) * a1.speed)) * a2), TINY_WINGS_CONFIG_upv_1.minSpeed, TINY_WINGS_CONFIG_upv_1.maxSpeed)
            local v37 = TINY_WINGS_CONFIG_upv_1.gravity * (((not (a1.holding)) and 1) or (TINY_WINGS_CONFIG_upv_1.diveAirMultiplier))
            local v38 = a1.speed * math.cos(v36)
            local v39 = a1.speed * math.sin(v36)
            local v40 = a1.x + v38 * a2
            v34 = a1.y + (v39 * a2) + ((0.5 * v37) * a2) * a2
            v35 = a1.terrain:heightAt(v40)
            if v35 + 0.001 >= v34 then
                a1.x = v40
                a1.y = v35
            else
                a1.grounded = false
                a1.velocityX = v38
                a1.velocityY = v39 + (v37 * a2)
                a1.x = v40
                a1.y = v34
            end
        else
            a1.velocityY = math.max(a1.velocityY + ((TINY_WINGS_CONFIG_upv_1.gravity * (((not (a1.holding)) and 1) or (TINY_WINGS_CONFIG_upv_1.diveAirMultiplier))) * a2), TINY_WINGS_CONFIG_upv_1.terminalFall)
            a1.x = a1.x + (a1.velocityX * a2)
            a1.y = a1.y + (a1.velocityY * a2)
            if a1.y <= TINY_WINGS_CONFIG_upv_1.waterSurfaceY and a1.terrain:isGapAt(a1.x) then
                a1:splash()
                return nil
            end
            if a1.y <= a1.terrain:heightAt(a1.x) then
                a1:resolveLanding(x_1, y_1)
            end
        end
        a1.momentumAudio:step(a2, a1:momentumSpeed())
        a1.nightX = a1.nightX + (math.min(TINY_WINGS_CONFIG_upv_1.nightSpeedStart + (a1.elapsed * TINY_WINGS_CONFIG_upv_1.nightSpeedRampPerSecond), TINY_WINGS_CONFIG_upv_1.nightSpeedMax) * a2)
        a1.nightX = math.max(a1.nightX, a1.x - TINY_WINGS_CONFIG_upv_1.graceDistanceStuds)
        a1.sunProgress = math.clamp(1 - ((a1.x - a1.nightX) / TINY_WINGS_CONFIG_upv_1.graceDistanceStuds), 0, 1)
        if a1.sunProgress < TINY_WINGS_CONFIG_upv_1.sunWarnAt then
            a1.warnedSetting = false
        end
        if a1.sunProgress < TINY_WINGS_CONFIG_upv_1.sunPanicAt then
            a1.warnedPanic = false
        end
        if not (a1.warnedSetting) and TINY_WINGS_CONFIG_upv_1.sunWarnAt <= a1.sunProgress then
            a1.warnedSetting = true
            a1.popups:show(a1:birdPosition() + Vector3.new(0, 5, 2), "THE SUN IS SETTING", u16, 0.9)
            a1.context.audio.play("countdownBeep", {})
        end
        if not (a1.warnedPanic) and TINY_WINGS_CONFIG_upv_1.sunPanicAt <= a1.sunProgress then
            a1.warnedPanic = true
            a1.context.audio.play("countdownBeep", {})
        end
        if a1.sunProgress < 1 then
            local v41 = math.abs(a1.x - x_1)
            if a1.distance:advance(v41 * (((not (a1.fever)) and 1) or (TINY_WINGS_CONFIG_upv_1.feverDistanceMultiplier))) then
                a1:reportTotal()
            end
            a1.terrain:ensureCoverage(a1.x + 180)
            a1.terrain:dropBefore(a1.x - 130)
            a1:recycleSegments()
            a1:planCoinsAhead()
            a1:updateCoins(a2)
            a1:updateCloudBand()
            a1:recycleClouds()
            a1:recycleBackground()
        else
            a1:beginSleep()
            return nil
        end
    end
end
u22.render = function(a1, a2)
    --[[
      name: render
      line: 820
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    if a1.tutorial:isActive() then
        a1.timeScale = a1.tutorial:update(a1.realDelta, a1.x, a1.grounded, a1.holding)
    end
    local v42
    if a1.grounded then
        v42 = math.atan(a1.terrain:slopeAt(a1.x))
    else
        local v43 = math.atan2(a1.velocityY, math.max(a1.velocityX, 1))
        v42 = v43 - (((a1.holding) and 0.25) or 0)
    end
    a1.birdTilt = a1.birdTilt + ((v42 - a1.birdTilt) * math.min(a2 * 10, 1))
    if not (a1.dead) then
        local renderAlpha_1 = a1.renderAlpha
        a1.bird.CFrame = CFrame.new(a1.stage.origin + Vector3.new(lerp_upv_1(a1.renderPrevX, a1.x, renderAlpha_1), lerp_upv_1(a1.renderPrevY, a1.y, renderAlpha_1), 0) + Vector3.new(0, 1.100000023841858, 0)) * CFrame.Angles(0, 0, a1.birdTilt)
    end
    a1.birdRig:pose(a1.bird.CFrame, a2, ((a1.grounded) and "ground") or (((a1.holding) and "dive") or "soar"))
    local birdOverlay_1 = a1.birdOverlay
    if birdOverlay_1 ~= nil then
        birdOverlay_1:follow(a1.bird.CFrame)
    end
    a1:animateCoins()
    local momentumAudio_1 = a1.momentumAudio
    local v44 = a1:isRunning() and (not a1.dead)
    momentumAudio_1:update(a2, v44, a1:momentumSpeed(), a1.holding)
    a1:updateCameraAndSky(a2)
end
u22.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 852
    ]]
    if a1.dead then
        local v45
        if a1.sleeping then
            a1:updateSleep(a2)
            return nil
        end
        a1.birdRig:pose(a1.bird.CFrame, a2, "soar")
        v45 = a1.birdOverlay
        if v45 ~= nil then
            v45:follow(a1.bird.CFrame)
        end
        a1:updateCameraAndSky(a2)
    else
        a1:render(a2)
        return nil
    end
end
u22.updateCameraAndSky = function(a1, a2)
    --[[
      name: updateCameraAndSky
      line: 869
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        u4 (copy, index: 3)
        Lighting_upv_1 (copy, index: 4)
    ]]
    local v46 = a1.terrain:heightAt(a1.x)
    a1.cameraX = a1.cameraX + (((((a1.nestIntro) and (a1.x + TINY_WINGS_CONFIG_upv_1.nestCameraOffsetX)) or (a1.x + TINY_WINGS_CONFIG_upv_1.cameraLeadX)) - a1.cameraX) * math.min(a2 * TINY_WINGS_CONFIG_upv_1.cameraFollowRateX, 1))
    a1.cameraY = a1.cameraY + (((((a1.nestIntro) and (v46 + TINY_WINGS_CONFIG_upv_1.nestCameraOffsetY)) or ((v46 * 0.6) + (a1.y * 0.4) + TINY_WINGS_CONFIG_upv_1.cameraHeightOffset)) - a1.cameraY) * math.min(a2 * TINY_WINGS_CONFIG_upv_1.cameraFollowRateY, 1))
    local v47 = math.clamp(((((a1.sleeping) and 0) or (a1.speed)) - 60) / 60, 0, 1)
    local v48 = math.clamp((a1.y - v46) / TINY_WINGS_CONFIG_upv_1.zoomAltitudeRange, 0, 1)
    local v49 = ((not (a1.nestIntro)) and (20 + (TINY_WINGS_CONFIG_upv_1.fieldOfViewMax - 20) * math.max((v47 * 0.45) + (v48 * 0.55), 0))) or (TINY_WINGS_CONFIG_upv_1.nestZoomFov)
    a1.fieldOfView = a1.fieldOfView + ((v49 - a1.fieldOfView) * math.min(a2 * TINY_WINGS_CONFIG_upv_1.fieldOfViewRate, 1))
    a1.stage.camera.FieldOfView = a1.fieldOfView
    a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
    local v50 = math.tan(math.rad(a1.fieldOfView / 2)) * 226.85127278470839
    local v51 = v50 * (a1.stage.getFrameWidth() / a1.stage.frameHeight)
    local origin_2 = a1.stage.origin
    a1.sunAnchor.CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX + ((v51 * 0.3) * 1.70530792283386), a1.cameraY + ((v50 * (0.4 - (0.85 * a1.sunProgress))) * 1.70530792283386), -80))
    a1.moonAnchor.CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX - ((v51 * 0.3) * 1.70530792283386), a1.cameraY + ((v50 * ((math.clamp((a1.sunProgress - 0.74) / 0.26, 0, 1) * 0.95) + -0.55)) * 1.70530792283386), -80))
    a1.dayBarAnchor.CFrame = CFrame.new(origin_2 + Vector3.new(a1.cameraX, a1.cameraY + (v50 * 0.42), -20))
    a1.dayBarIndicator.Position = UDim2.fromScale(math.clamp(a1.sunProgress, 0, 1), 0.5)
    a1.dayBarIndicator.BackgroundColor3 = u3:Lerp(u4, a1.sunProgress)
    Lighting_upv_1.ClockTime = TINY_WINGS_CONFIG_upv_1.clockTimeDay + ((TINY_WINGS_CONFIG_upv_1.clockTimeNight - TINY_WINGS_CONFIG_upv_1.clockTimeDay) * math.clamp(a1.sunProgress, 0, 1))
end
u22.resolveLanding = function(a1, a2, a3)
    --[[
      name: resolveLanding
      line: 912
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
    ]]
    local v52 = a1.x
    local v53 = a1.y
    local v54, v55 = a2, a3
    for v56 = 0, 2 do
        local v57
        v57 = (v54 + v52) / 2
        local v58
        v58 = (v55 + v53) / 2
        if v58 - a1.terrain:heightAt(v57) < 0 then
            v52, v53 = v57, v58
        else
            v54, v55 = v57, v58
        end
    end
    a1.x = v52
    a1.y = a1.terrain:heightAt(v52)
    a1.grounded = true
    a1.cloudTouchedThisFlight = false
    local v59 = math.atan(a1.terrain:slopeAt(a1.x))
    local v56 = math.abs(math.atan2(a1.velocityY, math.max(a1.velocityX, 0.01)) - v59)
    local v60 = math.sqrt((a1.velocityX * a1.velocityX) + (a1.velocityY * a1.velocityY))
    if v56 > math.rad(TINY_WINGS_CONFIG_upv_1.perfectAngleDegrees) then
        if v56 > math.rad(TINY_WINGS_CONFIG_upv_1.okAngleDegrees) then
            a1.speed = math.max(v60 * math.cos(v56) * TINY_WINGS_CONFIG_upv_1.harshSpeedKeep, TINY_WINGS_CONFIG_upv_1.minSpeed)
            a1.perfectStreak = 0
            a1:setFever(false)
            a1.context.audio.play("thud", {})
            a1.stage.shake(0.8)
            if (a1.tutorial:isActive()) then
                return
            end
            a1:hitStop(0.04)
        else
            a1.speed = math.max(v60 * math.cos(v56), TINY_WINGS_CONFIG_upv_1.minSpeed)
            a1.perfectStreak = 0
            a1:setFever(false)
        end
    else
        a1.speed = math.min(v60 + TINY_WINGS_CONFIG_upv_1.perfectSpeedBoost, TINY_WINGS_CONFIG_upv_1.maxSpeed)
        a1.perfectStreak = a1.perfectStreak + 1
        local v61 = TINY_WINGS_CONFIG_upv_1.perfectBonusPoints * (((a1.fever) and 2) or 1)
        a1.bonusScore = a1.bonusScore + v61
        a1:reportTotal()
        a1.popups:show(a1:birdPosition() + Vector3.new(0, 4, 2), ("PERFECT +%*"):format(v61), u15, 0.9)
        a1.context.audio.play("perfect", {pitch = (math.min(a1.perfectStreak, 6) * 0.06) + 1})
        if (a1.fever) or TINY_WINGS_CONFIG_upv_1.feverStreak > a1.perfectStreak then
            return
        end
        a1:setFever(true)
        a1.popups:show(a1:birdPosition() + Vector3.new(0, 6, 2), "FEVER!", u15, 1.2)
        a1.context.audio.play("newBestFanfare", {})
    end
end
u22.setFever = function(a1, a2)
    --[[
      name: setFever
      line: 984
      upvalues:
        u20 (copy, index: 1)
    ]]
    a1.fever = a2
    local trail_1 = a1.trail
    trail_1.Color = u20
end
u22.planCoinsAhead = function(a1)
    --[[
      name: planCoinsAhead
      line: 988
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    while a1.coinPlanX < a1.x + TINY_WINGS_CONFIG_upv_1.coinPlanAheadStuds do
        a1.terrain:ensureCoverage(a1.coinPlanX + 1)
        local v62 = a1.terrain:pieceInfoAt(a1.coinPlanX)
        a1.terrain:ensureCoverage(v62.endX + TINY_WINGS_CONFIG_upv_1.coinArcMaxSpanStuds)
        a1:planPiece(v62)
        a1.coinPlanX = v62.endX
    end
end
u22.planPiece = function(a1, a2)
    --[[
      name: planPiece
      line: 998
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2.kind == "dive" then
        a1:placeSurfaceString(a2.startX + 2, a2.endX, TINY_WINGS_CONFIG_upv_1.coinStringMaxCount)
    elseif a2.kind == "gap" then
        a1:placeGapArc(a2)
    elseif a2.kind ~= "rampCut" and a2.kind ~= "cliff" then
        if math.abs(a2.y1 - a2.y0) >= TINY_WINGS_CONFIG_upv_1.coinMinPieceAmplitude then
            if a2.y1 >= a2.y0 then
                a1:planRisePiece(a2)
            else
                a1:planFallPiece(a2)
            end
            return
        end
        return nil
    end
    return nil
end
u22.planFallPiece = function(a1, a2)
    --[[
      name: planFallPiece
      line: 1022
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v63 = a1.coinRandom:NextNumber()
    local v64 = v63 < TINY_WINGS_CONFIG_upv_1.coinStringChance
    local v65 = not v64 and (v63 < TINY_WINGS_CONFIG_upv_1.coinStringChance + TINY_WINGS_CONFIG_upv_1.coinArcChance)
    local v66 = not v64 and (not v65 and (TINY_WINGS_CONFIG_upv_1.coinMaxEmptyFalls <= a1.emptyFallStreak))
    local v67 = nil
    if v65 then
        a1.emptyFallStreak = 0
        a1:placeCrestArc(a2)
        return nil
    else
        if not (v64) and not (v66) then
            a1.emptyFallStreak = a1.emptyFallStreak + 1
            return nil
        end
        a1.emptyFallStreak = 0
        local v68 = a2.endX
        v67 = a1.terrain:pieceInfoAt(a2.endX)
        if v67.kind == "hill" then
            v68 = math.min(a2.endX + (TINY_WINGS_CONFIG_upv_1.coinStringRiseCarry * (v67.endX - v67.startX)), a2.endX + TINY_WINGS_CONFIG_upv_1.coinArcMaxSpanStuds)
        end
        a1:placeSurfaceString(a2.startX + (0.12 * (a2.endX - a2.startX)), v68, TINY_WINGS_CONFIG_upv_1.coinStringMaxCount)
    end
end
u22.planRisePiece = function(a1, a2)
    --[[
      name: planRisePiece
      line: 1049
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if ((a2.y1 - a2.y0) * math.pi) / (2 * a2.curveLength) >= TINY_WINGS_CONFIG_upv_1.coinBlueSlopeThreshold then
        local v69 = nil
        if TINY_WINGS_CONFIG_upv_1.coinBlueChance > a1.coinRandom:NextNumber() then
            v69 = a2.startX + TINY_WINGS_CONFIG_upv_1.coinBlueBaseFraction * (a2.endX - a2.startX)
            if v69 >= a1.lastStringEndX + 2 then
                a1:placeCoin("blue", v69, a1:surfaceLineY(v69))
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u22.placeSurfaceString = function(a1, a2, a3, a4)
    --[[
      name: placeSurfaceString
      line: 1064
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v70 = 0
    local v71 = false
    local v72 = a2
    while true do
        if v71 then
            v70 = v70 + 1
        else
            v71 = true
        end
        if v70 >= a4 then
            break
        end
        local v73
        if a3 < v72 then
            break
        end
        v73 = a1.terrain:kindAt(v72)
        if v73 == "hill" then
            a1:placeCoin("gold", v72, a1:surfaceLineY(v72))
            a1.lastStringEndX = v72
            v72 = v72 + TINY_WINGS_CONFIG_upv_1.coinStringSpacing * math.cos(math.atan(math.abs(a1.terrain:slopeAt((v72 + (v72 + (TINY_WINGS_CONFIG_upv_1.coinStringSpacing * math.cos(math.atan(math.abs(a1.terrain:slopeAt(v72))))))) / 2))))
            continue
        end
        if v73 ~= "dive" then
            break
        end
        a1:placeCoin("gold", v72, a1:surfaceLineY(v72))
        a1.lastStringEndX = v72
        v72 = v72 + TINY_WINGS_CONFIG_upv_1.coinStringSpacing * math.cos(math.atan(math.abs(a1.terrain:slopeAt((v72 + (v72 + (TINY_WINGS_CONFIG_upv_1.coinStringSpacing * math.cos(math.atan(math.abs(a1.terrain:slopeAt(v72))))))) / 2))))
    end
end
u22.placeCrestArc = function(a1, a2)
    --[[
      name: placeCrestArc
      line: 1094
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
    ]]
    local startX_1 = a2.startX
    local v74 = lerp_upv_1(TINY_WINGS_CONFIG_upv_1.coinArcSpeedNear, TINY_WINGS_CONFIG_upv_1.coinArcSpeedFar, math.clamp(startX_1 / 1200, 0, 1)) + a1.coinRandom:NextNumber(-TINY_WINGS_CONFIG_upv_1.coinArcSpeedJitter, TINY_WINGS_CONFIG_upv_1.coinArcSpeedJitter)
    for n_1 = 0, TINY_WINGS_CONFIG_upv_1.coinArcCount - 1 do
        local v75
        v75 = TINY_WINGS_CONFIG_upv_1.coinStringSpacing + n_1 * (TINY_WINGS_CONFIG_upv_1.coinStringSpacing * 1.2)
        if TINY_WINGS_CONFIG_upv_1.coinArcMaxSpanStuds < v75 then
            break
        end
        local v76
        v76 = startX_1 + v75
        local v77
        if a1.terrain:kindAt(v76) ~= "hill" then
            break
        end
        v77 = a2.y0 + TINY_WINGS_CONFIG_upv_1.coinGroundOffset - (-TINY_WINGS_CONFIG_upv_1.gravity / ((2 * v74) * v74) * v75) * v75
        local v78
        v78 = a1:surfaceLineY(v76)
        if v77 > v78 then
            a1:placeCoin("gold", v76, v77)
            continue
        end
        a1:placeCoin("gold", v76, v78)
        return
    end
end
u22.placeGapArc = function(a1, a2)
    --[[
      name: placeGapArc
      line: 1123
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local startX_2 = a2.startX
    local v79 = a1.terrain:heightAt(startX_2 - 0.5)
    local v80 = math.atan(a1.terrain:slopeAt(startX_2 - 0.5))
    local v81 = TINY_WINGS_CONFIG_upv_1.coinGapArcSpeed * math.cos(v80)
    for n_2 = 0, TINY_WINGS_CONFIG_upv_1.coinArcCount - 1 do
        local v82 = (n_2 + 0.5) / TINY_WINGS_CONFIG_upv_1.coinArcCount * (TINY_WINGS_CONFIG_upv_1.biomeGapWidth + 4)
        a1:placeCoin("gold", startX_2 + v82, (math.max(v79 + (math.tan(v80) * v82) + (((TINY_WINGS_CONFIG_upv_1.gravity * v82) * v82) / ((2 * v81) * v81)), TINY_WINGS_CONFIG_upv_1.waterSurfaceY + 3)))
    end
end
u22.surfaceLineY = function(a1, a2)
    --[[
      name: surfaceLineY
      line: 1135
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v83 = math.min(math.atan(math.abs(a1.terrain:slopeAt(a2))), math.rad(TINY_WINGS_CONFIG_upv_1.coinSlopeOffsetCapDegrees))
    return a1.terrain:heightAt(a2) + (TINY_WINGS_CONFIG_upv_1.coinGroundOffset / math.cos(v83))
end
u22.placeCoin = function(a1, a2, a3, a4)
    --[[
      name: placeCoin
      line: 1139
      upvalues:
        u12 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    local freeCoins_1 = a1.freeCoins
    local v84 = #freeCoins_1
    local v85 = freeCoins_1[v84]
    freeCoins_1[v84] = nil
    if v85 ~= nil then
        v85.kind = a2
        v85.x = a3
        v85.y = a4
        v85.active = true
        if v85.goldVisual ~= nil and v85.blueVisual ~= nil then
            local v86
            if a2 ~= "gold" then
                v86 = v85.goldVisual
            else
                v86 = v85.blueVisual
            end
            v86:park()
            return nil
        end
        if a2 ~= "gold" then
            v85.part.Color = u13
            v85.part.Size = Vector3.new(0.47999998927116394, 1.7000000476837158, 1.7000000476837158)
        else
            v85.part.Color = u12
            v85.part.Size = Vector3.new(0.41999998688697815, 1.5, 1.5)
        end
        v85.part.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a3, a4, 0))
    else
        return nil
    end
end
u22.updateCoins = function(a1, a2)
    --[[
      name: updateCoins
      line: 1171
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v87 = a1.y + 1.1
    local v88 = TINY_WINGS_CONFIG_upv_1.coinCollectRadius * TINY_WINGS_CONFIG_upv_1.coinCollectRadius
    local v89 = TINY_WINGS_CONFIG_upv_1.coinMagnetRadius * TINY_WINGS_CONFIG_upv_1.coinMagnetRadius
    local v90 = math.min(a2 * TINY_WINGS_CONFIG_upv_1.coinMagnetPullRate, 1)
    local v91, v92 = nil, nil
    for _, value_2 in a1.coins do
        if not (value_2.active) then
            continue
        end
        if value_2.x < a1.x - TINY_WINGS_CONFIG_upv_1.coinBehindKeepStuds then
            a1:parkCoin(value_2)
            table.insert(a1.freeCoins, value_2)
            continue
        end
        v91 = value_2.x - a1.x
        v92 = value_2.y - v87
        if v89 > 0 and (v91 * v91) + (v92 * v92) <= v89 then
            value_2.x = value_2.x + ((a1.x - value_2.x) * v90)
            value_2.y = value_2.y + ((v87 - value_2.y) * v90)
            v91, v92 = value_2.x - a1.x, value_2.y - v87
        end
        if (v91 * v91) + (v92 * v92) <= v88 then
            a1:collectCoin(value_2)
        end
    end
end
u22.collectCoin = function(a1, a2)
    --[[
      name: collectCoin
      line: 1199
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    a1:parkCoin(a2)
    table.insert(a1.freeCoins, a2)
    if a2.kind ~= "gold" then
        a1.speed = math.min(a1.speed + TINY_WINGS_CONFIG_upv_1.blueCoinSpeedBoost, TINY_WINGS_CONFIG_upv_1.maxSpeed)
        if not (a1.grounded) then
            a1.velocityX = math.min(a1.velocityX + TINY_WINGS_CONFIG_upv_1.blueCoinSpeedBoost, TINY_WINGS_CONFIG_upv_1.maxSpeed)
        end
        a1.popups:show(a1:birdPosition() + Vector3.new(0, 4, 2), "BOOST!", u17, 0.9)
        a1.context.audio.play("whoosh", {})
    else
        a1.goldCollected = a1.goldCollected + 1
        a1.bonusScore = a1.bonusScore + TINY_WINGS_CONFIG_upv_1.goldCoinScore
        a1.context.reportPickup(a1.goldCollected)
        a1:reportTotal()
        a1.context.audio.play("coinTick", {pitch = 1 + ((a1.goldCollected % 10) * 0.04)})
    end
end
u22.updateCloudBand = function(a1)
    --[[
      name: updateCloudBand
      line: 1229
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u18 (copy, index: 2)
    ]]
    if a1.grounded then
        a1.cloudTouchedThisFlight = false
    elseif not (a1.cloudTouchedThisFlight) and a1.y >= TINY_WINGS_CONFIG_upv_1.cloudBandY then
        a1.cloudTouchedThisFlight = true
        local v93 = TINY_WINGS_CONFIG_upv_1.cloudTouchBonus * (((a1.fever) and 2) or 1)
        a1.bonusScore = a1.bonusScore + v93
        a1:reportTotal()
        a1.popups:show(a1:birdPosition() + Vector3.new(0, 4, 2), ("CLOUDS +%*"):format(v93), u18, 1.05)
        a1.context.audio.play("perfect", {})
        return
    end
    return nil
end
u22.animateCoins = function(a1)
    --[[
      name: animateCoins
      line: 1250
    ]]
    local v94 = os.clock() * 3
    local origin_3 = a1.stage.origin
    local v95 = nil
    local v96 = nil
    for _, value_3 in a1.coins do
        if not (value_3.active) then
            continue
        end
        v95 = CFrame.new(origin_3.X + value_3.x, (origin_3.Y + value_3.y) + (math.sin((v94 * 2) + value_3.x) * 0.2), origin_3.Z) * CFrame.Angles(0, v94 + (value_3.x * 0.7), 0)
        if value_3.kind ~= "gold" then
            v96 = value_3.blueVisual
        else
            v96 = value_3.goldVisual
        end
        if v96 == nil then
            value_3.part.CFrame = v95
        else
            v96:pose(v95)
        end
    end
end
u22.parkCoin = function(a1, a2)
    --[[
      name: parkCoin
      line: 1268
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.CFrame = u1
    local goldVisual_1 = a2.goldVisual
    if goldVisual_1 ~= nil then
        goldVisual_1:park()
    end
    local blueVisual_1 = a2.blueVisual
    if blueVisual_1 == nil then
        return
    end
    blueVisual_1:park()
end
u22.reclaimAllCoins = function(a1)
    --[[
      name: reclaimAllCoins
      line: 1280
    ]]
    while #a1.freeCoins > 0 do
        local freeCoins_2 = a1.freeCoins
        freeCoins_2[#freeCoins_2] = nil
    end
    for _, value_4 in a1.coins do
        a1:parkCoin(value_4)
        table.insert(a1.freeCoins, value_4)
    end
end
u22.makeSkyDecal = function(a1, a2, a3, a4)
    --[[
      name: makeSkyDecal
      line: 1291
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        markWorldArt_upv_1 (copy, index: 2)
    ]]
    local v97 = makeSmoothPart_upv_1(a2)
    v97.Transparency = 1
    v97.Size = Vector3.new(a4, a4, 0.2)
    local v98 = Instance.new("SurfaceGui")
    v98.Face = Enum.NormalId.Back
    v98.LightInfluence = 0
    v98.Brightness = 1.5
    v98.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    v98.PixelsPerStud = 64
    markWorldArt_upv_1(v98)
    v98.Parent = v97
    local v99 = Instance.new("ImageLabel")
    v99.BackgroundTransparency = 1
    v99.Size = UDim2.fromScale(1, 1)
    v99.Image = a3
    v99.ScaleType = Enum.ScaleType.Fit
    v99.Parent = v98
    return v97
end
u22.buildBackground = function(a1, a2, a3)
    --[[
      name: buildBackground
      line: 1314
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u7 (copy, index: 3)
        u8 (copy, index: 4)
        u9 (copy, index: 5)
        makeSmoothPart_upv_1 (copy, index: 6)
    ]]
    local v100 = a3("Pine")
    local v101 = a3("Trunk")
    local v102 = a3("Mountain")
    local v107 = nil
    for n_3 = 0, TINY_WINGS_CONFIG_upv_1.pinePoolSize - 1 do
        v107 = ((((n_3 % 2) == 1) and 0.82) or 1) * (((n_3 % 3) * 0.16) + 0.85)
        local tbl_13 = {}
        local v104 = makeStagePart_upv_1(a2)
        v104.Size = Vector3.new(v107 * 2, v107 * 6.5, v107 * 2)
        v104.Color = u7
        table.insert(tbl_13, v104)
        local tbl_14 = {13, 9.5, 6}
        for v105 = 0, 2 do
            local v106 = makeStagePart_upv_1(a2)
            v106.Size = Vector3.new(tbl_14[v105 + 1] * v107, v107 * 4.4, v107 * 3)
            table.insert(tbl_13, v106)
        end
        table.insert(a1.pines, {parts = tbl_13})
        local v105
        v105 = a1:makeBackgroundOverlay(v100, a2, tbl_13)
        if v105 ~= nil then
            a1.pineOverlays[n_3] = v105
        end
    end
    for n_4 = 0, TINY_WINGS_CONFIG_upv_1.trunkPoolSize - 1 do
        local v108 = makeStagePart_upv_1(a2)
        v108.Size = Vector3.new(4.199999809265137, 78, 4.199999809265137)
        if n_4 % 2 ~= 0 then
            v107 = u9
        else
            v107 = u8
        end
        v108.Color = v107
        table.insert(a1.trunks, {parts = {v108}})
        local v109
        v109 = a1:makeBackgroundOverlay(v101, a2, {v108})
        if v109 ~= nil then
            a1.trunkOverlays[n_4] = v109
        end
    end
    for n_5 = 0, TINY_WINGS_CONFIG_upv_1.mountainPoolSize - 1 do
        local v110 = (n_5 % 3) * 13 + 44
        local v111 = makeSmoothPart_upv_1(a2)
        v111.Material = Enum.Material.DiamondPlate
        v111.Size = Vector3.new(v110, v110, 3)
        v111.CastShadow = false
        table.insert(a1.mountains, {parts = {v111}})
        local v112
        v112 = a1:makeBackgroundOverlay(v102, a2, {v111})
        if v112 ~= nil then
            a1.mountainOverlays[n_5] = v112
        end
    end
end
u22.makeBackgroundOverlay = function(a1, a2, a3, a4)
    --[[
      name: makeBackgroundOverlay
      line: 1386
      upvalues:
        PropOverlay_upv_1 (copy, index: 1)
    ]]
    if a2 ~= nil then
        for _, value_5 in a4 do
            value_5.Transparency = 1
        end
        return PropOverlay_upv_1:make(a2, a3, CFrame.identity, false)
    end
    return nil
end
u22.layoutBackground = function(a1)
    --[[
      name: layoutBackground
      line: 1395
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_6 = 0, #a1.pines - 1 do
        a1.pines[n_6 + 1].x = ((a1.x - 120) + (n_6 * TINY_WINGS_CONFIG_upv_1.pineSpacingX)) + (((n_6 * 41) % 19) - 9)
        a1:posePine(n_6)
    end
    for n_7 = 0, #a1.trunks - 1 do
        a1.trunks[n_7 + 1].x = ((a1.x - 150) + (n_7 * TINY_WINGS_CONFIG_upv_1.trunkSpacingX)) + (((n_7 * 67) % 41) - 20)
        a1:poseTrunk(n_7)
    end
    for n_8 = 0, #a1.mountains - 1 do
        a1.mountains[n_8 + 1].x = ((a1.x - 160) + (n_8 * TINY_WINGS_CONFIG_upv_1.mountainSpacingX)) + (((n_8 * 53) % 37) - 18)
        a1:poseMountain(n_8)
    end
end
u22.recycleBackground = function(a1)
    --[[
      name: recycleBackground
      line: 1409
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_9 = 0, #a1.pines - 1 do
        if a1.pines[n_9 + 1].x < a1.x - 130 then
            local v113 = a1.pines[n_9 + 1]
            v113.x = v113.x + TINY_WINGS_CONFIG_upv_1.pinePoolSize * TINY_WINGS_CONFIG_upv_1.pineSpacingX
            a1:posePine(n_9)
        end
    end
    for n_10 = 0, #a1.trunks - 1 do
        if a1.trunks[n_10 + 1].x < a1.x - 190 then
            local v114 = a1.trunks[n_10 + 1]
            v114.x = v114.x + TINY_WINGS_CONFIG_upv_1.trunkPoolSize * TINY_WINGS_CONFIG_upv_1.trunkSpacingX
            a1:poseTrunk(n_10)
        end
    end
    for n_11 = 0, #a1.mountains - 1 do
        if a1.mountains[n_11 + 1].x < a1.x - 180 then
            local v115 = a1.mountains[n_11 + 1]
            v115.x = v115.x + TINY_WINGS_CONFIG_upv_1.mountainPoolSize * TINY_WINGS_CONFIG_upv_1.mountainSpacingX
            a1:poseMountain(n_11)
        end
    end
end
u22.posePine = function(a1, a2)
    --[[
      name: posePine
      line: 1432
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        paletteForIsland_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
        u5 (copy, index: 4)
    ]]
    local v116 = a1.pines[a2 + 1]
    local v117 = a2 % 2 == 1
    local v118
    if v117 then
        v118 = -33
    else
        v118 = -22
    end
    local origin_4 = a1.stage.origin
    local v119 = v116.parts[1]
    local v120 = a1.pineOverlays[a2]
    if v120 == nil then
        local v121 = paletteForIsland_upv_1(a1.terrain:islandIndexAt(v116.x))
        local v122
        if v117 then
            v122 = u6
        else
            v122 = u5
        end
        local v123 = v122:Lerp(v121.crustB, 0.28)
        v119.CFrame = CFrame.new(origin_4 + Vector3.new(v116.x, TINY_WINGS_CONFIG_upv_1.pineBaseY + (v119.Size.Y / 2), v118))
        local v124 = TINY_WINGS_CONFIG_upv_1.pineBaseY + v119.Size.Y * 0.6
        for n_12 = 1, #v116.parts - 1 do
            local v125 = v116.parts[n_12 + 1]
            v125.Color = v123
            v125.CFrame = CFrame.new(origin_4 + Vector3.new(v116.x, v124 + (v125.Size.Y / 2), v118))
            v124 = v124 + v125.Size.Y * 0.74
        end
    else
        v120:follow(CFrame.new(origin_4 + Vector3.new(v116.x, TINY_WINGS_CONFIG_upv_1.pineBaseY + (v119.Size.Y / 2), v118)))
        return nil
    end
end
u22.poseTrunk = function(a1, a2)
    --[[
      name: poseTrunk
      line: 1460
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v126 = a1.trunks[a2 + 1]
    local v127 = v126.parts[1]
    local v128 = CFrame.new(a1.stage.origin + Vector3.new(v126.x, (TINY_WINGS_CONFIG_upv_1.pineBaseY - 6) + (v127.Size.Y / 2), TINY_WINGS_CONFIG_upv_1.trunkZ))
    local v129 = a1.trunkOverlays[a2]
    if v129 == nil then
        v127.CFrame = v128
    else
        v129:follow(v128)
        return nil
    end
end
u22.poseMountain = function(a1, a2)
    --[[
      name: poseMountain
      line: 1475
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        paletteForIsland_upv_1 (copy, index: 2)
        u10 (copy, index: 3)
    ]]
    local v130 = a1.mountains[a2 + 1]
    local origin_5 = a1.stage.origin
    local v131 = a1.mountainOverlays[a2]
    if v131 == nil then
        local v132 = paletteForIsland_upv_1(a1.terrain:islandIndexAt(v130.x))
        local v133 = v130.parts[1]
        v133.Color = u10:Lerp(v132.sky, 0.25)
        v133.CFrame = CFrame.new(origin_5 + Vector3.new(v130.x, TINY_WINGS_CONFIG_upv_1.mountainBaseY, TINY_WINGS_CONFIG_upv_1.mountainZ)) * CFrame.Angles(0, 0, 0.7853981633974483)
    else
        v131:follow(CFrame.new(origin_5 + Vector3.new(v130.x, TINY_WINGS_CONFIG_upv_1.mountainBaseY, TINY_WINGS_CONFIG_upv_1.mountainZ)))
        return nil
    end
end
u22.layoutClouds = function(a1)
    --[[
      name: layoutClouds
      line: 1495
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_13 = 0, #a1.cloudParts - 1 do
        a1.cloudXs[n_13 + 1] = (a1.x - 120 + (n_13 * TINY_WINGS_CONFIG_upv_1.cloudSpacingX)) + (((n_13 * 37) % 23) - 11)
        a1:poseCloud(n_13)
    end
end
u22.recycleClouds = function(a1)
    --[[
      name: recycleClouds
      line: 1502
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_14 = 0, #a1.cloudParts - 1 do
        if a1.cloudXs[n_14 + 1] < a1.x - 140 then
            local cloudXs_1 = a1.cloudXs
            local v134 = n_14 + 1
            cloudXs_1[v134] = cloudXs_1[v134] + TINY_WINGS_CONFIG_upv_1.cloudPoolSize * TINY_WINGS_CONFIG_upv_1.cloudSpacingX
            a1:poseCloud(n_14)
        end
    end
end
u22.poseCloud = function(a1, a2)
    --[[
      name: poseCloud
      line: 1511
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v135 = a1.cloudParts[a2 + 1]
    local v136 = ((a2 % 3) - 1) * 1.7
    local v137 = CFrame.new(a1.stage.origin + Vector3.new(a1.cloudXs[a2 + 1], TINY_WINGS_CONFIG_upv_1.cloudBandY + v136, -10))
    local v138 = a1.cloudOverlays[a2]
    if v138 == nil then
        v135.CFrame = v137
        a1.cloudLobes[a2 + 1].CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.cloudXs[a2 + 1] + (((((a2 % 2 ~= 0) and -1) or 1) * v135.Size.X) * 0.3), (TINY_WINGS_CONFIG_upv_1.cloudBandY + v136) + (v135.Size.Y * 0.45), -10.5))
    else
        v138:follow(v137)
        return nil
    end
end
u22.recycleSegments = function(a1)
    --[[
      name: recycleSegments
      line: 1531
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v139 = math.floor(((a1.x + TINY_WINGS_CONFIG_upv_1.cameraLeadX) - TINY_WINGS_CONFIG_upv_1.segmentWindowBehind) / TINY_WINGS_CONFIG_upv_1.segmentLength)
    while a1.windowStartSegment < v139 do
        local windowStartSegment_1 = a1.windowStartSegment
        a1.windowStartSegment = a1.windowStartSegment + 1
        a1:poseSegment(windowStartSegment_1 + TINY_WINGS_CONFIG_upv_1.segmentPoolSize)
    end
end
u22.layoutSegmentWindow = function(a1)
    --[[
      name: layoutSegmentWindow
      line: 1539
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.windowStartSegment = math.floor(((a1.x + TINY_WINGS_CONFIG_upv_1.cameraLeadX) - TINY_WINGS_CONFIG_upv_1.segmentWindowBehind) / TINY_WINGS_CONFIG_upv_1.segmentLength)
    for n_15 = 0, TINY_WINGS_CONFIG_upv_1.segmentPoolSize - 1 do
        a1:poseSegment(a1.windowStartSegment + n_15)
    end
end
u22.poseSegment = function(a1, a2)
    --[[
      name: poseSegment
      line: 1545
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        WATER_SURFACE_COLOR_upv_1 (copy, index: 2)
        WATER_DEEP_COLOR_upv_1 (copy, index: 3)
        paletteForIsland_upv_1 (copy, index: 4)
        u11 (copy, index: 5)
    ]]
    local v140 = ((a2 % TINY_WINGS_CONFIG_upv_1.segmentPoolSize) + TINY_WINGS_CONFIG_upv_1.segmentPoolSize) % TINY_WINGS_CONFIG_upv_1.segmentPoolSize
    local v141 = a2 * TINY_WINGS_CONFIG_upv_1.segmentLength
    local v142 = v141 + TINY_WINGS_CONFIG_upv_1.segmentLength
    a1.terrain:ensureCoverage(v142 + 1)
    local origin_6 = a1.stage.origin
    local v143 = v141 + TINY_WINGS_CONFIG_upv_1.segmentLength / 2
    local v144 = a1.crustTiles[v140 + 1]
    local v145 = a1.fillTiles[v140 + 1]
    if a1.terrain:isGapAt(v143) then
        v144:pose(true, CFrame.new(origin_6 + Vector3.new(v143, TINY_WINGS_CONFIG_upv_1.waterSurfaceY - 0.6, 0)), Vector3.new(TINY_WINGS_CONFIG_upv_1.segmentLength + 0.5, 1.2, 6), WATER_SURFACE_COLOR_upv_1, Enum.Material.Plastic, 0.25)
        local v146 = math.max((TINY_WINGS_CONFIG_upv_1.waterSurfaceY - 1) - TINY_WINGS_CONFIG_upv_1.fillBaseY, 0.5)
        v145:pose(true, CFrame.new(origin_6 + Vector3.new(v143, ((TINY_WINGS_CONFIG_upv_1.waterSurfaceY - 1) + TINY_WINGS_CONFIG_upv_1.fillBaseY) / 2, -0.3)), Vector3.new(TINY_WINGS_CONFIG_upv_1.segmentLength, v146, 5.5), WATER_DEEP_COLOR_upv_1, Enum.Material.SmoothPlastic, 0)
        return nil
    else
        local v147 = paletteForIsland_upv_1(a1.terrain:islandIndexAt(v143))
        local v148 = a1.terrain:heightAt(v141)
        local v149 = a1.terrain:heightAt(v142)
        local v150 = math.atan2(v149 - v148, TINY_WINGS_CONFIG_upv_1.segmentLength)
        local v151 = math.sqrt((TINY_WINGS_CONFIG_upv_1.segmentLength * TINY_WINGS_CONFIG_upv_1.segmentLength) + ((v149 - v148) * (v149 - v148)))
        local v152 = false
        local v153 = CFrame.new(origin_6 + Vector3.new(v143, ((v148 + v149) / 2) - (math.cos(v150) * 1.4), 0)) * CFrame.Angles(0, 0, v150)
        local v154 = Vector3.new(v151 + 0.5, 2.8, 6)
        local v155
        if a2 % 2 ~= 0 then
            v155 = v147.crustB
        else
            v155 = v147.crustA
        end
        v144:pose(v152, v153, v154, v155, Enum.Material.Plastic, 0)
        local v156 = a1.terrain:heightAt(v143) - 1
        v145:pose(false, CFrame.new(origin_6 + Vector3.new(v143, (v156 + TINY_WINGS_CONFIG_upv_1.fillBaseY) / 2, -0.3)), Vector3.new(TINY_WINGS_CONFIG_upv_1.segmentLength, math.max(v156 - TINY_WINGS_CONFIG_upv_1.fillBaseY, 0.5), 5.5), u11:Lerp(v147.fill, 0.15), Enum.Material.DiamondPlate, 0)
    end
end
u22.birdPosition = function(a1)
    --[[
      name: birdPosition
      line: 1580
    ]]
    return a1.stage.origin + Vector3.new(a1.x, a1.y, 0)
end
u22.momentumSpeed = function(a1)
    --[[
      name: momentumSpeed
      line: 1585
    ]]
    if a1.grounded then
        return a1.speed
    end
    return (math.sqrt((a1.velocityX * a1.velocityX) + (a1.velocityY * a1.velocityY)))
end
u22.parkBird = function(a1)
    --[[
      name: parkBird
      line: 1591
    ]]
    a1.bird.Anchored = true
    a1.bird.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    a1.bird.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    a1.trail:Clear()
end
u22.reportTotal = function(a1)
    --[[
      name: reportTotal
      line: 1597
    ]]
    local v157 = a1.distance:current() + a1.bonusScore
    if v157 ~= a1.lastReported then
        a1.lastReported = v157
        a1.context.reportScore(v157)
    else
        return nil
    end
end
u22.splash = function(a1)
    --[[
      name: splash
      line: 1605
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        a1:endTutorial()
        a1.holding = false
        a1.momentumAudio:stop()
        a1.splashReviveX = a1.terrain:gapEndAfter(a1.x) + TINY_WINGS_CONFIG_upv_1.splashReviveOffset
        a1.context.audio.play("splat", {})
        a1.popups:show(a1:birdPosition() + Vector3.new(0, 5, 2), "SPLASH!", u17, 1.1)
        a1.stage.shake(0.7)
        a1.bird.Anchored = false
        a1.bird.AssemblyLinearVelocity = Vector3.new(a1.velocityX * 0.2, -6, 0)
        a1.bird.AssemblyAngularVelocity = Vector3.new(0, 0, -6)
        task.delay(
            2.5,
            function()
                --[[
                  line: 1631
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.bird.Anchored = true
            end
        )
        local u24 = a1.distance:current() + a1.bonusScore
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            TINY_WINGS_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1636
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    u24 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(u24)
            end
        )
    end
end
u22.beginSleep = function(a1)
    --[[
      name: beginSleep
      line: 1642
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:endTutorial()
        a1.sleeping = true
        a1.sleepPhase = "slowing"
        a1.sleepElapsed = 0
        a1.breathPhase = 0
        a1.breathCount = 0
        a1.settleDip = 0
        a1.runEnded = false
        a1:setRunning(false)
        a1.sunProgress = 1
        a1.holding = false
        a1.trail.Enabled = false
        if a1.grounded then
            local v158 = math.atan(a1.terrain:slopeAt(a1.x))
            a1.velocityX = a1.speed * math.cos(v158)
            a1.velocityY = a1.speed * math.sin(v158)
        end
        a1.sleepOnWater = a1.terrain:isGapAt(a1.x)
        a1.context.audio.play("birdSnore", {volume = TINY_WINGS_CONFIG_upv_1.sleep.snoreVolume})
        a1.popups:show(a1:birdPosition() + Vector3.new(0, 5, 2), "NIGHTFALL", u16, 1.1)
        a1.stage.shake(0.25)
        local u25 = a1.distance:current() + a1.bonusScore
        local roundToken_upv_2 = a1.roundToken
        task.delay(
            TINY_WINGS_CONFIG_upv_1.sleep.endRunDelaySeconds,
            function()
                --[[
                  line: 1689
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_2 (copy, index: 2)
                    u25 (copy, index: 3)
                ]]
                if a1.roundToken == roundToken_upv_2 then
                    a1.runEnded = true
                    a1.context.endRun(u25)
                else
                    return nil
                end
            end
        )
    end
end
u22.updateSleep = function(a1, a2)
    --[[
      name: updateSleep
      line: 1697
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local sleep_1 = TINY_WINGS_CONFIG_upv_1.sleep
    a1.sleepElapsed = a1.sleepElapsed + a2
    if not (a1.sleepOnWater) and a1.terrain:isGapAt(a1.x) then
        a1.sleepOnWater = true
    end
    local v159
    if a1.sleepOnWater then
        v159 = sleep_1.waterDragRate
    else
        v159 = sleep_1.dragRate
    end
    local v160 = math.exp(-v159 * a2)
    a1.velocityX = a1.velocityX * v160
    a1.x = a1.x + (a1.velocityX * a2)
    local v161
    if a1.sleepOnWater then
        v161 = TINY_WINGS_CONFIG_upv_1.waterSurfaceY
    else
        v161 = a1.terrain:heightAt(a1.x)
    end
    if a1.sleepPhase ~= "slowing" then
        a1.y = v161
        if a1.sleepOnWater then
            a1.x = a1.x + (sleep_1.waterDriftSpeedX * a2)
        end
    else
        if a1.velocityY > 0 then
            a1.velocityY = a1.velocityY * v160
        end
        a1.velocityY = math.max(a1.velocityY + ((((sleep_1.fallHurryAfterSeconds <= a1.sleepElapsed) and (sleep_1.gravity + sleep_1.fallHurryGravity)) or (sleep_1.gravity)) * a2), sleep_1.fallSpeedMax)
        a1.y = a1.y + (a1.velocityY * a2)
        if a1.y <= v161 then
            a1.y = v161
            a1.velocityY = 0
            if math.abs(a1.velocityX) <= sleep_1.settleSpeed then
                a1:settleAsleep()
            end
        end
    end
    a1.birdRig:setLidTarget(((sleep_1.eyeShutSeconds <= a1.sleepElapsed) and 1) or (((sleep_1.eyeDroopSeconds > a1.sleepElapsed) and 0) or (sleep_1.eyeDroopBlend)))
    a1:poseSleepingBird(a2)
    a1.terrain:ensureCoverage(a1.x + 180)
    a1:recycleSegments()
    a1.momentumAudio:update(a2, false, 0, false)
    a1:updateCameraAndSky(a2)
end
u22.settleAsleep = function(a1)
    --[[
      name: settleAsleep
      line: 1746
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        paletteForIsland_upv_1 (copy, index: 2)
    ]]
    local sleep_2 = TINY_WINGS_CONFIG_upv_1.sleep
    a1.sleepPhase = "asleep"
    a1.grounded = true
    a1.velocityX = 0
    a1.velocityY = 0
    a1.settleDip = sleep_2.settleDipStuds
    a1.breathPhase = 5.15221195188726
    if a1.sleepOnWater then
        a1.context.audio.play("splash", {})
    else
        a1.context.audio.play("thud", {})
        a1.sleepPuffAnchor.CFrame = CFrame.new(a1:birdPosition())
        a1.sleepPuff.Color = ColorSequence.new(paletteForIsland_upv_1(a1.terrain:islandIndexAt(a1.x)).crustA)
        a1.sleepPuff:Emit(sleep_2.landingPuffCount)
    end
    a1.stage.shake(sleep_2.settleShake)
end
u22.poseSleepingBird = function(a1, a2)
    --[[
      name: poseSleepingBird
      line: 1773
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local sleep_3 = TINY_WINGS_CONFIG_upv_1.sleep
    local v162 = 0
    local v163
    if a1.sleepPhase ~= "asleep" then
        v163 = sleep_3.fallTilt + math.sin(a1.sleepElapsed * sleep_3.fallSwayRate) * sleep_3.fallSwayAmplitude
    else
        a1.breathPhase = a1.breathPhase + (((a2 * math.pi) * 2) / sleep_3.breathSeconds)
        if a1.breathPhase >= math.tau then
            a1.breathPhase = a1.breathPhase - math.tau
            a1:emitBreath()
        end
        local v164 = math.sin(a1.breathPhase)
        a1.settleDip = a1.settleDip * math.exp(-sleep_3.settleSpringDecay * a2)
        v162 = v164 * sleep_3.breathBobStuds - a1.settleDip * math.cos(a1.sleepElapsed * sleep_3.settleSpringRate)
        v163 = math.atan(a1.terrain:slopeAt(a1.x))
        if a1.sleepOnWater then
            v162 = v162 + math.sin(a1.sleepElapsed * sleep_3.waterBobRate) * sleep_3.waterBobStuds
            v163 = math.sin(a1.sleepElapsed * sleep_3.waterRockRate) * sleep_3.waterRockAmplitude
        end
    end
    a1.birdTilt = a1.birdTilt + ((v163 - a1.birdTilt) * math.min(a2 * sleep_3.tiltEaseRate, 1))
    a1.bird.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.x, a1.y + v162, 0) + Vector3.new(0, 1.100000023841858, 0)) * CFrame.Angles(0, 0, a1.birdTilt)
    a1.birdRig:setBreathPhase(a1.breathPhase)
    a1.birdRig:pose(a1.bird.CFrame, a2, "sleep")
    local birdOverlay_2 = a1.birdOverlay
    if birdOverlay_2 == nil then
        return
    end
    birdOverlay_2:follow(a1.bird.CFrame)
end
u22.emitBreath = function(a1)
    --[[
      name: emitBreath
      line: 1813
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        u18 (copy, index: 4)
    ]]
    local sleep_4 = TINY_WINGS_CONFIG_upv_1.sleep
    local v165 = a1.breathCount % #tbl_upv_1
    a1.breathCount = a1.breathCount + 1
    a1.popups:show(a1:birdPosition() + Vector3.new(1.2 + (v165 * sleep_4.zzzDriftX), 2.6 + (v165 * sleep_4.zzzRiseStep), 2), tbl_upv_1[v165 + 1], u18, tbl_upv_2[v165 + 1], sleep_4.zzzLifeSeconds)
    if a1.runEnded then
        return nil
    else
        local play_1 = a1.context.audio.play
        local tbl_15 = {}
        local v166
        if a1.breathCount > 1 then
            v166 = sleep_4.snoreVolumeQuiet
        else
            v166 = sleep_4.snoreVolume
        end
        tbl_15.volume = v166
        play_1("birdSnore", tbl_15)
    end
end
u22.clearSleepBeat = function(a1)
    --[[
      name: clearSleepBeat
      line: 1836
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.sleeping = false
    a1.sleepPhase = "slowing"
    a1.sleepElapsed = 0
    a1.sleepOnWater = false
    a1.breathPhase = 0
    a1.breathCount = 0
    a1.settleDip = 0
    a1.runEnded = false
    a1.birdRig:reset()
    a1.trail.Enabled = true
    a1.sleepPuffAnchor.CFrame = u1
end
local tbl_16 = {}
tbl_16.TinyWingsGame = u22
return tbl_16