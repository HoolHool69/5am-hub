-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local GuiService_upv_1 = v1.GuiService
local UserInputService_upv_1 = v1.UserInputService
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local sessionIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "session-intents").sessionIntents
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local gamepadUiCaptureAtom_upv_1 = v2.gamepadUiCaptureAtom
local highwaySettingsOpenAtom_upv_1 = v2.highwaySettingsOpenAtom
local restartConfirmAtom_upv_1 = v2.restartConfirmAtom
local settingsOpenAtom_upv_1 = v2.settingsOpenAtom
local tetrisControlsOpenAtom_upv_1 = v2.tetrisControlsOpenAtom
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "input-glyphs")
local PAUSE_BUTTON_upv_1 = v3.PAUSE_BUTTON
local RESTART_BUTTON_upv_1 = v3.RESTART_BUTTON
local Gamepad1_upv_1 = Enum.UserInputType.Gamepad1
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 42
    ]]
    return "GamepadShortcutController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 47
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u1)
    return v4:constructor(...) or v4
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 51
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 53
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    UserInputService_upv_1.InputBegan:Connect(
        function(a2, a3)
            --[[
              line: 54
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputBegan(a2, a3)
        end
    )
end
u1.onInputBegan = function(a1, a2, a3)
    --[[
      name: onInputBegan
      line: 58
      upvalues:
        Gamepad1_upv_1 (copy, index: 1)
        GuiService_upv_1 (copy, index: 2)
        gamepadUiCaptureAtom_upv_1 (copy, index: 3)
        UserInputService_upv_1 (copy, index: 4)
        PAUSE_BUTTON_upv_1 (copy, index: 5)
        RESTART_BUTTON_upv_1 (copy, index: 6)
    ]]
    if a2.UserInputType == Gamepad1_upv_1 then
        if a3 and GuiService_upv_1.MenuIsOpen or gamepadUiCaptureAtom_upv_1() or UserInputService_upv_1:GetFocusedTextBox() ~= nil then
            return nil
        elseif a2.KeyCode == PAUSE_BUTTON_upv_1 then
            a1:onPausePressed()
        elseif a2.KeyCode == RESTART_BUTTON_upv_1 then
            a1:onRestartPressed()
        end
    else
        return nil
    end
end
u1.onPausePressed = function(a1)
    --[[
      name: onPausePressed
      line: 86
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        sessionIntents_upv_1 (copy, index: 2)
    ]]
    local v5 = sessionAtom_upv_1()
    if v5 ~= nil and v5.mode ~= "match" and v5.phase == "playing" then
        sessionIntents_upv_1.togglePause:Fire()
        return
    end
    return nil
end
u1.onRestartPressed = function(a1)
    --[[
      name: onRestartPressed
      line: 95
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        restartConfirmAtom_upv_1 (copy, index: 2)
        settingsOpenAtom_upv_1 (copy, index: 3)
        highwaySettingsOpenAtom_upv_1 (copy, index: 4)
        tetrisControlsOpenAtom_upv_1 (copy, index: 5)
        sessionIntents_upv_1 (copy, index: 6)
    ]]
    local v6 = sessionAtom_upv_1()
    if v6 ~= nil and v6.mode ~= "match" and v6.phase == "playing" then
        if restartConfirmAtom_upv_1() == nil and not (settingsOpenAtom_upv_1()) and not (highwaySettingsOpenAtom_upv_1()) and not (tetrisControlsOpenAtom_upv_1()) then
            sessionIntents_upv_1.restart:Fire()
            return
        end
        return nil
    end
    return nil
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/gamepad-shortcut-controller@GamepadShortcutController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.GamepadShortcutController = u1
return tbl_3