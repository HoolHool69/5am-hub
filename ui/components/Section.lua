--!strict

--[[
    5AM Hub
    File: ui/components/Section.lua

    Automatically sized, ordered container for all interactive controls.
]]

local Section = {}
Section.__index = Section

function Section.new(ui: any, tab: any, options: any): any
    local self = setmetatable({
        _ui = ui,
        _tab = tab,
        _connections = {},
        _destroyed = false,
        _components = {},
        _title = tostring(options.Title or ""),
        _visible = options.Visible ~= false,
    }, Section)

    local sectionFrame = ui:_Create("Frame", {
        Name = "Section",
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 0,
        LayoutOrder = #tab._sections + 1,
        Size = UDim2.new(1, 0, 0, 0),
        Visible = self._visible,
        ZIndex = 13,
    }, tab.Instance)
    self.Instance = sectionFrame
    self._stroke = ui:_AddStroke(sectionFrame, 1)
    ui:_AddCorner(sectionFrame, ui.Config.CornerRadius)

    ui:_Create("UIPadding", {
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
    }, sectionFrame)

    ui:_Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, sectionFrame)

    local titleLabel = ui:_Create("TextLabel", {
        Name = "SectionTitle",
        BackgroundTransparency = 1,
        Font = ui.Config.Font,
        LayoutOrder = 0,
        Size = UDim2.new(1, 0, 0, 20),
        Text = self._title,
        TextSize = ui.Config.TextSize - 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        Visible = self._title ~= "",
        ZIndex = 14,
    }, sectionFrame)
    self._titleLabel = titleLabel

    local componentContainer = ui:_Create("Frame", {
        Name = "Components",
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Size = UDim2.new(1, 0, 0, 0),
        ZIndex = 14,
    }, sectionFrame)
    self._componentContainer = componentContainer

    ui:_Create("UIListLayout", {
        Padding = UDim.new(0, 7),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, componentContainer)

    ui:_ObserveTheme(self, function(theme: any)
        sectionFrame.BackgroundColor3 = theme.BackgroundSecondary
        titleLabel.TextColor3 = theme.SubText
        self._stroke.Color = theme.Border
    end)

    return self
end

function Section._AddComponent(self: any, componentName: string, idOrOptions: any, options: any?): any
    if self._destroyed then
        return nil
    end

    local normalized = self._ui:_NormalizeOptions(idOrOptions, options, componentName)
    local constructor = self._ui.Components[componentName]
    local component = constructor.new(self._ui, self, normalized)
    table.insert(self._components, component)
    return component
end

function Section.AddButton(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Button", idOrOptions, options)
end

function Section.AddToggle(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Toggle", idOrOptions, options)
end

function Section.AddSlider(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Slider", idOrOptions, options)
end

function Section.AddDropdown(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Dropdown", idOrOptions, options)
end

function Section.AddTextbox(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Textbox", idOrOptions, options)
end

function Section.AddKeybind(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Keybind", idOrOptions, options)
end

function Section.AddColorpicker(self: any, idOrOptions: any, options: any?): any
    return self:_AddComponent("Colorpicker", idOrOptions, options)
end

function Section.SetTitle(self: any, title: any)
    self._title = tostring(title or "")
    self._titleLabel.Text = self._title
    self._titleLabel.Visible = self._title ~= ""
end

function Section.SetVisible(self: any, visible: any)
    self._visible = visible == true
    self.Instance.Visible = self._visible
end

function Section.Destroy(self: any)
    if self._destroyed then
        return
    end

    local components = table.clone(self._components)
    for _, component in components do
        component:Destroy()
    end
    table.clear(self._components)

    local sectionIndex = table.find(self._tab._sections, self)
    if sectionIndex then
        table.remove(self._tab._sections, sectionIndex)
    end

    self._ui:_CleanupComponent(self)
end

return Section
