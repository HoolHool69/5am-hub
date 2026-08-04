--!strict

--[[
    Remote wrapper reference
    ========================

    Every RemoteEvent/RemoteFunction used by a game package must be registered
    and called here. Keeping discovery and invocation in one place makes remote
    changes easy to audit and prevents feature files from duplicating paths.

    A registered path starts with a Roblox service name, for example:

        { "ReplicatedStorage", "Remotes", "PurchaseItem" }

    Add observed remote names only after analyzing the target game. Never guess
    argument shapes; document them beside the corresponding registration.
]]

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

local function Failure(code: string, message: string): Result
    return {
        Success = false,
        Code = code,
        Message = message,
    }
end

function RemoteWrapper.new(): RemoteWrapper
    return setmetatable({
        _paths = {},
        _cache = {},
    }, RemoteWrapper)
end

-- Register is normally called once from init.lua. Re-registering a name clears
-- its cache, which is useful when a game rebuilds its remote folder at runtime.
function RemoteWrapper:Register(name: string, path: {string})
    assert(type(name) == "string" and name ~= "", "Remote name must be a non-empty string")
    assert(type(path) == "table" and #path >= 2, "Remote path must include a service and instance")

    self._paths[name] = table.clone(path)
    self._cache[name] = nil
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

    local ok, serviceOrError = pcall(game.GetService, game, path[1])
    if not ok then
        return nil, Failure("SERVICE_MISSING", tostring(serviceOrError))
    end

    local current: Instance = serviceOrError
    for index = 2, #path do
        local child = current:FindFirstChild(path[index])
        if not child then
            return nil, Failure(
                "REMOTE_MISSING",
                string.format("Could not resolve %q at path segment %q", name, path[index])
            )
        end
        current = child
    end

    self._cache[name] = current
    return current, nil
end

-- RemoteEvent calls return a structured status instead of throwing into a UI
-- callback. Feature code can notify the user or retry based on Result.Code.
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

-- RemoteFunction return values are placed in Result.Value so success/failure is
-- never confused with a legitimate nil or false value returned by the server.
function RemoteWrapper:Invoke(name: string, ...: any): Result
    local remote, resolveError = self:Resolve(name)
    if not remote then
        return resolveError :: Result
    end
    if not remote:IsA("RemoteFunction") then
        return Failure("TYPE_MISMATCH", string.format("%q is not a RemoteFunction", name))
    end

    local ok, valueOrError = pcall(remote.InvokeServer, remote, ...)
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

function RemoteWrapper:ClearCache()
    table.clear(self._cache)
end

return RemoteWrapper
