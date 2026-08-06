-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {"endless-runner", "precision", "puzzle", "idle"}
local tbl_upv_2 = {}
tbl_upv_2["flappy-bird"] = {}
tbl_upv_2["2048"] = {}
tbl_upv_2["2048-3d"] = {}
tbl_upv_2.stack = {}
tbl_upv_2["pop-the-lock"] = {}
tbl_upv_2["knife-hit"] = {}
tbl_upv_2["color-switch"] = {}
tbl_upv_2["helix-jump"] = {}
tbl_upv_2.timberman = {}
tbl_upv_2["number-merge"] = {}
tbl_upv_2["zig-zag"] = {}
tbl_upv_2["fruit-ninja"] = {}
tbl_upv_2.suika = {revivePricing = {heartCosts = {2, 5, 10}, productIds = {3612602484, 3612602538, 3612602654}}}
tbl_upv_2["crossy-road"] = {}
tbl_upv_2["doodle-jump"] = {}
tbl_upv_2["highway-rider-tp"] = {}
tbl_upv_2["highway-rider-fp"] = {}
tbl_upv_2["dino-run"] = {}
tbl_upv_2["subway-surfers"] = {}
tbl_upv_2.snake = {}
tbl_upv_2["tiny-wings"] = {}
tbl_upv_2.tetris = {}
tbl_upv_2["icy-tower"] = {}
tbl_upv_2["flappy-basket"] = {}
tbl_upv_2["tower-builder"] = {}
tbl_upv_2.pong = {}
tbl_upv_2["dunk-hit"] = {}
tbl_upv_2["dunk-shot"] = {}
tbl_upv_2.ballz = {}
tbl_upv_2["stack-ball"] = {}
tbl_upv_2["hill-climb"] = {}
tbl_upv_2["stickman-hook"] = {}
tbl_upv_2["traffic-rush"] = {}
tbl_upv_2["cookie-clicker"] = {}
tbl_upv_2.bloxorz = {}
tbl_upv_2["highway-rider-fp-test"] = {}
tbl_upv_2["block-blast"] = {}
tbl_upv_2["unblock-me"] = {}
tbl_upv_2.sokoban = {}
tbl_upv_2["water-sort"] = {}
tbl_upv_2["flow-free"] = {}
tbl_upv_2.minesweeper = {}
tbl_upv_2["lights-out"] = {}
tbl_upv_2["flippy-knife"] = {}
tbl_upv_2.hop = {}
tbl_upv_2["jelly-jump"] = {}
tbl_upv_2["sling-drift"] = {}
tbl_upv_2.onet = {}
local tbl_3 = {}
tbl_3.hasOwnInPlayLeaderboard = function(a1)
    --[[
      name: hasOwnInPlayLeaderboard
      line: 699
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v1 = tbl_upv_2[a1]
    local v2 = true
    if v1.showLiveLeaderboard ~= true then
        v2 = v1.hasInWorldLeaderboard == true
    end
    return v2
end
tbl_3.GAME_GENRES = tbl_1
tbl_3.GAME_GENRE_LABELS = {["endless-runner"] = "Endless Runner", precision = "Precision & Timing", puzzle = "Puzzle", idle = "Idle"}
tbl_3.GAME_METADATA = tbl_upv_2
return tbl_3