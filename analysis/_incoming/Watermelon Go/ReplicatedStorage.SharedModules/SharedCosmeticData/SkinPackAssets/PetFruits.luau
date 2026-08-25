-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {Rarity = "Rare", Cost = 99, CosmeticName = "Pet Fruits Skin Pack", GiftReceivedImageId = "rbxassetid://16583316987", ShopThumbnailImageId = "rbxassetid://127204917108007", CurrencyType = "Robux"}
tbl_1.ProductId = require(game.ReplicatedStorage.SharedModules.SharedProductIds).developerProducts.PetFruitsSkinPack
tbl_1.Slots = {"Background", "Dropper", "FruitBox", "Fruits"}
tbl_1.Background = {Image = "rbxassetid://16583206983"}
tbl_1.FruitBox = {Image = "rbxassetid://16581199205", TopBarColor = Color3.fromRGB(255, 255, 255)}
tbl_1.Fruits = {
    [1] = {Image = "rbxassetid://16581204509", Size = UDim2.new(0, 46, 0, 46), Position = UDim2.new(0.49000001, 0, 0.529999971, 0)},
    [2] = {Image = "rbxassetid://16581204015", Size = UDim2.new(0, 69, 0, 60), Position = UDim2.new(0.5, 0, 0.469999999, 0)},
    [3] = {Image = "rbxassetid://16581203507", Size = UDim2.new(0, 93, 0, 136), Position = UDim2.new(0.49000001, 0, 0.479999989, 0)},
    [4] = {Image = "rbxassetid://16581203112", Size = UDim2.new(0, 99, 0, 95), Position = UDim2.new(0.5, 0, 0.479999989, 0)},
    [5] = {Image = "rbxassetid://16581202707", Size = UDim2.new(0, 118, 0, 186), Position = UDim2.new(0.537999988, 0, 0.540000021, 0)},
    [6] = {Image = "rbxassetid://16581202228", Size = UDim2.new(0, 216, 0, 151), Position = UDim2.new(0.5, 0, 0.474999994, 0)},
    [7] = {Image = "rbxassetid://16581201714", Size = UDim2.new(0, 219, 0, 173), Position = UDim2.new(0.479999989, 0, 0.49000001, 0)},
    [8] = {Image = "rbxassetid://16581570174", Size = UDim2.new(0, 215, 0, 288), Position = UDim2.new(0.504999995, 0, 0.519999981, 0)},
    [9] = {Image = "rbxassetid://16581200831", Size = UDim2.new(0, 228, 0, 228), Position = UDim2.new(0.504999995, 0, 0.495000005, 0)},
    [10] = {Image = "rbxassetid://16581200358", Size = UDim2.new(0, 320, 0, 383), Position = UDim2.new(0.479999989, 0, 0.50999999, 0)},
    [11] = {Image = "rbxassetid://16581199738", Size = UDim2.new(0, 371, 0, 370), Position = UDim2.new(0.479999989, 0, 0.519999981, 0)}
}
tbl_1.Hud = {
    Score = {Image = "rbxassetid://16490483297", Position = UDim2.new(0, 0, 0, 0), Size = UDim2.new(1, 0, 1, 0), AnchorPoint = Vector2.new(0, 0), BestScoreTextColor = Color3.fromRGB(255, 255, 255), CurrentScoreGradient = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(208, 208, 208))}), CurrentScoreStrokeColor = Color3.fromRGB(0, 0, 0)},
    NextFruit = {
        Image = "rbxassetid://16490483493",
        Size = UDim2.new(1, 0, 1, 0),
        FruitCycle = {
            Cherry = {Image = "rbxassetid://16581204509", Size = UDim2.new(0.310810804, 0, 0.310810804, 0)},
            Strawberry = {Image = "rbxassetid://16581204015", Size = UDim2.new(0.344594598, 0, 0.344594598, 0)},
            Grapes = {Image = "rbxassetid://16581203507", Size = UDim2.new(0.466216236, 0, 0.466216236, 0)},
            Orange = {Image = "rbxassetid://16581203112", Size = UDim2.new(0.533783793, 0, 0.533783793, 0)},
            Tomato = {Image = "rbxassetid://16581202707", Size = UDim2.new(0.695945919, 0, 0.695945919, 0)}
        }
    },
    Info = {DropButtonImage = "rbxassetid://16581198603", InfographicImage = "rbxassetid://16581197286"},
    MobileControls = {MoveRightImage = "rbxassetid://16456391694", MoveLeftImage = "rbxassetid://16456392157"}
}
return tbl_1