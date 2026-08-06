-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {"K", "M", "B", "T", "Q", "Qi", "Sx", "Sp", "Oc", "No", "Dc"}
local tbl_2 = {}
tbl_2.tileLabel = function(a1)
    --[[
      name: tileLabel
      line: 18
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 >= 131072 then
        local v1 = a1 / 1024
        local v2 = 0
        while v1 >= 1024 and v2 < #tbl_upv_1 - 1 do
            v1 = v1 / 1024
            v2 = v2 + 1
        end
        return (("%*%*"):format(v1, tbl_upv_1[v2 + 1]))
    end
    return (tostring(a1))
end
return tbl_2