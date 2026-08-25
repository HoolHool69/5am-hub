--!strict

-- All Watermelon Go remote discovery and invocation is intentionally isolated
-- in this file. The analyzed client exposes server-authoritative drop and merge
-- endpoints; feature modules never access those instances directly.

local RemoteWrapper = {}
RemoteWrapper.__index = RemoteWrapper

export type Result = {
    Success: boolean,
    Code: string,
    Message: string,
    Value: any?,
}

local OBSERVED_REMOTES: {[string]: {string}} = {
    RequestFruitDrop = {
        "ReplicatedStorage",
        "Remotes",
        "GamemodeManager",
        "RequestFruitDrop",
    },
    RequestFruitDropOLD = {
        "ReplicatedStorage",
        "Remotes",
        "GamemodeManager",
        "RequestFruitDropOLD",
    },
    RequestFruitMerge = {
        "ReplicatedStorage",
        "Remotes",
        "GamemodeManager",
        "RequestFruitMerge",
    },
    RequestGamemode = {
        "ReplicatedStorage",
        "Remotes",
        "GamemodeManager",
        "RequestGamemode",
    },
    RollbackEvent = {
        "ReplicatedStorage",
        "Remotes",
        "GamemodeManager",
        "RollbackEvent",
    },
    SetGamePaused = {
        "ReplicatedStorage",
        "Remotes",
        "GamemodeManager",
        "SetGamePaused",
    },
    ReplicateCloudPosition = {
        "ReplicatedStorage",
        "Remotes",
        "ReplicationManager",
        "ReplicateCloudPosition",
    },
    RequestFruitTypeDelete = {
        "ReplicatedStorage",
        "Utils",
        "NetworkUtil",
        "RemoteFunctions",
        "RequestFruitTypeDelete",
    },
}

local function Failure(code: string, message: string): Result
    return {
        Success = false,
        Code = code,
        Message = message,
    }
end

function RemoteWrapper.new(): any
    return setmetatable({
        _paths = table.clone(OBSERVED_REMOTES),
        _cache = {},
        _dropMode = nil,
    }, RemoteWrapper)
end

function RemoteWrapper:Resolve(name: string): (Instance?, Result?)
    local cached = self._cache[name]
    if cached and cached.Parent then
        return cached, nil
    end

    local path = self._paths[name]
    if not path then
        return nil, Failure("NOT_REGISTERED", string.format("Remote %q is not registered", name))
    end

    local serviceOk, currentOrError = pcall(game.GetService, game, path[1])
    if not serviceOk then
        return nil, Failure("SERVICE_MISSING", tostring(currentOrError))
    end

    local current: Instance = currentOrError
    for index = 2, #path do
        local child = current:FindFirstChild(path[index])
        if not child then
            return nil, Failure(
                "REMOTE_MISSING",
                string.format("Could not resolve %q at segment %q", name, path[index])
            )
        end
        current = child
    end

    self._cache[name] = current
    return current, nil
end

function RemoteWrapper:Fire(name: string, ...: any): Result
    local remote, resolveError = self:Resolve(name)
    if not remote then
        return resolveError :: Result
    end
    if not remote:IsA("RemoteEvent") and not remote:IsA("UnreliableRemoteEvent") then
        return Failure("TYPE_MISMATCH", string.format("%q is not an event remote", name))
    end

    local ok, errorMessage = pcall(function(...: any)
        (remote :: any):FireServer(...)
    end, ...)
    if not ok then
        return Failure("CALL_FAILED", tostring(errorMessage))
    end

    return {
        Success = true,
        Code = "OK",
        Message = string.format("Fired %q", name),
    }
end

function RemoteWrapper:Invoke(name: string, ...: any): Result
    local remote, resolveError = self:Resolve(name)
    if not remote then
        return resolveError :: Result
    end
    if not remote:IsA("RemoteFunction") then
        return Failure("TYPE_MISMATCH", string.format("%q is not a RemoteFunction", name))
    end

    local ok, valueOrError = pcall(function(...: any)
        return (remote :: RemoteFunction):InvokeServer(...)
    end, ...)
    if not ok then
        return Failure("CALL_FAILED", tostring(valueOrError))
    end

    return {
        Success = true,
        Code = "OK",
        Message = string.format("Invoked %q", name),
        Value = valueOrError,
    }
end

-- The dump identifies RequestFruitDrop but does not contain its LocalScript
-- caller. The optional fast path probes common argument generations and then
-- remembers the first shape accepted by the live server. The default autoplayer
-- uses the original game input controller, avoiding this compatibility path.
function RemoteWrapper:DropFruit(worldPosition: Vector3): Result
    self:Fire("ReplicateCloudPosition", worldPosition)

    local modes = if self._dropMode
        then { self._dropMode }
        else { "Vector3", "Number", "NoArguments" }
    local lastResult: Result? = nil

    for _, mode in modes do
        local result = if mode == "Vector3"
            then self:Invoke("RequestFruitDrop", worldPosition)
            elseif mode == "Number" then self:Invoke("RequestFruitDrop", worldPosition.X)
            else self:Invoke("RequestFruitDrop")

        if result.Success and result.Value ~= false then
            self._dropMode = mode
            return result
        end
        lastResult = result
    end

    local legacyResult = self:Fire("RequestFruitDropOLD", worldPosition)
    if legacyResult.Success then
        return legacyResult
    end
    return lastResult or legacyResult
end

function RemoteWrapper:MergeFruits(firstFruit: BasePart, secondFruit: BasePart): Result
    return self:Fire("RequestFruitMerge", firstFruit, secondFruit)
end

function RemoteWrapper:RequestSinglePlayer(): Result
    return self:Fire("RequestGamemode", "SinglePlayer")
end

function RemoteWrapper:SetPaused(paused: boolean): Result
    return self:Fire("SetGamePaused", paused)
end

function RemoteWrapper:Rollback(): Result
    return self:Fire("RollbackEvent")
end

function RemoteWrapper:DeleteFruitType(fruitName: string): Result
    return self:Invoke("RequestFruitTypeDelete", fruitName)
end

function RemoteWrapper:ClearCache()
    table.clear(self._cache)
    self._dropMode = nil
end

return RemoteWrapper
