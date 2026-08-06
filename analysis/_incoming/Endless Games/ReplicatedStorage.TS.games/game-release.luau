-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService_upv_1 = v1.RunService
local Workspace_upv_1 = v1.Workspace
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local tbl_1 = {}
local tbl_2 = {}
local tbl_3 = {}
local tbl_upv_4 = {}
tbl_upv_4["helix-jump"] = tbl_1
tbl_upv_4["tower-builder"] = tbl_1
tbl_upv_4.pong = tbl_2
local v2 = table.clone(tbl_2)
setmetatable(v2, nil)
v2.earlyAccess = true
tbl_upv_4["dunk-shot"] = v2
tbl_upv_4["stickman-hook"] = tbl_2
local v3 = table.clone(tbl_2)
setmetatable(v3, nil)
v3.earlyAccess = true
tbl_upv_4.bloxorz = v3
tbl_upv_4["stack-ball"] = tbl_3
local v4 = table.clone(tbl_3)
setmetatable(v4, nil)
v4.earlyAccess = true
tbl_upv_4["traffic-rush"] = v4
tbl_upv_4["unblock-me"] = tbl_3
tbl_upv_4["lights-out"] = tbl_3
local tbl_5 = {}
local tbl_upv_6 = {}
tbl_upv_6["highway-rider-tp"] = tbl_5
tbl_upv_6["highway-rider-fp"] = tbl_5
local u1 = RunService_upv_1:IsStudio()
local function nowUnix()
    --[[
      name: nowUnix
      line: 212
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    local success_1, v5 = pcall(
        function()
            --[[
              line: 213
              upvalues:
                Workspace_upv_1 (copy, index: 1)
            ]]
            return Workspace_upv_1:GetServerTimeNow()
        end
    )
    local v6
    if (success_1) and type(v5) == "number" then
        v6 = v5
    else
        v6 = os.time()
    end
    local v7 = nil
    if RunService_upv_1:IsStudio() then
        v7 = Workspace_upv_1:GetAttribute("ReleaseDebugOffsetSeconds")
        if type(v7) ~= "number" then
            return v6
        end
        return v6 + v7
    end
    return v6
end
local u2 = nil
local u3 = -1
local tbl_7 = {}
tbl_7.releaseEventFor = function(a1)
    --[[
      name: releaseEventFor
      line: 78
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    return tbl_upv_4[a1]
end
tbl_7.isEarlyAccessGame = function(a1)
    --[[
      name: isEarlyAccessGame
      line: 82
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    local v8 = tbl_upv_4[a1]
    if v8 ~= nil then
        v8 = v8.earlyAccess
    end
    local v9
    if v8 == true then
        v9 = true
    else
        v9 = false
    end
    return v9
end
tbl_7.earlyAccessGameIds = function()
    --[[
      name: earlyAccessGameIds
      line: 95
      upvalues:
        tbl_upv_4 (copy, index: 1)
        GAME_METADATA_upv_1 (copy, index: 2)
    ]]
    local tbl_8 = {}
    for key_1, value_1 in pairs(tbl_upv_4) do
        if value_1.earlyAccess == true then
            table.insert(tbl_8, key_1)
        end
    end
    table.sort(
        tbl_8,
        function(a1, a2)
            --[[
              line: 102
              upvalues:
                GAME_METADATA_upv_1 (copy, index: 1)
            ]]
            return GAME_METADATA_upv_1[a1].order < GAME_METADATA_upv_1[a2].order
        end
    )
    return tbl_8
end
tbl_7.updateEventFor = function(a1)
    --[[
      name: updateEventFor
      line: 130
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    return tbl_upv_6[a1]
end
tbl_7.hasUpdateLanded = function(a1, a2)
    --[[
      name: hasUpdateLanded
      line: 143
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    local atUnix_1 = tbl_upv_6[a1]
    if atUnix_1 ~= nil then
        atUnix_1 = atUnix_1.atUnix
    end
    local v10 = true
    if atUnix_1 ~= nil then
        v10 = atUnix_1 <= a2
    end
    return v10
end
tbl_7.isUpdateLive = function(a1)
    --[[
      name: isUpdateLive
      line: 162
      upvalues:
        nowUnix (ref,  index: 1)
        tbl_upv_6 (copy, index: 2)
    ]]
    local v11 = nowUnix()
    local atUnix_2 = tbl_upv_6[a1]
    if atUnix_2 ~= nil then
        atUnix_2 = atUnix_2.atUnix
    end
    local v12 = true
    if atUnix_2 ~= nil then
        v12 = atUnix_2 <= v11
    end
    return v12
end
tbl_7.isUpdatedGame = function(a1)
    --[[
      name: isUpdatedGame
      line: 177
      upvalues:
        tbl_upv_6 (copy, index: 1)
        nowUnix (ref,  index: 2)
    ]]
    local atUnix_3 = tbl_upv_6[a1]
    if atUnix_3 ~= nil then
        atUnix_3 = atUnix_3.atUnix
    end
    local v13 = nil
    if atUnix_3 ~= nil then
        v13 = nowUnix()
        local v14 = false
        if atUnix_3 <= v13 then
            v14 = v13 < atUnix_3 + 259200
        end
        return v14
    end
    return false
end
tbl_7.nowUnix = nowUnix
tbl_7.releaseAtUnixFor = function(a1)
    --[[
      name: releaseAtUnixFor
      line: 224
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    local v15 = tbl_upv_4[a1]
    if v15 ~= nil then
        v15 = v15.atUnix
    end
    return v15
end
tbl_7.isReleased = function(a1, a2)
    --[[
      name: isReleased
      line: 232
      upvalues:
        GAME_METADATA_upv_1 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
    ]]
    local v16 = nil
    if GAME_METADATA_upv_1[a1].releaseState ~= "live" then
        v16 = tbl_upv_4[a1]
        if v16 ~= nil then
            v16 = v16.atUnix
        end
        local v17 = false
        if v16 ~= nil then
            v17 = v16 <= a2
        end
        return v17
    end
    return true
end
tbl_7.isLiveNow = function(a1)
    --[[
      name: isLiveNow
      line: 244
      upvalues:
        nowUnix (ref,  index: 1)
        GAME_METADATA_upv_1 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
    ]]
    local v18 = nowUnix()
    local v19 = nil
    if GAME_METADATA_upv_1[a1].releaseState ~= "live" then
        v19 = tbl_upv_4[a1]
        if v19 ~= nil then
            v19 = v19.atUnix
        end
        local v20 = false
        if v19 ~= nil then
            v20 = v19 <= v18
        end
        return v20
    end
    return true
end
tbl_7.isPlayableNow = function(a1)
    --[[
      name: isPlayableNow
      line: 248
      upvalues:
        u1 (copy, index: 1)
        nowUnix (ref,  index: 2)
        GAME_METADATA_upv_1 (copy, index: 3)
        tbl_upv_4 (copy, index: 4)
    ]]
    local v21 = nil
    if u1 then
        v21 = u1
    else
        local v22 = nowUnix()
        local v23 = nil
        if GAME_METADATA_upv_1[a1].releaseState ~= "live" then
            v23 = tbl_upv_4[a1]
            if v23 ~= nil then
                v23 = v23.atUnix
            end
            v21 = false
            if v23 ~= nil then
                v21 = v23 <= v22
            end
        else
            return true
        end
    end
    return v21
end
tbl_7.isMysteryGame = function(a1)
    --[[
      name: isMysteryGame
      line: 257
      upvalues:
        nowUnix (ref,  index: 1)
        GAME_METADATA_upv_1 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
    ]]
    local v24 = nowUnix()
    local v25, v26 = nil, nil
    if GAME_METADATA_upv_1[a1].releaseState ~= "live" then
        v25 = tbl_upv_4[a1]
        if v25 ~= nil then
            v25 = v25.atUnix
        end
        v26 = false
        if v25 ~= nil then
            v26 = v25 <= v24
        end
    else
        v26 = true
    end
    return not v26 and (tbl_upv_4[a1] == nil)
end
tbl_7.isNewGame = function(a1)
    --[[
      name: isNewGame
      line: 274
      upvalues:
        tbl_upv_4 (copy, index: 1)
        nowUnix (ref,  index: 2)
    ]]
    local atUnix_4 = tbl_upv_4[a1]
    if atUnix_4 ~= nil then
        atUnix_4 = atUnix_4.atUnix
    end
    local v27 = false
    if atUnix_4 ~= nil then
        v27 = nowUnix() < atUnix_4 + 604800
    end
    return v27
end
tbl_7.secondsUntilRelease = function(a1)
    --[[
      name: secondsUntilRelease
      line: 283
      upvalues:
        tbl_upv_4 (copy, index: 1)
        nowUnix (ref,  index: 2)
    ]]
    local atUnix_5 = tbl_upv_4[a1]
    if atUnix_5 ~= nil then
        atUnix_5 = atUnix_5.atUnix
    end
    if atUnix_5 ~= nil then
        return (math.max(atUnix_5 - nowUnix(), 0))
    end
    return 0
end
tbl_7.isStudioOnlyPreview = function(a1)
    --[[
      name: isStudioOnlyPreview
      line: 302
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    local v28 = false
    if a1.studioOnly == true then
        v28 = RunService_upv_1:IsStudio()
    end
    return v28
end
tbl_7.isHubVisible = function(a1)
    --[[
      name: isHubVisible
      line: 316
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    if a1.hidden == true then
        local v29 = false
        if a1.studioOnly == true then
            v29 = RunService_upv_1:IsStudio()
        end
        return v29
    end
    return true
end
tbl_7.liveGameIds = function()
    --[[
      name: liveGameIds
      line: 331
      upvalues:
        nowUnix (ref,  index: 1)
        tbl_upv_4 (copy, index: 2)
        u2 (ref,  index: 3)
        u3 (ref,  index: 4)
        GAME_METADATA_upv_1 (copy, index: 5)
    ]]
    local v30 = nowUnix()
    local v31 = 0
    for _, value_2 in pairs(tbl_upv_4) do
        if value_2.atUnix <= v30 then
            v31 = v31 + 1
        end
    end
    local v32 = u2
    if v32 ~= nil and u3 == v31 then
        return v32
    end
    local tbl_9 = {}
    local v33 = nil
    local v34 = nil
    for key_2, value_3 in pairs(GAME_METADATA_upv_1) do
        if value_3.hidden == true then
            continue
        end
        if GAME_METADATA_upv_1[key_2].releaseState ~= "live" then
            v34 = tbl_upv_4[key_2]
            if v34 ~= nil then
                v34 = v34.atUnix
            end
            v33 = false
            if v34 ~= nil then
                v33 = v34 <= v30
            end
        else
            v33 = true
        end
        if v33 then
            table.insert(tbl_9, key_2)
        end
    end
    table.sort(
        tbl_9,
        function(a1, a2)
            --[[
              line: 349
              upvalues:
                GAME_METADATA_upv_1 (copy, index: 1)
            ]]
            return GAME_METADATA_upv_1[a1].order < GAME_METADATA_upv_1[a2].order
        end
    )
    u2 = tbl_9
    u3 = v31
    return tbl_9
end
tbl_7.STUDIO_PREVIEW = u1
return tbl_7