-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RunService_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local function finite_1(a1)
    --[[
      name: finite
      line: 20
    ]]
    if a1 == a1 and a1 ~= math.huge and a1 ~= -math.huge then
        return a1
    end
    return 0
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 35
    ]]
    return "ResumeWriter"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 40
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 44
    ]]
    a1.fields = {}
end
u1.int = function(a1, a2)
    --[[
      name: int
      line: 47
    ]]
    local v2
    if a2 ~= a2 or a2 == math.huge or a2 == -math.huge then
        v2 = 0
    else
        v2 = a2
    end
    local v3 = math.floor(v2)
    local fields_1 = a1.fields
    local v4
    if math.abs(v3) >= 9223372036854775808 then
        v4 = string.format("%.17g", v3)
    else
        v4 = string.format("%d", v3)
    end
    table.insert(fields_1, v4)
    return a1
end
u1.num = function(a1, a2)
    --[[
      name: num
      line: 54
    ]]
    local fields_2 = a1.fields
    local format_1 = string.format
    local v5
    if a2 ~= a2 or a2 == math.huge or a2 == -math.huge then
        v5 = 0
    else
        v5 = a2
    end
    table.insert(fields_2, (format_1("%.4f", v5)))
    return a1
end
u1.bool = function(a1, a2)
    --[[
      name: bool
      line: 60
    ]]
    table.insert(a1.fields, (a2 and "1") or "0")
    return a1
end
u1.str = function(a1, a2)
    --[[
      name: str
      line: 66
    ]]
    table.insert(a1.fields, (string.gsub(a2, ";", "")))
    return a1
end
u1.build = function(a1)
    --[[
      name: build
      line: 72
    ]]
    local v6 = ";"
    if v6 == nil then
        v6 = ", "
    end
    return table.concat(a1.fields, v6)
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 85
    ]]
    return "ResumeReader"
end
local u2 = setmetatable(tbl_3, tbl_4)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 90
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u2)
    return v7:constructor(...) or v7
end
u2.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 94
    ]]
    a1.cursor = 0
    a1.fields = string.split(a2, ";")
end
u2.hasMore = function(a1)
    --[[
      name: hasMore
      line: 98
    ]]
    return a1.cursor < #a1.fields
end
u2.int = function(a1)
    --[[
      name: int
      line: 101
    ]]
    local num_1 = tonumber(a1:take())
    if num_1 == nil then
        error("resume: expected an integer")
    end
    return (math.floor(num_1))
end
u2.num = function(a1)
    --[[
      name: num
      line: 108
    ]]
    local num_2 = tonumber(a1:take())
    if num_2 == nil then
        error("resume: expected a number")
    end
    return num_2
end
u2.bool = function(a1)
    --[[
      name: bool
      line: 115
    ]]
    local v8 = a1:take() == "1"
    return v8
end
u2.str = function(a1)
    --[[
      name: str
      line: 118
    ]]
    return a1:take()
end
u2.take = function(a1)
    --[[
      name: take
      line: 121
    ]]
    local v9 = a1.fields[a1.cursor + 1]
    if v9 == nil then
        error("resume: blob ended early")
    end
    a1.cursor = a1.cursor + 1
    return v9
end
local tbl_5 = {}
tbl_5.readResume = function(a1, a2)
    --[[
      name: readResume
      line: 136
      upvalues:
        u2 (ref,  index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    local u3 = nil
    local success_1, v10 = pcall(
        function()
            --[[
              line: 138
              upvalues:
                u3 (ref,  index: 1)
                a2 (copy, index: 2)
                u2 (ref,  index: 3)
                a1 (copy, index: 4)
            ]]
            u3 = a2(u2.new(a1))
        end
    )
    if success_1 then
        return u3
    end
    if RunService_upv_1:IsStudio() then
        warn((("[resume] blob rejected: %*"):format(v10)))
    end
    return nil
end
tbl_5.writeResume = function(a1)
    --[[
      name: writeResume
      line: 150
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v11 = u1.new()
    a1(v11)
    return v11:build()
end
tbl_5.ResumeWriter = u1
tbl_5.ResumeReader = u2
return tbl_5