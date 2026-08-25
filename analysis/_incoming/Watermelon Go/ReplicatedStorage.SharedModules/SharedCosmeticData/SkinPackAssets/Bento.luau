-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Bento Skin Pack", GiftReceivedImageId = "rbxassetid://16686284232", ShopThumbnailImageId = "rbxassetid://79670842372360", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.BentoSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16686174487"}
tbl_1.FruitBox = {Image = "rbxassetid://15666274241", TopBarColor = Color3.new(1, 0.941176534, 0.592156887)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16675054301", Size = UDim2.new(0, 44, 0, 50), Position = UDim2.new(0.5, 0, 0.460000008, 0)},
    [2] = {Image = "rbxassetid://16675054159", Size = UDim2.new(0, 56, 0, 59), Position = UDim2.new(0.50999999, 0, 0.479999989, 0)},
    [3] = {Image = "rbxassetid://16675053989", Size = UDim2.new(0, 85, 0, 85), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16675053804", Size = UDim2.new(0, 84, 0, 84), Position = UDim2.new(0.5, 0, 0.483999997, 0)},
    [5] = {Image = "rbxassetid://16675081637", Size = UDim2.new(0, 105, 0, 100), Position = UDim2.new(0.504999995, 0, 0.479999989, 0)},
    [6] = {Image = "rbxassetid://16675053412", Size = UDim2.new(0, 148, 0, 148), Position = UDim2.new(0.499000013, 0, 0.479999989, 0)},
    [7] = {Image = "rbxassetid://16675053251", Size = UDim2.new(0, 165, 0, 165), Position = UDim2.new(0.495000005, 0, 0.444999993, 0)},
    [8] = {Image = "rbxassetid://16675052879", Size = UDim2.new(0, 205, 0, 215), Position = UDim2.new(0.49000001, 0, 0.479999989, 0)},
    [9] = {Image = "rbxassetid://16675051691", Size = UDim2.new(0, 230, 0, 230), Position = UDim2.new(0.49000001, 0, 0.479999989, 0)},
    [10] = {Image = "rbxassetid://16675051425", Size = UDim2.new(0, 272, 0, 272), Position = UDim2.new(0.501999974, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16675051083", Size = UDim2.new(0, 345, 0, 350), Position = UDim2.new(0.5, 0, 0.49000001, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16675054301", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16675054159", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16675053989", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16675053804", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16675081637", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16686192595", InfographicImage = "rbxassetid://16686175459"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1