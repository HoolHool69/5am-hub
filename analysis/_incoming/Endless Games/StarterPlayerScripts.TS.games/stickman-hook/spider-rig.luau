-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local signedAngleDiff_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "rotating-target").signedAngleDiff
local SilkRope_upv_1 = RuntimeLib_1.import(script, script.Parent, "silk-rope").SilkRope
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(250, 250, 252)
local u3 = Color3.fromRGB(226, 74, 60)
local u4 = Color3.fromRGB(196, 48, 38)
local u5 = Color3.fromRGB(150, 40, 32)
local u6 = Color3.fromRGB(140, 28, 24)
local u7 = Color3.fromRGB(104, 26, 22)
local u8 = Color3.fromRGB(24, 24, 28)
local u9 = Color3.fromRGB(255, 255, 255)
local u10 = Color3.fromRGB(240, 238, 230)
local u11 = Color3.fromRGB(96, 34, 34)
local u12 = Color3.fromRGB(255, 150, 70)
local tbl_upv_1 = {CFrame.new(-0.25, -0.36, 0.73), CFrame.new(0.25, -0.36, 0.73)}
local u13 = CFrame.new(-0.055, 0.075, 0.07)
local u14 = CFrame.new(0, -0.475, 0)
local u15 = CFrame.new(0, -0.95, 0)
local u16 = CFrame.new(0, -0.575, 0)
local u17 = CFrame.new(0, 1.34, -0.2)
local tbl_upv_2 = {0.3, 0.1, -0.1, -0.3}
local tbl_upv_3 = {-0.34, -0.12, 0.12, 0.34}
local tbl_upv_4 = {CFrame.new(-0.25, -0.36, 0.73) * CFrame.Angles(0, 0, 0.5), CFrame.new(0.25, -0.36, 0.73) * CFrame.Angles(0, 0, -0.5)}
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 265
    ]]
    return "SpiderRig"
end
local u18 = setmetatable(tbl_5, tbl_6)
u18.__index = u18
u18.new = function(...)
    --[[
      name: new
      line: 270
      upvalues:
        u18 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u18)
    return v2:constructor(...) or v2
end
u18.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 274
      upvalues:
        u1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u4 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u6 (copy, index: 5)
        u3 (copy, index: 6)
        u8 (copy, index: 7)
        u2 (copy, index: 8)
        u9 (copy, index: 9)
        u5 (copy, index: 10)
        u7 (copy, index: 11)
        SilkRope_upv_1 (copy, index: 12)
        u10 (copy, index: 13)
        u11 (copy, index: 14)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 15)
        u12 (copy, index: 16)
    ]]
    a1.pieces = {}
    a1.legs = {}
    a1.eyeWhites = {}
    a1.pupils = {}
    a1.shines = {}
    a1.attachBlend = 0
    a1.hangAngle = 0
    a1.hangVelocity = 0
    a1.hangCatchEase = 1
    a1.tumbleAngle = 0
    a1.tumbleOmega = 0
    a1.pulse = 0
    a1.pupilX = 0
    a1.pupilY = 0
    a1.shootProgress = 1
    a1.sagSmoothed = 0
    a1.blinkClosed = false
    a1.blinkSuppress = 0
    a1.trailActive = false
    a1.trailLifetime = 0
    a1.lastLookX = 0
    a1.lastLookY = -1
    a1.dead = false
    a1.deathClock = 0
    a1.deathX = 0
    a1.deathY = 0
    a1.deathRoll = 0
    a1.squashed = false
    a1.originX = a3.X
    a1.originY = a3.Y
    a1.originZ = a3.Z
    local v3 = makeStagePart_upv_1(a2)
    v3.CFrame = u1
    table.insert(a1.pieces, {part = v3, offset = CFrame.new(0, 0.48, -0.06)})
    a1.abdomen = v3
    a1.abdomen.Color = u4
    a1.abdomen.Size = Vector3.new(1.7200000286102295, 1.4199999570846558, 1.5)
    local v4 = makeSmoothPart_upv_1(a2)
    v4.CFrame = u1
    table.insert(a1.pieces, {part = v4, offset = CFrame.new(0, 0.62, 0.71)})
    v4.Color = u6
    v4.Size = Vector3.new(0.5, 1.0499999523162842, 0.11999999731779099)
    local v5 = makeSmoothPart_upv_1(a2)
    v5.CFrame = u1
    table.insert(a1.pieces, {part = v5, offset = CFrame.new(0, 1.24, -0.2)})
    v5.Color = u6
    v5.Size = Vector3.new(0.30000001192092896, 0.23999999463558197, 0.3199999928474426)
    local v6 = makeSmoothPart_upv_1(a2)
    v6.CFrame = u1
    table.insert(a1.pieces, {part = v6, offset = CFrame.new(0, -0.44, 0.14)})
    a1.head = v6
    a1.head.Color = u3
    a1.head.Size = Vector3.new(1.2200000286102295, 1.0199999809265137, 1.2799999713897705)
    for n_1 = 0, 1 do
        local v7 = ((n_1 ~= 0) and 1) or -1
        local v8 = makeSmoothPart_upv_1(a2)
        v8.CFrame = u1
        table.insert(a1.pieces, {part = v8, offset = CFrame.new(v7 * 0.2, -0.92, 0.62)})
        v8.Color = u6
        v8.Size = Vector3.new(0.25999999046325684, 0.3400000035762787, 0.4399999976158142)
        local v9 = makeSmoothPart_upv_1(a2)
        v9.CFrame = u1
        table.insert(a1.pieces, {part = v9, offset = CFrame.new(v7 * 0.5, -0.7, 0.75)})
        v9.Color = u8
        v9.Size = Vector3.new(0.1599999964237213, 0.18000000715255737, 0.10000000149011612)
        local v10 = makeSmoothPart_upv_1(a2)
        v10.Color = u2
        v10.Size = Vector3.new(0.4399999976158142, 0.5199999809265137, 0.1599999964237213)
        v10.CFrame = u1
        table.insert(a1.eyeWhites, v10)
        local v11 = makeSmoothPart_upv_1(a2)
        v11.Color = u8
        v11.Size = Vector3.new(0.2199999988079071, 0.2800000011920929, 0.10000000149011612)
        v11.CFrame = u1
        table.insert(a1.pupils, v11)
        local v12 = makeSmoothPart_upv_1(a2)
        v12.Color = u9
        v12.Size = Vector3.new(0.09000000357627869, 0.09000000357627869, 0.07999999821186066)
        v12.CFrame = u1
        table.insert(a1.shines, v12)
    end
    local v18 = nil
    for n_2 = 0, 7 do
        local v7 = ((n_2 >= 4) and 1) or -1
        local v13 = n_2 % 4
        local v14 = makeSmoothPart_upv_1(a2)
        v14.Color = u5
        v14.Size = Vector3.new(0.25999999046325684, 0.949999988079071, 0.25999999046325684)
        v14.CFrame = u1
        local v15 = makeSmoothPart_upv_1(a2)
        v15.Color = u7
        v15.Size = Vector3.new(0.20000000298023224, 1.149999976158142, 0.20000000298023224)
        v15.CFrame = u1
        local legs_1 = a1.legs
        local tbl_7 = {}
        tbl_7.femur = v14
        tbl_7.tibia = v15
        tbl_7.hip = CFrame.new(v7 * 0.56, (v13 * 0.2) + -0.74, 0.34 - (v13 * 0.24))
        tbl_7.side = v7
        tbl_7.rank = v13
        local v16 = v13 * 2.45
        if v7 <= 0 then
            v18 = 0
        else
            v18 = math.pi
        end
        tbl_7.phase = v16 + v18
        table.insert(legs_1, tbl_7)
    end
    a1.silk = SilkRope_upv_1.new(a2, u10)
    v18 = Instance.new("Attachment")
    v18.Position = Vector3.new(-0.6200000047683716, 0.41999998688697815, -0.25)
    v18.Parent = a1.abdomen
    local v19 = Instance.new("Attachment")
    v19.Position = Vector3.new(0.6200000047683716, 0.41999998688697815, -0.25)
    v19.Parent = a1.abdomen
    a1.trail = Instance.new("Trail")
    a1.trail.Attachment0 = v18
    a1.trail.Attachment1 = v19
    a1.trail.WidthScale = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.35, 0.72), NumberSequenceKeypoint.new(1, 0)})
    local tbl_8 = {ColorSequenceKeypoint.new(0, u4), ColorSequenceKeypoint.new(0.5, u6), ColorSequenceKeypoint.new(1, u11)}
    a1.trail.Color = ColorSequence.new(tbl_8)
    local tbl_9 = {NumberSequenceKeypoint.new(0, 0.28), NumberSequenceKeypoint.new(0.55, 0.6), NumberSequenceKeypoint.new(1, 1)}
    a1.trail.Transparency = NumberSequence.new(tbl_9)
    a1.trail.Lifetime = 0.2
    a1.trail.FaceCamera = true
    a1.trail.Enabled = false
    a1.trail.Parent = a1.abdomen
    a1.embers = Instance.new("ParticleEmitter")
    a1.embers.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.embers.Rate = 0
    a1.embers.Enabled = false
    a1.embers.Lifetime = NumberRange.new(0.4, 0.8)
    a1.embers.Speed = NumberRange.new(8, 16)
    a1.embers.SpreadAngle = Vector2.new(180, 180)
    a1.embers.Acceleration = Vector3.new(0, -50, 0)
    a1.embers.Size = NumberSequence.new(0.35, 0.05)
    a1.embers.Color = ColorSequence.new(u12, u6)
    a1.embers.Transparency = NumberSequence.new(0.1, 1)
    a1.embers.LightEmission = 0
    a1.embers.Parent = a1.abdomen
end
u18.onCatch = function(a1)
    --[[
      name: onCatch
      line: 417
    ]]
    a1.shootProgress = 0
    a1.pulse = -1
    a1.attachBlend = math.min(a1.attachBlend + 0.55, 1)
    a1.blinkSuppress = 0.35
    a1.hangCatchEase = 0
end
u18.onRelease = function(a1, a2, a3)
    --[[
      name: onRelease
      line: 425
    ]]
    a1.tumbleAngle = a3
    a1.hangAngle = a3
    a1.tumbleOmega = math.clamp(a2 * 5.6, -15, 15)
    a1.pulse = 1
    a1.shootProgress = 1
end
u18.setDead = function(a1, a2)
    --[[
      name: setDead
      line: 432
    ]]
    if a2 ~= a1.dead then
        a1.dead = a2
        a1.deathClock = 0
        if a2 then
            a1.silk:park()
            a1.pulse = -1
            a1.trail.Enabled = false
            a1.trailActive = false
            a1.embers:Emit(14)
        else
            return nil
        end
    else
        return nil
    end
end
u18.snapPose = function(a1, a2, a3)
    --[[
      name: snapPose
      line: 447
    ]]
    a1.attachBlend = (a3 and 1) or 0
    a1.hangAngle = a2
    a1.hangVelocity = 0
    a1.hangCatchEase = 1
    a1.tumbleAngle = a2
    a1.tumbleOmega = 0
    a1.pulse = 0
    a1.pupilX = 0
    a1.pupilY = 0
    a1.shootProgress = 1
    a1.sagSmoothed = 0
    a1.blinkSuppress = 0
    a1.trailActive = false
    a1.trail.Enabled = false
    a1.lastLookX = 0
    a1.lastLookY = -1
    a1.dead = false
    a1.deathClock = 0
end
u18.pose = function(a1, a2)
    --[[
      name: pose
      line: 467
    ]]
    local deltaTime_1 = a2.deltaTime
    if a1.dead then
        a1:poseDead(deltaTime_1, a2.simClock)
        return nil
    else
        local v20
        if a2.attached then
            v20 = a1:stepHang(a2, deltaTime_1)
        else
            v20 = a1:stepTumble(a2, deltaTime_1)
        end
        a1.deathX = a2.x
        a1.deathY = a2.y
        a1.deathRoll = v20
        if a1.shootProgress < 1 then
            a1.shootProgress = math.min(a1.shootProgress + (deltaTime_1 / 0.07), 1)
        end
        a1.attachBlend = a1.attachBlend + (((((not (a2.attached)) and 0) or (a1.shootProgress)) - a1.attachBlend) * math.min(deltaTime_1 * 12, 1))
        a1.pulse = a1.pulse - (a1.pulse * math.min(deltaTime_1 * 9, 1))
        local v21 = CFrame.new(a1.originX + a2.x, a1.originY + a2.y, a1.originZ) * CFrame.Angles(0, 0, v20)
        a1:applySquash()
        for _, value_1 in a1.pieces do
            value_1.part.CFrame = v21 * value_1.offset
        end
        a1:poseFace(v21, a2, v20, deltaTime_1)
        a1:poseLegs(v21, a2.simClock, a2.speed, 0)
        a1:poseSilk(a2)
        a1:stepTrail(a2.speed, a2.attached)
    end
end
u18.park = function(a1)
    --[[
      name: park
      line: 496
      upvalues:
        u1 (copy, index: 1)
    ]]
    local _ = nil
    local v1 = nil
    for v2, value_2 in a1.pieces do
        value_2.part.CFrame = u1
    end
    local v3 = nil
    local v4 = nil
    for v5, value_3 in a1.legs do
        value_3.femur.CFrame = u1
        value_3.tibia.CFrame = u1
    end
    local v6 = nil
    local v7 = nil
    for v8, value_4 in a1.eyeWhites do
        value_4.CFrame = u1
    end
    local v9 = nil
    local v10 = nil
    for v11, value_5 in a1.pupils do
        value_5.CFrame = u1
    end
    for v12, value_6 in a1.shines do
        value_6.CFrame = u1
    end
    a1.silk:park()
    a1.trail.Enabled = false
    a1.trailActive = false
end
u18.destroy = function(a1)
    --[[
      name: destroy
      line: 517
    ]]
    a1.trail.Enabled = false
    a1.embers.Enabled = false
    a1:park()
end
u18.stepHang = function(a1, a2, a3)
    --[[
      name: stepHang
      line: 522
      upvalues:
        signedAngleDiff_upv_1 (copy, index: 1)
    ]]
    local ropeAngle_1 = a2.ropeAngle
    a1.hangVelocity = a1.hangVelocity + ((signedAngleDiff_upv_1(a1.hangAngle, ropeAngle_1) * 260) * a3)
    a1.hangVelocity = a1.hangVelocity * (1 - math.min(17 * a3, 1))
    a1.hangAngle = a1.hangAngle + (a1.hangVelocity * a3)
    a1.hangCatchEase = a1.hangCatchEase + ((1 - a1.hangCatchEase) * math.min(a3 * 6, 1))
    local v22 = 0.42 + 2.721592653589793 * (1 - a1.hangCatchEase)
    a1.hangAngle = ropeAngle_1 - math.clamp(signedAngleDiff_upv_1(a1.hangAngle, ropeAngle_1), -v22, v22)
    a1.tumbleAngle = a1.hangAngle
    a1.tumbleOmega = 0
    return a1.hangAngle
end
u18.stepTumble = function(a1, a2, a3)
    --[[
      name: stepTumble
      line: 537
      upvalues:
        signedAngleDiff_upv_1 (copy, index: 1)
    ]]
    if math.abs(a1.tumbleOmega) <= 3 then
        a1.tumbleOmega = a1.tumbleOmega + ((signedAngleDiff_upv_1(a1.tumbleAngle, math.atan2(a2.velocityX, -a2.velocityY)) * 12) * a3)
        a1.tumbleOmega = a1.tumbleOmega * (1 - math.min(4.5 * a3, 1))
    else
        a1.tumbleOmega = a1.tumbleOmega * (1 - math.min(1.7 * a3, 1))
    end
    a1.tumbleAngle = a1.tumbleAngle + (a1.tumbleOmega * a3)
    a1.hangAngle = a1.tumbleAngle
    a1.hangVelocity = a1.tumbleOmega
    return a1.tumbleAngle
end
u18.applySquash = function(a1)
    --[[
      name: applySquash
      line: 557
    ]]
    if math.abs(a1.pulse) >= 0.01 then
        a1.squashed = true
        local v23 = a1.pulse * 0.16
        local v24 = 1 + v23
        local v25 = 1 - v23 * 0.55
        a1.abdomen.Size = Vector3.new(1.7200000286102295 * v25, 1.4199999570846558 * v24, 1.5 * v25)
        a1.head.Size = Vector3.new(1.2200000286102295 * v25, 1.0199999809265137 * v24, 1.2799999713897705 * v25)
    else
        if a1.squashed then
            a1.squashed = false
            a1.abdomen.Size = Vector3.new(1.7200000286102295, 1.4199999570846558, 1.5)
            a1.head.Size = Vector3.new(1.2200000286102295, 1.0199999809265137, 1.2799999713897705)
        end
        return nil
    end
end
u18.poseFace = function(a1, a2, a3, a4, a5)
    --[[
      name: poseFace
      line: 574
      upvalues:
        tbl_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
    ]]
    if a1.blinkSuppress > 0 then
        a1.blinkSuppress = a1.blinkSuppress - a5
    end
    local v26 = false
    if a1.blinkSuppress <= 0 then
        v26 = a1:isBlinking(a3.simClock)
    end
    if v26 ~= a1.blinkClosed then
        a1.blinkClosed = v26
        for _, value_7 in a1.eyeWhites do
            value_7.Size = (v26 and Vector3.new(0.47999998927116394, 0.09000000357627869, 0.1599999964237213)) or Vector3.new(0.4399999976158142, 0.5199999809265137, 0.1599999964237213)
        end
        for _, value_8 in a1.pupils do
            value_8.Transparency = (v26 and 1) or 0
        end
        for _, value_9 in a1.shines do
            value_9.Transparency = (v26 and 1) or 0
        end
    end
    a1:trackPupils(a3, a4, a5)
    for n_3 = 0, 1 do
        local v27 = a2 * tbl_upv_1[n_3 + 1]
        a1.eyeWhites[n_3 + 1].CFrame = v27
        if not (v26) then
            local v28 = v27 * CFrame.new(a1.pupilX, a1.pupilY, 0.1)
            a1.pupils[n_3 + 1].CFrame = v28
            a1.shines[n_3 + 1].CFrame = v28 * u13
        end
    end
end
u18.isBlinking = function(a1, a2)
    --[[
      name: isBlinking
      line: 608
    ]]
    local v29 = a2 % 3.1
    if v29 >= 0.11 then
        local v30 = math.sin(a2 * 0.21) > 0
        local v31
        if v30 then
            v31 = false
            if v29 > 0.26 then
                v31 = v29 < 0.337
            end
        else
            v31 = v30
        end
        return v31
    end
    return true
end
u18.trackPupils = function(a1, a2, a3, a4)
    --[[
      name: trackPupils
      line: 616
    ]]
    local v32 = a2.lookX
    local v33 = a2.lookY
    local v34 = math.sqrt((v32 * v32) + (v33 * v33))
    if v34 >= 0.001 then
        v32 = v32 / v34
        v33 = v33 / v34
        a1.lastLookX = v32
        a1.lastLookY = v33
    else
        v32, v33 = a1.lastLookX, a1.lastLookY
    end
    local v35 = math.cos(a3)
    local v36 = math.sin(a3)
    local v37 = math.clamp((((v32 * v35) + (v33 * v36)) * 0.13) * 8, -0.1, 0.1)
    local v38 = math.clamp((((-v32 * v36) + (v33 * v35)) * 0.15) * 8, -0.11, 0.11)
    local v39 = math.min(a4 * 14, 1)
    a1.pupilX = a1.pupilX + ((v37 - a1.pupilX) * v39)
    a1.pupilY = a1.pupilY + ((v38 - a1.pupilY) * v39)
end
u18.poseLegs = function(a1, a2, a3, a4, a5)
    --[[
      name: poseLegs
      line: 639
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        u14 (copy, index: 3)
        u15 (copy, index: 4)
        u16 (copy, index: 5)
    ]]
    local attachBlend_1 = a1.attachBlend
    local v40 = 1 - 0.44999999999999996 * attachBlend_1
    local v41 = math.min(a4 * 0.035, 4) + 5.2
    local v42 = math.min(a4 * 9e-04, 0.13) + 0.1
    local v43 = 1.02 + -0.33999999999999997 * attachBlend_1
    local v44 = 0.86 + -0.44 * attachBlend_1
    local v45, v46, v47, v46, v47 = nil, nil, nil, nil, nil
    local v48 = nil
    local value_10 = nil
    local v49 = nil
    local v50 = nil
    local v51 = nil
    for _, value_10 in a1.legs do
        if value_10.rank ~= 0 then
            v45 = 0
        else
            v45 = attachBlend_1
        end
        v48 = (1 - (0.85 * v45)) * (1 - a5)
        v49 = a3 * v41 + value_10.phase
        v50 = math.sin(v49) * v42 * v48
        v51 = (math.sin(v49 + 1.05) * v42) * 1.35 * v48
        v46 = v43 + (tbl_upv_2[value_10.rank + 1] * v40) + v50
        v47 = v44 + (tbl_upv_3[value_10.rank + 1] * v40) + v51
        if v45 > 0 then
            v46 = v46 + (0.22 - v46) * v45
            v47 = v47 + (3.62 - v47) * v45
        end
        if a5 > 0 then
            v46 = v46 + (0.2 - v46) * a5
            v47 = v47 + (3.36 - v47) * a5
        end
        local v52 = a2 * value_10.hip * CFrame.Angles(0, 0, math.pi - (value_10.side * v46))
        value_10.femur.CFrame = v52 * u14
        value_10.tibia.CFrame = ((v52 * u15) * CFrame.Angles(0, 0, (value_10.side * (v46 + v47)) - math.pi)) * u16
    end
end
u18.poseSilk = function(a1, a2)
    --[[
      name: poseSilk
      line: 676
      upvalues:
        u17 (copy, index: 1)
    ]]
    if a2.attached then
        local v53 = math.abs(math.cos(a2.swingAngle))
        local v54 = 1 - (1 - a1.shootProgress) * (1 - a1.shootProgress)
        a1.sagSmoothed = a1.sagSmoothed + (((((((0.9 * a2.ropeLength) / 24) / (1 + ((v53 + (((a2.ropeLength * a2.swingVelocity) * a2.swingVelocity) / 95)) * 3))) * v54) * v54) - a1.sagSmoothed) * math.min(a2.deltaTime * 8, 1))
        local v55 = CFrame.new(a1.originX + a2.x, a1.originY + a2.y, a1.originZ) * CFrame.Angles(0, 0, a1.hangAngle) * u17
        a1.silk:pose(a1.originX + a2.anchorX, a1.originY + a2.anchorY, v55.X, v55.Y, a1.originZ + -0.2, a1.sagSmoothed, v54)
    else
        a1.silk:park()
        a1.sagSmoothed = 0
        return nil
    end
end
u18.stepTrail = function(a1, a2, a3)
    --[[
      name: stepTrail
      line: 694
    ]]
    local v56 = not a3
    if v56 then
        if a1.trailActive then
            v56 = a2 > 24
        else
            v56 = a2 > 34
        end
    end
    if v56 ~= a1.trailActive then
        a1.trailActive = v56
        a1.trail.Enabled = v56
    end
    local v57 = nil
    if v56 then
        v57 = math.min(a2 / 900, 0.2) + 0.14
        if math.abs(v57 - a1.trailLifetime) > 0.01 then
            a1.trailLifetime = v57
            a1.trail.Lifetime = v57
        end
    else
        return nil
    end
end
u18.poseDead = function(a1, a2, a3)
    --[[
      name: poseDead
      line: 709
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    a1.deathClock = a1.deathClock + a2
    local v58 = math.min(a1.deathClock / 0.14, 1)
    local v59 = math.min(a1.deathClock / 0.9, 1)
    local v60 = math.min(a1.deathClock / 0.55, 1)
    a1.pulse = a1.pulse - (a1.pulse * math.min(a2 * 9, 1))
    local v61 = CFrame.new(a1.originX + a1.deathX, (a1.originY + a1.deathY) - (v59 * 2.4), a1.originZ + ((1 - v60) * 2.8)) * CFrame.Angles(0, 0, a1.deathRoll + (1.1 * a1.deathClock))
    a1:applySquash()
    for _, value_11 in a1.pieces do
        value_11.part.CFrame = v61 * value_11.offset
    end
    a1:poseLegs(v61, a3, 0, v58)
    if not (a1.blinkClosed) then
        a1.blinkClosed = true
        for _, value_12 in a1.eyeWhites do
            value_12.Size = Vector3.new(0.47999998927116394, 0.09000000357627869, 0.1599999964237213)
        end
        for _, value_13 in a1.pupils do
            value_13.Transparency = 1
        end
        for _, value_14 in a1.shines do
            value_14.Transparency = 1
        end
    end
    a1.eyeWhites[1].CFrame = v61 * tbl_upv_4[1]
    a1.eyeWhites[2].CFrame = v61 * tbl_upv_4[2]
end
local tbl_10 = {}
tbl_10.SpiderRig = u18
return tbl_10