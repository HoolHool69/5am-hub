-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardPicker_upv_1 = v1.BoardPicker
local boardDirectionForSwipe_upv_1 = v1.boardDirectionForSwipe
local IsoBoardCamera_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "iso-board-camera").IsoBoardCamera
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local TouchControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "touch-button").TouchControls
local restartConfirmOwnsRestartKey_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "restart-confirm").restartConfirmOwnsRestartKey
local pausedAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").pausedAtom
local UndoStack_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "undo-stack").UndoStack
local SOKOBAN_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "sokoban-config").SOKOBAN_CONFIG
local generateLevel_upv_1 = RuntimeLib_1.import(script, script.Parent, "sokoban-levels").generateLevel
local v3 = RuntimeLib_1.import(script, script.Parent, "sokoban-sim")
local applyMove_upv_1 = v3.applyMove
local directionDeltaX_upv_1 = v3.directionDeltaX
local directionDeltaY_upv_1 = v3.directionDeltaY
local keyX_upv_1 = v3.keyX
local keyY_upv_1 = v3.keyY
local SokobanEngine_upv_1 = v3.SokobanEngine
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(152, 154, 160)
local u3 = Color3.fromRGB(106, 108, 118)
local u4 = Color3.fromRGB(76, 78, 90)
local u5 = Color3.fromRGB(98, 94, 88)
local u6 = Color3.fromRGB(226, 224, 212)
local u7 = Color3.fromRGB(248, 214, 128)
local u8 = Color3.fromRGB(158, 106, 58)
local u9 = Color3.fromRGB(212, 160, 62)
local u10 = Color3.fromRGB(106, 68, 36)
local u11 = Color3.fromRGB(148, 106, 34)
local u12 = Color3.fromRGB(216, 58, 44)
local u13 = Color3.fromRGB(56, 108, 186)
local u14 = Color3.fromRGB(240, 214, 178)
local u15 = Color3.fromRGB(226, 158, 52)
local u16 = Color3.fromRGB(26, 31, 44)
local u17 = Color3.fromRGB(46, 56, 78)
local u18 = Color3.fromRGB(58, 124, 236)
local u19 = Color3.fromRGB(40, 46, 64)
local u20 = Color3.fromRGB(255, 216, 102)
local u21 = Color3.fromRGB(245, 245, 255)
local u22 = Color3.fromRGB(255, 92, 80)
local tbl_upv_1 = {}
tbl_upv_1.background = Color3.fromRGB(52, 40, 26)
tbl_upv_1.stroke = u20
tbl_upv_1.text = Color3.fromRGB(255, 232, 164)
local tbl_upv_2 = {}
tbl_upv_2.background = Color3.fromRGB(38, 38, 48)
tbl_upv_2.stroke = Color3.fromRGB(96, 96, 110)
tbl_upv_2.text = Color3.fromRGB(150, 150, 162)
local u23 = CFrame.Angles(0, 0, 0)
local u24 = CFrame.Angles(0, math.pi, 0)
local u25 = CFrame.Angles(0, 1.5707963267948966, 0)
local u26 = CFrame.Angles(0, -1.5707963267948966, 0)
local u27 = CFrame.Angles(0, 0.6108652381980153, 0)
local function facingCFrame_1(a1)
    --[[
      name: facingCFrame
      line: 84
      upvalues:
        u23 (copy, index: 1)
        u24 (copy, index: 2)
        u25 (copy, index: 3)
        u26 (copy, index: 4)
    ]]
    if a1 ~= "up" then
        if a1 ~= "down" then
            if a1 ~= "left" then
                return u26
            end
            return u25
        end
        return u24
    end
    return u23
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 117
    ]]
    return "SokobanGame"
end
tbl_4.__index = BaseWorldGame_upv_1
local u28 = setmetatable(tbl_3, tbl_4)
u28.__index = u28
u28.new = function(...)
    --[[
      name: new
      line: 123
      upvalues:
        u28 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u28)
    return v4:constructor(...) or v4
end
u28.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 127
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        SOKOBAN_CONFIG_upv_1 (copy, index: 2)
        u24 (copy, index: 3)
        UndoStack_upv_1 (copy, index: 4)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = SOKOBAN_CONFIG_upv_1.livesPerRun
    a1.deadlocks = 0
    a1.resets = 0
    a1.liveCells = {}
    a1.goalMask = {}
    a1.playerCell = 0
    a1.boxes = {}
    a1.goalChain = 0
    a1.moves = 0
    a1.pushes = 0
    a1.roundToken = 0
    a1.beat = "none"
    a1.pendingDeadlockCell = -1
    a1.facing = u24
    a1.hintShown = false
    a1.undoStack = UndoStack_upv_1.new(SOKOBAN_CONFIG_upv_1.undoCapacity)
    a1.playerBase = Vector3.new(0, 0, 0)
    a1.playerLift = 0
    a1.bumpAge = -1
    a1.bumpDeltaX = 0
    a1.bumpDeltaZ = 0
    a1.bumpX = 0
    a1.bumpZ = 0
    a1.deadlockCrate = -1
    a1.deadlockAge = -1
    a1.completeAge = -1
    a1.goalPulseFired = 0
    a1.floorPlates = {}
    a1.deadMarks = {}
    a1.wallBlocks = {}
    a1.goalPads = {}
    a1.goalInners = {}
    a1.goalPositions = {}
    a1.crateBodies = {}
    a1.crateStraps = {}
    a1.cratePositions = {}
    a1.cratePopAge = {}
    a1.heartParts = {}
end
u28.buildScene = function(a1)
    --[[
      name: buildScene
      line: 169
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        SOKOBAN_CONFIG_upv_1 (copy, index: 3)
        u17 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        u2 (copy, index: 6)
        u1 (copy, index: 7)
        u4 (copy, index: 8)
        u5 (copy, index: 9)
        u6 (copy, index: 10)
        u7 (copy, index: 11)
        u8 (copy, index: 12)
        u10 (copy, index: 13)
        u18 (copy, index: 14)
        PopupTextPool_upv_1 (copy, index: 15)
        BoardPicker_upv_1 (copy, index: 16)
        IsoBoardCamera_upv_1 (copy, index: 17)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    local v5 = makeSmoothPart_upv_1(container_1)
    v5.Material = Enum.Material.SmoothPlastic
    v5.Size = Vector3.new(600, 1, 600)
    v5.Color = u16
    v5.CFrame = CFrame.new(origin_1 + Vector3.new(0, -14, 0))
    local Unit_1 = Vector3.new(SOKOBAN_CONFIG_upv_1.camera.lookDirection.X, 0, SOKOBAN_CONFIG_upv_1.camera.lookDirection.Z).Unit
    local v6 = makeSmoothPart_upv_1(container_1)
    v6.Material = Enum.Material.SmoothPlastic
    v6.Size = Vector3.new(700, 300, 1)
    v6.Color = u17
    v6.CFrame = CFrame.lookAt(origin_1 + (Unit_1 * 120), origin_1 + (Unit_1 * 121))
    for _ = 0, SOKOBAN_CONFIG_upv_1.maxFloorPlates - 1 do
        local v7 = makeStagePart_upv_1(container_1)
        v7.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.floorPlateSize, SOKOBAN_CONFIG_upv_1.floorThickness, SOKOBAN_CONFIG_upv_1.floorPlateSize)
        v7.Color = u2
        v7.CFrame = u1
        table.insert(a1.floorPlates, v7)
    end
    for _ = 0, SOKOBAN_CONFIG_upv_1.maxDeadMarks - 1 do
        local v8 = makeSmoothPart_upv_1(container_1)
        v8.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.deadMarkSize, 0.08, SOKOBAN_CONFIG_upv_1.deadMarkSize)
        v8.Color = u4
        v8.CFrame = u1
        table.insert(a1.deadMarks, v8)
    end
    for _ = 0, SOKOBAN_CONFIG_upv_1.maxWallBlocks - 1 do
        local v9 = makeStagePart_upv_1(container_1)
        v9.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.cellPitch - SOKOBAN_CONFIG_upv_1.wallInset, SOKOBAN_CONFIG_upv_1.wallHeight, SOKOBAN_CONFIG_upv_1.cellPitch - SOKOBAN_CONFIG_upv_1.wallInset)
        v9.Color = u5
        v9.CFrame = u1
        table.insert(a1.wallBlocks, v9)
    end
    for _ = 0, SOKOBAN_CONFIG_upv_1.maxCrates - 1 do
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.goalPadSize, 0.14, SOKOBAN_CONFIG_upv_1.goalPadSize)
        v10.Color = u6
        v10.CFrame = u1
        table.insert(a1.goalPads, v10)
        local v11 = makeSmoothPart_upv_1(container_1)
        v11.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.goalInnerSize, 0.16, SOKOBAN_CONFIG_upv_1.goalInnerSize)
        v11.Color = u7
        v11.CFrame = u1
        table.insert(a1.goalInners, v11)
        table.insert(a1.goalPositions, Vector3.new(0, 0, 0))
        local v12 = makeStagePart_upv_1(container_1)
        v12.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.crateSize, SOKOBAN_CONFIG_upv_1.crateSize, SOKOBAN_CONFIG_upv_1.crateSize)
        v12.Color = u8
        v12.CFrame = u1
        table.insert(a1.crateBodies, v12)
        local v13 = makeSmoothPart_upv_1(container_1)
        v13.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.crateSize + 0.06, SOKOBAN_CONFIG_upv_1.crateStrapHeight, SOKOBAN_CONFIG_upv_1.crateSize + 0.06)
        v13.Color = u10
        v13.CFrame = u1
        table.insert(a1.crateStraps, v13)
        table.insert(a1.cratePositions, Vector3.new(0, 0, 0))
        table.insert(a1.cratePopAge, -1)
    end
    for _ = 0, SOKOBAN_CONFIG_upv_1.livesPerRun - 1 do
        local v14 = makeStagePart_upv_1(container_1)
        v14.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
        v14.Color = u18
        v14.CFrame = u1
        table.insert(a1.heartParts, v14)
    end
    a1:buildPlayerRig(container_1)
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    a1.picker = BoardPicker_upv_1.new(a1.stage, {columns = SOKOBAN_CONFIG_upv_1.maxGridWidth, rows = SOKOBAN_CONFIG_upv_1.maxGridHeight, cellPitch = SOKOBAN_CONFIG_upv_1.cellPitch})
    a1.boardCamera = IsoBoardCamera_upv_1.new(a1.stage, SOKOBAN_CONFIG_upv_1.camera)
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a2)
                --[[
                  line: 268
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a2)
            end
        )
    )
    a1:buildControls()
end
u28.buildPlayerRig = function(a1, a2)
    --[[
      name: buildPlayerRig
      line: 273
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        SOKOBAN_CONFIG_upv_1 (copy, index: 2)
        u13 (copy, index: 3)
        u14 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u15 (copy, index: 6)
    ]]
    a1.playerModel = Instance.new("Model")
    local v15 = makeStagePart_upv_1(a1.playerModel)
    v15.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.playerBodySize, SOKOBAN_CONFIG_upv_1.playerBodyHeight, SOKOBAN_CONFIG_upv_1.playerBodySize * 0.74)
    v15.Color = u13
    v15.CFrame = CFrame.new(0, SOKOBAN_CONFIG_upv_1.playerBodyHeight / 2, 0)
    v15.PivotOffset = CFrame.new(0, -SOKOBAN_CONFIG_upv_1.playerBodyHeight / 2, 0)
    local v16 = makeStagePart_upv_1(a1.playerModel)
    v16.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.playerHeadSize, SOKOBAN_CONFIG_upv_1.playerHeadSize, SOKOBAN_CONFIG_upv_1.playerHeadSize)
    v16.Color = u14
    v16.CFrame = CFrame.new(0, SOKOBAN_CONFIG_upv_1.playerBodyHeight + (SOKOBAN_CONFIG_upv_1.playerHeadSize / 2), 0)
    local v17 = makeSmoothPart_upv_1(a1.playerModel)
    v17.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.playerHeadSize + 0.08, 0.26, SOKOBAN_CONFIG_upv_1.playerHeadSize + 0.08)
    v17.Color = u15
    v17.CFrame = CFrame.new(0, (SOKOBAN_CONFIG_upv_1.playerBodyHeight + SOKOBAN_CONFIG_upv_1.playerHeadSize) + 0.1, 0)
    local v18 = makeSmoothPart_upv_1(a1.playerModel)
    v18.Size = Vector3.new(SOKOBAN_CONFIG_upv_1.playerHeadSize + 0.08, 0.16, 0.42)
    v18.Color = u15
    v18.CFrame = CFrame.new(0, (SOKOBAN_CONFIG_upv_1.playerBodyHeight + SOKOBAN_CONFIG_upv_1.playerHeadSize) + 0.02, -((SOKOBAN_CONFIG_upv_1.playerHeadSize / 2) + 0.21))
    a1.playerModel.PrimaryPart = v15
    a1.playerModel.Parent = a2
end
u28.buildControls = function(a1)
    --[[
      name: buildControls
      line: 298
      upvalues:
        TouchControls_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        UserInputService_upv_1 (copy, index: 4)
        pausedAtom_upv_1 (copy, index: 5)
        restartConfirmOwnsRestartKey_upv_1 (copy, index: 6)
    ]]
    local v19 = TouchControls_upv_1.new({})
    a1.context.janitor:Add(v19, "destroy")
    local function onActivated_1()
        --[[
          name: onActivated
          line: 312
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.context.requestStart()
        a1:performUndo()
    end
    a1.undoButton = v19:addButton({anchorPoint = Vector2.new(1, 1), position = UDim2.new(1, -16, 1, -16), look = tbl_upv_1, disabledLook = tbl_upv_2, onActivated = onActivated_1})
    local function onActivated_2()
        --[[
          name: onActivated
          line: 325
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.context.requestStart()
        a1:performManualReset()
    end
    v19:addButton({anchorPoint = Vector2.new(1, 1), position = UDim2.new(1, -16, 1, -80), look = tbl_upv_1, onActivated = onActivated_2})
    a1.context.janitor:Add(
        UserInputService_upv_1.InputBegan:Connect(
            function(a2, a3)
                --[[
                  line: 330
                  upvalues:
                    pausedAtom_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                    restartConfirmOwnsRestartKey_upv_1 (copy, index: 3)
                ]]
                if a3 then
                    return nil
                else
                    local v20
                    if pausedAtom_upv_1() then
                        return nil
                    end
                    v20 = a2.KeyCode
                    if v20 ~= Enum.KeyCode.Z and v20 ~= Enum.KeyCode.U and v20 ~= Enum.KeyCode.ButtonY then
                        if v20 == Enum.KeyCode.R or v20 == Enum.KeyCode.ButtonX then
                            if restartConfirmOwnsRestartKey_upv_1() then
                                return nil
                            end
                            a1:performManualReset()
                        end
                        return
                    end
                    a1:performUndo()
                end
            end
        )
    )
end
u28.resetRound = function(a1)
    --[[
      name: resetRound
      line: 361
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = SOKOBAN_CONFIG_upv_1.livesPerRun
    a1.deadlocks = 0
    a1.resets = 0
    a1:loadLevel()
    a1.context.reportScore(0)
end
u28.fixedUpdate = function(a1)
    --[[
      name: fixedUpdate
      line: 370
    ]]
end
u28.render = function(a1, a2)
    --[[
      name: render
      line: 373
    ]]
    a1.boardCamera:update()
    a1:advanceAnimations(a2)
end
u28.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 377
    ]]
    a1.boardCamera:update()
    a1:advanceAnimations(a2)
end
u28.revive = function(a1)
    --[[
      name: revive
      line: 381
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = SOKOBAN_CONFIG_upv_1.livesPerRun
    a1:resetAttempt()
    a1:setRunning(true)
end
u28.captureRound = function(a1)
    --[[
      name: captureRound
      line: 387
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u28.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 393
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v21 = string.split(a2.state, "|")
    if #v21 == 3 then
        local v22 = nil
        if v21[1] == "1" then
            v22 = tonumber(v21[2])
            local num_1 = tonumber(v21[3])
            if v22 ~= nil and num_1 ~= nil and v22 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v22)
                a1.lives = math.clamp(math.floor(num_1), 1, SOKOBAN_CONFIG_upv_1.livesPerRun)
                a1:loadLevel()
                a1.context.reportScore(a2.score)
                return true
            end
            return false
        end
    end
    return false
end
u28.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 410
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        SokobanEngine_upv_1 (copy, index: 2)
        SOKOBAN_CONFIG_upv_1 (copy, index: 3)
        u21 (copy, index: 4)
    ]]
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    a1.spec = a1.generated.spec
    a1.engine = SokobanEngine_upv_1.new(a1.spec)
    a1.liveCells = a1.engine.liveCells
    a1.goalMask = a1.engine.goalMask
    a1.picker:setSpec({columns = a1.spec.width, rows = a1.spec.height, cellPitch = SOKOBAN_CONFIG_upv_1.cellPitch})
    a1.boardCamera:setBoardExtent(math.max(a1.spec.width, a1.spec.height) * SOKOBAN_CONFIG_upv_1.cellPitch)
    a1:dressBoard()
    a1:resetAttempt()
    local origin_2 = a1.stage.origin
    a1.popups:show(origin_2 + Vector3.new(0, 6.400000095367432, 0), ("PAR %*"):format(a1.generated.par), u21, 0.75)
    if (a1.hintShown) or a1.level ~= 1 then
        return
    end
    a1.hintShown = true
    a1.popups:show(origin_2 + Vector3.new(0, 4.199999809265137, 0), "UNDO IS FREE", u21, 0.7, 1.6)
end
u28.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 436
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        u2 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local spec_1 = a1.spec
    local v23 = 0
    local v24 = 0
    local v25 = 0
    local v26 = 0
    local v27 = 0
    local v28 = false
    if v28 then
        v27 = v27 + 1
    else
        v28 = true
    end
    if v27 < spec_1.height then
        local v29 = 0
        local v30 = false
        local v31 = nil
        if v30 then
            v29 = v29 + 1
        else
            v30 = true
        end
        local v32, v33 = nil, nil
        while v29 < spec_1.width do
            v32 = v27 * spec_1.width + v29
            v33 = a1.picker:cellWorld(v29, v27)
            if spec_1.walls[v32 + 1] ~= true then
                local v34 = a1.goalMask[v32 + 1] == true
                local v35 = a1.liveCells[v32 + 1] ~= true
                if v23 < #a1.floorPlates then
                    local v36 = a1.floorPlates[v23 + 1]
                    if v35 then
                        v31 = u3
                    else
                        v31 = u2
                    end
                    v36.Color = v31
                    v36.CFrame = CFrame.new(v33 + Vector3.new(0, (-SOKOBAN_CONFIG_upv_1.floorThickness / 2) - (((not v34) and 0) or (SOKOBAN_CONFIG_upv_1.goalRecess)), 0))
                    v23 = v23 + 1
                end
                if v35 and v24 < #a1.deadMarks then
                    a1.deadMarks[v24 + 1].CFrame = CFrame.new(v33 + Vector3.new(0, 0.03999999910593033, 0))
                    v24 = v24 + 1
                end
                if v34 and v26 < #a1.goalPads then
                    local v37 = v33 - Vector3.new(0, SOKOBAN_CONFIG_upv_1.goalRecess, 0)
                    a1.goalPads[v26 + 1].CFrame = CFrame.new(v37 + Vector3.new(0, 0.07000000029802322, 0))
                    a1.goalInners[v26 + 1].CFrame = CFrame.new(v37 + Vector3.new(0, 0.14000000059604645, 0))
                    a1.goalInners[v26 + 1].Size = Vector3.new(SOKOBAN_CONFIG_upv_1.goalInnerSize, 0.16, SOKOBAN_CONFIG_upv_1.goalInnerSize)
                    a1.goalPositions[v26 + 1] = v37
                    v26 = v26 + 1
                end
            elseif #a1.wallBlocks > v25 then
                a1.wallBlocks[v25 + 1].CFrame = CFrame.new(v33 + Vector3.new(0, (SOKOBAN_CONFIG_upv_1.wallHeight / 2) - SOKOBAN_CONFIG_upv_1.floorThickness, 0))
                v25 = v25 + 1
            end
            if v30 then
                v29 = v29 + 1
            else
                v30 = true
            end
        end
        if v28 then
            v27 = v27 + 1
        else
            v28 = true
        end
        --[[ goto label_3 ]]--
    end
    v28, v27 = false, v23
    while true do
        if v28 then
            v27 = v27 + 1
        else
            v28 = true
        end
        if v27 >= #a1.floorPlates then
            break
        end
        a1.floorPlates[v27 + 1].CFrame = u1
    end
    v28, v27 = false, v24
    while true do
        if v28 then
            v27 = v27 + 1
        else
            v28 = true
        end
        if v27 >= #a1.deadMarks then
            break
        end
        a1.deadMarks[v27 + 1].CFrame = u1
    end
    v28, v27 = false, v25
    while true do
        if v28 then
            v27 = v27 + 1
        else
            v28 = true
        end
        if v27 >= #a1.wallBlocks then
            break
        end
        a1.wallBlocks[v27 + 1].CFrame = u1
    end
    v28, v27 = false, v26
    while true do
        if v28 then
            v27 = v27 + 1
        else
            v28 = true
        end
        if v27 >= #a1.goalPads then
            break
        end
        a1.goalPads[v27 + 1].CFrame = u1
        a1.goalInners[v27 + 1].CFrame = u1
    end
end
u28.resetAttempt = function(a1)
    --[[
      name: resetAttempt
      line: 571
      upvalues:
        u24 (copy, index: 1)
    ]]
    a1.playerCell = a1.spec.player
    while #a1.boxes > 0 do
        local boxes_1 = a1.boxes
        boxes_1[#boxes_1] = nil
    end
    for _, value_1 in a1.spec.boxes do
        table.insert(a1.boxes, value_1)
    end
    a1.goalChain = 0
    a1.moves = 0
    a1.pushes = 0
    a1.undoStack:clear()
    a1.beat = "none"
    a1.moveAnimation = nil
    a1.bufferedDirection = nil
    a1.pendingDeadlockCell = -1
    a1.facing = u24
    a1.playerLift = 0
    a1.bumpAge = -1
    a1.bumpX = 0
    a1.bumpZ = 0
    a1.deadlockCrate = -1
    a1.deadlockAge = -1
    a1.completeAge = -1
    a1.goalPulseFired = 0
    for n_1 = 0, #a1.cratePopAge - 1 do
        a1.cratePopAge[n_1 + 1] = -1
    end
    for n_2 = 0, #a1.goalPads - 1 do
        a1:writeGoalPad(n_2, 1)
    end
    a1:writeAllCrates()
    a1.playerBase = a1:cellWorld(a1.playerCell)
    a1:writePlayer()
    a1:updateHearts()
    a1:updateUndoButton()
end
u28.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 610
      upvalues:
        boardDirectionForSwipe_upv_1 (copy, index: 1)
        SOKOBAN_CONFIG_upv_1 (copy, index: 2)
    ]]
    if a1:isRunning() and a1.beat == "none" then
        local v38 = boardDirectionForSwipe_upv_1(a2, SOKOBAN_CONFIG_upv_1.camera.lookDirection)
        if a1.moveAnimation == nil then
            a1:startMove(v38)
            return
        end
        a1.bufferedDirection = v38
        return nil
    end
    return nil
end
u28.startMove = function(a1, a2)
    --[[
      name: startMove
      line: 625
      upvalues:
        u23 (copy, index: 1)
        applyMove_upv_1 (copy, index: 5)
        SOKOBAN_CONFIG_upv_1 (copy, index: 6)
    ]]
    a1.facing = u23
    local v39 = applyMove_upv_1(a1.spec, a1.playerCell, a1.boxes, a2)
    if v39.kind ~= "blocked" then
        local tbl_5 = {}
        for key_1, v40 in a1.boxes do
            table.insert(tbl_5, v40)
        end
        a1.undoStack:push({player = a1.playerCell, boxes = tbl_5, goalChain = a1.goalChain, moves = a1.moves, pushes = a1.pushes})
        local v41 = a1:cellWorld(a1.playerCell)
        local v42 = a1:cellWorld(v39.player)
        a1.playerCell = v39.player
        a1.moves = a1.moves + 1
        if v39.kind ~= "stepped" then
            a1.pushes = a1.pushes + 1
            local v43 = a1.goalMask[v39.boxFrom + 1] == true
            local key_1 = a1.goalMask[v39.boxTo + 1] == true
            a1.boxes[v39.boxIndex + 1] = v39.boxTo
            a1.cratePopAge[v39.boxIndex + 1] = -1
            a1.context.audio.play("thud", {})
            a1.moveAnimation = {duration = SOKOBAN_CONFIG_upv_1.pushSeconds, playerFrom = v41, playerTo = v42, crateIndex = v39.boxIndex, crateFrom = a1:cellWorld(v39.boxFrom), crateTo = a1:cellWorld(v39.boxTo), enteredGoal = key_1, leftGoal = v43}
            local v40 = a1.engine:findDeadlock(a1.boxes)
            if v40 == nil then
                if a1.engine:isSolved(a1.boxes) then
                    a1.beat = "complete"
                end
            else
                a1.pendingDeadlockCell = v40
                a1.beat = "deadlock"
                a1.undoStack:clear()
            end
            a1:updateUndoButton()
        else
            a1.context.audio.play("hopStep", {})
            a1.moveAnimation = {duration = SOKOBAN_CONFIG_upv_1.stepSeconds, playerFrom = v41, playerTo = v42, crateFrom = v41, crateTo = v42}
            a1:updateUndoButton()
            return nil
        end
    else
        a1:beginBump(a2)
        return nil
    end
end
u28.finishMove = function(a1, a2)
    --[[
      name: finishMove
      line: 707
    ]]
    a1.playerBase = a2.playerTo
    a1.playerLift = 0
    a1:writePlayer()
    if a2.crateIndex >= 0 then
        local crateIndex_1 = a2.crateIndex
        a1.cratePositions[crateIndex_1 + 1] = a2.crateTo
        a1:applyCrateColor(crateIndex_1)
        a1:writeCrate(crateIndex_1, a2.crateTo, 1)
        if a2.enteredGoal then
            a1.cratePopAge[crateIndex_1 + 1] = 0
            a1.goalChain = math.min(a1.goalChain + 1, 8)
            a1.context.audio.play("metalClank", {pitch = 2 ^ ((a1.goalChain - 1) / 12)})
        elseif a2.leftGoal then
            a1.goalChain = 0
            a1.context.audio.play("thud", {})
        end
    end
    if a1.pendingDeadlockCell < 0 then
        local v44
        if a1.engine:isSolved(a1.boxes) then
            a1.bufferedDirection = nil
            a1:completeLevel()
            return nil
        end
        v44 = a1.bufferedDirection
        a1.bufferedDirection = nil
        if v44 ~= nil then
            a1:startMove(v44)
        end
    else
        local pendingDeadlockCell_1 = a1.pendingDeadlockCell
        a1.pendingDeadlockCell = -1
        a1.bufferedDirection = nil
        a1:onDeadlock(pendingDeadlockCell_1)
        return nil
    end
end
u28.beginBump = function(a1, a2)
    --[[
      name: beginBump
      line: 752
      upvalues:
        directionDeltaX_upv_1 (copy, index: 1)
        directionDeltaY_upv_1 (copy, index: 2)
    ]]
    a1.bumpAge = 0
    a1.bumpDeltaX = directionDeltaX_upv_1(a2)
    a1.bumpDeltaZ = directionDeltaY_upv_1(a2)
    a1.context.audio.play("thud", {})
    a1:writePlayer()
end
u28.performUndo = function(a1)
    --[[
      name: performUndo
      line: 765
    ]]
    if a1:isRunning() then
        local v45 = nil
        if a1.beat == "none" then
            v45 = a1.undoStack:pop()
            if v45 ~= nil then
                a1.moveAnimation = nil
                a1.bufferedDirection = nil
                a1.pendingDeadlockCell = -1
                a1.playerCell = v45.player
                while #a1.boxes > 0 do
                    local boxes_2 = a1.boxes
                    boxes_2[#boxes_2] = nil
                end
                for _, value_2 in v45.boxes do
                    table.insert(a1.boxes, value_2)
                end
                a1.goalChain = v45.goalChain
                a1.moves = v45.moves
                a1.pushes = v45.pushes
                for n_3 = 0, #a1.cratePopAge - 1 do
                    a1.cratePopAge[n_3 + 1] = -1
                end
                a1:writeAllCrates()
                a1.playerBase = a1:cellWorld(a1.playerCell)
                a1.playerLift = 0
                a1:writePlayer()
                a1.context.audio.play("uiBack", {})
                a1:updateUndoButton()
            else
                a1.context.audio.play("uiTap", {})
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u28.performManualReset = function(a1)
    --[[
      name: performManualReset
      line: 807
      upvalues:
        u22 (copy, index: 1)
        SOKOBAN_CONFIG_upv_1 (copy, index: 2)
    ]]
    if a1:isRunning() and a1.beat == "none" then
        if a1.moves ~= 0 then
            a1.beat = "reset"
            a1.resets = a1.resets + 1
            a1.lives = a1.lives - 1
            a1.moveAnimation = nil
            a1.bufferedDirection = nil
            a1.pendingDeadlockCell = -1
            a1:updateHearts()
            a1.context.audio.play("whoosh", {})
            a1.context.audio.play("thud", {})
            a1.popups:show(a1.stage.origin + Vector3.new(0, 7.199999809265137, 0), "RESET \194\183 \226\136\1461 LIFE", u22, 1)
            if a1.lives > 0 then
                local roundToken_upv_1 = a1.roundToken
                task.delay(
                    SOKOBAN_CONFIG_upv_1.manualResetDelaySeconds,
                    function()
                        --[[
                          line: 844
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
                return
            end
            a1:endRunNow()
        else
            a1.context.audio.play("uiTap", {})
        end
        return nil
    end
    return nil
end
u28.onDeadlock = function(a1, a2)
    --[[
      name: onDeadlock
      line: 851
      upvalues:
        u22 (copy, index: 1)
        SOKOBAN_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.beat = "deadlock"
    a1.deadlocks = a1.deadlocks + 1
    a1.deadlockCrate = a1:crateIndexAt(a2)
    a1.deadlockAge = ((a1.deadlockCrate < 0) and -1) or 0
    a1.lives = a1.lives - 1
    a1:updateHearts()
    a1.context.audio.play("thud", {})
    a1.context.audio.play("buzz", {})
    a1.popups:show(a1.stage.origin + Vector3.new(0, 7.199999809265137, 0), "DEADLOCK!", u22, 1.2)
    if a1.lives > 0 then
        local roundToken_upv_2 = a1.roundToken
        task.delay(
            SOKOBAN_CONFIG_upv_1.deadlockResetDelaySeconds,
            function()
                --[[
                  line: 875
                  upvalues:
                    roundToken_upv_2 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                if roundToken_upv_2 == a1.roundToken then
                    a1:resetAttempt()
                else
                    return nil
                end
            end
        )
    else
        a1:endRunNow()
        return nil
    end
end
u28.completeLevel = function(a1)
    --[[
      name: completeLevel
      line: 882
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
        u20 (copy, index: 2)
    ]]
    a1.beat = "complete"
    a1.context.reportScore(a1.level)
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("whoosh", {})
    a1.completeAge = 0
    a1.goalPulseFired = 0
    local level_upv_1 = a1.level
    a1.level = a1.level + 1
    local roundToken_upv_3 = a1.roundToken
    task.delay(
        SOKOBAN_CONFIG_upv_1.levelCompletePopupSeconds,
        function()
            --[[
              line: 899
              upvalues:
                roundToken_upv_3 (copy, index: 1)
                a1 (copy, index: 2)
                level_upv_1 (copy, index: 3)
                u20 (copy, index: 4)
            ]]
            if roundToken_upv_3 == a1.roundToken then
                a1.popups:show(a1.stage.origin + Vector3.new(0, 7.599999904632568, 0), ("LEVEL %*"):format(level_upv_1), u20, 1.3)
            else
                return nil
            end
        end
    )
    task.delay(
        SOKOBAN_CONFIG_upv_1.nextLevelDelaySeconds,
        function()
            --[[
              line: 908
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
u28.endRunNow = function(a1)
    --[[
      name: endRunNow
      line: 915
      upvalues:
        u22 (copy, index: 1)
        SOKOBAN_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1:setRunning(false)
    a1.popups:show(a1.stage.origin + Vector3.new(0, 4.800000190734863, 0), "OUT OF LIVES!", u22, 1.1)
    local roundToken_upv_4 = a1.roundToken
    local u29 = a1.level - 1
    task.delay(
        SOKOBAN_CONFIG_upv_1.endRunDelaySeconds,
        function()
            --[[
              line: 923
              upvalues:
                roundToken_upv_4 (copy, index: 1)
                a1 (copy, index: 2)
                u29 (copy, index: 3)
            ]]
            if roundToken_upv_4 == a1.roundToken then
                a1.context.endRun(u29)
            else
                return nil
            end
        end
    )
end
u28.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 930
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
        u8 (copy, index: 2)
        u12 (copy, index: 3)
        u10 (copy, index: 4)
    ]]
    local moveAnimation_1 = a1.moveAnimation
    if moveAnimation_1 ~= nil then
        moveAnimation_1.age = moveAnimation_1.age + a2
        local v46 = math.min(moveAnimation_1.age / moveAnimation_1.duration, 1)
        local v47 = v46 * v46 * (3 - (v46 * 2))
        a1.playerBase = moveAnimation_1.playerFrom:Lerp(moveAnimation_1.playerTo, v47)
        a1.playerLift = math.sin(math.pi * v46) * SOKOBAN_CONFIG_upv_1.stepBobStuds
        a1:writePlayer()
        if moveAnimation_1.crateIndex >= 0 then
            a1:writeCrate(moveAnimation_1.crateIndex, moveAnimation_1.crateFrom:Lerp(moveAnimation_1.crateTo, v47), 1)
        end
        if moveAnimation_1.duration <= moveAnimation_1.age then
            a1.moveAnimation = nil
            a1:finishMove(moveAnimation_1)
        end
    end
    if a1.bumpAge >= 0 then
        a1.bumpAge = a1.bumpAge + a2
        local v48 = math.sin(math.pi * math.min(a1.bumpAge / SOKOBAN_CONFIG_upv_1.bumpSeconds, 1)) * SOKOBAN_CONFIG_upv_1.bumpStuds
        a1.bumpX = a1.bumpDeltaX * v48
        a1.bumpZ = a1.bumpDeltaZ * v48
        if SOKOBAN_CONFIG_upv_1.bumpSeconds <= a1.bumpAge then
            a1.bumpAge = -1
            a1.bumpX = 0
            a1.bumpZ = 0
        end
        a1:writePlayer()
    end
    for v49 = 0, #a1.boxes - 1 do
        local v50
        v50 = a1.cratePopAge[v49 + 1]
        local v51
        if v50 < 0 then
            continue
        end
        v51 = v50 + a2
        if SOKOBAN_CONFIG_upv_1.goalPopSeconds > v51 then
            a1.cratePopAge[v49 + 1] = v51
            a1:writeCrate(v49, a1.cratePositions[v49 + 1], 1 + (SOKOBAN_CONFIG_upv_1.goalPopScale * math.sin(math.pi * (v51 / SOKOBAN_CONFIG_upv_1.goalPopSeconds))))
        else
            a1.cratePopAge[v49 + 1] = -1
            a1:writeCrate(v49, a1.cratePositions[v49 + 1], 1)
        end
    end
    if a1.deadlockAge >= 0 and a1.deadlockCrate >= 0 and a1.deadlockCrate < #a1.crateBodies then
        a1.deadlockAge = a1.deadlockAge + a2
        local deadlockCrate_1 = a1.deadlockCrate
        if SOKOBAN_CONFIG_upv_1.deadlockFlashSeconds > a1.deadlockAge then
            local v52 = math.sin(a1.deadlockAge * 26) * 0.5 + 0.5
            a1.crateBodies[deadlockCrate_1 + 1].Color = u8:Lerp(u12, v52)
            a1.crateStraps[deadlockCrate_1 + 1].Color = u10:Lerp(u12, v52)
        else
            a1.deadlockAge = -1
            a1:applyCrateColor(deadlockCrate_1)
        end
    end
    if a1.completeAge >= 0 then
        a1.completeAge = a1.completeAge + a2
        local v53 = math.min(#a1.spec.goals, #a1.goalPads)
        while a1.goalPulseFired < v53 and a1.goalPulseFired * SOKOBAN_CONFIG_upv_1.goalPulseStaggerSeconds <= a1.completeAge do
            a1.context.audio.play("coinTick", {pitch = 1 + (a1.goalPulseFired * 0.09)})
            a1.goalPulseFired = a1.goalPulseFired + 1
        end
        local v54 = 0
        local v55 = false
        local v56
        v56 = v54
        if v55 then
            v56 = v56 + 1
        else
            v55 = true
        end
        local v57 = nil
        local v49 = nil
        while v56 < v53 do
            v57 = (a1.completeAge - (v56 * SOKOBAN_CONFIG_upv_1.goalPulseStaggerSeconds)) / SOKOBAN_CONFIG_upv_1.goalPulseSeconds
            if v57 < 0 or v57 > 1 then
                v49 = 1
            else
                v49 = math.sin(math.pi * v57) * 0.4 + 1
            end
            a1:writeGoalPad(v56, v49)
            if v55 then
                v56 = v56 + 1
            else
                v55 = true
            end
        end
        if (v53 * SOKOBAN_CONFIG_upv_1.goalPulseStaggerSeconds) + SOKOBAN_CONFIG_upv_1.goalPulseSeconds > a1.completeAge then
            return
        end
        a1.completeAge = -1
        v57, v49 = false, 0
        while true do
            if v57 then
                v49 = v49 + 1
            else
                v57 = true
            end
            if v49 >= v53 then
                break
            end
            a1:writeGoalPad(v49, 1)
        end
    end
end
u28.cellWorld = function(a1, a2)
    --[[
      name: cellWorld
      line: 1035
      upvalues:
        keyX_upv_1 (copy, index: 1)
        keyY_upv_1 (copy, index: 2)
    ]]
    return a1.picker:cellWorld(keyX_upv_1(a1.spec.width, a2), keyY_upv_1(a1.spec.width, a2))
end
u28.writePlayer = function(a1)
    --[[
      name: writePlayer
      line: 1038
    ]]
    a1.playerModel:PivotTo(CFrame.new(a1.playerBase.X + a1.bumpX, a1.playerBase.Y + a1.playerLift, a1.playerBase.Z + a1.bumpZ) * a1.facing)
end
u28.writeCrate = function(a1, a2, a3, a4)
    --[[
      name: writeCrate
      line: 1044
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v58 = SOKOBAN_CONFIG_upv_1.crateSize * a4
    local v59 = a1.crateBodies[a2 + 1]
    v59.Size = Vector3.new(v58, v58, v58)
    v59.CFrame = CFrame.new(a3.X, a3.Y + (v58 / 2), a3.Z)
    local v60 = a1.crateStraps[a2 + 1]
    v60.Size = Vector3.new(v58 + 0.06, SOKOBAN_CONFIG_upv_1.crateStrapHeight * a4, v58 + 0.06)
    v60.CFrame = CFrame.new(a3.X, a3.Y + (v58 * 0.34), a3.Z)
end
u28.writeAllCrates = function(a1)
    --[[
      name: writeAllCrates
      line: 1053
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_4 = 0, #a1.crateBodies - 1 do
        if #a1.boxes > n_4 then
            local v61 = a1:cellWorld(a1.boxes[n_4 + 1])
            a1.cratePositions[n_4 + 1] = v61
            a1:applyCrateColor(n_4)
            a1:writeCrate(n_4, v61, 1)
        else
            a1.crateBodies[n_4 + 1].CFrame = u1
            a1.crateStraps[n_4 + 1].CFrame = u1
        end
    end
end
u28.applyCrateColor = function(a1, a2)
    --[[
      name: applyCrateColor
      line: 1066
      upvalues:
        u9 (copy, index: 1)
        u8 (copy, index: 2)
        u11 (copy, index: 3)
        u10 (copy, index: 4)
    ]]
    local v62 = a1.goalMask[a1.boxes[a2 + 1] + 1] == true
    local v63 = a1.crateBodies[a2 + 1]
    local v64
    if v62 then
        v64 = u9
    else
        v64 = u8
    end
    v63.Color = v64
    local v65 = a1.crateStraps[a2 + 1]
    if v62 then
        v64 = u11
    else
        v64 = u10
    end
    v65.Color = v64
end
u28.writeGoalPad = function(a1, a2, a3)
    --[[
      name: writeGoalPad
      line: 1071
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v66 = SOKOBAN_CONFIG_upv_1.goalInnerSize * a3
    a1.goalInners[a2 + 1].Size = Vector3.new(v66, 0.16, v66)
end
u28.crateIndexAt = function(a1, a2)
    --[[
      name: crateIndexAt
      line: 1075
    ]]
    for n_5 = 0, #a1.boxes - 1 do
        if a1.boxes[n_5 + 1] ~= a2 then
            continue
        end
        return n_5
    end
    return -1
end
u28.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 1083
      upvalues:
        SOKOBAN_CONFIG_upv_1 (copy, index: 1)
        u18 (copy, index: 2)
        u19 (copy, index: 3)
        u27 (copy, index: 4)
    ]]
    local v67 = a1.picker:cellWorld(0, 0) + Vector3.new(-SOKOBAN_CONFIG_upv_1.cellPitch * 0.6, 4.4, -SOKOBAN_CONFIG_upv_1.cellPitch * 0.9)
    local v68 = nil
    for n_6 = 0, #a1.heartParts - 1 do
        local v69 = a1.heartParts[n_6 + 1]
        local v70 = n_6 < a1.lives
        if v70 then
            v68 = u18
        else
            v68 = u19
        end
        v69.Color = v68
        v69.Transparency = (v70 and 0) or 0.45
        v69.CFrame = CFrame.new(v67 + Vector3.new(n_6 * 1.75, 0, 0)) * u27
    end
end
u28.updateUndoButton = function(a1)
    --[[
      name: updateUndoButton
      line: 1096
    ]]
    local undoButton_1 = a1.undoButton
    local v71 = a1.undoStack:size() > 0
    undoButton_1:setEnabled(v71)
end
local tbl_6 = {}
tbl_6.SokobanGame = u28
return tbl_6