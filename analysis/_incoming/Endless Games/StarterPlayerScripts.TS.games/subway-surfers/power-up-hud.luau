-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {Vector3.new(-3.4000000953674316, 0, 0), Vector3.new(3.4000000953674316, 0, 0)}
local u2 = Color3.fromRGB(16, 18, 26)
local u3 = Color3.fromRGB(58, 62, 74)
local u4 = Color3.fromRGB(255, 255, 255)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 20
    ]]
    return "PowerUpHud"
end
local u5 = setmetatable(tbl_2, tbl_3)
u5.__index = u5
u5.new = function(...)
    --[[
      name: new
      line: 25
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u5)
    return v1:constructor(...) or v1
end
u5.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 29
      upvalues:
        u1 (copy, index: 1)
        u2 (copy, index: 2)
        u4 (copy, index: 3)
        u3 (copy, index: 4)
    ]]
    a1.chips = {}
    for _ = 0, 1 do
        local v2 = Instance.new("Part")
        v2.Anchored = true
        v2.CanCollide = false
        v2.CanQuery = false
        v2.CanTouch = false
        v2.Transparency = 1
        v2.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
        v2.CFrame = u1
        v2.Parent = a2
        local v3 = Instance.new("BillboardGui")
        v3.Size = UDim2.fromOffset(104, 34)
        v3.AlwaysOnTop = true
        v3.LightInfluence = 0
        v3.Enabled = false
        v3.Parent = v2
        local v4 = Instance.new("Frame")
        v4.Size = UDim2.fromScale(1, 1)
        v4.BackgroundColor3 = u2
        v4.BackgroundTransparency = 0.25
        v4.BorderSizePixel = 0
        v4.Parent = v3
        local v5 = Instance.new("UICorner")
        v5.CornerRadius = UDim.new(0, 10)
        v5.Parent = v4
        local v6 = Instance.new("TextLabel")
        v6.BackgroundTransparency = 1
        v6.Position = UDim2.fromOffset(4, 3)
        v6.Size = UDim2.fromOffset(28, 28)
        v6.Font = Enum.Font.GothamBold
        v6.TextScaled = true
        v6.TextColor3 = u4
        v6.Text = ""
        v6.Parent = v4
        local v7 = Instance.new("Frame")
        v7.Position = UDim2.fromOffset(36, 13)
        v7.Size = UDim2.fromOffset(60, 8)
        v7.BackgroundColor3 = u3
        v7.BorderSizePixel = 0
        v7.Parent = v4
        local v8 = Instance.new("UICorner")
        v8.CornerRadius = UDim.new(0, 4)
        v8.Parent = v7
        local v9 = Instance.new("Frame")
        v9.Size = UDim2.fromScale(1, 1)
        v9.BackgroundColor3 = u4
        v9.BorderSizePixel = 0
        v9.Parent = v7
        local v10 = Instance.new("UICorner")
        v10.CornerRadius = UDim.new(0, 4)
        v10.Parent = v9
        table.insert(a1.chips, {anchor = v2, billboard = v3, iconLabel = v6, fill = v9})
    end
end
u5.setChip = function(a1, a2, a3, a4, a5)
    --[[
      name: setChip
      line: 93
    ]]
    local v11 = a1.chips[a2 + 1]
    if v11 ~= nil then
        if v11.iconText ~= a3 then
            v11.iconText = a3
            v11.iconLabel.Text = a3
            v11.fill.BackgroundColor3 = a4
        end
        v11.fill.Size = UDim2.fromScale(math.clamp(a5, 0, 1), 1)
        v11.billboard.Enabled = true
    else
        return nil
    end
end
u5.hideChip = function(a1, a2)
    --[[
      name: hideChip
      line: 106
    ]]
    local v12 = a1.chips[a2 + 1]
    if v12 ~= nil and v12.billboard.Enabled then
        v12.billboard.Enabled = false
    else
        return nil
    end
end
u5.hideAll = function(a1)
    --[[
      name: hideAll
      line: 113
    ]]
    for n_1 = 0, #a1.chips - 1 do
        a1:hideChip(n_1)
    end
end
u5.pose = function(a1, a2)
    --[[
      name: pose
      line: 118
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    for n_2 = 0, #a1.chips - 1 do
        a1.chips[n_2 + 1].anchor.CFrame = CFrame.new(a2 + tbl_upv_1[n_2 + 1])
    end
end
local tbl_4 = {}
tbl_4.PowerUpHud = u5
return tbl_4