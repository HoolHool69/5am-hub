-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 19
    ]]
    return "BoardPicker"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 24
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 28
    ]]
    a1.stage = a2
    a1.spec = a3
end
u1.setSpec = function(a1, a2)
    --[[
      name: setSpec
      line: 32
    ]]
    a1.spec = a2
end
u1.getSpec = function(a1)
    --[[
      name: getSpec
      line: 35
    ]]
    return a1.spec
end
u1.planePointAt = function(a1, a2)
    --[[
      name: planePointAt
      line: 38
    ]]
    local v2 = a1.stage.camera:ScreenPointToRay(a2.X, a2.Y)
    local origin_1 = a1.stage.origin
    local v3 = a1.spec.centerOffset or (Vector2.zero)
    local v4, v5 = nil, nil
    if a1.spec.plane ~= "ground" then
        v4 = v2.Direction.Z
        local v6 = nil
        if math.abs(v4) >= 1e-04 then
            v6 = (origin_1.Z - v2.Origin.Z) / v4
            if v6 >= 0 then
                local v7 = v2.Origin + v2.Direction * v6
                return Vector2.new((v7.X - origin_1.X) - v3.X, -(v7.Y - origin_1.Y) + v3.Y)
            end
        end
    else
        v5 = v2.Direction.Y
        local v8 = nil
        if math.abs(v5) >= 1e-04 then
            v8 = (origin_1.Y - v2.Origin.Y) / v5
            if v8 >= 0 then
                local v9 = v2.Origin + v2.Direction * v8
                return Vector2.new((v9.X - origin_1.X) - v3.X, (v9.Z - origin_1.Z) - v3.Y)
            end
        end
    end
    return nil
end
u1.cellFromPlanePoint = function(a1, a2)
    --[[
      name: cellFromPlanePoint
      line: 70
    ]]
    local spec_1 = a1.spec
    local v10 = spec_1.slopStuds
    if v10 == nil then
        v10 = spec_1.cellPitch * 0.35
    end
    local v11 = spec_1.columns * spec_1.cellPitch / 2
    local v12 = spec_1.rows * spec_1.cellPitch / 2
    if a2.X >= -v11 - v10 and v11 + v10 >= a2.X and a2.Y >= -v12 - v10 and v12 + v10 >= a2.Y then
        local tbl_3 = {}
        tbl_3.column = math.clamp(math.floor((a2.X + v11) / spec_1.cellPitch), 0, spec_1.columns - 1)
        tbl_3.row = math.clamp(math.floor((a2.Y + v12) / spec_1.cellPitch), 0, spec_1.rows - 1)
        return tbl_3
    end
    return nil
end
u1.cellAt = function(a1, a2)
    --[[
      name: cellAt
      line: 89
    ]]
    local v13 = a1:planePointAt(a2)
    if v13 ~= nil then
        return a1:cellFromPlanePoint(v13)
    end
    return nil
end
u1.cellWorld = function(a1, a2, a3)
    --[[
      name: cellWorld
      line: 96
    ]]
    local spec_2 = a1.spec
    local origin_2 = a1.stage.origin
    local v14 = spec_2.centerOffset or (Vector2.zero)
    local v15 = origin_2.X + v14.X + (a2 - ((spec_2.columns - 1) / 2)) * spec_2.cellPitch
    if spec_2.plane ~= "ground" then
        return (Vector3.new(v15, (origin_2.Y + v14.Y) - ((a3 - ((spec_2.rows - 1) / 2)) * spec_2.cellPitch), origin_2.Z))
    end
    return (Vector3.new(v15, origin_2.Y, (origin_2.Z + v14.Y) + ((a3 - ((spec_2.rows - 1) / 2)) * spec_2.cellPitch)))
end
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 151
    ]]
    return "BoardGestures"
end
local u2 = setmetatable(tbl_4, tbl_5)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 156
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v16 = setmetatable({}, u2)
    return v16:constructor(...) or v16
end
u2.constructor = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: constructor
      line: 160
    ]]
    a1.picker = a3
    a1.config = a5
    a1.handlers = a6
    a1.pressActive = false
    a1.pressUpgraded = false
    a1.holdFired = false
    a1.pressStartScreen = Vector2.zero
    a1.pressStartClock = 0
    a4:Add(
        a2.pressBegan:Connect(
            function(a7, a8)
                --[[
                  line: 169
                  upvalues:
                    a1 (copy, index: 1)
                    a3 (copy, index: 2)
                ]]
                if a8 ~= "key" then
                    a1.pressActive = true
                    a1.pressUpgraded = false
                    a1.holdFired = false
                    a1.pressStartScreen = a7
                    a1.pressStartClock = os.clock()
                    a1.pressStartCell = a3:cellAt(a7)
                    a1.currentCell = a1.pressStartCell
                else
                    return nil
                end
            end
        )
    )
    a4:Add(
        a2.drag:Connect(
            function(a9, a10)
                --[[
                  line: 181
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a1.pressActive then
                    local v17, v18 = nil, nil
                    if not (a1.holdFired) then
                        v17 = a1.picker:planePointAt(a10)
                        if v17 ~= nil then
                            v18 = a1.handlers.onPlaneDrag
                            if v18 ~= nil then
                                v18(v17)
                            end
                        end
                        if v17 == nil then
                            v18 = nil
                        else
                            v18 = a1.picker:cellFromPlanePoint(v17)
                        end
                        local v19 = nil
                        if not (a1.pressUpgraded) then
                            local v20 = false
                            if v18 ~= nil then
                                v20 = false
                                if a1.pressStartCell ~= nil then
                                    v20 = true
                                    if v18.column == a1.pressStartCell.column then
                                        v20 = v18.row ~= a1.pressStartCell.row
                                    end
                                end
                            end
                            v19 = a1.config.dragStartPixels
                            if v19 == nil then
                                v19 = 24
                            end
                            local v21
                            if (a10 - a1.pressStartScreen).Magnitude < v19 then
                                v21 = true
                            else
                                v21 = false
                            end
                            if v21 then
                                v21 = not v20
                            end
                            local v22 = nil
                            if v21 then
                                return nil
                            end
                            a1.pressUpgraded = true
                            if a1.pressStartCell ~= nil then
                                v22 = a1.handlers.onPathBegan
                                if v22 ~= nil then
                                    v22(a1.pressStartCell)
                                end
                            end
                        end
                        local v23, v24 = nil, nil
                        if v18 ~= nil then
                            v23 = a1.currentCell
                            if v23 ~= nil and v18.column == v23.column and v18.row == v23.row then
                                return nil
                            else
                                a1.currentCell = v18
                                v24 = a1.handlers.onPathEnter
                                if v24 ~= nil then
                                    v24(v18, v23)
                                end
                            end
                            return
                        end
                        return nil
                    end
                end
                return nil
            end
        )
    )
    a4:Add(
        a2.pressEnded:Connect(
            function(a11, a12, a13)
                --[[
                  line: 230
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a13 ~= "key" then
                    local v25 = nil
                    if a1.pressActive then
                        v25 = a1.pressUpgraded
                        local pressStartCell_1 = a1.pressStartCell
                        local currentCell_1 = a1.currentCell
                        local holdFired_1 = a1.holdFired
                        a1.pressActive = false
                        a1.pressUpgraded = false
                        a1.holdFired = false
                        local v26 = nil
                        if v25 then
                            v26 = a1.handlers.onPathEnded
                            if v26 ~= nil then
                                v26(currentCell_1, true)
                            end
                            return nil
                        else
                            local v27 = nil
                            if holdFired_1 then
                                return nil
                            else
                                v26 = a1.config.tapMaxSeconds
                                if v26 == nil then
                                    v26 = 0.35
                                end
                                local v28
                                if a12 <= v26 then
                                    v28 = true
                                else
                                    v28 = false
                                end
                                if v28 then
                                    v28 = pressStartCell_1 ~= nil
                                end
                                if v28 then
                                    v27 = a1.handlers.onCellTap
                                    if v27 ~= nil then
                                        v27(pressStartCell_1)
                                    end
                                end
                                return
                            end
                        end
                    end
                end
                return nil
            end
        )
    )
end
u2.update = function(a1)
    --[[
      name: update
      line: 268
    ]]
    local v29 = a1.config.holdSeconds
    if v29 == nil then
        v29 = 0
    end
    if v29 > 0 and a1.pressActive and not (a1.pressUpgraded) and not (a1.holdFired) then
        local v30 = nil
        if os.clock() - a1.pressStartClock >= v29 then
            a1.holdFired = true
            if a1.pressStartCell ~= nil then
                v30 = a1.handlers.onCellHold
                if v30 ~= nil then
                    v30(a1.pressStartCell)
                end
            end
            return
        end
        return nil
    end
    return nil
end
u2.cancel = function(a1)
    --[[
      name: cancel
      line: 288
    ]]
    a1.pressActive = false
    a1.pressUpgraded = false
    a1.holdFired = false
    a1.pressStartCell = nil
    a1.currentCell = nil
end
local tbl_6 = {}
tbl_6.boardDirectionForSwipe = function(a1, a2)
    --[[
      name: boardDirectionForSwipe
      line: 115
    ]]
    local v31 = -a2.Z
    local X_1 = a2.X
    local X_2 = a2.X
    local Z_1 = a2.Z
    local v32, v33
    if a1 == "right" then
        v32, v33 = v31, X_1
    elseif a1 == "left" then
        v32, v33 = -v31, -X_1
    elseif a1 ~= "up" then
        v32, v33 = -X_2, -Z_1
    else
        v32, v33 = X_2, Z_1
    end
    local v34 = math.abs(v32)
    if math.abs(v33) > v34 then
        if v33 < 0 then
            return "up"
        end
        return "down"
    elseif v32 < 0 then
        return "left"
    else
        return "right"
    end
end
tbl_6.BoardPicker = u1
tbl_6.BoardGestures = u2
return tbl_6