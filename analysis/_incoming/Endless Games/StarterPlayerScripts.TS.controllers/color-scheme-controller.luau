-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local activeSchemeAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "scheme-atom").activeSchemeAtom
local applySchemeToPalette_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "kit", "kit-palette").applySchemeToPalette
local gotdVariantOf_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "theme", "gotd-styles").gotdVariantOf
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "theme", "kit-recolor")
local getSchemeHexIndex_upv_1 = v1.getSchemeHexIndex
local recolorKitTree_upv_1 = v1.recolorKitTree
local nextScheme_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "theme", "schemes", "scheme-registry").nextScheme
local tabVariantOf_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "theme", "tab-styles").tabVariantOf
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 25
    ]]
    return "ColorSchemeController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 30
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 34
    ]]
    a1.styleGotdDistinct = false
end
u1.attachKit = function(a1, a2)
    --[[
      name: attachKit
      line: 37
      upvalues:
        activeSchemeAtom_upv_1 (copy, index: 1)
        recolorKitTree_upv_1 (copy, index: 2)
        getSchemeHexIndex_upv_1 (copy, index: 3)
    ]]
    a1.kitRoot = a2
    a1.gotdCard = a2:FindFirstChild("DailyGame", true)
    if a1.gotdCard == nil then
        warn("[ColorSchemeController] DailyGame card not found \226\128\148 GOTD accent inactive")
    end
    a1.tabStrip = a2:FindFirstChild("TopButtons", true)
    if a1.tabStrip == nil then
        warn("[ColorSchemeController] Games.TopButtons not found \226\128\148 tab styles inactive")
    end
    local v3 = activeSchemeAtom_upv_1()
    recolorKitTree_upv_1(a2, v3, getSchemeHexIndex_upv_1())
    a1:applyGotdStyle(v3)
    a1:applyTabStyle(v3)
    task.defer(
        function()
            --[[
              line: 53
              upvalues:
                activeSchemeAtom_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            local v4 = activeSchemeAtom_upv_1()
            a1:applyGotdStyle(v4)
            a1:applyTabStyle(v4)
        end
    )
end
u1.applyScheme = function(a1, a2)
    --[[
      name: applyScheme
      line: 59
      upvalues:
        applySchemeToPalette_upv_1 (copy, index: 1)
        recolorKitTree_upv_1 (copy, index: 2)
        getSchemeHexIndex_upv_1 (copy, index: 3)
        activeSchemeAtom_upv_1 (copy, index: 4)
    ]]
    applySchemeToPalette_upv_1(a2)
    local kitRoot_1 = a1.kitRoot
    if kitRoot_1 ~= nil and kitRoot_1.Parent ~= nil then
        recolorKitTree_upv_1(kitRoot_1, a2, getSchemeHexIndex_upv_1())
        a1:applyGotdStyle(a2)
        a1:applyTabStyle(a2)
    end
    activeSchemeAtom_upv_1(
        function()
            --[[
              line: 67
              upvalues:
                a2 (copy, index: 1)
            ]]
            return a2
        end
    )
end
u1.cycleScheme = function(a1)
    --[[
      name: cycleScheme
      line: 71
      upvalues:
        nextScheme_upv_1 (copy, index: 1)
        activeSchemeAtom_upv_1 (copy, index: 2)
    ]]
    local v5 = nextScheme_upv_1(activeSchemeAtom_upv_1())
    a1:applyScheme(v5)
    print((("[ColorSchemeController] color scheme \226\134\146 %* (T cycles)"):format(v5.label)))
end
u1.toggleGotdStyle = function(a1)
    --[[
      name: toggleGotdStyle
      line: 76
      upvalues:
        activeSchemeAtom_upv_1 (copy, index: 1)
    ]]
    a1.styleGotdDistinct = not a1.styleGotdDistinct
    a1:applyGotdStyle(activeSchemeAtom_upv_1())
    print((("[ColorSchemeController] GOTD accent %* (Y toggles)"):format(((a1.styleGotdDistinct) and "ON") or "OFF")))
end
u1.applyGotdStyle = function(a1, a2)
    --[[
      name: applyGotdStyle
      line: 81
      upvalues:
        gotdVariantOf_upv_1 (copy, index: 1)
        recolorKitTree_upv_1 (copy, index: 2)
        getSchemeHexIndex_upv_1 (copy, index: 3)
    ]]
    local gotdCard_1 = a1.gotdCard
    if gotdCard_1 ~= nil then
        local v6
        if a1.styleGotdDistinct then
            v6 = gotdVariantOf_upv_1(a2)
        else
            v6 = nil
        end
        recolorKitTree_upv_1(gotdCard_1, v6 or a2, getSchemeHexIndex_upv_1())
    else
        return nil
    end
end
u1.applyTabStyle = function(a1, a2)
    --[[
      name: applyTabStyle
      line: 89
      upvalues:
        tabVariantOf_upv_1 (copy, index: 1)
        recolorKitTree_upv_1 (copy, index: 2)
        getSchemeHexIndex_upv_1 (copy, index: 3)
    ]]
    local tabStrip_1 = a1.tabStrip
    local v7 = nil
    if tabStrip_1 ~= nil then
        v7 = tabVariantOf_upv_1(a2)
        if v7 ~= nil then
            recolorKitTree_upv_1(tabStrip_1, v7, getSchemeHexIndex_upv_1())
        end
    else
        return nil
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/color-scheme-controller@ColorSchemeController")
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.ColorSchemeController = u1
return tbl_3