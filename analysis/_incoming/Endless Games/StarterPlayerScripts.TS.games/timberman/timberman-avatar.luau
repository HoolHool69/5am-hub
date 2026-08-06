-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "keyframe-track")
local buildPoseTrack_upv_1 = v1.buildPoseTrack
local findKeyframeSpan_upv_1 = v1.findKeyframeSpan
local samplePoseAt_upv_1 = v1.samplePoseAt
local TIMBERMAN_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "timberman-config").TIMBERMAN_CONFIG
local u1 = CFrame.new()
local tbl_upv_1 = {{}, {}, {}, {}, {}, {}}
local function prepareAxePart_1(a1)
    --[[
      name: prepareAxePart
      line: 65
    ]]
    a1.Anchored = false
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = false
    a1.Massless = true
end
local function findNamed_upv_1(a1, a2, a3)
    --[[
      name: findNamed
      line: 57
    ]]
    for _, value_1 in a1:GetChildren() do
        if value_1.Name ~= a2 or not (value_1:IsA(a3)) then
            continue
        end
        return value_1
    end
    return nil
end
local function stripJoints_upv_1(a1)
    --[[
      name: stripJoints
      line: 74
    ]]
    for _, value_2 in a1:GetChildren() do
        if value_2:IsA("JointInstance") then
            value_2:Destroy()
        end
    end
end
local function measureBodyYaw_upv_1(a1, a2)
    --[[
      name: measureBodyYaw
      line: 150
      upvalues:
        findNamed_upv_1 (copy, index: 1)
        samplePoseAt_upv_1 (copy, index: 2)
    ]]
    local HumanoidRootPart_1 = a1.model:FindFirstChild("HumanoidRootPart")
    local v2
    if HumanoidRootPart_1 == nil then
        v2 = nil
    else
        v2 = findNamed_upv_1(HumanoidRootPart_1, "RootJoint", "Motor6D")
    end
    local v3 = samplePoseAt_upv_1(a2, "Torso", {})
    if v2 ~= nil and v3 ~= nil then
        local LookVector_1 = ((v2.C0 * v3) * v2.C1:Inverse()).LookVector
        return (math.atan2(-LookVector_1.X, -LookVector_1.Z))
    end
    return 0
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 175
    ]]
    return "TimbermanAvatar"
end
local u2 = setmetatable(tbl_2, tbl_3)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 180
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u2)
    return v4:constructor(...) or v4
end
local function buildAxeAssembly_upv_1(a1, a2, a3)
    --[[
      name: buildAxeAssembly
      line: 88
      upvalues:
        findNamed_upv_1 (copy, index: 1)
        stripJoints_upv_1 (copy, index: 2)
    ]]
    local v5 = a1:FindFirstChild("Right Arm")
    local v6 = nil
    if v5 ~= nil then
        v6 = findNamed_upv_1(v5, "RightHandle", "Motor6D")
        local v7
        if v6 == nil then
            v7 = v6
        else
            v7 = v6.Part1
        end
        if v6 ~= nil then
            local v8 = nil
            if v7 ~= nil then
                v8 = findNamed_upv_1(v7, "Union", "Motor6D")
                local v9
                if v8 == nil then
                    v9 = v8
                else
                    v9 = v8.Part1
                end
                if v8 ~= nil and v9 ~= nil then
                    local v10 = v7:Clone()
                    stripJoints_upv_1(v10)
                    v10.Anchored = false
                    v10.CanCollide = false
                    v10.CanQuery = false
                    v10.CanTouch = false
                    v10.CastShadow = false
                    v10.Massless = true
                    v10.Transparency = 1
                    v10.Name = (a3 and "TimbermanAxeHandleLeft") or "TimbermanAxeHandleRight"
                    local v11 = v9:Clone()
                    stripJoints_upv_1(v11)
                    v11.Anchored = false
                    v11.CanCollide = false
                    v11.CanQuery = false
                    v11.CanTouch = false
                    v11.CastShadow = false
                    v11.Massless = true
                    v11.Name = (a3 and "TimbermanAxeBladeLeft") or "TimbermanAxeBladeRight"
                    local v12 = Instance.new("Motor6D")
                    v12.Part0 = a2
                    v12.Part1 = v10
                    local v13
                    if a3 then
                        local v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25 = v6.C0:GetComponents()
                        v13 = CFrame.new(-v14, v15, v16, v17, -v18, -v19, -v20, v21, v22, -v23, v24, v25)
                    else
                        v13 = v6.C0
                    end
                    v12.C0 = v13
                    if a3 then
                        local v26, v27, v28 = nil, nil, nil
                        local v29, v26, v27, v30, v28, v31, v32, v33, v34, v35, v36, v37 = v6.C1:GetComponents()
                        v13 = CFrame.new(-v29, v26, v27, v30, -v28, -v31, -v32, v33, v34, -v35, v36, v37)
                    else
                        v13 = v6.C1
                    end
                    v12.C1 = v13
                    v12.Parent = a2
                    v13 = Instance.new("Motor6D")
                    v13.Part0 = v10
                    v13.Part1 = v11
                    local v38
                    if a3 then
                        local v39, v40, v41, v42, v43 = nil, nil, nil, nil, nil
                        local v44, v39, v45, v46, v47, v40, v48, v41, v42, v49, v43, v50 = v8.C0:GetComponents()
                        v38 = CFrame.new(-v44, v39, v45, v46, -v47, -v40, -v48, v41, v42, -v49, v43, v50)
                    else
                        v38 = v8.C0
                    end
                    v13.C0 = v38
                    if a3 then
                        local v51, v52, v53, v54, v55, v56, v57 = nil, nil, nil, nil, nil, nil, nil
                        local v58, v59, v51, v52, v60, v53, v54, v55, v56, v57, v61, v62 = v8.C1:GetComponents()
                        v38 = CFrame.new(-v58, v59, v51, v52, -v60, -v53, -v54, v55, v56, -v57, v61, v62)
                    else
                        v38 = v8.C1
                    end
                    v13.C1 = v38
                    v13.Parent = v10
                    v38 = a2:FindFirstAncestorOfClass("Model")
                    v10.Parent = v38 or a2
                    v11.Parent = v38 or a2
                    local tbl_4 = {}
                    tbl_4.handleJoint = v12
                    tbl_4.blade = v11
                    return tbl_4
                end
                return nil
            end
        end
    end
    return nil
end
u2.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 184
      upvalues:
        buildPoseTrack_upv_1 (copy, index: 1)
        measureBodyYaw_upv_1 (copy, index: 2)
        buildAxeAssembly_upv_1 (copy, index: 3)
    ]]
    a1.rig = a2
    a1.writtenPose = {}
    a1.blendFromPose = {}
    a1.side = "right"
    a1.mode = "idle"
    a1.playhead = 0
    a1.blendRemaining = 0
    a1.squashed = false
    a1.swingSpeed = 1
    a1.impactPending = false
    a1.idleTrack = buildPoseTrack_upv_1(a3.rightIdle)
    a1.swingTrack = buildPoseTrack_upv_1(a3.rightSwing)
    a1.bodyYaw = measureBodyYaw_upv_1(a1.rig, a1.idleTrack)
    local v63 = a1.rig.model:FindFirstChild("Right Arm")
    local v64 = a1.rig.model:FindFirstChild("Left Arm")
    if v63 ~= nil and v63:IsA("BasePart") then
        a1.rightAssembly = buildAxeAssembly_upv_1(a3.rig, v63, false)
    end
    if v64 ~= nil and v64:IsA("BasePart") then
        a1.leftAssembly = buildAxeAssembly_upv_1(a3.rig, v64, true)
    end
    if a1.rightAssembly == nil or a1.leftAssembly == nil then
        warn("[Timberman] axe assembly build failed \226\128\148 the chopper animates bare-handed")
    end
    a1:applyAssemblyVisibility()
end
u2.pivotTo = function(a1, a2)
    --[[
      name: pivotTo
      line: 211
    ]]
    a1.rig:pivotTo(a2)
end
u2.standingPivot = function(a1, a2)
    --[[
      name: standingPivot
      line: 214
    ]]
    local v65
    if a1.side ~= "right" then
        v65 = a1.bodyYaw
    else
        v65 = -a1.bodyYaw
    end
    return a2 * CFrame.Angles(0, v65, 0)
end
u2.setSide = function(a1, a2)
    --[[
      name: setSide
      line: 220
    ]]
    if a1.side ~= a2 then
        a1.side = a2
        a1:applyAssemblyVisibility()
        a1:beginBlend()
    else
        return nil
    end
end
u2.chop = function(a1, a2)
    --[[
      name: chop
      line: 228
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.mode = "swing"
    a1.playhead = TIMBERMAN_CONFIG_upv_1.swingImpactTime
    a1.blendRemaining = 0
    a1.impactPending = true
    a1.swingSpeed = math.max(a1.swingTrack.length - TIMBERMAN_CONFIG_upv_1.swingImpactTime, 0.001) / math.max(a2, 0.001)
end
u2.setSquashed = function(a1, a2)
    --[[
      name: setSquashed
      line: 238
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.squashed ~= a2 then
        a1.squashed = a2
        if a2 then
            a1.rig:clearPose()
            if a1.rightAssembly ~= nil then
                a1.rightAssembly.handleJoint.Transform = u1
            end
            if a1.leftAssembly ~= nil then
                a1.leftAssembly.handleJoint.Transform = u1
            end
            table.clear(a1.writtenPose)
        else
            a1.mode = "idle"
            a1.playhead = 0
            a1:beginBlend()
        end
    else
        return nil
    end
end
u2.update = function(a1, a2)
    --[[
      name: update
      line: 258
    ]]
    if a1.squashed then
        return nil
    end
    if a1.mode == "swing" then
        if a1.impactPending then
            a1.impactPending = false
        else
            a1.playhead = a1.playhead + (a2 * a1.swingSpeed)
        end
        if a1.swingTrack.length <= a1.playhead then
            a1.mode = "idle"
            a1.playhead = 0
            a1:beginBlend()
        end
    elseif a1.idleTrack.length > 0 then
        a1.playhead = (a1.playhead + a2) % a1.idleTrack.length
    end
    if a1.blendRemaining > 0 then
        a1.blendRemaining = math.max(a1.blendRemaining - a2, 0)
    end
    a1:applyPose()
end
u2.beginBlend = function(a1)
    --[[
      name: beginBlend
      line: 283
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    table.clear(a1.blendFromPose)
    for key_1, value_3 in a1.writtenPose do
        a1.blendFromPose[key_1] = value_3
    end
    a1.blendRemaining = TIMBERMAN_CONFIG_upv_1.poseCrossfadeSeconds
end
u2.applyPose = function(a1)
    --[[
      name: applyPose
      line: 290
      upvalues:
        findKeyframeSpan_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        samplePoseAt_upv_1 (copy, index: 3)
    ]]
    local v66 = a1.side ~= "right"
    local v67
    if a1.mode ~= "swing" then
        v67 = a1.idleTrack
    else
        v67 = a1.swingTrack
    end
    local v68 = findKeyframeSpan_upv_1(v67, a1.playhead)
    local v69 = nil
    local v70 = nil
    local v71 = nil
    for v72, value_4 in tbl_upv_1 do
        if v66 then
            v69 = value_4.mirroredPose
        else
            v69 = value_4.authoredPose
        end
        v71 = samplePoseAt_upv_1(v67, v69, v68)
        if v71 == nil then
            continue
        end
        if v66 then
            local v69, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83 = v71:GetComponents()
            v70 = CFrame.new(-v69, v73, v74, v75, -v76, -v77, -v78, v79, v80, -v81, v82, v83)
        else
            v70 = v71
        end
        a1.rig:setJointTransform(value_4.joint, a1:blend(value_4.joint, v70))
    end
    local v84 = samplePoseAt_upv_1(v67, "RightHandle", v68)
    local v85
    if v66 then
        v85 = a1.leftAssembly
    else
        v85 = a1.rightAssembly
    end
    if v84 == nil then
        return
    end
    if v85 ~= nil then
        local v86
        if v66 then
            local v87, v88, v89, v90, v91, v92, v93
            local v72, value_4
            v72, value_4, v71, v70, v69, v87, v88, v89, v90, v91, v92, v93 = v84:GetComponents()
            v86 = CFrame.new(-v72, value_4, v71, v70, -v69, -v87, -v88, v89, v90, -v91, v92, v93)
        else
            v86 = v84
        end
        v85.handleJoint.Transform = a1:blend("AxeHandle", v86)
    end
end
u2.blend = function(a1, a2, a3)
    --[[
      name: blend
      line: 309
      upvalues:
        TIMBERMAN_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v94, v95 = nil, nil
    if a1.blendRemaining <= 0 then
        v95 = a3
    else
        v94 = a1.blendFromPose[a2]
        if v94 == nil then
            v95 = a3
        else
            v95 = v94:Lerp(a3, 1 - (a1.blendRemaining / TIMBERMAN_CONFIG_upv_1.poseCrossfadeSeconds))
        end
    end
    a1.writtenPose[a2] = v95
    return v95
end
u2.applyAssemblyVisibility = function(a1)
    --[[
      name: applyAssemblyVisibility
      line: 326
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v96 = a1.side ~= "right"
    if a1.rightAssembly ~= nil then
        a1.rightAssembly.blade.Transparency = (v96 and 1) or 0
        if v96 then
            a1.rightAssembly.handleJoint.Transform = u1
        end
    end
    if a1.leftAssembly == nil then
        return
    end
    a1.leftAssembly.blade.Transparency = (v96 and 0) or 1
    if (v96) then
        return
    end
    a1.leftAssembly.handleJoint.Transform = u1
end
local tbl_5 = {}
tbl_5.mirrorPoseAcrossYZ = function(a1)
    --[[
      name: mirrorPoseAcrossYZ
      line: 25
    ]]
    local v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108 = a1:GetComponents()
    return CFrame.new(-v97, v98, v99, v100, -v101, -v102, -v103, v104, v105, -v106, v107, v108)
end
tbl_5.TimbermanAvatar = u2
return tbl_5