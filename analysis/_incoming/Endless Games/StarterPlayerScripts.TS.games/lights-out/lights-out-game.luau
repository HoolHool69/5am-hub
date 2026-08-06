-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardGestures_upv_1 = v1.BoardGestures
local BoardPicker_upv_1 = v1.BoardPicker
local GridCursor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "grid-cursor").GridCursor
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local LIGHTS_OUT_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "lights-out-config").LIGHTS_OUT_CONFIG
local v3 = RuntimeLib_1.import(script, script.Parent, "lights-out-levels")
local generateLevel_upv_1 = v3.generateLevel
local pressBudget_upv_1 = v3.pressBudget
local v4 = RuntimeLib_1.import(script, script.Parent, "lights-out-sim")
local applyPress_upv_1 = v4.applyPress
local hasBit_upv_1 = v4.hasBit
local isSolved_upv_1 = v4.isSolved
local popcount_upv_1 = v4.popcount
local u1 = CFrame.new(0, -1000, 0)
local u2 = LIGHTS_OUT_CONFIG_upv_1.maxBoardSize * LIGHTS_OUT_CONFIG_upv_1.maxBoardSize
local u3 = Color3.fromRGB(13, 15, 24)
local u4 = Color3.fromRGB(198, 207, 228)
local u5 = Color3.fromRGB(232, 216, 180)
local u6 = Color3.fromRGB(28, 31, 46)
local u7 = Color3.fromRGB(40, 43, 60)
local u8 = Color3.fromRGB(255, 199, 92)
local u9 = Color3.fromRGB(56, 62, 84)
local u10 = Color3.fromRGB(255, 222, 128)
local u11 = Color3.fromRGB(58, 124, 236)
local u12 = Color3.fromRGB(58, 62, 84)
local u13 = Color3.fromRGB(255, 216, 102)
local u14 = Color3.fromRGB(245, 245, 255)
local u15 = Color3.fromRGB(255, 92, 80)
local u16 = Color3.fromRGB(255, 231, 166)
local u17 = Color3.fromRGB(255, 150, 70)
local u18 = Color3.fromRGB(255, 92, 80)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 67
    ]]
    return "LightsOutGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u19 = setmetatable(tbl_1, tbl_2)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 73
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u19)
    return v5:constructor(...) or v5
end
u19.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 77
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = LIGHTS_OUT_CONFIG_upv_1.livesPerRun
    a1.overruns = 0
    a1.boardSize = 5
    a1.state = 0
    a1.litCount = 0
    a1.pressesUsed = 0
    a1.budget = 0
    a1.roundToken = 0
    a1.winAge = -1
    a1.winFlashDone = false
    a1.winPopupDone = false
    a1.resetPending = false
    a1.hintShown = false
    a1.animationClock = 0
    a1.pulseWasActive = false
    a1.cellPlates = {}
    a1.cellGlows = {}
    a1.frameBars = {}
    a1.heartParts = {}
    a1.shownLit = {}
    a1.pendingFlip = {}
    a1.popAge = {}
    a1.cellPositions = {}
end
u19.buildScene = function(a1)
    --[[
      name: buildScene
      line: 104
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u5 (copy, index: 4)
        u4 (copy, index: 5)
        makeStagePart_upv_1 (copy, index: 6)
        u6 (copy, index: 7)
        u1 (copy, index: 8)
        u7 (copy, index: 9)
        u2 (copy, index: 10)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 11)
        u10 (copy, index: 12)
        u11 (copy, index: 13)
        u16 (copy, index: 14)
        PopupTextPool_upv_1 (copy, index: 15)
        BoardPicker_upv_1 (copy, index: 16)
        BoardGestures_upv_1 (copy, index: 17)
        GridCursor_upv_1 (copy, index: 18)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    makeFrontalBackdrop_upv_1(a1.stage, u3, Enum.Material.SmoothPlastic)
    local v6 = nil
    for n_1 = 0, 55 do
        local v7 = makeSmoothPart_upv_1(container_1)
        local v8 = 0.15 + math.random() * 0.27
        v7.Size = Vector3.new(v8, v8, 0.1)
        if n_1 % 7 ~= 0 then
            v6 = u4
        else
            v6 = u5
        end
        v7.Color = v6
        v7.Transparency = 0.05 + (math.random() * 0.4)
        v7.CFrame = CFrame.new(origin_1 + Vector3.new((math.random() - 0.5) * 130, (math.random() - 0.5) * 80, -20 - (math.random() * 14)))
    end
    a1.panelPlate = makeStagePart_upv_1(container_1)
    a1.panelPlate.Color = u6
    a1.panelPlate.CFrame = u1
    for _ = 0, 3 do
        local v9 = makeSmoothPart_upv_1(container_1)
        v9.Color = u7
        v9.CFrame = u1
        table.insert(a1.frameBars, v9)
    end
    local v10, v11
    v10, v11 = false, 0
    while true do
        if v10 then
            v11 = v11 + 1
        else
            v10 = true
        end
        if v11 >= u2 then
            break
        end
        local v12 = makeStagePart_upv_1(container_1)
        v12.Size = Vector3.new(LIGHTS_OUT_CONFIG_upv_1.cellSize, LIGHTS_OUT_CONFIG_upv_1.cellSize, LIGHTS_OUT_CONFIG_upv_1.plateDepth)
        v12.CFrame = u1
        table.insert(a1.cellPlates, v12)
        local v13 = makeSmoothPart_upv_1(container_1)
        v13.Material = Enum.Material.Neon
        v13.Color = u10
        v13.Size = Vector3.new(LIGHTS_OUT_CONFIG_upv_1.cellSize + 0.3, LIGHTS_OUT_CONFIG_upv_1.cellSize + 0.3, 0.3)
        v13.Transparency = 0.1
        v13.CFrame = u1
        table.insert(a1.cellGlows, v13)
        table.insert(a1.shownLit, false)
        table.insert(a1.pendingFlip, -1)
        table.insert(a1.popAge, -1)
        table.insert(a1.cellPositions, Vector3.new(0, 0, 0))
    end
    for _ = 0, LIGHTS_OUT_CONFIG_upv_1.livesPerRun - 1 do
        local v14 = makeStagePart_upv_1(container_1)
        v14.Size = Vector3.new(1.149999976158142, 1.149999976158142, 1.149999976158142)
        v14.Color = u11
        v14.CFrame = u1
        table.insert(a1.heartParts, v14)
    end
    a1.budgetPart = Instance.new("Part")
    a1.budgetPart.Anchored = true
    a1.budgetPart.CanCollide = false
    a1.budgetPart.CanQuery = false
    a1.budgetPart.CanTouch = false
    a1.budgetPart.Transparency = 1
    a1.budgetPart.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.budgetPart.CFrame = u1
    a1.budgetPart.Parent = container_1
    v11 = Instance.new("BillboardGui")
    v11.Size = UDim2.fromScale(14, 2)
    v11.AlwaysOnTop = true
    v11.Parent = a1.budgetPart
    a1.budgetLabel = Instance.new("TextLabel")
    a1.budgetLabel.BackgroundTransparency = 1
    a1.budgetLabel.Size = UDim2.fromScale(1, 1)
    a1.budgetLabel.Font = Enum.Font.GothamBlack
    a1.budgetLabel.TextScaled = true
    a1.budgetLabel.TextColor3 = u16
    a1.budgetLabel.TextStrokeTransparency = 0.5
    a1.budgetLabel.Parent = v11
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    a1.picker = BoardPicker_upv_1.new(a1.stage, {columns = a1.boardSize, rows = a1.boardSize, cellPitch = LIGHTS_OUT_CONFIG_upv_1.cellPitch})
    local tbl_3 = {}
    local tbl_4 = {}
    tbl_4.onCellTap = function(a2)
        --[[
          name: onCellTap
          line: 204
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellPressed(a2)
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, tbl_3, tbl_4)
    local function onMoved_1()
        --[[
          name: onMoved
          line: 215
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.context.audio.play("uiTap", {})
    end
    local function onActivate_1(a3)
        --[[
          name: onActivate
          line: 212
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellPressed(a3)
    end
    a1.cursor = GridCursor_upv_1.new(a1.context.input, a1.context.janitor, {picker = a1.picker, container = container_1, onActivate = onActivate_1, onMoved = onMoved_1})
end
u19.resetRound = function(a1)
    --[[
      name: resetRound
      line: 224
      upvalues:
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = LIGHTS_OUT_CONFIG_upv_1.livesPerRun
    a1.overruns = 0
    a1.resetPending = false
    a1:loadLevel()
    a1.context.reportScore(0)
end
u19.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 233
    ]]
    a1.cursor:update(a2)
end
u19.render = function(a1, a2)
    --[[
      name: render
      line: 237
    ]]
    a1:advanceAnimations(a2)
end
u19.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 240
    ]]
    a1.cursor:update(a2)
    a1:advanceAnimations(a2)
end
u19.revive = function(a1)
    --[[
      name: revive
      line: 244
      upvalues:
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = LIGHTS_OUT_CONFIG_upv_1.livesPerRun
    a1.resetPending = false
    a1:resetAttempt()
    a1:updateHearts()
    a1:setRunning(true)
end
u19.captureRound = function(a1)
    --[[
      name: captureRound
      line: 252
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u19.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 257
      upvalues:
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v15 = string.split(a2.state, "|")
    if #v15 == 3 then
        local v16 = nil
        if v15[1] == "1" then
            v16 = tonumber(v15[2])
            local num_1 = tonumber(v15[3])
            if v16 ~= nil and num_1 ~= nil and v16 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v16)
                a1.lives = math.clamp(math.floor(num_1), 1, LIGHTS_OUT_CONFIG_upv_1.livesPerRun)
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
      line: 274
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        popcount_upv_1 (copy, index: 2)
        pressBudget_upv_1 (copy, index: 3)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 4)
        u14 (copy, index: 5)
    ]]
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    a1.boardSize = a1.generated.spec.size
    a1.state = a1.generated.spec.litMask
    a1.litCount = popcount_upv_1(a1.state)
    a1.pressesUsed = 0
    a1.budget = pressBudget_upv_1(a1.level, a1.generated.par)
    a1.winAge = -1
    a1.winFlashDone = false
    a1.winPopupDone = false
    a1.resetPending = false
    a1.gestures:cancel()
    a1.picker:setSpec({columns = a1.boardSize, rows = a1.boardSize, cellPitch = LIGHTS_OUT_CONFIG_upv_1.cellPitch})
    a1.stage.setFrameWidthFloor((a1.boardSize * LIGHTS_OUT_CONFIG_upv_1.cellPitch) + LIGHTS_OUT_CONFIG_upv_1.frameWidthPad)
    a1.cursor:setCell(a1.cursor:getCell())
    a1:dressBoard()
    a1:updateHearts()
    a1:updateBudgetLabel()
    a1.popups:show(a1.stage.origin + Vector3.new(0, -2, 6), ("BUDGET %*"):format(a1.budget), u14, 0.75)
end
u19.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 303
      upvalues:
        u2 (copy, index: 1)
        u1 (copy, index: 2)
        hasBit_upv_1 (copy, index: 3)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 4)
    ]]
    local boardSize_1 = a1.boardSize
    local origin_2 = 0
    local v17 = false
    if v17 then
        origin_2 = origin_2 + 1
    else
        v17 = true
    end
    if origin_2 < u2 then
        a1.pendingFlip[origin_2 + 1] = -1
        a1.popAge[origin_2 + 1] = -1
        if boardSize_1 * boardSize_1 > origin_2 then
            a1.cellPositions[origin_2 + 1] = a1.picker:cellWorld(origin_2 % boardSize_1, math.floor(origin_2 / boardSize_1))
            a1.shownLit[origin_2 + 1] = hasBit_upv_1(a1.state, origin_2)
            a1:applyCellVisual(origin_2)
            a1:writeCellScale(origin_2, 1)
        else
            a1.shownLit[origin_2 + 1] = false
            a1.cellPlates[origin_2 + 1].CFrame = u1
            a1.cellGlows[origin_2 + 1].CFrame = u1
        end
        if v17 then
            origin_2 = origin_2 + 1
        else
            v17 = true
        end
        --[[ goto label_3 ]]--
    end
    origin_2 = a1.stage.origin
    v17 = boardSize_1 * LIGHTS_OUT_CONFIG_upv_1.cellPitch
    local v18 = v17 / 2
    a1.panelPlate.Size = Vector3.new(v17 + 1.4, v17 + 1.4, 0.7)
    a1.panelPlate.CFrame = CFrame.new(origin_2 + Vector3.new(0, 0, -0.8500000238418579))
    local v19 = v17 + 2.8
    a1.frameBars[1].Size = Vector3.new(v19, 0.9, 1.3)
    a1.frameBars[1].CFrame = CFrame.new(origin_2 + Vector3.new(0, v18 + 0.95, -0.3))
    a1.frameBars[2].Size = Vector3.new(v19, 0.9, 1.3)
    a1.frameBars[2].CFrame = CFrame.new(origin_2 + Vector3.new(0, -v18 - 0.95, -0.3))
    a1.frameBars[3].Size = Vector3.new(0.9, v17 + 1, 1.3)
    a1.frameBars[3].CFrame = CFrame.new(origin_2 + Vector3.new(v18 + 0.95, 0, -0.3))
    a1.frameBars[4].Size = Vector3.new(0.9, v17 + 1, 1.3)
    a1.frameBars[4].CFrame = CFrame.new(origin_2 + Vector3.new(-v18 - 0.95, 0, -0.3))
    a1.budgetPart.CFrame = CFrame.new(origin_2 + Vector3.new(0, v18 + 3.2, 0))
    a1:layoutHearts(v18)
end
u19.layoutHearts = function(a1, a2)
    --[[
      name: layoutHearts
      line: 357
    ]]
    local origin_3 = a1.stage.origin
    for n_2 = 0, #a1.heartParts - 1 do
        a1.heartParts[n_2 + 1].CFrame = CFrame.new(origin_3 + Vector3.new((n_2 - (#a1.heartParts - 1) / 2) * 2.1, -a2 - 2.3, 0)) * CFrame.Angles(0, 0, 0.7853981633974483)
    end
end
u19.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 367
      upvalues:
        u11 (copy, index: 1)
        u12 (copy, index: 2)
    ]]
    local v20 = nil
    for n_3 = 0, #a1.heartParts - 1 do
        local v21 = n_3 < a1.lives
        local v22 = a1.heartParts[n_3 + 1]
        if v21 then
            v20 = u11
        else
            v20 = u12
        end
        v22.Color = v20
        a1.heartParts[n_3 + 1].Transparency = (v21 and 0) or 0.45
    end
end
u19.updateBudgetLabel = function(a1)
    --[[
      name: updateBudgetLabel
      line: 374
      upvalues:
        u18 (copy, index: 1)
        u17 (copy, index: 2)
        u16 (copy, index: 3)
    ]]
    local v23 = a1.budget - a1.pressesUsed
    a1.budgetLabel.Text = ("LEVEL %*  \194\183  %*/%*"):format(a1.level, a1.pressesUsed, a1.budget)
    local budgetLabel_1 = a1.budgetLabel
    local v24
    if v23 >= 0 then
        if v23 > 2 then
            v24 = u16
        else
            v24 = u17
        end
    else
        v24 = u18
    end
    budgetLabel_1.TextColor3 = v24
end
u19.applyCellVisual = function(a1, a2)
    --[[
      name: applyCellVisual
      line: 379
      upvalues:
        u8 (copy, index: 1)
        u9 (copy, index: 2)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local v25 = a1.shownLit[a2 + 1]
    local v26 = a1.cellPositions[a2 + 1]
    local v27 = a1.cellPlates[a2 + 1]
    local v28
    if v25 then
        v28 = u8
    else
        v28 = u9
    end
    v27.Color = v28
    local v29
    if v25 then
        v29 = LIGHTS_OUT_CONFIG_upv_1.litLift
    else
        v29 = -LIGHTS_OUT_CONFIG_upv_1.unlitRecess
    end
    v27.CFrame = CFrame.new(v26 + Vector3.new(0, 0, v29))
    local v30 = a1.cellGlows[a2 + 1]
    if v25 then
        v30.Transparency = 0.1
        v30.CFrame = CFrame.new(v26 + Vector3.new(0, 0, LIGHTS_OUT_CONFIG_upv_1.litLift - 0.62))
    else
        v30.CFrame = u1
    end
end
u19.writeCellScale = function(a1, a2, a3)
    --[[
      name: writeCellScale
      line: 395
      upvalues:
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v31 = LIGHTS_OUT_CONFIG_upv_1.cellSize * a3
    a1.cellPlates[a2 + 1].Size = Vector3.new(v31, v31, LIGHTS_OUT_CONFIG_upv_1.plateDepth)
    if a1.shownLit[a2 + 1] then
        local v32 = (LIGHTS_OUT_CONFIG_upv_1.cellSize + 0.3) * a3
        a1.cellGlows[a2 + 1].Size = Vector3.new(v32, v32, 0.3)
    end
end
u19.onCellPressed = function(a1, a2)
    --[[
      name: onCellPressed
      line: 403
      upvalues:
        applyPress_upv_1 (copy, index: 1)
        popcount_upv_1 (copy, index: 2)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 3)
        u14 (copy, index: 4)
        isSolved_upv_1 (copy, index: 5)
    ]]
    if a1:isRunning() and a1.winAge < 0 and not (a1.resetPending) then
        local boardSize_2 = a1.boardSize
        local v33 = a2.row * boardSize_2 + a2.column
        a1.pressesUsed = a1.pressesUsed + 1
        a1.state = applyPress_upv_1(boardSize_2, a1.state, v33)
        a1.litCount = popcount_upv_1(a1.state)
        a1:queueFlip(v33, 0)
        if a2.column > 0 then
            a1:queueFlip(v33 - 1, LIGHTS_OUT_CONFIG_upv_1.neighborStaggerSeconds)
        end
        if a2.column < boardSize_2 - 1 then
            a1:queueFlip(v33 + 1, LIGHTS_OUT_CONFIG_upv_1.neighborStaggerSeconds)
        end
        if a2.row > 0 then
            a1:queueFlip(v33 - boardSize_2, LIGHTS_OUT_CONFIG_upv_1.neighborStaggerSeconds)
        end
        if a2.row < boardSize_2 - 1 then
            a1:queueFlip(v33 + boardSize_2, LIGHTS_OUT_CONFIG_upv_1.neighborStaggerSeconds)
        end
        a1:updateBudgetLabel()
        if not (a1.hintShown) and a1.level == 1 then
            a1.hintShown = true
            a1.popups:show(a1.stage.origin + Vector3.new(0, ((-a1.boardSize * LIGHTS_OUT_CONFIG_upv_1.cellPitch) * 0.5) - 4.6, 5), "TAP AGAIN TO UNDO", u14, 0.7, 1.4)
        end
        if isSolved_upv_1(a1.state) then
            a1:beginWin()
            return nil
        end
        if a1.budget < a1.pressesUsed then
            a1:onBudgetExceeded()
        end
        return
    end
    return nil
end
u19.queueFlip = function(a1, a2, a3)
    --[[
      name: queueFlip
      line: 443
    ]]
    if a1.pendingFlip[a2 + 1] < 0 then
        if a3 > 0 then
            a1.pendingFlip[a2 + 1] = a3
        else
            a1:flipCell(a2)
            return nil
        end
    else
        a1.pendingFlip[a2 + 1] = -1
        return nil
    end
end
u19.flipCell = function(a1, a2)
    --[[
      name: flipCell
      line: 454
      upvalues:
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.shownLit[a2 + 1] = not a1.shownLit[a2 + 1]
    a1:applyCellVisual(a2)
    a1:writeCellScale(a2, 1)
    a1.popAge[a2 + 1] = 0
    if LIGHTS_OUT_CONFIG_upv_1.winBeatSeconds > a1.winAge then
        a1.context.audio.play("pop", {})
    else
        a1.context.audio.play("pop", {pitch = math.max(1.2 - (((a2 % a1.boardSize) + math.floor(a2 / a1.boardSize)) * 0.05), 0.6)})
        return nil
    end
end
u19.beginWin = function(a1)
    --[[
      name: beginWin
      line: 483
    ]]
    a1.context.reportScore(a1.level)
    a1.level = a1.level + 1
    a1.winAge = 0
    a1.winFlashDone = false
    a1.winPopupDone = false
end
u19.onBudgetExceeded = function(a1)
    --[[
      name: onBudgetExceeded
      line: 491
      upvalues:
        u15 (copy, index: 1)
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.overruns = a1.overruns + 1
    a1.lives = a1.lives - 1
    a1:updateHearts()
    a1:updateBudgetLabel()
    a1.context.audio.play("buzz", {})
    a1.stage.shake(0.4)
    local origin_4 = a1.stage.origin
    if a1.lives > 0 then
        a1.popups:show(origin_4 + Vector3.new(0, 2, 6), "OVER BUDGET!", u15, 1)
        a1.resetPending = true
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            LIGHTS_OUT_CONFIG_upv_1.overBudgetResetSeconds,
            function()
                --[[
                  line: 521
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
        a1.popups:show(origin_4 + Vector3.new(0, 2, 6), "OUT OF LIVES!", u15, 1.2)
        a1:setRunning(false)
        local roundToken_upv_2 = a1.roundToken
        local u20 = a1.level - 1
        task.delay(
            LIGHTS_OUT_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 508
                  upvalues:
                    roundToken_upv_2 (copy, index: 1)
                    a1 (copy, index: 2)
                    u20 (copy, index: 3)
                ]]
                if roundToken_upv_2 == a1.roundToken then
                    a1.context.endRun(u20)
                else
                    return nil
                end
            end
        )
        return nil
    end
end
u19.resetAttempt = function(a1)
    --[[
      name: resetAttempt
      line: 528
      upvalues:
        popcount_upv_1 (copy, index: 1)
    ]]
    a1.state = a1.generated.spec.litMask
    a1.litCount = popcount_upv_1(a1.state)
    a1.pressesUsed = 0
    a1.resetPending = false
    a1.winAge = -1
    a1.gestures:cancel()
    a1:dressBoard()
    a1:updateBudgetLabel()
end
u19.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 538
      upvalues:
        LIGHTS_OUT_CONFIG_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    a1.animationClock = a1.animationClock + a2
    local v34 = a1.boardSize * a1.boardSize
    local v35 = 0
    local v36 = false
    if v36 then
        v35 = v35 + 1
    else
        v36 = true
    end
    local v37 = nil
    if v35 < v34 then
        v37 = a1.pendingFlip[v35 + 1]
        local v38 = nil
        if v37 >= 0 then
            v38 = v37 - a2
            if v38 <= 0 then
                a1.pendingFlip[v35 + 1] = -1
                a1:flipCell(v35)
            else
                a1.pendingFlip[v35 + 1] = v38
            end
        end
        if v36 then
            v35 = v35 + 1
        else
            v36 = true
        end
        --[[ goto label_3 ]]--
    end
    v36, v35 = false, 0
    if v36 then
        v35 = v35 + 1
    else
        v36 = true
    end
    if v35 < v34 then
        v37 = a1.popAge[v35 + 1]
        local v39 = nil
        if v37 >= 0 then
            v39 = v37 + a2
            if LIGHTS_OUT_CONFIG_upv_1.popSeconds > v39 then
                a1.popAge[v35 + 1] = v39
                a1:writeCellScale(v35, 1 + (LIGHTS_OUT_CONFIG_upv_1.popScale * math.sin(math.pi * (v39 / LIGHTS_OUT_CONFIG_upv_1.popSeconds))))
            else
                a1.popAge[v35 + 1] = -1
                a1:writeCellScale(v35, 1)
            end
        end
        if v36 then
            v35 = v35 + 1
        else
            v36 = true
        end
        --[[ goto label_7 ]]--
    end
    v35 = false
    if a1.winAge < 0 then
        v35 = false
        if a1.litCount > 0 then
            v35 = false
            if a1.litCount <= LIGHTS_OUT_CONFIG_upv_1.pulseLitThreshold then
                v35 = a1:isRunning()
            end
        end
    end
    if v35 then
        v37, v36 = false, 0
        if v37 then
            v36 = v36 + 1
        else
            v37 = true
        end
        while v36 < v34 do
            if a1.shownLit[v36 + 1] and a1.popAge[v36 + 1] < 0 then
                local v40 = math.sin((a1.animationClock * 5) + v36) * 0.5 + 0.5
                a1.cellGlows[v36 + 1].Transparency = (v40 * 0.3) + 0.05
                a1:writeCellScale(v36, (v40 * 0.05) + 1)
            end
            if v37 then
                v36 = v36 + 1
            else
                v37 = true
            end
        end
    elseif a1.pulseWasActive then
        v37, v36 = false, 0
        if v37 then
            v36 = v36 + 1
        else
            v37 = true
        end
        while v36 < v34 do
            if a1.shownLit[v36 + 1] then
                a1.cellGlows[v36 + 1].Transparency = 0.1
                if a1.popAge[v36 + 1] < 0 then
                    a1:writeCellScale(v36, 1)
                end
            end
            if v37 then
                v36 = v36 + 1
            else
                v37 = true
            end
        end
    end
    a1.pulseWasActive = v35
    if a1.winAge >= 0 then
        a1.winAge = a1.winAge + a2
        if not (a1.winFlashDone) and LIGHTS_OUT_CONFIG_upv_1.winBeatSeconds <= a1.winAge then
            a1.winFlashDone = true
            a1.context.audio.play("coinSettle", {})
            v36 = 0
            v37 = false
            if v37 then
                v36 = v36 + 1
            else
                v37 = true
            end
            while v36 < v34 do
                a1.pendingFlip[v36 + 1] = -1
                if not (a1.shownLit[v36 + 1]) then
                    a1.shownLit[v36 + 1] = true
                    a1:applyCellVisual(v36)
                    a1:writeCellScale(v36, 1)
                end
                a1.pendingFlip[v36 + 1] = LIGHTS_OUT_CONFIG_upv_1.winFlashSeconds + (((v36 % a1.boardSize) + math.floor(v36 / a1.boardSize)) * LIGHTS_OUT_CONFIG_upv_1.winCascadeRingSeconds)
                if v37 then
                    v36 = v36 + 1
                else
                    v37 = true
                end
            end
        end
        if not (a1.winPopupDone) and LIGHTS_OUT_CONFIG_upv_1.winBeatSeconds + LIGHTS_OUT_CONFIG_upv_1.winFlashSeconds <= a1.winAge then
            a1.winPopupDone = true
            a1.popups:show(a1.stage.origin + Vector3.new(0, 3.4000000953674316, 6), ("LEVEL %*"):format(a1.level - 1), u13, 1.3)
            a1.context.audio.play("perfect", {})
            a1.context.audio.play("whoosh", {})
        end
        if LIGHTS_OUT_CONFIG_upv_1.winTotalSeconds <= a1.winAge then
            a1:loadLevel()
        end
        return
    end
    return nil
end
local tbl_5 = {}
tbl_5.LightsOutGame = u19
return tbl_5