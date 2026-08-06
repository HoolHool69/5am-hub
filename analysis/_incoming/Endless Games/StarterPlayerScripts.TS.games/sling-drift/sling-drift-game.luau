-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local CROSSY_ROAD_NOTE_SCALARS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "crossy-road", "crossy-road-assets").CROSSY_ROAD_NOTE_SCALARS
local DEFAULT_GAME_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").DEFAULT_GAME_LIGHTING
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local pausedAtom_upv_1 = v2.pausedAtom
local publishCombo_upv_1 = v2.publishCombo
local SLING_DRIFT_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "sling-drift-config").SLING_DRIFT_CONFIG
local v3 = RuntimeLib_1.import(script, script.Parent, "sling-drift-decor")
local modelAabb_upv_1 = v3.modelAabb
local SlingDecor_upv_1 = v3.SlingDecor
local v4 = RuntimeLib_1.import(script, script.Parent, "sling-drift-sim")
local abeamDistance_upv_1 = v4.abeamDistance
local beginPress_upv_1 = v4.beginPress
local cancelPress_upv_1 = v4.cancelPress
local createCar_upv_1 = v4.createCar
local createTrack_upv_1 = v4.createTrack
local directionX_upv_1 = v4.directionX
local directionY_upv_1 = v4.directionY
local endPress_upv_1 = v4.endPress
local normalizeAngle_upv_1 = v4.normalizeAngle
local resetRun_upv_1 = v4.resetRun
local reviveOnRoad_upv_1 = v4.reviveOnRoad
local ringSlot_upv_1 = v4.ringSlot
local stepSling_upv_1 = v4.stepSling
local u1 = CFrame.new(0, -1000, 0)
local u2 = SLING_DRIFT_CONFIG_upv_1.roadWidthStuds * 0.5
local u3 = SLING_DRIFT_CONFIG_upv_1.roadWidthStuds / 6
local u4 = CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1), Vector3.new(1, 0, 0))
local u5 = Color3.fromRGB(110, 190, 80)
local u6 = Color3.fromRGB(78, 82, 92)
local u7 = Color3.fromRGB(68, 72, 82)
local u8 = Color3.fromRGB(98, 104, 116)
local u9 = Color3.fromRGB(206, 214, 236)
local u10 = Color3.fromRGB(238, 190, 68)
local u11 = Color3.fromRGB(252, 232, 148)
local u12 = Color3.fromRGB(255, 236, 128)
local u13 = Color3.fromRGB(255, 253, 224)
local u14 = Color3.fromRGB(228, 72, 62)
local u15 = Color3.fromRGB(40, 48, 66)
local u16 = Color3.fromRGB(255, 246, 206)
local u17 = Color3.fromRGB(30, 32, 40)
local u18 = Color3.fromRGB(252, 238, 158)
local u19 = Color3.fromRGB(44, 48, 58)
local u20 = Color3.fromRGB(255, 255, 255)
local u21 = Color3.fromRGB(255, 92, 80)
local u22 = Color3.fromRGB(126, 232, 255)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 156
    ]]
    return "SlingDriftGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u23 = setmetatable(tbl_1, tbl_2)
u23.__index = u23
u23.new = function(...)
    --[[
      name: new
      line: 162
      upvalues:
        u23 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u23)
    return v5:constructor(...) or v5
end
u23.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 166
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        createCar_upv_1 (copy, index: 2)
        createTrack_upv_1 (copy, index: 3)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.car = createCar_upv_1()
    a1.track = createTrack_upv_1(SLING_DRIFT_CONFIG_upv_1.trackRingCapacity)
    a1.renderPreviousX = 0
    a1.renderPreviousY = 0
    a1.renderHeading = 0
    a1.renderPreviousHeading = 0
    a1.cameraX = 0
    a1.cameraY = 0
    a1.cameraAimX = 0
    a1.cameraAimY = 0
    a1.crashClock = -1
    a1.crashVelocityX = 0
    a1.crashVelocityY = 0
    a1.tetherResumeArmed = false
    a1.feverFlashClock = 0
    a1.feverLaneApplied = false
    a1.skidTravel = 0
    a1.skidIndex = 0
    a1.dressedThrough = -1
    a1.tetherDrawnRadius = -1
    a1.litCornerSlot = -1
    a1.lastLatchCount = 0
    a1.lastReleaseCount = 0
    a1.lastScore = 0
    a1.corners = {}
    a1.skidParts = {}
    a1.skidLife = {}
end
u23.buildScene = function(a1)
    --[[
      name: buildScene
      line: 196
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u5 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u19 (copy, index: 5)
        u1 (copy, index: 6)
        u18 (copy, index: 7)
        u20 (copy, index: 8)
        PopupTextPool_upv_1 (copy, index: 9)
        SlingDecor_upv_1 (copy, index: 10)
        readLightingFolderProfile_upv_1 (copy, index: 11)
        CROSSY_ROAD_NOTE_SCALARS_upv_1 (copy, index: 12)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 13)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(SLING_DRIFT_CONFIG_upv_1.frameWidthFloorStuds)
    a1.field = makeFrontalBackdrop_upv_1(a1.stage, u5, Enum.Material.SmoothPlastic)
    for _ = 0, SLING_DRIFT_CONFIG_upv_1.trackRingCapacity - 1 do
        table.insert(a1.corners, (a1:buildCornerKit(container_1)))
    end
    for _ = 0, SLING_DRIFT_CONFIG_upv_1.skidPoolSize - 1 do
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Size = Vector3.new(1.5, 0.550000011920929, 0.14000000059604645)
        v6.Color = u19
        v6.Transparency = 1
        v6.CFrame = u1
        table.insert(a1.skidParts, v6)
        table.insert(a1.skidLife, 0)
    end
    a1:buildCar(container_1)
    a1.tether = makeSmoothPart_upv_1(container_1)
    a1.tether.Size = Vector3.new(1, 0.41999998688697815, 0.3499999940395355)
    a1.tether.Color = u18
    a1.tether.Transparency = 1
    a1.tether.CFrame = u1
    a1.flash = makeSmoothPart_upv_1(container_1)
    a1.flash.Size = Vector3.new(400, 400, 1)
    a1.flash.Color = u20
    a1.flash.Transparency = 1
    a1.flash.CFrame = u1
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1.decor = SlingDecor_upv_1.new(container_1, a1.stage.origin, a1.track)
    if a1.decor.kitLighting ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(a1.decor.kitLighting, CROSSY_ROAD_NOTE_SCALARS_upv_1, DEFAULT_GAME_LIGHTING_upv_1))
    end
    a1:connectInput()
end
u23.buildCornerKit = function(a1, a2)
    --[[
      name: buildCornerKit
      line: 248
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        u1 (copy, index: 3)
        u8 (copy, index: 4)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 5)
        u10 (copy, index: 6)
        u11 (copy, index: 7)
    ]]
    local v7 = makeSmoothPart_upv_1(a2)
    v7.Color = u7
    v7.CFrame = u1
    local v8 = makeSmoothPart_upv_1(a2)
    v8.Color = u8
    v8.CFrame = u1
    local v9 = makeSmoothPart_upv_1(a2)
    v9.Color = u7
    v9.CFrame = u1
    local v10 = makeSmoothPart_upv_1(a2)
    v10.Color = u8
    v10.CFrame = u1
    local v11 = makeSmoothPart_upv_1(a2)
    v11.Color = u8
    v11.CFrame = u1
    local v12 = makeSmoothPart_upv_1(a2)
    v12.Shape = Enum.PartType.Cylinder
    v12.Size = Vector3.new(SLING_DRIFT_CONFIG_upv_1.postHeightStuds, SLING_DRIFT_CONFIG_upv_1.postRadiusStuds * 2, SLING_DRIFT_CONFIG_upv_1.postRadiusStuds * 2)
    v12.Color = u10
    v12.CFrame = u1
    local v13 = makeSmoothPart_upv_1(a2)
    v13.Shape = Enum.PartType.Cylinder
    v13.Size = Vector3.new(0.4, SLING_DRIFT_CONFIG_upv_1.postRadiusStuds * 1.5, SLING_DRIFT_CONFIG_upv_1.postRadiusStuds * 1.5)
    v13.Color = u11
    v13.CFrame = u1
    local v14 = Instance.new("BillboardGui")
    v14.Size = UDim2.fromScale(3.2, 1.6)
    v14.AlwaysOnTop = true
    v14.Parent = v13
    local v15 = Instance.new("TextLabel")
    v15.BackgroundTransparency = 1
    v15.Size = UDim2.fromScale(1, 1)
    v15.Font = Enum.Font.GothamBlack
    v15.TextScaled = true
    v15.TextColor3 = u11
    v15.TextStrokeTransparency = 0.35
    v15.Text = ""
    v15.Parent = v14
    local tbl_3 = {}
    tbl_3.straight = v7
    tbl_3.straightLane = v8
    tbl_3.elbow = v9
    tbl_3.elbowLaneEntry = v10
    tbl_3.elbowLaneExit = v11
    tbl_3.post = v12
    tbl_3.postCap = v13
    tbl_3.label = v15
    return tbl_3
end
u23.buildCar = function(a1, a2)
    --[[
      name: buildCar
      line: 303
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u14 (copy, index: 3)
    ]]
    a1.carModel = Instance.new("Model")
    local carLengthStuds_1 = SLING_DRIFT_CONFIG_upv_1.carLengthStuds
    local carWidthStuds_1 = SLING_DRIFT_CONFIG_upv_1.carWidthStuds
    a1.carBody = makeStagePart_upv_1(a1.carModel)
    a1.carBody.Size = Vector3.new(carLengthStuds_1, carWidthStuds_1, 1.5)
    a1.carBody.Color = u14
    a1.carBody.CFrame = CFrame.new(0, 0, 2.6)
    a1.carModel.PrimaryPart = a1.carBody
    if a1:buildAuthoredCar() then
        a1.carBody.Transparency = 1
    else
        a1:buildProceduralCar(carLengthStuds_1, carWidthStuds_1)
    end
    a1:finishCar(a2)
end
u23.buildAuthoredCar = function(a1)
    --[[
      name: buildAuthoredCar
      line: 319
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        modelAabb_upv_1 (copy, index: 2)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 3)
        u4 (copy, index: 4)
    ]]
    local v16 = waitForSceneryRoot_upv_1("TP", "sling-drift")
    local v17 = nil
    if v16 ~= nil then
        v17 = v16:FindFirstChild("PlayerCar")
        if v17 ~= nil then
            local v18 = nil
            if v17:IsA("Model") then
                local v19 = v17:Clone()
                for _, value_1 in v19:GetDescendants() do
                    if value_1:IsA("BasePart") then
                        value_1.Anchored = true
                        value_1.CanCollide = false
                        value_1.CanQuery = false
                        value_1.CanTouch = false
                        value_1.CastShadow = false
                        continue
                    end
                    if value_1:IsA("Beam") or value_1:IsA("Sound") or value_1:IsA("ParticleEmitter") then
                        value_1:Destroy()
                    end
                end
                v18 = modelAabb_upv_1(v19)
                local v20 = nil
                if v18 ~= nil then
                    v20 = v18.max.Z - v18.min.Z
                    local v21 = nil
                    if v20 >= 0.05 then
                        v19:ScaleTo(v19:GetScale() * (SLING_DRIFT_CONFIG_upv_1.carLengthStuds / v20))
                        v21 = modelAabb_upv_1(v19)
                        if v21 ~= nil then
                            v19.WorldPivot = CFrame.new((v21.min + v21.max) * 0.5)
                            v19:PivotTo(a1.carBody.CFrame * u4)
                            v19.Parent = a1.carModel
                            return true
                        end
                    end
                end
                v19:Destroy()
            end
        end
    end
    return false
end
u23.buildProceduralCar = function(a1, a2, a3)
    --[[
      name: buildProceduralCar
      line: 365
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
        u16 (copy, index: 3)
        u17 (copy, index: 4)
    ]]
    local v22 = makeSmoothPart_upv_1(a1.carModel)
    v22.Size = Vector3.new(a2 * 0.42, a3 * 0.72, 0.6)
    v22.Color = u15
    v22.CFrame = CFrame.new(-a2 * 0.06, 0, 3.5)
    for n_1 = 0, 1 do
        local v23 = ((n_1 ~= 0) and -1) or 1
        local v24 = makeSmoothPart_upv_1(a1.carModel)
        v24.Size = Vector3.new(0.42, a3 * 0.24, 0.5)
        v24.Color = u16
        v24.CFrame = CFrame.new(a2 * 0.44, (v23 * a3) * 0.28, 3.35)
    end
    local tbl_4 = {0.32, -0.32}
    for n_2 = 0, #tbl_4 - 1 do
        for n_3 = 0, 1 do
            local v25
            v25 = ((n_3 ~= 0) and -1) or 1
            local v26 = makeSmoothPart_upv_1(a1.carModel)
            v26.Size = Vector3.new(a2 * 0.26, 0.5, 1.1)
            v26.Color = u17
            v26.CFrame = CFrame.new(a2 * tbl_4[n_2 + 1], v25 * ((a3 * 0.5) + 0.1), 2.1)
        end
    end
end
u23.finishCar = function(a1, a2)
    --[[
      name: finishCar
      line: 388
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    a1.driftSmoke = Instance.new("ParticleEmitter")
    a1.driftSmoke.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.driftSmoke.Rate = 46
    a1.driftSmoke.Enabled = false
    a1.driftSmoke.Lifetime = NumberRange.new(0.24, 0.44)
    a1.driftSmoke.Speed = NumberRange.new(1.5, 4.5)
    a1.driftSmoke.SpreadAngle = Vector2.new(180, 180)
    a1.driftSmoke.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 1.6)})
    local tbl_5 = {NumberSequenceKeypoint.new(0, 0.35), NumberSequenceKeypoint.new(1, 1)}
    a1.driftSmoke.Transparency = NumberSequence.new(tbl_5)
    a1.driftSmoke.Color = ColorSequence.new(Color3.fromRGB(226, 230, 238))
    a1.driftSmoke.Parent = a1.carBody
    a1.carModel.Parent = a2
end
u23.connectInput = function(a1)
    --[[
      name: connectInput
      line: 403
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        pausedAtom_upv_1 (copy, index: 2)
    ]]
    local input_1 = a1.context.input
    a1.context.janitor:Add(
        input_1.pressBegan:Connect(
            function()
                --[[
                  line: 405
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPressBegan()
            end
        )
    )
    a1.context.janitor:Add(
        input_1.pressEnded:Connect(
            function()
                --[[
                  line: 408
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPressEnded()
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function(a2)
                --[[
                  line: 411
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPauseChanged(a2)
            end
        )
    )
end
u23.onPressBegan = function(a1)
    --[[
      name: onPressBegan
      line: 415
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        beginPress_upv_1 (copy, index: 2)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 3)
    ]]
    if not (pausedAtom_upv_1()) and a1:isRunning() and a1.car.alive then
        a1.tetherResumeArmed = false
        beginPress_upv_1(a1.car, a1.track, SLING_DRIFT_CONFIG_upv_1)
        return
    end
    return nil
end
u23.onPressEnded = function(a1)
    --[[
      name: onPressEnded
      line: 425
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        cancelPress_upv_1 (copy, index: 2)
        endPress_upv_1 (copy, index: 3)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 4)
    ]]
    if not (pausedAtom_upv_1()) and a1:isRunning() and a1.car.alive then
        a1.tetherResumeArmed = false
        endPress_upv_1(a1.car, a1.track, SLING_DRIFT_CONFIG_upv_1)
        return
    end
    cancelPress_upv_1(a1.car)
    return nil
end
u23.onPauseChanged = function(a1, a2)
    --[[
      name: onPauseChanged
      line: 433
      upvalues:
        cancelPress_upv_1 (copy, index: 1)
    ]]
    cancelPress_upv_1(a1.car)
    if not a2 or not a1.car.alive or not a1.car.tethered then
        return
    end
    a1.tetherResumeArmed = true
end
u23.resetRound = function(a1)
    --[[
      name: resetRound
      line: 439
      upvalues:
        resetRun_upv_1 (copy, index: 1)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 4)
    ]]
    resetRun_upv_1(a1.car, a1.track, SLING_DRIFT_CONFIG_upv_1, a1.context.getRunSeed())
    a1.crashClock = -1
    a1.crashVelocityX = 0
    a1.crashVelocityY = 0
    a1.tetherResumeArmed = false
    a1.feverFlashClock = 0
    a1.feverLaneApplied = false
    a1:applyLaneColor(u8)
    a1.skidTravel = 0
    a1.lastLatchCount = a1.car.latchCount
    a1.lastReleaseCount = a1.car.releaseCount
    a1.lastScore = 0
    a1.tetherDrawnRadius = -1
    a1:clearGrabCue()
    a1:parkCorners()
    a1.decor:setSeed(a1.context.getRunSeed())
    a1.dressedThrough = -1
    a1:dressCorners(SLING_DRIFT_CONFIG_upv_1.trackRingCapacity)
    a1:syncRenderHistory()
    a1:snapCamera()
    a1:clearSkidMarks()
    a1.popups:hideAll()
    a1.driftSmoke.Enabled = false
    a1.context.reportScore(0)
end
u23.revive = function(a1)
    --[[
      name: revive
      line: 471
      upvalues:
        reviveOnRoad_upv_1 (copy, index: 1)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 2)
    ]]
    reviveOnRoad_upv_1(a1.car, a1.track, SLING_DRIFT_CONFIG_upv_1)
    a1.crashClock = -1
    a1.crashVelocityX = 0
    a1.crashVelocityY = 0
    a1.tetherResumeArmed = false
    a1.skidTravel = 0
    a1.lastLatchCount = a1.car.latchCount
    a1.lastReleaseCount = a1.car.releaseCount
    a1.tetherDrawnRadius = -1
    a1:clearGrabCue()
    a1:syncRenderHistory()
    a1:snapCamera()
    a1:clearSkidMarks()
    a1.driftSmoke.Enabled = false
    a1:setRunning(true)
end
u23.captureRound = function(a1)
    --[[
      name: captureRound
      line: 488
    ]]
    return nil
end
u23.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 491
    ]]
    return false
end
u23.syncRenderHistory = function(a1)
    --[[
      name: syncRenderHistory
      line: 494
    ]]
    a1.renderPreviousX = a1.car.x
    a1.renderPreviousY = a1.car.y
    a1.renderHeading = a1.car.heading
    a1.renderPreviousHeading = a1.car.heading
end
u23.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 500
      upvalues:
        stepSling_upv_1 (copy, index: 1)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 2)
        normalizeAngle_upv_1 (copy, index: 3)
    ]]
    a1.renderPreviousX = a1.car.x
    a1.renderPreviousY = a1.car.y
    a1.renderPreviousHeading = a1.renderHeading
    if a1.crashClock < 0 then
        if a1.tetherResumeArmed then
            return nil
        end
        stepSling_upv_1(a1.car, a1.track, SLING_DRIFT_CONFIG_upv_1, a2)
        a1.renderHeading = a1.renderHeading + normalizeAngle_upv_1(a1.car.heading - a1.renderHeading)
        a1:dressCorners(2)
        if a1.car.latchCount ~= a1.lastLatchCount then
            a1:onLatched()
        end
        if a1.car.releaseCount ~= a1.lastReleaseCount then
            a1:onReleased()
        end
        if a1.car.score ~= a1.lastScore then
            a1:onScored()
        end
        if a1.car.tethered then
            a1:layTyreMark(a2)
        end
        a1:ageSkidMarks(a2)
        if a1.feverFlashClock > 0 then
            a1.feverFlashClock = math.max(a1.feverFlashClock - a2, 0)
        end
        if not (a1.car.alive) then
            a1:onCrashed()
        end
    else
        a1:advanceWreck(a2)
        return nil
    end
end
u23.onLatched = function(a1)
    --[[
      name: onLatched
      line: 537
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.lastLatchCount = a1.car.latchCount
    a1.driftSmoke.Enabled = true
    a1.stage.shake(SLING_DRIFT_CONFIG_upv_1.latchShake)
    a1.context.audio.play("tireScreech", {})
end
u23.onReleased = function(a1)
    --[[
      name: onReleased
      line: 547
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
        u22 (copy, index: 2)
        publishCombo_upv_1 (copy, index: 3)
    ]]
    a1.lastReleaseCount = a1.car.releaseCount
    a1.driftSmoke.Enabled = false
    a1.skidTravel = 0
    if a1.car.lastReleaseWasPerfect then
        a1.stage.shake(SLING_DRIFT_CONFIG_upv_1.perfectShake)
        a1.context.audio.play("perfect", {})
        a1.popups:show(a1:planeToWorld(a1.car.x, a1.car.y + 3, 2.6), "PERFECT", u22, 0.95)
        publishCombo_upv_1({count = a1.car.perfectStreak, color = u22})
        if a1.car.perfectStreak == SLING_DRIFT_CONFIG_upv_1.feverStreak then
            a1.feverFlashClock = SLING_DRIFT_CONFIG_upv_1.feverFlashSeconds
            a1.context.audio.play("newBestFanfare", {})
        end
    else
        return nil
    end
end
u23.onScored = function(a1)
    --[[
      name: onScored
      line: 575
    ]]
    a1.lastScore = a1.car.score
    a1.context.reportScore(a1.car.score)
    a1.context.audio.play("scorePing", {pitch = (math.min(a1.car.score, 24) * 0.012) + 1})
end
u23.advanceWreck = function(a1, a2)
    --[[
      name: advanceWreck
      line: 583
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
        normalizeAngle_upv_1 (copy, index: 2)
    ]]
    a1.crashClock = a1.crashClock + a2
    local v27 = math.exp(-SLING_DRIFT_CONFIG_upv_1.crashDragPerSecond * a2)
    a1.crashVelocityX = a1.crashVelocityX * v27
    a1.crashVelocityY = a1.crashVelocityY * v27
    local car_1 = a1.car
    car_1.x = car_1.x + (a1.crashVelocityX * a2)
    local car_2 = a1.car
    car_2.y = car_2.y + (a1.crashVelocityY * a2)
    if a1.crashClock < SLING_DRIFT_CONFIG_upv_1.crashSeconds then
        local car_3 = a1.car
        car_3.heading = car_3.heading + (math.rad(SLING_DRIFT_CONFIG_upv_1.crashSpinDegreesPerSecond) * a2)
    end
    a1.renderHeading = a1.renderHeading + normalizeAngle_upv_1(a1.car.heading - a1.renderHeading)
    a1:ageSkidMarks(a2)
    if a1.feverFlashClock <= 0 then
        return
    end
    a1.feverFlashClock = math.max(a1.feverFlashClock - a2, 0)
end
u23.onCrashed = function(a1)
    --[[
      name: onCrashed
      line: 599
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
        u21 (copy, index: 2)
    ]]
    a1.crashClock = 0
    a1.crashVelocityX = math.cos(a1.car.heading) * a1.car.speed
    a1.crashVelocityY = math.sin(a1.car.heading) * a1.car.speed
    a1.driftSmoke.Enabled = false
    a1.stage.shake(SLING_DRIFT_CONFIG_upv_1.crashShake)
    a1:hitStop(SLING_DRIFT_CONFIG_upv_1.crashHitStopSeconds)
    a1.context.audio.play("carCrash", {})
    a1.context.audio.play("tireScreech", {})
    a1.popups:show(a1:planeToWorld(a1.car.x, a1.car.y + 3, 2.6), "OFF ROAD!", u21, 1.05)
    a1.context.endRun(a1.car.score)
end
u23.layTyreMark = function(a1, a2)
    --[[
      name: layTyreMark
      line: 621
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.skidTravel = a1.skidTravel + (a1.car.speed * a2)
    if a1.skidTravel >= SLING_DRIFT_CONFIG_upv_1.skidSpacingStuds then
        a1.skidTravel = a1.skidTravel - SLING_DRIFT_CONFIG_upv_1.skidSpacingStuds
        local v28 = a1.skidParts[a1.skidIndex + 1]
        a1.skidLife[a1.skidIndex + 1] = SLING_DRIFT_CONFIG_upv_1.skidFadeSeconds
        a1.skidIndex = (a1.skidIndex + 1) % #a1.skidParts
        v28.CFrame = CFrame.new(a1:planeToWorld(a1.car.x, a1.car.y, 1.6)) * CFrame.Angles(0, 0, a1.car.heading)
    else
        return nil
    end
end
u23.ageSkidMarks = function(a1, a2)
    --[[
      name: ageSkidMarks
      line: 634
    ]]
    for n_4 = 0, #a1.skidLife - 1 do
        if a1.skidLife[n_4 + 1] > 0 then
            a1.skidLife[n_4 + 1] = math.max(a1.skidLife[n_4 + 1] - a2, 0)
        end
    end
end
u23.clearSkidMarks = function(a1)
    --[[
      name: clearSkidMarks
      line: 642
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_5 = 0, #a1.skidParts - 1 do
        a1.skidLife[n_5 + 1] = 0
        a1.skidParts[n_5 + 1].Transparency = 1
        a1.skidParts[n_5 + 1].CFrame = u1
    end
end
u23.dressCorners = function(a1, a2)
    --[[
      name: dressCorners
      line: 649
    ]]
    local v29 = 0
    while a1.dressedThrough < a1.track.generatedThrough and v29 < a2 do
        a1.dressedThrough = a1.dressedThrough + 1
        a1:dressCorner(a1.dressedThrough)
        v29 = v29 + 1
    end
end
u23.parkCorners = function(a1)
    --[[
      name: parkCorners
      line: 657
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_6 = 0, #a1.corners - 1 do
        local v30 = a1.corners[n_6 + 1]
        v30.straight.CFrame = u1
        v30.straightLane.CFrame = u1
        v30.elbow.CFrame = u1
        v30.elbowLaneEntry.CFrame = u1
        v30.elbowLaneExit.CFrame = u1
        v30.post.CFrame = u1
        v30.postCap.CFrame = u1
        v30.label.Text = ""
    end
end
u23.dressCorner = function(a1, a2)
    --[[
      name: dressCorner
      line: 670
      upvalues:
        ringSlot_upv_1 (copy, index: 1)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        u3 (copy, index: 4)
        u6 (copy, index: 5)
        u7 (copy, index: 6)
    ]]
    local v31 = ringSlot_upv_1(a1.track, a2)
    local v32 = a1.corners[v31 + 1]
    local postInsetStuds_1 = SLING_DRIFT_CONFIG_upv_1.postInsetStuds
    local roadWidthStuds_1 = SLING_DRIFT_CONFIG_upv_1.roadWidthStuds
    local v33 = a1.track.straightLength[v31 + 1]
    local roadThicknessStuds_1 = SLING_DRIFT_CONFIG_upv_1.roadThicknessStuds
    a1:placeSlab(v32.straight, v31, -postInsetStuds_1 - v33, -postInsetStuds_1, -roadWidthStuds_1, 0, roadThicknessStuds_1, 0)
    a1:placeSlab(v32.straightLane, v31, -postInsetStuds_1 - v33, -postInsetStuds_1, -u2 - u3, -u2 + u3, 0.5, 1)
    a1:placeSlab(v32.elbow, v31, -postInsetStuds_1, roadWidthStuds_1, -roadWidthStuds_1, postInsetStuds_1, roadThicknessStuds_1, 0)
    a1:placeSlab(v32.elbowLaneEntry, v31, -postInsetStuds_1, u2 + u3, -u2 - u3, -u2 + u3, 0.5, 1)
    a1:placeSlab(v32.elbowLaneExit, v31, u2 - u3, u2 + u3, -u2 - u3, postInsetStuds_1, 0.5, 1.14)
    local v34
    if a2 % 2 ~= 0 then
        v34 = u7
    else
        v34 = u6
    end
    v32.straight.Color = v34
    v32.elbow.Color = v34
    v32.post.CFrame = CFrame.new(a1:planeToWorld(a1.track.postX[v31 + 1], a1.track.postY[v31 + 1], 2.3)) * CFrame.Angles(0, 1.5707963267948966, 0)
    v32.postCap.CFrame = CFrame.new(a1:planeToWorld(a1.track.postX[v31 + 1], a1.track.postY[v31 + 1], 4.4)) * CFrame.Angles(0, 1.5707963267948966, 0)
    v32.label.Text = tostring(a2 + 1)
    a1.decor:onCornerDressed(a2)
end
u23.placeSlab = function(a1, a2, a3, a4, a5, a6, a7, a8, a9)
    --[[
      name: placeSlab
      line: 705
      upvalues:
        directionX_upv_1 (copy, index: 1)
        directionY_upv_1 (copy, index: 2)
    ]]
    local v35 = a1.track.entryDirection[a3 + 1]
    local v36 = a1.track.exitDirection[a3 + 1]
    local v37 = directionX_upv_1(v35)
    local v38 = directionY_upv_1(v35)
    local v39 = directionX_upv_1(v36)
    local v40 = directionY_upv_1(v36)
    local v41 = (a4 + a5) * 0.5
    local v42 = (a6 + a7) * 0.5
    local v43 = a5 - a4
    local v44 = a7 - a6
    local v45 = a1.track.apexX[a3 + 1] + (v41 * v37) + v42 * v39
    local v46 = a1.track.apexY[a3 + 1] + (v41 * v38) + v42 * v40
    if v37 == 0 then
        local v47 = v44
    else
        local v47 = v43
    end
    local v48
    if v38 == 0 then
        v48 = v44
    else
        v48 = v43
    end
    local v47 = nil
    a2.Size = Vector3.new(v47, v48, a8)
    a2.CFrame = CFrame.new(a1:planeToWorld(v45, v46, a9))
end
u23.render = function(a1, a2)
    --[[
      name: render
      line: 725
    ]]
    a1:draw(a2)
end
u23.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 728
    ]]
    a1:draw(a2)
end
u23.draw = function(a1, a2)
    --[[
      name: draw
      line: 731
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local v49 = lerp_upv_1(a1.renderPreviousX, a1.car.x, renderAlpha_1)
    local v50 = lerp_upv_1(a1.renderPreviousY, a1.car.y, renderAlpha_1)
    local v51 = lerp_upv_1(a1.renderPreviousHeading, a1.renderHeading, renderAlpha_1)
    a1:updateCamera(v49, v50, a2)
    a1.carModel:PivotTo(CFrame.new(a1:planeToWorld(v49, v50, 2.6)) * CFrame.Angles(0, 0, v51))
    a1:updateTether(v49, v50)
    a1:updateGrabCue()
    a1:updateField()
    a1.decor:update(a1.cameraX, a1.cameraY)
    a1:updateSkidMarks()
    a1:updateFever()
end
u23.updateCamera = function(a1, a2, a3, a4)
    --[[
      name: updateCamera
      line: 751
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.crashClock < 0 then
        a1:aimCamera(a2, a3)
        local v52 = 1 - math.exp(-SLING_DRIFT_CONFIG_upv_1.cameraFollowRate * math.max(a4, 0))
        a1.cameraX = a1.cameraX + ((a1.cameraAimX - a1.cameraX) * v52)
        a1.cameraY = a1.cameraY + ((a1.cameraAimY - a1.cameraY) * v52)
        a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
    else
        a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
        return nil
    end
end
u23.aimCamera = function(a1, a2, a3)
    --[[
      name: aimCamera
      line: 762
      upvalues:
        ringSlot_upv_1 (copy, index: 1)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v53 = ringSlot_upv_1(a1.track, ((a1.car.onExitLane) and (a1.car.currentCorner + 1)) or (a1.car.currentCorner))
    local v54 = a1.track.postX[v53 + 1] - a2
    local v55 = a1.track.postY[v53 + 1] - a3
    local v56 = math.sqrt((v54 * v54) + (v55 * v55))
    if v56 >= 0.001 then
        local v57 = math.min(v56 * 0.5, SLING_DRIFT_CONFIG_upv_1.cameraLeadStuds)
        a1.cameraAimX = a2 + ((v54 / v56) * v57)
        a1.cameraAimY = a3 + ((v55 / v56) * v57)
    else
        a1.cameraAimX = a2
        a1.cameraAimY = a3
        return nil
    end
end
u23.snapCamera = function(a1)
    --[[
      name: snapCamera
      line: 780
    ]]
    a1:aimCamera(a1.car.x, a1.car.y)
    a1.cameraX = a1.cameraAimX
    a1.cameraY = a1.cameraAimY
    a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
end
u23.updateTether = function(a1, a2, a3)
    --[[
      name: updateTether
      line: 786
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v58 = nil
    if a1.car.tethered then
        local v59 = a2 - a1.car.pivotX
        local v60 = a3 - a1.car.pivotY
        v58 = math.sqrt((v59 * v59) + (v60 * v60))
        local v61 = nil
        if v58 >= 1e-04 then
            v61 = math.max(a1.car.radius, 0.1)
            local v62 = math.atan2(v60, v59)
            a1.tether.Transparency = 0
            if a1.tetherDrawnRadius ~= v61 then
                a1.tetherDrawnRadius = v61
                a1.tether.Size = Vector3.new(v61, 0.42, 0.35)
            end
            a1.tether.CFrame = CFrame.new(a1:planeToWorld(a1.car.pivotX + (((v59 / v58) * v61) * 0.5), a1.car.pivotY + (((v60 / v58) * v61) * 0.5), 4)) * CFrame.Angles(0, 0, v62)
        else
            return nil
        end
    else
        if a1.tether.Transparency < 1 then
            a1.tether.Transparency = 1
            a1.tether.CFrame = u1
        end
        return nil
    end
end
u23.isGrabWindowOpen = function(a1)
    --[[
      name: isGrabWindowOpen
      line: 817
      upvalues:
        abeamDistance_upv_1 (copy, index: 1)
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 2)
    ]]
    if a1.car.alive and not (a1.car.tethered) then
        local v63 = nil
        if a1.crashClock < 0 then
            v63 = abeamDistance_upv_1(a1.car, a1.track)
            if v63 >= -SLING_DRIFT_CONFIG_upv_1.attachTrailStuds then
                return v63 <= (SLING_DRIFT_CONFIG_upv_1.attachLeadStuds + (a1.car.speed * SLING_DRIFT_CONFIG_upv_1.pressBufferSeconds))
            end
            return false
        end
    end
    return false
end
u23.updateGrabCue = function(a1)
    --[[
      name: updateGrabCue
      line: 827
      upvalues:
        ringSlot_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
        u13 (copy, index: 3)
    ]]
    local v64 = ((not (a1:isGrabWindowOpen())) and -1) or (ringSlot_upv_1(a1.track, a1.car.currentCorner))
    if v64 ~= a1.litCornerSlot then
        a1:clearGrabCue()
        if v64 >= 0 then
            local v65 = a1.corners[v64 + 1]
            v65.post.Color = u12
            v65.postCap.Color = u13
            a1.litCornerSlot = v64
        else
            return nil
        end
    else
        return nil
    end
end
u23.clearGrabCue = function(a1)
    --[[
      name: clearGrabCue
      line: 841
      upvalues:
        u10 (copy, index: 1)
        u11 (copy, index: 2)
    ]]
    if a1.litCornerSlot >= 0 then
        local v66 = a1.corners[a1.litCornerSlot + 1]
        v66.post.Color = u10
        v66.postCap.Color = u11
        a1.litCornerSlot = -1
    else
        return nil
    end
end
u23.updateField = function(a1)
    --[[
      name: updateField
      line: 850
    ]]
    a1.field.CFrame = CFrame.new(a1:planeToWorld(a1.cameraX, a1.cameraY, -6))
end
u23.updateSkidMarks = function(a1)
    --[[
      name: updateSkidMarks
      line: 853
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_7 = 0, #a1.skidParts - 1 do
        local v67
        v67 = a1.skidLife[n_7 + 1]
        local v68 = a1.skidParts[n_7 + 1]
        if v67 > 0 then
            v68.Transparency = 0.3 + (0.7 * (1 - (v67 / SLING_DRIFT_CONFIG_upv_1.skidFadeSeconds)))
            continue
        end
        if v68.Transparency < 1 then
            v68.Transparency = 1
        end
    end
end
u23.updateFever = function(a1)
    --[[
      name: updateFever
      line: 868
      upvalues:
        SLING_DRIFT_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u9 (copy, index: 3)
        u8 (copy, index: 4)
    ]]
    local v69 = ((a1.feverFlashClock <= 0) and 1) or (1 - 0.55 * (a1.feverFlashClock / SLING_DRIFT_CONFIG_upv_1.feverFlashSeconds))
    local v70 = math.min(v69, ((a1.car.feverActive) and 0.9) or 1)
    a1.flash.Transparency = v70
    local flash_1 = a1.flash
    local v71
    if v70 < 1 then
        v71 = CFrame.new(a1:planeToWorld(a1.cameraX, a1.cameraY, 26))
    else
        v71 = u1
    end
    flash_1.CFrame = v71
    if a1.car.feverActive ~= a1.feverLaneApplied then
        a1.feverLaneApplied = a1.car.feverActive
        local v72
        if a1.feverLaneApplied then
            v72 = u9
        else
            v72 = u8
        end
        a1:applyLaneColor(v72)
    else
        return nil
    end
end
u23.applyLaneColor = function(a1, a2)
    --[[
      name: applyLaneColor
      line: 882
    ]]
    for n_8 = 0, #a1.corners - 1 do
        local v73 = a1.corners[n_8 + 1]
        v73.straightLane.Color = a2
        v73.elbowLaneEntry.Color = a2
        v73.elbowLaneExit.Color = a2
    end
end
u23.planeToWorld = function(a1, a2, a3, a4)
    --[[
      name: planeToWorld
      line: 890
    ]]
    return a1.stage.origin + Vector3.new(a2, a3, a4)
end
local tbl_6 = {}
tbl_6.SlingDriftGame = u23
return tbl_6