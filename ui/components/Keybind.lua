--!strict

--[[
    5AM Hub
    File: ui/components/Keybind.lua

    Rebindable keyboard control supporting Toggle, Hold, and Always modes,
    typing suppression, persistent Enum.KeyCode values, and active callbacks.
]]

local Keybind = {}
Keybind.__index = Keybind

local VALID_MODES = {
    Toggle = true,
    Hold = true,
    Always = true,
}

local function NormalizeMode(mode: any): string
    local text = string.lower(tostring(mode or "Toggle"))

    if text == "hold" then
        return "Hold"
    elseif text == "always" then
        return "Always"
    end

    return "Toggle"
end

local function NormalizeKeyCode(value: any): Enum.KeyCode?
    if typeof(value) == "EnumItem" and value.EnumType == Enum.KeyCode then
        return value
    end

    if type(value) == "string" then
        return (Enum.KeyCode :: any)[value]
    end

    return nil
end

local function KeyCodeText(keyCode: Enum.KeyCode): string
    return if keyCode == Enum.KeyCode.None then "None" else keyCode.Name
end

function Keybind.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Keybind",
        Description = "",
        Default = Enum.KeyCode.None,
        Mode = "Toggle",
        Flag = nil,
        Callback = nil,
        Disabled = false,
    }, options)

    local defaultKey = NormalizeKeyCode(options.Default) or Enum.KeyCode.None
    local mode = NormalizeMode(options.Mode)

    local self = setmetatable({
        _ui = ui,
        _section = section,
        _value = defaultKey,
        _mode = mode,
        _active = mode == "Always",
        _capturing = false,
        _disabled = options.Disabled == true,
        _actionCallback = options.Callback,
    }, Keybind)
    ui:_InitializeValueComponent(self, options, false)
    self.ActiveChanged = ui.Signal.new()

    local description = tostring(options.Description or "")
    local rowHeight = if description == "" then 52 else 66
    local row = ui:_Create("Frame", {
        Name = "Keybind",
        BackgroundTransparency = 0,
        LayoutOrder = #section._components + 1,
        Size = UDim2.new(1, 0, 0, rowHeight),
        ZIndex = 15,
    }, section._componentContainer)
    self.Instance = row
    self._stroke = ui:_AddStroke(row, 1)
    ui:_AddCorner(row, 7)

    local titleLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, if description == "" then 0 else 7),
        Size = UDim2.new(1, -128, 0, if description == "" then rowHeight else 20),
        Text = tostring(options.Title),
        TextSize = ui.Config.TextSize,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 16,
    }, row)
    self._titleLabel = titleLabel

    local descriptionLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, 29),
        Size = UDim2.new(1, -128, 0, 17),
        Text = description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = description ~= "",
        ZIndex = 16,
    }, row)
    self._descriptionLabel = descriptionLabel

    local keyButton = ui:_Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        AutoButtonColor = false,
        BackgroundTransparency = 0,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.fromOffset(106, 34),
        Text = KeyCodeText(self._value),
        TextSize = ui.Config.TextSize - 1,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 16,
    }, row)
    ui:_AddCorner(keyButton, 6)
    self._keyButton = keyButton

    local function UpdateKeyText()
        keyButton.Text = if self._capturing then "Press a key..." else KeyCodeText(self._value)
    end
    self._updateKeyText = UpdateKeyText

    ui:_Connect(self, keyButton.Activated, function()
        if not self._disabled then
            self._capturing = true
            UpdateKeyText()
        end
    end)

    local userInputService = ui:_GetUserInputService()
    if userInputService then
        ui:_Connect(self, userInputService.InputBegan, function(input: any, gameProcessed: boolean)
            if self._capturing then
                if input.UserInputType ~= Enum.UserInputType.Keyboard then
                    return
                end

                if input.KeyCode == Enum.KeyCode.Escape then
                    self._capturing = false
                    UpdateKeyText()
                    return
                end

                if input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Delete then
                    self._capturing = false
                    self:Set(Enum.KeyCode.None)
                    return
                end

                if input.KeyCode ~= Enum.KeyCode.Unknown then
                    self._capturing = false
                    self:Set(input.KeyCode)
                end
                return
            end

            if self._disabled or gameProcessed or self._value == Enum.KeyCode.None then
                return
            end

            if userInputService:GetFocusedTextBox() or input.KeyCode ~= self._value then
                return
            end

            if self._mode == "Toggle" then
                self:_SetActive(not self._active)
            elseif self._mode == "Hold" then
                self:_SetActive(true)
            end
        end)

        ui:_Connect(self, userInputService.InputEnded, function(input: any)
            if self._mode == "Hold" and input.KeyCode == self._value then
                self:_SetActive(false)
            end
        end)
    end

    ui:_ObserveTheme(self, function(theme: any)
        row.BackgroundColor3 = theme.Element
        titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
        descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
        keyButton.BackgroundColor3 = if self._active then theme.ElementActive else theme.BackgroundSecondary
        keyButton.TextColor3 = if self._disabled then theme.DisabledText else theme.Accent
        self._stroke.Color = theme.Border
    end)

    ui:_BindFlag(self, options.Flag, self._value)
    return self
end

function Keybind._SetActive(self: any, active: boolean)
    if self._mode == "Always" then
        active = true
    end

    if self._active == active then
        return
    end

    self._active = active
    local theme = self._ui:GetTheme()
    self._keyButton.BackgroundColor3 = if active then theme.ElementActive else theme.BackgroundSecondary

    self._ui:_SafeCall(self._actionCallback, active)
    self.ActiveChanged:Fire(active)
end

function Keybind.Set(self: any, value: any)
    local normalized = NormalizeKeyCode(value)
    if not normalized then
        return
    end

    if self._value == normalized then
        self._updateKeyText()
        return
    end

    self._value = normalized
    self._updateKeyText()
    self._ui:_UpdateFlag(self, self._value)
    self.Changed:Fire(self._value)

    if normalized == Enum.KeyCode.None and self._mode ~= "Always" then
        self:_SetActive(false)
    end
end

function Keybind.Get(self: any): Enum.KeyCode
    return self._value
end

function Keybind.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Keybind.OnActivated(self: any, callback: any): any?
    if self._destroyed or type(callback) ~= "function" then
        return nil
    end

    local connection = self.ActiveChanged:Connect(function(active: boolean)
        self._ui:_SafeCall(callback, active)
    end)
    return self._ui:_TrackConnection(self, connection)
end

function Keybind.SetMode(self: any, mode: any)
    local normalized = NormalizeMode(mode)
    if not VALID_MODES[normalized] or self._mode == normalized then
        return
    end

    self._mode = normalized
    self:_SetActive(normalized == "Always")
end

function Keybind.IsActive(self: any): boolean
    return self._active
end

function Keybind.SetDisabled(self: any, disabled: any)
    self._disabled = disabled == true
    if self._disabled then
        self._capturing = false
        self._updateKeyText()
        if self._mode ~= "Always" then
            self:_SetActive(false)
        end
    end

    local theme = self._ui:GetTheme()
    self._titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
    self._descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
    self._keyButton.TextColor3 = if self._disabled then theme.DisabledText else theme.Accent
end

function Keybind.Destroy(self: any)
    if self._destroyed then
        return
    end

    self._capturing = false
    self._active = false
    self.ActiveChanged:Disconnect()

    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self._ui:_CleanupComponent(self)
end

return Keybind
