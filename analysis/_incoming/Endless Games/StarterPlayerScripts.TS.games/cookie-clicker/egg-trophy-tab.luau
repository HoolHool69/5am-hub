-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-palette")
local KIT_COLORS_upv_1 = v1.KIT_COLORS
local KIT_GRADIENTS_upv_1 = v1.KIT_GRADIENTS
local kitSequence_upv_1 = v1.kitSequence
local KitPattern_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-pattern").KitPattern
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-text")
local kitFont_upv_1 = v2.kitFont
local KitText_upv_1 = v2.KitText
local TROPHIES_upv_1 = RuntimeLib_1.import(script, script.Parent, "cookie-clicker-config").TROPHIES
local formatEggs_upv_1 = RuntimeLib_1.import(script, script.Parent, "egg-format").formatEggs
local function trophyProgressValue_1(a1, a2)
    --[[
      name: trophyProgressValue
      line: 35
    ]]
    if a1 ~= "lifetime" then
        if a1 ~= "clicks" then
            if a1 ~= "producersTotal" then
                if a1 ~= "goldens" then
                    if a1 ~= "eggsPerSecond" then
                        return 0
                    end
                    return a2.eggsPerSecond
                end
                return a2.goldens
            end
            return a2.producersTotal
        end
        return a2.clicks
    end
    return a2.lifetime
end
local tbl_upv_1 = {}
local function TrophyMedal_upv_1(a1)
    --[[
      name: TrophyMedal
      line: 69
      upvalues:
        u1 (copy, index: 1)
        KIT_COLORS_upv_1 (copy, index: 2)
        kitSequence_upv_1 (copy, index: 3)
        KIT_GRADIENTS_upv_1 (copy, index: 4)
        KitPattern_upv_1 (copy, index: 5)
        kitFont_upv_1 (copy, index: 6)
        KitText_upv_1 (copy, index: 7)
    ]]
    local glyph_1 = a1.glyph
    local name_1 = a1.name
    local earned_1 = a1.earned
    local progress_1 = a1.progress
    local px_1 = a1.px
    local v3 = UDim.new(0.42, 0)
    local createElement_1 = u1.createElement
    local v4 = "frame"
    local tbl_2 = {}
    tbl_2.LayoutOrder = a1.layoutOrder
    local v5
    if earned_1 then
        v5 = KIT_COLORS_upv_1.white
    else
        v5 = KIT_COLORS_upv_1.rowSlate
    end
    tbl_2.BackgroundColor3 = v5
    tbl_2.Size = UDim2.fromScale(1, 1)
    local _ = earned_1 and (u1.createElement("uigradient", {Color = kitSequence_upv_1(KIT_GRADIENTS_upv_1.gold)}))
    local v6 = u1.createElement("uicorner", {CornerRadius = v3})
    local createElement_2 = u1.createElement
    local tbl_3 = {}
    tbl_3.Color = KIT_COLORS_upv_1.black
    tbl_3.Thickness = px_1(2)
    tbl_3.Transparency = (earned_1 and 0.35) or 0.65
    local v7 = createElement_2("uistroke", tbl_3)
    local createElement_3 = u1.createElement
    local tbl_4 = {}
    tbl_4.Color = KIT_COLORS_upv_1.white
    tbl_4.Thickness = px_1(1)
    tbl_4.Transparency = (earned_1 and 0.7) or 0.9
    local v8 = createElement_3("uistroke", tbl_4)
    local createElement_4 = u1.createElement
    local tbl_5 = {}
    tbl_5.transparency = (earned_1 and 0.86) or 0.94
    tbl_5.cornerRadius = v3
    tbl_3 = createElement_4(KitPattern_upv_1, tbl_5)
    local createElement_5 = u1.createElement
    local v9 = {}
    v9.Size = UDim2.new(1, 0, 0.44, 0)
    v9.Position = UDim2.new(0, 0, 0.12, 0)
    v9.Text = glyph_1
    v9.FontFace = kitFont_upv_1("Heavy")
    v9.TextColor3 = KIT_COLORS_upv_1.white
    v9.TextTransparency = (earned_1 and 0) or 0.7
    tbl_4 = createElement_5("textlabel", v9)
    local createElement_6 = u1.createElement
    local tbl_6 = {}
    tbl_6.text = name_1
    tbl_6.size = UDim2.new(1, -px_1(6), 0.3, 0)
    tbl_6.position = UDim2.new(0, px_1(3), 0.58, 0)
    local v10
    if earned_1 then
        v10 = KIT_COLORS_upv_1.white
    else
        v10 = KIT_COLORS_upv_1.descriptionGrey
    end
    tbl_6.textColor = v10
    tbl_5 = createElement_6(KitText_upv_1, tbl_6)
    v9 = not earned_1
    if v9 then
        local v11 = u1.createElement("uicorner", {CornerRadius = UDim.new(1, 0)})
        local tbl_7 = {}
        tbl_7.Size = UDim2.fromScale(math.clamp(progress_1, 0, 1), 1)
        tbl_7.BackgroundColor3 = KIT_COLORS_upv_1.textGoldSoft
        local tbl_8 = {}
        tbl_8.CornerRadius = UDim.new(1, 0)
        v9 = u1.createElement("frame", {Size = UDim2.new(1, -px_1(14), 0, px_1(3)), Position = UDim2.new(0.5, 0, 1, -px_1(9)), AnchorPoint = Vector2.new(0.5, 1), BackgroundColor3 = KIT_COLORS_upv_1.black}, v11, u1.createElement("frame", tbl_7, u1.createElement("uicorner", tbl_8)))
    end
    return createElement_1(v4, tbl_2, earned_1, v6, v7, v8, tbl_3, tbl_4, tbl_5, v9)
end
local tbl_9 = {}
tbl_9.EggTrophyTab = function(a1)
    --[[
      name: EggTrophyTab
      line: 137
      upvalues:
        TROPHIES_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        TrophyMedal_upv_1 (copy, index: 3)
        tbl_upv_1 (copy, index: 4)
        KIT_COLORS_upv_1 (copy, index: 5)
        KitText_upv_1 (copy, index: 6)
        formatEggs_upv_1 (copy, index: 7)
    ]]
    local snapshot_1 = a1.snapshot
    local innerWidth_1 = a1.innerWidth
    local px_2 = a1.px
    local v13 = px_2(6)
    local v14 = math.clamp(math.floor(innerWidth_1 / px_2(92)), 3, 8)
    local v15 = math.max(math.floor((innerWidth_1 - (v13 * (v14 - 1))) / v14), px_2(40))
    local v16 = math.floor(v15 * 1.24)
    local tbl_10 = {}
    for n_1 = 0, #TROPHIES_upv_1 - 1 do
        local v17 = TROPHIES_upv_1[n_1 + 1]
        local v18 = snapshot_1.trophiesEarned[n_1 + 1] == true
        local _
        _ = v17.kind
        local createElement_7 = u1.createElement
        local tbl_11 = {}
        tbl_11.key = ("t%*"):format(n_1)
        tbl_11.layoutOrder = n_1
        tbl_11.glyph = tbl_upv_1[v17.kind]
        tbl_11.name = v17.name
        tbl_11.earned = v18
        if v17.threshold <= 0 or v17.threshold > 0 then
            tbl_11.progress = 0
            tbl_11.px = px_2
            table.insert(tbl_10, (createElement_7(TrophyMedal_upv_1, tbl_11)))
        end
    end
    local v19 = math.floor((snapshot_1.trophyBonus * 100) + 0.5)
    local tbl_12 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, px_2(8))})
    local v20 = u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.black, Thickness = px_2(2)})
    local v21 = u1.createElement(KitText_upv_1, {text = ("\240\159\143\134 %* / %*"):format(snapshot_1.trophyCount, #TROPHIES_upv_1), size = UDim2.new(0.5, -px_2(8), 0, px_2(16)), position = UDim2.new(0, px_2(8), 0, px_2(5)), xAlignment = Enum.TextXAlignment.Left})
    local v22 = u1.createElement(KitText_upv_1, {text = ("production +%*%%"):format(v19), size = UDim2.new(0.5, -px_2(8), 0, px_2(12)), position = UDim2.new(0, px_2(8), 0, px_2(22)), xAlignment = Enum.TextXAlignment.Left, textColor = KIT_COLORS_upv_1.descriptionGrey})
    local tbl_13 = {}
    tbl_13.text = ("\240\159\165\154 %* lifetime"):format(formatEggs_upv_1(snapshot_1.lifetime))
    tbl_13.size = UDim2.new(0.5, -px_2(8), 0, px_2(13))
    tbl_13.position = UDim2.new(0.5, 0, 0.5, 0)
    tbl_13.anchorPoint = Vector2.new(0, 0.5)
    tbl_13.textColor = KIT_COLORS_upv_1.textGoldSoft
    tbl_13.xAlignment = Enum.TextXAlignment.Right
    local v23 = u1.createElement("frame", {Size = UDim2.new(1, 0, 0, px_2(38)), BackgroundColor3 = KIT_COLORS_upv_1.rowSlate}, tbl_12, v20, v21, v22, u1.createElement(KitText_upv_1, tbl_13))
    tbl_12 = {}
    tbl_12.Size = UDim2.new(1, 0, 1, -px_2(46))
    tbl_12.Position = UDim2.new(0, 0, 0, px_2(46))
    tbl_12.ScrollBarThickness = px_2(4)
    tbl_12.ScrollBarImageColor3 = KIT_COLORS_upv_1.descriptionGrey
    tbl_12.AutomaticCanvasSize = Enum.AutomaticSize.Y
    tbl_12.CanvasSize = UDim2.new(0, 0, 0, 0)
    v20 = u1.createElement("uigridlayout", {CellSize = UDim2.fromOffset(v15, v16), CellPadding = UDim2.fromOffset(v13, v13), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Left})
    local tbl_14 = {}
    tbl_14.PaddingBottom = UDim.new(0, px_2(8))
    return u1.createElement("frame", {Size = UDim2.fromScale(1, 1)}, v23, u1.createElement("scrollingframe", tbl_12, v20, u1.createElement("uipadding", tbl_14), tbl_10))
end
return tbl_9