-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local SharedProductIds_1 = require(game.ReplicatedStorage.SharedModules.SharedProductIds)
tbl_1.taskTypes = {GetDuelWins = "GetDuelWins", ConnectToMedal = "ConnectToMedal", Get2000Score = "Get2000Score", ClickButton = "ClickButton"}
tbl_1.taskDisplayTexts = {GetDuelWins = "Win %d Duels", ConnectToMedal = "Connect to Medal", Get2000Score = "Get a high score of 2000+ to claim your free watermelon glasses!", ClickButton = "Click button %d times"}
tbl_1.ugcItems = {
    FruitUgc2 = {CopiesIncreasePerHour = 200, ShowOnLimitedList = false, Stock = 2000, Duration = 2592000, ItemDisplayName = "Melon Berry Glasses", IsRateLimited = true, ProductId = 15406893639, DisplayOrder = 1, ShowThumbnail = true, UgcIconOverride = 15405011289, StartTime = DateTime.fromUniversalTime(2023, 11, 20, 4, 45).UnixTimestamp, Tasks = {[tbl_1.taskTypes.Get2000Score] = 1}},
    FreshCutGlasses = {CopiesIncreasePerHour = 0, ShowOnLimitedList = true, Stock = 10100, Duration = 2.592e+09, ItemDisplayName = "Watermelon GO x FreshCut Glasses", IsRateLimited = false, ProductId = 15884909107, DisplayOrder = 2, ShowThumbnail = true, StartTime = DateTime.fromUniversalTime(2024, 1, 13, 0, 0).UnixTimestamp, Tasks = {[tbl_1.taskTypes.Get2000Score] = 1}},
    ZENNIxFreshCut = {CopiesIncreasePerHour = 0, ShowOnLimitedList = true, Stock = 1292, Duration = 604800, ItemDisplayName = "FreshCut x Zenni Quest", IsRateLimited = false, ProductId = 15884909107, DisplayOrder = 2, ShowThumbnail = true, StartTime = DateTime.fromUniversalTime(2024, 5, 31, 17, 0).UnixTimestamp, Tasks = {[tbl_1.taskTypes.Get2000Score] = 1, [tbl_1.taskTypes.GetDuelWins] = 2}},
    MedalxWMG = {CopiesIncreasePerHour = 0, ShowOnLimitedList = true, Stock = 2000, Duration = 604800, ItemDisplayName = "Medal x WMG Quest", IsRateLimited = false, DisplayOrder = 0, ShowThumbnail = true, StartTime = DateTime.fromUniversalTime(2024, 11, 10, 20, 0).UnixTimestamp, ProductId = SharedProductIds_1.ugcItems.watermelonHead, Tasks = {[tbl_1.taskTypes.ConnectToMedal] = 1, [tbl_1.taskTypes.Get2000Score] = 1}}
}
return tbl_1