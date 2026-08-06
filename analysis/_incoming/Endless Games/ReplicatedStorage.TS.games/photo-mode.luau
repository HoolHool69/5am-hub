-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local PHOTO_MODE_USER_IDS_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").PHOTO_MODE_USER_IDS
local tbl_1 = {}
tbl_1.canUsePhotoMode = function(a1, a2)
    --[[
      name: canUsePhotoMode
      line: 20
      upvalues:
        RunService_upv_1 (copy, index: 1)
        PHOTO_MODE_USER_IDS_upv_1 (copy, index: 2)
    ]]
    if RunService_upv_1:IsStudio() or a2 then
        return true
    else
        local v1 = table.find(PHOTO_MODE_USER_IDS_upv_1, a1) ~= nil
        return v1
    end
end
return tbl_1