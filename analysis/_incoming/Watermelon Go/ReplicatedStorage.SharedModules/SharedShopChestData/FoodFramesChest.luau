-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local developerProducts_1 = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts
local tbl_1 = {Slot = "PlayerFrame", Unavailable = false, DisplayName = "Food Frames Chest", ExhaustedCoins = 300, CardName = "FramesChest_Food", Section = "ProfileFrames", Category = "PlayerFrames", Theme = "Desert"}
tbl_1.ProductId = developerProducts_1.FoodFramesChest
tbl_1.BundleProductId = developerProducts_1.FoodFramesChest_x3
tbl_1.GiftProductId = developerProducts_1.GIFT_FoodFramesChest
tbl_1.Pool = {{Weight = 50, ItemId = "RamenRun"}, {Weight = 50, ItemId = "TakoyakiTime"}, {Weight = 50, ItemId = "SugarRush"}, {Weight = 50, ItemId = "BakeryBliss"}}
return tbl_1