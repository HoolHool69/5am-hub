-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local TweenService_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u1 = CFrame.new(0, -1000, 0)
local function riseInfo_1(a1)
    --[[
      name: riseInfo
      line: 41
    ]]
    return TweenInfo.new(a1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
end
local function fadeInfo_1(a1)
    --[[
      name: fadeInfo
      line: 45
    ]]
    return TweenInfo.new(a1 * 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, a1 * 0.5)
end
local u2 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u3 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0.35)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 63
    ]]
    return "PopupTextPool"
end
local u4 = setmetatable(tbl_1, tbl_2)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 68
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u4)
    return v1:constructor(...) or v1
end
u4.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 72
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a3 == nil then
        a3 = 6
    end
    a1.items = {}
    local v2 = 0
    local v3 = false
    while true do
        if v3 then
            v2 = v2 + 1
        else
            v3 = true
        end
        if v2 >= a3 then
            break
        end
        local v4 = Instance.new("Part")
        v4.Anchored = true
        v4.CanCollide = false
        v4.CanQuery = false
        v4.CanTouch = false
        v4.Transparency = 1
        v4.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
        v4.CFrame = u1
        v4.Parent = a2
        local v5 = Instance.new("BillboardGui")
        v5.Size = UDim2.fromScale(10, 2.4)
        v5.AlwaysOnTop = true
        v5.Parent = v4
        local v6 = Instance.new("TextLabel")
        v6.BackgroundTransparency = 1
        v6.Size = UDim2.fromScale(1, 1)
        v6.Font = Enum.Font.GothamBlack
        v6.TextScaled = true
        v6.Text = ""
        v6.TextTransparency = 1
        v6.TextStrokeTransparency = 1
        v6.Parent = v5
        table.insert(a1.items, {part = v4, billboard = v5, label = v6})
    end
end
u4.show = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: show
      line: 125
      upvalues:
        u2 (copy, index: 1)
        u3 (copy, index: 2)
        TweenService_upv_1 (copy, index: 3)
    ]]
    if a5 == nil then
        a5 = 1
    end
    if a6 == nil then
        a6 = 0.7
    end
    local v7 = os.clock()
    local v8 = a1:claim(v7)
    local v9, v10 = nil, nil
    if v8 ~= nil then
        v9 = v8.moveTween
        if v9 ~= nil then
            v9:Cancel()
        end
        v10 = v8.fadeTween
        if v10 ~= nil then
            v10:Cancel()
        end
        v8.expiryClock = v7 + a6
        v8.part.CFrame = CFrame.new(a2)
        v8.label.Text = a3
        v8.label.TextColor3 = a4
        v8.label.TextTransparency = 0
        v8.label.TextStrokeTransparency = 0.35
        if v8.scale ~= a5 then
            v8.scale = a5
            v8.billboard.Size = UDim2.fromScale(10 * a5, 2.4 * a5)
        end
        local v11 = a6 == 0.7
        local v12
        if v11 then
            v12 = u2
        else
            v12 = TweenInfo.new(a6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        end
        local v13
        if v11 then
            v13 = u3
        else
            v13 = TweenInfo.new(a6 * 0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, a6 * 0.5)
        end
        v8.moveTween = TweenService_upv_1:Create(v8.part, v12, {CFrame = CFrame.new(a2 + Vector3.new(0, 4, 0))})
        v8.fadeTween = TweenService_upv_1:Create(v8.label, v13, {})
        v8.moveTween:Play()
        v8.fadeTween:Play()
    else
        return nil
    end
end
u4.hideAll = function(a1)
    --[[
      name: hideAll
      line: 170
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v14 = nil
    local v15 = nil
    for _, value_1 in a1.items do
        v14 = value_1.moveTween
        if v14 ~= nil then
            v14:Cancel()
        end
        v15 = value_1.fadeTween
        if v15 ~= nil then
            v15:Cancel()
        end
        value_1.moveTween = nil
        value_1.fadeTween = nil
        value_1.expiryClock = 0
        value_1.part.CFrame = u1
        value_1.label.Text = ""
        value_1.label.TextTransparency = 1
        value_1.label.TextStrokeTransparency = 1
    end
end
u4.claim = function(a1, a2)
    --[[
      name: claim
      line: 191
    ]]
    local v16
    v16 = nil
    for _, value_2 in a1.items do
        if value_2.expiryClock > a2 then
            if v16 == nil or value_2.expiryClock < v16.expiryClock then
                v16 = value_2
            end
        else
            return value_2
        end
    end
    return v16
end
local tbl_3 = {}
tbl_3.PopupTextPool = u4
return tbl_3