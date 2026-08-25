-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.DefaultPiecesRequired = 3
tbl_1.DefaultPieceAmount = table.freeze({Min = 1, Max = 1})
tbl_1.MinimumScore = table.freeze({SinglePlayer = 500, Duels = 500})
tbl_1.MinimumScoreDefault = 0
tbl_1.ScoreTierWeights = table.freeze(
    {SinglePlayer = {{MinScore = 500, Weights = {Common = 100}}, {MinScore = 1000, Weights = {Uncommon = 100}}, {MinScore = 1500, Weights = {Rare = 100}}, {MinScore = 2500, Weights = {Epic = 100}}, {MinScore = 5000, Weights = {Legendary = 100}}}, Duels = {{MinScore = 500, Weights = {Common = 100}}, {MinScore = 1000, Weights = {Uncommon = 100}}, {MinScore = 1500, Weights = {Rare = 100}}, {MinScore = 2500, Weights = {Epic = 100}}, {MinScore = 5000, Weights = {Legendary = 100}}}}
)
tbl_1.GuaranteedLegendary = table.freeze({RoundNumber = 2, TierName = "Legendary"})
return tbl_1