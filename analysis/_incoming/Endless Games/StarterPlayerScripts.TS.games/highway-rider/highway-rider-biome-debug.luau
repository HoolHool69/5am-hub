-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local photoModeAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").photoModeAtom
local bindAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "binding").bindAtom
local u1 = Color3.fromRGB(16, 20, 32)
local u2 = Color3.fromRGB(44, 52, 72)
local u3 = Color3.fromRGB(86, 132, 255)
local u4 = Color3.fromRGB(150, 58, 52)
local u5 = Color3.fromRGB(58, 104, 72)
local u6 = Color3.fromRGB(235, 240, 250)
local u7 = Color3.fromRGB(150, 220, 160)
local tbl_1 = {}
tbl_1.mountBiomeDebugPanel = function(a1)
    --[[
      name: mountBiomeDebugPanel
      line: 32
      upvalues:
        RunService_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
        bindAtom_upv_1 (copy, index: 3)
        photoModeAtom_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
        u6 (copy, index: 6)
        u7 (copy, index: 7)
        u3 (copy, index: 8)
        u2 (copy, index: 9)
        u4 (copy, index: 10)
        u5 (copy, index: 11)
    ]]
    if RunService_upv_1:IsStudio() then
        local janitor_1 = a1.janitor
        local biomeLabels_1 = a1.biomeLabels
        local readStatus_upv_1 = a1.readStatus
        local onPin_upv_1 = a1.onPin
        local actions_1 = a1.actions
        local u8 = Instance.new("ScreenGui")
        u8.Name = "HighwayRiderBiomeDebug"
        u8.ResetOnSpawn = false
        u8.DisplayOrder = 50
        u8.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
        janitor_1:Add(u8)
        bindAtom_upv_1(
            janitor_1,
            photoModeAtom_upv_1,
            function(a2)
                --[[
                  line: 50
                  upvalues:
                    u8 (copy, index: 1)
                ]]
                u8.Enabled = not a2
            end
        )
        local u9 = Instance.new("Frame")
        u9.AnchorPoint = Vector2.new(0, 0.5)
        u9.Position = UDim2.new(0, 8, 0.5, 0)
        u9.Size = UDim2.fromOffset(150, 0)
        u9.AutomaticSize = Enum.AutomaticSize.Y
        u9.BackgroundColor3 = u1
        u9.BackgroundTransparency = 0.2
        u9.BorderSizePixel = 0
        u9.Parent = u8
        local v2 = Instance.new("UICorner")
        v2.CornerRadius = UDim.new(0, 8)
        v2.Parent = u9
        local v3 = Instance.new("UIPadding")
        v3.PaddingTop = UDim.new(0, 6)
        v3.PaddingBottom = UDim.new(0, 6)
        v3.PaddingLeft = UDim.new(0, 6)
        v3.PaddingRight = UDim.new(0, 6)
        v3.Parent = u9
        local v4 = Instance.new("UIListLayout")
        v4.FillDirection = Enum.FillDirection.Vertical
        v4.SortOrder = Enum.SortOrder.LayoutOrder
        v4.Padding = UDim.new(0, 4)
        v4.Parent = u9
        local u10 = Instance.new("TextLabel")
        u10.LayoutOrder = 0
        u10.Size = UDim2.new(1, 0, 0, 16)
        u10.BackgroundTransparency = 1
        u10.Font = Enum.Font.GothamBold
        u10.TextSize = 11
        u10.TextColor3 = u6
        u10.Text = "ROAD BIOME \194\183 STUDIO"
        u10.Parent = u9
        local v5 = Instance.new("TextLabel")
        v5.LayoutOrder = 1
        v5.Size = UDim2.new(1, 0, 0, 16)
        v5.BackgroundTransparency = 1
        v5.Font = Enum.Font.GothamBold
        v5.TextSize = 11
        v5.TextColor3 = u7
        v5.Text = "\226\128\166"
        v5.Parent = u9
        local u11 = Instance.new("TextLabel")
        u11.LayoutOrder = 2
        u11.Size = UDim2.new(1, 0, 0, 16)
        u11.BackgroundTransparency = 1
        u11.Font = Enum.Font.GothamBold
        u11.TextSize = 11
        u11.TextColor3 = u7
        u11.Text = "\226\128\166"
        u11.Parent = u9
        local tbl_upv_2 = {}
        u11 = nil
        u11 = nil
        local function v6(a3, a4, a5)
            --[[
              line: 98
              upvalues:
                u6 (copy, index: 1)
                u9 (copy, index: 2)
            ]]
            local v7 = Instance.new("TextButton")
            v7.LayoutOrder = a4
            v7.Size = UDim2.new(1, 0, 0, 22)
            v7.BackgroundColor3 = a5
            v7.BorderSizePixel = 0
            v7.AutoButtonColor = true
            v7.Font = Enum.Font.GothamBold
            v7.TextSize = 12
            v7.TextColor3 = u6
            v7.Text = a3
            local v8 = Instance.new("UICorner")
            v8.CornerRadius = UDim.new(0, 5)
            v8.Parent = v7
            v7.Parent = u9
            return v7
        end
        for u12 = 0, #biomeLabels_1 - 1 do
            local v9 = v6(("%* \194\183 %*"):format(u12, biomeLabels_1[u12 + 1]), u12 + 3, u2)
            table.insert(tbl_upv_2, v9)
            janitor_1:Add(
                v9.Activated:Connect(
                    function()
                        --[[
                          line: 118
                          upvalues:
                            u11 (ref,  index: 1)
                            u12 (copy, index: 2)
                            tbl_upv_2 (copy, index: 3)
                            u3 (copy, index: 4)
                            u2 (copy, index: 5)
                            onPin_upv_1 (copy, index: 6)
                        ]]
                        u11 = u12
                        local v10 = nil
                        for n_1 = 0, #tbl_upv_2 - 1 do
                            local v11 = tbl_upv_2[n_1 + 1]
                            if n_1 ~= u12 then
                                v10 = u2
                            else
                                v10 = u3
                            end
                            v11.BackgroundColor3 = v10
                        end
                        onPin_upv_1(u12)
                    end
                )
            )
        end
        janitor_1:Add(
            v6("RESET", #biomeLabels_1 + 3, u4).Activated:Connect(
                function()
                    --[[
                      line: 125
                      upvalues:
                        u11 (ref,  index: 1)
                        tbl_upv_2 (copy, index: 2)
                        u3 (copy, index: 3)
                        u2 (copy, index: 4)
                        onPin_upv_1 (copy, index: 5)
                    ]]
                    u11 = nil
                    local v12 = nil
                    for n_2 = 0, #tbl_upv_2 - 1 do
                        local v13 = tbl_upv_2[n_2 + 1]
                        if n_2 ~= u11 then
                            v12 = u2
                        else
                            v12 = u3
                        end
                        v13.BackgroundColor3 = v12
                    end
                    onPin_upv_1(nil)
                end
            )
        )
        local u13 = 0
        u13 = false
        local v14 = nil
        while true do
            local u12, u14
            if u12 then
                u13 = u13 + 1
            else
                u12 = true
            end
            local v15
            if actions_1 == nil then
                v15 = actions_1
            else
                v15 = #actions_1
            end
            if v15 ~= nil then
                v14 = v15
            else
                v14 = 0
            end
            if u13 >= v14 then
                break
            end
            local u15 = (actions_1 or {})[u13 + 1]
            janitor_1:Add(
                v6(u15.label, (#biomeLabels_1 + 4) + u13, u5).Activated:Connect(
                    function()
                        --[[
                          line: 155
                          upvalues:
                            u15 (copy, index: 1)
                        ]]
                        return u15.run()
                    end
                )
            )
            u14, u10 = nil, nil
        end
        u13 = 0
        local u12 = 0
        local u16 = 0
        janitor_1:Add(
            RunService_upv_1.RenderStepped:Connect(
                function(a6)
                    --[[
                      line: 163
                      upvalues:
                        u13 (ref,  index: 1)
                        u12 (ref,  index: 2)
                        u16 (ref,  index: 3)
                        u14 (copy, index: 4)
                        u10 (copy, index: 5)
                        readStatus_upv_1 (copy, index: 6)
                    ]]
                    u13 = u13 + a6
                    u12 = u12 + 1
                    if u16 < a6 then
                        u16 = a6
                    end
                    if u13 >= 0.5 then
                        u14.Text = string.format("%.1f ms \194\183 peak %.1f", (u13 / u12) * 1000, u16 * 1000)
                        u10.Text = readStatus_upv_1()
                        u13 = 0
                        u12 = 0
                        u16 = 0
                    else
                        return nil
                    end
                end
            )
        )
    else
        return nil
    end
end
return tbl_1