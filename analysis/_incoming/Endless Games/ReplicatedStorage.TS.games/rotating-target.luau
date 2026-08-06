-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.normalizeAngle = function(a1)
    --[[
      name: normalizeAngle
      line: 10
    ]]
    return ((a1 % math.tau) + math.tau) % math.tau
end
tbl_1.minAngleDiff = function(a1, a2)
    --[[
      name: minAngleDiff
      line: 14
    ]]
    local v1 = math.abs((((a1 % math.tau) + math.tau) % math.tau) - (((a2 % math.tau) + math.tau) % math.tau))
    return (math.min(v1, math.tau - v1))
end
tbl_1.signedAngleDiff = function(a1, a2)
    --[[
      name: signedAngleDiff
      line: 19
    ]]
    local v2 = ((a2 % math.tau) + math.tau) % math.tau - ((a1 % math.tau) + math.tau) % math.tau
    if v2 > math.pi then
        v2 = v2 - math.tau
    end
    if v2 <= -math.pi then
        v2 = v2 + math.tau
    end
    return v2
end
tbl_1.overlapsAny = function(a1, a2, a3)
    --[[
      name: overlapsAny
      line: 30
    ]]
    local v3 = nil
    for _, value_1 in a1 do
        v3 = math.abs((((value_1 % math.tau) + math.tau) % math.tau) - (((a2 % math.tau) + math.tau) % math.tau))
        if math.min(v3, math.tau - v3) >= a3 then
            continue
        end
        return true
    end
    return false
end
return tbl_1