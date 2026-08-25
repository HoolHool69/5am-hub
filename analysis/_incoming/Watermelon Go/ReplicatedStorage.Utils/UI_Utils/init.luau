-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local RunService_upv_1 = game:GetService("RunService")
local TweenService_upv_1 = game:GetService("TweenService")
local SpringClass_upv_1 = require(game.ReplicatedStorage.Utils.SpringClass)
local u1 = nil
local u2 = nil
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
local tbl_upv_6 = {}
local tbl_upv_7 = {"MouseLeaveOriginalPosition", "MouseUpOriginalPosition", "PressToShadow", "MouseEnterUpOffset", "MouseEnterGrow", "MouseLeaveOriginalSize", "MouseEnterSpringEffect", "MouseEnterSound", "MouseClickSound", "MouseDownEffect"}
function tbl_upv_1.AddFeedbackFunctions(a1, a2)
    --[[
      name: AddFeedbackFunctions
      line: 76
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_7 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
    ]]
    a1:SetAttribute("OriginalPosition", a1.Position)
    a1:SetAttribute("OriginalSize", a1.Size)
    if not (tbl_upv_2[a1]) then
        tbl_upv_2[a1] = {}
    end
    if a2[1] == "AllFeedbacks" then
        table.remove(a2, 1)
        for _, value_1 in pairs(tbl_upv_7) do
            table.insert(a2, value_1)
        end
    end
    for _, value_2 in pairs(a2) do
        if not (table.find(tbl_upv_7, value_2)) then
            warn(value_2, " - is not a valid feedback function")
        end
        if table.find(tbl_upv_2[a1], value_2) then
            continue
        end
        table.insert(tbl_upv_2[a1], value_2)
        if value_2 == "MouseLeaveOriginalPosition" then
            a1.MouseLeave:Connect(
                function()
                    --[[
                      line: 108
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.OriginalPosition(a1)
                end
            )
            continue
        end
        if value_2 == "MouseUpOriginalPosition" then
            a1.MouseButton1Up:Connect(
                function()
                    --[[
                      line: 115
                      upvalues:
                        tbl_upv_1 (copy, index: 1)
                        a1 (copy, index: 2)
                    ]]
                    tbl_upv_1.OriginalPosition(a1)
                end
            )
            continue
        end
        if value_2 == "PressToShadow" then
            a1.MouseButton1Down:Connect(
                function()
                    --[[
                      line: 120
                      upvalues:
                        tbl_upv_1 (copy, index: 1)
                        a1 (copy, index: 2)
                    ]]
                    tbl_upv_1.PressToShadow(a1)
                end
            )
            continue
        end
        if value_2 == "MouseEnterUpOffset" then
            a1.MouseEnter:Connect(
                function()
                    --[[
                      line: 125
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.OffsetUpwards(a1)
                end
            )
            continue
        end
        if value_2 == "MouseEnterGrow" then
            a1.MouseEnter:Connect(
                function()
                    --[[
                      line: 132
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.ButtonGrow(a1)
                end
            )
            continue
        end
        if value_2 == "MouseLeaveOriginalSize" then
            a1.MouseLeave:Connect(
                function()
                    --[[
                      line: 139
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.OriginalSize(a1)
                end
            )
            continue
        end
        if value_2 == "MouseEnterSound" then
            a1.MouseEnter:Connect(
                function()
                    --[[
                      line: 146
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.MouseEnterSound(a1)
                end
            )
            continue
        end
        if value_2 == "MouseClickSound" then
            a1.Activated:Connect(
                function()
                    --[[
                      line: 153
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.MouseClickSound(a1)
                end
            )
            continue
        end
        if value_2 == "MouseDownEffect" then
            a1.Activated:Connect(
                function()
                    --[[
                      line: 160
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    task.spawn(tbl_upv_1.MouseDownEffect, a1)
                end
            )
            continue
        end
        if value_2 == "MouseEnterSpringEffect" then
            a1.MouseEnter:Connect(
                function()
                    --[[
                      line: 167
                      upvalues:
                        a1 (copy, index: 1)
                        tbl_upv_1 (copy, index: 2)
                    ]]
                    if (a1:GetAttribute("TransitionDebounce")) then
                        return
                    end
                    tbl_upv_1.SpringEffect(a1)
                end
            )
        end
    end
end
function tbl_upv_1.OriginalPosition(a1)
    --[[
      name: OriginalPosition
      line: 178
    ]]
    local v1 = a1:GetAttribute("OriginalPosition")
    if not v1 then
        return
    end
    a1:TweenPosition(v1, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, true)
end
function tbl_upv_1.PressToShadow(a1)
    --[[
      name: PressToShadow
      line: 188
    ]]
    local v2 = a1:FindFirstChildOfClass("ObjectValue")
    local v3 = v2 and (v2.Value)
    if v3 then
        a1:TweenPosition(v3.Position, Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, true)
    else
        warn(a1, "does not have a shadow")
    end
end
function tbl_upv_1.OffsetUpwards(a1)
    --[[
      name: OffsetUpwards
      line: 202
    ]]
    if a1.Position ~= a1:GetAttribute("OriginalPosition") then
        return
    end
    a1:TweenPosition(a1.Position - UDim2.new(0, 0, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, true)
end
function tbl_upv_1.OriginalSize(a1)
    --[[
      name: OriginalSize
      line: 214
    ]]
    if not a1:GetAttribute("OriginalSize") or a1:GetAttribute("TemporaryIgnoreOriginalSize") == true then
        return
    end
    a1:TweenSize(a1:GetAttribute("OriginalSize"), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.05, true)
end
function tbl_upv_1.ButtonGrow(a1)
    --[[
      name: ButtonGrow
      line: 225
    ]]
    if a1.Size ~= a1:GetAttribute("OriginalSize") then
        return
    end
    local v4 = a1:GetAttribute("OriginalSize")
    if a1:GetAttribute("TemporaryIgnoreOriginalSize") == true then
        return
    end
    a1:TweenSize(UDim2.new(v4.X.Scale * 1.05, 0, v4.Y.Scale * 1.05, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.1, true)
end
function tbl_upv_1.MouseDownEffect(a1)
    --[[
      name: MouseDownEffect
      line: 238
    ]]
    local v5 = a1:GetAttribute("OriginalSize")
    if v5 then
        if a1:GetAttribute("TweenAffectActive") then
            return
        end
        a1:SetAttribute("TweenAffectActive", true)
        a1:TweenSize(UDim2.new(v5.X.Scale * 0.9, 0, v5.Y.Scale * 0.9, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
        task.wait(0.1)
        a1:TweenSize(v5, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
        a1:SetAttribute("TweenAffectActive", false)
    else
        print("no original size for button", a1)
    end
end
function tbl_upv_1.MouseEnterSound(a1)
    --[[
      name: MouseEnterSound
      line: 264
      upvalues:
        u1 (ref, index: 1)
    ]]
    if not u1 then
        return
    end
    u1:Play()
end
function tbl_upv_1.MouseClickSound(a1)
    --[[
      name: MouseClickSound
      line: 272
      upvalues:
        u2 (ref, index: 1)
    ]]
    if not u2 then
        return
    end
    u2:Play()
end
function tbl_upv_1.AddGlareEffect(a1, a2, a3)
    --[[
      name: AddGlareEffect
      line: 281
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    if tbl_upv_5[a1] then
        return
    end
    tbl_upv_5[a1] = {a3 or 6, a2 or 2.5, workspace:GetServerTimeNow()}
end
function tbl_upv_1.ClearGlareEffect(a1)
    --[[
      name: ClearGlareEffect
      line: 292
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    if not tbl_upv_5[a1] then
        return
    end
    tbl_upv_5[a1] = nil
end
function tbl_upv_1.AddHoverEffect(a1, a2, a3)
    --[[
      name: AddHoverEffect
      line: 298
      upvalues:
        tbl_upv_6 (copy, index: 1)
        TweenService_upv_1 (copy, index: 2)
    ]]
    if tbl_upv_6[a1] then
        return
    end
    tbl_upv_6[a1] = TweenService_upv_1:Create(a1, TweenInfo.new(a2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, 0), {Position = a1.Position + UDim2.new(0, 0, a3, 0)})
    tbl_upv_6[a1]:Play()
end
function tbl_upv_1.ClearHoverEffect(a1)
    --[[
      name: ClearHoverEffect
      line: 321
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    if not tbl_upv_6[a1] then
        return
    end
    tbl_upv_6[a1]:Cancel()
end
function tbl_upv_1.TweenGradientOffset(a1, a2, a3)
    --[[
      name: TweenGradientOffset
      line: 327
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_8 = {}
    tbl_8.Offset = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), tbl_8):Play()
end
function tbl_upv_1.TweenTextTransparency(a1, a2, a3)
    --[[
      name: TweenTextTransparency
      line: 332
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_9 = {}
    tbl_9.TextTransparency = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), tbl_9):Play()
end
function tbl_upv_1.TweenTransparency(a1, a2, a3)
    --[[
      name: TweenTransparency
      line: 337
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_10 = {}
    tbl_10.Transparency = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), tbl_10):Play()
end
function tbl_upv_1.TweenBackgroundColor(a1, a2, a3, a4, a5, a6)
    --[[
      name: TweenBackgroundColor
      line: 342
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_11 = {}
    tbl_11.BackgroundColor3 = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, a4, a5, a6), tbl_11):Play()
end
function tbl_upv_1.TweenImageColor(a1, a2, a3, a4, a5)
    --[[
      name: TweenImageColor
      line: 347
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_12 = {}
    tbl_12.ImageColor3 = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, a4 or nil, a5 or nil), tbl_12):Play()
end
function tbl_upv_1.TweenBackgroundTransparency(a1, a2, a3)
    --[[
      name: TweenBackgroundTransparency
      line: 352
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_13 = {}
    tbl_13.BackgroundTransparency = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl_13):Play()
end
function tbl_upv_1.TweenImageTransparency(a1, a2, a3)
    --[[
      name: TweenImageTransparency
      line: 357
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    local tbl_14 = {}
    tbl_14.ImageTransparency = a2
    TweenService_upv_1:Create(a1, TweenInfo.new(a3 or 0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl_14):Play()
end
function tbl_upv_1.TweenSize(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: TweenSize
      line: 362
    ]]
    a1:TweenSize(a2, a3, a4, a5, a6, a7)
    a1:SetAttribute("OriginalSize", a2)
end
function tbl_upv_1.TweenPosition(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: TweenPosition
      line: 367
    ]]
    a1:TweenPosition(a2, a3, a4, a5, a6, a7)
    a1:SetAttribute("OriginalPosition", a2)
end
function tbl_upv_1.TweenGUI(a1, a2, a3, a4)
    --[[
      name: TweenGUI
      line: 372
      upvalues:
        TweenService_upv_1 (copy, index: 1)
    ]]
    if a1:IsA("GuiObject") then
        local v6 = TweenService_upv_1:Create(a1, TweenInfo.new(a2, Enum.EasingStyle.Linear), a3)
        v6:Play()
        if a4 ~= true then
            return
        end
        v6.Completed:Wait()
    end
end
function tbl_upv_1.SpringEffect(a1, a2, a3, a4, a5)
    --[[
      name: SpringEffect
      line: 391
      upvalues:
        tbl_upv_4 (copy, index: 1)
        SpringClass_upv_1 (copy, index: 2)
        tbl_upv_3 (copy, index: 3)
        RunService_upv_1 (copy, index: 4)
    ]]
    local u3 = tbl_upv_4[a1]
    if not (u3) then
        u3 = SpringClass_upv_1.new(a2, a3, a4 or 2, a5 or 3)
        tbl_upv_4[a1] = u3
    end
    u3:Shove(2.5)
    if (tbl_upv_3[a1]) then
        return
    end
    tbl_upv_3[a1] = RunService_upv_1.RenderStepped:Connect(
        function(a6)
            --[[
              line: 405
              upvalues:
                u3 (ref,  index: 1)
                a1 (copy, index: 2)
                tbl_upv_3 (copy, index: 3)
            ]]
            u3:Update(a6)
            a1.Rotation = u3.Position * 10
            if math.abs(u3.Position) >= 0.08 or math.abs(u3.Velocity) >= 0.08 then
                return
            end
            tbl_upv_3[a1]:Disconnect()
            tbl_upv_3[a1] = nil
        end
    )
end
function tbl_upv_1.SetTransitioningDebounce(a1, a2)
    --[[
      name: SetTransitioningDebounce
      line: 418
    ]]
    a1:SetAttribute("TransitionDebounce", a2)
end
function tbl_upv_1.SetTextLabelsOfName(a1, a2, a3)
    --[[
      name: SetTextLabelsOfName
      line: 422
    ]]
    local tbl_15 = {}
    for _, value_3 in pairs(a1:GetDescendants()) do
        if value_3.Name == a2 then
            table.insert(tbl_15, value_3)
        end
    end
    for _, value_4 in pairs(tbl_15) do
        value_4.Text = a3
    end
end
function tbl_upv_1.SetTextStrokesOfName(a1, a2, a3)
    --[[
      name: SetTextStrokesOfName
      line: 436
    ]]
    local tbl_16 = {}
    for _, value_5 in pairs(a1:GetDescendants()) do
        if value_5.Name == a2 then
            table.insert(tbl_16, value_5)
        end
    end
    for _, value_6 in pairs(tbl_16) do
        value_6.Color = a3
    end
end
function tbl_upv_1.PlayGlareEffect(a1, a2)
    --[[
      name: PlayGlareEffect
      line: 450
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local GlareEffect_1 = a1:FindFirstChild("GlareEffect")
    if GlareEffect_1 then
        if GlareEffect_1.Offset ~= Vector2.new(0, 6) then
            return
        end
        GlareEffect_1.Offset = Vector2.new(0, -6)
        tbl_upv_1.TweenGradientOffset(GlareEffect_1, Vector2.new(0, 6), a2 or 2.5)
    else
        warn(a1, "does not have a UI Gradient effect")
    end
end
function tbl_upv_1.ListLayoutVertical(a1, a2)
    --[[
      name: ListLayoutVertical
      line: 468
    ]]
    local tbl_17 = {}
    local v7 = 0
    for _, value_7 in pairs(a1) do
        tbl_17[value_7.LayoutOrder] = value_7
    end
    for _, value_8 in pairs(tbl_17) do
        value_8.Position = UDim2.new(value_8.Position.X.Scale, value_8.Position.X.Offset, v7, value_8.Position.Y.Offset)
        v7 = v7 + (value_8.Size.Y.Scale + a2)
    end
end
function tbl_upv_1.CreateHorizontalCenteredListLayout(a1)
    --[[
      name: CreateHorizontalCenteredListLayout
      line: 486
    ]]
    local tbl_18 = {}
    for _, value_9 in pairs(a1:GetChildren()) do
        if value_9:IsA("GuiBase2d") then
            table.insert(tbl_18, value_9)
        end
    end
    table.sort(
        tbl_18,
        function(a2, a3)
            --[[
              line: 496
            ]]
            return a2.LayoutOrder < a3.LayoutOrder
        end
    )
    local v9 = 0
    for _, value_10 in ipairs(tbl_18) do
        v9 = v9 + value_10.AbsoluteSize.X
    end
    local v11 = (a1.AbsoluteSize.X - v9) / 2
    for _, value_11 in ipairs(tbl_18) do
        local v12 = value_11:IsA("GuiObject")
        if v12 then
            value_11.AnchorPoint = Vector2.new(0.5, 0.5)
            value_11.Position = UDim2.new((v11 + (value_11.AbsoluteSize.X / 2)) / a1.AbsoluteSize.X, 0, 0.5, 0)
            value_11:SetAttribute("OriginalPosition", value_11.Position)
            v11 = v11 + value_11.AbsoluteSize.X
        end
    end
end
function tbl_upv_1.AdjustScrollingFrame(a1, a2)
    --[[
      name: AdjustScrollingFrame
      line: 531
    ]]
    a1.CanvasSize = UDim2.new(0, 0, 0, a2.AbsoluteContentSize.Y + 50)
end
function tbl_upv_1.QuickAppearFromOffset(a1, a2, a3)
    --[[
      name: QuickAppearFromOffset
      line: 536
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local Position_upv_1 = a1:GetAttribute("OriginalPosition")
    if not (Position_upv_1) then
        a1:SetAttribute("OriginalPosition", a1.Position)
        Position_upv_1 = a1.Position
    end
    local v13 = a2 or (UDim2.new(0, 0, 0, 25))
    a1.Position = Position_upv_1 + v13
    a1.Visible = true
    task.spawn(
        function()
            --[[
              line: 554
              upvalues:
                tbl_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                Position_upv_1 (ref,  index: 3)
                a3 (copy, index: 4)
            ]]
            tbl_upv_1.TweenPosition(a1, Position_upv_1, "Out", "Back", a3)
        end
    )
end
function tbl_upv_1.QuickDisappearFromOffset(a1, a2, a3)
    --[[
      name: QuickDisappearFromOffset
      line: 559
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v14 = a1:GetAttribute("OriginalPosition")
    if v14 then
        local v15 = a2 or (UDim2.new(0, 0, 0, 25))
        local u4 = v14 + v15
        task.spawn(
            function()
                --[[
                  line: 571
                  upvalues:
                    tbl_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                    u4 (copy, index: 3)
                    a3 (copy, index: 4)
                ]]
                tbl_upv_1.TweenPosition(a1, u4, "Out", "Linear", a3)
                task.wait(a3)
                a1.Visible = false
            end
        )
    else
        warn(a1, "- needs an OriginalPosition attribute")
    end
end
function InitializeSoundEffects()
    --[[
      name: InitializeSoundEffects
      line: 586
      upvalues:
        u1 (ref, index: 1)
        u2 (ref, index: 2)
    ]]
    local v16 = game.ReplicatedStorage:WaitForChild("Assets", 30)
    local v17 = v16 and (v16:WaitForChild("SoundEffects", 30))
    if v17 then
        u1 = v17:WaitForChild("Hover", 30)
        u2 = v17:WaitForChild("Click", 30)
    else
        warn("[UI_Utils] ReplicatedStorage.Assets.SoundEffects is missing, UI sounds are disabled")
    end
end
task.spawn(InitializeSoundEffects)
RunService_upv_1.RenderStepped:Connect(
    function()
        --[[
          line: 602
          upvalues:
            tbl_upv_5 (copy, index: 1)
            tbl_upv_1 (copy, index: 2)
        ]]
        for key_1, value_12 in pairs(tbl_upv_5) do
            local v18 = value_12[1]
            local v19 = value_12[2]
            if v18 <= workspace:GetServerTimeNow() - value_12[3] then
                tbl_upv_5[key_1] = {v18, v19, workspace:GetServerTimeNow()}
                tbl_upv_1.PlayGlareEffect(key_1, v19 or 2.5)
            end
        end
    end
)
return tbl_upv_1