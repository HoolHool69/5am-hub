-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.ChestCategory = "MysteryBox"
tbl_1.TierOrder = table.freeze({"Common", "Uncommon", "Rare", "Epic", "Legendary"})
tbl_1.Tiers = table.freeze(
    {
        Common = {DuplicateCoinValue = 150, ChestTheme = "Chest_1", DisplayName = "Common Box", Color = Color3.fromRGB(176, 190, 197), PullCount = {Min = 2, Max = 3}, RarityMix = {{RarityName = "Common", Weight = 80}, {RarityName = "Uncommon", Weight = 20}}},
        Uncommon = {DuplicateCoinValue = 250, ChestTheme = "Chest_2", DisplayName = "Uncommon Box", Color = Color3.fromRGB(106, 209, 118), PullCount = {Min = 2, Max = 3}, RarityMix = {{RarityName = "Common", Weight = 45}, {RarityName = "Uncommon", Weight = 45}, {RarityName = "Rare", Weight = 10}}},
        Rare = {DuplicateCoinValue = 400, ChestTheme = "Chest_3", DisplayName = "Rare Box", Color = Color3.fromRGB(94, 148, 255), PullCount = {Min = 2, Max = 4}, RarityMix = {{RarityName = "Uncommon", Weight = 60}, {RarityName = "Rare", Weight = 40}}, GuaranteedRarities = {"Rare"}},
        Epic = {DuplicateCoinValue = 800, ChestTheme = "Chest_4", DisplayName = "Epic Box", Color = Color3.fromRGB(177, 106, 240), PullCount = {Min = 3, Max = 4}, RarityMix = {{RarityName = "Rare", Weight = 65}, {RarityName = "Epic", Weight = 35}}, GuaranteedRarities = {"Epic"}},
        Legendary = {DuplicateCoinValue = 1500, ChestTheme = "Chest_5", DisplayName = "Legendary Box", Color = Color3.fromRGB(255, 196, 56), PullCount = {Min = 3, Max = 4}, RarityMix = {{RarityName = "Epic", Weight = 70}, {RarityName = "Legendary", Weight = 30}}, GuaranteedRarities = {"Legendary"}}
    }
)
return tbl_1