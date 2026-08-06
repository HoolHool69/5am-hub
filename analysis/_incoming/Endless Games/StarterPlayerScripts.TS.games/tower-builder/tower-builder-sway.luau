-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local TOWER_BUILDER_CONFIG_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local tbl_1 = {}
tbl_1.swayAmplitudeFor = function(a1, a2)
    --[[
      name: swayAmplitudeFor
      line: 24
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a1 ~= 0 then
        return TOWER_BUILDER_CONFIG_upv_1.blockWidth * math.clamp((a1 / TOWER_BUILDER_CONFIG_upv_1.swayFloorScale) * (TOWER_BUILDER_CONFIG_upv_1.swayBaseLean + ((a2 / a1) / (TOWER_BUILDER_CONFIG_upv_1.blockWidth / 2))), 0, TOWER_BUILDER_CONFIG_upv_1.swayMaxAmplitudeFrac)
    end
    return 0
end
return tbl_1