-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = nil
local function u2(a1, ...)
    --[[
      name: acquireRunnerThreadAndCallEventHandler
      line: 34
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = u1
    u1 = nil
    a1(...)
    u1 = v1
end
local tbl_upv_1 = {}
tbl_upv_1.__index = tbl_upv_1
function tbl_upv_1.new(a1, a2)
    --[[
      name: new
      line: 60
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (setmetatable({_connected = true, _next = false, _signal = a1, _fn = a2}, tbl_upv_1))
end
function tbl_upv_1.Disconnect(a1)
    --[[
      name: Disconnect
      line: 69
    ]]
    a1._connected = false
    if a1._signal._handlerListHead ~= a1 then
        local _handlerListHead_1 = a1._signal._handlerListHead
        while _handlerListHead_1 and _handlerListHead_1._next ~= a1 do
            _handlerListHead_1 = _handlerListHead_1._next
        end
        if _handlerListHead_1 then
            _handlerListHead_1._next = a1._next
        end
    else
        a1._signal._handlerListHead = a1._next
    end
end
local tbl_2 = {__index = 0, __newindex = 0}
function tbl_2.__index(a1, a2)
    --[[
      name: __index
      line: 91
    ]]
    error(("Attempt to get Connection::%s (not a valid member)"):format(tostring(a2)), 2)
end
function tbl_2.__newindex(a1, a2, a3)
    --[[
      name: __newindex
      line: 94
    ]]
    error(("Attempt to set Connection::%s (not a valid member)"):format(tostring(a2)), 2)
end
setmetatable(tbl_upv_1, tbl_2)
local tbl_upv_3 = {}
tbl_upv_3.__index = tbl_upv_3
function tbl_upv_3.new()
    --[[
      name: new
      line: 103
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    return (setmetatable({_handlerListHead = false}, tbl_upv_3))
end
function tbl_upv_3.Connect(a1, a2)
    --[[
      name: Connect
      line: 109
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.new(a1, a2)
    if a1._handlerListHead then
        v2._next = a1._handlerListHead
    end
    a1._handlerListHead = v2
    return v2
end
function tbl_upv_3.DisconnectAll(a1)
    --[[
      name: DisconnectAll
      line: 122
    ]]
    a1._handlerListHead = false
end
local function runEventHandlerInFreeThread()
    --[[
      name: runEventHandlerInFreeThread
      line: 45
      upvalues:
        u2 (copy, index: 1)
    ]]
    while true do
        u2(coroutine.yield())
    end
end
function tbl_upv_3.Fire(a1, ...)
    --[[
      name: Fire
      line: 130
      upvalues:
        u1 (ref,  index: 1)
        runEventHandlerInFreeThread (copy, index: 2)
    ]]
    local _handlerListHead_2 = a1._handlerListHead
    while _handlerListHead_2 do
        if not (_handlerListHead_2._connected) then
            _handlerListHead_2 = _handlerListHead_2._next
            continue
        end
        if not (u1) then
            u1 = coroutine.create(runEventHandlerInFreeThread)
            coroutine.resume(u1)
        end
        task.spawn(u1, _handlerListHead_2._fn, ...)
        _handlerListHead_2 = _handlerListHead_2._next
    end
end
function tbl_upv_3.Wait(a1)
    --[[
      name: Wait
      line: 147
    ]]
    local u3 = coroutine.running()
    local u4 = nil
    local v3 = a1:Connect(
        function(...)
            --[[
              line: 150
              upvalues:
                u4 (ref,  index: 1)
                u3 (copy, index: 2)
            ]]
            u4:Disconnect()
            task.spawn(u3, ...)
        end
    )
    u4 = v3
    return coroutine.yield()
end
function tbl_upv_3.Once(a1, a2)
    --[[
      name: Once
      line: 159
    ]]
    local u5 = nil
    local v4 = a1:Connect(
        function(...)
            --[[
              line: 161
              upvalues:
                u5 (ref,  index: 1)
                a2 (copy, index: 2)
            ]]
            if u5._connected then
                u5:Disconnect()
            end
            a2(...)
        end
    )
    u5 = v4
    return u5
end
local tbl_4 = {__index = 0, __newindex = 0}
function tbl_4.__index(a1, a2)
    --[[
      name: __index
      line: 172
    ]]
    error(("Attempt to get Signal::%s (not a valid member)"):format(tostring(a2)), 2)
end
function tbl_4.__newindex(a1, a2, a3)
    --[[
      name: __newindex
      line: 175
    ]]
    error(("Attempt to set Signal::%s (not a valid member)"):format(tostring(a2)), 2)
end
setmetatable(tbl_upv_3, tbl_4)
return tbl_upv_3