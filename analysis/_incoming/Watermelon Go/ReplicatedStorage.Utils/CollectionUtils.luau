-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local CollectionService_upv_1 = game:GetService("CollectionService")
local u1 = Instance.new("BindableEvent")
tbl_upv_1.TaggedAddedToWorkspace = u1.Event
local u2 = Instance.new("BindableEvent")
tbl_upv_1.TaggedRemovedFromWorkspace = u2.Event
local tbl_upv_2 = {}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
local tbl_upv_6 = {}
local tbl_upv_7 = {}
local tbl_upv_8 = {}
function tbl_upv_1.StartRecordingTag(a1)
    --[[
      name: StartRecordingTag
      line: 24
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_7 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
        tbl_upv_3 (copy, index: 4)
        tbl_upv_4 (copy, index: 5)
        tbl_upv_5 (copy, index: 6)
        tbl_upv_6 (copy, index: 7)
        CollectionService_upv_1 (copy, index: 8)
    ]]
    if a1 == tbl_upv_1 then
        error("SOFT ERROR - Attempted to call StartRecordingTag with : instead of .")
    end
    if tbl_upv_7[a1] then
        return
    end
    tbl_upv_1.StopRecordingTag(a1)
    tbl_upv_2[a1] = {}
    tbl_upv_3[a1] = {}
    tbl_upv_4[a1] = {}
    tbl_upv_5[a1] = Instance.new("BindableEvent")
    tbl_upv_6[a1] = Instance.new("BindableEvent")
    tbl_upv_7[a1] = true
    for _, value_1 in pairs(CollectionService_upv_1:GetTagged(a1)) do
        OnTagObjectAdded(a1, value_1)
    end
    CollectionService_upv_1:GetInstanceAddedSignal(a1):Connect(
        function(a2)
            --[[
              line: 41
              upvalues:
                a1 (copy, index: 1)
            ]]
            OnTagObjectAdded(a1, a2)
        end
    )
    CollectionService_upv_1:GetInstanceRemovedSignal(a1):Connect(
        function(a3)
            --[[
              line: 43
              upvalues:
                a1 (copy, index: 1)
            ]]
            OnTagObjectRemoved(a1, a3)
        end
    )
end
function tbl_upv_1.StopRecordingTag(a1)
    --[[
      name: StopRecordingTag
      line: 46
      upvalues:
        tbl_upv_3 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        tbl_upv_4 (copy, index: 3)
        tbl_upv_7 (copy, index: 4)
    ]]
    if tbl_upv_3[a1] then
        for _, value_2 in pairs(tbl_upv_3) do
            value_2:Disconnect()
        end
    end
    if tbl_upv_2[a1] then
        for _, value_3 in pairs(tbl_upv_2) do
            for v1, value_4 in pairs(value_3) do
                value_4:Disconnect()
            end
        end
    end
    tbl_upv_3[a1] = nil
    tbl_upv_2[a1] = nil
    tbl_upv_4[a1] = nil
    tbl_upv_7[a1] = nil
end
function tbl_upv_1.GetTaggedAddedToWorkspaceEvent(a1)
    --[[
      name: GetTaggedAddedToWorkspaceEvent
      line: 65
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    if tbl_upv_5[a1] then
        return tbl_upv_5[a1].Event
    end
    warn("[COLLECTIONUTILS] Attempted to get TaggedAddedToWorkspaceEvent from an unrecorded tag", a1, ". Please use CollectionUtils.StartRecordingTag().")
end
function tbl_upv_1.GetTaggedRemovedFromWorkspaceEvent(a1)
    --[[
      name: GetTaggedRemovedFromWorkspaceEvent
      line: 73
      upvalues:
        tbl_upv_6 (copy, index: 1)
    ]]
    if tbl_upv_6[a1] then
        return tbl_upv_6[a1].Event
    end
    warn("[COLLECTIONUTILS] Attempted to get TaggedRemovedFromWorkspaceEvent from an unrecorded tag", a1, ". Please use CollectionUtils.StartRecordingTag().")
end
function tbl_upv_1.GetTaggedInWorkspace(a1)
    --[[
      name: GetTaggedInWorkspace
      line: 81
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    if tbl_upv_4[a1] then
        return tbl_upv_4[a1]
    end
    warn("[COLLECTIONUTILS] Attempted to get TaggedInWorkspace from an unrecorded tag", a1, ". Please use CollectionUtils.StartRecordingTag().")
end
function tbl_upv_1.PairTagWithClass(a1, a2)
    --[[
      name: PairTagWithClass
      line: 89
      upvalues:
        CollectionService_upv_1 (copy, index: 1)
    ]]
    for _, value_upv_5 in pairs(CollectionService_upv_1:GetTagged(a1)) do
        coroutine.wrap(
            function()
                --[[
                  line: 91
                  upvalues:
                    value_upv_5 (copy, index: 1)
                    a2 (copy, index: 2)
                ]]
                wait()
                InitializeTagClass(value_upv_5, a2)
            end
        )()
    end
    CollectionService_upv_1:GetInstanceAddedSignal(a1):Connect(
        function(a3)
            --[[
              line: 96
              upvalues:
                a2 (copy, index: 1)
            ]]
            InitializeTagClass(a3, a2)
        end
    )
    CollectionService_upv_1:GetInstanceRemovedSignal(a1):Connect(TerminateTagClass)
end
function tbl_upv_1.TieFunctionToTagInstances(a1, a2)
    --[[
      name: TieFunctionToTagInstances
      line: 100
      upvalues:
        CollectionService_upv_1 (copy, index: 1)
    ]]
    CollectionService_upv_1:GetInstanceAddedSignal(a1):Connect(a2)
    for _, value_6 in pairs(CollectionService_upv_1:GetTagged(a1)) do
        task.spawn(a2, value_6)
    end
end
function tbl_upv_1.TieFunctionToWorkspaceTagInstances(a1, a2)
    --[[
      name: TieFunctionToWorkspaceTagInstances
      line: 107
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    tbl_upv_1.GetTaggedAddedToWorkspaceEvent(a1):Connect(a2)
    for _, value_7 in pairs(tbl_upv_1.GetTaggedInWorkspace(a1)) do
        task.spawn(a2, value_7)
    end
end
function OnTagObjectAdded(a1, a2)
    --[[
      name: OnTagObjectAdded
      line: 115
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    tbl_upv_2[a1][a2] = {}
    UpdateTagObjectWorkspaceStatus(a1, a2)
    table.insert(
        tbl_upv_2[a1][a2],
        (a2.AncestryChanged:Connect(
            function()
                --[[
                  line: 120
                  upvalues:
                    a1 (copy, index: 1)
                    a2 (copy, index: 2)
                ]]
                UpdateTagObjectWorkspaceStatus(a1, a2)
            end
        ))
    )
end
function OnTagObjectRemoved(a1, a2)
    --[[
      name: OnTagObjectRemoved
      line: 126
      upvalues:
        tbl_upv_4 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    table.remove(tbl_upv_4[a1], table.find(tbl_upv_4[a1], a2))
    if not tbl_upv_2[a1][a2] then
        return
    end
    for _, value_8 in pairs(tbl_upv_2[a1][a2]) do
        value_8:Disconnect()
    end
    tbl_upv_2[a1][a2] = nil
end
function UpdateTagObjectWorkspaceStatus(a1, a2)
    --[[
      name: UpdateTagObjectWorkspaceStatus
      line: 136
      upvalues:
        tbl_upv_4 (copy, index: 1)
        u1 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
        u2 (copy, index: 4)
        tbl_upv_6 (copy, index: 5)
    ]]
    local v1 = table.find(tbl_upv_4[a1], a2)
    if not (a2:IsDescendantOf(workspace)) and not (a2:IsA("Tool")) then
        if v1 then
            table.remove(tbl_upv_4[a1], v1)
            u2:Fire(a1, a2)
            tbl_upv_6[a1]:Fire(a2)
        end
        return
    end
    if v1 then
        return
    end
    table.insert(tbl_upv_4[a1], a2)
    u1:Fire(a1, a2)
    tbl_upv_5[a1]:Fire(a2)
end
function InitializeTagClass(a1, a2)
    --[[
      name: InitializeTagClass
      line: 153
      upvalues:
        tbl_upv_8 (copy, index: 1)
    ]]
    tbl_upv_8[a1] = a2.new(a1)
end
function TerminateTagClass(a1)
    --[[
      name: TerminateTagClass
      line: 158
      upvalues:
        tbl_upv_8 (copy, index: 1)
    ]]
    if tbl_upv_8[a1] and tbl_upv_8[a1].Terminate then
        tbl_upv_8[a1]:Terminate()
    end
    tbl_upv_8[a1] = nil
end
return tbl_upv_1