-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local MarketplaceService_upv_1 = v1.MarketplaceService
local Players_upv_1 = v1.Players
local setTimeout_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out").setTimeout
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local dailyIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "daily-intents").dailyIntents
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local dailyPurchasePendingAtom_upv_1 = v2.dailyPurchasePendingAtom
local pushToast_upv_1 = v2.pushToast
local GOTD_EXTRA_CHARGES_PRODUCT_ID_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").GOTD_EXTRA_CHARGES_PRODUCT_ID
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local playersAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").playersAtom
local formatNumber_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "format-number").formatNumber
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 33
    ]]
    return "DailyController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 38
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 42
    ]]
    a1.audio = a2
    a1.awaitingReceipt = false
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 46
      upvalues:
        dailyIntents_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
        GAME_METADATA_upv_1 (copy, index: 3)
        formatNumber_upv_1 (copy, index: 4)
        pushToast_upv_1 (copy, index: 5)
        MarketplaceService_upv_1 (copy, index: 6)
        subscribe_upv_1 (copy, index: 7)
        playersAtom_upv_1 (copy, index: 8)
        Players_upv_1 (copy, index: 9)
        dailyPurchasePendingAtom_upv_1 (copy, index: 10)
    ]]
    dailyIntents_upv_1.buyCharges:Connect(
        function()
            --[[
              line: 47
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:buyCharges()
        end
    )
    ClientEvents_upv_1.dailyRewardSettled:connect(
        function(a2)
            --[[
              line: 51
              upvalues:
                GAME_METADATA_upv_1 (copy, index: 1)
                formatNumber_upv_1 (copy, index: 2)
                a1 (copy, index: 3)
                pushToast_upv_1 (copy, index: 4)
            ]]
            local v4 = ("#%*"):format(formatNumber_upv_1(a2.rank))
            a1.audio:play("uiConfirm", {})
            pushToast_upv_1((("\226\152\128 Daily reward: +%* \226\157\164 Revives (%* on %*)"):format(formatNumber_upv_1(a2.revives), v4, GAME_METADATA_upv_1[a2.gameId].displayName)))
        end
    )
    MarketplaceService_upv_1.PromptProductPurchaseFinished:Connect(
        function(a3, a4, a5)
            --[[
              line: 60
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onPromptFinished(a3, a4, a5)
        end
    )
    subscribe_upv_1(
        function()
            --[[
              line: 64
              upvalues:
                playersAtom_upv_1 (copy, index: 1)
                Players_upv_1 (copy, index: 2)
            ]]
            local v5 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
            if v5 ~= nil then
                v5 = v5.daily.extraChargesPurchased
            end
            return v5
        end,
        function(a6)
            --[[
              line: 70
              upvalues:
                dailyPurchasePendingAtom_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                pushToast_upv_1 (copy, index: 3)
            ]]
            if a6 == true then
                if not (dailyPurchasePendingAtom_upv_1()) and not (a1.awaitingReceipt) then
                    return nil
                end
                a1:clearPending()
                a1.audio:play("uiConfirm", {})
                pushToast_upv_1("+5 daily plays added!")
            else
                return nil
            end
        end
    )
end
u1.buyCharges = function(a1)
    --[[
      name: buyCharges
      line: 88
      upvalues:
        dailyPurchasePendingAtom_upv_1 (copy, index: 1)
        pushToast_upv_1 (copy, index: 2)
        playersAtom_upv_1 (copy, index: 3)
        Players_upv_1 (copy, index: 4)
        MarketplaceService_upv_1 (copy, index: 5)
        GOTD_EXTRA_CHARGES_PRODUCT_ID_upv_1 (copy, index: 6)
    ]]
    if dailyPurchasePendingAtom_upv_1() then
        return nil
    else
        local v6
        if a1.awaitingReceipt then
            pushToast_upv_1("Your daily pack is still processing \226\128\148 hang tight!")
            return nil
        end
        v6 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
        if v6 ~= nil then
            v6 = v6.daily.extraChargesPurchased
        end
        if v6 ~= true then
            dailyPurchasePendingAtom_upv_1(
                function()
                    --[[
                      line: 105
                    ]]
                    return true
                end
            )
            MarketplaceService_upv_1:PromptProductPurchase(Players_upv_1.LocalPlayer, GOTD_EXTRA_CHARGES_PRODUCT_ID_upv_1)
            a1:armBackstop(90)
        else
            pushToast_upv_1("Daily pack already bought \226\128\148 more plays tomorrow!")
            return nil
        end
    end
end
u1.onPromptFinished = function(a1, a2, a3, a4)
    --[[
      name: onPromptFinished
      line: 111
      upvalues:
        Players_upv_1 (copy, index: 1)
        GOTD_EXTRA_CHARGES_PRODUCT_ID_upv_1 (copy, index: 2)
    ]]
    if a2 == Players_upv_1.LocalPlayer.UserId and a3 == GOTD_EXTRA_CHARGES_PRODUCT_ID_upv_1 then
        if a4 then
            a1.awaitingReceipt = true
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
      line: 129
      upvalues:
        setTimeout_upv_1 (copy, index: 1)
        dailyPurchasePendingAtom_upv_1 (copy, index: 2)
    ]]
    local cancelBackstop_1 = a1.cancelBackstop
    if cancelBackstop_1 ~= nil then
        cancelBackstop_1()
    end
    a1.cancelBackstop = setTimeout_upv_1(
        function()
            --[[
              line: 134
              upvalues:
                a1 (copy, index: 1)
                dailyPurchasePendingAtom_upv_1 (copy, index: 2)
            ]]
            a1.cancelBackstop = nil
            dailyPurchasePendingAtom_upv_1(
                function()
                    --[[
                      line: 136
                    ]]
                    return false
                end
            )
        end,
        a2
    )
end
u1.clearPending = function(a1)
    --[[
      name: clearPending
      line: 141
      upvalues:
        dailyPurchasePendingAtom_upv_1 (copy, index: 1)
    ]]
    local cancelBackstop_2 = a1.cancelBackstop
    if cancelBackstop_2 ~= nil then
        cancelBackstop_2()
    end
    a1.cancelBackstop = nil
    a1.awaitingReceipt = false
    dailyPurchasePendingAtom_upv_1(
        function()
            --[[
              line: 148
            ]]
            return false
        end
    )
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/daily-controller@DailyController")
Reflect_1.defineMetadata(u1, "flamework:parameters", {"client/controllers/audio-controller@AudioController"})
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.DailyController = u1
return tbl_3