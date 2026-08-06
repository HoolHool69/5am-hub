-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "board-picking")
local BoardGestures_upv_1 = v1.BoardGestures
local BoardPicker_upv_1 = v1.BoardPicker
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local GridCursor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "grid-cursor").GridCursor
local HeartPipRow_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "heart-pips").HeartPipRow
local IsoBoardCamera_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "iso-board-camera").IsoBoardCamera
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit")
local cloneKitPart_upv_1 = v3.cloneKitPart
local flattenKitPart_upv_1 = v3.flattenKitPart
local modelWorldAabb_upv_1 = v3.modelWorldAabb
local translateModel_upv_1 = v3.translateModel
local v4 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles")
local DEFAULT_GAME_LIGHTING_upv_1 = v4.DEFAULT_GAME_LIGHTING
local LIGHTING_PROFILES_upv_1 = v4.LIGHTING_PROFILES
local currentScoreBandBottomPx_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "score-band").currentScoreBandBottomPx
local UndoStack_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "undo-stack").UndoStack
local UnblockMeAssets_upv_1 = RuntimeLib_1.import(script, script.Parent, "unblock-me-assets").UnblockMeAssets
local UNBLOCK_ME_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "unblock-me-config").UNBLOCK_ME_CONFIG
local v5 = RuntimeLib_1.import(script, script.Parent, "unblock-me-levels")
local generateLevel_upv_1 = v5.generateLevel
local moveBudget_upv_1 = v5.moveBudget
local v6 = RuntimeLib_1.import(script, script.Parent, "unblock-me-sim")
local applySlide_upv_1 = v6.applySlide
local HERO_INDEX_upv_1 = v6.HERO_INDEX
local isSolved_upv_1 = v6.isSolved
local slideRange_upv_1 = v6.slideRange
local startPositions_upv_1 = v6.startPositions
local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(198, 198, 206)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(205, 205, 212)
tbl_upv_1.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local u2 = Color3.fromRGB(226, 213, 190)
local u3 = Color3.fromRGB(214, 199, 174)
local u4 = Color3.fromRGB(84, 58, 38)
local u5 = Color3.fromRGB(122, 84, 52)
local u6 = Color3.fromRGB(66, 50, 40)
local u7 = Color3.fromRGB(94, 70, 54)
local u8 = Color3.fromRGB(226, 54, 40)
local u9 = Color3.fromRGB(166, 38, 28)
local u10 = Color3.fromRGB(245, 238, 220)
local tbl_upv_2 = {Color3.fromRGB(172, 128, 84), Color3.fromRGB(150, 106, 66), Color3.fromRGB(188, 146, 100), Color3.fromRGB(136, 96, 60)}
local tbl_upv_3 = {Color3.fromRGB(140, 102, 64), Color3.fromRGB(120, 82, 48), Color3.fromRGB(154, 116, 76), Color3.fromRGB(108, 74, 44)}
local u11 = Color3.fromRGB(235, 64, 52)
local u12 = Color3.fromRGB(58, 52, 66)
local u13 = Color3.fromRGB(255, 216, 102)
local u14 = Color3.fromRGB(245, 245, 255)
local u15 = Color3.fromRGB(255, 92, 80)
local u16 = Color3.fromRGB(96, 68, 46)
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 137
    ]]
    return "UnblockMeGame"
end
tbl_5.__index = BaseWorldGame_upv_1
local u17 = setmetatable(tbl_4, tbl_5)
u17.__index = u17
u17.new = function(...)
    --[[
      name: new
      line: 143
      upvalues:
        u17 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u17)
    return v7:constructor(...) or v7
end
u17.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 147
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 2)
        UndoStack_upv_1 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.level = 1
    a1.lives = UNBLOCK_ME_CONFIG_upv_1.livesPerRun
    a1.boardResets = 0
    a1.movesUsed = 0
    a1.budget = 0
    a1.positions = {}
    a1.undoStack = UndoStack_upv_1.new(UNBLOCK_ME_CONFIG_upv_1.undoCapacity)
    a1.roundToken = 0
    a1.pendingReset = false
    a1.heroVisualVelocity = 0
    a1.grabRange = {}
    a1.grabTarget = 0
    a1.grabAnchorOffset = 0
    a1.bumpArmed = true
    a1.heldSlideDirection = 0
    a1.slideRepeatClock = 0
    a1.slideRepeatCount = 0
    a1.visualPositions = {}
    a1.liftVisuals = {}
    a1.tapPulses = {}
    a1.pieceSettled = {}
    a1.pendingClack = {}
    a1.pieceBodies = {}
    a1.pieceStripes = {}
    a1.pieceVisuals = {}
    a1.heartParts = {}
    a1.livesRowHalfHeight = 0.31
    a1.lastCounterText = ""
end
u17.buildScene = function(a1)
    --[[
      name: buildScene
      line: 181
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        BoardPicker_upv_1 (copy, index: 2)
        IsoBoardCamera_upv_1 (copy, index: 3)
        UnblockMeAssets_upv_1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u6 (copy, index: 6)
        u7 (copy, index: 7)
        u5 (copy, index: 8)
        makeStagePart_upv_1 (copy, index: 9)
        u2 (copy, index: 10)
        u3 (copy, index: 11)
        cloneKitPart_upv_1 (copy, index: 12)
        u4 (copy, index: 13)
        u1 (copy, index: 14)
        u10 (copy, index: 15)
        HeartPipRow_upv_1 (copy, index: 16)
        u12 (copy, index: 17)
        u11 (copy, index: 18)
        PopupTextPool_upv_1 (copy, index: 19)
        readLightingFolderProfile_upv_1 (copy, index: 20)
        tbl_upv_1 (copy, index: 21)
        LIGHTING_PROFILES_upv_1 (copy, index: 22)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 23)
        BoardGestures_upv_1 (copy, index: 24)
        GridCursor_upv_1 (copy, index: 25)
    ]]
    local container_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    local cellPitch_1 = UNBLOCK_ME_CONFIG_upv_1.cellPitch
    local v8 = UNBLOCK_ME_CONFIG_upv_1.columns * cellPitch_1 / 2
    a1.picker = BoardPicker_upv_1.new(a1.stage, {columns = UNBLOCK_ME_CONFIG_upv_1.columns, rows = UNBLOCK_ME_CONFIG_upv_1.rows, cellPitch = cellPitch_1})
    a1.boardCamera = IsoBoardCamera_upv_1.new(a1.stage, UNBLOCK_ME_CONFIG_upv_1.camera)
    a1.boardCamera:setBoardExtent(math.max(UNBLOCK_ME_CONFIG_upv_1.columns, UNBLOCK_ME_CONFIG_upv_1.rows) * cellPitch_1)
    a1.assets = UnblockMeAssets_upv_1.new()
    local core_1 = a1.assets.core
    a1.authoredCore = core_1
    local v9 = ((core_1 == nil) and Vector3.new(0, 0, 0)) or (origin_1 - core_1.anchor)
    if core_1 == nil then
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Size = Vector3.new(600, 1, 600)
        v10.Color = u6
        v10.CFrame = CFrame.new(origin_1 + Vector3.new(0, -16, 0))
        local lookDirection_1 = UNBLOCK_ME_CONFIG_upv_1.camera.lookDirection
        local Unit_1 = Vector3.new(lookDirection_1.X, 0, lookDirection_1.Z).Unit
        local v11 = makeSmoothPart_upv_1(container_1)
        v11.Size = Vector3.new(700, 260, 1)
        v11.Color = u7
        v11.CFrame = CFrame.lookAt(origin_1 + (Unit_1 * 130), origin_1 + Unit_1 * 131)
        local v12 = makeSmoothPart_upv_1(container_1)
        v12.Size = Vector3.new((UNBLOCK_ME_CONFIG_upv_1.columns * cellPitch_1) + 3.2, 1.1, UNBLOCK_ME_CONFIG_upv_1.rows * cellPitch_1 + 3.2)
        v12.Color = u5
        v12.CFrame = CFrame.new(origin_1 + Vector3.new(0, -1, 0))
        for n_1 = 0, UNBLOCK_ME_CONFIG_upv_1.rows - 1 do
            local v13 = nil
            for n_2 = 0, UNBLOCK_ME_CONFIG_upv_1.columns - 1 do
                local v14
                v14 = makeStagePart_upv_1(container_1)
                v14.Size = Vector3.new(cellPitch_1 - 0.25, 0.45, cellPitch_1 - 0.25)
                if (n_2 + n_1) % 2 ~= 0 then
                    v13 = u3
                else
                    v13 = u2
                end
                v14.Color = v13
                v14.CFrame = CFrame.new(a1.picker:cellWorld(n_2, n_1) + Vector3.new(0, -0.22499999403953552, 0))
            end
        end
    else
        a1:cloneBoardStatic(core_1.floor, container_1, v9)
        a1:cloneBoardStatic(core_1.horizon, container_1, v9)
        a1:cloneBoardStaticPart(core_1.detailOutline, container_1, v9)
        a1:cloneBoardStatic(core_1.cellModel, container_1, v9)
        if a1.assets.details == nil then
            warn("[unblock-me] kit Details missing \226\128\148 procedural tongue only")
        else
            a1:cloneBoardStatic(a1.assets.details, container_1, v9)
        end
        if #a1.assets.gradients == 0 then
            warn("[unblock-me] kit Gradient parts not mirrored \226\128\148 horizon stands alone")
        end
        for _, value_1 in a1.assets.gradients do
            a1:cloneBoardStaticPart(value_1, container_1, v9)
        end
    end
    local v15 = v8 + 1.1
    local v16 = (UNBLOCK_ME_CONFIG_upv_1.exitRow - (UNBLOCK_ME_CONFIG_upv_1.rows / 2)) * cellPitch_1
    local v17 = v16 + cellPitch_1
    local v18 = Vector3.new(1.1, 1.6, v15 * 2)
    local v19 = Vector3.new(-v8 - 0.55, 0.35, 0)
    local v20
    if core_1 == nil then
        v20 = nil
    else
        v20 = cloneKitPart_upv_1(core_1.frameRail, container_1)
    end
    if v20 == nil then
        local v21 = makeStagePart_upv_1(container_1)
        v21.Color = u4
        v20 = v21
    end
    v20.Size = v18
    v20.CFrame = CFrame.new(origin_1 + v19)
    local v22 = Vector3.new(v15 * 2, 1.6, 1.1)
    local v23 = Vector3.new(0, 0.35, -v8 - 0.55)
    if core_1 == nil then
        v20 = nil
    else
        v20 = cloneKitPart_upv_1(core_1.frameRail, container_1)
    end
    if v20 == nil then
        local v24 = makeStagePart_upv_1(container_1)
        v24.Color = u4
        v20 = v24
    end
    v20.Size = v22
    v20.CFrame = CFrame.new(origin_1 + v23)
    local v25 = Vector3.new(v15 * 2, 1.6, 1.1)
    local v26 = Vector3.new(0, 0.35, v8 + 0.55)
    if core_1 == nil then
        v20 = nil
    else
        v20 = cloneKitPart_upv_1(core_1.frameRail, container_1)
    end
    if v20 == nil then
        local v27 = makeStagePart_upv_1(container_1)
        v27.Color = u4
        v20 = v27
    end
    v20.Size = v25
    v20.CFrame = CFrame.new(origin_1 + v26)
    local v28 = v16 + v15
    local v29 = Vector3.new(1.1, 1.6, v28)
    v20 = Vector3.new(v8 + 0.55, 0.35, -v15 + (v28 / 2))
    local v30
    if core_1 == nil then
        v30 = nil
    else
        v30 = cloneKitPart_upv_1(core_1.frameRail, container_1)
    end
    if v30 == nil then
        local v31 = makeStagePart_upv_1(container_1)
        v31.Color = u4
        v30 = v31
    end
    v30.Size = v29
    v30.CFrame = CFrame.new(origin_1 + v20)
    local v32 = v15 - v17
    v20 = Vector3.new(1.1, 1.6, v32)
    v30 = Vector3.new(v8 + 0.55, 0.35, v17 + (v32 / 2))
    local v33
    if core_1 == nil then
        v33 = nil
    else
        v33 = cloneKitPart_upv_1(core_1.frameRail, container_1)
    end
    if v33 == nil then
        local v34 = makeStagePart_upv_1(container_1)
        v34.Color = u4
        v33 = v34
    end
    v33.Size = v20
    v33.CFrame = CFrame.new(origin_1 + v30)
    if core_1 == nil or a1.assets.details == nil then
        v20 = makeStagePart_upv_1(container_1)
        v20.Size = Vector3.new(cellPitch_1 * 1.7, 0.45, cellPitch_1 - 0.25)
        v20.Color = u2
        v20.CFrame = CFrame.new(origin_1 + Vector3.new(v8 + (cellPitch_1 * 0.85), -0.225, v16 + (cellPitch_1 / 2)))
    end
    for v33 = 0, 13 do
        local v35 = makeStagePart_upv_1(container_1)
        v35.CFrame = u1
        table.insert(a1.pieceBodies, v35)
        local v36 = makeSmoothPart_upv_1(container_1)
        v36.CFrame = u1
        table.insert(a1.pieceStripes, v36)
        table.insert(a1.visualPositions, 0)
        table.insert(a1.liftVisuals, 0)
        table.insert(a1.tapPulses, 0)
        table.insert(a1.pieceSettled, true)
        table.insert(a1.pendingClack, 0)
    end
    a1.heroArrowA = makeSmoothPart_upv_1(container_1)
    a1.heroArrowA.Size = Vector3.new(1.5, 0.11999999731779099, 0.3400000035762787)
    a1.heroArrowA.Color = u10
    a1.heroArrowA.CFrame = u1
    a1.heroArrowB = makeSmoothPart_upv_1(container_1)
    a1.heroArrowB.Size = Vector3.new(1.5, 0.11999999731779099, 0.3400000035762787)
    a1.heroArrowB.Color = u10
    a1.heroArrowB.CFrame = u1
    a1.heartRow = HeartPipRow_upv_1:tryCreate(container_1, {count = UNBLOCK_ME_CONFIG_upv_1.livesPerRun, spentColor = u12})
    if a1.heartRow == nil then
        for _ = 0, UNBLOCK_ME_CONFIG_upv_1.livesPerRun - 1 do
            local v37 = makeStagePart_upv_1(container_1)
            v37.Size = Vector3.new(0.6200000047683716, 0.6200000047683716, 0.20000000298023224)
            v37.Color = u11
            v37.CFrame = u1
            table.insert(a1.heartParts, v37)
        end
    else
        a1.livesRowHalfHeight = a1.heartRow.heightStuds / 2
    end
    a1.boardCamera:setResolveListener(
        function(a2, a3)
            --[[
              line: 352
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:poseLivesRow(a2, a3)
        end
    )
    a1:buildCounter()
    a1:buildUndoButton()
    a1:buildConfetti()
    a1.popups = PopupTextPool_upv_1.new(container_1, 8)
    if core_1 ~= nil then
        local v38 = nil
        if a1.assets.lighting ~= nil then
            v20 = a1.stage.setLighting
            v33 = a1.assets.lighting
            v38 = LIGHTING_PROFILES_upv_1["unblock-me"] or DEFAULT_GAME_LIGHTING_upv_1
            v20(readLightingFolderProfile_upv_1(v33, tbl_upv_1, v38))
        end
    end
    local tbl_6 = {}
    local tbl_7 = {}
    tbl_7.onCellTap = function(a4)
        --[[
          name: onCellTap
          line: 365
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCellTap(a4)
    end
    tbl_7.onPathBegan = function(a5)
        --[[
          name: onPathBegan
          line: 368
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathBegan(a5)
    end
    tbl_7.onPlaneDrag = function(a6)
        --[[
          name: onPlaneDrag
          line: 371
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPlaneDrag(a6)
    end
    tbl_7.onPathEnded = function()
        --[[
          name: onPathEnded
          line: 374
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onPathEnded()
    end
    a1.gestures = BoardGestures_upv_1.new(a1.context.input, a1.picker, a1.context.janitor, tbl_6, tbl_7)
    local function onAltActivate_1()
        --[[
          name: onAltActivate
          line: 386
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCursorAlt()
    end
    local function onActivate_1(a7)
        --[[
          name: onActivate
          line: 383
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onCursorActivate(a7)
    end
    a1.cursor = GridCursor_upv_1.new(a1.context.input, a1.context.janitor, {picker = a1.picker, container = container_1, hoverStuds = UNBLOCK_ME_CONFIG_upv_1.pieceHeight + 0.5, onActivate = onActivate_1, onAltActivate = onAltActivate_1})
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a8, a9)
                --[[
                  line: 391
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                local v39 = nil
                if a9 ~= "key" then
                    if a1.grabSource == "pointer" then
                        a1:commitGrab(a1.grabTarget)
                    end
                    v39 = a1.picker:planePointAt(a8)
                    a1.lastPressPlane = v39
                    if v39 == nil then
                        return nil
                    elseif math.abs(v39.X - a1:undoPlaneX()) <= 3.4 and math.abs(v39.Y - a1:undoPlaneY()) <= 2 then
                        a1:tryUndo()
                    end
                else
                    return nil
                end
            end
        )
    )
end
u17.buildCounter = function(a1)
    --[[
      name: buildCounter
      line: 411
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        u14 (copy, index: 2)
    ]]
    local cellPitch_2 = UNBLOCK_ME_CONFIG_upv_1.cellPitch
    local v40 = Instance.new("Part")
    v40.Anchored = true
    v40.CanCollide = false
    v40.CanQuery = false
    v40.CanTouch = false
    v40.Transparency = 1
    v40.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v40.CFrame = CFrame.new(a1.stage.origin + Vector3.new(cellPitch_2 * 1.25, 3.2, ((-UNBLOCK_ME_CONFIG_upv_1.rows / 2) - 0.6) * cellPitch_2))
    v40.Parent = a1.stage.container
    local v41 = Instance.new("BillboardGui")
    v41.Size = UDim2.fromScale(7, 1.5)
    v41.AlwaysOnTop = true
    v41.Parent = v40
    local v42 = Instance.new("TextLabel")
    v42.BackgroundTransparency = 1
    v42.Size = UDim2.fromScale(1, 1)
    v42.Font = Enum.Font.GothamBlack
    v42.TextScaled = true
    v42.TextColor3 = u14
    v42.TextStrokeTransparency = 0.5
    v42.Parent = v41
    a1.counterLabel = v42
end
u17.undoPlaneX = function(a1)
    --[[
      name: undoPlaneX
      line: 438
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (0.7 - ((UNBLOCK_ME_CONFIG_upv_1.columns - 1) / 2)) * UNBLOCK_ME_CONFIG_upv_1.cellPitch
end
u17.undoPlaneY = function(a1)
    --[[
      name: undoPlaneY
      line: 441
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (6.7 - ((UNBLOCK_ME_CONFIG_upv_1.rows - 1) / 2)) * UNBLOCK_ME_CONFIG_upv_1.cellPitch
end
u17.buildUndoButton = function(a1)
    --[[
      name: buildUndoButton
      line: 444
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        u14 (copy, index: 3)
    ]]
    local origin_2 = a1.stage.origin
    local v43 = makeStagePart_upv_1(a1.stage.container)
    v43.Size = Vector3.new(6, 0.6000000238418579, 2.5999999046325684)
    v43.Color = u16
    v43.CFrame = CFrame.new(origin_2 + Vector3.new(a1:undoPlaneX(), 0.3, a1:undoPlaneY()))
    local v44 = Instance.new("BillboardGui")
    v44.Size = UDim2.fromScale(3.4, 1)
    v44.StudsOffset = Vector3.new(0, 1.2000000476837158, 0)
    v44.AlwaysOnTop = true
    v44.Parent = v43
    local v45 = Instance.new("TextLabel")
    v45.BackgroundTransparency = 1
    v45.Size = UDim2.fromScale(1, 1)
    v45.Font = Enum.Font.GothamBlack
    v45.TextScaled = true
    v45.Text = "UNDO"
    v45.TextColor3 = u14
    v45.TextStrokeTransparency = 0.5
    v45.Parent = v44
end
u17.buildConfetti = function(a1)
    --[[
      name: buildConfetti
      line: 466
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 2)
        u13 (copy, index: 3)
        u8 (copy, index: 4)
        u14 (copy, index: 5)
    ]]
    local cellPitch_3 = UNBLOCK_ME_CONFIG_upv_1.cellPitch
    local u18 = Instance.new("Part")
    u18.Anchored = true
    u18.CanCollide = false
    u18.CanQuery = false
    u18.CanTouch = false
    u18.Transparency = 1
    u18.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    u18.CFrame = CFrame.new(a1.stage.origin + Vector3.new(((UNBLOCK_ME_CONFIG_upv_1.columns / 2) * cellPitch_3) + 2.6, 1.4, ((UNBLOCK_ME_CONFIG_upv_1.exitRow - (UNBLOCK_ME_CONFIG_upv_1.rows / 2)) * cellPitch_3) + (cellPitch_3 / 2)))
    u18.Parent = a1.stage.container
    local function v46(a2)
        --[[
          line: 479
          upvalues:
            SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
            u18 (copy, index: 2)
        ]]
        local v47 = Instance.new("ParticleEmitter")
        v47.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
        v47.Rate = 0
        v47.Lifetime = NumberRange.new(0.35, 0.75)
        v47.Speed = NumberRange.new(8, 16)
        v47.SpreadAngle = Vector2.new(180, 180)
        v47.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.5), NumberSequenceKeypoint.new(1, 0.12)})
        v47.Color = ColorSequence.new(a2)
        v47.Parent = u18
        return v47
    end
    a1.confettiGold = v46(u13)
    a1.confettiRed = v46(u8)
    a1.confettiWhite = v46(u14)
end
u17.resetRound = function(a1)
    --[[
      name: resetRound
      line: 495
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.level = 1
    a1.lives = UNBLOCK_ME_CONFIG_upv_1.livesPerRun
    a1.boardResets = 0
    a1.pendingReset = false
    a1.escape = nil
    a1:releaseGrab()
    a1:loadLevel()
    a1.context.reportScore(0)
end
u17.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 506
    ]]
    a1.cursor:update(a2)
    a1:pollCursorSlide(a2)
end
u17.render = function(a1, a2)
    --[[
      name: render
      line: 510
    ]]
    a1.boardCamera:update()
    a1:advanceBeats(a2)
    a1:advancePieces(a2)
end
u17.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 515
    ]]
    a1.boardCamera:update()
    a1.cursor:update(a2)
    a1:advanceBeats(a2)
    a1:advancePieces(a2)
end
u17.revive = function(a1)
    --[[
      name: revive
      line: 521
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.lives = UNBLOCK_ME_CONFIG_upv_1.livesPerRun
    a1.pendingReset = false
    a1.escape = nil
    a1:releaseGrab()
    a1:resetAttempt()
    a1:updateHearts()
    a1:setRunning(true)
end
u17.captureRound = function(a1)
    --[[
      name: captureRound
      line: 531
    ]]
    return (("1|%*|%*"):format(a1.level, a1.lives))
end
u17.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 536
    ]]
    local v48 = string.split(a2.state, "|")
    if #v48 == 3 then
        local v49 = nil
        if v48[1] == "1" then
            v49 = tonumber(v48[2])
            local num_1 = tonumber(v48[3])
            if v49 ~= nil and num_1 ~= nil and v49 >= 1 and num_1 >= 1 then
                a1.level = math.floor(v49)
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
u17.loadLevel = function(a1)
    --[[
      name: loadLevel
      line: 553
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
        startPositions_upv_1 (copy, index: 2)
        moveBudget_upv_1 (copy, index: 3)
        u13 (copy, index: 4)
        u14 (copy, index: 5)
    ]]
    a1.generated = generateLevel_upv_1(a1.context.getRunSeed(), a1.level)
    a1.spec = a1.generated.spec
    a1.positions = startPositions_upv_1(a1.spec)
    a1.budget = moveBudget_upv_1(a1.level, a1.generated.par)
    a1.movesUsed = 0
    a1.undoStack:clear()
    a1.escape = nil
    a1.pendingReset = false
    a1:releaseGrab()
    a1.gestures:cancel()
    a1:dressPieces()
    a1:syncVisualsInstant()
    a1:updateHearts()
    a1:updateMoveCounter()
    local origin_3 = a1.stage.origin
    a1.popups:show(origin_3 + Vector3.new(0, 8, 0), ("LEVEL %*"):format(a1.level), u13, 1.3)
    a1.popups:show(origin_3 + Vector3.new(0, 5.400000095367432, 0), ("%* MOVES"):format(a1.budget), u14, 0.7)
end
u17.resetAttempt = function(a1)
    --[[
      name: resetAttempt
      line: 576
      upvalues:
        startPositions_upv_1 (copy, index: 1)
    ]]
    a1.positions = startPositions_upv_1(a1.spec)
    a1.movesUsed = 0
    a1.undoStack:clear()
    a1.pendingReset = false
    a1:releaseGrab()
    a1.gestures:cancel()
    for n_3 = 0, #a1.spec.pieces - 1 do
        a1.pieceSettled[n_3 + 1] = false
    end
    a1:updateMoveCounter()
end
u17.dressPieces = function(a1)
    --[[
      name: dressPieces
      line: 591
      upvalues:
        u1 (copy, index: 1)
        HERO_INDEX_upv_1 (copy, index: 2)
    ]]
    local authoredCore_1 = a1.authoredCore
    for n_4 = 0, 13 do
        local v50
        v50 = a1.pieceVisuals[n_4]
        if v50 ~= nil then
            v50:Destroy()
            a1.pieceVisuals[n_4] = nil
        end
        local v51 = a1.pieceBodies[n_4 + 1]
        local v52 = a1.pieceStripes[n_4 + 1]
        if #a1.spec.pieces <= n_4 then
            v51.CFrame = u1
            v52.CFrame = u1
            continue
        end
        if authoredCore_1 == nil then
            a1:dressProceduralPiece(n_4)
            continue
        end
        local v53 = a1.spec.pieces[n_4 + 1]
        local v54
        if n_4 == HERO_INDEX_upv_1 then
            v54 = authoredCore_1.heroHull
        elseif v53.length < 3 then
            v54 = authoredCore_1.twoCellHulls[((a1.level + n_4) % #authoredCore_1.twoCellHulls) + 1]
        else
            v54 = authoredCore_1.threeCellHulls[((a1.level + n_4) % #authoredCore_1.threeCellHulls) + 1]
        end
        local v55
        v55 = a1:makePieceVisual(v54, v53.horizontal, n_4 == HERO_INDEX_upv_1)
        if v55 == nil then
            a1:dressProceduralPiece(n_4)
        else
            a1.pieceVisuals[n_4] = v55
            v51.CFrame = u1
            v52.CFrame = u1
        end
    end
    if authoredCore_1 == nil then
        return
    end
    a1.heroArrowA.CFrame = u1
    a1.heroArrowB.CFrame = u1
end
u17.dressProceduralPiece = function(a1, a2)
    --[[
      name: dressProceduralPiece
      line: 636
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        HERO_INDEX_upv_1 (copy, index: 2)
        u8 (copy, index: 3)
        u9 (copy, index: 4)
        tbl_upv_2 (copy, index: 5)
        tbl_upv_3 (copy, index: 6)
    ]]
    local cellPitch_4 = UNBLOCK_ME_CONFIG_upv_1.cellPitch
    local pieceInset_1 = UNBLOCK_ME_CONFIG_upv_1.pieceInset
    local v56 = a1.spec.pieces[a2 + 1]
    local v57 = a1.pieceBodies[a2 + 1]
    local v58 = a1.pieceStripes[a2 + 1]
    local v59 = v56.length * cellPitch_4 - pieceInset_1
    local v60 = cellPitch_4 - pieceInset_1
    local v61
    if v56.horizontal then
        v61 = Vector3.new(v59, UNBLOCK_ME_CONFIG_upv_1.pieceHeight, v60)
    else
        v61 = Vector3.new(v60, UNBLOCK_ME_CONFIG_upv_1.pieceHeight, v59)
    end
    v57.Size = v61
    if v56.horizontal then
        v61 = Vector3.new(v59 * 0.6, 0.1, v60 * 0.3)
    else
        v61 = Vector3.new(v60 * 0.3, 0.1, v59 * 0.6)
    end
    v58.Size = v61
    if a2 ~= HERO_INDEX_upv_1 then
        v57.Color = tbl_upv_2[((a2 - 1) % #tbl_upv_2) + 1]
        v58.Color = tbl_upv_3[((a2 - 1) % #tbl_upv_3) + 1]
    else
        v57.Color = u8
        v58.Color = u9
    end
end
u17.cloneBoardStatic = function(a1, a2, a3, a4)
    --[[
      name: cloneBoardStatic
      line: 654
      upvalues:
        flattenKitPart_upv_1 (copy, index: 1)
        translateModel_upv_1 (copy, index: 2)
    ]]
    local v62 = a2:Clone()
    for _, value_2 in v62:GetDescendants() do
        if value_2:IsA("BasePart") then
            flattenKitPart_upv_1(value_2)
        end
    end
    v62.Parent = a3
    translateModel_upv_1(v62, a4)
end
u17.cloneBoardStaticPart = function(a1, a2, a3, a4)
    --[[
      name: cloneBoardStaticPart
      line: 664
      upvalues:
        flattenKitPart_upv_1 (copy, index: 1)
    ]]
    local v63 = a2:Clone()
    flattenKitPart_upv_1(v63)
    v63.Parent = a3
    v63.CFrame = v63.CFrame + a4
end
u17.makePieceVisual = function(a1, a2, a3, a4)
    --[[
      name: makePieceVisual
      line: 672
      upvalues:
        flattenKitPart_upv_1 (copy, index: 1)
        modelWorldAabb_upv_1 (copy, index: 2)
    ]]
    local v64 = Instance.new("Model")
    v64.Name = "PieceVisual"
    a2:Clone().Parent = v64
    for _, value_3 in v64:GetDescendants() do
        if value_3:IsA("BasePart") then
            flattenKitPart_upv_1(value_3)
            if value_3.Material == Enum.Material.Neon then
                value_3.Material = Enum.Material.SmoothPlastic
            end
        elseif value_3:IsA("Light") or value_3:IsA("Beam") or value_3:IsA("ParticleEmitter") then
            value_3.Enabled = false
        end
    end
    v64.Parent = a1.stage.container
    local v65 = modelWorldAabb_upv_1(v64)
    local v66 = nil
    if v65 ~= nil then
        local v67 = v65.size.Z < v65.size.X
        local v68
        v68 = nil
        if a3 == v67 then
            local v69 = nil
            if a4 then
                v69 = a1:detectNose(v64, v67)
                if v69 ~= nil and v69 < 0 then
                    v68 = math.pi
                end
            end
        else
            local v70 = 1.5707963267948966
            if a4 then
                v66 = a1:detectNose(v64, v67)
                if v66 == nil or v66 >= 0 then
                    v68 = v70
                else
                    v68 = -1.5707963267948966
                end
            else
                v68 = v70
            end
        end
        if v68 ~= nil then
            local center_1 = v65.center
            v64:PivotTo((CFrame.new(center_1) * CFrame.Angles(0, v68, 0)) * CFrame.new(center_1 * -1) * v64:GetPivot())
        end
        v66 = modelWorldAabb_upv_1(v64)
        if v66 ~= nil then
            v64.WorldPivot = CFrame.new(v66.center.X, v66.min.Y, v66.center.Z)
            return v64
        end
    end
    v64:Destroy()
    return nil
end
u17.detectNose = function(a1, a2, a3)
    --[[
      name: detectNose
      line: 729
      upvalues:
        modelWorldAabb_upv_1 (copy, index: 1)
    ]]
    local v71 = modelWorldAabb_upv_1(a2)
    if v71 ~= nil then
        local v72
        if a3 then
            v72 = v71.center.X
        else
            v72 = v71.center.Z
        end
        local v73
        if a3 then
            v73 = v71.size.X
        else
            v73 = v71.size.Z
        end
        local v74 = nil
        local v75 = nil
        local v76 = nil
        local _ = nil
        local Color_1 = nil
        local Size_1 = nil
        local v77 = nil
        local v78 = nil
        for v79, value_4 in a2:GetDescendants() do
            v77 = value_4:IsA("BasePart")
            if not (v77) then
                continue
            end
            if a3 then
                v76 = value_4.Position.X
            else
                v76 = value_4.Position.Z
            end
            v78 = v76 - v72
            if math.abs(v78) < v73 * 0.22 then
                continue
            end
            v76 = ((v78 <= 0) and -1) or 1
            Color_1 = value_4.Color
            Size_1 = value_4.Size
            if value_4.Transparency <= 0.2 or value_4.Transparency >= 0.98 then
                if (Size_1.X * Size_1.Y) * Size_1.Z >= 1.5 or Color_1.R <= 0.55 or Color_1.G >= 0.4 or Color_1.B >= 0.4 then
                    continue
                end
                if v74 == nil then
                    v74 = v76
                end
            elseif v75 == nil then
                v75 = v76
            end
        end
        if v74 == nil then
            return v75
        end
        return -v74
    end
    return nil
end
u17.syncVisualsInstant = function(a1)
    --[[
      name: syncVisualsInstant
      line: 765
    ]]
    a1.heroVisualVelocity = 0
    for n_5 = 0, 13 do
        a1.visualPositions[n_5 + 1] = ((n_5 >= #a1.positions) and 0) or (a1.positions[n_5 + 1])
        a1.liftVisuals[n_5 + 1] = 0
        a1.tapPulses[n_5 + 1] = 0
        a1.pendingClack[n_5 + 1] = 0
        a1.pieceSettled[n_5 + 1] = false
    end
end
u17.poseLivesRow = function(a1, a2, a3)
    --[[
      name: poseLivesRow
      line: 775
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        currentScoreBandBottomPx_upv_1 (copy, index: 2)
    ]]
    local v79 = math.tan(math.rad(UNBLOCK_ME_CONFIG_upv_1.camera.fieldOfView) / 2) * 22
    local v80 = v79 * 2 / math.max(a3.Y, 1)
    local v81 = a2 * CFrame.new(0, (v79 - (currentScoreBandBottomPx_upv_1() + 10) * v80) - a1.livesRowHalfHeight, -22)
    if a1.heartRow == nil then
        for n_6 = 0, #a1.heartParts - 1 do
            a1.heartParts[n_6 + 1].CFrame = v81 * CFrame.new((n_6 - (#a1.heartParts - 1) * 0.5) * 0.88, 0, 0)
        end
    else
        a1.heartRow:layout(v81.Position, 0.88, v81)
        return nil
    end
end
u17.updateHearts = function(a1)
    --[[
      name: updateHearts
      line: 792
      upvalues:
        u12 (copy, index: 1)
        u11 (copy, index: 2)
    ]]
    if a1.heartRow == nil then
        local v82 = nil
        for n_7 = 0, #a1.heartParts - 1 do
            local v83 = a1.lives <= n_7
            local v84 = a1.heartParts[n_7 + 1]
            if v83 then
                v82 = u12
            else
                v82 = u11
            end
            v84.Color = v82
            a1.heartParts[n_7 + 1].Transparency = (v83 and 0.25) or 0
        end
    else
        a1.heartRow:setRemaining(a1.lives)
        return nil
    end
end
u17.updateMoveCounter = function(a1)
    --[[
      name: updateMoveCounter
      line: 803
      upvalues:
        u15 (copy, index: 1)
        u13 (copy, index: 2)
        u14 (copy, index: 3)
    ]]
    local v85 = ("MOVES %*/%*"):format(a1.movesUsed, a1.budget)
    if v85 ~= a1.lastCounterText then
        a1.lastCounterText = v85
        a1.counterLabel.Text = v85
    end
    local v86 = a1.budget - a1.movesUsed
    local counterLabel_1 = a1.counterLabel
    local v87
    if v86 > 0 then
        if v86 > 2 then
            v87 = u14
        else
            v87 = u13
        end
    else
        v87 = u15
    end
    counterLabel_1.TextColor3 = v87
end
u17.isBusy = function(a1)
    --[[
      name: isBusy
      line: 812
    ]]
    local v88 = true
    if a1.escape == nil then
        v88 = a1.pendingReset or (not a1:isRunning())
    end
    return v88
end
u17.pieceAtCell = function(a1, a2)
    --[[
      name: pieceAtCell
      line: 815
    ]]
    for n_8 = 0, #a1.spec.pieces - 1 do
        local v89
        v89 = a1.spec.pieces[n_8 + 1]
        local v90 = a1.positions[n_8 + 1]
        if v89.horizontal and a2.row == v89.y and v90 <= a2.column and a2.column < v90 + v89.length or not v89.horizontal and a2.column == v89.x and v90 <= a2.row and a2.row < v90 + v89.length then
            return n_8
        end
    end
    return nil
end
u17.heroExitPosition = function(a1)
    --[[
      name: heroExitPosition
      line: 829
      upvalues:
        HERO_INDEX_upv_1 (copy, index: 1)
    ]]
    return a1.spec.columns - a1.spec.pieces[HERO_INDEX_upv_1 + 1].length
end
u17.positionToPlane = function(a1, a2, a3)
    --[[
      name: positionToPlane
      line: 832
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v91 = a1.spec.pieces[a2 + 1]
    local v92
    if v91.horizontal then
        v92 = UNBLOCK_ME_CONFIG_upv_1.columns
    else
        v92 = UNBLOCK_ME_CONFIG_upv_1.rows
    end
    return ((a3 + ((v91.length - 1) / 2)) - ((v92 - 1) / 2)) * UNBLOCK_ME_CONFIG_upv_1.cellPitch
end
u17.beginGrab = function(a1, a2, a3)
    --[[
      name: beginGrab
      line: 837
      upvalues:
        slideRange_upv_1 (copy, index: 1)
    ]]
    a1.grabbedIndex = a2
    a1.grabSource = a3
    a1.grabRange = slideRange_upv_1(a1.spec, a1.positions, a2)
    a1.grabTarget = a1.positions[a2 + 1]
    a1.bumpArmed = true
    a1.heldSlideDirection = 0
    a1.pieceSettled[a2 + 1] = false
    a1.context.audio.play("pop", {})
end
u17.releaseGrab = function(a1)
    --[[
      name: releaseGrab
      line: 851
    ]]
    if a1.grabbedIndex ~= nil then
        a1.pieceSettled[a1.grabbedIndex + 1] = false
    end
    a1.grabbedIndex = nil
    a1.grabSource = nil
    a1.cursor:setMovementEnabled(true)
end
u17.commitGrab = function(a1, a2)
    --[[
      name: commitGrab
      line: 859
      upvalues:
        applySlide_upv_1 (copy, index: 1)
        isSolved_upv_1 (copy, index: 2)
    ]]
    local grabbedIndex_1 = a1.grabbedIndex
    local v93 = nil
    if grabbedIndex_1 ~= nil then
        v93 = math.clamp(math.round(a2), a1.grabRange.min, a1.grabRange.max)
        a1:releaseGrab()
        if v93 ~= a1.positions[grabbedIndex_1 + 1] then
            local v94 = math.abs(v93 - a1.positions[grabbedIndex_1 + 1])
            a1.undoStack:push(a1.positions)
            a1.positions = applySlide_upv_1(a1.positions, grabbedIndex_1, v93)
            a1.movesUsed = a1.movesUsed + 1
            a1.pendingClack[grabbedIndex_1 + 1] = v94
            a1.pieceSettled[grabbedIndex_1 + 1] = false
            a1:updateMoveCounter()
            if isSolved_upv_1(a1.spec, a1.positions) then
                a1:beginEscape()
                return nil
            elseif a1.budget < a1.movesUsed then
                a1:outOfMoves()
            end
        else
            return nil
        end
    else
        return nil
    end
end
u17.tryUndo = function(a1)
    --[[
      name: tryUndo
      line: 884
    ]]
    if a1:isBusy() then
        return nil
    else
        local v95 = nil
        if a1.grabbedIndex == nil then
            v95 = a1.undoStack:pop()
            if v95 ~= nil then
                a1.positions = table.clone(v95)
                a1.movesUsed = math.max(0, a1.movesUsed - 1)
                a1:updateMoveCounter()
                for n_9 = 0, #a1.spec.pieces - 1 do
                    a1.pieceSettled[n_9 + 1] = false
                end
                a1.context.audio.play("uiBack", {})
            else
                a1.context.audio.play("buzz", {})
                return nil
            end
        else
            return nil
        end
    end
end
u17.onCellTap = function(a1, a2)
    --[[
      name: onCellTap
      line: 906
    ]]
    if not (a1:isBusy()) then
        local v96 = nil
        if a1.grabbedIndex == nil then
            v96 = a1:pieceAtCell(a2)
            if v96 ~= nil then
                a1.tapPulses[v96 + 1] = 0.35
                a1.pieceSettled[v96 + 1] = false
                a1.context.audio.play("pop", {})
                return
            end
            return nil
        end
    end
    return nil
end
u17.onPathBegan = function(a1, a2)
    --[[
      name: onPathBegan
      line: 923
    ]]
    if not (a1:isBusy()) then
        local v97 = nil
        if a1.grabbedIndex == nil then
            v97 = a1:pieceAtCell(a2)
            local v98 = nil
            if v97 ~= nil then
                a1:beginGrab(v97, "pointer")
                local v99 = a1.spec.pieces[v97 + 1]
                v98 = a1.lastPressPlane
                local v100
                if v98 == nil then
                    v100 = a1:positionToPlane(v97, a1.grabTarget)
                elseif v99.horizontal then
                    v100 = v98.X
                else
                    v100 = v98.Y
                end
                a1.grabAnchorOffset = v100 - a1:positionToPlane(v97, a1.grabTarget)
                return
            end
            return nil
        end
    end
    return nil
end
u17.onPlaneDrag = function(a1, a2)
    --[[
      name: onPlaneDrag
      line: 937
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        HERO_INDEX_upv_1 (copy, index: 2)
    ]]
    local grabbedIndex_2 = a1.grabbedIndex
    if grabbedIndex_2 ~= nil then
        local v101, v102 = nil, nil
        if a1.grabSource == "pointer" then
            v101 = a1.spec.pieces[grabbedIndex_2 + 1]
            local v103
            if v101.horizontal then
                v103 = UNBLOCK_ME_CONFIG_upv_1.columns
            else
                v103 = UNBLOCK_ME_CONFIG_upv_1.rows
            end
            local v104
            if v101.horizontal then
                v104 = a2.X
            else
                v104 = a2.Y
            end
            v104 = ((v104 - a1.grabAnchorOffset) / UNBLOCK_ME_CONFIG_upv_1.cellPitch) + ((v103 - 1) / 2) - (v101.length - 1) / 2
            if grabbedIndex_2 == HERO_INDEX_upv_1 and a1.grabRange.max == a1:heroExitPosition() and a1.grabRange.max <= v104 then
                a1:commitGrab(v104)
                return nil
            end
            local v105 = math.clamp(v104, a1.grabRange.min, a1.grabRange.max)
            v102 = v104 - v105
            a1.grabTarget = v105 + (math.sign(v102) * math.min(math.abs(v102), 1) * UNBLOCK_ME_CONFIG_upv_1.elasticOvershoot)
            if UNBLOCK_ME_CONFIG_upv_1.bumpThudExcess >= math.abs(v102) then
                if math.abs(v102) < 0.06 then
                    a1.bumpArmed = true
                end
            elseif a1.bumpArmed then
                a1.bumpArmed = false
                a1.context.audio.play("thud", {})
                a1.stage.shake(0.12)
            end
            a1.pieceSettled[grabbedIndex_2 + 1] = false
            return
        end
    end
    return nil
end
u17.onPathEnded = function(a1)
    --[[
      name: onPathEnded
      line: 973
    ]]
    if a1.grabSource == "pointer" then
        a1:commitGrab(a1.grabTarget)
    else
        return nil
    end
end
u17.onCursorActivate = function(a1, a2)
    --[[
      name: onCursorActivate
      line: 979
    ]]
    if a1:isBusy() then
        return nil
    else
        if a1.grabbedIndex ~= nil and a1.grabSource == "cursor" then
            a1:commitGrab(a1.grabTarget)
            return nil
        end
        local v106 = nil
        if a1.grabbedIndex == nil then
            v106 = a1:pieceAtCell(a2)
            if v106 ~= nil then
                a1:beginGrab(v106, "cursor")
                a1.cursor:setMovementEnabled(false)
            else
                return nil
            end
        else
            return nil
        end
    end
end
u17.onCursorAlt = function(a1)
    --[[
      name: onCursorAlt
      line: 997
    ]]
    if a1.grabbedIndex ~= nil and a1.grabSource == "cursor" then
        a1.grabTarget = a1.positions[a1.grabbedIndex + 1]
        a1:releaseGrab()
        a1.context.audio.play("uiBack", {})
        return nil
    end
    a1:tryUndo()
end
u17.pollCursorSlide = function(a1, a2)
    --[[
      name: pollCursorSlide
      line: 1010
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 2)
    ]]
    local grabbedIndex_3 = a1.grabbedIndex
    if grabbedIndex_3 ~= nil and a1.grabSource == "cursor" then
        local v107
        if a1.spec.pieces[grabbedIndex_3 + 1].horizontal then
            v107 = gamepadInput_upv_1:moveX()
        else
            v107 = -gamepadInput_upv_1:moveY()
        end
        local v108
        if math.abs(v107) <= 0.5 then
            v108 = 0
        else
            v108 = math.sign(v107)
        end
        if v108 == a1.heldSlideDirection then
            if v108 ~= 0 then
                a1.slideRepeatClock = a1.slideRepeatClock + a2
                local v109
                if a1.slideRepeatCount ~= 0 then
                    v109 = UNBLOCK_ME_CONFIG_upv_1.grabRepeatIntervalSeconds
                else
                    v109 = UNBLOCK_ME_CONFIG_upv_1.grabRepeatDelaySeconds
                end
                if v109 <= a1.slideRepeatClock then
                    a1.slideRepeatClock = 0
                    a1.slideRepeatCount = a1.slideRepeatCount + 1
                    a1:stepCursorSlide(v108)
                end
                return
            end
        else
            a1.heldSlideDirection = v108
            a1.slideRepeatClock = 0
            a1.slideRepeatCount = 0
            if v108 ~= 0 then
                a1:stepCursorSlide(v108)
            end
        end
        return nil
    end
    return nil
end
u17.stepCursorSlide = function(a1, a2)
    --[[
      name: stepCursorSlide
      line: 1040
      upvalues:
        HERO_INDEX_upv_1 (copy, index: 1)
    ]]
    local grabbedIndex_4 = a1.grabbedIndex
    local v110 = nil
    if grabbedIndex_4 ~= nil then
        v110 = math.clamp(a1.grabTarget + a2, a1.grabRange.min, a1.grabRange.max)
        local v111 = nil
        if v110 ~= a1.grabTarget then
            a1.bumpArmed = true
            a1.grabTarget = v110
            a1.pieceSettled[grabbedIndex_4 + 1] = false
            if grabbedIndex_4 == HERO_INDEX_upv_1 and v110 == a1:heroExitPosition() then
                a1:commitGrab(v110)
                return nil
            end
            a1.context.audio.play("thud", {})
            v111 = a1.spec.pieces[grabbedIndex_4 + 1]
            local v112 = math.round(v110 + ((v111.length - 1) / 2))
            local cursor_1 = a1.cursor
            local v113
            if v111.horizontal then
                v113 = {}
                v113.column = v112
                v113.row = v111.y
            else
                v113 = {}
                v113.column = v111.x
                v113.row = v112
            end
            cursor_1:setCell(v113)
        else
            if a1.bumpArmed then
                a1.bumpArmed = false
                a1.context.audio.play("thud", {})
            end
            return nil
        end
    else
        return nil
    end
end
u17.beginEscape = function(a1)
    --[[
      name: beginEscape
      line: 1082
      upvalues:
        HERO_INDEX_upv_1 (copy, index: 1)
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.context.reportScore(a1.level)
    a1.level = a1.level + 1
    local v114 = a1.visualPositions[HERO_INDEX_upv_1 + 1]
    a1.escape = {position = v114, base = v114, startSpeed = math.clamp(a1.heroVisualVelocity, UNBLOCK_ME_CONFIG_upv_1.escapeStartCellsPerSecond, UNBLOCK_ME_CONFIG_upv_1.escapeMaxStartCellsPerSecond)}
    a1.context.audio.play("whoosh", {})
end
u17.advanceBeats = function(a1, a2)
    --[[
      name: advanceBeats
      line: 1104
      upvalues:
        HERO_INDEX_upv_1 (copy, index: 1)
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 2)
    ]]
    local escape_1 = a1.escape
    if escape_1 ~= nil then
        escape_1.age = escape_1.age + a2
        escape_1.position = (escape_1.base + (escape_1.startSpeed * escape_1.age)) + (((0.5 * UNBLOCK_ME_CONFIG_upv_1.escapeAccelCellsPerSecond2) * escape_1.age) * escape_1.age)
        if not (escape_1.confettiFired) and UNBLOCK_ME_CONFIG_upv_1.escapeConfettiCells <= escape_1.position - (a1.spec.columns - a1.spec.pieces[HERO_INDEX_upv_1 + 1].length) then
            escape_1.confettiFired = true
            a1.confettiGold:Emit(14)
            a1.confettiRed:Emit(10)
            a1.confettiWhite:Emit(10)
            a1.context.audio.play("perfect", {})
            a1.context.audio.play("whoosh", {})
        end
        if UNBLOCK_ME_CONFIG_upv_1.escapeSeconds <= escape_1.age then
            a1.escape = nil
            a1:loadLevel()
        end
    else
        return nil
    end
end
u17.outOfMoves = function(a1)
    --[[
      name: outOfMoves
      line: 1131
      upvalues:
        u15 (copy, index: 1)
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 2)
    ]]
    local origin_4 = a1.stage.origin
    a1.lives = a1.lives - 1
    a1.boardResets = a1.boardResets + 1
    a1:updateHearts()
    a1.context.audio.play("buzz", {})
    if a1.lives > 0 then
        a1.popups:show(origin_4 + Vector3.new(0, 6, 0), "OUT OF MOVES", u15, 1.1)
        a1.pendingReset = true
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            UNBLOCK_ME_CONFIG_upv_1.failResetDelaySeconds,
            function()
                --[[
                  line: 1159
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
        a1.popups:show(origin_4 + Vector3.new(0, 6, 0), "OUT OF LIVES!", u15, 1.2)
        a1:setRunning(false)
        local roundToken_upv_2 = a1.roundToken
        local u19 = a1.level - 1
        task.delay(
            UNBLOCK_ME_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1146
                  upvalues:
                    roundToken_upv_2 (copy, index: 1)
                    a1 (copy, index: 2)
                    u19 (copy, index: 3)
                ]]
                if roundToken_upv_2 == a1.roundToken then
                    a1.context.endRun(u19)
                else
                    return nil
                end
            end
        )
        return nil
    end
end
u17.targetPositionFor = function(a1, a2)
    --[[
      name: targetPositionFor
      line: 1166
      upvalues:
        HERO_INDEX_upv_1 (copy, index: 1)
    ]]
    local escape_2 = a1.escape
    if escape_2 ~= nil and a2 == HERO_INDEX_upv_1 then
        return escape_2.position
    elseif a2 ~= a1.grabbedIndex then
        return a1.positions[a2 + 1]
    else
        return a1.grabTarget
    end
end
u17.advancePieces = function(a1, a2)
    --[[
      name: advancePieces
      line: 1176
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        HERO_INDEX_upv_1 (copy, index: 2)
    ]]
    local v115 = 1 - math.exp(-a2 * UNBLOCK_ME_CONFIG_upv_1.grabFollowRate)
    local v116 = 1 - math.exp(-a2 * UNBLOCK_ME_CONFIG_upv_1.snapRate)
    local v117 = math.exp(-a2 * 7)
    local v118 = 0
    local v119 = false
    v119, v118 = v119, v118
    local v120, v121, v122 = nil, nil, nil
    if v119 then
        v118 = v118 + 1
    else
        v119 = true
    end
    local v123 = nil
    if v118 < #a1.spec.pieces then
        local v124 = a1:targetPositionFor(v118)
        local v125 = ((v118 ~= a1.grabbedIndex) and 0) or (UNBLOCK_ME_CONFIG_upv_1.grabLiftStuds)
        v120 = false
        if a1.escape ~= nil then
            v120 = v118 == HERO_INDEX_upv_1
        end
        if a1.pieceSettled[v118 + 1] then
            local v126, v127, v128, v129 = nil, nil, nil, nil
            if v120 then
                v126 = a1.visualPositions[v118 + 1]
                v127 = a1.liftVisuals[v118 + 1]
                v128 = a1.tapPulses[v118 + 1] * v117
                v129 = v118 == a1.grabbedIndex
                local v130 = v124 - v126
                local v131 = math.abs(v130)
                if v129 then
                    v121 = v115
                else
                    v121 = v116
                end
                v122 = v131 * v121
                if not (v129) then
                    v122 = math.max(v122, UNBLOCK_ME_CONFIG_upv_1.snapMinCellsPerSecond * a2)
                end
                if math.abs(v130) > v122 then
                    v131 = v126 + math.sign(v130) * v122
                else
                    v131 = v124
                end
                v121 = v127 + (v125 - v127) * v115
                if v118 == HERO_INDEX_upv_1 and not (v120) and a2 > 0 then
                    a1.heroVisualVelocity = (v131 - v126) / a2
                end
                a1.visualPositions[v118 + 1] = v131
                a1.liftVisuals[v118 + 1] = v121
                local tapPulses_1 = a1.tapPulses
                local v132 = v118 + 1
                if v128 >= 0.01 then
                    v123 = v128
                else
                    v123 = 0
                end
                tapPulses_1[v132] = v123
                local v133 = math.abs(v131 - v124)
                local v134 = math.abs(v121 - v125)
                if not (v120) and v133 < 0.004 and v134 < 0.004 and a1.tapPulses[v118 + 1] == 0 then
                    a1.visualPositions[v118 + 1] = v124
                    a1.liftVisuals[v118 + 1] = v125
                    a1.pieceSettled[v118 + 1] = true
                    v123 = a1.pendingClack[v118 + 1]
                    if v123 > 0 then
                        a1.pendingClack[v118 + 1] = 0
                        a1.context.audio.play("thud", {pitch = 1.45 - (math.min(v123, 4) * 0.07)})
                    end
                end
                a1:writePiece(v118)
            end
        else
            local v126
            v126 = a1.visualPositions[v118 + 1]
            local v127
            v127 = a1.liftVisuals[v118 + 1]
            local v128
            v128 = a1.tapPulses[v118 + 1] * v117
            local v129
            v129 = v118 == a1.grabbedIndex
            local v130 = v124 - v126
            local v131 = math.abs(v130)
            if v129 then
                v121 = v115
            else
                v121 = v116
            end
            v122 = v131 * v121
            if not (v129) then
                v122 = math.max(v122, UNBLOCK_ME_CONFIG_upv_1.snapMinCellsPerSecond * a2)
            end
            if math.abs(v130) > v122 then
                v131 = v126 + math.sign(v130) * v122
            else
                v131 = v124
            end
            v121 = v127 + (v125 - v127) * v115
            if v118 == HERO_INDEX_upv_1 and not (v120) and a2 > 0 then
                a1.heroVisualVelocity = (v131 - v126) / a2
            end
            a1.visualPositions[v118 + 1] = v131
            a1.liftVisuals[v118 + 1] = v121
            local tapPulses_1 = a1.tapPulses
            local v132 = v118 + 1
            if v128 >= 0.01 then
                v123 = v128
            else
                v123 = 0
            end
            tapPulses_1[v132] = v123
            local v133 = math.abs(v131 - v124)
            local v134 = math.abs(v121 - v125)
            if not (v120) and v133 < 0.004 and v134 < 0.004 and a1.tapPulses[v118 + 1] == 0 then
                a1.visualPositions[v118 + 1] = v124
                a1.liftVisuals[v118 + 1] = v125
                a1.pieceSettled[v118 + 1] = true
                v123 = a1.pendingClack[v118 + 1]
                if v123 > 0 then
                    a1.pendingClack[v118 + 1] = 0
                    a1.context.audio.play("thud", {pitch = 1.45 - (math.min(v123, 4) * 0.07)})
                end
            end
            a1:writePiece(v118)
        end
        if v119 then
            v118 = v118 + 1
        else
            v119 = true
        end
    end
end
u17.writePiece = function(a1, a2)
    --[[
      name: writePiece
      line: 1243
      upvalues:
        UNBLOCK_ME_CONFIG_upv_1 (copy, index: 1)
        HERO_INDEX_upv_1 (copy, index: 2)
    ]]
    local v135 = a1.spec.pieces[a2 + 1]
    local v136 = a1.pieceBodies[a2 + 1]
    local v137 = a1.pieceStripes[a2 + 1]
    local v138 = a1.visualPositions[a2 + 1] + (v135.length - 1) / 2
    local v139
    if v135.horizontal then
        v139 = a1.picker:cellWorld(v138, v135.y)
    else
        v139 = a1.picker:cellWorld(v135.x, v138)
    end
    local v140 = a1.liftVisuals[a2 + 1] + a1.tapPulses[a2 + 1]
    local v141 = a1.pieceVisuals[a2]
    if v141 == nil then
        local v142 = a1.stage.origin.Y + (UNBLOCK_ME_CONFIG_upv_1.pieceHeight / 2) + v140
        v136.CFrame = CFrame.new(v139.X, v142, v139.Z)
        local v143 = v142 + UNBLOCK_ME_CONFIG_upv_1.pieceHeight / 2
        v137.CFrame = CFrame.new(v139.X, v143 + 0.06, v139.Z)
        if a2 == HERO_INDEX_upv_1 then
            local v144 = v139.X + (((v135.length * UNBLOCK_ME_CONFIG_upv_1.cellPitch) - UNBLOCK_ME_CONFIG_upv_1.pieceInset) / 2) - 0.35
            local v145 = v143 + 0.13
            a1.heroArrowA.CFrame = CFrame.new(v144 - 0.5910080652050415, v145, v139.Z - 0.46174610649424375) * CFrame.Angles(0, -0.6632251157578453, 0)
            a1.heroArrowB.CFrame = CFrame.new(v144 - 0.5910080652050415, v145, v139.Z + 0.46174610649424375) * CFrame.Angles(0, 0.6632251157578453, 0)
        end
    else
        v141:PivotTo(CFrame.new(v139.X, a1.stage.origin.Y + v140, v139.Z))
        return nil
    end
end
local tbl_8 = {}
tbl_8.UnblockMeGame = u17
return tbl_8