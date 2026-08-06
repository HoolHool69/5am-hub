-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Players_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "audio", "sound-groups")
local getGameLoopSoundGroup_upv_1 = v1.getGameLoopSoundGroup
local getMusicSoundGroup_upv_1 = v1.getMusicSoundGroup
local getSfxSoundGroup_upv_1 = v1.getSfxSoundGroup
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "settings-atoms")
local boardPreferencesAtom_upv_1 = v2.boardPreferencesAtom
local highwayControlsAtom_upv_1 = v2.highwayControlsAtom
local hubSettingsAtom_upv_1 = v2.hubSettingsAtom
local perGameSettingsAtom_upv_1 = v2.perGameSettingsAtom
local tetrisHandlingAtom_upv_1 = v2.tetrisHandlingAtom
local tetrisKeybindsAtom_upv_1 = v2.tetrisKeybindsAtom
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v3.gameFrozenAtom
local pausedAtom_upv_1 = v3.pausedAtom
local sanitizeBoardPreferences_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "board-preferences").sanitizeBoardPreferences
local v4 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "player-settings")
local effectiveSettings_upv_1 = v4.effectiveSettings
local sanitizeHighwayControls_upv_1 = v4.sanitizeHighwayControls
local sanitizeTetrisHandling_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tetris-handling").sanitizeTetrisHandling
local sanitizeTetrisKeybinds_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tetris-keybinds").sanitizeTetrisKeybinds
local playersAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").playersAtom
local str_upv_1 = tostring(Players_1.LocalPlayer.UserId)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 47
    ]]
    return "SettingsController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 52
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u1)
    return v5:constructor(...) or v5
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 56
    ]]
    a1.seeded = false
    a1.seeding = false
    a1.persistQueued = false
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 61
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        hubSettingsAtom_upv_1 (copy, index: 2)
        perGameSettingsAtom_upv_1 (copy, index: 3)
        highwayControlsAtom_upv_1 (copy, index: 4)
        boardPreferencesAtom_upv_1 (copy, index: 5)
        tetrisKeybindsAtom_upv_1 (copy, index: 6)
        tetrisHandlingAtom_upv_1 (copy, index: 7)
        sessionAtom_upv_1 (copy, index: 8)
        pausedAtom_upv_1 (copy, index: 9)
        gameFrozenAtom_upv_1 (copy, index: 10)
        playersAtom_upv_1 (copy, index: 11)
    ]]
    a1:applyAudio()
    local function v6()
        --[[
          line: 63
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1:applyAudio()
        a1:queuePersist()
    end
    subscribe_upv_1(hubSettingsAtom_upv_1, v6)
    subscribe_upv_1(perGameSettingsAtom_upv_1, v6)
    subscribe_upv_1(
        highwayControlsAtom_upv_1,
        function()
            --[[
              line: 71
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:queuePersist()
        end
    )
    subscribe_upv_1(
        boardPreferencesAtom_upv_1,
        function()
            --[[
              line: 74
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:queuePersist()
        end
    )
    subscribe_upv_1(
        tetrisKeybindsAtom_upv_1,
        function()
            --[[
              line: 77
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:queuePersist()
        end
    )
    subscribe_upv_1(
        tetrisHandlingAtom_upv_1,
        function()
            --[[
              line: 80
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:queuePersist()
        end
    )
    subscribe_upv_1(
        sessionAtom_upv_1,
        function()
            --[[
              line: 84
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyAudio()
        end
    )
    subscribe_upv_1(
        pausedAtom_upv_1,
        function()
            --[[
              line: 89
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyAudio()
        end
    )
    subscribe_upv_1(
        gameFrozenAtom_upv_1,
        function()
            --[[
              line: 92
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyAudio()
        end
    )
    subscribe_upv_1(
        playersAtom_upv_1,
        function()
            --[[
              line: 96
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:trySeed()
        end
    )
    a1:trySeed()
end
u1.trySeed = function(a1)
    --[[
      name: trySeed
      line: 101
      upvalues:
        playersAtom_upv_1 (copy, index: 1)
        str_upv_1 (copy, index: 2)
        hubSettingsAtom_upv_1 (copy, index: 3)
        perGameSettingsAtom_upv_1 (copy, index: 4)
        highwayControlsAtom_upv_1 (copy, index: 5)
        sanitizeHighwayControls_upv_1 (copy, index: 6)
        boardPreferencesAtom_upv_1 (copy, index: 7)
        sanitizeBoardPreferences_upv_1 (copy, index: 8)
        tetrisKeybindsAtom_upv_1 (copy, index: 9)
        sanitizeTetrisKeybinds_upv_1 (copy, index: 10)
        tetrisHandlingAtom_upv_1 (copy, index: 11)
        sanitizeTetrisHandling_upv_1 (copy, index: 12)
    ]]
    local u2
    if a1.seeded then
        return nil
    end
    u2 = playersAtom_upv_1()[str_upv_1]
    if u2 ~= nil then
        a1.seeded = true
        a1.seeding = true
        hubSettingsAtom_upv_1(
            function()
                --[[
                  line: 112
                  upvalues:
                    u2 (copy, index: 1)
                ]]
                return u2.settings.hub
            end
        )
        perGameSettingsAtom_upv_1(
            function()
                --[[
                  line: 115
                  upvalues:
                    u2 (copy, index: 1)
                ]]
                return u2.settings.perGame
            end
        )
        highwayControlsAtom_upv_1(
            function()
                --[[
                  line: 118
                  upvalues:
                    sanitizeHighwayControls_upv_1 (copy, index: 1)
                    u2 (copy, index: 2)
                ]]
                return sanitizeHighwayControls_upv_1(u2.settings.highway)
            end
        )
        boardPreferencesAtom_upv_1(
            function()
                --[[
                  line: 121
                  upvalues:
                    sanitizeBoardPreferences_upv_1 (copy, index: 1)
                    u2 (copy, index: 2)
                ]]
                return sanitizeBoardPreferences_upv_1(u2.settings.boards)
            end
        )
        tetrisKeybindsAtom_upv_1(
            function()
                --[[
                  line: 124
                  upvalues:
                    sanitizeTetrisKeybinds_upv_1 (copy, index: 1)
                    u2 (copy, index: 2)
                ]]
                return sanitizeTetrisKeybinds_upv_1(u2.settings.tetris)
            end
        )
        tetrisHandlingAtom_upv_1(
            function()
                --[[
                  line: 127
                  upvalues:
                    sanitizeTetrisHandling_upv_1 (copy, index: 1)
                    u2 (copy, index: 2)
                ]]
                return sanitizeTetrisHandling_upv_1(u2.settings.tetrisHandling)
            end
        )
        a1.seeding = false
    else
        return nil
    end
end
u1.queuePersist = function(a1)
    --[[
      name: queuePersist
      line: 132
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
        hubSettingsAtom_upv_1 (copy, index: 2)
        perGameSettingsAtom_upv_1 (copy, index: 3)
        highwayControlsAtom_upv_1 (copy, index: 4)
        boardPreferencesAtom_upv_1 (copy, index: 5)
        tetrisKeybindsAtom_upv_1 (copy, index: 6)
        tetrisHandlingAtom_upv_1 (copy, index: 7)
    ]]
    if a1.seeding or a1.persistQueued then
        return nil
    end
    a1.persistQueued = true
    task.delay(
        0.4,
        function()
            --[[
              line: 140
              upvalues:
                a1 (copy, index: 1)
                ClientEvents_upv_1 (copy, index: 2)
                hubSettingsAtom_upv_1 (copy, index: 3)
                perGameSettingsAtom_upv_1 (copy, index: 4)
                highwayControlsAtom_upv_1 (copy, index: 5)
                boardPreferencesAtom_upv_1 (copy, index: 6)
                tetrisKeybindsAtom_upv_1 (copy, index: 7)
                tetrisHandlingAtom_upv_1 (copy, index: 8)
            ]]
            a1.persistQueued = false
            ClientEvents_upv_1.updateSettings:fire({hub = hubSettingsAtom_upv_1(), perGame = perGameSettingsAtom_upv_1(), highway = highwayControlsAtom_upv_1(), boards = boardPreferencesAtom_upv_1(), tetris = tetrisKeybindsAtom_upv_1(), tetrisHandling = tetrisHandlingAtom_upv_1()})
        end
    )
end
u1.applyAudio = function(a1)
    --[[
      name: applyAudio
      line: 158
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        effectiveSettings_upv_1 (copy, index: 2)
        hubSettingsAtom_upv_1 (copy, index: 3)
        perGameSettingsAtom_upv_1 (copy, index: 4)
        pausedAtom_upv_1 (copy, index: 5)
        gameFrozenAtom_upv_1 (copy, index: 6)
        getSfxSoundGroup_upv_1 (copy, index: 7)
        getGameLoopSoundGroup_upv_1 (copy, index: 8)
        getMusicSoundGroup_upv_1 (copy, index: 9)
    ]]
    local v7 = sessionAtom_upv_1()
    if v7 ~= nil then
        v7 = v7.gameId
    end
    local v8 = effectiveSettings_upv_1(hubSettingsAtom_upv_1(), perGameSettingsAtom_upv_1(), v7)
    local v9 = ((v8.sfxMuted) and 0) or (v8.sfxVolume)
    local v10 = pausedAtom_upv_1() or (gameFrozenAtom_upv_1())
    getSfxSoundGroup_upv_1().Volume = v9
    local v11 = getGameLoopSoundGroup_upv_1()
    local v12
    if v10 then
        v12 = 0
    else
        v12 = v9
    end
    v11.Volume = v12
    local v13 = getMusicSoundGroup_upv_1()
    v13.Volume = ((v8.musicMuted) and 0) or (v8.musicVolume)
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/settings-controller@SettingsController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.SettingsController = u1
return tbl_3