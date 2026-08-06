-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local client_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm-sync", "src").client
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local syncedAtoms_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").syncedAtoms
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 17
    ]]
    return "SyncController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 22
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 26
    ]]
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 28
      upvalues:
        client_upv_1 (copy, index: 1)
        syncedAtoms_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
    ]]
    client_upv_1.addSignals(syncedAtoms_upv_1)
    ClientEvents_upv_1.charmSync:connect(
        function(a2)
            --[[
              line: 31
              upvalues:
                client_upv_1 (copy, index: 1)
            ]]
            return client_upv_1.patch(a2)
        end
    )
    ClientEvents_upv_1.requestState:fire()
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/sync-controller@SyncController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.SyncController = u1
return tbl_3