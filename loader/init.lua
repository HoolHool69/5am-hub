--!strict

--[[
    5AM Hub
    File: loader/init.lua

    Authenticates the client, loads the shared UI, discovers game modules,
    initializes matching modules, and exposes structured lifecycle results.
]]

local STANDALONE_BUNDLE_URL = "https://raw.githack.com/HoolHool69/5am-hub/main/dist/loader.lua"

local function HasModuleLoaderContext(): boolean
    if typeof(script) ~= "Instance" then
        return false
    end

    local parent = script.Parent
    return script:FindFirstChild("utils") ~= nil
        or (parent ~= nil and parent:FindFirstChild("utils") ~= nil)
end

local function BootstrapStandalone(): any
    local environment: any = _G
    local environmentSuccess, localEnvironment = pcall(function()
        return getfenv(0)
    end)
    if environmentSuccess and type(localEnvironment) == "table" then
        environment = localEnvironment
    end
    local baseEnvironment = environment

    local getGlobalEnvironment = environment.getgenv
    if type(getGlobalEnvironment) == "function" then
        local globalSuccess, globalEnvironment = pcall(getGlobalEnvironment)
        if globalSuccess and type(globalEnvironment) == "table" then
            environment = setmetatable({}, {
                __index = function(_table, key)
                    local localValue = baseEnvironment[key]
                    return if localValue ~= nil then localValue else globalEnvironment[key]
                end,
            })
        end
    end

    local bundleUrl = if type(environment.FiveAMBundleUrl) == "string"
            and environment.FiveAMBundleUrl ~= ""
        then environment.FiveAMBundleUrl
        else STANDALONE_BUNDLE_URL

    local fetchSuccess, sourceOrError = pcall(function()
        return game:HttpGet(bundleUrl)
    end)
    if not fetchSuccess or type(sourceOrError) ~= "string" then
        error(string.format("5AM Hub could not download its standalone bundle: %s", tostring(sourceOrError)), 0)
    end

    local compiler = environment.loadstring or loadstring
    if type(compiler) ~= "function" then
        error("5AM Hub requires an executor with loadstring support", 0)
    end

    local compiledChunk, compileError = compiler(sourceOrError)
    if type(compiledChunk) ~= "function" then
        error(string.format("5AM Hub bundle compilation failed: %s", tostring(compileError)), 0)
    end

    local runSuccess, loaderOrError = pcall(compiledChunk)
    if not runSuccess then
        error(string.format("5AM Hub bundle startup failed: %s", tostring(loaderOrError)), 0)
    end
    return loaderOrError
end

-- A raw loadstring has no ModuleScript hierarchy. Redirect that execution path
-- to the generated standalone artifact. The bundler defines the lexical marker
-- below so its embedded copy of this module does not bootstrap recursively.
if __FIVE_AM_BUNDLED ~= true and not HasModuleLoaderContext() then
    return BootstrapStandalone()
end

local function FindLoaderModule(name: string): any
    return script:FindFirstChild(name) or script.Parent:FindFirstChild(name)
end

local utilsModule = assert(FindLoaderModule("utils"), "5AM Hub loader/utils.lua is missing")
local keySystemModule = assert(FindLoaderModule("keysystem"), "5AM Hub loader/keysystem.lua is missing")
local registryModule = assert(FindLoaderModule("registry"), "5AM Hub loader/registry.lua is missing")

local Utils = require(utilsModule)
local KeySystem = require(keySystemModule)
local Registry = require(registryModule)

local Loader = {}
Loader.__index = Loader

local function Result(success: boolean, stage: string, code: string, message: string, extra: any?): any
    local result = extra or {}
    result.Success = success
    result.Stage = stage
    result.Code = code
    result.Message = message
    return result
end

local function ResolveProjectRoot(): any?
    if typeof(script) ~= "Instance" then
        return nil
    end

    local scriptParent = script.Parent
    if not scriptParent then
        return nil
    end

    local candidates = {
        scriptParent,
        scriptParent.Parent,
    }

    for _, candidate in candidates do
        if candidate and candidate:FindFirstChild("ui") and candidate:FindFirstChild("games") then
            return candidate
        end
    end

    return scriptParent
end

local function ResolveUiReference(options: any, projectRoot: any): any?
    if options.UI ~= nil then
        return options.UI
    end

    return if projectRoot then projectRoot:FindFirstChild("ui") else nil
end

local function ValidateUi(ui: any): (boolean, string?)
    if type(ui) ~= "table" then
        return false, "UI module must return a table"
    end

    if type(ui.CreateWindow) ~= "function" or type(ui.Unload) ~= "function" then
        return false, "UI module does not expose the required lifecycle API"
    end

    if type(ui.Flags) ~= "table" then
        return false, "UI module does not expose UI.Flags"
    end

    return true
end

function Loader.new(): any
    return setmetatable({
        State = "Idle",
        Authentication = nil,
        UI = nil,
        Registry = nil,
        Discovery = nil,
        GameResult = nil,
        Options = nil,
        _starting = false,

        Utils = Utils,
        KeySystem = KeySystem,
        RegistryClass = Registry,
    }, Loader)
end

function Loader:Authenticate(key: any?): any
    return self.KeySystem:Authenticate(key)
end

function Loader:Start(options: any?): any
    options = Utils:Merge({
        Key = nil,
        UI = nil,
        GamesRoot = nil,
        Registry = nil,
        Manifest = nil,
        PlaceId = nil,
        WaitForGameLoaded = true,
    }, options)

    if self._starting then
        return Result(false, self.State, "LOADER_ALREADY_STARTING", "The loader is already starting")
    end

    if self.State == "Ready" then
        return Result(true, "Ready", "LOADER_ALREADY_READY", "The loader is already initialized", {
            Authentication = self.Authentication,
            Discovery = self.Discovery,
            Game = self.GameResult,
            UI = self.UI,
        })
    end

    self._starting = true
    self.Options = options

    if options.WaitForGameLoaded and not Utils:WaitForGameLoaded() then
        self._starting = false
        self.State = "Failed"
        return Result(false, "Game", "GAME_NOT_READY", "The Roblox client did not finish loading")
    end

    self.State = "Authenticating"
    local providedKey = Utils:GetProvidedKey(options)
    local authentication = self:Authenticate(providedKey)
    self.Authentication = authentication

    if not authentication.Success then
        self._starting = false
        self.State = "AuthenticationFailed"
        return Result(false, "Authentication", authentication.Code, authentication.Message, {
            Authentication = authentication,
        })
    end

    self.State = "LoadingUI"
    local projectRoot = ResolveProjectRoot()
    local uiReference = ResolveUiReference(options, projectRoot)

    if not uiReference then
        self._starting = false
        self.State = "Failed"
        return Result(false, "UI", "UI_MODULE_NOT_FOUND", "The shared UI module could not be found", {
            Authentication = authentication,
        })
    end

    local uiLoadSuccess, uiOrError = Utils:SafeRequire(uiReference)
    if not uiLoadSuccess then
        self._starting = false
        self.State = "Failed"
        return Result(false, "UI", "UI_MODULE_LOAD_FAILED", tostring(uiOrError), {
            Authentication = authentication,
        })
    end

    local uiValid, uiValidationError = ValidateUi(uiOrError)
    if not uiValid then
        self._starting = false
        self.State = "Failed"
        return Result(false, "UI", "UI_CONTRACT_INVALID", uiValidationError or "Invalid UI module", {
            Authentication = authentication,
        })
    end

    self.UI = uiOrError
    self.State = "DiscoveringGames"

    local gamesRoot = options.GamesRoot
        or (if projectRoot then projectRoot:FindFirstChild("games") else nil)
    local registry = options.Registry or self.Registry

    if type(registry) ~= "table" or type(registry.Initialize) ~= "function" then
        registry = Registry.new(gamesRoot)
    elseif gamesRoot and type(registry.SetGamesRoot) == "function" then
        registry:SetGamesRoot(gamesRoot)
    end

    self.Registry = registry

    local discoveryResult: any
    if type(registry.Discover) == "function" then
        local discoverySuccess, discoveredOrError = Utils:SafeCall(registry.Discover, registry)
        discoveryResult = if discoverySuccess and type(discoveredOrError) == "table"
            then discoveredOrError
            else Result(false, "Discovery", "DISCOVERY_FAILED", tostring(discoveredOrError))
    else
        discoveryResult = Result(true, "Discovery", "DISCOVERY_SKIPPED", "The supplied registry does not use discovery")
    end
    self.Discovery = discoveryResult

    local manifestResult = nil
    if options.Manifest ~= nil and type(registry.LoadManifest) == "function" then
        local manifestSuccess, loadedOrError = Utils:SafeCall(registry.LoadManifest, registry, options.Manifest)
        manifestResult = if manifestSuccess and type(loadedOrError) == "table"
            then loadedOrError
            else Result(false, "Manifest", "MANIFEST_LOAD_FAILED", tostring(loadedOrError))
    end

    self.State = "InitializingGame"
    local placeId = tonumber(options.PlaceId) or Utils:GetPlaceId()
    local gameSuccess, initializedOrError = Utils:SafeCall(registry.Initialize, registry, placeId, self.UI, self)
    local gameResult = if gameSuccess and type(initializedOrError) == "table"
        then initializedOrError
        else Result(false, "Game", "GAME_INITIALIZATION_FAILED", tostring(initializedOrError))
    self.GameResult = gameResult

    self._starting = false
    self.State = "Ready"

    local hasWarnings = not discoveryResult.Success
        or (manifestResult ~= nil and not manifestResult.Success)
        or not gameResult.Success

    return Result(true, "Ready", if hasWarnings then "LOADER_READY_WITH_WARNINGS" else "LOADER_READY", if hasWarnings
        then "5AM Hub initialized with one or more non-fatal module warnings"
        else "5AM Hub initialized successfully", {
        Authentication = authentication,
        Discovery = discoveryResult,
        Manifest = manifestResult,
        Game = gameResult,
        PlaceId = placeId,
        GameName = Utils:GetGameName(),
        UI = self.UI,
    })
end

function Loader:RegisterGame(placeId: any, moduleReference: any, metadata: any?): (boolean, string?)
    if not self.Registry then
        self.Registry = Registry.new(nil)
    end

    return self.Registry:Register(placeId, moduleReference, metadata)
end

function Loader:GetState(): string
    return self.State
end

function Loader:Unload(): any
    if self.UI and type(self.UI.Unload) == "function" then
        local unloadSuccess, unloadError = Utils:SafeCall(self.UI.Unload, self.UI)
        if not unloadSuccess then
            return Result(false, "Unload", "UI_UNLOAD_FAILED", tostring(unloadError))
        end
    end

    self.State = "Idle"
    self.Authentication = nil
    self.UI = nil
    self.Registry = nil
    self.Discovery = nil
    self.GameResult = nil
    self.Options = nil
    self._starting = false

    return Result(true, "Unload", "LOADER_UNLOADED", "5AM Hub was unloaded")
end

return Loader.new()
