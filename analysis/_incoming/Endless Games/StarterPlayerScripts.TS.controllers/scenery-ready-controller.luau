-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local isSceneryMirrorComplete_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "common", "scenery-assets").isSceneryMirrorComplete
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 27
    ]]
    return "SceneryReadyController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 32
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 36
    ]]
    a1.complete = false
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 39
    ]]
    task.spawn(
        function()
            --[[
              line: 41
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:warm()
        end
    )
end
u1.isReady = function(a1)
    --[[
      name: isReady
      line: 45
    ]]
    return a1.complete
end
u1.warm = function(a1)
    --[[
      name: warm
      line: 48
      upvalues:
        isSceneryMirrorComplete_upv_1 (copy, index: 1)
    ]]
    local v2 = os.clock() + 30
    while not (isSceneryMirrorComplete_upv_1()) do
        if v2 > os.clock() then
            task.wait(0.25)
            continue
        end
        warn((("[SceneryReadyController] mirror still incomplete after %*s"):format(30)))
        return nil
    end
    a1.complete = true
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/scenery-ready-controller@SceneryReadyController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.SceneryReadyController = u1
return tbl_3