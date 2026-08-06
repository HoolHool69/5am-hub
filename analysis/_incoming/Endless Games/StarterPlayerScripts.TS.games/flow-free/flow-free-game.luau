-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardGestures_upv_1 = v1.BoardGestures
local BoardPicker_upv_1 = v1.BoardPicker
local IsoBoardCamera_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "iso-board-camera").IsoBoardCamera
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local TouchControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "touch-button").TouchControls
local FLOW_FREE_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "flow-free-config").FLOW_FREE_CONFIG
local generateLevel_upv_1 = RuntimeLib_1.import(script, script.Parent, "flow-free-levels").generateLevel
local v3 = RuntimeLib_1.import(script, script.Parent, "flow-free-sim")
local cellKey_upv_1 = v3.cellKey
local connectedPairCount_upv_1 = v3.connectedPairCount
local coveredCellCount_upv_1 = v3.coveredCellCount
local endpointColorAt_upv_1 = v3.endpointColorAt
local freshBoard_upv_1 = v3.freshBoard
local grabAt_upv_1 = v3.grabAt
local isComplete_upv_1 = v3.isComplete
local keyColumn_upv_1 = v3.keyColumn
local keyRow_upv_1 = v3.keyRow
local pathColorAt_upv_1 = v3.pathColorAt
local stepPath_upv_1 = v3.stepPath
local u1 = CFrame.new(0, -1000, 0)
local u2 = FLOW_FREE_CONFIG_upv_1.maxBoardSize * FLOW_FREE_CONFIG_upv_1.maxBoardSize
local u3 = u2 * 2
local u4 = FLOW_FREE_CONFIG_upv_1.maxColors * 2
local u5 = FLOW_FREE_CONFIG_upv_1.cellPitch * FLOW_FREE_CONFIG_upv_1.pipeWidthFraction
local u6 = FLOW_FREE_CONFIG_upv_1.cellPitch * FLOW_FREE_CONFIG_upv_1.endpointDiameterFraction
local u7 = CFrame.Angles(0, 0, 1.5707963267948966)
local tbl_upv_1 = {}
local u8 = Color3.fromRGB(17, 19, 28)
local u9 = Color3.fromRGB(28, 31, 44)
local u10 = Color3.fromRGB(38, 42, 58)
local u11 = Color3.fromRGB(44, 48, 66)
local _ = Color3.fromRGB(214, 216, 224)
local u12 = Color3.fromRGB(192, 195, 206)
local u13 = Color3.fromRGB(58, 124, 236)
local u14 = Color3.fromRGB(48, 54, 74)
local u15 = Color3.fromRGB(255, 216, 102)
local u16 = Color3.fromRGB(245, 245, 255)
local u17 = Color3.fromRGB(255, 92, 80)
local u18 = Color3.fromRGB(228, 232, 245)
local tbl_upv_2 = {}
tbl_upv_2.background = Color3.fromRGB(58, 62, 84)
tbl_upv_2.stroke = Color3.fromRGB(146, 156, 186)
tbl_upv_2.text = Color3.fromRGB(238, 242, 252)
local tbl_upv_3 = {Color3.fromRGB(226, 58, 52), Color3.fromRGB(48, 104, 220), Color3.fromRGB(244, 202, 54), Color3.fromRGB(30, 132, 122), Color3.fromRGB(240, 132, 40), Color3.fromRGB(140, 208, 96), Color3.fromRGB(120, 62, 176), Color3.fromRGB(96, 214, 224), Color3.fromRGB(214, 72, 172), Color3.fromRGB(38, 52, 108), Color3.fromRGB(238, 232, 214), Color3.fromRGB(128, 86, 52), Color3.fromRGB(246, 154, 178), Color3.fromRGB(46, 154, 62)}
local u19 = table.create(#tbl_upv_3)
for key_1, value_1 in tbl_upv_3 do
    u19[key_1] = value_1:Lerp(Color3.new(1, 1, 1), 0.55)
end
local tbl_upv_4 = {0.75, 0.84, 0.94, 1.12, 1.26, 1.5, 1.68, 1.89, 2.24, 2.52}
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 118
    ]]
    return "FlowFreeGame"
end
tbl_6.__index = BaseWorldGame_upv_1
local u20 = setmetatable(tbl_5, tbl_6)
u20.__index = u20
u20.new = function(...)
    --[[
      name: new
      line: 124
      upvalues:
        u20 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u20)
    return v4:constructor(...) or v4
end
u20.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 128
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = FLOW_FREE_CONFIG_upv_1.livesPerRun
    a1.resets = 0
    a1.draws = 0
    a1.budget = 0
    a1.columns = 5
    a1.rows = 5
    a1.roundToken = 0
    a1.sweepAge = -1
    a1.sweepRestored = true
    a1.resetPending = false
    a1.dragChanged = false
    a1.highlightCell = -1
    a1.tilePlates = {}
    a1.pipeNodes = {}
    a1.pipeLinks = {}
    a1.endpointCaps = {}
    a1.heartParts = {}
    a1.cellOwner = {}
    a1.cellPathIndex = {}
    a1.cellSweepT = {}
    a1.linkSweepT = {}
    a1.nodeLit = {}
    a1.linkLit = {}
    a1.linkShown = {}
end
u20.buildScene = function(a1)
    --[[
      name: buildScene
      line: 156
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u8 (copy, index: 2)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 3)
        u10 (copy, index: 4)
        u9 (copy, index: 5)
        makeStagePart_upv_1 (copy, index: 6)
        u11 (copy, index: 7)
        u1 (copy, index: 8)
        u2 (copy, index: 9)
        u5 (copy, index: 10)
        u3 (copy, index: 11)
        u4 (copy, index: 12)
        u6 (copy, index: 13)
        u13 (copy, index: 14)
        u18 (copy, index: 15)
        PopupTextPool_upv_1 (copy, index: 16)
        BoardPicker_upv_1 (copy, index: 17)
        IsoBoardCamera_upv_1 (copy, index: 18)
        BoardGestures_upv_1 (copy, index: 19)
        TouchControls_upv_1 (copy, index: 20)
        tbl_upv_2 (copy, index: 21)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    local v5 = makeSmoothPart_upv_1(container_1)
    v5.Material = Enum.Material.SmoothPlastic
    v5.Size = Vector3.new(600, 1, 600)
    v5.Color = u8
    v5.CFrame = CFrame.new(origin_1 + Vector3.new(0, -14, 0))
    local Unit_1 = Vector3.new(FLOW_FREE_CONFIG_upv_1.camera.lookDirection.X, 0, FLOW_FREE_CONFIG_upv_1.camera.lookDirection.Z).Unit
    local v6 = makeSmoothPart_upv_1(container_1)
    v6.Material = Enum.Material.SmoothPlastic
    v6.Size = Vector3.new(700, 60, 1)
    v6.Color = u10
    v6.CFrame = CFrame.lookAt((origin_1 + (Unit_1 * 88)) + Vector3.new(0, 8, 0), (origin_1 + (Unit_1 * 89)) + Vector3.new(0, 8, 0))
    local v7 = makeSmoothPart_upv_1(container_1)
    v7.Material = Enum.Material.SmoothPlastic
    v7.Size = Vector3.new(700, 300, 1)
    v7.Color = u9
    v7.CFrame = CFrame.lookAt(origin_1 + (Unit_1 * 112), origin_1 + (Unit_1 * 113))
    a1.boardFrame = makeStagePart_upv_1(container_1)
    a1.boardFrame.Color = u11
    a1.boardFrame.CFrame = u1
    local v8 = 0
    local v9 = false
    while true do
        if v9 then
            v8 = v8 + 1
        else
            v9 = true
        end
        if v8 >= u2 then
            break
        end
        local v10 = makeStagePart_upv_1(container_1)
        v10.Size = Vector3.new(FLOW_FREE_CONFIG_upv_1.tileSize, FLOW_FREE_CONFIG_upv_1.tileThickness, FLOW_FREE_CONFIG_upv_1.tileSize)
        v10.CFrame = u1
        table.insert(a1.tilePlates, v10)
        local v11 = makeSmoothPart_upv_1(container_1)
        v11.Shape = Enum.PartType.Cylinder
        v11.Size = Vector3.new(FLOW_FREE_CONFIG_upv_1.pipeHeight, u5, u5)
        v11.CFrame = u1
        v11.Transparency = 1
        table.insert(a1.pipeNodes, v11)
        table.insert(a1.cellOwner, -1)
        table.insert(a1.cellPathIndex, 0)
        table.insert(a1.cellSweepT, 0)
        table.insert(a1.nodeLit, false)
    end
    v9, v8 = false, 0
    if v9 then
        v8 = v8 + 1
    else
        v9 = true
    end
    if v8 < u3 then
        local v12 = makeSmoothPart_upv_1(container_1)
        local v13
        if v8 % 2 ~= 0 then
            v13 = Vector3.new(u5, FLOW_FREE_CONFIG_upv_1.pipeHeight, FLOW_FREE_CONFIG_upv_1.cellPitch)
        else
            v13 = Vector3.new(FLOW_FREE_CONFIG_upv_1.cellPitch, FLOW_FREE_CONFIG_upv_1.pipeHeight, u5)
        end
        v12.Size = v13
        v12.CFrame = u1
        v12.Transparency = 1
        table.insert(a1.pipeLinks, v12)
        table.insert(a1.linkSweepT, 0)
        table.insert(a1.linkLit, false)
        table.insert(a1.linkShown, false)
        if v9 then
            v8 = v8 + 1
        else
            v9 = true
        end
        --[[ goto label_7 ]]--
    end
    v9, v8 = false, 0
    while true do
        if v9 then
            v8 = v8 + 1
        else
            v9 = true
        end
        if v8 >= u4 then
            break
        end
        local v14 = makeSmoothPart_upv_1(container_1)
        v14.Shape = Enum.PartType.Cylinder
        v14.Size = Vector3.new(FLOW_FREE_CONFIG_upv_1.endpointHeight, u6, u6)
        v14.CFrame = u1
        table.insert(a1.endpointCaps, v14)
    end
    for _ = 0, FLOW_FREE_CONFIG_upv_1.livesPerRun - 1 do
        local v15 = makeStagePart_upv_1(container_1)
        v15.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 1.2000000476837158)
        v15.Color = u13
        v15.CFrame = u1
        table.insert(a1.heartParts, v15)
    end
    a1.hudPart = Instance.new("Part")
    a1.hudPart.Anchored = true
    a1.hudPart.CanCollide = false
    a1.hudPart.CanQuery = false
    a1.hudPart.CanTouch = false
    a1.hudPart.Transparency = 1
    a1.hudPart.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.hudPart.CFrame = u1
    a1.hudPart.Parent = container_1
    v8 = Instance.new("BillboardGui")
    v8.Size = UDim2.fromScale(24, 2.2)
    v8.AlwaysOnTop = true
    v8.Parent = a1.hudPart
    a1.statsLabel = Instance.new("TextLabel")
    a1.statsLabel.BackgroundTransparency = 1
    a1.statsLabel.Size = UDim2.fromScale(1, 1)
    a1.statsLabel.Font = Enum.Font.GothamBlack
    a1.statsLabel.TextScaled = true
    a1.statsLabel.RichText = true
    a1.statsLabel.TextColor3 = u18
    a1.statsLabel.TextStrokeTransparency = 0.5
    a1.statsLabel.Parent = v8
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    a1.picker = BoardPicker_upv_1.new(a1.stage, {columns = a1.columns, rows = a1.rows, cellPitch = FLOW_FREE_CONFIG_upv_1.cellPitch})
    a1.boardCamera = IsoBoardCamera_upv_1.new(a1.stage, FLOW_FREE_CONFIG_upv_1.camera)
    local tbl_7 = {}
    local tbl_8 = {}
    tbl_8.onCellTap = function(a2)
        --[[
          name: onCellTap
          line: 319
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellTap(a2)
    end
    tbl_8.onPathBegan = function(a3)
        --[[
          name: onPathBegan
          line: 322
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathBegan(a3)
    end
    tbl_8.onPathEnter = function(a4)
        --[[
          name: onPathEnter
          line: 325
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathEnter(a4)
    end
    tbl_8.onPathEnded = function()
        --[[
          name: onPathEnded
          line: 328
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathEnded()
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, tbl_7, tbl_8)
    a1.controls = TouchControls_upv_1.new({})
    a1.context.janitor:Add(a1.controls, "destroy")
    local function onActivated_1()
        --[[
          name: onActivated
          line: 344
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.context.requestStart()
        a1:onResetPressed()
    end
    a1.controls:addButton({anchorPoint = Vector2.new(1, 1), position = UDim2.new(1, -14, 1, -14), look = tbl_upv_2, onActivated = onActivated_1})
end
u20.resetRound = function(a1)
    --[[
      name: resetRound
      line: 350
      upvalues:
        FLOW_FREE_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = FLOW_FREE_CONFIG_upv_1.livesPerRun
    a1.resets = 0
    a1.sweepAge = -1
    a1.resetPending = false
    a1:loadLevel()
    a1.context.reportScore(0)
end
u20.fixedUpdate = function(a1)
    --[[
      name: fixedUpdate
      line: 360
    ]]
end
u20.render = function(a1, a2)
    --[[
      name: render
      line: 363
    ]]
    a1.boardCamera:update()
    a1:advanceAnimations(a2)
end
u20.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 367
    ]]
    a1.boardCamera:update()
    a1:advanceAnimations(a2)
end
u20.revive = function(a1)
    --[[
      name: revive
      line: 371
      upvalues:
        FLOW_FREE_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = FLOW_FREE_CONFIG_upv_1.livesPerRun
    a1.sweepAge = -1
    a1.resetPending = false
    a1:resetAttempt()
    a1:updateHearts()
    a1:setRunning(true)
end
u20.captureRound = function(a1)
    --[[
      name: captureRound
      line: 380
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u20.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 386
      upvalues:
        FLOW_FREE_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v16 = string.split(a2.state, "|")
    if #v16 == 3 then
        local v17 = nil
        if v16[1] == "1" then
            v17 = tonumber(v16[2])
            local num_1 = tonumber(v16[3])
            if v17 ~= nil and num_1 ~= nil and v17 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v17)
                a1.lives = math.clamp(math.floor(num_1), 1, FLOW_FREE_CONFIG_upv_1.livesPerRun)
                a1:loadLevel()
                a1.context.reportScore(a2.score)
                return true
            end
            return false
        end
    end
    return false
end
u20.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 403
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        freshBoard_upv_1 (copy, index: 2)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 3)
        u15 (copy, index: 4)
        u16 (copy, index: 5)
    ]]
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    a1.spec = a1.generated.spec
    a1.columns = a1.spec.columns
    a1.rows = a1.spec.rows
    a1.board = freshBoard_upv_1(a1.spec)
    a1.draws = 0
    a1.budget = a1.generated.drawBudget
    a1.sweepAge = -1
    a1.sweepRestored = true
    a1.resetPending = false
    a1.activeColor = nil
    a1.dragChanged = false
    a1.highlightCell = -1
    a1.gestures:cancel()
    a1.picker:setSpec({columns = a1.columns, rows = a1.rows, cellPitch = FLOW_FREE_CONFIG_upv_1.cellPitch})
    a1.boardCamera:setBoardExtent(math.max(a1.columns, a1.rows) * FLOW_FREE_CONFIG_upv_1.cellPitch)
    a1:dressBoard()
    a1:syncPipes()
    a1:updateHearts()
    a1:updateHud()
    local origin_2 = a1.stage.origin
    a1.popups:show(origin_2 + Vector3.new(0, 7, 0), ("LEVEL %*"):format(a1.level), u15, 1.3)
    a1.popups:show(origin_2 + Vector3.new(0, 4.599999904632568, 0), ("%* FLOWS"):format(a1.generated.par), u16, 0.75)
end
u20.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 437
      upvalues:
        u2 (copy, index: 1)
        u1 (copy, index: 2)
        u12 (copy, index: 4)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 5)
        u7 (copy, index: 6)
        tbl_upv_3 (copy, index: 7)
        u4 (copy, index: 8)
    ]]
    local columns_1 = a1.columns
    local rows_1 = a1.rows
    local origin_3 = a1.stage.origin
    local v18 = 0
    local v19 = false
    if v19 then
        v18 = v18 + 1
    else
        v19 = true
    end
    local v20, v21 = nil, nil
    local v31 = nil
    if v18 < u2 then
        v31 = a1.tilePlates[v18 + 1]
        local v23 = a1.pipeNodes[v18 + 1]
        local v24 = a1.pipeLinks[(v18 * 2) + 1]
        local v25 = a1.pipeLinks[(v18 * 2) + 2]
        if columns_1 * rows_1 > v18 then
            v20 = v18 % columns_1
            v21 = math.floor(v18 / columns_1)
            local v26 = a1.picker:cellWorld(v20, v21)
            v31.Color = u12
            v31.CFrame = CFrame.new(v26 + Vector3.new(0, -FLOW_FREE_CONFIG_upv_1.tileThickness / 2, 0))
            v23.CFrame = CFrame.new(v26 + Vector3.new(0, FLOW_FREE_CONFIG_upv_1.pipeHeight / 2, 0)) * u7
            local v27
            if v20 >= columns_1 - 1 then
                v27 = u1
            else
                v27 = CFrame.new(v26 + Vector3.new(FLOW_FREE_CONFIG_upv_1.cellPitch / 2, FLOW_FREE_CONFIG_upv_1.pipeHeight / 2, 0))
            end
            v24.CFrame = v27
            local v28
            if v21 >= rows_1 - 1 then
                v28 = u1
            else
                v28 = CFrame.new(v26 + Vector3.new(0, FLOW_FREE_CONFIG_upv_1.pipeHeight / 2, FLOW_FREE_CONFIG_upv_1.cellPitch / 2))
            end
            v25.CFrame = v28
        else
            v31.CFrame = u1
            v23.CFrame = u1
            v23.Transparency = 1
            v24.CFrame = u1
            v24.Transparency = 1
            a1.linkShown[(v18 * 2) + 1] = false
            v25.CFrame = u1
            v25.Transparency = 1
            a1.linkShown[(v18 * 2) + 2] = false
        end
        if v19 then
            v18 = v18 + 1
        else
            v19 = true
        end
        --[[ goto label_3 ]]--
    end
    v18 = 0
    for n_1 = 0, #a1.spec.endpoints - 1 do
        local v29 = a1.spec.endpoints[n_1 + 1]
        local v30 = tbl_upv_3[(n_1 % #tbl_upv_3) + 1]
        v18 = a1:placeEndpointCap(a1:placeEndpointCap(v18, v29.a, v30), v29.b, v30)
    end
    v31, v19 = false, v18
    while true do
        if v31 then
            v19 = v19 + 1
        else
            v31 = true
        end
        local v32
        if v19 >= u4 then
            break
        end
        a1.endpointCaps[v19 + 1].CFrame = u1
    end
    local v32 = rows_1 * FLOW_FREE_CONFIG_upv_1.cellPitch / 2
    a1.boardFrame.Size = Vector3.new((columns_1 * FLOW_FREE_CONFIG_upv_1.cellPitch) + 1.6, 0.9, (rows_1 * FLOW_FREE_CONFIG_upv_1.cellPitch) + 1.6)
    a1.boardFrame.CFrame = CFrame.new(origin_3 + Vector3.new(0, -FLOW_FREE_CONFIG_upv_1.tileThickness - 0.45, 0))
    a1.hudPart.CFrame = CFrame.new(origin_3 + Vector3.new(0, FLOW_FREE_CONFIG_upv_1.hudLiftStuds, v32 + FLOW_FREE_CONFIG_upv_1.hudDepthPadStuds))
    for n_2 = 0, #a1.heartParts - 1 do
        a1.heartParts[n_2 + 1].CFrame = CFrame.new(origin_3 + Vector3.new((n_2 - (#a1.heartParts - 1) / 2) * FLOW_FREE_CONFIG_upv_1.heartSpacingStuds, FLOW_FREE_CONFIG_upv_1.heartLiftStuds, -v32 - FLOW_FREE_CONFIG_upv_1.heartPadStuds)) * CFrame.Angles(0, 0.6108652381980153, 0)
    end
end
u20.placeEndpointCap = function(a1, a2, a3, a4)
    --[[
      name: placeEndpointCap
      line: 535
      upvalues:
        u4 (copy, index: 1)
        keyColumn_upv_1 (copy, index: 2)
        keyRow_upv_1 (copy, index: 3)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 4)
        u7 (copy, index: 5)
    ]]
    if u4 > a2 then
        local v33 = a1.endpointCaps[a2 + 1]
        local v34 = a1.picker:cellWorld(keyColumn_upv_1(a1.columns, a3), keyRow_upv_1(a1.columns, a3))
        v33.Color = a4
        v33.CFrame = CFrame.new(v34 + Vector3.new(0, FLOW_FREE_CONFIG_upv_1.endpointHeight / 2, 0)) * u7
        return a2 + 1
    end
    return a2
end
u20.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 546
      upvalues:
        u13 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    local v35 = nil
    for n_3 = 0, #a1.heartParts - 1 do
        local v36 = n_3 < a1.lives
        local v37 = a1.heartParts[n_3 + 1]
        if v36 then
            v35 = u13
        else
            v35 = u14
        end
        v37.Color = v35
        a1.heartParts[n_3 + 1].Transparency = (v36 and 0) or 0.45
    end
end
u20.updateHud = function(a1)
    --[[
      name: updateHud
      line: 553
      upvalues:
        connectedPairCount_upv_1 (copy, index: 1)
        coveredCellCount_upv_1 (copy, index: 2)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v38 = a1.columns * a1.rows
    local v39 = connectedPairCount_upv_1(a1.spec, a1.board)
    local v40 = coveredCellCount_upv_1(a1.spec, a1.board)
    local v41 = a1.budget - a1.draws
    local v42 = ("DRAWS %*/%*"):format(a1.draws, a1.budget)
    local v43
    if v41 >= 0 then
        if v41 > FLOW_FREE_CONFIG_upv_1.drawsWarnRemaining then
            v43 = v42
        else
            v43 = ("<font color=\"#ffaa4a\">%*</font>"):format(v42)
        end
    else
        v43 = ("<font color=\"#ff5c50\">%*</font>"):format(v42)
    end
    a1.statsLabel.Text = ("%*  \194\183  %*  \194\183  %*"):format(("FLOWS %*/%*"):format(v39, #a1.spec.endpoints), ("PIPE %*%%"):format(math.floor((v40 / v38) * 100)), v43)
end
u20.syncPipes = function(a1)
    --[[
      name: syncPipes
      line: 566
      upvalues:
        tbl_upv_3 (copy, index: 1)
        u19 (copy, index: 2)
    ]]
    local columns_2 = a1.columns
    local v44 = columns_2 * a1.rows
    local paths_1 = 0
    local v45 = false
    v45, paths_1 = v45, paths_1
    while true do
        if v45 then
            paths_1 = paths_1 + 1
        else
            v45 = true
        end
        if paths_1 >= v44 then
            break
        end
        a1.cellOwner[paths_1 + 1] = -1
        a1.cellPathIndex[paths_1 + 1] = 0
        a1.cellSweepT[paths_1 + 1] = 0
    end
    paths_1 = a1.board.paths
    for n_4 = 0, #paths_1 - 1 do
        local v46 = paths_1[n_4 + 1]
        local v47 = math.max(#v46 - 1, 1)
        for n_5 = 0, #v46 - 1 do
            local v48 = v46[n_5 + 1]
            a1.cellOwner[v48 + 1] = n_4
            a1.cellPathIndex[v48 + 1] = n_5
            a1.cellSweepT[v48 + 1] = n_5 / v47
        end
    end
    local v49
    v49, v45 = false, 0
    if v49 then
        v45 = v45 + 1
    else
        v49 = true
    end
    local v50 = nil
    if v45 < v44 then
        v50 = a1.cellOwner[v45 + 1]
        local v51 = a1.pipeNodes[v45 + 1]
        a1.nodeLit[v45 + 1] = false
        if v50 >= 0 then
            v51.Transparency = 0
            v51.Color = tbl_upv_3[(v50 % #tbl_upv_3) + 1]
        else
            v51.Transparency = 1
        end
        if v49 then
            v45 = v45 + 1
        else
            v49 = true
        end
        --[[ goto label_13 ]]--
    end
    v49, v45 = false, 0
    while true do
        if v49 then
            v45 = v45 + 1
        else
            v49 = true
        end
        if v45 >= v44 then
            break
        end
        local v52 = math.floor(v45 / columns_2)
        a1:writeLink(v45 * 2, v45, ((v45 % columns_2 >= columns_2 - 1) and -1) or (v45 + 1))
        a1:writeLink((v45 * 2) + 1, v45, ((v52 >= a1.rows - 1) and -1) or (v45 + columns_2))
    end
    local highlightCell_1 = a1.highlightCell
    if highlightCell_1 >= 0 and highlightCell_1 < v44 then
        local v53 = a1.cellOwner[highlightCell_1 + 1]
        if v53 >= 0 then
            a1.pipeNodes[highlightCell_1 + 1].Color = u19[(v53 % #u19) + 1]
            a1.nodeLit[highlightCell_1 + 1] = true
        end
    end
end
u20.writeLink = function(a1, a2, a3, a4)
    --[[
      name: writeLink
      line: 647
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local v54 = a1.pipeLinks[a2 + 1]
    a1.linkLit[a2 + 1] = false
    a1.linkShown[a2 + 1] = false
    local v55 = nil
    if a4 >= 0 then
        v55 = a1.cellOwner[a3 + 1]
        if v55 >= 0 and a1.cellOwner[a4 + 1] == v55 then
            if math.abs(a1.cellPathIndex[a3 + 1] - a1.cellPathIndex[a4 + 1]) == 1 then
                v54.Transparency = 0
                a1.linkShown[a2 + 1] = true
                v54.Color = tbl_upv_3[(v55 % #tbl_upv_3) + 1]
                a1.linkSweepT[a2 + 1] = (a1.cellSweepT[a3 + 1] + a1.cellSweepT[a4 + 1]) / 2
                return
            end
            v54.Transparency = 1
            return nil
        end
    end
    v54.Transparency = 1
    return nil
end
u20.acceptsInput = function(a1)
    --[[
      name: acceptsInput
      line: 669
    ]]
    local v56 = a1:isRunning()
    if v56 then
        v56 = false
        if a1.sweepAge < 0 then
            v56 = not a1.resetPending
        end
    end
    return v56
end
u20.onCellTap = function(a1, a2)
    --[[
      name: onCellTap
      line: 672
      upvalues:
        cellKey_upv_1 (copy, index: 1)
        endpointColorAt_upv_1 (copy, index: 2)
    ]]
    local v57 = nil
    if a1:acceptsInput() then
        v57 = endpointColorAt_upv_1(a1.spec, cellKey_upv_1(a1.columns, a2.column, a2.row))
        local v58 = nil
        if v57 ~= nil then
            v58 = a1.board.paths[v57 + 1]
            if #v58 ~= 0 then
                while #v58 > 0 do
                    v58[#v58] = nil
                end
                a1.context.audio.play("uiTap", {})
                a1:syncPipes()
                a1:updateHud()
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u20.onPathBegan = function(a1, a2)
    --[[
      name: onPathBegan
      line: 695
      upvalues:
        cellKey_upv_1 (copy, index: 1)
        endpointColorAt_upv_1 (copy, index: 2)
        pathColorAt_upv_1 (copy, index: 3)
        grabAt_upv_1 (copy, index: 4)
    ]]
    a1.activeColor = nil
    a1.dragChanged = false
    local v59, v60 = nil, nil
    if a1:acceptsInput() then
        local v61 = cellKey_upv_1(a1.columns, a2.column, a2.row)
        v59 = endpointColorAt_upv_1(a1.spec, v61)
        if v59 == nil then
            v59 = pathColorAt_upv_1(a1.spec, a1.board, v61)
        end
        local v62 = ((v59 == nil) and 0) or (#a1.board.paths[v59 + 1])
        v60 = grabAt_upv_1(a1.spec, a1.board, v61)
        if v60 ~= nil then
            a1.activeColor = v60.color
            a1.dragChanged = v60.changed and (v62 > 1)
            a1.highlightCell = v61
            a1.context.audio.play("uiTap", {})
            a1:syncPipes()
            a1:updateHud()
        else
            return nil
        end
    else
        return nil
    end
end
u20.onPathEnter = function(a1, a2)
    --[[
      name: onPathEnter
      line: 725
      upvalues:
        cellKey_upv_1 (copy, index: 1)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 2)
        keyColumn_upv_1 (copy, index: 3)
        keyRow_upv_1 (copy, index: 4)
        stepPath_upv_1 (copy, index: 5)
        tbl_upv_1 (copy, index: 6)
        connectedPairCount_upv_1 (copy, index: 7)
        tbl_upv_4 (copy, index: 8)
        isComplete_upv_1 (copy, index: 9)
    ]]
    local activeColor_1 = a1.activeColor
    if activeColor_1 ~= nil and a1:acceptsInput() then
        local columns_3 = a1.columns
        local v63 = cellKey_upv_1(columns_3, a2.column, a2.row)
        local v64 = 0
        local v65, v66 = nil, nil
        while true do
            local v67
            if v64 >= FLOW_FREE_CONFIG_upv_1.maxInterpolatedSteps then
                break
            end
            v67 = a1.board.paths[activeColor_1 + 1]
            local v68
            if #v67 == 0 then
                break
            end
            v68 = v67[#v67]
            local v69
            if v68 == v63 then
                break
            end
            local v70 = keyColumn_upv_1(columns_3, v68)
            local v71 = keyRow_upv_1(columns_3, v68)
            v69 = a2.column - v70
            local v72 = a2.row - v71
            local v73
            if v69 == 0 then
                v73 = -1
            else
                v73 = cellKey_upv_1(columns_3, v70 + (((v69 <= 0) and -1) or 1), v71)
            end
            local v74
            if v72 == 0 then
                v74 = -1
            else
                v74 = cellKey_upv_1(columns_3, v70, v71 + (((v72 <= 0) and -1) or 1))
            end
            v65 = math.abs(v69)
            local v75 = math.abs(v72) <= v65
            if v75 then
                v65 = v73
            else
                v65 = v74
            end
            if v75 then
                v66 = v74
            else
                v66 = v73
            end
            local v76
            if v65 < 0 then
                v76 = tbl_upv_1
            else
                v76 = stepPath_upv_1(a1.spec, a1.board, activeColor_1, v65)
            end
            if v76.kind == "blocked" and v66 >= 0 then
                v76 = stepPath_upv_1(a1.spec, a1.board, activeColor_1, v66)
            end
            if v76.kind == "blocked" then
                break
            end
            v64 = v64 + 1
            a1.dragChanged = true
            if v76.kind == "connected" then
                a1.context.audio.play("pop", {pitch = tbl_upv_4[math.min(connectedPairCount_upv_1(a1.spec, a1.board), #tbl_upv_4)]})
            elseif v76.kind ~= "cut" then
                a1.context.audio.play("uiTap", {})
            else
                a1.context.audio.play("thud", {})
            end
            if not (isComplete_upv_1(a1.spec, a1.board)) then
                continue
            end
            a1:commitDraw()
            a1.highlightCell = -1
            a1:syncPipes()
            a1:beginCompletion()
            return nil
        end
        if v64 ~= 0 then
            local v77 = a1.board.paths[activeColor_1 + 1]
            a1.highlightCell = ((#v77 <= 0) and -1) or (v77[#v77])
            a1:syncPipes()
            a1:updateHud()
        else
            return nil
        end
    else
        return nil
    end
end
u20.onPathEnded = function(a1)
    --[[
      name: onPathEnded
      line: 804
    ]]
    local activeColor_2 = a1.activeColor
    a1.activeColor = nil
    a1.highlightCell = -1
    local v78 = nil
    if activeColor_2 ~= nil then
        v78 = a1.board.paths[activeColor_2 + 1]
        if #v78 == 1 then
            v78[#v78] = nil
        end
        a1:commitDraw()
        a1:syncPipes()
        a1:updateHud()
        if a1:acceptsInput() then
            if a1.budget < a1.draws then
                a1:spendLife("OVER BUDGET!")
            end
        else
            return nil
        end
    else
        a1.dragChanged = false
        return nil
    end
end
u20.commitDraw = function(a1)
    --[[
      name: commitDraw
      line: 827
    ]]
    if a1.dragChanged then
        a1.dragChanged = false
        a1.draws = a1.draws + 1
    else
        return nil
    end
end
u20.onResetPressed = function(a1)
    --[[
      name: onResetPressed
      line: 834
    ]]
    if a1:acceptsInput() then
        a1:spendLife("RESET")
    else
        return nil
    end
end
u20.beginCompletion = function(a1)
    --[[
      name: beginCompletion
      line: 840
      upvalues:
        u15 (copy, index: 1)
        u16 (copy, index: 2)
    ]]
    a1.context.reportScore(a1.level)
    local v79 = a1.draws <= a1.generated.par
    a1.gestures:cancel()
    a1.activeColor = nil
    a1.dragChanged = false
    a1.sweepAge = 0
    a1.sweepRestored = false
    a1:updateHud()
    local origin_4 = a1.stage.origin
    a1.context.audio.play("whoosh", {})
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("coinSettle", {})
    a1.context.audio.play("scorePing", {})
    a1.popups:show(origin_4 + Vector3.new(0, 7, 0), ("LEVEL %*"):format(a1.level), u15, 1.3)
    if v79 then
        a1.context.audio.play("perfect", {})
        a1.popups:show(origin_4 + Vector3.new(0, 4.400000095367432, 0), "PERFECT", u16, 1)
    end
    a1.stage.shake(0.25)
    a1.level = a1.level + 1
end
u20.spendLife = function(a1, a2)
    --[[
      name: spendLife
      line: 883
      upvalues:
        u17 (copy, index: 1)
        FLOW_FREE_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.resets = a1.resets + 1
    a1.lives = a1.lives - 1
    a1:updateHearts()
    a1.gestures:cancel()
    a1.activeColor = nil
    a1.dragChanged = false
    a1.highlightCell = -1
    a1.context.audio.play("buzz", {})
    a1.stage.shake(0.35)
    local origin_5 = a1.stage.origin
    if a1.lives > 0 then
        a1.popups:show(origin_5 + Vector3.new(0, 7, 0), a2, u17, 1)
        a1.resetPending = true
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            FLOW_FREE_CONFIG_upv_1.resetDelaySeconds,
            function()
                --[[
                  line: 916
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
        a1.popups:show(origin_5 + Vector3.new(0, 7, 0), "OUT OF LIVES!", u17, 1.2)
        a1:setRunning(false)
        local roundToken_upv_2 = a1.roundToken
        local u21 = a1.level - 1
        task.delay(
            FLOW_FREE_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 903
                  upvalues:
                    roundToken_upv_2 (copy, index: 1)
                    a1 (copy, index: 2)
                    u21 (copy, index: 3)
                ]]
                if roundToken_upv_2 == a1.roundToken then
                    a1.context.endRun(u21)
                else
                    return nil
                end
            end
        )
        return nil
    end
end
u20.resetAttempt = function(a1)
    --[[
      name: resetAttempt
      line: 923
      upvalues:
        freshBoard_upv_1 (copy, index: 1)
    ]]
    a1.board = freshBoard_upv_1(a1.spec)
    a1.draws = 0
    a1.resetPending = false
    a1.activeColor = nil
    a1.dragChanged = false
    a1.highlightCell = -1
    a1.gestures:cancel()
    a1:syncPipes()
    a1:updateHud()
end
u20.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 934
      upvalues:
        FLOW_FREE_CONFIG_upv_1 (copy, index: 1)
        u19 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
    ]]
    local v80, v81 = nil, nil
    if a1.sweepAge >= 0 then
        a1.sweepAge = a1.sweepAge + a2
        local v82 = a1.columns * a1.rows
        v80 = a1.sweepAge / FLOW_FREE_CONFIG_upv_1.sweepSeconds
        v81 = FLOW_FREE_CONFIG_upv_1.sweepBandWidth
        if v80 > 1 + v81 then
            if not (a1.sweepRestored) then
                a1.sweepRestored = true
                a1:syncPipes()
            end
        else
            local v83 = 0
            local v84 = false
            v84, v83 = v84, v83
            if v84 then
                v83 = v83 + 1
            else
                v84 = true
            end
            local v85 = nil
            while v83 < v82 do
                v85 = a1.cellOwner[v83 + 1]
                local v86 = nil
                if v85 >= 0 then
                    v86 = math.abs(a1.cellSweepT[v83 + 1] - v80) <= v81
                    local v87 = nil
                    if v86 ~= a1.nodeLit[v83 + 1] then
                        a1.nodeLit[v83 + 1] = v86
                        v87 = a1.pipeNodes[v83 + 1]
                        local v88
                        if v86 then
                            v88 = u19[(v85 % #u19) + 1]
                        else
                            v88 = tbl_upv_3[(v85 % #tbl_upv_3) + 1]
                        end
                        v87.Color = v88
                    end
                end
                if v84 then
                    v83 = v83 + 1
                else
                    v84 = true
                end
            end
            v84, v83 = false, 0
            if v84 then
                v83 = v83 + 1
            else
                v84 = true
            end
            while v83 < v82 * 2 do
                if a1.linkShown[v83 + 1] then
                    v85 = a1.cellOwner[math.floor(v83 / 2) + 1]
                    local v86 = nil
                    if v85 >= 0 then
                        v86 = math.abs(a1.linkSweepT[v83 + 1] - v80) <= v81
                        local v89 = nil
                        if v86 ~= a1.linkLit[v83 + 1] then
                            a1.linkLit[v83 + 1] = v86
                            v89 = a1.pipeLinks[v83 + 1]
                            local v88
                            if v86 then
                                v88 = u19[(v85 % #u19) + 1]
                            else
                                v88 = tbl_upv_3[(v85 % #tbl_upv_3) + 1]
                            end
                            v89.Color = v88
                        end
                    end
                end
                if v84 then
                    v83 = v83 + 1
                else
                    v84 = true
                end
            end
        end
        if FLOW_FREE_CONFIG_upv_1.completionHoldSeconds <= a1.sweepAge then
            a1.sweepAge = -1
            a1:loadLevel()
        end
    else
        return nil
    end
end
local tbl_9 = {}
tbl_9.FlowFreeGame = u20
return tbl_9