-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local RunService_upv_1 = game:GetService("RunService")
local TextService_upv_1 = game:GetService("TextService")
local u1 = utf8.char(160)
local u2 = Font.fromEnum(Enum.Font.SourceSans)
local tbl_upv_2 = {}
tbl_upv_2.Animation = {Direction = "down", ColorFade = 280, SkipUnchanged = true, Duration = 300, Bounce = 0.6, Stagger = 45, RollBy = "character", ExitOffset = 50, Interrupt = true, Easing = {0.34, 1.56, 0.64, 1}}
tbl_upv_2.Variation = {DurationChannel = 1, ChannelFrequency = 78.233, IndexFrequency = 12.9898, SeedScale = 43758.5453, StaggerChannel = 2, TiltChannel = 3}
tbl_upv_2.Glyph = {MaximumTiltDegrees = 5, DurationVariationStrength = 0.45, StaggerVariationStrength = 0.25, TiltDecimalPlaces = 2, TailStaggerStartMultiplier = 0.5, TailStaggerStepMultiplier = 0.25, TailDurationMultiplier = 0.75}
tbl_upv_2.Width = {TailCollapseDurationMultiplier = 0.6, MinimumTransitionMs = 140, NewSlotExpansionDurationMultiplier = 0.45, MinimumVisibleChangePx = 0.5, TailCollapseDelayMultiplier = 0.55, ResizeEasing = {0.2, 0, 0, 1}}
tbl_upv_2.Layout = {FallbackLineHeightMultiplier = 1.3, FallbackCharacterHeightPx = 18}
tbl_upv_2.Chromatic = {HueSpreadDegrees = 320, HueStartDegrees = 0, LightnessPercent = 60, FullHueRotationDegrees = 360, SaturationPercent = 92}
tbl_upv_2.Lifecycle = {CompletionBufferMs = 80, FlashRevertDelayMs = 1400}
local u3 = setmetatable({}, {__mode = "k"})
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
local u4 = nil
function tbl_upv_1.Create(a1, a2, a3)
    --[[
      name: Create
      line: 165
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    if a1 and a1:IsA("GuiObject") then
        local tbl_6 = {}
        local u5 = a3 or {}
        local u6 = a2 or ""
        local u7 = nil
        local u8 = nil
        tbl_upv_1.Build(a1, u6, u5)
        function tbl_6.Set(a4, a5)
            --[[
              name: Set
              line: 180
              upvalues:
                u8 (ref,  index: 1)
                u7 (ref,  index: 2)
                u6 (ref,  index: 3)
                tbl_upv_1 (copy, index: 4)
                a1 (copy, index: 5)
                u5 (copy, index: 6)
            ]]
            if u8 then
                task.cancel(u8)
                u8 = nil
            end
            u7 = nil
            u6 = a4
            tbl_upv_1.Animate(a1, a4, MergeOptions(u5, a5))
        end
        function tbl_6.Flash(a6, a7)
            --[[
              name: Flash
              line: 193
              upvalues:
                u5 (copy, index: 1)
                u8 (ref,  index: 2)
                u7 (ref,  index: 3)
                u6 (ref,  index: 4)
                tbl_upv_1 (copy, index: 5)
                a1 (copy, index: 6)
                tbl_upv_2 (copy, index: 7)
            ]]
            local u9 = MergeOptions(u5, a7)
            if u8 then
                task.cancel(u8)
                u8 = nil
            end
            if u7 == nil then
                u7 = u6
            end
            u6 = a6
            tbl_upv_1.Animate(a1, a6, u9)
            local v1 = task.delay(
                (u9.RevertAfter or (tbl_upv_2.Lifecycle.FlashRevertDelayMs)) / 1000,
                function()
                    --[[
                      line: 209
                      upvalues:
                        u8 (ref,  index: 1)
                        u7 (ref,  index: 2)
                        u6 (ref,  index: 3)
                        tbl_upv_1 (copy, index: 4)
                        a1 (copy, index: 5)
                        u9 (copy, index: 6)
                    ]]
                    u8 = nil
                    local v2 = u7
                    u7 = nil
                    if v2 == nil then
                        return
                    end
                    u6 = v2
                    tbl_upv_1.Animate(a1, v2, u9)
                end
            )
            u8 = v1
        end
        function tbl_6.Destroy()
            --[[
              name: Destroy
              line: 225
              upvalues:
                u8 (ref,  index: 1)
                tbl_upv_1 (copy, index: 2)
                a1 (copy, index: 3)
                u6 (ref,  index: 4)
            ]]
            if u8 then
                task.cancel(u8)
                u8 = nil
            end
            tbl_upv_1.Clear(a1, u6)
        end
        function tbl_6.GetText()
            --[[
              name: GetText
              line: 234
              upvalues:
                u6 (ref, index: 1)
            ]]
            return u6
        end
        return tbl_6
    end
    warn("[SlotText] Create was given something that is not a GuiObject, cannot build a controller")
    return nil
end
function tbl_upv_1.Build(a1, a2, a3)
    --[[
      name: Build
      line: 242
    ]]
    local u10 = GetOrCreateState(a1, a3)
    if not u10 then
        return
    end
    CancelRunningAnimation(u10)
    local u11 = ResolveAnimationOptions(a3)
    local u12 = a2 or ""
    u10.Generation = u10.Generation + 1
    local Generation_upv_1 = u10.Generation
    task.spawn(
        function()
            --[[
              line: 256
              upvalues:
                u12 (copy, index: 1)
                u11 (copy, index: 2)
                u10 (copy, index: 3)
                Generation_upv_1 (copy, index: 4)
            ]]
            WarmMeasurements(SegmentText(u12, u11.RollBy), u10.Style)
            if u10.Generation ~= Generation_upv_1 then
                return
            end
            RenderCharacterSlots(u10, u12, u11.RollBy)
        end
    )
end
function tbl_upv_1.Animate(a1, a2, a3)
    --[[
      name: Animate
      line: 269
    ]]
    local u13 = GetOrCreateState(a1, a3)
    if not u13 then
        return
    end
    local u14 = a2 or ""
    local u15 = ResolveAnimationOptions(a3)
    local Running_1 = u13.Running
    if Running_1 then
        if u15.Interrupt then
            FinishRunningAnimation(u13)
        else
            if Running_1.TargetText ~= u14 then
                Running_1.Pending = {Text = u14, Options = a3}
            end
            return
        end
    end
    u13.Generation = u13.Generation + 1
    local Generation_upv_2 = u13.Generation
    task.spawn(
        function()
            --[[
              line: 295
              upvalues:
                u13 (copy, index: 1)
                Generation_upv_2 (copy, index: 2)
                u14 (copy, index: 3)
                u15 (copy, index: 4)
            ]]
            StartAnimation(u13, Generation_upv_2, u14, u15)
        end
    )
end
function tbl_upv_1.Clear(a1, a2)
    --[[
      name: Clear
      line: 301
      upvalues:
        u3 (copy, index: 1)
    ]]
    local v3 = u3[a1]
    if not v3 then
        return
    end
    CancelRunningAnimation(v3)
    if v3.Root then
        v3.Root:Destroy()
    end
    u3[a1] = nil
    RestoreContainerText(v3, a2 or "")
end
function tbl_upv_1.Chromatic(a1)
    --[[
      name: Chromatic
      line: 318
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local u16 = a1 or {}
    u16 = u16.From or (tbl_upv_2.Chromatic.HueStartDegrees)
    local u17 = u16.Spread or (tbl_upv_2.Chromatic.HueSpreadDegrees)
    local u18 = u16.Saturation or (tbl_upv_2.Chromatic.SaturationPercent)
    local u19 = u16.Lightness or (tbl_upv_2.Chromatic.LightnessPercent)
    return function(a2, a3)
        --[[
          line: 326
          upvalues:
            u16 (copy, index: 1)
            u17 (copy, index: 2)
            tbl_upv_2 (copy, index: 3)
            u18 (copy, index: 4)
            u19 (copy, index: 5)
        ]]
        return HslToColor3((u16 + ((a2 / math.max(a3 - 1, 1)) * u17)) % tbl_upv_2.Chromatic.FullHueRotationDegrees, u18 / 100, u19 / 100)
    end
end
function tbl_upv_1.GetText(a1)
    --[[
      name: GetText
      line: 336
      upvalues:
        u3 (copy, index: 1)
    ]]
    local v4 = u3[a1]
    if v4 then
        return v4.Text
    end
    return nil
end
function tbl_upv_1.GetTuning()
    --[[
      name: GetTuning
      line: 346
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2
end
function RoundHalfUp(a1)
    --[[
      name: RoundHalfUp
      line: 354
    ]]
    return (math.floor(a1 + 0.5))
end
function MergeOptions(a1, a2)
    --[[
      name: MergeOptions
      line: 358
    ]]
    local tbl_7 = {}
    for key_1, value_1 in a1 or {} do
        tbl_7[key_1] = value_1
    end
    for key_2, value_2 in a2 or {} do
        tbl_7[key_2] = value_2
    end
    return tbl_7
end
function ResolveAnimationOptions(a1)
    --[[
      name: ResolveAnimationOptions
      line: 373
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v5 = a1 or {}
    local Animation_1 = tbl_upv_2.Animation
    local tbl_8 = {Direction = 0, ColorFade = 0, Color = 0, Duration = 0, Bounce = 0, Stagger = 0, Easing = 0, RollBy = 0, Interrupt = 0, ExitOffset = 0, SkipUnchanged = 0}
    tbl_8.Direction = v5.Direction or (Animation_1.Direction)
    tbl_8.RollBy = v5.RollBy or (Animation_1.RollBy)
    tbl_8.Stagger = v5.Stagger or (Animation_1.Stagger)
    tbl_8.Duration = v5.Duration or (Animation_1.Duration)
    tbl_8.ExitOffset = v5.ExitOffset or (Animation_1.ExitOffset)
    tbl_8.Easing = v5.Easing or (Animation_1.Easing)
    tbl_8.Bounce = v5.Bounce or (Animation_1.Bounce)
    tbl_8.Color = v5.Color
    tbl_8.ColorFade = v5.ColorFade or (Animation_1.ColorFade)
    local v6
    if v5.SkipUnchanged ~= nil then
        v6 = v5.SkipUnchanged
    else
        v6 = Animation_1.SkipUnchanged
    end
    tbl_8.SkipUnchanged = v6
    if v5.Interrupt ~= nil then
        v6 = v5.Interrupt
    else
        v6 = Animation_1.Interrupt
    end
    tbl_8.Interrupt = v6
    return tbl_8
end
function GetDeterministicVariation(a1, a2)
    --[[
      name: GetDeterministicVariation
      line: 394
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local Variation_1 = tbl_upv_2.Variation
    local v7 = math.sin(((a1 + 1) * Variation_1.IndexFrequency) + (a2 * Variation_1.ChannelFrequency)) * Variation_1.SeedScale
    return ((v7 - math.floor(v7)) * 2) - 1
end
function CalculateGlyphTiming(a1, a2, a3, a4, a5, a6)
    --[[
      name: CalculateGlyphTiming
      line: 409
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local Glyph_1 = tbl_upv_2.Glyph
    local Variation_2 = tbl_upv_2.Variation
    local v8 = RoundHalfUp((a4 * (((not a3) and 1) or (Glyph_1.TailDurationMultiplier))) * (1 + ((a6 * Glyph_1.DurationVariationStrength) * GetDeterministicVariation(a1, Variation_2.DurationChannel))))
    local v9 = (a3 and (a2 * Glyph_1.TailStaggerStartMultiplier + (a1 - a2) * Glyph_1.TailStaggerStepMultiplier)) or a1
    local v10 = 10 ^ Glyph_1.TiltDecimalPlaces
    local v11 = math.round(((a6 * Glyph_1.MaximumTiltDegrees) * GetDeterministicVariation(a1, Variation_2.TiltChannel)) * v10) / v10
    local tbl_9 = {}
    tbl_9.DurationMs = v8
    tbl_9.StartDelayMs = RoundHalfUp((v9 * a5) * (1 + ((a6 * Glyph_1.StaggerVariationStrength) * GetDeterministicVariation(a1, Variation_2.StaggerChannel))))
    tbl_9.StartingTiltDegrees = v11
    return tbl_9
end
function CalculateWidthTiming(a1, a2, a3)
    --[[
      name: CalculateWidthTiming
      line: 445
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local Width_1 = tbl_upv_2.Width
    if a2 == "" then
        local tbl_10 = {}
        tbl_10.StartDelayMs = a3.StartDelayMs + RoundHalfUp(a3.DurationMs * Width_1.TailCollapseDelayMultiplier)
        tbl_10.DurationMs = math.max(Width_1.MinimumTransitionMs, RoundHalfUp(a3.DurationMs * Width_1.TailCollapseDurationMultiplier))
        return tbl_10
    elseif a1 ~= "" then
        local tbl_11 = {}
        tbl_11.StartDelayMs = a3.StartDelayMs
        tbl_11.DurationMs = a3.DurationMs
        return tbl_11
    else
        local tbl_12 = {}
        tbl_12.StartDelayMs = a3.StartDelayMs
        tbl_12.DurationMs = math.max(Width_1.MinimumTransitionMs, RoundHalfUp(a3.DurationMs * Width_1.NewSlotExpansionDurationMultiplier))
        return tbl_12
    end
end
function GetEasingFunction(a1)
    --[[
      name: GetEasingFunction
      line: 475
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    if typeof(a1) ~= "function" then
        if typeof(a1) == "table" then
            local u20 = a1[1]
            local u21 = a1[2]
            local u22 = a1[3]
            local u23 = a1[4]
            local v12 = string.format("%f_%f_%f_%f", u20, u21, u22, u23)
            local v13 = tbl_upv_3[v12]
            if v13 then
                return v13
            end
            local v14 = function(a2)
                --[[
                  line: 515
                  upvalues:
                    u20 (copy, index: 1)
                    u21 (copy, index: 2)
                    u22 (copy, index: 3)
                    u23 (copy, index: 4)
                ]]
                if u20 == u21 and u22 == u23 then
                    return a2
                end
                if a2 <= 0 then
                    return 0
                end
                if a2 >= 1 then
                    return 1
                end
                local v15 = a2
                for _ = 1, 8 do
                    local v16 = (((3 * ((1 - (3 * u22)) + (3 * u20))) * v15) * v15) + ((2 * ((3 * u22) - (6 * u20))) * v15) + 3 * u20
                    if v16 == 0 or math.abs(v16) < 0.001 then
                        break
                    else
                        local v17 = v15
                        local v18 = u20
                        local v19 = u22
                        v15 = v15 - ((((((((1 - (3 * v19)) + (3 * v18)) * v17) + ((3 * v19) - (6 * v18))) * v17) + (3 * v18)) * v17) - a2) / v16
                    end
                end
                if v15 < 0 or v15 > 1 then
                    local v20 = 0
                    local v21 = 1
                    local v22, v23
                    v15, v22, v23 = a2, v21, v20
                    for _ = 1, 30 do
                        local v24 = u20
                        local v25 = u22
                        local v26 = ((((((1 - (3 * v25)) + (3 * v24)) * v15) + ((3 * v25) - (6 * v24))) * v15) + (3 * v24)) * v15
                        if math.abs(v26 - a2) < 1e-07 then
                            break
                        end
                        if a2 >= v26 then
                            v21, v20 = v22, v15
                        else
                            v21, v20 = v15, v23
                        end
                        v15, v22, v23 = (v21 + v20) / 2, v21, v20
                    end
                end
                return ((((((1 - (3 * u23)) + (3 * u21)) * v15) + ((3 * u23) - (6 * u21))) * v15) + (3 * u21)) * v15
            end
            tbl_upv_3[v12] = v14
            return v14
        end
        warn("[SlotText] Easing must be a function or a table of four control points, falling back to linear")
        return function(a3)
            --[[
              line: 482
            ]]
            return a3
        end
    end
    return a1
end
function HslToColor3(a1, a2, a3)
    --[[
      name: HslToColor3
      line: 576
    ]]
    local v27 = (1 - math.abs((2 * a3) - 1)) * a2
    local v28 = a1 % 360 / 60
    local v29 = v27 * (1 - math.abs((v28 % 2) - 1))
    local v30, v31, v32
    if v28 >= 1 then
        if v28 >= 2 then
            if v28 >= 3 then
                if v28 >= 4 then
                    if v28 >= 5 then
                        v30, v31, v32 = v27, 0, v29
                    else
                        v30, v31, v32 = v29, 0, v27
                    end
                else
                    v30, v31, v32 = 0, v29, v27
                end
            else
                v30, v31, v32 = 0, v27, v29
            end
        else
            v30, v31, v32 = v29, v27, 0
        end
    else
        v32 = 0
        v30, v31 = v27, v29
    end
    local v33 = a3 - v27 / 2
    return Color3.new(v30 + v33, v31 + v33, v32 + v33)
end
function SegmentText(a1, a2)
    --[[
      name: SegmentText
      line: 603
    ]]
    local tbl_13 = {}
    if a1 ~= "" then
        if a2 ~= "word" then
            for key_3, value_3 in utf8.graphemes(a1) do
                table.insert(tbl_13, (string.sub(a1, key_3, value_3)))
            end
        else
            local v34 = 1
            while v34 <= #a1 do
                local v35, v36 = string.find(a1, "%s+", v34)
                if v35 ~= v34 then
                    local v37 = (v35 and (v35 - 1)) or (#a1)
                    table.insert(tbl_13, (string.sub(a1, v34, v37)))
                    v34 = v37 + 1
                else
                    table.insert(tbl_13, (string.sub(a1, v35, v36)))
                    v34 = v36 + 1
                end
            end
        end
    end
    return tbl_13
end
function GetVisibleSegmentText(a1)
    --[[
      name: GetVisibleSegmentText
      line: 638
      upvalues:
        u1 (copy, index: 1)
    ]]
    return (string.gsub(a1, " ", u1))
end
function MeasureSegmentWidth(a1, a2)
    --[[
      name: MeasureSegmentWidth
      line: 643
      upvalues:
        tbl_upv_4 (copy, index: 1)
        TextService_upv_1 (copy, index: 2)
    ]]
    if a1 == "" then
        return 0
    end
    local v38 = GetVisibleSegmentText(a1)
    local v39 = string.format("%s|%s|%d|%d|%s|%s", v38, a2.FontFace.Family, a2.FontFace.Weight.Value, a2.FontFace.Style.Value, tostring(a2.TextSize), tostring(a2.RichText))
    local v40 = tbl_upv_4[v39]
    if v40 then
        return v40
    end
    local u24 = Instance.new("GetTextBoundsParams")
    u24.Text = v38
    u24.Font = a2.FontFace
    u24.Size = a2.TextSize
    u24.Width = 0
    u24.RichText = a2.RichText
    local success_1, v41 = pcall(
        function()
            --[[
              line: 671
              upvalues:
                TextService_upv_1 (copy, index: 1)
                u24 (copy, index: 2)
            ]]
            return TextService_upv_1:GetTextBoundsAsync(u24)
        end
    )
    local v42
    if success_1 then
        v42 = v41.X
    else
        warn("[SlotText] GetTextBoundsAsync failed, estimating the width of: " .. v38)
        local v43 = utf8.len(v38) or (#v38)
        v42 = v43 * a2.TextSize * 0.5
    end
    tbl_upv_4[v39] = v42
    return v42
end
function WarmMeasurements(a1, a2)
    --[[
      name: WarmMeasurements
      line: 689
    ]]
    local tbl_14 = {}
    for _, value_4 in a1 do
        if tbl_14[value_4] == nil then
            tbl_14[value_4] = MeasureSegmentWidth(value_4, a2)
        end
    end
    return tbl_14
end
function ResolveStyle(a1, a2)
    --[[
      name: ResolveStyle
      line: 701
      upvalues:
        u2 (copy, index: 1)
    ]]
    local tbl_15 = {TextTransparency = 0, TextStrokeTransparency = 1, RichText = false, TextSize = 14}
    tbl_15.FontFace = u2
    tbl_15.TextColor3 = Color3.new(0, 0, 0)
    tbl_15.TextStrokeColor3 = Color3.new(0, 0, 0)
    tbl_15.TextXAlignment = Enum.TextXAlignment.Center
    tbl_15.TextYAlignment = Enum.TextYAlignment.Center
    if a1:IsA("TextLabel") or a1:IsA("TextButton") or a1:IsA("TextBox") then
        tbl_15.FontFace = a1.FontFace
        tbl_15.TextSize = a1.TextSize
        tbl_15.TextColor3 = a1.TextColor3
        tbl_15.TextTransparency = a1.TextTransparency
        tbl_15.TextStrokeColor3 = a1.TextStrokeColor3
        tbl_15.TextStrokeTransparency = a1.TextStrokeTransparency
        tbl_15.RichText = a1.RichText
        tbl_15.TextXAlignment = a1.TextXAlignment
        tbl_15.TextYAlignment = a1.TextYAlignment
        if a1.TextScaled then
            tbl_15.TextSize = math.max(math.floor(a1.AbsoluteSize.Y), 1)
            warn("[SlotText] " .. a1.Name .. " uses TextScaled, deriving TextSize from its height instead")
        end
    end
    for key_4, value_5 in a2 or {} do
        tbl_15[key_4] = value_5
    end
    tbl_15.TextSize = ClampTextSize(tbl_15.TextSize)
    return tbl_15
end
function ClampTextSize(a1)
    --[[
      name: ClampTextSize
      line: 744
    ]]
    if a1 > 100 then
        warn("[SlotText] TextSize " .. tostring(a1) .. " is above the engine's limit of " .. 100 .. ", the slots will be drawn at " .. 100 .. " instead")
        return 100
    end
    return a1
end
function CalculateCharacterHeight(a1)
    --[[
      name: CalculateCharacterHeight
      line: 756
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return (math.max(math.ceil(a1 * tbl_upv_2.Layout.FallbackLineHeightMultiplier), tbl_upv_2.Layout.FallbackCharacterHeightPx))
end
function ApplyStyleOverrides(a1, a2)
    --[[
      name: ApplyStyleOverrides
      line: 775
    ]]
    if not a2 then
        return
    end
    local v44 = false
    local v45 = nil
    for key_5, value_6 in a2 do
        if key_5 ~= "TextSize" then
            v45 = value_6
        else
            v45 = ClampTextSize(value_6)
        end
        if a1.Style[key_5] ~= v45 then
            a1.Style[key_5] = v45
            v44 = true
        end
    end
    if not v44 then
        return
    end
    a1.StyleChanged = true
    a1.CharacterHeight = CalculateCharacterHeight(a1.Style.TextSize)
    a1.OverflowPadding = math.max(8, a1.CharacterHeight)
    if not a1.Layout then
        return
    end
    a1.Layout.HorizontalAlignment = GetHorizontalAlignment(a1.Style.TextXAlignment)
    a1.Layout.VerticalAlignment = GetVerticalAlignment(a1.Style.TextYAlignment)
end
function ResolveLetterSpacing(a1)
    --[[
      name: ResolveLetterSpacing
      line: 813
    ]]
    if a1 ~= nil then
        if typeof(a1) ~= "UDim" then
            if typeof(a1) ~= "number" then
                warn("[SlotText] LetterSpacing must be a number of pixels or a UDim, leaving the tracking as it is")
                return nil
            end
            return UDim.new(0, a1)
        end
        return a1
    end
    return nil
end
function ApplyLetterSpacing(a1, a2)
    --[[
      name: ApplyLetterSpacing
      line: 832
    ]]
    local v46 = ResolveLetterSpacing(a2)
    if not v46 or v46 == a1.LetterSpacing then
        return
    end
    a1.LetterSpacing = v46
    if a1.Layout then
        a1.Layout.Padding = v46
    end
end
function GetOrCreateState(a1, a2)
    --[[
      name: GetOrCreateState
      line: 846
      upvalues:
        u3 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    if a1 and a1:IsA("GuiObject") then
        local v47 = u3[a1]
        if v47 then
            ApplyStyleOverrides(v47, a2 and (a2.Style))
            ApplyLetterSpacing(v47, a2 and (a2.LetterSpacing))
        else
            local v48 = ResolveStyle(a1, a2 and (a2.Style))
            local v49 = CalculateCharacterHeight(v48.TextSize)
            local tbl_16 = {AutoSize = 0, Text = "", Slots = 0, LetterSpacing = 0, RollBy = 0, Generation = 0}
            tbl_16.Container = a1
            tbl_16.Style = v48
            tbl_16.CharacterHeight = v49
            tbl_16.OverflowPadding = math.max(8, v49)
            local v50
            if a2 then
                v50 = a2.AutoSize == true
            else
                v50 = false
            end
            tbl_16.AutoSize = v50
            tbl_16.LetterSpacing = ResolveLetterSpacing(a2 and (a2.LetterSpacing)) or UDim.new(0, 0)
            tbl_16.Slots = {}
            tbl_16.RollBy = tbl_upv_2.Animation.RollBy
            HideContainerText(v47)
            v47.Root = CreateRoot(v47)
            u3[a1] = v47
        end
        return v47
    end
    warn("[SlotText] Container is missing or is not a GuiObject, cannot render slots")
    return nil
end
function HideContainerText(a1)
    --[[
      name: HideContainerText
      line: 885
    ]]
    local Container_1 = a1.Container
    if not (Container_1:IsA("TextLabel")) and not (Container_1:IsA("TextButton")) and not (Container_1:IsA("TextBox")) then
        return
    end
    a1.OriginalText = Container_1.Text
    Container_1.Text = ""
end
function RestoreContainerText(a1, a2)
    --[[
      name: RestoreContainerText
      line: 896
    ]]
    local Container_2 = a1.Container
    if not Container_2 or not Container_2.Parent then
        return
    end
    if a1.ContainerAuthoredAutomaticSize then
        Container_2.AutomaticSize = a1.ContainerAuthoredAutomaticSize
    end
    if not (Container_2:IsA("TextLabel")) and not (Container_2:IsA("TextButton")) and not (Container_2:IsA("TextBox")) then
        return
    end
    Container_2.Text = a2
end
function CreateRoot(a1)
    --[[
      name: CreateRoot
      line: 915
    ]]
    local v52 = Instance.new("Frame")
    v52.Name = "SlotText"
    v52.BackgroundTransparency = 1
    v52.BorderSizePixel = 0
    v52.Size = UDim2.fromScale(1, 1)
    v52.ClipsDescendants = false
    v52.ZIndex = a1.Container.ZIndex
    local v53 = Instance.new("UIListLayout")
    v53.FillDirection = Enum.FillDirection.Horizontal
    v53.SortOrder = Enum.SortOrder.LayoutOrder
    v53.Padding = a1.LetterSpacing
    v53.HorizontalAlignment = GetHorizontalAlignment(a1.Style.TextXAlignment)
    v53.VerticalAlignment = GetVerticalAlignment(a1.Style.TextYAlignment)
    v53.Parent = v52
    a1.Layout = v53
    if a1.AutoSize then
        v52.Size = UDim2.new(0, 0, 1, 0)
        v52.AutomaticSize = Enum.AutomaticSize.X
        a1.ContainerAuthoredAutomaticSize = a1.Container.AutomaticSize
        a1.Container.AutomaticSize = Enum.AutomaticSize.X
    end
    v52.Parent = a1.Container
    return v52
end
function GetHorizontalAlignment(a1)
    --[[
      name: GetHorizontalAlignment
      line: 949
    ]]
    if a1 ~= Enum.TextXAlignment.Left then
        if a1 ~= Enum.TextXAlignment.Right then
            return Enum.HorizontalAlignment.Center
        end
        return Enum.HorizontalAlignment.Right
    end
    return Enum.HorizontalAlignment.Left
end
function GetVerticalAlignment(a1)
    --[[
      name: GetVerticalAlignment
      line: 961
    ]]
    if a1 ~= Enum.TextYAlignment.Top then
        if a1 ~= Enum.TextYAlignment.Bottom then
            return Enum.VerticalAlignment.Center
        end
        return Enum.VerticalAlignment.Bottom
    end
    return Enum.VerticalAlignment.Top
end
function CreateCharacterFace(a1, a2, a3, a4)
    --[[
      name: CreateCharacterFace
      line: 974
    ]]
    local Style_1 = a1.Style
    local v54 = Instance.new("TextLabel")
    v54.Name = "CharFace"
    v54.BackgroundTransparency = 1
    v54.BorderSizePixel = 0
    v54.AnchorPoint = Vector2.new(0.5, 0.5)
    v54.Position = UDim2.new(0.5, 0, 0.5, 0)
    v54.Size = UDim2.new(1, -a2.OverflowPadding * 2, 1, 0)
    v54.Text = GetVisibleSegmentText(a3)
    v54.FontFace = Style_1.FontFace
    v54.TextSize = Style_1.TextSize
    v54.TextColor3 = a4 or (Style_1.TextColor3)
    v54.TextTransparency = Style_1.TextTransparency
    v54.TextStrokeColor3 = Style_1.TextStrokeColor3
    v54.TextStrokeTransparency = Style_1.TextStrokeTransparency
    v54.RichText = Style_1.RichText
    v54.TextWrapped = false
    v54.TextXAlignment = Enum.TextXAlignment.Center
    v54.TextYAlignment = Enum.TextYAlignment.Center
    v54.ZIndex = a1.Container.ZIndex
    v54.Parent = a2.Clipper
    return v54
end
function CreateCharacterSlot(a1, a2, a3, a4)
    --[[
      name: CreateCharacterSlot
      line: 1003
    ]]
    local OverflowPadding_1 = a1.OverflowPadding
    local v55 = Instance.new("Frame")
    v55.Name = "CharSlot"
    v55.BackgroundTransparency = 1
    v55.BorderSizePixel = 0
    v55.LayoutOrder = a2
    v55.Size = UDim2.new(0, a4, 0, a1.CharacterHeight)
    v55.ClipsDescendants = false
    v55.ZIndex = a1.Container.ZIndex
    local v56 = Instance.new("Frame")
    v56.Name = "CharClipper"
    v56.BackgroundTransparency = 1
    v56.BorderSizePixel = 0
    v56.ClipsDescendants = true
    v56.Position = UDim2.new(0, -OverflowPadding_1, 0, 0)
    v56.Size = UDim2.new(1, OverflowPadding_1 * 2, 1, 0)
    v56.ZIndex = a1.Container.ZIndex
    v56.Parent = v55
    local tbl_17 = {}
    tbl_17.Frame = v55
    tbl_17.Clipper = v56
    tbl_17.Segment = a3
    tbl_17.Width = a4
    tbl_17.OverflowPadding = OverflowPadding_1
    tbl_17.Face = CreateCharacterFace(a1, tbl_17, a3, nil)
    v55.Parent = a1.Root
    a1.Slots[a2] = tbl_17
    return tbl_17
end
function SetSlotOverflowPadding(a1, a2)
    --[[
      name: SetSlotOverflowPadding
      line: 1043
    ]]
    a1.OverflowPadding = a2
    a1.Clipper.Position = UDim2.new(0, -a2, 0, 0)
    a1.Clipper.Size = UDim2.new(1, a2 * 2, 1, 0)
    for _, value_7 in a1.Clipper:GetChildren() do
        if value_7:IsA("TextLabel") then
            value_7.Size = UDim2.new(1, -a2 * 2, 1, value_7.Size.Y.Offset)
        end
    end
end
function RenderCharacterSlots(a1, a2, a3)
    --[[
      name: RenderCharacterSlots
      line: 1058
    ]]
    for _, value_8 in a1.Slots do
        value_8.Frame:Destroy()
    end
    table.clear(a1.Slots)
    for key_6, value_9 in SegmentText(a2, a3) do
        CreateCharacterSlot(a1, key_6, value_9, MeasureSegmentWidth(value_9, a1.Style))
    end
    a1.Text = a2
    a1.RollBy = a3
    a1.StyleChanged = nil
end
function AddMissingSlots(a1, a2)
    --[[
      name: AddMissingSlots
      line: 1080
    ]]
    while #a1.Slots < a2 do
        CreateCharacterSlot(a1, #a1.Slots + 1, "", 0)
    end
end
function EnsureTrackConnection()
    --[[
      name: EnsureTrackConnection
      line: 1086
      upvalues:
        u4 (ref,  index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    if u4 then
        return
    end
    u4 = RunService_upv_1.RenderStepped:Connect(UpdateTracks)
end
function AddTrack(a1, a2)
    --[[
      name: AddTrack
      line: 1094
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    a1.StartTime = os.clock() + a1.DelaySeconds
    table.insert(tbl_upv_5, a1)
    if a2 then
        table.insert(a2.Tracks, a1)
    end
    EnsureTrackConnection()
end
function FinishTrack(a1)
    --[[
      name: FinishTrack
      line: 1105
    ]]
    if a1.Cancelled then
        return
    end
    a1.Cancelled = true
    if a1.Apply then
        a1.Apply(a1.Easing(1))
    end
    if a1.OnComplete then
        a1.OnComplete()
    end
end
function UpdateTracks()
    --[[
      name: UpdateTracks
      line: 1121
      upvalues:
        tbl_upv_5 (copy, index: 1)
        u4 (ref,  index: 2)
    ]]
    local v57 = os.clock()
    local v58 = 1
    local v59, v60 = nil, nil
    while v58 <= #tbl_upv_5 do
        local v61 = tbl_upv_5[v58]
        v59 = false
        if v61.Cancelled then
            v59 = true
        else
            local v62 = v57 - v61.StartTime
            if v62 >= 0 then
                v60 = 1
                if v61.DurationSeconds > 0 then
                    v60 = math.clamp(v62 / v61.DurationSeconds, 0, 1)
                end
                if v61.Apply then
                    v61.Apply(v61.Easing(v60))
                end
                if v60 >= 1 then
                    local v63 = true
                    v61.Cancelled = true
                    if v61.OnComplete then
                        v61.OnComplete()
                    end
                    v59 = v63
                end
            end
        end
        if v59 then
            table.remove(tbl_upv_5, v58)
        else
            v58 = v58 + 1
        end
    end
    if #tbl_upv_5 ~= 0 or not u4 then
        return
    end
    u4:Disconnect()
    u4 = nil
end
function PrepareSlotAnimation(a1, a2, a3, a4)
    --[[
      name: PrepareSlotAnimation
      line: 1171
    ]]
    local SlotRecord_1 = a2.SlotRecord
    local v64 = CalculateGlyphTiming(a2.SegmentIndex, a3, a2.IsTrailingSlot, a4.Duration, a4.Stagger, a4.Bounce)
    local v65 = CalculateWidthTiming(a2.CurrentSegment, a2.TargetSegment, v64)
    local v66 = true
    if a2.CurrentSegment ~= "" then
        v66 = a2.TargetSegment == ""
    end
    if v66 then
        SetSlotOverflowPadding(SlotRecord_1, 0)
    end
    local v67 = nil
    if a4.Color then
        if typeof(a4.Color) ~= "function" then
            v67 = a4.Color
        else
            v67 = a4.Color(a2.SegmentIndex, a3)
        end
    end
    local v68
    if a4.Direction ~= "up" then
        v68 = -a1.CharacterHeight
    else
        v68 = a1.CharacterHeight
    end
    local v69 = CreateCharacterFace(a1, SlotRecord_1, a2.TargetSegment, v67)
    v69.Position = UDim2.new(0.5, 0, 0.5, v68)
    v69.Rotation = v64.StartingTiltDegrees
    local v70 = v64.StartDelayMs + a4.ExitOffset + v64.DurationMs
    if v67 then
        v70 = v70 + a4.ColorFade
    end
    local v71 = ((a2.WidthWillChange) and (v65.StartDelayMs + v65.DurationMs)) or 0
    local tbl_18 = {}
    tbl_18.Measurement = a2
    tbl_18.SlotRecord = SlotRecord_1
    tbl_18.Timing = v64
    tbl_18.WidthTiming = v65
    tbl_18.IncomingFace = v69
    tbl_18.OutgoingFace = SlotRecord_1.Face
    tbl_18.EntryOffset = v68
    tbl_18.TintColor = v67
    tbl_18.WasResizing = v66
    tbl_18.CompletionTimeMs = math.max(v70, v71)
    return tbl_18
end
function ScheduleSlotAnimation(a1, a2, a3, a4)
    --[[
      name: ScheduleSlotAnimation
      line: 1227
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local Measurement_upv_1 = a2.Measurement
    local SlotRecord_upv_2 = a2.SlotRecord
    local Timing_1 = a2.Timing
    local WidthTiming_1 = a2.WidthTiming
    local v72 = GetEasingFunction(a3.Easing)
    local TextColor3_upv_1 = a1.Style.TextColor3
    if Measurement_upv_1.WidthWillChange then
        local CurrentWidth_upv_1 = Measurement_upv_1.CurrentWidth
        local TargetWidth_upv_1 = Measurement_upv_1.TargetWidth
        local function Apply(a5)
            --[[
              name: Apply
              line: 1244
              upvalues:
                SlotRecord_upv_2 (copy, index: 1)
                CurrentWidth_upv_1 (copy, index: 2)
                TargetWidth_upv_1 (copy, index: 3)
                a1 (copy, index: 4)
            ]]
            SlotRecord_upv_2.Frame.Size = UDim2.new(0, CurrentWidth_upv_1 + ((TargetWidth_upv_1 - CurrentWidth_upv_1) * a5), 0, a1.CharacterHeight)
        end
        AddTrack({DelaySeconds = WidthTiming_1.StartDelayMs / 1000, DurationSeconds = WidthTiming_1.DurationMs / 1000, Easing = GetEasingFunction(tbl_upv_2.Width.ResizeEasing), Apply = Apply}, a4)
    end
    local OutgoingFace_upv_1 = a2.OutgoingFace
    if OutgoingFace_upv_1 then
        local u25 = -a2.EntryOffset
        local u26 = -Timing_1.StartingTiltDegrees
        local function Apply_2(a6)
            --[[
              name: Apply
              line: 1260
              upvalues:
                OutgoingFace_upv_1 (copy, index: 1)
                u25 (copy, index: 2)
                u26 (copy, index: 3)
            ]]
            OutgoingFace_upv_1.Position = UDim2.new(0.5, 0, 0.5, u25 * a6)
            OutgoingFace_upv_1.Rotation = u26 * a6
        end
        AddTrack({DelaySeconds = Timing_1.StartDelayMs / 1000, DurationSeconds = Timing_1.DurationMs / 1000, Easing = v72, Apply = Apply_2}, a4)
    end
    local IncomingFace_upv_1 = a2.IncomingFace
    local EntryOffset_upv_1 = a2.EntryOffset
    local StartingTiltDegrees_upv_1 = Timing_1.StartingTiltDegrees
    local function OnComplete()
        --[[
          name: OnComplete
          line: 1280
          upvalues:
            OutgoingFace_upv_1 (copy, index: 1)
            IncomingFace_upv_1 (copy, index: 2)
            SlotRecord_upv_2 (copy, index: 3)
            Measurement_upv_1 (copy, index: 4)
            a1 (copy, index: 5)
            a2 (copy, index: 6)
        ]]
        if OutgoingFace_upv_1 then
            OutgoingFace_upv_1:Destroy()
        end
        IncomingFace_upv_1.Position = UDim2.new(0.5, 0, 0.5, 0)
        IncomingFace_upv_1.Rotation = 0
        SlotRecord_upv_2.Face = IncomingFace_upv_1
        SlotRecord_upv_2.Segment = Measurement_upv_1.TargetSegment
        SlotRecord_upv_2.Width = Measurement_upv_1.TargetWidth
        SlotRecord_upv_2.Frame.Size = UDim2.new(0, Measurement_upv_1.TargetWidth, 0, a1.CharacterHeight)
        if not a2.WasResizing then
            return
        end
        SetSlotOverflowPadding(SlotRecord_upv_2, a1.OverflowPadding)
    end
    local function Apply_3(a7)
        --[[
          name: Apply
          line: 1276
          upvalues:
            IncomingFace_upv_1 (copy, index: 1)
            EntryOffset_upv_1 (copy, index: 2)
            StartingTiltDegrees_upv_1 (copy, index: 3)
        ]]
        IncomingFace_upv_1.Position = UDim2.new(0.5, 0, 0.5, EntryOffset_upv_1 * (1 - a7))
        IncomingFace_upv_1.Rotation = StartingTiltDegrees_upv_1 * (1 - a7)
    end
    AddTrack({DelaySeconds = (Timing_1.StartDelayMs + a3.ExitOffset) / 1000, DurationSeconds = Timing_1.DurationMs / 1000, Easing = v72, Apply = Apply_3, OnComplete = OnComplete}, a4)
    if a2.TintColor then
        local TintColor_upv_1 = a2.TintColor
        local tbl_19 = {Easing = 0, Apply = 0}
        tbl_19.DelaySeconds = ((Timing_1.StartDelayMs + a3.ExitOffset) + Timing_1.DurationMs) / 1000
        tbl_19.DurationSeconds = a3.ColorFade / 1000
        function tbl_19.Easing(a8)
            --[[
              name: Easing
              line: 1306
            ]]
            return a8
        end
        function tbl_19.Apply(a9)
            --[[
              name: Apply
              line: 1309
              upvalues:
                IncomingFace_upv_1 (copy, index: 1)
                TintColor_upv_1 (copy, index: 2)
                TextColor3_upv_1 (copy, index: 3)
            ]]
            IncomingFace_upv_1.TextColor3 = TintColor_upv_1:Lerp(TextColor3_upv_1, a9)
        end
        AddTrack(tbl_19, a4)
    end
end
function StartAnimation(a1, a2, a3, a4)
    --[[
      name: StartAnimation
      line: 1317
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local Style_2 = a1.Style
    local v73 = SegmentText(a1.Text, a4.RollBy)
    local v74 = SegmentText(a3, a4.RollBy)
    local v75 = WarmMeasurements(v74, Style_2)
    WarmMeasurements(v73, Style_2)
    if a1.Generation ~= a2 then
        return
    end
    if a1.RollBy ~= a4.RollBy or #a1.Slots ~= #v73 then
        RenderCharacterSlots(a1, a1.Text, a4.RollBy)
    end
    local v76 = math.max(#v73, #v74)
    AddMissingSlots(a1, v76)
    local v77 = a1.StyleChanged == true
    a1.StyleChanged = nil
    local tbl_20 = {}
    local v78, v79 = nil, nil
    for n_1 = 1, v76 do
        local v80 = v73[n_1] or ""
        local v81 = v74[n_1] or ""
        local v82 = not a4.SkipUnchanged
        if v82 then
            v78 = v82
        else
            v78 = v77
            if not v78 then
                v78 = true
                if v80 == v81 then
                    v78 = v80 == ""
                end
            end
        end
        if not (v78) then
            continue
        end
        local v83 = a1.Slots[n_1]
        local Width_2 = v83.Width
        local v84 = v75[v81] or (MeasureSegmentWidth(v81, Style_2))
        local tbl_21 = {IsTrailingSlot = 0, WidthWillChange = 0}
        tbl_21.SlotRecord = v83
        tbl_21.SegmentIndex = n_1 - 1
        tbl_21.CurrentSegment = v80
        tbl_21.TargetSegment = v81
        tbl_21.CurrentWidth = Width_2
        tbl_21.TargetWidth = v84
        if tbl_upv_2.Width.MinimumVisibleChangePx < math.abs(v84 - Width_2) then
            v79 = true
        else
            v79 = false
        end
        tbl_21.WidthWillChange = v79
        if #v74 < n_1 then
            v79 = true
        else
            v79 = false
        end
        tbl_21.IsTrailingSlot = v79
        table.insert(tbl_20, tbl_21)
    end
    if #tbl_20 ~= 0 then
        local tbl_22 = {}
        tbl_22.TargetText = a3
        tbl_22.RollBy = a4.RollBy
        tbl_22.Tracks = {}
        a1.Running = tbl_22
        local v85 = 0
        local tbl_23 = {}
        local v86 = v85
        for _, value_10 in tbl_20 do
            local v87 = PrepareSlotAnimation(a1, value_10, #v74, a4)
            table.insert(tbl_23, v87)
            v86 = math.max(v86, v87.CompletionTimeMs)
        end
        for _, value_11 in tbl_23 do
            ScheduleSlotAnimation(a1, value_11, a4, tbl_22)
        end
        local tbl_24 = {DurationSeconds = 0, OnComplete = 0, Easing = 0}
        tbl_24.DelaySeconds = (v86 + tbl_upv_2.Lifecycle.CompletionBufferMs) / 1000
        function tbl_24.Easing(a5)
            --[[
              name: Easing
              line: 1405
            ]]
            return a5
        end
        function tbl_24.OnComplete()
            --[[
              name: OnComplete
              line: 1409
              upvalues:
                a1 (copy, index: 1)
                a3 (copy, index: 2)
                a4 (copy, index: 3)
            ]]
            CompleteAnimation(a1, a3, a4.RollBy)
        end
        AddTrack(tbl_24, tbl_22)
    else
        a1.Text = a3
    end
end
function CompleteAnimation(a1, a2, a3)
    --[[
      name: CompleteAnimation
      line: 1417
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local Running_2 = a1.Running
    a1.Running = nil
    RenderCharacterSlots(a1, a2, a3)
    if not Running_2 or not Running_2.Pending then
        return
    end
    local Pending_1 = Running_2.Pending
    tbl_upv_1.Animate(a1.Container, Pending_1.Text, Pending_1.Options)
end
function FinishRunningAnimation(a1)
    --[[
      name: FinishRunningAnimation
      line: 1433
    ]]
    local Running_3 = a1.Running
    if not Running_3 then
        return
    end
    a1.Running = nil
    for _, value_12 in Running_3.Tracks do
        FinishTrack(value_12)
    end
    RenderCharacterSlots(a1, Running_3.TargetText, Running_3.RollBy)
end
function CancelRunningAnimation(a1)
    --[[
      name: CancelRunningAnimation
      line: 1449
    ]]
    local Running_4 = a1.Running
    if not Running_4 then
        return
    end
    a1.Running = nil
    for _, value_13 in Running_4.Tracks do
        value_13.Cancelled = true
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 1463
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    GetEasingFunction(tbl_upv_2.Animation.Easing)
    GetEasingFunction(tbl_upv_2.Width.ResizeEasing)
end
task.spawn(Initialize)
return tbl_upv_1