-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local v1 = RuntimeLib_1.import(script, script.Parent, "block-blast-sim")
local pickPieceIndex_upv_1 = v1.pickPieceIndex
local rescueTray_upv_1 = v1.rescueTray
local tbl_1 = {}
tbl_1.drawTray = function(a1, a2, a3)
    --[[
      name: drawTray
      line: 27
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        pickPieceIndex_upv_1 (copy, index: 2)
        rescueTray_upv_1 (copy, index: 3)
    ]]
    local v2 = deriveRandom_upv_1(a1, 5e+06 + (a2 * 1000))
    local tbl_2 = {}
    for _ = 0, 2 do
        table.insert(tbl_2, (pickPieceIndex_upv_1(a2, v2:NextNumber())))
    end
    local v3 = rescueTray_upv_1(
        a3,
        tbl_2,
        function(a4)
            --[[
              line: 34
              upvalues:
                pickPieceIndex_upv_1 (copy, index: 1)
                a2 (copy, index: 2)
                deriveRandom_upv_1 (copy, index: 3)
                a1 (copy, index: 4)
            ]]
            return pickPieceIndex_upv_1(a2, deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + a4):NextNumber())
        end
    )
    local tbl_3 = {}
    tbl_3.slots = tbl_2
    tbl_3.rerolls = v3.rerolls
    tbl_3.fallback = v3.fallback
    return tbl_3
end
return tbl_1