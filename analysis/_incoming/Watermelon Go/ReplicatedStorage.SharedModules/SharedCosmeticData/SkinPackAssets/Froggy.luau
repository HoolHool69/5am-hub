-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Froggy Skin Pack", GiftReceivedImageId = "rbxassetid://100546799226750", ShopThumbnailImageId = "rbxassetid://128677223671610", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.FroggySkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://119506264967332"}
tbl_1.FruitBox = {Image = "rbxassetid://92184059633050", TopBarColor = Color3.fromRGB(254, 255, 162)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://130742516195339", Size = UDim2.new(0, 44, 0, 50), Position = UDim2.new(0.519999981, 0, 0.50000006, 0)},
    [2] = {Image = "rbxassetid://106663317598109", Size = UDim2.new(0.170000002, 50, 0.409999996, 49), Position = UDim2.new(0.519999981, 0, 0.480000019, 0)},
    [3] = {Image = "rbxassetid://97179007062679", Size = UDim2.new(0.25, 70, 0.129999995, 68), Position = UDim2.new(0.50000006, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://96861741281344", Size = UDim2.new(0.150000006, 74, 0.180000007, 74), Position = UDim2.new(0.480000019, 0, 0.493999988, 0)},
    [5] = {Image = "rbxassetid://133738744846280", Size = UDim2.new(0.0799999982, 98, 0.119999997, 100), Position = UDim2.new(0.50999999, 0, 0.49000001, 0)},
    [6] = {Image = "rbxassetid://103679913475179", Size = UDim2.new(0.189999998, 125, 0.209999993, 128), Position = UDim2.new(0.499000013, 0, 0.497000009, 0)},
    [7] = {Image = "rbxassetid://137536814224997", Size = UDim2.new(0.0600000024, 150, 0.25, 150), Position = UDim2.new(0.5, 0, 0.474999994, 0)},
    [8] = {Image = "rbxassetid://71713272146648", Size = UDim2.new(1.33000004, 0, 1.18000007, 0), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [9] = {Image = "rbxassetid://88066463185019", Size = UDim2.new(0.0399999991, 220, 0.189999998, 215), Position = UDim2.new(0.50999999, 0, 0.479999989, 0)},
    [10] = {Image = "rbxassetid://112752136150046", Size = UDim2.new(0.200000003, 240, 0.25999999, 244), Position = UDim2.new(0.504000008, 0, 0.50999999, 0)},
    [11] = {Image = "rbxassetid://96887269084383", Size = UDim2.new(1.21000004, 0, 1, 0), Position = UDim2.new(0.50999999, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://130742516195339", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://106663317598109", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://97179007062679", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://96861741281344", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://133738744846280", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://123133902905309", InfographicImage = "rbxassetid://72747296507593"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1