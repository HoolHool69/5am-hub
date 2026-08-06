-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.portraitCameraDistance = function(a1, a2, a3, a4)
    --[[
      name: portraitCameraDistance
      line: 23
    ]]
    if a4 == nil then
        a4 = math.huge
    end
    return a1 * math.clamp(a2 / (a3.X / math.max(a3.Y, 1)), 1, a4)
end
return tbl_1