-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local draw_upv_1 = require(script:WaitForChild("draw"))
local tbl_1 = {}
local tbl_upv_2 = {}
tbl_upv_2.__index = tbl_1
local u1 = setmetatable({}, {__mode = "k"})
function tbl_1.new()
    --[[
      name: new
      line: 7
      upvalues:
        draw_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    local tbl_upv_3 = {}
    for key_1, value_upv_1 in next, draw_upv_1 do
        tbl_upv_3[key_1] = function(...)
            --[[
              line: 11
              upvalues:
                value_upv_1 (copy, index: 1)
                u1 (copy, index: 2)
                tbl_upv_3 (copy, index: 3)
            ]]
            local tbl_4 = {value_upv_1(...)}
            for n_1 = 1, #tbl_4 do
                table.insert(u1[tbl_upv_3], tbl_4[n_1])
            end
            return unpack(tbl_4)
        end
    end
    u1[tbl_upv_3] = {}
    return (setmetatable(tbl_upv_3, tbl_upv_2))
end
function tbl_1.clear(a1)
    --[[
      name: clear
      line: 24
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v1 = u1[a1]
    while #v1 > 0 do
        table.remove(v1):Destroy()
    end
    u1[a1] = {}
end
return tbl_1