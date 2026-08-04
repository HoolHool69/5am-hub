--!strict

--[[
    5AM Hub
    File: ui/components/Toggle.lua

    Persistent boolean switch with animated Fluent-style visual states.
]]

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Toggle",
        Description = "",
        Default = false,
        Flag = nil,
        Callback = nil,
        Disabled = false,
    }, options)

    local self = setmetatable({
        _ui = ui,
        _section = section,
        _value = options.Default == true,
        _disabled = options.Disabled == true,
    }, Toggle)
    ui:_InitializeValueComponent(self, options)

    local description = tostring(options.Description or "")
    local rowHeight = if description == "" then 44 else 58
    local row = ui:_Create("TextButton", {
        Name = "Toggle",
        AutoButtonColor = false,
        BackgroundTransparency = 0,
        LayoutOrder = #section._components + 1,
        Size = UDim2.new(1, 0, 0, rowHeight),
        Text = "",
        ZIndex = 15,
    }, section._componentContainer)
    self.Instance = row
    self._stroke = ui:_AddStroke(row, 1)
    ui:_AddCorner(row, 7)

    local titleLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, if description == "" then 0 else 8),
        Size = UDim2.new(1, -70, 0, if description == "" then rowHeight else 20),
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
        Size = UDim2.new(1, -70, 0, 17),
        Text = description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = description ~= "",
        ZIndex = 16,
    }, row)
    self._descriptionLabel = descriptionLabel

    local switch = ui:_Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 0,
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(42, 22),
        ZIndex = 16,
    }, row)
    ui:_AddCorner(switch, 11)
    self._switch = switch

    local knob = ui:_Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = ui:GetTheme().Text,
        Position = UDim2.new(0, 11, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        ZIndex = 17,
    }, switch)
    ui:_AddCorner(knob, 8)
    self._knob = knob

    local function ApplyVisualState()
        if self._destroyed then
            return
        end

        local theme = ui:GetTheme()
        local switchColor = if self._value then theme.Accent else theme.Border
        if self._disabled then
            switchColor = theme.Divider
        end

        ui.Tween:Create(switch, "Smooth", { BackgroundColor3 = switchColor })
        ui.Tween:Create(knob, "Smooth", {
            Position = UDim2.new(0, if self._value then 31 else 11, 0.5, 0),
        })
        row.BackgroundColor3 = theme.Element
        titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
        descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
        knob.BackgroundColor3 = theme.Text
        self._stroke.Color = theme.Border
    end
    self._applyVisualState = ApplyVisualState

    ui:_Connect(self, row.Activated, function()
        if not self._disabled then
            self:Set(not self._value)
        end
    end)

    ui:_ObserveTheme(self, function()
        ApplyVisualState()
    end)

    ui:_BindFlag(self, options.Flag, self._value)
    ApplyVisualState()
    return self
end

function Toggle.Set(self: any, value: any)
    local normalized = value == true
    if self._value == normalized then
        self._applyVisualState()
        return
    end

    self._value = normalized
    self._applyVisualState()
    self._ui:_UpdateFlag(self, self._value)
    self.Changed:Fire(self._value)
end

function Toggle.Get(self: any): boolean
    return self._value
end

function Toggle.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Toggle.SetDisabled(self: any, disabled: any)
    self._disabled = disabled == true
    self._applyVisualState()
end

function Toggle.Destroy(self: any)
    if self._destroyed then
        return
    end

    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self._ui:_CleanupComponent(self)
end

return Toggle
