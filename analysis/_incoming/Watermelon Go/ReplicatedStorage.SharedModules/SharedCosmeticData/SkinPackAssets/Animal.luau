-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Legendary", Cost = 249, CosmeticName = "Animal Skin Pack", GiftReceivedImageId = "rbxassetid://16490644736", ShopThumbnailImageId = "rbxassetid://118763160008435", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.AnimalSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16488315726"}
tbl_1.FruitBox = {Image = "rbxassetid://16457140255", TopBarColor = Color3.fromRGB(255, 230, 74)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16457057912", Size = UDim2.new(0, 41, 0, 41), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16457057685", Size = UDim2.new(0, 62, 0, 56), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://16457057421", Size = UDim2.new(0, 85, 0, 161), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16457057251", Size = UDim2.new(0, 116, 0, 88), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://16457057095", Size = UDim2.new(0, 107, 0, 105), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://16457056956", Size = UDim2.new(0, 195, 0, 147), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://16457056700", Size = UDim2.new(0, 197, 0, 160), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://16457056475", Size = UDim2.new(0, 206, 0, 202), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://16457056300", Size = UDim2.new(0, 223, 0, 219), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://16457056047", Size = UDim2.new(1.22099996, 0, 1.11199999, 0), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16457055890", Size = UDim2.new(0, 318, 0, 371), Position = UDim2.new(0.519999981, 0, 0.497000009, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.new(0.294117659, 0.121568635, 0.0352941193), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16457057912", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16457057685", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16457057421", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16457057251", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16457057095", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16491875034", InfographicImage = "rbxassetid://16457055495"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1