-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.developerProducts = {
    Undo2 = 1674137614,
    Undo5 = 1674137743,
    Undo10 = 1674137799,
    Donation_10 = 1675763086,
    Donation_100 = 1675763104,
    Donation_500 = 1675763134,
    Donation_1000 = 1675763170,
    Donation_2000 = 1675763203,
    Donation_5000 = 1675763255,
    CoinPack1 = 1742038432,
    CoinPack2 = 1742038434,
    CoinPack3 = 1742038674,
    CoinPack4 = 1742039474,
    CoinPack5 = 1742039593,
    GIFT_CoinPack1 = 1745381081,
    GIFT_CoinPack2 = 1745381556,
    GIFT_CoinPack3 = 1745381652,
    GIFT_CoinPack4 = 1745381743,
    GIFT_CoinPack5 = 1745381914,
    DoubleCoinBoost10 = 1742116775,
    DoubleCoinBoost20 = 1742116907,
    DoubleCoinBoost40 = 1742117023,
    DoubleCoinBoost60 = 1742117186,
    DoubleCoinsBoost10_LimitedTimeOffer = 1742731515,
    DoubleCoinsBoost60_LimitedTimeOffer = 1742731788,
    LunarNewYear24SkinPack = 1750958647,
    GIFT_LunarNewYear24SkinPack = 1750960207,
    AnimalSkinPack = 1761398511,
    GIFT_AnimalSkinPack = 1761398656,
    SlimeSkinPack = 1761397857,
    GIFT_SlimeSkinPack = 1761398010,
    PetFruitsSkinPack = 1766727077,
    GIFT_PetFruitsSkinPack = 1766727397,
    BentoSkinPack = 1771341618,
    GIFT_BentoSkinPack = 1771341747,
    Patricks2024SkinPack = 1778012945,
    GIFT_Patricks2024SkinPack = 1778013453,
    SusSkinPack = 1778011252,
    GIFT_SusSkinPack = 1778011710,
    CatCafeSkinPack = 1783280689,
    GIFT_CatCafeSkinPack = 1783280851,
    DesignerSkinPack = 1790199342,
    GIFT_DesignerSkinPack = 1790199809,
    Easter2024SkinPack = 1790200268,
    GIFT_Easter2024SkinPack = 1790200780,
    DessertSkinPack = 1798879459,
    GIFT_DessertSkinPack = 1798879580,
    DoggoSkinPack = 1805200526,
    GIFT_DoggoSkinPack = 1805200763,
    HampterSkinPack = 1816688491,
    GIFT_HampterSkinPack = 1816688616,
    GhostiesSkinPack = 1822326210,
    GIFT_GhostiesSkinPack = 1822326463,
    GhoulSkinPack = 1845252339,
    GIFT_GhoulSkinPack = 1845252338,
    MyHeroSkinPack = 1845252337,
    GIFT_MyHeroSkinPack = 1845252340,
    FroggySkinPack = 2661066343,
    GIFT_FroggySkinPack = 2661066344,
    Christmas2024SkinPack = 2681072994,
    GIFT_Christmas2024SkinPack = 2681072996,
    DeleteFruitType = 1900000001,
    DeleteFruitTypeCoins = "COINS_PURCHASE",
    GIFT_DoubleCoinBoost20 = 3708310503,
    GIFT_DoubleCoinBoost40 = 3708310505,
    GIFT_DoubleCoinBoost10 = 3708310501,
    GIFT_DoubleCoinBoost60 = 3708310506,
    CharmChest_x3 = 3708946987,
    PetsFramesChest = 3708946991,
    PetsFramesChest_x3 = 3708946992,
    FlowerFramesChest = 3708946995,
    FlowerFramesChest_x3 = 3708946997,
    FoodFramesChest = 3708946993,
    CharmChest = 3708946984,
    CloudChest_x3 = 3708946990,
    CloudChest = 3708946988,
    FoodFramesChest_x3 = 3708946994,
    GIFT_FlowerFramesChest = 3708947014,
    GIFT_CloudChest = 3708947010,
    GIFT_FoodFramesChest = 3708947012,
    GIFT_PetsFramesChest = 3708947011,
    GIFT_CharmChest = 3708947008
}
tbl_upv_1.Badges = {
    zenniBadgeId = 2977951287610323,
    theGamesItem4BadgeId = 4321492844774569,
    watermelonBadgeId = 2932289401009045,
    theGamesItem3BadgeId = 910985182623374,
    welcomeBadgeId = 4166513362554856,
    theGamesItem5BadgeId = 4125345081561183,
    theGamesQuest1BadgeId = 4331332529851837,
    firstDuelBadgeId = 2353820231230564,
    duelWinBadgeId = 3250279985369853,
    theGamesItem1BadgeId = 1453672932622181,
    theGamesQuest3BadgeId = 1604396513696053,
    theGamesQuest2BadgeId = 2593423107209233,
    theGamesItem2BadgeId = 2756555203157714,
    ScoreBadgeIds = {[100] = 2709878910182137, [500] = 2715761508766195, [1000] = 1647609905400995, [1500] = 2859784164507791, [1750] = 3230930946748165, [2000] = 2115020432753064, [2500] = 4073558447206034, [3000] = 462496865847332, [3500] = 1387916630180871}
}
tbl_upv_1.ugcItems = {freshCutGlasses = 15884909107, watermelonHead = 85121430053333}
function tbl_upv_1.GetProductNameFromId(a1, a2)
    --[[
      name: GetProductNameFromId
      line: 155
    ]]
    if not (a1) then
        warn("missing product talbe")
    end
    for key_1, value_1 in pairs(a1) do
        if a2 ~= value_1 then
            continue
        end
        return key_1
    end
end
function tbl_upv_1.GetSkinPackNameFromProductId(a1)
    --[[
      name: GetSkinPackNameFromProductId
      line: 178
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.GetProductNameFromId(tbl_upv_1.developerProducts, a1)
    if not v1 then
        return nil
    end
    local v2 = v1:gsub("^GIFT_", "")
    if not v2:match("SkinPack$") then
        return nil
    end
    local v3 = v2:gsub("SkinPack$", "")
    if v3 ~= "" then
        return v3
    end
    return nil
end
return tbl_upv_1