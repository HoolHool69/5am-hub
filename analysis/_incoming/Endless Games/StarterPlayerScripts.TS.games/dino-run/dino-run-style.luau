-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {"background", "horizonGlow", "farBand", "midSilhouette", "cloud", "groundSoil"}
local tbl_2 = {"ink", "detail", "inverse"}
local function gray_1(a1)
    --[[
      name: gray
      line: 26
    ]]
    return Color3.fromRGB(a1, a1, a1)
end
local tbl_3 = {}
tbl_3.color = Color3.fromRGB(245, 245, 245)
tbl_3.haloColor = Color3.fromRGB(235, 235, 235)
local tbl_4 = {}
tbl_4.ANIMATED_ROLES = tbl_1
tbl_4.SNAP_ROLES = tbl_2
tbl_4.NIGHT_LADDER = {background = Color3.fromRGB(12, 12, 12), horizonGlow = Color3.fromRGB(30, 30, 30), farBand = Color3.fromRGB(52, 52, 52), midSilhouette = Color3.fromRGB(82, 82, 82), cloud = Color3.fromRGB(96, 96, 96), groundSoil = Color3.fromRGB(32, 32, 32), detail = Color3.fromRGB(118, 118, 118), ink = Color3.fromRGB(235, 235, 235), inverse = Color3.fromRGB(12, 12, 12)}
tbl_4.DAY_LADDER = {background = Color3.fromRGB(238, 238, 238), horizonGlow = Color3.fromRGB(248, 248, 248), farBand = Color3.fromRGB(206, 206, 206), midSilhouette = Color3.fromRGB(178, 178, 178), cloud = Color3.fromRGB(214, 214, 214), groundSoil = Color3.fromRGB(214, 214, 214), detail = Color3.fromRGB(138, 138, 138), ink = Color3.fromRGB(22, 22, 22), inverse = Color3.fromRGB(238, 238, 238)}
tbl_4.DINO_STYLE = {parallax = {}, z = {}, loop = {}, stars = {}, moon = tbl_3, clouds = {}, mesas = {}, farBand = {}, glowBands = {{}, {}}, soil = {}, groundDetail = {}, dust = {}, blink = {}, tailWag = {}, landingSquash = {}, pitch = {}, shootingStar = {}}
return tbl_4