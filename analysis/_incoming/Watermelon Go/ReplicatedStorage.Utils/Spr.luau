-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RunService_1 = game:GetService("RunService")
local exp_upv_1 = math.exp
local sin_upv_1 = math.sin
local cos_upv_1 = math.cos
local min_upv_1 = math.min
local max_upv_1 = math.max
local sqrt_upv_1 = math.sqrt
local atan2_upv_1 = math.atan2
local round_upv_1 = math.round
local function magnitudeSq(a1)
    --[[
      name: magnitudeSq
      line: 53
    ]]
    local v1 = 0
    for _, value_1 in a1 do
        v1 = v1 + value_1 ^ 2
    end
    return v1
end
local function distanceSq(a1, a2)
    --[[
      name: distanceSq
      line: 61
    ]]
    local v2 = 0
    for key_1, value_2 in a1 do
        v2 = v2 + (a2[key_1] - value_2) ^ 2
    end
    return v2
end
local tbl_upv_1 = {}
tbl_upv_1.__index = tbl_upv_1
function tbl_upv_1.new(a1, a2, a3, a4, a5)
    --[[
      name: new
      line: 91
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = a5.toIntermediate(a3)
    return (setmetatable({d = a1, f = a2, g = v3, p = v3, v = table.create(#v3, 0), typedat = a5, rawGoal = a4}, tbl_upv_1))
end
function tbl_upv_1.setGoal(a1, a2)
    --[[
      name: setGoal
      line: 107
    ]]
    a1.rawGoal = a2
    a1.g = a1.typedat.toIntermediate(a2)
end
function tbl_upv_1.setDampingRatio(a1, a2)
    --[[
      name: setDampingRatio
      line: 112
    ]]
    a1.d = a2
end
function tbl_upv_1.setFrequency(a1, a2)
    --[[
      name: setFrequency
      line: 116
    ]]
    a1.f = a2
end
function tbl_upv_1.canSleep(a1)
    --[[
      name: canSleep
      line: 120
    ]]
    local g_1 = 0
    for _, value_3 in a1.v do
        g_1 = g_1 + value_3 ^ 2
    end
    if g_1 > 1e-04 then
        return false
    end
    g_1 = a1.g
    local v4 = 0
    v4 = v4
    for key_2, value_4 in a1.p do
        v4 = v4 + (g_1[key_2] - value_4) ^ 2
    end
    if v4 <= 6.781684027777778e-08 then
        return true
    end
    return false
end
function tbl_upv_1.step(a1, a2)
    --[[
      name: step
      line: 132
      upvalues:
        exp_upv_1 (copy, index: 1)
        sqrt_upv_1 (copy, index: 2)
        cos_upv_1 (copy, index: 3)
        sin_upv_1 (copy, index: 4)
    ]]
    local d_1 = a1.d
    local v5 = a1.f * math.tau
    local g_2 = a1.g
    local p_1 = a1.p
    local v_1 = a1.v
    if d_1 ~= 1 then
        local v6 = nil
        if d_1 >= 1 then
            local v7 = sqrt_upv_1((d_1 * d_1) - 1)
            local v8 = -v5 * (d_1 + v7)
            local v9 = -v5 * (d_1 - v7)
            local v10 = exp_upv_1(v8 * a2)
            local v11 = exp_upv_1(v9 * a2)
            for n_1 = 1, #p_1 do
                local v12 = p_1[n_1] - g_2[n_1]
                local v13 = (v_1[n_1] - (v12 * v8)) / ((2 * v5) * v7)
                local v14 = v10 * (v12 - v13)
                p_1[n_1] = (v14 + (v13 * v11)) + g_2[n_1]
                v_1[n_1] = (v14 * v8) + ((v13 * v11) * v9)
            end
        else
            local v15 = exp_upv_1((-d_1 * v5) * a2)
            v6 = sqrt_upv_1(1 - (d_1 * d_1))
            local v16 = cos_upv_1((a2 * v5) * v6)
            local v17 = sin_upv_1((a2 * v5) * v6)
            local v18
            if v6 <= 1e-05 then
                local v19 = a2 * v5
                v18 = a2 * v5 + (a2 * v5 * (a2 * v5) * (v6 * v6) * (v6 * v6) / 20 - v6 * v6) * (a2 * v5 * (a2 * v5) * (a2 * v5)) / 6
            else
                v18 = v17 / v6
            end
            local v19
            if v5 * v6 <= 1e-05 then
                local _ = v5 * v6
                v19 = a2 + (a2 * a2 * (v5 * v6 * (v5 * v6)) * (v5 * v6 * (v5 * v6)) / 20 - v5 * v6 * (v5 * v6)) * (a2 * a2 * a2) / 6
            else
                v19 = v17 / (v5 * v6)
            end
            for n_2 = 1, #p_1 do
                local v20 = p_1[n_2] - g_2[n_2]
                p_1[n_2] = (((v20 * (v16 + (v18 * d_1))) + (v_1[n_2] * v19)) * v15) + g_2[n_2]
                v_1[n_2] = ((v_1[n_2] * (v16 - (v18 * d_1))) - (v20 * (v18 * v5))) * v15
            end
        end
    else
        local v21 = exp_upv_1(-v5 * a2)
        local v22 = a2 * v21
        for n_3 = 1, #p_1 do
            local v23 = p_1[n_3] - g_2[n_3]
            p_1[n_3] = ((v23 * (v21 + (v22 * v5))) + (v_1[n_3] * v22)) + g_2[n_3]
            v_1[n_3] = (v_1[n_3] * (v21 - (v22 * v5))) - (v23 * ((v22 * v5) * v5))
        end
    end
    return a1.typedat.fromIntermediate(a1.p)
end
local tbl_upv_2 = {}
tbl_upv_2.__index = tbl_upv_2
function tbl_upv_2.new(a1, a2, a3, a4)
    --[[
      name: new
      line: 248
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return (setmetatable({v = Vector3.new(0, 0, 0), d = a1, f = a2, g = a4:Orthonormalize(), p = a3:Orthonormalize()}, tbl_upv_2))
end
function tbl_upv_2.setGoal(a1, a2)
    --[[
      name: setGoal
      line: 261
    ]]
    a1.g = a2:Orthonormalize()
end
function tbl_upv_2.setDampingRatio(a1, a2)
    --[[
      name: setDampingRatio
      line: 265
    ]]
    a1.d = a2
end
function tbl_upv_2.setFrequency(a1, a2)
    --[[
      name: setFrequency
      line: 269
    ]]
    a1.f = a2
end
local function dot(a1, a2)
    --[[
      name: dot
      line: 274
    ]]
    return ((a1.X * a2.X) + (a1.Y * a2.Y)) + (a1.Z * a2.Z)
end
local function areRotationsClose(a1, a2)
    --[[
      name: areRotationsClose
      line: 278
    ]]
    local XVector_1 = a1.XVector
    local XVector_2 = a2.XVector
    local YVector_1 = a1.YVector
    local YVector_2 = a2.YVector
    local ZVector_1 = a1.ZVector
    local ZVector_2 = a2.ZVector
    return (((((XVector_1.X * XVector_2.X) + (XVector_1.Y * XVector_2.Y)) + (XVector_1.Z * XVector_2.Z)) + (((YVector_1.X * YVector_2.X) + (YVector_1.Y * YVector_2.Y)) + (YVector_1.Z * YVector_2.Z))) + (((ZVector_1.X * ZVector_2.X) + (ZVector_1.Y * ZVector_2.Y)) + (ZVector_1.Z * ZVector_2.Z))) > 2.9999999695382584
end
local function fromAxisAngle(a1, a2)
    --[[
      name: fromAxisAngle
      line: 295
      upvalues:
        cos_upv_1 (copy, index: 1)
        sin_upv_1 (copy, index: 2)
    ]]
    local v24 = cos_upv_1(a2)
    local v25 = sin_upv_1(a2)
    local X_1 = a1.X
    local Y_1 = a1.Y
    local Z_1 = a1.Z
    local v26 = X_1 * Y_1 * (1 - v24)
    local v27 = Y_1 * Z_1 * (1 - v24)
    local v28 = Z_1 * X_1 * (1 - v24)
    return CFrame.fromMatrix(Vector3.new(0, 0, 0), Vector3.new(((X_1 * X_1) * (1 - v24)) + v24, v26 + (Z_1 * v25), v28 - (Y_1 * v25)), Vector3.new(v26 - (Z_1 * v25), ((Y_1 * Y_1) * (1 - v24)) + v24, v27 + (X_1 * v25)), Vector3.new(v28 + (Y_1 * v25), v27 - (X_1 * v25), ((Z_1 * Z_1) * (1 - v24)) + v24)):Orthonormalize()
end
local function rotateAxis(a1, a2)
    --[[
      name: rotateAxis
      line: 311
      upvalues:
        fromAxisAngle (copy, index: 1)
    ]]
    local v29 = CFrame.identity
    local Magnitude_1 = a1.Magnitude
    if Magnitude_1 > 1e-06 then
        v29 = fromAxisAngle(a1.Unit, Magnitude_1)
    end
    return v29 * a2
end
local function angleDiff(a1, a2)
    --[[
      name: angleDiff
      line: 286
      upvalues:
        max_upv_1 (copy, index: 1)
        sqrt_upv_1 (copy, index: 2)
        atan2_upv_1 (copy, index: 3)
    ]]
    local XVector_3 = a1.XVector
    local XVector_4 = a2.XVector
    local YVector_3 = a1.YVector
    local YVector_4 = a2.YVector
    local ZVector_3 = a1.ZVector
    local ZVector_4 = a2.ZVector
    local v30 = ((((XVector_3.X * XVector_4.X) + (XVector_3.Y * XVector_4.Y)) + (XVector_3.Z * XVector_4.Z)) + (((YVector_3.X * YVector_4.X) + (YVector_3.Y * YVector_4.Y)) + (YVector_3.Z * YVector_4.Z))) + (((ZVector_3.X * ZVector_4.X) + (ZVector_3.Y * ZVector_4.Y)) + (ZVector_3.Z * ZVector_4.Z)) - 1
    return (atan2_upv_1(sqrt_upv_1(max_upv_1(0, 1 - ((v30 * v30) * 0.25))), v30 * 0.5))
end
local function axisAngleDiff(a1, a2)
    --[[
      name: axisAngleDiff
      line: 321
      upvalues:
        angleDiff (copy, index: 1)
    ]]
    return (a1 * a2:Inverse()):ToAxisAngle().Unit * angleDiff(a1, a2)
end
function tbl_upv_2.canSleep(a1)
    --[[
      name: canSleep
      line: 330
    ]]
    local p_2 = a1.p
    local g_3 = a1.g
    local XVector_5 = p_2.XVector
    local XVector_6 = g_3.XVector
    local YVector_5 = p_2.YVector
    local YVector_6 = g_3.YVector
    local ZVector_5 = p_2.ZVector
    local ZVector_6 = g_3.ZVector
    local v31 = ((((XVector_5.X * XVector_6.X) + (XVector_5.Y * XVector_6.Y)) + (XVector_5.Z * XVector_6.Z)) + (((YVector_5.X * YVector_6.X) + (YVector_5.Y * YVector_6.Y)) + (YVector_5.Z * YVector_6.Z))) + (((ZVector_5.X * ZVector_6.X) + (ZVector_5.Y * ZVector_6.Y)) + (ZVector_5.Z * ZVector_6.Z)) > 2.9999999695382584
    return v31 and a1.v.Magnitude < 0.0017453292519943296
end
function tbl_upv_2.step(a1, a2)
    --[[
      name: step
      line: 336
      upvalues:
        angleDiff (copy, index: 1)
        exp_upv_1 (copy, index: 2)
        fromAxisAngle (copy, index: 3)
        sqrt_upv_1 (copy, index: 4)
        cos_upv_1 (copy, index: 5)
        sin_upv_1 (copy, index: 6)
    ]]
    local d_2 = a1.d
    local v32 = a1.f * math.tau
    local g_4 = a1.g
    local p_3 = a1.p
    local v_2 = a1.v
    local v33 = (p_3 * g_4:Inverse()):ToAxisAngle().Unit * angleDiff(p_3, g_4)
    local v34 = exp_upv_1((-d_2 * v32) * a2)
    local v35, v36, v37 = nil, nil, nil
    if d_2 ~= 1 then
        local v38, v39 = nil, nil
        if d_2 >= 1 then
            local v40 = sqrt_upv_1((d_2 * d_2) - 1)
            local v41 = -v32 * (d_2 + v40)
            local v42 = -v32 * (d_2 - v40)
            local v43 = (v_2 - (v33 * v41)) / ((2 * v32) * v40)
            local v44 = (v33 - v43) * exp_upv_1(v41 * a2)
            local v45 = v43 * exp_upv_1(v42 * a2)
            local v46 = v44 + v45
            local v47 = CFrame.identity
            v38 = v46.Magnitude
            if v38 > 1e-06 then
                v47 = fromAxisAngle(v46.Unit, v38)
            end
            v35, v36 = v47 * g_4, v44 * v41 + v45 * v42
        else
            local v48 = sqrt_upv_1(1 - (d_2 * d_2))
            local v49 = cos_upv_1((a2 * v32) * v48)
            local v50 = sin_upv_1((a2 * v32) * v48)
            local v51 = v50 / v48
            local v52 = ((v33 * (v49 + (v51 * d_2))) + (v_2 * (v50 / (v32 * v48)))) * v34
            local v53 = CFrame.identity
            v39 = v52.Magnitude
            if v39 > 1e-06 then
                v53 = fromAxisAngle(v52.Unit, v39)
            end
            v35, v36 = v53 * g_4, ((v_2 * (v49 - (v51 * d_2))) - (v33 * (v51 * v32))) * v34
        end
    else
        local v54 = (v33 * (1 + v32 * a2) + v_2 * a2) * v34
        local v55 = CFrame.identity
        v37 = ((v33 * (1 + v32 * a2) + v_2 * a2) * v34).Magnitude
        if v37 > 1e-06 then
            v55 = fromAxisAngle(v54.Unit, v37)
        end
        v35 = v55 * g_4
        v36 = ((v_2 * (1 - (a2 * v32))) - (v33 * ((a2 * v32) * v32))) * v34
    end
    a1.p = v35
    a1.v = v36
    return v35
end
local tbl_upv_3 = {toIntermediate = 0, fromIntermediate = 0}
tbl_upv_3.springType = tbl_upv_1.new
function tbl_upv_3.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 392
    ]]
    return {a1.X, a1.Y, a1.Z}
end
function tbl_upv_3.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 396
    ]]
    return (Vector3.new(a1[1], a1[2], a1[3]))
end
local tbl_upv_4 = {}
tbl_upv_4.__index = tbl_upv_4
function tbl_upv_4.new(a1, a2, a3, a4, a5)
    --[[
      name: new
      line: 406
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        tbl_upv_4 (copy, index: 4)
    ]]
    return (setmetatable({rawGoal = a4, _position = tbl_upv_1.new(a1, a2, a3.Position, a4.Position, tbl_upv_3), _rotation = tbl_upv_2.new(a1, a2, a3.Rotation, a4.Rotation)}, tbl_upv_4))
end
function tbl_upv_4.setGoal(a1, a2)
    --[[
      name: setGoal
      line: 423
    ]]
    a1.rawGoal = a2
    a1._position:setGoal(a2.Position)
    a1._rotation:setGoal(a2.Rotation)
end
function tbl_upv_4.setDampingRatio(a1, a2)
    --[[
      name: setDampingRatio
      line: 429
    ]]
    a1._position.d = a2
    a1._rotation.d = a2
end
function tbl_upv_4.setFrequency(a1, a2)
    --[[
      name: setFrequency
      line: 434
    ]]
    a1._position.f = a2
    a1._rotation.f = a2
end
function tbl_upv_4.canSleep(a1)
    --[[
      name: canSleep
      line: 439
    ]]
    local v56 = a1._position:canSleep() and (a1._rotation:canSleep())
    return v56
end
function tbl_upv_4.step(a1, a2)
    --[[
      name: step
      line: 443
    ]]
    local v57 = a1._position:step(a2)
    return a1._rotation:step(a2) + v57
end
local function inverseGammaCorrectD65(a1)
    --[[
      name: inverseGammaCorrectD65
      line: 454
    ]]
    return ((a1 < 0.0404482362771076) and (a1 / 12.92)) or (0.87941546140213 * (a1 + 0.055) ^ 2.4)
end
local function gammaCorrectD65(a1)
    --[[
      name: gammaCorrectD65
      line: 458
    ]]
    return ((a1 < 0.0031306684425) and (12.92 * a1)) or (1.055 * (a1 ^ 0.4166666666666667) - 0.055)
end
local function luvToRgb(a1)
    --[[
      name: luvToRgb
      line: 491
      upvalues:
        min_upv_1 (copy, index: 1)
    ]]
    local v58 = a1[1]
    if v58 < 0.0197955 then
        return Color3.new(0, 0, 0)
    end
    local v59 = a1[2] / v58 + 0.19783
    local v60 = a1[3] / v58 + 0.46832
    local v61 = (v58 + 16) / 116
    v61 = ((v61 > 0.20689655172413793) and (v61 * v61 * v61)) or (v61 * 0.12841854934601665 - 0.01771290335807126)
    local v62 = v61 * v59 / v60
    local v63 = v61 * (((3 - (v59 * 0.75)) / v60) - 5)
    local v64 = (v62 * 7.2914074) - (v61 * 1.537208) - v63 * 0.4986286
    local v65 = (v62 * -2.180094) + (v61 * 1.8757561) + v63 * 0.0415175
    local v66 = (v62 * 0.1253477) - (v61 * 0.2040211) + v63 * 1.0569959
    if v64 >= 0 or v64 >= v65 or v64 >= v66 then
        if v65 >= 0 or v65 >= v66 then
            if v66 < 0 then
                v64 = v64 - v66
                v65 = v65 - v66
                v66 = 0
            end
        else
            v64 = v64 - v65
            v66 = v66 - v65
            v65 = 0
        end
    else
        v65 = v65 - v64
        v66 = v66 - v64
        v64 = 0
    end
    local v67 = min_upv_1(((v64 < 0.0031306684425) and (12.92 * v64)) or (1.055 * (v64 ^ 0.4166666666666667) - 0.055), 1)
    local v68 = min_upv_1(((v65 < 0.0031306684425) and (12.92 * v65)) or (1.055 * (v65 ^ 0.4166666666666667) - 0.055), 1)
    return Color3.new(v67, v68, min_upv_1(((v66 < 0.0031306684425) and (12.92 * v66)) or (1.055 * (v66 ^ 0.4166666666666667) - 0.055), 1))
end
local tbl_upv_5 = {}
local tbl_6 = {toIntermediate = 0, fromIntermediate = 0}
tbl_6.springType = tbl_upv_1.new
function tbl_6.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 537
    ]]
    local tbl_7 = {}
    tbl_7[1] = (a1 and 1) or 0
    return tbl_7
end
function tbl_6.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 541
    ]]
    return a1[1] >= 0.5
end
tbl_upv_5.boolean = tbl_6
local tbl_8 = {toIntermediate = 0, fromIntermediate = 0}
tbl_8.springType = tbl_upv_1.new
function tbl_8.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 549
    ]]
    return {a1}
end
function tbl_8.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 553
    ]]
    return a1[1]
end
tbl_upv_5.number = tbl_8
local tbl_9 = {toIntermediate = 0, fromIntermediate = 0}
tbl_9.springType = tbl_upv_1.new
function tbl_9.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 561
    ]]
    return {a1.Min, a1.Max}
end
function tbl_9.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 565
    ]]
    return NumberRange.new(a1[1], a1[2])
end
tbl_upv_5.NumberRange = tbl_9
local tbl_10 = {toIntermediate = 0, fromIntermediate = 0}
tbl_10.springType = tbl_upv_1.new
function tbl_10.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 573
    ]]
    return {a1.Scale, a1.Offset}
end
function tbl_10.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 577
      upvalues:
        round_upv_1 (copy, index: 1)
    ]]
    return UDim.new(a1[1], round_upv_1(a1[2]))
end
tbl_upv_5.UDim = tbl_10
local tbl_11 = {toIntermediate = 0, fromIntermediate = 0}
tbl_11.springType = tbl_upv_1.new
function tbl_11.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 585
    ]]
    local X_2 = a1.X
    local Y_2 = a1.Y
    return {X_2.Scale, X_2.Offset, Y_2.Scale, Y_2.Offset}
end
function tbl_11.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 591
      upvalues:
        round_upv_1 (copy, index: 1)
    ]]
    return UDim2.new(a1[1], round_upv_1(a1[2]), a1[3], round_upv_1(a1[4]))
end
tbl_upv_5.UDim2 = tbl_11
local tbl_12 = {toIntermediate = 0, fromIntermediate = 0}
tbl_12.springType = tbl_upv_1.new
function tbl_12.toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 599
    ]]
    return {a1.X, a1.Y}
end
function tbl_12.fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 603
    ]]
    return Vector2.new(a1[1], a1[2])
end
tbl_upv_5.Vector2 = tbl_12
tbl_upv_5.Vector3 = tbl_upv_3
local function rgbToLuv(a1)
    --[[
      name: rgbToLuv
      line: 462
    ]]
    local G_1 = a1.G
    local B_1 = a1.B
    local R_1 = a1.R
    local v69 = ((R_1 < 0.0404482362771076) and (R_1 / 12.92)) or (0.87941546140213 * (R_1 + 0.055) ^ 2.4)
    local v70 = G_1
    local v71 = ((v70 < 0.0404482362771076) and (v70 / 12.92)) or (0.87941546140213 * (v70 + 0.055) ^ 2.4)
    local v72 = B_1
    local v73 = ((v72 < 0.0404482362771076) and (v72 / 12.92)) or (0.87941546140213 * (v72 + 0.055) ^ 2.4)
    local v74 = (0.2125862307855956 * v69) + (0.7151703037034108 * v71) + 0.0722004986433362 * v73
    local v75 = (3.6590806972265884 * v69) + (11.442689580057424 * v71) + 4.114991502426484 * v73
    local v76 = ((v74 > 0.008856451679035631) and (116 * (v74 ^ 0.3333333333333333) - 16)) or (903.296296296296 * v74)
    local v77, v78
    if v75 <= 1e-14 then
        v77, v78 = -0.19783 * v76, -0.46832 * v76
    else
        v77 = v76 * (0.9257063972951867 * v69 - 0.8333736323779866 * v71 - 0.09209820666085898 * v73) / v75
        v78 = v76 * (9 * v74 / v75 - 0.46832)
    end
    return {v76, v77, v78}
end
tbl_upv_5.Color3 = {springType = tbl_upv_1.new, toIntermediate = rgbToLuv, fromIntermediate = luvToRgb}
local function toIntermediate(a1)
    --[[
      name: toIntermediate
      line: 620
      upvalues:
        rgbToLuv (ref, index: 1)
    ]]
    local Keypoints_1 = a1.Keypoints
    local v79 = rgbToLuv(Keypoints_1[1].Value)
    local v80 = rgbToLuv(Keypoints_1[#Keypoints_1].Value)
    return {v79[1], v79[2], v79[3], v80[1], v80[2], v80[3]}
end
local function fromIntermediate(a1)
    --[[
      name: fromIntermediate
      line: 632
      upvalues:
        luvToRgb (ref, index: 1)
    ]]
    return ColorSequence.new(luvToRgb({a1[1], a1[2], a1[3]}), luvToRgb({a1[4], a1[5], a1[6]}))
end
tbl_upv_5.ColorSequence = {springType = tbl_upv_1.new, toIntermediate = toIntermediate, fromIntermediate = fromIntermediate}
tbl_upv_5.CFrame = {springType = tbl_upv_4.new, toIntermediate = error, fromIntermediate = error}
local tbl_upv_13 = {}
local tbl_14 = {class = "PVInstance", set = 0, get = 0}
function tbl_14.get(a1)
    --[[
      name: get
      line: 658
    ]]
    return a1:GetPivot()
end
function tbl_14.set(a1, a2)
    --[[
      name: set
      line: 661
    ]]
    a1:PivotTo(a2)
end
tbl_upv_13.Pivot = tbl_14
local tbl_15 = {class = "Model", set = 0, get = 0}
function tbl_15.get(a1)
    --[[
      name: get
      line: 667
    ]]
    return a1:GetScale()
end
function tbl_15.set(a1, a2)
    --[[
      name: set
      line: 670
    ]]
    a1:ScaleTo((math.clamp(a2, 1.402e-45, 16777216)))
end
tbl_upv_13.Scale = tbl_15
local function getProperty(a1, a2)
    --[[
      name: getProperty
      line: 679
      upvalues:
        tbl_upv_13 (copy, index: 1)
    ]]
    local v81 = tbl_upv_13[a2]
    if v81 and a1:IsA(v81.class) then
        return v81.get(a1)
    end
    return a1[a2]
end
local function setProperty(a1, a2, a3)
    --[[
      name: setProperty
      line: 688
      upvalues:
        tbl_upv_13 (copy, index: 1)
    ]]
    local v82 = tbl_upv_13[a2]
    if v82 and a1:IsA(v82.class) then
        v82.set(a1, a3)
    else
        a1[a2] = a3
    end
end
local tbl_upv_16 = {}
local tbl_upv_17 = {}
local tbl_upv_18 = {}
local function processSprings(a1, a2)
    --[[
      name: processSprings
      line: 702
      upvalues:
        tbl_upv_13 (copy, index: 1)
        tbl_upv_18 (copy, index: 2)
    ]]
    for key_3, value_5 in a1 do
        for key_4, value_6 in value_5 do
            if value_6:canSleep() then
                value_5[key_4] = nil
                local rawGoal_1 = value_6.rawGoal
                local v83 = tbl_upv_13[key_4]
                if not (v83) then
                    key_3[key_4] = rawGoal_1
                    continue
                end
                if key_3:IsA(v83.class) then
                    v83.set(key_3, rawGoal_1)
                else
                    key_3[key_4] = rawGoal_1
                end
            else
                local v84 = value_6:step(a2)
                local v85 = tbl_upv_13[key_4]
                if not (v85) then
                    key_3[key_4] = v84
                    continue
                end
                if key_3:IsA(v85.class) then
                    v85.set(key_3, v84)
                else
                    key_3[key_4] = v84
                end
            end
        end
        if next(value_5) then
            continue
        end
        a1[key_3] = nil
        local v86 = tbl_upv_18[key_3]
        if not (v86) then
            continue
        end
        tbl_upv_18[key_3] = nil
        for _, value_7 in v86 do
            task.spawn(value_7)
        end
    end
end
RunService_1.PreSimulation:Connect(
    function(a1)
        --[[
          line: 731
          upvalues:
            processSprings (copy, index: 1)
            tbl_upv_16 (copy, index: 2)
        ]]
        processSprings(tbl_upv_16, a1)
    end
)
RunService_1.PostSimulation:Connect(
    function(a1)
        --[[
          line: 735
          upvalues:
            processSprings (copy, index: 1)
            tbl_upv_17 (copy, index: 2)
        ]]
        processSprings(tbl_upv_17, a1)
    end
)
local function assertType(a1, a2, a3, a4)
    --[[
      name: assertType
      line: 739
    ]]
    if (a3:find(typeof(a4))) then
        return
    end
    error(("bad argument #%* to %* (%* expected, got %*)"):format(a1, a2, a3, typeof(a4)), 3)
end
local tbl_19 = {}
function tbl_19.target(a1, a2, a3, a4)
    --[[
      name: target
      line: 748
      upvalues:
        tbl_upv_17 (copy, index: 1)
        tbl_upv_16 (copy, index: 2)
        tbl_upv_13 (copy, index: 3)
        tbl_upv_5 (copy, index: 4)
    ]]
    if not (("Instance"):find(typeof(a1))) then
        error(("bad argument #%* to spr.target (Instance expected, got %*)"):format(1, typeof(a1)), 3)
    end
    if not (("number"):find(typeof(a2))) then
        error(("bad argument #%* to spr.target (number expected, got %*)"):format(2, typeof(a2)), 3)
    end
    if not (("number"):find(typeof(a3))) then
        error(("bad argument #%* to spr.target (number expected, got %*)"):format(3, typeof(a3)), 3)
    end
    if not (("table"):find(typeof(a4))) then
        error(("bad argument #%* to spr.target (table expected, got %*)"):format(4, typeof(a4)), 3)
    end
    if a2 ~= a2 or a2 < 0 then
        error(("expected damping ratio >= 0; got %.2f"):format(a2), 2)
    end
    if a3 ~= a3 or a3 < 0 then
        error(("expected undamped frequency >= 0; got %.2f"):format(a3), 2)
    end
    local v87
    if a1:IsA("Camera") then
        v87 = tbl_upv_17
    else
        v87 = tbl_upv_16
    end
    local v88 = v87[a1]
    if not (v88) then
        local tbl_20 = {}
        v87[a1] = tbl_20
        v88 = tbl_20
    end
    local v89 = nil
    for key_5, value_8 in a4 do
        local v90 = tbl_upv_13[key_5]
        if not (v90) or not (a1:IsA(v90.class)) then
            v89 = a1[key_5]
            if typeof(value_8) ~= typeof(v89) then
                error(("bad property %* to spr.target (%* expected, got %*)"):format(key_5, typeof(v89), typeof(value_8)), 2)
            end
            if a3 ~= math.huge then
                v90 = v88[key_5]
                if v90 then
                    v90:setGoal(value_8)
                    v90:setDampingRatio(a2)
                    v90:setFrequency(a3)
                    continue
                end
                local v91 = tbl_upv_5[typeof(value_8)]
                if not (v91) then
                    error("unsupported type: " .. typeof(value_8), 2)
                end
                v90 = v91.springType(a2, a3, v89, value_8, v91)
                v88[key_5] = v90
                v90:setGoal(value_8)
                v90:setDampingRatio(a2)
                v90:setFrequency(a3)
            else
                v90 = tbl_upv_13[key_5]
                if not (v90) then
                    a1[key_5] = value_8
                    v88[key_5] = nil
                    continue
                end
                if a1:IsA(v90.class) then
                    v90.set(a1, value_8)
                else
                    a1[key_5] = value_8
                end
                v88[key_5] = nil
            end
            continue
        end
        v89 = v90.get(a1)
        if typeof(value_8) ~= typeof(v89) then
            error(("bad property %* to spr.target (%* expected, got %*)"):format(key_5, typeof(v89), typeof(value_8)), 2)
        end
        if a3 ~= math.huge then
            v90 = v88[key_5]
            if v90 then
                v90:setGoal(value_8)
                v90:setDampingRatio(a2)
                v90:setFrequency(a3)
                continue
            end
            local v91 = tbl_upv_5[typeof(value_8)]
            if not (v91) then
                error("unsupported type: " .. typeof(value_8), 2)
            end
            v90 = v91.springType(a2, a3, v89, value_8, v91)
            v88[key_5] = v90
            v90:setGoal(value_8)
            v90:setDampingRatio(a2)
            v90:setFrequency(a3)
        else
            v90 = tbl_upv_13[key_5]
            if not (v90) then
                a1[key_5] = value_8
                v88[key_5] = nil
                continue
            end
            if a1:IsA(v90.class) then
                v90.set(a1, value_8)
            else
                a1[key_5] = value_8
            end
            v88[key_5] = nil
        end
    end
    if (next(v88)) then
        return
    end
    v87[a1] = nil
end
function tbl_19.stop(a1, a2)
    --[[
      name: stop
      line: 807
      upvalues:
        tbl_upv_16 (copy, index: 1)
        tbl_upv_17 (copy, index: 2)
    ]]
    if not (("Instance"):find(typeof(a1))) then
        error(("bad argument #%* to spr.stop (Instance expected, got %*)"):format(1, typeof(a1)), 3)
    end
    if not (("string|nil"):find(typeof(a2))) then
        error(("bad argument #%* to spr.stop (string|nil expected, got %*)"):format(2, typeof(a2)), 3)
    end
    local v92 = nil
    if a2 then
        v92 = tbl_upv_16[a1] or (tbl_upv_17[a1])
        if not v92 then
            return
        end
        v92[a2] = nil
    else
        tbl_upv_16[a1] = nil
        tbl_upv_17[a1] = nil
    end
end
function tbl_19.completed(a1, a2)
    --[[
      name: completed
      line: 824
      upvalues:
        tbl_upv_18 (copy, index: 1)
    ]]
    if not (("Instance"):find(typeof(a1))) then
        error(("bad argument #%* to spr.completed (Instance expected, got %*)"):format(1, typeof(a1)), 3)
    end
    if not (("function"):find(typeof(a2))) then
        error(("bad argument #%* to spr.completed (function expected, got %*)"):format(2, typeof(a2)), 3)
    end
    local v93 = tbl_upv_18[a1]
    if v93 then
        table.insert(v93, a2)
    else
        tbl_upv_18[a1] = {a2}
    end
end
return table.freeze(tbl_19)