-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local createCrossyRoadBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "crossy-road-bot").createCrossyRoadBot
local createFlappyBasketBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "flappy-basket-bot").createFlappyBasketBot
local createFlappyBirdBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "flappy-bird-bot").createFlappyBirdBot
local createGame2048Bot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "game-2048-bot").createGame2048Bot
local createHelixJumpBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "helix-jump-bot").createHelixJumpBot
local createHighwayRiderBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "highway-rider-bot").createHighwayRiderBot
local createIcyTowerBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "icy-tower-bot").createIcyTowerBot
local createKnifeHitBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "knife-hit-bot").createKnifeHitBot
local createStackBallBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "stack-ball-bot").createStackBallBot
local createStackBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "stack-bot").createStackBot
local createTetrisBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "tetris-bot").createTetrisBot
local createTimbermanBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "timberman-bot").createTimbermanBot
local createTowerBuilderBot_1 = RuntimeLib_1.import(script, script.Parent, "drivers", "tower-builder-bot").createTowerBuilderBot
local tbl_upv_1 = {}
tbl_upv_1["flappy-bird"] = createFlappyBirdBot_1
tbl_upv_1["flappy-basket"] = createFlappyBasketBot_1
tbl_upv_1["2048"] = createGame2048Bot_1
tbl_upv_1["2048-3d"] = createGame2048Bot_1
tbl_upv_1.stack = createStackBot_1
tbl_upv_1["knife-hit"] = createKnifeHitBot_1
tbl_upv_1["helix-jump"] = createHelixJumpBot_1
tbl_upv_1["stack-ball"] = createStackBallBot_1
tbl_upv_1.timberman = createTimbermanBot_1
tbl_upv_1["zig-zag"] = RuntimeLib_1.import(script, script.Parent, "drivers", "zig-zag-bot").createZigZagBot
tbl_upv_1["highway-rider-tp"] = createHighwayRiderBot_1
tbl_upv_1.tetris = createTetrisBot_1
tbl_upv_1["icy-tower"] = createIcyTowerBot_1
tbl_upv_1["tower-builder"] = createTowerBuilderBot_1
tbl_upv_1["crossy-road"] = createCrossyRoadBot_1
local tbl_2 = {}
tbl_2.createBotDriver = function(a1, a2, a3)
    --[[
      name: createBotDriver
      line: 56
      upvalues:
        tbl_upv_1 (copy, index: 1)
        deriveRandom_upv_1 (copy, index: 2)
    ]]
    local v1 = tbl_upv_1[a1]
    if v1 ~= nil then
        return v1({seed = a2, difficulty = a3, random = deriveRandom_upv_1(a2, 91)})
    end
    return nil
end
return tbl_2