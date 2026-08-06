-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local UserInputService_upv_1 = v1.UserInputService
local v2 = RuntimeLib_1.import(script, script.Parent, "tilt-math")
local calibrateTilt_upv_1 = v2.calibrateTilt
local planeConfidence_upv_1 = v2.planeConfidence
local relativeBankDegrees_upv_1 = v2.relativeBankDegrees
local steerFromState_upv_1 = v2.steerFromState
local stepTilt_upv_1 = v2.stepTilt
local u1 = v2.createTiltState()
local X_upv_1 = 0
local Y_upv_1 = 0
local Z_upv_1 = 0
local u2 = nil
local function currentOrientation_1()
    --[[
      name: currentOrientation
      line: 34
      upvalues:
        u2 (ref,  index: 1)
        Players_upv_1 (copy, index: 2)
    ]]
    if u2 == nil then
        u2 = Players_upv_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    end
    local v3 = u2
    if v3 ~= nil then
        v3 = v3.CurrentScreenOrientation
    end
    return v3
end
local function orientationToken_1()
    --[[
      name: orientationToken
      line: 46
      upvalues:
        u2 (ref,  index: 1)
        Players_upv_1 (copy, index: 2)
    ]]
    if u2 == nil then
        u2 = Players_upv_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    end
    local CurrentScreenOrientation_1 = u2
    if CurrentScreenOrientation_1 ~= nil then
        CurrentScreenOrientation_1 = CurrentScreenOrientation_1.CurrentScreenOrientation
    end
    if CurrentScreenOrientation_1 == nil then
        return -1
    end
    return CurrentScreenOrientation_1.Value
end
local tbl_1 = {}
tbl_1.isAvailable = function(a1)
    --[[
      name: isAvailable
      line: 51
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    return UserInputService_upv_1.AccelerometerEnabled
end
u2 = function(a1, a2)
    --[[
      name: sample
      line: 54
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        X_upv_1 (ref,  index: 2)
        Y_upv_1 (ref,  index: 3)
        Z_upv_1 (ref,  index: 4)
        stepTilt_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        u2 (ref,  index: 7)
        Players_upv_1 (copy, index: 8)
    ]]
    local v4 = nil
    if UserInputService_upv_1.AccelerometerEnabled then
        local Position_1 = UserInputService_upv_1:GetDeviceGravity().Position
        X_upv_1 = Position_1.X
        Y_upv_1 = Position_1.Y
        Z_upv_1 = Position_1.Z
        local X_2 = Position_1.X
        local Y_2 = Position_1.Y
        local Z_2 = Position_1.Z
        if u2 == nil then
            u2 = Players_upv_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
        end
        v4 = u2
        if v4 ~= nil then
            v4 = v4.CurrentScreenOrientation
        end
        stepTilt_upv_1(u1, X_2, Y_2, Z_2, a2, ((v4 == nil) and -1) or (v4.Value))
    else
        return nil
    end
end
tbl_1.sample = u2
tbl_1.calibrate = function(a1)
    --[[
      name: calibrate
      line: 64
      upvalues:
        calibrateTilt_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    calibrateTilt_upv_1(u1)
end
tbl_1.steer = function(a1, a2, a3)
    --[[
      name: steer
      line: 67
      upvalues:
        steerFromState_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    return steerFromState_upv_1(u1, a2, a3)
end
u2 = function(a1, a2, a3)
    --[[
      name: debugText
      line: 70
      upvalues:
        u2 (ref,  index: 1)
        Players_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        X_upv_1 (ref,  index: 4)
        Y_upv_1 (ref,  index: 5)
        Z_upv_1 (ref,  index: 6)
        planeConfidence_upv_1 (copy, index: 7)
        relativeBankDegrees_upv_1 (copy, index: 8)
        steerFromState_upv_1 (copy, index: 9)
    ]]
    if u2 == nil then
        u2 = Players_upv_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    end
    local v5 = u2
    if v5 ~= nil then
        v5 = v5.CurrentScreenOrientation
    end
    v5 = ((u1.hasNeutral ~= true) and "--") or (string.format("%+.0f\194\176", math.deg(math.atan2(u1.neutralV, u1.neutralU))))
    local v6 = planeConfidence_upv_1(X_upv_1, Y_upv_1, Z_upv_1, "Y")
    local v7 = planeConfidence_upv_1(X_upv_1, Y_upv_1, Z_upv_1, "Z")
    local v8 = ((u1.confident) and "") or " frozen"
    return string.format("g %+.2f %+.2f %+.2f | pY %.2f pZ %.2f%s | %s | zero %s | bank %+.1f\194\176 | steer %+.2f", X_upv_1, Y_upv_1, Z_upv_1, v6, v7, v8, ((v5 == nil) and "no gui") or (v5.Name), v5, relativeBankDegrees_upv_1(u1), steerFromState_upv_1(u1, a2, a3))
end
tbl_1.debugText = u2
local tbl_2 = {}
tbl_2.tiltInput = tbl_1
return tbl_2