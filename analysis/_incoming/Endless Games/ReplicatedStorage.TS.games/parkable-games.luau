-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1["2048"] = true
tbl_upv_1["number-merge"] = true
tbl_upv_1.suika = true
tbl_upv_1.bloxorz = true
tbl_upv_1["block-blast"] = true
tbl_upv_1["unblock-me"] = true
tbl_upv_1.sokoban = true
tbl_upv_1["water-sort"] = true
tbl_upv_1["flow-free"] = true
tbl_upv_1.minesweeper = true
tbl_upv_1["lights-out"] = true
local tbl_2 = {}
tbl_2.isParkable = function(a1)
    --[[
      name: isParkable
      line: 33
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[a1] ~= nil
end
tbl_2.PARKABLE_GAMES = tbl_upv_1
return tbl_2