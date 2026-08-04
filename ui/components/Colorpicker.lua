--!strict

--[[
    5AM Hub
    File: ui/components/Colorpicker.lua

    HSV color picker with saturation/value, hue, optional transparency,
    hexadecimal input, mouse/touch interaction, themes, and flag persistence.
]]

local Colorpicker = {}
Colorpicker.__index = Colorpicker

local function Clamp(value: number, minimum: number, maximum: number): number
    return math.max(minimum, math.min(maximum, value))
end

local function ColorToHex(color: Color3): string
    return string.format(
        "#%02X%02X%02X",
        math.round(color.R * 255),
        math.round(color.G * 255),
        math.round(color.B * 255)
    )
end

local function HexToColor(value: string): Color3?
    local hex = string.gsub(value, "#", "")
    if #hex ~= 6 or not string.match(hex, "^%x%x%x%x%x%x$") then
        return nil
    end

    local red = tonumber(string.sub(hex, 1, 2), 16)
    local green = tonumber(string.sub(hex, 3, 4), 16)
    local blue = tonumber(string.sub(hex, 5, 6), 16)

    if not red or not green or not blue then
        return nil
    end

    return Color3.fromRGB(red, green, blue)
end

local function NormalizeColor(value: any): (Color3?, number?)
    if typeof(value) == "Color3" then
        return value, nil
    end

    if type(value) == "string" then
        return HexToColor(value), nil
    end

    if type(value) == "table" then
        local nestedColor = value.Color or value[1]
        if typeof(nestedColor) == "Color3" then
            return nestedColor, tonumber(value.Transparency or value[2])
        end

        if tonumber(value.R) and tonumber(value.G) and tonumber(value.B) then
            local red = tonumber(value.R) :: number
            local green = tonumber(value.G) :: number
            local blue = tonumber(value.B) :: number

            if red > 1 or green > 1 or blue > 1 then
                return Color3.fromRGB(red, green, blue), tonumber(value.Transparency)
            end

            return Color3.new(red, green, blue), tonumber(value.Transparency)
        end
    end

    return nil, nil
end

function Colorpicker.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Colorpicker",
        Description = "",
        Default = Color3.fromRGB(255, 255, 255),
        Transparency = 0,
        AllowTransparency = false,
        Flag = nil,
        Callback = nil,
        Disabled = false,
    }, options)

    local defaultColor = NormalizeColor(options.Default)
    if not defaultColor then
        defaultColor = Color3.new(1, 1, 1)
    end

    local hue, saturation, brightness = defaultColor:ToHSV()
    local self = setmetatable({
        _ui = ui,
        _section = section,
        _color = defaultColor,
        _transparency = Clamp(tonumber(options.Transparency) or 0, 0, 1),
        _allowTransparency = options.AllowTransparency == true,
        _disabled = options.Disabled == true,
        _open = false,
        _hue = hue,
        _saturation = saturation,
        _brightness = brightness,
        _pickerKind = nil,
        _pickerInput = nil,
    }, Colorpicker)
    ui:_InitializeValueComponent(self, options)

    local description = tostring(options.Description or "")
    self._closedHeight = if description == "" then 52 else 66
    self._panelHeight = if self._allowTransparency then 220 else 184

    local row = ui:_Create("Frame", {
        Name = "Colorpicker",
        BackgroundTransparency = 0,
        ClipsDescendants = true,
        LayoutOrder = #section._components + 1,
        Size = UDim2.new(1, 0, 0, self._closedHeight),
        ZIndex = 20,
    }, section._componentContainer)
    self.Instance = row
    self._stroke = ui:_AddStroke(row, 1)
    ui:_AddCorner(row, 7)

    local titleLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, if description == "" then 0 else 7),
        Size = UDim2.new(1, -78, 0, if description == "" then self._closedHeight else 20),
        Text = tostring(options.Title),
        TextSize = ui.Config.TextSize,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 21,
    }, row)
    self._titleLabel = titleLabel

    local descriptionLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, 29),
        Size = UDim2.new(1, -78, 0, 17),
        Text = description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = description ~= "",
        ZIndex = 21,
    }, row)
    self._descriptionLabel = descriptionLabel

    local preview = ui:_Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        AutoButtonColor = false,
        BackgroundColor3 = self._color,
        BackgroundTransparency = self._transparency,
        Position = UDim2.new(1, -12, 0, self._closedHeight / 2),
        Size = UDim2.fromOffset(48, 28),
        Text = "",
        ZIndex = 22,
    }, row)
    ui:_AddCorner(preview, 6)
    self._preview = preview
    self._previewStroke = ui:_AddStroke(preview, 1)

    local panel = ui:_Create("Frame", {
        Name = "PickerPanel",
        BackgroundTransparency = 0,
        Position = UDim2.fromOffset(10, self._closedHeight),
        Size = UDim2.new(1, -20, 0, self._panelHeight),
        Visible = false,
        ZIndex = 30,
    }, row)
    ui:_AddCorner(panel, 6)
    self._panel = panel

    local saturationValue = ui:_Create("TextButton", {
        Name = "SaturationValue",
        Active = true,
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromHSV(self._hue, 1, 1),
        ClipsDescendants = true,
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.new(1, -46, 0, 126),
        Text = "",
        ZIndex = 31,
    }, panel)
    ui:_AddCorner(saturationValue, 5)
    self._saturationValue = saturationValue

    local whiteLayer = ui:_Create("Frame", {
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 32,
    }, saturationValue)
    ui:_Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1),
        }),
    }, whiteLayer)

    local blackLayer = ui:_Create("Frame", {
        BackgroundColor3 = Color3.new(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 33,
    }, saturationValue)
    ui:_Create("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 0),
        }),
    }, blackLayer)

    local saturationCursor = ui:_Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(self._saturation, 1 - self._brightness),
        Size = UDim2.fromOffset(10, 10),
        ZIndex = 34,
    }, saturationValue)
    ui:_AddCorner(saturationCursor, 5)
    ui:_AddStroke(saturationCursor, 1)
    self._saturationCursor = saturationCursor

    local hueBar = ui:_Create("TextButton", {
        Name = "Hue",
        Active = true,
        AnchorPoint = Vector2.new(1, 0),
        AutoButtonColor = false,
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.new(1, -8, 0, 8),
        Size = UDim2.fromOffset(22, 126),
        Text = "",
        ZIndex = 31,
    }, panel)
    ui:_AddCorner(hueBar, 5)
    ui:_Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
        }),
        Rotation = 90,
    }, hueBar)
    self._hueBar = hueBar

    local hueCursor = ui:_Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(0.5, self._hue),
        Size = UDim2.new(1, 4, 0, 4),
        ZIndex = 34,
    }, hueBar)
    ui:_AddCorner(hueCursor, 2)
    self._hueCursor = hueCursor

    local hexInput = ui:_Create("TextBox", {
        Name = "Hex",
        BackgroundTransparency = 0,
        ClearTextOnFocus = false,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(8, 142),
        Size = UDim2.new(1, -16, 0, 32),
        Text = ColorToHex(self._color),
        TextSize = ui.Config.TextSize - 1,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 31,
    }, panel)
    ui:_AddCorner(hexInput, 5)
    self._hexInput = hexInput

    local transparencyBar = ui:_Create("TextButton", {
        Name = "Transparency",
        Active = true,
        AutoButtonColor = false,
        BackgroundColor3 = self._color,
        Position = UDim2.fromOffset(8, 184),
        Size = UDim2.new(1, -16, 0, 18),
        Text = "",
        Visible = self._allowTransparency,
        ZIndex = 31,
    }, panel)
    ui:_AddCorner(transparencyBar, 5)
    ui:_Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1),
        }),
    }, transparencyBar)
    self._transparencyBar = transparencyBar

    local transparencyCursor = ui:_Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Position = UDim2.fromScale(self._transparency, 0.5),
        Size = UDim2.fromOffset(4, 24),
        ZIndex = 32,
    }, transparencyBar)
    ui:_AddCorner(transparencyCursor, 2)
    self._transparencyCursor = transparencyCursor

    local function UpdateFromInput(kind: string, input: any)
        if self._disabled then
            return
        end

        if kind == "SaturationValue" then
            if saturationValue.AbsoluteSize.X <= 0 or saturationValue.AbsoluteSize.Y <= 0 then
                return
            end

            local saturation = Clamp((input.Position.X - saturationValue.AbsolutePosition.X) / saturationValue.AbsoluteSize.X, 0, 1)
            local value = 1 - Clamp((input.Position.Y - saturationValue.AbsolutePosition.Y) / saturationValue.AbsoluteSize.Y, 0, 1)
            self:Set(Color3.fromHSV(self._hue, saturation, value), self._transparency)
        elseif kind == "Hue" then
            if hueBar.AbsoluteSize.Y <= 0 then
                return
            end

            local hueValue = Clamp((input.Position.Y - hueBar.AbsolutePosition.Y) / hueBar.AbsoluteSize.Y, 0, 1)
            self:Set(Color3.fromHSV(hueValue, self._saturation, self._brightness), self._transparency)
        elseif kind == "Transparency" and self._allowTransparency then
            if transparencyBar.AbsoluteSize.X <= 0 then
                return
            end

            local transparency = Clamp((input.Position.X - transparencyBar.AbsolutePosition.X) / transparencyBar.AbsoluteSize.X, 0, 1)
            self:Set(self._color, transparency)
        end
    end

    local function BeginPicker(kind: string, input: any)
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
            return
        end

        self._pickerKind = kind
        self._pickerInput = input
        UpdateFromInput(kind, input)
    end

    ui:_Connect(self, saturationValue.InputBegan, function(input: any)
        BeginPicker("SaturationValue", input)
    end)
    ui:_Connect(self, hueBar.InputBegan, function(input: any)
        BeginPicker("Hue", input)
    end)
    ui:_Connect(self, transparencyBar.InputBegan, function(input: any)
        BeginPicker("Transparency", input)
    end)
    ui:_Connect(self, preview.Activated, function()
        if not self._disabled then
            if self._open then
                self:Close()
            else
                self:Open()
            end
        end
    end)
    ui:_Connect(self, hexInput.FocusLost, function()
        local parsed = HexToColor(hexInput.Text)
        if parsed then
            self:Set(parsed, self._transparency)
        else
            hexInput.Text = ColorToHex(self._color)
        end
    end)

    local userInputService = ui:_GetUserInputService()
    if userInputService then
        ui:_Connect(self, userInputService.InputChanged, function(input: any)
            if not self._pickerInput or not self._pickerKind then
                return
            end

            local activeType = self._pickerInput.UserInputType
            if (activeType == Enum.UserInputType.Touch and input == self._pickerInput)
                or (activeType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)
            then
                UpdateFromInput(self._pickerKind, input)
            end
        end)

        ui:_Connect(self, userInputService.InputEnded, function(input: any)
            if input == self._pickerInput or (
                self._pickerInput
                and self._pickerInput.UserInputType == Enum.UserInputType.MouseButton1
                and input.UserInputType == Enum.UserInputType.MouseButton1
            ) then
                self._pickerKind = nil
                self._pickerInput = nil
            end
        end)

        ui:_Connect(self, userInputService.InputBegan, function(input: any)
            if not self._open then
                return
            end

            local inputType = input.UserInputType
            if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
                return
            end

            local position = input.Position
            local absolutePosition = row.AbsolutePosition
            local absoluteSize = row.AbsoluteSize
            local inside = position.X >= absolutePosition.X
                and position.X <= absolutePosition.X + absoluteSize.X
                and position.Y >= absolutePosition.Y
                and position.Y <= absolutePosition.Y + absoluteSize.Y

            if not inside then
                self:Close()
            end
        end)
    end

    ui:_ObserveTheme(self, function(theme: any)
        row.BackgroundColor3 = theme.Element
        titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
        descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
        panel.BackgroundColor3 = theme.BackgroundSecondary
        hexInput.BackgroundColor3 = theme.Element
        hexInput.TextColor3 = theme.Text
        saturationCursor.BackgroundColor3 = theme.Text
        hueCursor.BackgroundColor3 = theme.Text
        transparencyCursor.BackgroundColor3 = theme.Text
        self._stroke.Color = theme.Border
        self._previewStroke.Color = theme.Border
    end)

    ui:_BindFlag(self, options.Flag, self:_GetFlagValue())
    self:_UpdateVisuals()
    return self
end

function Colorpicker._GetFlagValue(self: any): any
    if self._allowTransparency then
        return {
            Color = self._color,
            Transparency = self._transparency,
        }
    end

    return self._color
end

function Colorpicker._UpdateVisuals(self: any)
    self._preview.BackgroundColor3 = self._color
    self._preview.BackgroundTransparency = self._transparency
    self._saturationValue.BackgroundColor3 = Color3.fromHSV(self._hue, 1, 1)
    self._saturationCursor.Position = UDim2.fromScale(self._saturation, 1 - self._brightness)
    self._hueCursor.Position = UDim2.fromScale(0.5, self._hue)
    self._transparencyBar.BackgroundColor3 = self._color
    self._transparencyCursor.Position = UDim2.fromScale(self._transparency, 0.5)

    if not self._hexInput:IsFocused() then
        self._hexInput.Text = ColorToHex(self._color)
    end
end

function Colorpicker.Set(self: any, value: any, transparency: any?)
    local color, embeddedTransparency = NormalizeColor(value)
    if not color then
        return
    end

    local normalizedTransparency = self._transparency
    if self._allowTransparency then
        normalizedTransparency = Clamp(
            tonumber(transparency) or embeddedTransparency or self._transparency,
            0,
            1
        )
    else
        normalizedTransparency = 0
    end

    local changed = self._color ~= color or self._transparency ~= normalizedTransparency
    self._color = color
    self._transparency = normalizedTransparency
    self._hue, self._saturation, self._brightness = color:ToHSV()
    self:_UpdateVisuals()

    if changed then
        self._ui:_UpdateFlag(self, self:_GetFlagValue())
        self.Changed:Fire(self._color, self._transparency)
    end
end

function Colorpicker.Get(self: any)
    if self._allowTransparency then
        return self._color, self._transparency
    end

    return self._color
end

function Colorpicker.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Colorpicker.Open(self: any)
    if self._destroyed or self._disabled or self._open then
        return
    end

    self._open = true
    self._panel.Visible = true
    self._ui.Tween:Create(self.Instance, "Smooth", {
        Size = UDim2.new(1, 0, 0, self._closedHeight + self._panelHeight + 8),
    })
end

function Colorpicker.Close(self: any)
    if not self._open then
        return
    end

    self._open = false
    self._panel.Visible = false
    self._pickerKind = nil
    self._pickerInput = nil
    self._ui.Tween:Create(self.Instance, "Smooth", {
        Size = UDim2.new(1, 0, 0, self._closedHeight),
    })
end

function Colorpicker.SetDisabled(self: any, disabled: any)
    self._disabled = disabled == true
    if self._disabled then
        self:Close()
    end

    local theme = self._ui:GetTheme()
    self._titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
    self._descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
end

function Colorpicker.Destroy(self: any)
    if self._destroyed then
        return
    end

    self._pickerKind = nil
    self._pickerInput = nil

    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self._ui:_CleanupComponent(self)
end

return Colorpicker
