-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit")
local flattenKitPart_upv_1 = v1.flattenKitPart
local modelWorldAabb_upv_1 = v1.modelWorldAabb
local translateModel_upv_1 = v1.translateModel
local function cloneStatic_upv_1(a1, a2, a3)
    --[[
      name: cloneStatic
      line: 36
      upvalues:
        flattenKitPart_upv_1 (copy, index: 1)
        translateModel_upv_1 (copy, index: 2)
    ]]
    local v2 = a1:Clone()
    for _, value_1 in v2:GetDescendants() do
        if value_1:IsA("BasePart") then
            flattenKitPart_upv_1(value_1)
        end
    end
    v2.Parent = a2
    translateModel_upv_1(v2, a3)
    return v2
end
local function laneForQuadrant_1(a1, a2)
    --[[
      name: laneForQuadrant
      line: 70
    ]]
    local v3 = math.abs(a1)
    local v4 = math.abs(a2)
    if v3 >= 6 and v3 <= 14 then
        if v4 >= 6 and v4 <= 14 then
            if a1 <= 0 then
                if a2 <= 0 then
                    return 1
                end
                return 2
            elseif a2 <= 0 then
                return 3
            else
                return 0
            end
        end
        return nil
    end
    return nil
end
local function cloneFolderModels_upv_1(a1, a2, a3)
    --[[
      name: cloneFolderModels
      line: 48
      upvalues:
        cloneStatic_upv_1 (copy, index: 1)
    ]]
    local _ = nil
    local v1 = nil
    for v2, value_2 in a1:GetChildren() do
        if value_2:IsA("Model") then
            cloneStatic_upv_1(value_2, a2, a3)
            continue
        end
        if not (value_2:IsA("Folder")) then
            continue
        end
        for v3, value_3 in value_2:GetChildren() do
            if value_3:IsA("Model") then
                cloneStatic_upv_1(value_3, a2, a3)
            end
        end
    end
end
local function classifyLamps_upv_1(a1)
    --[[
      name: classifyLamps
      line: 88
    ]]
    local v5 = nil
    local v6 = nil
    local v7 = nil
    local v8 = nil
    for _, value_4 in a1:GetDescendants() do
        v7 = value_4:IsA("BasePart")
        if not (v7) or string.sub(value_4.Name, 1, 9) ~= "LightLamp" then
            continue
        end
        v8 = value_4.Color
        if v8.G >= v8.R then
            if v6 == nil then
                v6 = value_4
                continue
            end
        elseif v5 == nil then
            v5 = value_4
            continue
        end
        return nil
    end
    if v5 ~= nil and v6 ~= nil then
        local tbl_1 = {}
        tbl_1.redLamp = v5
        tbl_1.greenLamp = v6
        return tbl_1
    end
    return nil
end
local tbl_2 = {}
tbl_2.buildAuthoredStreet = function(a1, a2)
    --[[
      name: buildAuthoredStreet
      line: 129
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        modelWorldAabb_upv_1 (copy, index: 2)
        cloneFolderModels_upv_1 (copy, index: 3)
        cloneStatic_upv_1 (copy, index: 4)
        classifyLamps_upv_1 (copy, index: 5)
    ]]
    local v9 = waitForSceneryRoot_upv_1("TrafficRush", "traffic-rush")
    local v10, v11 = nil, nil
    if v9 ~= nil then
        v10 = v9:FindFirstChild("Road")
        local v12
        if v10 == nil then
            v12 = v10
        else
            v12 = v10:FindFirstChild("Plate")
        end
        v11 = v10
        if v11 ~= nil then
            v11 = v11:FindFirstChild("Stripe")
        end
        if v10 == nil or v12 == nil or not v12:IsA("Model") then
            warn("[traffic-rush] street kit is missing Road.Plate/Road.Stripe \226\128\148 procedural board")
        elseif v11 == nil then
            warn("[traffic-rush] street kit is missing Road.Plate/Road.Stripe \226\128\148 procedural board")
        else
            local v13 = nil
            if v11:IsA("Model") then
                v13 = modelWorldAabb_upv_1(v12)
                local v14, v15 = nil, nil
                if v13 ~= nil then
                    local v16 = a2 - Vector3.new(v13.center.X, v13.max.Y, v13.center.Z)
                    cloneFolderModels_upv_1(v10, a1, v16)
                    v14 = v9:FindFirstChild("Scenery")
                    if v14 == nil then
                        warn("[traffic-rush] street kit has no Scenery folder \226\128\148 bare board dressing")
                    else
                        cloneFolderModels_upv_1(v14, a1, v16)
                    end
                    local v17 = nil
                    v15 = v9:FindFirstChild("Signals")
                    if v15 ~= nil then
                        local tbl_3 = {}
                        for _, value_5 in v15:GetChildren() do
                            if value_5:IsA("Model") then
                                table.insert(tbl_3, (cloneStatic_upv_1(value_5, a1, v16)))
                            end
                        end
                        local v18 = table.create(4)
                        local v19 = #tbl_3 == 4
                        local v27 = nil
                        if v19 then
                            local value_6 = nil
                            local v21 = nil
                            local v22 = nil
                            local v23 = nil
                            for _, value_6 in tbl_3 do
                                v22 = modelWorldAabb_upv_1(value_6)
                                if v22 == nil then
                                    v27 = nil
                                else
                                    local v24 = v22.center.X - a2.X
                                    local v25 = v22.center.Z - a2.Z
                                    v23 = math.abs(v24)
                                    local v26 = math.abs(v25)
                                    if v23 < 6 or v23 > 14 or v26 < 6 or v26 > 14 then
                                        v27 = nil
                                    elseif v24 <= 0 then
                                        v27 = ((v25 <= 0) and 1) or 2
                                    else
                                        v27 = ((v25 <= 0) and 3) or 0
                                    end
                                end
                                v21 = classifyLamps_upv_1(value_6)
                                if v27 == nil or v21 == nil then
                                    v19 = false
                                    break
                                end
                                if v18[v27 + 1] == nil then
                                    v18[v27 + 1] = v21
                                    continue
                                else
                                    v19 = false
                                    break
                                end
                            end
                        end
                        if v19 then
                            local tbl_4 = {}
                            v27 = v18[1]
                            if v27 ~= nil then
                                table.insert(tbl_4, v27)
                                v27 = v18[2]
                                if v27 ~= nil then
                                    table.insert(tbl_4, v27)
                                    v27 = v18[3]
                                    if v27 ~= nil then
                                        table.insert(tbl_4, v27)
                                        v27 = v18[4]
                                        if v27 ~= nil then
                                            table.insert(tbl_4, v27)
                                            v17 = tbl_4
                                        else
                                            v19, v17 = false, tbl_4
                                        end
                                    else
                                        v19, v17 = false, tbl_4
                                    end
                                else
                                    v19, v17 = false, tbl_4
                                end
                            else
                                v19, v17 = false, tbl_4
                            end
                        end
                        if not (v19) then
                            warn("[traffic-rush] authored signals could not be adopted \226\128\148 procedural signal posts")
                            for _, value_7 in tbl_3 do
                                value_7:Destroy()
                            end
                            v17 = nil
                        end
                    end
                    local tbl_5 = {}
                    tbl_5.signals = v17
                    tbl_5.lighting = v9:FindFirstChild("Lighting")
                    return tbl_5
                end
                warn("[traffic-rush] Road.Plate has no parts \226\128\148 procedural board")
            else
                warn("[traffic-rush] street kit is missing Road.Plate/Road.Stripe \226\128\148 procedural board")
            end
        end
    end
    return nil
end
return tbl_2