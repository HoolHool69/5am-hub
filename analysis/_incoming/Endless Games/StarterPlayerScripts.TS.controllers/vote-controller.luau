-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local voteIntents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "vote-intents").voteIntents
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 11
    ]]
    return "VoteController"
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
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 20
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 22
      upvalues:
        voteIntents_upv_1 (copy, index: 1)
        ClientEvents_upv_1 (copy, index: 2)
    ]]
    voteIntents_upv_1.voteGame:Connect(
        function(a2, a3)
            --[[
              line: 23
              upvalues:
                ClientEvents_upv_1 (copy, index: 1)
            ]]
            ClientEvents_upv_1.voteGame:fire(a2, a3)
        end
    )
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/vote-controller@VoteController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.VoteController = u1
return tbl_3