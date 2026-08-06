-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local PhysicsService_upv_1 = v1.PhysicsService
local UserInputService_upv_1 = v1.UserInputService
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local ObjectPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "object-pool").ObjectPool
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v2.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v2.makeSmoothPart
local makeStagePart_upv_1 = v2.makeStagePart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local SUIKA_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").SUIKA_STAGE_LIGHTING
local v3 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network")
local ClientEvents_upv_1 = v3.ClientEvents
local ClientFunctions_upv_1 = v3.ClientFunctions
local readLocalProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "daily-data").readLocalProfile
local friendBestsAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "rival-atoms").friendBestsAtom
local v4 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v4.gameFrozenAtom
local pausedAtom_upv_1 = v4.pausedAtom
local bindAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "binding").bindAtom
local v5 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "board-tab-preference")
local isStrandedOnEmptyFriends_upv_1 = v5.isStrandedOnEmptyFriends
local noteFriendsBoardOpened_upv_1 = v5.noteFriendsBoardOpened
local resolveBoardTab_upv_1 = v5.resolveBoardTab
local mergeFriendsWithLocal_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "friends-board").mergeFriendsWithLocal
local v6 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v6.readResume
local writeResume_upv_1 = v6.writeResume
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v7 = RuntimeLib_1.import(script, script.Parent, "suika-config")
local SUIKA_CONFIG_upv_1 = v7.SUIKA_CONFIG
local SUIKA_TIERS_upv_1 = v7.SUIKA_TIERS
local SuikaFace_upv_1 = RuntimeLib_1.import(script, script.Parent, "suika-faces").SuikaFace
local v8 = RuntimeLib_1.import(script, script.Parent, "suika-leaderboard-board")
local AuthoredLeaderboardBoard_upv_1 = v8.AuthoredLeaderboardBoard
local ProceduralLeaderboardBoard_upv_1 = v8.ProceduralLeaderboardBoard
local buildProceduralBoardPart_upv_1 = v8.buildProceduralBoardPart
local u1 = SUIKA_CONFIG_upv_1.floorY + SUIKA_CONFIG_upv_1.interiorHeight
local u2 = SUIKA_CONFIG_upv_1.interiorWidth / 2
local u3 = SUIKA_CONFIG_upv_1.floorY + SUIKA_CONFIG_upv_1.interiorHeight * SUIKA_CONFIG_upv_1.reviveClearHeightRatio
local u4 = #SUIKA_TIERS_upv_1 - 1
local zero_upv_1 = Vector2.zero
local u5 = CFrame.Angles(0, 1.5707963267948966, 0)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local u6 = Color3.fromRGB(30, 24, 42)
local u7 = Color3.fromRGB(122, 84, 52)
local u8 = Color3.fromRGB(84, 58, 38)
local u9 = Color3.fromRGB(255, 255, 255)
local u10 = Color3.fromRGB(255, 70, 70)
local u11 = Color3.fromRGB(245, 245, 255)
local u12 = Color3.fromRGB(255, 216, 102)
local u13 = Color3.fromRGB(255, 90, 100)
local u14 = Color3.fromRGB(150, 138, 170)
local u15 = Color3.fromRGB(214, 196, 140)
local u16 = Color3.fromRGB(40, 32, 54)
local u17 = Color3.fromRGB(245, 240, 220)
local u18 = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 216, 102)), ColorSequenceKeypoint.new(0.34, Color3.fromRGB(255, 120, 170)), ColorSequenceKeypoint.new(0.67, Color3.fromRGB(120, 226, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 190, 255))})
local function popupColor_1(a1)
    --[[
      name: popupColor
      line: 163
      upvalues:
        u12 (copy, index: 1)
        u11 (copy, index: 2)
    ]]
    if a1 < 8 then
        return u11
    end
    return u12
end
local function applyWeldSurfaces_1(a1)
    --[[
      name: applyWeldSurfaces
      line: 172
    ]]
    a1.TopSurface = Enum.SurfaceType.Weld
    a1.BottomSurface = Enum.SurfaceType.Weld
    a1.FrontSurface = Enum.SurfaceType.Weld
    a1.BackSurface = Enum.SurfaceType.Weld
    a1.LeftSurface = Enum.SurfaceType.Weld
    a1.RightSurface = Enum.SurfaceType.Weld
end
local function squashFactor_1(a1, a2, a3)
    --[[
      name: squashFactor
      line: 189
    ]]
    return Vector3.new(a1.X * a2, a1.Y * a3, a1.Z * a2).Magnitude
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 205
    ]]
    return "SuikaGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u19 = setmetatable(tbl_2, tbl_3)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 211
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v9 = setmetatable({}, u19)
    return v9:constructor(...) or v9
end
u19.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 215
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.previewVisualTier = -1
    a1.nextDisplayCFrame = CFrame.new()
    a1.nextDisplayModels = {}
    a1.leaderboardPollToken = 0
    a1.boardTab = "top200"
    a1.userPickedBoardTab = false
    a1.autoBoardTabSettled = false
    a1.fruitByPart = {}
    a1.activeFruits = {}
    a1.fruitTemplates = {}
    a1.freeVisuals = {}
    a1.usesAuthoredAxes = false
    a1.lastAuthoredOrientation = ""
    a1.aimX = 0
    a1.aimGrabbed = false
    a1.boardDragActive = false
    a1.nextTier = 0
    a1.queuedTier = 0
    a1.score = 0
    a1.overflowTimer = 0
    a1.lastDropAt = 0
    a1.dead = false
    a1.benchmarkCelebrated = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.generationRandom = Random.new()
end
u19.init = function(a1)
    --[[
      name: init
      line: 244
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    return BaseWorldGame_upv_1.init(a1):andThen(
        function()
            --[[
              line: 245
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:refreshLeaderboard()
        end
    )
end
u19.start = function(a1)
    --[[
      name: start
      line: 249
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    BaseWorldGame_upv_1.start(a1)
    a1:refreshLeaderboard()
end
u19.buildScene = function(a1)
    --[[
      name: buildScene
      line: 253
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        makeFrontalBackdrop_upv_1 (copy, index: 3)
        u6 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        u8 (copy, index: 6)
        u2 (copy, index: 7)
        makeSmoothPart_upv_1 (copy, index: 8)
        markWorldArt_upv_1 (copy, index: 9)
        SuikaFace_upv_1 (copy, index: 10)
        u9 (copy, index: 11)
        u10 (copy, index: 12)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 13)
        u18 (copy, index: 14)
        PopupTextPool_upv_1 (copy, index: 15)
        ProceduralLeaderboardBoard_upv_1 (copy, index: 16)
        buildProceduralBoardPart_upv_1 (copy, index: 17)
        bindAtom_upv_1 (copy, index: 18)
        friendBestsAtom_upv_1 (copy, index: 19)
        isStrandedOnEmptyFriends_upv_1 (copy, index: 20)
        ObjectPool_upv_1 (copy, index: 21)
        UserInputService_upv_1 (copy, index: 22)
    ]]
    local container_upv_1 = a1.stage.container
    local origin_1 = a1.stage.origin
    a1.stage.setFrameWidthFloor(SUIKA_CONFIG_upv_1.interiorWidth + (SUIKA_CONFIG_upv_1.wallThickness * 4))
    a1:setupCollisionGroup()
    local v10 = a1:adoptAuthoredMap(container_upv_1)
    a1:applyAuthoredLighting()
    if SUIKA_CONFIG_upv_1.useAuthoredFruits then
        a1:loadFruitTemplates()
    end
    local v11 = (SUIKA_CONFIG_upv_1.floorY + u1) / 2
    if v10 == nil then
        makeFrontalBackdrop_upv_1(a1.stage, u6)
        local v12 = makeStagePart_upv_1(container_upv_1)
        v12.Color = u8
        v12.Size = Vector3.new(SUIKA_CONFIG_upv_1.interiorWidth + (SUIKA_CONFIG_upv_1.wallThickness * 2), SUIKA_CONFIG_upv_1.interiorHeight + 4, 1)
        v12.CFrame = CFrame.new(origin_1 + Vector3.new(0, v11, -((SUIKA_CONFIG_upv_1.wallDepth / 2) + 0.5)))
    end
    local v13 = SUIKA_CONFIG_upv_1.interiorHeight + SUIKA_CONFIG_upv_1.wallThickness
    local v14 = a1:makeWall(container_upv_1)
    v14.Size = Vector3.new(SUIKA_CONFIG_upv_1.wallThickness, v13, SUIKA_CONFIG_upv_1.wallDepth)
    v14.CFrame = CFrame.new(a1:planePoint(-(u2 + (SUIKA_CONFIG_upv_1.wallThickness / 2)), v11)) * a1:planeRotation()
    local v15 = a1:makeWall(container_upv_1)
    v15.Size = Vector3.new(SUIKA_CONFIG_upv_1.wallThickness, v13, SUIKA_CONFIG_upv_1.wallDepth)
    v15.CFrame = CFrame.new(a1:planePoint(u2 + (SUIKA_CONFIG_upv_1.wallThickness / 2), v11)) * a1:planeRotation()
    local v16 = a1:makeWall(container_upv_1)
    v16.Size = Vector3.new(SUIKA_CONFIG_upv_1.interiorWidth + (SUIKA_CONFIG_upv_1.wallThickness * 2), SUIKA_CONFIG_upv_1.wallThickness, SUIKA_CONFIG_upv_1.wallDepth)
    v16.CFrame = CFrame.new(a1:planePoint(0, SUIKA_CONFIG_upv_1.floorY - (SUIKA_CONFIG_upv_1.wallThickness / 2))) * a1:planeRotation()
    if v10 ~= nil then
        v14.Transparency = 1
        v15.Transparency = 1
        v16.Transparency = 1
    end
    local v17 = makeSmoothPart_upv_1(container_upv_1)
    v17.Transparency = 1
    v17.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    v17.CFrame = CFrame.new(origin_1)
    a1.planeAttachment = Instance.new("Attachment")
    local planeAttachment_1 = a1.planeAttachment
    local v18
    if a1.usesAuthoredAxes then
        v18 = CFrame.identity
    else
        v18 = CFrame.Angles(0, 1.5707963267948966, 0)
    end
    planeAttachment_1.CFrame = v18
    a1.planeAttachment.Parent = v17
    a1.preview = makeSmoothPart_upv_1(container_upv_1)
    a1.preview.Shape = Enum.PartType.Ball
    a1.preview.Material = Enum.Material.Plastic
    a1.preview.Transparency = 0.4
    local preview_1 = a1.preview
    preview_1.TopSurface = Enum.SurfaceType.Weld
    preview_1.BottomSurface = Enum.SurfaceType.Weld
    preview_1.FrontSurface = Enum.SurfaceType.Weld
    preview_1.BackSurface = Enum.SurfaceType.Weld
    preview_1.LeftSurface = Enum.SurfaceType.Weld
    preview_1.RightSurface = Enum.SurfaceType.Weld
    a1.previewFaceBillboard = Instance.new("BillboardGui")
    a1.previewFaceBillboard.LightInfluence = 0
    a1.previewFaceBillboard.Enabled = false
    markWorldArt_upv_1(a1.previewFaceBillboard)
    a1.previewFaceBillboard.Parent = a1.preview
    a1.previewFace = SuikaFace_upv_1.new(a1.previewFaceBillboard)
    a1.aimLine = makeSmoothPart_upv_1(container_upv_1)
    a1.aimLine.Material = Enum.Material.Neon
    a1.aimLine.Color = u9
    a1.aimLine.Size = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448)
    a1.aimLine.Transparency = 0.82
    a1.warningLine = makeSmoothPart_upv_1(container_upv_1)
    a1.warningLine.Material = Enum.Material.Neon
    a1.warningLine.Color = u10
    a1.warningLine.Size = Vector3.new(SUIKA_CONFIG_upv_1.interiorWidth, 0.3, SUIKA_CONFIG_upv_1.wallDepth * 0.6)
    a1.warningLine.CFrame = CFrame.new(a1:planePoint(0, u1)) * a1:planeRotation()
    a1.warningLine.Transparency = 1
    a1.burstAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.burstAnchor.Transparency = 1
    a1.burstAnchor.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    local v19 = Instance.new("ParticleEmitter")
    v19.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v19.Rate = 0
    v19.Lifetime = NumberRange.new(0.3, 0.6)
    v19.Speed = NumberRange.new(6, 12)
    v19.SpreadAngle = Vector2.new(180, 180)
    v19.Rotation = NumberRange.new(0, 90)
    v19.RotSpeed = NumberRange.new(-160, 160)
    v19.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.7), NumberSequenceKeypoint.new(1, 0.15)})
    v19.LightEmission = 0.6
    v19.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1)})
    v19.Parent = a1.burstAnchor
    a1.mergeBurst = v19
    a1.celebrationAnchor = makeSmoothPart_upv_1(container_upv_1)
    a1.celebrationAnchor.Transparency = 1
    a1.celebrationAnchor.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    local v20 = Instance.new("ParticleEmitter")
    v20.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v20.Rate = 0
    v20.Lifetime = NumberRange.new(0.7, 1.3)
    v20.Speed = NumberRange.new(14, 26)
    v20.SpreadAngle = Vector2.new(180, 180)
    v20.Rotation = NumberRange.new(0, 90)
    v20.RotSpeed = NumberRange.new(-220, 220)
    v20.Acceleration = Vector3.new(0, -28, 0)
    v20.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.9), NumberSequenceKeypoint.new(1, 0.2)})
    v20.LightEmission = 0.7
    v20.Color = u18
    local tbl_4 = {NumberSequenceKeypoint.new(0, 0.05), NumberSequenceKeypoint.new(1, 1)}
    v20.Transparency = NumberSequence.new(tbl_4)
    v20.Parent = a1.celebrationAnchor
    a1.celebrationBurst = v20
    a1.popups = PopupTextPool_upv_1.new(container_upv_1)
    local v21
    if v10 == nil then
        v21 = v10
    else
        v21 = v10.leaderboard
    end
    local v22 = nil
    if v21 == nil then
        v22 = v21
    else
        v22 = v22.board
    end
    if v22 == nil then
        if v21 == nil then
            a1.board = ProceduralLeaderboardBoard_upv_1.new(buildProceduralBoardPart_upv_1(container_upv_1, origin_1), Enum.NormalId.Back, SUIKA_CONFIG_upv_1.leaderboardWidth, SUIKA_CONFIG_upv_1.leaderboardHeight)
        else
            a1.board = ProceduralLeaderboardBoard_upv_1.new(v21.mount, v21.face, v21.mount.Size.X, v21.mount.Size.Y)
        end
    else
        a1.board = v21.board
    end
    a1.board:mountTabs(
        a1.context.janitor,
        function(a2)
            --[[
              line: 403
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.userPickedBoardTab = true
            a1:pickBoardTab(a2)
        end
    )
    a1.board:showTab(a1.boardTab)
    bindAtom_upv_1(
        a1.context.janitor,
        function()
            --[[
              line: 413
              upvalues:
                friendBestsAtom_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            return friendBestsAtom_upv_1()[a1.context.gameId]
        end,
        function(a3)
            --[[
              line: 415
              upvalues:
                isStrandedOnEmptyFriends_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            local v23 = isStrandedOnEmptyFriends_upv_1(a1.boardTab, a3)
            if not a1.userPickedBoardTab and (not a1.autoBoardTabSettled or (v23)) then
                a1:applyDefaultBoardTab(a3)
                if a1.boardTab == "friends" then
                    a1:paintFriends(a3)
                end
            end
            if a1.boardTab == "friends" then
                a1:paintFriends(a3)
            end
        end
    )
    a1:buildEvolutionRing(container_upv_1, a1:evolutionCenter(v10))
    local v24
    if v10 == nil then
        v24 = v10
    else
        v24 = v10.evolutionScreenFace
    end
    if v24 ~= nil then
        a1:mountPanelLabel(container_upv_1, v10.evolutionScreenFace, "EVOLUTION")
    end
    local v25
    if v10 == nil then
        v25 = v10
    else
        v25 = v10.nextScreenFace
    end
    a1:buildNextIndicator(container_upv_1, v25)
    a1.pool = ObjectPool_upv_1.new(
        function()
            --[[
              line: 440
              upvalues:
                a1 (copy, index: 1)
                container_upv_1 (copy, index: 2)
            ]]
            return a1:makeFruit(container_upv_1)
        end,
        function(a4)
            --[[
              line: 442
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:parkFruit(a4)
        end,
        SUIKA_CONFIG_upv_1.fruitPoolSize
    )
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a5, a6)
                --[[
                  line: 452
                  upvalues:
                    a1 (copy, index: 1)
                    UserInputService_upv_1 (copy, index: 2)
                ]]
                if a6 == "key" then
                    return nil
                elseif a1.board:isScreenPointOver(a1.stage.camera, a5) then
                    a1.boardDragActive = true
                    a1.board:grabScroll()
                    return nil
                elseif UserInputService_upv_1:GetLastInputType() == Enum.UserInputType.Touch then
                    a1.aimGrabbed = true
                end
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.drag:Connect(
            function(a7)
                --[[
                  line: 465
                  upvalues:
                    a1 (copy, index: 1)
                    SUIKA_CONFIG_upv_1 (copy, index: 2)
                ]]
                if a1.boardDragActive then
                    a1.board:scrollBy(-a7.Y * SUIKA_CONFIG_upv_1.boardDragScrollSpeed)
                    return nil
                end
                a1:onAimDrag(a7.X)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function()
                --[[
                  line: 473
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a1.boardDragActive then
                    a1.boardDragActive = false
                    a1.board:releaseScroll()
                    return nil
                end
                a1.aimGrabbed = false
                a1:attemptDrop()
            end
        )
    )
    a1.context.janitor:Add(
        UserInputService_upv_1.InputChanged:Connect(
            function(a8, a9)
                --[[
                  line: 484
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a8.UserInputType ~= Enum.UserInputType.MouseWheel then
                    if not (a9) and not (a1.aimGrabbed) and not (a1.boardDragActive) then
                        if a8.UserInputType == Enum.UserInputType.MouseMovement then
                            a1:onAim(a8.Position.X)
                        end
                        return
                    end
                elseif not a9 and a1.board:isScreenPointOver(a1.stage.camera, Vector2.new(a8.Position.X, a8.Position.Y)) then
                    a1.board:scrollByWheel(-a8.Position.Z)
                end
                return nil
            end
        )
    )
end
u19.resetRound = function(a1)
    --[[
      name: resetRound
      line: 505
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        zero_upv_1 (copy, index: 2)
    ]]
    a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1:releaseAllFruits()
    a1.score = 0
    a1.aimX = 0
    a1.aimGrabbed = false
    a1.boardDragActive = false
    a1.overflowTimer = 0
    a1.dead = false
    a1.benchmarkCelebrated = false
    a1.lastDropAt = 0
    a1.roundToken = a1.roundToken + 1
    a1.nextTier = a1:randomDropTier()
    a1.queuedTier = a1:randomDropTier()
    if a1.usesAuthoredAxes then
        a1:applyAuthoredCamera()
    else
        a1.stage.setFrameCenter(zero_upv_1)
    end
    a1.warningLine.Transparency = 1
    a1:updatePreview()
    a1:updateNextIndicator()
    a1.context.reportScore(0)
end
u19.captureRound = function(a1)
    --[[
      name: captureRound
      line: 530
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 534
              upvalues:
                a1 (copy, index: 1)
            ]]
            a2:int(a1.score):int(a1.nextTier):int(a1.queuedTier)
            a2:num(a1.aimX):num(a1.overflowTimer):bool(a1.benchmarkCelebrated)
            a2:int(#a1.activeFruits)
            local v26 = nil
            local v27 = nil
            for _, value_1 in a1.activeFruits do
                v26 = a1:toPlane(value_1.part.Position)
                v27 = a1:toPlaneVector(value_1.part.AssemblyLinearVelocity)
                a2:int(value_1.tier):bool(value_1.entered)
                a2:num(v26.X):num(v26.Y):num(v26.Z)
                a2:num(v27.X):num(v27.Y):num(v27.Z)
            end
        end
    )
end
u19.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 547
      upvalues:
        readResume_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
        SUIKA_TIERS_upv_1 (copy, index: 3)
        deriveRandom_upv_1 (copy, index: 4)
    ]]
    local v28 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 548
            ]]
            local tbl_5 = {}
            tbl_5.score = a3:int()
            tbl_5.nextTier = a3:int()
            tbl_5.queuedTier = a3:int()
            tbl_5.aimX = a3:num()
            tbl_5.overflowTimer = a3:num()
            tbl_5.benchmarkCelebrated = a3:bool()
            local v29 = a3:int()
            local tbl_6 = {}
            local v30 = 0
            local v31 = false
            v31, v30 = v31, v30
            while true do
                if v31 then
                    v30 = v30 + 1
                else
                    v31 = true
                end
                if v30 >= v29 then
                    break
                end
                table.insert(tbl_6, {tier = a3:int(), entered = a3:bool(), position = Vector3.new(a3:num(), a3:num(), a3:num()), velocity = Vector3.new(a3:num(), a3:num(), a3:num())})
            end
            v30 = table.clone(tbl_5)
            setmetatable(v30, nil)
            v30.fruits = tbl_6
            return v30
        end
    )
    if v28 ~= nil and SUIKA_CONFIG_upv_1.fruitPoolSize >= #v28.fruits then
        a1:releaseAllFruits()
        a1.score = a2.score
        a1.nextTier = math.clamp(v28.nextTier, 0, #SUIKA_TIERS_upv_1 - 1)
        a1.queuedTier = math.clamp(v28.queuedTier, 0, #SUIKA_TIERS_upv_1 - 1)
        a1.overflowTimer = v28.overflowTimer
        a1.benchmarkCelebrated = v28.benchmarkCelebrated
        a1.aimGrabbed = false
        a1.boardDragActive = false
        a1.dead = false
        a1.lastDropAt = 0
        a1.roundToken = a1.roundToken + 1
        for _, value_2 in v28.fruits do
            if value_2.tier >= 0 and #SUIKA_TIERS_upv_1 > value_2.tier then
                a1:acquireFruit({tier = value_2.tier, position = value_2.position, entered = value_2.entered, velocity = value_2.velocity})
                continue
            end
            return false
        end
        a1.warningLine.Transparency = 1
        a1.aimX = a1:clampAim(v28.aimX)
        a1:updatePreview()
        a1:updateNextIndicator()
        a1.generationRandom = deriveRandom_upv_1(a1.context.getRunSeed(), #a1.activeFruits + 1)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u19.revive = function(a1)
    --[[
      name: revive
      line: 628
      upvalues:
        u3 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.dead = false
    a1.aimGrabbed = false
    a1.boardDragActive = false
    a1.overflowTimer = 0
    a1.lastDropAt = 0
    a1.roundToken = a1.roundToken + 1
    local Y_1 = a1.stage.origin.Y
    local tbl_7 = {}
    local activeFruits_1 = a1.activeFruits
    table.move(activeFruits_1, 1, #activeFruits_1, #tbl_7 + 1, tbl_7)
    local v32 = 0
    for _, value_3 in tbl_7 do
        if u3 < (value_3.part.Position.Y - Y_1) or value_3.tier < SUIKA_CONFIG_upv_1.reviveClearTiers then
            a1:emitBurst(value_3.part.Position, value_3.part.Color)
            a1:releaseFruit(value_3)
            v32 = v32 + 1
        end
    end
    if v32 > 0 then
        a1.context.audio.play("splash", {})
        a1.stage.shake(0.4)
    end
    a1:freezePile(false)
    a1.warningLine.Transparency = 1
    a1.aimX = a1:clampAim(a1.aimX)
    a1:updatePreview()
    a1:updateNextIndicator()
    a1:setRunning(true)
end
u19.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 673
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v33 = nil
    if a1.dead then
        return nil
    else
        v33 = gamepadInput_upv_1:moveX()
        if v33 ~= 0 then
            a1.aimX = a1:clampAim(a1.aimX + ((v33 * SUIKA_CONFIG_upv_1.gamepadAimSpeedStuds) * a2))
        end
        local Y_2 = a1.stage.origin.Y
        local v34 = os.clock()
        local v35 = false
        local Y_3 = nil
        local v36 = nil
        for _, value_4 in a1.activeFruits do
            Y_3 = value_4.part.AssemblyLinearVelocity.Y
            if value_4.lastVelocityY < -SUIKA_CONFIG_upv_1.hardLandingSpeed and SUIKA_CONFIG_upv_1.hardLandingSpeed * 0.75 < Y_3 - value_4.lastVelocityY then
                value_4.squishUntil = v34 + SUIKA_CONFIG_upv_1.squishSeconds
            end
            value_4.lastVelocityY = Y_3
            v36 = value_4.part.Position.Y - Y_2
            if value_4.entered then
                if u1 + SUIKA_CONFIG_upv_1.overflowMargin < v36 then
                    local v37 = true
                end
            elseif v36 <= u1 or SUIKA_CONFIG_upv_1.enterGraceSeconds < v34 - value_4.spawnTime then
                value_4.entered = true
                if u1 + SUIKA_CONFIG_upv_1.overflowMargin < v36 then
                    local v37 = true
                end
            end
        end
        if v35 then
            a1.overflowTimer = a1.overflowTimer + a2
            if SUIKA_CONFIG_upv_1.overflowGraceSeconds <= a1.overflowTimer then
                a1:die()
                return nil
            end
        else
            a1.overflowTimer = 0
        end
    end
end
u19.render = function(a1)
    --[[
      name: render
      line: 722
    ]]
    a1:refreshAuthoredCameraIfRotated()
    a1:updatePreview()
    a1:updateWarning()
    a1:updateFruitJuice()
end
u19.onIdle = function(a1)
    --[[
      name: onIdle
      line: 728
    ]]
    a1:refreshAuthoredCameraIfRotated()
    a1:updateWarning()
    a1:updateFruitJuice()
end
u19.updateFruitJuice = function(a1)
    --[[
      name: updateFruitJuice
      line: 733
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v37 = os.clock()
    local v38, v39 = nil, nil
    local value_5 = nil
    local v40 = nil
    local v41 = nil
    local v42 = nil
    local face_1 = nil
    local v43 = nil
    local v44 = nil
    for _, value_5 in a1.activeFruits do
        if value_5.nextBlinkAt <= v37 then
            value_5.blinkUntil = v37 + SUIKA_CONFIG_upv_1.blinkSeconds
            value_5.nextBlinkAt = (v37 + SUIKA_CONFIG_upv_1.blinkIntervalMin) + (a1.random:NextNumber() * (SUIKA_CONFIG_upv_1.blinkIntervalMax - SUIKA_CONFIG_upv_1.blinkIntervalMin))
        end
        v43 = value_5.squishUntil - v37
        v38 = 0
        if v43 > 0 then
            local v45 = 1 - v43 / SUIKA_CONFIG_upv_1.squishSeconds
            v38 = SUIKA_CONFIG_upv_1.squishAmount * math.cos((1 - v43 / SUIKA_CONFIG_upv_1.squishSeconds) * SUIKA_CONFIG_upv_1.squishCycles * math.pi) * (1 - (1 - v43 / SUIKA_CONFIG_upv_1.squishSeconds))
        end
        v40 = math.sin((v37 * SUIKA_CONFIG_upv_1.idleWobbleSpeed) + value_5.wobblePhase) * SUIKA_CONFIG_upv_1.idleWobbleAmount
        v41 = 1 + v40 - v38
        v42 = 1 - (v40 * 0.6) + v38 * 0.6
        v44 = value_5.visual
        if v44 == nil then
            value_5.mesh.Scale = Vector3.new(v42, v41, v42)
        else
            a1:layoutVisual(v44, value_5.part.CFrame, v42, v41)
        end
        face_1 = value_5.face
        v39 = true
        if v38 <= 0 then
            v39 = v37 < value_5.blinkUntil
        end
        face_1:setEyesClosed(v39)
    end
end
u19.setupCollisionGroup = function(a1)
    --[[
      name: setupCollisionGroup
      line: 764
      upvalues:
        PhysicsService_upv_1 (copy, index: 1)
    ]]
    local v45 = ((pcall(
        function()
            --[[
              line: 765
              upvalues:
                PhysicsService_upv_1 (copy, index: 1)
            ]]
            if not (PhysicsService_upv_1:IsCollisionGroupRegistered("SuikaFruit")) then
                PhysicsService_upv_1:RegisterCollisionGroup("SuikaFruit")
            end
            PhysicsService_upv_1:CollisionGroupSetCollidable("SuikaFruit", "Default", false)
        end
    )) and "SuikaFruit") or nil
    a1.collisionGroup = v45
end
u19.makeWall = function(a1, a2)
    --[[
      name: makeWall
      line: 775
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        SUIKA_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v46 = makeStagePart_upv_1(a2)
    v46.Anchored = true
    v46.CanCollide = true
    v46.CanTouch = false
    v46.CanQuery = false
    v46.Color = u7
    v46.CustomPhysicalProperties = PhysicalProperties.new(1, SUIKA_CONFIG_upv_1.friction, SUIKA_CONFIG_upv_1.elasticity)
    if a1.collisionGroup ~= nil then
        v46.CollisionGroup = a1.collisionGroup
    end
    return v46
end
local function findPanelFace_upv_1(a1)
    --[[
      name: findPanelFace
      line: 116
    ]]
    if a1 ~= nil then
        local v47 = nil
        local v48 = 0
        v47 = v47
        local v49 = nil
        local _ = nil
        for v50, value_6 in a1:GetDescendants() do
            v49 = value_6:IsA("BasePart")
            if not (v49) then
                continue
            end
            v49 = value_6.Size.X * value_6.Size.Y
            if v48 < v49 then
                v48, v47 = v49, value_6
            end
        end
        return v47
    end
    return nil
end
u19.adoptAuthoredMap = function(a1, a2)
    --[[
      name: adoptAuthoredMap
      line: 789
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        AuthoredLeaderboardBoard_upv_1 (copy, index: 4)
        findPanelFace_upv_1 (copy, index: 5)
    ]]
    local v50 = waitForSceneryRoot_upv_1("Suika", "Suika")
    local v51
    if v50 == nil then
        v51 = v50
    else
        v51 = v50:FindFirstChild("Essentials")
    end
    if v50 ~= nil and v51 ~= nil then
        local v52 = nil
        if v51:FindFirstChild("Bucket") ~= nil then
            a1.usesAuthoredAxes = true
            local v53 = CFrame.new(a1.stage.origin + Vector3.new((SUIKA_CONFIG_upv_1.wallDepth / 2) - 6, SUIKA_CONFIG_upv_1.floorY - 24, 35.5))
            local v54 = nil
            local v55 = nil
            local _ = nil
            local v62 = nil
            for v56, v52 in v50:GetChildren() do
                if v52.Name == "SuikaFruits" then
                    continue
                end
                v55 = v52:Clone()
                for v63, value_7 in v55:GetDescendants() do
                    if value_7:IsA("BasePart") then
                        value_7.Anchored = true
                        value_7.CanCollide = false
                        value_7.CanQuery = false
                        value_7.CanTouch = false
                        value_7.CastShadow = false
                    end
                end
                a1:transformAdopted(v55, v53)
                v55.Parent = a2
                if v55.Name == "Essentials" then
                    v54 = v55
                end
            end
            local v57 = nil
            local v58 = nil
            if v54 == nil then
                local v59 = v54
            else
                v58 = v54:FindFirstChild("Leaderboard")
                if v58 == nil then
                    local v59 = v58
                else
                    local v59 = v58:FindFirstChild("LeaderboardPlane", true)
                end
            end
            local v59, v60 = nil, nil
            if v59 ~= nil and (v59:IsA("BasePart")) then
                v59.Transparency = 1
                local v56 = a1:toPlane(v59.Position)
                v52 = a1:axisExtent(v59, a1:planeVector(1, 0, 0))
                v55 = a1:axisExtent(v59, Vector3.new(0, 1, 0))
                local v61 = makeSmoothPart_upv_1(a2)
                v61.Transparency = 1
                v61.CanQuery = true
                v61.Size = Vector3.new(v52, v55, 0.2)
                v61.CFrame = CFrame.new(a1:planePoint(v56.X, v56.Y, (v56.Z + (a1:depthExtent(v59) / 2)) + 0.15)) * a1:boardRotation()
                local Back_1 = Enum.NormalId.Back
                local tbl_8 = {}
                tbl_8.mount = v61
                tbl_8.face = Back_1
                tbl_8.board = AuthoredLeaderboardBoard_upv_1:adopt(a1.context.janitor, v59, v61, Back_1)
                v60 = tbl_8
            else
                warn("[Suika] authored map has no LeaderboardPlane \226\128\148 building the procedural board")
                v60 = v57
            end
            local v56 = {}
            v56.leaderboard = v60
            v52 = v54
            if v52 ~= nil then
                v52 = v52:FindFirstChild("NextScreen")
            end
            v56.nextScreenFace = findPanelFace_upv_1(v52)
            if v54 == nil then
                v55 = v54
            else
                v55 = v55:FindFirstChild("EvolutionScreen")
            end
            v56.evolutionScreenFace = findPanelFace_upv_1(v55)
            return v56
        end
    end
    warn("[Suika] missing scenery asset Suika.Essentials.Bucket \226\128\148 using the procedural container")
    return nil
end
u19.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 883
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        readLightingFolderProfile_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        SUIKA_STAGE_LIGHTING_upv_1 (copy, index: 4)
    ]]
    local v62 = waitForSceneryRoot_upv_1("Suika", "Suika")
    if v62 ~= nil then
        v62 = v62:FindFirstChild("Lighting")
    end
    if v62 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(v62, tbl_upv_1, SUIKA_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u19.loadFruitTemplates = function(a1)
    --[[
      name: loadFruitTemplates
      line: 894
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
    ]]
    local v63 = waitForSceneryRoot_upv_1("Suika", "Suika")
    if v63 ~= nil then
        v63 = v63:FindFirstChild("SuikaFruits")
    end
    if v63 ~= nil then
        local v64 = nil
        local v65 = nil
        local value_8 = nil
        for _, value_8 in v63:GetChildren() do
            if not (value_8:IsA("Model")) then
                continue
            end
            v64 = tonumber(string.match(value_8.Name, "^(%d+)"))
            if v64 == nil then
                continue
            end
            v65 = v64 - 1
            if v65 < 0 then
                continue
            end
            if u4 >= v65 then
                a1.fruitTemplates[v65] = value_8
            end
        end
    else
        warn("[Suika] missing scenery asset Suika.SuikaFruits \226\128\148 using the ball fruits")
        return nil
    end
end
u19.transformAdopted = function(a1, a2, a3)
    --[[
      name: transformAdopted
      line: 920
    ]]
    if a2:IsA("Model") then
        a2:PivotTo(a3 * a2:GetPivot())
        return nil
    end
    if a2:IsA("BasePart") then
        a2.CFrame = a3 * a2.CFrame
        return nil
    end
    for _, value_9 in a2:GetChildren() do
        a1:transformAdopted(value_9, a3)
    end
end
u19.planePoint = function(a1, a2, a3, a4)
    --[[
      name: planePoint
      line: 938
    ]]
    if a4 == nil then
        a4 = 0
    end
    local origin_2 = a1.stage.origin
    if a1.usesAuthoredAxes then
        return origin_2 + Vector3.new(-a4, a3, a2)
    end
    return origin_2 + Vector3.new(a2, a3, a4)
end
u19.planeVector = function(a1, a2, a3, a4)
    --[[
      name: planeVector
      line: 953
    ]]
    if a4 == nil then
        a4 = 0
    end
    if a1.usesAuthoredAxes then
        return (Vector3.new(-a4, a3, a2))
    end
    return (Vector3.new(a2, a3, a4))
end
u19.toPlane = function(a1, a2)
    --[[
      name: toPlane
      line: 959
    ]]
    local v66 = a2 - a1.stage.origin
    if a1.usesAuthoredAxes then
        return (Vector3.new(v66.Z, v66.Y, -v66.X))
    end
    return v66
end
u19.toPlaneVector = function(a1, a2)
    --[[
      name: toPlaneVector
      line: 965
    ]]
    if a1.usesAuthoredAxes then
        return (Vector3.new(a2.Z, a2.Y, -a2.X))
    end
    return a2
end
u19.planeRotation = function(a1)
    --[[
      name: planeRotation
      line: 968
      upvalues:
        u5 (copy, index: 1)
    ]]
    if a1.usesAuthoredAxes then
        return u5
    end
    return CFrame.identity
end
u19.boardRotation = function(a1)
    --[[
      name: boardRotation
      line: 971
    ]]
    if a1.usesAuthoredAxes then
        return (CFrame.Angles(0, -1.5707963267948966, 0))
    end
    return CFrame.identity
end
u19.axisExtent = function(a1, a2, a3)
    --[[
      name: axisExtent
      line: 974
    ]]
    local CFrame_1 = a2.CFrame
    return ((math.abs(CFrame_1.RightVector:Dot(a3)) * a2.Size.X) + (math.abs(CFrame_1.UpVector:Dot(a3)) * a2.Size.Y)) + (math.abs(CFrame_1.LookVector:Dot(a3)) * a2.Size.Z)
end
u19.depthExtent = function(a1, a2)
    --[[
      name: depthExtent
      line: 978
    ]]
    return a1:axisExtent(a2, a1:planeVector(0, 0, 1))
end
u19.applyAuthoredCamera = function(a1)
    --[[
      name: applyAuthoredCamera
      line: 981
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local origin_3 = a1.stage.origin
    local camera_1 = a1.stage.camera
    local v67 = math.tan(math.rad(camera_1.FieldOfView / 2))
    local ViewportSize_1 = camera_1.ViewportSize
    a1.stage.setCameraCFrame(CFrame.lookAt(origin_3 + Vector3.new(-math.max((a1.stage.frameHeight / 2) / v67, (SUIKA_CONFIG_upv_1.interiorWidth + (SUIKA_CONFIG_upv_1.wallThickness * 4)) / ((v67 * 2) * math.max(ViewportSize_1.X / math.max(ViewportSize_1.Y, 1), 0.001))), 0, 0), origin_3))
    a1.lastAuthoredOrientation = a1.stage.getOrientation()
end
u19.refreshAuthoredCameraIfRotated = function(a1)
    --[[
      name: refreshAuthoredCameraIfRotated
      line: 999
    ]]
    if a1.usesAuthoredAxes and a1.stage.getOrientation() ~= a1.lastAuthoredOrientation then
        a1:applyAuthoredCamera()
    else
        return nil
    end
end
u19.evolutionCenter = function(a1, a2)
    --[[
      name: evolutionCenter
      line: 1008
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v68
    if a2 == nil then
        v68 = a2
    else
        v68 = a2.evolutionScreenFace
    end
    if v68 ~= nil then
        local v69 = a1:toPlane(v68.Position)
        return (Vector3.new(v69.X, v69.Y, v69.Z + ((a1:depthExtent(v68) / 2 + (SUIKA_CONFIG_upv_1.evolutionMaxDiameter / 2)) + 0.2)))
    end
    return (Vector3.new(SUIKA_CONFIG_upv_1.evolutionCenterX, SUIKA_CONFIG_upv_1.evolutionCenterY, 0))
end
u19.buildEvolutionRing = function(a1, a2, a3)
    --[[
      name: buildEvolutionRing
      line: 1021
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u14 (copy, index: 4)
    ]]
    local v70 = #SUIKA_TIERS_upv_1
    local tbl_9 = {}
    local v71 = 0
    local v72 = false
    while true do
        if v72 then
            v71 = v71 + 1
        else
            v72 = true
        end
        local v73
        if v71 >= v70 then
            break
        end
        v73 = 1.5707963267948966 - v71 * (math.tau / v70)
        table.insert(tbl_9, (a1:planePoint(a3.X + (math.cos(v73) * SUIKA_CONFIG_upv_1.evolutionRadius), a3.Y + (math.sin(v73) * SUIKA_CONFIG_upv_1.evolutionRadius), a3.Z)))
    end
    v71 = a1:planeVector(0, 0, 1)
    local v73
    v73, v72 = false, 0
    while true do
        if v73 then
            v72 = v72 + 1
        else
            v73 = true
        end
        if v72 >= v70 - 1 then
            break
        end
        local v74 = tbl_9[v72 + 1]
        local v75 = tbl_9[v72 + 2]
        local v76 = v75 - v74
        local v77 = makeSmoothPart_upv_1(a2)
        v77.Material = Enum.Material.Neon
        v77.Color = u14
        v77.Transparency = 0.5
        v77.Size = Vector3.new(SUIKA_CONFIG_upv_1.evolutionLinkThickness, SUIKA_CONFIG_upv_1.evolutionLinkThickness, v76.Magnitude)
        v77.CFrame = CFrame.lookAt(v74 + (v76 / 2), v75, v71)
    end
    v72 = math.max(v70 - 1, 1)
    local v74
    v74, v73 = false, 0
    if v74 then
        v73 = v73 + 1
    else
        v74 = true
    end
    local v78 = nil
    if v73 < v70 then
        v78 = SUIKA_TIERS_upv_1[v73 + 1]
        local v79, v80 = nil, nil
        if v78 ~= nil then
            v79 = SUIKA_CONFIG_upv_1.evolutionMinDiameter + (SUIKA_CONFIG_upv_1.evolutionMaxDiameter - SUIKA_CONFIG_upv_1.evolutionMinDiameter) * (v73 / v72)
            v80 = a1:makeDisplayModel(a2, v73, v79)
            if v80 == nil then
                local v81 = makeSmoothPart_upv_1(a2)
                v81.Shape = Enum.PartType.Ball
                v81.Material = Enum.Material.Plastic
                v81.Color = v78.color
                v81.Size = Vector3.new(v79, v79, v79)
                v81.CFrame = CFrame.new(tbl_9[v73 + 1])
                v81.TopSurface = Enum.SurfaceType.Weld
                v81.BottomSurface = Enum.SurfaceType.Weld
                v81.FrontSurface = Enum.SurfaceType.Weld
                v81.BackSurface = Enum.SurfaceType.Weld
                v81.LeftSurface = Enum.SurfaceType.Weld
                v81.RightSurface = Enum.SurfaceType.Weld
            else
                a1:pivotDisplayTo(v80, tbl_9[v73 + 1])
            end
        end
        if v74 then
            v73 = v73 + 1
        else
            v74 = true
        end
    end
end
u19.buildNextIndicator = function(a1, a2, a3)
    --[[
      name: buildNextIndicator
      line: 1107
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
        SUIKA_TIERS_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u15 (copy, index: 4)
        u16 (copy, index: 5)
        markWorldArt_upv_1 (copy, index: 6)
        SuikaFace_upv_1 (copy, index: 7)
    ]]
    local origin_4 = a1.stage.origin
    local nextIndicatorBoxSize_1 = SUIKA_CONFIG_upv_1.nextIndicatorBoxSize
    local v82 = SUIKA_TIERS_upv_1[#SUIKA_CONFIG_upv_1.dropWeights]
    local v83 = ((v82 == nil) and 1.4) or (v82.diameter * SUIKA_CONFIG_upv_1.nextIndicatorScale / 2)
    local v84, v85
    if a3 == nil then
        local v86 = origin_4 + Vector3.new(SUIKA_CONFIG_upv_1.nextIndicatorX, SUIKA_CONFIG_upv_1.nextIndicatorY, 0)
        local v87 = makeSmoothPart_upv_1(a2)
        v87.Material = Enum.Material.SmoothPlastic
        v87.Color = u15
        v87.Size = Vector3.new(nextIndicatorBoxSize_1 + 0.7, nextIndicatorBoxSize_1 + 0.7, 0.4)
        v87.CFrame = CFrame.new(v86 + Vector3.new(0, 0, -0.8999999761581421))
        local v88 = makeSmoothPart_upv_1(a2)
        v88.Material = Enum.Material.SmoothPlastic
        v88.Color = u16
        v88.Size = Vector3.new(nextIndicatorBoxSize_1, nextIndicatorBoxSize_1, 0.4)
        v88.CFrame = CFrame.new(v86 + Vector3.new(0, 0, -0.6000000238418579))
        v84, v85 = v88, CFrame.new(v86)
    else
        local v89 = a1:toPlane(a3.Position)
        v85 = CFrame.new(a1:planePoint(v89.X, v89.Y, ((v89.Z + (a1:depthExtent(a3) / 2)) + v83) + 0.1))
        v84 = a3
    end
    a1:mountPanelLabel(a2, v84, "NEXT")
    local v90 = makeSmoothPart_upv_1(a2)
    v90.Shape = Enum.PartType.Ball
    v90.Material = Enum.Material.Plastic
    v90.CFrame = v85
    v90.TopSurface = Enum.SurfaceType.Weld
    v90.BottomSurface = Enum.SurfaceType.Weld
    v90.FrontSurface = Enum.SurfaceType.Weld
    v90.BackSurface = Enum.SurfaceType.Weld
    v90.LeftSurface = Enum.SurfaceType.Weld
    v90.RightSurface = Enum.SurfaceType.Weld
    a1.nextBall = v90
    a1.nextDisplayCFrame = v85
    a1.nextFaceBillboard = Instance.new("BillboardGui")
    a1.nextFaceBillboard.LightInfluence = 0
    a1.nextFaceBillboard.Enabled = false
    markWorldArt_upv_1(a1.nextFaceBillboard)
    a1.nextFaceBillboard.Parent = v90
    a1.nextFace = SuikaFace_upv_1.new(a1.nextFaceBillboard)
end
u19.makeDisplayModel = function(a1, a2, a3, a4)
    --[[
      name: makeDisplayModel
      line: 1152
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
    ]]
    local v91 = a1.fruitTemplates[a3]
    local v92 = SUIKA_TIERS_upv_1[a3 + 1]
    if v91 ~= nil and v92 ~= nil then
        local v93 = v91:Clone()
        for _, value_10 in v93:GetDescendants() do
            if value_10:IsA("BillboardGui") then
                value_10:Destroy()
            end
        end
        for _, value_11 in v93:GetDescendants() do
            if value_11:IsA("BasePart") then
                value_11.Anchored = true
                value_11.CanCollide = false
                value_11.CanQuery = false
                value_11.CanTouch = false
            end
        end
        v93:ScaleTo(v93:GetScale() * (a4 / v92.diameter))
        v93.Parent = a2
        return v93
    end
    return nil
end
u19.pivotDisplayTo = function(a1, a2, a3)
    --[[
      name: pivotDisplayTo
      line: 1181
    ]]
    a2:PivotTo(CFrame.new(a3) * a2:GetPivot().Rotation)
end
u19.mountPanelLabel = function(a1, a2, a3, a4)
    --[[
      name: mountPanelLabel
      line: 1187
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    local v94 = a1:toPlane(a3.Position)
    local v95 = a1:axisExtent(a3, a1:planeVector(1, 0, 0))
    local v96 = a1:axisExtent(a3, Vector3.new(0, 1, 0))
    local v97 = makeSmoothPart_upv_1(a2)
    v97.Transparency = 1
    v97.Size = Vector3.new(0.4000000059604645, 0.4000000059604645, 0.4000000059604645)
    v97.CFrame = CFrame.new(a1:planePoint(v94.X, v94.Y, (v94.Z + (a1:depthExtent(a3) / 2)) + 0.1)) * a1:boardRotation()
    local v98 = Instance.new("BillboardGui")
    v98.Size = UDim2.fromScale(v95, math.min(v95 * 0.34, 2.2))
    v98.StudsOffsetWorldSpace = Vector3.new(0, (v96 / 2) + 0.9, 0)
    v98.AlwaysOnTop = true
    v98.Parent = v97
    local v99 = Instance.new("TextLabel")
    v99.BackgroundTransparency = 1
    v99.Size = UDim2.fromScale(1, 1)
    v99.Font = Enum.Font.GothamBlack
    v99.Text = a4
    v99.TextColor3 = u17
    v99.TextScaled = true
    v99.TextStrokeTransparency = 0.5
    v99.Parent = v98
end
u19.refreshLeaderboard = function(a1)
    --[[
      name: refreshLeaderboard
      line: 1213
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
        ClientFunctions_upv_1 (copy, index: 2)
    ]]
    local roundToken_upv_1 = a1.roundToken
    a1.leaderboardPollToken = a1.leaderboardPollToken + 1
    local leaderboardPollToken_upv_1 = a1.leaderboardPollToken
    ClientEvents_upv_1.requestFriendBests:fire(a1.context.gameId)
    task.spawn(
        function()
            --[[
              line: 1223
              upvalues:
                ClientFunctions_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                roundToken_upv_1 (copy, index: 3)
                leaderboardPollToken_upv_1 (copy, index: 4)
            ]]
            local v100 = os.clock() + 300
            local v101 = false
            local v102, _, v105 = nil, nil, nil
            while not (v101) do
                local v103, v104 = ClientFunctions_upv_1.fetchLeaderboard:invoke(a1.context.gameId):await()
                v102 = true
                if a1.roundToken == roundToken_upv_1 then
                    v102 = a1.leaderboardPollToken ~= leaderboardPollToken_upv_1
                end
                if not v102 then
                    if v103 then
                        a1.lastBoardSnapshot = v104
                        v102 = true
                        if v104.fetchedAt <= 0 then
                            v102 = v100 <= os.clock()
                        end
                        if a1.boardTab == "top200" then
                            a1.board:populate(v104, v102)
                        end
                        if not v102 then
                            task.wait(1)
                            v102 = true
                            if a1.roundToken == roundToken_upv_1 then
                                v102 = a1.leaderboardPollToken ~= leaderboardPollToken_upv_1
                            end
                            if not (v102) then
                                v101 = v102
                                continue
                            end
                        end
                        return nil
                    elseif a1.boardTab == "top200" then
                        a1.board:showStatus("Board unavailable")
                    end
                end
                return nil
            end
        end
    )
end
u19.applyDefaultBoardTab = function(a1, a2)
    --[[
      name: applyDefaultBoardTab
      line: 1253
      upvalues:
        readLocalProfile_upv_1 (copy, index: 1)
        resolveBoardTab_upv_1 (copy, index: 2)
        noteFriendsBoardOpened_upv_1 (copy, index: 3)
    ]]
    local v105 = readLocalProfile_upv_1()
    if v105 ~= nil then
        v105 = v105.bestScores[a1.context.gameId]
    end
    local v106
    if v105 ~= nil then
        v106 = v105
    else
        v106 = 0
    end
    local v107 = resolveBoardTab_upv_1(a1.context.gameId, a2, v106)
    if v107.decisive then
        a1.autoBoardTabSettled = true
        if v107.tab == "friends" then
            noteFriendsBoardOpened_upv_1(a1.context.gameId, v107.isTopOfFriends)
        end
    end
    if v107.tab == a1.boardTab then
        return
    end
    a1:pickBoardTab(v107.tab)
end
u19.pickBoardTab = function(a1, a2)
    --[[
      name: pickBoardTab
      line: 1274
      upvalues:
        friendBestsAtom_upv_1 (copy, index: 1)
    ]]
    if a2 ~= a1.boardTab then
        a1.boardTab = a2
        a1.board:showTab(a2)
        a1.board:resetScroll()
        local v108 = nil
        if a2 ~= "friends" then
            a1.board:setPendingVisible(false)
            v108 = a1.lastBoardSnapshot
            if v108 ~= nil then
                a1.board:populate(v108, v108.fetchedAt > 0)
            else
                a1.board:showStatus("Loading\226\128\166")
            end
        else
            a1:paintFriends(friendBestsAtom_upv_1()[a1.context.gameId])
            return nil
        end
    else
        return nil
    end
end
u19.paintFriends = function(a1, a2)
    --[[
      name: paintFriends
      line: 1295
      upvalues:
        readLocalProfile_upv_1 (copy, index: 1)
        mergeFriendsWithLocal_upv_1 (copy, index: 2)
    ]]
    local v109, v110 = nil, nil
    if a2 ~= nil then
        v109 = readLocalProfile_upv_1()
        if v109 ~= nil then
            v109 = v109.bestScores[a1.context.gameId]
        end
        local v111
        if v109 ~= nil then
            v111 = v109
        else
            v111 = 0
        end
        local v112 = mergeFriendsWithLocal_upv_1(a2.entries, v111)
        v110 = v112.merged
        local myRank_1 = v112.myRank
        if #v110 ~= 0 then
            a1.board:populate({gameId = a1.context.gameId, entries = v110, fetchedAt = a2.fetchedAt, localRank = myRank_1}, true)
            a1.board:setPendingVisible(a2.pending > 0)
        else
            a1.board:showStatus(((a2.complete) and "No friends on the board yet!") or "Loading\226\128\166")
            return nil
        end
    else
        a1.board:showStatus("Loading\226\128\166")
        return nil
    end
end
u19.makeFruit = function(a1, a2)
    --[[
      name: makeFruit
      line: 1325
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        markWorldArt_upv_1 (copy, index: 2)
        SuikaFace_upv_1 (copy, index: 3)
    ]]
    local v113 = makeSmoothPart_upv_1(a2)
    v113.Shape = Enum.PartType.Ball
    v113.Material = Enum.Material.Plastic
    v113.TopSurface = Enum.SurfaceType.Weld
    v113.BottomSurface = Enum.SurfaceType.Weld
    v113.FrontSurface = Enum.SurfaceType.Weld
    v113.BackSurface = Enum.SurfaceType.Weld
    v113.LeftSurface = Enum.SurfaceType.Weld
    v113.RightSurface = Enum.SurfaceType.Weld
    if a1.collisionGroup ~= nil then
        v113.CollisionGroup = a1.collisionGroup
    end
    local v114 = Instance.new("SpecialMesh")
    v114.MeshType = Enum.MeshType.Sphere
    v114.Parent = v113
    local v115 = Instance.new("BillboardGui")
    v115.LightInfluence = 0
    v115.Enabled = false
    markWorldArt_upv_1(v115)
    v115.Parent = v113
    local v116 = SuikaFace_upv_1.new(v115)
    local v117 = Instance.new("Attachment")
    v117.Parent = v113
    local v118 = Instance.new("PlaneConstraint")
    v118.Attachment0 = a1.planeAttachment
    v118.Attachment1 = v117
    v118.Parent = v113
    local tbl_10 = {}
    tbl_10.part = v113
    tbl_10.mesh = v114
    tbl_10.billboard = v115
    tbl_10.face = v116
    a1.fruitByPart[v113] = tbl_10
    a1:parkFruit(tbl_10)
    return tbl_10
end
u19.freezePile = function(a1, a2)
    --[[
      name: freezePile
      line: 1380
    ]]
    for _, value_12 in a1.activeFruits do
        value_12.part.Anchored = a2
    end
end
u19.parkFruit = function(a1, a2)
    --[[
      name: parkFruit
      line: 1385
    ]]
    local part_1 = a2.part
    part_1.Anchored = true
    part_1.CanCollide = false
    part_1.CanTouch = false
    part_1.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, -1000, 0))
    a2.billboard.Enabled = false
    a2.mesh.Scale = Vector3.new(1, 1, 1)
    local visual_1 = a2.visual
    if visual_1 == nil then
        return
    end
    a2.visual = nil
    a1:releaseVisual(visual_1)
end
u19.layoutVisual = function(a1, a2, a3, a4, a5)
    --[[
      name: layoutVisual
      line: 1399
    ]]
    local offsetPosition_1 = nil
    local axisRight_1 = nil
    local v119 = nil
    local axisUp_1 = nil
    local v120 = nil
    local axisLook_1 = nil
    for _, value_13 in a2.parts do
        offsetPosition_1 = value_13.offsetPosition
        value_13.part.CFrame = (a3 * CFrame.new(offsetPosition_1.X * a4, offsetPosition_1.Y * a5, offsetPosition_1.Z * a4)) * value_13.offsetRotation
        axisRight_1 = value_13.axisRight
        v119 = value_13.baseSize.X * Vector3.new(axisRight_1.X * a4, axisRight_1.Y * a5, axisRight_1.Z * a4).Magnitude
        axisUp_1 = value_13.axisUp
        v120 = value_13.baseSize.Y * Vector3.new(axisUp_1.X * a4, axisUp_1.Y * a5, axisUp_1.Z * a4).Magnitude
        axisLook_1 = value_13.axisLook
        value_13.part.Size = Vector3.new(v119, v120, value_13.baseSize.Z * Vector3.new(axisLook_1.X * a4, axisLook_1.Y * a5, axisLook_1.Z * a4).Magnitude)
    end
end
u19.acquireVisual = function(a1, a2)
    --[[
      name: acquireVisual
      line: 1409
    ]]
    local v121 = a1.freeVisuals[a2]
    if v121 ~= nil then
        local v122 = #v121
        local v123 = v121[#v121]
        v121[v122] = nil
        v121 = v123
    end
    if v121 == nil then
        return a1:makeVisual(a2)
    end
    return v121
end
u19.releaseVisual = function(a1, a2)
    --[[
      name: releaseVisual
      line: 1427
    ]]
    a1:layoutVisual(a2, CFrame.new(a1.stage.origin + Vector3.new(0, -1000, 0)), 1, 1)
    for _, value_14 in a2.parts do
        value_14.part.LocalTransparencyModifier = 0
    end
    local v124 = a1.freeVisuals[a2.tier]
    if v124 == nil then
        v124 = {}
        a1.freeVisuals[a2.tier] = v124
    end
    table.insert(v124, a2)
end
u19.makeVisual = function(a1, a2)
    --[[
      name: makeVisual
      line: 1448
    ]]
    local v125 = a1.fruitTemplates[a2]
    if v125 ~= nil then
        local v126 = v125:Clone()
        for _, value_15 in v126:GetDescendants() do
            if value_15:IsA("BillboardGui") then
                value_15:Destroy()
            end
        end
        local v127 = v126:GetPivot()
        local tbl_11 = {}
        for _, value_16 in v126:GetDescendants() do
            if value_16:IsA("BasePart") then
                value_16.Anchored = true
                value_16.CanCollide = false
                value_16.CanQuery = false
                value_16.CanTouch = false
                local v128 = v127:ToObjectSpace(value_16.CFrame)
                table.insert(tbl_11, {part = value_16, baseSize = value_16.Size, offsetPosition = v128.Position, offsetRotation = v128.Rotation, axisRight = v128.RightVector, axisUp = v128.UpVector, axisLook = v128.LookVector})
            end
        end
        v126.Parent = a1.stage.container
        local tbl_12 = {}
        tbl_12.tier = a2
        tbl_12.model = v126
        tbl_12.parts = tbl_11
        return tbl_12
    end
    return nil
end
u19.acquireFruit = function(a1, a2)
    --[[
      name: acquireFruit
      line: 1492
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
    ]]
    local tier_1 = a2.tier
    local v129 = SUIKA_TIERS_upv_1[tier_1 + 1]
    if v129 ~= nil then
        local u20 = a1.pool:acquire()
        local v130 = os.clock()
        u20.tier = tier_1
        u20.active = true
        u20.merging = false
        u20.entered = a2.entered
        u20.spawnTime = v130
        u20.nextBlinkAt = (v130 + SUIKA_CONFIG_upv_1.blinkIntervalMin) + (a1.random:NextNumber() * (SUIKA_CONFIG_upv_1.blinkIntervalMax - SUIKA_CONFIG_upv_1.blinkIntervalMin))
        u20.blinkUntil = 0
        u20.squishUntil = 0
        u20.wobblePhase = (a1.random:NextNumber() * math.pi) * 2
        u20.lastVelocityY = a2.velocity.Y
        u20.mesh.Scale = Vector3.new(1, 1, 1)
        u20.face:applyTier(tier_1, v129.diameter)
        u20.billboard.Enabled = true
        local part_2 = u20.part
        part_2.Size = Vector3.new(v129.diameter, v129.diameter, v129.diameter)
        part_2.Color = v129.color
        part_2.CustomPhysicalProperties = PhysicalProperties.new(SUIKA_CONFIG_upv_1.baseDensity + (tier_1 * SUIKA_CONFIG_upv_1.densityPerTier), SUIKA_CONFIG_upv_1.friction, SUIKA_CONFIG_upv_1.elasticity)
        part_2.CFrame = CFrame.new(a1:planePoint(a2.position.X, a2.position.Y, a2.position.Z))
        local v131 = a1:acquireVisual(tier_1)
        u20.visual = v131
        part_2.Transparency = ((v131 == nil) and 0) or 1
        if v131 ~= nil then
            a1:layoutVisual(v131, part_2.CFrame, 1, 1)
        end
        part_2.Anchored = false
        part_2.CanCollide = true
        part_2.CanTouch = true
        part_2.AssemblyLinearVelocity = a1:planeVector(a2.velocity.X, a2.velocity.Y, a2.velocity.Z)
        part_2.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        u20.touchedConnection = part_2.Touched:Connect(
            function(a3)
                --[[
                  line: 1534
                  upvalues:
                    a1 (copy, index: 1)
                    u20 (copy, index: 2)
                ]]
                return a1:onFruitTouched(u20, a3)
            end
        )
        table.insert(a1.activeFruits, u20)
    else
        return nil
    end
end
u19.releaseFruit = function(a1, a2)
    --[[
      name: releaseFruit
      line: 1540
    ]]
    if a2.active then
        a2.active = false
        a2.merging = false
        a2.entered = false
        if a2.touchedConnection ~= nil then
            a2.touchedConnection:Disconnect()
            a2.touchedConnection = nil
        end
        a1:removeActive(a2)
        a1.pool:release(a2)
    else
        return nil
    end
end
u19.releaseAllFruits = function(a1)
    --[[
      name: releaseAllFruits
      line: 1554
    ]]
    local tbl_13 = {}
    local activeFruits_2 = a1.activeFruits
    table.move(activeFruits_2, 1, #activeFruits_2, #tbl_13 + 1, tbl_13)
    for _, value_17 in tbl_13 do
        a1:releaseFruit(value_17)
    end
end
u19.removeActive = function(a1, a2)
    --[[
      name: removeActive
      line: 1564
    ]]
    local activeFruits_3 = a1.activeFruits
    local v132 = #activeFruits_3 - 1
    local v133 = 0
    local v134 = false
    while true do
        if v134 then
            v133 = v133 + 1
        else
            v134 = true
        end
        if v133 > v132 then
            return
        end
        if activeFruits_3[v133 + 1] == a2 then
            break
        end
    end
    activeFruits_3[v133 + 1] = activeFruits_3[v132 + 1]
    activeFruits_3[#activeFruits_3] = nil
    return nil
end
u19.onFruitTouched = function(a1, a2, a3)
    --[[
      name: onFruitTouched
      line: 1587
    ]]
    if not a1.dead and a2.active then
        local v135 = nil
        if not (a2.merging) then
            v135 = a1.fruitByPart[a3]
            if v135 ~= nil and v135.active and not (v135.merging) then
                if v135.tier == a2.tier then
                    a2.merging = true
                    v135.merging = true
                    a1:mergeFruits(a2, v135)
                    return
                end
                return nil
            end
            return nil
        end
    end
    return nil
end
u19.mergeFruits = function(a1, a2, a3)
    --[[
      name: mergeFruits
      line: 1612
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        SUIKA_CONFIG_upv_1 (copy, index: 3)
        u11 (copy, index: 4)
        u12 (copy, index: 5)
        u2 (copy, index: 6)
    ]]
    local tier_2 = a2.tier
    local v136 = (a2.part.Position + a3.part.Position) / 2
    local v137 = a1:toPlane(v136)
    local v138 = a1:toPlaneVector((a2.part.AssemblyLinearVelocity + a3.part.AssemblyLinearVelocity) * 0.5)
    a1:releaseFruit(a2)
    a1:releaseFruit(a3)
    local v139 = SUIKA_TIERS_upv_1[tier_2 + 1]
    local v140 = u4 <= tier_2
    local v141 = ((v139 == nil) and 0) or (v139.score)
    local v142
    if v140 then
        v142 = v141 * SUIKA_CONFIG_upv_1.watermelonPairMultiplier
    else
        v142 = v141
    end
    a1.score = a1.score + v142
    a1.context.reportScore(a1.score)
    local v143 = nil
    if v140 then
        a1:applyMergeKnockback(v136, SUIKA_TIERS_upv_1[u4 + 1].diameter * SUIKA_CONFIG_upv_1.knockbackWatermelonBonus)
        a1:celebrateWatermelonPair(v136, v142)
        a1:maybeCelebrateBenchmark()
        return nil
    else
        a1:emitBurst(v136, u11)
        a1.context.audio.play("pop", {pitch = math.min(0.85 + (tier_2 * 0.07), 1.8)})
        local popups_1 = a1.popups
        local v144 = v136 + Vector3.new(0, 1.5, 0)
        local v145 = ("+%*"):format(v142)
        local v146
        if tier_2 < 8 then
            v146 = u11
        else
            v146 = u12
        end
        popups_1:show(v144, v145, v146, 0.7 + (tier_2 * 0.04))
        if SUIKA_CONFIG_upv_1.bigMergeTier <= tier_2 then
            a1.stage.shake(0.25)
        end
        local v147 = math.clamp((v138.X * SUIKA_CONFIG_upv_1.mergeInheritFactor) + (math.clamp(v137.X / u2, -1, 1) * SUIKA_CONFIG_upv_1.mergeOutwardImpulse), -SUIKA_CONFIG_upv_1.mergeMaxSpeed, SUIKA_CONFIG_upv_1.mergeMaxSpeed)
        local v148 = math.clamp((v138.Y * SUIKA_CONFIG_upv_1.mergeInheritFactor) + SUIKA_CONFIG_upv_1.mergeImpulse, -SUIKA_CONFIG_upv_1.mergeMaxSpeed, SUIKA_CONFIG_upv_1.mergeMaxSpeed)
        v143 = SUIKA_TIERS_upv_1[tier_2 + 2]
        if v143 ~= nil then
            a1:applyMergeKnockback(v136, v143.diameter)
        end
        a1:acquireFruit({tier = tier_2 + 1, position = Vector3.new(v137.X, v137.Y, 0), velocity = Vector3.new(v147, v148, 0)})
        a1:maybeCelebrateBenchmark()
    end
end
u19.applyMergeKnockback = function(a1, a2, a3)
    --[[
      name: applyMergeKnockback
      line: 1673
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
        SUIKA_TIERS_upv_1 (copy, index: 2)
    ]]
    local v149 = nil
    local v150 = a3 * v149.knockbackRangeFactor
    local v151 = a1:toPlane(a2)
    v149 = SUIKA_CONFIG_upv_1
    local v152 = nil
    local v153 = nil
    local v154 = nil
    local v155 = nil
    for _, value_18 in a1.activeFruits do
        if not (value_18.active) or value_18.merging then
            continue
        end
        v152 = a1:toPlane(value_18.part.Position) - v151
        v153 = v152.Magnitude
        if v150 <= v153 or v153 < 0.05 then
            continue
        end
        v154 = 1 - v153 / v150
        if SUIKA_TIERS_upv_1[value_18.tier + 1] == nil then
            v155 = a3
        else
            v155 = SUIKA_TIERS_upv_1[value_18.tier + 1].diameter
        end
        local v156 = math.min((((SUIKA_CONFIG_upv_1.knockbackImpulse * (a3 / v149.knockbackReferenceDiameter)) * v154) * v154) * math.clamp(SUIKA_CONFIG_upv_1.knockbackReferenceDiameter / v155, 0.25, 1.4), SUIKA_CONFIG_upv_1.knockbackMaxSpeed)
        local v157 = a1:toPlaneVector(value_18.part.AssemblyLinearVelocity)
        value_18.part.AssemblyLinearVelocity = a1:planeVector(v157.X + ((v152.X / v153) * v156), v157.Y + (((v152.Y / v153) + SUIKA_CONFIG_upv_1.knockbackUpBias) * v156))
    end
end
u19.celebrateWatermelonPair = function(a1, a2, a3)
    --[[
      name: celebrateWatermelonPair
      line: 1694
      upvalues:
        u12 (copy, index: 1)
    ]]
    a1:emitCelebration(a2)
    a1.context.audio.play("newBestFanfare", {})
    a1.context.audio.play("pop", {})
    a1.stage.shake(1)
    a1.popups:show(a2 + Vector3.new(0, 2.5, 0), ("+%*"):format(a3), u12, 1.7)
end
u19.maybeCelebrateBenchmark = function(a1)
    --[[
      name: maybeCelebrateBenchmark
      line: 1709
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u12 (copy, index: 3)
    ]]
    if not (a1.benchmarkCelebrated) and a1.score >= SUIKA_CONFIG_upv_1.benchmarkScore then
        a1.benchmarkCelebrated = true
        local roundToken_upv_2 = a1.roundToken
        task.delay(
            0.35,
            function()
                --[[
                  line: 1716
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_2 (copy, index: 2)
                    u1 (copy, index: 3)
                    SUIKA_CONFIG_upv_1 (copy, index: 4)
                    u12 (copy, index: 5)
                ]]
                if a1.roundToken == roundToken_upv_2 then
                    local v158 = a1:planePoint(0, u1 + 3)
                    a1:emitCelebration(v158)
                    a1.context.audio.play("newBestFanfare", {})
                    a1.popups:show(v158, ("%*!"):format(SUIKA_CONFIG_upv_1.benchmarkScore), u12, 1.6)
                    a1.stage.shake(0.6)
                else
                    return nil
                end
            end
        )
    else
        return nil
    end
end
u19.emitCelebration = function(a1, a2)
    --[[
      name: emitCelebration
      line: 1730
    ]]
    a1.celebrationAnchor.CFrame = CFrame.new(a2)
    a1.celebrationBurst:Emit(90)
end
u19.emitBurst = function(a1, a2, a3)
    --[[
      name: emitBurst
      line: 1734
    ]]
    a1.burstAnchor.CFrame = CFrame.new(a2)
    a1.mergeBurst.Color = ColorSequence.new(a3)
    a1.mergeBurst:Emit(12)
end
u19.clampAim = function(a1, a2)
    --[[
      name: clampAim
      line: 1739
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        SUIKA_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v159 = SUIKA_TIERS_upv_1[a1.nextTier + 1]
    local v160 = math.max((u2 - (((v159 == nil) and 0) or (v159.diameter / 2))) - SUIKA_CONFIG_upv_1.wallMargin, 0)
    return (math.clamp(a2, -v160, v160))
end
u19.dropYForTier = function(a1, a2)
    --[[
      name: dropYForTier
      line: 1745
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        SUIKA_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v161 = SUIKA_TIERS_upv_1[a2 + 1]
    return (u1 + SUIKA_CONFIG_upv_1.previewRimPadding) + (((v161 == nil) and 0) or (v161.diameter / 2))
end
u19.studsPerPixel = function(a1)
    --[[
      name: studsPerPixel
      line: 1750
    ]]
    return a1.stage.getFrameWidth() / math.max(a1.stage.camera.ViewportSize.X, 1)
end
u19.onAim = function(a1, a2)
    --[[
      name: onAim
      line: 1753
      upvalues:
        zero_upv_1 (copy, index: 1)
    ]]
    a1.aimX = a1:clampAim(((a2 / math.max(a1.stage.camera.ViewportSize.X, 1)) - 0.5) * a1.stage.getFrameWidth() + zero_upv_1.X)
end
u19.onAimDrag = function(a1, a2)
    --[[
      name: onAimDrag
      line: 1758
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.aimGrabbed then
        a1.aimX = a1:clampAim(a1.aimX + (a2 * a1:studsPerPixel() * SUIKA_CONFIG_upv_1.aimDragSensitivity))
    else
        return nil
    end
end
u19.attemptDrop = function(a1)
    --[[
      name: attemptDrop
      line: 1764
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
        SUIKA_CONFIG_upv_1 (copy, index: 3)
    ]]
    if not (a1.dead) and a1:isRunning() and not (pausedAtom_upv_1()) then
        local v162 = nil
        if not (gameFrozenAtom_upv_1()) then
            v162 = os.clock()
            if v162 - a1.lastDropAt >= SUIKA_CONFIG_upv_1.dropCooldownSeconds then
                a1.lastDropAt = v162
                a1:acquireFruit({tier = a1.nextTier, position = Vector3.new(a1.aimX, a1:dropYForTier(a1.nextTier), 0)})
                a1.context.audio.play("flap", {})
                a1.nextTier = a1.queuedTier
                a1.queuedTier = a1:randomDropTier()
                a1.aimX = a1:clampAim(a1.aimX)
                a1:updatePreview()
                a1:updateNextIndicator()
                return
            end
            return nil
        end
    end
    return nil
end
u19.randomDropTier = function(a1)
    --[[
      name: randomDropTier
      line: 1796
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v163 = 0
    for _, value_19 in SUIKA_CONFIG_upv_1.dropWeights do
        v163 = v163 + value_19
    end
    local v165 = a1.generationRandom:NextNumber() * v163
    for n_1 = 0, #SUIKA_CONFIG_upv_1.dropWeights - 1 do
        local v166
        v166 = v165 - SUIKA_CONFIG_upv_1.dropWeights[n_1 + 1]
        if v166 >= 0 then
            v165 = v166
            continue
        end
        return n_1
    end
    return 0
end
u19.syncPreviewVisual = function(a1)
    --[[
      name: syncPreviewVisual
      line: 1810
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
    ]]
    local v167 = ((a1.dead) and -1) or (a1.nextTier)
    if a1.previewVisualTier ~= v167 then
        a1.previewVisualTier = v167
        a1.previewDimmed = nil
        if a1.previewVisual ~= nil then
            a1:releaseVisual(a1.previewVisual)
            a1.previewVisual = nil
        end
        local v168 = SUIKA_TIERS_upv_1[v167 + 1]
        if v167 >= 0 and v168 ~= nil then
            a1.previewVisual = a1:acquireVisual(v167)
            if a1.previewVisual ~= nil then
                a1.previewFace:applyTier(v167, v168.diameter)
            end
        end
        a1.previewFaceBillboard.Enabled = a1.previewVisual ~= nil
    else
        return nil
    end
end
u19.updatePreview = function(a1)
    --[[
      name: updatePreview
      line: 1830
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        SUIKA_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v169 = SUIKA_TIERS_upv_1[a1.nextTier + 1]
    if v169 ~= nil then
        a1:syncPreviewVisual()
        local v170 = a1:dropYForTier(a1.nextTier)
        local v171 = CFrame.new(a1:planePoint(a1.aimX, v170))
        a1.preview.Size = Vector3.new(v169.diameter, v169.diameter, v169.diameter)
        a1.preview.Color = v169.color
        a1.preview.CFrame = v171
        local v172 = math.max(v170 - u1, 0)
        a1.aimLine.Size = Vector3.new(0.15, v172, 0.15)
        a1.aimLine.CFrame = CFrame.new(a1:planePoint(a1.aimX, u1 + (v172 / 2)))
        local v173 = nil
        if a1.dead then
            a1.preview.Transparency = 1
            a1.aimLine.Transparency = 1
            return nil
        else
            local v174 = SUIKA_CONFIG_upv_1.dropCooldownSeconds <= os.clock() - a1.lastDropAt
            v173 = a1.previewVisual
            local v175 = nil
            if v173 == nil then
                a1.preview.Transparency = (v174 and 0.4) or 0.78
            else
                a1.preview.Transparency = 1
                a1:layoutVisual(v173, v171, 1, 1)
                v175 = not v174
                if a1.previewDimmed ~= v175 then
                    a1.previewDimmed = v175
                    for _, value_20 in v173.parts do
                        value_20.part.LocalTransparencyModifier = (v175 and 0.7) or 0.15
                    end
                end
            end
            a1.aimLine.Transparency = (v174 and 0.82) or 0.94
        end
    else
        return nil
    end
end
u19.updateNextIndicator = function(a1)
    --[[
      name: updateNextIndicator
      line: 1870
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v176 = SUIKA_TIERS_upv_1[a1.queuedTier + 1]
    if v176 ~= nil then
        local v177 = v176.diameter * SUIKA_CONFIG_upv_1.nextIndicatorScale
        local v178
        v178 = a1.dead or a1:getNextDisplay(a1.queuedTier)
        if a1.activeNextDisplay ~= nil and a1.activeNextDisplay ~= v178 then
            a1:pivotDisplayTo(a1.activeNextDisplay, a1.stage.origin + Vector3.new(0, -1000, 0))
        end
        a1.activeNextDisplay = v178
        if v178 ~= nil then
            a1:pivotDisplayTo(v178, a1.nextDisplayCFrame.Position)
            a1.nextFace:applyTier(a1.queuedTier, v177)
        end
        a1.nextFaceBillboard.Enabled = v178 ~= nil
        a1.nextBall.Size = Vector3.new(v177, v177, v177)
        a1.nextBall.Color = v176.color
        local nextBall_1 = a1.nextBall
        local v179
        if a1.dead or v178 ~= nil then
            v179 = 1
        else
            v179 = 0
        end
        nextBall_1.Transparency = v179
    else
        return nil
    end
end
u19.getNextDisplay = function(a1, a2)
    --[[
      name: getNextDisplay
      line: 1891
      upvalues:
        SUIKA_TIERS_upv_1 (copy, index: 1)
        SUIKA_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v180 = a1.nextDisplayModels[a2]
    local v181 = nil
    if v180 == nil then
        v181 = SUIKA_TIERS_upv_1[a2 + 1]
        local v182 = nil
        if v181 ~= nil then
            v182 = a1:makeDisplayModel(a1.stage.container, a2, v181.diameter * SUIKA_CONFIG_upv_1.nextIndicatorScale)
            if v182 ~= nil then
                a1:pivotDisplayTo(v182, a1.stage.origin + Vector3.new(0, -1000, 0))
                a1.nextDisplayModels[a2] = v182
                return v182
            end
        end
        return nil
    end
    return v180
end
u19.updateWarning = function(a1)
    --[[
      name: updateWarning
      line: 1912
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        a1.warningLine.Transparency = 1
        return nil
    end
    a1.warningLine.Transparency = 1 - (math.clamp(a1.overflowTimer / SUIKA_CONFIG_upv_1.overflowGraceSeconds, 0, 1) * 0.75)
end
u19.die = function(a1)
    --[[
      name: die
      line: 1920
      upvalues:
        u1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    a1.dead = true
    a1:setRunning(false)
    a1:freezePile(true)
    a1:updatePreview()
    a1:updateNextIndicator()
    a1.warningLine.Transparency = 1
    a1.context.audio.play("buzz", {})
    a1.context.audio.play("thud", {})
    a1.stage.shake(1)
    a1.popups:show(a1:planePoint(0, u1 + 2), "FULL!", u13, 1.2)
    local score_upv_1 = a1.score
    local roundToken_upv_3 = a1.roundToken
    task.delay(
        0.9,
        function()
            --[[
              line: 1943
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_3 (copy, index: 2)
                score_upv_1 (copy, index: 3)
            ]]
            if a1.roundToken ~= roundToken_upv_3 then
                return
            end
            a1.context.endRun(score_upv_1)
        end
    )
end
local tbl_14 = {}
tbl_14.SuikaGame = u19
return tbl_14