-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.perfectClearByLines = {800, 1200, 1800, 2000}
local tbl_2 = {}
tbl_2.isDifficultClear = function(a1, a2)
    --[[
      name: isDifficultClear
      line: 54
    ]]
    local v1 = true
    if a1 ~= 4 then
        v1 = false
        if a1 > 0 then
            v1 = a2 ~= "none"
        end
    end
    return v1
end
tbl_2.advanceBackToBack = function(a1, a2, a3)
    --[[
      name: advanceBackToBack
      line: 66
    ]]
    if a2 ~= 0 then
        local v2 = true
        if a2 ~= 4 then
            v2 = false
            if a2 > 0 then
                v2 = a3 ~= "none"
            end
        end
        if v2 then
            return a1 + 1
        end
        return 0
    end
    return a1
end
tbl_2.backToBackMultiplier = function(a1)
    --[[
      name: backToBackMultiplier
      line: 78
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 >= 2 then
        return math.min(tbl_upv_1.backToBackBonus + (tbl_upv_1.backToBackBonusStep * (a1 - 2)), tbl_upv_1.backToBackMaxBonus) + 1
    end
    return 1
end
tbl_2.clearAward = function(a1, a2, a3)
    --[[
      name: clearAward
      line: 86
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3
    if a2 ~= "none" then
        if a2 == "mini" and a1 == 1 then
            v3 = tbl_upv_1.tSpinMiniSingle
        elseif a1 == 1 then
            v3 = tbl_upv_1.tSpinSingle
        elseif a1 ~= 2 then
            v3 = tbl_upv_1.tSpinTriple
        else
            v3 = tbl_upv_1.tSpinDouble
        end
    elseif a1 == 1 then
        v3 = tbl_upv_1.single
    elseif a1 == 2 then
        v3 = tbl_upv_1.double
    elseif a1 ~= 3 then
        v3 = tbl_upv_1.tetris
    else
        v3 = tbl_upv_1.triple
    end
    local v4 = ((a3 >= 2) and (math.min(tbl_upv_1.backToBackBonus + (tbl_upv_1.backToBackBonusStep * (a3 - 2)), tbl_upv_1.backToBackMaxBonus) + 1)) or 1
    return v3 * v4
end
tbl_2.spinAward = function(a1)
    --[[
      name: spinAward
      line: 99
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 ~= "none" then
        if a1 ~= "full" then
            return tbl_upv_1.tSpinMini
        end
        return tbl_upv_1.tSpin
    end
    return 0
end
tbl_2.comboAward = function(a1)
    --[[
      name: comboAward
      line: 106
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 >= 2 then
        return tbl_upv_1.comboStep * (a1 - 1)
    end
    return 0
end
tbl_2.perfectClearAward = function(a1, a2)
    --[[
      name: perfectClearAward
      line: 113
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 == 4 and a2 >= 2 then
        return tbl_upv_1.perfectClearB2bTetris
    end
    return tbl_upv_1.perfectClearByLines[a1] or 0
end
tbl_2.TETRIS_SCORING = tbl_upv_1
return tbl_2