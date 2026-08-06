-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local adoptAvatar_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "avatar-rig").adoptAvatar
local ICY_TOWER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "icy-tower-config").ICY_TOWER_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent, "icy-tower-pose")
local limbAngles_upv_1 = v1.limbAngles
local SPIN_CENTER_Y_upv_1 = v1.SPIN_CENTER_Y
local wholeBodyPivot_upv_1 = v1.wholeBodyPivot
local u1 = CFrame.new(0, -1000, 0)
local u2 = CFrame.Angles(0, math.pi, 0)
local function scaleOffsetTranslation_1(a1, a2)
    --[[
      name: scaleOffsetTranslation
      line: 39
    ]]
    return CFrame.new(a1.Position * a2) * a1.Rotation
end
local function isHandleConstrainedToHead_upv_1(a1, a2)
    --[[
      name: isHandleConstrainedToHead
      line: 55
    ]]
    local v2, v3, v4, v5 = nil, nil, nil, nil
    for _, value_1 in a1:GetDescendants() do
        if not value_1:IsA("WeldConstraint") or value_1.Part0 ~= a2 and value_1.Part1 ~= a2 then
            v5 = value_1:IsA("RigidConstraint")
            if v5 then
                v2 = value_1.Attachment0
                if v2 ~= nil then
                    v2 = v2.Parent
                end
                if v2 == a2 then
                    v4 = true
                else
                    v4 = false
                end
                if not v4 then
                    v3 = value_1.Attachment1
                    if v3 ~= nil then
                        v3 = v3.Parent
                    end
                    if v3 == a2 then
                        v4 = true
                    else
                        v4 = false
                    end
                end
                v5 = v4
            end
            if not (v5) then
                continue
            end
            return true
        end
        return true
    end
    return false
end
local tbl_upv_1 = {}
tbl_upv_1[Enum.AccessoryType.Neck] = true
tbl_upv_1[Enum.AccessoryType.Shoulder] = true
tbl_upv_1[Enum.AccessoryType.Front] = true
tbl_upv_1[Enum.AccessoryType.Back] = true
tbl_upv_1[Enum.AccessoryType.Waist] = true
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 111
    ]]
    return "IcyTowerAvatarRig"
end
local u3 = setmetatable(tbl_2, tbl_3)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 116
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u3)
    return v6:constructor(...) or v6
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 120
      upvalues:
        ICY_TOWER_CONFIG_upv_1 (copy, index: 1)
        adoptAvatar_upv_1 (copy, index: 2)
    ]]
    a1.rootLift = CFrame.new()
    a1.angles = {}
    local v7 = a2.headScale
    if v7 == nil then
        v7 = ICY_TOWER_CONFIG_upv_1.playerAvatarHeadScale
    end
    a1.headScale = v7
    local tbl_4 = {}
    tbl_4.container = a2.container
    tbl_4.janitor = a2.janitor
    local v8 = a2.scale
    if v8 == nil then
        v8 = ICY_TOWER_CONFIG_upv_1.playerAvatarScale
    end
    tbl_4.scale = v8
    tbl_4.userId = a2.userId
    tbl_4.variant = "r6"
    tbl_4.onAdopted = function(a3)
        --[[
          line: 145
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onAdopted(a3)
    end
    adoptAvatar_upv_1(tbl_4)
end
u3.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 150
      upvalues:
        wholeBodyPivot_upv_1 (copy, index: 1)
        SPIN_CENTER_Y_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        limbAngles_upv_1 (copy, index: 4)
    ]]
    local v9 = wholeBodyPivot_upv_1(a2, a3, SPIN_CENTER_Y_upv_1)
    local rig_1 = a1.rig
    if rig_1 ~= nil then
        rig_1:pivotTo((v9 * u2) * a1.rootLift)
        limbAngles_upv_1(a3, a1.angles)
        local angles_1 = a1.angles
        local armSwing_1 = angles_1.armSwing
        local armRaise_1 = angles_1.armRaise
        local legSwing_1 = angles_1.legSwing
        local legSplit_1 = angles_1.legSplit
        rig_1:setJointTransform("RightShoulder", CFrame.Angles(0, math.rad(1 * armSwing_1), math.rad(1 * armRaise_1)))
        rig_1:setJointTransform("LeftShoulder", CFrame.Angles(0, math.rad(1 * armSwing_1), math.rad(-1 * armRaise_1)))
        rig_1:setJointTransform("RightHip", CFrame.Angles(math.rad(-1 * legSplit_1), 0, math.rad(-1 * legSwing_1)))
        rig_1:setJointTransform("LeftHip", CFrame.Angles(math.rad(-1 * legSplit_1), 0, math.rad(-1 * legSwing_1)))
    else
        return nil
    end
end
u3.park = function(a1)
    --[[
      name: park
      line: 173
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.rig == nil then
        return
    end
    a1.rig:pivotTo(u1)
end
u3.onAdopted = function(a1, a2)
    --[[
      name: onAdopted
      line: 178
    ]]
    a1:growHead(a2.model, a1.headScale)
    a2:clearPose()
    a1.rootLift = CFrame.new(0, a2.pivotYOffset, 0)
    a1.rig = a2
end
local function scaleAttachmentPositions_upv_1(a1, a2)
    --[[
      name: scaleAttachmentPositions
      line: 47
    ]]
    for _, value_2 in a1:GetChildren() do
        if value_2:IsA("Attachment") then
            local CFrame_1 = value_2.CFrame
            value_2.CFrame = CFrame.new(CFrame_1.Position * a2) * CFrame_1.Rotation
        end
    end
end
u3.growHead = function(a1, a2, a3)
    --[[
      name: growHead
      line: 184
      upvalues:
        tbl_upv_1 (copy, index: 1)
        isHandleConstrainedToHead_upv_1 (copy, index: 2)
        scaleAttachmentPositions_upv_1 (copy, index: 3)
    ]]
    local v10 = nil
    if a3 ~= 1 then
        v10 = a2:FindFirstChild("Head")
        if v10 ~= nil and v10:IsA("BasePart") then
            local tbl_5 = {}
            local v11 = nil
            local v12 = nil
            local v13 = nil
            local v14 = nil
            local _ = nil
            local v20 = nil
            local v17 = nil
            for v21, v15 in a2:GetChildren() do
                v11 = v15:IsA("Accoutrement")
                if not (v11) then
                    continue
                end
                v11 = v15:IsA("Accessory") and (tbl_upv_1[v15.AccessoryType] ~= nil)
                if v11 then
                    continue
                end
                v12 = v15:FindFirstChild("Handle")
                if v12 == nil then
                    continue
                end
                v13 = v12:IsA("BasePart")
                if not (v13) then
                    continue
                end
                v13 = v12:FindFirstChildOfClass("Weld")
                if v13 == nil then
                    v14 = isHandleConstrainedToHead_upv_1(v12, v10)
                    if v14 then
                        warn((("[icy-tower-avatar] head accessory \"%*\" attaches without a Weld \226\128\148 left unscaled"):format(v15.Name)))
                    end
                elseif v13.Part0 == v10 or v13.Part1 == v10 then
                    v14 = v13.Part0 == v10
                    if v14 then
                        v17 = v13.C0 * v13.C1:Inverse()
                    else
                        v17 = v13.C1 * v13.C0:Inverse()
                    end
                    table.insert(tbl_5, {handle = v12, weld = v13, headIsPart0 = v14, headLocalOffset = v17})
                end
            end
            v10.Size = v10.Size * a3
            v17 = v10:FindFirstChildOfClass("SpecialMesh")
            if v17 ~= nil then
                v17.Scale = v17.Scale * a3
            end
            scaleAttachmentPositions_upv_1(v10, a3)
            local v15 = a1:findMotor(a2, "Neck")
            if v15 ~= nil then
                v15.C0 = CFrame.new(0, (v10.Size.Y / 2) - (v10.Size.Y / 2), 0) * v15.C0
            end
            local handle_1 = nil
            local weld_1 = nil
            local headIsPart0_1 = nil
            local headLocalOffset_1 = nil
            local v18 = nil
            local v19 = nil
            for v22, value_3 in tbl_5 do
                handle_1 = value_3.handle
                weld_1 = value_3.weld
                headIsPart0_1 = value_3.headIsPart0
                handle_1.Size = handle_1.Size * a3
                v19 = handle_1:FindFirstChildOfClass("SpecialMesh")
                if v19 ~= nil then
                    v19.Scale = v19.Scale * a3
                end
                scaleAttachmentPositions_upv_1(handle_1, a3)
                headLocalOffset_1 = value_3.headLocalOffset
                v18 = CFrame.new(headLocalOffset_1.Position * a3) * headLocalOffset_1.Rotation
                if headIsPart0_1 then
                    weld_1.C0 = v18 * weld_1.C1
                else
                    weld_1.C1 = v18 * weld_1.C0
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u3.findMotor = function(a1, a2, a3)
    --[[
      name: findMotor
      line: 305
    ]]
    for _, value_4 in a2:GetDescendants() do
        if not (value_4:IsA("Motor6D")) or value_4.Name ~= a3 then
            continue
        end
        return value_4
    end
    return nil
end
local tbl_6 = {}
tbl_6.IcyTowerAvatarRig = u3
return tbl_6