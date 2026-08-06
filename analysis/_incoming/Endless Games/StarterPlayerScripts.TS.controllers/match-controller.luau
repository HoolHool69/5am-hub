-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local HttpService_upv_1 = v1.HttpService
local Players_upv_1 = v1.Players
local Workspace_upv_1 = v1.Workspace
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out")
local setInterval_upv_1 = v2.setInterval
local setTimeout_upv_1 = v2.setTimeout
local createBotDriver_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "bots", "bot-driver").createBotDriver
local BOT_PROFILES_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "bots", "bot-types").BOT_PROFILES
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "match-atoms")
local liveOpponents_upv_1 = v3.liveOpponents
local matchAtom_upv_1 = v3.matchAtom
local matchIntents_upv_1 = v3.matchIntents
local opponentSnapshotsAtom_upv_1 = v3.opponentSnapshotsAtom
local spectateTargetAtom_upv_1 = v3.spectateTargetAtom
local sessionIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "session-intents").sessionIntents
local pushToast_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms").pushToast
local v4 = RuntimeLib_1.import(script, script.Parent.Parent, "network")
local ClientEvents_upv_1 = v4.ClientEvents
local ClientFunctions_upv_1 = v4.ClientFunctions
local v5 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "match-constants")
local MATCH_COUNTDOWN_SECONDS_upv_1 = v5.MATCH_COUNTDOWN_SECONDS
local MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1 = v5.MATCH_SNAPSHOT_INTERVAL_SECONDS
local MATCH_STALL_SECONDS_upv_1 = v5.MATCH_STALL_SECONDS
local MATCH_TIME_CAP_SECONDS_upv_1 = v5.MATCH_TIME_CAP_SECONDS
local isMatchGame_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "match-types").isMatchGame
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 45
    ]]
    return "MatchController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 50
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u1)
    return v6:constructor(...) or v6
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 54
    ]]
    a1.session = a2
    a1.audio = a3
    a1.readyReportedFor = ""
    a1.botDuelLastScore = 0
    a1.botDuelProgressAt = 0
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 61
      upvalues:
        matchIntents_upv_1 (copy, index: 1)
        subscribe_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        ClientEvents_upv_1 (copy, index: 4)
        matchAtom_upv_1 (copy, index: 5)
    ]]
    matchIntents_upv_1.startBotDuel:Connect(
        function(a2, a3)
            --[[
              line: 62
              upvalues:
                a1 (copy, index: 1)
            ]]
            return task.spawn(
                function()
                    --[[
                      line: 63
                      upvalues:
                        a1 (copy, index: 1)
                        a2 (copy, index: 2)
                        a3 (copy, index: 3)
                    ]]
                    return a1:startBotDuel(a2, a3)
                end
            )
        end
    )
    matchIntents_upv_1.leaveMatch:Connect(
        function()
            --[[
              line: 67
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:leaveMatch()
        end
    )
    matchIntents_upv_1.requestRematch:Connect(
        function()
            --[[
              line: 70
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:requestRematch()
        end
    )
    matchIntents_upv_1.cycleSpectate:Connect(
        function()
            --[[
              line: 73
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:cycleSpectate()
        end
    )
    subscribe_upv_1(
        sessionAtom_upv_1,
        function()
            --[[
              line: 79
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:refreshSpectateTarget()
        end
    )
    ClientEvents_upv_1.matchAssigned:connect(
        function(a4)
            --[[
              line: 82
              upvalues:
                a1 (copy, index: 1)
            ]]
            return task.spawn(
                function()
                    --[[
                      line: 83
                      upvalues:
                        a1 (copy, index: 1)
                        a4 (copy, index: 2)
                    ]]
                    return a1:onAssigned(a4)
                end
            )
        end
    )
    ClientEvents_upv_1.matchGo:connect(
        function(a5, a6, a7, a8)
            --[[
              line: 87
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onGo(a5, a6, a7, a8)
        end
    )
    ClientEvents_upv_1.matchTimeUp:connect(
        function(a9)
            --[[
              line: 90
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onTimeUp(a9)
        end
    )
    ClientEvents_upv_1.matchEliminated:connect(
        function(a10, a11)
            --[[
              line: 93
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onEliminated(a10, a11)
        end
    )
    ClientEvents_upv_1.matchStandings:connect(
        function(a12, a13)
            --[[
              line: 96
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onStandings(a12, a13)
        end
    )
    ClientEvents_upv_1.matchCancelled:connect(
        function(a14, a15)
            --[[
              line: 99
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onCancelled(a14, a15)
        end
    )
    ClientEvents_upv_1.matchEnded:connect(
        function(a16)
            --[[
              line: 102
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onEnded(a16)
        end
    )
    ClientEvents_upv_1.matchOpponentSnapshots:connect(
        function(a17, a18)
            --[[
              line: 105
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onOpponentSnapshots(a17, a18)
        end
    )
    ClientEvents_upv_1.rematchOffered:connect(
        function(a19, a20, a21, a22)
            --[[
              line: 108
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onRematchOffered(a19, a20, a21, a22)
        end
    )
    ClientEvents_upv_1.rematchClosed:connect(
        function(a23, a24)
            --[[
              line: 111
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onRematchClosed(a23, a24)
        end
    )
    subscribe_upv_1(
        sessionAtom_upv_1,
        function(a25)
            --[[
              line: 116
              upvalues:
                matchAtom_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                ClientEvents_upv_1 (copy, index: 3)
            ]]
            if a25 ~= nil and a25.mode == "match" then
                local v7 = nil
                if a25.phase == "ready" then
                    v7 = matchAtom_upv_1()
                    if v7 ~= nil and v7.phase == "loading" and v7.bot == nil then
                        if a1.readyReportedFor ~= v7.matchId then
                            a1.readyReportedFor = v7.matchId
                            ClientEvents_upv_1.matchReady:fire(v7.matchId)
                            return
                        end
                        return nil
                    end
                    return nil
                end
            end
            return nil
        end
    )
end
u1.leaveMatch = function(a1)
    --[[
      name: leaveMatch
      line: 131
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
        sessionIntents_upv_1 (copy, index: 3)
        sessionAtom_upv_1 (copy, index: 4)
    ]]
    local v8 = matchAtom_upv_1()
    if v8 ~= nil then
        if v8.phase ~= "live" and v8.phase ~= "ended" then
            return nil
        end
        if v8.rematch ~= nil and v8.rematch.closed == nil then
            ClientEvents_upv_1.declineRematch:fire(v8.matchId)
        end
        sessionIntents_upv_1.exitToHub:Fire()
        if sessionAtom_upv_1() == nil then
            a1:clearMatch()
        end
    else
        return nil
    end
end
u1.requestRematch = function(a1)
    --[[
      name: requestRematch
      line: 152
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionIntents_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        ClientEvents_upv_1 (copy, index: 4)
    ]]
    local u2 = matchAtom_upv_1()
    if u2 ~= nil and u2.phase == "ended" then
        local rematch_upv_1
        if u2.bot == nil then
            rematch_upv_1 = u2.rematch
            if rematch_upv_1 ~= nil and rematch_upv_1.closed == nil and not (rematch_upv_1.mine) then
                ClientEvents_upv_1.acceptRematch:fire(u2.matchId)
                matchAtom_upv_1(
                    function(a2)
                        --[[
                          line: 178
                          upvalues:
                            u2 (copy, index: 1)
                            rematch_upv_1 (copy, index: 2)
                        ]]
                        if a2 ~= nil and a2.matchId == u2.matchId then
                            local v9 = table.clone(a2)
                            setmetatable(v9, nil)
                            local v10 = table.clone(rematch_upv_1)
                            setmetatable(v10, nil)
                            v10.mine = true
                            v9.rematch = v10
                            return v9
                        end
                        return a2
                    end
                )
                return
            end
        else
            local gameId_upv_1 = u2.gameId
            local bot_upv_1 = u2.bot
            sessionIntents_upv_1.exitToHub:Fire()
            if sessionAtom_upv_1() == nil then
                a1:clearMatch()
                task.spawn(
                    function()
                        --[[
                          line: 166
                          upvalues:
                            a1 (copy, index: 1)
                            gameId_upv_1 (copy, index: 2)
                            bot_upv_1 (copy, index: 3)
                        ]]
                        return a1:startBotDuel(gameId_upv_1, bot_upv_1.difficulty)
                    end
                )
            end
        end
        return nil
    end
    return nil
end
u1.refreshSpectateTarget = function(a1)
    --[[
      name: refreshSpectateTarget
      line: 195
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        Players_upv_1 (copy, index: 3)
        spectateTargetAtom_upv_1 (copy, index: 4)
        liveOpponents_upv_1 (copy, index: 5)
    ]]
    local v11 = matchAtom_upv_1()
    local v12 = sessionAtom_upv_1()
    local UserId_1 = Players_upv_1.LocalPlayer.UserId
    local v13
    local v16 = nil
    if v11 == nil then
        v13 = v11
    else
        v16 = nil
        for _, value_1 in v11.standings do
            if value_1.userId == UserId_1 == true then
                v16 = value_1
                break
            end
        end
        v13 = v16
    end
    local v15 = false
    if v13 ~= nil then
        v15 = not v13.alive
    end
    local v18 = nil
    if not (v15) then
        if v12 == nil then
            v16 = v12
        else
            v16 = v12.mode
        end
        if v16 == "match" then
            v16 = true
        else
            v16 = false
        end
        if v16 then
            v18 = true
            if v12.phase ~= "dying" then
                v18 = v12.phase == "gameOver"
            end
            v16 = v18
        end
        v15 = v16
    end
    if v11 == nil then
        v16 = v11
    else
        v16 = v11.phase
    end
    if v16 == "live" then
        v18 = true
    else
        v18 = false
    end
    if v18 then
        local v19 = false
        if v11.timeUpAt == nil then
            v19 = v15
        end
        v18 = v19
    end
    if v18 then
        local v20 = liveOpponents_upv_1(matchAtom_upv_1(), Players_upv_1.LocalPlayer.UserId)
        local v21 = spectateTargetAtom_upv_1()
        local v22 = v21 ~= nil
        if v22 then
            local u3 = false
            for _, value_2 in v20 do
                if value_2.userId == v21 then
                    u3 = true
                    break
                end
            end
            v22 = u3
        end
        local v23 = nil
        if v22 then
            return nil
        else
            local u3 = nil
            for _, value_3 in v20 do
                if u3 == nil or u3.score < value_3.score then
                    u3 = value_3
                end
            end
            v23 = u3
            if v23 ~= nil then
                v23 = v23.userId
            end
            if v23 ~= v21 then
                spectateTargetAtom_upv_1(
                    function()
                        --[[
                          line: 282
                          upvalues:
                            u3 (ref, index: 1)
                        ]]
                        local v24 = u3
                        if v24 ~= nil then
                            v24 = v24.userId
                        end
                        return v24
                    end
                )
            end
        end
    else
        if spectateTargetAtom_upv_1() ~= nil then
            spectateTargetAtom_upv_1(
                function()
                    --[[
                      line: 244
                    ]]
                    return nil
                end
            )
        end
        return nil
    end
end
u1.cycleSpectate = function(a1)
    --[[
      name: cycleSpectate
      line: 291
      upvalues:
        liveOpponents_upv_1 (copy, index: 1)
        matchAtom_upv_1 (copy, index: 2)
        Players_upv_1 (copy, index: 3)
        spectateTargetAtom_upv_1 (copy, index: 4)
    ]]
    local v25 = liveOpponents_upv_1(matchAtom_upv_1(), Players_upv_1.LocalPlayer.UserId)
    local u4
    if #v25 >= 2 then
        local v26 = spectateTargetAtom_upv_1()
        local v27 = -1
        for key_1, value_4 in v25 do
            if value_4.userId == v26 == true then
                v27 = key_1 - 1
                break
            end
        end
        u4 = v25[((v27 + 1) % #v25) + 1]
        if u4 ~= nil then
            spectateTargetAtom_upv_1(
                function()
                    --[[
                      line: 313
                      upvalues:
                        u4 (copy, index: 1)
                    ]]
                    return u4.userId
                end
            )
        end
    else
        return nil
    end
end
u1.startBotDuel = function(a1, a2, a3)
    --[[
      name: startBotDuel
      line: 318
      upvalues:
        isMatchGame_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        matchAtom_upv_1 (copy, index: 3)
        BOT_PROFILES_upv_1 (copy, index: 4)
        Players_upv_1 (copy, index: 5)
        HttpService_upv_1 (copy, index: 6)
        ClientFunctions_upv_1 (copy, index: 7)
        opponentSnapshotsAtom_upv_1 (copy, index: 8)
        createBotDriver_upv_1 (copy, index: 9)
        pushToast_upv_1 (copy, index: 10)
        sessionIntents_upv_1 (copy, index: 11)
    ]]
    if isMatchGame_upv_1(a2) and sessionAtom_upv_1() == nil then
        local u5
        if matchAtom_upv_1() == nil then
            local u6 = BOT_PROFILES_upv_1[a3]
            local LocalPlayer_upv_1 = Players_upv_1.LocalPlayer
            local u7 = ("bot:%*"):format(HttpService_upv_1:GenerateGUID(false))
            local v28 = ClientFunctions_upv_1.requestBotPersona:invoke()
            matchAtom_upv_1(
                function()
                    --[[
                      line: 334
                      upvalues:
                        a2 (copy, index: 1)
                        u7 (copy, index: 2)
                        a3 (copy, index: 3)
                        LocalPlayer_upv_1 (copy, index: 4)
                        u6 (copy, index: 5)
                    ]]
                    local tbl_3 = {}
                    tbl_3.gameId = a2
                    tbl_3.matchId = u7
                    tbl_3.bot = {difficulty = a3}
                    tbl_3.participants = {{userId = LocalPlayer_upv_1.UserId, username = LocalPlayer_upv_1.DisplayName}, {userId = u6.userId, username = u6.username}}
                    tbl_3.standings = {{userId = LocalPlayer_upv_1.UserId, username = LocalPlayer_upv_1.DisplayName}, {userId = u6.userId, username = u6.username}}
                    return tbl_3
                end
            )
            opponentSnapshotsAtom_upv_1(
                function()
                    --[[
                      line: 365
                    ]]
                    return {}
                end
            )
            u5 = a1.session:launchBotMatch(a2)
            local v29 = nil
            if u5 ~= nil then
                v29 = createBotDriver_upv_1(a2, u5.seed, a3)
                local v30 = nil
                if v29 ~= nil then
                    a1.botDriver = v29
                    local _
                    v30, _ = v28:timeout(4):await()
                    local u8
                    u8 = (v30) or nil
                    local u9
                    if u8 == nil then
                        u9 = u6.username
                    else
                        u9 = ("%* \194\183 %*"):format(u8.username, string.upper(a3))
                    end
                    matchAtom_upv_1(
                        function(a4)
                            --[[
                              line: 387
                              upvalues:
                                u7 (copy, index: 1)
                                u5 (copy, index: 2)
                                a3 (copy, index: 3)
                                u8 (copy, index: 4)
                                u6 (copy, index: 5)
                                u9 (copy, index: 6)
                            ]]
                            if a4 ~= nil and a4.matchId == u7 then
                                local v31 = table.clone(a4)
                                setmetatable(v31, nil)
                                v31.runId = u5.runId
                                v31.seed = u5.seed
                                v31.bot = {difficulty = a3, persona = u8}
                                local participants_1 = a4.participants
                                local v32 = table.create(#participants_1)
                                local v33 = nil
                                for key_2, value_5 in participants_1 do
                                    if value_5.userId ~= u6.userId then
                                        v33 = value_5
                                    else
                                        local v34 = table.clone(value_5)
                                        setmetatable(v34, nil)
                                        v34.username = u9
                                        v33 = v34
                                    end
                                    v32[key_2] = v33
                                end
                                v31.participants = v32
                                local standings_1 = a4.standings
                                local v35 = table.create(#standings_1)
                                local v36 = nil
                                for _, value_6 in standings_1 do
                                    if value_6.userId ~= u6.userId then
                                        v36 = value_6
                                    else
                                        local v37 = table.clone(value_6)
                                        setmetatable(v37, nil)
                                        v37.username = u9
                                        v36 = v37
                                    end
                                    v35[v33] = v36
                                end
                                v31.standings = v35
                                return v31
                            end
                            return a4
                        end
                    )
                    a1:beginBotCountdown(u7)
                else
                    pushToast_upv_1("No bot available for this game yet.", "error")
                    sessionIntents_upv_1.exitToHub:Fire()
                    a1:clearMatch()
                    return nil
                end
            else
                a1:clearMatch()
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u1.beginBotCountdown = function(a1, a2)
    --[[
      name: beginBotCountdown
      line: 446
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        MATCH_COUNTDOWN_SECONDS_upv_1 (copy, index: 2)
        BOT_PROFILES_upv_1 (copy, index: 3)
        opponentSnapshotsAtom_upv_1 (copy, index: 4)
        setTimeout_upv_1 (copy, index: 5)
        Workspace_upv_1 (copy, index: 6)
        MATCH_TIME_CAP_SECONDS_upv_1 (copy, index: 7)
        setInterval_upv_1 (copy, index: 8)
        MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1 (copy, index: 9)
    ]]
    local u10 = matchAtom_upv_1()
    if u10 ~= nil then
        local botDriver_upv_1, cancelCountdown_upv_1
        if u10.matchId == a2 then
            matchAtom_upv_1(
                function()
                    --[[
                      line: 451
                      upvalues:
                        u10 (copy, index: 1)
                        MATCH_COUNTDOWN_SECONDS_upv_1 (copy, index: 2)
                    ]]
                    local v38 = table.clone(u10)
                    setmetatable(v38, nil)
                    v38.phase = "countdown"
                    v38.countdownEndsAt = os.clock() + MATCH_COUNTDOWN_SECONDS_upv_1
                    return v38
                end
            )
            botDriver_upv_1 = a1.botDriver
            if botDriver_upv_1 ~= nil and u10.bot ~= nil then
                cancelCountdown_upv_1 = tostring(BOT_PROFILES_upv_1[u10.bot.difficulty].userId)
                opponentSnapshotsAtom_upv_1(
                    function(a3)
                        --[[
                          line: 463
                          upvalues:
                            cancelCountdown_upv_1 (copy, index: 1)
                            botDriver_upv_1 (copy, index: 2)
                        ]]
                        local v39 = table.clone(a3)
                        setmetatable(v39, nil)
                        v39[cancelCountdown_upv_1] = botDriver_upv_1:snapshot()
                        return v39
                    end
                )
            end
            cancelCountdown_upv_1 = a1.cancelCountdown
            if cancelCountdown_upv_1 ~= nil then
                cancelCountdown_upv_1()
            end
            a1.cancelCountdown = setTimeout_upv_1(
                function()
                    --[[
                      line: 474
                      upvalues:
                        a1 (copy, index: 1)
                        matchAtom_upv_1 (copy, index: 2)
                        a2 (copy, index: 3)
                        Workspace_upv_1 (copy, index: 4)
                        MATCH_TIME_CAP_SECONDS_upv_1 (copy, index: 5)
                        setInterval_upv_1 (copy, index: 6)
                        MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1 (copy, index: 7)
                        setTimeout_upv_1 (copy, index: 8)
                    ]]
                    a1.cancelCountdown = nil
                    local u11 = matchAtom_upv_1()
                    if u11 ~= nil and u11.matchId == a2 and u11.phase == "countdown" then
                        matchAtom_upv_1(
                            function()
                                --[[
                                  line: 480
                                  upvalues:
                                    u11 (copy, index: 1)
                                    Workspace_upv_1 (copy, index: 2)
                                    MATCH_TIME_CAP_SECONDS_upv_1 (copy, index: 3)
                                ]]
                                local v40 = table.clone(u11)
                                setmetatable(v40, nil)
                                v40.phase = "live"
                                v40.countdownEndsAt = nil
                                v40.capEndsAtServerTime = Workspace_upv_1:GetServerTimeNow() + MATCH_TIME_CAP_SECONDS_upv_1
                                return v40
                            end
                        )
                        a1.session:beginMatchPlay()
                        a1.botDuelLastScore = 0
                        a1.botDuelProgressAt = os.clock()
                        a1.cancelBotPump = setInterval_upv_1(
                            function()
                                --[[
                                  line: 491
                                  upvalues:
                                    a1 (copy, index: 1)
                                ]]
                                return a1:stepBot()
                            end,
                            MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1
                        )
                        a1.cancelBotCap = setTimeout_upv_1(
                            function()
                                --[[
                                  line: 494
                                  upvalues:
                                    a1 (copy, index: 1)
                                    a2 (copy, index: 2)
                                ]]
                                return a1:onBotTimeUp(a2)
                            end,
                            MATCH_TIME_CAP_SECONDS_upv_1
                        )
                        return
                    end
                    return nil
                end,
                MATCH_COUNTDOWN_SECONDS_upv_1
            )
            return
        end
    end
    return nil
end
u1.stepBot = function(a1)
    --[[
      name: stepBot
      line: 499
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1 (copy, index: 2)
        BOT_PROFILES_upv_1 (copy, index: 3)
        opponentSnapshotsAtom_upv_1 (copy, index: 4)
        sessionAtom_upv_1 (copy, index: 5)
        Players_upv_1 (copy, index: 6)
    ]]
    local botDriver_upv_2 = a1.botDriver
    local u12 = matchAtom_upv_1()
    if botDriver_upv_2 ~= nil and u12 ~= nil and u12.bot ~= nil then
        local v41 = nil
        if u12.phase == "live" then
            botDriver_upv_2:step(MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1)
            local userId_upv_1 = BOT_PROFILES_upv_1[u12.bot.difficulty].userId
            local str_upv_1 = tostring(userId_upv_1)
            opponentSnapshotsAtom_upv_1(
                function(a2)
                    --[[
                      line: 508
                      upvalues:
                        str_upv_1 (copy, index: 1)
                        botDriver_upv_2 (copy, index: 2)
                    ]]
                    local v42 = table.clone(a2)
                    setmetatable(v42, nil)
                    v42[str_upv_1] = botDriver_upv_2:snapshot()
                    return v42
                end
            )
            local u13 = botDriver_upv_2:isDead()
            v41 = sessionAtom_upv_1()
            local u14 = false
            if v41 ~= nil then
                u14 = v41.phase == "playing"
            end
            local v43
            if v41 == nil then
                v43 = v41
            else
                v43 = v41.score
            end
            local v44
            if v43 ~= nil then
                v44 = v43
            else
                v44 = 0
            end
            local u15 = v44
            local UserId_upv_2 = Players_upv_1.LocalPlayer.UserId
            matchAtom_upv_1(
                function(a3)
                    --[[
                      line: 529
                      upvalues:
                        u12 (copy, index: 1)
                        userId_upv_1 (copy, index: 2)
                        botDriver_upv_2 (copy, index: 3)
                        u13 (copy, index: 4)
                        UserId_upv_2 (copy, index: 5)
                        u15 (copy, index: 6)
                        u14 (copy, index: 7)
                    ]]
                    if a3 ~= nil and a3.matchId == u12.matchId then
                        local standings_2 = a3.standings
                        local v45 = table.create(#standings_2)
                        local function v46(a4)
                            --[[
                              line: 536
                              upvalues:
                                userId_upv_1 (copy, index: 1)
                                botDriver_upv_2 (copy, index: 2)
                                u13 (copy, index: 3)
                                UserId_upv_2 (copy, index: 4)
                                u15 (copy, index: 5)
                                u14 (copy, index: 6)
                            ]]
                            if a4.userId ~= userId_upv_1 then
                                local v47
                                if a4.userId ~= UserId_upv_2 then
                                    v47 = a4
                                else
                                    local v48 = table.clone(a4)
                                    setmetatable(v48, nil)
                                    v48.score = u15
                                    v48.alive = u14
                                    v47 = v48
                                end
                                return v47
                            else
                                local v49 = table.clone(a4)
                                setmetatable(v49, nil)
                                v49.score = botDriver_upv_2:score()
                                v49.alive = not u13
                                return v49
                            end
                        end
                        for key_3, value_7 in standings_2 do
                            v45[key_3] = v46(value_7, key_3 - 1, standings_2)
                        end
                        local v50 = table.clone(a3)
                        setmetatable(v50, nil)
                        v50.standings = v45
                        return v50
                    end
                    return a3
                end
            )
            a1:trackBotDuelStall(u14, u15, u12.matchId)
            a1:refereeBotDuel()
            a1:refreshSpectateTarget()
            return
        end
    end
    return nil
end
u1.trackBotDuelStall = function(a1, a2, a3, a4)
    --[[
      name: trackBotDuelStall
      line: 575
      upvalues:
        MATCH_STALL_SECONDS_upv_1 (copy, index: 1)
        matchAtom_upv_1 (copy, index: 2)
        pushToast_upv_1 (copy, index: 3)
    ]]
    if a2 then
        if a1.botDuelLastScore >= a3 then
            local u16
            if os.clock() - a1.botDuelProgressAt >= MATCH_STALL_SECONDS_upv_1 then
                u16 = matchAtom_upv_1()
                if u16 ~= nil and u16.matchId == a4 and u16.phase == "live" then
                    matchAtom_upv_1(
                        function()
                            --[[
                              line: 591
                              upvalues:
                                u16 (copy, index: 1)
                            ]]
                            local v51 = table.clone(u16)
                            setmetatable(v51, nil)
                            v51.eliminatedReason = "stalled"
                            return v51
                        end
                    )
                    a1.session:forceEndMatchRun()
                    pushToast_upv_1(("Eliminated \226\128\148 no score progress for %* seconds."):format(MATCH_STALL_SECONDS_upv_1), "error")
                    return
                end
            end
        else
            a1.botDuelLastScore = a3
            a1.botDuelProgressAt = os.clock()
        end
    end
    return nil
end
u1.onBotTimeUp = function(a1, a2)
    --[[
      name: onBotTimeUp
      line: 600
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        setTimeout_upv_1 (copy, index: 3)
    ]]
    local u17 = matchAtom_upv_1()
    if u17 ~= nil and u17.matchId == a2 and u17.bot ~= nil then
        local v52, v53 = nil, nil
        if u17.phase == "live" then
            v52 = a1.cancelBotPump
            if v52 ~= nil then
                v52()
            end
            a1.cancelBotPump = nil
            v53 = sessionAtom_upv_1()
            local u18 = false
            if v53 ~= nil then
                u18 = v53.phase == "playing"
            end
            matchAtom_upv_1(
                function()
                    --[[
                      line: 615
                      upvalues:
                        u17 (copy, index: 1)
                    ]]
                    local v54 = table.clone(u17)
                    setmetatable(v54, nil)
                    v54.timeUpAt = os.clock()
                    return v54
                end
            )
            a1.session:forceEndMatchRun()
            a1:refreshSpectateTarget()
            a1.cancelBotSettle = setTimeout_upv_1(
                function()
                    --[[
                      line: 626
                      upvalues:
                        a1 (copy, index: 1)
                        u18 (copy, index: 2)
                    ]]
                    a1.cancelBotSettle = nil
                    a1:endBotMatch({playerAliveAtWhistle = u18})
                end,
                1.2
            )
            return
        end
    end
    return nil
end
u1.refereeBotDuel = function(a1)
    --[[
      name: refereeBotDuel
      line: 634
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
    ]]
    local botDriver_3 = a1.botDriver
    local v55 = matchAtom_upv_1()
    if botDriver_3 ~= nil and v55 ~= nil and v55.bot ~= nil then
        local v56 = nil
        if v55.phase == "live" then
            v56 = sessionAtom_upv_1()
            local v57 = false
            if v56 ~= nil then
                v57 = true
                if v56.phase ~= "playing" then
                    v57 = v56.phase == "ready"
                end
            end
            local v58
            if v56 == nil then
                v58 = v56
            else
                v58 = v56.score
            end
            local v59
            if v58 ~= nil then
                v59 = v58
            else
                v59 = 0
            end
            local v60 = botDriver_3:isDead()
            if v57 and not (v60) then
                return nil
            end
            if v57 and v60 then
                if botDriver_3:score() < v59 then
                    a1:endBotMatch()
                end
                return nil
            end
            if not (v57) and not (v60) then
                if v59 < botDriver_3:score() then
                    a1:endBotMatch()
                end
                return nil
            end
            a1:endBotMatch()
            return
        end
    end
    return nil
end
u1.endBotMatch = function(a1, a2)
    --[[
      name: endBotMatch
      line: 671
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        Players_upv_1 (copy, index: 3)
        BOT_PROFILES_upv_1 (copy, index: 4)
    ]]
    local u19 = matchAtom_upv_1()
    if u19 ~= nil and u19.bot ~= nil then
        local v61, v62, v63, v64, u20 = nil, nil, nil, nil, nil
        if u19.phase == "live" then
            v61 = a1.cancelBotPump
            if v61 ~= nil then
                v61()
            end
            a1.cancelBotPump = nil
            v62 = a1.cancelBotCap
            if v62 ~= nil then
                v62()
            end
            a1.cancelBotCap = nil
            v63 = a1.cancelBotSettle
            if v63 ~= nil then
                v63()
            end
            a1.cancelBotSettle = nil
            local botDriver_4 = a1.botDriver
            local u21 = sessionAtom_upv_1()
            local LocalPlayer_2 = Players_upv_1.LocalPlayer
            local v65 = BOT_PROFILES_upv_1[u19.bot.difficulty]
            v64 = u21
            if v64 ~= nil then
                v64 = v64.score
            end
            local v66
            if v64 ~= nil then
                v66 = v64
            else
                v66 = 0
            end
            local v67
            if botDriver_4 == nil then
                v67 = botDriver_4
            else
                v67 = botDriver_4:score()
            end
            local v68
            if v67 ~= nil then
                v68 = v67
            else
                v68 = 0
            end
            local v69
            if a2 == nil then
                v69 = a2
            else
                v69 = a2.endReason
            end
            u20 = v69
            if u20 == nil then
                u20 = "elimination"
            end
            local v70 = v68 <= v66
            local tbl_4 = {}
            tbl_4.userId = LocalPlayer_2.UserId
            tbl_4.username = LocalPlayer_2.DisplayName
            local v71
            if a2 == nil then
                v71 = a2
            else
                v71 = a2.playerAliveAtWhistle
            end
            local v72
            if v71 ~= nil then
                v72 = v71
            else
                local v73 = false
                if u21 ~= nil then
                    v73 = u21.phase == "playing"
                end
                v72 = v73
            end
            tbl_4.alive = v72
            tbl_4.score = v66
            tbl_4.placement = (v70 and 1) or 2
            local tbl_5 = {}
            tbl_5.userId = v65.userId
            tbl_5.username = v65.username
            local u22 = false
            if botDriver_4 ~= nil then
                u22 = not botDriver_4:isDead()
            end
            tbl_5.alive = u22
            tbl_5.score = v68
            tbl_5.placement = (v70 and 2) or 1
            u22 = (v70 and {tbl_4, tbl_5}) or {tbl_5, tbl_4}
            matchAtom_upv_1(
                function()
                    --[[
                      line: 750
                      upvalues:
                        u19 (copy, index: 1)
                        u22 (copy, index: 2)
                        u21 (copy, index: 3)
                        u20 (copy, index: 4)
                    ]]
                    local v74 = table.clone(u19)
                    setmetatable(v74, nil)
                    v74.phase = "ended"
                    v74.standings = u22
                    v74.countdownEndsAt = nil
                    local tbl_6 = {}
                    tbl_6.matchId = u19.matchId
                    tbl_6.gameId = u19.gameId
                    tbl_6.standings = u22
                    local v75 = u21
                    local v76 = nil
                    if v75 ~= nil then
                        v76 = v75.lastResult
                        if v76 == nil then
                            v75 = v76
                        else
                            v75 = v76.coinsEarned
                        end
                    end
                    local v77
                    if v75 ~= nil then
                        v77 = v75
                    else
                        v77 = 0
                    end
                    tbl_6.coinsEarned = v77
                    tbl_6.endReason = u20
                    v74.results = tbl_6
                    return v74
                end
            )
            a1.botDriver = nil
            a1.session:forceEndMatchRun()
            a1:refreshSpectateTarget()
            if v70 then
                a1.audio:play("newBestFanfare", {})
            else
                a1.audio:play("gameOverSting", {})
            end
            return
        end
    end
    return nil
end
u1.onAssigned = function(a1, a2)
    --[[
      name: onAssigned
      line: 794
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        sessionIntents_upv_1 (copy, index: 3)
        opponentSnapshotsAtom_upv_1 (copy, index: 4)
    ]]
    local v78 = matchAtom_upv_1()
    local v79
    if v78 == nil then
        v79 = v78
    else
        v79 = v78.phase
    end
    local v80
    if v79 == "ended" then
        v80 = true
    else
        v80 = false
    end
    local v81 = nil
    if v80 then
        v81 = v78.rematch
        if v81 ~= nil then
            v81 = v81.mine
        end
        if v81 == true then
            v80 = true
        else
            v80 = false
        end
        if v80 then
            v80 = sessionAtom_upv_1() ~= nil
        end
    end
    if v80 then
        sessionIntents_upv_1.exitToHub:Fire()
    end
    if sessionAtom_upv_1() == nil then
        matchAtom_upv_1(
            function()
                --[[
                  line: 825
                  upvalues:
                    a2 (copy, index: 1)
                ]]
                local tbl_7 = {}
                tbl_7.mode = a2.mode
                tbl_7.gameId = a2.gameId
                tbl_7.matchId = a2.matchId
                tbl_7.runId = a2.runId
                tbl_7.seed = a2.seed
                tbl_7.participants = a2.participants
                local participants_2 = a2.participants
                local v82 = table.create(#participants_2)
                for key_4, value_8 in participants_2 do
                    v82[key_4] = {userId = value_8.userId, username = value_8.username}
                end
                tbl_7.standings = v82
                return tbl_7
            end
        )
        opponentSnapshotsAtom_upv_1(
            function()
                --[[
                  line: 854
                ]]
                return {}
            end
        )
        a1.session:launchMatch(a2)
    else
        matchAtom_upv_1(
            function()
                --[[
                  line: 820
                ]]
                return nil
            end
        )
        return nil
    end
end
u1.onGo = function(a1, a2, a3, a4, a5)
    --[[
      name: onGo
      line: 859
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
        Workspace_upv_1 (copy, index: 4)
        setTimeout_upv_1 (copy, index: 5)
    ]]
    local u23 = matchAtom_upv_1()
    if u23 ~= nil and u23.matchId == a2 then
        local v83 = nil
        if u23.phase == "loading" then
            v83 = sessionAtom_upv_1()
            if v83 ~= nil then
                local v84 = nil
                if v83.mode == "match" then
                    local u24 = math.clamp(a4 - Workspace_upv_1:GetServerTimeNow(), 0, a3)
                    matchAtom_upv_1(
                        function()
                            --[[
                              line: 879
                              upvalues:
                                u23 (copy, index: 1)
                                u24 (copy, index: 2)
                                a5 (copy, index: 3)
                            ]]
                            local v85 = table.clone(u23)
                            setmetatable(v85, nil)
                            v85.phase = "countdown"
                            v85.countdownEndsAt = os.clock() + u24
                            v85.capEndsAtServerTime = a5
                            return v85
                        end
                    )
                    v84 = a1.cancelCountdown
                    if v84 ~= nil then
                        v84()
                    end
                    a1.cancelCountdown = setTimeout_upv_1(
                        function()
                            --[[
                              line: 891
                              upvalues:
                                a1 (copy, index: 1)
                                matchAtom_upv_1 (copy, index: 2)
                                a2 (copy, index: 3)
                            ]]
                            a1.cancelCountdown = nil
                            local u25 = matchAtom_upv_1()
                            if u25 ~= nil and u25.matchId == a2 and u25.phase == "countdown" then
                                matchAtom_upv_1(
                                    function()
                                        --[[
                                          line: 897
                                          upvalues:
                                            u25 (copy, index: 1)
                                        ]]
                                        local v86 = table.clone(u25)
                                        setmetatable(v86, nil)
                                        v86.phase = "live"
                                        v86.countdownEndsAt = nil
                                        return v86
                                    end
                                )
                                a1.session:beginMatchPlay()
                                return
                            end
                            return nil
                        end,
                        u24
                    )
                    return
                end
            end
            if u23.runId ~= "" then
                ClientEvents_upv_1.abandonRun:fire(u23.runId)
            end
            a1:clearMatch()
            return nil
        end
    end
    return nil
end
u1.onStandings = function(a1, a2, a3)
    --[[
      name: onStandings
      line: 907
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
    ]]
    local u26 = matchAtom_upv_1()
    if u26 ~= nil and u26.matchId == a2 then
        matchAtom_upv_1(
            function()
                --[[
                  line: 912
                  upvalues:
                    u26 (copy, index: 1)
                    a3 (copy, index: 2)
                ]]
                local v87 = table.clone(u26)
                setmetatable(v87, nil)
                v87.standings = a3
                return v87
            end
        )
        a1:refreshSpectateTarget()
    else
        return nil
    end
end
u1.onTimeUp = function(a1, a2)
    --[[
      name: onTimeUp
      line: 920
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
    ]]
    local u27 = matchAtom_upv_1()
    if u27 ~= nil and u27.matchId == a2 and u27.phase == "live" and u27.bot == nil then
        matchAtom_upv_1(
            function()
                --[[
                  line: 926
                  upvalues:
                    u27 (copy, index: 1)
                ]]
                local v88 = table.clone(u27)
                setmetatable(v88, nil)
                v88.timeUpAt = os.clock()
                return v88
            end
        )
        a1.session:forceEndMatchRun()
        a1:refreshSpectateTarget()
        return
    end
    return nil
end
u1.onEliminated = function(a1, a2, a3)
    --[[
      name: onEliminated
      line: 936
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        MATCH_STALL_SECONDS_upv_1 (copy, index: 3)
    ]]
    local u28 = matchAtom_upv_1()
    if u28 ~= nil and u28.matchId == a2 and u28.phase == "live" and u28.bot == nil then
        matchAtom_upv_1(
            function()
                --[[
                  line: 941
                  upvalues:
                    u28 (copy, index: 1)
                    a3 (copy, index: 2)
                ]]
                local v89 = table.clone(u28)
                setmetatable(v89, nil)
                v89.eliminatedReason = a3
                return v89
            end
        )
        a1.session:forceEndMatchRun()
        pushToast_upv_1(("Eliminated \226\128\148 no score progress for %* seconds."):format(MATCH_STALL_SECONDS_upv_1), "error")
        return
    end
    return nil
end
u1.onCancelled = function(a1, a2, a3)
    --[[
      name: onCancelled
      line: 950
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        sessionIntents_upv_1 (copy, index: 4)
    ]]
    local v90 = matchAtom_upv_1()
    if v90 ~= nil then
        local v91 = nil
        if v90.matchId == a2 then
            pushToast_upv_1(((a3 ~= "loadTimeout") and "Not enough players \226\128\148 match cancelled.") or "Match start timed out.", "error")
            v91 = sessionAtom_upv_1()
            if v91 ~= nil then
                v91 = v91.mode
            end
            if v91 == "match" then
                sessionIntents_upv_1.exitToHub:Fire()
            end
            a1:clearMatch()
            return
        end
    end
    return nil
end
u1.onEnded = function(a1, a2)
    --[[
      name: onEnded
      line: 965
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
    ]]
    local u29 = matchAtom_upv_1()
    if u29 ~= nil then
        local v92, v93 = nil, nil
        if u29.matchId == a2.matchId then
            v92 = a1.cancelCountdown
            if v92 ~= nil then
                v92()
            end
            a1.cancelCountdown = nil
            matchAtom_upv_1(
                function()
                    --[[
                      line: 977
                      upvalues:
                        u29 (copy, index: 1)
                        a2 (copy, index: 2)
                    ]]
                    local v94 = table.clone(u29)
                    setmetatable(v94, nil)
                    v94.phase = "ended"
                    v94.standings = a2.standings
                    v94.results = a2
                    v94.countdownEndsAt = nil
                    return v94
                end
            )
            a1.session:forceEndMatchRun()
            a1:refreshSpectateTarget()
            v93 = a2.standings[1]
            if v93 ~= nil then
                v93 = v93.userId
            end
            local v95
            if v93 == Players_upv_1.LocalPlayer.UserId then
                v95 = true
            else
                v95 = false
            end
            if v95 then
                a1.audio:play("newBestFanfare", {})
            else
                a1.audio:play("gameOverSting", {})
            end
            return
        end
    end
    return nil
end
u1.onRematchOffered = function(a1, a2, a3, a4, a5)
    --[[
      name: onRematchOffered
      line: 1004
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
    ]]
    matchAtom_upv_1(
        function(a6)
            --[[
              line: 1005
              upvalues:
                a2 (copy, index: 1)
                a3 (copy, index: 2)
                a4 (copy, index: 3)
                a5 (copy, index: 4)
            ]]
            if a6 ~= nil then
                local v96 = nil
                if a6.matchId == a2 then
                    local v97 = table.clone(a6)
                    setmetatable(v97, nil)
                    local tbl_8 = {}
                    tbl_8.accepted = a3
                    tbl_8.total = a4
                    tbl_8.endsAtServerTime = a5
                    v96 = a6.rematch
                    if v96 ~= nil then
                        v96 = v96.mine
                    end
                    local v98
                    if v96 ~= nil then
                        v98 = v96
                    else
                        v98 = false
                    end
                    tbl_8.mine = v98
                    v97.rematch = tbl_8
                    return v97
                end
            end
            return a6
        end
    )
end
u1.onRematchClosed = function(a1, a2, a3)
    --[[
      name: onRematchClosed
      line: 1031
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
    ]]
    matchAtom_upv_1(
        function(a4)
            --[[
              line: 1032
              upvalues:
                a2 (copy, index: 1)
                a3 (copy, index: 2)
            ]]
            if a4 ~= nil and a4.matchId == a2 and a4.rematch ~= nil then
                local v99 = table.clone(a4)
                setmetatable(v99, nil)
                local v100 = table.clone(a4.rematch)
                setmetatable(v100, nil)
                v100.closed = a3
                v99.rematch = v100
                return v99
            end
            return a4
        end
    )
end
u1.onOpponentSnapshots = function(a1, a2, a3)
    --[[
      name: onOpponentSnapshots
      line: 1046
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        opponentSnapshotsAtom_upv_1 (copy, index: 2)
    ]]
    local v101 = matchAtom_upv_1()
    if v101 ~= nil and v101.matchId == a2 then
        if v101.phase ~= "live" and v101.phase ~= "countdown" then
            return nil
        end
        opponentSnapshotsAtom_upv_1(
            function(a4)
                --[[
                  line: 1054
                  upvalues:
                    a3 (copy, index: 1)
                ]]
                local v102 = table.clone(a4)
                setmetatable(v102, nil)
                for _, value_9 in a3 do
                    v102[tostring(value_9.userId)] = value_9.snapshot
                end
                return v102
            end
        )
        return
    end
    return nil
end
u1.clearMatch = function(a1)
    --[[
      name: clearMatch
      line: 1064
      upvalues:
        matchAtom_upv_1 (copy, index: 1)
        opponentSnapshotsAtom_upv_1 (copy, index: 2)
        spectateTargetAtom_upv_1 (copy, index: 3)
    ]]
    local cancelCountdown_2 = a1.cancelCountdown
    if cancelCountdown_2 ~= nil then
        cancelCountdown_2()
    end
    a1.cancelCountdown = nil
    local cancelBotPump_1 = a1.cancelBotPump
    if cancelBotPump_1 ~= nil then
        cancelBotPump_1()
    end
    a1.cancelBotPump = nil
    local cancelBotCap_1 = a1.cancelBotCap
    if cancelBotCap_1 ~= nil then
        cancelBotCap_1()
    end
    a1.cancelBotCap = nil
    local cancelBotSettle_1 = a1.cancelBotSettle
    if cancelBotSettle_1 ~= nil then
        cancelBotSettle_1()
    end
    a1.cancelBotSettle = nil
    a1.botDriver = nil
    matchAtom_upv_1(
        function()
            --[[
              line: 1086
            ]]
            return nil
        end
    )
    opponentSnapshotsAtom_upv_1(
        function()
            --[[
              line: 1089
            ]]
            return {}
        end
    )
    spectateTargetAtom_upv_1(
        function()
            --[[
              line: 1092
            ]]
            return nil
        end
    )
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/match-controller@MatchController")
Reflect_1.defineMetadata(u1, "flamework:parameters", {"client/controllers/game-session-controller@GameSessionController", "client/controllers/audio-controller@AudioController"})
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_9 = {}
tbl_9.MatchController = u1
return tbl_9