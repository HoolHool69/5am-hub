-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local boundaryForIsland_upv_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-biomes").boundaryForIsland
local TINY_WINGS_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-config").TINY_WINGS_CONFIG
local u1 = TINY_WINGS_CONFIG_upv_1.biomeRampValleyY + 8
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 98
    ]]
    return "TinyWingsTerrain"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 103
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 107
    ]]
    a1.pieces = {}
    a1.firstIndex = 0
    a1.count = 0
    a1.queryHint = 0
    a1.random = Random.new()
    a1.lastRiseAmplitude = 6
    a1.nextIsRise = false
    a1.islandIndex = 0
    a1.transitionQueue = {}
    for _ = 0, 55 do
        table.insert(a1.pieces, {})
    end
end
u2.reset = function(a1, a2, a3)
    --[[
      name: reset
      line: 130
    ]]
    a1.random = a2
    a1.firstIndex = 0
    a1.count = 0
    a1.queryHint = 0
    a1.lastRiseAmplitude = 6
    a1.nextIsRise = true
    a1.islandIndex = 0
    table.clear(a1.transitionQueue)
    local v2 = a3 == "curated"
    local v3
    if v2 then
        v3 = 40
    else
        v3 = 26
    end
    local v4 = (v2 and 22) or 14
    local v5 = (v2 and 12) or 6
    a1:appendPiece(-90, v3 - -90, -14, -14, "hill")
    a1:appendPiece(v3, v4, -14, -14 - v5, "hill")
end
u2.ensureCoverage = function(a1, a2)
    --[[
      name: ensureCoverage
      line: 146
    ]]
    local v6 = a1:pieceAt(a1.count - 1)
    while v6.startX + v6.length < a2 do
        a1:generateNext(v6)
        v6 = a1:pieceAt(a1.count - 1)
    end
end
u2.dropBefore = function(a1, a2)
    --[[
      name: dropBefore
      line: 153
    ]]
    while true do
        local v7
        if a1.count <= 1 then
            break
        end
        v7 = a1:pieceAt(0)
        if a2 <= v7.startX + v7.length then
            break
        else
            a1.firstIndex = (a1.firstIndex + 1) % 56
            a1.count = a1.count - 1
            a1.queryHint = math.max(a1.queryHint - 1, 0)
        end
    end
end
u2.heightAt = function(a1, a2)
    --[[
      name: heightAt
      line: 164
    ]]
    local v8 = a1:findPiece(a2)
    return v8.y0 + (((v8.y1 - v8.y0) * (1 - math.cos(math.pi * math.clamp((a2 - v8.startX) / v8.curveLength, 0, 1)))) / 2)
end
u2.slopeAt = function(a1, a2)
    --[[
      name: slopeAt
      line: 169
    ]]
    local v9 = a1:findPiece(a2)
    return ((v9.y1 - v9.y0) * (math.pi / (2 * v9.curveLength))) * math.sin(math.pi * math.clamp((a2 - v9.startX) / v9.curveLength, 0, 1))
end
u2.kindAt = function(a1, a2)
    --[[
      name: kindAt
      line: 174
    ]]
    return a1:findPiece(a2).kind
end
u2.isGapAt = function(a1, a2)
    --[[
      name: isGapAt
      line: 177
    ]]
    local v10 = a1:findPiece(a2).kind == "gap"
    return v10
end
u2.islandIndexAt = function(a1, a2)
    --[[
      name: islandIndexAt
      line: 180
    ]]
    return a1:findPiece(a2).islandIndex
end
u2.pieceInfoAt = function(a1, a2)
    --[[
      name: pieceInfoAt
      line: 183
    ]]
    local v11 = a1:findPiece(a2)
    local tbl_3 = {}
    tbl_3.startX = v11.startX
    tbl_3.endX = v11.startX + v11.length
    tbl_3.y0 = v11.y0
    tbl_3.y1 = v11.y1
    tbl_3.kind = v11.kind
    tbl_3.curveLength = v11.curveLength
    return tbl_3
end
u2.gapEndAfter = function(a1, a2)
    --[[
      name: gapEndAfter
      line: 194
    ]]
    local v12 = math.clamp(a1.queryHint, 0, a1.count - 1)
    while v12 > 0 and a2 < a1:pieceAt(v12).startX do
        v12 = v12 - 1
    end
    while v12 < a1.count - 1 and a1:pieceAt(v12).startX + a1:pieceAt(v12).length <= a2 do
        v12 = v12 + 1
    end
    local v13 = a1:pieceAt(v12)
    while v13.kind == "gap" and v12 < a1.count - 1 do
        v12 = v12 + 1
        v13 = a1:pieceAt(v12)
    end
    if v13.kind ~= "gap" then
        return v13.startX
    end
    return v13.startX + v13.length
end
u2.findPiece = function(a1, a2)
    --[[
      name: findPiece
      line: 209
    ]]
    local v14 = math.clamp(a1.queryHint, 0, a1.count - 1)
    while v14 > 0 and a2 < a1:pieceAt(v14).startX do
        v14 = v14 - 1
    end
    while v14 < a1.count - 1 and a1:pieceAt(v14).startX + a1:pieceAt(v14).length <= a2 do
        v14 = v14 + 1
    end
    a1.queryHint = v14
    return a1:pieceAt(v14)
end
u2.pieceAt = function(a1, a2)
    --[[
      name: pieceAt
      line: 221
    ]]
    return a1.pieces[((a1.firstIndex + a2) % 56) + 1]
end
u2.generateNext = function(a1, a2)
    --[[
      name: generateNext
      line: 224
      upvalues:
        u1 (copy, index: 1)
        boundaryForIsland_upv_1 (copy, index: 2)
        TINY_WINGS_CONFIG_upv_1 (copy, index: 3)
    ]]
    local v15 = a2.startX + a2.length
    local y1_1 = a2.y1
    local v16 = table.remove(a1.transitionQueue, 1)
    if v16 == nil then
        if a1.nextIsRise or u1 > y1_1 then
            local v17 = math.clamp(v15 / 1200, 0, 1)
            local v18, v19 = nil, nil
            if a1.nextIsRise then
                v18 = a1.random:NextNumber()
                local v20 = (v17 * 5) + 4 + a1.random:NextNumber(0, 1) * ((v17 * 3) + 3)
                local v21 = a1.random:NextNumber(1.6, 2) - v17 * 0.3
                if v18 >= 0.15 then
                    if v18 < 0.3 then
                        v21 = 1.1
                        v20 = v20 * 1.15
                    end
                else
                    v20 = v20 * 1.9
                    v21 = a1.random:NextNumber(1.7, 2.1) - v17 * 0.3
                end
                v20 = v20 * math.min(1 + (TINY_WINGS_CONFIG_upv_1.islandAmplitudePerIndex * a1.islandIndex), TINY_WINGS_CONFIG_upv_1.islandAmplitudeMax)
                a1.lastRiseAmplitude = v20
                a1:appendPiece(v15, math.max(v20 * v21, 9), y1_1, y1_1 + v20, "hill")
            else
                v19 = math.clamp(a1.lastRiseAmplitude * a1.random:NextNumber(0.6, 1.6), 2, y1_1 - -26)
                if y1_1 - v19 > -8 then
                    v19 = y1_1 - -8
                end
                local v22 = a1.random:NextNumber(1.6, 2) - v17 * 0.3
                if a1.random:NextNumber() < 0.2 then
                    v22 = v22 * 1.5
                end
                a1:appendPiece(v15, math.max(v19 * v22, 9), y1_1, y1_1 - v19, "hill")
            end
        else
            local v23 = nil
            if boundaryForIsland_upv_1(a1.islandIndex) - TINY_WINGS_CONFIG_upv_1.biomeTransitionLeadStuds > v15 then
                local v17 = math.clamp(v15 / 1200, 0, 1)
                local v18, v19 = nil, nil
                if a1.nextIsRise then
                    v18 = a1.random:NextNumber()
                    local v20 = (v17 * 5) + 4 + a1.random:NextNumber(0, 1) * ((v17 * 3) + 3)
                    local v21 = a1.random:NextNumber(1.6, 2) - v17 * 0.3
                    if v18 >= 0.15 then
                        if v18 < 0.3 then
                            v21 = 1.1
                            v20 = v20 * 1.15
                        end
                    else
                        v20 = v20 * 1.9
                        v21 = a1.random:NextNumber(1.7, 2.1) - v17 * 0.3
                    end
                    v20 = v20 * math.min(1 + (TINY_WINGS_CONFIG_upv_1.islandAmplitudePerIndex * a1.islandIndex), TINY_WINGS_CONFIG_upv_1.islandAmplitudeMax)
                    a1.lastRiseAmplitude = v20
                    a1:appendPiece(v15, math.max(v20 * v21, 9), y1_1, y1_1 + v20, "hill")
                else
                    v19 = math.clamp(a1.lastRiseAmplitude * a1.random:NextNumber(0.6, 1.6), 2, y1_1 - -26)
                    if y1_1 - v19 > -8 then
                        v19 = y1_1 - -8
                    end
                    local v22 = a1.random:NextNumber(1.6, 2) - v17 * 0.3
                    if a1.random:NextNumber() < 0.2 then
                        v22 = v22 * 1.5
                    end
                    a1:appendPiece(v15, math.max(v19 * v22, 9), y1_1, y1_1 - v19, "hill")
                end
            else
                a1:queueTransition(y1_1)
                v23 = table.remove(a1.transitionQueue, 1)
                if v23 ~= nil then
                    a1:appendPiece(v15, v23.length, v23.y0, v23.y1, v23.kind, v23.curveLength, v23.islandIndex)
                end
                return nil
            end
        end
        a1.nextIsRise = not a1.nextIsRise
    else
        a1:appendPiece(v15, v16.length, v16.y0, v16.y1, v16.kind, v16.curveLength, v16.islandIndex)
        return nil
    end
end
u2.queueTransition = function(a1, a2)
    --[[
      name: queueTransition
      line: 277
      upvalues:
        TINY_WINGS_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v24 = a1.islandIndex + 1
    local v25 = math.max((a2 - TINY_WINGS_CONFIG_upv_1.biomeRampValleyY) * TINY_WINGS_CONFIG_upv_1.biomeDiveSlopeFactor, 12)
    table.insert(a1.transitionQueue, {length = v25, y0 = a2, y1 = TINY_WINGS_CONFIG_upv_1.biomeRampValleyY, curveLength = v25, islandIndex = a1.islandIndex})
    table.insert(a1.transitionQueue, {length = TINY_WINGS_CONFIG_upv_1.biomeRampCurveLength * TINY_WINGS_CONFIG_upv_1.biomeRampCutFraction, y0 = TINY_WINGS_CONFIG_upv_1.biomeRampValleyY, y1 = TINY_WINGS_CONFIG_upv_1.biomeRampValleyY + TINY_WINGS_CONFIG_upv_1.biomeRampRise, curveLength = TINY_WINGS_CONFIG_upv_1.biomeRampCurveLength, islandIndex = a1.islandIndex})
    table.insert(a1.transitionQueue, {length = TINY_WINGS_CONFIG_upv_1.biomeGapWidth, y0 = TINY_WINGS_CONFIG_upv_1.biomeGapBedY, y1 = TINY_WINGS_CONFIG_upv_1.biomeGapBedY, curveLength = TINY_WINGS_CONFIG_upv_1.biomeGapWidth, islandIndex = v24})
    table.insert(a1.transitionQueue, {length = TINY_WINGS_CONFIG_upv_1.biomeCliffLength, y0 = TINY_WINGS_CONFIG_upv_1.biomeGapBedY, y1 = TINY_WINGS_CONFIG_upv_1.biomeCliffTopY, curveLength = TINY_WINGS_CONFIG_upv_1.biomeCliffLength, islandIndex = v24})
    a1.islandIndex = v24
    a1.lastRiseAmplitude = TINY_WINGS_CONFIG_upv_1.biomeCliffTopY - TINY_WINGS_CONFIG_upv_1.biomeGapBedY
    a1.nextIsRise = false
end
u2.appendPiece = function(a1, a2, a3, a4, a5, a6, a7, a8)
    --[[
      name: appendPiece
      line: 326
    ]]
    if a1.count == 56 then
        a1.firstIndex = (a1.firstIndex + 1) % 56
        a1.count = a1.count - 1
    end
    local v26 = a1.pieces[((a1.firstIndex + a1.count) % 56) + 1]
    v26.startX = a2
    v26.length = a3
    v26.y0 = a4
    v26.y1 = a5
    v26.kind = a6
    local v27
    if a7 ~= nil then
        v27 = a7
    else
        v27 = a3
    end
    v26.curveLength = v27
    local v28
    if a8 ~= nil then
        v28 = a8
    else
        v28 = a1.islandIndex
    end
    v26.islandIndex = v28
    a1.count = a1.count + 1
end
local tbl_4 = {}
tbl_4.TinyWingsTerrain = u2
return tbl_4