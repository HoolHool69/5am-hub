-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local SharedModules_1 = game:GetService("ReplicatedStorage"):WaitForChild("SharedModules")
local SharedCosmeticData_upv_1 = require(SharedModules_1:WaitForChild("SharedCosmeticData"))
local SharedShopChestData_upv_1 = require(SharedModules_1:WaitForChild("SharedShopChestData"))
local EraCalendar_1 = require(script:WaitForChild("EraCalendar"))
local ScoreWeights_upv_1 = require(script:WaitForChild("ScoreWeights"))
local Tiers_upv_1 = require(script:WaitForChild("Tiers"))
local v1 = table.freeze({"Tenure", "Era", "Intensity", "Supporter"})
local u1 = table.freeze({Chest = "Chest", Currency = "Currency", Item = "Item"})
tbl_upv_1.RewardTypes = u1
tbl_upv_1.Components = table.freeze({Tenure = "Tenure", Era = "Era", Intensity = "Intensity", Supporter = "Supporter"})
tbl_upv_1.ComponentOrder = v1
tbl_upv_1.EraCalendar = EraCalendar_1
tbl_upv_1.ScoreWeights = ScoreWeights_upv_1
tbl_upv_1.Tiers = Tiers_upv_1
local u2 = 0
local tbl_upv_2 = {}
local tbl_upv_3 = {}
function tbl_upv_1.IsDormant()
    --[[
      name: IsDormant
      line: 97
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = tbl_upv_1.GetLegacyCutoffUnix() <= 0
    return v2
end
function tbl_upv_1.GetLegacyCutoffUnix()
    --[[
      name: GetLegacyCutoffUnix
      line: 106
      upvalues:
        Tiers_upv_1 (copy, index: 1)
    ]]
    return tonumber(Tiers_upv_1.LegacyCutoffUnix) or 0
end
function tbl_upv_1.IsLegacyPlayer(a1)
    --[[
      name: IsLegacyPlayer
      line: 117
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = tbl_upv_1.GetLegacyCutoffUnix()
    if v3 <= 0 then
        return false
    end
    local v4 = tonumber(a1) or 0
    if v4 > 0 then
        return v4 < v3
    end
    return false
end
function tbl_upv_1.GetTenureBand(a1)
    --[[
      name: GetTenureBand
      line: 138
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    local v5 = tonumber(a1) or 0
    if v5 > 0 then
        for _, value_1 in ipairs(ScoreWeights_upv_1.Tenure) do
            if v5 >= value_1.JoinedBeforeUnix then
                continue
            end
            return value_1
        end
    end
    return nil
end
function tbl_upv_1.GetEraPoints(a1, a2)
    --[[
      name: GetEraPoints
      line: 161
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    local v6 = ScoreWeights_upv_1.Era[a1]
    if v6 then
        local v7 = math.max(math.floor(tonumber(a2) or 0), 0)
        if v7 <= 0 then
            return 0
        end
        local v8 = math.min(v7, tonumber(v6.MaxRepeats) or 1)
        return (tonumber(v6.Points) or 0) * v8
    end
    warn((("[SharedOGScoreData] no Era weight named \"%*\", scoring it as zero"):format(tostring(a1))))
    return 0
end
function tbl_upv_1.GetBandedPoints(a1, a2, a3)
    --[[
      name: GetBandedPoints
      line: 186
    ]]
    local v9 = ResolveBandedLine(a1, a2)
    if not v9 then
        return 0
    end
    local v10 = tonumber(a3) or 0
    local Bands_1 = v9.Bands
    local v11 = nil
    for n_1 = #Bands_1, 1, -1 do
        v11 = Bands_1[n_1]
        if v11.AtLeast > v10 then
            continue
        end
        return tonumber(v11.Points) or 0
    end
    return 0
end
function tbl_upv_1.GetComponentCap(a1)
    --[[
      name: GetComponentCap
      line: 213
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    if a1 ~= "Intensity" then
        if a1 ~= "Supporter" then
            return nil
        end
        return (tonumber(ScoreWeights_upv_1.SupporterCap))
    end
    return (tonumber(ScoreWeights_upv_1.IntensityCap))
end
function tbl_upv_1.GetMaxPossibleScore()
    --[[
      name: GetMaxPossibleScore
      line: 231
      upvalues:
        u2 (ref, index: 1)
    ]]
    return u2
end
function tbl_upv_1.GetLadder()
    --[[
      name: GetLadder
      line: 239
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2
end
function tbl_upv_1.GetTier(a1)
    --[[
      name: GetTier
      line: 248
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v12 = tonumber(a1) or 0
    if v12 >= 1 then
        return tbl_upv_2[v12]
    end
    return nil
end
function tbl_upv_1.ResolveTier(a1, a2, a3)
    --[[
      name: ResolveTier
      line: 268
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    if not a3 then
        return 0, nil
    end
    local v13 = tonumber(a1) or 0
    local v14 = tonumber(a2) or 0
    local v15 = 0
    for key_1, value_2 in ipairs(tbl_upv_2) do
        if v13 < value_2.MinScore then
            break
        elseif not (value_2.MinBestScore) or v14 >= value_2.MinBestScore then
            v15 = key_1
            continue
        else
            break
        end
    end
    return v15, tbl_upv_2[v15]
end
function tbl_upv_1.GetRewardsUpToTier(a1)
    --[[
      name: GetRewardsUpToTier
      line: 301
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local v16 = tonumber(a1) or 0
    if v16 >= 1 then
        return tbl_upv_3[v16] or {}
    end
    return {}
end
function tbl_upv_1.GetSummaryRows()
    --[[
      name: GetSummaryRows
      line: 318
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    local tbl_4 = {}
    for _, value_3 in ipairs(ScoreWeights_upv_1.Tenure) do
        table.insert(tbl_4, {Component = "Tenure", Notes = "One band only, first match wins", Key = value_3.Key, Label = value_3.Label, Detail = value_3.Detail, Points = tonumber(value_3.Points) or 0, Max = tonumber(value_3.Points) or 0})
    end
    for _, value_4 in ipairs(GetSortedKeys(ScoreWeights_upv_1.Era)) do
        local v17 = ScoreWeights_upv_1.Era[value_4]
        local v18 = tonumber(v17.Points) or 0
        local v19 = tonumber(v17.MaxRepeats) or 1
        local tbl_5 = {Component = "Era", Notes = 0}
        tbl_5.Key = value_4
        tbl_5.Label = v17.Label
        tbl_5.Detail = v17.Detail
        tbl_5.Points = v18
        tbl_5.Max = v18 * v19
        tbl_5.Notes = v19 > 1 and ("Up to %* times"):format(v19) or "Once"
        table.insert(tbl_4, tbl_5)
    end
    AppendBandedRows(tbl_4, "Intensity", ScoreWeights_upv_1.Intensity)
    AppendBandedRows(tbl_4, "Supporter", ScoreWeights_upv_1.Supporter)
    return tbl_4
end
function tbl_upv_1.FormatSummary()
    --[[
      name: FormatSummary
      line: 362
      upvalues:
        tbl_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
        Tiers_upv_1 (copy, index: 3)
        tbl_upv_2 (copy, index: 4)
    ]]
    local tbl_6 = {"OG SCORE LADDER"}
    local v21 = ""
    for _, value_5 in ipairs(tbl_upv_1.GetSummaryRows()) do
        if value_5.Component ~= v21 then
            local Component_1 = value_5.Component
            table.insert(tbl_6, "")
            table.insert(tbl_6, string.format("[%s]%s", value_5.Component, DescribeCap(value_5.Component)))
            v21 = Component_1
        end
        table.insert(tbl_6, string.format("  %-16s %4d pts (max %3d)  %s", value_5.Label, value_5.Points, value_5.Max, value_5.Notes))
    end
    table.insert(tbl_6, "")
    table.insert(tbl_6, string.format("MAX POSSIBLE TOTAL: %d", u2))
    table.insert(tbl_6, string.format("Dev benchmark: %d, top tier at %d%% of it", tonumber(Tiers_upv_1.DevBenchmarkScore) or 0, math.floor((tonumber(Tiers_upv_1.TopTierBenchmarkFraction) or 0) * 100)))
    table.insert(tbl_6, "")
    table.insert(tbl_6, "TIERS")
    for key_2, value_6 in ipairs(tbl_upv_2) do
        local v22 = ((value_6.MinBestScore) and (string.format(", best score %d+", value_6.MinBestScore))) or ""
        table.insert(tbl_6, string.format("  %d. %-14s score %3d+%s", key_2, value_6.DisplayName, value_6.MinScore, v22))
        for _, value_7 in ipairs(value_6.Rewards) do
            table.insert(tbl_6, string.format("       + %s", DescribeReward(value_7)))
        end
    end
    if tbl_upv_1.IsDormant() then
        table.insert(tbl_6, "")
        table.insert(tbl_6, "DORMANT: Tiers.LegacyCutoffUnix is 0, so nobody qualifies for anything")
    end
    return table.concat(tbl_6, "\n")
end
function tbl_upv_1.DescribeReward(a1)
    --[[
      name: DescribeReward
      line: 407
    ]]
    return DescribeReward(a1)
end
function ResolveBandedLine(a1, a2)
    --[[
      name: ResolveBandedLine
      line: 418
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    local v23 = ((a1 == "Intensity") and (ScoreWeights_upv_1.Intensity)) or ((a1 == "Supporter") and (ScoreWeights_upv_1.Supporter))
    if v23 then
        local v24 = v23[a2]
        if v24 and typeof(v24.Bands) == "table" then
            return v24
        end
        warn((("[SharedOGScoreData] no %* weight named \"%*\", scoring it as zero"):format(a1, tostring(a2))))
    else
        warn((("[SharedOGScoreData] \"%*\" is not a banded component, scoring \"%*\" as zero"):format(tostring(a1), tostring(a2))))
    end
    return nil
end
function AppendBandedRows(a1, a2, a3)
    --[[
      name: AppendBandedRows
      line: 443
    ]]
    for _, value_8 in ipairs(GetSortedKeys(a3)) do
        local v25 = a3[value_8]
        local v26 = GetLineMaxPoints(v25)
        for v27, value_9 in ipairs(v25.Bands) do
            table.insert(a1, {Component = a2, Key = ("%*:%*"):format(value_8, value_9.AtLeast), Label = v25.Label, Detail = v25.Detail, Points = tonumber(value_9.Points) or 0, Max = v26, Notes = ("At %*+, highest band only"):format(value_9.AtLeast)})
        end
    end
end
function GetLineMaxPoints(a1)
    --[[
      name: GetLineMaxPoints
      line: 468
    ]]
    local v27 = 0
    for _, value_10 in ipairs(a1.Bands) do
        v27 = math.max(v27, tonumber(value_10.Points) or 0)
    end
    return v27
end
function DescribeCap(a1)
    --[[
      name: DescribeCap
      line: 483
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v28 = tbl_upv_1.GetComponentCap(a1)
    if v28 then
        return string.format(" capped at %d", v28)
    end
    return ""
end
function DescribeReward(a1)
    --[[
      name: DescribeReward
      line: 498
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.Type ~= u1.Currency then
        if a1.Type ~= u1.Item then
            if a1.Type ~= u1.Chest then
                return (tostring(a1.Type))
            end
            return string.format("%s, one opening", a1.DisplayName or (a1.ChestId))
        end
        return string.format("%s (%s)", a1.DisplayName or (a1.ItemId), a1.Slot)
    end
    return string.format("%d %s", a1.Amount, a1.Currency)
end
function GetSortedKeys(a1)
    --[[
      name: GetSortedKeys
      line: 521
    ]]
    local tbl_7 = {}
    for key_3 in pairs(a1) do
        table.insert(tbl_7, key_3)
    end
    table.sort(tbl_7)
    return tbl_7
end
function ValidateWeights()
    --[[
      name: ValidateWeights
      line: 539
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    ValidateTenureBands()
    for _, value_11 in ipairs(GetSortedKeys(ScoreWeights_upv_1.Era)) do
        local v29 = ScoreWeights_upv_1.Era[value_11]
        if (tonumber(v29.Points) or 0) < 0 then
            warn((("[SharedOGScoreData] Era line \"%*\" has negative Points, which subtracts from the score"):format(value_11)))
        end
        if not (v29.MaxRepeats) then
            continue
        end
        if (tonumber(v29.MaxRepeats) or 0) < 1 then
            warn((("[SharedOGScoreData] Era line \"%*\" has a MaxRepeats below 1, so it can never score"):format(value_11)))
        end
    end
    ValidateBandedComponent("Intensity", ScoreWeights_upv_1.Intensity, tonumber(ScoreWeights_upv_1.IntensityCap) or 0)
    ValidateBandedComponent("Supporter", ScoreWeights_upv_1.Supporter, tonumber(ScoreWeights_upv_1.SupporterCap) or 0)
end
function ValidateTenureBands()
    --[[
      name: ValidateTenureBands
      line: 565
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    local v30 = 0
    local v31 = math.huge
    for key_4, value_12 in ipairs(ScoreWeights_upv_1.Tenure) do
        local v32 = tonumber(value_12.JoinedBeforeUnix) or 0
        local v33 = tonumber(value_12.Points) or 0
        if v32 <= v30 then
            warn((("[SharedOGScoreData] Tenure band #%* (\"%*\") does not sit after the band above it, so it can never be reached"):format(key_4, tostring(value_12.Key))))
        end
        if v31 < v33 then
            warn((("[SharedOGScoreData] Tenure band #%* (\"%*\") pays MORE than the older band above it, so joining later scores higher"):format(key_4, tostring(value_12.Key))))
        end
        v30, v31 = v32, v33
    end
end
function ValidateBandedComponent(a1, a2, a3)
    --[[
      name: ValidateBandedComponent
      line: 594
    ]]
    local v34 = 0
    local v35 = nil
    for _, value_13 in ipairs(GetSortedKeys(a2)) do
        local v36 = a2[value_13]
        if typeof(v36.Bands) ~= "table" or #v36.Bands == 0 then
            warn((("[SharedOGScoreData] %* line \"%*\" has no Bands, so it can never score"):format(a1, value_13)))
            continue
        end
        local v37 = -math.huge
        local v38 = -math.huge
        for key_5, value_14 in ipairs(v36.Bands) do
            v35 = tonumber(value_14.AtLeast) or 0
            local v39 = tonumber(value_14.Points) or 0
            if v35 <= v37 then
                warn((("[SharedOGScoreData] %* line \"%*\" band #%* does not climb, so it can never be reached"):format(a1, value_13, key_5)))
            end
            if v39 < v38 then
                warn((("[SharedOGScoreData] %* line \"%*\" band #%* pays less than the band below it"):format(a1, value_13, key_5)))
            end
            v37, v38 = v35, v39
        end
        v34 = v34 + GetLineMaxPoints(v36)
    end
    if a3 > 0 then
        if a3 < v34 then
            warn((("[SharedOGScoreData] %* weights can reach %* but are capped at %*, so %* points can never be earned"):format(a1, v34, a3, v34 - a3)))
        end
    else
        warn((("[SharedOGScoreData] %* has no cap, so its weights are unbounded"):format(a1)))
    end
end
function BuildLadder()
    --[[
      name: BuildLadder
      line: 647
      upvalues:
        Tiers_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
        tbl_upv_2 (copy, index: 3)
        tbl_upv_3 (copy, index: 4)
    ]]
    local v40 = -math.huge
    local v41 = 0
    local tbl_8 = {}
    for key_6, value_15 in ipairs(Tiers_upv_1.Ladder) do
        local v42 = tonumber(value_15.MinScore) or 0
        local num_1 = tonumber(value_15.MinBestScore)
        if typeof(value_15.Key) ~= "string" or value_15.Key == "" then
            warn((("[SharedOGScoreData] tier #%* has no Key, which is what the profile stamp and analytics record"):format(key_6)))
        end
        if v42 < v40 then
            warn((("[SharedOGScoreData] tier #%* (\"%*\") needs a LOWER score than the tier below it, so it can never be reached"):format(key_6, tostring(value_15.Key))))
        end
        if u2 < v42 then
            warn((("[SharedOGScoreData] tier #%* (\"%*\") needs %* but the weights can only reach %*, so nobody can ever reach it"):format(key_6, tostring(value_15.Key), v42, u2)))
        end
        if num_1 and num_1 < v41 then
            warn((("[SharedOGScoreData] tier #%* (\"%*\") relaxes the best-score gate below the tier's own, which the ladder walk cannot honour"):format(key_6, tostring(value_15.Key))))
        end
        local v43 = ValidateRewards(value_15)
        for _, value_16 in ipairs(v43) do
            table.insert(tbl_8, value_16)
        end
        local tbl_9 = {StandingText = 0, MinBestScore = 0, MinScore = 0, Rewards = 0, Detail = 0, DisplayName = 0}
        tbl_9.Key = value_15.Key
        tbl_9.DisplayName = value_15.DisplayName or (value_15.Key)
        tbl_9.Detail = value_15.Detail or ""
        tbl_9.StandingText = typeof(value_15.StandingText) == "string" and value_15.StandingText or ""
        tbl_9.MinScore = v42
        tbl_9.MinBestScore = num_1
        tbl_9.Rewards = v43
        table.insert(tbl_upv_2, tbl_9)
        tbl_upv_3[key_6] = table.clone(tbl_8)
        v41 = num_1 or v41
        v40 = v42
    end
end
function ValidateRewards(a1)
    --[[
      name: ValidateRewards
      line: 707
    ]]
    local tbl_10 = {}
    if typeof(a1.Rewards) == "table" then
        for key_7, value_17 in ipairs(a1.Rewards) do
            local v45 = ValidateRewardEntry(a1, key_7, value_17)
            if v45 then
                table.insert(tbl_10, v45)
            end
        end
    else
        warn((("[SharedOGScoreData] tier \"%*\" has no Rewards list, so it pays nothing"):format(tostring(a1.Key))))
    end
    return tbl_10
end
function ValidateRewardEntry(a1, a2, a3)
    --[[
      name: ValidateRewardEntry
      line: 732
      upvalues:
        u1 (copy, index: 1)
    ]]
    local str_1 = tostring(a1.Key)
    if typeof(a3) == "table" and typeof(a3.Type) == "string" then
        if a3.Type ~= u1.Currency then
            if a3.Type ~= u1.Item then
                if a3.Type ~= u1.Chest then
                    warn((("[SharedOGScoreData] tier \"%*\" reward #%* has unknown Type \"%*\", entry excluded"):format(str_1, a2, a3.Type)))
                    return nil
                end
                return ValidateChestEntry(str_1, a2, a3)
            end
            return ValidateItemEntry(str_1, a2, a3)
        end
        return ValidateCurrencyEntry(str_1, a2, a3)
    end
    warn((("[SharedOGScoreData] tier \"%*\" reward #%* is malformed (needs a Type string), entry excluded"):format(str_1, a2)))
    return nil
end
function ValidateCurrencyEntry(a1, a2, a3)
    --[[
      name: ValidateCurrencyEntry
      line: 758
      upvalues:
        u1 (copy, index: 1)
    ]]
    if typeof(a3.Currency) == "string" and a3.Currency ~= "" then
        if typeof(a3.Amount) == "number" and a3.Amount > 0 then
            local tbl_11 = {DisplayName = 0}
            tbl_11.Type = u1.Currency
            tbl_11.Currency = a3.Currency
            tbl_11.Amount = math.floor(a3.Amount)
            tbl_11.DisplayName = a3.DisplayName or (a3.Currency)
            return tbl_11
        end
        warn((("[SharedOGScoreData] tier \"%*\" reward #%* (\"%*\") needs a positive Amount, entry excluded"):format(a1, a2, a3.Currency)))
        return nil
    end
    warn((("[SharedOGScoreData] tier \"%*\" reward #%* has no Currency name, entry excluded"):format(a1, a2)))
    return nil
end
function ValidateItemEntry(a1, a2, a3)
    --[[
      name: ValidateItemEntry
      line: 781
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    if typeof(a3.Slot) == "string" and typeof(a3.ItemId) == "string" then
        if SharedCosmeticData_upv_1.CosmeticSlots.IsSlot(a3.Slot) then
            if SharedCosmeticData_upv_1.IsSlotEnumerated(a3.Slot) and not (SharedCosmeticData_upv_1.IsValidCosmetic(a3.Slot, a3.ItemId)) then
                warn((("[SharedOGScoreData] tier \"%*\" reward #%*: \"%*\" is not a valid %* item, entry excluded"):format(a1, a2, a3.ItemId, a3.Slot)))
                return nil
            end
            local v46 = 1
            if typeof(a3.Amount) == "number" and a3.Amount >= 1 then
                v46 = math.floor(a3.Amount)
            end
            local tbl_12 = {DisplayName = 0}
            tbl_12.Type = u1.Item
            tbl_12.Slot = a3.Slot
            tbl_12.ItemId = a3.ItemId
            tbl_12.Amount = v46
            tbl_12.DisplayName = a3.DisplayName or SharedCosmeticData_upv_1.GetItemDisplayName(a3.Slot, a3.ItemId) or a3.ItemId
            return tbl_12
        end
        warn((("[SharedOGScoreData] tier \"%*\" reward #%*: \"%*\" is not a cosmetic slot, entry excluded"):format(a1, a2, a3.Slot)))
        return nil
    end
    warn((("[SharedOGScoreData] tier \"%*\" reward #%* is malformed (needs Slot + ItemId strings), entry excluded"):format(a1, a2)))
    return nil
end
function ValidateChestEntry(a1, a2, a3)
    --[[
      name: ValidateChestEntry
      line: 815
      upvalues:
        SharedShopChestData_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    if typeof(a3.ChestId) == "string" and a3.ChestId ~= "" then
        local v48 = SharedShopChestData_upv_1.GetChest(a3.ChestId)
        if v48 then
            local v49 = tonumber(a3.ExhaustedCoins) or (tonumber(v48.ExhaustedCoins) or 0)
            if v49 <= 0 then
                warn((("[SharedOGScoreData] tier \"%*\" reward #%*: chest \"%*\" has no ExhaustedCoins, so a player who owns its whole pool gets nothing"):format(a1, a2, a3.ChestId)))
            end
            local tbl_13 = {DisplayName = 0}
            tbl_13.Type = u1.Chest
            tbl_13.ChestId = a3.ChestId
            tbl_13.ExhaustedCoins = v49
            tbl_13.DisplayName = a3.DisplayName or (v48.DisplayName or (a3.ChestId))
            return tbl_13
        end
        warn((("[SharedOGScoreData] tier \"%*\" reward #%*: \"%*\" is not a shop chest, entry excluded"):format(a1, a2, a3.ChestId)))
        return nil
    end
    warn((("[SharedOGScoreData] tier \"%*\" reward #%* is malformed (needs a ChestId string), entry excluded"):format(a1, a2)))
    return nil
end
function ComputeMaxPossibleScore()
    --[[
      name: ComputeMaxPossibleScore
      line: 846
      upvalues:
        ScoreWeights_upv_1 (copy, index: 1)
    ]]
    local v50 = 0
    for _, value_18 in ipairs(ScoreWeights_upv_1.Tenure) do
        v50 = math.max(v50, tonumber(value_18.Points) or 0)
    end
    local v51 = 0 + v50
    for _, value_19 in pairs(ScoreWeights_upv_1.Era) do
        v51 = v51 + (tonumber(value_19.Points) or 0) * (tonumber(value_19.MaxRepeats) or 1)
    end
    return v51 + ComputeBandedMax(ScoreWeights_upv_1.Intensity, tonumber(ScoreWeights_upv_1.IntensityCap) or 0) + ComputeBandedMax(ScoreWeights_upv_1.Supporter, tonumber(ScoreWeights_upv_1.SupporterCap) or 0)
end
function ComputeBandedMax(a1, a2)
    --[[
      name: ComputeBandedMax
      line: 867
    ]]
    local v52 = 0
    for _, value_20 in pairs(a1) do
        if typeof(value_20.Bands) == "table" then
            v52 = v52 + GetLineMaxPoints(value_20)
        end
    end
    if a2 <= 0 then
        return v52
    end
    return (math.min(v52, a2))
end
function Initialize()
    --[[
      name: Initialize
      line: 890
      upvalues:
        u2 (ref,  index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    ValidateWeights()
    u2 = ComputeMaxPossibleScore()
    BuildLadder()
    if not tbl_upv_1.IsDormant() then
        return
    end
    warn("[SharedOGScoreData] DORMANT: Tiers.LegacyCutoffUnix is 0, so no player qualifies for any OG tier and nothing will be granted. Set it to the update's release time before shipping")
end
Initialize()
return tbl_upv_1