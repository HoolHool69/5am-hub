-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local MarketplaceService_upv_1 = v1.MarketplaceService
local Players_upv_1 = v1.Players
local setTimeout_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out").setTimeout
local ClientFunctions_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientFunctions
local earlyAccessIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "early-access-intents").earlyAccessIntents
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local earlyAccessPendingAtom_upv_1 = v2.earlyAccessPendingAtom
local pushToast_upv_1 = v2.pushToast
local EARLY_ACCESS_PRODUCT_ID_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").EARLY_ACCESS_PRODUCT_ID
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local playersAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").playersAtom
local tbl_upv_1 = {}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 43
    ]]
    return "EarlyAccessController"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 48
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 52
    ]]
    a1.audio = a2
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 55
      upvalues:
        earlyAccessIntents_upv_1 (copy, index: 1)
        MarketplaceService_upv_1 (copy, index: 2)
        subscribe_upv_1 (copy, index: 3)
        playersAtom_upv_1 (copy, index: 4)
        Players_upv_1 (copy, index: 5)
        earlyAccessPendingAtom_upv_1 (copy, index: 6)
        pushToast_upv_1 (copy, index: 7)
        GAME_METADATA_upv_1 (copy, index: 8)
    ]]
    earlyAccessIntents_upv_1.buyEarlyAccess:Connect(
        function(a2)
            --[[
              line: 56
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:buy(a2)
        end
    )
    MarketplaceService_upv_1.PromptProductPurchaseFinished:Connect(
        function(a3, a4, a5)
            --[[
              line: 59
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onPromptFinished(a3, a4, a5)
        end
    )
    subscribe_upv_1(
        function()
            --[[
              line: 63
              upvalues:
                playersAtom_upv_1 (copy, index: 1)
                Players_upv_1 (copy, index: 2)
            ]]
            local v4 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
            if v4 ~= nil then
                v4 = v4.earlyAccessGames
            end
            return v4
        end,
        function(a6)
            --[[
              line: 69
              upvalues:
                earlyAccessPendingAtom_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                pushToast_upv_1 (copy, index: 3)
                GAME_METADATA_upv_1 (copy, index: 4)
            ]]
            if a6 ~= nil then
                local v5 = earlyAccessPendingAtom_upv_1() or (a1.awaitingGameId)
                if v5 ~= nil and table.find(a6, v5) ~= nil then
                    a1:clearPending()
                    a1.audio:play("uiConfirm", {})
                    pushToast_upv_1((("%* unlocked early \226\128\148 have fun!"):format(GAME_METADATA_upv_1[v5].displayName)))
                else
                    return nil
                end
            else
                return nil
            end
        end
    )
end
u1.buy = function(a1, a2)
    --[[
      name: buy
      line: 87
      upvalues:
        earlyAccessPendingAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        playersAtom_upv_1 (copy, index: 3)
        Players_upv_1 (copy, index: 4)
        ClientFunctions_upv_1 (copy, index: 5)
        tbl_upv_1 (copy, index: 6)
        MarketplaceService_upv_1 (copy, index: 7)
        EARLY_ACCESS_PRODUCT_ID_upv_1 (copy, index: 8)
    ]]
    if earlyAccessPendingAtom_upv_1() == nil then
        local v6 = nil
        if a1.awaitingGameId == nil then
            v6 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
            if v6 ~= nil then
                v6 = table.find(v6.earlyAccessGames, a2) ~= nil
            end
            if v6 ~= true then
                earlyAccessPendingAtom_upv_1(
                    function()
                        --[[
                          line: 106
                          upvalues:
                            a2 (copy, index: 1)
                        ]]
                        return a2
                    end
                )
                a1:armBackstop(90)
                ClientFunctions_upv_1.beginEarlyAccessPurchase:invoke(a2):andThen(
                    function(a3)
                        --[[
                          line: 111
                          upvalues:
                            earlyAccessPendingAtom_upv_1 (copy, index: 1)
                            a2 (copy, index: 2)
                            a1 (copy, index: 3)
                            pushToast_upv_1 (copy, index: 4)
                            tbl_upv_1 (copy, index: 5)
                            MarketplaceService_upv_1 (copy, index: 6)
                            Players_upv_1 (copy, index: 7)
                            EARLY_ACCESS_PRODUCT_ID_upv_1 (copy, index: 8)
                        ]]
                        if earlyAccessPendingAtom_upv_1() == a2 then
                            if a3.ok then
                                MarketplaceService_upv_1:PromptProductPurchase(Players_upv_1.LocalPlayer, EARLY_ACCESS_PRODUCT_ID_upv_1)
                                a1:armBackstop(90)
                            else
                                a1:clearPending()
                                a1.audio:play("uiBack", {})
                                pushToast_upv_1(tbl_upv_1[a3.reason], "error")
                                return nil
                            end
                        else
                            return nil
                        end
                    end
                ):catch(
                    function()
                        --[[
                          line: 128
                          upvalues:
                            earlyAccessPendingAtom_upv_1 (copy, index: 1)
                            a2 (copy, index: 2)
                            a1 (copy, index: 3)
                            pushToast_upv_1 (copy, index: 4)
                        ]]
                        if earlyAccessPendingAtom_upv_1() == a2 then
                            a1:clearPending()
                            pushToast_upv_1("Couldn't reach the server \226\128\148 try again in a moment.", "error")
                        else
                            return nil
                        end
                    end
                )
            else
                pushToast_upv_1("Already unlocked \226\128\148 jump in!")
                return nil
            end
        else
            pushToast_upv_1("Your early access purchase is still processing \226\128\148 hang tight!")
            return nil
        end
    else
        return nil
    end
end
u1.onPromptFinished = function(a1, a2, a3, a4)
    --[[
      name: onPromptFinished
      line: 136
      upvalues:
        Players_upv_1 (copy, index: 1)
        EARLY_ACCESS_PRODUCT_ID_upv_1 (copy, index: 2)
        earlyAccessPendingAtom_upv_1 (copy, index: 3)
    ]]
    if a2 == Players_upv_1.LocalPlayer.UserId and a3 == EARLY_ACCESS_PRODUCT_ID_upv_1 then
        if a4 then
            a1.awaitingGameId = earlyAccessPendingAtom_upv_1()
            a1:armBackstop(20)
            return nil
        end
        a1:clearPending()
        a1.audio:play("uiBack", {})
        return
    end
    return nil
end
u1.armBackstop = function(a1, a2)
    --[[
      name: armBackstop
      line: 154
      upvalues:
        setTimeout_upv_1 (copy, index: 1)
        earlyAccessPendingAtom_upv_1 (copy, index: 2)
    ]]
    local cancelBackstop_1 = a1.cancelBackstop
    if cancelBackstop_1 ~= nil then
        cancelBackstop_1()
    end
    a1.cancelBackstop = setTimeout_upv_1(
        function()
            --[[
              line: 159
              upvalues:
                a1 (copy, index: 1)
                earlyAccessPendingAtom_upv_1 (copy, index: 2)
            ]]
            a1.cancelBackstop = nil
            earlyAccessPendingAtom_upv_1(
                function()
                    --[[
                      line: 161
                    ]]
                    return nil
                end
            )
        end,
        a2
    )
end
u1.clearPending = function(a1)
    --[[
      name: clearPending
      line: 166
      upvalues:
        earlyAccessPendingAtom_upv_1 (copy, index: 1)
    ]]
    local cancelBackstop_2 = a1.cancelBackstop
    if cancelBackstop_2 ~= nil then
        cancelBackstop_2()
    end
    a1.cancelBackstop = nil
    a1.awaitingGameId = nil
    earlyAccessPendingAtom_upv_1(
        function()
            --[[
              line: 173
            ]]
            return nil
        end
    )
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/early-access-controller@EarlyAccessController")
Reflect_1.defineMetadata(u1, "flamework:parameters", {"client/controllers/audio-controller@AudioController"})
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_4 = {}
tbl_4.EarlyAccessController = u1
return tbl_4