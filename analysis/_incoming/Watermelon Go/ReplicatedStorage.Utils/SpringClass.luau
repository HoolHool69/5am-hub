-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.__index = tbl_upv_1
function tbl_upv_1.new(a1, a2, a3, a4)
    --[[
      name: new
      line: 8
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return (setmetatable({Position = 0, Target = 0, Velocity = 0, Mass = a1 or 5, Force = a2 or 50, Damping = a3 or 4, Speed = a4 or 4}, tbl_upv_1))
end
function tbl_upv_1.Shove(a1, a2)
    --[[
      name: Shove
      line: 25
    ]]
    if a2 ~= a2 or a2 == math.huge or a2 == -math.huge then
        a2 = 0
    end
    a1.Velocity = a1.Velocity + a2
end
function tbl_upv_1.Update(a1, a2)
    --[[
      name: Update
      line: 32
    ]]
    local v1 = math.min(a2, 1) * a1.Speed / 8
    for _ = 1, 8 do
        a1.Velocity = a1.Velocity + (((((a1.Target - a1.Position) * a1.Force) / a1.Mass) - (a1.Velocity * a1.Damping)) * v1)
        a1.Position = a1.Position + (a1.Velocity * v1)
    end
    return a1.Position
end
return tbl_upv_1