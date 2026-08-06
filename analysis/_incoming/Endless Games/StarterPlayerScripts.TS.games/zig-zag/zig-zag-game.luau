-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local GhostPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "ghost-pool").GhostPool
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "spectate-follow")
local SpectateFollow_upv_1 = v2.SpectateFollow
local approach_upv_1 = v2.approach
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local ZIG_ZAG_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "zig-zag-config").ZIG_ZAG_CONFIG
local u1 = CFrame.new(0, -1000, 0)
local u2 = 0 + ZIG_ZAG_CONFIG_upv_1.ballDiameter / 2
local Unit_upv_1 = (Vector3.new(1, -0.8999999761581421, 1)).Unit
local u3 = (Vector3.new(1, 0, 1)).Unit * ZIG_ZAG_CONFIG_upv_1.cameraLead
local u4 = Color3.fromRGB(24, 26, 32)
local u5 = Color3.fromRGB(255, 96, 200)
local u6 = Color3.fromRGB(255, 216, 102)
local tbl_1 = {}
tbl_1.tileA = Color3.fromRGB(120, 214, 178)
tbl_1.tileB = Color3.fromRGB(64, 158, 126)
tbl_1.backdrop = Color3.fromRGB(126, 140, 134)
tbl_1.trail = ColorSequence.new(Color3.fromRGB(22, 66, 52))
local tbl_2 = {}
tbl_2.tileA = Color3.fromRGB(240, 170, 104)
tbl_2.tileB = Color3.fromRGB(204, 118, 58)
tbl_2.backdrop = Color3.fromRGB(146, 136, 126)
tbl_2.trail = ColorSequence.new(Color3.fromRGB(92, 48, 20))
local tbl_3 = {}
tbl_3.tileA = Color3.fromRGB(172, 138, 232)
tbl_3.tileB = Color3.fromRGB(120, 90, 196)
tbl_3.backdrop = Color3.fromRGB(138, 132, 148)
tbl_3.trail = ColorSequence.new(Color3.fromRGB(54, 34, 88))
local tbl_4 = {}
tbl_4.tileA = Color3.fromRGB(232, 126, 150)
tbl_4.tileB = Color3.fromRGB(196, 78, 108)
tbl_4.backdrop = Color3.fromRGB(146, 128, 132)
tbl_4.trail = ColorSequence.new(Color3.fromRGB(88, 28, 44))
local tbl_5 = {}
tbl_5.tileA = Color3.fromRGB(150, 206, 232)
tbl_5.tileB = Color3.fromRGB(92, 156, 202)
tbl_5.backdrop = Color3.fromRGB(130, 138, 144)
tbl_5.trail = ColorSequence.new(Color3.fromRGB(30, 52, 66))
local tbl_upv_6 = {{tileA = Color3.fromRGB(126, 166, 232), tileB = Color3.fromRGB(78, 124, 204), backdrop = Color3.fromRGB(132, 132, 138), trail = ColorSequence.new(u4)}, tbl_1, tbl_2, tbl_3, tbl_4, tbl_5}
local function tileKey_1(a1, a2)
    --[[
      name: tileKey
      line: 85
    ]]
    return (("%*,%*"):format(a1, a2))
end
local tbl_7 = {}
local tbl_8 = {}
tbl_8.__tostring = function()
    --[[
      name: __tostring
      line: 112
    ]]
    return "ZigZagGame"
end
tbl_8.__index = BaseWorldGame_upv_1
local u7 = setmetatable(tbl_7, tbl_8)
u7.__index = u7
u7.new = function(...)
    --[[
      name: new
      line: 118
      upvalues:
        u7 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u7)
    return v4:constructor(...) or v4
end
u7.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 122
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_6 (copy, index: 3)
        SpectateFollow_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.allTiles = {}
    a1.freeTiles = {}
    a1.gridSet = {}
    a1.allGems = {}
    a1.freeGems = {}
    a1.gemByKey = {}
    a1.tilesUntilGem = 0
    a1.gemsCollected = 0
    a1.pathGxByIndex = table.create(512, 0)
    a1.pathGzByIndex = table.create(512, 0)
    a1.highestPathIndex = 0
    a1.ballX = 0
    a1.ballZ = 0
    a1.direction = "x"
    a1.currentGx = 0
    a1.currentGz = 0
    a1.renderPrevBallPos = Vector3.new(0, 0, 0)
    a1.genGx = 0
    a1.genGz = 0
    a1.genDir = "x"
    a1.runRemaining = 0
    a1.score = 0
    a1.speedLevel = 0
    a1.nextStepScore = ZIG_ZAG_CONFIG_upv_1.stepEvery
    a1.lastMilestone = 0
    a1.activePalette = tbl_upv_6[1]
    a1.cameraFocus = Vector3.new(0, 0, 0)
    a1.dead = false
    a1.spectate = SpectateFollow_upv_1.new()
    a1.spectating = false
    a1.spectateTrailIndex = 0
    a1.runStartClock = 0
    a1.roundToken = 0
    a1.random = Random.new()
    a1.pathSeed = 1
    a1.pathRandom = Random.new()
end
u7.buildScene = function(a1)
    --[[
      name: buildScene
      line: 161
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        tbl_upv_6 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        u5 (copy, index: 6)
        u4 (copy, index: 7)
        PopupTextPool_upv_1 (copy, index: 8)
    ]]
    local container_1 = a1.stage.container
    a1.stage.camera.FieldOfView = ZIG_ZAG_CONFIG_upv_1.cameraFieldOfView
    a1.backdrop = makeSmoothPart_upv_1(container_1)
    a1.backdrop.Material = Enum.Material.Neon
    a1.backdrop.Color = tbl_upv_6[1].backdrop
    a1.backdrop.Size = Vector3.new(900, 900, 1)
    for _ = 0, ZIG_ZAG_CONFIG_upv_1.poolSize - 1 do
        local v5 = makeStagePart_upv_1(container_1)
        v5.Size = Vector3.new(ZIG_ZAG_CONFIG_upv_1.tileVisualSize, ZIG_ZAG_CONFIG_upv_1.tileHeight, ZIG_ZAG_CONFIG_upv_1.tileVisualSize)
        v5.CFrame = u1
        local tbl_9 = {}
        tbl_9.part = v5
        table.insert(a1.allTiles, tbl_9)
        table.insert(a1.freeTiles, tbl_9)
    end
    for _ = 0, ZIG_ZAG_CONFIG_upv_1.gemPoolSize - 1 do
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Material = Enum.Material.Neon
        v6.Color = u5
        v6.Size = Vector3.new(0.949999988079071, 1.5499999523162842, 0.949999988079071)
        v6.CFrame = u1
        local tbl_10 = {}
        tbl_10.part = v6
        table.insert(a1.allGems, tbl_10)
        table.insert(a1.freeGems, tbl_10)
    end
    a1.ball = makeSmoothPart_upv_1(container_1)
    a1.ball.Shape = Enum.PartType.Ball
    a1.ball.Size = Vector3.new(ZIG_ZAG_CONFIG_upv_1.ballDiameter, ZIG_ZAG_CONFIG_upv_1.ballDiameter, ZIG_ZAG_CONFIG_upv_1.ballDiameter)
    a1.ball.Color = u4
    a1.ballBaseSize = a1.ball.Size
    local v7 = Instance.new("Attachment")
    v7.Position = Vector3.new(0, ZIG_ZAG_CONFIG_upv_1.ballDiameter * 0.35, 0)
    v7.Parent = a1.ball
    local v8 = Instance.new("Attachment")
    v8.Position = Vector3.new(0, -ZIG_ZAG_CONFIG_upv_1.ballDiameter * 0.35, 0)
    v8.Parent = a1.ball
    a1.trail = Instance.new("Trail")
    a1.trail.Attachment0 = v7
    a1.trail.Attachment1 = v8
    a1.trail.Lifetime = 0.32
    a1.trail.FaceCamera = true
    a1.trail.LightEmission = 0.5
    a1.trail.Color = tbl_upv_6[1].trail
    a1.trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.1)})
    local tbl_11 = {NumberSequenceKeypoint.new(0, 0.35), NumberSequenceKeypoint.new(1, 1)}
    a1.trail.Transparency = NumberSequence.new(tbl_11)
    a1.trail.Enabled = true
    a1.trail.Parent = a1.ball
    a1.deathBurst = Instance.new("ParticleEmitter")
    a1.deathBurst.Texture = "rbxasset://textures/particles/sparkles_main.dds"
    a1.deathBurst.Rate = 0
    a1.deathBurst.Lifetime = NumberRange.new(0.35, 0.7)
    a1.deathBurst.Speed = NumberRange.new(7, 14)
    a1.deathBurst.SpreadAngle = Vector2.new(180, 180)
    a1.deathBurst.Size = NumberSequence.new(0.4)
    a1.deathBurst.LightEmission = 0.9
    a1.deathBurst.Color = ColorSequence.new(u4)
    a1.deathBurst.Parent = a1.ball
    a1.popups = PopupTextPool_upv_1.new(container_1)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 237
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
        local tbl_12 = {}
        tbl_12.scoreToStuds = function(a2)
            --[[
              name: scoreToStuds
              line: 250
              upvalues:
                ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a2 * ZIG_ZAG_CONFIG_upv_1.tileSize
        end
        tbl_12.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 253
              upvalues:
                a1 (copy, index: 1)
                ZIG_ZAG_CONFIG_upv_1 (copy, index: 2)
            ]]
            return (a1.ballX + a1.ballZ) * ZIG_ZAG_CONFIG_upv_1.tileSize
        end
        tbl_12.poseMarker = function(a3)
            --[[
              name: poseMarker
              line: 256
              upvalues:
                ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                origin_upv_1 (copy, index: 3)
            ]]
            local v9 = math.floor((a3 / ZIG_ZAG_CONFIG_upv_1.tileSize) + 0.5)
            if a1.highestPathIndex >= v9 and v9 >= (a1.currentGx + a1.currentGz) - 20 then
                local v10 = v9 % 512
                return CFrame.new((origin_upv_1.X + (a1.pathGxByIndex[v10 + 1] * ZIG_ZAG_CONFIG_upv_1.tileSize)) + 3.6, (origin_upv_1.Y + 0) + 2.2, (origin_upv_1.Z + (a1.pathGzByIndex[v10 + 1] * ZIG_ZAG_CONFIG_upv_1.tileSize)) - 3.6)
            end
            return nil
        end
        registerRivalMarkers_1(tbl_12)
    end
end
u7.resetRound = function(a1)
    --[[
      name: resetRound
      line: 278
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        deriveSeed_upv_1 (copy, index: 2)
        u3 (copy, index: 3)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.runStartClock = os.clock()
    a1.score = 0
    a1.speedLevel = 0
    a1.nextStepScore = ZIG_ZAG_CONFIG_upv_1.stepEvery
    a1.lastMilestone = 0
    a1.gemsCollected = 0
    a1.highestPathIndex = 0
    a1.direction = "x"
    a1.dead = false
    a1.spectating = false
    a1.spectateTrailIndex = 0
    a1.pathSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    a1.pathRandom = Random.new(a1.pathSeed)
    a1.tilesUntilGem = a1.pathRandom:NextInteger(ZIG_ZAG_CONFIG_upv_1.gemGapMin, ZIG_ZAG_CONFIG_upv_1.gemGapMax)
    a1:reclaimAllTiles()
    a1:reclaimAllGems()
    a1:applyPalette(0)
    a1.ballX = 0
    a1.ballZ = 0
    a1.currentGx = 0
    a1.currentGz = 0
    a1.genGx = 0
    a1.genGz = 0
    a1.genDir = "x"
    a1.runRemaining = ZIG_ZAG_CONFIG_upv_1.startRunTiles
    a1.currentTileRef = a1:placePathTile(0, 0)
    for _ = 0, ZIG_ZAG_CONFIG_upv_1.lookahead - 1 do
        a1:generateTile()
    end
    a1:parkBall()
    a1.renderPrevBallPos = a1:ballWorldPosition()
    a1.cameraFocus = a1:ballWorldPosition() + u3
    a1:updateCamera(0)
    a1.context.reportScore(0)
end
u7.snapshot = function(a1)
    --[[
      name: snapshot
      line: 317
    ]]
    local tbl_13 = {}
    tbl_13.score = a1.score
    tbl_13.values = {a1.ballX, a1.ballZ}
    return tbl_13
end
u7.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 323
      upvalues:
        GhostPool_upv_1 (copy, index: 1)
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.matchOpponents = a2
    a1.spectate:setOpponents(a2)
    if a1.ghostPool == nil then
        local u8 = GhostPool_upv_1.new(a1.stage.container, {size = Vector3.new(ZIG_ZAG_CONFIG_upv_1.ballDiameter, ZIG_ZAG_CONFIG_upv_1.ballDiameter, ZIG_ZAG_CONFIG_upv_1.ballDiameter), shape = Enum.PartType.Ball})
        a1.ghostPool = u8
        a1.context.janitor:Add(
            function()
                --[[
                  line: 332
                  upvalues:
                    u8 (copy, index: 1)
                ]]
                return u8:destroy()
            end
        )
    end
end
u7.updateGhosts = function(a1, a2)
    --[[
      name: updateGhosts
      line: 337
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local ghostPool_1 = a1.ghostPool
    local matchOpponents_1 = a1.matchOpponents
    if ghostPool_1 ~= nil and matchOpponents_1 ~= nil then
        local v11 = ZIG_ZAG_CONFIG_upv_1
        local v12, v13 = nil, nil
        local v14 = nil
        local v15 = nil
        for _, value_1 in matchOpponents_1 do
            v15 = value_1.snapshot
            if v15 == nil then
                continue
            end
            v14 = a1.stage.origin
            v12 = v15.values[1]
            if v12 == nil then
                v12 = 0
            end
            v13 = v15.values[2]
            if v13 == nil then
                v13 = 0
            end
            ghostPool_1:show(value_1.userId, value_1.username, v14 + Vector3.new(v12 * v11.tileSize, u2, v13 * ZIG_ZAG_CONFIG_upv_1.tileSize), value_1.alive)
        end
        ghostPool_1:step(a2)
    else
        return nil
    end
end
u7.revive = function(a1)
    --[[
      name: revive
      line: 364
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.runStartClock = os.clock()
    a1.dead = false
    a1:reclaimAllTiles()
    a1:reclaimAllGems()
    a1.ballX = a1.currentGx
    a1.ballZ = a1.currentGz
    a1.genGx = a1.currentGx
    a1.genGz = a1.currentGz
    a1.genDir = a1.direction
    a1.runRemaining = ZIG_ZAG_CONFIG_upv_1.reviveRunwayTiles
    a1.currentTileRef = a1:placePathTile(a1.currentGx, a1.currentGz)
    for _ = 0, ZIG_ZAG_CONFIG_upv_1.lookahead - 1 do
        a1:generateTile()
    end
    a1:parkBall()
    a1.renderPrevBallPos = a1:ballWorldPosition()
    a1.cameraFocus = a1:ballWorldPosition() + u3
    a1:setRunning(true)
end
u7.captureRound = function(a1)
    --[[
      name: captureRound
      line: 389
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 393
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2:int(a1.score):int(a1.speedLevel):int(a1.nextStepScore):int(a1.lastMilestone)
            a2:int(a1.gemsCollected):int(a1.highestPathIndex)
            local v16 = a2:int(a1.currentGx):int(a1.currentGz)
            v16:bool(a1.direction == "z")
            a2:int(a1.tilesUntilGem)
        end
    )
end
u7.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 400
      upvalues:
        readResume_upv_1 (copy, index: 1)
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 2)
        deriveSeed_upv_1 (copy, index: 3)
        u3 (copy, index: 4)
    ]]
    local v17 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 401
            ]]
            local tbl_14 = {}
            tbl_14.score = a3:int()
            tbl_14.speedLevel = a3:int()
            tbl_14.nextStepScore = a3:int()
            tbl_14.lastMilestone = a3:int()
            tbl_14.gemsCollected = a3:int()
            tbl_14.highestPathIndex = a3:int()
            tbl_14.currentGx = a3:int()
            tbl_14.currentGz = a3:int()
            tbl_14.headingZ = a3:bool()
            tbl_14.tilesUntilGem = a3:int()
            return tbl_14
        end
    )
    if v17 ~= nil then
        a1:reclaimAllTiles()
        a1:reclaimAllGems()
        a1.score = a2.score
        a1.gemsCollected = a2.pickups
        a1.speedLevel = v17.speedLevel
        a1.nextStepScore = v17.nextStepScore
        a1.lastMilestone = v17.lastMilestone
        a1.highestPathIndex = v17.highestPathIndex
        a1.currentGx = v17.currentGx
        a1.currentGz = v17.currentGz
        a1.direction = ((v17.headingZ) and "z") or "x"
        a1.tilesUntilGem = v17.tilesUntilGem
        a1.dead = false
        a1.roundToken = a1.roundToken + 1
        a1.runStartClock = os.clock()
        a1:applyPalette(a1.speedLevel)
        a1.ballX = a1.currentGx
        a1.ballZ = a1.currentGz
        a1.genGx = a1.currentGx
        a1.genGz = a1.currentGz
        a1.genDir = a1.direction
        a1.runRemaining = ZIG_ZAG_CONFIG_upv_1.reviveRunwayTiles
        a1.pathRandom = Random.new(deriveSeed_upv_1(a1.pathSeed, (a1.currentGx + a1.currentGz) + 1))
        a1.currentTileRef = a1:placePathTile(a1.currentGx, a1.currentGz)
        for _ = 0, ZIG_ZAG_CONFIG_upv_1.lookahead - 1 do
            a1:generateTile()
        end
        a1:parkBall()
        a1.renderPrevBallPos = a1:ballWorldPosition()
        a1.cameraFocus = a1:ballWorldPosition() + u3
        a1:updateCamera(0)
        a1.context.reportScore(a1.score)
        a1.context.reportPickup(a1.gemsCollected)
        return true
    end
    return false
end
u7.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 458
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v18, v19 = nil, nil
    if a1.dead then
        return nil
    else
        a1.renderPrevBallPos = a1:ballWorldPosition()
        local v20 = math.min(ZIG_ZAG_CONFIG_upv_1.speedStart + (a1.speedLevel * ZIG_ZAG_CONFIG_upv_1.speedStep), ZIG_ZAG_CONFIG_upv_1.speedMax) * a2 / ZIG_ZAG_CONFIG_upv_1.tileSize
        if a1.direction ~= "x" then
            a1.ballZ = a1.ballZ + v20
        else
            a1.ballX = a1.ballX + v20
        end
        if ZIG_ZAG_CONFIG_upv_1.turnTolerance < a1:lateralOffset() and not (a1:isStraddlingRoadSeam()) then
            a1:die()
            return nil
        end
        v18 = math.round(a1.ballX)
        local v21 = math.round(a1.ballZ)
        if v18 == a1.currentGx and v21 == a1.currentGz then
            return nil
        end
        v19 = a1.gridSet[("%*,%*"):format(v18, v21)]
        if v19 ~= nil then
            a1:arriveAtTile(v19, v18, v21)
        else
            a1:die()
            return nil
        end
    end
end
u7.lateralOffset = function(a1)
    --[[
      name: lateralOffset
      line: 501
    ]]
    local v22
    if a1.direction ~= "x" then
        v22 = a1.ballX
    else
        v22 = a1.ballZ
    end
    return (math.abs(v22 - math.round(v22)))
end
u7.isStraddlingRoadSeam = function(a1)
    --[[
      name: isStraddlingRoadSeam
      line: 505
    ]]
    local v23
    if a1.direction ~= "x" then
        v23 = a1.ballX
    else
        v23 = a1.ballZ
    end
    local v24 = math.round(v23)
    local v25
    if v24 >= v23 then
        v25 = -1
    else
        v25 = 1
    end
    local v26 = ((a1.direction ~= "x") and (v24 + v25)) or (math.round(a1.ballX))
    local v27 = ((a1.direction == "x") and (v24 + v25)) or (math.round(a1.ballZ))
    local v28
    if a1.gridSet[("%*,%*"):format(v26, v27)] ~= nil then
        v28 = true
    else
        v28 = false
    end
    return v28
end
u7.render = function(a1, a2)
    --[[
      name: render
      line: 515
    ]]
    a1:updateGhosts(a2)
    local ball_1 = a1.ball
    local v29 = ((a1.spectating) and (a1.stage.origin + Vector3.new(0, -4000, 0))) or (a1.renderPrevBallPos:Lerp(a1:ballWorldPosition(), a1.renderAlpha))
    ball_1.CFrame = CFrame.new(v29)
    a1:animateGems()
    a1:updateCamera(a2)
end
u7.setSpectateTarget = function(a1, a2)
    --[[
      name: setSpectateTarget
      line: 524
    ]]
    a1.spectate:setTarget(a2)
    if a2 ~= nil then
        return
    end
    a1.spectating = false
end
u7.spectateStep = function(a1, a2)
    --[[
      name: spectateStep
      line: 530
      upvalues:
        approach_upv_1 (copy, index: 1)
    ]]
    local v30 = a1.spectate:value(0)
    local v31 = a1.spectate:value(1)
    if v30 ~= nil and v31 ~= nil then
        a1.ballX = approach_upv_1(a1.ballX, v30, 8, a2)
        a1.ballZ = approach_upv_1(a1.ballZ, v31, 8, a2)
        a1:streamPathAround((math.floor(v30 + v31)))
    end
    a1.renderPrevBallPos = a1:ballWorldPosition()
    a1:animateGems()
    a1:updateCamera(a2)
end
u7.streamPathAround = function(a1, a2)
    --[[
      name: streamPathAround
      line: 542
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _ = 0, 7 do
        if a2 + ZIG_ZAG_CONFIG_upv_1.lookahead <= a1.genGx + a1.genGz then
            break
        else
            a1:generateTile()
        end
    end
    if a1.spectateTrailIndex == 0 then
        a1.spectateTrailIndex = math.max(a2 - 24, 0)
    end
    while true do
        local v32
        if a1.spectateTrailIndex >= a2 - 24 then
            break
        end
        local v33 = a1.spectateTrailIndex % 512
        v32 = a1.gridSet[("%*,%*"):format(a1.pathGxByIndex[v33 + 1], a1.pathGzByIndex[v33 + 1])]
        a1.spectateTrailIndex = a1.spectateTrailIndex + 1
        if v32 ~= nil then
            a1:crumbleTile(v32)
        end
    end
end
u7.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 563
    ]]
    a1:updateGhosts(a2)
    if a1.dead and a1.spectate:isActive() then
        a1.spectating = true
        a1:spectateStep(a2)
        return nil
    end
    if a1.dead then
        a1:updateCamera(a2)
        return nil
    end
    a1:render(a2)
end
u7.onPress = function(a1)
    --[[
      name: onPress
      line: 577
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    if not a1.dead and os.clock() - a1.runStartClock >= ZIG_ZAG_CONFIG_upv_1.startTapGrace then
        a1.direction = ((a1.direction ~= "x") and "x") or "z"
        if a1.direction ~= "z" then
            a1.context.audio.play("zigzagTurnLeft", {})
        else
            a1.context.audio.play("zigzagTurnRight", {})
        end
    else
        return nil
    end
end
u7.arriveAtTile = function(a1, a2, a3, a4)
    --[[
      name: arriveAtTile
      line: 608
    ]]
    local currentTileRef_1 = a1.currentTileRef
    a1.currentTileRef = a2
    a1.currentGx = a3
    a1.currentGz = a4
    a1.score = a1.score + 1
    a1:collectGemAt(a3, a4)
    a1:onScored()
    a1:scheduleCrumble(currentTileRef_1)
    a1:generateTile()
end
u7.onScored = function(a1)
    --[[
      name: onScored
      line: 619
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    a1.context.reportScore(a1.score)
    a1.context.audio.play("zigzagScore", {pitch = 1 + ((a1.score % 12) * 0.045)})
    local v34 = a1.nextStepScore <= a1.score
    while a1.nextStepScore <= a1.score do
        a1.nextStepScore = a1.nextStepScore + ZIG_ZAG_CONFIG_upv_1.stepEvery
        a1:stepUp()
    end
    local v35 = math.floor(a1.score / ZIG_ZAG_CONFIG_upv_1.milestoneEvery)
    if a1.lastMilestone >= v35 then
        return
    end
    a1.lastMilestone = v35
    if (v34) then
        return
    end
    a1.context.audio.play("perfect", {})
    a1.popups:show(a1:ballWorldPosition() + Vector3.new(0, 3, 0), ("%*"):format(a1.score), u6, 1.1)
end
u7.stepUp = function(a1)
    --[[
      name: stepUp
      line: 648
      upvalues:
        u6 (copy, index: 1)
    ]]
    a1.speedLevel = a1.speedLevel + 1
    a1:applyPalette(a1.speedLevel)
    a1.context.audio.play("perfect", {pitch = (math.min(a1.speedLevel, 6) * 0.05) + 1.25})
    a1.context.audio.play("whoosh", {})
    a1.popups:show(a1:ballWorldPosition() + Vector3.new(0, 4, 0), "SPEED UP!", u6, 1.25)
    a1.stage.shake(0.3)
end
u7.applyPalette = function(a1, a2)
    --[[
      name: applyPalette
      line: 665
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    local v36 = tbl_upv_6[(a2 % #tbl_upv_6) + 1]
    a1.activePalette = v36
    a1.backdrop.Color = v36.backdrop
    a1.trail.Color = v36.trail
    local v37 = nil
    local v38 = nil
    for _, value_2 in a1.allTiles do
        if value_2.state == "free" then
            continue
        end
        v37 = value_2.part
        if (value_2.gx + value_2.gz) % 2 ~= 0 then
            v38 = v36.tileB
        else
            v38 = v36.tileA
        end
        v37.Color = v38
    end
end
u7.generateTile = function(a1)
    --[[
      name: generateTile
      line: 677
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.runRemaining <= 0 then
        a1.genDir = ((a1.genDir ~= "x") and "x") or "z"
        a1.runRemaining = a1.pathRandom:NextInteger(ZIG_ZAG_CONFIG_upv_1.runMin, ZIG_ZAG_CONFIG_upv_1.runMax)
    end
    if a1.genDir ~= "x" then
        a1.genGz = a1.genGz + 1
    else
        a1.genGx = a1.genGx + 1
    end
    a1.runRemaining = a1.runRemaining - 1
    local v39 = a1:placePathTile(a1.genGx, a1.genGz)
    a1.tilesUntilGem = a1.tilesUntilGem - 1
    local v40 = a1.runRemaining <= 0
    if a1.tilesUntilGem <= 0 and ((v40) or a1.tilesUntilGem <= -ZIG_ZAG_CONFIG_upv_1.gemCornerPatience) then
        a1.tilesUntilGem = a1.pathRandom:NextInteger(ZIG_ZAG_CONFIG_upv_1.gemGapMin, ZIG_ZAG_CONFIG_upv_1.gemGapMax)
        a1:placeGem(v39)
    end
end
u7.placePathTile = function(a1, a2, a3)
    --[[
      name: placePathTile
      line: 701
    ]]
    local freeTiles_1 = a1.freeTiles
    local v41 = #freeTiles_1
    local v42 = freeTiles_1[v41]
    freeTiles_1[v41] = nil
    if v42 == nil then
        error("[zig-zag] tile pool exhausted")
    end
    v42.gx = a2
    v42.gz = a3
    v42.state = "path"
    v42.part.Anchored = true
    local part_1 = v42.part
    local v43
    if (a2 + a3) % 2 ~= 0 then
        v43 = a1.activePalette.tileB
    else
        v43 = a1.activePalette.tileA
    end
    part_1.Color = v43
    v42.part.CFrame = a1:tileCFrame(a2, a3)
    a1.gridSet[("%*,%*"):format(a2, a3)] = v42
    local v44 = a2 + a3
    local v45 = v44 % 512
    a1.pathGxByIndex[v45 + 1] = a2
    a1.pathGzByIndex[v45 + 1] = a3
    if a1.highestPathIndex < v44 then
        a1.highestPathIndex = v44
    end
    return v42
end
u7.placeGem = function(a1, a2)
    --[[
      name: placeGem
      line: 731
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    local freeGems_1 = a1.freeGems
    local v46 = #freeGems_1
    local v47 = freeGems_1[v46]
    freeGems_1[v46] = nil
    if v47 ~= nil then
        v47.gx = a2.gx
        v47.gz = a2.gz
        v47.active = true
        v47.position = a1.stage.origin + Vector3.new(a2.gx * ZIG_ZAG_CONFIG_upv_1.tileSize, 0 + ZIG_ZAG_CONFIG_upv_1.gemHoverHeight, a2.gz * ZIG_ZAG_CONFIG_upv_1.tileSize)
        v47.part.CFrame = CFrame.new(v47.position)
        a1.gemByKey[("%*,%*"):format(a2.gx, a2.gz)] = v47
    else
        return nil
    end
end
u7.collectGemAt = function(a1, a2, a3)
    --[[
      name: collectGemAt
      line: 754
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
    ]]
    local v48 = ("%*,%*"):format(a2, a3)
    local v49 = a1.gemByKey[v48]
    if v49 ~= nil then
        a1.gemByKey[v48] = nil
        a1:parkGem(v49)
        table.insert(a1.freeGems, v49)
        a1.score = a1.score + ZIG_ZAG_CONFIG_upv_1.gemScore
        a1.gemsCollected = a1.gemsCollected + 1
        a1.context.reportPickup(a1.gemsCollected)
        a1.context.audio.play("zigzagCollect", {pitch = 1 + ((a1.gemsCollected % 8) * 0.04)})
        a1.popups:show(a1:ballWorldPosition() + Vector3.new(0, 2.5, 0), ("+%*"):format(ZIG_ZAG_CONFIG_upv_1.gemScore), u5, 0.8)
    else
        return nil
    end
end
u7.animateGems = function(a1)
    --[[
      name: animateGems
      line: 776
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v50 = os.clock() * ZIG_ZAG_CONFIG_upv_1.gemSpinSpeed
    for _, value_3 in a1.allGems do
        if value_3.active then
            value_3.part.CFrame = CFrame.new(value_3.position + Vector3.new(0, math.sin(((v50 * 2) + value_3.gx) + value_3.gz) * 0.2, 0)) * CFrame.Angles(0, (v50 + value_3.gx) + value_3.gz, 0)
        end
    end
end
u7.scheduleCrumble = function(a1, a2)
    --[[
      name: scheduleCrumble
      line: 790
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        ZIG_ZAG_CONFIG_upv_1.crumbleDelay,
        function()
            --[[
              line: 792
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_1 (copy, index: 2)
                a2 (copy, index: 3)
            ]]
            if a1.roundToken == roundToken_upv_1 then
                a1:crumbleTile(a2)
            else
                return nil
            end
        end
    )
end
u7.crumbleTile = function(a1, a2)
    --[[
      name: crumbleTile
      line: 799
    ]]
    if a2.state == "path" then
        a1.gridSet[("%*,%*"):format(a2.gx, a2.gz)] = nil
        a2.state = "crumbling"
        a2.crumbleToken = a2.crumbleToken + 1
        local crumbleToken_upv_1 = a2.crumbleToken
        local part_2 = a2.part
        part_2.Anchored = false
        part_2.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-2, 2), -5, a1.random:NextNumber(-2, 2))
        part_2.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-6, 6), a1.random:NextNumber(-6, 6), a1.random:NextNumber(-6, 6))
        task.delay(
            2.5,
            function()
                --[[
                  line: 814
                  upvalues:
                    a2 (copy, index: 1)
                    crumbleToken_upv_1 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                if a2.crumbleToken == crumbleToken_upv_1 and a2.state == "crumbling" then
                    a1:parkTile(a2)
                    table.insert(a1.freeTiles, a2)
                else
                    return nil
                end
            end
        )
    else
        return nil
    end
end
u7.updateCamera = function(a1, a2)
    --[[
      name: updateCamera
      line: 824
      upvalues:
        u3 (copy, index: 1)
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 2)
        Unit_upv_1 (copy, index: 3)
    ]]
    a1.cameraFocus = a1.cameraFocus:Lerp(a1:ballWorldPosition() + u3, math.min(a2 * ZIG_ZAG_CONFIG_upv_1.cameraFollowRate, 1))
    local cameraDistance_1 = ZIG_ZAG_CONFIG_upv_1.cameraDistance
    local v51 = ((a1.stage.getOrientation() ~= "portrait") and 1) or (ZIG_ZAG_CONFIG_upv_1.cameraPortraitScale)
    a1.stage.setCameraCFrame(CFrame.lookAt(a1.cameraFocus - (Unit_upv_1 * (cameraDistance_1 * v51)), a1.cameraFocus))
    local v52 = a1.cameraFocus + Unit_upv_1 * 220
    a1.backdrop.CFrame = CFrame.lookAt(v52, v52 - Unit_upv_1)
end
u7.ballWorldPosition = function(a1)
    --[[
      name: ballWorldPosition
      line: 840
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    return a1.stage.origin + Vector3.new(a1.ballX * ZIG_ZAG_CONFIG_upv_1.tileSize, u2, a1.ballZ * ZIG_ZAG_CONFIG_upv_1.tileSize)
end
u7.tileCFrame = function(a1, a2, a3)
    --[[
      name: tileCFrame
      line: 845
      upvalues:
        ZIG_ZAG_CONFIG_upv_1 (copy, index: 1)
    ]]
    return CFrame.new(a1.stage.origin + Vector3.new(a2 * ZIG_ZAG_CONFIG_upv_1.tileSize, 0 - (ZIG_ZAG_CONFIG_upv_1.tileHeight / 2), a3 * ZIG_ZAG_CONFIG_upv_1.tileSize))
end
u7.parkBall = function(a1)
    --[[
      name: parkBall
      line: 851
    ]]
    a1.ball.Anchored = true
    a1.ball.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    a1.ball.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    a1.ball.Size = a1.ballBaseSize
    a1.ball.CFrame = CFrame.new(a1:ballWorldPosition())
    a1.trail:Clear()
end
u7.parkTile = function(a1, a2)
    --[[
      name: parkTile
      line: 860
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.state = "free"
    a2.part.Anchored = true
    a2.part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    a2.part.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    a2.part.CFrame = u1
end
u7.parkGem = function(a1, a2)
    --[[
      name: parkGem
      line: 867
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.part.CFrame = u1
end
u7.reclaimAllTiles = function(a1)
    --[[
      name: reclaimAllTiles
      line: 871
    ]]
    table.clear(a1.gridSet)
    while #a1.freeTiles > 0 do
        local freeTiles_2 = a1.freeTiles
        freeTiles_2[#freeTiles_2] = nil
    end
    for _, value_4 in a1.allTiles do
        value_4.crumbleToken = value_4.crumbleToken + 1
        a1:parkTile(value_4)
        table.insert(a1.freeTiles, value_4)
    end
end
u7.reclaimAllGems = function(a1)
    --[[
      name: reclaimAllGems
      line: 885
    ]]
    table.clear(a1.gemByKey)
    while #a1.freeGems > 0 do
        local freeGems_2 = a1.freeGems
        freeGems_2[#freeGems_2] = nil
    end
    for _, value_5 in a1.allGems do
        a1:parkGem(value_5)
        table.insert(a1.freeGems, value_5)
    end
end
u7.deathFling = function(a1)
    --[[
      name: deathFling
      line: 897
    ]]
    local v53 = ((a1.direction ~= "x") and Vector3.new(0, 0, 1)) or Vector3.new(1, 0, 0)
    local v54
    if a1.direction ~= "x" then
        v54 = a1.ballX
    else
        v54 = a1.ballZ
    end
    local v55 = math.round(v54)
    local v56
    if v55 >= v54 then
        v56 = -1
    else
        v56 = 1
    end
    local v57
    if a1.direction ~= "x" then
        v57 = Vector3.new(v56, 0, 0)
    else
        v57 = Vector3.new(0, 0, v56)
    end
    local v58 = ((a1.direction ~= "x") and (v55 + 0)) or (math.round(a1.ballX))
    local v59 = ((a1.direction == "x") and (v55 + 0)) or (math.round(a1.ballZ))
    local v60
    if a1.gridSet[("%*,%*"):format(v58, v59)] ~= nil then
        v60 = true
    else
        v60 = false
    end
    if v60 then
        local v61 = ((a1.direction ~= "x") and (v55 + v56)) or (math.round(a1.ballX))
        local v62 = ((a1.direction == "x") and (v55 + v56)) or (math.round(a1.ballZ))
        if a1.gridSet[("%*,%*"):format(v61, v62)] ~= nil then
            v60 = true
        else
            v60 = false
        end
        if not (v60) then
            return (v53 * 5) + (v57 * 8)
        end
    end
    local v63 = ((a1.direction ~= "x") and (v55 + 0)) or (math.round(a1.ballX))
    local v64 = ((a1.direction == "x") and (v55 + 0)) or (math.round(a1.ballZ))
    if a1.gridSet[("%*,%*"):format(v63, v64)] ~= nil then
        v60 = true
    else
        v60 = false
    end
    if not (v60) then
        local v65 = ((a1.direction ~= "x") and (v55 + v56)) or (math.round(a1.ballX))
        local v66 = ((a1.direction == "x") and (v55 + v56)) or (math.round(a1.ballZ))
        if a1.gridSet[("%*,%*"):format(v65, v66)] ~= nil then
            v60 = true
        else
            v60 = false
        end
        if v60 then
            return (v53 * 8) + (v57 * -5)
        end
    end
    return v53 * 10
end
u7.die = function(a1)
    --[[
      name: die
      line: 924
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        a1.context.audio.play("zigzagFall", {})
        a1.stage.shake(0.9)
        a1.deathBurst:Emit(18)
        a1.ball.Anchored = false
        a1.ball.AssemblyLinearVelocity = a1:deathFling() + Vector3.new(0, 2, 0)
        a1.ball.AssemblyAngularVelocity = Vector3.new(6, 0, 6)
        task.delay(
            2.5,
            function()
                --[[
                  line: 942
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.ball.Anchored = true
            end
        )
        local score_upv_1 = a1.score
        local roundToken_upv_2 = a1.roundToken
        task.delay(
            0.7,
            function()
                --[[
                  line: 947
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
end
local tbl_15 = {}
tbl_15.ZigZagGame = u7
return tbl_15