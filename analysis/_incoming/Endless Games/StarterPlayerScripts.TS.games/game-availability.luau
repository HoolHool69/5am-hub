-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local isConsoleDevice_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "store", "input-device-atom").isConsoleDevice
local tbl_upv_1 = {}
tbl_upv_1["traffic-rush"] = true
tbl_upv_1["cookie-clicker"] = true
tbl_upv_1["flow-free"] = true
tbl_upv_1["block-blast"] = true
local tbl_2 = {}
tbl_2.isGameAvailableOnDevice = function(a1)
    --[[
      name: isGameAvailableOnDevice
      line: 31
      upvalues:
        tbl_upv_1 (copy, index: 1)
        isConsoleDevice_upv_1 (copy, index: 2)
    ]]
    local v1 = tbl_upv_1[a1] == nil or (not isConsoleDevice_upv_1())
    return v1
end
return tbl_2