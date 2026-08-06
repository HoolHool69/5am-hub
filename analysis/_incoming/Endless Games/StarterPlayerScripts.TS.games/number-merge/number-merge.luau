-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local publishCombo_upv_1 = RuntimeLib_upv_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v1.readResume
local writeResume_upv_1 = v1.writeResume
local deriveRandom_upv_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v2 = RuntimeLib_upv_1.import(script, script.Parent, "board-atom")
local numberMergeBoardAtom_upv_1 = v2.numberMergeBoardAtom
local numberMergeControlsAtom_upv_1 = v2.numberMergeControlsAtom
local chainColor_upv_1 = RuntimeLib_upv_1.import(script, script.Parent, "chain-colors").chainColor
local NUMBER_MERGE_CONFIG_upv_1 = RuntimeLib_upv_1.import(script, script.Parent, "number-merge-config").NUMBER_MERGE_CONFIG
local columns_upv_1 = NUMBER_MERGE_CONFIG_upv_1.columns
local rows_upv_1 = NUMBER_MERGE_CONFIG_upv_1.rows
local spawnWeights_upv_1 = NUMBER_MERGE_CONFIG_upv_1.spawnWeights
local milestoneMinValue_upv_1 = NUMBER_MERGE_CONFIG_upv_1.milestoneMinValue
local mergeBasePoints_upv_1 = NUMBER_MERGE_CONFIG_upv_1.mergeBasePoints
local chainMultiplierCap_upv_1 = NUMBER_MERGE_CONFIG_upv_1.chainMultiplierCap
local u1 = math.floor(columns_upv_1 / 2)
local tbl_upv_1 = {}
local tbl_upv_2 = {}
local applyMergeGroup = nil
local chainMultiplierForDepth = nil
local u7 = nil
local wipeTiersBelow = nil
local findTileCell = nil
local boardMaxValue = nil
local equalNeighborCells_upv_1 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 41
    ]]
    return "NumberMergeGame"
end
local u10 = setmetatable(equalNeighborCells_upv_1, tbl_3)
u10.__index = u10
u10.new = function(...)
    --[[
      name: new
      line: 46
      upvalues:
        u10 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u10)
    return v3:constructor(...) or v3
end
local function u2(a1, a2)
    --[[
      name: constructor
      line: 50
      upvalues:
        u2 (ref,  index: 1)
        u1 (copy, index: 2)
    ]]
    a1.context = a2
    a1.columns = u2()
    a1.selectedColumn = u1
    a1.score = 0
    a1.nextId = 1
    a1.resolving = false
    a1.ended = false
    a1.chainDepth = 0
    a1.roundToken = 0
    a1.round = 0
    a1.mergeNonce = 0
    a1.wipeNonce = 0
    a1.milestones = {}
    a1.maxTierReached = 0
    a1.lowestSpawnTier = 0
    a1.random = Random.new()
end
u10.constructor = u2
u10.init = function(a1)
    --[[
      name: init
      line: 68
      upvalues:
        numberMergeBoardAtom_upv_1 (copy, index: 1)
        numberMergeControlsAtom_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        RuntimeLib_upv_1 (copy, index: 4)
    ]]
    a1.context.janitor:Add(
        a1.context.input.swipe:Connect(
            function(a2)
                --[[
                  line: 69
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onSwipe(a2)
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function()
                --[[
                  line: 74
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:requestDrop(a1.selectedColumn)
            end
        )
    )
    a1.context.janitor:Add(
        function()
            --[[
              line: 77
              upvalues:
                numberMergeBoardAtom_upv_1 (copy, index: 1)
                numberMergeControlsAtom_upv_1 (copy, index: 2)
            ]]
            numberMergeBoardAtom_upv_1(
                function()
                    --[[
                      line: 78
                    ]]
                    return nil
                end
            )
            numberMergeControlsAtom_upv_1(
                function()
                    --[[
                      line: 81
                    ]]
                    return nil
                end
            )
        end
    )
    local tbl_upv_4 = {}
    tbl_upv_4.selectColumn = function(a3)
        --[[
          name: selectColumn
          line: 86
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:selectColumn(a3)
    end
    tbl_upv_4.dropIntoColumn = function(a4)
        --[[
          name: dropIntoColumn
          line: 89
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:dropIntoColumn(a4)
    end
    numberMergeControlsAtom_upv_1(
        function()
            --[[
              line: 93
              upvalues:
                tbl_upv_4 (copy, index: 1)
            ]]
            return tbl_upv_4
        end
    )
    a1:resetState()
    a1:publish(tbl_upv_1, 0, nil)
    return RuntimeLib_upv_1.Promise.resolve()
end
u10.start = function(a1)
    --[[
      name: start
      line: 100
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    a1:resetState()
    a1.roundToken = a1.roundToken + 1
    a1.round = a1.round + 1
    a1:publish(tbl_upv_1, 0, nil)
    a1.context.reportScore(0)
end
local function u3(a1)
    --[[
      name: revive
      line: 107
      upvalues:
        u3 (ref,  index: 1)
        NUMBER_MERGE_CONFIG_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
    ]]
    local v4 = u3(a1.columns, NUMBER_MERGE_CONFIG_upv_1.reviveKeptBlocks)
    a1.columns = v4.columns
    a1.resolving = false
    a1.pendingColumn = nil
    a1.ended = false
    a1.chainDepth = 0
    a1.roundToken = a1.roundToken + 1
    if #v4.wiped > 0 then
        a1.context.audio.play("explosion", {})
        a1.context.audio.play("whoosh", {})
        a1.context.audio.play("coinSettle", {})
    end
    a1:publish(tbl_upv_1, 0, nil, v4.wiped)
end
u10.revive = u3
u10.captureResume = function(a1)
    --[[
      name: captureResume
      line: 137
      upvalues:
        writeResume_upv_1 (copy, index: 1)
    ]]
    if not (a1.ended) and not (a1.resolving) then
        return writeResume_upv_1(
            function(a2)
                --[[
                  line: 141
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a2:int(a1.score):int(a1.nextId):int(a1.selectedColumn)
                a2:int(a1.maxTierReached):int(a1.lowestSpawnTier)
                a2:int(a1.queued.id):int(a1.queued.value):int(a1.upcoming.id):int(a1.upcoming.value)
                local v5 = 0
                for _ in a1.milestones do
                    v5 = v5 + 1
                end
                a2:int(v5)
                for key_1 in a1.milestones do
                    a2:int(key_1)
                end
                a2:int(#a1.columns)
                for _, value_1 in a1.columns do
                    a2:int(#value_1)
                    for v6, value_2 in value_1 do
                        a2:int(value_2.id):int(value_2.value)
                    end
                end
            end
        )
    end
    return nil
end
local function u4(a1, a2)
    --[[
      name: restoreResume
      line: 165
      upvalues:
        readResume_upv_1 (copy, index: 1)
        u4 (ref,  index: 2)
        columns_upv_1 (copy, index: 3)
        deriveRandom_upv_1 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
    ]]
    local v6 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 166
              upvalues:
                u4 (ref,  index: 1)
                columns_upv_1 (copy, index: 2)
            ]]
            local tbl_5 = {}
            tbl_5.score = a3:int()
            tbl_5.nextId = a3:int()
            tbl_5.selectedColumn = a3:int()
            tbl_5.maxTierReached = a3:int()
            tbl_5.lowestSpawnTier = a3:int()
            tbl_5.queued = {id = a3:int(), value = u4(a3:int())}
            tbl_5.upcoming = {id = a3:int(), value = u4(a3:int())}
            local v7 = a3:int()
            local tbl_6 = {}
            local v8 = 0
            local tbl_7 = false
            tbl_7, v8 = tbl_7, v8
            while true do
                if tbl_7 then
                    v8 = v8 + 1
                else
                    tbl_7 = true
                end
                if v8 >= v7 then
                    break
                end
                table.insert(tbl_6, (a3:int()))
            end
            v8 = a3:int()
            if v8 ~= columns_upv_1 then
                error("number-merge: column count mismatch")
            end
            tbl_7 = {}
            for _ = 0, v8 - 1 do
                local v9 = a3:int()
                local tbl_8 = {}
                local v10 = 0
                local v11 = false
                v11, v10 = v11, v10
                while true do
                    if v11 then
                        v10 = v10 + 1
                    else
                        v11 = true
                    end
                    if v10 >= v9 then
                        break
                    end
                    table.insert(tbl_8, {id = a3:int(), value = u4(a3:int())})
                end
                table.insert(tbl_7, tbl_8)
            end
            local v12 = table.clone(tbl_5)
            setmetatable(v12, nil)
            v12.milestones = tbl_6
            v12.columns = tbl_7
            return v12
        end
    )
    if v6 ~= nil then
        a1.columns = v6.columns
        a1.score = a2.score
        a1.nextId = v6.nextId
        a1.selectedColumn = math.clamp(v6.selectedColumn, 0, columns_upv_1 - 1)
        a1.maxTierReached = v6.maxTierReached
        a1.lowestSpawnTier = v6.lowestSpawnTier
        a1.queued = v6.queued
        a1.upcoming = v6.upcoming
        a1.milestones = {}
        for _, value_3 in v6.milestones do
            a1.milestones[value_3] = true
        end
        a1.resolving = false
        a1.pendingColumn = nil
        a1.ended = false
        a1.chainDepth = 0
        a1.roundToken = a1.roundToken + 1
        a1.round = a1.round + 1
        a1.random = deriveRandom_upv_1(a1.context.getRunSeed(), a1.nextId + 1)
        a1:publish(tbl_upv_1, 0, nil)
        a1.context.reportScore(a1.score)
        return true
    end
    return false
end
u10.restoreResume = u4
u10.resumeStart = function(a1)
    --[[
      name: resumeStart
      line: 263
    ]]
end
u10.destroy = function(a1)
    --[[
      name: destroy
      line: 265
    ]]
    a1.ended = true
end
u2 = function(a1)
    --[[
      name: resetState
      line: 268
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        u2 (ref,  index: 2)
        u1 (copy, index: 3)
    ]]
    a1.random = deriveRandom_upv_1(a1.context.getRunSeed(), 0)
    a1.columns = u2()
    a1.score = 0
    a1.nextId = 1
    a1.resolving = false
    a1.ended = false
    a1.pendingColumn = nil
    a1.chainDepth = 0
    a1.selectedColumn = u1
    a1.milestones = {}
    a1.maxTierReached = 0
    a1.lowestSpawnTier = 0
    a1.queued = a1:rollQueued()
    a1.upcoming = a1:rollQueued()
end
u10.resetState = u2
u10.selectColumn = function(a1, a2)
    --[[
      name: selectColumn
      line: 286
      upvalues:
        columns_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v13
    if a1.ended then
        return nil
    end
    v13 = math.clamp(a2, 0, columns_upv_1 - 1)
    if v13 ~= a1.selectedColumn then
        a1.selectedColumn = v13
        a1:publish(tbl_upv_1, 0, nil)
    else
        return nil
    end
end
u10.dropIntoColumn = function(a1, a2)
    --[[
      name: dropIntoColumn
      line: 297
      upvalues:
        columns_upv_1 (copy, index: 1)
    ]]
    if a1.ended then
        return nil
    end
    a1.selectedColumn = math.clamp(a2, 0, columns_upv_1 - 1)
    a1:requestDrop(a1.selectedColumn)
end
u10.onSwipe = function(a1, a2)
    --[[
      name: onSwipe
      line: 304
    ]]
    if a1.ended then
        return nil
    elseif a2 == "left" then
        a1:selectColumn(a1.selectedColumn - 1)
    elseif a2 == "right" then
        a1:selectColumn(a1.selectedColumn + 1)
    elseif a2 == "up" then
        a1:requestDrop(a1.selectedColumn)
    end
end
u10.requestDrop = function(a1, a2)
    --[[
      name: requestDrop
      line: 316
    ]]
    if a1.ended then
        return nil
    end
    if a1.resolving then
        a1.pendingColumn = a2
        return nil
    end
    a1:processDrop(a2)
end
local function u5(a1, a2)
    --[[
      name: processDrop
      line: 326
      upvalues:
        u5 (ref,  index: 1)
        tbl_upv_1 (copy, index: 2)
        NUMBER_MERGE_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.columns = u5(a1.columns, a2, a1.queued)
    a1.queued = a1.upcoming
    a1.upcoming = a1:rollQueued()
    a1.context.audio.play("whoosh", {})
    a1.context.audio.play("thud", {})
    a1.resolving = true
    a1.chainDepth = 0
    a1:publish(tbl_upv_1, 0, nil)
    local roundToken_upv_1 = a1.roundToken
    task.delay(
        NUMBER_MERGE_CONFIG_upv_1.stepSeconds,
        function()
            --[[
              line: 344
              upvalues:
                a1 (copy, index: 1)
                roundToken_upv_1 (copy, index: 2)
            ]]
            return a1:resolveStep(roundToken_upv_1)
        end
    )
end
u10.processDrop = u5
local function u6(a1, a2)
    --[[
      name: resolveStep
      line: 348
      upvalues:
        u6 (ref,  index: 1)
        applyMergeGroup (ref,  index: 2)
        chainMultiplierForDepth (ref,  index: 3)
        mergeBasePoints_upv_1 (copy, index: 4)
        milestoneMinValue_upv_1 (copy, index: 5)
        NUMBER_MERGE_CONFIG_upv_1 (copy, index: 6)
        publishCombo_upv_1 (copy, index: 7)
        chainColor_upv_1 (copy, index: 8)
        tbl_upv_2 (copy, index: 9)
        u7 (ref,  index: 10)
        wipeTiersBelow (ref,  index: 11)
        findTileCell (ref,  index: 12)
    ]]
    if not (a1.ended) then
        local v14 = nil
        if a1.roundToken == a2 then
            v14 = u6(a1.columns)
            local v15, v16 = nil, nil
            if v14 ~= nil then
                a1.columns = applyMergeGroup(a1.columns, v14)
                a1.chainDepth = a1.chainDepth + 1
                local v17 = chainMultiplierForDepth(a1.chainDepth)
                local v18 = v17 * (v14.multiplier / 2)
                local v19 = mergeBasePoints_upv_1 * v18
                a1.score = a1.score + v19
                a1.context.reportScore(a1.score)
                local v20
                v20 = nil
                local v21 = milestoneMinValue_upv_1 <= v14.newValue
                if v21 then
                    v21 = a1.milestones[v14.newValue] == nil
                end
                if v21 then
                    a1.milestones[v14.newValue] = true
                    local newValue_1 = v14.newValue
                    a1.context.audio.play("newBestFanfare", {})
                    v20 = newValue_1
                end
                a1.context.audio.play("pop", {pitch = math.clamp(0.95 + (a1.chainDepth * 0.09), 0.95, 1.8)})
                a1.context.audio.play("scorePing", {pitch = math.min(1 + (a1.chainDepth * 0.1), 2)})
                if NUMBER_MERGE_CONFIG_upv_1.chainStampMinDepth <= a1.chainDepth then
                    a1.context.audio.play("perfect", {pitch = math.min(1 + (a1.chainDepth * 0.06), 1.6)})
                end
                if v14.multiplier >= 4 then
                    a1.context.audio.play("coinSettle", {pitch = math.min(1 + (v14.multiplier * 0.05), 1.5)})
                end
                if a1.chainDepth >= 2 then
                    publishCombo_upv_1({count = v17, color = chainColor_upv_1(a1.chainDepth), holdSeconds = NUMBER_MERGE_CONFIG_upv_1.chainBannerHoldSeconds})
                end
                local v22 = tbl_upv_2
                v15 = u7(v14.newValue)
                if a1.maxTierReached < v15 then
                    a1.maxTierReached = v15
                    v16 = math.max(a1.lowestSpawnTier, a1.maxTierReached - NUMBER_MERGE_CONFIG_upv_1.spawnFloorLagTiers)
                    if a1.lowestSpawnTier < v16 then
                        a1.lowestSpawnTier = v16
                        local v23 = wipeTiersBelow(a1.columns, v16)
                        a1.columns = v23.columns
                        v22 = v23.wiped
                        if #v22 > 0 then
                            a1.context.audio.play("whoosh", {})
                            a1.context.audio.play("coinSettle", {})
                        end
                        if u7(a1.queued.value) < v16 then
                            a1.queued = a1:rollQueued()
                        end
                        if u7(a1.upcoming.value) < v16 then
                            a1.upcoming = a1:rollQueued()
                        end
                    end
                end
                v16 = findTileCell(a1.columns, v14.survivorId)
                local tbl_9 = {}
                local v24
                if v16 == nil then
                    v24 = v16
                else
                    v24 = v16.column
                end
                local v25
                if v24 ~= nil then
                    v25 = v24
                else
                    v25 = v14.column
                end
                tbl_9.column = v25
                local v26
                if v16 == nil then
                    v26 = v16
                else
                    v26 = v16.row
                end
                local v27
                if v26 ~= nil then
                    v27 = v26
                else
                    v27 = v14.row
                end
                tbl_9.row = v27
                tbl_9.points = v19
                tbl_9.scoreMultiplier = v18
                a1:publish({tbl_9}, a1.chainDepth, v20, v22)
                local v28
                if #v22 <= 0 then
                    v28 = NUMBER_MERGE_CONFIG_upv_1.stepSeconds
                else
                    v28 = NUMBER_MERGE_CONFIG_upv_1.wipeBeatSeconds
                end
                task.delay(
                    v28,
                    function()
                        --[[
                          line: 476
                          upvalues:
                            a1 (copy, index: 1)
                            a2 (copy, index: 2)
                        ]]
                        return a1:resolveStep(a2)
                    end
                )
                return
            end
            a1:finishResolution(a2)
            return nil
        end
    end
    return nil
end
u10.resolveStep = u6
local function u8(a1, a2)
    --[[
      name: finishResolution
      line: 480
      upvalues:
        u8 (ref,  index: 1)
        rows_upv_1 (copy, index: 2)
        NUMBER_MERGE_CONFIG_upv_1 (copy, index: 3)
    ]]
    a1.resolving = false
    local v29 = nil
    if rows_upv_1 >= u8(a1.columns) then
        v29 = a1.pendingColumn
        a1.pendingColumn = nil
        if v29 ~= nil and not (a1.ended) then
            a1:processDrop(v29)
        end
    else
        a1.ended = true
        a1.context.audio.play("buzz", {})
        local score_upv_1 = a1.score
        task.delay(
            NUMBER_MERGE_CONFIG_upv_1.lossDelaySeconds,
            function()
                --[[
                  line: 489
                  upvalues:
                    a1 (copy, index: 1)
                    a2 (copy, index: 2)
                    score_upv_1 (copy, index: 3)
                ]]
                if a1.roundToken ~= a2 then
                    return
                end
                a1.context.endRun(score_upv_1)
            end
        )
        return nil
    end
end
u10.finishResolution = u8
local function u9(a1)
    --[[
      name: rollQueued
      line: 502
      upvalues:
        u9 (ref, index: 1)
    ]]
    local v30 = a1:pickTier()
    local nextId_1 = a1.nextId
    a1.nextId = a1.nextId + 1
    local tbl_10 = {}
    tbl_10.id = nextId_1
    tbl_10.value = u9(v30)
    return tbl_10
end
u10.rollQueued = u9
u10.pickTier = function(a1)
    --[[
      name: pickTier
      line: 511
      upvalues:
        spawnWeights_upv_1 (copy, index: 1)
    ]]
    local lowestSpawnTier_1 = a1.lowestSpawnTier
    local v31 = a1:allowedMaxTier()
    local v32 = 0
    local v33 = false
    local v34
    v34 = lowestSpawnTier_1
    while true do
        if v33 then
            v34 = v34 + 1
        else
            v33 = true
        end
        if v34 > v31 then
            break
        end
        v32 = v32 + spawnWeights_upv_1[(v34 - lowestSpawnTier_1) + 1]
    end
    v34 = a1.random:NextNumber() * v32
    local v35 = false
    v33 = lowestSpawnTier_1
    while true do
        if v35 then
            v33 = v33 + 1
        else
            v35 = true
        end
        if v33 > v31 then
            return v31
        end
        v34 = v34 - spawnWeights_upv_1[(v33 - lowestSpawnTier_1) + 1]
        if v34 <= 0 then
            break
        end
    end
    return v33
end
u7 = function(a1)
    --[[
      name: allowedMaxTier
      line: 551
      upvalues:
        u7 (ref,  index: 1)
        boardMaxValue (ref,  index: 2)
        NUMBER_MERGE_CONFIG_upv_1 (copy, index: 3)
        spawnWeights_upv_1 (copy, index: 4)
    ]]
    return (math.clamp(u7(boardMaxValue(a1.columns)) - NUMBER_MERGE_CONFIG_upv_1.spawnTierLagTiers, (a1.lowestSpawnTier + NUMBER_MERGE_CONFIG_upv_1.minSpawnTierCount) - 1, (a1.lowestSpawnTier + #spawnWeights_upv_1) - 1))
end
u10.allowedMaxTier = u7
u10.publish = function(a1, a2, a3, a4, a5)
    --[[
      name: publish
      line: 555
      upvalues:
        tbl_upv_2 (copy, index: 1)
        numberMergeBoardAtom_upv_1 (copy, index: 2)
    ]]
    if a5 == nil then
        a5 = tbl_upv_2
    end
    local tbl_upv_11 = {}
    for n_1 = 0, #a1.columns - 1 do
        local v36 = a1.columns[n_1 + 1]
        for n_2 = 0, #v36 - 1 do
            local v37 = v36[n_2 + 1]
            table.insert(tbl_upv_11, {id = v37.id, value = v37.value, column = n_1, row = n_2})
        end
    end
    table.sort(
        tbl_upv_11,
        function(a6, a7)
            --[[
              line: 574
            ]]
            return a6.id < a7.id
        end
    )
    if #a2 > 0 then
        a1.mergeNonce = a1.mergeNonce + 1
    end
    if #a5 > 0 then
        a1.wipeNonce = a1.wipeNonce + 1
    end
    local mergeNonce_upv_1 = a1.mergeNonce
    local u11
    if a4 == nil then
        u11 = nil
    else
        local tbl_12 = {}
        tbl_12.value = a4
        tbl_12.nonce = mergeNonce_upv_1
        u11 = tbl_12
    end
    numberMergeBoardAtom_upv_1(
        function()
            --[[
              line: 588
              upvalues:
                tbl_upv_11 (copy, index: 1)
                a1 (copy, index: 2)
                a2 (copy, index: 3)
                a3 (copy, index: 4)
                mergeNonce_upv_1 (copy, index: 5)
                a5 (ref,  index: 6)
                u11 (copy, index: 7)
            ]]
            local tbl_13 = {}
            tbl_13.tiles = tbl_upv_11
            tbl_13.queued = a1.queued
            tbl_13.upcoming = a1.upcoming
            tbl_13.selectedColumn = a1.selectedColumn
            tbl_13.score = a1.score
            tbl_13.merges = a2
            tbl_13.chainDepth = a3
            tbl_13.lastMergeNonce = mergeNonce_upv_1
            tbl_13.wiped = a5
            tbl_13.wipeNonce = a1.wipeNonce
            tbl_13.milestone = u11
            tbl_13.round = a1.round
            return tbl_13
        end
    )
end
u4 = function(a1)
    --[[
      name: tileFaceValue
      line: 615
    ]]
    local v38 = math.frexp(a1)
    if a1 < 2 or v38 ~= 0.5 then
        error("number-merge: tile face is not a power of two")
    end
    return a1
end
u2 = function()
    --[[
      name: emptyBoard
      line: 622
      upvalues:
        columns_upv_1 (copy, index: 1)
    ]]
    local tbl_14 = {}
    for _ = 0, columns_upv_1 - 1 do
        table.insert(tbl_14, {})
    end
    return tbl_14
end
chainMultiplierForDepth = function(a1)
    --[[
      name: chainMultiplierForDepth
      line: 630
      upvalues:
        chainMultiplierCap_upv_1 (copy, index: 1)
    ]]
    local v39 = 1
    local v40 = 1
    local v41 = false
    while true do
        if v41 then
            v40 = v40 + 1
        else
            v41 = true
        end
        if v40 >= a1 then
            return v39
        end
        v39 = v39 * 2
        if chainMultiplierCap_upv_1 <= v39 then
            break
        end
    end
    return chainMultiplierCap_upv_1
end
u9 = function(a1)
    --[[
      name: tierValue
      line: 653
    ]]
    local v42 = 2
    local v43 = 0
    local v44 = false
    while true do
        if v44 then
            v43 = v43 + 1
        else
            v44 = true
        end
        if v43 >= a1 then
            break
        end
        v42 = v42 * 2
    end
    return v42
end
u7 = function(a1)
    --[[
      name: tierOfValue
      line: 672
    ]]
    local v45 = 0
    local v46 = 2
    while v46 < a1 do
        v46 = v46 * 2
        v45 = v45 + 1
    end
    return v45
end
u5 = function(a1, a2, a3)
    --[[
      name: dropTile
      line: 681
      upvalues:
        columns_upv_1 (copy, index: 1)
    ]]
    local v47 = math.clamp(a2, 0, columns_upv_1 - 1)
    local tbl_15 = {}
    for n_3 = 0, #a1 - 1 do
        if n_3 ~= v47 then
            table.insert(tbl_15, a1[n_3 + 1])
            continue
        end
        local tbl_16 = {}
        for _, value_4 in a1[n_3 + 1] do
            table.insert(tbl_16, value_4)
        end
        table.insert(tbl_16, {id = a3.id, value = a3.value})
        table.insert(tbl_15, tbl_16)
    end
    return tbl_15
end
local function findFirstPair_upv_1(a1)
    --[[
      name: findFirstPair
      line: 709
      upvalues:
        u8 (ref, index: 1)
    ]]
    local v48 = u8(a1)
    local v49 = 0
    local v50 = false
    v50, v49 = v50, v49
    if v50 then
        v49 = v49 + 1
    else
        v50 = true
    end
    if v49 >= v48 then
        v50, v49 = false, 0
        if v50 then
            v49 = v49 + 1
        else
            v50 = true
        end
        if v49 >= v48 then
            return nil
        end
        for n_4 = 0, #a1 - 2 do
            local v51
            v51 = a1[n_4 + 1][v49 + 1]
            local v52
            v52 = a1[n_4 + 2][v49 + 1]
            if v51 == nil or v52 == nil or v51.value ~= v52.value then
                continue
            end
            local tbl_17 = {}
            tbl_17.first = {column = n_4, row = v49}
            tbl_17.second = {column = n_4 + 1, row = v49}
            tbl_17.value = v51.value
            return tbl_17
        end
    else
        for n_5 = 0, #a1 - 1 do
            local v53
            v53 = a1[n_5 + 1][v49 + 1]
            local v54
            v54 = a1[n_5 + 1][v49 + 2]
            if v53 == nil or v54 == nil or v53.value ~= v54.value then
                continue
            end
            local tbl_18 = {}
            tbl_18.first = {column = n_5, row = v49}
            tbl_18.second = {column = n_5, row = v49 + 1}
            tbl_18.value = v53.value
            return tbl_18
        end
    end
end
equalNeighborCells_upv_1 = function(a1, a2, a3)
    --[[
      name: equalNeighborCells
      line: 776
    ]]
    local tbl_19 = {}
    local tbl_20 = {}
    tbl_20.column = a2.column
    tbl_20.row = a2.row - 1
    local tbl_21 = {}
    tbl_21.column = a2.column
    tbl_21.row = a2.row + 1
    local tbl_22 = {}
    tbl_22.column = a2.column - 1
    tbl_22.row = a2.row
    local tbl_23 = {}
    tbl_23.column = a2.column + 1
    tbl_23.row = a2.row
    local v55 = nil
    for _, value_5 in {tbl_20, tbl_21, tbl_22, tbl_23} do
        if value_5.column < 0 or #a1 <= value_5.column or value_5.row < 0 then
            continue
        end
        v55 = a1[value_5.column + 1][value_5.row + 1]
        if v55 == nil then
            continue
        end
        if v55.value == a3 then
            table.insert(tbl_19, value_5)
        end
    end
    return tbl_19
end
u6 = function(a1)
    --[[
      name: findMergeGroup
      line: 809
      upvalues:
        findFirstPair_upv_1 (copy, index: 1)
        equalNeighborCells_upv_1 (copy, index: 2)
    ]]
    local v56 = findFirstPair_upv_1(a1)
    if v56 ~= nil then
        local v57 = equalNeighborCells_upv_1(a1, v56.first, v56.value)
        local v58 = equalNeighborCells_upv_1(a1, v56.second, v56.value)
        local v59 = #v57 < #v58
        local v60
        if v59 then
            v60 = v56.second
        else
            v60 = v56.first
        end
        local v61
        if v59 then
            v61 = v58
        else
            v61 = v57
        end
        local v62 = a1[v60.column + 1][v60.row + 1]
        local tbl_24 = {}
        local value_6 = v56.value
        local v63 = 1
        for _, value_7 in v61 do
            tbl_24[a1[value_7.column + 1][value_7.row + 1].id] = true
            value_6 = value_6 * 2
            v63 = v63 * 2
        end
        local tbl_25 = {}
        tbl_25.survivorId = v62.id
        tbl_25.column = v60.column
        tbl_25.row = v60.row
        tbl_25.absorbedIds = tbl_24
        tbl_25.newValue = value_6
        tbl_25.multiplier = v63
        return tbl_25
    end
    return nil
end
applyMergeGroup = function(a1, a2)
    --[[
      name: applyMergeGroup
      line: 839
    ]]
    local tbl_26 = {}
    local tbl_27 = nil
    local v64 = nil
    for _, value_8 in a1 do
        tbl_27 = {}
        for v65, value_9 in value_8 do
            if a2.absorbedIds[value_9.id] ~= nil then
                continue
            end
            if value_9.id ~= a2.survivorId then
                v64 = value_9
            else
                v64 = {}
                v64.id = value_9.id
                v64.value = a2.newValue
            end
            table.insert(tbl_27, v64)
        end
        table.insert(tbl_26, tbl_27)
    end
    return tbl_26
end
findTileCell = function(a1, a2)
    --[[
      name: findTileCell
      line: 859
    ]]
    for n_6 = 0, #a1 - 1 do
        local v65 = a1[n_6 + 1]
        for n_7 = 0, #v65 - 1 do
            if v65[n_7 + 1].id ~= a2 then
                continue
            end
            local tbl_28 = {}
            tbl_28.column = n_6
            tbl_28.row = n_7
            return tbl_28
        end
    end
    return nil
end
wipeTiersBelow = function(a1, a2)
    --[[
      name: wipeTiersBelow
      line: 874
      upvalues:
        u9 (ref, index: 1)
    ]]
    local v66 = u9(a2)
    local tbl_29 = {}
    local tbl_30 = {}
    for n_8 = 0, #a1 - 1 do
        local v67 = a1[n_8 + 1]
        local tbl_31 = {}
        for n_9 = 0, #v67 - 1 do
            local v68
            v68 = v67[n_9 + 1]
            if v68.value >= v66 then
                table.insert(tbl_31, v68)
            else
                table.insert(tbl_29, {column = n_8, row = n_9, value = v68.value})
            end
        end
        table.insert(tbl_30, tbl_31)
        local v68
    end
    local tbl_32 = {}
    tbl_32.columns = tbl_30
    tbl_32.wiped = tbl_29
    return tbl_32
end
u3 = function(a1, a2)
    --[[
      name: keepHighestBlocks
      line: 911
    ]]
    local tbl_33 = {}
    for v69 = 0, #a1 - 1 do
        local tbl_34 = a1[v69 + 1]
        for n_10 = 0, #tbl_34 - 1 do
            table.insert(tbl_33, {tile = tbl_34[n_10 + 1], column = v69, row = n_10})
        end
    end
    table.sort(
        tbl_33,
        function(a3, a4)
            --[[
              line: 925
            ]]
            if a3.tile.value == a4.tile.value then
                if a3.row == a4.row then
                    return a3.column < a4.column
                end
                return a3.row < a4.row
            end
            return a4.tile.value < a3.tile.value
        end
    )
    local tbl_35 = {}
    local v70 = math.min(a2, #tbl_33)
    local tbl_34, v69
    tbl_34, v69 = false, 0
    while true do
        if tbl_34 then
            v69 = v69 + 1
        else
            tbl_34 = true
        end
        if v69 >= v70 then
            break
        end
        tbl_35[tbl_33[v69 + 1].tile.id] = true
    end
    local tbl_36 = {}
    tbl_34 = {}
    for n_11 = 0, #a1 - 1 do
        local v71 = a1[n_11 + 1]
        local tbl_37 = {}
        for n_12 = 0, #v71 - 1 do
            local v72
            v72 = v71[n_12 + 1]
            if tbl_35[v72.id] == nil then
                table.insert(tbl_36, {column = n_11, row = n_12, value = v72.value})
            else
                table.insert(tbl_37, v72)
            end
        end
        table.insert(tbl_34, tbl_37)
        local v72
    end
    local tbl_38 = {}
    tbl_38.columns = tbl_34
    tbl_38.wiped = tbl_36
    return tbl_38
end
u8 = function(a1)
    --[[
      name: tallestColumnHeight
      line: 978
    ]]
    local v73 = 0
    for _, value_10 in a1 do
        v73 = math.max(v73, #value_10)
    end
    return v73
end
boardMaxValue = function(a1)
    --[[
      name: boardMaxValue
      line: 985
    ]]
    local v74 = 2
    for _, value_11 in a1 do
        for v75, value_12 in value_11 do
            v74 = math.max(v74, value_12.value)
        end
    end
    return v74
end
tbl_3 = {}
tbl_3.NumberMergeGame = u10
return tbl_3