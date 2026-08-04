--!strict

--[[
    5AM Hub
    File: ui/init.lua

    Fluent-style UI library entry point, shared component context, theme
    management, flag persistence, window creation, and global cleanup.
]]

local Config = require(script.config)

local Signal = require(script.core.Signal)
local Flags = require(script.core.Flags)
local Tween = require(script.core.Tween)
local Drag = require(script.core.Drag)

local DarkTheme = require(script.themes.Dark)
local LightTheme = require(script.themes.Light)
local AmethystTheme = require(script.themes.Amethyst)

local Components = {
    Window = require(script.components.Window),
    Tab = require(script.components.Tab),
    Section = require(script.components.Section),
    Button = require(script.components.Button),
    Toggle = require(script.components.Toggle),
    Slider = require(script.components.Slider),
    Dropdown = require(script.components.Dropdown),
    Textbox = require(script.components.Textbox),
    Keybind = require(script.components.Keybind),
    Colorpicker = require(script.components.Colorpicker),
    Notification = require(script.components.Notification),
}

local function CopyTable(source: any): any
    local copy = {}

    if type(source) == "table" then
        for key, value in source do
            copy[key] = value
        end
    end

    return copy
end

local function RemoveFromArray(array: {any}, target: any)
    local index = table.find(array, target)
    if index then
        table.remove(array, index)
    end
end

local function GetEnvironment(): {[string]: any}
    local success, environment = pcall(function()
        return getfenv(0)
    end)

    if success and type(environment) == "table" then
        local getGlobalEnvironment = environment.getgenv

        if type(getGlobalEnvironment) == "function" then
            local globalSuccess, globalEnvironment = pcall(getGlobalEnvironment)
            if globalSuccess and type(globalEnvironment) == "table" then
                return setmetatable({}, {
                    __index = function(_table, key)
                        local localValue = environment[key]
                        return if localValue ~= nil then localValue else globalEnvironment[key]
                    end,
                }) :: {[string]: any}
            end
        end

        return environment :: {[string]: any}
    end

    return {}
end

local UI = {
    Config = Config,
    Flags = Flags,
    Signal = Signal,
    Tween = Tween,
    Drag = Drag,
    Components = Components,

    Themes = {
        Dark = DarkTheme,
        Light = LightTheme,
        Amethyst = AmethystTheme,
    },

    Windows = {},
    Notifications = {},
    RootGui = nil,

    _themeName = Config.Theme,
    _notificationContainer = nil,
    _userInputService = nil,
}

UI.ThemeChanged = Signal.new()

function UI:_MergeOptions(defaults: any, options: any): any
    local merged = CopyTable(defaults)

    if type(options) == "table" then
        for key, value in options do
            merged[key] = value
        end
    end

    return merged
end

function UI:_NormalizeOptions(idOrOptions: any, options: any?, defaultTitle: string?): any
    local normalized: any

    if type(idOrOptions) == "table" then
        normalized = CopyTable(idOrOptions)
    else
        normalized = CopyTable(options)

        if idOrOptions ~= nil then
            normalized.Id = tostring(idOrOptions)
        end
    end

    if normalized.Title == nil then
        normalized.Title = normalized.Id or defaultTitle or ""
    end

    return normalized
end

function UI:_Create(className: string, properties: any?, parent: any?): any
    local instance: any = Instance.new(className)

    if type(properties) == "table" then
        for property, value in properties do
            local success = pcall(function()
                instance[property] = value
            end)

            if not success then
                warn(string.format("5AM Hub could not set %s.%s", className, tostring(property)))
            end
        end
    end

    if parent ~= nil then
        instance.Parent = parent
    end

    return instance
end

function UI:_AddCorner(parent: any, radius: number?): any
    return self:_Create("UICorner", {
        CornerRadius = UDim.new(0, radius or self.Config.CornerRadius),
    }, parent)
end

function UI:_AddStroke(parent: any, thickness: number?): any
    return self:_Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Thickness = thickness or 1,
        Transparency = 0,
    }, parent)
end

function UI:_TrackConnection(owner: any, connection: any?): any?
    if not connection then
        return nil
    end

    owner._connections = owner._connections or {}
    table.insert(owner._connections, connection)
    return connection
end

function UI:_Connect(owner: any, event: any, callback: (...any) -> ()): any?
    local success, connection = pcall(function()
        return event:Connect(callback)
    end)

    if not success then
        return nil
    end

    return self:_TrackConnection(owner, connection)
end

function UI:_SafeCall(callback: any, ...: any): boolean
    if type(callback) ~= "function" then
        return false
    end

    local arguments = table.pack(...)
    local success, message = pcall(function()
        callback(table.unpack(arguments, 1, arguments.n))
    end)

    if not success then
        warn(string.format("5AM Hub callback failed: %s", tostring(message)))
    end

    return success
end

function UI:_InitializeValueComponent(component: any, options: any, connectConfiguredCallback: boolean?)
    component._ui = self
    component._connections = component._connections or {}
    component._destroyed = false
    component._syncingFlag = false
    component.Changed = Signal.new()

    if connectConfiguredCallback ~= false and type(options.Callback) == "function" then
        local callbackConnection = component.Changed:Connect(function(...: any)
            if not component._destroyed then
                self:_SafeCall(options.Callback, ...)
            end
        end)

        self:_TrackConnection(component, callbackConnection)
    end
end

function UI:_OnChanged(component: any, callback: any): any?
    if component._destroyed or type(callback) ~= "function" then
        return nil
    end

    local connection = component.Changed:Connect(function(...: any)
        if not component._destroyed then
            self:_SafeCall(callback, ...)
        end
    end)

    return self:_TrackConnection(component, connection)
end

function UI:_ObserveTheme(owner: any, callback: (any) -> ())
    self:_SafeCall(callback, self:GetTheme())

    local connection = self.ThemeChanged:Connect(function(theme: any)
        if not owner._destroyed then
            self:_SafeCall(callback, theme)
        end
    end)

    self:_TrackConnection(owner, connection)
end

function UI:_ValuesEqual(left: any, right: any, visited: any?): boolean
    if left == right then
        return true
    end

    if type(left) ~= "table" or type(right) ~= "table" then
        return false
    end

    visited = visited or {}
    visited[left] = visited[left] or {}

    if visited[left][right] then
        return true
    end

    visited[left][right] = true

    for key, value in left do
        if not self:_ValuesEqual(value, right[key], visited) then
            return false
        end
    end

    for key in right do
        if left[key] == nil then
            return false
        end
    end

    return true
end

function UI:_CloneValue(value: any, visited: any?): any
    if type(value) ~= "table" then
        return value
    end

    visited = visited or {}
    if visited[value] then
        return visited[value]
    end

    local clone = {}
    visited[value] = clone

    for key, nestedValue in value do
        clone[key] = self:_CloneValue(nestedValue, visited)
    end

    return clone
end

function UI:_BindFlag(component: any, flagName: any, defaultValue: any)
    if type(flagName) ~= "string" or flagName == "" then
        return
    end

    component._flagName = flagName
    self.Flags:Register(flagName, self:_CloneValue(defaultValue))

    local function GetComponentFlagValue(): any
        if type(component._GetFlagValue) == "function" then
            return component:_GetFlagValue()
        end

        return component:Get()
    end

    local registeredValue = self.Flags:Get(flagName)
    if not self:_ValuesEqual(GetComponentFlagValue(), registeredValue) then
        component._syncingFlag = true
        component:Set(self:_CloneValue(registeredValue))
        component._syncingFlag = false
    end

    local flagConnection = self.Flags:OnChanged(flagName, function(value: any)
        if component._destroyed or self:_ValuesEqual(GetComponentFlagValue(), value) then
            return
        end

        component._syncingFlag = true
        component:Set(self:_CloneValue(value))
        component._syncingFlag = false
    end)

    self:_TrackConnection(component, flagConnection)
end

function UI:_UpdateFlag(component: any, value: any)
    if component._flagName and not component._syncingFlag then
        self.Flags:Set(component._flagName, self:_CloneValue(value))
    end
end

function UI:_CleanupComponent(component: any): boolean
    if component._destroyed then
        return false
    end

    component._destroyed = true

    for _, connection in component._connections or {} do
        pcall(function()
            connection:Disconnect()
        end)
    end

    table.clear(component._connections or {})

    if component.Changed then
        pcall(function()
            component.Changed:Disconnect()
        end)
    end

    if component.Instance then
        pcall(function()
            component.Instance:Destroy()
        end)
    end

    return true
end

function UI:_GetUserInputService(): any?
    if self._userInputService then
        return self._userInputService
    end

    local success, service = pcall(function()
        return game:GetService("UserInputService")
    end)

    if success then
        self._userInputService = service
        return service
    end

    return nil
end

function UI:_ResolveGuiParents(): {any}
    local parents = {}
    local environment = GetEnvironment()
    local getHiddenUi = environment.gethui

    if type(getHiddenUi) == "function" then
        local success, hiddenUi = pcall(getHiddenUi)
        if success and hiddenUi then
            table.insert(parents, hiddenUi)
        end
    end

    local coreSuccess, coreGui = pcall(function()
        return game:GetService("CoreGui")
    end)
    if coreSuccess and coreGui then
        table.insert(parents, coreGui)
    end

    local playerSuccess, playerGui = pcall(function()
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer
        return if localPlayer then localPlayer:FindFirstChildOfClass("PlayerGui") else nil
    end)
    if playerSuccess and playerGui then
        table.insert(parents, playerGui)
    end

    return parents
end

function UI:_EnsureRootGui(): any
    if self.RootGui and self.RootGui.Parent then
        return self.RootGui
    end

    local rootGui = self:_Create("ScreenGui", {
        Name = "FiveAMHub",
        DisplayOrder = 500,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
    })

    for _, guiParent in self:_ResolveGuiParents() do
        local success = pcall(function()
            rootGui.Parent = guiParent
        end)

        if success and rootGui.Parent == guiParent then
            break
        end
    end

    if not rootGui.Parent then
        rootGui:Destroy()
        error("5AM Hub could not attach its ScreenGui to gethui, CoreGui, or PlayerGui", 2)
    end

    self.RootGui = rootGui
    return rootGui
end

function UI:_EnsureNotificationContainer(): any
    if self._notificationContainer and self._notificationContainer.Parent then
        return self._notificationContainer
    end

    local container = self:_Create("Frame", {
        Name = "Notifications",
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -18, 0, 18),
        Size = UDim2.new(0, 340, 1, -36),
        ZIndex = 100,
    }, self:_EnsureRootGui())

    self:_Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Padding = UDim.new(0, 10),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
    }, container)

    self._notificationContainer = container
    return container
end

function UI:GetTheme(): any
    return self.Themes[self._themeName] or self.Themes.Amethyst
end

function UI:SetTheme(themeName: string): boolean
    if type(themeName) ~= "string" or not self.Themes[themeName] then
        return false
    end

    self._themeName = themeName
    self.ThemeChanged:Fire(self.Themes[themeName], themeName)
    return true
end

function UI:CreateWindow(options: any?): any
    options = self:_MergeOptions(self.Config, options)

    if type(options.Theme) == "string" then
        self:SetTheme(options.Theme)
    end

    local window = self.Components.Window.new(self, options)
    table.insert(self.Windows, window)
    return window
end

function UI:Notify(options: any?): any?
    if not self.Config.NotificationsEnabled then
        return nil
    end

    local normalized = self:_MergeOptions({
        Title = "Notification",
        Content = "",
        Duration = self.Config.NotificationDuration,
        Type = "Info",
    }, options)

    local notification = self.Components.Notification.new(self, self:_EnsureNotificationContainer(), normalized)
    table.insert(self.Notifications, notification)
    return notification
end

function UI:_RemoveWindow(window: any)
    RemoveFromArray(self.Windows, window)
end

function UI:_RemoveNotification(notification: any)
    RemoveFromArray(self.Notifications, notification)
end

function UI:SaveConfig(configName: string): (boolean, string?)
    return self.Flags:Save(configName)
end

function UI:LoadConfig(configName: string): (boolean, string?)
    return self.Flags:Load(configName)
end

function UI:ListConfigs(): {string}
    return self.Flags:List()
end

function UI:Unload()
    local notifications = table.clone(self.Notifications)
    local windows = table.clone(self.Windows)

    for _, notification in notifications do
        notification:Destroy()
    end

    for _, window in windows do
        window:Destroy()
    end

    table.clear(self.Notifications)
    table.clear(self.Windows)

    if self.RootGui then
        pcall(function()
            self.RootGui:Destroy()
        end)
    end

    self.RootGui = nil
    self._notificationContainer = nil
end

return UI
