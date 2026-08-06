-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local DINO_STYLE_1 = RuntimeLib_1.import(script, script.Parent, "dino-run-style").DINO_STYLE
local bobAmplitude_upv_1 = DINO_STYLE_1.bobAmplitude
local depth_upv_1 = DINO_STYLE_1.landingSquash.depth
local function poseDuck(a1, a2, a3)
    --[[
      name: poseDuck
      line: 145
    ]]
    a1.torsoLower.CFrame = CFrame.new(a2 + Vector3.new(-0.10000000149011612, 1.350000023841858, 0)) * CFrame.Angles(0, 0, -0.3839724354387525)
    a1.torsoUpper.CFrame = CFrame.new(a2 + Vector3.new(0.8999999761581421, 1.600000023841858, 0)) * CFrame.Angles(0, 0, -0.24434609527920614)
    a1.neck.CFrame = CFrame.new(a2 + Vector3.new(1.7000000476837158, 1.75, 0)) * CFrame.Angles(0, 0, -1.2217304763960306)
    a1.head.CFrame = CFrame.new(a2 + Vector3.new(2.1500000953674316, 1.850000023841858, 0))
    a1.jaw.CFrame = CFrame.new(a2 + Vector3.new(2.3499999046325684, 1.5, 0))
    a1.brow.CFrame = CFrame.new(a2 + Vector3.new(2.4000000953674316, 2.299999952316284, 0))
    a1.eyeWhite.CFrame = CFrame.new(a2 + Vector3.new(2.4000000953674316, 2.049999952316284, 0.7799999713897705))
    a1.pupil.CFrame = CFrame.new(a2 + Vector3.new(2.4800000190734863, 2.049999952316284, 0.949999988079071))
    a1.armNear.CFrame = CFrame.new(a2 + Vector3.new(1.5, 1.0499999523162842, 0.5))
    a1.armFar.CFrame = CFrame.new(a2 + Vector3.new(1.5, 1.0499999523162842, -0.5))
    a1.tailBase.CFrame = CFrame.new(a2 + Vector3.new(-1.7000000476837158, 1.899999976158142, 0)) * CFrame.Angles(0, 0, 0.5235987755982988 + a3)
    a1.tailTip.CFrame = CFrame.new(a2 + Vector3.new(-2.8499999046325684, 2.4000000953674316, 0)) * CFrame.Angles(0, 0, 0.8028514559173916 + (a3 * 1.4))
end
local function poseLegs(a1, a2, a3, a4)
    --[[
      name: poseLegs
      line: 193
    ]]
    if a4 then
        a1.legLeft.CFrame = CFrame.new(a2 + Vector3.new(-0.25, 1, 0.3499999940395355)) * CFrame.Angles(0, 0, 0.4886921905584123)
        a1.legRight.CFrame = CFrame.new(a2 + Vector3.new(0.25, 1, -0.3499999940395355)) * CFrame.Angles(0, 0, 0.4886921905584123)
        a1.footLeft.CFrame = CFrame.new(a2 + Vector3.new(-0.05000000074505806, 0.3499999940395355, 0.3499999940395355))
        a1.footRight.CFrame = CFrame.new(a2 + Vector3.new(0.44999998807907104, 0.3499999940395355, -0.3499999940395355))
        return nil
    end
    if a3 == 0 then
        a1.legLeft.CFrame = CFrame.new(a2 + Vector3.new(0.25, 1.0499999523162842, 0.3499999940395355)) * CFrame.Angles(0, 0, 0.3490658503988659)
        a1.footLeft.CFrame = CFrame.new(a2 + Vector3.new(0.4000000059604645, 0.4000000059604645, 0.3499999940395355))
        a1.legRight.CFrame = CFrame.new(a2 + Vector3.new(-0.30000001192092896, 0.8999999761581421, -0.3499999940395355))
        a1.footRight.CFrame = CFrame.new(a2 + Vector3.new(-0.30000001192092896, 0.18000000715255737, -0.3499999940395355))
        return nil
    end
    a1.legRight.CFrame = CFrame.new(a2 + Vector3.new(0.25, 1.0499999523162842, -0.3499999940395355)) * CFrame.Angles(0, 0, 0.3490658503988659)
    a1.footRight.CFrame = CFrame.new(a2 + Vector3.new(0.4000000059604645, 0.4000000059604645, -0.3499999940395355))
    a1.legLeft.CFrame = CFrame.new(a2 + Vector3.new(-0.30000001192092896, 0.8999999761581421, 0.3499999940395355))
    a1.footLeft.CFrame = CFrame.new(a2 + Vector3.new(-0.30000001192092896, 0.18000000715255737, 0.3499999940395355))
end
local tbl_1 = {}
tbl_1.buildDinoRig = function(a1)
    --[[
      name: buildDinoRig
      line: 23
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
    ]]
    local v2 = makeStagePart_upv_1(a1)
    v2.Size = Vector3.new(0.8999999761581421, 0.3499999940395355, 0.75)
    local v3 = makeStagePart_upv_1(a1)
    v3.Size = Vector3.new(0.8999999761581421, 0.3499999940395355, 0.75)
    local v4 = makeStagePart_upv_1(a1)
    v4.Size = Vector3.new(0.6000000238418579, 1.100000023841858, 0.6000000238418579)
    local v5 = makeStagePart_upv_1(a1)
    v5.Size = Vector3.new(0.6000000238418579, 1.100000023841858, 0.6000000238418579)
    local v6 = makeStagePart_upv_1(a1)
    v6.Size = Vector3.new(2.700000047683716, 1.5, 1.7999999523162842)
    local v7 = makeStagePart_upv_1(a1)
    v7.Size = Vector3.new(2.0999999046325684, 1.2000000476837158, 1.600000023841858)
    local v8 = makeStagePart_upv_1(a1)
    v8.Size = Vector3.new(0.8999999761581421, 1.100000023841858, 1)
    local v9 = makeStagePart_upv_1(a1)
    v9.Size = Vector3.new(1.899999976158142, 1.2999999523162842, 1.5)
    local v10 = makeStagePart_upv_1(a1)
    v10.Size = Vector3.new(1, 0.4000000059604645, 1.2999999523162842)
    local v11 = makeStagePart_upv_1(a1)
    v11.Size = Vector3.new(0.5, 0.25, 1.5499999523162842)
    local v12 = makeSmoothPart_upv_1(a1)
    v12.Size = Vector3.new(0.41999998688697815, 0.41999998688697815, 0.41999998688697815)
    local v13 = makeSmoothPart_upv_1(a1)
    v13.Size = Vector3.new(0.2199999988079071, 0.2199999988079071, 0.2199999988079071)
    local v14 = makeStagePart_upv_1(a1)
    v14.Size = Vector3.new(0.6499999761581421, 0.3499999940395355, 0.5)
    local v15 = makeStagePart_upv_1(a1)
    v15.Size = Vector3.new(0.6499999761581421, 0.3499999940395355, 0.5)
    local v16 = makeStagePart_upv_1(a1)
    v16.Size = Vector3.new(1.399999976158142, 0.8999999761581421, 1.2000000476837158)
    local v17 = makeStagePart_upv_1(a1)
    v17.Size = Vector3.new(1, 0.6000000238418579, 0.8999999761581421)
    local tbl_2 = {v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17}
    local tbl_3 = {v12}
    local tbl_4 = {}
    local v18 = #tbl_4
    local v19 = #tbl_2
    table.move(tbl_2, 1, v19, v18 + 1, tbl_4)
    tbl_4[(v18 + v19) + 1] = v12
    local tbl_5 = {}
    tbl_5.footLeft = v2
    tbl_5.footRight = v3
    tbl_5.legLeft = v4
    tbl_5.legRight = v5
    tbl_5.torsoLower = v6
    tbl_5.torsoUpper = v7
    tbl_5.neck = v8
    tbl_5.head = v9
    tbl_5.jaw = v10
    tbl_5.brow = v11
    tbl_5.eyeWhite = v12
    tbl_5.pupil = v13
    tbl_5.armNear = v14
    tbl_5.armFar = v15
    tbl_5.tailBase = v16
    tbl_5.tailTip = v17
    tbl_5.inkParts = tbl_2
    tbl_5.inverseParts = tbl_3
    tbl_5.allParts = tbl_4
    return tbl_5
end
tbl_1.poseDino = function(a1, a2)
    --[[
      name: poseDino
      line: 89
      upvalues:
        poseDuck (ref,  index: 1)
        poseLegs (ref,  index: 2)
        bobAmplitude_upv_1 (copy, index: 3)
        depth_upv_1 (copy, index: 4)
    ]]
    local feet_1 = a2.feet
    local v20 = ((a2.blink) and 1) or 0
    a1.eyeWhite.Transparency = v20
    a1.pupil.Transparency = v20
    if a2.ducking then
        poseDuck(a1, feet_1, a2.tailWag)
        poseLegs(a1, feet_1, a2.legPhase, false)
        return nil
    else
        local v21 = ((a2.airborne) and 0) or (math.sin(a2.bobPhase * math.tau) * bobAmplitude_upv_1)
        local v22 = a2.squash * depth_upv_1
        local v23 = v21 - v22
        local v24 = -v21 * 0.4 - v22 * 0.4
        local v25 = ((not (a2.airborne)) and 0) or (a2.pitch)
        a1.torsoLower.CFrame = CFrame.new(feet_1 + Vector3.new(0, 2.05 + v23, 0)) * CFrame.Angles(0, 0, -0.10471975511965978 + v25)
        a1.torsoUpper.CFrame = CFrame.new(feet_1 + Vector3.new(0.35, 3.1 + v23, 0)) * CFrame.Angles(0, 0, -0.13962634015954636 + v25)
        a1.neck.CFrame = CFrame.new(feet_1 + Vector3.new(1.05, 3.65 + v23, 0)) * CFrame.Angles(0, 0, -0.5235987755982988)
        a1.head.CFrame = CFrame.new(feet_1 + Vector3.new(1.75, 4.25 + v23, 0))
        a1.jaw.CFrame = CFrame.new(feet_1 + Vector3.new(1.95, 3.78 + v23, 0))
        a1.brow.CFrame = CFrame.new(feet_1 + Vector3.new(2, 4.78 + v23, 0))
        a1.eyeWhite.CFrame = CFrame.new(feet_1 + Vector3.new(2.05, 4.32 + v23, 0.78))
        a1.pupil.CFrame = CFrame.new(feet_1 + Vector3.new(2.12, 4.32 + v23, 0.95))
        a1.armNear.CFrame = CFrame.new(feet_1 + Vector3.new(1.35, 2.85 + v23, 0.5)) * CFrame.Angles(0, 0, -0.6108652381980153)
        a1.armFar.CFrame = CFrame.new(feet_1 + Vector3.new(1.35, 2.85 + v23, -0.5)) * CFrame.Angles(0, 0, -0.6108652381980153)
        a1.tailBase.CFrame = CFrame.new(feet_1 + Vector3.new(-1.55, 2.5 + v24, 0)) * CFrame.Angles(0, 0, 0.3141592653589793 + a2.tailWag)
        a1.tailTip.CFrame = CFrame.new(feet_1 + Vector3.new(-2.75, 3 + v24, 0)) * CFrame.Angles(0, 0, 0.5934119456780721 + (a2.tailWag * 1.4))
        poseLegs(a1, feet_1, a2.legPhase, a2.airborne)
    end
end
return tbl_1