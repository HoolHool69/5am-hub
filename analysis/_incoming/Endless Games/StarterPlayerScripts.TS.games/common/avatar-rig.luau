-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local ReplicatedStorage_upv_1 = v1.ReplicatedStorage
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants")
local AVATARS_FOLDER_NAME_upv_1 = v2.AVATARS_FOLDER_NAME
local avatarModelName_upv_1 = v2.avatarModelName
local avatarR6ModelName_upv_1 = v2.avatarR6ModelName
local u1 = CFrame.new()
local tbl_upv_1 = {}
tbl_upv_1.Root = {"RootJoint", "Root"}
tbl_upv_1.Neck = {"Neck"}
tbl_upv_1.Waist = {"Waist"}
tbl_upv_1.LeftShoulder = {"LeftShoulder", "Left Shoulder"}
tbl_upv_1.RightShoulder = {"RightShoulder", "Right Shoulder"}
tbl_upv_1.LeftElbow = {"LeftElbow"}
tbl_upv_1.RightElbow = {"RightElbow"}
tbl_upv_1.LeftHip = {"LeftHip", "Left Hip"}
tbl_upv_1.RightHip = {"RightHip", "Right Hip"}
tbl_upv_1.LeftKnee = {"LeftKnee"}
tbl_upv_1.RightKnee = {"RightKnee"}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 54
    ]]
    return "AvatarRig"
end
local u2 = setmetatable(tbl_2, tbl_3)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 59
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u2)
    return v3:constructor(...) or v3
end
u2.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 63
    ]]
    a1.model = a2
    a1.rigType = a3
    a1.pivotYOffset = a4
    a1.joints = a5
end
u2.pivotTo = function(a1, a2)
    --[[
      name: pivotTo
      line: 69
    ]]
    a1.model:PivotTo(a2)
end
u2.supportsJoint = function(a1, a2)
    --[[
      name: supportsJoint
      line: 72
    ]]
    return a1.joints[a2] ~= nil
end
u2.setJointTransform = function(a1, a2, a3)
    --[[
      name: setJointTransform
      line: 77
    ]]
    local v4 = a1.joints[a2]
    if v4 == nil then
        return
    end
    v4.Transform = a3
end
u2.clearPose = function(a1)
    --[[
      name: clearPose
      line: 85
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_1 in a1.joints do
        value_1.Transform = u1
    end
end
local function u3(a1)
    --[[
      name: adoptAvatar
      line: 98
      upvalues:
        Players_upv_1 (copy, index: 1)
        ReplicatedStorage_upv_1 (copy, index: 2)
        AVATARS_FOLDER_NAME_upv_1 (copy, index: 3)
        avatarR6ModelName_upv_1 (copy, index: 4)
        avatarModelName_upv_1 (copy, index: 5)
        u3 (ref,  index: 6)
    ]]
    local v5 = a1.userId
    if v5 == nil then
        v5 = Players_upv_1.LocalPlayer.UserId
    end
    local u4 = v5
    local tbl_upv_4 = {}
    a1.janitor:Add(
        function()
            --[[
              line: 108
              upvalues:
                tbl_upv_4 (copy, index: 1)
            ]]
            tbl_upv_4.alive = false
        end,
        true
    )
    local function u5()
        --[[
          line: 112
          upvalues:
            tbl_upv_4 (copy, index: 1)
            ReplicatedStorage_upv_1 (copy, index: 2)
            AVATARS_FOLDER_NAME_upv_1 (copy, index: 3)
            a1 (copy, index: 4)
            avatarR6ModelName_upv_1 (copy, index: 5)
            u4 (copy, index: 6)
            avatarModelName_upv_1 (copy, index: 7)
            u5 (ref,  index: 8)
            u3 (ref,  index: 9)
        ]]
        if tbl_upv_4.alive then
            local v6 = ReplicatedStorage_upv_1:FindFirstChild(AVATARS_FOLDER_NAME_upv_1)
            local v7
            if a1.variant ~= "r6" then
                v7 = avatarModelName_upv_1(u4)
            else
                v7 = avatarR6ModelName_upv_1(u4)
            end
            local v8
            if v6 == nil then
                v8 = v6
            else
                v8 = v6:FindFirstChild(v7)
            end
            if v8 == nil or not v8:IsA("Model") then
                tbl_upv_4.retries = tbl_upv_4.retries + 1
                if tbl_upv_4.retries <= 20 then
                    task.delay(0.5, u5)
                    return nil
                else
                    return nil
                end
            end
            a1.onAdopted(u3(v8, a1))
        else
            return nil
        end
    end
    u5()
end
u3 = function(a1, a2)
    --[[
      name: buildRig
      line: 135
      upvalues:
        tbl_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
    ]]
    local u6 = a1:Clone()
    local v9 = a2.scale
    if v9 == nil then
        v9 = 1
    end
    local u7 = v9
    if u7 ~= 1 then
        local HumanoidRootPart_1 = pcall(
            function()
                --[[
                  line: 145
                  upvalues:
                    u6 (copy, index: 1)
                    u7 (ref,  index: 2)
                ]]
                return u6:ScaleTo(u7)
            end
        )
        if not (HumanoidRootPart_1) then
            warn((("[avatar-rig] ScaleTo(%*) failed for %*; continuing unscaled"):format(u7, u6.Name)))
            u7 = 1
        end
    end
    local HumanoidRootPart_1 = u6:FindFirstChild("HumanoidRootPart")
    local v19, v10
    v10 = HumanoidRootPart_1 == nil or not (HumanoidRootPart_1:IsA("BasePart")) or HumanoidRootPart_1
    local v11 = u6:FindFirstChildOfClass("Humanoid")
    local v12 = nil
    for v20, value_2 in u6:GetDescendants() do
        v12 = value_2:IsA("BasePart")
        if not (v12) then
            continue
        end
        value_2.CanCollide = false
        value_2.CanQuery = false
        value_2.CanTouch = false
        value_2.CastShadow = false
        if v10 == nil then
            v12 = true
        else
            v12 = value_2 == v10
        end
        value_2.Anchored = v12
    end
    if v10 ~= nil then
        u6.PrimaryPart = v10
    end
    local v13
    if v10 == nil or v11 == nil then
        local v14, v15 = u6:GetBoundingBox()
        v13 = u6:GetPivot().Position.Y - v14.Position.Y + v15.Y / 2
    else
        v13 = (((v11.RigType == Enum.HumanoidRigType.R6) and (2 * u7)) or (v11.HipHeight)) + v10.Size.Y / 2
    end
    local v14 = {}
    local value_3 = nil
    for v21, value_3 in u6:GetDescendants() do
        if value_3:IsA("AnimationConstraint") or value_3:IsA("Motor6D") then
            v14[value_3.Name] = value_3
        end
    end
    local tbl_5 = {}
    local value_4 = nil
    local v16 = nil
    for key_1, value_5 in pairs(tbl_upv_1) do
        value_4 = nil
        for v22, value_4 in value_5 do
            v16 = v14[value_4]
            if v16 ~= nil then
                tbl_5[key_1] = v16
                break
            end
        end
    end
    local v17
    if v11 == nil then
        v17 = v11
    else
        v17 = v11.RigType
    end
    local v18
    if v17 ~= Enum.HumanoidRigType.R15 then
        v18 = "R6"
    else
        v18 = "R15"
    end
    u6.Parent = a2.container
    return u2.new(u6, v18, v13, tbl_5)
end
tbl_3 = {}
tbl_3.adoptAvatar = u3
tbl_3.AvatarRig = u2
return tbl_3