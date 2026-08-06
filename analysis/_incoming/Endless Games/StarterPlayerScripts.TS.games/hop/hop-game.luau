-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local pausedAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").pausedAtom
local HOP_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "hop-config").HOP_CONFIG
local v2 = RuntimeLib_1.import(script, script.Parent, "hop-sim")
local beginHop_upv_1 = v2.beginHop
local clampToBand_upv_1 = v2.clampToBand
local commitLanding_upv_1 = v2.commitLanding
local effectiveTileX_upv_1 = v2.effectiveTileX
local evaluateLanding_upv_1 = v2.evaluateLanding
local hopProgress_upv_1 = v2.hopProgress
local rescueOntoTile_upv_1 = v2.rescueOntoTile
local seedFirstTile_upv_1 = v2.seedFirstTile
local solveArc_upv_1 = v2.solveArc
local spawnTile_upv_1 = v2.spawnTile
local stepFall_upv_1 = v2.stepFall
local stepHop_upv_1 = v2.stepHop
local u1 = CFrame.new(0, -1000, 0)
local ballRadiusStuds_upv_1 = HOP_CONFIG_upv_1.ballRadiusStuds
local v3 = math.rad(HOP_CONFIG_upv_1.pathPitchDegrees)
local u2 = math.sin(v3)
local u3 = math.cos(v3)
local u4 = CFrame.Angles(v3, 0, 0)
local u5 = u4 * CFrame.Angles(0, 0.7853981633974483, 0)
local u6 = HOP_CONFIG_upv_1.lookaheadTiles + 2 + 1
local u7 = Color3.fromRGB(247, 249, 252)
local _ = Color3.fromRGB(236, 241, 246)
local u8 = Color3.fromRGB(64, 208, 150)
local u9 = Color3.fromRGB(42, 158, 114)
local u10 = Color3.fromRGB(126, 230, 182)
local u11 = Color3.fromRGB(48, 54, 68)
local u12 = Color3.fromRGB(96, 118, 128)
local u13 = Color3.fromRGB(232, 62, 74)
local u14 = Color3.fromRGB(34, 38, 48)
local u15 = Color3.fromRGB(255, 255, 255)
local u16 = Color3.fromRGB(232, 62, 74)
local u17 = Color3.fromRGB(255, 92, 80)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 194
    ]]
    return "HopGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u18 = setmetatable(tbl_1, tbl_2)
u18.__index = u18
u18.new = function(...)
    --[[
      name: new
      line: 200
      upvalues:
        u18 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u18)
    return v4:constructor(...) or v4
end
u18.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 204
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        HOP_CONFIG_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.ball = {}
    a1.arc = {tickCount = HOP_CONFIG_upv_1.minHopTicks}
    a1.run = {}
    a1.tiles = {}
    a1.spawnRequest = {}
    a1.progress = 0
    a1.renderPreviousX = 0
    a1.renderPreviousHeight = 0
    a1.renderPreviousProgress = 0
    a1.isGripping = false
    a1.gripPointerX = 0
    a1.gripAnchorTargetX = 0
    a1.squashRemaining = 0
    a1.gemSpinDegrees = 0
    a1.rippleAge = HOP_CONFIG_upv_1.rippleSeconds
    a1.rippleX = 0
    a1.rippleTileIndex = -1
    a1.rippleHalfWidth = 0
    a1.slabParts = {}
    a1.plateParts = {}
    a1.decalParts = {}
    a1.gemParts = {}
    a1.rippleBars = {}
    a1.framedHeight = -1
    local v5 = 0
    local v6 = false
    while true do
        if v6 then
            v5 = v5 + 1
        else
            v6 = true
        end
        if v5 >= u6 then
            break
        end
        table.insert(a1.tiles, {})
    end
end
u18.buildScene = function(a1)
    --[[
      name: buildScene
      line: 280
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u7 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 6)
        PopupTextPool_upv_1 (copy, index: 7)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(HOP_CONFIG_upv_1.frameWidthFloorStuds)
    a1:applyFraming()
    local v7 = makeFrontalBackdrop_upv_1(a1.stage, u7, Enum.Material.SmoothPlastic)
    v7.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, 0, -74))
    a1:buildTiles(container_1)
    a1:buildBall(container_1)
    a1:buildRipple(container_1)
    a1.gemBurstAnchor = makeSmoothPart_upv_1(container_1)
    a1.gemBurstAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.gemBurstAnchor.Transparency = 1
    a1.gemBurstAnchor.CFrame = u1
    a1.gemBurst = Instance.new("ParticleEmitter")
    a1.gemBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.gemBurst.Rate = 0
    a1.gemBurst.Lifetime = NumberRange.new(0.3, 0.55)
    a1.gemBurst.Speed = NumberRange.new(5, 12)
    a1.gemBurst.SpreadAngle = Vector2.new(180, 180)
    a1.gemBurst.Acceleration = Vector3.new(0, -28, 0)
    a1.gemBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.34), NumberSequenceKeypoint.new(1, 0.06)})
    local tbl_3 = {ColorSequenceKeypoint.new(0, Color3.fromRGB(240, 72, 72)), ColorSequenceKeypoint.new(0.35, Color3.fromRGB(250, 200, 64)), ColorSequenceKeypoint.new(0.7, Color3.fromRGB(88, 214, 128)), ColorSequenceKeypoint.new(1, Color3.fromRGB(84, 156, 244))}
    a1.gemBurst.Color = ColorSequence.new(tbl_3)
    a1.gemBurst.Parent = a1.gemBurstAnchor
    a1.popups = PopupTextPool_upv_1.new(container_1, 5)
    a1:connectInput()
end
u18.buildTiles = function(a1, a2)
    --[[
      name: buildTiles
      line: 328
      upvalues:
        u6 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u9 (copy, index: 3)
        u1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u8 (copy, index: 6)
        u10 (copy, index: 7)
        u13 (copy, index: 8)
    ]]
    local v8 = 0
    local v9 = false
    while true do
        if v9 then
            v8 = v8 + 1
        else
            v9 = true
        end
        if v8 >= u6 then
            break
        end
        local v10 = makeStagePart_upv_1(a2)
        v10.Color = u9
        v10.CFrame = u1
        table.insert(a1.slabParts, v10)
        local v11 = makeSmoothPart_upv_1(a2)
        v11.Color = u8
        v11.CFrame = u1
        table.insert(a1.plateParts, v11)
        local v12 = makeSmoothPart_upv_1(a2)
        v12.Color = u10
        v12.CFrame = u1
        table.insert(a1.decalParts, v12)
        local v13 = makeSmoothPart_upv_1(a2)
        v13.Size = Vector3.new(0.4399999976158142, 0.4399999976158142, 0.4399999976158142)
        v13.Color = u13
        v13.CFrame = u1
        table.insert(a1.gemParts, v13)
    end
end
u18.buildBall = function(a1, a2)
    --[[
      name: buildBall
      line: 366
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        ballRadiusStuds_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
        u1 (copy, index: 4)
        makeEllipsoidPart_upv_1 (copy, index: 5)
        u12 (copy, index: 6)
    ]]
    a1.ballPart = makeSmoothPart_upv_1(a2)
    a1.ballPart.Shape = Enum.PartType.Ball
    a1.ballPart.Size = Vector3.new(ballRadiusStuds_upv_1 * 2, ballRadiusStuds_upv_1 * 2, ballRadiusStuds_upv_1 * 2)
    a1.ballPart.Color = u11
    a1.ballPart.CFrame = u1
    a1.shadowPart = makeEllipsoidPart_upv_1(a2)
    a1.shadowPart.Color = u12
    a1.shadowPart.CFrame = u1
    a1.shadowPart.Transparency = 1
end
u18.buildRipple = function(a1, a2)
    --[[
      name: buildRipple
      line: 382
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u14 (copy, index: 3)
        u15 (copy, index: 4)
        u1 (copy, index: 5)
    ]]
    for n_1 = 0, HOP_CONFIG_upv_1.rippleRings - 1 do
        local v14 = nil
        for _ = 0, 3 do
            local v15
            v15 = makeSmoothPart_upv_1(a2)
            if n_1 % 2 ~= 0 then
                v14 = u15
            else
                v14 = u14
            end
            v15.Color = v14
            v15.CFrame = u1
            v15.Transparency = 1
            table.insert(a1.rippleBars, v15)
        end
    end
end
u18.applyFraming = function(a1)
    --[[
      name: applyFraming
      line: 394
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v16 = a1.stage.getVisibleHeight()
    if math.abs(v16 - a1.framedHeight) >= 0.01 then
        a1.framedHeight = v16
        a1.stage.setFrameCenter(Vector2.new(0, (HOP_CONFIG_upv_1.tilePlaneScreenDrop - 0.5) * v16))
    else
        return nil
    end
end
u18.scenePosition = function(a1, a2, a3, a4)
    --[[
      name: scenePosition
      line: 402
      upvalues:
        u3 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    return a1.stage.origin + Vector3.new(a2, (a3 * u3) + (a4 * u2), (a3 * u2) - (a4 * u3))
end
u18.connectInput = function(a1)
    --[[
      name: connectInput
      line: 407
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        subscribe_upv_1 (copy, index: 2)
    ]]
    local input_1 = a1.context.input
    a1.context.janitor:Add(
        input_1.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 409
                  upvalues:
                    pausedAtom_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                if a3 ~= "key" and not (pausedAtom_upv_1()) then
                    a1.isGripping = true
                    a1.gripPointerX = a2.X
                    a1.gripAnchorTargetX = a1.ball.targetX
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
                  line: 419
                  upvalues:
                    a1 (copy, index: 1)
                    pausedAtom_upv_1 (copy, index: 2)
                ]]
                if a1.isGripping and not (pausedAtom_upv_1()) then
                    a1:steerToPointer(a5.X)
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
                  line: 425
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a8 ~= "key" then
                    a1:releaseGrip()
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function()
                --[[
                  line: 437
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:releaseGrip()
            end
        )
    )
end
u18.steerToPointer = function(a1, a2)
    --[[
      name: steerToPointer
      line: 441
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        clampToBand_upv_1 (copy, index: 2)
        HOP_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.ball.targetX = clampToBand_upv_1(a1.gripAnchorTargetX + (((a2 - a1.gripPointerX) / math.max(a1.stage.camera.ViewportSize.X, 1)) * HOP_CONFIG_upv_1.dragStudsPerScreenWidth), HOP_CONFIG_upv_1)
end
u18.releaseGrip = function(a1)
    --[[
      name: releaseGrip
      line: 446
    ]]
    a1.isGripping = false
end
u18.pollGamepad = function(a1, a2)
    --[[
      name: pollGamepad
      line: 449
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        clampToBand_upv_1 (copy, index: 2)
        HOP_CONFIG_upv_1 (copy, index: 3)
        HOP_CONFIG_upv_1 (copy, index: 4)
    ]]
    local v17 = gamepadInput_upv_1:moveX()
    if v17 ~= 0 then
        a1.ball.targetX = clampToBand_upv_1(a1.ball.targetX + ((v17 * HOP_CONFIG_upv_1.maxLateralSpeed) * a2), HOP_CONFIG_upv_1)
    else
        return nil
    end
end
u18.resetRound = function(a1)
    --[[
      name: resetRound
      line: 456
      upvalues:
        seedFirstTile_upv_1 (copy, index: 1)
        HOP_CONFIG_upv_1 (copy, index: 2)
        HOP_CONFIG_upv_1 (copy, index: 3)
        solveArc_upv_1 (copy, index: 4)
        beginHop_upv_1 (copy, index: 5)
    ]]
    a1.run.seed = a1.context.getRunSeed()
    a1.run.tileIndex = 0
    a1.run.globalTick = 0
    a1.run.score = 0
    a1.run.gems = 0
    a1.run.isAlive = true
    for _, value_1 in a1.tiles do
        value_1.index = -1
    end
    seedFirstTile_upv_1(a1.tiles[1], HOP_CONFIG_upv_1)
    a1:sizeTileParts(0, a1.tiles[1])
    for n_2 = 1, HOP_CONFIG_upv_1.lookaheadTiles do
        a1:generateTile(n_2)
    end
    solveArc_upv_1(a1.arc, 0, HOP_CONFIG_upv_1)
    a1.ball.x = 0
    a1.ball.targetX = 0
    beginHop_upv_1(a1.ball, a1.arc)
    a1:syncProgress()
    a1:snapRenderHistory()
    a1:releaseGrip()
    a1.squashRemaining = 0
    a1.rippleAge = HOP_CONFIG_upv_1.rippleSeconds
    a1.rippleTileIndex = -1
    a1.popups:hideAll()
    a1.context.reportScore(0)
end
u18.revive = function(a1)
    --[[
      name: revive
      line: 489
      upvalues:
        rescueOntoTile_upv_1 (copy, index: 1)
    ]]
    local v18 = a1:tileAt(a1.run.tileIndex + 1)
    if v18 ~= nil then
        a1.run.isAlive = true
        a1:releaseGrip()
        rescueOntoTile_upv_1(a1.ball, v18, a1.run)
        a1:landOnTile(v18)
        a1:syncProgress()
        a1:snapRenderHistory()
        a1:setRunning(true)
    else
        return nil
    end
end
u18.captureRound = function(a1)
    --[[
      name: captureRound
      line: 509
    ]]
    return nil
end
u18.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 512
    ]]
    return false
end
u18.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 515
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        stepFall_upv_1 (copy, index: 2)
        stepHop_upv_1 (copy, index: 3)
        HOP_CONFIG_upv_1 (copy, index: 4)
    ]]
    a1:pollGamepad(a2)
    if a1.squashRemaining > 0 then
        a1.squashRemaining = math.max(a1.squashRemaining - a2, 0)
    end
    if a1.rippleAge < HOP_CONFIG_upv_1.rippleSeconds then
        a1.rippleAge = a1.rippleAge + a2
    end
    a1.gemSpinDegrees = (a1.gemSpinDegrees + (HOP_CONFIG_upv_1.gemSpinDegreesPerSecond * a2)) % 360
    a1.renderPreviousX = a1.ball.x
    a1.renderPreviousHeight = a1.ball.y
    a1.renderPreviousProgress = a1.progress
    if a1.run.isAlive then
        if stepHop_upv_1(a1.ball, a1.arc, a1.run, HOP_CONFIG_upv_1, a2) then
            a1:resolveLanding()
        end
        a1:syncProgress()
    else
        if a1.ball.y > -600 then
            stepFall_upv_1(a1.ball, a1.arc, a1.run, a2)
            a1:syncProgress()
        end
        return nil
    end
end
u18.syncProgress = function(a1)
    --[[
      name: syncProgress
      line: 546
      upvalues:
        hopProgress_upv_1 (copy, index: 1)
    ]]
    a1.progress = a1.run.tileIndex + hopProgress_upv_1(a1.ball, a1.arc)
end
u18.snapRenderHistory = function(a1)
    --[[
      name: snapRenderHistory
      line: 549
    ]]
    a1.renderPreviousX = a1.ball.x
    a1.renderPreviousHeight = a1.ball.y
    a1.renderPreviousProgress = a1.progress
end
u18.resolveLanding = function(a1)
    --[[
      name: resolveLanding
      line: 554
      upvalues:
        evaluateLanding_upv_1 (copy, index: 1)
        HOP_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v19 = a1:tileAt(a1.run.tileIndex + 1)
    if v19 ~= nil and evaluateLanding_upv_1(a1.ball, v19, a1.run, HOP_CONFIG_upv_1) then
        a1:landOnTile(v19)
    else
        a1:missTile()
        return nil
    end
end
u18.landOnTile = function(a1, a2)
    --[[
      name: landOnTile
      line: 566
      upvalues:
        commitLanding_upv_1 (copy, index: 1)
        HOP_CONFIG_upv_1 (copy, index: 2)
        HOP_CONFIG_upv_1 (copy, index: 3)
        solveArc_upv_1 (copy, index: 4)
        beginHop_upv_1 (copy, index: 5)
        effectiveTileX_upv_1 (copy, index: 6)
    ]]
    local v20 = commitLanding_upv_1(a1.ball, a2, a1.run, HOP_CONFIG_upv_1)
    a1.context.reportScore(a1.run.score)
    if v20 then
        a1:collectGem(a2)
    end
    a1:generateTile(a1.run.tileIndex + HOP_CONFIG_upv_1.lookaheadTiles)
    solveArc_upv_1(a1.arc, a1.run.score, HOP_CONFIG_upv_1)
    beginHop_upv_1(a1.ball, a1.arc)
    a1.rippleAge = 0
    a1.rippleTileIndex = a2.index
    a1.rippleX = effectiveTileX_upv_1(a2, a1.run.globalTick)
    a1.rippleHalfWidth = a2.halfWidth
    a1.squashRemaining = HOP_CONFIG_upv_1.landingSquashSeconds
    a1.context.audio.play("hopStep", {pitch = 1 + ((a1.run.score % 8) * 0.045)})
end
u18.collectGem = function(a1, a2)
    --[[
      name: collectGem
      line: 589
      upvalues:
        effectiveTileX_upv_1 (copy, index: 1)
        HOP_CONFIG_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    a1.context.reportPickup(a1.run.gems)
    local v21 = a1:scenePosition(effectiveTileX_upv_1(a2, a1.run.globalTick) + a2.gemOffset, HOP_CONFIG_upv_1.gemHoverStuds, 0)
    a1.gemBurstAnchor.CFrame = CFrame.new(v21)
    a1.gemBurst:Emit(12)
    a1.popups:show(v21 + Vector3.new(0, 2.200000047683716, 0), "+1", u16, 0.7)
    a1.context.audio.play("zigzagCollect", {})
end
u18.missTile = function(a1)
    --[[
      name: missTile
      line: 606
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        ballRadiusStuds_upv_1 (copy, index: 2)
        u17 (copy, index: 3)
    ]]
    a1.run.isAlive = false
    a1.stage.shake(HOP_CONFIG_upv_1.missShake)
    a1.context.audio.play("zigzagFall", {})
    a1.popups:show(a1:scenePosition(a1.ball.x, a1.ball.y + ballRadiusStuds_upv_1, 0) + Vector3.new(0, 2.5999999046325684, 0), "MISSED!", u17, 1)
    a1.context.endRun(a1.run.score)
end
u18.tileAt = function(a1, a2)
    --[[
      name: tileAt
      line: 627
      upvalues:
        u6 (copy, index: 1)
    ]]
    local v22 = nil
    if a2 >= 0 then
        v22 = a1.tiles[(a2 % u6) + 1]
        if v22.index ~= a2 then
            return nil
        end
        return v22
    end
    return nil
end
u18.generateTile = function(a1, a2)
    --[[
      name: generateTile
      line: 634
      upvalues:
        u6 (copy, index: 1)
        spawnTile_upv_1 (copy, index: 2)
        HOP_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v23 = a1:tileAt(a2 - 1)
    if v23 ~= nil then
        local v24 = a1.tiles[(a2 % u6) + 1]
        a1.spawnRequest.seed = a1.run.seed
        a1.spawnRequest.tileIndex = a2
        a1.spawnRequest.previousX = v23.x
        a1.spawnRequest.isPreviousMoving = v23.isMoving
        spawnTile_upv_1(v24, a1.spawnRequest, HOP_CONFIG_upv_1)
        a1:sizeTileParts(a2 % u6, v24)
    else
        return nil
    end
end
u18.sizeTileParts = function(a1, a2, a3)
    --[[
      name: sizeTileParts
      line: 647
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v25 = a3.halfWidth * 2
    a1.slabParts[a2 + 1].Size = Vector3.new(v25, v25 * HOP_CONFIG_upv_1.tileThicknessFraction, v25)
    a1.plateParts[a2 + 1].Size = Vector3.new(v25 + 0.14, 0.1, v25 + 0.14)
    a1.decalParts[a2 + 1].Size = Vector3.new(v25 * 0.32, 0.06, v25 * 0.32)
end
u18.render = function(a1)
    --[[
      name: render
      line: 655
    ]]
    a1:draw()
end
u18.onIdle = function(a1)
    --[[
      name: onIdle
      line: 658
    ]]
    a1:draw()
end
u18.draw = function(a1)
    --[[
      name: draw
      line: 661
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    a1:applyFraming()
    local renderAlpha_1 = a1.renderAlpha
    local v26 = lerp_upv_1(a1.renderPreviousX, a1.ball.x, renderAlpha_1)
    local v27 = lerp_upv_1(a1.renderPreviousHeight, a1.ball.y, renderAlpha_1)
    local v28 = lerp_upv_1(a1.renderPreviousProgress, a1.progress, renderAlpha_1)
    a1:drawBall(v26, v27)
    a1:drawTiles(v28, renderAlpha_1)
    a1:drawShadow(v26, v27, v28)
    a1:drawRipple(v28)
end
u18.drawBall = function(a1, a2, a3)
    --[[
      name: drawBall
      line: 672
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
        ballRadiusStuds_upv_1 (copy, index: 3)
    ]]
    local v29 = a1.squashRemaining / HOP_CONFIG_upv_1.landingSquashSeconds
    local v30 = lerp_upv_1(1, HOP_CONFIG_upv_1.landingSquash, v29 * v29)
    local v31 = 1 + (1 - v30) * 0.7
    a1.ballPart.Size = Vector3.new((ballRadiusStuds_upv_1 * 2) * v31, (ballRadiusStuds_upv_1 * 2) * v30, (ballRadiusStuds_upv_1 * 2) * v31)
    a1.ballPart.CFrame = CFrame.new(a1:scenePosition(a2, a3 + (ballRadiusStuds_upv_1 * v30), 0))
end
u18.drawTiles = function(a1, a2, a3)
    --[[
      name: drawTiles
      line: 682
      upvalues:
        u6 (copy, index: 1)
        HOP_CONFIG_upv_1 (copy, index: 2)
        lerp_upv_1 (copy, index: 3)
        effectiveTileX_upv_1 (copy, index: 4)
        u4 (copy, index: 5)
        u5 (copy, index: 6)
        u1 (copy, index: 7)
    ]]
    local v32 = 0
    local v33 = false
    if v33 then
        v32 = v32 + 1
    else
        v33 = true
    end
    local v34 = nil
    if v32 < u6 then
        v34 = a1.tiles[v32 + 1]
        local v35 = v34.index - a2
        if v34.index >= 0 and v35 >= -2 and HOP_CONFIG_upv_1.lookaheadTiles + 0.5 >= v35 then
            local v36
            if v34.isMoving then
                v36 = lerp_upv_1(effectiveTileX_upv_1(v34, a1.run.globalTick - 1), effectiveTileX_upv_1(v34, a1.run.globalTick), a3)
            else
                v36 = v34.x
            end
            local v37 = v35 * HOP_CONFIG_upv_1.tileSpacingStuds
            local v38 = math.max(math.clamp((v35 - 1.8) / 2.6, 0, 1) * 0.82, math.clamp((-v35 - 1.4) / 0.6, 0, 1))
            a1.slabParts[v32 + 1].CFrame = CFrame.new(a1:scenePosition(v36, -0.12000000000000001 - (((v34.halfWidth * 2) * HOP_CONFIG_upv_1.tileThicknessFraction) / 2), v37)) * u4
            a1.slabParts[v32 + 1].Transparency = v38
            a1.plateParts[v32 + 1].CFrame = CFrame.new(a1:scenePosition(v36, -0.05, v37)) * u4
            a1.plateParts[v32 + 1].Transparency = v38
            a1.decalParts[v32 + 1].CFrame = CFrame.new(a1:scenePosition(v36, 0.05, v37)) * u5
            a1.decalParts[v32 + 1].Transparency = v38
            local v39 = a1.gemParts[v32 + 1]
            if not (v34.hasGem) or v34.index <= a1.run.tileIndex then
                if v39.Transparency < 1 then
                    v39.Transparency = 1
                    v39.CFrame = u1
                end
            else
                local v40 = math.sin((a1.gemSpinDegrees / 180) * math.pi)
                v39.Transparency = v38
                v39.CFrame = CFrame.new(a1:scenePosition(v36 + v34.gemOffset, HOP_CONFIG_upv_1.gemHoverStuds + (v40 * HOP_CONFIG_upv_1.gemBobStuds), v37)) * u4 * CFrame.Angles(0.7853981633974483, math.rad(a1.gemSpinDegrees), 0)
            end
        else
            a1:parkTile(v32)
        end
        if v33 then
            v32 = v32 + 1
        else
            v33 = true
        end
    end
end
u18.parkTile = function(a1, a2)
    --[[
      name: parkTile
      line: 736
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.slabParts[a2 + 1].Transparency < 1 then
        a1.slabParts[a2 + 1].Transparency = 1
        a1.plateParts[a2 + 1].Transparency = 1
        a1.decalParts[a2 + 1].Transparency = 1
        a1.gemParts[a2 + 1].Transparency = 1
        a1.slabParts[a2 + 1].CFrame = u1
        a1.plateParts[a2 + 1].CFrame = u1
        a1.decalParts[a2 + 1].CFrame = u1
        a1.gemParts[a2 + 1].CFrame = u1
    else
        return nil
    end
end
u18.drawShadow = function(a1, a2, a3, a4)
    --[[
      name: drawShadow
      line: 749
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        effectiveTileX_upv_1 (copy, index: 2)
        ballRadiusStuds_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        lerp_upv_1 (copy, index: 5)
        u4 (copy, index: 6)
    ]]
    local v41 = math.floor(a4)
    local v42 = math.huge
    for n_3 = 0, 1 do
        local v43
        v43 = a1:tileAt(v41 + n_3)
        if v43 ~= nil and v43.halfWidth >= math.abs((v43.index - a4) * HOP_CONFIG_upv_1.tileSpacingStuds) then
            v42 = math.min(v42, math.abs(a2 - effectiveTileX_upv_1(v43, a1.run.globalTick)) - v43.halfWidth)
        end
    end
    local v44 = ((v42 == math.huge) and 0) or (math.clamp(1 - (v42 / ballRadiusStuds_upv_1), 0, 1))
    if v44 > 0 then
        local v45 = math.clamp(a3 / (HOP_CONFIG_upv_1.apexStuds * 1.2), 0, 1)
        local v46 = ballRadiusStuds_upv_1 * lerp_upv_1(1.5, 2.2, v45)
        a1.shadowPart.Size = Vector3.new(v46, 0.06, v46 * 0.92)
        a1.shadowPart.Transparency = 1 - (v44 * lerp_upv_1(0.55, 0.22, v45))
        a1.shadowPart.CFrame = CFrame.new(a1:scenePosition(a2, 0.2, 0)) * u4
    else
        if a1.shadowPart.Transparency < 1 then
            a1.shadowPart.Transparency = 1
            a1.shadowPart.CFrame = u1
        end
        return nil
    end
end
u18.drawRipple = function(a1, a2)
    --[[
      name: drawRipple
      line: 780
      upvalues:
        HOP_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    if HOP_CONFIG_upv_1.rippleSeconds > a1.rippleAge and a1.rippleTileIndex >= 0 then
        local v47 = (a1.rippleTileIndex - a2) * HOP_CONFIG_upv_1.tileSpacingStuds
        for n_4 = 0, HOP_CONFIG_upv_1.rippleRings - 1 do
            local v48 = n_4 * 0.22
            local v49 = math.clamp((a1.rippleAge / HOP_CONFIG_upv_1.rippleSeconds - v48) / math.max(1 - v48, 0.01), 0, 1)
            local v50 = a1.rippleHalfWidth + 0.35 + HOP_CONFIG_upv_1.rippleGrowthStuds * v49
            local v51 = ((v49 > 0) and (v49 * 0.9 + 0.1)) or 1
            for n_5 = 0, 3 do
                local v52
                v52 = a1.rippleBars[((n_4 * 4) + n_5) + 1]
                v52.Transparency = v51
                local v53
                if v51 >= 1 then
                    v52.CFrame = u1
                    continue
                end
                v53 = n_5 < 2
                local v54 = ((n_5 % 2 ~= 0) and -1) or 1
                local v55
                if v53 then
                    v55 = Vector3.new((v50 * 2) - 0.24, 0.05, 0.24)
                else
                    v55 = Vector3.new(0.24, 0.05, (v50 * 2) + 0.24)
                end
                v52.Size = v55
                v52.CFrame = CFrame.new(a1:scenePosition(a1.rippleX + ((v53 and 0) or (v54 * v50)), 0.12, v47 + ((v53 and (v54 * v50)) or 0))) * u4
            end
        end
    else
        for _, value_2 in a1.rippleBars do
            if value_2.Transparency < 1 then
                value_2.Transparency = 1
                value_2.CFrame = u1
            end
        end
        return nil
    end
end
local tbl_4 = {}
tbl_4.HopGame = u18
return tbl_4