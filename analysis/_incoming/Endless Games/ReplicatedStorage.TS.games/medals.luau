-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {"bronze", "silver", "gold", "platinum", "diamond", "emerald", "ruby", "cosmic"}
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t.literal(unpack(tbl_upv_1))
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
tbl_upv_4["flappy-bird"] = {}
tbl_upv_4["2048"] = {}
tbl_upv_4["2048-3d"] = {}
tbl_upv_4.stack = {}
tbl_upv_4["pop-the-lock"] = {}
tbl_upv_4["knife-hit"] = {}
tbl_upv_4["color-switch"] = {}
tbl_upv_4["helix-jump"] = {}
tbl_upv_4.timberman = {}
tbl_upv_4["number-merge"] = {}
tbl_upv_4["zig-zag"] = {}
tbl_upv_4["fruit-ninja"] = {}
tbl_upv_4.suika = {}
tbl_upv_4["crossy-road"] = {}
tbl_upv_4["doodle-jump"] = {}
tbl_upv_4["highway-rider-tp"] = {}
tbl_upv_4["highway-rider-fp"] = {}
tbl_upv_4["dino-run"] = {}
tbl_upv_4["subway-surfers"] = {}
tbl_upv_4.snake = {}
tbl_upv_4["tiny-wings"] = {}
tbl_upv_4.tetris = {}
tbl_upv_4["icy-tower"] = {}
tbl_upv_4["flappy-basket"] = {}
tbl_upv_4["tower-builder"] = {}
tbl_upv_4.pong = {}
tbl_upv_4["dunk-hit"] = {}
tbl_upv_4["dunk-shot"] = {}
tbl_upv_4.ballz = {}
tbl_upv_4["stack-ball"] = {}
tbl_upv_4["hill-climb"] = {}
tbl_upv_4["stickman-hook"] = {}
tbl_upv_4.bloxorz = {}
tbl_upv_4["traffic-rush"] = {}
tbl_upv_4["cookie-clicker"] = {}
tbl_upv_4["highway-rider-fp-test"] = {}
tbl_upv_4["block-blast"] = {}
tbl_upv_4["unblock-me"] = {}
tbl_upv_4.sokoban = {}
tbl_upv_4["water-sort"] = {}
tbl_upv_4["flow-free"] = {}
tbl_upv_4.minesweeper = {}
tbl_upv_4["lights-out"] = {}
tbl_upv_4.hop = {}
tbl_upv_4["jelly-jump"] = {}
tbl_upv_4["sling-drift"] = {}
tbl_upv_4["flippy-knife"] = {}
tbl_upv_4.onet = {}
local tbl_upv_5 = {}
for n_1 = 0, #tbl_upv_1 - 1 do
    tbl_upv_5[tbl_upv_1[n_1 + 1]] = n_1
end
local tbl_6 = {}
tbl_6.medalTierIndex = function(a1)
    --[[
      name: medalTierIndex
      line: 559
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    local v2 = tbl_upv_5[a1]
    if v2 == nil then
        v2 = 0
    end
    return v2
end
tbl_6.isSecretTier = function(a1)
    --[[
      name: isSecretTier
      line: 568
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    local v3 = tbl_upv_5[a1]
    if v3 == nil then
        v3 = 0
    end
    local v4 = tbl_upv_5.platinum
    if v4 == nil then
        v4 = 0
    end
    local v5
    if v4 <= v3 then
        v5 = true
    else
        v5 = false
    end
    return v5
end
tbl_6.isMedalRevealed = function(a1, a2)
    --[[
      name: isMedalRevealed
      line: 581
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    local v6 = tbl_upv_5[a1]
    if v6 == nil then
        v6 = 0
    end
    local v7 = tbl_upv_5.platinum
    if v7 == nil then
        v7 = 0
    end
    local v8
    if v7 <= v6 then
        v8 = true
    else
        v8 = false
    end
    if v8 then
        if a2 ~= nil then
            v6 = tbl_upv_5[a2]
            if v6 == nil then
                v6 = 0
            end
            v7 = tbl_upv_5[a1]
            if v7 == nil then
                v7 = 0
            end
            if v7 <= v6 then
                v8 = true
            else
                v8 = false
            end
            return v8
        end
        return false
    end
    return true
end
tbl_6.medalTierName = function(a1, a2)
    --[[
      name: medalTierName
      line: 596
      upvalues:
        tbl_upv_5 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    local v9 = tbl_upv_5[a1]
    if v9 == nil then
        v9 = 0
    end
    local v10 = tbl_upv_5.platinum
    if v10 == nil then
        v10 = 0
    end
    local v11
    if v10 <= v9 then
        v11 = true
    else
        v11 = false
    end
    local v12
    if v11 then
        local v13 = nil
        if a2 ~= nil then
            v13 = tbl_upv_5[a2]
            if v13 == nil then
                v13 = 0
            end
            v9 = tbl_upv_5[a1]
            if v9 == nil then
                v9 = 0
            end
            if v9 <= v13 then
                v12 = true
            else
                v12 = false
            end
        else
            v12 = false
        end
    else
        v12 = true
    end
    if v12 then
        return tbl_upv_3[a1]
    end
    return "???"
end
tbl_6.countMedalsEarned = function(a1, a2)
    --[[
      name: countMedalsEarned
      line: 606
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    local v14 = 0
    local v15 = nil
    local v16 = nil
    for _, value_1 in a2 do
        v16 = a1[value_1]
        if v16 == nil then
            continue
        end
        v15 = tbl_upv_5[v16]
        if v15 == nil then
            v15 = 0
        end
        v14 = v14 + (v15 + 1)
    end
    return v14
end
tbl_6.highestMedalAcrossGames = function(a1)
    --[[
      name: highestMedalAcrossGames
      line: 617
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    local v17
    v17 = nil
    local v18, v19 = nil, nil
    for _, value_2 in pairs(a1) do
        if v17 == nil then
            v17 = value_2
            continue
        end
        v18 = tbl_upv_5[value_2]
        if v18 == nil then
            v18 = 0
        end
        v19 = tbl_upv_5[v17]
        if v19 == nil then
            v19 = 0
        end
        if v19 < v18 then
            v17 = value_2
        end
    end
    return v17
end
tbl_6.evaluateMedalAward = function(a1, a2, a3)
    --[[
      name: evaluateMedalAward
      line: 632
      upvalues:
        tbl_upv_4 (copy, index: 1)
        tbl_upv_5 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        tbl_upv_2 (copy, index: 4)
    ]]
    local v20 = tbl_upv_4[a1]
    local v21, v22 = nil, nil
    if a2 ~= nil then
        v21 = tbl_upv_5[a2]
        if v21 == nil then
            v21 = 0
        end
        v22 = v21 + 1
    else
        v22 = 0
    end
    local tbl_7 = {}
    v21 = 0
    local v23 = false
    local v24
    v24 = v22
    while true do
        if v23 then
            v24 = v24 + 1
        else
            v23 = true
        end
        local v25
        if v24 >= #tbl_upv_1 then
            break
        end
        v25 = tbl_upv_1[v24 + 1]
        if a3 < v20[v25] then
            break
        end
        table.insert(tbl_7, v25)
        v21 = v21 + tbl_upv_2[v25]
    end
    if #tbl_7 ~= 0 then
        v24 = {}
        v24.newlyEarned = tbl_7
        v24.bonusCoins = v21
        v24.newBest = tbl_7[#tbl_7]
    else
        v24 = {}
        v24.newlyEarned = tbl_7
    end
    return v24
end
tbl_6.nextMedalTarget = function(a1, a2)
    --[[
      name: nextMedalTarget
      line: 670
      upvalues:
        tbl_upv_5 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
    ]]
    local v26, v27 = nil, nil
    if a2 ~= nil then
        v26 = tbl_upv_5[a2]
        if v26 == nil then
            v26 = 0
        end
        v27 = v26 + 1
    else
        v27 = 0
    end
    if #tbl_upv_1 > v27 then
        local v28 = tbl_upv_1[v27 + 1]
        local tbl_8 = {}
        tbl_8.tier = v28
        tbl_8.threshold = tbl_upv_4[a1][v28]
        return tbl_8
    end
    return nil
end
tbl_6.MEDAL_TIERS = tbl_upv_1
tbl_6.medalTierCheck = v1
tbl_6.MEDAL_COIN_BONUSES = tbl_upv_2
tbl_6.MEDAL_DISPLAY_NAMES = tbl_upv_3
tbl_6.MEDAL_THRESHOLDS = tbl_upv_4
return tbl_6