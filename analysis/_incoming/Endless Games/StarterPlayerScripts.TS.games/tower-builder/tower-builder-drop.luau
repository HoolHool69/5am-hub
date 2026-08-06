-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local TOWER_BUILDER_CONFIG_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local tbl_1 = {}
tbl_1.flightOffsetX = function(a1, a2)
    --[[
      name: flightOffsetX
      line: 27
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local flightDragPerSecond_1 = TOWER_BUILDER_CONFIG_upv_1.flightDragPerSecond
    if flightDragPerSecond_1 > 0 then
        return (a1 / flightDragPerSecond_1) * (1 - math.exp(-flightDragPerSecond_1 * a2))
    end
    return a1 * a2
end
tbl_1.solveDrop = function(a1, a2, a3)
    --[[
      name: solveDrop
      line: 52
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v1 = a2 * TOWER_BUILDER_CONFIG_upv_1.ropeLength * TOWER_BUILDER_CONFIG_upv_1.momentumCarryFactor
    local v2 = math.sin(a1) * TOWER_BUILDER_CONFIG_upv_1.ropeLength
    local v3 = v1 * math.cos(a1)
    local v4 = v1 * math.sin(a1)
    local v5 = (v4 + math.sqrt((v4 * v4) + ((2 * TOWER_BUILDER_CONFIG_upv_1.dropGravity) * math.max(a3, 0)))) / TOWER_BUILDER_CONFIG_upv_1.dropGravity
    local tbl_2 = {}
    tbl_2.startX = v2
    tbl_2.velocityX = v3
    tbl_2.velocityY = v4
    tbl_2.durationSeconds = v5
    local flightDragPerSecond_2 = TOWER_BUILDER_CONFIG_upv_1.flightDragPerSecond
    local v6 = ((flightDragPerSecond_2 > 0) and (v3 / flightDragPerSecond_2 * (1 - math.exp(-flightDragPerSecond_2 * v5)))) or (v3 * v5)
    tbl_2.landingX = v2 + v6
    return tbl_2
end
tbl_1.settledDropHeight = function(a1)
    --[[
      name: settledDropHeight
      line: 77
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return TOWER_BUILDER_CONFIG_upv_1.dropDistance + (TOWER_BUILDER_CONFIG_upv_1.ropeLength * (1 - math.cos(a1)))
end
tbl_1.ropeAngularVelocity = function(a1, a2)
    --[[
      name: ropeAngularVelocity
      line: 87
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    return (TOWER_BUILDER_CONFIG_upv_1.swingAmplitudeRadians * math.cos(a1)) * (math.tau / a2)
end
return tbl_1