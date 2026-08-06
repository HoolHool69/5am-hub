-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local setInterval_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out").setInterval
local ClientFunctions_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientFunctions
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "player-badges")
local applyPlayerBadges_upv_1 = v1.applyPlayerBadges
local drainPlayerBadgeQueue_upv_1 = v1.drainPlayerBadgeQueue
local getPlayerBadge_upv_1 = v1.getPlayerBadge
local MAX_BADGE_REQUEST_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "player-badges").MAX_BADGE_REQUEST
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 34
    ]]
    return "PlayerBadgeController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 39
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 43
    ]]
    a1.pending = {}
    a1.inFlight = false
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 47
      upvalues:
        setInterval_upv_1 (copy, index: 1)
    ]]
    setInterval_upv_1(
        function()
            --[[
              line: 48
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:tick()
        end,
        0.35
    )
end
u1.tick = function(a1)
    --[[
      name: tick
      line: 52
      upvalues:
        drainPlayerBadgeQueue_upv_1 (copy, index: 1)
        MAX_BADGE_REQUEST_upv_1 (copy, index: 2)
        ClientFunctions_upv_1 (copy, index: 3)
        applyPlayerBadges_upv_1 (copy, index: 4)
        getPlayerBadge_upv_1 (copy, index: 5)
    ]]
    for _, value_1 in drainPlayerBadgeQueue_upv_1() do
        if a1.pending[value_1] == nil then
            a1.pending[value_1] = 0
        end
    end
    local inFlight_1 = a1.inFlight
    local v3
    if inFlight_1 then
        v3 = inFlight_1
    else
        local v4 = 0
        local tbl_upv_3 = v4
        for _ in a1.pending do
            tbl_upv_3 = tbl_upv_3 + 1
        end
        v3 = tbl_upv_3 == 0
    end
    if v3 then
        return nil
    else
        local tbl_upv_3 = {}
        for key_1 in a1.pending do
            if MAX_BADGE_REQUEST_upv_1 <= #tbl_upv_3 then
                break
            else
                table.insert(tbl_upv_3, key_1)
            end
        end
        a1.inFlight = true
        ClientFunctions_upv_1.fetchPlayerBadges:invoke(tbl_upv_3):andThen(
            function(a2)
                --[[
                  line: 79
                  upvalues:
                    applyPlayerBadges_upv_1 (copy, index: 1)
                    tbl_upv_3 (copy, index: 2)
                    getPlayerBadge_upv_1 (copy, index: 3)
                    a1 (copy, index: 4)
                ]]
                applyPlayerBadges_upv_1(a2)
                local v5 = nil
                local v6 = nil
                for _, value_2 in tbl_upv_3 do
                    if getPlayerBadge_upv_1(value_2) ~= nil then
                        a1.pending[value_2] = nil
                        continue
                    end
                    v5 = a1.pending[value_2]
                    if v5 == nil then
                        v5 = 0
                    end
                    v6 = v5 + 1
                    if v6 < 40 then
                        a1.pending[value_2] = v6
                    else
                        a1.pending[value_2] = nil
                    end
                end
            end
        ):catch(function()
            --[[
              line: 97
            ]]
        end):finally(
            function()
                --[[
                  line: 97
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.inFlight = false
            end
        )
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/player-badge-controller@PlayerBadgeController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_4 = {}
tbl_4.PlayerBadgeController = u1
return tbl_4