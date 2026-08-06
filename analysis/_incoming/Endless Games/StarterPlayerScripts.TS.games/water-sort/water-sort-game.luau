-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardGestures_upv_1 = v1.BoardGestures
local BoardPicker_upv_1 = v1.BoardPicker
local GridCursor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "grid-cursor").GridCursor
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local TouchControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "touch-button").TouchControls
local UndoStack_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "undo-stack").UndoStack
local pausedAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").pausedAtom
local WATER_SORT_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "water-sort-config").WATER_SORT_CONFIG
local WaterSortScene_upv_1 = RuntimeLib_1.import(script, script.Parent, "water-sort-scene").WaterSortScene
local v3 = RuntimeLib_1.import(script, script.Parent, "water-sort-levels")
local generateLevel_upv_1 = v3.generateLevel
local moveBudgetFor_upv_1 = v3.moveBudgetFor
local v4 = RuntimeLib_1.import(script, script.Parent, "water-sort-sim")
local applyPour_upv_1 = v4.applyPour
local canPour_upv_1 = v4.canPour
local isSolved_upv_1 = v4.isSolved
local isStuck_upv_1 = v4.isStuck
local isTubeComplete_upv_1 = v4.isTubeComplete
local topRun_upv_1 = v4.topRun
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(112, 80, 50)
local u3 = Color3.fromRGB(168, 132, 72)
local u4 = Color3.fromRGB(206, 224, 234)
local u5 = Color3.fromRGB(96, 76, 58)
local u6 = Color3.fromRGB(174, 126, 78)
local u7 = Color3.fromRGB(230, 216, 188)
local u8 = Color3.fromRGB(255, 216, 102)
local u9 = Color3.fromRGB(245, 245, 255)
local u10 = Color3.fromRGB(255, 92, 80)
local u11 = Color3.fromRGB(32, 26, 24)
local u12 = Color3.fromRGB(246, 242, 232)
local tbl_upv_1 = {Color3.fromRGB(206, 52, 46), Color3.fromRGB(236, 138, 36), Color3.fromRGB(242, 206, 66), Color3.fromRGB(126, 200, 56), Color3.fromRGB(32, 118, 60), Color3.fromRGB(62, 190, 186), Color3.fromRGB(58, 108, 224), Color3.fromRGB(30, 42, 96), Color3.fromRGB(142, 68, 202), Color3.fromRGB(238, 128, 176), Color3.fromRGB(118, 74, 40), Color3.fromRGB(240, 234, 218)}
local tbl_upv_2 = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}}
local u13 = WATER_SORT_CONFIG_upv_1.unitHeight * 4
local u14 = u13 / 2
local u15 = Vector3.new(WATER_SORT_CONFIG_upv_1.unitWidth, WATER_SORT_CONFIG_upv_1.unitHeight, WATER_SORT_CONFIG_upv_1.unitDepth)
local u16 = CFrame.new(0, -u14 - 0.55, 0)
local u17 = CFrame.new(-((WATER_SORT_CONFIG_upv_1.unitWidth / 2) + 0.32), 0.2, 0)
local u18 = CFrame.new((WATER_SORT_CONFIG_upv_1.unitWidth / 2) + 0.32, 0.2, 0)
local u19 = CFrame.new(0, 0, -((WATER_SORT_CONFIG_upv_1.unitDepth / 2) + 0.28))
local u20 = CFrame.new(0, u14 + 0.7, 0)
local u21 = u14 + 1.35
local u22 = CFrame.new(0, u21, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
local u23 = CFrame.Angles(0, 0, 1.5707963267948966)
local tbl_upv_3 = {CFrame.new(0, -u14 + (0.5 * WATER_SORT_CONFIG_upv_1.unitHeight), 0), CFrame.new(0, -u14 + (1.5 * WATER_SORT_CONFIG_upv_1.unitHeight), 0), CFrame.new(0, -u14 + (2.5 * WATER_SORT_CONFIG_upv_1.unitHeight), 0), CFrame.new(0, -u14 + (3.5 * WATER_SORT_CONFIG_upv_1.unitHeight), 0)}
local u24 = WATER_SORT_CONFIG_upv_1.unitDepth / 2 + 0.12
local u25 = u14 + 0.85
local function quadInOut_1(a1)
    --[[
      name: quadInOut
      line: 122
    ]]
    if a1 >= 0.5 then
        return 1 - ((((-2 * a1) + 2) ^ 2) / 2)
    end
    return (2 * a1) * a1
end
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 142
    ]]
    return "WaterSortGame"
end
tbl_5.__index = BaseWorldGame_upv_1
local u26 = setmetatable(tbl_4, tbl_5)
u26.__index = u26
u26.new = function(...)
    --[[
      name: new
      line: 148
      upvalues:
        u26 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u26)
    return v5:constructor(...) or v5
end
u26.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 152
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        WATER_SORT_CONFIG_upv_1 (copy, index: 2)
        UndoStack_upv_1 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = WATER_SORT_CONFIG_upv_1.livesPerRun
    a1.movesUsed = 0
    a1.budget = 0
    a1.undosLeft = WATER_SORT_CONFIG_upv_1.undosPerLevel
    a1.board = {}
    a1.undoStack = UndoStack_upv_1.new(WATER_SORT_CONFIG_upv_1.undosPerLevel)
    a1.selection = nil
    a1.phase = "play"
    a1.pendingOutcome = nil
    a1.roundToken = 0
    a1.tubeCount = 0
    a1.topCount = 0
    a1.bottomCount = 0
    a1.tubeVisuals = {}
    a1.streams = {}
    a1.streamBusy = {}
    a1.streamDroplets = {}
    a1.pourAnimations = {}
    a1.corkAnimations = {}
    a1.lastMovesText = ""
    a1.lastUndoText = ""
end
u26.buildScene = function(a1)
    --[[
      name: buildScene
      line: 177
      upvalues:
        WaterSortScene_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u7 (copy, index: 3)
        WATER_SORT_CONFIG_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        u2 (copy, index: 6)
        u4 (copy, index: 7)
        u13 (copy, index: 8)
        u5 (copy, index: 9)
        u3 (copy, index: 10)
        makeStagePart_upv_1 (copy, index: 11)
        u15 (copy, index: 12)
        tbl_upv_3 (copy, index: 13)
        u6 (copy, index: 14)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 15)
        tbl_upv_1 (copy, index: 16)
        u8 (copy, index: 17)
        PopupTextPool_upv_1 (copy, index: 18)
        BoardPicker_upv_1 (copy, index: 19)
        BoardGestures_upv_1 (copy, index: 20)
        GridCursor_upv_1 (copy, index: 21)
        TouchControls_upv_1 (copy, index: 22)
        UserInputService_upv_1 (copy, index: 23)
    ]]
    local container_1 = a1.stage.container
    a1.scene = WaterSortScene_upv_1.new(container_1, a1.stage)
    a1.selectDisc = makeSmoothPart_upv_1(container_1)
    a1.selectDisc.Shape = Enum.PartType.Cylinder
    a1.selectDisc.Color = u7
    a1.selectDisc.Size = Vector3.new(0.25, WATER_SORT_CONFIG_upv_1.unitWidth + 2.2, WATER_SORT_CONFIG_upv_1.unitWidth + 2.2)
    a1.selectDisc.CFrame = u1
    for n_1 = 0, WATER_SORT_CONFIG_upv_1.maxTubes - 1 do
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Color = u2
        v6.Size = Vector3.new(WATER_SORT_CONFIG_upv_1.unitWidth + 1.1, 1.1, WATER_SORT_CONFIG_upv_1.unitDepth + 0.7)
        local v7 = makeSmoothPart_upv_1(container_1)
        v7.Material = Enum.Material.SmoothPlastic
        v7.Color = u4
        v7.Transparency = 0.72
        v7.Size = Vector3.new(0.42, u13 + 1.4, WATER_SORT_CONFIG_upv_1.unitDepth + 0.15)
        local v8 = makeSmoothPart_upv_1(container_1)
        v8.Material = Enum.Material.SmoothPlastic
        v8.Color = u4
        v8.Transparency = 0.72
        v8.Size = v7.Size
        local v9 = makeSmoothPart_upv_1(container_1)
        v9.Color = u5
        v9.Size = Vector3.new(WATER_SORT_CONFIG_upv_1.unitWidth + 0.6, u13 + 1, 0.35)
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Color = u3
        v10.Size = Vector3.new(WATER_SORT_CONFIG_upv_1.unitWidth + 1.25, 0.5, WATER_SORT_CONFIG_upv_1.unitDepth + 0.85)
        local tbl_6 = {}
        local tbl_7 = {}
        local tbl_8 = {}
        for n_2 = 0, 3 do
            local v11 = makeStagePart_upv_1(container_1)
            v11.Size = u15
            v11.Transparency = 1
            v11.CFrame = u1
            table.insert(tbl_6, v11)
            local v12 = makeSmoothPart_upv_1(container_1)
            v12.Transparency = 1
            v12.CFrame = u1
            table.insert(tbl_7, v12)
            table.insert(tbl_8, tbl_upv_3[n_2 + 1])
        end
        local v13 = makeSmoothPart_upv_1(container_1)
        v13.Shape = Enum.PartType.Cylinder
        v13.Color = u6
        v13.Size = Vector3.new(1.100000023841858, 2.5999999046325684, 2.5999999046325684)
        v13.CFrame = u1
        table.insert(a1.tubeVisuals, {base = v6, leftWall = v7, rightWall = v8, backPanel = v9, rim = v10, units = tbl_6, marks = tbl_7, markLocals = tbl_8, cork = v13})
        a1:parkTube(n_1)
    end
    for _ = 0, WATER_SORT_CONFIG_upv_1.maxConcurrentPours - 1 do
        local v14 = makeSmoothPart_upv_1(container_1)
        v14.Size = Vector3.new(WATER_SORT_CONFIG_upv_1.streamThickness, 1, WATER_SORT_CONFIG_upv_1.streamThickness)
        v14.CFrame = u1
        table.insert(a1.streams, v14)
        table.insert(a1.streamBusy, false)
        local v15 = Instance.new("ParticleEmitter")
        v15.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
        v15.Rate = 0
        v15.Enabled = false
        v15.Lifetime = NumberRange.new(0.2, 0.42)
        v15.Speed = NumberRange.new(3, 7)
        v15.SpreadAngle = Vector2.new(35, 35)
        v15.Acceleration = Vector3.new(0, -60, 0)
        v15.Size = NumberSequence.new(0.32, 0.08)
        v15.Transparency = NumberSequence.new(0.15, 1)
        v15.Rate = 34
        v15.LightEmission = 0
        v15.Parent = v14
        table.insert(a1.streamDroplets, v15)
    end
    a1.confettiAnchor = makeSmoothPart_upv_1(container_1)
    a1.confettiAnchor.Transparency = 1
    a1.confettiAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.confettiAnchor.CFrame = u1
    a1.colorBurst = a1:makeBurstEmitter(a1.confettiAnchor, tbl_upv_1[1])
    a1.goldBurst = a1:makeBurstEmitter(a1.confettiAnchor, u8)
    local v16 = Instance.new("BillboardGui")
    v16.Size = UDim2.fromScale(12, 3.6)
    v16.Parent = a1.scene.signAnchor
    a1.movesLabel = a1:makeCounterLabel(v16, UDim2.fromScale(0, 0), UDim2.fromScale(1, 0.58))
    a1.undoLabel = a1:makeCounterLabel(v16, UDim2.fromScale(0, 0.58), UDim2.fromScale(1, 0.42))
    a1.undoLabel.TextColor3 = u8
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    a1.picker = BoardPicker_upv_1.new(a1.stage, {cellPitch = WATER_SORT_CONFIG_upv_1.cellPitch})
    a1.stage.setFrameWidthFloor((7 * WATER_SORT_CONFIG_upv_1.cellPitch) + WATER_SORT_CONFIG_upv_1.frameWidthMarginStuds)
    local tbl_9 = {}
    local tbl_10 = {}
    tbl_10.onCellTap = function(a2)
        --[[
          name: onCellTap
          line: 306
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onBoardTap(a2)
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, tbl_9, tbl_10)
    local function onMoved_1(a3)
        --[[
          name: onMoved
          line: 316
          upvalues:
            WATER_SORT_CONFIG_upv_1 (copy, index: 1)
            a1 (copy, index: 2)
        ]]
        if a3.row > 0 and a3.row < WATER_SORT_CONFIG_upv_1.rowSpanRows then
            local v17 = a3.row <= WATER_SORT_CONFIG_upv_1.rowSpanRows / 2
            local cursor_1 = a1.cursor
            local tbl_11 = {}
            tbl_11.column = a3.column
            local v18
            if v17 then
                v18 = WATER_SORT_CONFIG_upv_1.rowSpanRows
            else
                v18 = 0
            end
            tbl_11.row = v18
            cursor_1:setCell(tbl_11)
        end
        a1.context.audio.play("uiHover", {})
    end
    local function onActivate_1(a4)
        --[[
          name: onActivate
          line: 313
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onBoardTap(a4)
    end
    a1.cursor = GridCursor_upv_1.new(a1.context.input, a1.context.janitor, {picker = a1.picker, container = container_1, onActivate = onActivate_1, onMoved = onMoved_1})
    local v19 = TouchControls_upv_1.new({})
    a1.context.janitor:Add(v19, "destroy")
    local tbl_12 = {}
    tbl_12.background = Color3.fromRGB(38, 38, 48)
    tbl_12.stroke = Color3.fromRGB(96, 96, 110)
    tbl_12.text = Color3.fromRGB(150, 150, 162)
    local function onActivated_1()
        --[[
          name: onActivated
          line: 353
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.context.requestStart()
        a1:performUndo()
    end
    a1.undoButton = v19:addButton({anchorPoint = Vector2.new(1, 1), position = UDim2.new(1, -16, 1, -16), look = {background = Color3.fromRGB(58, 44, 26), stroke = u8, text = Color3.fromRGB(255, 232, 164)}, disabledLook = tbl_12, onActivated = onActivated_1})
    a1.context.janitor:Add(
        UserInputService_upv_1.InputBegan:Connect(
            function(a5, a6)
                --[[
                  line: 362
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a6 then
                    return nil
                elseif a5.KeyCode == Enum.KeyCode.U or a5.KeyCode == Enum.KeyCode.ButtonY then
                    a1:performUndo()
                end
            end
        )
    )
end
u26.resetRound = function(a1)
    --[[
      name: resetRound
      line: 371
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = WATER_SORT_CONFIG_upv_1.livesPerRun
    a1:loadLevel()
    a1.context.reportScore(0)
end
u26.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 378
    ]]
    a1.cursor:update(a2)
end
u26.render = function(a1, a2)
    --[[
      name: render
      line: 382
    ]]
    a1:advanceAnimations(a2)
end
u26.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 385
    ]]
    a1:advanceAnimations(a2)
    a1.cursor:update(a2)
end
u26.revive = function(a1)
    --[[
      name: revive
      line: 389
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = WATER_SORT_CONFIG_upv_1.livesPerRun
    a1:loadLevel()
    a1:setRunning(true)
end
u26.captureRound = function(a1)
    --[[
      name: captureRound
      line: 395
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u26.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 401
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v20 = string.split(a2.state, "|")
    if #v20 == 3 then
        local v21 = nil
        if v20[1] == "1" then
            v21 = tonumber(v20[2])
            local num_1 = tonumber(v20[3])
            if v21 ~= nil and num_1 ~= nil and v21 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v21)
                a1.lives = math.clamp(math.floor(num_1), 1, WATER_SORT_CONFIG_upv_1.livesPerRun)
                a1:loadLevel()
                a1.context.reportScore(a2.score)
                return true
            end
            return false
        end
    end
    return false
end
u26.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 419
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        moveBudgetFor_upv_1 (copy, index: 2)
        WATER_SORT_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        u14 (copy, index: 5)
        u25 (copy, index: 6)
    ]]
    a1.gestures:cancel()
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    a1.board = a1.generated.spec.tubes
    a1.budget = moveBudgetFor_upv_1(a1.generated.par, a1.level)
    a1.movesUsed = 0
    a1.undosLeft = WATER_SORT_CONFIG_upv_1.undosPerLevel
    a1.undoStack:clear()
    a1.selection = nil
    a1.pendingOutcome = nil
    a1.phase = "play"
    while #a1.pourAnimations > 0 do
        local pourAnimations_1 = a1.pourAnimations
        pourAnimations_1[#pourAnimations_1] = nil
    end
    while #a1.corkAnimations > 0 do
        local corkAnimations_1 = a1.corkAnimations
        corkAnimations_1[#corkAnimations_1] = nil
    end
    for n_3 = 0, #a1.streams - 1 do
        a1.streams[n_3 + 1].CFrame = u1
        a1.streamBusy[n_3 + 1] = false
    end
    a1.tubeCount = #a1.board
    local v22 = WATER_SORT_CONFIG_upv_1.singleRowMaxTubes < a1.tubeCount
    local topCount_1
    if v22 then
        topCount_1 = math.ceil(a1.tubeCount / 2)
    else
        topCount_1 = a1.tubeCount
    end
    a1.topCount = topCount_1
    a1.bottomCount = a1.tubeCount - a1.topCount
    topCount_1 = a1.topCount
    a1.picker:setSpec({columns = topCount_1, rows = (v22 and (WATER_SORT_CONFIG_upv_1.rowSpanRows + 1)) or 1, cellPitch = WATER_SORT_CONFIG_upv_1.cellPitch})
    a1.stage.setFrameWidthFloor((topCount_1 * WATER_SORT_CONFIG_upv_1.cellPitch) + WATER_SORT_CONFIG_upv_1.frameWidthMarginStuds)
    a1.stage.setFrameCenter(Vector2.new(0, (v22 and 3) or 1))
    local origin_1 = 0
    local v23 = false
    while true do
        if v23 then
            origin_1 = origin_1 + 1
        else
            v23 = true
        end
        if origin_1 >= a1.tubeCount then
            break
        end
        local v24 = a1:cellForTube(origin_1)
        local v25 = a1.tubeVisuals[origin_1 + 1]
        v25.homePosition = a1.picker:cellWorld(v24.column, v24.row)
        v25.lift = 0
        v25.liftTarget = 0
        v25.shakeAge = -1
        v25.settleAge = -1
        a1:syncTube(origin_1)
    end
    v23, origin_1 = false, a1.tubeCount
    while true do
        if v23 then
            origin_1 = origin_1 + 1
        else
            v23 = true
        end
        if origin_1 >= WATER_SORT_CONFIG_upv_1.maxTubes then
            break
        end
        a1:parkTube(origin_1)
    end
    a1.selectDisc.CFrame = u1
    origin_1 = a1.stage.origin
    v23 = a1.picker:cellWorld(0, 0).Y - origin_1.Y
    local v26 = (v22 and (a1.picker:cellWorld(0, WATER_SORT_CONFIG_upv_1.rowSpanRows).Y - origin_1.Y)) or nil
    local tbl_13 = {}
    table.insert(tbl_13, v23)
    if v26 ~= nil then
        table.insert(tbl_13, v26)
    end
    a1.scene:layout(tbl_13, u25, topCount_1 * WATER_SORT_CONFIG_upv_1.cellPitch, v23 + u14 + ((v22 and 5.6) or 7.4))
    a1.scene:setLives(a1.lives)
    a1.cursor:setCell({})
    a1.lastMovesText = ""
    a1.lastUndoText = ""
    a1:updateHud()
end
u26.cellForTube = function(a1, a2)
    --[[
      name: cellForTube
      line: 522
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 >= a1.topCount then
        local tbl_14 = {}
        tbl_14.column = a2 - a1.topCount
        tbl_14.row = WATER_SORT_CONFIG_upv_1.rowSpanRows
        return tbl_14
    else
        local tbl_15 = {}
        tbl_15.column = a2
        return tbl_15
    end
end
u26.tubeForCell = function(a1, a2)
    --[[
      name: tubeForCell
      line: 534
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2.row ~= 0 then
        if a2.row == WATER_SORT_CONFIG_upv_1.rowSpanRows then
            if a2.column >= a1.bottomCount then
                return nil
            end
            return a1.topCount + a2.column
        end
        return nil
    elseif a2.column >= a1.topCount then
        return nil
    else
        return a2.column
    end
end
u26.onBoardTap = function(a1, a2)
    --[[
      name: onBoardTap
      line: 545
    ]]
    a1:onTubeTap(a1:tubeForCell(a2))
end
u26.onTubeTap = function(a1, a2)
    --[[
      name: onTubeTap
      line: 548
      upvalues:
        isTubeComplete_upv_1 (copy, index: 1)
        canPour_upv_1 (copy, index: 2)
    ]]
    if a1:isRunning() then
        if a1.phase == "awaitUndo" then
            a1.context.audio.play("thud", {})
        elseif a1.phase ~= "transition" and a1.pendingOutcome == nil then
            if a2 ~= nil then
                if a1:isTubeAnimating(a2) then
                    a1.context.audio.play("thud", {})
                else
                    local v27 = a1.board[a2 + 1]
                    if a1.selection ~= nil then
                        if a1.selection ~= a2 then
                            if canPour_upv_1(a1.board, a1.selection, a2) then
                                a1:startPour(a1.selection, a2)
                                return nil
                            end
                            a1:shakeTube(a2)
                            a1.context.audio.play("thud", {})
                            if #v27 > 0 and not (isTubeComplete_upv_1(v27)) then
                                a1:setSelection(a2)
                                a1.context.audio.play("pop", {})
                            else
                                a1:setSelection(nil)
                            end
                            return
                        end
                        a1:setSelection(nil)
                        a1.context.audio.play("uiBack", {})
                    elseif #v27 ~= 0 then
                        if isTubeComplete_upv_1(v27) then
                            a1:shakeTube(a2)
                            a1.context.audio.play("thud", {})
                        else
                            a1:setSelection(a2)
                            a1.context.audio.play("pop", {})
                        end
                    end
                end
            elseif a1.selection ~= nil then
                a1:setSelection(nil)
                a1.context.audio.play("uiBack", {})
            end
            return nil
        end
    end
    return nil
end
u26.setSelection = function(a1, a2)
    --[[
      name: setSelection
      line: 627
      upvalues:
        u1 (copy, index: 1)
        WATER_SORT_CONFIG_upv_1 (copy, index: 2)
        u25 (copy, index: 3)
    ]]
    local selection_1 = a1.selection
    if selection_1 ~= nil and selection_1 < a1.tubeCount then
        a1.tubeVisuals[selection_1 + 1].liftTarget = 0
    end
    a1.selection = a2
    if a2 ~= nil then
        a1.tubeVisuals[a2 + 1].liftTarget = WATER_SORT_CONFIG_upv_1.selectLiftStuds
        local homePosition_1 = a1.tubeVisuals[a2 + 1].homePosition
        a1.selectDisc.CFrame = CFrame.new(homePosition_1.X, (homePosition_1.Y - u25) + 0.2, homePosition_1.Z + 0.3) * CFrame.Angles(0, 0, 1.5707963267948966)
    else
        a1.selectDisc.CFrame = u1
        return nil
    end
end
u26.isTubeAnimating = function(a1, a2)
    --[[
      name: isTubeAnimating
      line: 644
    ]]
    for _, value_1 in a1.pourAnimations do
        if value_1.from == a2 or value_1.to == a2 then
            return true
        end
    end
    return false
end
u26.startPour = function(a1, a2, a3)
    --[[
      name: startPour
      line: 652
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
        topRun_upv_1 (copy, index: 2)
        applyPour_upv_1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
        isTubeComplete_upv_1 (copy, index: 5)
        isSolved_upv_1 (copy, index: 6)
        isStuck_upv_1 (copy, index: 7)
    ]]
    if WATER_SORT_CONFIG_upv_1.maxConcurrentPours <= #a1.pourAnimations then
        table.remove(a1.pourAnimations, 1)
        a1:finalizePour(a1.pourAnimations[1])
    end
    local v28 = topRun_upv_1(a1.board[a2 + 1])
    local v29 = nil
    if v28 ~= nil then
        local v30 = #a1.board[a3 + 1]
        local v31 = #a1.board[a2 + 1]
        a1.undoStack:push(a1.board)
        a1.movesUsed = a1.movesUsed + 1
        v29 = applyPour_upv_1(a1.board, a2, a3)
        if v29.moved ~= 0 then
            a1.board = v29.board
            a1:setSelection(nil)
            local v32 = a1.tubeVisuals[a2 + 1]
            local v33 = a1.tubeVisuals[a3 + 1]
            local v34 = ((v32.homePosition.X > v33.homePosition.X) and -1) or 1
            local v35
            if a1.topCount > a3 then
                v35 = WATER_SORT_CONFIG_upv_1.pourNearZStuds
            else
                v35 = WATER_SORT_CONFIG_upv_1.pourFrontZStuds
            end
            local v36 = CFrame.new(v33.homePosition + Vector3.new(-v34 * WATER_SORT_CONFIG_upv_1.pourOffsetXStuds, WATER_SORT_CONFIG_upv_1.pourHeightStuds, v35)) * CFrame.Angles(0, 0, -v34 * math.rad(WATER_SORT_CONFIG_upv_1.pourTiltDegrees))
            local v37 = 0
            for n_4 = 0, #a1.streamBusy - 1 do
                if not (a1.streamBusy[n_4 + 1]) then
                    v37 = n_4
                    break
                end
            end
            a1.streamBusy[v37 + 1] = true
            a1.streams[v37 + 1].Color = tbl_upv_1[v28.color]
            a1.streamDroplets[v37 + 1].Color = ColorSequence.new(tbl_upv_1[v28.color])
            a1.streamDroplets[v37 + 1].Enabled = true
            local v38 = math.clamp(v29.moved * WATER_SORT_CONFIG_upv_1.pourDrainSecondsPerUnit, WATER_SORT_CONFIG_upv_1.pourDrainMinSeconds, WATER_SORT_CONFIG_upv_1.pourDrainMaxSeconds)
            table.insert(a1.pourAnimations, {from = a2, to = a3, color = v28.color, moved = v29.moved, toCountBefore = v30, fromCountBefore = v31, fromStart = CFrame.new(v32.homePosition + Vector3.new(0, v32.lift, 0)), fromHome = CFrame.new(v32.homePosition), pourPose = v36, streamIndex = v37, drainSeconds = v38, completesDestination = isTubeComplete_upv_1(a1.board[a3 + 1]), age = 0, glugsPlayed = 0})
            v32.lift = 0
            v32.liftTarget = 0
            a1:syncTube(a3)
            local v39 = 0
            local v40 = false
            v40, v39 = v40, v39
            while true do
                if v40 then
                    v39 = v39 + 1
                else
                    v40 = true
                end
                if v39 >= v29.moved then
                    break
                end
                v33.units[(v30 + v39) + 1].Transparency = 1
                v33.marks[(v30 + v39) + 1].Transparency = 1
                v32.marks[((v31 - 1) - v39) + 1].Transparency = 1
            end
            a1.context.audio.play("splash", {})
            if isSolved_upv_1(a1.board) then
                a1.pendingOutcome = "win"
            elseif a1.budget > a1.movesUsed then
                if isStuck_upv_1(a1.board) then
                    a1.pendingOutcome = "stuck"
                end
            else
                a1.pendingOutcome = "budget"
            end
            a1:updateHud()
        else
            return nil
        end
    else
        return nil
    end
end
u26.finalizePour = function(a1, a2)
    --[[
      name: finalizePour
      line: 760
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.streams[a2.streamIndex + 1].CFrame = u1
    a1.streamBusy[a2.streamIndex + 1] = false
    a1.streamDroplets[a2.streamIndex + 1].Enabled = false
    a1:syncTube(a2.from)
    a1:syncTube(a2.to)
    if a2.completesDestination then
        a1:corkTube(a2.to)
    end
    if #a1.pourAnimations ~= 0 then
        return
    end
    a1:resolveOutcome()
end
u26.corkTube = function(a1, a2)
    --[[
      name: corkTube
      line: 773
      upvalues:
        u14 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
    ]]
    table.insert(a1.corkAnimations, {tube = a2})
    a1.context.audio.play("thud", {})
    a1.context.audio.play("coinSettle", {})
    a1.confettiAnchor.CFrame = CFrame.new(a1.tubeVisuals[a2 + 1].homePosition + Vector3.new(0, u14 + 1.2, 0))
    local v41
    if #a1.board[a2 + 1] <= 0 then
        v41 = u8
    else
        v41 = tbl_upv_1[a1.board[a2 + 1][1]]
    end
    a1.colorBurst.Color = ColorSequence.new(v41)
    a1.colorBurst:Emit(24)
    a1.goldBurst:Emit(16)
    a1.stage.shake(0.2)
    a1:hitStop(0.03)
end
u26.resolveOutcome = function(a1)
    --[[
      name: resolveOutcome
      line: 801
      upvalues:
        u10 (copy, index: 1)
    ]]
    local pendingOutcome_1 = a1.pendingOutcome
    if pendingOutcome_1 ~= nil then
        a1.pendingOutcome = nil
        if pendingOutcome_1 ~= "win" then
            if a1.undosLeft > 0 and a1.undoStack:size() > 0 then
                a1.phase = "awaitUndo"
                a1:popupAtCounter(((pendingOutcome_1 ~= "stuck") and "NO MOVES! UNDO!") or "STUCK! UNDO!", u10, 1.05)
                a1:shakeAllTubes()
                a1.context.audio.play("buzz", {})
                a1:updateHud()
                return nil
            end
            a1:onLevelFailed(pendingOutcome_1)
        else
            a1:onLevelWon()
            return nil
        end
    else
        return nil
    end
end
u26.onLevelWon = function(a1)
    --[[
      name: onLevelWon
      line: 828
      upvalues:
        u8 (copy, index: 1)
        WATER_SORT_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.phase = "transition"
    a1.context.reportScore(a1.level)
    a1.context.audio.play("perfect", {})
    local roundToken_upv_1 = a1.roundToken
    for n_upv_5 = 0, 2 do
        task.delay(
            (n_upv_5 * 0.1) + 0.08,
            function()
                --[[
                  line: 837
                  upvalues:
                    roundToken_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                    n_upv_5 (copy, index: 3)
                ]]
                if roundToken_upv_1 == a1.roundToken then
                    a1.context.audio.play("scorePing", {pitch = (n_upv_5 * 0.2) + 1})
                else
                    return nil
                end
            end
        )
    end
    a1:popupAtCounter(("LEVEL %*"):format(a1.level), u8, 1.35)
    a1.stage.shake(0.3)
    a1.level = a1.level + 1
    task.delay(
        WATER_SORT_CONFIG_upv_1.levelWinDelaySeconds,
        function()
            --[[
              line: 850
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
u26.onLevelFailed = function(a1, a2)
    --[[
      name: onLevelFailed
      line: 857
      upvalues:
        u10 (copy, index: 1)
        WATER_SORT_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.phase = "transition"
    a1.lives = a1.lives - 1
    a1.scene:setLives(a1.lives)
    a1:popupAtCounter(((a2 ~= "stuck") and "OUT OF MOVES!") or "STUCK!", u10, 1.2)
    a1.confettiAnchor.CFrame = a1.scene.signAnchor.CFrame
    a1.colorBurst.Color = ColorSequence.new(u10)
    a1.colorBurst:Emit(10)
    a1.stage.shake(0.15)
    a1:shakeAllTubes()
    a1.context.audio.play("buzz", {})
    if a1.lives > 0 then
        local roundToken_upv_2 = a1.roundToken
        task.delay(
            WATER_SORT_CONFIG_upv_1.failResetDelaySeconds,
            function()
                --[[
                  line: 883
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
        a1.context.endRun(a1.level - 1)
        return nil
    end
end
u26.performUndo = function(a1)
    --[[
      name: performUndo
      line: 890
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        u9 (copy, index: 2)
    ]]
    if a1:isRunning() and not pausedAtom_upv_1() and a1.phase ~= "transition" and a1.pendingOutcome == nil and #a1.pourAnimations <= 0 then
        local v42 = nil
        if a1.undosLeft > 0 then
            v42 = a1.undoStack:pop()
            if v42 ~= nil then
                a1.undosLeft = a1.undosLeft - 1
                a1.movesUsed = math.max(a1.movesUsed - 1, 0)
                a1.board = v42
                a1.phase = "play"
                a1:setSelection(nil)
                while #a1.corkAnimations > 0 do
                    local corkAnimations_2 = a1.corkAnimations
                    corkAnimations_2[#corkAnimations_2] = nil
                end
                local v43 = 0
                local v44 = false
                while true do
                    if v44 then
                        v43 = v43 + 1
                    else
                        v44 = true
                    end
                    if v43 >= a1.tubeCount then
                        break
                    end
                    a1:syncTube(v43)
                end
                a1.context.audio.play("uiBack", {})
                a1:popupAtCounter("UNDO", u9, 0.7)
                a1:updateHud()
            else
                a1.context.audio.play("thud", {})
                return nil
            end
        else
            a1.context.audio.play("thud", {})
            return nil
        end
    else
        return nil
    end
end
u26.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 952
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u21 (copy, index: 3)
        u23 (copy, index: 4)
    ]]
    for n_6 = #a1.pourAnimations - 1, 0, -1 do
        local v45
        v45 = a1.pourAnimations[n_6 + 1]
        v45.age = v45.age + a2
        local v46
        v46 = WATER_SORT_CONFIG_upv_1.pourApproachSeconds
        local v47 = v46 + v45.drainSeconds
        local v48 = a1.tubeVisuals[v45.from + 1]
        if v45.age < v46 then
            local v49 = v45.age / v46
            local v50 = ((v49 >= 0.5) and (1 - (((-2 * v49) + 2) ^ 2) / 2)) or (2 * v49 * v49)
            local v51 = math.sin(v50 * math.pi)
            a1:poseTube(v48, v45.fromStart:Lerp(v45.pourPose, v50) * CFrame.new(0, v51 * WATER_SORT_CONFIG_upv_1.pourArcStuds, 0))
            continue
        end
        if v45.age < v47 then
            a1:poseTube(v48, v45.pourPose)
            a1:advanceDrain(v45, (v45.age - v46) / v45.drainSeconds)
            continue
        end
        if v45.age >= v47 + WATER_SORT_CONFIG_upv_1.pourReturnSeconds then
            table.remove(a1.pourAnimations, n_6 + 1)
            a1:finalizePour(v45)
            continue
        end
        if a1.streamBusy[v45.streamIndex + 1] then
            a1.streams[v45.streamIndex + 1].CFrame = u1
        end
        local v52 = (v45.age - v47) / WATER_SORT_CONFIG_upv_1.pourReturnSeconds
        a1:poseTube(v48, v45.pourPose:Lerp(v45.fromHome, ((v52 >= 0.5) and (1 - (((-2 * v52) + 2) ^ 2) / 2)) or (2 * v52 * v52)))
        local v53 = 0
        local v54 = false
        v52 = v53
        while true do
            if v54 then
                v52 = v52 + 1
            else
                v54 = true
            end
            if v52 >= v45.moved then
                break
            end
            v48.units[((v45.fromCountBefore - 1) - v52) + 1].Transparency = 1
        end
    end
    for n_7 = #a1.corkAnimations - 1, 0, -1 do
        local v55 = a1.corkAnimations[n_7 + 1]
        v55.age = v55.age + a2
        local v56 = a1.tubeVisuals[v55.tube + 1]
        local v57
        v57 = math.min(v55.age / WATER_SORT_CONFIG_upv_1.corkDropSeconds, 1)
        v56.cork.CFrame = CFrame.new(v56.homePosition + Vector3.new(0, u21 + ((1 - (v57 * v57)) * 6), 0)) * u23
        if v57 >= 1 then
            table.remove(a1.corkAnimations, n_7 + 1)
        end
    end
    local v58, v59
    v58, v59 = false, 0
    local v60, v56, v60, v56, v47, v60, v47 = nil, nil, nil, nil, nil, nil, nil
    if v58 then
        v59 = v59 + 1
    else
        v58 = true
    end
    if v59 < a1.tubeCount then
        local v61 = a1.tubeVisuals[v59 + 1]
        if not (a1:isTubeAnimating(v59)) then
            v60 = false
            if v61.lift ~= v61.liftTarget then
                local v62 = WATER_SORT_CONFIG_upv_1.selectLiftStuds / WATER_SORT_CONFIG_upv_1.liftSeconds * a2
                if v61.lift >= v61.liftTarget then
                    v47 = math.max(v61.lift - v62, v61.liftTarget)
                else
                    v47 = math.min(v61.lift + v62, v61.liftTarget)
                end
                v61.lift = v47
                v60 = true
            end
            v56 = 0
            if v61.shakeAge >= 0 then
                v61.shakeAge = v61.shakeAge + a2
                if WATER_SORT_CONFIG_upv_1.invalidShakeSeconds > v61.shakeAge then
                    v56 = math.sin(v61.shakeAge * 46) * WATER_SORT_CONFIG_upv_1.invalidShakeStuds * (1 - (v61.shakeAge / WATER_SORT_CONFIG_upv_1.invalidShakeSeconds))
                else
                    v61.shakeAge = -1
                end
                v60 = true
            end
            v47 = 0
            if v61.settleAge >= 0 then
                v61.settleAge = v61.settleAge + a2
                if WATER_SORT_CONFIG_upv_1.settleSeconds > v61.settleAge then
                    local _ = v61.settleAge / WATER_SORT_CONFIG_upv_1.settleSeconds
                    v47 = -WATER_SORT_CONFIG_upv_1.settleDipStuds * math.sin(v61.settleAge / WATER_SORT_CONFIG_upv_1.settleSeconds * math.pi) * (1 - v61.settleAge / WATER_SORT_CONFIG_upv_1.settleSeconds * 0.5)
                else
                    v61.settleAge = -1
                end
                v60 = true
            end
            if v60 then
                a1:poseTube(v61, CFrame.new(v61.homePosition + Vector3.new(v56, v61.lift + v47, 0)))
            end
        end
        if v58 then
            v59 = v59 + 1
        else
            v58 = true
        end
    end
end
u26.advanceDrain = function(a1, a2, a3)
    --[[
      name: advanceDrain
      line: 1074
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    local v63 = a1.tubeVisuals[a2.to + 1]
    local homePosition_2 = v63.homePosition
    local v64 = homePosition_2.Y - u14 + (a2.toCountBefore + (a3 * a2.moved)) * WATER_SORT_CONFIG_upv_1.unitHeight
    local v65 = math.max(((homePosition_2.Y + WATER_SORT_CONFIG_upv_1.pourHeightStuds) - 2.4) - v64, 0.2)
    local v66 = a1.streams[a2.streamIndex + 1]
    v66.Size = Vector3.new(0.34, v65, 0.34)
    v66.CFrame = CFrame.new(homePosition_2.X, v64 + (v65 / 2), homePosition_2.Z + 0.25)
    local v67 = a1.tubeVisuals[a2.from + 1]
    local v68 = 0
    local v69 = false
    if v69 then
        v68 = v68 + 1
    else
        v69 = true
    end
    local v70, v71 = nil, nil
    if v68 < a2.moved then
        v70 = math.clamp((a3 * a2.moved) - v68, 0, 1)
        local v72 = v63.units[(a2.toCountBefore + v68) + 1]
        if v70 > 0 then
            v72.Transparency = 0
            local v73 = math.max(v70 * WATER_SORT_CONFIG_upv_1.unitHeight, 0.14)
            v72.Size = Vector3.new(WATER_SORT_CONFIG_upv_1.unitWidth, v73, WATER_SORT_CONFIG_upv_1.unitDepth)
            v72.CFrame = CFrame.new(homePosition_2.X, ((homePosition_2.Y - u14) + ((a2.toCountBefore + v68) * WATER_SORT_CONFIG_upv_1.unitHeight)) + (v73 / 2), homePosition_2.Z)
        else
            v72.Transparency = 1
        end
        local v74 = a2.fromCountBefore - 1 - v68
        local v75 = v67.units[v74 + 1]
        v71 = 1 - v70
        if v71 > 0.02 then
            v75.Transparency = 0
            local v76 = math.max(v71 * WATER_SORT_CONFIG_upv_1.unitHeight, 0.14)
            v75.Size = Vector3.new(WATER_SORT_CONFIG_upv_1.unitWidth, v76, WATER_SORT_CONFIG_upv_1.unitDepth)
            v75.CFrame = a2.pourPose * CFrame.new(0, (-u14 + (v74 * WATER_SORT_CONFIG_upv_1.unitHeight)) + (v76 / 2), 0)
        else
            v75.Transparency = 1
        end
        if v69 then
            v68 = v68 + 1
        else
            v69 = true
        end
        --[[ goto label_3 ]]--
    end
    v68 = math.floor((a3 * a2.moved) + 1e-04)
    while a2.glugsPlayed < v68 do
        a1.context.audio.play("pop", {pitch = 0.92 + (a2.glugsPlayed * 0.1)})
        a2.glugsPlayed = a2.glugsPlayed + 1
        v63.settleAge = 0
    end
end
u26.poseTube = function(a1, a2, a3)
    --[[
      name: poseTube
      line: 1139
      upvalues:
        u16 (copy, index: 1)
        u17 (copy, index: 2)
        u18 (copy, index: 3)
        u19 (copy, index: 4)
        u20 (copy, index: 5)
        tbl_upv_3 (copy, index: 6)
        u22 (copy, index: 7)
        u1 (copy, index: 8)
    ]]
    a2.base.CFrame = a3 * u16
    a2.leftWall.CFrame = a3 * u17
    a2.rightWall.CFrame = a3 * u18
    a2.backPanel.CFrame = a3 * u19
    a2.rim.CFrame = a3 * u20
    for n_8 = 0, 3 do
        a2.units[n_8 + 1].CFrame = a3 * tbl_upv_3[n_8 + 1]
        a2.marks[n_8 + 1].CFrame = a3 * a2.markLocals[n_8 + 1]
    end
    local cork_1 = a2.cork
    local v77
    if a2.corked then
        v77 = a3 * u22
    else
        v77 = u1
    end
    cork_1.CFrame = v77
end
u26.syncTube = function(a1, a2)
    --[[
      name: syncTube
      line: 1155
      upvalues:
        WATER_SORT_CONFIG_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        u15 (copy, index: 3)
        isTubeComplete_upv_1 (copy, index: 4)
    ]]
    local v78 = a1.tubeVisuals[a2 + 1]
    local v79 = a1.board[a2 + 1]
    local v80 = WATER_SORT_CONFIG_upv_1.glyphMarkMinColors <= a1.generated.spec.colors
    for n_9 = 0, 3 do
        local v81 = v78.units[n_9 + 1]
        local v82 = v78.marks[n_9 + 1]
        if n_9 >= #v79 then
            v81.Transparency = 1
            v82.Transparency = 1
            continue
        end
        local v83 = v79[n_9 + 1]
        v81.Color = tbl_upv_1[v83]
        v81.Transparency = 0
        v81.Size = u15
        if v80 then
            a1:dressMark(v82, v83)
            v78.markLocals[n_9 + 1] = a1:markLocalFor(v83, n_9)
            v82.Transparency = 0
        else
            v82.Transparency = 1
        end
    end
    v78.corked = isTubeComplete_upv_1(v79)
    a1:poseTube(v78, CFrame.new(v78.homePosition + Vector3.new(0, v78.lift, 0)))
end
u26.dressMark = function(a1, a2, a3)
    --[[
      name: dressMark
      line: 1185
      upvalues:
        tbl_upv_2 (copy, index: 1)
        u12 (copy, index: 2)
        u11 (copy, index: 3)
    ]]
    local v84 = tbl_upv_2[a3]
    local v85
    if v84.light then
        v85 = u12
    else
        v85 = u11
    end
    a2.Color = v85
    if v84.shape == "disc" then
        a2.Shape = Enum.PartType.Cylinder
        a2.Size = Vector3.new(0.11999999731779099, 0.6600000262260437, 0.6600000262260437)
    elseif v84.shape ~= "dot" then
        a2.Shape = Enum.PartType.Block
        if v84.shape == "square" then
            a2.Size = Vector3.new(0.5600000023841858, 0.5600000023841858, 0.11999999731779099)
        elseif v84.shape == "diamond" then
            a2.Size = Vector3.new(0.46000000834465027, 0.46000000834465027, 0.11999999731779099)
        elseif v84.shape ~= "barHorizontal" then
            a2.Size = Vector3.new(0.2800000011920929, 0.9200000166893005, 0.11999999731779099)
        else
            a2.Size = Vector3.new(0.9200000166893005, 0.2800000011920929, 0.11999999731779099)
        end
    else
        a2.Shape = Enum.PartType.Cylinder
        a2.Size = Vector3.new(0.11999999731779099, 0.3400000035762787, 0.3400000035762787)
    end
end
u26.markLocalFor = function(a1, a2, a3)
    --[[
      name: markLocalFor
      line: 1207
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        u24 (copy, index: 3)
    ]]
    local v86 = tbl_upv_2[a2]
    local v87 = CFrame.new(0, tbl_upv_3[a3 + 1].Y, u24)
    if v86.shape ~= "diamond" then
        if v86.shape ~= "disc" and v86.shape ~= "dot" then
            return v87
        end
        return v87 * CFrame.Angles(0, 1.5707963267948966, 0)
    end
    return v87 * CFrame.Angles(0, 0, 0.7853981633974483)
end
u26.parkTube = function(a1, a2)
    --[[
      name: parkTube
      line: 1220
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v88 = a1.tubeVisuals[a2 + 1]
    v88.corked = false
    v88.lift = 0
    v88.liftTarget = 0
    v88.shakeAge = -1
    a1:poseTube(v88, u1)
end
u26.shakeTube = function(a1, a2)
    --[[
      name: shakeTube
      line: 1228
    ]]
    a1.tubeVisuals[a2 + 1].shakeAge = 0
end
u26.shakeAllTubes = function(a1)
    --[[
      name: shakeAllTubes
      line: 1231
    ]]
    local v89 = 0
    local v90 = false
    if v90 then
        v89 = v89 + 1
    else
        v90 = true
    end
    if v89 >= a1.tubeCount then
        return
    end
    if not (a1.tubeVisuals[v89 + 1].corked) and not (a1:isTubeAnimating(v89)) then
        a1:shakeTube(v89)
    end
    if v90 then
        v89 = v89 + 1
    else
        v90 = true
    end
end
u26.updateHud = function(a1)
    --[[
      name: updateHud
      line: 1251
      upvalues:
        u10 (copy, index: 1)
        u9 (copy, index: 2)
    ]]
    local v91 = math.max(a1.budget - a1.movesUsed, 0)
    local v92 = ("MOVES %*/%*"):format(v91, a1.budget)
    if v92 ~= a1.lastMovesText then
        a1.lastMovesText = v92
        a1.movesLabel.Text = v92
        local movesLabel_1 = a1.movesLabel
        local v93
        if v91 > 3 then
            v93 = u9
        else
            v93 = u10
        end
        movesLabel_1.TextColor3 = v93
    end
    local v94 = ("UNDO %*"):format(a1.undosLeft)
    if v94 ~= a1.lastUndoText then
        a1.lastUndoText = v94
        a1.undoLabel.Text = v94
    end
    local undoButton_1 = a1.undoButton
    local v95 = false
    if a1.undosLeft > 0 then
        v95 = a1.undoStack:size() > 0
    end
    undoButton_1:setEnabled(v95)
end
u26.popupAtCounter = function(a1, a2, a3, a4)
    --[[
      name: popupAtCounter
      line: 1266
    ]]
    a1.popups:show(a1.scene.signAnchor.CFrame.Position + Vector3.new(-1.600000023841858, 4.599999904632568, 1), a2, a3, a4)
end
u26.makeCounterLabel = function(a1, a2, a3, a4)
    --[[
      name: makeCounterLabel
      line: 1272
      upvalues:
        u9 (copy, index: 1)
    ]]
    local v96 = Instance.new("TextLabel")
    v96.BackgroundTransparency = 1
    v96.Position = a3
    v96.Size = a4
    v96.Font = Enum.Font.GothamBlack
    v96.TextScaled = true
    v96.TextColor3 = u9
    v96.TextStrokeTransparency = 0.5
    v96.Parent = a2
    return v96
end
u26.destroy = function(a1)
    --[[
      name: destroy
      line: 1284
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    BaseWorldGame_upv_1.destroy(a1)
end
u26.makeBurstEmitter = function(a1, a2, a3)
    --[[
      name: makeBurstEmitter
      line: 1290
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    local v97 = Instance.new("ParticleEmitter")
    v97.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v97.Rate = 0
    v97.Lifetime = NumberRange.new(0.35, 0.7)
    v97.Speed = NumberRange.new(7, 13)
    v97.SpreadAngle = Vector2.new(180, 180)
    v97.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.1)})
    v97.Color = ColorSequence.new(a3)
    v97.Parent = a2
    return v97
end
local tbl_16 = {}
tbl_16.WaterSortGame = u26
return tbl_16