-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.createTiltState = function()
    --[[
      name: createTiltState
      line: 97
    ]]
    return {}
end
tbl_1.planeConfidence = function(a1, a2, a3, a4)
    --[[
      name: planeConfidence
      line: 119
    ]]
    local v1 = math.sqrt(((a1 * a1) + (a2 * a2)) + (a3 * a3))
    if v1 >= 0.1 then
        local v2
        if a4 ~= "Y" then
            v2 = a2
        else
            v2 = a3
        end
        return math.sqrt((a1 * a1) + (v2 * v2)) / v1
    end
    return 0
end
tbl_1.stepTilt = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: stepTilt
      line: 138
    ]]
    local v3 = math.sqrt(((a2 * a2) + (a3 * a3)) + (a4 * a4))
    local v4 = nil
    if v3 >= 0.1 then
        local v5 = a2 / v3
        local v6 = a4 / v3
        local v7 = math.sqrt((v5 * v5) + (v6 * v6))
        local v8 = a1.hasReading and (a6 ~= a1.orientationToken)
        a1.orientationToken = a6
        if v8 then
            a1.pendingOrientationCalibration = true
        end
        v4 = a1.confident
        if v4 then
            if v7 < 0.12 then
                a1.confident = false
            end
        elseif v7 >= 0.18 then
            a1.confident = true
        end
        local v9 = a1.confident and (not v4)
        if a1.hasReading and not (v9) and not (v8) then
            if a1.confident then
                local v10 = 1 - math.exp(-a5 / 0.05)
                local v11 = 1 - math.exp(-a5 / 0.35)
                a1.fastU = a1.fastU + ((v5 - a1.fastU) * v10)
                a1.fastV = a1.fastV + ((v6 - a1.fastV) * v10)
                a1.slowU = a1.slowU + ((v5 - a1.slowU) * v11)
                a1.slowV = a1.slowV + ((v6 - a1.slowV) * v11)
                return
            end
            return nil
        end
        a1.fastU = v5
        a1.fastV = v6
        a1.slowU = v5
        a1.slowV = v6
        a1.hasReading = true
        if a1.pendingOrientationCalibration and v7 >= 0.15 then
            a1.neutralU = v5 / v7
            a1.neutralV = v6 / v7
            a1.hasNeutral = true
            a1.pendingOrientationCalibration = false
        end
    end
    return nil
end
tbl_1.calibrateTilt = function(a1)
    --[[
      name: calibrateTilt
      line: 203
    ]]
    local v12 = math.sqrt((a1.slowU * a1.slowU) + (a1.slowV * a1.slowV))
    if v12 >= 0.15 then
        a1.neutralU = a1.slowU / v12
        a1.neutralV = a1.slowV / v12
        a1.hasNeutral = true
        a1.pendingOrientationCalibration = false
    else
        return nil
    end
end
tbl_1.relativeBankDegrees = function(a1)
    --[[
      name: relativeBankDegrees
      line: 223
    ]]
    if a1.hasReading and a1.hasNeutral then
        return (math.deg(math.asin(math.clamp(1 * ((a1.fastU * a1.neutralV) - (a1.fastV * a1.neutralU)), -1, 1))))
    end
    return 0
end
tbl_1.steerFraction = function(a1, a2, a3, a4)
    --[[
      name: steerFraction
      line: 239
    ]]
    local v13 = a1 - a2
    local v14 = math.abs(v13)
    if v14 > a4 then
        local v15 = math.min((v14 - a4) / math.max(a3 - a4, 0.1), 1)
        if v13 >= 0 then
            return v15
        end
        return -v15
    end
    return 0
end
tbl_1.steerFromState = function(a1, a2, a3)
    --[[
      name: steerFromState
      line: 250
    ]]
    local v16
    if (a1.hasReading) and (a1.hasNeutral) then
        v16 = math.deg(math.asin(math.clamp(1 * ((a1.fastU * a1.neutralV) - (a1.fastV * a1.neutralU)), -1, 1)))
    else
        v16 = 0
    end
    local v17 = v16 - 0
    local v18 = math.abs(v17)
    if v18 > a3 then
        local v19 = math.min((v18 - a3) / math.max(a2 - a3, 0.1), 1)
        if v17 >= 0 then
            return v19
        end
        return -v19
    end
    return 0
end
return tbl_1