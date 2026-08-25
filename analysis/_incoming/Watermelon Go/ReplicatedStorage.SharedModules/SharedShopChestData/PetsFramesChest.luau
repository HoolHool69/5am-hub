-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local developerProducts_1 = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts
local tbl_1 = {Slot = "PlayerFrame", Unavailable = false, DisplayName = "Pets Frames Chest", ExhaustedCoins = 300, CardName = "FramesChest_Pets", Section = "ProfileFrames", Category = "PlayerFrames", Theme = "Animals"}
tbl_1.ProductId = developerProducts_1.PetsFramesChest
tbl_1.BundleProductId = developerProducts_1.PetsFramesChest_x3
tbl_1.GiftProductId = developerProducts_1.GIFT_PetsFramesChest
tbl_1.Pool = {{Weight = 50, ItemId = "Cat"}, {Weight = 50, ItemId = "Rabbit"}, {Weight = 50, ItemId = "Foxy"}, {Weight = 50, ItemId = "Doggo"}}
return tbl_1