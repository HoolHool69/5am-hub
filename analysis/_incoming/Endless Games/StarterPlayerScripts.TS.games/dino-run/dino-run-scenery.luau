-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local DINO_RUN_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "dino-run-config").DINO_RUN_CONFIG
local DINO_STYLE_upv_1 = RuntimeLib_1.import(script, script.Parent, "dino-run-style").DINO_STYLE
local u1 = CFrame.new(0, -1000, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 29
    ]]
    return "DinoScenery"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 34
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u2)
    return v2:constructor(...) or v2
end
u2.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 38
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    a1.container = a2
    a1.stage = a3
    a1.palette = a4
    a1.clusters = {}
    a1.stars = {}
    a1.moonTiles = {}
    a1.random = Random.new()
    a1.nightBlend = 1
    a1.starClock = 0
    a1.haloClock = 0
    a1.shootRemaining = 0
    a1.shootStartX = 0
    a1.shootStartY = 0
    a1.origin = a3.origin
    a1:buildBackdrop()
    a1:buildGlowBands()
    a1:buildStars()
    a1.halo = a1:buildHalo()
    a1:buildMoon()
    a1:buildFarBand()
    a1:buildMesas()
    a1:buildClouds()
    a1:buildSoil()
    a1:buildGroundDetail()
    a1.shootingStar = a1:buildShootingStar()
    a1.shootTimer = a1.random:NextNumber(DINO_STYLE_upv_1.shootingStar.intervalMin, DINO_STYLE_upv_1.shootingStar.intervalMax)
    local v3 = a1:buildDust()
    a1.dustAnchor = v3[1]
    a1.dust = v3[2]
end
u2.scroll = function(a1, a2)
    --[[
      name: scroll
      line: 69
    ]]
    local v4 = nil
    for _, value_1 in a1.clusters do
        v4 = value_1.offset - a2 * value_1.factor
        if v4 < -value_1.halfLoop then
            v4 = v4 + value_1.loopSpan
        end
        value_1.offset = v4
    end
end
u2.idleDrift = function(a1, a2)
    --[[
      name: idleDrift
      line: 78
    ]]
    local v5 = nil
    for _, value_2 in a1.clusters do
        if value_2.idleDrift == 0 then
            continue
        end
        v5 = value_2.offset - a2 * value_2.idleDrift
        if v5 < -value_2.halfLoop then
            v5 = v5 + value_2.loopSpan
        end
        value_2.offset = v5
    end
end
u2.draw = function(a1, a2)
    --[[
      name: draw
      line: 90
    ]]
    for _, value_3 in a1.clusters do
        for v1, value_4 in value_3.parts do
            value_4.part.CFrame = CFrame.new(a1.origin + Vector3.new(value_3.offset + (a2 * value_3.factor) + value_4.localX, value_4.localY, value_3.z))
        end
    end
end
u2.setNightBlend = function(a1, a2)
    --[[
      name: setNightBlend
      line: 100
    ]]
    if a2 ~= a1.nightBlend then
        a1.nightBlend = a2
        for _, value_5 in a1.moonTiles do
            value_5.Transparency = 1 - a2
        end
    else
        return nil
    end
end
u2.updateAmbient = function(a1, a2, a3)
    --[[
      name: updateAmbient
      line: 110
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    a1.starClock = a1.starClock + a2
    a1.haloClock = a1.haloClock + a2
    if a3 > 0 then
        for _, value_6 in a1.stars do
            value_6.part.Transparency = 1 - ((1 - (value_6.baseTransparency + (math.sin((a1.starClock * value_6.speed) + value_6.phase) * DINO_STYLE_upv_1.stars.twinkleAmplitude))) * a3)
        end
        a1.halo.Transparency = 1 - ((1 - (DINO_STYLE_upv_1.moon.haloTransparency + (math.sin(a1.haloClock * (math.tau / DINO_STYLE_upv_1.moon.haloBreathePeriod)) * DINO_STYLE_upv_1.moon.haloBreatheAmplitude))) * a3)
        a1:advanceShootingStar(a2, a3)
    else
        for _, value_7 in a1.stars do
            value_7.part.Transparency = 1
        end
        a1.halo.Transparency = 1
        if a1.shootRemaining > 0 then
            a1:parkShootingStar()
        end
        return nil
    end
end
u2.snap = function(a1, a2)
    --[[
      name: snap
      line: 131
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    a1.nightBlend = (a2 and 1) or 0
    local v6 = (a2 and 0) or 1
    local _ = nil
    local v7 = nil
    for v8, value_8 in a1.moonTiles do
        value_8.Transparency = v6
    end
    for v9, value_9 in a1.stars do
        value_9.part.Transparency = ((not a2) and 1) or (value_9.baseTransparency)
    end
    a1.halo.Transparency = ((not a2) and 1) or (DINO_STYLE_upv_1.moon.haloTransparency)
    a1:parkShootingStar()
    a1.shootTimer = a1.random:NextNumber(DINO_STYLE_upv_1.shootingStar.intervalMin, DINO_STYLE_upv_1.shootingStar.intervalMax)
    a1.dust.Color = ColorSequence.new(a1.palette:color("ink"))
end
u2.emitDust = function(a1, a2, a3)
    --[[
      name: emitDust
      line: 145
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    a1.dustAnchor.CFrame = CFrame.new(a2 + Vector3.new(0, 0, DINO_STYLE_upv_1.z.dust))
    a1.dust.Color = ColorSequence.new(a1.palette:color("ink"))
    a1.dust:Emit(a3)
end
u2.buildBackdrop = function(a1)
    --[[
      name: buildBackdrop
      line: 152
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
    ]]
    a1.palette:register("background", (makeFrontalBackdrop_upv_1(a1.stage, a1.palette:color("background"))))
end
u2.buildGlowBands = function(a1)
    --[[
      name: buildGlowBands
      line: 156
      upvalues:
        DINO_RUN_CONFIG_upv_1 (copy, index: 1)
        DINO_STYLE_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
    ]]
    local groundY_1 = DINO_RUN_CONFIG_upv_1.groundY
    local v7 = nil
    for _, value_10 in DINO_STYLE_upv_1.glowBands do
        v7 = makeSmoothPart_upv_1(a1.container)
        v7.Material = Enum.Material.Neon
        v7.Size = Vector3.new(240, value_10.height, 1)
        v7.Transparency = value_10.transparency
        v7.CFrame = CFrame.new(a1.origin + Vector3.new(0, groundY_1 + value_10.yAboveGround, DINO_STYLE_upv_1.z.glowBands))
        a1.palette:register("horizonGlow", v7)
    end
end
u2.buildStars = function(a1)
    --[[
      name: buildStars
      line: 169
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
    ]]
    local tbl_3 = {}
    tbl_3.x0 = DINO_STYLE_upv_1.moon.x - 6
    tbl_3.x1 = DINO_STYLE_upv_1.moon.x + 6
    tbl_3.y0 = DINO_STYLE_upv_1.moon.y - 6
    tbl_3.y1 = DINO_STYLE_upv_1.moon.y + 6
    local v8, v9 = nil, nil
    for _ = 0, DINO_STYLE_upv_1.stars.count - 1 do
        v8 = 0
        v9 = 0
        local v12 = nil
        for v13 = 0, 5 do
            v12 = a1.random:NextNumber(DINO_STYLE_upv_1.stars.xMin, DINO_STYLE_upv_1.stars.xMax)
            v9 = a1.random:NextNumber(DINO_STYLE_upv_1.stars.yMin, DINO_STYLE_upv_1.stars.yMax)
            if v12 < tbl_3.x0 or tbl_3.x1 < v12 or v9 < tbl_3.y0 or tbl_3.y1 < v9 then
                break
            else
                v8 = v12
            end
        end
        local v11 = a1.random:NextNumber(DINO_STYLE_upv_1.stars.sizeMin, DINO_STYLE_upv_1.stars.sizeMax)
        v12 = makeSmoothPart_upv_1(a1.container)
        v12.Material = Enum.Material.Neon
        v12.Color = DINO_STYLE_upv_1.moon.color
        v12.Size = Vector3.new(v11, v11, 0.2)
        v12.CFrame = CFrame.new(a1.origin + Vector3.new(v8, v9, DINO_STYLE_upv_1.z.stars))
        table.insert(a1.stars, {part = v12, phase = a1.random:NextNumber(0, math.tau), speed = a1.random:NextNumber(DINO_STYLE_upv_1.stars.speedMin, DINO_STYLE_upv_1.stars.speedMax), baseTransparency = DINO_STYLE_upv_1.stars.baseTransparency})
        local v10
    end
end
u2.buildHalo = function(a1)
    --[[
      name: buildHalo
      line: 205
      upvalues:
        makeEllipsoidPart_upv_1 (copy, index: 1)
        DINO_STYLE_upv_1 (copy, index: 2)
    ]]
    local v13 = makeEllipsoidPart_upv_1(a1.container)
    v13.Material = Enum.Material.Neon
    v13.Color = DINO_STYLE_upv_1.moon.haloColor
    v13.Size = Vector3.new(DINO_STYLE_upv_1.moon.haloSize, DINO_STYLE_upv_1.moon.haloSize, 0.4)
    v13.Transparency = DINO_STYLE_upv_1.moon.haloTransparency
    v13.CFrame = CFrame.new(a1.origin + Vector3.new(DINO_STYLE_upv_1.moon.x, DINO_STYLE_upv_1.moon.y, DINO_STYLE_upv_1.z.moonHalo))
    return v13
end
u2.buildMoon = function(a1)
    --[[
      name: buildMoon
      line: 216
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
    ]]
    local tile_1 = DINO_STYLE_upv_1.moon.tile
    for n_1 = -3, 3 do
        for n_2 = -3, 3 do
            local v14
            v14 = (n_1 * n_1) + (n_2 * n_2) <= 6.760000000000001
            local v15 = ((n_1 - 1.55) * (n_1 - 1.55)) + (n_2 * n_2) <= 6.002500000000001
            if (v14) and not v15 then
                local v16 = makeSmoothPart_upv_1(a1.container)
                v16.Material = Enum.Material.Neon
                v16.Color = DINO_STYLE_upv_1.moon.color
                v16.Size = Vector3.new(tile_1, tile_1, 0.2)
                v16.CFrame = CFrame.new(a1.origin + Vector3.new(DINO_STYLE_upv_1.moon.x + (n_1 * tile_1), DINO_STYLE_upv_1.moon.y + (n_2 * tile_1), DINO_STYLE_upv_1.z.moon))
                table.insert(a1.moonTiles, v16)
            end
        end
    end
end
u2.buildFarBand = function(a1)
    --[[
      name: buildFarBand
      line: 240
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
        makeStagePart_upv_1 (copy, index: 3)
    ]]
    local farBand_1 = DINO_STYLE_upv_1.farBand
    local groundY_2 = DINO_RUN_CONFIG_upv_1.groundY
    local v17 = farBand_1.slabCount * farBand_1.slabWidth / 2
    for n_3 = 0, farBand_1.slabCount - 1 do
        local tbl_4 = {}
        local v18 = makeStagePart_upv_1(a1.container)
        v18.Size = Vector3.new(farBand_1.slabWidth, farBand_1.slabHeight, 1)
        table.insert(tbl_4, {part = v18, localY = groundY_2 + (farBand_1.slabHeight / 2)})
        a1.palette:register("farBand", v18)
        for _ = 0, farBand_1.bumpsPerSlab - 1 do
            local v19 = a1.random:NextNumber(farBand_1.bumpWidthMin, farBand_1.bumpWidthMax)
            local v20 = makeStagePart_upv_1(a1.container)
            v20.Size = Vector3.new(v19, farBand_1.bumpHeight, 1)
            table.insert(tbl_4, {part = v20, localX = a1.random:NextNumber((-farBand_1.slabWidth / 2) + v19, (farBand_1.slabWidth / 2) - v19), localY = (groundY_2 + farBand_1.slabHeight) + (farBand_1.bumpHeight / 2)})
            a1.palette:register("farBand", v20)
        end
        table.insert(a1.clusters, {offset = (-v17 + (farBand_1.slabWidth / 2)) + (n_3 * farBand_1.slabWidth), z = DINO_STYLE_upv_1.z.farBand, factor = DINO_STYLE_upv_1.parallax.farBand, halfLoop = v17, loopSpan = farBand_1.slabCount * farBand_1.slabWidth, parts = tbl_4})
    end
end
u2.buildMesas = function(a1)
    --[[
      name: buildMesas
      line: 282
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
    ]]
    local mesas_1 = DINO_STYLE_upv_1.mesas
    local v21 = DINO_RUN_CONFIG_upv_1.groundY - mesas_1.sink
    local v22 = DINO_STYLE_upv_1.loop.mesa / 2
    for n_4 = 0, mesas_1.count - 1 do
        local v23 = a1.random:NextNumber(mesas_1.baseWidthMin, mesas_1.baseWidthMax)
        local v24 = a1.random:NextNumber(mesas_1.baseHeightMin, mesas_1.baseHeightMax)
        local v25 = v23 * mesas_1.upperWidthFraction
        local v26 = v24 * mesas_1.upperHeightFraction
        local v27 = v26 * 0.7
        local v28 = ((a1.random:NextNumber() >= 0.5) and 1) or -1
        local v29 = v23 * 0.45
        local v30 = v24 * 0.5
        local tbl_5 = {}
        table.insert(tbl_5, {part = a1:makeMesaPart(v23, v24), localY = v21 + (v24 / 2)})
        table.insert(tbl_5, {part = a1:makeMesaPart(v29, v30), localX = v28 * (((v23 / 2) + (v29 / 2)) - 0.6), localY = v21 + (v30 / 2)})
        table.insert(tbl_5, {part = a1:makeMesaPart(v25, v26), localX = -v23 * 0.1, localY = (v21 + v24) + (v26 / 2)})
        table.insert(tbl_5, {part = a1:makeMesaPart(v25 * 0.55, v27), localX = (-v23 * 0.1) + (v25 * 0.15), localY = ((v21 + v24) + v26) + (v27 / 2)})
        table.insert(a1.clusters, {offset = -v22 + ((n_4 + 0.5) * (DINO_STYLE_upv_1.loop.mesa / mesas_1.count)), z = DINO_STYLE_upv_1.z.mesa, factor = DINO_STYLE_upv_1.parallax.mesa, halfLoop = v22, loopSpan = DINO_STYLE_upv_1.loop.mesa, parts = tbl_5})
    end
end
u2.makeMesaPart = function(a1, a2, a3)
    --[[
      name: makeMesaPart
      line: 338
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v31 = makeStagePart_upv_1(a1.container)
    v31.Size = Vector3.new(a2, a3, 2)
    a1.palette:register("midSilhouette", v31)
    return v31
end
u2.buildClouds = function(a1)
    --[[
      name: buildClouds
      line: 344
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    a1:buildCloudBank(DINO_STYLE_upv_1.clouds.nearCount, DINO_STYLE_upv_1.clouds.nearYMin, DINO_STYLE_upv_1.clouds.nearYMax, DINO_STYLE_upv_1.z.nearCloud, DINO_STYLE_upv_1.parallax.nearCloud, DINO_STYLE_upv_1.loop.nearCloud, DINO_STYLE_upv_1.clouds.idleDriftNear)
    a1:buildCloudBank(DINO_STYLE_upv_1.clouds.farCount, DINO_STYLE_upv_1.clouds.farYMin, DINO_STYLE_upv_1.clouds.farYMax, DINO_STYLE_upv_1.z.farCloud, DINO_STYLE_upv_1.parallax.farCloud, DINO_STYLE_upv_1.loop.farCloud, DINO_STYLE_upv_1.clouds.idleDriftFar)
end
u2.buildCloudBank = function(a1, a2, a3, a4, a5, a6, a7, a8)
    --[[
      name: buildCloudBank
      line: 348
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        DINO_RUN_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v32 = a7 / 2
    local v33 = 0
    local v34 = false
    while true do
        if v34 then
            v33 = v33 + 1
        else
            v34 = true
        end
        if v33 >= a2 then
            break
        end
        local v35 = a1.random:NextNumber(DINO_STYLE_upv_1.clouds.scaleMin, DINO_STYLE_upv_1.clouds.scaleMax)
        local v36 = DINO_RUN_CONFIG_upv_1.groundY + a1.random:NextNumber(a3, a4)
        local tbl_6 = {}
        table.insert(tbl_6, (a1:makeCloudPart(6 * v35, 1.4 * v35, 0, v36)))
        table.insert(tbl_6, (a1:makeCloudPart(3 * v35, 1.2 * v35, -0.8 * v35, v36 + (0.9 * v35))))
        table.insert(tbl_6, (a1:makeCloudPart(2.4 * v35, 1 * v35, 2.2 * v35, v36 + (0.2 * v35))))
        table.insert(a1.clusters, {offset = -v32 + ((v33 + 0.5) * (a7 / a2)), z = a5, factor = a6, halfLoop = v32, loopSpan = a7, idleDrift = a8, parts = tbl_6})
    end
end
u2.makeCloudPart = function(a1, a2, a3, a4, a5)
    --[[
      name: makeCloudPart
      line: 385
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        DINO_STYLE_upv_1 (copy, index: 2)
    ]]
    local v37 = makeSmoothPart_upv_1(a1.container)
    v37.Size = Vector3.new(a2, a3, 0.8)
    v37.Transparency = DINO_STYLE_upv_1.clouds.transparency
    a1.palette:register("cloud", v37)
    local tbl_7 = {}
    tbl_7.part = v37
    tbl_7.localX = a4
    tbl_7.localY = a5
    return tbl_7
end
u2.buildSoil = function(a1)
    --[[
      name: buildSoil
      line: 396
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        DINO_STYLE_upv_1 (copy, index: 2)
        DINO_RUN_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v38 = makeStagePart_upv_1(a1.container)
    v38.Size = Vector3.new(DINO_STYLE_upv_1.soil.width, DINO_STYLE_upv_1.soil.height, DINO_STYLE_upv_1.soil.depth)
    v38.CFrame = CFrame.new(a1.origin + Vector3.new(0, (DINO_RUN_CONFIG_upv_1.groundY - 0.1) - (DINO_STYLE_upv_1.soil.height / 2), (DINO_STYLE_upv_1.soil.depth / 2) - 2.5))
    a1.palette:register("groundSoil", v38)
end
u2.buildGroundDetail = function(a1)
    --[[
      name: buildGroundDetail
      line: 406
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        DINO_RUN_CONFIG_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
    ]]
    local groundDetail_1 = DINO_STYLE_upv_1.groundDetail
    local v39 = DINO_STYLE_upv_1.loop.groundDetail / 2
    local v40 = DINO_STYLE_upv_1.loop.groundDetail / (groundDetail_1.pebbleCount + groundDetail_1.crackCount)
    local v41 = 0
    for _ = 0, groundDetail_1.pebbleCount - 1 do
        local v42 = a1.random:NextNumber(groundDetail_1.pebbleSizeMin, groundDetail_1.pebbleSizeMax)
        local v43 = makeStagePart_upv_1(a1.container)
        v43.Size = Vector3.new(v42, v42, v42)
        a1.palette:register("detail", v43)
        table.insert(a1.clusters, (a1:makeDetailCluster(v43, v41, v40, v39, DINO_RUN_CONFIG_upv_1.groundY + (v42 / 2), DINO_STYLE_upv_1.z.pebble)))
        v41 = v41 + 1
    end
    for _ = 0, groundDetail_1.crackCount - 1 do
        local v44 = a1.random:NextNumber(groundDetail_1.crackLengthMin, groundDetail_1.crackLengthMax)
        local v45 = makeSmoothPart_upv_1(a1.container)
        v45.Size = Vector3.new(v44, groundDetail_1.crackHeight, 0.12)
        a1.palette:register("detail", v45)
        table.insert(a1.clusters, (a1:makeDetailCluster(v45, v41, v40, v39, DINO_RUN_CONFIG_upv_1.groundY - a1.random:NextNumber(0.6, 2.2), DINO_STYLE_upv_1.z.crackFace)))
        v41 = v41 + 1
    end
end
u2.makeDetailCluster = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: makeDetailCluster
      line: 434
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    local tbl_8 = {}
    tbl_8.offset = -a5 + ((a3 + 0.5) * a4)
    tbl_8.z = a7
    tbl_8.halfLoop = a5
    tbl_8.loopSpan = DINO_STYLE_upv_1.loop.groundDetail
    tbl_8.parts = {{part = a2, localY = a6}}
    return tbl_8
end
u2.buildShootingStar = function(a1)
    --[[
      name: buildShootingStar
      line: 449
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        DINO_STYLE_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v46 = makeSmoothPart_upv_1(a1.container)
    v46.Material = Enum.Material.Neon
    v46.Color = DINO_STYLE_upv_1.moon.color
    v46.Size = Vector3.new(DINO_STYLE_upv_1.shootingStar.length, DINO_STYLE_upv_1.shootingStar.thickness, 0.2)
    v46.Transparency = 1
    v46.CFrame = u1
    return v46
end
u2.advanceShootingStar = function(a1, a2, a3)
    --[[
      name: advanceShootingStar
      line: 458
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    if a1.shootRemaining <= 0 then
        if a3 >= 0.9 then
            a1.shootTimer = a1.shootTimer - a2
            if a1.shootTimer <= 0 then
                a1.shootTimer = a1.random:NextNumber(DINO_STYLE_upv_1.shootingStar.intervalMin, DINO_STYLE_upv_1.shootingStar.intervalMax)
                a1.shootRemaining = DINO_STYLE_upv_1.shootingStar.sweepSeconds
                a1.shootStartX = a1.random:NextNumber(DINO_STYLE_upv_1.shootingStar.xMin, DINO_STYLE_upv_1.shootingStar.xMax)
                a1.shootStartY = a1.random:NextNumber(DINO_STYLE_upv_1.shootingStar.yMin, DINO_STYLE_upv_1.shootingStar.yMax)
            else
                return nil
            end
        else
            return nil
        end
    else
        a1.shootRemaining = a1.shootRemaining - a2
        if a1.shootRemaining > 0 then
            local v47 = 1 - a1.shootRemaining / DINO_STYLE_upv_1.shootingStar.sweepSeconds
            a1.shootingStar.Transparency = 1 - math.sin(v47 * math.pi)
            a1.shootingStar.CFrame = CFrame.new(a1.origin + Vector3.new(a1.shootStartX + (DINO_STYLE_upv_1.shootingStar.travelStuds * v47), a1.shootStartY - ((DINO_STYLE_upv_1.shootingStar.travelStuds * 0.5) * v47), DINO_STYLE_upv_1.z.stars)) * CFrame.Angles(0, 0, -DINO_STYLE_upv_1.shootingStar.angleRadians)
        else
            a1:parkShootingStar()
        end
        return nil
    end
end
u2.parkShootingStar = function(a1)
    --[[
      name: parkShootingStar
      line: 490
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.shootRemaining = 0
    a1.shootingStar.Transparency = 1
    a1.shootingStar.CFrame = u1
end
u2.buildDust = function(a1)
    --[[
      name: buildDust
      line: 495
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 3)
        DINO_STYLE_upv_1 (copy, index: 4)
    ]]
    local v48 = makeSmoothPart_upv_1(a1.container)
    v48.Transparency = 1
    v48.Size = Vector3.new(1.399999976158142, 0.30000001192092896, 0.6000000238418579)
    v48.CFrame = u1
    local v49 = Instance.new("ParticleEmitter")
    v49.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v49.Rate = 0
    v49.Lifetime = NumberRange.new(DINO_STYLE_upv_1.dust.lifetimeMin, DINO_STYLE_upv_1.dust.lifetimeMax)
    v49.Speed = NumberRange.new(DINO_STYLE_upv_1.dust.speedMin, DINO_STYLE_upv_1.dust.speedMax)
    v49.SpreadAngle = Vector2.new(DINO_STYLE_upv_1.dust.spreadAngle, DINO_STYLE_upv_1.dust.spreadAngle)
    v49.EmissionDirection = Enum.NormalId.Top
    v49.Acceleration = Vector3.new(0, DINO_STYLE_upv_1.dust.acceleration, 0)
    v49.Rotation = NumberRange.new(0, 90)
    v49.RotSpeed = NumberRange.new(-160, 160)
    v49.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, DINO_STYLE_upv_1.dust.sizeStart), NumberSequenceKeypoint.new(1, DINO_STYLE_upv_1.dust.sizeEnd)})
    v49.Color = ColorSequence.new(a1.palette:color("ink"))
    v49.Parent = v48
    return {v48, v49}
end
local tbl_9 = {}
tbl_9.DinoScenery = u2
return tbl_9