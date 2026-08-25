-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Special", Cost = 99, CosmeticName = "Easter Skin Pack", GiftReceivedImageId = "rbxassetid://16928410150", ShopThumbnailImageId = "rbxassetid://104406421910972", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.Easter2024SkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16927640491"}
tbl_1.FruitBox = {Image = "rbxassetid://16582700813", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16927645252", Size = UDim2.new(0, 42, 0, 42), Position = UDim2.new(0.529999971, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16927656275", Size = UDim2.new(0, 56, 0, 57), Position = UDim2.new(0.513000011, 0, 0.50999999, 0)},
    [3] = {Image = "rbxassetid://16927644713", Size = UDim2.new(0, 85, 0, 92), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16927644359", Size = UDim2.new(0, 89, 0, 89), Position = UDim2.new(0.50999999, 0, 0.50999999, 0)},
    [5] = {Image = "rbxassetid://16927643963", Size = UDim2.new(0, 115, 0, 110), Position = UDim2.new(0.529999971, 0, 0.479999989, 0)},
    [6] = {Image = "rbxassetid://16927643542", Size = UDim2.new(0, 158, 0, 158), Position = UDim2.new(0.49000001, 0, 0.49000001, 0)},
    [7] = {Image = "rbxassetid://16927642727", Size = UDim2.new(0, 163, 0, 163), Position = UDim2.new(0.5, 0, 0.49000001, 0)},
    [8] = {Image = "rbxassetid://16927642348", Size = UDim2.new(0, 207, 0, 207), Position = UDim2.new(0.49000001, 0, 0.49000001, 0)},
    [9] = {Image = "rbxassetid://16927641969", Size = UDim2.new(0, 247, 0, 247), Position = UDim2.new(0.5, 0, 0.49000001, 0)},
    [10] = {Image = "rbxassetid://16927641516", Size = UDim2.new(0, 274, 0, 274), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16927640797", Size = UDim2.new(0, 325, 0, 325), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(74, 30, 8), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16927645252", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16927656275", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16927644713", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16927644359", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16927643963", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16927639983", InfographicImage = "rbxassetid://16927639521"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1