-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Special", Cost = 99, CosmeticName = "St. Patrick's Skin Pack", GiftReceivedImageId = "rbxassetid://16767709078", ShopThumbnailImageId = "rbxassetid://125217932630878", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.Patricks2024SkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16766629453"}
tbl_1.FruitBox = {Image = "rbxassetid://15666274241", TopBarColor = Color3.new(1, 0.941176534, 0.592156887)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16766674445", Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(0.5, 0, 0.519999981, 0)},
    [2] = {Image = "rbxassetid://16766673899", Size = UDim2.new(0, 56, 0, 59), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://16766673397", Size = UDim2.new(0, 80, 0, 85), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16767552719", Size = UDim2.new(0, 84, 0, 84), Position = UDim2.new(0.50999999, 0, 0.514999986, 0)},
    [5] = {Image = "rbxassetid://16766672525", Size = UDim2.new(0, 105, 0, 103), Position = UDim2.new(0.504999995, 0, 0.460000008, 0)},
    [6] = {Image = "rbxassetid://16766671908", Size = UDim2.new(0, 156, 0, 164), Position = UDim2.new(0.499000013, 0, 0.50999999, 0)},
    [7] = {Image = "rbxassetid://16766671457", Size = UDim2.new(0, 162, 0, 163), Position = UDim2.new(0.50999999, 0, 0.49000001, 0)},
    [8] = {Image = "rbxassetid://16766671046", Size = UDim2.new(0, 205, 0, 205), Position = UDim2.new(0.495999992, 0, 0.497000009, 0)},
    [9] = {Image = "rbxassetid://16766670646", Size = UDim2.new(0, 220, 0, 225), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://16766670167", Size = UDim2.new(0, 285, 0, 275), Position = UDim2.new(0.501999974, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16766669684", Size = UDim2.new(0, 363, 0, 363), Position = UDim2.new(0.519999981, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://15044243217", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(241, 230, 175), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 238, 191)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 195, 84))}), CurrentScoreStrokeColor = Color3.fromRGB(74, 30, 8)},
    NextFruit = {
        Image = "rbxassetid://15044243766",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16766674445", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16766673899", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16766673397", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16767552719", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16766672525", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16766669190", InfographicImage = "rbxassetid://16767602786"},
    MobileControls = {MoveRightImage = "rbxassetid://15300845665", MoveLeftImage = "rbxassetid://15300845942"}
}
return tbl_1