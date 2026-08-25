-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Slime Skin Pack", GiftReceivedImageId = "rbxassetid://16490702706", ShopThumbnailImageId = "rbxassetid://111413711921390", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.SlimeSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16488409191"}
tbl_1.FruitBox = {Image = "rbxassetid://16488409436", TopBarColor = Color3.fromRGB(66, 66, 86)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16456119673", Size = UDim2.new(0, 42, 0, 47), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16456119436", Size = UDim2.new(0, 59, 0, 59), Position = UDim2.new(0.490999997, 0, 0.444999993, 0)},
    [3] = {Image = "rbxassetid://16456119130", Size = UDim2.new(0, 95, 0, 95), Position = UDim2.new(0.50999999, 0, 0.479999989, 0)},
    [4] = {Image = "rbxassetid://16456118762", Size = UDim2.new(0, 102, 0, 86), Position = UDim2.new(0.497000009, 0, 0.469999999, 0)},
    [5] = {Image = "rbxassetid://16456118487", Size = UDim2.new(0, 93, 0, 107), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [6] = {Image = "rbxassetid://16456118250", Size = UDim2.new(0, 161, 0, 143), Position = UDim2.new(0.493999988, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://16456118023", Size = UDim2.new(0, 180, 0, 160), Position = UDim2.new(0.493999988, 0, 0.479999989, 0)},
    [8] = {Image = "rbxassetid://16456117882", Size = UDim2.new(0, 225, 0, 215), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [9] = {Image = "rbxassetid://16456117723", Size = UDim2.new(0, 218, 0, 230), Position = UDim2.new(0.50999999, 0, 0.493000001, 0)},
    [10] = {Image = "rbxassetid://16456117463", Size = UDim2.new(0, 310, 0, 330), Position = UDim2.new(0.493701845, 0, 0.496401787, 0)},
    [11] = {Image = "rbxassetid://16456117097", Size = UDim2.new(0, 370, 0, 372), Position = UDim2.new(0.49000001, 0, 0.449999988, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16490483297", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(208, 208, 208))}), CurrentScoreStrokeColor = Color3.fromRGB(0, 0, 0)},
    NextFruit = {
        Image = "rbxassetid://16490483493",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16456119673", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16456119436", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16456119130", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16456118762", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16456118487", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16490523464", InfographicImage = "rbxassetid://16457023074"},
    MobileControls = {MoveRightImage = "rbxassetid://16456391694", MoveLeftImage = "rbxassetid://16456392157"}
}
return tbl_1