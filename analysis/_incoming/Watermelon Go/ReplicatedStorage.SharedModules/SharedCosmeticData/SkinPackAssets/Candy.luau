-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 9000, CosmeticName = "Candy Skin Pack", ShopThumbnailImageId = "rbxassetid://118853521127682", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16580351457"}
tbl_1.FruitBox = {Image = "rbxassetid://16580410856", TopBarColor = Color3.fromRGB(247, 154, 76)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16580332778", Size = UDim2.new(0, 34, 0, 40), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16580332457", Size = UDim2.new(0, 48, 0, 66), Position = UDim2.new(0.5, 0, 0.50999999, 0)},
    [3] = {Image = "rbxassetid://16580332091", Size = UDim2.new(0, 68, 0, 90), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16580331602", Size = UDim2.new(0, 68, 0, 88), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://16580331022", Size = UDim2.new(0, 97, 0, 85), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://16580330709", Size = UDim2.new(0, 135, 0, 150), Position = UDim2.new(0.5, 0, 0.550000012, 0)},
    [7] = {Image = "rbxassetid://16580330450", Size = UDim2.new(0, 150, 0, 132), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://16580351885", Size = UDim2.new(0, 156, 0, 202), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [9] = {Image = "rbxassetid://16580329607", Size = UDim2.new(0, 183, 0, 229), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://16580329114", Size = UDim2.new(0, 226, 0, 271), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16580328657", Size = UDim2.new(0, 350, 0, 371), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16580332778", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16580332457", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16580332091", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16580331602", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16580331022", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16580410368", InfographicImage = "rbxassetid://16580409588"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1