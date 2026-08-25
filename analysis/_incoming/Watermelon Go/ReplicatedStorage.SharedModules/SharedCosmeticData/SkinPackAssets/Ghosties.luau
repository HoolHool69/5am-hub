-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Ghosties Skin Pack", GiftReceivedImageId = "rbxassetid://17384159377", ShopThumbnailImageId = "rbxassetid://84346314570271", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.GhostiesSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17384238280"}
tbl_1.FruitBox = {Image = "rbxassetid://17384237504", TopBarColor = Color3.fromRGB(216, 226, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17384246733", Size = UDim2.new(0, 49, 0, 46), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://17384246263", Size = UDim2.new(0, 60, 0, 74), Position = UDim2.new(0.50999999, 0, 0.479999989, 0)},
    [3] = {Image = "rbxassetid://17384245814", Size = UDim2.new(0, 90, 0, 96), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://17384245421", Size = UDim2.new(0, 95, 0, 94), Position = UDim2.new(0.50999999, 0, 0.492000014, 0)},
    [5] = {Image = "rbxassetid://17384244840", Size = UDim2.new(0, 120, 0, 105), Position = UDim2.new(0.483999997, 0, 0.469999999, 0)},
    [6] = {Image = "rbxassetid://17384244218", Size = UDim2.new(0, 150, 0, 158), Position = UDim2.new(0.49000001, 0, 0.488999993, 0)},
    [7] = {Image = "rbxassetid://17384243691", Size = UDim2.new(0, 165, 0, 165), Position = UDim2.new(0.479999989, 0, 0.479999989, 0)},
    [8] = {Image = "rbxassetid://17384243290", Size = UDim2.new(1.20000005, 0, 1.20000005, 0), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://17384242968", Size = UDim2.new(0, 220, 0, 215), Position = UDim2.new(0.50999999, 0, 0.479999989, 0)},
    [10] = {Image = "rbxassetid://17384242258", Size = UDim2.new(0, 280, 0, 284), Position = UDim2.new(0.504000008, 0, 0.485000014, 0)},
    [11] = {Image = "rbxassetid://17384240992", Size = UDim2.new(1.25, 0, 1.10000002, 0), Position = UDim2.new(0.479999989, 0, 0.504999995, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16066635585", Position = UDim2.new(-0.577358484, 0, -0.494791627, 0), Size = UDim2.new(2.13962269, 0, 1.96875012, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 182, 255))}), CurrentScoreStrokeColor = Color3.fromRGB(18, 18, 18)},
    NextFruit = {
        Image = "rbxassetid://16066636417",
        Size = UDim2.new(2.14772725, 0, 1.97620749, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17384246733", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17384246263", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17384245814", Size = UDim2.new(0.466216207, 0, 0.466216207, 0)},
            Orange = {Image = "rbxassetid://17384245421", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17384244840", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17384240361", InfographicImage = "rbxassetid://17384238985"},
    MobileControls = {MoveRightImage = "rbxassetid://16080790695", MoveLeftImage = "rbxassetid://16080791786"}
}
return tbl_1