-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local function setHeld(a1, a2, a3)
    --[[
      name: setHeld
      line: 20
      upvalues:
        tbl_upv_1 (copy, index: 1)
        setHeld (ref,  index: 2)
    ]]
    local v1 = tbl_upv_1[a2] == true
    tbl_upv_1[a2] = a3
    if not a3 or (v1) then
        return
    end
    setHeld.onPress:Fire(a2)
end
local function reset_1(a1)
    --[[
      name: reset
      line: 34
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    table.clear(tbl_upv_1)
end
local function isHeld_1(a1, a2)
    --[[
      name: isHeld
      line: 30
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[a2] == true
end
setHeld = {onPress = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "signal").Signal.new(), setHeld = setHeld, isHeld = isHeld_1, reset = reset_1}
local tbl_2 = {}
tbl_2.kitTouchInput = setHeld
return tbl_2