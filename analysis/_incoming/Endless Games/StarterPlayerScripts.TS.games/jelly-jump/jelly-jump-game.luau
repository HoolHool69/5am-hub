-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local pausedAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").pausedAtom
local JELLY_JUMP_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "jelly-jump-config").JELLY_JUMP_CONFIG
local v2 = RuntimeLib_1.import(script, script.Parent, "jelly-jump-sim")
local clearJumpBuffer_upv_1 = v2.clearJumpBuffer
local dropletYForLevel_upv_1 = v2.dropletYForLevel
local findGate_upv_1 = v2.findGate
local gateGap_upv_1 = v2.gateGap
local makeRunState_upv_1 = v2.makeRunState
local planeYForLevel_upv_1 = v2.planeYForLevel
local pressJump_upv_1 = v2.pressJump
local resetRun_upv_1 = v2.resetRun
local restYForLevel_upv_1 = v2.restYForLevel
local reviveRun_upv_1 = v2.reviveRun
local stepRun_upv_1 = v2.stepRun
local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
tbl_upv_1.spacingStuds = JELLY_JUMP_CONFIG_upv_1.spacingStuds
tbl_upv_1.shaftWidthStuds = JELLY_JUMP_CONFIG_upv_1.shaftWidthStuds
tbl_upv_1.jellySizeStuds = JELLY_JUMP_CONFIG_upv_1.jellySizeStuds
tbl_upv_1.clearanceStuds = JELLY_JUMP_CONFIG_upv_1.clearanceStuds
tbl_upv_1.gravity = JELLY_JUMP_CONFIG_upv_1.gravity
tbl_upv_1.jumpSpeed = JELLY_JUMP_CONFIG_upv_1.jumpSpeed
tbl_upv_1.jumpBufferTicks = JELLY_JUMP_CONFIG_upv_1.jumpBufferTicks
tbl_upv_1.closeStartSeconds = JELLY_JUMP_CONFIG_upv_1.closeStartSeconds
tbl_upv_1.closeFloorSeconds = JELLY_JUMP_CONFIG_upv_1.closeFloorSeconds
tbl_upv_1.closeDecayLevels = JELLY_JUMP_CONFIG_upv_1.closeDecayLevels
tbl_upv_1.fastCloseMultiplier = JELLY_JUMP_CONFIG_upv_1.fastCloseMultiplier
tbl_upv_1.mediumCloseMultiplier = JELLY_JUMP_CONFIG_upv_1.mediumCloseMultiplier
tbl_upv_1.slowCloseMultiplier = JELLY_JUMP_CONFIG_upv_1.slowCloseMultiplier
tbl_upv_1.closeJitter = JELLY_JUMP_CONFIG_upv_1.closeJitter
tbl_upv_1.fastClassChance = JELLY_JUMP_CONFIG_upv_1.fastClassChance
tbl_upv_1.mediumClassChance = JELLY_JUMP_CONFIG_upv_1.mediumClassChance
tbl_upv_1.tutorialMediumLevels = JELLY_JUMP_CONFIG_upv_1.tutorialMediumLevels
tbl_upv_1.generateAheadLevels = JELLY_JUMP_CONFIG_upv_1.generateAheadLevels
tbl_upv_1.dropletFirstLevel = JELLY_JUMP_CONFIG_upv_1.dropletFirstLevel
tbl_upv_1.dropletMinGap = JELLY_JUMP_CONFIG_upv_1.dropletMinGap
tbl_upv_1.dropletMaxGap = JELLY_JUMP_CONFIG_upv_1.dropletMaxGap
tbl_upv_1.dropletDropStuds = JELLY_JUMP_CONFIG_upv_1.dropletDropStuds
tbl_upv_1.dropletRadiusStuds = JELLY_JUMP_CONFIG_upv_1.dropletRadiusStuds
tbl_upv_1.liquidBaseRise = JELLY_JUMP_CONFIG_upv_1.liquidBaseRise
tbl_upv_1.liquidTrailStuds = JELLY_JUMP_CONFIG_upv_1.liquidTrailStuds
tbl_upv_1.liquidCatchupGain = JELLY_JUMP_CONFIG_upv_1.liquidCatchupGain
tbl_upv_1.liquidMaxRise = JELLY_JUMP_CONFIG_upv_1.liquidMaxRise
tbl_upv_1.deathSurgeRise = JELLY_JUMP_CONFIG_upv_1.deathSurgeRise
tbl_upv_1.deathSinkStudsPerSecond = JELLY_JUMP_CONFIG_upv_1.deathSinkStudsPerSecond
local u2 = JELLY_JUMP_CONFIG_upv_1.shaftWidthStuds / 2
local tbl_upv_2 = {4, -6, -16, -26}
local tbl_upv_3 = {9.2, 9.9, 10.8, 11.8}
local tbl_upv_4 = {0, 0.22, 0.44, 0.66}
local u3 = Color3.fromRGB(170, 178, 192)
local tbl_upv_5 = {60, 71}
local u4 = Color3.fromRGB(247, 249, 252)
local u5 = Color3.fromRGB(176, 184, 198)
local tbl_upv_6 = {Color3.fromRGB(240, 242, 247), Color3.fromRGB(236, 239, 245), Color3.fromRGB(232, 235, 242), Color3.fromRGB(238, 240, 246)}
local u6 = Color3.fromRGB(219, 221, 226)
local u7 = Color3.fromRGB(12, 74, 152)
local u8 = Color3.fromRGB(46, 156, 238)
local u9 = Color3.fromRGB(170, 226, 255)
local u10 = Color3.fromRGB(16, 40, 68)
local u11 = Color3.fromRGB(46, 128, 196)
local u12 = Color3.fromRGB(9, 11, 17)
local u13 = Color3.fromRGB(17, 21, 31)
local u14 = Color3.fromRGB(108, 168, 204)
local u15 = Color3.fromRGB(120, 236, 255)
local u16 = Color3.fromRGB(255, 216, 102)
local u17 = Color3.fromRGB(255, 92, 80)
local u18 = Color3.fromRGB(140, 240, 255)
local tbl_7 = {}
local tbl_8 = {}
tbl_8.__tostring = function()
    --[[
      name: __tostring
      line: 338
    ]]
    return "JellyJumpGame"
end
tbl_8.__index = BaseWorldGame_upv_1
local u19 = setmetatable(tbl_7, tbl_8)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 344
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u19)
    return v3:constructor(...) or v3
end
u19.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 348
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        makeRunState_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.run = makeRunState_upv_1()
    a1.hasEnded = false
    a1.fallThroughs = 0
    a1.renderPreviousY = 0
    a1.renderPreviousLiquidY = 0
    a1.renderPreviousElapsed = 0
    a1.cameraY = 0
    a1.lastFrameCenterY = math.huge
    a1.lastBackdropY = math.huge
    a1.squashClock = 99
    a1.idleClock = 0
    a1.surfaceClock = 0
    a1.backingWalls = {}
    a1.wallParts = {}
    a1.wallBaseY = {}
    a1.wallBand = {}
    a1.wallShift = {}
    a1.gates = {}
    a1.splats = {}
    a1.splatCursor = 0
    a1.droplets = {}
    a1.surfaceBobbles = {}
    a1.surfaceFoam = {}
end
u19.buildScene = function(a1)
    --[[
      name: buildScene
      line: 374
      upvalues:
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 6)
        u9 (copy, index: 7)
        u8 (copy, index: 8)
        PopupTextPool_upv_1 (copy, index: 9)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameWidthFloor(JELLY_JUMP_CONFIG_upv_1.frameWidthFloorStuds)
    a1.backdrop = makeFrontalBackdrop_upv_1(a1.stage, u4, Enum.Material.SmoothPlastic)
    a1:buildWalls(container_1)
    a1:buildGates(container_1)
    a1:buildSplats(container_1)
    a1:buildDroplets(container_1)
    a1:buildLiquid(container_1)
    a1:buildJelly(container_1)
    a1.splashAnchor = makeSmoothPart_upv_1(container_1)
    a1.splashAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.splashAnchor.Transparency = 1
    a1.splashAnchor.CFrame = u1
    a1.splashBurst = Instance.new("ParticleEmitter")
    a1.splashBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.splashBurst.Rate = 0
    a1.splashBurst.Lifetime = NumberRange.new(0.22, 0.42)
    a1.splashBurst.Speed = NumberRange.new(6, 14)
    a1.splashBurst.SpreadAngle = Vector2.new(150, 150)
    a1.splashBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.08)})
    a1.splashBurst.Color = ColorSequence.new(u9, u8)
    a1.splashBurst.Parent = a1.splashAnchor
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1:connectInput()
end
u19.buildWalls = function(a1, a2)
    --[[
      name: buildWalls
      line: 403
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        u1 (copy, index: 3)
        tbl_upv_2 (copy, index: 4)
        tbl_upv_3 (copy, index: 5)
        tbl_upv_5 (copy, index: 6)
        tbl_upv_6 (copy, index: 7)
        u3 (copy, index: 8)
        tbl_upv_4 (copy, index: 9)
    ]]
    local v4 = 20260802
    local v5 = nil
    for _, value_1 in {-1, 1} do
        v5 = makeStagePart_upv_1(a2)
        v5.Size = Vector3.new(70, 400, 6)
        v5.Color = u5
        v5.CFrame = u1
        table.insert(a1.backingWalls, v5)
        for n_1 = 0, #tbl_upv_2 - 1 do
            local v6
            v6 = tbl_upv_2[n_1 + 1]
            local v7
            v7 = tbl_upv_3[n_1 + 1]
            for n_2 = 0, 7 do
                local v8 = tbl_upv_5[(n_2 % #tbl_upv_5) + 1]
                v4 = v4 * 48271 % 2147483647
                local v9 = 2.4 + ((v4 - 1) / 2147483647) * 5.2
                v4 = v4 * 48271 % 2147483647
                v4 = v4 * 48271 % 2147483647
                local v10 = makeStagePart_upv_1(a2)
                v10.Size = Vector3.new(v9, 1.4 + (((v4 - 1) / 2147483647) * 4.4), 3 + (((n_2 - 1) / 2147483647) * 4))
                v4 = n_2 * 48271 % 2147483647
                v10.Color = tbl_upv_6[math.floor(((v4 - 1) / 2147483647) * #tbl_upv_6) + 1]:Lerp(u3, tbl_upv_4[n_1 + 1])
                table.insert(a1.wallParts, v10)
                v4 = v4 * 48271 % 2147483647
                table.insert(a1.wallBaseY, ((v4 - 1) / 2147483647) * v8)
                table.insert(a1.wallBand, v8)
                table.insert(a1.wallShift, math.huge)
                v4 = v4 * 48271 % 2147483647
                local v11 = n_2 * 48271 % 2147483647
                v10.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_1 * ((v7 + (v9 / 2)) + (((n_2 - 1) / 2147483647) * 4)), -1000, v6 + (((v11 - 1) / 2147483647) * 2)))
                v4 = v11
            end
            local v12
        end
    end
end
u19.buildGates = function(a1, a2)
    --[[
      name: buildGates
      line: 446
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
        u1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u7 (copy, index: 5)
    ]]
    for _ = 0, 7 do
        local v12 = makeStagePart_upv_1(a2)
        local v13 = makeStagePart_upv_1(a2)
        for v16, value_2 in {v12, v13} do
            value_2.Size = Vector3.new(1, 2.5, 9)
            value_2.Color = u6
            value_2.CFrame = u1
            value_2.Transparency = 1
        end
        local v14 = makeSmoothPart_upv_1(a2)
        local v15 = makeSmoothPart_upv_1(a2)
        for v17, value_3 in {v14, v15} do
            value_3.Size = Vector3.new(1, 1, 9.800000190734863)
            value_3.Color = u7
            value_3.CFrame = u1
            value_3.Transparency = 1
        end
        table.insert(a1.gates, {leftSlab = v12, rightSlab = v13, leftLip = v14, rightLip = v15})
    end
end
u19.buildSplats = function(a1, a2)
    --[[
      name: buildSplats
      line: 474
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    for _ = 0, 7 do
        local v16 = makeSmoothPart_upv_1(a2)
        v16.Size = Vector3.new(JELLY_JUMP_CONFIG_upv_1.jellySizeStuds * 0.82, 0.2, 4)
        v16.Color = u11
        v16.Transparency = 1
        v16.CFrame = u1
        table.insert(a1.splats, v16)
    end
end
u19.buildDroplets = function(a1, a2)
    --[[
      name: buildDroplets
      line: 485
      upvalues:
        makeEllipsoidPart_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    for _ = 0, 2 do
        local v17 = makeEllipsoidPart_upv_1(a2)
        v17.Size = Vector3.new(1.7000000476837158, 2.200000047683716, 1.7000000476837158)
        v17.Color = u15
        v17.Material = Enum.Material.Neon
        v17.Transparency = 1
        v17.CFrame = u1
        table.insert(a1.droplets, v17)
    end
end
u19.buildLiquid = function(a1, a2)
    --[[
      name: buildLiquid
      line: 497
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
        u1 (copy, index: 3)
        u13 (copy, index: 4)
        u14 (copy, index: 5)
    ]]
    a1.liquidSlab = makeSmoothPart_upv_1(a2)
    a1.liquidSlab.Size = Vector3.new(240, 400, 34)
    a1.liquidSlab.Color = u12
    a1.liquidSlab.CFrame = u1
    for n_3 = 0, 14 do
        local v18 = makeSmoothPart_upv_1(a2)
        v18.Size = Vector3.new(7.2, (n_3 * 0.03) + 1.8, (n_3 * 0.04) + 34.6)
        v18.Color = u13
        v18.CFrame = u1
        table.insert(a1.surfaceBobbles, v18)
        local v19 = makeSmoothPart_upv_1(a2)
        v19.Size = Vector3.new(6.9, (n_3 * 0.01) + 0.34, (n_3 * 0.03) + 3.2)
        v19.Color = u14
        v19.CFrame = u1
        table.insert(a1.surfaceFoam, v19)
    end
end
u19.buildJelly = function(a1, a2)
    --[[
      name: buildJelly
      line: 524
      upvalues:
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        u1 (copy, index: 4)
        u9 (copy, index: 5)
        u10 (copy, index: 6)
    ]]
    local jellySizeStuds_1 = JELLY_JUMP_CONFIG_upv_1.jellySizeStuds
    a1.jellyBody = makeSmoothPart_upv_1(a2)
    a1.jellyBody.Size = Vector3.new(jellySizeStuds_1, jellySizeStuds_1, jellySizeStuds_1)
    a1.jellyBody.Color = u8
    a1.jellyBody.CFrame = u1
    a1.jellyShine = makeSmoothPart_upv_1(a2)
    a1.jellyShine.Size = Vector3.new(0.8999999761581421, 0.4399999976158142, 0.30000001192092896)
    a1.jellyShine.Color = u9
    a1.jellyShine.CFrame = u1
    a1.jellyEyeLeft = makeSmoothPart_upv_1(a2)
    a1.jellyEyeRight = makeSmoothPart_upv_1(a2)
    for _, value_4 in {a1.jellyEyeLeft, a1.jellyEyeRight} do
        value_4.Size = Vector3.new(0.4399999976158142, 0.6200000047683716, 0.3199999928474426)
        value_4.Color = u10
        value_4.CFrame = u1
    end
end
u19.connectInput = function(a1)
    --[[
      name: connectInput
      line: 542
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        pausedAtom_upv_1 (copy, index: 2)
        clearJumpBuffer_upv_1 (copy, index: 3)
    ]]
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 543
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPress()
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            pausedAtom_upv_1,
            function()
                --[[
                  line: 546
                  upvalues:
                    clearJumpBuffer_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                return clearJumpBuffer_upv_1(a1.run)
            end
        )
    )
end
u19.onPress = function(a1)
    --[[
      name: onPress
      line: 550
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        pressJump_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
    ]]
    if not (pausedAtom_upv_1()) and a1:isRunning() then
        pressJump_upv_1(a1.run, tbl_upv_1)
    else
        return nil
    end
end
u19.resetRound = function(a1)
    --[[
      name: resetRound
      line: 556
      upvalues:
        resetRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        restYForLevel_upv_1 (copy, index: 3)
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 4)
    ]]
    resetRun_upv_1(a1.run, tbl_upv_1, a1.context.getRunSeed())
    a1.hasEnded = false
    a1.fallThroughs = 0
    a1.squashClock = 99
    a1:seedRenderHistory()
    a1.cameraY = restYForLevel_upv_1(0, tbl_upv_1) + JELLY_JUMP_CONFIG_upv_1.cameraLeadStuds
    a1.lastFrameCenterY = math.huge
    a1.lastBackdropY = math.huge
    a1:parkSplats()
    a1.popups:hideAll()
    a1.context.reportScore(0)
end
u19.revive = function(a1)
    --[[
      name: revive
      line: 570
      upvalues:
        reviveRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        restYForLevel_upv_1 (copy, index: 3)
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 4)
    ]]
    reviveRun_upv_1(a1.run, tbl_upv_1)
    a1.hasEnded = false
    a1.squashClock = 0
    a1:seedRenderHistory()
    a1.cameraY = restYForLevel_upv_1(a1.run.highestLevel, tbl_upv_1) + JELLY_JUMP_CONFIG_upv_1.cameraLeadStuds
    a1:setRunning(true)
end
u19.seedRenderHistory = function(a1)
    --[[
      name: seedRenderHistory
      line: 578
    ]]
    a1.renderPreviousY = a1.run.y
    a1.renderPreviousLiquidY = a1.run.liquidY
    a1.renderPreviousElapsed = a1.run.elapsed
end
u19.captureRound = function(a1)
    --[[
      name: captureRound
      line: 583
    ]]
    return nil
end
u19.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 586
    ]]
    return false
end
u19.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 589
      upvalues:
        stepRun_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.renderPreviousY = a1.run.y
    a1.renderPreviousLiquidY = a1.run.liquidY
    a1.renderPreviousElapsed = a1.run.elapsed
    local v20 = stepRun_upv_1(a1.run, tbl_upv_1, a2)
    a1.squashClock = a1.squashClock + a2
    a1.idleClock = a1.idleClock + a2
    if a1.run.dropletTakenThisStep then
        a1:onDroplet()
    end
    if v20 == "none" then
        return
    end
    a1:onEvent(v20)
end
u19.onEvent = function(a1, a2)
    --[[
      name: onEvent
      line: 603
    ]]
    if a2 == "jumped" then
        a1.context.audio.play("pop", {})
        return nil
    elseif a2 == "passed" then
        a1:onPassed()
        return nil
    elseif a2 == "landed" then
        a1:onLanded()
        return nil
    elseif a2 == "settled" then
        a1.squashClock = 0
        a1.context.audio.play("thud", {})
        return nil
    elseif a2 ~= "fellThrough" then
        a1:onDeath(a2)
    else
        a1:onFellThrough()
        return nil
    end
end
u19.onPassed = function(a1)
    --[[
      name: onPassed
      line: 635
      upvalues:
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
    ]]
    if (JELLY_JUMP_CONFIG_upv_1.jellySizeStuds + JELLY_JUMP_CONFIG_upv_1.clearanceStuds) + JELLY_JUMP_CONFIG_upv_1.clutchGapMarginStuds >= a1.run.lastClearGap then
        a1.stage.shake(JELLY_JUMP_CONFIG_upv_1.clutchShake)
        a1.context.audio.play("perfect", {})
        a1.popups:show(a1:worldAt(a1.run.y + 3.4), "CLUTCH!", u16, 1)
    else
        a1.context.audio.play("whoosh", {})
        return nil
    end
end
u19.onLanded = function(a1)
    --[[
      name: onLanded
      line: 651
      upvalues:
        planeYForLevel_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 3)
        u16 (copy, index: 4)
    ]]
    a1.squashClock = 0
    a1.context.reportScore(a1.run.highestLevel)
    a1:placeSplat((planeYForLevel_upv_1(a1.run.groundedLevel, tbl_upv_1)))
    a1.stage.shake(JELLY_JUMP_CONFIG_upv_1.landShake)
    a1:hitStop(JELLY_JUMP_CONFIG_upv_1.landHitStopSeconds)
    a1.context.audio.play("hopStep", {})
    if a1.run.highestLevel <= 0 or a1.run.highestLevel % 10 ~= 0 then
        return
    end
    a1.popups:show(a1:worldAt(a1.run.y + 4.2), ("%*"):format(a1.run.highestLevel), u16, 1.25)
    a1.context.audio.play("scorePing", {})
end
u19.onFellThrough = function(a1)
    --[[
      name: onFellThrough
      line: 669
      upvalues:
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    a1.fallThroughs = a1.fallThroughs + 1
    a1.stage.shake(JELLY_JUMP_CONFIG_upv_1.landShake)
    a1.context.audio.play("buzz", {})
    a1.popups:show(a1:worldAt(a1.run.y + 2.6), "TOO SOON!", u17, 0.95)
end
u19.onDroplet = function(a1)
    --[[
      name: onDroplet
      line: 678
      upvalues:
        u18 (copy, index: 1)
    ]]
    a1.context.reportPickup(a1.run.droplets)
    a1.context.audio.play("coinTick", {})
    a1.popups:show(a1:worldAt(a1.run.y + 2.2), "+1", u18, 0.85)
end
u19.onDeath = function(a1, a2)
    --[[
      name: onDeath
      line: 686
      upvalues:
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    if a1.hasEnded then
        return nil
    end
    a1.hasEnded = true
    a1.stage.shake(JELLY_JUMP_CONFIG_upv_1.deathShake)
    a1.splashAnchor.CFrame = CFrame.new(a1:worldAt(a1.run.y))
    a1.splashBurst:Emit(18)
    if a2 == "pinched" then
        a1.context.audio.play("metalClank", {})
        a1.popups:show(a1:worldAt(a1.run.y + 3), "CRUSHED!", u17, 1.15)
    elseif a2 ~= "sealed" then
        a1.context.audio.play("splash", {})
        a1.popups:show(a1:worldAt(a1.run.y + 3), "DROWNED!", u17, 1.15)
    else
        a1.context.audio.play("thud", {})
        a1.popups:show(a1:worldAt(a1.run.y + 3), "SEALED!", u17, 1.15)
    end
    a1.context.endRun(a1.run.highestLevel)
end
u19.render = function(a1, a2)
    --[[
      name: render
      line: 714
    ]]
    a1:draw(a2)
end
u19.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 717
    ]]
    a1:draw(a2)
end
u19.draw = function(a1, a2)
    --[[
      name: draw
      line: 720
      upvalues:
        lerp_upv_1 (copy, index: 1)
    ]]
    a1.surfaceClock = a1.surfaceClock + a2
    if not (a1:isRunning()) then
        a1.idleClock = a1.idleClock + a2
    end
    local renderAlpha_1 = a1.renderAlpha
    local v21 = lerp_upv_1(a1.renderPreviousElapsed, a1.run.elapsed, renderAlpha_1)
    local v22 = lerp_upv_1(a1.renderPreviousY, a1.run.y, renderAlpha_1)
    local v23 = lerp_upv_1(a1.renderPreviousLiquidY, a1.run.liquidY, renderAlpha_1)
    a1:updateCamera(a2)
    a1:updateWalls()
    a1:drawGates(v21)
    a1:drawDroplets()
    a1:drawJelly(v22)
    a1:drawLiquid(v23)
end
u19.updateCamera = function(a1, a2)
    --[[
      name: updateCamera
      line: 736
      upvalues:
        restYForLevel_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.cameraY = a1.cameraY + (((restYForLevel_upv_1(a1:anchorLevel(), tbl_upv_1) + JELLY_JUMP_CONFIG_upv_1.cameraLeadStuds) - a1.cameraY) * math.min(a2 * JELLY_JUMP_CONFIG_upv_1.cameraFollowRate, 1))
    if math.abs(a1.cameraY - a1.lastFrameCenterY) > 0.002 then
        a1.lastFrameCenterY = a1.cameraY
        a1.stage.setFrameCenter(Vector2.new(0, a1.cameraY))
    end
    if math.abs(a1.cameraY - a1.lastBackdropY) > 0.5 then
        a1.lastBackdropY = a1.cameraY
        local origin_1 = a1.stage.origin
        a1.backdrop.CFrame = CFrame.new(origin_1 + Vector3.new(0, a1.cameraY, -36))
        for n_4 = 0, #a1.backingWalls - 1 do
            a1.backingWalls[n_4 + 1].CFrame = CFrame.new(origin_1 + Vector3.new((((n_4 ~= 0) and 1) or -1) * 46.4, a1.cameraY, -30))
        end
    else
        return nil
    end
end
u19.updateWalls = function(a1)
    --[[
      name: updateWalls
      line: 759
    ]]
    local origin_2 = a1.stage.origin
    for n_5 = 0, #a1.wallParts - 1 do
        local v24 = a1.wallBand[n_5 + 1]
        local v25 = a1.wallBaseY[n_5 + 1]
        local v26
        v26 = math.floor(((a1.cameraY - v25) / v24) + 0.5)
        if v26 ~= a1.wallShift[n_5 + 1] then
            a1.wallShift[n_5 + 1] = v26
            local v27 = a1.wallParts[n_5 + 1]
            local Position_1 = v27.Position
            v27.CFrame = CFrame.new(Vector3.new(Position_1.X, (origin_2.Y + v25) + (v26 * v24), Position_1.Z))
        end
    end
end
u19.drawGates = function(a1, a2)
    --[[
      name: drawGates
      line: 774
      upvalues:
        findGate_upv_1 (copy, index: 1)
        gateGap_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 4)
        planeYForLevel_upv_1 (copy, index: 5)
        u2 (copy, index: 6)
    ]]
    local origin_3 = a1.stage.origin
    local v28 = a1:anchorLevel()
    local v29 = math.max(v28 - 1, 0)
    for n_6 = 0, 7 do
        local v30 = a1.gates[n_6 + 1]
        local v31 = v29 + n_6
        local v32
        v32 = findGate_upv_1(a1.run, v31)
        if v32 == nil then
            a1:parkGate(v30)
            continue
        end
        local v33 = gateGap_upv_1(v32, a2, tbl_upv_1)
        local v34
        v34 = (JELLY_JUMP_CONFIG_upv_1.shaftWidthStuds - v33) / 2
        if v34 >= 0.55 then
            local v35 = planeYForLevel_upv_1(v31, tbl_upv_1)
            local v36 = v34 - 0.45
            local v37 = u2 - v36 / 2
            local v38 = Vector3.new(v36, 2.5, 9)
            local v39 = v35 - 0.05 - 1.25
            v30.leftSlab.Transparency = 0
            v30.leftSlab.Size = v38
            v30.leftSlab.CFrame = CFrame.new(origin_3 + Vector3.new(-v37, v39, 0))
            v30.rightSlab.Transparency = 0
            v30.rightSlab.Size = v38
            v30.rightSlab.CFrame = CFrame.new(origin_3 + Vector3.new(v37, v39, 0))
            local v40 = math.min(v34 - 0.06, 1.5)
            local v41 = v33 / 2 + v40 / 2
            local v42 = Vector3.new(v40, 1, 9.8)
            local v43 = v35 - 0.5
            v30.leftLip.Transparency = 0
            v30.leftLip.Size = v42
            v30.leftLip.CFrame = CFrame.new(origin_3 + Vector3.new(-v41, v43, 0))
            v30.rightLip.Transparency = 0
            v30.rightLip.Size = v42
            v30.rightLip.CFrame = CFrame.new(origin_3 + Vector3.new(v41, v43, 0))
            continue
        end
        if v31 ~= v28 + 2 then
            a1:parkGate(v30)
        else
            a1:drawGateTell(v30, v32, a2)
        end
    end
end
u19.drawGateTell = function(a1, a2, a3, a4)
    --[[
      name: drawGateTell
      line: 830
      upvalues:
        u1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        planeYForLevel_upv_1 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
    ]]
    if a2.leftSlab.Transparency < 1 then
        a2.leftSlab.Transparency = 1
        a2.leftSlab.CFrame = u1
        a2.rightSlab.Transparency = 1
        a2.rightSlab.CFrame = u1
    end
    local v44 = 0.5 - math.cos((((a4 / a3.closeSeconds) * 1.5) * math.pi) * 2) * 0.5
    local v45 = lerp_upv_1(0.22, 0.5, v44)
    local v46 = lerp_upv_1(0.58, 0.2, v44)
    local v47 = u2 - v45 / 2
    local v48 = planeYForLevel_upv_1(a3.index, tbl_upv_1) - 0.5
    local v49 = Vector3.new(v45, 1, 9.8)
    local origin_4 = a1.stage.origin
    a2.leftLip.Transparency = v46
    a2.leftLip.Size = v49
    a2.leftLip.CFrame = CFrame.new(origin_4 + Vector3.new(-v47, v48, 0))
    a2.rightLip.Transparency = v46
    a2.rightLip.Size = v49
    a2.rightLip.CFrame = CFrame.new(origin_4 + Vector3.new(v47, v48, 0))
end
u19.parkGate = function(a1, a2)
    --[[
      name: parkGate
      line: 855
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a2.leftSlab.Transparency >= 1 and a2.leftLip.Transparency >= 1 then
        return nil
    end
    for _, value_5 in {a2.leftSlab, a2.rightSlab, a2.leftLip, a2.rightLip} do
        value_5.Transparency = 1
        value_5.CFrame = u1
    end
end
u19.drawDroplets = function(a1)
    --[[
      name: drawDroplets
      line: 864
      upvalues:
        findGate_upv_1 (copy, index: 1)
        dropletYForLevel_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local origin_5 = a1.stage.origin
    local v50 = a1:anchorLevel()
    local v51 = math.sin(a1.surfaceClock * 2.4) * 0.35
    local v52 = 0
    local v53 = false
    local v54
    v54 = v50
    if v53 then
        v54 = v54 + 1
    else
        v53 = true
    end
    local v57 = nil
    if v54 < v50 + 8 then
        if v52 < 3 then
            v57 = findGate_upv_1(a1.run, v54)
            if v57 ~= nil and v57.hasDroplet and not (v57.dropletTaken) then
                local v56 = a1.droplets[v52 + 1]
                v56.Transparency = 0
                v56.CFrame = CFrame.new(origin_5 + Vector3.new(0, dropletYForLevel_upv_1(v54, tbl_upv_1) + v51, 0))
                v52 = v52 + 1
            end
            if v53 then
                v54 = v54 + 1
            else
                v53 = true
            end
            --[[ goto label_3 ]]--
        end
    end
    v53, v54 = false, v52
    if v53 then
        v54 = v54 + 1
    else
        v53 = true
    end
    if v54 < 3 then
        v57 = a1.droplets[v54 + 1]
        if v57.Transparency < 1 then
            v57.Transparency = 1
            v57.CFrame = u1
        end
        if v53 then
            v54 = v54 + 1
        else
            v53 = true
        end
        --[[ goto label_7 ]]--
    end
end
u19.drawJelly = function(a1, a2)
    --[[
      name: drawJelly
      line: 913
      upvalues:
        JELLY_JUMP_CONFIG_upv_1 (copy, index: 1)
    ]]
    local jellySizeStuds_2 = JELLY_JUMP_CONFIG_upv_1.jellySizeStuds
    local v58, v59, v60
    if a1.run.status ~= "pinched" then
        if a1.run.groundedLevel >= 0 or a1.run.status ~= "climbing" then
            v59 = math.clamp(1 - JELLY_JUMP_CONFIG_upv_1.jellyLandSquash * (math.exp(-a1.squashClock * JELLY_JUMP_CONFIG_upv_1.jellySquashDecay) * math.cos(a1.squashClock * JELLY_JUMP_CONFIG_upv_1.jellySquashWobbleHz * math.pi * 2)) + math.sin(a1.idleClock * JELLY_JUMP_CONFIG_upv_1.jellyIdleHz * math.pi * 2) * JELLY_JUMP_CONFIG_upv_1.jellyIdleJiggle, 0.45, 1.6)
        else
            v59 = 1 + math.clamp(a1.run.velocityY / JELLY_JUMP_CONFIG_upv_1.jumpSpeed, -1, 1) * JELLY_JUMP_CONFIG_upv_1.jellyStretchGain
        end
        v58 = 1 / math.sqrt(v59)
        v60 = v58
    else
        v58 = math.clamp(a1.run.lastClearGap / jellySizeStuds_2, 0.12, 1)
        local v61 = math.min(1 / math.sqrt(v58), 1.75)
        v59, v60 = v61, v61
    end
    local v62 = jellySizeStuds_2 * v59
    local v63 = jellySizeStuds_2 * v60
    local origin_6 = a1.stage.origin
    local v64 = a2 - (jellySizeStuds_2 / 2) + v62 / 2
    a1.jellyBody.Size = Vector3.new(jellySizeStuds_2 * v58, v62, v63)
    a1.jellyBody.CFrame = CFrame.new(origin_6 + Vector3.new(0, v64, 0))
    local v65 = 0 + v63 / 2
    a1.jellyEyeLeft.Size = Vector3.new(v58 * 0.44, v59 * 0.62, 0.32)
    a1.jellyEyeRight.Size = a1.jellyEyeLeft.Size
    local v66 = v64 + v59 * 0.18
    a1.jellyEyeLeft.CFrame = CFrame.new(origin_6 + Vector3.new(v58 * -0.66, v66, v65 + 0.05))
    a1.jellyEyeRight.CFrame = CFrame.new(origin_6 + Vector3.new(v58 * 0.66, v66, v65 + 0.05))
    a1.jellyShine.Size = Vector3.new(v58 * 0.9, v59 * 0.44, 0.3)
    a1.jellyShine.CFrame = CFrame.new(origin_6 + Vector3.new(v58 * -0.62, v64 + (v59 * 0.95), v65 + 0.02))
end
u19.drawLiquid = function(a1, a2)
    --[[
      name: drawLiquid
      line: 967
    ]]
    local origin_7 = a1.stage.origin
    a1.liquidSlab.CFrame = CFrame.new(origin_7 + Vector3.new(0, a2 - 200, -6))
    for n_7 = 0, 14 do
        local v67 = n_7 * 6.6 + -46.199999999999996
        local v68 = a2 + math.sin((a1.surfaceClock * 1.9) + (n_7 * 0.85)) * 0.42
        a1.surfaceBobbles[n_7 + 1].CFrame = CFrame.new(origin_7 + Vector3.new(v67, v68, -6))
        a1.surfaceFoam[n_7 + 1].CFrame = CFrame.new(origin_7 + Vector3.new(v67, (v68 + ((((n_7 * 0.03) + 1.8) - ((n_7 * 0.01) + 0.34)) / 2)) + 0.06, (-6 - ((((n_7 * 0.04) + 34.6) - ((n_7 * 0.03) + 3.2)) / 2)) - 0.3))
    end
end
u19.placeSplat = function(a1, a2)
    --[[
      name: placeSplat
      line: 990
    ]]
    local v69 = a1.splats[a1.splatCursor + 1]
    a1.splatCursor = (a1.splatCursor + 1) % 8
    v69.Transparency = 0.15
    v69.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, a2 + 0.04, 0))
end
u19.parkSplats = function(a1)
    --[[
      name: parkSplats
      line: 1000
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_6 in a1.splats do
        value_6.Transparency = 1
        value_6.CFrame = u1
    end
    a1.splatCursor = 0
end
u19.worldAt = function(a1, a2)
    --[[
      name: worldAt
      line: 1007
    ]]
    return a1.stage.origin + Vector3.new(0, a2, 0)
end
u19.anchorLevel = function(a1)
    --[[
      name: anchorLevel
      line: 1012
    ]]
    if a1.run.groundedLevel < 0 then
        return (math.max(a1.run.launchLevel, 0))
    end
    return a1.run.groundedLevel
end
local tbl_9 = {}
tbl_9.JellyJumpGame = u19
return tbl_9