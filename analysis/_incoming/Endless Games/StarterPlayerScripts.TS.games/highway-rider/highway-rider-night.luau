-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ContentProvider_upv_1 = v1.ContentProvider
local Lighting_upv_1 = v1.Lighting
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local dayNight_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-config").HIGHWAY_RIDER_CONFIG.dayNight
local tbl_upv_1 = {}
tbl_upv_1.ambient = Color3.fromRGB(45, 48, 65)
tbl_upv_1.outdoorAmbient = Color3.fromRGB(85, 95, 130)
tbl_upv_1.colorShiftTop = Color3.fromRGB(255, 255, 255)
tbl_upv_1.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local function smoothstep_1(a1)
    --[[
      name: smoothstep
      line: 43
    ]]
    local v2 = math.clamp(a1, 0, 1)
    return (v2 * v2) * (3 - (v2 * 2))
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 85
    ]]
    return "HighwayDayNightCycle"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 90
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u1)
    return v3:constructor(...) or v3
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 94
      upvalues:
        Lighting_upv_1 (copy, index: 1)
        ContentProvider_upv_1 (copy, index: 2)
    ]]
    a1.dayScalars = a3
    a1.lastAlpha = -1
    a1.skyIsNight = false
    local StageSky_1 = Lighting_upv_1:FindFirstChild("StageSky")
    local StageAtmosphere_1 = Lighting_upv_1:FindFirstChild("StageAtmosphere")
    local StageBloom_1 = Lighting_upv_1:FindFirstChild("StageBloom")
    local StageColorCorrection_1 = Lighting_upv_1:FindFirstChild("StageColorCorrection")
    local StageSunRays_1 = Lighting_upv_1:FindFirstChild("StageSunRays")
    local u2
    u2 = StageSky_1 == nil or not (StageSky_1:IsA("Sky")) or StageSky_1
    a1.sky = u2
    u2 = StageAtmosphere_1 == nil or not (StageAtmosphere_1:IsA("Atmosphere")) or StageAtmosphere_1
    a1.atmosphere = u2
    u2 = StageBloom_1 == nil or not (StageBloom_1:IsA("BloomEffect")) or StageBloom_1
    a1.bloom = u2
    u2 = StageColorCorrection_1 == nil or not (StageColorCorrection_1:IsA("ColorCorrectionEffect")) or StageColorCorrection_1
    a1.correction = u2
    u2 = StageSunRays_1 == nil or not (StageSunRays_1:IsA("SunRaysEffect")) or StageSunRays_1
    a1.sunRays = u2
    u2 = a2:FindFirstChildWhichIsA("Sky")
    local v4 = a2:FindFirstChildWhichIsA("Atmosphere")
    local v5 = a2:FindFirstChildWhichIsA("BloomEffect")
    local v6 = a2:FindFirstChildWhichIsA("ColorCorrectionEffect")
    local v7 = a2:FindFirstChildWhichIsA("SunRaysEffect")
    if a1.sky == nil or u2 == nil then
        warn((("[highway-rider] day/night cycle: %* \226\128\148 skybox swap disabled"):format(((a1.sky ~= nil) and "no Sky in the NightLighting folder") or "no StageSky in Lighting")))
    else
        a1.daySkyTemplate = a1.sky:Clone()
        a1.nightSkyTemplate = u2:Clone()
        a1.activeSky = a1.sky
        task.spawn(
            function()
                --[[
                  line: 118
                  upvalues:
                    ContentProvider_upv_1 (copy, index: 1)
                    u2 (copy, index: 2)
                ]]
                return ContentProvider_upv_1:PreloadAsync({u2})
            end
        )
    end
    local atmosphere_1 = a1.atmosphere
    if atmosphere_1 ~= nil then
        a1.dayAtmosphere = {density = atmosphere_1.Density, offset = atmosphere_1.Offset, color = atmosphere_1.Color, decay = atmosphere_1.Decay, glare = atmosphere_1.Glare, haze = atmosphere_1.Haze}
        local v8
        if v4 == nil then
            v8 = a1.dayAtmosphere
        else
            v8 = {}
            v8.density = v4.Density
            v8.offset = v4.Offset
            v8.color = v4.Color
            v8.decay = v4.Decay
            v8.glare = v4.Glare
            v8.haze = v4.Haze
        end
        a1.nightAtmosphere = v8
    end
    local bloom_1 = a1.bloom
    if bloom_1 ~= nil then
        a1.dayBloom = {intensity = bloom_1.Intensity, size = bloom_1.Size, threshold = bloom_1.Threshold}
        local v9
        if v5 ~= nil and (v5.Enabled) then
            v9 = {}
            v9.intensity = v5.Intensity
            v9.size = v5.Size
            v9.threshold = v5.Threshold
        else
            v9 = a1.dayBloom
        end
        a1.nightBloom = v9
    end
    local correction_1 = a1.correction
    if correction_1 ~= nil then
        a1.dayCorrection = {brightness = correction_1.Brightness, contrast = correction_1.Contrast, saturation = correction_1.Saturation, tintColor = correction_1.TintColor}
        local v10
        if v6 ~= nil and (v6.Enabled) then
            v10 = {}
            v10.brightness = v6.Brightness
            v10.contrast = v6.Contrast
            v10.saturation = v6.Saturation
            v10.tintColor = v6.TintColor
        else
            v10 = a1.dayCorrection
        end
        a1.nightCorrection = v10
    end
    local sunRays_1 = a1.sunRays
    if sunRays_1 ~= nil then
        a1.daySunRays = {intensity = sunRays_1.Intensity, spread = sunRays_1.Spread}
        local v11
        if v7 ~= nil and (v7.Enabled) then
            v11 = {}
            v11.intensity = v7.Intensity
            v11.spread = v7.Spread
        else
            v11 = a1.daySunRays
        end
        a1.nightSunRays = v11
    end
end
u1.alphaAt = function(a1, a2)
    --[[
      name: alphaAt
      line: 184
      upvalues:
        dayNight_upv_1 (copy, index: 1)
    ]]
    local daySeconds_1 = dayNight_upv_1.daySeconds
    local v12 = daySeconds_1 + dayNight_upv_1.transitionSeconds
    local v13 = v12 + dayNight_upv_1.nightSeconds
    local v14 = a2 % (v13 + dayNight_upv_1.transitionSeconds)
    if v14 >= daySeconds_1 then
        if v14 >= v12 then
            if v14 >= v13 then
                local v15 = math.clamp((v14 - v13) / dayNight_upv_1.transitionSeconds, 0, 1)
                return 1 - ((v15 * v15) * (3 - (v15 * 2)))
            end
            return 1
        else
            local v16 = math.clamp((v14 - daySeconds_1) / dayNight_upv_1.transitionSeconds, 0, 1)
            return (v16 * v16) * (3 - (v16 * 2))
        end
    else
        return 0
    end
end
u1.update = function(a1, a2)
    --[[
      name: update
      line: 201
    ]]
    return a1:applyAlpha(a1:alphaAt(a2))
end
u1.applyAlpha = function(a1, a2)
    --[[
      name: applyAlpha
      line: 204
      upvalues:
        tbl_upv_1 (copy, index: 1)
        Lighting_upv_1 (copy, index: 2)
        lerp_upv_1 (copy, index: 3)
        dayNight_upv_1 (copy, index: 4)
    ]]
    local v17, v18, v19, v20 = nil, nil, nil, nil
    if a2 ~= a1.lastAlpha then
        a1.lastAlpha = a2
        local dayScalars_1 = a1.dayScalars
        Lighting_upv_1.ClockTime = lerp_upv_1(dayScalars_1.clockTime, tbl_upv_1.clockTime, a2)
        Lighting_upv_1.GeographicLatitude = lerp_upv_1(dayScalars_1.geographicLatitude, tbl_upv_1.geographicLatitude, a2)
        Lighting_upv_1.Brightness = lerp_upv_1(dayScalars_1.brightness, tbl_upv_1.brightness, a2)
        Lighting_upv_1.ExposureCompensation = lerp_upv_1(dayScalars_1.exposureCompensation, tbl_upv_1.exposureCompensation, a2)
        Lighting_upv_1.EnvironmentDiffuseScale = lerp_upv_1(dayScalars_1.environmentDiffuseScale, tbl_upv_1.environmentDiffuseScale, a2)
        Lighting_upv_1.EnvironmentSpecularScale = lerp_upv_1(dayScalars_1.environmentSpecularScale, tbl_upv_1.environmentSpecularScale, a2)
        Lighting_upv_1.Ambient = dayScalars_1.ambient:Lerp(tbl_upv_1.ambient, a2)
        Lighting_upv_1.OutdoorAmbient = dayScalars_1.outdoorAmbient:Lerp(tbl_upv_1.outdoorAmbient, a2)
        Lighting_upv_1.ColorShift_Top = dayScalars_1.colorShiftTop:Lerp(tbl_upv_1.colorShiftTop, a2)
        Lighting_upv_1.ColorShift_Bottom = dayScalars_1.colorShiftBottom:Lerp(tbl_upv_1.colorShiftBottom, a2)
        if a2 < 0.5 then
            v17 = dayScalars_1
        else
            v17 = tbl_upv_1
        end
        Lighting_upv_1.GlobalShadows = v17.globalShadows
        local v21 = 1 - math.abs((2 * a2) - 1)
        v17 = a1.atmosphere
        local dayAtmosphere_1 = a1.dayAtmosphere
        local nightAtmosphere_1 = a1.nightAtmosphere
        if v17 ~= nil and dayAtmosphere_1 ~= nil and nightAtmosphere_1 ~= nil then
            v17.Density = lerp_upv_1(dayAtmosphere_1.density, nightAtmosphere_1.density, a2) + (dayNight_upv_1.swapMaskDensityBoost * v21)
            v17.Offset = lerp_upv_1(dayAtmosphere_1.offset, nightAtmosphere_1.offset, a2)
            v17.Glare = lerp_upv_1(dayAtmosphere_1.glare, nightAtmosphere_1.glare, a2)
            v17.Haze = lerp_upv_1(dayAtmosphere_1.haze, nightAtmosphere_1.haze, a2)
            v17.Color = dayAtmosphere_1.color:Lerp(nightAtmosphere_1.color, a2)
            v17.Decay = dayAtmosphere_1.decay:Lerp(nightAtmosphere_1.decay, a2)
        end
        v18 = a1.bloom
        local dayBloom_1 = a1.dayBloom
        local nightBloom_1 = a1.nightBloom
        if v18 ~= nil and dayBloom_1 ~= nil and nightBloom_1 ~= nil then
            v18.Intensity = lerp_upv_1(dayBloom_1.intensity, nightBloom_1.intensity, a2)
            v18.Size = lerp_upv_1(dayBloom_1.size, nightBloom_1.size, a2)
            v18.Threshold = lerp_upv_1(dayBloom_1.threshold, nightBloom_1.threshold, a2)
        end
        v19 = a1.correction
        local dayCorrection_1 = a1.dayCorrection
        local nightCorrection_1 = a1.nightCorrection
        if v19 ~= nil and dayCorrection_1 ~= nil and nightCorrection_1 ~= nil then
            v19.Brightness = lerp_upv_1(dayCorrection_1.brightness, nightCorrection_1.brightness, a2)
            v19.Contrast = lerp_upv_1(dayCorrection_1.contrast, nightCorrection_1.contrast, a2)
            v19.Saturation = lerp_upv_1(dayCorrection_1.saturation, nightCorrection_1.saturation, a2)
            v19.TintColor = dayCorrection_1.tintColor:Lerp(nightCorrection_1.tintColor, a2)
        end
        v20 = a1.sunRays
        local daySunRays_1 = a1.daySunRays
        local nightSunRays_1 = a1.nightSunRays
        if v20 ~= nil and daySunRays_1 ~= nil and nightSunRays_1 ~= nil then
            v20.Intensity = lerp_upv_1(daySunRays_1.intensity, nightSunRays_1.intensity, a2)
            v20.Spread = lerp_upv_1(daySunRays_1.spread, nightSunRays_1.spread, a2)
        end
        local v22 = a2 >= 0.5
        if v22 ~= a1.skyIsNight then
            a1.skyIsNight = v22
            local v23
            if v22 then
                v23 = a1.nightSkyTemplate
            else
                v23 = a1.daySkyTemplate
            end
            if v23 ~= nil then
                a1:swapSky(v23)
            end
        end
    end
    return a2
end
u1.swapSky = function(a1, a2)
    --[[
      name: swapSky
      line: 271
      upvalues:
        Lighting_upv_1 (copy, index: 1)
    ]]
    local activeSky_1 = a1.activeSky
    if activeSky_1 ~= nil then
        activeSky_1:Destroy()
    end
    local v24 = a2:Clone()
    v24.Name = "StageSky"
    v24.Parent = Lighting_upv_1
    a1.activeSky = v24
end
u1.destroy = function(a1)
    --[[
      name: destroy
      line: 281
    ]]
    local activeSky_2 = a1.activeSky
    if activeSky_2 ~= nil then
        activeSky_2:Destroy()
    end
    local daySkyTemplate_1 = a1.daySkyTemplate
    if daySkyTemplate_1 ~= nil then
        daySkyTemplate_1:Destroy()
    end
    local nightSkyTemplate_1 = a1.nightSkyTemplate
    if nightSkyTemplate_1 == nil then
        return
    end
    nightSkyTemplate_1:Destroy()
end
local tbl_4 = {}
tbl_4.fadeTransparency = function(a1, a2)
    --[[
      name: fadeTransparency
      line: 56
    ]]
    local tbl_5 = {}
    for _, value_1 in a1.Keypoints do
        table.insert(tbl_5, (NumberSequenceKeypoint.new(value_1.Time, 1 - ((1 - value_1.Value) * a2), value_1.Envelope * a2)))
    end
    return NumberSequence.new(tbl_5)
end
tbl_4.HighwayDayNightCycle = u1
return tbl_4