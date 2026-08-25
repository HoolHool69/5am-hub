-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Common", Cost = 5000, CosmeticName = "Pixel Skin Pack", ShopThumbnailImageId = "rbxassetid://103737859518300", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17119159107"}
tbl_1.FruitBox = {Image = "rbxassetid://17119158796", TopBarColor = Color3.fromRGB(255, 230, 74)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17119162148", Size = UDim2.new(0, 42, 0, 42), Position = UDim2.new(0.5, 1, 0.419999987, 0)},
    [2] = {Image = "rbxassetid://17119162048", Size = UDim2.new(0, 57, 0, 51), Position = UDim2.new(0.50999999, 0, 0.479999989, 0)},
    [3] = {Image = "rbxassetid://17119161934", Size = UDim2.new(0, 83, 0, 170), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [4] = {Image = "rbxassetid://17119161831", Size = UDim2.new(0, 105, 0, 81), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [5] = {Image = "rbxassetid://17119161704", Size = UDim2.new(0, 90, 0, 101), Position = UDim2.new(0.5, 1, 0.469999999, 0)},
    [6] = {Image = "rbxassetid://17119161542", Size = UDim2.new(0, 173, 0, 132), Position = UDim2.new(0.5, 1, 0.469999999, 0)},
    [7] = {Image = "rbxassetid://17119161212", Size = UDim2.new(1.10000002, 0, 1.10000002, 0), Position = UDim2.new(0.5, 0, 0.449999988, 0)},
    [8] = {Image = "rbxassetid://17119160775", Size = UDim2.new(1.07000005, 0, 1.07000005, 0), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [9] = {Image = "rbxassetid://17119160471", Size = UDim2.new(0, 220, 0, 220), Position = UDim2.new(0.5, 2, 0.425000012, 0)},
    [10] = {Image = "rbxassetid://17119160190", Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://17119159985", Size = UDim2.new(0, 290, 0, 290), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.new(0.294117659, 0.121568635, 0.0352941193), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17119162148", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17119162048", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17119161934", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://17119161831", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17119161704", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17119159709", InfographicImage = "rbxassetid://17119158459"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1