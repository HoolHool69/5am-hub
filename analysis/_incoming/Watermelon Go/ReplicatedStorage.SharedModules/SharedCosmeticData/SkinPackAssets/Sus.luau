-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Sus Skin Pack", GiftReceivedImageId = "rbxassetid://16767668217", ShopThumbnailImageId = "rbxassetid://97508806512560", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.SusSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16767910267"}
tbl_1.FruitBox = {Image = "rbxassetid://16767934029", TopBarColor = Color3.fromRGB(29, 29, 29)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16767113451", Size = UDim2.new(0, 38, 0, 38), Position = UDim2.new(0.5, 0, 0.519999981, 0)},
    [2] = {Image = "rbxassetid://16767113043", Size = UDim2.new(0, 56, 0, 59), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://16767203306", Size = UDim2.new(0, 80, 0, 85), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://16767112488", Size = UDim2.new(0, 84, 0, 84), Position = UDim2.new(0.5, 0, 0.483999997, 0)},
    [5] = {Image = "rbxassetid://16767112263", Size = UDim2.new(0, 105, 0, 103), Position = UDim2.new(0.504999995, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://16767112017", Size = UDim2.new(0, 146, 0, 160), Position = UDim2.new(0.499000013, 0, 0.50999999, 0)},
    [7] = {Image = "rbxassetid://16767111749", Size = UDim2.new(0, 162, 0, 153), Position = UDim2.new(0.5, 0, 0.50999999, 0)},
    [8] = {Image = "rbxassetid://16767111411", Size = UDim2.new(0, 205, 0, 205), Position = UDim2.new(0.495999992, 0, 0.497000009, 0)},
    [9] = {Image = "rbxassetid://16767110907", Size = UDim2.new(0, 220, 0, 225), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://16767110438", Size = UDim2.new(0, 285, 0, 275), Position = UDim2.new(0.501999974, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://16767110117", Size = UDim2.new(0, 363, 0, 313), Position = UDim2.new(0.519999981, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16490483493", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 251, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 251, 251))}), CurrentScoreStrokeColor = Color3.fromRGB(4, 4, 4)},
    NextFruit = {
        Image = "rbxassetid://16490483493",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16767113451", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16767113043", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16767203306", Size = UDim2.new(0.466216207, 0, 0.466216207, 0)},
            Orange = {Image = "rbxassetid://16767112488", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16767112263", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16767284180", InfographicImage = "rbxassetid://16767283295"},
    MobileControls = {MoveRightImage = "rbxassetid://16456391694", MoveLeftImage = "rbxassetid://16456392157"}
}
return tbl_1