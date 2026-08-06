-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local BALLZ_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").BALLZ_STAGE_LIGHTING
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit")
local cloneKitModel_upv_1 = v2.cloneKitModel
local findLargestBasePart_upv_1 = v2.findLargestBasePart
local placeModelPoint_upv_1 = v2.placeModelPoint
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v3.readResume
local writeResume_upv_1 = v3.writeResume
local v4 = RuntimeLib_1.import(script, script.Parent, "ballz-assets")
local BallzAssets_upv_1 = v4.BallzAssets
local cloneFittedProp_upv_1 = v4.cloneFittedProp
local findDominantPart_upv_1 = v4.findDominantPart
local BALLZ_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "ballz-config").BALLZ_CONFIG
local v5 = RuntimeLib_1.import(script, script.Parent, "ballz-board")
local BOARD_HALF_WIDTH_upv_1 = v5.BOARD_HALF_WIDTH
local CEILING_Y_upv_1 = v5.CEILING_Y
local CELL_COUNT_upv_1 = v5.CELL_COUNT
local cellIndex_upv_1 = v5.cellIndex
local clampAim_upv_1 = v5.clampAim
local descendAndSpawn_upv_1 = v5.descendAndSpawn
local specForTurn_upv_1 = v5.specForTurn
local stepBall_upv_1 = v5.stepBall
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(214, 207, 192)
local u3 = Color3.fromRGB(34, 38, 48)
local u4 = Color3.fromRGB(52, 58, 70)
local u5 = Color3.fromRGB(158, 150, 136)
local u6 = Color3.fromRGB(255, 214, 118)
local u7 = Color3.fromRGB(226, 62, 68)
local u8 = Color3.fromRGB(248, 250, 252)
local u9 = Color3.fromRGB(126, 226, 255)
local u10 = Color3.fromRGB(255, 214, 150)
local u11 = Color3.fromRGB(245, 245, 255)
local u12 = Color3.fromRGB(255, 255, 255)
local u13 = Color3.fromRGB(235, 232, 224)
local u14 = Color3.fromRGB(245, 245, 255)
local u15 = Color3.fromRGB(255, 90, 100)
local u16 = Color3.fromRGB(126, 226, 255)
local u17 = Color3.fromRGB(0, 0, 0)
local function luminance_1(a1)
    --[[
      name: luminance
      line: 86
    ]]
    return ((0.299 * a1.R) + (0.587 * a1.G)) + (0.114 * a1.B)
end
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(222, 216, 204)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(230, 224, 212)
tbl_upv_1.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 152
    ]]
    return "BallzGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u18 = setmetatable(tbl_2, tbl_3)
u18.__index = u18
u18.new = function(...)
    --[[
      name: new
      line: 158
      upvalues:
        u18 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u18)
    return v6:constructor(...) or v6
end
u18.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 162
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        BALLZ_CONFIG_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.cells = {}
    a1.dotVisuals = {}
    a1.balls = {}
    a1.guideDots = {}
    a1.chunks = {}
    a1.bursts = {}
    a1.puffEmitters = {}
    a1.events = {}
    a1.hp = {}
    a1.dot = {}
    a1.phase = "aiming"
    a1.turn = 1
    a1.completedTurns = 0
    a1.ballCount = BALLZ_CONFIG_upv_1.startingBalls
    a1.launchX = 0
    a1.nextLaunchX = -1000
    a1.firedCount = 0
    a1.fireTimer = 0
    a1.turnClock = 0
    a1.bricksBroken = 0
    a1.clearedThisTurn = 0
    a1.dotsThisTurn = 0
    a1.dead = false
    a1.roundToken = 0
    a1.cosmeticClock = 0
    a1.descendClock = 0
    a1.lowestRow = BALLZ_CONFIG_upv_1.rows
    a1.chunkCursor = 0
    a1.burstCursor = 0
    a1.puffCursor = 0
    a1.counterText = ""
    a1.trailEnabled = false
    a1.pressHeld = false
    a1.padFastForward = false
    a1.fastForwardHintShown = false
    a1.aiming = false
    a1.aimFromGamepad = false
    a1.pointerOriginX = 0
    a1.pointerOriginY = 0
    a1.aimDirX = 0
    a1.aimDirY = 1
    a1.aimDragStuds = 0
end
u18.buildScene = function(a1)
    --[[
      name: buildScene
      line: 212
      upvalues:
        BallzAssets_upv_1 (copy, index: 1)
        makeFrontalBackdrop_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        BALLZ_CONFIG_upv_1 (copy, index: 4)
        cloneKitModel_upv_1 (copy, index: 5)
        findLargestBasePart_upv_1 (copy, index: 6)
        placeModelPoint_upv_1 (copy, index: 7)
        readLightingFolderProfile_upv_1 (copy, index: 8)
        tbl_upv_1 (copy, index: 9)
        BALLZ_STAGE_LIGHTING_upv_1 (copy, index: 10)
        makeSmoothPart_upv_1 (copy, index: 11)
        u3 (copy, index: 12)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 13)
        CEILING_Y_upv_1 (copy, index: 14)
        u4 (copy, index: 15)
        makeStagePart_upv_1 (copy, index: 16)
        u5 (copy, index: 17)
        u6 (copy, index: 18)
        u7 (copy, index: 19)
        u1 (copy, index: 20)
        u11 (copy, index: 21)
        CELL_COUNT_upv_1 (copy, index: 22)
        cloneFittedProp_upv_1 (copy, index: 23)
        findDominantPart_upv_1 (copy, index: 24)
        u12 (copy, index: 25)
        u9 (copy, index: 26)
        u8 (copy, index: 27)
        u10 (copy, index: 28)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 29)
        u13 (copy, index: 30)
        PopupTextPool_upv_1 (copy, index: 31)
    ]]
    local container_1 = a1.stage.container
    local v7 = BallzAssets_upv_1.new()
    a1.backdrop = makeFrontalBackdrop_upv_1(a1.stage, u2, Enum.Material.SmoothPlastic)
    if BALLZ_CONFIG_upv_1.useAuthoredBackdrop then
        local v8 = nil
        if v7.backdrop ~= nil then
            v8 = cloneKitModel_upv_1(v7.backdrop, container_1)
            local v9 = nil
            if v8 ~= nil then
                v9 = findLargestBasePart_upv_1(v8)
                if v9 == nil then
                    v8:Destroy()
                else
                    placeModelPoint_upv_1(v8, v9.Position, a1.stage.origin + Vector3.new(0, 20.5, -6.090000152587891))
                end
            end
        end
    end
    if v7.lighting ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(v7.lighting, tbl_upv_1, BALLZ_STAGE_LIGHTING_upv_1))
    end
    a1.boardPanel = makeSmoothPart_upv_1(container_1)
    a1.boardPanel.Color = u3
    a1.boardPanel.Size = Vector3.new((BOARD_HALF_WIDTH_upv_1 * 2) + 1.2, CEILING_Y_upv_1 + 1.2, 1)
    a1.boardPanel.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, CEILING_Y_upv_1 / 2, -2.2))
    for n_1 = 1, BALLZ_CONFIG_upv_1.columns - 1 do
        local v10 = makeSmoothPart_upv_1(container_1)
        v10.Color = u4
        v10.Transparency = 0.6
        v10.Size = Vector3.new(0.12, CEILING_Y_upv_1, 0.1)
        v10.CFrame = CFrame.new(a1.stage.origin + Vector3.new((n_1 * BALLZ_CONFIG_upv_1.cellSize) - BOARD_HALF_WIDTH_upv_1, CEILING_Y_upv_1 / 2, -1.65))
    end
    for n_2 = 1, BALLZ_CONFIG_upv_1.rows - 1 do
        local v11 = makeSmoothPart_upv_1(container_1)
        v11.Color = u4
        v11.Transparency = 0.6
        v11.Size = Vector3.new(BOARD_HALF_WIDTH_upv_1 * 2, 0.12, 0.1)
        v11.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, n_2 * BALLZ_CONFIG_upv_1.cellSize, -1.65))
    end
    for n_3 = 0, 1 do
        local v12 = makeStagePart_upv_1(container_1)
        v12.Color = u5
        v12.Size = Vector3.new(1.4, CEILING_Y_upv_1 + 2.6, 2.4)
        v12.CFrame = CFrame.new(a1.stage.origin + Vector3.new((((n_3 ~= 0) and 1) or -1) * (BOARD_HALF_WIDTH_upv_1 + 0.7), CEILING_Y_upv_1 / 2, -0.4))
    end
    local v13 = makeStagePart_upv_1(container_1)
    v13.Color = u5
    v13.Size = Vector3.new((BOARD_HALF_WIDTH_upv_1 * 2) + 2.8, 1.4, 2.4)
    v13.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, CEILING_Y_upv_1 + 0.7, -0.4))
    a1.launchLine = makeSmoothPart_upv_1(container_1)
    a1.launchLine.Color = u6
    a1.launchLine.Size = Vector3.new(BOARD_HALF_WIDTH_upv_1 * 2, 0.22, 0.4)
    a1.launchLine.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, 0, 0.6000000238418579))
    a1.dangerLine = makeSmoothPart_upv_1(container_1)
    a1.dangerLine.Material = Enum.Material.Neon
    a1.dangerLine.Color = u7
    a1.dangerLine.Transparency = 0.55
    a1.dangerLine.Size = Vector3.new(BOARD_HALF_WIDTH_upv_1 * 2, 0.14, 0.3)
    a1.dangerLine.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, BALLZ_CONFIG_upv_1.cellSize, 0.5))
    a1.dangerStrip = makeSmoothPart_upv_1(container_1)
    a1.dangerStrip.Material = Enum.Material.Neon
    a1.dangerStrip.Color = u7
    a1.dangerStrip.Transparency = 1
    a1.dangerStrip.Size = Vector3.new(BOARD_HALF_WIDTH_upv_1 * 2, BALLZ_CONFIG_upv_1.cellSize * 2, 0.1)
    a1.dangerStrip.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, BALLZ_CONFIG_upv_1.cellSize, -1.7))
    a1.launcher = makeSmoothPart_upv_1(container_1)
    a1.launcher.Shape = Enum.PartType.Cylinder
    a1.launcher.Material = Enum.Material.Neon
    a1.launcher.Color = u6
    a1.launcher.Size = Vector3.new(0.5, 1.7999999523162842, 1.7999999523162842)
    a1.launcher.CFrame = u1
    local v14 = Instance.new("BillboardGui")
    v14.Size = UDim2.fromScale(3.4, 1.2)
    v14.StudsOffsetWorldSpace = Vector3.new(0, 1.899999976158142, 0)
    v14.AlwaysOnTop = false
    v14.Parent = a1.launcher
    a1.counterLabel = Instance.new("TextLabel")
    a1.counterLabel.BackgroundTransparency = 1
    a1.counterLabel.Size = UDim2.fromScale(1, 1)
    a1.counterLabel.Font = Enum.Font.GothamBlack
    a1.counterLabel.TextScaled = true
    a1.counterLabel.TextColor3 = u11
    a1.counterLabel.TextStrokeTransparency = 0.7
    a1.counterLabel.Parent = v14
    local v15 = BALLZ_CONFIG_upv_1.cellSize * BALLZ_CONFIG_upv_1.brickFill
    local v16
    if BALLZ_CONFIG_upv_1.useAuthoredBrick then
        v16 = v7.brick
    else
        v16 = nil
    end
    local v17 = 0
    local v18 = false
    local v19, v20, v21, v22, v22 = nil, nil, nil, nil, nil
    if v18 then
        v17 = v17 + 1
    else
        v18 = true
    end
    if v17 < CELL_COUNT_upv_1 then
        local v23 = makeStagePart_upv_1(container_1)
        v23.Size = Vector3.new(v15, v15, 1.6)
        v23.CFrame = u1
        if v16 == nil then
            v19 = nil
        else
            v19 = cloneFittedProp_upv_1(v16, container_1, v15)
        end
        if v19 == nil then
            local v24 = v19
        else
            local v24 = v24:FindFirstChild("HP", true)
        end
        v20 = nil
        local v24 = nil
        if v24 ~= nil and (v24:IsA("TextLabel")) then
            v24.Text = ""
            v21 = v24
        else
            v20 = makeSmoothPart_upv_1(container_1)
            v20.Size = Vector3.new(v15 * 0.86, v15 * 0.86, 0.16)
            v20.CFrame = u1
            local v25 = Instance.new("SurfaceGui")
            v25.Face = Enum.NormalId.Back
            v25.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            v25.LightInfluence = 0
            v25.PixelsPerStud = 40
            v25.Parent = v20
            v21 = Instance.new("TextLabel")
            v21.BackgroundTransparency = 1
            v21.Size = UDim2.fromScale(1, 1)
            v21.Font = Enum.Font.GothamBlack
            v21.TextScaled = true
            v21.TextColor3 = u11
            v21.TextStrokeTransparency = 0.75
            v21.Parent = v25
        end
        local cells_1 = a1.cells
        local tbl_4 = {}
        tbl_4.brick = v23
        tbl_4.face = v20
        tbl_4.label = v21
        tbl_4.skin = v19
        if v19 == nil then
            v22 = nil
        else
            v22 = findDominantPart_upv_1(v19)
        end
        tbl_4.skinTint = v22
        if v20 == nil then
            v22 = true
        else
            v22 = false
        end
        tbl_4.labelAutoContrast = v22
        tbl_4.bodyColor = u12
        tbl_4.faceColor = u12
        table.insert(cells_1, tbl_4)
        if v18 then
            v17 = v17 + 1
        else
            v18 = true
        end
        --[[ goto label_18 ]]--
    end
    if BALLZ_CONFIG_upv_1.useAuthoredDot then
        v17 = v7.dot
    else
        v17 = nil
    end
    for _ = 0, BALLZ_CONFIG_upv_1.rows + 2 do
        local v26 = makeSmoothPart_upv_1(container_1)
        v26.Shape = Enum.PartType.Ball
        v26.Material = Enum.Material.Neon
        v26.Color = u9
        v26.Size = Vector3.new(1.100000023841858, 1.100000023841858, 1.100000023841858)
        v26.CFrame = u1
        local v27 = makeSmoothPart_upv_1(container_1)
        v27.Shape = Enum.PartType.Cylinder
        v27.Material = Enum.Material.Neon
        v27.Color = u9
        v27.Transparency = 0.72
        v27.Size = Vector3.new(0.10000000149011612, 2, 2)
        v27.CFrame = u1
        if v17 == nil then
            v20 = nil
        else
            v20 = cloneFittedProp_upv_1(v17, container_1, 1.1)
        end
        if v20 ~= nil then
            v26.Transparency = 1
        end
        table.insert(a1.dotVisuals, {orb = v26, halo = v27, skin = v20})
    end
    if BALLZ_CONFIG_upv_1.useAuthoredBall then
        v18 = v7.ball
    else
        v18 = nil
    end
    for v28 = 0, 59 do
        local v29 = makeSmoothPart_upv_1(container_1)
        v29.Shape = Enum.PartType.Ball
        v29.Color = u8
        v29.Size = Vector3.new(BALLZ_CONFIG_upv_1.ballRadius * 2, BALLZ_CONFIG_upv_1.ballRadius * 2, BALLZ_CONFIG_upv_1.ballRadius * 2)
        v29.CFrame = u1
        if v18 == nil then
            v20 = nil
        else
            v20 = cloneFittedProp_upv_1(v18, container_1, BALLZ_CONFIG_upv_1.ballRadius * 2)
        end
        if v20 ~= nil then
            v29.Transparency = 1
        end
        table.insert(a1.balls, {flight = {}, part = v29, skin = v20})
    end
    local part_1 = a1.balls[1].part
    local v30 = Instance.new("Attachment")
    v30.Position = Vector3.new(0, BALLZ_CONFIG_upv_1.ballRadius * 0.5, 0)
    v30.Parent = part_1
    local v28 = Instance.new("Attachment")
    v28.Position = Vector3.new(0, -BALLZ_CONFIG_upv_1.ballRadius * 0.5, 0)
    v28.Parent = part_1
    a1.ballTrail = Instance.new("Trail")
    a1.ballTrail.Attachment0 = v30
    a1.ballTrail.Attachment1 = v28
    a1.ballTrail.Color = ColorSequence.new(u8)
    a1.ballTrail.Transparency = NumberSequence.new(0.55, 1)
    a1.ballTrail.Lifetime = 0.12
    a1.ballTrail.FaceCamera = true
    a1.ballTrail.Enabled = false
    a1.ballTrail.Parent = part_1
    for _ = 0, BALLZ_CONFIG_upv_1.guideDots - 1 do
        local v31 = makeSmoothPart_upv_1(container_1)
        v31.Material = Enum.Material.Neon
        v31.Color = u10
        v31.Size = Vector3.new(0.41999998688697815, 0.41999998688697815, 0.41999998688697815)
        v31.Transparency = 1
        v31.CFrame = u1
        table.insert(a1.guideDots, v31)
    end
    for _ = 0, 15 do
        local v32 = makeStagePart_upv_1(container_1)
        v32.Size = Vector3.new(0.550000011920929, 0.550000011920929, 0.550000011920929)
        v32.CFrame = u1
        table.insert(a1.chunks, {part = v32})
    end
    for _ = 0, 2 do
        local v33 = makeSmoothPart_upv_1(container_1)
        v33.Shape = Enum.PartType.Cylinder
        v33.Material = Enum.Material.Neon
        v33.Color = u9
        v33.Transparency = 1
        v33.Size = Vector3.new(0.10000000149011612, 2, 2)
        v33.CFrame = u1
        table.insert(a1.bursts, {part = v33})
    end
    for _ = 0, 3 do
        local v34 = makeSmoothPart_upv_1(container_1)
        v34.Transparency = 1
        v34.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
        v34.CFrame = u1
        local v35 = Instance.new("ParticleEmitter")
        v35.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
        v35.Color = ColorSequence.new(u13)
        v35.Size = NumberSequence.new(0.34, 0.08)
        v35.Transparency = NumberSequence.new(0.25, 1)
        v35.Lifetime = NumberRange.new(0.18, 0.28)
        v35.Speed = NumberRange.new(2.5, 4.5)
        v35.SpreadAngle = Vector2.new(65, 65)
        v35.EmissionDirection = Enum.NormalId.Top
        v35.Acceleration = Vector3.new(0, -26, 0)
        v35.Rate = 0
        v35.Parent = v34
        table.insert(a1.puffEmitters, v35)
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1.stage.setFrameWidthFloor(BALLZ_CONFIG_upv_1.portraitFrameWidthFloor)
    a1.stage.setFrameCenter(Vector2.new(0, (CEILING_Y_upv_1 / 2) - 1))
    local input_1 = a1.context.input
    a1.context.janitor:Add(
        input_1.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 545
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.pressHeld = true
                if a3 ~= "key" and a1.phase == "aiming" and not (a1.dead) and not (a1.aiming) then
                    a1.aiming = true
                    a1.aimFromGamepad = false
                    a1.pointerOriginX = a2.X
                    a1.pointerOriginY = a2.Y
                    a1.aimDragStuds = 0
                    return
                end
                return nil
            end
        )
    )
    a1.context.janitor:Add(
        input_1.drag:Connect(
            function(a4, a5)
                --[[
                  line: 556
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a1.aiming and not (a1.aimFromGamepad) then
                    a1:setAimFromPointer(a5)
                else
                    return nil
                end
            end
        )
    )
    a1.context.janitor:Add(
        input_1.pressEnded:Connect(
            function(a6, a7, a8)
                --[[
                  line: 562
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.pressHeld = false
                if a8 ~= "key" and a1.aiming and not (a1.aimFromGamepad) then
                    a1:setAimFromPointer(a6)
                    a1:releaseAim()
                    return
                end
                return nil
            end
        )
    )
end
u18.resetRound = function(a1)
    --[[
      name: resetRound
      line: 571
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        CELL_COUNT_upv_1 (copy, index: 2)
        descendAndSpawn_upv_1 (copy, index: 3)
        specForTurn_upv_1 (copy, index: 4)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.phase = "aiming"
    a1.turn = 1
    a1.completedTurns = 0
    a1.ballCount = BALLZ_CONFIG_upv_1.startingBalls
    a1.launchX = 0
    a1.nextLaunchX = -1000
    a1.firedCount = 0
    a1.fireTimer = 0
    a1.turnClock = 0
    a1.bricksBroken = 0
    a1.clearedThisTurn = 0
    a1.dotsThisTurn = 0
    a1.aiming = false
    a1.aimFromGamepad = false
    a1.pressHeld = false
    a1.padFastForward = false
    a1.descendClock = 0
    local v36 = 0
    local v37 = false
    while true do
        if v37 then
            v36 = v36 + 1
        else
            v37 = true
        end
        if v36 >= CELL_COUNT_upv_1 then
            break
        end
        a1.hp[v36 + 1] = 0
        a1.dot[v36 + 1] = false
    end
    descendAndSpawn_upv_1(a1.hp, a1.dot, specForTurn_upv_1(a1.context.getRunSeed(), 1))
    for _, value_1 in a1.balls do
        value_1.flight.active = false
    end
    a1:dressBoard()
    a1:parkBalls()
    a1:parkGuide()
    a1:parkEffects()
    a1.popups:hideAll()
    a1.context.reportScore(0)
end
u18.revive = function(a1)
    --[[
      name: revive
      line: 619
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        cellIndex_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.phase = "aiming"
    a1.aiming = false
    a1.timeScale = 1
    a1.descendClock = 0
    for n_4 = 0, BALLZ_CONFIG_upv_1.reviveClearRows - 1 do
        for n_5 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
            a1.hp[cellIndex_upv_1(n_5, n_4) + 1] = 0
            a1.dot[cellIndex_upv_1(n_5, n_4) + 1] = false
        end
    end
    for _, value_2 in a1.balls do
        value_2.flight.active = false
    end
    a1:parkBalls()
    a1:dressBoard()
end
u18.captureRound = function(a1)
    --[[
      name: captureRound
      line: 640
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        CELL_COUNT_upv_1 (copy, index: 2)
    ]]
    if not (a1.dead) and a1.phase == "aiming" then
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 645
                  upvalues:
                    a1 (copy, index: 1)
                    CELL_COUNT_upv_1 (copy, index: 2)
                ]]
                a2:int(a1.turn):int(a1.completedTurns):int(a1.ballCount):int(a1.bricksBroken)
                a2:num(a1.launchX)
                local tbl_5 = {}
                local tbl_6 = {}
                local v38 = 0
                local v39 = false
                while true do
                    if v39 then
                        v38 = v38 + 1
                    else
                        v39 = true
                    end
                    if v38 >= CELL_COUNT_upv_1 then
                        break
                    end
                    table.insert(tbl_5, (("%*"):format(a1.hp[v38 + 1])))
                    table.insert(tbl_6, ((a1.dot[v38 + 1]) and "1") or "0")
                end
                a2:str(table.concat(tbl_5, ","))
                a2:str(table.concat(tbl_6, ""))
            end
        )
    end
    return nil
end
u18.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 674
      upvalues:
        readResume_upv_1 (copy, index: 1)
        CELL_COUNT_upv_1 (copy, index: 2)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 3)
    ]]
    local v40 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 675
            ]]
            local tbl_7 = {}
            tbl_7.turn = a3:int()
            tbl_7.completedTurns = a3:int()
            tbl_7.ballCount = a3:int()
            tbl_7.bricksBroken = a3:int()
            tbl_7.launchX = a3:num()
            tbl_7.hpBlob = a3:str()
            tbl_7.dotBlob = a3:str()
            return tbl_7
        end
    )
    local v41 = nil
    if v40 ~= nil then
        v41 = string.split(v40.hpBlob, ",")
        if #v41 == CELL_COUNT_upv_1 and #v40.dotBlob == CELL_COUNT_upv_1 then
            local v42 = 0
            local v43 = false
            while true do
                if v43 then
                    v42 = v42 + 1
                else
                    v43 = true
                end
                local v44
                if v42 >= CELL_COUNT_upv_1 then
                    a1.turn = math.max(v40.turn, 1)
                    a1.completedTurns = math.max(v40.completedTurns, a2.score)
                    a1.ballCount = math.clamp(v40.ballCount, 1, 60)
                    a1.bricksBroken = math.max(v40.bricksBroken, 0)
                    a1.launchX = math.clamp(v40.launchX, -BOARD_HALF_WIDTH_upv_1 + 1, BOARD_HALF_WIDTH_upv_1 - 1)
                    a1.phase = "aiming"
                    a1.descendClock = 0
                    a1:dressBoard()
                    a1:parkBalls()
                    a1.context.reportScore(a2.score)
                    return true
                end
                v44 = tonumber(v41[v42 + 1])
                if v44 == nil then
                    break
                end
                a1.hp[v42 + 1] = math.max(math.floor(v44), 0)
                local dot_1 = a1.dot
                dot_1[v42 + 1] = string.sub(v40.dotBlob, v42 + 1, v42 + 1) == "1"
            end
        end
    end
    return false
end
u18.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 730
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        stepBall_upv_1 (copy, index: 2)
        u14 (copy, index: 3)
    ]]
    if a1.dead then
        return nil
    else
        a1:pollGamepad()
        local v46
        if a1.phase ~= "aiming" and (a1.pressHeld or a1.padFastForward) then
            v46 = BALLZ_CONFIG_upv_1.fastForwardScale
        else
            v46 = 1
        end
        a1.timeScale = v46
        if a1.phase ~= "aiming" then
            a1.turnClock = a1.turnClock + a2
            if a1.phase == "firing" then
                a1.fireTimer = a1.fireTimer - a2
                while a1.fireTimer <= 0 and a1.firedCount < a1.ballCount do
                    local v47 = a1.balls[a1.firedCount + 1]
                    v47.flight.x = a1.launchX
                    v47.flight.y = BALLZ_CONFIG_upv_1.ballRadius
                    v47.flight.velocityX = a1.aimDirX * BALLZ_CONFIG_upv_1.ballSpeed
                    v47.flight.velocityY = a1.aimDirY * BALLZ_CONFIG_upv_1.ballSpeed
                    v47.flight.active = true
                    v47.previousX = v47.flight.x
                    v47.previousY = v47.flight.y
                    v47.gatherClock = 0
                    v47.parked = false
                    a1.firedCount = a1.firedCount + 1
                    a1.fireTimer = a1.fireTimer + BALLZ_CONFIG_upv_1.fireIntervalSeconds
                    if a1.firedCount % 4 == 1 then
                        a1.context.audio.play("pop", {})
                    end
                end
                if a1.ballCount <= a1.firedCount then
                    a1.phase = "flying"
                end
            end
            v46 = a1.firedCount < a1.ballCount
            local v48 = 0
            local v49 = false
            if v49 then
                v48 = v48 + 1
            else
                v49 = true
            end
            local v50 = nil
            while v48 < a1.firedCount do
                v50 = a1.balls[v48 + 1]
                if v50.flight.active then
                    v50.previousX = v50.flight.x
                    v50.previousY = v50.flight.y
                    stepBall_upv_1(v50.flight, a1.hp, a1.dot, a2, a1.events)
                    a1:consumeEvents(v50)
                    v46 = ((v50.flight.active) and true) or v46
                end
                if v49 then
                    v48 = v48 + 1
                else
                    v49 = true
                end
            end
            if not (a1.fastForwardHintShown) and a1.turnClock > 4 and not (a1.pressHeld) and not (a1.padFastForward) then
                a1.fastForwardHintShown = true
                a1.popups:show(a1.stage.origin + Vector3.new(a1.launchX, BALLZ_CONFIG_upv_1.cellSize * 1.6, 0.6), "HOLD TO SPEED UP", u14, 1.4)
            end
            if BALLZ_CONFIG_upv_1.maxTurnSeconds < a1.turnClock then
                for _, value_3 in a1.balls do
                    value_3.flight.active = false
                end
                v46 = a1.firedCount < a1.ballCount
            end
            if not (v46) and a1.phase == "flying" then
                a1:endTurn()
            end
        else
            return nil
        end
    end
end
u18.consumeEvents = function(a1, a2)
    --[[
      name: consumeEvents
      line: 814
      upvalues:
        u9 (copy, index: 1)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 2)
        BALLZ_CONFIG_upv_1 (copy, index: 3)
    ]]
    local brickHit_1 = a1.events.brickHit
    if brickHit_1 >= 0 then
        local v51 = a1.cells[brickHit_1 + 1]
        v51.flash = 1
        if a1.events.brickCleared then
            a1.bricksBroken = a1.bricksBroken + 1
            a1.clearedThisTurn = a1.clearedThisTurn + 1
            a1:hideCell(brickHit_1)
            a1:spawnChunks(brickHit_1, v51.bodyColor)
            a1.lowestRow = a1:computeLowestRow()
            a1.context.audio.play("pop", {})
        else
            v51.label.Text = ("%*"):format(a1.hp[brickHit_1 + 1])
            a1:paintBrick(brickHit_1)
            a1.context.audio.play("thud", {})
        end
    end
    local dotCollected_1 = a1.events.dotCollected
    if dotCollected_1 >= 0 then
        a1.dotsThisTurn = a1.dotsThisTurn + 1
        a1.context.audio.play("coinTick", {})
        a1.popups:show(a1:cellWorldPosition(dotCollected_1, 0), "+1", u9, 0.8)
        a1:spawnBurst(dotCollected_1)
        a1:dressDots()
    end
    local v52 = nil
    if a1.events.landed then
        if a1.nextLaunchX < -999 then
            a1.nextLaunchX = math.clamp(a2.flight.x, -BOARD_HALF_WIDTH_upv_1 + 1, BOARD_HALF_WIDTH_upv_1 - 1)
        end
        a2.gatherClock = BALLZ_CONFIG_upv_1.gatherSeconds
        a2.gatherFromX = a2.flight.x
        local v53 = a1.puffEmitters[a1.puffCursor + 1]
        a1.puffCursor = (a1.puffCursor + 1) % #a1.puffEmitters
        v52 = v53.Parent
        if v52 == nil or not v52:IsA("BasePart") then
            return
        end
        v52.CFrame = CFrame.new(a1.stage.origin + Vector3.new(a2.flight.x, BALLZ_CONFIG_upv_1.ballRadius, 0.4))
        v53:Emit(4)
    end
end
u18.endTurn = function(a1)
    --[[
      name: endTurn
      line: 870
      upvalues:
        publishCombo_upv_1 (copy, index: 1)
        u16 (copy, index: 2)
        descendAndSpawn_upv_1 (copy, index: 3)
        specForTurn_upv_1 (copy, index: 4)
        BALLZ_CONFIG_upv_1 (copy, index: 5)
    ]]
    a1.completedTurns = a1.completedTurns + 1
    a1.context.reportScore(a1.completedTurns)
    if a1.clearedThisTurn >= 6 then
        publishCombo_upv_1({count = a1.clearedThisTurn, color = u16})
    end
    if a1.dotsThisTurn > 0 then
        a1.ballCount = math.min(a1.ballCount + a1.dotsThisTurn, 60)
    end
    if a1.nextLaunchX > -999 then
        a1.launchX = a1.nextLaunchX
    end
    a1.nextLaunchX = -1000
    a1.clearedThisTurn = 0
    a1.dotsThisTurn = 0
    a1.firedCount = 0
    a1.turnClock = 0
    a1.turn = a1.turn + 1
    local v54 = descendAndSpawn_upv_1(a1.hp, a1.dot, specForTurn_upv_1(a1.context.getRunSeed(), a1.turn))
    a1:dressBoard()
    a1.descendClock = BALLZ_CONFIG_upv_1.descendSlideSeconds
    if v54 then
        a1:die()
        return nil
    end
    a1.phase = "aiming"
end
u18.die = function(a1)
    --[[
      name: die
      line: 904
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        u15 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1.timeScale = 1
        a1.stage.shake(1.2)
        a1.context.audio.play("buzz", {})
        a1.popups:show(a1.stage.origin + Vector3.new(0, BALLZ_CONFIG_upv_1.cellSize * 1.5, 0.6), "LINE!", u15, 1.2)
        local completedTurns_upv_1 = a1.completedTurns
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            BALLZ_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 921
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    completedTurns_upv_1 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(completedTurns_upv_1)
            end
        )
    end
end
u18.setAimFromPointer = function(a1, a2)
    --[[
      name: setAimFromPointer
      line: 927
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        clampAim_upv_1 (copy, index: 2)
    ]]
    local v55 = math.max(a1.stage.camera.ViewportSize.Y, 1)
    local v56 = a1.stage.getVisibleHeight() / v55
    local v57 = (a1.pointerOriginX - a2.X) * v56
    local v58 = (a2.Y - a1.pointerOriginY) * v56
    a1.aimDragStuds = math.min(math.sqrt((v57 * v57) + (v58 * v58)), BALLZ_CONFIG_upv_1.dragMaxStuds)
    local v59 = clampAim_upv_1(v57, v58)
    a1.aimDirX = v59.x
    a1.aimDirY = v59.y
end
u18.pollGamepad = function(a1)
    --[[
      name: pollGamepad
      line: 938
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        clampAim_upv_1 (copy, index: 2)
        BALLZ_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v60 = gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)
    a1.padFastForward = v60 and (a1.phase ~= "aiming")
    if v60 then
        if not (a1.aiming) and a1.phase == "aiming" and not (a1.dead) then
            a1.aiming = true
            a1.aimFromGamepad = true
            a1.aimDragStuds = 0
        end
        if a1.aiming then
            local v61 = nil
            if a1.aimFromGamepad then
                local v62 = gamepadInput_upv_1:leftX()
                local v63 = gamepadInput_upv_1:leftY()
                v61 = math.sqrt((v62 * v62) + (v63 * v63))
                if v61 > 0.15 then
                    local v64 = clampAim_upv_1(v62, v63)
                    a1.aimDirX = v64.x
                    a1.aimDirY = v64.y
                    a1.aimDragStuds = v61 * BALLZ_CONFIG_upv_1.dragMaxStuds
                end
                return nil
            end
        end
        return nil
    elseif a1.aiming and a1.aimFromGamepad then
        a1:releaseAim()
    end
end
u18.releaseAim = function(a1)
    --[[
      name: releaseAim
      line: 966
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    local aimDragStuds_1 = a1.aimDragStuds
    a1.aiming = false
    a1.aimFromGamepad = false
    a1:parkGuide()
    if a1.phase == "aiming" and not (a1.dead) and aimDragStuds_1 >= BALLZ_CONFIG_upv_1.minDragStuds then
        a1.phase = "firing"
        a1.firedCount = 0
        a1.fireTimer = 0
        a1.turnClock = 0
        a1.clearedThisTurn = 0
        a1.dotsThisTurn = 0
        a1.nextLaunchX = -1000
        return
    end
    return nil
end
u18.render = function(a1, a2)
    --[[
      name: render
      line: 982
    ]]
    a1:draw(a2)
end
u18.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 985
    ]]
    a1:draw(a2)
end
u18.draw = function(a1, a2)
    --[[
      name: draw
      line: 988
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local origin_1 = a1.stage.origin
    a1.cosmeticClock = (a1.cosmeticClock + a2) % 6283.185307179586
    a1:drawDescendSlide(a2)
    a1.launcher.CFrame = CFrame.new(origin_1 + Vector3.new(a1.launchX, BALLZ_CONFIG_upv_1.ballRadius, 0.4)) * CFrame.Angles(0, 1.5707963267948966, 0)
    a1:drawCounter()
    local v65 = false
    for n_6 = 0, #a1.balls - 1 do
        local v66
        v66 = a1.balls[n_6 + 1]
        if v66.flight.active then
            local v67 = CFrame.new(origin_1 + Vector3.new(lerp_upv_1(v66.previousX, v66.flight.x, renderAlpha_1), lerp_upv_1(v66.previousY, v66.flight.y, renderAlpha_1), 0.4))
            v66.part.CFrame = v67
            if v66.skin ~= nil then
                v66.skin:PivotTo(v67)
            end
            v66.parked = false
            if n_6 == 0 then
                v65 = true
            end
            continue
        elseif v66.gatherClock <= 0 then
            if n_6 ~= 0 or a1.phase ~= "aiming" or a1.dead then
                if v66.parked then
                    continue
                end
                v66.parked = true
                v66.part.CFrame = u1
                if v66.skin ~= nil then
                    v66.skin:PivotTo(u1)
                end
            else
                local v68 = CFrame.new(origin_1 + Vector3.new(a1.launchX, BALLZ_CONFIG_upv_1.ballRadius, 0.4))
                v66.part.CFrame = v68
                if v66.skin ~= nil then
                    v66.skin:PivotTo(v68)
                end
                v66.parked = false
            end
        else
            v66.gatherClock = math.max(v66.gatherClock - a2, 0)
            local v69 = 1 - v66.gatherClock / BALLZ_CONFIG_upv_1.gatherSeconds
            local v70 = CFrame.new(origin_1 + Vector3.new(lerp_upv_1(v66.gatherFromX, a1.launchX, (v69 * v69) * (3 - (2 * v69))), BALLZ_CONFIG_upv_1.ballRadius, 0.4))
            v66.part.CFrame = v70
            if v66.skin ~= nil then
                v66.skin:PivotTo(v70)
            end
            v66.parked = false
        end
    end
    if a1.trailEnabled ~= v65 then
        a1.trailEnabled = v65
        a1.ballTrail.Enabled = v65
    end
    a1:drawCellEffects(a2)
    a1:drawDots(a2)
    a1:drawChunks(a2)
    a1:drawGuide()
end
u18.drawDescendSlide = function(a1, a2)
    --[[
      name: drawDescendSlide
      line: 1059
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.descendClock > 0 then
        a1.descendClock = a1.descendClock - a2
        if a1.descendClock > 0 then
            local v71 = a1.descendClock / BALLZ_CONFIG_upv_1.descendSlideSeconds
            local v72 = BALLZ_CONFIG_upv_1.cellSize * v71 * v71
            a1:poseOccupiedCells(v72)
            local v73 = nil
            for _, value_4 in a1.dotVisuals do
                if not (value_4.inUse) then
                    continue
                end
                v73 = a1.stage.origin + Vector3.new(value_4.x, value_4.y + v72, 0)
                value_4.orb.CFrame = CFrame.new(v73)
                value_4.halo.CFrame = CFrame.new(v73 + Vector3.new(0, 0, -0.20000000298023224)) * CFrame.Angles(0, 1.5707963267948966, 0)
                if value_4.skin ~= nil then
                    value_4.skin:PivotTo(CFrame.new(v73))
                end
            end
        else
            a1.descendClock = 0
            a1:poseOccupiedCells(0)
            a1:dressDots()
            a1.stage.shake(0.25)
            a1.context.audio.play("thud", {})
            return nil
        end
    else
        return nil
    end
end
u18.drawCounter = function(a1)
    --[[
      name: drawCounter
      line: 1095
    ]]
    local v74 = ""
    if not (a1.dead) then
        if a1.phase == "aiming" then
            v74 = ("x%*"):format(a1.ballCount)
        elseif a1.phase == "firing" then
            v74 = ("x%*"):format(a1.ballCount - a1.firedCount)
        end
    end
    if v74 == a1.counterText then
        return
    end
    a1.counterText = v74
    a1.counterLabel.Text = v74
end
u18.drawCellEffects = function(a1, a2)
    --[[
      name: drawCellEffects
      line: 1109
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        CELL_COUNT_upv_1 (copy, index: 2)
        u12 (copy, index: 3)
        u7 (copy, index: 4)
    ]]
    local v75 = math.sin(a1.cosmeticClock * 6) * 0.5 + 0.5
    local v76 = BALLZ_CONFIG_upv_1.cellSize * BALLZ_CONFIG_upv_1.brickFill
    local v77 = 0
    local v78 = false
    local v79, v80, v79, v80 = nil, nil, nil, nil
    if v78 then
        v77 = v77 + 1
    else
        v78 = true
    end
    local v81 = nil
    if v77 < CELL_COUNT_upv_1 then
        local v82 = a1.cells[v77 + 1]
        if a1.hp[v77 + 1] > 0 then
            local v83 = math.floor(v77 / BALLZ_CONFIG_upv_1.columns)
            local v84 = ((v83 == 0) and (v75 * 0.2 + 0.22)) or (((v83 ~= 1) and 0) or (v75 * 0.1 + 0.1))
            if v82.flash > 0 then
                v82.flash = math.max(v82.flash - (a2 / 0.14), 0)
            end
            if v82.flash > 0 or v84 > 0 then
                v82.disturbed = true
                v81 = v82.flash * 0.65
                v79 = v82.bodyColor
                v80 = v82.faceColor
                if v81 > 0 then
                    v79, v80 = v79:Lerp(u12, v81), v80:Lerp(u12, v81)
                end
                if v84 > 0 then
                    v79, v80 = v79:Lerp(u7, v84), v80:Lerp(u7, v84 * 0.6)
                end
                v82.brick.Color = v79
                if v82.face ~= nil then
                    v82.face.Color = v80
                end
                if v82.skinTint ~= nil then
                    v82.skinTint.Color = v79
                end
                local v85 = ((v82.flash <= 0.6) and 1) or (1 - 0.06 * ((v82.flash - 0.6) / 0.4))
                v82.brick.Size = Vector3.new(v76 * v85, v76 * v85, 1.6)
            elseif v82.disturbed then
                v82.disturbed = false
                v82.brick.Color = v82.bodyColor
                if v82.face ~= nil then
                    v82.face.Color = v82.faceColor
                end
                if v82.skinTint ~= nil then
                    v82.skinTint.Color = v82.bodyColor
                end
                v82.brick.Size = Vector3.new(v76, v76, 1.6)
            end
        elseif v82.flash > 0 then
            v82.flash = 0
        end
        if v78 then
            v77 = v77 + 1
        else
            v78 = true
        end
        --[[ goto label_3 ]]--
    end
    local v86 = 1
    if a1.lowestRow > 0 then
        if a1.lowestRow == 1 then
            v77 = v75 * 0.2 + 0.6
        elseif a1.lowestRow ~= 2 then
            v77 = v86
        else
            v77 = 0.85
        end
    else
        v77 = v75 * 0.25 + 0.45
    end
    a1.dangerStrip.Transparency = v77
end
u18.drawDots = function(a1, a2)
    --[[
      name: drawDots
      line: 1185
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_7 = 0, #a1.dotVisuals - 1 do
        local v87
        v87 = a1.dotVisuals[n_7 + 1]
        if v87.inUse then
            local v88 = ((math.sin((a1.cosmeticClock * 4) + (n_7 * 1.7)) * 0.12) + 1) * 2
            v87.halo.Size = Vector3.new(0.1, v88, v88)
        end
    end
    for _, value_5 in a1.bursts do
        if value_5.clock <= 0 then
            continue
        end
        value_5.clock = math.max(value_5.clock - a2, 0)
        if value_5.clock > 0 then
            local v89 = 1 - value_5.clock / 0.25
            local v90 = 2 + 3 * v89
            value_5.part.Size = Vector3.new(0.1, v90, v90)
            value_5.part.Transparency = 0.35 + (0.65 * v89)
            value_5.part.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_5.x, value_5.y, 0.6)) * CFrame.Angles(0, 1.5707963267948966, 0)
        else
            value_5.part.Transparency = 1
            value_5.part.CFrame = u1
        end
    end
end
u18.drawChunks = function(a1, a2)
    --[[
      name: drawChunks
      line: 1215
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_6 in a1.chunks do
        if value_6.life <= 0 then
            continue
        end
        value_6.life = value_6.life - a2
        if value_6.life > 0 then
            value_6.velocityY = value_6.velocityY + (-70 * a2)
            value_6.x = value_6.x + (value_6.velocityX * a2)
            value_6.y = value_6.y + (value_6.velocityY * a2)
            value_6.angle = value_6.angle + (value_6.spin * a2)
            value_6.part.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_6.x, value_6.y, 0.4)) * CFrame.Angles(0, 0, value_6.angle)
        else
            value_6.part.CFrame = u1
        end
    end
end
u18.drawGuide = function(a1)
    --[[
      name: drawGuide
      line: 1236
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        CEILING_Y_upv_1 (copy, index: 2)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 3)
        cellIndex_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
    ]]
    if a1.aiming and a1.phase == "aiming" and not a1.dead and a1.aimDragStuds >= BALLZ_CONFIG_upv_1.minDragStuds then
        local origin_2 = a1.stage.origin
        local v91 = a1.launchX
        local v92 = BALLZ_CONFIG_upv_1.ballRadius
        local v93 = 0
        while true do
            local v94, v95
            if v93 >= CEILING_Y_upv_1 * 1.4 then
                break
            end
            v94 = v91 + a1.aimDirX * 0.5
            v95 = v92 + a1.aimDirY * 0.5
            if BOARD_HALF_WIDTH_upv_1 - BALLZ_CONFIG_upv_1.ballRadius < math.abs(v94) then
                break
            end
            local v96, v97
            if CEILING_Y_upv_1 - BALLZ_CONFIG_upv_1.ballRadius < v95 then
                break
            end
            v96 = math.floor((v94 + BOARD_HALF_WIDTH_upv_1) / BALLZ_CONFIG_upv_1.cellSize)
            v97 = math.floor(v95 / BALLZ_CONFIG_upv_1.cellSize)
            if v97 < 0 or v97 >= BALLZ_CONFIG_upv_1.rows or v96 < 0 or v96 >= BALLZ_CONFIG_upv_1.columns then
                v93 = v93 + 0.5
                v91, v92 = v94, v95
                continue
            end
            if a1.hp[cellIndex_upv_1(v96, v97) + 1] > 0 then
                break
            else
                v93 = v93 + 0.5
                v91, v92 = v94, v95
            end
        end
        for n_8 = 0, #a1.guideDots - 1 do
            local v98 = a1.guideDots[n_8 + 1]
            local v99
            v99 = (n_8 + 1) / (#a1.guideDots + 1) * v93
            if v99 >= 1 then
                v98.Transparency = 0.15
                v98.CFrame = CFrame.new(origin_2 + Vector3.new(a1.launchX + (a1.aimDirX * v99), BALLZ_CONFIG_upv_1.ballRadius + (a1.aimDirY * v99), 0.6))
            else
                v98.Transparency = 1
                v98.CFrame = u1
            end
        end
    else
        a1:parkGuide()
        return nil
    end
end
u18.parkGuide = function(a1)
    --[[
      name: parkGuide
      line: 1280
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_7 in a1.guideDots do
        value_7.Transparency = 1
        value_7.CFrame = u1
    end
end
u18.parkBalls = function(a1)
    --[[
      name: parkBalls
      line: 1286
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_8 in a1.balls do
        value_8.gatherClock = 0
        value_8.parked = true
        value_8.part.CFrame = u1
        if value_8.skin ~= nil then
            value_8.skin:PivotTo(u1)
        end
    end
    if not a1.trailEnabled then
        return
    end
    a1.trailEnabled = false
    a1.ballTrail.Enabled = false
end
u18.parkEffects = function(a1)
    --[[
      name: parkEffects
      line: 1300
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_9 in a1.chunks do
        value_9.life = 0
        value_9.part.CFrame = u1
    end
    for _, value_10 in a1.bursts do
        value_10.clock = 0
        value_10.part.Transparency = 1
        value_10.part.CFrame = u1
    end
end
u18.dressBoard = function(a1)
    --[[
      name: dressBoard
      line: 1311
      upvalues:
        CELL_COUNT_upv_1 (copy, index: 1)
        BALLZ_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v100 = 0
    local v101 = false
    if v101 then
        v100 = v100 + 1
    else
        v101 = true
    end
    if v100 < CELL_COUNT_upv_1 then
        local v102 = a1.cells[v100 + 1]
        if a1.hp[v100 + 1] <= 0 then
            a1:hideCell(v100)
        else
            v102.label.Text = ("%*"):format(a1.hp[v100 + 1])
            a1:paintBrick(v100)
        end
        if v101 then
            v100 = v100 + 1
        else
            v101 = true
        end
        --[[ goto label_3 ]]--
    end
    a1:poseOccupiedCells(((a1.descendClock <= 0) and 0) or (BALLZ_CONFIG_upv_1.cellSize))
    a1.lowestRow = a1:computeLowestRow()
    a1:dressDots()
end
u18.poseOccupiedCells = function(a1, a2)
    --[[
      name: poseOccupiedCells
      line: 1337
      upvalues:
        CELL_COUNT_upv_1 (copy, index: 1)
    ]]
    local v103 = 0
    local v104 = false
    if v104 then
        v103 = v103 + 1
    else
        v104 = true
    end
    if v103 < CELL_COUNT_upv_1 then
        local v105, v106 = nil, nil
        if a1.hp[v103 + 1] > 0 then
            v105 = a1.cells[v103 + 1]
            v106 = a1:cellWorldPosition(v103, a2)
            if v105.skin == nil then
                v105.brick.CFrame = CFrame.new(v106)
            else
                v105.skin:PivotTo(CFrame.new(v106))
            end
            if v105.face ~= nil then
                v105.face.CFrame = CFrame.new(v106 + Vector3.new(0, 0, 0.8899999856948853))
            end
        end
        if v104 then
            v103 = v103 + 1
        else
            v104 = true
        end
    end
end
u18.hideCell = function(a1, a2)
    --[[
      name: hideCell
      line: 1367
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v107 = a1.cells[a2 + 1]
    v107.brick.CFrame = u1
    if v107.face ~= nil then
        v107.face.CFrame = u1
    end
    if v107.skin ~= nil then
        v107.skin:PivotTo(u1)
    end
    v107.flash = 0
    v107.disturbed = false
end
u18.dressDots = function(a1)
    --[[
      name: dressDots
      line: 1379
      upvalues:
        CELL_COUNT_upv_1 (copy, index: 1)
        BALLZ_CONFIG_upv_1 (copy, index: 2)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local v108 = 0
    local v109 = 0
    local v110 = false
    if v110 then
        v109 = v109 + 1
    else
        v110 = true
    end
    local v114 = nil
    if v109 < CELL_COUNT_upv_1 and v108 < #a1.dotVisuals then
        local v112 = nil
        if a1.dot[v109 + 1] then
            v114 = a1.dotVisuals[v108 + 1]
            local v113 = math.floor(v109 / BALLZ_CONFIG_upv_1.columns)
            v114.x = (((v109 % BALLZ_CONFIG_upv_1.columns) + 0.5) * BALLZ_CONFIG_upv_1.cellSize) - BOARD_HALF_WIDTH_upv_1
            v114.y = (v113 + 0.5) * BALLZ_CONFIG_upv_1.cellSize
            v114.inUse = true
            v112 = a1.stage.origin + Vector3.new(v114.x, v114.y, 0)
            v114.orb.CFrame = CFrame.new(v112)
            v114.halo.CFrame = CFrame.new(v112 + Vector3.new(0, 0, -0.20000000298023224)) * CFrame.Angles(0, 1.5707963267948966, 0)
            if v114.skin ~= nil then
                v114.skin:PivotTo(CFrame.new(v112))
            end
            v108 = v108 + 1
        end
        if v110 then
            v109 = v109 + 1
        else
            v110 = true
        end
        --[[ goto label_3 ]]--
    end
    v110, v109 = false, v108
    if v110 then
        v109 = v109 + 1
    else
        v110 = true
    end
    if v109 < #a1.dotVisuals then
        v114 = a1.dotVisuals[v109 + 1]
        v114.inUse = false
        v114.orb.CFrame = u1
        v114.halo.CFrame = u1
        if v114.skin ~= nil then
            v114.skin:PivotTo(u1)
        end
        if v110 then
            v109 = v109 + 1
        else
            v110 = true
        end
        --[[ goto label_7 ]]--
    end
end
u18.spawnChunks = function(a1, a2, a3)
    --[[
      name: spawnChunks
      line: 1438
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 2)
    ]]
    local v115 = math.floor(a2 / BALLZ_CONFIG_upv_1.columns)
    for _ = 0, 3 do
        local v116 = a1.chunks[a1.chunkCursor + 1]
        a1.chunkCursor = (a1.chunkCursor + 1) % 16
        v116.x = (((a2 % BALLZ_CONFIG_upv_1.columns) + 0.5) * BALLZ_CONFIG_upv_1.cellSize) - BOARD_HALF_WIDTH_upv_1 + (((math.random() - 0.5) * BALLZ_CONFIG_upv_1.cellSize) * 0.5)
        v116.y = (v115 + 0.5) * BALLZ_CONFIG_upv_1.cellSize + (((math.random() - 0.5) * BALLZ_CONFIG_upv_1.cellSize) * 0.5)
        v116.velocityX = (math.random() - 0.5) * 22
        v116.velocityY = 8 + (math.random() * 14)
        v116.angle = (math.random() * math.pi) * 2
        v116.spin = (math.random() - 0.5) * 14
        v116.life = 0.55
        v116.part.Color = a3
    end
end
u18.spawnBurst = function(a1, a2)
    --[[
      name: spawnBurst
      line: 1456
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 2)
    ]]
    local v117 = a1.bursts[a1.burstCursor + 1]
    a1.burstCursor = (a1.burstCursor + 1) % 3
    local v118 = math.floor(a2 / BALLZ_CONFIG_upv_1.columns)
    v117.x = (((a2 % BALLZ_CONFIG_upv_1.columns) + 0.5) * BALLZ_CONFIG_upv_1.cellSize) - BOARD_HALF_WIDTH_upv_1
    v117.y = (v118 + 0.5) * BALLZ_CONFIG_upv_1.cellSize
    v117.clock = 0.25
end
u18.computeLowestRow = function(a1)
    --[[
      name: computeLowestRow
      line: 1465
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        cellIndex_upv_1 (copy, index: 2)
    ]]
    for n_9 = 0, BALLZ_CONFIG_upv_1.rows - 1 do
        for n_10 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
            if a1.hp[cellIndex_upv_1(n_10, n_9) + 1] <= 0 then
                continue
            end
            return n_9
        end
    end
    return BALLZ_CONFIG_upv_1.rows
end
u18.paintBrick = function(a1, a2)
    --[[
      name: paintBrick
      line: 1475
      upvalues:
        u17 (copy, index: 1)
        u11 (copy, index: 2)
    ]]
    local v119 = a1.hp[a2 + 1] / math.max(a1.turn, 1)
    local v120 = ((v119 <= 1.2) and ((1 - math.min(v119, 1)) * 0.16)) or 0.78
    local v121 = a1.cells[a2 + 1]
    v121.bodyColor = Color3.fromHSV(v120, 0.72, 0.88)
    v121.faceColor = Color3.fromHSV(v120, 0.396, 1)
    if not (v121.disturbed) then
        v121.brick.Color = v121.bodyColor
        if v121.face ~= nil then
            v121.face.Color = v121.faceColor
        end
        if v121.skinTint ~= nil then
            v121.skinTint.Color = v121.bodyColor
        end
    end
    local v122 = nil
    if v121.labelAutoContrast then
        local v123 = v121.bodyColor
        v122 = ((0.299 * v123.R) + (0.587 * v123.G)) + (0.114 * v123.B) > 0.5
        if v122 ~= v121.labelDark then
            v121.labelDark = v122
            local label_1 = v121.label
            if v122 then
                v123 = u17
            else
                v123 = u11
            end
            label_1.TextColor3 = v123
        end
    end
end
u18.cellWorldPosition = function(a1, a2, a3)
    --[[
      name: cellWorldPosition
      line: 1509
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        BOARD_HALF_WIDTH_upv_1 (copy, index: 2)
    ]]
    return a1.stage.origin + Vector3.new((((a2 % BALLZ_CONFIG_upv_1.columns) + 0.5) * BALLZ_CONFIG_upv_1.cellSize) - BOARD_HALF_WIDTH_upv_1, ((math.floor(a2 / BALLZ_CONFIG_upv_1.columns) + 0.5) * BALLZ_CONFIG_upv_1.cellSize) + a3, 0)
end
u18.destroy = function(a1)
    --[[
      name: destroy
      line: 1516
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    BaseWorldGame_upv_1.destroy(a1)
end
local tbl_8 = {}
tbl_8.BallzGame = u18
return tbl_8