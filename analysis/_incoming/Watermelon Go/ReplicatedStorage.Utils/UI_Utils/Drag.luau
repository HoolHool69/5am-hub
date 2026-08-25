-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local UserInputService_upv_1 = game:GetService("UserInputService")
local tbl_upv_1 = {}
tbl_upv_1.__index = tbl_upv_1
function tbl_upv_1.new(a1)
    --[[
      name: new
      line: 15
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local tbl_2 = {}
    tbl_2.Object = a1
    tbl_2.DragStarted = nil
    tbl_2.DragEnded = nil
    tbl_2.Dragged = nil
    tbl_2.Dragging = false
    setmetatable(tbl_2, tbl_upv_1)
    return tbl_2
end
function tbl_upv_1.Enable(a1)
    --[[
      name: Enable
      line: 29
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
    ]]
    local Object_upv_1 = a1.Object
    local u1 = nil
    local Position_upv_1 = nil
    local Position_upv_2 = nil
    local u2 = false
    local function update(a2)
        --[[
          name: update
          line: 39
          upvalues:
            Position_upv_1 (ref,  index: 1)
            Position_upv_2 (ref,  index: 2)
            Object_upv_1 (copy, index: 3)
        ]]
        local v1 = a2.Position - Position_upv_1
        local v2 = UDim2.new(Position_upv_2.X.Scale, Position_upv_2.X.Offset + v1.X, Position_upv_2.Y.Scale, Position_upv_2.Y.Offset + v1.Y)
        Object_upv_1.Position = v2
        return v2
    end
    a1.InputBegan = Object_upv_1.InputBegan:Connect(
        function(a3)
            --[[
              line: 47
              upvalues:
                u2 (ref,  index: 1)
                a1 (copy, index: 2)
            ]]
            if a3.UserInputType == Enum.UserInputType.MouseButton1 or a3.UserInputType == Enum.UserInputType.Touch then
                u2 = true
                local u3 = nil
                local v3 = a3.Changed:Connect(
                    function()
                        --[[
                          line: 53
                          upvalues:
                            a3 (copy, index: 1)
                            a1 (copy, index: 2)
                            u2 (ref,  index: 3)
                            u3 (ref,  index: 4)
                        ]]
                        if a3.UserInputState == Enum.UserInputState.End and ((a1.Dragging) or (u2)) then
                            a1.Dragging = false
                            u3:Disconnect()
                            if a1.DragEnded and not (u2) then
                                a1.DragEnded()
                            end
                            u2 = false
                        end
                    end
                )
                u3 = v3
            end
        end
    )
    a1.InputChanged = Object_upv_1.InputChanged:Connect(
        function(a4)
            --[[
              line: 68
              upvalues:
                u1 (ref, index: 1)
            ]]
            if a4.UserInputType ~= Enum.UserInputType.MouseMovement and a4.UserInputType ~= Enum.UserInputType.Touch then
                return
            end
            u1 = a4
        end
    )
    a1.InputChanged2 = UserInputService_upv_1.InputChanged:Connect(
        function(a5)
            --[[
              line: 74
              upvalues:
                Object_upv_1 (copy, index: 1)
                u2 (ref,  index: 2)
                a1 (copy, index: 3)
                Position_upv_1 (ref,  index: 4)
                Position_upv_2 (ref,  index: 5)
                u1 (ref,  index: 6)
            ]]
            if Object_upv_1.Parent == nil then
                return
            end
            if u2 then
                u2 = false
                if a1.DragStarted then
                    a1.DragStarted()
                end
                a1.Dragging = true
                Position_upv_1 = a5.Position
                Position_upv_2 = Object_upv_1.Position
            end
            if a5 == u1 and a1.Dragging then
                local v4 = a5.Position - Position_upv_1
                local v5 = UDim2.new(Position_upv_2.X.Scale, Position_upv_2.X.Offset + v4.X, Position_upv_2.Y.Scale, Position_upv_2.Y.Offset + v4.Y)
                Object_upv_1.Position = v5
                if a1.Dragged then
                    a1.Dragged(v5)
                end
            end
        end
    )
end
function tbl_upv_1.Disable(a1)
    --[[
      name: Disable
      line: 102
    ]]
    a1.InputBegan:Disconnect()
    a1.InputChanged:Disconnect()
    a1.InputChanged2:Disconnect()
    if not a1.Dragging then
        return
    end
    a1.Dragging = false
    if not a1.DragEnded then
        return
    end
    a1.DragEnded()
end
return tbl_upv_1