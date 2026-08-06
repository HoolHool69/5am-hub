-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants")
local GAME_IDS_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-id").GAME_IDS
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local tbl_upv_1 = {}
tbl_upv_1.heartCosts = v1.REVIVE_HEART_COSTS
tbl_upv_1.productIds = v1.REVIVE_PRODUCT_IDS
local u1 = (function()
    --[[
      line: 40
      upvalues:
        tbl_upv_1 (copy, index: 1)
        GAME_IDS_upv_1 (copy, index: 2)
        GAME_METADATA_upv_1 (copy, index: 3)
    ]]
    local tbl_upv_2 = {}
    local function v2(a1)
        --[[
          line: 42
          upvalues:
            tbl_upv_2 (copy, index: 1)
        ]]
        local v3 = nil
        local v4 = nil
        local tbl_3 = nil
        for key_1, value_1 in a1.productIds do
            v4 = key_1 - 1
            tbl_3 = {}
            tbl_3.tier = v4
            v3 = a1.heartCosts[v4 + 1]
            if v3 == nil then
                v3 = 1
            end
            tbl_3.heartCost = v3
            tbl_upv_2[value_1] = tbl_3
        end
    end
    v2(tbl_upv_1)
    local v5 = nil
    for _, value_2 in GAME_IDS_upv_1 do
        v5 = GAME_METADATA_upv_1[value_2].revivePricing
        if v5 ~= nil then
            v2(v5)
        end
    end
    return tbl_upv_2
end)()
local tbl_4 = {}
tbl_4.reviveLadderFor = function(a1)
    --[[
      name: reviveLadderFor
      line: 27
      upvalues:
        tbl_upv_1 (copy, index: 1)
        GAME_METADATA_upv_1 (copy, index: 2)
    ]]
    local v6 = nil
    if a1 ~= nil then
        v6 = GAME_METADATA_upv_1[a1].revivePricing or tbl_upv_1
        return v6
    end
    return tbl_upv_1
end
tbl_4.reviveTierForProduct = function(a1)
    --[[
      name: reviveTierForProduct
      line: 73
      upvalues:
        u1 (copy, index: 1)
    ]]
    return u1[a1]
end
return tbl_4