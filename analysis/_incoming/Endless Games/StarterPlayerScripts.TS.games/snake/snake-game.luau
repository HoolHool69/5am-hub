-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local SNAKE_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").SNAKE_STAGE_LIGHTING
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v2.readResume
local writeResume_upv_1 = v2.writeResume
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local v3 = RuntimeLib_1.import(script, script.Parent, "snake-assets")
local cloneSnakeMap_upv_1 = v3.cloneSnakeMap
local resolveSnakeLighting_upv_1 = v3.resolveSnakeLighting
local resolveSnakeMap_upv_1 = v3.resolveSnakeMap
local SNAKE_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "snake-config").SNAKE_CONFIG
local u1 = CFrame.new(0, -1000, 0)
local u2 = SNAKE_CONFIG_upv_1.gridCols * SNAKE_CONFIG_upv_1.gridRows + 1
local u3 = SNAKE_CONFIG_upv_1.gridCols * SNAKE_CONFIG_upv_1.gridRows
local u4 = Color3.fromRGB(16, 22, 17)
local u5 = Color3.fromRGB(22, 29, 23)
local u6 = Color3.fromRGB(150, 84, 58)
local u7 = Color3.fromRGB(122, 65, 45)
local u8 = Color3.fromRGB(212, 248, 164)
local _ = Color3.fromRGB(158, 214, 112)
local u9 = Color3.fromRGB(140, 198, 98)
local u10 = Color3.fromRGB(76, 118, 62)
local u11 = Color3.fromRGB(255, 96, 104)
local u12 = Color3.fromRGB(222, 58, 50)
local u13 = Color3.fromRGB(112, 74, 44)
local u14 = Color3.fromRGB(118, 196, 84)
local u15 = Color3.fromRGB(255, 242, 218)
local u16 = Color3.fromRGB(244, 106, 88)
local u17 = Color3.fromRGB(255, 216, 102)
local u18 = Color3.fromRGB(255, 90, 100)
local u19 = Color3.fromRGB(255, 255, 255)
local u20 = Color3.fromRGB(20, 26, 22)
local u21 = Color3.fromRGB(120, 40, 44)
local u22 = Color3.fromRGB(255, 120, 140)
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(70, 70, 70)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(184, 184, 184)
tbl_upv_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local u23 = Vector3.new(SNAKE_CONFIG_upv_1.segmentSize, SNAKE_CONFIG_upv_1.segmentSize, 1.8)
local tbl_upv_2 = {-1, 1}
local tbl_upv_3 = {}
tbl_upv_3.up = {}
tbl_upv_3.down = {}
tbl_upv_3.left = {}
tbl_upv_3.right = {}
local tbl_upv_4 = {}
local function lerp_1(a1, a2, a3)
    --[[
      name: lerp
      line: 123
    ]]
    return a1 + ((a2 - a1) * a3)
end
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 142
    ]]
    return "SnakeGame"
end
tbl_6.__index = BaseWorldGame_upv_1
local u24 = setmetatable(tbl_5, tbl_6)
u24.__index = u24
u24.new = function(...)
    --[[
      name: new
      line: 148
      upvalues:
        u24 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u24)
    return v4:constructor(...) or v4
end
u24.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 152
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.crumbs = {}
    a1.crumbGenerations = {}
    a1.crumbCursor = 0
    a1.allBodyParts = {}
    a1.freeBodyParts = {}
    a1.orderedBodyParts = {}
    a1.snakeCells = table.create(u2)
    a1.tailPtr = 0
    a1.headPtr = 0
    a1.snakeLength = 0
    a1.occupied = {}
    a1.headCol = 0
    a1.headRow = 0
    a1.heading = "right"
    a1.turnQueue = {}
    a1.foodIndex = -1
    a1.armed = false
    a1.tickTimer = 0
    a1.pendingGrowth = 0
    a1.eaten = 0
    a1.score = 0
    a1.dead = false
    a1.roundToken = 0
    a1.random = Random.new()
    a1.foodSeed = 1
    a1.foodRandom = Random.new()
    a1.tailFromCell = 0
    a1.headFromCell = 0
    a1.slideTick = false
    a1.renderX = table.create(u2)
    a1.renderY = table.create(u2)
    a1.lastSegmentScale = table.create(u2)
    a1.bulgeCells = {}
    a1.eatWaveElapsed = math.huge
    a1.eatWaveCenter = -math.huge
    a1.lastHeadScale = 1
    a1.faceDirX = 1
    a1.faceDirY = 0
    a1.tongueTimer = 2
    a1.tongueVisible = 0
end
u24.buildScene = function(a1)
    --[[
      name: buildScene
      line: 195
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
        resolveSnakeMap_upv_1 (copy, index: 2)
        cloneSnakeMap_upv_1 (copy, index: 3)
        makeStagePart_upv_1 (copy, index: 4)
        u8 (copy, index: 5)
        u19 (copy, index: 6)
        u20 (copy, index: 7)
        makeSmoothPart_upv_1 (copy, index: 8)
        u21 (copy, index: 9)
        u1 (copy, index: 10)
        u22 (copy, index: 11)
        u12 (copy, index: 12)
        u13 (copy, index: 13)
        u14 (copy, index: 14)
        u15 (copy, index: 15)
        u16 (copy, index: 16)
        PopupTextPool_upv_1 (copy, index: 17)
    ]]
    local container_1 = a1.stage.container
    a1.stage.setFrameCenter(Vector2.new(0, SNAKE_CONFIG_upv_1.boardCenterY))
    local v5 = SNAKE_CONFIG_upv_1.gridCols * SNAKE_CONFIG_upv_1.cellSize
    a1.stage.setFrameWidthFloor((v5 + (SNAKE_CONFIG_upv_1.wallThickness * 2)) + SNAKE_CONFIG_upv_1.cellSize)
    local v6 = resolveSnakeMap_upv_1()
    if v6 == nil then
        a1:buildProceduralBoard(container_1, v5, SNAKE_CONFIG_upv_1.gridRows * SNAKE_CONFIG_upv_1.cellSize)
    else
        cloneSnakeMap_upv_1(v6, container_1, a1.stage.origin + Vector3.new(0, SNAKE_CONFIG_upv_1.boardCenterY, 0), a1.stage.origin.Z - 1.6)
    end
    a1:applyAuthoredLighting()
    a1.head = makeStagePart_upv_1(container_1)
    a1.head.Color = u8
    a1.head.Size = Vector3.new(SNAKE_CONFIG_upv_1.segmentSize, SNAKE_CONFIG_upv_1.segmentSize, 1.8)
    a1.headBaseSize = a1.head.Size
    a1.eyeLeft = a1:makeFacePart(0.62, u19)
    a1.eyeRight = a1:makeFacePart(0.62, u19)
    a1.pupilLeft = a1:makeFacePart(0.28, u20)
    a1.pupilRight = a1:makeFacePart(0.28, u20)
    a1.mouth = makeSmoothPart_upv_1(container_1)
    a1.mouth.Color = u21
    a1.mouth.Size = Vector3.new(0.20000000298023224, 0.8500000238418579, 0.3499999940395355)
    a1.mouth.CFrame = u1
    a1.tongue = makeSmoothPart_upv_1(container_1)
    a1.tongue.Color = u22
    a1.tongue.Size = Vector3.new(0.20000000298023224, 0.2199999988079071, 0.30000001192092896)
    a1.tongue.CFrame = u1
    a1.food = makeStagePart_upv_1(container_1)
    a1.food.Color = u12
    a1.food.Size = Vector3.new(SNAKE_CONFIG_upv_1.segmentSize * 0.85, SNAKE_CONFIG_upv_1.segmentSize * 0.8, SNAKE_CONFIG_upv_1.segmentSize * 0.75)
    a1.foodBaseSize = a1.food.Size
    a1.foodStem = makeSmoothPart_upv_1(container_1)
    a1.foodStem.Color = u13
    a1.foodStem.Size = Vector3.new(0.3400000035762787, 0.550000011920929, 0.36000001430511475)
    a1.foodStem.CFrame = u1
    a1.foodLeaf = makeSmoothPart_upv_1(container_1)
    a1.foodLeaf.Color = u14
    a1.foodLeaf.Size = Vector3.new(0.7799999713897705, 0.30000001192092896, 0.3199999928474426)
    a1.foodLeaf.CFrame = u1
    local v7 = nil
    for n_1 = 0, 9 do
        local v8 = makeSmoothPart_upv_1(container_1)
        if n_1 % 2 ~= 0 then
            v7 = u16
        else
            v7 = u15
        end
        v8.Color = v7
        v8.Size = Vector3.new(0.41999998688697815, 0.41999998688697815, 0.41999998688697815)
        v8.CFrame = u1
        table.insert(a1.crumbs, v8)
        table.insert(a1.crumbGenerations, 0)
    end
    for _ = 0, SNAKE_CONFIG_upv_1.bodyPoolPrewarm - 1 do
        table.insert(a1.freeBodyParts, (a1:createBodyPart()))
    end
    a1.popups = PopupTextPool_upv_1.new(container_1, 4)
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a2)
                --[[
                  line: 264
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a2)
            end
        )
    )
end
u24.applyAuthoredLighting = function(a1)
    --[[
      name: applyAuthoredLighting
      line: 268
      upvalues:
        resolveSnakeLighting_upv_1 (copy, index: 1)
        readLightingFolderProfile_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        SNAKE_STAGE_LIGHTING_upv_1 (copy, index: 4)
    ]]
    local v9 = resolveSnakeLighting_upv_1()
    if v9 ~= nil then
        a1.stage.setLighting(readLightingFolderProfile_upv_1(v9, tbl_upv_1, SNAKE_STAGE_LIGHTING_upv_1))
    else
        return nil
    end
end
u24.buildProceduralBoard = function(a1, a2, a3, a4)
    --[[
      name: buildProceduralBoard
      line: 275
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        SNAKE_CONFIG_upv_1 (copy, index: 3)
        u5 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        u6 (copy, index: 6)
        u7 (copy, index: 7)
    ]]
    local v10 = makeSmoothPart_upv_1(a2)
    v10.Color = u4
    v10.Size = Vector3.new(a3 + (SNAKE_CONFIG_upv_1.wallThickness * 2), a4 + (SNAKE_CONFIG_upv_1.wallThickness * 2), 1)
    v10.CFrame = CFrame.new(a1.stage.origin + Vector3.new(0, SNAKE_CONFIG_upv_1.boardCenterY, -1.6))
    for n_2 = 0, SNAKE_CONFIG_upv_1.gridRows - 1 do
        for n_3 = 0, SNAKE_CONFIG_upv_1.gridCols - 1 do
            if (n_3 + n_2) % 2 == 0 then
                local v11 = makeSmoothPart_upv_1(a2)
                v11.Color = u5
                v11.Size = Vector3.new(SNAKE_CONFIG_upv_1.cellSize, SNAKE_CONFIG_upv_1.cellSize, 0.4)
                v11.CFrame = CFrame.new(a1:cellPosition(n_3, n_2) + Vector3.new(0, 0, -0.8999999761581421))
            end
        end
    end
    local v12 = Vector3.new(a3 + (SNAKE_CONFIG_upv_1.wallThickness * 2), SNAKE_CONFIG_upv_1.wallThickness, 1.8)
    local v13 = Vector3.new(SNAKE_CONFIG_upv_1.wallThickness, a4, 1.8)
    local v14 = a4 / 2 + SNAKE_CONFIG_upv_1.wallThickness / 2
    local v15 = a3 / 2 + SNAKE_CONFIG_upv_1.wallThickness / 2
    local v16 = nil
    for _, value_1 in {{v12, Vector3.new(0, v14, 0)}, {v12, Vector3.new(0, -v14, 0)}, {v13, Vector3.new(v15, 0, 0)}, {v13, Vector3.new(-v15, 0, 0)}} do
        v16 = makeStagePart_upv_1(a2)
        v16.Color = u6
        v16.Size = value_1[1]
        v16.CFrame = CFrame.new((a1.stage.origin + Vector3.new(0, SNAKE_CONFIG_upv_1.boardCenterY, 0)) + value_1[2])
    end
    local v17 = SNAKE_CONFIG_upv_1.wallThickness + 0.7
    local v18 = nil
    for _, value_2 in {-v15, v15} do
        for v19, value_3 in {-v14, v14} do
            v18 = makeStagePart_upv_1(a2)
            v18.Color = u7
            v18.Size = Vector3.new(v17, v17, 2.3)
            v18.CFrame = CFrame.new(a1.stage.origin + Vector3.new(value_2, value_3 + SNAKE_CONFIG_upv_1.boardCenterY, 0.1))
        end
    end
end
u24.makeFacePart = function(a1, a2, a3)
    --[[
      name: makeFacePart
      line: 324
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v19 = makeSmoothPart_upv_1(a1.stage.container)
    v19.Shape = Enum.PartType.Ball
    v19.Color = a3
    v19.Size = Vector3.new(a2, a2, a2)
    v19.CFrame = u1
    return v19
end
u24.resetRound = function(a1)
    --[[
      name: resetRound
      line: 332
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        SNAKE_CONFIG_upv_1 (copy, index: 2)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.foodSeed = deriveSeed_upv_1(a1.context.getRunSeed(), 0)
    a1.foodRandom = Random.new(a1.foodSeed)
    a1.armed = false
    a1.dead = false
    a1.score = 0
    a1.eaten = 0
    a1.pendingGrowth = 0
    a1.tickTimer = 0
    a1.lastHeadScale = 1
    a1.heading = "right"
    table.clear(a1.turnQueue)
    a1:reclaimAllBodyParts()
    a1:parkCrumbs()
    table.clear(a1.occupied)
    table.clear(a1.bulgeCells)
    a1.eatWaveElapsed = math.huge
    local v20 = math.floor((SNAKE_CONFIG_upv_1.gridCols - 1) / 2)
    local v21 = math.floor((SNAKE_CONFIG_upv_1.gridRows - 1) / 2)
    a1.tailPtr = 0
    a1.headPtr = SNAKE_CONFIG_upv_1.startLength - 1
    a1.snakeLength = SNAKE_CONFIG_upv_1.startLength
    for n_4 = 0, SNAKE_CONFIG_upv_1.startLength - 1 do
        local v22 = a1:cellIndex(v20 - ((SNAKE_CONFIG_upv_1.startLength - 1) - n_4), v21)
        a1.snakeCells[n_4 + 1] = v22
        a1.occupied[v22] = true
        if n_4 < SNAKE_CONFIG_upv_1.startLength - 1 then
            table.insert(a1.orderedBodyParts, (a1:acquireBodyPart()))
        end
    end
    a1:recolorBody()
    a1.headCol = v20
    a1.headRow = v21
    a1:parkHead()
    a1.slideTick = false
    a1.tailFromCell = a1.snakeCells[1]
    a1.headFromCell = a1:cellIndex(v20, v21)
    a1.faceDirX = 1
    a1.faceDirY = 0
    a1.tongueTimer = a1.random:NextNumber(SNAKE_CONFIG_upv_1.tongueIntervalMin, SNAKE_CONFIG_upv_1.tongueIntervalMax)
    a1.tongueVisible = 0
    a1:spawnFood()
    a1.context.reportScore(0)
end
u24.captureRound = function(a1)
    --[[
      name: captureRound
      line: 382
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    end
    return writeResume_upv_1(
        function(a2)
            --[[
              line: 386
              upvalues:
                a1 (copy, index: 1)
                u2 (copy, index: 2)
            ]]
            a2:int(a1.score):int(a1.eaten):int(a1.pendingGrowth):int(a1.foodIndex)
            a2:int(a1.headCol):int(a1.headRow):str(a1.heading)
            a2:int(a1.snakeLength)
            local v23 = 0
            local v24 = false
            while true do
                if v24 then
                    v23 = v23 + 1
                else
                    v24 = true
                end
                if v23 >= a1.snakeLength then
                    break
                end
                a2:int(a1.snakeCells[((a1.tailPtr + v23) % u2) + 1])
            end
        end
    )
end
u24.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 407
      upvalues:
        readResume_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        SNAKE_CONFIG_upv_1 (copy, index: 3)
        deriveSeed_upv_1 (copy, index: 4)
    ]]
    local v25 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 408
            ]]
            local tbl_7 = {}
            tbl_7.score = a3:int()
            tbl_7.eaten = a3:int()
            tbl_7.pendingGrowth = a3:int()
            tbl_7.foodIndex = a3:int()
            tbl_7.headCol = a3:int()
            tbl_7.headRow = a3:int()
            tbl_7.heading = a3:str()
            local v26 = a3:int()
            local tbl_8 = {}
            local v27 = 0
            local v28 = false
            v28, v27 = v28, v27
            while true do
                if v28 then
                    v27 = v27 + 1
                else
                    v28 = true
                end
                if v27 >= v26 then
                    break
                end
                table.insert(tbl_8, (a3:int()))
            end
            v27 = table.clone(tbl_7)
            setmetatable(v27, nil)
            v27.cells = tbl_8
            return v27
        end
    )
    if v25 ~= nil and #v25.cells ~= 0 and u2 > #v25.cells and (v25.heading == "up" or v25.heading == "down" or v25.heading == "left" or v25.heading == "right") then
        a1:reclaimAllBodyParts()
        a1:parkCrumbs()
        table.clear(a1.occupied)
        table.clear(a1.bulgeCells)
        a1.score = a2.score
        a1.eaten = v25.eaten
        a1.pendingGrowth = v25.pendingGrowth
        a1.foodIndex = v25.foodIndex
        a1.headCol = v25.headCol
        a1.headRow = v25.headRow
        a1.heading = v25.heading
        a1.armed = false
        a1.dead = false
        a1.tickTimer = 0
        a1.lastHeadScale = 1
        table.clear(a1.turnQueue)
        a1.eatWaveElapsed = math.huge
        a1.roundToken = a1.roundToken + 1
        a1.tailPtr = 0
        a1.headPtr = #v25.cells - 1
        a1.snakeLength = #v25.cells
        local v29 = nil
        for key_1, value_4 in v25.cells do
            v29 = key_1 - 1
            a1.snakeCells[v29 + 1] = value_4
            a1.occupied[value_4] = true
            if v29 < #v25.cells - 1 then
                table.insert(a1.orderedBodyParts, (a1:acquireBodyPart()))
            end
        end
        a1:recolorBody()
        a1:parkHead()
        a1.slideTick = false
        a1.tailFromCell = v25.cells[1]
        a1.headFromCell = a1:cellIndex(a1.headCol, a1.headRow)
        a1.faceDirX = ((a1.heading == "left") and -1) or (((a1.heading ~= "right") and 0) or 1)
        a1.faceDirY = ((a1.heading == "down") and -1) or (((a1.heading ~= "up") and 0) or 1)
        a1.tongueVisible = 0
        if a1.foodIndex >= 0 then
            local v30 = math.floor(a1.foodIndex / SNAKE_CONFIG_upv_1.gridCols)
            a1.food.Size = a1.foodBaseSize
            a1.food.CFrame = CFrame.new(a1:cellPosition(a1.foodIndex % SNAKE_CONFIG_upv_1.gridCols, v30))
        end
        a1.foodRandom = Random.new(deriveSeed_upv_1(a1.foodSeed, a1.eaten + 1))
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u24.revive = function(a1)
    --[[
      name: revive
      line: 514
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.tickTimer = 0
    a1.lastHeadScale = 1
    table.clear(a1.turnQueue)
    local snakeLength_1 = a1.snakeLength
    a1:reclaimAllBodyParts()
    a1:parkCrumbs()
    table.clear(a1.occupied)
    table.clear(a1.bulgeCells)
    local v31 = math.floor((SNAKE_CONFIG_upv_1.gridCols - 1) / 2)
    local v32 = math.floor((SNAKE_CONFIG_upv_1.gridRows - 1) / 2)
    if a1.foodIndex == a1:cellIndex(v31, v32) then
        v31 = v31 - 1
    end
    local v33 = a1:cellIndex(v31, v32)
    a1.tailPtr = 0
    a1.headPtr = 0
    a1.snakeCells[1] = v33
    a1.snakeLength = 1
    a1.occupied[v33] = true
    a1.headCol = v31
    a1.headRow = v32
    a1.heading = "right"
    a1.pendingGrowth = math.max(math.ceil(snakeLength_1 / 2), SNAKE_CONFIG_upv_1.reviveMinLength) - 1
    a1:parkHead()
    a1.slideTick = false
    a1.tailFromCell = v33
    a1.headFromCell = v33
    a1.faceDirX = 1
    a1.faceDirY = 0
    a1.tongueVisible = 0
    a1.eatWaveElapsed = math.huge
    a1.armed = true
    a1:setRunning(true)
end
u24.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 555
    ]]
    if not a1.dead and a1.armed then
        a1.tickTimer = a1.tickTimer + a2
        local v34 = 1 / a1:tickRate()
        while v34 <= a1.tickTimer do
            a1.tickTimer = a1.tickTimer - v34
            a1:advanceTick()
            if not (a1.dead) then
                v34 = 1 / a1:tickRate()
                continue
            end
            return nil
        end
    else
        return nil
    end
end
u24.render = function(a1, a2)
    --[[
      name: render
      line: 570
    ]]
    a1:animateFood()
    a1:renderSnake(a2)
end
u24.onIdle = function(a1)
    --[[
      name: onIdle
      line: 574
    ]]
    a1:animateFood()
end
u24.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 577
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.dead then
        return nil
    end
    a1.armed = true
    if #a1.turnQueue >= SNAKE_CONFIG_upv_1.turnQueueMax then
        a1.turnQueue[#a1.turnQueue] = a2
    else
        table.insert(a1.turnQueue, a2)
    end
end
u24.advanceTick = function(a1)
    --[[
      name: advanceTick
      line: 590
      upvalues:
        tbl_upv_3 (copy, index: 1)
        SNAKE_CONFIG_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    a1:applyQueuedTurn()
    local v35 = tbl_upv_3[a1.heading]
    local v36 = a1.headCol + v35.col
    local v37 = a1.headRow + v35.row
    if v36 >= 0 and SNAKE_CONFIG_upv_1.gridCols > v36 and v37 >= 0 and SNAKE_CONFIG_upv_1.gridRows > v37 then
        local v38 = a1:cellIndex(v36, v37)
        local v39 = v38 == a1.foodIndex
        local v40
        if v39 or a1.pendingGrowth <= 0 then
            v40 = v39
        else
            v40 = true
            a1.pendingGrowth = a1.pendingGrowth - 1
        end
        local v41 = a1.snakeCells[a1.headPtr + 1]
        if v40 then
            a1.tailFromCell = a1.snakeCells[a1.tailPtr + 1]
            a1.slideTick = false
        else
            local v42 = a1.snakeCells[a1.tailPtr + 1]
            a1.occupied[v42] = nil
            a1.tailPtr = (a1.tailPtr + 1) % u2
            a1.tailFromCell = v42
            a1.slideTick = true
        end
        if a1.occupied[v38] == nil then
            a1.headFromCell = v41
            a1.headPtr = (a1.headPtr + 1) % u2
            a1.snakeCells[a1.headPtr + 1] = v38
            a1.occupied[v38] = true
            if v40 then
                a1.snakeLength = a1.snakeLength + 1
                table.insert(a1.orderedBodyParts, (a1:acquireBodyPart()))
                a1:recolorBody()
            end
            a1.headCol = v36
            a1.headRow = v37
            for n_5 = #a1.bulgeCells - 1, 0, -1 do
                local v43, v44, v45
                if a1.occupied[a1.bulgeCells[n_5 + 1]] ~= nil then
                    continue
                end
                v43 = a1.bulgeCells
                v44 = n_5 + 1
                v45 = #v43
                if v43[v44] ~= nil then
                    v43[v44] = v43[v45]
                    v43[v45] = nil
                end
            end
            if v39 then
                a1:onAte()
            end
        else
            a1:die()
            return nil
        end
    else
        a1:die()
        return nil
    end
end
u24.onAte = function(a1)
    --[[
      name: onAte
      line: 663
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
        u17 (copy, index: 2)
    ]]
    a1.eaten = a1.eaten + 1
    a1.score = a1.score + SNAKE_CONFIG_upv_1.foodValue
    a1.context.reportScore(a1.score)
    a1.context.audio.play("pop", {pitch = 1 + ((a1.eaten % 12) * 0.04)})
    a1.eatWaveElapsed = 0
    a1:burstCrumbs()
    if #a1.bulgeCells < 8 then
        table.insert(a1.bulgeCells, a1.snakeCells[a1.headPtr + 1])
    end
    if a1.score % SNAKE_CONFIG_upv_1.milestoneEvery == 0 then
        a1.context.audio.play("perfect", {})
        a1.popups:show(a1:cellPosition(a1.headCol, a1.headRow) + Vector3.new(0, 2, 2), ("%*"):format(a1.score), u17, 1.1)
    end
    a1:spawnFood()
end
u24.applyQueuedTurn = function(a1)
    --[[
      name: applyQueuedTurn
      line: 691
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    while true do
        local v46
        if #a1.turnQueue <= 0 then
            break
        end
        v46 = table.remove(a1.turnQueue, 1)
        if v46 == nil then
            break
        end
        if v46 == a1.heading or v46 == tbl_upv_4[a1.heading] then
            continue
        end
        a1.heading = v46
        return
    end
end
u24.spawnFood = function(a1)
    --[[
      name: spawnFood
      line: 704
      upvalues:
        u3 (copy, index: 1)
        u1 (copy, index: 2)
        SNAKE_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v47 = u3 - a1.snakeLength
    if v47 > 0 then
        local v48 = a1.foodRandom:NextInteger(1, v47)
        local v49 = 0
        local v50 = false
        while true do
            if v50 then
                v49 = v49 + 1
            else
                v50 = true
            end
            if v49 < u3 then
                if a1.occupied[v49] ~= nil then
                    continue
                end
                v48 = v48 - 1
                if v48 == 0 then
                    break
                end
            end
            v50 = math.floor(a1.foodIndex / SNAKE_CONFIG_upv_1.gridCols)
            a1.food.Size = a1.foodBaseSize
            a1.food.CFrame = CFrame.new(a1:cellPosition(a1.foodIndex % SNAKE_CONFIG_upv_1.gridCols, v50))
            return
        end
        a1.foodIndex = v49
    else
        a1.foodIndex = -1
        a1.food.CFrame = u1
        a1.foodStem.CFrame = u1
        a1.foodLeaf.CFrame = u1
        return nil
    end
end
u24.animateFood = function(a1)
    --[[
      name: animateFood
      line: 744
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.foodIndex >= 0 then
        local v51 = 1 + SNAKE_CONFIG_upv_1.foodPulseAmplitude * math.sin(((os.clock() / SNAKE_CONFIG_upv_1.foodPulsePeriod) * math.pi) * 2)
        a1.food.Size = a1.foodBaseSize * v51
        local Position_1 = a1.food.Position
        local v52 = Position_1.Y + (a1.foodBaseSize.Y * v51) / 2
        a1.foodStem.CFrame = CFrame.new(Position_1.X + 0.02, v52 + 0.22, Position_1.Z + 0.2)
        a1.foodLeaf.CFrame = CFrame.new(Position_1.X + 0.42, v52 + 0.14, Position_1.Z + 0.2) * CFrame.Angles(0, 0, -0.4537856055185257)
    else
        return nil
    end
end
u24.recolorBody = function(a1)
    --[[
      name: recolorBody
      line: 758
      upvalues:
        u9 (copy, index: 2)
        u10 (copy, index: 3)
    ]]
    local v53 = #a1.orderedBodyParts
    local v54 = 0
    local v55 = false
    if v55 then
        v54 = v54 + 1
    else
        v55 = true
    end
    local v56 = nil
    if v54 < v53 then
        v56 = math.min(((v53 - 1) - v54) * 0.022, 0.45)
        local v57 = a1.orderedBodyParts[v54 + 1]
        local v58
        if v56 <= 0 then
            v58 = u9
        else
            v58 = u9:Lerp(u10, v56)
        end
        v57.Color = v58
        if v55 then
            v54 = v54 + 1
        else
            v55 = true
        end
    end
end
u24.burstCrumbs = function(a1)
    --[[
      name: burstCrumbs
      line: 778
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v59 = a1:cellPosition(a1.headCol, a1.headRow)
    for _ = 0, 4 do
        local crumbCursor_upv_1 = a1.crumbCursor
        a1.crumbCursor = (a1.crumbCursor + 1) % 10
        local u25 = a1.crumbs[crumbCursor_upv_1 + 1]
        local u26 = a1.crumbGenerations[crumbCursor_upv_1 + 1] + 1
        a1.crumbGenerations[crumbCursor_upv_1 + 1] = u26
        u25.Anchored = false
        u25.CFrame = CFrame.new(v59.X + a1.random:NextNumber(-0.4, 0.4), v59.Y + a1.random:NextNumber(-0.1, 0.5), v59.Z + 1.2)
        u25.AssemblyLinearVelocity = Vector3.new(a1.random:NextNumber(-9, 9), a1.random:NextNumber(4, 13), a1.random:NextNumber(1, 4))
        u25.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-14, 14), a1.random:NextNumber(-14, 14), a1.random:NextNumber(-14, 14))
        task.delay(
            0.7,
            function()
                --[[
                  line: 790
                  upvalues:
                    a1 (copy, index: 1)
                    crumbCursor_upv_1 (copy, index: 2)
                    u26 (copy, index: 3)
                    u25 (copy, index: 4)
                    u1 (copy, index: 5)
                ]]
                if a1.crumbGenerations[crumbCursor_upv_1 + 1] == u26 then
                    u25.Anchored = true
                    u25.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                    u25.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                    u25.CFrame = u1
                else
                    return nil
                end
            end
        )
    end
end
u24.parkCrumbs = function(a1)
    --[[
      name: parkCrumbs
      line: 801
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_6 = 0, 9 do
        local crumbGenerations_1 = a1.crumbGenerations
        local v60 = n_6 + 1
        crumbGenerations_1[v60] = crumbGenerations_1[v60] + 1
        local v61 = a1.crumbs[n_6 + 1]
        v61.Anchored = true
        v61.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        v61.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
        v61.CFrame = u1
    end
end
u24.renderSnake = function(a1, a2)
    --[[
      name: renderSnake
      line: 811
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v62 = nil
    if a1.dead then
        return nil
    else
        local origin_1 = a1.stage.origin
        local snakeLength_2 = a1.snakeLength
        a1.eatWaveElapsed = a1.eatWaveElapsed + a2
        a1.eatWaveCenter = (snakeLength_2 - 1) - (math.pow(a1.eatWaveElapsed / SNAKE_CONFIG_upv_1.eatWaveSeconds, 1.7) * ((snakeLength_2 - 1) + SNAKE_CONFIG_upv_1.eatWaveWidthSegments))
        local v63 = 1
        v62 = math.abs((snakeLength_2 - 1) - a1.eatWaveCenter)
        if v62 < SNAKE_CONFIG_upv_1.eatWaveWidthSegments then
            local _ = 1 - v62 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments
            v63 = 1 + SNAKE_CONFIG_upv_1.eatWaveScale * (1 - v62 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments) * (1 - v62 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments) * (3 - 2 * (1 - v62 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments))
        end
        if math.abs(v63 - a1.lastHeadScale) > 0.01 then
            a1.lastHeadScale = v63
            a1.head.Size = a1.headBaseSize * v63
        end
        local v64 = 0
        local v65 = false
        while true do
            if v65 then
                v64 = v64 + 1
            else
                v65 = true
            end
            if v64 >= snakeLength_2 then
                break
            end
            local v66 = a1.snakeCells[((a1.tailPtr + v64) % u2) + 1]
            a1.renderX[v64 + 1] = a1:cellPlaneX(v66)
            a1.renderY[v64 + 1] = a1:cellPlaneY(v66)
        end
        v65, v64 = false, 0
        if v65 then
            v64 = v64 + 1
        else
            v65 = true
        end
        if v64 < snakeLength_2 then
            local v67 = a1.renderX[v64 + 1]
            local v68 = a1.renderY[v64 + 1]
            if v64 ~= snakeLength_2 - 1 then
                local v69 = a1.orderedBodyParts[v64 + 1]
                v69.CFrame = CFrame.new(origin_1.X + v67, origin_1.Y + v68, origin_1.Z)
                a1:applyBulge(v69, v64, v67, v68)
            else
                a1.head.CFrame = CFrame.new(origin_1.X + v67, origin_1.Y + v68, origin_1.Z + 0.12)
                a1:renderFace(v67, v68, a2, origin_1)
            end
            if v65 then
                v64 = v64 + 1
            else
                v65 = true
            end
        end
    end
end
u24.applyBulge = function(a1, a2, a3, a4, a5)
    --[[
      name: applyBulge
      line: 878
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v70 = 1
    local v71 = math.abs(a3 - a1.eatWaveCenter)
    if v71 < SNAKE_CONFIG_upv_1.eatWaveWidthSegments then
        local _ = 1 - v71 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments
        v70 = 1 + SNAKE_CONFIG_upv_1.eatWaveScale * ((1 - v71 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments) * (1 - v71 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments) * (3 - 2 * (1 - v71 / SNAKE_CONFIG_upv_1.eatWaveWidthSegments)))
    end
    local v72 = nil
    local v73 = nil
    local v74 = nil
    for _, value_5 in a1.bulgeCells do
        v72 = a4 - a1:cellPlaneX(value_5)
        v73 = a5 - a1:cellPlaneY(value_5)
        v74 = math.sqrt((v72 * v72) + (v73 * v73)) / SNAKE_CONFIG_upv_1.cellSize
        if v74 < SNAKE_CONFIG_upv_1.bulgeRadiusCells then
            v70 = math.max(v70, 1 + (SNAKE_CONFIG_upv_1.bulgeScale * (1 - (v74 / SNAKE_CONFIG_upv_1.bulgeRadiusCells))))
        end
    end
    if math.abs(v70 - a1.lastSegmentScale[a3 + 1]) <= 0.01 then
        return
    end
    a1.lastSegmentScale[a3 + 1] = v70
    a2.Size = Vector3.new(SNAKE_CONFIG_upv_1.segmentSize * v70, SNAKE_CONFIG_upv_1.segmentSize * v70, 1.8)
end
u24.renderFace = function(a1, a2, a3, a4, a5)
    --[[
      name: renderFace
      line: 901
      upvalues:
        tbl_upv_3 (copy, index: 1)
        SNAKE_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local v75 = tbl_upv_3[a1.heading]
    local v76 = math.min(a4 * SNAKE_CONFIG_upv_1.faceTurnRate, 1)
    local faceDirX_1 = a1.faceDirX
    a1.faceDirX = faceDirX_1 + ((v75.col - faceDirX_1) * v76)
    local faceDirY_1 = a1.faceDirY
    a1.faceDirY = faceDirY_1 + ((v75.row - faceDirY_1) * v76)
    local v77 = math.max(math.sqrt((a1.faceDirX * a1.faceDirX) + (a1.faceDirY * a1.faceDirY)), 0.05)
    local v78 = a1.faceDirX / v77
    local v79 = a1.faceDirY / v77
    local v80 = -v79
    local v81 = math.huge
    local v82, v83
    if a1.foodIndex < 0 then
        v82, v83 = v78, v79
    else
        v82 = a1:cellPlaneX(a1.foodIndex) - a2
        v83 = a1:cellPlaneY(a1.foodIndex) - a3
        v81 = math.sqrt((v82 * v82) + (v83 * v83)) / SNAKE_CONFIG_upv_1.cellSize
    end
    local v84 = math.max(math.sqrt((v82 * v82) + (v83 * v83)), 0.001)
    local v85 = v82 / v84 * 0.13
    local v86 = v83 / v84 * 0.13
    local v87 = nil
    local v88 = nil
    for _, value_6 in tbl_upv_2 do
        if value_6 >= 0 then
            v87 = a1.eyeRight
        else
            v87 = a1.eyeLeft
        end
        if value_6 >= 0 then
            v88 = a1.pupilRight
        else
            v88 = a1.pupilLeft
        end
        local v89 = a2 + (faceDirX_1 * 0.55) + (v80 * 0.5) * value_6
        local v90 = a3 + (v79 * 0.55) + (faceDirX_1 * 0.5) * value_6
        v87.CFrame = CFrame.new(a5.X + v89, a5.Y + v90, a5.Z + 1.1)
        v88.CFrame = CFrame.new((a5.X + v89) + v85, (a5.Y + v90) + v86, a5.Z + 1.34)
    end
    local v91 = math.clamp((SNAKE_CONFIG_upv_1.mouthOpenCells - v81) / (SNAKE_CONFIG_upv_1.mouthOpenCells - 0.35), 0, 1)
    local v92 = math.atan2(v79, faceDirX_1)
    if v91 <= 0.02 then
        a1.mouth.CFrame = u1
        if a1.tongueVisible <= 0 then
            a1.tongue.CFrame = u1
            a1.tongueTimer = a1.tongueTimer - a4
            if a1.tongueTimer <= 0 then
                a1.tongueTimer = a1.random:NextNumber(SNAKE_CONFIG_upv_1.tongueIntervalMin, SNAKE_CONFIG_upv_1.tongueIntervalMax)
                a1.tongueVisible = SNAKE_CONFIG_upv_1.tongueFlickSeconds
            end
        else
            a1.tongueVisible = math.max(a1.tongueVisible - a4, 0)
            local v93 = math.sin((1 - (a1.tongueVisible / SNAKE_CONFIG_upv_1.tongueFlickSeconds)) * math.pi) * 0.85 + 0.2
            a1.tongue.Size = Vector3.new(v93, 0.22, 0.3)
            a1.tongue.CFrame = CFrame.new((a5.X + a2) + (faceDirX_1 * ((v93 / 2) + 1)), (a5.Y + a3) + (v79 * ((v93 / 2) + 1)), a5.Z + 1.05) * CFrame.Angles(0, 0, v92)
        end
    else
        a1.mouth.Size = Vector3.new((v91 * 0.55) + 0.2, 0.85, 0.35)
        a1.mouth.CFrame = CFrame.new((a5.X + a2) + (faceDirX_1 * 0.8), (a5.Y + a3) + (v79 * 0.8), a5.Z + 1.12) * CFrame.Angles(0, 0, v92)
        a1.tongue.CFrame = u1
        a1.tongueVisible = 0
        return nil
    end
end
u24.parkFace = function(a1)
    --[[
      name: parkFace
      line: 965
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.eyeLeft.CFrame = u1
    a1.eyeRight.CFrame = u1
    a1.pupilLeft.CFrame = u1
    a1.pupilRight.CFrame = u1
    a1.mouth.CFrame = u1
    a1.tongue.CFrame = u1
end
u24.die = function(a1)
    --[[
      name: die
      line: 973
      upvalues:
        u11 (copy, index: 1)
        u18 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
        SNAKE_CONFIG_upv_1 (copy, index: 4)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1:setRunning(false)
        for _, u27 in a1.orderedBodyParts do
            u27.Color = u11
        end
        a1:parkFace()
        a1.context.audio.play("buzz", {})
        a1.context.audio.play("splat", {})
        a1.stage.shake(0.9)
        a1.popups:show(a1:cellPosition(a1.headCol, a1.headRow) + Vector3.new(0, 2, 2), "OUCH!", u18, 1)
        local v94 = tbl_upv_3[a1.heading]
        a1.head.Anchored = false
        a1.head.AssemblyLinearVelocity = Vector3.new(v94.col * SNAKE_CONFIG_upv_1.deathFlingSpeed, SNAKE_CONFIG_upv_1.deathFlingUp + (v94.row * SNAKE_CONFIG_upv_1.deathFlingSpeed), 0)
        a1.head.AssemblyAngularVelocity = Vector3.new(a1.random:NextNumber(-8, 8), a1.random:NextNumber(-8, 8), a1.random:NextNumber(-8, 8))
        task.delay(
            2.5,
            function()
                --[[
                  line: 1002
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.head.Anchored = true
            end
        )
        local score_upv_1 = a1.score
        local u27 = a1.roundToken
        task.delay(
            SNAKE_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 1007
                  upvalues:
                    a1 (copy, index: 1)
                    u27 (copy, index: 2)
                    score_upv_1 (copy, index: 3)
                ]]
                if a1.roundToken ~= u27 then
                    return
                end
                a1.context.endRun(score_upv_1)
            end
        )
    end
end
u24.tickRate = function(a1)
    --[[
      name: tickRate
      line: 1013
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.min(SNAKE_CONFIG_upv_1.tickRateStart + (a1.eaten * SNAKE_CONFIG_upv_1.tickRatePerFood), SNAKE_CONFIG_upv_1.tickRateMax))
end
u24.cellIndex = function(a1, a2, a3)
    --[[
      name: cellIndex
      line: 1016
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (a3 * SNAKE_CONFIG_upv_1.gridCols) + a2
end
u24.cellPosition = function(a1, a2, a3)
    --[[
      name: cellPosition
      line: 1019
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1.stage.origin + Vector3.new((a2 - ((SNAKE_CONFIG_upv_1.gridCols - 1) / 2)) * SNAKE_CONFIG_upv_1.cellSize, ((a3 - ((SNAKE_CONFIG_upv_1.gridRows - 1) / 2)) * SNAKE_CONFIG_upv_1.cellSize) + SNAKE_CONFIG_upv_1.boardCenterY, 0)
end
u24.cellPlaneX = function(a1, a2)
    --[[
      name: cellPlaneX
      line: 1026
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    return ((a2 % SNAKE_CONFIG_upv_1.gridCols) - ((SNAKE_CONFIG_upv_1.gridCols - 1) / 2)) * SNAKE_CONFIG_upv_1.cellSize
end
u24.cellPlaneY = function(a1, a2)
    --[[
      name: cellPlaneY
      line: 1029
      upvalues:
        SNAKE_CONFIG_upv_1 (copy, index: 1)
    ]]
    return ((math.floor(a2 / SNAKE_CONFIG_upv_1.gridCols) - ((SNAKE_CONFIG_upv_1.gridRows - 1) / 2)) * SNAKE_CONFIG_upv_1.cellSize) + SNAKE_CONFIG_upv_1.boardCenterY
end
u24.createBodyPart = function(a1)
    --[[
      name: createBodyPart
      line: 1032
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u23 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v95 = makeStagePart_upv_1(a1.stage.container)
    v95.Size = u23
    v95.CFrame = u1
    table.insert(a1.allBodyParts, v95)
    return v95
end
u24.acquireBodyPart = function(a1)
    --[[
      name: acquireBodyPart
      line: 1040
      upvalues:
        u23 (copy, index: 1)
    ]]
    local freeBodyParts_1 = a1.freeBodyParts
    local v96 = #freeBodyParts_1
    local v97 = freeBodyParts_1[v96]
    freeBodyParts_1[v96] = nil
    if v97 == nil then
        v97 = a1:createBodyPart()
    end
    v97.Size = u23
    return v97
end
u24.parkHead = function(a1)
    --[[
      name: parkHead
      line: 1056
    ]]
    a1.head.Anchored = true
    a1.head.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    a1.head.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    a1.head.Size = a1.headBaseSize
    a1.head.CFrame = CFrame.new(a1:cellPosition(a1.headCol, a1.headRow))
end
u24.reclaimAllBodyParts = function(a1)
    --[[
      name: reclaimAllBodyParts
      line: 1063
      upvalues:
        u1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    table.clear(a1.orderedBodyParts)
    while #a1.freeBodyParts > 0 do
        local freeBodyParts_2 = a1.freeBodyParts
        freeBodyParts_2[#freeBodyParts_2] = nil
    end
    for _, value_7 in a1.allBodyParts do
        value_7.CFrame = u1
        table.insert(a1.freeBodyParts, value_7)
    end
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
        a1.lastSegmentScale[v99 + 1] = 1
    end
end
local tbl_9 = {}
tbl_9.SnakeGame = u24
return tbl_9