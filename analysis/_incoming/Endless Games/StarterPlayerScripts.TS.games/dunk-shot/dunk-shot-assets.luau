-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit")
local SceneryKit_upv_1 = v1.SceneryKit
local cloneKitModel_upv_1 = v1.cloneKitModel
local tbl_upv_1 = {"Court", "Hoop", "Player"}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 32
    ]]
    return "DunkShotAssets"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 37
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 41
      upvalues:
        SceneryKit_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        waitForSceneryRoot_upv_1 (copy, index: 3)
    ]]
    a1.kit = SceneryKit_upv_1.new("DunkShot", "dunk-shot", tbl_upv_1)
    a1.available = a1.kit.available
    a1.lighting = a1.kit.lighting
    local v3 = waitForSceneryRoot_upv_1("DunkShot", "dunk-shot")
    local v4 = nil
    if v3 ~= nil then
        v4 = v3:FindFirstChild("Court")
        if v4 == nil then
            v3 = v4
        else
            v3 = v4:FindFirstChild("Gradient")
        end
    end
    a1.gradient = v3 == nil or not (v3:IsA("BasePart")) or v3
end
u1.has = function(a1, a2)
    --[[
      name: has
      line: 55
    ]]
    return a1.kit:has(a2)
end
u1.template = function(a1, a2)
    --[[
      name: template
      line: 58
    ]]
    return a1.kit:template(a2)
end
u1.model = function(a1, a2, a3)
    --[[
      name: model
      line: 61
      upvalues:
        cloneKitModel_upv_1 (copy, index: 1)
    ]]
    return cloneKitModel_upv_1(a1.kit:template(a2), a3)
end
local tbl_4 = {}
tbl_4.DunkShotAssets = u1
return tbl_4