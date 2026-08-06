-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardGestures_upv_1 = v1.BoardGestures
local BoardPicker_upv_1 = v1.BoardPicker
local GridCursor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "grid-cursor").GridCursor
local HeartPipRow_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "heart-pips").HeartPipRow
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local ONET_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "onet-config").ONET_CONFIG
local v3 = RuntimeLib_1.import(script, script.Parent, "onet-levels")
local dealLevel_upv_1 = v3.dealLevel
local ensureMoveAvailable_upv_1 = v3.ensureMoveAvailable
local levelBand_upv_1 = v3.levelBand
local v4 = RuntimeLib_1.import(script, script.Parent, "onet-sim")
local applyMatch_upv_1 = v4.applyMatch
local kindAt_upv_1 = v4.kindAt
local matchPath_upv_1 = v4.matchPath
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(26, 44, 36)
local u3 = Color3.fromRGB(36, 58, 46)
local u4 = Color3.fromRGB(54, 92, 72)
local u5 = Color3.fromRGB(226, 224, 214)
local u6 = Color3.fromRGB(247, 242, 230)
local u7 = Color3.fromRGB(255, 255, 255)
local tbl_upv_1 = {Color3.fromRGB(206, 72, 54), Color3.fromRGB(62, 124, 216), Color3.fromRGB(234, 178, 64), Color3.fromRGB(148, 88, 198)}
local u8 = Color3.fromRGB(255, 216, 102)
local u9 = Color3.fromRGB(255, 246, 214)
local u10 = Color3.fromRGB(255, 216, 102)
local u11 = Color3.fromRGB(24, 34, 28)
local u12 = Color3.fromRGB(96, 196, 120)
local u13 = Color3.fromRGB(238, 150, 52)
local u14 = Color3.fromRGB(222, 74, 84)
local u15 = Color3.fromRGB(58, 124, 236)
local u16 = Color3.fromRGB(58, 72, 62)
local u17 = Color3.fromRGB(255, 216, 102)
local u18 = Color3.fromRGB(245, 245, 255)
local u19 = Color3.fromRGB(255, 92, 80)
local tbl_upv_2 = {{{}}, {{}}, {{}}, {{}}, {{}, {}}, {{}, {}, {}, {}}, {{}, {}}}
local u20 = CFrame.Angles(0, 1.5707963267948966, 0)
local u21 = ONET_CONFIG_upv_1.tileDepth / 2 + 0.09
local u22 = u21 + 0.12
local function shapeForKind_1(a1)
    --[[
      name: shapeForKind
      line: 157
    ]]
    return (a1 - 1) % 7
end
local function familyColorForKind_1(a1)
    --[[
      name: familyColorForKind
      line: 160
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[(math.floor((a1 - 1) / 7) % #tbl_upv_1) + 1]
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 176
    ]]
    return "OnetGame"
end
tbl_4.__index = BaseWorldGame_upv_1
local u23 = setmetatable(tbl_3, tbl_4)
u23.__index = u23
u23.new = function(...)
    --[[
      name: new
      line: 182
      upvalues:
        u23 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u23)
    return v5:constructor(...) or v5
end
u23.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 186
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = ONET_CONFIG_upv_1.livesPerRun
    a1.pairsMatched = 0
    a1.bestCombo = 0
    a1.comboCount = 0
    a1.comboClock = math.huge
    a1.timeLimitSeconds = 1
    a1.timeRemaining = 1
    a1.perPairBudgetSeconds = 1
    a1.comboWindowSeconds = 1
    a1.comboBanked = 0
    a1.runSeed = 0
    a1.roundToken = 0
    a1.boardLocked = false
    a1.tileSlots = {}
    a1.traceSlotParts = {}
    a1.popParts = {}
    a1.burstHolders = {}
    a1.fallbackHearts = {}
    a1.traces = {}
    a1.pops = {}
    a1.shakes = {}
    a1.traceSlotIndex = 0
    a1.popSlotIndex = 0
    a1.burstIndex = 0
    a1.timerWidth = 10
    a1.timerY = 0
    a1.timerZ = 0
    a1.displayedTimerTicks = -1
    a1.displayedWarn = false
    a1.lastWarnSecond = -1
end
u23.buildScene = function(a1)
    --[[
      name: buildScene
      line: 220
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        makeStagePart_upv_1 (copy, index: 3)
        u3 (copy, index: 4)
        u4 (copy, index: 5)
        u1 (copy, index: 6)
        ONET_CONFIG_upv_1 (copy, index: 7)
        u5 (copy, index: 8)
        makeSmoothPart_upv_1 (copy, index: 9)
        u6 (copy, index: 10)
        u10 (copy, index: 11)
        u8 (copy, index: 12)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 13)
        u11 (copy, index: 14)
        u12 (copy, index: 15)
        HeartPipRow_upv_1 (copy, index: 16)
        u16 (copy, index: 17)
        u15 (copy, index: 18)
        u14 (copy, index: 19)
        PopupTextPool_upv_1 (copy, index: 20)
        levelBand_upv_1 (copy, index: 21)
        BoardPicker_upv_1 (copy, index: 22)
        BoardGestures_upv_1 (copy, index: 23)
        GridCursor_upv_1 (copy, index: 24)
    ]]
    local container_1 = a1.stage.container
    makeFrontalBackdrop_upv_1(a1.stage, u2, Enum.Material.SmoothPlastic)
    local v6 = makeStagePart_upv_1(container_1)
    v6.Size = Vector3.new(160, 140, 1)
    v6.Color = u3
    v6.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, 0, -6))
    a1.boardMat = makeStagePart_upv_1(container_1)
    a1.boardMat.Color = u4
    a1.boardMat.CFrame = u1
    local v7 = 0
    local v8 = false
    v8, v7 = v8, v7
    if v8 then
        v7 = v7 + 1
    else
        v8 = true
    end
    if v7 < 112 then
        local v9 = makeStagePart_upv_1(container_1)
        v9.Size = Vector3.new(ONET_CONFIG_upv_1.tileWidth, ONET_CONFIG_upv_1.tileWidth, ONET_CONFIG_upv_1.tileDepth)
        v9.Color = u5
        v9.CFrame = u1
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Size = Vector3.new(ONET_CONFIG_upv_1.tileWidth - 0.42, ONET_CONFIG_upv_1.tileWidth - 0.42, 0.18)
        v10.CFrame = u1
        local tbl_5 = {}
        for _ = 0, 3 do
            local v11 = makeSmoothPart_upv_1(container_1)
            v11.Color = u6
            v11.CFrame = u1
            table.insert(tbl_5, v11)
        end
        table.insert(a1.tileSlots, {body = v9, plate = v10, glyphs = tbl_5})
        if v8 then
            v7 = v7 + 1
        else
            v8 = true
        end
        --[[ goto label_3 ]]--
    end
    a1.selectionRing = makeSmoothPart_upv_1(container_1)
    a1.selectionRing.Size = Vector3.new(ONET_CONFIG_upv_1.tileWidth + 0.55, ONET_CONFIG_upv_1.tileWidth + 0.55, 0.14)
    a1.selectionRing.Color = u10
    a1.selectionRing.Transparency = 0.25
    a1.selectionRing.CFrame = u1
    for _ = 0, 3 do
        local tbl_6 = {}
        for v17 = 0, 2 do
            local v12 = makeSmoothPart_upv_1(container_1)
            v12.Material = Enum.Material.Neon
            v12.Color = u8
            v12.CFrame = u1
            table.insert(tbl_6, v12)
        end
        table.insert(a1.traceSlotParts, tbl_6)
    end
    for _ = 0, 7 do
        local v13 = makeSmoothPart_upv_1(container_1)
        v13.CFrame = u1
        table.insert(a1.popParts, v13)
    end
    for _ = 0, 1 do
        local v14 = makeSmoothPart_upv_1(container_1)
        v14.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
        v14.Transparency = 1
        v14.CFrame = u1
        local v15 = Instance.new("ParticleEmitter")
        v15.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
        v15.Rate = 0
        v15.Lifetime = NumberRange.new(0.25, 0.5)
        v15.Speed = NumberRange.new(5, 10)
        v15.SpreadAngle = Vector2.new(180, 180)
        v15.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.38), NumberSequenceKeypoint.new(1, 0.1)})
        v15.Parent = v14
        table.insert(a1.burstHolders, {part = v14, emitter = v15})
    end
    a1.timerSlot = makeSmoothPart_upv_1(container_1)
    a1.timerSlot.Color = u11
    a1.timerSlot.CFrame = u1
    a1.timerFill = makeSmoothPart_upv_1(container_1)
    a1.timerFill.Color = u12
    a1.timerFill.CFrame = u1
    a1.heartRow = HeartPipRow_upv_1:tryCreate(container_1, {count = ONET_CONFIG_upv_1.livesPerRun, spentColor = u16, aliveColor = u15})
    if a1.heartRow == nil then
        for _ = 0, ONET_CONFIG_upv_1.livesPerRun - 1 do
            local v16 = makeStagePart_upv_1(container_1)
            v16.Size = Vector3.new(1.100000023841858, 1.100000023841858, 0.699999988079071)
            v16.Color = u14
            v16.CFrame = u1
            table.insert(a1.fallbackHearts, v16)
        end
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    v7 = levelBand_upv_1(1)
    a1.picker = BoardPicker_upv_1.new(a1.stage, {columns = v7.columns, rows = v7.rows, cellPitch = ONET_CONFIG_upv_1.cellPitch})
    local tbl_7 = {}
    local tbl_8 = {}
    tbl_8.onCellTap = function(a2)
        --[[
          name: onCellTap
          line: 356
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellActivated(a2)
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, tbl_7, tbl_8)
    local function onMoved_1()
        --[[
          name: onMoved
          line: 366
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.context.audio.play("uiHover", {})
    end
    local function onActivate_1(a3)
        --[[
          name: onActivate
          line: 363
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellActivated(a3)
    end
    a1.cursor = GridCursor_upv_1.new(a1.context.input, a1.context.janitor, {picker = a1.picker, container = container_1, onActivate = onActivate_1, onMoved = onMoved_1})
end
u23.resetRound = function(a1)
    --[[
      name: resetRound
      line: 375
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = ONET_CONFIG_upv_1.livesPerRun
    a1.pairsMatched = 0
    a1.bestCombo = 0
    a1.comboCount = 0
    a1.comboClock = math.huge
    a1.runSeed = a1.context.getRunSeed()
    a1:loadLevel()
    a1.context.reportScore(0)
end
u23.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 387
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.cursor:update(a2)
    if not (a1.boardLocked) and a1:isRunning() then
        a1.comboClock = a1.comboClock + a2
        a1.timeRemaining = a1.timeRemaining - a2
        local v17 = nil
        if a1.timeRemaining > 0 then
            if a1.timeRemaining <= ONET_CONFIG_upv_1.timerWarningSeconds then
                v17 = math.ceil(a1.timeRemaining)
                if v17 ~= a1.lastWarnSecond then
                    a1.lastWarnSecond = v17
                    a1.context.audio.play("countdownBeep", {pitch = 1 + ((ONET_CONFIG_upv_1.timerWarningSeconds - v17) * 0.04)})
                end
            end
            return
        end
        a1.timeRemaining = 0
        a1:onTimeUp()
        return nil
    end
    return nil
end
u23.render = function(a1, a2)
    --[[
      name: render
      line: 411
    ]]
    a1:advanceAnimations(a2)
    a1:updateTimerBar()
end
u23.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 415
    ]]
    a1.cursor:update(a2)
    a1:advanceAnimations(a2)
end
u23.revive = function(a1)
    --[[
      name: revive
      line: 419
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = ONET_CONFIG_upv_1.livesPerRun
    a1:loadLevel()
    a1:setRunning(true)
end
u23.captureRound = function(a1)
    --[[
      name: captureRound
      line: 426
    ]]
    return nil
end
u23.restoreRound = function(a1)
    --[[
      name: restoreRound
      line: 431
    ]]
    return false
end
u23.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 434
      upvalues:
        dealLevel_upv_1 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        u17 (copy, index: 4)
    ]]
    local v18 = dealLevel_upv_1(a1.runSeed, a1.level)
    a1.dealt = v18.dealt
    local band_1 = a1.dealt.band
    a1.timeLimitSeconds = band_1.timeLimitSeconds
    a1.timeRemaining = band_1.timeLimitSeconds
    a1.perPairBudgetSeconds = band_1.secondsPerTile * 2
    a1.comboWindowSeconds = a1.perPairBudgetSeconds * ONET_CONFIG_upv_1.comboWindowFraction
    a1.comboCount = 0
    a1.comboClock = math.huge
    a1.comboBanked = 0
    a1.boardLocked = false
    a1.selected = nil
    a1.highlightedKind = nil
    a1.selectionRing.CFrame = u1
    a1.displayedTimerTicks = -1
    a1.displayedWarn = false
    a1.lastWarnSecond = -1
    a1.gestures:cancel()
    a1:clearTransientAnimations()
    a1.picker:setSpec({columns = band_1.columns, rows = band_1.rows, cellPitch = ONET_CONFIG_upv_1.cellPitch})
    a1.stage.setFrameWidthFloor((band_1.columns * ONET_CONFIG_upv_1.cellPitch) + ONET_CONFIG_upv_1.frameWidthMargin)
    a1.cursor:setCell(a1.cursor:getCell())
    a1:layoutFrame(band_1)
    a1:dressBoard()
    a1:updateHearts()
    local origin_1 = a1.stage.origin
    if v18.ensure.reshuffles > 0 or v18.ensure.forced then
        a1:showShuffleToast()
    end
    a1.popups:show(origin_1 + Vector3.new(0, 4.199999809265137, 3), ("LEVEL %*"):format(a1.level), u17, 1.3)
end
u23.layoutFrame = function(a1, a2)
    --[[
      name: layoutFrame
      line: 476
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_2 = a1.stage.origin
    local v19 = a2.columns * ONET_CONFIG_upv_1.cellPitch
    local v20 = a2.rows * ONET_CONFIG_upv_1.cellPitch
    a1.boardMat.Size = Vector3.new(v19 + 1.8, v20 + 1.8, 0.7)
    a1.boardMat.CFrame = CFrame.new(origin_2 + Vector3.new(0, 0, -1.350000023841858))
    a1.timerWidth = v19
    a1.timerY = (origin_2.Y - (v20 / 2)) - 1.15
    a1.timerZ = origin_2.Z + 0.3
    a1.timerSlot.Size = Vector3.new(v19 + 0.3, 0.6, 0.45)
    a1.timerSlot.CFrame = CFrame.new(origin_2.X, a1.timerY, origin_2.Z + 0.2)
    local v21 = Vector3.new((origin_2.X + (v19 / 2)) - 2.1, (origin_2.Y + (v20 / 2)) + 1.7, origin_2.Z)
    if a1.heartRow == nil then
        for n_1 = 0, #a1.fallbackHearts - 1 do
            a1.fallbackHearts[n_1 + 1].CFrame = CFrame.new(v21 + Vector3.new((n_1 - 1) * 1.9, 0, 0))
        end
    else
        a1.heartRow:layout(v21, 1.9)
    end
end
u23.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 498
      upvalues:
        u16 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    if a1.heartRow == nil then
        local v22 = nil
        for n_2 = 0, #a1.fallbackHearts - 1 do
            local v23 = a1.lives <= n_2
            local v24 = a1.fallbackHearts[n_2 + 1]
            if v23 then
                v22 = u16
            else
                v22 = u14
            end
            v24.Color = v22
            a1.fallbackHearts[n_2 + 1].Transparency = (v23 and 0.45) or 0
        end
    else
        a1.heartRow:setRemaining(a1.lives)
        return nil
    end
end
u23.slotIndexFor = function(a1, a2, a3)
    --[[
      name: slotIndexFor
      line: 509
    ]]
    return (a3 * 14) + a2
end
u23.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 512
    ]]
    local band_2 = a1.dealt.band
    local v25 = 0
    local v26 = false
    v26, v25 = v26, v25
    if v26 then
        v25 = v25 + 1
    else
        v26 = true
    end
    local v27 = nil
    if v25 < 112 then
        v27 = v25 % 14
        local v28 = math.floor(v25 / 14)
        if v27 >= band_2.columns or v28 >= band_2.rows then
            a1:parkSlot(v25)
        else
            a1:dressCell(v27, v28)
        end
        if v26 then
            v25 = v25 + 1
        else
            v26 = true
        end
    end
end
u23.parkSlot = function(a1, a2)
    --[[
      name: parkSlot
      line: 536
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v29 = a1.tileSlots[a2 + 1]
    v29.body.CFrame = u1
    v29.plate.CFrame = u1
    for _, value_1 in v29.glyphs do
        value_1.CFrame = u1
    end
end
u23.dressCell = function(a1, a2, a3)
    --[[
      name: dressCell
      line: 544
      upvalues:
        kindAt_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        u7 (copy, index: 3)
        u5 (copy, index: 4)
        tbl_upv_2 (copy, index: 5)
        u1 (copy, index: 6)
        u6 (copy, index: 7)
    ]]
    local v30 = a1:slotIndexFor(a2, a3)
    local v31 = kindAt_upv_1(a1.dealt.board, a2, a3)
    if v31 ~= 0 then
        local v32 = a1.tileSlots[v30 + 1]
        local v33 = tbl_upv_1[(math.floor((v31 - 1) / 7) % #tbl_upv_1) + 1]
        local v34 = false
        if a1.selected ~= nil then
            local v35 = false
            if a1.selected.column ~= a2 then
                v34 = v35
            else
                v34 = a1.selected.row == a3
            end
        end
        local v36 = not v34 and (v31 == a1.highlightedKind)
        local v37
        if v34 then
            v37 = v33:Lerp(u7, 0.2)
        elseif v36 then
            v37 = v33:Lerp(u7, 0.35)
        else
            v37 = v33
        end
        v32.body.Color = u5
        v32.plate.Color = v37
        local v38 = tbl_upv_2[((v31 - 1) % 7) + 1]
        for n_3 = 0, 3 do
            local v39 = v32.glyphs[n_3 + 1]
            local v40
            v40 = v38[n_3 + 1]
            if v40 == nil then
                v39.CFrame = u1
                continue
            end
            if v40.isDisc ~= true then
                v39.Shape = Enum.PartType.Block
                v39.Size = Vector3.new(v40.width, v40.height, 0.14)
            else
                v39.Shape = Enum.PartType.Cylinder
                v39.Size = Vector3.new(0.14, v40.width, v40.height)
            end
            v39.Color = u6
        end
        a1:poseCell(a2, a3, 0)
    else
        a1:parkSlot(v30)
        return nil
    end
end
u23.poseCell = function(a1, a2, a3, a4)
    --[[
      name: poseCell
      line: 582
      upvalues:
        kindAt_upv_1 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
        u21 (copy, index: 3)
        tbl_upv_2 (copy, index: 4)
        u22 (copy, index: 5)
        u20 (copy, index: 6)
    ]]
    local v41 = a1:slotIndexFor(a2, a3)
    local v42 = kindAt_upv_1(a1.dealt.board, a2, a3)
    if v42 ~= 0 then
        local v43 = a1.tileSlots[v41 + 1]
        local v44 = a1.picker:cellWorld(a2, a3)
        local v45 = false
        if a1.selected ~= nil then
            v45 = false
            if a1.selected.column == a2 then
                v45 = a1.selected.row == a3
            end
        end
        local v46 = not v45 and (v42 == a1.highlightedKind)
        local v47 = 0
        if v45 then
            v47 = ONET_CONFIG_upv_1.selectLiftStuds
        elseif v46 then
            v47 = ONET_CONFIG_upv_1.kindHighlightLiftStuds
        end
        v43.body.CFrame = CFrame.new(v44.X + a4, v44.Y, v44.Z + v47)
        v43.plate.CFrame = CFrame.new(v44.X + a4, v44.Y, (v44.Z + v47) + u21)
        local v48 = tbl_upv_2[((v42 - 1) % 7) + 1]
        for n_4 = 0, #v48 - 1 do
            local v49 = v48[n_4 + 1]
            local v50 = CFrame.new((v44.X + a4) + v49.offsetX, v44.Y + v49.offsetY, (v44.Z + v47) + u22)
            if v49.isDisc == true then
                v43.glyphs[n_4 + 1].CFrame = v50 * u20
                continue
            end
            if v49.rotationDegrees == 0 then
                v43.glyphs[n_4 + 1].CFrame = v50
            else
                v43.glyphs[n_4 + 1].CFrame = v50 * CFrame.Angles(0, 0, math.rad(v49.rotationDegrees))
            end
        end
    else
        a1:parkSlot(v41)
        return nil
    end
end
u23.dressKindCells = function(a1, a2)
    --[[
      name: dressKindCells
      line: 615
      upvalues:
        kindAt_upv_1 (copy, index: 1)
    ]]
    local band_3 = a1.dealt.band
    local v51 = 0
    local v52 = false
    v52, v51 = v52, v51
    if v52 then
        v51 = v51 + 1
    else
        v52 = true
    end
    if v51 < band_3.rows then
        local v53 = 0
        local v54 = false
        v54, v53 = v54, v53
        if v54 then
            v53 = v53 + 1
        else
            v54 = true
        end
        while v53 < band_3.columns do
            if kindAt_upv_1(a1.dealt.board, v53, v51) == a2 then
                a1:dressCell(v53, v51)
            end
            if v54 then
                v53 = v53 + 1
            else
                v54 = true
            end
        end
        if v52 then
            v51 = v51 + 1
        else
            v52 = true
        end
    end
end
u23.onCellActivated = function(a1, a2)
    --[[
      name: onCellActivated
      line: 649
      upvalues:
        kindAt_upv_1 (copy, index: 1)
        matchPath_upv_1 (copy, index: 2)
    ]]
    if a1:isRunning() then
        local v55 = nil
        if not (a1.boardLocked) then
            local board_1 = a1.dealt.board
            v55 = kindAt_upv_1(board_1, a2.column, a2.row)
            local v56 = nil
            if v55 ~= 0 then
                v56 = a1.selected
                local v57 = nil
                if v56 ~= nil then
                    if v56.column == a2.column and v56.row == a2.row then
                        a1:clearSelection(true)
                        return nil
                    end
                    v57 = matchPath_upv_1(board_1, v56, a2)
                    if v57 == nil then
                        if kindAt_upv_1(board_1, v56.column, v56.row) == v55 then
                            table.insert(a1.shakes, {column = v56.column, row = v56.row})
                            table.insert(a1.shakes, {column = a2.column, row = a2.row})
                            a1.context.audio.play("thud", {})
                        end
                        a1:selectTile(a2, v55)
                        return
                    end
                    a1:performMatch(v56, a2, v57, v55)
                else
                    a1:selectTile(a2, v55)
                end
            elseif a1.selected ~= nil then
                a1:clearSelection(true)
            end
            return nil
        end
    end
    return nil
end
u23.selectTile = function(a1, a2, a3)
    --[[
      name: selectTile
      line: 699
    ]]
    local highlightedKind_1 = a1.highlightedKind
    a1.selected = {column = a2.column, row = a2.row}
    a1.highlightedKind = a3
    if highlightedKind_1 ~= nil and highlightedKind_1 ~= a3 then
        a1:dressKindCells(highlightedKind_1)
    end
    a1:dressKindCells(a3)
    local v58 = a1.picker:cellWorld(a2.column, a2.row)
    a1.selectionRing.CFrame = CFrame.new(v58.X, v58.Y, v58.Z - 0.35)
    a1.context.audio.play("uiTap", {})
end
u23.clearSelection = function(a1, a2)
    --[[
      name: clearSelection
      line: 719
      upvalues:
        u1 (copy, index: 1)
    ]]
    local highlightedKind_2 = a1.highlightedKind
    a1.selected = nil
    a1.highlightedKind = nil
    a1.selectionRing.CFrame = u1
    if highlightedKind_2 ~= nil then
        a1:dressKindCells(highlightedKind_2)
    end
    if not a2 then
        return
    end
    a1.context.audio.play("uiTap", {})
end
u23.comboBonusFor = function(a1, a2)
    --[[
      name: comboBonusFor
      line: 734
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 < 2 then
        if a2 ~= 1 then
            return a1.perPairBudgetSeconds * ONET_CONFIG_upv_1.comboBonusStraightFraction
        end
        return a1.perPairBudgetSeconds * ONET_CONFIG_upv_1.comboBonusOneTurnFraction
    end
    return a1.perPairBudgetSeconds * ONET_CONFIG_upv_1.comboBonusTwoTurnFraction
end
u23.performMatch = function(a1, a2, a3, a4, a5)
    --[[
      name: performMatch
      line: 743
      upvalues:
        tbl_upv_1 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
        publishCombo_upv_1 (copy, index: 3)
        u17 (copy, index: 4)
        applyMatch_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        ensureMoveAvailable_upv_1 (copy, index: 7)
    ]]
    local board_2 = a1.dealt.board
    local v59 = tbl_upv_1[(math.floor((a5 - 1) / 7) % #tbl_upv_1) + 1]
    if a1.comboClock > a1.comboWindowSeconds then
        a1.comboCount = 1
    else
        a1.comboCount = a1.comboCount + 1
    end
    a1.comboClock = 0
    if a1.bestCombo < a1.comboCount then
        a1.bestCombo = a1.comboCount
    end
    local v60 = a4[math.floor(#a4 / 2) + 1]
    local v61 = a1.picker:cellWorld(v60.column, v60.row)
    if a1.comboCount >= 2 then
        local v62 = math.min(a1:comboBonusFor(#a4 - 2), math.max((a1.timeLimitSeconds * ONET_CONFIG_upv_1.comboBankCapFraction) - a1.comboBanked, 0))
        if v62 >= 0.05 then
            a1.comboBanked = a1.comboBanked + v62
            a1.timeRemaining = math.min(a1.timeRemaining + v62, a1.timeLimitSeconds)
            publishCombo_upv_1({count = a1.comboCount, color = u17})
            a1.popups:show(v61 + Vector3.new(0, 1.399999976158142, 2), string.format("+%.1fs", v62), u17, 0.7)
        end
    end
    a1.context.audio.play("scorePing", {pitch = (math.min(a1.comboCount - 1, 10) * 0.06) + 1})
    applyMatch_upv_1(board_2, a2, a3)
    a1.pairsMatched = a1.pairsMatched + 1
    a1.context.reportScore(a1.pairsMatched)
    a1.selected = nil
    a1.highlightedKind = nil
    a1.selectionRing.CFrame = u1
    a1:dressKindCells(a5)
    a1:dressCell(a2.column, a2.row)
    a1:dressCell(a3.column, a3.row)
    a1:spawnTrace(a4)
    a1:spawnPop(a2, v59, 0, 1)
    a1:spawnPop(a3, v59, ONET_CONFIG_upv_1.popStaggerSeconds, 1.06)
    local v63 = nil
    if board_2.remaining <= 0 then
        a1:onBoardCleared()
    else
        v63 = ensureMoveAvailable_upv_1(a1.runSeed, a1.level, a1.dealt)
        if v63.reshuffles > 0 or v63.forced then
            a1:dressBoard()
            a1:showShuffleToast()
        end
        return nil
    end
end
u23.showShuffleToast = function(a1)
    --[[
      name: showShuffleToast
      line: 804
      upvalues:
        u18 (copy, index: 1)
    ]]
    a1.popups:show(a1.stage.origin + Vector3.new(0, 2.200000047683716, 3), "SHUFFLED!", u18, 1)
    a1.context.audio.play("whoosh", {})
end
u23.onBoardCleared = function(a1)
    --[[
      name: onBoardCleared
      line: 814
      upvalues:
        u17 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.boardLocked = true
    a1.gestures:cancel()
    a1.popups:show(a1.stage.origin + Vector3.new(0, 4.199999809265137, 3), "BOARD CLEAR!", u17, 1.3)
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("whoosh", {})
    a1.level = a1.level + 1
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        ONET_CONFIG_upv_1.boardClearDelaySeconds,
        function()
            --[[
              line: 832
              upvalues:
                roundToken_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            if roundToken_upv_1 == a1.roundToken then
                a1:loadLevel()
            else
                return nil
            end
        end
    )
end
u23.onTimeUp = function(a1)
    --[[
      name: onTimeUp
      line: 839
      upvalues:
        u19 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.boardLocked = true
    a1.gestures:cancel()
    a1:clearSelection(false)
    a1.lives = a1.lives - 1
    a1:updateHearts()
    a1.context.audio.play("buzz", {})
    local origin_3 = a1.stage.origin
    if a1.lives > 0 then
        a1.popups:show(origin_3 + Vector3.new(0, 4.199999809265137, 3), "TIME'S UP!", u19, 1.1)
        local roundToken_upv_2 = a1.roundToken
        task.delay(
            ONET_CONFIG_upv_1.timeUpResetDelaySeconds,
            function()
                --[[
                  line: 868
                  upvalues:
                    roundToken_upv_2 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                if roundToken_upv_2 == a1.roundToken then
                    a1:loadLevel()
                else
                    return nil
                end
            end
        )
    else
        a1.popups:show(origin_3 + Vector3.new(0, 4.199999809265137, 3), "OUT OF TIME!", u19, 1.2)
        a1:setRunning(false)
        a1.context.endRun(a1.pairsMatched)
        return nil
    end
end
u23.spawnTrace = function(a1, a2)
    --[[
      name: spawnTrace
      line: 876
      upvalues:
        u1 (copy, index: 1)
        u8 (copy, index: 2)
    ]]
    local traceSlotIndex_1 = a1.traceSlotIndex
    a1.traceSlotIndex = (a1.traceSlotIndex + 1) % 4
    for n_5 = #a1.traces - 1, 0, -1 do
        local v66
        if a1.traces[n_5 + 1].slotIndex ~= traceSlotIndex_1 then
            continue
        end
        for v67, value_2 in a1.traces[n_5 + 1].parts do
            value_2.CFrame = u1
        end
        table.remove(a1.traces, n_5 + 1)
    end
    local tbl_9 = {}
    for _, value_3 in a2 do
        table.insert(tbl_9, a1.picker:cellWorld(value_3.column, value_3.row) + Vector3.new(0, 0, 1.0499999523162842))
    end
    local tbl_10 = {}
    local n_5 = 0
    for n_6 = 0, #tbl_9 - 2 do
        local Magnitude_1 = (tbl_9[n_6 + 2] - tbl_9[n_6 + 1]).Magnitude
        table.insert(tbl_10, Magnitude_1)
        n_5 = n_5 + Magnitude_1
    end
    local v65 = a1.traceSlotParts[traceSlotIndex_1 + 1]
    for _, value_4 in v65 do
        value_4.Transparency = 0
        value_4.Color = u8
        value_4.CFrame = u1
    end
    table.insert(a1.traces, {slotIndex = traceSlotIndex_1, parts = v65, points = tbl_9, segmentLengths = tbl_10, totalLength = n_5})
end
u23.layoutTrace = function(a1, a2, a3)
    --[[
      name: layoutTrace
      line: 924
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v66 = 0
    for n_7 = 0, #a2.segmentLengths - 1 do
        local v67 = a2.parts[n_7 + 1]
        local v68 = a2.segmentLengths[n_7 + 1]
        local v69
        v69 = math.clamp(a3 - v66, 0, v68)
        v66 = v66 + v68
        if v69 >= 0.03 then
            local v70 = a2.points[n_7 + 1]
            local Unit_1 = (a2.points[n_7 + 2] - v70).Unit
            local v71 = v70 + Unit_1 * (v69 / 2)
            v67.Size = Vector3.new(0.3, 0.3, v69)
            v67.CFrame = CFrame.lookAt(v71, v71 + Unit_1)
        else
            v67.CFrame = u1
        end
    end
end
u23.spawnPop = function(a1, a2, a3, a4, a5)
    --[[
      name: spawnPop
      line: 944
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v72 = a1.popParts[a1.popSlotIndex + 1]
    a1.popSlotIndex = (a1.popSlotIndex + 1) % 8
    for n_8 = #a1.pops - 1, 0, -1 do
        if a1.pops[n_8 + 1].part == v72 then
            table.remove(a1.pops, n_8 + 1)
        end
    end
    v72.CFrame = u1
    v72.Color = a3
    local v73 = a1.picker:cellWorld(a2.column, a2.row)
    table.insert(a1.pops, {part = v72, position = Vector3.new(v73.X, v73.Y, v73.Z + 0.35), color = a3, pitch = a5, age = -a4})
end
u23.emitBurst = function(a1, a2, a3)
    --[[
      name: emitBurst
      line: 969
    ]]
    local v74 = a1.burstHolders[a1.burstIndex + 1]
    a1.burstIndex = (a1.burstIndex + 1) % 2
    v74.part.CFrame = CFrame.new(a2)
    v74.emitter.Color = ColorSequence.new(a3)
    v74.emitter:Emit(10)
end
u23.clearTransientAnimations = function(a1)
    --[[
      name: clearTransientAnimations
      line: 976
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v75 = nil
    for _, v75 in a1.traces do
        v75 = nil
        for v77, value_5 in v75.parts do
            value_5.CFrame = u1
        end
    end
    while #a1.traces > 0 do
        local traces_1 = a1.traces
        traces_1[#traces_1] = nil
    end
    for _, value_6 in a1.pops do
        value_6.part.CFrame = u1
    end
    while #a1.pops > 0 do
        local v76 = a1.pops
        v76[#v76] = nil
    end
    while #a1.shakes > 0 do
        local v76 = a1.shakes
        v76[#v76] = nil
    end
end
u23.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 998
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
        u9 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    for n_9 = #a1.traces - 1, 0, -1 do
        local v77
        v77 = a1.traces[n_9 + 1]
        v77.age = v77.age + a2
        if v77.age < ONET_CONFIG_upv_1.traceSeconds then
            a1:layoutTrace(v77, (v77.age / ONET_CONFIG_upv_1.traceSeconds) * v77.totalLength)
            continue
        end
        local v78
        v78 = v77.age - ONET_CONFIG_upv_1.traceSeconds
        if v78 >= ONET_CONFIG_upv_1.traceFlashSeconds then
            local v79
            v79 = v78 - ONET_CONFIG_upv_1.traceFlashSeconds
            if v79 >= ONET_CONFIG_upv_1.traceFadeSeconds then
                for _, value_7 in v77.parts do
                    value_7.CFrame = u1
                end
                table.remove(a1.traces, n_9 + 1)
            else
                for _, value_8 in v77.parts do
                    value_8.Transparency = v79 / ONET_CONFIG_upv_1.traceFadeSeconds
                end
            end
        else
            a1:layoutTrace(v77, v77.totalLength)
            for _, value_9 in v77.parts do
                value_9.Color = u9
            end
            continue
        end
        local v79
    end
    for n_10 = #a1.pops - 1, 0, -1 do
        local v80
        v80 = a1.pops[n_10 + 1]
        v80.age = v80.age + a2
        if v80.age < 0 then
            continue
        end
        if not (v80.emitted) then
            v80.emitted = true
            a1:emitBurst(v80.position, v80.color)
            a1.context.audio.play("pop", {pitch = v80.pitch})
        end
        local v81 = math.min(v80.age / ONET_CONFIG_upv_1.popSeconds, 1)
        local v82 = ((v81 >= 0.35) and ((1 - ((v81 - 0.35) / 0.65)) * 1.2)) or ((v81 / 0.35) * 0.2 + 1)
        if v81 >= 1 then
            v80.part.CFrame = u1
            table.remove(a1.pops, n_10 + 1)
            continue
        end
        if v82 > 0.02 then
            v80.part.Size = Vector3.new(ONET_CONFIG_upv_1.tileWidth * v82, ONET_CONFIG_upv_1.tileWidth * v82, ONET_CONFIG_upv_1.tileDepth * v82)
            v80.part.CFrame = CFrame.new(v80.position) * CFrame.Angles(0, 0, v81 * 0.9)
        else
            v80.part.CFrame = u1
            table.remove(a1.pops, n_10 + 1)
        end
    end
    for n_11 = #a1.shakes - 1, 0, -1 do
        local v83
        v83 = a1.shakes[n_11 + 1]
        v83.age = v83.age + a2
        if ONET_CONFIG_upv_1.shakeSeconds > v83.age then
            a1:poseCell(v83.column, v83.row, (math.sin(v83.age * 55) * 0.14) * (1 - (v83.age / ONET_CONFIG_upv_1.shakeSeconds)))
        else
            a1:poseCell(v83.column, v83.row, 0)
            table.remove(a1.shakes, n_11 + 1)
        end
    end
end
u23.updateTimerBar = function(a1)
    --[[
      name: updateTimerBar
      line: 1073
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
        u12 (copy, index: 3)
    ]]
    local v84 = ((a1.timeLimitSeconds <= 0) and 0) or (math.clamp(a1.timeRemaining / a1.timeLimitSeconds, 0, 1))
    local v85 = a1.timeRemaining <= ONET_CONFIG_upv_1.timerWarningSeconds
    local v86 = math.floor(v84 * 240)
    if v86 == a1.displayedTimerTicks and v85 == a1.displayedWarn then
        return nil
    end
    a1.displayedTimerTicks = v86
    a1.displayedWarn = v85
    local v87 = math.max(a1.timerWidth * v84, 0.05)
    a1.timerFill.Size = Vector3.new(v87, 0.46, 0.5)
    a1.timerFill.CFrame = CFrame.new((a1.stage.origin.X - (a1.timerWidth / 2)) + (v87 / 2), a1.timerY, a1.timerZ)
    local timerFill_1 = a1.timerFill
    local v88
    if v85 then
        v88 = u13
    else
        v88 = u12
    end
    timerFill_1.Color = v88
end
local tbl_11 = {}
tbl_11.OnetGame = u23
return tbl_11