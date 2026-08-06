-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-release")
local isReleased_upv_1 = v1.isReleased
local isStudioOnlyPreview_upv_1 = v1.isStudioOnlyPreview
local nowUnix_upv_1 = v1.nowUnix
local releaseAtUnixFor_upv_1 = v1.releaseAtUnixFor
local function hasEarlyAccess(a1, a2)
    --[[
      name: hasEarlyAccess
      line: 86
      upvalues:
        releaseAtUnixFor_upv_1 (copy, index: 1)
    ]]
    if a2 ~= nil then
        local v2 = releaseAtUnixFor_upv_1(a1) ~= nil
        if v2 then
            v2 = table.find(a2, a1) ~= nil
        end
        return v2
    end
    return false
end
local tbl_1 = {}
tbl_1.gameLockStateFor = function(a1, a2, a3)
    --[[
      name: gameLockStateFor
      line: 51
      upvalues:
        GAME_METADATA_upv_1 (copy, index: 1)
        isStudioOnlyPreview_upv_1 (copy, index: 2)
        isReleased_upv_1 (copy, index: 3)
        nowUnix_upv_1 (copy, index: 4)
        hasEarlyAccess (ref,  index: 5)
        releaseAtUnixFor_upv_1 (copy, index: 6)
    ]]
    local v3 = GAME_METADATA_upv_1[a1]
    if isStudioOnlyPreview_upv_1(v3) then
        return "unlocked"
    end
    if isReleased_upv_1(a1, nowUnix_upv_1()) then
        local v4 = v3.groupLocked == true
        if v4 then
            local v5 = a2 == nil
            if not (v5) then
                local v6 = table.find(a2, a1) ~= nil
                v5 = not v6
            end
            v4 = v5
        end
        if v4 then
            return "groupLocked"
        end
        return "unlocked"
    end
    if hasEarlyAccess(a1, a3) then
        return "unlocked"
    elseif releaseAtUnixFor_upv_1(a1) == nil then
        return "comingSoon"
    else
        return "releaseTimer"
    end
end
tbl_1.hasEarlyAccess = hasEarlyAccess
return tbl_1