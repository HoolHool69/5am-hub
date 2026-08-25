--!strict

-- Watermelon Go's analyzed gameplay remotes are server-authoritative, and the
-- dump does not include their caller argument schemas. The revised module uses
-- the game's real HUD controller for drops and real local fruit contacts for
-- merges. This wrapper only owns the optional game-end signal interception.

local RemoteWrapper = {}
RemoteWrapper.__index = RemoteWrapper

export type Result = {
    Success: boolean,
    Code: string,
    Message: string,
    Value: any?,
}

local GAME_ENDED_PATH = {
    "ReplicatedStorage",
    "Remotes",
    "GamemodeManager",
    "GameEnded",
}
local HOOK_KEY = "__FiveAMWatermelonGameEndHook"

local function Result(success: boolean, code: string, message: string, value: any?): Result
    return {
        Success = success,
        Code = code,
        Message = message,
        Value = value,
    }
end

local function ResolvePath(path: {string}): Instance?
    local serviceOk, currentOrError = pcall(game.GetService, game, path[1])
    if not serviceOk then
        return nil
    end

    local current: Instance = currentOrError
    for index = 2, #path do
        local child = current:FindFirstChild(path[index])
        if not child then
            return nil
        end
        current = child
    end
    return current
end

local function SharedEnvironment(environment: any): any
    local getGlobalEnvironment = environment.getgenv
    if type(getGlobalEnvironment) == "function" then
        local ok, globalEnvironment = pcall(getGlobalEnvironment)
        if ok and type(globalEnvironment) == "table" then
            return globalEnvironment
        end
    end
    return environment
end

function RemoteWrapper.new(): any
    return setmetatable({
        _cache = {},
        _disabledIncoming = {},
        _hookState = nil,
    }, RemoteWrapper)
end

function RemoteWrapper:ResolveGameEnded(): Instance?
    local cached = self._cache.GameEnded
    if cached and cached.Parent then
        return cached
    end

    local remote = ResolvePath(GAME_ENDED_PATH)
    if remote then
        self._cache.GameEnded = remote
    end
    return remote
end

function RemoteWrapper:RestoreIncomingConnections()
    for _, connection in self._disabledIncoming do
        local enable = nil
        pcall(function()
            enable = connection.Enable
        end)
        if type(enable) == "function" then
            pcall(enable, connection)
        end
    end
    table.clear(self._disabledIncoming)
end

function RemoteWrapper:DisableIncomingConnections(remote: Instance, environment: any)
    self:RestoreIncomingConnections()
    local getConnections = environment.getconnections
        or environment.get_connections
    if type(getConnections) ~= "function" or not remote:IsA("RemoteEvent") then
        return
    end

    local ok, connections = pcall(getConnections, remote.OnClientEvent)
    if not ok or type(connections) ~= "table" then
        return
    end
    for _, connection in connections do
        local disable = nil
        pcall(function()
            disable = connection.Disable
        end)
        if type(disable) == "function" then
            local disabled = pcall(disable, connection)
            if disabled then
                table.insert(self._disabledIncoming, connection)
            end
        end
    end
end

function RemoteWrapper:InstallNamecallHook(remote: Instance, environment: any): any?
    local sharedEnvironment = SharedEnvironment(environment)
    local existing = sharedEnvironment[HOOK_KEY]
    if type(existing) == "table" then
        existing.Target = remote
        self._hookState = existing
        return existing
    end

    local hookMetamethod = environment.hookmetamethod
    local getNamecallMethod = environment.getnamecallmethod
    if type(hookMetamethod) ~= "function" or type(getNamecallMethod) ~= "function" then
        return nil
    end

    local state: any = {
        Enabled = false,
        Target = remote,
        Original = nil,
    }
    local originalNamecall: any = nil
    local wrapper = function(target: any, ...: any)
        local method = getNamecallMethod()
        if state.Enabled and target == state.Target and method == "FireServer" then
            return nil
        end
        return originalNamecall(target, ...)
    end
    local newCClosure = environment.newcclosure
    if type(newCClosure) == "function" then
        wrapper = newCClosure(wrapper)
    end

    local hookOk, originalOrError = pcall(hookMetamethod, game, "__namecall", wrapper)
    if not hookOk or type(originalOrError) ~= "function" then
        return nil
    end
    originalNamecall = originalOrError
    state.Original = originalNamecall
    sharedEnvironment[HOOK_KEY] = state
    self._hookState = state
    return state
end

function RemoteWrapper:SetGameEndBlocked(enabled: boolean, environment: any): Result
    local remote = self:ResolveGameEnded()
    if not remote then
        return Result(false, "REMOTE_MISSING", "GamemodeManager.GameEnded was not found.", nil)
    end

    if not enabled then
        if self._hookState then
            self._hookState.Enabled = false
        end
        self:RestoreIncomingConnections()
        return Result(true, "OK", "Game-end interception disabled.", nil)
    end

    local state = self:InstallNamecallHook(remote, environment)
    self:DisableIncomingConnections(remote, environment)
    if not state and #self._disabledIncoming == 0 then
        return Result(
            false,
            "UNSUPPORTED",
            "This executor exposes neither namecall hooks nor connection controls.",
            nil
        )
    end
    if state then
        state.Enabled = true
        state.Target = remote
    end
    return Result(true, "OK", "Client game-end signals are blocked.", nil)
end

function RemoteWrapper:ClearCache()
    if self._hookState then
        self._hookState.Enabled = false
    end
    self:RestoreIncomingConnections()
    table.clear(self._cache)
end

return RemoteWrapper
