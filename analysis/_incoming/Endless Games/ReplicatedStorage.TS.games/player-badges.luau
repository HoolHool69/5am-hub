-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local isDeveloper_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").isDeveloper
local UNLOCK_GROUP_ID_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-locks").UNLOCK_GROUP_ID
local tbl_1 = {}
tbl_1.isStaffRank = function(a1)
    --[[
      name: isStaffRank
      line: 23
    ]]
    return a1 >= 254
end
tbl_1.isStaff = function(a1, a2)
    --[[
      name: isStaff
      line: 27
      upvalues:
        isDeveloper_upv_1 (copy, index: 1)
    ]]
    local v1 = isDeveloper_upv_1(a1) or (a2 >= 254)
    return v1
end
tbl_1.STAFF_GROUP_ID = UNLOCK_GROUP_ID_1
return tbl_1