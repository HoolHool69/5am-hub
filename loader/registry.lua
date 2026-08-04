--!strict

--[[
    5AM Hub
    File: loader/registry.lua

    Discovers universal and place-specific game modules, validates the shared
    module contract, and initializes matching modules with structured results.
]]

local Utils = require(script.Parent:WaitForChild("utils"))

local Registry = {}
Registry.__index = Registry

local function Result(success: boolean, code: string, message: string, extra: any?): any
    local result = extra or {}
    result.Success = success
    result.Code = code
    result.Message = message
    return result
end

local function ResolveContainerModule(container: any): any?
    if typeof(container) ~= "Instance" then
        return container
    end

    if container:IsA("ModuleScript") then
        return container
    end

    local initModule = container:FindFirstChild("init")
    if initModule and initModule:IsA("ModuleScript") then
        return initModule
    end

    return nil
end

function Registry.new(gamesRoot: any?): any
    return setmetatable({
        _gamesRoot = gamesRoot,
        _entries = {},
        _universal = nil,
    }, Registry)
end

function Registry:SetGamesRoot(gamesRoot: any?)
    self._gamesRoot = gamesRoot
end

function Registry:Register(placeId: any, moduleReference: any, metadata: any?): (boolean, string?)
    local numericPlaceId = tonumber(placeId)
    local resolvedModule = ResolveContainerModule(moduleReference)

    if not numericPlaceId or numericPlaceId <= 0 then
        return false, "Place ID must be a positive number"
    end

    if not resolvedModule then
        return false, "Game module could not be resolved"
    end

    self._entries[numericPlaceId] = {
        PlaceId = numericPlaceId,
        Module = resolvedModule,
        Metadata = if type(metadata) == "table" then metadata else {},
    }

    return true
end

function Registry:RegisterUniversal(moduleReference: any): (boolean, string?)
    local resolvedModule = ResolveContainerModule(moduleReference)
    if not resolvedModule then
        return false, "Universal module could not be resolved"
    end

    self._universal = resolvedModule
    return true
end

function Registry:_ResolveNamedModule(moduleName: string): any?
    local gamesRoot = self._gamesRoot
    if typeof(gamesRoot) ~= "Instance" then
        return nil
    end

    local container = gamesRoot:FindFirstChild(moduleName)
    return if container then ResolveContainerModule(container) else nil
end

function Registry:Discover(): any
    local gamesRoot = self._gamesRoot
    if typeof(gamesRoot) ~= "Instance" then
        return Result(false, "GAMES_ROOT_UNAVAILABLE", "The games container is unavailable", {
            Registered = 0,
        })
    end

    local getChildrenSuccess, children = pcall(function()
        return gamesRoot:GetChildren()
    end)

    if not getChildrenSuccess then
        return Result(false, "GAME_DISCOVERY_FAILED", tostring(children), {
            Registered = 0,
        })
    end

    local registered = 0
    local warnings = {}

    for _, child in children do
        if child.Name == "_universal" then
            local success, message = self:RegisterUniversal(child)
            if not success then
                table.insert(warnings, message)
            end
        elseif child.Name ~= "_template" then
            local placeIdText = string.match(child.Name, "^(%d+)_") or string.match(child.Name, "^(%d+)$")

            if placeIdText then
                local success, message = self:Register(tonumber(placeIdText), child, {
                    Name = child.Name,
                })

                if success then
                    registered += 1
                elseif message then
                    table.insert(warnings, string.format("%s: %s", child.Name, message))
                end
            end
        end
    end

    return Result(true, "DISCOVERY_COMPLETE", "Game module discovery completed", {
        Registered = registered,
        HasUniversal = self._universal ~= nil,
        Warnings = warnings,
    })
end

function Registry:LoadManifest(manifest: any): any
    local decodedManifest = manifest

    if type(manifest) == "string" then
        local serviceSuccess, httpService = pcall(function()
            return game:GetService("HttpService")
        end)

        if not serviceSuccess then
            return Result(false, "HTTP_SERVICE_UNAVAILABLE", "HttpService is unavailable for local JSON decoding")
        end

        local decodeSuccess, decoded = pcall(function()
            return httpService:JSONDecode(manifest)
        end)

        if not decodeSuccess then
            return Result(false, "MANIFEST_INVALID", tostring(decoded))
        end

        decodedManifest = decoded
    end

    if type(decodedManifest) ~= "table" then
        return Result(false, "MANIFEST_INVALID", "Manifest must be a table or JSON object")
    end

    local entries = decodedManifest.Games or decodedManifest
    if type(entries) ~= "table" then
        return Result(false, "MANIFEST_INVALID", "Manifest Games must be a table")
    end

    local registered = 0
    local warnings = {}

    for key, entry in entries do
        if key ~= "_comment" and key ~= "Games" then
            local placeId = key
            local moduleReference = entry
            local metadata = nil

            if type(entry) == "table" and not entry.Init then
                placeId = entry.PlaceId or entry.PlaceID or key
                moduleReference = entry.Module or entry.Path or entry.Name
                metadata = entry.Meta or entry.Metadata
            end

            if key == "_universal" then
                if type(moduleReference) == "string" then
                    moduleReference = self:_ResolveNamedModule(moduleReference)
                end

                local success, message = self:RegisterUniversal(moduleReference)
                if not success and message then
                    table.insert(warnings, message)
                end
            else
                if type(moduleReference) == "string" then
                    moduleReference = self:_ResolveNamedModule(moduleReference)
                end

                local success, message = self:Register(placeId, moduleReference, metadata)
                if success then
                    registered += 1
                elseif message then
                    table.insert(warnings, string.format("%s: %s", tostring(placeId), message))
                end
            end
        end
    end

    return Result(true, "MANIFEST_LOADED", "Manifest entries were processed", {
        Registered = registered,
        Warnings = warnings,
    })
end

function Registry:Resolve(placeId: any): any?
    local numericPlaceId = tonumber(placeId)
    local entry = if numericPlaceId then self._entries[numericPlaceId] else nil
    return if entry then entry.Module else self._universal
end

function Registry:GetModules(placeId: any): {any}
    local modules = {}

    if self._universal then
        table.insert(modules, {
            Kind = "Universal",
            Module = self._universal,
        })
    end

    local numericPlaceId = tonumber(placeId)
    local entry = if numericPlaceId then self._entries[numericPlaceId] else nil
    if entry and entry.Module ~= self._universal then
        table.insert(modules, {
            Kind = "Game",
            Module = entry.Module,
            PlaceId = numericPlaceId,
            Metadata = entry.Metadata,
        })
    end

    return modules
end

function Registry:LoadModule(moduleReference: any): any
    local loadSuccess, loadedOrError = Utils:SafeRequire(moduleReference)
    if not loadSuccess then
        return Result(false, "MODULE_LOAD_FAILED", tostring(loadedOrError))
    end

    if type(loadedOrError) ~= "table" then
        return Result(false, "MODULE_CONTRACT_INVALID", "Game module must return a table")
    end

    if type(loadedOrError.Meta) ~= "table" then
        return Result(false, "MODULE_CONTRACT_INVALID", "Game module must expose a Meta table")
    end

    if type(loadedOrError.Init) ~= "function" then
        return Result(false, "MODULE_CONTRACT_INVALID", "Game module must expose Init(UI, Loader)")
    end

    return Result(true, "MODULE_LOADED", "Game module loaded", {
        Module = loadedOrError,
    })
end

function Registry:Initialize(placeId: any, ui: any, loader: any): any
    local loadedModules = {}
    local errors = {}
    local candidates = self:GetModules(placeId)

    for _, candidate in candidates do
        local loadResult = self:LoadModule(candidate.Module)

        if not loadResult.Success then
            table.insert(errors, {
                Kind = candidate.Kind,
                Code = loadResult.Code,
                Message = loadResult.Message,
            })
        else
            local initializeSuccess, initializeError = Utils:SafeCall(loadResult.Module.Init, ui, loader)

            if initializeSuccess then
                table.insert(loadedModules, {
                    Kind = candidate.Kind,
                    Meta = loadResult.Module.Meta,
                })
            else
                table.insert(errors, {
                    Kind = candidate.Kind,
                    Code = "MODULE_INITIALIZATION_FAILED",
                    Message = tostring(initializeError),
                })
            end
        end
    end

    local success = #errors == 0
    local code = if #candidates == 0 then "NO_MATCHING_MODULE" elseif success then "MODULES_INITIALIZED" else "MODULE_ERRORS"
    local message = if #candidates == 0
        then "No universal or place-specific game module is registered"
        elseif success
        then "Matching game modules initialized"
        else "One or more game modules failed to initialize"

    return Result(success, code, message, {
        Loaded = loadedModules,
        Errors = errors,
    })
end

function Registry:List(): {any}
    local entries = {}

    for placeId, entry in self._entries do
        table.insert(entries, {
            PlaceId = placeId,
            Metadata = entry.Metadata,
        })
    end

    table.sort(entries, function(left, right)
        return left.PlaceId < right.PlaceId
    end)

    return entries
end

return Registry
