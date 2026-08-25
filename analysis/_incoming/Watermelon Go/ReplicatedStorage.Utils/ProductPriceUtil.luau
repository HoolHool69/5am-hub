-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local MarketplaceService_upv_1 = game:GetService("MarketplaceService")
local tbl_upv_2 = {2, 5, 15}
local Product_upv_1 = Enum.InfoType.Product
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
function tbl_1.ObservePrice(a1, a2, a3)
    --[[
      name: ObservePrice
      line: 87
      upvalues:
        Product_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
    ]]
    if typeof(a1) == "number" then
        if typeof(a2) == "function" then
            local v1 = a3 or Product_upv_1
            a3 = v1
            local v2 = MakeCacheKey(a1, a3)
            local v3 = tbl_upv_3[v2]
            local v4
            if v3 then
                if os.clock() - v3.FetchedAt >= 300 then
                    StartFetch(a1, a3)
                end
                a2(v3.Price)
                return true
            end
            v4 = tbl_upv_4[v2]
            if v4 then
                table.insert(v4, a2)
            else
                tbl_upv_4[v2] = {a2}
            end
            StartFetch(a1, v1)
        else
            warn("[ProductPriceUtil] ObservePrice needs a callback, for product", a1)
        end
    else
        warn("[ProductPriceUtil] ObservePrice needs a numeric product id, got", a1)
    end
    return false
end
function tbl_1.GetCachedPrice(a1, a2)
    --[[
      name: GetCachedPrice
      line: 133
      upvalues:
        tbl_upv_3 (copy, index: 1)
        Product_upv_1 (copy, index: 2)
    ]]
    local v5 = a2 or Product_upv_1
    local v6 = tbl_upv_3[MakeCacheKey(a1, v5)]
    if v6 then
        return v6.Price
    end
    return nil
end
function MakeCacheKey(a1, a2)
    --[[
      name: MakeCacheKey
      line: 147
    ]]
    return a2.Name .. ":" .. tostring(a1)
end
function StartFetch(a1, a2)
    --[[
      name: StartFetch
      line: 152
      upvalues:
        tbl_upv_5 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
    ]]
    local u1 = MakeCacheKey(a1, a2)
    if tbl_upv_5[u1] then
        return
    end
    tbl_upv_5[u1] = true
    task.spawn(
        function()
            --[[
              line: 164
              upvalues:
                a1 (copy, index: 1)
                a2 (copy, index: 2)
                tbl_upv_5 (copy, index: 3)
                u1 (copy, index: 4)
                tbl_upv_4 (copy, index: 5)
                tbl_upv_3 (copy, index: 6)
            ]]
            local v7 = FetchPrice(a1, a2)
            tbl_upv_5[u1] = nil
            local v8 = tbl_upv_4[u1]
            tbl_upv_4[u1] = nil
            if v7 then
                tbl_upv_3[u1] = {Price = v7, FetchedAt = os.clock()}
                if not v8 then
                    return
                end
                for _, value_1 in pairs(v8) do
                    local success_1, v9 = pcall(value_1, v7)
                    if not (success_1) then
                        warn("[ProductPriceUtil] A price callback errored for", u1, v9)
                    end
                end
            else
                warn("[ProductPriceUtil] Could not read a price for", u1, "- its labels keep what they were showing")
            end
        end
    )
end
function FetchPrice(a1, a2)
    --[[
      name: FetchPrice
      line: 198
      upvalues:
        tbl_upv_2 (copy, index: 1)
        MarketplaceService_upv_1 (copy, index: 2)
    ]]
    local v10 = nil
    for n_1 = 0, #tbl_upv_2 do
        if n_1 > 0 then
            task.wait(tbl_upv_2[n_1])
        end
        local success_2, v10 = pcall(
            function()
                --[[
                  line: 206
                  upvalues:
                    MarketplaceService_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                    a2 (copy, index: 3)
                ]]
                return MarketplaceService_upv_1:GetProductInfoAsync(a1, a2)
            end
        )
        if not (success_2) or not (v10) or typeof(v10.PriceInRobux) ~= "number" then
            continue
        end
        return v10.PriceInRobux
    end
    return nil
end
return tbl_1