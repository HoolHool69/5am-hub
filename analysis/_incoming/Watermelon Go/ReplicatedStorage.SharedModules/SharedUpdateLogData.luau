-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local SharedModules_1 = game:GetService("ReplicatedStorage"):WaitForChild("SharedModules")
local SharedCosmeticData_upv_1 = require(SharedModules_1:WaitForChild("SharedCosmeticData"))
local SharedShopChestData_upv_1 = require(SharedModules_1:WaitForChild("SharedShopChestData"))
tbl_upv_1.RewardStates = {Expired = "Expired", Claimable = "Claimable", Claimed = "Claimed", None = "None"}
tbl_upv_1.RewardTypes = {Chest = "Chest", Currency = "Currency", Item = "Item"}
tbl_upv_1.CurrentUpdate = {Id = "2026.08.15", RewardWindowDays = 3, ReleasedAtUnix = 1787443200, Rewards = {{ChestId = "CharmChest", Type = "Chest", ExhaustedCoins = 500}}}
local u1 = {}
function tbl_upv_1.GetCurrentUpdate()
    --[[
      name: GetCurrentUpdate
      line: 129
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.CurrentUpdate
end
function tbl_upv_1.GetUpdateId()
    --[[
      name: GetUpdateId
      line: 138
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local CurrentUpdate_1 = tbl_upv_1.CurrentUpdate
    if typeof(CurrentUpdate_1.Id) == "string" then
        return CurrentUpdate_1.Id
    end
    return ""
end
function tbl_upv_1.GetRewards()
    --[[
      name: GetRewards
      line: 156
      upvalues:
        u1 (ref, index: 1)
    ]]
    return u1
end
function tbl_upv_1.HasReward()
    --[[
      name: HasReward
      line: 164
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = #u1 > 0
    return v1
end
function tbl_upv_1.GetRewardDeadlineUnix()
    --[[
      name: GetRewardDeadlineUnix
      line: 172
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local CurrentUpdate_2 = tbl_upv_1.CurrentUpdate
    return (CurrentUpdate_2.ReleasedAtUnix or 0) + ((CurrentUpdate_2.RewardWindowDays or 0) * 86400)
end
function tbl_upv_1.IsRewardWindowOpen(a1)
    --[[
      name: IsRewardWindowOpen
      line: 185
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if not tbl_upv_1.HasReward() then
        return false
    end
    local v2 = a1 < tbl_upv_1.GetRewardDeadlineUnix()
    return v2
end
function tbl_upv_1.GetRewardSecondsRemaining(a1)
    --[[
      name: GetRewardSecondsRemaining
      line: 199
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (math.max(0, tbl_upv_1.GetRewardDeadlineUnix() - a1))
end
function tbl_upv_1.GetRewardWindowDays()
    --[[
      name: GetRewardWindowDays
      line: 207
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.CurrentUpdate.RewardWindowDays or 0
end
function ValidateCurrentUpdate()
    --[[
      name: ValidateCurrentUpdate
      line: 218
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local CurrentUpdate_3 = tbl_upv_1.CurrentUpdate
    if typeof(CurrentUpdate_3.Id) == "string" and CurrentUpdate_3.Id ~= "" then
        if typeof(CurrentUpdate_3.ReleasedAtUnix) ~= "number" or CurrentUpdate_3.ReleasedAtUnix <= 0 then
            warn((("[SharedUpdateLogData] update \"%*\" has no ReleasedAtUnix, its reward window cannot be measured and the rewards will read as expired"):format(CurrentUpdate_3.Id)))
        end
        if CurrentUpdate_3.Rewards ~= nil and typeof(CurrentUpdate_3.Rewards) ~= "table" then
            warn((("[SharedUpdateLogData] update \"%*\" has a Rewards field that is not a list, it will ship no rewards"):format(CurrentUpdate_3.Id)))
        end
        return
    end
    warn("[SharedUpdateLogData] CurrentUpdate.Id is empty, no update log will be shown")
end
function BuildValidatedRewards()
    --[[
      name: BuildValidatedRewards
      line: 241
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local Rewards_1 = tbl_upv_1.CurrentUpdate.Rewards
    if typeof(Rewards_1) ~= "table" then
        return {}
    end
    local tbl_2 = {}
    for key_1, value_1 in ipairs(Rewards_1) do
        local v3 = ValidateRewardEntry(key_1, value_1)
        if v3 then
            table.insert(tbl_2, v3)
        end
    end
    return tbl_2
end
function ValidateRewardEntry(a1, a2)
    --[[
      name: ValidateRewardEntry
      line: 269
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local RewardTypes_1 = tbl_upv_1.RewardTypes
    if typeof(a2) == "table" and typeof(a2.Type) == "string" then
        if a2.Type ~= RewardTypes_1.Currency then
            if a2.Type ~= RewardTypes_1.Item then
                if a2.Type ~= RewardTypes_1.Chest then
                    warn(string.format("[SharedUpdateLogData] reward #%d has unknown Type '%s', entry excluded", a1, a2.Type))
                    return nil
                end
                return ValidateChestEntry(a1, a2)
            end
            return ValidateItemEntry(a1, a2)
        end
        return ValidateCurrencyEntry(a1, a2)
    end
    warn(string.format("[SharedUpdateLogData] reward #%d is malformed (needs a Type string), entry excluded", a1))
    return nil
end
function ValidateCurrencyEntry(a1, a2)
    --[[
      name: ValidateCurrencyEntry
      line: 295
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if typeof(a2.Currency) == "string" and a2.Currency ~= "" then
        if typeof(a2.Amount) == "number" and a2.Amount > 0 then
            local tbl_3 = {}
            tbl_3.Type = tbl_upv_1.RewardTypes.Currency
            tbl_3.Currency = a2.Currency
            tbl_3.Amount = math.floor(a2.Amount)
            tbl_3.DisplayName = ResolveDisplayName(a2, a2.Currency)
            tbl_3.Image = a2.Image
            tbl_3.ImageRectOffset = a2.ImageRectOffset
            tbl_3.ImageRectSize = a2.ImageRectSize
            return tbl_3
        end
        warn(string.format("[SharedUpdateLogData] currency reward #%d ('%s') needs a positive Amount, entry excluded", a1, a2.Currency))
        return nil
    end
    warn(string.format("[SharedUpdateLogData] currency reward #%d has no Currency name, entry excluded", a1))
    return nil
end
function ValidateItemEntry(a1, a2)
    --[[
      name: ValidateItemEntry
      line: 320
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    if typeof(a2.Slot) == "string" and typeof(a2.ItemId) == "string" then
        if SharedCosmeticData_upv_1.CosmeticSlots.IsSlot(a2.Slot) then
            if SharedCosmeticData_upv_1.IsSlotEnumerated(a2.Slot) and not (SharedCosmeticData_upv_1.IsValidCosmetic(a2.Slot, a2.ItemId)) then
                warn(string.format("[SharedUpdateLogData] item reward #%d: '%s' is not a valid %s item, entry excluded", a1, a2.ItemId, a2.Slot))
                return nil
            end
            local v4 = 1
            if typeof(a2.Amount) == "number" and a2.Amount >= 1 then
                v4 = math.floor(a2.Amount)
            end
            local tbl_4 = {}
            tbl_4.Type = tbl_upv_1.RewardTypes.Item
            tbl_4.Slot = a2.Slot
            tbl_4.ItemId = a2.ItemId
            tbl_4.Amount = v4
            tbl_4.DisplayName = ResolveDisplayName(a2, SharedCosmeticData_upv_1.GetItemDisplayName(a2.Slot, a2.ItemId))
            tbl_4.Image = a2.Image
            tbl_4.ImageRectOffset = a2.ImageRectOffset
            tbl_4.ImageRectSize = a2.ImageRectSize
            ResolveItemArt(tbl_4)
            return tbl_4
        end
        warn(string.format("[SharedUpdateLogData] item reward #%d: '%s' is not a cosmetic slot, entry excluded", a1, a2.Slot))
        return nil
    end
    warn(string.format("[SharedUpdateLogData] item reward #%d is malformed (needs Slot + ItemId strings), entry excluded", a1))
    return nil
end
function ValidateChestEntry(a1, a2)
    --[[
      name: ValidateChestEntry
      line: 370
      upvalues:
        SharedShopChestData_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        SharedCosmeticData_upv_1 (copy, index: 3)
    ]]
    if typeof(a2.ChestId) == "string" and a2.ChestId ~= "" then
        local v5 = SharedShopChestData_upv_1.GetChest(a2.ChestId)
        if v5 then
            local v6 = nil
            if typeof(a2.ExhaustedCoins) == "number" and a2.ExhaustedCoins > 0 then
                v6 = math.floor(a2.ExhaustedCoins)
            end
            local tbl_5 = {ImageRectSize = 0, Amount = 1, ImageRectOffset = 0, Image = 0, DisplayName = 0}
            tbl_5.Type = tbl_upv_1.RewardTypes.Chest
            tbl_5.ChestId = a2.ChestId
            tbl_5.ExhaustedCoins = v6
            tbl_5.DisplayName = ResolveDisplayName(a2, v5.DisplayName or (a2.ChestId))
            tbl_5.Image = a2.Image
            tbl_5.ImageRectOffset = a2.ImageRectOffset
            tbl_5.ImageRectSize = a2.ImageRectSize
            if not (tbl_5.Image) then
                local v7 = SharedCosmeticData_upv_1.ChestSprites.Get(v5.Category, v5.Theme, "Closed")
                if v7 then
                    tbl_5.Image = v7.Image
                    tbl_5.ImageRectOffset = v7.RectOffset
                    tbl_5.ImageRectSize = v7.RectSize
                end
            end
            return tbl_5
        end
        warn(string.format("[SharedUpdateLogData] chest reward #%d: '%s' is not a shop chest, entry excluded", a1, a2.ChestId))
        return nil
    end
    warn(string.format("[SharedUpdateLogData] chest reward #%d has no ChestId, entry excluded", a1))
    return nil
end
function ResolveDisplayName(a1, a2)
    --[[
      name: ResolveDisplayName
      line: 414
    ]]
    if typeof(a1.DisplayName) == "string" and a1.DisplayName ~= "" then
        return a1.DisplayName
    end
    return a2
end
function ResolveItemArt(a1)
    --[[
      name: ResolveItemArt
      line: 432
      upvalues:
        SharedCosmeticData_upv_1 (copy, index: 1)
    ]]
    if not a1.Image then
        local v8 = nil
        if a1.Slot ~= "Cloud" then
            local v9 = nil
            if a1.Slot == "PlayerFrame" then
                v9 = SharedCosmeticData_upv_1.PlayerFrames.GetSpriteRect(a1.ItemId)
                if v9 then
                    a1.Image = v9.Image
                    a1.ImageRectOffset = v9.RectOffset
                    a1.ImageRectSize = v9.RectSize
                end
            elseif a1.Slot == "SkinPack" then
                local v10 = SharedCosmeticData_upv_1.GetItemRecord("SkinPack", a1.ItemId)
                if typeof(v10) == "table" and typeof(v10.ShopThumbnailImageId) == "string" then
                    a1.Image = v10.ShopThumbnailImageId
                end
            end
        else
            v8 = SharedCosmeticData_upv_1.Clouds.GetIconSpec(a1.ItemId)
            if v8 then
                a1.Image = v8.Image
                a1.ImageRectOffset = v8.ImageRectOffset
                a1.ImageRectSize = v8.ImageRectSize
            end
        end
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 471
      upvalues:
        u1 (ref, index: 1)
    ]]
    ValidateCurrentUpdate()
    u1 = BuildValidatedRewards()
end
Initialize()
return tbl_upv_1