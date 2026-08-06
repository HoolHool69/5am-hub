-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local animationFor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "animation-registry").animationFor
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants")
local TRAFFIC_RIDER_FOLDER_NAME_upv_1 = v1.TRAFFIC_RIDER_FOLDER_NAME
local TRAFFIC_RIDER_READY_ATTRIBUTE_upv_1 = v1.TRAFFIC_RIDER_READY_ATTRIBUTE
local trafficRiderModelName_upv_1 = v1.trafficRiderModelName
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 60
    ]]
    return "TrafficRushRider"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 65
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 69
      upvalues:
        trafficRiderModelName_upv_1 (copy, index: 1)
    ]]
    a1.skin = a2
    a1.halted = false
    a1.state = {}
    a1.templateName = trafficRiderModelName_upv_1(a3)
    a4:Add(
        function()
            --[[
              line: 79
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.state.alive = false
        end,
        true
    )
    a1:attempt()
end
u1.setHalted = function(a1, a2)
    --[[
      name: setHalted
      line: 84
    ]]
    local v3 = nil
    if a2 ~= a1.halted then
        a1.halted = a2
        v3 = a1.track
        if v3 ~= nil then
            v3:AdjustSpeed((a2 and 0) or 1)
        end
    else
        return nil
    end
end
u1.attempt = function(a1)
    --[[
      name: attempt
      line: 94
      upvalues:
        ReplicatedStorage_upv_1 (copy, index: 1)
        TRAFFIC_RIDER_FOLDER_NAME_upv_1 (copy, index: 2)
        TRAFFIC_RIDER_READY_ATTRIBUTE_upv_1 (copy, index: 3)
    ]]
    local v4 = nil
    if a1.state.alive then
        v4 = ReplicatedStorage_upv_1:FindFirstChild(TRAFFIC_RIDER_FOLDER_NAME_upv_1)
        if v4 ~= nil then
            v4 = v4:FindFirstChild(a1.templateName)
        end
        if v4 ~= nil and v4:IsA("Model") and v4:GetAttribute(TRAFFIC_RIDER_READY_ATTRIBUTE_upv_1) == true then
            a1:adopt(v4)
            return
        end
        local state_1 = a1.state
        state_1.retries = state_1.retries + 1
        if a1.state.retries <= 60 then
            task.delay(
                0.5,
                function()
                    --[[
                      line: 112
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:attempt()
                end
            )
        else
            warn((("[traffic-rush] rider %* never published \226\128\148 moto rides bare"):format(a1.templateName)))
        end
    end
    return nil
end
local function driveAnimation_upv_1()
    --[[
      name: driveAnimation
      line: 39
      upvalues:
        animationFor_upv_1 (copy, index: 1)
    ]]
    return animationFor_upv_1("bikeDrive")
end
u1.adopt = function(a1, a2)
    --[[
      name: adopt
      line: 119
      upvalues:
        driveAnimation_upv_1 (copy, index: 1)
    ]]
    local v5 = a2:Clone()
    local v6 = a1.skin.size.Z / 8.09
    v5:ScaleTo(v5:GetScale() * v6)
    local HumanoidRootPart_1 = v5:FindFirstChild("HumanoidRootPart")
    local v7
    v7 = HumanoidRootPart_1 == nil or not (HumanoidRootPart_1:IsA("BasePart")) or HumanoidRootPart_1
    local v8 = nil
    for v9, value_1 in v5:GetDescendants() do
        if not (value_1:IsA("BasePart")) then
            continue
        end
        value_1.CanCollide = false
        value_1.CanQuery = false
        value_1.CanTouch = false
        value_1.CastShadow = false
        if v7 == nil then
            v8 = true
        else
            v8 = value_1 == v7
        end
        value_1.Anchored = v8
    end
    local v10 = v5:FindFirstChildOfClass("Humanoid")
    local v11
    if v10 == nil then
        v11 = v10
    else
        v11 = v10:FindFirstChildOfClass("Animator")
    end
    local u2 = v11
    if v7 ~= nil and u2 ~= nil then
        v5.PrimaryPart = v7
        v5.WorldPivot = v7.CFrame
        v5.Parent = a1.skin.model
        v5:PivotTo(a1.skin:canonicalToWorld(CFrame.new(0, 3.04 * v6, -0.15 * v6)))
        local v9, value_1 = pcall(
            function()
                --[[
                  line: 158
                  upvalues:
                    u2 (copy, index: 1)
                    driveAnimation_upv_1 (copy, index: 2)
                ]]
                return u2:LoadAnimation(driveAnimation_upv_1())
            end
        )
        if v9 and typeof(value_1) == "Instance" and value_1:IsA("AnimationTrack") then
            if a1.state.alive then
                a1.track = value_1
                value_1:Play(0)
                if a1.halted then
                    value_1:AdjustSpeed(0)
                end
                return
            end
            v5:Destroy()
            return nil
        end
        warn((("[traffic-rush] drive animation failed to load for %* \226\128\148 moto rides bare"):format(a1.templateName)))
        v5:Destroy()
        return nil
    end
    warn((("[traffic-rush] rider %* has no root/Animator \226\128\148 moto rides bare"):format(a1.templateName)))
    v5:Destroy()
    return nil
end
local tbl_3 = {}
tbl_3.TrafficRushRider = u1
return tbl_3