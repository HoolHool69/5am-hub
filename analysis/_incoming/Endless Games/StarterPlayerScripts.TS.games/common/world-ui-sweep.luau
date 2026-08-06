-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local CollectionService_upv_1 = v1.CollectionService
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local Workspace_upv_1 = v1.Workspace
local WORLD_ART_TAG_upv_1 = RuntimeLib_1.import(script, script.Parent, "world-art").WORLD_ART_TAG
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 29
    ]]
    return "WorldUiSweep"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 34
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 38
    ]]
    a1.swept = {}
    a1.disabled = {}
    a1.connections = {}
    a1.active = false
end
u1.setHidden = function(a1, a2)
    --[[
      name: setHidden
      line: 44
    ]]
    if a2 ~= a1.active then
        a1.active = a2
        if a2 then
            a1:begin()
        else
            a1:finish()
        end
    else
        return nil
    end
end
u1.begin = function(a1)
    --[[
      name: begin
      line: 55
      upvalues:
        Players_upv_1 (copy, index: 1)
        Workspace_upv_1 (copy, index: 2)
        RunService_upv_1 (copy, index: 3)
    ]]
    local v3 = Players_upv_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    for _, value_1 in ((v3 ~= nil) and {Workspace_upv_1, v3}) or {Workspace_upv_1} do
        for v4, value_2 in value_1:GetDescendants() do
            a1:adopt(value_2)
        end
        table.insert(
            a1.connections,
            (value_1.DescendantAdded:Connect(
                function(a2)
                    --[[
                      line: 63
                      upvalues:
                        a1 (copy, index: 1)
                    ]]
                    return a1:adopt(a2)
                end
            ))
        )
    end
    table.insert(
        a1.connections,
        (RunService_upv_1.Heartbeat:Connect(
            function()
                --[[
                  line: 69
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:reassert()
            end
        ))
    )
end
u1.finish = function(a1)
    --[[
      name: finish
      line: 74
    ]]
    for _, value_3 in a1.connections do
        value_3:Disconnect()
    end
    table.clear(a1.connections)
    for key_1 in a1.disabled do
        key_1.Enabled = true
    end
    table.clear(a1.disabled)
    table.clear(a1.swept)
end
u1.adopt = function(a1, a2)
    --[[
      name: adopt
      line: 85
      upvalues:
        CollectionService_upv_1 (copy, index: 1)
        WORLD_ART_TAG_upv_1 (copy, index: 2)
    ]]
    if not (a2:IsA("BillboardGui")) and not (a2:IsA("SurfaceGui")) or CollectionService_upv_1:HasTag(a2, WORLD_ART_TAG_upv_1) then
        return nil
    end
    table.insert(a1.swept, a2)
    a1:disable(a2)
end
u1.disable = function(a1, a2)
    --[[
      name: disable
      line: 97
    ]]
    if a2.Enabled then
        a2.Enabled = false
        a1.disabled[a2] = true
    else
        return nil
    end
end
u1.reassert = function(a1)
    --[[
      name: reassert
      line: 106
    ]]
    for _, value_4 in a1.swept do
        a1:disable(value_4)
    end
end
local tbl_3 = {}
tbl_3.WorldUiSweep = u1
return tbl_3