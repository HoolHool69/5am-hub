-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local SkinPackAssets_upv_1 = require(game.ReplicatedStorage.SharedModules.SharedCosmeticData.SkinPackAssets)
local tbl_upv_2 = {"CosmeticName", "Rarity", "CurrencyType", "Cost", "ProductId", "ShopThumbnailImageId", "GiftReceivedImageId", "Unavailable", "EventItem", "StartTime", "EndTime"}
local tbl_upv_3 = {}
function OverlayOnePack(a1)
    --[[
      name: OverlayOnePack
      line: 109
      upvalues:
        SkinPackAssets_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
    ]]
    local v1 = SkinPackAssets_upv_1.Get(a1)
    if not v1 or not v1.CosmeticName then
        return
    end
    local tbl_4 = {}
    for _, value_1 in tbl_upv_2 do
        tbl_4[value_1] = v1[value_1]
    end
    tbl_upv_3[a1] = tbl_4
end
function OverlayPackModules()
    --[[
      name: OverlayPackModules
      line: 133
      upvalues:
        SkinPackAssets_upv_1 (copy, index: 1)
    ]]
    for _, value_2 in SkinPackAssets_upv_1.GetPackIds() do
        OverlayOnePack(value_2)
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 152
      upvalues:
        SkinPackAssets_upv_1 (copy, index: 1)
    ]]
    SkinPackAssets_upv_1.OnPackRegistered(
        function(a1)
            --[[
              line: 154
            ]]
            OverlayOnePack(a1)
        end
    )
    OverlayPackModules()
end
Initialize()
tbl_1.SkinPack = tbl_upv_3
return tbl_1