-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local v2 = RuntimeLib_1.import(script, script.Parent, "tower-builder-assets")
local prepareAuthoredCloud_upv_1 = v2.prepareAuthoredCloud
local seatAuthoredDetails_upv_1 = v2.seatAuthoredDetails
local TOWER_BUILDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local tbl_1 = {}
tbl_1.top = Color3.fromRGB(108, 182, 235)
tbl_1.bottom = Color3.fromRGB(196, 220, 240)
local tbl_2 = {}
tbl_2.top = Color3.fromRGB(82, 152, 224)
tbl_2.bottom = Color3.fromRGB(150, 196, 235)
local tbl_3 = {}
tbl_3.top = Color3.fromRGB(44, 92, 178)
tbl_3.bottom = Color3.fromRGB(90, 140, 205)
local tbl_4 = {}
tbl_4.top = Color3.fromRGB(16, 28, 68)
tbl_4.bottom = Color3.fromRGB(40, 62, 120)
local tbl_5 = {}
tbl_5.top = Color3.fromRGB(8, 10, 32)
tbl_5.bottom = Color3.fromRGB(18, 22, 52)
local tbl_6 = {}
tbl_6.top = Color3.fromRGB(3, 4, 12)
tbl_6.bottom = Color3.fromRGB(8, 9, 22)
local tbl_upv_7 = {{top = Color3.fromRGB(128, 198, 240), bottom = Color3.fromRGB(255, 226, 178)}, tbl_1, tbl_2, tbl_3, tbl_4, tbl_5, tbl_6}
local u1 = Color3.fromRGB(128, 132, 140)
local u2 = Color3.fromRGB(64, 66, 74)
local u3 = Color3.fromRGB(40, 48, 66)
local u4 = Color3.fromRGB(255, 214, 130)
local u5 = Color3.fromRGB(245, 248, 252)
local u6 = Color3.fromRGB(235, 238, 250)
local u7 = Color3.fromRGB(226, 224, 210)
local tbl_upv_8 = {Color3.fromRGB(216, 120, 86), Color3.fromRGB(222, 184, 130), Color3.fromRGB(110, 200, 190), Color3.fromRGB(150, 120, 220), Color3.fromRGB(96, 140, 230)}
local tbl_upv_9 = {{}, {}, {}, {}}
local tbl_10 = {}
local tbl_11 = {}
tbl_11.__tostring = function()
    --[[
      name: __tostring
      line: 119
    ]]
    return "TowerBuilderBackdrop"
end
local u8 = setmetatable(tbl_10, tbl_11)
u8.__index = u8
u8.new = function(...)
    --[[
      name: new
      line: 124
      upvalues:
        u8 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u8)
    return v3:constructor(...) or v3
end
u8.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 128
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        markWorldArt_upv_1 (copy, index: 2)
        seatAuthoredDetails_upv_1 (copy, index: 3)
    ]]
    a1.clouds = {}
    a1.stars = {}
    a1.starX = {}
    a1.starY = {}
    a1.random = Random.new()
    a1.origin = a3
    a1.skyFade = a4.skyFade
    a1.zSign = a4.zSign
    a1.planeDepth = -100 * a4.zSign
    a1.cloudDepth = -30 * a4.zSign
    a1.starDepth = -50 * a4.zSign
    a1.spaceArtDepth = -45 * a4.zSign
    a1.plane = makeSmoothPart_upv_1(a2)
    a1.plane.Material = Enum.Material.Neon
    a1.plane.Color = Color3.fromRGB(2, 2, 3)
    a1.plane.Size = Vector3.new(500, 400, 1)
    local v4 = Instance.new("SurfaceGui")
    local v5
    if a4.zSign ~= 1 then
        v5 = Enum.NormalId.Front
    else
        v5 = Enum.NormalId.Back
    end
    v4.Face = v5
    v4.LightInfluence = 0
    v4.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    v4.PixelsPerStud = 1
    markWorldArt_upv_1(v4)
    v4.Parent = a1.plane
    local v6 = Instance.new("Frame")
    v6.Size = UDim2.fromScale(1, 1)
    v6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v6.BorderSizePixel = 0
    v6.Parent = v4
    a1.fill = v6
    a1.gradient = Instance.new("UIGradient")
    a1.gradient.Rotation = 90
    a1.gradient.Parent = v6
    a1:stepGradient(0)
    if a4.details == nil then
        a1:buildGroundLot(a2)
    else
        seatAuthoredDetails_upv_1(a4.details, a2, a3)
    end
    a1:buildClouds(a2, a4.cloudTemplates)
    a1:buildStars(a2)
    a1:buildSpaceArt(a2)
end
local function gradientColorsForFloor_upv_1(a1)
    --[[
      name: gradientColorsForFloor
      line: 89
      upvalues:
        tbl_upv_7 (copy, index: 1)
    ]]
    local v7 = tbl_upv_7[1]
    local v8 = nil
    local tbl_12 = nil
    for _, value_1 in tbl_upv_7 do
        if a1 >= value_1.floor then
            v7 = value_1
            continue
        end
        v8 = (a1 - v7.floor) / math.max(value_1.floor - v7.floor, 1)
        tbl_12 = {}
        tbl_12.top = v7.top:Lerp(value_1.top, v8)
        tbl_12.bottom = v7.bottom:Lerp(value_1.bottom, v8)
        return tbl_12
    end
    local tbl_13 = {}
    tbl_13.top = v7.top
    tbl_13.bottom = v7.bottom
    return tbl_13
end
u8.stepGradient = function(a1, a2)
    --[[
      name: stepGradient
      line: 174
      upvalues:
        gradientColorsForFloor_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v9 = gradientColorsForFloor_upv_1(a2)
    a1.gradient.Color = ColorSequence.new(v9.top, v9.bottom)
    local v10 = ((a1.skyFade) and (1 - math.clamp((a2 - TOWER_BUILDER_CONFIG_upv_1.skyFadeStartFloor) / (TOWER_BUILDER_CONFIG_upv_1.skyFadeEndFloor - TOWER_BUILDER_CONFIG_upv_1.skyFadeStartFloor), 0, 1))) or 0
    a1.plane.Transparency = v10
    a1.fill.BackgroundTransparency = v10
end
u8.update = function(a1, a2, a3)
    --[[
      name: update
      line: 185
    ]]
    a1.plane.CFrame = CFrame.new(a1.origin + Vector3.new(0, a2, a1.planeDepth))
    local value_2 = nil
    local v11 = nil
    for _, value_2 in a1.clouds do
        if math.abs(value_2.y - a2) > 60 then
            continue
        end
        value_2.x = value_2.x + (value_2.speed * a3)
        if value_2.x > 42 then
            value_2.x = -42
        end
        value_2 = value_2
        for n_1 = 0, #value_2.parts - 1 do
            local v12 = value_2.offsets[n_1 + 1]
            local v13
            v13 = a1.origin + Vector3.new(value_2.x + v12.X, value_2.y + v12.Y, a1.cloudDepth + v12.Z)
            v11 = value_2.rotations
            if v11 ~= nil then
                v11 = v11[n_1 + 1]
            end
            local v14 = value_2.parts[n_1 + 1]
            v14.CFrame = v11 ~= nil and CFrame.new(v13) * v11 or CFrame.new(v13)
        end
    end
    if a2 <= 130 then
        return
    end
    for n_2 = 0, #a1.stars - 1 do
        if a1.starY[n_2 + 1] < a2 - 50 then
            a1.starY[n_2 + 1] = (a2 + 50) + a1.random:NextNumber(0, 30)
            a1.starX[n_2 + 1] = a1.random:NextNumber(-46, 46)
            a1.stars[n_2 + 1].CFrame = CFrame.new(a1.origin + Vector3.new(a1.starX[n_2 + 1], a1.starY[n_2 + 1], a1.starDepth))
        end
    end
end
u8.buildGroundLot = function(a1, a2)
    --[[
      name: buildGroundLot
      line: 224
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
        tbl_upv_9 (copy, index: 6)
        u3 (copy, index: 7)
        u4 (copy, index: 8)
    ]]
    local v16 = makeStagePart_upv_1(a2)
    v16.Size = Vector3.new(TOWER_BUILDER_CONFIG_upv_1.blockWidth + 4, 2, TOWER_BUILDER_CONFIG_upv_1.blockDepth + 1)
    v16.Color = u1
    v16.CFrame = CFrame.new(a1.origin + Vector3.new(0, -1, 0))
    local v17 = makeSmoothPart_upv_1(a2)
    v17.Size = Vector3.new(80, 1.600000023841858, 12)
    v17.Color = u2
    v17.CFrame = CFrame.new(a1.origin + Vector3.new(0, -1.2000000476837158, -6))
    local v18 = nil
    local v19 = nil
    local v20 = nil
    local v21 = nil
    for _, value_3 in tbl_upv_9 do
        v18 = makeSmoothPart_upv_1(a2)
        v18.Size = Vector3.new(value_3.width, value_3.height, 6)
        v18.Color = u3
        v18.CFrame = CFrame.new(a1.origin + Vector3.new(value_3.x, value_3.height / 2, -20))
        v19 = 4 + a1.random:NextInteger(0, 2)
        v20 = 0
        v21 = false
        while true do
            if v21 then
                v20 = v20 + 1
            else
                v21 = true
            end
            if v20 >= v19 then
                break
            end
            local v22 = makeSmoothPart_upv_1(a2)
            v22.Material = Enum.Material.Neon
            v22.Color = u4
            v22.Size = Vector3.new(0.800000011920929, 0.800000011920929, 0.20000000298023224)
            v22.CFrame = CFrame.new(a1.origin + Vector3.new(value_3.x + a1.random:NextNumber((-value_3.width / 2) + 1, (value_3.width / 2) - 1), a1.random:NextNumber(2, value_3.height - 2), -16.8))
        end
    end
end
u8.buildClouds = function(a1, a2, a3)
    --[[
      name: buildClouds
      line: 269
      upvalues:
        prepareAuthoredCloud_upv_1 (copy, index: 1)
        makeEllipsoidPart_upv_1 (copy, index: 2)
        u5 (copy, index: 3)
    ]]
    local v23 = false
    if a3 ~= nil then
        v23 = #a3 ~= 0
    end
    local v24 = nil
    for n_3 = 0, 4 do
        local tbl_14 = {}
        local tbl_15 = {}
        v24 = nil
        if v23 then
            if a3 == nil then
                for n_4 = 0, 2 do
                    local v25 = makeEllipsoidPart_upv_1(a2)
                    v25.Color = u5
                    v25.Transparency = 0.12
                    v25.Size = Vector3.new(a1.random:NextNumber(5, 9), a1.random:NextNumber(1.8, 2.8), 3)
                    table.insert(tbl_14, v25)
                    table.insert(tbl_15, (Vector3.new((n_4 - 1) * a1.random:NextNumber(2.4, 3.6), a1.random:NextNumber(-0.7, 0.7), (n_4 * 0.4) * a1.zSign)))
                end
            else
                local v26 = prepareAuthoredCloud_upv_1(a3[n_3 % #a3 + 1], a2)
                table.insert(tbl_14, v26.part)
                table.insert(tbl_15, Vector3.new(0, 0, 0))
                v24 = {v26.rotation}
            end
        else
            for n_4 = 0, 2 do
                local v25 = makeEllipsoidPart_upv_1(a2)
                v25.Color = u5
                v25.Transparency = 0.12
                v25.Size = Vector3.new(a1.random:NextNumber(5, 9), a1.random:NextNumber(1.8, 2.8), 3)
                table.insert(tbl_14, v25)
                table.insert(tbl_15, (Vector3.new((n_4 - 1) * a1.random:NextNumber(2.4, 3.6), a1.random:NextNumber(-0.7, 0.7), (n_4 * 0.4) * a1.zSign)))
            end
        end
        local clouds_1 = a1.clouds
        local tbl_16 = {}
        tbl_16.parts = tbl_14
        tbl_16.offsets = tbl_15
        tbl_16.rotations = v24
        tbl_16.y = ((n_3 * 26) + 80) + a1.random:NextNumber(-8, 8)
        local v27 = a1.random:NextNumber(0.5, 1.4)
        if n_3 % 2 ~= 0 or n_3 % 2 == 0 then
            tbl_16.speed = v27 * -1
            tbl_16.x = a1.random:NextNumber(-30, 30)
            table.insert(clouds_1, tbl_16)
        end
    end
    local value_4 = nil
    for _, value_4 in a1.clouds do
        for n_5 = 0, #value_4.parts - 1 do
            local v28 = value_4.offsets[n_5 + 1]
            local v29
            v29 = a1.origin + Vector3.new(value_4.x + v28.X, value_4.y + v28.Y, a1.cloudDepth + v28.Z)
            local v30
            v30 = value_4.rotations
            if v30 ~= nil then
                v30 = v30[n_5 + 1]
            end
            local v31 = value_4.parts[n_5 + 1]
            v31.CFrame = v30 ~= nil and CFrame.new(v29) * v30 or CFrame.new(v29)
        end
    end
end
u8.buildStars = function(a1, a2)
    --[[
      name: buildStars
      line: 323
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    for n_6 = 0, 59 do
        local v33 = makeSmoothPart_upv_1(a2)
        v33.Material = Enum.Material.Neon
        v33.Color = u6
        v33.Size = Vector3.new(0.3499999940395355, 0.3499999940395355, 0.3499999940395355)
        local v34 = a1.random:NextNumber(-46, 46)
        local v35 = (n_6 * 7) + 190 + a1.random:NextNumber(0, 6)
        v33.CFrame = CFrame.new(a1.origin + Vector3.new(v34, v35, a1.starDepth))
        table.insert(a1.stars, v33)
        table.insert(a1.starX, v34)
        table.insert(a1.starY, v35)
    end
end
u8.buildSpaceArt = function(a1, a2)
    --[[
      name: buildSpaceArt
      line: 342
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 3)
        tbl_upv_8 (copy, index: 4)
    ]]
    local v36 = CFrame.Angles(0, 1.5707963267948966, 0)
    local v37 = makeSmoothPart_upv_1(a2)
    v37.Shape = Enum.PartType.Cylinder
    v37.Color = u7
    v37.Size = Vector3.new(1.2000000476837158, 14, 14)
    v37.CFrame = CFrame.new(a1.origin + Vector3.new(18, TOWER_BUILDER_CONFIG_upv_1.moonFloor * TOWER_BUILDER_CONFIG_upv_1.blockHeight, a1.spaceArtDepth)) * v36
    for n_7 = 0, #tbl_upv_8 - 1 do
        local v38 = makeSmoothPart_upv_1(a2)
        v38.Shape = Enum.PartType.Cylinder
        v38.Color = tbl_upv_8[n_7 + 1]
        local v39 = (n_7 % 3) * 2 + 8
        v38.Size = Vector3.new(1.2, v39, v39)
        v38.CFrame = CFrame.new(a1.origin + Vector3.new(((n_7 % 2 ~= 0) and 20) or -20, (TOWER_BUILDER_CONFIG_upv_1.moonFloor + ((n_7 + 1) * TOWER_BUILDER_CONFIG_upv_1.planetSpacingFloors)) * TOWER_BUILDER_CONFIG_upv_1.blockHeight, a1.spaceArtDepth)) * v36
    end
end
local tbl_17 = {}
tbl_17.gradientColorsForFloor = gradientColorsForFloor_upv_1
tbl_17.TowerBuilderBackdrop = u8
return tbl_17