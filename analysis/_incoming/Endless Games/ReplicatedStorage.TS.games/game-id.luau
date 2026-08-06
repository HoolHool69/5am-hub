-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {
    "flappy-bird",
    "2048",
    "2048-3d",
    "zig-zag",
    "stack",
    "helix-jump",
    "suika",
    "pop-the-lock",
    "crossy-road",
    "fruit-ninja",
    "timberman",
    "color-switch",
    "knife-hit",
    "number-merge",
    "doodle-jump",
    "highway-rider-tp",
    "highway-rider-fp",
    "dino-run",
    "subway-surfers",
    "snake",
    "tiny-wings",
    "tetris",
    "icy-tower",
    "flappy-basket",
    "tower-builder",
    "pong",
    "dunk-shot",
    "ballz",
    "stack-ball",
    "hill-climb",
    "stickman-hook",
    "traffic-rush",
    "cookie-clicker",
    "bloxorz",
    "highway-rider-fp-test",
    "block-blast",
    "unblock-me",
    "sokoban",
    "water-sort",
    "flow-free",
    "minesweeper",
    "lights-out",
    "onet",
    "flippy-knife",
    "hop",
    "jelly-jump",
    "sling-drift",
    "dunk-hit"
}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t.literal(unpack(tbl_1))
local function u1(a1)
    --[[
      name: isHighwayGameId
      line: 15
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = true
    if a1 ~= "highway-rider-tp" then
        v2 = u1(a1)
    end
    return v2
end
u1 = function(a1)
    --[[
      name: isFirstPersonHighwayGameId
      line: 25
    ]]
    local v3 = true
    if a1 ~= "highway-rider-fp" then
        v3 = a1 == "highway-rider-fp-test"
    end
    return v3
end
local tbl_2 = {}
tbl_2.isHighwayGameId = u1
tbl_2.isFirstPersonHighwayGameId = u1
tbl_2.GAME_IDS = tbl_1
tbl_2.gameIdCheck = v1
return tbl_2