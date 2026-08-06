-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Janitor_upv_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "janitor", "src").Janitor
local v1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local MarketplaceService_upv_1 = v1.MarketplaceService
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local StarterGui_upv_1 = v1.StarterGui
local v2 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out")
local setInterval_upv_1 = v2.setInterval
local setTimeout_upv_1 = v2.setTimeout
local GamepadHintBar_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "games", "common", "gamepad-hint-bar").GamepadHintBar
local hintsFor_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "games", "common", "gamepad-hint-table").hintsFor
local v3 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "games", "game-availability")
local DEVICE_UNAVAILABLE_MESSAGE_upv_1 = v3.DEVICE_UNAVAILABLE_MESSAGE
local isGameAvailableOnDevice_upv_1 = v3.isGameAvailableOnDevice
local GAME_REGISTRY_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "games", "game-registry").GAME_REGISTRY
local RivalFeed_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "games", "rivals", "rival-feed").RivalFeed
local RivalMarkerSystem_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "games", "rivals", "rival-marker-system").RivalMarkerSystem
local v4 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "network")
local ClientEvents_upv_1 = v4.ClientEvents
local ClientFunctions_upv_1 = v4.ClientFunctions
local v5 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "atoms")
local isGameOverInputLocked_upv_1 = v5.isGameOverInputLocked
local sessionAtom_upv_1 = v5.sessionAtom
local readLocalProfile_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "daily-data").readLocalProfile
local v6 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "match-atoms")
local matchAtom_upv_1 = v6.matchAtom
local opponentSnapshotsAtom_upv_1 = v6.opponentSnapshotsAtom
local spectateTargetAtom_upv_1 = v6.spectateTargetAtom
local sessionIntents_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "session-intents").sessionIntents
local v7 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "restart-confirm")
local isRestartConfirmArmed_upv_1 = v7.isRestartConfirmArmed
local isRestartGuarded_upv_1 = v7.isRestartGuarded
local v8 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local clearCombo_upv_1 = v8.clearCombo
local highwaySettingsOpenAtom_upv_1 = v8.highwaySettingsOpenAtom
local pausedAtom_upv_1 = v8.pausedAtom
local pushToast_upv_1 = v8.pushToast
local restartConfirmAtom_upv_1 = v8.restartConfirmAtom
local resumeProbeAtom_upv_1 = v8.resumeProbeAtom
local reviveAdPromptAtom_upv_1 = v8.reviveAdPromptAtom
local settingsOpenAtom_upv_1 = v8.settingsOpenAtom
local settingsPausedGameAtom_upv_1 = v8.settingsPausedGameAtom
local tetrisControlsOpenAtom_upv_1 = v8.tetrisControlsOpenAtom
local v9 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants")
local CHECKPOINT_INTERVAL_SECONDS_upv_1 = v9.CHECKPOINT_INTERVAL_SECONDS
local RESUME_COUNTDOWN_SECONDS_upv_1 = v9.RESUME_COUNTDOWN_SECONDS
local RESUME_STATE_MAX_CHARS_upv_1 = v9.RESUME_STATE_MAX_CHARS
local REVIVE_POPUP_CONTINUE_LOCK_SECONDS_upv_1 = v9.REVIVE_POPUP_CONTINUE_LOCK_SECONDS
local REVIVE_POPUP_TIMEOUT_SECONDS_upv_1 = v9.REVIVE_POPUP_TIMEOUT_SECONDS
local GAME_METADATA_upv_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local v10 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "revive-pricing")
local reviveLadderFor_upv_1 = v10.reviveLadderFor
local reviveTierForProduct_upv_1 = v10.reviveTierForProduct
local v11 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "match-constants")
local duelRect_upv_1 = v11.duelRect
local MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1 = v11.MATCH_SNAPSHOT_INTERVAL_SECONDS
local ROYALE_VIEW_RECT_upv_1 = v11.ROYALE_VIEW_RECT
local v12 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "match-types")
local duelSideFor_upv_1 = v12.duelSideFor
local matchViewMode_upv_1 = v12.matchViewMode
local v13 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "parkable-games")
local isParkable_upv_1 = v13.isParkable
local PARKABLE_GAMES_upv_1 = v13.PARKABLE_GAMES
local v14 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "revive-prompt-experiment")
local isNearBestDeath_upv_1 = v14.isNearBestDeath
local isNearBestPromptForced_upv_1 = v14.isNearBestPromptForced
local revivePromptVariantFor_upv_1 = v14.revivePromptVariantFor
local v15 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms")
local gotdAtom_upv_1 = v15.gotdAtom
local playersAtom_upv_1 = v15.playersAtom
local AdService_upv_1 = game:GetService("AdService")
local function reviveFailureMessage_1(a1, a2)
    --[[
      name: reviveFailureMessage
      line: 110
    ]]
    if a1 ~= nil then
        if a2 ~= "token" then
            if a1 ~= "noSession" then
                if a1 ~= "alreadyUsed" then
                    if a1 ~= "dailyRun" then
                        if a1 ~= "dataNotLoaded" then
                            return "Not enough Revives \226\128\148 nothing was used."
                        end
                        return "Couldn't read your Revives right now \226\128\148 nothing was used."
                    end
                    return "Game of the Day runs can't be revived."
                end
                return "No revives left on this run."
            end
            return "This run has expired \226\128\148 it can't be revived now."
        end
        return "Revive couldn't be applied \226\128\148 it's banked for a future run."
    end
    return "Couldn't reach the server \226\128\148 the run wasn't revived."
end
local function isTerminalReviveRefusal_1(a1)
    --[[
      name: isTerminalReviveRefusal
      line: 143
    ]]
    local v16 = true
    if a1 ~= "noSession" then
        v16 = true
        if a1 ~= "alreadyUsed" then
            v16 = a1 == "dailyRun"
        end
    end
    return v16
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 176
    ]]
    return "GameSessionController"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 181
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v17 = setmetatable({}, u2)
    return v17:constructor(...) or v17
end
u2.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 185
    ]]
    a1.input = a2
    a1.stages = a3
    a1.audio = a4
    a1.rivals = a5
    a1.currentScore = 0
    a1.currentPickups = 0
    a1.currentRunSeed = 0
    a1.launchToken = 0
    a1.rivalMarkersAttached = false
    a1.isRestartPending = false
    a1.demandedOrientation = Enum.ScreenOrientation.Sensor
end
u2.onStart = function(a1)
    --[[
      name: onStart
      line: 198
      upvalues:
        sessionIntents_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
        MarketplaceService_upv_1 (copy, index: 3)
        RunService_upv_1 (copy, index: 4)
    ]]
    a1:applyScreenOrientation(false)
    sessionIntents_upv_1.launchGame:Connect(
        function(a2)
            --[[
              line: 202
              upvalues:
                a1 (copy, index: 1)
            ]]
            return task.spawn(
                function()
                    --[[
                      line: 203
                      upvalues:
                        a1 (copy, index: 1)
                        a2 (copy, index: 2)
                    ]]
                    return a1:launch({gameId = a2})
                end
            )
        end
    )
    sessionIntents_upv_1.launchDaily:Connect(
        function()
            --[[
              line: 210
              upvalues:
                a1 (copy, index: 1)
            ]]
            return task.spawn(
                function()
                    --[[
                      line: 211
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:launchDaily()
                end
            )
        end
    )
    sessionIntents_upv_1.restart:Connect(
        function()
            --[[
              line: 215
              upvalues:
                a1 (copy, index: 1)
            ]]
            return task.spawn(
                function()
                    --[[
                      line: 216
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:restart()
                end
            )
        end
    )
    sessionIntents_upv_1.cancelRestart:Connect(
        function()
            --[[
              line: 220
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:cancelRestartConfirm()
        end
    )
    sessionIntents_upv_1.requestRevive:Connect(
        function()
            --[[
              line: 223
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:requestRevive()
        end
    )
    sessionIntents_upv_1.exitToHub:Connect(
        function()
            --[[
              line: 226
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:exitToHub()
        end
    )
    sessionIntents_upv_1.togglePause:Connect(
        function()
            --[[
              line: 229
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:togglePause()
        end
    )
    sessionIntents_upv_1.reviveAdBuy:Connect(
        function()
            --[[
              line: 232
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:buyFromRevivePopup()
        end
    )
    sessionIntents_upv_1.reviveAdWatch:Connect(
        function()
            --[[
              line: 235
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:watchAdFromRevivePopup()
        end
    )
    sessionIntents_upv_1.reviveAdContinue:Connect(
        function()
            --[[
              line: 238
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:continueFromRevivePopup()
        end
    )
    ClientEvents_upv_1.reviveTokenGranted:connect(
        function(a3)
            --[[
              line: 241
              upvalues:
                a1 (copy, index: 1)
            ]]
            return task.spawn(
                function()
                    --[[
                      line: 242
                      upvalues:
                        a1 (copy, index: 1)
                        a3 (copy, index: 2)
                    ]]
                    return a1:redeemRevive(a3)
                end
            )
        end
    )
    ClientEvents_upv_1.reviveWindowClosed:connect(
        function(a4)
            --[[
              line: 246
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onReviveWindowClosed(a4)
        end
    )
    ClientEvents_upv_1.adReviveFailed:connect(
        function(a5, a6)
            --[[
              line: 249
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onAdReviveFailed(a5, a6)
        end
    )
    ClientEvents_upv_1.runScoringStopped:connect(
        function(a7)
            --[[
              line: 252
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onScoringStopped(a7)
        end
    )
    MarketplaceService_upv_1.PromptProductPurchaseFinished:Connect(
        function(a8, a9, a10)
            --[[
              line: 255
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onPurchaseFinished(a8, a9, a10)
        end
    )
    if RunService_upv_1:IsStudio() then
        a1:warnOnUnholdableParkables()
    end
    task.spawn(
        function()
            --[[
              line: 261
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:tryAutoResume()
        end
    )
end
u2.warnOnUnholdableParkables = function(a1)
    --[[
      name: warnOnUnholdableParkables
      line: 265
      upvalues:
        PARKABLE_GAMES_upv_1 (copy, index: 1)
        GAME_REGISTRY_upv_1 (copy, index: 2)
    ]]
    local v18 = nil
    for key_1 in PARKABLE_GAMES_upv_1 do
        v18 = GAME_REGISTRY_upv_1[key_1]
        if v18 ~= nil then
            v18 = v18.resumeVersion
        end
        if v18 == nil then
            warn((("[GameSessionController] %* is parkable but declares no resumeVersion \226\128\148 it cannot be held"):format(key_1)))
        end
    end
end
u2.tryAutoResume = function(a1)
    --[[
      name: tryAutoResume
      line: 277
      upvalues:
        resumeProbeAtom_upv_1 (copy, index: 1)
        setTimeout_upv_1 (copy, index: 2)
        ClientFunctions_upv_1 (copy, index: 3)
        sessionAtom_upv_1 (copy, index: 4)
        ClientEvents_upv_1 (copy, index: 5)
        GAME_REGISTRY_upv_1 (copy, index: 6)
    ]]
    resumeProbeAtom_upv_1(
        function()
            --[[
              line: 278
            ]]
            return true
        end
    )
    local v19 = setTimeout_upv_1(
        function()
            --[[
              line: 281
              upvalues:
                resumeProbeAtom_upv_1 (copy, index: 1)
            ]]
            return resumeProbeAtom_upv_1(
                function()
                    --[[
                      line: 282
                    ]]
                    return false
                end
            )
        end,
        25
    )
    local v20, v21 = ClientFunctions_upv_1.resumeRun:invoke():await()
    v19()
    resumeProbeAtom_upv_1(
        function()
            --[[
              line: 288
            ]]
            return false
        end
    )
    if v20 and v21.ok then
        local v22 = nil
        if sessionAtom_upv_1() == nil then
            v22 = GAME_REGISTRY_upv_1[v21.gameId]
            if v22 ~= nil and v22.resumeVersion == v21.version then
                a1:resumeLaunch(v21, v22)
            else
                ClientEvents_upv_1.abandonRun:fire(v21.runId)
                return nil
            end
        else
            ClientEvents_upv_1.abandonRun:fire(v21.runId)
            return nil
        end
    else
        return nil
    end
end
u2.resumeLaunch = function(a1, a2, a3)
    --[[
      name: resumeLaunch
      line: 314
      upvalues:
        isGameAvailableOnDevice_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        pushToast_upv_1 (copy, index: 4)
        RESUME_COUNTDOWN_SECONDS_upv_1 (copy, index: 5)
        setTimeout_upv_1 (copy, index: 6)
    ]]
    local gameId_upv_1 = a2.gameId
    local runId_upv_1 = a2.runId
    local launchToken_upv_1
    if isGameAvailableOnDevice_upv_1(gameId_upv_1) then
        a1:teardown()
        a1:applyScreenOrientation(a3.forceLandscape == true)
        a1.launchToken = a1.launchToken + 1
        launchToken_upv_1 = a1.launchToken
        sessionAtom_upv_1(
            function()
                --[[
                  line: 326
                  upvalues:
                    gameId_upv_1 (copy, index: 1)
                    runId_upv_1 (copy, index: 2)
                    a2 (copy, index: 3)
                ]]
                local tbl_3 = {}
                tbl_3.gameId = gameId_upv_1
                tbl_3.runId = runId_upv_1
                tbl_3.mode = ((a2.mode ~= "daily") and "regular") or "daily"
                tbl_3.score = a2.score
                tbl_3.pickups = a2.pickups
                tbl_3.suppressNearBestOffer = a2.suppressNearBestOffer
                return tbl_3
            end
        )
        a1.currentRunSeed = a2.seed
        local v23 = nil
        if a1:prepareInstance(a3, gameId_upv_1, launchToken_upv_1) then
            a1.currentScore = a2.score
            a1.currentPickups = a2.pickups
            v23 = a1.instance
            local v24
            if v23 == nil then
                v24 = v23
            else
                v24 = v23.restoreResume
            end
            local v25
            if v24 ~= nil then
                v25 = true
            else
                v25 = false
            end
            if v25 then
                v25 = v23:restoreResume({state = a2.state, score = a2.score, pickups = a2.pickups})
            end
            if launchToken_upv_1 == a1.launchToken then
                local v26 = nil
                if v25 then
                    v26 = a3.resumeCountdownSeconds
                    if v26 == nil then
                        v26 = RESUME_COUNTDOWN_SECONDS_upv_1
                    end
                    local u3 = v26
                    if sessionAtom_upv_1() ~= nil then
                        sessionAtom_upv_1(
                            function(a4)
                                --[[
                                  line: 394
                                  upvalues:
                                    u3 (copy, index: 1)
                                ]]
                                if a4 ~= nil then
                                    local v27 = table.clone(a4)
                                    setmetatable(v27, nil)
                                    v27.phase = "ready"
                                    v27.resumeCountdownEndsAt = u3 > 0 and os.clock() + u3 or nil
                                    return v27
                                end
                                return a4
                            end
                        )
                        a1:armCheckpointTimer()
                        local v29 = nil
                        if u3 > 0 then
                            local v30 = setTimeout_upv_1(
                                function()
                                    --[[
                                      line: 412
                                      upvalues:
                                        a1 (copy, index: 1)
                                        launchToken_upv_1 (copy, index: 2)
                                    ]]
                                    return a1:beginResumedPlay(launchToken_upv_1)
                                end,
                                u3
                            )
                            v29 = a1.sessionJanitor
                            if v29 ~= nil then
                                v29:Add(v30)
                            end
                        else
                            a1:beginResumedPlay(launchToken_upv_1)
                            return nil
                        end
                    else
                        warn((("[GameSessionController] %* resume lost its session before the countdown"):format(gameId_upv_1)))
                        ClientEvents_upv_1.abandonRun:fire(runId_upv_1)
                        a1:teardown()
                        return nil
                    end
                else
                    warn((("[GameSessionController] %* could not restore its suspended run"):format(gameId_upv_1)))
                    ClientEvents_upv_1.abandonRun:fire(runId_upv_1)
                    pushToast_upv_1("Couldn't restore your last run.", "error")
                    a1:teardown()
                    return nil
                end
            else
                ClientEvents_upv_1.abandonRun:fire(runId_upv_1)
                return nil
            end
        else
            warn((("[GameSessionController] %* resume aborted before restore"):format(gameId_upv_1)))
            if launchToken_upv_1 == a1.launchToken then
                ClientEvents_upv_1.abandonRun:fire(runId_upv_1)
            end
            return nil
        end
    else
        ClientEvents_upv_1.abandonRun:fire(runId_upv_1)
        return nil
    end
end
u2.beginResumedPlay = function(a1, a2)
    --[[
      name: beginResumedPlay
      line: 420
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        clearCombo_upv_1 (copy, index: 2)
    ]]
    local u4
    if a2 == a1.launchToken then
        u4 = sessionAtom_upv_1()
        local instance_1 = a1.instance
        if u4 ~= nil and u4.phase == "ready" then
            local v31 = nil
            if instance_1 ~= nil then
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 429
                          upvalues:
                            u4 (copy, index: 1)
                        ]]
                        local v32 = table.clone(u4)
                        setmetatable(v32, nil)
                        v32.phase = "playing"
                        v32.resumeCountdownEndsAt = nil
                        return v32
                    end
                )
                a1.input:setInputEnabled(true)
                clearCombo_upv_1()
                v31 = instance_1.resumeStart
                if v31 ~= nil then
                    v31(instance_1)
                end
                a1:sendCheckpoint()
                return
            end
        end
    end
    return nil
end
u2.tryContinueHeldRun = function(a1, a2, a3)
    --[[
      name: tryContinueHeldRun
      line: 446
      upvalues:
        isParkable_upv_1 (copy, index: 1)
        readLocalProfile_upv_1 (copy, index: 2)
        GAME_REGISTRY_upv_1 (copy, index: 3)
        ClientFunctions_upv_1 (copy, index: 4)
        sessionAtom_upv_1 (copy, index: 5)
        ClientEvents_upv_1 (copy, index: 6)
    ]]
    if a3 == "regular" then
        local v33 = nil
        if isParkable_upv_1(a2) then
            v33 = readLocalProfile_upv_1()
            if v33 ~= nil then
                v33 = v33.parkedRuns[a2]
            end
            local v34 = nil
            if v33 ~= nil then
                v34 = GAME_REGISTRY_upv_1[a2]
                if v34 ~= nil then
                    local v35 = nil
                    if v34.resumeVersion ~= nil then
                        local launchToken_2 = a1.launchToken
                        local v35, v36 = ClientFunctions_upv_1.resumeRun:invoke(a2):await()
                        if v35 and v36.ok then
                            if launchToken_2 == a1.launchToken and sessionAtom_upv_1() == nil then
                                if v36.gameId == a2 and v34.resumeVersion == v36.version then
                                    a1:resumeLaunch(v36, v34)
                                    return true
                                end
                                ClientEvents_upv_1.abandonRun:fire(v36.runId)
                                return false
                            end
                            ClientEvents_upv_1.abandonRun:fire(v36.runId)
                            return true
                        end
                        return false
                    end
                end
            end
            return false
        end
    end
    return false
end
u2.invokeStart = function(a1, a2, a3)
    --[[
      name: invokeStart
      line: 488
      upvalues:
        ClientFunctions_upv_1 (copy, index: 1)
    ]]
    local v37, v38 = nil, nil
    if a3 ~= "daily" then
        local v37, v39 = ClientFunctions_upv_1.startRun:invoke(a2):await()
        if v37 then
            return v39
        end
    else
        local v38, v40 = ClientFunctions_upv_1.startDailyRun:invoke():await()
        if v38 then
            return v40
        end
    end
    return nil
end
u2.launchDaily = function(a1)
    --[[
      name: launchDaily
      line: 496
      upvalues:
        gotdAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
    ]]
    local v41 = gotdAtom_upv_1()
    if v41 ~= nil then
        a1:launch({gameId = v41.gameId})
    else
        pushToast_upv_1("The daily challenge is still loading \226\128\148 try again.", "error")
        return nil
    end
end
local function u1(a1, a2)
    --[[
      name: launch
      line: 507
      upvalues:
        isGameAvailableOnDevice_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        DEVICE_UNAVAILABLE_MESSAGE_upv_1 (copy, index: 3)
        GAME_REGISTRY_upv_1 (copy, index: 4)
        sessionAtom_upv_1 (copy, index: 5)
        ClientEvents_upv_1 (copy, index: 6)
        u1 (ref,  index: 7)
    ]]
    local gameId_upv_2 = a2.gameId
    local mode_upv_1 = a2.mode
    if isGameAvailableOnDevice_upv_1(gameId_upv_2) then
        local v42 = nil
        if a1:tryContinueHeldRun(gameId_upv_2, mode_upv_1) then
            return nil
        else
            a1:teardown()
            v42 = GAME_REGISTRY_upv_1[gameId_upv_2]
            local v43 = nil
            if v42 ~= nil then
                a1:applyScreenOrientation(v42.forceLandscape == true)
                a1.launchToken = a1.launchToken + 1
                v43 = a1.launchToken
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 534
                          upvalues:
                            gameId_upv_2 (copy, index: 1)
                            mode_upv_1 (copy, index: 2)
                        ]]
                        local tbl_4 = {}
                        tbl_4.gameId = gameId_upv_2
                        tbl_4.mode = mode_upv_1
                        return tbl_4
                    end
                )
                a1.audio:play("uiConfirm", {})
                local u5 = a1:invokeStart(gameId_upv_2, mode_upv_1)
                if v43 == a1.launchToken then
                    if u5 == nil then
                        pushToast_upv_1("Couldn't reach the server \226\128\148 try again.", "error")
                        sessionAtom_upv_1(
                            function()
                                --[[
                                  line: 559
                                ]]
                                return nil
                            end
                        )
                        return nil
                    elseif u5.ok then
                        if u5.gameId ~= nil and u5.gameId ~= gameId_upv_2 then
                            ClientEvents_upv_1.abandonRun:fire(u5.runId)
                            pushToast_upv_1("The daily challenge just rotated \226\128\148 try again.", "error")
                            sessionAtom_upv_1(
                                function()
                                    --[[
                                      line: 576
                                    ]]
                                    return nil
                                end
                            )
                            return nil
                        end
                        sessionAtom_upv_1(
                            function(a3)
                                --[[
                                  line: 584
                                  upvalues:
                                    u5 (copy, index: 1)
                                ]]
                                if a3 ~= nil then
                                    local v44 = table.clone(a3)
                                    setmetatable(v44, nil)
                                    v44.runId = u5.runId
                                    local v45
                                    if u5.suppressNearBestOffer == nil then
                                        v45 = nil
                                    else
                                        v45 = u5.suppressNearBestOffer
                                    end
                                    v44.suppressNearBestOffer = v45
                                    return v44
                                end
                                return a3
                            end
                        )
                        a1.currentRunSeed = u5.seed
                        local v46 = nil
                        if a1:prepareInstance(v42, gameId_upv_2, v43) then
                            sessionAtom_upv_1(
                                function(a4)
                                    --[[
                                      line: 601
                                    ]]
                                    if a4 ~= nil then
                                        local v47 = table.clone(a4)
                                        setmetatable(v47, nil)
                                        v47.phase = "ready"
                                        return v47
                                    end
                                    return a4
                                end
                            )
                            if v42.autoStart ~= true then
                                local u6 = a1.input.anyPress:Once(
                                    function()
                                        --[[
                                          line: 616
                                          upvalues:
                                            a1 (copy, index: 1)
                                        ]]
                                        return a1:beginPlaying()
                                    end
                                )
                                v46 = a1.sessionJanitor
                                if v46 ~= nil then
                                    v46:Add(
                                        function()
                                            --[[
                                              line: 621
                                              upvalues:
                                                u6 (copy, index: 1)
                                            ]]
                                            return u6.Disconnect()
                                        end
                                    )
                                end
                            else
                                a1:beginPlaying()
                            end
                            a1:armCheckpointTimer()
                        else
                            return nil
                        end
                    else
                        pushToast_upv_1(u1(u5.reason), "error")
                        sessionAtom_upv_1(
                            function()
                                --[[
                                  line: 566
                                ]]
                                return nil
                            end
                        )
                        return nil
                    end
                else
                    if u5 ~= nil and u5.ok then
                        ClientEvents_upv_1.abandonRun:fire(u5.runId)
                    end
                    return nil
                end
            else
                pushToast_upv_1("Coming soon!")
                return nil
            end
        end
    else
        pushToast_upv_1(DEVICE_UNAVAILABLE_MESSAGE_upv_1, "error")
        return nil
    end
end
u2.launch = u1
u2.launchMatch = function(a1, a2)
    --[[
      name: launchMatch
      line: 628
      upvalues:
        GAME_REGISTRY_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
    ]]
    a1:teardown()
    local v48 = GAME_REGISTRY_upv_1[a2.gameId]
    local v49 = nil
    if v48 ~= nil then
        a1:applyScreenOrientation(true)
        a1.launchToken = a1.launchToken + 1
        v49 = a1.launchToken
        sessionAtom_upv_1(
            function()
                --[[
                  line: 640
                  upvalues:
                    a2 (copy, index: 1)
                ]]
                local tbl_5 = {}
                tbl_5.gameId = a2.gameId
                tbl_5.runId = a2.runId
                return tbl_5
            end
        )
        a1.audio:play("uiConfirm", {})
        a1.currentRunSeed = a2.seed
        if a1:prepareInstance(v48, a2.gameId, v49) then
            sessionAtom_upv_1(
                function(a3)
                    --[[
                      line: 660
                    ]]
                    if a3 ~= nil then
                        local v50 = table.clone(a3)
                        setmetatable(v50, nil)
                        v50.phase = "ready"
                        return v50
                    end
                    return a3
                end
            )
            a1:armCheckpointTimer()
            a1:armSnapshotPump(a2.matchId)
            a1:armOpponentFeed()
        else
            return nil
        end
    else
        pushToast_upv_1("That game isn't available yet.", "error")
        return nil
    end
end
u1 = function(a1, a2)
    --[[
      name: launchBotMatch
      line: 676
      upvalues:
        GAME_REGISTRY_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        ClientEvents_upv_1 (copy, index: 4)
        u1 (ref,  index: 5)
    ]]
    a1:teardown()
    local v51 = GAME_REGISTRY_upv_1[a2]
    local v52 = nil
    if v51 ~= nil then
        a1:applyScreenOrientation(true)
        a1.launchToken = a1.launchToken + 1
        v52 = a1.launchToken
        sessionAtom_upv_1(
            function()
                --[[
                  line: 687
                  upvalues:
                    a2 (copy, index: 1)
                ]]
                local tbl_6 = {}
                tbl_6.gameId = a2
                return tbl_6
            end
        )
        a1.audio:play("uiConfirm", {})
        local u7 = a1:invokeStart(a2, "regular")
        if v52 == a1.launchToken then
            if u7 == nil then
                pushToast_upv_1("Couldn't reach the server \226\128\148 try again.", "error")
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 710
                        ]]
                        return nil
                    end
                )
            elseif u7.ok then
                sessionAtom_upv_1(
                    function(a3)
                        --[[
                          line: 722
                          upvalues:
                            u7 (copy, index: 1)
                        ]]
                        if a3 ~= nil then
                            local v53 = table.clone(a3)
                            setmetatable(v53, nil)
                            v53.runId = u7.runId
                            return v53
                        end
                        return a3
                    end
                )
                a1.currentRunSeed = u7.seed
                if a1:prepareInstance(v51, a2, v52) then
                    sessionAtom_upv_1(
                        function(a4)
                            --[[
                              line: 739
                            ]]
                            if a4 ~= nil then
                                local v54 = table.clone(a4)
                                setmetatable(v54, nil)
                                v54.phase = "ready"
                                return v54
                            end
                            return a4
                        end
                    )
                    a1:armCheckpointTimer()
                    a1:armOpponentFeed()
                    local tbl_7 = {}
                    tbl_7.runId = u7.runId
                    tbl_7.seed = u7.seed
                    return tbl_7
                end
            else
                pushToast_upv_1(u1(u7.reason), "error")
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 717
                        ]]
                        return nil
                    end
                )
            end
        elseif u7 ~= nil and u7.ok then
            ClientEvents_upv_1.abandonRun:fire(u7.runId)
        end
    else
        pushToast_upv_1("Coming soon!")
    end
    return nil
end
u2.launchBotMatch = u1
u2.beginMatchPlay = function(a1)
    --[[
      name: beginMatchPlay
      line: 758
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
    ]]
    local v55 = sessionAtom_upv_1()
    if v55 ~= nil and v55.mode == "match" then
        a1:beginPlaying()
    else
        return nil
    end
end
u2.forceEndMatchRun = function(a1)
    --[[
      name: forceEndMatchRun
      line: 765
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
    ]]
    local v56 = sessionAtom_upv_1()
    if v56 ~= nil and v56.mode == "match" and v56.phase == "playing" then
        a1:onRunEnded(a1.currentScore)
        return
    end
    return nil
end
u2.prepareInstance = function(a1, a2, a3, a4)
    --[[
      name: prepareInstance
      line: 772
      upvalues:
        Janitor_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        hintsFor_upv_1 (copy, index: 3)
        GamepadHintBar_upv_1 (copy, index: 4)
        RuntimeLib_upv_1 (copy, index: 5)
    ]]
    local u8 = Janitor_upv_1.new()
    a1.sessionJanitor = u8
    local v57 = a1.input:createHandle(u8)
    local u9
    if a2.kind ~= "world" then
        u9 = nil
    else
        u9 = a1.stages:acquire(u8, a3, a1:resolveViewRect())
    end
    a1.rivalMarkersAttached = false
    local tbl_upv_8 = {}
    tbl_upv_8.gameId = a3
    local function getRunSeed()
        --[[
          name: getRunSeed
          line: 780
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.currentRunSeed
    end
    tbl_upv_8.getRunSeed = getRunSeed
    tbl_upv_8.janitor = u8
    tbl_upv_8.input = v57
    tbl_upv_8.audio = a1.audio:createHandle()
    tbl_upv_8.stage = u9
    tbl_upv_8.reportScore = function(a5)
        --[[
          name: reportScore
          line: 787
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onReportScore(a5)
    end
    tbl_upv_8.reportPickup = function(a6)
        --[[
          name: reportPickup
          line: 790
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onReportPickups(a6)
    end
    tbl_upv_8.endRun = function(a7)
        --[[
          name: endRun
          line: 793
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:onRunEnded(a7)
    end
    tbl_upv_8.requestStart = function()
        --[[
          name: requestStart
          line: 796
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:beginPlaying()
    end
    if u9 ~= nil then
        getRunSeed = function(a8)
            --[[
              line: 799
              upvalues:
                a1 (copy, index: 1)
                a3 (copy, index: 2)
                u9 (copy, index: 3)
                u8 (copy, index: 4)
            ]]
            return a1:attachRivalMarkers(a3, u9, u8, a8)
        end
    else
        getRunSeed = nil
    end
    tbl_upv_8.registerRivalMarkers = getRunSeed
    local getRunSeed, u10 = pcall(
        function()
            --[[
              line: 806
              upvalues:
                a2 (copy, index: 1)
                tbl_upv_8 (copy, index: 2)
            ]]
            return a2.create(tbl_upv_8)
        end
    )
    local v58 = nil
    if getRunSeed then
        a1.instance = u10
        a1.currentScore = 0
        a1.currentPickups = 0
        a1.runVoidReason = nil
        v58 = hintsFor_upv_1(a3)
        if v58 ~= nil then
            local v59 = GamepadHintBar_upv_1.new({})
            v59:setEntries(v58)
            u8:Add(v59, "destroy")
        end
        local v60 = RuntimeLib_upv_1.Promise.try(
            function()
                --[[
                  line: 832
                  upvalues:
                    u10 (copy, index: 1)
                ]]
                return u10:init()
            end
        ):await()
        if a4 == a1.launchToken then
            if v60 then
                return true
            end
            pushToast_upv_1("Game failed to load.", "error")
            a1:exitToHub()
        else
            warn((("[GameSessionController] %* launch superseded during init (token %* \226\134\146 %*)"):format(a3, a4, a1.launchToken)))
        end
    else
        warn((("[GameSessionController] %* construct failed: %*"):format(a3, tostring(u10))))
        pushToast_upv_1("Game failed to load.", "error")
        a1:exitToHub()
    end
    return false
end
u2.resolveViewRect = function(a1)
    --[[
      name: resolveViewRect
      line: 846
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        matchViewMode_upv_1 (copy, index: 2)
        matchAtom_upv_1 (copy, index: 3)
        ROYALE_VIEW_RECT_upv_1 (copy, index: 4)
        duelRect_upv_1 (copy, index: 5)
        duelSideFor_upv_1 (copy, index: 6)
        Players_upv_1 (copy, index: 7)
    ]]
    local v61 = sessionAtom_upv_1()
    if v61 ~= nil and v61.mode == "match" then
        local v62 = nil
        if matchViewMode_upv_1(v61.gameId) ~= "ghost" then
            v62 = matchAtom_upv_1()
            local v63
            if v62 == nil then
                v63 = v62
            else
                v63 = v62.mode
            end
            if v63 == "duel" then
                return duelRect_upv_1(duelSideFor_upv_1(v62.participants, Players_upv_1.LocalPlayer.UserId))
            end
            return ROYALE_VIEW_RECT_upv_1
        end
        return nil
    end
    return nil
end
u2.sendCheckpoint = function(a1)
    --[[
      name: sendCheckpoint
      line: 864
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
    ]]
    local v64 = sessionAtom_upv_1()
    if v64 ~= nil and v64.phase == "playing" and v64.runId ~= "" then
        if a1.runVoidReason == nil then
            ClientEvents_upv_1.runCheckpoint:fire(v64.runId, a1.currentScore, a1.currentPickups, a1:captureResume(v64))
            return
        end
        return nil
    end
    return nil
end
u2.captureResume = function(a1, a2)
    --[[
      name: captureResume
      line: 876
      upvalues:
        GAME_REGISTRY_upv_1 (copy, index: 1)
        RESUME_STATE_MAX_CHARS_upv_1 (copy, index: 2)
    ]]
    local v65, v66 = nil, nil
    if a2.mode ~= "match" then
        local instance_upv_2 = a1.instance
        v65 = GAME_REGISTRY_upv_1[a2.gameId]
        if v65 ~= nil then
            v65 = v65.resumeVersion
        end
        v66 = instance_upv_2
        if v66 ~= nil then
            v66 = v66.captureResume
        end
        local v67
        if v66 == nil then
            v67 = true
        else
            v67 = false
        end
        v67 = (v67) or v65 == nil
        local success_1
        if not v67 then
            local success_1, v68 = pcall(
                function()
                    --[[
                      line: 898
                      upvalues:
                        instance_upv_2 (copy, index: 1)
                    ]]
                    local captureResume_1 = instance_upv_2.captureResume
                    if captureResume_1 ~= nil then
                        captureResume_1 = captureResume_1(instance_upv_2)
                    end
                    return captureResume_1
                end
            )
            if success_1 then
                if type(v68) == "string" and #v68 ~= 0 then
                    if RESUME_STATE_MAX_CHARS_upv_1 >= #v68 then
                        local tbl_9 = {}
                        tbl_9.version = v65
                        tbl_9.state = v68
                        return tbl_9
                    end
                    warn((("[GameSessionController] %* resume blob too large (%*) \226\128\148 not saved"):format(a2.gameId, #v68)))
                    return nil
                end
            else
                warn((("[GameSessionController] %* captureResume threw: %*"):format(a2.gameId, tostring(v68))))
            end
        end
    end
    return nil
end
u2.armCheckpointTimer = function(a1)
    --[[
      name: armCheckpointTimer
      line: 923
      upvalues:
        setInterval_upv_1 (copy, index: 1)
        CHECKPOINT_INTERVAL_SECONDS_upv_1 (copy, index: 2)
    ]]
    local sessionJanitor_1 = a1.sessionJanitor
    if sessionJanitor_1 ~= nil then
        sessionJanitor_1:Add(
            (setInterval_upv_1(
                function()
                    --[[
                      line: 928
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:sendCheckpoint()
                end,
                CHECKPOINT_INTERVAL_SECONDS_upv_1
            ))
        )
    else
        return nil
    end
end
u2.armOpponentFeed = function(a1)
    --[[
      name: armOpponentFeed
      line: 933
      upvalues:
        Players_upv_1 (copy, index: 1)
        matchAtom_upv_1 (copy, index: 2)
        matchViewMode_upv_1 (copy, index: 3)
        opponentSnapshotsAtom_upv_1 (copy, index: 4)
        subscribe_upv_1 (copy, index: 5)
        spectateTargetAtom_upv_1 (copy, index: 6)
    ]]
    local sessionJanitor_2 = a1.sessionJanitor
    local v69, v70 = nil, nil
    if sessionJanitor_2 ~= nil then
        local UserId_upv_1 = Players_upv_1.LocalPlayer.UserId
        local function v71()
            --[[
              line: 939
              upvalues:
                a1 (copy, index: 1)
                matchAtom_upv_1 (copy, index: 2)
                matchViewMode_upv_1 (copy, index: 3)
                opponentSnapshotsAtom_upv_1 (copy, index: 4)
                UserId_upv_1 (copy, index: 5)
            ]]
            local instance_3 = a1.instance
            local v72
            if instance_3 == nil then
                v72 = instance_3
            else
                v72 = instance_3.updateOpponents
            end
            local v73 = nil
            if v72 ~= nil then
                v73 = matchAtom_upv_1()
                if v73 ~= nil then
                    if matchViewMode_upv_1(v73.gameId) == "replica" and v73.mode ~= "duel" then
                        return nil
                    end
                    local v74 = opponentSnapshotsAtom_upv_1()
                    local tbl_10 = {}
                    local _, v75, v76 = nil, nil, nil
                    local tbl_11 = nil
                    local v77 = nil
                    local v78 = nil
                    for v79, value_1 in v73.standings do
                        if value_1.userId == UserId_upv_1 then
                            continue
                        end
                        v78 = v73.bot
                        if v78 ~= nil then
                            v78 = v78.persona
                            if v78 ~= nil then
                                v78 = v78.userId
                            end
                        end
                        v76 = v78
                        if v76 == nil then
                            v75 = v73.bot
                            if v75 ~= nil then
                                v75 = v75.personaResolved
                            end
                            if v75 ~= true then
                                v76 = nil
                            else
                                v76 = UserId_upv_1
                            end
                        end
                        tbl_11 = {}
                        tbl_11.userId = value_1.userId
                        tbl_11.username = value_1.username
                        tbl_11.alive = value_1.alive
                        if value_1.userId <= 0 then
                            v77 = v76
                        else
                            v77 = value_1.userId
                        end
                        tbl_11.avatarUserId = v77
                        tbl_11.snapshot = v74[tostring(value_1.userId)]
                        table.insert(tbl_10, tbl_11)
                    end
                    instance_3:updateOpponents(tbl_10)
                else
                    return nil
                end
            else
                return nil
            end
        end
        sessionJanitor_2:Add(subscribe_upv_1(opponentSnapshotsAtom_upv_1, v71))
        sessionJanitor_2:Add(subscribe_upv_1(matchAtom_upv_1, v71))
        v71()
        sessionJanitor_2:Add(
            subscribe_upv_1(
                spectateTargetAtom_upv_1,
                function()
                    --[[
                      line: 999
                      upvalues:
                        a1 (copy, index: 1)
                        spectateTargetAtom_upv_1 (copy, index: 2)
                    ]]
                    local instance_4 = a1.instance
                    local v79, v79
                    if instance_4 == nil then
                        v79 = instance_4
                    else
                        v79 = instance_4.setSpectateTarget
                        if v79 ~= nil then
                            v79 = v79(instance_4, spectateTargetAtom_upv_1())
                        end
                    end
                    return v79
                end
            )
        )
        v69 = a1.instance
        if v69 ~= nil then
            v70 = v70.setSpectateTarget
            if v70 ~= nil then
                local _ = v70(v69, spectateTargetAtom_upv_1())
            end
        end
    else
        return nil
    end
end
u2.armSnapshotPump = function(a1, a2)
    --[[
      name: armSnapshotPump
      line: 1013
      upvalues:
        setInterval_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
        MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1 (copy, index: 4)
    ]]
    local sessionJanitor_3 = a1.sessionJanitor
    if sessionJanitor_3 ~= nil then
        sessionJanitor_3:Add(
            (setInterval_upv_1(
                function()
                    --[[
                      line: 1018
                      upvalues:
                        sessionAtom_upv_1 (copy, index: 1)
                        a1 (copy, index: 2)
                        ClientEvents_upv_1 (copy, index: 3)
                        a2 (copy, index: 4)
                    ]]
                    local v80 = sessionAtom_upv_1()
                    local v81
                    if v80 == nil or v80.phase ~= "playing" and v80.phase ~= "ready" then
                        return nil
                    end
                    v81 = a1.instance
                    local v82
                    if v81 == nil then
                        v82 = v81
                    else
                        v82 = v81.snapshot
                        if v82 ~= nil then
                            v82 = v82(v81)
                        end
                    end
                    local v83
                    if v82 ~= nil then
                        v83 = v82
                    else
                        local tbl_12 = {}
                        tbl_12.score = a1.currentScore
                        tbl_12.values = {}
                        v83 = tbl_12
                    end
                    ClientEvents_upv_1.matchSnapshot:fire(a2, v83)
                end,
                MATCH_SNAPSHOT_INTERVAL_SECONDS_upv_1
            ))
        )
    else
        return nil
    end
end
u2.beginPlaying = function(a1)
    --[[
      name: beginPlaying
      line: 1043
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        clearCombo_upv_1 (copy, index: 2)
    ]]
    local u11 = sessionAtom_upv_1()
    local instance_5 = a1.instance
    if u11 ~= nil and u11.phase == "ready" and instance_5 ~= nil then
        sessionAtom_upv_1(
            function()
                --[[
                  line: 1049
                  upvalues:
                    u11 (copy, index: 1)
                ]]
                local v84 = table.clone(u11)
                setmetatable(v84, nil)
                v84.phase = "playing"
                return v84
            end
        )
        a1:sendCheckpoint()
        a1.input:setInputEnabled(true)
        clearCombo_upv_1()
        instance_5:start()
        return
    end
    return nil
end
u2.restart = function(a1)
    --[[
      name: restart
      line: 1060
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        isGameOverInputLocked_upv_1 (copy, index: 2)
        isRestartGuarded_upv_1 (copy, index: 3)
        restartConfirmAtom_upv_1 (copy, index: 4)
        isRestartConfirmArmed_upv_1 (copy, index: 5)
        ClientEvents_upv_1 (copy, index: 6)
        pushToast_upv_1 (copy, index: 7)
        pausedAtom_upv_1 (copy, index: 8)
        clearCombo_upv_1 (copy, index: 9)
    ]]
    local v85 = sessionAtom_upv_1()
    local instance_6 = a1.instance
    if v85 ~= nil and instance_6 ~= nil then
        if v85.mode ~= "match" and not a1.isRestartPending then
            if v85.phase ~= "gameOver" and v85.phase ~= "playing" then
                return nil
            end
            if v85.reviveState == "none" then
                if v85.phase == "gameOver" and isGameOverInputLocked_upv_1(v85) then
                    return nil
                end
                local v86 = nil
                if isRestartGuarded_upv_1() then
                    a1:openRestartConfirm(v85.runId)
                else
                    if restartConfirmAtom_upv_1() ~= nil and not (isRestartConfirmArmed_upv_1()) then
                        return nil
                    end
                    if v85.phase == "playing" and v85.runId ~= "" then
                        ClientEvents_upv_1.abandonRun:fire(v85.runId)
                    end
                    v86 = a1.launchToken
                    a1.isRestartPending = true
                    local u12 = a1:invokeStart(v85.gameId, v85.mode)
                    a1.isRestartPending = false
                    if v86 == a1.launchToken then
                        if u12 ~= nil then
                            if u12.ok then
                                if u12.gameId ~= nil and u12.gameId ~= v85.gameId then
                                    ClientEvents_upv_1.abandonRun:fire(u12.runId)
                                    pushToast_upv_1("The daily challenge just rotated.", "error")
                                    a1:exitToHub()
                                    return nil
                                end
                                pausedAtom_upv_1(
                                    function()
                                        --[[
                                          line: 1141
                                        ]]
                                        return false
                                    end
                                )
                                restartConfirmAtom_upv_1(
                                    function()
                                        --[[
                                          line: 1144
                                        ]]
                                        return nil
                                    end
                                )
                                clearCombo_upv_1()
                                a1.currentScore = 0
                                a1.currentPickups = 0
                                a1.runVoidReason = nil
                                a1.currentRunSeed = u12.seed
                                sessionAtom_upv_1(
                                    function(a2)
                                        --[[
                                          line: 1153
                                          upvalues:
                                            u12 (copy, index: 1)
                                        ]]
                                        if a2 ~= nil then
                                            local v87 = table.clone(a2)
                                            setmetatable(v87, nil)
                                            v87.runId = u12.runId
                                            v87.phase = "playing"
                                            v87.score = 0
                                            v87.pickups = 0
                                            v87.lastResult = nil
                                            v87.reviveState = "none"
                                            v87.gameOverAt = nil
                                            local v88
                                            if u12.suppressNearBestOffer == nil then
                                                v88 = nil
                                            else
                                                v88 = u12.suppressNearBestOffer
                                            end
                                            v87.suppressNearBestOffer = v88
                                            v87.recordBeatenThisRun = nil
                                            return v87
                                        end
                                        return a2
                                    end
                                )
                                a1.audio:play("uiConfirm", {})
                                a1.input:setInputEnabled(true)
                                instance_6:start()
                                return
                            end
                            if u12.reason ~= "noCharges" then
                                pushToast_upv_1("Couldn't restart \226\128\148 returning to the hub.", "error")
                                a1:exitToHub()
                            else
                                pushToast_upv_1("No daily plays left today.", "error")
                                a1:releaseRestartConfirm()
                            end
                        else
                            pushToast_upv_1("Couldn't restart \226\128\148 returning to the hub.", "error")
                            a1:exitToHub()
                        end
                    end
                end
            end
        end
        return nil
    end
    return nil
end
u2.onReportScore = function(a1, a2)
    --[[
      name: onReportScore
      line: 1179
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
    ]]
    local phase_1 = sessionAtom_upv_1()
    if phase_1 ~= nil then
        phase_1 = phase_1.phase
    end
    if phase_1 ~= "dying" and phase_1 ~= "gameOver" then
        a1.currentScore = a2
        sessionAtom_upv_1(
            function(a3)
                --[[
                  line: 1193
                  upvalues:
                    a2 (copy, index: 1)
                ]]
                if a3 ~= nil and a3.phase == "playing" then
                    local v89 = table.clone(a3)
                    setmetatable(v89, nil)
                    v89.score = a2
                    return v89
                end
                return a3
            end
        )
    else
        return nil
    end
end
u2.onReportPickups = function(a1, a2)
    --[[
      name: onReportPickups
      line: 1206
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
    ]]
    a1.currentPickups = math.max(a2, a1.currentPickups)
    sessionAtom_upv_1(
        function(a3)
            --[[
              line: 1208
              upvalues:
                a1 (copy, index: 1)
            ]]
            if a3 ~= nil and a3.phase == "playing" then
                local v90 = table.clone(a3)
                setmetatable(v90, nil)
                v90.pickups = a1.currentPickups
                return v90
            end
            return a3
        end
    )
end
u2.onRunEnded = function(a1, a2)
    --[[
      name: onRunEnded
      line: 1221
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        clearCombo_upv_1 (copy, index: 2)
        restartConfirmAtom_upv_1 (copy, index: 3)
        pausedAtom_upv_1 (copy, index: 4)
        playersAtom_upv_1 (copy, index: 5)
        Players_upv_1 (copy, index: 6)
        matchAtom_upv_1 (copy, index: 7)
        GAME_REGISTRY_upv_1 (copy, index: 8)
        isNearBestPromptForced_upv_1 (copy, index: 9)
        isNearBestDeath_upv_1 (copy, index: 10)
        reviveAdPromptAtom_upv_1 (copy, index: 11)
        ClientFunctions_upv_1 (copy, index: 12)
        pushToast_upv_1 (copy, index: 13)
    ]]
    local u13 = sessionAtom_upv_1()
    if u13 ~= nil then
        local v91 = nil
        if u13.phase == "playing" then
            a1.input:setInputEnabled(false)
            clearCombo_upv_1()
            if restartConfirmAtom_upv_1() ~= nil then
                restartConfirmAtom_upv_1(
                    function()
                        --[[
                          line: 1234
                        ]]
                        return nil
                    end
                )
                pausedAtom_upv_1(
                    function()
                        --[[
                          line: 1237
                        ]]
                        return false
                    end
                )
            end
            a1:retireSessionPopups()
            local v92 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
            if u13.mode ~= "daily" then
                if v92 == nil then
                    local bestScore_1 = v92
                else
                    local bestScore_1 = v92.bestScores[u13.gameId]
                end
                local bestScore_1
                if bestScore_1 ~= nil then

                end
            else
                if v92 == nil then
                    local bestScore_1 = v92
                else
                    local bestScore_1 = v92.daily.bestScore
                end
                local bestScore_1
                if bestScore_1 ~= nil then

                end
            end
            local u14, v93 = nil, nil
            if u13.mode == "match" then
                v93 = matchAtom_upv_1()
                local v94
                if v93 == nil then
                    v94 = v93
                else
                    v94 = v93.phase
                end
                local v95
                if v94 ~= "ended" then
                    v95 = true
                else
                    v95 = false
                end
                if v95 then
                    if v93 == nil then
                        v91 = v93
                    else
                        v91 = v93.timeUpAt
                    end
                    if v91 == nil then
                        v95 = true
                    else
                        v95 = false
                    end
                end
                if v95 then
                    a1.audio:play("gameOverSting", {})
                end
            elseif u14 >= a2 then
                a1.audio:play("gameOverSting", {})
            else
                a1.audio:play("newBestFanfare", {})
            end
            local runId_upv_2 = u13.runId
            v91 = GAME_REGISTRY_upv_1[u13.gameId]
            if v91 ~= nil then
                v91 = v91.overlayDelaySeconds
            end
            local v96
            if v91 ~= nil then
                v96 = v91
            else
                v96 = 0
            end
            local u15 = true
            if u13.recordBeatenThisRun ~= true then
                u15 = false
                if u13.mode == "regular" then
                    u15 = u14 < a2
                end
            end
            local v97 = false
            if u13.mode == "regular" then
                v97 = false
                if a1.runVoidReason == nil then
                    v97 = isNearBestPromptForced_upv_1()
                    if not v97 then
                        v97 = false
                        if u13.suppressNearBestOffer ~= true then
                            v97 = false
                            if u13.recordBeatenThisRun ~= true then
                                v97 = isNearBestDeath_upv_1(a2, u14)
                            end
                        end
                    end
                end
            end
            if v97 then
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 1331
                          upvalues:
                            u13 (copy, index: 1)
                            a2 (copy, index: 2)
                            u15 (copy, index: 3)
                        ]]
                        local v98 = table.clone(u13)
                        setmetatable(v98, nil)
                        v98.phase = "dying"
                        v98.score = a2
                        v98.lastResult = nil
                        v98.autoReviveArmed = true
                        v98.recordBeatenThisRun = u15
                        return v98
                    end
                )
                local launchToken_upv_3 = a1.launchToken
                task.delay(
                    8,
                    function()
                        --[[
                          line: 1345
                          upvalues:
                            launchToken_upv_3 (copy, index: 1)
                            a1 (copy, index: 2)
                            sessionAtom_upv_1 (copy, index: 3)
                            runId_upv_2 (copy, index: 4)
                            reviveAdPromptAtom_upv_1 (copy, index: 5)
                        ]]
                        local v99 = nil
                        if launchToken_upv_3 == a1.launchToken then
                            v99 = sessionAtom_upv_1()
                            if v99 ~= nil then
                                local v100 = nil
                                if v99.runId == runId_upv_2 then
                                    v100 = reviveAdPromptAtom_upv_1()
                                    if v100 ~= nil then
                                        v100 = v100.runId
                                    end
                                    if v100 ~= runId_upv_2 then
                                        if v99.phase == "dying" and v99.autoReviveArmed == true and v99.reviveState == "none" then
                                            a1:revealGameOver(runId_upv_2)
                                        end
                                        return
                                    end
                                    return nil
                                end
                            end
                        end
                        return nil
                    end
                )
            elseif v96 > 0 then
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 1381
                          upvalues:
                            u13 (copy, index: 1)
                            a2 (copy, index: 2)
                            u15 (copy, index: 3)
                        ]]
                        local v101 = table.clone(u13)
                        setmetatable(v101, nil)
                        v101.phase = "dying"
                        v101.score = a2
                        v101.lastResult = nil
                        v101.recordBeatenThisRun = u15
                        return v101
                    end
                )
                local launchToken_upv_4 = a1.launchToken
                task.delay(
                    v96,
                    function()
                        --[[
                          line: 1391
                          upvalues:
                            launchToken_upv_4 (copy, index: 1)
                            a1 (copy, index: 2)
                            sessionAtom_upv_1 (copy, index: 3)
                            runId_upv_2 (copy, index: 4)
                        ]]
                        local u16
                        if launchToken_upv_4 == a1.launchToken then
                            u16 = sessionAtom_upv_1()
                            if u16 ~= nil and u16.runId == runId_upv_2 and u16.phase == "dying" then
                                sessionAtom_upv_1(
                                    function()
                                        --[[
                                          line: 1399
                                          upvalues:
                                            u16 (copy, index: 1)
                                        ]]
                                        local v102 = table.clone(u16)
                                        setmetatable(v102, nil)
                                        v102.phase = "gameOver"
                                        v102.gameOverAt = os.clock()
                                        return v102
                                    end
                                )
                                return
                            end
                        end
                        return nil
                    end
                )
            else
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 1368
                          upvalues:
                            u13 (copy, index: 1)
                            a2 (copy, index: 2)
                            u15 (copy, index: 3)
                        ]]
                        local v103 = table.clone(u13)
                        setmetatable(v103, nil)
                        v103.phase = "gameOver"
                        v103.score = a2
                        v103.lastResult = nil
                        v103.gameOverAt = os.clock()
                        v103.recordBeatenThisRun = u15
                        return v103
                    end
                )
            end
            if a1.runVoidReason == nil then
                local currentPickups_upv_1 = a1.currentPickups
                task.spawn(
                    function()
                        --[[
                          line: 1443
                          upvalues:
                            ClientFunctions_upv_1 (copy, index: 1)
                            runId_upv_2 (copy, index: 2)
                            a2 (copy, index: 3)
                            currentPickups_upv_1 (copy, index: 4)
                            pushToast_upv_1 (copy, index: 5)
                            sessionAtom_upv_1 (copy, index: 6)
                            u14 (copy, index: 7)
                            a1 (copy, index: 8)
                        ]]
                        local v104, u17 = ClientFunctions_upv_1.endRun:invoke(runId_upv_2, a2, currentPickups_upv_1):await()
                        if v104 then
                            sessionAtom_upv_1(
                                function(a3)
                                    --[[
                                      line: 1480
                                      upvalues:
                                        runId_upv_2 (copy, index: 1)
                                        u17 (copy, index: 2)
                                    ]]
                                    if a3 ~= nil and a3.runId == runId_upv_2 then
                                        local v105 = table.clone(a3)
                                        setmetatable(v105, nil)
                                        v105.lastResult = u17
                                        v105.resultNote = nil
                                        return v105
                                    end
                                    return a3
                                end
                            )
                            a1:tryAutoRevive(runId_upv_2, u17)
                        else
                            pushToast_upv_1("Couldn't reach the server \226\128\148 run results unavailable.", "error")
                            sessionAtom_upv_1(
                                function(a4)
                                    --[[
                                      line: 1451
                                      upvalues:
                                        runId_upv_2 (copy, index: 1)
                                        u14 (copy, index: 2)
                                    ]]
                                    if a4 ~= nil and a4.runId == runId_upv_2 and a4.lastResult == nil then
                                        local v106 = table.clone(a4)
                                        setmetatable(v106, nil)
                                        v106.resultNote = "offline"
                                        v106.lastResult = {bestScore = u14, medalsEarned = {}}
                                        return v106
                                    end
                                    return a4
                                end
                            )
                            a1:revealGameOver(runId_upv_2)
                            return nil
                        end
                    end
                )
                return
            else
                local runVoidReason_upv_1 = a1.runVoidReason
                sessionAtom_upv_1(
                    function(a5)
                        --[[
                          line: 1413
                          upvalues:
                            runId_upv_2 (copy, index: 1)
                            runVoidReason_upv_1 (copy, index: 2)
                            u14 (copy, index: 3)
                        ]]
                        if a5 ~= nil and a5.runId == runId_upv_2 then
                            local v107 = table.clone(a5)
                            setmetatable(v107, nil)
                            v107.resultNote = runVoidReason_upv_1
                            v107.lastResult = {bestScore = u14, medalsEarned = {}}
                            return v107
                        end
                        return a5
                    end
                )
                a1:revealGameOver(runId_upv_2)
                return nil
            end
        end
    end
    return nil
end
u2.tryAutoRevive = function(a1, a2, a3)
    --[[
      name: tryAutoRevive
      line: 1498
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        reviveLadderFor_upv_1 (copy, index: 2)
        revivePromptVariantFor_upv_1 (copy, index: 3)
        Players_upv_1 (copy, index: 4)
        MarketplaceService_upv_1 (copy, index: 5)
    ]]
    local v108 = sessionAtom_upv_1()
    if v108 ~= nil and v108.runId == a2 then
        if v108.phase == "dying" and v108.autoReviveArmed == true then
            local v109
            if a3.canRevive then
                v109 = reviveLadderFor_upv_1(v108.gameId).productIds[a3.revivesUsed + 1]
            else
                v109 = nil
            end
            local v110 = nil
            if v109 ~= nil then
                v110 = revivePromptVariantFor_upv_1(Players_upv_1.LocalPlayer.UserId)
                if v110 == "control" then
                    sessionAtom_upv_1(
                        function(a4)
                            --[[
                              line: 1521
                              upvalues:
                                a2 (copy, index: 1)
                            ]]
                            if a4 ~= nil and a4.runId == a2 and a4.phase == "dying" then
                                local v111 = table.clone(a4)
                                setmetatable(v111, nil)
                                v111.reviveState = "purchasing"
                                return v111
                            end
                            return a4
                        end
                    )
                    MarketplaceService_upv_1:PromptProductPurchase(Players_upv_1.LocalPlayer, v109)
                    a1:armReviveBackstop(90)
                    return
                end
                a1:openRevivePopup(a2, a3.revivesUsed, v110 == "popupAd")
            else
                a1:revealGameOver(a2)
            end
            return nil
        end
        return nil
    end
    return nil
end
u2.openRevivePopup = function(a1, a2, a3, a4)
    --[[
      name: openRevivePopup
      line: 1536
      upvalues:
        reviveAdPromptAtom_upv_1 (copy, index: 1)
        REVIVE_POPUP_TIMEOUT_SECONDS_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
    ]]
    reviveAdPromptAtom_upv_1(
        function()
            --[[
              line: 1537
              upvalues:
                a2 (copy, index: 1)
                a3 (copy, index: 2)
            ]]
            local tbl_13 = {}
            tbl_13.runId = a2
            tbl_13.shownAt = os.clock()
            tbl_13.tier = a3
            return tbl_13
        end
    )
    if a4 and a3 == 0 then
        a1:probeAdAvailability(a2)
    end
    local launchToken_upv_5 = a1.launchToken
    task.delay(
        REVIVE_POPUP_TIMEOUT_SECONDS_upv_1,
        function()
            --[[
              line: 1552
              upvalues:
                launchToken_upv_5 (copy, index: 1)
                a1 (copy, index: 2)
                reviveAdPromptAtom_upv_1 (copy, index: 3)
                a2 (copy, index: 4)
                sessionAtom_upv_1 (copy, index: 5)
            ]]
            local v112 = nil
            if launchToken_upv_5 == a1.launchToken then
                v112 = reviveAdPromptAtom_upv_1()
                if v112 ~= nil then
                    v112 = v112.runId
                end
                local v113 = nil
                if v112 == a2 then
                    v113 = sessionAtom_upv_1()
                    if v113 ~= nil and v113.runId == a2 then
                        if v113.reviveState == "none" then
                            a1:revealGameOver(a2)
                            return
                        end
                        return nil
                    end
                end
            end
            return nil
        end
    )
end
local function isAdAvailabilityPositive_upv_1(a1)
    --[[
      name: isAdAvailabilityPositive
      line: 154
    ]]
    for _, value_2 in pairs(a1) do
        if value_2 ~= Enum.AdAvailabilityResult.IsAvailable and type(value_2) == "string" and value_2 == "IsAvailable" or value_2 == Enum.AdAvailabilityResult.IsAvailable then
            return true
        end
    end
    return false
end
u2.probeAdAvailability = function(a1, a2)
    --[[
      name: probeAdAvailability
      line: 1574
      upvalues:
        AdService_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
        isAdAvailabilityPositive_upv_1 (copy, index: 3)
        ClientEvents_upv_1 (copy, index: 4)
        reviveAdPromptAtom_upv_1 (copy, index: 5)
    ]]
    task.spawn(
        function()
            --[[
              line: 1575
              upvalues:
                AdService_upv_1 (copy, index: 1)
                RunService_upv_1 (copy, index: 2)
                isAdAvailabilityPositive_upv_1 (copy, index: 3)
                ClientEvents_upv_1 (copy, index: 4)
                reviveAdPromptAtom_upv_1 (copy, index: 5)
                a2 (copy, index: 6)
            ]]
            local success_2, v114 = pcall(
                function()
                    --[[
                      line: 1576
                      upvalues:
                        AdService_upv_1 (copy, index: 1)
                    ]]
                    return AdService_upv_1:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
                end
            )
            local v115 = ((RunService_upv_1:IsStudio()) and true) or (success_2 and (isAdAvailabilityPositive_upv_1(v114)))
            ClientEvents_upv_1.reportAdReviveAvailability:fire(v115)
            if v115 then
                reviveAdPromptAtom_upv_1(
                    function(a3)
                        --[[
                          line: 1586
                          upvalues:
                            a2 (copy, index: 1)
                        ]]
                        if a3 ~= nil and a3.runId == a2 then
                            local v116 = table.clone(a3)
                            setmetatable(v116, nil)
                            v116.adAvailable = true
                            return v116
                        end
                        return a3
                    end
                )
            else
                return nil
            end
        end
    )
end
u2.buyFromRevivePopup = function(a1)
    --[[
      name: buyFromRevivePopup
      line: 1600
      upvalues:
        reviveAdPromptAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        reviveLadderFor_upv_1 (copy, index: 3)
        playersAtom_upv_1 (copy, index: 4)
        Players_upv_1 (copy, index: 5)
        MarketplaceService_upv_1 (copy, index: 6)
    ]]
    local v117 = reviveAdPromptAtom_upv_1()
    local u18 = sessionAtom_upv_1()
    if v117 ~= nil and u18 ~= nil and u18.runId == v117.runId then
        if u18.phase == "dying" and u18.autoReviveArmed == true then
            local v118, v119 = nil, nil
            if u18.reviveState == "none" then
                local v120 = reviveLadderFor_upv_1(u18.gameId)
                local v121 = v120.heartCosts[v117.tier + 1]
                v118 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
                if v118 ~= nil then
                    v118 = v118.revives
                end
                local v122
                if v118 ~= nil then
                    v122 = v118
                else
                    v122 = 0
                end
                if v121 ~= nil and v121 <= v122 then
                    sessionAtom_upv_1(
                        function()
                            --[[
                              line: 1623
                              upvalues:
                                u18 (copy, index: 1)
                            ]]
                            local v123 = table.clone(u18)
                            setmetatable(v123, nil)
                            v123.reviveState = "purchasing"
                            return v123
                        end
                    )
                    task.spawn(
                        function()
                            --[[
                              line: 1629
                              upvalues:
                                a1 (copy, index: 1)
                                u18 (copy, index: 2)
                            ]]
                            return a1:redeemRevive(u18.runId, "hearts")
                        end
                    )
                    return nil
                end
                v119 = v120.productIds[v117.tier + 1]
                if v119 ~= nil then
                    sessionAtom_upv_1(
                        function()
                            --[[
                              line: 1638
                              upvalues:
                                u18 (copy, index: 1)
                            ]]
                            local v124 = table.clone(u18)
                            setmetatable(v124, nil)
                            v124.reviveState = "purchasing"
                            return v124
                        end
                    )
                    MarketplaceService_upv_1:PromptProductPurchase(Players_upv_1.LocalPlayer, v119)
                    a1:armReviveBackstop(90)
                    return
                end
                return nil
            end
        end
        return nil
    end
    return nil
end
u2.watchAdFromRevivePopup = function(a1)
    --[[
      name: watchAdFromRevivePopup
      line: 1647
      upvalues:
        reviveAdPromptAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
    ]]
    local v125 = reviveAdPromptAtom_upv_1()
    local u19 = sessionAtom_upv_1()
    if v125 ~= nil and u19 ~= nil and u19.runId == v125.runId then
        if u19.phase == "dying" and u19.autoReviveArmed == true and u19.reviveState == "none" then
            if v125.tier == 0 and v125.adAvailable then
                sessionAtom_upv_1(
                    function()
                        --[[
                          line: 1659
                          upvalues:
                            u19 (copy, index: 1)
                        ]]
                        local v126 = table.clone(u19)
                        setmetatable(v126, nil)
                        v126.reviveState = "purchasing"
                        return v126
                    end
                )
                ClientEvents_upv_1.requestAdRevive:fire(u19.runId)
                a1:armReviveBackstop(90)
                return
            end
            return nil
        end
        return nil
    end
    return nil
end
u2.continueFromRevivePopup = function(a1)
    --[[
      name: continueFromRevivePopup
      line: 1670
      upvalues:
        reviveAdPromptAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        REVIVE_POPUP_CONTINUE_LOCK_SECONDS_upv_1 (copy, index: 3)
    ]]
    local v127 = reviveAdPromptAtom_upv_1()
    local v128 = sessionAtom_upv_1()
    if v127 ~= nil and v128 ~= nil and v128.runId == v127.runId then
        if v128.reviveState == "none" and os.clock() - v127.shownAt >= REVIVE_POPUP_CONTINUE_LOCK_SECONDS_upv_1 then
            a1.audio:play("uiBack", {})
            a1:revealGameOver(v127.runId)
            return
        end
        return nil
    end
    return nil
end
u2.onAdReviveFailed = function(a1, a2, a3)
    --[[
      name: onAdReviveFailed
      line: 1689
      upvalues:
        reviveAdPromptAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        pushToast_upv_1 (copy, index: 3)
    ]]
    local v129 = reviveAdPromptAtom_upv_1()
    if v129 ~= nil then
        v129 = v129.runId
    end
    local v130 = nil
    if v129 == a2 then
        v130 = sessionAtom_upv_1()
        if v130 ~= nil then
            local v131 = nil
            if v130.runId == a2 then
                v131 = a1.cancelReviveBackstop
                if v131 ~= nil then
                    v131()
                end
                a1.cancelReviveBackstop = nil
                if a3 == "unavailable" then
                    pushToast_upv_1("No ad is available right now.", "error")
                    reviveAdPromptAtom_upv_1(
                        function(a4)
                            --[[
                              line: 1709
                              upvalues:
                                a2 (copy, index: 1)
                            ]]
                            if a4 ~= nil and a4.runId == a2 then
                                local v132 = table.clone(a4)
                                setmetatable(v132, nil)
                                v132.adAvailable = false
                                return v132
                            end
                            return a4
                        end
                    )
                end
                sessionAtom_upv_1(
                    function(a5)
                        --[[
                          line: 1722
                          upvalues:
                            a2 (copy, index: 1)
                        ]]
                        if a5 ~= nil and a5.runId == a2 and a5.reviveState == "purchasing" then
                            local v133 = table.clone(a5)
                            setmetatable(v133, nil)
                            v133.reviveState = "none"
                            return v133
                        end
                        return a5
                    end
                )
                return
            end
        end
    end
    return nil
end
u2.revealGameOver = function(a1, a2)
    --[[
      name: revealGameOver
      line: 1735
      upvalues:
        reviveAdPromptAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
    ]]
    reviveAdPromptAtom_upv_1(
        function(a3)
            --[[
              line: 1737
              upvalues:
                a2 (copy, index: 1)
            ]]
            if a3 ~= nil and a3.runId == a2 then
                return nil
            end
            return a3
        end
    )
    sessionAtom_upv_1(
        function(a4)
            --[[
              line: 1740
              upvalues:
                a2 (copy, index: 1)
            ]]
            if a4 ~= nil and a4.runId == a2 and a4.phase == "dying" and a4.autoReviveArmed == true then
                local v134 = table.clone(a4)
                setmetatable(v134, nil)
                v134.phase = "gameOver"
                v134.reviveState = "none"
                v134.autoReviveArmed = nil
                v134.gameOverAt = os.clock()
                return v134
            end
            return a4
        end
    )
end
u2.requestRevive = function(a1)
    --[[
      name: requestRevive
      line: 1756
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        isGameOverInputLocked_upv_1 (copy, index: 2)
        reviveLadderFor_upv_1 (copy, index: 3)
        playersAtom_upv_1 (copy, index: 4)
        Players_upv_1 (copy, index: 5)
        MarketplaceService_upv_1 (copy, index: 6)
    ]]
    local u20 = sessionAtom_upv_1()
    if u20 ~= nil and u20.phase == "gameOver" and u20.reviveState == "none" then
        if u20.mode == "regular" and not a1.isRestartPending then
            local v135 = nil
            if not isGameOverInputLocked_upv_1(u20) then
                v135 = u20.lastResult
                if v135 ~= nil then
                    local v136, v137 = nil, nil
                    if v135.canRevive then
                        local v138 = reviveLadderFor_upv_1(u20.gameId)
                        local v139 = v138.heartCosts[v135.revivesUsed + 1]
                        v136 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
                        if v136 ~= nil then
                            v136 = v136.revives
                        end
                        local v140
                        if v136 ~= nil then
                            v140 = v136
                        else
                            v140 = 0
                        end
                        if v139 ~= nil and v139 <= v140 then
                            sessionAtom_upv_1(
                                function()
                                    --[[
                                      line: 1791
                                      upvalues:
                                        u20 (copy, index: 1)
                                    ]]
                                    local v141 = table.clone(u20)
                                    setmetatable(v141, nil)
                                    v141.reviveState = "purchasing"
                                    return v141
                                end
                            )
                            task.spawn(
                                function()
                                    --[[
                                      line: 1797
                                      upvalues:
                                        a1 (copy, index: 1)
                                        u20 (copy, index: 2)
                                    ]]
                                    return a1:redeemRevive(u20.runId, "hearts")
                                end
                            )
                            return nil
                        end
                        v137 = v138.productIds[v135.revivesUsed + 1]
                        if v137 ~= nil then
                            sessionAtom_upv_1(
                                function()
                                    --[[
                                      line: 1807
                                      upvalues:
                                        u20 (copy, index: 1)
                                    ]]
                                    local v142 = table.clone(u20)
                                    setmetatable(v142, nil)
                                    v142.reviveState = "purchasing"
                                    return v142
                                end
                            )
                            MarketplaceService_upv_1:PromptProductPurchase(Players_upv_1.LocalPlayer, v137)
                            a1:armReviveBackstop(90)
                            return
                        end
                        return nil
                    end
                end
            end
        end
        return nil
    end
    return nil
end
u2.armReviveBackstop = function(a1, a2)
    --[[
      name: armReviveBackstop
      line: 1818
      upvalues:
        setTimeout_upv_1 (copy, index: 1)
    ]]
    local cancelReviveBackstop_1 = a1.cancelReviveBackstop
    if cancelReviveBackstop_1 ~= nil then
        cancelReviveBackstop_1()
    end
    a1.cancelReviveBackstop = setTimeout_upv_1(
        function()
            --[[
              line: 1823
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.cancelReviveBackstop = nil
            a1:releaseRevivePurchasing()
        end,
        a2
    )
end
u2.releaseRevivePurchasing = function(a1)
    --[[
      name: releaseRevivePurchasing
      line: 1828
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        reviveAdPromptAtom_upv_1 (copy, index: 2)
    ]]
    local v143 = sessionAtom_upv_1()
    if v143 ~= nil then
        local v144 = nil
        if v143.reviveState == "purchasing" then
            v144 = reviveAdPromptAtom_upv_1()
            if v144 ~= nil then
                v144 = v144.runId
            end
            if v144 ~= v143.runId then
                if v143.phase == "dying" and v143.autoReviveArmed == true then
                    a1:revealGameOver(v143.runId)
                    return nil
                end
                sessionAtom_upv_1(
                    function(a2)
                        --[[
                          line: 1861
                        ]]
                        if a2 ~= nil and a2.reviveState == "purchasing" then
                            local v145 = table.clone(a2)
                            setmetatable(v145, nil)
                            v145.reviveState = "none"
                            return v145
                        end
                        return a2
                    end
                )
                return
            end
            sessionAtom_upv_1(
                function(a3)
                    --[[
                      line: 1841
                    ]]
                    if a3 ~= nil and a3.reviveState == "purchasing" then
                        local v146 = table.clone(a3)
                        setmetatable(v146, nil)
                        v146.reviveState = "none"
                        return v146
                    end
                    return a3
                end
            )
            return nil
        end
    end
    return nil
end
u2.onPurchaseFinished = function(a1, a2, a3, a4)
    --[[
      name: onPurchaseFinished
      line: 1874
      upvalues:
        Players_upv_1 (copy, index: 1)
        reviveTierForProduct_upv_1 (copy, index: 2)
    ]]
    if a2 == Players_upv_1.LocalPlayer.UserId and reviveTierForProduct_upv_1(a3) ~= nil then
        local v147
        if a4 then
            a1:armReviveBackstop(20)
            return nil
        end
        v147 = a1.cancelReviveBackstop
        if v147 ~= nil then
            v147()
        end
        a1.cancelReviveBackstop = nil
        a1.audio:play("uiBack", {})
        a1:releaseRevivePurchasing()
    else
        return nil
    end
end
u2.closeReviveOffer = function(a1, a2)
    --[[
      name: closeReviveOffer
      line: 1899
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
    ]]
    sessionAtom_upv_1(
        function(a3)
            --[[
              line: 1900
              upvalues:
                a2 (copy, index: 1)
            ]]
            if a3 ~= nil then
                local v148 = nil
                if a3.runId == a2 then
                    v148 = a3.lastResult
                    if v148 ~= nil and v148.canRevive then
                        local v149 = table.clone(a3)
                        setmetatable(v149, nil)
                        local v150 = table.clone(v148)
                        setmetatable(v150, nil)
                        v150.canRevive = false
                        v149.lastResult = v150
                        return v149
                    end
                    return a3
                end
            end
            return a3
        end
    )
end
u2.onReviveWindowClosed = function(a1, a2)
    --[[
      name: onReviveWindowClosed
      line: 1918
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
    ]]
    local v151 = sessionAtom_upv_1()
    if v151 ~= nil and v151.runId == a2 then
        local v152 = nil
        if v151.reviveState == "none" then
            v152 = v151.lastResult
            if v152 ~= nil then
                v152 = v152.canRevive
            end
            local v153
            if v152 == true then
                v153 = true
            else
                v153 = false
            end
            a1:closeReviveOffer(a2)
            if v151.phase == "dying" and v151.autoReviveArmed == true then
                a1:revealGameOver(a2)
                return nil
            end
            if v153 then
                pushToast_upv_1("Revive expired for this run.", "error")
            end
            return
        end
    end
    return nil
end
u2.redeemRevive = function(a1, a2, a3)
    --[[
      name: redeemRevive
      line: 1940
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        ClientFunctions_upv_1 (copy, index: 2)
        pushToast_upv_1 (copy, index: 3)
        GAME_REGISTRY_upv_1 (copy, index: 4)
    ]]
    if a3 == nil then
        a3 = "token"
    end
    local v154 = sessionAtom_upv_1()
    if v154 ~= nil then
        local v155 = nil
        if v154.runId == a2 then
            local v156 = false
            if v154.phase == "dying" then
                v156 = v154.autoReviveArmed == true
            end
            if v154.phase ~= "gameOver" and not (v156) then
                return nil
            end
            local v155, v157 = ClientFunctions_upv_1.redeemRevive:invoke(a2):await()
            local v158
            if v155 then
                v158 = v157
            else
                v158 = nil
            end
            local v162 = nil
            if v158 ~= nil then
                if v158.ok then
                    a1.audio:play("uiConfirm", {})
                    sessionAtom_upv_1(
                        function(a4)
                            --[[
                              line: 1996
                            ]]
                            if a4 ~= nil then
                                local v160 = table.clone(a4)
                                setmetatable(v160, nil)
                                v160.reviveState = "counting"
                                return v160
                            end
                            return a4
                        end
                    )
                    v162 = GAME_REGISTRY_upv_1[v154.gameId]
                    if v162 ~= nil then
                        v162 = v162.resumeCountdownSeconds
                    end
                    if v162 ~= nil then
                        local v161 = v162
                    else
                        local v161 = 3
                    end
                    local v161 = nil
                    if v161 > 0 then
                        task.delay(
                            v161,
                            function()
                                --[[
                                  line: 2026
                                  upvalues:
                                    a1 (copy, index: 1)
                                    a2 (copy, index: 2)
                                ]]
                                return a1:resumeFromRevive(a2)
                            end
                        )
                    else
                        task.defer(
                            function()
                                --[[
                                  line: 2022
                                  upvalues:
                                    a1 (copy, index: 1)
                                    a2 (copy, index: 2)
                                ]]
                                return a1:resumeFromRevive(a2)
                            end
                        )
                    end
                    return
                end
            end
            if v158 == nil then
                v162 = v158
            else
                v162 = v162.ok
            end
            local v159
            if v162 ~= false then
                v159 = nil
            else
                v159 = v158.reason
            end
            local v163
            if v159 ~= nil then
                v163 = ((a3 == "token") and "Revive couldn't be applied \226\128\148 it's banked for a future run.")
                    or (((v159 == "noSession") and "This run has expired \226\128\148 it can't be revived now.") or (((v159 == "alreadyUsed") and "No revives left on this run.") or (((v159 == "dailyRun") and "Game of the Day runs can't be revived.") or (((v159 ~= "dataNotLoaded") and "Not enough Revives \226\128\148 nothing was used.") or "Couldn't read your Revives right now \226\128\148 nothing was used."))))
            else
                v163 = "Couldn't reach the server \226\128\148 the run wasn't revived."
            end
            pushToast_upv_1(v163, "error")
            local v164 = true
            if v159 ~= "noSession" then
                local v165 = true
                if v159 == "alreadyUsed" then
                    v164 = v165
                else
                    v164 = v159 == "dailyRun"
                end
            end
            if v164 then
                a1:closeReviveOffer(a2)
            end
            if v156 then
                a1:revealGameOver(a2)
            else
                sessionAtom_upv_1(
                    function(a5)
                        --[[
                          line: 1977
                        ]]
                        if a5 ~= nil then
                            local v166 = table.clone(a5)
                            setmetatable(v166, nil)
                            v166.reviveState = "none"
                            return v166
                        end
                        return a5
                    end
                )
            end
            return nil
        end
    end
    return nil
end
u2.resumeFromRevive = function(a1, a2)
    --[[
      name: resumeFromRevive
      line: 2031
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        pausedAtom_upv_1 (copy, index: 2)
        clearCombo_upv_1 (copy, index: 3)
        reviveAdPromptAtom_upv_1 (copy, index: 4)
        restartConfirmAtom_upv_1 (copy, index: 5)
    ]]
    local u21 = sessionAtom_upv_1()
    local instance_7 = a1.instance
    if u21 ~= nil and u21.runId == a2 and u21.reviveState == "counting" then
        if instance_7 ~= nil then
            pausedAtom_upv_1(
                function()
                    --[[
                      line: 2040
                    ]]
                    return false
                end
            )
            clearCombo_upv_1()
            reviveAdPromptAtom_upv_1(
                function()
                    --[[
                      line: 2044
                    ]]
                    return nil
                end
            )
            restartConfirmAtom_upv_1(
                function()
                    --[[
                      line: 2047
                    ]]
                    return nil
                end
            )
            sessionAtom_upv_1(
                function()
                    --[[
                      line: 2050
                      upvalues:
                        u21 (copy, index: 1)
                    ]]
                    local v167 = table.clone(u21)
                    setmetatable(v167, nil)
                    v167.phase = "playing"
                    v167.reviveState = "none"
                    v167.lastResult = nil
                    v167.gameOverAt = nil
                    v167.autoReviveArmed = nil
                    return v167
                end
            )
            instance_7:revive()
            a1.input:setInputEnabled(true)
            return
        end
        return nil
    end
    return nil
end
u2.exitToHub = function(a1)
    --[[
      name: exitToHub
      line: 2065
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        isGameOverInputLocked_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
    ]]
    local v168
    if a1.isRestartPending then
        return nil
    end
    v168 = sessionAtom_upv_1()
    if v168 ~= nil and v168.mode ~= "match" and isGameOverInputLocked_upv_1(v168) then
        return nil
    end
    if v168 ~= nil and v168.runId ~= "" and not (a1:tryParkRun(v168)) then
        ClientEvents_upv_1.abandonRun:fire(v168.runId)
    end
    a1:teardown()
    a1.audio:play("uiBack", {})
end
u2.tryParkRun = function(a1, a2)
    --[[
      name: tryParkRun
      line: 2089
      upvalues:
        isParkable_upv_1 (copy, index: 1)
        GAME_REGISTRY_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
        pushToast_upv_1 (copy, index: 4)
        GAME_METADATA_upv_1 (copy, index: 5)
    ]]
    if a2.mode == "regular" and a2.phase == "playing" then
        if a1.runVoidReason == nil then
            local v169 = nil
            if isParkable_upv_1(a2.gameId) then
                v169 = GAME_REGISTRY_upv_1[a2.gameId]
                if v169 ~= nil then
                    v169 = v169.resumeVersion
                end
                if v169 ~= nil then
                    ClientEvents_upv_1.parkRun:fire(a2.runId, a1.currentScore, a1.currentPickups, a1:captureResume(a2))
                    pushToast_upv_1((("%* saved \226\128\148 tap it to continue."):format(GAME_METADATA_upv_1[a2.gameId].displayName)))
                    return true
                end
            end
        end
        return false
    end
    return false
end
u2.voidRunForPhotoMode = function(a1)
    --[[
      name: voidRunForPhotoMode
      line: 2113
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
    ]]
    local v170 = nil
    if a1.runVoidReason == nil then
        a1.runVoidReason = "photoVoided"
        v170 = sessionAtom_upv_1()
        if v170 ~= nil and v170.runId ~= "" then
            ClientEvents_upv_1.abandonRun:fire(v170.runId)
        else
            return nil
        end
    else
        return nil
    end
end
u2.photoVariants = function(a1)
    --[[
      name: photoVariants
      line: 2124
    ]]
    local instance_8 = a1.instance
    local v171
    if instance_8 == nil then
        v171 = instance_8
    else
        v171 = instance_8.photoVariants
        if v171 ~= nil then
            v171 = v171(instance_8)
        end
    end
    local v172
    if v171 ~= nil then
        v172 = v171
    else
        v172 = {}
    end
    return v172
end
u2.onScoringStopped = function(a1, a2)
    --[[
      name: onScoringStopped
      line: 2139
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
    ]]
    local v173 = nil
    if a1.runVoidReason == nil then
        v173 = sessionAtom_upv_1()
        if v173 ~= nil and v173.runId == a2 then
            a1.runVoidReason = "scoringStopped"
            pushToast_upv_1("This run stopped counting \226\128\148 it can no longer be saved.", "error")
        else
            return nil
        end
    else
        return nil
    end
end
u2.togglePause = function(a1)
    --[[
      name: togglePause
      line: 2150
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        restartConfirmAtom_upv_1 (copy, index: 2)
        pausedAtom_upv_1 (copy, index: 3)
    ]]
    local v174 = sessionAtom_upv_1()
    if v174 ~= nil and v174.phase == "playing" then
        if v174.mode ~= "match" then
            if restartConfirmAtom_upv_1() == nil then
                a1:setPaused(not pausedAtom_upv_1())
                a1.audio:play("uiTap", {})
                return
            end
            a1:cancelRestartConfirm()
        end
        return nil
    end
    return nil
end
u2.setPaused = function(a1, a2)
    --[[
      name: setPaused
      line: 2173
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
    ]]
    if pausedAtom_upv_1() ~= a2 then
        pausedAtom_upv_1(
            function()
                --[[
                  line: 2177
                  upvalues:
                    a2 (copy, index: 1)
                ]]
                return a2
            end
        )
        a1.input:setInputEnabled(not a2)
    else
        return nil
    end
end
u2.openRestartConfirm = function(a1, a2)
    --[[
      name: openRestartConfirm
      line: 2182
      upvalues:
        restartConfirmAtom_upv_1 (copy, index: 1)
    ]]
    a1:setPaused(true)
    restartConfirmAtom_upv_1(
        function()
            --[[
              line: 2184
              upvalues:
                a2 (copy, index: 1)
            ]]
            local tbl_14 = {}
            tbl_14.runId = a2
            tbl_14.shownAt = os.clock()
            return tbl_14
        end
    )
    a1.audio:play("uiTap", {})
end
u2.cancelRestartConfirm = function(a1)
    --[[
      name: cancelRestartConfirm
      line: 2194
      upvalues:
        restartConfirmAtom_upv_1 (copy, index: 1)
    ]]
    if restartConfirmAtom_upv_1() ~= nil then
        a1:releaseRestartConfirm()
        a1.audio:play("uiBack", {})
    else
        return nil
    end
end
u2.releaseRestartConfirm = function(a1)
    --[[
      name: releaseRestartConfirm
      line: 2203
      upvalues:
        restartConfirmAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
    ]]
    restartConfirmAtom_upv_1(
        function()
            --[[
              line: 2204
            ]]
            return nil
        end
    )
    local v175 = sessionAtom_upv_1()
    if v175 ~= nil then
        v175 = v175.phase
    end
    if v175 ~= "playing" then
        return
    end
    a1:setPaused(false)
end
u2.attachRivalMarkers = function(a1, a2, a3, a4, a5)
    --[[
      name: attachRivalMarkers
      line: 2215
      upvalues:
        RivalMarkerSystem_upv_1 (copy, index: 1)
        RivalFeed_upv_1 (copy, index: 2)
    ]]
    if a1.rivalMarkersAttached then
        warn((("[GameSessionController] %* registered rival markers twice \226\128\148 ignoring"):format(a2)))
        return nil
    else
        a1.rivalMarkersAttached = true
        a1.rivals:ensureFriendBests(a2)
        local u22 = RivalMarkerSystem_upv_1.new(a3, a5, a4)
        RivalFeed_upv_1.new(
            a2,
            a4,
            function(a6)
                --[[
                  line: 2223
                  upvalues:
                    u22 (copy, index: 1)
                ]]
                return u22:setEntries(a6)
            end
        )
    end
end
u2.applyScreenOrientation = function(a1, a2)
    --[[
      name: applyScreenOrientation
      line: 2227
      upvalues:
        StarterGui_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
    ]]
    if a2 then
        local v176 = Enum.ScreenOrientation.LandscapeSensor
    else
        local v176 = Enum.ScreenOrientation.Sensor
    end
    a1.demandedOrientation = v176
    StarterGui_upv_1.ScreenOrientation = a1.demandedOrientation
    local v176 = Players_upv_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if v176 ~= nil then
        v176.ScreenOrientation = a1.demandedOrientation
        a1:armScreenOrientationGuard(v176)
    else
        return nil
    end
end
u2.armScreenOrientationGuard = function(a1, a2)
    --[[
      name: armScreenOrientationGuard
      line: 2238
    ]]
    if a1.orientationGuard == nil then
        a1.orientationGuard = a2:GetPropertyChangedSignal("ScreenOrientation"):Connect(
            function()
                --[[
                  line: 2242
                  upvalues:
                    a2 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                if a2.ScreenOrientation ~= a1.demandedOrientation then
                    a2.ScreenOrientation = a1.demandedOrientation
                else
                    return nil
                end
            end
        )
    else
        return nil
    end
end
u2.retireSessionPopups = function(a1)
    --[[
      name: retireSessionPopups
      line: 2251
      upvalues:
        settingsPausedGameAtom_upv_1 (copy, index: 1)
        settingsOpenAtom_upv_1 (copy, index: 2)
        highwaySettingsOpenAtom_upv_1 (copy, index: 3)
        tetrisControlsOpenAtom_upv_1 (copy, index: 4)
        pausedAtom_upv_1 (copy, index: 5)
    ]]
    local v177 = settingsPausedGameAtom_upv_1()
    settingsOpenAtom_upv_1(
        function()
            --[[
              line: 2253
            ]]
            return false
        end
    )
    highwaySettingsOpenAtom_upv_1(
        function()
            --[[
              line: 2256
            ]]
            return false
        end
    )
    tetrisControlsOpenAtom_upv_1(
        function()
            --[[
              line: 2259
            ]]
            return false
        end
    )
    settingsPausedGameAtom_upv_1(
        function()
            --[[
              line: 2262
            ]]
            return false
        end
    )
    if not v177 then
        return
    end
    pausedAtom_upv_1(
        function()
            --[[
              line: 2266
            ]]
            return false
        end
    )
end
u2.teardown = function(a1)
    --[[
      name: teardown
      line: 2271
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        clearCombo_upv_1 (copy, index: 2)
        reviveAdPromptAtom_upv_1 (copy, index: 3)
        restartConfirmAtom_upv_1 (copy, index: 4)
        sessionAtom_upv_1 (copy, index: 5)
    ]]
    a1.launchToken = a1.launchToken + 1
    a1.input:setInputEnabled(false)
    a1:applyScreenOrientation(false)
    a1:retireSessionPopups()
    pausedAtom_upv_1(
        function()
            --[[
              line: 2276
            ]]
            return false
        end
    )
    clearCombo_upv_1()
    reviveAdPromptAtom_upv_1(
        function()
            --[[
              line: 2280
            ]]
            return nil
        end
    )
    restartConfirmAtom_upv_1(
        function()
            --[[
              line: 2283
            ]]
            return nil
        end
    )
    local cancelReviveBackstop_2 = a1.cancelReviveBackstop
    if cancelReviveBackstop_2 ~= nil then
        cancelReviveBackstop_2()
    end
    a1.cancelReviveBackstop = nil
    local instance_9 = a1.instance
    a1.instance = nil
    if instance_9 ~= nil then
        instance_9:destroy()
    end
    local sessionJanitor_4 = a1.sessionJanitor
    a1.sessionJanitor = nil
    if sessionJanitor_4 ~= nil then
        sessionJanitor_4:Destroy()
    end
    sessionAtom_upv_1(
        function()
            --[[
              line: 2301
            ]]
            return nil
        end
    )
    a1.currentScore = 0
    a1.currentPickups = 0
    a1.currentRunSeed = 0
    a1.runVoidReason = nil
end
Reflect_1.defineMetadata(u2, "identifier", "client/controllers/game-session-controller@GameSessionController")
Reflect_1.defineMetadata(u2, "flamework:parameters", {"client/controllers/input-controller@InputController", "client/controllers/stage-controller@StageController", "client/controllers/audio-controller@AudioController", "client/controllers/rival-data-controller@RivalDataController"})
Reflect_1.defineMetadata(u2, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u2, "$:flamework@Controller", Controller_1, {})
u1 = function(a1)
    --[[
      name: startFailureMessage
      line: 2318
    ]]
    if a1 ~= "dataNotLoaded" then
        if a1 ~= "gameNotLive" then
            if a1 ~= "gameLocked" then
                if a1 ~= "noCharges" then
                    return "Runs are temporarily locked for this account."
                end
                return "No daily plays left today."
            end
            return "That game is locked \226\128\148 join the group and press UNLOCK on its card."
        end
        return "That game isn't available yet."
    end
    return "Your data is still loading \226\128\148 try again in a moment."
end
local tbl_15 = {}
tbl_15.GameSessionController = u2
return tbl_15