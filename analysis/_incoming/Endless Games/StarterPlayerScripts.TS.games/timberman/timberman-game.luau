-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local adoptAvatar_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "avatar-rig").adoptAvatar
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local timbermanTimerAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").timbermanTimerAtom
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local TIMBERMAN_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-config").TIMBERMAN_CONFIG
local TimbermanAvatar_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-avatar").TimbermanAvatar
local loadTimbermanScenery_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-seasons").loadTimbermanScenery
local TIMBERMAN_THEMES_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-themes").TIMBERMAN_THEMES
local conformSeasonFoliage_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-foliage").conformSeasonFoliage
local collectTreeUnits_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-trees").collectTreeUnits
local v3 = RuntimeLib_1.import(script, script.Parent, "timberman-wind")
local applyWind_upv_1 = v3.applyWind
local collectPineWindTrees_upv_1 = v3.collectPineWindTrees
local collectWindTrees_upv_1 = v3.collectWindTrees
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(196, 44, 44)
local u3 = Color3.fromRGB(245, 205, 48)
local u4 = Color3.fromRGB(245, 245, 255)
local u5 = Color3.fromRGB(255, 90, 100)
local u6 = Color3.fromRGB(255, 216, 102)
local u7 = (TIMBERMAN_CONFIG_upv_1.playerFeetY + TIMBERMAN_CONFIG_upv_1.playerBodyHeight) + TIMBERMAN_CONFIG_upv_1.playerHeadSize + 2.5
local u8 = Color3.fromRGB(190, 235, 110)
local u9 = Color3.fromRGB(196, 148, 96)
local u10 = Color3.fromRGB(118, 76, 46)
local u11 = CFrame.Angles(0, 1.5707963267948966, 0)
local u12 = CFrame.new(0, -1500, 0)
local u13 = CFrame.new(1.1, 0.4, -0.9) * CFrame.Angles(-1.5707963267948966, 0, 0.2617993877991494)
local function worldYExtent_1(a1)
    --[[
      name: worldYExtent
      line: 76
    ]]
    local CFrame_1 = a1.CFrame
    return ((math.abs(CFrame_1.RightVector.Y) * a1.Size.X) + (math.abs(CFrame_1.UpVector.Y) * a1.Size.Y)) + (math.abs(CFrame_1.LookVector.Y) * a1.Size.Z)
end
local function trunkTemplateFor_1(a1, a2)
    --[[
      name: trunkTemplateFor
      line: 92
    ]]
    if a2 ~= "left" then
        if a2 ~= "right" then
            return a1.trunkPlain
        end
        return a1.trunkRight
    end
    return a1.trunkLeft
end
local function branchSideFromFlag_1(a1)
    --[[
      name: branchSideFromFlag
      line: 102
    ]]
    if a1 ~= 1 then
        if a1 ~= 2 then
            return "none"
        end
        return "right"
    end
    return "left"
end
local segmentCount_upv_1 = TIMBERMAN_CONFIG_upv_1.segmentCount
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 115
    ]]
    return "TimbermanGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u14 = setmetatable(tbl_1, tbl_2)
u14.__index = u14
u14.new = function(...)
    --[[
      name: new
      line: 121
      upvalues:
        u14 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u14)
    return v4:constructor(...) or v4
end
u14.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 125
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.flingChunks = {}
    a1.branchSides = {}
    a1.chopQueue = {}
    a1.seasonRuntimes = {}
    a1.rootLift = 0
    a1.slotModels = {}
    a1.slotSides = {}
    a1.seasonIndex = 0
    a1.seasonApplied = false
    a1.playerSide = "left"
    a1.replicaTrunk = {}
    a1.replicaBranches = {}
    a1.replicaSlotModels = {}
    a1.replicaSlotSides = {}
    a1.replicaAvatarRequested = false
    a1.replicaLastScore = 0
    a1.replicaDropOffset = 0
    a1.replicaLastChopAt = 0
    a1.replicaChopInterval = TIMBERMAN_CONFIG_upv_1.swingReturnMax
    a1.replicaAppliedDrop = math.huge
    a1.replicaAppliedOffset = math.huge
    a1.squashed = false
    a1.treeDropOffset = 0
    a1.score = 0
    a1.timeRemaining = TIMBERMAN_CONFIG_upv_1.timerStart
    a1.barFlashRemaining = 0
    a1.publishedFill = -1
    a1.publishedWarn = -1
    a1.publishedFlash = -1
    a1.flingIndex = 0
    a1.flingGenerations = {}
    a1.lastPressChopTime = 0
    a1.chopCooldown = 0
    a1.lastChopAt = 0
    a1.chopInterval = TIMBERMAN_CONFIG_upv_1.swingReturnMax
    a1.windAccumulator = 0
    a1.dead = false
    a1.roundToken = 0
    a1.runCounter = 0
    a1.random = Random.new()
    a1.generationRandom = Random.new()
end
u14.buildScene = function(a1)
    --[[
      name: buildScene
      line: 169
      upvalues:
        loadTimbermanScenery_upv_1 (copy, index: 1)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 2)
        makeStagePart_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        u2 (copy, index: 5)
        u3 (copy, index: 6)
        makeSmoothPart_upv_1 (copy, index: 7)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 8)
        u9 (copy, index: 9)
        u10 (copy, index: 10)
        PopupTextPool_upv_1 (copy, index: 11)
        timbermanTimerAtom_upv_1 (copy, index: 12)
        adoptAvatar_upv_1 (copy, index: 13)
        TimbermanAvatar_upv_1 (copy, index: 14)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.stage.setFrameWidthFloor(30)
    a1.scenery = loadTimbermanScenery_upv_1()
    if a1.scenery ~= nil then
        if a1.scenery.animationRig == nil then
            a1:buildAxe(container_1, a1.scenery.axeTemplate)
        end
        a1:applyAuthoredCamera()
    else
        a1:buildProceduralDressing(container_1, origin_1)
    end
    for _ = 0, TIMBERMAN_CONFIG_upv_1.flingPoolSize - 1 do
        local v5 = makeStagePart_upv_1(container_1)
        v5.Size = Vector3.new(TIMBERMAN_CONFIG_upv_1.segmentWidth, TIMBERMAN_CONFIG_upv_1.segmentHeight, TIMBERMAN_CONFIG_upv_1.segmentDepth)
        v5.CFrame = u1
        table.insert(a1.flingChunks, v5)
    end
    a1.playerBody = makeStagePart_upv_1(container_1)
    a1.playerBody.Color = u2
    a1.playerHead = makeStagePart_upv_1(container_1)
    a1.playerHead.Size = Vector3.new(TIMBERMAN_CONFIG_upv_1.playerHeadSize, TIMBERMAN_CONFIG_upv_1.playerHeadSize, TIMBERMAN_CONFIG_upv_1.playerHeadSize)
    a1.playerHead.Color = u3
    a1.chipAnchor = makeSmoothPart_upv_1(container_1)
    a1.chipAnchor.Transparency = 1
    a1.chipAnchor.Size = Vector3.new(1, TIMBERMAN_CONFIG_upv_1.segmentHeight, TIMBERMAN_CONFIG_upv_1.segmentDepth)
    a1.chipAnchor.CFrame = u1
    a1.woodChips = Instance.new("ParticleEmitter")
    a1.woodChips.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.woodChips.Rate = 0
    a1.woodChips.EmissionDirection = Enum.NormalId.Front
    a1.woodChips.Lifetime = NumberRange.new(0.35, 0.7)
    a1.woodChips.Speed = NumberRange.new(8, 16)
    a1.woodChips.SpreadAngle = Vector2.new(35, 35)
    a1.woodChips.Acceleration = Vector3.new(0, -40, 0)
    a1.woodChips.Rotation = NumberRange.new(0, 90)
    a1.woodChips.RotSpeed = NumberRange.new(-240, 240)
    a1.woodChips.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.15)})
    a1.woodChips.Color = ColorSequence.new(u9, u10)
    a1.woodChips.Parent = a1.chipAnchor
    a1.popups = PopupTextPool_upv_1.new(container_1, 4)
    a1.context.janitor:Add(
        function()
            --[[
              line: 219
              upvalues:
                timbermanTimerAtom_upv_1 (copy, index: 1)
            ]]
            return timbermanTimerAtom_upv_1(nil)
        end
    )
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 222
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress(a2, a3)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a4, a5)
                --[[
                  line: 225
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a4, a5)
            end
        )
    )
    local u15 = a1.scenery
    if u15 ~= nil then
        u15 = u15.animationRig
    end
    local tbl_3 = {}
    tbl_3.container = container_1
    tbl_3.janitor = a1.context.janitor
    tbl_3.variant = ((u15 ~= nil) and "r6") or nil
    tbl_3.onAdopted = function(a6)
        --[[
          name: onAdopted
          line: 237
          upvalues:
            a1 (copy, index: 1)
            u15 (copy, index: 2)
            TimbermanAvatar_upv_1 (copy, index: 3)
            u1 (copy, index: 4)
        ]]
        a1.avatarRig = a6
        if u15 ~= nil then
            a1.timbermanAvatar = TimbermanAvatar_upv_1.new(a6, u15)
        end
        a1.playerBody.CFrame = u1
        a1.playerHead.CFrame = u1
        a1:positionPlayer()
    end
    adoptAvatar_upv_1(tbl_3)
end
u14.buildProceduralDressing = function(a1, a2, a3)
    --[[
      name: buildProceduralDressing
      line: 249
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        u8 (copy, index: 5)
        u1 (copy, index: 6)
        collectPineWindTrees_upv_1 (copy, index: 7)
    ]]
    local v6 = makeFrontalBackdrop_upv_1(a1.stage, Color3.fromRGB(12, 14, 18))
    local v7 = makeSmoothPart_upv_1(a2)
    v7.Material = Enum.Material.Neon
    v7.Shape = Enum.PartType.Cylinder
    v7.Size = Vector3.new(0.5, 7, 7)
    v7.CFrame = CFrame.new(a3 + Vector3.new(-26, 22, -30)) * CFrame.Angles(0, 1.5707963267948966, 0)
    local tbl_4 = {}
    local v8 = Random.new(7)
    for _ = 0, 13 do
        local v9 = makeSmoothPart_upv_1(a2)
        v9.Material = Enum.Material.Neon
        local v10 = v8:NextNumber(0.25, 0.55)
        v9.Size = Vector3.new(v10, v10, v10)
        v9.CFrame = CFrame.new(a3 + Vector3.new(v8:NextNumber(-46, 46), v8:NextNumber(6, 30), -32))
        table.insert(tbl_4, v9)
    end
    local tbl_5 = {}
    local v11 = makeSmoothPart_upv_1(a2)
    v11.Size = Vector3.new(70, 16, 4)
    v11.CFrame = CFrame.new(a3 + Vector3.new(-38, TIMBERMAN_CONFIG_upv_1.groundY + 4, -22)) * CFrame.Angles(0, 0, 0.10471975511965978)
    table.insert(tbl_5, v11)
    local v12 = makeSmoothPart_upv_1(a2)
    v12.Size = Vector3.new(80, 20, 4)
    v12.CFrame = CFrame.new(a3 + Vector3.new(40, TIMBERMAN_CONFIG_upv_1.groundY + 5, -22)) * CFrame.Angles(0, 0, -0.08726646259971647)
    table.insert(tbl_5, v12)
    local tbl_6 = {}
    local tbl_7 = {}
    local v13 = Random.new(11)
    local v14 = nil
    local v15 = nil
    local v16 = nil
    for _, value_1 in {-34, -22, -14, 16, 24, 36} do
        v14 = v13:NextNumber(6, 11)
        v15 = makeStagePart_upv_1(a2)
        v15.Size = Vector3.new(1.2, v14, 1.2)
        v15.CFrame = CFrame.new(a3 + Vector3.new(value_1, TIMBERMAN_CONFIG_upv_1.groundY + (v14 / 2), -12))
        table.insert(tbl_6, v15)
        v16 = 5
        for n_1 = 0, 2 do
            local v17 = makeStagePart_upv_1(a2)
            v17.Size = Vector3.new(v16, 1.8, v16)
            v17.CFrame = CFrame.new(a3 + Vector3.new(value_1, (TIMBERMAN_CONFIG_upv_1.groundY + (v14 * 0.55)) + (n_1 * 1.7), -12))
            table.insert(tbl_7, v17)
            v16 = v16 * 0.68
        end
    end
    local tbl_8 = {}
    local tbl_9 = {}
    local v18 = Random.new(23)
    for _ = 0, 9 do
        local v19 = makeStagePart_upv_1(a2)
        v19.Size = Vector3.new(v18:NextNumber(0.6, 1.2), v18:NextNumber(0.5, 1), 0.6)
        v19.CFrame = CFrame.new(a3 + Vector3.new(v18:NextNumber(-40, 40), TIMBERMAN_CONFIG_upv_1.groundY + 1.8, 2))
        table.insert(tbl_8, v19)
        table.insert(tbl_9, (v18:NextNumber(0.1, 0.5)))
    end
    local v20 = makeSmoothPart_upv_1(a2)
    v20.Transparency = 1
    v20.Size = Vector3.new(80, 24, 1)
    v20.CFrame = CFrame.new(a3 + Vector3.new(0, 0, -6))
    local v21 = Instance.new("ParticleEmitter")
    v21.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    v21.Rate = 3
    v21.Lifetime = NumberRange.new(3, 5)
    v21.Speed = NumberRange.new(0.6, 1.6)
    v21.SpreadAngle = Vector2.new(180, 180)
    v21.Size = NumberSequence.new(0.35)
    v21.LightEmission = 1
    v21.Color = ColorSequence.new(u8)
    v21.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0.2), NumberSequenceKeypoint.new(0.8, 0.3), NumberSequenceKeypoint.new(1, 1)})
    v21.Parent = v20
    local v22 = makeStagePart_upv_1(a2)
    v22.Size = Vector3.new(240, 3, 10)
    v22.CFrame = CFrame.new(a3 + Vector3.new(0, TIMBERMAN_CONFIG_upv_1.groundY, 0))
    local tbl_10 = {}
    for n_2 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
        local v23 = makeStagePart_upv_1(a2)
        v23.Size = Vector3.new(TIMBERMAN_CONFIG_upv_1.segmentWidth, TIMBERMAN_CONFIG_upv_1.segmentHeight, TIMBERMAN_CONFIG_upv_1.segmentDepth)
        v23.CFrame = CFrame.new(a3 + Vector3.new(0, a1:levelY(n_2), 0))
        table.insert(tbl_10, v23)
    end
    local tbl_11 = {}
    for _ = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
        local v24 = makeStagePart_upv_1(a2)
        v24.Size = Vector3.new(TIMBERMAN_CONFIG_upv_1.branchLength, TIMBERMAN_CONFIG_upv_1.branchHeight, TIMBERMAN_CONFIG_upv_1.branchDepth)
        v24.CFrame = u1
        table.insert(tbl_11, v24)
    end
    local tbl_12 = {}
    tbl_12.backdrop = v6
    tbl_12.ground = v22
    tbl_12.celestial = v7
    tbl_12.fireflies = v21
    tbl_12.stars = tbl_4
    tbl_12.hills = tbl_5
    tbl_12.pineTrunks = tbl_6
    tbl_12.pineLeaves = tbl_7
    tbl_12.grassTufts = tbl_8
    tbl_12.grassBlends = tbl_9
    tbl_12.trunkSegments = tbl_10
    tbl_12.branches = tbl_11
    tbl_12.windTrees = not (TIMBERMAN_CONFIG_upv_1.wind.enabled) and {} or collectPineWindTrees_upv_1(tbl_6, tbl_7)
    a1.procedural = tbl_12
end
local function normalizeSceneryClone_upv_1(a1)
    --[[
      name: normalizeSceneryClone
      line: 81
    ]]
    for _, value_2 in a1:GetDescendants() do
        if value_2:IsA("BasePart") then
            value_2.Anchored = true
            value_2.CanCollide = false
            value_2.CanQuery = false
            value_2.CanTouch = false
        end
    end
end
u14.buildAxe = function(a1, a2, a3)
    --[[
      name: buildAxe
      line: 385
      upvalues:
        normalizeSceneryClone_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    if a3 ~= nil then
        local v26 = a3:Clone()
        normalizeSceneryClone_upv_1(v26)
        v26:PivotTo(u1)
        v26.Parent = a2
        a1.axe = v26
    else
        return nil
    end
end
u14.planePoint = function(a1, a2, a3, a4)
    --[[
      name: planePoint
      line: 395
    ]]
    if a4 == nil then
        a4 = 0
    end
    local origin_2 = a1.stage.origin
    if a1.scenery == nil then
        return origin_2 + Vector3.new(a2, a3, a4)
    end
    return origin_2 + Vector3.new(-a4, a3, a2)
end
u14.planeVector = function(a1, a2, a3, a4)
    --[[
      name: planeVector
      line: 410
    ]]
    if a4 == nil then
        a4 = 0
    end
    if a1.scenery == nil then
        return (Vector3.new(a2, a3, a4))
    end
    return (Vector3.new(-a4, a3, a2))
end
u14.planeRotation = function(a1)
    --[[
      name: planeRotation
      line: 416
      upvalues:
        u11 (copy, index: 1)
    ]]
    if a1.scenery == nil then
        return CFrame.identity
    end
    return u11
end
u14.applyAuthoredCamera = function(a1)
    --[[
      name: applyAuthoredCamera
      line: 419
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_3 = a1.stage.origin
    local v27 = math.tan(math.rad(a1.stage.camera.FieldOfView / 2))
    local v28 = ((a1.stage.getOrientation() ~= "portrait") and 1) or 1.35
    local v29 = (a1.stage.frameHeight / 2) / v27 * v28
    local ViewportSize_1 = a1.stage.camera.ViewportSize
    local v30 = ViewportSize_1.X / math.max(ViewportSize_1.Y, 1)
    local v31 = a1:duelTreeSpacing()
    local v32 = nil
    if v31 == nil then
        local v33 = CFrame.lookAt(origin_3 + Vector3.new(-v29, 0, 0), origin_3)
        v32 = a1.stage.getViewRect()
        local v34 = nil
        if v32 ~= nil then
            v34 = (v32.x0 + v32.x1) / 2
            if math.abs(v34 - 0.5) >= 0.001 then
                v33 = v33 * CFrame.new((0.5 - v34) * (((2 * v29) * v27) * v30), 0, 0)
            end
        end
        a1.stage.setCameraCFrame(v33)
    else
        v29 = math.max(v29, ((math.abs(v31) + (2 * TIMBERMAN_CONFIG_upv_1.duelCameraMarginX)) / 2) / (v27 * v30))
        local v35 = a1:planePoint(v31 / 2, 0)
        a1.stage.setCameraCFrame(CFrame.lookAt(v35 + Vector3.new(-v29, 0, 0), v35))
        return nil
    end
end
u14.duelTreeSpacing = function(a1)
    --[[
      name: duelTreeSpacing
      line: 462
    ]]
    local activeRuntime_1 = a1.activeRuntime
    if activeRuntime_1 ~= nil then
        activeRuntime_1 = activeRuntime_1.duel
        if activeRuntime_1 ~= nil then
            activeRuntime_1 = activeRuntime_1.treeSpacing
        end
    end
    if activeRuntime_1 ~= nil then
        if a1:isLeftDuelist() then
            return activeRuntime_1
        end
        return -activeRuntime_1
    end
    return nil
end
u14.isDuel = function(a1)
    --[[
      name: isDuel
      line: 476
    ]]
    local v36 = a1.stage.getViewRect() ~= nil
    return v36
end
u14.isLeftDuelist = function(a1)
    --[[
      name: isLeftDuelist
      line: 479
    ]]
    local v37 = a1.stage.getViewRect()
    if v37 ~= nil then
        return ((v37.x0 + v37.x1) / 2) < 0.5
    end
    return true
end
u14.resetRound = function(a1)
    --[[
      name: resetRound
      line: 486
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 2)
        TIMBERMAN_THEMES_upv_1 (copy, index: 3)
    ]]
    a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    local v38 = not a1.seasonApplied or (a1.dead)
    a1.playerSide = "left"
    a1.squashed = false
    a1.score = 0
    a1.timeRemaining = TIMBERMAN_CONFIG_upv_1.timerStart
    a1.barFlashRemaining = 0
    a1.flingIndex = 0
    a1.lastPressChopTime = 0
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    table.clear(a1.chopQueue)
    a1.pendingPressSide = nil
    a1:resetChopCadence()
    local scenery_1 = a1.scenery
    local v39, v40 = nil, nil
    if scenery_1 == nil then
        v39 = TIMBERMAN_THEMES_upv_1[(a1.runCounter % #TIMBERMAN_THEMES_upv_1) + 1]
        a1.runCounter = a1.runCounter + 1
        if v39 ~= nil then
            a1:applyTheme(v39)
        end
    else
        if v38 then
            a1.seasonIndex = a1.runCounter % #scenery_1.seasons
            a1.runCounter = a1.runCounter + 1
        end
        v40 = scenery_1.seasons[a1.seasonIndex + 1]
        if v40 ~= nil then
            a1:applySeason(v40)
        end
        a1.seasonApplied = true
    end
    for n_3 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
        local v41 = ((n_3 == 0) and "none") or (a1.branchSides[n_3])
        local branchSides_1 = a1.branchSides
        branchSides_1[n_3 + 1] = n_3 < TIMBERMAN_CONFIG_upv_1.safeStartSegments and "none" or a1:rollBranchSide(v41)
    end
    a1.treeDropOffset = 0
    a1:layoutBranches()
    a1:applyTreeDropOffset()
    a1:parkFlingChunks()
    a1:positionPlayer()
    a1:publishTimerBar()
    a1.context.reportScore(0)
end
u14.captureRound = function(a1)
    --[[
      name: captureRound
      line: 536
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        local branchSides_2 = a1.branchSides
        local v43 = table.create(#branchSides_2)
        for key_1, value_3 in branchSides_2 do
            v43[key_1] = ((value_3 == "left") and "l") or (((value_3 ~= "right") and "n") or "r")
        end
        local u16 = table.concat(v43, "")
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 551
                  upvalues:
                    a1 (copy, index: 1)
                    u16 (copy, index: 2)
                ]]
                local v44 = a2:int(a1.score):num(a1.timeRemaining)
                v44:bool(a1.playerSide == "right")
                a2:int(a1.seasonIndex):str(u16)
            end
        )
    end
end
u14.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 556
      upvalues:
        readResume_upv_1 (copy, index: 1)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
    ]]
    local v45 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 557
            ]]
            local tbl_13 = {}
            tbl_13.score = a3:int()
            tbl_13.timeRemaining = a3:num()
            tbl_13.playerRight = a3:bool()
            tbl_13.seasonIndex = a3:int()
            tbl_13.sides = a3:str()
            return tbl_13
        end
    )
    if v45 ~= nil and #v45.sides == TIMBERMAN_CONFIG_upv_1.segmentCount and v45.timeRemaining > 0 then
        for n_4 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
            local v46 = string.sub(v45.sides, n_4 + 1, n_4 + 1)
            a1.branchSides[n_4 + 1] = ((v46 == "l") and "left") or (((v46 ~= "r") and "none") or "right")
        end
        a1.score = a2.score
        a1.timeRemaining = math.min(v45.timeRemaining, TIMBERMAN_CONFIG_upv_1.timerMax)
        a1.playerSide = ((v45.playerRight) and "right") or "left"
        a1.squashed = false
        a1.dead = false
        a1.barFlashRemaining = 0
        a1.flingIndex = 0
        a1.lastPressChopTime = 0
        a1.roundToken = a1.roundToken + 1
        table.clear(a1.chopQueue)
        a1.pendingPressSide = nil
        a1:resetChopCadence()
        a1.treeDropOffset = 0
        a1:layoutBranches()
        a1:applyTreeDropOffset()
        a1:parkFlingChunks()
        a1:positionPlayer()
        a1.publishedFill = -1
        a1.publishedWarn = -1
        a1.publishedFlash = -1
        a1:publishTimerBar()
        a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), a1.score + 1)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u14.snapshot = function(a1)
    --[[
      name: snapshot
      line: 610
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tbl_14 = {}
    table.insert(tbl_14, ((a1.playerSide ~= "left") and 1) or 0)
    table.insert(tbl_14, (math.clamp(a1.timeRemaining / TIMBERMAN_CONFIG_upv_1.timerMax, 0, 1)))
    local v47 = nil
    for n_5 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
        local v48
        v48 = a1.branchSides[n_5 + 1]
        if v48 == "none" then
            v47 = 0
            table.insert(tbl_14, v47)
            continue
        end
        if v48 ~= nil then
            v47 = ((v48 ~= "left") and 2) or 1
        else
            v47 = 0
        end
        table.insert(tbl_14, v47)
    end
    local tbl_15 = {}
    tbl_15.score = a1.score
    tbl_15.values = tbl_14
    return tbl_15
end
u14.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 626
    ]]
    a1.matchOpponents = a2
    if a1.replicaJack == nil and a1.stage.getViewRect() ~= nil then
        a1:buildReplica()
    end
    if a1.replicaJack ~= nil then
        a1:adoptReplicaAvatar()
    end
    a1:refreshReplica()
end
u14.replicaOffset = function(a1)
    --[[
      name: replicaOffset
      line: 638
    ]]
    local v49 = a1:duelTreeSpacing()
    local v50 = nil
    if v49 == nil then
        v50 = a1.stage.getViewRect()
        local v51 = nil
        if v50 ~= nil then
            v51 = (v50.x0 + v50.x1) / 2
            if math.abs(v51 - 0.5) >= 0.001 then
                local FieldOfView_1 = a1.stage.camera.FieldOfView
                local v52 = a1.stage.frameHeight / 2 / math.tan(math.rad(FieldOfView_1 / 2))
                local v53 = ((a1.stage.getOrientation() ~= "portrait") and 1) or 1.35
                local ViewportSize_2 = a1.stage.camera.ViewportSize
                local v54 = ViewportSize_2.X / math.max(ViewportSize_2.Y, 1)
                return (1 - (2 * v51)) * (((2 * (v52 * v53)) * math.tan(math.rad(FieldOfView_1 / 2))) * v54)
            end
        end
        return nil
    end
    return v49
end
u14.buildReplica = function(a1)
    --[[
      name: buildReplica
      line: 659
      upvalues:
        segmentCount_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
    ]]
    local container_2 = a1.stage.container
    local procedural_1 = a1.procedural
    if procedural_1 ~= nil then
        local v55, v56 = nil, nil
        if #a1.replicaTrunk == 0 then
            v55 = procedural_1.trunkSegments[1]
            v56 = procedural_1.branches[1]
            if v55 ~= nil and v56 ~= nil then
                for _ = 0, segmentCount_upv_1 - 1 do
                    local v57 = v55:Clone()
                    v57.Parent = container_2
                    table.insert(a1.replicaTrunk, v57)
                    local v58 = v56:Clone()
                    v58.Parent = container_2
                    table.insert(a1.replicaBranches, v58)
                end
            end
        end
    end
    local v59 = makeStagePart_upv_1(container_2)
    v59.Size = Vector3.new(1.2000000476837158, 2.4000000953674316, 1.399999976158142)
    v59.Color = Color3.fromRGB(226, 100, 80)
    a1.replicaJack = v59
end
u14.adoptReplicaAvatar = function(a1)
    --[[
      name: adoptReplicaAvatar
      line: 683
      upvalues:
        adoptAvatar_upv_1 (copy, index: 1)
        TimbermanAvatar_upv_1 (copy, index: 2)
    ]]
    local v60 = nil
    if a1.replicaAvatarRequested then
        return nil
    else
        v60 = a1.matchOpponents
        if v60 ~= nil then
            v60 = v60[1]
        end
        local v61, u17 = nil, nil
        if v60 ~= nil then
            v61 = v60.avatarUserId
            if v61 == nil then
                if v60.userId <= 0 then
                    v61 = nil
                else
                    v61 = v60.userId
                end
            end
            if v61 == nil and v60.userId < 0 then
                return nil
            end
            a1.replicaAvatarRequested = true
            u17 = a1.scenery
            if u17 ~= nil then
                u17 = u17.animationRig
            end
            local tbl_16 = {}
            tbl_16.container = a1.stage.container
            tbl_16.janitor = a1.context.janitor
            tbl_16.variant = ((u17 ~= nil) and "r6") or nil
            local v62
            if v61 == nil or v61 <= 0 then
                v62 = nil
            else
                v62 = v61
            end
            tbl_16.userId = v62
            tbl_16.onAdopted = function(a2)
                --[[
                  name: onAdopted
                  line: 714
                  upvalues:
                    a1 (copy, index: 1)
                    u17 (copy, index: 2)
                    TimbermanAvatar_upv_1 (copy, index: 3)
                ]]
                a1.replicaAvatarRig = a2
                if u17 == nil then
                    return
                end
                a1.replicaAvatar = TimbermanAvatar_upv_1.new(a2, u17)
            end
            adoptAvatar_upv_1(tbl_16)
        else
            return nil
        end
    end
end
u14.settleReplicaDrop = function(a1, a2)
    --[[
      name: settleReplicaDrop
      line: 722
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.replicaDropOffset > 0 then
        a1.replicaDropOffset = a1.replicaDropOffset * math.exp(-a1:treeSettleRateFor(a1.replicaChopInterval) * a2)
        if a1.replicaDropOffset < TIMBERMAN_CONFIG_upv_1.treeSettleDeadband then
            a1.replicaDropOffset = 0
        end
    else
        return nil
    end
end
u14.refreshReplica = function(a1)
    --[[
      name: refreshReplica
      line: 731
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local replicaJack_1 = a1.replicaJack
    local v63 = nil
    if replicaJack_1 ~= nil then
        local v64 = a1:replicaOffset()
        v63 = a1.matchOpponents
        if v63 ~= nil then
            v63 = v63[1]
            if v63 ~= nil then
                v63 = v63.snapshot
            end
        end
        if v64 ~= nil then
            local v65 = nil
            if v63 ~= nil then
                local values_1 = v63.values
                local v66 = false
                if a1.replicaLastScore < v63.score then
                    if a1.replicaLastScore > 0 then
                        local v67 = os.clock()
                        local v68 = math.clamp(v67 - a1.replicaLastChopAt, 1 / TIMBERMAN_CONFIG_upv_1.maxChopsPerSecond, TIMBERMAN_CONFIG_upv_1.swingReturnMax * 4)
                        local v69
                        if a1.replicaLastChopAt <= 0 then
                            v69 = v68
                        else
                            v69 = math.min(v68, (a1.replicaChopInterval * 0.6) + (v68 * 0.4))
                        end
                        a1.replicaChopInterval = v69
                        a1.replicaLastChopAt = v67
                        a1.replicaDropOffset = math.min(a1.replicaDropOffset + TIMBERMAN_CONFIG_upv_1.segmentHeight, TIMBERMAN_CONFIG_upv_1.treeHangMax)
                        v66 = true
                    end
                    a1.replicaLastScore = v63.score
                end
                if a1.activeRuntime == nil then
                    a1:refreshProceduralReplica(v64, values_1, a1.replicaDropOffset)
                else
                    a1:refreshAuthoredReplica(v64, values_1, a1.replicaDropOffset)
                end
                a1:poseReplicaChopper(replicaJack_1, v64, values_1)
                if v66 then
                    v65 = a1.replicaAvatar
                    if v65 ~= nil then
                        v65:chop((math.min(a1.replicaChopInterval * TIMBERMAN_CONFIG_upv_1.swingReturnGapFraction, TIMBERMAN_CONFIG_upv_1.swingReturnMax)))
                    end
                end
                return
            end
        end
    end
    return nil
end
u14.poseReplicaChopper = function(a1, a2, a3, a4)
    --[[
      name: poseReplicaChopper
      line: 779
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v70 = a4[1]
    if v70 == nil then
        v70 = 0
    end
    local v71
    if v70 ~= 0 then
        v71 = "right"
    else
        v71 = "left"
    end
    local v72
    if v71 ~= "left" then
        v72 = 1
    else
        v72 = -1
    end
    local matchOpponents_1 = a1.matchOpponents
    if matchOpponents_1 ~= nil then
        matchOpponents_1 = matchOpponents_1[1]
        if matchOpponents_1 ~= nil then
            matchOpponents_1 = matchOpponents_1.alive
        end
    end
    local v73
    if matchOpponents_1 ~= nil then
        v73 = matchOpponents_1
    else
        v73 = true
    end
    local replicaAvatarRig_1 = a1.replicaAvatarRig
    local v74 = nil
    if replicaAvatarRig_1 ~= nil then
        a2.CFrame = u1
        local v75
        if a1.replicaAvatar == nil then
            v75 = TIMBERMAN_CONFIG_upv_1.playerOffsetX
        else
            v75 = TIMBERMAN_CONFIG_upv_1.animatedPlayerOffsetX
        end
        local v76 = a1:planePoint(a3 + (v72 * v75), TIMBERMAN_CONFIG_upv_1.playerFeetY)
        local v77 = v76 + Vector3.new(0, replicaAvatarRig_1.pivotYOffset, 0)
        local v78 = CFrame.lookAt(v77, a1:planePoint(a3, TIMBERMAN_CONFIG_upv_1.playerFeetY + replicaAvatarRig_1.pivotYOffset))
        local v79 = CFrame.new(v76 + Vector3.new(0, 1, 0)) * v78.Rotation * CFrame.Angles(-1.5707963267948966, 0, 0)
        v74 = a1.replicaAvatar
        if v74 == nil then
            local v80
            if v73 then
                v80 = v78
            else
                v80 = v79
            end
            replicaAvatarRig_1:pivotTo(v80)
        else
            v74:setSide(v71)
            v74:setSquashed(not v73)
            local v81
            if v73 then
                v81 = v74:standingPivot(CFrame.lookAt(v77, v77 + a1:planeVector(0, 0, 1)))
            else
                v81 = v79
            end
            v74:pivotTo(v81)
            return nil
        end
    else
        a2.CFrame = CFrame.new(a1:planePoint(a3 + (v72 * ((TIMBERMAN_CONFIG_upv_1.segmentWidth / 2) + 1.6)), a1:levelY(0) + 1.2))
        return nil
    end
end
u14.refreshAuthoredReplica = function(a1, a2, a3, a4)
    --[[
      name: refreshAuthoredReplica
      line: 831
      upvalues:
        normalizeSceneryClone_upv_1 (copy, index: 1)
        segmentCount_upv_1 (copy, index: 2)
    ]]
    local activeRuntime_2 = a1.activeRuntime
    if activeRuntime_2 ~= nil then
        if a1.replicaRuntime ~= nil and a1.replicaRuntime ~= activeRuntime_2 then
            a1:releaseReplicaSlots(a1.replicaRuntime)
        end
        a1.replicaRuntime = activeRuntime_2
        if a1.replicaRoot == nil and activeRuntime_2.root ~= nil then
            local v82 = activeRuntime_2.root:Clone()
            normalizeSceneryClone_upv_1(v82)
            v82.Parent = a1.stage.container
            a1.replicaRoot = v82
        end
        if a1.replicaRoot ~= nil and activeRuntime_2.placedRootPivot ~= nil then
            a1.replicaRoot:PivotTo(activeRuntime_2.placedRootPivot + a1:planeVector(a2, 0))
        end
        local v83 = true
        if a4 == a1.replicaAppliedDrop then
            v83 = a2 ~= a1.replicaAppliedOffset
        end
        a1.replicaAppliedDrop = a4
        a1.replicaAppliedOffset = a2
        local v84, v85 = nil, nil
        for n_6 = 0, segmentCount_upv_1 - 1 do
            local v86
            v86 = a3[(n_6 + 2) + 1]
            if v86 == nil then
                v86 = 0
            end
            local v87 = ((v86 == 1) and "left") or (((v86 ~= 2) and "none") or "right")
            local v88 = a1.replicaSlotSides[n_6]
            v85 = a1.replicaSlotModels[n_6]
            v84 = true
            if v85 ~= nil then
                v84 = v88 ~= v87
            end
            if v84 then
                if v85 ~= nil and v88 ~= nil then
                    a1:releaseTrunk(activeRuntime_2, v88, v85)
                end
                v85 = a1:acquireTrunk(activeRuntime_2, v87)
                a1.replicaSlotModels[n_6] = v85
                a1.replicaSlotSides[n_6] = v87
            end
            if v85 == nil then
                continue
            end
            if v83 then
                local v89
                v89 = CFrame.new(a1:planePoint(a2, a1:levelY(n_6) + a4))
                local v90
                v90 = activeRuntime_2.assets
                local v91 = nil
                if v87 == "left" then
                    v91 = v90.trunkLeft
                    v85:PivotTo(v89 * v91.pivotFromCore)
                    continue
                end
                if v87 ~= "right" then
                    v91 = v90.trunkPlain
                else
                    v91 = v90.trunkRight
                end
                v85:PivotTo(v89 * v91.pivotFromCore)
            else
                local v89, v90
                if not (v84) then
                    continue
                end
                v89 = CFrame.new(a1:planePoint(a2, a1:levelY(n_6) + a4))
                v90 = activeRuntime_2.assets
                local v91 = nil
                if v87 == "left" then
                    v91 = v90.trunkLeft
                    v85:PivotTo(v89 * v91.pivotFromCore)
                    continue
                end
                if v87 ~= "right" then
                    v91 = v90.trunkPlain
                else
                    v91 = v90.trunkRight
                end
                v85:PivotTo(v89 * v91.pivotFromCore)
            end
        end
    else
        return nil
    end
end
u14.releaseReplicaSlots = function(a1, a2)
    --[[
      name: releaseReplicaSlots
      line: 897
      upvalues:
        segmentCount_upv_1 (copy, index: 1)
    ]]
    for n_7 = 0, segmentCount_upv_1 - 1 do
        local v92
        v92 = a1.replicaSlotModels[n_7]
        local v93 = a1.replicaSlotSides[n_7]
        if v92 ~= nil and v93 ~= nil then
            a1:releaseTrunk(a2, v93, v92)
        end
        a1.replicaSlotModels[n_7] = nil
        a1.replicaSlotSides[n_7] = nil
    end
    local replicaRoot_1 = a1.replicaRoot
    if replicaRoot_1 ~= nil then
        replicaRoot_1:Destroy()
    end
    a1.replicaRoot = nil
    a1.replicaAppliedDrop = math.huge
    a1.replicaAppliedOffset = math.huge
end
u14.refreshProceduralReplica = function(a1, a2, a3, a4)
    --[[
      name: refreshProceduralReplica
      line: 924
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local procedural_2 = a1.procedural
    if procedural_2 ~= nil and #a1.replicaTrunk ~= 0 then
        local v94 = a1:planeVector(a2, 0)
        local v95 = TIMBERMAN_CONFIG_upv_1.segmentWidth / 2 + TIMBERMAN_CONFIG_upv_1.branchLength / 2
        for n_8 = 0, #a1.replicaTrunk - 1 do
            local v96 = a1.replicaTrunk[n_8 + 1]
            local v97
            v97 = procedural_2.trunkSegments[n_8 + 1]
            if v97 ~= nil then
                v96.CFrame = (v97.CFrame + v94) + a1:planeVector(0, a4)
            end
            local v98
            v98 = a1.replicaBranches[n_8 + 1]
            local v99
            if v98 == nil then
                continue
            end
            v99 = a3[(n_8 + 2) + 1]
            if v99 == nil then
                v99 = 0
            end
            if v99 == 0 then
                v98.CFrame = CFrame.new(a1:planePoint(a2, -100))
                continue
            end
            local new_1 = CFrame.new
            local v100
            if v99 ~= 1 then
                v100 = v95
            else
                v100 = -v95
            end
            v98.CFrame = new_1(a1:planePoint(a2 + v100, a1:levelY(n_8) + a4))
        end
    else
        return nil
    end
end
u14.revive = function(a1)
    --[[
      name: revive
      line: 955
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.squashed = false
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    table.clear(a1.chopQueue)
    a1.pendingPressSide = nil
    a1:resetChopCadence()
    a1.timeRemaining = TIMBERMAN_CONFIG_upv_1.timerMax
    a1.barFlashRemaining = 0
    for n_9 = 0, TIMBERMAN_CONFIG_upv_1.safeStartSegments - 1 do
        a1.branchSides[n_9 + 1] = "none"
    end
    a1.treeDropOffset = 0
    a1:layoutBranches()
    a1:applyTreeDropOffset()
    a1:parkFlingChunks()
    a1:positionPlayer()
    a1:setRunning(true)
end
u14.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 975
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        a1.chopCooldown = math.max(a1.chopCooldown - a2, -a2)
        local v101 = nil
        if a1.chopCooldown > 0 then
            if a1.barFlashRemaining > 0 then
                a1.barFlashRemaining = math.max(a1.barFlashRemaining - a2, 0)
            end
        else
            v101 = table.remove(a1.chopQueue, 1)
            if v101 == nil then
                if a1.barFlashRemaining > 0 then
                    a1.barFlashRemaining = math.max(a1.barFlashRemaining - a2, 0)
                end
            else
                if #a1.chopQueue == 0 then
                    a1.pendingPressSide = nil
                end
                local v102
                if v101 ~= "current" then
                    v102 = v101
                else
                    v102 = a1.playerSide
                end
                a1:resolveChop(v102)
                a1.chopCooldown = a1.chopCooldown + (1 / TIMBERMAN_CONFIG_upv_1.maxChopsPerSecond)
                if a1.dead then
                    return nil
                elseif a1.barFlashRemaining > 0 then
                    a1.barFlashRemaining = math.max(a1.barFlashRemaining - a2, 0)
                end
            end
        end
        a1.timeRemaining = a1.timeRemaining - (a1:currentDrainRate() * a2)
        if a1.timeRemaining <= 0 then
            a1.timeRemaining = 0
            a1:die("timeout")
        end
    end
end
u14.render = function(a1, a2)
    --[[
      name: render
      line: 1016
    ]]
    a1:settleTreeDrop(a2)
    a1:publishTimerBar()
    a1:updateWind(a2)
    local timbermanAvatar_1 = a1.timbermanAvatar
    if timbermanAvatar_1 ~= nil then
        timbermanAvatar_1:update(a2)
    end
    local replicaAvatar_1 = a1.replicaAvatar
    if replicaAvatar_1 ~= nil then
        replicaAvatar_1:update(a2)
    end
    a1:refreshReplica()
    a1:settleReplicaDrop(a2)
end
u14.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 1033
    ]]
    a1:settleTreeDrop(a2)
    a1:updateWind(a2)
    local timbermanAvatar_2 = a1.timbermanAvatar
    if timbermanAvatar_2 ~= nil then
        timbermanAvatar_2:update(a2)
    end
    local replicaAvatar_2 = a1.replicaAvatar
    if replicaAvatar_2 ~= nil then
        replicaAvatar_2:update(a2)
    end
    a1:refreshReplica()
    a1:settleReplicaDrop(a2)
end
u14.updateWind = function(a1, a2)
    --[[
      name: updateWind
      line: 1047
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        applyWind_upv_1 (copy, index: 2)
    ]]
    if TIMBERMAN_CONFIG_upv_1.wind.enabled then
        local v103
        if a1.scenery == nil then
            v103 = a1.procedural
            if v103 ~= nil then
                v103 = v103.windTrees
            end
            local v104 = v103
        else
            v103 = a1.activeRuntime
            if v103 ~= nil then
                v103 = v103.windTrees
            end
            local v104 = v103
        end
        local v104 = nil
        if v104 ~= nil then
            local v105 = nil
            if #v104 ~= 0 then
                a1.windAccumulator = a1.windAccumulator + a2
                v105 = 1 / math.max(TIMBERMAN_CONFIG_upv_1.wind.updateHz, 1)
                if a1.windAccumulator >= v105 then
                    a1.windAccumulator = a1.windAccumulator % v105
                    applyWind_upv_1(v104, TIMBERMAN_CONFIG_upv_1.wind, os.clock())
                    return
                end
                return nil
            end
        end
    end
    return nil
end
u14.treeSettleRateFor = function(a1, a2)
    --[[
      name: treeSettleRateFor
      line: 1079
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v106 = math.clamp(a2 * TIMBERMAN_CONFIG_upv_1.treeSettleGapFraction, TIMBERMAN_CONFIG_upv_1.treeSettleMinSeconds, TIMBERMAN_CONFIG_upv_1.treeSettleMaxSeconds)
    return math.log(TIMBERMAN_CONFIG_upv_1.segmentHeight / TIMBERMAN_CONFIG_upv_1.treeSettleDeadband) / v106
end
u14.settleTreeDrop = function(a1, a2)
    --[[
      name: settleTreeDrop
      line: 1083
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.treeDropOffset > 0 then
        a1:applyTreeDropOffset()
        a1.treeDropOffset = a1.treeDropOffset * math.exp(-a1:treeSettleRateFor(a1.chopInterval) * a2)
        if a1.treeDropOffset < TIMBERMAN_CONFIG_upv_1.treeSettleDeadband then
            a1.treeDropOffset = 0
            a1:applyTreeDropOffset()
        end
    else
        return nil
    end
end
u14.applyTreeDropOffset = function(a1)
    --[[
      name: applyTreeDropOffset
      line: 1095
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v107, v108 = nil, nil
    if a1.scenery == nil then
        v107 = a1.procedural
        if v107 ~= nil then
            for n_10 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
                local v109
                v109 = v107.trunkSegments[n_10 + 1]
                if v109 ~= nil then
                    v109.CFrame = CFrame.new(a1:planePoint(0, a1:levelY(n_10) + a1.treeDropOffset))
                end
                local v110
                v110 = v107.branches[n_10 + 1]
                local v111 = a1.branchSides[n_10 + 1]
                if v110 ~= nil and v111 ~= "none" then
                    v110.CFrame = CFrame.new(a1:planePoint((((v111 ~= "left") and 1) or -1) * ((TIMBERMAN_CONFIG_upv_1.segmentWidth / 2) + (TIMBERMAN_CONFIG_upv_1.branchLength / 2)), a1:levelY(n_10) + a1.treeDropOffset))
                end
            end
        else
            return nil
        end
    else
        v108 = a1.activeRuntime
        if v108 ~= nil then
            for n_11 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
                local v112
                v112 = a1.slotModels[n_11]
                local v113 = a1.slotSides[n_11]
                if v112 == nil then
                    continue
                end
                local v114, v115
                if v113 == nil then
                    continue
                end
                v114 = CFrame.new(a1:planePoint(0, a1:levelY(n_11) + a1.treeDropOffset))
                v115 = v108.assets
                local v116 = nil
                if v113 == "left" then
                    v116 = v115.trunkLeft
                    v112:PivotTo(v114 * v116.pivotFromCore)
                    continue
                end
                if v113 ~= "right" then
                    v116 = v115.trunkPlain
                else
                    v116 = v115.trunkRight
                end
                v112:PivotTo(v114 * v116.pivotFromCore)
            end
        end
        return nil
    end
end
u14.applyTheme = function(a1, a2)
    --[[
      name: applyTheme
      line: 1136
    ]]
    local procedural_3 = a1.procedural
    if procedural_3 ~= nil then
        procedural_3.backdrop.Color = a2.backdropColor
        procedural_3.ground.Color = a2.groundColor
        procedural_3.celestial.Color = a2.celestialColor
        procedural_3.celestial.Size = Vector3.new(0.5, a2.celestialDiameter, a2.celestialDiameter)
        for _, value_4 in procedural_3.stars do
            value_4.Transparency = ((a2.hasStars) and 0) or 1
        end
        for _, value_5 in procedural_3.hills do
            value_5.Color = a2.hillColor
        end
        for _, value_6 in procedural_3.pineTrunks do
            value_6.Color = a2.pineTrunkColor
        end
        for v117, v118 in procedural_3.pineLeaves do
            v118.Color = a2.pineLeafColor
        end
        for n_12 = 0, #procedural_3.grassTufts - 1 do
            local v117
            v117 = procedural_3.grassTufts[n_12 + 1]
            local v118 = procedural_3.grassBlends[n_12 + 1]
            if v117 ~= nil and v118 ~= nil then
                v117.Color = a2.groundColor:Lerp(a2.pineLeafColor, v118)
            end
        end
        for n_13 = 0, #procedural_3.trunkSegments - 1 do
            local v117
            v117 = procedural_3.trunkSegments[n_13 + 1]
            if v117 == nil then
                continue
            end
            local v118
            if n_13 % 2 ~= 0 then
                v118 = a2.trunkAltColor
            else
                v118 = a2.trunkColor
            end
            v117.Color = v118
        end
        for _, value_7 in procedural_3.branches do
            value_7.Color = a2.branchColor
        end
        for _, value_8 in a1.flingChunks do
            value_8.Color = a2.trunkColor
        end
        if procedural_3.fireflies.Enabled ~= a2.hasFireflies then
            procedural_3.fireflies.Enabled = a2.hasFireflies
            if not (a2.hasFireflies) then
                procedural_3.fireflies:Clear()
            end
        end
    else
        return nil
    end
end
u14.applySeason = function(a1, a2)
    --[[
      name: applySeason
      line: 1185
      upvalues:
        u12 (copy, index: 1)
    ]]
    local activeRuntime_3 = a1.activeRuntime
    if activeRuntime_3 ~= nil and activeRuntime_3.assets == a2 then
        return nil
    end
    if activeRuntime_3 ~= nil then
        a1:parkBackground(activeRuntime_3)
        local v119 = activeRuntime_3.root
        if v119 ~= nil then
            v119:PivotTo(u12)
        end
        a1:releaseAllSlots(activeRuntime_3)
    end
    local v119 = a1:getSeasonRuntime(a2)
    a1:placeBackground(v119)
    if v119.root ~= nil and v119.placedRootPivot ~= nil then
        v119.root:PivotTo(v119.placedRootPivot)
    end
    local v120 = a2.trunkRoot
    if v120 ~= nil then
        v120 = v120.core
    end
    local v121
    if v120 == nil then
        v121 = 0
    else
        local v122 = v120.CFrame
        v121 = math.abs(v120.CFrame.RightVector.Y) * v120.Size.X + math.abs(v120.CFrame.UpVector.Y) * v120.Size.Y + math.abs(v120.CFrame.LookVector.Y) * v120.Size.Z
    end
    a1.rootLift = v121
    a1.activeRuntime = v119
    if a1.scenery ~= nil then
        a1:applyAuthoredCamera()
    end
    a1.stage.setLighting(a2.lighting)
    for v123, value_9 in a1.flingChunks do
        value_9.Color = a2.accents.flingColor
    end
    a1.woodChips.Color = ColorSequence.new(a2.accents.chipLight, a2.accents.chipDark)
end
u14.getSeasonRuntime = function(a1, a2)
    --[[
      name: getSeasonRuntime
      line: 1221
      upvalues:
        normalizeSceneryClone_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v122 = a1.seasonRuntimes[a2.name]
    local v123 = nil
    if v122 == nil then
        local v124
        if a1:isDuel() then
            v124 = a2.duelScene
        else
            v124 = nil
        end
        local v125 = ("[Timberman] season %*: duel=%*, "):format(a2.name, a1:isDuel())
        local v126 = ("duelScene=%*, "):format(((a2.duelScene == nil) and "MISSING") or "found")
        print(v125 .. v126 .. ("background=%*"):format(((v124 == nil) and "solo map") or "authored duel scene"))
        local v127 = nil
        local v128 = nil
        v125 = nil
        if v124 == nil then
            local v129 = a2.map:Clone()
            normalizeSceneryClone_upv_1(v129)
            local v130 = v129:GetPivot()
            v129.Parent = a1.stage.container
            v128 = a1:computeMapPivot(v129)
            v127, v126 = v129, a1:collectMapWind(v129, v128, v130, a2.name)
        else
            local v131 = a1:buildDuelBackground(a2.name, v124)
            v125, v126 = v131.duel, v131.windTrees
        end
        local v132 = nil
        local v133 = nil
        v123 = a2.trunkRoot
        local v130
        if v123 == nil then
            v130 = v133
        else
            v132 = v123.model:Clone()
            normalizeSceneryClone_upv_1(v132)
            v132:PivotTo(u12)
            v132.Parent = a1.stage.container
            local core_1 = v123.core
            local CFrame_2 = core_1.CFrame
            v130 = CFrame.new(a1:planePoint(0, (TIMBERMAN_CONFIG_upv_1.trunkBottomY - (TIMBERMAN_CONFIG_upv_1.segmentHeight / 2)) + ((((math.abs(CFrame_2.RightVector.Y) * core_1.Size.X) + (math.abs(CFrame_2.UpVector.Y) * core_1.Size.Y)) + (math.abs(CFrame_2.LookVector.Y) * core_1.Size.Z)) / 2))) * v123.pivotFromCore
        end
        local tbl_17 = {}
        tbl_17.assets = a2
        tbl_17.map = v127
        tbl_17.placedMapPivot = v128
        tbl_17.duel = v125
        tbl_17.windTrees = v126
        tbl_17.root = v132
        tbl_17.placedRootPivot = v130
        tbl_17.freeTrunks = {left = {}, right = {}, none = {}}
        a1.seasonRuntimes[a2.name] = tbl_17
        return tbl_17
    end
    return v122
end
u14.buildDuelBackground = function(a1, a2, a3)
    --[[
      name: buildDuelBackground
      line: 1289
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        normalizeSceneryClone_upv_1 (copy, index: 2)
    ]]
    local v134 = TIMBERMAN_CONFIG_upv_1.trunkBottomY - TIMBERMAN_CONFIG_upv_1.segmentHeight / 2
    local v135 = a3.model:Clone()
    normalizeSceneryClone_upv_1(v135)
    local v136 = v135:GetPivot()
    v135.Parent = a1.stage.container
    local v137
    if a1:isLeftDuelist() then
        v137 = a3.anchorFromLeftIndicatorTop
    else
        v137 = a3.anchorFromRightIndicatorTop
    end
    local v138 = CFrame.new(a1:planePoint(0, v134)) * v137
    local tbl_18 = {}
    tbl_18.duel = {scene = v135, scenePivot = v138, treeSpacing = a3.treeSpacing}
    tbl_18.windTrees = a1:collectMapWind(v135, v138, v136, a2)
    return tbl_18
end
u14.collectMapWind = function(a1, a2, a3, a4, a5)
    --[[
      name: collectMapWind
      line: 1308
      upvalues:
        collectTreeUnits_upv_1 (copy, index: 1)
        TIMBERMAN_CONFIG_upv_1 (copy, index: 2)
        conformSeasonFoliage_upv_1 (copy, index: 3)
        collectWindTrees_upv_1 (copy, index: 4)
    ]]
    local v139 = conformSeasonFoliage_upv_1(collectTreeUnits_upv_1(a2, a3 * a4:Inverse(), TIMBERMAN_CONFIG_upv_1.wind), a5, TIMBERMAN_CONFIG_upv_1.foliage)
    if TIMBERMAN_CONFIG_upv_1.wind.enabled then
        return (collectWindTrees_upv_1(v139, TIMBERMAN_CONFIG_upv_1.wind))
    end
    return {}
end
u14.placeBackground = function(a1, a2)
    --[[
      name: placeBackground
      line: 1316
    ]]
    if a2.duel == nil then
        if a2.map ~= nil and a2.placedMapPivot ~= nil then
            a2.map:PivotTo(a2.placedMapPivot)
        end
    else
        a2.duel.scene:PivotTo(a2.duel.scenePivot)
    end
end
u14.parkBackground = function(a1, a2)
    --[[
      name: parkBackground
      line: 1323
      upvalues:
        u12 (copy, index: 1)
    ]]
    local v140 = nil
    if a2.duel == nil then
        v140 = a2.map
        if v140 ~= nil then
            v140:PivotTo(u12)
        end
    else
        a2.duel.scene:PivotTo(u12)
        return nil
    end
end
u14.computeMapPivot = function(a1, a2)
    --[[
      name: computeMapPivot
      line: 1333
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v141 = CFrame.new(a1:planePoint(0, TIMBERMAN_CONFIG_upv_1.trunkBottomY - (TIMBERMAN_CONFIG_upv_1.segmentHeight / 2)))
    local Landtype1_1 = a2:FindFirstChild("Landtype1")
    if Landtype1_1 ~= nil then
        Landtype1_1 = Landtype1_1:FindFirstChild("Grass")
        if Landtype1_1 ~= nil then
            Landtype1_1 = Landtype1_1:FindFirstChild("TrunkIndicator")
        end
    end
    if Landtype1_1 ~= nil then
        local v142 = Landtype1_1
    else
        local v142 = a2:FindFirstChild("TrunkIndicator", true)
    end
    local v142 = nil
    if v142 ~= nil and v142:IsA("BasePart") then
        local CFrame_3 = v142.CFrame
        return v141 * (CFrame.new(v142.Position + Vector3.new(0, (((math.abs(CFrame_3.RightVector.Y) * v142.Size.X) + (math.abs(CFrame_3.UpVector.Y) * v142.Size.Y)) + (math.abs(CFrame_3.LookVector.Y) * v142.Size.Z)) / 2, 0)):Inverse() * a2:GetPivot())
    end
    warn("[Timberman] season map has no TrunkIndicator \226\128\148 placing it by its pivot")
    return v141
end
u14.layoutTrunks = function(a1)
    --[[
      name: layoutTrunks
      line: 1358
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local activeRuntime_4 = a1.activeRuntime
    if activeRuntime_4 ~= nil then
        local v143 = nil
        for n_14 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
            local v144 = a1.branchSides[n_14 + 1]
            local v145 = a1.slotSides[n_14]
            v143 = v145 == v144
            if v143 then
                v143 = a1.slotModels[n_14] ~= nil
            end
            local v146
            if v143 then
                continue
            end
            v146 = a1.slotModels[n_14]
            if v146 ~= nil and v145 ~= nil then
                a1:releaseTrunk(activeRuntime_4, v145, v146)
            end
            local v147 = a1:acquireTrunk(activeRuntime_4, v144)
            local v148 = CFrame.new(a1:planePoint(0, a1:levelY(n_14) + a1.treeDropOffset))
            local assets_1 = activeRuntime_4.assets
            local v149 = nil
            if v144 == "left" then
                v149 = assets_1.trunkLeft
                v147:PivotTo(v148 * v149.pivotFromCore)
                a1.slotModels[n_14] = v147
                a1.slotSides[n_14] = v144
                continue
            end
            if v144 ~= "right" then
                v149 = assets_1.trunkPlain
            else
                v149 = assets_1.trunkRight
            end
            v147:PivotTo(v148 * v149.pivotFromCore)
            a1.slotModels[n_14] = v147
            a1.slotSides[n_14] = v144
        end
    else
        return nil
    end
end
u14.acquireTrunk = function(a1, a2, a3)
    --[[
      name: acquireTrunk
      line: 1396
      upvalues:
        normalizeSceneryClone_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v150 = a2.freeTrunks[a3]
    local v151 = #v150
    local v152 = v150[v151]
    v150[v151] = nil
    if v152 == nil then
        local assets_2 = a2.assets
        local v153
        if a3 == "left" then
            v153 = assets_2.trunkLeft
        elseif a3 ~= "right" then
            v153 = assets_2.trunkPlain
        else
            v153 = assets_2.trunkRight
        end
        local v154 = v153.model:Clone()
        normalizeSceneryClone_upv_1(v154)
        v154:PivotTo(u1)
        v154.Parent = a1.stage.container
        return v154
    end
    return v152
end
u14.releaseTrunk = function(a1, a2, a3, a4)
    --[[
      name: releaseTrunk
      line: 1413
      upvalues:
        u1 (copy, index: 1)
    ]]
    a4:PivotTo(u1)
    table.insert(a2.freeTrunks[a3], a4)
end
u14.releaseAllSlots = function(a1, a2)
    --[[
      name: releaseAllSlots
      line: 1419
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_15 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
        local v155
        v155 = a1.slotModels[n_15]
        local v156 = a1.slotSides[n_15]
        if v155 ~= nil and v156 ~= nil then
            a1:releaseTrunk(a2, v156, v155)
        end
        a1.slotModels[n_15] = nil
        a1.slotSides[n_15] = nil
    end
end
u14.onPress = function(a1, a2, a3)
    --[[
      name: onPress
      line: 1438
    ]]
    if a1.dead then
        return nil
    elseif a3 ~= "key" then
        a1.lastPressChopTime = os.clock()
        local v157 = ((a2.X >= a1:trunkScreenX()) and "right") or "left"
        local v158
        if a1:enqueueChop(v157) then
            v158 = v157
        else
            v158 = nil
        end
        a1.pendingPressSide = v158
    else
        a1:enqueueChop("current")
        return nil
    end
end
u14.trunkScreenX = function(a1)
    --[[
      name: trunkScreenX
      line: 1451
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local camera_1 = a1.stage.camera
    local v159, v160 = camera_1:WorldToViewportPoint(a1:planePoint(0, TIMBERMAN_CONFIG_upv_1.playerFeetY))
    if v160 then
        return v159.X
    end
    return camera_1.ViewportSize.X / 2
end
u14.onSwipe = function(a1, a2, a3)
    --[[
      name: onSwipe
      line: 1458
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead or a2 ~= "left" and a2 ~= "right" then
        return nil
    end
    if a3 == "pointer" then
        local v161 = nil
        if os.clock() - a1.lastPressChopTime < TIMBERMAN_CONFIG_upv_1.swipeDedupeSeconds then
            v161 = a1.pendingPressSide
            if v161 ~= nil then
                local v162 = nil
                if a2 ~= v161 then
                    v162 = #a1.chopQueue - 1
                    if a1.chopQueue[v162 + 1] == v161 then
                        a1.chopQueue[v162 + 1] = a2
                        a1.pendingPressSide = a2
                    end
                    return nil
                end
            end
            return nil
        end
    end
    a1:enqueueChop(a2)
end
u14.enqueueChop = function(a1, a2)
    --[[
      name: enqueueChop
      line: 1489
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if TIMBERMAN_CONFIG_upv_1.maxQueuedChops > #a1.chopQueue then
        table.insert(a1.chopQueue, a2)
        return true
    end
    return false
end
u14.resetChopCadence = function(a1)
    --[[
      name: resetChopCadence
      line: 1498
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.chopCooldown = 0
    a1.lastChopAt = 0
    a1.chopInterval = TIMBERMAN_CONFIG_upv_1.swingReturnMax
end
u14.resolveChop = function(a1, a2)
    --[[
      name: resolveChop
      line: 1503
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    a1.playerSide = a2
    a1:positionPlayer()
    local v163 = nil
    if a1.branchSides[1] ~= a2 then
        local v164 = os.clock()
        local v165 = math.clamp(v164 - a1.lastChopAt, 1 / TIMBERMAN_CONFIG_upv_1.maxChopsPerSecond, TIMBERMAN_CONFIG_upv_1.swingReturnMax * 4)
        local v166
        if a1.lastChopAt <= 0 then
            v166 = v165
        else
            v166 = math.min(v165, (a1.chopInterval * 0.6) + (v165 * 0.4))
        end
        a1.chopInterval = v166
        a1.lastChopAt = v164
        local treeDropOffset_1 = a1.treeDropOffset
        a1:flingBottomChunk(a2, treeDropOffset_1)
        v163 = a1.timbermanAvatar
        if v163 ~= nil then
            v163:chop(a1:chopFollowThrough())
        end
        a1.treeDropOffset = math.min(a1.treeDropOffset + TIMBERMAN_CONFIG_upv_1.segmentHeight, TIMBERMAN_CONFIG_upv_1.treeHangMax)
        a1:shiftSegments(a1.treeDropOffset == (treeDropOffset_1 + TIMBERMAN_CONFIG_upv_1.segmentHeight))
        if a1.branchSides[1] ~= a1.playerSide then
            a1.score = a1.score + 1
            a1.context.reportScore(a1.score)
            a1.timeRemaining = math.min(a1.timeRemaining + TIMBERMAN_CONFIG_upv_1.chopTimeGain, TIMBERMAN_CONFIG_upv_1.timerMax)
            a1.context.audio.play("axeSwing", {})
            a1.context.audio.play("thud", {})
            a1.stage.shake(a1:chopShake())
            local v167 = ((a2 ~= "left") and -1) or 1
            local v168 = a1:levelY(0) + treeDropOffset_1
            a1.chipAnchor.CFrame = CFrame.lookAt(a1:planePoint(v167 * (TIMBERMAN_CONFIG_upv_1.segmentWidth / 2), v168), a1:planePoint(v167 * 20, v168 + 6))
            a1.woodChips:Emit(12)
            if a1.score % TIMBERMAN_CONFIG_upv_1.levelEveryChops == 0 then
                a1:levelUp()
            elseif a1.score % TIMBERMAN_CONFIG_upv_1.popupEveryChops == 0 then
                a1.popups:show(a1:popupPosition(), "+1", u4, 0.7)
            end
        else
            a1:die("branch")
            return nil
        end
    else
        a1:die("branch")
        return nil
    end
end
u14.chopFollowThrough = function(a1)
    --[[
      name: chopFollowThrough
      line: 1565
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.min(a1.chopInterval * TIMBERMAN_CONFIG_upv_1.swingReturnGapFraction, TIMBERMAN_CONFIG_upv_1.swingReturnMax))
end
u14.chopShake = function(a1)
    --[[
      name: chopShake
      line: 1568
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    return TIMBERMAN_CONFIG_upv_1.chopShakeSlow + ((TIMBERMAN_CONFIG_upv_1.chopShakeFast - TIMBERMAN_CONFIG_upv_1.chopShakeSlow) * math.clamp((TIMBERMAN_CONFIG_upv_1.swingReturnMax - a1.chopInterval) / math.max(TIMBERMAN_CONFIG_upv_1.swingReturnMax - (1 / TIMBERMAN_CONFIG_upv_1.maxChopsPerSecond), 0.001), 0, 1))
end
u14.levelUp = function(a1)
    --[[
      name: levelUp
      line: 1572
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    local v169 = math.floor(a1.score / TIMBERMAN_CONFIG_upv_1.levelEveryChops) + 1
    a1.barFlashRemaining = TIMBERMAN_CONFIG_upv_1.levelFlashSeconds
    a1.popups:show(a1:planePoint(0, 13, 2), ("LEVEL %*"):format(v169), u6, 1.2)
    a1.context.audio.play("perfect", {pitch = math.min((v169 * 0.04) + 1, 1.6)})
end
u14.currentDrainRate = function(a1)
    --[[
      name: currentDrainRate
      line: 1581
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    return TIMBERMAN_CONFIG_upv_1.timerDrainBase + (math.min(math.floor(a1.score / TIMBERMAN_CONFIG_upv_1.levelEveryChops), TIMBERMAN_CONFIG_upv_1.timerDrainStepsMax) * TIMBERMAN_CONFIG_upv_1.timerDrainStepAdd)
end
u14.shiftSegments = function(a1, a2)
    --[[
      name: shiftSegments
      line: 1585
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_16 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 2 do
        a1.branchSides[n_16 + 1] = a1.branchSides[n_16 + 2]
    end
    a1.branchSides[TIMBERMAN_CONFIG_upv_1.segmentCount] = a1:rollBranchSide(a1.branchSides[TIMBERMAN_CONFIG_upv_1.segmentCount - 1])
    if a1.activeRuntime ~= nil and a2 then
        a1:shiftTrunkRing()
        return nil
    end
    a1:layoutBranches()
    a1:applyTreeDropOffset()
end
u14.shiftTrunkRing = function(a1)
    --[[
      name: shiftTrunkRing
      line: 1601
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local activeRuntime_5 = a1.activeRuntime
    local v170 = nil
    if activeRuntime_5 ~= nil then
        local v171 = TIMBERMAN_CONFIG_upv_1.segmentCount - 1
        v170 = a1.slotModels[0]
        local v172 = a1.slotSides[0]
        if v170 == nil then
            a1:layoutTrunks()
            a1:applyTreeDropOffset()
            return nil
        else
            local v173 = nil
            if v172 ~= nil then
                a1:releaseTrunk(activeRuntime_5, v172, v170)
                v173 = 0
                local v174 = false
                if v174 then
                    v173 = v173 + 1
                else
                    v174 = true
                end
                local v175 = nil
                while v173 < v171 do
                    v175 = a1.slotModels[v173 + 1]
                    local v176 = a1.slotSides[v173 + 1]
                    if v175 ~= nil and v176 ~= nil then
                        a1.slotModels[v173] = v175
                        a1.slotSides[v173] = v176
                    end
                    if v174 then
                        v173 = v173 + 1
                    else
                        v174 = true
                    end
                end
                v173 = a1.branchSides[v171 + 1] or "none"
                v174 = a1:acquireTrunk(activeRuntime_5, v173)
                local v177 = CFrame.new(a1:planePoint(0, a1:levelY(v171) + a1.treeDropOffset))
                local assets_3 = activeRuntime_5.assets
                local v178
                if v173 == "left" then
                    v178 = assets_3.trunkLeft
                elseif v173 ~= "right" then
                    v178 = assets_3.trunkPlain
                else
                    v178 = assets_3.trunkRight
                end
                v174:PivotTo(v177 * v178.pivotFromCore)
                a1.slotModels[v171] = v174
                a1.slotSides[v171] = v173
            else
                a1:layoutTrunks()
                a1:applyTreeDropOffset()
                return nil
            end
        end
    else
        return nil
    end
end
u14.rollBranchSide = function(a1, a2)
    --[[
      name: rollBranchSide
      line: 1653
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v179 = a1.generationRandom:NextNumber()
    local v180 = ((v179 < TIMBERMAN_CONFIG_upv_1.branchNoneChance) and "none") or (((v179 >= TIMBERMAN_CONFIG_upv_1.branchNoneChance + ((1 - TIMBERMAN_CONFIG_upv_1.branchNoneChance) / 2)) and "right") or "left")
    if v180 ~= "none" and a2 ~= "none" and v180 ~= a2 then
        return "none"
    end
    return v180
end
u14.layoutBranches = function(a1)
    --[[
      name: layoutBranches
      line: 1671
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v181 = nil
    if a1.scenery == nil then
        v181 = a1.procedural
        if v181 ~= nil then
            local origin_4 = a1.stage.origin
            for n_17 = 0, TIMBERMAN_CONFIG_upv_1.segmentCount - 1 do
                local v182
                v182 = v181.branches[n_17 + 1]
                local v183 = a1.branchSides[n_17 + 1]
                if v182 == nil then
                    continue
                end
                if v183 ~= "none" then
                    v182.CFrame = CFrame.new(origin_4 + Vector3.new((((v183 ~= "left") and 1) or -1) * ((TIMBERMAN_CONFIG_upv_1.segmentWidth / 2) + (TIMBERMAN_CONFIG_upv_1.branchLength / 2)), a1:levelY(n_17) + a1.treeDropOffset, 0))
                else
                    v182.CFrame = u1
                end
            end
        else
            return nil
        end
    else
        a1:layoutTrunks()
        return nil
    end
end
u14.flingBottomChunk = function(a1, a2, a3)
    --[[
      name: flingBottomChunk
      line: 1697
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local flingIndex_upv_1 = a1.flingIndex
    local u18 = a1.flingChunks[flingIndex_upv_1 + 1]
    a1.flingIndex = (a1.flingIndex + 1) % #a1.flingChunks
    local v184 = nil
    if u18 ~= nil then
        local v185 = ((a2 ~= "left") and -1) or 1
        u18.Anchored = true
        u18.CFrame = CFrame.new(a1:planePoint(v185 * 1.5, a1:levelY(0) + a3, TIMBERMAN_CONFIG_upv_1.segmentDepth + 0.25)) * a1:planeRotation()
        u18.Anchored = false
        u18.AssemblyLinearVelocity = a1:planeVector(v185 * TIMBERMAN_CONFIG_upv_1.flingSpeedX, TIMBERMAN_CONFIG_upv_1.flingSpeedY)
        u18.AssemblyAngularVelocity = a1:planeVector(0, 0, 1) * (-v185 * a1.random:NextNumber(TIMBERMAN_CONFIG_upv_1.flingSpinMin, TIMBERMAN_CONFIG_upv_1.flingSpinMax))
        v184 = a1.flingGenerations[flingIndex_upv_1 + 1]
        if v184 == nil then
            v184 = 0
        end
        local u19 = v184 + 1
        a1.flingGenerations[flingIndex_upv_1 + 1] = u19
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            TIMBERMAN_CONFIG_upv_1.flingRepoolSeconds,
            function()
                --[[
                  line: 1727
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    flingIndex_upv_1 (copy, index: 3)
                    u19 (copy, index: 4)
                    u18 (copy, index: 5)
                ]]
                if a1.roundToken ~= roundToken_upv_1 or a1.flingGenerations[flingIndex_upv_1 + 1] ~= u19 then
                    return
                end
                a1:parkChunk(u18)
            end
        )
    else
        return nil
    end
end
u14.parkChunk = function(a1, a2)
    --[[
      name: parkChunk
      line: 1733
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.Anchored = true
    a2.CFrame = u1
end
u14.parkFlingChunks = function(a1)
    --[[
      name: parkFlingChunks
      line: 1737
    ]]
    for _, value_10 in a1.flingChunks do
        a1:parkChunk(value_10)
    end
end
u14.positionPlayer = function(a1)
    --[[
      name: positionPlayer
      line: 1742
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v186 = ((a1.playerSide ~= "left") and 1) or -1
    local avatarRig_1 = a1.avatarRig
    local v187 = nil
    if avatarRig_1 == nil then
        local v188 = ((a1.squashed) and (TIMBERMAN_CONFIG_upv_1.playerBodyHeight * TIMBERMAN_CONFIG_upv_1.playerSquashScale)) or (TIMBERMAN_CONFIG_upv_1.playerBodyHeight)
        a1.playerBody.Size = Vector3.new(TIMBERMAN_CONFIG_upv_1.playerBodyWidth, v188, TIMBERMAN_CONFIG_upv_1.playerBodyDepth)
        a1.playerBody.CFrame = CFrame.new(a1:planePoint(v186 * TIMBERMAN_CONFIG_upv_1.playerOffsetX, TIMBERMAN_CONFIG_upv_1.playerFeetY + (v188 / 2)))
        a1.playerHead.CFrame = CFrame.new(a1:planePoint(v186 * TIMBERMAN_CONFIG_upv_1.playerOffsetX, (TIMBERMAN_CONFIG_upv_1.playerFeetY + v188) + (TIMBERMAN_CONFIG_upv_1.playerHeadSize / 2)))
    else
        local v189 = a1:planePoint(v186 * a1:activePlayerOffsetX(), TIMBERMAN_CONFIG_upv_1.playerFeetY)
        local v190 = v189 + Vector3.new(0, avatarRig_1.pivotYOffset, 0)
        local v191 = CFrame.lookAt(v190, a1:planePoint(0, TIMBERMAN_CONFIG_upv_1.playerFeetY + avatarRig_1.pivotYOffset))
        local v192 = CFrame.new(v189 + Vector3.new(0, 1, 0)) * v191.Rotation * CFrame.Angles(-1.5707963267948966, 0, 0)
        v187 = a1.timbermanAvatar
        if v187 == nil then
            local v193
            if a1.squashed then
                v193 = v192
            else
                v193 = v191
            end
            avatarRig_1:pivotTo(v193)
            a1:poseAxe(v191)
        else
            v187:setSide(a1.playerSide)
            v187:setSquashed(a1.squashed)
            local v194
            if a1.squashed then
                v194 = v192
            else
                v194 = v187:standingPivot(CFrame.lookAt(v190, v190 + a1:planeVector(0, 0, 1)))
            end
            v187:pivotTo(v194)
        end
        return nil
    end
end
u14.poseAxe = function(a1, a2)
    --[[
      name: poseAxe
      line: 1781
      upvalues:
        u1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    local axe_1 = a1.axe
    if axe_1 ~= nil then
        if a1.squashed then
            axe_1:PivotTo(u1)
            return nil
        end
        axe_1:PivotTo(a2 * u13)
    else
        return nil
    end
end
u14.activePlayerOffsetX = function(a1)
    --[[
      name: activePlayerOffsetX
      line: 1792
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.timbermanAvatar == nil then
        return TIMBERMAN_CONFIG_upv_1.playerOffsetX
    end
    return TIMBERMAN_CONFIG_upv_1.animatedPlayerOffsetX
end
u14.popupPosition = function(a1)
    --[[
      name: popupPosition
      line: 1795
      upvalues:
        u7 (copy, index: 1)
    ]]
    return a1:planePoint((((a1.playerSide ~= "left") and 1) or -1) * a1:activePlayerOffsetX(), u7, 2)
end
u14.publishTimerBar = function(a1)
    --[[
      name: publishTimerBar
      line: 1799
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
        timbermanTimerAtom_upv_1 (copy, index: 2)
    ]]
    local v195 = math.clamp(a1.timeRemaining / TIMBERMAN_CONFIG_upv_1.timerMax, 0, 1)
    local v196 = math.clamp(1 - (v195 / TIMBERMAN_CONFIG_upv_1.timerWarnRatio), 0, 1)
    local v197 = ((a1.barFlashRemaining <= 0) and 0) or (a1.barFlashRemaining / TIMBERMAN_CONFIG_upv_1.levelFlashSeconds)
    if math.abs(v195 - a1.publishedFill) < 0.001 and math.abs(v196 - a1.publishedWarn) < 0.001 and math.abs(v197 - a1.publishedFlash) < 0.001 then
        return nil
    end
    a1.publishedFill = v195
    a1.publishedWarn = v196
    a1.publishedFlash = v197
    timbermanTimerAtom_upv_1({fill = v195, warn = v196, flash = v197})
end
u14.levelY = function(a1, a2)
    --[[
      name: levelY
      line: 1815
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (TIMBERMAN_CONFIG_upv_1.trunkBottomY + a1.rootLift) + (a2 * TIMBERMAN_CONFIG_upv_1.segmentHeight)
end
u14.die = function(a1, a2)
    --[[
      name: die
      line: 1818
      upvalues:
        u5 (copy, index: 1)
    ]]
    a1.dead = true
    a1:setRunning(false)
    if a2 ~= "branch" then
        a1.popups:show(a1:popupPosition(), "TIME'S UP!", u5, 1.1)
    else
        a1.squashed = true
        a1:positionPlayer()
        a1.popups:show(a1:popupPosition(), "SQUASHED!", u5, 1.1)
    end
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(1)
    local score_upv_1 = a1.score
    local roundToken_upv_2 = a1.roundToken
    task.delay(
        0.7,
        function()
            --[[
              line: 1840
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_2 (copy, index: 2)
                score_upv_1 (copy, index: 3)
            ]]
            if a1.roundToken ~= roundToken_upv_2 then
                return
            end
            a1.context.endRun(score_upv_1)
        end
    )
end
local tbl_19 = {}
tbl_19.TimbermanGame = u14
return tbl_19