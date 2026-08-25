-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Doggo Skin Pack", GiftReceivedImageId = "rbxassetid://17120805551", ShopThumbnailImageId = "rbxassetid://125414930625597", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.DoggoSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17118936310"}
tbl_1.FruitBox = {Image = "rbxassetid://17118935300", TopBarColor = Color3.fromRGB(255, 128, 0)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17118940092", Size = UDim2.new(0, 42, 0, 43), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://17118939788", Size = UDim2.new(0, 66, 0, 60), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [3] = {Image = "rbxassetid://17118939495", Size = UDim2.new(0, 90, 0, 95), Position = UDim2.new(0.5, 0, 0.485000014, 0)},
    [4] = {Image = "rbxassetid://17118939063", Size = UDim2.new(0, 94, 0, 100), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [5] = {Image = "rbxassetid://17118977880", Size = UDim2.new(0, 114, 0, 123), Position = UDim2.new(0.5, 0, 0.439999998, 0)},
    [6] = {Image = "rbxassetid://17118938415", Size = UDim2.new(0, 207, 0, 158), Position = UDim2.new(0.5, 0, 0.474999994, 0)},
    [7] = {Image = "rbxassetid://17118938145", Size = UDim2.new(0, 174, 0, 170), Position = UDim2.new(0.5, 2, 0.5, -2)},
    [8] = {Image = "rbxassetid://17118937710", Size = UDim2.new(0, 215, 0, 230), Position = UDim2.new(0.5, 0, 0.455000013, 0)},
    [9] = {Image = "rbxassetid://17118937345", Size = UDim2.new(0, 240, 0, 240), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://17118936976", Size = UDim2.new(0, 299, 0, 299), Position = UDim2.new(0.479999989, 0, 0.465000004, 0)},
    [11] = {Image = "rbxassetid://17118936639", Size = UDim2.new(0, 350, 0, 360), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.new(0.294117659, 0.121568635, 0.0352941193), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17118940092", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17118939788", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17118939495", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://17118939063", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17118977880", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17118934679", InfographicImage = "rbxassetid://17118934165"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1