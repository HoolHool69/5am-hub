-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local portraitCameraDistance_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "camera-framing").portraitCameraDistance
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local ObjectPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "object-pool").ObjectPool
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local STACK_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "stack-config").STACK_CONFIG
local Unit_upv_1 = (Vector3.new(-1, -0.800000011920929, -1)).Unit
local u1 = Color3.fromRGB(2, 2, 3)
local u2 = Color3.fromRGB(196, 232, 218)
local u3 = Color3.fromRGB(198, 188, 228)
local u4 = Color3.fromRGB(224, 255, 245)
local u5 = TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local u6 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u7 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u8 = TweenInfo.new(0.16, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true)
local u9 = Color3.fromRGB(245, 245, 255)
local u10 = Color3.fromRGB(255, 216, 102)
local u11 = Color3.fromRGB(255, 150, 80)
local u12 = Color3.fromRGB(255, 90, 100)
local u13 = Color3.fromRGB(110, 240, 190)
local u14 = CFrame.Angles(0.7853981633974483, 0, 0.7853981633974483)
local u15 = CFrame.Angles(0, 2.6179938779914944, 0)
local u16 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u17 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0.5)
local tbl_upv_1 = {Vector3.new(0, 0, 0), Vector3.new(-1.600000023841858, -0.30000001192092896, 0.800000011920929), Vector3.new(1.600000023841858, -0.30000001192092896, -0.800000011920929)}
local u18 = CFrame.Angles(0, 0.7853981633974483, 0) * CFrame.new(15, 0, 0)
local makeGem = nil
local clearSurfaces = nil
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 74
    ]]
    return "StackGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u20 = setmetatable(tbl_2, tbl_3)
u20.__index = u20
u20.new = function(...)
    --[[
      name: new
      line: 80
      upvalues:
        u20 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u20)
    return v3:constructor(...) or v3
end
u20.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 84
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        STACK_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.blocks = {}
    a1.fogPillar = {}
    a1.axis = "x"
    a1.topCenter = Vector2.zero
    a1.topSize = Vector2.new(STACK_CONFIG_upv_1.baseSize, STACK_CONFIG_upv_1.baseSize)
    a1.towerHeight = 1
    a1.slidePhase = -1.5707963267948966
    a1.movingOffset = -STACK_CONFIG_upv_1.slideAmplitude
    a1.renderPrevMovingOffset = -STACK_CONFIG_upv_1.slideAmplitude
    a1.speed = STACK_CONFIG_upv_1.slideSpeedStart
    a1.streak = 0
    a1.score = 0
    a1.gemsCollected = 0
    a1.hue = 0.55
    a1.cameraFocusY = 0
    a1.cameraDistanceCurrent = STACK_CONFIG_upv_1.cameraDistance
    a1.cameraYawCurrent = 0
    a1.deathTime = 0
    a1.deathZoomTarget = STACK_CONFIG_upv_1.cameraDistance
    a1.deathFocusStartY = 0
    a1.deathFocusTargetY = 0
    a1.dropQueued = false
    a1.dead = false
    a1.roundToken = 0
    a1.recentLayers = {}
    a1.replicaBlocks = {}
    a1.replicaFog = {}
    a1.replicaLastHeight = 0
    a1.replicaDropStartedAt = 0
end
local function u19(a1)
    --[[
      name: buildScene
      line: 116
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        u19 (ref,  index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        markWorldArt_upv_1 (copy, index: 5)
        ObjectPool_upv_1 (copy, index: 6)
        makeGem (ref,  index: 7)
        u13 (copy, index: 8)
        PopupTextPool_upv_1 (copy, index: 9)
        u2 (copy, index: 10)
        clearSurfaces (ref,  index: 11)
        u3 (copy, index: 12)
        u18 (copy, index: 13)
    ]]
    local container_upv_1 = a1.stage.container
    for _ = 0, STACK_CONFIG_upv_1.visibleTower - 1 do
        table.insert(a1.blocks, (u19(container_upv_1)))
    end
    for v4 = 0, STACK_CONFIG_upv_1.fogPillarSegments - 1 do
        table.insert(a1.fogPillar, (u19(container_upv_1)))
    end
    a1.movingBlock = u19(container_upv_1)
    a1.backdrop = makeSmoothPart_upv_1(container_upv_1)
    a1.backdrop.Size = Vector3.new(900, 900, 1)
    a1.backdrop.Material = Enum.Material.Neon
    a1.backdrop.Color = u1
    local v5 = Instance.new("SurfaceGui")
    v5.Face = Enum.NormalId.Front
    v5.LightInfluence = 0
    v5.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    v5.PixelsPerStud = 1
    markWorldArt_upv_1(v5)
    v5.Parent = a1.backdrop
    local v6 = Instance.new("Frame")
    v6.Size = UDim2.fromScale(1, 1)
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v6.BorderSizePixel = 0
    v6.Parent = v5
    a1.backdropGradient = Instance.new("UIGradient")
    a1.backdropGradient.Rotation = 90
    a1.backdropGradient.Parent = v6
    a1:updateBackdropGradient()
    a1.debris = ObjectPool_upv_1.new(
        function()
            --[[
              line: 154
              upvalues:
                u19 (ref,  index: 1)
                container_upv_1 (copy, index: 2)
            ]]
            return u19(container_upv_1)
        end,
        function(a2)
            --[[
              line: 156
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2.Anchored = true
            a2.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -500, 0))
        end,
        STACK_CONFIG_upv_1.debrisPoolSize
    )
    a1.gems = ObjectPool_upv_1.new(
        function()
            --[[
              line: 163
              upvalues:
                makeGem (ref,  index: 1)
                container_upv_1 (copy, index: 2)
            ]]
            return makeGem(container_upv_1)
        end,
        function(a3)
            --[[
              line: 165
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:parkBlock(a3)
        end,
        STACK_CONFIG_upv_1.gemPoolSize
    )
    a1.gemSparkleAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.gemSparkleAnchor.Transparency = 1
    a1.gemSparkleAnchor.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    local v4 = Instance.new("ParticleEmitter")
    v4.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    v4.Rate = 0
    v4.Lifetime = NumberRange.new(0.25, 0.5)
    v4.Speed = NumberRange.new(6, 12)
    v4.SpreadAngle = Vector2.new(180, 180)
    v4.Size = NumberSequence.new(0.5)
    v4.LightEmission = 1
    v4.Color = ColorSequence.new(u13)
    v4.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1)})
    v4.Parent = a1.gemSparkleAnchor
    a1.gemSparkle = v4
    a1.popups = PopupTextPool_upv_1.new(container_upv_1)
    a1.ring = makeSmoothPart_upv_1(container_upv_1)
    a1.ring.Material = Enum.Material.Neon
    a1.ring.Color = u2
    a1.ring.Transparency = 1
    a1.movingBlock.Material = Enum.Material.Neon
    clearSurfaces(a1.movingBlock)
    a1.particleAnchor = u19(container_upv_1)
    a1.particleAnchor.Transparency = 1
    a1.particleAnchor.Size = Vector3.new(70, 1, 70)
    a1.particleAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -8, 0))
    local v7 = Instance.new("ParticleEmitter")
    v7.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    v7.Rate = 8
    v7.Lifetime = NumberRange.new(4, 7)
    v7.Speed = NumberRange.new(0.8, 1.6)
    v7.SpreadAngle = Vector2.new(12, 12)
    v7.Size = NumberSequence.new(0.32)
    v7.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0.55), NumberSequenceKeypoint.new(1, 1)})
    v7.LightEmission = 0.85
    v7.Color = ColorSequence.new(u2, u3)
    v7.EmissionDirection = Enum.NormalId.Top
    v7.Parent = a1.particleAnchor
    a1.ambientParticles = v7
    a1.flash = Instance.new("Highlight")
    a1.flash.FillColor = Color3.fromRGB(255, 255, 255)
    a1.flash.FillTransparency = 1
    a1.flash.OutlineTransparency = 1
    a1.flash.Parent = container_upv_1
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 217
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_4 = {}
        tbl_4.scoreToStuds = function(a4)
            --[[
              name: scoreToStuds
              line: 228
              upvalues:
                STACK_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a4 * STACK_CONFIG_upv_1.blockHeight
        end
        tbl_4.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 231
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:towerTopY()
        end
        tbl_4.poseMarker = function(a5)
            --[[
              name: poseMarker
              line: 234
              upvalues:
                origin_upv_1 (copy, index: 1)
                u18 (copy, index: 2)
            ]]
            return CFrame.new(origin_upv_1.X, origin_upv_1.Y + a5, origin_upv_1.Z) * u18
        end
        registerRivalMarkers_1(tbl_4)
    end
end
u20.buildScene = u19
u20.resetRound = function(a1)
    --[[
      name: resetRound
      line: 246
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.axis = "x"
    a1.topCenter = Vector2.zero
    a1.topSize = Vector2.new(STACK_CONFIG_upv_1.baseSize, STACK_CONFIG_upv_1.baseSize)
    a1.towerHeight = 1
    a1.slidePhase = -1.5707963267948966
    a1.movingOffset = -STACK_CONFIG_upv_1.slideAmplitude
    a1.renderPrevMovingOffset = a1.movingOffset
    a1.speed = STACK_CONFIG_upv_1.slideSpeedStart
    a1.streak = 0
    a1.score = 0
    a1.gemsCollected = 0
    a1.hue = 0.55
    a1.dropQueued = false
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    a1.cameraFocusY = a1:towerTopY()
    a1.cameraDistanceCurrent = a1:baseCameraDistance()
    a1.cameraYawCurrent = 0
    a1.deathTime = 0
    for _, value_1 in a1.blocks do
        a1:parkBlock(value_1)
    end
    table.clear(a1.recentLayers)
    a1:placeLayer(0, a1.topCenter, a1.topSize)
    a1:layoutFogPillar()
    a1:updateBackdropGradient()
    a1:prepareMovingBlock()
    a1:updateParticleIntensity()
    a1.context.reportScore(0)
end
u20.captureRound = function(a1)
    --[[
      name: captureRound
      line: 277
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        writeResume_upv_1 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        local origin_upv_2 = a1.stage.origin
        local u21 = math.max(a1.towerHeight - STACK_CONFIG_upv_1.visibleTower, 0)
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 283
                  upvalues:
                    a1 (copy, index: 1)
                    u21 (copy, index: 2)
                    STACK_CONFIG_upv_1 (copy, index: 3)
                    origin_upv_2 (copy, index: 4)
                ]]
                a2:int(a1.score):int(a1.towerHeight):int(a1.streak):int(a1.gemsCollected)
                a2:num(a1.hue):num(a1.speed):num(a1.slidePhase):num(a1.movingOffset)
                a2:bool(a1.axis == "z")
                a2:num(a1.topCenter.X):num(a1.topCenter.Y):num(a1.topSize.X):num(a1.topSize.Y)
                a2:int(u21):int(a1.towerHeight - u21)
                local v8 = u21
                local v9 = false
                while true do
                    if v9 then
                        local v10 = v8 + 1
                        v8, v8 = v10, v10
                    else
                        v9 = true
                    end
                    if v8 >= a1.towerHeight then
                        break
                    end
                    local v11 = a1.blocks[(v8 % STACK_CONFIG_upv_1.visibleTower) + 1]
                    a2:num(v11.CFrame.X - origin_upv_2.X):num(v11.CFrame.Z - origin_upv_2.Z)
                    a2:num(v11.Size.X):num(v11.Size.Z)
                end
            end
        )
    end
end
u20.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 308
      upvalues:
        readResume_upv_1 (copy, index: 1)
        STACK_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v12 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 309
            ]]
            local tbl_5 = {}
            tbl_5.score = a3:int()
            tbl_5.towerHeight = a3:int()
            tbl_5.streak = a3:int()
            tbl_5.gemsCollected = a3:int()
            tbl_5.hue = a3:num()
            tbl_5.speed = a3:num()
            tbl_5.slidePhase = a3:num()
            tbl_5.movingOffset = a3:num()
            tbl_5.axisZ = a3:bool()
            tbl_5.topCenterX = a3:num()
            tbl_5.topCenterZ = a3:num()
            tbl_5.topSizeX = a3:num()
            tbl_5.topSizeZ = a3:num()
            tbl_5.lowest = a3:int()
            local v13 = a3:int()
            local tbl_6 = {}
            local v14 = 0
            local v15 = false
            v15, v14 = v15, v14
            while true do
                if v15 then
                    v14 = v14 + 1
                else
                    v15 = true
                end
                if v14 >= v13 then
                    break
                end
                table.insert(tbl_6, {centerX = a3:num(), centerZ = a3:num(), sizeX = a3:num(), sizeZ = a3:num()})
            end
            v14 = table.clone(tbl_5)
            setmetatable(v14, nil)
            v14.layers = tbl_6
            return v14
        end
    )
    if v12 ~= nil and v12.towerHeight >= 1 and STACK_CONFIG_upv_1.visibleTower >= #v12.layers and #v12.layers ~= 0 then
        a1.score = a2.score
        a1.gemsCollected = a2.pickups
        a1.towerHeight = v12.towerHeight
        a1.streak = v12.streak
        a1.hue = v12.hue
        a1.speed = v12.speed
        a1.slidePhase = v12.slidePhase
        a1.movingOffset = v12.movingOffset
        a1.renderPrevMovingOffset = v12.movingOffset
        a1.axis = ((v12.axisZ) and "z") or "x"
        a1.topCenter = Vector2.new(v12.topCenterX, v12.topCenterZ)
        a1.topSize = Vector2.new(v12.topSizeX, v12.topSizeZ)
        a1.dropQueued = false
        a1.dead = false
        a1.deathTime = 0
        a1.roundToken = a1.roundToken + 1
        for _, value_2 in a1.blocks do
            a1:parkBlock(value_2)
        end
        table.clear(a1.recentLayers)
        for key_1, value_3 in v12.layers do
            a1:placeLayer(v12.lowest + (key_1 - 1), Vector2.new(value_3.centerX, value_3.centerZ), Vector2.new(value_3.sizeX, value_3.sizeZ))
        end
        a1:layoutFogPillar()
        a1:updateBackdropGradient()
        a1:prepareMovingBlock()
        a1:updateParticleIntensity()
        a1.cameraFocusY = a1:towerTopY()
        a1.cameraDistanceCurrent = a1:baseCameraDistance()
        a1.cameraYawCurrent = 0
        a1.context.reportScore(a1.score)
        a1.context.reportPickup(a1.gemsCollected)
        return true
    end
    return false
end
u20.snapshot = function(a1)
    --[[
      name: snapshot
      line: 402
    ]]
    local tbl_7 = {}
    table.insert(tbl_7, a1.towerHeight)
    table.insert(tbl_7, #a1.recentLayers)
    for _, value_4 in a1.recentLayers do
        table.insert(tbl_7, value_4.layer)
        table.insert(tbl_7, value_4.centerX)
        table.insert(tbl_7, value_4.centerZ)
        table.insert(tbl_7, value_4.sizeX)
        table.insert(tbl_7, value_4.sizeZ)
    end
    local tbl_8 = {}
    tbl_8.score = a1.score
    tbl_8.values = tbl_7
    return tbl_8
end
u19 = function(a1, a2)
    --[[
      name: updateOpponents
      line: 429
      upvalues:
        u19 (ref,  index: 1)
        STACK_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.matchOpponents = a2
    if #a1.replicaBlocks ~= 0 or a1.stage.getViewRect() == nil then
        return
    end
    for _ = 0, 6 do
        table.insert(a1.replicaBlocks, (u19(a1.stage.container)))
    end
    for _ = 0, STACK_CONFIG_upv_1.fogPillarSegments - 1 do
        table.insert(a1.replicaFog, (u19(a1.stage.container)))
    end
end
u20.updateOpponents = u19
u20.poseReplicaTower = function(a1)
    --[[
      name: poseReplicaTower
      line: 445
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v16 = nil
    if #a1.replicaBlocks ~= 0 then
        local v17 = a1.stage.getViewRect()
        v16 = a1.matchOpponents
        if v16 ~= nil then
            v16 = v16[1]
            if v16 ~= nil then
                v16 = v16.snapshot
            end
        end
        if v17 == nil then
            return nil
        else
            local v18, v19, v20, v21, v22, v23, v24 = nil, nil, nil, nil, nil, nil, nil
            if v16 ~= nil then
                local ViewportSize_1 = a1.stage.camera.ViewportSize
                local v25 = ViewportSize_1.X / math.max(ViewportSize_1.Y, 1)
                local v26 = a1.stage.camera.CFrame.RightVector * ((1 - (2 * ((v17.x0 + v17.x1) / 2))) * (((2 * a1.cameraDistanceCurrent) * math.tan(math.rad(a1.stage.camera.FieldOfView / 2))) * v25))
                local values_1 = v16.values
                v18 = values_1[1]
                if v18 == nil then
                    v18 = 1
                end
                v19 = values_1[2]
                if v19 == nil then
                    v19 = 0
                end
                local v27 = math.min(v19, #a1.replicaBlocks)
                local v28 = a1.cameraFocusY - ((math.max(v18 - 1, 0) * STACK_CONFIG_upv_1.blockHeight) + (STACK_CONFIG_upv_1.blockHeight / 2))
                if a1.replicaLastHeight < v18 then
                    if a1.replicaLastHeight > 0 then
                        a1.replicaDropStartedAt = os.clock()
                    end
                    a1.replicaLastHeight = v18
                end
                local v29 = math.clamp((os.clock() - a1.replicaDropStartedAt) / 0.2, 0, 1)
                local v30 = (1 - v29) * (1 - v29) * 8
                local v31, v32, v33, v34 = nil, nil, nil, nil
                for n_1 = 0, #a1.replicaBlocks - 1 do
                    local v35 = a1.replicaBlocks[n_1 + 1]
                    if v27 <= n_1 then
                        v35.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -500, 0))
                        continue
                    end
                    local v36 = n_1 * 5 + 2
                    v31 = values_1[v36 + 1]
                    if v31 == nil then
                        v31 = 0
                    end
                    local v37
                    v37 = values_1[v36 + 4]
                    if v37 == nil then
                        v37 = STACK_CONFIG_upv_1.baseSize
                    end
                    local blockHeight_1 = STACK_CONFIG_upv_1.blockHeight
                    v32 = values_1[v36 + 5]
                    if v32 == nil then
                        v32 = STACK_CONFIG_upv_1.baseSize
                    end
                    v35.Size = Vector3.new(v37, blockHeight_1, v32)
                    v35.Color = Color3.fromHSV((0.55 + ((v31 * 8) / 360)) % 1, 0.45, 0.55)
                    local origin_3 = a1.stage.origin
                    local v38
                    v38 = values_1[v36 + 2]
                    if v38 == nil then
                        v38 = 0
                    end
                    if n_1 ~= v27 - 1 then
                        v33 = 0
                    else
                        v33 = v30
                    end
                    v34 = values_1[v36 + 3]
                    if v34 == nil then
                        v34 = 0
                    end
                    v35.CFrame = CFrame.new((origin_3 + Vector3.new(v38, ((v31 * STACK_CONFIG_upv_1.blockHeight) + (STACK_CONFIG_upv_1.blockHeight / 2)) + v28 + v33, v34)) + v26)
                end
                local v39 = STACK_CONFIG_upv_1.fogPillarDepth / STACK_CONFIG_upv_1.fogPillarSegments
                local v40 = math.max(STACK_CONFIG_upv_1.fogPillarSegments - 1, 1)
                v20 = values_1[3]
                if v20 == nil then
                    v20 = 0
                end
                local v41 = Color3.fromHSV((0.55 + ((v20 * 8) / 360)) % 1, 0.45, 0.55)
                v21 = values_1[4]
                if v21 == nil then
                    v21 = 0
                end
                v22 = values_1[5]
                if v22 == nil then
                    v22 = 0
                end
                v23 = values_1[6]
                if v23 == nil then
                    v23 = STACK_CONFIG_upv_1.baseSize
                end
                v24 = values_1[7]
                if v24 == nil then
                    v24 = STACK_CONFIG_upv_1.baseSize
                end
                for n_2 = 0, #a1.replicaFog - 1 do
                    local v42 = a1.replicaFog[n_2 + 1]
                    if v27 ~= 0 then
                        v42.Material = Enum.Material.Plastic
                        v42.Color = v41
                        v42.Size = Vector3.new(v23, v39, v24)
                        v42.Transparency = (n_2 / v40) * 0.95
                        v42.CFrame = CFrame.new((a1.stage.origin + Vector3.new(v21, (v20 * STACK_CONFIG_upv_1.blockHeight) + v28 - ((n_2 + 0.5) * v39), v22)) + v26)
                    else
                        v42.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -500, 0))
                    end
                end
            else
                return nil
            end
        end
    else
        return nil
    end
end
u20.revive = function(a1)
    --[[
      name: revive
      line: 579
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v43 = STACK_CONFIG_upv_1.baseSize * STACK_CONFIG_upv_1.reviveMinFootprintRatio
    a1.topSize = Vector2.new(math.max(a1.topSize.X, v43), math.max(a1.topSize.Y, v43))
    a1.streak = 0
    a1.dropQueued = false
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    a1:prepareMovingBlock()
    a1:setRunning(true)
end
u20.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 589
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    a1.renderPrevMovingOffset = a1.movingOffset
    a1.slidePhase = a1.slidePhase + ((a1.speed / STACK_CONFIG_upv_1.slideAmplitude) * a2)
    a1.movingOffset = math.sin(a1.slidePhase) * STACK_CONFIG_upv_1.slideAmplitude
    if a1.dropQueued then
        a1.dropQueued = false
        a1:drop()
    end
end
u20.render = function(a1, a2)
    --[[
      name: render
      line: 602
      upvalues:
        lerp_upv_1 (copy, index: 1)
        STACK_CONFIG_upv_1 (copy, index: 2)
    ]]
    if not (a1.dead) then
        local v44 = lerp_upv_1(a1.renderPrevMovingOffset, a1.movingOffset, a1.renderAlpha)
        local v45
        if a1.axis ~= "x" then
            v45 = Vector2.new(a1.topCenter.X, a1.topCenter.Y + v44)
        else
            v45 = Vector2.new(a1.topCenter.X + v44, a1.topCenter.Y)
        end
        a1.movingBlock.CFrame = CFrame.new(a1.stage.origin + Vector3.new(v45.X, a1:towerTopY() + (STACK_CONFIG_upv_1.blockHeight / 2), v45.Y))
    end
    a1.cameraFocusY = a1.cameraFocusY + ((a1:towerTopY() + 2 - a1.cameraFocusY) * math.min(a2 * 5, 1))
    a1.cameraDistanceCurrent = a1.cameraDistanceCurrent + ((a1:baseCameraDistance() - a1.cameraDistanceCurrent) * math.min(a2 * 4, 1))
    a1.cameraYawCurrent = a1.cameraYawCurrent + ((0 - a1.cameraYawCurrent) * math.min(a2 * 4, 1))
    a1:poseCamera(a1.cameraFocusY)
    a1:poseReplicaTower()
end
u20.baseCameraDistance = function(a1)
    --[[
      name: baseCameraDistance
      line: 620
      upvalues:
        portraitCameraDistance_upv_1 (copy, index: 1)
        STACK_CONFIG_upv_1 (copy, index: 2)
    ]]
    return portraitCameraDistance_upv_1(STACK_CONFIG_upv_1.cameraDistance, STACK_CONFIG_upv_1.cameraPortraitZoomOut, a1.stage.camera.ViewportSize)
end
u20.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 623
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        a1.deathTime = a1.deathTime + a2
        local v46 = math.min(a1.deathTime / STACK_CONFIG_upv_1.deathZoomSeconds, 1)
        local v47 = 1 - (1 - v46) * (1 - v46)
        local v48 = math.min(a1.deathTime / (STACK_CONFIG_upv_1.deathZoomSeconds * 2), 1)
        local v49 = a1:baseCameraDistance()
        a1.cameraDistanceCurrent = v49 + ((a1.deathZoomTarget - v49) * v47)
        a1.cameraYawCurrent = STACK_CONFIG_upv_1.deathOrbitRadians * (1 - ((1 - v48) * (1 - v48)))
        a1.cameraFocusY = a1.deathFocusStartY + ((a1.deathFocusTargetY - a1.deathFocusStartY) * v47)
        a1:poseCamera(a1.cameraFocusY)
        a1:poseReplicaTower()
    else
        return nil
    end
end
u20.withStripOffset = function(a1, a2)
    --[[
      name: withStripOffset
      line: 640
    ]]
    local v50 = a1.stage.getViewRect()
    local v51 = nil
    if v50 ~= nil then
        v51 = (v50.x0 + v50.x1) / 2
        if math.abs(v51 - 0.5) >= 0.001 then
            local ViewportSize_2 = a1.stage.camera.ViewportSize
            local v52 = ViewportSize_2.X / math.max(ViewportSize_2.Y, 1)
            return a2 * CFrame.new((0.5 - v51) * (((2 * a1.cameraDistanceCurrent) * math.tan(math.rad(a1.stage.camera.FieldOfView / 2))) * v52), 0, 0)
        end
    end
    return a2
end
u20.poseCamera = function(a1, a2)
    --[[
      name: poseCamera
      line: 656
      upvalues:
        Unit_upv_1 (copy, index: 1)
    ]]
    local v53 = a1.stage.origin + Vector3.new(a1.topCenter.X, a2, a1.topCenter.Y)
    local v54 = math.cos(a1.cameraYawCurrent)
    local v55 = math.sin(a1.cameraYawCurrent)
    local v56 = Vector3.new((Unit_upv_1.X * v54) + (Unit_upv_1.Z * v55), Unit_upv_1.Y, (-Unit_upv_1.X * v55) + (Unit_upv_1.Z * v54))
    a1.stage.setCameraCFrame(a1:withStripOffset(CFrame.lookAt(v53 - (v56 * a1.cameraDistanceCurrent), v53)))
    local v57 = v53 + v56 * 220
    a1.backdrop.CFrame = CFrame.lookAt(v57, v57 - v56)
    a1.particleAnchor.CFrame = CFrame.new(v53 - Vector3.new(0, 16, 0))
end
u20.onPress = function(a1)
    --[[
      name: onPress
      line: 675
    ]]
    if (a1.dead) then
        return
    end
    a1.dropQueued = true
end
u20.drop = function(a1)
    --[[
      name: drop
      line: 680
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        u10 (copy, index: 2)
        u11 (copy, index: 3)
        u9 (copy, index: 4)
    ]]
    local v58 = a1.axis == "x"
    local v59
    if v58 then
        v59 = a1.topSize.X
    else
        v59 = a1.topSize.Y
    end
    local movingOffset_1 = a1.movingOffset
    if v59 > math.abs(movingOffset_1) then
        local v60 = math.abs(movingOffset_1) <= STACK_CONFIG_upv_1.perfectEpsilon
        local v61
        if v58 then
            v61 = a1.topCenter.X
        else
            v61 = a1.topCenter.Y
        end
        local v62
        if v60 then
            a1.streak = a1.streak + 1
            if STACK_CONFIG_upv_1.perfectStreakForRegrow > a1.streak then
                v62 = v59
            else
                a1.topSize = Vector2.new(math.min(a1.topSize.X + STACK_CONFIG_upv_1.perfectRegrow, STACK_CONFIG_upv_1.baseSize), math.min(a1.topSize.Y + STACK_CONFIG_upv_1.perfectRegrow, STACK_CONFIG_upv_1.baseSize))
                if v58 then
                    v62 = a1.topSize.X
                else
                    v62 = a1.topSize.Y
                end
            end
        else
            a1.streak = 0
            local v63 = v59 - math.abs(movingOffset_1)
            local v64 = v61 + movingOffset_1 / 2
            a1:spawnDebris(movingOffset_1, v59, v64)
            v61, v62 = v64, v63
        end
        if v58 then
            a1.topCenter = Vector2.new(v61, a1.topCenter.Y)
            a1.topSize = Vector2.new(v62, a1.topSize.Y)
        else
            a1.topCenter = Vector2.new(a1.topCenter.X, v61)
            a1.topSize = Vector2.new(a1.topSize.X, v62)
        end
        local v65 = a1:placeLayer(a1.towerHeight, a1.topCenter, a1.topSize)
        a1:squash(v65)
        a1.towerHeight = a1.towerHeight + 1
        a1.score = a1.score + ((v60 and 2) or 1)
        a1.context.reportScore(a1.score)
        local v66 = v65.Position + Vector3.new(0, STACK_CONFIG_upv_1.blockHeight + 1, 0)
        if v60 then
            a1.context.audio.play("thud", {})
            a1.context.audio.play("perfect", {pitch = (math.min(a1.streak, 8) * 0.08) + 1})
            a1.stage.shake(0.3)
            local popups_1 = a1.popups
            local v67 = ((a1.streak <= 1) and "PERFECT!") or (("PERFECT \195\151%*"):format(a1.streak))
            popups_1:show(v66, v67, u10, 1.1)
            a1:burstRing(v65)
            a1:flashBlock(v65)
            if a1.streak >= 2 then
                a1:neonWave()
            end
            if STACK_CONFIG_upv_1.gemStreakThreshold <= a1.streak then
                a1:dropGems(v65)
            end
        else
            a1.context.audio.play("thud", {})
            if math.abs(movingOffset_1) / v59 <= 0.45 then
                a1.popups:show(v66, "+1", u9, 0.7)
            else
                a1.stage.shake(0.2)
                a1.popups:show(v66, "CLOSE!", u11, 0.9)
            end
        end
        a1:updateParticleIntensity()
        a1.axis = (v58 and "z") or "x"
        a1.slidePhase = -1.5707963267948966
        a1.movingOffset = -STACK_CONFIG_upv_1.slideAmplitude
        a1.renderPrevMovingOffset = a1.movingOffset
        a1.speed = math.min(a1.speed + STACK_CONFIG_upv_1.slideSpeedPerBlock, STACK_CONFIG_upv_1.slideSpeedMax)
        a1.hue = (a1.hue + 0.022222222222222223) % 1
        a1:updateBackdropGradient()
        a1:prepareMovingBlock()
    else
        a1:die()
        return nil
    end
end
u20.updateBackdropGradient = function(a1)
    --[[
      name: updateBackdropGradient
      line: 765
    ]]
    a1.backdropGradient.Color = ColorSequence.new(Color3.fromHSV(a1.hue, 0.5, 0.55), Color3.fromHSV((a1.hue + 0.07) % 1, 0.62, 0.2))
end
u20.squash = function(a1, a2)
    --[[
      name: squash
      line: 770
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
    ]]
    local Size_1 = a2.Size
    a2.Size = Vector3.new(Size_1.X * 1.05, Size_1.Y * 0.7, Size_1.Z * 1.05)
    local tbl_9 = {}
    tbl_9.Size = Size_1
    TweenService_upv_1:Create(a2, u5, tbl_9):Play()
end
u20.burstRing = function(a1, a2)
    --[[
      name: burstRing
      line: 777
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    local ring_1 = a1.ring
    ring_1.Size = Vector3.new(a2.Size.X + 0.5, 0.4, a2.Size.Z + 0.5)
    ring_1.CFrame = CFrame.new(a2.Position + Vector3.new(0, STACK_CONFIG_upv_1.blockHeight / 2, 0))
    ring_1.Transparency = 0.15
    local tbl_10 = {}
    tbl_10.Size = Vector3.new(a2.Size.X * 1.9, 0.15, a2.Size.Z * 1.9)
    TweenService_upv_1:Create(ring_1, u6, tbl_10):Play()
end
u20.flashBlock = function(a1, a2)
    --[[
      name: flashBlock
      line: 789
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
    ]]
    a1.flash.Adornee = a2
    a1.flash.FillTransparency = 0.35
    TweenService_upv_1:Create(a1.flash, u7, {}):Play()
end
u20.neonWave = function(a1)
    --[[
      name: neonWave
      line: 796
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        u4 (copy, index: 4)
    ]]
    local v68 = math.min(a1.towerHeight, 12)
    local v69 = 0
    local v70 = false
    v70, v69 = v70, v69
    while true do
        if v70 then
            v69 = v69 + 1
        else
            v70 = true
        end
        if v69 >= v68 then
            break
        end
        local u22 = a1.blocks[(((a1.towerHeight - 1) - v69) % STACK_CONFIG_upv_1.visibleTower) + 1]
        task.delay(
            v69 * 0.05,
            function()
                --[[
                  line: 813
                  upvalues:
                    u22 (copy, index: 1)
                    TweenService_upv_1 (copy, index: 2)
                    u8 (copy, index: 3)
                    u4 (copy, index: 4)
                ]]
                u22.Material = Enum.Material.Neon
                local tbl_11 = {}
                tbl_11.Color = u4
                TweenService_upv_1:Create(u22, u8, tbl_11):Play()
                task.delay(
                    0.36,
                    function()
                        --[[
                          line: 819
                          upvalues:
                            u22 (copy, index: 1)
                        ]]
                        u22.Material = Enum.Material.Plastic
                    end
                )
            end
        )
    end
end
u20.dropGems = function(a1, a2)
    --[[
      name: dropGems
      line: 826
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        u14 (copy, index: 3)
        u15 (copy, index: 4)
        TweenService_upv_1 (copy, index: 5)
        u16 (copy, index: 6)
        u17 (copy, index: 7)
    ]]
    local v71 = math.min(math.floor((a1.streak - STACK_CONFIG_upv_1.gemStreakThreshold) / STACK_CONFIG_upv_1.gemEscalationEvery) + 1, STACK_CONFIG_upv_1.gemMaxPerPerfect)
    local v72 = a2.Position + Vector3.new(0, (STACK_CONFIG_upv_1.blockHeight / 2) + 0.6, 0)
    a1.gemSparkleAnchor.CFrame = CFrame.new(v72)
    a1.gemSparkle:Emit((v71 * 5) + 6)
    a1.context.audio.play("coinTick", {pitch = (math.min(v71 - 1, 2) * 0.12) + 1})
    local v73 = 0
    local v74 = false
    while true do
        if v74 then
            v73 = v73 + 1
        else
            v74 = true
        end
        if v73 >= v71 then
            break
        end
        local u23 = a1.gems:acquire()
        local v75 = tbl_upv_1[math.min(v73, #tbl_upv_1 - 1) + 1]
        u23.Size = Vector3.new(0.8999999761581421, 0.8999999761581421, 0.8999999761581421)
        u23.Transparency = 0
        local v76 = CFrame.new(v72 + v75) * u14
        u23.CFrame = v76
        local tbl_12 = {}
        tbl_12.CFrame = (v76 + Vector3.new(0, STACK_CONFIG_upv_1.gemRiseStuds, 0)) * u15
        TweenService_upv_1:Create(u23, u16, tbl_12):Play()
        TweenService_upv_1:Create(u23, u17, {}):Play()
        task.delay(
            0.9,
            function()
                --[[
                  line: 864
                  upvalues:
                    a1 (copy, index: 1)
                    u23 (copy, index: 2)
                ]]
                return a1.gems:release(u23)
            end
        )
    end
    a1.gemsCollected = a1.gemsCollected + v71
    a1.context.reportPickup(a1.gemsCollected)
end
u20.updateParticleIntensity = function(a1)
    --[[
      name: updateParticleIntensity
      line: 872
    ]]
    local streak_1 = a1.streak
    a1.ambientParticles.Rate = math.min(8 + (streak_1 * 8), 56)
    a1.ambientParticles.Speed = NumberRange.new(0.8 + (streak_1 * 0.5), 1.6 + (streak_1 * 0.8))
end
u20.spawnDebris = function(a1, a2, a3, a4)
    --[[
      name: spawnDebris
      line: 877
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local u24
    local u25 = u24.debris:acquire()
    local v77 = math.sign(a2)
    local v78
    if u24.axis ~= "x" then
        v78, u24 = u24.topCenter.Y, a1
    else
        v78 = u24.topCenter.X
        u24 = a1
    end
    local v79 = v78 + (v77 * (a3 / 2)) + a2 / 2
    local v80 = u24:towerTopY() + STACK_CONFIG_upv_1.blockHeight / 2
    if u24.axis ~= "x" then
        u25.Size = Vector3.new(u24.topSize.X, STACK_CONFIG_upv_1.blockHeight, math.abs(a2))
        u25.CFrame = CFrame.new(u24.stage.origin + Vector3.new(u24.topCenter.X, v80, v79))
    else
        u25.Size = Vector3.new(math.abs(a2), STACK_CONFIG_upv_1.blockHeight, u24.topSize.Y)
        u25.CFrame = CFrame.new(u24.stage.origin + Vector3.new(v79, v80, u24.topCenter.Y))
    end
    u25.Color = Color3.fromHSV(u24.hue, 0.45, 0.4)
    u25.Anchored = false
    u25.AssemblyLinearVelocity = Vector3.new(((u24.axis ~= "x") and 0) or (v77 * 6), 2, ((u24.axis ~= "z") and 0) or (v77 * 6))
    u25.AssemblyAngularVelocity = Vector3.new((math.random() * 4) - 2, 0, (math.random() * 4) - 2)
    task.delay(
        2,
        function()
            --[[
              line: 897
              upvalues:
                u24 (copy, index: 1)
                u25 (copy, index: 2)
            ]]
            return u24.debris:release(u25)
        end
    )
end
u20.placeLayer = function(a1, a2, a3, a4)
    --[[
      name: placeLayer
      line: 901
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v81 = a1.blocks[(a2 % STACK_CONFIG_upv_1.visibleTower) + 1]
    v81.Size = Vector3.new(a4.X, STACK_CONFIG_upv_1.blockHeight, a4.Y)
    v81.Color = Color3.fromHSV(a1.hue, 0.45, 0.55)
    v81.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a3.X, (a2 * STACK_CONFIG_upv_1.blockHeight) + (STACK_CONFIG_upv_1.blockHeight / 2), a3.Y))
    table.insert(a1.recentLayers, {layer = a2, centerX = a3.X, centerZ = a3.Y, sizeX = a4.X, sizeZ = a4.Y})
    if #a1.recentLayers > 7 then
        table.remove(a1.recentLayers, 1)
    end
    return v81
end
u20.prepareMovingBlock = function(a1)
    --[[
      name: prepareMovingBlock
      line: 924
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.movingBlock.Anchored = true
    a1.movingBlock.Size = Vector3.new(a1.topSize.X, STACK_CONFIG_upv_1.blockHeight, a1.topSize.Y)
    a1.movingBlock.Color = Color3.fromHSV((a1.hue + 0.022222222222222223) % 1, 0.18, 0.66)
end
u20.movingCenter = function(a1)
    --[[
      name: movingCenter
      line: 930
    ]]
    if a1.axis ~= "x" then
        return (Vector2.new(a1.topCenter.X, a1.topCenter.Y + a1.movingOffset))
    end
    return (Vector2.new(a1.topCenter.X + a1.movingOffset, a1.topCenter.Y))
end
u20.towerTopY = function(a1)
    --[[
      name: towerTopY
      line: 933
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.towerHeight * STACK_CONFIG_upv_1.blockHeight
end
u20.parkBlock = function(a1, a2)
    --[[
      name: parkBlock
      line: 936
    ]]
    a2.Anchored = true
    a2.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -500, 0))
end
u20.layoutFogPillar = function(a1)
    --[[
      name: layoutFogPillar
      line: 942
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1:layoutFogColumn(0, 0, 0, STACK_CONFIG_upv_1.baseSize, STACK_CONFIG_upv_1.baseSize, Color3.fromHSV(0.55, 0.45, 0.55))
end
u20.layoutFogColumn = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: layoutFogColumn
      line: 946
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v82 = STACK_CONFIG_upv_1.fogPillarDepth / STACK_CONFIG_upv_1.fogPillarSegments
    local v83 = math.max(STACK_CONFIG_upv_1.fogPillarSegments - 1, 1)
    for n_3 = 0, #a1.fogPillar - 1 do
        local v84 = a1.fogPillar[n_3 + 1]
        v84.Material = Enum.Material.Plastic
        v84.Color = a7
        v84.Size = Vector3.new(a5, v82, a6)
        v84.Transparency = (n_3 / v83) * 0.95
        v84.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2, a4 - ((n_3 + 0.5) * v82), a3))
    end
end
u20.die = function(a1)
    --[[
      name: die
      line: 960
      upvalues:
        STACK_CONFIG_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1.streak = 0
    a1:updateParticleIntensity()
    a1.deathTime = 0
    a1.deathFocusStartY = a1.cameraFocusY
    local v85 = a1:towerTopY()
    local v86 = v85 - math.min(a1.towerHeight, STACK_CONFIG_upv_1.visibleTower) * STACK_CONFIG_upv_1.blockHeight
    if v86 > 0 then
        local v87 = a1.blocks[(a1.towerHeight % STACK_CONFIG_upv_1.visibleTower) + 1]
        local v88 = v87.Position - a1.stage.origin
        a1:layoutFogColumn(v88.X, v88.Z, v86, v87.Size.X, v87.Size.Z, v87.Color)
    end
    local v89 = v85 + STACK_CONFIG_upv_1.deathZoomMarginStuds
    local v90 = v86 - STACK_CONFIG_upv_1.deathFogRevealStuds
    a1.deathFocusTargetY = (v89 + v90) / 2
    a1.deathZoomTarget = math.clamp(((v89 - v90) / 2) / math.tan(math.rad(a1.stage.camera.FieldOfView) / 2), a1:baseCameraDistance(), STACK_CONFIG_upv_1.deathZoomMaxDistance)
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(1)
    a1.popups:show(a1.movingBlock.Position + Vector3.new(0, 3, 0), "MISS!", u12, 1.2)
    a1.movingBlock.Anchored = false
    local v91 = math.sign(a1.movingOffset)
    local movingBlock_1 = a1.movingBlock
    movingBlock_1.AssemblyLinearVelocity = Vector3.new(((a1.axis ~= "x") and 0) or (v91 * 10), -4, ((a1.axis ~= "z") and 0) or (v91 * 10))
    task.delay(
        2.5,
        function()
            --[[
              line: 1008
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.movingBlock.Anchored = true
        end
    )
    local score_upv_1 = a1.score
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        STACK_CONFIG_upv_1.endRunDelaySeconds,
        function()
            --[[
              line: 1013
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
makeGem = function(a1)
    --[[
      name: makeGem
      line: 1021
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    local v92 = makeSmoothPart_upv_1(a1)
    v92.Material = Enum.Material.Neon
    v92.Color = u13
    v92.Size = Vector3.new(0.8999999761581421, 0.8999999761581421, 0.8999999761581421)
    return v92
end
u19 = function(a1)
    --[[
      name: makeBlock
      line: 1028
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v93 = makeStagePart_upv_1(a1)
    v93.TopSurface = Enum.SurfaceType.Weld
    v93.BottomSurface = Enum.SurfaceType.Weld
    v93.FrontSurface = Enum.SurfaceType.Weld
    v93.BackSurface = Enum.SurfaceType.Weld
    v93.LeftSurface = Enum.SurfaceType.Weld
    v93.RightSurface = Enum.SurfaceType.Weld
    return v93
end
clearSurfaces = function(a1)
    --[[
      name: clearSurfaces
      line: 1040
    ]]
    a1.TopSurface = Enum.SurfaceType.Smooth
    a1.BottomSurface = Enum.SurfaceType.Smooth
    a1.FrontSurface = Enum.SurfaceType.Smooth
    a1.BackSurface = Enum.SurfaceType.Smooth
    a1.LeftSurface = Enum.SurfaceType.Smooth
    a1.RightSurface = Enum.SurfaceType.Smooth
end
local tbl_13 = {}
tbl_13.StackGame = u20
return tbl_13