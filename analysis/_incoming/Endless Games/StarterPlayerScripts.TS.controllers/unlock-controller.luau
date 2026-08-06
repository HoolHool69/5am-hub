-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local ClientFunctions_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientFunctions
local pushToast_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms").pushToast
local unlockIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "unlock-intents").unlockIntents
local playUiSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "ui-sounds").playUiSound
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local tbl_upv_1 = {}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 27
    ]]
    return "UnlockController"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 32
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 36
    ]]
    a1.pending = {}
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 39
      upvalues:
        unlockIntents_upv_1 (copy, index: 1)
    ]]
    unlockIntents_upv_1.unlockGame:Connect(
        function(a2)
            --[[
              line: 40
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:requestUnlock(a2)
        end
    )
end
u1.requestUnlock = function(a1, a2)
    --[[
      name: requestUnlock
      line: 44
      upvalues:
        ClientFunctions_upv_1 (copy, index: 1)
        playUiSound_upv_1 (copy, index: 2)
        pushToast_upv_1 (copy, index: 3)
        GAME_METADATA_upv_1 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
    ]]
    if a1.pending[a2] == nil then
        a1.pending[a2] = true
        ClientFunctions_upv_1.unlockGame:invoke(a2):andThen(
            function(a3)
                --[[
                  line: 53
                  upvalues:
                    playUiSound_upv_1 (copy, index: 1)
                    pushToast_upv_1 (copy, index: 2)
                    GAME_METADATA_upv_1 (copy, index: 3)
                    a2 (copy, index: 4)
                    tbl_upv_1 (copy, index: 5)
                ]]
                if a3.ok then
                    playUiSound_upv_1("uiConfirm", {})
                    pushToast_upv_1((("%* unlocked \226\128\148 have fun!"):format(GAME_METADATA_upv_1[a2].displayName)))
                else
                    playUiSound_upv_1("uiBack", {})
                    pushToast_upv_1(tbl_upv_1[a3.reason], "error")
                end
            end
        ):catch(
            function()
                --[[
                  line: 66
                  upvalues:
                    pushToast_upv_1 (copy, index: 1)
                ]]
                return pushToast_upv_1("Couldn't reach the server \226\128\148 try again in a moment.", "error")
            end
        ):finally(
            function()
                --[[
                  line: 68
                  upvalues:
                    a1 (copy, index: 1)
                    a2 (copy, index: 2)
                ]]
                local pending_1 = a1.pending
                local v2 = pending_1[a2] ~= nil
                pending_1[a2] = nil
                return v2
            end
        )
    else
        return nil
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/unlock-controller@UnlockController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_4 = {}
tbl_4.UnlockController = u1
return tbl_4