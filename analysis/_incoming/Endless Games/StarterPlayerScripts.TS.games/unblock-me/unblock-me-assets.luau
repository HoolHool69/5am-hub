-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local modelWorldAabb_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-kit").modelWorldAabb
local function asModel_1(a1)
    --[[
      name: asModel
      line: 22
    ]]
    if a1 ~= nil and a1:IsA("Model") then
        return a1
    end
    return nil
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 30
    ]]
    return "UnblockMeAssets"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 35
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 39
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        modelWorldAabb_upv_1 (copy, index: 2)
    ]]
    local tbl_3 = {}
    a1.gradients = tbl_3
    local v2 = waitForSceneryRoot_upv_1("UnblockMe", "unblock-me")
    a1.available = v2 ~= nil
    local v3, v4, v5, v6 = nil, nil, nil, nil
    if v2 ~= nil then
        a1.lighting = v2:FindFirstChild("Lighting")
        for v7, v8 in v2:GetChildren() do
            if not (v8:IsA("BasePart")) then
                continue
            end
            if v8.Name == "Gradient" then
                table.insert(tbl_3, v8)
            end
        end
        v3 = v2:FindFirstChild("Board")
        if v3 == nil then
            local Cell_1 = v3
        else
            local Cell_1 = v3:FindFirstChild("Cell")
        end
        local v9
        v9 = Cell_1 == nil or not (Cell_1:IsA("Model")) or Cell_1
        local v7
        if v3 == nil then
            v7 = v3
        else
            v7 = v3:FindFirstChild("Frame")
        end
        local v8
        v8 = v7 == nil or not (v7:IsA("Model")) or v7
        if v3 == nil then
            local DetailOutline_1 = v3
        else
            local DetailOutline_1 = v3:FindFirstChild("DetailOutline")
        end
        local DetailOutline_1, v10
        v10 = DetailOutline_1 == nil or not (DetailOutline_1:IsA("BasePart")) or DetailOutline_1
        local v11
        if v3 == nil then
            v11 = v3
        else
            v11 = v3:FindFirstChild("Details")
        end
        local v12
        v12 = v11 == nil or not (v11:IsA("Model")) or v11
        a1.details = v12
        v4 = v2:FindFirstChild("Floor")
        v12 = v4 == nil or not (v4:IsA("Model")) or v4
        v5 = v2:FindFirstChild("Horizon")
        v4 = v5 == nil or not (v5:IsA("Model")) or v5
        v5 = nil
        local tbl_4 = {}
        local tbl_5 = {}
        v6 = v2:FindFirstChild("Pieces")
        local v15 = nil
        if v6 ~= nil then
            local v14 = nil
            for _, value_1 in v6:GetChildren() do
                v14 = value_1:IsA("BasePart")
                if not (v14) then
                    continue
                end
                if value_1.Name == "PlayerPiece" then
                    v5 = value_1
                    continue
                end
                if math.max(value_1.Size.X, value_1.Size.Z) < 8 then
                    v15 = tbl_4
                else
                    v15 = tbl_5
                end
                table.insert(v15, value_1)
            end
        end
        table.sort(
            tbl_4,
            function(a2, a3)
                --[[
                  line: 96
                ]]
                return a2.Position.X < a3.Position.X
            end
        )
        table.sort(
            tbl_5,
            function(a4, a5)
                --[[
                  line: 99
                ]]
                return a4.Position.X < a5.Position.X
            end
        )
        if v9 == nil then
            v15 = nil
        else
            v15 = modelWorldAabb_upv_1(v9)
        end
        local tbl_6 = {}
        if v9 == nil or v15 == nil then
            table.insert(tbl_6, "Board.Cell")
        end
        if v8 == nil then
            table.insert(tbl_6, "Board.Frame")
        end
        if v10 == nil then
            table.insert(tbl_6, "Board.DetailOutline")
        end
        if v12 == nil then
            table.insert(tbl_6, "Floor")
        end
        if v4 == nil then
            table.insert(tbl_6, "Horizon")
        end
        if v5 == nil then
            table.insert(tbl_6, "Pieces.PlayerPiece")
        end
        if #tbl_4 == 0 then
            table.insert(tbl_6, "Pieces (2-cell)")
        end
        if #tbl_5 == 0 then
            table.insert(tbl_6, "Pieces (3-cell)")
        end
        if v9 ~= nil and v15 ~= nil and v8 ~= nil and v10 ~= nil and v12 ~= nil and v4 ~= nil and v5 ~= nil and #tbl_4 ~= 0 and #tbl_5 ~= 0 then
            a1.core = {cellModel = v9, frameRail = v8, detailOutline = v10, floor = v12, horizon = v4, heroHull = v5, twoCellHulls = tbl_4, threeCellHulls = tbl_5, anchor = Vector3.new(v15.center.X, v15.max.Y, v15.center.Z)}
            return
        end
        warn((("[unblock-me] authored kit incomplete (%*) \226\128\148 procedural board"):format(table.concat(tbl_6, ", "))))
    end
    return nil
end
local tbl_7 = {}
tbl_7.UnblockMeAssets = u1
return tbl_7