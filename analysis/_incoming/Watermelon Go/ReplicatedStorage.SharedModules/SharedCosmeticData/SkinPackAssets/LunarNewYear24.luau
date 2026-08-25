-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Special", Cost = 299, CosmeticName = "Lunar New Year Skin Pack", GiftReceivedImageId = "rbxassetid://16300165763", ShopThumbnailImageId = "rbxassetid://110437644910768", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.LunarNewYear24SkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16291451439"}
tbl_1.FruitBox = {Image = "rbxassetid://16291451081", TopBarColor = Color3.fromRGB(168, 5, 4)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16291455198", Size = UDim2.new(0, 36, 0, 35), Position = UDim2.new(0.496397406, 0, 0.478524595, 0)},
    [2] = {Image = "rbxassetid://16291454766", Size = UDim2.new(0, 51, 0, 47), Position = UDim2.new(0.490802169, 0, 0.490946352, 0)},
    [3] = {Image = "rbxassetid://16291454541", Size = UDim2.new(0, 72, 0, 72), Position = UDim2.new(0.482900411, 0, 0.496969163, 0)},
    [4] = {Image = "rbxassetid://16291454190", Size = UDim2.new(0, 95, 0, 73), Position = UDim2.new(0.492206484, 0, 0.49099198, 0)},
    [5] = {Image = "rbxassetid://16291453842", Size = UDim2.new(0, 140, 0, 127), Position = UDim2.new(0.511800051, 0, 0.425304025, 0)},
    [6] = {Image = "rbxassetid://16291453554", Size = UDim2.new(0, 161, 0, 123), Position = UDim2.new(0, 79, 0, 61)},
    [7] = {Image = "rbxassetid://16291453214", Size = UDim2.new(0, 180, 0, 147), Position = UDim2.new(0, 83, 0, 58)},
    [8] = {Image = "rbxassetid://16291452815", Size = UDim2.new(0, 178, 0, 175), Position = UDim2.new(0, 83, 0, 83)},
    [9] = {Image = "rbxassetid://16291452562", Size = UDim2.new(0, 188, 0, 230), Position = UDim2.new(0, 90, 0, 115)},
    [10] = {Image = "rbxassetid://16291452324", Size = UDim2.new(0, 280, 0, 240), Position = UDim2.new(0, 109, 0, 121)},
    [11] = {Image = "rbxassetid://16291451965", Size = UDim2.new(0, 300, 0, 342), Position = UDim2.new(0, 135, 0, 176)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16291455198", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16291454766", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16291454541", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16291454190", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16291453842", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16303952717", InfographicImage = "rbxassetid://16300310024"},
    MobileControls = {MoveRightImage = "rbxassetid://16303951895", MoveLeftImage = "rbxassetid://16303952221"}
}
return tbl_1