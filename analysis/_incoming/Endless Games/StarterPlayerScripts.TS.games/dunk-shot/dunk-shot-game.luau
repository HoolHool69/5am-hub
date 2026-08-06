-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local AssetService_upv_1 = v1.AssetService
local RunService_upv_1 = v1.RunService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit")
local findLargestBasePart_upv_1 = v3.findLargestBasePart
local fitModelExtent_upv_1 = v3.fitModelExtent
local flattenKitPart_upv_1 = v3.flattenKitPart
local modelWorldAabb_upv_1 = v3.modelWorldAabb
local placeModelCenter_upv_1 = v3.placeModelCenter
local translateModel_upv_1 = v3.translateModel
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v4 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles")
local DEFAULT_GAME_LIGHTING_upv_1 = v4.DEFAULT_GAME_LIGHTING
local LIGHTING_PROFILES_upv_1 = v4.LIGHTING_PROFILES
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v5 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v5.readResume
local writeResume_upv_1 = v5.writeResume
local DunkShotAssets_upv_1 = RuntimeLib_1.import(script, script.Parent, "dunk-shot-assets").DunkShotAssets
local DUNK_SHOT_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "dunk-shot-config").DUNK_SHOT_CONFIG
local DunkShotTutorial_upv_1 = RuntimeLib_1.import(script, script.Parent, "dunk-shot-tutorial").DunkShotTutorial
local v6 = RuntimeLib_1.import(script, script.Parent, "dunk-shot-sim")
local HOOP_MOTIONS_upv_1 = v6.HOOP_MOTIONS
local adoptPlacement_upv_1 = v6.adoptPlacement
local advanceHoopCentre_upv_1 = v6.advanceHoopCentre
local collideNet_upv_1 = v6.collideNet
local collideRim_upv_1 = v6.collideRim
local crossedRingDownward_upv_1 = v6.crossedRingDownward
local hoopSpecAt_upv_1 = v6.hoopSpecAt
local makeBallState_upv_1 = v6.makeBallState
local makeHoopRuntime_upv_1 = v6.makeHoopRuntime
local placementFor_upv_1 = v6.placementFor
local reflectWalls_upv_1 = v6.reflectWalls
local ringLocalY_upv_1 = v6.ringLocalY
local slingSpeed_upv_1 = v6.slingSpeed
local stepBall_upv_1 = v6.stepBall
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(214, 207, 192)
local u3 = Color3.fromRGB(222, 215, 200)
local u4 = Color3.fromRGB(214, 207, 192)
local u5 = Color3.fromRGB(201, 193, 176)
local u6 = Color3.fromRGB(238, 126, 44)
local u7 = Color3.fromRGB(74, 44, 26)
local u8 = Color3.fromRGB(226, 54, 40)
local u9 = Color3.fromRGB(168, 34, 26)
local u10 = Color3.fromRGB(244, 244, 238)
local u11 = Color3.fromRGB(120, 116, 108)
local u12 = Color3.fromRGB(255, 150, 56)
local u13 = Color3.fromRGB(148, 150, 154)
local u14 = Color3.fromRGB(235, 232, 224)
local u15 = Color3.fromRGB(148, 148, 150)
local u16 = Color3.fromRGB(245, 245, 255)
local u17 = Color3.fromRGB(255, 216, 102)
local u18 = Color3.fromRGB(255, 90, 100)
local u19 = Color3.fromRGB(255, 156, 64)
local u20 = Color3.fromRGB(188, 188, 196)
local u21 = Color3.fromRGB(255, 170, 40)
local u22 = Color3.fromRGB(226, 54, 20)
local netDepth_upv_1 = DUNK_SHOT_CONFIG_upv_1.netDepth
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(236, 238, 242)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(242, 244, 248)
tbl_upv_1.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_upv_2 = {}
tbl_upv_2.halfWidth = DUNK_SHOT_CONFIG_upv_1.fieldHalfWidth
tbl_upv_2.ballRadius = DUNK_SHOT_CONFIG_upv_1.ballRadius
tbl_upv_2.restitution = DUNK_SHOT_CONFIG_upv_1.wallRestitution
local tbl_upv_3 = {}
tbl_upv_3.halfWidth = DUNK_SHOT_CONFIG_upv_1.hoopHalfWidth
tbl_upv_3.contactDistance = DUNK_SHOT_CONFIG_upv_1.ballRadius + DUNK_SHOT_CONFIG_upv_1.rimKnobRadius
tbl_upv_3.restitution = DUNK_SHOT_CONFIG_upv_1.rimRestitution
tbl_upv_3.tangentKeep = DUNK_SHOT_CONFIG_upv_1.rimTangentKeep
local u23 = math.max(math.round((DUNK_SHOT_CONFIG_upv_1.previewSeconds / DUNK_SHOT_CONFIG_upv_1.previewDots) / 0.008333333333333333), 1)
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 346
    ]]
    return "DunkShotGame"
end
tbl_5.__index = BaseWorldGame_upv_1
local u24 = setmetatable(tbl_4, tbl_5)
u24.__index = u24
u24.new = function(...)
    --[[
      name: new
      line: 352
      upvalues:
        u24 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u24)
    return v7:constructor(...) or v7
end
u24.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 356
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        makeBallState_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.ballOrientation = CFrame.new()
    a1.settling = false
    a1.settleElapsed = 0
    a1.settleOffsetX = 0
    a1.settleOffsetY = 0
    a1.backdropRest = CFrame.new()
    a1.backdropZ = -40
    a1.netEditables = {}
    a1.sideWallZ = -4
    a1.sideWallY = 0
    a1.hoops = {}
    a1.lastAimDown = 0
    a1.lastAimSide = 0
    a1.seatSlot = 0
    a1.leftWallTiles = {}
    a1.rightWallTiles = {}
    a1.wallOffsets = {}
    a1.previewDots = {}
    a1.shockRings = {}
    a1.shockCursor = 0
    a1.ball = makeBallState_upv_1()
    a1.previewBall = makeBallState_upv_1()
    a1.renderPreviousBallX = 0
    a1.renderPreviousBallY = 0
    a1.spinDegrees = 0
    a1.renderPreviousSpinDegrees = 0
    a1.flying = false
    a1.dead = false
    a1.launchY = 0
    a1.stuckClock = 0
    a1.stuckKicked = false
    a1.rimSoundCooldown = 0
    a1.roundToken = 0
    a1.aimSource = "none"
    a1.aimX = 0
    a1.aimY = 0
    a1.pointerOriginX = 0
    a1.pointerOriginY = 0
    a1.score = 0
    a1.swishStreak = 0
    a1.basketCount = 0
    a1.swishBonusTotal = 0
    a1.runSeed = 0
    a1.nextHoopIndex = 0
    a1.lastAnchorY = 0
    a1.cameraCenterX = 0
    a1.cameraCenterY = 0
    a1.deathVelocityY = 0
end
u24.buildScene = function(a1)
    --[[
      name: buildScene
      line: 407
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        DunkShotAssets_upv_1 (copy, index: 2)
        findLargestBasePart_upv_1 (copy, index: 3)
        makeFrontalBackdrop_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
        flattenKitPart_upv_1 (copy, index: 6)
        makeStagePart_upv_1 (copy, index: 7)
        u3 (copy, index: 8)
        PopupTextPool_upv_1 (copy, index: 9)
        DunkShotTutorial_upv_1 (copy, index: 10)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(DUNK_SHOT_CONFIG_upv_1.portraitFrameWidthFloor)
    a1.assets = DunkShotAssets_upv_1.new()
    local v8 = false
    local input_1 = a1:kitOn()
    if input_1 then
        input_1 = a1.assets:has("Backdrop")
        if input_1 then
            input_1 = a1.assets:model("Backdrop", container_1)
            local v9 = nil
            if input_1 ~= nil then
                v9 = findLargestBasePart_upv_1(input_1)
                local v10 = nil
                if v9 == nil then
                    input_1:Destroy()
                else
                    a1.backdrop = v9
                    a1.backdropRest = v9.CFrame.Rotation
                    v10 = a1.assets:template("Backdrop")
                    local v11
                    if v10 == nil then
                        v11 = nil
                    else
                        v11 = findLargestBasePart_upv_1(v10)
                    end
                    if v11 ~= nil then
                        a1.backdropZ = v11.Position.Z - 0
                    end
                    a1.backdrop.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, 0, a1.backdropZ)) * a1.backdropRest
                    v8 = true
                end
            end
        end
    end
    if not (v8) then
        a1.backdrop = makeFrontalBackdrop_upv_1(a1.stage, u2, Enum.Material.SmoothPlastic)
    end
    if v8 and a1.assets.gradient ~= nil then
        input_1 = a1.assets:template("Backdrop")
        local v9
        if input_1 == nil then
            v9 = nil
        else
            v9 = findLargestBasePart_upv_1(input_1)
        end
        if v9 ~= nil then
            local v12 = a1.assets.gradient:Clone()
            flattenKitPart_upv_1(v12)
            v12.Parent = container_1
            a1.gradientRest = v9.CFrame:ToObjectSpace(a1.assets.gradient.CFrame)
            a1.gradient = v12
        end
    end
    a1:buildWalls(container_1)
    if a1.sideWall == nil then
        a1.channelWall = makeStagePart_upv_1(container_1)
        a1.channelWall.Color = u3
        a1.channelWall.Size = Vector3.new((DUNK_SHOT_CONFIG_upv_1.fieldHalfWidth * 2) + 2, 240, 1)
    end
    table.insert(a1.hoops, (a1:buildHoop(container_1)))
    table.insert(a1.hoops, (a1:buildHoop(container_1)))
    a1:buildBall(container_1)
    a1:buildPreviewDots(container_1)
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1:applyAuthoredLighting()
    input_1 = a1.context.input
    a1.context.janitor:Add(
        input_1.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 485
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "key" then
                    a1:beginPointerAim(a2)
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        input_1.drag:Connect(
            function(a4, a5)
                --[[
                  line: 493
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a1.aimSource == "pointer" then
                    a1:setAimFromPointer(a5)
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        input_1.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 499
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a8 ~= "key" and a1.aimSource == "pointer" then
                    a1:setAimFromPointer(a6)
                    a1:fire()
                else
                    return nil
                end
            end
        )
    )
    a1.tutorial = DunkShotTutorial_upv_1.new(a1.context.audio)
    a1.context.janitor:Add(a1.tutorial, "destroy")
end
u24.resetRound = function(a1)
    --[[
      name: resetRound
      line: 509
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.runSeed = a1.context.getRunSeed()
    a1.score = 0
    a1.swishStreak = 0
    a1.basketCount = 0
    a1.swishBonusTotal = 0
    a1.flying = false
    a1.dead = false
    a1.rimSoundCooldown = 0
    a1.spinDegrees = 0
    a1.renderPreviousSpinDegrees = 0
    a1.deathVelocityY = 0
    a1:cancelAim()
    a1.seatSlot = 0
    a1.nextHoopIndex = 0
    a1.lastAnchorY = 0
    a1:placeHoop(0)
    a1:placeHoop(1)
    a1:seatBall()
    a1.cameraCenterX = (a1.hoops[1].runtime.centerX + a1.hoops[2].runtime.centerX) / 2
    a1.cameraCenterY = (a1.hoops[1].runtime.centerY + a1.hoops[2].runtime.centerY) / 2
    a1.popups:hideAll()
    a1:parkPreviewDots()
    a1:applyStreakVisuals()
    a1.context.reportScore(0)
    a1.tutorial:arm()
end
u24.revive = function(a1)
    --[[
      name: revive
      line: 538
    ]]
    a1.tutorial:disarm()
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.swishStreak = 0
    a1.deathVelocityY = 0
    a1.spinDegrees = 0
    a1.renderPreviousSpinDegrees = 0
    a1:cancelAim()
    a1:seatBall()
    a1.hoops[(1 - a1.seatSlot) + 1].runtime.touchedRim = false
    a1:applyStreakVisuals()
    a1:setRunning(true)
end
u24.captureRound = function(a1)
    --[[
      name: captureRound
      line: 554
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        HOOP_MOTIONS_upv_1 (copy, index: 2)
    ]]
    if not (a1.dead) and not (a1.flying) and not (a1.settling) then
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 558
                  upvalues:
                    a1 (copy, index: 1)
                    HOOP_MOTIONS_upv_1 (copy, index: 2)
                ]]
                a2:int(a1.score):int(a1.swishStreak):int(a1.basketCount):int(a1.swishBonusTotal)
                a2:int(a1.nextHoopIndex):num(a1.lastAnchorY):int(a1.seatSlot)
                local runtime_1 = nil
                for _, value_1 in a1.hoops do
                    runtime_1 = value_1.runtime
                    a2:int(runtime_1.index):num(runtime_1.anchorX):num(runtime_1.anchorY)
                    a2:int((math.max((table.find(HOOP_MOTIONS_upv_1, runtime_1.motion) or 0) - 1, 0)))
                    a2:num(runtime_1.amplitude):num(runtime_1.angularSpeed):num(runtime_1.phase)
                end
            end
        )
    end
    return nil
end
u24.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 571
      upvalues:
        readResume_upv_1 (copy, index: 1)
        HOOP_MOTIONS_upv_1 (copy, index: 2)
        advanceHoopCentre_upv_1 (copy, index: 3)
        RunService_upv_1 (copy, index: 4)
    ]]
    local v13 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 572
              upvalues:
                HOOP_MOTIONS_upv_1 (copy, index: 1)
            ]]
            local tbl_6 = {}
            tbl_6.score = a3:int()
            tbl_6.swishStreak = a3:int()
            tbl_6.basketCount = a3:int()
            tbl_6.swishBonusTotal = a3:int()
            tbl_6.nextHoopIndex = a3:int()
            tbl_6.lastAnchorY = a3:num()
            tbl_6.seatSlot = a3:int()
            local tbl_7 = {}
            local v21 = nil
            for _ = 0, 1 do
                local v14 = a3:int()
                local v15 = a3:num()
                local v16 = a3:num()
                v21 = HOOP_MOTIONS_upv_1[a3:int() + 1]
                local v18 = a3:num()
                local v19 = a3:num()
                local v20 = a3:num()
                if v21 == nil then
                    error("dunk-shot: bad hoop motion ordinal")
                end
                table.insert(tbl_7, {index = v14, anchorX = v15, anchorY = v16, motion = v21, amplitude = v18, angularSpeed = v19, phase = v20})
            end
            v21 = table.clone(tbl_6)
            setmetatable(v21, nil)
            v21.hoops = tbl_7
            return v21
        end
    )
    if v13 ~= nil then
        if v13.seatSlot ~= 0 and v13.seatSlot ~= 1 then
            return false
        end
        a1.score = a2.score
        a1.swishStreak = v13.swishStreak
        a1.basketCount = v13.basketCount
        a1.swishBonusTotal = v13.swishBonusTotal
        a1.nextHoopIndex = v13.nextHoopIndex
        a1.lastAnchorY = v13.lastAnchorY
        a1.seatSlot = v13.seatSlot
        a1.flying = false
        a1.dead = false
        a1:cancelAim()
        local hoops_1 = v13.hoops
        local function v22(a4, a5)
            --[[
              line: 630
              upvalues:
                a1 (copy, index: 1)
                advanceHoopCentre_upv_1 (copy, index: 2)
            ]]
            local runtime_2 = a1.hoops[a5 + 1]
            if runtime_2 ~= nil then
                runtime_2 = runtime_2.runtime
            end
            if runtime_2 ~= nil then
                runtime_2.index = a4.index
                runtime_2.anchorX = a4.anchorX
                runtime_2.anchorY = a4.anchorY
                runtime_2.motion = a4.motion
                runtime_2.amplitude = a4.amplitude
                runtime_2.angularSpeed = a4.angularSpeed
                runtime_2.phase = a4.phase
                runtime_2.touchedRim = false
                advanceHoopCentre_upv_1(runtime_2, 0)
                runtime_2.previousCenterX = runtime_2.centerX
                runtime_2.previousCenterY = runtime_2.centerY
            else
                return nil
            end
        end
        for key_1, value_2 in hoops_1 do
            v22(value_2, key_1 - 1, hoops_1)
        end
        a1:seatBall()
        a1.cameraCenterX = (a1.hoops[1].runtime.centerX + a1.hoops[2].runtime.centerX) / 2
        a1.cameraCenterY = (a1.hoops[1].runtime.centerY + a1.hoops[2].runtime.centerY) / 2
        a1:applyStreakVisuals()
        a1.context.reportScore(a1.score)
        if a1.tutorial:isActive() and RunService_upv_1:IsStudio() then
            warn("[DunkShotTutorial] resumed a held run \226\128\148 the first-shot lesson is skipped, not spent")
        end
        a1.tutorial:disarm()
        return true
    end
    return false
end
u24.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 668
      upvalues:
        advanceHoopCentre_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
        ringLocalY_upv_1 (copy, index: 3)
        stepBall_upv_1 (copy, index: 4)
        reflectWalls_upv_1 (copy, index: 5)
        tbl_upv_2 (copy, index: 6)
        collideRim_upv_1 (copy, index: 7)
        tbl_upv_3 (copy, index: 8)
        crossedRingDownward_upv_1 (copy, index: 9)
        collideNet_upv_1 (copy, index: 10)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPreviousBallX = a1.ball.x
        a1.renderPreviousBallY = a1.ball.y
        a1.renderPreviousSpinDegrees = a1.spinDegrees
        if a1.rimSoundCooldown > 0 then
            a1.rimSoundCooldown = a1.rimSoundCooldown - a2
        end
        a1:pollGamepad()
        local runtime_3 = a1.hoops[a1.seatSlot + 1].runtime
        local runtime_4 = a1.hoops[(1 - a1.seatSlot) + 1].runtime
        advanceHoopCentre_upv_1(runtime_3, a2)
        advanceHoopCentre_upv_1(runtime_4, a2)
        local v23 = nil
        if a1.settling then
            a1.settleElapsed = a1.settleElapsed + a2
            v23 = math.min(a1.settleElapsed / DUNK_SHOT_CONFIG_upv_1.catchSettleSeconds, 1)
            local v24 = v23 * v23 * (3 - (v23 * 2))
            a1.ball.x = runtime_3.centerX + (a1.settleOffsetX * (1 - v24))
            a1.ball.y = ((runtime_3.centerY + (a1.settleOffsetY * (1 - v24))) - (DUNK_SHOT_CONFIG_upv_1.ballSeatDepth * v24)) - (math.sin(v23 * math.pi) * 0.6)
            if v23 >= 1 then
                a1.settling = false
                a1:seatBall()
            end
            return nil
        elseif a1.flying then
            stepBall_upv_1(a1.ball, DUNK_SHOT_CONFIG_upv_1.gravity, a2)
            a1.spinDegrees = a1.spinDegrees - ((a1.ball.velocityX * a2) * 26)
            if reflectWalls_upv_1(a1.ball, tbl_upv_2) and a1.rimSoundCooldown <= 0 then
                a1.rimSoundCooldown = 0.08
                a1.context.audio.play("thud", {})
            end
            if DUNK_SHOT_CONFIG_upv_1.rimSoundMinImpact <= collideRim_upv_1(a1.ball, runtime_4, tbl_upv_3) and a1.rimSoundCooldown <= 0 then
                a1.rimSoundCooldown = 0.08
                a1.context.audio.play("thud", {})
            end
            if crossedRingDownward_upv_1(runtime_4, a1.ball, DUNK_SHOT_CONFIG_upv_1.hoopHalfWidth) then
                a1:onBasket()
                return nil
            end
            if crossedRingDownward_upv_1(runtime_3, a1.ball, DUNK_SHOT_CONFIG_upv_1.hoopHalfWidth) then
                a1:reCatch()
                return nil
            end
            if DUNK_SHOT_CONFIG_upv_1.rimSoundMinImpact <= math.max(collideNet_upv_1(a1.ball, runtime_4, tbl_upv_3, DUNK_SHOT_CONFIG_upv_1.netDepth), collideNet_upv_1(a1.ball, runtime_3, tbl_upv_3, DUNK_SHOT_CONFIG_upv_1.netDepth)) and a1.rimSoundCooldown <= 0 then
                a1.rimSoundCooldown = 0.08
                a1.context.audio.play("thud", {})
            end
            runtime_4.previousLocalY = ringLocalY_upv_1(runtime_4, a1.ball)
            runtime_3.previousLocalY = ringLocalY_upv_1(runtime_3, a1.ball)
            if a1.flying and not (a1.dead) then
                if math.abs(a1.ball.velocityX) + math.abs(a1.ball.velocityY) >= 3 then
                    a1.stuckClock = 0
                else
                    a1.stuckClock = a1.stuckClock + a2
                    if a1.stuckClock >= 1 then
                        a1.stuckClock = 0
                        if a1.stuckKicked then
                            a1:die()
                        else
                            a1.stuckKicked = true
                            a1.ball.velocityX = ((a1.ball.x < 0) and 9) or -9
                            a1.ball.velocityY = -11
                        end
                    end
                end
            end
            if a1.ball.y < a1.launchY - DUNK_SHOT_CONFIG_upv_1.missMarginStuds then
                a1:die()
            end
        else
            a1.ball.x = runtime_3.centerX
            a1.ball.y = runtime_3.centerY - DUNK_SHOT_CONFIG_upv_1.ballSeatDepth
            a1.ball.velocityX = 0
            a1.ball.velocityY = 0
            runtime_4.previousLocalY = ringLocalY_upv_1(runtime_4, a1.ball)
            return nil
        end
    end
end
u24.reCatch = function(a1)
    --[[
      name: reCatch
      line: 778
    ]]
    a1.flying = false
    a1.context.audio.play("pop", {})
    local v25 = a1.hoops[a1.seatSlot + 1]
    v25.netPulse = 1
    a1:setRimScored(v25, true)
    a1:spawnShock(v25.runtime.centerX, v25.runtime.centerY, 1.6, 5.5, 0)
    a1:beginSettle()
end
u24.beginSettle = function(a1)
    --[[
      name: beginSettle
      line: 790
    ]]
    local runtime_5 = a1.hoops[a1.seatSlot + 1].runtime
    a1.settling = true
    a1.settleElapsed = 0
    a1.settleOffsetX = a1.ball.x - runtime_5.centerX
    a1.settleOffsetY = a1.ball.y - runtime_5.centerY
    a1.ball.velocityX = 0
    a1.ball.velocityY = 0
    a1.flying = false
end
u24.render = function(a1, a2)
    --[[
      name: render
      line: 800
    ]]
    if a1.tutorial:isActive() then
        a1.tutorial:update(a1.realDelta, not a1.flying and (not a1.settling and (not a1.dead)), a1:isAiming(), a1:aimLength())
    end
    a1:draw(a2)
end
u24.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 807
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        a1.deathVelocityY = a1.deathVelocityY + (DUNK_SHOT_CONFIG_upv_1.gravity * a2)
        local ball_1 = a1.ball
        ball_1.x = ball_1.x + (a1.ball.velocityX * a2)
        local ball_2 = a1.ball
        ball_2.y = ball_2.y + (a1.deathVelocityY * a2)
        a1.spinDegrees = a1.spinDegrees + (420 * a2)
    end
    a1:draw(a2)
end
u24.draw = function(a1, a2)
    --[[
      name: draw
      line: 816
      upvalues:
        lerp_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local v26
    if a1.dead then
        v26 = a1.ball.x
    else
        v26 = lerp_upv_1(a1.renderPreviousBallX, a1.ball.x, renderAlpha_1)
    end
    local v27
    if a1.dead then
        v27 = a1.ball.y
    else
        v27 = lerp_upv_1(a1.renderPreviousBallY, a1.ball.y, renderAlpha_1)
    end
    local v28
    if a1.dead then
        v28 = a1.spinDegrees
    else
        v28 = lerp_upv_1(a1.renderPreviousSpinDegrees, a1.spinDegrees, renderAlpha_1)
    end
    local v29 = a1:isAiming()
    local v30, v31
    if v29 and not a1.flying and not a1.dead then
        local v32 = math.min(a1:aimLength() / DUNK_SHOT_CONFIG_upv_1.dragMaxStuds, 1) * DUNK_SHOT_CONFIG_upv_1.slingPullStuds
        local v33 = math.max(a1:aimLength(), 1e-04)
        v26 = v30 + (a1.aimX / v33) * v32
        v27 = v31 + (a1.aimY / v33) * v32
    end
    v30, v31 = v26, v27
    a1.ballModel:PivotTo((CFrame.new(a1.stage.origin + Vector3.new(v30, v31, 0)) * a1.ballOrientation) * CFrame.Angles(0, 0, math.rad(v28)))
    local v34 = a1:isAiming() and (not a1.flying and (not a1.dead))
    local v35 = v30 - v26
    local v36
    if v34 then
        v36 = math.max(-(v31 - v27), 0)
    else
        v36 = 0
    end
    local v37
    if v34 then
        v37 = v35
    else
        v37 = 0
    end
    local v38 = a1.hoops[a1.seatSlot + 1]
    if a1.lastAimDown > 0.01 and (not (v34) or v38 ~= a1.lastAimHoop) then
        local v39 = a1.lastAimHoop
        if v39 ~= nil then
            v39.netRecoil = a1.lastAimDown
            v39.netRecoilSide = a1.lastAimSide
            v39.netRecoilClock = 0
        end
    end
    a1.lastAimDown = v36
    a1.lastAimSide = v37
    local v39
    if v34 then
        v39 = v38
    else
        v39 = nil
    end
    a1.lastAimHoop = v39
    local v40, v41, v42, v40, v41, _, v43 = nil, nil, nil, nil, nil, nil, nil
    local runtime_6 = nil
    local v44 = nil
    local v45 = nil
    local v46 = nil
    local v47 = nil
    local value_3 = nil
    local v48 = nil
    local v49 = nil
    local v50 = nil
    local v51 = nil
    local v52 = nil
    for v60, value_3 in a1.hoops do
        runtime_6 = value_3.runtime
        v44 = lerp_upv_1(runtime_6.previousCenterX, runtime_6.centerX, renderAlpha_1)
        v45 = lerp_upv_1(runtime_6.previousCenterY, runtime_6.centerY, renderAlpha_1)
        v46 = v34 and (value_3 == v38)
        if v46 then
            v40 = v36
        else
            v40 = 0
        end
        if v46 then
            v41 = v37
        else
            v41 = 0
        end
        v42 = 0
        if value_3.netRecoil > 0 then
            value_3.netRecoilClock = value_3.netRecoilClock + a2
            v49 = math.exp(-9 * value_3.netRecoilClock)
            if value_3.netRecoil * v49 >= 0.01 then
                local v53 = math.cos(31.41592653589793 * value_3.netRecoilClock) * v49
                v40 = v40 + value_3.netRecoil * v53
                v42 = value_3.netRecoilSide * v53
                v41 = v41 + v42
            else
                value_3.netRecoil = 0
                value_3.netRecoilSide = 0
            end
        end
        v49 = 0
        if v46 and a1:aimLength() > 0.001 then
            v49 = math.clamp(math.atan2(a1.aimX, -a1.aimY), -0.9599310885968813, 0.9599310885968813)
        end
        v49 = v49 + math.clamp(v42 / DUNK_SHOT_CONFIG_upv_1.slingPullStuds, -1, 1) * 0.2792526803190927
        v47 = CFrame.new(a1.stage.origin + Vector3.new(v44, v45, 0))
        if v49 ~= 0 then
            v47 = v47 * CFrame.Angles(0, 0, v49)
        end
        value_3.model:PivotTo(v47)
        a1:poseTrackDots(value_3)
        if value_3.netPulse > 0 then
            value_3.netPulse = math.max(value_3.netPulse - (a2 * 3.2), 0)
        end
        v48 = math.sin(value_3.netPulse * math.pi) * 0.5
        v50 = value_3.authoredNet
        if v50 == nil then
            for v61, value_4 in value_3.net do
                value_4.part.CFrame = v47 * (value_4.rest * CFrame.new((value_4.outward * v48) * 0.7, -v48 * 0.45, 0))
            end
        else
            local restSize_1 = v50.restSize
            local v54 = math.max(v40, -0.30000000000000004 * restSize_1.Y)
            v51 = v50.deform
            if v51 == nil then
                local v55 = (v48 * 0.55) + 1 + v54 / restSize_1.Y
                local v56 = math.abs(v55 - 1) > 1e-04
                if v56 then
                    v50.part.Size = Vector3.new(restSize_1.X, restSize_1.Y * v55, restSize_1.Z)
                    value_3.netStretched = v56
                    v50.part.CFrame = v47 * (v50.rest * CFrame.new(0, -(((restSize_1.Y * (v55 - 1)) / 2) + (v48 * 0.2)), 0))
                    continue
                end
                if value_3.netStretched then
                    v50.part.Size = Vector3.new(restSize_1.X, restSize_1.Y * v55, restSize_1.Z)
                    value_3.netStretched = v56
                end
                v50.part.CFrame = v47 * (v50.rest * CFrame.new(0, -(((restSize_1.Y * (v55 - 1)) / 2) + (v48 * 0.2)), 0))
            else
                v50.part.CFrame = v47 * v50.rest
                v52 = ((restSize_1.Y * v48) * 0.55) + (v48 * 0.2) + v54
                local v57 = ((v48 * 0.18) + 1) * (1 - math.min(v54 / DUNK_SHOT_CONFIG_upv_1.slingPullStuds, 1) * 0.1) - 1
                v43 = true
                if math.abs(v52) <= 0.005 then
                    v43 = true
                    if math.abs(v41) <= 0.005 then
                        v43 = math.abs(v57) > 0.005
                    end
                end
                if not (v43) and not (value_3.netStretched) then
                    continue
                end
                for n_1 = 0, #v51.vertexIds - 1 do
                    local v58 = v51.weight[n_1 + 1]
                    local v59 = 1 + v57 * v58
                    v51.editable:SetPosition(v51.vertexIds[n_1 + 1], (Vector3.new((v51.centerX + ((v51.restX[n_1 + 1] - v51.centerX) * v59)) + ((v41 * v51.localPerStudX * v58) * v58), v51.restY[n_1 + 1] - (v52 * v51.localPerStudY * v58), v51.centerZ + ((v51.restZ[n_1 + 1] - v51.centerZ) * v59))))
                end
                value_3.netStretched = v43
            end
        end
    end
    a1:drawShockRings(a2)
    a1:updateCamera(a2, v30, v31)
    a1:layoutWalls()
    a1:updatePreview()
end
u24.updateCamera = function(a1, a2, a3, a4)
    --[[
      name: updateCamera
      line: 970
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local runtime_7 = a1.hoops[1].runtime
    local runtime_8 = a1.hoops[2].runtime
    local v60 = (runtime_7.anchorX + runtime_8.anchorX) / 2
    local v61 = (runtime_7.anchorY + runtime_8.anchorY) / 2
    local v62 = math.max(a1.stage.getFrameWidth() / 2 - DUNK_SHOT_CONFIG_upv_1.cameraMarginStuds, 1)
    local v63 = math.max(a1.stage.getVisibleHeight() / 2 - DUNK_SHOT_CONFIG_upv_1.cameraMarginStuds, 1)
    local v64
    if a1.dead then
        v64 = v60
    else
        v64 = math.clamp(v60, a3 - v62, a3 + v62)
    end
    local v65
    if a1.dead then
        v65 = v61
    else
        v65 = math.clamp(v61, a4 - v63, a4 + v63)
    end
    local v66 = math.min(a2 * DUNK_SHOT_CONFIG_upv_1.cameraEasePerSecond, 1)
    a1.cameraCenterX = a1.cameraCenterX + ((v64 - a1.cameraCenterX) * v66)
    a1.cameraCenterY = a1.cameraCenterY + ((v65 - a1.cameraCenterY) * v66)
    a1.stage.setFrameCenter(Vector2.new(a1.cameraCenterX, a1.cameraCenterY))
end
u24.layoutWalls = function(a1)
    --[[
      name: layoutWalls
      line: 984
      upvalues:
        translateModel_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
    ]]
    local cameraCenterY_1 = a1.cameraCenterY
    a1.backdrop.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, cameraCenterY_1, a1.backdropZ)) * a1.backdropRest
    if a1.gradient ~= nil and a1.gradientRest ~= nil then
        a1.gradient.CFrame = a1.backdrop.CFrame * a1.gradientRest
    end
    if a1.channelWall ~= nil then
        a1.channelWall.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, cameraCenterY_1, -20))
    end
    local sideWall_1 = a1.sideWall
    local v67 = nil
    if sideWall_1 == nil then
        for n_2 = 0, 4 do
            local v68 = a1.wallOffsets[n_2 + 1]
            while v68 < cameraCenterY_1 - 75 do
                v68 = v68 + 150
            end
            while cameraCenterY_1 + 75 < v68 do
                v68 = v68 - 150
            end
            a1.wallOffsets[n_2 + 1] = v68
            a1.leftWallTiles[n_2 + 1]:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(-(DUNK_SHOT_CONFIG_upv_1.fieldHalfWidth + 13), v68, -4)))
            a1.rightWallTiles[n_2 + 1]:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(DUNK_SHOT_CONFIG_upv_1.fieldHalfWidth + 13, v68, -4)))
        end
    else
        v67 = math.round(cameraCenterY_1 / 60) * 60
        if v67 ~= a1.sideWallY then
            translateModel_upv_1(sideWall_1, (Vector3.new(0, v67 - a1.sideWallY, 0)))
            a1.sideWallY = v67
        end
        return nil
    end
end
u24.updatePreview = function(a1)
    --[[
      name: updatePreview
      line: 1039
      upvalues:
        slingSpeed_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
        u23 (copy, index: 3)
        stepBall_upv_1 (copy, index: 4)
        reflectWalls_upv_1 (copy, index: 5)
        tbl_upv_2 (copy, index: 6)
    ]]
    if a1.flying or a1.dead then
        a1:parkPreviewDots()
        return nil
    else
        local v69 = nil
        if a1:isAiming() then
            local v70 = a1:aimLength()
            v69 = slingSpeed_upv_1(v70, DUNK_SHOT_CONFIG_upv_1.launchSpeedPerDragStud, DUNK_SHOT_CONFIG_upv_1.maxLaunchSpeed)
            if v69 >= DUNK_SHOT_CONFIG_upv_1.minLaunchSpeed and v70 >= 1e-04 then
                local runtime_9 = a1.hoops[a1.seatSlot + 1].runtime
                a1.previewBall.x = runtime_9.centerX
                a1.previewBall.y = runtime_9.centerY
                a1.previewBall.velocityX = (-a1.aimX / v70) * v69
                a1.previewBall.velocityY = (-a1.aimY / v70) * v69
                for n_3 = 0, #a1.previewDots - 1 do
                    local v71 = 0
                    local v72 = false
                    while true do
                        if v72 then
                            v71 = v71 + 1
                        else
                            v72 = true
                        end
                        if v71 >= u23 then
                            break
                        end
                        stepBall_upv_1(a1.previewBall, DUNK_SHOT_CONFIG_upv_1.gravity, 0.008333333333333333)
                        reflectWalls_upv_1(a1.previewBall, tbl_upv_2)
                    end
                    v71 = a1.previewDots[n_3 + 1]
                    v71.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a1.previewBall.x, a1.previewBall.y, 0.9))
                    v71.Transparency = (n_3 / #a1.previewDots) * 0.75
                end
            else
                a1:parkPreviewDots()
                return nil
            end
        else
            a1:parkPreviewDots()
            return nil
        end
    end
end
u24.parkPreviewDots = function(a1)
    --[[
      name: parkPreviewDots
      line: 1080
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_5 in a1.previewDots do
        if value_5.Transparency < 1 then
            value_5.Transparency = 1
            value_5.CFrame = u1
        end
    end
end
u24.isAiming = function(a1)
    --[[
      name: isAiming
      line: 1089
    ]]
    return a1.aimSource ~= "none"
end
u24.aimLength = function(a1)
    --[[
      name: aimLength
      line: 1092
    ]]
    return (math.sqrt((a1.aimX * a1.aimX) + (a1.aimY * a1.aimY)))
end
u24.cancelAim = function(a1)
    --[[
      name: cancelAim
      line: 1095
    ]]
    a1.aimSource = "none"
    a1.aimX = 0
    a1.aimY = 0
end
u24.beginPointerAim = function(a1, a2)
    --[[
      name: beginPointerAim
      line: 1100
    ]]
    if not (a1.flying) and not (a1.settling) and not (a1.dead) and a1.aimSource == "none" then
        a1.aimSource = "pointer"
        a1.pointerOriginX = a2.X
        a1.pointerOriginY = a2.Y
        a1.aimX = 0
        a1.aimY = 0
        return
    end
    return nil
end
u24.setAimFromPointer = function(a1, a2)
    --[[
      name: setAimFromPointer
      line: 1110
    ]]
    local v73 = math.max(a1.stage.camera.ViewportSize.Y, 1)
    local v74 = a1.stage.getVisibleHeight() / v73
    a1:setAim((a2.X - a1.pointerOriginX) * v74, -(a2.Y - a1.pointerOriginY) * v74)
end
u24.setAim = function(a1, a2, a3)
    --[[
      name: setAim
      line: 1116
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v75 = math.sqrt((a2 * a2) + (a3 * a3))
    if v75 > DUNK_SHOT_CONFIG_upv_1.dragMaxStuds and v75 >= 1e-04 then
        local v76 = DUNK_SHOT_CONFIG_upv_1.dragMaxStuds / v75
        a1.aimX = a2 * v76
        a1.aimY = a3 * v76
    else
        a1.aimX = a2
        a1.aimY = a3
        return nil
    end
end
u24.pollGamepad = function(a1)
    --[[
      name: pollGamepad
      line: 1127
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
    ]]
    if gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA) then
        if a1.aimSource == "none" and not (a1.flying) and not (a1.settling) and not (a1.dead) then
            a1.aimSource = "gamepad"
        end
        if a1.aimSource == "gamepad" then
            a1:setAim(gamepadInput_upv_1:leftX() * DUNK_SHOT_CONFIG_upv_1.dragMaxStuds, gamepadInput_upv_1:leftY() * DUNK_SHOT_CONFIG_upv_1.dragMaxStuds)
        end
        return nil
    elseif a1.aimSource == "gamepad" then
        a1:fire()
    end
end
u24.fire = function(a1)
    --[[
      name: fire
      line: 1144
      upvalues:
        slingSpeed_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
        ringLocalY_upv_1 (copy, index: 3)
    ]]
    local aimX_1 = a1.aimX
    local aimY_1 = a1.aimY
    local v77 = a1:aimLength()
    local v78 = slingSpeed_upv_1(v77, DUNK_SHOT_CONFIG_upv_1.launchSpeedPerDragStud, DUNK_SHOT_CONFIG_upv_1.maxLaunchSpeed)
    a1:cancelAim()
    a1:parkPreviewDots()
    if not (a1.flying) and not (a1.settling) and not (a1.dead) and v78 >= DUNK_SHOT_CONFIG_upv_1.minLaunchSpeed and v77 >= 1e-04 then
        local runtime_10 = a1.hoops[a1.seatSlot + 1].runtime
        local runtime_11 = a1.hoops[(1 - a1.seatSlot) + 1].runtime
        a1.ball.x = runtime_10.centerX
        a1.ball.y = runtime_10.centerY
        a1.ball.velocityX = (-aimX_1 / v77) * v78
        a1.ball.velocityY = (-aimY_1 / v77) * v78
        a1.renderPreviousBallX = a1.ball.x
        a1.renderPreviousBallY = a1.ball.y
        a1.launchY = runtime_10.centerY
        a1.flying = true
        a1.stuckClock = 0
        a1.stuckKicked = false
        runtime_10.previousLocalY = 0
        runtime_11.touchedRim = false
        runtime_11.previousLocalY = ringLocalY_upv_1(runtime_11, a1.ball)
        local v79 = v78 / DUNK_SHOT_CONFIG_upv_1.maxLaunchSpeed
        a1.context.audio.play("pop", {volume = 0.16 + (0.16 * v79), pitch = 1.5 - (0.25 * v79)})
        a1.context.audio.play("whoosh", {volume = 0.24 + (0.32 * v79), pitch = 0.95 + (0.35 * v79)})
        a1:spawnShock(a1.ball.x, a1.ball.y, 1.6, 6.4, 0)
        a1:spawnShock(a1.ball.x, a1.ball.y, 1.1, 4.8, 0.07)
        return
    end
    return nil
end
u24.onBasket = function(a1)
    --[[
      name: onBasket
      line: 1191
      upvalues:
        u17 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
        publishCombo_upv_1 (copy, index: 3)
        u19 (copy, index: 4)
        u16 (copy, index: 5)
    ]]
    local runtime_12 = a1.hoops[(1 - a1.seatSlot) + 1].runtime
    local v80
    if runtime_12.touchedRim then
        a1.swishStreak = 0
        v80 = 1
        a1.context.audio.play("flappyBasketScore", {})
    else
        a1.swishStreak = a1.swishStreak + 1
        v80 = a1.swishStreak
        a1.context.audio.play("perfect", {pitch = (math.min(a1.swishStreak, 12) * 0.06) + 1})
        a1.popups:show(a1.stage.origin + Vector3.new(runtime_12.centerX, runtime_12.centerY + 3, 0.9), "PERFECT!", u17, 1.15)
        a1.stage.shake(DUNK_SHOT_CONFIG_upv_1.swishShake)
        if a1.swishStreak ~= DUNK_SHOT_CONFIG_upv_1.streakFireAt then
            a1:hitStop(DUNK_SHOT_CONFIG_upv_1.swishHitStopSeconds)
        else
            a1.context.audio.play("flameIgnite", {})
            a1:hitStop(DUNK_SHOT_CONFIG_upv_1.fireIgniteHitStopSeconds)
        end
        if a1.swishStreak >= 2 then
            publishCombo_upv_1({count = a1.swishStreak, color = u19})
        end
    end
    a1.score = a1.score + v80
    a1.basketCount = a1.basketCount + 1
    a1.swishBonusTotal = a1.swishBonusTotal + (v80 - 1)
    a1.context.reportScore(a1.score)
    a1.popups:show(a1.stage.origin + Vector3.new(runtime_12.centerX, runtime_12.centerY - 2, 0.9), ("+%*"):format(v80), u16, 0.9)
    a1:applyStreakVisuals()
    a1.seatSlot = 1 - a1.seatSlot
    a1:placeHoop(1 - a1.seatSlot)
    local v81 = a1.hoops[a1.seatSlot + 1]
    v81.netPulse = 1
    a1:setRimScored(v81, true)
    a1:spawnShock(v81.runtime.centerX, v81.runtime.centerY, 2, 7, 0)
    a1:beginSettle()
    a1.launchY = v81.runtime.centerY
end
u24.die = function(a1)
    --[[
      name: die
      line: 1251
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        u18 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1.tutorial:disarm()
        a1:setRunning(false)
        a1.stage.shake(DUNK_SHOT_CONFIG_upv_1.deathShake)
        a1.context.audio.play("buzz", {})
        a1.popups:show(a1.stage.origin + Vector3.new(a1.ball.x, a1.ball.y + 3, 0.9), "MISS!", u18, 1.15)
        a1.swishStreak = 0
        a1:applyStreakVisuals()
        a1:cancelAim()
        a1:parkPreviewDots()
        a1.deathVelocityY = math.min(a1.ball.velocityY, -DUNK_SHOT_CONFIG_upv_1.deathFallSpeed)
        local score_upv_1 = a1.score
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            DUNK_SHOT_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1275
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
u24.placeHoop = function(a1, a2)
    --[[
      name: placeHoop
      line: 1281
      upvalues:
        placementFor_upv_1 (copy, index: 1)
        hoopSpecAt_upv_1 (copy, index: 2)
        adoptPlacement_upv_1 (copy, index: 3)
    ]]
    local v82 = a1.hoops[a2 + 1]
    if v82 ~= nil then
        a1:setRimScored(v82, false)
        local v83 = placementFor_upv_1(hoopSpecAt_upv_1(a1.runSeed, a1.nextHoopIndex), a1.lastAnchorY)
        adoptPlacement_upv_1(v82.runtime, v83, a1.score)
        a1.lastAnchorY = v83.anchorY
        a1.nextHoopIndex = a1.nextHoopIndex + 1
    else
        return nil
    end
end
u24.seatBall = function(a1)
    --[[
      name: seatBall
      line: 1293
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        ringLocalY_upv_1 (copy, index: 2)
    ]]
    local runtime_13 = a1.hoops[a1.seatSlot + 1].runtime
    local runtime_14 = a1.hoops[(1 - a1.seatSlot) + 1].runtime
    a1.ball.x = runtime_13.centerX
    a1.ball.y = runtime_13.centerY - DUNK_SHOT_CONFIG_upv_1.ballSeatDepth
    a1.ball.velocityX = 0
    a1.ball.velocityY = 0
    a1.renderPreviousBallX = a1.ball.x
    a1.renderPreviousBallY = a1.ball.y
    a1.flying = false
    a1.settling = false
    a1.launchY = runtime_13.centerY
    runtime_14.previousLocalY = ringLocalY_upv_1(runtime_14, a1.ball)
end
u24.applyStreakVisuals = function(a1)
    --[[
      name: applyStreakVisuals
      line: 1309
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v84 = DUNK_SHOT_CONFIG_upv_1.streakFireAt <= a1.swishStreak
    a1.smokeEmitter.Enabled = not v84 and (DUNK_SHOT_CONFIG_upv_1.streakSmokeAt <= a1.swishStreak)
    a1.fireEmitter.Enabled = v84
    a1.ballTrail.Enabled = v84
end
u24.buildBall = function(a1, a2)
    --[[
      name: buildBall
      line: 1315
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v85 = nil
    local v86 = false
    local v87 = a1:kitOn()
    if v87 then
        v85 = a1.assets:template("Ball")
        v86 = v85 ~= nil
    end
    if v85 == nil then
        v87 = waitForSceneryRoot_upv_1("FlappyBasket", "dunk-shot")
        if v87 ~= nil then
            v87 = v87:FindFirstChild("Ball")
        end
        v85 = v87
    end
    local v89 = nil
    if v85 ~= nil and v85:IsA("Model") then
        v87 = v85:Clone()
        if v86 then
            v89 = a1.assets:template("BallSeam")
            if v89 ~= nil then
                v89 = v89:Clone()
                for _, value_6 in v89:GetChildren() do
                    value_6.Parent = v87
                end
                v89:Destroy()
            end
        end
        for _, value_7 in v87:GetDescendants() do
            if value_7:IsA("BasePart") then
                value_7.Anchored = true
                value_7.CanCollide = false
                value_7.CanQuery = false
                value_7.CanTouch = false
                value_7.CastShadow = false
            end
        end
        for _, value_8 in v87:GetChildren() do
            if not (value_8:IsA("Model")) then
                continue
            end
            if string.find(value_8.Name, "Wing", 1, true) ~= nil then
                value_8:Destroy()
            end
        end
        v87.Parent = a2
    else
        warn("[DunkShot] no authored ball (DunkShot.Player.Ball or FlappyBasket.Ball) \226\128\148 using the fallback ball")
        v87 = a1:buildFallbackBall(a2)
    end
    local v90 = v87:FindFirstChild("BallCore", true)
    v89 = v90 == nil or not (v90:IsA("BasePart")) or v90
    if v89 == nil then
        local v91 = 0
        local v92 = nil
        local _ = nil
        for v95, value_9 in v87:GetDescendants() do
            v92 = value_9:IsA("BasePart")
            if not (v92) then
                continue
            end
            v92 = math.max(value_9.Size.X, value_9.Size.Y, value_9.Size.Z)
            if v91 < v92 then
                v89, v91 = value_9, v92
            end
        end
    end
    if v89 == nil then
        error("[DunkShot] ball model has no BasePart")
    end
    local v93 = math.max(v89.Size.X, v89.Size.Y, v89.Size.Z)
    if v93 > 0.01 then
        local v94 = DUNK_SHOT_CONFIG_upv_1.ballRadius * 2 / v93
        if math.abs(v94 - 1) > 0.01 then
            v87:ScaleTo(v87:GetScale() * v94)
        end
    end
    if v86 then
        v87.WorldPivot = CFrame.new(v89.Position) * v87:GetPivot().Rotation
    end
    a1.ballOrientation = v87:GetPivot().Rotation
    a1.ballModel = v87
    a1.smokeEmitter = a1:buildSmokeEmitter(v89)
    a1.fireEmitter = a1:buildFireEmitter(v89)
    a1.ballTrail = a1:buildBallTrail(v89)
end
u24.buildFallbackBall = function(a1, a2)
    --[[
      name: buildFallbackBall
      line: 1416
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
        u7 (copy, index: 4)
    ]]
    local v95 = Instance.new("Model")
    v95.Name = "Ball"
    v95.Parent = a2
    local v96 = DUNK_SHOT_CONFIG_upv_1.ballRadius * 2
    local v97 = makeSmoothPart_upv_1(v95)
    v97.Name = "BallCore"
    v97.Shape = Enum.PartType.Ball
    v97.Size = Vector3.new(v96, v96, v96)
    v97.Color = u6
    v97.CFrame = CFrame.new(0, 0, 0)
    local v98 = makeSmoothPart_upv_1(v95)
    v98.Size = Vector3.new(0.18, v96 + 0.05, 0.6)
    v98.Color = u7
    v98.CFrame = CFrame.new(0, 0, 0)
    local v99 = makeSmoothPart_upv_1(v95)
    v99.Size = Vector3.new(v96 + 0.05, 0.18, 0.6)
    v99.Color = u7
    v99.CFrame = CFrame.new(0, 0, 0)
    v95.WorldPivot = CFrame.new(0, 0, 0)
    return v95
end
u24.buildSmokeEmitter = function(a1, a2)
    --[[
      name: buildSmokeEmitter
      line: 1438
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
        u20 (copy, index: 2)
    ]]
    local v100 = Instance.new("ParticleEmitter")
    v100.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v100.Color = ColorSequence.new(u20)
    v100.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.7), NumberSequenceKeypoint.new(1, 0)})
    local tbl_8 = {NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 1)}
    v100.Transparency = NumberSequence.new(tbl_8)
    v100.Lifetime = NumberRange.new(0.35, 0.65)
    v100.Rate = 22
    v100.Speed = NumberRange.new(1, 3)
    v100.SpreadAngle = Vector2.new(30, 30)
    v100.EmissionDirection = Enum.NormalId.Top
    v100.Enabled = false
    v100.Parent = a2
    return v100
end
u24.buildFireEmitter = function(a1, a2)
    --[[
      name: buildFireEmitter
      line: 1453
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
        u21 (copy, index: 2)
        u22 (copy, index: 3)
    ]]
    local v101 = Instance.new("ParticleEmitter")
    v101.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v101.Color = ColorSequence.new(u21, u22)
    v101.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9), NumberSequenceKeypoint.new(1, 0)})
    local tbl_9 = {NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 1)}
    v101.Transparency = NumberSequence.new(tbl_9)
    v101.Lifetime = NumberRange.new(0.25, 0.5)
    v101.Rate = 45
    v101.Speed = NumberRange.new(3, 5)
    v101.SpreadAngle = Vector2.new(35, 35)
    v101.LightEmission = 1
    v101.EmissionDirection = Enum.NormalId.Top
    v101.Enabled = false
    v101.Parent = a2
    return v101
end
u24.buildBallTrail = function(a1, a2)
    --[[
      name: buildBallTrail
      line: 1469
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        u21 (copy, index: 2)
        u22 (copy, index: 3)
    ]]
    local v102 = Instance.new("Attachment")
    v102.Position = Vector3.new(0, DUNK_SHOT_CONFIG_upv_1.ballRadius * 0.7, 0)
    v102.Parent = a2
    local v103 = Instance.new("Attachment")
    v103.Position = Vector3.new(0, -DUNK_SHOT_CONFIG_upv_1.ballRadius * 0.7, 0)
    v103.Parent = a2
    local v104 = Instance.new("Trail")
    v104.Attachment0 = v102
    v104.Attachment1 = v103
    v104.Color = ColorSequence.new(u21, u22)
    v104.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.25), NumberSequenceKeypoint.new(1, 1)})
    v104.Lifetime = 0.22
    v104.LightEmission = 1
    v104.FaceCamera = true
    v104.Enabled = false
    v104.Parent = a2
    return v104
end
u24.buildAuthoredHoop = function(a1, a2)
    --[[
      name: buildAuthoredHoop
      line: 1488
      upvalues:
        fitModelExtent_upv_1 (copy, index: 1)
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        makeHoopRuntime_upv_1 (copy, index: 4)
    ]]
    if a1:kitOn() then
        local v105 = nil
        if a1.assets:has("Ring") then
            v105 = a1.assets:model("Ring", a2)
            if v105 ~= nil then
                local tbl_10 = {}
                for v106, value_10 in v105:GetDescendants() do
                    if value_10:IsA("BasePart") then
                        table.insert(tbl_10, value_10)
                    end
                end
                local v107, v108 = nil, nil
                if #tbl_10 == 2 then
                    fitModelExtent_upv_1(v105, "x", (DUNK_SHOT_CONFIG_upv_1.hoopHalfWidth + DUNK_SHOT_CONFIG_upv_1.rimKnobRadius) * 2)
                    v107 = tbl_10[1]
                    v108 = tbl_10[2]
                    local v109
                    if v107.Position.Y >= v108.Position.Y then
                        v109 = v108
                    else
                        v107, v109 = tbl_10[2], tbl_10[1]
                    end
                    if v107.Size.X >= v109.Size.X then
                        v105.WorldPivot = CFrame.new(v107.Position)
                        local tbl_11 = {}
                        tbl_11.part = v109
                        tbl_11.restSize = v109.Size
                        tbl_11.rest = v105:GetPivot():ToObjectSpace(v109.CFrame)
                        a1:adoptNetMesh(tbl_11)
                        v105:PivotTo(u1)
                        local v106 = {}
                        v106.model = v105
                        v106.runtime = makeHoopRuntime_upv_1()
                        v106.net = {}
                        v106.authoredNet = tbl_11
                        v106.rimParts = {v107}
                        v106.rimColors = {v107.Color}
                        v106.trackDots = a1:buildTrackDots(a2)
                        return v106
                    end
                    warn("[DunkShot] Hoop.Ring rim/net classification failed \226\128\148 procedural hoop")
                else
                    warn((("[DunkShot] Hoop.Ring expected rim + net, got %* parts \226\128\148 procedural hoop"):format(#tbl_10)))
                end
                v105:Destroy()
            end
        end
    end
    return nil
end
u24.buildHoop = function(a1, a2)
    --[[
      name: buildHoop
      line: 1544
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        u9 (copy, index: 4)
        netDepth_upv_1 (copy, index: 5)
        u10 (copy, index: 6)
        u1 (copy, index: 7)
        makeHoopRuntime_upv_1 (copy, index: 8)
    ]]
    local v110 = a1:buildAuthoredHoop(a2)
    if v110 == nil then
        local v111 = Instance.new("Model")
        v111.Name = "Hoop"
        v111.Parent = a2
        local hoopHalfWidth_1 = DUNK_SHOT_CONFIG_upv_1.hoopHalfWidth
        local rimKnobRadius_1 = DUNK_SHOT_CONFIG_upv_1.rimKnobRadius
        local v112 = makeSmoothPart_upv_1(v111)
        v112.Size = Vector3.new((hoopHalfWidth_1 * 2) + (rimKnobRadius_1 * 2), 0.5, 0.9)
        v112.Color = u8
        v112.CFrame = CFrame.new(0, -0.35, 0.55)
        local v113 = makeSmoothPart_upv_1(v111)
        v113.Size = Vector3.new((hoopHalfWidth_1 * 2) + rimKnobRadius_1, 0.35, 0.7)
        v113.Color = u9
        v113.CFrame = CFrame.new(0, 0.3, -0.55)
        local tbl_12 = {}
        table.insert(tbl_12, v112)
        table.insert(tbl_12, v113)
        for n_4 = 0, 1 do
            local v114 = makeSmoothPart_upv_1(v111)
            v114.Shape = Enum.PartType.Ball
            v114.Size = Vector3.new(rimKnobRadius_1 * 2, rimKnobRadius_1 * 2, rimKnobRadius_1 * 2)
            v114.Color = u8
            v114.CFrame = CFrame.new((((n_4 ~= 0) and 1) or -1) * hoopHalfWidth_1, 0, 0)
            table.insert(tbl_12, v114)
        end
        local tbl_13 = {}
        for _, v115 in tbl_12 do
            table.insert(tbl_13, v115.Color)
        end
        local tbl_14 = {}
        for n_5 = 0, 4 do
            local v115 = (n_5 / 4) * 2 - 1
            local v116 = v115 * hoopHalfWidth_1 * 0.92
            local v117 = v115 * hoopHalfWidth_1 * 0.5
            local v118 = makeSmoothPart_upv_1(v111)
            v118.Size = Vector3.new(0.13, netDepth_upv_1, 0.13)
            v118.Color = u10
            local v119 = CFrame.new((v116 + v117) / 2, -netDepth_upv_1 / 2, -0.15) * CFrame.Angles(0, 0, -math.atan2(v116 - v117, netDepth_upv_1))
            v118.CFrame = v119
            table.insert(tbl_14, {part = v118, rest = v119, outward = math.sign(v115)})
        end
        local v120 = makeSmoothPart_upv_1(v111)
        v120.Size = Vector3.new(hoopHalfWidth_1 * 1.1, 0.13, 0.13)
        v120.Color = u10
        local v121 = CFrame.new(0, -netDepth_upv_1, -0.15)
        v120.CFrame = v121
        table.insert(tbl_14, {part = v120, rest = v121})
        v111.WorldPivot = CFrame.new(0, 0, 0)
        v111:PivotTo(u1)
        local v115 = {}
        v115.model = v111
        v115.runtime = makeHoopRuntime_upv_1()
        v115.net = tbl_14
        v115.rimParts = tbl_12
        v115.rimColors = tbl_13
        v115.trackDots = a1:buildTrackDots(a2)
        return v115
    end
    return v110
end
u24.buildTrackDots = function(a1, a2)
    --[[
      name: buildTrackDots
      line: 1632
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local tbl_15 = {}
    for _ = 0, 8 do
        local v122 = makeSmoothPart_upv_1(a2)
        v122.Shape = Enum.PartType.Ball
        v122.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896)
        v122.Color = u15
        v122.Transparency = 0.35
        v122.CFrame = u1
        table.insert(tbl_15, v122)
    end
    return tbl_15
end
u24.poseTrackDots = function(a1, a2)
    --[[
      name: poseTrackDots
      line: 1645
      upvalues:
        u1 (copy, index: 1)
    ]]
    local runtime_15 = a2.runtime
    if a2.trackIndex ~= runtime_15.index then
        a2.trackIndex = runtime_15.index
        local v123 = false
        if runtime_15.motion ~= "static" then
            v123 = 0.5 < runtime_15.amplitude
        end
        local origin_1 = a1.stage.origin
        for n_6 = 0, #a2.trackDots - 1 do
            local v124 = a2.trackDots[n_6 + 1]
            local v125 = nil
            if v123 then
                v125 = (n_6 / (#a2.trackDots - 1)) * 2 - 1
                v124.CFrame = CFrame.new(origin_1 + Vector3.new(((runtime_15.motion == "horizontal") and (runtime_15.anchorX + v125 * runtime_15.amplitude)) or (runtime_15.anchorX), ((runtime_15.motion == "vertical") and (runtime_15.anchorY + v125 * runtime_15.amplitude)) or (runtime_15.anchorY), -0.8))
            else
                v124.CFrame = u1
            end
        end
    else
        return nil
    end
end
u24.setRimScored = function(a1, a2, a3)
    --[[
      name: setRimScored
      line: 1666
      upvalues:
        u13 (copy, index: 1)
    ]]
    for n_7 = 0, #a2.rimParts - 1 do
        local v126 = a2.rimParts[n_7 + 1]
        local v127
        if a3 then
            v127 = u13
        else
            v127 = a2.rimColors[n_7 + 1]
        end
        v126.Color = v127
    end
end
u24.buildWalls = function(a1, a2)
    --[[
      name: buildWalls
      line: 1671
      upvalues:
        modelWorldAabb_upv_1 (copy, index: 1)
        placeModelCenter_upv_1 (copy, index: 2)
    ]]
    if a1:kitOn() then
        local v128 = nil
        if a1.assets:has("SideWall") then
            v128 = a1.assets:model("SideWall", a2)
            local v129 = nil
            if v128 ~= nil then
                v129 = a1.assets:template("SideWall")
                local v130
                if v129 == nil then
                    v130 = nil
                else
                    v130 = modelWorldAabb_upv_1(v129)
                end
                if v130 ~= nil then
                    a1.sideWallZ = v130.center.Z - 0
                end
                if placeModelCenter_upv_1(v128, a1.stage.origin + Vector3.new(0, 0, a1.sideWallZ)) then
                    a1.sideWall = v128
                    a1.sideWallY = 0
                    return nil
                end
                v128:Destroy()
            end
            warn("[DunkShot] Court.SideWall unusable \226\128\148 procedural wall treadmill")
        end
    end
    for n_8 = 0, 4 do
        table.insert(a1.leftWallTiles, (a1:buildWallTile(a2, n_8, 1)))
        table.insert(a1.rightWallTiles, (a1:buildWallTile(a2, n_8, -1)))
        table.insert(a1.wallOffsets, (n_8 - 1) * 30)
    end
end
u24.buildWallTile = function(a1, a2, a3, a4)
    --[[
      name: buildWallTile
      line: 1705
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u5 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u11 (copy, index: 5)
        u1 (copy, index: 6)
    ]]
    local v131 = Instance.new("Model")
    v131.Name = "WallTile"
    v131.Parent = a2
    local v132 = makeStagePart_upv_1(v131)
    v132.Size = Vector3.new(26, 30, 2)
    local v133
    if a3 % 2 ~= 0 then
        v133 = u5
    else
        v133 = u4
    end
    v132.Color = v133
    v132.CFrame = CFrame.new(0, 0, 0)
    local v134 = makeSmoothPart_upv_1(v131)
    v134.Size = Vector3.new(0.30000001192092896, 30, 0.4000000059604645)
    v134.Color = u11
    v134.CFrame = CFrame.new(a4 * 12.85, 0, 1.25)
    v131.WorldPivot = CFrame.new(0, 0, 0)
    v131:PivotTo(u1)
    return v131
end
local function buildNetDeform_upv_1(a1, a2)
    --[[
      name: buildNetDeform
      line: 256
    ]]
    local v135 = a1:GetVertices()
    local v136 = #v135
    local v137 = table.create(v136)
    local v138 = table.create(v136)
    local v139 = table.create(v136)
    local v140 = math.huge
    local v141 = -math.huge
    local v142 = math.huge
    local v143 = -math.huge
    local v144 = math.huge
    local v145 = -math.huge
    local v146 = 0
    local v147 = false
    while true do
        if v147 then
            v146 = v146 + 1
        else
            v147 = true
        end
        if v146 >= v136 then
            break
        end
        local v148 = a1:GetPosition(v135[v146 + 1])
        v137[v146 + 1] = v148.X
        v138[v146 + 1] = v148.Y
        v139[v146 + 1] = v148.Z
        v140 = math.min(v140, v148.X)
        v141 = math.max(v141, v148.X)
        v142 = math.min(v142, v148.Y)
        v143, v144, v145 = math.max(v143, v148.Y), math.min(v144, v148.Z), math.max(v145, v148.Z)
    end
    v146 = math.max(v143 - v142, 0.001)
    v147 = table.create(v136)
    local tbl_16 = 0
    local v149 = false
    v149 = v149
    while true do
        if v149 then
            tbl_16 = tbl_16 + 1
        else
            v149 = true
        end
        if tbl_16 >= v136 then
            break
        end
        v147[tbl_16 + 1] = math.max((((v143 - v138[tbl_16 + 1]) / v146) - 0.1) / 0.9, 0)
    end
    tbl_16 = {}
    tbl_16.editable = a1
    tbl_16.vertexIds = v135
    tbl_16.restX = v137
    tbl_16.restY = v138
    tbl_16.restZ = v139
    tbl_16.weight = v147
    tbl_16.localPerStudY = v146 / a2.Y
    tbl_16.localPerStudX = math.max(v141 - v140, 0.001) / a2.X
    tbl_16.centerX = (v140 + v141) / 2
    tbl_16.centerZ = (v144 + v145) / 2
    return tbl_16
end
u24.adoptNetMesh = function(a1, a2)
    --[[
      name: adoptNetMesh
      line: 1725
      upvalues:
        AssetService_upv_1 (copy, index: 1)
        flattenKitPart_upv_1 (copy, index: 2)
        buildNetDeform_upv_1 (copy, index: 3)
    ]]
    local part_upv_1 = a2.part
    if part_upv_1:IsA("MeshPart") and part_upv_1.MeshId ~= "" then
        task.spawn(
            function()
                --[[
                  line: 1730
                  upvalues:
                    part_upv_1 (copy, index: 1)
                    AssetService_upv_1 (copy, index: 2)
                    a2 (copy, index: 3)
                    flattenKitPart_upv_1 (copy, index: 4)
                    buildNetDeform_upv_1 (copy, index: 5)
                    a1 (copy, index: 6)
                ]]
                for _ = 0, 7 do
                    local v150 = nil
                    if part_upv_1.Parent ~= nil then
                        local u25
                        u25 = nil
                        local u26
                        u26 = nil
                        if pcall(
                            function()
                                --[[
                                  line: 1737
                                  upvalues:
                                    AssetService_upv_1 (copy, index: 1)
                                    part_upv_1 (copy, index: 2)
                                    u25 (ref,  index: 3)
                                    u26 (ref,  index: 4)
                                ]]
                                local v151 = AssetService_upv_1:CreateEditableMeshAsync(Content.fromUri(part_upv_1.MeshId))
                                u25 = v151
                                if part_upv_1.DoubleSided then
                                    local v152 = nil
                                    local v153 = nil
                                    local v154 = nil
                                    local v155 = nil
                                    for _, value_11 in v151:GetFaces() do
                                        if type(value_11) ~= "number" then
                                            continue
                                        end
                                        v155 = v151:GetFaceVertices(value_11)
                                        v152 = v155[1]
                                        v153 = v155[2]
                                        v154 = v155[3]
                                        if #v155 ~= 3 or type(v152) ~= "number" or type(v153) ~= "number" then
                                            continue
                                        end
                                        if type(v154) == "number" then
                                            v151:AddTriangle(v154, v153, v152)
                                        end
                                    end
                                end
                                u26 = AssetService_upv_1:CreateMeshPartAsync(Content.fromObject(v151), {CollisionFidelity = Enum.CollisionFidelity.Box})
                            end
                        ) then
                            if u25 == nil then
                                if u25 ~= nil then
                                    u25:Destroy()
                                end
                                if u26 ~= nil then
                                    u26:Destroy()
                                end
                                task.wait(0.5)
                            elseif u26 == nil then
                                if u25 ~= nil then
                                    u25:Destroy()
                                end
                                if u26 ~= nil then
                                    u26:Destroy()
                                end
                            else
                                v150 = part_upv_1.Parent
                                if v150 ~= nil then
                                    u26.Name = part_upv_1.Name
                                    u26.Size = a2.restSize
                                    u26.CFrame = part_upv_1.CFrame
                                    u26.Color = part_upv_1.Color
                                    u26.Material = part_upv_1.Material
                                    u26.Transparency = part_upv_1.Transparency
                                    u26.Reflectance = part_upv_1.Reflectance
                                    flattenKitPart_upv_1(u26)
                                    u26.Parent = v150
                                    part_upv_1:Destroy()
                                    a2.part = u26
                                    a2.deform = buildNetDeform_upv_1(u25, a2.restSize)
                                    table.insert(a1.netEditables, u25)
                                else
                                    u25:Destroy()
                                    u26:Destroy()
                                end
                                return nil
                            end
                        else
                            if u25 ~= nil then
                                u25:Destroy()
                            end
                            if u26 ~= nil then
                                u26:Destroy()
                            end
                        end
                    else
                        return nil
                    end
                    local u25, u26
                end
                warn("[DunkShot] EditableMesh net rig unavailable \226\128\148 keeping the Size-stretch fallback")
            end
        )
    else
        return nil
    end
end
u24.kitOn = function(a1)
    --[[
      name: kitOn
      line: 1802
    ]]
    return a1.assets.available
end
u24.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 1805
      upvalues:
        LIGHTING_PROFILES_upv_1 (copy, index: 1)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 2)
        readLightingFolderProfile_upv_1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
    ]]
    local lighting_1 = a1.assets.lighting
    if a1:kitOn() then
        local v156 = nil
        if lighting_1 ~= nil then
            v156 = LIGHTING_PROFILES_upv_1["dunk-shot"] or DEFAULT_GAME_LIGHTING_upv_1
            a1.stage.setLighting(readLightingFolderProfile_upv_1(lighting_1, tbl_upv_1, v156))
            return
        end
    end
    return nil
end
u24.buildPreviewDots = function(a1, a2)
    --[[
      name: buildPreviewDots
      line: 1813
      upvalues:
        DUNK_SHOT_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u12 (copy, index: 3)
        u1 (copy, index: 4)
        u14 (copy, index: 5)
    ]]
    local v157 = DUNK_SHOT_CONFIG_upv_1.previewDotSize * 1.45
    for _ = 0, DUNK_SHOT_CONFIG_upv_1.previewDots - 1 do
        local v158 = makeSmoothPart_upv_1(a2)
        v158.Shape = Enum.PartType.Ball
        v158.Material = Enum.Material.Neon
        v158.Size = Vector3.new(v157, v157, v157)
        v158.Color = u12
        v158.Transparency = 1
        v158.CFrame = u1
        table.insert(a1.previewDots, v158)
    end
    for _ = 0, 3 do
        local v159 = makeSmoothPart_upv_1(a2)
        v159.Shape = Enum.PartType.Cylinder
        v159.Color = u14
        v159.Transparency = 1
        v159.Size = Vector3.new(0.14000000059604645, 1, 1)
        v159.CFrame = u1
        table.insert(a1.shockRings, {part = v159})
    end
end
u24.spawnShock = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: spawnShock
      line: 1847
    ]]
    local v160 = a1.shockRings[a1.shockCursor + 1]
    if v160 ~= nil then
        a1.shockCursor = (a1.shockCursor + 1) % 4
        v160.active = true
        v160.clock = -a6
        v160.fromDiameter = a4
        v160.toDiameter = a5
        v160.x = a2
        v160.y = a3
    else
        return nil
    end
end
u24.drawShockRings = function(a1, a2)
    --[[
      name: drawShockRings
      line: 1860
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v161 = nil
    for _, value_12 in a1.shockRings do
        if not (value_12.active) then
            continue
        end
        value_12.clock = value_12.clock + a2
        if value_12.clock < 0 then
            continue
        end
        v161 = value_12.clock / 0.24
        if v161 < 1 then
            local v162 = value_12.fromDiameter + (value_12.toDiameter - value_12.fromDiameter) * (1 - ((1 - v161) * (1 - v161)))
            value_12.part.Size = Vector3.new(0.14, v162, v162)
            value_12.part.Transparency = 0.3 + (0.7 * v161)
            value_12.part.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_12.x, value_12.y, 0.7)) * CFrame.Angles(0, 1.5707963267948966, 0)
        else
            value_12.active = false
            value_12.part.Transparency = 1
            value_12.part.CFrame = u1
        end
    end
end
u24.destroy = function(a1)
    --[[
      name: destroy
      line: 1887
      upvalues:
        u1 (copy, index: 1)
        BaseWorldGame_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.smokeEmitter.Enabled = false
    a1.fireEmitter.Enabled = false
    a1.ballTrail.Enabled = false
    a1.ballModel:PivotTo(u1)
    for _, value_13 in a1.netEditables do
        value_13:Destroy()
    end
    table.clear(a1.netEditables)
    BaseWorldGame_upv_1.destroy(a1)
end
local tbl_17 = {}
tbl_17.DunkShotGame = u24
return tbl_17