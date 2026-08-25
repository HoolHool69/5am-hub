-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local RunService_1 = game:GetService("RunService")
local _ = RunService_1:IsServer()
local u1 = RunService_1:IsClient()
function GetOrCreateFolder(a1)
    --[[
      name: GetOrCreateFolder
      line: 79
    ]]
    local v1 = script:FindFirstChild(a1)
    if not (v1) then
        v1 = Instance.new("Folder")
        v1.Name = a1
        v1.Parent = script
    end
    return v1
end
function WaitForRuntimeInstance(a1, a2, a3)
    --[[
      name: WaitForRuntimeInstance
      line: 101
    ]]
    local v2 = a1:WaitForChild(a2, 10)
    local v3 = 10
    while not (v2) do
        if not (a3) or a3 > v3 then
            warn(("[NetworkUtil] Still waiting for '%s' under %s after %d seconds - the server has not created it yet"):format(a2, a1:GetFullName(), v3))
            local v4 = a1:WaitForChild(a2, 10)
            v3 = v3 + 10
            v2 = v4
            continue
        end
        warn(("[NetworkUtil] Gave up waiting for '%s' under %s after %d seconds"):format(a2, a1:GetFullName(), v3))
        return nil
    end
    return v2
end
function WaitForFolder(a1, a2)
    --[[
      name: WaitForFolder
      line: 122
    ]]
    return (WaitForRuntimeInstance(script, a1, a2))
end
function CreateServerRemoteEventWrapper(a1)
    --[[
      name: CreateServerRemoteEventWrapper
      line: 126
    ]]
    local tbl_2 = {}
    function tbl_2.Fire(a2, a3, ...)
        --[[
          name: Fire
          line: 128
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1 ~= nil then
            local v5 = ((type(a3) == "table") and a3) or {a3}
            for _, value_1 in pairs(v5) do
                task.spawn(a1.FireClient, a1, value_1, ...)
            end
        else
            warn("[NetworkUtil] Event has been destroyed")
        end
    end
    function tbl_2.FireClient(a4, a5, ...)
        --[[
          name: FireClient
          line: 142
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1 ~= nil then
            task.spawn(a1.FireClient, a1, a5, ...)
        else
            warn("[NetworkUtil] Event has been destroyed")
        end
    end
    function tbl_2.FireAll(a6, ...)
        --[[
          name: FireAll
          line: 149
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1 ~= nil then
            task.spawn(a1.FireAllClients, a1, ...)
        else
            warn("[NetworkUtil] Event has been destroyed")
        end
    end
    function tbl_2.FireAllClients(a7, ...)
        --[[
          name: FireAllClients
          line: 156
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1 ~= nil then
            task.spawn(a1.FireAllClients, a1, ...)
        else
            warn("[NetworkUtil] Event has been destroyed")
        end
    end
    tbl_2.Fired = a1.OnServerEvent
    tbl_2.OnServerEvent = a1.OnServerEvent
    tbl_2.RemoteInstance = a1
    return tbl_2
end
function CreateClientRemoteEventWrapper(a1, a2)
    --[[
      name: CreateClientRemoteEventWrapper
      line: 169
    ]]
    if a1 ~= nil then
        local tbl_3 = {}
        function tbl_3.Fire(a3, ...)
            --[[
              name: Fire
              line: 201
              upvalues:
                a1 (copy, index: 1)
            ]]
            task.spawn(a1.FireServer, a1, ...)
        end
        function tbl_3.FireServer(a4, ...)
            --[[
              name: FireServer
              line: 204
              upvalues:
                a1 (copy, index: 1)
            ]]
            task.spawn(a1.FireServer, a1, ...)
        end
        tbl_3.Fired = a1.OnClientEvent
        tbl_3.OnClientEvent = a1.OnClientEvent
        tbl_3.RemoteInstance = a1
        return tbl_3
    else
        warn("[NetworkUtil] RemoteEvent '" .. tostring(a2) .. "' not found - server may not have created it yet")
        local tbl_4 = {}
        function tbl_4.Connect()
            --[[
              name: Connect
              line: 177
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot connect to nil event: " .. tostring(a2))
            local tbl_5 = {Disconnect = 0, Connected = false}
            function tbl_5.Disconnect()
                --[[
                  name: Disconnect
                  line: 179
                ]]
            end
            return tbl_5
        end
        function tbl_4.Once()
            --[[
              name: Once
              line: 181
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot connect to nil event: " .. tostring(a2))
            local tbl_6 = {Disconnect = 0, Connected = false}
            function tbl_6.Disconnect()
                --[[
                  name: Disconnect
                  line: 183
                ]]
            end
            return tbl_6
        end
        function tbl_4.Wait()
            --[[
              name: Wait
              line: 185
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot wait on nil event: " .. tostring(a2))
            return nil
        end
        local tbl_7 = {}
        function tbl_7.Fire()
            --[[
              name: Fire
              line: 192
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot fire nil event: " .. tostring(a2))
        end
        function tbl_7.FireServer()
            --[[
              name: FireServer
              line: 193
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot fire nil event: " .. tostring(a2))
        end
        tbl_7.Fired = tbl_4
        tbl_7.OnClientEvent = tbl_4
        return tbl_7
    end
end
function CreateServerRemoteFunctionWrapper(a1)
    --[[
      name: CreateServerRemoteFunctionWrapper
      line: 213
    ]]
    local tbl_8 = {}
    function tbl_8.Invoke(a2, a3, ...)
        --[[
          name: Invoke
          line: 215
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1 ~= nil then
            return a1:InvokeClient(a3, ...)
        end
        warn("[NetworkUtil] Event has been destroyed")
    end
    tbl_8.RemoteInstance = a1
    local tbl_9 = {}
    function tbl_9.__newindex(a4, a5, a6)
        --[[
          name: __newindex
          line: 224
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1 ~= nil then
            if a5 == "OnInvoked" then
                a5 = "OnServerInvoke"
            end
            a1[a5] = a6
        else
            warn("[NetworkUtil] Event has been destroyed")
        end
    end
    return (setmetatable(tbl_8, tbl_9))
end
function CreateClientRemoteFunctionWrapper(a1, a2)
    --[[
      name: CreateClientRemoteFunctionWrapper
      line: 240
    ]]
    if a1 ~= nil then
        local tbl_10 = {}
        function tbl_10.Invoke(a3, ...)
            --[[
              name: Invoke
              line: 256
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:InvokeServer(...)
        end
        function tbl_10.InvokeServer(a4, ...)
            --[[
              name: InvokeServer
              line: 259
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:InvokeServer(...)
        end
        tbl_10.RemoteInstance = a1
        local tbl_11 = {}
        function tbl_11.__newindex(a5, a6, a7)
            --[[
              name: __newindex
              line: 264
              upvalues:
                a1 (copy, index: 1)
            ]]
            if a6 == "OnInvoked" then
                a6 = "OnClientInvoke"
            end
            a1[a6] = a7
        end
        return (setmetatable(tbl_10, tbl_11))
    else
        warn("[NetworkUtil] RemoteFunction '" .. tostring(a2) .. "' not found - server may not have created it yet")
        local tbl_12 = {}
        function tbl_12.Invoke()
            --[[
              name: Invoke
              line: 245
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot invoke nil function: " .. tostring(a2))
            return nil
        end
        function tbl_12.InvokeServer()
            --[[
              name: InvokeServer
              line: 246
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot invoke nil function: " .. tostring(a2))
            return nil
        end
        local tbl_13 = {}
        function tbl_13.__newindex(a8, a9, a10)
            --[[
              name: __newindex
              line: 249
              upvalues:
                a2 (copy, index: 1)
            ]]
            warn("[NetworkUtil] Cannot set " .. tostring(a9) .. " on nil function: " .. tostring(a2))
        end
        return (setmetatable(tbl_12, tbl_13))
    end
end
function tbl_1.RemoteEvent(a1, a2)
    --[[
      name: RemoteEvent
      line: 283
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v6, v7 = nil, nil
    if u1 then
        v6 = WaitForFolder("RemoteEvents", a2)
        if v6 then
            return CreateClientRemoteEventWrapper(WaitForRuntimeInstance(v6, a1, a2), a1)
        end
        warn("[NetworkUtil] RemoteEvents folder not found - server may not be ready")
        return CreateClientRemoteEventWrapper(nil, a1)
    else
        local v8 = GetOrCreateFolder("RemoteEvents")
        v7 = v8:FindFirstChild(a1)
        if not (v7) then
            v7 = Instance.new("RemoteEvent")
            v7.Name = a1
            v7.Parent = v8
        end
        return CreateServerRemoteEventWrapper(v7)
    end
end
function tbl_1.RemoteFunction(a1, a2)
    --[[
      name: RemoteFunction
      line: 313
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v9, v10 = nil, nil
    if u1 then
        v9 = WaitForFolder("RemoteFunctions", a2)
        if v9 then
            return CreateClientRemoteFunctionWrapper(WaitForRuntimeInstance(v9, a1, a2), a1)
        end
        warn("[NetworkUtil] RemoteFunctions folder not found - server may not be ready")
        return CreateClientRemoteFunctionWrapper(nil, a1)
    else
        local v11 = GetOrCreateFolder("RemoteFunctions")
        v10 = v11:FindFirstChild(a1)
        if not (v10) then
            v10 = Instance.new("RemoteFunction")
            v10.Name = a1
            v10.Parent = v11
        end
        return CreateServerRemoteFunctionWrapper(v10)
    end
end
function tbl_1.UnreliableRemoteEvent(a1, a2)
    --[[
      name: UnreliableRemoteEvent
      line: 343
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v12, v13 = nil, nil
    if u1 then
        v12 = WaitForFolder("UnreliableRemoteEvents", a2)
        if v12 then
            return CreateClientRemoteEventWrapper(WaitForRuntimeInstance(v12, a1, a2), a1)
        end
        warn("[NetworkUtil] UnreliableRemoteEvents folder not found - server may not be ready")
        return CreateClientRemoteEventWrapper(nil, a1)
    else
        local v14 = GetOrCreateFolder("UnreliableRemoteEvents")
        v13 = v14:FindFirstChild(a1)
        if not (v13) then
            v13 = Instance.new("UnreliableRemoteEvent")
            v13.Name = a1
            v13.Parent = v14
        end
        return CreateServerRemoteEventWrapper(v13)
    end
end
function tbl_1.BindableEvent(a1, a2)
    --[[
      name: BindableEvent
      line: 371
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v15, v16 = nil, nil
    if u1 then
        v15 = WaitForFolder("BindableEvents", a2)
        if v15 then
            return (WaitForRuntimeInstance(v15, a1, a2))
        end
        warn("[NetworkUtil] BindableEvents folder not found - server may not be ready")
        return nil
    else
        local v17 = GetOrCreateFolder("BindableEvents")
        v16 = v17:FindFirstChild(a1)
        if not (v16) then
            v16 = Instance.new("BindableEvent")
            v16.Name = a1
            v16.Parent = v17
        end
        return v16
    end
end
function tbl_1.BindableFunction(a1, a2)
    --[[
      name: BindableFunction
      line: 398
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v18, v19 = nil, nil
    if u1 then
        v18 = WaitForFolder("BindableFunctions", a2)
        if v18 then
            return (WaitForRuntimeInstance(v18, a1, a2))
        end
        warn("[NetworkUtil] BindableFunctions folder not found - server may not be ready")
        return nil
    else
        local v20 = GetOrCreateFolder("BindableFunctions")
        v19 = v20:FindFirstChild(a1)
        if not (v19) then
            v19 = Instance.new("BindableFunction")
            v19.Name = a1
            v19.Parent = v20
        end
        return v19
    end
end
return tbl_1