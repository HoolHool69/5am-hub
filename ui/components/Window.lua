--!strict

--[[
    5AM Hub
    File: ui/components/Window.lua

    Top-level Fluent-style window with navigation, draggable header,
    visibility, minimization, sizing, theming, and deterministic cleanup.
]]

local Window = {}
Window.__index = Window

local HEADER_HEIGHT = 56
local NAVIGATION_WIDTH = 158

local function NormalizeSize(size: any, minimumSize: Vector2, fallback: UDim2): UDim2
    if typeof(size) == "Vector2" then
        return UDim2.fromOffset(
            math.max(size.X, minimumSize.X),
            math.max(size.Y, minimumSize.Y)
        )
    end

    if typeof(size) ~= "UDim2" then
        size = fallback
    end

    local xOffset = size.X.Offset
    local yOffset = size.Y.Offset

    if size.X.Scale == 0 then
        xOffset = math.max(xOffset, minimumSize.X)
    end

    if size.Y.Scale == 0 then
        yOffset = math.max(yOffset, minimumSize.Y)
    end

    return UDim2.new(size.X.Scale, xOffset, size.Y.Scale, yOffset)
end

function Window.new(ui: any, options: any): any
    local self = setmetatable({
        _ui = ui,
        _connections = {},
        _destroyed = false,
        _tabs = {},
        _selectedTab = nil,
        _visible = true,
        _minimized = false,
        _restoreSize = nil,
        _minimumSize = if typeof(options.MinSize) == "Vector2" then options.MinSize else ui.Config.MinSize,
        _title = tostring(options.Title or ui.Config.Title),
        _subTitle = tostring(options.SubTitle or ui.Config.SubTitle),
    }, Window)

    local rootGui = ui:_EnsureRootGui()
    local windowFrame = ui:_Create("Frame", {
        Name = "Window",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = if options.Transparency then 0.08 else 0,
        ClipsDescendants = true,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = NormalizeSize(options.Size, self._minimumSize, ui.Config.Size),
        Visible = true,
        ZIndex = 10,
    }, rootGui)
    self.Instance = windowFrame
    self._stroke = ui:_AddStroke(windowFrame, 1)
    ui:_AddCorner(windowFrame, ui.Config.CornerRadius)
    self._sizeConstraint = ui:_Create("UISizeConstraint", {
        MinSize = self._minimumSize,
        MaxSize = Vector2.new(10000, 10000),
    }, windowFrame)

    local header = ui:_Create("Frame", {
        Name = "Header",
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, HEADER_HEIGHT),
        ZIndex = 11,
    }, windowFrame)
    self._header = header

    local titleLabel = ui:_Create("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(18, 8),
        Size = UDim2.new(1, -78, 0, 22),
        Text = self._title,
        TextSize = ui.Config.TextSize + 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 12,
    }, header)
    self._titleLabel = titleLabel

    local subTitleLabel = ui:_Create("TextLabel", {
        Name = "SubTitle",
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.fromOffset(18, 30),
        Size = UDim2.new(1, -78, 0, 17),
        Text = self._subTitle,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = self._subTitle ~= "",
        ZIndex = 12,
    }, header)
    self._subTitleLabel = subTitleLabel

    local minimizeButton = ui:_Create("TextButton", {
        Name = "Minimize",
        AnchorPoint = Vector2.new(1, 0.5),
        AutoButtonColor = false,
        BackgroundTransparency = 0,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -12, 0.5, 0),
        Size = UDim2.fromOffset(32, 32),
        Text = "—",
        TextSize = 18,
        Visible = options.MinimizeEnabled ~= false,
        ZIndex = 13,
    }, header)
    ui:_AddCorner(minimizeButton, 7)
    self._minimizeButton = minimizeButton

    local divider = ui:_Create("Frame", {
        Name = "HeaderDivider",
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 1, -1),
        Size = UDim2.new(1, 0, 0, 1),
        ZIndex = 12,
    }, header)
    self._headerDivider = divider

    local body = ui:_Create("Frame", {
        Name = "Body",
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(0, HEADER_HEIGHT),
        Size = UDim2.new(1, 0, 1, -HEADER_HEIGHT),
        ZIndex = 11,
    }, windowFrame)
    self._body = body

    local navigation = ui:_Create("ScrollingFrame", {
        Name = "Navigation",
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ScrollBarThickness = 2,
        Size = UDim2.new(0, NAVIGATION_WIDTH, 1, 0),
        ZIndex = 11,
    }, body)
    self._navigation = navigation

    ui:_Create("UIPadding", {
        PaddingBottom = UDim.new(0, 12),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 12),
    }, navigation)

    ui:_Create("UIListLayout", {
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, navigation)

    local navigationDivider = ui:_Create("Frame", {
        Name = "NavigationDivider",
        BorderSizePixel = 0,
        Position = UDim2.new(0, NAVIGATION_WIDTH - 1, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        ZIndex = 12,
    }, body)
    self._navigationDivider = navigationDivider

    local content = ui:_Create("Frame", {
        Name = "Content",
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Position = UDim2.fromOffset(NAVIGATION_WIDTH, 0),
        Size = UDim2.new(1, -NAVIGATION_WIDTH, 1, 0),
        ZIndex = 11,
    }, body)
    self._content = content

    self._dragController = ui.Drag:Enable(windowFrame, header)

    ui:_Connect(self, minimizeButton.Activated, function()
        if self._minimized then
            self:Restore()
        else
            self:Minimize()
        end
    end)

    local userInputService = ui:_GetUserInputService()
    if userInputService and options.ToggleKey ~= Enum.KeyCode.None then
        ui:_Connect(self, userInputService.InputBegan, function(input: any, gameProcessed: boolean)
            if gameProcessed or input.KeyCode ~= options.ToggleKey then
                return
            end

            if userInputService:GetFocusedTextBox() then
                return
            end

            self:SetVisible(not self._visible)
        end)
    end

    ui:_ObserveTheme(self, function(theme: any)
        windowFrame.BackgroundColor3 = theme.Background
        header.BackgroundColor3 = theme.BackgroundSecondary
        navigation.BackgroundColor3 = theme.BackgroundSecondary
        titleLabel.TextColor3 = theme.Text
        subTitleLabel.TextColor3 = theme.SubText
        minimizeButton.BackgroundColor3 = theme.Element
        minimizeButton.TextColor3 = theme.Text
        divider.BackgroundColor3 = theme.Divider
        navigationDivider.BackgroundColor3 = theme.Divider
        self._stroke.Color = theme.Border
        navigation.ScrollBarImageColor3 = theme.Accent
    end)

    return self
end

function Window.AddTab(self: any, options: any): any
    if self._destroyed then
        return nil
    end

    local normalized = if type(options) == "table" then self._ui:_MergeOptions({}, options) else {
        Title = tostring(options or "Tab"),
    }
    normalized.Title = normalized.Title or "Tab"

    local tab = self._ui.Components.Tab.new(self._ui, self, normalized)
    table.insert(self._tabs, tab)

    if not self._selectedTab then
        self:SelectTab(tab)
    else
        tab:_SetSelected(false)
    end

    return tab
end

function Window.SelectTab(self: any, tab: any): boolean
    if self._destroyed or not table.find(self._tabs, tab) then
        return false
    end

    self._selectedTab = tab

    for _, ownedTab in self._tabs do
        ownedTab:_SetSelected(ownedTab == tab)
    end

    return true
end

function Window.SetTitle(self: any, title: any)
    self._title = tostring(title or "")
    self._titleLabel.Text = self._title
end

function Window.SetSubTitle(self: any, subTitle: any)
    self._subTitle = tostring(subTitle or "")
    self._subTitleLabel.Text = self._subTitle
    self._subTitleLabel.Visible = self._subTitle ~= ""
end

function Window.SetTheme(self: any, themeName: string): boolean
    return self._ui:SetTheme(themeName)
end

function Window.SetVisible(self: any, visible: any)
    self._visible = visible == true
    self.Instance.Visible = self._visible
end

function Window.SetSize(self: any, size: any)
    local normalizedSize = NormalizeSize(size, self._minimumSize, self._ui.Config.Size)

    if self._minimized then
        self._restoreSize = normalizedSize
    else
        self.Instance.Size = normalizedSize
    end
end

function Window.Minimize(self: any)
    if self._destroyed or self._minimized or not self._minimizeButton.Visible then
        return
    end

    self._minimized = true
    self._restoreSize = self.Instance.Size
    self._sizeConstraint.MinSize = Vector2.new(self._minimumSize.X, HEADER_HEIGHT)
    self._body.Visible = false
    self._minimizeButton.Text = "+"

    self._ui.Tween:Create(self.Instance, "Smooth", {
        Size = UDim2.new(self.Instance.Size.X.Scale, self.Instance.Size.X.Offset, 0, HEADER_HEIGHT),
    })
end

function Window.Restore(self: any)
    if self._destroyed or not self._minimized then
        return
    end

    self._minimized = false
    self._sizeConstraint.MinSize = self._minimumSize
    self._body.Visible = true
    self._minimizeButton.Text = "—"

    self._ui.Tween:Create(self.Instance, "Smooth", {
        Size = self._restoreSize or self._ui.Config.Size,
    })
end

function Window.Destroy(self: any)
    if self._destroyed then
        return
    end

    local tabs = table.clone(self._tabs)
    for _, tab in tabs do
        tab:Destroy()
    end
    table.clear(self._tabs)

    if self._dragController then
        self._dragController:Disconnect()
        self._dragController = nil
    end

    self._ui:_RemoveWindow(self)
    self._ui:_CleanupComponent(self)
end

return Window
