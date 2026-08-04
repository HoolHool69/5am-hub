--!strict

--[[
    5AM Hub
    File: ui/components/Tab.lua

    Window-owned navigation tab and scrolling section container.
]]

local Tab = {}
Tab.__index = Tab

local function FormatNavigationText(icon: any, title: string): string
    local iconText = if icon == nil then "" else tostring(icon)
    return if iconText == "" then title else string.format("%s   %s", iconText, title)
end

function Tab.new(ui: any, window: any, options: any): any
    local self = setmetatable({
        _ui = ui,
        _window = window,
        _connections = {},
        _destroyed = false,
        _sections = {},
        _selected = false,
        _visible = options.Visible ~= false,
        _title = tostring(options.Title or "Tab"),
        _icon = options.Icon,
    }, Tab)

    local navigationButton = ui:_Create("TextButton", {
        Name = "TabButton",
        AutoButtonColor = false,
        BackgroundTransparency = 0,
        Font = ui.Config.Font,
        LayoutOrder = #window._tabs + 1,
        Size = UDim2.new(1, 0, 0, 36),
        Text = FormatNavigationText(self._icon, self._title),
        TextSize = ui.Config.TextSize,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = self._visible,
        ZIndex = 13,
    }, window._navigation)
    ui:_AddCorner(navigationButton, 7)
    self._navigationButton = navigationButton

    ui:_Create("UIPadding", {
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, 8),
    }, navigationButton)

    local content = ui:_Create("ScrollingFrame", {
        Name = "TabContent",
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        ScrollBarThickness = 3,
        Size = UDim2.fromScale(1, 1),
        Visible = false,
        ZIndex = 12,
    }, window._content)
    self.Instance = content

    ui:_Create("UIPadding", {
        PaddingBottom = UDim.new(0, 16),
        PaddingLeft = UDim.new(0, 16),
        PaddingRight = UDim.new(0, 16),
        PaddingTop = UDim.new(0, 16),
    }, content)

    ui:_Create("UIListLayout", {
        Padding = UDim.new(0, 12),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, content)

    ui:_Connect(self, navigationButton.Activated, function()
        self:Select()
    end)

    ui:_ObserveTheme(self, function(theme: any)
        navigationButton.BackgroundColor3 = if self._selected then theme.Accent else theme.Element
        navigationButton.TextColor3 = if self._selected then theme.Text else theme.SubText
        content.ScrollBarImageColor3 = theme.Accent
    end)

    return self
end

function Tab.AddSection(self: any, titleOrOptions: any): any
    if self._destroyed then
        return nil
    end

    local options = if type(titleOrOptions) == "table" then self._ui:_MergeOptions({}, titleOrOptions) else {
        Title = tostring(titleOrOptions or ""),
    }

    local section = self._ui.Components.Section.new(self._ui, self, options)
    table.insert(self._sections, section)
    return section
end

function Tab.SetTitle(self: any, title: any)
    self._title = tostring(title or "")
    self._navigationButton.Text = FormatNavigationText(self._icon, self._title)
end

function Tab.SetIcon(self: any, icon: any)
    self._icon = icon
    self._navigationButton.Text = FormatNavigationText(self._icon, self._title)
end

function Tab.Select(self: any): boolean
    return self._window:SelectTab(self)
end

function Tab._SetSelected(self: any, selected: boolean)
    self._selected = selected
    self.Instance.Visible = selected and self._visible

    local theme = self._ui:GetTheme()
    self._navigationButton.BackgroundColor3 = if selected then theme.Accent else theme.Element
    self._navigationButton.TextColor3 = if selected then theme.Text else theme.SubText
end

function Tab.SetVisible(self: any, visible: any)
    self._visible = visible == true
    self._navigationButton.Visible = self._visible
    self.Instance.Visible = self._visible and self._selected

    if not self._visible and self._selected then
        for _, sibling in self._window._tabs do
            if sibling ~= self and sibling._visible then
                sibling:Select()
                break
            end
        end
    end
end

function Tab.Destroy(self: any)
    if self._destroyed then
        return
    end

    local wasSelected = self._selected
    local sections = table.clone(self._sections)
    for _, section in sections do
        section:Destroy()
    end
    table.clear(self._sections)

    local tabIndex = table.find(self._window._tabs, self)
    if tabIndex then
        table.remove(self._window._tabs, tabIndex)
    end

    pcall(function()
        self._navigationButton:Destroy()
    end)

    self._ui:_CleanupComponent(self)

    if wasSelected then
        self._window._selectedTab = nil
        for _, sibling in self._window._tabs do
            if sibling._visible then
                self._window:SelectTab(sibling)
                break
            end
        end
    end
end

return Tab
