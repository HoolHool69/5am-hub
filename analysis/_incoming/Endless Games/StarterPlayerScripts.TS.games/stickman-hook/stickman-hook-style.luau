-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.rule = Color3.fromRGB(244, 104, 40)
tbl_1.bright = Color3.fromRGB(214, 82, 40)
tbl_1.hot = Color3.fromRGB(176, 72, 44)
tbl_1.deep = Color3.fromRGB(152, 50, 28)
tbl_1.crustRock = Color3.fromRGB(118, 52, 44)
tbl_1.crustDark = Color3.fromRGB(86, 40, 36)
tbl_1.emberHot = Color3.fromRGB(255, 178, 96)
tbl_1.emberCool = Color3.fromRGB(222, 92, 44)
local tbl_2 = {}
tbl_2.dressing = Color3.fromRGB(206, 208, 214)
local tbl_3 = {}
local tbl_upv_4 = {}
tbl_upv_4.pierWidths = {17.5, 20, 23}
tbl_upv_4.bandHeights = {24, 26.5, 29}
tbl_upv_4.farWidths = {6.5, 9}
local tbl_5 = {4.2, 6.8, 9.5}
local tbl_6 = {3.4, 5.2, 7.6}
local u1 = 30 - tbl_upv_4.bandHeights[1] / 2
local function wrapIndex_1(a1, a2)
    --[[
      name: wrapIndex
      line: 197
    ]]
    return ((a1 % a2) + a2) % a2
end
local function avalanche_1(a1)
    --[[
      name: avalanche
      line: 212
    ]]
    local v1 = bit32.bxor(a1, bit32.rshift(a1, 15)) * 2097139 % 4294967296
    v1 = bit32.bxor(v1, bit32.rshift(v1, 13)) * 2097139 % 4294967296
    return (bit32.bxor(v1, bit32.rshift(v1, 16)))
end
local function cellHash_upv_1(a1, a2, a3)
    --[[
      name: cellHash
      line: 232
    ]]
    local v2 = bit32.bxor(bit32.bxor(((a1 % 65536) + 65536) % 65536, bit32.lshift(((a2 % 256) + 256) % 256, 16)), bit32.lshift(((a3 % 256) + 256) % 256, 24))
    local v3 = bit32.bxor(v2, bit32.rshift(v2, 15)) * 2097139 % 4294967296
    v3 = bit32.bxor(v3, bit32.rshift(v3, 13)) * 2097139 % 4294967296
    return bit32.bxor(v3, bit32.rshift(v3, 16)) % 65536
end
local tbl_7 = {}
tbl_7.cellHash = cellHash_upv_1
tbl_7.cellPick = function(a1, a2, a3, a4)
    --[[
      name: cellPick
      line: 239
      upvalues:
        cellHash_upv_1 (copy, index: 1)
    ]]
    return cellHash_upv_1(a1, a2, a3) % math.max(math.floor(a4), 1)
end
tbl_7.cellUnit = function(a1, a2, a3)
    --[[
      name: cellUnit
      line: 243
      upvalues:
        cellHash_upv_1 (copy, index: 1)
    ]]
    return cellHash_upv_1(a1, a2, a3) / 65536
end
tbl_7.layerCell = function(a1, a2, a3, a4, a5)
    --[[
      name: layerCell
      line: 252
    ]]
    local v4 = math.floor((a1 * a2) / a3) - math.floor((a4 - 1) / 2)
    return v4 + ((((a5 - (((v4 % a4) + a4) % a4)) % a4) + a4) % a4)
end
tbl_7.layerDrawX = function(a1, a2, a3, a4)
    --[[
      name: layerDrawX
      line: 264
    ]]
    return ((a1 * a4) + (a4 / 2)) + (a2 * (1 - a3))
end
tbl_7.anchorTetherContactY = function(a1)
    --[[
      name: anchorTetherContactY
      line: 284
      upvalues:
        u1 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
    ]]
    return (math.ceil((a1 - u1) / tbl_upv_4.bandSpacingY) * tbl_upv_4.bandSpacingY) + u1
end
tbl_7.gridFirstCell = function(a1, a2, a3)
    --[[
      name: gridFirstCell
      line: 300
    ]]
    return math.floor(a1 / a2) - math.floor((a3 - 1) / 2)
end
tbl_7.STICKMAN_HOOK_STYLE = {blue = {wallPierA = Color3.fromRGB(170, 191, 216), wallPierB = Color3.fromRGB(162, 183, 210), wallMortar = Color3.fromRGB(154, 175, 203), nearPier = Color3.fromRGB(136, 159, 189), nearRib = Color3.fromRGB(128, 151, 182), farColumn = Color3.fromRGB(120, 143, 175), backstop = Color3.fromRGB(112, 135, 168)}, lava = tbl_1, silk = tbl_2, depth = tbl_3, layers = tbl_upv_4, crust = {backRises = {0, 0.55, 1.1}, backWidths = tbl_5, frontWidths = tbl_6}}
return tbl_7