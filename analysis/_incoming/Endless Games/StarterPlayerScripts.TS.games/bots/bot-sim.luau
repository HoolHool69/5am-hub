-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 19
    ]]
    return "SubStepper"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 24
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 28
    ]]
    a1.fixedDeltaTime = a2
    a1.accumulator = 0
end
u1.step = function(a1, a2, a3)
    --[[
      name: step
      line: 32
    ]]
    a1.accumulator = a1.accumulator + a2
    while a1.fixedDeltaTime - 1e-09 <= a1.accumulator do
        a1.accumulator = a1.accumulator - a1.fixedDeltaTime
        a3(a1.fixedDeltaTime)
    end
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 63
    ]]
    return "ReactionGate"
end
local u2 = setmetatable(tbl_3, tbl_4)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 68
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u2)
    return v2:constructor(...) or v2
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 72
    ]]
    a1.remaining = 0
end
u2.arm = function(a1, a2)
    --[[
      name: arm
      line: 75
    ]]
    a1.remaining = a2
end
u2.ready = function(a1, a2)
    --[[
      name: ready
      line: 78
    ]]
    a1.remaining = math.max(a1.remaining - a2, 0)
    return a1.remaining <= 0
end
local tbl_5 = {}
tbl_5.jitterNormal = function(a1, a2)
    --[[
      name: jitterNormal
      line: 48
    ]]
    return (a1:NextNumber(-a2, a2) + a1:NextNumber(-a2, a2)) / 2
end
tbl_5.chance = function(a1, a2)
    --[[
      name: chance
      line: 52
    ]]
    local v3 = a1:NextNumber() < a2
    return v3
end
tbl_5.jitteredDelay = function(a1, a2, a3)
    --[[
      name: jitteredDelay
      line: 56
    ]]
    return a2 * a1:NextNumber(1 - a3, 1 + a3)
end
tbl_5.SubStepper = u1
tbl_5.ReactionGate = u2
return tbl_5