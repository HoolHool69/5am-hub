-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveSeed_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveSeed
local CROSSY_ROAD_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "crossy-road-config").CROSSY_ROAD_CONFIG
local u1 = CROSSY_ROAD_CONFIG_upv_1.columnHalf * CROSSY_ROAD_CONFIG_upv_1.cellWidth
local u2 = u1 * 2 + CROSSY_ROAD_CONFIG_upv_1.wrapMargin * 2
local u3 = u1 + CROSSY_ROAD_CONFIG_upv_1.wrapMargin
local u4 = u3 + CROSSY_ROAD_CONFIG_upv_1.trainLength / 2
local u5 = u4 * 2 / CROSSY_ROAD_CONFIG_upv_1.trainSpeed
local u6 = CROSSY_ROAD_CONFIG_upv_1.columnHalf * 2 + 1
local function columnMaskIndex_1(a1)
    --[[
      name: columnMaskIndex
      line: 66
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1 + CROSSY_ROAD_CONFIG_upv_1.columnHalf
end
local function maskAny_1(a1)
    --[[
      name: maskAny
      line: 91
    ]]
    for _, value_1 in a1 do
        if not (value_1) then
            continue
        end
        return true
    end
    return false
end
local function makeColumnMask_upv_1(a1)
    --[[
      name: makeColumnMask
      line: 70
      upvalues:
        u6 (copy, index: 1)
    ]]
    local tbl_1 = {}
    local v1 = 0
    local v2 = false
    while true do
        if v2 then
            v1 = v1 + 1
        else
            v2 = true
        end
        if v1 >= u6 then
            break
        end
        table.insert(tbl_1, a1)
    end
    return tbl_1
end
local function maskMin_1(a1)
    --[[
      name: maskMin
      line: 120
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_1 = -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf do
        if not (a1[(n_1 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
            continue
        end
        return n_1
    end
    return nil
end
local function maskMax_1(a1)
    --[[
      name: maskMax
      line: 128
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_2 = CROSSY_ROAD_CONFIG_upv_1.columnHalf, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, -1 do
        if not (a1[(n_2 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
            continue
        end
        return n_2
    end
    return nil
end
local function nearestSetColumn_upv_1(a1, a2)
    --[[
      name: nearestSetColumn
      line: 170
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
    ]]
    if a1[(math.clamp(a2, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf) + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] then
        return (math.clamp(a2, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf))
    else
        local v3 = 1
        local v4 = false
        local v5 = nil
        while true do
            local v6
            if v4 then
                v3 = v3 + 1
            else
                v4 = true
            end
            if v3 > u6 then
                return a2
            end
            v6 = a2 - v3
            v5 = a2 + v3
            if -CROSSY_ROAD_CONFIG_upv_1.columnHalf > v6 or not (a1[(v6 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
                if v5 > CROSSY_ROAD_CONFIG_upv_1.columnHalf then
                    continue
                end
                if a1[(v5 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] then
                    break
                end
            end
            return v6
        end
        return v5
    end
end
local u7 = u2 / CROSSY_ROAD_CONFIG_upv_1.logsPerLane
local function logDriftColumns_1(a1, a2, a3)
    --[[
      name: logDriftColumns
      line: 228
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
    ]]
    local logSpeedStart_1 = CROSSY_ROAD_CONFIG_upv_1.logSpeedStart
    return (math.max(1, math.ceil(a1 * math.min(math.max((u7 - a2) - (2 * CROSSY_ROAD_CONFIG_upv_1.logLandingAssist), 0) / math.max(a1 + ((logSpeedStart_1 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedMax - logSpeedStart_1) * a3)) * CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMin), 0.001), CROSSY_ROAD_CONFIG_upv_1.logReachableDwellSeconds) / CROSSY_ROAD_CONFIG_upv_1.cellWidth)))
end
local function wrapMover_1(a1)
    --[[
      name: wrapMover
      line: 241
      upvalues:
        u3 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v7 = (a1 + u3) % u2
    if v7 < 0 then
        v7 = v7 + u2
    end
    return v7 - u3
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 339
    ]]
    return "CrossyRoadSim"
end
local u8 = setmetatable(tbl_2, tbl_3)
u8.__index = u8
u8.new = function(...)
    --[[
      name: new
      line: 344
      upvalues:
        u8 (ref, index: 1)
    ]]
    local v8 = setmetatable({}, u8)
    return v8:constructor(...) or v8
end
u8.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 348
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        makeColumnMask_upv_1 (copy, index: 2)
    ]]
    if a3 == nil then
        a3 = {}
    end
    a1.listener = a3
    a1.row = CROSSY_ROAD_CONFIG_upv_1.startRow
    a1.column = 0
    a1.driftX = 0
    a1.hopping = false
    a1.hopProgress = 0
    a1.hopFromRow = CROSSY_ROAD_CONFIG_upv_1.startRow
    a1.hopFromColumn = 0
    a1.hopFromDrift = 0
    a1.hopToDrift = 0
    a1.hopFromSurfaceY = 0
    a1.hopToSurfaceY = 0
    a1.facing = "forward"
    a1.onLilyPad = false
    a1.furthestRow = CROSSY_ROAD_CONFIG_upv_1.startRow
    a1.deathEdgeRow = 0
    a1.score = 0
    a1.coinsCollected = 0
    a1.dead = false
    a1.eagleState = "none"
    a1.eagleTimer = 0
    a1.eagleWarning = false
    a1.boardClock = 0
    a1.safeGrassRepairs = 0
    a1.queuedHop = nil
    a1.noProgressTimer = 0
    a1.graceTimer = 0
    a1.creepPauseTimer = 0
    a1.reviveClearTimer = 0
    a1.boxedIn = false
    a1.seed = 1
    a1.laneRandom = Random.new()
    a1.frontRow = 0
    a1.replaying = false
    a1.runKind = "grass"
    a1.runRemaining = 0
    a1.hazardRowsSinceGrass = 0
    a1.grassRunIsForest = false
    a1.forestSparse = false
    a1.routeColumn = 0
    a1.consecutivePadRivers = 0
    a1.padGatewayColumn = nil
    a1.reachableColumns = makeColumnMask_upv_1(true)
    a1.guaranteedColumns = makeColumnMask_upv_1(true)
    a1.lastLogVelocity = nil
    a1.consecutiveSameDirectionLogs = 0
    a1.logLipColumns = 0
    a1.clearBankPending = false
    a1.lanes = a2
end
u8.reset = function(a1, a2, a3)
    --[[
      name: reset
      line: 402
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        makeColumnMask_upv_1 (copy, index: 2)
        deriveSeed_upv_1 (copy, index: 3)
    ]]
    if a3 == nil then
        a3 = 0
    end
    a1.seed = a2
    a1.score = 0
    a1.row = CROSSY_ROAD_CONFIG_upv_1.startRow
    a1.column = 0
    a1.driftX = 0
    a1.hopping = false
    a1.hopProgress = 0
    a1.facing = "forward"
    a1.queuedHop = nil
    a1.furthestRow = CROSSY_ROAD_CONFIG_upv_1.startRow
    a1.deathEdgeRow = CROSSY_ROAD_CONFIG_upv_1.startRow - CROSSY_ROAD_CONFIG_upv_1.deathMarginRows
    a1.graceTimer = 0
    a1.creepPauseTimer = 0
    a1.reviveClearTimer = 0
    a1.dead = false
    a1.onLilyPad = false
    a1.coinsCollected = 0
    a1.noProgressTimer = 0
    a1.eagleState = "none"
    a1.eagleTimer = 0
    a1:clearEagleWarning()
    a1.boardClock = a3
    a1.safeGrassRepairs = 0
    a1.runKind = "grass"
    a1.runRemaining = 0
    a1.hazardRowsSinceGrass = 0
    a1.grassRunIsForest = false
    a1.forestSparse = false
    a1.routeColumn = 0
    a1.consecutivePadRivers = 0
    a1.padGatewayColumn = nil
    a1.reachableColumns = makeColumnMask_upv_1(true)
    a1.guaranteedColumns = makeColumnMask_upv_1(true)
    a1.boxedIn = false
    a1.lastLogVelocity = nil
    a1.consecutiveSameDirectionLogs = 0
    a1.logLipColumns = 0
    a1.clearBankPending = false
    a1.laneRandom = Random.new(deriveSeed_upv_1(a2, 0))
    a1.frontRow = (CROSSY_ROAD_CONFIG_upv_1.startRow - CROSSY_ROAD_CONFIG_upv_1.lanesBehindStart) - 1
    for _, value_2 in a1.lanes do
        a1.frontRow = a1.frontRow + 1
        a1:configureLane(value_2, a1.frontRow)
    end
end
u8.resumeState = function(a1)
    --[[
      name: resumeState
      line: 453
    ]]
    local tbl_4 = {}
    tbl_4.frontRow = a1.frontRow
    local v9
    if a1.hopping then
        v9 = a1.hopFromRow
    else
        v9 = a1.row
    end
    tbl_4.row = v9
    if a1.hopping then
        v9 = a1.hopFromColumn
    else
        v9 = a1.column
    end
    tbl_4.column = v9
    if a1.hopping then
        v9 = a1.hopFromDrift
    else
        v9 = a1.driftX
    end
    tbl_4.driftX = v9
    tbl_4.facing = a1.facing
    tbl_4.furthestRow = a1.furthestRow
    tbl_4.deathEdgeRow = a1.deathEdgeRow
    tbl_4.score = a1.score
    tbl_4.coinsCollected = a1.coinsCollected
    tbl_4.boardClock = a1.boardClock
    tbl_4.onLilyPad = a1.onLilyPad
    return tbl_4
end
u8.restore = function(a1, a2, a3)
    --[[
      name: restore
      line: 468
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a3.frontRow >= CROSSY_ROAD_CONFIG_upv_1.startRow and a3.frontRow <= 1e+05 then
        a1.replaying = true
        a1:reset(a2, a3.boardClock)
        local v10 = 0
        while a1.frontRow < a3.frontRow do
            a1.frontRow = a1.frontRow + 1
            a1:configureLane(a1.lanes[(v10 % #a1.lanes) + 1], a1.frontRow)
            v10 = v10 + 1
        end
        a1.replaying = false
        if a3.row >= (a1.frontRow - #a1.lanes) + 1 then
            local v11, v12 = nil, nil
            if a1.frontRow >= a3.row then
                a1.row = a3.row
                a1.column = math.clamp(a3.column, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf)
                a1.driftX = a3.driftX
                a1.facing = a3.facing
                a1.furthestRow = a3.furthestRow
                a1.deathEdgeRow = a3.deathEdgeRow
                a1.score = a3.score
                a1.coinsCollected = a3.coinsCollected
                v11 = a1:laneAtRow(a3.row)
                v12 = false
                if v11 ~= nil then
                    v12 = false
                    if v11.kind == "river" then
                        v12 = a1:hasPad(v11, a1.column)
                    end
                end
                a1.onLilyPad = v12
                a1.hopping = false
                a1.hopProgress = 0
                a1.hopFromRow = a3.row
                a1.hopFromColumn = a1.column
                a1.hopFromDrift = a3.driftX
                a1.hopToDrift = a3.driftX
                a1.queuedHop = nil
                a1.dead = false
                a1.eagleState = "none"
                a1.eagleTimer = 0
                a1.noProgressTimer = 0
                a1:clearEagleWarning()
                a1.deathEdgeRow = math.min(a1.deathEdgeRow, a1.row - 1.5)
                v12 = a1:laneAtRow(a1.row)
                if v12 ~= nil and v12.kind == "river" and not (a1.onLilyPad) and not (a1:isOverLog(v12)) then
                    a1:tryLogGrab(v12, CROSSY_ROAD_CONFIG_upv_1.logLandingAssist + CROSSY_ROAD_CONFIG_upv_1.cellWidth)
                end
                a1.hopFromDrift = a1.driftX
                a1.hopToDrift = a1.driftX
                a1.reviveClearTimer = CROSSY_ROAD_CONFIG_upv_1.reviveClearSeconds
                a1.creepPauseTimer = CROSSY_ROAD_CONFIG_upv_1.reviveCreepPauseSeconds
                return true
            end
        end
    end
    return false
end
u8.revive = function(a1)
    --[[
      name: revive
      line: 546
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.hopping = false
    a1.hopProgress = 0
    a1.queuedHop = nil
    a1.dead = false
    a1.driftX = 0
    a1.onLilyPad = false
    a1.noProgressTimer = 0
    a1.eagleState = "none"
    a1.eagleTimer = 0
    a1:clearEagleWarning()
    a1.graceTimer = 0
    a1.row = a1.furthestRow
    a1.column = math.clamp(a1.column, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf)
    local v13 = nil
    for _, value_3 in a1.lanes do
        if value_3.row ~= a1.row then
            continue
        end
        a1:makeSafeGrass(value_3)
        v13 = a1.listener.onLaneConfigured
        if v13 ~= nil then
            v13(value_3)
        end
    end
    a1.deathEdgeRow = math.min(a1.deathEdgeRow, a1.row - 1.5)
    a1.reviveClearTimer = CROSSY_ROAD_CONFIG_upv_1.reviveClearSeconds
    a1.creepPauseTimer = CROSSY_ROAD_CONFIG_upv_1.reviveCreepPauseSeconds
end
u8.queueHop = function(a1, a2)
    --[[
      name: queueHop
      line: 581
    ]]
    if a1.dead then
        return nil
    end
    a1.queuedHop = a2
end
u8.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 587
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.eagleState == "none" then
        if not a1.dead then
            a1:advanceMovers(a2, true)
            a1:advanceCreep(a2)
            a1:recycleLanes()
            a1:advanceRiding(a2)
            if not (a1.hopping) then
                a1.boxedIn = not a1:hasSafeForwardHop()
            end
            if a1.hopping then
                a1:advanceHop(a2)
            elseif a1.queuedHop ~= nil then
                local queuedHop_1 = a1.queuedHop
                a1.queuedHop = nil
                a1:startHop(queuedHop_1)
            end
            if not (a1.dead) and a1.eagleState == "none" then
                if a1.reviveClearTimer <= 0 then
                    a1:checkHazards()
                else
                    a1.reviveClearTimer = math.max(a1.reviveClearTimer - a2, 0)
                end
                if not a1.dead then
                    a1:collectCoin()
                    if a1:playerRowContinuous() >= a1.deathEdgeRow then
                        local v14 = nil
                        if a1.reviveClearTimer <= 0 then
                            v14 = a1:laneAtRow(a1.row)
                            local v15 = false
                            if v14 ~= nil then
                                v15 = v14.kind == "river"
                            end
                            if a1.boxedIn or v15 then
                                a1.noProgressTimer = 0
                            else
                                a1.noProgressTimer = a1.noProgressTimer + a2
                            end
                            local v16
                            if a1.hopping then
                                v16 = true
                                if a1.hopFromRow >= a1.row then
                                    v16 = a1.queuedHop == "forward"
                                end
                            else
                                v16 = a1.queuedHop == "forward"
                            end
                            a1:updateEagleWarning(v16)
                            if CROSSY_ROAD_CONFIG_upv_1.eagleIdleSeconds <= a1.noProgressTimer and not (v16) then
                                a1:beginEagleSnatch()
                            end
                        end
                        return
                    end
                    a1:beginEagleSnatch()
                end
                return nil
            end
        end
    else
        a1:advanceEagle(a2)
    end
    return nil
end
u8.updateEagleWarning = function(a1, a2)
    --[[
      name: updateEagleWarning
      line: 653
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v17 = CROSSY_ROAD_CONFIG_upv_1.eagleIdleSeconds - CROSSY_ROAD_CONFIG_upv_1.eagleWarnSeconds <= a1.noProgressTimer
    local v18 = not a1.dead and (not a1.boxedIn and (not a2 and (v17 or a1.row <= (a1.furthestRow - CROSSY_ROAD_CONFIG_upv_1.eagleRetreatRows))))
    if v18 ~= a1.eagleWarning then
        a1.eagleWarning = v18
        local v19, v20 = nil, nil
        if v18 then
            v19 = a1.listener.onEagleWarn
            if v19 ~= nil then
                v19()
                return
            end
        else
            v20 = a1.listener.onEagleCalm
            if v20 ~= nil then
                v20()
            end
        end
    else
        return nil
    end
end
u8.clearEagleWarning = function(a1)
    --[[
      name: clearEagleWarning
      line: 675
    ]]
    a1.eagleWarning = false
end
u8.advanceBoardOnly = function(a1, a2)
    --[[
      name: advanceBoardOnly
      line: 678
    ]]
    a1:advanceMovers(a2, false)
end
u8.advanceLaneWindowTo = function(a1, a2)
    --[[
      name: advanceLaneWindowTo
      line: 681
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _, value_4 in a1.lanes do
        if value_4.row < a2 - CROSSY_ROAD_CONFIG_upv_1.lanesBehindStart then
            a1.frontRow = a1.frontRow + 1
            a1:configureLane(value_4, a1.frontRow)
        end
    end
end
u8.advanceCreep = function(a1, a2)
    --[[
      name: advanceCreep
      line: 690
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.graceTimer = a1.graceTimer + a2
    if a1.creepPauseTimer <= 0 then
        if CROSSY_ROAD_CONFIG_upv_1.graceSeconds <= a1.graceTimer then
            local v21 = math.clamp((a1.furthestRow - CROSSY_ROAD_CONFIG_upv_1.startRow) / CROSSY_ROAD_CONFIG_upv_1.creepRampRows, 0, 1)
            local creepSpeedStart_1 = CROSSY_ROAD_CONFIG_upv_1.creepSpeedStart
            a1.deathEdgeRow = a1.deathEdgeRow + ((creepSpeedStart_1 + ((CROSSY_ROAD_CONFIG_upv_1.creepSpeedMax - creepSpeedStart_1) * v21)) * a2)
        end
        a1.deathEdgeRow = math.max(a1.deathEdgeRow, a1.furthestRow - CROSSY_ROAD_CONFIG_upv_1.maxTrailRows)
    else
        a1.creepPauseTimer = math.max(a1.creepPauseTimer - a2, 0)
        return nil
    end
end
u8.advanceMovers = function(a1, a2, a3)
    --[[
      name: advanceMovers
      line: 704
      upvalues:
        u3 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    a1.boardClock = a1.boardClock + a2
    for _, value_5 in a1.lanes do
        if value_5.kind == "road" or value_5.kind == "river" then
            local v22 = 0
            local v23 = false
            if v23 then
                v22 = v22 + 1
            else
                v23 = true
            end
            local v24, v25
            if v22 >= value_5.moverCount then
                continue
            end
            v24 = value_5.positions
            v25 = ((value_5.positions[v22 + 1] + (value_5.velocity * a2)) + u3) % u2
            if v25 < 0 then
                v25 = v25 + u2
            end
            v24[v22 + 1] = v25 - u3
        elseif value_5.kind == "rail" then
            a1:advanceTrain(value_5, a2)
            if not (a3) then
                continue
            end
            if value_5.trainPhase == "passing" then
                a1:maybeRumbleTrain(value_5)
            end
        end
    end
end
u8.advanceRiding = function(a1, a2)
    --[[
      name: advanceRiding
      line: 731
    ]]
    if not (a1.hopping) then
        local v26 = nil
        if not (a1.onLilyPad) then
            v26 = a1:laneAtRow(a1.row)
            if v26 ~= nil and v26.kind == "river" then
                a1.driftX = a1.driftX + (v26.velocity * a2)
                return
            end
            return nil
        end
    end
    return nil
end
u8.advanceTrain = function(a1, a2, a3)
    --[[
      name: advanceTrain
      line: 743
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        u4 (copy, index: 3)
    ]]
    local v27 = 0
    local v28 = a3
    while v28 > 0 and v27 < 8192 do
        v27 = v27 + 1
        local v29 = math.min(a2.trainTimer, v28)
        a2.trainTimer = a2.trainTimer - v29
        a2.blinkTimer = a2.blinkTimer + v29
        v28 = v28 - v29
        if a2.trainPhase == "passing" then
            a2.trainX = a2.trainX + ((a2.trainDir * CROSSY_ROAD_CONFIG_upv_1.trainSpeed) * v29)
        end
        if a2.trainTimer > 0 then
            break
        end
        if a2.trainPhase == "clear" then
            a2.trainPhase = "warning"
            a2.trainTimer = CROSSY_ROAD_CONFIG_upv_1.trainWarnSeconds
            a2.blinkTimer = 0
            continue
        end
        if a2.trainPhase == "warning" then
            a2.trainPhase = "passing"
            a2.trainTimer = u5
            a2.trainX = -a2.trainDir * u4
            a2.shakeArmed = true
            continue
        end
        a2.trainPhase = "clear"
        a2.trainTimer = a2.trainRandom:NextNumber(CROSSY_ROAD_CONFIG_upv_1.trainClearMin, CROSSY_ROAD_CONFIG_upv_1.trainClearMax)
        if a2.trainRandom:NextNumber() >= 0.5 or a2.trainRandom:NextNumber() < 0.5 then
            a2.trainDir = -1
            a2.shakeArmed = false
        end
    end
end
u8.maybeRumbleTrain = function(a1, a2)
    --[[
      name: maybeRumbleTrain
      line: 776
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v30 = nil
    if a2.shakeArmed then
        v30 = math.abs(a2.row - a1.row)
        if CROSSY_ROAD_CONFIG_upv_1.trainShakeRows >= v30 then
            local v31 = nil
            if CROSSY_ROAD_CONFIG_upv_1.trainShakeRange >= math.abs(a2.trainX - a1:playerWorldX()) then
                a2.shakeArmed = false
                v31 = a1.listener.onTrainNear
                if v31 ~= nil then
                    v31(a2, 1 - (v30 / (CROSSY_ROAD_CONFIG_upv_1.trainShakeRows + 1)))
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
u8.advanceHop = function(a1, a2)
    --[[
      name: advanceHop
      line: 794
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.hopProgress = a1.hopProgress + (a2 / CROSSY_ROAD_CONFIG_upv_1.hopDuration)
    local v32 = nil
    if a1.hopProgress >= 1 then
        a1.hopProgress = 1
        a1.hopping = false
        a1.driftX = a1.hopToDrift
        if a1.hopFromRow < a1.row then
            a1.noProgressTimer = 0
        end
        if a1.furthestRow < a1.row then
            a1.score = a1.score + (a1.row - a1.furthestRow)
            a1.furthestRow = a1.row
            v32 = a1.listener.onScored
            if v32 ~= nil then
                v32(a1.score)
            end
        end
        if not (a1.boxedIn) and a1.row < a1.furthestRow - CROSSY_ROAD_CONFIG_upv_1.eagleRetreatRows then
            a1:beginEagleSnatch()
            return nil
        end
        a1:landOnLane()
    else
        return nil
    end
end
u8.landOnLane = function(a1)
    --[[
      name: landOnLane
      line: 822
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v33 = a1:laneAtRow(a1.row)
    local v34 = false
    if v33 ~= nil then
        v34 = false
        if v33.kind == "river" then
            v34 = a1:hasPad(v33, a1.column)
        end
    end
    a1.onLilyPad = v34
    if v33 == nil or v33.kind ~= "river" then
        v34 = a1.listener.onLanded
        if v34 ~= nil then
            v34(a1:playerWorldX(), false)
        end
    else
        if a1.onLilyPad or a1:isOverLog(v33) or a1:tryLogGrab(v33) then
            v34 = a1.listener.onLanded
            if v34 ~= nil then
                v34(a1:playerWorldX(), true)
            end
        else
            if a1.reviveClearTimer > 0 then
                a1:tryLogGrab(v33, CROSSY_ROAD_CONFIG_upv_1.logLandingAssist + CROSSY_ROAD_CONFIG_upv_1.cellWidth)
                v34 = a1.listener.onLanded
                if v34 ~= nil then
                    v34(a1:playerWorldX(), false)
                end
                if a1.reviveClearTimer <= 0 and v33 ~= nil then
                    if v33.kind == "road" and a1:overlapsMover(v33) then
                        a1:die("car")
                        return nil
                    end
                    if v33.kind == "rail" and v33.trainPhase == "passing" and a1:overlapsTrain(v33) then
                        a1:die("train")
                        return nil
                    end
                end
                a1:collectCoin()
                a1:resolveQueuedHop()
                return
            end
            a1:die("water")
            return nil
        end
        a1:collectCoin()
        a1:resolveQueuedHop()
        return nil
    end
    if a1.reviveClearTimer <= 0 and v33 ~= nil then
        if v33.kind == "road" and a1:overlapsMover(v33) then
            a1:die("car")
            return nil
        end
        if v33.kind == "rail" and v33.trainPhase == "passing" and a1:overlapsTrain(v33) then
            a1:die("train")
            return nil
        end
    end
    a1:collectCoin()
    a1:resolveQueuedHop()
end
u8.resolveQueuedHop = function(a1)
    --[[
      name: resolveQueuedHop
      line: 875
    ]]
    if a1.queuedHop ~= nil then
        local queuedHop_2 = a1.queuedHop
        a1.queuedHop = nil
        a1:startHop(queuedHop_2)
    else
        return nil
    end
end
u8.startHop = function(a1, a2)
    --[[
      name: startHop
      line: 883
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    a1.facing = a2
    local v35 = a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth + a1.driftX
    local v36 = a1.row
    local v37
    if a2 == "forward" then
        v36 = a1.row + 1
        v37 = math.clamp(v35, -u1, u1)
    elseif a2 ~= "back" then
        v37 = ((a2 ~= "left") and (v35 - CROSSY_ROAD_CONFIG_upv_1.cellWidth)) or (v35 + CROSSY_ROAD_CONFIG_upv_1.cellWidth)
    else
        v36 = a1.row - 1
        v37 = math.clamp(v35, -u1, u1)
    end
    local v38 = true
    if a2 ~= "left" then
        v38 = a2 == "right"
    end
    local v39
    if v38 then
        v39 = a1:laneAtRow(a1.row)
    else
        v39 = nil
    end
    if v39 ~= nil and v39.kind == "river" and v39.moverCount > 0 then
        v37 = (a1.onLilyPad) or v37 + v39.velocity * CROSSY_ROAD_CONFIG_upv_1.hopDuration
    end
    local v40 = math.round(v37 / CROSSY_ROAD_CONFIG_upv_1.cellWidth)
    if v40 >= -CROSSY_ROAD_CONFIG_upv_1.columnHalf then
        local v41, v42 = nil, nil
        if CROSSY_ROAD_CONFIG_upv_1.columnHalf >= v40 then
            v41 = a1:laneAtRow(v36)
            if v41 ~= nil and v41.kind == "grass" and a1:hasBlocker(v41, v40) then
                v42 = a1.listener.onHopBlocked
                if v42 ~= nil then
                    v42()
                end
                return nil
            end
            v42 = a1.listener.onHopStarted
            if v42 ~= nil then
                v42(v35)
            end
            a1.hopFromRow = a1.row
            a1.hopFromColumn = a1.column
            a1.hopFromDrift = a1.driftX
            a1.hopFromSurfaceY = a1:currentSurfaceY()
            a1.row = v36
            a1.column = v40
            local v43 = false
            if v41 ~= nil then
                v43 = v41.kind == "river"
            end
            local v44
            if v43 then
                local v45 = false
                if v41 == nil then
                    v44 = v45
                else
                    v44 = a1:hasPad(v41, v40)
                end
            else
                v44 = v43
            end
            local v46
            if not (v43) or v44 then
                v46 = 0
            else
                v46 = v37 - v40 * CROSSY_ROAD_CONFIG_upv_1.cellWidth
            end
            a1.hopToDrift = v46
            local _ = false
            if v41 ~= nil then
                v46 = false
                if v41.kind == "river" then
                    v46 = false
                    if v41.moverCount > 0 then
                        v46 = a1:isNearLog(v41, v37)
                    end
                end
            end
            a1.hopToSurfaceY = (v44 and 0.8) or ((v46 and 1.2) or 0)
            a1.hopProgress = 0
            a1.hopping = true
            return
        end
    end
    local onHopBlocked_1 = a1.listener.onHopBlocked
    if onHopBlocked_1 ~= nil then
        onHopBlocked_1()
    end
    return nil
end
u8.checkHazards = function(a1)
    --[[
      name: checkHazards
      line: 958
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v47
    if a1.hopping then
        return nil
    end
    v47 = a1:laneAtRow(a1.row)
    if v47 == nil then
        return nil
    elseif v47.kind ~= "road" then
        if v47.kind ~= "rail" then
            if v47.kind == "river" then
                if a1.onLilyPad then
                    return nil
                elseif a1:isOverLog(v47) then
                    if u1 + CROSSY_ROAD_CONFIG_upv_1.carriedOffMargin < math.abs((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX) then
                        a1:die("water")
                    end
                else
                    a1:die("water")
                    return
                end
            end
        elseif v47.trainPhase == "passing" and a1:overlapsTrain(v47) then
            a1:die("train")
            return
        end
    elseif a1:overlapsMover(v47) then
        a1:die("car")
        return
    end
end
u8.die = function(a1, a2)
    --[[
      name: die
      line: 988
    ]]
    local v48, v49 = nil, nil
    if a1.dead then
        return nil
    end
    a1.dead = true
    a1.hopping = false
    if a1.eagleWarning then
        a1.eagleWarning = false
        v48 = a1.listener.onEagleCalm
        if v48 ~= nil then
            v48()
        end
    end
    v49 = a1.listener.onDeath
    if v49 ~= nil then
        v49(a2)
    end
end
u8.beginEagleSnatch = function(a1)
    --[[
      name: beginEagleSnatch
      line: 1009
    ]]
    if a1.eagleState == "none" then
        local v50 = nil
        if not (a1.dead) then
            v50 = a1.listener.onEagleSnatch
            if v50 ~= nil then
                v50()
            end
            a1.dead = true
            a1.hopping = false
            a1.queuedHop = nil
            a1:clearEagleWarning()
            a1.eagleState = "swoop"
            a1.eagleTimer = 0
            return
        end
    end
    return nil
end
u8.advanceEagle = function(a1, a2)
    --[[
      name: advanceEagle
      line: 1029
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.eagleTimer = a1.eagleTimer + a2
    if a1.eagleState ~= "swoop" then
        local v51 = nil
        if a1.eagleTimer >= CROSSY_ROAD_CONFIG_upv_1.eagleCarrySeconds then
            a1.eagleState = "none"
            v51 = a1.listener.onEagleCarryDone
            if v51 ~= nil then
                v51(a1.score)
            end
        else
            return nil
        end
    else
        local v52 = nil
        if a1.eagleTimer >= CROSSY_ROAD_CONFIG_upv_1.eagleSwoopSeconds then
            a1.eagleState = "carry"
            a1.eagleTimer = 0
            v52 = a1.listener.onEagleGrab
            if v52 ~= nil then
                v52()
            end
        end
        return nil
    end
end
u8.collectCoin = function(a1)
    --[[
      name: collectCoin
      line: 1052
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v53 = nil
    if not a1.hopping then
        v53 = a1:laneAtRow(a1.row)
        if v53 ~= nil and v53.coinActive then
            local v54 = nil
            if CROSSY_ROAD_CONFIG_upv_1.coinCollectRadius >= math.abs((((v53.coinLogIndex < 0) and (v53.coinColumn * CROSSY_ROAD_CONFIG_upv_1.cellWidth)) or (v53.positions[v53.coinLogIndex + 1])) - ((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX)) then
                v53.coinActive = false
                a1.coinsCollected = a1.coinsCollected + 1
                v54 = a1.listener.onCoinCollected
                if v54 ~= nil then
                    v54(v53, a1.coinsCollected)
                end
                return
            end
            return nil
        end
    end
    return nil
end
u8.overlapsMover = function(a1, a2)
    --[[
      name: overlapsMover
      line: 1072
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v55 = 0
    local v56 = false
    while true do
        if v56 then
            v55 = v55 + 1
        else
            v56 = true
        end
        if v55 >= a2.moverCount then
            return false
        end
        if math.abs(a2.positions[v55 + 1] - ((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX)) <= (a2.moverLength / 2) + CROSSY_ROAD_CONFIG_upv_1.playerHalf then
            break
        end
    end
    return true
end
u8.overlapsTrain = function(a1, a2)
    --[[
      name: overlapsTrain
      line: 1094
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v57 = math.abs(a2.trainX - ((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX)) <= (CROSSY_ROAD_CONFIG_upv_1.trainLength / 2) + CROSSY_ROAD_CONFIG_upv_1.playerHalf
    return v57
end
u8.isOverLog = function(a1, a2)
    --[[
      name: isOverLog
      line: 1098
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v58 = 0
    local v59 = false
    while true do
        if v59 then
            v58 = v58 + 1
        else
            v59 = true
        end
        if v58 >= a2.moverCount then
            return false
        end
        if math.abs(a2.positions[v58 + 1] - ((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX)) <= a2.moverLength / 2 then
            break
        end
    end
    return true
end
u8.isNearLog = function(a1, a2, a3)
    --[[
      name: isNearLog
      line: 1120
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v60 = 0
    local v61 = false
    while true do
        if v61 then
            v60 = v60 + 1
        else
            v61 = true
        end
        if v60 >= a2.moverCount then
            return false
        end
        if math.abs(a2.positions[v60 + 1] - a3) <= (a2.moverLength / 2) + CROSSY_ROAD_CONFIG_upv_1.logLandingAssist then
            break
        end
    end
    return true
end
u8.tryLogGrab = function(a1, a2, a3)
    --[[
      name: tryLogGrab
      line: 1141
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a3 == nil then
        a3 = CROSSY_ROAD_CONFIG_upv_1.logLandingAssist
    end
    local v62 = a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth + a1.driftX
    local v63 = a2.moverLength / 2
    local v64 = -1
    local v65 = 0
    local v66 = false
    local v67
    v67 = a3
    if v66 then
        v65 = v65 + 1
    else
        v66 = true
    end
    local v68 = nil
    if v65 < a2.moverCount then
        v68 = math.abs(a2.positions[v65 + 1] - v62) - v63
        if v68 <= v67 then
            v64, v67 = v65, v68
        end
        if v66 then
            v65 = v65 + 1
        else
            v66 = true
        end
        --[[ goto label_5 ]]--
    end
    if v64 ~= -1 then
        v65 = a2.positions[v64 + 1]
        a1.driftX = (v65 + ((((v65 > v62) and -1) or 1) * (v63 - 0.3))) - (a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth)
        return true
    end
    return false
end
u8.predictMoverX = function(a1, a2, a3, a4)
    --[[
      name: predictMoverX
      line: 1176
      upvalues:
        u3 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local v69 = ((a2.positions[a3 + 1] + (a2.velocity * a4)) + u3) % u2
    if v69 < 0 then
        v69 = v69 + u2
    end
    return v69 - u3
end
u8.ridingLogIndex = function(a1)
    --[[
      name: ridingLogIndex
      line: 1179
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if not a1.hopping then
        local v70 = nil
        if not a1.onLilyPad then
            v70 = a1:laneAtRow(a1.row)
            if v70 ~= nil and v70.kind == "river" and v70.moverCount ~= 0 then
                local v71 = 0
                local v72 = false
                v72, v71 = v72, v71
                while true do
                    if v72 then
                        v71 = v71 + 1
                    else
                        v72 = true
                    end
                    local v73 = nil
                    if v71 >= v73.moverCount then
                        return -1
                    end
                    if math.abs(v73.positions[v71 + 1] - ((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX)) <= v70.moverLength / 2 then
                        break
                    end
                end
                return v71
            end
        end
    end
    return -1
end
u8.hasTree = function(a1, a2, a3)
    --[[
      name: hasTree
      line: 1208
    ]]
    for _, value_6 in a2.treeColumns do
        if value_6 ~= a3 then
            continue
        end
        return true
    end
    return false
end
u8.hasBlocker = function(a1, a2, a3)
    --[[
      name: hasBlocker
      line: 1216
    ]]
    if a1:hasTree(a2, a3) then
        return true
    end
    for _, value_7 in a2.rockColumns do
        if value_7 ~= a3 then
            continue
        end
        return true
    end
    return false
end
u8.hasPad = function(a1, a2, a3)
    --[[
      name: hasPad
      line: 1227
    ]]
    for _, value_8 in a2.padColumns do
        if value_8 ~= a3 then
            continue
        end
        return true
    end
    return false
end
u8.laneAtRow = function(a1, a2)
    --[[
      name: laneAtRow
      line: 1235
    ]]
    for _, value_9 in a1.lanes do
        if value_9.row ~= a2 then
            continue
        end
        return value_9
    end
    return nil
end
u8.hasSafeForwardHop = function(a1)
    --[[
      name: hasSafeForwardHop
      line: 1243
    ]]
    local v74 = a1:laneAtRow(a1.row + 1)
    if v74 ~= nil then
        local v75 = a1:lateralSpanThisRow()
        local v76 = v75[2]
        local v77 = v75[1]
        local v78 = false
        v78, v77 = v78, v77
        while true do
            if v78 then
                v77 = v77 + 1
            else
                v78 = true
            end
            if v77 > v76 then
                return false
            end
            if a1:forwardCellStandable(v74, v77) then
                break
            end
        end
    end
    return true
end
u8.lateralSpanThisRow = function(a1)
    --[[
      name: lateralSpanThisRow
      line: 1270
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v79 = a1:laneAtRow(a1.row)
    if v79 == nil then
        return {a1.column, a1.column}
    elseif v79.kind == "grass" then
        local column_1 = a1.column
        local column_2 = a1.column
        while true do
            local v80
            if -CROSSY_ROAD_CONFIG_upv_1.columnHalf > column_1 - 1 then
                break
            end
            v80 = a1:hasBlocker(v79, column_1 - 1)
            if v80 then
                break
            else
                column_1 = column_1 - 1
            end
        end
        while column_2 + 1 <= CROSSY_ROAD_CONFIG_upv_1.columnHalf and not a1:hasBlocker(v79, column_2 + 1) do
            column_2 = column_2 + 1
        end
        return {column_1, column_2}
    elseif v79.kind == "river" and v79.moverCount == 0 then
        local column_3 = a1.column
        local column_4 = a1.column
        local column_1
        column_1 = column_3
        while true do
            local v81
            if -CROSSY_ROAD_CONFIG_upv_1.columnHalf > column_3 - 1 then
                break
            end
            v81 = a1:hasPad(v79, column_3 - 1)
            if v81 then
                column_3 = column_3 - 1
                continue
            else
                break
            end
        end
        while column_4 + 1 <= CROSSY_ROAD_CONFIG_upv_1.columnHalf do
            if a1:hasPad(v79, column_4 + 1) then
                column_4 = column_4 + 1
                continue
            else
                break
            end
        end
        return {column_3, column_4}
    else
        return {-CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf}
    end
end
u8.forwardCellStandable = function(a1, a2, a3)
    --[[
      name: forwardCellStandable
      line: 1299
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a3 >= -CROSSY_ROAD_CONFIG_upv_1.columnHalf and CROSSY_ROAD_CONFIG_upv_1.columnHalf >= a3 then
        if a2.kind ~= "grass" then
            if a2.kind == "river" and a2.moverCount <= 0 then
                return a1:hasPad(a2, a3)
            end
            return true
        end
        return not a1:hasBlocker(a2, a3)
    end
    return false
end
u8.playerRowContinuous = function(a1)
    --[[
      name: playerRowContinuous
      line: 1314
    ]]
    if a1.hopping then
        local hopFromRow_1 = a1.hopFromRow
        return hopFromRow_1 + ((a1.row - hopFromRow_1) * a1.hopProgress)
    end
    return a1.row
end
u8.playerWorldX = function(a1)
    --[[
      name: playerWorldX
      line: 1320
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1.hopping then
        local v82 = a1.hopFromColumn * CROSSY_ROAD_CONFIG_upv_1.cellWidth + a1.hopFromDrift
        return v82 + ((((a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.hopToDrift) - v82) * a1.hopProgress)
    end
    return (a1.column * CROSSY_ROAD_CONFIG_upv_1.cellWidth) + a1.driftX
end
u8.currentSurfaceY = function(a1)
    --[[
      name: currentSurfaceY
      line: 1328
    ]]
    local v83 = a1:laneAtRow(a1.row)
    if v83 ~= nil and v83.kind == "river" then
        if a1.onLilyPad then
            return 0.8
        end
        return 1.2
    end
    return 0
end
u8.poseY = function(a1)
    --[[
      name: poseY
      line: 1335
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v84 = ((not (a1.hopping)) and 0) or (math.sin(a1.hopProgress * math.pi))
    local v85
    if a1.hopping then
        local _ = a1.hopFromSurfaceY
        v85 = a1.hopFromSurfaceY + (a1.hopToSurfaceY - a1.hopFromSurfaceY) * a1.hopProgress
    else
        v85 = a1:currentSurfaceY()
    end
    return v85 + (v84 * CROSSY_ROAD_CONFIG_upv_1.hopHeight)
end
u8.facingYaw = function(a1)
    --[[
      name: facingYaw
      line: 1340
    ]]
    if a1.facing ~= "forward" then
        if a1.facing ~= "back" then
            if a1.facing ~= "right" then
                return 1.5707963267948966
            end
            return -1.5707963267948966
        end
        return math.pi
    end
    return 0
end
u8.recycleLanes = function(a1)
    --[[
      name: recycleLanes
      line: 1353
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    for _, value_10 in a1.lanes do
        if value_10.row < a1.deathEdgeRow - CROSSY_ROAD_CONFIG_upv_1.recycleBehindRows then
            a1.frontRow = a1.frontRow + 1
            a1:configureLane(value_10, a1.frontRow)
        end
    end
end
u8.configureLane = function(a1, a2, a3)
    --[[
      name: configureLane
      line: 1362
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        nearestSetColumn_upv_1 (copy, index: 2)
    ]]
    a2.row = a3
    a2.trainPhase = "clear"
    a2.trainTimer = 0
    a2.trainX = 0
    a2.trainDir = 1
    a2.blinkTimer = 0
    a2.shakeArmed = false
    a2.moverCount = 0
    a2.velocity = 0
    a2.coinActive = false
    a2.coinLogIndex = -1
    a2.coinColumn = 0
    a2.coinY = 0
    while #a2.positions > 0 do
        local positions_1 = a2.positions
        positions_1[#positions_1] = nil
    end
    while #a2.treeColumns > 0 do
        local treeColumns_1 = a2.treeColumns
        treeColumns_1[#treeColumns_1] = nil
    end
    while #a2.rockColumns > 0 do
        local rockColumns_1 = a2.rockColumns
        rockColumns_1[#rockColumns_1] = nil
    end
    while #a2.padColumns > 0 do
        local padColumns_1 = a2.padColumns
        padColumns_1[#padColumns_1] = nil
    end
    local v86 = a1:pickKind(a3)
    a2.kind = v86
    local reachableColumns_1 = a1.reachableColumns
    local tbl_5 = {}
    tbl_5.logVelocity = a1.lastLogVelocity
    tbl_5.logDrift = a1.logLipColumns
    local routeColumn_1 = a1.routeColumn
    if a3 > CROSSY_ROAD_CONFIG_upv_1.startRow + CROSSY_ROAD_CONFIG_upv_1.safeAheadRows then
        a1:windRoute()
    else
        a1.routeColumn = 0
    end
    a1.routeColumn = nearestSetColumn_upv_1(a1.guaranteedColumns, a1.routeColumn)
    a1.lastLogVelocity = nil
    a1.logLipColumns = 0
    if v86 ~= "river" then
        a1.padGatewayColumn = nil
        a1.consecutivePadRivers = 0
    end
    if v86 == "grass" then
        a1:fillGrass(a2, a3)
    elseif v86 == "road" then
        a1:fillRoad(a2, a3)
    elseif v86 ~= "river" then
        a1:fillRail(a2)
    else
        a1:fillRiver(a2, a3, tbl_5)
    end
    if v86 == "road" or v86 == "rail" then
        a1.clearBankPending = false
    end
    a1:verifyAndRepairLane(a2, reachableColumns_1, routeColumn_1)
    a1:placeLaneCoin(a2, a3)
    if not (a1.replaying) then
        local onLaneConfigured_1 = a1.listener.onLaneConfigured
        if onLaneConfigured_1 == nil then
            return
        end
        onLaneConfigured_1(a2)
    end
end
u8.verifyAndRepairLane = function(a1, a2, a3, a4)
    --[[
      name: verifyAndRepairLane
      line: 1454
      upvalues:
        makeColumnMask_upv_1 (copy, index: 1)
        nearestSetColumn_upv_1 (copy, index: 2)
    ]]
    local v87 = a1:floodReachable(a3, a2, "union")
    local v88 = a1:floodGuaranteed(a3, a2, a4)
    for _, value_11 in v88 do
        local v89
        if value_11 then
            v89 = true
        else
            continue
        end
    end
    if v89 then
        for _, value_12 in v87 do
            local v89
            if value_12 then
                v89 = true
            else
                continue
            end
        end
        if not v89 then
            a1.safeGrassRepairs = a1.safeGrassRepairs + 1
            a1:makeSafeGrass(a2)
            v87 = makeColumnMask_upv_1(true)
            v88 = makeColumnMask_upv_1(true)
            a1.lastLogVelocity = nil
            a1.logLipColumns = 0
            a1.consecutiveSameDirectionLogs = 0
            a1.padGatewayColumn = nil
            a1.consecutivePadRivers = 0
            a1.clearBankPending = false
        end
    else
        a1.safeGrassRepairs = a1.safeGrassRepairs + 1
        a1:makeSafeGrass(a2)
        v87 = makeColumnMask_upv_1(true)
        v88 = makeColumnMask_upv_1(true)
        a1.lastLogVelocity = nil
        a1.logLipColumns = 0
        a1.consecutiveSameDirectionLogs = 0
        a1.padGatewayColumn = nil
        a1.consecutivePadRivers = 0
        a1.clearBankPending = false
    end
    a1.reachableColumns = v87
    a1.guaranteedColumns = v88
    a1.routeColumn = nearestSetColumn_upv_1(v88, a1.routeColumn)
    a2.routeColumn = a1.routeColumn
end
local function makeRunMask_upv_1(a1, a2)
    --[[
      name: makeRunMask
      line: 100
      upvalues:
        makeColumnMask_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v90 = makeColumnMask_upv_1(false)
    local v91 = math.max(a1, -CROSSY_ROAD_CONFIG_upv_1.columnHalf)
    local v92 = false
    while true do
        if v92 then
            v91 = v91 + 1
        else
            v92 = true
        end
        if v91 > math.min(a2, CROSSY_ROAD_CONFIG_upv_1.columnHalf) then
            break
        end
        v90[(v91 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
    end
    return v90
end
u8.floodGuaranteed = function(a1, a2, a3, a4)
    --[[
      name: floodGuaranteed
      line: 1482
      upvalues:
        makeColumnMask_upv_1 (copy, index: 1)
        makeRunMask_upv_1 (copy, index: 2)
    ]]
    local v93 = a1:routeComponent(a2, a4)
    if v93 ~= nil then
        return a1:floodReachable(makeRunMask_upv_1(v93.min, v93.max), a3, "guaranteed")
    end
    return (makeColumnMask_upv_1(false))
end
local function maskComponents_upv_1(a1)
    --[[
      name: maskComponents
      line: 143
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local tbl_6 = {}
    local v94 = nil
    for n_3 = -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf do
        local v95
        v95 = a1[(n_3 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]
        if v95 and v94 == nil then
            v94 = n_3
        end
        if not v95 and v94 ~= nil then
            table.insert(tbl_6, {min = v94, max = n_3 - 1})
            v94 = nil
        end
    end
    if v94 ~= nil then
        table.insert(tbl_6, {min = v94, max = CROSSY_ROAD_CONFIG_upv_1.columnHalf})
    end
    return tbl_6
end
u8.routeComponent = function(a1, a2, a3)
    --[[
      name: routeComponent
      line: 1489
      upvalues:
        maskComponents_upv_1 (copy, index: 1)
    ]]
    local v96 = nil
    local v97 = math.huge
    local v98 = nil
    for _, value_13 in maskComponents_upv_1(a2) do
        v98 = 0
        if a3 >= value_13.min then
            if value_13.max < a3 then
                v98 = a3 - value_13.max
            end
        else
            v98 = value_13.min - a3
        end
        if v98 < v97 then
            v97, v96 = v98, value_13
        end
    end
    return v96
end
u8.floodReachable = function(a1, a2, a3, a4)
    --[[
      name: floodReachable
      line: 1506
      upvalues:
        makeColumnMask_upv_1 (copy, index: 1)
    ]]
    for _, value_14 in a2 do
        local v99
        if value_14 then
            v99 = true
        else
            continue
        end
    end
    if v99 then
        if a3.kind ~= "grass" then
            if a3.kind ~= "river" then
                return (makeColumnMask_upv_1(true))
            end
            return a1:floodRiver(a2, a3, a4)
        end
        return a1:floodGrass(a2, a3)
    end
    return (makeColumnMask_upv_1(false))
end
u8.floodGrass = function(a1, a2, a3)
    --[[
      name: floodGrass
      line: 1520
      upvalues:
        makeColumnMask_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v100 = makeColumnMask_upv_1(false)
    for n_4 = -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf do
        if not (a2[(n_4 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
            continue
        end
        local v101
        v101 = a1:hasBlocker(a3, n_4)
        if not (v101) then
            v100[(n_4 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
        end
    end
    for n_5 = -CROSSY_ROAD_CONFIG_upv_1.columnHalf + 1, CROSSY_ROAD_CONFIG_upv_1.columnHalf do
        if not (v100[((n_5 - 1) + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
            continue
        end
        local v102
        v102 = a1:hasBlocker(a3, n_5)
        if not (v102) then
            v100[(n_5 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
        end
    end
    for n_6 = CROSSY_ROAD_CONFIG_upv_1.columnHalf - 1, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, -1 do
        if not (v100[((n_6 + 1) + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
            continue
        end
        local v103
        v103 = a1:hasBlocker(a3, n_6)
        if not (v103) then
            v100[(n_6 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
        end
    end
    return v100
end
u8.floodRiver = function(a1, a2, a3, a4)
    --[[
      name: floodRiver
      line: 1539
      upvalues:
        makeColumnMask_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v104 = makeColumnMask_upv_1(false)
    if a3.moverCount <= 0 then
        for _, value_15 in a3.padColumns do
            if a2[(value_15 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] then
                v104[(value_15 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
            end
        end
        for _ = 0, #a3.padColumns - 1 do
            for v113, value_16 in a3.padColumns do
                if not (v104[(value_16 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1]) then
                    continue
                end
                if -CROSSY_ROAD_CONFIG_upv_1.columnHalf <= value_16 - 1 and a1:hasPad(a3, value_16 - 1) then
                    v104[((value_16 - 1) + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
                end
                if value_16 + 1 > CROSSY_ROAD_CONFIG_upv_1.columnHalf then
                    continue
                end
                if a1:hasPad(a3, value_16 + 1) then
                    v104[((value_16 + 1) + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
                end
            end
        end
    else
        local v105
        v105 = nil
        for n_7 = -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf do
            if a2[(n_7 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] then
                v105 = n_7
                break
            else
                continue
            end
        end
        local v106
        v106 = nil
        for n_8 = CROSSY_ROAD_CONFIG_upv_1.columnHalf, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, -1 do
            if a2[(n_8 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] then
                v106 = n_8
                break
            else
                continue
            end
        end
        if v105 ~= nil and v106 ~= nil then
            local v107 = a3.velocity > 0
            local v108 = ((a4 ~= "guaranteed") and 0) or (a1.logLipColumns)
            local v109 = (v107 and (v105 + v108)) or (-CROSSY_ROAD_CONFIG_upv_1.columnHalf)
            local v110 = ((not v107) and (v106 - v108)) or (CROSSY_ROAD_CONFIG_upv_1.columnHalf)
            local v111 = math.max(v109, -CROSSY_ROAD_CONFIG_upv_1.columnHalf)
            local v112 = false
            while true do
                if v112 then
                    v111 = v111 + 1
                else
                    v112 = true
                end
                if v111 > math.min(v110, CROSSY_ROAD_CONFIG_upv_1.columnHalf) then
                    break
                end
                v104[(v111 + CROSSY_ROAD_CONFIG_upv_1.columnHalf) + 1] = true
            end
        end
    end
    return v104
end
u8.makeSafeGrass = function(a1, a2)
    --[[
      name: makeSafeGrass
      line: 1591
    ]]
    a2.kind = "grass"
    a2.moverCount = 0
    a2.velocity = 0
    a2.trainPhase = "clear"
    a2.shakeArmed = false
    while #a2.positions > 0 do
        local positions_2 = a2.positions
        positions_2[#positions_2] = nil
    end
    while #a2.treeColumns > 0 do
        local treeColumns_2 = a2.treeColumns
        treeColumns_2[#treeColumns_2] = nil
    end
    while #a2.rockColumns > 0 do
        local rockColumns_2 = a2.rockColumns
        rockColumns_2[#rockColumns_2] = nil
    end
    while #a2.padColumns > 0 do
        local padColumns_2 = a2.padColumns
        padColumns_2[#padColumns_2] = nil
    end
    a2.coinActive = false
    a2.coinLogIndex = -1
    a2.stripStyle = ((a2.row % 2 ~= 0) and "GrassDark") or "GrassLight"
end
u8.pickKind = function(a1, a2)
    --[[
      name: pickKind
      line: 1617
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 > CROSSY_ROAD_CONFIG_upv_1.startRow + CROSSY_ROAD_CONFIG_upv_1.safeAheadRows then
        if a1.runRemaining <= 0 then
            a1:startNewRun(a2)
        end
        a1.runRemaining = a1.runRemaining - 1
        if a1.runKind ~= "grass" then
            a1.hazardRowsSinceGrass = a1.hazardRowsSinceGrass + 1
        else
            a1.hazardRowsSinceGrass = 0
        end
        return a1.runKind
    end
    a1.runKind = "grass"
    a1.runRemaining = 0
    a1.hazardRowsSinceGrass = 0
    a1.grassRunIsForest = false
    return "grass"
end
u8.runLength = function(a1, a2, a3)
    --[[
      name: runLength
      line: 1637
    ]]
    return (math.min(a1.laneRandom:NextInteger(a2, a3), a1.laneRandom:NextInteger(a2, a3)))
end
u8.startNewRun = function(a1, a2)
    --[[
      name: startNewRun
      line: 1640
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v113 = math.clamp((a2 - CROSSY_ROAD_CONFIG_upv_1.startRow) / CROSSY_ROAD_CONFIG_upv_1.rampRows, 0, 1)
    local v114
    if CROSSY_ROAD_CONFIG_upv_1.maxHazardRowsBeforeGrass > a1.hazardRowsSinceGrass then
        local tbl_7 = {}
        tbl_7.grass = 0.36 + (-0.07999999999999996 * v113)
        tbl_7.road = 0.28 + (0.03999999999999998 * v113)
        tbl_7.river = 0.13 + (0.04999999999999999 * v113)
        tbl_7.rail = 0.1 + (0.06 * v113)
        tbl_7[a1.runKind] = 0
        local v115 = 0
        for _, value_17 in tbl_7 do
            v115 = v115 + value_17
        end
        local v116 = a1.laneRandom:NextNumber() * v115
        v114 = "grass"
        for key_1, value_18 in tbl_7 do
            v116 = v116 - value_18
            if v116 <= 0 then
                v114 = key_1
            end
        end
    else
        v114 = "grass"
    end
    a1.runKind = v114
    if v114 == "grass" then
        a1.runRemaining = a1:runLength(CROSSY_ROAD_CONFIG_upv_1.runGrassMin, CROSSY_ROAD_CONFIG_upv_1.runGrassMax)
        local v117 = false
        if CROSSY_ROAD_CONFIG_upv_1.forestMinRun <= a1.runRemaining then
            v117 = a1.laneRandom:NextNumber() < CROSSY_ROAD_CONFIG_upv_1.forestChance
        end
        a1.grassRunIsForest = v117
        v117 = a1.laneRandom:NextNumber() < CROSSY_ROAD_CONFIG_upv_1.sparseForestChance
        a1.forestSparse = v117
    elseif v114 == "road" then
        a1.runRemaining = a1:runLength(CROSSY_ROAD_CONFIG_upv_1.runRoadMin, CROSSY_ROAD_CONFIG_upv_1.runRoadMax)
    elseif v114 ~= "river" then
        a1.runRemaining = a1:runLength(CROSSY_ROAD_CONFIG_upv_1.runRailMin, CROSSY_ROAD_CONFIG_upv_1.runRailMax)
    else
        a1.runRemaining = a1:runLength(CROSSY_ROAD_CONFIG_upv_1.runRiverMin, CROSSY_ROAD_CONFIG_upv_1.runRiverMax)
    end
end
u8.windRoute = function(a1)
    --[[
      name: windRoute
      line: 1691
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.routeColumn = math.clamp(a1.routeColumn + a1.laneRandom:NextInteger(-1, 1), -CROSSY_ROAD_CONFIG_upv_1.columnHalf + 1, CROSSY_ROAD_CONFIG_upv_1.columnHalf - 1)
end
u8.fillGrass = function(a1, a2, a3)
    --[[
      name: fillGrass
      line: 1694
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v118 = a3 <= CROSSY_ROAD_CONFIG_upv_1.startRow + CROSSY_ROAD_CONFIG_upv_1.safeAheadRows
    local clearBankPending_1 = a1.clearBankPending
    a1.clearBankPending = false
    local grassRunIsForest_1 = a1.grassRunIsForest
    if grassRunIsForest_1 and (not v118 and (not clearBankPending_1)) then
        a2.stripStyle = ((a3 % 2 ~= 0) and "ForestDark") or "ForestLight"
    else
        a2.stripStyle = ((a3 % 2 ~= 0) and "GrassDark") or "GrassLight"
    end
    if clearBankPending_1 then
        return nil
    elseif grassRunIsForest_1 then
        a1:fillForestObstacles(a2)
    else
        a1:fillMeadowObstacles(a2)
    end
end
u8.fillMeadowObstacles = function(a1, a2)
    --[[
      name: fillMeadowObstacles
      line: 1715
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local meadowPathRadius_1 = CROSSY_ROAD_CONFIG_upv_1.meadowPathRadius
    local v119 = a1.laneRandom:NextInteger(0, CROSSY_ROAD_CONFIG_upv_1.treesMax)
    local v120 = 0
    local v121 = 0
    while v120 < v119 do
        local v122, v123
        if v121 >= 16 then
            break
        end
        v121 = v121 + 1
        v122 = a1.laneRandom:NextInteger(-CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf)
        if math.abs(v122 - a1.routeColumn) <= meadowPathRadius_1 then
            continue
        end
        v123 = a1:hasBlocker(a2, v122)
        if v123 then
            continue
        end
        if a1.laneRandom:NextNumber() >= CROSSY_ROAD_CONFIG_upv_1.meadowRockChance then
            table.insert(a2.treeColumns, v122)
        else
            table.insert(a2.rockColumns, v122)
        end
        v120 = v120 + 1
    end
end
u8.fillForestObstacles = function(a1, a2)
    --[[
      name: fillForestObstacles
      line: 1739
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v124
    if a1.forestSparse then
        v124 = CROSSY_ROAD_CONFIG_upv_1.sparseForestTreeChance
    else
        v124 = CROSSY_ROAD_CONFIG_upv_1.forestTreeChance
    end
    local v125
    if a1.forestSparse then
        v125 = CROSSY_ROAD_CONFIG_upv_1.sparseForestRockChance
    else
        v125 = CROSSY_ROAD_CONFIG_upv_1.forestRockChance
    end
    for n_9 = -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf do
        if math.abs(n_9 - a1.routeColumn) <= CROSSY_ROAD_CONFIG_upv_1.forestPathRadius then
            continue
        end
        local v126
        if CROSSY_ROAD_CONFIG_upv_1.objectsPerLane <= #a2.treeColumns + #a2.rockColumns then
            break
        end
        v126 = a1.laneRandom:NextNumber()
        if v126 < v124 then
            table.insert(a2.treeColumns, n_9)
            continue
        end
        if v126 < v124 + v125 then
            table.insert(a2.rockColumns, n_9)
        end
    end
end
u8.fillRoad = function(a1, a2, a3)
    --[[
      name: fillRoad
      line: 1761
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a2.stripStyle = ((a3 % 2 ~= 0) and "RoadDark") or "RoadLight"
    local v127 = math.clamp((a3 - CROSSY_ROAD_CONFIG_upv_1.startRow) / CROSSY_ROAD_CONFIG_upv_1.rampRows, 0, 1)
    local v128 = ((a1.laneRandom:NextNumber() >= 0.5) and 1) or -1
    a2.moverLength = CROSSY_ROAD_CONFIG_upv_1.carLength
    local carSpeedVarianceMin_1 = CROSSY_ROAD_CONFIG_upv_1.carSpeedVarianceMin
    local v129 = a1.laneRandom:NextNumber()
    local carSpeedStart_1 = CROSSY_ROAD_CONFIG_upv_1.carSpeedStart
    a2.velocity = (v128 * (carSpeedStart_1 + ((CROSSY_ROAD_CONFIG_upv_1.carSpeedMax - carSpeedStart_1) * v127))) * (carSpeedVarianceMin_1 + ((CROSSY_ROAD_CONFIG_upv_1.carSpeedVarianceMax - carSpeedVarianceMin_1) * v129))
    local carsMinStart_1 = CROSSY_ROAD_CONFIG_upv_1.carsMinStart
    local v130 = math.round(carsMinStart_1 + ((CROSSY_ROAD_CONFIG_upv_1.carsMinLate - carsMinStart_1) * v127))
    local carsMaxStart_1 = CROSSY_ROAD_CONFIG_upv_1.carsMaxStart
    a2.moverCount = a1.laneRandom:NextInteger(v130, math.max(v130, math.round(carsMaxStart_1 + ((CROSSY_ROAD_CONFIG_upv_1.carsMaxLate - carsMaxStart_1) * v127))))
    a1:spreadMovers(a2)
end
u8.fillRiver = function(a1, a2, a3, a4)
    --[[
      name: fillRiver
      line: 1774
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a2.stripStyle = ((a3 % 2 ~= 0) and "RiverDark") or "RiverLight"
    local v131 = a1.laneRandom:NextNumber() < CROSSY_ROAD_CONFIG_upv_1.padRiverChance
    local v132 = true
    if a4.logVelocity ~= nil then
        v132 = a4.logDrift <= CROSSY_ROAD_CONFIG_upv_1.padLogBoardCatch
    end
    if v131 and v132 and a1.consecutivePadRivers < CROSSY_ROAD_CONFIG_upv_1.maxPadRiverRun then
        a1.consecutivePadRivers = a1.consecutivePadRivers + 1
        a1:fillLilyPadRiver(a2, a4)
        return
    end
    a1.consecutivePadRivers = 0
    a1.padGatewayColumn = nil
    a1:fillLogRiver(a2, a3, a4)
end
u8.fillLogRiver = function(a1, a2, a3, a4)
    --[[
      name: fillLogRiver
      line: 1801
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
    ]]
    local v133 = math.clamp((a3 - CROSSY_ROAD_CONFIG_upv_1.startRow) / CROSSY_ROAD_CONFIG_upv_1.rampRows, 0, 1)
    local v134 = ((a1.laneRandom:NextNumber() >= 0.5) and 1) or -1
    if a4.logVelocity ~= nil and CROSSY_ROAD_CONFIG_upv_1.maxSameDirectionLogLanes <= a1.consecutiveSameDirectionLogs and v134 == math.sign(a4.logVelocity) then
        v134 = -v134
    end
    local logLengthStart_1 = CROSSY_ROAD_CONFIG_upv_1.logLengthStart
    local v135 = logLengthStart_1 + (CROSSY_ROAD_CONFIG_upv_1.logLengthMin - logLengthStart_1) * v133
    local logSpeedStart_2 = CROSSY_ROAD_CONFIG_upv_1.logSpeedStart
    local v136 = (logSpeedStart_2 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedMax - logSpeedStart_2) * v133)) * CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMax
    local v137 = CROSSY_ROAD_CONFIG_upv_1.logSpeedStart
    local v138 = math.max(CROSSY_ROAD_CONFIG_upv_1.logInwardFlipMargin, math.max(1, math.ceil(v136 * math.min(math.max((u7 - v135) - (2 * CROSSY_ROAD_CONFIG_upv_1.logLandingAssist), 0) / math.max(v136 + ((v137 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedMax - v137) * v133)) * CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMin), 0.001), CROSSY_ROAD_CONFIG_upv_1.logReachableDwellSeconds) / CROSSY_ROAD_CONFIG_upv_1.cellWidth)))
    local v139 = CROSSY_ROAD_CONFIG_upv_1.columnHalf + CROSSY_ROAD_CONFIG_upv_1.carriedOffMargin / CROSSY_ROAD_CONFIG_upv_1.cellWidth
    local v140 = v139 - a1.routeColumn
    local v141 = v139 + a1.routeColumn
    if v134 <= 0 or v140 >= v138 or v140 >= v141 then
        if v134 < 0 and v141 < v138 and v141 < v140 then
            local v142 = false
            if a4.logVelocity == nil then
                local v143
                v143 = v142
            else
                local v143
                v143 = math.sign(a4.logVelocity) == 1
            end
            v134 = (v143) or 1
        end
    else
        local v143 = false
        if a4.logVelocity ~= nil then
            v143 = math.sign(a4.logVelocity) == -1
        end
        if v143 then
            if v134 < 0 and v141 < v138 and v141 < v140 then
                local v142 = false
                if a4.logVelocity == nil then
                    local v143
                    v143 = v142
                else
                    local v143
                    v143 = math.sign(a4.logVelocity) == 1
                end
                v134 = (v143) or 1
            end
        else
            v134 = -1
        end
    end
    a2.moverLength = v135
    local v144 = CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMin
    local v145 = a1.laneRandom:NextNumber()
    local logSpeedStart_3 = CROSSY_ROAD_CONFIG_upv_1.logSpeedStart
    local v146 = v134 * (logSpeedStart_3 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedMax - logSpeedStart_3) * v133)) * (v144 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMax - v144) * v145))
    local v147 = nil
    if a4.logVelocity == nil then
        v144 = v146
    elseif v134 ~= math.sign(a4.logVelocity) then
        v144 = v146
    else
        v147 = math.abs(a4.logVelocity)
        if math.abs(math.abs(v146) - v147) >= CROSSY_ROAD_CONFIG_upv_1.logMinRelativeSpeed then
            v144 = v146
        else
            v137 = v147 + CROSSY_ROAD_CONFIG_upv_1.logMinRelativeSpeed
            if v137 > CROSSY_ROAD_CONFIG_upv_1.logSpeedMax * CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMax then
                v147 = v147 - CROSSY_ROAD_CONFIG_upv_1.logMinRelativeSpeed
            else
                v147 = v137
            end
            v144 = v134 * v147
        end
    end
    a2.velocity = v144
    a1.lastLogVelocity = v144
    if a4.logVelocity == nil or math.sign(v144) ~= math.sign(a4.logVelocity) then
        v147 = 1
    else
        v147 = a1.consecutiveSameDirectionLogs + 1
    end
    a1.consecutiveSameDirectionLogs = v147
    a2.moverCount = CROSSY_ROAD_CONFIG_upv_1.logsPerLane
    a1:spreadMovers(a2)
    local v149 = math.abs(v144)
    local logSpeedStart_4 = CROSSY_ROAD_CONFIG_upv_1.logSpeedStart
    a1.logLipColumns = math.max(1, math.ceil(v149 * math.min(math.max((u7 - a2.moverLength) - (2 * CROSSY_ROAD_CONFIG_upv_1.logLandingAssist), 0) / math.max(v149 + ((logSpeedStart_4 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedMax - logSpeedStart_4) * v133)) * CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMin), 0.001), CROSSY_ROAD_CONFIG_upv_1.logReachableDwellSeconds) / CROSSY_ROAD_CONFIG_upv_1.cellWidth))
    a1.routeColumn = math.clamp(a1.routeColumn + (math.sign(v144) * a1.logLipColumns), -CROSSY_ROAD_CONFIG_upv_1.columnHalf + 1, CROSSY_ROAD_CONFIG_upv_1.columnHalf - 1)
    a1.clearBankPending = true
end
u8.fillLilyPadRiver = function(a1, a2, a3)
    --[[
      name: fillLilyPadRiver
      line: 1869
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    a2.velocity = 0
    a2.moverCount = 0
    a2.moverLength = 0
    local v150 = a1.padGatewayColumn
    if v150 == nil then
        v150 = a1.routeColumn
    end
    local v151 = math.clamp(v150, -CROSSY_ROAD_CONFIG_upv_1.columnHalf + 1, CROSSY_ROAD_CONFIG_upv_1.columnHalf - 1)
    table.insert(a2.padColumns, v151)
    local v152 = math.clamp(v151 + a1.laneRandom:NextInteger(-1, 1), -CROSSY_ROAD_CONFIG_upv_1.columnHalf + 1, CROSSY_ROAD_CONFIG_upv_1.columnHalf - 1)
    if not (a1:hasPad(a2, v152)) then
        table.insert(a2.padColumns, v152)
    end
    if a3.logVelocity ~= nil then
        local v153 = math.sign(a3.logVelocity)
        local v154, v155 = v151, v151
        for key_2, value_19 in a2.padColumns do
            v154, v155 = math.min(v154, value_19), math.max(v155, value_19)
        end
        v154, v155 = nil, nil
        local v156 = nil
        for _ = 1, CROSSY_ROAD_CONFIG_upv_1.padLogBoardCatch do
            if CROSSY_ROAD_CONFIG_upv_1.padsPerLane <= #a2.padColumns then
                break
            end
            local key_2 = ((v153 <= 0) and (v154 - 1)) or (v155 + 1)
            local value_19 = ((v153 <= 0) and (v155 + 1)) or (v154 - 1)
            if math.abs(key_2) > CROSSY_ROAD_CONFIG_upv_1.columnHalf then
                v156 = value_19
            else
                v156 = key_2
            end
            if CROSSY_ROAD_CONFIG_upv_1.columnHalf < math.abs(v156) then
                break
            end
            if not (a1:hasPad(a2, v156)) then
                table.insert(a2.padColumns, v156)
            end
            v154, v155 = math.min(v154, v156), math.max(v155, v156)
        end
    end
    local v157 = a1.laneRandom:NextInteger(CROSSY_ROAD_CONFIG_upv_1.padExtraMin, CROSSY_ROAD_CONFIG_upv_1.padExtraMax)
    local v158 = 0
    local v159 = 0
    while v158 < v157 and #a2.padColumns < CROSSY_ROAD_CONFIG_upv_1.padsPerLane do
        local v160
        if v159 >= 16 then
            break
        end
        local v161 = v159 + 1
        local v162 = a2.padColumns[a1.laneRandom:NextInteger(0, #a2.padColumns - 1) + 1]
        local v163 = ((a1.laneRandom:NextNumber() >= 0.5) and 1) or -1
        local v164 = math.clamp(v162 + v163, -CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf)
        v160 = a1:hasPad(a2, v164)
        if not (v160) then
            table.insert(a2.padColumns, v164)
            v158 = v158 + 1
        else
            v158 = v160
        end
        v158, v159 = nil, v161
    end
    a1.padGatewayColumn = v152
    a1.routeColumn = v152
    a1.clearBankPending = false
end
u8.fillRail = function(a1, a2)
    --[[
      name: fillRail
      line: 1946
      upvalues:
        deriveSeed_upv_1 (copy, index: 1)
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 2)
    ]]
    a2.stripStyle = "Rail"
    a2.trainPhase = "clear"
    a2.trainRandom = Random.new(deriveSeed_upv_1(a1.seed, 1000 + a2.row))
    a2.trainTimer = a2.trainRandom:NextNumber(CROSSY_ROAD_CONFIG_upv_1.trainClearMin, CROSSY_ROAD_CONFIG_upv_1.trainClearMax)
    a2.trainDir = a2.trainRandom:NextNumber() >= 0.5 and -1 or 1
    a2.trainX = 0
    a2.blinkTimer = 0
    a2.shakeArmed = false
    a1:advanceTrain(a2, a1.boardClock)
end
u8.spreadMovers = function(a1, a2)
    --[[
      name: spreadMovers
      line: 1963
      upvalues:
        u2 (copy, index: 1)
        u3 (copy, index: 2)
    ]]
    local v166 = u2 / a2.moverCount
    local v167 = a1.laneRandom:NextNumber() * v166
    local v168 = 0
    local v169 = false
    if v169 then
        v168 = v168 + 1
    else
        v169 = true
    end
    local v170 = nil
    if v168 < a2.moverCount then
        local positions_3 = a2.positions
        v170 = ((((-u3 + v167) + (v168 * v166)) + (a2.velocity * a1.boardClock)) + u3) % u2
        if v170 < 0 then
            v170 = v170 + u2
        end
        table.insert(positions_3, v170 - u3)
        if v169 then
            v168 = v168 + 1
        else
            v169 = true
        end
    end
end
u8.placeLaneCoin = function(a1, a2, a3)
    --[[
      name: placeLaneCoin
      line: 1985
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a3 > CROSSY_ROAD_CONFIG_upv_1.startRow and CROSSY_ROAD_CONFIG_upv_1.coinChance > a1.laneRandom:NextNumber() then
        if a2.kind ~= "river" then
            local v171 = 0
            while true do
                local v172
                if v171 >= 8 then
                    break
                end
                v171 = v171 + 1
                v172 = a1.laneRandom:NextInteger(-CROSSY_ROAD_CONFIG_upv_1.columnHalf, CROSSY_ROAD_CONFIG_upv_1.columnHalf)
                if a2.kind ~= "grass" or not (a1:hasBlocker(a2, v172)) then
                    a2.coinColumn = v172
                    a2.coinY = 0
                    a2.coinActive = true
                    return
                end
            end
        else
            if a2.moverCount <= 0 then
                if #a2.padColumns > 0 then
                    a2.coinColumn = a2.padColumns[a1.laneRandom:NextInteger(0, #a2.padColumns - 1) + 1]
                    a2.coinY = 0.8
                    a2.coinActive = true
                end
            else
                a2.coinLogIndex = a1.laneRandom:NextInteger(0, a2.moverCount - 1)
                a2.coinY = 1.2
                a2.coinActive = true
            end
            return nil
        end
    else
        return nil
    end
end
local tbl_8 = {}
tbl_8.lerp = function(a1, a2, a3)
    --[[
      name: lerp
      line: 198
    ]]
    return a1 + ((a2 - a1) * a3)
end
tbl_8.logTransferDwellSeconds = function(a1, a2, a3)
    --[[
      name: logTransferDwellSeconds
      line: 220
      upvalues:
        CROSSY_ROAD_CONFIG_upv_1 (copy, index: 1)
        u7 (copy, index: 2)
    ]]
    local logSpeedStart_5 = CROSSY_ROAD_CONFIG_upv_1.logSpeedStart
    return (math.min(math.max((u7 - a2) - (2 * CROSSY_ROAD_CONFIG_upv_1.logLandingAssist), 0) / math.max(a1 + ((logSpeedStart_5 + ((CROSSY_ROAD_CONFIG_upv_1.logSpeedMax - logSpeedStart_5) * a3)) * CROSSY_ROAD_CONFIG_upv_1.logSpeedVarianceMin), 0.001), CROSSY_ROAD_CONFIG_upv_1.logReachableDwellSeconds))
end
tbl_8.makeBoardLane = function()
    --[[
      name: makeBoardLane
      line: 283
    ]]
    local tbl_9 = {}
    tbl_9.positions = {}
    tbl_9.treeColumns = {}
    tbl_9.rockColumns = {}
    tbl_9.padColumns = {}
    tbl_9.trainRandom = Random.new(1)
    return tbl_9
end
tbl_8.FIELD_HALF = u1
tbl_8.MOVER_SPAN = u2
tbl_8.MOVER_WRAP_EDGE = u3
tbl_8.PLAYER_Y = CROSSY_ROAD_CONFIG_upv_1.playerSize / 2
tbl_8.CrossyRoadSim = u8
return tbl_8