--!strict

--[[
    5AM Hub
    File: ui/components/Notification.lua

    Stacking animated toast with typed theme colors, timed and manual
    dismissal, state updates, and deterministic resource cleanup.
]]

local Notification = {}
Notification.__index = Notification

local VALID_TYPES = {
    Info = true,
    Success = true,
    Warning = true,
    Error = true,
}

local function NormalizeType(value: any): string
    local text = string.lower(tostring(value or "Info"))

    if text == "success" then
        return "Success"
    elseif text == "warning" then
        return "Warning"
    elseif text == "error" then
        return "Error"
    end

    return "Info"
end

function Notification.new(ui: any, parent: any, options: any): any
    local notificationType = NormalizeType(options.Type)
    local self = setmetatable({
        _ui = ui,
        _title = tostring(options.Title or "Notification"),
        _content = tostring(options.Content or ""),
        _duration = math.max(0, tonumber(options.Duration) or ui.Config.NotificationDuration),
        _type = notificationType,
        _dismissing = false,
        _timerThread = nil,
        _dismissThread = nil,
    }, Notification)
    ui:_InitializeValueComponent(self, options)

    local toastHeight = if self._content == "" then 64 else 84
    local toast = ui:_Create("Frame", {
        Name = "Notification",
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        LayoutOrder = #ui.Notifications + 1,
        Size = UDim2.new(1, 0, 0, 0),
        ZIndex = 101,
    }, parent)
    self.Instance = toast
    self._targetHeight = toastHeight
    self._stroke = ui:_AddStroke(toast, 1)
    ui:_AddCorner(toast, ui.Config.CornerRadius)

    local accent = ui:_Create("Frame", {
        Name = "Accent",
        BorderSizePixel = 0,
        Size = UDim2.new(0, 4, 1, 0),
        ZIndex = 102,
    }, toast)
    self._accent = accent

    local titleLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(16, 10),
        Size = UDim2.new(1, -52, 0, 22),
        Text = self._title,
        TextSize = ui.Config.TextSize,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 102,
    }, toast)
    self._titleLabel = titleLabel

    local contentLabel = ui:_Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(16, 34),
        Size = UDim2.new(1, -32, 0, 38),
        Text = self._content,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Visible = self._content ~= "",
        ZIndex = 102,
    }, toast)
    self._contentLabel = contentLabel

    local closeButton = ui:_Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0),
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -8, 0, 8),
        Size = UDim2.fromOffset(28, 28),
        Text = "×",
        TextSize = 20,
        ZIndex = 103,
    }, toast)
    self._closeButton = closeButton

    ui:_Connect(self, closeButton.Activated, function()
        self:Dismiss()
    end)

    ui:_ObserveTheme(self, function()
        self:_ApplyTheme()
    end)

    ui.Tween:Create(toast, "Smooth", {
        BackgroundTransparency = 0,
        Size = UDim2.new(1, 0, 0, toastHeight),
    })

    if self._duration > 0 then
        self._timerThread = task.delay(self._duration, function()
            self._timerThread = nil
            if not self._destroyed then
                self:Dismiss()
            end
        end)
    end

    return self
end

function Notification._TypeColor(self: any, theme: any): Color3
    if self._type == "Success" then
        return theme.Success
    elseif self._type == "Warning" then
        return theme.Warning
    elseif self._type == "Error" then
        return theme.Error
    end

    return theme.Accent
end

function Notification._ApplyTheme(self: any)
    local theme = self._ui:GetTheme()
    self.Instance.BackgroundColor3 = theme.BackgroundSecondary
    self._titleLabel.TextColor3 = theme.Text
    self._contentLabel.TextColor3 = theme.SubText
    self._closeButton.TextColor3 = theme.SubText
    self._accent.BackgroundColor3 = self:_TypeColor(theme)
    self._stroke.Color = theme.Border
end

function Notification.Set(self: any, value: any)
    if self._destroyed then
        return
    end

    if type(value) == "table" then
        if value.Title ~= nil then
            self._title = tostring(value.Title)
        end
        if value.Content ~= nil then
            self._content = tostring(value.Content)
        end
        if value.Type ~= nil then
            self._type = NormalizeType(value.Type)
        end
    else
        self._content = tostring(value or "")
    end

    if not VALID_TYPES[self._type] then
        self._type = "Info"
    end

    self._titleLabel.Text = self._title
    self._contentLabel.Text = self._content
    self._contentLabel.Visible = self._content ~= ""
    self._targetHeight = if self._content == "" then 64 else 84

    if not self._dismissing then
        self._ui.Tween:Create(self.Instance, "Smooth", {
            Size = UDim2.new(1, 0, 0, self._targetHeight),
        })
    end

    self:_ApplyTheme()
    self.Changed:Fire(self:Get())
end

function Notification.Get(self: any): any
    return {
        Title = self._title,
        Content = self._content,
        Duration = self._duration,
        Type = self._type,
    }
end

function Notification.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Notification.SetTitle(self: any, title: any)
    self:Set({ Title = title })
end

function Notification.SetContent(self: any, content: any)
    self:Set({ Content = content })
end

function Notification.Dismiss(self: any)
    if self._destroyed or self._dismissing then
        return
    end

    self._dismissing = true

    if self._timerThread then
        pcall(task.cancel, self._timerThread)
        self._timerThread = nil
    end

    self._ui.Tween:Create(self.Instance, "Smooth", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
    })

    self._dismissThread = task.delay(0.25, function()
        self._dismissThread = nil
        if not self._destroyed then
            self:Destroy()
        end
    end)
end

function Notification.Destroy(self: any)
    if self._destroyed then
        return
    end

    if self._timerThread then
        pcall(task.cancel, self._timerThread)
        self._timerThread = nil
    end

    if self._dismissThread then
        pcall(task.cancel, self._dismissThread)
        self._dismissThread = nil
    end

    self._ui:_RemoveNotification(self)
    self._ui:_CleanupComponent(self)
end

return Notification
