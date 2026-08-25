-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Special", Cost = 9999999999999, EventItem = true, CosmeticName = "Valentines Skin Pack", ShopThumbnailImageId = "rbxassetid://115176556440738", CurrencyType = "Coins"}
tbl_1.StartTime = DateTime.fromUniversalTime(2024, 2, 14, 5, 0).UnixTimestamp
tbl_1.EndTime = DateTime.fromUniversalTime(2024, 2, 19, 18, 0).UnixTimestamp
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16357293652"}
tbl_1.FruitBox = {Image = "rbxassetid://16357425728", TopBarColor = Color3.fromRGB(122, 49, 172)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16357441566", Size = UDim2.new(0, 39, 0, 39), Position = UDim2.new(0.495999992, 0, 0.499000013, 0)},
    [2] = {Image = "rbxassetid://16357441010", Size = UDim2.new(0, 53, 0, 53), Position = UDim2.new(0.497999996, 0, 0.490999997, 0)},
    [3] = {Image = "rbxassetid://16357443294", Size = UDim2.new(0, 82, 0, 92), Position = UDim2.new(0.48300001, 0, 0.460000008, 0)},
    [4] = {Image = "rbxassetid://16357444140", Size = UDim2.new(0, 95, 0, 83), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://16357441802", Size = UDim2.new(0, 105, 0, 127), Position = UDim2.new(0.50999999, 0, 0.519999981, 0)},
    [6] = {Image = "rbxassetid://16357440684", Size = UDim2.new(0, 161, 0, 143), Position = UDim2.new(0, 79, 0, 60)},
    [7] = {Image = "rbxassetid://16357443622", Size = UDim2.new(0, 180, 0, 162), Position = UDim2.new(0, 79, 0, 62)},
    [8] = {Image = "rbxassetid://16357439056", Size = UDim2.new(0, 218, 0, 217), Position = UDim2.new(0, 86, 0, 82)},
    [9] = {Image = "rbxassetid://16357439304", Size = UDim2.new(0, 208, 0, 230), Position = UDim2.new(0, 92, 0, 108)},
    [10] = {Image = "rbxassetid://16357441995", Size = UDim2.new(0, 290, 0, 260), Position = UDim2.new(0, 114, 0, 114)},
    [11] = {Image = "rbxassetid://16357440359", Size = UDim2.new(0, 390, 0, 372), Position = UDim2.new(0, 135, 0, 149)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16066635585", Position = UDim2.new(-0.577358484, 0, -0.494791627, 0), Size = UDim2.new(2.13962269, 0, 1.96875012, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(224, 182, 255))}), CurrentScoreStrokeColor = Color3.fromRGB(18, 18, 18)},
    NextFruit = {
        Image = "rbxassetid://16066636417",
        Size = UDim2.new(2.14772725, 0, 1.97620749, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16357441566", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16357441010", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16357443294", Size = UDim2.new(0.466216207, 0, 0.466216207, 0)},
            Orange = {Image = "rbxassetid://16357444140", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16357441802", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16380679215", InfographicImage = "rbxassetid://16360650146"},
    MobileControls = {MoveRightImage = "rbxassetid://16080790695", MoveLeftImage = "rbxassetid://16080791786"}
}
return tbl_1