-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local developerProducts_1 = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts
local tbl_1 = {Slot = "PlayerFrame", Unavailable = false, DisplayName = "Flower Frames Chest", ExhaustedCoins = 300, CardName = "FramesChest_Flower", Section = "ProfileFrames", Category = "PlayerFrames", Theme = "Flower"}
tbl_1.ProductId = developerProducts_1.FlowerFramesChest
tbl_1.BundleProductId = developerProducts_1.FlowerFramesChest_x3
tbl_1.GiftProductId = developerProducts_1.GIFT_FlowerFramesChest
tbl_1.Pool = {{Weight = 50, ItemId = "Frostbloom"}, {Weight = 50, ItemId = "Springtide"}, {Weight = 50, ItemId = "Autumnfall"}, {Weight = 50, ItemId = "Sunburst"}}
return tbl_1