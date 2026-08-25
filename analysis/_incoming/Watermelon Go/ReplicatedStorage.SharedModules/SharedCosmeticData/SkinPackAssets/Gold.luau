-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 10000, CosmeticName = "Gold Skin Pack", ShopThumbnailImageId = "rbxassetid://96909329188299", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16302448724"}
tbl_1.FruitBox = {Image = "rbxassetid://16302209539", TopBarColor = Color3.fromRGB(235, 146, 0)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16302209704", Size = UDim2.new(0, 44, 0, 50), Position = UDim2.new(0.5, 0, 0.330000013, 0)},
    [2] = {Image = "rbxassetid://16302207215", Size = UDim2.new(0, 50, 0, 49), Position = UDim2.new(0.50999999, 0, 0.460000008, 0)},
    [3] = {Image = "rbxassetid://16302208322", Size = UDim2.new(0, 70, 0, 68), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16302207910", Size = UDim2.new(0, 74, 0, 74), Position = UDim2.new(0.5, 0, 0.483999997, 0)},
    [5] = {Image = "rbxassetid://16302207022", Size = UDim2.new(0, 98, 0, 100), Position = UDim2.new(0.5, 0, 0.449999988, 0)},
    [6] = {Image = "rbxassetid://16302210207", Size = UDim2.new(0, 125, 0, 128), Position = UDim2.new(0.499000013, 0, 0.467000008, 0)},
    [7] = {Image = "rbxassetid://16302209917", Size = UDim2.new(0, 150, 0, 150), Position = UDim2.new(0.5, 0, 0.444999993, 0)},
    [8] = {Image = "rbxassetid://16302207703", Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://16302207470", Size = UDim2.new(0, 220, 0, 215), Position = UDim2.new(0.49000001, 0, 0.419999987, 0)},
    [10] = {Image = "rbxassetid://16302206521", Size = UDim2.new(0, 240, 0, 244), Position = UDim2.new(0.504000008, 0, 0.460000008, 0)},
    [11] = {Image = "rbxassetid://16302206783", Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16302209704", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16302207215", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16302208322", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16302207910", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16302207022", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16302400530", InfographicImage = "rbxassetid://16302433999"},
    MobileControls = {MoveRightImage = "rbxassetid://16302399194", MoveLeftImage = "rbxassetid://16302399379"}
}
return tbl_1