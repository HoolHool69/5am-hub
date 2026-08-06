-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local v2 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-style")
local cellPick_upv_1 = v2.cellPick
local cellUnit_upv_1 = v2.cellUnit
local gridFirstCell_upv_1 = v2.gridFirstCell
local layerCell_upv_1 = v2.layerCell
local layerDrawX_upv_1 = v2.layerDrawX
local STICKMAN_HOOK_STYLE_upv_1 = v2.STICKMAN_HOOK_STYLE
local layers_upv_1 = STICKMAN_HOOK_STYLE_upv_1.layers
local depth_upv_1 = STICKMAN_HOOK_STYLE_upv_1.depth
local u1 = CFrame.new(0, -1000, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 38
    ]]
    return "StickmanHookScenery"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 43
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u2)
    return v3:constructor(...) or v3
end
u2.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 47
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        STICKMAN_HOOK_STYLE_upv_1 (copy, index: 2)
        layers_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
    ]]
    a1.piers = {}
    a1.pierCells = {}
    a1.silkStrands = {}
    a1.silkSacs = {}
    a1.bands = {}
    a1.mortars = {}
    a1.bandCells = {}
    a1.nearShafts = {}
    a1.nearRibs = {}
    a1.nearCells = {}
    a1.midGirders = {}
    a1.midCells = {}
    a1.farColumns = {}
    a1.farCells = {}
    a1.originX = a3.X
    a1.originY = a3.Y
    a1.originZ = a3.Z
    a1.backstop = makeSmoothPart_upv_1(a2)
    a1.backstop.Color = STICKMAN_HOOK_STYLE_upv_1.blue.backstop
    a1.backstop.Size = Vector3.new(layers_upv_1.backstopWidth, layers_upv_1.backstopHeight, 1)
    a1.backstop.CFrame = u1
    for _ = 0, layers_upv_1.farSlots - 1 do
        local v4 = makeStagePart_upv_1(a2)
        v4.Color = STICKMAN_HOOK_STYLE_upv_1.blue.farColumn
        v4.Size = Vector3.new(layers_upv_1.farWidths[1], layers_upv_1.farHeight, 1)
        v4.CFrame = u1
        table.insert(a1.farColumns, v4)
        table.insert(a1.farCells, math.huge)
    end
    for _ = 0, (layers_upv_1.midColumnSlots * layers_upv_1.midRowSlots) - 1 do
        local v5 = makeStagePart_upv_1(a2)
        v5.Color = STICKMAN_HOOK_STYLE_upv_1.blue.nearRib
        v5.Size = Vector3.new(layers_upv_1.midLength, layers_upv_1.midThickness, 2.4)
        v5.CFrame = u1
        table.insert(a1.midGirders, v5)
        table.insert(a1.midCells, math.huge)
    end
    for _ = 0, layers_upv_1.nearSlots - 1 do
        local v6 = makeStagePart_upv_1(a2)
        v6.Color = STICKMAN_HOOK_STYLE_upv_1.blue.nearPier
        v6.Size = Vector3.new(7, layers_upv_1.nearHeight, 3)
        v6.CFrame = u1
        table.insert(a1.nearShafts, v6)
        local v7 = makeSmoothPart_upv_1(a2)
        v7.Color = STICKMAN_HOOK_STYLE_upv_1.blue.nearRib
        v7.Size = Vector3.new(2.4, layers_upv_1.nearHeight, 0.4)
        v7.CFrame = u1
        table.insert(a1.nearRibs, v7)
        table.insert(a1.nearCells, math.huge)
    end
    for _ = 0, (layers_upv_1.bandColumnSlots * layers_upv_1.bandRowSlots) - 1 do
        local v8 = makeStagePart_upv_1(a2)
        v8.Color = STICKMAN_HOOK_STYLE_upv_1.blue.wallPierB
        v8.Size = Vector3.new(layers_upv_1.bandLength, layers_upv_1.bandHeights[1], 1.2)
        v8.CFrame = u1
        table.insert(a1.bands, v8)
        local v9 = makeSmoothPart_upv_1(a2)
        v9.Color = STICKMAN_HOOK_STYLE_upv_1.blue.wallMortar
        v9.Size = Vector3.new(layers_upv_1.bandLength, 0.9, 1.2)
        v9.CFrame = u1
        table.insert(a1.mortars, v9)
        table.insert(a1.bandCells, math.huge)
    end
    for _ = 0, layers_upv_1.pierSlots - 1 do
        local v10 = makeStagePart_upv_1(a2)
        v10.Color = STICKMAN_HOOK_STYLE_upv_1.blue.wallPierA
        v10.Size = Vector3.new(layers_upv_1.pierWidths[1], layers_upv_1.pierHeight, 1.2)
        v10.CFrame = u1
        table.insert(a1.piers, v10)
        table.insert(a1.pierCells, math.huge)
        local v11 = makeSmoothPart_upv_1(a2)
        v11.Color = STICKMAN_HOOK_STYLE_upv_1.silk.dressing
        v11.Transparency = STICKMAN_HOOK_STYLE_upv_1.silk.strandTransparency
        v11.Size = Vector3.new(0.1599999964237213, 22, 0.1599999964237213)
        v11.CFrame = u1
        table.insert(a1.silkStrands, v11)
        local v12 = makeSmoothPart_upv_1(a2)
        v12.Color = STICKMAN_HOOK_STYLE_upv_1.silk.dressing
        v12.Transparency = STICKMAN_HOOK_STYLE_upv_1.silk.sacTransparency
        v12.Size = Vector3.new(1.100000023841858, 1.399999976158142, 0.5)
        v12.CFrame = u1
        table.insert(a1.silkSacs, v12)
    end
end
u2.invalidate = function(a1)
    --[[
      name: invalidate
      line: 156
    ]]
    for n_1 = 0, #a1.pierCells - 1 do
        a1.pierCells[n_1 + 1] = math.huge
    end
    for n_2 = 0, #a1.bandCells - 1 do
        a1.bandCells[n_2 + 1] = math.huge
    end
    for n_3 = 0, #a1.nearCells - 1 do
        a1.nearCells[n_3 + 1] = math.huge
    end
    for n_4 = 0, #a1.midCells - 1 do
        a1.midCells[n_4 + 1] = math.huge
    end
    for n_5 = 0, #a1.farCells - 1 do
        a1.farCells[n_5 + 1] = math.huge
    end
end
u2.draw = function(a1, a2, a3)
    --[[
      name: draw
      line: 173
      upvalues:
        depth_upv_1 (copy, index: 1)
    ]]
    a1.backstop.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ + depth_upv_1.backstop)
    a1:drawFar(a2)
    a1:drawMid(a2, a3)
    a1:drawNear(a2)
    a1:drawColonnade(a2, a3)
end
u2.drawFar = function(a1, a2)
    --[[
      name: drawFar
      line: 180
      upvalues:
        layers_upv_1 (copy, index: 1)
        layerCell_upv_1 (copy, index: 2)
        cellPick_upv_1 (copy, index: 3)
        layerDrawX_upv_1 (copy, index: 4)
        depth_upv_1 (copy, index: 5)
    ]]
    local farFactor_1 = layers_upv_1.farFactor
    local farSpacing_1 = layers_upv_1.farSpacing
    for n_6 = 0, layers_upv_1.farSlots - 1 do
        local v13
        v13 = layerCell_upv_1(a2, farFactor_1, farSpacing_1, layers_upv_1.farSlots, n_6)
        local v14 = a1.farColumns[n_6 + 1]
        if a1.farCells[n_6 + 1] ~= v13 then
            a1.farCells[n_6 + 1] = v13
            v14.Size = Vector3.new(layers_upv_1.farWidths[cellPick_upv_1(v13, 0, 11, #layers_upv_1.farWidths) + 1], layers_upv_1.farHeight, 1)
        end
        v14.CFrame = CFrame.new(a1.originX + layerDrawX_upv_1(v13, a2, farFactor_1, farSpacing_1), a1.originY + layers_upv_1.pierCenterY, a1.originZ + depth_upv_1.farColumn)
    end
end
u2.drawMid = function(a1, a2, a3)
    --[[
      name: drawMid
      line: 196
      upvalues:
        layers_upv_1 (copy, index: 1)
        gridFirstCell_upv_1 (copy, index: 2)
        layerCell_upv_1 (copy, index: 3)
        layerDrawX_upv_1 (copy, index: 4)
        depth_upv_1 (copy, index: 5)
    ]]
    local midFactorX_1 = layers_upv_1.midFactorX
    local midSpacingX_1 = layers_upv_1.midSpacingX
    local midColumnSlots_1 = layers_upv_1.midColumnSlots
    local v15 = gridFirstCell_upv_1(a3, layers_upv_1.midSpacingY, layers_upv_1.midRowSlots)
    for n_7 = 0, midColumnSlots_1 - 1 do
        local v16 = layerCell_upv_1(a2, midFactorX_1, midSpacingX_1, midColumnSlots_1, n_7)
        local v17 = layerDrawX_upv_1(v16, a2, midFactorX_1, midSpacingX_1)
        for n_8 = 0, layers_upv_1.midRowSlots - 1 do
            local v18
            v18 = v15 + n_8
            local v19
            v19 = n_7 + n_8 * midColumnSlots_1
            local v20
            v20 = v16 * 100003 + v18
            if a1.midCells[v19 + 1] ~= v20 then
                a1.midCells[v19 + 1] = v20
            end
            a1.midGirders[v19 + 1].CFrame = CFrame.new(a1.originX + v17, (a1.originY + (v18 * layers_upv_1.midSpacingY)) + (layers_upv_1.midSpacingY / 2), a1.originZ + depth_upv_1.midGirder)
        end
    end
end
u2.drawNear = function(a1, a2)
    --[[
      name: drawNear
      line: 216
      upvalues:
        layers_upv_1 (copy, index: 1)
        layerCell_upv_1 (copy, index: 2)
        layerDrawX_upv_1 (copy, index: 3)
        depth_upv_1 (copy, index: 4)
    ]]
    local nearFactor_1 = layers_upv_1.nearFactor
    local nearSpacing_1 = layers_upv_1.nearSpacing
    for n_9 = 0, layers_upv_1.nearSlots - 1 do
        local v21
        v21 = layerCell_upv_1(a2, nearFactor_1, nearSpacing_1, layers_upv_1.nearSlots, n_9)
        if a1.nearCells[n_9 + 1] ~= v21 then
            a1.nearCells[n_9 + 1] = v21
        end
        local v22 = a1.originX + layerDrawX_upv_1(v21, a2, nearFactor_1, nearSpacing_1)
        local v23 = a1.originY + layers_upv_1.pierCenterY
        a1.nearShafts[n_9 + 1].CFrame = CFrame.new(v22, v23, a1.originZ + depth_upv_1.nearShaft)
        a1.nearRibs[n_9 + 1].CFrame = CFrame.new(v22 + 0.3, v23, a1.originZ + depth_upv_1.nearRib)
    end
end
u2.drawColonnade = function(a1, a2, a3)
    --[[
      name: drawColonnade
      line: 232
    ]]
    a1:drawBands(a2, a3)
    a1:drawPiers(a2)
end
u2.drawBands = function(a1, a2, a3)
    --[[
      name: drawBands
      line: 236
      upvalues:
        layers_upv_1 (copy, index: 1)
        gridFirstCell_upv_1 (copy, index: 2)
        cellPick_upv_1 (copy, index: 3)
        STICKMAN_HOOK_STYLE_upv_1 (copy, index: 4)
        depth_upv_1 (copy, index: 5)
    ]]
    local bandColumnSlots_1 = layers_upv_1.bandColumnSlots
    local v24 = gridFirstCell_upv_1(a2, layers_upv_1.bandSpacingX, bandColumnSlots_1)
    local v25 = gridFirstCell_upv_1(a3, layers_upv_1.bandSpacingY, layers_upv_1.bandRowSlots)
    for n_10 = 0, bandColumnSlots_1 - 1 do
        local v26 = v24 + n_10
        for n_11 = 0, layers_upv_1.bandRowSlots - 1 do
            local v27
            v27 = v25 + n_11
            local v28
            v28 = ((v26 % bandColumnSlots_1) + bandColumnSlots_1) % bandColumnSlots_1 + (((v27 % layers_upv_1.bandRowSlots) + layers_upv_1.bandRowSlots) % layers_upv_1.bandRowSlots) * bandColumnSlots_1
            local v29
            v29 = v26 * 100003 + v27
            local v30, v31, v32, v33
            if a1.bandCells[v28 + 1] == v29 then
                continue
            end
            a1.bandCells[v28 + 1] = v29
            v30 = layers_upv_1.bandHeights[cellPick_upv_1(v26, v27, 3, #layers_upv_1.bandHeights) + 1]
            v31 = a1.originX + (v26 * layers_upv_1.bandSpacingX) + layers_upv_1.bandSpacingX / 2
            v32 = a1.originY + (v27 * layers_upv_1.bandSpacingY) + layers_upv_1.bandSpacingY / 2
            v33 = a1.bands[v28 + 1]
            v33.Size = Vector3.new(layers_upv_1.bandLength, v30, 1.2)
            local v34
            if cellPick_upv_1(v26, v27, 4, 2) ~= 0 then
                v34 = STICKMAN_HOOK_STYLE_upv_1.blue.wallPierA
            else
                v34 = STICKMAN_HOOK_STYLE_upv_1.blue.wallPierB
            end
            v33.Color = v34
            v33.CFrame = CFrame.new(v31, v32, a1.originZ + depth_upv_1.band)
            a1.mortars[v28 + 1].CFrame = CFrame.new(v31, (v32 - (v30 / 2)) + 0.1, a1.originZ + depth_upv_1.mortar)
        end
    end
end
u2.drawPiers = function(a1, a2)
    --[[
      name: drawPiers
      line: 264
      upvalues:
        layers_upv_1 (copy, index: 1)
        layerCell_upv_1 (copy, index: 2)
        cellPick_upv_1 (copy, index: 3)
        layerDrawX_upv_1 (copy, index: 4)
        STICKMAN_HOOK_STYLE_upv_1 (copy, index: 5)
        depth_upv_1 (copy, index: 6)
        u1 (copy, index: 7)
        cellUnit_upv_1 (copy, index: 8)
    ]]
    local pierSlots_1 = layers_upv_1.pierSlots
    local pierSpacing_1 = layers_upv_1.pierSpacing
    for n_12 = 0, pierSlots_1 - 1 do
        local v35
        v35 = layerCell_upv_1(a2, 1, pierSpacing_1, pierSlots_1, n_12)
        local v36, v37, v38, v39
        if a1.pierCells[n_12 + 1] == v35 then
            continue
        end
        a1.pierCells[n_12 + 1] = v35
        v36 = layers_upv_1.pierWidths[cellPick_upv_1(v35, 0, 1, #layers_upv_1.pierWidths) + 1]
        v37 = a1.originX + layerDrawX_upv_1(v35, a2, 1, pierSpacing_1)
        v38 = a1.originY + layers_upv_1.pierCenterY
        v39 = a1.piers[n_12 + 1]
        v39.Size = Vector3.new(v36, layers_upv_1.pierHeight, 1.2)
        local v40
        if cellPick_upv_1(v35, 0, 2, 2) ~= 0 then
            v40 = STICKMAN_HOOK_STYLE_upv_1.blue.wallPierB
        else
            v40 = STICKMAN_HOOK_STYLE_upv_1.blue.wallPierA
        end
        v39.Color = v40
        v39.CFrame = CFrame.new(v37, v38, a1.originZ + depth_upv_1.pier)
        local v41 = a1.silkStrands[n_12 + 1]
        local v42 = a1.silkSacs[n_12 + 1]
        if cellPick_upv_1(v35, 0, 7, 3) == 0 then
            local v43 = a1.originY - 10 + cellUnit_upv_1(v35, 0, 8) * 90
            v41.CFrame = CFrame.new((v37 + (v36 / 2)) - 2, v43, a1.originZ + depth_upv_1.silk)
            v42.CFrame = CFrame.new((v37 + (v36 / 2)) - 2, v43 - 11.7, a1.originZ + depth_upv_1.silk)
        else
            v41.CFrame = u1
            v42.CFrame = u1
        end
    end
end
local tbl_3 = {}
tbl_3.StickmanHookScenery = u2
return tbl_3