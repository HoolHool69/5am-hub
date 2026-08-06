-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local createGameLoopSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "game-loop-sound").createGameLoopSound
local SOUND_IDS_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "audio", "sound-registry").SOUND_IDS
local engineAudio_upv_1 = RuntimeLib_1.import(script, script.Parent, "highway-rider-config").HIGHWAY_RIDER_CONFIG.engineAudio
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 35
    ]]
    return "HighwayEngineAudio"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 40
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 44
      upvalues:
        SOUND_IDS_upv_1 (copy, index: 1)
    ]]
    a1.mode = a4
    a1.audio = a5
    a1.throttle = 0
    a1.wheelieBlend = 0
    a1.tunnelBlend = 0
    a1.lastTunnelWrite = -1
    a1.lastRevClock = -math.huge
    a1.lastSquealClock = -math.huge
    a1.lastRumbleClock = -math.huge
    local v2
    if a4 ~= "tp" then
        v2 = SOUND_IDS_upv_1.bikeEngineBed
    else
        v2 = SOUND_IDS_upv_1.carEngineBed
    end
    a1.bed = a1:makeSound(a2, a3, "EngineBed", v2, true)
    if a4 ~= "tp" then
        a1.revLayer = a1:makeSound(a2, a3, "EngineRevUp", SOUND_IDS_upv_1.bikeRevUp, false)
    else
        a1.ignition = a1:makeSound(a2, a3, "EngineIgnition", SOUND_IDS_upv_1.carIgnition, false)
    end
    local tbl_3 = {a1:makeTunnelChain(a1.bed, a3)}
    if a1.revLayer ~= nil then
        table.insert(tbl_3, (a1:makeTunnelChain(a1.revLayer, a3)))
    end
    a1.tunnelChains = tbl_3
end
u1.makeSound = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: makeSound
      line: 69
      upvalues:
        createGameLoopSound_upv_1 (copy, index: 1)
    ]]
    local v3 = createGameLoopSound_upv_1({name = a4, soundId = a5, parent = a2, looped = a6})
    a3:Add(v3)
    return v3
end
u1.makeTunnelChain = function(a1, a2, a3)
    --[[
      name: makeTunnelChain
      line: 79
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local tunnel_1 = engineAudio_upv_1.tunnel
    local v4 = Instance.new("EqualizerSoundEffect")
    v4.Name = "TunnelEq"
    v4.Priority = 0
    v4.LowGain = 0
    v4.MidGain = 0
    v4.HighGain = 0
    v4.Parent = a2
    local v5 = Instance.new("ReverbSoundEffect")
    v5.Name = "TunnelReverb"
    v5.Priority = 1
    v5.DecayTime = tunnel_1.decayTime
    v5.Density = tunnel_1.density
    v5.Diffusion = tunnel_1.diffusion
    v5.DryLevel = tunnel_1.dryLevelDb
    v5.WetLevel = -80
    v5.Parent = a2
    a3:Add(v4)
    a3:Add(v5)
    local tbl_4 = {}
    tbl_4.equalizer = v4
    tbl_4.reverb = v5
    return tbl_4
end
u1.setInsideTunnel = function(a1, a2, a3)
    --[[
      name: setInsideTunnel
      line: 104
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local tunnel_2 = engineAudio_upv_1.tunnel
    local v6 = (a2 and 1) or 0
    local v7
    if a1.tunnelBlend >= v6 then
        v7 = tunnel_2.blendOutRate
    else
        v7 = tunnel_2.blendInRate
    end
    a1.tunnelBlend = a1.tunnelBlend + ((v6 - a1.tunnelBlend) * math.min(a3 * v7, 1))
    if math.abs(v6 - a1.tunnelBlend) < 0.004 then
        a1.tunnelBlend = v6
    end
    a1:writeTunnelChains(a1.tunnelBlend)
end
u1.writeTunnelChains = function(a1, a2)
    --[[
      name: writeTunnelChains
      line: 114
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    if math.abs(a2 - a1.lastTunnelWrite) >= 0.002 then
        a1.lastTunnelWrite = a2
        local tunnel_3 = engineAudio_upv_1.tunnel
        local v8 = tunnel_3.wetLevelDb + math.log(math.max(a2, 1e-04), 10) * 20
        for _, value_1 in a1.tunnelChains do
            value_1.reverb.WetLevel = v8
            value_1.equalizer.LowGain = tunnel_3.lowGainDb * a2
            value_1.equalizer.MidGain = tunnel_3.midGainDb * a2
            value_1.equalizer.HighGain = tunnel_3.highGainDb * a2
        end
    else
        return nil
    end
end
u1.setThrottle = function(a1, a2, a3)
    --[[
      name: setThrottle
      line: 128
    ]]
    local throttle_1 = a1.throttle
    a1.throttle = a2
    if (a2 <= 0 or throttle_1 > 0) and a2 < 0 then
        if throttle_1 < 0 then
            return
        end
        a1:onBrakeEngage(a3)
    end
    a1:onAccelEngage(a3)
end
u1.onAccelEngage = function(a1, a2)
    --[[
      name: onAccelEngage
      line: 137
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local revLayer_1 = a1.revLayer
    if revLayer_1 ~= nil then
        local v9 = nil
        if not (revLayer_1.IsPlaying) then
            v9 = engineAudio_upv_1.fp
            local v10 = os.clock()
            if v9.revMaxSpeedFraction > a2 and v10 - a1.lastRevClock >= v9.revCooldownSeconds then
                a1.lastRevClock = v10
                revLayer_1.Volume = v9.revVolume
                revLayer_1.PlaybackSpeed = 1
                revLayer_1:Play()
                return
            end
            return nil
        end
    end
    return nil
end
u1.onBrakeEngage = function(a1, a2)
    --[[
      name: onBrakeEngage
      line: 152
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local v11 = os.clock()
    if a2 >= engineAudio_upv_1.squealMinSpeedFraction and v11 - a1.lastSquealClock >= engineAudio_upv_1.squealCooldownSeconds then
        a1.lastSquealClock = v11
        local play_1 = a1.audio.play
        local tbl_5 = {}
        tbl_5.volume = ((a1.mode ~= "tp") and (engineAudio_upv_1.squealVolume * 0.5)) or (engineAudio_upv_1.squealVolume)
        play_1("tireSqueal", tbl_5)
    else
        return nil
    end
end
u1.onBarrierClamp = function(a1, a2)
    --[[
      name: onBarrierClamp
      line: 167
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local v12 = nil
    if a2 >= 0.1 then
        v12 = os.clock()
        if v12 - a1.lastRumbleClock >= engineAudio_upv_1.rumbleCooldownSeconds then
            a1.lastRumbleClock = v12
            a1.audio.play("shoulderRumble", {volume = engineAudio_upv_1.rumbleVolume * (0.5 + (0.5 * a2))})
        else
            return nil
        end
    else
        return nil
    end
end
u1.playIgnition = function(a1)
    --[[
      name: playIgnition
      line: 181
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local ignition_1 = a1.ignition
    if ignition_1 ~= nil then
        ignition_1.Volume = engineAudio_upv_1.tp.ignitionVolume
        ignition_1:Play()
    else
        return nil
    end
end
u1.update = function(a1, a2, a3, a4, a5)
    --[[
      name: update
      line: 189
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local v13 = nil
    local bed_1 = v13.bed
    local v14
    if v13.mode ~= "tp" then
        v14 = engineAudio_upv_1.fp
    else
        v14 = engineAudio_upv_1.tp
    end
    local v15 = (a3 and (v14.bedVolume * (engineAudio_upv_1.bedSwellFloor + ((1 - engineAudio_upv_1.bedSwellFloor) * a4)) * (1 + ((engineAudio_upv_1.tunnel.bedGain - 1) * v13.tunnelBlend)))) or 0
    if not (bed_1.IsPlaying) and v15 > 0.02 then
        bed_1.Volume = 0
        bed_1:Play()
    end
    if bed_1.IsPlaying then
        v13:glideVolume(bed_1, v15, a2)
        local fp_1 = engineAudio_upv_1.fp
        v13.wheelieBlend = v13.wheelieBlend + ((((a5 and 1) or 0) - v13.wheelieBlend) * math.min(a2 * fp_1.wheelieBoostEaseRate, 1))
        bed_1.PlaybackSpeed = (v14.bedPitchBase + (v14.bedPitchRise * a4)) + (((a1.mode ~= "fp") and 0) or (fp_1.wheeliePitchBoost * v13.wheelieBlend))
    end
    local ignition_2 = v13.ignition
    if ignition_2 ~= nil and ignition_2.IsPlaying then
        local tp_1 = engineAudio_upv_1.tp
        local v16
        if a3 then
            v16 = false
            if v13.throttle <= 0 then
                v16 = a4 < tp_1.ignitionYieldFraction
            end
        else
            v16 = a3
        end
        local v17
        if v16 then
            v17 = tp_1.ignitionVolume
        else
            v17 = 0
        end
        a1:glideVolume(ignition_2, v17, a2)
    else
        a1 = v13
    end
    local revLayer_2 = a1.revLayer
    if revLayer_2 == nil then
        return
    end
    if revLayer_2.IsPlaying then
        local fp_2 = engineAudio_upv_1.fp
        local v18
        if a3 then
            v18 = false
            if a1.throttle > 0 then
                v18 = a4 < fp_2.revFadeOutFraction
            end
        else
            v18 = a3
        end
        local v19
        if v18 then
            v19 = fp_2.revVolume
        else
            v19 = 0
        end
        a1:glideVolume(revLayer_2, v19, a2)
    end
end
u1.glideVolume = function(a1, a2, a3, a4)
    --[[
      name: glideVolume
      line: 227
      upvalues:
        engineAudio_upv_1 (copy, index: 1)
    ]]
    local v20
    if a2.Volume >= a3 then
        v20 = engineAudio_upv_1.fadeOutRate
    else
        v20 = engineAudio_upv_1.fadeInRate
    end
    a2.Volume = a2.Volume + ((a3 - a2.Volume) * math.min(a4 * v20, 1))
    if a3 > 0.02 or a2.Volume >= 0.02 or not a2.IsPlaying then
        return
    end
    a2:Stop()
end
u1.stop = function(a1)
    --[[
      name: stop
      line: 234
    ]]
    a1.throttle = 0
    a1.wheelieBlend = 0
    a1.tunnelBlend = 0
    a1.lastTunnelWrite = -1
    a1:writeTunnelChains(0)
    for _, value_2 in {a1.bed, a1.ignition, a1.revLayer} do
        if value_2 == nil then
            continue
        end
        value_2.Volume = 0
        if value_2.IsPlaying then
            value_2:Stop()
        end
    end
end
local tbl_6 = {}
tbl_6.HighwayEngineAudio = u1
return tbl_6