-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local tbl_upv_2 = {}
local tbl_3 = {}
tbl_3.animationFor = function(a1)
    --[[
      name: animationFor
      line: 38
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v1 = tbl_upv_2[a1]
    if v1 == nil then
        local v2 = Instance.new("Animation")
        v2.Name = a1
        v2.AnimationId = tbl_upv_1[a1]
        tbl_upv_2[a1] = v2
        return v2
    end
    return v1
end
tbl_3.ANIMATION_IDS = tbl_upv_1
return tbl_3