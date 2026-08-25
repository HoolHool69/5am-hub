-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
function tbl_upv_1.boxMuller()
    --[[
      name: boxMuller
      line: 12
    ]]
    return (math.sqrt(math.log(math.random()) * -2) * math.cos(math.tau * math.random())) / 2
end
function tbl_upv_1.normal(a1, a2)
    --[[
      name: normal
      line: 22
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return a1 + (tbl_upv_1.boxMuller() * a2)
end
function tbl_upv_1.boundedNormal(a1, a2, a3, a4)
    --[[
      name: boundedNormal
      line: 34
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (math.clamp(tbl_upv_1.normal(a1, a2), a3, a4))
end
function tbl_upv_1.erf(a1)
    --[[
      name: erf
      line: 46
    ]]
    local v1 = 1 / ((math.abs(a1) * 0.5) + 1)
    local v2 = 1 - v1 * math.exp(((-a1 * a1) - 1.26551223) + (v1 * ((v1 * ((v1 * ((v1 * ((v1 * ((v1 * ((v1 * ((v1 * ((v1 * 0.17087277) + -0.82215223)) + 1.48851587)) + -1.13520398)) + 0.27886807)) + -0.18628806)) + 0.09678418)) + 0.37409196)) + 1.00002368)))
    if a1 < 0 then
        return -v2
    end
    return v2
end
function tbl_upv_1.cdf(a1)
    --[[
      name: cdf
      line: 73
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = type(a1) == "number"
    assert(v3, "Bad zScore")
    return 0.5 * (1 + tbl_upv_1.erf(a1 / math.sqrt2))
end
function tbl_upv_1.erfinv(a1)
    --[[
      name: erfinv
      line: 85
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v4 = type(a1) == "number"
    assert(v4, "Bad x")
    if a1 < -1 or a1 > 1 then
        return nil
    end
    if a1 == -1 then
        return -math.huge
    end
    if a1 == 1 then
        return math.huge
    end
    local function derivative(a2)
        --[[
          name: derivative
          line: 99
        ]]
        return (math.exp(-a2 * a2) * 2) / 1.7724538509055159
    end
    local v5 = 0
    v4 = v5
    for _ = 1, 1000 do
        local v6 = tbl_upv_1.erf(v4) - a1
        if math.abs(v6) >= 1e-15 then
            local v7 = v4
            v4 = v4 - v6 / ((math.exp(-v7 * v7) * 2) / 1.7724538509055159)
            continue
        end
        return v4
    end
    return nil
end
function tbl_upv_1.percentileToZScore(a1)
    --[[
      name: percentileToZScore
      line: 124
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v8 = (type(a1) == "number") and ((a1 >= 0) and (a1 <= 1))
    assert(v8, "Bad percentile")
    return math.sqrt2 * tbl_upv_1.erfinv((2 * a1) - 1)
end
return tbl_upv_1