-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 11
    ]]
    return "ObjectPool"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 16
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 20
    ]]
    if a4 == nil then
        a4 = 0
    end
    a1.factory = a2
    a1.onRelease = a3
    a1.free = {}
    local v2 = 0
    local v3 = false
    while true do
        if v3 then
            v2 = v2 + 1
        else
            v3 = true
        end
        if v2 >= a4 then
            break
        end
        table.insert(a1.free, (a2()))
    end
end
u1.acquire = function(a1)
    --[[
      name: acquire
      line: 45
    ]]
    local free_1 = a1.free
    local v4 = #free_1
    local v5 = free_1[v4]
    free_1[v4] = nil
    if v5 == nil then
        v5 = a1.factory()
    end
    return v5
end
u1.release = function(a1, a2)
    --[[
      name: release
      line: 58
    ]]
    if a1.onRelease ~= nil then
        a1.onRelease(a2)
    end
    table.insert(a1.free, a2)
end
local tbl_3 = {}
tbl_3.ObjectPool = u1
return tbl_3