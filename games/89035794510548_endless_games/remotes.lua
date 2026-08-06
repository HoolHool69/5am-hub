--!strict

-- Every Endless Games server endpoint observed in the analyzed client is
-- registered here. Feature files intentionally operate through the game's
-- session controller, whose rbxts networking layer owns request correlation.

local RemoteWrapper = {}
RemoteWrapper.__index = RemoteWrapper

export type Result = {
    Success: boolean,
    Code: string,
    Message: string,
    Value: any?,
}

local EVENT_FOLDER = "shared/network@GlobalEvents"
local FUNCTION_FOLDER = "shared/network@GlobalFunctions"

local OBSERVED_REMOTES: {[string]: {string}} = {
    AbandonRun = { "ReplicatedStorage", EVENT_FOLDER, "abandonRun" },
    AcceptRematch = { "ReplicatedStorage", EVENT_FOLDER, "acceptRematch" },
    CreateLobby = { "ReplicatedStorage", EVENT_FOLDER, "createLobby" },
    JoinLobby = { "ReplicatedStorage", EVENT_FOLDER, "joinLobby" },
    LeaveLobby = { "ReplicatedStorage", EVENT_FOLDER, "leaveLobby" },
    MarkTutorialSeen = { "ReplicatedStorage", EVENT_FOLDER, "markTutorialSeen" },
    ParkRun = { "ReplicatedStorage", EVENT_FOLDER, "parkRun" },
    RunCheckpoint = { "ReplicatedStorage", EVENT_FOLDER, "runCheckpoint" },
    StartLobby = { "ReplicatedStorage", EVENT_FOLDER, "startLobby" },
    VoteGame = { "ReplicatedStorage", EVENT_FOLDER, "voteGame" },
    EndRun = { "ReplicatedStorage", FUNCTION_FOLDER, "endRun" },
    RedeemRevive = { "ReplicatedStorage", FUNCTION_FOLDER, "redeemRevive" },
    ResumeRun = { "ReplicatedStorage", FUNCTION_FOLDER, "resumeRun" },
    StartDailyRun = { "ReplicatedStorage", FUNCTION_FOLDER, "startDailyRun" },
    StartRun = { "ReplicatedStorage", FUNCTION_FOLDER, "startRun" },
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

    local ok, errorMessage = pcall(remote.FireServer, remote, ...)
    if not ok then
        return Failure("CALL_FAILED", tostring(errorMessage))
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
