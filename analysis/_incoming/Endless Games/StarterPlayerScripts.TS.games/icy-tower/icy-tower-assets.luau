-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local tbl_upv_1 = {}
tbl_upv_1.Hand = true
tbl_upv_1.Crack = true
local markProp = nil
local function flattenToProp_upv_1(a1)
    --[[
      name: flattenToProp
      line: 39
      upvalues:
        markProp (ref, index: 1)
    ]]
    if a1:IsA("BasePart") then
        markProp(a1)
    end
    for _, value_1 in a1:GetDescendants() do
        if value_1:IsA("BasePart") then
            markProp(value_1)
        end
    end
end
markProp = function(a1)
    --[[
      name: markProp
      line: 49
    ]]
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = false
end
local tbl_2 = {}
tbl_2.resolveIcyTowerKit = function()
    --[[
      name: resolveIcyTowerKit
      line: 64
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    local v1 = waitForSceneryRoot_upv_1("IcyTower", "icy-tower")
    if v1 ~= nil and v1:IsA("Folder") then
        return v1
    end
    return nil
end
tbl_2.resolveIcyTowerBackdrops = function(a1)
    --[[
      name: resolveIcyTowerBackdrops
      line: 72
    ]]
    local Backdrops_1 = a1:FindFirstChild("Backdrops")
    if Backdrops_1 ~= nil and Backdrops_1:IsA("Folder") then
        return Backdrops_1
    end
    return nil
end
tbl_2.resolveIcyTowerClock = function(a1)
    --[[
      name: resolveIcyTowerClock
      line: 77
    ]]
    return a1:FindFirstChild("Clock")
end
tbl_2.cloneComboMeter = function(a1, a2)
    --[[
      name: cloneComboMeter
      line: 90
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
    ]]
    local ComboMeter_1 = a1:FindFirstChild("ComboMeter")
    local v2 = nil
    if ComboMeter_1 ~= nil then
        v2 = ComboMeter_1:FindFirstChild("Frame")
        local Fill_1 = ComboMeter_1:FindFirstChild("Fill")
        if v2 ~= nil and v2:IsA("BasePart") and Fill_1 ~= nil and Fill_1:IsA("BasePart") then
            local v3 = v2:Clone()
            local v4 = Fill_1:Clone()
            flattenToProp_upv_1(v3)
            flattenToProp_upv_1(v4)
            v3.Parent = a2
            v4.Parent = a2
            local tbl_3 = {}
            tbl_3.frame = v3
            tbl_3.fill = v4
            return tbl_3
        end
        warn("[icy-tower] ComboMeter kit folder needs Frame + Fill parts \226\128\148 keeping the procedural meter")
    end
    return nil
end
tbl_2.resolveIcyTowerFloors = function(a1)
    --[[
      name: resolveIcyTowerFloors
      line: 113
    ]]
    return a1:FindFirstChild("Floors")
end
tbl_2.cloneAuthoredFloorUnit = function(a1, a2)
    --[[
      name: cloneAuthoredFloorUnit
      line: 123
    ]]
    local v5 = nil
    if a1:FindFirstChild("Slab", true) ~= nil then
        local v6 = a1:Clone()
        for v7, v8 in v6:GetDescendants() do
            if v8:IsA("BasePart") then
                v8.Anchored = true
                v8.CanCollide = false
                v8.CanQuery = false
                v8.CanTouch = false
                v8.CastShadow = false
            end
        end
        v5 = v6:FindFirstChild("Slab", true)
        if v5 ~= nil and v5:IsA("BasePart") then
            local v9 = v5.CFrame:Inverse()
            local v10 = v6:FindFirstChild("Accent", true)
            local v7
            v7 = v10 == nil or not (v10:IsA("BasePart")) or v10
            local v8 = {}
            for _, value_2 in v6:GetDescendants() do
                if not (value_2:IsA("BasePart")) or value_2 == v5 then
                    continue
                end
                if value_2 ~= v7 then
                    table.insert(v8, {part = value_2, localCFrame = v9 * value_2.CFrame})
                end
            end
            v6.Parent = a2
            local tbl_4 = {}
            tbl_4.model = v6
            tbl_4.slab = v5
            tbl_4.slabSizeY = v5.Size.Y
            tbl_4.slabSizeZ = v5.Size.Z
            tbl_4.accent = v7
            tbl_4.accentMargin = ((v7 == nil) and 0) or (v5.Size.X - v7.Size.X)
            tbl_4.accentYOff = ((v7 == nil) and 0) or ((v9 * v7.CFrame).Position.Y)
            tbl_4.accentSizeY = ((v7 == nil) and 0) or (v7.Size.Y)
            tbl_4.accentSizeZ = ((v7 == nil) and 0) or (v7.Size.Z)
            tbl_4.props = v8
            tbl_4.authoredWidth = v5.Size.X
            return tbl_4
        end
        v6:Destroy()
    end
    return nil
end
tbl_2.resolveIcyTowerLighting = function()
    --[[
      name: resolveIcyTowerLighting
      line: 189
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    local v11 = waitForSceneryRoot_upv_1("IcyTower", "icy-tower")
    if v11 ~= nil then
        v11 = v11:FindFirstChild("Lighting")
    end
    return v11
end
tbl_2.cloneBackdrop = function(a1, a2)
    --[[
      name: cloneBackdrop
      line: 204
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
    ]]
    local v12 = nil
    if a1:FindFirstChild("MainBackdrop", true) ~= nil then
        local v13 = a1:Clone()
        flattenToProp_upv_1(v13)
        v12 = v13:FindFirstChild("MainBackdrop", true)
        if v12 ~= nil and v12:IsA("BasePart") then
            local v14 = v13:GetPivot()
            v13.Parent = a2
            local tbl_5 = {}
            tbl_5.model = v13
            tbl_5.panelOffset = v12.Position - v14.Position
            tbl_5.rotation = v14.Rotation
            return tbl_5
        end
        v13:Destroy()
    else
        warn((("[icy-tower] backdrop %* has no MainBackdrop \226\128\148 skipped"):format(a1.Name)))
    end
    return nil
end
tbl_2.cloneClockDressing = function(a1, a2)
    --[[
      name: cloneClockDressing
      line: 234
      upvalues:
        tbl_upv_1 (copy, index: 1)
        flattenToProp_upv_1 (copy, index: 2)
    ]]
    local v15 = nil
    local v16 = 0
    local v17 = nil
    for _, value_3 in a1:GetChildren() do
        v17 = value_3:IsA("BasePart")
        if not (v17) or value_3.Name ~= "Face" then
            continue
        end
        if v16 < value_3.Size.Y then
            v16, v15 = value_3.Size.Y, value_3.Position
        end
    end
    if v15 ~= nil then
        local v18 = CFrame.new(v15)
        local tbl_6 = {}
        local v19 = nil
        for _, value_4 in a1:GetChildren() do
            v19 = not value_4:IsA("BasePart") or (tbl_upv_1[value_4.Name] ~= nil)
            if not (v19) then
                local v20 = value_4:Clone()
                local v21 = v18:Inverse()
                flattenToProp_upv_1(v20)
                v20.Parent = a2
                table.insert(tbl_6, {part = v20, offset = v21 * v20.CFrame})
            end
        end
        return tbl_6
    end
    return {}
end
return tbl_2