-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService_upv_1 = v1.RunService
local UserInputService_upv_1 = v1.UserInputService
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "common", "gamepad-input").gamepadInput
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "input-device-atom")
local classifyInputType_upv_1 = v2.classifyInputType
local initialDevice_upv_1 = v2.initialDevice
local inputDeviceAtom_upv_1 = v2.inputDeviceAtom
local isPadDrivenPointer_upv_1 = v2.isPadDrivenPointer
local noteGamepadButtonPressed_upv_1 = v2.noteGamepadButtonPressed
local Gamepad1_upv_1 = Enum.UserInputType.Gamepad1
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 35
    ]]
    return "GamepadInputController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 40
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 44
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 46
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
        initialDevice_upv_1 (copy, index: 2)
        UserInputService_upv_1 (copy, index: 3)
        Gamepad1_upv_1 (copy, index: 4)
        noteGamepadButtonPressed_upv_1 (copy, index: 5)
        subscribe_upv_1 (copy, index: 6)
        classifyInputType_upv_1 (copy, index: 7)
        isPadDrivenPointer_upv_1 (copy, index: 8)
        gamepadInput_upv_1 (copy, index: 9)
        RunService_upv_1 (copy, index: 10)
    ]]
    inputDeviceAtom_upv_1(
        function()
            --[[
              line: 48
              upvalues:
                initialDevice_upv_1 (copy, index: 1)
            ]]
            return initialDevice_upv_1()
        end
    )
    UserInputService_upv_1.InputBegan:Connect(
        function(a2)
            --[[
              line: 51
              upvalues:
                Gamepad1_upv_1 (copy, index: 1)
                noteGamepadButtonPressed_upv_1 (copy, index: 2)
            ]]
            if a2.UserInputType ~= Gamepad1_upv_1 then
                return
            end
            noteGamepadButtonPressed_upv_1()
        end
    )
    a1:applyMouseIcon(inputDeviceAtom_upv_1())
    subscribe_upv_1(
        inputDeviceAtom_upv_1,
        function(a3)
            --[[
              line: 61
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyMouseIcon(a3)
        end
    )
    UserInputService_upv_1.LastInputTypeChanged:Connect(
        function(a4)
            --[[
              line: 64
              upvalues:
                classifyInputType_upv_1 (copy, index: 1)
                inputDeviceAtom_upv_1 (copy, index: 2)
                isPadDrivenPointer_upv_1 (copy, index: 3)
            ]]
            local u2 = classifyInputType_upv_1(a4)
            if u2 ~= nil and u2 ~= inputDeviceAtom_upv_1() then
                if u2 == "mouse" and isPadDrivenPointer_upv_1() then
                    return nil
                end
                inputDeviceAtom_upv_1(
                    function()
                        --[[
                          line: 74
                          upvalues:
                            u2 (copy, index: 1)
                        ]]
                        return u2
                    end
                )
                return
            end
            return nil
        end
    )
    UserInputService_upv_1.InputChanged:Connect(
        function(a5)
            --[[
              line: 78
              upvalues:
                Gamepad1_upv_1 (copy, index: 1)
                gamepadInput_upv_1 (copy, index: 2)
            ]]
            if a5.UserInputType == Gamepad1_upv_1 then
                if a5.KeyCode == Enum.KeyCode.Thumbstick1 then
                    gamepadInput_upv_1:setStick("left", a5.Position.X, a5.Position.Y)
                elseif a5.KeyCode == Enum.KeyCode.Thumbstick2 then
                    gamepadInput_upv_1:setStick("right", a5.Position.X, a5.Position.Y)
                end
            else
                return nil
            end
        end
    )
    UserInputService_upv_1.InputEnded:Connect(
        function(a6)
            --[[
              line: 89
              upvalues:
                Gamepad1_upv_1 (copy, index: 1)
                gamepadInput_upv_1 (copy, index: 2)
            ]]
            if a6.UserInputType == Gamepad1_upv_1 then
                if a6.KeyCode == Enum.KeyCode.Thumbstick1 then
                    gamepadInput_upv_1:setStick("left", 0, 0)
                elseif a6.KeyCode == Enum.KeyCode.Thumbstick2 then
                    gamepadInput_upv_1:setStick("right", 0, 0)
                end
            else
                return nil
            end
        end
    )
    UserInputService_upv_1.WindowFocusReleased:Connect(
        function()
            --[[
              line: 99
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:zeroSticks()
        end
    )
    UserInputService_upv_1.GamepadDisconnected:Connect(
        function(a7)
            --[[
              line: 102
              upvalues:
                Gamepad1_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                inputDeviceAtom_upv_1 (copy, index: 3)
                initialDevice_upv_1 (copy, index: 4)
            ]]
            if a7 == Gamepad1_upv_1 then
                a1:zeroSticks()
                inputDeviceAtom_upv_1(
                    function()
                        --[[
                          line: 108
                          upvalues:
                            initialDevice_upv_1 (copy, index: 1)
                        ]]
                        return initialDevice_upv_1()
                    end
                )
            else
                return nil
            end
        end
    )
    if not RunService_upv_1:IsStudio() then
        return
    end
    UserInputService_upv_1.InputBegan:Connect(
        function(a8, a9)
            --[[
              line: 115
              upvalues:
                inputDeviceAtom_upv_1 (copy, index: 1)
                initialDevice_upv_1 (copy, index: 2)
            ]]
            if not (a9) and a8.KeyCode == Enum.KeyCode.G then
                local u3 = ((inputDeviceAtom_upv_1() ~= "gamepad") and "gamepad") or (initialDevice_upv_1())
                inputDeviceAtom_upv_1(
                    function()
                        --[[
                          line: 120
                          upvalues:
                            u3 (copy, index: 1)
                        ]]
                        return u3
                    end
                )
                print((("[GamepadInputController] device forced to %* (G toggles, Studio only)"):format(u3)))
                return
            end
            return nil
        end
    )
end
u1.applyMouseIcon = function(a1, a2)
    --[[
      name: applyMouseIcon
      line: 127
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    UserInputService_upv_1.MouseIconEnabled = a2 ~= "gamepad"
end
u1.zeroSticks = function(a1)
    --[[
      name: zeroSticks
      line: 130
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
    ]]
    gamepadInput_upv_1:setStick("left", 0, 0)
    gamepadInput_upv_1:setStick("right", 0, 0)
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/gamepad-input-controller@GamepadInputController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.GamepadInputController = u1
return tbl_3