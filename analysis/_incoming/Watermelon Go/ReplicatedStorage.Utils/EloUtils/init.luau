-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local EloMatchResult_upv_1 = require(script.EloMatchResult)
local EloMatchResultUtils_upv_1 = require(script.EloMatchResultUtils)
local Probability_upv_1 = require(script.Probability)
local tbl_upv_1 = {}
tbl_upv_1.MatchResult = EloMatchResult_upv_1
tbl_upv_1.MatchResultUtils = EloMatchResultUtils_upv_1
function tbl_upv_1.createConfig(a1)
    --[[
      name: createConfig
      line: 48
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = a1 or {}
    a1 = v1
    local tbl_2 = {kfactor = 0, groupMultipleResultAsOne = false, ratingFloor = 0, initial = 0}
    tbl_2.factor = a1.factor or 400
    tbl_2.kfactor = a1.kfactor or (tbl_upv_1.standardKFactorFormula)
    tbl_2.initial = v1.initial or 800
    tbl_2.ratingFloor = v1.ratingFloor or 500
    return tbl_2
end
function tbl_upv_1.isEloConfig(a1)
    --[[
      name: isEloConfig
      line: 66
    ]]
    local v2 = false
    local v3
    if type(a1) ~= "table" then
        v3 = v2
    else
        v3 = false
        if type(a1.factor) == "number" then
            if type(a1.kfactor) == "number" then
                v3 = (type(a1.initial) == "number") and ((type(a1.ratingFloor) == "number") and (type(a1.groupMultipleResultAsOne) == "boolean"))
            else
                v3 = false
                if type(a1.kfactor) == "function" then
                    v3 = (type(a1.initial) == "number") and ((type(a1.ratingFloor) == "number") and (type(a1.groupMultipleResultAsOne) == "boolean"))
                end
            end
        end
    end
    return v3
end
function tbl_upv_1.getStandardDeviation(a1)
    --[[
      name: getStandardDeviation
      line: 81
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad eloConfig")
    return (0.5 * a1.factor) * math.sqrt2
end
function tbl_upv_1.getPercentile(a1, a2)
    --[[
      name: getPercentile
      line: 94
      upvalues:
        tbl_upv_1 (copy, index: 1)
        Probability_upv_1 (copy, index: 2)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad eloConfig")
    return Probability_upv_1.cdf((a2 - a1.initial) / tbl_upv_1.getStandardDeviation(a1))
end
function tbl_upv_1.percentileToElo(a1, a2)
    --[[
      name: percentileToElo
      line: 111
      upvalues:
        tbl_upv_1 (copy, index: 1)
        Probability_upv_1 (copy, index: 2)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad eloConfig")
    local v4 = tbl_upv_1.getStandardDeviation(a1)
    return a1.initial + (Probability_upv_1.percentileToZScore(a2) * v4)
end
function tbl_upv_1.getNewElo(a1, a2, a3, a4)
    --[[
      name: getNewElo
      line: 131
      upvalues:
        tbl_upv_1 (copy, index: 1)
        EloMatchResultUtils_upv_1 (copy, index: 2)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad config")
    local v5 = type(a2) == "number"
    assert(v5, "Bad playerOneRating")
    local v6 = type(a3) == "number"
    assert(v6, "Bad playerTwoRating")
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a4), "Bad eloMatchResultList")
    return tbl_upv_1.getNewPlayerOneScore(a1, a2, a3, a4), (tbl_upv_1.getNewPlayerOneScore(a1, a3, a2, tbl_upv_1.fromOpponentPerspective(a4)))
end
function tbl_upv_1.getEloChange(a1, a2, a3, a4)
    --[[
      name: getEloChange
      line: 152
      upvalues:
        tbl_upv_1 (copy, index: 1)
        EloMatchResultUtils_upv_1 (copy, index: 2)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad config")
    local v7 = type(a2) == "number"
    assert(v7, "Bad playerOneRating")
    local v8 = type(a3) == "number"
    assert(v8, "Bad playerTwoRating")
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a4), "Bad eloMatchResultList")
    local v9, v10 = tbl_upv_1.getNewElo(a1, a2, a3, a4)
    return v9 - a2, v10 - a3
end
function tbl_upv_1.getNewPlayerOneScore(a1, a2, a3, a4)
    --[[
      name: getNewPlayerOneScore
      line: 172
      upvalues:
        tbl_upv_1 (copy, index: 1)
        EloMatchResultUtils_upv_1 (copy, index: 2)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad config")
    local v11 = type(a2) == "number"
    assert(v11, "Bad playerOneRating")
    local v12 = type(a3) == "number"
    assert(v12, "Bad playerTwoRating")
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a4), "Bad eloMatchResultList")
    return (math.max(a1.ratingFloor, a2 + tbl_upv_1.getPlayerOneScoreAdjustment(a1, a2, a3, a4)))
end
function tbl_upv_1.getPlayerOneExpected(a1, a2, a3)
    --[[
      name: getPlayerOneExpected
      line: 193
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad config")
    local v13 = type(a2) == "number"
    assert(v13, "Bad playerOneRating")
    local v14 = type(a3) == "number"
    assert(v14, "Bad playerTwoRating")
    return 1 / (1 + (10 ^ ((a3 - a2) / a1.factor)))
end
function tbl_upv_1.getPlayerOneScoreAdjustment(a1, a2, a3, a4)
    --[[
      name: getPlayerOneScoreAdjustment
      line: 211
      upvalues:
        tbl_upv_1 (copy, index: 1)
        EloMatchResultUtils_upv_1 (copy, index: 2)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad config")
    local v15 = type(a2) == "number"
    assert(v15, "Bad playerOneRating")
    local v16 = type(a3) == "number"
    assert(v16, "Bad playerTwoRating")
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a4), "Bad eloMatchResultList")
    local v17 = 0
    local v18 = tbl_upv_1.getPlayerOneExpected(a1, a2, a3)
    if a1.groupMultipleResultAsOne then
        local v19 = tbl_upv_1.countPlayerOneWins(a4)
        local v20 = tbl_upv_1.countPlayerTwoWins(a4)
        local v21 = ((v20 >= v19) and 0) or 1
        local v22
        if v20 >= v19 then
            v22 = v20
        else
            v22 = v19
        end
        v17 = v22 * (v21 - v18)
    else
        for _, value_1 in pairs(a4) do
            v17 = v17 + (value_1 - v18)
        end
    end
    return tbl_upv_1.extractKFactor(a1, a2) * v17
end
function tbl_upv_1.fromOpponentPerspective(a1)
    --[[
      name: fromOpponentPerspective
      line: 249
      upvalues:
        EloMatchResultUtils_upv_1 (copy, index: 1)
    ]]
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a1), "Bad eloMatchResultList")
    local tbl_3 = {}
    for key_1, value_2 in pairs(a1) do
        tbl_3[key_1] = 1 - value_2
    end
    return tbl_3
end
function tbl_upv_1.countPlayerOneWins(a1)
    --[[
      name: countPlayerOneWins
      line: 267
      upvalues:
        EloMatchResultUtils_upv_1 (copy, index: 1)
        EloMatchResult_upv_1 (copy, index: 2)
    ]]
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a1), "Bad eloMatchResultList")
    local v23 = 0
    for _, value_3 in pairs(a1) do
        if value_3 == EloMatchResult_upv_1.PLAYER_ONE_WIN then
            v23 = v23 + 1
        end
    end
    return v23
end
function tbl_upv_1.countPlayerTwoWins(a1)
    --[[
      name: countPlayerTwoWins
      line: 285
      upvalues:
        EloMatchResultUtils_upv_1 (copy, index: 1)
        EloMatchResult_upv_1 (copy, index: 2)
    ]]
    assert(EloMatchResultUtils_upv_1.isEloMatchResultList(a1), "Bad eloMatchResultList")
    local v24 = 0
    for _, value_4 in pairs(a1) do
        if value_4 == EloMatchResult_upv_1.PLAYER_TWO_WIN then
            v24 = v24 + 1
        end
    end
    return v24
end
function tbl_upv_1.standardKFactorFormula(a1)
    --[[
      name: standardKFactorFormula
      line: 303
    ]]
    if a1 < 2400 then
        if a1 < 2100 then
            return 32
        end
        return 24
    end
    return 16
end
function tbl_upv_1.extractKFactor(a1, a2)
    --[[
      name: extractKFactor
      line: 320
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    assert(tbl_upv_1.isEloConfig(a1), "Bad config")
    local v25 = type(a2) == "number"
    assert(v25, "Bad rating")
    if type(a1.kfactor) == "function" then
        return a1.kfactor(a2)
    elseif type(a1.kfactor) ~= "number" then
        error("Bad kfactor")
    else
        return a1.kfactor
    end
end
return tbl_upv_1