-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local UserInputService_upv_1 = v1.UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local TouchControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "touch-button").TouchControls
local TETRIS_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").TETRIS_STAGE_LIGHTING
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "atoms").sessionAtom
local sessionIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "session-intents").sessionIntents
local v3 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "settings-atoms")
local tetrisHandlingAtom_upv_1 = v3.tetrisHandlingAtom
local tetrisKeybindsAtom_upv_1 = v3.tetrisKeybindsAtom
local v4 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local highwaySettingsOpenAtom_upv_1 = v4.highwaySettingsOpenAtom
local publishCombo_upv_1 = v4.publishCombo
local settingsOpenAtom_upv_1 = v4.settingsOpenAtom
local tetrisControlsOpenAtom_upv_1 = v4.tetrisControlsOpenAtom
local keyboardKeyLabel_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "input-glyphs").keyboardKeyLabel
local v5 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tetris-handling")
local tetrisArrMinSeconds_upv_1 = v5.tetrisArrMinSeconds
local tetrisArrSeconds_upv_1 = v5.tetrisArrSeconds
local tetrisDasSeconds_upv_1 = v5.tetrisDasSeconds
local tetrisDcdSeconds_upv_1 = v5.tetrisDcdSeconds
local tetrisSdfIsInstant_upv_1 = v5.tetrisSdfIsInstant
local resolveTetrisKeys_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tetris-keybinds").resolveTetrisKeys
local v6 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v6.readResume
local writeResume_upv_1 = v6.writeResume
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local v7 = RuntimeLib_1.import(script, script.Parent, "tetris-assets")
local cloneTetrisKit_upv_1 = v7.cloneTetrisKit
local resolveTetrisKit_upv_1 = v7.resolveTetrisKit
local TETRIS_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tetris-config").TETRIS_CONFIG
local TETRIS_LOOK_upv_1 = RuntimeLib_1.import(script, script.Parent, "tetris-style").TETRIS_LOOK
local v8 = RuntimeLib_1.import(script, script.Parent, "tetris-pieces")
local I_KICKS_upv_1 = v8.I_KICKS
local JLSTZ_KICKS_upv_1 = v8.JLSTZ_KICKS
local kickRow_upv_1 = v8.kickRow
local O_PIECE_upv_1 = v8.O_PIECE
local PIECE_CELLS_upv_1 = v8.PIECE_CELLS
local refillBag_upv_1 = v8.refillBag
local refillFirstBag_upv_1 = v8.refillFirstBag
local ROTATE_180_KICKS_I_upv_1 = v8.ROTATE_180_KICKS_I
local ROTATE_180_KICKS_JLSTZ_upv_1 = v8.ROTATE_180_KICKS_JLSTZ
local T_CORNERS_upv_1 = v8.T_CORNERS
local T_PIECE_upv_1 = v8.T_PIECE
local TSPIN_UPGRADE_KICK_INDEX_upv_1 = v8.TSPIN_UPGRADE_KICK_INDEX
local v9 = RuntimeLib_1.import(script, script.Parent, "tetris-scoring")
local advanceBackToBack_upv_1 = v9.advanceBackToBack
local backToBackMultiplier_upv_1 = v9.backToBackMultiplier
local clearAward_upv_1 = v9.clearAward
local comboAward_upv_1 = v9.comboAward
local perfectClearAward_upv_1 = v9.perfectClearAward
local spinAward_upv_1 = v9.spinAward
local TETRIS_SCORING_upv_1 = v9.TETRIS_SCORING
local u1 = CFrame.new(0, -1000, 0)
local boardCols_upv_1 = TETRIS_CONFIG_upv_1.boardCols
local u2 = boardCols_upv_1 * TETRIS_CONFIG_upv_1.visibleRows
local u3 = Color3.fromRGB(220, 70, 70)
local u4 = Color3.fromRGB(160, 168, 192)
local u5 = Color3.fromRGB(245, 245, 255)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local u6 = Color3.fromRGB(255, 216, 102)
local u7 = Color3.fromRGB(255, 90, 100)
local u8 = Color3.fromRGB(240, 242, 250)
local u9 = Color3.fromRGB(206, 128, 255)
local u10 = Color3.fromRGB(226, 232, 248)
local u11 = Color3.fromRGB(104, 110, 132)
local u12 = Color3.fromRGB(46, 52, 74)
local function resolveKeyBindings_upv_1()
    --[[
      name: resolveKeyBindings
      line: 153
      upvalues:
        tetrisKeybindsAtom_upv_1 (copy, index: 1)
        resolveTetrisKeys_upv_1 (copy, index: 2)
    ]]
    local v10 = tetrisKeybindsAtom_upv_1()
    local tbl_2 = {}
    tbl_2.moveLeft = resolveTetrisKeys_upv_1(v10, "moveLeft")
    tbl_2.moveRight = resolveTetrisKeys_upv_1(v10, "moveRight")
    tbl_2.softDrop = resolveTetrisKeys_upv_1(v10, "softDrop")
    tbl_2.hardDrop = resolveTetrisKeys_upv_1(v10, "hardDrop")
    tbl_2.rotateCw = resolveTetrisKeys_upv_1(v10, "rotateCw")
    tbl_2.rotateCcw = resolveTetrisKeys_upv_1(v10, "rotateCcw")
    tbl_2.rotate180 = resolveTetrisKeys_upv_1(v10, "rotate180")
    tbl_2.hold = resolveTetrisKeys_upv_1(v10, "hold")
    tbl_2.pause = resolveTetrisKeys_upv_1(v10, "pause")
    return tbl_2
end
local function isAnyKeyDown_1(a1)
    --[[
      name: isAnyKeyDown
      line: 186
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    for _, value_1 in a1 do
        if not (UserInputService_upv_1:IsKeyDown(value_1)) then
            continue
        end
        return true
    end
    return false
end
local function hintLabel_1(a1, a2)
    --[[
      name: hintLabel
      line: 195
      upvalues:
        keyboardKeyLabel_upv_1 (copy, index: 1)
    ]]
    local v11 = a2[1]
    if v11 == nil then
        return a1
    end
    return (("%* (%*)"):format(a1, keyboardKeyLabel_upv_1(v11)))
end
local u13 = (function(a1, a2)
    --[[
      name: buildColorSteps
      line: 139
    ]]
    local tbl_3 = {}
    for n_1 = 0, 23 do
        table.insert(tbl_3, (a1:Lerp(a2, n_1 / 23)))
    end
    return tbl_3
end)(Color3.new(1, 1, 1), Color3.fromRGB(255, 158, 158))
local pieceColors_1 = TETRIS_LOOK_upv_1.pieceColors
local u14 = table.create(#pieceColors_1)
for key_1, value_2 in pieceColors_1 do
    u14[key_1] = value_2:Lerp(TETRIS_LOOK_upv_1.wellColor, TETRIS_LOOK_upv_1.lockedLerp)
end
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 252
    ]]
    return "TetrisGame"
end
tbl_5.__index = BaseWorldGame_upv_1
local u15 = setmetatable(tbl_4, tbl_5)
u15.__index = u15
u15.new = function(...)
    --[[
      name: new
      line: 258
      upvalues:
        u15 (ref, index: 1)
    ]]
    local v12 = setmetatable({}, u15)
    return v12:constructor(...) or v12
end
local function resolveHandlingTimings_upv_1()
    --[[
      name: resolveHandlingTimings
      line: 174
      upvalues:
        tetrisHandlingAtom_upv_1 (copy, index: 1)
        tetrisDasSeconds_upv_1 (copy, index: 2)
        tetrisArrSeconds_upv_1 (copy, index: 3)
        tetrisArrMinSeconds_upv_1 (copy, index: 4)
        tetrisDcdSeconds_upv_1 (copy, index: 5)
        tetrisSdfIsInstant_upv_1 (copy, index: 6)
    ]]
    local v13 = tetrisHandlingAtom_upv_1()
    local tbl_6 = {}
    tbl_6.dasSeconds = tetrisDasSeconds_upv_1(v13)
    tbl_6.arrSeconds = tetrisArrSeconds_upv_1(v13)
    tbl_6.arrMinSeconds = tetrisArrMinSeconds_upv_1(v13)
    tbl_6.dcdSeconds = tetrisDcdSeconds_upv_1(v13)
    tbl_6.sdfRate = v13.sdfCellsPerSecond
    tbl_6.sdfInstant = tetrisSdfIsInstant_upv_1(v13)
    return tbl_6
end
u15.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 262
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        TETRIS_LOOK_upv_1 (copy, index: 2)
        boardCols_upv_1 (copy, index: 3)
        TETRIS_CONFIG_upv_1 (copy, index: 4)
        resolveKeyBindings_upv_1 (copy, index: 5)
        resolveHandlingTimings_upv_1 (copy, index: 6)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.gridParts = {}
    a1.activeParts = {}
    a1.ghostParts = {}
    a1.previewParts = {}
    a1.flashBars = {}
    a1.clearBursts = {}
    a1.style = TETRIS_LOOK_upv_1
    a1.kitReplicaParts = {}
    a1.duelFramedViewport = Vector2.zero
    a1.dropTrailRemaining = 0
    a1.perfectClearFlashRemaining = 0
    a1.replicaPiece = {}
    a1.replicaDecor = {}
    a1.replicaOffsetX = 0
    a1.replicaPieceTargets = {}
    a1.replicaFlashRemaining = 0
    a1.replicaFilledCount = -1
    a1.board = table.create(boardCols_upv_1 * TETRIS_CONFIG_upv_1.totalRows)
    a1.pieceType = 0
    a1.pieceRotation = 0
    a1.pieceCol = 4
    a1.pieceRow = 20
    a1.lowestRowReached = 20
    a1.bag = {}
    a1.nextQueue = {}
    a1.holdType = -1
    a1.holdUsed = false
    a1.gravityProgress = 0
    a1.lockTimer = 0
    a1.lockResets = 0
    a1.dasDirection = 0
    a1.dasTimer = 0
    a1.arrAccumulator = 0
    a1.arrHoldSeconds = 0
    a1.dasCutRemaining = 0
    a1.prevLeft = false
    a1.prevRight = false
    a1.keys = resolveKeyBindings_upv_1()
    a1.handling = resolveHandlingTimings_upv_1()
    a1.pendingNudge = 0
    a1.pendingRotateCw = 0
    a1.pendingRotateCcw = 0
    a1.pendingRotate180 = 0
    a1.pendingHardDrop = false
    a1.pendingHold = false
    a1.runStartClock = 0
    a1.touchOrigin = Vector2.zero
    a1.touchAxis = "none"
    a1.touchAccumX = 0
    a1.touchDownTravel = 0
    a1.touchSoftDropHeld = false
    a1.score = 0
    a1.reportedScore = -1
    a1.lines = 0
    a1.level = 1
    a1.combo = 0
    a1.backToBackLink = 0
    a1.lastMoveWasRotation = false
    a1.lastKickIndex = -1
    a1.dangerActive = false
    a1.dangerIntensity = 0
    a1.dangerPulseClock = 0
    a1.dangerBeatClock = 0
    a1.dangerDubPlayed = true
    a1.boardDirty = false
    a1.pieceDirty = false
    a1.panelsDirty = false
    a1.flashRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.bagSeed = 1
    a1.bagRandom = Random.new()
end
u15.buildScene = function(a1)
    --[[
      name: buildScene
      line: 338
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
        resolveTetrisKit_upv_1 (copy, index: 3)
        cloneTetrisKit_upv_1 (copy, index: 4)
        makeSmoothPart_upv_1 (copy, index: 5)
        u3 (copy, index: 6)
        u13 (copy, index: 7)
        u5 (copy, index: 8)
        u1 (copy, index: 9)
        u2 (copy, index: 10)
        makeStagePart_upv_1 (copy, index: 11)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 12)
        u4 (copy, index: 13)
        Players_upv_1 (copy, index: 14)
        u10 (copy, index: 15)
        TouchControls_upv_1 (copy, index: 16)
        keyboardKeyLabel_upv_1 (copy, index: 17)
        PopupTextPool_upv_1 (copy, index: 18)
        UserInputService_upv_1 (copy, index: 19)
        subscribe_upv_1 (copy, index: 20)
        tetrisKeybindsAtom_upv_1 (copy, index: 21)
        resolveKeyBindings_upv_1 (copy, index: 22)
        tetrisHandlingAtom_upv_1 (copy, index: 23)
        resolveHandlingTimings_upv_1 (copy, index: 24)
    ]]
    local container_1 = a1.stage.container
    a1.stage.camera.FieldOfView = TETRIS_CONFIG_upv_1.wellFieldOfView
    a1.stage.setFrameCenter(Vector2.new(0, TETRIS_CONFIG_upv_1.boardCenterY))
    a1.stage.setFrameWidthFloor((math.max(math.abs(TETRIS_CONFIG_upv_1.holdPanelX), math.abs(TETRIS_CONFIG_upv_1.nextPanelX)) + 3) * 2)
    local v14 = boardCols_upv_1 * TETRIS_CONFIG_upv_1.cellSize
    local v15 = TETRIS_CONFIG_upv_1.visibleRows * TETRIS_CONFIG_upv_1.cellSize
    local v16 = a1.stage.origin + Vector3.new(0, TETRIS_CONFIG_upv_1.boardCenterY, -1.6)
    local v17 = resolveTetrisKit_upv_1()
    local v18
    if v17 == nil then
        v18 = v17
    else
        v18 = v17:FindFirstChild("Lighting")
    end
    a1.authoredLightingFolder = v18
    local v19, v19
    if a1:isDuel() then
        v19 = {}
        v19.isLeft = a1:isLeftDuelist()
    else
        v19 = nil
    end
    local v20
    if v17 == nil then
        v20 = nil
    else
        v20 = cloneTetrisKit_upv_1(v17, container_1, v16, v19, TETRIS_CONFIG_upv_1.holdPanelX)
    end
    if v20 == nil then
        a1:buildFallbackStage(container_1, v14, v15)
    else
        a1.kitReplicaParts = v20.dressing
    end
    local v21 = nil
    if v20 == nil then
        v21 = v20
    else
        v21 = v21.duelGap
    end
    if v21 ~= nil then
        local v22 = nil
        if v19 == nil then
            v22 = v19
        else
            v22 = v22.isLeft
        end
        local v23
        if v22 ~= false then
            v23 = v20.duelGap
        else
            v23 = -v20.duelGap
        end
        a1.duelOpponentOffsetX = v23
        a1.duelFrameWidth = v20.duelFrameWidth
        a1:applyDuelCamera()
    end
    local v24 = makeSmoothPart_upv_1(container_1)
    v24.Color = u3
    v24.Transparency = 0.68
    v24.Size = Vector3.new(v14, 0.18, 0.4)
    v24.CFrame = CFrame.new(a1:cellPosition(4.5, TETRIS_CONFIG_upv_1.visibleRows - TETRIS_CONFIG_upv_1.dangerRows) + Vector3.new(0, -TETRIS_CONFIG_upv_1.cellSize / 2, -0.7))
    a1.dangerEffect = Instance.new("ColorCorrectionEffect")
    a1.dangerEffect.Enabled = false
    a1.dangerEffect.TintColor = u13[1]
    a1.dangerEffect.Parent = a1.stage.camera
    a1.context.janitor:Add(a1.dangerEffect)
    a1.perfectClearFlash = makeSmoothPart_upv_1(container_1)
    a1.perfectClearFlash.Material = Enum.Material.Neon
    a1.perfectClearFlash.Color = u5
    a1.perfectClearFlash.Size = Vector3.new(v14, v15, 0.5)
    a1.perfectClearFlash.Transparency = 1
    a1.perfectClearFlash.CFrame = u1
    local v25 = 0
    local v26 = false
    while true do
        if v26 then
            v25 = v25 + 1
        else
            v26 = true
        end
        if v25 >= u2 then
            break
        end
        local v27 = makeStagePart_upv_1(container_1)
        v27.Size = Vector3.new(TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize)
        v27.Transparency = 1
        v27.CFrame = CFrame.new(a1:cellPosition(v25 % boardCols_upv_1, math.floor(v25 / boardCols_upv_1)))
        table.insert(a1.gridParts, v27)
    end
    for v28 = 0, 3 do
        local v29 = makeStagePart_upv_1(container_1)
        v29.Size = Vector3.new(TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize)
        v29.CFrame = u1
        table.insert(a1.activeParts, v29)
        local v30 = makeSmoothPart_upv_1(container_1)
        v30.Size = Vector3.new(TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize, 0.6)
        v30.Transparency = 0.5
        v30.CFrame = u1
        table.insert(a1.ghostParts, v30)
        local v31 = makeSmoothPart_upv_1(container_1)
        v31.Material = Enum.Material.Neon
        v31.Color = u5
        v31.Size = Vector3.new(v14, TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize + 0.2)
        v31.Transparency = 1
        v31.CFrame = u1
        table.insert(a1.flashBars, v31)
        local v32 = Instance.new("ParticleEmitter")
        v32.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
        v32.Rate = 0
        v32.Lifetime = NumberRange.new(0.25, 0.55)
        v32.Speed = NumberRange.new(8, 18)
        v32.SpreadAngle = Vector2.new(180, 180)
        v32.Size = NumberSequence.new(0.4)
        v32.LightEmission = 0.85
        v32.Color = ColorSequence.new(u5)
        v32.Rotation = NumberRange.new(0, 90)
        v32.RotSpeed = NumberRange.new(-180, 180)
        v32.Parent = v31
        table.insert(a1.clearBursts, v32)
    end
    a1.dropDustAnchor = makeSmoothPart_upv_1(container_1)
    a1.dropDustAnchor.Transparency = 1
    a1.dropDustAnchor.Size = Vector3.new(TETRIS_CONFIG_upv_1.cellSize * 2, 0.4, 1)
    a1.dropDustAnchor.CFrame = u1
    a1.dropDust = Instance.new("ParticleEmitter")
    a1.dropDust.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.dropDust.Rate = 0
    a1.dropDust.Lifetime = NumberRange.new(0.2, 0.45)
    a1.dropDust.Speed = NumberRange.new(6, 14)
    a1.dropDust.SpreadAngle = Vector2.new(70, 70)
    a1.dropDust.EmissionDirection = Enum.NormalId.Top
    a1.dropDust.Acceleration = Vector3.new(0, -40, 0)
    a1.dropDust.Size = NumberSequence.new(0.35)
    a1.dropDust.LightEmission = 0.6
    a1.dropDust.Color = ColorSequence.new(Color3.fromRGB(220, 224, 240))
    a1.dropDust.Parent = a1.dropDustAnchor
    a1.dropTrail = makeSmoothPart_upv_1(container_1)
    a1.dropTrail.Material = Enum.Material.Neon
    a1.dropTrail.Transparency = 1
    a1.dropTrail.CFrame = u1
    v25 = makeSmoothPart_upv_1(container_1)
    v25.Transparency = 1
    v25.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v25.CFrame = CFrame.new(a1:panelCenter(1) + Vector3.new(0, 3.0999999046325684, 0))
    local v28 = Instance.new("BillboardGui")
    v28.Size = UDim2.fromScale(5.4, 1.2)
    v28.AlwaysOnTop = true
    v28.Parent = v25
    local v33 = Instance.new("TextLabel")
    v33.BackgroundTransparency = 1
    v33.Size = UDim2.fromScale(1, 1)
    v33.Font = Enum.Font.GothamBold
    v33.TextScaled = true
    v33.TextColor3 = u4
    v33.TextStrokeTransparency = 0.7
    v33.Text = "NEXT"
    v33.Parent = v28
    for v34 = 0, 1 + TETRIS_CONFIG_upv_1.nextQueueSize - 1 do
        for _ = 0, 3 do
            local v35 = makeStagePart_upv_1(container_1)
            local v36 = TETRIS_CONFIG_upv_1.cellSize * TETRIS_CONFIG_upv_1.previewScale
            v35.Size = Vector3.new(v36, v36, v36)
            v35.CFrame = u1
            table.insert(a1.previewParts, v35)
        end
    end
    local v37 = makeSmoothPart_upv_1(container_1)
    v37.Transparency = 1
    v37.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    v37.CFrame = CFrame.new(a1:panelCenter(0) + Vector3.new(0, 3.4000000953674316, 0))
    local v34 = Instance.new("BillboardGui")
    v34.Size = UDim2.fromScale(5.4, 1.5)
    v34.AlwaysOnTop = true
    v34.Active = true
    v34.LightInfluence = 0
    v34.Adornee = v37
    v34.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    a1.context.janitor:Add(v34)
    a1.holdButton = Instance.new("TextButton")
    a1.holdButton.Size = UDim2.fromScale(1, 1)
    a1.holdButton.BackgroundColor3 = a1.style.panelColor
    a1.holdButton.BackgroundTransparency = 0.15
    a1.holdButton.BorderSizePixel = 0
    a1.holdButton.Font = Enum.Font.GothamBold
    a1.holdButton.TextScaled = true
    a1.holdButton.TextColor3 = u10
    a1.holdButton.Text = "\226\135\132 HOLD"
    local v38 = Instance.new("UICorner")
    v38.CornerRadius = UDim.new(0.25, 0)
    v38.Parent = a1.holdButton
    local v39 = Instance.new("UIPadding")
    v39.PaddingTop = UDim.new(0.14, 0)
    v39.PaddingBottom = UDim.new(0.14, 0)
    v39.Parent = a1.holdButton
    a1.holdButtonStroke = Instance.new("UIStroke")
    a1.holdButtonStroke.Color = a1.style.wallColor
    a1.holdButtonStroke.Thickness = 2
    a1.holdButtonStroke.Parent = a1.holdButton
    a1.holdButton.Parent = v34
    a1.context.janitor:Add(
        a1.holdButton.Activated:Connect(
            function()
                --[[
                  line: 572
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if not (a1.dead) and a1:isRunning() then
                    a1.pendingHold = true
                else
                    return nil
                end
            end
        )
    )
    local v40 = TouchControls_upv_1.new({})
    a1.context.janitor:Add(v40, "destroy")
    local tbl_7 = {}
    local v41 = a1.keys.hold[1]
    tbl_7.desktopText = v41 == nil and "\226\135\132 SWITCH" or ("\226\135\132 SWITCH (%*)"):format(keyboardKeyLabel_upv_1(v41))
    tbl_7.anchorPoint = Vector2.new(1, 1)
    tbl_7.position = a1:touchStackPosition(0)
    tbl_7.look = a1:touchButtonLook()
    tbl_7.disabledLook = a1:touchHoldSpentLook()
    tbl_7.onActivated = function()
        --[[
          name: onActivated
          line: 601
          upvalues:
            a1 (copy, index: 1)
        ]]
        if not (a1.dead) and a1:isRunning() then
            a1.pendingHold = true
        else
            return nil
        end
    end
    a1.holdTouchButton = v40:addButton(tbl_7)
    local tbl_8 = {}
    local v43 = a1.keys.hardDrop[1]
    tbl_8.desktopText = v43 == nil and "\226\134\147 DROP" or ("\226\134\147 DROP (%*)"):format(keyboardKeyLabel_upv_1(v43))
    tbl_8.anchorPoint = Vector2.new(1, 1)
    tbl_8.position = a1:touchStackPosition(1)
    tbl_8.look = a1:touchButtonLook()
    tbl_8.onActivated = function()
        --[[
          name: onActivated
          line: 620
          upvalues:
            a1 (copy, index: 1)
        ]]
        if not (a1.dead) and a1:isRunning() then
            a1.pendingHardDrop = true
        else
            return nil
        end
    end
    a1.dropTouchButton = v40:addButton(tbl_8)
    local tbl_9 = {}
    local v45 = a1.keys.rotateCw[1]
    tbl_9.desktopText = v45 == nil and "\240\159\148\132 ROTATE" or ("\240\159\148\132 ROTATE (%*)"):format(keyboardKeyLabel_upv_1(v45))
    tbl_9.anchorPoint = Vector2.new(1, 1)
    tbl_9.position = a1:touchStackPosition(2)
    tbl_9.look = a1:touchButtonLook()
    tbl_9.onActivated = function()
        --[[
          name: onActivated
          line: 640
          upvalues:
            a1 (copy, index: 1)
        ]]
        if not (a1.dead) and a1:isRunning() then
            a1.pendingRotateCw = a1.pendingRotateCw + 1
        else
            return nil
        end
    end
    a1.rotateTouchButton = v40:addButton(tbl_9)
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 654
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPressBegan(a2, a3)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.drag:Connect(
            function(a4, a5)
                --[[
                  line: 657
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onDrag(a4, a5)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 660
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onPressEnded(a7, a8)
            end
        )
    )
    a1.context.janitor:Add(
        UserInputService_upv_1.InputBegan:Connect(
            function(a9, a10)
                --[[
                  line: 663
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onInputBegan(a9, a10)
            end
        )
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            tetrisKeybindsAtom_upv_1,
            function()
                --[[
                  line: 669
                  upvalues:
                    a1 (copy, index: 1)
                    resolveKeyBindings_upv_1 (copy, index: 2)
                    keyboardKeyLabel_upv_1 (copy, index: 3)
                ]]
                a1.keys = resolveKeyBindings_upv_1()
                local holdTouchButton_1 = a1.holdTouchButton
                if holdTouchButton_1 ~= nil then
                    local v47 = a1.keys.hold[1]
                    local v48 = ((v47 == nil) and "\226\135\132 SWITCH") or (("\226\135\132 SWITCH (%*)"):format(keyboardKeyLabel_upv_1(v47)))
                    holdTouchButton_1:setDesktopText(v48)
                end
                local dropTouchButton_1 = a1.dropTouchButton
                if dropTouchButton_1 ~= nil then
                    local v49 = a1.keys.hardDrop[1]
                    local v50 = ((v49 == nil) and "\226\134\147 DROP") or (("\226\134\147 DROP (%*)"):format(keyboardKeyLabel_upv_1(v49)))
                    dropTouchButton_1:setDesktopText(v50)
                end
                local rotateTouchButton_1 = a1.rotateTouchButton
                if rotateTouchButton_1 ~= nil then
                    local v51 = a1.keys.rotateCw[1]
                    local v52 = ((v51 == nil) and "\240\159\148\132 ROTATE") or (("\240\159\148\132 ROTATE (%*)"):format(keyboardKeyLabel_upv_1(v51)))
                    rotateTouchButton_1:setDesktopText(v52)
                end
                a1:seedKeyEdges()
            end
        ),
        true
    )
    a1.context.janitor:Add(
        subscribe_upv_1(
            tetrisHandlingAtom_upv_1,
            function()
                --[[
                  line: 689
                  upvalues:
                    a1 (copy, index: 1)
                    resolveHandlingTimings_upv_1 (copy, index: 2)
                ]]
                a1.handling = resolveHandlingTimings_upv_1()
            end
        ),
        true
    )
    a1:applyLook()
end
u15.onInputBegan = function(a1, a2, a3)
    --[[
      name: onInputBegan
      line: 694
      upvalues:
        sessionIntents_upv_1 (copy, index: 1)
    ]]
    local v53 = nil
    if not a3 then
        v53 = a2.KeyCode
        if table.find(a1.keys.pause, v53) == nil then
            if not (a1.dead) and a1:isRunning() then
                if os.clock() - a1.runStartClock >= 0.25 then
                    if table.find(a1.keys.rotateCw, v53) == nil and v53 ~= Enum.KeyCode.ButtonA then
                        if table.find(a1.keys.rotateCcw, v53) == nil and v53 ~= Enum.KeyCode.ButtonX then
                            if table.find(a1.keys.rotate180, v53) == nil then
                                if table.find(a1.keys.hardDrop, v53) == nil and v53 ~= Enum.KeyCode.DPadUp then
                                    if table.find(a1.keys.hold, v53) ~= nil or v53 == Enum.KeyCode.ButtonY then
                                        a1.pendingHold = true
                                    end
                                    return
                                end
                                a1.pendingHardDrop = true
                            else
                                a1.pendingRotate180 = a1.pendingRotate180 + 1
                            end
                            return
                        end
                        a1.pendingRotateCcw = a1.pendingRotateCcw + 1
                        return
                    end
                    a1.pendingRotateCw = a1.pendingRotateCw + 1
                    return
                end
                return nil
            end
        elseif a1:canTogglePause() then
            sessionIntents_upv_1.togglePause:Fire()
        end
    end
    return nil
end
u15.canTogglePause = function(a1)
    --[[
      name: canTogglePause
      line: 731
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        settingsOpenAtom_upv_1 (copy, index: 3)
        highwaySettingsOpenAtom_upv_1 (copy, index: 4)
        tetrisControlsOpenAtom_upv_1 (copy, index: 5)
    ]]
    local v54 = nil
    if UserInputService_upv_1:GetFocusedTextBox() == nil then
        v54 = sessionAtom_upv_1()
        if v54 ~= nil and v54.mode ~= "match" and v54.phase == "playing" then
            local v55 = not settingsOpenAtom_upv_1() and (not highwaySettingsOpenAtom_upv_1() and (not tetrisControlsOpenAtom_upv_1()))
            return v55
        end
    end
    return false
end
u15.buildFallbackStage = function(a1, a2, a3, a4)
    --[[
      name: buildFallbackStage
      line: 743
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
    ]]
    makeFrontalBackdrop_upv_1(a1.stage, Color3.fromRGB(10, 11, 17), Enum.Material.SmoothPlastic)
    local v56 = makeSmoothPart_upv_1(a2)
    v56.Color = a1.style.wellColor
    v56.Size = Vector3.new(a3 + 2, a4 + 2, 1)
    v56.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, TETRIS_CONFIG_upv_1.boardCenterY, -1.6))
end
u15.applyLook = function(a1)
    --[[
      name: applyLook
      line: 752
      upvalues:
        readLightingFolderProfile_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        TETRIS_STAGE_LIGHTING_upv_1 (copy, index: 3)
    ]]
    local style_1 = a1.style
    local v57
    if style_1.studdedBlocks then
        v57 = Enum.SurfaceType.Studs
    else
        v57 = Enum.SurfaceType.Smooth
    end
    local _ = nil
    local v58 = nil
    for v59, value_3 in a1.gridParts do
        value_3.TopSurface = v57
        value_3.BackSurface = v57
    end
    local v60 = nil
    local v61 = nil
    for v62, value_4 in a1.activeParts do
        value_4.TopSurface = v57
        value_4.BackSurface = v57
    end
    local v63 = nil
    local v64 = nil
    for v65, value_5 in a1.previewParts do
        value_5.TopSurface = v57
        value_5.BackSurface = v57
    end
    for v66, value_6 in a1.ghostParts do
        value_6.Transparency = style_1.ghostTransparency
    end
    a1.holdButton.BackgroundColor3 = style_1.panelColor
    a1.boardDirty = true
    a1.pieceDirty = true
    a1.panelsDirty = true
    local setLighting_1 = a1.stage.setLighting
    if a1.authoredLightingFolder == nil then
        v58 = TETRIS_STAGE_LIGHTING_upv_1
    else
        v58 = readLightingFolderProfile_upv_1(a1.authoredLightingFolder, tbl_upv_1, TETRIS_STAGE_LIGHTING_upv_1)
    end
    setLighting_1(v58)
end
u15.resetRound = function(a1)
    --[[
      name: resetRound
      line: 778
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        refillFirstBag_upv_1 (copy, index: 4)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.bagSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    a1.bagRandom = Random.new(a1.bagSeed)
    a1.runStartClock = os.clock()
    a1.dead = false
    for n_2 = 0, (boardCols_upv_1 * TETRIS_CONFIG_upv_1.totalRows) - 1 do
        a1.board[n_2 + 1] = 0
    end
    table.clear(a1.bag)
    refillFirstBag_upv_1(a1.bag, a1.bagRandom)
    table.clear(a1.nextQueue)
    while #a1.nextQueue < TETRIS_CONFIG_upv_1.nextQueueSize do
        table.insert(a1.nextQueue, (a1:drawFromBag()))
    end
    a1.holdType = -1
    a1.holdUsed = false
    a1.score = 0
    a1.reportedScore = -1
    a1.lines = 0
    a1.level = 1
    a1.combo = 0
    a1.backToBackLink = 0
    a1.dasDirection = 0
    a1.dasTimer = 0
    a1.arrAccumulator = 0
    a1.arrHoldSeconds = 0
    a1.dasCutRemaining = 0
    a1.gravityProgress = 0
    a1.flashRemaining = 0
    a1:resetPerfectClearFlash()
    a1:resetDangerState()
    a1:clearPendingInput()
    a1:seedKeyEdges()
    a1:restoreGridParts()
    a1:spawnPiece(a1:takeNextPiece())
    a1.boardDirty = true
    a1.panelsDirty = true
    a1.context.reportScore(0)
end
u15.captureRound = function(a1)
    --[[
      name: captureRound
      line: 823
      upvalues:
        boardCols_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
        writeResume_upv_1 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    else
        local tbl_upv_10 = {}
        for n_3 = 0, (boardCols_upv_1 * TETRIS_CONFIG_upv_1.totalRows) - 1 do
            table.insert(tbl_upv_10, (string.format("%x", math.clamp(math.floor(a1.board[n_3 + 1]), 0, 15))))
        end
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 832
                  upvalues:
                    a1 (copy, index: 1)
                    tbl_upv_10 (copy, index: 2)
                ]]
                a2:int(a1.score):int(a1.lines):int(a1.level):int(a1.combo):int(a1.backToBackLink)
                a2:int(a1.pieceType):int(a1.pieceRotation):int(a1.pieceCol):int(a1.pieceRow)
                a2:int(a1.lowestRowReached):int(a1.holdType):bool(a1.holdUsed)
                a2:num(a1.gravityProgress):num(a1.lockTimer):int(a1.lockResets)
                a2:bool(a1.lastMoveWasRotation):int(a1.lastKickIndex)
                a2:str(table.concat(tbl_upv_10, ""))
                a2:int(#a1.nextQueue)
                for _, value_7 in a1.nextQueue do
                    a2:int(value_7)
                end
                a2:int(#a1.bag)
                for _, value_8 in a1.bag do
                    a2:int(value_8)
                end
            end
        )
    end
end
u15.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 849
      upvalues:
        boardCols_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
        readResume_upv_1 (copy, index: 3)
        deriveSeed_upv_1 (copy, index: 4)
    ]]
    local u16 = boardCols_upv_1 * TETRIS_CONFIG_upv_1.totalRows
    local v59 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 851
              upvalues:
                u16 (copy, index: 1)
            ]]
            local tbl_11 = {}
            tbl_11.score = a3:int()
            tbl_11.lines = a3:int()
            tbl_11.level = a3:int()
            tbl_11.combo = a3:int()
            tbl_11.backToBackLink = a3:int()
            tbl_11.pieceType = a3:int()
            tbl_11.pieceRotation = a3:int()
            tbl_11.pieceCol = a3:int()
            tbl_11.pieceRow = a3:int()
            tbl_11.lowestRowReached = a3:int()
            tbl_11.holdType = a3:int()
            tbl_11.holdUsed = a3:bool()
            tbl_11.gravityProgress = a3:num()
            tbl_11.lockTimer = a3:num()
            tbl_11.lockResets = a3:int()
            tbl_11.lastMoveWasRotation = a3:bool()
            tbl_11.lastKickIndex = a3:int()
            tbl_11.cells = a3:str()
            if #tbl_11.cells ~= u16 then
                error("tetris: board size mismatch")
            end
            local v60 = a3:int()
            local tbl_12 = {}
            local v61 = 0
            local tbl_13 = false
            tbl_13, v61 = tbl_13, v61
            while true do
                if tbl_13 then
                    v61 = v61 + 1
                else
                    tbl_13 = true
                end
                if v61 >= v60 then
                    break
                end
                table.insert(tbl_12, (a3:int()))
            end
            v61 = a3:int()
            tbl_13 = {}
            local v62 = 0
            local v63 = false
            v63, v62 = v63, v62
            while true do
                if v63 then
                    v62 = v62 + 1
                else
                    v63 = true
                end
                if v62 >= v61 then
                    break
                end
                table.insert(tbl_13, (a3:int()))
            end
            v62 = table.clone(tbl_11)
            setmetatable(v62, nil)
            v62.nextQueue = tbl_12
            v62.bag = tbl_13
            return v62
        end
    )
    if v59 ~= nil and v59.pieceType >= 0 and v59.pieceType <= 6 and #v59.nextQueue ~= 0 then
        local v64 = 0
        local v65 = false
        local v66 = nil
        if v65 then
            v64 = v64 + 1
        else
            v65 = true
        end
        while v64 < u16 do
            v66 = tonumber(string.sub(v59.cells, v64 + 1, v64 + 1), 16)
            if v66 == nil then
                v66 = 0
            end
            a1.board[v64 + 1] = math.clamp(v66, 0, 15)
            if v65 then
                v64 = v64 + 1
            else
                v65 = true
            end
        end
        a1.score = a2.score
        a1.reportedScore = -1
        a1.lines = v59.lines
        a1.level = v59.level
        a1.combo = v59.combo
        a1.backToBackLink = v59.backToBackLink
        a1.pieceType = v59.pieceType
        a1.pieceRotation = v59.pieceRotation
        a1.pieceCol = v59.pieceCol
        a1.pieceRow = v59.pieceRow
        a1.lowestRowReached = v59.lowestRowReached
        a1.holdType = v59.holdType
        a1.holdUsed = v59.holdUsed
        a1.gravityProgress = v59.gravityProgress
        a1.lockTimer = v59.lockTimer
        a1.lockResets = v59.lockResets
        a1.lastMoveWasRotation = v59.lastMoveWasRotation
        a1.lastKickIndex = v59.lastKickIndex
        table.clear(a1.nextQueue)
        for _, value_9 in v59.nextQueue do
            table.insert(a1.nextQueue, value_9)
        end
        table.clear(a1.bag)
        for _, value_10 in v59.bag do
            table.insert(a1.bag, value_10)
        end
        a1.dead = false
        a1.runStartClock = os.clock()
        a1.roundToken = a1.roundToken + 1
        a1.dasDirection = 0
        a1.dasTimer = 0
        a1.arrAccumulator = 0
        a1.arrHoldSeconds = 0
        a1.dasCutRemaining = 0
        a1.flashRemaining = 0
        a1:resetPerfectClearFlash()
        a1:resetDangerState()
        a1:clearPendingInput()
        a1:seedKeyEdges()
        a1:restoreGridParts()
        a1.bagRandom = Random.new(deriveSeed_upv_1(a1.bagSeed, a1.lines + 1))
        a1.boardDirty = true
        a1.pieceDirty = true
        a1.panelsDirty = true
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u15.revive = function(a1)
    --[[
      name: revive
      line: 997
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.runStartClock = os.clock()
    a1:restoreGridParts()
    for n_4 = TETRIS_CONFIG_upv_1.reviveKeepRows, TETRIS_CONFIG_upv_1.totalRows - 1 do
        for n_5 = 0, boardCols_upv_1 - 1 do
            a1.board[((n_4 * boardCols_upv_1) + n_5) + 1] = 0
        end
    end
    a1.combo = 0
    a1.backToBackLink = 0
    a1.holdUsed = false
    a1.dasCutRemaining = 0
    a1.gravityProgress = 0
    a1.flashRemaining = 0
    a1:resetPerfectClearFlash()
    a1:resetDangerState()
    a1:clearPendingInput()
    a1:seedKeyEdges()
    a1:spawnPiece(a1:takeNextPiece())
    a1.boardDirty = true
    a1.panelsDirty = true
    a1:setRunning(true)
end
u15.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 1023
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        lerp_upv_1 (copy, index: 4)
        TETRIS_SCORING_upv_1 (copy, index: 5)
    ]]
    if a1.dead then
        return nil
    else
        if a1.dangerActive then
            a1:updateDangerHeartbeat(a2)
        end
        local v67 = a1:isShiftLeftHeld()
        local v68 = a1:isShiftRightHeld()
        local v69 = nil
        if not (a1.touchSoftDropHeld) then
            for key_2, v70 in a1.keys.softDrop do
                if UserInputService_upv_1:IsKeyDown(v70) then
                    v69 = true
                else
                    continue
                end
            end
            if not (v69) and not (UserInputService_upv_1:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.DPadDown)) then
                if gamepadInput_upv_1:leftY() < -0.5 then
                    local _ = true
                else
                    local _ = false
                end
            end
        end
        a1.prevLeft = v67
        a1.prevRight = v68
        if a1.pendingHold then
            a1.pendingHold = false
            a1:tryHold()
        end
        while a1.pendingRotateCw > 0 do
            a1.pendingRotateCw = a1.pendingRotateCw - 1
            a1:tryRotate(1)
        end
        while a1.pendingRotateCcw > 0 do
            a1.pendingRotateCcw = a1.pendingRotateCcw - 1
            a1:tryRotate(-1)
        end
        while a1.pendingRotate180 > 0 do
            a1.pendingRotate180 = a1.pendingRotate180 - 1
            a1:tryRotate180()
        end
        local v72 = nil
        while a1.pendingNudge ~= 0 do
            v72 = math.sign(a1.pendingNudge)
            a1.pendingNudge = a1.pendingNudge - v72
            a1:tryShift(v72)
        end
        if v67 then
            a1:tryShift(-1)
            a1.dasDirection = -1
            a1.dasTimer = 0
            a1.arrAccumulator = 0
            a1.arrHoldSeconds = 0
        end
        if v68 then
            a1:tryShift(1)
            a1.dasDirection = 1
            a1.dasTimer = 0
            a1.arrAccumulator = 0
            a1.arrHoldSeconds = 0
        end
        if a1.dasDirection == -1 and (v67) then
            v72 = v67
        else
            local v73 = false
            if a1.dasDirection ~= 1 then
                v72 = v73
            else
                v72 = v68
            end
        end
        if a1.dasDirection ~= 0 and not (v72) then
            if a1.dasDirection == -1 and (v68) then
                a1.dasDirection = 1
                a1.dasTimer = 0
                a1.arrAccumulator = 0
                a1.arrHoldSeconds = 0
            elseif a1.dasDirection == 1 and (v67) then
                a1.dasDirection = -1
                a1.dasTimer = 0
                a1.arrAccumulator = 0
                a1.arrHoldSeconds = 0
            else
                a1.dasDirection = 0
            end
        end
        local v74, v70 = nil, nil
        if a1.dasDirection ~= 0 then
            v74 = a1.handling
            local key_2 = v74.dasSeconds <= a1.dasTimer
            v70 = key_2 or (a1.dasCutRemaining <= 0)
            if a1.dasCutRemaining > 0 then
                a1.dasCutRemaining = a1.dasCutRemaining - a2
            end
            if v70 then
                a1.dasTimer = a1.dasTimer + a2
                if v74.dasSeconds <= a1.dasTimer then
                    if v74.arrSeconds > 0 then
                        local v75 = nil
                        if key_2 then
                            a1.arrHoldSeconds = a1.arrHoldSeconds + a2
                            local v76 = ((TETRIS_CONFIG_upv_1.arrAccelSeconds <= 0) and 1) or (math.min(a1.arrHoldSeconds / TETRIS_CONFIG_upv_1.arrAccelSeconds, 1))
                            v75 = lerp_upv_1(v74.arrSeconds, v74.arrMinSeconds, v76)
                            a1.arrAccumulator = a1.arrAccumulator + a2
                            while v75 <= a1.arrAccumulator do
                                a1.arrAccumulator = a1.arrAccumulator - v75
                                if not (a1:tryShift(a1.dasDirection)) then
                                    a1.arrAccumulator = 0
                                    break
                                end
                            end
                        else
                            a1.arrAccumulator = a1.dasTimer - v74.dasSeconds
                            a1.arrHoldSeconds = 0
                            a1:tryShift(a1.dasDirection)
                        end
                    else
                        while a1:tryShift(a1.dasDirection) do

                        end
                    end
                end
            end
        end
        if a1.pendingHardDrop then
            a1.pendingHardDrop = false
            a1:hardDrop()
            a1:reportScoreIfChanged()
            return nil
        else
            local v77 = 1 / TETRIS_CONFIG_upv_1.gravitySecondsPerRow[math.min(a1.level, TETRIS_CONFIG_upv_1.maxLevel)]
            if v69 then
                v77 = ((a1.handling.sdfInstant) and (TETRIS_CONFIG_upv_1.totalRows / a2)) or (math.max(v77 * TETRIS_CONFIG_upv_1.softDropFactor, a1.handling.sdfRate))
            end
            a1.gravityProgress = a1.gravityProgress + (v77 * a2)
            while a1.gravityProgress >= 1 do
                a1.gravityProgress = a1.gravityProgress - 1
                if not (a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol, a1.pieceRow - 1)) then
                    a1.gravityProgress = 0
                    break
                end
                a1.pieceRow = a1.pieceRow - 1
                a1.lastMoveWasRotation = false
                a1.pieceDirty = true
                if v69 then
                    a1.score = a1.score + TETRIS_SCORING_upv_1.softDropPerCell
                end
                a1:refreshLowestRow()
            end
            if a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol, a1.pieceRow - 1) then
                a1.lockTimer = 0
            else
                a1.lockTimer = a1.lockTimer + a2
                if TETRIS_CONFIG_upv_1.lockDelaySeconds <= a1.lockTimer then
                    a1:lockPiece()
                    a1:reportScoreIfChanged()
                    return nil
                end
            end
            a1:reportScoreIfChanged()
        end
    end
end
u15.render = function(a1, a2)
    --[[
      name: render
      line: 1184
      upvalues:
        u2 (copy, index: 1)
        u14 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    a1:updateReplicaOffset()
    a1:animateReplica(a2)
    if a1.boardDirty then
        a1.boardDirty = false
        local v78 = 0
        local v79 = false
        if v79 then
            v78 = v78 + 1
        else
            v79 = true
        end
        local v80 = nil
        while v78 < u2 do
            v80 = a1.board[v78 + 1]
            local v81 = a1.gridParts[v78 + 1]
            if v80 ~= 0 then
                v81.Transparency = 0
                v81.Color = u14[v80]
            else
                v81.Transparency = 1
            end
            if v79 then
                v78 = v78 + 1
            else
                v79 = true
            end
        end
    end
    if a1.pieceDirty then
        a1.pieceDirty = false
        a1:poseActivePiece()
    end
    if a1.panelsDirty then
        a1.panelsDirty = false
        a1:paintPanels()
    end
    if a1.flashRemaining > 0 then
        a1.flashRemaining = math.max(a1.flashRemaining - a2, 0)
        for _, value_11 in a1.flashBars do
            value_11.Transparency = 0.1 + (0.9 * (1 - (a1.flashRemaining / TETRIS_CONFIG_upv_1.clearFlashSeconds)))
        end
        if a1.flashRemaining == 0 then
            for _, value_12 in a1.flashBars do
                value_12.CFrame = u1
            end
        end
    end
    if a1.dropTrailRemaining > 0 then
        a1.dropTrailRemaining = math.max(a1.dropTrailRemaining - a2, 0)
        a1.dropTrail.Transparency = 0.35 + (0.65 * (1 - (a1.dropTrailRemaining / 0.12)))
        if a1.dropTrailRemaining == 0 then
            a1.dropTrail.CFrame = u1
        end
    end
    if a1.perfectClearFlashRemaining > 0 then
        a1.perfectClearFlashRemaining = math.max(a1.perfectClearFlashRemaining - a2, 0)
        a1.perfectClearFlash.Transparency = 0.2 + (0.8 * (1 - (a1.perfectClearFlashRemaining / TETRIS_CONFIG_upv_1.perfectClearFlashSeconds)))
        if a1.perfectClearFlashRemaining == 0 then
            a1.perfectClearFlash.CFrame = u1
        end
    end
    a1:updateDangerVisuals(a2)
end
u15.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 1249
    ]]
    a1:render(a2)
end
u15.onPressBegan = function(a1, a2, a3)
    --[[
      name: onPressBegan
      line: 1252
    ]]
    if a3 ~= "key" then
        a1:resetTouchGesture()
        a1.touchOrigin = a2
    else
        return nil
    end
end
u15.onDrag = function(a1, a2, a3)
    --[[
      name: onDrag
      line: 1259
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if not a1.dead and a1:isRunning() and os.clock() - a1.runStartClock >= 0.25 then
        local v82 = nil
        if a1.touchAxis == "none" then
            v82 = a3 - a1.touchOrigin
            if v82.Magnitude >= TETRIS_CONFIG_upv_1.touchAxisLockPixels then
                local v83 = math.abs(v82.X)
                a1.touchAxis = math.abs(v82.Y) > v83 and "vertical" or "horizontal"
                if a1.touchAxis ~= "horizontal" then
                    a1.touchDownTravel = math.max(v82.Y, 0)
                else
                    a1.touchAccumX = v82.X
                end
            else
                return nil
            end
        end
        if a1.touchAxis ~= "horizontal" then
            a1.touchDownTravel = math.max(a1.touchDownTravel + a2.Y, 0)
            a1.touchSoftDropHeld = a1.touchOrigin.Y < a3.Y
        else
            a1.touchAccumX = a1.touchAccumX + a2.X
            while TETRIS_CONFIG_upv_1.touchMoveCellPixels <= math.abs(a1.touchAccumX) do
                local v85 = math.sign(a1.touchAccumX)
                a1.pendingNudge = a1.pendingNudge + v85
                a1.touchAccumX = a1.touchAccumX - (v85 * TETRIS_CONFIG_upv_1.touchMoveCellPixels)
            end
            return nil
        end
    else
        return nil
    end
end
u15.onPressEnded = function(a1, a2, a3)
    --[[
      name: onPressEnded
      line: 1296
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local touchAxis_1 = a1.touchAxis
    local touchDownTravel_1 = a1.touchDownTravel
    a1:resetTouchGesture()
    if a3 == "key" then
        return nil
    elseif a1.dead or os.clock() - a1.runStartClock < 0.25 then
        return nil
    elseif touchAxis_1 == "none" then
        if a2 <= TETRIS_CONFIG_upv_1.tapMaxSeconds then
            a1.pendingRotateCw = a1.pendingRotateCw + 1
        end
        return nil
    elseif touchAxis_1 == "vertical" and TETRIS_CONFIG_upv_1.touchHardDropPixels <= touchDownTravel_1 then
        a1.pendingHardDrop = true
    end
end
u15.resetTouchGesture = function(a1)
    --[[
      name: resetTouchGesture
      line: 1328
    ]]
    a1.touchAxis = "none"
    a1.touchAccumX = 0
    a1.touchDownTravel = 0
    a1.touchSoftDropHeld = false
end
u15.snapshot = function(a1)
    --[[
      name: snapshot
      line: 1334
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
        PIECE_CELLS_upv_1 (copy, index: 3)
    ]]
    local tbl_14 = {}
    for n_6 = 0, TETRIS_CONFIG_upv_1.visibleRows - 1 do
        for n_7 = 0, boardCols_upv_1 - 1 do
            table.insert(tbl_14, (string.format("%X", math.clamp(a1.board[((n_6 * boardCols_upv_1) + n_7) + 1], 0, 15))))
        end
    end
    local tbl_15 = {}
    if not (a1.dead) then
        table.insert(tbl_15, a1.pieceType)
        local v86 = PIECE_CELLS_upv_1[a1.pieceType + 1][a1.pieceRotation + 1]
        for n_8 = 0, 7, 2 do
            table.insert(tbl_15, a1.pieceCol + v86[n_8 + 1])
            table.insert(tbl_15, a1.pieceRow + v86[n_8 + 2])
        end
    end
    local tbl_16 = {}
    tbl_16.score = a1.score
    tbl_16.values = tbl_15
    tbl_16.board = table.concat(tbl_14, "")
    return tbl_16
end
u15.isDuel = function(a1)
    --[[
      name: isDuel
      line: 1362
    ]]
    local v87 = a1.stage.getViewRect() ~= nil
    return v87
end
u15.isLeftDuelist = function(a1)
    --[[
      name: isLeftDuelist
      line: 1365
    ]]
    local v88 = a1.stage.getViewRect()
    if v88 ~= nil then
        return ((v88.x0 + v88.x1) / 2) < 0.5
    end
    return true
end
u15.opponentOffsetX = function(a1)
    --[[
      name: opponentOffsetX
      line: 1372
    ]]
    local v89 = a1.duelOpponentOffsetX
    if v89 == nil then
        v89 = a1.stage.getPeerWindowOffsetX()
    end
    return v89
end
u15.applyDuelCamera = function(a1)
    --[[
      name: applyDuelCamera
      line: 1379
      upvalues:
        boardCols_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
    ]]
    local duelOpponentOffsetX_1 = a1.duelOpponentOffsetX
    local v90 = nil
    if duelOpponentOffsetX_1 ~= nil then
        local camera_1 = a1.stage.camera
        local ViewportSize_1 = camera_1.ViewportSize
        local v91 = ViewportSize_1.X / math.max(ViewportSize_1.Y, 1)
        local v92 = math.tan(math.rad(camera_1.FieldOfView / 2))
        v90 = a1.duelFrameWidth
        if v90 == nil then
            v90 = math.abs(duelOpponentOffsetX_1) + (boardCols_upv_1 * TETRIS_CONFIG_upv_1.cellSize) * 2
        end
        local v93 = math.max(a1.stage.frameHeight / 2, math.max(v90 / 2, (a1.stage.frameHeight / 2) * v91) / v91) / v92
        local v94 = a1.stage.origin + Vector3.new(duelOpponentOffsetX_1 / 2, TETRIS_CONFIG_upv_1.boardCenterY, 0)
        a1.duelFramedViewport = ViewportSize_1
        a1.stage.setCameraCFrame(CFrame.lookAt(v94 + Vector3.new(0, 0, v93), v94))
    else
        return nil
    end
end
u15.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 1405
    ]]
    a1.matchOpponents = a2
    local v95 = a1:opponentOffsetX()
    if v95 ~= nil then
        if a1.replicaCells == nil then
            a1:buildReplicaBoard(v95)
        end
        a1:refreshReplicaBoard()
    else
        return nil
    end
end
u15.buildReplicaBoard = function(a1, a2)
    --[[
      name: buildReplicaBoard
      line: 1416
      upvalues:
        u2 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        boardCols_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        makeSmoothPart_upv_1 (copy, index: 6)
    ]]
    local container_2 = a1.stage.container
    a1.replicaOffsetX = a2
    local v96 = Vector3.new(a2, 0, 0)
    local v97 = nil
    for key_3, value_13 in a1.kitReplicaParts do
        v97 = value_13:Clone()
        v97.CFrame = value_13.CFrame + v96
        v97.Parent = container_2
        table.insert(a1.replicaDecor, {part = v97, baseCFrame = value_13.CFrame})
    end
    local tbl_17 = {}
    local v98, v99
    v98, v99 = false, 0
    while true do
        if v98 then
            v99 = v99 + 1
        else
            v98 = true
        end
        if v99 >= u2 then
            break
        end
        local key_3 = makeStagePart_upv_1(container_2)
        key_3.Size = Vector3.new(TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize)
        key_3.Transparency = 1
        key_3.CFrame = CFrame.new(a1:cellPosition(v99 % boardCols_upv_1, math.floor(v99 / boardCols_upv_1)) + v96)
        table.insert(tbl_17, key_3)
    end
    a1.replicaCells = tbl_17
    for v100 = 0, 3 do
        local value_13 = makeStagePart_upv_1(container_2)
        value_13.Size = Vector3.new(TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.cellSize)
        value_13.CFrame = u1
        table.insert(a1.replicaPiece, value_13)
    end
    v99 = makeSmoothPart_upv_1(container_2)
    v99.Material = Enum.Material.Neon
    v99.Color = Color3.fromRGB(255, 255, 255)
    v99.Size = Vector3.new(boardCols_upv_1 * TETRIS_CONFIG_upv_1.cellSize, TETRIS_CONFIG_upv_1.visibleRows * TETRIS_CONFIG_upv_1.cellSize, 0.4)
    v99.Transparency = 1
    local v100 = CFrame.new(a1:cellPosition((boardCols_upv_1 - 1) / 2, (TETRIS_CONFIG_upv_1.visibleRows - 1) / 2) + Vector3.new(0, 0, 1.399999976158142))
    v99.CFrame = v100 + v96
    a1.replicaFlash = v99
    table.insert(a1.replicaDecor, {part = v99, baseCFrame = v100})
end
u15.updateReplicaOffset = function(a1)
    --[[
      name: updateReplicaOffset
      line: 1482
      upvalues:
        u2 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
    ]]
    if a1.duelOpponentOffsetX ~= nil and a1.stage.camera.ViewportSize ~= a1.duelFramedViewport then
        a1:applyDuelCamera()
    end
    local replicaCells_1 = a1.replicaCells
    local v101 = nil
    if replicaCells_1 ~= nil then
        v101 = a1:opponentOffsetX()
        if v101 ~= nil and math.abs(v101 - a1.replicaOffsetX) >= 0.05 then
            a1.replicaOffsetX = v101
            local v102 = Vector3.new(v101, 0, 0)
            for _, value_14 in a1.replicaDecor do
                value_14.part.CFrame = value_14.baseCFrame + v102
            end
            local v103, v104
            v103, v104 = false, 0
            while true do
                if v103 then
                    v104 = v104 + 1
                else
                    v103 = true
                end
                if v104 >= u2 then
                    break
                end
                replicaCells_1[v104 + 1].CFrame = CFrame.new(a1:cellPosition(v104 % boardCols_upv_1, math.floor(v104 / boardCols_upv_1)) + v102)
            end
            a1:refreshReplicaBoard()
        else
            return nil
        end
    else
        return nil
    end
end
u15.refreshReplicaBoard = function(a1)
    --[[
      name: refreshReplicaBoard
      line: 1517
      upvalues:
        u14 (copy, index: 1)
        u2 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local replicaCells_2 = a1.replicaCells
    local v105 = nil
    if replicaCells_2 ~= nil then
        v105 = a1.matchOpponents
        if v105 ~= nil then
            v105 = v105[1]
            if v105 ~= nil then
                v105 = v105.snapshot
            end
        end
        local v106, v107, v108 = nil, nil, nil
        if v105 ~= nil then
            v106 = v105.board
            if v106 == nil then
                v106 = ""
            end
            local v109 = 0
            local values_1 = 0
            local pieceColors_2 = false
            if pieceColors_2 then
                values_1 = values_1 + 1
            else
                pieceColors_2 = true
            end
            local v110 = nil
            while values_1 < u2 do
                v110 = tonumber(string.sub(v106, values_1 + 1, values_1 + 1), 16)
                if v110 == nil then
                    v110 = 0
                end
                local v111 = replicaCells_2[values_1 + 1]
                if v110 ~= 0 then
                    v109 = v109 + 1
                    v111.Transparency = 0
                    v111.Color = u14[v110] or (u14[1])
                else
                    v111.Transparency = 1
                end
                if pieceColors_2 then
                    values_1 = values_1 + 1
                else
                    pieceColors_2 = true
                end
            end
            if a1.replicaFilledCount >= 0 and v109 < a1.replicaFilledCount - 4 then
                a1.replicaFlashRemaining = 0.25
            end
            a1.replicaFilledCount = v109
            values_1 = v105.values
            pieceColors_2 = a1.style.pieceColors
            v107 = values_1[1]
            if v107 == nil then
                v107 = 0
            end
            v108 = pieceColors_2[v107 + 1]
            if v108 == nil then
                v108 = a1.style.pieceColors[1]
            end
            local v112 = Vector3.new(a1.replicaOffsetX, 0, 0)
            for n_9 = 0, 3 do
                local v113
                v113 = a1.replicaPiece[n_9 + 1]
                local v114 = values_1[((n_9 * 2) + 1) + 1]
                local v115 = values_1[((n_9 * 2) + 2) + 1]
                if v113 == nil then
                    break
                end
                if v114 == nil or v115 == nil then
                    v113.CFrame = u1
                    a1.replicaPieceTargets[n_9 + 1] = nil
                    continue
                end
                if TETRIS_CONFIG_upv_1.visibleRows > v115 then
                    v113.Transparency = 0
                    v113.Color = v108
                    a1.replicaPieceTargets[n_9 + 1] = CFrame.new(a1:cellPosition(v114, v115) + v112)
                else
                    v113.CFrame = u1
                    a1.replicaPieceTargets[n_9 + 1] = nil
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u15.animateReplica = function(a1, a2)
    --[[
      name: animateReplica
      line: 1604
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v116 = math.min(a2 * 16, 1)
    local v117 = nil
    for n_10 = 0, #a1.replicaPiece - 1 do
        local v118
        v118 = a1.replicaPiece[n_10 + 1]
        local v119 = a1.replicaPieceTargets[n_10 + 1]
        if v118 == nil or v119 == nil then
            continue
        end
        if TETRIS_CONFIG_upv_1.cellSize * 4 >= (v118.Position - v119.Position).Magnitude then
            v117 = v118.CFrame:Lerp(v119, v116)
        else
            v117 = v119
        end
        v118.CFrame = v117
    end
    local replicaFlash_1 = a1.replicaFlash
    if replicaFlash_1 == nil or a1.replicaFlashRemaining <= 0 then
        return
    end
    a1.replicaFlashRemaining = math.max(a1.replicaFlashRemaining - a2, 0)
    replicaFlash_1.Transparency = 0.55 + ((1 - (a1.replicaFlashRemaining / 0.25)) * 0.45)
end
u15.fits = function(a1, a2, a3, a4, a5)
    --[[
      name: fits
      line: 1624
      upvalues:
        PIECE_CELLS_upv_1 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v120 = PIECE_CELLS_upv_1[a2 + 1][a3 + 1]
    for n_11 = 0, 7, 2 do
        local v121
        v121 = a4 + v120[n_11 + 1]
        local v122 = a5 + v120[n_11 + 2]
        if v121 >= 0 and boardCols_upv_1 > v121 and v122 >= 0 then
            if v122 >= TETRIS_CONFIG_upv_1.totalRows or a1.board[((v122 * boardCols_upv_1) + v121) + 1] == 0 then
                continue
            end
            return false
        end
        return false
    end
    return true
end
u15.tryShift = function(a1, a2)
    --[[
      name: tryShift
      line: 1638
    ]]
    if a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol + a2, a1.pieceRow) then
        a1.pieceCol = a1.pieceCol + a2
        a1.lastMoveWasRotation = false
        a1.pieceDirty = true
        a1:onSuccessfulMove()
        a1.context.audio.play("uiTap", {})
        return true
    end
    return false
end
u15.tryRotate = function(a1, a2)
    --[[
      name: tryRotate
      line: 1652
      upvalues:
        O_PIECE_upv_1 (copy, index: 1)
        I_KICKS_upv_1 (copy, index: 2)
        JLSTZ_KICKS_upv_1 (copy, index: 3)
        kickRow_upv_1 (copy, index: 4)
    ]]
    if a1.pieceType ~= O_PIECE_upv_1 then
        local v123 = ((a1.pieceRotation + a2) + 4) % 4
        local v124
        if a1.pieceType ~= 0 then
            v124 = JLSTZ_KICKS_upv_1
        else
            v124 = I_KICKS_upv_1
        end
        a1:applyRotation(v123, v124[kickRow_upv_1(a1.pieceRotation, a2) + 1], true)
    else
        return nil
    end
end
u15.tryRotate180 = function(a1)
    --[[
      name: tryRotate180
      line: 1660
      upvalues:
        O_PIECE_upv_1 (copy, index: 1)
        ROTATE_180_KICKS_I_upv_1 (copy, index: 2)
        ROTATE_180_KICKS_JLSTZ_upv_1 (copy, index: 3)
    ]]
    if a1.pieceType ~= O_PIECE_upv_1 then
        local v125
        if a1.pieceType ~= 0 then
            v125 = ROTATE_180_KICKS_JLSTZ_upv_1
        else
            v125 = ROTATE_180_KICKS_I_upv_1
        end
        a1:applyRotation((a1.pieceRotation + 2) % 4, v125[a1.pieceRotation + 1], false)
    else
        return nil
    end
end
u15.applyRotation = function(a1, a2, a3, a4)
    --[[
      name: applyRotation
      line: 1668
    ]]
    for n_12 = 0, #a3 - 1, 2 do
        local v126 = a3[n_12 + 1]
        local v127 = a3[n_12 + 2]
        local v128
        v128 = a1:fits(a1.pieceType, a2, a1.pieceCol + v126, a1.pieceRow + v127)
        if not (v128) then
            continue
        end
        a1.pieceCol = a1.pieceCol + v126
        a1.pieceRow = a1.pieceRow + v127
        a1.pieceRotation = a2
        a1.lastMoveWasRotation = true
        a1.lastKickIndex = (a4 and (n_12 / 2)) or -1
        a1.pieceDirty = true
        a1.dasCutRemaining = a1.handling.dcdSeconds
        a1:onSuccessfulMove()
        a1:refreshLowestRow()
        a1.context.audio.play("tetrisRotate", {})
        return nil
    end
end
u15.onSuccessfulMove = function(a1)
    --[[
      name: onSuccessfulMove
      line: 1695
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if (a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol, a1.pieceRow - 1)) or a1.lockResets >= TETRIS_CONFIG_upv_1.maxLockResets then
        return
    end
    a1.lockTimer = 0
    a1.lockResets = a1.lockResets + 1
end
u15.refreshLowestRow = function(a1)
    --[[
      name: refreshLowestRow
      line: 1702
    ]]
    if a1.pieceRow >= a1.lowestRowReached then
        return
    end
    a1.lowestRowReached = a1.pieceRow
    a1.lockResets = 0
    a1.lockTimer = 0
end
u15.hardDrop = function(a1)
    --[[
      name: hardDrop
      line: 1710
      upvalues:
        TETRIS_SCORING_upv_1 (copy, index: 1)
        PIECE_CELLS_upv_1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
    ]]
    local pieceRow_1 = a1.pieceRow
    local v129 = 0
    while (a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol, a1.pieceRow - 1)) do
        a1.pieceRow = a1.pieceRow - 1
        v129 = v129 + 1
    end
    if v129 > 0 then
        a1.lastMoveWasRotation = false
    end
    a1.score = a1.score + (v129 * TETRIS_SCORING_upv_1.hardDropPerCell)
    if v129 > 0 then
        local v130 = PIECE_CELLS_upv_1[a1.pieceType + 1][a1.pieceRotation + 1]
        local v131 = math.min(math.huge, v130[1])
        local v132 = math.max(-math.huge, v130[1])
        local v133 = math.min(math.huge, v130[2])
        local v134 = math.min(v131, v130[3])
        local v135 = math.max(v132, v130[3])
        local v136 = math.min(v133, v130[4])
        local v137 = math.min(v134, v130[5])
        local v138 = math.max(v135, v130[5])
        local v139 = math.min(v136, v130[6])
        local v140 = math.min(v137, v130[7])
        local v141 = math.max(v138, v130[7])
        local v142 = math.min(v139, v130[8])
        local v143 = a1.pieceCol + (v140 + v141) / 2
        a1.dropDustAnchor.CFrame = CFrame.new(a1:cellPosition(v143, a1.pieceRow + v142) + Vector3.new(0, -TETRIS_CONFIG_upv_1.cellSize / 2, 0.8))
        a1.dropDust:Emit(14)
        a1.dropTrail.Color = a1.style.pieceColors[a1.pieceType + 1]:Lerp(Color3.fromRGB(255, 255, 255), 0.55)
        a1.dropTrail.Size = Vector3.new((((v141 - v140) + 1) * TETRIS_CONFIG_upv_1.cellSize) * 0.65, v129 * TETRIS_CONFIG_upv_1.cellSize, 0.5)
        a1.dropTrail.CFrame = CFrame.new(a1:cellPosition(v143, ((a1.pieceRow + pieceRow_1) / 2) + v142) + Vector3.new(0, 0, 1.2999999523162842))
        a1.dropTrail.Transparency = 0.35
        a1.dropTrailRemaining = 0.12
        a1.stage.shake(0.35)
    end
    a1.context.audio.play("thud", {})
    a1.context.audio.play("whoosh", {})
    a1:lockPiece()
end
u15.lockPiece = function(a1)
    --[[
      name: lockPiece
      line: 1759
      upvalues:
        PIECE_CELLS_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
        boardCols_upv_1 (copy, index: 3)
        advanceBackToBack_upv_1 (copy, index: 4)
        clearAward_upv_1 (copy, index: 5)
        comboAward_upv_1 (copy, index: 6)
        publishCombo_upv_1 (copy, index: 7)
        u8 (copy, index: 8)
        u6 (copy, index: 9)
        spinAward_upv_1 (copy, index: 10)
        u9 (copy, index: 11)
    ]]
    a1.context.audio.play("thud", {})
    local v144 = a1:evaluateTSpin()
    local v145 = PIECE_CELLS_upv_1[a1.pieceType + 1][a1.pieceRotation + 1]
    local v146 = true
    for v147 = 0, 7, 2 do
        local v148
        v148 = a1.pieceRow + v145[v147 + 2]
        if v148 < TETRIS_CONFIG_upv_1.totalRows then
            a1.board[((v148 * boardCols_upv_1) + (a1.pieceCol + v145[v147 + 1])) + 1] = a1.pieceType + 1
        end
        if v148 < TETRIS_CONFIG_upv_1.visibleRows then
            v146 = false
        end
    end
    a1.boardDirty = true
    a1.holdUsed = false
    if v146 then
        a1:topOut()
        return nil
    else
        local v149 = 0
        local v150 = 0
        local v151 = 0
        local v152, v147, v153 = v149, v151, v150
        local v154 = nil
        for n_13 = 0, TETRIS_CONFIG_upv_1.totalRows - 1 do
            v154 = true
            for n_14 = 0, boardCols_upv_1 - 1 do
                if a1.board[((n_13 * boardCols_upv_1) + n_14) + 1] == 0 then
                    v154 = false
                    break
                end
            end
            if v154 then
                local v155 = v152 + 1
                if n_13 >= TETRIS_CONFIG_upv_1.visibleRows then
                    v152 = v155
                    continue
                end
                if v147 >= 4 then
                    v152 = v155
                else
                    a1.flashBars[v147 + 1].CFrame = CFrame.new(a1:cellPosition(0, n_13) + Vector3.new(4.5 * TETRIS_CONFIG_upv_1.cellSize, 0, 0.2))
                    a1.clearBursts[v147 + 1]:Emit(26)
                    v152, v147 = v155, v147 + 1
                end
            else
                if v153 == n_13 then
                    v153 = v153 + 1
                    continue
                end
                for n_15 = 0, boardCols_upv_1 - 1 do
                    a1.board[((v153 * boardCols_upv_1) + n_15) + 1] = a1.board[((n_13 * boardCols_upv_1) + n_15) + 1]
                end
                v153 = v153 + 1
            end
        end
        local v156, v157
        v156, v157 = false, v153
        if v156 then
            v157 = v157 + 1
        else
            v156 = true
        end
        while v157 < TETRIS_CONFIG_upv_1.totalRows do
            for n_16 = 0, boardCols_upv_1 - 1 do
                a1.board[((v157 * boardCols_upv_1) + n_16) + 1] = 0
            end
            if v156 then
                v157 = v157 + 1
            else
                v156 = true
            end
        end
        local level_1 = a1.level
        local v158 = nil
        if v152 <= 0 then
            a1.combo = 0
            if v144 ~= "none" then
                a1.score = a1.score + (spinAward_upv_1(v144) * level_1)
                local popups_1 = a1.popups
                local v159 = a1:wellTopPosition()
                popups_1:show(v159, ((v144 ~= "full") and "T-SPIN MINI!") or "T-SPIN!", u9, 0.9)
                a1.context.audio.play("scorePing", {})
            end
        else
            a1.flashRemaining = TETRIS_CONFIG_upv_1.clearFlashSeconds
            a1.combo = a1.combo + 1
            a1.backToBackLink = advanceBackToBack_upv_1(a1.backToBackLink, v152, v144)
            v156 = a1.backToBackLink
            a1.score = a1.score + (clearAward_upv_1(v152, v144, v156) * level_1)
            a1:announceClear(v152, v144, v156)
            if a1.combo >= 2 then
                a1.score = a1.score + (comboAward_upv_1(a1.combo) * level_1)
                publishCombo_upv_1({count = a1.combo, color = u8, holdSeconds = TETRIS_CONFIG_upv_1.comboHoldSeconds})
                a1.context.audio.play("scorePing", {pitch = 1 + (a1.combo * 0.08)})
            end
            if a1:isBoardEmpty() then
                a1:awardPerfectClear(v152, v156, level_1)
            end
            v158 = a1.level
            a1.lines = a1.lines + v152
            a1.level = math.min(math.floor(a1.lines / TETRIS_CONFIG_upv_1.linesPerLevel) + 1, TETRIS_CONFIG_upv_1.maxLevel)
            if a1.level ~= v158 then
                a1.popups:show(a1:wellTopPosition() + Vector3.new(0, 3, 0), ("LEVEL %*"):format(a1.level), u6, 1)
                a1.context.audio.play("scorePing", {})
            end
        end
        a1:updateDangerState()
        a1:spawnPiece(a1:takeNextPiece())
    end
end
u15.evaluateTSpin = function(a1)
    --[[
      name: evaluateTSpin
      line: 1890
      upvalues:
        T_PIECE_upv_1 (copy, index: 1)
        T_CORNERS_upv_1 (copy, index: 2)
        boardCols_upv_1 (copy, index: 3)
        TETRIS_CONFIG_upv_1 (copy, index: 4)
        TSPIN_UPGRADE_KICK_INDEX_upv_1 (copy, index: 5)
    ]]
    if a1.pieceType == T_PIECE_upv_1 and a1.lastMoveWasRotation then
        local v160 = T_CORNERS_upv_1[a1.pieceRotation + 1]
        local v161 = 0
        local v162 = 0
        local v163 = nil
        for n_17 = 0, 7, 2 do
            local v164
            v164 = a1.pieceCol + v160[n_17 + 1]
            local v165 = a1.pieceRow + v160[n_17 + 2]
            v163 = true
            if v164 >= 0 then
                v163 = true
                if boardCols_upv_1 > v164 then
                    v163 = true
                    if v165 >= 0 then
                        v163 = false
                        if v165 < TETRIS_CONFIG_upv_1.totalRows then
                            v163 = a1.board[((v165 * boardCols_upv_1) + v164) + 1] ~= 0
                        end
                    end
                end
            end
            if not (v163) then
                continue
            end
            if n_17 >= 4 then
                v162 = v162 + 1
            else
                v161 = v161 + 1
            end
        end
        if v161 + v162 >= 3 then
            if v161 ~= 2 and a1.lastKickIndex ~= TSPIN_UPGRADE_KICK_INDEX_upv_1 then
                return "mini"
            end
            return "full"
        end
    end
    return "none"
end
u15.announceClear = function(a1, a2, a3, a4)
    --[[
      name: announceClear
      line: 1919
      upvalues:
        backToBackMultiplier_upv_1 (copy, index: 1)
        u9 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        u6 (copy, index: 4)
    ]]
    local v166 = ((backToBackMultiplier_upv_1(a4) <= 1) and "") or (("B2B \195\151%* "):format(a4))
    if a3 == "none" then
        if a2 ~= 4 then
            a1.context.audio.play("thud", {})
            a1.context.audio.play("woodBreak", {pitch = 1.15 + (a1.combo * 0.05)})
            if a2 >= 2 then
                a1.context.audio.play("explosion", {})
            end
            a1.stage.shake(TETRIS_CONFIG_upv_1.shakePerLine * a2)
        else
            a1.popups:show(a1:wellTopPosition(), ("%*%*"):format(v166, a1.style.quadCallout), u6, 1.2)
            a1.context.audio.play("perfect", {})
            a1.context.audio.play("explosion", {})
            a1.stage.shake(TETRIS_CONFIG_upv_1.shakeTetris)
            return nil
        end
    else
        local v167
        if a3 == "mini" and a2 == 1 then
            v167 = "T-SPIN MINI"
        else
            v167 = "T-SPIN"
        end
        a1.popups:show(a1:wellTopPosition(), ("%*%* %*!"):format(v166, v167, ((a2 == 1) and "SINGLE") or (((a2 ~= 2) and "TRIPLE") or "DOUBLE")), u9, 1.15)
        a1.context.audio.play("perfect", {pitch = 1.05 + (a2 * 0.1)})
        if a2 >= 2 then
            a1.context.audio.play("explosion", {})
        end
        a1.stage.shake(TETRIS_CONFIG_upv_1.shakePerLine * (a2 + 1))
        return nil
    end
end
u15.isBoardEmpty = function(a1)
    --[[
      name: isBoardEmpty
      line: 1970
      upvalues:
        boardCols_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
    ]]
    for n_18 = 0, (boardCols_upv_1 * TETRIS_CONFIG_upv_1.totalRows) - 1 do
        if a1.board[n_18 + 1] == 0 then
            continue
        end
        return false
    end
    return true
end
u15.awardPerfectClear = function(a1, a2, a3, a4)
    --[[
      name: awardPerfectClear
      line: 1978
      upvalues:
        perfectClearAward_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    a1.score = a1.score + (perfectClearAward_upv_1(a2, a3) * a4)
    a1.perfectClearFlashRemaining = TETRIS_CONFIG_upv_1.perfectClearFlashSeconds
    a1.perfectClearFlash.Transparency = 0.2
    a1.perfectClearFlash.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, TETRIS_CONFIG_upv_1.boardCenterY, 1))
    a1.popups:show(a1:wellTopPosition() + Vector3.new(0, -6, 0), a1.style.perfectClearCallout, u6, 1.4)
    a1.context.audio.play("perfect", {})
    a1.context.audio.play("explosion", {})
    a1.stage.shake(1)
end
u15.tryHold = function(a1)
    --[[
      name: tryHold
      line: 1999
    ]]
    if a1.holdUsed then
        return nil
    else
        a1.holdUsed = true
        local pieceType_1 = a1.pieceType
        if a1.holdType >= 0 then
            local holdType_1 = a1.holdType
            a1.holdType = pieceType_1
            a1:spawnPiece(holdType_1)
        else
            a1.holdType = pieceType_1
            a1:spawnPiece(a1:takeNextPiece())
        end
        a1.panelsDirty = true
        a1.context.audio.play("whoosh", {})
    end
end
u15.spawnPiece = function(a1, a2)
    --[[
      name: spawnPiece
      line: 2019
    ]]
    a1.pieceType = a2
    a1.pieceRotation = 0
    a1.pieceCol = 4
    a1.pieceRow = 20
    a1.lowestRowReached = 20
    a1.gravityProgress = 0
    a1.lockTimer = 0
    a1.lockResets = 0
    a1.lastMoveWasRotation = false
    a1.lastKickIndex = -1
    a1.dasCutRemaining = a1.handling.dcdSeconds
    a1.pieceDirty = true
    if (a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol, a1.pieceRow)) then
        return
    end
    a1:topOut()
end
u15.takeNextPiece = function(a1)
    --[[
      name: takeNextPiece
      line: 2037
    ]]
    local v168 = table.remove(a1.nextQueue, 1)
    table.insert(a1.nextQueue, (a1:drawFromBag()))
    a1.panelsDirty = true
    local v169
    if v168 ~= nil then
        v169 = v168
    else
        v169 = a1:drawFromBag()
    end
    return v169
end
u15.drawFromBag = function(a1)
    --[[
      name: drawFromBag
      line: 2049
      upvalues:
        refillBag_upv_1 (copy, index: 1)
    ]]
    if #a1.bag == 0 then
        refillBag_upv_1(a1.bag, a1.bagRandom)
    end
    local bag_1 = a1.bag
    local v170 = #bag_1
    local v171 = bag_1[v170]
    bag_1[v170] = nil
    if v171 == nil then
        v171 = 0
    end
    return v171
end
u15.poseActivePiece = function(a1)
    --[[
      name: poseActivePiece
      line: 2066
      upvalues:
        PIECE_CELLS_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v172 = a1.pieceRow
    while a1:fits(a1.pieceType, a1.pieceRotation, a1.pieceCol, v172 - 1) do
        v172 = v172 - 1
    end
    local v173 = PIECE_CELLS_upv_1[a1.pieceType + 1][a1.pieceRotation + 1]
    local v174 = a1.style.pieceColors[a1.pieceType + 1]
    v172 = nil
    for n_19 = 0, 3 do
        local v175 = v173[(n_19 * 2) + 1]
        local v176 = v173[(n_19 * 2) + 2]
        local v177 = a1.activeParts[n_19 + 1]
        v177.Color = v174
        v177.CFrame = CFrame.new(a1:cellPosition(a1.pieceCol + v175, a1.pieceRow + v176))
        local v178 = a1.ghostParts[n_19 + 1]
        if v172 == a1.pieceRow then
            v178.CFrame = u1
            continue
        end
        local v179
        if a1.style.ghostDarken then
            v179 = v174:Lerp(a1.style.wellColor, 0.58)
        else
            v179 = v174
        end
        v178.Color = v179
        v178.CFrame = CFrame.new(a1:cellPosition(a1.pieceCol + v175, v172 + v176) + Vector3.new(0, 0, -0.20000000298023224))
    end
end
u15.paintPanels = function(a1)
    --[[
      name: paintPanels
      line: 2092
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1:refreshHoldButton()
    a1:paintPanel(0, a1.holdType)
    local v180 = nil
    for n_20 = 0, TETRIS_CONFIG_upv_1.nextQueueSize - 1 do
        v180 = a1.nextQueue[n_20 + 1]
        if v180 == nil then
            v180 = -1
        end
        a1:paintPanel(n_20 + 1, v180)
    end
end
u15.refreshHoldButton = function(a1)
    --[[
      name: refreshHoldButton
      line: 2106
      upvalues:
        u10 (copy, index: 1)
        u12 (copy, index: 3)
    ]]
    local v181 = not a1.holdUsed
    local holdButton_1 = a1.holdButton
    holdButton_1.TextColor3 = u10
    a1.holdButton.BackgroundTransparency = (v181 and 0.15) or 0.55
    local holdButtonStroke_1 = a1.holdButtonStroke
    local v182
    if v181 then
        v182 = a1.style.wallColor
    else
        v182 = u12
    end
    holdButtonStroke_1.Color = v182
    local holdTouchButton_2 = a1.holdTouchButton
    if holdTouchButton_2 == nil then
        return
    end
    holdTouchButton_2:setEnabled(v181)
end
u15.touchStackPosition = function(a1, a2)
    --[[
      name: touchStackPosition
      line: 2117
    ]]
    return UDim2.new(1, -20, 1, -(20 + (a2 * 68)))
end
u15.touchButtonLook = function(a1)
    --[[
      name: touchButtonLook
      line: 2121
      upvalues:
        u10 (copy, index: 1)
    ]]
    local tbl_18 = {}
    tbl_18.background = a1.style.panelColor
    tbl_18.stroke = a1.style.wallColor
    tbl_18.text = u10
    return tbl_18
end
u15.touchHoldSpentLook = function(a1)
    --[[
      name: touchHoldSpentLook
      line: 2128
      upvalues:
        u12 (copy, index: 1)
        u11 (copy, index: 2)
    ]]
    local tbl_19 = {}
    tbl_19.background = a1.style.panelColor
    tbl_19.stroke = u12
    tbl_19.text = u11
    return tbl_19
end
u15.paintPanel = function(a1, a2, a3)
    --[[
      name: paintPanel
      line: 2135
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        PIECE_CELLS_upv_1 (copy, index: 3)
    ]]
    local v183 = a1:panelCenter(a2)
    local v184 = TETRIS_CONFIG_upv_1.cellSize * TETRIS_CONFIG_upv_1.previewScale
    for n_21 = 0, 3 do
        local v185 = a1.previewParts[((a2 * 4) + n_21) + 1]
        local v186, v187
        if a3 < 0 then
            v185.CFrame = u1
            continue
        end
        local v188 = PIECE_CELLS_upv_1[a3 + 1][1]
        v186 = v188[(n_21 * 2) + 1]
        v187 = v188[(n_21 * 2) + 2]
        v185.Color = a1.style.pieceColors[a3 + 1]
        local v189 = nil
        if a3 == 0 then
            v189 = -0.5
            v185.CFrame = CFrame.new(v183 + Vector3.new((v186 + v189) * v184, v187 * v184, 0))
            continue
        end
        if a3 ~= 3 then
            v189 = 0
        else
            v189 = -0.5
        end
        v185.CFrame = CFrame.new(v183 + Vector3.new((v186 + v189) * v184, v187 * v184, 0))
    end
end
u15.panelCenter = function(a1, a2)
    --[[
      name: panelCenter
      line: 2154
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 ~= 0 then
        return a1.stage.origin + Vector3.new(TETRIS_CONFIG_upv_1.nextPanelX, (TETRIS_CONFIG_upv_1.boardCenterY + 9) - ((a2 - 1) * 4.7), 0)
    end
    return a1.stage.origin + Vector3.new(TETRIS_CONFIG_upv_1.holdPanelX, TETRIS_CONFIG_upv_1.boardCenterY + 15, 0)
end
u15.cellPosition = function(a1, a2, a3)
    --[[
      name: cellPosition
      line: 2167
      upvalues:
        boardCols_upv_1 (copy, index: 1)
        TETRIS_CONFIG_upv_1 (copy, index: 2)
    ]]
    return a1.stage.origin + Vector3.new((a2 - ((boardCols_upv_1 - 1) / 2)) * TETRIS_CONFIG_upv_1.cellSize, ((a3 - ((TETRIS_CONFIG_upv_1.visibleRows - 1) / 2)) * TETRIS_CONFIG_upv_1.cellSize) + TETRIS_CONFIG_upv_1.boardCenterY, 0)
end
u15.wellTopPosition = function(a1)
    --[[
      name: wellTopPosition
      line: 2172
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.stage.origin + Vector3.new(0, TETRIS_CONFIG_upv_1.boardCenterY + 14, 2)
end
u15.clearPendingInput = function(a1)
    --[[
      name: clearPendingInput
      line: 2177
    ]]
    a1.pendingNudge = 0
    a1.pendingRotateCw = 0
    a1.pendingRotateCcw = 0
    a1.pendingRotate180 = 0
    a1.pendingHardDrop = false
    a1.pendingHold = false
    a1:resetTouchGesture()
end
u15.seedKeyEdges = function(a1)
    --[[
      name: seedKeyEdges
      line: 2187
    ]]
    a1.prevLeft = a1:isShiftLeftHeld()
    a1.prevRight = a1:isShiftRightHeld()
end
u15.isShiftLeftHeld = function(a1)
    --[[
      name: isShiftLeftHeld
      line: 2191
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
    ]]
    for _, value_15 in a1.keys.moveLeft do
        local v190
        if UserInputService_upv_1:IsKeyDown(value_15) then
            v190 = true
        else
            continue
        end
    end
    local v190 = nil
    v190 = (v190) or UserInputService_upv_1:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.DPadLeft) or (gamepadInput_upv_1:leftX() < -0.5)
    return v190
end
u15.isShiftRightHeld = function(a1)
    --[[
      name: isShiftRightHeld
      line: 2194
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        gamepadInput_upv_1 (copy, index: 2)
    ]]
    for _, value_16 in a1.keys.moveRight do
        local v191
        if UserInputService_upv_1:IsKeyDown(value_16) then
            v191 = true
        else
            continue
        end
    end
    local v191 = nil
    v191 = (v191) or UserInputService_upv_1:IsGamepadButtonDown(Enum.UserInputType.Gamepad1, Enum.KeyCode.DPadRight) or (gamepadInput_upv_1:leftX() > 0.5)
    return v191
end
u15.restoreGridParts = function(a1)
    --[[
      name: restoreGridParts
      line: 2197
      upvalues:
        u2 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
    ]]
    local v192 = 0
    local v193 = false
    while true do
        if v193 then
            v192 = v192 + 1
        else
            v193 = true
        end
        if v192 >= u2 then
            break
        end
        local v194 = a1.gridParts[v192 + 1]
        v194.Anchored = true
        v194.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        v194.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        v194.CFrame = CFrame.new(a1:cellPosition(v192 % boardCols_upv_1, math.floor(v192 / boardCols_upv_1)))
    end
end
u15.reportScoreIfChanged = function(a1)
    --[[
      name: reportScoreIfChanged
      line: 2218
    ]]
    if a1.score ~= a1.reportedScore then
        a1.reportedScore = a1.score
        a1.context.reportScore(a1.score)
    else
        return nil
    end
end
u15.updateDangerState = function(a1)
    --[[
      name: updateDangerState
      line: 2225
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
        boardCols_upv_1 (copy, index: 2)
    ]]
    local dangerActive_1 = a1.dangerActive
    local v195 = false
    local v196 = TETRIS_CONFIG_upv_1.visibleRows - TETRIS_CONFIG_upv_1.dangerRows
    local v197 = false
    if v197 then
        v196 = v196 + 1
    else
        v197 = true
    end
    if v196 < TETRIS_CONFIG_upv_1.totalRows and not (v195) then
        for n_22 = 0, boardCols_upv_1 - 1 do
            if a1.board[((v196 * boardCols_upv_1) + n_22) + 1] ~= 0 then
                v195 = true
                break
            end
        end
        if v197 then
            v196 = v196 + 1
        else
            v197 = true
        end
        --[[ goto label_3 ]]--
    end
    a1.dangerActive = v195
    if v195 and not (dangerActive_1) then
        a1.dangerBeatClock = TETRIS_CONFIG_upv_1.dangerBeatSeconds
        a1.dangerDubPlayed = true
        a1.context.audio.play("buzz", {})
    end
end
u15.updateDangerHeartbeat = function(a1, a2)
    --[[
      name: updateDangerHeartbeat
      line: 2260
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.dangerBeatClock = a1.dangerBeatClock + a2
    if TETRIS_CONFIG_upv_1.dangerBeatSeconds > a1.dangerBeatClock then
        if not (a1.dangerDubPlayed) and TETRIS_CONFIG_upv_1.dangerBeatDubOffset <= a1.dangerBeatClock then
            a1.dangerDubPlayed = true
            a1.context.audio.play("thud", {})
        end
    else
        a1.dangerBeatClock = a1.dangerBeatClock - TETRIS_CONFIG_upv_1.dangerBeatSeconds
        a1.dangerDubPlayed = false
        a1.context.audio.play("thud", {})
    end
end
u15.updateDangerVisuals = function(a1, a2)
    --[[
      name: updateDangerVisuals
      line: 2277
      upvalues:
        TETRIS_CONFIG_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    local v198
    if not (a1.dangerActive) or a1.dead then
        v198 = 0
    else
        v198 = 1
    end
    a1.dangerIntensity = a1.dangerIntensity + ((v198 - a1.dangerIntensity) * math.min(a2 * TETRIS_CONFIG_upv_1.dangerFadeRate, 1))
    if v198 == 0 and a1.dangerIntensity < 0.01 then
        if a1.dangerEffect.Enabled then
            a1:snapDangerVisualsOff()
        end
        return nil
    end
    a1.dangerEffect.Enabled = true
    a1.dangerPulseClock = (a1.dangerPulseClock + (a2 / TETRIS_CONFIG_upv_1.dangerPulseSeconds)) % 1
    local v199 = a1.dangerIntensity * (TETRIS_CONFIG_upv_1.dangerTintFloor + ((1 - TETRIS_CONFIG_upv_1.dangerTintFloor) * (0.5 - (math.cos((a1.dangerPulseClock * math.pi) * 2) * 0.5))))
    a1.dangerEffect.TintColor = u13[math.clamp(math.floor(v199 * 23), 0, 23) + 1]
    a1.dangerEffect.Saturation = -0.2 * v199
end
u15.snapDangerVisualsOff = function(a1)
    --[[
      name: snapDangerVisualsOff
      line: 2294
      upvalues:
        u13 (copy, index: 1)
    ]]
    a1.dangerIntensity = 0
    a1.dangerEffect.Enabled = false
    a1.dangerEffect.TintColor = u13[1]
    a1.dangerEffect.Saturation = 0
end
u15.resetDangerState = function(a1)
    --[[
      name: resetDangerState
      line: 2300
    ]]
    a1.dangerActive = false
    a1.dangerPulseClock = 0
    a1.dangerBeatClock = 0
    a1.dangerDubPlayed = true
    a1:snapDangerVisualsOff()
end
u15.resetPerfectClearFlash = function(a1)
    --[[
      name: resetPerfectClearFlash
      line: 2307
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.perfectClearFlashRemaining = 0
    a1.perfectClearFlash.Transparency = 1
    a1.perfectClearFlash.CFrame = u1
end
u15.topOut = function(a1)
    --[[
      name: topOut
      line: 2312
      upvalues:
        u7 (copy, index: 1)
        u1 (copy, index: 2)
        TETRIS_CONFIG_upv_1 (copy, index: 3)
        boardCols_upv_1 (copy, index: 4)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        a1.combo = 0
        a1.context.audio.play("buzz", {})
        a1.context.audio.play("splat", {})
        a1.stage.shake(1)
        a1.popups:show(a1:wellTopPosition(), "TOP OUT!", u7, 1.1)
        local _ = nil
        local roundToken_upv_1 = nil
        local v200 = nil
        for v204, value_17 in a1.activeParts do
            value_17.CFrame = u1
        end
        local v201 = nil
        for v202, value_18 in a1.ghostParts do
            value_18.CFrame = u1
        end
        v201 = TETRIS_CONFIG_upv_1.visibleRows - 1
        while v201 > 0 do
            roundToken_upv_1 = false
            for n_23 = 0, boardCols_upv_1 - 1 do
                if a1.board[((v201 * boardCols_upv_1) + n_23) + 1] ~= 0 then
                    roundToken_upv_1 = true
                    break
                end
            end
            if roundToken_upv_1 then
                break
            else
                v201 = v201 - 1
            end
        end
        roundToken_upv_1 = a1.roundToken
        v200 = math.max((v201 - TETRIS_CONFIG_upv_1.deathFlingRows) + 1, 0)
        local v202
        v202 = false
        if v202 then
            v200 = v200 + 1
        else
            v202 = true
        end
        while v200 <= v201 do
            for n_24 = 0, boardCols_upv_1 - 1 do
                if a1.board[((v200 * boardCols_upv_1) + n_24) + 1] ~= 0 then
                    local v203 = a1.gridParts[((v200 * boardCols_upv_1) + n_24) + 1]
                    v203.Anchored = false
                    v203.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-12, 12), a1.random:NextNumber(8, 22), a1.random:NextNumber(-4, 4))
                    v203.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-10, 10), a1.random:NextNumber(-10, 10), a1.random:NextNumber(-10, 10))
                end
            end
            if v202 then
                v200 = v200 + 1
            else
                v202 = true
            end
        end
        task.delay(
            2.5,
            function()
                --[[
                  line: 2374
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1:restoreGridParts()
            end
        )
        a1.context.endRun(a1.score)
    end
end
local tbl_20 = {}
tbl_20.TetrisGame = u15
return tbl_20