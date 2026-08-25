-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.DefaultItemWeight = 50
tbl_1.ExcludedSlots = table.freeze({})
tbl_1.SlotWeights = table.freeze({PlayerFrame = 1, Cloud = 1, Charm = 1, SkinPack = 1})
tbl_1.ExcludedItems = table.freeze({SkinPack = {Duck = true}})
tbl_1.RarityDrops = table.freeze({Common = {PiecesRequired = 5, DuplicateCoins = 150, PieceAmount = 1}, Uncommon = {PiecesRequired = 4, DuplicateCoins = 250, PieceAmount = 1}, Rare = {PiecesRequired = 3, DuplicateCoins = 400, PieceAmount = 1}, Epic = {PiecesRequired = 3, DuplicateCoins = 800, PieceAmount = {Min = 1, Max = 2}}, Legendary = {PiecesRequired = 3, DuplicateCoins = 1500, PieceAmount = {Min = 1, Max = 2}}})
tbl_1.ItemOverrides = table.freeze({SkinPack = {Meme = {PiecesRequired = 3, Weight = 10, PieceAmount = {Min = 1, Max = 3}}}})
return tbl_1