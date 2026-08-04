--!strict

--[[
    5AM Hub
    File: ui/config.lua

    Central defaults shared by future UI windows and components.
]]

return {
    Title = "5AM Hub",
    SubTitle = "",
    Theme = "Amethyst",

    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(420, 320),

    ToggleKey = Enum.KeyCode.RightControl,

    Acrylic = false,
    Transparency = false,
    MinimizeEnabled = true,
    NotificationsEnabled = true,

    ConfigFolder = "5AMHub/configs",
    NotificationDuration = 5,
    TweenPreset = "Smooth",
    CornerRadius = 8,
    TextSize = 14,
    Font = Enum.Font.Gotham,
}
