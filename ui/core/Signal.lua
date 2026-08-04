--!strict

--[[
    5AM Hub
    File: ui/core/Signal.lua

    Lightweight Roblox-style event signals with independently disconnectable
    connections and support for yielding until the next event.
]]

type Callback = (...any) -> ()

local Connection = {}
Connection.__index = Connection

export type Connection = typeof(setmetatable({} :: {
    Connected: boolean,
    _signal: any?,
    _callback: Callback?,
}, Connection))

local Signal = {}
Signal.__index = Signal

export type Signal = typeof(setmetatable({} :: {
    _connections: {[Connection]: boolean},
    _waitingThreads: {thread},
}, Signal))

function Connection.Disconnect(self: Connection)
    if not self.Connected then
        return
    end

    self.Connected = false

    local signal = self._signal
    if signal then
        signal._connections[self] = nil
    end

    self._signal = nil
    self._callback = nil
end

function Signal.new(): Signal
    return setmetatable({
        _connections = {},
        _waitingThreads = {},
    }, Signal) :: Signal
end

function Signal.Connect(self: Signal, callback: Callback): Connection
    assert(type(callback) == "function", "Signal:Connect(callback) expects a function")

    local connection = setmetatable({
        Connected = true,
        _signal = self,
        _callback = callback,
    }, Connection) :: Connection

    self._connections[connection] = true
    return connection
end

function Signal.Fire(self: Signal, ...: any)
    local arguments = table.pack(...)
    local connections: {Connection} = {}

    for connection in self._connections do
        table.insert(connections, connection)
    end

    for _, connection in connections do
        local callback = connection._callback

        if connection.Connected and callback then
            task.spawn(function()
                if connection.Connected and connection._callback == callback then
                    callback(table.unpack(arguments, 1, arguments.n))
                end
            end)
        end
    end

    local waitingThreads = self._waitingThreads
    self._waitingThreads = {}

    for _, waitingThread in waitingThreads do
        pcall(task.spawn, waitingThread, table.unpack(arguments, 1, arguments.n))
    end
end

function Signal.Wait(self: Signal)
    local waitingThread = coroutine.running()
    table.insert(self._waitingThreads, waitingThread)

    return coroutine.yield()
end

function Signal.Disconnect(self: Signal)
    local connections: {Connection} = {}

    for connection in self._connections do
        table.insert(connections, connection)
    end

    for _, connection in connections do
        connection:Disconnect()
    end

    local waitingThreads = self._waitingThreads
    self._waitingThreads = {}

    for _, waitingThread in waitingThreads do
        pcall(task.spawn, waitingThread)
    end
end

Signal.Destroy = Signal.Disconnect

return Signal
