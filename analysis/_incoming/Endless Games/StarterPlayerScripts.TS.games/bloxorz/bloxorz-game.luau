-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local portraitCameraDistance_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "camera-framing").portraitCameraDistance
local HeartPipRow_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "heart-pips").HeartPipRow
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local currentScoreBandBottomPx_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "score-band").currentScoreBandBottomPx
local BLOXORZ_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "bloxorz-config").BLOXORZ_CONFIG
local generateLevel_upv_1 = RuntimeLib_1.import(script, script.Parent, "bloxorz-levels").generateLevel
local v2 = RuntimeLib_1.import(script, script.Parent, "bloxorz-sim")
local applyRoll_upv_1 = v2.applyRoll
local cellKey_upv_1 = v2.cellKey
local freshAttempt_upv_1 = v2.freshAttempt
local occupiedCells_upv_1 = v2.occupiedCells
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(222, 222, 226)
local u3 = Color3.fromRGB(164, 164, 174)
local u4 = Color3.fromRGB(230, 148, 58)
local u5 = Color3.fromRGB(148, 84, 34)
local u6 = Color3.fromRGB(186, 198, 214)
local u7 = Color3.fromRGB(34, 32, 40)
local u8 = Color3.fromRGB(242, 242, 246)
local u9 = Color3.fromRGB(118, 140, 164)
local u10 = Color3.fromRGB(158, 118, 104)
local u11 = Color3.fromRGB(148, 86, 52)
local u12 = Color3.fromRGB(128, 72, 44)
local u13 = Color3.fromRGB(88, 48, 28)
local u14 = Color3.fromRGB(126, 32, 24)
local u15 = Color3.fromRGB(164, 52, 36)
local u16 = Color3.fromRGB(86, 156, 255)
local u17 = Color3.fromRGB(96, 104, 132)
local u18 = Color3.fromRGB(255, 216, 102)
local u19 = Color3.fromRGB(245, 245, 255)
local u20 = Color3.fromRGB(255, 92, 80)
local function quadInOut_1(a1)
    --[[
      name: quadInOut
      line: 67
    ]]
    if a1 >= 0.5 then
        return 1 - ((((-2 * a1) + 2) ^ 2) / 2)
    end
    return (2 * a1) * a1
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 82
    ]]
    return "BloxorzGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u21 = setmetatable(tbl_1, tbl_2)
u21.__index = u21
u21.new = function(...)
    --[[
      name: new
      line: 88
      upvalues:
        u21 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u21)
    return v3:constructor(...) or v3
end
u21.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 92
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        BLOXORZ_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = BLOXORZ_CONFIG_upv_1.livesPerRun
    a1.falls = 0
    a1.centerX = 0
    a1.centerY = 0
    a1.boardExtent = 6
    a1.roundToken = 0
    a1.tileDrops = {}
    a1.inputHeld = false
    a1.tilePlates = {}
    a1.tileUnders = {}
    a1.crackParts = {}
    a1.softSwitchParts = {}
    a1.heavySwitchParts = {}
    a1.goalRims = {}
    a1.heartParts = {}
    a1.livesRowHalfHeight = 0.3
    a1.bridgeTileIndex = {}
    a1.fragileTileIndex = {}
    a1.fragileCrackParts = {}
    a1.shownBridges = {}
    a1.lastViewportX = -1
    a1.lastViewportY = -1
    a1.cameraCFrame = CFrame.new()
end
u21.buildScene = function(a1)
    --[[
      name: buildScene
      line: 119
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
        BLOXORZ_CONFIG_upv_1 (copy, index: 3)
        u15 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        u3 (copy, index: 7)
        u5 (copy, index: 8)
        u9 (copy, index: 9)
        u10 (copy, index: 10)
        u7 (copy, index: 11)
        u8 (copy, index: 12)
        HeartPipRow_upv_1 (copy, index: 13)
        u17 (copy, index: 14)
        u16 (copy, index: 15)
        u11 (copy, index: 16)
        u12 (copy, index: 17)
        u13 (copy, index: 18)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 19)
        u18 (copy, index: 20)
        PopupTextPool_upv_1 (copy, index: 21)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    local v4 = makeSmoothPart_upv_1(container_1)
    v4.Size = Vector3.new(600, 1, 600)
    v4.Color = u14
    v4.CFrame = CFrame.new(origin_1 + Vector3.new(0, -18, 0))
    local Unit_1 = Vector3.new(BLOXORZ_CONFIG_upv_1.cameraLookDirection.X, 0, BLOXORZ_CONFIG_upv_1.cameraLookDirection.Z).Unit
    local v5 = makeSmoothPart_upv_1(container_1)
    v5.Size = Vector3.new(700, 300, 1)
    v5.Color = u15
    v5.CFrame = CFrame.lookAt(origin_1 + (Unit_1 * 120), origin_1 + (Unit_1 * 121))
    for _ = 0, 142 do
        local v6 = makeStagePart_upv_1(container_1)
        v6.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.tileSize, BLOXORZ_CONFIG_upv_1.tileThickness, BLOXORZ_CONFIG_upv_1.tileSize)
        v6.CFrame = u1
        table.insert(a1.tilePlates, v6)
        local v7 = makeSmoothPart_upv_1(container_1)
        v7.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.tileSize - 0.4, 1.4, BLOXORZ_CONFIG_upv_1.tileSize - 0.4)
        v7.Color = u3
        v7.CFrame = u1
        table.insert(a1.tileUnders, v7)
    end
    for _ = 0, 11 do
        local v8 = makeSmoothPart_upv_1(container_1)
        v8.Size = Vector3.new(1.7999999523162842, 0.05999999865889549, 0.2800000011920929)
        v8.Color = u5
        v8.CFrame = u1
        table.insert(a1.crackParts, v8)
    end
    for _ = 0, 3 do
        local v9 = makeSmoothPart_upv_1(container_1)
        v9.Shape = Enum.PartType.Cylinder
        v9.Size = Vector3.new(0.3499999940395355, 1.899999976158142, 1.899999976158142)
        v9.Color = u9
        v9.CFrame = u1
        table.insert(a1.softSwitchParts, v9)
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Size = Vector3.new(2.0999999046325684, 0.30000001192092896, 0.550000011920929)
        v10.Color = u10
        v10.CFrame = u1
        local v11 = makeSmoothPart_upv_1(container_1)
        v11.Size = Vector3.new(2.0999999046325684, 0.30000001192092896, 0.550000011920929)
        v11.Color = u10
        v11.CFrame = u1
        table.insert(a1.heavySwitchParts, {a = v10, b = v11})
    end
    a1.goalSocket = makeSmoothPart_upv_1(container_1)
    a1.goalSocket.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.tileSize, BLOXORZ_CONFIG_upv_1.tileThickness, BLOXORZ_CONFIG_upv_1.tileSize)
    a1.goalSocket.Color = u7
    a1.goalSocket.CFrame = u1
    for _ = 0, 3 do
        local v12 = makeSmoothPart_upv_1(container_1)
        v12.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.tileSize, 0.14, 0.3)
        v12.Color = u8
        v12.CFrame = u1
        table.insert(a1.goalRims, v12)
    end
    a1.heartRow = HeartPipRow_upv_1:tryCreate(container_1, {count = BLOXORZ_CONFIG_upv_1.livesPerRun, spentColor = u17, aliveColor = u16})
    if a1.heartRow == nil then
        for _ = 0, BLOXORZ_CONFIG_upv_1.livesPerRun - 1 do
            local v13 = makeStagePart_upv_1(container_1)
            v13.Size = Vector3.new(0.6200000047683716, 0.6200000047683716, 0.25)
            v13.Color = u16
            v13.CFrame = u1
            table.insert(a1.heartParts, v13)
        end
        a1.livesRowHalfHeight = 0.31
    else
        a1.livesRowHalfHeight = a1.heartRow.heightStuds / 2
    end
    a1.blockModel = Instance.new("Model")
    local v14 = makeStagePart_upv_1(a1.blockModel)
    v14.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.blockWidth, BLOXORZ_CONFIG_upv_1.blockWidth, BLOXORZ_CONFIG_upv_1.blockWidth)
    v14.Color = u11
    v14.CFrame = CFrame.new(0, -BLOXORZ_CONFIG_upv_1.blockWidth / 2, 0)
    v14.PivotOffset = CFrame.new(0, BLOXORZ_CONFIG_upv_1.blockWidth / 2, 0)
    local v15 = makeStagePart_upv_1(a1.blockModel)
    v15.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.blockWidth, BLOXORZ_CONFIG_upv_1.blockWidth, BLOXORZ_CONFIG_upv_1.blockWidth)
    v15.Color = u12
    v15.CFrame = CFrame.new(0, BLOXORZ_CONFIG_upv_1.blockWidth / 2, 0)
    local v16 = makeSmoothPart_upv_1(a1.blockModel)
    v16.Size = Vector3.new(BLOXORZ_CONFIG_upv_1.blockWidth + 0.06, 0.22, BLOXORZ_CONFIG_upv_1.blockWidth + 0.06)
    v16.Color = u13
    v16.CFrame = CFrame.new(0, 0, 0)
    a1.blockModel.PrimaryPart = v14
    a1.blockModel.Parent = container_1
    a1.sparkBurst = Instance.new("ParticleEmitter")
    a1.sparkBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.sparkBurst.Rate = 0
    a1.sparkBurst.Lifetime = NumberRange.new(0.3, 0.6)
    a1.sparkBurst.Speed = NumberRange.new(6, 12)
    a1.sparkBurst.SpreadAngle = Vector2.new(180, 180)
    a1.sparkBurst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.12)})
    a1.sparkBurst.Color = ColorSequence.new(u18)
    a1.sparkBurst.Parent = v15
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a2)
                --[[
                  line: 249
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a2)
            end
        )
    )
end
u21.resetRound = function(a1)
    --[[
      name: resetRound
      line: 253
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = BLOXORZ_CONFIG_upv_1.livesPerRun
    a1.falls = 0
    a1.rollAnimation = nil
    a1.blockFall = nil
    a1.goalSink = nil
    a1.bufferedDirection = nil
    while #a1.tileDrops > 0 do
        local tileDrops_1 = a1.tileDrops
        tileDrops_1[#tileDrops_1] = nil
    end
    a1:loadLevel()
    a1.context.reportScore(0)
end
u21.fixedUpdate = function(a1)
    --[[
      name: fixedUpdate
      line: 269
    ]]
end
u21.render = function(a1, a2)
    --[[
      name: render
      line: 272
    ]]
    a1:updateCamera()
    a1:advanceAnimations(a2)
end
u21.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 276
    ]]
    a1:advanceAnimations(a2)
end
u21.revive = function(a1)
    --[[
      name: revive
      line: 279
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = BLOXORZ_CONFIG_upv_1.livesPerRun
    a1:resetAttempt()
    a1:updateHearts()
    a1:setRunning(true)
end
u21.captureRound = function(a1)
    --[[
      name: captureRound
      line: 286
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u21.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 291
    ]]
    local v17 = string.split(a2.state, "|")
    if #v17 == 3 then
        local v18 = nil
        if v17[1] == "1" then
            v18 = tonumber(v17[2])
            local num_1 = tonumber(v17[3])
            if v18 ~= nil and num_1 ~= nil and v18 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v18)
                a1.lives = math.floor(num_1)
                a1:loadLevel()
                a1.context.reportScore(a2.score)
                return true
            end
            return false
        end
    end
    return false
end
u21.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 308
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        freshAttempt_upv_1 (copy, index: 2)
        u18 (copy, index: 3)
        u19 (copy, index: 4)
    ]]
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    a1.attempt = freshAttempt_upv_1(a1.generated.spec)
    a1.pose = a1.generated.spec.start
    a1.rollAnimation = nil
    a1.blockFall = nil
    a1.goalSink = nil
    a1.bufferedDirection = nil
    local spec_1 = a1.generated.spec
    local v19 = math.huge
    local v20 = -math.huge
    local v21 = math.huge
    local v22 = -math.huge
    local v23 = nil
    local v24 = nil
    for key_1 in spec_1.tiles do
        v23 = key_1 % spec_1.width
        v24 = math.floor(key_1 / spec_1.width)
        v19, v20, v21, v22 = math.min(v19, v23), math.max(v20, v23), math.min(v21, v24), math.max(v22, v24)
    end
    a1.centerX = (v19 + v20) / 2
    a1.centerY = (v21 + v22) / 2
    a1.boardExtent = math.max((v20 - v19) + 1, (v22 - v21) + 1)
    a1.lastViewportX = -1
    a1:dressBoard()
    a1:updateHearts()
    a1:poseBlockInstant()
    local origin_2 = a1.stage.origin
    a1.popups:show(origin_2 + Vector3.new(0, 8, 0), ("LEVEL %*"):format(a1.level), u18, 1.3)
    a1.popups:show(origin_2 + Vector3.new(0, 5.400000095367432, 0), ("PAR %*"):format(a1.generated.par), u19, 0.7)
end
u21.parkPooledPart = function(a1, a2)
    --[[
      name: parkPooledPart
      line: 345
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.CFrame = u1
    a2.Transparency = 0
end
u21.cellWorld = function(a1, a2, a3)
    --[[
      name: cellWorld
      line: 349
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_3 = a1.stage.origin
    return (Vector3.new(origin_3.X + ((a2 - a1.centerX) * BLOXORZ_CONFIG_upv_1.cellPitch), origin_3.Y, origin_3.Z + ((a3 - a1.centerY) * BLOXORZ_CONFIG_upv_1.cellPitch)))
end
u21.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 353
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u6 (copy, index: 3)
        u1 (copy, index: 4)
        u2 (copy, index: 5)
    ]]
    local spec_2 = a1.generated.spec
    table.clear(a1.bridgeTileIndex)
    table.clear(a1.fragileTileIndex)
    table.clear(a1.fragileCrackParts)
    while #a1.shownBridges > 0 do
        local shownBridges_1 = a1.shownBridges
        shownBridges_1[#shownBridges_1] = nil
    end
    for key_2, v25 in spec_2.bridgesInitiallyOpen do
        table.insert(a1.shownBridges, v25)
    end
    local v26 = 0
    local v27 = 0
    local v28 = 0
    local key_2 = 0
    v26, v28, key_2, v27 = nil, nil, nil, nil
    local v29 = nil
    local v30 = nil
    local v31 = nil
    local v32 = nil
    for key_3, value_1 in spec_2.tiles do
        v29 = a1:cellWorld(key_3 % spec_2.width, math.floor(key_3 / spec_2.width))
        if value_1.kind == "goal" then
            a1.goalSocket.CFrame = CFrame.new(v29 + Vector3.new(0, (-BLOXORZ_CONFIG_upv_1.tileThickness / 2) - 0.24, 0))
            local v33 = BLOXORZ_CONFIG_upv_1.tileSize / 2 - 0.15
            a1.goalRims[1].CFrame = CFrame.new(v29 + Vector3.new(0, -0.05, -v33))
            a1.goalRims[2].CFrame = CFrame.new(v29 + Vector3.new(0, -0.05, v33))
            a1.goalRims[3].CFrame = CFrame.new(v29 + Vector3.new(-v33, -0.05, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
            a1.goalRims[4].CFrame = CFrame.new(v29 + Vector3.new(v33, -0.05, 0)) * CFrame.Angles(0, 1.5707963267948966, 0)
            continue
        end
        if v26 >= 143 then
            continue
        end
        v30 = a1.tilePlates[v26 + 1]
        v31 = a1.tileUnders[v26 + 1]
        v30.Transparency = 0
        v30.CFrame = CFrame.new(v29 + Vector3.new(0, -BLOXORZ_CONFIG_upv_1.tileThickness / 2, 0))
        v31.Transparency = 0
        v31.CFrame = CFrame.new(v29 + Vector3.new(0, -BLOXORZ_CONFIG_upv_1.tileThickness - 0.7, 0))
        if value_1.kind == "fragile" then
            v30.Color = u4
            a1.fragileTileIndex[key_3] = v26
            if v27 < 11 then
                local v34 = a1.crackParts[v27 + 1]
                local v35 = a1.crackParts[v27 + 2]
                v34.Transparency = 0
                v35.Transparency = 0
                v34.CFrame = CFrame.new(v29 + Vector3.new(0.20000000298023224, 0.03999999910593033, 0.30000001192092896)) * CFrame.Angles(0, 0.4886921905584123, 0)
                v35.CFrame = CFrame.new(v29 + Vector3.new(-0.30000001192092896, 0.03999999910593033, -0.4000000059604645)) * CFrame.Angles(0, -0.8552113334772214, 0)
                a1.fragileCrackParts[key_3] = {v34, v35}
                v27 = v27 + 2
            end
        elseif value_1.kind ~= "bridge" then
            v30.Color = u2
            if value_1.kind ~= "softSwitch" or v28 >= 4 then
                if value_1.kind ~= "heavySwitch" then
                    v26 = v26 + 1
                    continue
                end
                if key_2 < 4 then
                    local v36 = a1.heavySwitchParts[key_2 + 1]
                    v36.a.CFrame = CFrame.new(v29 + Vector3.new(0, 0.18000000715255737, 0)) * CFrame.Angles(0, 0.7853981633974483, 0)
                    v36.b.CFrame = CFrame.new(v29 + Vector3.new(0, 0.18000000715255737, 0)) * CFrame.Angles(0, -0.7853981633974483, 0)
                    key_2 = key_2 + 1
                end
            else
                a1.softSwitchParts[v28 + 1].CFrame = CFrame.new(v29 + Vector3.new(0, 0.20000000298023224, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
                v28 = v28 + 1
            end
        else
            v30.Color = u6
            a1.bridgeTileIndex[key_3] = v26
            v32 = value_1.bridgeGroup
            if v32 == nil then
                v26 = v26 + 1
                continue
            end
            if a1.shownBridges[v32 + 1] ~= true then
                v30.CFrame = u1
                v31.CFrame = u1
            end
        end
        v26 = v26 + 1
    end
    local v37, v25
    v37, v25 = false, v26
    while true do
        if v37 then
            v25 = v25 + 1
        else
            v37 = true
        end
        if v25 >= 143 then
            break
        end
        a1:parkPooledPart(a1.tilePlates[v25 + 1])
        a1:parkPooledPart(a1.tileUnders[v25 + 1])
    end
    v37, v25 = false, v27
    while true do
        if v37 then
            v25 = v25 + 1
        else
            v37 = true
        end
        if v25 >= 12 then
            break
        end
        a1:parkPooledPart(a1.crackParts[v25 + 1])
    end
    v37, v25 = false, v28
    while true do
        if v37 then
            v25 = v25 + 1
        else
            v37 = true
        end
        if v25 >= 4 then
            break
        end
        a1.softSwitchParts[v25 + 1].CFrame = u1
    end
    v37, v25 = false, key_2
    while true do
        if v37 then
            v25 = v25 + 1
        else
            v37 = true
        end
        if v25 >= 4 then
            break
        end
        a1.heavySwitchParts[v25 + 1].a.CFrame = u1
        a1.heavySwitchParts[v25 + 1].b.CFrame = u1
    end
end
u21.poseLivesRow = function(a1, a2)
    --[[
      name: poseLivesRow
      line: 529
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
        currentScoreBandBottomPx_upv_1 (copy, index: 2)
    ]]
    local v38 = math.tan(math.rad(BLOXORZ_CONFIG_upv_1.fieldOfView) / 2) * 22
    local v39 = v38 * 2 / math.max(a2.Y, 1)
    local v40 = a1.cameraCFrame * CFrame.new(0, (v38 - (currentScoreBandBottomPx_upv_1() + 10) * v39) - a1.livesRowHalfHeight, -22)
    if a1.heartRow == nil then
        for n_1 = 0, #a1.heartParts - 1 do
            a1.heartParts[n_1 + 1].CFrame = v40 * CFrame.new((n_1 - (#a1.heartParts - 1) * 0.5) * 0.88, 0, 0)
        end
    else
        a1.heartRow:layout(v40.Position, 0.88, v40)
        return nil
    end
end
u21.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 548
      upvalues:
        u17 (copy, index: 1)
        u16 (copy, index: 2)
    ]]
    if a1.heartRow == nil then
        local v41 = nil
        for n_2 = 0, #a1.heartParts - 1 do
            local v42 = a1.lives <= n_2
            local v43 = a1.heartParts[n_2 + 1]
            if v42 then
                v41 = u17
            else
                v41 = u16
            end
            v43.Color = v41
            a1.heartParts[n_2 + 1].Transparency = (v42 and 0.25) or 0
        end
    else
        a1.heartRow:setRemaining(a1.lives)
        return nil
    end
end
u21.blockCFrameFor = function(a1, a2)
    --[[
      name: blockCFrameFor
      line: 559
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    local blockWidth_1 = BLOXORZ_CONFIG_upv_1.blockWidth
    if a2.orient ~= 0 then
        if a2.orient ~= 1 then
            return CFrame.new(a1:cellWorld(a2.x, a2.y) + Vector3.new(0, blockWidth_1 / 2, BLOXORZ_CONFIG_upv_1.cellPitch / 2)) * CFrame.Angles(1.5707963267948966, 0, 0)
        end
        return CFrame.new(a1:cellWorld(a2.x, a2.y) + Vector3.new(BLOXORZ_CONFIG_upv_1.cellPitch / 2, blockWidth_1 / 2, 0)) * CFrame.Angles(0, 0, 1.5707963267948966)
    end
    return CFrame.new(a1:cellWorld(a2.x, a2.y) + Vector3.new(0, blockWidth_1, 0))
end
u21.poseBlockInstant = function(a1)
    --[[
      name: poseBlockInstant
      line: 581
    ]]
    a1:setBlockTransparency(0)
    a1.blockModel:PivotTo(a1:blockCFrameFor(a1.pose))
end
u21.setBlockTransparency = function(a1, a2)
    --[[
      name: setBlockTransparency
      line: 585
    ]]
    local value_2 = nil
    for _, value_2 in a1.blockModel:GetDescendants() do
        if value_2:IsA("BasePart") then
            value_2.Transparency = a2
        end
    end
end
u21.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 592
    ]]
    if a1:isRunning() then
        local v44 = a1:mapSwipeToGrid(a2)
        if a1.rollAnimation == nil and a1.blockFall == nil and a1.goalSink == nil then
            a1:startRoll(v44)
            return
        end
        a1.bufferedDirection = v44
    end
    return nil
end
u21.mapSwipeToGrid = function(a1, a2)
    --[[
      name: mapSwipeToGrid
      line: 603
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    local cameraLookDirection_1 = BLOXORZ_CONFIG_upv_1.cameraLookDirection
    local v45 = -cameraLookDirection_1.Z
    local X_1 = cameraLookDirection_1.X
    local X_2 = cameraLookDirection_1.X
    local Z_1 = cameraLookDirection_1.Z
    local v46, v47
    if a2 == "right" then
        v46, v47 = v45, X_1
    elseif a2 == "left" then
        v46, v47 = -v45, -X_1
    elseif a2 ~= "up" then
        v46, v47 = -X_2, -Z_1
    else
        v46, v47 = X_2, Z_1
    end
    local v48 = math.abs(v46)
    if math.abs(v47) > v48 then
        if v47 < 0 then
            return "up"
        end
        return "down"
    elseif v46 < 0 then
        return "left"
    else
        return "right"
    end
end
u21.startRoll = function(a1, a2)
    --[[
      name: startRoll
      line: 632
      upvalues:
        occupiedCells_upv_1 (copy, index: 1)
        BLOXORZ_CONFIG_upv_1 (copy, index: 2)
        applyRoll_upv_1 (copy, index: 3)
    ]]
    local spec_3 = a1.generated.spec
    local v49 = a1:blockCFrameFor(a1.pose)
    local v50 = math.huge
    local v51 = -math.huge
    local v52 = math.huge
    local v53 = -math.huge
    local v54 = nil
    for v55, v56 in occupiedCells_upv_1(a1.pose) do
        v54 = a1:cellWorld(v56.X, v56.Y)
        v50, v51, v52, v53 = math.min(v50, v54.X - (BLOXORZ_CONFIG_upv_1.cellPitch / 2)), math.max(v51, v54.X + (BLOXORZ_CONFIG_upv_1.cellPitch / 2)), math.min(v52, v54.Z - (BLOXORZ_CONFIG_upv_1.cellPitch / 2)), math.max(v53, v54.Z + (BLOXORZ_CONFIG_upv_1.cellPitch / 2))
    end
    local Y_1 = a1.stage.origin.Y
    local v57 = (v50 + v51) / 2
    local v58 = (v52 + v53) / 2
    local v55, v56
    if a2 == "right" then
        v55 = Vector3.new(v51, Y_1, v58)
        v56 = Vector3.new(0, 0, 1)
        v54 = -1.5707963267948966
    elseif a2 == "left" then
        v55 = Vector3.new(v50, Y_1, v58)
        v56 = Vector3.new(0, 0, 1)
        v54 = 1.5707963267948966
    elseif a2 ~= "down" then
        v55 = Vector3.new(v57, Y_1, v52)
        v56 = Vector3.new(1, 0, 0)
        v54 = -1.5707963267948966
    else
        v55 = Vector3.new(v57, Y_1, v53)
        v56 = Vector3.new(1, 0, 0)
        v54 = 1.5707963267948966
    end
    local v59 = applyRoll_upv_1(spec_3, a1.attempt, a1.pose, a2)
    a1.rollAnimation = {fromCFrame = v49, pivot = v55, axis = v56, angle = v54, toPose = v59.pose, outcome = v59.outcome}
end
u21.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 682
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    local rollAnimation_1 = a1.rollAnimation
    if rollAnimation_1 ~= nil then
        rollAnimation_1.age = rollAnimation_1.age + a2
        local v60 = math.min(rollAnimation_1.age / BLOXORZ_CONFIG_upv_1.rollSeconds, 1)
        v60 = CFrame.fromAxisAngle(rollAnimation_1.axis, rollAnimation_1.angle * (((v60 >= 0.5) and (1 - (((-2 * v60) + 2) ^ 2) / 2)) or (2 * v60 * v60)))
        a1.blockModel:PivotTo((CFrame.new(rollAnimation_1.pivot) * v60 * CFrame.new(rollAnimation_1.pivot * -1)) * rollAnimation_1.fromCFrame)
        if BLOXORZ_CONFIG_upv_1.rollSeconds <= rollAnimation_1.age then
            a1.rollAnimation = nil
            a1:finishRoll(rollAnimation_1)
        end
    end
    local blockFall_1 = a1.blockFall
    if blockFall_1 ~= nil then
        blockFall_1.age = blockFall_1.age + a2
        a1.blockModel:PivotTo((blockFall_1.fromCFrame * CFrame.new(0, 0, 0)) + Vector3.new(0, -((40 * blockFall_1.age) * blockFall_1.age), 0))
        a1:setBlockTransparency((math.min(blockFall_1.age / BLOXORZ_CONFIG_upv_1.fallSeconds, 1)))
        if BLOXORZ_CONFIG_upv_1.fallSeconds <= blockFall_1.age then
            a1.blockFall = nil
            a1:onFallFinished()
        end
    end
    local goalSink_1 = a1.goalSink
    if goalSink_1 ~= nil then
        goalSink_1.age = goalSink_1.age + a2
        local v61 = BLOXORZ_CONFIG_upv_1.blockWidth * 1.2
        local v62
        if goalSink_1.age >= BLOXORZ_CONFIG_upv_1.goalSinkSeconds then
            local _ = goalSink_1.age - BLOXORZ_CONFIG_upv_1.goalSinkSeconds
            v62 = v61 + 14 * (goalSink_1.age - BLOXORZ_CONFIG_upv_1.goalSinkSeconds) + 40 * (goalSink_1.age - BLOXORZ_CONFIG_upv_1.goalSinkSeconds) * (goalSink_1.age - BLOXORZ_CONFIG_upv_1.goalSinkSeconds)
        else
            local _ = goalSink_1.age / BLOXORZ_CONFIG_upv_1.goalSinkSeconds
            v62 = (goalSink_1.age / BLOXORZ_CONFIG_upv_1.goalSinkSeconds >= 0.5 and 1 - (-2 * (goalSink_1.age / BLOXORZ_CONFIG_upv_1.goalSinkSeconds) + 2) ^ 2 / 2 or 2 * (goalSink_1.age / BLOXORZ_CONFIG_upv_1.goalSinkSeconds) * (goalSink_1.age / BLOXORZ_CONFIG_upv_1.goalSinkSeconds)) * v61
        end
        a1.blockModel:PivotTo(goalSink_1.fromCFrame + Vector3.new(0, -v62, 0))
        a1:setBlockTransparency((math.min(goalSink_1.age / 1.1, 1)))
    end
    for n_3 = #a1.tileDrops - 1, 0, -1 do
        local v63 = a1.tileDrops[n_3 + 1]
        v63.age = v63.age + a2
        local v64 = CFrame.fromAxisAngle(v63.spinAxis, v63.age * 4)
        for n_4 = 0, #v63.parts - 1 do
            local v65 = v63.parts[n_4 + 1]
            v65.CFrame = (v63.baseCFrames[n_4 + 1] * v64) + Vector3.new(0, -((30 * v63.age) * v63.age), 0)
            v65.Transparency = math.min(v63.age / 0.8, 1)
        end
        local v66
        if v63.age < 0.8 then
            continue
        end
        for v67, value_3 in v63.parts do
            a1:parkPooledPart(value_3)
        end
        table.remove(a1.tileDrops, n_3 + 1)
    end
end
u21.finishRoll = function(a1, a2)
    --[[
      name: finishRoll
      line: 755
      upvalues:
        occupiedCells_upv_1 (copy, index: 1)
        cellKey_upv_1 (copy, index: 2)
    ]]
    a1.blockModel:PivotTo(a1:blockCFrameFor(a2.toPose))
    local outcome_1 = a2.outcome
    local v66 = nil
    if outcome_1.kind == "moved" then
        a1.pose = a2.toPose
        local play_1 = a1.context.audio.play
        local tbl_3 = {}
        tbl_3.pitch = ((a2.toPose.orient ~= 0) and 0.95) or 1.15
        play_1("thud", tbl_3)
        local spec_4 = a1.generated.spec
        local v67 = nil
        for _, value_4 in occupiedCells_upv_1(a2.toPose) do
            v67 = spec_4.tiles[cellKey_upv_1(spec_4.width, value_4.X, value_4.Y)]
            if v67 == nil then
                continue
            end
            if v67.kind == "fragile" then
                a1.context.audio.play("woodBreak", {})
                break
            end
        end
        a1:syncBridgeVisuals()
        v66 = a1.bufferedDirection
        a1.bufferedDirection = nil
        if v66 ~= nil then
            a1:startRoll(v66)
        end
        return nil
    elseif outcome_1.kind ~= "goal" then
        local v68 = nil
        if outcome_1.kind == "fragileBroke" then
            local v69 = cellKey_upv_1(a1.generated.spec.width, outcome_1.cellX, outcome_1.cellY)
            v68 = a1.fragileTileIndex[v69]
            local v70 = nil
            if v68 ~= nil then
                local v71 = a1.tilePlates[v68 + 1]
                local v72 = a1.tileUnders[v68 + 1]
                local tbl_4 = {}
                local tbl_5 = {}
                table.insert(tbl_4, v71)
                table.insert(tbl_4, v72)
                table.insert(tbl_5, v71.CFrame)
                table.insert(tbl_5, v72.CFrame)
                v70 = a1.fragileCrackParts[v69]
                if v70 ~= nil then
                    for _, value_5 in v70 do
                        table.insert(tbl_4, value_5)
                        table.insert(tbl_5, value_5.CFrame)
                    end
                end
                table.insert(a1.tileDrops, {parts = tbl_4, baseCFrames = tbl_5, spinAxis = (Vector3.new(1, 0.30000001192092896, 0.20000000298023224)).Unit})
            end
            a1.context.audio.play("woodBreak", {})
        end
        a1.context.audio.play("zigzagFall", {})
        a1.blockFall = {fromCFrame = a1:blockCFrameFor(a2.toPose)}
    else
        a1.pose = a2.toPose
        a1.context.audio.play("thud", {})
        a1.sparkBurst:Emit(18)
        a1.goalSink = {fromCFrame = a1:blockCFrameFor(a2.toPose)}
        a1:completeLevel()
        return nil
    end
end
u21.syncBridgeVisuals = function(a1)
    --[[
      name: syncBridgeVisuals
      line: 861
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local spec_5 = a1.generated.spec
    local _ = false
    local v73 = nil
    local v74 = nil
    local v75 = nil
    local v76 = nil
    for key_4, value_6 in a1.bridgeTileIndex do
        v76 = spec_5.tiles[key_4].bridgeGroup
        if v76 == nil then
            continue
        end
        v73 = a1.attempt.bridgesOpen[v76 + 1]
        if v73 == a1.shownBridges[v76 + 1] then
            continue
        end
        v74 = true
        v75 = a1:cellWorld(key_4 % spec_5.width, math.floor(key_4 / spec_5.width))
        if v73 then
            a1.tilePlates[value_6 + 1].CFrame = CFrame.new(v75 + Vector3.new(0, -BLOXORZ_CONFIG_upv_1.tileThickness / 2, 0))
            a1.tileUnders[value_6 + 1].CFrame = CFrame.new(v75 + Vector3.new(0, -BLOXORZ_CONFIG_upv_1.tileThickness - 0.7, 0))
        else
            a1.tilePlates[value_6 + 1].CFrame = u1
            a1.tileUnders[value_6 + 1].CFrame = u1
        end
    end
    if not v74 then
        return
    end
    for n_5 = 0, #a1.attempt.bridgesOpen - 1 do
        a1.shownBridges[n_5 + 1] = a1.attempt.bridgesOpen[n_5 + 1]
    end
    a1.context.audio.play("metalClank", {})
    a1.stage.shake(0.3)
end
u21.onFallFinished = function(a1)
    --[[
      name: onFallFinished
      line: 899
      upvalues:
        u20 (copy, index: 1)
        BLOXORZ_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.lives = a1.lives - 1
    a1.falls = a1.falls + 1
    a1:updateHearts()
    local v77 = a1.lives <= 0
    local play_2 = a1.context.audio.play
    local tbl_6 = {}
    local v78
    if v77 then
        v78 = 0.6
    else
        v78 = 0.5
    end
    tbl_6.volume = v78
    tbl_6.pitch = (v77 and 0.85) or 1
    play_2("fruitHealthDown", tbl_6)
    local origin_4 = a1.stage.origin
    if a1.lives > 0 then
        a1.popups:show(origin_4 + Vector3.new(0, 6, 0), "FELL!", u20, 1)
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            BLOXORZ_CONFIG_upv_1.fallResetDelaySeconds,
            function()
                --[[
                  line: 931
                  upvalues:
                    roundToken_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                if roundToken_upv_1 == a1.roundToken then
                    a1:resetAttempt()
                else
                    return nil
                end
            end
        )
    else
        a1.popups:show(origin_4 + Vector3.new(0, 6, 0), "OUT OF LIVES!", u20, 1.2)
        a1:setRunning(false)
        local roundToken_upv_2 = a1.roundToken
        local u22 = a1.level - 1
        task.delay(
            BLOXORZ_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 919
                  upvalues:
                    roundToken_upv_2 (copy, index: 1)
                    a1 (copy, index: 2)
                    u22 (copy, index: 3)
                ]]
                if roundToken_upv_2 == a1.roundToken then
                    a1.context.endRun(u22)
                else
                    return nil
                end
            end
        )
        return nil
    end
end
u21.resetAttempt = function(a1)
    --[[
      name: resetAttempt
      line: 938
      upvalues:
        freshAttempt_upv_1 (copy, index: 1)
    ]]
    a1.attempt = freshAttempt_upv_1(a1.generated.spec)
    a1.pose = a1.generated.spec.start
    a1.rollAnimation = nil
    a1.blockFall = nil
    a1.bufferedDirection = nil
    while true do
        local v79
        if #a1.tileDrops <= 0 then
            break
        end
        local tileDrops_2 = a1.tileDrops
        local v80 = #tileDrops_2
        v79 = tileDrops_2[v80]
        tileDrops_2[v80] = nil
        local v81
        if v79 == nil then
            continue
        end
        for v82, value_7 in v79.parts do
            a1:parkPooledPart(value_7)
        end
    end
    a1:dressBoard()
    a1:poseBlockInstant()
end
u21.completeLevel = function(a1)
    --[[
      name: completeLevel
      line: 961
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.context.reportScore(a1.level)
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("whoosh", {})
    a1.level = a1.level + 1
    local roundToken_upv_3 = a1.roundToken
    task.delay(
        BLOXORZ_CONFIG_upv_1.nextLevelDelaySeconds,
        function()
            --[[
              line: 973
              upvalues:
                roundToken_upv_3 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            if roundToken_upv_3 == a1.roundToken then
                a1:loadLevel()
            else
                return nil
            end
        end
    )
end
u21.updateCamera = function(a1)
    --[[
      name: updateCamera
      line: 980
      upvalues:
        BLOXORZ_CONFIG_upv_1 (copy, index: 1)
        portraitCameraDistance_upv_1 (copy, index: 2)
    ]]
    local camera_1 = a1.stage.camera
    local ViewportSize_1 = camera_1.ViewportSize
    if ViewportSize_1.X ~= a1.lastViewportX or ViewportSize_1.Y ~= a1.lastViewportY then
        a1.lastViewportX = ViewportSize_1.X
        a1.lastViewportY = ViewportSize_1.Y
        camera_1.FieldOfView = BLOXORZ_CONFIG_upv_1.fieldOfView
        local v81 = portraitCameraDistance_upv_1(BLOXORZ_CONFIG_upv_1.cameraDistanceBase + ((a1.boardExtent * BLOXORZ_CONFIG_upv_1.cellPitch) * BLOXORZ_CONFIG_upv_1.cameraDistancePerExtent), BLOXORZ_CONFIG_upv_1.portraitZoomOut, ViewportSize_1, BLOXORZ_CONFIG_upv_1.portraitMaxZoomOut)
        local origin_5 = a1.stage.origin
        a1.cameraCFrame = CFrame.lookAt(origin_5 - (BLOXORZ_CONFIG_upv_1.cameraLookDirection.Unit * v81), origin_5)
        a1:poseLivesRow(ViewportSize_1)
    end
    a1.stage.setCameraCFrame(a1.cameraCFrame)
end
local tbl_7 = {}
tbl_7.BloxorzGame = u21
return tbl_7