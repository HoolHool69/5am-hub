-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local SharedCosmeticData_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("SharedModules"):WaitForChild("SharedCosmeticData"))
local BoxTiers_upv_1 = require(script:WaitForChild("BoxTiers"))
local DropRules_upv_1 = require(script:WaitForChild("DropRules"))
local BoxRules_upv_1 = require(script:WaitForChild("BoxRules"))
tbl_upv_1.BoxTiers = BoxTiers_upv_1
tbl_upv_1.DropRules = DropRules_upv_1
tbl_upv_1.BoxRules = BoxRules_upv_1
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
local tbl_upv_6 = {}
local u1 = table.freeze({"Closed", "Open", "Front"})
function tbl_upv_1.GetTierNames()
    --[[
      name: GetTierNames
      line: 89
      upvalues:
        BoxTiers_upv_1 (copy, index: 1)
    ]]
    return BoxTiers_upv_1.TierOrder
end
function tbl_upv_1.GetTier(a1)
    --[[
      name: GetTier
      line: 98
      upvalues:
        BoxTiers_upv_1 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return BoxTiers_upv_1.Tiers[a1]
    end
    return nil
end
function tbl_upv_1.GetTierChestArt(a1)
    --[[
      name: GetTierChestArt
      line: 116
      upvalues:
        tbl_upv_1 (copy, index: 1)
        BoxTiers_upv_1 (copy, index: 2)
    ]]
    local v1 = tbl_upv_1.GetTier(a1)
    if v1 and type(v1.ChestTheme) == "string" then
        return BoxTiers_upv_1.ChestCategory, v1.ChestTheme
    end
    return nil, nil
end
function tbl_upv_1.MakeItemKey(a1, a2)
    --[[
      name: MakeItemKey
      line: 131
    ]]
    return a1 .. "/" .. a2
end
function tbl_upv_1.ParseItemKey(a1)
    --[[
      name: ParseItemKey
      line: 140
    ]]
    if type(a1) ~= "string" then
        return nil, nil
    end
    local v2 = string.find(a1, "/", 1, true)
    if v2 then
        return string.sub(a1, 1, v2 - 1), (string.sub(a1, v2 + 1))
    end
    return nil, nil
end
function tbl_upv_1.GetPiecesRequired(a1, a2)
    --[[
      name: GetPiecesRequired
      line: 159
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        BoxRules_upv_1 (copy, index: 3)
    ]]
    local v3 = tbl_upv_3[tbl_upv_1.MakeItemKey(a1, a2)] or (BoxRules_upv_1.DefaultPiecesRequired)
    return v3
end
function tbl_upv_1.GetMinimumScore(a1)
    --[[
      name: GetMinimumScore
      line: 170
      upvalues:
        BoxRules_upv_1 (copy, index: 1)
    ]]
    local v4 = tonumber(BoxRules_upv_1.MinimumScore[a1]) or (BoxRules_upv_1.MinimumScoreDefault)
    return v4
end
function tbl_upv_1.GetDuplicateCoinValue(a1, a2)
    --[[
      name: GetDuplicateCoinValue
      line: 185
      upvalues:
        DropRules_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    if a2 and tonumber(a2.DuplicateCoins) then
        return (tonumber(a2.DuplicateCoins))
    end
    if a2 then
        local v5 = DropRules_upv_1.RarityDrops[a2.Rarity]
        if v5 and tonumber(v5.DuplicateCoins) then
            return (tonumber(v5.DuplicateCoins))
        end
    end
    local v5 = tbl_upv_1.GetTier(a1)
    if v5 then
        return tonumber(v5.DuplicateCoinValue) or 0
    end
    return 0
end
function tbl_upv_1.GetRarityPool(a1)
    --[[
      name: GetRarityPool
      line: 213
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2[a1] or {}
end
function tbl_upv_1.GetPoolSummary()
    --[[
      name: GetPoolSummary
      line: 223
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
    ]]
    local tbl_7 = {}
    local v6 = nil
    for _, value_1 in SharedCosmeticData_upv_1.Rarities.Order do
        if not (SharedCosmeticData_upv_1.Rarities.IsRewardEligible(value_1)) then
            continue
        end
        local v7 = tbl_upv_2[value_1] or {}
        v6 = 0
        for v8, value_2 in v7 do
            v6 = (tbl_upv_4[tbl_upv_1.MakeItemKey(value_2.Slot, value_2.ItemId)] and (v6 + 1)) or v6
        end
        table.insert(tbl_7, {Rarity = value_1, ItemCount = #v7, UnratedCount = v6})
    end
    return tbl_7
end
function tbl_upv_1.RollBoxTier(a1, a2, a3)
    --[[
      name: RollBoxTier
      line: 260
      upvalues:
        BoxTiers_upv_1 (copy, index: 1)
        tbl_upv_5 (copy, index: 2)
        tbl_upv_6 (copy, index: 3)
    ]]
    local v8 = BoxTiers_upv_1.TierOrder[1]
    local v9 = tonumber(a2) or 0
    local v10 = tbl_upv_5[a1]
    local v11 = nil
    if v10 then
        local v12 = v10[1]
        for _, value_3 in ipairs(v10) do
            if v9 < value_3.MinScore then
                break
            else
                v12 = value_3
            end
        end
        local Weights_1 = v12.Weights
        if a3 and v12.WinWeights then
            local _ = v12.WinWeights
        end
        local tbl_8 = {}
        for _, value_4 in ipairs(BoxTiers_upv_1.TierOrder) do
            table.insert(tbl_8, {TierName = value_4, Weight = tonumber(Weights_1[value_4]) or 0})
        end
        v11 = RollWeighted(tbl_8, GetEntryWeight)
        if v11 then
            return v11.TierName
        end
        warn(string.format("[SharedMysteryBoxData] score row (MinScore %d) for '%s' has zero total tier weight", v12.MinScore, tostring(a1)))
    elseif not (tbl_upv_6[a1]) then
        tbl_upv_6[a1] = true
        warn(string.format("[SharedMysteryBoxData] no ScoreTierWeights authored for gamemode '%s', every box falls back to %s", tostring(a1), v8))
    end
    return v8
end
function tbl_upv_1.RollPulls(a1)
    --[[
      name: RollPulls
      line: 312
      upvalues:
        BoxTiers_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v13 = BoxTiers_upv_1.Tiers[a1]
    if v13 then
        local v14 = math.random(v13.PullCount.Min, v13.PullCount.Max)
        local tbl_9 = {}
        if v13.GuaranteedRarities then
            local v15 = nil
            for _, value_5 in ipairs(v13.GuaranteedRarities) do
                if v14 <= #tbl_9 then
                    break
                end
                v15 = RollPullFromRarity(value_5)
                if v15 then
                    table.insert(tbl_9, v15)
                end
            end
        end
        local tbl_10 = {}
        for _, value_6 in ipairs(v13.RarityMix) do
            local v16 = tbl_upv_2[value_6.RarityName]
            if not (v16) then
                continue
            end
            if #v16 > 0 then
                table.insert(tbl_10, value_6)
            end
        end
        while #tbl_9 < v14 do
            local v17 = RollWeighted(tbl_10, GetEntryWeight)
            if v17 then
                local v18 = RollPullFromRarity(v17.RarityName)
                if v18 then
                    table.insert(tbl_9, v18)
                    continue
                else
                    break
                end
            else
                warn(string.format("[SharedMysteryBoxData] tier '%s' has no rollable RarityMix rarities, box shortened to %d pulls", a1, #tbl_9))
                return tbl_9
            end
        end
        return tbl_9
    end
    warn(string.format("[SharedMysteryBoxData] RollPulls called with unknown tier '%s'", tostring(a1)))
    return {}
end
function GetEntryWeight(a1)
    --[[
      name: GetEntryWeight
      line: 372
    ]]
    return tonumber(a1.Weight) or 0
end
function RollWeighted(a1, a2)
    --[[
      name: RollWeighted
      line: 382
    ]]
    local v19 = 0
    for _, value_7 in ipairs(a1) do
        local v20 = a2(value_7)
        if v20 > 0 then
            v19 = v19 + v20
        end
    end
    if v19 <= 0 then
        return nil
    end
    local v21 = math.random() * v19
    local v22 = 0
    for _, value_8 in ipairs(a1) do
        local v23 = a2(value_8)
        if v23 <= 0 then
            continue
        end
        v22 = v22 + v23
        if v21 > v22 then
            continue
        end
        return value_8
    end
    for n_1 = #a1, 1, -1 do
        if a2(a1[n_1]) <= 0 then
            continue
        end
        return a1[n_1]
    end
    return nil
end
function RollPullFromRarity(a1)
    --[[
      name: RollPullFromRarity
      line: 426
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v24 = tbl_upv_2[a1]
    if v24 and #v24 ~= 0 then
        local v25 = RollWeighted(v24, GetEntryWeight)
        if v25 then
            local tbl_11 = {}
            tbl_11.Slot = v25.Slot
            tbl_11.ItemId = v25.ItemId
            tbl_11.Rarity = a1
            tbl_11.PieceAmount = math.random(v25.PieceAmount.Min, v25.PieceAmount.Max)
            tbl_11.PiecesRequired = v25.PiecesRequired
            tbl_11.DuplicateCoins = v25.DuplicateCoins
            return tbl_11
        end
        warn(string.format("[SharedMysteryBoxData] rarity '%s' has zero total weight", a1))
        return nil
    end
    warn(string.format("[SharedMysteryBoxData] rarity '%s' has no items to roll", tostring(a1)))
    return nil
end
function NormalizePieceAmount(a1)
    --[[
      name: NormalizePieceAmount
      line: 455
      upvalues:
        BoxRules_upv_1 (copy, index: 1)
    ]]
    if type(a1) ~= "number" then
        if type(a1) ~= "table" then
            return BoxRules_upv_1.DefaultPieceAmount
        end
        local v26 = math.max(1, math.floor(tonumber(a1.Min) or 1))
        local tbl_12 = {}
        tbl_12.Min = v26
        tbl_12.Max = math.max(v26, math.floor(tonumber(a1.Max) or v26))
        return tbl_12
    else
        local v27 = math.max(1, math.floor(a1))
        local tbl_13 = {}
        tbl_13.Min = v27
        tbl_13.Max = v27
        return tbl_13
    end
end
function GetEligibleSlots()
    --[[
      name: GetEligibleSlots
      line: 478
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        DropRules_upv_1 (copy, index: 2)
    ]]
    local tbl_14 = {}
    for key_1, value_9 in SharedCosmeticData_upv_1.CosmeticSlots.GetAll() do
        if value_9.MemberOfBundle or DropRules_upv_1.ExcludedSlots[key_1] then
            continue
        end
        if SharedCosmeticData_upv_1.IsSlotEnumerated(key_1) then
            table.insert(tbl_14, key_1)
        else
            warn(string.format("[SharedMysteryBoxData] slot '%s' has no enumerated catalog, so nothing in it can drop", key_1))
        end
    end
    table.sort(tbl_14)
    return tbl_14
end
function IsItemExcluded(a1, a2)
    --[[
      name: IsItemExcluded
      line: 511
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        DropRules_upv_1 (copy, index: 2)
    ]]
    if SharedCosmeticData_upv_1.CosmeticSlots.GetDefault(a1) == a2 then
        return true
    end
    local v28 = DropRules_upv_1.ExcludedItems[a1]
    if v28 and v28[a2] then
        return true
    end
    local v29 = SharedCosmeticData_upv_1.GetItemRecord(a1, a2)
    if type(v29) ~= "table" or not (v29.Unavailable) and not (v29.EventItem) then
        return false
    end
    return true
end
function BuildDropEntry(a1, a2, a3)
    --[[
      name: BuildDropEntry
      line: 537
      upvalues:
        DropRules_upv_1 (copy, index: 1)
        BoxRules_upv_1 (copy, index: 2)
    ]]
    local v30 = DropRules_upv_1.RarityDrops[a3]
    if v30 then
        local v31 = DropRules_upv_1.ItemOverrides[a1]
        local v32 = (v31 and (v31[a2])) or {}
        local v33 = tonumber(DropRules_upv_1.SlotWeights[a1]) or 1
        local v34 = tonumber(v32.Weight) or (DropRules_upv_1.DefaultItemWeight * v33)
        local v35 = tonumber(v32.PiecesRequired) or (tonumber(v30.PiecesRequired) or (BoxRules_upv_1.DefaultPiecesRequired))
        local tbl_15 = {PieceAmount = 0, DuplicateCoins = 0}
        tbl_15.Slot = a1
        tbl_15.ItemId = a2
        tbl_15.Rarity = a3
        tbl_15.Weight = v34
        tbl_15.PiecesRequired = math.max(1, math.floor(v35))
        tbl_15.PieceAmount = NormalizePieceAmount(v32.PieceAmount or (v30.PieceAmount))
        tbl_15.DuplicateCoins = tonumber(v32.DuplicateCoins)
        return tbl_15
    end
    warn(string.format("[SharedMysteryBoxData] %s '%s' is rated '%s', which has no RarityDrops row, so it cannot drop", a1, a2, tostring(a3)))
    return nil
end
function BuildRarityPools()
    --[[
      name: BuildRarityPools
      line: 575
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        tbl_upv_4 (copy, index: 4)
        tbl_upv_3 (copy, index: 5)
    ]]
    for _, value_10 in SharedCosmeticData_upv_1.Rarities.Order do
        tbl_upv_2[value_10] = {}
    end
    for _, value_11 in GetEligibleSlots() do
        for v40, value_12 in SharedCosmeticData_upv_1.GetSlotItemIds(value_11) do
            if IsItemExcluded(value_11, value_12) then
                continue
            end
            local v36, v37 = SharedCosmeticData_upv_1.GetItemRarity(value_11, value_12)
            if not (SharedCosmeticData_upv_1.Rarities.IsRarity(v36)) then
                warn(string.format("[SharedMysteryBoxData] %s '%s' resolved to rarity '%s', which is not on the ladder, so it cannot drop", value_11, value_12, tostring(v36)))
                continue
            end
            if not (SharedCosmeticData_upv_1.Rarities.IsRewardEligible(v36)) then
                continue
            end
            local v38 = BuildDropEntry(value_11, value_12, v36)
            if not (v38) then
                continue
            end
            local v39 = tbl_upv_1.MakeItemKey(value_11, value_12)
            if not (v37) then
                tbl_upv_4[v39] = v36
            end
            table.insert(tbl_upv_2[v36], v38)
            tbl_upv_3[v39] = v38.PiecesRequired
        end
    end
end
function ReportBuild()
    --[[
      name: ReportBuild
      line: 622
      upvalues:
        tbl_upv_4 (copy, index: 1)
        SharedCosmeticData_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    local tbl_16 = {}
    for key_2 in tbl_upv_4 do
        table.insert(tbl_16, key_2)
    end
    table.sort(tbl_16)
    if #tbl_16 > 0 then
        local tbl_17 = {}
        for _, value_13 in tbl_16 do
            table.insert(tbl_17, string.format("%s -> %s", value_13, tbl_upv_4[value_13]))
        end
        warn(string.format("[SharedMysteryBoxData] %d cosmetic(s) author no Rarity and dropped in at their slot's default:\n\t%s", #tbl_16, table.concat(tbl_17, "\n\t")))
    end
    for _, value_14 in SharedCosmeticData_upv_1.Rarities.Order do
        if not (SharedCosmeticData_upv_1.Rarities.IsRewardEligible(value_14)) then
            continue
        end
        if #tbl_upv_2[value_14] == 0 then
            warn(string.format("[SharedMysteryBoxData] nothing in the game is rated '%s', so no box can pull one", value_14))
        end
    end
end
function ValidateTiers()
    --[[
      name: ValidateTiers
      line: 661
      upvalues:
        BoxTiers_upv_1 (copy, index: 1)
    ]]
    for _, value_15 in ipairs(BoxTiers_upv_1.TierOrder) do
        if not (BoxTiers_upv_1.Tiers[value_15]) then
            warn(string.format("[SharedMysteryBoxData] TierOrder lists '%s' but Tiers does not define it", value_15))
        end
    end
    for key_3, value_16 in pairs(BoxTiers_upv_1.Tiers) do
        if not (table.find(BoxTiers_upv_1.TierOrder, key_3)) then
            warn(string.format("[SharedMysteryBoxData] tier '%s' is defined but missing from TierOrder", key_3))
        end
        local PullCount_1 = value_16.PullCount
        if type(PullCount_1) ~= "table" or (tonumber(PullCount_1.Min) or 0) < 1 or (tonumber(PullCount_1.Max) or 0) < (tonumber(PullCount_1.Min) or 1) then
            warn(string.format("[SharedMysteryBoxData] tier '%s' has an invalid PullCount range", key_3))
        end
        for _, value_17 in ipairs(value_16.RarityMix or {}) do
            ValidateTierRarity(key_3, value_17.RarityName, "mixes")
        end
        for _, value_18 in ipairs(value_16.GuaranteedRarities or {}) do
            ValidateTierRarity(key_3, value_18, "guarantees")
        end
        ValidateTierChestArt(key_3, value_16)
    end
end
function ValidateTierChestArt(a1, a2)
    --[[
      name: ValidateTierChestArt
      line: 704
      upvalues:
        BoxTiers_upv_1 (copy, index: 1)
        SharedCosmeticData_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local ChestTheme_1 = a2.ChestTheme
    if type(ChestTheme_1) == "string" then
        local ChestCategory_1 = BoxTiers_upv_1.ChestCategory
        local v40 = SharedCosmeticData_upv_1.ChestSprites.GetStates(ChestCategory_1, ChestTheme_1)
        if #v40 ~= 0 then
            for _, value_19 in u1 do
                if not (table.find(v40, value_19)) then
                    warn(string.format("[SharedMysteryBoxData] tier '%s' chest '%s/%s' has no '%s' art", a1, tostring(ChestCategory_1), ChestTheme_1, value_19))
                end
            end
        else
            warn(string.format("[SharedMysteryBoxData] tier '%s' names chest art '%s/%s', which does not exist", a1, tostring(ChestCategory_1), ChestTheme_1))
        end
    else
        warn(string.format("[SharedMysteryBoxData] tier '%s' authors no ChestTheme, so its reveal keeps the chest art the place was authored with", a1))
    end
end
function ValidateTierRarity(a1, a2, a3)
    --[[
      name: ValidateTierRarity
      line: 734
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    if SharedCosmeticData_upv_1.Rarities.IsRarity(a2) then
        if SharedCosmeticData_upv_1.Rarities.IsRewardEligible(a2) then
            local v41 = tbl_upv_2[a2]
            if not (v41) or #v41 == 0 then
                warn(string.format("[SharedMysteryBoxData] tier '%s' %s rarity '%s', which nothing is rated", a1, a3, a2))
            end
        else
            warn(string.format("[SharedMysteryBoxData] tier '%s' %s rarity '%s', which is excluded from gameplay rewards and can never be pulled", a1, a3, a2))
        end
    else
        warn(string.format("[SharedMysteryBoxData] tier '%s' %s '%s', which is not a rarity", a1, a3, tostring(a2)))
    end
end
function ValidateRarityDrops()
    --[[
      name: ValidateRarityDrops
      line: 759
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        DropRules_upv_1 (copy, index: 2)
    ]]
    for _, value_20 in SharedCosmeticData_upv_1.Rarities.Order do
        if not (SharedCosmeticData_upv_1.Rarities.IsRewardEligible(value_20)) then
            continue
        end
        if not (DropRules_upv_1.RarityDrops[value_20]) then
            warn(string.format("[SharedMysteryBoxData] rarity '%s' has no RarityDrops row, so nothing rated it can drop", value_20))
        end
    end
    for key_4 in DropRules_upv_1.RarityDrops do
        if not (SharedCosmeticData_upv_1.Rarities.IsRarity(key_4)) then
            warn(string.format("[SharedMysteryBoxData] RarityDrops authors '%s', which is not on the rarity ladder", tostring(key_4)))
        end
    end
end
function BuildScoreRows()
    --[[
      name: BuildScoreRows
      line: 786
      upvalues:
        BoxRules_upv_1 (copy, index: 1)
        BoxTiers_upv_1 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
    ]]
    for key_5, value_21 in pairs(BoxRules_upv_1.ScoreTierWeights) do
        local tbl_18 = {}
        for key_6, value_22 in ipairs(value_21) do
            if type(value_22) ~= "table" or type(value_22.Weights) ~= "table" then
                warn(string.format("[SharedMysteryBoxData] '%s' score row #%d is malformed", key_5, key_6))
                continue
            end
            for _, value_23 in ipairs({value_22.Weights, value_22.WinWeights}) do
                for key_7 in pairs(value_23) do
                    if not (BoxTiers_upv_1.Tiers[key_7]) then
                        warn(string.format("[SharedMysteryBoxData] '%s' score row #%d weights unknown tier '%s'", key_5, key_6, tostring(key_7)))
                    end
                end
            end
            table.insert(tbl_18, {MinScore = tonumber(value_22.MinScore) or 0, Weights = value_22.Weights, WinWeights = value_22.WinWeights})
        end
        for n_2 = 2, #tbl_18 do
            if tbl_18[n_2].MinScore < tbl_18[n_2 - 1].MinScore then
                warn(string.format("[SharedMysteryBoxData] '%s' score rows are not ascending by MinScore; sorting them at runtime", key_5))
                break
            end
        end
        table.sort(
            tbl_18,
            function(a1, a2)
                --[[
                  line: 820
                ]]
                return a1.MinScore < a2.MinScore
            end
        )
        if #tbl_18 <= 0 then
            warn(string.format("[SharedMysteryBoxData] '%s' has no usable score rows", key_5))
        else
            tbl_upv_5[key_5] = tbl_18
        end
    end
end
function ValidateGuaranteedLegendary()
    --[[
      name: ValidateGuaranteedLegendary
      line: 836
      upvalues:
        BoxRules_upv_1 (copy, index: 1)
        BoxTiers_upv_1 (copy, index: 2)
    ]]
    local GuaranteedLegendary_1 = BoxRules_upv_1.GuaranteedLegendary
    if not GuaranteedLegendary_1 then
        return
    end
    if not (BoxTiers_upv_1.Tiers[GuaranteedLegendary_1.TierName]) then
        warn(string.format("[SharedMysteryBoxData] GuaranteedLegendary points at unknown tier '%s'", tostring(GuaranteedLegendary_1.TierName)))
    end
    if (tonumber(GuaranteedLegendary_1.RoundNumber) or 0) < 1 then
        warn("[SharedMysteryBoxData] GuaranteedLegendary.RoundNumber must be at least 1")
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 853
    ]]
    ValidateRarityDrops()
    BuildRarityPools()
    ReportBuild()
    ValidateTiers()
    BuildScoreRows()
    ValidateGuaranteedLegendary()
end
Initialize()
return tbl_upv_1