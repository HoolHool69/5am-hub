-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "lobby-atoms")
local findMyLobby_upv_1 = v1.findMyLobby
local friendIdsAtom_upv_1 = v1.friendIdsAtom
local lobbyCountdownEndsAtAtom_upv_1 = v1.lobbyCountdownEndsAtAtom
local lobbyIntents_upv_1 = v1.lobbyIntents
local pushToast_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms").pushToast
local LOBBY_COUNTDOWN_SECONDS_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "match-constants").LOBBY_COUNTDOWN_SECONDS
local lobbiesAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").lobbiesAtom
local tbl_upv_1 = {}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 37
    ]]
    return "LobbyController"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 42
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 46
    ]]
    a1.leavingSelf = false
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 49
      upvalues:
        lobbyIntents_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
        friendIdsAtom_upv_1 (copy, index: 3)
        pushToast_upv_1 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
        subscribe_upv_1 (copy, index: 6)
        lobbiesAtom_upv_1 (copy, index: 7)
    ]]
    lobbyIntents_upv_1.createLobby:Connect(
        function(a2)
            --[[
              line: 50
              upvalues:
                ClientEvents_upv_1 (copy, index: 1)
            ]]
            return ClientEvents_upv_1.createLobby:fire(a2.mode, a2.gameId, a2.friendsOnly, a2.maxPlayers)
        end
    )
    lobbyIntents_upv_1.joinLobby:Connect(
        function(a3)
            --[[
              line: 53
              upvalues:
                ClientEvents_upv_1 (copy, index: 1)
            ]]
            return ClientEvents_upv_1.joinLobby:fire(a3)
        end
    )
    lobbyIntents_upv_1.leaveLobby:Connect(
        function()
            --[[
              line: 56
              upvalues:
                a1 (copy, index: 1)
                ClientEvents_upv_1 (copy, index: 2)
            ]]
            a1.leavingSelf = true
            ClientEvents_upv_1.leaveLobby:fire()
        end
    )
    lobbyIntents_upv_1.startLobby:Connect(
        function()
            --[[
              line: 60
              upvalues:
                ClientEvents_upv_1 (copy, index: 1)
            ]]
            return ClientEvents_upv_1.startLobby:fire()
        end
    )
    ClientEvents_upv_1.friendIdsUpdated:connect(
        function(a4)
            --[[
              line: 63
              upvalues:
                friendIdsAtom_upv_1 (copy, index: 1)
            ]]
            return friendIdsAtom_upv_1(
                function()
                    --[[
                      line: 64
                      upvalues:
                        a4 (copy, index: 1)
                    ]]
                    local tbl_4 = {}
                    for _, value_1 in a4 do
                        tbl_4[value_1] = true
                    end
                    return tbl_4
                end
            )
        end
    )
    ClientEvents_upv_1.lobbyActionDenied:connect(
        function(a5)
            --[[
              line: 72
              upvalues:
                pushToast_upv_1 (copy, index: 1)
                tbl_upv_1 (copy, index: 2)
            ]]
            return pushToast_upv_1(tbl_upv_1[a5], "error")
        end
    )
    ClientEvents_upv_1.requestFriendIds:fire()
    subscribe_upv_1(
        lobbiesAtom_upv_1,
        function(a6)
            --[[
              line: 76
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onLobbiesChanged(a6)
        end
    )
end
u1.onLobbiesChanged = function(a1, a2)
    --[[
      name: onLobbiesChanged
      line: 80
      upvalues:
        findMyLobby_upv_1 (copy, index: 1)
        lobbyCountdownEndsAtAtom_upv_1 (copy, index: 2)
        LOBBY_COUNTDOWN_SECONDS_upv_1 (copy, index: 3)
        pushToast_upv_1 (copy, index: 4)
    ]]
    local v3 = findMyLobby_upv_1(a2)
    local lastPhase_1 = a1.lastPhase
    local v4
    if v3 == nil then
        v4 = v3
    else
        v4 = v3.phase
    end
    a1.lastPhase = v4
    if v3 == nil then
        lobbyCountdownEndsAtAtom_upv_1(
            function()
                --[[
                  line: 107
                ]]
                return nil
            end
        )
        if lastPhase_1 == "open" and not (a1.leavingSelf) then
            pushToast_upv_1("The lobby was closed.", "info")
        end
        a1.leavingSelf = false
    else
        if lastPhase_1 == nil then
            a1.leavingSelf = false
        end
        if v3.phase ~= "countdown" or lastPhase_1 == "countdown" then
            if v3.phase == "open" and lastPhase_1 == "countdown" then
                lobbyCountdownEndsAtAtom_upv_1(
                    function()
                        --[[
                          line: 98
                        ]]
                        return nil
                    end
                )
                pushToast_upv_1("Not enough players \226\128\148 start cancelled.", "error")
            end
        else
            lobbyCountdownEndsAtAtom_upv_1(
                function()
                    --[[
                      line: 94
                      upvalues:
                        LOBBY_COUNTDOWN_SECONDS_upv_1 (copy, index: 1)
                    ]]
                    return os.clock() + LOBBY_COUNTDOWN_SECONDS_upv_1
                end
            )
        end
        return nil
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/lobby-controller@LobbyController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_5 = {}
tbl_5.LobbyController = u1
return tbl_5