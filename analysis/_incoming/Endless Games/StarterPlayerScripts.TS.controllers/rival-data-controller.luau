-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "rival-atoms")
local friendBestsAtom_upv_1 = v1.friendBestsAtom
local friendCoinsAtom_upv_1 = v1.friendCoinsAtom
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 21
    ]]
    return "RivalDataController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 26
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 30
    ]]
    a1.lastRequestAt = {}
    a1.lastCoinsRequestAt = 0
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 34
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
        friendBestsAtom_upv_1 (copy, index: 2)
        friendCoinsAtom_upv_1 (copy, index: 3)
    ]]
    ClientEvents_upv_1.friendBestsUpdated:connect(
        function(a2)
            --[[
              line: 35
              upvalues:
                friendBestsAtom_upv_1 (copy, index: 1)
            ]]
            friendBestsAtom_upv_1(
                function(a3)
                    --[[
                      line: 36
                      upvalues:
                        a2 (copy, index: 1)
                    ]]
                    local v3 = table.clone(a3)
                    setmetatable(v3, nil)
                    v3[a2.gameId] = a2
                    return v3
                end
            )
        end
    )
    ClientEvents_upv_1.friendCoinsUpdated:connect(
        function(a4)
            --[[
              line: 43
              upvalues:
                friendCoinsAtom_upv_1 (copy, index: 1)
            ]]
            friendCoinsAtom_upv_1(
                function()
                    --[[
                      line: 44
                      upvalues:
                        a4 (copy, index: 1)
                    ]]
                    return a4
                end
            )
        end
    )
end
u1.ensureFriendBests = function(a1, a2)
    --[[
      name: ensureFriendBests
      line: 49
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
    ]]
    local v4 = os.clock()
    local v5 = a1.lastRequestAt[a2]
    if v5 == nil then
        v5 = 0
    end
    if v4 - v5 >= 30 then
        a1.lastRequestAt[a2] = v4
        ClientEvents_upv_1.requestFriendBests:fire(a2)
    else
        return nil
    end
end
u1.ensureFriendCoins = function(a1)
    --[[
      name: ensureFriendCoins
      line: 65
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
    ]]
    local v6 = os.clock()
    if v6 - a1.lastCoinsRequestAt >= 30 then
        a1.lastCoinsRequestAt = v6
        ClientEvents_upv_1.requestFriendCoins:fire()
    else
        return nil
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/rival-data-controller@RivalDataController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.RivalDataController = u1
return tbl_3