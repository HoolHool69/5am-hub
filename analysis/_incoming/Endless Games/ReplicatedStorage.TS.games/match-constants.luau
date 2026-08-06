-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.duel = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-release").EVENT_RELEASE_UNIX
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_4 = {}
local tbl_5 = {150, 90, 60}
local tbl_6 = {}
tbl_6.matchModeReleaseUnix = function(a1)
    --[[
      name: matchModeReleaseUnix
      line: 18
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[a1]
end
tbl_6.matchModeEnabled = function(a1, a2)
    --[[
      name: matchModeEnabled
      line: 22
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1[a1]
    local v2 = false
    if v1 ~= nil then
        v2 = v1 <= a2
    end
    return v2
end
tbl_6.duelRect = function(a1)
    --[[
      name: duelRect
      line: 103
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    if a1 ~= "left" then
        return tbl_upv_3
    end
    return tbl_upv_2
end
tbl_6.DUEL_LEFT_RECT = tbl_upv_2
tbl_6.DUEL_RIGHT_RECT = tbl_upv_3
tbl_6.ROYALE_VIEW_RECT = tbl_4
tbl_6.ROYALE_PLACEMENT_COINS = tbl_5
return tbl_6