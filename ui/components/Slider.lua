--!strict

--[[
    5AM Hub
    File: ui/components/Slider.lua

    Mouse and touch numeric slider with clamping, increment rounding,
    animation, flag persistence, and safe invalid-range handling.
]]

local Slider = {}
Slider.__index = Slider

local function Clamp(value: number, minimum: number, maximum: number): number
    return math.max(minimum, math.min(maximum, value))
end

local function NormalizeRange(minimum: any, maximum: any): (number, number)
    local normalizedMin = tonumber(minimum) or 0
    local normalizedMax = tonumber(maximum) or 100

    if normalizedMax < normalizedMin then
        normalizedMin, normalizedMax = normalizedMax, normalizedMin
    end

    return normalizedMin, normalizedMax
end

local function RoundToIncrement(value: number, minimum: number, increment: number): number
    if increment <= 0 then
        return value
    end

    return minimum + math.floor(((value - minimum) / increment) + 0.5) * increment
end

local function DecimalPlaces(increment: number): number
    local text = string.format("%.6f", increment)
    text = string.gsub(text, "0+$", "")
    local decimals = string.match(text, "%.(%d+)$")
    return if decimals then #decimals else 0
end

function Slider.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Slider",
        Description = "",
        Min = 0,
        Max = 100,
        Default = 50,
        Increment = 1,
        Suffix = "",
        Flag = nil,
        Callback = nil,
        Disabled = false,
    }, options)

    local minimum, maximum = NormalizeRange(options.Min, options.Max)
    local increment = math.abs(tonumber(options.Increment) or 1)
    if increment == 0 then
        increment = 1
    end

    local defaultValue = Clamp(tonumber(options.Default) or minimum, minimum, maximum)
    defaultValue = Clamp(RoundToIncrement(defaultValue, minimum, increment), minimum, maximum)

    local self = setmetatable({
        _ui = ui,
        _section = section,
        _min = minimum,
        _max = maximum,
        _increment = increment,
        _suffix = tostring(options.Suffix or ""),
        _value = defaultValue,
        _disabled = options.Disabled == true,
        _dragging = false,
        _dragInput = nil,
    }, Slider)
    ui:_InitializeValueComponent(self, options)

    local description = tostring(options.Description or "")
    local row = ui:_Create("Frame", {
        Name = "Slider",
        BackgroundTransparency = 0,
        LayoutOrder = #section._components + 1,
        Size = UDim2.new(1, 0, 0, if description == "" then 66 else 78),
        ZIndex = 15,
    }, section._componentContainer)
    self.Instance = row
    self._stroke = ui:_AddStroke(row, 1)
    ui:_AddCorner(row, 7)

    local titleLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, 7),
        Size = UDim2.new(1, -110, 0, 20),
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
        Position = UDim2.fromOffset(12, 28),
        Size = UDim2.new(1, -24, 0, 16),
        Text = description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = description ~= "",
        ZIndex = 16,
    }, row)
    self._descriptionLabel = descriptionLabel

    local valueLabel = ui:_Create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -12, 0, 7),
        Size = UDim2.fromOffset(92, 20),
        Text = "",
        TextSize = ui.Config.TextSize,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 16,
    }, row)
    self._valueLabel = valueLabel

    local trackY = if description == "" then 44 else 56
    local track = ui:_Create("Frame", {
        Name = "Track",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 0,
        Position = UDim2.new(0, 12, 0, trackY),
        Size = UDim2.new(1, -24, 0, 6),
        ZIndex = 16,
    }, row)
    ui:_AddCorner(track, 3)
    self._track = track

    local fill = ui:_Create("Frame", {
        Name = "Fill",
        BackgroundTransparency = 0,
        Size = UDim2.fromScale(0, 1),
        ZIndex = 17,
    }, track)
    ui:_AddCorner(fill, 3)
    self._fill = fill

    local hitbox = ui:_Create("TextButton", {
        Name = "Hitbox",
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 24),
        Text = "",
        ZIndex = 18,
    }, track)

    local function UpdateFromInput(input: any)
        if self._disabled or self._destroyed or track.AbsoluteSize.X <= 0 then
            return
        end

        local relativeX = input.Position.X - track.AbsolutePosition.X
        local ratio = Clamp(relativeX / track.AbsoluteSize.X, 0, 1)
        self:Set(self._min + (self._max - self._min) * ratio)
    end

    ui:_Connect(self, hitbox.InputBegan, function(input: any)
        local inputType = input.UserInputType
        if self._disabled or (inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch) then
            return
        end

        self._dragging = true
        self._dragInput = input
        UpdateFromInput(input)
    end)

    local userInputService = ui:_GetUserInputService()
    if userInputService then
        ui:_Connect(self, userInputService.InputChanged, function(input: any)
            if not self._dragging or not self._dragInput then
                return
            end

            local activeType = self._dragInput.UserInputType
            if (activeType == Enum.UserInputType.Touch and input == self._dragInput)
                or (activeType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseMovement)
            then
                UpdateFromInput(input)
            end
        end)

        ui:_Connect(self, userInputService.InputEnded, function(input: any)
            if input == self._dragInput or (
                self._dragInput
                and self._dragInput.UserInputType == Enum.UserInputType.MouseButton1
                and input.UserInputType == Enum.UserInputType.MouseButton1
            ) then
                self._dragging = false
                self._dragInput = nil
            end
        end)
    end

    ui:_ObserveTheme(self, function(theme: any)
        row.BackgroundColor3 = theme.Element
        titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
        descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
        valueLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Accent
        track.BackgroundColor3 = theme.Border
        fill.BackgroundColor3 = theme.Accent
        self._stroke.Color = theme.Border
    end)

    ui:_BindFlag(self, options.Flag, self._value)
    self:Set(self._value)
    return self
end

function Slider._UpdateVisual(self: any)
    local range = self._max - self._min
    local ratio = if range == 0 then 0 else Clamp((self._value - self._min) / range, 0, 1)
    local decimals = DecimalPlaces(self._increment)
    self._valueLabel.Text = string.format("%." .. tostring(decimals) .. "f%s", self._value, self._suffix)
    self._ui.Tween:Create(self._fill, "Smooth", {
        Size = UDim2.fromScale(ratio, 1),
    })
end

function Slider.Set(self: any, value: any)
    local numericValue = tonumber(value)
    if not numericValue then
        return
    end

    local normalized = Clamp(numericValue, self._min, self._max)
    normalized = Clamp(RoundToIncrement(normalized, self._min, self._increment), self._min, self._max)

    if self._value == normalized then
        self:_UpdateVisual()
        return
    end

    self._value = normalized
    self:_UpdateVisual()
    self._ui:_UpdateFlag(self, self._value)
    self.Changed:Fire(self._value)
end

function Slider.Get(self: any): number
    return self._value
end

function Slider.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Slider.SetMin(self: any, value: any)
    local minimum = tonumber(value)
    if not minimum then
        return
    end

    self._min = minimum
    if self._max < self._min then
        self._max = self._min
    end
    self:Set(self._value)
end

function Slider.SetMax(self: any, value: any)
    local maximum = tonumber(value)
    if not maximum then
        return
    end

    self._max = maximum
    if self._min > self._max then
        self._min = self._max
    end
    self:Set(self._value)
end

function Slider.SetDisabled(self: any, disabled: any)
    self._disabled = disabled == true
    local theme = self._ui:GetTheme()
    self._titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
    self._descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
    self._valueLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Accent
end

function Slider.Destroy(self: any)
    if self._destroyed then
        return
    end

    self._dragging = false
    self._dragInput = nil

    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self._ui:_CleanupComponent(self)
end

return Slider
