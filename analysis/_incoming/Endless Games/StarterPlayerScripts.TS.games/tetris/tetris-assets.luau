-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local tbl_upv_1 = {}
tbl_upv_1.Well = true
tbl_upv_1.WellWall = true
tbl_upv_1.Checker = true
local function resolveTetrisKit_1()
    --[[
      name: resolveTetrisKit
      line: 55
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
    ]]
    local v1 = waitForSceneryRoot_upv_1("Tetris", "tetris")
    if v1 ~= nil and v1:IsA("Folder") then
        return v1
    end
    return nil
end
local function backdropExtent_upv_1(a1)
    --[[
      name: backdropExtent
      line: 31
    ]]
    if a1:IsA("Model") then
        local v2, v3 = a1:GetBoundingBox()
        local tbl_2 = {}
        tbl_2.centerX = v2.Position.X
        tbl_2.width = v3.X
        return tbl_2
    elseif a1:IsA("BasePart") then
        local tbl_3 = {}
        tbl_3.centerX = a1.Position.X
        tbl_3.width = a1.Size.X
        return tbl_3
    else
        return nil
    end
end
local tbl_4 = {}
tbl_4.resolveTetrisKit = resolveTetrisKit_1
tbl_4.cloneTetrisKit = function(a1, a2, a3, a4, a5)
    --[[
      name: cloneTetrisKit
      line: 82
      upvalues:
        backdropExtent_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v4 = a4 ~= nil
    local v5 = a1:Clone()
    local Well_1 = v5:FindFirstChild("Well")
    if Well_1 ~= nil then
        local v6, v7, v8, v9 = nil, nil, nil, nil
        if Well_1:IsA("BasePart") then
            local v10 = a3 - Well_1.Position
            v6 = v5:FindFirstChild("Lighting")
            if v6 ~= nil then
                v6:Destroy()
            end
            local v11 = (v4 and "BackdropDuels") or "Backdrop"
            v7 = v5:FindFirstChild((v4 and "Backdrop") or "BackdropDuels")
            if v7 ~= nil then
                v7:Destroy()
            end
            v8 = v5:FindFirstChild(v11)
            if v8 == nil then
                local v12 = v5:GetChildren()
                local v13 = table.create(#v12)
                for key_1, value_1 in v12 do
                    v13[key_1] = value_1.Name
                end
                warn(("[tetris] authored kit has no '%*' \226\128\148 the %* stage renders "):format(v11, (v4 and "duel") or "solo") .. ("with no backdrop. Kit children: %*"):format(table.concat(v13, ", ")))
            end
            local v14 = nil
            local v15 = nil
            if v4 then
                local v16 = nil
                if v8 ~= nil then
                    v16 = backdropExtent_upv_1(v8)
                    if v16 == nil or math.abs(v16.centerX - Well_1.Position.X) <= 0.5 then
                        warn(("[tetris] '%*' is centered on the Well, so it marks no second board slot \226\128\148 "):format(v11) .. "falling back to the viewport-derived opponent window.")
                    else
                        v14 = 2 * (v16.centerX - Well_1.Position.X)
                        v15 = v16.width
                        print(("[tetris] duel scene: authored board gap %* studs, "):format(string.format("%.1f", v14)) .. ("backdrop width %* studs"):format(string.format("%.1f", v16.width)))
                    end
                end
            end
            local v16
            if a4 == nil or a4.isLeft or v14 == nil then
                v16 = Vector3.new(0, 0, 0)
            else
                v16 = Vector3.new(-v14, 0, 0)
            end
            v9 = v5:FindFirstChild("HoldPanel", true)
            local v17
            if v9 ~= nil and (v9:IsA("BasePart")) then
                v17 = Well_1.Position.X + a5 - v9.Position.X
            else
                v17 = 0
            end
            local tbl_5 = {}
            local _, v18 = nil, nil
            local v19 = nil
            local v20 = nil
            local value_2 = nil
            for v21, value_2 in v5:GetDescendants() do
                v19 = value_2:IsA("BasePart")
                if not (v19) then
                    continue
                end
                value_2.Anchored = true
                value_2.CanCollide = false
                value_2.CanQuery = false
                value_2.CanTouch = false
                v19 = false
                if v8 ~= nil then
                    v19 = value_2:IsDescendantOf(v8)
                end
                if v19 then
                    v20 = v10 + v16
                else
                    v20 = v10
                end
                if value_2.Name == "HoldPanel" and not (v19) then
                    v20 = v20 + Vector3.new(v17, 0, 0)
                end
                value_2.CFrame = value_2.CFrame + v20
                if tbl_upv_1[value_2.Name] ~= nil then
                    v18 = true
                else
                    v18 = false
                end
                if v18 then
                    v18 = not v19
                end
                if v18 then
                    table.insert(tbl_5, value_2)
                end
            end
            v5.Parent = a2
            local tbl_6 = {}
            tbl_6.dressing = tbl_5
            tbl_6.duelGap = v14
            tbl_6.duelFrameWidth = v15
            return tbl_6
        end
    end
    warn("[tetris] authored kit has no Well part to align against \226\128\148 using procedural fallback")
    v5:Destroy()
    return nil
end
return tbl_4