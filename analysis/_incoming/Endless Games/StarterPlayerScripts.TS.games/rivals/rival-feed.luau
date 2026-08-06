-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Players_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local RIVAL_SOURCE_PRIORITY_upv_1 = RuntimeLib_1.import(script, script.Parent, "rival-marker-types").RIVAL_SOURCE_PRIORITY
local ClientFunctions_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network").ClientFunctions
local friendBestsAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "rival-atoms").friendBestsAtom
local playersAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").playersAtom
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 20
    ]]
    return "RivalFeed"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 25
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 29
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        friendBestsAtom_upv_1 (copy, index: 2)
        playersAtom_upv_1 (copy, index: 3)
        ClientFunctions_upv_1 (copy, index: 4)
    ]]
    a1.gameId = a2
    a1.onChanged = a4
    a1.destroyed = false
    a3:Add(
        function()
            --[[
              line: 33
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.destroyed = true
        end
    )
    a3:Add(
        subscribe_upv_1(
            friendBestsAtom_upv_1,
            function()
                --[[
                  line: 36
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:rebuild()
            end
        )
    )
    a3:Add(
        subscribe_upv_1(
            playersAtom_upv_1,
            function()
                --[[
                  line: 39
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:rebuild()
            end
        )
    )
    task.spawn(
        function()
            --[[
              line: 42
              upvalues:
                ClientFunctions_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            local v2, v3 = ClientFunctions_upv_1.fetchLeaderboard:invoke(a1.gameId):await()
            if not (a1.destroyed) and v2 then
                a1.globalEntries = v3
                a1:rebuild()
            else
                return nil
            end
        end
    )
    a1:rebuild()
end
u1.rebuild = function(a1)
    --[[
      name: rebuild
      line: 52
      upvalues:
        Players_upv_1 (copy, index: 1)
        RIVAL_SOURCE_PRIORITY_upv_1 (copy, index: 2)
        friendBestsAtom_upv_1 (copy, index: 3)
        playersAtom_upv_1 (copy, index: 4)
    ]]
    local v4, v5 = nil, nil
    if a1.destroyed then
        return nil
    else
        local UserId_upv_1 = Players_upv_1.LocalPlayer.UserId
        local tbl_upv_3 = {}
        v4 = friendBestsAtom_upv_1()[a1.gameId]
        local function v6(a2, a3, a4, a5)
            --[[
              line: 58
              upvalues:
                UserId_upv_1 (copy, index: 1)
                tbl_upv_3 (copy, index: 2)
                RIVAL_SOURCE_PRIORITY_upv_1 (copy, index: 3)
            ]]
            if a2 ~= UserId_upv_1 then
                local v7 = nil
                if a4 > 0 then
                    v7 = tbl_upv_3[a2]
                    if v7 ~= nil then
                        v7.score = math.max(v7.score, a4)
                        if RIVAL_SOURCE_PRIORITY_upv_1[v7.source] < RIVAL_SOURCE_PRIORITY_upv_1[a5] then
                            v7.source = a5
                            v7.username = a3
                        end
                        return
                    end
                    tbl_upv_3[a2] = {userId = a2, username = a3, score = a4, source = a5}
                    return nil
                end
            end
            return nil
        end
        if v4 ~= nil then
            for _, value_1 in v4.entries do
                v6(value_1.userId, value_1.username, value_1.score, "friend")
            end
        end
        local v8 = nil
        local v9 = nil
        local v10 = nil
        local v11 = nil
        for key_1, value_2 in pairs(playersAtom_upv_1()) do
            v11 = tonumber(key_1)
            if v11 == nil then
                continue
            end
            v9 = value_2.bestScores[a1.gameId]
            if v9 == nil then
                continue
            end
            v10 = Players_upv_1:GetPlayerByUserId(v11)
            if v10 ~= nil then
                v10 = v10.DisplayName
            end
            if v10 ~= nil then
                v8 = v10
            else
                v8 = "player"
            end
            v6(v11, v8, v9, "server")
        end
        v5 = a1.globalEntries
        if v5 ~= nil then
            for _, value_3 in v5.entries do
                v6(value_3.userId, value_3.username, value_3.score, "global")
            end
        end
        local tbl_4 = {}
        for _, value_4 in tbl_upv_3 do
            table.insert(tbl_4, value_4)
        end
        a1.onChanged(tbl_4)
    end
end
local tbl_5 = {}
tbl_5.RivalFeed = u1
return tbl_5