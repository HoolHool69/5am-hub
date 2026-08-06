-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local useMotion_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "pretty-react-hooks", "out").useMotion
local u1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local useEffect_upv_1 = u1.useEffect
local useRef_upv_1 = u1.useRef
local useState_upv_1 = u1.useState
local useAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-charm", "src").useAtom
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-px")
local useOrientation_upv_1 = v1.useOrientation
local usePx_upv_1 = v1.usePx
local useViewportSize_upv_1 = v1.useViewportSize
local useTheme_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "theme", "theme-context").useTheme
local board2048Atom_upv_1 = RuntimeLib_1.import(script, script.Parent, "board-atom").board2048Atom
local tbl_upv_1 = {}
tbl_upv_1.style = Enum.EasingStyle.Quad
tbl_upv_1.direction = Enum.EasingDirection.InOut
local tbl_upv_2 = {}
tbl_upv_2.style = Enum.EasingStyle.Back
tbl_upv_2.direction = Enum.EasingDirection.Out
local tbl_upv_3 = {}
tbl_upv_3.style = Enum.EasingStyle.Quad
tbl_upv_3.direction = Enum.EasingDirection.Out
local tbl_upv_4 = {}
tbl_upv_4.style = Enum.EasingStyle.Quad
tbl_upv_4.direction = Enum.EasingDirection.Out
local tbl_upv_5 = {}
tbl_upv_5.style = Enum.EasingStyle.Quad
tbl_upv_5.direction = Enum.EasingDirection.Out
local tbl_upv_6 = {}
tbl_upv_6.style = Enum.EasingStyle.Quad
tbl_upv_6.direction = Enum.EasingDirection.In
local tbl_upv_7 = {}
tbl_upv_7.style = Enum.EasingStyle.Quad
tbl_upv_7.direction = Enum.EasingDirection.Out
local u2 = (function()
    --[[
      line: 73
    ]]
    local tbl_8 = {}
    table.insert(tbl_8, 0)
    table.insert(tbl_8, 1)
    table.insert(tbl_8, 2)
    table.insert(tbl_8, 3)
    table.insert(tbl_8, 4)
    table.insert(tbl_8, 5)
    table.insert(tbl_8, 6)
    table.insert(tbl_8, 7)
    table.insert(tbl_8, 8)
    table.insert(tbl_8, 9)
    table.insert(tbl_8, 10)
    table.insert(tbl_8, 11)
    table.insert(tbl_8, 12)
    table.insert(tbl_8, 13)
    table.insert(tbl_8, 14)
    table.insert(tbl_8, 15)
    return tbl_8
end)()
local function slotCenter_1(a1)
    --[[
      name: slotCenter
      line: 81
    ]]
    return Vector2.new((0.03 + ((a1 % 4) * 0.2425)) + 0.10625, ((math.floor(a1 / 4) * 0.2425) + 0.03) + 0.10625)
end
local v2 = Color3.fromRGB(119, 110, 101)
local v3 = Color3.fromRGB(249, 246, 242)
local tbl_upv_9 = {}
tbl_upv_9[2] = {background = Color3.fromRGB(238, 228, 218), text = v2}
tbl_upv_9[4] = {background = Color3.fromRGB(237, 224, 200), text = v2}
tbl_upv_9[8] = {background = Color3.fromRGB(242, 177, 121), text = v3}
tbl_upv_9[16] = {background = Color3.fromRGB(245, 149, 99), text = v3}
tbl_upv_9[32] = {background = Color3.fromRGB(246, 124, 95), text = v3}
tbl_upv_9[64] = {background = Color3.fromRGB(246, 94, 59), text = v3}
tbl_upv_9[128] = {background = Color3.fromRGB(237, 207, 114), text = v3}
tbl_upv_9[256] = {background = Color3.fromRGB(237, 204, 97), text = v3}
tbl_upv_9[512] = {background = Color3.fromRGB(237, 200, 80), text = v3}
tbl_upv_9[1024] = {background = Color3.fromRGB(237, 197, 63), text = v3}
tbl_upv_9[2048] = {background = Color3.fromRGB(237, 194, 46), text = v3}
tbl_upv_9[4096] = {background = Color3.fromRGB(64, 74, 106), text = v3}
tbl_upv_9[8192] = {background = Color3.fromRGB(104, 66, 146), text = v3}
local u3 = {}
u3.background = Color3.fromRGB(60, 58, 50)
u3.text = v3
local u4 = Color3.fromRGB(240, 180, 40)
local tbl_upv_10 = {Color3.fromRGB(255, 224, 92), Color3.fromRGB(255, 176, 52), Color3.fromRGB(255, 122, 44), Color3.fromRGB(255, 66, 52)}
local tbl_upv_11 = {}
tbl_upv_11.style = Enum.EasingStyle.Quad
tbl_upv_11.direction = Enum.EasingDirection.Out
local tbl_upv_12 = {}
local function comboColor_1(a1)
    --[[
      name: comboColor
      line: 159
      upvalues:
        tbl_upv_10 (copy, index: 1)
    ]]
    return tbl_upv_10[math.clamp(a1 - 2, 0, #tbl_upv_10 - 1) + 1]
end
local function tileColors_1(a1)
    --[[
      name: tileColors
      line: 162
      upvalues:
        tbl_upv_9 (copy, index: 1)
        u3 (copy, index: 2)
    ]]
    local v4 = tbl_upv_9[a1]
    if v4 == nil then
        v4 = u3
    end
    return v4
end
local function ScorePopup_upv_1(a1)
    --[[
      name: ScorePopup
      line: 235
      upvalues:
        useMotion_upv_1 (copy, index: 1)
        useEffect_upv_1 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
        tbl_upv_6 (copy, index: 4)
        u1 (copy, index: 5)
        u4 (copy, index: 6)
    ]]
    local at_1 = a1.at
    local v5, u5 = useMotion_upv_1(0)
    local v6, u6 = useMotion_upv_1(0)
    local u7 = Vector2.new((0.03 + ((at_1 % 4) * 0.2425)) + 0.10625, ((math.floor(at_1 / 4) * 0.2425) + 0.03) + 0.10625)
    useEffect_upv_1(
        function()
            --[[
              line: 241
              upvalues:
                u5 (copy, index: 1)
                tbl_upv_5 (copy, index: 2)
                u6 (copy, index: 3)
                tbl_upv_6 (copy, index: 4)
            ]]
            u5:tween(-0.175, tbl_upv_5)
            local u8 = false
            task.delay(
                0.3,
                function()
                    --[[
                      line: 245
                      upvalues:
                        u8 (ref,  index: 1)
                        u6 (copy, index: 2)
                        tbl_upv_6 (copy, index: 3)
                    ]]
                    if (u8) then
                        return
                    end
                    u6:tween(1, tbl_upv_6)
                end
            )
            return function()
                --[[
                  line: 250
                  upvalues:
                    u8 (ref, index: 1)
                ]]
                u8 = true
            end
        end,
        {}
    )
    return u1.createElement(
        "textlabel",
        {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = v5:map(
                function(a2)
                    --[[
                      line: 257
                      upvalues:
                        u7 (copy, index: 1)
                    ]]
                    return UDim2.fromScale(u7.X, u7.Y + a2)
                end
            ),
            Size = UDim2.fromScale(0.3, 0.13),
            Font = Enum.Font.GothamBlack,
            Text = a1.text,
            TextColor3 = u4,
            TextTransparency = v6,
            TextStrokeTransparency = v6:map(
                function(a3)
                    --[[
                      line: 265
                    ]]
                    return 0.6 + (a3 * 0.4)
                end
            )
        }
    )
end
local function TileView_upv_1(a1)
    --[[
      name: TileView
      line: 170
      upvalues:
        usePx_upv_1 (copy, index: 1)
        useMotion_upv_1 (copy, index: 2)
        useRef_upv_1 (copy, index: 3)
        useEffect_upv_1 (copy, index: 4)
        tbl_upv_1 (copy, index: 5)
        tbl_upv_2 (copy, index: 6)
        tbl_upv_3 (copy, index: 7)
        tbl_upv_4 (copy, index: 8)
        tbl_upv_9 (copy, index: 9)
        u3 (copy, index: 10)
        u1 (copy, index: 11)
    ]]
    local tile_1 = a1.tile
    local v7 = usePx_upv_1()
    local index_1 = tile_1.index
    local u9 = Vector2.new((0.03 + ((index_1 % 4) * 0.2425)) + 0.10625, ((math.floor(index_1 / 4) * 0.2425) + 0.03) + 0.10625)
    local v8, u10 = useMotion_upv_1(u9.X)
    local v9, u11 = useMotion_upv_1(u9.Y)
    local v10, u12 = useMotion_upv_1(0)
    local v11, u13 = useMotion_upv_1(1)
    local u14 = useRef_upv_1(true)
    useEffect_upv_1(
        function()
            --[[
              line: 179
              upvalues:
                u10 (copy, index: 1)
                u9 (copy, index: 2)
                tbl_upv_1 (copy, index: 3)
                u11 (copy, index: 4)
            ]]
            u10:tween(u9.X, tbl_upv_1)
            u11:tween(u9.Y, tbl_upv_1)
        end,
        {tile_1.index}
    )
    useEffect_upv_1(
        function()
            --[[
              line: 183
              upvalues:
                u14 (copy, index: 1)
                u12 (copy, index: 2)
                tbl_upv_2 (copy, index: 3)
                tbl_upv_3 (copy, index: 4)
                u13 (copy, index: 5)
                tbl_upv_4 (copy, index: 6)
            ]]
            if u14.current then
                u14.current = false
                u12:immediate(0.3)
                u12:tween(1, tbl_upv_2)
                return nil
            end
            u12:immediate(1.25)
            u12:tween(1, tbl_upv_3)
            u13:immediate(0.2)
            u13:tween(1, tbl_upv_4)
        end,
        {tile_1.value}
    )
    local v12 = tbl_upv_9[tile_1.value]
    if v12 == nil then
        v12 = u3
    end
    u3 = v12
    local v13 = u1.createElement("uiscale", {Scale = v10})
    local v14 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, v7(6))})
    local tbl_13 = {}
    tbl_13.CornerRadius = UDim.new(0, v7(6))
    local v15 = u1.createElement("frame", {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = v11, Size = UDim2.fromScale(1, 1)}, u1.createElement("uicorner", tbl_13))
    local tbl_14 = {}
    tbl_14.Size = UDim2.fromScale(0.9, 0.6)
    tbl_14.AnchorPoint = Vector2.new(0.5, 0.5)
    tbl_14.Position = UDim2.fromScale(0.5, 0.5)
    tbl_14.Font = Enum.Font.GothamBlack
    tbl_14.Text = tostring(tile_1.value)
    tbl_14.TextColor3 = u3.text
    return u1.createElement(
        "frame",
        {
            BackgroundColor3 = u3.background,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = u1.joinBindings({x = v8, y = v9}):map(
                function(a2)
                    --[[
                      line: 204
                    ]]
                    return UDim2.fromScale(a2.x, a2.y)
                end
            ),
            Size = UDim2.fromScale(0.2125, 0.2125)
        },
        v13,
        v14,
        v15,
        u1.createElement("textlabel", tbl_14)
    )
end
local function CenterStamp_upv_1(a1)
    --[[
      name: CenterStamp
      line: 273
      upvalues:
        useMotion_upv_1 (copy, index: 1)
        useEffect_upv_1 (copy, index: 2)
        tbl_upv_6 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local color_1 = a1.color
    local v16, u15 = useMotion_upv_1(0.4)
    local v17, u16 = useMotion_upv_1(0)
    local v18, u17 = useMotion_upv_1(-8)
    useEffect_upv_1(
        function()
            --[[
              line: 279
              upvalues:
                u15 (copy, index: 1)
                u17 (copy, index: 2)
                u16 (copy, index: 3)
                tbl_upv_6 (copy, index: 4)
            ]]
            u15:immediate(0.4)
            u15:tween(1, {style = Enum.EasingStyle.Back, direction = Enum.EasingDirection.Out})
            u17:immediate(-8)
            u17:spring(0, {})
            local u18 = false
            task.delay(
                0.4,
                function()
                    --[[
                      line: 295
                      upvalues:
                        u18 (ref,  index: 1)
                        u16 (copy, index: 2)
                        tbl_upv_6 (copy, index: 3)
                    ]]
                    if (u18) then
                        return
                    end
                    u16:tween(1, tbl_upv_6)
                end
            )
            return function()
                --[[
                  line: 300
                  upvalues:
                    u18 (ref, index: 1)
                ]]
                u18 = true
            end
        end,
        {}
    )
    local v19 = u1.createElement("uiscale", {Scale = v16})
    local tbl_15 = {}
    tbl_15.Color = color_1
    tbl_15.Transparency = v17:map(
        function(a2)
            --[[
              line: 324
            ]]
            return 0.2 + (a2 * 0.8)
        end
    )
    return u1.createElement(
        "textlabel",
        {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.42),
            Rotation = v18,
            Size = UDim2.fromScale(0.85, 0.22),
            Font = Enum.Font.GothamBlack,
            Text = a1.text,
            TextColor3 = color_1,
            TextTransparency = v17,
            TextStrokeTransparency = v17:map(
                function(a3)
                    --[[
                      line: 314
                    ]]
                    return 0.3 + (a3 * 0.7)
                end
            )
        },
        v19,
        u1.createElement("uistroke", tbl_15)
    )
end
local tbl_16 = {}
tbl_16.Game2048View = function()
    --[[
      name: Game2048View
      line: 330
      upvalues:
        useAtom_upv_1 (copy, index: 1)
        board2048Atom_upv_1 (copy, index: 2)
        useTheme_upv_1 (copy, index: 3)
        usePx_upv_1 (copy, index: 4)
        useOrientation_upv_1 (copy, index: 5)
        useViewportSize_upv_1 (copy, index: 6)
        useState_upv_1 (copy, index: 7)
        useMotion_upv_1 (copy, index: 8)
        useRef_upv_1 (copy, index: 9)
        useEffect_upv_1 (copy, index: 10)
        tbl_upv_10 (copy, index: 11)
        tbl_upv_11 (copy, index: 12)
        u4 (copy, index: 13)
        tbl_upv_7 (copy, index: 14)
        tbl_upv_12 (copy, index: 15)
        u1 (copy, index: 16)
        u2 (copy, index: 17)
        TileView_upv_1 (copy, index: 18)
        ScorePopup_upv_1 (copy, index: 19)
        CenterStamp_upv_1 (copy, index: 20)
    ]]
    local u19 = useAtom_upv_1(board2048Atom_upv_1)
    local u20 = useTheme_upv_1()
    local u21 = usePx_upv_1()
    local v20 = useOrientation_upv_1() == "portrait"
    local v21 = useViewportSize_upv_1()
    local v22, u22 = useState_upv_1({})
    local v23, u23 = useState_upv_1(nil)
    local v24, u24 = useMotion_upv_1(1)
    local v25, u25 = useState_upv_1(Color3.fromRGB(255, 255, 255))
    local v26, u26 = useMotion_upv_1(1)
    local v27, u27 = useMotion_upv_1(0)
    local v28, u28 = useMotion_upv_1(0)
    local u29 = useRef_upv_1(0)
    local u30 = useRef_upv_1(true)
    useEffect_upv_1(
        function()
            --[[
              line: 355
              upvalues:
                u30 (copy, index: 1)
            ]]
            return function()
                --[[
                  line: 356
                  upvalues:
                    u30 (copy, index: 1)
                ]]
                u30.current = false
            end
        end,
        {}
    )
    local moveSeq_1 = u19
    if moveSeq_1 ~= nil then
        moveSeq_1 = moveSeq_1.moveSeq
    end
    local v29
    if moveSeq_1 ~= nil then
        v29 = moveSeq_1
    else
        v29 = 0
    end
    useEffect_upv_1(
        function()
            --[[
              line: 369
              upvalues:
                u19 (copy, index: 1)
                u29 (copy, index: 2)
                u22 (copy, index: 3)
                tbl_upv_10 (copy, index: 4)
                u25 (copy, index: 5)
                u26 (copy, index: 6)
                tbl_upv_11 (copy, index: 7)
                u23 (copy, index: 8)
                u4 (copy, index: 9)
                u24 (copy, index: 10)
                tbl_upv_7 (copy, index: 11)
                u21 (copy, index: 12)
                u27 (copy, index: 13)
                u28 (copy, index: 14)
                tbl_upv_12 (copy, index: 15)
                u30 (copy, index: 16)
            ]]
            if u19 == nil then
                return nil
            else
                local v30 = nil
                if #u19.merges ~= 0 then
                    local merges_1 = u19.merges
                    local u31 = table.create(#merges_1)
                    for v31, value_1 in merges_1 do
                        u29.current = u29.current + 1
                        u31[v31] = {id = u29.current, at = value_1.at, text = ("+%*"):format(value_1.value)}
                    end
                    u22(
                        function(a1)
                            --[[
                              line: 389
                              upvalues:
                                u31 (copy, index: 1)
                            ]]
                            local tbl_17 = {}
                            local v32 = #tbl_17
                            local v33 = #a1
                            table.move(a1, 1, v33, v32 + 1, tbl_17)
                            table.move(u31, 1, #u31, (v32 + v33) + 1, tbl_17)
                            return tbl_17
                        end
                    )
                    v30 = #u19.merges
                    if v30 >= 2 then
                        u25(tbl_upv_10[math.clamp(v30 - 2, 0, #tbl_upv_10 - 1) + 1])
                        u26:immediate((math.max(0.78 - (v30 * 0.04), 0.5)))
                        u26:tween(1, tbl_upv_11)
                    end
                    local v34 = false
                    if u19.milestone ~= nil then
                        v34 = u19.milestone.seq == u19.moveSeq
                    end
                    if v34 or v30 >= 2 then
                        u29.current = u29.current + 1
                        local current_upv_1 = u29.current
                        local v31
                        if (v34) and u19.milestone ~= nil then
                            v31 = ("%*!"):format(u19.milestone.value)
                        else
                            v31 = ("COMBO \195\151%*!"):format(v30)
                        end
                        local tbl_18 = {}
                        tbl_18.id = current_upv_1
                        tbl_18.text = v31
                        if not (v34) then
                            local _ = math.clamp(v30 - 2, 0, #tbl_upv_10 - 1)
                        end
                        tbl_18.color = u4
                        u23(tbl_18)
                        u24:immediate((v34 and 1.08) or 1.045)
                        u24:tween(1, tbl_upv_7)
                        local v35 = u21(math.min(v30, 6) * 1.8)
                        u27:immediate((((u19.moveSeq % 2 ~= 0) and -1) or 1) * v35)
                        u28:immediate(-v35 * 0.6)
                        u27:spring(0, tbl_upv_12)
                        u28:spring(0, tbl_upv_12)
                        task.delay(
                            (v34 and 1.2000000000000002) or 0.75,
                            function()
                                --[[
                                  line: 426
                                  upvalues:
                                    u23 (copy, index: 1)
                                    current_upv_1 (copy, index: 2)
                                ]]
                                u23(
                                    function(a2)
                                        --[[
                                          line: 427
                                          upvalues:
                                            current_upv_1 (copy, index: 1)
                                        ]]
                                        if a2 ~= nil and a2.id == current_upv_1 then
                                            return nil
                                        end
                                        return a2
                                    end
                                )
                            end
                        )
                    end
                    task.delay(
                        0.65,
                        function()
                            --[[
                              line: 432
                              upvalues:
                                u30 (copy, index: 1)
                                u22 (copy, index: 2)
                                u31 (copy, index: 3)
                            ]]
                            if u30.current then
                                u22(
                                    function(a3)
                                        --[[
                                          line: 436
                                          upvalues:
                                            u31 (copy, index: 1)
                                        ]]
                                        local tbl_19 = {}
                                        local v36 = 0
                                        local function v37(a4)
                                            --[[
                                              line: 439
                                              upvalues:
                                                u31 (copy, index: 1)
                                            ]]
                                            local v38 = false
                                            for _, value_2 in u31 do
                                                if value_2.id == a4.id then
                                                    v38 = true
                                                    break
                                                end
                                            end
                                            return not v38
                                        end
                                        for key_1, value_3 in a3 do
                                            if v37(value_3, key_1 - 1, a3) == true then
                                                v36 = v36 + 1
                                                tbl_19[v36] = value_3
                                            end
                                        end
                                        return tbl_19
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
        {v29}
    )
    if u19 ~= nil then
        local v39
        if v20 then
            v39 = math.min(v21.X - u21(28), math.floor(v21.Y * 0.58))
        else
            v39 = u21(430)
        end
        local u32 = (v20 and 0.5) or 0.56
        local v40 = u1.createElement("uiscale", {Scale = v24})
        local v41 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u21(10))})
        local v42 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, u21(10))})
        local tbl_20 = {}
        tbl_20.Color = v25
        tbl_20.Thickness = u21(3)
        tbl_20.Transparency = v26
        local v43 = u1.createElement("frame", {BackgroundColor3 = v25, BackgroundTransparency = v26, Size = UDim2.fromScale(1, 1)}, v42, u1.createElement("uistroke", tbl_20))
        local v44 = table.create(#u2)
        local function v45(a5)
            --[[
              line: 494
              upvalues:
                u1 (copy, index: 1)
                u20 (copy, index: 2)
                u21 (copy, index: 3)
            ]]
            local v46 = Vector2.new((0.03 + ((a5 % 4) * 0.2425)) + 0.10625, ((math.floor(a5 / 4) * 0.2425) + 0.03) + 0.10625)
            local tbl_21 = {}
            tbl_21.CornerRadius = UDim.new(0, u21(6))
            return u1.createElement("frame", {key = ("slot-%*"):format(a5), BackgroundColor3 = u20.palette.surfaceAlt, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(v46.X, v46.Y), Size = UDim2.fromScale(0.2125, 0.2125)}, u1.createElement("uicorner", tbl_21))
        end
        for key_2, value_4 in u2 do
            v44[key_2] = v45(value_4, key_2 - 1, u2)
        end
        local tiles_1 = u19.tiles
        local v47 = table.create(#tiles_1)
        for key_3, value_5 in tiles_1 do
            v47[key_3] = u1.createElement(TileView_upv_1, {key = ("tile-%*-%*"):format(u19.round, value_5.id), tile = value_5})
        end
        local v48 = table.create(#v22)
        for key_4, value_6 in v22 do
            v48[key_4] = u1.createElement(ScorePopup_upv_1, {key = ("popup-%*"):format(value_6.id), at = value_6.at, text = value_6.text})
        end
        local createElement_1 = u1.createElement
        local tbl_22 = {}
        tbl_22.AnchorPoint = Vector2.new(0.5, 0.5)
        tbl_22.Position = u1.joinBindings({shakeX = v27, shakeY = v28}):map(
            function(a6)
                --[[
                  line: 543
                  upvalues:
                    u32 (copy, index: 1)
                ]]
                return UDim2.new(0.5, a6.shakeX, u32, a6.shakeY)
            end
        )
        tbl_22.Size = UDim2.fromOffset(v39, v39)
        tbl_22.BackgroundColor3 = u20.palette.surface
        local v49 = false
        if v23 ~= nil then
            v49 = u1.createElement(CenterStamp_upv_1, {key = ("stamp-%*"):format(v23.id), text = v23.text, color = v23.color})
        end
        return createElement_1("frame", tbl_22, v40, v41, v43, v44, v47, v48, v49)
    end
    return u1.createElement(u1.Fragment)
end
return tbl_16