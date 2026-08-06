-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local detectDeviceKind_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "device-kind").detectDeviceKind
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 19
    ]]
    return "AnalyticsController"
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
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 28
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 30
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
        detectDeviceKind_upv_1 (copy, index: 2)
    ]]
    ClientEvents_upv_1.reportDevice:fire(detectDeviceKind_upv_1())
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/analytics-controller@AnalyticsController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.AnalyticsController = u1
return tbl_3