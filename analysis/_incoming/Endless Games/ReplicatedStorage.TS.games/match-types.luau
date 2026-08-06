-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {"duel", "royale"}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t.literal(unpack(tbl_1))
local tbl_upv_2 = {"flappy-bird", "2048", "stack", "knife-hit", "helix-jump", "timberman", "zig-zag", "highway-rider-tp", "tetris", "icy-tower", "flappy-basket", "tower-builder", "crossy-road"}
local tbl_upv_3 = {}
tbl_upv_3["flappy-bird"] = "ghost"
tbl_upv_3["flappy-basket"] = "ghost"
tbl_upv_3["highway-rider-tp"] = "ghost"
tbl_upv_3["icy-tower"] = "ghost"
tbl_upv_3["zig-zag"] = "ghost"
tbl_upv_3["helix-jump"] = "ghost"
tbl_upv_3["crossy-road"] = "ghost"
tbl_upv_3["2048"] = "replica"
tbl_upv_3["2048-3d"] = "replica"
tbl_upv_3.stack = "replica"
tbl_upv_3["knife-hit"] = "replica"
tbl_upv_3.tetris = "replica"
tbl_upv_3.timberman = "replica"
tbl_upv_3["tower-builder"] = "replica"
local tbl_4 = {}
tbl_4.isMatchGame = function(a1)
    --[[
      name: isMatchGame
      line: 16
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v2 = table.find(tbl_upv_2, a1) ~= nil
    return v2
end
tbl_4.matchViewMode = function(a1)
    --[[
      name: matchViewMode
      line: 53
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    return tbl_upv_3[a1] or "ghost"
end
tbl_4.duelSideFor = function(a1, a2)
    --[[
      name: duelSideFor
      line: 75
    ]]
    local v3 = -1
    for key_1, value_1 in a1 do
        if value_1.userId == a2 == true then
            v3 = key_1 - 1
            break
        end
    end
    if v3 > 0 then
        return "right"
    end
    return "left"
end
tbl_4.MATCH_MODES = tbl_1
tbl_4.matchModeCheck = v1
tbl_4.MATCH_GAME_IDS = tbl_upv_2
return tbl_4