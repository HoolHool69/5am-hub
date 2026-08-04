--!strict

--[[
    5AM Hub
    File: ui/components/Button.lua

    Click action with hover, pressed, disabled, and activation feedback states.
]]

local Button = {}
Button.__index = Button

function Button.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Button",
        Description = "",
        Callback = nil,
        Disabled = false,
    }, options)

    local self = setmetatable({
        _ui = ui,
        _section = section,
        _enabled = options.Disabled ~= true,
        _hovered = false,
        _pressed = false,
        _title = tostring(options.Title),
        _description = tostring(options.Description or ""),
        _actionCallback = options.Callback,
    }, Button)
    ui:_InitializeValueComponent(self, options, false)
    self.Activated = ui.Signal.new()

    local rowHeight = if self._description == "" then 44 else 58
    local row = ui:_Create("TextButton", {
        Name = "Button",
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
        Name = "Title",
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, if self._description == "" then 0 else 8),
        Size = UDim2.new(1, -50, 0, if self._description == "" then rowHeight else 20),
        Text = self._title,
        TextSize = ui.Config.TextSize,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 16,
    }, row)
    self._titleLabel = titleLabel

    local descriptionLabel = ui:_Create("TextLabel", {
        Name = "Description",
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(12, 29),
        Size = UDim2.new(1, -50, 0, 17),
        Text = self._description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = self._description ~= "",
        ZIndex = 16,
    }, row)
    self._descriptionLabel = descriptionLabel

    local actionLabel = ui:_Create("TextLabel", {
        Name = "Action",
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -13, 0.5, 0),
        Size = UDim2.fromOffset(20, 24),
        Text = "›",
        TextSize = 22,
        ZIndex = 16,
    }, row)
    self._actionLabel = actionLabel

    local function ApplyVisualState()
        if self._destroyed then
            return
        end

        local theme = ui:GetTheme()
        local background = theme.Element

        if not self._enabled then
            background = theme.BackgroundSecondary
        elseif self._pressed then
            background = theme.ElementActive
        elseif self._hovered then
            background = theme.ElementHover
        end

        ui.Tween:Create(row, "Snap", { BackgroundColor3 = background })
        titleLabel.TextColor3 = if self._enabled then theme.Text else theme.DisabledText
        descriptionLabel.TextColor3 = if self._enabled then theme.SubText else theme.DisabledText
        actionLabel.TextColor3 = if self._enabled then theme.Accent else theme.DisabledText
        self._stroke.Color = theme.Border
    end
    self._applyVisualState = ApplyVisualState

    ui:_Connect(self, row.MouseEnter, function()
        self._hovered = true
        ApplyVisualState()
    end)
    ui:_Connect(self, row.MouseLeave, function()
        self._hovered = false
        self._pressed = false
        ApplyVisualState()
    end)
    ui:_Connect(self, row.MouseButton1Down, function()
        self._pressed = true
        ApplyVisualState()
    end)
    ui:_Connect(self, row.MouseButton1Up, function()
        self._pressed = false
        ApplyVisualState()
    end)
    ui:_Connect(self, row.Activated, function()
        self:Fire()
    end)

    ui:_ObserveTheme(self, function()
        ApplyVisualState()
    end)

    return self
end

function Button.Set(self: any, enabled: any)
    local normalized = enabled == true
    if self._enabled == normalized then
        self._applyVisualState()
        return
    end

    self._enabled = normalized
    self._applyVisualState()
    self.Changed:Fire(self._enabled)
end

function Button.Get(self: any): boolean
    return self._enabled
end

function Button.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Button.OnActivated(self: any, callback: any): any?
    if self._destroyed or type(callback) ~= "function" then
        return nil
    end

    local connection = self.Activated:Connect(function()
        self._ui:_SafeCall(callback)
    end)
    return self._ui:_TrackConnection(self, connection)
end

function Button.SetTitle(self: any, title: any)
    self._title = tostring(title or "")
    self._titleLabel.Text = self._title
end

function Button.SetDescription(self: any, description: any)
    self._description = tostring(description or "")
    self._descriptionLabel.Text = self._description
    self._descriptionLabel.Visible = self._description ~= ""
    local rowHeight = if self._description == "" then 44 else 58
    self.Instance.Size = UDim2.new(1, 0, 0, rowHeight)
    self._titleLabel.Position = UDim2.fromOffset(12, if self._description == "" then 0 else 8)
    self._titleLabel.Size = UDim2.new(1, -50, 0, if self._description == "" then rowHeight else 20)
end

function Button.SetDisabled(self: any, disabled: any)
    self:Set(disabled ~= true)
end

function Button.Fire(self: any): boolean
    if self._destroyed or not self._enabled then
        return false
    end

    self._pressed = true
    self._applyVisualState()

    task.delay(0.08, function()
        if not self._destroyed then
            self._pressed = false
            self._applyVisualState()
        end
    end)

    self._ui:_SafeCall(self._actionCallback)
    self.Activated:Fire()
    return true
end

function Button.Destroy(self: any)
    if self._destroyed then
        return
    end

    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self.Activated:Disconnect()
    self._ui:_CleanupComponent(self)
end

return Button
