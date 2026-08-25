-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Special", Cost = 99, CosmeticName = "Christmas Skin Pack", GiftReceivedImageId = "rbxassetid://133601089402985", ShopThumbnailImageId = "rbxassetid://111521453138427", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.Christmas2024SkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://80781802121648"}
tbl_1.FruitBox = {Image = "rbxassetid://72498184390016", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://124125867067028", Size = UDim2.new(0, 42, 0, 42), Position = UDim2.new(0.49000001, 0, 0.389999986, 0)},
    [2] = {Image = "rbxassetid://102642576135795", Size = UDim2.new(0, 51, 0, 51), Position = UDim2.new(0.50999999, 0, 0.460000008, 0)},
    [3] = {Image = "rbxassetid://109266242958816", Size = UDim2.new(0, 75, 0, 75), Position = UDim2.new(0.5, 0, 0.474999994, 0)},
    [4] = {Image = "rbxassetid://138772111681780", Size = UDim2.new(0, 82, 0, 82), Position = UDim2.new(0.5, 0, 0.449999988, 0)},
    [5] = {Image = "rbxassetid://115110309815542", Size = UDim2.new(0, 90, 0, 90), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://112637591320950", Size = UDim2.new(0, 120, 0, 120), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://118982354544893", Size = UDim2.new(0, 132, 0, 132), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://95486634622535", Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://86351398070368", Size = UDim2.new(0, 183, 0, 183), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://78079144112498", Size = UDim2.new(0, 250, 0, 250), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://121595720419853", Size = UDim2.new(1.12, 0, 1, 0), Position = UDim2.new(0.430000007, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://124125867067028", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://102642576135795", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://109266242958816", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://138772111681780", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://115110309815542", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://129440721317851", InfographicImage = "rbxassetid://94223140128752"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1