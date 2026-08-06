-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local sessionIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "session-intents").sessionIntents
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "settings-surface")
local closeHighwaySettings_upv_1 = v1.closeHighwaySettings
local closeSettings_upv_1 = v1.closeSettings
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local highwaySettingsOpenAtom_upv_1 = v2.highwaySettingsOpenAtom
local pausedAtom_upv_1 = v2.pausedAtom
local settingsOpenAtom_upv_1 = v2.settingsOpenAtom
local tetrisControlsOpenAtom_upv_1 = v2.tetrisControlsOpenAtom
local PAUSE_KEY_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "input-glyphs").PAUSE_KEY
local closeTetrisControls_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "views", "game", "tetris-controls-surface").closeTetrisControls
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 39
    ]]
    return "PauseHotkeyController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 44
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 48
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 50
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    UserInputService_upv_1.InputBegan:Connect(
        function(a2, a3)
            --[[
              line: 51
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
      line: 55
      upvalues:
        PAUSE_KEY_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        pausedAtom_upv_1 (copy, index: 4)
        settingsOpenAtom_upv_1 (copy, index: 5)
        closeSettings_upv_1 (copy, index: 6)
        highwaySettingsOpenAtom_upv_1 (copy, index: 7)
        closeHighwaySettings_upv_1 (copy, index: 8)
        tetrisControlsOpenAtom_upv_1 (copy, index: 9)
        closeTetrisControls_upv_1 (copy, index: 10)
        sessionIntents_upv_1 (copy, index: 11)
    ]]
    if not (a3) and a2.UserInputType == Enum.UserInputType.Keyboard then
        if a2.KeyCode == PAUSE_KEY_upv_1 then
            local v4 = nil
            if UserInputService_upv_1:GetFocusedTextBox() == nil then
                v4 = sessionAtom_upv_1()
                if v4 ~= nil and v4.mode ~= "match" and v4.phase == "playing" then
                    if v4.gameId ~= "tetris" then
                        if pausedAtom_upv_1() then
                            if settingsOpenAtom_upv_1() then
                                closeSettings_upv_1()
                                return nil
                            elseif highwaySettingsOpenAtom_upv_1() then
                                closeHighwaySettings_upv_1()
                                return nil
                            elseif tetrisControlsOpenAtom_upv_1() then
                                closeTetrisControls_upv_1()
                                return nil
                            end
                        end
                        sessionIntents_upv_1.togglePause:Fire()
                        return
                    end
                    return nil
                end
            end
        end
        return nil
    end
    return nil
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/pause-hotkey-controller@PauseHotkeyController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.PauseHotkeyController = u1
return tbl_3