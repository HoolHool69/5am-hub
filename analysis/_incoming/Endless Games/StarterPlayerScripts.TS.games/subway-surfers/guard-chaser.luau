-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local adoptAvatar_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "avatar-rig").adoptAvatar
local makeStagePart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeStagePart
local u1 = CFrame.new(0, -1000, 0)
local function applyTuckPose_1(a1)
    --[[
      name: applyTuckPose
      line: 30
    ]]
    if a1:supportsJoint("LeftHip") then
        a1:setJointTransform("LeftHip", CFrame.Angles(0.9, 0, 0))
        a1:setJointTransform("RightHip", CFrame.Angles(0.9, 0, 0))
        a1:setJointTransform("LeftKnee", CFrame.Angles(1.2, 0, 0))
        a1:setJointTransform("RightKnee", CFrame.Angles(1.2, 0, 0))
        a1:setJointTransform("Waist", CFrame.Angles(0.3141592653589793, 0, 0))
    else
        return nil
    end
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 50
    ]]
    return "GuardChaser"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 55
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 59
    ]]
end
u2.build = function(a1, a2, a3)
    --[[
      name: build
      line: 61
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        adoptAvatar_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v2 = makeStagePart_upv_1(a2)
    v2.Size = Vector3.new(2.4000000953674316, 3, 1.7999999523162842)
    v2.Color = Color3.fromRGB(120, 40, 40)
    local v3 = makeStagePart_upv_1(a2)
    v3.Size = Vector3.new(1.399999976158142, 1.399999976158142, 1.399999976158142)
    v3.Color = Color3.fromRGB(160, 120, 90)
    a1.fallbackBody = v2
    a1.fallbackHead = v3
    local function onAdopted_1(a4)
        --[[
          name: onAdopted
          line: 75
          upvalues:
            a1 (copy, index: 1)
            u1 (copy, index: 2)
        ]]
        a1.rig = a4
        if a1.fallbackBody ~= nil then
            a1.fallbackBody.CFrame = u1
        end
        if a1.fallbackHead == nil then
            return
        end
        a1.fallbackHead.CFrame = u1
    end
    adoptAvatar_upv_1({container = a2, janitor = a3, onAdopted = onAdopted_1})
end
local function applyRunPose_upv_1(a1, a2)
    --[[
      name: applyRunPose
      line: 15
    ]]
    if a1:supportsJoint("LeftHip") then
        local v4 = math.sin(a2) * 0.7
        local v5 = math.sin(a2) * 0.5
        a1:setJointTransform("LeftHip", CFrame.Angles(v4, 0, 0))
        a1:setJointTransform("RightHip", CFrame.Angles(-v4, 0, 0))
        a1:setJointTransform("LeftKnee", CFrame.Angles(math.max(-v4, 0) * 1.2, 0, 0))
        a1:setJointTransform("RightKnee", CFrame.Angles(math.max(v4, 0) * 1.2, 0, 0))
        a1:setJointTransform("LeftShoulder", CFrame.Angles(-v5, 0, 0))
        a1:setJointTransform("RightShoulder", CFrame.Angles(v5, 0, 0))
        a1:setJointTransform("Waist", CFrame.Angles(0.20943951023931956, 0, math.sin(a2) * 0.06))
    else
        return nil
    end
end
u2.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 86
      upvalues:
        applyRunPose_upv_1 (copy, index: 1)
    ]]
    local rig_1 = a1.rig
    local v6 = math.abs(math.sin(a3)) * 0.3
    local v7 = nil
    if rig_1 == nil then
        v7 = a1.fallbackBody
        local fallbackHead_1 = a1.fallbackHead
        if v7 ~= nil and fallbackHead_1 ~= nil then
            v7.CFrame = CFrame.new(a2 + Vector3.new(0, v6 + 1.5, 0))
            fallbackHead_1.CFrame = CFrame.new(a2 + Vector3.new(0, v6 + 3.7, 0))
        else
            return nil
        end
    else
        local v8 = a2 + Vector3.new(0, rig_1.pivotYOffset + v6, 0)
        rig_1:pivotTo(CFrame.lookAt(v8, v8 + Vector3.new(0, 0, 1)))
        applyRunPose_upv_1(rig_1, a3)
        return nil
    end
end
u2.park = function(a1)
    --[[
      name: park
      line: 109
      upvalues:
        u1 (copy, index: 1)
    ]]
    local rig_2 = a1.rig
    if rig_2 == nil then
        if a1.fallbackBody ~= nil then
            a1.fallbackBody.CFrame = u1
        end
        if a1.fallbackHead ~= nil then
            a1.fallbackHead.CFrame = u1
        end
    else
        rig_2:pivotTo(u1)
        return nil
    end
end
local tbl_3 = {}
tbl_3.applyRunPose = applyRunPose_upv_1
tbl_3.applyTuckPose = applyTuckPose_1
tbl_3.GuardChaser = u2
return tbl_3