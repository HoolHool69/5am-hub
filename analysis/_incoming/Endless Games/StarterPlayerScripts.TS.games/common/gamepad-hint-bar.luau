-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Players_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local inputDeviceAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "input-device-atom").inputDeviceAtom
local hudHiddenAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").hudHiddenAtom
local gamepadGlyphImage_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "input-glyphs").gamepadGlyphImage
local u1 = Color3.fromRGB(16, 18, 28)
local u2 = Color3.fromRGB(226, 232, 248)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 26
    ]]
    return "GamepadHintBar"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 31
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u3)
    return v1:constructor(...) or v1
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 35
      upvalues:
        Players_upv_1 (copy, index: 1)
        subscribe_upv_1 (copy, index: 2)
        inputDeviceAtom_upv_1 (copy, index: 3)
        hudHiddenAtom_upv_1 (copy, index: 4)
    ]]
    a1.hasEntries = false
    a1.screenGui = Instance.new("ScreenGui")
    a1.screenGui.Name = "GamepadHints"
    a1.screenGui.ResetOnSpawn = false
    a1.screenGui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    local v2 = a2.displayOrder
    if v2 == nil then
        v2 = 5
    end
    a1.screenGui.DisplayOrder = v2
    a1.screenGui.Enabled = false
    a1.screenGui.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    a1.row = Instance.new("Frame")
    a1.row.BackgroundTransparency = 1
    a1.row.AutomaticSize = Enum.AutomaticSize.XY
    if a2.anchor ~= "bottomCenter" then
        a1.row.AnchorPoint = Vector2.new(1, 1)
        a1.row.Position = UDim2.new(1, -14, 1, -14)
    else
        a1.row.AnchorPoint = Vector2.new(0.5, 1)
        a1.row.Position = UDim2.new(0.5, 0, 1, -14)
    end
    local v3 = Instance.new("UIListLayout")
    v3.FillDirection = Enum.FillDirection.Horizontal
    v3.VerticalAlignment = Enum.VerticalAlignment.Center
    v3.SortOrder = Enum.SortOrder.LayoutOrder
    v3.Padding = UDim.new(0, 8)
    v3.Parent = a1.row
    a1.row.Parent = a1.screenGui
    a1.unsubscribeDevice = subscribe_upv_1(
        inputDeviceAtom_upv_1,
        function()
            --[[
              line: 65
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyVisibility()
        end
    )
    a1.unsubscribeHudHidden = subscribe_upv_1(
        hudHiddenAtom_upv_1,
        function()
            --[[
              line: 68
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyVisibility()
        end
    )
end
u3.setEntries = function(a1, a2)
    --[[
      name: setEntries
      line: 72
    ]]
    for _, value_1 in a1.row:GetChildren() do
        if value_1:IsA("GuiObject") then
            value_1:Destroy()
        end
    end
    local _ = nil
    for key_1, value_2 in a2 do
        _ = a1:buildChip(value_2, key_1 - 1)
    end
    a1.hasEntries = #a2 > 0
    a1:applyVisibility()
end
u3.destroy = function(a1)
    --[[
      name: destroy
      line: 89
    ]]
    a1.unsubscribeDevice()
    a1.unsubscribeHudHidden()
    a1.screenGui:Destroy()
end
u3.applyVisibility = function(a1)
    --[[
      name: applyVisibility
      line: 94
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
        hudHiddenAtom_upv_1 (copy, index: 2)
    ]]
    local screenGui_1 = a1.screenGui
    local v4 = a1.hasEntries
    if v4 then
        v4 = false
        if inputDeviceAtom_upv_1() == "gamepad" then
            v4 = not hudHiddenAtom_upv_1()
        end
    end
    screenGui_1.Enabled = v4
end
u3.buildChip = function(a1, a2, a3)
    --[[
      name: buildChip
      line: 97
      upvalues:
        u1 (copy, index: 1)
        gamepadGlyphImage_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    local v5 = Instance.new("Frame")
    v5.Name = a2.label
    v5.LayoutOrder = a3
    v5.BackgroundColor3 = u1
    v5.BackgroundTransparency = 0.25
    v5.BorderSizePixel = 0
    v5.AutomaticSize = Enum.AutomaticSize.X
    v5.Size = UDim2.fromOffset(0, 30)
    local v6 = Instance.new("UICorner")
    v6.CornerRadius = UDim.new(0.5, 0)
    v6.Parent = v5
    local v7 = Instance.new("UIPadding")
    v7.PaddingLeft = UDim.new(0, 8)
    v7.PaddingRight = UDim.new(0, 10)
    v7.Parent = v5
    local v8 = Instance.new("UIListLayout")
    v8.FillDirection = Enum.FillDirection.Horizontal
    v8.VerticalAlignment = Enum.VerticalAlignment.Center
    v8.SortOrder = Enum.SortOrder.LayoutOrder
    v8.Padding = UDim.new(0, 6)
    v8.Parent = v5
    local v9 = Instance.new("ImageLabel")
    v9.LayoutOrder = 1
    v9.BackgroundTransparency = 1
    v9.Image = gamepadGlyphImage_upv_1(a2.keyCode)
    v9.ScaleType = Enum.ScaleType.Fit
    v9.Size = UDim2.fromOffset(22, 22)
    v9.Parent = v5
    local v10 = Instance.new("TextLabel")
    v10.LayoutOrder = 2
    v10.BackgroundTransparency = 1
    v10.AutomaticSize = Enum.AutomaticSize.X
    v10.Size = UDim2.fromOffset(0, 30)
    v10.Font = Enum.Font.GothamBold
    v10.TextSize = 14
    v10.TextColor3 = u2
    v10.Text = a2.label
    v10.Parent = v5
    v5.Parent = a1.row
end
local tbl_3 = {}
tbl_3.GamepadHintBar = u3
return tbl_3