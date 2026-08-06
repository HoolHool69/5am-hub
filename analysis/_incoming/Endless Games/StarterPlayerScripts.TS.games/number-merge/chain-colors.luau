-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {Color3.fromRGB(120, 220, 255), Color3.fromRGB(255, 214, 92), Color3.fromRGB(255, 150, 60), Color3.fromRGB(255, 90, 90), Color3.fromRGB(206, 120, 255)}
local tbl_2 = {}
tbl_2.chainColor = function(a1)
    --[[
      name: chainColor
      line: 9
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[math.clamp(a1 - 2, 0, #tbl_upv_1 - 1) + 1]
end
tbl_2.CHAIN_COLORS = tbl_upv_1
return tbl_2