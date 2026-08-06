-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local SpectateFollow_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow").SpectateFollow
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local FLAPPY_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "flappy-config").FLAPPY_CONFIG
local u1 = FLAPPY_CONFIG_upv_1.despawnX * 4
local u2 = CFrame.Angles(0, 0, -1.5707963267948966)
local u3 = Color3.fromRGB(122, 170, 40)
local u4 = Color3.fromRGB(199, 121, 76)
local tbl_upv_1 = {Color3.fromRGB(255, 204, 66), Color3.fromRGB(235, 94, 70), Color3.fromRGB(92, 168, 235)}
local u5 = Color3.fromRGB(250, 252, 255)
local u6 = Color3.fromRGB(196, 226, 218)
local u7 = Color3.fromRGB(140, 200, 95)
local u8 = Color3.fromRGB(28, 28, 32)
local u9 = CFrame.new(0, 0, 0.3)
local u10 = CFrame.Angles(0, 0, 0.7853981633974483)
local u11 = CFrame.Angles(0, 0, -0.7853981633974483)
local u12 = TweenInfo.new(FLAPPY_CONFIG_upv_1.deathFlashFadeSeconds, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 100
    ]]
    return "FlappyBirdGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u13 = setmetatable(tbl_2, tbl_3)
u13.__index = u13
u13.new = function(...)
    --[[
      name: new
      line: 106
      upvalues:
        u13 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u13)
    return v3:constructor(...) or v3
end
u13.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 110
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        FLAPPY_CONFIG_upv_1 (copy, index: 2)
        SpectateFollow_upv_1 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.wingModels = {}
    a1.birdPivotInverse = CFrame.identity
    a1.wingPhase = 0
    a1.idleClock = 0
    a1.deathVelocityY = 0
    a1.deathDriftX = 0
    a1.pipes = {}
    a1.groundTiles = {}
    a1.groundOffsets = {}
    a1.groundGrassHeight = 2
    a1.groundDirtHeight = 64
    a1.grassCenterY = FLAPPY_CONFIG_upv_1.groundY - 1
    a1.dirtCenterY = (FLAPPY_CONFIG_upv_1.groundY - 2) - 32
    a1.clouds = {}
    a1.cloudOffsets = {}
    a1.skyline = {}
    a1.skylineOffsets = {}
    a1.bushes = {}
    a1.bushOffsets = {}
    a1.eyes = {}
    a1.birdY = 0
    a1.birdVelocityY = 0
    a1.renderPrevBirdY = 0
    a1.tiltDegrees = 0
    a1.blinkTimer = 0
    a1.blinkRemaining = 0
    a1.score = 0
    a1.distanceSinceSpawn = 0
    a1.totalScrolled = 0
    a1.renderPrevScrolled = 0
    a1.invulnRemaining = 0
    a1.flapQueued = false
    a1.dead = false
    a1.variantRolled = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.generationRandom = Random.new()
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
end
u13.buildScene = function(a1)
    --[[
      name: buildScene
      line: 152
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        FLAPPY_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u5 (copy, index: 6)
        u6 (copy, index: 7)
        u7 (copy, index: 8)
    ]]
    local origin_upv_1 = a1.stage.origin
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(22.5)
    a1.bird = makeStagePart_upv_1(container_1)
    a1.bird.Size = Vector3.new(FLAPPY_CONFIG_upv_1.birdVisualSize, FLAPPY_CONFIG_upv_1.birdVisualSize, FLAPPY_CONFIG_upv_1.birdVisualSize)
    a1.bird.Color = tbl_upv_1[1]
    a1:adoptBirdModel(container_1)
    for _ = 0, FLAPPY_CONFIG_upv_1.pipePoolSize - 1 do
        table.insert(a1.pipes, {top = a1:cloneTube("TopTube", container_1), bottom = a1:cloneTube("BottomTube", container_1), x = u1})
    end
    for n_1 = 0, 2 do
        table.insert(a1.groundTiles, (a1:makeGroundTile(container_1)))
        table.insert(a1.groundOffsets, (n_1 * 90) + -90)
    end
    for n_2 = 0, 3 do
        local v4 = makeSmoothPart_upv_1(container_1)
        v4.Size = Vector3.new(9, 3.200000047683716, 1)
        v4.Color = u5
        local v5 = makeSmoothPart_upv_1(container_1)
        v5.Size = Vector3.new(5.5, 2.200000047683716, 1)
        v5.Color = u5
        table.insert(a1.clouds, {puffA = v4, puffB = v5})
        table.insert(a1.cloudOffsets, (n_2 * 68) + -102)
    end
    for n_3 = 0, 4 do
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Size = Vector3.new((((n_3 * 7) % 3) * 3) + 9, (((n_3 * 3) % 4) * 2.5) + 5, 1)
        v6.Color = u6
        table.insert(a1.skyline, v6)
        table.insert(a1.skylineOffsets, (n_3 * 60) + -120)
    end
    for n_4 = 0, 3 do
        local v7 = makeSmoothPart_upv_1(container_1)
        v7.Size = Vector3.new(((n_4 % 2) * 5) + 12, 2.6, 1)
        v7.Color = u7
        table.insert(a1.bushes, v7)
        table.insert(a1.bushOffsets, (n_4 * 68) + -90)
    end
    a1.deathFlash = makeSmoothPart_upv_1(container_1)
    a1.deathFlash.Material = Enum.Material.Neon
    a1.deathFlash.Color = Color3.fromRGB(255, 255, 255)
    a1.deathFlash.Size = Vector3.new(240, 120, 1)
    a1.deathFlash.Transparency = 1
    a1.deathFlash.CFrame = CFrame.new(origin_upv_1 + Vector3.new(0, 0, 12))
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 238
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_4 = {}
        tbl_4.scoreToStuds = function(a2)
            --[[
              name: scoreToStuds
              line: 249
              upvalues:
                FLAPPY_CONFIG_upv_1 (copy, index: 1)
            ]]
            return ((a2 * FLAPPY_CONFIG_upv_1.pipeSpacing) + (FLAPPY_CONFIG_upv_1.spawnX - FLAPPY_CONFIG_upv_1.birdX)) - (FLAPPY_CONFIG_upv_1.pipeSpacing / 2)
        end
        tbl_4.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 252
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.totalScrolled
        end
        tbl_4.poseMarker = function(a3)
            --[[
              name: poseMarker
              line: 255
              upvalues:
                FLAPPY_CONFIG_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                origin_upv_1 (copy, index: 3)
            ]]
            local v8 = FLAPPY_CONFIG_upv_1.birdX + (a3 - a1.totalScrolled)
            if FLAPPY_CONFIG_upv_1.spawnX + 4 >= v8 and v8 >= FLAPPY_CONFIG_upv_1.despawnX then
                return CFrame.new(origin_upv_1.X + v8, (origin_upv_1.Y + FLAPPY_CONFIG_upv_1.ceilingY) - 1, origin_upv_1.Z - 3)
            end
            return nil
        end
        registerRivalMarkers_1(tbl_4)
    end
end
u13.resetRound = function(a1)
    --[[
      name: resetRound
      line: 272
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        FLAPPY_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    if not (a1.variantRolled) or a1.dead then
        a1:rollRunVariant()
    end
    a1.birdY = 0
    a1.renderPrevBirdY = 0
    a1.birdVelocityY = FLAPPY_CONFIG_upv_1.flapVelocity * 0.6
    a1.tiltDegrees = 0
    a1.score = 0
    a1.invulnRemaining = 0
    a1.flapQueued = false
    a1.wingPhase = 0
    a1.idleClock = 0
    a1.deathVelocityY = 0
    a1.deathDriftX = 0
    a1.dead = false
    a1.spectating = false
    a1.roundToken = a1.roundToken + 1
    a1.blinkRemaining = 0
    a1.blinkTimer = a1.random:NextNumber(2.4, 5.5)
    a1:clearDeathFlash()
    a1.bird.Anchored = true
    a1:restoreEyes()
    for _, value_1 in a1.pipes do
        a1:parkPipe(value_1)
    end
    a1:prefillOpening()
    a1.context.reportScore(0)
end
u13.snapshot = function(a1)
    --[[
      name: snapshot
      line: 307
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tbl_5 = {}
    table.insert(tbl_5, a1.birdY)
    table.insert(tbl_5, a1.totalScrolled)
    local tbl_6 = {}
    local v9 = 0
    for _, value_2 in a1.pipes do
        if (value_2.active and (FLAPPY_CONFIG_upv_1.birdX - 6 < value_2.x)) == true then
            v9 = v9 + 1
            tbl_6[v9] = value_2
        end
    end
    table.sort(
        tbl_6,
        function(a2, a3)
            --[[
              line: 329
            ]]
            return a2.x < a3.x
        end
    )
    local tbl_7 = tbl_6[1]
    if tbl_7 ~= nil then
        table.insert(tbl_5, tbl_7.x - FLAPPY_CONFIG_upv_1.birdX)
        table.insert(tbl_5, tbl_7.gapCenterY)
        tbl_7 = tbl_6[2]
        if tbl_7 ~= nil then
            table.insert(tbl_5, tbl_7.x - FLAPPY_CONFIG_upv_1.birdX)
            table.insert(tbl_5, tbl_7.gapCenterY)
        end
    end
    tbl_7 = {}
    tbl_7.score = a1.score
    tbl_7.values = tbl_5
    return tbl_7
end
u13.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 350
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local function createBody_1()
            --[[
              name: createBody
              line: 357
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:createGhostBody()
        end
        local u14 = GhostPool_upv_1.new(a1.stage.container, {shape = Enum.PartType.Ball, createBody = createBody_1})
        a1.ghostPool = u14
        a1.context.janitor:Add(
            function()
                --[[
                  line: 362
                  upvalues:
                    u14 (copy, index: 1)
                ]]
                return u14:destroy()
            end
        )
    end
end
u13.createGhostBody = function(a1)
    --[[
      name: createGhostBody
      line: 367
      upvalues:
        u2 (copy, index: 1)
    ]]
    local birdModel_1 = a1.birdModel
    local v10 = nil
    if birdModel_1 ~= nil then
        local u15 = birdModel_1:Clone()
        u15.Name = "GhostBird"
        u15.Parent = a1.stage.container
        v10 = u15:FindFirstChildWhichIsA("BasePart", true)
        if v10 ~= nil then
            local v11 = u15:GetPivot()
            local tbl_upv_8 = {}
            local v12 = nil
            for _, value_3 in {"LeftWing", "RightWing"} do
                v12 = u15:FindFirstChild(value_3)
                if v12 == nil then
                    continue
                end
                if v12:IsA("Model") then
                    table.insert(tbl_upv_8, {model = v12, pivotLocal = v11:ToObjectSpace(v12:GetPivot())})
                end
            end
            local u16 = 0
            local tbl_9 = {}
            tbl_9.root = u15
            tbl_9.anchor = v10
            tbl_9.pose = function(a2, a3, a4)
                --[[
                  name: pose
                  line: 400
                  upvalues:
                    u2 (copy, index: 1)
                    u15 (copy, index: 2)
                    u16 (ref,  index: 3)
                    tbl_upv_8 (copy, index: 4)
                ]]
                local v13 = math.clamp(a3.Y * 0.06, -0.85, 0.5)
                local v14 = CFrame.new(a2) * CFrame.Angles(0, 0, v13) * u2
                u15:PivotTo(v14)
                local v15 = a3.Y > 1
                if v15 then
                    u16 = u16 + (a4 * 18)
                end
                local v16 = (v15 and (math.sin(u16) * 0.6108652381980153)) or 0
                for _, value_4 in tbl_upv_8 do
                    value_4.model:PivotTo((v14 * value_4.pivotLocal) * CFrame.Angles(v16 * 1, 0, 0))
                end
            end
            tbl_9.destroy = function()
                --[[
                  name: destroy
                  line: 422
                  upvalues:
                    u15 (copy, index: 1)
                ]]
                return u15:Destroy()
            end
            return tbl_9
        end
        u15:Destroy()
    end
    return nil
end
u13.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 427
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    local ghostPool_1 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_1 ~= nil and matchOpponents_1 ~= nil then
        local v17 = a1.stage.getFrameWidth() / 2 - 2
        local v18, v19 = nil, nil
        local v20 = nil
        local v21 = nil
        for _, value_5 in matchOpponents_1 do
            v20 = value_5.snapshot
            if v20 == nil then
                continue
            end
            v18 = v20.values[1]
            if v18 == nil then
                v18 = 0
            end
            v19 = v20.values[2]
            if v19 == nil then
                v19 = 0
            end
            v21 = FLAPPY_CONFIG_upv_1.birdX + (v19 - a1.totalScrolled)
            if v17 + 8 >= math.abs(v21) then
                ghostPool_1:show(value_5.userId, value_5.username, a1.stage.origin + Vector3.new(v21, math.clamp(v18, FLAPPY_CONFIG_upv_1.groundY - 1, FLAPPY_CONFIG_upv_1.ceilingY), -1.5), value_5.alive)
            end
        end
        ghostPool_1:step(a2)
    else
        return nil
    end
end
u13.captureRound = function(a1)
    --[[
      name: captureRound
      line: 462
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        local tbl_upv_10 = {}
        local v22 = 0
        for _, value_6 in a1.pipes do
            if value_6.active == true then
                v22 = v22 + 1
                tbl_upv_10[v22] = value_6
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 481
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_10 (copy, index: 2)
                ]]
                a2:int(a1.score):num(a1.birdY):num(a1.birdVelocityY):num(a1.tiltDegrees)
                a2:num(a1.distanceSinceSpawn):num(a1.totalScrolled):num(a1.invulnRemaining)
                a2:num(a1.wingPhase)
                a2:int(#tbl_upv_10)
                for _, value_7 in tbl_upv_10 do
                    a2:num(value_7.x):num(value_7.gapCenterY):bool(value_7.scored)
                end
            end
        )
    end
end
u13.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 491
      upvalues:
        readResume_upv_1 (copy, index: 1)
        FLAPPY_CONFIG_upv_1 (copy, index: 2)
        deriveRandom_upv_1 (copy, index: 3)
    ]]
    local v23 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 492
            ]]
            local tbl_11 = {}
            tbl_11.score = a3:int()
            tbl_11.birdY = a3:num()
            tbl_11.birdVelocityY = a3:num()
            tbl_11.tiltDegrees = a3:num()
            tbl_11.distanceSinceSpawn = a3:num()
            tbl_11.totalScrolled = a3:num()
            tbl_11.invulnRemaining = a3:num()
            tbl_11.wingPhase = a3:num()
            local v24 = a3:int()
            local tbl_12 = {}
            local v25 = 0
            local v26 = false
            v26, v25 = v26, v25
            while true do
                if v26 then
                    v25 = v25 + 1
                else
                    v26 = true
                end
                if v25 >= v24 then
                    break
                end
                table.insert(tbl_12, {x = a3:num(), gapCenterY = a3:num(), scored = a3:bool()})
            end
            v25 = table.clone(tbl_11)
            setmetatable(v25, nil)
            v25.pipes = tbl_12
            return v25
        end
    )
    if v23 ~= nil and #a1.pipes >= #v23.pipes then
        for _, value_8 in a1.pipes do
            a1:parkPipe(value_8)
        end
        a1.score = a2.score
        a1.birdY = math.clamp(v23.birdY, FLAPPY_CONFIG_upv_1.groundY, FLAPPY_CONFIG_upv_1.ceilingY)
        a1.renderPrevBirdY = a1.birdY
        a1.birdVelocityY = v23.birdVelocityY
        a1.tiltDegrees = v23.tiltDegrees
        a1.distanceSinceSpawn = v23.distanceSinceSpawn
        a1.totalScrolled = v23.totalScrolled
        a1.renderPrevScrolled = v23.totalScrolled
        a1.invulnRemaining = v23.invulnRemaining
        a1.wingPhase = v23.wingPhase
        a1.dead = false
        a1.flapQueued = false
        a1.roundToken = a1.roundToken + 1
        a1.bird.Anchored = true
        local v27 = nil
        for _, value_9 in v23.pipes do
            v27 = nil
            for v28, value_10 in a1.pipes do
                if not value_10.active then
                    v27 = value_10
                    break
                end
            end
            if v27 == nil then
                break
            else
                v27.active = true
                v27.x = value_9.x
                v27.gapCenterY = value_9.gapCenterY
                v27.scored = value_9.scored
            end
        end
        a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), math.floor(a1.totalScrolled) + 1)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u13.revive = function(a1)
    --[[
      name: revive
      line: 582
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.bird.Anchored = true
    a1.birdY = 0
    a1.birdVelocityY = 0
    a1.flapQueued = false
    a1.dead = false
    a1.roundToken = a1.roundToken + 1
    a1.invulnRemaining = FLAPPY_CONFIG_upv_1.reviveInvulnSeconds
    a1.blinkRemaining = 0
    a1.blinkTimer = a1.random:NextNumber(2.4, 5.5)
    a1:restoreEyes()
    a1:clearDeathFlash()
    for _, value_11 in a1.pipes do
        if not (value_11.active) or FLAPPY_CONFIG_upv_1.birdX - FLAPPY_CONFIG_upv_1.pipeWidth >= value_11.x or value_11.x >= FLAPPY_CONFIG_upv_1.birdX + FLAPPY_CONFIG_upv_1.reviveClearDistance then
            continue
        end
        if not (value_11.scored) then
            a1.totalScrolled = a1.totalScrolled - FLAPPY_CONFIG_upv_1.pipeSpacing
        end
        a1:parkPipe(value_11)
    end
    a1:setRunning(true)
end
u13.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 611
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevBirdY = a1.birdY
        a1.renderPrevScrolled = a1.totalScrolled
        if a1.flapQueued then
            a1.flapQueued = false
            a1.birdVelocityY = FLAPPY_CONFIG_upv_1.flapVelocity
            a1.tiltDegrees = FLAPPY_CONFIG_upv_1.flapTiltDegrees
            a1.context.audio.play("flap", {})
        end
        a1.birdVelocityY = math.max(a1.birdVelocityY + (FLAPPY_CONFIG_upv_1.gravity * a2), FLAPPY_CONFIG_upv_1.terminalVelocity)
        a1.birdY = a1.birdY + (a1.birdVelocityY * a2)
        if FLAPPY_CONFIG_upv_1.ceilingY < a1.birdY then
            a1.birdY = FLAPPY_CONFIG_upv_1.ceilingY
        end
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        a1:advanceWorld(FLAPPY_CONFIG_upv_1.scrollSpeed * a2)
        local v28 = a1.birdY + FLAPPY_CONFIG_upv_1.birdHitOffsetY
        for _, value_12 in a1.pipes do
            if not (value_12.active) then
                continue
            end
            if not (value_12.scored) and value_12.x < FLAPPY_CONFIG_upv_1.birdX then
                value_12.scored = true
                a1.score = a1.score + 1
                a1.context.reportScore(a1.score)
                a1.context.audio.play("flappyPoint", {})
            end
            if a1.invulnRemaining > 0 or math.abs(value_12.x - (FLAPPY_CONFIG_upv_1.birdX + FLAPPY_CONFIG_upv_1.birdHitOffsetX)) >= (FLAPPY_CONFIG_upv_1.pipeWidth / 2) + FLAPPY_CONFIG_upv_1.birdHitHalfWidth then
                continue
            end
            if value_12.gapCenterY + (FLAPPY_CONFIG_upv_1.gapHeight / 2) < v28 + FLAPPY_CONFIG_upv_1.birdHitHalfHeight or v28 - FLAPPY_CONFIG_upv_1.birdHitHalfHeight < value_12.gapCenterY - (FLAPPY_CONFIG_upv_1.gapHeight / 2) then
                a1:die()
                return nil
            end
        end
        if a1.invulnRemaining <= 0 and v28 - FLAPPY_CONFIG_upv_1.birdHitHalfHeight <= FLAPPY_CONFIG_upv_1.groundY then
            a1:die()
            return nil
        end
    end
end
u13.advanceWorld = function(a1, a2)
    --[[
      name: advanceWorld
      line: 672
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.totalScrolled = a1.totalScrolled + a2
    a1.distanceSinceSpawn = a1.distanceSinceSpawn + a2
    if FLAPPY_CONFIG_upv_1.pipeSpacing <= a1.distanceSinceSpawn then
        a1.distanceSinceSpawn = a1.distanceSinceSpawn - FLAPPY_CONFIG_upv_1.pipeSpacing
        a1:spawnPipe()
    end
    a1:scrollOffsets(a1.groundOffsets, a2, 270)
    a1:scrollOffsets(a1.cloudOffsets, a2 * 0.35, 272)
    a1:scrollOffsets(a1.skylineOffsets, a2 * 0.2, 300)
    a1:scrollOffsets(a1.bushOffsets, a2 * 0.6, 272)
    for _, value_13 in a1.pipes do
        if not (value_13.active) then
            continue
        end
        value_13.x = value_13.x - a2
        if value_13.x < FLAPPY_CONFIG_upv_1.despawnX then
            a1:parkPipe(value_13)
        end
    end
end
u13.render = function(a1, a2)
    --[[
      name: render
      line: 695
      upvalues:
        lerp_upv_1 (copy, index: 1)
        FLAPPY_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1:updateGhosts(a2)
    a1:updateBlink(a2)
    local renderAlpha_1 = a1.renderAlpha
    local v29
    if a1.dead then
        v29 = a1.birdY
    else
        v29 = lerp_upv_1(a1.renderPrevBirdY, a1.birdY, renderAlpha_1)
    end
    local v30 = ((a1.dead) and 0) or (a1.totalScrolled - lerp_upv_1(a1.renderPrevScrolled, a1.totalScrolled, renderAlpha_1))
    a1.tiltDegrees = math.max(a1.tiltDegrees - (FLAPPY_CONFIG_upv_1.tiltFallRate * a2), -90)
    a1.wingPhase = a1.wingPhase + (((a2 * math.pi) * 2) / FLAPPY_CONFIG_upv_1.wingLoopSeconds)
    local origin_2 = a1.stage.origin
    local v31 = ((a1.spectating) and Vector3.new(0, -400, 0)) or (Vector3.new(FLAPPY_CONFIG_upv_1.birdX, v29, 0))
    a1:poseBird(origin_2 + v31)
    for key_1, value_14 in a1.pipes do
        if value_14.active then
            local v32 = value_14.x + v30
            value_14.top:PivotTo(CFrame.new(origin_2 + Vector3.new(v32, (value_14.gapCenterY + (FLAPPY_CONFIG_upv_1.gapHeight / 2)) + 1.1838, 0)))
            value_14.bottom:PivotTo(CFrame.new(origin_2 + Vector3.new(v32, (value_14.gapCenterY - (FLAPPY_CONFIG_upv_1.gapHeight / 2)) - 1.2187, 0)))
        end
    end
    for n_5 = 0, #a1.groundTiles - 1 do
        local key_1 = a1.groundTiles[n_5 + 1]
        local v33 = a1.groundOffsets[n_5 + 1] + v30
        key_1.grass.CFrame = CFrame.new(origin_2 + Vector3.new(v33, a1.grassCenterY, 0))
        key_1.dirt.CFrame = CFrame.new(origin_2 + Vector3.new(v33, a1.dirtCenterY, 0))
    end
    for n_6 = 0, #a1.clouds - 1 do
        local key_1 = a1.clouds[n_6 + 1]
        local v34 = a1.cloudOffsets[n_6 + 1] + v30 * 0.35
        local v35 = (n_6 % 3) * 3 + 4
        key_1.puffA.CFrame = CFrame.new(origin_2 + Vector3.new(v34, v35, -22))
        key_1.puffB.CFrame = CFrame.new(origin_2 + Vector3.new(v34 + 4, v35 + 1.6, -22))
    end
    for n_7 = 0, #a1.skyline - 1 do
        local v36 = a1.skyline[n_7 + 1]
        v36.CFrame = CFrame.new(origin_2 + Vector3.new(a1.skylineOffsets[n_7 + 1] + (v30 * 0.2), FLAPPY_CONFIG_upv_1.groundY + (v36.Size.Y / 2), -26))
    end
    for n_8 = 0, #a1.bushes - 1 do
        a1.bushes[n_8 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(a1.bushOffsets[n_8 + 1] + (v30 * 0.6), FLAPPY_CONFIG_upv_1.groundY + 1.3, -6))
    end
end
u13.scrollOffsets = function(a1, a2, a3, a4)
    --[[
      name: scrollOffsets
      line: 756
    ]]
    for n_9 = 0, #a2 - 1 do
        local v37
        v37 = a2[n_9 + 1] - a3
        if v37 < -a4 / 2 then
            v37 = v37 + a4
        end
        a2[n_9 + 1] = v37
    end
end
u13.onPress = function(a1)
    --[[
      name: onPress
      line: 765
    ]]
    if (a1.dead) then
        return
    end
    a1.flapQueued = true
end
u13.poseBird = function(a1, a2)
    --[[
      name: poseBird
      line: 770
      upvalues:
        u2 (copy, index: 1)
        FLAPPY_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v38 = CFrame.new(a2) * CFrame.Angles(0, 0, math.rad(a1.tiltDegrees))
    local birdModel_2 = a1.birdModel
    if birdModel_2 ~= nil then
        local v39 = v38 * u2
        birdModel_2:PivotTo(v39)
        local v40 = (1 - math.cos(a1.wingPhase)) / 2 * math.rad(FLAPPY_CONFIG_upv_1.wingFlapDegrees)
        for _, value_15 in a1.wingModels do
            if v40 >= 0.001 then
                value_15.model:PivotTo(v39 * (a1.birdPivotInverse * (CFrame.new(value_15.worldPosition) * CFrame.fromOrientation(value_15.orientationX + (v40 * 1), value_15.orientationY, value_15.orientationZ))))
            else
                value_15.model:PivotTo(v39 * value_15.pivotLocal)
            end
        end
        a1:poseEyes(v39)
    else
        a1.bird.CFrame = v38
        return nil
    end
end
u13.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 802
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u13.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 808
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v41 = a1.spectate:value(1)
    if v41 ~= nil then
        a1:advanceWorld((math.clamp((FLAPPY_CONFIG_upv_1.scrollSpeed * a2) + ((v41 - a1.totalScrolled) * math.min(a2 * 6, 1)), 0, FLAPPY_CONFIG_upv_1.pipeSpacing * 0.5)))
    end
    a1.renderPrevScrolled = a1.totalScrolled
    a1:render(a2)
end
u13.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 819
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1:updateGhosts(a2)
    if a1.dead and a1.spectate:isActive() then
        a1.spectating = true
        a1:spectateStep(a2)
        return nil
    end
    if a1.dead then
        a1.deathVelocityY = math.max(a1.deathVelocityY + (FLAPPY_CONFIG_upv_1.gravity * a2), FLAPPY_CONFIG_upv_1.terminalVelocity)
        a1.birdY = math.max(a1.birdY + (a1.deathVelocityY * a2), FLAPPY_CONFIG_upv_1.groundY - 1)
        a1.deathDriftX = math.max(a1.deathDriftX - (4 * a2), -6)
        a1.tiltDegrees = math.max(a1.tiltDegrees - (600 * a2), -90)
        a1:poseBird(a1.stage.origin + Vector3.new(FLAPPY_CONFIG_upv_1.birdX + a1.deathDriftX, a1.birdY, 0))
    else
        a1.idleClock = a1.idleClock + a2
        a1.wingPhase = a1.wingPhase + (((a2 * math.pi) * 2) / FLAPPY_CONFIG_upv_1.wingLoopSeconds)
        a1:poseBird(a1.stage.origin + Vector3.new(FLAPPY_CONFIG_upv_1.birdX, a1.birdY + (math.sin(((a1.idleClock * math.pi) * 2) / FLAPPY_CONFIG_upv_1.idleBobPeriod) * FLAPPY_CONFIG_upv_1.idleBobStuds), 0))
        return nil
    end
end
u13.rollRunVariant = function(a1)
    --[[
      name: rollRunVariant
      line: 848
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    a1.variantRolled = true
    if a1.birdModel ~= nil then
        return
    end
    a1.bird.Color = tbl_upv_1[a1.random:NextInteger(0, #tbl_upv_1 - 1) + 1]
end
u13.adoptBirdModel = function(a1, a2)
    --[[
      name: adoptBirdModel
      line: 854
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local Bird_1 = a1:sceneryAssets()
    if Bird_1 ~= nil then
        Bird_1 = Bird_1:FindFirstChild("Bird")
    end
    if Bird_1 == nil then
        warn("[FlappyBird] missing scenery asset FlappyBird.Bird \226\128\148 using the classic cube")
        return nil
    else
        local v42 = nil
        if Bird_1:IsA("Model") then
            local v43 = Bird_1:Clone()
            for _, value_16 in v43:GetDescendants() do
                if value_16:IsA("BasePart") then
                    value_16.Anchored = true
                    value_16.CanCollide = false
                    value_16.CanQuery = false
                    value_16.CanTouch = false
                    value_16.CastShadow = false
                end
            end
            v43.Parent = a2
            v43:ScaleTo(FLAPPY_CONFIG_upv_1.birdModelScale)
            local v44 = v43:GetPivot()
            a1.birdPivotInverse = v44:Inverse()
            local v45 = nil
            for key_2, value_17 in {"LeftWing", "RightWing"} do
                v45 = v43:FindFirstChild(value_17)
                if v45 == nil then
                    continue
                end
                if v45:IsA("Model") then
                    local v46 = v45:GetPivot()
                    local v47, v48, v49 = v46:ToOrientation()
                    table.insert(a1.wingModels, {model = v45, pivotLocal = v44:ToObjectSpace(v46), worldPosition = v46.Position, orientationX = v47, orientationY = v48, orientationZ = v49})
                end
            end
            local v50 = math.huge
            local v51 = -math.huge
            local v52 = math.huge
            local key_2 = -math.huge
            local v50, v53, v52, key_2 = nil, nil, nil, nil
            v53 = v51
            local _ = nil
            local v62 = nil
            local v54 = nil
            local v55 = nil
            for v63, v42 in {"Body", "Head"} do
                v54 = v43:FindFirstChild(v42)
                if v54 == nil then
                    continue
                end
                for v64, value_18 in v54:GetDescendants() do
                    v55 = value_18:IsA("BasePart")
                    if v55 then
                        local Position_1 = (u2 * v44:ToObjectSpace(value_18.CFrame)).Position
                        local v56 = value_18.Size.Y / 2
                        local v57 = value_18.Size.X / 2
                        v50, v53, v52, key_2 = math.min(v50, Position_1.X - v56), math.max(v53, Position_1.X + v56), math.min(v52, Position_1.Y - v57), math.max(key_2, Position_1.Y + v57)
                    end
                end
            end
            if v50 < v53 then
                local v58 = (v53 - v50) / 2 * FLAPPY_CONFIG_upv_1.birdHitboxScale
                local v59 = (key_2 - v52) / 2 * FLAPPY_CONFIG_upv_1.birdHitboxScale
                local v60 = (v50 + v53) / 2
                local v61 = (v52 + key_2) / 2
                v42 = math.max(math.abs(v58 - FLAPPY_CONFIG_upv_1.birdHitHalfWidth), math.abs(v59 - FLAPPY_CONFIG_upv_1.birdHitHalfHeight), math.abs(v60 - FLAPPY_CONFIG_upv_1.birdHitOffsetX), math.abs(v61 - FLAPPY_CONFIG_upv_1.birdHitOffsetY))
                if v42 > 0.05 then
                    warn(("[FlappyBird] Bird model drifted from the baked hitbox (\206\148=%*): "):format(string.format("%.3f", v42)) .. ("measured halves %*\195\151%* "):format(string.format("%.4f", v58), string.format("%.4f", v59)) .. ("offsets %*, %* \226\128\148 "):format(string.format("%.4f", v60), string.format("%.4f", v61)) .. "re-bake birdHitHalf*/birdHitOffset* in flappy-config.ts (bot flies the baked values).")
                end
            end
            a1:captureEyes(v43, v44, a2)
            a1.bird.Transparency = 1
            a1.birdModel = v43
        else
            warn("[FlappyBird] missing scenery asset FlappyBird.Bird \226\128\148 using the classic cube")
            return nil
        end
    end
end
u13.captureEyes = function(a1, a2, a3, a4)
    --[[
      name: captureEyes
      line: 946
      upvalues:
        u2 (copy, index: 1)
    ]]
    for _, value_19 in a2:GetDescendants() do
        if not (value_19:IsA("BasePart")) then
            continue
        end
        if string.find(string.lower(value_19.Name), "eye", 1, true) ~= nil then
            local v62 = a3:ToObjectSpace(value_19.CFrame)
            table.insert(a1.eyes, {part = value_19, openTransparency = value_19.Transparency, localPose = v62, openSize = value_19.Size, squashAxis = a1:faceUpAxis(u2 * v62), blinkClone = a1:makeEyeClone(value_19, a4), xBars = a1:makeEyeX(value_19.Size, a4)})
        end
    end
    if #a1.eyes ~= 0 then
        return
    end
    warn("[FlappyBird] no eye part (name containing \"eye\") on the Bird model \226\128\148 blink/X-eyes disabled")
end
u13.faceUpAxis = function(a1, a2)
    --[[
      name: faceUpAxis
      line: 971
    ]]
    local v63 = math.abs(a2.RightVector.Y)
    local v64 = math.abs(a2.UpVector.Y)
    local v65 = math.abs(a2.LookVector.Y)
    if v64 <= v63 and v65 <= v63 then
        return 0
    elseif v65 > v64 then
        return 2
    else
        return 1
    end
end
u13.makeEyeClone = function(a1, a2, a3)
    --[[
      name: makeEyeClone
      line: 983
    ]]
    local v66 = a2:Clone()
    v66.Anchored = true
    v66.CanCollide = false
    v66.CanQuery = false
    v66.CanTouch = false
    v66.CastShadow = false
    v66.Transparency = 1
    v66.Parent = a3
    return v66
end
u13.makeEyeX = function(a1, a2, a3)
    --[[
      name: makeEyeX
      line: 994
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u8 (copy, index: 2)
    ]]
    local v67 = math.max(a2.X, a2.Y, a2.Z)
    local v68 = Vector3.new(v67 * 1.35, math.max(v67 * 0.22, 0.08), math.max(math.min(a2.X, a2.Y, a2.Z), 0.1))
    local v69 = makeSmoothPart_upv_1(a3)
    v69.Size = v68
    v69.Color = u8
    v69.Transparency = 1
    local v70 = makeSmoothPart_upv_1(a3)
    v70.Size = v68
    v70.Color = u8
    v70.Transparency = 1
    return {v69, v70}
end
u13.updateBlink = function(a1, a2)
    --[[
      name: updateBlink
      line: 1006
    ]]
    if #a1.eyes == 0 then
        return nil
    elseif a1.blinkRemaining <= 0 then
        a1.blinkTimer = a1.blinkTimer - a2
        if a1.blinkTimer <= 0 then
            a1.blinkRemaining = 0.14
            a1.blinkTimer = a1.random:NextNumber(2.4, 5.5)
        end
    else
        a1.blinkRemaining = math.max(a1.blinkRemaining - a2, 0)
        return nil
    end
end
u13.poseEyes = function(a1, a2)
    --[[
      name: poseEyes
      line: 1020
    ]]
    if #a1.eyes ~= 0 then
        local v71 = ((a1.blinkRemaining <= 0) and 1) or (1 - math.sin((1 - (a1.blinkRemaining / 0.14)) * math.pi) * 0.88)
        local v72 = not a1.dead and (v71 < 1)
        for _, value_20 in a1.eyes do
            if a1.dead then
                value_20.part.Transparency = 1
                value_20.blinkClone.Transparency = 1
                a1:poseEyeX(value_20, a2)
                continue
            end
            value_20.xBars[1].Transparency = 1
            value_20.xBars[2].Transparency = 1
            if v72 then
                value_20.part.Transparency = 1
                value_20.blinkClone.Transparency = value_20.openTransparency
                value_20.blinkClone.Size = a1:squashedSize(value_20, v71)
                value_20.blinkClone.CFrame = a2 * value_20.localPose
            else
                value_20.part.Transparency = value_20.openTransparency
                value_20.blinkClone.Transparency = 1
            end
        end
    else
        return nil
    end
end
u13.poseEyeX = function(a1, a2, a3)
    --[[
      name: poseEyeX
      line: 1049
      upvalues:
        u9 (copy, index: 1)
        u10 (copy, index: 2)
        u11 (copy, index: 3)
    ]]
    local v73 = CFrame.new((a3 * a2.localPose).Position) * a3.Rotation * u9
    a2.xBars[1].Transparency = 0
    a2.xBars[2].Transparency = 0
    a2.xBars[1].CFrame = v73 * u10
    a2.xBars[2].CFrame = v73 * u11
end
u13.squashedSize = function(a1, a2, a3)
    --[[
      name: squashedSize
      line: 1061
    ]]
    local openSize_1 = a2.openSize
    if a2.squashAxis ~= 0 then
        if a2.squashAxis ~= 1 then
            return (Vector3.new(openSize_1.X, openSize_1.Y, openSize_1.Z * a3))
        end
        return (Vector3.new(openSize_1.X, openSize_1.Y * a3, openSize_1.Z))
    end
    return (Vector3.new(openSize_1.X * a3, openSize_1.Y, openSize_1.Z))
end
u13.restoreEyes = function(a1)
    --[[
      name: restoreEyes
      line: 1071
    ]]
    for _, value_21 in a1.eyes do
        value_21.part.Transparency = value_21.openTransparency
        value_21.blinkClone.Transparency = 1
        value_21.xBars[1].Transparency = 1
        value_21.xBars[2].Transparency = 1
    end
end
u13.sceneryAssets = function(a1)
    --[[
      name: sceneryAssets
      line: 1079
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    return waitForSceneryRoot_upv_1("FlappyBird", "flappy-bird")
end
u13.cloneTube = function(a1, a2, a3)
    --[[
      name: cloneTube
      line: 1082
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
    ]]
    local v74 = a1:sceneryAssets()
    if v74 ~= nil then
        v74 = v74:FindFirstChild(a2)
    end
    if v74 ~= nil and v74:IsA("Model") then
        local v75 = v74:Clone()
        for _, value_22 in v75:GetDescendants() do
            if value_22:IsA("BasePart") then
                value_22.Anchored = true
                value_22.CanCollide = false
                value_22.CanQuery = false
                value_22.CanTouch = false
                value_22.CastShadow = false
            end
        end
        v75:ScaleTo(FLAPPY_CONFIG_upv_1.tubeModelScale)
        v75.Parent = a3
        return v75
    else
        warn((("[FlappyBird] missing scenery asset FlappyBird.%* \226\128\148 using the legacy pipe look"):format(a2)))
        local v76 = Instance.new("Model")
        v76.Parent = a3
        local v77 = makeStagePart_upv_1(v76)
        v77.Color = Color3.fromRGB(96, 190, 66)
        v77.Size = Vector3.new(FLAPPY_CONFIG_upv_1.pipeWidth, 130, 4)
        v77.CFrame = CFrame.new(0, (((a2 ~= "TopTube") and -1) or 1) * (65 - (((a2 ~= "TopTube") and 1.2187) or 1.1838)), 0)
        v76.WorldPivot = CFrame.new()
        return v76
    end
end
u13.makeGroundTile = function(a1, a2)
    --[[
      name: makeGroundTile
      line: 1121
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        u3 (copy, index: 4)
        u4 (copy, index: 5)
    ]]
    local Landtype1_1 = a1:sceneryAssets()
    if Landtype1_1 ~= nil then
        Landtype1_1 = Landtype1_1:FindFirstChild("Landtype1")
    end
    local v78 = nil
    if Landtype1_1 == nil then
        local v79 = Landtype1_1
    else
        local tbl_13 = {}
        v78 = 0
        local v80 = v78
        for v81, value_23 in Landtype1_1:GetChildren() do
            if value_23:IsA("Part") == true then
                v80 = v80 + 1
                tbl_13[v78] = value_23
            end
        end
        local v79 = tbl_13
    end
    local v79 = nil
    local v82
    if v79 ~= nil then
        v82 = v79
    else
        v82 = {}
        v82 = v82
    end
    table.sort(
        v82,
        function(a3, a4)
            --[[
              line: 1151
            ]]
            return a3.Size.X < a4.Size.X
        end
    )
    local v83 = v82[1]
    v78 = v82[2]
    if v83 == nil then
        local X_1 = v83
    else
        local X_1 = v83.Size.X
    end
    local X_1, v84
    if X_1 ~= nil then
        v84 = X_1
    else
        v84 = 2
    end
    a1.groundGrassHeight = v84
    local v85
    if v78 == nil then
        v85 = v78
    else
        v85 = v78.Size.X
    end
    local v81
    if v85 ~= nil then
        v81 = v85
    else
        v81 = 64
    end
    a1.groundDirtHeight = v81
    a1.grassCenterY = FLAPPY_CONFIG_upv_1.groundY - (a1.groundGrassHeight / 2)
    a1.dirtCenterY = (FLAPPY_CONFIG_upv_1.groundY - a1.groundGrassHeight) - (a1.groundDirtHeight / 2)
    local tbl_15 = {}
    local function v86(a5, a6, a7)
        --[[
          line: 1176
          upvalues:
            makeStagePart_upv_1 (copy, index: 1)
            a2 (copy, index: 2)
            u1 (copy, index: 3)
        ]]
        local v87
        if a5 == nil then
            v87 = makeStagePart_upv_1(a2)
        else
            v87 = a5:Clone()
        end
        v87.Anchored = true
        v87.CanCollide = false
        v87.CanQuery = false
        v87.CanTouch = false
        v87.CastShadow = false
        if a5 == nil then
            v87.Color = a6
            v87.TopSurface = Enum.SurfaceType.Studs
        end
        v87.Size = Vector3.new(90, a7, 8)
        v87.CFrame = CFrame.new(u1, 0, 0)
        v87.Parent = a2
        return v87
    end
    tbl_15.grass = v86(v83, u3, a1.groundGrassHeight)
    tbl_15.dirt = v86(v78, u4, a1.groundDirtHeight)
    return tbl_15
end
u13.clearDeathFlash = function(a1)
    --[[
      name: clearDeathFlash
      line: 1202
    ]]
    if a1.flashTween ~= nil then
        a1.flashTween:Cancel()
        a1.flashTween = nil
    end
    a1.deathFlash.Transparency = 1
end
u13.spawnPipe = function(a1)
    --[[
      name: spawnPipe
      line: 1209
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v88
    v88 = nil
    for _, value_24 in a1.pipes do
        if not value_24.active then
            v88 = value_24
            break
        end
    end
    if v88 ~= nil then
        local v89 = a1.generationRandom:NextNumber(FLAPPY_CONFIG_upv_1.gapCenterMin, FLAPPY_CONFIG_upv_1.gapCenterMax)
        v88.active = true
        v88.scored = false
        v88.x = FLAPPY_CONFIG_upv_1.spawnX
        v88.gapCenterY = v89
        return v88
    end
    return nil
end
u13.prefillOpening = function(a1)
    --[[
      name: prefillOpening
      line: 1238
      upvalues:
        FLAPPY_CONFIG_upv_1 (copy, index: 1)
    ]]
    local openingHeadStartStuds_1 = FLAPPY_CONFIG_upv_1.openingHeadStartStuds
    a1.totalScrolled = openingHeadStartStuds_1
    a1.renderPrevScrolled = openingHeadStartStuds_1
    local v90 = FLAPPY_CONFIG_upv_1.pipeSpacing * 0.5
    while true do
        local v91
        if v90 > openingHeadStartStuds_1 then
            break
        end
        v91 = a1:spawnPipe()
        if v91 ~= nil then
            v91.x = FLAPPY_CONFIG_upv_1.spawnX - (openingHeadStartStuds_1 - v90)
        end
        v90 = v90 + FLAPPY_CONFIG_upv_1.pipeSpacing
    end
    a1.distanceSinceSpawn = openingHeadStartStuds_1 - (v90 - FLAPPY_CONFIG_upv_1.pipeSpacing)
end
u13.parkPipe = function(a1, a2)
    --[[
      name: parkPipe
      line: 1255
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.scored = false
    a2.x = u1
    a2.top:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(u1, 0, 0)))
    a2.bottom:PivotTo(CFrame.new(a1.stage.origin + Vector3.new(u1, -10, 0)))
end
u13.die = function(a1)
    --[[
      name: die
      line: 1268
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1.context.audio.play("flappyPipeHit", {})
    a1.stage.shake(1.2)
    a1:clearDeathFlash()
    a1.deathFlash.Transparency = 0
    local v92 = TweenService_upv_1:Create(a1.deathFlash, u12, {})
    a1.flashTween = v92
    v92:Play()
    a1.deathVelocityY = 14
    a1.deathDriftX = 0
    local roundToken_upv_1 = a1.roundToken
    local score_upv_1 = a1.score
    task.delay(
        0.8,
        function()
            --[[
              line: 1290
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
local tbl_16 = {}
tbl_16.FlappyBirdGame = u13
return tbl_16