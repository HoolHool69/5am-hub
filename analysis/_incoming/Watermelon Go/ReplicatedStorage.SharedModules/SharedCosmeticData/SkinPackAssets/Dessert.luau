-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Dessert Skin Pack", GiftReceivedImageId = "rbxassetid://17041787846", ShopThumbnailImageId = "rbxassetid://124340259264318", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.DessertSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17038986449"}
tbl_1.FruitBox = {Image = "rbxassetid://17038985262", TopBarColor = Color3.fromRGB(255, 128, 0)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17038995206", Size = UDim2.new(0, 44, 0, 50), Position = UDim2.new(0.5, 0, 0.526000023, 0)},
    [2] = {Image = "rbxassetid://17038993899", Size = UDim2.new(0, 62, 0, 62), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://17038992840", Size = UDim2.new(0, 90, 0, 100), Position = UDim2.new(0.49000001, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://17038991502", Size = UDim2.new(0, 90, 0, 95), Position = UDim2.new(0.49000001, 0, 0.449999988, 0)},
    [5] = {Image = "rbxassetid://17038990816", Size = UDim2.new(0, 125, 0, 125), Position = UDim2.new(0.532000005, 0, 0.49000001, 0)},
    [6] = {Image = "rbxassetid://17038990218", Size = UDim2.new(0, 165, 0, 165), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://17038989568", Size = UDim2.new(0, 165, 0, 180), Position = UDim2.new(0.49000001, 0, 0.49000001, 0)},
    [8] = {Image = "rbxassetid://17038988720", Size = UDim2.new(0, 215, 0, 235), Position = UDim2.new(0.5, 0, 0.519999981, 0)},
    [9] = {Image = "rbxassetid://17038988005", Size = UDim2.new(0, 230, 0, 230), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://17038987398", Size = UDim2.new(0, 280, 0, 295), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://17038986924", Size = UDim2.new(0, 405, 0, 375), Position = UDim2.new(0.529999971, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(74, 30, 8), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17038995206", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17038993899", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17038992840", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://17038991502", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17038990816", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17038984618", InfographicImage = "rbxassetid://17038983436"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1