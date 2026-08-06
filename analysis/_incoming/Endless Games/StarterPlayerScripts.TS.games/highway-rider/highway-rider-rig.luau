-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local ReplicatedStorage_upv_1 = v1.ReplicatedStorage
local animationFor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "animation-registry").animationFor
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants")
local bikeRiderModelName_upv_1 = v2.bikeRiderModelName
local HIGHWAY_RIDER_DEFAULT_RIG_NAME_upv_1 = v2.HIGHWAY_RIDER_DEFAULT_RIG_NAME
local HIGHWAY_RIDER_FOLDER_NAME_upv_1 = v2.HIGHWAY_RIDER_FOLDER_NAME
local HIGHWAY_RIDER_READY_ATTRIBUTE_upv_1 = v2.HIGHWAY_RIDER_READY_ATTRIBUTE
local rider_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-config").HIGHWAY_RIDER_CONFIG.rider
local function riderMount_1(a1)
    --[[
      name: riderMount
      line: 34
      upvalues:
        rider_upv_1 (copy, index: 1)
    ]]
    return CFrame.new(0, rider_upv_1.rootHeight + a1, rider_upv_1.rootBack) * CFrame.Angles(0, math.pi, 0)
end
local tbl_upv_1 = {}
local tbl_upv_2 = {}
tbl_upv_2["action1>action2"] = "bikeAction1ToAction2"
tbl_upv_2["action2>action3"] = "bikeAction2ToAction3"
local u1 = nil
local function isSteerFadePart_upv_1(a1)
    --[[
      name: isSteerFadePart
      line: 82
      upvalues:
        u1 (ref, index: 1)
    ]]
    if string.find(a1, "Handle") == nil then
        local v3 = true
        if string.find(a1, "Arm") == nil then
            v3 = true
            if string.find(a1, "Hand") == nil then
                v3 = true
                if string.find(a1, "Finger") == nil then
                    v3 = true
                    if string.find(a1, "Thumb") == nil then
                        v3 = u1(a1)
                    end
                end
            end
        end
        return v3
    end
    return false
end
local function steerFadeMax_1(a1)
    --[[
      name: steerFadeMax
      line: 96
      upvalues:
        u1 (ref,  index: 1)
        rider_upv_1 (copy, index: 2)
    ]]
    if u1(a1) then
        return rider_upv_1.steerFade.hiddenTransparency
    end
    return rider_upv_1.steerFade.maxTransparency
end
u1 = function(a1)
    --[[
      name: isHiddenWhileSteering
      line: 114
    ]]
    local v4 = true
    if string.find(a1, "UpperArm") == nil then
        v4 = string.find(a1, "Torso") ~= nil
    end
    return v4
end
local tbl_upv_3 = {}
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 194
    ]]
    return "HighwayRiderRig"
end
local u2 = setmetatable(tbl_4, tbl_5)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 199
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u2)
    return v5:constructor(...) or v5
end
u2.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 203
      upvalues:
        HIGHWAY_RIDER_DEFAULT_RIG_NAME_upv_1 (copy, index: 1)
        bikeRiderModelName_upv_1 (copy, index: 2)
        Players_upv_1 (copy, index: 3)
        rider_upv_1 (copy, index: 4)
    ]]
    if a4 == nil then
        a4 = {}
    end
    a1.container = a2
    a1.tracks = {}
    a1.clip = "drive"
    a1.transitionSeconds = 0
    a1.halted = false
    a1.fadeParts = {}
    a1.headParts = {}
    a1.headDecals = {}
    a1.accessoryParts = {}
    a1.state = {}
    a1.lastFade = 0
    a1.lastHeadVisibility = 0
    local v6 = a4.rigScale
    if v6 == nil then
        v6 = 1
    end
    a1.rigScale = v6
    local v7
    if a4.useDefaultRider ~= true then
        v7 = bikeRiderModelName_upv_1(Players_upv_1.LocalPlayer.UserId)
    else
        v7 = HIGHWAY_RIDER_DEFAULT_RIG_NAME_upv_1
    end
    a1.templateName = v7
    local v8 = a4.seatLift
    if v8 == nil then
        v8 = 0
    end
    a1.mount = CFrame.new(0, rider_upv_1.rootHeight + v8, rider_upv_1.rootBack) * CFrame.Angles(0, math.pi, 0)
    a3:Add(
        function()
            --[[
              line: 233
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.state.alive = false
        end,
        true
    )
    a1:attempt()
end
u2.attempt = function(a1)
    --[[
      name: attempt
      line: 238
      upvalues:
        ReplicatedStorage_upv_1 (copy, index: 1)
        HIGHWAY_RIDER_FOLDER_NAME_upv_1 (copy, index: 2)
        HIGHWAY_RIDER_READY_ATTRIBUTE_upv_1 (copy, index: 3)
    ]]
    local v9 = nil
    if a1.state.alive then
        v9 = ReplicatedStorage_upv_1:FindFirstChild(HIGHWAY_RIDER_FOLDER_NAME_upv_1)
        if v9 ~= nil then
            v9 = v9:FindFirstChild(a1.templateName)
        end
        if v9 ~= nil and v9:IsA("Model") and v9:GetAttribute(HIGHWAY_RIDER_READY_ATTRIBUTE_upv_1) == true then
            a1:adopt(v9)
            return
        end
        local state_1 = a1.state
        state_1.retries = state_1.retries + 1
        if a1.state.retries <= 60 then
            task.delay(
                0.5,
                function()
                    --[[
                      line: 256
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:attempt()
                end
            )
        end
    end
    return nil
end
local function normalisePalmNames_upv_1(a1)
    --[[
      name: normalisePalmNames
      line: 158
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local v10 = nil
    local value_1 = nil
    for _, value_1 in a1:GetDescendants() do
        if not (value_1:IsA("BasePart")) then
            continue
        end
        v10 = tbl_upv_3[value_1.Name]
        if v10 ~= nil then
            value_1.Name = v10
        end
    end
end
u1 = function(a1, a2)
    --[[
      name: adopt
      line: 263
      upvalues:
        normalisePalmNames_upv_1 (copy, index: 1)
        isSteerFadePart_upv_1 (copy, index: 2)
        u1 (ref,  index: 3)
        rider_upv_1 (copy, index: 4)
    ]]
    local v11 = a2:Clone()
    normalisePalmNames_upv_1(v11)
    if a1.rigScale ~= 1 then
        v11:ScaleTo(v11:GetScale() * a1.rigScale)
    end
    local HumanoidRootPart_1 = v11:FindFirstChild("HumanoidRootPart")
    local v12
    v12 = HumanoidRootPart_1 == nil or not (HumanoidRootPart_1:IsA("BasePart")) or HumanoidRootPart_1
    local v13 = nil
    local _ = nil
    local v16 = nil
    for v17, value_2 in v11:GetDescendants() do
        if value_2:IsA("BasePart") then
            value_2.CanCollide = false
            value_2.CanQuery = false
            value_2.CanTouch = false
            value_2.CastShadow = false
            if v12 == nil then
                v13 = true
            else
                v13 = value_2 == v12
            end
            value_2.Anchored = v13
            if value_2:FindFirstAncestorOfClass("Accessory") == nil then
                v13 = isSteerFadePart_upv_1(value_2.Name)
                if v13 and value_2.Transparency < 1 then
                    local fadeParts_1 = a1.fadeParts
                    local tbl_6 = {}
                    tbl_6.part = value_2
                    tbl_6.base = value_2.Transparency
                    local v14
                    if u1(value_2.Name) then
                        v14 = rider_upv_1.steerFade.hiddenTransparency
                    else
                        v14 = rider_upv_1.steerFade.maxTransparency
                    end
                    tbl_6.max = v14
                    tbl_6.instant = u1(value_2.Name)
                    table.insert(fadeParts_1, tbl_6)
                end
            else
                v13 = value_2:FindFirstChildOfClass("Weld")
                local v15
                if v13 == nil then
                    v15 = v13
                else
                    v15 = v13.C0
                end
                if v13 ~= nil then
                    v13:Destroy()
                end
                value_2.Anchored = true
                table.insert(a1.accessoryParts, {part = value_2, base = value_2.Transparency, offsetFromHead = v15})
                value_2.Transparency = 1
            end
            if value_2.Name == "Head" then
                table.insert(a1.headParts, value_2)
            end
        elseif value_2:IsA("Decal") or value_2:IsA("Texture") then
            if value_2.Parent == nil then
                continue
            end
            if value_2.Parent.Name == "Head" then
                table.insert(a1.headDecals, value_2)
            end
        end
    end
    if v12 ~= nil then
        v11.PrimaryPart = v12
    end
    v11.Parent = a1.container
    a1.model = v11
    a1.root = v12
    a1:loadTracks(v11)
    a1.lastFade = 0
    a1.lastHeadVisibility = -1
end
u2.adopt = u1
u2.loadTracks = function(a1, a2)
    --[[
      name: loadTracks
      line: 346
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v16 = a2:FindFirstChildOfClass("Humanoid")
    if v16 ~= nil then
        v16 = v16:FindFirstChildOfClass("Animator")
    end
    if v16 ~= nil then
        for _, value_3 in tbl_upv_1 do
            a1:loadTrack(v16, value_3)
        end
        local v17 = nil
        for _, value_4 in tbl_upv_2 do
            v17 = a1:loadTrack(v16, value_4)
            if v17 ~= nil then
                v17.Looped = false
            end
        end
        a1:playLoop(a1.clip, 0)
    else
        warn((("[highway-rider] rider %* has no Animator \226\128\148 the bike rides bare"):format(a1.templateName)))
        return nil
    end
end
u2.loadTrack = function(a1, a2, a3)
    --[[
      name: loadTrack
      line: 375
      upvalues:
        animationFor_upv_1 (copy, index: 1)
    ]]
    local success_1, v18 = pcall(
        function()
            --[[
              line: 376
              upvalues:
                a2 (copy, index: 1)
                animationFor_upv_1 (copy, index: 2)
                a3 (copy, index: 3)
            ]]
            return a2:LoadAnimation(animationFor_upv_1(a3))
        end
    )
    if success_1 and typeof(v18) == "Instance" and v18:IsA("AnimationTrack") then
        v18.Priority = Enum.AnimationPriority.Action
        a1.tracks[a3] = v18
        return v18
    end
    warn((("[highway-rider] rider animation \"%*\" failed to load"):format(a3)))
    return nil
end
u2.setClip = function(a1, a2)
    --[[
      name: setClip
      line: 389
      upvalues:
        rider_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v19 = nil
    if a2 ~= a1.clip then
        local animation_1 = rider_upv_1.animation
        v19 = tbl_upv_2[("%*>%*"):format(a1.clip, a2)]
        local v20
        if v19 == nil then
            v20 = nil
        else
            v20 = a1.tracks[v19]
        end
        a1.clip = a2
        local v21, v22 = nil, nil
        if v20 ~= nil then
            v21 = a1.loopTrack
            if v21 ~= nil then
                v21:Stop(animation_1.transitionFadeSeconds)
            end
            a1.loopTrack = nil
            if a1.transitionTrack ~= v20 then
                v22 = a1.transitionTrack
                if v22 ~= nil then
                    v22:Stop(animation_1.transitionFadeSeconds)
                end
            end
            a1.transitionTrack = v20
            a1.transitionSeconds = 0
            v20:Play(animation_1.transitionFadeSeconds)
            if a1.halted then
                v20:AdjustSpeed(0)
            end
        else
            a1:playLoop(a2, animation_1.fadeSeconds)
            return nil
        end
    else
        return nil
    end
end
u2.playLoop = function(a1, a2, a3)
    --[[
      name: playLoop
      line: 423
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v23 = tbl_upv_1[a2]
    local v24
    if v23 == nil then
        v24 = nil
    else
        v24 = a1.tracks[v23]
    end
    local transitionTrack_1 = a1.transitionTrack
    if transitionTrack_1 ~= nil then
        transitionTrack_1:Stop(a3)
    end
    a1.transitionTrack = nil
    local v25 = nil
    if v24 ~= a1.loopTrack then
        v25 = a1.loopTrack
        if v25 ~= nil then
            v25:Stop(a3)
        end
        a1.loopTrack = v24
        if v24 ~= nil then
            v24:Play(a3)
            if a1.halted then
                v24:AdjustSpeed(0)
            end
        else
            return nil
        end
    else
        return nil
    end
end
u2.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 448
      upvalues:
        rider_upv_1 (copy, index: 1)
    ]]
    local model_1 = a1.model
    local v26 = nil
    if model_1 ~= nil then
        v26 = a1.transitionTrack
        if v26 ~= nil and not (a1.halted) then
            a1.transitionSeconds = a1.transitionSeconds + a3
            local transitionFadeSeconds_1 = rider_upv_1.animation.transitionFadeSeconds
            local v27 = false
            if v26.Length > 0 then
                v27 = v26.Length - transitionFadeSeconds_1 <= v26.TimePosition
            end
            if v27 or not (v26.IsPlaying) or rider_upv_1.animation.transitionMaxSeconds <= a1.transitionSeconds then
                a1:playLoop(a1.clip, transitionFadeSeconds_1)
            end
        end
        model_1:PivotTo(a2 * a1.mount)
        a1:followAccessories()
    else
        return nil
    end
end
u2.followAccessories = function(a1)
    --[[
      name: followAccessories
      line: 473
    ]]
    local v28 = a1.headParts[1]
    if v28 ~= nil then
        local v29 = nil
        for _, value_5 in a1.accessoryParts do
            v29 = value_5.offsetFromHead
            if v29 ~= nil then
                value_5.part.CFrame = v28.CFrame * v29
            end
        end
    else
        return nil
    end
end
u2.setHalted = function(a1, a2)
    --[[
      name: setHalted
      line: 485
    ]]
    if a2 ~= a1.halted then
        a1.halted = a2
        local v30 = (a2 and 0) or 1
        for _, value_6 in a1.tracks do
            value_6:AdjustSpeed(v30)
        end
    else
        return nil
    end
end
u2.setSteerFade = function(a1, a2)
    --[[
      name: setSteerFade
      line: 495
      upvalues:
        rider_upv_1 (copy, index: 1)
    ]]
    if a2 ~= a1.lastFade then
        a1.lastFade = a2
        local v31 = rider_upv_1.steerFade.hiddenSteerThreshold < a2
        local part_1 = nil
        local v32 = nil
        for _, value_7 in a1.fadeParts do
            part_1 = value_7.part
            if not (value_7.instant) then
                v32 = value_7.base + (value_7.max - value_7.base) * a2
                part_1.Transparency = v32
                continue
            end
            if v31 then
                v32 = value_7.max
            else
                v32 = value_7.base
            end
            part_1.Transparency = v32
        end
    else
        return nil
    end
end
u2.setHeadVisible = function(a1, a2)
    --[[
      name: setHeadVisible
      line: 505
    ]]
    if a2 ~= a1.lastHeadVisibility then
        a1.lastHeadVisibility = a2
        for _, value_8 in a1.headParts do
            value_8.Transparency = 1 - a2
        end
        for _, value_9 in a1.headDecals do
            value_9.Transparency = 1 - a2
        end
        for _, value_10 in a1.accessoryParts do
            value_10.part.Transparency = 1 - ((1 - value_10.base) * a2)
        end
    else
        return nil
    end
end
u2.fling = function(a1, a2, a3, a4)
    --[[
      name: fling
      line: 520
    ]]
    a1:setSteerFade(0)
    local root_1 = a1.root
    if a1.model ~= nil and root_1 ~= nil then
        for _, value_11 in a1.model:GetDescendants() do
            if value_11:IsA("BasePart") then
                value_11.Anchored = false
            end
        end
        root_1.AssemblyLinearVelocity = Vector3.new(a3 * a2:NextNumber(6, 16), a2:NextNumber(10, 20), (a4 * 0.12) + a2:NextNumber(-4, 4))
        root_1.AssemblyAngularVelocity = Vector3.new(a2:NextNumber(-10, 10), a2:NextNumber(-10, 10), a2:NextNumber(-10, 10))
    else
        return nil
    end
end
u2.park = function(a1)
    --[[
      name: park
      line: 535
    ]]
    local root_2 = a1.root
    if a1.model ~= nil and root_2 ~= nil then
        for _, value_12 in a1.model:GetDescendants() do
            if value_12:IsA("BasePart") then
                value_12.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                value_12.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                value_12.Anchored = value_12 == root_2
            end
        end
    else
        return nil
    end
end
local tbl_7 = {}
tbl_7.HighwayRiderRig = u2
return tbl_7