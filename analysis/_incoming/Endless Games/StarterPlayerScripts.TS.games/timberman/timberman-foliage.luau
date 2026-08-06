-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.conformSeasonFoliage = function(a1, a2, a3)
    --[[
      name: conformSeasonFoliage
      line: 23
    ]]
    local tbl_2 = {}
    local v1 = a3.removeOffSeasonTrees
    if v1 then
        for _, value_1 in a3.greenSeasons do
            if value_1 == a2 then
                v1 = false
                break
            end
        end
    end
    if v1 then
        local v2 = false
        for _, value_2 in a1 do
            if not (value_2.isGreen) then
                v2 = true
            end
        end
        v1 = v2
    end
    if v1 then
        local v4 = 0
        for _, value_3 in a1 do
            if value_3.isGreen then
                value_3.root:Destroy()
                v4 = v4 + 1
            else
                table.insert(tbl_2, value_3)
            end
        end
        if a3.debug then
            print((("[Timberman] foliage %*: removed %* green tree(s), kept %*"):format(a2, v4, #tbl_2)))
        end
    else
        for _, value_4 in a1 do
            table.insert(tbl_2, value_4)
        end
        if a3.debug then
            print((("[Timberman] foliage %*: kept all %* tree(s)"):format(a2, #a1)))
        end
    end
    return tbl_2
end
return tbl_1