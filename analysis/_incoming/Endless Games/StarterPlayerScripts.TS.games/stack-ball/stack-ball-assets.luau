-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-kit")
local SceneryKit_upv_1 = v1.SceneryKit
local cloneKitPart_upv_1 = v1.cloneKitPart
local tbl_upv_1 = {"Tower", "Ring", "Player"}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 36
    ]]
    return "StackBallAssets"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 41
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 45
      upvalues:
        SceneryKit_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.kit = SceneryKit_upv_1.new("StackBall", "stack-ball", tbl_upv_1)
    a1.available = a1.kit.available
    a1.lighting = a1.kit.lighting
end
u1.has = function(a1, a2)
    --[[
      name: has
      line: 50
    ]]
    return a1.kit:has(a2)
end
u1.part = function(a1, a2, a3)
    --[[
      name: part
      line: 53
      upvalues:
        cloneKitPart_upv_1 (copy, index: 1)
    ]]
    return cloneKitPart_upv_1(a1.kit:template(a2), a3)
end
local tbl_4 = {}
tbl_4.StackBallAssets = u1
return tbl_4