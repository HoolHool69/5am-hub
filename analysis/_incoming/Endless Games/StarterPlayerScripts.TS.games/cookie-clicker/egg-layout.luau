-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {-17.5, -10.5, 10.5, 17.5}
local v1 = math.max((math.abs(tbl_upv_1[#tbl_upv_1]) + 3.9000000000000004) + 1.2, 21) * 2 + 4
local tbl_2 = {}
tbl_2.sceneHalfWidth = function()
    --[[
      name: sceneHalfWidth
      line: 95
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (math.max((math.abs(tbl_upv_1[#tbl_upv_1]) + 3.9000000000000004) + 1.2, 21))
end
tbl_2.contentHalfWidth = function(a1, a2)
    --[[
      name: contentHalfWidth
      line: 113
    ]]
    if a2 then
        return a1 / 2
    end
    return (a1 * 0.75) / 2
end
tbl_2.freeRectCenterX = function(a1, a2)
    --[[
      name: freeRectCenterX
      line: 126
    ]]
    if a2 then
        return 0
    end
    return a1 * 0.125
end
tbl_2.freeRectCenterY = function(a1, a2)
    --[[
      name: freeRectCenterY
      line: 133
    ]]
    if a2 then
        return -a1 * 0.19
    end
    return 0
end
tbl_2.shelfTopY = function(a1)
    --[[
      name: shelfTopY
      line: 140
    ]]
    return (-5.4 + (a1 * 4.5)) + 0.55
end
tbl_2.producerCellX = function(a1)
    --[[
      name: producerCellX
      line: 144
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 >= 4 then
        return (((a1 - 4 >= 4) and 1) or -1) * 14.5
    end
    return tbl_upv_1[a1 + 1]
end
tbl_2.producerCellY = function(a1)
    --[[
      name: producerCellY
      line: 152
    ]]
    if a1 >= 4 then
        return (-5.4 + (((a1 - 4) % 4) * 4.5)) + 0.55
    end
    return -7.300000000000001
end
tbl_2.producerCellZ = function(a1)
    --[[
      name: producerCellZ
      line: 159
    ]]
    if a1 >= 4 then
        return -3.6
    end
    return 3.4
end
tbl_2.propSlotOffsetX = function(a1)
    --[[
      name: propSlotOffsetX
      line: 168
    ]]
    return ((a1 % 4) - 1.5) * 2.6
end
tbl_2.propSlotOffsetZ = function(a1)
    --[[
      name: propSlotOffsetZ
      line: 171
    ]]
    if a1 < 4 then
        return 0.7
    end
    return -1.5
end
tbl_2.eggClearance = function()
    --[[
      name: eggClearance
      line: 181
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = math.huge
    for n_1 = 0, 3 do
        local v3
        if n_1 >= 4 then
            v3 = (((n_1 - 4 >= 4) and 1) or -1) * 14.5
        else
            v3 = tbl_upv_1[n_1 + 1]
        end
        local v4
        v4 = math.abs(v3) - 3.9000000000000004 - 1.2
        if v4 < v2 then
            v2 = v4
        end
    end
    return v2 - 4.32
end
tbl_2.edgeClearance = function(a1, a2)
    --[[
      name: edgeClearance
      line: 197
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v5 = (a2 and (a1 / 2)) or (a1 * 0.75 / 2)
    local v6 = math.max((math.abs(tbl_upv_1[#tbl_upv_1]) + 3.9000000000000004) + 1.2, 21)
    return v5 - (v6 - ((a2 and 0) or (a1 * 0.125)))
end
tbl_2.counterClearance = function(a1)
    --[[
      name: counterClearance
      line: 206
    ]]
    return ((a1 / 2) - (a1 * 0.17)) - 12.15
end
tbl_2.EGG_CENTER_Y = -2
tbl_2.EGG_RADIUS_X = 3.6
tbl_2.EGG_RADIUS_Y = 4.6
tbl_2.EGG_HALF_DEPTH = 3.06
tbl_2.EGG_MAX_HALF_WIDTH = 4.32
tbl_2.FLOOR_TOP_Y = -7.4
tbl_2.NEST_Y = -6.800000000000001
tbl_2.GRASS_BAND_HEIGHT = 3
tbl_2.BRICK_BASE_Y = -3.2
tbl_2.SHELF_COLUMN_X = 14.5
tbl_2.SHELF_WIDTH = 13
tbl_2.SHELF_ROW_COUNT = 4
tbl_2.SHELF_ROW_BASE_Y = -5.4
tbl_2.SHELF_ROW_STEP = 4.5
tbl_2.FLOOR_ROW_Y = -7.300000000000001
tbl_2.FLOOR_ROW_X = tbl_upv_1
tbl_2.PROP_SLOT_SPACING = 2.6
tbl_2.PROP_RANK_HALF_WIDTH = 3.9000000000000004
tbl_2.PROP_HALF_WIDTH = 1.2
tbl_2.PROP_HEIGHT = 3.5
tbl_2.LANDSCAPE_PANEL_WIDTH_FRACTION = 0.25
tbl_2.PORTRAIT_SHEET_HEIGHT_FRACTION = 0.38
tbl_2.COUNTER_HEIGHT_FRACTION = 0.17
tbl_2.FRAME_WIDTH_FLOOR = v1
return tbl_2