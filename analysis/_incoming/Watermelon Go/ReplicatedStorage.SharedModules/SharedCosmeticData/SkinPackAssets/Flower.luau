-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Common", Cost = 2000, CosmeticName = "Flower Skin Pack", ShopThumbnailImageId = "rbxassetid://94090208703563", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16300461851"}
tbl_1.FruitBox = {Image = "rbxassetid://16300462183", TopBarColor = Color3.fromRGB(76, 12, 39)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16300586645", Size = UDim2.new(0, 39, 0, 37), Position = UDim2.new(0.495999992, 0, 0.492000014, 0)},
    [2] = {Image = "rbxassetid://16300586461", Size = UDim2.new(0, 51, 0, 49), Position = UDim2.new(0.490999997, 0, 0.479999989, 0)},
    [3] = {Image = "rbxassetid://16300586222", Size = UDim2.new(0, 75, 0, 75), Position = UDim2.new(0.5, 0, 0.497000009, 0)},
    [4] = {Image = "rbxassetid://16300585960", Size = UDim2.new(0, 92, 0, 86), Position = UDim2.new(0.497000009, 0, 0.490999997, 0)},
    [5] = {Image = "rbxassetid://16300585725", Size = UDim2.new(0, 90, 0, 87), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [6] = {Image = "rbxassetid://16300585451", Size = UDim2.new(0, 161, 0, 133), Position = UDim2.new(0.493999988, 0, 0.50999999, 0)},
    [7] = {Image = "rbxassetid://16300585081", Size = UDim2.new(0, 180, 0, 157), Position = UDim2.new(0.493660599, 0, 0.488219529, 0)},
    [8] = {Image = "rbxassetid://16300584613", Size = UDim2.new(0, 185, 0, 185), Position = UDim2.new(0.490398824, 0, 0.485714287, 0)},
    [9] = {Image = "rbxassetid://16300584309", Size = UDim2.new(0, 188, 0, 230), Position = UDim2.new(0.490980774, 0, 0.498345703, 0)},
    [10] = {Image = "rbxassetid://16300584027", Size = UDim2.new(0, 270, 0, 230), Position = UDim2.new(0.493701845, 0, 0.496401787, 0)},
    [11] = {Image = "rbxassetid://16300583502", Size = UDim2.new(0, 300, 0, 342), Position = UDim2.new(0.5, 0, 0.495000005, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16300586645", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16300586461", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16300586222", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16300585960", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16300585725", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16303946767", InfographicImage = "rbxassetid://16301257304"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1