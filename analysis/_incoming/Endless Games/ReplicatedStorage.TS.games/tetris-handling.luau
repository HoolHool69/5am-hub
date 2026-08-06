-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local function clampFrames_1(a1, a2, a3, a4)
    --[[
      name: clampFrames
      line: 78
    ]]
    if type(a1) == "number" and a1 == a1 then
        return (math.clamp(math.round(a1), a2, a3))
    end
    return a4
end
local tbl_2 = {}
tbl_2.sanitizeTetrisHandling = function(a1)
    --[[
      name: sanitizeTetrisHandling
      line: 97
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1, v2, v3, v4 = nil, nil, nil, nil
    if a1 ~= nil then
        local tbl_3 = {}
        v1 = a1.dasFrames
        local dasFrames_1 = tbl_upv_1.dasFrames
        local v5
        if type(v1) == "number" and v1 == v1 then
            v5 = math.clamp(math.round(v1), 1, 20)
        else
            v5 = dasFrames_1
        end
        tbl_3.dasFrames = v5
        v2 = a1.arrFrames
        local arrFrames_1 = tbl_upv_1.arrFrames
        if type(v2) == "number" and v2 == v2 then
            v5 = math.clamp(math.round(v2), 0, 5)
        else
            v5 = arrFrames_1
        end
        tbl_3.arrFrames = v5
        if a1.arrAccel ~= nil then
            v5 = a1.arrAccel == true
        else
            v5 = tbl_upv_1.arrAccel
        end
        tbl_3.arrAccel = v5
        v3 = a1.sdfCellsPerSecond
        local sdfCellsPerSecond_1 = tbl_upv_1.sdfCellsPerSecond
        if type(v3) == "number" and v3 == v3 then
            v5 = math.clamp(math.round(v3), 10, 61)
        else
            v5 = sdfCellsPerSecond_1
        end
        tbl_3.sdfCellsPerSecond = v5
        v4 = a1.dcdFrames
        local dcdFrames_1 = tbl_upv_1.dcdFrames
        if type(v4) == "number" and v4 == v4 then
            v5 = math.clamp(math.round(v4), 0, 4)
        else
            v5 = dcdFrames_1
        end
        tbl_3.dcdFrames = v5
        return tbl_3
    end
    return tbl_upv_1
end
tbl_2.tetrisDasSeconds = function(a1)
    --[[
      name: tetrisDasSeconds
      line: 111
    ]]
    return a1.dasFrames * 0.016666666666666666
end
tbl_2.tetrisArrSeconds = function(a1)
    --[[
      name: tetrisArrSeconds
      line: 114
    ]]
    return a1.arrFrames * 0.016666666666666666
end
tbl_2.tetrisArrMinSeconds = function(a1)
    --[[
      name: tetrisArrMinSeconds
      line: 126
    ]]
    if a1.arrAccel then
        return math.max(a1.arrFrames - 1, 0) * 0.016666666666666666
    end
    return a1.arrFrames * 0.016666666666666666
end
tbl_2.tetrisDcdSeconds = function(a1)
    --[[
      name: tetrisDcdSeconds
      line: 132
    ]]
    return a1.dcdFrames * 0.016666666666666666
end
tbl_2.tetrisSdfIsInstant = function(a1)
    --[[
      name: tetrisSdfIsInstant
      line: 136
    ]]
    return a1.sdfCellsPerSecond >= 61
end
tbl_2.DEFAULT_TETRIS_HANDLING = tbl_upv_1
return tbl_2