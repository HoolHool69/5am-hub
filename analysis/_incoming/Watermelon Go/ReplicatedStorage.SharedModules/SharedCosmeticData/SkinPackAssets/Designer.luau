-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Legendary", Cost = 199, CosmeticName = "Designer Skin Pack", GiftReceivedImageId = "rbxassetid://16928506996", ShopThumbnailImageId = "rbxassetid://116227057319827", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.DesignerSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16927665709"}
tbl_1.FruitBox = {Image = "rbxassetid://16927837229", TopBarColor = Color3.fromRGB(253, 125, 13)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16927578983", Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16927626208", Size = UDim2.new(0, 55, 0, 55), Position = UDim2.new(0.5, 0, 0.519999981, 0)},
    [3] = {Image = "rbxassetid://16927577843", Size = UDim2.new(0, 92, 0, 92), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16928070858", Size = UDim2.new(0, 87, 0, 87), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://16927625862", Size = UDim2.new(0, 105, 0, 105), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://16927966261", Size = UDim2.new(0, 155, 0, 155), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://16927575150", Size = UDim2.new(0, 160, 0, 160), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://16927574797", Size = UDim2.new(0, 207, 0, 207), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://16927625525", Size = UDim2.new(0, 247, 0, 227), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [10] = {Image = "rbxassetid://16928070252", Size = UDim2.new(0, 274, 0, 274), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16927573495", Size = UDim2.new(0, 325, 0, 325), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16927578983", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16927626208", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16927577843", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16927577069", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16927625862", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16927572843", InfographicImage = "rbxassetid://16927572130"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1