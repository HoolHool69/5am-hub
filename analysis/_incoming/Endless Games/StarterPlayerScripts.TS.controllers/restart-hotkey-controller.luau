-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms")
local isGameOverInputLocked_upv_1 = v1.isGameOverInputLocked
local sessionAtom_upv_1 = v1.sessionAtom
local restartActionFor_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "restart-action").restartActionFor
local tetrisKeybindsAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "settings-atoms").tetrisKeybindsAtom
local sessionIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "session-intents").sessionIntents
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local highwaySettingsOpenAtom_upv_1 = v2.highwaySettingsOpenAtom
local settingsOpenAtom_upv_1 = v2.settingsOpenAtom
local tetrisControlsOpenAtom_upv_1 = v2.tetrisControlsOpenAtom
local RESTART_KEY_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "input-glyphs").RESTART_KEY
local resolveTetrisKeys_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tetris-keybinds").resolveTetrisKeys
local Space_upv_1 = Enum.KeyCode.Space
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 80
    ]]
    return "RestartHotkeyController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 85
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 89
    ]]
    a1.lastSpacePressAt = -math.huge
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 92
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    UserInputService_upv_1.InputBegan:Connect(
        function(a2, a3)
            --[[
              line: 93
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
      line: 97
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        Space_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
        sessionIntents_upv_1 (copy, index: 4)
    ]]
    if not (a3) and a2.UserInputType == Enum.UserInputType.Keyboard then
        local v4, v5 = nil, nil
        if UserInputService_upv_1:GetFocusedTextBox() == nil then
            v4 = a2.KeyCode
            local lastSpacePressAt_1 = a1.lastSpacePressAt
            if v4 == Space_upv_1 then
                a1.lastSpacePressAt = os.clock()
            end
            v5 = sessionAtom_upv_1()
            if v5 ~= nil then
                local v6 = nil
                if v5.mode ~= "match" then
                    v6 = a1:isRestartKey(v4, v5)
                    if not (v6) and v4 ~= Space_upv_1 then
                        return nil
                    end
                    if v5.phase ~= "gameOver" then
                        if not v6 or not (a1:canRestartFromRun(v5)) then
                            return nil
                        end
                    elseif not a1:canRestartFromEnding(v5) or not (v6) and os.clock() - lastSpacePressAt_1 < 0.6 then
                        return nil
                    end
                    sessionIntents_upv_1.restart:Fire()
                    return
                end
            end
        end
        return nil
    end
    return nil
end
u1.isRestartKey = function(a1, a2, a3)
    --[[
      name: isRestartKey
      line: 133
      upvalues:
        RESTART_KEY_upv_1 (copy, index: 1)
        resolveTetrisKeys_upv_1 (copy, index: 2)
        tetrisKeybindsAtom_upv_1 (copy, index: 3)
    ]]
    if a3.gameId == "tetris" then
        for _, value_1 in resolveTetrisKeys_upv_1(tetrisKeybindsAtom_upv_1(), "restart") do
            if a2 ~= value_1 then
                continue
            end
            return true
        end
        return false
    end
    return a2 == RESTART_KEY_upv_1
end
u1.canRestartFromEnding = function(a1, a2)
    --[[
      name: canRestartFromEnding
      line: 144
      upvalues:
        isGameOverInputLocked_upv_1 (copy, index: 1)
        restartActionFor_upv_1 (copy, index: 2)
    ]]
    if a2.reviveState == "none" then
        if isGameOverInputLocked_upv_1(a2) then
            return false
        else
            local v7 = restartActionFor_upv_1(a2) == "play"
            return v7
        end
    else
        return false
    end
end
u1.canRestartFromRun = function(a1, a2)
    --[[
      name: canRestartFromRun
      line: 154
      upvalues:
        settingsOpenAtom_upv_1 (copy, index: 1)
        highwaySettingsOpenAtom_upv_1 (copy, index: 2)
        tetrisControlsOpenAtom_upv_1 (copy, index: 3)
    ]]
    if a2.phase == "playing" and a2.reviveState == "none" then
        local v8 = not settingsOpenAtom_upv_1() and (not highwaySettingsOpenAtom_upv_1() and (not tetrisControlsOpenAtom_upv_1()))
        return v8
    end
    return false
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/restart-hotkey-controller@RestartHotkeyController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.RestartHotkeyController = u1
return tbl_3