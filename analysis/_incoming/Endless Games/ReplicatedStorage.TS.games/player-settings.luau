-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.clampPlayerSettings = function(a1)
    --[[
      name: clampPlayerSettings
      line: 60
    ]]
    local tbl_4 = {}
    tbl_4.sfxVolume = math.clamp(a1.sfxVolume, 0, 1)
    tbl_4.musicVolume = math.clamp(a1.musicVolume, 0, 1)
    tbl_4.sfxMuted = a1.sfxMuted == true
    tbl_4.musicMuted = a1.musicMuted == true
    return tbl_4
end
tbl_3.clampSensitivity = function(a1)
    --[[
      name: clampSensitivity
      line: 75
    ]]
    if type(a1) == "number" and a1 == a1 then
        return math.round(math.clamp(a1, 0.5, 1) * 100) / 100
    end
    return 0.8
end
tbl_3.sanitizeHighwayControls = function(a1)
    --[[
      name: sanitizeHighwayControls
      line: 100
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 ~= nil then
        local v1 = ((a1.steering ~= "tilt") and "buttons") or "tilt"
        local v2 = ((a1.throttle ~= "auto") and "manual") or "auto"
        local v3 = ((a1.layout ~= "split") and "default") or "split"
        local tbl_5 = {}
        tbl_5.steering = v1
        tbl_5.layout = v3
        tbl_5.throttle = v2
        local steerSensitivity_1 = a1.steerSensitivity
        tbl_5.steerSensitivity = type(steerSensitivity_1) ~= "number" and 0.8 or steerSensitivity_1 == steerSensitivity_1 and math.round(math.clamp(steerSensitivity_1, 0.5, 1) * 100) / 100 or 0.8
        local throttleSensitivity_1 = a1.throttleSensitivity
        tbl_5.throttleSensitivity = type(throttleSensitivity_1) ~= "number" and 0.8 or throttleSensitivity_1 == throttleSensitivity_1 and math.round(math.clamp(throttleSensitivity_1, 0.5, 1) * 100) / 100 or 0.8
        return tbl_5
    end
    return tbl_upv_1
end
tbl_3.highwaySteerFactor = function(a1)
    --[[
      name: highwaySteerFactor
      line: 123
    ]]
    local steerSensitivity_2 = a1.steerSensitivity
    local v6 = ((type(steerSensitivity_2) ~= "number") and 0.8) or (((steerSensitivity_2 == steerSensitivity_2) and (math.round(math.clamp(steerSensitivity_2, 0.5, 1) * 100) / 100)) or 0.8)
    return v6 / 0.8
end
tbl_3.highwayThrottleFactor = function(a1)
    --[[
      name: highwayThrottleFactor
      line: 127
    ]]
    local throttleSensitivity_2 = a1.throttleSensitivity
    local v7 = ((type(throttleSensitivity_2) ~= "number") and 0.8) or (((throttleSensitivity_2 == throttleSensitivity_2) and (math.round(math.clamp(throttleSensitivity_2, 0.5, 1) * 100) / 100)) or 0.8)
    return v7 / 0.8
end
tbl_3.effectiveThrottle = function(a1)
    --[[
      name: effectiveThrottle
      line: 138
    ]]
    if a1.steering == "buttons" and a1.layout == "split" then
        return "auto"
    end
    return a1.throttle
end
tbl_3.effectiveSettings = function(a1, a2, a3)
    --[[
      name: effectiveSettings
      line: 147
    ]]
    if a3 ~= nil then
        return a2[a3] or a1
    end
    return a1
end
tbl_3.DEFAULT_HIGHWAY_CONTROLS = tbl_upv_1
tbl_3.DEFAULT_PLAYER_SETTINGS = tbl_2
tbl_3.DEFAULT_AUDIO_SETTINGS = {hub = tbl_2, perGame = {}}
return tbl_3