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
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local BLOCK_BLAST_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "block-blast-config").BLOCK_BLAST_CONFIG
local drawTray_upv_1 = RuntimeLib_1.import(script, script.Parent, "block-blast-levels").drawTray
local v3 = RuntimeLib_1.import(script, script.Parent, "block-blast-sim")
local anyTrayPieceFits_upv_1 = v3.anyTrayPieceFits
local boardFromHex_upv_1 = v3.boardFromHex
local boardToHex_upv_1 = v3.boardToHex
local canPlace_upv_1 = v3.canPlace
local cellIndex_upv_1 = v3.cellIndex
local clearCenterBand_upv_1 = v3.clearCenterBand
local comboMultiplier_upv_1 = v3.comboMultiplier
local emptyBoard_upv_1 = v3.emptyBoard
local PIECES_upv_1 = v3.PIECES
local placePiece_upv_1 = v3.placePiece
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(210, 212, 222)
local u3 = Color3.fromRGB(247, 248, 252)
local u4 = Color3.fromRGB(232, 122, 108)
local u5 = Color3.fromRGB(46, 46, 58)
local u6 = Color3.fromRGB(38, 39, 50)
local u7 = Color3.fromRGB(23, 26, 37)
local u8 = Color3.fromRGB(41, 47, 68)
local u9 = Color3.fromRGB(248, 248, 252)
local u10 = Color3.fromRGB(252, 252, 255)
local u11 = Color3.fromRGB(255, 216, 102)
local u12 = Color3.fromRGB(245, 245, 255)
local u13 = Color3.fromRGB(255, 92, 80)
local tbl_upv_1 = {Color3.fromRGB(224, 82, 66), Color3.fromRGB(238, 146, 52), Color3.fromRGB(240, 198, 62), Color3.fromRGB(98, 190, 82), Color3.fromRGB(66, 186, 176), Color3.fromRGB(76, 136, 232), Color3.fromRGB(154, 104, 224), Color3.fromRGB(228, 112, 172)}
local u14 = Vector3.new(BLOCK_BLAST_CONFIG_upv_1.cellPitch - 0.25, 0.5, BLOCK_BLAST_CONFIG_upv_1.cellPitch - 0.25)
local function backOut_1(a1)
    --[[
      name: backOut
      line: 51
    ]]
    return (1 + (2.70158 * ((a1 - 1) ^ 3))) + (1.70158 * ((a1 - 1) ^ 2))
end
local function quadOut_1(a1)
    --[[
      name: quadOut
      line: 56
    ]]
    return 1 - ((1 - a1) * (1 - a1))
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 73
    ]]
    return "BlockBlastGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u15 = setmetatable(tbl_2, tbl_3)
u15.__index = u15
u15.new = function(...)
    --[[
      name: new
      line: 79
      upvalues:
        u15 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u15)
    return v4:constructor(...) or v4
end
u15.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 83
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        emptyBoard_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.board = emptyBoard_upv_1()
    a1.cellColor = {}
    a1.slots = {}
    a1.trayIndex = 1
    a1.combo = 0
    a1.streak = 0
    a1.trayHadClear = false
    a1.score = 0
    a1.totalCells = 0
    a1.totalLines = 0
    a1.bestCombo = 0
    a1.bestStreak = 0
    a1.roundToken = 0
    a1.ghostCells = {}
    a1.lastGhostKey = -1
    a1.baseTiles = {}
    a1.blockParts = {}
    a1.slotCubes = {}
    a1.slotLastScale = {}
    a1.blockRestCFrames = {}
    a1.traySlotXs = {}
    a1.traySlotZ = 0
    a1.boardPlaneCenterY = 0
    a1.placeSettles = {}
    a1.clearPops = {}
    a1.trayPops = {}
    a1.boardFlashAge = math.huge
end
u15.buildScene = function(a1)
    --[[
      name: buildScene
      line: 113
      upvalues:
        BoardPicker_upv_1 (copy, index: 1)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 2)
        IsoBoardCamera_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u7 (copy, index: 5)
        u8 (copy, index: 6)
        u5 (copy, index: 7)
        u6 (copy, index: 8)
        makeStagePart_upv_1 (copy, index: 9)
        u14 (copy, index: 10)
        u2 (copy, index: 11)
        u1 (copy, index: 12)
        u9 (copy, index: 13)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 14)
        u11 (copy, index: 15)
        PopupTextPool_upv_1 (copy, index: 16)
        BoardGestures_upv_1 (copy, index: 17)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.picker = BoardPicker_upv_1.new(a1.stage, {columns = BLOCK_BLAST_CONFIG_upv_1.columns, rows = BLOCK_BLAST_CONFIG_upv_1.pickerRows, cellPitch = BLOCK_BLAST_CONFIG_upv_1.cellPitch})
    a1.boardCamera = IsoBoardCamera_upv_1.new(a1.stage, BLOCK_BLAST_CONFIG_upv_1.camera)
    a1.boardCamera:setBoardExtent(BLOCK_BLAST_CONFIG_upv_1.pickerRows * BLOCK_BLAST_CONFIG_upv_1.cellPitch)
    a1.boardPlaneCenterY = ((BLOCK_BLAST_CONFIG_upv_1.boardRowOffset + ((BLOCK_BLAST_CONFIG_upv_1.rows - 1) / 2)) - ((BLOCK_BLAST_CONFIG_upv_1.pickerRows - 1) / 2)) * BLOCK_BLAST_CONFIG_upv_1.cellPitch
    a1.traySlotZ = (a1.picker:cellWorld(0, BLOCK_BLAST_CONFIG_upv_1.trayRowStart).Z + a1.picker:cellWorld(0, BLOCK_BLAST_CONFIG_upv_1.trayRowStart + 1).Z) / 2
    local v5 = BLOCK_BLAST_CONFIG_upv_1.columns / 3 * BLOCK_BLAST_CONFIG_upv_1.cellPitch
    table.insert(a1.traySlotXs, origin_1.X + (-1 * v5))
    table.insert(a1.slotLastScale, -1)
    table.insert(a1.traySlotXs, origin_1.X + (0 * v5))
    table.insert(a1.slotLastScale, -1)
    table.insert(a1.traySlotXs, origin_1.X + (1 * v5))
    table.insert(a1.slotLastScale, -1)
    local v6 = makeSmoothPart_upv_1(container_1)
    v6.Size = Vector3.new(600, 1, 600)
    v6.Color = u7
    v6.CFrame = CFrame.new(origin_1 + Vector3.new(0, -16, 0))
    local lookDirection_1 = BLOCK_BLAST_CONFIG_upv_1.camera.lookDirection
    local Unit_1 = Vector3.new(lookDirection_1.X, 0, lookDirection_1.Z).Unit
    local v7 = makeSmoothPart_upv_1(container_1)
    v7.Size = Vector3.new(700, 300, 1)
    v7.Color = u8
    v7.CFrame = CFrame.lookAt(origin_1 + (Unit_1 * 130), origin_1 + (Unit_1 * 131))
    local v8 = origin_1.Z + a1.boardPlaneCenterY
    local v9 = BLOCK_BLAST_CONFIG_upv_1.columns * BLOCK_BLAST_CONFIG_upv_1.cellPitch
    local v10 = makeSmoothPart_upv_1(container_1)
    v10.Size = Vector3.new(v9 + 2.8, 1, v9 + 2.8)
    v10.Color = u5
    v10.CFrame = CFrame.new(origin_1.X, origin_1.Y - 1, v8)
    local v11 = makeSmoothPart_upv_1(container_1)
    v11.Size = Vector3.new(v9 + 2.8, 0.9, 2 * BLOCK_BLAST_CONFIG_upv_1.cellPitch + 2.2)
    v11.Color = u6
    v11.CFrame = CFrame.new(origin_1.X, origin_1.Y - 0.55, a1.traySlotZ)
    for n_1 = 0, BLOCK_BLAST_CONFIG_upv_1.rows - 1 do
        for n_2 = 0, BLOCK_BLAST_CONFIG_upv_1.columns - 1 do
            local v12 = a1.picker:cellWorld(n_2, n_1 + BLOCK_BLAST_CONFIG_upv_1.boardRowOffset)
            local v13 = makeStagePart_upv_1(container_1)
            v13.Size = u14
            v13.Color = u2
            v13.CFrame = CFrame.new(v12 + Vector3.new(0, -0.25, 0))
            table.insert(a1.baseTiles, v13)
            local v14 = makeStagePart_upv_1(container_1)
            v14.Size = Vector3.new(2.549999952316284, 1.7000000476837158, 2.549999952316284)
            v14.CFrame = u1
            table.insert(a1.blockParts, v14)
            table.insert(a1.blockRestCFrames, (CFrame.new(v12 + Vector3.new(0, 0.8500000238418579, 0))))
            table.insert(a1.cellColor, -1)
        end
    end
    for _ = 0, 2 do
        local tbl_4 = {}
        for v17 = 0, 8 do
            local v15 = makeStagePart_upv_1(container_1)
            v15.Size = Vector3.new(2.549999952316284, 1.7000000476837158, 2.549999952316284)
            v15.CFrame = u1
            table.insert(tbl_4, v15)
        end
        table.insert(a1.slotCubes, tbl_4)
    end
    a1.flashPlate = makeSmoothPart_upv_1(container_1)
    a1.flashPlate.Size = Vector3.new(v9 + 1.6, 0.16, v9 + 1.6)
    a1.flashPlate.Color = u9
    a1.flashPlate.Transparency = 1
    a1.flashPlate.CFrame = CFrame.new(origin_1.X, origin_1.Y + 0.09, v8)
    a1.burstPart = makeSmoothPart_upv_1(container_1)
    a1.burstPart.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.burstPart.Transparency = 1
    a1.burstPart.CFrame = u1
    a1.burst = Instance.new("ParticleEmitter")
    a1.burst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.burst.Rate = 0
    a1.burst.Lifetime = NumberRange.new(0.25, 0.5)
    a1.burst.Speed = NumberRange.new(5, 11)
    a1.burst.SpreadAngle = Vector2.new(180, 180)
    a1.burst.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.45), NumberSequenceKeypoint.new(1, 0.1)})
    a1.burst.Color = ColorSequence.new(u11, u9)
    a1.burst.Parent = a1.burstPart
    local v16 = makeSmoothPart_upv_1(container_1)
    v16.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v16.Transparency = 1
    v16.CFrame = CFrame.new(origin_1.X, origin_1.Y + 3, origin_1.Z - ((((BLOCK_BLAST_CONFIG_upv_1.pickerRows - 1) / 2) + 0.55) * BLOCK_BLAST_CONFIG_upv_1.cellPitch))
    a1.streakBillboard = Instance.new("BillboardGui")
    a1.streakBillboard.Size = UDim2.fromScale(7, 1.5)
    a1.streakBillboard.AlwaysOnTop = true
    a1.streakBillboard.Enabled = false
    a1.streakBillboard.Parent = v16
    a1.streakLabel = Instance.new("TextLabel")
    a1.streakLabel.BackgroundTransparency = 1
    a1.streakLabel.Size = UDim2.fromScale(1, 1)
    a1.streakLabel.Font = Enum.Font.GothamBlack
    a1.streakLabel.TextScaled = true
    a1.streakLabel.TextColor3 = u11
    a1.streakLabel.TextStrokeTransparency = 0.5
    a1.streakLabel.Parent = a1.streakBillboard
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    local tbl_5 = {}
    local tbl_6 = {}
    tbl_6.onPathBegan = function(a2)
        --[[
          name: onPathBegan
          line: 240
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathBegan(a2)
    end
    tbl_6.onPlaneDrag = function(a3)
        --[[
          name: onPlaneDrag
          line: 243
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPlaneDrag(a3)
    end
    tbl_6.onPathEnded = function()
        --[[
          name: onPathEnded
          line: 246
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathEnded()
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, tbl_5, tbl_6)
end
u15.resetRound = function(a1)
    --[[
      name: resetRound
      line: 251
      upvalues:
        emptyBoard_upv_1 (copy, index: 1)
        drawTray_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.carried = nil
    a1:restoreGhost()
    a1.gestures:cancel()
    a1:clearAnimations()
    a1.board = emptyBoard_upv_1()
    for n_3 = 0, #a1.cellColor - 1 do
        a1.cellColor[n_3 + 1] = -1
    end
    a1.score = 0
    a1.combo = 0
    a1.streak = 0
    a1.trayHadClear = false
    a1.totalCells = 0
    a1.totalLines = 0
    a1.bestCombo = 0
    a1.bestStreak = 0
    a1.trayIndex = 1
    a1.slots = drawTray_upv_1(a1.context.getRunSeed(), a1.trayIndex, a1.board).slots
    a1:dressBoard()
    a1:dressTraySlot(0)
    a1:dressTraySlot(1)
    a1:dressTraySlot(2)
    a1:updateStreakBadge()
    a1.boardFlashAge = math.huge
    a1.flashPlate.Transparency = 1
    a1.context.reportScore(0)
end
u15.fixedUpdate = function(a1)
    --[[
      name: fixedUpdate
      line: 280
    ]]
end
u15.render = function(a1, a2)
    --[[
      name: render
      line: 283
    ]]
    a1.boardCamera:update()
    a1:advanceAnimations(a2)
end
u15.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 287
    ]]
    a1.boardCamera:update()
    a1:advanceAnimations(a2)
end
u15.revive = function(a1)
    --[[
      name: revive
      line: 291
      upvalues:
        clearCenterBand_upv_1 (copy, index: 1)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.carried = nil
    a1:restoreGhost()
    a1.gestures:cancel()
    local v17 = nil
    local v18 = nil
    for _, value_1 in clearCenterBand_upv_1(a1.board) do
        v17 = ((a1.cellColor[value_1 + 1] < 0) and 2) or (a1.cellColor[value_1 + 1])
        a1.cellColor[value_1 + 1] = -1
        a1:dressBlock(value_1, v17)
        v18 = math.floor(value_1 / BLOCK_BLAST_CONFIG_upv_1.columns)
        table.insert(a1.clearPops, {cellIndex = value_1, colorIndex = v17, age = -(math.max(math.abs((value_1 % BLOCK_BLAST_CONFIG_upv_1.columns) - 3.5), math.abs(v18 - 3.5)) * BLOCK_BLAST_CONFIG_upv_1.clearStaggerPerCellSeconds)})
    end
    a1.combo = 0
    a1.boardFlashAge = 0
    a1.context.audio.play("perfect", {})
    a1.stage.shake(0.5)
    a1:setRunning(true)
end
u15.captureRound = function(a1)
    --[[
      name: captureRound
      line: 324
      upvalues:
        boardToHex_upv_1 (copy, index: 1)
    ]]
    if a1.carried == nil and a1:isRunning() then
        return (("1;%*;%*;%*;%*;%*;%*;%*"):format(a1.trayIndex, boardToHex_upv_1(a1.board), a1.slots[1], a1.slots[2], a1.slots[3], a1.combo, a1.streak))
    end
    return nil
end
u15.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 331
      upvalues:
        boardFromHex_upv_1 (copy, index: 1)
        PIECES_upv_1 (copy, index: 2)
        anyTrayPieceFits_upv_1 (copy, index: 3)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
    ]]
    local v19 = string.split(a2.state, ";")
    if #v19 == 8 then
        local v20 = nil
        if v19[1] == "1" then
            v20 = tonumber(v19[2])
            local v21 = boardFromHex_upv_1(v19[3])
            local num_1 = tonumber(v19[7])
            local num_2 = tonumber(v19[8])
            if v20 ~= nil and v20 >= 1 and v21 ~= nil and num_1 ~= nil and num_1 >= 0 and num_2 ~= nil and num_2 >= 0 then
                local tbl_7 = {}
                for n_4 = 0, 2 do
                    local v22
                    v22 = tonumber(v19[(n_4 + 3) + 1])
                    if v22 ~= nil and v22 == math.floor(v22) then
                        if v22 >= -1 and #PIECES_upv_1 > v22 then
                            table.insert(tbl_7, v22)
                            continue
                        end
                        return false
                    end
                    return false
                end
                if tbl_7[1] == -1 and tbl_7[2] == -1 and tbl_7[3] == -1 then
                    return false
                end
                if anyTrayPieceFits_upv_1(v21, tbl_7) then
                    a1.trayIndex = math.floor(v20)
                    a1.board = v21
                    a1.slots = tbl_7
                    a1.combo = math.floor(num_1)
                    a1.streak = math.floor(num_2)
                    for n_5 = 0, #a1.cellColor - 1 do
                        if a1.board[n_5 + 1] then
                            a1.cellColor[n_5 + 1] = ((math.floor(n_5 / BLOCK_BLAST_CONFIG_upv_1.columns) * 3) + ((n_5 % BLOCK_BLAST_CONFIG_upv_1.columns) * 5)) % #tbl_upv_1
                        else
                            a1.cellColor[n_5 + 1] = -1
                        end
                    end
                    a1:dressBoard()
                    a1:dressTraySlot(0)
                    a1:dressTraySlot(1)
                    a1:dressTraySlot(2)
                    a1:updateStreakBadge()
                    a1.score = a2.score
                    a1.context.reportScore(a2.score)
                    return true
                end
            end
        end
    end
    return false
end
u15.onPathBegan = function(a1, a2)
    --[[
      name: onPathBegan
      line: 390
      upvalues:
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1:isRunning() and a1.carried == nil then
        local v23 = nil
        if a2.row >= BLOCK_BLAST_CONFIG_upv_1.trayRowStart - 1 then
            local v24 = math.clamp(math.floor((a2.column * 3) / BLOCK_BLAST_CONFIG_upv_1.columns), 0, 2)
            v23 = a1.slots[v24 + 1]
            if v23 ~= nil and v23 >= 0 then
                a1.carried = {slot = v24, pieceIndex = v23, targetX = a1.traySlotXs[v24 + 1], targetZ = a1.traySlotZ, shownX = a1.traySlotXs[v24 + 1], shownZ = a1.traySlotZ}
                a1.lastGhostKey = -1
                a1.context.audio.play("pop", {})
                return
            end
        end
        return nil
    end
    return nil
end
u15.onPlaneDrag = function(a1, a2)
    --[[
      name: onPlaneDrag
      line: 423
      upvalues:
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 1)
        PIECES_upv_1 (copy, index: 2)
        canPlace_upv_1 (copy, index: 3)
    ]]
    local carried_1 = a1.carried
    local v25, v26 = nil, nil
    if carried_1 ~= nil then
        local origin_2 = a1.stage.origin
        local v27 = a2.Y + BLOCK_BLAST_CONFIG_upv_1.carryLeadStuds
        carried_1.targetX = origin_2.X + a2.X
        carried_1.targetZ = origin_2.Z + v27
        local v28 = PIECES_upv_1[carried_1.pieceIndex + 1]
        v25 = a2.X / BLOCK_BLAST_CONFIG_upv_1.cellPitch + (BLOCK_BLAST_CONFIG_upv_1.columns - 1) / 2
        local v29 = (v27 - a1.boardPlaneCenterY) / BLOCK_BLAST_CONFIG_upv_1.cellPitch + (BLOCK_BLAST_CONFIG_upv_1.rows - 1) / 2
        carried_1.originColumn = math.round(v25 - ((v28.width - 1) / 2))
        carried_1.originRow = math.round(v29 - ((v28.height - 1) / 2))
        v26 = false
        if v25 > -1.2 then
            v26 = false
            if v25 < BLOCK_BLAST_CONFIG_upv_1.columns + 0.2 then
                v26 = false
                if v29 > -1.2 then
                    v26 = v29 < BLOCK_BLAST_CONFIG_upv_1.rows + 0.2
                end
            end
        end
        carried_1.overBoard = v26
        v26 = carried_1.overBoard and (canPlace_upv_1(a1.board, carried_1.pieceIndex, carried_1.originColumn, carried_1.originRow))
        carried_1.valid = v26
        local v30 = ((carried_1.valid) and 1) or 0
        v26 = (((((carried_1.pieceIndex * 1000) + ((carried_1.originColumn + 10) * 40)) + (carried_1.originRow + 10)) * 2) + v30) * 2 + (((carried_1.overBoard) and 1) or 0)
        if v26 ~= a1.lastGhostKey then
            a1.lastGhostKey = v26
            a1:refreshGhost(carried_1)
        end
    else
        return nil
    end
end
u15.onPathEnded = function(a1)
    --[[
      name: onPathEnded
      line: 446
    ]]
    local carried_2 = a1.carried
    if carried_2 ~= nil then
        a1.carried = nil
        a1:restoreGhost()
        if carried_2.valid and a1:isRunning() then
            a1:placeCarried(carried_2)
            return nil
        end
        table.insert(a1.trayPops, {slot = carried_2.slot})
        a1.context.audio.play("pop", {})
    else
        return nil
    end
end
u15.placeCarried = function(a1, a2)
    --[[
      name: placeCarried
      line: 470
      upvalues:
        placePiece_upv_1 (copy, index: 1)
        PIECES_upv_1 (copy, index: 2)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 3)
        u11 (copy, index: 4)
        comboMultiplier_upv_1 (copy, index: 5)
        u12 (copy, index: 6)
    ]]
    local v31 = placePiece_upv_1(a1.board, a2.pieceIndex, a2.originColumn, a2.originRow, a1.combo)
    a1:removeClearPopsAt(v31.placedCells)
    local v32 = PIECES_upv_1[a2.pieceIndex + 1]
    for _, value_2 in v31.placedCells do
        a1.cellColor[value_2 + 1] = v32.colorIndex
    end
    local v33 = a2.originColumn + (v32.width - 1) / 2
    local v34 = a2.originRow + (v32.height - 1) / 2
    v34 = nil
    local v35 = nil
    for _, value_3 in v31.clearedCells do
        if a1.cellColor[value_3 + 1] < 0 then
            v35 = v32.colorIndex
        else
            v35 = a1.cellColor[value_3 + 1]
        end
        a1.cellColor[value_3 + 1] = -1
        a1:dressBlock(value_3, v35)
        local v36 = math.floor(value_3 / BLOCK_BLAST_CONFIG_upv_1.columns)
        table.insert(a1.clearPops, {cellIndex = value_3, colorIndex = v35, age = -(math.max(math.abs((value_3 % BLOCK_BLAST_CONFIG_upv_1.columns) - v33), math.abs(v36 - v34)) * BLOCK_BLAST_CONFIG_upv_1.clearStaggerPerCellSeconds)})
    end
    for _, value_4 in v31.placedCells do
        if a1.cellColor[value_4 + 1] >= 0 then
            a1:dressBlock(value_4, a1.cellColor[value_4 + 1])
            table.insert(a1.placeSettles, {cellIndex = value_4})
        end
    end
    a1.score = a1.score + v31.gained
    a1.totalCells = a1.totalCells + v31.cellsPlaced
    a1.totalLines = a1.totalLines + v31.linesCleared
    a1.combo = v31.comboAfter
    a1.bestCombo = math.max(a1.bestCombo, a1.combo)
    a1.context.reportScore(a1.score)
    a1.context.audio.play("thud", {})
    if v31.linesCleared > 0 then
        a1.trayHadClear = true
        a1.context.audio.play("scorePing", {pitch = 0.9 + (BLOCK_BLAST_CONFIG_upv_1.comboPitchStep * math.min(v31.comboAfter - 1, BLOCK_BLAST_CONFIG_upv_1.comboPitchMaxSteps))})
        if v31.linesCleared >= 2 then
            a1.context.audio.play("pop", {})
        end
        a1.stage.shake(0.25 + (0.18 * v31.linesCleared))
        local v37 = a1:boardCellWorld(v33, v34)
        a1.popups:show(v37 + Vector3.new(0, 2.5999999046325684, 0), ("+%*"):format(v31.gained), u11, 0.95)
        if v31.comboAfter >= 2 then
            a1.popups:show(v37 + Vector3.new(0, 4.599999904632568, 0), ("COMBO \195\151%*"):format(string.format("%.4g", comboMultiplier_upv_1(v31.comboAfter))), u12, 0.7)
        end
        if v31.boardCleared then
            a1.boardFlashAge = 0
            a1.context.audio.play("perfect", {})
            a1.popups:show(v37 + Vector3.new(0, 6.400000095367432, 0), "BOARD CLEAR!", u11, 1.25)
            a1.burstPart.CFrame = CFrame.new(a1:boardCellWorld(3.5, 3.5) + Vector3.new(0, 2, 0))
            a1.burst:Emit(24)
        end
    end
    a1.slots[a2.slot + 1] = -1
    a1:dressTraySlot(a2.slot)
    if a1.slots[1] < 0 and a1.slots[2] < 0 and a1.slots[3] < 0 then
        a1:refillTray()
    end
    a1:checkDeath()
end
u15.refillTray = function(a1)
    --[[
      name: refillTray
      line: 566
      upvalues:
        u12 (copy, index: 1)
        drawTray_upv_1 (copy, index: 2)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 3)
    ]]
    if a1.trayHadClear then
        a1.streak = a1.streak + 1
        a1.bestStreak = math.max(a1.bestStreak, a1.streak)
        if a1.streak >= 2 then
            a1.context.audio.play("coinSettle", {pitch = (math.min(a1.streak, 6) * 0.05) + 1})
            a1.popups:show(Vector3.new(a1.stage.origin.X, a1.stage.origin.Y + 2.4, a1.traySlotZ), ("STREAK \195\151%*"):format(a1.streak), u12, 0.7)
        end
    else
        a1.streak = 0
    end
    a1.trayHadClear = false
    a1:updateStreakBadge()
    a1.trayIndex = a1.trayIndex + 1
    a1.slots = drawTray_upv_1(a1.context.getRunSeed(), a1.trayIndex, a1.board).slots
    for n_6 = 0, 2 do
        table.insert(a1.trayPops, {slot = n_6, age = -n_6 * BLOCK_BLAST_CONFIG_upv_1.refillStaggerSeconds})
    end
end
u15.checkDeath = function(a1)
    --[[
      name: checkDeath
      line: 595
      upvalues:
        anyTrayPieceFits_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 3)
    ]]
    if anyTrayPieceFits_upv_1(a1.board, a1.slots) then
        return nil
    else
        a1:setRunning(false)
        a1.context.audio.play("buzz", {})
        a1.popups:show(a1:boardCellWorld(3.5, 3.5) + Vector3.new(0, 5, 0), "NO ROOM!", u13, 1.2)
        local roundToken_upv_1 = a1.roundToken
        local score_upv_1 = a1.score
        task.delay(
            BLOCK_BLAST_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 610
                  upvalues:
                    roundToken_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                    score_upv_1 (copy, index: 3)
                ]]
                if roundToken_upv_1 == a1.roundToken then
                    a1.context.endRun(score_upv_1)
                else
                    return nil
                end
            end
        )
    end
end
u15.boardCellWorld = function(a1, a2, a3)
    --[[
      name: boardCellWorld
      line: 617
      upvalues:
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_3 = a1.stage.origin
    return (Vector3.new(origin_3.X + ((a2 - ((BLOCK_BLAST_CONFIG_upv_1.columns - 1) / 2)) * BLOCK_BLAST_CONFIG_upv_1.cellPitch), origin_3.Y, (origin_3.Z + a1.boardPlaneCenterY) + ((a3 - ((BLOCK_BLAST_CONFIG_upv_1.rows - 1) / 2)) * BLOCK_BLAST_CONFIG_upv_1.cellPitch)))
end
u15.dressBlock = function(a1, a2, a3)
    --[[
      name: dressBlock
      line: 621
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v38 = a1.blockParts[a2 + 1]
    v38.Color = tbl_upv_1[a3 + 1]
    v38.Size = Vector3.new(2.549999952316284, 1.7000000476837158, 2.549999952316284)
    v38.CFrame = a1.blockRestCFrames[a2 + 1]
end
u15.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 627
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_7 = 0, #a1.blockParts - 1 do
        if a1.cellColor[n_7 + 1] < 0 then
            a1.blockParts[n_7 + 1].CFrame = u1
        else
            a1:dressBlock(n_7, a1.cellColor[n_7 + 1])
        end
    end
end
u15.dressTraySlot = function(a1, a2)
    --[[
      name: dressTraySlot
      line: 636
      upvalues:
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v39 = a1.slots[a2 + 1]
    local carried_3 = a1.carried
    if v39 == nil or v39 < 0 or carried_3 ~= nil and carried_3.slot == a2 then
        a1:parkSlotCubes(a2)
        return nil
    end
    a1:positionSlotCubes(a2, v39, BLOCK_BLAST_CONFIG_upv_1.traySlotScale, a1.traySlotXs[a2 + 1], a1.traySlotZ, -0.1)
end
u15.parkSlotCubes = function(a1, a2)
    --[[
      name: parkSlotCubes
      line: 645
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_5 in a1.slotCubes[a2 + 1] do
        value_5.CFrame = u1
    end
end
u15.positionSlotCubes = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: positionSlotCubes
      line: 650
      upvalues:
        PIECES_upv_1 (copy, index: 1)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
    ]]
    local v40 = PIECES_upv_1[a3 + 1]
    local v41 = a1.slotCubes[a2 + 1]
    local v42 = BLOCK_BLAST_CONFIG_upv_1.cellPitch * a4
    if math.abs(a1.slotLastScale[a2 + 1] - a4) > 0.003 then
        a1.slotLastScale[a2 + 1] = a4
        for _, value_6 in v41 do
            value_6.Size = Vector3.new(2.549999952316284, 1.7000000476837158, 2.549999952316284) * a4
        end
    end
    for n_8 = 0, #v41 - 1 do
        local v43 = v41[n_8 + 1]
        if #v40.cells > n_8 then
            local v44 = v40.cells[n_8 + 1]
            v43.Color = tbl_upv_1[v40.colorIndex + 1]
            v43.CFrame = CFrame.new(a5 + ((v44.x - ((v40.width - 1) / 2)) * v42), (a1.stage.origin.Y + a7) + ((1.7 * a4) / 2), a6 + ((v44.y - ((v40.height - 1) / 2)) * v42))
        else
            v43.CFrame = u1
        end
    end
end
u15.refreshGhost = function(a1, a2)
    --[[
      name: refreshGhost
      line: 674
      upvalues:
        PIECES_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
        u4 (copy, index: 3)
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 4)
        cellIndex_upv_1 (copy, index: 5)
    ]]
    a1:restoreGhost()
    if a2.overBoard then
        local v45 = PIECES_upv_1[a2.pieceIndex + 1]
        local v46
        if a2.valid then
            v46 = u3
        else
            v46 = u4
        end
        local v47 = nil
        local v48 = nil
        for _, value_7 in v45.cells do
            v48 = a2.originColumn + value_7.x
            v47 = a2.originRow + value_7.y
            if v48 < 0 or v47 < 0 or BLOCK_BLAST_CONFIG_upv_1.columns <= v48 then
                continue
            end
            if BLOCK_BLAST_CONFIG_upv_1.rows > v47 then
                local v49 = cellIndex_upv_1(v48, v47)
                a1.baseTiles[v49 + 1].Color = v46
                table.insert(a1.ghostCells, v49)
            end
        end
    else
        return nil
    end
end
u15.restoreGhost = function(a1)
    --[[
      name: restoreGhost
      line: 693
      upvalues:
        u2 (copy, index: 1)
    ]]
    while true do
        local v50
        if #a1.ghostCells <= 0 then
            break
        end
        local ghostCells_1 = a1.ghostCells
        local v51 = #ghostCells_1
        v50 = ghostCells_1[v51]
        ghostCells_1[v51] = nil
        if v50 ~= nil then
            a1.baseTiles[v50 + 1].Color = u2
        end
    end
    a1.lastGhostKey = -1
end
u15.updateStreakBadge = function(a1)
    --[[
      name: updateStreakBadge
      line: 708
    ]]
    if a1.streak < 2 then
        a1.streakBillboard.Enabled = false
    else
        a1.streakLabel.Text = ("STREAK \195\151%*"):format(a1.streak)
        a1.streakBillboard.Enabled = true
    end
end
u15.removeClearPopsAt = function(a1, a2)
    --[[
      name: removeClearPopsAt
      line: 716
    ]]
    local v52 = nil
    for n_9 = #a1.clearPops - 1, 0, -1 do
        local v53 = a1.clearPops[n_9 + 1]
        v52 = false
        for _, value_8 in a2 do
            if value_8 == v53.cellIndex then
                v52 = true
                break
            end
        end
        if v52 then
            table.remove(a1.clearPops, n_9 + 1)
        end
    end
end
u15.clearAnimations = function(a1)
    --[[
      name: clearAnimations
      line: 733
      upvalues:
        u1 (copy, index: 1)
    ]]
    while #a1.placeSettles > 0 do
        local placeSettles_1 = a1.placeSettles
        placeSettles_1[#placeSettles_1] = nil
    end
    while true do
        local v54
        if #a1.clearPops <= 0 then
            break
        end
        local clearPops_1 = a1.clearPops
        local v55 = #clearPops_1
        v54 = clearPops_1[v55]
        clearPops_1[v55] = nil
        if v54 ~= nil then
            a1.blockParts[v54.cellIndex + 1].CFrame = u1
        end
    end
    while #a1.trayPops > 0 do
        local trayPops_1 = a1.trayPops
        trayPops_1[#trayPops_1] = nil
    end
end
u15.advanceAnimations = function(a1, a2)
    --[[
      name: advanceAnimations
      line: 755
      upvalues:
        BLOCK_BLAST_CONFIG_upv_1 (copy, index: 1)
        u10 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local carried_4 = a1.carried
    if carried_4 ~= nil then
        carried_4.grabAge = carried_4.grabAge + a2
        local v56 = 1 - math.exp(-BLOCK_BLAST_CONFIG_upv_1.carryLerpPerSecond * a2)
        carried_4.shownX = carried_4.shownX + ((carried_4.targetX - carried_4.shownX) * v56)
        carried_4.shownZ = carried_4.shownZ + ((carried_4.targetZ - carried_4.shownZ) * v56)
        local v57 = math.min(carried_4.grabAge / BLOCK_BLAST_CONFIG_upv_1.grabSeconds, 1)
        a1:positionSlotCubes(carried_4.slot, carried_4.pieceIndex, BLOCK_BLAST_CONFIG_upv_1.traySlotScale + ((BLOCK_BLAST_CONFIG_upv_1.carryScale - BLOCK_BLAST_CONFIG_upv_1.traySlotScale) * (1 - ((1 - v57) * (1 - v57)))), carried_4.shownX, carried_4.shownZ, BLOCK_BLAST_CONFIG_upv_1.carryHoverStuds)
    end
    for n_10 = #a1.placeSettles - 1, 0, -1 do
        local v58
        v58 = a1.placeSettles[n_10 + 1]
        v58.age = v58.age + a2
        local v59 = a1.blockParts[v58.cellIndex + 1]
        if BLOCK_BLAST_CONFIG_upv_1.placeSettleSeconds <= v58.age or a1.cellColor[v58.cellIndex + 1] < 0 then
            if a1.cellColor[v58.cellIndex + 1] >= 0 then
                a1:dressBlock(v58.cellIndex, a1.cellColor[v58.cellIndex + 1])
            end
            table.remove(a1.placeSettles, n_10 + 1)
        else
            local v60 = v58.age / BLOCK_BLAST_CONFIG_upv_1.placeSettleSeconds
            local v61 = 1 - (1 - v60) * (1 - v60)
            local v62 = 0.7 + 0.3 * v61
            v59.Size = Vector3.new(2.55, 1.7 * v62, 2.55)
            v59.CFrame = a1.blockRestCFrames[v58.cellIndex + 1] + Vector3.new(0, ((1 - v61) * 1.3) + ((1.7 * (v62 - 1)) / 2), 0)
        end
    end
    for n_11 = #a1.clearPops - 1, 0, -1 do
        local v63
        v63 = a1.clearPops[n_11 + 1]
        v63.age = v63.age + a2
        local v64
        if v63.age < 0 then
            continue
        end
        v64 = a1.blockParts[v63.cellIndex + 1]
        if not (v63.fired) then
            v63.fired = true
            v64.Color = u10
            a1.burstPart.CFrame = a1.blockRestCFrames[v63.cellIndex + 1]
            a1.burst:Emit(3)
        end
        local v65
        if v63.age < BLOCK_BLAST_CONFIG_upv_1.clearFlashSeconds then
            continue
        end
        v65 = (v63.age - BLOCK_BLAST_CONFIG_upv_1.clearFlashSeconds) / BLOCK_BLAST_CONFIG_upv_1.clearPopSeconds
        if v65 < 1 then
            v64.Size = Vector3.new(2.549999952316284, 1.7000000476837158, 2.549999952316284) * math.max(1 - (1 - ((1 - v65) * (1 - v65))), 0.05)
            v64.CFrame = a1.blockRestCFrames[v63.cellIndex + 1]
        else
            v64.CFrame = u1
            v64.Size = Vector3.new(2.549999952316284, 1.7000000476837158, 2.549999952316284)
            table.remove(a1.clearPops, n_11 + 1)
        end
    end
    for n_12 = #a1.trayPops - 1, 0, -1 do
        local v66
        v66 = a1.trayPops[n_12 + 1]
        v66.age = v66.age + a2
        local slot_1 = v66.slot
        if v66.age < 0 then
            a1:parkSlotCubes(slot_1)
            continue
        end
        local v67
        v67 = a1.slots[slot_1 + 1]
        local carried_5 = a1.carried
        if v67 == nil or v67 < 0 or carried_5 ~= nil and carried_5.slot == slot_1 then
            table.remove(a1.trayPops, n_12 + 1)
            continue
        end
        if not (v66.sounded) then
            v66.sounded = true
            a1.context.audio.play("pop", {pitch = 1 + (slot_1 * 0.08)})
        end
        local v68
        v68 = math.min(v66.age / BLOCK_BLAST_CONFIG_upv_1.refillPopSeconds, 1)
        a1:positionSlotCubes(slot_1, v67, math.max(BLOCK_BLAST_CONFIG_upv_1.traySlotScale * ((1 + (2.70158 * ((v68 - 1) ^ 3))) + (1.70158 * ((v68 - 1) ^ 2))), 0.02), a1.traySlotXs[slot_1 + 1], a1.traySlotZ, -0.1)
        if v68 >= 1 then
            table.remove(a1.trayPops, n_12 + 1)
            a1:dressTraySlot(slot_1)
        end
        local v68
    end
    if a1.boardFlashAge < BLOCK_BLAST_CONFIG_upv_1.boardFlashSeconds then
        a1.boardFlashAge = a1.boardFlashAge + a2
        local v69 = math.min(a1.boardFlashAge / BLOCK_BLAST_CONFIG_upv_1.boardFlashSeconds, 1)
        a1.flashPlate.Transparency = 0.25 + (0.75 * (1 - ((1 - v69) * (1 - v69))))
        if v69 < 1 then
            return
        end
        a1.flashPlate.Transparency = 1
    end
end
local tbl_8 = {}
tbl_8.BlockBlastGame = u15
return tbl_8