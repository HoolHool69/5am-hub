-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "scenery-assets").waitForSceneryRoot
local u1 = CFrame.Angles(0, 1.5707963267948966, 0)
local u2 = CFrame.new(0, -1000, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 21
    ]]
    return "HeartPip"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 26
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u3)
    return v1:constructor(...) or v1
end
u3.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 30
    ]]
    a1.model = a2
    a1.spentColor = a3
    a1.spentTransparency = a4
    a1.aliveColor = a5
    a1.spent = false
    local tbl_3 = {}
    for _, value_1 in a2:GetDescendants() do
        if not (value_1:IsA("BasePart")) then
            continue
        end
        value_1.Anchored = true
        value_1.CanCollide = false
        value_1.CanQuery = false
        value_1.CanTouch = false
        value_1.CastShadow = false
        if a1.aliveColor ~= nil then
            value_1.Color = a1.aliveColor
        end
        table.insert(tbl_3, {part = value_1, aliveColor = value_1.Color, aliveTransparency = value_1.Transparency})
    end
    a1.layers = tbl_3
end
u3.pose = function(a1, a2)
    --[[
      name: pose
      line: 59
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.model:PivotTo(a2 * u1)
end
u3.setSpent = function(a1, a2)
    --[[
      name: setSpent
      line: 62
    ]]
    if a1.spent ~= a2 then
        a1.spent = a2
        local v2 = nil
        local part_1 = nil
        local value_2 = nil
        local part_2 = nil
        for _, value_2 in a1.layers do
            part_1 = value_2.part
            if a2 then
                v2 = a1.spentColor
            else
                v2 = value_2.aliveColor
            end
            part_1.Color = v2
            part_2 = value_2.part
            if a2 then
                v2 = a1.spentTransparency
            else
                v2 = value_2.aliveTransparency
            end
            part_2.Transparency = v2
        end
    else
        return nil
    end
end
local tbl_4 = {}
local tbl_5 = {}
tbl_5.__tostring = function()
    --[[
      name: __tostring
      line: 85
    ]]
    return "HeartPipRow"
end
local u4 = setmetatable(tbl_4, tbl_5)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 90
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u4)
    return v3:constructor(...) or v3
end
u4.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 94
    ]]
    a1.pips = a2
    a1.heightStuds = a3
end
u4.tryCreate = function(a1, a2, a3)
    --[[
      name: tryCreate
      line: 98
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u3 (ref,  index: 3)
        u4 (ref,  index: 4)
    ]]
    local v4 = waitForSceneryRoot_upv_1("FruitNinjaGameplay", "heart-pips")
    if v4 ~= nil then
        v4 = v4:FindFirstChild("Heart")
    end
    if v4 ~= nil and v4:IsA("Model") then
        local _, v5 = v4:GetBoundingBox()
        local v6 = a3.widthStuds / math.max(v5.Z, 0.1)
        local tbl_6 = {}
        local v7 = 0
        local v8 = false
        while true do
            if v8 then
                v7 = v7 + 1
            else
                v8 = true
            end
            if v7 >= a3.count then
                break
            end
            local v9 = v4:Clone()
            v9:ScaleTo(v9:GetScale() * v6)
            v9:PivotTo(u2)
            v9.Parent = a2
            table.insert(tbl_6, (u3.new(v9, a3.spentColor, a3.spentTransparency, a3.aliveColor)))
        end
        return u4.new(tbl_6, v5.Y * v6)
    end
    warn("[heart-pips] missing FruitNinjaGameplay.Heart \226\128\148 lives stay procedural")
    return nil
end
u4.layout = function(a1, a2, a3, a4)
    --[[
      name: layout
      line: 136
    ]]
    local v10 = ((a4 ~= nil) and (CFrame.new(a2) * a4.Rotation)) or (CFrame.new(a2))
    for n_1 = 0, #a1.pips - 1 do
        a1.pips[n_1 + 1]:pose(v10 * CFrame.new((n_1 - (#a1.pips - 1) * 0.5) * a3, 0, 0))
    end
end
u4.setRemaining = function(a1, a2)
    --[[
      name: setRemaining
      line: 153
    ]]
    for n_2 = 0, #a1.pips - 1 do
        a1.pips[n_2 + 1]:setSpent(a2 <= n_2)
    end
end
local tbl_7 = {}
tbl_7.HeartPipRow = u4
return tbl_7