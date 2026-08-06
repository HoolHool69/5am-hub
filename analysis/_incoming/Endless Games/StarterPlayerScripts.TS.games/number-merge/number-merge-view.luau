-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local useMotion_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out").useMotion
local u1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local useEffect_upv_1 = u1.useEffect
local useRef_upv_1 = u1.useRef
local useState_upv_1 = u1.useState
local useAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-charm", "src").useAtom
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-px")
local useOrientation_upv_1 = v1.useOrientation
local usePx_upv_1 = v1.usePx
local useViewportSize_upv_1 = v1.useViewportSize
local useTheme_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "theme", "theme-context").useTheme
local formatCompactNumber_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "format-number").formatCompactNumber
local v2 = RuntimeLib_1.import(script, script.Parent, "board-atom")
local numberMergeBoardAtom_upv_1 = v2.numberMergeBoardAtom
local numberMergeControlsAtom_upv_1 = v2.numberMergeControlsAtom
local chainColor_upv_1 = RuntimeLib_1.import(script, script.Parent, "chain-colors").chainColor
local NUMBER_MERGE_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "number-merge-config").NUMBER_MERGE_CONFIG
local tileLabel_upv_1 = RuntimeLib_1.import(script, script.Parent, "tile-label").tileLabel
local columns_upv_1 = NUMBER_MERGE_CONFIG_upv_1.columns
local rows_upv_1 = NUMBER_MERGE_CONFIG_upv_1.rows
local tbl_upv_1 = {}
tbl_upv_1.style = Enum.EasingStyle.Quad
tbl_upv_1.direction = Enum.EasingDirection.InOut
local tbl_upv_2 = {}
tbl_upv_2.style = Enum.EasingStyle.Quad
tbl_upv_2.direction = Enum.EasingDirection.In
local tbl_upv_3 = {}
tbl_upv_3.style = Enum.EasingStyle.Quad
tbl_upv_3.direction = Enum.EasingDirection.Out
local tbl_upv_4 = {}
tbl_upv_4.style = Enum.EasingStyle.Back
tbl_upv_4.direction = Enum.EasingDirection.Out
local tbl_upv_5 = {}
tbl_upv_5.style = Enum.EasingStyle.Quad
tbl_upv_5.direction = Enum.EasingDirection.Out
local tbl_upv_6 = {}
tbl_upv_6.style = Enum.EasingStyle.Quad
tbl_upv_6.direction = Enum.EasingDirection.Out
local tbl_upv_7 = {}
tbl_upv_7.style = Enum.EasingStyle.Quad
tbl_upv_7.direction = Enum.EasingDirection.In
local tbl_upv_8 = {}
tbl_upv_8.style = Enum.EasingStyle.Quad
tbl_upv_8.direction = Enum.EasingDirection.Out
local tbl_upv_9 = {}
tbl_upv_9.style = Enum.EasingStyle.Quad
tbl_upv_9.direction = Enum.EasingDirection.In
local u2 = Color3.fromRGB(255, 255, 255)
local u3 = TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
local v3 = Color3.fromRGB(119, 110, 101)
local v4 = Color3.fromRGB(249, 246, 242)
local u4 = Color3.fromRGB(16, 16, 20)
local tbl_10 = {}
tbl_10.background = Color3.fromRGB(237, 224, 200)
tbl_10.text = v3
local tbl_11 = {}
tbl_11.background = Color3.fromRGB(242, 177, 121)
tbl_11.text = v4
local tbl_12 = {}
tbl_12.background = Color3.fromRGB(245, 149, 99)
tbl_12.text = v4
local tbl_13 = {}
tbl_13.background = Color3.fromRGB(246, 124, 95)
tbl_13.text = v4
local tbl_14 = {}
tbl_14.background = Color3.fromRGB(246, 94, 59)
tbl_14.text = v4
local tbl_15 = {}
tbl_15.background = Color3.fromRGB(237, 207, 114)
tbl_15.text = v4
local tbl_16 = {}
tbl_16.background = Color3.fromRGB(237, 204, 97)
tbl_16.text = v4
local tbl_17 = {}
tbl_17.background = Color3.fromRGB(237, 200, 80)
tbl_17.text = v4
local tbl_18 = {}
tbl_18.background = Color3.fromRGB(237, 197, 63)
tbl_18.text = v4
local tbl_19 = {}
tbl_19.background = Color3.fromRGB(237, 194, 46)
tbl_19.text = v4
local tbl_upv_20 = {{background = Color3.fromRGB(238, 228, 218), text = v3}, tbl_10, tbl_11, tbl_12, tbl_13, tbl_14, tbl_15, tbl_16, tbl_17, tbl_18, tbl_19}
local u5 = Color3.fromRGB(12, 12, 16)
local u6 = Color3.fromRGB(255, 255, 255)
local function stepsPast_1(a1, a2)
    --[[
      name: stepsPast
      line: 172
    ]]
    local v5 = 0
    local v6 = a1
    while a2 < v6 and v5 < 1100 do
        v6 = v6 / 2
        v5 = v5 + 1
    end
    return v5
end
local function neonHue_1(a1)
    --[[
      name: neonHue
      line: 182
    ]]
    return (a1 * 0.135) % 1
end
local tbl_upv_21 = {}
tbl_upv_21.background = Color3.fromRGB(60, 58, 50)
tbl_upv_21.text = v4
local u7 = Color3.fromRGB(240, 180, 40)
local u8 = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0.85, 1)), ColorSequenceKeypoint.new(0.17, Color3.fromHSV(0.17, 0.85, 1)), ColorSequenceKeypoint.new(0.33, Color3.fromHSV(0.33, 0.85, 1)), ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.5, 0.85, 1)), ColorSequenceKeypoint.new(0.67, Color3.fromHSV(0.67, 0.85, 1)), ColorSequenceKeypoint.new(0.83, Color3.fromHSV(0.83, 0.85, 1)), ColorSequenceKeypoint.new(1, Color3.fromHSV(1, 0.85, 1))})
local u9 = TweenInfo.new(2.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false)
local u10 = Color3.fromRGB(255, 255, 255)
local tbl_upv_22 = {}
tbl_upv_22.style = Enum.EasingStyle.Quad
tbl_upv_22.direction = Enum.EasingDirection.Out
local tbl_upv_23 = {}
local function strokeForStep_upv_1(a1)
    --[[
      name: strokeForStep
      line: 216
      upvalues:
        tbl_upv_20 (copy, index: 1)
        u10 (copy, index: 2)
    ]]
    local v7 = tbl_upv_20[a1 + 1]
    local v8 = nil
    if v7 == nil then
        v8 = a1 - #tbl_upv_20
        if v8 >= 8 then
            local tbl_24 = {}
            tbl_24.color = u10
            return tbl_24
        else
            local tbl_25 = {}
            tbl_25.color = Color3.fromHSV((v8 * 0.135) % 1, 0.85, 1)
            return tbl_25
        end
    else
        local tbl_26 = {}
        tbl_26.color = v7.background
        return tbl_26
    end
end
local function RainbowGradient_upv_1()
    --[[
      name: RainbowGradient
      line: 268
      upvalues:
        useRef_upv_1 (copy, index: 1)
        useEffect_upv_1 (copy, index: 2)
        TweenService_upv_1 (copy, index: 3)
        u9 (copy, index: 4)
        u1 (copy, index: 5)
        u8 (copy, index: 6)
    ]]
    local u11 = useRef_upv_1()
    useEffect_upv_1(
        function()
            --[[
              line: 270
              upvalues:
                u11 (copy, index: 1)
                TweenService_upv_1 (copy, index: 2)
                u9 (copy, index: 3)
            ]]
            local current_1 = u11.current
            if current_1 ~= nil then
                local u12 = TweenService_upv_1:Create(current_1, u9, {})
                u12:Play()
                return function()
                    --[[
                      line: 279
                      upvalues:
                        u12 (copy, index: 1)
                    ]]
                    return u12:Cancel()
                end
            end
            return nil
        end,
        {}
    )
    return u1.createElement("uigradient", {ref = u11, Color = u8})
end
local function useGeometry_upv_1()
    --[[
      name: useGeometry
      line: 310
      upvalues:
        usePx_upv_1 (copy, index: 1)
        useOrientation_upv_1 (copy, index: 2)
        useViewportSize_upv_1 (copy, index: 3)
        columns_upv_1 (copy, index: 4)
        rows_upv_1 (copy, index: 5)
    ]]
    local v9 = usePx_upv_1()
    local v10 = useOrientation_upv_1() == "portrait"
    local v11 = useViewportSize_upv_1()
    local v12 = v9(6)
    local v13 = math.floor(((v11.X - v9(28)) - ((columns_upv_1 + 1) * v12)) / columns_upv_1)
    local v14 = math.floor(((v11.Y * 0.55) - ((rows_upv_1 + 1) * v12)) / rows_upv_1)
    local v15
    if v10 then
        v15 = math.clamp(math.min(v13, v14), v9(40), v9(96))
    else
        v15 = v9(52)
    end
    local tbl_27 = {}
    tbl_27.cell = v15
    tbl_27.gap = v12
    tbl_27.boardWidth = (columns_upv_1 * v15) + ((columns_upv_1 + 1) * v12)
    tbl_27.boardHeight = (rows_upv_1 * v15) + ((rows_upv_1 + 1) * v12)
    return tbl_27
end
local function slotCenter_1(a1, a2, a3)
    --[[
      name: slotCenter
      line: 328
      upvalues:
        rows_upv_1 (copy, index: 1)
    ]]
    return Vector2.new((a1.gap + (a2 * (a1.cell + a1.gap))) + (a1.cell / 2), (a1.gap + (((rows_upv_1 - 1) - a3) * (a1.cell + a1.gap))) + (a1.cell / 2))
end
local function TileDecor_upv_1(a1)
    --[[
      name: TileDecor
      line: 290
      upvalues:
        u1 (copy, index: 1)
        RainbowGradient_upv_1 (copy, index: 2)
    ]]
    local style_1 = a1.style
    local strokeThickness_1 = a1.strokeThickness
    local strokeTransparency_1 = a1.strokeTransparency
    local isRainbowFill_1 = style_1.isRainbowFill
    local v16 = isRainbowFill_1 and (u1.createElement(RainbowGradient_upv_1))
    local v17 = style_1.stroke ~= nil
    local v18 = nil
    if v17 then
        local tbl_28 = {}
        tbl_28.Color = style_1.stroke.color
        tbl_28.Thickness = strokeThickness_1
        v18 = strokeTransparency_1
        if v18 == nil then
            v18 = 0
        end
        tbl_28.Transparency = v18
        local createElement_1 = u1.createElement
        local v19 = style_1.stroke.isRainbow and (u1.createElement(RainbowGradient_upv_1))
        v17 = createElement_1("uistroke", tbl_28, v19)
    end
    return u1.createElement(u1.Fragment, nil, v16, v17)
end
local function tileStyle_upv_1(a1)
    --[[
      name: tileStyle
      line: 236
      upvalues:
        u5 (copy, index: 1)
        u6 (copy, index: 2)
        strokeForStep_upv_1 (copy, index: 3)
        u10 (copy, index: 4)
        u4 (copy, index: 5)
        tbl_upv_20 (copy, index: 6)
        tbl_upv_21 (copy, index: 7)
    ]]
    if a1 < 4194304 then
        if a1 < 1048576 then
            local v20 = nil
            if a1 < 4096 then
                local v21, v22 = a1, 0
                while v21 > 2 and v22 < 1100 do
                    v21 = v21 / 2
                    v22 = v22 + 1
                end
                v20 = tbl_upv_20[v22 + 1] or tbl_upv_21
                local tbl_29 = {}
                tbl_29.background = v20.background
                tbl_29.text = v20.text
                return tbl_29
            else
                local v23 = 0
                local v24 = a1
                while v24 > 4096 and v23 < 1100 do
                    v24 = v24 / 2
                    v23 = v23 + 1
                end
                local tbl_30 = {}
                tbl_30.background = Color3.fromHSV((v23 * 0.135) % 1, 0.85, 1)
                tbl_30.text = u4
                return tbl_30
            end
        else
            local tbl_31 = {}
            tbl_31.background = u10
            tbl_31.text = u4
            return tbl_31
        end
    else
        local tbl_32 = {}
        tbl_32.background = u5
        tbl_32.text = u6
        local v24 = 0
        local v22 = a1
        while v22 > 4194304 and v24 < 1100 do
            v22 = v22 / 2
            v24 = v24 + 1
        end
        tbl_32.stroke = strokeForStep_upv_1(v24)
        return tbl_32
    end
end
local function ScorePopup_upv_1(a1)
    --[[
      name: ScorePopup
      line: 418
      upvalues:
        usePx_upv_1 (copy, index: 1)
        useMotion_upv_1 (copy, index: 2)
        useEffect_upv_1 (copy, index: 3)
        tbl_upv_6 (copy, index: 4)
        tbl_upv_7 (copy, index: 5)
        u1 (copy, index: 6)
        u7 (copy, index: 7)
    ]]
    local center_upv_1 = a1.center
    local u13 = usePx_upv_1()
    local v25, u14 = useMotion_upv_1(0)
    local v26, u15 = useMotion_upv_1(0)
    useEffect_upv_1(
        function()
            --[[
              line: 424
              upvalues:
                u14 (copy, index: 1)
                u13 (copy, index: 2)
                tbl_upv_6 (copy, index: 3)
                u15 (copy, index: 4)
                tbl_upv_7 (copy, index: 5)
            ]]
            u14:tween(-u13(48), tbl_upv_6)
            local u16 = false
            task.delay(
                0.28,
                function()
                    --[[
                      line: 428
                      upvalues:
                        u16 (ref,  index: 1)
                        u15 (copy, index: 2)
                        tbl_upv_7 (copy, index: 3)
                    ]]
                    if (u16) then
                        return
                    end
                    u15:tween(1, tbl_upv_7)
                end
            )
            return function()
                --[[
                  line: 433
                  upvalues:
                    u16 (ref, index: 1)
                ]]
                u16 = true
            end
        end,
        {}
    )
    return u1.createElement(
        "textlabel",
        {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v25:map(
                function(a2)
                    --[[
                      line: 440
                      upvalues:
                        center_upv_1 (copy, index: 1)
                    ]]
                    return UDim2.fromOffset(center_upv_1.X, center_upv_1.Y + a2)
                end
            ),
            Size = UDim2.fromOffset(u13(110), u13(34)),
            Font = Enum.Font.GothamBlack,
            Text = a1.text,
            TextColor3 = u7,
            TextTransparency = v26,
            TextStrokeTransparency = v26:map(
                function(a3)
                    --[[
                      line: 448
                    ]]
                    return 0.6 + (a3 * 0.4)
                end
            )
        }
    )
end
local function WipeGhost_upv_1(a1)
    --[[
      name: WipeGhost
      line: 510
      upvalues:
        usePx_upv_1 (copy, index: 1)
        useMotion_upv_1 (copy, index: 2)
        useEffect_upv_1 (copy, index: 3)
        tbl_upv_9 (copy, index: 4)
        tileStyle_upv_1 (copy, index: 5)
        u1 (copy, index: 6)
        TileDecor_upv_1 (copy, index: 7)
    ]]
    local center_2 = a1.center
    local geometry_1 = a1.geometry
    local delaySeconds_upv_1 = a1.delaySeconds
    local v27 = usePx_upv_1()
    local v28, u17 = useMotion_upv_1(1)
    local v29, u18 = useMotion_upv_1(0)
    useEffect_upv_1(
        function()
            --[[
              line: 518
              upvalues:
                delaySeconds_upv_1 (copy, index: 1)
                u17 (copy, index: 2)
                tbl_upv_9 (copy, index: 3)
                u18 (copy, index: 4)
            ]]
            if delaySeconds_upv_1 > 0 then
                local u19 = false
                task.delay(
                    delaySeconds_upv_1,
                    function()
                        --[[
                          line: 525
                          upvalues:
                            u19 (ref,  index: 1)
                            u17 (copy, index: 2)
                            tbl_upv_9 (copy, index: 3)
                            u18 (copy, index: 4)
                        ]]
                        if u19 then
                            return nil
                        end
                        u17:tween(0.1, tbl_upv_9)
                        u18:tween(1, tbl_upv_9)
                    end
                )
                return function()
                    --[[
                      line: 532
                      upvalues:
                        u19 (ref, index: 1)
                    ]]
                    u19 = true
                end
            end
            u17:tween(0.1, tbl_upv_9)
            u18:tween(1, tbl_upv_9)
            return nil
        end,
        {}
    )
    local v30 = tileStyle_upv_1(a1.value)
    local v31 = u1.createElement("uiscale", {Scale = v28})
    local v32 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, v27(6))})
    local tbl_33 = {}
    tbl_33.style = v30
    tbl_33.strokeThickness = v27(3)
    tbl_33.strokeTransparency = v29
    return u1.createElement("frame", {BackgroundColor3 = v30.background, BackgroundTransparency = v29, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(center_2.X, center_2.Y), Size = UDim2.fromOffset(geometry_1.cell, geometry_1.cell)}, v31, v32, u1.createElement(TileDecor_upv_1, tbl_33))
end
local function TileView_upv_1(a1)
    --[[
      name: TileView
      line: 333
      upvalues:
        usePx_upv_1 (copy, index: 1)
        rows_upv_1 (copy, index: 2)
        useMotion_upv_1 (copy, index: 3)
        useRef_upv_1 (copy, index: 4)
        useEffect_upv_1 (copy, index: 5)
        tbl_upv_1 (copy, index: 6)
        tbl_upv_2 (copy, index: 7)
        tbl_upv_4 (copy, index: 8)
        tbl_upv_3 (copy, index: 9)
        tbl_upv_5 (copy, index: 10)
        tileStyle_upv_1 (copy, index: 11)
        u1 (copy, index: 12)
        TileDecor_upv_1 (copy, index: 13)
        tileLabel_upv_1 (copy, index: 14)
    ]]
    local tile_1 = a1.tile
    local geometry_upv_2 = a1.geometry
    local v33 = usePx_upv_1()
    local u20 = Vector2.new((geometry_upv_2.gap + (tile_1.column * (geometry_upv_2.cell + geometry_upv_2.gap))) + (geometry_upv_2.cell / 2), (geometry_upv_2.gap + (((rows_upv_1 - 1) - tile_1.row) * (geometry_upv_2.cell + geometry_upv_2.gap))) + (geometry_upv_2.cell / 2))
    local v34, u21 = useMotion_upv_1(u20.X)
    local v35, u22 = useMotion_upv_1(u20.Y)
    local v36, u23 = useMotion_upv_1(0)
    local v37, u24 = useMotion_upv_1(1)
    local u25 = useRef_upv_1(true)
    useEffect_upv_1(
        function()
            --[[
              line: 343
              upvalues:
                u21 (copy, index: 1)
                u20 (copy, index: 2)
                tbl_upv_1 (copy, index: 3)
            ]]
            u21:tween(u20.X, tbl_upv_1)
        end,
        {tile_1.column}
    )
    useEffect_upv_1(
        function()
            --[[
              line: 346
              upvalues:
                u22 (copy, index: 1)
                u20 (copy, index: 2)
                tbl_upv_1 (copy, index: 3)
            ]]
            u22:tween(u20.Y, tbl_upv_1)
        end,
        {tile_1.row}
    )
    useEffect_upv_1(
        function()
            --[[
              line: 350
              upvalues:
                u25 (copy, index: 1)
                u21 (copy, index: 2)
                u20 (copy, index: 3)
                u22 (copy, index: 4)
            ]]
            if u25.current then
                return nil
            end
            u21:immediate(u20.X)
            u22:immediate(u20.Y)
        end,
        {geometry_upv_2.cell}
    )
    useEffect_upv_1(
        function()
            --[[
              line: 358
              upvalues:
                u25 (copy, index: 1)
                u22 (copy, index: 2)
                geometry_upv_2 (copy, index: 3)
                u20 (copy, index: 4)
                tbl_upv_2 (copy, index: 5)
                u23 (copy, index: 6)
                tbl_upv_4 (copy, index: 7)
                tbl_upv_3 (copy, index: 8)
                u24 (copy, index: 9)
                tbl_upv_5 (copy, index: 10)
            ]]
            if u25.current then
                u25.current = false
                u22:immediate(-geometry_upv_2.cell)
                u22:tween(u20.Y, tbl_upv_2)
                u23:immediate(0.4)
                u23:tween(1, tbl_upv_4)
                return nil
            end
            u23:immediate(1.22)
            u23:tween(1, tbl_upv_3)
            u24:immediate(0.25)
            u24:tween(1, tbl_upv_5)
        end,
        {tile_1.value}
    )
    local v38 = tileStyle_upv_1(tile_1.value)
    local v39 = u1.createElement("uiscale", {Scale = v36})
    local v40 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, v33(6))})
    local v41 = u1.createElement(TileDecor_upv_1, {style = v38, strokeThickness = v33(3)})
    local tbl_34 = {}
    tbl_34.CornerRadius = UDim.new(0, v33(6))
    local v42 = u1.createElement("frame", {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = v37, Size = UDim2.fromScale(1, 1)}, u1.createElement("uicorner", tbl_34))
    local tbl_35 = {}
    tbl_35.Size = UDim2.fromScale(0.86, 0.6)
    tbl_35.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl_35.Position = UDim2.fromScale(0.5, 0.5)
    tbl_35.Font = Enum.Font.GothamBlack
    tbl_35.Text = tileLabel_upv_1(tile_1.value)
    tbl_35.TextColor3 = v38.text
    return u1.createElement(
        "frame",
        {
            BackgroundColor3 = v38.background,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = u1.joinBindings({x = v34, y = v35}):map(
                function(a2)
                    --[[
                      line: 384
                    ]]
                    return UDim2.fromOffset(a2.x, a2.y)
                end
            ),
            Size = UDim2.fromOffset(geometry_upv_2.cell, geometry_upv_2.cell)
        },
        v39,
        v40,
        v41,
        v42,
        u1.createElement("textlabel", tbl_35)
    )
end
local function DangerColumnPulse_upv_1(a1)
    --[[
      name: DangerColumnPulse
      line: 556
      upvalues:
        useTheme_upv_1 (copy, index: 1)
        usePx_upv_1 (copy, index: 2)
        useRef_upv_1 (copy, index: 3)
        useEffect_upv_1 (copy, index: 4)
        TweenService_upv_1 (copy, index: 5)
        u3 (copy, index: 6)
        u1 (copy, index: 7)
    ]]
    local geometry_3 = a1.geometry
    local v43 = useTheme_upv_1()
    local v44 = usePx_upv_1()
    local u26 = useRef_upv_1()
    useEffect_upv_1(
        function()
            --[[
              line: 562
              upvalues:
                u26 (copy, index: 1)
                TweenService_upv_1 (copy, index: 2)
                u3 (copy, index: 3)
            ]]
            local current_2 = u26.current
            if current_2 ~= nil then
                local u27 = TweenService_upv_1:Create(current_2, u3, {})
                u27:Play()
                return function()
                    --[[
                      line: 571
                      upvalues:
                        u27 (copy, index: 1)
                    ]]
                    return u27:Cancel()
                end
            end
            return nil
        end,
        {}
    )
    local tbl_36 = {}
    tbl_36.CornerRadius = UDim.new(0, v44(6))
    return u1.createElement("frame", {ref = u26, BackgroundColor3 = v43.palette.danger, Position = UDim2.fromOffset(geometry_3.gap + (a1.column * (geometry_3.cell + geometry_3.gap)), geometry_3.gap), Size = UDim2.fromOffset(geometry_3.cell, geometry_3.boardHeight - (geometry_3.gap * 2))}, u1.createElement("uicorner", tbl_36))
end
local function CenterStamp_upv_1(a1)
    --[[
      name: CenterStamp
      line: 456
      upvalues:
        useMotion_upv_1 (copy, index: 1)
        useEffect_upv_1 (copy, index: 2)
        tbl_upv_7 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local color_1 = a1.color
    local v45, u28 = useMotion_upv_1(0.4)
    local v46, u29 = useMotion_upv_1(0)
    local v47, u30 = useMotion_upv_1(-8)
    useEffect_upv_1(
        function()
            --[[
              line: 462
              upvalues:
                u28 (copy, index: 1)
                u30 (copy, index: 2)
                u29 (copy, index: 3)
                tbl_upv_7 (copy, index: 4)
            ]]
            u28:immediate(0.4)
            u28:tween(1, {style = Enum.EasingStyle.Back, direction = Enum.EasingDirection.Out})
            u30:immediate(-8)
            u30:spring(0, {})
            local u31 = false
            task.delay(
                0.4,
                function()
                    --[[
                      line: 475
                      upvalues:
                        u31 (ref,  index: 1)
                        u29 (copy, index: 2)
                        tbl_upv_7 (copy, index: 3)
                    ]]
                    if (u31) then
                        return
                    end
                    u29:tween(1, tbl_upv_7)
                end
            )
            return function()
                --[[
                  line: 480
                  upvalues:
                    u31 (ref, index: 1)
                ]]
                u31 = true
            end
        end,
        {}
    )
    local v48 = u1.createElement("uiscale", {Scale = v45})
    local tbl_37 = {}
    tbl_37.Color = color_1
    tbl_37.Transparency = v46:map(
        function(a2)
            --[[
              line: 504
            ]]
            return 0.2 + (a2 * 0.8)
        end
    )
    return u1.createElement(
        "textlabel",
        {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.42),
            Rotation = v47,
            Size = UDim2.fromScale(0.95, 0.18),
            Font = Enum.Font.GothamBlack,
            Text = a1.text,
            TextColor3 = color_1,
            TextTransparency = v46,
            TextStrokeTransparency = v46:map(
                function(a3)
                    --[[
                      line: 494
                    ]]
                    return 0.3 + (a3 * 0.7)
                end
            )
        },
        v48,
        u1.createElement("uistroke", tbl_37)
    )
end
local tbl_38 = {}
tbl_38.NumberMergeView = function()
    --[[
      name: NumberMergeView
      line: 589
      upvalues:
        useAtom_upv_1 (copy, index: 1)
        numberMergeBoardAtom_upv_1 (copy, index: 2)
        numberMergeControlsAtom_upv_1 (copy, index: 3)
        useTheme_upv_1 (copy, index: 4)
        usePx_upv_1 (copy, index: 5)
        useOrientation_upv_1 (copy, index: 6)
        useGeometry_upv_1 (copy, index: 7)
        useState_upv_1 (copy, index: 8)
        useMotion_upv_1 (copy, index: 9)
        useRef_upv_1 (copy, index: 10)
        useEffect_upv_1 (copy, index: 11)
        rows_upv_1 (copy, index: 12)
        formatCompactNumber_upv_1 (copy, index: 13)
        chainColor_upv_1 (copy, index: 14)
        tbl_upv_22 (copy, index: 15)
        tbl_upv_8 (copy, index: 16)
        tileLabel_upv_1 (copy, index: 17)
        u7 (copy, index: 18)
        NUMBER_MERGE_CONFIG_upv_1 (copy, index: 19)
        tbl_upv_23 (copy, index: 20)
        u2 (copy, index: 21)
        u1 (copy, index: 22)
        columns_upv_1 (copy, index: 23)
        tileStyle_upv_1 (copy, index: 24)
        TileView_upv_1 (copy, index: 25)
        WipeGhost_upv_1 (copy, index: 26)
        DangerColumnPulse_upv_1 (copy, index: 27)
        ScorePopup_upv_1 (copy, index: 28)
        CenterStamp_upv_1 (copy, index: 29)
        TileDecor_upv_1 (copy, index: 30)
    ]]
    local u32 = useAtom_upv_1(numberMergeBoardAtom_upv_1)
    local u33 = useAtom_upv_1(numberMergeControlsAtom_upv_1)
    local u34 = useTheme_upv_1()
    local u35 = usePx_upv_1()
    local u36 = useOrientation_upv_1() == "portrait"
    local u37 = useGeometry_upv_1()
    local v49, u38 = useState_upv_1({})
    local v50, u39 = useState_upv_1({})
    local v51, u40 = useState_upv_1(nil)
    local v52, u41 = useMotion_upv_1(1)
    local v53, u42 = useState_upv_1(Color3.fromRGB(255, 255, 255))
    local v54, u43 = useMotion_upv_1(1)
    local v55, u44 = useMotion_upv_1(0)
    local v56, u45 = useMotion_upv_1(0)
    local u46 = useRef_upv_1(0)
    local u47 = useRef_upv_1(true)
    useEffect_upv_1(
        function()
            --[[
              line: 616
              upvalues:
                u47 (copy, index: 1)
            ]]
            return function()
                --[[
                  line: 617
                  upvalues:
                    u47 (copy, index: 1)
                ]]
                u47.current = false
            end
        end,
        {}
    )
    local lastMergeNonce_1 = u32
    if lastMergeNonce_1 ~= nil then
        lastMergeNonce_1 = lastMergeNonce_1.lastMergeNonce
    end
    local v57
    if lastMergeNonce_1 ~= nil then
        v57 = lastMergeNonce_1
    else
        v57 = 0
    end
    local wipeNonce_1 = u32
    if wipeNonce_1 ~= nil then
        wipeNonce_1 = wipeNonce_1.wipeNonce
    end
    local v58
    if wipeNonce_1 ~= nil then
        v58 = wipeNonce_1
    else
        v58 = 0
    end
    useEffect_upv_1(
        function()
            --[[
              line: 639
              upvalues:
                u32 (copy, index: 1)
                u46 (copy, index: 2)
                u37 (copy, index: 3)
                rows_upv_1 (copy, index: 4)
                formatCompactNumber_upv_1 (copy, index: 5)
                u38 (copy, index: 6)
                chainColor_upv_1 (copy, index: 7)
                u42 (copy, index: 8)
                u43 (copy, index: 9)
                tbl_upv_22 (copy, index: 10)
                u41 (copy, index: 11)
                tbl_upv_8 (copy, index: 12)
                u40 (copy, index: 13)
                tileLabel_upv_1 (copy, index: 14)
                u7 (copy, index: 15)
                NUMBER_MERGE_CONFIG_upv_1 (copy, index: 16)
                u35 (copy, index: 17)
                u44 (copy, index: 18)
                u45 (copy, index: 19)
                tbl_upv_23 (copy, index: 20)
                u47 (copy, index: 21)
            ]]
            if u32 == nil then
                return nil
            else
                local v59 = nil
                if #u32.merges ~= 0 then
                    local merges_1 = u32.merges
                    local u48 = table.create(#merges_1)
                    local function v60(a1)
                        --[[
                          line: 646
                          upvalues:
                            u46 (copy, index: 1)
                            u37 (copy, index: 2)
                            rows_upv_1 (copy, index: 3)
                            formatCompactNumber_upv_1 (copy, index: 4)
                        ]]
                        u46.current = u46.current + 1
                        local tbl_39 = {}
                        tbl_39.id = u46.current
                        tbl_39.center = Vector2.new((u37.gap + (a1.column * (u37.cell + u37.gap))) + (u37.cell / 2), (u37.gap + (((rows_upv_1 - 1) - a1.row) * (u37.cell + u37.gap))) + (u37.cell / 2))
                        local v61
                        if a1.scoreMultiplier <= 1 then
                            v61 = ("+%*"):format(formatCompactNumber_upv_1(a1.points))
                        else
                            v61 = ("+%* \195\151%*!"):format(formatCompactNumber_upv_1(a1.points), a1.scoreMultiplier)
                        end
                        tbl_39.text = v61
                        return tbl_39
                    end
                    for key_1, value_1 in merges_1 do
                        u48[key_1] = v60(value_1, key_1 - 1, merges_1)
                    end
                    u38(
                        function(a2)
                            --[[
                              line: 659
                              upvalues:
                                u48 (copy, index: 1)
                            ]]
                            local tbl_40 = {}
                            local v62 = #tbl_40
                            local v63 = #a2
                            table.move(a2, 1, v63, v62 + 1, tbl_40)
                            table.move(u48, 1, #u48, (v62 + v63) + 1, tbl_40)
                            return tbl_40
                        end
                    )
                    v59 = u32.chainDepth
                    if v59 >= 2 then
                        u42((chainColor_upv_1(v59)))
                        u43:immediate((math.max(0.78 - (v59 * 0.04), 0.5)))
                        u43:tween(1, tbl_upv_22)
                        u41:immediate((math.min(v59, 8) * 0.012) + 1)
                        u41:tween(1, tbl_upv_8)
                    end
                    local v64 = false
                    if u32.milestone ~= nil then
                        v64 = u32.milestone.nonce == u32.lastMergeNonce
                    end
                    if v64 and u32.milestone ~= nil then
                        u46.current = u46.current + 1
                        local current_upv_3 = u46.current
                        u40({id = current_upv_3, text = ("%*!"):format(tileLabel_upv_1(u32.milestone.value)), color = u7})
                        u41:immediate(1.08)
                        u41:tween(1, tbl_upv_8)
                        task.delay(
                            1.0499999999999998,
                            function()
                                --[[
                                  line: 691
                                  upvalues:
                                    u40 (copy, index: 1)
                                    current_upv_3 (copy, index: 2)
                                ]]
                                u40(
                                    function(a3)
                                        --[[
                                          line: 692
                                          upvalues:
                                            current_upv_3 (copy, index: 1)
                                        ]]
                                        if a3 ~= nil and a3.id == current_upv_3 then
                                            return nil
                                        end
                                        return a3
                                    end
                                )
                            end
                        )
                    end
                    if v64 or NUMBER_MERGE_CONFIG_upv_1.chainStampMinDepth <= v59 then
                        local v65 = u35(math.min(v59, 7) * 1.6)
                        u44:immediate((((u32.lastMergeNonce % 2 ~= 0) and -1) or 1) * v65)
                        u45:immediate(-v65 * 0.6)
                        u44:spring(0, tbl_upv_23)
                        u45:spring(0, tbl_upv_23)
                    end
                    task.delay(
                        0.6,
                        function()
                            --[[
                              line: 706
                              upvalues:
                                u47 (copy, index: 1)
                                u38 (copy, index: 2)
                                u48 (copy, index: 3)
                            ]]
                            if u47.current then
                                u38(
                                    function(a4)
                                        --[[
                                          line: 710
                                          upvalues:
                                            u48 (copy, index: 1)
                                        ]]
                                        local tbl_41 = {}
                                        local v66 = 0
                                        local function v67(a5)
                                            --[[
                                              line: 713
                                              upvalues:
                                                u48 (copy, index: 1)
                                            ]]
                                            local v68 = false
                                            for _, value_2 in u48 do
                                                if value_2.id == a5.id then
                                                    v68 = true
                                                    break
                                                end
                                            end
                                            return not v68
                                        end
                                        for key_2, value_3 in a4 do
                                            if v67(value_3, key_2 - 1, a4) == true then
                                                v66 = v66 + 1
                                                tbl_41[v66] = value_3
                                            end
                                        end
                                        return tbl_41
                                    end
                                )
                            else
                                return nil
                            end
                        end
                    )
                else
                    return nil
                end
            end
        end,
        {v57}
    )
    useEffect_upv_1(
        function()
            --[[
              line: 744
              upvalues:
                u32 (copy, index: 1)
                u46 (copy, index: 2)
                u37 (copy, index: 3)
                rows_upv_1 (copy, index: 4)
                u39 (copy, index: 5)
                u42 (copy, index: 6)
                u2 (copy, index: 7)
                u43 (copy, index: 8)
                tbl_upv_22 (copy, index: 9)
                u41 (copy, index: 10)
                tbl_upv_8 (copy, index: 11)
                u35 (copy, index: 12)
                u44 (copy, index: 13)
                u45 (copy, index: 14)
                tbl_upv_23 (copy, index: 15)
                u47 (copy, index: 16)
            ]]
            if u32 ~= nil and #u32.wiped ~= 0 then
                local u49 = false
                if #u32.merges == 0 then
                    u49 = #u32.wiped >= 2
                end
                local u50 = 0
                local wiped_1 = u32.wiped
                local u51 = table.create(#wiped_1)
                local function v69(a6)
                    --[[
                      line: 753
                      upvalues:
                        u46 (copy, index: 1)
                        u49 (copy, index: 2)
                        u50 (ref,  index: 3)
                        u37 (copy, index: 4)
                        rows_upv_1 (copy, index: 5)
                    ]]
                    u46.current = u46.current + 1
                    local v70 = (u49 and (a6.row * 0.035)) or 0
                    u50 = math.max(u50, v70)
                    local tbl_42 = {}
                    tbl_42.id = u46.current
                    tbl_42.center = Vector2.new((u37.gap + (a6.column * (u37.cell + u37.gap))) + (u37.cell / 2), (u37.gap + (((rows_upv_1 - 1) - a6.row) * (u37.cell + u37.gap))) + (u37.cell / 2))
                    tbl_42.value = a6.value
                    tbl_42.delaySeconds = v70
                    return tbl_42
                end
                for key_3, value_4 in wiped_1 do
                    u51[key_3] = v69(value_4, key_3 - 1, wiped_1)
                end
                u39(
                    function(a7)
                        --[[
                          line: 769
                          upvalues:
                            u51 (copy, index: 1)
                        ]]
                        local tbl_43 = {}
                        local v71 = #tbl_43
                        local v72 = #a7
                        table.move(a7, 1, v72, v71 + 1, tbl_43)
                        table.move(u51, 1, #u51, (v71 + v72) + 1, tbl_43)
                        return tbl_43
                    end
                )
                if u49 then
                    u42(u2)
                    u43:immediate(0.55)
                    u43:tween(1, tbl_upv_22)
                    u41:immediate(1.06)
                    u41:tween(1, tbl_upv_8)
                    local v73 = u35(8)
                    u44:immediate((((u32.wipeNonce % 2 ~= 0) and -1) or 1) * v73)
                    u45:immediate(-v73 * 0.6)
                    u44:spring(0, tbl_upv_23)
                    u45:spring(0, tbl_upv_23)
                end
                task.delay(
                    u50 + 0.35,
                    function()
                        --[[
                          line: 791
                          upvalues:
                            u47 (copy, index: 1)
                            u39 (copy, index: 2)
                            u51 (copy, index: 3)
                        ]]
                        if u47.current then
                            u39(
                                function(a8)
                                    --[[
                                      line: 795
                                      upvalues:
                                        u51 (copy, index: 1)
                                    ]]
                                    local tbl_44 = {}
                                    local v74 = 0
                                    local function v75(a9)
                                        --[[
                                          line: 798
                                          upvalues:
                                            u51 (copy, index: 1)
                                        ]]
                                        local v76 = false
                                        for _, value_5 in u51 do
                                            if value_5.id == a9.id then
                                                v76 = true
                                                break
                                            end
                                        end
                                        return not v76
                                    end
                                    for key_4, value_6 in a8 do
                                        if v75(value_6, key_4 - 1, a8) == true then
                                            v74 = v74 + 1
                                            tbl_44[v74] = value_6
                                        end
                                    end
                                    return tbl_44
                                end
                            )
                        else
                            return nil
                        end
                    end
                )
            else
                return nil
            end
        end,
        {v58}
    )
    if u32 ~= nil then
        local tbl_45 = {}
        for n_1 = 0, columns_upv_1 - 1 do
            table.insert(tbl_45, n_1)
        end
        local tbl_upv_46 = {}
        for n_2 = 0, rows_upv_1 - 1 do
            table.insert(tbl_upv_46, n_2)
        end
        local tbl_47 = {}
        for _ = 0, columns_upv_1 - 1 do
            table.insert(tbl_47, 0)
        end
        for v77, value_7 in u32.tiles do
            tbl_47[value_7.column + 1] = math.max(tbl_47[value_7.column + 1], value_7.row + 1)
        end
        local tbl_48 = {}
        local v77 = 0
        for key_5, value_8 in tbl_45 do
            if (rows_upv_1 - NUMBER_MERGE_CONFIG_upv_1.dangerSlotsFromTop) <= tbl_47[value_8 + 1] == true then
                local v79 = v77 + 1
                tbl_48[v79] = value_8
                v77 = v79
            end
        end
        local v80 = tileStyle_upv_1(u32.queued.value)
        local v81 = tileStyle_upv_1(u32.upcoming.value)
        local v82 = u37.cell + u37.gap * 3
        local key_5 = u1.createElement("uilistlayout", {FillDirection = Enum.FillDirection.Vertical, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Top, Padding = UDim.new(0, u37.gap)})
        local value_8 = u1.createElement("uiscale", {Scale = v52})
        local v83 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u35(10))})
        local v84 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u35(10))})
        local tbl_49 = {}
        tbl_49.Color = v53
        tbl_49.Thickness = u35(3)
        tbl_49.Transparency = v54
        local v85 = u1.createElement("frame", {BackgroundColor3 = v53, BackgroundTransparency = v54, Size = UDim2.fromScale(1, 1)}, v84, u1.createElement("uistroke", tbl_49))
        local v86 = table.create(#tbl_45)
        local function v87(a10)
            --[[
              line: 893
              upvalues:
                tbl_upv_46 (copy, index: 1)
                u37 (copy, index: 2)
                rows_upv_1 (copy, index: 3)
                u1 (copy, index: 4)
                u34 (copy, index: 5)
                u35 (copy, index: 6)
            ]]
            local v88 = table.create(#tbl_upv_46)
            local v89 = function(a11)
                --[[
                  line: 896
                  upvalues:
                    u37 (copy, index: 1)
                    a10 (copy, index: 2)
                    rows_upv_1 (copy, index: 3)
                    u1 (copy, index: 4)
                    u34 (copy, index: 5)
                    u35 (copy, index: 6)
                ]]
                local v90 = Vector2.new((u37.gap + (a10 * (u37.cell + u37.gap))) + (u37.cell / 2), (u37.gap + (((rows_upv_1 - 1) - a11) * (u37.cell + u37.gap))) + (u37.cell / 2))
                local tbl_50 = {}
                tbl_50.CornerRadius = UDim.new(0, u35(6))
                return u1.createElement("frame", {key = ("slot-%*-%*"):format(a10, a11), BackgroundColor3 = u34.palette.surfaceAlt, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(v90.X, v90.Y), Size = UDim2.fromOffset(u37.cell, u37.cell)}, u1.createElement("uicorner", tbl_50))
            end
            for key_6, value_9 in tbl_upv_46 do
                v88[key_6] = v89(value_9, key_6 - 1, tbl_upv_46)
            end
            return v88
        end
        for key_7, value_10 in tbl_45 do
            v86[key_7] = v87(value_10, key_7 - 1, tbl_45)
        end
        local tiles_1 = u32.tiles
        local v91 = table.create(#tiles_1)
        for key_8, value_11 in tiles_1 do
            v91[key_8] = u1.createElement(TileView_upv_1, {key = ("tile-%*-%*"):format(u32.round, value_11.id), tile = value_11, geometry = u37})
        end
        local v92 = table.create(#v50)
        for key_9, value_12 in v50 do
            v92[key_9] = u1.createElement(WipeGhost_upv_1, {key = ("ghost-%*"):format(value_12.id), center = value_12.center, value = value_12.value, geometry = u37, delaySeconds = value_12.delaySeconds})
        end
        local v93 = table.create(#tbl_48)
        for key_10, value_13 in tbl_48 do
            v93[key_10] = u1.createElement(DangerColumnPulse_upv_1, {key = ("danger-%*"):format(value_13), column = value_13, geometry = u37})
        end
        local v94 = table.create(#v49)
        for key_11, value_14 in v49 do
            v94[key_11] = u1.createElement(ScorePopup_upv_1, {key = ("popup-%*"):format(value_14.id), center = value_14.center, text = value_14.text})
        end
        local v95 = false
        if v51 ~= nil then
            v95 = u1.createElement(CenterStamp_upv_1, {key = ("stamp-%*"):format(v51.id), text = v51.text, color = v51.color})
        end
        local v96 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u35(6))})
        local v97 = u1.createElement("frame", {BackgroundColor3 = u34.palette.accent, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromOffset((u37.gap + (u32.selectedColumn * (u37.cell + u37.gap))) + (u37.cell / 2), u37.gap), Size = UDim2.fromOffset(u37.cell, u37.boardHeight - (u37.gap * 2))}, v96, u1.createElement("uistroke", {Color = u34.palette.accent}))
        local v98 = table.create(#tbl_45)
        local function key_11(a12)
            --[[
              line: 997
              upvalues:
                u37 (copy, index: 1)
                u1 (copy, index: 2)
                u33 (copy, index: 3)
            ]]
            local tbl_51 = {}
            tbl_51.Activated = function()
                --[[
                  name: Activated
                  line: 1009
                  upvalues:
                    u33 (copy, index: 1)
                    a12 (copy, index: 2)
                ]]
                local v99
                if u33 == nil then
                    v99 = u33
                else
                    v99 = u33.dropIntoColumn(a12)
                end
                return v99
            end
            tbl_51.MouseEnter = function()
                --[[
                  name: MouseEnter
                  line: 1016
                  upvalues:
                    u33 (copy, index: 1)
                    a12 (copy, index: 2)
                ]]
                local v100
                if u33 == nil then
                    v100 = u33
                else
                    v100 = u33.selectColumn(a12)
                end
                return v100
            end
            return u1.createElement("textbutton", {key = ("drop-%*"):format(a12), AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromOffset(u37.gap + (a12 * (u37.cell + u37.gap)), u37.gap), Size = UDim2.fromOffset(u37.cell + u37.gap, u37.boardHeight - (u37.gap * 2)), Event = tbl_51})
        end
        for key_12, v101 in tbl_45 do
            v98[key_12] = key_11(v101, key_12 - 1, tbl_45)
        end
        local v101 = u1.createElement("frame", {Size = UDim2.fromOffset(u37.boardWidth, u37.boardHeight), BackgroundColor3 = u34.palette.surface}, value_8, v83, v85, v86, v91, v92, v93, v94, v95, v97, v98)
        local tbl_52 = {}
        tbl_52.Size = UDim2.fromOffset(u37.boardWidth, v82)
        tbl_52.BackgroundColor3 = u34.palette.surface
        local v102 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u35(10))})
        local v103 = u1.createElement("textlabel", {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0.08, 0.5), Size = UDim2.fromScale(0.24, 0.4), Font = u34.typography.body, TextColor3 = u34.palette.textSecondary, TextXAlignment = Enum.TextXAlignment.Left})
        local tbl_53 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u35(6))})
        local v104 = u1.createElement(TileDecor_upv_1, {style = v80, strokeThickness = u35(3)})
        local tbl_54 = {}
        tbl_54.Size = UDim2.fromScale(0.86, 0.6)
        tbl_54.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl_54.Position = UDim2.fromScale(0.5, 0.5)
        tbl_54.Font = Enum.Font.GothamBlack
        tbl_54.Text = tileLabel_upv_1(u32.queued.value)
        tbl_54.TextColor3 = v80.text
        local v105 = u1.createElement("frame", {BackgroundColor3 = v80.background, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(u37.cell, u37.cell)}, tbl_53, v104, u1.createElement("textlabel", tbl_54))
        tbl_53 = {}
        tbl_53.BackgroundColor3 = v81.background
        tbl_53.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl_53.Position = UDim2.fromScale(0.78, 0.5)
        tbl_53.Size = UDim2.fromOffset(math.floor(u37.cell * 0.72), math.floor(u37.cell * 0.72))
        v104 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u35(6))})
        local v106 = u1.createElement(TileDecor_upv_1, {style = v81, strokeThickness = u35(3)})
        local tbl_55 = {}
        tbl_55.Size = UDim2.fromScale(0.86, 0.6)
        tbl_55.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl_55.Position = UDim2.fromScale(0.5, 0.5)
        tbl_55.Font = Enum.Font.GothamBlack
        tbl_55.Text = tileLabel_upv_1(u32.upcoming.value)
        tbl_55.TextColor3 = v81.text
        return u1.createElement(
            "frame",
            {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = u1.joinBindings({shakeX = v55, shakeY = v56}):map(
                    function(a13)
                        --[[
                          line: 1035
                          upvalues:
                            u36 (copy, index: 1)
                        ]]
                        return UDim2.new(0.5, a13.shakeX, (u36 and 0.5) or 0.54, a13.shakeY)
                    end
                ),
                Size = UDim2.fromOffset(u37.boardWidth, u37.boardHeight + v82)
            },
            key_5,
            v101,
            u1.createElement("frame", tbl_52, v102, v103, v105, u1.createElement("frame", tbl_53, v104, v106, u1.createElement("textlabel", tbl_55)))
        )
    end
    return u1.createElement(u1.Fragment)
end
return tbl_38