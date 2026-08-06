-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local GamepadService_upv_1 = v1.GamepadService
local GuiService_upv_1 = v1.GuiService
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local UserInputService_upv_1 = v1.UserInputService
local GamepadHintBar_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "common", "gamepad-hint-bar").GamepadHintBar
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "common", "gamepad-input").gamepadInput
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms")
local isGameOverInputLocked_upv_1 = v2.isGameOverInputLocked
local sessionAtom_upv_1 = v2.sessionAtom
local inputDeviceAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "input-device-atom").inputDeviceAtom
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "match-atoms")
local liveOpponents_upv_1 = v3.liveOpponents
local matchAtom_upv_1 = v3.matchAtom
local matchIntents_upv_1 = v3.matchIntents
local spectateTargetAtom_upv_1 = v3.spectateTargetAtom
local sessionIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "session-intents").sessionIntents
local v4 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "settings-surface")
local closeHighwaySettings_upv_1 = v4.closeHighwaySettings
local closeSettings_upv_1 = v4.closeSettings
local v5 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local coinLeaderboardOpenAtom_upv_1 = v5.coinLeaderboardOpenAtom
local dailyBoardOpenAtom_upv_1 = v5.dailyBoardOpenAtom
local gamepadUiCaptureAtom_upv_1 = v5.gamepadUiCaptureAtom
local highwaySettingsOpenAtom_upv_1 = v5.highwaySettingsOpenAtom
local hubModeAtom_upv_1 = v5.hubModeAtom
local kitGameOverLiveAtom_upv_1 = v5.kitGameOverLiveAtom
local pausedAtom_upv_1 = v5.pausedAtom
local restartConfirmAtom_upv_1 = v5.restartConfirmAtom
local reviveAdPromptAtom_upv_1 = v5.reviveAdPromptAtom
local revivePacksOpenAtom_upv_1 = v5.revivePacksOpenAtom
local settingsOpenAtom_upv_1 = v5.settingsOpenAtom
local tetrisControlsOpenAtom_upv_1 = v5.tetrisControlsOpenAtom
local v6 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "input-glyphs")
local BACK_BUTTON_1 = v6.BACK_BUTTON
local CONFIRM_BUTTON_1 = v6.CONFIRM_BUTTON
local PAUSE_BUTTON_upv_1 = v6.PAUSE_BUTTON
local RESTART_BUTTON_upv_1 = v6.RESTART_BUTTON
local playUiSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "ui-sounds").playUiSound
local focusRegistry_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "focus-registry").focusRegistry
local FocusRing_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "focus-ring").FocusRing
local closeTetrisControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "tetris-controls-surface").closeTetrisControls
local readRoyaleLobbyActive_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "lobby-views").readRoyaleLobbyActive
local v7 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "scroll-stick")
local scrollByStick_upv_1 = v7.scrollByStick
local Gamepad1_upv_1 = Enum.UserInputType.Gamepad1
local tbl_upv_1 = {}
tbl_upv_1[Enum.KeyCode.DPadUp] = "up"
tbl_upv_1[Enum.KeyCode.DPadDown] = "down"
tbl_upv_1[Enum.KeyCode.DPadLeft] = "left"
tbl_upv_1[Enum.KeyCode.DPadRight] = "right"
local u1 = v7.STICK_SCROLL_SPEED_PX * 0.1
local ButtonL1_upv_1 = Enum.KeyCode.ButtonL1
local ButtonR1_upv_1 = Enum.KeyCode.ButtonR1
local tbl_2 = {}
tbl_2.keyCode = CONFIRM_BUTTON_1
local tbl_3 = {}
tbl_3.keyCode = BACK_BUTTON_1
local tbl_4 = {}
tbl_4.keyCode = BACK_BUTTON_1
local tbl_5 = {}
tbl_5.keyCode = BACK_BUTTON_1
local tbl_6 = {}
tbl_6.keyCode = RESTART_BUTTON_upv_1
local tbl_upv_7 = {}
tbl_upv_7.keyCode = Enum.KeyCode.Thumbstick2
local tbl_upv_8 = {}
tbl_upv_8.hub = {tbl_2}
tbl_upv_8.settings = {tbl_2, tbl_3}
tbl_upv_8.revives = {tbl_2, tbl_3}
tbl_upv_8.coinBoard = {tbl_2, tbl_3}
tbl_upv_8.dailyBoard = {tbl_2, tbl_3}
tbl_upv_8.highwaySettings = {tbl_2, tbl_3}
tbl_upv_8.tetrisControls = {tbl_2, tbl_3}
tbl_upv_8.lobbyDuel = {tbl_2, tbl_4}
tbl_upv_8.lobbyRoyale = {tbl_2, tbl_4}
tbl_upv_8.pause = {tbl_2, tbl_6, {keyCode = BACK_BUTTON_1}}
tbl_upv_8.restartConfirm = {tbl_2, {keyCode = BACK_BUTTON_1}}
tbl_upv_8.gameOver = {tbl_2, tbl_6, tbl_5}
tbl_upv_8.dailyGameOver = {tbl_2, tbl_6, tbl_5}
tbl_upv_8.matchResults = {tbl_2, tbl_5}
tbl_upv_8.matchSpectate = {{keyCode = CONFIRM_BUTTON_1}}
tbl_upv_8.victory = {tbl_2}
tbl_upv_8.reviveAd = {tbl_2}
local tbl_upv_9 = {}
local tbl_upv_10 = {}
tbl_upv_10.settings = true
tbl_upv_10.highwaySettings = true
tbl_upv_10.tetrisControls = true
tbl_upv_10.pause = true
local tbl_upv_11 = {}
tbl_upv_11.pause = true
tbl_upv_11.gameOver = true
tbl_upv_11.dailyGameOver = true
local tbl_upv_12 = {}
tbl_upv_12.gameOver = true
tbl_upv_12.dailyGameOver = true
tbl_upv_12.restartConfirm = true
local function centerOf_1(a1)
    --[[
      name: centerOf
      line: 179
    ]]
    return a1.AbsolutePosition + (a1.AbsoluteSize * 0.5)
end
local tbl_13 = {}
local tbl_14 = {}
tbl_14.__tostring = function()
    --[[
      name: __tostring
      line: 203
    ]]
    return "GamepadNavController"
end
local u2 = setmetatable(tbl_13, tbl_14)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 208
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v8 = setmetatable({}, u2)
    return v8:constructor(...) or v8
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 212
      upvalues:
        FocusRing_upv_1 (copy, index: 1)
        GamepadHintBar_upv_1 (copy, index: 2)
    ]]
    a1.ring = FocusRing_upv_1.new()
    a1.hintBar = GamepadHintBar_upv_1.new({})
    a1.selectionAnchor = a1:buildSelectionAnchor()
    a1.focusMemory = {}
    a1.pageableAdvertised = false
    a1.scopeToken = 0
    a1.nextRepeatAt = 0
    a1.stickNavEngaged = false
end
u2.onStart = function(a1)
    --[[
      name: onStart
      line: 224
      upvalues:
        GuiService_upv_1 (copy, index: 1)
        subscribe_upv_1 (copy, index: 2)
        inputDeviceAtom_upv_1 (copy, index: 3)
        UserInputService_upv_1 (copy, index: 4)
        focusRegistry_upv_1 (copy, index: 5)
    ]]
    GuiService_upv_1.AutoSelectGuiEnabled = false
    GuiService_upv_1.GuiNavigationEnabled = false
    a1:disableEngineCursor()
    a1:trackEngineCursor()
    a1:holdSelectionEmptyDuringPlay()
    subscribe_upv_1(
        function()
            --[[
              line: 235
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:resolveScope()
        end,
        function(a2)
            --[[
              line: 237
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onScopeChanged(a2)
        end
    )
    a1:onScopeChanged(a1:resolveScope())
    subscribe_upv_1(
        inputDeviceAtom_upv_1,
        function(a3)
            --[[
              line: 241
              upvalues:
                a1 (copy, index: 1)
            ]]
            if a3 == "gamepad" then
                if a1.scope ~= nil and a1.focused == nil then
                    a1:scheduleInitialFocus()
                end
            else
                a1:setFocus(nil)
            end
            if a3 == "gamepad" then
                a1:disableEngineCursor()
            end
            a1:applySelectionAnchor()
        end
    )
    UserInputService_upv_1.InputBegan:Connect(
        function(a4, a5)
            --[[
              line: 256
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputBegan(a4, a5)
        end
    )
    UserInputService_upv_1.InputEnded:Connect(
        function(a6)
            --[[
              line: 259
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputEnded(a6)
        end
    )
    UserInputService_upv_1.InputChanged:Connect(
        function(a7)
            --[[
              line: 262
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputChanged(a7)
        end
    )
    focusRegistry_upv_1.onInvalidated:Connect(
        function(a8)
            --[[
              line: 265
              upvalues:
                a1 (copy, index: 1)
            ]]
            if a1.focused == nil or a1.focused.instance ~= a8 then
                return
            end
            a1:scheduleInitialFocus()
        end
    )
    focusRegistry_upv_1.onScopeScrollerChanged:Connect(
        function(a9)
            --[[
              line: 272
              upvalues:
                a1 (copy, index: 1)
            ]]
            if a9 == a1.scope then
                a1:watchScopeCanvas()
                a1:syncPageHints()
            else
                return nil
            end
        end
    )
end
u2.disableEngineCursor = function(a1)
    --[[
      name: disableEngineCursor
      line: 280
      upvalues:
        GamepadService_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    local success_1, v9 = pcall(
        function()
            --[[
              line: 281
              upvalues:
                GamepadService_upv_1 (copy, index: 1)
            ]]
            return GamepadService_upv_1:DisableGamepadCursor()
        end
    )
    if (success_1) or not RunService_upv_1:IsStudio() then
        return
    end
    print((("[GamepadNav] cursor off failed: %*"):format(tostring(v9))))
end
u2.trackEngineCursor = function(a1)
    --[[
      name: trackEngineCursor
      line: 288
      upvalues:
        RunService_upv_1 (copy, index: 1)
        GamepadService_upv_1 (copy, index: 2)
    ]]
    local success_2
    if RunService_upv_1:IsStudio() then
        local success_2, v10 = pcall(
            function()
                --[[
                  line: 292
                  upvalues:
                    GamepadService_upv_1 (copy, index: 1)
                ]]
                return GamepadService_upv_1:GetPropertyChangedSignal("GamepadCursorEnabled")
            end
        )
        if success_2 and v10 ~= nil then
            v10:Connect(
                function()
                    --[[
                      line: 298
                      upvalues:
                        GamepadService_upv_1 (copy, index: 1)
                    ]]
                    return print(("[GamepadNav] engine cursor -> %*"):format(tostring(GamepadService_upv_1.GamepadCursorEnabled)))
                end
            )
        else
            return nil
        end
    else
        return nil
    end
end
u2.buildSelectionAnchor = function(a1)
    --[[
      name: buildSelectionAnchor
      line: 302
      upvalues:
        Players_upv_1 (copy, index: 1)
    ]]
    local v11 = Instance.new("ScreenGui")
    v11.Name = "GamepadSelectionAnchor"
    v11.ResetOnSpawn = false
    v11.IgnoreGuiInset = true
    v11.DisplayOrder = -1
    v11.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    local v12 = Instance.new("TextButton")
    v12.Name = "Anchor"
    v12.Text = ""
    v12.BackgroundTransparency = 1
    v12.Size = UDim2.fromOffset(1, 1)
    v12.Position = UDim2.fromOffset(0, 0)
    v12.Selectable = true
    v12.Parent = v11
    return v12
end
u2.holdSelectionEmptyDuringPlay = function(a1)
    --[[
      name: holdSelectionEmptyDuringPlay
      line: 319
      upvalues:
        GuiService_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    GuiService_upv_1:GetPropertyChangedSignal("SelectedObject"):Connect(
        function()
            --[[
              line: 320
              upvalues:
                a1 (copy, index: 1)
                GuiService_upv_1 (copy, index: 2)
                RunService_upv_1 (copy, index: 3)
            ]]
            if a1.scope == nil and GuiService_upv_1.SelectedObject ~= nil then
                if RunService_upv_1:IsStudio() then
                    print((("[GamepadNav] cleared stray UI selection during play: %*"):format(GuiService_upv_1.SelectedObject)))
                end
                GuiService_upv_1.SelectedObject = nil
                return
            end
            return nil
        end
    )
end
u2.applySelectionAnchor = function(a1)
    --[[
      name: applySelectionAnchor
      line: 330
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
        GuiService_upv_1 (copy, index: 2)
    ]]
    local v13 = false
    if a1.scope ~= nil then
        v13 = inputDeviceAtom_upv_1() == "gamepad"
    end
    local v14
    if v13 then
        v14 = a1.selectionAnchor
    else
        v14 = nil
    end
    if GuiService_upv_1.SelectedObject ~= v14 then
        GuiService_upv_1.SelectedObject = v14
    else
        return nil
    end
end
u2.openPopupScope = function(a1)
    --[[
      name: openPopupScope
      line: 338
      upvalues:
        settingsOpenAtom_upv_1 (copy, index: 1)
        highwaySettingsOpenAtom_upv_1 (copy, index: 2)
        tetrisControlsOpenAtom_upv_1 (copy, index: 3)
    ]]
    local v15 = settingsOpenAtom_upv_1()
    local v16 = highwaySettingsOpenAtom_upv_1()
    local v17 = tetrisControlsOpenAtom_upv_1()
    if v15 then
        return "settings"
    end
    if v16 then
        return "highwaySettings"
    elseif v17 then
        return "tetrisControls"
    else
        return nil
    end
end
u2.resolveScope = function(a1)
    --[[
      name: resolveScope
      line: 353
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        revivePacksOpenAtom_upv_1 (copy, index: 2)
        coinLeaderboardOpenAtom_upv_1 (copy, index: 3)
        dailyBoardOpenAtom_upv_1 (copy, index: 4)
        readRoyaleLobbyActive_upv_1 (copy, index: 5)
        hubModeAtom_upv_1 (copy, index: 6)
        reviveAdPromptAtom_upv_1 (copy, index: 7)
        matchAtom_upv_1 (copy, index: 8)
        spectateTargetAtom_upv_1 (copy, index: 9)
        liveOpponents_upv_1 (copy, index: 10)
        Players_upv_1 (copy, index: 11)
        kitGameOverLiveAtom_upv_1 (copy, index: 12)
        restartConfirmAtom_upv_1 (copy, index: 13)
        pausedAtom_upv_1 (copy, index: 14)
    ]]
    local v18 = sessionAtom_upv_1()
    local v19 = a1:openPopupScope()
    if v18 ~= nil then
        if v19 == nil then
            if v18.reviveState == "none" then
                local v20 = v18.phase == "dying"
                local v21 = nil
                if v20 then
                    v21 = reviveAdPromptAtom_upv_1()
                    if v21 ~= nil then
                        v21 = v21.runId
                    end
                    if v21 == v18.runId then
                        v20 = true
                    else
                        v20 = false
                    end
                end
                if v20 then
                    return "reviveAd"
                elseif v18.mode == "match" then
                    v21 = matchAtom_upv_1()
                    local v22
                    if v21 == nil then
                        v22 = v21
                    else
                        v22 = v21.phase
                    end
                    if v22 ~= "ended" then
                        if spectateTargetAtom_upv_1() ~= nil and #liveOpponents_upv_1(v21, Players_upv_1.LocalPlayer.UserId) > 1 then
                            return "matchSpectate"
                        end
                        return nil
                    end
                    return "matchResults"
                elseif v18.phase ~= "gameOver" then
                    if restartConfirmAtom_upv_1() == nil then
                        if pausedAtom_upv_1() then
                            return "pause"
                        end
                        return nil
                    end
                    return "restartConfirm"
                elseif v18.mode == "daily" and not (kitGameOverLiveAtom_upv_1()) then
                    return "dailyGameOver"
                else
                    return "gameOver"
                end
            else
                return nil
            end
        else
            return v19
        end
    elseif v19 == nil then
        if revivePacksOpenAtom_upv_1() then
            return "revives"
        elseif coinLeaderboardOpenAtom_upv_1() then
            return "coinBoard"
        elseif dailyBoardOpenAtom_upv_1() then
            return "dailyBoard"
        else
            local v23
            if readRoyaleLobbyActive_upv_1() then
                return "lobbyRoyale"
            end
            v23 = hubModeAtom_upv_1()
            if v23 ~= "duel" then
                if v23 ~= "royale" then
                    return "hub"
                end
                return "lobbyRoyale"
            end
            return "lobbyDuel"
        end
    else
        return v19
    end
end
u2.onScopeChanged = function(a1, a2)
    --[[
      name: onScopeChanged
      line: 450
      upvalues:
        tbl_upv_9 (copy, index: 1)
        gamepadUiCaptureAtom_upv_1 (copy, index: 2)
        inputDeviceAtom_upv_1 (copy, index: 3)
    ]]
    if a2 ~= a1.scope then
        a1.scope = a2
        a1.scopeToken = a1.scopeToken + 1
        a1:setFocus(nil)
        a1:clearHeldDirection()
        local hintBar_1 = false
        if a2 ~= nil then
            hintBar_1 = a1:pageableScroller(a2) ~= nil
        end
        a1.pageableAdvertised = hintBar_1
        hintBar_1 = a1.hintBar
        local v24
        if a2 == nil then
            v24 = tbl_upv_9
        else
            v24 = a1:hintsFor(a2)
        end
        hintBar_1:setEntries(v24)
        a1:applySelectionAnchor()
        gamepadUiCaptureAtom_upv_1(
            function()
                --[[
                  line: 461
                  upvalues:
                    a2 (copy, index: 1)
                ]]
                return a2 ~= nil
            end
        )
        if a2 ~= nil and inputDeviceAtom_upv_1() == "gamepad" then
            a1:scheduleInitialFocus()
        end
        a1:updateHeartbeat()
        a1:watchScopeCanvas()
    else
        return nil
    end
end
u2.hintsFor = function(a1, a2)
    --[[
      name: hintsFor
      line: 470
      upvalues:
        tbl_upv_8 (copy, index: 1)
        focusRegistry_upv_1 (copy, index: 2)
        tbl_upv_7 (copy, index: 3)
        ButtonL1_upv_1 (copy, index: 4)
        ButtonR1_upv_1 (copy, index: 5)
    ]]
    local tbl_15 = {}
    local v25 = tbl_upv_8[a2]
    table.move(v25, 1, #v25, #tbl_15 + 1, tbl_15)
    for _, value_1 in focusRegistry_upv_1:shortcutsFor(a2) do
        table.insert(tbl_15, {keyCode = value_1.keyCode, label = value_1.label})
    end
    if a1:pageableScroller(a2) ~= nil then
        table.insert(tbl_15, tbl_upv_7)
        table.insert(tbl_15, {keyCode = ButtonL1_upv_1})
        table.insert(tbl_15, {keyCode = ButtonR1_upv_1})
    end
    return tbl_15
end
u2.watchScopeCanvas = function(a1)
    --[[
      name: watchScopeCanvas
      line: 498
      upvalues:
        focusRegistry_upv_1 (copy, index: 1)
    ]]
    local canvasWatch_1 = a1.canvasWatch
    if canvasWatch_1 ~= nil then
        canvasWatch_1:Disconnect()
    end
    a1.canvasWatch = nil
    local scope_1 = a1.scope
    local v26 = nil
    if scope_1 ~= nil then
        v26 = focusRegistry_upv_1:scopeScrollerFor(scope_1)
        if v26 ~= nil then
            a1.canvasWatch = v26:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(
                function()
                    --[[
                      line: 512
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:syncPageHints()
                end
            )
        else
            return nil
        end
    else
        return nil
    end
end
u2.syncPageHints = function(a1)
    --[[
      name: syncPageHints
      line: 516
    ]]
    local scope_2 = a1.scope
    if scope_2 ~= nil then
        local v27 = a1:pageableScroller(scope_2) ~= nil
        if v27 ~= a1.pageableAdvertised then
            a1.pageableAdvertised = v27
            a1.hintBar:setEntries(a1:hintsFor(scope_2))
        else
            return nil
        end
    else
        return nil
    end
end
local function isShown_upv_1(a1)
    --[[
      name: isShown
      line: 163
    ]]
    if a1.Visible then
        local Parent_1 = a1.Parent
        while Parent_1 ~= nil do
            if Parent_1:IsA("ScreenGui") then
                return Parent_1.Enabled
            elseif not (Parent_1:IsA("GuiObject")) or Parent_1.Visible then
                Parent_1 = Parent_1.Parent
                continue
            else
                return false
            end
        end
    end
    return false
end
u2.pageableScroller = function(a1, a2)
    --[[
      name: pageableScroller
      line: 528
      upvalues:
        focusRegistry_upv_1 (copy, index: 1)
        isShown_upv_1 (copy, index: 2)
    ]]
    local v28 = focusRegistry_upv_1:scopeScrollerFor(a2)
    local v29 = nil
    if v28 == nil then
        v29 = a1.focused
        if v29 ~= nil then
            v29 = v29.scroller
        end
        v28 = v29
    end
    if v28 ~= nil and isShown_upv_1(v28) then
        if v28.AbsoluteSize.Y + 12 >= v28.AbsoluteCanvasSize.Y then
            return nil
        end
        return v28
    end
    return nil
end
u2.pageBy = function(a1, a2)
    --[[
      name: pageBy
      line: 543
      upvalues:
        playUiSound_upv_1 (copy, index: 1)
    ]]
    local scope_3 = a1.scope
    local v30 = nil
    if scope_3 ~= nil then
        v30 = a1:pageableScroller(scope_3)
        local v31 = nil
        if v30 ~= nil then
            local Y_1 = v30.AbsoluteSize.Y
            v31 = math.clamp(v30.CanvasPosition.Y + (a2 * Y_1), 0, math.max(v30.AbsoluteCanvasSize.Y - Y_1, 0))
            local v32 = nil
            if v31 ~= v30.CanvasPosition.Y then
                v32 = a1.focused
                if v32 ~= nil then
                    v32 = v32.scrollAdapter
                end
                if v32 == nil then
                    v30.CanvasPosition = Vector2.new(v30.CanvasPosition.X, v31)
                else
                    a1.focused.scrollAdapter(v31)
                end
                playUiSound_upv_1("uiHover", {})
                a1:focusNearestTopOf(v30, v31)
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u2.focusNearestTopOf = function(a1, a2, a3)
    --[[
      name: focusNearestTopOf
      line: 572
      upvalues:
        focusRegistry_upv_1 (copy, index: 1)
        isShown_upv_1 (copy, index: 2)
    ]]
    local v33 = nil
    local v34 = math.huge
    local v35 = nil
    local v36 = nil
    for key_1 in focusRegistry_upv_1:all() do
        if key_1.scope ~= a1.scope or key_1.scroller ~= a2 then
            continue
        end
        v36 = isShown_upv_1(key_1.instance)
        if not (v36) then
            continue
        end
        v35 = math.abs(((key_1.instance.AbsolutePosition.Y - a2.AbsolutePosition.Y) + a2.CanvasPosition.Y) - a3) * 2 + key_1.instance.AbsolutePosition.X
        if v34 > v35 then
            v34, v33 = v35, key_1
        end
    end
    if v33 == nil then
        return
    end
    a1:setFocus(v33)
end
u2.scheduleInitialFocus = function(a1)
    --[[
      name: scheduleInitialFocus
      line: 591
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
    ]]
    local scopeToken_upv_1 = a1.scopeToken
    task.delay(
        0,
        function()
            --[[
              line: 593
              upvalues:
                scopeToken_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                inputDeviceAtom_upv_1 (copy, index: 3)
            ]]
            if scopeToken_upv_1 == a1.scopeToken and a1.scope ~= nil then
                if inputDeviceAtom_upv_1() == "gamepad" then
                    a1:applyInitialFocus()
                    a1.pageableAdvertised = a1:pageableScroller(a1.scope) ~= nil
                    a1.hintBar:setEntries(a1:hintsFor(a1.scope))
                    return
                end
                return nil
            end
            return nil
        end
    )
end
u2.applyInitialFocus = function(a1)
    --[[
      name: applyInitialFocus
      line: 608
      upvalues:
        tbl_upv_12 (copy, index: 1)
        focusRegistry_upv_1 (copy, index: 2)
        isShown_upv_1 (copy, index: 3)
    ]]
    local scope_4 = a1.scope
    if scope_4 ~= nil then
        local v38
        if tbl_upv_12[scope_4] == nil then
            v38 = a1.focusMemory[scope_4]
        else
            v38 = nil
        end
        local v39 = nil
        local v40 = math.huge
        local v41 = nil
        local v42 = nil
        local v43 = nil
        for key_2 in focusRegistry_upv_1:all() do
            if key_2.scope ~= scope_4 then
                continue
            end
            v41 = isShown_upv_1(key_2.instance)
            if not (v41) then
                continue
            end
            if v38 == nil or key_2.focusKey ~= v38 and key_2.instance ~= v38 then
                v42 = key_2.instance
                local v44 = v42.AbsolutePosition + v42.AbsoluteSize * 0.5
                v42 = key_2.priority
                if v42 == nil then
                    v42 = 0
                end
                v43 = (-v42 * 1e+06) + (v44.Y * 1000) + v44.X
                if v43 < v40 then
                    v39, v40 = key_2, v43
                    continue
                end
            end
            v39 = key_2
            break
        end
        if v39 ~= nil then
            a1:setFocus(v39)
        end
    else
        return nil
    end
end
u2.setFocus = function(a1, a2)
    --[[
      name: setFocus
      line: 644
      upvalues:
        playUiSound_upv_1 (copy, index: 1)
    ]]
    local focused_1 = a1.focused
    local v45 = nil
    if focused_1 ~= a2 then
        if focused_1 ~= nil then
            v45 = v45.onFocus
            if v45 ~= nil then
                v45(false)
            end
        end
        a1.focused = a2
        if a2 ~= nil then
            a1.ring:attach(a2.instance, a2.onFocus == nil)
            if a2.onFocus == nil then
                playUiSound_upv_1("uiHover", {})
            else
                a2.onFocus(true)
            end
            a1:scrollIntoView(a2)
            local v46 = nil
            if a1.scope ~= nil then
                local focusMemory_1 = a1.focusMemory
                local scope_5 = a1.scope
                v46 = a2.focusKey
                if v46 == nil then
                    v46 = a2.instance
                end
                focusMemory_1[scope_5] = v46
            end
        else
            a1.ring:detach()
            return nil
        end
    else
        return nil
    end
end
u2.onInputBegan = function(a1, a2, a3)
    --[[
      name: onInputBegan
      line: 681
      upvalues:
        Gamepad1_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
        GamepadService_upv_1 (copy, index: 3)
        inputDeviceAtom_upv_1 (copy, index: 4)
        UserInputService_upv_1 (copy, index: 5)
        GuiService_upv_1 (copy, index: 6)
        tbl_upv_1 (copy, index: 7)
        PAUSE_BUTTON_upv_1 (copy, index: 8)
        tbl_upv_10 (copy, index: 9)
        ButtonL1_upv_1 (copy, index: 10)
        ButtonR1_upv_1 (copy, index: 11)
        RESTART_BUTTON_upv_1 (copy, index: 12)
        tbl_upv_11 (copy, index: 13)
        sessionIntents_upv_1 (copy, index: 14)
        focusRegistry_upv_1 (copy, index: 15)
        playUiSound_upv_1 (copy, index: 16)
    ]]
    if a2.UserInputType == Gamepad1_upv_1 then
        local v47 = nil
        if RunService_upv_1:IsStudio() then
            local _, v48 = pcall(
                function()
                    --[[
                      line: 686
                      upvalues:
                        GamepadService_upv_1 (copy, index: 1)
                    ]]
                    return GamepadService_upv_1.GamepadCursorEnabled
                end
            )
            local v49 = ("[GamepadNav] %* processed=%* device=%*"):format(a2.KeyCode.Name, a3, inputDeviceAtom_upv_1())
            local v50 = a1.scope or "none"
            v47 = a1.focused
            if v47 ~= nil then
                v47 = v47.instance.Name
            end
            local v51
            if v47 ~= nil then
                v51 = v47
            else
                v51 = "none"
            end
            local v52 = (" scope=%* focus=%*"):format(v50, v51)
            local str_1 = tostring(v48)
            local v53 = UserInputService_upv_1:GetFocusedTextBox() ~= nil
            print(v49 .. v52 .. (" cursor=%* textbox=%*"):format(str_1, v53))
        end
    end
    if a1.scope ~= nil and a2.UserInputType == Gamepad1_upv_1 then
        if a3 and GuiService_upv_1.MenuIsOpen then
            return nil
        end
        local v54 = nil
        if UserInputService_upv_1:GetFocusedTextBox() == nil then
            v54 = tbl_upv_1[a2.KeyCode]
            if v54 == nil then
                local v55 = a2.KeyCode == PAUSE_BUTTON_upv_1
                if v55 then
                    v55 = tbl_upv_10[a1.scope] ~= nil
                end
                if v55 then
                    a1:fireBack()
                    return nil
                elseif a2.KeyCode == ButtonL1_upv_1 then
                    if a1:pageableScroller(a1.scope) == nil then
                        local v56 = a2.KeyCode == RESTART_BUTTON_upv_1
                        if v56 then
                            v56 = tbl_upv_11[a1.scope] ~= nil
                        end
                        if not v56 then
                            return
                        end
                        sessionIntents_upv_1.restart:Fire()
                    else
                        a1:pageBy(((a2.KeyCode ~= ButtonL1_upv_1) and 1) or -1)
                    end
                    return nil
                elseif a2.KeyCode ~= ButtonR1_upv_1 then
                    for _, value_2 in focusRegistry_upv_1:shortcutsFor(a1.scope) do
                        if value_2.keyCode ~= a2.KeyCode then
                            continue
                        end
                        playUiSound_upv_1("uiHover", {})
                        value_2.invoke()
                        return nil
                    end
                    if a2.KeyCode == Enum.KeyCode.ButtonA then
                        a1:activateFocused()
                    elseif a2.KeyCode == Enum.KeyCode.ButtonB then
                        a1:fireBack()
                    end
                elseif a1:pageableScroller(a1.scope) == nil then
                    local v56 = a2.KeyCode == RESTART_BUTTON_upv_1
                    if v56 then
                        v56 = tbl_upv_11[a1.scope] ~= nil
                    end
                    if not v56 then
                        return
                    end
                    sessionIntents_upv_1.restart:Fire()
                else
                    a1:pageBy(((a2.KeyCode ~= ButtonL1_upv_1) and 1) or -1)
                end
            else
                a1:beginHeldDirection(v54, "dpad")
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u2.onInputEnded = function(a1, a2)
    --[[
      name: onInputEnded
      line: 775
      upvalues:
        Gamepad1_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v57 = nil
    if a2.UserInputType == Gamepad1_upv_1 then
        v57 = tbl_upv_1[a2.KeyCode]
        if v57 ~= nil and a1.heldSource == "dpad" and a1.heldDirection == v57 then
            a1:clearHeldDirection()
        end
    else
        return nil
    end
end
u2.onInputChanged = function(a1, a2)
    --[[
      name: onInputChanged
      line: 785
      upvalues:
        Gamepad1_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
    ]]
    if a1.scope ~= nil and a2.UserInputType == Gamepad1_upv_1 then
        if a2.KeyCode == Enum.KeyCode.Thumbstick1 then
            local X_1 = a2.Position.X
            local Y_2 = a2.Position.Y
            local v58 = math.sqrt((X_1 * X_1) + (Y_2 * Y_2))
            if a1.stickNavEngaged then
                if v58 <= 0.35 then
                    a1.stickNavEngaged = false
                    if a1.heldSource == "stick" then
                        a1:clearHeldDirection()
                    end
                end
                return
            end
            if v58 >= 0.5 then
                local v59 = nil
                if UserInputService_upv_1:GetFocusedTextBox() == nil then
                    a1.stickNavEngaged = true
                    v59 = math.abs(X_1)
                    local v60
                    if math.abs(Y_2) > v59 then
                        v60 = ((Y_2 <= 0) and "down") or "up"
                    else
                        v60 = ((X_1 <= 0) and "left") or "right"
                    end
                    a1:beginHeldDirection(v60, "stick")
                    return
                end
            end
        end
        return nil
    end
    return nil
end
u2.beginHeldDirection = function(a1, a2, a3)
    --[[
      name: beginHeldDirection
      line: 813
    ]]
    a1.heldDirection = a2
    a1.heldSource = a3
    a1.nextRepeatAt = os.clock() + 0.35
    a1:applyDirection(a2)
end
u2.clearHeldDirection = function(a1)
    --[[
      name: clearHeldDirection
      line: 819
    ]]
    a1.heldDirection = nil
    a1.heldSource = nil
end
u2.updateHeartbeat = function(a1)
    --[[
      name: updateHeartbeat
      line: 823
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    local v61 = a1.scope ~= nil
    if (not v61 or a1.heartbeat ~= nil) and not (v61) then
        if a1.heartbeat == nil then
            return
        end
        a1.heartbeat:Disconnect()
        a1.heartbeat = nil
    end
    a1.heartbeat = RunService_upv_1.Heartbeat:Connect(
        function(a2)
            --[[
              line: 826
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onHeartbeat(a2)
        end
    )
end
u2.onHeartbeat = function(a1, a2)
    --[[
      name: onHeartbeat
      line: 834
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
        focusRegistry_upv_1 (copy, index: 2)
        isShown_upv_1 (copy, index: 3)
        scrollByStick_upv_1 (copy, index: 4)
        gamepadInput_upv_1 (copy, index: 5)
    ]]
    if a1.heldDirection ~= nil and a1.nextRepeatAt <= os.clock() then
        a1.nextRepeatAt = os.clock() + 0.1
        a1:applyDirection(a1.heldDirection)
    end
    local scope_6 = a1.scope
    if scope_6 ~= nil then
        local v62 = nil
        if inputDeviceAtom_upv_1() == "gamepad" then
            v62 = focusRegistry_upv_1:scopeScrollerFor(scope_6)
            if v62 ~= nil and isShown_upv_1(v62) then
                scrollByStick_upv_1(v62, gamepadInput_upv_1:rightY(), a2)
                return
            end
            return nil
        end
    end
    return nil
end
u2.applyDirection = function(a1, a2)
    --[[
      name: applyDirection
      line: 849
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
        isShown_upv_1 (copy, index: 2)
    ]]
    local v63 = nil
    if inputDeviceAtom_upv_1() == "gamepad" then
        v63 = a1.focused
        if v63 ~= nil and isShown_upv_1(v63.instance) then
            if v63.adjust == nil or a2 ~= "left" and a2 ~= "right" then
                a1:moveFocus(v63, a2)
                return
            end
            v63.adjust(((a2 ~= "left") and 1) or -1)
            return nil
        end
        a1:applyInitialFocus()
    end
    return nil
end
u2.moveFocus = function(a1, a2, a3)
    --[[
      name: moveFocus
      line: 866
    ]]
    if a1.scope ~= nil then
        local v64
        if a2.scroller == nil then
            v64 = nil
        else
            v64 = a1:nearestAlong(
                a2,
                a3,
                function(a4)
                    --[[
                      line: 871
                      upvalues:
                        a2 (copy, index: 1)
                    ]]
                    return a4.scroller == a2.scroller
                end
            )
        end
        local v65
        v65 = v64
            or a1:nearestAlong(
                a2,
                a3,
                function()
                    --[[
                      line: 874
                    ]]
                    return true
                end
            )
        if v65 == nil then
            a1:scrollBy(a3)
        else
            a1:setFocus(v65)
            return nil
        end
    else
        return nil
    end
end
u2.scrollBy = function(a1, a2)
    --[[
      name: scrollBy
      line: 887
      upvalues:
        focusRegistry_upv_1 (copy, index: 1)
        isShown_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    if a2 ~= "up" and a2 ~= "down" then
        return nil
    end
    local scope_7 = a1.scope
    local v66 = nil
    if scope_7 ~= nil then
        v66 = focusRegistry_upv_1:scopeScrollerFor(scope_7)
        local v67 = nil
        if v66 == nil then
            v67 = a1.focused
            if v67 ~= nil then
                v67 = v67.scroller
            end
            v66 = v67
        end
        if v66 ~= nil then
            local v68 = nil
            if isShown_upv_1(v66) then
                local v69 = math.max(v66.AbsoluteCanvasSize.Y - v66.AbsoluteSize.Y, 0)
                local v70
                if a2 ~= "down" then
                    v70 = -u1
                else
                    v70 = u1
                end
                v68 = math.clamp(v66.CanvasPosition.Y + v70, 0, v69)
                local v71 = nil
                if v68 ~= v66.CanvasPosition.Y then
                    v71 = a1.focused
                    if v71 ~= nil then
                        v71 = v71.scrollAdapter
                    end
                    if v71 == nil then
                        v66.CanvasPosition = Vector2.new(v66.CanvasPosition.X, v68)
                    else
                        a1.focused.scrollAdapter(v68)
                    end
                    return
                end
                return nil
            end
        end
    end
    return nil
end
u2.nearestAlong = function(a1, a2, a3, a4)
    --[[
      name: nearestAlong
      line: 925
      upvalues:
        focusRegistry_upv_1 (copy, index: 1)
        isShown_upv_1 (copy, index: 2)
    ]]
    local instance_1 = a2.instance
    local v72 = instance_1.AbsolutePosition + instance_1.AbsoluteSize * 0.5
    instance_1 = ((a3 == "left") and -1) or (((a3 ~= "right") and 0) or 1)
    local v73 = ((a3 == "up") and -1) or (((a3 ~= "down") and 0) or 1)
    local v74 = nil
    local v75 = math.huge
    local v76 = nil
    local v77 = nil
    local v78 = nil
    local _ = nil
    local v79 = nil
    local v80 = nil
    local v81 = nil
    local v82 = nil
    for key_3 in focusRegistry_upv_1:all() do
        if key_3 == a2 or key_3.scope ~= a1.scope then
            continue
        end
        v81 = isShown_upv_1(key_3.instance)
        if not (v81) then
            continue
        end
        v82 = a4(key_3)
        if not (v82) then
            continue
        end
        v76 = key_3.instance
        v79 = v76.AbsolutePosition + v76.AbsoluteSize * 0.5
        v76 = v79.X - v72.X
        v77 = v79.Y - v72.Y
        v78 = v76 * instance_1 + v77 * v73
        if v78 < 4 then
            continue
        end
        v80 = v78 + (math.abs(v76 * v73) + math.abs(v77 * instance_1)) * 2
        if v80 < v75 then
            v75, v74 = v80, key_3
        end
    end
    return v74
end
u2.activateFocused = function(a1)
    --[[
      name: activateFocused
      line: 954
      upvalues:
        isShown_upv_1 (copy, index: 1)
    ]]
    local focused_2 = a1.focused
    if focused_2 ~= nil and isShown_upv_1(focused_2.instance) then
        focused_2.invoke()
    else
        a1:applyInitialFocus()
        return nil
    end
end
u2.fireBack = function(a1)
    --[[
      name: fireBack
      line: 962
      upvalues:
        focusRegistry_upv_1 (copy, index: 1)
        playUiSound_upv_1 (copy, index: 2)
    ]]
    local scope_8 = a1.scope
    local v83 = nil
    if scope_8 ~= nil then
        v83 = focusRegistry_upv_1:backHandlerFor(scope_8)
        if v83 == nil then
            a1:defaultBack(scope_8)
        else
            playUiSound_upv_1("uiBack", {})
            v83()
            return nil
        end
    else
        return nil
    end
end
u2.defaultBack = function(a1, a2)
    --[[
      name: defaultBack
      line: 978
      upvalues:
        closeSettings_upv_1 (copy, index: 1)
        closeHighwaySettings_upv_1 (copy, index: 2)
        closeTetrisControls_upv_1 (copy, index: 3)
        revivePacksOpenAtom_upv_1 (copy, index: 4)
        coinLeaderboardOpenAtom_upv_1 (copy, index: 5)
        dailyBoardOpenAtom_upv_1 (copy, index: 6)
        sessionIntents_upv_1 (copy, index: 7)
        sessionAtom_upv_1 (copy, index: 8)
        isGameOverInputLocked_upv_1 (copy, index: 9)
        matchIntents_upv_1 (copy, index: 10)
        playUiSound_upv_1 (copy, index: 11)
    ]]
    if a2 == "settings" then
        closeSettings_upv_1()
        return nil
    elseif a2 == "highwaySettings" then
        closeHighwaySettings_upv_1()
        return nil
    elseif a2 ~= "tetrisControls" then
        if a2 == "revives" then
            revivePacksOpenAtom_upv_1(
                function()
                    --[[
                      line: 995
                    ]]
                    return false
                end
            )
        elseif a2 == "coinBoard" then
            coinLeaderboardOpenAtom_upv_1(
                function()
                    --[[
                      line: 999
                    ]]
                    return false
                end
            )
        elseif a2 ~= "dailyBoard" then
            local v84 = nil
            if a2 ~= "pause" then
                if a2 ~= "gameOver" and a2 ~= "dailyGameOver" then
                    if a2 ~= "matchResults" then
                        return nil
                    end
                    matchIntents_upv_1.leaveMatch:Fire()
                    playUiSound_upv_1("uiBack", {})
                    return
                end
                v84 = sessionAtom_upv_1()
                if v84 ~= nil and v84.reviveState == "none" and not (isGameOverInputLocked_upv_1(v84)) then
                    sessionIntents_upv_1.exitToHub:Fire()
                    playUiSound_upv_1("uiBack", {})
                    return
                end
                return nil
            end
            sessionIntents_upv_1.togglePause:Fire()
        else
            dailyBoardOpenAtom_upv_1(
                function()
                    --[[
                      line: 1003
                    ]]
                    return false
                end
            )
        end
        playUiSound_upv_1("uiBack", {})
    else
        closeTetrisControls_upv_1()
        return nil
    end
end
u2.scrollIntoView = function(a1, a2)
    --[[
      name: scrollIntoView
      line: 1026
    ]]
    local scroller_1 = a2.scroller
    local v85, v86, v87 = nil, nil, nil
    if scroller_1 ~= nil then
        v85 = a2.instance.AbsolutePosition.Y - scroller_1.AbsolutePosition.Y + scroller_1.CanvasPosition.Y
        local Y_3 = a2.instance.AbsoluteSize.Y
        local Y_4 = scroller_1.AbsoluteSize.Y
        v86 = scroller_1.CanvasPosition.Y
        if v85 >= v86 + 12 then
            if (v86 + Y_4) - 12 < v85 + Y_3 then
                v86 = (v85 + Y_3) - Y_4 + 12
            end
        else
            v86 = v85 - 12
        end
        v87 = math.clamp(v86, 0, math.max(scroller_1.AbsoluteCanvasSize.Y - Y_4, 0))
        if v87 == scroller_1.CanvasPosition.Y then
            return nil
        elseif a2.scrollAdapter == nil then
            scroller_1.CanvasPosition = Vector2.new(scroller_1.CanvasPosition.X, v87)
        else
            a2.scrollAdapter(v87)
        end
    else
        return nil
    end
end
Reflect_1.defineMetadata(u2, "identifier", "client/controllers/gamepad-nav-controller@GamepadNavController")
Reflect_1.defineMetadata(u2, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u2, "$:flamework@Controller", Controller_1, {})
local tbl_16 = {}
tbl_16.GamepadNavController = u2
return tbl_16