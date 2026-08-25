-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Epic", Cost = 149, CosmeticName = "Cat Cafe Skin Pack", GiftReceivedImageId = "rbxassetid://16829104942", ShopThumbnailImageId = "rbxassetid://111103122179939", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.CatCafeSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16827622261"}
tbl_1.FruitBox = {Image = "rbxassetid://16582700813", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16827625626", Size = UDim2.new(0, 40, 0, 45), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16827674771", Size = UDim2.new(0, 51, 0, 51), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://16827624937", Size = UDim2.new(0, 80, 0, 80), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16827624674", Size = UDim2.new(0, 82, 0, 82), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://16827624396", Size = UDim2.new(0, 102, 0, 102), Position = UDim2.new(0.5, 0, 0.519999981, 0)},
    [6] = {Image = "rbxassetid://16827674431", Size = UDim2.new(0, 135, 0, 135), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://16827623613", Size = UDim2.new(0, 150, 0, 150), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://16827623327", Size = UDim2.new(0, 192, 0, 192), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://16827623066", Size = UDim2.new(0, 205, 0, 205), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://16827622824", Size = UDim2.new(0, 252, 0, 252), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16827622567", Size = UDim2.new(0, 303, 0, 303), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16828707327", Position = UDim2.new(-0.57113862, 0, -0.485596299, 0), Size = UDim2.new(2.14227724, 0, 1.9711926, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 206, 157)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 137, 134))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://16828803839",
        Size = UDim2.new(2.14974165, 0, 1.97806096, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16827625626", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16827674771", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16827624937", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16827624674", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16827624396", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16828624337", InfographicImage = "rbxassetid://16828623940"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1