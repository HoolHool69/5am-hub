--!strict

--[[
    5AM Hub
    File: ui/components/Dropdown.lua

    Searchable single- or multi-select dropdown with dynamic option layout,
    outside-click dismissal, theme updates, and persistent flag values.
]]

local Dropdown = {}
Dropdown.__index = Dropdown

local OPTION_HEIGHT = 30
local OPTION_SPACING = 4
local MAX_VISIBLE_OPTIONS = 5

local function ContainsValue(values: {any}, target: any): boolean
    return table.find(values, target) ~= nil
end

local function SelectionText(selection: any, multi: boolean): string
    if multi then
        if #selection == 0 then
            return "Select..."
        end

        local labels = {}
        for _, value in selection do
            table.insert(labels, tostring(value))
        end
        return table.concat(labels, ", ")
    end

    return if selection == nil then "Select..." else tostring(selection)
end

function Dropdown.new(ui: any, section: any, options: any): any
    options = ui:_MergeOptions({
        Title = "Dropdown",
        Description = "",
        Values = {},
        Default = nil,
        Multi = false,
        Searchable = false,
        Flag = nil,
        Callback = nil,
        Disabled = false,
    }, options)

    local values = {}
    if type(options.Values) == "table" then
        for _, value in options.Values do
            table.insert(values, value)
        end
    end

    local self = setmetatable({
        _ui = ui,
        _section = section,
        _values = values,
        _multi = options.Multi == true,
        _searchable = options.Searchable == true,
        _selection = if options.Multi then {} else nil,
        _disabled = options.Disabled == true,
        _open = false,
        _optionButtons = {},
        _optionConnections = {},
        _searchQuery = "",
    }, Dropdown)
    ui:_InitializeValueComponent(self, options)

    local description = tostring(options.Description or "")
    self._closedHeight = if description == "" then 52 else 66

    local row = ui:_Create("Frame", {
        Name = "Dropdown",
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
        Size = UDim2.new(0.46, -18, 0, if description == "" then self._closedHeight else 20),
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
        Size = UDim2.new(0.46, -18, 0, 17),
        Text = description,
        TextSize = ui.Config.TextSize - 2,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = description ~= "",
        ZIndex = 21,
    }, row)
    self._descriptionLabel = descriptionLabel

    local selector = ui:_Create("TextButton", {
        Name = "Selector",
        AnchorPoint = Vector2.new(1, 0.5),
        AutoButtonColor = false,
        BackgroundTransparency = 0,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -10, 0, self._closedHeight / 2),
        Size = UDim2.new(0.52, -10, 0, 34),
        Text = "Select...",
        TextSize = ui.Config.TextSize - 1,
        TextTruncate = Enum.TextTruncate.AtEnd,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 22,
    }, row)
    ui:_AddCorner(selector, 6)
    self._selector = selector

    ui:_Create("UIPadding", {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 24),
    }, selector)

    local arrow = ui:_Create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(14, 18),
        Text = "⌄",
        TextSize = 16,
        ZIndex = 23,
    }, selector)
    self._arrow = arrow

    local panel = ui:_Create("Frame", {
        Name = "OptionsPanel",
        BackgroundTransparency = 0,
        ClipsDescendants = true,
        Position = UDim2.fromOffset(10, self._closedHeight),
        Size = UDim2.new(1, -20, 0, 0),
        Visible = false,
        ZIndex = 30,
    }, row)
    ui:_AddCorner(panel, 6)
    self._panel = panel

    local searchBox = ui:_Create("TextBox", {
        Name = "Search",
        BackgroundTransparency = 0,
        ClearTextOnFocus = false,
        Font = ui.Config.Font,
        PlaceholderText = "Search...",
        Position = UDim2.fromOffset(6, 6),
        Size = UDim2.new(1, -12, 0, 30),
        Text = "",
        TextSize = ui.Config.TextSize - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = self._searchable,
        ZIndex = 31,
    }, panel)
    ui:_AddCorner(searchBox, 5)
    self._searchBox = searchBox

    ui:_Create("UIPadding", {
        PaddingLeft = UDim.new(0, 9),
        PaddingRight = UDim.new(0, 9),
    }, searchBox)

    local optionList = ui:_Create("ScrollingFrame", {
        Name = "OptionList",
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        CanvasSize = UDim2.new(),
        Position = UDim2.fromOffset(6, if self._searchable then 42 else 6),
        ScrollBarThickness = 2,
        Size = UDim2.new(1, -12, 1, if self._searchable then -48 else -12),
        ZIndex = 31,
    }, panel)
    self._optionList = optionList

    ui:_Create("UIListLayout", {
        Padding = UDim.new(0, OPTION_SPACING),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, optionList)

    ui:_Connect(self, selector.Activated, function()
        if not self._disabled then
            if self._open then
                self:Close()
            else
                self:Open()
            end
        end
    end)

    ui:_Connect(self, searchBox:GetPropertyChangedSignal("Text"), function()
        self._searchQuery = string.lower(searchBox.Text)
        self:_RebuildOptions()
        if self._open then
            self:_ResizeOpenPanel()
        end
    end)

    local userInputService = ui:_GetUserInputService()
    if userInputService then
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

    ui:_ObserveTheme(self, function()
        self:_ApplyTheme()
    end)

    self:Set(options.Default)
    ui:_BindFlag(self, options.Flag, self:Get())
    self:_RebuildOptions()
    self:_UpdateDisplay()
    return self
end

function Dropdown._FilteredValues(self: any): {any}
    if self._searchQuery == "" then
        return self._values
    end

    local filtered = {}
    for _, value in self._values do
        if string.find(string.lower(tostring(value)), self._searchQuery, 1, true) then
            table.insert(filtered, value)
        end
    end
    return filtered
end

function Dropdown._RebuildOptions(self: any)
    for _, connection in self._optionConnections do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(self._optionConnections)

    for _, button in self._optionButtons do
        pcall(function()
            button:Destroy()
        end)
    end
    table.clear(self._optionButtons)

    local theme = self._ui:GetTheme()
    for index, value in self:_FilteredValues() do
        local selected = if self._multi then ContainsValue(self._selection, value) else self._selection == value
        local optionButton = self._ui:_Create("TextButton", {
            AutoButtonColor = false,
            BackgroundColor3 = if selected then theme.ElementActive else theme.Element,
            Font = self._ui.Config.Font,
            LayoutOrder = index,
            Size = UDim2.new(1, -4, 0, OPTION_HEIGHT),
            Text = tostring(value),
            TextColor3 = if selected then theme.Accent else theme.Text,
            TextSize = self._ui.Config.TextSize - 1,
            TextTruncate = Enum.TextTruncate.AtEnd,
            ZIndex = 32,
        }, self._optionList)
        self._ui:_AddCorner(optionButton, 5)
        table.insert(self._optionButtons, optionButton)

        local connection = optionButton.Activated:Connect(function()
            if self._multi then
                local updated = self:Get()
                local selectedIndex = table.find(updated, value)
                if selectedIndex then
                    table.remove(updated, selectedIndex)
                else
                    table.insert(updated, value)
                end
                self:Set(updated)
                self:_RebuildOptions()
            else
                self:Set(value)
                self:Close()
            end
        end)
        table.insert(self._optionConnections, connection)
    end
end

function Dropdown._PanelHeight(self: any): number
    local count = math.min(#self:_FilteredValues(), MAX_VISIBLE_OPTIONS)
    local optionsHeight = count * OPTION_HEIGHT + math.max(0, count - 1) * OPTION_SPACING
    return optionsHeight + (if self._searchable then 48 else 12)
end

function Dropdown._ResizeOpenPanel(self: any)
    local panelHeight = self:_PanelHeight()
    self._panel.Size = UDim2.new(1, -20, 0, panelHeight)
    self.Instance.Size = UDim2.new(1, 0, 0, self._closedHeight + panelHeight + 8)
end

function Dropdown._UpdateDisplay(self: any)
    self._selector.Text = SelectionText(self._selection, self._multi)
    self._arrow.Text = if self._open then "⌃" else "⌄"
end

function Dropdown._ApplyTheme(self: any)
    local theme = self._ui:GetTheme()
    self.Instance.BackgroundColor3 = theme.Element
    self._titleLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
    self._descriptionLabel.TextColor3 = if self._disabled then theme.DisabledText else theme.SubText
    self._selector.BackgroundColor3 = theme.BackgroundSecondary
    self._selector.TextColor3 = if self._disabled then theme.DisabledText else theme.Text
    self._arrow.TextColor3 = if self._disabled then theme.DisabledText else theme.Accent
    self._panel.BackgroundColor3 = theme.BackgroundSecondary
    self._searchBox.BackgroundColor3 = theme.Element
    self._searchBox.TextColor3 = theme.Text
    self._searchBox.PlaceholderColor3 = theme.DisabledText
    self._optionList.ScrollBarImageColor3 = theme.Accent
    self._stroke.Color = theme.Border
    self:_RebuildOptions()
end

function Dropdown.Set(self: any, value: any)
    local normalized: any

    if self._multi then
        normalized = {}
        if type(value) == "table" then
            for _, availableValue in self._values do
                if table.find(value, availableValue) or value[availableValue] == true then
                    table.insert(normalized, availableValue)
                end
            end
        end
    else
        normalized = if ContainsValue(self._values, value) then value else nil
    end

    if self._ui:_ValuesEqual(self._selection, normalized) then
        self:_UpdateDisplay()
        return
    end

    self._selection = normalized
    self:_UpdateDisplay()
    self:_RebuildOptions()

    local currentValue = self:Get()
    self._ui:_UpdateFlag(self, currentValue)
    self.Changed:Fire(currentValue)
end

function Dropdown.Get(self: any): any
    return if self._multi then self._ui:_CloneValue(self._selection) else self._selection
end

function Dropdown.OnChanged(self: any, callback: any): any?
    return self._ui:_OnChanged(self, callback)
end

function Dropdown.SetValues(self: any, values: any)
    local normalized = {}
    if type(values) == "table" then
        for _, value in values do
            table.insert(normalized, value)
        end
    end

    local previousSelection = self:Get()
    self._values = normalized
    self:Set(previousSelection)
    self:_RebuildOptions()

    if self._open then
        self:_ResizeOpenPanel()
    end
end

function Dropdown.Open(self: any)
    if self._destroyed or self._disabled or self._open then
        return
    end

    self._open = true
    self._panel.Visible = true
    self:_RebuildOptions()
    local panelHeight = self:_PanelHeight()
    self._panel.Size = UDim2.new(1, -20, 0, 0)
    self._ui.Tween:Create(self._panel, "Smooth", {
        Size = UDim2.new(1, -20, 0, panelHeight),
    })
    self._ui.Tween:Create(self.Instance, "Smooth", {
        Size = UDim2.new(1, 0, 0, self._closedHeight + panelHeight + 8),
    })
    self:_UpdateDisplay()
end

function Dropdown.Close(self: any)
    if not self._open then
        return
    end

    self._open = false
    self._panel.Visible = false
    self._ui.Tween:Create(self.Instance, "Smooth", {
        Size = UDim2.new(1, 0, 0, self._closedHeight),
    })
    self:_UpdateDisplay()
end

function Dropdown.SetDisabled(self: any, disabled: any)
    self._disabled = disabled == true
    if self._disabled then
        self:Close()
    end
    self:_ApplyTheme()
end

function Dropdown.Destroy(self: any)
    if self._destroyed then
        return
    end

    for _, connection in self._optionConnections do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(self._optionConnections)
    table.clear(self._optionButtons)
    local index = table.find(self._section._components, self)
    if index then
        table.remove(self._section._components, index)
    end

    self._ui:_CleanupComponent(self)
end

return Dropdown
