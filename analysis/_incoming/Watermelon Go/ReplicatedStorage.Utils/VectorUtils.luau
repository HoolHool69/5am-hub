-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = Random.new()
local tbl_upv_1 = {}
tbl_upv_1.zero = Vector3.new()
tbl_upv_1.one = Vector3.new(1, 1, 1)
tbl_upv_1.forward = Vector3.new(0, 0, 1)
tbl_upv_1.back = Vector3.new(0, 0, -1)
tbl_upv_1.up = Vector3.new(0, 1, 0)
tbl_upv_1.down = Vector3.new(0, -1, 0)
tbl_upv_1.left = Vector3.new(-1, 0, 0)
tbl_upv_1.right = Vector3.new(1, 0, 0)
tbl_upv_1.positiveInfinity = Vector3.new(inf, inf, inf)
tbl_upv_1.negativeInfinity = Vector3.new(-inf, -inf, -inf)
tbl_upv_1.Phi = math.phi
tbl_upv_1.Deg2Rad = 0.017453292519943295
tbl_upv_1.Rad2Deg = 1 / tbl_upv_1.Deg2Rad
function tbl_upv_1.ProjectPointFromPlane(a1, a2, a3, a4)
    --[[
      name: ProjectPointFromPlane
      line: 87
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (a3 + (a2 * -tbl_upv_1.PointDistanceFromPlane(a1, a2, a3))) + (a2 * a4)
end
function tbl_upv_1.ProjectPointOnPlane(a1, a2, a3)
    --[[
      name: ProjectPointOnPlane
      line: 92
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return a3 + (-a2 * tbl_upv_1.PointDistanceFromPlane(a1, a2, a3))
end
function tbl_upv_1.PointDistanceFromPlane(a1, a2, a3)
    --[[
      name: PointDistanceFromPlane
      line: 96
    ]]
    return a2:Dot(a3 - a1)
end
function tbl_upv_1.Direction(a1, a2)
    --[[
      name: Direction
      line: 100
    ]]
    local v1 = a2 - a1
    if v1 ~= Vector3.new() then
        return v1.Unit
    end
    return (Vector3.new())
end
function tbl_upv_1.ToVector2(a1)
    --[[
      name: ToVector2
      line: 108
    ]]
    return Vector2.new(a1.X, a1.Y)
end
function tbl_upv_1.ToVector3(a1, a2)
    --[[
      name: ToVector3
      line: 112
    ]]
    return (Vector3.new(a1.X, a1.Y, a2))
end
function tbl_upv_1.Normalize(a1)
    --[[
      name: Normalize
      line: 116
    ]]
    if a1.Magnitude >= 1e-04 then
        return a1.Unit
    end
    return (Vector3.new())
end
function tbl_upv_1.XZNormalize(a1)
    --[[
      name: XZNormalize
      line: 123
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.Normalize(Vector3.new(a1.X, 0, a1.Z))
end
function tbl_upv_1.XZDirection(a1, a2)
    --[[
      name: XZDirection
      line: 128
    ]]
    local v2 = a2 - a1
    if v2 ~= Vector3.new() then
        return Vector3.new(v2.X, 0, v2.Z).Unit
    end
    return (Vector3.new())
end
function tbl_upv_1.ToZXComponents(a1)
    --[[
      name: ToZXComponents
      line: 137
    ]]
    return (Vector3.new(a1.X, 0, a1.Z))
end
function tbl_upv_1.SetYComponent(a1, a2)
    --[[
      name: SetYComponent
      line: 141
    ]]
    return (Vector3.new(a1.X, a2, a1.Z))
end
function tbl_upv_1.SetXComponent(a1, a2)
    --[[
      name: SetXComponent
      line: 145
    ]]
    return (Vector3.new(a2, a1.Y, a1.Z))
end
function tbl_upv_1.SetZComponent(a1, a2)
    --[[
      name: SetZComponent
      line: 149
    ]]
    return (Vector3.new(a1.X, a1.Y, a2))
end
function tbl_upv_1.Distance(a1, a2)
    --[[
      name: Distance
      line: 154
    ]]
    return (a2 - a1).Magnitude
end
function tbl_upv_1.XZDistance(a1, a2)
    --[[
      name: XZDistance
      line: 159
    ]]
    local v3 = a2 - a1
    if v3 ~= Vector3.new() then
        return Vector3.new(v3.X, 0, v3.Z).Magnitude
    end
    return 0
end
function tbl_upv_1.DirectionDistance(a1, a2, a3)
    --[[
      name: DirectionDistance
      line: 168
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (math.abs(tbl_upv_1.PointDistanceFromPlane(a3, a1, a2)))
end
function tbl_upv_1.SqrMagnitude(a1)
    --[[
      name: SqrMagnitude
      line: 172
    ]]
    return ((a1.X * a1.X) + (a1.Y * a1.Y)) + (a1.Z * a1.Z)
end
function tbl_upv_1.SqrMagnitude2D(a1)
    --[[
      name: SqrMagnitude2D
      line: 176
    ]]
    return (a1.X * a1.X) + (a1.Y * a1.Y)
end
function tbl_upv_1.DirectionLength(a1, a2)
    --[[
      name: DirectionLength
      line: 180
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (math.abs(tbl_upv_1.PointDistanceFromPlane(Vector3.new(), a2, a1)))
end
function tbl_upv_1.SignedDirectionLength(a1, a2)
    --[[
      name: SignedDirectionLength
      line: 184
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.PointDistanceFromPlane(Vector3.new(), a2, a1)
end
function tbl_upv_1.ClampVectorOnLine(a1, a2, a3)
    --[[
      name: ClampVectorOnLine
      line: 188
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v4 = tbl_upv_1.ProjectPointOnLine(a1, a2, a3)
    local v5 = tbl_upv_1.Distance(a2, a3)
    if v5 >= tbl_upv_1.Distance(a2, v4) then
        if v5 >= tbl_upv_1.Distance(a3, v4) then
            return v4
        end
        return a2
    end
    return a3
end
function tbl_upv_1.ProjectPointOnLine(a1, a2, a3)
    --[[
      name: ProjectPointOnLine
      line: 201
    ]]
    local v6 = a3 - a2
    return a2 + (((a1 - a2):Dot(v6) / v6:Dot(v6)) * v6)
end
function tbl_upv_1.SpreadVector(a1, a2, a3)
    --[[
      name: SpreadVector
      line: 207
    ]]
    a3 = a3 or (Random.new())
    local v7 = a3:NextNumber(0, a2)
    return (CFrame.new(Vector3.new(), a1) * CFrame.Angles(0, 0, a3:NextNumber(0, math.tau)) * CFrame.Angles(v7, 0, 0)).lookVector
end
function tbl_upv_1.RandomPointInArea2D(a1)
    --[[
      name: RandomPointInArea2D
      line: 219
    ]]
    local v8 = math.tau * math.random()
    local v9 = math.random() + math.random()
    local v10
    if v9 <= 1 then
        v10 = v9
    else
        v10 = 2 - v9
    end
    return Vector2.new((v10 * math.cos(v8)) * a1, (v10 * math.sin(v8)) * a1)
end
function tbl_upv_1.RandomUnitVector2()
    --[[
      name: RandomUnitVector2
      line: 231
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.RandomPointInArea2D(1).Unit
end
function tbl_upv_1.RandomPointInArea3D(a1)
    --[[
      name: RandomPointInArea3D
      line: 235
    ]]
    local v11 = Random.new()
    local v12 = nil
    local v13 = 1000
    v12 = v12
    local v14 = nil
    while v13 > 0 do
        v14 = Vector3.new(v11:NextNumber(-1, 1), v11:NextNumber(-1, 1), v11:NextNumber(-1, 1))
        if v14.Magnitude > 1 then
            v13 = v13 - 1
            v12 = v14
            continue
        end
        return v14
    end
    return v12 * a1
end
function tbl_upv_1.RandomUnitVector3()
    --[[
      name: RandomUnitVector3
      line: 250
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.RandomPointInArea3D(1).Unit
end
function tbl_upv_1.GetRandomicPerpendicularVector(a1, a2)
    --[[
      name: GetRandomicPerpendicularVector
      line: 254
    ]]
    local v15 = a2 or (Random.new())
    local v16 = nil
    repeat
        repeat
            v16 = Vector3.new(v15:NextNumber(-1, 1), v15:NextNumber(-1, 1), v15:NextNumber(-1, 1))
        until v16 ~= Vector3.new()
    until v16 ~= a1
    return a1:Cross(v16).Unit
end
function tbl_upv_1.GetRandomicPerpendicularVectorBetween(a1, a2, a3)
    --[[
      name: GetRandomicPerpendicularVectorBetween
      line: 264
    ]]
    local v17 = a2 - a1
    local v18 = a3 or (Random.new())
    local v19 = nil
    repeat
        repeat
            v19 = Vector3.new(v18:NextNumber(-1, 1), v18:NextNumber(-1, 1), v18:NextNumber(-1, 1))
        until v19 ~= Vector3.new()
    until v19 ~= v17
    return v17:Cross(v19).Unit
end
function tbl_upv_1.Sunflower(a1, a2, a3)
    --[[
      name: Sunflower
      line: 280
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local tbl_2 = {}
    local v20 = math.round(a2 * math.sqrt(a1))
    local Phi_1 = tbl_upv_1.Phi
    for n_1 = 1, a1 do
        local v21 = ((a1 - v20 >= n_1) and (math.sqrt(n_1 - 0.5) / math.sqrt(a1 - ((v20 + 1) / 2)))) or 1
        local v22 = math.tau * n_1 / Phi_1 ^ 2
        table.insert(tbl_2, Vector2.new(v21 * math.cos(v22), v21 * math.sin(v22)) * a3)
    end
    return tbl_2
end
function tbl_upv_1.CFrameFromUpVector3(a1)
    --[[
      name: CFrameFromUpVector3
      line: 297
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v23 = tbl_upv_1.GetRandomicPerpendicularVectorBetween(Vector3.new(), a1)
    local v24 = a1:Cross(v23)
    return CFrame.fromMatrix(Vector3.new(), v23, a1, v24)
end
function tbl_upv_1.CFrameFromForwardVector3(a1)
    --[[
      name: CFrameFromForwardVector3
      line: 304
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v25 = tbl_upv_1.GetRandomicPerpendicularVectorBetween(Vector3.new(), a1)
    local v26 = a1:Cross(v25)
    return CFrame.fromMatrix(Vector3.new(), v25, v26, a1)
end
function tbl_upv_1.CFrameFromForwardUpVector3(a1, a2)
    --[[
      name: CFrameFromForwardUpVector3
      line: 311
    ]]
    local v27 = a1:Cross(a2)
    return CFrame.fromMatrix(Vector3.new(), v27, a2, -a1)
end
function tbl_upv_1.CFrameFromRightVector3(a1)
    --[[
      name: CFrameFromRightVector3
      line: 317
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v28 = tbl_upv_1.GetRandomicPerpendicularVectorBetween(Vector3.new(), a1)
    local v29 = -v28:Cross(a1)
    return CFrame.fromMatrix(Vector3.new(), a1, v28, v29)
end
function tbl_upv_1.FindPlaneLineIntersection(a1, a2, a3, a4)
    --[[
      name: FindPlaneLineIntersection
      line: 324
    ]]
    local v30 = a2 - a1
    local v31 = a4:Dot(v30)
    if math.abs(v31) <= 1e-06 then
        return nil
    end
    return a1 + (v30 * (-a4:Dot(a1 - a3) / v31))
end
function tbl_upv_1.MoveTowards(a1, a2, a3)
    --[[
      name: MoveTowards
      line: 341
    ]]
    local v32 = a2.x - a1.x
    local v33 = a2.y - a1.y
    local v34 = a2.z - a1.z
    local v35 = (v32 * v32) + (v33 * v33) + v34 * v34
    if v35 == 0 or a3 >= 0 and v35 <= a3 * a3 then
        return a2
    end
    local v36 = math.sqrt(v35)
    return (Vector3.new(a1.x + ((v32 / v36) * a3), a1.y + ((v33 / v36) * a3), a1.z + ((v34 / v36) * a3)))
end
function tbl_upv_1.MoveTowards2D(a1, a2, a3)
    --[[
      name: MoveTowards2D
      line: 359
    ]]
    local v37 = a2.x - a1.x
    local v38 = a2.y - a1.y
    local v39 = v37 * v37 + v38 * v38
    if v39 == 0 or a3 >= 0 and v39 <= a3 * a3 then
        return a2
    end
    local v40 = math.sqrt(v39)
    return (Vector3.new(a1.x + ((v37 / v40) * a3), a1.y + ((v38 / v40) * a3)))
end
function tbl_upv_1.SmoothDamp(a1, a2, a3, a4, a5, a6)
    --[[
      name: SmoothDamp
      line: 375
    ]]
    local v41 = math.max(1e-04, a4)
    local v42 = 2 / v41
    local v43 = v42 * a6
    local v44 = 1 / (((1 + v43) + ((0.48 * v43) * v43)) + (((0.235 * v43) * v43) * v43))
    local v45 = a1.X - a2.X
    local v46 = a1.Y - a2.Y
    local v47 = a1.Z - a2.Z
    local v48 = a5 * v41
    local v49 = (v45 * v45) + (v46 * v46) + v47 * v47
    if v48 * v48 < v49 then
        local v50 = math.sqrt(v49)
        v45 = v45 / v50 * v48
        v46 = v46 / v50 * v48
        v47 = v47 / v50 * v48
    end
    local v51 = Vector3.new(a1.x - v45, a1.y - v46, a1.z - v47)
    local v52 = (a3.X + (v42 * v45)) * a6
    local v53 = (a3.Y + (v42 * v46)) * a6
    local v54 = (a3.Z + (v42 * v47)) * a6
    local v55 = Vector3.new((a3.x - (v42 * v52)) * v44, (a3.y - (v42 * v53)) * v44, (a3.z - (v42 * v54)) * v44)
    local v56 = v51.X + (v45 + v52) * v44
    local v57 = v51.Y + (v46 + v53) * v44
    local v58 = v51.Z + (v47 + v54) * v44
    if (((a2.X - a1.X) * (v56 - a2.X)) + ((a2.Y - a1.Y) * (v57 - a2.Y))) + ((a2.Z - a1.Z) * (v58 - a2.Z)) <= 0 then
        a3 = v55
    else
        v56 = a2.X
        v57 = a2.Y
        v58 = a2.Z
        a3 = Vector3.new((a2.X - a2.x) / a6, (a2.Y - a2.y) / a6, (a2.Z - a2.z) / a6)
    end
    return Vector3.new(v56, v57, v58), a3
end
function tbl_upv_1.SmoothTremble(a1, a2, a3, a4, a5, a6)
    --[[
      name: SmoothTremble
      line: 434
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if time() - a4 > 0.06 then
        a4 = time()
        a3 = tbl_upv_1.RandomPointInArea3D(1) * a5
    end
    local v59, v60 = tbl_upv_1.SmoothDamp(a1, a3, a2, 0.05, math.huge, a6)
    return v59, v60, a3
end
function tbl_upv_1.ClampMagnitude(a1, a2)
    --[[
      name: ClampMagnitude
      line: 443
    ]]
    return ((a2 < a1.Magnitude) and (a1.Unit * a2)) or a1
end
function tbl_upv_1.AngleBetween(a1, a2)
    --[[
      name: AngleBetween
      line: 448
    ]]
    return (math.acos(math.clamp(a1.Unit:Dot(a2.Unit), -1, 1)))
end
function tbl_upv_1.AngleBetweenSigned(a1, a2, a3)
    --[[
      name: AngleBetweenSigned
      line: 453
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v61 = tbl_upv_1.AngleBetween(a1, a2)
    local v62 = math.sign(a3:Dot(a1:Cross(a2)))
    if v62 == 0 then
        v62 = 1
    end
    return v61 * v62
end
function tbl_upv_1.RotateVector3D(a1, a2, a3)
    --[[
      name: RotateVector3D
      line: 460
    ]]
    return CFrame.fromAxisAngle(a3, a2):VectorToWorldSpace(a1)
end
function tbl_upv_1.RotateCFrameAroundAxis(a1, a2, a3)
    --[[
      name: RotateCFrameAroundAxis
      line: 464
    ]]
    local v63 = CFrame.fromAxisAngle(a2, a3):ToObjectSpace(a1)
    return CFrame.fromMatrix(a1.Position, v63.XVector, v63.YVector, v63.ZVector)
end
function tbl_upv_1.RotateCFrameAroundPointAxis(a1, a2, a3, a4)
    --[[
      name: RotateCFrameAroundPointAxis
      line: 470
    ]]
    local v64 = ((math.abs(a3:Dot(Vector3.new(0, 0, 1))) ~= 1) and Vector3.new(0, 0, 1)) or Vector3.new(0, 1, 0)
    local Unit_1 = v64:Cross(a3).Unit
    local v65 = CFrame.fromMatrix(a2, Unit_1, a3, -a3:Cross(Unit_1))
    local v66 = v65:inverse() * a1
    return (v65 * CFrame.Angles(0, a4, 0)) * v66
end
function tbl_upv_1.RotateVectorAroundPointAxis(a1, a2, a3, a4)
    --[[
      name: RotateVectorAroundPointAxis
      line: 479
    ]]
    return a2 + CFrame.fromAxisAngle(a3, a4):VectorToWorldSpace(a1 - a2)
end
function tbl_upv_1.RotateVectorTowards(a1, a2, a3)
    --[[
      name: RotateVectorTowards
      line: 483
    ]]
    local Unit_2 = a1:Cross(a2):Cross(a1).Unit
    return math.cos(a3) * a1 + (math.sin(a3) * Unit_2)
end
function tbl_upv_1.RotateVectorTowardsClamped(a1, a2, a3)
    --[[
      name: RotateVectorTowardsClamped
      line: 488
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v67 = math.min(tbl_upv_1.AngleBetween(a1, a2), a3)
    local Unit_3 = a1:Cross(a2):Cross(a1).Unit
    return math.cos(v67) * a1 + (math.sin(v67) * Unit_3)
end
function tbl_upv_1.Reflect(a1, a2)
    --[[
      name: Reflect
      line: 497
    ]]
    local v68 = -2 * a2:Dot(a1)
    return (Vector3.new((v68 * a2.X) + a1.X, (v68 * a2.Y) + a1.Y, (v68 * a2.Z) + a1.Z))
end
function tbl_upv_1.PointIsInOBB(a1, a2, a3)
    --[[
      name: PointIsInOBB
      line: 503
    ]]
    local v69 = a2:PointToObjectSpace(a1)
    local v70 = a3 / 2
    local v71 = (math.abs(v69.X) < v70.X) and ((math.abs(v69.Y) < v70.Y) and (math.abs(v69.Z) < v70.Z))
    return v71
end
function tbl_upv_1.PointIsInAABB(a1, a2, a3)
    --[[
      name: PointIsInAABB
      line: 510
    ]]
    local v72 = a2 - a1
    local v73 = a3 / 2
    local v74 = (math.abs(v72.X) < v73.X) and ((math.abs(v72.Y) < v73.Y) and (math.abs(v72.Z) < v73.Z))
    return v74
end
function tbl_upv_1.KinematicVelocityToTarget(a1, a2, a3, a4)
    --[[
      name: KinematicVelocityToTarget
      line: 517
    ]]
    local v75 = Vector2.new(a2.X - a1.X, a2.Z - a1.Z)
    local v76 = math.sqrt((-2 * a4) * a3)
    warn(v76)
    local v77 = v75 / (math.sqrt((-2 * a3) / a4) + math.sqrt((2 * ((a2.Y - a1.Y) - a3)) / a4))
    return Vector3.new(v77.X, v76, v77.Y) * -math.sign(a4)
end
function tbl_upv_1.ClampedKinematicVelocityToTarget(a1, a2, a3, a4)
    --[[
      name: ClampedKinematicVelocityToTarget
      line: 528
    ]]
    local v78 = a2.Y - a1.Y
    local v79 = Vector2.new(a2.X - a1.X, a2.Z - a1.Z)
    a3 = math.max(a3, v78) + a3
    local v80 = math.sqrt((-2 * a4) * a3)
    local v81 = v79 / (math.sqrt((-2 * a3) / a4) + math.sqrt((2 * (v78 - a3)) / a4))
    return Vector3.new(v81.X, v80, v81.Y) * -math.sign(a4)
end
function tbl_upv_1.CalculateTrajectory(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: CalculateTrajectory
      line: 540
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v82 = a6 or (Vector3.new(0, -workspace.Gravity, 0))
    a7 = a7 or 3
    local tbl_3 = {a1}
    local v83 = 0
    local v84 = 1
    local v85 = 0
    local v86 = 1 / (a5 or 60)
    local v87 = false
    local v88, v89 = a2, a1
    repeat
        v88 = v88 + v82 * v86
        local v90 = v88 * v86
        v89 = v89 + v90
        table.insert(tbl_3, v89)
        v85 = v85 + 1
        if a7 <= v85 then
            v85 = 0
            local v91 = tbl_3[v84]
            local v92 = workspace:Raycast(v91, v89 - v91, a3)
            if v92 and v92.Instance then
                local v93 = nil
                for n_2 = 1, a7 do
                    local v94 = tbl_3[v84 + (n_2 - 1)]
                    v93 = workspace:Raycast(v94, tbl_3[v84 + n_2] - v94, a3)
                    if not (v93) then
                        continue
                    end
                    for n_3 = #tbl_3, 1, -1 do
                        v83 = v83 - tbl_upv_1.Distance(tbl_3[n_3], tbl_3[n_3] - 1)
                        if n_3 ~= v84 + n_2 then
                            table.remove(tbl_3, n_3)
                            continue
                        else
                            break
                        end
                    end
                    tbl_3[v84 + n_2] = v93.Position
                    break
                end
                v87 = true
            else
                v84 = #tbl_3
            end
        end
        if v87 then
            break
        end
        v83 = v83 + v90.Magnitude
    until (a4 or 800) <= v83
    return tbl_3, v83
end
function tbl_upv_1.GetCameraAdjustedAttackDirection(a1, a2, a3, a4, a5)
    --[[
      name: GetCameraAdjustedAttackDirection
      line: 610
    ]]
    local v95 = a2.Position + a3.CameraOffset + workspace.CurrentCamera.CFrame.LookVector * 100
    return (a2.CFrame * CFrame.Angles(-(math.atan((a2.CFrame.Y - v95.Y) / (a2.Position - v95).magnitude) * a5), (a2.Position - v95).Unit:Cross(a2.CFrame.LookVector).Y * a4, 0)).LookVector
end
function tbl_upv_1.WorldPositionToIndicator2D(a1, a2, a3)
    --[[
      name: WorldPositionToIndicator2D
      line: 626
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local CurrentCamera_1 = workspace.CurrentCamera
    local v96 = Vector2.new(a2, a2)
    local v97 = CurrentCamera_1.ViewportSize - v96
    local v98 = CurrentCamera_1.ViewportSize / 2
    local v99 = CurrentCamera_1:WorldToViewportPoint(a1)
    local v100 = nil
    local v101 = nil
    if v97.X < v99.X or v99.X < v96.X or v97.Y < v99.Y or v99.Y < v96.Y or v99.Z < 0 then
        local Unit_4 = CurrentCamera_1.CFrame:VectorToObjectSpace(a1 - CurrentCamera_1.CFrame.Position).Unit
        v101 = Vector2.new(Unit_4.X, Unit_4.Y).Unit
        if v101 == Vector2.new() then
            v101 = Vector2.new(0, 1)
        end
        v100 = tbl_upv_1.AngleBetweenSigned(Vector3.new(1, 0, 0), tbl_upv_1.ToVector3(v101, 0), Vector3.new(0, 0, -1))
        local v102 = v97.Y / 2
        local v103
        if v102 >= math.abs(((v101 * v97.Magnitude) / 2).Y) then
            v103 = v101 * math.abs((v97.X / 2) / v101.X)
        else
            v103 = v101 * math.abs(v102 / v101.Y)
        end
        v99 = v98 + Vector2.new(v103.X, -v103.Y)
    end
    v99 = Vector2.new(math.clamp(v99.X, v96.X, v97.X), math.clamp(v99.Y, v96.Y, v97.Y))
    local v104 = UDim2.new(0, v99.X, 0, v99.Y)
    if not v101 then
        return v104
    end
    local v105 = v99 + Vector2.new(v101.X, -v101.Y) * a3
    return v104, UDim2.new(0, v105.X, 0, v105.Y), (math.deg(v100))
end
function tbl_upv_1.GetRandomPointInSquare(a1, a2, a3)
    --[[
      name: GetRandomPointInSquare
      line: 679
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v106 = Vector2.new(a2, a3) / 2
    return (Vector3.new(u1:NextNumber(a1.X - v106.X, a1.X + v106.X), a1.Y, u1:NextNumber(a1.Z - v106.Y, a1.Z + v106.Y)))
end
function tbl_upv_1.GetSlopeDirection(a1)
    --[[
      name: GetSlopeDirection
      line: 689
    ]]
    if a1 ~= Vector3.new(0, 1, 0) and a1 ~= Vector3.new() then
        return (Vector3.new(0, 1, 0)):Cross(a1):Cross(a1)
    end
    return (Vector3.new())
end
function tbl_upv_1.VectorToAngle(a1)
    --[[
      name: VectorToAngle
      line: 697
    ]]
    return (Vector3.new(CFrame.new(Vector3.new(), a1):ToEulerAnglesYXZ()))
end
function tbl_upv_1.VectorIsBetween(a1, a2, a3)
    --[[
      name: VectorIsBetween
      line: 701
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v107 = tbl_upv_1.Distance(a2, a3)
    local v108 = math.abs((tbl_upv_1.Distance(a1, a2) + tbl_upv_1.Distance(a1, a3)) - v107) < 0.1
    return v108
end
function tbl_upv_1.IntersectionPointsOnCircle2D(a1, a2, a3, a4)
    --[[
      name: IntersectionPointsOnCircle2D
      line: 706
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v109 = Vector3.new(a2.X - a1.X, 0, a2.Z - a1.Z)
    local tbl_4 = {}
    local v110 = v109.X * v109.X + v109.Z * v109.Z
    local v111 = 2 * ((v109.X * (a1.X - a3.X)) + (v109.Z * (a1.Z - a3.Z)))
    local v112 = v111 * v111 - (4 * v110) * (((((a3.X * a3.X) + (a3.Z * a3.Z)) + ((a1.X * a1.X) + (a1.Z * a1.Z))) - (2 * ((a3.X * a1.X) + (a3.Z * a1.Z)))) - (a4 * a4))
    if math.abs(v110) >= 1e-08 and v112 >= 0 then
        local v113 = (-v111 + math.sqrt(v112)) / (2 * v110)
        local v114 = (-v111 - math.sqrt(v112)) / (2 * v110)
        local v115 = Vector3.new(a1.X + (v113 * (a2.X - a1.X)), a3.Y, a1.Z + (v113 * (a2.Z - a1.Z)))
        local v116 = Vector3.new(a1.X + (v114 * (a2.X - a1.X)), a3.Y, a1.Z + (v114 * (a2.Z - a1.Z)))
        if tbl_upv_1.VectorIsBetween(v115, a1, a2) then
            table.insert(tbl_4, v115)
        end
        if tbl_upv_1.VectorIsBetween(v116, a1, a2) then
            table.insert(tbl_4, v116)
        end
        if #tbl_4 ~= 0 then
            return tbl_4
        end
        return nil
    end
    warn("No interception")
    return nil
end
function tbl_upv_1.EllipseLineInterception2D(a1, a2, a3, a4, a5)
    --[[
      name: EllipseLineInterception2D
      line: 745
    ]]
    local v117 = Vector2.new((a3.X - (a1 / 2)) + (a1 / 2), (a3.Y - (a2 / 2)) + (a2 / 2))
    a4 = a4 - v117
    a5 = a5 - v117
    local v118 = a1 / 2
    local v119 = a2 / 2
    local v120 = a5.X - a4.X
    local v121 = a5.Y - a4.Y
    local v122 = (((a5.X - a4.X) * v120) / v118) / v118 + (((a5.Y - a4.Y) * (a5.Y - a4.Y)) / v119) / v119
    local v123 = (((2 * a4.X) * v120) / v118) / v118 + (((2 * a4.Y) * v121) / v119) / v119
    local tbl_5 = {}
    local v124 = v123 * v123 - (4 * v122) * (((((a4.X * a4.X) / v118) / v118) + (((a4.Y * a4.Y) / v119) / v119)) - 1)
    if v124 == 0 then
        table.insert(tbl_5, (-v123 / 2) / v122)
    elseif v124 > 0 then
        table.insert(tbl_5, ((-v123 + math.sqrt(v124)) / 2) / v122)
        table.insert(tbl_5, ((-v123 - math.sqrt(v124)) / 2) / v122)
    end
    local tbl_6 = {}
    for _, value_1 in ipairs(tbl_5) do
        if value_1 < 0 then
            continue
        end
        if value_1 <= 1 then
            table.insert(tbl_6, Vector2.new((a4.X + (v120 * value_1)) + v117.X, (a4.Y + (v121 * value_1)) + v117.Y))
        end
    end
    return tbl_6
end
function tbl_upv_1.InfiniteLineSphereIntersection(a1, a2, a3, a4)
    --[[
      name: InfiniteLineSphereIntersection
      line: 788
    ]]
    local u2 = a1
    local u3 = a2.X - u2.X
    local u4 = a2.Y - u2.Y
    local u5 = a2.Z - u2.Z
    local v125 = u2.X - a3.X
    local v126 = u2.Y - a3.Y
    local v127 = u2.Z - a3.Z
    local function Parametize(a5)
        --[[
          name: Parametize
          line: 799
          upvalues:
            u2 (copy, index: 1)
            u3 (copy, index: 2)
            u4 (copy, index: 3)
            u5 (copy, index: 4)
        ]]
        return (Vector3.new(u2.X + (a5 * u3), u2.Y + (a5 * u4), u2.Z + (a5 * u5)))
    end
    local v128 = (u3 * u3) + (u4 * u4) + u5 * u5
    local v129 = 2 * (((u3 * v125) + (u4 * v126)) + (u5 * v127))
    local v130 = v129 * v129 - (4 * v128) * ((((v125 * v125) + (v126 * v126)) + (v127 * v127)) - (a4 * a4))
    if v130 >= 0 then
        if v130 == 0 then
            local v131 = -v129 / 2 * v128
            return (Vector3.new(u2.X + (v131 * u3), u2.Y + (v131 * u4), u2.Z + (v131 * u5)))
        elseif v130 > 0 then
            local v132 = 2 * v128
            local v133 = (-v129 - math.sqrt(v130)) / v132
            local v134 = Vector3.new(u2.X + (v133 * u3), u2.Y + (v133 * u4), u2.Z + (v133 * u5))
            local v135 = (-v129 + math.sqrt(v130)) / v132
            return v134, (Vector3.new(u2.X + (v135 * u3), u2.Y + (v135 * u4), u2.Z + (v135 * u5)))
        end
    else
        return nil
    end
end
function tbl_upv_1.InfiniteLineLineIntersection(a1, a2, a3, a4)
    --[[
      name: InfiniteLineLineIntersection
      line: 822
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v136 = a1 - a3
    local v137 = a4 - a3
    if tbl_upv_1.SqrMagnitude(v137) < 1e-06 then
        return nil
    end
    local v138 = a2 - a1
    if tbl_upv_1.SqrMagnitude(v138) < 1e-06 then
        return nil
    end
    local v139 = v136:Dot(v137)
    local v140 = v137:Dot(v138)
    local v141 = v136:Dot(v138)
    local v142 = v137:Dot(v137)
    local v143 = v138:Dot(v138) * v142 - v140 * v140
    if math.abs(v143) < 1e-06 then
        return nil
    end
    local v144 = ((v139 * v140) - (v141 * v142)) / v143
    local v145 = (v139 + (v140 * v144)) / v142
    return Vector3.new(a1.X + (v144 * v138.X), a1.Y + (v144 * v138.Y), a1.Z + (v144 * v138.Z)), (Vector3.new(a3.X + (v145 * v137.X), a3.Y + (v145 * v137.Y), a3.Z + (v145 * v137.Z)))
end
function tbl_upv_1.GetPartBoundsInSlash(a1, a2, a3, a4, a5)
    --[[
      name: GetPartBoundsInSlash
      line: 867
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local tbl_7 = {}
    local tbl_8 = {}
    for _, value_2 in pairs(a5.FilterDescendantsInstances) do
        table.insert(tbl_8, value_2)
    end
    local v146 = a3.Y / 2
    local v147 = a3.Y / a4
    for n_4 = 1, a4 do
        local v148 = n_4 - 1 + 0.5
        local v149 = a1.Position + (a1.UpVector * v146) - a1.UpVector * (v147 * v148)
        local v150 = a2.Position + (a2.UpVector * v146) - a2.UpVector * (v147 * v148)
        local v151 = OverlapParams.new()
        v151.FilterDescendantsInstances = tbl_8
        v151.FilterType = a5.FilterType
        v151.CollisionGroup = a5.CollisionGroup
        local v152 = tbl_upv_1.Direction(v149, v150)
        local v153 = tbl_upv_1.CFrameFromForwardUpVector3(v152, v152:Cross((a1.UpVector + a2.UpVector).Unit).Unit:Cross(v152))
        for _, value_3 in pairs(workspace:GetPartBoundsInBox(CFrame.new((v149 + v150) / 2) * v153, Vector3.new(a3.X, v147, tbl_upv_1.Distance(v149, v150)), v151)) do
            table.insert(tbl_7, value_3)
            if v151.FilterType ~= Enum.RaycastFilterType.Blacklist then
                table.remove(tbl_8, table.find(tbl_8, value_3))
            else
                table.insert(tbl_8, value_3)
            end
        end
    end
    return tbl_7
end
function tbl_upv_1.IsPointInPolygon2D(a1, a2)
    --[[
      name: IsPointInPolygon2D
      line: 931
    ]]
    local v154 = false
    local v155 = #a2
    for n_5 = 1, #a2 do
        local v156 = a1.Y < a2[n_5].Y
        if v156 ~= (a1.Y < a2[v155].Y) and a1.X < (((a2[v155].X - a2[n_5].X) * (a1.Y - a2[n_5].Y)) / (a2[v155].Y - a2[n_5].Y)) + a2[n_5].X then
            v154 = not v154
        end
        v155 = n_5
    end
    return v154
end
function tbl_upv_1.GenerateRegularPolygon2D(a1, a2, a3, a4)
    --[[
      name: GenerateRegularPolygon2D
      line: 945
    ]]
    a4 = a4 or 0
    local tbl_9 = {}
    for n_6 = 1, a2 do
        tbl_9[n_6] = Vector2.new(a1.X + (a3 * math.cos(((math.tau * n_6) / a2) + math.rad(a4))), a1.Y + (a3 * math.sin(((math.tau * n_6) / a2) + math.rad(a4))))
    end
    tbl_9[a2 + 1] = tbl_9[1]
    return tbl_9
end
function tbl_upv_1.GetProjectilesIntersectionPoint(a1, a2, a3, a4, a5)
    --[[
      name: GetProjectilesIntersectionPoint
      line: 955
    ]]
    local v157 = a5 - a2
    return a4 + (FirstOrderInterceptTime(a3, a4 - a1, v157) * v157)
end
function FirstOrderInterceptTime(a1, a2, a3)
    --[[
      name: FirstOrderInterceptTime
      line: 961
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v158 = tbl_upv_1.SqrMagnitude(a3)
    if v158 < 0.001 then
        return 0
    end
    local v159 = v158 - a1 * a1
    if math.abs(v159) < 0.001 then
        return (math.max(-tbl_upv_1.SqrMagnitude(a2) / (2 * a3:Dot(a2)), 0))
    end
    local v160 = 2 * a3:Dot(a2)
    local v161 = v160 * v160 - (4 * v159) * tbl_upv_1.SqrMagnitude(a2)
    local v162 = nil
    if v161 <= 0 then
        if v161 >= 0 then
            return (math.max(-v160 / (2 * v159), 0))
        end
        return 0
    else
        v162 = (-v160 + math.sqrt(v161)) / (2 * v159)
        local v163 = (-v160 - math.sqrt(v161)) / (2 * v159)
        if v162 <= 0 then
            return (math.max(v163, 0))
        elseif v163 <= 0 then
            return v162
        else
            return (math.min(v162, v163))
        end
    end
end
function tbl_upv_1.PoissonDiskSampling2D(a1, a2, a3, a4)
    --[[
      name: PoissonDiskSampling2D
      line: 997
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v166 = (function(a5, a6, a7, a8)
        --[[
          name: GetSettings
          line: 998
        ]]
        local v164 = a6 - a5
        local v165 = a7 * 0.70710678118
        local tbl_10 = {}
        tbl_10.BottomLeft = a5
        tbl_10.TopRight = a6
        tbl_10.Center = (a5 + a6) * 0.5
        tbl_10.Dimension = Rect.new(a5, a6)
        tbl_10.MinimumDistance = a7
        tbl_10.IterationPerPoint = a8
        tbl_10.CellSize = v165
        tbl_10.GridWidth = math.ceil(v164.X / v165)
        tbl_10.GridHeight = math.ceil(v164.Y / v165)
        return tbl_10
    end)(a1, a2, a3, a4)
    local tbl_11 = {}
    for n_7 = 1, v166.GridWidth + 1 do
        tbl_11[n_7] = {}
        local v167 = n_7
    end
    local tbl_12 = {}
    tbl_12.Grid = tbl_11
    tbl_12.SamplePoints = {}
    tbl_12.ActivePoints = {}
    local v168 = Vector2.new(u1:NextNumber(v166.BottomLeft.X, v166.TopRight.X), u1:NextNumber(v166.BottomLeft.Y, v166.TopRight.Y))
    local v167 = GetGridIndex(v168, v166)
    tbl_12.Grid[v167.X][v167.Y] = v168
    table.insert(tbl_12.SamplePoints, v168)
    table.insert(tbl_12.ActivePoints, v168)
    local v169
    repeat
        local v170 = u1:NextInteger(1, #tbl_12.ActivePoints)
        local v171 = tbl_12.ActivePoints[v170]
        v169 = false
        local v172 = nil
        local v173 = v169
        for n_8 = 1, v166.IterationPerPoint do
            v172 = GetNextPoint(v171, v166, tbl_12)
            if v172 then
                v173 = v172
            else
                local v174
                v174, v173 = n_8, v172
                -- NumForNext n_8 = v174 + v176 (limit v175)
                --[[ goto label_6 ]]--
            end
            if not (v173) then
                table.remove(tbl_12.ActivePoints, v170)
            end
        end
    until #tbl_12.ActivePoints == 0
    return tbl_12.SamplePoints
end
function GetNextPoint(a1, a2, a3)
    --[[
      name: GetNextPoint
      line: 1059
      upvalues:
        u1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local function GetRandPosInCircle(a4, a5)
        --[[
          name: GetRandPosInCircle
          line: 1060
          upvalues:
            u1 (copy, index: 1)
        ]]
        local v177 = u1:NextNumber(0, math.tau)
        local v178 = math.sqrt(u1:NextNumber(a4 * a4, a5 * a5))
        return Vector2.new(v178 * math.cos(v177), v178 * math.sin(v177))
    end
    local function RectContains(a6, a7)
        --[[
          name: RectContains
          line: 1067
        ]]
        return (a6.Min.X < a7.X) and ((a7.X < a6.Max.X) and ((a6.Min.Y < a7.Y) and (a7.Y < a6.Max.Y)))
    end
    local v179 = false
    local v180 = a2.MinimumDistance
    local v181 = 2 * a2.MinimumDistance
    local v182 = u1:NextNumber(0, math.tau)
    local v183 = math.sqrt(u1:NextNumber(v180 * v180, v181 * v181))
    local v184 = Vector2.new(v183 * math.cos(v182), v183 * math.sin(v182)) + a1
    v180 = a2.Dimension
    if v180.Min.X >= v184.X or v184.X >= v180.Max.X or v180.Min.Y >= v184.Y or v184.Y >= v180.Max.Y then
        return false
    end
    local v185 = GetGridIndex(v184, a2)
    v181 = false
    local v186 = Vector2.new(math.max(1, v185.X - 2), math.max(1, v185.Y - 2))
    local v187 = Vector2.new(math.min(a2.GridWidth, v185.X + 2), math.min(a2.GridHeight, v185.Y + 2))
    for n_9 = v186.X, v187.X do
        local v188 = nil
        if v181 then
            break
        end
        for n_10 = v186.Y, v187.Y do
            v188 = a3.Grid[n_9][n_10]
            if (v188) and tbl_upv_1.SqrMagnitude2D(v188 - v184) <= a2.MinimumDistance * a2.MinimumDistance then
                break
            end
        end
    end
    if v181 == false then
        local v189 = true
        table.insert(a3.SamplePoints, v184)
        table.insert(a3.ActivePoints, v184)
        a3.Grid[v185.X][v185.Y] = v184
        v179 = v189
    end
    return v179
end
function GetGridIndex(a1, a2)
    --[[
      name: GetGridIndex
      line: 1111
    ]]
    return Vector2.new(math.floor((a1.X - a2.BottomLeft.X) / a2.CellSize) + 1, math.floor((a1.Y - a2.BottomLeft.Y) / a2.CellSize) + 1)
end
function tbl_upv_1.GetVelocityAtPoint(a1, a2)
    --[[
      name: GetVelocityAtPoint
      line: 1118
    ]]
    return a1.Velocity + a1.RotVelocity:Cross(a2 - a1.Position)
end
function tbl_upv_1.ConvertCFrame(a1, a2, a3)
    --[[
      name: ConvertCFrame
      line: 1122
    ]]
    return a3 * a2:toObjectSpace(a1)
end
return tbl_upv_1