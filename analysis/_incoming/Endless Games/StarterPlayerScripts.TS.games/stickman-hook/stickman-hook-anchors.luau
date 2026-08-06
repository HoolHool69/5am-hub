-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local STICKMAN_HOOK_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-config").STICKMAN_HOOK_CONFIG
local tbl_1 = {}
tbl_1.difficultyForScore = function(a1)
    --[[
      name: difficultyForScore
      line: 16
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (math.clamp(a1 / STICKMAN_HOOK_CONFIG_upv_1.scoreForMaxDifficulty, 0, 1))
end
tbl_1.anchorSpecFor = function(a1, a2, a3)
    --[[
      name: anchorSpecFor
      line: 31
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v1 = deriveRandom_upv_1(a1, 0 + a2)
    local v2 = v1:NextNumber()
    local v3 = v1:NextNumber()
    local v4 = v1:NextNumber()
    local v5 = v1:NextNumber()
    local v6 = v1:NextNumber()
    local v7 = v1:NextNumber()
    local v8 = v1:NextNumber()
    if a3 ~= nil then
        local v9 = a3.x / STICKMAN_HOOK_CONFIG_upv_1.studsPerMetre
        local v10 = math.clamp(v9 / STICKMAN_HOOK_CONFIG_upv_1.scoreForMaxDifficulty, 0, 1)
        local v11 = ((a2 >= 4) and 1) or 0.75
        local v12 = math.clamp(a3.y + math.min(((((v3 >= 0.5) and 1) or -1) * (STICKMAN_HOOK_CONFIG_upv_1.anchorScatterStart + ((STICKMAN_HOOK_CONFIG_upv_1.anchorScatterMax - STICKMAN_HOOK_CONFIG_upv_1.anchorScatterStart) * v10))) * v4, STICKMAN_HOOK_CONFIG_upv_1.anchorClimbMax), STICKMAN_HOOK_CONFIG_upv_1.anchorBandMinY, STICKMAN_HOOK_CONFIG_upv_1.anchorBandMaxY)
        local v13 = 0
        local v14 = 0
        if a2 >= 4 and STICKMAN_HOOK_CONFIG_upv_1.movingFromScore <= v9 and v5 < STICKMAN_HOOK_CONFIG_upv_1.movingChanceMax * math.clamp((v9 - STICKMAN_HOOK_CONFIG_upv_1.movingFromScore) / STICKMAN_HOOK_CONFIG_upv_1.movingFromScore, 0, 1) then
            v13, v14 = STICKMAN_HOOK_CONFIG_upv_1.movingAmplitudeMin + (STICKMAN_HOOK_CONFIG_upv_1.movingAmplitudeMax - STICKMAN_HOOK_CONFIG_upv_1.movingAmplitudeMin) * v6, v7 * math.pi * 2
        end
        local v15 = 0
        if a2 >= 4 and STICKMAN_HOOK_CONFIG_upv_1.breakawayFromScore <= v9 and v13 == 0 and v8 < STICKMAN_HOOK_CONFIG_upv_1.breakawayChanceMax * math.clamp((v9 - STICKMAN_HOOK_CONFIG_upv_1.breakawayFromScore) / STICKMAN_HOOK_CONFIG_upv_1.breakawayFromScore, 0, 1) then
            v15 = STICKMAN_HOOK_CONFIG_upv_1.breakawaySeconds
        end
        local tbl_2 = {}
        tbl_2.x = a3.x + ((STICKMAN_HOOK_CONFIG_upv_1.anchorSpacingStart + (((STICKMAN_HOOK_CONFIG_upv_1.anchorSpacingMax - STICKMAN_HOOK_CONFIG_upv_1.anchorSpacingStart) * v10) * v2)) * v11)
        tbl_2.y = v12
        tbl_2.movingAmplitude = v13
        tbl_2.movingPhase = v14
        tbl_2.breakawaySeconds = v15
        return tbl_2
    end
    return {}
end
return tbl_1