-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local MarketplaceService_upv_1 = v1.MarketplaceService
local Players_upv_1 = v1.Players
local setTimeout_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out").setTimeout
local reviveShopIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "revive-shop-intents").reviveShopIntents
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local pushToast_upv_1 = v2.pushToast
local revivePackPendingAtom_upv_1 = v2.revivePackPendingAtom
local REVIVE_PACKS_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").REVIVE_PACKS
local playersAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").playersAtom
local formatNumber_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "format-number").formatNumber
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 31
    ]]
    return "ReviveShopController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 36
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 40
    ]]
    a1.audio = a2
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 43
      upvalues:
        reviveShopIntents_upv_1 (copy, index: 1)
        MarketplaceService_upv_1 (copy, index: 2)
        subscribe_upv_1 (copy, index: 3)
        playersAtom_upv_1 (copy, index: 4)
        Players_upv_1 (copy, index: 5)
        revivePackPendingAtom_upv_1 (copy, index: 6)
        REVIVE_PACKS_upv_1 (copy, index: 7)
        pushToast_upv_1 (copy, index: 8)
        formatNumber_upv_1 (copy, index: 9)
    ]]
    reviveShopIntents_upv_1.buyPack:Connect(
        function(a2)
            --[[
              line: 44
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:buyPack(a2)
        end
    )
    MarketplaceService_upv_1.PromptProductPurchaseFinished:Connect(
        function(a3, a4, a5)
            --[[
              line: 47
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onPromptFinished(a3, a4, a5)
        end
    )
    subscribe_upv_1(
        function()
            --[[
              line: 51
              upvalues:
                playersAtom_upv_1 (copy, index: 1)
                Players_upv_1 (copy, index: 2)
            ]]
            local v4 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
            if v4 ~= nil then
                v4 = v4.revives
            end
            return v4
        end,
        function(a6, a7)
            --[[
              line: 57
              upvalues:
                revivePackPendingAtom_upv_1 (copy, index: 1)
                REVIVE_PACKS_upv_1 (copy, index: 2)
                a1 (copy, index: 3)
                pushToast_upv_1 (copy, index: 4)
                formatNumber_upv_1 (copy, index: 5)
            ]]
            local v5 = revivePackPendingAtom_upv_1()
            if v5 ~= nil and a6 ~= nil and a7 ~= nil and a6 > a7 then
                local v6 = nil
                for _, value_1 in REVIVE_PACKS_upv_1 do
                    if value_1.productId == v5 == true then
                        v6 = value_1
                        break
                    end
                end
                a1:clearPending()
                a1.audio:play("uiConfirm", {})
                if v6 == nil then
                    local revives_1 = v6
                else
                    local revives_1 = v6.revives
                end
                local revives_1, v7
                if revives_1 ~= nil then
                    v7 = revives_1
                else
                    v7 = a6 - a7
                end
                pushToast_upv_1((("+%* Revives added! \226\157\164"):format(formatNumber_upv_1(v7))))
            else
                return nil
            end
        end
    )
end
u1.buyPack = function(a1, a2)
    --[[
      name: buyPack
      line: 94
      upvalues:
        revivePackPendingAtom_upv_1 (copy, index: 1)
        REVIVE_PACKS_upv_1 (copy, index: 2)
        MarketplaceService_upv_1 (copy, index: 3)
        Players_upv_1 (copy, index: 4)
    ]]
    if revivePackPendingAtom_upv_1() == nil then
        local v8
        v8 = nil
        for _, value_2 in REVIVE_PACKS_upv_1 do
            if value_2.productId == a2 == true then
                v8 = value_2
                break
            end
        end
        if v8 ~= nil then
            revivePackPendingAtom_upv_1(
                function()
                    --[[
                      line: 113
                      upvalues:
                        a2 (copy, index: 1)
                    ]]
                    return a2
                end
            )
            MarketplaceService_upv_1:PromptProductPurchase(Players_upv_1.LocalPlayer, a2)
            a1:armBackstop(90)
        else
            return nil
        end
    else
        return nil
    end
end
u1.onPromptFinished = function(a1, a2, a3, a4)
    --[[
      name: onPromptFinished
      line: 119
      upvalues:
        Players_upv_1 (copy, index: 1)
        revivePackPendingAtom_upv_1 (copy, index: 2)
    ]]
    if a2 == Players_upv_1.LocalPlayer.UserId and revivePackPendingAtom_upv_1() == a3 then
        if a4 then
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
      line: 134
      upvalues:
        setTimeout_upv_1 (copy, index: 1)
        revivePackPendingAtom_upv_1 (copy, index: 2)
    ]]
    local cancelBackstop_1 = a1.cancelBackstop
    if cancelBackstop_1 ~= nil then
        cancelBackstop_1()
    end
    a1.cancelBackstop = setTimeout_upv_1(
        function()
            --[[
              line: 139
              upvalues:
                a1 (copy, index: 1)
                revivePackPendingAtom_upv_1 (copy, index: 2)
            ]]
            a1.cancelBackstop = nil
            revivePackPendingAtom_upv_1(
                function()
                    --[[
                      line: 141
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
      line: 146
      upvalues:
        revivePackPendingAtom_upv_1 (copy, index: 1)
    ]]
    local cancelBackstop_2 = a1.cancelBackstop
    if cancelBackstop_2 ~= nil then
        cancelBackstop_2()
    end
    a1.cancelBackstop = nil
    revivePackPendingAtom_upv_1(
        function()
            --[[
              line: 152
            ]]
            return nil
        end
    )
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/revive-shop-controller@ReviveShopController")
Reflect_1.defineMetadata(u1, "flamework:parameters", {"client/controllers/audio-controller@AudioController"})
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.ReviveShopController = u1
return tbl_3