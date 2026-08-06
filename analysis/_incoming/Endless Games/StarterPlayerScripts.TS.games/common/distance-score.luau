-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 12
    ]]
    return "DistanceScore"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 17
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 21
    ]]
    a1.unitStuds = a2
    a1.totalStuds = 0
    a1.points = 0
end
u1.reset = function(a1)
    --[[
      name: reset
      line: 26
    ]]
    a1.totalStuds = 0
    a1.points = 0
end
u1.advance = function(a1, a2)
    --[[
      name: advance
      line: 30
    ]]
    a1.totalStuds = a1.totalStuds + a2
    local v2 = math.floor(a1.totalStuds / a1.unitStuds)
    if v2 > a1.points then
        a1.points = v2
        return true
    end
    return false
end
u1.current = function(a1)
    --[[
      name: current
      line: 39
    ]]
    return a1.points
end
u1.studs = function(a1)
    --[[
      name: studs
      line: 42
    ]]
    return a1.totalStuds
end
u1.restore = function(a1, a2)
    --[[
      name: restore
      line: 45
    ]]
    a1.totalStuds = a2
    a1.points = math.floor(a2 / a1.unitStuds)
end
local tbl_3 = {}
tbl_3.DistanceScore = u1
return tbl_3