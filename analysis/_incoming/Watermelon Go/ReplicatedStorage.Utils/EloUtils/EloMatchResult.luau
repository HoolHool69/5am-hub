-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {DRAW = 0.5, PLAYER_ONE_WIN = 1, PLAYER_TWO_WIN = 0}
local tbl_2 = {__index = 0}
function tbl_2.__index()
    --[[
      name: __index
      line: 10
    ]]
    error("Bad index onto EloMatchResult")
end
return table.freeze(setmetatable(tbl_1, tbl_2))