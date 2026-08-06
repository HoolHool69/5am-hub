-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit")
local findLargestBasePart_upv_1 = v2.findLargestBasePart
local fitModelExtent_upv_1 = v2.fitModelExtent
local placeModelCenter_upv_1 = v2.placeModelCenter
local placeModelPoint_upv_1 = v2.placeModelPoint
local translateModel_upv_1 = v2.translateModel
local DEFAULT_GAME_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").DEFAULT_GAME_LIGHTING
local PongAssets_upv_1 = RuntimeLib_1.import(script, script.Parent, "pong-assets").PongAssets
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local PONG_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "pong-config").PONG_CONFIG
local u1 = CFrame.new(0, -1000, 0)
local u2 = PONG_CONFIG_upv_1.courtWidth / 2
local u3 = PONG_CONFIG_upv_1.courtHeight / 2
local u4 = PONG_CONFIG_upv_1.ballSize / 2
local u5 = PONG_CONFIG_upv_1.paddleHeight / 2
local u6 = -u2 + PONG_CONFIG_upv_1.paddleInset
local u7 = u2 - PONG_CONFIG_upv_1.paddleInset
local u8 = u6 + PONG_CONFIG_upv_1.paddleThickness / 2
local u9 = u7 - PONG_CONFIG_upv_1.paddleThickness / 2
local u10 = u3 - u4
local u11 = -u3 + u4
local u12 = u3 - PONG_CONFIG_upv_1.deadZoneTopStuds - u5
local u13 = -u3 + u5
local u14 = (((PONG_CONFIG_upv_1.paddleSegments - 1) + 0.5) / PONG_CONFIG_upv_1.paddleSegments) * 2 - 1
local u15 = u5 + u4
local u16 = Color3.fromRGB(9, 10, 13)
local u17 = Color3.fromRGB(238, 240, 235)
local u18 = Color3.fromRGB(206, 212, 220)
local u19 = Color3.fromRGB(52, 57, 66)
local u20 = Color3.fromRGB(74, 80, 92)
local u21 = Color3.fromRGB(245, 245, 255)
local u22 = Color3.fromRGB(255, 216, 102)
local u23 = Color3.fromRGB(255, 90, 100)
local u24 = Color3.fromRGB(126, 226, 255)
local u25 = Vector3.new(PONG_CONFIG_upv_1.courtWidth + (PONG_CONFIG_upv_1.wallThickness * 2), PONG_CONFIG_upv_1.wallThickness, 2.2)
local u26 = Vector3.new(PONG_CONFIG_upv_1.paddleThickness, PONG_CONFIG_upv_1.paddleHeight, 1.6)
local u27 = Vector3.new(PONG_CONFIG_upv_1.ballSize, PONG_CONFIG_upv_1.ballSize, PONG_CONFIG_upv_1.ballSize)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(198, 198, 206)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(205, 205, 212)
tbl_upv_1.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 136
    ]]
    return "PongGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u28 = setmetatable(tbl_2, tbl_3)
u28.__index = u28
u28.new = function(...)
    --[[
      name: new
      line: 142
      upvalues:
        u28 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u28)
    return v4:constructor(...) or v4
end
u28.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 146
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        PONG_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.dashes = {}
    a1.trailOn = false
    a1.roundToken = 0
    a1.dead = false
    a1.score = 0
    a1.contacts = 0
    a1.currentRally = 0
    a1.bestRally = 0
    a1.ballX = 0
    a1.ballY = 0
    a1.ballVelocityX = 0
    a1.ballVelocityY = 0
    a1.ballSpeed = PONG_CONFIG_upv_1.ballSpeedBase
    a1.previousBallX = 0
    a1.previousBallY = 0
    a1.playerY = 0
    a1.botY = 0
    a1.previousPlayerY = 0
    a1.previousBotY = 0
    a1.serveTimer = 0
    a1.botAimOffset = 0
end
u28.buildScene = function(a1)
    --[[
      name: buildScene
      line: 170
      upvalues:
        PongAssets_upv_1 (copy, index: 1)
        findLargestBasePart_upv_1 (copy, index: 2)
        placeModelPoint_upv_1 (copy, index: 3)
        makeFrontalBackdrop_upv_1 (copy, index: 4)
        u16 (copy, index: 5)
        placeModelCenter_upv_1 (copy, index: 6)
        u25 (copy, index: 7)
        u3 (copy, index: 8)
        PONG_CONFIG_upv_1 (copy, index: 9)
        makeSmoothPart_upv_1 (copy, index: 10)
        u20 (copy, index: 11)
        u17 (copy, index: 12)
        u26 (copy, index: 13)
        u18 (copy, index: 14)
        makeStagePart_upv_1 (copy, index: 15)
        u27 (copy, index: 16)
        fitModelExtent_upv_1 (copy, index: 17)
        u4 (copy, index: 18)
        u1 (copy, index: 19)
        u22 (copy, index: 20)
        u23 (copy, index: 21)
        u19 (copy, index: 22)
        PopupTextPool_upv_1 (copy, index: 23)
    ]]
    local container_1 = a1.stage.container
    a1.assets = PongAssets_upv_1.new()
    local v5 = a1:kitModel("Backdrop", container_1)
    local v6 = false
    if v5 ~= nil then
        local v7 = v5.PrimaryPart or (findLargestBasePart_upv_1(v5))
        if v7 == nil then
            v5:Destroy()
        else
            v7.Material = Enum.Material.SmoothPlastic
            if (v7.Size - Vector3.new(400, 240, 1)).Magnitude > 1 then
                warn("[pong] authored Backdrop is not the frontal 400x240 plate \226\128\148 check its seat")
            end
            placeModelPoint_upv_1(v5, v7.Position, a1.stage.origin + Vector3.new(0, 0, -40))
            a1.backdrop = v7
            v6 = true
        end
    end
    if not (v6) then
        a1.backdrop = makeFrontalBackdrop_upv_1(a1.stage, u16, Enum.Material.SmoothPlastic)
    end
    local v8 = false
    local v9 = a1:kitModel("Wall", container_1)
    if v9 ~= nil then
        local v10 = 0
        for _, value_1 in v9:GetDescendants() do
            v10 = (value_1:IsA("BasePart") and (v10 + 1)) or v10
        end
        if v10 ~= 2 then
            warn((("[pong] Wall kit expected 2 rails, got %* \226\128\148 procedural walls"):format(v10)))
            v9:Destroy()
        else
            placeModelCenter_upv_1(v9, a1.stage.origin)
            v8 = true
        end
    end
    if not (v8) then
        a1.wallTop = a1:proceduralWall(container_1)
        a1.wallTop.Size = u25
        a1:place(a1.wallTop, 0, u3 + (PONG_CONFIG_upv_1.wallThickness / 2), 0)
        a1.wallBottom = a1:proceduralWall(container_1)
        a1.wallBottom.Size = u25
        a1:place(a1.wallBottom, 0, -u3 - (PONG_CONFIG_upv_1.wallThickness / 2), 0)
    end
    local v11 = a1:kitModel("Dash", container_1)
    if v11 == nil then
        for n_1 = 0, 10 do
            local v12 = makeSmoothPart_upv_1(container_1)
            v12.Color = u20
            v12.Size = Vector3.new(0.5, 1.5, 0.4000000059604645)
            a1:place(v12, 0, -u3 + (PONG_CONFIG_upv_1.courtHeight / 11 * (n_1 + 0.5)), -0.5)
            table.insert(a1.dashes, v12)
        end
    else
        placeModelCenter_upv_1(v11, a1.stage.origin + Vector3.new(0, 0, -0.5))
    end
    a1.playerPaddle = a1:proceduralPaddle(container_1, u17)
    a1.playerPaddle.Size = u26
    a1.playerSkin = a1:makePaddleSkin("Paddle", container_1, a1.playerPaddle)
    a1.botPaddle = a1:proceduralPaddle(container_1, u18)
    a1.botPaddle.Size = u26
    a1.botSkin = a1:makePaddleSkin("BotPaddle", container_1, a1.botPaddle)
    local v13 = makeStagePart_upv_1(container_1)
    v13.Color = u17
    a1.ball = v13
    a1.ball.Size = u27
    local v14 = a1:kitModel("Ball", container_1)
    local v15 = nil
    if v14 ~= nil then
        fitModelExtent_upv_1(v14, "xyMax", PONG_CONFIG_upv_1.ballSize)
        v15 = findLargestBasePart_upv_1(v14)
        if v15 == nil then
            v14:Destroy()
        else
            a1.ballSkin = {model = v14, ref = v15}
            v13.Transparency = 1
        end
    end
    local v16 = Instance.new("Attachment")
    v16.Position = Vector3.new(0, u4 * 0.6, 0)
    v16.Parent = a1.ball
    local v17 = Instance.new("Attachment")
    v17.Position = Vector3.new(0, -u4 * 0.6, 0)
    v17.Parent = a1.ball
    a1.trail = Instance.new("Trail")
    a1.trail.Attachment0 = v16
    a1.trail.Attachment1 = v17
    a1.trail.Color = ColorSequence.new(u17)
    a1.trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
    a1.trail.Transparency = NumberSequence.new(0.45, 1)
    a1.trail.Lifetime = 0.12
    a1.trail.FaceCamera = true
    a1.trail.Enabled = false
    a1.trail.Parent = a1.ball
    a1.fxAnchor = makeSmoothPart_upv_1(container_1)
    a1.fxAnchor.Transparency = 1
    a1.fxAnchor.Size = Vector3.new(1, 1, 1)
    a1.fxAnchor.CFrame = u1
    a1.hitBurst = a1:makeBurst(u17, u20, 14, NumberRange.new(0.14, 0.28))
    a1.pointBurst = a1:makeBurst(u22, u17, 26, NumberRange.new(0.25, 0.5))
    a1.missBurst = a1:makeBurst(u23, u19, 26, NumberRange.new(0.3, 0.55))
    a1:applyAuthoredLighting()
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1.stage.setFrameWidthFloor(PONG_CONFIG_upv_1.courtWidth + (PONG_CONFIG_upv_1.wallThickness * 4))
    local input_1 = a1.context.input
    a1.context.janitor:Add(
        input_1.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 315
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "key" then
                    a1.pointerTargetY = a1:worldYFromScreen(a2.Y)
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
                  line: 321
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.pointerTargetY = a1:worldYFromScreen(a5.Y)
            end
        )
    )
end
u28.resetRound = function(a1)
    --[[
      name: resetRound
      line: 325
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.score = 0
    a1.contacts = 0
    a1.currentRally = 0
    a1.bestRally = 0
    a1.playerY = 0
    a1.botY = 0
    a1.previousPlayerY = 0
    a1.previousBotY = 0
    a1.pointerTargetY = nil
    a1.botAimOffset = 0
    local v18 = a1.context.getRunSeed()
    a1.botRandom = deriveRandom_upv_1(v18, 0)
    a1.serveRandom = deriveRandom_upv_1(v18, 1)
    a1.popups:hideAll()
    a1:beginServe()
    a1.context.reportScore(0)
end
u28.revive = function(a1)
    --[[
      name: revive
      line: 345
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1:beginServe()
end
u28.captureRound = function(a1)
    --[[
      name: captureRound
      line: 352
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 356
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2:int(a1.score):int(a1.contacts):int(a1.currentRally):int(a1.bestRally):num(a1.ballX):num(a1.ballY):num(a1.ballVelocityX):num(a1.ballVelocityY):num(a1.ballSpeed):num(a1.playerY):num(a1.botY):num(a1.serveTimer):num(a1.botAimOffset)
        end
    )
end
u28.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 360
      upvalues:
        readResume_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u11 (copy, index: 3)
        u10 (copy, index: 4)
        PONG_CONFIG_upv_1 (copy, index: 5)
        u13 (copy, index: 6)
        u12 (copy, index: 7)
    ]]
    local v19 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 361
            ]]
            local tbl_4 = {}
            tbl_4.score = a3:int()
            tbl_4.contacts = a3:int()
            tbl_4.currentRally = a3:int()
            tbl_4.bestRally = a3:int()
            tbl_4.ballX = a3:num()
            tbl_4.ballY = a3:num()
            tbl_4.ballVelocityX = a3:num()
            tbl_4.ballVelocityY = a3:num()
            tbl_4.ballSpeed = a3:num()
            tbl_4.playerY = a3:num()
            tbl_4.botY = a3:num()
            tbl_4.serveTimer = a3:num()
            tbl_4.botAimOffset = a3:num()
            return tbl_4
        end
    )
    if v19 ~= nil then
        a1.score = a2.score
        a1.contacts = v19.contacts
        a1.currentRally = v19.currentRally
        a1.bestRally = math.max(v19.bestRally, v19.currentRally)
        a1.ballX = math.clamp(v19.ballX, -u2, u2)
        a1.ballY = math.clamp(v19.ballY, u11, u10)
        a1.ballVelocityX = v19.ballVelocityX
        a1.ballVelocityY = v19.ballVelocityY
        a1.ballSpeed = math.max(v19.ballSpeed, PONG_CONFIG_upv_1.ballSpeedBase)
        a1.playerY = math.clamp(v19.playerY, u13, u12)
        a1.botY = math.clamp(v19.botY, u13, u12)
        a1.serveTimer = math.max(v19.serveTimer, 0)
        a1.botAimOffset = v19.botAimOffset
        a1.previousBallX = a1.ballX
        a1.previousBallY = a1.ballY
        a1.previousPlayerY = a1.playerY
        a1.previousBotY = a1.botY
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u28.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 402
    ]]
    a1.previousBallX = a1.ballX
    a1.previousBallY = a1.ballY
    a1.previousPlayerY = a1.playerY
    a1.previousBotY = a1.botY
    if a1.dead then
        a1.ballX = a1.ballX + (a1.ballVelocityX * a2)
        a1.ballY = a1.ballY + (a1.ballVelocityY * a2)
        return nil
    end
    a1:updatePlayerPaddle(a2)
    a1:updateBotPaddle(a2)
    if a1.serveTimer <= 0 then
        a1:advanceBall(a2)
    else
        a1.serveTimer = a1.serveTimer - a2
        if a1.serveTimer <= 0 then
            a1:launchServe()
        end
        return nil
    end
end
u28.render = function(a1, a2)
    --[[
      name: render
      line: 424
    ]]
    a1:draw()
end
u28.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 427
    ]]
    a1:draw()
end
u28.draw = function(a1)
    --[[
      name: draw
      line: 430
      upvalues:
        lerp_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
        u7 (copy, index: 3)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    a1:place(a1.ball, lerp_upv_1(a1.previousBallX, a1.ballX, renderAlpha_1), lerp_upv_1(a1.previousBallY, a1.ballY, renderAlpha_1), 1)
    a1:place(a1.playerPaddle, u6, lerp_upv_1(a1.previousPlayerY, a1.playerY, renderAlpha_1), 0.5)
    a1:place(a1.botPaddle, u7, lerp_upv_1(a1.previousBotY, a1.botY, renderAlpha_1), 0.5)
    if a1.ballSkin ~= nil then
        a1:poseSkin(a1.ballSkin, a1.ball)
    end
    if a1.playerSkin ~= nil then
        a1:poseSkin(a1.playerSkin, a1.playerPaddle)
    end
    if a1.botSkin == nil then
        return
    end
    a1:poseSkin(a1.botSkin, a1.botPaddle)
end
u28.poseSkin = function(a1, a2, a3)
    --[[
      name: poseSkin
      line: 447
      upvalues:
        translateModel_upv_1 (copy, index: 1)
    ]]
    translateModel_upv_1(a2.model, a3.Position - a2.ref.Position)
end
u28.updatePlayerPaddle = function(a1, a2)
    --[[
      name: updatePlayerPaddle
      line: 453
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
        PONG_CONFIG_upv_1 (copy, index: 3)
        lerp_upv_1 (copy, index: 4)
        u13 (copy, index: 5)
        u12 (copy, index: 6)
    ]]
    local v20 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Up) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.W))
    local v21 = UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Down) or (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.S))
    local v22 = (v20 and 1) or 0
    v22 = math.clamp((v22 - ((v21 and 1) or 0)) + gamepadInput_upv_1:moveY(), -1, 1)
    if v22 == 0 then
        local pointerTargetY_1 = a1.pointerTargetY
        if pointerTargetY_1 ~= nil then
            a1.playerY = lerp_upv_1(a1.playerY, pointerTargetY_1, math.min(PONG_CONFIG_upv_1.pointerFollowRate * a2, 1))
        end
    else
        a1.pointerTargetY = nil
        a1.playerY = a1.playerY + ((v22 * PONG_CONFIG_upv_1.paddleSpeed) * a2)
    end
    a1.playerY = math.clamp(a1.playerY, u13, u12)
end
u28.updateBotPaddle = function(a1, a2)
    --[[
      name: updateBotPaddle
      line: 474
      upvalues:
        PONG_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
        u13 (copy, index: 3)
        u12 (copy, index: 4)
    ]]
    local v23 = false
    if a1.ballVelocityX > 0 then
        v23 = a1.serveTimer <= 0
    end
    local v24
    if v23 then
        v24 = a1.ballY + a1.botAimOffset
    else
        v24 = 0
    end
    local v25 = PONG_CONFIG_upv_1.paddleSpeed * lerp_upv_1(PONG_CONFIG_upv_1.botSpeedFractionStart, PONG_CONFIG_upv_1.botSpeedFractionMax, math.min(a1.score / PONG_CONFIG_upv_1.botRampRallies, 1)) * a2
    a1.botY = math.clamp(a1.botY + math.clamp(v24 - a1.botY, -v25, v25), u13, u12)
end
u28.beginServe = function(a1)
    --[[
      name: beginServe
      line: 487
      upvalues:
        PONG_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.serveTimer = PONG_CONFIG_upv_1.serveDelaySeconds
    a1.currentRally = 0
    a1:setTrail(false)
    a1.ballX = 0
    a1.ballY = 0
    a1.ballVelocityX = 0
    a1.ballVelocityY = 0
    a1.previousBallX = 0
    a1.previousBallY = 0
end
u28.launchServe = function(a1)
    --[[
      name: launchServe
      line: 500
      upvalues:
        PONG_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.serveTimer = 0
    local v26 = ((a1.serveRandom:NextNumber() * 2) - 1) * PONG_CONFIG_upv_1.serveAngleMaxRadians
    local v27 = a1:speedForContacts(a1.contacts)
    a1.ballSpeed = v27
    a1.ballVelocityX = -math.cos(v26) * v27
    a1.ballVelocityY = math.sin(v26) * v27
    a1:setTrail(true)
    a1.context.audio.play("scorePing", {})
end
u28.advanceBall = function(a1, a2)
    --[[
      name: advanceBall
      line: 514
      upvalues:
        u10 (copy, index: 1)
        u11 (copy, index: 2)
        u4 (copy, index: 3)
        u8 (copy, index: 4)
        u15 (copy, index: 5)
        u9 (copy, index: 6)
        u2 (copy, index: 7)
    ]]
    local v28 = a1.ballX + a1.ballVelocityX * a2
    local v29 = a1.ballY + a1.ballVelocityY * a2
    if u10 >= v29 then
        if v29 < u11 then
            v29 = u11 + (u11 - v29)
            a1.ballVelocityY = math.abs(a1.ballVelocityY)
            a1:burstAt(v28, u11, a1.hitBurst, 3)
            a1.context.audio.play("pop", {})
        end
    else
        v29 = u10 - (v29 - u10)
        a1.ballVelocityY = -math.abs(a1.ballVelocityY)
        a1:burstAt(v28, u10, a1.hitBurst, 3)
        a1.context.audio.play("pop", {})
    end
    local v30, v31 = nil, nil
    if a1.ballVelocityX >= 0 then
        local v32, v33 = nil, nil
        if a1.ballVelocityX > 0 then
            v32 = a1.ballX + u4
            v33 = v28 + u4
            if v32 <= u9 and u9 < v33 then
                v31 = a1:crossingY(v32, v33, v29)
                if math.abs(v31 - a1.botY) <= u15 then
                    a1.ballX = u9 - u4
                    a1.ballY = v31
                    a1:returnBall(a1.botY, v31, false)
                    a1:burstAt(u9 - u4, v31, a1.hitBurst, 4)
                    a1.context.audio.play("thud", {})
                    return nil
                end
            end
        end
    else
        v30 = a1.ballX - u4
        local v34 = v28 - u4
        if u8 <= v30 and v34 < u8 then
            v31 = a1:crossingY(v30, v34, v29)
            if math.abs(v31 - a1.playerY) <= u15 then
                a1.ballX = u8 + u4
                a1.ballY = v31
                a1:returnBall(a1.playerY, v31, true)
                a1:burstAt(u8 + u4, v31, a1.hitBurst, 6)
                a1:onPlayerReturn()
                return nil
            end
        end
    end
    a1.ballX = v28
    a1.ballY = v29
    if a1.ballX >= -u2 then
        if u2 < a1.ballX then
            a1:onPointWon()
        end
    else
        a1:die()
    end
end
u28.crossingY = function(a1, a2, a3, a4)
    --[[
      name: crossingY
      line: 580
      upvalues:
        u8 (copy, index: 1)
        u9 (copy, index: 2)
        lerp_upv_1 (copy, index: 3)
    ]]
    local v35 = a2 - a3
    if math.abs(v35) >= 1e-06 then
        local v36
        if a1.ballVelocityX >= 0 then
            v36 = u9
        else
            v36 = u8
        end
        return lerp_upv_1(a1.ballY, a4, math.clamp((a2 - v36) / v35, 0, 1))
    end
    return a1.ballY
end
u28.returnBall = function(a1, a2, a3, a4)
    --[[
      name: returnBall
      line: 589
      upvalues:
        u5 (copy, index: 1)
        PONG_CONFIG_upv_1 (copy, index: 2)
        u14 (copy, index: 3)
    ]]
    local v37 = ((((math.clamp(math.floor((math.clamp((a3 - a2) / u5, -1, 1) + 1) / 2 * PONG_CONFIG_upv_1.paddleSegments), 0, PONG_CONFIG_upv_1.paddleSegments - 1) + 0.5) / PONG_CONFIG_upv_1.paddleSegments) * 2) - 1) / u14 * PONG_CONFIG_upv_1.maxBounceRadians
    a1.contacts = a1.contacts + 1
    local v38 = a1:speedForContacts(a1.contacts)
    a1.ballSpeed = v38
    local v39 = math.sin(v37) * v38
    local v40 = v38 * PONG_CONFIG_upv_1.minVerticalSpeedFraction
    if math.abs(v39) < v40 then
        if v39 < 0 then
            v39 = -v40
        else
            v39 = v40
        end
    end
    a1.ballVelocityX = (((a4 and 1) or -1) * math.cos(v37)) * v38
    a1.ballVelocityY = v39
end
u28.speedForContacts = function(a1, a2)
    --[[
      name: speedForContacts
      line: 608
      upvalues:
        PONG_CONFIG_upv_1 (copy, index: 1)
    ]]
    local ballSpeedBase_1 = PONG_CONFIG_upv_1.ballSpeedBase
    if PONG_CONFIG_upv_1.speedStepFirstHit <= a2 then
        ballSpeedBase_1 = ballSpeedBase_1 * PONG_CONFIG_upv_1.speedStepFactor
    end
    if PONG_CONFIG_upv_1.speedStepSecondHit <= a2 then
        ballSpeedBase_1 = ballSpeedBase_1 * PONG_CONFIG_upv_1.speedStepFactor
    end
    local v41 = a2 - PONG_CONFIG_upv_1.speedStepSecondHit
    if v41 > 0 then
        ballSpeedBase_1 = ballSpeedBase_1 * PONG_CONFIG_upv_1.rallySpeedGrowth ^ v41
    end
    return (math.min(ballSpeedBase_1, PONG_CONFIG_upv_1.ballSpeedMax))
end
u28.onPlayerReturn = function(a1)
    --[[
      name: onPlayerReturn
      line: 622
      upvalues:
        PONG_CONFIG_upv_1 (copy, index: 1)
        publishCombo_upv_1 (copy, index: 2)
        u24 (copy, index: 3)
        u6 (copy, index: 4)
        u21 (copy, index: 5)
    ]]
    a1.score = a1.score + 1
    a1.currentRally = a1.currentRally + 1
    if a1.bestRally < a1.currentRally then
        a1.bestRally = a1.currentRally
    end
    a1.context.reportScore(a1.score)
    a1.botAimOffset = a1.botRandom:NextNumber(-PONG_CONFIG_upv_1.botAimJitterStuds, PONG_CONFIG_upv_1.botAimJitterStuds)
    a1.context.audio.play("pop", {pitch = math.min(0.92 + (a1.currentRally * 0.02), 1.7)})
    a1:hitStop(0.02)
    if a1.currentRally % 5 ~= 0 then
        return
    end
    publishCombo_upv_1({count = a1.currentRally, color = u24})
    a1.popups:show(a1.stage.origin + Vector3.new(u6 + 6, a1.playerY + 4, 1), ("%*"):format(a1.currentRally), u21, 1)
end
u28.onPointWon = function(a1)
    --[[
      name: onPointWon
      line: 650
      upvalues:
        u2 (copy, index: 1)
        u7 (copy, index: 2)
        u22 (copy, index: 3)
    ]]
    a1.currentRally = 0
    a1.stage.shake(0.6)
    a1:burstAt(u2 - 2, a1.ballY, a1.pointBurst, 12)
    a1.context.audio.play("perfect", {})
    a1.popups:show(a1.stage.origin + Vector3.new(u7 - 8, a1.botY + 4, 1), "POINT!", u22, 1.2)
    a1:beginServe()
end
u28.die = function(a1)
    --[[
      name: die
      line: 664
      upvalues:
        u2 (copy, index: 1)
        u6 (copy, index: 2)
        u23 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    end
    a1.dead = true
    a1.stage.shake(1.4)
    a1:burstAt(-u2 + 2, a1.ballY, a1.missBurst, 14)
    a1.context.audio.play("buzz", {})
    a1.popups:show(a1.stage.origin + Vector3.new(u6 + 6, a1.playerY + 4, 1), "MISS!", u23, 1.2)
    a1.context.endRun(a1.score)
end
u28.makeBurst = function(a1, a2, a3, a4, a5)
    --[[
      name: makeBurst
      line: 687
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    local v42 = Instance.new("ParticleEmitter")
    v42.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v42.Rate = 0
    v42.Enabled = false
    v42.Lifetime = a5
    v42.Speed = NumberRange.new(a4 * 0.5, a4)
    v42.SpreadAngle = Vector2.new(180, 180)
    v42.Size = NumberSequence.new(0.42, 0.08)
    v42.Color = ColorSequence.new(a2, a3)
    v42.Transparency = NumberSequence.new(0.1, 1)
    v42.Rotation = NumberRange.new(0, 180)
    v42.RotSpeed = NumberRange.new(-120, 120)
    v42.LightEmission = 0
    v42.Parent = a1.fxAnchor
    return v42
end
u28.burstAt = function(a1, a2, a3, a4, a5)
    --[[
      name: burstAt
      line: 705
    ]]
    a1.fxAnchor.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2, a3, 1))
    a4:Emit(a5)
end
u28.setTrail = function(a1, a2)
    --[[
      name: setTrail
      line: 711
    ]]
    if a1.trailOn ~= a2 then
        a1.trailOn = a2
        a1.trail.Enabled = a2
    else
        return nil
    end
end
u28.worldYFromScreen = function(a1, a2)
    --[[
      name: worldYFromScreen
      line: 718
    ]]
    return (0.5 - (a2 / math.max(a1.stage.camera.ViewportSize.Y, 1))) * a1.stage.getVisibleHeight()
end
u28.kitOn = function(a1)
    --[[
      name: kitOn
      line: 722
    ]]
    return a1.assets.available
end
u28.kitModel = function(a1, a2, a3)
    --[[
      name: kitModel
      line: 725
    ]]
    if a1:kitOn() then
        return a1.assets:model(a2, a3)
    end
    return nil
end
u28.makePaddleSkin = function(a1, a2, a3, a4)
    --[[
      name: makePaddleSkin
      line: 731
      upvalues:
        u26 (copy, index: 1)
    ]]
    local v43 = a1:kitModel(a2, a3)
    local v44 = nil
    if v43 ~= nil then
        v44 = v43.PrimaryPart
        if v44 == nil or (v44.Size - u26).Magnitude > 0.01 then
            v44 = nil
            for _, value_2 in v43:GetDescendants() do
                if value_2:IsA("BasePart") then
                    if (value_2.Size - u26).Magnitude > 0.01 then
                        break
                    else
                        v44 = value_2
                    end
                else
                    continue
                end
            end
        end
        if v44 ~= nil then
            a4.Transparency = 1
            local tbl_5 = {}
            tbl_5.model = v43
            tbl_5.ref = v44
            return tbl_5
        end
        warn((("[pong] %* kit has no PADDLE_SIZE face part \226\128\148 procedural paddle"):format(a2)))
        v43:Destroy()
    end
    return nil
end
u28.proceduralWall = function(a1, a2)
    --[[
      name: proceduralWall
      line: 757
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u19 (copy, index: 2)
    ]]
    local v45 = makeStagePart_upv_1(a2)
    v45.Color = u19
    return v45
end
u28.proceduralPaddle = function(a1, a2, a3)
    --[[
      name: proceduralPaddle
      line: 762
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v46 = makeStagePart_upv_1(a2)
    v46.Color = a3
    return v46
end
u28.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 767
      upvalues:
        readLightingFolderProfile_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 3)
    ]]
    local lighting_1 = a1.assets.lighting
    if a1:kitOn() and lighting_1 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(lighting_1, tbl_upv_1, DEFAULT_GAME_LIGHTING_upv_1))
    else
        return nil
    end
end
u28.place = function(a1, a2, a3, a4, a5)
    --[[
      name: place
      line: 774
    ]]
    a2.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a3, a4, a5))
end
u28.destroy = function(a1)
    --[[
      name: destroy
      line: 779
      upvalues:
        u1 (copy, index: 1)
        BaseWorldGame_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1:setTrail(false)
    a1.ball.CFrame = u1
    if a1.ballSkin ~= nil then
        a1:poseSkin(a1.ballSkin, a1.ball)
    end
    if a1.playerSkin ~= nil then
        a1:poseSkin(a1.playerSkin, a1.playerPaddle)
    end
    if a1.botSkin ~= nil then
        a1:poseSkin(a1.botSkin, a1.botPaddle)
    end
    BaseWorldGame_upv_1.destroy(a1)
end
local tbl_6 = {}
tbl_6.PongGame = u28
return tbl_6