-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local HeartPipRow_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "heart-pips").HeartPipRow
local ObjectPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "object-pool").ObjectPool
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local TOWER_BUILDER_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").TOWER_BUILDER_STAGE_LIGHTING
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local currentScoreBandBottomPx_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "score-band").currentScoreBandBottomPx
local currentViewportSize_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-px").currentViewportSize
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v3 = RuntimeLib_1.import(script, script.Parent, "tower-builder-assets")
local AuthoredCraneVisual_upv_1 = v3.AuthoredCraneVisual
local prepareAuthoredTile_upv_1 = v3.prepareAuthoredTile
local TowerBuilderAssets_upv_1 = v3.TowerBuilderAssets
local TowerBuilderBackdrop_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-backdrop").TowerBuilderBackdrop
local TOWER_BUILDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local v4 = RuntimeLib_1.import(script, script.Parent, "tower-builder-drop")
local flightOffsetX_upv_1 = v4.flightOffsetX
local ropeAngularVelocity_upv_1 = v4.ropeAngularVelocity
local solveDrop_upv_1 = v4.solveDrop
local swayAmplitudeFor_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-sway").swayAmplitudeFor
local v5 = RuntimeLib_1.import(script, script.Parent, "tower-builder-residents")
local ResidentPool_upv_1 = v5.ResidentPool
local WINDOW_DARK_upv_1 = v5.WINDOW_DARK
local windowOffsetCFrames_upv_1 = v5.windowOffsetCFrames
local WINDOW_SIZE_upv_1 = v5.WINDOW_SIZE
local WindowStrip_upv_1 = v5.WindowStrip
local TileStrip_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-tiles").TileStrip
local u1 = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.blockWidth, TOWER_BUILDER_CONFIG_upv_1.blockHeight, TOWER_BUILDER_CONFIG_upv_1.blockDepth)
local u2 = Color3.fromRGB(96, 150, 216)
local u3 = Color3.fromRGB(86, 136, 200)
local u4 = Color3.fromRGB(72, 110, 162)
local u5 = Color3.fromRGB(255, 140, 44)
local u6 = Color3.fromRGB(209, 114, 5)
local u7 = Color3.fromRGB(58, 62, 74)
local u8 = Color3.fromRGB(126, 130, 140)
local u9 = Color3.fromRGB(60, 64, 74)
local u10 = Color3.fromRGB(54, 58, 70)
local u11 = Color3.fromRGB(245, 245, 255)
local u12 = Color3.fromRGB(255, 216, 102)
local u13 = Color3.fromRGB(255, 150, 80)
local u14 = Color3.fromRGB(255, 90, 100)
local u15 = TweenInfo.new(TOWER_BUILDER_CONFIG_upv_1.settleSeconds, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u16 = TOWER_BUILDER_CONFIG_upv_1.ropeLength - (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2) - 0.35
local u17 = Color3.fromRGB(255, 196, 72)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 135
    ]]
    return "TowerBuilderGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u19 = setmetatable(tbl_2, tbl_3)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 141
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u19)
    return v6:constructor(...) or v6
end
u19.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 145
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 3)
        windowOffsetCFrames_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.simTime = 0
    a1.swingPhase = 0
    a1.ropeAngle = 0
    a1.renderPrevRopeAngle = 0
    a1.swingCosPositive = true
    a1.pivotYGame = 0
    a1.renderPrevPivotY = 0
    a1.hookTimer = 0
    a1.falling = false
    a1.fallTime = 0
    a1.renderPrevFallTime = 0
    a1.fallDuration = 0
    a1.fallStartX = 0
    a1.fallStartY = 0
    a1.fallEndX = 0
    a1.fallEndY = 0
    a1.fallVelocityX = 0
    a1.fallVelocityY = 0
    a1.fallStartAngle = 0
    a1.fallStartSpin = 0
    a1.swayPhase = 0
    a1.renderPrevSwayPhase = 0
    a1.swayAmplitudeCurrent = 0
    a1.windOffsetX = 0
    a1.windOffsetY = 0
    a1.logicalBlocks = {}
    a1.floors = 0
    a1.wavinessSum = 0
    a1.population = 0
    a1.misses = 0
    a1.multiplier = 0
    a1.meterTimer = 0
    a1.bestMultiplier = 0
    a1.perfectCount = 0
    a1.dropQueued = false
    a1.dead = false
    a1.roundToken = 0
    a1.cameraFocusY = 0
    a1.cableLengthVisual = u16
    a1.swayPoseActive = false
    a1.deathTime = 0
    a1.deathFocusStartY = 0
    a1.deathFocusTargetY = 0
    a1.zSign = 1
    a1.craneMastWorldX = TOWER_BUILDER_CONFIG_upv_1.craneMastScreenX
    a1.jibOffset = Vector3.new(0, 1.7000000476837158, -1)
    a1.mastOffset = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.craneMastScreenX, 9.5, -1)
    a1.hangingWindowOffsets = windowOffsetCFrames_upv_1(1)
    a1.towerParts = {}
    a1.hangingWindows = {}
    a1.livesIcons = {}
    a1.livesRowHalfHeight = 0.699999988079071
    a1.livesRowDrop = 0
    a1.livesRowViewport = Vector2.zero
    a1.cosmeticRandom = Random.new()
    a1.replicaParts = {}
    a1.replicaOffsetX = 0
    a1.replicaStyledFloors = -1
    a1.replicaWindowsLit = false
    a1.replicaCount = 0
end
u19.buildScene = function(a1)
    --[[
      name: buildScene
      line: 208
      upvalues:
        TowerBuilderAssets_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        windowOffsetCFrames_upv_1 (copy, index: 3)
        prepareAuthoredTile_upv_1 (copy, index: 4)
        TowerBuilderBackdrop_upv_1 (copy, index: 5)
        TileStrip_upv_1 (copy, index: 6)
        WindowStrip_upv_1 (copy, index: 7)
        makeSmoothPart_upv_1 (copy, index: 8)
        WINDOW_SIZE_upv_1 (copy, index: 9)
        WINDOW_DARK_upv_1 (copy, index: 10)
        u5 (copy, index: 11)
        u7 (copy, index: 12)
        u16 (copy, index: 13)
        u8 (copy, index: 14)
        AuthoredCraneVisual_upv_1 (copy, index: 15)
        u6 (copy, index: 16)
        ObjectPool_upv_1 (copy, index: 17)
        ResidentPool_upv_1 (copy, index: 18)
        PopupTextPool_upv_1 (copy, index: 19)
        HeartPipRow_upv_1 (copy, index: 20)
        u9 (copy, index: 21)
        u17 (copy, index: 22)
        u10 (copy, index: 23)
        u12 (copy, index: 24)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 25)
    ]]
    local container_upv_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.parkedCFrame = CFrame.new(origin_1 + Vector3.new(0, -560, 0))
    a1.assets = TowerBuilderAssets_upv_1.new()
    local v7
    if TOWER_BUILDER_CONFIG_upv_1.useAuthoredBackdrop then
        v7 = a1.assets.details
    else
        v7 = nil
    end
    local v8
    if v7 == nil then
        v8 = 1
    else
        v8 = -1
    end
    a1.zSign = v8
    a1.stage.setCameraZSign(a1.zSign)
    a1.craneMastWorldX = TOWER_BUILDER_CONFIG_upv_1.craneMastScreenX * a1.zSign
    a1.jibOffset = Vector3.new(0, 1.7, -a1.zSign)
    a1.mastOffset = Vector3.new(a1.craneMastWorldX, 9.5, -a1.zSign)
    a1.hangingWindowOffsets = windowOffsetCFrames_upv_1(a1.zSign)
    if TOWER_BUILDER_CONFIG_upv_1.useAuthoredTile then
        v8 = prepareAuthoredTile_upv_1(a1.assets.tile, a1.zSign)
    else
        v8 = nil
    end
    a1.tile = v8
    v8 = TowerBuilderBackdrop_upv_1.new
    local tbl_4 = {}
    tbl_4.details = v7
    tbl_4.cloudTemplates = not (TOWER_BUILDER_CONFIG_upv_1.useAuthoredClouds) or #a1.assets.clouds == 0 or a1.assets.clouds
    tbl_4.skyFade = TOWER_BUILDER_CONFIG_upv_1.useAuthoredLighting and (a1.assets.lighting ~= nil)
    tbl_4.zSign = a1.zSign
    a1.backdrop = v8(container_upv_1, origin_1, tbl_4)
    v8 = a1.tile
    for _ = 0, TOWER_BUILDER_CONFIG_upv_1.visibleTower - 1 do
        table.insert(a1.towerParts, (a1:blockDriver(container_upv_1)))
    end
    if v8 == nil then
        a1.windows = WindowStrip_upv_1.new(container_upv_1, origin_1, TOWER_BUILDER_CONFIG_upv_1.visibleTower, a1.zSign)
    else
        local v9
        v9 = TileStrip_upv_1.new(v8, container_upv_1, origin_1, TOWER_BUILDER_CONFIG_upv_1.visibleTower)
        a1.towerTiles = v9
        a1.windows = v9
    end
    a1.hangingBlock = a1:blockDriver(container_upv_1)
    if v8 == nil then
        for _ = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
            local v10 = makeSmoothPart_upv_1(container_upv_1)
            v10.Size = WINDOW_SIZE_upv_1
            v10.Color = WINDOW_DARK_upv_1
            table.insert(a1.hangingWindows, v10)
        end
    else
        a1.hangingTile = TileStrip_upv_1.new(v8, container_upv_1, origin_1, 1)
        a1.hangingTile:assign(0, a1.parkedCFrame, false)
    end
    local v11, v9
    if v8 == nil then
        a1, v9 = v11, a1:studdedPart(container_upv_1)
    else
        v9 = makeSmoothPart_upv_1(container_upv_1)
        a1 = v11
    end
    a1.lowerTowerSlab = v9
    a1.lowerTowerSlab.Size = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.blockWidth, 1000, TOWER_BUILDER_CONFIG_upv_1.blockDepth)
    a1.lowerTowerSlab.Color = a1:slabShade()
    a1.lowerTowerSlab.CFrame = a1.parkedCFrame
    a1.jibBeam = a1:studdedPart(container_upv_1)
    a1.jibBeam.Size = Vector3.new(30, 1, 1)
    a1.jibBeam.Color = u5
    a1.mast = a1:studdedPart(container_upv_1)
    a1.mast.Size = Vector3.new(1, 18, 1)
    a1.mast.Color = u5
    a1.trolley = makeSmoothPart_upv_1(container_upv_1)
    a1.trolley.Size = Vector3.new(1.7999999523162842, 1.100000023841858, 1.399999976158142)
    a1.trolley.Color = u7
    a1.cable = makeSmoothPart_upv_1(container_upv_1)
    a1.cable.Size = Vector3.new(0.16, u16, 0.16)
    a1.cable.Color = u8
    a1.hook = makeSmoothPart_upv_1(container_upv_1)
    a1.hook.Size = Vector3.new(0.6000000238418579, 0.699999988079071, 0.6000000238418579)
    a1.hook.Color = u7
    if TOWER_BUILDER_CONFIG_upv_1.useAuthoredCrane and a1.assets.crane ~= nil then
        a1.craneSkin = AuthoredCraneVisual_upv_1.new(a1.assets.crane, container_upv_1, a1.craneMastWorldX, -a1.zSign)
        a1.jibBeam.Transparency = 1
        a1.mast.Color = u6
        a1.hook.Color = u6
        a1.cable.Color = u6
    end
    a1.debris = ObjectPool_upv_1.new(
        function()
            --[[
              line: 298
              upvalues:
                a1 (copy, index: 1)
                container_upv_1 (copy, index: 2)
            ]]
            return a1:debrisPart(container_upv_1)
        end,
        function(a2)
            --[[
              line: 300
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2.Anchored = true
            a2.CFrame = a1.parkedCFrame
        end,
        TOWER_BUILDER_CONFIG_upv_1.debrisPoolSize
    )
    a1.residents = ResidentPool_upv_1.new(container_upv_1, origin_1, TOWER_BUILDER_CONFIG_upv_1.residentPoolSize, a1.zSign)
    a1.popups = PopupTextPool_upv_1.new(container_upv_1)
    a1.heartRow = HeartPipRow_upv_1:tryCreate(container_upv_1, {count = TOWER_BUILDER_CONFIG_upv_1.lives, spentColor = u9})
    local heartRow_1 = a1.heartRow
    if heartRow_1 == nil then
        for _ = 0, TOWER_BUILDER_CONFIG_upv_1.lives - 1 do
            local v12 = a1:studdedPart(container_upv_1)
            v12.Size = Vector3.new(2.4000000953674316, 1.399999976158142, 0.6000000238418579)
            v12.Color = u17
            table.insert(a1.livesIcons, v12)
        end
    else
        a1.livesRowHalfHeight = heartRow_1.heightStuds / 2
    end
    a1.meterFrame = makeSmoothPart_upv_1(container_upv_1)
    a1.meterFrame.Size = Vector3.new(0.8999999761581421, 6.5, 0.5)
    a1.meterFrame.Color = u10
    a1.meterFill = makeSmoothPart_upv_1(container_upv_1)
    a1.meterFill.Material = Enum.Material.Neon
    a1.meterFill.Color = u12
    a1.perfectAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.perfectAnchor.Transparency = 1
    a1.perfectAnchor.Size = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.blockWidth, 0.4, 0.4)
    local v13 = Instance.new("ParticleEmitter")
    v13.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v13.Rate = 0
    v13.Lifetime = NumberRange.new(0.3, 0.6)
    v13.Speed = NumberRange.new(8, 16)
    v13.SpreadAngle = Vector2.new(70, 70)
    v13.Size = NumberSequence.new(0.45)
    v13.LightEmission = 1
    v13.Color = ColorSequence.new(u12)
    v13.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.05), NumberSequenceKeypoint.new(1, 1)})
    v13.Parent = a1.perfectAnchor
    a1.perfectBurst = v13
    a1.stage.setFrameWidthFloor(TOWER_BUILDER_CONFIG_upv_1.frameWidthFloor)
    a1:applyAuthoredLighting()
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 349
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
end
u19.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 353
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        readLightingFolderProfile_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        TOWER_BUILDER_STAGE_LIGHTING_upv_1 (copy, index: 4)
    ]]
    if TOWER_BUILDER_CONFIG_upv_1.useAuthoredLighting and a1.assets.lighting ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(a1.assets.lighting, tbl_upv_1, TOWER_BUILDER_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
local function u18(a1, a2)
    --[[
      name: apartmentPart
      line: 359
      upvalues:
        u18 (ref, index: 1)
    ]]
    return a1:withDepthFacing(u18(a2))
end
u19.apartmentPart = u18
u19.blockDriver = function(a1, a2)
    --[[
      name: blockDriver
      line: 362
    ]]
    local v14 = a1:apartmentPart(a2)
    if a1.tile ~= nil then
        v14.Transparency = 1
    end
    return v14
end
u19.debrisPart = function(a1, a2)
    --[[
      name: debrisPart
      line: 369
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v15
    if a1.tile == nil then
        v15 = a1:apartmentPart(a2)
    else
        v15 = makeSmoothPart_upv_1(a2)
    end
    v15.Size = u1
    return v15
end
u19.blockShade = function(a1, a2)
    --[[
      name: blockShade
      line: 374
      upvalues:
        u3 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local tile_1 = a1.tile
    if tile_1 == nil then
        if a2 % 2 ~= 0 then
            return u2
        end
        return u3
    end
    return tile_1.bodyColor
end
u19.slabShade = function(a1)
    --[[
      name: slabShade
      line: 381
      upvalues:
        u4 (copy, index: 1)
    ]]
    local tile_2 = a1.tile
    if tile_2 ~= nil then
        return tile_2.bodyColor:Lerp(Color3.new(0, 0, 0), 0.25)
    end
    return u4
end
u19.studdedPart = function(a1, a2)
    --[[
      name: studdedPart
      line: 388
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    return a1:withDepthFacing(makeStagePart_upv_1(a2))
end
u19.withDepthFacing = function(a1, a2)
    --[[
      name: withDepthFacing
      line: 391
    ]]
    if a1.zSign == -1 then
        a2.BackSurface = Enum.SurfaceType.Weld
        a2.FrontSurface = Enum.SurfaceType.Studs
    end
    return a2
end
u19.resetRound = function(a1)
    --[[
      name: resetRound
      line: 398
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    a1.simTime = 0
    a1.swingPhase = 0
    a1.ropeAngle = 0
    a1.renderPrevRopeAngle = 0
    a1.swingCosPositive = true
    a1.swayPhase = 0
    a1.renderPrevSwayPhase = 0
    a1.swayAmplitudeCurrent = 0
    a1.swayPoseActive = false
    a1.hookTimer = 0
    a1.falling = false
    a1.fallTime = 0
    a1.renderPrevFallTime = 0
    a1.fallDuration = 0
    a1.fallVelocityX = 0
    a1.fallVelocityY = 0
    table.clear(a1.logicalBlocks)
    a1.floors = 0
    a1.wavinessSum = 0
    a1.population = 0
    a1.misses = 0
    a1.multiplier = 0
    a1.meterTimer = 0
    a1.bestMultiplier = 0
    a1.perfectCount = 0
    a1.dropQueued = false
    a1.dead = false
    a1.deathTime = 0
    a1.roundToken = a1.roundToken + 1
    local v16 = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.windOffsetX = v16:NextNumber(0.37, 1024.37)
    a1.windOffsetY = v16:NextNumber(0.37, 1024.37)
    a1.pivotYGame = a1:pivotTargetY()
    a1.renderPrevPivotY = a1.pivotYGame
    a1.cameraFocusY = a1.pivotYGame - TOWER_BUILDER_CONFIG_upv_1.frameCenterBelowPivot
    a1.cableLengthVisual = u16
    for _, value_1 in a1.towerParts do
        value_1.CFrame = a1.parkedCFrame
    end
    a1.windows:parkAll()
    a1.residents:parkAll()
    a1.popups:hideAll()
    a1.lowerTowerSlab.CFrame = a1.parkedCFrame
    a1.backdrop:stepGradient(0)
    a1:updateLivesIcons()
    a1.context.reportScore(0)
end
u19.captureRound = function(a1)
    --[[
      name: captureRound
      line: 448
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if not (a1.dead) and not (a1.falling) then
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 452
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a2:int(a1.population):int(a1.floors):int(a1.misses)
                a2:int(a1.multiplier):int(a1.bestMultiplier):int(a1.perfectCount):num(a1.meterTimer)
                a2:num(a1.simTime):num(a1.swingPhase):num(a1.ropeAngle):bool(a1.swingCosPositive)
                a2:num(a1.swayPhase):num(a1.swayAmplitudeCurrent):num(a1.hookTimer)
                a2:num(a1.wavinessSum)
                a2:int(#a1.logicalBlocks)
                for _, value_2 in a1.logicalBlocks do
                    a2:num(value_2.centerX):num(value_2.offsetAbs)
                end
            end
        )
    end
    return nil
end
u19.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 464
      upvalues:
        readResume_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    local v17 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 465
            ]]
            local tbl_5 = {}
            tbl_5.population = a3:int()
            tbl_5.floors = a3:int()
            tbl_5.misses = a3:int()
            tbl_5.multiplier = a3:int()
            tbl_5.bestMultiplier = a3:int()
            tbl_5.perfectCount = a3:int()
            tbl_5.meterTimer = a3:num()
            tbl_5.simTime = a3:num()
            tbl_5.swingPhase = a3:num()
            tbl_5.ropeAngle = a3:num()
            tbl_5.swingCosPositive = a3:bool()
            tbl_5.swayPhase = a3:num()
            tbl_5.swayAmplitudeCurrent = a3:num()
            tbl_5.hookTimer = a3:num()
            tbl_5.wavinessSum = a3:num()
            local v18 = a3:int()
            local tbl_6 = {}
            local v19 = 0
            local v20 = false
            v20, v19 = v20, v19
            while true do
                if v20 then
                    v19 = v19 + 1
                else
                    v20 = true
                end
                if v19 >= v18 then
                    break
                end
                table.insert(tbl_6, {centerX = a3:num(), offsetAbs = a3:num()})
            end
            v19 = table.clone(tbl_5)
            setmetatable(v19, nil)
            v19.blocks = tbl_6
            return v19
        end
    )
    if v17 ~= nil and #v17.blocks ~= 0 and TOWER_BUILDER_CONFIG_upv_1.lives > v17.misses then
        table.clear(a1.logicalBlocks)
        for _, value_3 in v17.blocks do
            table.insert(a1.logicalBlocks, value_3)
        end
        a1.population = a2.score
        a1.floors = v17.floors
        a1.misses = v17.misses
        a1.multiplier = v17.multiplier
        a1.bestMultiplier = v17.bestMultiplier
        a1.perfectCount = v17.perfectCount
        a1.meterTimer = v17.meterTimer
        a1.simTime = v17.simTime
        a1.swingPhase = v17.swingPhase
        a1.ropeAngle = v17.ropeAngle
        a1.renderPrevRopeAngle = v17.ropeAngle
        a1.swingCosPositive = v17.swingCosPositive
        a1.swayPhase = v17.swayPhase
        a1.renderPrevSwayPhase = v17.swayPhase
        a1.swayAmplitudeCurrent = v17.swayAmplitudeCurrent
        a1.hookTimer = v17.hookTimer
        a1.wavinessSum = v17.wavinessSum
        a1.falling = false
        a1.fallTime = 0
        a1.renderPrevFallTime = 0
        a1.dropQueued = false
        a1.dead = false
        a1.deathTime = 0
        a1.roundToken = a1.roundToken + 1
        a1.pivotYGame = a1:pivotTargetY()
        a1.renderPrevPivotY = a1.pivotYGame
        a1.cameraFocusY = a1.pivotYGame - TOWER_BUILDER_CONFIG_upv_1.frameCenterBelowPivot
        a1.cableLengthVisual = u16
        a1:updateLivesIcons()
        a1.context.reportScore(a1.population)
        return true
    end
    return false
end
u19.revive = function(a1)
    --[[
      name: revive
      line: 552
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.dead = false
    a1.misses = 0
    a1.dropQueued = false
    a1.falling = false
    a1.meterTimer = 0
    a1.multiplier = 0
    a1.hookTimer = TOWER_BUILDER_CONFIG_upv_1.respawnDelaySeconds
    a1.deathTime = 0
    a1.roundToken = a1.roundToken + 1
    a1:updateLivesIcons()
    a1:setRunning(true)
end
u19.snapshot = function(a1)
    --[[
      name: snapshot
      line: 565
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tbl_7 = {}
    local v21 = math.min(a1.floors, TOWER_BUILDER_CONFIG_upv_1.visibleTower)
    table.insert(tbl_7, a1.floors)
    table.insert(tbl_7, v21)
    local v22 = a1.floors - v21 + 1
    local v23 = false
    while true do
        if v23 then
            v22 = v22 + 1
        else
            v23 = true
        end
        if v22 > a1.floors then
            break
        end
        table.insert(tbl_7, a1.logicalBlocks[v22].centerX)
    end
    local tbl_8 = {}
    tbl_8.score = a1.population
    tbl_8.values = tbl_7
    return tbl_8
end
u19.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 594
    ]]
    a1.matchOpponents = a2
    local v24 = a1.stage.getPeerWindowOffsetX()
    if v24 ~= nil and #a1.towerParts ~= 0 then
        if a1.replicaWindows == nil then
            a1:buildReplicaTower()
        end
        a1.replicaOffsetX = v24
        return
    end
    return nil
end
u19.buildReplicaTower = function(a1)
    --[[
      name: buildReplicaTower
      line: 605
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        TileStrip_upv_1 (copy, index: 2)
        WindowStrip_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u4 (copy, index: 5)
    ]]
    local container_2 = a1.stage.container
    local v25
    if TOWER_BUILDER_CONFIG_upv_1.useAuthoredTileForReplica then
        v25 = a1.tile
    else
        v25 = nil
    end
    for _ = 0, TOWER_BUILDER_CONFIG_upv_1.visibleTower - 1 do
        local v26 = a1:apartmentPart(container_2)
        if v25 ~= nil then
            v26.Transparency = 1
        end
        v26.CFrame = a1.parkedCFrame
        table.insert(a1.replicaParts, v26)
    end
    local v27
    if v25 == nil then
        v27 = WindowStrip_upv_1.new(container_2, a1.stage.origin, TOWER_BUILDER_CONFIG_upv_1.visibleTower, a1.zSign)
    else
        v27 = TileStrip_upv_1.new(v25, container_2, a1.stage.origin, TOWER_BUILDER_CONFIG_upv_1.visibleTower)
    end
    for n_1 = 0, TOWER_BUILDER_CONFIG_upv_1.visibleTower - 1 do
        v27:assign(n_1, a1.parkedCFrame, false)
    end
    a1.replicaWindows = v27
    local v28
    if v25 == nil then
        v28 = a1:studdedPart(container_2)
    else
        v28 = makeSmoothPart_upv_1(container_2)
    end
    v28.Size = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.blockWidth, 1000, TOWER_BUILDER_CONFIG_upv_1.blockDepth)
    local v29
    if v25 == nil then
        v29 = u4
    else
        v29 = a1:slabShade()
    end
    v28.Color = v29
    v28.CFrame = a1.parkedCFrame
    a1.replicaSlab = v28
end
u19.poseReplicaTower = function(a1)
    --[[
      name: poseReplicaTower
      line: 633
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local replicaWindows_1 = a1.replicaWindows
    local replicaSlab_1 = a1.replicaSlab
    if replicaWindows_1 == nil then
        return nil
    else
        local v30 = nil
        if replicaSlab_1 ~= nil then
            v30 = a1.matchOpponents
            if v30 ~= nil then
                v30 = v30[1]
                if v30 ~= nil then
                    v30 = v30.snapshot
                end
            end
            local v31, v32, v33, v34 = nil, nil, nil, nil
            if v30 ~= nil then
                v31 = a1.stage.getPeerWindowOffsetX()
                if v31 ~= nil then
                    a1.replicaOffsetX = v31
                end
                local values_1 = v30.values
                v32 = values_1[1]
                if v32 == nil then
                    v32 = 0
                end
                v33 = values_1[2]
                if v33 == nil then
                    v33 = 0
                end
                v34 = math.min(v33, #a1.replicaParts)
                local v35 = nil
                if v34 ~= 0 then
                    local v36 = (a1.cameraFocusY + TOWER_BUILDER_CONFIG_upv_1.frameCenterBelowPivot) - (((TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2) + TOWER_BUILDER_CONFIG_upv_1.ropeLength) + TOWER_BUILDER_CONFIG_upv_1.dropDistance) - TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2
                    if v32 ~= a1.replicaStyledFloors or v34 ~= a1.replicaCount then
                        a1.replicaStyledFloors = v32
                        local v37 = false
                        local v38
                        v38 = v34
                        while true do
                            if v37 then
                                v38 = v38 + 1
                            else
                                v37 = true
                            end
                            if v38 >= a1.replicaCount then
                                break
                            end
                            a1.replicaParts[v38 + 1].CFrame = a1.parkedCFrame
                            replicaWindows_1:release(v38)
                        end
                        a1.replicaCount = v34
                        v37, v38 = false, 0
                        while true do
                            if v37 then
                                v38 = v38 + 1
                            else
                                v37 = true
                            end
                            if v38 >= v34 then
                                break
                            end
                            a1.replicaParts[v38 + 1].Color = a1:blockShade(((v32 - v34) + 1) + v38)
                        end
                        v38 = TOWER_BUILDER_CONFIG_upv_1.spaceStartFloor <= v32
                        if v38 ~= a1.replicaWindowsLit then
                            a1.replicaWindowsLit = v38
                            for v39 = 0, TOWER_BUILDER_CONFIG_upv_1.visibleTower - 1 do
                                replicaWindows_1:assign(v39, a1.parkedCFrame, v38)
                            end
                        end
                    end
                    local origin_2 = a1.stage.origin
                    local v40 = 0
                    local v41 = false
                    local v37
                    v37 = v40
                    local v39 = nil
                    if v41 then
                        v37 = v37 + 1
                    else
                        v41 = true
                    end
                    local v42 = nil
                    while v37 < v34 do
                        v42 = values_1[(v37 + 2) + 1]
                        if v42 ~= nil then
                            v39 = v42
                        else
                            v39 = 0
                        end
                        local v43 = CFrame.new(origin_2 + Vector3.new(v39 + a1.replicaOffsetX, v36 - (((v34 - 1) - v37) * TOWER_BUILDER_CONFIG_upv_1.blockHeight), 0))
                        a1.replicaParts[v37 + 1].CFrame = v43
                        replicaWindows_1:pose(v37, v43)
                        if v41 then
                            v37 = v37 + 1
                        else
                            v41 = true
                        end
                    end
                    v35 = values_1[3]
                    if v35 ~= nil then
                        v37 = v35
                    else
                        v37 = 0
                    end
                    replicaSlab_1.CFrame = CFrame.new(origin_2 + Vector3.new(v37 + a1.replicaOffsetX, ((v36 - ((v34 - 1) * TOWER_BUILDER_CONFIG_upv_1.blockHeight)) - (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2)) - 500, 0))
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
end
u19.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 750
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevRopeAngle = a1.ropeAngle
        a1.renderPrevPivotY = a1.pivotYGame
        a1.renderPrevSwayPhase = a1.swayPhase
        a1.renderPrevFallTime = a1.fallTime
        a1.simTime = a1.simTime + a2
        a1.swingPhase = a1.swingPhase + ((math.tau / a1:currentSwingPeriod()) * a2)
        a1.ropeAngle = TOWER_BUILDER_CONFIG_upv_1.swingAmplitudeRadians * math.sin(a1.swingPhase) + a1:windAngle()
        local v44 = math.cos(a1.swingPhase) >= 0
        if v44 ~= a1.swingCosPositive then
            a1.swingCosPositive = v44
            if not (a1.falling) and a1.hookTimer <= 0 then
                local v45 = 1 + ((TOWER_BUILDER_CONFIG_upv_1.swingPeriodBaseSeconds / a1:currentSwingPeriod()) - 1) * 0.3
                local play_1 = a1.context.audio.play
                local tbl_9 = {}
                tbl_9.pitch = ((v44 and 1.05) or 0.92) * v45
                play_1("craneSweep", tbl_9)
                a1.context.audio.play("craneCreak", {})
            end
        end
        a1.pivotYGame = a1.pivotYGame + ((a1:pivotTargetY() - a1.pivotYGame) * math.min(a2 * TOWER_BUILDER_CONFIG_upv_1.cameraEaseRate, 1))
        a1.swayPhase = a1.swayPhase + ((math.tau / TOWER_BUILDER_CONFIG_upv_1.swayPeriodSeconds) * a2)
        local v46 = a1:swayAmplitudeTarget()
        local v47 = TOWER_BUILDER_CONFIG_upv_1.swayAmplitudeEaseRate * a2
        a1.swayAmplitudeCurrent = a1.swayAmplitudeCurrent + math.clamp(v46 - a1.swayAmplitudeCurrent, -v47, v47)
        if a1.meterTimer > 0 then
            a1.meterTimer = math.max(0, a1.meterTimer - a2)
            if a1.meterTimer == 0 then
                a1.multiplier = 0
            end
        end
        if a1.hookTimer > 0 then
            a1.hookTimer = a1.hookTimer - a2
        end
        if a1.falling then
            a1.fallTime = math.min(a1.fallTime + a2, a1.fallDuration)
            if a1.fallDuration <= a1.fallTime then
                a1:resolveLanding()
            end
            if a1.dead then
                return nil
            end
        end
        if a1.dropQueued then
            a1.dropQueued = false
            if not (a1.falling) and a1.hookTimer <= 0 then
                a1:release()
            end
        end
    end
end
u19.render = function(a1, a2)
    --[[
      name: render
      line: 815
      upvalues:
        lerp_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v48 = lerp_upv_1(a1.renderPrevRopeAngle, a1.ropeAngle, a1.renderAlpha)
    local v49 = lerp_upv_1(a1.renderPrevPivotY, a1.pivotYGame, a1.renderAlpha)
    local v50 = a1.swayAmplitudeCurrent * math.sin(lerp_upv_1(a1.renderPrevSwayPhase, a1.swayPhase, a1.renderAlpha))
    local v51 = ((not (a1.falling)) and -1) or (lerp_upv_1(a1.renderPrevFallTime, a1.fallTime, a1.renderAlpha))
    a1.cameraFocusY = a1.cameraFocusY + (((v49 - TOWER_BUILDER_CONFIG_upv_1.frameCenterBelowPivot) - a1.cameraFocusY) * math.min(a2 * TOWER_BUILDER_CONFIG_upv_1.cameraEaseRate, 1))
    a1.stage.setFrameCenter(Vector2.new(0, a1.cameraFocusY))
    a1:drawScene(v48, v49, v50, v51, a2)
    a1:poseReplicaTower()
    a1.backdrop:update(a1.cameraFocusY, a2)
end
u19.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 828
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        a1.deathTime = a1.deathTime + a2
        a1.swingPhase = a1.swingPhase + ((math.tau / a1:currentSwingPeriod()) * a2)
        a1.swayPhase = a1.swayPhase + ((math.tau / TOWER_BUILDER_CONFIG_upv_1.swayPeriodSeconds) * a2)
        a1.ropeAngle = TOWER_BUILDER_CONFIG_upv_1.swingAmplitudeRadians * math.sin(a1.swingPhase)
        a1.renderPrevRopeAngle = a1.ropeAngle
        a1.renderPrevSwayPhase = a1.swayPhase
        local v52 = math.min(a1.deathTime / TOWER_BUILDER_CONFIG_upv_1.deathCameraSeconds, 1)
        a1.cameraFocusY = a1.deathFocusStartY + ((a1.deathFocusTargetY - a1.deathFocusStartY) * (1 - ((1 - v52) * (1 - v52))))
        a1.stage.setFrameCenter(Vector2.new(0, a1.cameraFocusY))
        a1:drawScene(a1.ropeAngle, a1.pivotYGame, a1.swayAmplitudeCurrent * math.sin(a1.swayPhase), -1, a2)
        a1:poseReplicaTower()
        a1.backdrop:update(a1.cameraFocusY, a2)
    else
        return nil
    end
end
u19.onPress = function(a1)
    --[[
      name: onPress
      line: 847
    ]]
    if (a1.dead) then
        return
    end
    a1.dropQueued = true
end
u19.release = function(a1)
    --[[
      name: release
      line: 852
      upvalues:
        ropeAngularVelocity_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        solveDrop_upv_1 (copy, index: 3)
    ]]
    local ropeAngle_1 = a1.ropeAngle
    local v53 = ropeAngularVelocity_upv_1(a1.swingPhase, a1:currentSwingPeriod())
    a1.fallStartY = a1.pivotYGame - (math.cos(ropeAngle_1) * TOWER_BUILDER_CONFIG_upv_1.ropeLength)
    a1.fallEndY = a1:towerTopSurfaceY() + (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2)
    local v54 = solveDrop_upv_1(ropeAngle_1, v53, a1.fallStartY - a1.fallEndY)
    a1.fallStartX = v54.startX
    a1.fallEndX = v54.landingX
    a1.fallVelocityX = v54.velocityX
    a1.fallVelocityY = v54.velocityY
    a1.fallDuration = v54.durationSeconds
    a1.fallStartAngle = ropeAngle_1
    a1.fallStartSpin = v53 * TOWER_BUILDER_CONFIG_upv_1.flightSpinCarry
    a1.falling = true
    a1.fallTime = 0
    a1.renderPrevFallTime = 0
    a1.hookTimer = TOWER_BUILDER_CONFIG_upv_1.respawnDelaySeconds
    a1.context.audio.play("hookRelease", {})
end
u19.resolveLanding = function(a1)
    --[[
      name: resolveLanding
      line: 876
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        TweenService_upv_1 (copy, index: 3)
        u15 (copy, index: 4)
        u12 (copy, index: 5)
        publishCombo_upv_1 (copy, index: 6)
        u11 (copy, index: 7)
    ]]
    a1.falling = false
    local v55 = ((a1.floors ~= 0) and (a1.swayAmplitudeCurrent * math.sin(a1.swayPhase))) or 0
    local v56 = ((a1.floors == 0) and 0) or (a1.logicalBlocks[a1.floors].centerX)
    local v57 = a1.fallEndX - (v56 + v55)
    local v58 = math.abs(v57) / TOWER_BUILDER_CONFIG_upv_1.blockWidth
    local v59 = nil
    if TOWER_BUILDER_CONFIG_upv_1.stickToleranceFrac >= v58 then
        local v60 = v58 <= TOWER_BUILDER_CONFIG_upv_1.perfectToleranceFrac
        if v60 then
            a1.multiplier = a1.multiplier + 1
            a1.bestMultiplier = math.max(a1.bestMultiplier, a1.multiplier)
            a1.perfectCount = a1.perfectCount + 1
            a1.meterTimer = TOWER_BUILDER_CONFIG_upv_1.comboMeterSeconds
        end
        local v61 = TOWER_BUILDER_CONFIG_upv_1.baseResidentsPerBlock + (((a1.meterTimer <= 0) and 0) or (a1.multiplier * TOWER_BUILDER_CONFIG_upv_1.comboBonusPerLevel))
        a1.population = a1.population + v61
        a1.context.reportScore(a1.population)
        local v62
        if v60 then
            v62 = v56
        else
            v62 = a1.fallEndX - v55
        end
        local v63 = (v60 and 0) or (math.abs(v57))
        table.insert(a1.logicalBlocks, {centerX = v62, offsetAbs = v63})
        a1.wavinessSum = a1.wavinessSum + v63
        a1.floors = a1.floors + 1
        local u20 = a1:ringIndexFor(a1.floors)
        a1:placeFloorVisual(a1.floors, false)
        local v64 = a1.towerParts[u20 + 1]
        v64.Size = Vector3.new(u1.X * 1.05, u1.Y * (1 - TOWER_BUILDER_CONFIG_upv_1.settleSquashFrac), u1.Z * 1.05)
        local tbl_10 = {}
        tbl_10.Size = u1
        TweenService_upv_1:Create(v64, u15, tbl_10):Play()
        v59 = a1.towerTiles
        if v59 ~= nil then
            v59:settle(u20, v64)
        end
        a1:poseSlab()
        a1.backdrop:stepGradient(a1.floors)
        local v65
        if v60 then
            v65 = TOWER_BUILDER_CONFIG_upv_1.residentsShownMax
        else
            local v66 = a1.cosmeticRandom:NextNumber() >= 0.5 and 0 or 1
            v65 = v66 + 1
        end
        a1.residents:flyIn(v64.CFrame, v65)
        if a1.floors == TOWER_BUILDER_CONFIG_upv_1.spaceStartFloor then
            a1:lightUpStandingTower()
        elseif a1:windowsLit() then
            task.delay(
                0.45,
                function()
                    --[[
                      line: 935
                      upvalues:
                        a1 (copy, index: 1)
                        u20 (copy, index: 2)
                    ]]
                    return a1.windows:lightUp(u20)
                end
            )
        end
        a1.context.audio.play("thud", {})
        a1.stage.shake(TOWER_BUILDER_CONFIG_upv_1.landShakeMagnitude)
        a1.context.audio.play("towerScore", {})
        local v67 = v64.Position + Vector3.new(0, TOWER_BUILDER_CONFIG_upv_1.blockHeight + 1.2, 0)
        if v60 then
            a1.context.audio.play("perfect", {pitch = (math.min(a1.multiplier, 8) * 0.08) + 1})
            a1:hitStop(TOWER_BUILDER_CONFIG_upv_1.perfectHitStopSeconds)
            a1.perfectAnchor.CFrame = CFrame.new(v64.Position + Vector3.new(0, TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2, 4 * a1.zSign))
            a1.perfectBurst:Emit(14)
            local popups_1 = a1.popups
            local v68 = ((a1.multiplier <= 1) and "PERFECT!") or (("PERFECT \195\151%*"):format(a1.multiplier))
            popups_1:show(v67, v68, u12, 1.1)
            publishCombo_upv_1({count = a1.multiplier, color = u12, holdSeconds = TOWER_BUILDER_CONFIG_upv_1.comboMeterSeconds})
        else
            local popups_2 = a1.popups
            local v69 = ("+%*"):format(v61)
            popups_2:show(v67, v69, u11, 0.75)
        end
        if a1.floors % TOWER_BUILDER_CONFIG_upv_1.floorMilestoneEvery == 0 then
            a1.popups:show(v67 + Vector3.new(0, 2.200000047683716, 0), ("FLOOR %*"):format(a1.floors), u11, 0.9, 0.8)
            a1.context.audio.play("scorePing", {pitch = math.min(a1.floors / 200, 0.5) + 1})
        end
    else
        a1:onMiss(v57, v58)
        return nil
    end
end
u19.onMiss = function(a1, a2, a3)
    --[[
      name: onMiss
      line: 982
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    a1.misses = a1.misses + 1
    a1.meterTimer = 0
    a1.multiplier = 0
    local v70
    if math.abs(a1.fallVelocityX) <= 0.5 then
        v70 = a2
    else
        v70 = a1.fallVelocityX
    end
    local v71
    if v70 < 0 then
        v71 = -1
    else
        v71 = 1
    end
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(TOWER_BUILDER_CONFIG_upv_1.missShakeMagnitude)
    a1.popups:show(a1.stage.origin + Vector3.new(a1.fallEndX, a1.fallEndY + 2, 0), "MISS!", u14, 1.2)
    local v72 = a1.debris:acquire()
    v72.Size = u1
    v72.Color = a1:blockShade(a1.floors + 1)
    v72.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.fallEndX, a1.fallEndY, 0))
    a1:flingDebris(v72, (a1.fallVelocityX * 0.45) + (v71 * 2), 2.5, -v71 * (4 + a1.cosmeticRandom:NextNumber(0, 3)))
    if a1.floors > 0 and a3 < 1 then
        a1:shearWalk(v71)
    end
    a1:updateLivesIcons()
    if TOWER_BUILDER_CONFIG_upv_1.lives > a1.misses then
        return
    end
    a1:die()
end
u19.shearWalk = function(a1, a2)
    --[[
      name: shearWalk
      line: 1025
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u13 (copy, index: 3)
    ]]
    local v73 = 0
    local v74 = 0
    local v75 = nil
    while v73 < TOWER_BUILDER_CONFIG_upv_1.maxFloorsShearedPerMiss and a1.floors > 1 do
        local v76 = a1.logicalBlocks[a1.floors]
        v74 = v74 + math.abs(v76.centerX - a1.logicalBlocks[a1.floors - 1].centerX)
        if v74 <= TOWER_BUILDER_CONFIG_upv_1.shearOverhangThresholdFrac * TOWER_BUILDER_CONFIG_upv_1.blockWidth then
            break
        else
            local v77 = a1:ringIndexFor(a1.floors)
            local v78 = a1.towerParts[v77 + 1]
            local v79 = v75 or (v78.Position)
            local v80 = a1.debris:acquire()
            v80.Size = u1
            v80.Color = v78.Color
            v80.CFrame = v78.CFrame
            a1:flingDebris(v80, a2 * ((v73 * 2) + 6), 4 - v73, -a2 * (3 + a1.cosmeticRandom:NextNumber(0, 3)))
            v78.CFrame = a1.parkedCFrame
            a1.windows:release(v77)
            a1.wavinessSum = a1.wavinessSum - v76.offsetAbs
            local logicalBlocks_1 = a1.logicalBlocks
            logicalBlocks_1[#logicalBlocks_1] = nil
            a1.floors = a1.floors - 1
            v73 = v73 + 1
            v75 = v79
        end
    end
    if v73 <= 0 then
        return
    end
    a1:refreshTowerVisuals()
    a1:poseSlab()
    a1.backdrop:stepGradient(a1.floors)
    a1.context.audio.play("woodBreak", {})
    if v75 == nil then
        return
    end
    a1.popups:show(v75 + Vector3.new(0, 2.5, 0), ("-%* FLOOR%*"):format(v73, ((v73 <= 1) and "") or "S"), u13, 0.95)
end
u19.flingDebris = function(a1, a2, a3, a4, a5)
    --[[
      name: flingDebris
      line: 1068
    ]]
    a2.Anchored = false
    a2.AssemblyLinearVelocity = Vector3.new(a3, a4, 0)
    a2.AssemblyAngularVelocity = Vector3.new(0, 0, a5)
    task.delay(
        2.4,
        function()
            --[[
              line: 1073
              upvalues:
                a1 (copy, index: 1)
                a2 (copy, index: 2)
            ]]
            return a1.debris:release(a2)
        end
    )
end
u19.die = function(a1)
    --[[
      name: die
      line: 1077
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1.deathTime = 0
    a1.deathFocusStartY = a1.cameraFocusY
    local v81 = a1:towerTopSurfaceY()
    a1.deathFocusTargetY = ((v81 + math.max(v81 - (TOWER_BUILDER_CONFIG_upv_1.visibleTower * TOWER_BUILDER_CONFIG_upv_1.blockHeight), 0)) / 2) + 2
    local population_upv_1 = a1.population
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        TOWER_BUILDER_CONFIG_upv_1.endRunDelaySeconds,
        function()
            --[[
              line: 1087
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_1 (copy, index: 2)
                population_upv_1 (copy, index: 3)
            ]]
            if a1.roundToken == roundToken_upv_1 then
                a1.context.endRun(population_upv_1)
            else
                return nil
            end
        end
    )
end
u19.drawScene = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: drawScene
      line: 1094
      upvalues:
        u16 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        flightOffsetX_upv_1 (copy, index: 3)
    ]]
    local origin_3 = a1.stage.origin
    local v82 = origin_3 + Vector3.new(0, a3, 0)
    local v83 = math.sin(a2)
    local v84 = -math.cos(a2)
    a1.jibBeam.CFrame = CFrame.new(v82 + a1.jibOffset)
    a1.mast.CFrame = CFrame.new(v82 + a1.mastOffset)
    a1.trolley.CFrame = CFrame.new(v82 + Vector3.new(0, 0.550000011920929, 0))
    local craneSkin_1 = a1.craneSkin
    if craneSkin_1 ~= nil then
        craneSkin_1:follow(v82)
    end
    local v85 = not a1.falling and (a1.hookTimer <= 0)
    local v86
    if v85 then
        v86 = u16
    else
        v86 = 4
    end
    a1.cableLengthVisual = a1.cableLengthVisual + ((v86 - a1.cableLengthVisual) * math.min(a6 * 10, 1))
    local v87 = ((a1.craneSkin == nil) and 0) or 1.6
    local v88 = v82 + Vector3.new((v83 * (a1.cableLengthVisual - v87)) / 2, (v84 * (a1.cableLengthVisual - v87)) / 2, 0)
    a1.cable.Size = Vector3.new(0.16, a1.cableLengthVisual + v87, 0.16)
    a1.cable.CFrame = CFrame.new(v88) * CFrame.Angles(0, 0, a2)
    a1.hook.CFrame = CFrame.new(v82 + Vector3.new(v83 * (a1.cableLengthVisual + 0.35), v84 * (a1.cableLengthVisual + 0.35), 0)) * CFrame.Angles(0, 0, a2)
    local v89
    v89 = nil
    if v85 then
        v89 = CFrame.new(v82 + Vector3.new(v83 * TOWER_BUILDER_CONFIG_upv_1.ropeLength, v84 * TOWER_BUILDER_CONFIG_upv_1.ropeLength, 0)) * CFrame.Angles(0, 0, a2)
    elseif a5 >= 0 then
        local v90 = a1.fallStartX + flightOffsetX_upv_1(a1.fallVelocityX, a5)
        local v91 = ((a1.fallDuration <= 0) and 1) or (a5 / a1.fallDuration)
        v89 = CFrame.new(origin_3 + Vector3.new(v90, (a1.fallStartY + (a1.fallVelocityY * a5)) - (((0.5 * TOWER_BUILDER_CONFIG_upv_1.dropGravity) * a5) * a5), 0)) * CFrame.Angles(0, 0, (a1.fallStartAngle + (a1.fallStartSpin * a5)) * (1 - (v91 * v91)))
    end
    if v89 == nil then
        a1.hangingBlock.CFrame = a1.parkedCFrame
        if a1.hangingTile == nil then
            for _, value_4 in a1.hangingWindows do
                value_4.CFrame = a1.parkedCFrame
            end
        else
            a1.hangingTile:pose(0, a1.parkedCFrame)
        end
    else
        a1.hangingBlock.CFrame = v89
        if a1.hangingTile == nil then
            for n_2 = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
                a1.hangingWindows[n_2 + 1].CFrame = v89 * a1.hangingWindowOffsets[n_2 + 1]
            end
        else
            a1.hangingTile:pose(0, v89)
        end
    end
    a1:poseTower(a4)
    local towerTiles_1 = a1.towerTiles
    if towerTiles_1 ~= nil then
        towerTiles_1:updateSettle(a6)
    end
    a1:poseHudWidgets(a3)
end
u19.poseTower = function(a1, a2)
    --[[
      name: poseTower
      line: 1183
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v92 = math.abs(a2) > 0.02
    if not (v92) and not (a1.swayPoseActive) then
        return nil
    end
    a1.swayPoseActive = v92
    if a1.floors ~= 0 then
        local origin_4 = a1.stage.origin
        local v93 = a1:towerTopSurfaceY()
        local swayBendExponent_1 = TOWER_BUILDER_CONFIG_upv_1.swayBendExponent
        local v94 = a1:visibleLowestFloor()
        local v95 = false
        while true do
            if v95 then
                v94 = v94 + 1
            else
                v95 = true
            end
            if v94 > a1.floors then
                break
            end
            local v96 = v94 / a1.floors
            local v97 = math.atan(((a2 * swayBendExponent_1) * (v96 ^ (swayBendExponent_1 - 1))) / v93)
            local v98 = a1.logicalBlocks[v94]
            local v99 = a1:ringIndexFor(v94)
            local v100 = CFrame.new(origin_4 + Vector3.new(v98.centerX + (a2 * (v96 ^ swayBendExponent_1)), (v94 - 0.5) * TOWER_BUILDER_CONFIG_upv_1.blockHeight, 0)) * CFrame.Angles(0, 0, v97)
            a1.towerParts[v99 + 1].CFrame = v100
            a1.windows:pose(v99, v100)
        end
    else
        return nil
    end
end
u19.poseHudWidgets = function(a1, a2)
    --[[
      name: poseHudWidgets
      line: 1221
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v101 = a1.stage.getVisibleHeight()
    local v102 = v101 / 2 / math.tan(math.rad(a1.stage.camera.FieldOfView) / 2)
    local v103 = (v102 - 8) / v102
    local v104 = a1.stage.origin + Vector3.new(0, (a1.cameraFocusY + ((v101 / 2) * v103)) - a1:livesRowDropStuds(v101 * v103), 8 * a1.zSign)
    local heartRow_2 = a1.heartRow
    if heartRow_2 == nil then
        for n_3 = 0, #a1.livesIcons - 1 do
            a1.livesIcons[n_3 + 1].CFrame = CFrame.new(v104.X + (((n_3 - (#a1.livesIcons - 1) * 0.5) * 3) * a1.zSign), v104.Y, v104.Z)
        end
    else
        heartRow_2:layout(v104, 3 * a1.zSign)
    end
    local v105 = a1.meterTimer / TOWER_BUILDER_CONFIG_upv_1.comboMeterSeconds
    if v105 <= 0 then
        a1.meterFrame.CFrame = a1.parkedCFrame
        a1.meterFill.CFrame = a1.parkedCFrame
    else
        local v106 = a2 - 4.5
        a1.meterFrame.CFrame = CFrame.new(a1.stage.origin + Vector3.new(TOWER_BUILDER_CONFIG_upv_1.meterOffsetX * a1.zSign, v106, 6 * a1.zSign))
        local v107 = math.max(6.1 * v105, 0.05)
        a1.meterFill.Size = Vector3.new(0.55, v107, 0.55)
        a1.meterFill.CFrame = CFrame.new(a1.stage.origin + Vector3.new(TOWER_BUILDER_CONFIG_upv_1.meterOffsetX * a1.zSign, (v106 - 3.05) + (v107 / 2), 6.1 * a1.zSign))
    end
end
u19.placeFloorVisual = function(a1, a2, a3)
    --[[
      name: placeFloorVisual
      line: 1263
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v108 = a1:ringIndexFor(a2)
    local v109 = a1.towerParts[v108 + 1]
    v109.Size = u1
    v109.Color = a1:blockShade(a2)
    local v110 = a1:restCFrameFor(a2)
    v109.CFrame = v110
    a1.windows:assign(v108, v110, a3)
end
u19.windowsLit = function(a1)
    --[[
      name: windowsLit
      line: 1272
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return TOWER_BUILDER_CONFIG_upv_1.spaceStartFloor <= a1.floors
end
u19.lightUpStandingTower = function(a1)
    --[[
      name: lightUpStandingTower
      line: 1275
    ]]
    local v111 = a1:visibleLowestFloor()
    local v112 = false
    local v113
    v113 = v111
    while true do
        if v112 then
            v113 = v113 + 1
        else
            v112 = true
        end
        if v113 > a1.floors then
            break
        end
        local u21 = a1:ringIndexFor(v113)
        task.delay(
            0.05 * (v113 - v111),
            function()
                --[[
                  line: 1290
                  upvalues:
                    a1 (copy, index: 1)
                    u21 (copy, index: 2)
                ]]
                return a1.windows:lightUp(u21)
            end
        )
    end
end
u19.refreshTowerVisuals = function(a1)
    --[[
      name: refreshTowerVisuals
      line: 1296
    ]]
    local v114 = a1:windowsLit()
    local v115 = a1:visibleLowestFloor()
    local v116 = false
    while true do
        if v116 then
            v115 = v115 + 1
        else
            v116 = true
        end
        if v115 > a1.floors then
            break
        end
        a1:placeFloorVisual(v115, v114)
    end
end
u19.poseSlab = function(a1)
    --[[
      name: poseSlab
      line: 1314
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.floors > TOWER_BUILDER_CONFIG_upv_1.visibleTower then
        a1.lowerTowerSlab.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.logicalBlocks[a1:visibleLowestFloor()].centerX, ((a1.floors - TOWER_BUILDER_CONFIG_upv_1.visibleTower) * TOWER_BUILDER_CONFIG_upv_1.blockHeight) - 500, 0))
    else
        a1.lowerTowerSlab.CFrame = a1.parkedCFrame
        return nil
    end
end
u19.livesRowDropStuds = function(a1, a2)
    --[[
      name: livesRowDropStuds
      line: 1325
      upvalues:
        currentViewportSize_upv_1 (copy, index: 1)
        currentScoreBandBottomPx_upv_1 (copy, index: 2)
    ]]
    local v117 = currentViewportSize_upv_1()
    if v117 ~= a1.livesRowViewport then
        a1.livesRowViewport = v117
        local v118 = a2 / math.max(v117.Y, 1)
        a1.livesRowDrop = (currentScoreBandBottomPx_upv_1() + 10) * v118 + a1.livesRowHalfHeight
    end
    return a1.livesRowDrop
end
u19.updateLivesIcons = function(a1)
    --[[
      name: updateLivesIcons
      line: 1334
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
        u9 (copy, index: 3)
    ]]
    local v119 = TOWER_BUILDER_CONFIG_upv_1.lives - a1.misses
    local heartRow_3 = a1.heartRow
    if heartRow_3 == nil then
        local v120 = nil
        for n_4 = 0, #a1.livesIcons - 1 do
            local v121 = a1.livesIcons[n_4 + 1]
            local v122 = n_4 < v119
            if v122 then
                v120 = Enum.Material.Neon
            else
                v120 = Enum.Material.Plastic
            end
            v121.Material = v120
            if v122 then
                v120 = u17
            else
                v120 = u9
            end
            v121.Color = v120
            v121.Transparency = (v122 and 0) or 0.55
        end
    else
        heartRow_3:setRemaining(v119)
        return nil
    end
end
u19.currentSwingPeriod = function(a1)
    --[[
      name: currentSwingPeriod
      line: 1350
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.max(TOWER_BUILDER_CONFIG_upv_1.swingPeriodMinSeconds, TOWER_BUILDER_CONFIG_upv_1.swingPeriodBaseSeconds - (TOWER_BUILDER_CONFIG_upv_1.swingPeriodDecayPerFloor * a1.floors)))
end
u19.windAngle = function(a1)
    --[[
      name: windAngle
      line: 1353
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v123 = math.clamp((a1.floors - TOWER_BUILDER_CONFIG_upv_1.windStartFloor) / TOWER_BUILDER_CONFIG_upv_1.windRampFloors, 0, 1)
    if v123 > 0 then
        return (v123 * TOWER_BUILDER_CONFIG_upv_1.windMaxJitterRadians) * math.clamp(math.noise((a1.simTime * TOWER_BUILDER_CONFIG_upv_1.windFrequencyHz) + a1.windOffsetX, a1.windOffsetY), -1, 1)
    end
    return 0
end
u19.swayAmplitudeTarget = function(a1)
    --[[
      name: swayAmplitudeTarget
      line: 1361
      upvalues:
        swayAmplitudeFor_upv_1 (copy, index: 1)
    ]]
    return swayAmplitudeFor_upv_1(a1.floors, a1.wavinessSum)
end
u19.towerTopSurfaceY = function(a1)
    --[[
      name: towerTopSurfaceY
      line: 1364
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.floors * TOWER_BUILDER_CONFIG_upv_1.blockHeight
end
u19.pivotTargetY = function(a1)
    --[[
      name: pivotTargetY
      line: 1367
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return ((a1:towerTopSurfaceY() + (TOWER_BUILDER_CONFIG_upv_1.blockHeight / 2)) + TOWER_BUILDER_CONFIG_upv_1.ropeLength) + TOWER_BUILDER_CONFIG_upv_1.dropDistance
end
u19.ringIndexFor = function(a1, a2)
    --[[
      name: ringIndexFor
      line: 1370
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (a2 - 1) % TOWER_BUILDER_CONFIG_upv_1.visibleTower
end
u19.visibleLowestFloor = function(a1)
    --[[
      name: visibleLowestFloor
      line: 1373
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.max(1, (a1.floors - TOWER_BUILDER_CONFIG_upv_1.visibleTower) + 1))
end
u19.restCFrameFor = function(a1, a2)
    --[[
      name: restCFrameFor
      line: 1376
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return CFrame.new(a1.stage.origin + Vector3.new(a1.logicalBlocks[a2].centerX, (a2 - 0.5) * TOWER_BUILDER_CONFIG_upv_1.blockHeight, 0))
end
u18 = function(a1)
    --[[
      name: makeApartmentPart
      line: 1384
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v124 = makeStagePart_upv_1(a1)
    v124.Size = u1
    return v124
end
local tbl_11 = {}
tbl_11.TowerBuilderGame = u19
return tbl_11