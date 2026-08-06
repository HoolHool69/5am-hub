-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {"K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}
local function formatEggs_upv_1(a1)
    --[[
      name: formatEggs
      line: 11
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 == a1 and a1 >= 0 then
        if a1 >= 1000 then
            local v1 = -1
            local v2 = a1
            while v2 >= 1000 and v1 < #tbl_upv_1 - 1 do
                v2 = v2 / 1000
                v1 = v1 + 1
            end
            if v2 < 1000 then
                local v3 = tbl_upv_1[v1 + 1]
                if v2 < 100 then
                    if v2 < 10 then
                        return (("%*%*"):format(math.floor(v2 * 100) / 100, v3))
                    end
                    return (("%*%*"):format(math.floor(v2 * 10) / 10, v3))
                end
                return (("%*%*"):format(math.floor(v2), v3))
            end
            return (("999%*+"):format(tbl_upv_1[#tbl_upv_1]))
        end
        return (tostring(math.floor(a1)))
    end
    return "0"
end
local tbl_2 = {}
tbl_2.formatEggs = formatEggs_upv_1
tbl_2.formatEggsPerSecond = function(a1)
    --[[
      name: formatEggsPerSecond
      line: 37
      upvalues:
        formatEggs_upv_1 (copy, index: 1)
    ]]
    if a1 == a1 and a1 >= 0 then
        if a1 >= 1000 then
            return (formatEggs_upv_1(a1))
        end
        return (tostring(math.floor(a1 * 10) / 10))
    end
    return "0"
end
return tbl_2