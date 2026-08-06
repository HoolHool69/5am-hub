-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local UserInputService_upv_1 = v1.UserInputService
local inputDeviceAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "input-device-atom").inputDeviceAtom
local hudHiddenAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").hudHiddenAtom
local isTouchDevice_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-input-device").isTouchDevice
local MIN_TOUCH_TARGET_PIXELS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-px").MIN_TOUCH_TARGET_PIXELS
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 29
    ]]
    return "TouchButton"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 34
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 38
      upvalues:
        MIN_TOUCH_TARGET_PIXELS_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
    ]]
    a1.connections = {}
    a1.isEnabled = true
    a1.isDesktop = false
    a1.touchText = a3.text
    local v3 = a3.desktopText
    if v3 == nil then
        v3 = a3.text
    end
    a1.desktopText = v3
    a1.look = a3.look
    a1.disabledLook = a3.disabledLook or (a3.look)
    a1.onPressed = a3.onPressed
    a1.onReleased = a3.onReleased
    a1.button = Instance.new("TextButton")
    a1.button.AnchorPoint = a3.anchorPoint
    a1.button.Position = a3.position
    a1.button.Size = UDim2.fromOffset(math.max(a3.width, MIN_TOUCH_TARGET_PIXELS_upv_1), math.max(a3.height, MIN_TOUCH_TARGET_PIXELS_upv_1))
    a1.button.BorderSizePixel = 0
    a1.button.Font = Enum.Font.GothamBold
    a1.button.TextScaled = true
    a1.button.Text = a1.touchText
    a1.button.AutoButtonColor = false
    a1.button.Parent = a2
    local v4 = Instance.new("UICorner")
    v4.CornerRadius = UDim.new(0.25, 0)
    v4.Parent = a1.button
    local v5 = Instance.new("UIPadding")
    v5.PaddingTop = UDim.new(0.2, 0)
    v5.PaddingBottom = UDim.new(0.2, 0)
    v5.PaddingLeft = UDim.new(0.08, 0)
    v5.PaddingRight = UDim.new(0.08, 0)
    v5.Parent = a1.button
    a1.stroke = Instance.new("UIStroke")
    a1.stroke.Thickness = 2
    a1.stroke.Parent = a1.button
    a1:applyLook()
    if a3.onActivated ~= nil then
        local onActivated_upv_1 = a3.onActivated
        table.insert(
            a1.connections,
            (a1.button.Activated:Connect(
                function()
                    --[[
                      line: 78
                      upvalues:
                        onActivated_upv_1 (copy, index: 1)
                    ]]
                    return onActivated_upv_1()
                end
            ))
        )
    end
    table.insert(
        a1.connections,
        (a1.button.InputBegan:Connect(
            function(a4)
                --[[
                  line: 86
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:beginHold(a4)
            end
        ))
    )
    table.insert(
        a1.connections,
        (UserInputService_upv_1.InputEnded:Connect(
            function(a5)
                --[[
                  line: 91
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:endHold(a5)
            end
        ))
    )
end
u1.setEnabled = function(a1, a2)
    --[[
      name: setEnabled
      line: 96
    ]]
    if a1.isEnabled ~= a2 then
        a1.isEnabled = a2
        a1:applyLook()
    else
        return nil
    end
end
u1.setDesktopMode = function(a1, a2)
    --[[
      name: setDesktopMode
      line: 103
    ]]
    a1.isDesktop = a2
    local button_1 = a1.button
    local v6
    if a2 then
        v6 = a1.desktopText
    else
        v6 = a1.touchText
    end
    button_1.Text = v6
end
u1.setDesktopText = function(a1, a2)
    --[[
      name: setDesktopText
      line: 107
    ]]
    if a1.desktopText ~= a2 then
        a1.desktopText = a2
        if a1.isDesktop then
            a1.button.Text = a2
        end
    else
        return nil
    end
end
u1.destroy = function(a1)
    --[[
      name: destroy
      line: 116
    ]]
    a1:releaseHold()
    for _, value_1 in a1.connections do
        value_1:Disconnect()
    end
    a1.button:Destroy()
end
u1.beginHold = function(a1, a2)
    --[[
      name: beginHold
      line: 124
    ]]
    if a2.UserInputType ~= Enum.UserInputType.Touch and a2.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return nil
    end
    if a1.activeInput == nil then
        local v7 = nil
        if a1.isEnabled then
            a1.activeInput = a2
            a1.button.BackgroundTransparency = 0
            v7 = a1.onPressed
            if v7 ~= nil then
                v7()
            end
            return
        end
    end
    return nil
end
u1.endHold = function(a1, a2)
    --[[
      name: endHold
      line: 138
    ]]
    if a2 == a1.activeInput then
        a1:releaseHold()
    else
        return nil
    end
end
u1.releaseHold = function(a1)
    --[[
      name: releaseHold
      line: 144
    ]]
    local v8 = nil
    if a1.activeInput ~= nil then
        a1.activeInput = nil
        a1:applyLook()
        v8 = a1.onReleased
        if v8 ~= nil then
            v8()
        end
    else
        return nil
    end
end
u1.applyLook = function(a1)
    --[[
      name: applyLook
      line: 155
    ]]
    local v9
    if a1.isEnabled then
        v9 = a1.look
    else
        v9 = a1.disabledLook
    end
    a1.button.BackgroundColor3 = v9.background
    a1.button.BackgroundTransparency = ((a1.isEnabled) and 0.15) or 0.5
    a1.button.TextColor3 = v9.text
    a1.stroke.Color = v9.stroke
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 184
    ]]
    return "TouchControls"
end
local u2 = setmetatable(tbl_3, tbl_4)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 189
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v10 = setmetatable({}, u2)
    return v10:constructor(...) or v10
end
u2.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 193
      upvalues:
        Players_upv_1 (copy, index: 1)
        subscribe_upv_1 (copy, index: 2)
        inputDeviceAtom_upv_1 (copy, index: 3)
        hudHiddenAtom_upv_1 (copy, index: 4)
    ]]
    a1.buttons = {}
    local v11
    if a2 == nil then
        v11 = a2
    else
        v11 = a2.showOnDesktop
    end
    local v12
    if v11 == true then
        v12 = true
    else
        v12 = false
    end
    a1.showOnDesktop = v12
    a1.screenGui = Instance.new("ScreenGui")
    a1.screenGui.Name = "TouchControls"
    a1.screenGui.ResetOnSpawn = false
    a1.screenGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    a1.screenGui.DisplayOrder = -1
    a1.screenGui.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    a1:applyDevice()
    a1.unsubscribeDevice = subscribe_upv_1(
        inputDeviceAtom_upv_1,
        function()
            --[[
              line: 208
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyDevice()
        end
    )
    a1.unsubscribeHudHidden = subscribe_upv_1(
        hudHiddenAtom_upv_1,
        function()
            --[[
              line: 212
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyDevice()
        end
    )
end
u2.addButton = function(a1, a2)
    --[[
      name: addButton
      line: 216
      upvalues:
        u1 (ref,  index: 1)
        inputDeviceAtom_upv_1 (copy, index: 2)
    ]]
    local v13 = u1.new(a1.screenGui, a2)
    local v14 = inputDeviceAtom_upv_1() == "mouse"
    v13:setDesktopMode(v14)
    table.insert(a1.buttons, v13)
    return v13
end
u2.applyDevice = function(a1)
    --[[
      name: applyDevice
      line: 223
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
        isTouchDevice_upv_1 (copy, index: 2)
        hudHiddenAtom_upv_1 (copy, index: 3)
    ]]
    local v15 = inputDeviceAtom_upv_1()
    local v16 = isTouchDevice_upv_1()
    local screenGui_1 = a1.screenGui
    local v17
    if a1.showOnDesktop or v16 then
        v17 = false
        if v15 ~= "gamepad" then
            v17 = not hudHiddenAtom_upv_1()
        end
    else
        v17 = v16
    end
    screenGui_1.Enabled = v17
    for _, value_2 in a1.buttons do
        value_2:setDesktopMode(v15 == "mouse")
    end
end
u2.destroy = function(a1)
    --[[
      name: destroy
      line: 231
    ]]
    for _, value_3 in a1.buttons do
        value_3:destroy()
    end
    table.clear(a1.buttons)
    a1.unsubscribeDevice()
    a1.unsubscribeHudHidden()
    a1.screenGui:Destroy()
end
local tbl_5 = {}
tbl_5.TouchButton = u1
tbl_5.TouchControls = u2
return tbl_5