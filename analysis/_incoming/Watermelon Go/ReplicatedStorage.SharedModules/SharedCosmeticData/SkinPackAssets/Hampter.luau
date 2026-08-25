-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Hamster Skin Pack", GiftReceivedImageId = "rbxassetid://17294288775", ShopThumbnailImageId = "rbxassetid://108044642709243", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.HampterSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17294289496"}
tbl_1.FruitBox = {Image = "rbxassetid://17294289060", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17294293173", Size = UDim2.new(0, 45, 0, 43), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://17294292763", Size = UDim2.new(0, 58, 0, 58), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://17294292468", Size = UDim2.new(0, 90, 0, 90), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://17294292244", Size = UDim2.new(0, 95, 0, 89), Position = UDim2.new(0.519999981, 0, 0.50999999, 0)},
    [5] = {Image = "rbxassetid://17294291996", Size = UDim2.new(0, 108, 0, 108), Position = UDim2.new(0.5, 0, 0.50999999, 0)},
    [6] = {Image = "rbxassetid://17294291654", Size = UDim2.new(0, 150, 0, 145), Position = UDim2.new(0.479999989, 0, 0.50999999, 0)},
    [7] = {Image = "rbxassetid://17294291093", Size = UDim2.new(0, 180, 0, 160), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://17294290492", Size = UDim2.new(0, 210, 0, 200), Position = UDim2.new(0.519999981, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://17294290259", Size = UDim2.new(0, 230, 0, 225), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://17294289857", Size = UDim2.new(0, 295, 0, 285), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://17294289672", Size = UDim2.new(0, 321, 0, 321), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(74, 30, 8), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17294293173", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17294292763", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17294292468", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://17294292244", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17294291996", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17294288556", InfographicImage = "rbxassetid://17294287538"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1