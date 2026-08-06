-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 20
    ]]
    return "SpectateFollow"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 25
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 29
    ]]
end
u1.setOpponents = function(a1, a2)
    --[[
      name: setOpponents
      line: 31
    ]]
    a1.opponents = a2
end
u1.setTarget = function(a1, a2)
    --[[
      name: setTarget
      line: 34
    ]]
    a1.targetUserId = a2
end
u1.isActive = function(a1)
    --[[
      name: isActive
      line: 37
    ]]
    local v2 = a1:snapshotValues() ~= nil
    return v2
end
u1.userId = function(a1)
    --[[
      name: userId
      line: 40
    ]]
    return a1.targetUserId
end
u1.value = function(a1, a2)
    --[[
      name: value
      line: 43
    ]]
    local v3 = a1:snapshotValues()
    if v3 ~= nil then
        v3 = v3[a2 + 1]
    end
    return v3
end
u1.snapshotValues = function(a1)
    --[[
      name: snapshotValues
      line: 50
    ]]
    local targetUserId_1 = a1.targetUserId
    local opponents_1 = a1.opponents
    if targetUserId_1 ~= nil and opponents_1 ~= nil then
        for _, value_1 in opponents_1 do
            local v4 = nil
            if value_1.userId == targetUserId_1 then
                v4 = value_1.snapshot
                if v4 ~= nil then
                    v4 = v4.values
                end
                return v4
            end
        end
    else
        return nil
    end
    -- GenericForNext _, value_1 = v5(v6, [control])
    local v4 = nil
    while true do
        if value_1.userId ~= targetUserId_1 then
            continue
        else
            v4 = value_1.snapshot
            if v4 ~= nil then
                v4 = v4.values
            end
            return v4
        end
    end
end
tbl_1 = {}
tbl_1.approach = function(a1, a2, a3, a4)
    --[[
      name: approach
      line: 75
    ]]
    return a1 + ((a2 - a1) * math.min(a4 * a3, 1))
end
tbl_1.SpectateFollow = u1
return tbl_1