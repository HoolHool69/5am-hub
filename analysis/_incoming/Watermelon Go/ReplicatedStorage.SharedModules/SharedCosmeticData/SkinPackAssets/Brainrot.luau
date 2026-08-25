-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 9999, CosmeticName = "Brainrot Skin Pack", ShopThumbnailImageId = "rbxassetid://125731234492838", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17294489199"}
tbl_1.FruitBox = {Image = "rbxassetid://17294488982", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17294491948", Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://17294491708", Size = UDim2.new(0, 55, 0, 55), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://17294491475", Size = UDim2.new(0, 87, 0, 87), Position = UDim2.new(0.519999981, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://17294491265", Size = UDim2.new(0, 90, 0, 90), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://17294491046", Size = UDim2.new(0, 108, 0, 108), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://17294490755", Size = UDim2.new(0, 145, 0, 145), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://17294490532", Size = UDim2.new(0, 165, 0, 165), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://17294489991", Size = UDim2.new(0, 206, 0, 206), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://17294489746", Size = UDim2.new(0, 215, 0, 215), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://17294489490", Size = UDim2.new(0, 270, 0, 270), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://17294489352", Size = UDim2.new(0, 326, 0, 326), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16490483493", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 251, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 251, 251))}), CurrentScoreStrokeColor = Color3.fromRGB(4, 4, 4)},
    NextFruit = {
        Image = "rbxassetid://16490483493",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17294491948", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17294491708", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17294491475", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://17294491265", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17294491046", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17294488460", InfographicImage = "rbxassetid://17294487925"},
    MobileControls = {MoveRightImage = "rbxassetid://16456391694", MoveLeftImage = "rbxassetid://16456392157"}
}
return tbl_1