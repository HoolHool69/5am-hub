-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService_upv_1 = v1.RunService
local UserInputService_upv_1 = v1.UserInputService
local gamepadUiCaptureAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms").gamepadUiCaptureAtom
local Signal_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "signal").Signal
local tbl_upv_1 = {}
tbl_upv_1[Enum.KeyCode.Up] = "up"
tbl_upv_1[Enum.KeyCode.W] = "up"
tbl_upv_1[Enum.KeyCode.Down] = "down"
tbl_upv_1[Enum.KeyCode.S] = "down"
tbl_upv_1[Enum.KeyCode.Left] = "left"
tbl_upv_1[Enum.KeyCode.A] = "left"
tbl_upv_1[Enum.KeyCode.Right] = "right"
tbl_upv_1[Enum.KeyCode.D] = "right"
local tbl_upv_2 = {}
tbl_upv_2[Enum.KeyCode.Space] = true
tbl_upv_2[Enum.KeyCode.Up] = true
tbl_upv_2[Enum.KeyCode.W] = true
local Gamepad1_upv_1 = Enum.UserInputType.Gamepad1
local ButtonA_upv_1 = Enum.KeyCode.ButtonA
local tbl_upv_3 = {}
tbl_upv_3[Enum.KeyCode.DPadUp] = "up"
tbl_upv_3[Enum.KeyCode.DPadDown] = "down"
tbl_upv_3[Enum.KeyCode.DPadLeft] = "left"
tbl_upv_3[Enum.KeyCode.DPadRight] = "right"
local Thumbstick1_upv_1 = Enum.KeyCode.Thumbstick1
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 55
    ]]
    return "InputController"
end
local u3 = setmetatable(tbl_4, tbl_5)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 60
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u3)
    return v2:constructor(...) or v2
end
u3.constructor = function(a1)
    --[[
      name: constructor
      line: 64
      upvalues:
        Signal_upv_1 (copy, index: 1)
    ]]
    a1.anyPress = Signal_upv_1.new()
    a1.inputEnabled = false
    a1.pressActive = false
    a1.pressDelivered = false
    a1.pressStartPosition = Vector2.zero
    a1.pressStartTime = 0
    a1.lastPosition = Vector2.zero
    a1.swipeConsumed = false
    a1.gamepadPressActive = false
    a1.gamepadPressDelivered = false
    a1.gamepadPressStartTime = 0
    a1.keyPressActive = false
    a1.keyPressDelivered = false
    a1.flickReady = true
end
u3.onStart = function(a1)
    --[[
      name: onStart
      line: 80
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    UserInputService_upv_1.InputBegan:Connect(
        function(a2, a3)
            --[[
              line: 81
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputBegan(a2, a3)
        end
    )
    UserInputService_upv_1.InputChanged:Connect(
        function(a4)
            --[[
              line: 84
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputChanged(a4)
        end
    )
    UserInputService_upv_1.InputEnded:Connect(
        function(a5)
            --[[
              line: 87
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputEnded(a5)
        end
    )
    UserInputService_upv_1.WindowFocusReleased:Connect(
        function()
            --[[
              line: 93
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:releaseHeldPresses("focusLost")
        end
    )
end
u3.createHandle = function(a1, a2)
    --[[
      name: createHandle
      line: 97
      upvalues:
        Signal_upv_1 (copy, index: 1)
    ]]
    local tbl_upv_6 = {}
    tbl_upv_6.pressBegan = Signal_upv_1.new()
    tbl_upv_6.pressEnded = Signal_upv_1.new()
    tbl_upv_6.swipe = Signal_upv_1.new()
    tbl_upv_6.drag = Signal_upv_1.new()
    a1.activeHandle = tbl_upv_6
    a2:Add(
        function()
            --[[
              line: 105
              upvalues:
                a1 (copy, index: 1)
                tbl_upv_6 (copy, index: 2)
            ]]
            if a1.activeHandle == tbl_upv_6 then
                a1.activeHandle = nil
            end
            tbl_upv_6.pressBegan:Destroy()
            tbl_upv_6.pressEnded:Destroy()
            tbl_upv_6.swipe:Destroy()
            tbl_upv_6.drag:Destroy()
        end
    )
    return tbl_upv_6
end
u3.setInputEnabled = function(a1, a2)
    --[[
      name: setInputEnabled
      line: 116
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    if not (a2) and a1.inputEnabled then
        a1:releaseHeldPresses("gated")
    end
    a1.inputEnabled = a2
    if a2 then
        local v3 = UserInputService_upv_1:GetFocusedTextBox()
        if v3 == nil then
            return
        end
        v3:ReleaseFocus()
    end
end
u3.releaseHeldPresses = function(a1, a2)
    --[[
      name: releaseHeldPresses
      line: 136
    ]]
    local v4 = a2 == "focusLost"
    if a1.pressActive then
        local pressDelivered_1 = a1.pressDelivered
        a1.pressDelivered = false
        if v4 then
            a1.pressActive = false
            a1.pressInput = nil
        end
        if pressDelivered_1 then
            a1:emitPressEnded(a1.lastPosition, os.clock() - a1.pressStartTime, "pointer")
        end
    end
    if a1.gamepadPressActive then
        local gamepadPressDelivered_1 = a1.gamepadPressDelivered
        a1.gamepadPressDelivered = false
        if v4 then
            a1.gamepadPressActive = false
        end
        if gamepadPressDelivered_1 then
            a1:emitPressEnded(a1:getPointerPosition(), os.clock() - a1.gamepadPressStartTime, "key")
        end
    end
    if a1.keyPressActive then
        local keyPressDelivered_1 = a1.keyPressDelivered
        a1.keyPressDelivered = false
        if v4 then
            a1.keyPressActive = false
        end
        if not keyPressDelivered_1 then
            return
        end
        a1:emitPressEnded(a1:getPointerPosition(), 0.1, "key")
    end
end
u3.getPointerPosition = function(a1)
    --[[
      name: getPointerPosition
      line: 170
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    return UserInputService_upv_1:GetMouseLocation()
end
u3.onInputBegan = function(a1, a2, a3)
    --[[
      name: onInputBegan
      line: 173
      upvalues:
        Gamepad1_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        RunService_upv_1 (copy, index: 4)
        gamepadUiCaptureAtom_upv_1 (copy, index: 5)
        ButtonA_upv_1 (copy, index: 6)
        tbl_upv_3 (copy, index: 7)
    ]]
    if a3 and a2.UserInputType ~= Gamepad1_upv_1 then
        return nil
    end
    local v5 = true
    if a2.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v5 = a2.UserInputType == Enum.UserInputType.Touch
    end
    if v5 then
        local v6 = Vector2.new(a2.Position.X, a2.Position.Y)
        a1.anyPress:Fire()
        if not a1.pressActive then
            a1.pressActive = true
            a1.pressInput = a2
            a1.pressDelivered = a1.inputEnabled
            a1.pressStartPosition = v6
            a1.lastPosition = v6
            a1.pressStartTime = os.clock()
            a1.swipeConsumed = false
            a1:emitPressBegan(v6, "pointer")
        end
        return nil
    else
        local v7 = nil
        if a2.UserInputType == Enum.UserInputType.Keyboard then
            if tbl_upv_2[a2.KeyCode] ~= nil then
                a1.keyPressActive = true
                a1.keyPressDelivered = a1.inputEnabled
                a1.anyPress:Fire()
                a1:emitPressBegan(a1:getPointerPosition(), "key")
            end
            v7 = tbl_upv_1[a2.KeyCode]
            if v7 ~= nil then
                a1:emitSwipe(v7, "key")
            end
            return nil
        elseif a2.UserInputType == Gamepad1_upv_1 then
            if RunService_upv_1:IsStudio() then
                local v8 = ("[GameInput] %* capture=%*"):format(a2.KeyCode.Name, gamepadUiCaptureAtom_upv_1())
                print(v8 .. (" enabled=%* handle=%*"):format(a1.inputEnabled, a1.activeHandle ~= nil))
            end
            if gamepadUiCaptureAtom_upv_1() then
                return nil
            else
                local v9 = nil
                if a2.KeyCode ~= ButtonA_upv_1 then
                    v9 = tbl_upv_3[a2.KeyCode]
                    if v9 ~= nil then
                        a1:emitSwipe(v9, "key")
                    end
                else
                    a1.gamepadPressActive = true
                    a1.gamepadPressDelivered = a1.inputEnabled
                    a1.gamepadPressStartTime = os.clock()
                    a1.anyPress:Fire()
                    a1:emitPressBegan(a1:getPointerPosition(), "key")
                    return nil
                end
            end
        end
    end
end
local function u1(a1, a2)
    --[[
      name: onInputChanged
      line: 241
      upvalues:
        Gamepad1_upv_1 (copy, index: 1)
        Thumbstick1_upv_1 (copy, index: 2)
        u1 (ref,  index: 3)
    ]]
    if a2.UserInputType == Gamepad1_upv_1 then
        if a2.KeyCode == Thumbstick1_upv_1 then
            a1:updateStickFlick(a2.Position.X, a2.Position.Y)
        end
        return nil
    elseif a1.pressActive then
        local v10 = true
        if a2.UserInputType ~= Enum.UserInputType.MouseMovement then
            v10 = a2.UserInputType == Enum.UserInputType.Touch
        end
        local v11 = nil
        if v10 then
            if a2.UserInputType == Enum.UserInputType.Touch and a2 ~= a1.pressInput then
                return nil
            end
            local v12 = Vector2.new(a2.Position.X, a2.Position.Y)
            a1.lastPosition = v12
            a1:emitDrag(v12 - a1.lastPosition, v12)
            if not (a1.swipeConsumed) then
                v11 = v12 - a1.pressStartPosition
                if v11.Magnitude >= 24 then
                    a1.swipeConsumed = true
                    a1:emitSwipe(u1(v11), "pointer")
                end
            end
        else
            return nil
        end
    else
        return nil
    end
end
u3.onInputChanged = u1
u3.onInputEnded = function(a1, a2)
    --[[
      name: onInputEnded
      line: 274
      upvalues:
        tbl_upv_2 (copy, index: 1)
        Gamepad1_upv_1 (copy, index: 2)
        ButtonA_upv_1 (copy, index: 3)
    ]]
    local v13 = true
    if a2.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v13 = a2.UserInputType == Enum.UserInputType.Touch
    end
    local v14 = a2 == a1.pressInput
    local v18 = nil
    if not (v14) then
        local v15 = a2.UserInputType == Enum.UserInputType.MouseButton1
        if v15 then
            v18 = a1.pressInput
            if v18 ~= nil then
                v18 = v18.UserInputType
            end
            if v18 == Enum.UserInputType.MouseButton1 then
                v15 = true
            else
                v15 = false
            end
        end
        v14 = v15
    end
    if v13 and a1.pressActive then
        if v14 then
            a1.pressActive = false
            a1.pressInput = nil
            v18 = a1.pressDelivered
            a1.pressDelivered = false
            if v18 then
                a1:emitPressEnded(Vector2.new(a2.Position.X, a2.Position.Y), os.clock() - a1.pressStartTime, "pointer")
            end
            return nil
        end
    end
    local v16 = a2.UserInputType == Enum.UserInputType.Keyboard
    if v16 then
        v16 = tbl_upv_2[a2.KeyCode] ~= nil
    end
    if v16 then
        a1.keyPressActive = false
        v18 = a1.keyPressDelivered
        a1.keyPressDelivered = false
        if v18 then
            a1:emitPressEnded(a1:getPointerPosition(), 0.1, "key")
        end
        return nil
    elseif a2.UserInputType == Gamepad1_upv_1 and a2.KeyCode == ButtonA_upv_1 and a1.gamepadPressActive then
        a1.gamepadPressActive = false
        v18 = a1.gamepadPressDelivered
        a1.gamepadPressDelivered = false
        if v18 then
            a1:emitPressEnded(a1:getPointerPosition(), os.clock() - a1.gamepadPressStartTime, "key")
        else
            return nil
        end
    end
end
local function u2(a1, a2, a3)
    --[[
      name: updateStickFlick
      line: 330
      upvalues:
        gamepadUiCaptureAtom_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
    ]]
    local v19 = math.sqrt((a2 * a2) + (a3 * a3))
    if a1.flickReady then
        if v19 >= 0.6 then
            a1.flickReady = false
            if gamepadUiCaptureAtom_upv_1() then
                return nil
            end
            a1:emitSwipe(u2(a2, a3), "key")
        else
            return nil
        end
    elseif v19 <= 0.35 then
        a1.flickReady = true
    end
end
u3.updateStickFlick = u2
u3.emitPressBegan = function(a1, a2, a3)
    --[[
      name: emitPressBegan
      line: 345
    ]]
    if not a1.inputEnabled or a1.activeHandle == nil then
        return
    end
    a1.activeHandle.pressBegan:Fire(a2, a3)
end
u3.emitPressEnded = function(a1, a2, a3, a4)
    --[[
      name: emitPressEnded
      line: 350
    ]]
    if not a1.inputEnabled or a1.activeHandle == nil then
        return
    end
    a1.activeHandle.pressEnded:Fire(a2, a3, a4)
end
u3.emitSwipe = function(a1, a2, a3)
    --[[
      name: emitSwipe
      line: 355
    ]]
    if not a1.inputEnabled or a1.activeHandle == nil then
        return
    end
    a1.activeHandle.swipe:Fire(a2, a3)
end
u3.emitDrag = function(a1, a2, a3)
    --[[
      name: emitDrag
      line: 360
    ]]
    if not a1.inputEnabled or a1.activeHandle == nil then
        return
    end
    a1.activeHandle.drag:Fire(a2, a3)
end
Reflect_1.defineMetadata(u3, "identifier", "client/controllers/input-controller@InputController")
Reflect_1.defineMetadata(u3, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u3, "$:flamework@Controller", Controller_1, {})
u1 = function(a1)
    --[[
      name: dominantDirection
      line: 373
    ]]
    local v20 = math.abs(a1.X)
    if math.abs(a1.Y) > v20 then
        if a1.Y <= 0 then
            return "up"
        end
        return "down"
    elseif a1.X <= 0 then
        return "left"
    else
        return "right"
    end
end
u2 = function(a1, a2)
    --[[
      name: stickDirection
      line: 380
    ]]
    local v21 = math.abs(a1)
    if math.abs(a2) > v21 then
        if a2 <= 0 then
            return "down"
        end
        return "up"
    elseif a1 <= 0 then
        return "left"
    else
        return "right"
    end
end
local tbl_7 = {}
tbl_7.InputController = u3
return tbl_7