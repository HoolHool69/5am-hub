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
local perkGridColumns = nil
local function perkGridHeight_upv_1(a1, a2, a3)
    --[[
      name: perkGridHeight
      line: 33
      upvalues:
        perkGridColumns (ref, index: 1)
    ]]
    if a1 ~= 0 then
        local v3 = math.ceil(a1 / perkGridColumns(a2, a3))
        return (a3(15) + (v3 * a3(34))) + ((v3 - 1) * a3(4)) + a3(26)
    end
    return 0
end
perkGridColumns = function(a1, a2)
    --[[
      name: perkGridColumns
      line: 41
    ]]
    local v4 = a2(34) + a2(4)
    return (math.max(math.floor((a1 + a2(4)) / v4), 1))
end
local tbl_1 = {}
tbl_1.perkGridHeight = perkGridHeight_upv_1
tbl_1.EggPerkGrid = function(a1)
    --[[
      name: EggPerkGrid
      line: 46
      upvalues:
        u1 (copy, index: 1)
        KIT_COLORS_upv_1 (copy, index: 2)
        kitSequence_upv_1 (copy, index: 3)
        KIT_GRADIENTS_upv_1 (copy, index: 4)
        KitPattern_upv_1 (copy, index: 5)
        kitFont_upv_1 (copy, index: 6)
        perkGridHeight_upv_1 (copy, index: 7)
        KitText_upv_1 (copy, index: 8)
    ]]
    local owned_1 = a1.owned
    local innerWidth_1 = a1.innerWidth
    local layoutOrder_1 = a1.layoutOrder
    local px_1 = a1.px
    local v5, u2 = u1.useState(-1)
    local v6
    v6 = nil
    for _, value_1 in owned_1 do
        if value_1.id == v5 == true then
            v6 = value_1
            break
        end
    end
    local tbl_2 = {}
    for n_1 = 0, #owned_1 - 1 do
        local u3 = owned_1[n_1 + 1]
        local u4 = u3.id == v5
        local createElement_1 = u1.createElement
        local tbl_3 = {}
        tbl_3.key = ("p%*"):format(u3.id)
        tbl_3.BackgroundColor3 = KIT_COLORS_upv_1.white
        tbl_3.LayoutOrder = n_1
        local tbl_4 = {}
        tbl_4.Activated = function()
            --[[
              name: Activated
              line: 77
              upvalues:
                u2 (copy, index: 1)
                u4 (copy, index: 2)
                u3 (copy, index: 3)
            ]]
            return u2((u4 and -1) or (u3.id))
        end
        tbl_3.Event = tbl_4
        local v7 = u1.createElement("uigradient", {Color = kitSequence_upv_1(KIT_GRADIENTS_upv_1.gold)})
        local v8 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, px_1(6))})
        local v9 = u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.black, Thickness = px_1(1)})
        local v10 = u4 and (u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.white, Thickness = px_1(2)}))
        table.insert(tbl_2, (createElement_1("imagebutton", tbl_3, v7, v8, v9, v10, u1.createElement(KitPattern_upv_1, {cornerRadius = UDim.new(0, px_1(6))}), u1.createElement("textlabel", {Size = UDim2.fromScale(0.72, 0.72), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), Text = u3.glyph, FontFace = kitFont_upv_1("Heavy"), TextColor3 = KIT_COLORS_upv_1.white}))))
    end
    local createElement_2 = u1.createElement
    local tbl_5 = {}
    tbl_5.LayoutOrder = layoutOrder_1
    tbl_5.Size = UDim2.new(1, 0, 0, perkGridHeight_upv_1(#owned_1, innerWidth_1, px_1))
    local v11 = u1.createElement(KitText_upv_1, {text = ("OWNED PERKS \194\183 %*"):format(#owned_1), size = UDim2.new(1, 0, 0, px_1(11)), xAlignment = Enum.TextXAlignment.Left, textColor = KIT_COLORS_upv_1.textGoldSoft})
    local tbl_6 = {}
    tbl_6.CellSize = UDim2.fromOffset(px_1(34), px_1(34))
    tbl_6.CellPadding = UDim2.fromOffset(px_1(4), px_1(4))
    tbl_6.SortOrder = Enum.SortOrder.LayoutOrder
    tbl_6.HorizontalAlignment = Enum.HorizontalAlignment.Left
    local v12 = u1.createElement("frame", {Size = UDim2.new(1, 0, 1, -px_1(15) - px_1(26)), Position = UDim2.new(0, 0, 0, px_1(15))}, u1.createElement("uigridlayout", tbl_6), tbl_2)
    local createElement_3 = u1.createElement
    local tbl_7 = {}
    tbl_7.Size = UDim2.new(1, 0, 0, px_1(22))
    tbl_7.Position = UDim2.new(0, 0, 1, -px_1(22))
    tbl_7.BackgroundColor3 = KIT_COLORS_upv_1.rowSlate
    tbl_7.BackgroundTransparency = ((v6 ~= nil) and 0) or 0.55
    local v13 = u1.createElement("uicorner", {CornerRadius = UDim.new(0, px_1(5))})
    local createElement_4 = u1.createElement
    local tbl_8 = {}
    local v14 = ((v6 == nil) and "tap a perk to see what it does") or (("%* %* \226\128\148 %*"):format(v6.glyph, v6.name, v6.blurb))
    tbl_8.text = v14
    tbl_8.size = UDim2.new(1, -px_1(10), 1, -px_1(6))
    tbl_8.position = UDim2.new(0, px_1(5), 0, px_1(3))
    tbl_8.weight = ((v6 == nil) and "Medium") or "Bold"
    tbl_8.xAlignment = Enum.TextXAlignment.Left
    if v6 == nil then
        v14 = KIT_COLORS_upv_1.descriptionGrey
    else
        v14 = KIT_COLORS_upv_1.white
    end
    tbl_8.textColor = v14
    tbl_8.maxTextSize = px_1(12)
    return createElement_2("frame", tbl_5, v11, v12, createElement_3("frame", tbl_7, v13, createElement_4(KitText_upv_1, tbl_8)))
end
return tbl_1