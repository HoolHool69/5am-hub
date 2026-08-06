-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local readLightingFolderProfile_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local makeSmoothPart_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local PopupTextPool_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local markWorldArt_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local board2048Atom_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "game-2048", "board-atom").board2048Atom
local Game2048_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "game-2048", "game-2048").Game2048
local GAME_2048_3D_STAGE_LIGHTING_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "lighting-profiles").GAME_2048_3D_STAGE_LIGHTING
local v1 = RuntimeLib_upv_1.import(script, script.Parent, "game-2048-3d-assets")
local cloneGame2048Kit_upv_1 = v1.cloneGame2048Kit
local GAME_2048_CELL_PITCH_upv_1 = v1.GAME_2048_CELL_PITCH
local resolveGame2048Kit_upv_1 = v1.resolveGame2048Kit
local resolveGame2048Lighting_upv_1 = v1.resolveGame2048Lighting
local tileStyle3d_upv_1 = RuntimeLib_upv_1.import(script, script.Parent, "game-2048-3d-palette").tileStyle3d
local u1 = Vector2.new(0, 2)
local u2 = CFrame.new(0, -1000, 0)
local u3 = Color3.fromRGB(255, 255, 255)
local u4 = Color3.fromRGB(240, 180, 40)
local u5 = Color3.fromRGB(187, 173, 160)
local u6 = Color3.fromRGB(205, 193, 180)
local tbl_upv_1 = {Color3.fromRGB(255, 224, 92), Color3.fromRGB(255, 176, 52), Color3.fromRGB(255, 122, 44), Color3.fromRGB(255, 66, 52)}
local tbl_upv_2 = {}
tbl_upv_2.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_2.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_2.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_upv_2.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local function clamp01_1(a1)
    --[[
      name: clamp01
      line: 76
    ]]
    return (math.clamp(a1, 0, 1))
end
local function quadInOut_1(a1)
    --[[
      name: quadInOut
      line: 79
    ]]
    if a1 >= 0.5 then
        return 1 - ((2 * (1 - a1)) * (1 - a1))
    end
    return (2 * a1) * a1
end
local function quadOut_1(a1)
    --[[
      name: quadOut
      line: 82
    ]]
    return 1 - ((1 - a1) * (1 - a1))
end
local function backOut_1(a1)
    --[[
      name: backOut
      line: 86
    ]]
    local v2 = a1 - 1
    return (1 + (((2.70158 * v2) * v2) * v2)) + ((1.70158 * v2) * v2)
end
local function comboColor_1(a1)
    --[[
      name: comboColor
      line: 91
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[math.clamp(a1 - 2, 0, #tbl_upv_1 - 1) + 1]
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 107
    ]]
    return "Game2048WorldGame"
end
tbl_4.__index = BaseWorldGame_upv_1
local u7 = setmetatable(tbl_3, tbl_4)
u7.__index = u7
u7.new = function(...)
    --[[
      name: new
      line: 113
      upvalues:
        u7 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u7)
    return v3:constructor(...) or v3
end
u7.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 117
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        Game2048_upv_1 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.boardCenter = Vector3.new(0, 0, 0)
    a1.tileZ = 0
    a1.tileBaseSize = Vector3.new(4.28000020980835, 4.28000020980835, 1.0700000524520874)
    a1.ringBaseSize = Vector3.new(1, 1, 1)
    a1.slotX = table.create(16)
    a1.slotY = table.create(16)
    a1.visuals = {}
    a1.idToVisual = {}
    a1.seenIds = {}
    a1.lastRound = -1
    a1.replicaIdToVisual = {}
    a1.replicaOffsetX = 0
    a1.logic = Game2048_upv_1.new(a2)
end
u7.init = RuntimeLib_upv_1.async(
    function(a1)
        --[[
          line: 133
          upvalues:
            RuntimeLib_upv_1 (copy, index: 1)
            BaseWorldGame_upv_1 (copy, index: 2)
        ]]
        RuntimeLib_upv_1.await(a1.logic:init())
        RuntimeLib_upv_1.await(BaseWorldGame_upv_1.init(a1))
    end
)
u7.start = function(a1)
    --[[
      name: start
      line: 139
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.logic:start()
    BaseWorldGame_upv_1.start(a1)
end
u7.revive = function(a1)
    --[[
      name: revive
      line: 144
    ]]
    a1.logic:revive()
end
u7.captureRound = function(a1)
    --[[
      name: captureRound
      line: 148
    ]]
    return a1.logic:captureResume()
end
u7.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 151
    ]]
    if a1.logic:restoreResume(a2) then
        a1.lastAppliedView = nil
        a1.lastRound = -1
        a1:syncFromAtom()
        return true
    end
    return false
end
u7.snapshot = function(a1)
    --[[
      name: snapshot
      line: 161
    ]]
    return a1.logic:snapshot()
end
u7.destroy = function(a1)
    --[[
      name: destroy
      line: 164
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.logic:destroy()
    BaseWorldGame_upv_1.destroy(a1)
end
u7.buildScene = function(a1)
    --[[
      name: buildScene
      line: 168
      upvalues:
        u1 (copy, index: 1)
        resolveGame2048Kit_upv_1 (copy, index: 2)
        cloneGame2048Kit_upv_1 (copy, index: 3)
        GAME_2048_CELL_PITCH_upv_1 (copy, index: 4)
        PopupTextPool_upv_1 (copy, index: 5)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameCenter(u1)
    a1.stage.setFrameWidthFloor(25)
    a1.boardCenter = a1.stage.origin
    local v4 = resolveGame2048Kit_upv_1()
    local v5, v5
    if v4 == nil then
        v5 = nil
    else
        v5 = cloneGame2048Kit_upv_1(v4, container_1, a1.boardCenter)
    end
    a1.placement = v5
    local placement_1 = a1.placement
    if placement_1 == nil then
        v5 = placement_1
    else
        v5 = placement_1.tileZ
    end
    local v6
    if v5 ~= nil then
        v6 = v5
    else
        v6 = a1.boardCenter.Z + 0.5
    end
    a1.tileZ = v6
    local v7 = a1.placement
    if v7 ~= nil then
        v7 = v7.tileSource.Size
    end
    local v8
    if v7 ~= nil then
        v8 = v7
    else
        v8 = Vector3.new(4.28000020980835, 4.28000020980835, 1.0700000524520874)
    end
    a1.tileBaseSize = v8
    local v9 = a1.placement
    if v9 ~= nil then
        v9 = v9.ringSource.Size
    end
    local v10
    if v9 ~= nil then
        v10 = v9
    else
        v10 = Vector3.new(1, 1, 1)
    end
    a1.ringBaseSize = v10
    local v11 = 0
    local v12 = false
    v12, v11 = v12, v11
    while true do
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
        if v11 >= 16 then
            break
        end
        local v13 = math.floor(v11 / 4)
        a1.slotX[v11 + 1] = a1.boardCenter.X + (((v11 % 4) - 1.5) * GAME_2048_CELL_PITCH_upv_1)
        a1.slotY[v11 + 1] = a1.boardCenter.Y + ((1.5 - v13) * GAME_2048_CELL_PITCH_upv_1)
    end
    if a1.placement == nil then
        a1:buildFallbackBoard(container_1, a1.boardCenter)
    end
    v12, v11 = false, 0
    while true do
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
        if v11 >= 16 then
            break
        end
        table.insert(a1.visuals, (a1:buildTileVisual(container_1)))
    end
    a1.popupPool = PopupTextPool_upv_1.new(container_1, 10)
    a1:applyAuthoredLighting()
end
u7.resetRound = function(a1)
    --[[
      name: resetRound
      line: 244
    ]]
    a1.lastAppliedView = nil
    a1.lastRound = -1
    for _, value_1 in a1.visuals do
        a1:parkVisual(value_1)
    end
    table.clear(a1.idToVisual)
    local popupPool_1 = a1.popupPool
    if popupPool_1 ~= nil then
        popupPool_1:hideAll()
    end
    a1:syncFromAtom()
end
u7.fixedUpdate = function(a1)
    --[[
      name: fixedUpdate
      line: 257
    ]]
end
u7.render = function(a1, a2)
    --[[
      name: render
      line: 260
    ]]
    a1:animate(a2)
end
u7.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 263
    ]]
    a1:animate(a2)
end
u7.updateOpponents = function(a1, a2)
    --[[
      name: updateOpponents
      line: 267
    ]]
    local v14 = a2[1]
    if v14 ~= nil then
        v14 = v14.snapshot
    end
    if v14 ~= nil then
        local v15 = nil
        if a1.replicaVisuals == nil then
            v15 = a1.stage.getPeerWindowOffsetX()
            if v15 ~= nil then
                a1:buildReplicaBoard(v15)
            else
                return nil
            end
        end
        a1:syncReplica(v14)
    else
        return nil
    end
end
u7.buildFallbackBoard = function(a1, a2, a3)
    --[[
      name: buildFallbackBoard
      line: 286
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        u6 (copy, index: 3)
    ]]
    local v16 = makeSmoothPart_upv_1(a2)
    v16.Color = u5
    v16.Size = Vector3.new(21, 21, 1)
    v16.CFrame = CFrame.new(a3 + Vector3.new(0, 0, -0.800000011920929))
    local v17 = 0
    local v18 = false
    v18, v17 = v18, v17
    while true do
        if v18 then
            v17 = v17 + 1
        else
            v18 = true
        end
        if v17 >= 16 then
            break
        end
        local v19 = makeSmoothPart_upv_1(a2)
        v19.Color = u6
        v19.Size = Vector3.new(4.28000020980835, 4.28000020980835, 0.4000000059604645)
        v19.CFrame = CFrame.new(a1.slotX[v17 + 1], a1.slotY[v17 + 1], a3.Z - 0.3)
    end
end
u7.buildTileVisual = function(a1, a2)
    --[[
      name: buildTileVisual
      line: 312
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        markWorldArt_upv_1 (copy, index: 3)
        u3 (copy, index: 4)
    ]]
    local placement_2 = a1.placement
    local v20 = nil
    local v21
    if placement_2 == nil then
        v21 = makeSmoothPart_upv_1(a2)
        v21.Size = Vector3.new(4.28000020980835, 4.28000020980835, 1.0700000524520874)
    else
        v21 = placement_2.tileSource:Clone()
        v20 = placement_2.ringSource:Clone()
    end
    v21.Anchored = true
    v21.CanCollide = false
    v21.CanQuery = false
    v21.CanTouch = false
    v21.CastShadow = false
    v21.CFrame = u2
    v21.Parent = a2
    if v20 ~= nil then
        v20.Anchored = true
        v20.CanCollide = false
        v20.CanQuery = false
        v20.CanTouch = false
        v20.CastShadow = false
        v20.CFrame = u2
        v20.Parent = a2
    end
    local v22 = Instance.new("SurfaceGui")
    v22.Face = Enum.NormalId.Back
    v22.CanvasSize = Vector2.new(144, 144)
    v22.LightInfluence = 0
    markWorldArt_upv_1(v22)
    v22.Parent = v21
    local v23 = Instance.new("TextLabel")
    v23.BackgroundTransparency = 1
    v23.AnchorPoint = Vector2.new(0.5, 0.5)
    v23.Position = UDim2.fromScale(0.5, 0.5)
    v23.Size = UDim2.fromScale(0.9, 0.6)
    v23.Font = Enum.Font.GothamBlack
    v23.TextScaled = true
    v23.TextStrokeTransparency = 0.8
    v23.Parent = v22
    local tbl_5 = {}
    tbl_5.part = v21
    tbl_5.label = v23
    tbl_5.ring = v20
    tbl_5.fill = u3
    return tbl_5
end
u7.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 383
      upvalues:
        resolveGame2048Lighting_upv_1 (copy, index: 1)
        readLightingFolderProfile_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        GAME_2048_3D_STAGE_LIGHTING_upv_1 (copy, index: 4)
    ]]
    local v24 = resolveGame2048Lighting_upv_1()
    if v24 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(v24, tbl_upv_2, GAME_2048_3D_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u7.syncFromAtom = function(a1)
    --[[
      name: syncFromAtom
      line: 390
      upvalues:
        board2048Atom_upv_1 (copy, index: 1)
    ]]
    local v25 = board2048Atom_upv_1()
    if v25 ~= a1.lastAppliedView then
        a1.lastAppliedView = v25
        if v25 ~= nil then
            if v25.round ~= a1.lastRound then
                a1.lastRound = v25.round
                for _, value_2 in a1.visuals do
                    a1:parkVisual(value_2)
                end
                table.clear(a1.idToVisual)
            end
            local tbl_6 = {}
            for _, value_3 in v25.tiles do
                table.insert(tbl_6, {id = value_3.id, value = value_3.value, x = a1.slotX[value_3.index + 1], y = a1.slotY[value_3.index + 1]})
            end
            a1:syncTileSet(a1.visuals, a1.idToVisual, tbl_6, false)
            a1:playMoveEffects(v25)
        else
            for _, value_4 in a1.visuals do
                a1:parkVisual(value_4)
            end
            table.clear(a1.idToVisual)
            return nil
        end
    else
        return nil
    end
end
u7.syncTileSet = function(a1, a2, a3, a4, a5)
    --[[
      name: syncTileSet
      line: 424
    ]]
    table.clear(a1.seenIds)
    for _, value_5 in a4 do
        a1.seenIds[value_5.id] = true
    end
    local v26 = nil
    for _, value_6 in a2 do
        v26 = value_6.tileId ~= 0
        if v26 then
            v26 = a1.seenIds[value_6.tileId] == nil
        end
        if v26 then
            a3[value_6.tileId] = nil
            a1:parkVisual(value_6)
        end
    end
    local v27 = nil
    local v28 = nil
    for _, value_7 in a4 do
        v27 = a3[value_7.id]
        if v27 == nil then
            v28 = a1:takeFreeVisual(a2)
            if v28 ~= nil then
                v28.tileId = value_7.id
                a3[value_7.id] = v28
                a1:applyStyle(v28, value_7.value)
                v28.fromX = value_7.x
                v28.fromY = value_7.y
                v28.toX = value_7.x
                v28.toY = value_7.y
                v28.curX = value_7.x
                v28.curY = value_7.y
                v28.slideAge = 0.1
                v28.scaleMode = "spawn"
                v28.scaleAge = 0
                v28.flashAge = 0.22
                v28.settled = false
            end
        else
            if v27.toX ~= value_7.x or v27.toY ~= value_7.y then
                v27.fromX = v27.curX
                v27.fromY = v27.curY
                v27.toX = value_7.x
                v27.toY = value_7.y
                v27.slideAge = 0
                v27.settled = false
            end
            if v27.value ~= value_7.value then
                a1:applyStyle(v27, value_7.value)
                v27.scaleMode = "punch"
                v27.scaleAge = 0
                v27.flashAge = (a5 and 0.22) or 0
                v27.settled = false
            end
        end
    end
end
u7.applyStyle = function(a1, a2, a3)
    --[[
      name: applyStyle
      line: 489
      upvalues:
        tileStyle3d_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v29 = tileStyle3d_upv_1(a3)
    a2.value = a3
    a2.fill = v29.fill
    a2.ringColor = v29.ring
    a2.part.Color = v29.fill
    a2.label.Text = tostring(a3)
    a2.label.TextColor3 = v29.text
    if v29.ring ~= nil or a2.ring == nil then
        return
    end
    a2.ring.CFrame = u2
end
u7.takeFreeVisual = function(a1, a2)
    --[[
      name: takeFreeVisual
      line: 501
    ]]
    for _, value_8 in a2 do
        if value_8.tileId ~= 0 then
            continue
        end
        return value_8
    end
    return nil
end
u7.parkVisual = function(a1, a2)
    --[[
      name: parkVisual
      line: 509
      upvalues:
        u2 (copy, index: 1)
    ]]
    a2.tileId = 0
    a2.scaleMode = "none"
    a2.slideAge = 0.1
    a2.flashAge = 0.22
    a2.settled = true
    a2.part.Size = a1.tileBaseSize
    a2.part.CFrame = u2
    if a2.ring == nil then
        return
    end
    a2.ring.CFrame = u2
end
u7.playMoveEffects = function(a1, a2)
    --[[
      name: playMoveEffects
      line: 521
      upvalues:
        u4 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local popupPool_2 = a1.popupPool
    local v30 = #a2.merges
    if popupPool_2 ~= nil and v30 ~= 0 then
        for _, value_9 in a2.merges do
            popupPool_2:show(Vector3.new(a1.slotX[value_9.at + 1], a1.slotY[value_9.at + 1] + 1, a1.tileZ + 2), ("+%*"):format(value_9.value), u4, 1.1)
        end
        local v31 = false
        if a2.milestone ~= nil then
            v31 = a2.milestone.seq == a2.moveSeq
        end
        if not v31 or a2.milestone == nil then
            if v30 >= 2 then
                popupPool_2:show(Vector3.new(a1.boardCenter.X, a1.boardCenter.Y + 3, a1.tileZ + 3), ("COMBO \195\151%*!"):format(v30), tbl_upv_1[math.clamp(v30 - 2, 0, #tbl_upv_1 - 1) + 1], 2.2, 0.75)
                a1.stage.shake(math.min(v30, 6) * 0.15)
            end
            return
        end
        popupPool_2:show(Vector3.new(a1.boardCenter.X, a1.boardCenter.Y + 3, a1.tileZ + 3), ("%*!"):format(a2.milestone.value), u4, 2.6, 0.9)
        a1.stage.shake(1)
    else
        return nil
    end
end
u7.animate = function(a1, a2)
    --[[
      name: animate
      line: 540
    ]]
    a1:syncFromAtom()
    a1:animateSet(a1.visuals, a2)
    local replicaVisuals_1 = a1.replicaVisuals
    if replicaVisuals_1 == nil then
        return
    end
    a1:animateSet(replicaVisuals_1, a2)
end
u7.animateSet = function(a1, a2, a3)
    --[[
      name: animateSet
      line: 548
      upvalues:
        u3 (copy, index: 1)
    ]]
    local v32, v33, _, v34 = nil, nil, nil, nil
    local v35 = nil
    local v36 = nil
    local v37 = nil
    local v38 = nil
    local value_10 = nil
    local v39 = nil
    local v40 = nil
    local v45 = nil
    local v41 = nil
    local v42 = nil
    local v46 = nil
    for v47, value_10 in a2 do
        if value_10.tileId == 0 or value_10.settled then
            continue
        end
        value_10.slideAge = math.min(value_10.slideAge + a3, 0.1)
        v36 = math.clamp(value_10.slideAge / 0.1, 0, 1)
        v35 = ((v36 >= 0.5) and (1 - (2 * (1 - v36)) * (1 - v36))) or (2 * v36 * v36)
        v37 = value_10.fromX + (value_10.toX - value_10.fromX) * v35
        v38 = value_10.fromY + (value_10.toY - value_10.fromY) * v35
        value_10.curX = v37
        value_10.curY = v38
        value_10.part.CFrame = CFrame.new(v37, v38, a1.tileZ)
        v32 = 1
        if value_10.scaleMode == "spawn" then
            value_10.scaleAge = value_10.scaleAge + a3
            v33 = math.clamp(value_10.scaleAge / 0.14, 0, 1)
            v34 = v33 - 1
            v32 = 0.3 + 0.7 * ((1 + (((2.70158 * v34) * v34) * v34)) + ((1.70158 * v34) * v34))
            if v33 >= 1 then
                value_10.scaleMode = "none"
            end
        elseif value_10.scaleMode == "punch" then
            value_10.scaleAge = value_10.scaleAge + a3
            v41 = math.clamp(value_10.scaleAge / 0.12, 0, 1)
            v32 = 1.25 + -0.25 * (1 - ((1 - v41) * (1 - v41)))
            if v41 >= 1 then
                value_10.scaleMode = "none"
            end
        end
        if v32 ~= 1 then
            v41 = a1.tileBaseSize * v32
        else
            v41 = a1.tileBaseSize
        end
        value_10.part.Size = v41
        if value_10.flashAge < 0.22 then
            value_10.flashAge = math.min(value_10.flashAge + a3, 0.22)
            local v43 = math.clamp(value_10.flashAge / 0.22, 0, 1)
            v39 = 0.8 * (1 - (1 - ((1 - v43) * (1 - v43))))
            v40 = value_10.part
            local v44
            if v39 <= 0 then
                v44 = value_10.fill
            else
                v44 = value_10.fill:Lerp(u3, v39)
            end
            v40.Color = v44
        end
        v39 = value_10.ring
        if v39 ~= nil and value_10.ringColor ~= nil then
            v39.Color = value_10.ringColor
            v39.Size = ((v32 ~= 1) and (a1.ringBaseSize * v32)) or (a1.ringBaseSize)
            local tileZ_1 = a1.tileZ
            v42 = a1.placement
            if v42 ~= nil then
                v42 = v42.ringZOffset
            end
            if v42 ~= nil then
                v34 = v42
            else
                v34 = 0.48
            end
            v39.CFrame = CFrame.new(v37, v38, tileZ_1 + v34)
        end
        v40 = false
        if value_10.slideAge < 0.1 then
            value_10.settled = v40
            continue
        end
        v40 = false
        if value_10.scaleMode == "none" then
            v40 = value_10.flashAge >= 0.22
        end
        value_10.settled = v40
    end
end
u7.buildReplicaBoard = function(a1, a2)
    --[[
      name: buildReplicaBoard
      line: 616
    ]]
    local container_2 = a1.stage.container
    a1.replicaOffsetX = a2
    local placement_3 = a1.placement
    if placement_3 == nil then
        a1:buildFallbackBoard(container_2, a1.boardCenter + Vector3.new(a2, 0, 0))
    else
        local v45 = Vector3.new(a2, 0, 0)
        local v46 = nil
        for _, value_11 in placement_3.boardParts do
            v46 = value_11:Clone()
            v46.CFrame = value_11.CFrame + v45
            v46.Parent = container_2
        end
    end
    local tbl_7 = {}
    local v47 = 0
    local v48, v47 = nil, nil
    v48 = false
    while true do
        if v48 then
            v47 = v47 + 1
        else
            v48 = true
        end
        if v47 >= 16 then
            break
        end
        table.insert(tbl_7, (a1:buildTileVisual(container_2)))
    end
    a1.replicaVisuals = tbl_7
end
u7.syncReplica = function(a1, a2)
    --[[
      name: syncReplica
      line: 652
    ]]
    local replicaVisuals_2 = a1.replicaVisuals
    local board_1 = a2.board
    if replicaVisuals_2 ~= nil and board_1 ~= nil then
        local tbl_8 = {}
        local v49 = 0
        local v50 = false
        v50, v49 = v50, v49
        local v51 = nil
        if v50 then
            v49 = v49 + 1
        else
            v50 = true
        end
        local v52 = nil
        while v49 < 16 do
            v51 = tonumber(string.sub(board_1, v49 + 1, v49 + 1), 16)
            if v51 == nil then
                v51 = 0
            end
            v52 = a2.values[v49 + 1]
            if v52 == nil then
                v52 = 0
            end
            if v51 > 0 and v52 ~= 0 then
                table.insert(tbl_8, {id = v52, value = 2 ^ v51, x = a1.slotX[v49 + 1] + a1.replicaOffsetX, y = a1.slotY[v49 + 1]})
            end
            if v50 then
                v49 = v49 + 1
            else
                v50 = true
            end
        end
        a1:syncTileSet(replicaVisuals_2, a1.replicaIdToVisual, tbl_8, true)
    else
        return nil
    end
end
local tbl_9 = {}
tbl_9.Game2048WorldGame = u7
return tbl_9