-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local isUpdateLive_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-release").isUpdateLive
local tbl_1 = {{keyCode = Enum.KeyCode.ButtonR2}, {keyCode = Enum.KeyCode.ButtonL2}}
local tbl_2 = {}
local v1 = #tbl_2
local v2 = #tbl_1
table.move(tbl_1, 1, v2, v1 + 1, tbl_2)
tbl_2[(v1 + v2) + 1] = {keyCode = Enum.KeyCode.Thumbstick2}
local tbl_upv_3 = {}
tbl_upv_3["highway-rider-fp"] = {["LOOK (IN AIR)"] = true}
local tbl_upv_4 = {}
tbl_upv_4.ballz = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["dunk-hit"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["dunk-shot"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["flippy-knife"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["sling-drift"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["stickman-hook"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["tiny-wings"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["stack-ball"] = {{keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["flappy-bird"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["flappy-basket"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["jelly-jump"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["knife-hit"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4.stack = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["tower-builder"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["zig-zag"] = {{keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["fruit-ninja"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4.hop = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["helix-jump"] = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4.pong = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["doodle-jump"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["icy-tower"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4.suika = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["dino-run"] = {{keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.ButtonB}}
tbl_upv_4["highway-rider-tp"] = tbl_1
tbl_upv_4["highway-rider-fp"] = tbl_2
tbl_upv_4["highway-rider-fp-test"] = tbl_2
tbl_upv_4["hill-climb"] = {{keyCode = Enum.KeyCode.ButtonR2}, {keyCode = Enum.KeyCode.ButtonL2}}
tbl_upv_4.snake = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4.bloxorz = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["2048"] = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["2048-3d"] = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["number-merge"] = {{keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["crossy-road"] = {{keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.Thumbstick1}}
tbl_upv_4["subway-surfers"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.DPadDown}}
tbl_upv_4.timberman = {{keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.DPadLeft}, {keyCode = Enum.KeyCode.DPadRight}}
tbl_upv_4.minesweeper = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.ButtonX}}
tbl_upv_4["unblock-me"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.ButtonX}}
tbl_upv_4.onet = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["lights-out"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}}
tbl_upv_4["water-sort"] = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.ButtonY}}
tbl_upv_4.sokoban = {{keyCode = Enum.KeyCode.Thumbstick1}, {keyCode = Enum.KeyCode.ButtonY}, {keyCode = Enum.KeyCode.ButtonX}}
tbl_upv_4.tetris = {{keyCode = Enum.KeyCode.ButtonA}, {keyCode = Enum.KeyCode.ButtonX}, {keyCode = Enum.KeyCode.ButtonY}, {keyCode = Enum.KeyCode.DPadUp}}
local tbl_5 = {}
tbl_5.hintsFor = function(a1)
    --[[
      name: hintsFor
      line: 312
      upvalues:
        tbl_upv_4 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        isUpdateLive_upv_1 (copy, index: 3)
    ]]
    local v3 = tbl_upv_4[a1]
    local v4 = nil
    if v3 ~= nil then
        v4 = tbl_upv_3[a1]
        if v4 == nil or isUpdateLive_upv_1(a1) then
            return v3
        else
            local tbl_6 = {}
            local v5 = 0
            for _, value_1 in v3 do
                if v4[value_1.label] == nil == true then
                    v5 = v5 + 1
                    tbl_6[v5] = value_1
                end
            end
            return tbl_6
        end
    else
        return nil
    end
end
tbl_5.GAME_GAMEPAD_HINTS = tbl_upv_4
return tbl_5