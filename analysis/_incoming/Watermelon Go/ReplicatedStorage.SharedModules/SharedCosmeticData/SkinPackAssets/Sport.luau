-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Uncommon", Cost = 7500, CosmeticName = "Sport Skin Pack", ShopThumbnailImageId = "rbxassetid://121061914243452", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16927692239"}
tbl_1.FruitBox = {Image = "rbxassetid://16927691762", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16927696469", Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://16927696040", Size = UDim2.new(0, 55, 0, 55), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://16927695744", Size = UDim2.new(0, 85, 0, 85), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16927695487", Size = UDim2.new(0, 87, 0, 87), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://16927695073", Size = UDim2.new(0, 105, 0, 105), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://16927694477", Size = UDim2.new(0, 145, 0, 145), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://16927694144", Size = UDim2.new(0, 160, 0, 160), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://16927693534", Size = UDim2.new(0, 200, 0, 200), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://16927693165", Size = UDim2.new(0, 217, 0, 247), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://16927692841", Size = UDim2.new(0, 274, 0, 274), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16927692491", Size = UDim2.new(0, 325, 0, 325), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(74, 30, 8), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16927696469", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16927696040", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16927695744", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16927695487", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16927695073", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16927691335", InfographicImage = "rbxassetid://16927690837"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1