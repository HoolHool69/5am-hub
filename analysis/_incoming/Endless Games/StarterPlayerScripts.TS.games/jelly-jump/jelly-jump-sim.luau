-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function nextUnit_1(a1)
    --[[
      name: nextUnit
      line: 208
    ]]
    a1.randomState = (a1.randomState * 48271) % 2147483647
    return (a1.randomState - 1) / 2147483647
end
local function drawSpeedClass_1(a1, a2)
    --[[
      name: drawSpeedClass
      line: 212
    ]]
    a1.randomState = (a1.randomState * 48271) % 2147483647
    local v1 = (a1.randomState - 1) / 2147483647
    if v1 >= a2.fastClassChance then
        if v1 >= a2.fastClassChance + a2.mediumClassChance then
            return 2
        end
        return 1
    end
    return 0
end
local function generateLevel_upv_1(a1, a2, a3)
    --[[
      name: generateLevel
      line: 235
    ]]
    a1.randomState = (a1.randomState * 48271) % 2147483647
    local v2 = (a1.randomState - 1) / 2147483647
    local v3 = ((v2 < a2.fastClassChance) and 0) or (((v2 >= a2.fastClassChance + a2.mediumClassChance) and 2) or 1)
    if v3 == a1.lastClass and a1.lastClass == a1.previousClass then
        a1.randomState = (a1.randomState * 48271) % 2147483647
        v3 = ((v3 + 1) + math.floor(((a1.randomState - 1) / 2147483647) * 2)) % 3
    end
    if a3 <= a2.tutorialMediumLevels then
        v3 = 1
    end
    a1.randomState = (a1.randomState * 48271) % 2147483647
    local v4 = ((a3 > 0) and (a2.closeFloorSeconds + (a2.closeStartSeconds - a2.closeFloorSeconds) * math.exp(-a3 / a2.closeDecayLevels))) or (a2.closeStartSeconds)
    local v5
    if v3 == 0 then
        v5 = a2.fastCloseMultiplier
    elseif v3 ~= 2 then
        v5 = a2.mediumCloseMultiplier
    else
        v5 = a2.slowCloseMultiplier
    end
    local v6 = false
    if a2.dropletFirstLevel <= a3 and a1.nextDropletLevel <= a3 then
        v6 = true
        a1.randomState = (a1.randomState * 48271) % 2147483647
        a1.nextDropletLevel = (a3 + a2.dropletMinGap) + math.floor(((a1.randomState - 1) / 2147483647) * ((a2.dropletMaxGap - a2.dropletMinGap) + 1))
    end
    local v7 = a1.gates[(a3 % 12) + 1]
    v7.index = a3
    v7.closeSeconds = (v4 * v5) * (1 + ((((a1.randomState - 1) / 2147483647) * 2) - 1) * a2.closeJitter)
    v7.armedAt = 0
    v7.isArmed = false
    v7.speedClass = v3
    v7.hasDroplet = v6
    v7.dropletTaken = false
    a1.previousClass = a1.lastClass
    a1.lastClass = v3
end
local function ensureGenerated_upv_1(a1, a2, a3)
    --[[
      name: ensureGenerated
      line: 270
      upvalues:
        generateLevel_upv_1 (copy, index: 1)
    ]]
    while a1.generatedThrough < a3 do
        a1.generatedThrough = a1.generatedThrough + 1
        generateLevel_upv_1(a1, a2, a1.generatedThrough)
    end
end
local function launch_1(a1, a2)
    --[[
      name: launch
      line: 382
    ]]
    a1.launchLevel = a1.groundedLevel
    a1.groundedLevel = -1
    a1.velocityY = a2.jumpSpeed
    a1.hasEnteredGate = false
    a1.hasClearedGate = false
    a1.hasMissedGate = false
    a1.lastClearGap = a2.shaftWidthStuds
    a1.bufferedTicks = 0
end
local function stepLiquid_upv_1(a1, a2, a3)
    --[[
      name: stepLiquid
      line: 432
    ]]
    local v8 = (a1.highestLevel * a2.spacingStuds) + (a2.jellySizeStuds / 2) - a2.liquidTrailStuds
    local v9 = a1.liquidY < v8
    local v10
    if v9 then
        v10 = math.min(a2.liquidBaseRise + ((v8 - a1.liquidY) * a2.liquidCatchupGain), a2.liquidMaxRise)
    else
        v10 = a2.liquidBaseRise
    end
    local v11 = a1.liquidY + v10 * a3
    if v9 and v8 < v11 then
        v11 = v8
    end
    a1.liquidY = v11
end
local function landOn_upv_1(a1, a2, a3)
    --[[
      name: landOn
      line: 392
      upvalues:
        ensureGenerated_upv_1 (copy, index: 1)
    ]]
    a1.groundedLevel = a3
    a1.launchLevel = -1
    a1.y = (a3 * a2.spacingStuds) + (a2.jellySizeStuds / 2)
    a1.velocityY = 0
    if a1.highestLevel < a3 then
        a1.highestLevel = a3
    end
    ensureGenerated_upv_1(a1, a2, a3 + a2.generateAheadLevels)
    local v12 = a3 + 1
    local v13, v14 = nil, nil
    if v12 >= 0 then
        v13 = a1.gates[(v12 % 12) + 1]
        if v13.index ~= v12 then
            v14 = nil
        else
            v14 = v13
        end
    else
        v14 = nil
    end
    if v14 == nil or (v14.isArmed) then
        return
    end
    v14.isArmed = true
    v14.armedAt = a1.elapsed
end
local function takeDroplet_upv_1(a1, a2)
    --[[
      name: takeDroplet
      line: 502
    ]]
    local v15 = ((a1.groundedLevel < 0) and (a1.launchLevel + 1)) or (a1.groundedLevel + 1)
    local v16, v17 = nil, nil
    if v15 >= 0 then
        v16 = a1.gates[(v15 % 12) + 1]
        if v16.index ~= v15 then
            v17 = nil
        else
            v17 = v16
        end
    else
        v17 = nil
    end
    if v17 ~= nil and v17.hasDroplet then
        local v18 = nil
        if not (v17.dropletTaken) then
            v16 = v15 * a2.spacingStuds - a2.dropletDropStuds
            v18 = a2.jellySizeStuds / 2
            if a1.y + v18 >= v16 - a2.dropletRadiusStuds and v16 + a2.dropletRadiusStuds >= a1.y - v18 then
                v17.dropletTaken = true
                a1.droplets = a1.droplets + 1
                a1.dropletTakenThisStep = true
                return
            end
            return nil
        end
    end
    return nil
end
local function resolveCrossings_upv_1(a1, a2, a3)
    --[[
      name: resolveCrossings
      line: 448
      upvalues:
        landOn_upv_1 (copy, index: 1)
    ]]
    local v19 = a2.jellySizeStuds / 2
    local v20 = a1.launchLevel + 1
    local v21 = v20 * a2.spacingStuds
    local v22, v23 = nil, nil
    if v20 >= 0 then
        v22 = a1.gates[(v20 % 12) + 1]
        if v22.index ~= v20 then
            v23 = nil
        else
            v23 = v22
        end
    else
        v23 = nil
    end
    if v23 ~= nil then
        local v24 = a1.elapsed
        local v25 = nil
        if v23.isArmed then
            v25 = (v24 - v23.armedAt) / v23.closeSeconds
            if v25 > 0 then
                v22 = ((v25 < 1) and (a2.shaftWidthStuds * (1 - v25))) or 0
            else
                v22 = a2.shaftWidthStuds
            end
        else
            v22 = a2.shaftWidthStuds
        end
        if not (a1.hasEnteredGate) and a3 + v19 < v21 and v21 <= a1.y + v19 then
            a1.hasEnteredGate = true
            if v22 <= 0 then
                a1.y = v21 - v19
                a1.velocityY = 0
                a1.status = "sealed"
                return "sealed"
            end
        end
        if a1.hasEnteredGate and not (a1.hasClearedGate) and a3 - v19 < v21 and v21 <= a1.y - v19 then
            a1.hasClearedGate = true
            a1.lastClearGap = v22
            if v22 >= a2.jellySizeStuds + a2.clearanceStuds then
                return "passed"
            end
            a1.y = v21
            a1.velocityY = 0
            a1.status = "pinched"
            return "pinched"
        end
        if a1.hasClearedGate and not (a1.hasMissedGate) and v21 < a3 - v19 and a1.y - v19 <= v21 then
            if v22 > a2.jellySizeStuds - a2.clearanceStuds then
                a1.hasMissedGate = true
                return "fellThrough"
            end
            landOn_upv_1(a1, a2, v20)
            return "landed"
        end
        if a1.hasMissedGate then
            v24 = a1.launchLevel * a2.spacingStuds
            if v24 < a3 - v19 and a1.y - v19 <= v24 then
                landOn_upv_1(a1, a2, a1.launchLevel)
                return "settled"
            end
        end
    end
    return "none"
end
local function stepDeath_upv_1(a1, a2, a3)
    --[[
      name: stepDeath
      line: 527
    ]]
    a1.liquidY = a1.liquidY + (a2.deathSurgeRise * a3)
    local v26 = nil
    if a1.status == "sealed" then
        a1.velocityY = a1.velocityY + (a2.gravity * a3)
        a1.y = a1.y + (a1.velocityY * a3)
        v26 = a1.launchLevel * a2.spacingStuds + a2.jellySizeStuds / 2
        if a1.y <= v26 then
            a1.y = v26
            a1.velocityY = 0
        end
        return nil
    elseif a1.status == "drowned" then
        a1.y = a1.y - (a2.deathSinkStudsPerSecond * a3)
    end
end
local tbl_1 = {}
tbl_1.seedRandomState = function(a1)
    --[[
      name: seedRandomState
      line: 73
    ]]
    local v27 = math.floor(math.abs(a1)) % 2147483647
    if v27 == 0 then
        v27 = 1
    end
    return (((((((((((v27 * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647
end
tbl_1.makeRunState = function()
    --[[
      name: makeRunState
      line: 100
    ]]
    local tbl_2 = {}
    for _ = 0, 11 do
        table.insert(tbl_2, {})
    end
    local tbl_3 = {}
    tbl_3.gates = tbl_2
    return tbl_3
end
tbl_1.planeYForLevel = function(a1, a2)
    --[[
      name: planeYForLevel
      line: 139
    ]]
    return a1 * a2.spacingStuds
end
tbl_1.restYForLevel = function(a1, a2)
    --[[
      name: restYForLevel
      line: 143
    ]]
    return (a1 * a2.spacingStuds) + (a2.jellySizeStuds / 2)
end
tbl_1.meanCloseSeconds = function(a1, a2)
    --[[
      name: meanCloseSeconds
      line: 157
    ]]
    if a1 > 0 then
        return a2.closeFloorSeconds + ((a2.closeStartSeconds - a2.closeFloorSeconds) * math.exp(-a1 / a2.closeDecayLevels))
    end
    return a2.closeStartSeconds
end
tbl_1.closeMultiplierForClass = function(a1, a2)
    --[[
      name: closeMultiplierForClass
      line: 163
    ]]
    if a1 ~= 0 then
        if a1 ~= 2 then
            return a2.mediumCloseMultiplier
        end
        return a2.slowCloseMultiplier
    end
    return a2.fastCloseMultiplier
end
tbl_1.findGate = function(a1, a2)
    --[[
      name: findGate
      line: 173
    ]]
    local v28 = nil
    if a2 >= 0 then
        v28 = a1.gates[(a2 % 12) + 1]
        if v28.index ~= a2 then
            return nil
        end
        return v28
    end
    return nil
end
tbl_1.gateGap = function(a1, a2, a3)
    --[[
      name: gateGap
      line: 189
    ]]
    local v29 = nil
    if a1.isArmed then
        v29 = (a2 - a1.armedAt) / a1.closeSeconds
        if v29 > 0 then
            if v29 < 1 then
                return a3.shaftWidthStuds * (1 - v29)
            end
            return 0
        end
    end
    return a3.shaftWidthStuds
end
tbl_1.dropletYForLevel = function(a1, a2)
    --[[
      name: dropletYForLevel
      line: 203
    ]]
    return (a1 * a2.spacingStuds) - a2.dropletDropStuds
end
tbl_1.ensureGenerated = ensureGenerated_upv_1
tbl_1.resetRun = function(a1, a2, a3)
    --[[
      name: resetRun
      line: 280
      upvalues:
        ensureGenerated_upv_1 (copy, index: 1)
    ]]
    local v30 = math.floor(math.abs(a3)) % 2147483647
    if v30 == 0 then
        v30 = 1
    end
    a1.randomState = (((((((((((v30 * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647) * 48271) % 2147483647
    a1.generatedThrough = 0
    a1.lastClass = -1
    a1.previousClass = -2
    a1.nextDropletLevel = a2.dropletFirstLevel
    for _, value_1 in a1.gates do
        value_1.index = -1
        value_1.isArmed = false
        value_1.hasDroplet = false
        value_1.dropletTaken = false
    end
    local v31 = a1.gates[1]
    v31.index = 0
    v31.closeSeconds = 1
    v31.armedAt = -1000
    v31.isArmed = true
    v31.speedClass = 1
    a1.y = (0 * a2.spacingStuds) + (a2.jellySizeStuds / 2)
    a1.velocityY = 0
    a1.groundedLevel = 0
    a1.launchLevel = -1
    a1.hasEnteredGate = false
    a1.hasClearedGate = false
    a1.hasMissedGate = false
    a1.highestLevel = 0
    a1.droplets = 0
    a1.dropletTakenThisStep = false
    a1.lastClearGap = a2.shaftWidthStuds
    a1.liquidY = a1.y - a2.liquidTrailStuds
    a1.bufferedTicks = 0
    a1.elapsed = 0
    a1.status = "climbing"
    ensureGenerated_upv_1(a1, a2, 1 + a2.generateAheadLevels)
    local v32 = a1.gates[2]
    if v32.index ~= 1 then
        v30 = nil
    else
        v30 = v32
    end
    if v30 == nil then
        return
    end
    v30.isArmed = true
    v30.armedAt = 0
end
tbl_1.reviveRun = function(a1, a2)
    --[[
      name: reviveRun
      line: 335
      upvalues:
        ensureGenerated_upv_1 (copy, index: 1)
    ]]
    local highestLevel_1 = a1.highestLevel
    a1.status = "climbing"
    a1.groundedLevel = highestLevel_1
    a1.launchLevel = -1
    a1.y = (highestLevel_1 * a2.spacingStuds) + (a2.jellySizeStuds / 2)
    a1.velocityY = 0
    a1.hasEnteredGate = false
    a1.hasClearedGate = false
    a1.hasMissedGate = false
    a1.lastClearGap = a2.shaftWidthStuds
    a1.bufferedTicks = 0
    a1.dropletTakenThisStep = false
    a1.liquidY = a1.y - a2.liquidTrailStuds
    ensureGenerated_upv_1(a1, a2, highestLevel_1 + a2.generateAheadLevels)
    local v33 = highestLevel_1 + 1
    local v34, v35 = nil, nil
    if v33 >= 0 then
        v34 = a1.gates[(v33 % 12) + 1]
        if v34.index ~= v33 then
            v35 = nil
        else
            v35 = v34
        end
    else
        v35 = nil
    end
    if v35 == nil then
        return
    end
    v35.isArmed = true
    v35.armedAt = a1.elapsed
end
tbl_1.pressJump = function(a1, a2)
    --[[
      name: pressJump
      line: 371
    ]]
    if a1.status == "climbing" then
        a1.bufferedTicks = a2.jumpBufferTicks
    else
        return nil
    end
end
tbl_1.clearJumpBuffer = function(a1)
    --[[
      name: clearJumpBuffer
      line: 378
    ]]
    a1.bufferedTicks = 0
end
tbl_1.stepRun = function(a1, a2, a3)
    --[[
      name: stepRun
      line: 555
      upvalues:
        stepDeath_upv_1 (copy, index: 1)
        stepLiquid_upv_1 (copy, index: 2)
        resolveCrossings_upv_1 (copy, index: 3)
        takeDroplet_upv_1 (copy, index: 4)
    ]]
    a1.dropletTakenThisStep = false
    if a1.status == "climbing" then
        a1.elapsed = a1.elapsed + a3
        local v36 = "none"
        if a1.bufferedTicks > 0 then
            a1.bufferedTicks = a1.bufferedTicks - 1
            if a1.groundedLevel >= 0 then
                a1.launchLevel = a1.groundedLevel
                a1.groundedLevel = -1
                a1.velocityY = a2.jumpSpeed
                a1.hasEnteredGate = false
                a1.hasClearedGate = false
                a1.hasMissedGate = false
                a1.lastClearGap = a2.shaftWidthStuds
                a1.bufferedTicks = 0
                v36 = "jumped"
            end
        end
        local y_1 = a1.y
        if a1.groundedLevel < 0 then
            a1.velocityY = a1.velocityY + (a2.gravity * a3)
            a1.y = a1.y + (a1.velocityY * a3)
        end
        stepLiquid_upv_1(a1, a2, a3)
        local v37 = nil
        if a1.groundedLevel < 0 then
            v37 = resolveCrossings_upv_1(a1, a2, y_1)
            if v37 ~= "none" then
                v36 = v37
            end
        end
        takeDroplet_upv_1(a1, a2)
        if a1.status == "climbing" and a1.y - (a2.jellySizeStuds / 2) <= a1.liquidY then
            a1.status = "drowned"
            return "drowned"
        end
        return v36
    end
    stepDeath_upv_1(a1, a2, a3)
    return "none"
end
return tbl_1