-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Common", Cost = 5000, CosmeticName = "Duck Skin Pack", ShopThumbnailImageId = "rbxassetid://125633612868374", CurrencyType = "Coins"}
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://80781802121648"}
tbl_1.FruitBox = {Image = "rbxassetid://72498184390016", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://127184834623782", Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://78586155672288", Size = UDim2.new(0, 58, 0, 58), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://86572229237631", Size = UDim2.new(0, 78, 0, 82), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://112815494707675", Size = UDim2.new(0, 82, 0, 82), Position = UDim2.new(0.5, 0, 0.483999997, 0)},
    [5] = {Image = "rbxassetid://113742198448680", Size = UDim2.new(0, 105, 0, 105), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://129791677173135", Size = UDim2.new(0, 150, 0, 150), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [7] = {Image = "rbxassetid://114602870548531", Size = UDim2.new(0, 160, 0, 160), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [8] = {Image = "rbxassetid://131518815102305", Size = UDim2.new(1.20000005, 0, 1.20000005, 0), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [9] = {Image = "rbxassetid://101838916625371", Size = UDim2.new(0, 220, 0.200000003, 215), Position = UDim2.new(0.49000001, 0, 0.519999981, 0)},
    [10] = {Image = "rbxassetid://120889402660698", Size = UDim2.new(0, 240, 0, 244), Position = UDim2.new(0.504000008, 0, 0.460000008, 0)},
    [11] = {Image = "rbxassetid://113946181493359", Size = UDim2.new(1.10000002, 0, 1.5, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://127184834623782", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://78586155672288", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://86572229237631", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://112815494707675", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://113742198448680", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://103608188803037", InfographicImage = "rbxassetid://97028075645221"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1