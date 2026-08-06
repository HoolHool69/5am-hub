-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {{}, {}, {}, {}, {emergencyRoster = {"ambulance", "police"}}, {emergencyRoster = {"police", "police", "police"}}}
local tbl_2 = {}
tbl_2.directorEvent = function(a1)
    --[[
      name: directorEvent
      line: 98
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    for _, value_1 in tbl_upv_1 do
        if value_1.kind ~= a1 then
            continue
        end
        return value_1
    end
    return nil
end
tbl_2.directorEventLabel = function(a1)
    --[[
      name: directorEventLabel
      line: 108
    ]]
    if a1 == "rampTruck" then
        return "RAMP TRUCK"
    elseif a1 == "oilTruck" then
        return "OIL TRUCK"
    elseif a1 == "tunnel" then
        return "TUNNEL"
    elseif a1 == "emergencySingle" then
        return "EMERGENCY"
    elseif a1 == "emergencyPair" then
        return "AMB + POLICE"
    elseif a1 == "emergencyTriple" then
        return "3x POLICE"
    end
end
tbl_2.DIRECTOR_EVENTS = tbl_upv_1
return tbl_2