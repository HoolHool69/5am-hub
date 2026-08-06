-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local Janitor_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "janitor", "src").Janitor
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local StarterGui_upv_1 = v1.StarterGui
local UserInputService_upv_1 = v1.UserInputService
local Workspace_upv_1 = v1.Workspace
local isConsoleDevice_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "input-device-atom").isConsoleDevice
local matchAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "match-atoms").matchAtom
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "orientation-atom")
local orientationAtom_upv_1 = v2.orientationAtom
local studioOrientationOverrideAtom_upv_1 = v2.studioOrientationOverrideAtom
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local coinLeaderboardOpenAtom_upv_1 = v3.coinLeaderboardOpenAtom
local dailyBoardOpenAtom_upv_1 = v3.dailyBoardOpenAtom
local hudHiddenAtom_upv_1 = v3.hudHiddenAtom
local revivePacksOpenAtom_upv_1 = v3.revivePacksOpenAtom
local settingsOpenAtom_upv_1 = v3.settingsOpenAtom
local isTouchDevice_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "use-input-device").isTouchDevice
local topbarInset_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "use-px").topbarInset
local v4 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "binding")
local bindAtom_upv_1 = v4.bindAtom
local onActivated_upv_1 = v4.onActivated
local setHoverGate_upv_1 = v4.setHoverGate
local CoinBoardView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "coin-board-view").CoinBoardView
local DailyView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "daily-view").DailyView
local GameHudView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "game-hud-view").GameHudView
local PhotoModeView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "photo-mode-view").PhotoModeView
local RestartButtonView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "restart-button-view").RestartButtonView
local RestartConfirmView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "restart-confirm-view").RestartConfirmView
local GameOverView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "game-over-view").GameOverView
local HudLeaderboardView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "hud-leaderboard-view").HudLeaderboardView
local HighwayRiderView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "highway-rider-view").HighwayRiderView
local HillClimbView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "hill-climb-view").HillClimbView
local PausedView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "paused-view").PausedView
local ReviveAdView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "revive-ad-view").ReviveAdView
local HighwaySettingsView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "highway-settings-view").HighwaySettingsView
local IcyTowerView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "icy-tower-view").IcyTowerView
local TetrisHandlingPanel_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "tetris-handling-panel").TetrisHandlingPanel
local TetrisKeybindsView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "tetris-keybinds-view").TetrisKeybindsView
local TimbermanView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "timberman-view").TimbermanView
local GotdBoardView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "gotd-board-view").GotdBoardView
local HubView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "hub-view").HubView
local v5 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "lobby-views")
local ModeLobbyView_upv_1 = v5.ModeLobbyView
local readRoyaleLobbyActive_upv_1 = v5.readRoyaleLobbyActive
local PortraitGameUi_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "portrait-game-ui").PortraitGameUi
local PortraitLayout_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "portrait-layout").PortraitLayout
local resolveKitUi_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "kit-view").resolveKitUi
local RevivesView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "revives-view").RevivesView
local SettingsView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "settings-view").SettingsView
local TilesView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "tiles-view").TilesView
local VictoryView_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "victory-view").VictoryView
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local u1 = UDim2.fromScale(0.165, 0.75)
local u2 = UDim.new(0.06, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 110
    ]]
    return "KitUiController"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 115
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v6 = setmetatable({}, u3)
    return v6:constructor(...) or v6
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 119
      upvalues:
        Janitor_upv_1 (copy, index: 1)
    ]]
    a1.colorSchemes = a2
    a1.janitor = Janitor_upv_1.new()
end
u3.onStart = function(a1)
    --[[
      name: onStart
      line: 123
      upvalues:
        Players_upv_1 (copy, index: 1)
        StarterGui_upv_1 (copy, index: 2)
        RunService_upv_1 (copy, index: 3)
        resolveKitUi_upv_1 (copy, index: 4)
        PortraitLayout_upv_1 (copy, index: 5)
        PortraitGameUi_upv_1 (copy, index: 6)
        HubView_upv_1 (copy, index: 7)
        TilesView_upv_1 (copy, index: 8)
        DailyView_upv_1 (copy, index: 9)
        SettingsView_upv_1 (copy, index: 10)
        RevivesView_upv_1 (copy, index: 11)
        CoinBoardView_upv_1 (copy, index: 12)
        GotdBoardView_upv_1 (copy, index: 13)
        ModeLobbyView_upv_1 (copy, index: 14)
        VictoryView_upv_1 (copy, index: 15)
        PhotoModeView_upv_1 (copy, index: 16)
        RestartButtonView_upv_1 (copy, index: 17)
        GameHudView_upv_1 (copy, index: 18)
        HudLeaderboardView_upv_1 (copy, index: 19)
        HighwayRiderView_upv_1 (copy, index: 20)
        HillClimbView_upv_1 (copy, index: 21)
        HighwaySettingsView_upv_1 (copy, index: 22)
        IcyTowerView_upv_1 (copy, index: 23)
        TimbermanView_upv_1 (copy, index: 24)
        PausedView_upv_1 (copy, index: 25)
        TetrisKeybindsView_upv_1 (copy, index: 26)
        TetrisHandlingPanel_upv_1 (copy, index: 27)
        RestartConfirmView_upv_1 (copy, index: 28)
        ReviveAdView_upv_1 (copy, index: 29)
        GameOverView_upv_1 (copy, index: 30)
    ]]
    local PlayerGui_1 = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    local v7 = StarterGui_upv_1:WaitForChild("100Minigames", 30)
    local v8 = nil
    if v7 ~= nil then
        v8 = v7:Clone()
        v8.Enabled = true
        if v8.ResetOnSpawn and RunService_upv_1:IsStudio() then
            warn("[kit-view] 100Minigames.ResetOnSpawn was true \226\128\148 forcing false (authored value should be updated)")
        end
        v8.ResetOnSpawn = false
        v8.ClipToDeviceSafeArea = false
        v8.Parent = PlayerGui_1
        a1.janitor:Add(v8, "Destroy")
        local u4 = resolveKitUi_upv_1(v8)
        a1.colorSchemes:attachKit(v8)
        a1:disableUnusedCoreGui()
        a1:applyTouchHudSizing(u4)
        a1:bindHubInset(u4)
        a1:bindOrientation(u4)
        a1:bindSession(u4)
        a1:bindGameUi(u4)
        a1:buildModalScrim(u4)
        a1:construct(
            "PortraitLayout",
            function()
                --[[
                  line: 167
                  upvalues:
                    PortraitLayout_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return PortraitLayout_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "PortraitGameUi",
            function()
                --[[
                  line: 170
                  upvalues:
                    PortraitGameUi_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return PortraitGameUi_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "HubView",
            function()
                --[[
                  line: 173
                  upvalues:
                    HubView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return HubView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "TilesView",
            function()
                --[[
                  line: 176
                  upvalues:
                    TilesView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return TilesView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "DailyView",
            function()
                --[[
                  line: 179
                  upvalues:
                    DailyView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return DailyView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "SettingsView",
            function()
                --[[
                  line: 182
                  upvalues:
                    SettingsView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return SettingsView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "RevivesView",
            function()
                --[[
                  line: 185
                  upvalues:
                    RevivesView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return RevivesView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "CoinBoardView",
            function()
                --[[
                  line: 188
                  upvalues:
                    CoinBoardView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return CoinBoardView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "GotdBoardView",
            function()
                --[[
                  line: 191
                  upvalues:
                    GotdBoardView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return GotdBoardView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "DuelsView",
            function()
                --[[
                  line: 194
                  upvalues:
                    ModeLobbyView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return ModeLobbyView_upv_1.new(u4, a1.janitor, "duel")
            end
        )
        a1:construct(
            "RoyaleView",
            function()
                --[[
                  line: 197
                  upvalues:
                    ModeLobbyView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return ModeLobbyView_upv_1.new(u4, a1.janitor, "royale")
            end
        )
        a1:construct(
            "VictoryView",
            function()
                --[[
                  line: 200
                  upvalues:
                    VictoryView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return VictoryView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "PhotoModeView",
            function()
                --[[
                  line: 206
                  upvalues:
                    PhotoModeView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return PhotoModeView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "RestartButtonView",
            function()
                --[[
                  line: 209
                  upvalues:
                    RestartButtonView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return RestartButtonView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "GameHudView",
            function()
                --[[
                  line: 212
                  upvalues:
                    GameHudView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return GameHudView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "HudLeaderboardView",
            function()
                --[[
                  line: 215
                  upvalues:
                    HudLeaderboardView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return HudLeaderboardView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "HighwayRiderView",
            function()
                --[[
                  line: 218
                  upvalues:
                    HighwayRiderView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return HighwayRiderView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "HillClimbView",
            function()
                --[[
                  line: 221
                  upvalues:
                    HillClimbView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return HillClimbView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "HighwaySettingsView",
            function()
                --[[
                  line: 224
                  upvalues:
                    HighwaySettingsView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return HighwaySettingsView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "IcyTowerView",
            function()
                --[[
                  line: 227
                  upvalues:
                    IcyTowerView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return IcyTowerView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "TimbermanView",
            function()
                --[[
                  line: 230
                  upvalues:
                    TimbermanView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return TimbermanView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "PausedView",
            function()
                --[[
                  line: 233
                  upvalues:
                    PausedView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return PausedView_upv_1.new(u4, a1.janitor)
            end
        )
        local u5 = nil
        a1:construct(
            "TetrisKeybindsView",
            function()
                --[[
                  line: 240
                  upvalues:
                    u5 (ref,  index: 1)
                    TetrisKeybindsView_upv_1 (copy, index: 2)
                    u4 (copy, index: 3)
                    a1 (copy, index: 4)
                ]]
                u5 = TetrisKeybindsView_upv_1.new(u4, a1.janitor)
                return u5
            end
        )
        a1:construct(
            "TetrisHandlingPanel",
            function()
                --[[
                  line: 244
                  upvalues:
                    a1 (copy, index: 1)
                    u5 (ref,  index: 2)
                    TetrisHandlingPanel_upv_1 (copy, index: 3)
                    u4 (copy, index: 4)
                ]]
                local janitor_1 = a1.janitor
                local v9 = u5
                if v9 ~= nil then
                    v9 = v9.panel
                end
                return TetrisHandlingPanel_upv_1.new(u4, janitor_1, v9)
            end
        )
        a1:construct(
            "RestartConfirmView",
            function()
                --[[
                  line: 255
                  upvalues:
                    RestartConfirmView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return RestartConfirmView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "ReviveAdView",
            function()
                --[[
                  line: 258
                  upvalues:
                    ReviveAdView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return ReviveAdView_upv_1.new(u4, a1.janitor)
            end
        )
        a1:construct(
            "GameOverView",
            function()
                --[[
                  line: 261
                  upvalues:
                    GameOverView_upv_1 (copy, index: 1)
                    u4 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                return GameOverView_upv_1.new(u4, a1.janitor)
            end
        )
    else
        warn("[kit-view] StarterGui.100Minigames never appeared \226\128\148 authored UI inactive this session")
        return nil
    end
end
u3.bindGameUi = function(a1, a2)
    --[[
      name: bindGameUi
      line: 265
      upvalues:
        bindAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        hudHiddenAtom_upv_1 (copy, index: 3)
    ]]
    bindAtom_upv_1(
        a1.janitor,
        function()
            --[[
              line: 266
              upvalues:
                sessionAtom_upv_1 (copy, index: 1)
                hudHiddenAtom_upv_1 (copy, index: 2)
            ]]
            local v10 = false
            if sessionAtom_upv_1() ~= nil then
                v10 = not hudHiddenAtom_upv_1()
            end
            return v10
        end,
        function(a3)
            --[[
              line: 268
              upvalues:
                a2 (copy, index: 1)
            ]]
            a2.gameUi.root.Visible = a3
        end
    )
end
u3.applyTouchHudSizing = function(a1, a2)
    --[[
      name: applyTouchHudSizing
      line: 272
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u2 (copy, index: 3)
        topbarInset_upv_1 (copy, index: 4)
    ]]
    if UserInputService_upv_1.TouchEnabled then
        local hud_1 = a2.gameUi.hud
        local v11 = nil
        local v12 = nil
        local v13 = nil
        local v14 = nil
        local value_1 = nil
        local v15 = nil
        local v16 = nil
        for _, value_2 in {{"TopLeft", {"MenuButton", "LeaderboardButton"}}, {"TopRight", {"SettingsButton", "ResumeButton"}}} do
            v11 = value_2[1]
            v12 = value_2[2]
            v15 = hud_1:FindFirstChild(v11)
            if v15 == nil or not (v15:IsA("GuiObject")) then
                continue
            end
            for v17, value_1 in v12 do
                v16 = v15:FindFirstChild(value_1)
                if v16 == nil then
                    continue
                end
                if v16:IsA("GuiObject") then
                    v16.Size = u1
                end
            end
            v13 = v15:FindFirstChildOfClass("UIListLayout")
            if v13 ~= nil then
                v13.Padding = u2
                v13.VerticalAlignment = Enum.VerticalAlignment.Top
            end
            v14 = math.max(topbarInset_upv_1(), 58) + 6
            if v11 ~= "TopLeft" then
                v15.AnchorPoint = Vector2.new(v15.AnchorPoint.X, 0)
                v15.Position = UDim2.new(v15.Position.X.Scale, v15.Position.X.Offset, 0, v14)
            else
                v15.AnchorPoint = Vector2.new(0, 0)
                v15.Position = UDim2.new(0, 20, 0, v14)
            end
        end
    else
        return nil
    end
end
u3.disableUnusedCoreGui = function(a1)
    --[[
      name: disableUnusedCoreGui
      line: 312
      upvalues:
        StarterGui_upv_1 (copy, index: 1)
    ]]
    local success_1 = nil
    local v17 = nil
    for _, value_upv_3 in {Enum.CoreGuiType.Backpack, Enum.CoreGuiType.Health, Enum.CoreGuiType.EmotesMenu, Enum.CoreGuiType.SelfView} do
        success_1, v17 = pcall(
            function()
                --[[
                  line: 314
                  upvalues:
                    StarterGui_upv_1 (copy, index: 1)
                    value_upv_3 (copy, index: 2)
                ]]
                return StarterGui_upv_1:SetCoreGuiEnabled(value_upv_3, false)
            end
        )
        if not (success_1) then
            warn((("[kit-view] could not disable CoreGui %*: %*"):format(value_upv_3.Name, v17)))
        end
    end
end
u3.bindHubInset = function(a1, a2)
    --[[
      name: bindHubInset
      line: 322
      upvalues:
        isTouchDevice_upv_1 (copy, index: 1)
        isConsoleDevice_upv_1 (copy, index: 2)
        orientationAtom_upv_1 (copy, index: 3)
        topbarInset_upv_1 (copy, index: 4)
        bindAtom_upv_1 (copy, index: 5)
    ]]
    if not (isTouchDevice_upv_1()) and not (isConsoleDevice_upv_1()) then
        return nil
    else
        local u6 = Instance.new("UIPadding")
        u6.Name = "KitHubInset"
        u6.Parent = a2.mainUi
        a1.janitor:Add(u6)
        local function v18()
            --[[
              line: 330
              upvalues:
                orientationAtom_upv_1 (copy, index: 1)
                u6 (copy, index: 2)
                topbarInset_upv_1 (copy, index: 3)
            ]]
            local v19 = orientationAtom_upv_1() == "landscape"
            local new_1 = UDim.new
            local v20
            if v19 then
                v20 = topbarInset_upv_1() + 4
            else
                v20 = 0
            end
            u6.PaddingTop = new_1(0, v20)
        end
        bindAtom_upv_1(a1.janitor, orientationAtom_upv_1, v18)
        a1.janitor:Add(a2.gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(v18), "Disconnect")
    end
end
u3.construct = function(a1, a2, a3)
    --[[
      name: construct
      line: 338
    ]]
    local success_2, v21 = pcall(a3)
    if (success_2) then
        return
    end
    warn((("[kit-view] %* failed to construct \226\128\148 screen inactive: %*"):format(a2, v21)))
end
u3.bindOrientation = function(a1, a2)
    --[[
      name: bindOrientation
      line: 344
      upvalues:
        studioOrientationOverrideAtom_upv_1 (copy, index: 1)
        orientationAtom_upv_1 (copy, index: 2)
        Workspace_upv_1 (copy, index: 3)
        subscribe_upv_1 (copy, index: 4)
        bindAtom_upv_1 (copy, index: 5)
        readRoyaleLobbyActive_upv_1 (copy, index: 6)
        sessionAtom_upv_1 (copy, index: 7)
        matchAtom_upv_1 (copy, index: 8)
    ]]
    local function u7()
        --[[
          line: 345
          upvalues:
            studioOrientationOverrideAtom_upv_1 (copy, index: 1)
            orientationAtom_upv_1 (copy, index: 2)
            Workspace_upv_1 (copy, index: 3)
        ]]
        local u8 = studioOrientationOverrideAtom_upv_1()
        local v22 = nil
        if u8 == nil then
            v22 = Workspace_upv_1.CurrentCamera
            if v22 ~= nil then
                local ViewportSize_upv_1 = v22.ViewportSize
                orientationAtom_upv_1(
                    function()
                        --[[
                          line: 360
                          upvalues:
                            ViewportSize_upv_1 (copy, index: 1)
                        ]]
                        if ViewportSize_upv_1.X >= ViewportSize_upv_1.Y then
                            return "landscape"
                        end
                        return "portrait"
                    end
                )
            else
                return nil
            end
        else
            orientationAtom_upv_1(
                function()
                    --[[
                      line: 350
                      upvalues:
                        u8 (copy, index: 1)
                    ]]
                    return u8
                end
            )
            return nil
        end
    end
    a1.janitor:Add(subscribe_upv_1(studioOrientationOverrideAtom_upv_1, u7), true)
    local u9 = nil
    a1.janitor:Add(
        Workspace_upv_1:GetPropertyChangedSignal("CurrentCamera"):Connect(
            function()
                --[[
                  line: 371
                  upvalues:
                    u9 (ref,  index: 1)
                    Workspace_upv_1 (copy, index: 2)
                    u7 (copy, index: 3)
                ]]
                if u9 ~= nil then
                    u9:Disconnect()
                end
                local CurrentCamera_1 = Workspace_upv_1.CurrentCamera
                if CurrentCamera_1 ~= nil then
                    u9 = CurrentCamera_1:GetPropertyChangedSignal("ViewportSize"):Connect(u7)
                    u7()
                else
                    return nil
                end
            end
        ),
        "Disconnect"
    )
    a1.janitor:Add(
        function()
            --[[
              line: 384
              upvalues:
                u9 (ref, index: 1)
            ]]
            local v23 = u9
            if v23 ~= nil then
                v23 = v23:Disconnect()
            end
            return v23
        end,
        true
    )
    local v24 = u9
    if v24 ~= nil then
        v24:Disconnect()
    end
    local CurrentCamera_2 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_2 ~= nil then
        u9 = CurrentCamera_2:GetPropertyChangedSignal("ViewportSize"):Connect(u7)
        u7()
    end
    bindAtom_upv_1(
        a1.janitor,
        function()
            --[[
              line: 397
              upvalues:
                readRoyaleLobbyActive_upv_1 (copy, index: 1)
                sessionAtom_upv_1 (copy, index: 2)
                matchAtom_upv_1 (copy, index: 3)
            ]]
            if readRoyaleLobbyActive_upv_1() then
                return false
            else
                local v25 = nil
                if sessionAtom_upv_1() ~= nil then
                    v25 = matchAtom_upv_1()
                    local v26 = false
                    if v25 ~= nil then
                        v26 = false
                        if v25.phase == "ended" then
                            v26 = v25.results ~= nil
                        end
                    end
                    return v26
                end
                return true
            end
        end,
        function(a3)
            --[[
              line: 406
              upvalues:
                a2 (copy, index: 1)
            ]]
            a2.mainUi.Visible = a3
        end
    )
end
u3.bindSession = function(a1, a2)
    --[[
      name: bindSession
      line: 410
      upvalues:
        bindAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
    ]]
    local Pattern_upv_1 = a2.mainUi:FindFirstChild("Pattern")
    bindAtom_upv_1(
        a1.janitor,
        sessionAtom_upv_1,
        function(a3)
            --[[
              line: 413
              upvalues:
                a2 (copy, index: 1)
                Pattern_upv_1 (copy, index: 2)
            ]]
            local v27 = a3 ~= nil
            a2.games.Visible = not v27
            if Pattern_upv_1 ~= nil and Pattern_upv_1:IsA("GuiObject") then
                Pattern_upv_1.Visible = not v27
            end
            if not v27 then
                return
            end
            a2.leaderboard.Visible = false
            a2.leaderboardGotd.Visible = false
            a2.leaderboardGotdVertical.Visible = false
            a2.revives.Visible = false
            a2.settings.Visible = false
        end
    )
end
u3.buildModalScrim = function(a1, a2)
    --[[
      name: buildModalScrim
      line: 428
      upvalues:
        bindAtom_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        settingsOpenAtom_upv_1 (copy, index: 3)
        revivePacksOpenAtom_upv_1 (copy, index: 4)
        coinLeaderboardOpenAtom_upv_1 (copy, index: 5)
        dailyBoardOpenAtom_upv_1 (copy, index: 6)
        onActivated_upv_1 (copy, index: 7)
        setHoverGate_upv_1 (copy, index: 8)
    ]]
    a2.settings.ZIndex = 5
    a2.victory.ZIndex = 5
    local u10 = 0
    local u11 = Instance.new("TextButton")
    u11.Name = "KitModalScrim"
    u11.AutoButtonColor = false
    u11.Text = ""
    u11.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    u11.BackgroundTransparency = 0.45
    u11.Size = UDim2.fromScale(1, 1)
    u11.ZIndex = 2
    u11.Visible = false
    u11.Parent = a2.mainUi
    bindAtom_upv_1(
        a1.janitor,
        function()
            --[[
              line: 443
              upvalues:
                sessionAtom_upv_1 (copy, index: 1)
                settingsOpenAtom_upv_1 (copy, index: 2)
                revivePacksOpenAtom_upv_1 (copy, index: 3)
                coinLeaderboardOpenAtom_upv_1 (copy, index: 4)
                dailyBoardOpenAtom_upv_1 (copy, index: 5)
            ]]
            local v28 = false
            if sessionAtom_upv_1() == nil then
                v28 = settingsOpenAtom_upv_1() or (revivePacksOpenAtom_upv_1() or (coinLeaderboardOpenAtom_upv_1() or (dailyBoardOpenAtom_upv_1())))
            end
            return v28
        end,
        function(a3)
            --[[
              line: 445
              upvalues:
                u11 (copy, index: 1)
                u10 (ref,  index: 2)
            ]]
            u11.Visible = a3
            if not a3 then
                return
            end
            u10 = os.clock()
        end
    )
    onActivated_upv_1(
        a1.janitor,
        u11,
        function()
            --[[
              line: 459
              upvalues:
                u10 (ref,  index: 1)
                settingsOpenAtom_upv_1 (copy, index: 2)
                revivePacksOpenAtom_upv_1 (copy, index: 3)
                coinLeaderboardOpenAtom_upv_1 (copy, index: 4)
                dailyBoardOpenAtom_upv_1 (copy, index: 5)
            ]]
            if os.clock() - u10 >= 0.35 then
                settingsOpenAtom_upv_1(
                    function()
                        --[[
                          line: 463
                        ]]
                        return false
                    end
                )
                revivePacksOpenAtom_upv_1(
                    function()
                        --[[
                          line: 466
                        ]]
                        return false
                    end
                )
                coinLeaderboardOpenAtom_upv_1(
                    function()
                        --[[
                          line: 469
                        ]]
                        return false
                    end
                )
                dailyBoardOpenAtom_upv_1(
                    function()
                        --[[
                          line: 472
                        ]]
                        return false
                    end
                )
            else
                return nil
            end
        end,
        {}
    )
    local tbl_upv_3 = {a2.settings, a2.revives, a2.leaderboard, a2.leaderboardGotd, a2.leaderboardGotdVertical, a2.victory}
    setHoverGate_upv_1(
        function(a4)
            --[[
              line: 483
              upvalues:
                u11 (copy, index: 1)
                tbl_upv_3 (copy, index: 2)
            ]]
            if u11.Visible then
                for _, value_4 in tbl_upv_3 do
                    if not (value_4.Visible) or not (a4:IsDescendantOf(value_4)) then
                        continue
                    end
                    return false
                end
                return true
            end
            return false
        end
    )
end
Reflect_1.defineMetadata(u3, "identifier", "client/controllers/kit-ui-controller@KitUiController")
Reflect_1.defineMetadata(u3, "flamework:parameters", {"client/controllers/color-scheme-controller@ColorSchemeController"})
Reflect_1.defineMetadata(u3, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u3, "$:flamework@Controller", Controller_1, {})
local tbl_4 = {}
tbl_4.KitUiController = u3
return tbl_4