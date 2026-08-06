-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.normalizeDegrees = function(a1)
    --[[
      name: normalizeDegrees
      line: 26
    ]]
    local v1 = a1 % 360
    if v1 > 180 then
        v1 = v1 - 360
    end
    if v1 <= -180 then
        v1 = v1 + 360
    end
    return v1
end
tbl_1.launchFromPull = function(a1, a2, a3)
    --[[
      name: launchFromPull
      line: 60
    ]]
    local v2 = math.sqrt((a1 * a1) + (a2 * a2))
    if v2 >= 1e-04 then
        local v3 = math.min(v2 * a3.speedPerPullStud, a3.maxSpeed)
        local v4 = math.clamp(math.deg(math.atan2(a1, a2)), -a3.maxTiltDegrees, a3.maxTiltDegrees)
        local v5 = math.clamp(a3.baseSpinDegreesPerSecond + (v3 * a3.spinPerSpeedStud), a3.minSpinDegreesPerSecond, a3.maxSpinDegreesPerSecond)
        local tbl_2 = {}
        tbl_2.velocityX = (v4 / math.max(a3.maxTiltDegrees, 1e-04)) * v3 * a3.lateralLaunchFraction
        tbl_2.velocityY = v3
        tbl_2.spinDegreesPerSecond = v5
        tbl_2.pullStuds = v2
        return tbl_2
    else
        local tbl_3 = {}
        tbl_3.spinDegreesPerSecond = a3.baseSpinDegreesPerSecond
        return tbl_3
    end
end
tbl_1.stepKnife = function(a1, a2, a3)
    --[[
      name: stepKnife
      line: 91
    ]]
    a1.velocityY = a1.velocityY + (a2 * a3)
    a1.x = a1.x + (a1.velocityX * a3)
    a1.y = a1.y + (a1.velocityY * a3)
    local v6 = a1.spinDegreesPerSecond * a3
    a1.angleDegrees = a1.angleDegrees + v6
    a1.totalSpinDegrees = a1.totalSpinDegrees + math.abs(v6)
end
tbl_1.bladeTipX = function(a1, a2)
    --[[
      name: bladeTipX
      line: 100
    ]]
    return a1.x + (a2 * math.sin(math.rad(a1.angleDegrees)))
end
tbl_1.bladeTipY = function(a1, a2)
    --[[
      name: bladeTipY
      line: 103
    ]]
    return a1.y - (a2 * math.cos(math.rad(a1.angleDegrees)))
end
tbl_1.evaluateContact = function(a1, a2, a3, a4)
    --[[
      name: evaluateContact
      line: 119
    ]]
    local v7 = a1.y - a4.tipOffsetStuds * math.cos(math.rad(a1.angleDegrees))
    local v8 = false
    if a3.topY < a2 then
        v8 = v7 <= a3.topY
    end
    if v8 then
        local v9 = nil
        if math.abs(a1.x + (a4.tipOffsetStuds * math.sin(math.rad(a1.angleDegrees))) - a3.centerX) <= a3.halfWidth then
            v9 = a1.angleDegrees % 360
            if v9 > 180 then
                v9 = v9 - 360
            end
            if v9 <= -180 then
                v9 = v9 + 360
            end
            local v10 = math.abs(v9)
            local v11 = a4.minFlipDegrees <= a1.totalSpinDegrees
            if v10 <= a4.stickAngleToleranceDegrees and v11 then
                return "stick"
            end
            return "bounce"
        end
    end
    if a1.y >= a3.topY - (a4.tipOffsetStuds * 2) then
        return "none"
    end
    return "miss"
end
tbl_1.flipScore = function(a1)
    --[[
      name: flipScore
      line: 153
    ]]
    return (math.max(1, math.round(a1 / 360)))
end
return tbl_1