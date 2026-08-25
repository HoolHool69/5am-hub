-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Epic", Cost = 149, CosmeticName = "Ghoul Skin Pack", GiftReceivedImageId = "rbxassetid://17783842669", ShopThumbnailImageId = "rbxassetid://130513000737236", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.GhoulSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://17783795749"}
tbl_1.FruitBox = {Image = "rbxassetid://17783797169", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://17783802664", Size = UDim2.new(0, 42, 0, 42), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [2] = {Image = "rbxassetid://17783802243", Size = UDim2.new(0, 57, 0, 57), Position = UDim2.new(0.529999971, 0, 0.5, 0)},
    [3] = {Image = "rbxassetid://17783801466", Size = UDim2.new(0, 86, 0, 86), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [4] = {Image = "rbxassetid://17783800952", Size = UDim2.new(0, 92, 0, 92), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [5] = {Image = "rbxassetid://17783800533", Size = UDim2.new(0, 107, 0, 107), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [6] = {Image = "rbxassetid://17783800082", Size = UDim2.new(0, 150, 0, 150), Position = UDim2.new(0.504999995, 0, 0.5, 0)},
    [7] = {Image = "rbxassetid://17783799818", Size = UDim2.new(0, 167, 0, 167), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [8] = {Image = "rbxassetid://17783799497", Size = UDim2.new(1.25, 0, 1.25, 0), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [9] = {Image = "rbxassetid://17783799034", Size = UDim2.new(0, 225, 0, 225), Position = UDim2.new(0.50999999, 0, 0.5, 0)},
    [10] = {Image = "rbxassetid://17783798597", Size = UDim2.new(0, 275, 0, 275), Position = UDim2.new(0.5, 0, 0.5, 0)},
    [11] = {Image = "rbxassetid://17783798306", Size = UDim2.new(1.22000003, 0, 1.22000003, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16490483493", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 251, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(251, 251, 251))}), CurrentScoreStrokeColor = Color3.fromRGB(4, 4, 4)},
    NextFruit = {
        Image = "rbxassetid://16490483493",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://17783802664", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://17783802243", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://17783801466", Size = UDim2.new(0.466216207, 0, 0.466216207, 0)},
            Orange = {Image = "rbxassetid://17783800952", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://17783800533", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://17783797643", InfographicImage = "rbxassetid://17783796778"},
    MobileControls = {MoveRightImage = "rbxassetid://16456391694", MoveLeftImage = "rbxassetid://16456392157"}
}
return tbl_1