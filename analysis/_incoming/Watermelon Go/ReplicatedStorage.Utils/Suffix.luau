-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local tbl_upv_2 = {"K", "M", "B", "T", "Qa", "Qi", "Si", "Sp", "", "", ""}
function addCommas(a1)
    --[[
      name: addCommas
      line: 5
    ]]
    local v1 = ((#a1 % 3 == 0) and (a1:reverse():gsub("(%d%d%d)", "%1,"):reverse():sub(2))) or (a1:reverse():gsub("(%d%d%d)", "%1,"):reverse())
    return v1
end
local function ToSuffixString(a1)
    --[[
      name: ToSuffixString
      line: 10
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    if tonumber(a1) <= 9999 then
        return addCommas(tostring(a1))
    else
        local v2 = nil
        for n_1 = #tbl_upv_2, 1, -1 do
            v2 = math.pow(10, n_1 * 3)
            if v2 > tonumber(a1) then
                continue
            end
            return ("%.1f"):format(a1 / v2) .. tbl_upv_2[n_1]
        end
        return (tostring(a1))
    end
end
function tbl_1.toSuffixString(a1, a2)
    --[[
      name: toSuffixString
      line: 24
      upvalues:
        ToSuffixString (copy, index: 1)
    ]]
    return ToSuffixString(a2)
end
function tbl_1.AddCommas(a1, a2)
    --[[
      name: AddCommas
      line: 28
    ]]
    return addCommas(tostring(a2))
end
return tbl_1