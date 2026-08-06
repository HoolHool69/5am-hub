-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local useAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-charm", "src").useAtom
local CountUpLabel_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "components", "count-up-label").CountUpLabel
local Panel_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "components", "panel").Panel
local TabBar_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "components", "tab-bar").TabBar
local UiButton_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "components", "ui-button").UiButton
local KitCard_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-card").KitCard
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-palette")
local KIT_COLORS_upv_1 = v1.KIT_COLORS
local KIT_GRADIENTS_upv_1 = v1.KIT_GRADIENTS
local kitSequence_upv_1 = v1.kitSequence
local KitPattern_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-pattern").KitPattern
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "kit", "kit-text")
local kitFont_upv_1 = v2.kitFont
local KitText_upv_1 = v2.KitText
local v3 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "layout", "use-px")
local bottomInset_upv_1 = v3.bottomInset
local topbarInset_upv_1 = v3.topbarInset
local useOrientation_upv_1 = v3.useOrientation
local usePx_upv_1 = v3.usePx
local useViewportSize_upv_1 = v3.useViewportSize
local useTheme_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "theme", "theme-context").useTheme
local PRODUCERS_upv_1 = RuntimeLib_1.import(script, script.Parent, "cookie-clicker-config").PRODUCERS
local v4 = RuntimeLib_1.import(script, script.Parent, "egg-format")
local formatEggs_upv_1 = v4.formatEggs
local formatEggsPerSecond_upv_1 = v4.formatEggsPerSecond
local EggPerkGrid_upv_1 = RuntimeLib_1.import(script, script.Parent, "egg-perk-grid").EggPerkGrid
local EggTrophyTab_upv_1 = RuntimeLib_1.import(script, script.Parent, "egg-trophy-tab").EggTrophyTab
local eggFarmAtom_upv_1 = RuntimeLib_1.import(script, script.Parent, "farm-atom").eggFarmAtom
local shopIntents_upv_1 = RuntimeLib_1.import(script, script.Parent, "shop-intents").shopIntents
local function ShopRow_upv_1(a1)
    --[[
      name: ShopRow
      line: 57
      upvalues:
        u1 (copy, index: 1)
        KIT_COLORS_upv_1 (copy, index: 2)
        kitSequence_upv_1 (copy, index: 3)
        KIT_GRADIENTS_upv_1 (copy, index: 4)
        KitPattern_upv_1 (copy, index: 5)
        kitFont_upv_1 (copy, index: 6)
        KitText_upv_1 (copy, index: 7)
        UiButton_upv_1 (copy, index: 8)
        formatEggs_upv_1 (copy, index: 9)
    ]]
    local layoutOrder_1 = a1.layoutOrder
    local glyph_1 = a1.glyph
    local title_1 = a1.title
    local subtitle_1 = a1.subtitle
    local price_1 = a1.price
    local eggs_1 = a1.eggs
    local owned_1 = a1.owned
    local onBuy_1 = a1.onBuy
    local px_1 = a1.px
    local v5 = UDim.new(0, px_1(8))
    local v6 = a1.teaser == true
    local v7 = not v6 and (price_1 <= eggs_1)
    local v8
    if v6 or price_1 <= 0 then
        v8 = 0
    else
        v8 = math.clamp(eggs_1 / price_1, 0, 1)
    end
    local createElement_1 = u1.createElement
    local tbl_1 = {}
    tbl_1.LayoutOrder = layoutOrder_1
    tbl_1.Size = UDim2.new(1, 0, 0, px_1(58))
    tbl_1.BackgroundColor3 = KIT_COLORS_upv_1.rowSlate
    tbl_1.BackgroundTransparency = (v6 and 0.4) or 0
    local v9 = u1.createElement("uicorner", {CornerRadius = v5})
    local v10 = u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.black, Thickness = px_1(2)})
    local v11
    if v7 then
        local tbl_2 = {}
        tbl_2.Color = kitSequence_upv_1(KIT_GRADIENTS_upv_1.gold)
        v11 = u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.white, Thickness = px_1(2)}, u1.createElement("uigradient", tbl_2))
    else
        local v12 = u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.white, Thickness = px_1(1)})
        v11 = v12
    end
    local v13 = u1.createElement(KitPattern_upv_1, {cornerRadius = v5})
    local createElement_2 = u1.createElement
    local tbl_3 = {}
    tbl_3.Size = UDim2.new(0, px_1(36), 0, px_1(36))
    tbl_3.Position = UDim2.new(0, px_1(8), 0, px_1(8))
    tbl_3.Text = glyph_1
    tbl_3.TextSize = px_1(24)
    tbl_3.FontFace = kitFont_upv_1("Heavy")
    tbl_3.TextColor3 = KIT_COLORS_upv_1.white
    tbl_3.TextTransparency = (v6 and 0.4) or 0
    local v14 = createElement_2("textlabel", tbl_3)
    local v15 = false
    if owned_1 ~= nil then
        local v16 = false
        if owned_1 <= 0 then
            v15 = v16
        else
            local v17 = u1.createElement("uigradient", {Color = kitSequence_upv_1(KIT_GRADIENTS_upv_1.gold)})
            local v18 = u1.createElement("uicorner", {CornerRadius = UDim.new(1, 0)})
            local v19 = u1.createElement("uistroke", {Color = KIT_COLORS_upv_1.black, Thickness = px_1(1)})
            local tbl_4 = {}
            tbl_4.text = tostring(owned_1)
            tbl_4.size = UDim2.new(1, -px_1(3), 1, -px_1(3))
            tbl_4.position = UDim2.new(0, px_1(1.5), 0, px_1(1.5))
            v15 = u1.createElement("frame", {Size = UDim2.fromOffset(px_1(22), px_1(16)), Position = UDim2.new(0, px_1(30), 0, px_1(4)), BackgroundColor3 = KIT_COLORS_upv_1.white}, v17, v18, v19, u1.createElement(KitText_upv_1, tbl_4))
        end
    end
    local createElement_3 = u1.createElement
    local tbl_5 = {}
    tbl_5.text = title_1
    tbl_5.size = UDim2.new(1, -px_1(150), 0, px_1(17))
    tbl_5.position = UDim2.new(0, px_1(48), 0, px_1(10))
    tbl_5.xAlignment = Enum.TextXAlignment.Left
    local v21
    if v6 then
        v21 = KIT_COLORS_upv_1.descriptionGrey
    else
        v21 = KIT_COLORS_upv_1.white
    end
    tbl_5.textColor = v21
    tbl_3 = createElement_3(KitText_upv_1, tbl_5)
    local v22 = u1.createElement(KitText_upv_1, {text = subtitle_1, size = UDim2.new(1, -px_1(150), 0, px_1(12)), position = UDim2.new(0, px_1(48), 0, px_1(31)), xAlignment = Enum.TextXAlignment.Left, textColor = KIT_COLORS_upv_1.descriptionGrey})
    local v23 = not v7
    if v23 and not (v6) then
        local v24 = u1.createElement("uicorner", {CornerRadius = UDim.new(1, 0)})
        local tbl_6 = {}
        tbl_6.Size = UDim2.fromScale(v8, 1)
        tbl_6.BackgroundColor3 = KIT_COLORS_upv_1.textGoldSoft
        local tbl_7 = {}
        tbl_7.CornerRadius = UDim.new(1, 0)
        local _ = u1.createElement("frame", {Size = UDim2.new(1, -px_1(112), 0, px_1(3)), Position = UDim2.new(0, px_1(48), 1, -px_1(9)), BackgroundColor3 = KIT_COLORS_upv_1.black}, v24, u1.createElement("frame", tbl_6, u1.createElement("uicorner", tbl_7)))
    end
    local createElement_4 = u1.createElement
    local tbl_8 = {}
    tbl_8.text = formatEggs_upv_1(price_1)
    tbl_8.onActivated = onBuy_1
    tbl_8.size = UDim2.fromOffset(px_1(82), px_1(36))
    tbl_8.position = UDim2.new(1, -px_1(8), 0.5, 0)
    tbl_8.anchorPoint = Vector2.new(1, 0.5)
    tbl_8.variant = (v7 and "gold") or "secondary"
    tbl_8.disabled = not v7
    return createElement_1("frame", tbl_1, v9, v10, v11, v13, v14, v15, tbl_3, v22, v23, createElement_4(UiButton_upv_1, tbl_8))
end
local function ShopPanel_upv_1(a1)
    --[[
      name: ShopPanel
      line: 174
      upvalues:
        u1 (copy, index: 1)
        bottomInset_upv_1 (copy, index: 2)
        useViewportSize_upv_1 (copy, index: 3)
        ShopRow_upv_1 (copy, index: 4)
        PRODUCERS_upv_1 (copy, index: 5)
        shopIntents_upv_1 (copy, index: 6)
        EggPerkGrid_upv_1 (copy, index: 7)
        KitText_upv_1 (copy, index: 8)
        KIT_COLORS_upv_1 (copy, index: 9)
        Panel_upv_1 (copy, index: 10)
        TabBar_upv_1 (copy, index: 11)
        KIT_GRADIENTS_upv_1 (copy, index: 12)
        EggTrophyTab_upv_1 (copy, index: 13)
    ]]
    local snapshot_1 = a1.snapshot
    local px_2 = a1.px
    local portrait_1 = a1.portrait
    local v25, v26 = u1.useState("producers")
    local v27 = bottomInset_upv_1()
    local v28 = useViewportSize_upv_1()
    local v29 = (portrait_1 and (v28.X - px_2(16))) or (px_2(292))
    local v30 = v29 - (px_2(8) * 2) - px_2(6)
    local tbl_9 = {}
    local v35 = nil
    local tbl_11
    local createElement_5
    if v25 == "producers" then
        createElement_5 = false
        for n_upv_1 = 0, #snapshot_1.producers - 1 do
            tbl_11 = snapshot_1.producers[n_upv_1 + 1]
            if tbl_11.revealed then
                local v33 = PRODUCERS_upv_1[n_upv_1 + 1]
                local function onBuy_2()
                    --[[
                      name: onBuy
                      line: 219
                      upvalues:
                        shopIntents_upv_1 (copy, index: 1)
                        n_upv_1 (copy, index: 2)
                    ]]
                    return shopIntents_upv_1.buyProducer:Fire(n_upv_1)
                end
                table.insert(tbl_9, (u1.createElement(ShopRow_upv_1, {key = v33.name, layoutOrder = n_upv_1, glyph = v33.glyph, title = v33.name, subtitle = v33.quip, price = tbl_11.price, eggs = snapshot_1.eggs, owned = tbl_11.owned, onBuy = onBuy_2, px = px_2})))
                continue
            end
            if not (createElement_5) then
                createElement_5 = true
                local tbl_10 = {}
                tbl_10.key = ("teaser-%*"):format(n_upv_1)
                tbl_10.layoutOrder = n_upv_1
                tbl_10.price = tbl_11.price
                tbl_10.eggs = snapshot_1.eggs
                tbl_10.onBuy = function()
                    --[[
                      name: onBuy
                      line: 202
                    ]]
                end
                tbl_10.px = px_2
                table.insert(tbl_9, (u1.createElement(ShopRow_upv_1, tbl_10)))
                createElement_5 = createElement_5
            end
        end
    elseif v25 == "upgrades" then
        if #snapshot_1.ownedUpgrades > 0 then
            table.insert(tbl_9, (u1.createElement(EggPerkGrid_upv_1, {owned = snapshot_1.ownedUpgrades, innerWidth = v30, px = px_2})))
        end
        for n_2 = 0, #snapshot_1.upgrades - 1 do
            v35 = snapshot_1.upgrades[n_2 + 1]
            local function onBuy_3()
                --[[
                  name: onBuy
                  line: 249
                  upvalues:
                    shopIntents_upv_1 (copy, index: 1)
                ]]
                return shopIntents_upv_1.buyUpgrade:Fire(u2.id)
            end
            table.insert(tbl_9, (u1.createElement(ShopRow_upv_1, {key = ("u%*"):format(v35.id), layoutOrder = n_2, glyph = v35.glyph, title = v35.name, subtitle = v35.blurb, price = v35.cost, eggs = snapshot_1.eggs, onBuy = onBuy_3, px = px_2})))
        end
        if #snapshot_1.upgrades == 0 then
            table.insert(tbl_9, (u1.createElement(KitText_upv_1, {size = UDim2.new(1, 0, 0, px_2(40)), textColor = KIT_COLORS_upv_1.descriptionGrey})))
        end
    end
    createElement_5 = u1.createElement
    tbl_11 = {}
    if portrait_1 then
        v35 = UDim2.new(1, -px_2(16), 0.38, 0)
    else
        v35 = UDim2.new(0, px_2(292), 1, -px_2(112))
    end
    tbl_11.size = v35
    if portrait_1 then
        v35 = UDim2.new(0, px_2(8), 1, -(v27 + px_2(8)))
    else
        v35 = UDim2.new(1, -px_2(10), 0, px_2(100))
    end
    tbl_11.position = v35
    if portrait_1 then
        v35 = Vector2.new(0, 1)
    else
        v35 = Vector2.new(1, 0)
    end
    tbl_11.anchorPoint = v35
    if portrait_1 then
        local tbl_12 = {}
        tbl_12.CornerRadius = UDim.new(1, 0)
        v35 = u1.createElement("frame", {Size = UDim2.fromOffset(px_2(44), px_2(4)), Position = UDim2.new(0.5, 0, 0, px_2(4)), AnchorPoint = Vector2.new(0.5, 0), BackgroundColor3 = KIT_COLORS_upv_1.descriptionGrey}, u1.createElement("uicorner", tbl_12))
    else
        v35 = portrait_1
    end
    local createElement_6 = u1.createElement
    local v36 = "frame"
    local tbl_13 = {}
    local v37 = -px_2(16)
    local v38 = -px_2(16)
    local v39 = ((not portrait_1) and 0) or (px_2(6))
    tbl_13.Size = UDim2.new(1, v37, 1, v38 - v39)
    local v40 = px_2(8)
    local v41 = px_2(8)
    local v42 = ((not portrait_1) and 0) or (px_2(6))
    tbl_13.Position = UDim2.new(0, v40, 0, v41 + v42)
    local v43 = u1.createElement(TabBar_upv_1, {tabs = {{}, {label = ("PERKS %*"):format(#snapshot_1.upgrades)}, {}}, activeId = v25, onSelect = v26, size = UDim2.new(1, 0, 0, px_2(34)), selectedGradients = {producers = KIT_GRADIENTS_upv_1.gold, upgrades = KIT_GRADIENTS_upv_1.gold, trophies = KIT_GRADIENTS_upv_1.gold}})
    local createElement_7 = u1.createElement
    local tbl_14 = {}
    tbl_14.Size = UDim2.new(1, 0, 1, -px_2(40))
    tbl_14.Position = UDim2.new(0, 0, 0, px_2(40))
    local v44
    if v25 ~= "trophies" then
        local v45 = u1.createElement("uilistlayout", {Padding = UDim.new(0, px_2(6)), SortOrder = Enum.SortOrder.LayoutOrder})
        v44 = u1.createElement("scrollingframe", {Size = UDim2.fromScale(1, 1), ScrollBarThickness = px_2(4), ScrollBarImageColor3 = KIT_COLORS_upv_1.descriptionGrey, AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(0, 0, 0, 0)}, v45, u1.createElement("uipadding", {PaddingRight = UDim.new(0, px_2(6))}), tbl_9)
    else
        v44 = u1.createElement(EggTrophyTab_upv_1, {snapshot = snapshot_1, innerWidth = v30, px = px_2})
    end
    return createElement_5(Panel_upv_1, tbl_11, v35, createElement_6(v36, tbl_13, v43, createElement_7("frame", tbl_14, v44)))
end
local function BuffCard(a1)
    --[[
      name: BuffCard
      line: 511
      upvalues:
        u1 (copy, index: 1)
        KitCard_upv_1 (copy, index: 2)
        KIT_GRADIENTS_upv_1 (copy, index: 3)
        KIT_COLORS_upv_1 (copy, index: 4)
        KitText_upv_1 (copy, index: 5)
    ]]
    local buff_1 = a1.buff
    local px_3 = a1.px
    local position_1 = a1.position
    local v46 = math.max(buff_1.remainingSeconds, 0)
    local v47 = ((buff_1.totalSeconds <= 0) and 0) or (math.clamp(v46 / buff_1.totalSeconds, 0, 1))
    local v48 = v46 <= 5
    local v49
    if buff_1.kind ~= "frenzy" then
        v49 = ("TAP FRENZY \195\151777 \226\128\148 %*s"):format(math.ceil(v46))
    else
        v49 = ("FRENZY \195\1517 \226\128\148 %*s"):format(math.ceil(v46))
    end
    local createElement_8 = u1.createElement
    local tbl_15 = {}
    tbl_15.gradient = KIT_GRADIENTS_upv_1.gold
    tbl_15.size = UDim2.new(0, px_3(210), 0, px_3(24))
    tbl_15.position = position_1
    tbl_15.anchorPoint = Vector2.new(0.5, 0)
    tbl_15.cornerRadius = UDim.new(0, px_3(6))
    local v50
    if v48 then
        v50 = KIT_COLORS_upv_1.glowAmber
    else
        v50 = nil
    end
    tbl_15.glowColor = v50
    local createElement_9 = u1.createElement
    local tbl_16 = {}
    tbl_16.Size = UDim2.new(1, -px_3(6), 0, px_3(3))
    tbl_16.Position = UDim2.new(0.5, 0, 1, -px_3(3))
    tbl_16.AnchorPoint = Vector2.new(0.5, 1)
    tbl_16.BackgroundColor3 = KIT_COLORS_upv_1.black
    local v51 = u1.createElement("uicorner", {CornerRadius = UDim.new(1, 0)})
    local createElement_10 = u1.createElement
    local tbl_17 = {}
    tbl_17.Size = UDim2.fromScale(v47, 1)
    local v52
    if v48 then
        v52 = KIT_COLORS_upv_1.white
    else
        v52 = KIT_COLORS_upv_1.textGoldBright
    end
    tbl_17.BackgroundColor3 = v52
    return createElement_8(KitCard_upv_1, tbl_15, createElement_9("frame", tbl_16, v51, createElement_10("frame", tbl_17, u1.createElement("uicorner", {CornerRadius = UDim.new(1, 0)}))), u1.createElement(KitText_upv_1, {text = v49, size = UDim2.new(1, -px_3(8), 0, px_3(13)), position = UDim2.new(0, px_3(4), 0, px_3(3))}))
end
local function formatAway(a1)
    --[[
      name: formatAway
      line: 552
    ]]
    if a1 >= 120 then
        if a1 >= 7200 then
            return (("%*h"):format(math.floor(a1 / 360) / 10))
        end
        return (("%*m"):format(math.floor(a1 / 60)))
    end
    return (("%*s"):format(math.floor(a1)))
end
local tbl_18 = {}
tbl_18.CookieClickerView = function()
    --[[
      name: CookieClickerView
      line: 329
      upvalues:
        useAtom_upv_1 (copy, index: 1)
        eggFarmAtom_upv_1 (copy, index: 2)
        usePx_upv_1 (copy, index: 3)
        useTheme_upv_1 (copy, index: 4)
        useOrientation_upv_1 (copy, index: 5)
        topbarInset_upv_1 (copy, index: 6)
        u1 (copy, index: 7)
        KitCard_upv_1 (copy, index: 8)
        KIT_GRADIENTS_upv_1 (copy, index: 9)
        KIT_COLORS_upv_1 (copy, index: 10)
        kitFont_upv_1 (copy, index: 11)
        CountUpLabel_upv_1 (copy, index: 12)
        formatEggs_upv_1 (copy, index: 13)
        KitText_upv_1 (copy, index: 14)
        formatEggsPerSecond_upv_1 (copy, index: 15)
        BuffCard (ref,  index: 16)
        ShopPanel_upv_1 (copy, index: 17)
        formatAway (ref,  index: 18)
        UiButton_upv_1 (copy, index: 19)
        shopIntents_upv_1 (copy, index: 20)
    ]]
    local v53 = useAtom_upv_1(eggFarmAtom_upv_1)
    local u3 = usePx_upv_1()
    local v54 = useTheme_upv_1()
    local v55 = useOrientation_upv_1() == "portrait"
    local v56 = topbarInset_upv_1()
    local u4, u5 = u1.useState(-1)
    local v57
    if v53 == nil then
        v57 = v53
    else
        v57 = v53.trophyToast
    end
    local u6 = v57
    local v58 = u6
    if v58 ~= nil then
        v58 = v58.seq
    end
    local function v59()
        --[[
          line: 342
          upvalues:
            u6 (copy, index: 1)
            u4 (copy, index: 2)
            u5 (copy, index: 3)
        ]]
        if u6 ~= nil and u6.seq ~= u4 then
            u5(u6.seq)
            local u7 = task.delay(
                3,
                function()
                    --[[
                      line: 347
                      upvalues:
                        u5 (copy, index: 1)
                        u6 (copy, index: 2)
                    ]]
                    return u5(
                        function(a1)
                            --[[
                              line: 348
                              upvalues:
                                u6 (copy, index: 1)
                            ]]
                            if a1 ~= u6.seq then
                                return a1
                            end
                            return -a1 - 10
                        end
                    )
                end
            )
            return function()
                --[[
                  line: 352
                  upvalues:
                    u7 (copy, index: 1)
                ]]
                return task.cancel(u7)
            end
        end
        return nil
    end
    u1.useEffect(v59, {v58})
    local v60 = false
    if u6 ~= nil then
        v60 = v57.seq == u4
    end
    if v53 ~= nil then
        local v61 = (v55 and (math.max(v56, 58) + 6)) or (v56 + u3(2))
        local u8
        if v55 then
            u8 = u3(58)
        else
            u8 = u3(52)
        end
        local v62 = u3(280)
        local v63 = math.floor((v53.trophyBonus * 100) + 0.5)
        local v64 = u1.createElement("textlabel", {Size = UDim2.fromOffset(u3(30), u3(30)), Position = UDim2.new(0, u3(12), 0.5, 0), AnchorPoint = Vector2.new(0, 0.5), FontFace = kitFont_upv_1("Heavy"), TextColor3 = KIT_COLORS_upv_1.white})
        local tbl_19 = {}
        tbl_19.value = v53.eggs
        tbl_19.format = formatEggs_upv_1
        tbl_19.textSize = u3(30)
        tbl_19.font = v54.typography.numeric
        tbl_19.color = KIT_COLORS_upv_1.white
        tbl_19.size = UDim2.new(1, -u3(52), 1, -u3(10))
        tbl_19.position = UDim2.new(0, u3(46), 0, u3(5))
        tbl_19.alignment = Enum.TextXAlignment.Left
        tbl_19.strokeColor = KIT_COLORS_upv_1.black
        local v65 = u1.createElement(KitCard_upv_1, {gradient = KIT_GRADIENTS_upv_1.neutral, rimGradient = KIT_GRADIENTS_upv_1.gold, glowColor = KIT_COLORS_upv_1.glowAmber, size = UDim2.new(1, 0, 0, u8), cornerRadius = UDim.new(0, u3(12))}, v64, u1.createElement(CountUpLabel_upv_1, tbl_19))
        local v66 = u1.createElement(KitText_upv_1, {text = ("%*/s \194\183 +%* per tap"):format(formatEggsPerSecond_upv_1(v53.eggsPerSecond), formatEggs_upv_1(v53.clickEggs)), size = UDim2.new(1, 0, 0, u3(14)), position = UDim2.new(0, 0, 0, u8 + u3(4)), textColor = KIT_COLORS_upv_1.textGoldSoft})
        local v67 = false
        if v53.trophyCount > 0 then
            v67 = u1.createElement(KitText_upv_1, {text = ("\240\159\143\134 %* \194\183 production +%*%%"):format(v53.trophyCount, v63), size = UDim2.new(1, 0, 0, u3(12)), position = UDim2.new(0, 0, 0, u8 + u3(19)), textColor = KIT_COLORS_upv_1.descriptionGrey})
        end
        local buffs_1 = v53.buffs
        local v69 = table.create(#buffs_1)
        local function v70(a2, a3)
            --[[
              line: 419
              upvalues:
                u1 (copy, index: 1)
                BuffCard (ref,  index: 2)
                u3 (copy, index: 3)
                u8 (copy, index: 4)
            ]]
            return u1.createElement(BuffCard, {key = a2.kind, buff = a2, px = u3, position = UDim2.new(0.5, 0, 0, u8 + u3(34) + (a3 * u3(28)))})
        end
        for key_1, value_1 in buffs_1 do
            v69[key_1] = v70(value_1, key_1 - 1, buffs_1)
        end
        local createElement_11 = u1.createElement
        local tbl_20 = {}
        tbl_20.Size = UDim2.fromScale(1, 1)
        local key_1 = u1.createElement("frame", {Size = UDim2.new(0, v62, 0, u8 + u3(58)), Position = UDim2.new(0.5, 0, 0, v61), AnchorPoint = Vector2.new(0.5, 0)}, v65, v66, v67, v69)
        local value_1 = u1.createElement(ShopPanel_upv_1, {snapshot = v53, px = u3, portrait = v55})
        local v71 = false
        if v53.offline ~= nil then
            local v72 = u1.createElement(KitText_upv_1, {size = UDim2.new(1, 0, 0, u3(20)), position = UDim2.new(0, 0, 0, u3(16))})
            local v73 = u1.createElement(KitText_upv_1, {text = ("\240\159\165\154 +%*"):format(formatEggs_upv_1(v53.offline.eggs)), size = UDim2.new(1, 0, 0, u3(30)), position = UDim2.new(0, 0, 0, u3(44)), textColor = KIT_COLORS_upv_1.textGoldBright})
            local v74 = u1.createElement(KitText_upv_1, {text = ("your farm kept laying for %*"):format(formatAway(v53.offline.awaySeconds)), size = UDim2.new(1, 0, 0, u3(14)), position = UDim2.new(0, 0, 0, u3(82)), textColor = KIT_COLORS_upv_1.descriptionGrey})
            local tbl_21 = {}
            tbl_21.onActivated = function()
                --[[
                  name: onActivated
                  line: 478
                  upvalues:
                    shopIntents_upv_1 (copy, index: 1)
                ]]
                return shopIntents_upv_1.dismissOffline:Fire()
            end
            tbl_21.size = UDim2.fromOffset(u3(150), u3(38))
            tbl_21.position = UDim2.new(0.5, 0, 1, -u3(14))
            tbl_21.anchorPoint = Vector2.new(0.5, 1)
            v71 = u1.createElement(KitCard_upv_1, {gradient = KIT_GRADIENTS_upv_1.neutral, rimGradient = KIT_GRADIENTS_upv_1.gold, glowColor = KIT_COLORS_upv_1.glowAmber, size = UDim2.new(0, u3(320), 0, u3(168)), position = UDim2.new(0.5, 0, 0.5, 0), anchorPoint = Vector2.new(0.5, 0.5), cornerRadius = UDim.new(0, u3(12))}, v72, v73, v74, u1.createElement(UiButton_upv_1, tbl_21))
        end
        local v76
        if v60 then
            v76 = false
            if v57 ~= nil then
                local tbl_22 = {}
                tbl_22.text = ("\240\159\143\134 %* \226\128\148 production +2%%!"):format(v57.name)
                tbl_22.size = UDim2.new(1, -u3(12), 1, -u3(10))
                tbl_22.position = UDim2.new(0, u3(6), 0, u3(5))
                tbl_22.textColor = KIT_COLORS_upv_1.textGoldBright
                v76 = u1.createElement(KitCard_upv_1, {gradient = KIT_GRADIENTS_upv_1.neutral, rimGradient = KIT_GRADIENTS_upv_1.gold, size = UDim2.new(0, u3(300), 0, u3(40)), position = UDim2.new(0.5, 0, 0, (v61 + u8) + u3(76)), anchorPoint = Vector2.new(0.5, 0), cornerRadius = UDim.new(0, u3(10))}, u1.createElement(KitText_upv_1, tbl_22))
            end
        else
            v76 = v60
        end
        return createElement_11("frame", tbl_20, key_1, value_1, v71, v76)
    end
    return u1.createElement(u1.Fragment)
end
return tbl_18