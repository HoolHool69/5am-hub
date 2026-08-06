-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local kitTouchInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "kit-touch-input").kitTouchInput
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow")
local SpectateFollow_upv_1 = v2.SpectateFollow
local approach_upv_1 = v2.approach
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local ICY_TOWER_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").ICY_TOWER_STAGE_LIGHTING
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v4 = RuntimeLib_1.import(script, script.Parent, "icy-tower-assets")
local cloneAuthoredFloorUnit_upv_1 = v4.cloneAuthoredFloorUnit
local cloneBackdrop_upv_1 = v4.cloneBackdrop
local cloneClockDressing_upv_1 = v4.cloneClockDressing
local cloneComboMeter_upv_1 = v4.cloneComboMeter
local resolveIcyTowerBackdrops_upv_1 = v4.resolveIcyTowerBackdrops
local resolveIcyTowerClock_upv_1 = v4.resolveIcyTowerClock
local resolveIcyTowerFloors_upv_1 = v4.resolveIcyTowerFloors
local resolveIcyTowerKit_upv_1 = v4.resolveIcyTowerKit
local resolveIcyTowerLighting_upv_1 = v4.resolveIcyTowerLighting
local IcyTowerAvatarRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "icy-tower-avatar-rig").IcyTowerAvatarRig
local v5 = RuntimeLib_1.import(script, script.Parent, "icy-tower-config")
local ICY_TOWER_COMBO_VOICES_upv_1 = v5.ICY_TOWER_COMBO_VOICES
local ICY_TOWER_CONFIG_upv_1 = v5.ICY_TOWER_CONFIG
local IcyTowerRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "icy-tower-rig").IcyTowerRig
local mountTierDebugPanel_upv_1 = RuntimeLib_1.import(script, script.Parent, "icy-tower-tier-debug").mountTierDebugPanel
local u1 = Vector2.new(5.4, 2.6)
local u2 = CFrame.new(0, -1000, 0)
local u3 = CFrame.Angles(0, 1.5707963267948966, 0)
local u4 = 1 / ICY_TOWER_CONFIG_upv_1.simTicksPerSecond
local pxToStuds_upv_1 = ICY_TOWER_CONFIG_upv_1.pxToStuds
local u5 = ICY_TOWER_CONFIG_upv_1.towerWidthPx / 2
local u6 = ICY_TOWER_CONFIG_upv_1.floorSpacingPx * pxToStuds_upv_1
local u7 = ICY_TOWER_CONFIG_upv_1.slabThicknessPx * pxToStuds_upv_1
local u8 = ICY_TOWER_CONFIG_upv_1.logicalWindowPx * pxToStuds_upv_1
local u9 = Color3.fromRGB(216, 224, 234)
local u10 = Color3.fromRGB(202, 212, 224)
local u11 = Color3.fromRGB(168, 178, 192)
local u12 = Color3.fromRGB(26, 32, 54)
local u13 = Color3.fromRGB(38, 46, 74)
local u14 = Color3.fromRGB(12, 14, 22)
local u15 = Color3.fromRGB(208, 230, 244)
local u16 = Color3.fromRGB(64, 52, 40)
local u17 = Color3.fromRGB(120, 126, 138)
local u18 = Color3.fromRGB(244, 240, 228)
local u19 = Color3.fromRGB(72, 66, 58)
local u20 = Color3.fromRGB(212, 60, 50)
local u21 = Color3.fromRGB(40, 44, 56)
local u22 = Color3.fromRGB(235, 70, 60)
local u23 = Color3.fromRGB(255, 216, 102)
local u24 = Color3.fromRGB(255, 92, 82)
local tbl_upv_1 = {Color3.fromRGB(255, 96, 96), Color3.fromRGB(255, 190, 80), Color3.fromRGB(255, 244, 120), Color3.fromRGB(120, 230, 120), Color3.fromRGB(110, 225, 240), Color3.fromRGB(130, 150, 255), Color3.fromRGB(235, 120, 235), Color3.fromRGB(250, 250, 250)}
local tbl_2 = {}
tbl_2.base = Color3.fromRGB(172, 214, 240)
tbl_2.accent = Color3.fromRGB(226, 244, 255)
local tbl_3 = {}
tbl_3.base = Color3.fromRGB(152, 106, 62)
local tbl_4 = {}
tbl_4.base = Color3.fromRGB(90, 99, 109)
local tbl_5 = {}
tbl_5.base = Color3.fromRGB(238, 126, 168)
tbl_5.accent = Color3.fromRGB(182, 89, 91)
tbl_5.propColor = Color3.fromRGB(238, 126, 168)
local tbl_6 = {}
tbl_6.base = Color3.fromRGB(182, 182, 134)
tbl_6.propColor = Color3.fromRGB(246, 242, 232)
local tbl_7 = {}
tbl_7.base = Color3.fromRGB(75, 120, 50)
tbl_7.accent = Color3.fromRGB(62, 111, 41)
tbl_7.propColor = Color3.fromRGB(127, 182, 64)
local tbl_8 = {}
tbl_8.base = Color3.fromRGB(72, 150, 84)
tbl_8.propColor = Color3.fromRGB(52, 110, 62)
local tbl_9 = {}
tbl_9.base = Color3.fromRGB(246, 248, 252)
tbl_9.propColor = Color3.fromRGB(250, 252, 255)
local tbl_10 = {}
tbl_10.base = Color3.fromRGB(255, 255, 255)
tbl_10.accent = Color3.fromRGB(255, 255, 255)
local tbl_11 = {}
tbl_11.base = Color3.fromRGB(204, 230, 242)
local tbl_upv_12 = {{base = Color3.fromRGB(150, 158, 172), accent = Color3.fromRGB(240, 246, 252)}, tbl_2, tbl_3, tbl_4, tbl_5, tbl_6, tbl_7, tbl_8, tbl_9, tbl_10, tbl_11}
local tbl_upv_13 = {"Stone", "Ice", "Wood", "Metal", "Gum", "Bone", "Vines", "Pipe", "Cloud", "Rainbow", "Glass"}
local tbl_upv_14 = {"Tier00_Stone", "Tier01_Ice", "Tier02_Wood", "Tier03_Metal", "Tier04_Gum", "Tier05_Bone", "Tier06_Vine", "Tier07_Pipe", "Tier08_Cloud", "Tier09_Rainbow", "Tier10_Glass"}
local tbl_upv_15 = {}
tbl_upv_15[1] = true
tbl_upv_15[2] = true
tbl_upv_15[3] = true
tbl_upv_15[4] = true
tbl_upv_15[5] = true
tbl_upv_15[6] = true
tbl_upv_15[8] = true
local tbl_upv_16 = {"StoneBG", "IceBG", "WoodBG", "MetalBG", "GumBG", "BoneBG", "VinesBG", "PipeBG", "CloudBG", "RainbowBG", "GlassBG"}
local tbl_upv_17 = {}
tbl_upv_17.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_17.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_17.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_17.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_18 = {}
local tbl_19 = {}
tbl_19.__tostring = function()
    --[[
      name: __tostring
      line: 260
    ]]
    return "IcyTowerGame"
end
tbl_19.__index = BaseWorldGame_upv_1
local u25 = setmetatable(tbl_18, tbl_19)
u25.__index = u25
u25.new = function(...)
    --[[
      name: new
      line: 266
      upvalues:
        u25 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u25)
    return v6:constructor(...) or v6
end
u25.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 270
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        SpectateFollow_upv_1 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.wallTilesLeft = {}
    a1.wallTilesRight = {}
    a1.mortarLines = {}
    a1.backdropByTier = {}
    a1.authoredBackdropsActive = false
    a1.shownBackdropTier = -1
    a1.floorSlots = {}
    a1.slotByFloor = {}
    a1.signSlots = {}
    a1.signByFloor = {}
    a1.floorSpecs = {}
    a1.lowestSpecIndex = 0
    a1.generatedUpTo = -1
    a1.clockDressingBase = {}
    a1.hudScale = 1
    a1.appliedHudScale = 0
    a1.bannerRemaining = 0
    a1.bannerDuration = 0
    a1.bannerScale = 1
    a1.clockPulseRemaining = 0
    a1.burstEmitters = {}
    a1.trailEmitters = {}
    a1.trailActive = false
    a1.playerXPx = ICY_TOWER_CONFIG_upv_1.spawnXPx
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
    a1.playerYPx = 0
    a1.velocityXPx = 0
    a1.velocityYPx = 0
    a1.grounded = true
    a1.currentFloor = 0
    a1.maxFloor = 0
    a1.spinning = false
    a1.spinDegrees = 0
    a1.spinDirection = 1
    a1.runPhase = 0
    a1.facing = 1
    a1.teetering = false
    a1.panicking = false
    a1.windowBottomPx = -ICY_TOWER_CONFIG_upv_1.windowStartBelowFeetPx
    a1.totalScrollPx = 0
    a1.autoScrollArmed = false
    a1.scrollLevel = 0
    a1.speedUpCounter = 0
    a1.zeroSpeedSkip = false
    a1.clockBroken = false
    a1.comboTimer = 0
    a1.comboFloors = 0
    a1.comboJumps = 0
    a1.comboLinger = 0
    a1.lingerFloors = 0
    a1.bankedScore = 0
    a1.score = 0
    a1.reportedScore = -1
    a1.simAccumulator = 0
    a1.renderPrevXPx = ICY_TOWER_CONFIG_upv_1.spawnXPx
    a1.renderPrevYPx = 0
    a1.renderPrevWindowPx = -ICY_TOWER_CONFIG_upv_1.windowStartBelowFeetPx
    a1.renderPrevSpin = 0
    a1.facingYaw = 0
    a1.dead = false
    a1.deathVelocityPxPerSecond = 0
    a1.roundToken = 0
    a1.ladderRandom = Random.new()
end
u25.buildScene = function(a1)
    --[[
      name: buildScene
      line: 337
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u12 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u13 (copy, index: 5)
        u2 (copy, index: 6)
        u15 (copy, index: 7)
        IcyTowerAvatarRig_upv_1 (copy, index: 8)
        IcyTowerRig_upv_1 (copy, index: 9)
        PopupTextPool_upv_1 (copy, index: 10)
        u6 (copy, index: 11)
        pxToStuds_upv_1 (copy, index: 12)
        mountTierDebugPanel_upv_1 (copy, index: 13)
        tbl_upv_13 (copy, index: 14)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(ICY_TOWER_CONFIG_upv_1.frameWidthFloorStuds)
    a1.backdrop = makeFrontalBackdrop_upv_1(a1.stage, u12, Enum.Material.SmoothPlastic)
    for _ = 0, ICY_TOWER_CONFIG_upv_1.backdropMortarCount - 1 do
        local v7 = makeSmoothPart_upv_1(container_1)
        v7.Material = Enum.Material.SmoothPlastic
        v7.Color = u13
        v7.Size = Vector3.new(46, 0.1599999964237213, 0.11999999731779099)
        v7.CFrame = u2
        table.insert(a1.mortarLines, v7)
    end
    a1.curtainLeft = a1:buildCurtain(container_1)
    a1.curtainRight = a1:buildCurtain(container_1)
    for _ = 0, ICY_TOWER_CONFIG_upv_1.wallTilesPerSide - 1 do
        table.insert(a1.wallTilesLeft, (a1:buildWallTile(container_1)))
        table.insert(a1.wallTilesRight, (a1:buildWallTile(container_1)))
    end
    a1.mistNear = makeSmoothPart_upv_1(container_1)
    a1.mistNear.Material = Enum.Material.SmoothPlastic
    a1.mistNear.Color = u15
    a1.mistNear.Transparency = 0.35
    a1.mistNear.Size = Vector3.new(58, 2.4000000953674316, 2)
    a1.mistFar = makeSmoothPart_upv_1(container_1)
    a1.mistFar.Material = Enum.Material.SmoothPlastic
    a1.mistFar.Color = u15
    a1.mistFar.Transparency = 0.62
    a1.mistFar.Size = Vector3.new(58, 4.599999904632568, 2)
    for _ = 0, ICY_TOWER_CONFIG_upv_1.floorPoolSize - 1 do
        table.insert(a1.floorSlots, (a1:buildFloorSlot(container_1)))
    end
    for _ = 0, ICY_TOWER_CONFIG_upv_1.signPoolSize - 1 do
        table.insert(a1.signSlots, (a1:buildSignSlot(container_1)))
    end
    a1:buildClock(container_1)
    a1:buildComboWidgets(container_1)
    a1:buildStarEmitters(container_1)
    a1:setupAuthoredScenery(container_1)
    local v8
    if ICY_TOWER_CONFIG_upv_1.usePlayerAvatar then
        v8 = IcyTowerAvatarRig_upv_1.new({container = container_1, janitor = a1.context.janitor, scale = ICY_TOWER_CONFIG_upv_1.playerAvatarScale, headScale = ICY_TOWER_CONFIG_upv_1.playerAvatarHeadScale})
    else
        v8 = IcyTowerRig_upv_1.new(container_1)
    end
    a1.rig = v8
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1:wireInput()
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_20 = {}
        tbl_20.scoreToStuds = function(a2)
            --[[
              name: scoreToStuds
              line: 407
              upvalues:
                ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
                u6 (copy, index: 2)
            ]]
            return (a2 / ICY_TOWER_CONFIG_upv_1.pointsPerFloor) * u6
        end
        tbl_20.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 410
              upvalues:
                a1 (copy, index: 1)
                pxToStuds_upv_1 (copy, index: 2)
            ]]
            return a1.playerYPx * pxToStuds_upv_1
        end
        tbl_20.poseMarker = function(a3)
            --[[
              name: poseMarker
              line: 413
              upvalues:
                origin_upv_1 (copy, index: 1)
            ]]
            return CFrame.new(origin_upv_1.X, origin_upv_1.Y + a3, origin_upv_1.Z - 0.5)
        end
        tbl_20.marginHalfSpan = function()
            --[[
              name: marginHalfSpan
              line: 418
              upvalues:
                a1 (copy, index: 1)
            ]]
            return (a1.stage.getFrameWidth() / 2) - 2.5
        end
        registerRivalMarkers_1(tbl_20)
    end
    local function onOverride_1(a4)
        --[[
          name: onOverride
          line: 433
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.debugTierOverride = a4
        a1:restyleActiveFloors()
    end
    mountTierDebugPanel_upv_1({janitor = a1.context.janitor, tierLabels = tbl_upv_13, onOverride = onOverride_1})
    a1:applyAuthoredLighting()
end
u25.setupAuthoredScenery = function(a1, a2)
    --[[
      name: setupAuthoredScenery
      line: 442
      upvalues:
        resolveIcyTowerKit_upv_1 (copy, index: 1)
        resolveIcyTowerFloors_upv_1 (copy, index: 2)
        resolveIcyTowerBackdrops_upv_1 (copy, index: 3)
        tbl_upv_16 (copy, index: 4)
        cloneBackdrop_upv_1 (copy, index: 5)
        u2 (copy, index: 6)
        resolveIcyTowerClock_upv_1 (copy, index: 7)
        cloneClockDressing_upv_1 (copy, index: 8)
        cloneComboMeter_upv_1 (copy, index: 9)
    ]]
    local v9 = resolveIcyTowerKit_upv_1()
    local v10, v11, v12 = nil, nil, nil
    if v9 ~= nil then
        a1.authoredFloorsFolder = resolveIcyTowerFloors_upv_1(v9)
        v10 = resolveIcyTowerBackdrops_upv_1(v9)
        if v10 ~= nil then
            for n_1 = 0, #tbl_upv_16 - 1 do
                local v13
                v13 = v10:FindFirstChild(tbl_upv_16[n_1 + 1])
                if v13 == nil then
                    continue
                end
                local v14
                v14 = v13:IsA("Model")
                if not (v14) then
                    continue
                end
                v14 = cloneBackdrop_upv_1(v13, a2)
                if v14 ~= nil then
                    v14.model:PivotTo(CFrame.new(Vector3.new(0, -1000, 0)) * v14.rotation)
                    a1.backdropByTier[n_1] = v14
                end
            end
            local v16 = 0
            for _ in a1.backdropByTier do
                v16 = v16 + 1
            end
            a1.authoredBackdropsActive = v16 > 0
            if a1.authoredBackdropsActive then
                a1.backdrop.CFrame = u2
            end
        end
        v11 = resolveIcyTowerClock_upv_1(v9)
        if v11 ~= nil then
            v12 = cloneClockDressing_upv_1(v11, a2)
            if #v12 > 0 then
                a1.clockDressing = v12
                local v17 = table.create(#v12)
                for key_1, value_1 in v12 do
                    v17[key_1] = {part = value_1.part, offset = value_1.offset, size = value_1.part.Size}
                end
                a1.clockDressingBase = v17
                a1.clockRim.CFrame = u2
                a1.clockFace.CFrame = u2
            end
        end
        v12 = cloneComboMeter_upv_1(v9, a2)
        if v12 ~= nil then
            a1.meterFrame:Destroy()
            a1.meterFill:Destroy()
            v12.frame.CFrame = u2
            v12.fill.CFrame = u2
            a1.meterFrame = v12.frame
            a1.meterFill = v12.fill
        end
    else
        return nil
    end
end
u25.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 520
      upvalues:
        resolveIcyTowerLighting_upv_1 (copy, index: 1)
        readLightingFolderProfile_upv_1 (copy, index: 2)
        tbl_upv_17 (copy, index: 3)
        ICY_TOWER_STAGE_LIGHTING_upv_1 (copy, index: 4)
    ]]
    local v18 = resolveIcyTowerLighting_upv_1()
    if v18 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(v18, tbl_upv_17, ICY_TOWER_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u25.updateBackdrop = function(a1, a2)
    --[[
      name: updateBackdrop
      line: 527
      upvalues:
        u6 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_12 (copy, index: 3)
    ]]
    local v19 = math.min(math.floor(math.round(a2 / u6) / ICY_TOWER_CONFIG_upv_1.themeEvery), #tbl_upv_12 - 1)
    local v20 = a1.debugTierOverride
    if v20 == nil then
        v20 = math.max(v19, 0)
    end
    local v21 = nil
    if v20 ~= a1.shownBackdropTier then
        local v22 = a1.backdropByTier[a1.shownBackdropTier]
        v21 = v22
        if v21 ~= nil then
            local _ = v21.model:PivotTo(CFrame.new(Vector3.new(0, -1000, 0)) * v22.rotation)
        end
        a1.shownBackdropTier = v20
    end
    local v23 = a1.backdropByTier[v20]
    if v23 ~= nil then
        v23.model:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(0, a2, -16) - v23.panelOffset) * v23.rotation)
    else
        return nil
    end
end
u25.buildCurtain = function(a1, a2)
    --[[
      name: buildCurtain
      line: 561
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    local v24 = makeSmoothPart_upv_1(a2)
    v24.Material = Enum.Material.SmoothPlastic
    v24.Color = u14
    v24.Size = Vector3.new(90, 220, 1)
    v24.CFrame = u2
    return v24
end
u25.buildWallTile = function(a1, a2)
    --[[
      name: buildWallTile
      line: 569
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        pxToStuds_upv_1 (copy, index: 3)
        u2 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u11 (copy, index: 6)
    ]]
    local v25 = makeStagePart_upv_1(a2)
    v25.Size = Vector3.new(ICY_TOWER_CONFIG_upv_1.wallThicknessStuds, ICY_TOWER_CONFIG_upv_1.wallTileHeightPx * pxToStuds_upv_1, 3.4)
    v25.CFrame = u2
    local v26 = makeSmoothPart_upv_1(a2)
    v26.Color = u11
    v26.Size = Vector3.new(ICY_TOWER_CONFIG_upv_1.wallThicknessStuds + 0.15, 0.3, 3.5)
    v26.CFrame = u2
    local tbl_21 = {}
    tbl_21.brick = v25
    tbl_21.seam = v26
    return tbl_21
end
u25.buildFloorSlot = function(a1, a2)
    --[[
      name: buildFloorSlot
      line: 582
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 3)
        u2 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        makeEllipsoidPart_upv_1 (copy, index: 6)
    ]]
    local v27 = makeStagePart_upv_1(a2)
    v27.Size = Vector3.new(8, u7, ICY_TOWER_CONFIG_upv_1.platformDepthStuds)
    v27.CFrame = u2
    local v28 = makeSmoothPart_upv_1(a2)
    v28.CFrame = u2
    local v29 = makeEllipsoidPart_upv_1(a2)
    v29.CFrame = u2
    local v30 = makeEllipsoidPart_upv_1(a2)
    v30.CFrame = u2
    local v31 = a1:buildWeldCylinder(a2)
    local v32 = a1:buildWeldCylinder(a2)
    local tbl_22 = {}
    local v33 = makeSmoothPart_upv_1(a2)
    v33.CFrame = u2
    table.insert(tbl_22, v33)
    local v34 = makeSmoothPart_upv_1(a2)
    v34.CFrame = u2
    table.insert(tbl_22, v34)
    local v35 = makeSmoothPart_upv_1(a2)
    v35.CFrame = u2
    table.insert(tbl_22, v35)
    local v36 = makeSmoothPart_upv_1(a2)
    v36.CFrame = u2
    table.insert(tbl_22, v36)
    local tbl_23 = {}
    tbl_23.part = v27
    tbl_23.accent = v28
    tbl_23.propLeft = v29
    tbl_23.propRight = v30
    tbl_23.flangeLeft = v31
    tbl_23.flangeRight = v32
    tbl_23.glassEdges = tbl_22
    return tbl_23
end
u25.buildWeldCylinder = function(a1, a2)
    --[[
      name: buildWeldCylinder
      line: 614
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v37 = makeStagePart_upv_1(a2)
    v37.Shape = Enum.PartType.Cylinder
    v37.TopSurface = Enum.SurfaceType.Weld
    v37.BottomSurface = Enum.SurfaceType.Weld
    v37.FrontSurface = Enum.SurfaceType.Weld
    v37.BackSurface = Enum.SurfaceType.Weld
    v37.LeftSurface = Enum.SurfaceType.Weld
    v37.RightSurface = Enum.SurfaceType.Weld
    v37.CFrame = u2
    return v37
end
u25.buildSignSlot = function(a1, a2)
    --[[
      name: buildSignSlot
      line: 626
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        u2 (copy, index: 3)
        markWorldArt_upv_1 (copy, index: 4)
        u17 (copy, index: 5)
    ]]
    local v38 = makeSmoothPart_upv_1(a2)
    v38.Color = u16
    v38.Size = Vector3.new(2.700000047683716, 1.5, 0.30000001192092896)
    v38.CFrame = u2
    local v39 = Instance.new("SurfaceGui")
    v39.Face = Enum.NormalId.Back
    v39.CanvasSize = Vector2.new(200, 110)
    markWorldArt_upv_1(v39)
    v39.Parent = v38
    local v40 = Instance.new("TextLabel")
    v40.BackgroundTransparency = 1
    v40.Size = UDim2.fromScale(1, 1)
    v40.Font = Enum.Font.GothamBlack
    v40.TextScaled = true
    v40.TextColor3 = Color3.fromRGB(255, 255, 255)
    v40.TextStrokeTransparency = 0
    v40.Parent = v39
    local v41 = makeSmoothPart_upv_1(a2)
    v41.Color = u17
    v41.Size = Vector3.new(0.14000000059604645, 0.8500000238418579, 0.14000000059604645)
    v41.CFrame = u2
    local v42 = makeSmoothPart_upv_1(a2)
    v42.Color = u17
    v42.Size = Vector3.new(0.14000000059604645, 0.8500000238418579, 0.14000000059604645)
    v42.CFrame = u2
    local tbl_24 = {}
    tbl_24.plaque = v38
    tbl_24.chainLeft = v41
    tbl_24.chainRight = v42
    tbl_24.label = v40
    return tbl_24
end
u25.buildClock = function(a1, a2)
    --[[
      name: buildClock
      line: 663
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u19 (copy, index: 2)
        u2 (copy, index: 3)
        u18 (copy, index: 4)
        u20 (copy, index: 5)
        makeEllipsoidPart_upv_1 (copy, index: 6)
    ]]
    a1.clockRim = makeSmoothPart_upv_1(a2)
    a1.clockRim.Shape = Enum.PartType.Cylinder
    a1.clockRim.Color = u19
    a1.clockRim.Size = Vector3.new(0.30000001192092896, 3.5999999046325684, 3.5999999046325684)
    a1.clockRim.CFrame = u2
    a1.clockFace = makeSmoothPart_upv_1(a2)
    a1.clockFace.Shape = Enum.PartType.Cylinder
    a1.clockFace.Color = u18
    a1.clockFace.Size = Vector3.new(0.41999998688697815, 3.0999999046325684, 3.0999999046325684)
    a1.clockFace.CFrame = u2
    a1.clockHand = makeSmoothPart_upv_1(a2)
    a1.clockHand.Color = u20
    a1.clockHand.Size = Vector3.new(0.18000000715255737, 1.25, 0.1599999964237213)
    a1.clockHand.CFrame = u2
    a1.clockBellLeft = makeEllipsoidPart_upv_1(a2)
    a1.clockBellLeft.Color = u19
    a1.clockBellLeft.Size = Vector3.new(0.8999999761581421, 0.699999988079071, 0.6000000238418579)
    a1.clockBellLeft.CFrame = u2
    a1.clockBellRight = makeEllipsoidPart_upv_1(a2)
    a1.clockBellRight.Color = u19
    a1.clockBellRight.Size = Vector3.new(0.8999999761581421, 0.699999988079071, 0.6000000238418579)
    a1.clockBellRight.CFrame = u2
    a1.clockCrack = makeSmoothPart_upv_1(a2)
    a1.clockCrack.Color = u19
    a1.clockCrack.Size = Vector3.new(0.14000000059604645, 2.5999999046325684, 0.10000000149011612)
    a1.clockCrack.CFrame = u2
end
u25.buildComboWidgets = function(a1, a2)
    --[[
      name: buildComboWidgets
      line: 691
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u21 (copy, index: 2)
        u2 (copy, index: 3)
        u22 (copy, index: 4)
        u1 (copy, index: 5)
    ]]
    a1.meterFrame = makeSmoothPart_upv_1(a2)
    a1.meterFrame.Color = u21
    a1.meterFrame.Size = Vector3.new(1, 8.800000190734863, 0.5)
    a1.meterFrame.CFrame = u2
    a1.meterFill = makeSmoothPart_upv_1(a2)
    a1.meterFill.Material = Enum.Material.Neon
    a1.meterFill.Color = u22
    a1.meterFill.Size = Vector3.new(0.6200000047683716, 8.300000190734863, 0.550000011920929)
    a1.meterFill.CFrame = u2
    a1.badgeAnchor = makeSmoothPart_upv_1(a2)
    a1.badgeAnchor.Transparency = 1
    a1.badgeAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.badgeAnchor.CFrame = u2
    local v43 = Instance.new("BillboardGui")
    v43.Size = UDim2.fromScale(u1.X, u1.Y)
    v43.AlwaysOnTop = true
    v43.Parent = a1.badgeAnchor
    a1.badgeBillboard = v43
    a1.badgeLabel = Instance.new("TextLabel")
    a1.badgeLabel.BackgroundTransparency = 1
    a1.badgeLabel.Size = UDim2.fromScale(1, 1)
    a1.badgeLabel.Font = Enum.Font.GothamBlack
    a1.badgeLabel.TextScaled = true
    a1.badgeLabel.TextStrokeTransparency = 0.2
    a1.badgeLabel.Parent = v43
    a1.bannerAnchor = makeSmoothPart_upv_1(a2)
    a1.bannerAnchor.Transparency = 1
    a1.bannerAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.bannerAnchor.CFrame = u2
    a1.bannerBillboard = Instance.new("BillboardGui")
    a1.bannerBillboard.Size = UDim2.fromScale(16, 4)
    a1.bannerBillboard.AlwaysOnTop = true
    a1.bannerBillboard.Parent = a1.bannerAnchor
    a1.bannerLabel = Instance.new("TextLabel")
    a1.bannerLabel.BackgroundTransparency = 1
    a1.bannerLabel.Size = UDim2.fromScale(1, 1)
    a1.bannerLabel.Font = Enum.Font.GothamBlack
    a1.bannerLabel.TextScaled = true
    a1.bannerLabel.TextStrokeTransparency = 0.1
    a1.bannerLabel.TextTransparency = 1
    a1.bannerLabel.Parent = a1.bannerBillboard
end
u25.buildStarEmitters = function(a1, a2)
    --[[
      name: buildStarEmitters
      line: 737
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
    ]]
    a1.burstAnchor = makeSmoothPart_upv_1(a2)
    a1.burstAnchor.Transparency = 1
    a1.burstAnchor.Size = Vector3.new(1.399999976158142, 0.4000000059604645, 0.4000000059604645)
    a1.burstAnchor.CFrame = u2
    a1.trailAnchor = makeSmoothPart_upv_1(a2)
    a1.trailAnchor.Transparency = 1
    a1.trailAnchor.Size = Vector3.new(0.800000011920929, 0.800000011920929, 0.4000000059604645)
    a1.trailAnchor.CFrame = u2
    for _, value_2 in tbl_upv_1 do
        table.insert(a1.burstEmitters, (a1:buildStarEmitter(a1.burstAnchor, value_2, 14)))
        table.insert(a1.trailEmitters, (a1:buildStarEmitter(a1.trailAnchor, value_2, 8)))
    end
end
u25.buildStarEmitter = function(a1, a2, a3, a4)
    --[[
      name: buildStarEmitter
      line: 755
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    local v44 = Instance.new("ParticleEmitter")
    v44.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v44.Color = ColorSequence.new(a3)
    v44.Rate = 0
    v44.Lifetime = NumberRange.new(0.35, 0.75)
    v44.Speed = NumberRange.new(a4 * 0.5, a4)
    v44.SpreadAngle = Vector2.new(180, 180)
    v44.EmissionDirection = Enum.NormalId.Top
    v44.Acceleration = Vector3.new(0, -26, 0)
    v44.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.12)})
    v44.Rotation = NumberRange.new(0, 90)
    v44.RotSpeed = NumberRange.new(-220, 220)
    v44.Parent = a2
    return v44
end
u25.wireInput = function(a1)
    --[[
      name: wireInput
      line: 771
      upvalues:
        kitTouchInput_upv_1 (copy, index: 1)
    ]]
    a1.context.janitor:Add(
        kitTouchInput_upv_1.onPress:Connect(
            function()
                --[[
                  line: 772
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1.context.requestStart()
            end
        ),
        "Disconnect"
    )
end
u25.resetRound = function(a1)
    --[[
      name: resetRound
      line: 776
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        kitTouchInput_upv_1 (copy, index: 3)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.ladderRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.dead = false
    a1.spectating = false
    a1.playerXPx = ICY_TOWER_CONFIG_upv_1.spawnXPx
    a1.playerYPx = 0
    a1.velocityXPx = 0
    a1.velocityYPx = 0
    a1.grounded = true
    a1.currentFloor = 0
    a1.maxFloor = 0
    a1.spinning = false
    a1.spinDegrees = 0
    a1.runPhase = 0
    a1.facing = 1
    a1.teetering = false
    a1.panicking = false
    a1.windowBottomPx = -ICY_TOWER_CONFIG_upv_1.windowStartBelowFeetPx
    a1.totalScrollPx = 0
    a1.autoScrollArmed = false
    a1.scrollLevel = 0
    a1.speedUpCounter = 0
    a1.zeroSpeedSkip = false
    a1.clockBroken = false
    a1.comboTimer = 0
    a1.comboFloors = 0
    a1.comboJumps = 0
    a1.comboLinger = 0
    a1.lingerFloors = 0
    a1.bankedScore = 0
    a1.score = 0
    a1.reportedScore = -1
    a1.bannerRemaining = 0
    a1.bannerLabel.TextTransparency = 1
    a1.clockPulseRemaining = 0
    a1.simAccumulator = 0
    a1.renderPrevXPx = a1.playerXPx
    a1.renderPrevYPx = a1.playerYPx
    a1.renderPrevWindowPx = a1.windowBottomPx
    a1.renderPrevSpin = 0
    a1.facingYaw = 0
    kitTouchInput_upv_1:reset()
    a1:setTrailActive(false)
    for _, value_3 in a1.floorSlots do
        a1:parkFloorSlot(value_3)
    end
    for _, value_4 in a1.signSlots do
        a1:parkSignSlot(value_4)
    end
    table.clear(a1.slotByFloor)
    table.clear(a1.signByFloor)
    table.clear(a1.floorSpecs)
    a1.lowestSpecIndex = 0
    a1.generatedUpTo = -1
    a1:layoutTower()
    a1:reportScore(0)
end
u25.captureRound = function(a1)
    --[[
      name: captureRound
      line: 836
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 840
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2:int(a1.score):int(a1.bankedScore):int(a1.generatedUpTo)
            a2:num(a1.playerXPx):num(a1.playerYPx):num(a1.velocityXPx):num(a1.velocityYPx)
            a2:bool(a1.grounded):int(a1.currentFloor):int(a1.maxFloor):int(a1.facing)
            a2:bool(a1.spinning):num(a1.spinDegrees):int(a1.spinDirection):num(a1.runPhase)
            a2:num(a1.windowBottomPx):num(a1.totalScrollPx):bool(a1.autoScrollArmed)
            a2:int(a1.scrollLevel):int(a1.speedUpCounter):bool(a1.zeroSpeedSkip):bool(a1.clockBroken)
            a2:num(a1.comboTimer):int(a1.comboFloors):int(a1.comboJumps)
            a2:num(a1.comboLinger):int(a1.lingerFloors)
        end
    )
end
u25.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 851
      upvalues:
        readResume_upv_1 (copy, index: 1)
        kitTouchInput_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
    ]]
    local v45 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 852
            ]]
            local tbl_25 = {}
            tbl_25.score = a3:int()
            tbl_25.bankedScore = a3:int()
            tbl_25.generatedUpTo = a3:int()
            tbl_25.playerXPx = a3:num()
            tbl_25.playerYPx = a3:num()
            tbl_25.velocityXPx = a3:num()
            tbl_25.velocityYPx = a3:num()
            tbl_25.grounded = a3:bool()
            tbl_25.currentFloor = a3:int()
            tbl_25.maxFloor = a3:int()
            tbl_25.facing = a3:int()
            tbl_25.spinning = a3:bool()
            tbl_25.spinDegrees = a3:num()
            tbl_25.spinDirection = a3:int()
            tbl_25.runPhase = a3:num()
            tbl_25.windowBottomPx = a3:num()
            tbl_25.totalScrollPx = a3:num()
            tbl_25.autoScrollArmed = a3:bool()
            tbl_25.scrollLevel = a3:int()
            tbl_25.speedUpCounter = a3:int()
            tbl_25.zeroSpeedSkip = a3:bool()
            tbl_25.clockBroken = a3:bool()
            tbl_25.comboTimer = a3:num()
            tbl_25.comboFloors = a3:int()
            tbl_25.comboJumps = a3:int()
            tbl_25.comboLinger = a3:num()
            tbl_25.lingerFloors = a3:int()
            return tbl_25
        end
    )
    if v45 ~= nil and v45.generatedUpTo >= 0 and v45.generatedUpTo <= 2e+05 then
        a1.score = a2.score
        a1.bankedScore = v45.bankedScore
        a1.reportedScore = -1
        a1.playerXPx = v45.playerXPx
        a1.playerYPx = v45.playerYPx
        a1.velocityXPx = v45.velocityXPx
        a1.velocityYPx = v45.velocityYPx
        a1.grounded = v45.grounded
        a1.currentFloor = v45.currentFloor
        a1.maxFloor = v45.maxFloor
        a1.facing = ((v45.facing >= 0) and 1) or -1
        a1.spinning = v45.spinning
        a1.spinDegrees = v45.spinDegrees
        a1.spinDirection = ((v45.spinDirection >= 0) and 1) or -1
        a1.runPhase = v45.runPhase
        a1.windowBottomPx = v45.windowBottomPx
        a1.totalScrollPx = v45.totalScrollPx
        a1.autoScrollArmed = v45.autoScrollArmed
        a1.scrollLevel = v45.scrollLevel
        a1.speedUpCounter = v45.speedUpCounter
        a1.zeroSpeedSkip = v45.zeroSpeedSkip
        a1.clockBroken = v45.clockBroken
        a1.comboTimer = v45.comboTimer
        a1.comboFloors = v45.comboFloors
        a1.comboJumps = v45.comboJumps
        a1.comboLinger = v45.comboLinger
        a1.lingerFloors = v45.lingerFloors
        a1.dead = false
        a1.teetering = false
        a1.panicking = false
        a1.bannerRemaining = 0
        a1.bannerLabel.TextTransparency = 1
        a1.clockPulseRemaining = 0
        a1.roundToken = a1.roundToken + 1
        a1.simAccumulator = 0
        a1.renderPrevXPx = a1.playerXPx
        a1.renderPrevYPx = a1.playerYPx
        a1.renderPrevWindowPx = a1.windowBottomPx
        a1.renderPrevSpin = a1.spinDegrees
        a1.facingYaw = 0
        kitTouchInput_upv_1:reset()
        a1:setTrailActive(false)
        a1.ladderRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
        for _, value_5 in a1.floorSlots do
            a1:parkFloorSlot(value_5)
        end
        for _, value_6 in a1.signSlots do
            a1:parkSignSlot(value_6)
        end
        table.clear(a1.slotByFloor)
        table.clear(a1.signByFloor)
        table.clear(a1.floorSpecs)
        a1.lowestSpecIndex = 0
        a1.generatedUpTo = -1
        a1:ensureFloors(v45.generatedUpTo)
        a1:layoutTower()
        a1:reportScore(a1.score)
        return true
    end
    return false
end
u25.snapshot = function(a1)
    --[[
      name: snapshot
      line: 950
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v46 = (a1.playerXPx - ICY_TOWER_CONFIG_upv_1.playerClampMinPx) / math.max(ICY_TOWER_CONFIG_upv_1.playerClampMaxPx - ICY_TOWER_CONFIG_upv_1.playerClampMinPx, 1)
    local tbl_26 = {}
    tbl_26.score = a1.score
    tbl_26.values = {a1.currentFloor, math.clamp(v46, 0, 1), a1.comboFloors, a1.playerXPx, a1.playerYPx}
    return tbl_26
end
u25.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 957
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local tbl_27 = {}
        tbl_27.createBody = function()
            --[[
              name: createBody
              line: 963
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:createGhostBody()
        end
        local u26 = GhostPool_upv_1.new(a1.stage.container, tbl_27)
        a1.ghostPool = u26
        a1.context.janitor:Add(
            function()
                --[[
                  line: 968
                  upvalues:
                    u26 (copy, index: 1)
                ]]
                return u26:destroy()
            end
        )
    end
end
u25.createGhostBody = function(a1)
    --[[
      name: createGhostBody
      line: 973
      upvalues:
        IcyTowerRig_upv_1 (copy, index: 1)
    ]]
    local u27 = Instance.new("Folder")
    u27.Name = "GhostClimber"
    u27.Parent = a1.stage.container
    local u28 = IcyTowerRig_upv_1.new(u27)
    local v47 = u27:FindFirstChildWhichIsA("BasePart", true)
    if v47 ~= nil then
        local X_upv_1 = 0
        local u29 = 1
        local u30 = 0
        local tbl_28 = {}
        tbl_28.root = u27
        tbl_28.anchor = v47
        tbl_28.pose = function(a2, a3)
            --[[
              name: pose
              line: 989
              upvalues:
                X_upv_1 (ref,  index: 1)
                u29 (ref,  index: 2)
                u30 (ref,  index: 3)
                u28 (copy, index: 4)
            ]]
            X_upv_1 = a2.X
            if math.abs(a3.X) > 0.5 then
                u29 = ((a3.X <= 0) and -1) or 1
            end
            u30 = u30 + (math.abs(a2.X - X_upv_1) * 1.4)
            u28:pose(CFrame.new(a2), {state = ((a3.Y > 6) and "rise") or (((a3.Y >= -6) and "run") or "fall"), facing = u29, runPhase = u30, clock = os.clock()})
        end
        tbl_28.destroy = function()
            --[[
              name: destroy
              line: 1006
              upvalues:
                u27 (copy, index: 1)
            ]]
            return u27:Destroy()
        end
        return tbl_28
    end
    u27:Destroy()
    return nil
end
u25.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 1011
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        pxToStuds_upv_1 (copy, index: 3)
    ]]
    local ghostPool_1 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_1 ~= nil and matchOpponents_1 ~= nil then
        local v48 = nil
        local v49 = nil
        local v50 = nil
        for _, value_7 in matchOpponents_1 do
            v50 = value_7.snapshot
            if v50 == nil then
                continue
            end
            v48 = v50.values[4]
            v49 = v50.values[5]
            if v48 == nil or v49 == nil or v49 < a1.windowBottomPx - 40 then
                continue
            end
            if (a1.windowBottomPx + ICY_TOWER_CONFIG_upv_1.logicalWindowPx) + 60 >= v49 then
                ghostPool_1:show(value_7.userId, value_7.username, a1.stage.origin + Vector3.new((v48 - u5) * pxToStuds_upv_1, v49 * pxToStuds_upv_1, -0.5), value_7.alive)
            end
        end
        ghostPool_1:step(a2)
    else
        return nil
    end
end
u25.revive = function(a1)
    --[[
      name: revive
      line: 1045
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    local v51 = math.max(1, math.ceil((a1.windowBottomPx + (ICY_TOWER_CONFIG_upv_1.logicalWindowPx / 3)) / ICY_TOWER_CONFIG_upv_1.floorSpacingPx))
    a1:ensureFloors(v51 + ICY_TOWER_CONFIG_upv_1.lookaheadFloors)
    a1.floorSpecs[v51] = a1:makeFullWidthSpec(v51)
    local v52 = a1.slotByFloor[v51]
    if v52 ~= nil then
        a1:parkFloorSlot(v52)
        a1.slotByFloor[v51] = nil
    end
    a1.playerXPx = math.clamp(a1.playerXPx, ICY_TOWER_CONFIG_upv_1.playerClampMinPx, ICY_TOWER_CONFIG_upv_1.playerClampMaxPx)
    a1.playerYPx = v51 * ICY_TOWER_CONFIG_upv_1.floorSpacingPx
    a1.velocityXPx = 0
    a1.velocityYPx = 0
    a1.grounded = true
    a1.spinning = false
    a1.currentFloor = v51
    a1.maxFloor = math.max(a1.maxFloor, v51)
    a1.speedUpCounter = 0
    a1.comboTimer = 0
    a1.comboJumps = 0
    a1.comboFloors = 0
    a1.renderPrevXPx = a1.playerXPx
    a1.renderPrevYPx = a1.playerYPx
    a1.renderPrevWindowPx = a1.windowBottomPx
    a1:layoutTower()
    a1:setRunning(true)
end
u25.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 1078
      upvalues:
        u4 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    a1.simAccumulator = a1.simAccumulator + a2
    while u4 <= a1.simAccumulator do
        a1.simAccumulator = a1.simAccumulator - u4
        a1:simTick()
        if not (a1.dead) then
            continue
        end
        return nil
    end
end
u25.simTick = function(a1)
    --[[
      name: simTick
      line: 1091
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        kitTouchInput_upv_1 (copy, index: 2)
        UserInputService_upv_1 (copy, index: 3)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 4)
    ]]
    a1.renderPrevXPx = a1.playerXPx
    a1.renderPrevYPx = a1.playerYPx
    a1.renderPrevWindowPx = a1.windowBottomPx
    a1.renderPrevSpin = a1.spinDegrees
    local v53 = gamepadInput_upv_1:moveX()
    local v54 = kitTouchInput_upv_1:isHeld("left") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Left) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.A) or (v53 < -0.25)))
    local v55 = kitTouchInput_upv_1:isHeld("right") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Right) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.D) or (v53 > 0.25)))
    local v56 = (v54 and -1) or ((v55 and 1) or 0)
    local v57 = kitTouchInput_upv_1:isHeld("jump") or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Space) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Up) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.W) or (gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)))))
    if v56 == 0 then
        a1.velocityXPx = a1.velocityXPx * ICY_TOWER_CONFIG_upv_1.idleFriction
        if math.abs(a1.velocityXPx) < 0.01 then
            a1.velocityXPx = 0
        end
    else
        a1.facing = v56
        if a1.velocityXPx == 0 or math.sign(a1.velocityXPx) == v56 then
            a1.velocityXPx = a1.velocityXPx + (v56 * ICY_TOWER_CONFIG_upv_1.runAccelPx)
        else
            a1.velocityXPx = (a1.velocityXPx * ICY_TOWER_CONFIG_upv_1.turnFriction) + (v56 * ICY_TOWER_CONFIG_upv_1.runAccelPx)
        end
    end
    if v57 then
        local v58 = nil
        if a1.grounded then
            v58 = math.max(ICY_TOWER_CONFIG_upv_1.jumpSpeedFactor * math.abs(a1.velocityXPx), ICY_TOWER_CONFIG_upv_1.baseJumpSpeedPx)
            a1.velocityYPx = v58
            a1.grounded = false
            a1.teetering = false
            if ICY_TOWER_CONFIG_upv_1.highJumpSpeedPx < v58 then
                a1.spinning = true
                a1.spinDegrees = 0
                a1.renderPrevSpin = 0
                a1.spinDirection = ((a1.velocityXPx < 0) and 1) or -1
                a1.context.audio.play("whoosh", {})
            end
            a1.context.audio.play("flap", {})
        end
    end
    a1.velocityXPx = math.clamp(a1.velocityXPx, -ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx, ICY_TOWER_CONFIG_upv_1.maxRunSpeedPx)
    local playerXPx_1 = a1.playerXPx
    local playerYPx_1 = a1.playerYPx
    local velocityYPx_1 = a1.velocityYPx
    a1.playerXPx = a1.playerXPx + a1.velocityXPx
    if a1.playerXPx >= ICY_TOWER_CONFIG_upv_1.playerClampMinPx then
        if ICY_TOWER_CONFIG_upv_1.playerClampMaxPx < a1.playerXPx then
            a1.playerXPx = ICY_TOWER_CONFIG_upv_1.playerClampMaxPx
            a1.velocityXPx = a1.velocityXPx * -ICY_TOWER_CONFIG_upv_1.wallBounceFactor
        end
    else
        a1.playerXPx = ICY_TOWER_CONFIG_upv_1.playerClampMinPx
        a1.velocityXPx = a1.velocityXPx * -ICY_TOWER_CONFIG_upv_1.wallBounceFactor
    end
    local v59 = false
    if a1.grounded then
        a1.runPhase = a1.runPhase + (math.abs(a1.velocityXPx) * 0.105)
        v59 = not a1:updateGroundSupport()
    end
    if not (a1.grounded) and not (v59) then
        a1.playerYPx = a1.playerYPx + a1.velocityYPx
        a1.velocityYPx = math.max(a1.velocityYPx - ICY_TOWER_CONFIG_upv_1.gravityPx, -ICY_TOWER_CONFIG_upv_1.terminalFallSpeedPx)
        if a1.spinning then
            a1.spinDegrees = a1.spinDegrees + (ICY_TOWER_CONFIG_upv_1.spinDegreesPerTick * a1.spinDirection)
        end
    end
    a1:applyScroll()
    if a1.comboTimer > 0 then
        a1.comboTimer = a1.comboTimer - 1
        if a1.comboTimer == 0 then
            a1:completeCombo()
        end
    end
    if a1.comboLinger > 0 then
        a1.comboLinger = a1.comboLinger - 1
    end
    if not (a1.grounded) and velocityYPx_1 <= 0 and a1.playerYPx < playerYPx_1 then
        a1:resolveLanding(playerXPx_1, playerYPx_1)
    end
    if a1.playerYPx >= a1.windowBottomPx - ICY_TOWER_CONFIG_upv_1.deathBelowWindowPx then
        a1.panicking = a1.grounded and (a1.autoScrollArmed and (a1.playerYPx - a1.windowBottomPx <= ICY_TOWER_CONFIG_upv_1.panicDistFromBottomPx))
    else
        a1:die()
        return nil
    end
end
u25.updateGroundSupport = function(a1)
    --[[
      name: updateGroundSupport
      line: 1221
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v60 = a1.floorSpecs[a1.currentFloor]
    local v61 = nil
    if v60 ~= nil then
        v61 = math.min(a1.playerXPx + ICY_TOWER_CONFIG_upv_1.playerHalfWidthPx, v60.collisionRightPx) - math.max(a1.playerXPx - ICY_TOWER_CONFIG_upv_1.playerHalfWidthPx, v60.collisionLeftPx)
        if v61 > 0 then
            a1.teetering = not v60.fullWidth and (v61 < ICY_TOWER_CONFIG_upv_1.teeterMaxOverlapPx)
            return true
        end
        a1.grounded = false
        a1.velocityYPx = 0
        a1.teetering = false
        return false
    end
    return true
end
u25.applyScroll = function(a1)
    --[[
      name: applyScroll
      line: 1240
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v62 = a1.windowBottomPx + ICY_TOWER_CONFIG_upv_1.logicalWindowPx - a1.playerYPx
    local v63 = ICY_TOWER_CONFIG_upv_1.followAboveWindowPx
    if v62 >= 0 then
        local _ = 0
        for v64, value_8 in ICY_TOWER_CONFIG_upv_1.followCatchUpBands do
            if value_8[1] <= v62 then
                v63 = value_8[2]
            end
        end
    end
    if ICY_TOWER_CONFIG_upv_1.autoScrollActivationPx < a1.totalScrollPx + v63 then
        a1.autoScrollArmed = true
        if a1.scrollLevel <= 0 then
            if not (a1.zeroSpeedSkip) then
                v63 = v63 + 1
            end
        else
            v63 = v63 + a1.scrollLevel
        end
        if a1.scrollLevel < ICY_TOWER_CONFIG_upv_1.autoScrollMaxLevel then
            a1.speedUpCounter = a1.speedUpCounter + 1
            if ICY_TOWER_CONFIG_upv_1.speedUpIntervalTicks < a1.speedUpCounter then
                a1.speedUpCounter = a1.speedUpCounter - ICY_TOWER_CONFIG_upv_1.speedUpIntervalTicks
                a1.scrollLevel = a1.scrollLevel + 1
                a1:onHurryUp()
            end
        end
    end
    a1.zeroSpeedSkip = not a1.zeroSpeedSkip
    if v63 <= 0 then
        return
    end
    a1.windowBottomPx = a1.windowBottomPx + v63
    a1.totalScrollPx = a1.totalScrollPx + v63
end
u25.onHurryUp = function(a1)
    --[[
      name: onHurryUp
      line: 1280
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        u24 (copy, index: 2)
    ]]
    if ICY_TOWER_CONFIG_upv_1.autoScrollMaxLevel <= a1.scrollLevel then
        a1.clockBroken = true
    end
    a1.clockPulseRemaining = 0.9
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("buzz", {})
    local origin_2 = a1.stage.origin
    a1.popups:show(Vector3.new(origin_2.X, (origin_2.Y + a1:windowCenterYStuds(a1.windowBottomPx)) + 8, origin_2.Z + 2), "HURRY UP!", u24, 1.6, 0.9)
end
u25.resolveLanding = function(a1, a2, a3)
    --[[
      name: resolveLanding
      line: 1299
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local floorSpacingPx_1 = ICY_TOWER_CONFIG_upv_1.floorSpacingPx
    local v64 = math.floor(a3 / floorSpacingPx_1)
    local v65 = math.max(math.ceil((a1.playerYPx - 1) / floorSpacingPx_1), 0)
    local v66 = false
    local v66, v67 = v66, v64
    local v68 = nil
    local v69 = nil
    while true do
        if v66 then
            v67 = v67 - 1
        else
            v66 = true
        end
        local v70
        if v65 > v67 or v67 < 0 then
            return
        end
        v68 = v67 * floorSpacingPx_1
        if v68 > a3 or a1.playerYPx >= v68 + 1 then
            continue
        end
        v70 = a1.floorSpecs[v67]
        if v70 == nil then
            continue
        end
        v69 = a2 + (a1.playerXPx - a2) * ((a3 - v68) / (a3 - (a1.playerYPx - 1)))
        if v69 + ICY_TOWER_CONFIG_upv_1.playerHalfWidthPx <= v70.collisionLeftPx then
            continue
        end
        if v70.collisionRightPx > v69 - ICY_TOWER_CONFIG_upv_1.playerHalfWidthPx then
            break
        end
    end
    a1.playerXPx = v69
    a1.playerYPx = v68
    a1.velocityYPx = 0
    a1.grounded = true
    a1.spinning = false
    a1:handleLanding(v67)
    return nil
end
u25.handleLanding = function(a1, a2)
    --[[
      name: handleLanding
      line: 1347
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        u23 (copy, index: 2)
    ]]
    local v71 = a2 - a1.currentFloor
    if ICY_TOWER_CONFIG_upv_1.comboMinFloorsPerJump > v71 then
        if v71 ~= 0 and a1.comboTimer > 0 then
            a1.comboTimer = 1
        end
    else
        if a1.comboTimer <= 0 then
            a1.comboFloors = v71
            a1.comboJumps = 1
        else
            a1.comboFloors = a1.comboFloors + v71
            a1.comboJumps = a1.comboJumps + 1
        end
        a1.comboTimer = ICY_TOWER_CONFIG_upv_1.comboWindowTicks
        a1:burstStars(a1.playerXPx, a1.playerYPx, 1)
    end
    a1.currentFloor = a2
    if a1.maxFloor < a2 then
        local v72 = a1:highestMilestone(a1.maxFloor)
        a1.maxFloor = a2
        a1:updateScore()
        local v73 = a1:highestMilestone(a2)
        if v72 < v73 then
            a1.context.audio.play("perfect", {})
            a1.popups:show(a1:playerWorldPosition() + Vector3.new(0, 6, 2), ("FLOOR %*"):format(v73), u23, 1.2)
        end
    end
    a1.context.audio.play("thud", {})
end
u25.highestMilestone = function(a1, a2)
    --[[
      name: highestMilestone
      line: 1387
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 > ICY_TOWER_CONFIG_upv_1.fullWidthHighCutoff then
        return (math.max(math.floor(a2 / ICY_TOWER_CONFIG_upv_1.fullWidthEveryHigh) * ICY_TOWER_CONFIG_upv_1.fullWidthEveryHigh, ICY_TOWER_CONFIG_upv_1.fullWidthHighCutoff))
    end
    return math.floor(a2 / ICY_TOWER_CONFIG_upv_1.fullWidthEvery) * ICY_TOWER_CONFIG_upv_1.fullWidthEvery
end
u25.completeCombo = function(a1)
    --[[
      name: completeCombo
      line: 1394
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if ICY_TOWER_CONFIG_upv_1.comboMinJumps <= a1.comboJumps then
        a1.bankedScore = a1.bankedScore + (a1.comboFloors * a1.comboFloors)
        a1.comboLinger = ICY_TOWER_CONFIG_upv_1.comboLingerTicks
        a1.lingerFloors = a1.comboFloors
        a1:showComboBanner(a1.comboFloors)
        a1:updateScore()
    end
    a1.comboFloors = 0
    a1.comboJumps = 0
end
u25.showComboBanner = function(a1, a2)
    --[[
      name: showComboBanner
      line: 1405
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        ICY_TOWER_COMBO_VOICES_upv_1 (copy, index: 2)
    ]]
    local v74 = -1
    local v75 = ""
    for _, value_9 in ICY_TOWER_CONFIG_upv_1.comboTiers do
        if value_9[1] <= a2 then
            v74 = v74 + 1
            v75 = value_9[2]
        end
    end
    local v76 = nil
    if v74 >= 0 then
        a1.bannerLabel.Text = v75
        a1.bannerScale = (v74 * 0.22) + 1
        a1.bannerDuration = (ICY_TOWER_CONFIG_upv_1.bannerInSeconds + ICY_TOWER_CONFIG_upv_1.bannerHoldSeconds) + ICY_TOWER_CONFIG_upv_1.bannerOutSeconds
        a1.bannerRemaining = a1.bannerDuration
        a1:burstStars(a1.playerXPx, a1.playerYPx + 40, v74 + 2)
        a1.context.audio.play("scorePing", {pitch = (v74 * 0.07) + 0.9})
        v76 = ICY_TOWER_COMBO_VOICES_upv_1[v75]
        if v76 == nil then
            if v74 >= 2 then
                a1.context.audio.play("perfect", {pitch = (v74 * 0.05) + 1})
            end
            if v74 >= 5 then
                a1.context.audio.play("coinSettle", {})
            end
        else
            a1.context.audio.play(v76.key, {volume = v76.volume})
            return nil
        end
    else
        return nil
    end
end
u25.updateScore = function(a1)
    --[[
      name: updateScore
      line: 1449
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.score = (a1.maxFloor * ICY_TOWER_CONFIG_upv_1.pointsPerFloor) + a1.bankedScore
    if a1.reportedScore >= a1.score then
        return
    end
    a1.reportedScore = a1.score
    a1.context.reportScore(a1.score)
end
u25.die = function(a1)
    --[[
      name: die
      line: 1456
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        a1.spinning = false
        a1:setTrailActive(false)
        a1.deathVelocityPxPerSecond = a1.velocityYPx * ICY_TOWER_CONFIG_upv_1.simTicksPerSecond
        a1.context.audio.play("buzz", {})
        a1.context.audio.play("whoosh", {})
        a1.stage.shake(0.6)
        local score_upv_1 = a1.score
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            ICY_TOWER_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1476
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
end
u25.ensureFloors = function(a1, a2)
    --[[
      name: ensureFloors
      line: 1482
    ]]
    while a1.generatedUpTo < a2 do
        a1.generatedUpTo = a1.generatedUpTo + 1
        a1.floorSpecs[a1.generatedUpTo] = a1:generateFloorSpec(a1.generatedUpTo)
    end
end
u25.generateFloorSpec = function(a1, a2)
    --[[
      name: generateFloorSpec
      line: 1491
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v77 = a1.ladderRandom:NextInteger(0, 32767)
    local v78 = a1.ladderRandom:NextInteger(0, 32767)
    local v79 = true
    if a2 ~= 0 then
        if a2 > ICY_TOWER_CONFIG_upv_1.fullWidthHighCutoff then
            v79 = a2 % ICY_TOWER_CONFIG_upv_1.fullWidthEveryHigh == 0
        else
            v79 = true
            if a2 % ICY_TOWER_CONFIG_upv_1.fullWidthEvery ~= 0 then
                v79 = a2 % ICY_TOWER_CONFIG_upv_1.fullWidthEveryHigh == 0
            end
        end
    end
    if v79 then
        return a1:makeFullWidthSpec(a2)
    else
        local v80 = ICY_TOWER_CONFIG_upv_1.widthBaseTiles
        if a2 >= ICY_TOWER_CONFIG_upv_1.widthFormulaCutoff then
            for _, value_10 in ICY_TOWER_CONFIG_upv_1.widthTailSchedule do
                if value_10[1] <= a2 then
                    v80 = value_10[2]
                end
            end
        else
            v80 = ICY_TOWER_CONFIG_upv_1.widthBaseTiles + v77 % (ICY_TOWER_CONFIG_upv_1.widthRangeBase - math.floor(a2 / ICY_TOWER_CONFIG_upv_1.widthRangeShrinkEvery))
        end
        local v81 = ICY_TOWER_CONFIG_upv_1.placementBaseTile + v78 % (ICY_TOWER_CONFIG_upv_1.placementRange - v80)
        local v82 = v81 * ICY_TOWER_CONFIG_upv_1.tilePx
        local v83 = ((v81 + v80) + 1) * ICY_TOWER_CONFIG_upv_1.tilePx
        local tbl_29 = {}
        tbl_29.index = a2
        tbl_29.leftPx = v82
        tbl_29.rightPx = v83
        tbl_29.collisionLeftPx = v82 - ICY_TOWER_CONFIG_upv_1.floorGraceLeftPx
        tbl_29.collisionRightPx = v83 + ICY_TOWER_CONFIG_upv_1.floorGraceRightPx
        return tbl_29
    end
end
u25.makeFullWidthSpec = function(a1, a2)
    --[[
      name: makeFullWidthSpec
      line: 1523
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tbl_30 = {}
    tbl_30.index = a2
    tbl_30.leftPx = ICY_TOWER_CONFIG_upv_1.wallInnerLeftPx - 24
    tbl_30.rightPx = ICY_TOWER_CONFIG_upv_1.wallInnerRightPx + 24
    tbl_30.collisionLeftPx = -ICY_TOWER_CONFIG_upv_1.towerWidthPx
    tbl_30.collisionRightPx = ICY_TOWER_CONFIG_upv_1.towerWidthPx * 2
    return tbl_30
end
u25.layoutTower = function(a1)
    --[[
      name: layoutTower
      line: 1537
      upvalues:
        pxToStuds_upv_1 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v84 = a1.stage.getVisibleHeight()
    local v85 = a1:frameCenterYStuds(a1.windowBottomPx)
    local v86 = math.max(0, math.floor((((v85 - (v84 / 2)) - 8) / pxToStuds_upv_1) / ICY_TOWER_CONFIG_upv_1.floorSpacingPx))
    local v87 = math.ceil((((v85 + (v84 / 2)) + 8) / pxToStuds_upv_1) / ICY_TOWER_CONFIG_upv_1.floorSpacingPx) + ICY_TOWER_CONFIG_upv_1.lookaheadFloors
    a1:ensureFloors(v87)
    local v88 = math.max(math.min(v86, math.floor(((a1.windowBottomPx - ICY_TOWER_CONFIG_upv_1.deathBelowWindowPx) - 90) / ICY_TOWER_CONFIG_upv_1.floorSpacingPx), a1.currentFloor), 0)
    local lowestSpecIndex_1 = a1.lowestSpecIndex
    local v89 = false
    while true do
        if v89 then
            lowestSpecIndex_1 = lowestSpecIndex_1 + 1
        else
            v89 = true
        end
        if lowestSpecIndex_1 >= v88 then
            break
        end
        a1.floorSpecs[lowestSpecIndex_1] = nil
    end
    a1.lowestSpecIndex = math.max(a1.lowestSpecIndex, v88)
    for _, value_11 in a1.floorSlots do
        if not (value_11.active) then
            continue
        end
        if value_11.floorIndex < v86 or v87 < value_11.floorIndex then
            a1.slotByFloor[value_11.floorIndex] = nil
            a1:parkFloorSlot(value_11)
        end
    end
    for _, v90 in a1.signSlots do
        if not (v90.active) then
            continue
        end
        if v90.floorIndex < v86 or v87 < v90.floorIndex then
            a1.signByFloor[v90.floorIndex] = nil
            a1:parkSignSlot(v90)
        end
    end
    v89, lowestSpecIndex_1 = false, v86
    local v90, v90
    if v89 then
        lowestSpecIndex_1 = lowestSpecIndex_1 + 1
    else
        v89 = true
    end
    if lowestSpecIndex_1 > v87 then
        return
    end
    if a1.slotByFloor[lowestSpecIndex_1] == nil then
        a1:claimFloorSlot(lowestSpecIndex_1)
    end
    v90 = false
    if lowestSpecIndex_1 > 0 then
        v90 = lowestSpecIndex_1 % ICY_TOWER_CONFIG_upv_1.signEvery == 0
    end
    if v90 then
        v90 = a1.signByFloor[lowestSpecIndex_1] == nil
    end
    if v90 then
        a1:claimSignSlot(lowestSpecIndex_1)
    end
    if v89 then
        lowestSpecIndex_1 = lowestSpecIndex_1 + 1
    else
        v89 = true
    end
end
u25.claimFloorSlot = function(a1, a2)
    --[[
      name: claimFloorSlot
      line: 1612
      upvalues:
        pxToStuds_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    local v91 = a1.floorSpecs[a2]
    if v91 ~= nil then
        local v92
        v92 = nil
        for _, value_12 in a1.floorSlots do
            if not value_12.active then
                v92 = value_12
                break
            end
        end
        local v93
        if v92 ~= nil then
            v93 = v92
            v93.active = true
            v93.floorIndex = a2
            a1.slotByFloor[a2] = v93
            a1:applyFloorTheme(v93, v91, (((v91.leftPx + v91.rightPx) / 2) - u5) * pxToStuds_upv_1, a2 * u6, (v91.rightPx - v91.leftPx) * pxToStuds_upv_1)
        else
            v93 = v92
            for _, value_13 in a1.floorSlots do
                if v93 == nil or value_13.floorIndex < v93.floorIndex then
                    v93 = value_13
                end
            end
            if v93 ~= nil then
                a1.slotByFloor[v93.floorIndex] = nil
                a1:parkFloorSlot(v93)
                v93.active = true
                v93.floorIndex = a2
                a1.slotByFloor[a2] = v93
                a1:applyFloorTheme(v93, v91, (((v91.leftPx + v91.rightPx) / 2) - u5) * pxToStuds_upv_1, a2 * u6, (v91.rightPx - v91.leftPx) * pxToStuds_upv_1)
            else
                return nil
            end
        end
    else
        return nil
    end
end
u25.applyFloorTheme = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: applyFloorTheme
      line: 1659
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_12 (copy, index: 2)
        tbl_upv_15 (copy, index: 3)
        u7 (copy, index: 4)
        u2 (copy, index: 5)
    ]]
    local v94 = math.min(math.floor(a3.index / ICY_TOWER_CONFIG_upv_1.themeEvery), #tbl_upv_12 - 1)
    local v95 = a1.debugTierOverride
    if v95 == nil then
        v95 = v94
    end
    a2.themeTier = v95
    if a1.authoredFloorsFolder ~= nil and tbl_upv_15[v95] ~= nil and a1:applyAuthoredFloor(a2, v95, a4, a5, a6) then
        return nil
    end
    a1:parkAuthoredFloor(a2)
    local v96 = tbl_upv_12[v95 + 1]
    local origin_3 = a1.stage.origin
    local v97 = v95 == 7
    local v98 = v95 == 5
    local v99
    if v98 then
        v99 = u7 * 0.55
    else
        v99 = u7
    end
    local part_1 = a2.part
    local v100
    if v97 then
        v100 = Enum.PartType.Cylinder
    else
        v100 = Enum.PartType.Block
    end
    part_1.Shape = v100
    a2.part.Size = Vector3.new(a6, v99, u7)
    a2.part.CFrame = CFrame.new(origin_3 + Vector3.new(a4, a5 - (v99 / 2), 0))
    local part_2 = a2.part
    local v101
    if v95 ~= 9 then
        v101 = v96.base
    else
        v101 = Color3.fromHSV((a3.index % 10) / 10, 0.62, 0.95)
    end
    part_2.Color = v101
    a2.part.Transparency = v96.transparency
    if v96.smoothFaces ~= true or v97 then
        if v97 then
            v100 = Enum.SurfaceType.Weld
        else
            v100 = Enum.SurfaceType.Studs
        end
        a2.part.TopSurface = v100
        a2.part.BackSurface = v100
        a2.part.BottomSurface = Enum.SurfaceType.Weld
        a2.part.FrontSurface = Enum.SurfaceType.Weld
        local part_3 = a2.part
        local v102
        if v97 then
            v102 = Enum.SurfaceType.Weld
        else
            v102 = Enum.SurfaceType.Smooth
        end
        part_3.LeftSurface = v102
        local part_4 = a2.part
        if v97 then
            v102 = Enum.SurfaceType.Weld
        else
            v102 = Enum.SurfaceType.Smooth
        end
        part_4.RightSurface = v102
    else
        a2.part.TopSurface = Enum.SurfaceType.Smooth
        a2.part.BackSurface = Enum.SurfaceType.Smooth
        a2.part.BottomSurface = Enum.SurfaceType.Smooth
        a2.part.FrontSurface = Enum.SurfaceType.Smooth
        a2.part.LeftSurface = Enum.SurfaceType.Smooth
        a2.part.RightSurface = Enum.SurfaceType.Smooth
    end
    if v96.accent == nil then
        a2.accent.CFrame = u2
    else
        a2.accent.Color = v96.accent
        a2.accent.Size = Vector3.new(math.max(a6 - 0.3, 0.6), 0.26, ICY_TOWER_CONFIG_upv_1.platformDepthStuds + 0.12)
        a2.accent.CFrame = CFrame.new(origin_3 + Vector3.new(a4, a5 - 0.05, 0))
    end
    local v103 = a6 / 2
    local v104 = a5 - u7 / 2
    if v95 ~= 10 then
        for _, value_14 in a2.glassEdges do
            value_14.CFrame = u2
        end
    else
        local v105 = ICY_TOWER_CONFIG_upv_1.platformDepthStuds + 0.12
        local v106 = math.max(u7 - 0.48, 0.2)
        local glassEdges_1 = a2.glassEdges
        local v107 = glassEdges_1[1]
        local v108 = glassEdges_1[2]
        local v109 = glassEdges_1[3]
        local v110 = glassEdges_1[4]
        v107.Size = Vector3.new(a6, 0.24, v105)
        v108.Size = Vector3.new(a6, 0.24, v105)
        v109.Size = Vector3.new(0.24, v106, v105)
        v110.Size = Vector3.new(0.24, v106, v105)
        v107.CFrame = CFrame.new(origin_3 + Vector3.new(a4, a5 - 0.12, 0))
        v108.CFrame = CFrame.new(origin_3 + Vector3.new(a4, (a5 - u7) + 0.12, 0))
        v109.CFrame = CFrame.new(origin_3 + Vector3.new((a4 - v103) + 0.12, v104, 0))
        v110.CFrame = CFrame.new(origin_3 + Vector3.new((a4 + v103) - 0.12, v104, 0))
        local v111 = Color3.fromHSV((a3.index % 10) / 10, 0.62, 0.95)
        for _, value_15 in a2.glassEdges do
            value_15.Color = v111
        end
    end
    if not (v97) or a3.fullWidth then
        a2.flangeLeft.CFrame = u2
        a2.flangeRight.CFrame = u2
    else
        local v102 = v96.propColor or (v96.base)
        local v112 = u7 + 0.45
        local v113 = v103 - 0.5
        a2.flangeLeft.Color = v102
        a2.flangeRight.Color = v102
        a2.flangeLeft.Size = Vector3.new(1, v112, v112)
        a2.flangeRight.Size = Vector3.new(1, v112, v112)
        a2.flangeLeft.CFrame = CFrame.new(origin_3 + Vector3.new(a4 - v113, v104, 0))
        a2.flangeRight.CFrame = CFrame.new(origin_3 + Vector3.new(a4 + v113, v104, 0))
    end
    if v96.propKind ~= "none" and v96.propKind ~= "rim" and not (a3.fullWidth) then
        local v102 = v96.propColor or (v96.base)
        a2.propLeft.Color = v102
        a2.propRight.Color = v102
        local v114 = Vector3.new(0.800000011920929, 1.100000023841858, 0.800000011920929)
        local v115 = -u7 / 2 - 0.42
        local v116 = v103 - 0.6
        if v96.propKind == "knob" then
            v114, v116, v115 = Vector3.new(0.8500000238418579, 1.899999976158142, 1.899999976158142), v103, (u7 - v99) / 2
        elseif v96.propKind == "leaf" then
            local v117 = Vector3.new(1.350000023841858, 0.5, 1.0499999523162842)
            v115 = u7 / 2 + 0.18
            v114, v116 = v117, v103 - 0.5
        elseif v96.propKind == "puff" then
            local v118 = Vector3.new(1.899999976158142, 1.0499999523162842, 2.0999999046325684)
            v115 = -u7 / 2 - 0.3
            v114, v116 = v118, v103 - 0.8
        end
        a2.propLeft.Size = v114
        a2.propRight.Size = v114
        a2.propLeft.CFrame = CFrame.new(origin_3 + Vector3.new(a4 - v116, v104 + v115, 0))
        a2.propRight.CFrame = CFrame.new(origin_3 + Vector3.new(a4 + v116, v104 + v115, 0))
        return
    end
    a2.propLeft.CFrame = u2
    a2.propRight.CFrame = u2
    return nil
end
u25.applyAuthoredFloor = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: applyAuthoredFloor
      line: 1802
      upvalues:
        tbl_upv_14 (copy, index: 1)
        cloneAuthoredFloorUnit_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    local v119
    if a2.authoredTier ~= a3 then
        if a2.authoredModel ~= nil then
            a2.authoredModel:Destroy()
            a2.authoredModel = nil
            a2.authoredUnit = nil
        end
        local authoredUnit_1 = a1.authoredFloorsFolder
        if authoredUnit_1 ~= nil then
            authoredUnit_1 = authoredUnit_1:FindFirstChild(tbl_upv_14[a3 + 1])
        end
        local v120
        if v119 ~= nil and (v119:IsA("Model")) then
            v120 = cloneAuthoredFloorUnit_upv_1(v119, a1.stage.container)
        else
            v120 = nil
        end
        if v120 ~= nil then
            a2.authoredModel = v120.model
            a2.authoredUnit = v120
        end
        local v121
        if v120 == nil then
            v121 = -1
        else
            v121 = a3
        end
        a2.authoredTier = v121
    end
    local authoredUnit_1 = a2.authoredUnit
    if authoredUnit_1 ~= nil then
        a2.part.CFrame = u2
        a2.accent.CFrame = u2
        a2.propLeft.CFrame = u2
        a2.propRight.CFrame = u2
        a2.flangeLeft.CFrame = u2
        a2.flangeRight.CFrame = u2
        local origin_4 = nil
        local v122 = nil
        for _, value_16 in a2.glassEdges do
            value_16.CFrame = u2
        end
        origin_4 = a1.stage.origin
        v122 = a5 - authoredUnit_1.slabSizeY / 2
        authoredUnit_1.slab.Size = Vector3.new(a6, authoredUnit_1.slabSizeY, authoredUnit_1.slabSizeZ)
        authoredUnit_1.slab.CFrame = CFrame.new(origin_4 + Vector3.new(a4, v122, 0))
        if authoredUnit_1.accent ~= nil then
            authoredUnit_1.accent.Size = Vector3.new(math.max(a6 - authoredUnit_1.accentMargin, 0.5), authoredUnit_1.accentSizeY, authoredUnit_1.accentSizeZ)
            authoredUnit_1.accent.CFrame = CFrame.new(origin_4 + Vector3.new(a4, v122 + authoredUnit_1.accentYOff, 0))
        end
        local Position_1 = nil
        for _, value_17 in authoredUnit_1.props do
            Position_1 = value_17.localCFrame.Position
            value_17.part.CFrame = CFrame.new(origin_4 + Vector3.new(a4 + (Position_1.X + (math.sign(Position_1.X) * ((a6 - authoredUnit_1.authoredWidth) / 2))), v122 + Position_1.Y, Position_1.Z)) * value_17.localCFrame.Rotation
        end
        return true
    end
    return false
end
u25.parkAuthoredFloor = function(a1, a2)
    --[[
      name: parkAuthoredFloor
      line: 1857
      upvalues:
        u2 (copy, index: 1)
    ]]
    local authoredUnit_2 = a2.authoredUnit
    if authoredUnit_2 ~= nil then
        authoredUnit_2.slab.CFrame = u2
        if authoredUnit_2.accent ~= nil then
            authoredUnit_2.accent.CFrame = u2
        end
        for _, value_18 in authoredUnit_2.props do
            value_18.part.CFrame = u2
        end
    else
        return nil
    end
end
u25.restyleActiveFloors = function(a1)
    --[[
      name: restyleActiveFloors
      line: 1870
      upvalues:
        pxToStuds_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    local v123 = nil
    for _, value_19 in a1.floorSlots do
        if not (value_19.active) then
            continue
        end
        v123 = a1.floorSpecs[value_19.floorIndex]
        if v123 ~= nil then
            a1:applyFloorTheme(value_19, v123, (((v123.leftPx + v123.rightPx) / 2) - u5) * pxToStuds_upv_1, value_19.floorIndex * u6, (v123.rightPx - v123.leftPx) * pxToStuds_upv_1)
        end
    end
end
u25.claimSignSlot = function(a1, a2)
    --[[
      name: claimSignSlot
      line: 1887
      upvalues:
        u5 (copy, index: 1)
        pxToStuds_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
        u7 (copy, index: 4)
    ]]
    local v124 = a1.floorSpecs[a2]
    if v124 ~= nil then
        local v125
        v125 = nil
        for _, value_20 in a1.signSlots do
            if not value_20.active then
                v125 = value_20
                break
            end
        end
        local v126
        if v125 ~= nil then
            v126 = v125
            v126.active = true
            v126.floorIndex = a2
            a1.signByFloor[a2] = v126
            v126.label.Text = ("%*"):format(a2)
            local origin_5 = a1.stage.origin
            local v127 = (((v124.leftPx + v124.rightPx) / 2) - u5) * pxToStuds_upv_1
            local v128 = a2 * u6 - u7
            v126.plaque.CFrame = CFrame.new(origin_5 + Vector3.new(v127, (v128 - 0.85) - 0.75, 0))
            v126.chainLeft.CFrame = CFrame.new(origin_5 + Vector3.new(v127 - 1, v128 - 0.42, 0))
            v126.chainRight.CFrame = CFrame.new(origin_5 + Vector3.new(v127 + 1, v128 - 0.42, 0))
        else
            v126 = v125
            for _, value_21 in a1.signSlots do
                if v126 == nil or value_21.floorIndex < v126.floorIndex then
                    v126 = value_21
                end
            end
            if v126 ~= nil then
                a1.signByFloor[v126.floorIndex] = nil
                a1:parkSignSlot(v126)
                v126.active = true
                v126.floorIndex = a2
                a1.signByFloor[a2] = v126
                v126.label.Text = ("%*"):format(a2)
                local origin_5 = a1.stage.origin
                local v127 = (((v124.leftPx + v124.rightPx) / 2) - u5) * pxToStuds_upv_1
                local v128 = a2 * u6 - u7
                v126.plaque.CFrame = CFrame.new(origin_5 + Vector3.new(v127, (v128 - 0.85) - 0.75, 0))
                v126.chainLeft.CFrame = CFrame.new(origin_5 + Vector3.new(v127 - 1, v128 - 0.42, 0))
                v126.chainRight.CFrame = CFrame.new(origin_5 + Vector3.new(v127 + 1, v128 - 0.42, 0))
            else
                return nil
            end
        end
    else
        return nil
    end
end
u25.parkFloorSlot = function(a1, a2)
    --[[
      name: parkFloorSlot
      line: 1940
      upvalues:
        u2 (copy, index: 1)
    ]]
    a2.active = false
    a2.floorIndex = -1
    a2.themeTier = -1
    a2.part.CFrame = u2
    a2.accent.CFrame = u2
    a2.propLeft.CFrame = u2
    a2.propRight.CFrame = u2
    a2.flangeLeft.CFrame = u2
    a2.flangeRight.CFrame = u2
    for _, value_22 in a2.glassEdges do
        value_22.CFrame = u2
    end
    a1:parkAuthoredFloor(a2)
end
u25.parkSignSlot = function(a1, a2)
    --[[
      name: parkSignSlot
      line: 1956
      upvalues:
        u2 (copy, index: 1)
    ]]
    a2.active = false
    a2.floorIndex = -1
    a2.plaque.CFrame = u2
    a2.chainLeft.CFrame = u2
    a2.chainRight.CFrame = u2
end
u25.windowCenterYStuds = function(a1, a2)
    --[[
      name: windowCenterYStuds
      line: 1963
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        pxToStuds_upv_1 (copy, index: 2)
    ]]
    return (a2 + (ICY_TOWER_CONFIG_upv_1.logicalWindowPx / 2)) * pxToStuds_upv_1
end
u25.frameCenterYStuds = function(a1, a2)
    --[[
      name: frameCenterYStuds
      line: 1966
      upvalues:
        u8 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v129 = a1.stage.getVisibleHeight()
    return a1:windowCenterYStuds(a2) + ((v129 - u8) * ICY_TOWER_CONFIG_upv_1.portraitCenterBias)
end
u25.render = function(a1, a2)
    --[[
      name: render
      line: 1970
      upvalues:
        u4 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        pxToStuds_upv_1 (copy, index: 3)
        u5 (copy, index: 4)
        u9 (copy, index: 5)
        u10 (copy, index: 6)
    ]]
    a1:updateGhosts(a2)
    local v130 = math.clamp(a1.simAccumulator / u4, 0, 1)
    local v131 = a1.renderPrevYPx + (a1.playerYPx - a1.renderPrevYPx) * v130
    local v132 = a1.renderPrevWindowPx + (a1.windowBottomPx - a1.renderPrevWindowPx) * v130
    local v133 = a1.renderPrevSpin + (a1.spinDegrees - a1.renderPrevSpin) * v130
    local origin_6 = a1.stage.origin
    local v134 = os.clock()
    local v135 = a1.stage.getVisibleHeight()
    a1 = a1.stage.getFrameWidth()
    local v136 = a1:frameCenterYStuds(v132)
    a1.stage.setFrameCenter(Vector2.new(0, v136))
    a1:layoutTower()
    if a1.authoredBackdropsActive then
        a1:updateBackdrop(v136)
    else
        local v137 = ICY_TOWER_CONFIG_upv_1.wallTileHeightPx * pxToStuds_upv_1
        local v138 = v136 * (ICY_TOWER_CONFIG_upv_1.wallParallax - 1)
        local v139 = math.floor(((v136 - (v135 / 2)) + v138) / v137) - 1
        local v140 = (ICY_TOWER_CONFIG_upv_1.wallInnerLeftPx - u5) * pxToStuds_upv_1 - ICY_TOWER_CONFIG_upv_1.wallThicknessStuds / 2
        local v141 = (ICY_TOWER_CONFIG_upv_1.wallInnerRightPx - u5) * pxToStuds_upv_1 + ICY_TOWER_CONFIG_upv_1.wallThicknessStuds / 2
        local v142 = nil
        for n_2 = 0, ICY_TOWER_CONFIG_upv_1.wallTilesPerSide - 1 do
            local v143
            v143 = v139 + n_2
            local v144 = (v143 * v137) - v138 + v137 / 2
            if v143 % 2 ~= 0 then
                v142 = u10
            else
                v142 = u9
            end
            local v145 = a1.wallTilesLeft[n_2 + 1]
            v145.brick.Color = v142
            v145.brick.CFrame = CFrame.new(origin_6 + Vector3.new(v140, v144, 0))
            v145.seam.CFrame = CFrame.new(origin_6 + Vector3.new(v140, v144 - (v137 / 2), 0))
            local v146 = a1.wallTilesRight[n_2 + 1]
            v146.brick.Color = v142
            v146.brick.CFrame = CFrame.new(origin_6 + Vector3.new(v141, v144, 0))
            v146.seam.CFrame = CFrame.new(origin_6 + Vector3.new(v141, v144 - (v137 / 2), 0))
        end
        a1.curtainLeft.CFrame = CFrame.new(origin_6 + Vector3.new((v140 - (ICY_TOWER_CONFIG_upv_1.wallThicknessStuds / 2)) - 45, v136, -3))
        a1.curtainRight.CFrame = CFrame.new(origin_6 + Vector3.new((v141 + (ICY_TOWER_CONFIG_upv_1.wallThicknessStuds / 2)) + 45, v136, -3))
        a1.backdrop.CFrame = CFrame.new(origin_6 + Vector3.new(0, v136, -40))
        local backdropMortarSpacingStuds_1 = ICY_TOWER_CONFIG_upv_1.backdropMortarSpacingStuds
        local v147 = math.floor((v136 - ((ICY_TOWER_CONFIG_upv_1.backdropMortarCount / 2) * backdropMortarSpacingStuds_1)) / backdropMortarSpacingStuds_1)
        for n_3 = 0, #a1.mortarLines - 1 do
            a1.mortarLines[n_3 + 1].CFrame = CFrame.new(origin_6 + Vector3.new(0, (v147 + n_3) * backdropMortarSpacingStuds_1, -6))
        end
    end
    local v148 = (v132 - ICY_TOWER_CONFIG_upv_1.deathBelowWindowPx) * pxToStuds_upv_1
    a1.mistNear.CFrame = CFrame.new(origin_6 + Vector3.new(math.sin(v134 * 0.7) * 1.2, v148 + 0.6, 1.6))
    a1.mistFar.CFrame = CFrame.new(origin_6 + Vector3.new(math.sin((v134 * 0.4) + 2) * 1.6, v148 - 1.2, -2))
    local v149
    if a1.spectating then
        v149 = -1e+05
    else
        v149 = v131
    end
    a1:posePlayer(a1.renderPrevXPx + ((a1.playerXPx - a1.renderPrevXPx) * v130), v149, v133, a2, v134)
    a1:renderHud(a2, v132, v135, v134)
    a1:animateThemeEffects(v134)
end
u25.animateThemeEffects = function(a1, a2)
    --[[
      name: animateThemeEffects
      line: 2041
    ]]
    local v150 = a2 * 0.35 % 1
    local v151 = nil
    local _ = nil
    local v153 = nil
    local v152 = nil
    for v154, v152 in a1.floorSlots do
        if not (v152.active) then
            continue
        end
        if v152.themeTier == 9 then
            v152.part.Color = Color3.fromHSV((v150 + ((v152.floorIndex % 10) / 10)) % 1, 0.62, 0.95)
            continue
        end
        if v152.themeTier ~= 10 then
            continue
        end
        v151 = Color3.fromHSV((v150 + ((v152.floorIndex % 10) / 10)) % 1, 0.62, 0.95)
        v152 = nil
        for v155, value_23 in v152.glassEdges do
            value_23.Color = v151
        end
    end
end
u25.posePlayer = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: posePlayer
      line: 2060
      upvalues:
        u5 (copy, index: 1)
        pxToStuds_upv_1 (copy, index: 2)
    ]]
    local v153 = a1:rigState()
    local v154
    if v153 == "spin" or math.abs(a1.velocityXPx) < 1.2 then
        v154 = 0
    else
        v154 = math.sign(a1.velocityXPx) * 38
    end
    a1.facingYaw = a1.facingYaw + ((v154 - a1.facingYaw) * math.min(a5 * 10, 1))
    a1.rig:pose(CFrame.new(a1.stage.origin + Vector3.new((a2 - u5) * pxToStuds_upv_1, a3 * pxToStuds_upv_1, 1.1)) * CFrame.Angles(0, math.rad(a1.facingYaw), 0), {state = v153, facing = a1.facing, runPhase = a1.runPhase, spinDegrees = a4, clock = a6})
    local v155 = a1:isRunning() and (not a1.grounded and (a1.comboTimer > 0))
    if v155 ~= a1.trailActive then
        a1:setTrailActive(v155)
    end
    if not v155 then
        return
    end
    a1.trailAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new((a2 - u5) * pxToStuds_upv_1, (a3 * pxToStuds_upv_1) + 2, 1.4))
end
u25.rigState = function(a1)
    --[[
      name: rigState
      line: 2087
    ]]
    if a1.dead then
        return "fall"
    end
    if a1.grounded then
        if a1.panicking then
            return "panic"
        end
        if a1.teetering then
            return "teeter"
        elseif math.abs(a1.velocityXPx) <= 0.2 then
            return "idle"
        else
            return "run"
        end
    end
    if a1.spinning then
        return "spin"
    elseif a1.velocityYPx <= 2 then
        if a1.velocityYPx >= -2 then
            return "hang"
        end
        return "fall"
    else
        return "rise"
    end
end
u25.applyHudScale = function(a1, a2)
    --[[
      name: applyHudScale
      line: 2111
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.clockRim.Size = Vector3.new(0.30000001192092896, 3.5999999046325684, 3.5999999046325684) * a2
    a1.clockFace.Size = Vector3.new(0.41999998688697815, 3.0999999046325684, 3.0999999046325684) * a2
    a1.clockHand.Size = Vector3.new(0.18000000715255737, 1.25, 0.1599999964237213) * a2
    a1.clockBellLeft.Size = Vector3.new(0.8999999761581421, 0.699999988079071, 0.6000000238418579) * a2
    a1.clockBellRight.Size = Vector3.new(0.8999999761581421, 0.699999988079071, 0.6000000238418579) * a2
    a1.clockCrack.Size = Vector3.new(0.14000000059604645, 2.5999999046325684, 0.10000000149011612) * a2
    a1.meterFrame.Size = Vector3.new(1, 8.800000190734863, 0.5) * a2
    a1.badgeBillboard.Size = UDim2.fromScale(u1.X * a2, u1.Y * a2)
    for _, value_24 in a1.clockDressingBase do
        value_24.part.Size = value_24.size * a2
    end
end
u25.renderHud = function(a1, a2, a3, a4, a5)
    --[[
      name: renderHud
      line: 2134
      upvalues:
        u8 (copy, index: 1)
        ICY_TOWER_CONFIG_upv_1 (copy, index: 2)
        u3 (copy, index: 3)
        u2 (copy, index: 4)
    ]]
    local origin_7 = a1.stage.origin
    local v156 = a1:windowCenterYStuds(a3)
    local v157 = v156 + u8 / 2
    local v158 = math.clamp(a4 / u8, 1, 2)
    a1.hudScale = v158
    if v158 ~= a1.appliedHudScale then
        a1:applyHudScale(v158)
        a1.appliedHudScale = v158
    end
    if a1.clockPulseRemaining > 0 then
        a1.clockPulseRemaining = math.max(a1.clockPulseRemaining - a2, 0)
    end
    local v159 = ((a1.clockPulseRemaining <= 0) and 0) or (math.sin(a1.clockPulseRemaining * 24) * 0.18)
    local v160 = v157 + (((v157 + ((a4 - u8) * (ICY_TOWER_CONFIG_upv_1.portraitCenterBias + 0.5))) - v157) * ICY_TOWER_CONFIG_upv_1.clockPortraitLift) - v158 * 4.6
    local v161
    if a1.clockBroken then
        v161 = CFrame.Angles(0, 0, 0.24434609527920614)
    else
        v161 = CFrame.Angles(0, 0, v159)
    end
    local v162 = CFrame.new(origin_7 + Vector3.new((v159 * 0.4) + -16.5, v160, 2)) * v161
    if a1.clockDressing == nil then
        a1.clockRim.CFrame = v162 * u3
        a1.clockFace.CFrame = (v162 * CFrame.new(0, 0, v158 * 0.1)) * u3
    else
        local offset_1 = nil
        for _, value_25 in a1.clockDressingBase do
            offset_1 = value_25.offset
            value_25.part.CFrame = v162 * ((offset_1 - offset_1.Position) + (offset_1.Position * v158))
        end
    end
    a1.clockBellLeft.CFrame = v162 * CFrame.new(v158 * -1.1, v158 * 1.6, 0) * CFrame.Angles(0, 0, 0.4886921905584123)
    a1.clockBellRight.CFrame = v162 * CFrame.new(v158 * 1.1, v158 * 1.6, 0) * CFrame.Angles(0, 0, -0.4886921905584123)
    a1.clockHand.CFrame = v162 * CFrame.Angles(0, 0, -(((a1.clockBroken) and 3.490658503988659) or ((a1.speedUpCounter / ICY_TOWER_CONFIG_upv_1.speedUpIntervalTicks) * math.pi * 2))) * CFrame.new(0, v158 * 0.5, v158 * 0.32)
    local v163
    if a1.clockBroken then
        v163 = v162 * CFrame.new(v158 * 0.2, 0, v158 * 0.35) * CFrame.Angles(0, 0, 0.4188790204786391)
    else
        v163 = u2
    end
    a1.clockCrack.CFrame = v163
    local v164
    if a1.comboTimer > 0 then
        v164 = true
    else
        v164 = false
    end
    local v165 = v164 or (a1.comboLinger > 0)
    local v169 = nil
    if v164 then
        v169 = v156 - v158 * 2
        a1.meterFrame.CFrame = CFrame.new(origin_7 + Vector3.new(-19.3, v169, 1.6))
        local v167 = math.max((v158 * 8.3) * (a1.comboTimer / ICY_TOWER_CONFIG_upv_1.comboWindowTicks), 0.05)
        a1.meterFill.Size = Vector3.new(v158 * 0.62, v167, v158 * 0.55)
        a1.meterFill.CFrame = CFrame.new(origin_7 + Vector3.new(-19.3, (v169 - (v158 * 4.15)) + (v167 / 2), 1.7))
    else
        a1.meterFrame.CFrame = u2
        a1.meterFill.CFrame = u2
    end
    local v168 = nil
    if v165 then
        if a1.comboTimer <= 0 then
            v169 = a1.lingerFloors
        else
            v169 = a1.comboFloors
        end
        v168 = ("%*\nFLOORS"):format(v169)
        if a1.badgeLabel.Text ~= v168 then
            a1.badgeLabel.Text = v168
        end
        a1.badgeLabel.TextColor3 = Color3.fromHSV((a5 * 0.9) % 1, 0.65, 1)
        a1.badgeAnchor.CFrame = CFrame.new(origin_7 + Vector3.new(-19.3, v156 - (v158 * 8.4), 1.6))
    else
        a1.badgeAnchor.CFrame = u2
    end
    if a1.bannerRemaining > 0 then
        a1.bannerRemaining = math.max(a1.bannerRemaining - a2, 0)
        v169 = a1.bannerDuration - a1.bannerRemaining
        v168 = 1
        if v169 >= ICY_TOWER_CONFIG_upv_1.bannerInSeconds then
            if a1.bannerRemaining < ICY_TOWER_CONFIG_upv_1.bannerOutSeconds then
                v168 = a1.bannerRemaining / ICY_TOWER_CONFIG_upv_1.bannerOutSeconds
            end
        else
            v168 = math.sin(((v169 / ICY_TOWER_CONFIG_upv_1.bannerInSeconds) * math.pi) / 2)
        end
        local v170 = a1.bannerScale * ((math.min(v169 / ICY_TOWER_CONFIG_upv_1.bannerInSeconds, 1) * 0.4) + 0.6) * a1.hudScale
        a1.bannerBillboard.Size = UDim2.fromScale(16 * v170, 4 * v170)
        a1.bannerLabel.TextTransparency = 1 - v168
        a1.bannerLabel.TextStrokeTransparency = ((1 - v168) * 0.9) + 0.1
        a1.bannerLabel.TextColor3 = Color3.fromHSV((a5 * 1.4) % 1, 0.7, 1)
        a1.bannerAnchor.CFrame = CFrame.new(origin_7 + Vector3.new(0, v156 + 6.5, 2.4))
        if a1.bannerRemaining ~= 0 then
            return
        end
        a1.bannerLabel.TextTransparency = 1
        a1.bannerAnchor.CFrame = u2
    end
end
u25.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 2255
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u25.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 2261
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        approach_upv_1 (copy, index: 2)
    ]]
    local v171 = a1.spectate:value(4)
    if v171 ~= nil then
        a1.windowBottomPx = approach_upv_1(a1.windowBottomPx, math.max(v171 - (ICY_TOWER_CONFIG_upv_1.logicalWindowPx * 0.4), a1.lowestSpecIndex * ICY_TOWER_CONFIG_upv_1.floorSpacingPx), 5, a2)
    end
    a1.renderPrevWindowPx = a1.windowBottomPx
    a1.renderPrevYPx = a1.playerYPx
    a1.renderPrevXPx = a1.playerXPx
    a1:render(a2)
end
u25.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 2276
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1:updateGhosts(a2)
    if a1.dead and a1.spectate:isActive() then
        a1.spectating = true
        a1:spectateStep(a2)
        return nil
    end
    if a1.dead then
        a1.deathVelocityPxPerSecond = math.max(a1.deathVelocityPxPerSecond - (2000 * a2), (-ICY_TOWER_CONFIG_upv_1.terminalFallSpeedPx * ICY_TOWER_CONFIG_upv_1.simTicksPerSecond) * 1.6)
        a1.playerYPx = a1.playerYPx + (a1.deathVelocityPxPerSecond * a2)
        a1.renderPrevYPx = a1.playerYPx
        a1.renderPrevXPx = a1.playerXPx
        a1:render(a2)
    else
        a1:render(a2)
        return nil
    end
end
u25.setTrailActive = function(a1, a2)
    --[[
      name: setTrailActive
      line: 2294
      upvalues:
        u2 (copy, index: 1)
    ]]
    if a1.trailActive ~= a2 then
        a1.trailActive = a2
        for _, value_26 in a1.trailEmitters do
            value_26.Rate = (a2 and 7) or 0
        end
        if not (a2) then
            a1.trailAnchor.CFrame = u2
        end
    else
        return nil
    end
end
u25.burstStars = function(a1, a2, a3, a4)
    --[[
      name: burstStars
      line: 2306
      upvalues:
        u5 (copy, index: 1)
        pxToStuds_upv_1 (copy, index: 2)
    ]]
    a1.burstAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new((a2 - u5) * pxToStuds_upv_1, (a3 * pxToStuds_upv_1) + 1, 1.6))
    for _, value_27 in a1.burstEmitters do
        value_27:Emit(a4)
    end
end
u25.playerWorldPosition = function(a1)
    --[[
      name: playerWorldPosition
      line: 2314
      upvalues:
        u5 (copy, index: 1)
        pxToStuds_upv_1 (copy, index: 2)
    ]]
    return a1.stage.origin + Vector3.new((a1.playerXPx - u5) * pxToStuds_upv_1, a1.playerYPx * pxToStuds_upv_1, 0)
end
u25.reportScore = function(a1, a2)
    --[[
      name: reportScore
      line: 2319
    ]]
    a1.reportedScore = a2
    a1.context.reportScore(a2)
end
local tbl_31 = {}
tbl_31.IcyTowerGame = u25
return tbl_31