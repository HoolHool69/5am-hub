--!strict

-- All server communication for Garbage King is isolated in this module.
-- Argument shapes are taken from the analyzed client scripts rather than guessed.

local RemoteWrapper = {}
RemoteWrapper.__index = RemoteWrapper

export type Result = {
    Success: boolean,
    Code: string,
    Message: string,
    Value: any?,
}

export type RemoteWrapper = typeof(setmetatable({} :: {
    _paths: {[string]: {string}},
    _cache: {[string]: Instance},
}, RemoteWrapper))

local OBSERVED_REMOTES: {[string]: {string}} = {
    AdminAnnouncement = { "ReplicatedStorage", "AdminAnnouncement" },
    EquipItem = { "ReplicatedStorage", "EquipItem" },
    EquipTitle = { "ReplicatedStorage", "EquipTitle" },
    LockItem = { "ReplicatedStorage", "LockItem" },
    LootEffect = { "ReplicatedStorage", "LootEffect" },
    OpenSellMenu = { "ReplicatedStorage", "OpenSellMenu" },
    SellEffect = { "ReplicatedStorage", "SellEffect" },
    SellRequest = { "ReplicatedStorage", "SellRequest" },
    TrashMessage = { "ReplicatedStorage", "TrashMessage" },
}

local function Failure(code: string, message: string): Result
    return {
        Success = false,
        Code = code,
        Message = message,
    }
end

function RemoteWrapper.new(): RemoteWrapper
    return setmetatable({
        _paths = table.clone(OBSERVED_REMOTES),
        _cache = {},
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
    if not remote:IsA("RemoteEvent") then
        return Failure("TYPE_MISMATCH", string.format("%q is not a RemoteEvent", name))
    end

    local ok, fireError = pcall(remote.FireServer, remote, ...)
    if not ok then
        return Failure("CALL_FAILED", tostring(fireError))
    end

    return {
        Success = true,
        Code = "OK",
        Message = string.format("Fired %q", name),
    }
end

function RemoteWrapper:Connect(name: string, callback: (...any) -> ()): (RBXScriptConnection?, Result?)
    local remote, resolveError = self:Resolve(name)
    if not remote then
        return nil, resolveError
    end
    if not remote:IsA("RemoteEvent") then
        return nil, Failure("TYPE_MISMATCH", string.format("%q is not a RemoteEvent", name))
    end

    local ok, connectionOrError = pcall(function()
        return remote.OnClientEvent:Connect(callback)
    end)
    if not ok then
        return nil, Failure("CONNECT_FAILED", tostring(connectionOrError))
    end
    return connectionOrError, nil
end

function RemoteWrapper:ClearCache()
    table.clear(self._cache)
end

return RemoteWrapper
