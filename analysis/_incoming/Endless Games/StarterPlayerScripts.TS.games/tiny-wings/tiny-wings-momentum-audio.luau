-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local momentumAudio_upv_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-config").TINY_WINGS_CONFIG.momentumAudio
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 34
    ]]
    return "TinyWingsMomentumAudio"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 39
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 43
      upvalues:
        SOUND_IDS_upv_1 (copy, index: 1)
    ]]
    a1.previousSpeed = 0
    a1.gainBlend = 0
    a1.holdBlend = 0
    a1.resyncPending = true
    a1.holdGate = 0
    a1.speedBand = 0
    a1.buildTerm = 0.5
    a1.rumble = a1:makeSound(a2, a3, "MomentumRumble", SOUND_IDS_upv_1.tinyWingsMomentumRumble)
    a1.air = a1:makeSound(a2, a3, "MomentumAir", SOUND_IDS_upv_1.tinyWingsMomentumAir)
end
u1.makeSound = function(a1, a2, a3, a4, a5)
    --[[
      name: makeSound
      line: 54
      upvalues:
        createGameLoopSound_upv_1 (copy, index: 1)
    ]]
    local v2 = createGameLoopSound_upv_1({name = a4, soundId = a5, parent = a2})
    a3:Add(v2)
    return v2
end
u1.step = function(a1, a2, a3)
    --[[
      name: step
      line: 63
      upvalues:
        momentumAudio_upv_1 (copy, index: 1)
    ]]
    if a1.resyncPending then
        a1.resyncPending = false
    end
    a1.previousSpeed = a3
    a1.gainBlend = a1.gainBlend + ((math.clamp(((a3 - a1.previousSpeed) / a2) / momentumAudio_upv_1.gainScale, -1, 1) - a1.gainBlend) * math.min(a2 * momentumAudio_upv_1.gainEaseRate, 1))
end
u1.update = function(a1, a2, a3, a4, a5)
    --[[
      name: update
      line: 79
      upvalues:
        momentumAudio_upv_1 (copy, index: 1)
    ]]
    local v3
    if (a3) and (a5) then
        v3 = 1
    else
        v3 = 0
    end
    local v4
    if a1.holdBlend >= v3 then
        v4 = momentumAudio_upv_1.holdFadeOutRate
    else
        v4 = momentumAudio_upv_1.holdFadeInRate
    end
    a1.holdBlend = a1.holdBlend + ((v3 - a1.holdBlend) * math.min(a2 * v4, 1))
    a1.holdGate = momentumAudio_upv_1.releaseFloor + ((1 - momentumAudio_upv_1.releaseFloor) * a1.holdBlend)
    a1.speedBand = math.clamp((a4 - momentumAudio_upv_1.speedFloor) / (momentumAudio_upv_1.speedCeiling - momentumAudio_upv_1.speedFloor), 0, 1)
    a1.buildTerm = 0.5 + (0.5 * a1.gainBlend)
    a1:driveLayer(a1.rumble, momentumAudio_upv_1.rumble, a2, a3)
    a1:driveLayer(a1.air, momentumAudio_upv_1.air, a2, a3)
end
u1.driveLayer = function(a1, a2, a3, a4, a5)
    --[[
      name: driveLayer
      line: 90
    ]]
    local v5 = (a5 and (a3.volumeMax * a1.holdGate * ((a3.speedWeight * a1.speedBand) + (a3.gainWeight * a1.buildTerm)))) or 0
    if not (a2.IsPlaying) then
        if v5 > 0.02 then
            a2.Volume = 0
            a2:Play()
        else
            return nil
        end
    end
    a1:glideVolume(a2, v5, a4)
    a2.PlaybackSpeed = (a3.pitchBase + (a3.pitchRise * a1.speedBand)) + (a3.pitchGainSwing * a1.gainBlend)
end
u1.glideVolume = function(a1, a2, a3, a4)
    --[[
      name: glideVolume
      line: 104
      upvalues:
        momentumAudio_upv_1 (copy, index: 1)
    ]]
    local v6
    if a2.Volume >= a3 then
        v6 = momentumAudio_upv_1.fadeOutRate
    else
        v6 = momentumAudio_upv_1.fadeInRate
    end
    a2.Volume = a2.Volume + ((a3 - a2.Volume) * math.min(a4 * v6, 1))
    if a3 > 0.02 or a2.Volume >= 0.02 or not a2.IsPlaying then
        return
    end
    a2:Stop()
end
u1.stop = function(a1)
    --[[
      name: stop
      line: 111
    ]]
    a1.gainBlend = 0
    a1.holdBlend = 0
    a1.buildTerm = 0.5
    a1.resyncPending = true
    a1:silence()
end
u1.silence = function(a1)
    --[[
      name: silence
      line: 118
    ]]
    a1.rumble.Volume = 0
    if a1.rumble.IsPlaying then
        a1.rumble:Stop()
    end
    a1.air.Volume = 0
    if not a1.air.IsPlaying then
        return
    end
    a1.air:Stop()
end
local tbl_3 = {}
tbl_3.TinyWingsMomentumAudio = u1
return tbl_3