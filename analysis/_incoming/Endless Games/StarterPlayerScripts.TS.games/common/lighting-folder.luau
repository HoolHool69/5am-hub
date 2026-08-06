-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local function readSkybox(a1)
    --[[
      name: readSkybox
      line: 104
    ]]
    local tbl_1 = {}
    tbl_1.bk = a1.SkyboxBk
    tbl_1.dn = a1.SkyboxDn
    tbl_1.ft = a1.SkyboxFt
    tbl_1.lf = a1.SkyboxLf
    tbl_1.rt = a1.SkyboxRt
    tbl_1.up = a1.SkyboxUp
    tbl_1.celestialBodiesShown = a1.CelestialBodiesShown
    tbl_1.sunTextureId = a1.SunTextureId
    tbl_1.sunAngularSize = a1.SunAngularSize
    tbl_1.moonTextureId = a1.MoonTextureId
    tbl_1.moonAngularSize = a1.MoonAngularSize
    tbl_1.starCount = a1.StarCount
    return tbl_1
end
local tbl_2 = {}
tbl_2.readLightingFolderProfile = function(a1, a2, a3)
    --[[
      name: readLightingFolderProfile
      line: 19
      upvalues:
        readSkybox (ref, index: 1)
    ]]
    local v1 = a1:FindFirstChildWhichIsA("Sky")
    local v2 = a1:FindFirstChildWhichIsA("Atmosphere")
    local v3 = a1:FindFirstChildWhichIsA("BloomEffect")
    local v4 = a1:FindFirstChildWhichIsA("ColorCorrectionEffect")
    local v5 = a1:FindFirstChildWhichIsA("SunRaysEffect")
    local stageEffects_1 = a3.stageEffects
    local tbl_3 = {}
    local v6
    if v2 == nil then
        local v7
        if stageEffects_1 == nil then
            v7 = stageEffects_1
        else
            v7 = stageEffects_1.atmosphere
        end
    else
        local v7 = {}
        v7.density = v2.Density
        v7.offset = v2.Offset
        v7.color = v2.Color
        v7.decay = v2.Decay
        v7.glare = v2.Glare
        v7.haze = v2.Haze
    end
    v6 = v7
    tbl_3.atmosphere = v6
    local v7
    local v8 = nil
    if v3 == nil then
        if stageEffects_1 == nil then
            v8 = stageEffects_1
        else
            v8 = stageEffects_1.bloom
        end
        v7 = v8
    elseif v3.Enabled then
        v8 = {}
        v8.intensity = v3.Intensity
        v8.size = v3.Size
        v8.threshold = v3.Threshold
        v7 = v8
    else
        v7 = nil
    end
    tbl_3.bloom = v7
    local v9 = nil
    if v4 == nil then
        if stageEffects_1 == nil then
            v9 = stageEffects_1
        else
            v9 = stageEffects_1.colorCorrection
        end
        v8 = v9
    elseif v4.Enabled then
        v9 = {}
        v9.brightness = v4.Brightness
        v9.contrast = v4.Contrast
        v9.saturation = v4.Saturation
        v9.tintColor = v4.TintColor
        v8 = v9
    else
        v8 = nil
    end
    tbl_3.colorCorrection = v8
    if v5 == nil then
        local v10
        if stageEffects_1 == nil then
            v10 = stageEffects_1
        else
            v10 = stageEffects_1.sunRays
        end
        v9 = v10
    elseif v5.Enabled then
        local tbl_6 = {}
        tbl_6.intensity = v5.Intensity
        tbl_6.spread = v5.Spread
        v9 = tbl_6
    else
        v9 = nil
    end
    tbl_3.sunRays = v9
    local v11 = table.clone(a3)
    setmetatable(v11, nil)
    for key_1, value_1 in a2 do
        v11[key_1] = value_1
    end
    local v12
    if v1 == nil then
        v12 = a3.skybox
    else
        v12 = readSkybox(v1)
    end
    v11.skybox = v12
    v11.stageEffects = tbl_3
    return v11
end
return tbl_2