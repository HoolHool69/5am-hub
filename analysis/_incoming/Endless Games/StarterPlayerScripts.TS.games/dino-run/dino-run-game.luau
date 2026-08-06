-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "distance-score").DistanceScore
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local formatNumber_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "format-number").formatNumber
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v3 = RuntimeLib_1.import(script, script.Parent, "dino-rig")
local buildDinoRig_upv_1 = v3.buildDinoRig
local poseDino_upv_1 = v3.poseDino
local DINO_RUN_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "dino-run-config").DINO_RUN_CONFIG
local TonePalette_upv_1 = RuntimeLib_1.import(script, script.Parent, "dino-run-palette").TonePalette
local DinoScenery_upv_1 = RuntimeLib_1.import(script, script.Parent, "dino-run-scenery").DinoScenery
local v4 = RuntimeLib_1.import(script, script.Parent, "dino-run-style")
local DAY_LADDER_upv_1 = v4.DAY_LADDER
local DINO_STYLE_upv_1 = v4.DINO_STYLE
local NIGHT_LADDER_upv_1 = v4.NIGHT_LADDER
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(255, 216, 102)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 51
    ]]
    return "DinoRunGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 57
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u3)
    return v5:constructor(...) or v5
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 61
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
        DistanceScore_upv_1 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.groundTiles = {}
    a1.groundOffsets = {}
    a1.cactusSlots = {}
    a1.birdSlots = {}
    a1.y = 0
    a1.velocityY = 0
    a1.renderPrevY = 0
    a1.grounded = true
    a1.duckRemaining = 0
    a1.jumpQueued = false
    a1.jumpHeld = false
    a1.fastFallQueued = false
    a1.speed = DINO_RUN_CONFIG_upv_1.speedStart
    a1.distanceTraveled = 0
    a1.renderPrevDistance = 0
    a1.distanceSinceSpawn = 0
    a1.nextGap = DINO_RUN_CONFIG_upv_1.openingGapStuds
    a1.distance = DistanceScore_upv_1.new(DINO_RUN_CONFIG_upv_1.studsPerPoint)
    a1.nextFlipScore = DINO_RUN_CONFIG_upv_1.flipEvery
    a1.night = true
    a1.birdFlapClock = 0
    a1.wagClock = 0
    a1.blinkClock = 0
    a1.nextBlinkAt = 3
    a1.blinkUntil = 0
    a1.blinking = false
    a1.squashRemaining = 0
    a1.lastLegPhase = 0
    a1.familyStreak = 0
    a1.milestoneFlashToken = 0
    a1.invulnRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.generationRandom = Random.new()
    a1.cosmeticRandom = Random.new()
end
u3.buildScene = function(a1)
    --[[
      name: buildScene
      line: 100
      upvalues:
        TonePalette_upv_1 (copy, index: 1)
        NIGHT_LADDER_upv_1 (copy, index: 2)
        DinoScenery_upv_1 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        buildDinoRig_upv_1 (copy, index: 5)
        DINO_RUN_CONFIG_upv_1 (copy, index: 6)
        PopupTextPool_upv_1 (copy, index: 7)
    ]]
    local container_1 = a1.stage.container
    a1.palette = TonePalette_upv_1.new(NIGHT_LADDER_upv_1)
    a1.scenery = DinoScenery_upv_1.new(container_1, a1.stage, a1.palette)
    for n_1 = 0, 2 do
        local v6 = makeStagePart_upv_1(container_1)
        v6.Size = Vector3.new(90, 3, 6)
        table.insert(a1.groundTiles, v6)
        table.insert(a1.groundOffsets, (n_1 * 90) + -90)
        a1.palette:register("ink", v6)
    end
    a1.dino = buildDinoRig_upv_1(container_1)
    for _, value_1 in a1.dino.inkParts do
        a1.palette:register("ink", value_1)
    end
    for _, value_2 in a1.dino.inverseParts do
        a1.palette:register("inverse", value_2)
    end
    for _ = 0, DINO_RUN_CONFIG_upv_1.cactusSlotCount - 1 do
        local tbl_3 = {}
        for v8 = 0, 11 do
            local v7 = makeStagePart_upv_1(container_1)
            a1.palette:register("ink", v7)
            table.insert(tbl_3, {part = v7})
        end
        table.insert(a1.cactusSlots, {pieces = tbl_3})
    end
    for _ = 0, DINO_RUN_CONFIG_upv_1.birdSlotCount - 1 do
        table.insert(a1.birdSlots, (a1:buildBird(container_1)))
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 4)
    a1:buildMilestoneFlash(container_1)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 152
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function()
                --[[
                  line: 155
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onRelease()
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a2)
                --[[
                  line: 158
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a2)
            end
        )
    )
    local origin_upv_1 = a1.stage.origin
    local registerRivalMarkers_1 = a1.context.registerRivalMarkers
    if registerRivalMarkers_1 ~= nil then
        local tbl_4 = {}
        tbl_4.scoreToStuds = function(a3)
            --[[
              name: scoreToStuds
              line: 172
              upvalues:
                DINO_RUN_CONFIG_upv_1 (copy, index: 1)
            ]]
            return a3 * DINO_RUN_CONFIG_upv_1.studsPerPoint
        end
        tbl_4.getProgressStuds = function()
            --[[
              name: getProgressStuds
              line: 175
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.distanceTraveled
        end
        tbl_4.poseMarker = function(a4)
            --[[
              name: poseMarker
              line: 178
              upvalues:
                DINO_RUN_CONFIG_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                origin_upv_1 (copy, index: 3)
            ]]
            local v8 = DINO_RUN_CONFIG_upv_1.dinoX + (a4 - a1.distanceTraveled)
            if DINO_RUN_CONFIG_upv_1.spawnX >= v8 and v8 >= DINO_RUN_CONFIG_upv_1.despawnX then
                return CFrame.new(origin_upv_1.X + v8, (origin_upv_1.Y + DINO_RUN_CONFIG_upv_1.groundY) + 5, origin_upv_1.Z - 5)
            end
            return nil
        end
        registerRivalMarkers_1(tbl_4)
    end
end
u3.buildBird = function(a1, a2)
    --[[
      name: buildBird
      line: 195
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v9 = makeStagePart_upv_1(a2)
    v9.Size = Vector3.new(2, 0.8999999761581421, 1.100000023841858)
    local v10 = makeStagePart_upv_1(a2)
    v10.Size = Vector3.new(0.800000011920929, 0.800000011920929, 0.800000011920929)
    local v11 = makeStagePart_upv_1(a2)
    v11.Size = Vector3.new(0.699999988079071, 0.25, 0.4000000059604645)
    local v12 = makeStagePart_upv_1(a2)
    v12.Size = Vector3.new(0.699999988079071, 0.30000001192092896, 0.8999999761581421)
    local v13 = makeStagePart_upv_1(a2)
    v13.Size = Vector3.new(0.800000011920929, 0.5, 0.8999999761581421)
    local v14 = makeStagePart_upv_1(a2)
    v14.Size = Vector3.new(1.600000023841858, 0.18000000715255737, 1)
    local v15 = makeStagePart_upv_1(a2)
    v15.Size = Vector3.new(1.600000023841858, 0.18000000715255737, 1)
    for _, value_3 in {v9, v10, v11, v12, v13, v14, v15} do
        a1.palette:register("ink", value_3)
    end
    local tbl_5 = {}
    tbl_5.body = v9
    tbl_5.head = v10
    tbl_5.beak = v11
    tbl_5.crest = v12
    tbl_5.tailFin = v13
    tbl_5.wingNear = v14
    tbl_5.wingFar = v15
    return tbl_5
end
u3.buildMilestoneFlash = function(a1, a2)
    --[[
      name: buildMilestoneFlash
      line: 227
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v16 = makeSmoothPart_upv_1(a2)
    v16.Transparency = 1
    v16.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v16.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, (a1.stage.frameHeight / 2) - 6, 2))
    a1.milestoneBillboard = Instance.new("BillboardGui")
    a1.milestoneBillboard.Size = UDim2.fromScale(10, 2.6)
    a1.milestoneBillboard.AlwaysOnTop = true
    a1.milestoneBillboard.LightInfluence = 0
    a1.milestoneBillboard.Enabled = false
    a1.milestoneBillboard.Parent = v16
    a1.milestoneLabel = Instance.new("TextLabel")
    a1.milestoneLabel.BackgroundTransparency = 1
    a1.milestoneLabel.Size = UDim2.fromScale(1, 1)
    a1.milestoneLabel.Font = Enum.Font.GothamBlack
    a1.milestoneLabel.TextScaled = true
    a1.milestoneLabel.TextColor3 = u2
    a1.milestoneLabel.TextStrokeTransparency = 0.6
    a1.milestoneLabel.Parent = a1.milestoneBillboard
end
u3.resetRound = function(a1)
    --[[
      name: resetRound
      line: 249
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
        DINO_STYLE_upv_1 (copy, index: 3)
        NIGHT_LADDER_upv_1 (copy, index: 4)
    ]]
    a1.roundToken = a1.roundToken + 1
    local v17 = a1.context.getRunSeed()
    a1.generationRandom = deriveRandom_upv_1(v17, 0)
    a1.cosmeticRandom = deriveRandom_upv_1(v17, 1e+06)
    a1.dead = false
    a1.y = 0
    a1.velocityY = 0
    a1.grounded = true
    a1.duckRemaining = 0
    a1.jumpQueued = false
    a1.jumpHeld = false
    a1.fastFallQueued = false
    a1.speed = DINO_RUN_CONFIG_upv_1.speedStart
    a1.distanceTraveled = 0
    a1.renderPrevY = 0
    a1.renderPrevDistance = 0
    a1.distanceSinceSpawn = 0
    a1.nextGap = DINO_RUN_CONFIG_upv_1.openingGapStuds
    a1.distance:reset()
    a1.nextFlipScore = DINO_RUN_CONFIG_upv_1.flipEvery
    a1.invulnRemaining = 0
    a1.lastFamily = nil
    a1.familyStreak = 0
    a1.squashRemaining = 0
    a1.lastLegPhase = 0
    a1.wagClock = 0
    a1.blinkClock = 0
    a1.blinkUntil = 0
    a1.blinking = false
    a1.nextBlinkAt = a1.random:NextNumber(DINO_STYLE_upv_1.blink.intervalMin, DINO_STYLE_upv_1.blink.intervalMax)
    a1:cancelMilestoneFlash()
    for _, value_4 in a1.cactusSlots do
        a1:parkCactus(value_4)
    end
    for _, value_5 in a1.birdSlots do
        a1:parkBird(value_5)
    end
    a1:parkDino()
    a1.night = true
    a1.palette:snapTo(NIGHT_LADDER_upv_1)
    a1.scenery:snap(true)
    a1.context.reportScore(0)
end
u3.captureRound = function(a1)
    --[[
      name: captureRound
      line: 294
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    else
        local tbl_upv_6 = {}
        local v18 = 0
        for key_1, value_6 in a1.cactusSlots do
            if value_6.active == true then
                v18 = v18 + 1
                tbl_upv_6[v18] = value_6
            end
        end
        local tbl_upv_7 = {}
        local key_1 = 0
        for _, value_7 in a1.birdSlots do
            if value_7.active == true then
                key_1 = key_1 + 1
                tbl_upv_7[key_1] = value_7
            end
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 328
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_6 (copy, index: 2)
                    tbl_upv_7 (copy, index: 3)
                ]]
                a2:num(a1.distance:studs()):num(a1.speed):num(a1.distanceTraveled)
                a2:num(a1.distanceSinceSpawn):num(a1.nextGap):int(a1.nextFlipScore)
                a2:num(a1.y):num(a1.velocityY):bool(a1.grounded):num(a1.duckRemaining)
                a2:num(a1.invulnRemaining):bool(a1.night)
                a2:int(a1.familyStreak):str(a1.lastFamily or "")
                a2:int(#tbl_upv_6)
                for _, value_8 in tbl_upv_6 do
                    a2:num(value_8.x):num(value_8.halfWidth):num(value_8.height):int(value_8.visibleParts)
                end
                a2:int(#tbl_upv_7)
                for _, value_9 in tbl_upv_7 do
                    a2:num(value_9.x):num(value_9.centerY):num(value_9.speedOffset)
                end
            end
        )
    end
end
u3.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 344
      upvalues:
        readResume_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
        NIGHT_LADDER_upv_1 (copy, index: 3)
        DAY_LADDER_upv_1 (copy, index: 4)
        deriveRandom_upv_1 (copy, index: 5)
    ]]
    local v19 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 345
            ]]
            local tbl_8 = {}
            tbl_8.studs = a3:num()
            tbl_8.speed = a3:num()
            tbl_8.distanceTraveled = a3:num()
            tbl_8.distanceSinceSpawn = a3:num()
            tbl_8.nextGap = a3:num()
            tbl_8.nextFlipScore = a3:int()
            tbl_8.y = a3:num()
            tbl_8.velocityY = a3:num()
            tbl_8.grounded = a3:bool()
            tbl_8.duckRemaining = a3:num()
            tbl_8.invulnRemaining = a3:num()
            tbl_8.night = a3:bool()
            tbl_8.familyStreak = a3:int()
            tbl_8.lastFamily = a3:str()
            local v20 = a3:int()
            local tbl_9 = {}
            local v21 = 0
            local tbl_10 = false
            tbl_10, v21 = tbl_10, v21
            while true do
                if tbl_10 then
                    v21 = v21 + 1
                else
                    tbl_10 = true
                end
                if v21 >= v20 then
                    break
                end
                table.insert(tbl_9, {x = a3:num(), halfWidth = a3:num(), height = a3:num(), visibleParts = a3:int()})
            end
            v21 = a3:int()
            tbl_10 = {}
            local v22 = 0
            local v23 = false
            v23, v22 = v23, v22
            while true do
                if v23 then
                    v22 = v22 + 1
                else
                    v23 = true
                end
                if v22 >= v21 then
                    break
                end
                table.insert(tbl_10, {x = a3:num(), centerY = a3:num(), speedOffset = a3:num()})
            end
            v22 = table.clone(tbl_8)
            setmetatable(v22, nil)
            v22.cacti = tbl_9
            v22.birds = tbl_10
            return v22
        end
    )
    if v19 ~= nil and #a1.cactusSlots >= #v19.cacti and #a1.birdSlots >= #v19.birds then
        a1.distance:restore(v19.studs)
        a1.speed = v19.speed
        a1.distanceTraveled = v19.distanceTraveled
        a1.renderPrevDistance = v19.distanceTraveled
        a1.distanceSinceSpawn = v19.distanceSinceSpawn
        a1.nextGap = v19.nextGap
        a1.nextFlipScore = v19.nextFlipScore
        a1.y = v19.y
        a1.renderPrevY = v19.y
        a1.velocityY = v19.velocityY
        a1.grounded = v19.grounded
        a1.duckRemaining = v19.duckRemaining
        a1.invulnRemaining = v19.invulnRemaining
        a1.night = v19.night
        a1.familyStreak = v19.familyStreak
        local v24
        if v19.lastFamily ~= "cactusSmall" and v19.lastFamily ~= "cactusLarge" and v19.lastFamily ~= "ptero" then
            v24 = nil
        else
            v24 = v19.lastFamily
        end
        a1.lastFamily = v24
        a1.dead = false
        a1.jumpQueued = false
        a1.jumpHeld = false
        a1.fastFallQueued = false
        a1.roundToken = a1.roundToken + 1
        for _, value_10 in a1.cactusSlots do
            a1:parkCactus(value_10)
        end
        for _, value_11 in a1.birdSlots do
            a1:parkBird(value_11)
        end
        local cacti_1 = v19.cacti
        local function v25(a4, a5)
            --[[
              line: 448
              upvalues:
                a1 (copy, index: 1)
                DINO_RUN_CONFIG_upv_1 (copy, index: 2)
            ]]
            local v26 = a1.cactusSlots[a5 + 1]
            if v26 ~= nil then
                v26.active = true
                v26.x = a4.x
                v26.halfWidth = a4.halfWidth
                v26.height = a4.height
                local v27 = DINO_RUN_CONFIG_upv_1.smallCactus.height < a4.height
                local v28
                if v27 then
                    v28 = 5
                else
                    v28 = 3
                end
                local v29 = math.max(math.round(a4.visibleParts / v28), 1)
                local v30
                if v27 then
                    v30 = DINO_RUN_CONFIG_upv_1.largeCactus
                else
                    v30 = DINO_RUN_CONFIG_upv_1.smallCactus
                end
                a1:stampCactusPieces(v26, v30, v29, v27)
            else
                return nil
            end
        end
        for key_2, value_12 in cacti_1 do
            v25(value_12, key_2 - 1, cacti_1)
        end
        local v31 = nil
        for key_3, value_13 in v19.birds do
            v31 = a1.birdSlots[(key_3 - 1) + 1]
            if v31 ~= nil then
                v31.active = true
                v31.x = value_13.x
                v31.centerY = value_13.centerY
                v31.speedOffset = value_13.speedOffset
            end
        end
        local palette_1 = a1.palette
        local v32
        if a1.night then
            v32 = NIGHT_LADDER_upv_1
        else
            v32 = DAY_LADDER_upv_1
        end
        palette_1:snapTo(v32)
        a1.scenery:snap(a1.night)
        a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), math.floor(a1.distanceTraveled) + 1)
        a1.context.reportScore(a1.distance:current())
        return true
    end
    return false
end
u3.revive = function(a1)
    --[[
      name: revive
      line: 491
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.y = 0
    a1.velocityY = 0
    a1.grounded = true
    a1.duckRemaining = 0
    a1.jumpQueued = false
    a1.jumpHeld = false
    a1.fastFallQueued = false
    a1.invulnRemaining = DINO_RUN_CONFIG_upv_1.reviveInvulnSeconds
    for _, value_14 in a1.cactusSlots do
        if not (value_14.active) or DINO_RUN_CONFIG_upv_1.dinoX - 4 >= value_14.x then
            continue
        end
        if value_14.x < DINO_RUN_CONFIG_upv_1.dinoX + DINO_RUN_CONFIG_upv_1.reviveClearDistance then
            a1:parkCactus(value_14)
        end
    end
    for _, value_15 in a1.birdSlots do
        if not (value_15.active) or DINO_RUN_CONFIG_upv_1.dinoX - 4 >= value_15.x then
            continue
        end
        if value_15.x < DINO_RUN_CONFIG_upv_1.dinoX + DINO_RUN_CONFIG_upv_1.reviveClearDistance then
            a1:parkBird(value_15)
        end
    end
    a1:parkDino()
    a1:setRunning(true)
end
u3.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 517
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
        DINO_STYLE_upv_1 (copy, index: 2)
        UserInputService_upv_1 (copy, index: 3)
        gamepadInput_upv_1 (copy, index: 4)
        NIGHT_LADDER_upv_1 (copy, index: 5)
        DAY_LADDER_upv_1 (copy, index: 6)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevY = a1.y
        a1.renderPrevDistance = a1.distanceTraveled
        if a1.jumpQueued then
            a1.jumpQueued = false
            if a1.grounded then
                a1.velocityY = DINO_RUN_CONFIG_upv_1.jumpVelocity
                a1.grounded = false
                a1.duckRemaining = 0
                a1.context.audio.play("whoosh", {})
                a1.scenery:emitDust(a1:feetWorld(), DINO_STYLE_upv_1.dust.jumpCount)
            end
        end
        if a1.fastFallQueued then
            a1.fastFallQueued = false
            if not (a1.grounded) then
                a1.velocityY = math.min(a1.velocityY, DINO_RUN_CONFIG_upv_1.fastFallVelocity)
            end
        end
        if a1.grounded and (UserInputService_upv_1:IsKeyDown(Enum.KeyCode.Down) or UserInputService_upv_1:IsKeyDown(Enum.KeyCode.S) or gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonB) or gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonL2) or gamepadInput_upv_1:moveY() < -0.5) then
            a1.duckRemaining = math.max(a1.duckRemaining, a2 * 2)
        end
        if a1.duckRemaining > 0 then
            a1.duckRemaining = a1.duckRemaining - a2
        end
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        if not (a1.grounded) then
            if not (a1.jumpHeld) and DINO_RUN_CONFIG_upv_1.jumpCutVelocity < a1.velocityY then
                a1.velocityY = DINO_RUN_CONFIG_upv_1.jumpCutVelocity
            end
            a1.velocityY = math.max(a1.velocityY + DINO_RUN_CONFIG_upv_1.gravity * a2, DINO_RUN_CONFIG_upv_1.fastFallVelocity)
            a1.y = a1.y + (a1.velocityY * a2)
            if a1.y <= 0 then
                a1.y = 0
                a1.velocityY = 0
                a1.grounded = true
                a1.squashRemaining = DINO_STYLE_upv_1.landingSquash.seconds
                a1.context.audio.play("thud", {})
                a1.scenery:emitDust(a1:feetWorld(), DINO_STYLE_upv_1.dust.landCount)
            end
        end
        a1.speed = math.min(a1.speed + (DINO_RUN_CONFIG_upv_1.speedRampPerSecond * a2), DINO_RUN_CONFIG_upv_1.speedMax)
        local v33 = a1.speed * a2
        a1.distanceTraveled = a1.distanceTraveled + v33
        local v34 = nil
        for n_2 = 0, #a1.groundOffsets - 1 do
            v34 = a1.groundOffsets[n_2 + 1] - v33
            if v34 < -135 then
                v34 = v34 + 270
            end
            a1.groundOffsets[n_2 + 1] = v34
        end
        a1.scenery:scroll(v33)
        a1.distanceSinceSpawn = a1.distanceSinceSpawn + v33
        if a1.nextGap <= a1.distanceSinceSpawn then
            a1.distanceSinceSpawn = 0
            a1:spawnObstacle()
        end
        local v35 = a1.grounded and (a1.duckRemaining > 0)
        local v36
        if v35 then
            v36 = DINO_RUN_CONFIG_upv_1.duckHalfWidth
        else
            v36 = DINO_RUN_CONFIG_upv_1.standHalfWidth
        end
        local y_1 = a1.y
        local v37
        if v35 then
            v37 = DINO_RUN_CONFIG_upv_1.duckHeight
        else
            v37 = DINO_RUN_CONFIG_upv_1.standHeight
        end
        local v38 = y_1 + v37
        for _, value_16 in a1.cactusSlots do
            if not (value_16.active) then
                continue
            end
            value_16.x = value_16.x - v33
            if value_16.x < DINO_RUN_CONFIG_upv_1.despawnX then
                a1:parkCactus(value_16)
                continue
            end
            if a1.invulnRemaining > 0 or math.abs(value_16.x - DINO_RUN_CONFIG_upv_1.dinoX) >= value_16.halfWidth + v36 or a1.y >= value_16.height or v38 <= 0 then
                continue
            end
            a1:die()
            return nil
        end
        for _, value_17 in a1.birdSlots do
            if not (value_17.active) then
                continue
            end
            value_17.x = value_17.x - (v33 + (value_17.speedOffset * a2))
            if value_17.x < DINO_RUN_CONFIG_upv_1.despawnX then
                a1:parkBird(value_17)
                continue
            end
            if a1.invulnRemaining > 0 or math.abs(value_17.x - DINO_RUN_CONFIG_upv_1.dinoX) >= DINO_RUN_CONFIG_upv_1.birdHalfWidth + v36 or value_17.centerY - DINO_RUN_CONFIG_upv_1.birdHalfHeight >= v38 or a1.y >= value_17.centerY + DINO_RUN_CONFIG_upv_1.birdHalfHeight then
                continue
            end
            a1:die()
            return nil
        end
        if a1.distance:advance(v33) then
            v34 = a1.distance:current()
            a1.context.reportScore(v34)
            if v34 % DINO_RUN_CONFIG_upv_1.milestoneEvery == 0 then
                a1.context.audio.play("scorePing", {})
                a1:flashMilestone(v34)
            end
            if a1.nextFlipScore <= v34 then
                a1.nextFlipScore = a1.nextFlipScore + DINO_RUN_CONFIG_upv_1.flipEvery
                a1.night = not a1.night
                local palette_2 = a1.palette
                local v39
                if a1.night then
                    v39 = NIGHT_LADDER_upv_1
                else
                    v39 = DAY_LADDER_upv_1
                end
                palette_2:beginTransition(v39)
                a1.context.audio.play("perfect", {})
            end
        end
    end
end
u3.updateAmbient = function(a1, a2)
    --[[
      name: updateAmbient
      line: 645
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    a1.palette:update(a2)
    local v40 = a1.palette:progress()
    local v41
    if a1.palette:isTransitioning() then
        v41 = ((not (a1.night)) and (1 - math.min(1, v40 * 2))) or (math.max(0, (v40 - 0.5) * 2))
    else
        v41 = ((a1.night) and 1) or 0
    end
    a1.scenery:setNightBlend(v41)
    a1.scenery:updateAmbient(a2, v41)
    a1.wagClock = a1.wagClock + a2
    a1.birdFlapClock = a1.birdFlapClock + a2
    if a1.squashRemaining > 0 then
        a1.squashRemaining = math.max(0, a1.squashRemaining - a2)
    end
    a1.blinkClock = a1.blinkClock + a2
    if ((a1.blinking) or a1.nextBlinkAt > a1.blinkClock) and a1.blinking then
        if a1.blinkUntil > a1.blinkClock then
            return
        end
        a1.blinking = false
        a1.nextBlinkAt = a1.blinkClock + a1.random:NextNumber(DINO_STYLE_upv_1.blink.intervalMin, DINO_STYLE_upv_1.blink.intervalMax)
    end
    a1.blinking = true
    a1.blinkUntil = a1.blinkClock + DINO_STYLE_upv_1.blink.durationSeconds
end
u3.render = function(a1, a2)
    --[[
      name: render
      line: 670
      upvalues:
        lerp_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
        DINO_STYLE_upv_1 (copy, index: 3)
        poseDino_upv_1 (copy, index: 4)
    ]]
    a1:updateAmbient(a2)
    local origin_2 = a1.stage.origin
    local renderAlpha_1 = a1.renderAlpha
    local v42 = lerp_upv_1(a1.renderPrevY, a1.y, renderAlpha_1)
    local v43 = ((a1.dead) and 0) or (a1.distanceTraveled - lerp_upv_1(a1.renderPrevDistance, a1.distanceTraveled, renderAlpha_1))
    if not (a1.dead) then
        local v44 = a1.grounded and (0 < a1.duckRemaining)
        local v45 = math.floor(a1.distanceTraveled / DINO_RUN_CONFIG_upv_1.strideLength) % 2
        local v46 = ((a1.grounded) and 0) or (math.clamp(a1.velocityY * DINO_STYLE_upv_1.pitch.perVelocity, DINO_STYLE_upv_1.pitch.minDegrees, DINO_STYLE_upv_1.pitch.maxDegrees))
        poseDino_upv_1(
            a1.dino,
            {
                feet = origin_2 + Vector3.new(DINO_RUN_CONFIG_upv_1.dinoX, DINO_RUN_CONFIG_upv_1.groundY + v42, 0),
                ducking = v44,
                airborne = not a1.grounded,
                legPhase = v45,
                bobPhase = (a1.distanceTraveled / DINO_RUN_CONFIG_upv_1.strideLength) % 1,
                pitch = math.rad(v46),
                squash = math.clamp(a1.squashRemaining / DINO_STYLE_upv_1.landingSquash.seconds, 0, 1),
                tailWag = math.sin((a1.wagClock * math.tau) * DINO_STYLE_upv_1.tailWag.hertz) * DINO_STYLE_upv_1.tailWag.amplitudeRadians,
                blink = a1.blinking
            }
        )
        if a1:isRunning() and a1.grounded and v45 ~= a1.lastLegPhase then
            a1.scenery:emitDust(a1:feetWorld(), DINO_STYLE_upv_1.dust.strideCount)
        end
        a1.lastLegPhase = v45
    end
    a1.scenery:draw(v43)
    for n_3 = 0, #a1.groundTiles - 1 do
        a1.groundTiles[n_3 + 1].CFrame = CFrame.new(origin_2 + Vector3.new(a1.groundOffsets[n_3 + 1] + v43, DINO_RUN_CONFIG_upv_1.groundY - 1.5, 0))
    end
    local v47 = nil
    local v48 = nil
    for _, value_18 in a1.cactusSlots do
        if not (value_18.active) then
            continue
        end
        v48 = 0
        v47 = false
        while true do
            if v47 then
                v48 = v48 + 1
            else
                v47 = true
            end
            if v48 >= value_18.visibleParts then
                break
            end
            local v49 = value_18.pieces[v48 + 1]
            v49.part.CFrame = CFrame.new(origin_2 + Vector3.new((value_18.x + v49.offsetX) + v43, DINO_RUN_CONFIG_upv_1.groundY + v49.centerY, 0))
        end
    end
    for _, value_19 in a1.birdSlots do
        if value_19.active then
            a1:drawBird(value_19, origin_2, v43)
        end
    end
end
u3.drawBird = function(a1, a2, a3, a4)
    --[[
      name: drawBird
      line: 736
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
    ]]
    local v50 = CFrame.new(a3 + Vector3.new(a2.x + a4, DINO_RUN_CONFIG_upv_1.groundY + a2.centerY, 0))
    a2.body.CFrame = v50
    a2.head.CFrame = v50 * CFrame.new(1.2, 0.15, 0)
    a2.beak.CFrame = v50 * CFrame.new(1.95, 0.1, 0)
    a2.crest.CFrame = v50 * CFrame.new(0.9, 0.6, 0) * CFrame.Angles(0, 0, 0.6108652381980153)
    a2.tailFin.CFrame = v50 * CFrame.new(-1.2, 0.1, 0) * CFrame.Angles(0, 0, -0.3141592653589793)
    local v51 = a1.birdFlapClock / (DINO_RUN_CONFIG_upv_1.birdFlapSeconds * 2) % 1
    local v52 = ((v51 >= 0.5) and (2 - v51 * 2)) or (v51 * 2)
    local v53 = math.rad(lerp_upv_1(-18, 25, (v52 * v52) * (3 - (2 * v52))))
    a2.wingNear.CFrame = (v50 * CFrame.new(-0.2, 0.35, 0.45) * CFrame.Angles(0, 0, v53)) * CFrame.new(-0.8, 0, 0)
    a2.wingFar.CFrame = (v50 * CFrame.new(-0.2, 0.35, -0.45) * CFrame.Angles(0, 0, v53 * 0.85)) * CFrame.new(-0.8, 0, 0)
end
u3.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 770
    ]]
    a1.scenery:idleDrift(a2)
    if a1.dead then
        a1:updateAmbient(a2)
        return nil
    end
    a1:render(a2)
end
u3.feetWorld = function(a1)
    --[[
      name: feetWorld
      line: 778
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.stage.origin + Vector3.new(DINO_RUN_CONFIG_upv_1.dinoX, DINO_RUN_CONFIG_upv_1.groundY + a1.y, 0)
end
u3.onPress = function(a1)
    --[[
      name: onPress
      line: 783
    ]]
    if a1.dead then
        return nil
    end
    a1.jumpQueued = true
    a1.jumpHeld = true
end
u3.onRelease = function(a1)
    --[[
      name: onRelease
      line: 790
    ]]
    a1.jumpHeld = false
end
u3.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 793
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    if not (a1.dead) and a2 == "down" then
        if a1.grounded then
            a1.duckRemaining = DINO_RUN_CONFIG_upv_1.duckWindowSeconds
        else
            a1.fastFallQueued = true
        end
        return
    end
    return nil
end
u3.spawnObstacle = function(a1)
    --[[
      name: spawnObstacle
      line: 803
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v54 = a1.distance:current()
    a1.nextGap = math.max(DINO_RUN_CONFIG_upv_1.minGapStuds, a1.speed * a1.generationRandom:NextNumber(DINO_RUN_CONFIG_upv_1.minGapSeconds, DINO_RUN_CONFIG_upv_1.maxGapSecondsStart - ((DINO_RUN_CONFIG_upv_1.maxGapSecondsStart - DINO_RUN_CONFIG_upv_1.maxGapSecondsMin) * math.min(v54 / DINO_RUN_CONFIG_upv_1.gapRampScore, 1))))
    if DINO_RUN_CONFIG_upv_1.birdScoreThreshold <= v54 and not (a1:isFamilyCapped("ptero")) and a1.generationRandom:NextNumber() < DINO_RUN_CONFIG_upv_1.birdChance then
        a1:spawnBird()
        return nil
    end
    a1:spawnCactus()
end
u3.isFamilyCapped = function(a1, a2)
    --[[
      name: isFamilyCapped
      line: 816
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v55 = false
    if a1.lastFamily == a2 then
        v55 = DINO_RUN_CONFIG_upv_1.maxFamilyStreak <= a1.familyStreak
    end
    return v55
end
u3.recordFamily = function(a1, a2)
    --[[
      name: recordFamily
      line: 819
    ]]
    if a1.lastFamily ~= a2 then
        a1.lastFamily = a2
        a1.familyStreak = 1
    else
        a1.familyStreak = a1.familyStreak + 1
        return nil
    end
end
u3.rollCactusKind = function(a1)
    --[[
      name: rollCactusKind
      line: 827
    ]]
    local v56 = a1.generationRandom:NextNumber()
    if v56 >= 0.35 then
        if v56 >= 0.65 then
            if v56 >= 0.85 then
                return "cluster3"
            end
            return "cluster2"
        end
        return "large"
    end
    return "small"
end
u3.rollSmallCactusKind = function(a1)
    --[[
      name: rollSmallCactusKind
      line: 831
    ]]
    local v57 = a1.generationRandom:NextNumber()
    if v57 >= 0.5 then
        if v57 >= 0.8 then
            return "cluster3"
        end
        return "cluster2"
    end
    return "small"
end
u3.spawnCactus = function(a1)
    --[[
      name: spawnCactus
      line: 835
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v58
    v58 = nil
    for key_4, v59 in a1.cactusSlots do
        if not v59.active then
            v58 = v59
            break
        end
    end
    if v58 ~= nil then
        local v60 = a1:rollCactusKind()
        local v61
        v61 = a1:isFamilyCapped(((v60 ~= "large") and "cactusSmall") or "cactusLarge")
        if v61 then
            v60 = ((v60 ~= "large") and "large") or (a1:rollSmallCactusKind())
        end
        local v59
        if v60 ~= "large" then
            v59 = "cactusSmall"
        else
            v59 = "cactusLarge"
        end
        a1:recordFamily(v59)
        if v60 ~= "large" then
            v61 = DINO_RUN_CONFIG_upv_1.smallCactus
        else
            v61 = DINO_RUN_CONFIG_upv_1.largeCactus
        end
        local key_4 = ((v60 == "cluster2") and 2) or (((v60 ~= "cluster3") and 1) or 3)
        v59 = v60 == "large"
        v58.active = true
        v58.x = DINO_RUN_CONFIG_upv_1.spawnX
        v58.height = v61.height
        v58.halfWidth = v61.halfWidth + (((key_4 - 1) * DINO_RUN_CONFIG_upv_1.clusterSpacing) / 2)
        a1:stampCactusPieces(v58, v61, key_4, v59)
    else
        return nil
    end
end
u3.stampCactusPieces = function(a1, a2, a3, a4, a5)
    --[[
      name: stampCactusPieces
      line: 868
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v62 = 0
    local v63 = 0
    local v64 = false
    local v65 = a4
    while true do
        if v64 then
            v63 = v63 + 1
        else
            v64 = true
        end
        if v63 >= a4 then
            break
        end
        v65, v62 = a4, a1:stampSaguaro(a2, v62, a3, -((v65 - 1) * DINO_RUN_CONFIG_upv_1.clusterSpacing) / 2 + (v63 * DINO_RUN_CONFIG_upv_1.clusterSpacing), a5)
    end
    a2.visibleParts = v62
    v64, v63 = false, v62
    while true do
        if v64 then
            v63 = v63 + 1
        else
            v64 = true
        end
        if v63 >= 12 then
            break
        end
        a2.pieces[v63 + 1].part.CFrame = u1
    end
end
u3.stampSaguaro = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: stampSaguaro
      line: 904
    ]]
    local v66 = a4.halfWidth * 2 * 0.72
    local v67 = v66 / 2
    local v68 = a2.pieces[a3 + 1]
    v68.part.Size = Vector3.new(v66, a4.height, 1.4)
    v68.offsetX = a5
    v68.centerY = a4.height / 2
    local v69 = a3 + 1
    local v70
    if a6 then
        v70 = {-1, 1}
    else
        v70 = {}
        local v71 = ((a1.cosmeticRandom:NextNumber() >= 0.5) and 1) or -1
        v70[1] = v71
    end
    local v72 = nil
    local v73 = nil
    local v74 = nil
    local v75 = nil
    local v76 = nil
    local v77 = nil
    for _, value_20 in v70 do
        v72 = a4.height * a1.cosmeticRandom:NextNumber(0.4, 0.6)
        v73 = a4.halfWidth * 0.6
        v74 = v66 * 0.7
        v75 = a4.height * 0.4
        v76 = a2.pieces[v69 + 1]
        v76.part.Size = Vector3.new(v73, v66 * 0.8, 1.4)
        v76.offsetX = a5 + (value_20 * (v67 + (v73 / 2)))
        v76.centerY = v72
        v69 = v69 + 1
        v77 = a2.pieces[v69 + 1]
        v77.part.Size = Vector3.new(v74, v75, 1.4)
        v77.offsetX = a5 + (value_20 * ((v67 + v73) - (v74 / 2)))
        v77.centerY = v72 + (v75 / 2)
        v69 = v69 + 1
    end
    return v69
end
u3.spawnBird = function(a1)
    --[[
      name: spawnBird
      line: 935
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v78
    v78 = nil
    for _, value_21 in a1.birdSlots do
        if not value_21.active then
            v78 = value_21
            break
        end
    end
    if v78 ~= nil then
        a1:recordFamily("ptero")
        v78.active = true
        v78.x = DINO_RUN_CONFIG_upv_1.spawnX
        v78.centerY = DINO_RUN_CONFIG_upv_1.birdHeights[a1.generationRandom:NextInteger(0, #DINO_RUN_CONFIG_upv_1.birdHeights - 1) + 1]
        local v79
        if a1.generationRandom:NextNumber() >= 0.5 then
            v79 = DINO_RUN_CONFIG_upv_1.birdSpeedOffset
        else
            v79 = -DINO_RUN_CONFIG_upv_1.birdSpeedOffset
        end
        v78.speedOffset = v79
    else
        a1:spawnCactus()
        return nil
    end
end
u3.parkCactus = function(a1, a2)
    --[[
      name: parkCactus
      line: 960
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    for _, value_22 in a2.pieces do
        value_22.part.CFrame = u1
    end
end
u3.parkBird = function(a1, a2)
    --[[
      name: parkBird
      line: 966
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.active = false
    a2.body.CFrame = u1
    a2.head.CFrame = u1
    a2.beak.CFrame = u1
    a2.crest.CFrame = u1
    a2.tailFin.CFrame = u1
    a2.wingNear.CFrame = u1
    a2.wingFar.CFrame = u1
end
u3.parkDino = function(a1)
    --[[
      name: parkDino
      line: 976
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
        poseDino_upv_1 (copy, index: 2)
    ]]
    for _, value_23 in a1.dino.allParts do
        value_23.Anchored = true
        value_23.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        value_23.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
    poseDino_upv_1(a1.dino, {feet = a1.stage.origin + Vector3.new(DINO_RUN_CONFIG_upv_1.dinoX, DINO_RUN_CONFIG_upv_1.groundY, 0), ducking = false, airborne = false, legPhase = 0, bobPhase = 0, pitch = 0, squash = 0, tailWag = 0, blink = false})
end
u3.flashMilestone = function(a1, a2)
    --[[
      name: flashMilestone
      line: 998
      upvalues:
        formatNumber_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.milestoneFlashToken = a1.milestoneFlashToken + 1
    local milestoneFlashToken_upv_1 = a1.milestoneFlashToken
    a1.milestoneLabel.Text = formatNumber_upv_1(a2)
    for n_4 = 0, DINO_RUN_CONFIG_upv_1.milestoneFlashCount - 1 do
        task.delay(
            n_4 * (DINO_RUN_CONFIG_upv_1.milestoneFlashOnSeconds + DINO_RUN_CONFIG_upv_1.milestoneFlashOffSeconds),
            function()
                --[[
                  line: 1004
                  upvalues:
                    a1 (copy, index: 1)
                    milestoneFlashToken_upv_1 (copy, index: 2)
                    DINO_RUN_CONFIG_upv_1 (copy, index: 3)
                ]]
                if a1.milestoneFlashToken == milestoneFlashToken_upv_1 then
                    a1.milestoneBillboard.Enabled = true
                    task.delay(
                        DINO_RUN_CONFIG_upv_1.milestoneFlashOnSeconds,
                        function()
                            --[[
                              line: 1009
                              upvalues:
                                a1 (copy, index: 1)
                                milestoneFlashToken_upv_1 (copy, index: 2)
                            ]]
                            if a1.milestoneFlashToken == milestoneFlashToken_upv_1 then
                                a1.milestoneBillboard.Enabled = false
                            else
                                return nil
                            end
                        end
                    )
                else
                    return nil
                end
            end
        )
    end
end
u3.cancelMilestoneFlash = function(a1)
    --[[
      name: cancelMilestoneFlash
      line: 1018
    ]]
    a1.milestoneFlashToken = a1.milestoneFlashToken + 1
    a1.milestoneBillboard.Enabled = false
end
u3.die = function(a1)
    --[[
      name: die
      line: 1022
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        a1:cancelMilestoneFlash()
        a1.context.audio.play("buzz", {})
        a1.context.audio.play("thud", {})
        a1.stage.shake(1.2)
        a1.scenery:emitDust(a1:feetWorld(), DINO_STYLE_upv_1.dust.deathCount)
        a1.popups:show(a1.stage.origin + Vector3.new(DINO_RUN_CONFIG_upv_1.dinoX, DINO_RUN_CONFIG_upv_1.groundY + 6, 2), "GAME OVER", u2, 1)
        local roundToken_upv_1 = a1.roundToken
        for _, value_24 in a1.dino.allParts do
            value_24.Anchored = false
            value_24.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-14, -4), a1.random:NextNumber(10, 22), a1.random:NextNumber(-3, 3))
            value_24.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-10, 10), a1.random:NextNumber(-10, 10), a1.random:NextNumber(-10, 10))
        end
        task.delay(
            2.5,
            function()
                --[[
                  line: 1052
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                ]]
                if a1.roundToken == roundToken_upv_1 then
                    for _, value_25 in a1.dino.allParts do
                        value_25.Anchored = true
                    end
                else
                    return nil
                end
            end
        )
        local u4 = a1.distance:current()
        task.delay(
            DINO_RUN_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1061
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    u4 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(u4)
            end
        )
    end
end
local tbl_11 = {}
tbl_11.DinoRunGame = u3
return tbl_11