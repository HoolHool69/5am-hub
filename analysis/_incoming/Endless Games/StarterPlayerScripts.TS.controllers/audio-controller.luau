-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "audio", "sound-voices")
local playSoundVoice_upv_1 = v1.playSoundVoice
local warmSoundVoices_upv_1 = v1.warmSoundVoices
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 18
    ]]
    return "AudioController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 23
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 27
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 29
      upvalues:
        warmSoundVoices_upv_1 (copy, index: 1)
    ]]
    warmSoundVoices_upv_1()
end
u1.play = function(a1, a2, a3)
    --[[
      name: play
      line: 32
      upvalues:
        playSoundVoice_upv_1 (copy, index: 1)
    ]]
    playSoundVoice_upv_1(a2, a3)
end
u1.createHandle = function(a1)
    --[[
      name: createHandle
      line: 35
    ]]
    local tbl_3 = {}
    tbl_3.play = function(a2, a3)
        --[[
          name: play
          line: 37
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:play(a2, a3)
    end
    return tbl_3
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/audio-controller@AudioController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_4 = {}
tbl_4.AudioController = u1
return tbl_4