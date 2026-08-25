-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.THE_GAMES_START_TIME = DateTime.fromUniversalTime(2024, 8, 1, 16).UnixTimestamp
tbl_1.THE_GAMES_END_TIME = DateTime.fromUniversalTime(2024, 8, 11, 19).UnixTimestamp
tbl_1.taskTypes = {ClickButton = "ClickButton", CreateCantaloupe = "CreateCantaloupe", BeatScore1500 = "BeatScore1500", GetDuelWins = "GetDuelWins", ClickBlueButton = "ClickBlueButton", MergeFruits = "MergeFruits", ClickGreenButton = "ClickGreenButton", Merge25FruitsInOneMinute = "Merge25FruitsInOneMinute", PublicMatchDuelWinsByWatermelon = "PublicMatchDuelWinsByWatermelon", PublicMatchDuelWins = "PublicMatchDuelWins", ClickRedButton = "ClickRedButton"}
tbl_1.taskDescriptions = {
    ClickButton = "Click button %d times",
    CreateCantaloupe = "Create a Cantaloupe (Fruit #7)",
    BeatScore1500 = "Get a high score of 1500+",
    GetDuelWins = "Win %d Duels",
    ClickBlueButton = "ClickRedButton",
    MergeFruits = "Merge %d fruits",
    ClickGreenButton = "ClickRedButton",
    Merge25FruitsInOneMinute = "Merge 25 fruits in the first minute of a match",
    PublicMatchDuelWinsByWatermelon = "<s>Win 1 Public Match Duel with a Watermelon</s>",
    PublicMatchDuelWins = "Win 1 Public Match Duel (surrenders don't count)",
    ClickRedButton = "ClickRedButton"
}
return tbl_1