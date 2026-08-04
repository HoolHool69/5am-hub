--!strict

--[[
    5AM Hub
    File: ui/components/Textbox.lua

    Persistent text input with finished/live callbacks, numeric filtering,
    cursor-aware normalization, placeholders, and length limits.
]]

local Textbox = {}
Textbox.__index = Textbox

local function NormalizeNumericText(text: string): string
    local output = ""
    local hasDecimal = false

    for index = 1, #text do
        local character = string.sub(text, index, index)

        if string.match(character, "%d") then
            output ..= character
        elseif character == "-" and #output == 0 then
            output ..= character
        elseif character == "." and not hasDecimal then
            output ..= character
            hasDecimal = true
        end
    end

    return output
end

local function NormalizeText(value: any, numeric: boolean, maximumLength: number?): string
    local text = tostring(value or "")

    if numeric then
        text = NormalizeNumericText(text)
    end

    if maximumLength and maximumLength >= 0 and #text > maximumLength then
        text = string.sub(text, 1, maximumLength)
    end

    return text
end

function Textbox.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Textbox",
        Description = "",
        Default = "",
        Placeholder = "",
        Numeric = false,
        ClearOnFocus = false,
        Finished = true,
        MaxLength = nil,
        Flag = nil,
        Callback = nil,
        Disabled = false,
    }, options)

    local maximumLength = tonumber(options.MaxLength)
    if maximumLength then
        maximumLength = math.max(0, math.floor(maximumLength))
    end

    local self = setmetatable({
        _ui = ui,
        _section = section,
        _numeric = options.Numeric == true,
        _finished = options.Finished ~= false,
        _maximumLength = maximumLength,
        _disabled = options.Disabled == true,
        _updatingText = false,
        _value = NormalizeText(options.Default, options.Numeric == true, maximumLength),
    }, Textbox)
    ui:_InitializeValueComponent(self, options)

    local description = tostring(options.Description or "")
    local rowHeight = if description == "" then 52 else 66
    local row = ui:_Create("Frame", {
        Name = "Textbox",
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
        Size = UDim2.new(0.44, -16, 0, if description == "" then rowHeight else 20),
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
        Size = UDim2.new(0.44, -16, 0, 17),
        Text = description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = description ~= "",
        ZIndex = 16,
    }, row)
    self._descriptionLabel = descriptionLabel

    local textInput = ui:_Create("TextBox", {
        Name = "Input",
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 0,
        ClearTextOnFocus = options.ClearOnFocus == true,
        Font = ui.Config.Font,
        MultiLine = false,
        PlaceholderText = tostring(options.Placeholder or ""),
        Position = UDim2.new(1, -10, 0.5, 0),
        Size = UDim2.new(0.54, -10, 0, 34),
        Text = self._value,
        TextEditable = not self._disabled,
        TextSize = ui.Config.TextSize - 1,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 16,
    }, row)
    ui:_AddCorner(textInput, 6)
    self._textInput = textInput

    ui:_Create("UIPadding", {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
    }, textInput)

    local function NormalizeVisibleText()
        if self._updatingText then
            return
        end

        local currentText = textInput.Text
        local normalized = NormalizeText(currentText, self._numeric, self._maximumLength)

        if normalized ~= currentText then
            local cursorPosition = textInput.CursorPosition
            self._updatingText = true
            textInput.Text = normalized
            textInput.CursorPosition = math.min(cursorPosition, #normalized + 1)
            self._updatingText = false
        end

        if not self._finished then
            self:Set(normalized)
        end
    end

    ui:_Connect(self, textInput:GetPropertyChangedSignal("Text"), NormalizeVisibleText)
    ui:_Connect(self, textInput.FocusLost, function()
        self:Set(textInput.Text)
    end)

    ui:_ObserveTheme(self, function(theme: any)
        row.BackgroundColor3 = theme.Element
        titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
        descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
        textInput.BackgroundColor3 = theme.BackgroundSecondary
        textInput.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
        textInput.PlaceholderColor3 = theme.DisabledText
        self._stroke.Color = theme.Border
    end)

    ui:_BindFlag(self, options.Flag, self._value)
    return self
end

function Textbox.Set(self: any, value: any)
    local normalized = NormalizeText(value, self._numeric, self._maximumLength)
    local changed = self._value ~= normalized
    self._value = normalized

    if self._textInput.Text ~= normalized then
        local hadFocus = self._textInput:IsFocused()
        local cursorPosition = self._textInput.CursorPosition
        self._updatingText = true
        self._textInput.Text = normalized
        if hadFocus then
            self._textInput.CursorPosition = math.min(cursorPosition, #normalized + 1)
        end
        self._updatingText = false
    end

    if changed then
        self._ui:_UpdateFlag(self, self._value)
        self.Changed:Fire(self._value)
    end
end

function Textbox.Get(self: any): string
    return self._value
end

function Textbox.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Textbox.SetPlaceholder(self: any, text: any)
    self._textInput.PlaceholderText = tostring(text or "")
end

function Textbox.SetDisabled(self: any, disabled: any)
    self._disabled = disabled == true
    self._textInput.TextEditable = not self._disabled
    self._textInput.Active = not self._disabled

    local theme = self._ui:GetTheme()
    self._titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
    self._descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
    self._textInput.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
end

function Textbox.Focus(self: any)
    if not self._disabled and not self._destroyed then
        self._textInput:CaptureFocus()
    end
end

function Textbox.Destroy(self: any)
    if self._destroyed then
        return
    end

    if self._textInput:IsFocused() then
        self._textInput:ReleaseFocus()
    end

    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self._ui:_CleanupComponent(self)
end

return Textbox
