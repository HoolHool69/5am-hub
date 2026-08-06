-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardGestures_upv_1 = v1.BoardGestures
local BoardPicker_upv_1 = v1.BoardPicker
local GridCursor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "grid-cursor").GridCursor
local IsoBoardCamera_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "iso-board-camera").IsoBoardCamera
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local TouchControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "touch-button").TouchControls
local MINESWEEPER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "minesweeper-config").MINESWEEPER_CONFIG
local generateLevel_upv_1 = RuntimeLib_1.import(script, script.Parent, "minesweeper-levels").generateLevel
local v3 = RuntimeLib_1.import(script, script.Parent, "minesweeper-sim")
local cellKey_upv_1 = v3.cellKey
local chordCell_upv_1 = v3.chordCell
local freshBoard_upv_1 = v3.freshBoard
local isBoardWon_upv_1 = v3.isBoardWon
local isNumberSatisfied_upv_1 = v3.isNumberSatisfied
local keyColumn_upv_1 = v3.keyColumn
local keyRow_upv_1 = v3.keyRow
local neighborsOf_upv_1 = v3.neighborsOf
local remainingMineCount_upv_1 = v3.remainingMineCount
local revealCell_upv_1 = v3.revealCell
local toggleFlag_upv_1 = v3.toggleFlag
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(126, 205, 92)
local u3 = Color3.fromRGB(110, 190, 80)
local u4 = Color3.fromRGB(216, 198, 160)
local u5 = Color3.fromRGB(204, 186, 148)
local u6 = Color3.fromRGB(40, 66, 42)
local u7 = Color3.fromRGB(74, 108, 66)
local u8 = Color3.fromRGB(96, 66, 42)
local u9 = Color3.fromRGB(222, 64, 52)
local u10 = Color3.fromRGB(52, 50, 58)
local u11 = Color3.fromRGB(38, 36, 44)
local u12 = Color3.fromRGB(216, 86, 58)
local u13 = Color3.fromRGB(244, 240, 240)
local u14 = Color3.fromRGB(58, 124, 236)
local u15 = Color3.fromRGB(54, 62, 86)
local u16 = Color3.fromRGB(255, 216, 102)
local u17 = Color3.fromRGB(245, 245, 255)
local u18 = Color3.fromRGB(255, 92, 80)
local tbl_upv_1 = {Color3.fromRGB(44, 84, 235), Color3.fromRGB(34, 138, 52), Color3.fromRGB(212, 56, 44), Color3.fromRGB(40, 46, 134), Color3.fromRGB(138, 44, 38), Color3.fromRGB(32, 138, 138), Color3.fromRGB(36, 34, 40), Color3.fromRGB(108, 108, 118)}
local tbl_upv_2 = {}
tbl_upv_2.background = Color3.fromRGB(208, 74, 58)
tbl_upv_2.stroke = Color3.fromRGB(255, 214, 200)
tbl_upv_2.text = Color3.fromRGB(255, 240, 235)
local tbl_upv_3 = {}
tbl_upv_3.background = Color3.fromRGB(52, 66, 54)
tbl_upv_3.stroke = Color3.fromRGB(150, 172, 150)
tbl_upv_3.text = Color3.fromRGB(214, 224, 212)
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 113
    ]]
    return "MinesweeperGame"
end
tbl_5.__index = BaseWorldGame_upv_1
local u19 = setmetatable(tbl_4, tbl_5)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 119
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u19)
    return v4:constructor(...) or v4
end
u19.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 123
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = MINESWEEPER_CONFIG_upv_1.livesPerRun
    a1.minesHit = 0
    a1.isFlagModeOn = false
    a1.roundToken = 0
    a1.isInteractionLocked = false
    a1.isWinPending = false
    a1.cellVisuals = {}
    a1.flagVisuals = {}
    a1.mineVisuals = {}
    a1.strikeParts = {}
    a1.heartParts = {}
    a1.flagSlotByKey = {}
    a1.freeFlagSlots = {}
    a1.mineSlotsUsed = 0
    a1.revealWaves = {}
    a1.flagAnimations = {}
end
u19.buildScene = function(a1)
    --[[
      name: buildScene
      line: 143
      upvalues:
        BoardPicker_upv_1 (copy, index: 1)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 2)
        IsoBoardCamera_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u6 (copy, index: 5)
        u7 (copy, index: 6)
        makeStagePart_upv_1 (copy, index: 7)
        u1 (copy, index: 8)
        u8 (copy, index: 9)
        u9 (copy, index: 10)
        u10 (copy, index: 11)
        u11 (copy, index: 12)
        u13 (copy, index: 13)
        u14 (copy, index: 14)
        u17 (copy, index: 15)
        PopupTextPool_upv_1 (copy, index: 16)
        BoardGestures_upv_1 (copy, index: 17)
        GridCursor_upv_1 (copy, index: 18)
        TouchControls_upv_1 (copy, index: 19)
        tbl_upv_2 (copy, index: 20)
        tbl_upv_3 (copy, index: 21)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.picker = BoardPicker_upv_1.new(a1.stage, {cellPitch = MINESWEEPER_CONFIG_upv_1.cellPitch})
    a1.boardCamera = IsoBoardCamera_upv_1.new(a1.stage, MINESWEEPER_CONFIG_upv_1.camera)
    local v5 = makeSmoothPart_upv_1(container_1)
    v5.Size = Vector3.new(600, 1, 600)
    v5.Color = u6
    v5.CFrame = CFrame.new(origin_1 + Vector3.new(0, -14, 0))
    local Unit_1 = Vector3.new(MINESWEEPER_CONFIG_upv_1.camera.lookDirection.X, 0, MINESWEEPER_CONFIG_upv_1.camera.lookDirection.Z).Unit
    local v6 = makeSmoothPart_upv_1(container_1)
    v6.Size = Vector3.new(700, 300, 1)
    v6.Color = u7
    v6.CFrame = CFrame.lookAt(origin_1 + (Unit_1 * 140), origin_1 + (Unit_1 * 141))
    for _ = 0, 143 do
        local v7 = makeStagePart_upv_1(container_1)
        v7.Size = Vector3.new(2.619999885559082, 0.949999988079071, 2.619999885559082)
        v7.CFrame = u1
        local v8 = Instance.new("BillboardGui")
        v8.Size = UDim2.fromScale(1.9, 1.9)
        v8.StudsOffsetWorldSpace = Vector3.new(0, 0.17999999225139618, 0)
        v8.AlwaysOnTop = true
        v8.LightInfluence = 0
        v8.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        v8.Parent = v7
        local v9 = Instance.new("TextLabel")
        v9.BackgroundTransparency = 1
        v9.AnchorPoint = Vector2.new(0.5, 0.5)
        v9.Position = UDim2.fromScale(0.5, 0.5)
        v9.Size = UDim2.fromScale(1, 1)
        v9.Font = Enum.Font.GothamBlack
        v9.TextScaled = true
        v9.Visible = false
        v9.Parent = v8
        table.insert(a1.cellVisuals, {part = v7, label = v9})
    end
    for _ = 0, 143 do
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Size = Vector3.new(0.14000000059604645, 1.2000000476837158, 0.14000000059604645)
        v10.Color = u8
        v10.CFrame = u1
        local v11 = makeSmoothPart_upv_1(container_1)
        v11.Size = Vector3.new(0.949999988079071, 0.11999999731779099, 0.6200000047683716)
        v11.Color = u9
        v11.CFrame = u1
        table.insert(a1.flagVisuals, {pole = v10, pennant = v11})
    end
    for _ = 0, 29 do
        local v12 = makeSmoothPart_upv_1(container_1)
        v12.Shape = Enum.PartType.Ball
        v12.Size = Vector3.new(1.5, 1.5, 1.5)
        v12.Color = u10
        v12.CFrame = u1
        local tbl_6 = {}
        local v13 = makeSmoothPart_upv_1(container_1)
        v13.Size = Vector3.new(0.30000001192092896, 2.049999952316284, 0.30000001192092896)
        v13.Color = u11
        v13.CFrame = u1
        table.insert(tbl_6, v13)
        local v14 = makeSmoothPart_upv_1(container_1)
        v14.Size = Vector3.new(0.30000001192092896, 2.049999952316284, 0.30000001192092896)
        v14.Color = u11
        v14.CFrame = u1
        table.insert(tbl_6, v14)
        local v15 = makeSmoothPart_upv_1(container_1)
        v15.Size = Vector3.new(0.30000001192092896, 2.049999952316284, 0.30000001192092896)
        v15.Color = u11
        v15.CFrame = u1
        table.insert(tbl_6, v15)
        table.insert(a1.mineVisuals, {body = v12, spikes = tbl_6})
    end
    for _ = 0, 15 do
        local v16 = makeSmoothPart_upv_1(container_1)
        v16.Size = Vector3.new(1.899999976158142, 0.1599999964237213, 0.1599999964237213)
        v16.Color = u13
        v16.CFrame = u1
        table.insert(a1.strikeParts, v16)
    end
    for _ = 0, MINESWEEPER_CONFIG_upv_1.livesPerRun - 1 do
        local v17 = makeStagePart_upv_1(container_1)
        v17.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
        v17.Color = u14
        v17.CFrame = u1
        table.insert(a1.heartParts, v17)
    end
    a1.counterAnchor = Instance.new("Part")
    a1.counterAnchor.Anchored = true
    a1.counterAnchor.CanCollide = false
    a1.counterAnchor.CanQuery = false
    a1.counterAnchor.CanTouch = false
    a1.counterAnchor.Transparency = 1
    a1.counterAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.counterAnchor.CFrame = u1
    a1.counterAnchor.Parent = container_1
    local v18 = Instance.new("BillboardGui")
    v18.Size = UDim2.fromScale(9, 2.1)
    v18.AlwaysOnTop = true
    v18.Parent = a1.counterAnchor
    a1.counterLabel = Instance.new("TextLabel")
    a1.counterLabel.BackgroundTransparency = 1
    a1.counterLabel.Size = UDim2.fromScale(1, 1)
    a1.counterLabel.Font = Enum.Font.GothamBlack
    a1.counterLabel.TextScaled = true
    a1.counterLabel.TextColor3 = u17
    a1.counterLabel.TextStrokeTransparency = 0.5
    a1.counterLabel.Parent = v18
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    local tbl_7 = {}
    tbl_7.onCellTap = function(a2)
        --[[
          name: onCellTap
          line: 289
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellTap(a2)
    end
    tbl_7.onCellHold = function(a3)
        --[[
          name: onCellHold
          line: 292
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onFlagAction(a3)
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, {tapMaxSeconds = MINESWEEPER_CONFIG_upv_1.tapMaxSeconds, holdSeconds = MINESWEEPER_CONFIG_upv_1.holdToFlagSeconds}, tbl_7)
    local function onAltActivate_1(a4)
        --[[
          name: onAltActivate
          line: 304
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onFlagAction(a4)
    end
    local function onActivate_1(a5)
        --[[
          name: onActivate
          line: 301
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPrimaryAction(a5)
    end
    local function onMoved_1()
        --[[
          name: onMoved
          line: 307
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.context.audio.play("uiHover", {})
    end
    a1.cursor = GridCursor_upv_1.new(a1.context.input, a1.context.janitor, {picker = a1.picker, container = container_1, onActivate = onActivate_1, onAltActivate = onAltActivate_1, onMoved = onMoved_1})
    local v19 = TouchControls_upv_1.new({})
    a1.context.janitor:Add(v19, "destroy")
    local function onActivated_1()
        --[[
          name: onActivated
          line: 328
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.context.requestStart()
        a1:toggleFlagMode()
    end
    a1.flagButton = v19:addButton({anchorPoint = Vector2.new(1, 0.5), position = UDim2.new(1, -10, 0.3, 0), look = tbl_upv_2, disabledLook = tbl_upv_3, onActivated = onActivated_1})
    a1.flagButton:setEnabled(false)
end
u19.resetRound = function(a1)
    --[[
      name: resetRound
      line: 337
      upvalues:
        MINESWEEPER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = MINESWEEPER_CONFIG_upv_1.livesPerRun
    a1.minesHit = 0
    a1:setFlagMode(false)
    a1:loadLevel()
    a1.context.reportScore(0)
end
u19.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 346
    ]]
    a1.cursor:update(a2)
end
u19.render = function(a1, a2)
    --[[
      name: render
      line: 349
    ]]
    a1.boardCamera:update()
    a1.gestures:update()
    a1:advanceAnimations(a2)
end
u19.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 354
    ]]
    a1.boardCamera:update()
    a1.gestures:update()
    a1.cursor:update(a2)
    a1:advanceAnimations(a2)
end
u19.revive = function(a1)
    --[[
      name: revive
      line: 360
      upvalues:
        MINESWEEPER_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = MINESWEEPER_CONFIG_upv_1.livesPerRun
    a1:rebuildBoardState()
    a1:setRunning(true)
end
u19.captureRound = function(a1)
    --[[
      name: captureRound
      line: 367
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u19.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 370
      upvalues:
        MINESWEEPER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v20 = string.split(a2.state, "|")
    if #v20 == 3 then
        local v21 = nil
        if v20[1] == "1" then
            v21 = tonumber(v20[2])
            local num_1 = tonumber(v20[3])
            if v21 ~= nil and num_1 ~= nil and v21 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v21)
                a1.lives = math.clamp(math.floor(num_1), 1, MINESWEEPER_CONFIG_upv_1.livesPerRun)
                a1:loadLevel()
                a1.context.reportScore(a2.score)
                return true
            end
            return false
        end
    end
    return false
end
u19.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 389
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 2)
        u17 (copy, index: 3)
    ]]
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    local spec_1 = a1.generated.spec
    a1.picker:setSpec({columns = spec_1.columns, rows = spec_1.rows, cellPitch = MINESWEEPER_CONFIG_upv_1.cellPitch})
    a1.boardCamera:setBoardExtent(math.max(spec_1.columns, spec_1.rows) * MINESWEEPER_CONFIG_upv_1.cellPitch)
    a1.cursor:setCell(a1.cursor:getCell())
    a1:rebuildBoardState()
    local origin_2 = a1.stage.origin
    a1.popups:show(origin_2 + Vector3.new(0, 8, 0), ("LEVEL %*"):format(a1.level), u17, 0.9)
    a1.popups:show(origin_2 + Vector3.new(0, 5.599999904632568, 0), ("MINES %*"):format(#spec_1.mineKeys), u17, 0.62)
end
u19.rebuildBoardState = function(a1)
    --[[
      name: rebuildBoardState
      line: 409
      upvalues:
        freshBoard_upv_1 (copy, index: 1)
        revealCell_upv_1 (copy, index: 2)
    ]]
    a1.board = freshBoard_upv_1(a1.generated.spec)
    table.clear(a1.revealWaves)
    table.clear(a1.flagAnimations)
    a1.mineCascade = nil
    a1.isWinPending = false
    a1.isInteractionLocked = false
    a1.mineSlotsUsed = 0
    a1.gestures:cancel()
    a1:dressBoard()
    a1:updateHearts()
    a1:updateCounter()
    local v22 = revealCell_upv_1(a1.board, a1.generated.spec.startKey)
    if v22.kind ~= "revealed" then
        return
    end
    a1:startRevealWave(v22.rings)
end
u19.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 427
      upvalues:
        u1 (copy, index: 1)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local spec_2 = a1.generated.spec
    for n_1 = 0, 143 do
        if n_1 >= spec_2.columns * spec_2.rows then
            local v23 = a1.cellVisuals[n_1 + 1]
            v23.part.CFrame = u1
            v23.label.Visible = false
        else
            a1:dressCellHidden(n_1)
        end
    end
    table.clear(a1.flagSlotByKey)
    table.clear(a1.freeFlagSlots)
    for n_2 = 143, 0, -1 do
        table.insert(a1.freeFlagSlots, n_2)
    end
    for _, value_1 in a1.flagVisuals do
        value_1.pole.CFrame = u1
        value_1.pennant.CFrame = u1
        value_1.pennant.Size = Vector3.new(0.949999988079071, 0.11999999731779099, 0.6200000047683716)
    end
    local v24 = nil
    for _, v24 in a1.mineVisuals do
        v24.body.CFrame = u1
        v24 = nil
        for v26, value_2 in v24.spikes do
            value_2.CFrame = u1
        end
    end
    for _, value_3 in a1.strikeParts do
        value_3.CFrame = u1
    end
    local v25 = a1.picker:cellWorld(0, spec_2.rows - 1)
    for n_3 = 0, #a1.heartParts - 1 do
        a1.heartParts[n_3 + 1].CFrame = CFrame.new(v25 + Vector3.new((n_3 * 1.7) - (MINESWEEPER_CONFIG_upv_1.cellPitch * 0.6), 0.9, MINESWEEPER_CONFIG_upv_1.cellPitch * 1.5))
    end
    a1.counterAnchor.CFrame = CFrame.new(a1.picker:cellWorld(spec_2.columns - 1, spec_2.rows - 1) + Vector3.new(-MINESWEEPER_CONFIG_upv_1.cellPitch * 0.5, 0.9, MINESWEEPER_CONFIG_upv_1.cellPitch * 1.5))
end
u19.dressCellHidden = function(a1, a2)
    --[[
      name: dressCellHidden
      line: 479
      upvalues:
        keyColumn_upv_1 (copy, index: 1)
        keyRow_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        u3 (copy, index: 4)
    ]]
    local spec_3 = a1.generated.spec
    local v26 = a1.cellVisuals[a2 + 1]
    local v27 = keyColumn_upv_1(spec_3.columns, a2)
    local v28 = keyRow_upv_1(spec_3.columns, a2)
    local v29 = a1.picker:cellWorld(v27, v28)
    v26.part.Size = Vector3.new(2.619999885559082, 0.949999988079071, 2.619999885559082)
    local part_1 = v26.part
    local v30
    if (v27 + v28) % 2 ~= 0 then
        v30 = u3
    else
        v30 = u2
    end
    part_1.Color = v30
    v26.part.TopSurface = Enum.SurfaceType.Studs
    v26.part.CFrame = CFrame.new(v29.X, v29.Y - 0.4749999940395355, v29.Z)
    v26.label.Visible = false
end
u19.morphCellToDirt = function(a1, a2)
    --[[
      name: morphCellToDirt
      line: 491
      upvalues:
        keyColumn_upv_1 (copy, index: 1)
        keyRow_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        u5 (copy, index: 4)
    ]]
    local spec_4 = a1.generated.spec
    local v31 = a1.cellVisuals[a2 + 1]
    local v32 = keyColumn_upv_1(spec_4.columns, a2)
    local v33 = keyRow_upv_1(spec_4.columns, a2)
    local v34 = a1.picker:cellWorld(v32, v33)
    v31.part.Size = Vector3.new(2.619999885559082, 0.3199999928474426, 2.619999885559082)
    local part_2 = v31.part
    local v35
    if (v32 + v33) % 2 ~= 0 then
        v35 = u5
    else
        v35 = u4
    end
    part_2.Color = v35
    v31.part.TopSurface = Enum.SurfaceType.Weld
    v31.part.CFrame = CFrame.new(v34.X, (v34.Y - 0.55) - 0.1599999964237213, v34.Z)
end
u19.dressCellRevealed = function(a1, a2)
    --[[
      name: dressCellRevealed
      line: 503
      upvalues:
        tbl_upv_1 (copy, index: 1)
        isNumberSatisfied_upv_1 (copy, index: 2)
    ]]
    a1:morphCellToDirt(a2)
    local v36 = a1.cellVisuals[a2 + 1]
    local v37 = a1.board.counts[a2 + 1]
    if v37 <= 0 then
        v36.label.Visible = false
    else
        v36.label.Text = ("%*"):format(v37)
        v36.label.TextColor3 = tbl_upv_1[math.min(v37, 8)]
        local label_1 = v36.label
        label_1.TextTransparency = isNumberSatisfied_upv_1(a1.board, a2) and 0.55 or 0
        v36.label.Visible = true
    end
end
u19.dressCellSocket = function(a1, a2)
    --[[
      name: dressCellSocket
      line: 516
    ]]
    a1:morphCellToDirt(a2)
    a1.cellVisuals[a2 + 1].label.Visible = false
end
u19.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 520
      upvalues:
        u14 (copy, index: 1)
        u15 (copy, index: 2)
    ]]
    local v39 = nil
    for n_4 = 0, #a1.heartParts - 1 do
        local v40 = a1.heartParts[n_4 + 1]
        if n_4 >= a1.lives then
            v39 = u15
        else
            v39 = u14
        end
        v40.Color = v39
        if n_4 >= a1.lives then
            v39 = 0.45
        else
            v39 = 0
        end
        v40.Transparency = v39
    end
end
u19.updateCounter = function(a1)
    --[[
      name: updateCounter
      line: 527
      upvalues:
        remainingMineCount_upv_1 (copy, index: 1)
    ]]
    a1.counterLabel.Text = ("\240\159\146\163 %*"):format(remainingMineCount_upv_1(a1.board))
end
u19.canAct = function(a1)
    --[[
      name: canAct
      line: 531
    ]]
    local v41 = a1:isRunning() and (not a1.isInteractionLocked)
    return v41
end
u19.onCellTap = function(a1, a2)
    --[[
      name: onCellTap
      line: 534
    ]]
    if a1.isFlagModeOn then
        a1:onFlagAction(a2)
    else
        a1:onPrimaryAction(a2)
    end
end
u19.onPrimaryAction = function(a1, a2)
    --[[
      name: onPrimaryAction
      line: 541
      upvalues:
        cellKey_upv_1 (copy, index: 1)
        chordCell_upv_1 (copy, index: 2)
        revealCell_upv_1 (copy, index: 3)
    ]]
    local v42 = nil
    if a1:canAct() then
        v42 = cellKey_upv_1(a1.generated.spec.columns, a2.column, a2.row)
        if a1.board.revealed[v42] == nil then
            if a1.board.flags[v42] == nil then
                a1:applyRevealOutcome(revealCell_upv_1(a1.board, v42))
            else
                return nil
            end
        else
            a1:applyRevealOutcome(chordCell_upv_1(a1.board, v42))
            return nil
        end
    else
        return nil
    end
end
u19.onFlagAction = function(a1, a2)
    --[[
      name: onFlagAction
      line: 557
      upvalues:
        cellKey_upv_1 (copy, index: 1)
        toggleFlag_upv_1 (copy, index: 2)
    ]]
    local v43 = nil
    if a1:canAct() then
        local v44 = cellKey_upv_1(a1.generated.spec.columns, a2.column, a2.row)
        v43 = toggleFlag_upv_1(a1.board, v44)
        if v43 ~= "ignored" then
            if v43 ~= "planted" then
                a1:hideFlag(v44)
            else
                a1:showFlag(v44, true)
            end
            a1:updateCounter()
            a1:refreshSatisfiedNumbersAround(v44)
        else
            return nil
        end
    else
        return nil
    end
end
u19.applyRevealOutcome = function(a1, a2)
    --[[
      name: applyRevealOutcome
      line: 575
      upvalues:
        isBoardWon_upv_1 (copy, index: 1)
    ]]
    if a2.kind == "ignored" then
        return nil
    elseif a2.kind ~= "mine" then
        a1:startRevealWave(a2.rings)
        if isBoardWon_upv_1(a1.board) then
            a1.isWinPending = true
            a1.isInteractionLocked = true
        end
    else
        a1:onMineHit(a2.hitKeys)
        return nil
    end
end
u19.setFlagMode = function(a1, a2)
    --[[
      name: setFlagMode
      line: 590
    ]]
    a1.isFlagModeOn = a2
    a1.flagButton:setEnabled(a2)
end
u19.toggleFlagMode = function(a1)
    --[[
      name: toggleFlagMode
      line: 594
      upvalues:
        u17 (copy, index: 1)
    ]]
    a1:setFlagMode(not a1.isFlagModeOn)
    a1.context.audio.play("uiTap", {})
    a1.popups:show(a1.stage.origin + Vector3.new(0, 8, 0), ((a1.isFlagModeOn) and "FLAG MODE") or "DIG MODE", u17, 0.7)
end
u19.showFlag = function(a1, a2, a3)
    --[[
      name: showFlag
      line: 604
      upvalues:
        keyColumn_upv_1 (copy, index: 1)
        keyRow_upv_1 (copy, index: 2)
    ]]
    local freeFlagSlots_1 = a1.freeFlagSlots
    local v45 = #freeFlagSlots_1
    local v46 = freeFlagSlots_1[v45]
    freeFlagSlots_1[v45] = nil
    if v46 ~= nil then
        a1.flagSlotByKey[a2] = v46
        local spec_5 = a1.generated.spec
        local v47 = a1.picker:cellWorld(keyColumn_upv_1(spec_5.columns, a2), keyRow_upv_1(spec_5.columns, a2))
        local v48 = a1.flagVisuals[v46 + 1]
        v48.pole.CFrame = CFrame.new(v47.X, v47.Y + 0.6000000238418579, v47.Z)
        v48.pennant.Size = (a3 and Vector3.new(0.2849999964237213, 0.036000002175569534, 0.1860000044107437)) or Vector3.new(0.949999988079071, 0.11999999731779099, 0.6200000047683716)
        v48.pennant.CFrame = CFrame.new(v47.X + 0.44, v47.Y + 0.9840000391006469, v47.Z)
        if a3 then
            table.insert(a1.flagAnimations, {slot = v46})
            a1.context.audio.play("pop", {})
        end
    else
        return nil
    end
end
u19.hideFlag = function(a1, a2)
    --[[
      name: hideFlag
      line: 644
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v49 = a1.flagSlotByKey[a2]
    if v49 ~= nil then
        a1.flagSlotByKey[a2] = nil
        local v50 = a1.flagVisuals[v49 + 1]
        v50.pole.CFrame = u1
        v50.pennant.CFrame = u1
        v50.pennant.Size = Vector3.new(0.949999988079071, 0.11999999731779099, 0.6200000047683716)
        table.insert(a1.freeFlagSlots, v49)
        for n_5 = #a1.flagAnimations - 1, 0, -1 do
            if a1.flagAnimations[n_5 + 1].slot == v49 then
                table.remove(a1.flagAnimations, n_5 + 1)
            end
        end
        a1.context.audio.play("pop", {})
    else
        return nil
    end
end
u19.refreshSatisfiedNumbersAround = function(a1, a2)
    --[[
      name: refreshSatisfiedNumbersAround
      line: 673
      upvalues:
        neighborsOf_upv_1 (copy, index: 1)
        isNumberSatisfied_upv_1 (copy, index: 2)
    ]]
    local spec_6 = a1.generated.spec
    local v51 = nil
    local v52 = nil
    for _, value_4 in neighborsOf_upv_1(spec_6.columns, spec_6.rows, a2) do
        if a1.board.revealed[value_4] == nil then
            continue
        end
        if a1.board.counts[value_4 + 1] > 0 then
            v51 = a1.cellVisuals[value_4 + 1].label
            v52 = ((isNumberSatisfied_upv_1(a1.board, value_4)) and 0.55) or 0
            v51.TextTransparency = v52
        end
    end
end
u19.startRevealWave = function(a1, a2)
    --[[
      name: startRevealWave
      line: 685
      upvalues:
        MINESWEEPER_CONFIG_upv_1 (copy, index: 1)
    ]]
    table.insert(a1.revealWaves, {rings = a2, ringDelaySeconds = math.min(MINESWEEPER_CONFIG_upv_1.revealRingSeconds, MINESWEEPER_CONFIG_upv_1.revealWaveMaxSeconds / math.max(#a2, 1))})
end
u19.onMineHit = function(a1, a2)
    --[[
      name: onMineHit
      line: 697
    ]]
    a1.isInteractionLocked = true
    a1.minesHit = a1.minesHit + 1
    a1.gestures:cancel()
    local v53 = a2[1]
    a1:dressCellSocket(v53)
    a1:showMine(v53, true)
    a1.context.audio.play("explosion", {})
    a1.stage.shake(1.4)
    a1:hitStop(0.06)
    a1:buildMineCascade(a2)
end
u19.buildMineCascade = function(a1, a2)
    --[[
      name: buildMineCascade
      line: 712
      upvalues:
        keyColumn_upv_1 (copy, index: 1)
        keyRow_upv_1 (copy, index: 2)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 3)
    ]]
    local spec_7 = a1.generated.spec
    local v54 = a2[1]
    local v55 = keyColumn_upv_1(spec_7.columns, v54)
    local v56 = keyRow_upv_1(spec_7.columns, v54)
    local tbl_8 = {}
    for n_6 = 1, #a2 - 1 do
        tbl_8[a2[n_6 + 1]] = true
    end
    local tbl_9 = {}
    local v58 = 0
    local v59 = nil
    local v60 = nil
    for _, v61 in spec_7.mineKeys do
        if v61 == v54 or a1.board.flags[v61] ~= nil then
            continue
        end
        v59 = ((tbl_8[v61] ~= nil) and 1) or (math.max(math.abs(keyColumn_upv_1(spec_7.columns, v61) - v55), math.abs(keyRow_upv_1(spec_7.columns, v61) - v56)))
        v60 = tbl_9[v59]
        if v60 ~= nil then
            table.insert(v60, v61)
        else
            tbl_9[v59] = {v61}
        end
        v58 = math.max(v58, v59)
    end
    local tbl_10 = {}
    local v62, tbl_11
    v62, tbl_11 = false, 1
    if v62 then
        tbl_11 = tbl_11 + 1
    else
        v62 = true
    end
    local v61 = nil
    if tbl_11 <= v58 then
        v61 = tbl_9[tbl_11]
        if v61 ~= nil then
            table.insert(tbl_10, v61)
        end
        if v62 then
            tbl_11 = tbl_11 + 1
        else
            v62 = true
        end
        --[[ goto label_15 ]]--
    end
    tbl_11 = {}
    for key_1 in a1.board.flags do
        if a1.board.mines[key_1] == nil then
            table.insert(tbl_11, key_1)
        end
    end
    local v63 = #tbl_10 * MINESWEEPER_CONFIG_upv_1.mineCascadeRingSeconds + MINESWEEPER_CONFIG_upv_1.strikeDelaySeconds
    local key_1 = ((#tbl_11 <= 0) and (MINESWEEPER_CONFIG_upv_1.postMortemSeconds * 0.55)) or (MINESWEEPER_CONFIG_upv_1.postMortemSeconds)
    local tbl_12 = {}
    tbl_12.rings = tbl_10
    tbl_12.wrongFlagKeys = tbl_11
    tbl_12.strikeAtSeconds = v63
    tbl_12.resolveAtSeconds = v63 + key_1
    a1.mineCascade = tbl_12
end
u19.showMine = function(a1, a2, a3)
    --[[
      name: showMine
      line: 782
      upvalues:
        keyColumn_upv_1 (copy, index: 1)
        keyRow_upv_1 (copy, index: 2)
        u12 (copy, index: 3)
        u10 (copy, index: 4)
    ]]
    if a1.mineSlotsUsed < 30 then
        local v64 = a1.mineVisuals[a1.mineSlotsUsed + 1]
        local spec_8 = a1.generated.spec
        local v65 = a1.picker:cellWorld(keyColumn_upv_1(spec_8.columns, a2), keyRow_upv_1(spec_8.columns, a2))
        local v66 = CFrame.new(v65.X, v65.Y + -0.15, v65.Z)
        local v67 = CFrame.Angles(0, a1.mineSlotsUsed * 0.7, 0)
        local body_1 = v64.body
        local v68
        if a3 then
            v68 = u12
        else
            v68 = u10
        end
        body_1.Color = v68
        v64.body.CFrame = v66
        v64.spikes[1].CFrame = v66 * v67
        v64.spikes[2].CFrame = (v66 * v67) * CFrame.Angles(0, 0, 1.5707963267948966)
        v64.spikes[3].CFrame = (v66 * v67) * CFrame.Angles(1.5707963267948966, 0, 0)
        a1.mineSlotsUsed = a1.mineSlotsUsed + 1
    else
        return nil
    end
end
u19.showWrongFlagStrikes = function(a1, a2)
    --[[
      name: showWrongFlagStrikes
      line: 802
      upvalues:
        keyColumn_upv_1 (copy, index: 1)
        keyRow_upv_1 (copy, index: 2)
    ]]
    if #a2 ~= 0 then
        local spec_9 = a1.generated.spec
        local v69 = 0
        local v70 = false
        while true do
            if v70 then
                v69 = v69 + 1
            else
                v70 = true
            end
            if v69 >= #a2 or v69 >= 16 then
                break
            end
            local v71 = a2[v69 + 1]
            local v72 = a1.picker:cellWorld(keyColumn_upv_1(spec_9.columns, v71), keyRow_upv_1(spec_9.columns, v71))
            a1.strikeParts[v69 + 1].CFrame = CFrame.new(v72.X + 0.35, v72.Y + 1.28, v72.Z + 0.18) * CFrame.Angles(0, 0, -0.5235987755982988)
        end
        a1.context.audio.play("buzz", {})
    else
        return nil
    end
end
u19.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 831
      upvalues:
        MINESWEEPER_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_7 = #a1.revealWaves - 1, 0, -1 do
        local v73 = a1.revealWaves[n_7 + 1]
        v73.age = v73.age + a2
        while v73.ringsShown < #v73.rings and v73.ringsShown * v73.ringDelaySeconds <= v73.age do
            for _, value_5 in v73.rings[v73.ringsShown + 1] do
                a1:dressCellRevealed(value_5)
            end
            a1.context.audio.play("scorePing", {pitch = math.min(0.9 + (v73.ringsShown * 0.07), 1.7)})
            v73.ringsShown = v73.ringsShown + 1
        end
        if #v73.rings <= v73.ringsShown then
            table.remove(a1.revealWaves, n_7 + 1)
        end
    end
    if a1.isWinPending and #a1.revealWaves == 0 and a1.mineCascade == nil then
        a1.isWinPending = false
        a1:celebrateWin()
    end
    for n_8 = #a1.flagAnimations - 1, 0, -1 do
        local v74
        v74 = a1.flagAnimations[n_8 + 1]
        v74.age = v74.age + a2
        local v75
        if v74.kind ~= "plant" then
            v75 = MINESWEEPER_CONFIG_upv_1.flagPulseSeconds
        else
            v75 = MINESWEEPER_CONFIG_upv_1.flagPlantSeconds
        end
        local v76
        v76 = (v74.age - v74.delaySeconds) / v75
        if v76 < 0 then
            continue
        end
        if not (v74.hasPlayedSound) then
            v74.hasPlayedSound = true
            a1.context.audio.play("pop", {pitch = v74.soundPitch})
        end
        local v77 = math.min(v76, 1)
        local pennant_1 = a1.flagVisuals[v74.slot + 1].pennant
        local v78 = ((v74.kind ~= "plant") and (math.sin(math.pi * v77) * 0.3 + 1)) or (((1 - ((1 - v77) * (1 - v77))) * 0.7) + 0.3 + math.sin(math.pi * v77) * 0.18)
        pennant_1.Size = Vector3.new(0.949999988079071, 0.11999999731779099, 0.6200000047683716) * v78
        if v76 >= 1 then
            pennant_1.Size = Vector3.new(0.949999988079071, 0.11999999731779099, 0.6200000047683716)
            table.remove(a1.flagAnimations, n_8 + 1)
        end
    end
    local mineCascade_1 = a1.mineCascade
    if mineCascade_1 == nil then
        return
    end
    mineCascade_1.age = mineCascade_1.age + a2
    while mineCascade_1.ringsShown < #mineCascade_1.rings and (mineCascade_1.ringsShown + 1) * MINESWEEPER_CONFIG_upv_1.mineCascadeRingSeconds <= mineCascade_1.age do
        for _, value_6 in mineCascade_1.rings[mineCascade_1.ringsShown + 1] do
            a1:dressCellSocket(value_6)
            a1:showMine(value_6, false)
        end
        a1.context.audio.play("thud", {pitch = math.max(1.05 - (mineCascade_1.ringsShown * 0.05), 0.7)})
        mineCascade_1.ringsShown = mineCascade_1.ringsShown + 1
    end
    if not (mineCascade_1.hasShownStrikes) and mineCascade_1.strikeAtSeconds <= mineCascade_1.age then
        mineCascade_1.hasShownStrikes = true
        a1:showWrongFlagStrikes(mineCascade_1.wrongFlagKeys)
    end
    if mineCascade_1.resolveAtSeconds > mineCascade_1.age then
        return
    end
    a1.mineCascade = nil
    a1:resolveLifeLoss()
end
u19.resolveLifeLoss = function(a1)
    --[[
      name: resolveLifeLoss
      line: 917
      upvalues:
        u18 (copy, index: 1)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 2)
        u17 (copy, index: 3)
    ]]
    a1.lives = a1.lives - 1
    a1:updateHearts()
    local origin_3 = a1.stage.origin
    if a1.lives > 0 then
        a1.popups:show(origin_3 + Vector3.new(0, 8.399999618530273, 0), "BOOM!", u18, 1.1)
        a1.popups:show(origin_3 + Vector3.new(0, 5.800000190734863, 0), "SAME MINES \226\128\148 DIG AGAIN", u17, 0.62)
        a1:rebuildBoardState()
    else
        a1.popups:show(origin_3 + Vector3.new(0, 8, 0), "OUT OF LIVES!", u18, 1.2)
        a1:setRunning(false)
        local roundToken_upv_1 = a1.roundToken
        local u20 = a1.level - 1
        task.delay(
            MINESWEEPER_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 928
                  upvalues:
                    roundToken_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                    u20 (copy, index: 3)
                ]]
                if roundToken_upv_1 == a1.roundToken then
                    a1.context.endRun(u20)
                else
                    return nil
                end
            end
        )
        return nil
    end
end
u19.celebrateWin = function(a1)
    --[[
      name: celebrateWin
      line: 944
      upvalues:
        toggleFlag_upv_1 (copy, index: 1)
        MINESWEEPER_CONFIG_upv_1 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    for _, value_7 in a1.generated.spec.mineKeys do
        if a1.board.flags[value_7] == nil then
            toggleFlag_upv_1(a1.board, value_7)
            a1:showFlag(value_7, false)
        end
    end
    a1:updateCounter()
    local v79 = 0
    for _, value_8 in a1.flagSlotByKey do
        table.insert(a1.flagAnimations, {slot = value_8, delaySeconds = math.min(v79 * MINESWEEPER_CONFIG_upv_1.flagPulseStaggerSeconds, 0.45), soundPitch = math.min((v79 * 0.04) + 1, 1.6)})
        v79 = v79 + 1
    end
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("coinSettle", {})
    a1.popups:show(a1.stage.origin + Vector3.new(0, 8, 0), ("LEVEL %*"):format(a1.level), u16, 1.3)
    a1.context.reportScore(a1.level)
    a1.level = a1.level + 1
    local roundToken_upv_2 = a1.roundToken
    task.delay(
        MINESWEEPER_CONFIG_upv_1.nextLevelDelaySeconds,
        function()
            --[[
              line: 982
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
end
local tbl_13 = {}
tbl_13.MinesweeperGame = u19
return tbl_13