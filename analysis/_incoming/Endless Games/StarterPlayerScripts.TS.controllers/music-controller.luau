-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local SoundService_upv_1 = v1.SoundService
local TweenService_upv_1 = v1.TweenService
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "audio", "music-registry")
local MUSIC_IDS_upv_1 = v2.MUSIC_IDS
local MUSIC_VOLUME_upv_1 = v2.MUSIC_VOLUME
local getMusicSoundGroup_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "audio", "sound-groups").getMusicSoundGroup
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local u1 = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 24
    ]]
    return "MusicController"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 29
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u2)
    return v3:constructor(...) or v3
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 33
    ]]
    a1.currentId = ""
end
u2.onStart = function(a1)
    --[[
      name: onStart
      line: 36
      upvalues:
        MUSIC_IDS_upv_1 (copy, index: 1)
        subscribe_upv_1 (copy, index: 2)
        sessionAtom_upv_1 (copy, index: 3)
    ]]
    a1:play(MUSIC_IDS_upv_1.hub)
    subscribe_upv_1(
        sessionAtom_upv_1,
        function(a2)
            --[[
              line: 39
              upvalues:
                MUSIC_IDS_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
            ]]
            local v4, v5 = nil, nil
            if a2 ~= nil then
                v4 = MUSIC_IDS_upv_1[a2.gameId]
                if v4 == nil then
                    v4 = MUSIC_IDS_upv_1.hub
                end
                v5 = v4
            else
                v5 = MUSIC_IDS_upv_1.hub
            end
            a1:play(v5)
        end
    )
end
u2.play = function(a1, a2)
    --[[
      name: play
      line: 54
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        getMusicSoundGroup_upv_1 (copy, index: 3)
        SoundService_upv_1 (copy, index: 4)
        MUSIC_VOLUME_upv_1 (copy, index: 5)
    ]]
    local current_upv_1
    if a2 ~= a1.currentId then
        a1.currentId = a2
        current_upv_1 = a1.current
        if current_upv_1 ~= nil then
            TweenService_upv_1:Create(current_upv_1, u1, {}):Play()
            task.delay(
                u1.Time,
                function()
                    --[[
                      line: 64
                      upvalues:
                        current_upv_1 (copy, index: 1)
                    ]]
                    return current_upv_1:Destroy()
                end
            )
        end
        local v6 = Instance.new("Sound")
        v6.Name = "Music"
        v6.SoundId = a2
        v6.SoundGroup = getMusicSoundGroup_upv_1()
        v6.Looped = true
        v6.Volume = 0
        v6.Parent = SoundService_upv_1
        v6:Play()
        a1.current = v6
        local tbl_3 = {}
        tbl_3.Volume = MUSIC_VOLUME_upv_1
        TweenService_upv_1:Create(v6, u1, tbl_3):Play()
    else
        return nil
    end
end
Reflect_1.defineMetadata(u2, "identifier", "client/controllers/music-controller@MusicController")
Reflect_1.defineMetadata(u2, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u2, "$:flamework@Controller", Controller_1, {})
local tbl_4 = {}
tbl_4.MusicController = u2
return tbl_4