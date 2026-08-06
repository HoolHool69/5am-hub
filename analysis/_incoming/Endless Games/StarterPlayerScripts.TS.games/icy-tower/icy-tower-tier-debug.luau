-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local u1 = Color3.fromRGB(16, 20, 32)
local u2 = Color3.fromRGB(44, 52, 72)
local u3 = Color3.fromRGB(86, 132, 255)
local u4 = Color3.fromRGB(150, 58, 52)
local u5 = Color3.fromRGB(235, 240, 250)
local tbl_1 = {}
tbl_1.mountTierDebugPanel = function(a1)
    --[[
      name: mountTierDebugPanel
      line: 19
      upvalues:
        RunService_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        u5 (copy, index: 4)
        u3 (copy, index: 5)
        u2 (copy, index: 6)
        u4 (copy, index: 7)
    ]]
    if RunService_upv_1:IsStudio() then
        local janitor_1 = a1.janitor
        local tierLabels_1 = a1.tierLabels
        local onOverride_upv_1 = a1.onOverride
        local v2 = Instance.new("ScreenGui")
        v2.Name = "IcyTowerTierDebug"
        v2.ResetOnSpawn = false
        v2.DisplayOrder = 50
        v2.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
        janitor_1:Add(v2)
        local u6 = Instance.new("Frame")
        u6.AnchorPoint = Vector2.new(0, 0.5)
        u6.Position = UDim2.new(0, 8, 0.5, 0)
        u6.Size = UDim2.fromOffset(112, 0)
        u6.AutomaticSize = Enum.AutomaticSize.Y
        u6.BackgroundColor3 = u1
        u6.BackgroundTransparency = 0.2
        u6.BorderSizePixel = 0
        u6.Parent = v2
        local v3 = Instance.new("UICorner")
        v3.CornerRadius = UDim.new(0, 8)
        v3.Parent = u6
        local v4 = Instance.new("UIPadding")
        v4.PaddingTop = UDim.new(0, 6)
        v4.PaddingBottom = UDim.new(0, 6)
        v4.PaddingLeft = UDim.new(0, 6)
        v4.PaddingRight = UDim.new(0, 6)
        v4.Parent = u6
        local v5 = Instance.new("UIListLayout")
        v5.FillDirection = Enum.FillDirection.Vertical
        v5.SortOrder = Enum.SortOrder.LayoutOrder
        v5.Padding = UDim.new(0, 4)
        v5.Parent = u6
        local v6 = Instance.new("TextLabel")
        v6.LayoutOrder = 0
        v6.Size = UDim2.new(1, 0, 0, 16)
        v6.BackgroundTransparency = 1
        v6.Font = Enum.Font.GothamBold
        v6.TextSize = 11
        v6.TextColor3 = u5
        v6.Text = "SLAB TIER \194\183 STUDIO"
        v6.Parent = u6
        local tbl_upv_2 = {}
        local u7 = nil
        local function v7(a2, a3, a4)
            --[[
              line: 72
              upvalues:
                u5 (copy, index: 1)
                u6 (copy, index: 2)
            ]]
            local v8 = Instance.new("TextButton")
            v8.LayoutOrder = a3
            v8.Size = UDim2.new(1, 0, 0, 22)
            v8.BackgroundColor3 = a4
            v8.BorderSizePixel = 0
            v8.AutoButtonColor = true
            v8.Font = Enum.Font.GothamBold
            v8.TextSize = 12
            v8.TextColor3 = u5
            v8.Text = a2
            local v9 = Instance.new("UICorner")
            v9.CornerRadius = UDim.new(0, 5)
            v9.Parent = v8
            v8.Parent = u6
            return v8
        end
        for n_upv_1 = 0, #tierLabels_1 - 1 do
            local v10 = v7(("%* \194\183 %*"):format(n_upv_1, tierLabels_1[n_upv_1 + 1]), n_upv_1 + 1, u2)
            table.insert(tbl_upv_2, v10)
            janitor_1:Add(
                v10.Activated:Connect(
                    function()
                        --[[
                          line: 92
                          upvalues:
                            u7 (ref,  index: 1)
                            n_upv_1 (copy, index: 2)
                            tbl_upv_2 (copy, index: 3)
                            u3 (copy, index: 4)
                            u2 (copy, index: 5)
                            onOverride_upv_1 (copy, index: 6)
                        ]]
                        u7 = n_upv_1
                        local v11 = nil
                        for n_2 = 0, #tbl_upv_2 - 1 do
                            local v12 = tbl_upv_2[n_2 + 1]
                            if n_2 ~= n_upv_1 then
                                v11 = u2
                            else
                                v11 = u3
                            end
                            v12.BackgroundColor3 = v11
                        end
                        onOverride_upv_1(n_upv_1)
                    end
                )
            )
        end
        janitor_1:Add(
            v7("RESET", #tierLabels_1 + 1, u4).Activated:Connect(
                function()
                    --[[
                      line: 99
                      upvalues:
                        u7 (ref,  index: 1)
                        tbl_upv_2 (copy, index: 2)
                        u3 (copy, index: 3)
                        u2 (copy, index: 4)
                        onOverride_upv_1 (copy, index: 5)
                    ]]
                    u7 = nil
                    local v13 = nil
                    for n_3 = 0, #tbl_upv_2 - 1 do
                        local v14 = tbl_upv_2[n_3 + 1]
                        if n_3 ~= u7 then
                            v13 = u2
                        else
                            v13 = u3
                        end
                        v14.BackgroundColor3 = v13
                    end
                    onOverride_upv_1(nil)
                end
            )
        )
    else
        return nil
    end
end
return tbl_1