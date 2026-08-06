-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local CollectionService_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local tbl_1 = {}
tbl_1.markWorldArt = function(a1)
    --[[
      name: markWorldArt
      line: 21
      upvalues:
        CollectionService_upv_1 (copy, index: 1)
    ]]
    CollectionService_upv_1:AddTag(a1, "WorldArtGui")
end
return tbl_1