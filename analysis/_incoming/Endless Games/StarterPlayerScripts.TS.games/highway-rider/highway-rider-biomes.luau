-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local HIGHWAY_RIDER_CONFIG_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "highway-rider-config").HIGHWAY_RIDER_CONFIG
local dayNight_1 = HIGHWAY_RIDER_CONFIG_1.dayNight
local biomes_upv_1 = HIGHWAY_RIDER_CONFIG_1.biomes
local tbl_1 = {"Chunk", "DesertChunk", "CanyonChunk", "RicefieldChunk", "WinterChunk"}
local tbl_2 = {"StartTunnel", "ModularTunnel", "EndTunnel"}
local tbl_3 = {"Construction1", "Construction2", "Accident", "Accident2", "Accident3"}
local v1 = (dayNight_1.daySeconds + dayNight_1.transitionSeconds) + dayNight_1.nightSeconds + dayNight_1.transitionSeconds
local u1 = v1 * biomes_upv_1.cyclesPerBiome
local u2 = (dayNight_1.daySeconds + dayNight_1.transitionSeconds) + dayNight_1.nightSeconds + v1 * (biomes_upv_1.cyclesPerBiome - 1)
local tbl_4 = {}
tbl_4.biomeOrdinalAt = function(a1)
    --[[
      name: biomeOrdinalAt
      line: 91
      upvalues:
        biomes_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    if biomes_upv_1.enabled then
        return (math.max(0, math.floor((a1 - u2) / u1) + 1))
    end
    return 0
end
tbl_4.biomeDisplayName = function(a1)
    --[[
      name: biomeDisplayName
      line: 99
    ]]
    if a1 ~= "Chunk" then
        local v2 = #a1 - 5
        local v3 = v2 > 0
        if v3 then
            v3 = string.sub(a1, v2 + 1) == "Chunk"
        end
        local v4
        if v3 then
            v4 = string.sub(a1, 1, v2)
        else
            v4 = a1
        end
        return string.upper(v4)
    end
    return "DEFAULT"
end
tbl_4.HIGHWAY_BIOME_CHUNK_NAMES = {fp = {"Chunk", "DesertChunk", "CanyonChunk", "CyberPunkChunk", "WinterChunk"}, tp = tbl_1}
tbl_4.HIGHWAY_TUNNEL_PIECE_NAMES = tbl_2
tbl_4.HIGHWAY_OBSTRUCTION_NAMES = tbl_3
return tbl_4