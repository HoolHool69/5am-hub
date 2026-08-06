-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local Workspace_upv_1 = v1.Workspace
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 54
    ]]
    return "WorldFreezer"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 59
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u3)
    return v2:constructor(...) or v2
end
u3.constructor = function(a1)
    --[[
      name: constructor
      line: 63
    ]]
    a1.frozen = false
    a1.timeScales = {}
    a1.lockedEmitters = {}
    a1.trailLifetimes = {}
    a1.trailEnabled = {}
    a1.frozenAt = 0
    a1.trailScale = 1
    a1.trailHoldActive = false
    a1.beamSpeeds = {}
    a1.partMotions = {}
    a1.trackSpeeds = {}
    a1.pendingPoses = {}
end
u3.setFrozen = function(a1, a2)
    --[[
      name: setFrozen
      line: 77
    ]]
    if a2 ~= a1.frozen then
        a1.frozen = a2
        if a2 then
            a1:freeze()
        else
            a1:thaw()
        end
    else
        return nil
    end
end
u3.isFrozen = function(a1)
    --[[
      name: isFrozen
      line: 88
    ]]
    return a1.frozen
end
u3.rebaseHold = function(a1, a2)
    --[[
      name: rebaseHold
      line: 91
    ]]
    a1:rebasePart(a2)
    for _, value_1 in a2:GetDescendants() do
        a1:rebasePart(value_1)
    end
end
u3.rebasePart = function(a1, a2)
    --[[
      name: rebasePart
      line: 97
    ]]
    local v3 = nil
    if a2:IsA("BasePart") then
        v3 = a1.partMotions[a2]
        if v3 ~= nil then
            a1.partMotions[a2] = {linear = v3.linear, angular = v3.angular, pose = a2.CFrame}
            a1.pendingPoses[a2] = nil
        else
            return nil
        end
    else
        return nil
    end
end
u3.setTrailScale = function(a1, a2)
    --[[
      name: setTrailScale
      line: 119
    ]]
    a1.trailScale = math.clamp(a2, 0, 1)
    a1:applyTrails()
end
u3.setTrailHold = function(a1, a2)
    --[[
      name: setTrailHold
      line: 123
      upvalues:
        Workspace_upv_1 (copy, index: 1)
    ]]
    if a2 ~= a1.trailHoldActive then
        a1.trailHoldActive = a2
        local v4 = nil
        if a2 then
            for _, value_2 in Workspace_upv_1:GetDescendants() do
                a1:adoptTrail(value_2)
            end
            a1.trailWatcher = Workspace_upv_1.DescendantAdded:Connect(
                function(a3)
                    --[[
                      line: 132
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:adoptTrail(a3)
                end
            )
            local _
            _ = 0
            for v5, value_3 in a1.trailLifetimes do
                v4 = math.max(v4, value_3)
            end
            return v4
        else
            v4 = a1.trailWatcher
            if v4 ~= nil then
                v4:Disconnect()
            end
            a1.trailWatcher = nil
            local key_1 = nil
            local value_4 = nil
            for key_1, value_4 in a1.trailLifetimes do
                if key_1.Parent ~= nil then
                    key_1.Lifetime = value_4
                end
            end
            table.clear(a1.trailLifetimes)
            return 0
        end
    else
        return 0
    end
end
u3.adoptTrail = function(a1, a2)
    --[[
      name: adoptTrail
      line: 154
    ]]
    local v5 = not a2:IsA("Trail") or (a1.trailLifetimes[a2] ~= nil)
    if v5 then
        return nil
    end
    a1.trailLifetimes[a2] = a2.Lifetime
    a2.Lifetime = a1:heldLifetime()
end
u3.heldLifetime = function(a1)
    --[[
      name: heldLifetime
      line: 170
    ]]
    if a1.trailScale < 0.999 then
        return 0.02 + (a1.trailScale * 60)
    end
    return 60
end
u3.freeze = function(a1)
    --[[
      name: freeze
      line: 176
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    a1.frozenAt = os.clock()
    for _, value_5 in Workspace_upv_1:GetDescendants() do
        a1:adopt(value_5)
    end
    a1.watcher = Workspace_upv_1.DescendantAdded:Connect(
        function(a2)
            --[[
              line: 181
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:adopt(a2)
        end
    )
    a1.holder = RunService_upv_1.Heartbeat:Connect(
        function()
            --[[
              line: 184
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:reassert()
        end
    )
end
u3.applyTrails = function(a1)
    --[[
      name: applyTrails
      line: 188
    ]]
    local v6 = a1:heldLifetime()
    local key_2 = nil
    for key_2 in a1.trailLifetimes do
        if key_2.Parent ~= nil then
            key_2.Lifetime = v6
        end
    end
end
u3.reassert = function(a1)
    --[[
      name: reassert
      line: 196
    ]]
    for key_3, value_6 in a1.partMotions do
        if key_3.Parent == nil then
            continue
        end
        if key_3.CFrame ~= value_6.pose then
            a1.pendingPoses[key_3] = key_3.CFrame
            key_3.CFrame = value_6.pose
        end
    end
end
u3.thaw = function(a1)
    --[[
      name: thaw
      line: 210
    ]]
    local watcher_1 = a1.watcher
    if watcher_1 ~= nil then
        watcher_1:Disconnect()
    end
    a1.watcher = nil
    local holder_1 = a1.holder
    if holder_1 ~= nil then
        holder_1:Disconnect()
    end
    a1.holder = nil
    local _ = nil
    local v8 = nil
    for key_4, value_7 in a1.timeScales do
        key_4.TimeScale = value_7
    end
    table.clear(a1.timeScales)
    local v9 = nil
    local v10 = nil
    for key_5, value_8 in a1.lockedEmitters do
        key_5.LockedToPart = value_8
    end
    table.clear(a1.lockedEmitters)
    local v11 = nil
    local v12 = nil
    for key_6, value_9 in a1.trailEnabled do
        key_6.Enabled = value_9
    end
    table.clear(a1.trailEnabled)
    local v13 = nil
    local v14 = nil
    for key_7, value_10 in a1.beamSpeeds do
        key_7.TextureSpeed = value_10
    end
    table.clear(a1.beamSpeeds)
    for key_8, value_11 in a1.trackSpeeds do
        if key_8.IsPlaying then
            key_8:AdjustSpeed(value_11)
        end
    end
    table.clear(a1.trackSpeeds)
    local v7 = nil
    for key_9, value_12 in a1.partMotions do
        if key_9.Parent == nil then
            continue
        end
        v7 = a1.pendingPoses[key_9]
        if v7 == nil then
            key_9.Anchored = false
            key_9.AssemblyLinearVelocity = value_12.linear
            key_9.AssemblyAngularVelocity = value_12.angular
        else
            key_9.CFrame = v7
        end
    end
    table.clear(a1.partMotions)
    table.clear(a1.pendingPoses)
end
local function u1(a1, a2)
    --[[
      name: adopt
      line: 266
      upvalues:
        u1 (ref, index: 1)
    ]]
    if u1(a2) then
        local v8 = nil
        if a1.timeScales[a2] == nil then
            a1.timeScales[a2] = a2.TimeScale
            a2.TimeScale = 0
            v8 = a2:IsA("ParticleEmitter")
            if v8 then
                v8 = a1.lockedEmitters[a2] == nil
            end
            if v8 then
                a1.lockedEmitters[a2] = a2.LockedToPart
                a2.LockedToPart = true
            end
        end
        return nil
    elseif a2:IsA("Trail") then
        if a1.trailEnabled[a2] == nil then
            a1.trailEnabled[a2] = a2.Enabled
            a2.Enabled = false
        end
        return nil
    elseif a2:IsA("Beam") then
        if a1.beamSpeeds[a2] == nil then
            a1.beamSpeeds[a2] = a2.TextureSpeed
            a2.TextureSpeed = 0
        end
        return nil
    elseif a2:IsA("Animator") then
        a1:adoptAnimator(a2)
        return nil
    elseif a2:IsA("BasePart") then
        a1:adoptPart(a2)
    end
end
u3.adopt = u1
local function u2(a1, a2)
    --[[
      name: adoptPart
      line: 333
      upvalues:
        u2 (ref, index: 1)
    ]]
    if a2.Anchored or (a1.partMotions[a2] ~= nil) or u2(a2) then
        return nil
    end
    a1.partMotions[a2] = {linear = a2.AssemblyLinearVelocity, angular = a2.AssemblyAngularVelocity, pose = a2.CFrame}
    a2.Anchored = true
end
u3.adoptPart = u2
u3.adoptAnimator = function(a1, a2)
    --[[
      name: adoptAnimator
      line: 356
    ]]
    for _, value_13 in a2:GetPlayingAnimationTracks() do
        if a1.trackSpeeds[value_13] == nil then
            a1.trackSpeeds[value_13] = value_13.Speed
            value_13:AdjustSpeed(0)
        end
    end
end
u1 = function(a1)
    --[[
      name: isTimeScaled
      line: 368
    ]]
    local v9 = a1:IsA("ParticleEmitter") or (a1:IsA("Fire") or (a1:IsA("Smoke") or (a1:IsA("Sparkles"))))
    return v9
end
u2 = function(a1)
    --[[
      name: isLocalCharacterPart
      line: 371
      upvalues:
        Players_upv_1 (copy, index: 1)
    ]]
    local Character_1 = Players_upv_1.LocalPlayer.Character
    if Character_1 ~= nil then
        local v10 = true
        if a1 ~= Character_1.PrimaryPart then
            v10 = a1:IsDescendantOf(Character_1)
        end
        return v10
    end
    return false
end
local tbl_3 = {}
tbl_3.WorldFreezer = u3
return tbl_3