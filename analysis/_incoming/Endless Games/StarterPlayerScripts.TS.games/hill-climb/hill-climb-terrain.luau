-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local HILL_CLIMB_CONFIG_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "hill-climb-config").HILL_CLIMB_CONFIG
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 22
    ]]
    return "HillClimbTerrain"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 27
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 31
    ]]
    a1.pieces = {}
    a1.firstIndex = 0
    a1.count = 0
    a1.queryHint = 0
    a1.nextIsRise = true
    a1.lastRiseAmplitude = 0
    for _ = 0, 47 do
        table.insert(a1.pieces, {})
    end
end
u1.reset = function(a1, a2)
    --[[
      name: reset
      line: 48
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.random = a2
    a1.firstIndex = 0
    a1.count = 0
    a1.queryHint = 0
    a1.nextIsRise = true
    a1.lastRiseAmplitude = 0
    a1:append(-HILL_CLIMB_CONFIG_upv_1.padStuds, HILL_CLIMB_CONFIG_upv_1.padStuds * 2, 0, 0)
end
u1.ensureCoverage = function(a1, a2)
    --[[
      name: ensureCoverage
      line: 58
    ]]
    local v2 = a1:pieceAt(a1.count - 1)
    while v2.startX + v2.length < a2 do
        a1:generateNext(v2)
        v2 = a1:pieceAt(a1.count - 1)
    end
end
u1.dropBefore = function(a1, a2)
    --[[
      name: dropBefore
      line: 65
    ]]
    while true do
        local v3
        if a1.count <= 1 then
            break
        end
        v3 = a1:pieceAt(0)
        if a2 <= v3.startX + v3.length then
            break
        end
        a1.firstIndex = (a1.firstIndex + 1) % 48
        a1.count = a1.count - 1
        if a1.queryHint > 0 then
            a1.queryHint = a1.queryHint - 1
        end
    end
end
u1.heightAt = function(a1, a2)
    --[[
      name: heightAt
      line: 78
    ]]
    local v4 = a1:findPiece(a2)
    return v4.y0 + (((v4.y1 - v4.y0) * (1 - math.cos(math.pi * math.clamp((a2 - v4.startX) / v4.length, 0, 1)))) / 2)
end
u1.slopeAt = function(a1, a2)
    --[[
      name: slopeAt
      line: 83
    ]]
    local v5 = a1:findPiece(a2)
    return (((v5.y1 - v5.y0) * math.pi) / (2 * v5.length)) * math.sin(math.pi * math.clamp((a2 - v5.startX) / v5.length, 0, 1))
end
u1.pieceAt = function(a1, a2)
    --[[
      name: pieceAt
      line: 88
    ]]
    return a1.pieces[((a1.firstIndex + a2) % 48) + 1]
end
u1.findPiece = function(a1, a2)
    --[[
      name: findPiece
      line: 91
    ]]
    local v6 = math.clamp(a1.queryHint, 0, a1.count - 1)
    while v6 > 0 and a2 < a1:pieceAt(v6).startX do
        v6 = v6 - 1
    end
    while true do
        local v7
        if v6 >= a1.count - 1 then
            break
        end
        v7 = a1:pieceAt(v6)
        if a2 < v7.startX + v7.length then
            break
        else
            v6 = v6 + 1
        end
    end
    a1.queryHint = v6
    return a1:pieceAt(v6)
end
u1.append = function(a1, a2, a3, a4, a5)
    --[[
      name: append
      line: 106
    ]]
    if a1.count == 48 then
        a1.firstIndex = (a1.firstIndex + 1) % 48
        a1.count = a1.count - 1
        if a1.queryHint > 0 then
            a1.queryHint = a1.queryHint - 1
        end
    end
    local v8 = a1.pieces[((a1.firstIndex + a1.count) % 48) + 1]
    v8.startX = a2
    v8.length = a3
    v8.y0 = a4
    v8.y1 = a5
    a1.count = a1.count + 1
end
u1.generateNext = function(a1, a2)
    --[[
      name: generateNext
      line: 123
      upvalues:
        HILL_CLIMB_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v9 = a2.startX + a2.length
    local v10 = math.clamp(v9 / HILL_CLIMB_CONFIG_upv_1.difficultyRampStuds, 0, 1)
    local v11 = a1.random:NextNumber()
    local v12 = a1.random:NextNumber()
    local y1_1 = a2.y1
    if a1.nextIsRise then
        local v13 = HILL_CLIMB_CONFIG_upv_1.amplitudeStart + ((HILL_CLIMB_CONFIG_upv_1.amplitudeMax - HILL_CLIMB_CONFIG_upv_1.amplitudeStart) * v10) * (0.55 + (0.45 * v12))
        a1.lastRiseAmplitude = v13
        a1:append(v9, HILL_CLIMB_CONFIG_upv_1.hillLengthMax - (((HILL_CLIMB_CONFIG_upv_1.hillLengthMax - HILL_CLIMB_CONFIG_upv_1.hillLengthMin) * v10) * v11), y1_1, y1_1 + v13)
    else
        a1:append(v9, HILL_CLIMB_CONFIG_upv_1.hillLengthMin + ((HILL_CLIMB_CONFIG_upv_1.hillLengthMax - HILL_CLIMB_CONFIG_upv_1.hillLengthMin) * v11), y1_1, (math.clamp(y1_1 - (a1.lastRiseAmplitude * (0.75 + (0.5 * v12))), HILL_CLIMB_CONFIG_upv_1.valleyMinY, HILL_CLIMB_CONFIG_upv_1.valleyMaxY)))
    end
    a1.nextIsRise = not a1.nextIsRise
end
local tbl_3 = {}
tbl_3.HillClimbTerrain = u1
return tbl_3