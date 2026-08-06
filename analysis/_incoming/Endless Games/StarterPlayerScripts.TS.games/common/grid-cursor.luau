-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent, "gamepad-input").gamepadInput
local makeSmoothPart_upv_1 = RuntimeLib_1.import(script, script.Parent, "part-factory").makeSmoothPart
local inputDeviceAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "input-device-atom").inputDeviceAtom
local u1 = CFrame.new(0, -1000, 0)
local Gamepad1_upv_1 = Enum.UserInputType.Gamepad1
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 23
    ]]
    return "GridCursor"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 28
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 32
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        UserInputService_upv_1 (copy, index: 3)
        Gamepad1_upv_1 (copy, index: 4)
    ]]
    a1.options = a4
    a1.cell = {}
    a1.visible = true
    a1.movementEnabled = true
    a1.heldDirectionX = 0
    a1.heldDirectionY = 0
    a1.repeatClock = 0
    a1.repeatCount = 0
    local v2 = a4.picker:getSpec()
    a1.highlight = makeSmoothPart_upv_1(a4.container)
    a1.highlight.Size = Vector3.new(v2.cellPitch * 0.96, 0.3, v2.cellPitch * 0.96)
    local highlight_1 = a1.highlight
    highlight_1.Color = a4.color or Color3.fromRGB(255, 216, 102)
    a1.highlight.Transparency = 0.55
    a1.highlight.CFrame = u1
    a3:Add(
        a2.pressBegan:Connect(
            function(a5, a6)
                --[[
                  line: 50
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a6 == "key" and a1:isActive() then
                    a1.options.onActivate(a1.cell)
                else
                    return nil
                end
            end
        )
    )
    if a4.onAltActivate ~= nil then
        a3:Add(
            UserInputService_upv_1.InputBegan:Connect(
                function(a7, a8)
                    --[[
                      line: 57
                      upvalues:
                        Gamepad1_upv_1 (copy, index: 1)
                        a1 (copy, index: 2)
                    ]]
                    if not (a8) and a7.UserInputType == Gamepad1_upv_1 then
                        if a7.KeyCode == Enum.KeyCode.ButtonX then
                            local v4 = nil
                            if a1:isActive() then
                                v4 = a1.options.onAltActivate
                                if v4 ~= nil then
                                    v4(a1.cell)
                                end
                                return
                            end
                        end
                        return nil
                    end
                    return nil
                end
            )
        )
    end
    a3:Add(
        function()
            --[[
              line: 70
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.highlight:Destroy()
        end,
        true
    )
end
u2.isActive = function(a1)
    --[[
      name: isActive
      line: 74
      upvalues:
        inputDeviceAtom_upv_1 (copy, index: 1)
    ]]
    local v5 = a1.visible and (inputDeviceAtom_upv_1() == "gamepad")
    return v5
end
u2.update = function(a1, a2)
    --[[
      name: update
      line: 77
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
    ]]
    if a1:isActive() and a1.movementEnabled then
        local v6 = gamepadInput_upv_1:moveX()
        local v7 = -gamepadInput_upv_1:moveY()
        local v8 = ((math.abs(v6) <= 0.5) and 0) or (math.sign(v6))
        local v9 = ((math.abs(v7) <= 0.5) and 0) or (math.sign(v7))
        if v8 == a1.heldDirectionX and v9 == a1.heldDirectionY then
            if v8 == 0 and v9 == 0 then
                a1:refreshHighlight()
                return nil
            end
            a1.repeatClock = a1.repeatClock + a2
            local v10, v11
            if a1.repeatCount ~= 0 then
                v10 = a1.options.repeatIntervalSeconds
                if v10 == nil then
                    v10 = 0.11
                end
            else
                v10 = a1.options.repeatDelaySeconds
                if v10 == nil then
                    v10 = 0.34
                end
            end
            v11 = v10
            if v11 <= a1.repeatClock then
                a1.repeatClock = 0
                a1.repeatCount = a1.repeatCount + 1
                a1:step(v8, v9)
            end
            a1:refreshHighlight()
            return
        end
        a1.heldDirectionX = v8
        a1.heldDirectionY = v9
        a1.repeatClock = 0
        a1.repeatCount = 0
        if v8 ~= 0 or v9 ~= 0 then
            a1:step(v8, v9)
        end
        a1:refreshHighlight()
        return nil
    end
    a1:refreshHighlight()
    return nil
end
u2.step = function(a1, a2, a3)
    --[[
      name: step
      line: 125
    ]]
    local v12 = a1.options.picker:getSpec()
    local v13 = math.clamp(a1.cell.column + a2, 0, v12.columns - 1)
    local v14 = math.clamp(a1.cell.row + a3, 0, v12.rows - 1)
    if v13 == a1.cell.column and v14 == a1.cell.row then
        return nil
    end
    a1.cell = {column = v13, row = v14}
    local onMoved_1 = a1.options.onMoved
    if onMoved_1 == nil then
        return
    end
    onMoved_1(a1.cell)
end
u2.refreshHighlight = function(a1)
    --[[
      name: refreshHighlight
      line: 141
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v15 = nil
    if a1:isActive() then
        local v16 = a1.options.picker:cellWorld(a1.cell.column, a1.cell.row)
        local v17 = a1.options.picker:getSpec()
        v15 = a1.options.hoverStuds
        if v15 == nil then
            v15 = 0.4
        end
        a1.highlight.CFrame = v17.plane ~= "ground" and CFrame.new(v16 + Vector3.new(0, 0, v15)) * CFrame.Angles(1.5707963267948966, 0, 0) or CFrame.new(v16 + Vector3.new(0, v15, 0))
    else
        a1.highlight.CFrame = u1
        return nil
    end
end
u2.setColor = function(a1, a2)
    --[[
      name: setColor
      line: 165
    ]]
    a1.highlight.Color = a2
end
u2.setCell = function(a1, a2)
    --[[
      name: setCell
      line: 168
    ]]
    local v19 = a1.options.picker:getSpec()
    a1.cell = {column = math.clamp(a2.column, 0, v19.columns - 1), row = math.clamp(a2.row, 0, v19.rows - 1)}
    a1:refreshHighlight()
end
u2.getCell = function(a1)
    --[[
      name: getCell
      line: 176
    ]]
    return a1.cell
end
u2.setMovementEnabled = function(a1, a2)
    --[[
      name: setMovementEnabled
      line: 179
    ]]
    a1.movementEnabled = a2
end
u2.setVisible = function(a1, a2)
    --[[
      name: setVisible
      line: 182
    ]]
    a1.visible = a2
    a1:refreshHighlight()
end
local tbl_3 = {}
tbl_3.GridCursor = u2
return tbl_3