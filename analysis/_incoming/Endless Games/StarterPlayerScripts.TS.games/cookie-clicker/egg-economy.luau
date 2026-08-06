-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "cookie-clicker-config")
local BARN_CATS_upv_1 = v1.BARN_CATS
local BASE_EGGS_PER_CLICK_upv_1 = v1.BASE_EGGS_PER_CLICK
local CHICK_SPECIALS_upv_1 = v1.CHICK_SPECIALS
local CLICK_CPS_FRACTION_PER_UPGRADE_upv_1 = v1.CLICK_CPS_FRACTION_PER_UPGRADE
local CLICK_UPGRADES_upv_1 = v1.CLICK_UPGRADES
local EGG_FARM_CODEC_VERSION_upv_1 = v1.EGG_FARM_CODEC_VERSION
local GOLDEN_META_upv_1 = v1.GOLDEN_META
local PRICE_GROWTH_upv_1 = v1.PRICE_GROWTH
local PRODUCERS_upv_1 = v1.PRODUCERS
local RECIPES_upv_1 = v1.RECIPES
local TROPHIES_upv_1 = v1.TROPHIES
local TROPHY_PRODUCTION_BONUS_upv_1 = v1.TROPHY_PRODUCTION_BONUS
local UPGRADE_TIER_COST_MULTIPLIERS_upv_1 = v1.UPGRADE_TIER_COST_MULTIPLIERS
local UPGRADE_TIER_NAMES_upv_1 = v1.UPGRADE_TIER_NAMES
local UPGRADE_TIER_THRESHOLDS_upv_1 = v1.UPGRADE_TIER_THRESHOLDS
local u1 = (function()
    --[[
      name: buildUpgradeCatalog
      line: 36
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
        UPGRADE_TIER_THRESHOLDS_upv_1 (copy, index: 2)
        UPGRADE_TIER_NAMES_upv_1 (copy, index: 3)
        UPGRADE_TIER_COST_MULTIPLIERS_upv_1 (copy, index: 4)
        CLICK_UPGRADES_upv_1 (copy, index: 5)
        CHICK_SPECIALS_upv_1 (copy, index: 6)
        GOLDEN_META_upv_1 (copy, index: 7)
        BARN_CATS_upv_1 (copy, index: 8)
        RECIPES_upv_1 (copy, index: 9)
    ]]
    local tbl_1 = {}
    for n_1 = 0, #PRODUCERS_upv_1 - 1 do
        local v2 = PRODUCERS_upv_1[n_1 + 1]
        for n_2 = 0, #UPGRADE_TIER_THRESHOLDS_upv_1 - 1 do
            table.insert(tbl_1, {id = #tbl_1, name = ("%* \194\183 %*"):format(v2.name, UPGRADE_TIER_NAMES_upv_1[n_2 + 1]), blurb = ("%* output \195\1512."):format(v2.name), cost = v2.baseCost * UPGRADE_TIER_COST_MULTIPLIERS_upv_1[n_2 + 1], producerIndex = n_1, ownedThreshold = UPGRADE_TIER_THRESHOLDS_upv_1[n_2 + 1]})
        end
    end
    for _, value_1 in CLICK_UPGRADES_upv_1 do
        table.insert(tbl_1, {id = #tbl_1, name = value_1.name, cost = value_1.cost, unlockLifetime = value_1.unlockLifetime})
    end
    for _, value_2 in CHICK_SPECIALS_upv_1 do
        table.insert(tbl_1, {id = #tbl_1, name = value_2.name, blurb = ("Chicks lay +%*/s per other producer."):format(value_2.perNonChick), cost = value_2.cost, ownedThreshold = value_2.chickThreshold, perNonChick = value_2.perNonChick})
    end
    local tbl_2 = nil
    for _, value_3 in GOLDEN_META_upv_1 do
        tbl_2 = {}
        tbl_2.id = #tbl_1
        tbl_2.name = value_3.name
        tbl_2.blurb = ((value_3.effect ~= "spawn") and "Golden eggs linger twice as long.") or "Golden eggs appear twice as often."
        tbl_2.cost = value_3.cost
        tbl_2.unlockLifetime = value_3.unlockLifetime
        tbl_2.goldenEffect = value_3.effect
        tbl_2.goldenScale = value_3.scale
        table.insert(tbl_1, tbl_2)
    end
    for _, value_4 in BARN_CATS_upv_1 do
        table.insert(tbl_1, {id = #tbl_1, name = value_4.name, blurb = ("Production +%*%% per trophy earned."):format(value_4.factor * 100), cost = value_4.cost, unlockLifetime = value_4.unlockLifetime, catFactor = value_4.factor})
    end
    for _, value_5 in RECIPES_upv_1 do
        table.insert(tbl_1, {id = #tbl_1, name = value_5.name, blurb = ("All production \195\151%*."):format(value_5.multiplier), cost = value_5.cost, unlockLifetime = value_5.unlockLifetime, flatMultiplier = value_5.multiplier})
    end
    return tbl_1
end)()
local function serializeFarm_1(a1)
    --[[
      name: serializeFarm
      line: 132
      upvalues:
        u1 (copy, index: 1)
        TROPHIES_upv_1 (copy, index: 2)
        EGG_FARM_CODEC_VERSION_upv_1 (copy, index: 3)
    ]]
    local tbl_3 = {}
    for n_3 = 0, #u1 - 1 do
        if a1.upgrades[n_3 + 1] == true then
            table.insert(tbl_3, n_3)
        end
    end
    local tbl_4 = {}
    for n_4 = 0, #TROPHIES_upv_1 - 1 do
        if a1.trophies[n_4 + 1] == true then
            table.insert(tbl_4, n_4)
        end
    end
    local tbl_5 = {}
    tbl_5.version = EGG_FARM_CODEC_VERSION_upv_1
    tbl_5.eggs = a1.eggs
    tbl_5.lifetime = a1.lifetime
    tbl_5.clicks = a1.clicks
    tbl_5.goldens = a1.goldens
    tbl_5.producers = table.clone(a1.producers)
    tbl_5.upgrades = tbl_3
    tbl_5.trophies = tbl_4
    return tbl_5
end
local function freshFarm_upv_1()
    --[[
      name: freshFarm
      line: 117
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
    ]]
    local tbl_6 = {}
    for _, v3 in PRODUCERS_upv_1 do
        table.insert(tbl_6, 0)
    end
    local tbl_7 = {}
    tbl_7.producers = tbl_6
    tbl_7.upgrades = {}
    tbl_7.trophies = {}
    return tbl_7
end
local function trophyCount_1(a1)
    --[[
      name: trophyCount
      line: 209
      upvalues:
        TROPHIES_upv_1 (copy, index: 1)
    ]]
    local v4 = 0
    for n_5 = 0, #TROPHIES_upv_1 - 1 do
        if a1.trophies[n_5 + 1] == true then
            v4 = v4 + 1
        end
    end
    return v4
end
local function recipesMultiplier_upv_1(a1)
    --[[
      name: recipesMultiplier
      line: 234
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v5 = 1
    for _, value_6 in u1 do
        if value_6.kind ~= "flavor" or a1.upgrades[value_6.id + 1] ~= true then
            continue
        end
        if value_6.flatMultiplier ~= nil then
            v5 = v5 * value_6.flatMultiplier
        end
    end
    return v5
end
local function goldenSpawnScale_1(a1)
    --[[
      name: goldenSpawnScale
      line: 261
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v6 = 1
    for _, value_7 in u1 do
        if value_7.kind ~= "goldenMeta" or a1.upgrades[value_7.id + 1] ~= true or value_7.goldenEffect ~= "spawn" then
            continue
        end
        if value_7.goldenScale ~= nil then
            v6 = v6 * value_7.goldenScale
        end
    end
    return v6
end
local function catsMultiplier_upv_1(a1)
    --[[
      name: catsMultiplier
      line: 223
      upvalues:
        TROPHIES_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v7 = 0
    for n_6 = 0, #TROPHIES_upv_1 - 1 do
        if a1.trophies[n_6 + 1] == true then
            v7 = v7 + 1
        end
    end
    local v9 = 1
    for _, value_8 in u1 do
        if value_8.kind ~= "cats" or a1.upgrades[value_8.id + 1] ~= true then
            continue
        end
        if value_8.catFactor ~= nil then
            v9 = v9 * (1 + (value_8.catFactor * v7))
        end
    end
    return v9
end
local function tierMultiplier_upv_1(a1, a2)
    --[[
      name: tierMultiplier
      line: 199
      upvalues:
        UPGRADE_TIER_THRESHOLDS_upv_1 (copy, index: 1)
    ]]
    local v10 = 1
    for n_7 = 0, #UPGRADE_TIER_THRESHOLDS_upv_1 - 1 do
        if a1.upgrades[(a2 * #UPGRADE_TIER_THRESHOLDS_upv_1 + n_7) + 1] == true then
            v10 = v10 * 2
        end
    end
    return v10
end
local function chickSpecialEggsPerSecond_upv_1(a1)
    --[[
      name: chickSpecialEggsPerSecond
      line: 244
      upvalues:
        u1 (copy, index: 1)
        PRODUCERS_upv_1 (copy, index: 2)
    ]]
    local v11 = 0
    for _, value_9 in u1 do
        if value_9.kind ~= "chickBoost" or a1.upgrades[value_9.id + 1] ~= true then
            continue
        end
        if value_9.perNonChick ~= nil then
            v11 = v11 + value_9.perNonChick
        end
    end
    if v11 ~= 0 then
        local v13 = 0
        for n_8 = 1, #PRODUCERS_upv_1 - 1 do
            v13 = v13 + a1.producers[n_8 + 1]
        end
        return (a1.producers[1] * v13) * v11
    end
    return 0
end
local function clickCpsFraction_upv_1(a1)
    --[[
      name: clickCpsFraction
      line: 290
      upvalues:
        u1 (copy, index: 1)
        CLICK_CPS_FRACTION_PER_UPGRADE_upv_1 (copy, index: 2)
    ]]
    local v14 = 0
    for _, value_10 in u1 do
        if value_10.kind ~= "click" then
            continue
        end
        if a1.upgrades[value_10.id + 1] == true then
            v14 = v14 + 1
        end
    end
    return v14 * CLICK_CPS_FRACTION_PER_UPGRADE_upv_1
end
local function upgradeRevealed_upv_1(a1, a2)
    --[[
      name: upgradeRevealed
      line: 318
    ]]
    if a1.upgrades[a2.id + 1] ~= true then
        local v15 = nil
        if a2.kind == "chickBoost" then
            v15 = a2.ownedThreshold
            local v16 = false
            if v15 ~= nil then
                v16 = v15 <= a1.producers[1]
            end
            return v16
        elseif a2.kind ~= "tier" then
            v15 = a2.unlockLifetime
            local v17 = false
            if v15 ~= nil then
                v17 = v15 <= a1.lifetime
            end
            return v17
        else
            v15 = a2.producerIndex
            local ownedThreshold_1 = a2.ownedThreshold
            if v15 ~= nil and ownedThreshold_1 ~= nil then
                return ownedThreshold_1 <= a1.producers[v15 + 1]
            end
            return false
        end
    else
        return false
    end
end
local tbl_8 = {}
tbl_8.freshFarm = freshFarm_upv_1
tbl_8.serializeFarm = serializeFarm_1
tbl_8.deserializeFarm = function(a1)
    --[[
      name: deserializeFarm
      line: 160
      upvalues:
        freshFarm_upv_1 (copy, index: 1)
        PRODUCERS_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        TROPHIES_upv_1 (copy, index: 4)
    ]]
    local v18 = freshFarm_upv_1()
    v18.eggs = math.max(a1.eggs, 0)
    v18.lifetime = math.max(a1.lifetime, 0)
    v18.clicks = math.max(a1.clicks, 0)
    v18.goldens = math.max(a1.goldens, 0)
    local v19 = 0
    local v20 = false
    while true do
        if v20 then
            v19 = v19 + 1
        else
            v20 = true
        end
        if v19 >= math.min(#a1.producers, #PRODUCERS_upv_1) then
            break
        end
        v18.producers[v19 + 1] = math.max(math.floor(a1.producers[v19 + 1]), 0)
    end
    for _, value_11 in a1.upgrades do
        if value_11 < 0 then
            continue
        end
        if value_11 < #u1 then
            v18.upgrades[value_11 + 1] = true
        end
    end
    for _, value_12 in a1.trophies do
        if value_12 < 0 then
            continue
        end
        if value_12 < #TROPHIES_upv_1 then
            v18.trophies[value_12 + 1] = true
        end
    end
    return v18
end
tbl_8.producerPrice = function(a1, a2)
    --[[
      name: producerPrice
      line: 194
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
        PRICE_GROWTH_upv_1 (copy, index: 2)
    ]]
    return (math.ceil(PRODUCERS_upv_1[a2 + 1].baseCost * (PRICE_GROWTH_upv_1 ^ a1.producers[a2 + 1])))
end
tbl_8.tierMultiplier = tierMultiplier_upv_1
tbl_8.trophyCount = trophyCount_1
tbl_8.trophyMultiplier = function(a1)
    --[[
      name: trophyMultiplier
      line: 219
      upvalues:
        TROPHY_PRODUCTION_BONUS_upv_1 (copy, index: 1)
        TROPHIES_upv_1 (copy, index: 2)
    ]]
    local v21 = 0
    for n_9 = 0, #TROPHIES_upv_1 - 1 do
        if a1.trophies[n_9 + 1] == true then
            v21 = v21 + 1
        end
    end
    return (1 + TROPHY_PRODUCTION_BONUS_upv_1) ^ v21
end
tbl_8.catsMultiplier = catsMultiplier_upv_1
tbl_8.recipesMultiplier = recipesMultiplier_upv_1
tbl_8.goldenSpawnScale = goldenSpawnScale_1
tbl_8.goldenLingerScale = function(a1)
    --[[
      name: goldenLingerScale
      line: 271
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v22 = 1
    for _, value_13 in u1 do
        if value_13.kind ~= "goldenMeta" or a1.upgrades[value_13.id + 1] ~= true or value_13.goldenEffect ~= "linger" then
            continue
        end
        if value_13.goldenScale ~= nil then
            v22 = v22 * value_13.goldenScale
        end
    end
    return v22
end
tbl_8.farmEggsPerSecond = function(a1)
    --[[
      name: farmEggsPerSecond
      line: 281
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
        tierMultiplier_upv_1 (copy, index: 2)
        chickSpecialEggsPerSecond_upv_1 (copy, index: 3)
        TROPHY_PRODUCTION_BONUS_upv_1 (copy, index: 4)
        TROPHIES_upv_1 (copy, index: 5)
        catsMultiplier_upv_1 (copy, index: 6)
        recipesMultiplier_upv_1 (copy, index: 7)
    ]]
    local v23 = 0
    for n_10 = 0, #PRODUCERS_upv_1 - 1 do
        v23 = v23 + (PRODUCERS_upv_1[n_10 + 1].baseEggsPerSecond * a1.producers[n_10 + 1]) * tierMultiplier_upv_1(a1, n_10)
    end
    v23 = v23 + chickSpecialEggsPerSecond_upv_1(a1)
    local v24 = 0
    for n_11 = 0, #TROPHIES_upv_1 - 1 do
        if a1.trophies[n_11 + 1] == true then
            v24 = v24 + 1
        end
    end
    return (v23 * ((1 + TROPHY_PRODUCTION_BONUS_upv_1) ^ v24)) * catsMultiplier_upv_1(a1) * recipesMultiplier_upv_1(a1)
end
tbl_8.clickCpsFraction = clickCpsFraction_upv_1
tbl_8.clickValue = function(a1, a2, a3)
    --[[
      name: clickValue
      line: 300
      upvalues:
        BASE_EGGS_PER_CLICK_upv_1 (copy, index: 1)
        clickCpsFraction_upv_1 (copy, index: 2)
    ]]
    return (BASE_EGGS_PER_CLICK_upv_1 + (a2 * clickCpsFraction_upv_1(a1))) * a3
end
tbl_8.earnEggs = function(a1, a2)
    --[[
      name: earnEggs
      line: 304
    ]]
    a1.eggs = a1.eggs + a2
    a1.lifetime = a1.lifetime + a2
end
tbl_8.tryBuyProducer = function(a1, a2)
    --[[
      name: tryBuyProducer
      line: 308
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
        PRICE_GROWTH_upv_1 (copy, index: 2)
    ]]
    local v25 = math.ceil(PRODUCERS_upv_1[a2 + 1].baseCost * (PRICE_GROWTH_upv_1 ^ a1.producers[a2 + 1]))
    if a1.eggs >= v25 then
        a1.eggs = a1.eggs - v25
        local producers_1 = a1.producers
        local v26 = a2 + 1
        producers_1[v26] = producers_1[v26] + 1
        return true
    end
    return false
end
tbl_8.upgradeRevealed = upgradeRevealed_upv_1
tbl_8.tryBuyUpgrade = function(a1, a2)
    --[[
      name: tryBuyUpgrade
      line: 337
      upvalues:
        u1 (copy, index: 1)
        upgradeRevealed_upv_1 (copy, index: 2)
    ]]
    local v27 = u1[a2 + 1]
    if v27 ~= nil and upgradeRevealed_upv_1(a1, v27) then
        if a1.eggs >= v27.cost then
            a1.eggs = a1.eggs - v27.cost
            a1.upgrades[a2 + 1] = true
            return true
        end
        return false
    end
    return false
end
tbl_8.collectNewTrophies = function(a1, a2)
    --[[
      name: collectNewTrophies
      line: 350
      upvalues:
        TROPHIES_upv_1 (copy, index: 1)
    ]]
    local tbl_9 = {}
    local v28 = 0
    local v29 = true
    for v30, value_14 in a1.producers do
        v28 = v28 + value_14
        if value_14 < 1 then
            v29 = false
        end
    end
    for n_12 = 0, #TROPHIES_upv_1 - 1 do
        local v30
        if a1.trophies[n_12 + 1] == true then
            continue
        end
        v30 = TROPHIES_upv_1[n_12 + 1]
        local v31
        if v30.kind == "lifetime" then
            v31 = a1.lifetime
        elseif v30.kind == "clicks" then
            v31 = a1.clicks
        elseif v30.kind == "producersTotal" then
            v31 = v28
        elseif v30.kind == "goldens" then
            v31 = a1.goldens
        elseif v30.kind ~= "eggsPerSecond" then
            v31 = (v29 and 1) or 0
        else
            v31 = a2
        end
        if v30.threshold <= v31 then
            a1.trophies[n_12 + 1] = true
            table.insert(tbl_9, n_12)
        end
    end
    return tbl_9
end
tbl_8.UPGRADE_CATALOG = u1
return tbl_8