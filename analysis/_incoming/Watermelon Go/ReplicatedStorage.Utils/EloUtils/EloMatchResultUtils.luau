-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local EloMatchResult_upv_1 = require(script.Parent.EloMatchResult)
local tbl_upv_1 = {}
function tbl_upv_1.isEloMatchResult(a1)
    --[[
      name: isEloMatchResult
      line: 10
      upvalues:
        EloMatchResult_upv_1 (copy, index: 1)
    ]]
    local v1 = true
    local v2
    if a1 == EloMatchResult_upv_1.PLAYER_ONE_WIN then
        v2 = v1
    else
        v2 = true
        if a1 ~= EloMatchResult_upv_1.PLAYER_TWO_WIN then
            v2 = a1 == EloMatchResult_upv_1.DRAW
        end
    end
    return v2
end
function tbl_upv_1.isEloMatchResultList(a1)
    --[[
      name: isEloMatchResultList
      line: 16
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if type(a1) == "table" then
        for _, value_1 in pairs(a1) do
            if tbl_upv_1.isEloMatchResult(value_1) then
                continue
            end
            return false
        end
        return true
    end
    return false
end
return tbl_upv_1