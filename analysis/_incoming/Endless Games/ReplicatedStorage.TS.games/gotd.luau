-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local GAME_METADATA_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-metadata").GAME_METADATA
local GAME_IDS_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-id").GAME_IDS
local isReleased_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-release").isReleased
local tbl_upv_1 = {
    {rotation = {"flappy-bird", "stack", "knife-hit", "suika", "timberman", "number-merge", "zig-zag", "fruit-ninja", "2048", "crossy-road", "doodle-jump", "highway-rider-tp", "highway-rider-fp", "tiny-wings", "tetris", "icy-tower", "flappy-basket"}},
    {rotation = {"flappy-bird", "helix-jump", "stack", "knife-hit", "suika", "timberman", "number-merge", "zig-zag", "fruit-ninja", "2048", "crossy-road", "doodle-jump", "highway-rider-tp", "highway-rider-fp", "tiny-wings", "tetris", "icy-tower", "flappy-basket", "tower-builder"}}
}
local function eraFor_1(a1)
    --[[
      name: eraFor
      line: 69
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1[1]
    for _, value_1 in tbl_upv_1 do
        if a1 < value_1.fromDay then
            break
        else
            v1 = value_1
        end
    end
    return v1
end
local function u1(a1)
    --[[
      name: gotdRoster
      line: 87
      upvalues:
        tbl_upv_1 (copy, index: 1)
        u1 (ref,  index: 2)
    ]]
    local tbl_2 = {}
    local v2 = math.floor(a1 / 86400)
    local v3 = tbl_upv_1[1]
    local _ = nil
    local v4 = nil
    for v5, value_2 in tbl_upv_1 do
        if v2 < value_2.fromDay then
            break
        else
            v3 = value_2
        end
    end
    for v6, value_3 in v3.rotation do
        if u1(value_3, a1) then
            table.insert(tbl_2, value_3)
        end
    end
    return tbl_2
end
u1 = function(a1, a2)
    --[[
      name: isEligibleForDay
      line: 97
      upvalues:
        GAME_METADATA_upv_1 (copy, index: 1)
        isReleased_upv_1 (copy, index: 2)
    ]]
    local v4 = GAME_METADATA_upv_1[a1]
    local v5 = false
    if v4.hidden ~= true then
        local v6 = false
        if v4.dailyExcluded == true then
            v5 = v6
        else
            v5 = isReleased_upv_1(a1, a2)
        end
    end
    return v5
end
u1 = function(a1)
    --[[
      name: featuredGameFor
      line: 117
      upvalues:
        tbl_upv_1 (copy, index: 1)
        u1 (ref,  index: 2)
    ]]
    local v7 = tbl_upv_1[1]
    local v8 = nil
    local v9 = nil
    local v10 = nil
    local v11 = nil
    for v10, v12 in tbl_upv_1 do
        if a1 < v12.fromDay then
            break
        else
            v7 = v12
        end
    end
    v8 = #v7.rotation
    v9 = a1 % v8
    v10, v11 = false, 0
    local v12 = nil
    while true do
        if v10 then
            v11 = v11 + 1
        else
            v10 = true
        end
        if v11 >= v8 then
            return v7.rotation[v9 + 1]
        end
        v12 = v7.rotation[((v9 + v11) % v8) + 1]
        if u1(v12, a1 * 86400) then
            break
        end
    end
    return v12
end
u1 = function(a1)
    --[[
      name: auditGotdRotation
      line: 149
      upvalues:
        tbl_upv_1 (copy, index: 1)
        GAME_IDS_upv_1 (copy, index: 2)
        u1 (ref,  index: 3)
    ]]
    local tbl_3 = {}
    for _, value_4 in tbl_upv_1[#tbl_upv_1].rotation do
        tbl_3[value_4] = true
    end
    local tbl_4 = {}
    for _, value_5 in GAME_IDS_upv_1 do
        if tbl_3[value_5] ~= nil then
            continue
        end
        if u1(value_5, a1) then
            table.insert(tbl_4, value_5)
        end
    end
    return tbl_4
end
local tbl_upv_5 = {{}, {}, {}, {}, {}, {}, {}, {}, {}}
local tbl_6 = {}
tbl_6.dayIndexFromUnix = function(a1)
    --[[
      name: dayIndexFromUnix
      line: 21
    ]]
    return (math.floor(a1 / 86400))
end
tbl_6.secondsUntilReset = function(a1)
    --[[
      name: secondsUntilReset
      line: 25
    ]]
    return 86400 - (a1 % 86400)
end
tbl_6.dayResetUnix = function(a1)
    --[[
      name: dayResetUnix
      line: 29
    ]]
    return (a1 + 1) * 86400
end
tbl_6.gotdRoster = u1
tbl_6.featuredGameFor = u1
tbl_6.auditGotdRotation = u1
tbl_6.rewardTierIndexFor = function(a1)
    --[[
      name: rewardTierIndexFor
      line: 222
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    if a1 ~= nil then
        for n_1 = 0, #tbl_upv_5 - 1 do
            if a1 > tbl_upv_5[n_1 + 1].maxRank then
                continue
            end
            return n_1
        end
    end
    return nil
end
tbl_6.GOTD_REWARD_TIERS = tbl_upv_5
return tbl_6