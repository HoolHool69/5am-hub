--!strict

--[[
    5AM Hub
    File: ui/core/Tween.lua

    Safe TweenService wrapper with shared animation presets for UI components.
]]

type Preset = {
    Duration: number,
    EasingStyle: Enum.EasingStyle,
    EasingDirection: Enum.EasingDirection,
}

local Tween = {}

Tween.Presets = {
    Smooth = {
        Duration = 0.25,
        EasingStyle = Enum.EasingStyle.Quint,
        EasingDirection = Enum.EasingDirection.Out,
    },
    Snap = {
        Duration = 0.14,
        EasingStyle = Enum.EasingStyle.Quad,
        EasingDirection = Enum.EasingDirection.Out,
    },
    Bounce = {
        Duration = 0.45,
        EasingStyle = Enum.EasingStyle.Bounce,
        EasingDirection = Enum.EasingDirection.Out,
    },
} :: {[string]: Preset}

local function ResolveTweenService(): any?
    local success, service = pcall(function()
        return game:GetService("TweenService")
    end)

    if success then
        return service
    end

    return nil
end

local function ResolveEnumItem(enumType: any, value: any, fallback: any): any
    if typeof(value) == "EnumItem" then
        return value
    end

    if type(value) == "string" then
        return enumType[value] or fallback
    end

    return fallback
end

local function ResolveTweenInfo(presetOrInfo: any): TweenInfo?
    if typeof(presetOrInfo) == "TweenInfo" then
        return presetOrInfo
    end

    local settings: any

    if type(presetOrInfo) == "string" then
        settings = Tween.Presets[presetOrInfo]
        if not settings then
            return nil
        end
    elseif type(presetOrInfo) == "table" then
        settings = presetOrInfo
    else
        return nil
    end

    local duration = tonumber(settings.Duration or settings.Time)
    if not duration or duration < 0 then
        return nil
    end

    local easingStyle = ResolveEnumItem(Enum.EasingStyle, settings.EasingStyle, Enum.EasingStyle.Quad)
    local easingDirection = ResolveEnumItem(Enum.EasingDirection, settings.EasingDirection, Enum.EasingDirection.Out)
    local repeatCount = tonumber(settings.RepeatCount) or 0
    local reverses = if type(settings.Reverses) == "boolean" then settings.Reverses else false
    local delayTime = tonumber(settings.DelayTime) or 0

    local success, tweenInfo = pcall(
        TweenInfo.new,
        duration,
        easingStyle,
        easingDirection,
        repeatCount,
        reverses,
        delayTime
    )

    if success then
        return tweenInfo
    end

    return nil
end

function Tween.Create(self: any, instance: any, presetOrInfo: any, targetProperties: any): Tween?
    if instance == nil or type(targetProperties) ~= "table" then
        return nil
    end

    local tweenInfo = ResolveTweenInfo(presetOrInfo)
    if not tweenInfo then
        return nil
    end

    local tweenService = self._tweenService or ResolveTweenService()
    if not tweenService then
        return nil
    end

    local createSuccess, createdTween = pcall(function()
        return tweenService:Create(instance, tweenInfo, targetProperties)
    end)

    if not createSuccess or createdTween == nil then
        return nil
    end

    local playSuccess = pcall(function()
        createdTween:Play()
    end)

    if not playSuccess then
        pcall(function()
            createdTween:Cancel()
        end)
        return nil
    end

    self._tweenService = tweenService
    return createdTween
end

Tween._tweenService = ResolveTweenService()

return Tween
