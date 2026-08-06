-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local gamepadUiCaptureAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").gamepadUiCaptureAtom
local Gamepad1_upv_1 = Enum.UserInputType.Gamepad1
local DPadLeft_upv_1 = Enum.KeyCode.DPadLeft
local DPadRight_upv_1 = Enum.KeyCode.DPadRight
local DPadUp_upv_1 = Enum.KeyCode.DPadUp
local DPadDown_upv_1 = Enum.KeyCode.DPadDown
local u1 = 0
local u2 = 0
local u3 = 0
local u4 = 0
local function deadzoneScale_1(a1)
    --[[
      name: deadzoneScale
      line: 17
    ]]
    if a1 > 0.2 then
        return math.min((a1 - 0.2) / 0.8, 1) / a1
    end
    return 0
end
local tbl_1 = {}
tbl_1.setStick = function(a1, a2, a3, a4)
    --[[
      name: setStick
      line: 46
      upvalues:
        u1 (ref, index: 1)
        u2 (ref, index: 2)
        u3 (ref, index: 3)
        u4 (ref, index: 4)
    ]]
    local v1 = math.sqrt((a3 * a3) + (a4 * a4))
    local v2 = ((v1 > 0.2) and (math.min((v1 - 0.2) / 0.8, 1) / v1)) or 0
    if a2 ~= "left" then
        u3 = a3 * v2
        u4 = a4 * v2
    else
        u1 = a3 * v2
        u2 = a4 * v2
    end
end
tbl_1.leftX = function(a1)
    --[[
      name: leftX
      line: 56
      upvalues:
        gamepadUiCaptureAtom_upv_1 (copy, index: 1)
        u1 (ref,  index: 2)
    ]]
    if gamepadUiCaptureAtom_upv_1() then
        return 0
    end
    return u1
end
tbl_1.leftY = function(a1)
    --[[
      name: leftY
      line: 59
      upvalues:
        gamepadUiCaptureAtom_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
    ]]
    if gamepadUiCaptureAtom_upv_1() then
        return 0
    end
    return u2
end
tbl_1.rightX = function(a1)
    --[[
      name: rightX
      line: 62
      upvalues:
        u3 (ref, index: 1)
    ]]
    return u3
end
tbl_1.rightY = function(a1)
    --[[
      name: rightY
      line: 65
      upvalues:
        u4 (ref, index: 1)
    ]]
    return u4
end
tbl_1.isDown = function(a1, a2)
    --[[
      name: isDown
      line: 68
      upvalues:
        gamepadUiCaptureAtom_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
        Gamepad1_upv_1 (copy, index: 3)
    ]]
    if gamepadUiCaptureAtom_upv_1() then
        return false
    end
    return UserInputService_upv_1:IsGamepadButtonDown(Gamepad1_upv_1, a2)
end
tbl_1.moveX = function(a1)
    --[[
      name: moveX
      line: 74
      upvalues:
        gamepadUiCaptureAtom_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
        Gamepad1_upv_1 (copy, index: 3)
        DPadLeft_upv_1 (copy, index: 4)
        DPadRight_upv_1 (copy, index: 5)
        u1 (ref,  index: 6)
    ]]
    if gamepadUiCaptureAtom_upv_1() then
        return 0
    end
    if UserInputService_upv_1:IsGamepadButtonDown(Gamepad1_upv_1, DPadLeft_upv_1) then
        return -1
    elseif UserInputService_upv_1:IsGamepadButtonDown(Gamepad1_upv_1, DPadRight_upv_1) then
        return 1
    else
        return u1
    end
end
tbl_1.moveY = function(a1)
    --[[
      name: moveY
      line: 86
      upvalues:
        gamepadUiCaptureAtom_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
        Gamepad1_upv_1 (copy, index: 3)
        DPadUp_upv_1 (copy, index: 4)
        DPadDown_upv_1 (copy, index: 5)
        u2 (ref,  index: 6)
    ]]
    if gamepadUiCaptureAtom_upv_1() then
        return 0
    end
    if UserInputService_upv_1:IsGamepadButtonDown(Gamepad1_upv_1, DPadUp_upv_1) then
        return 1
    elseif UserInputService_upv_1:IsGamepadButtonDown(Gamepad1_upv_1, DPadDown_upv_1) then
        return -1
    else
        return u2
    end
end
local tbl_2 = {}
tbl_2.gamepadInput = tbl_1
return tbl_2