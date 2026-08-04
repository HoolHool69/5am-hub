--!strict

--[[
    5AM Hub
    File: loader/utils.lua

    Shared executor-safe helpers used by the loader, authentication prompt,
    and game registry. No helper performs external network requests.
]]

local Utils = {}

function Utils:GetEnvironment(): {[string]: any}
    local success, environment = pcall(function()
        return getfenv(0)
    end)

    if not success or type(environment) ~= "table" then
        return {}
    end

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

function Utils:GetGlobalFunction(name: string): any?
    local candidate = self:GetEnvironment()[name]
    return if type(candidate) == "function" then candidate else nil
end

function Utils:Merge(defaults: any, overrides: any?): any
    local merged = {}

    if type(defaults) == "table" then
        for key, value in defaults do
            merged[key] = value
        end
    end

    if type(overrides) == "table" then
        for key, value in overrides do
            merged[key] = value
        end
    end

    return merged
end

function Utils:SafeCall(callback: any, ...: any): (boolean, any)
    if type(callback) ~= "function" then
        return false, "Callback is not callable"
    end

    local arguments = table.pack(...)
    return pcall(function()
        return callback(table.unpack(arguments, 1, arguments.n))
    end)
end

function Utils:Create(className: string, properties: any?, parent: any?): any
    local instance: any = Instance.new(className)

    if type(properties) == "table" then
        for property, value in properties do
            pcall(function()
                instance[property] = value
            end)
        end
    end

    if parent ~= nil then
        instance.Parent = parent
    end

    return instance
end

function Utils:ResolveGuiParents(): {any}
    local parents = {}
    local environment = self:GetEnvironment()
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

function Utils:ParentGui(guiObject: any): (boolean, string?)
    for _, guiParent in self:ResolveGuiParents() do
        local success = pcall(function()
            guiObject.Parent = guiParent
        end)

        if success and guiObject.Parent == guiParent then
            local protectGui = self:GetGlobalFunction("protectgui")
                or self:GetGlobalFunction("protect_gui")

            if protectGui then
                pcall(protectGui, guiObject)
            end

            return true
        end
    end

    return false, "No writable GUI parent is available"
end

function Utils:SafeRequire(moduleReference: any): (boolean, any)
    if type(moduleReference) == "table" then
        return true, moduleReference
    end

    if type(moduleReference) == "function" then
        return self:SafeCall(moduleReference)
    end

    if typeof(moduleReference) ~= "Instance" or not moduleReference:IsA("ModuleScript") then
        return false, "Module reference is not a ModuleScript, table, or function"
    end

    return pcall(require, moduleReference)
end

function Utils:GetPlaceId(): number
    local success, placeId = pcall(function()
        return game.PlaceId
    end)

    return if success and type(placeId) == "number" then placeId else 0
end

function Utils:GetGameName(): string
    local success, gameName = pcall(function()
        return game.Name
    end)

    return if success then tostring(gameName) else "Unknown Game"
end

function Utils:GetProvidedKey(options: any?): string?
    if type(options) == "table" and type(options.Key) == "string" and options.Key ~= "" then
        return options.Key
    end

    local environmentKey = self:GetEnvironment().FiveAMKey
    if type(environmentKey) == "string" and environmentKey ~= "" then
        return environmentKey
    end

    return nil
end

function Utils:WaitForGameLoaded(): boolean
    local loadedSuccess, isLoaded = pcall(function()
        return game:IsLoaded()
    end)

    if not loadedSuccess then
        return false
    end

    if not isLoaded then
        local waitSuccess = pcall(function()
            game.Loaded:Wait()
        end)

        return waitSuccess
    end

    return true
end

function Utils:DisconnectAll(connections: {any})
    for _, connection in connections do
        pcall(function()
            connection:Disconnect()
        end)
    end

    table.clear(connections)
end

return Utils
