-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Common", Cost = 5500, CosmeticName = "Veggie Skin Pack", ShopThumbnailImageId = "rbxassetid://113161144328040", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://15057161589"}
tbl_1.FruitBox = {Image = "rbxassetid://15666274241", TopBarColor = Color3.fromRGB(255, 240, 151)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17038687006", Size = UDim2.new(0, 45, 0, 45), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://17038686481", Size = UDim2.new(0, 60, 0, 60), Position = UDim2.new(0.5, 0, 0.519999981, 0)},
    [3] = {Image = "rbxassetid://17038685814", Size = UDim2.new(0, 90, 0, 105), Position = UDim2.new(0.50999999, 0, 0.460000008, 0)},
    [4] = {Image = "rbxassetid://17038735212", Size = UDim2.new(0, 95, 0, 95), Position = UDim2.new(0.5, 0, 0.555000007, 0)},
    [5] = {Image = "rbxassetid://17038684476", Size = UDim2.new(0, 115, 0, 115), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [6] = {Image = "rbxassetid://17038732741", Size = UDim2.new(0, 160, 0, 155), Position = UDim2.new(0.5, 0, 0.50999999, 0)},
    [7] = {Image = "rbxassetid://17038683138", Size = UDim2.new(0, 162, 0, 162), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://17038682200", Size = UDim2.new(0, 225, 0, 215), Position = UDim2.new(0.49000001, 0, 0.50999999, 0)},
    [9] = {Image = "rbxassetid://17038732264", Size = UDim2.new(0, 230, 0, 245), Position = UDim2.new(0.5, 0, 0.50999999, 0)},
    [10] = {Image = "rbxassetid://17038680537", Size = UDim2.new(0, 280, 0, 285), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://17038731602", Size = UDim2.new(0, 335, 0, 370), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17038687006", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17038686481", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17038685814", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://17038735212", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17038684476", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17038679105", InfographicImage = "rbxassetid://17038678197"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1