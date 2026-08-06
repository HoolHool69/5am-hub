-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {"leaf", "leav", "foliage", "canopy", "frond", "bush", "shrub"}
local tbl_upv_2 = {"tree", "pine", "fir", "spruce", "conifer"}
local function nameLooksTree_upv_1(a1)
    --[[
      name: nameLooksTree
      line: 35
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    local v1 = string.lower(a1)
    for _, value_1 in tbl_upv_2 do
        if string.find(v1, value_1, 1, true) == nil then
            continue
        end
        return true
    end
    return false
end
local function isGreenColor_1(a1)
    --[[
      name: isGreenColor
      line: 48
    ]]
    local v2 = false
    if a1.R < a1.G then
        v2 = a1.B <= a1.G
    end
    return v2
end
local function nameLooksLeafy_upv_1(a1)
    --[[
      name: nameLooksLeafy
      line: 25
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v3 = string.lower(a1)
    for _, value_2 in tbl_upv_1 do
        if string.find(v3, value_2, 1, true) == nil then
            continue
        end
        return true
    end
    return false
end
local function measureBox_upv_1(a1)
    --[[
      name: measureBox
      line: 52
    ]]
    if a1:IsA("BasePart") then
        local tbl_3 = {}
        tbl_3.center = a1.Position
        tbl_3.size = a1.Size
        return tbl_3
    else
        local v4 = nil
        if a1:IsA("Model") then
            local v5, v4 = a1:GetBoundingBox()
            if v4.Magnitude ~= 0 then
                local tbl_4 = {}
                tbl_4.center = v5.Position
                tbl_4.size = v4
                return tbl_4
            end
        else
            local v6 = math.huge
            v4 = math.huge
            local v7 = math.huge
            local v8 = -math.huge
            local v9 = -math.huge
            local v10 = -math.huge
            local v11 = false
            local v12 = nil
            for _, value_3 in a1:GetDescendants() do
                v12 = value_3:IsA("BasePart")
                if v12 then
                    v11 = true
                    local Position_1 = value_3.Position
                    local v13 = value_3.Size / 2
                    v6, v4, v7, v8, v9, v10 = math.min(v6, Position_1.X - v13.X), math.min(v4, Position_1.Y - v13.Y), math.min(v7, Position_1.Z - v13.Z), math.max(v8, Position_1.X + v13.X), math.max(v9, Position_1.Y + v13.Y), math.max(v10, Position_1.Z + v13.Z)
                end
            end
            if v11 then
                local tbl_5 = {}
                tbl_5.center = Vector3.new((v6 + v8) / 2, (v4 + v9) / 2, (v7 + v10) / 2)
                tbl_5.size = Vector3.new(v8 - v6, v9 - v4, v10 - v7)
                return tbl_5
            end
        end
        return nil
    end
end
local function buildUnit_upv_1(a1, a2, a3, a4)
    --[[
      name: buildUnit
      line: 105
      upvalues:
        nameLooksLeafy_upv_1 (copy, index: 1)
    ]]
    if a2.size.Y >= a4.shortTreeMinHeight then
        local v14 = math.max(a2.size.X, a2.size.Z)
        local u1 = a2.center.Y + (a2.size.Y / 2) - a2.size.Y * a4.leafUpperFraction
        local tbl_upv_6 = {}
        local u2 = 0
        local u3 = 0
        local function v15(a5)
            --[[
              line: 116
              upvalues:
                u1 (copy, index: 1)
                nameLooksLeafy_upv_1 (copy, index: 2)
                u2 (ref,  index: 3)
                u3 (ref,  index: 4)
                a3 (copy, index: 5)
                tbl_upv_6 (copy, index: 6)
            ]]
            local v16 = nil
            if a5.Name ~= "TrunkIndicator" then
                v16 = a5.Color
                local v17 = false
                if v16.R < v16.G then
                    v17 = v16.B <= v16.G
                end
                v16 = true
                if u1 > a5.Position.Y then
                    v16 = v17 or (nameLooksLeafy_upv_1(a5.Name))
                end
                if v16 then
                    u2 = u2 + 1
                    if v17 then
                        u3 = u3 + 1
                    end
                end
                table.insert(tbl_upv_6, {part = a5, rest = a3 * a5.CFrame, isLeaf = v16})
            else
                return nil
            end
        end
        if a1:IsA("BasePart") then
            v15(a1)
        end
        local v18 = nil
        for _, value_4 in a1:GetDescendants() do
            v18 = value_4:IsA("BasePart")
            if v18 then
                v15(value_4)
            end
        end
        if #tbl_upv_6 ~= 0 then
            local v19 = nil
            local v20 = nil
            if #tbl_upv_6 ~= 1 then
                local tbl_7 = {}
                tbl_7.root = a1
                tbl_7.base = (a3 * CFrame.new(Vector3.new(a2.center.X, a2.center.Y - (a2.size.Y / 2), a2.center.Z))).Position
                tbl_7.height = a2.size.Y
                tbl_7.parts = tbl_upv_6
                v20 = false
                if u2 > 0 then
                    v20 = u3 == u2
                end
            else
                v19 = tbl_upv_6[1]
                local v21 = nil
                if v19 ~= nil then
                    if not (v19.isLeaf) and a2.size.Y < v14 then
                        return nil
                    end
                    v21 = v19.part.Color
                    local v22 = false
                    local v23
                    if v21.R >= v21.G then
                        v23 = v22
                    else
                        v23 = v21.B <= v21.G
                    end
                    tbl_upv_6[1] = {part = v19.part, rest = v19.rest}
                    u2 = 1
                    if v23 then
                        u3 = 1
                    else
                        u3 = 0
                    end
                    local tbl_7 = {}
                    tbl_7.root = a1
                    tbl_7.base = (a3 * CFrame.new(Vector3.new(a2.center.X, a2.center.Y - (a2.size.Y / 2), a2.center.Z))).Position
                    tbl_7.height = a2.size.Y
                    tbl_7.parts = tbl_upv_6
                    v20 = false
                    if u2 > 0 then
                        v20 = u3 == u2
                    end
                else
                    return nil
                end
            end
            tbl_7.isGreen = v20
            return tbl_7
        end
    end
    return nil
end
local tbl_8 = {}
tbl_8.collectTreeUnits = function(a1, a2, a3)
    --[[
      name: collectTreeUnits
      line: 189
      upvalues:
        measureBox_upv_1 (copy, index: 1)
        nameLooksTree_upv_1 (copy, index: 2)
        buildUnit_upv_1 (copy, index: 3)
    ]]
    local tbl_upv_9 = {}
    local function u4(a4)
        --[[
          line: 192
          upvalues:
            measureBox_upv_1 (copy, index: 1)
            nameLooksTree_upv_1 (copy, index: 2)
            a3 (copy, index: 3)
            u4 (ref,  index: 4)
            buildUnit_upv_1 (copy, index: 5)
            a2 (copy, index: 6)
            tbl_upv_9 (copy, index: 7)
        ]]
        local v24 = nil
        local v25 = nil
        for _, value_5 in a4:GetChildren() do
            if value_5.Name == "Landtype1" then
                continue
            end
            v24 = value_5:IsA("Model") or (value_5:IsA("Folder"))
            if v24 then
                local v26
                v26 = measureBox_upv_1(value_5)
                local v27
                if v26 == nil then
                    continue
                end
                v27 = value_5:IsA("Model") and (nameLooksTree_upv_1(value_5.Name))
                local v28 = math.max(v26.size.X, v26.size.Z)
                if v27 or a3.clusterFootprintMax >= v28 and a3.treeHeightCeiling >= v26.size.Y then
                    v25 = buildUnit_upv_1(value_5, v26, a2, a3)
                    if v25 ~= nil then
                        table.insert(tbl_upv_9, v25)
                    end
                elseif v24 then
                    u4(value_5)
                end
            else
                local v26
                if not (value_5:IsA("BasePart")) then
                    continue
                end
                v26 = measureBox_upv_1(value_5)
                local v27
                if v26 == nil then
                    continue
                end
                v27 = value_5:IsA("Model") and (nameLooksTree_upv_1(value_5.Name))
                local v28 = math.max(v26.size.X, v26.size.Z)
                if v27 or a3.clusterFootprintMax >= v28 and a3.treeHeightCeiling >= v26.size.Y then
                    v25 = buildUnit_upv_1(value_5, v26, a2, a3)
                    if v25 ~= nil then
                        table.insert(tbl_upv_9, v25)
                    end
                elseif v24 then
                    u4(value_5)
                end
            end
        end
    end
    u4(a1)
    return tbl_upv_9
end
return tbl_8