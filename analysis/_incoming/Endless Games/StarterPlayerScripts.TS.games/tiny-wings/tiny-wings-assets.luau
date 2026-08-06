-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local waitForSceneryRoot_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local tbl_upv_1 = {"Terrain", "Coins", "Scenery", "Player"}
local u1 = CFrame.new(0, -1000, 0)
local clonePrimaryPart_upv_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 27
    ]]
    return "TinyWingsAssets"
end
local u2 = setmetatable(clonePrimaryPart_upv_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 32
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 36
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.templates = {}
    local v2 = waitForSceneryRoot_upv_1("TinyWings", "tiny-wings")
    if v2 ~= nil then
        a1.available = true
        a1:indexModels(v2)
        local v3 = nil
        for _, value_1 in tbl_upv_1 do
            v3 = v2:FindFirstChild(value_1)
            if v3 ~= nil then
                a1:indexModels(v3)
            end
        end
    else
        a1.available = false
        return nil
    end
end
u2.indexModels = function(a1, a2)
    --[[
      name: indexModels
      line: 52
    ]]
    local value_2 = nil
    for _, value_2 in a2:GetChildren() do
        if value_2:IsA("Model") then
            a1.templates[value_2.Name] = value_2
        end
    end
end
u2.template = function(a1, a2)
    --[[
      name: template
      line: 61
    ]]
    return a1.templates[a2]
end
local function flattenPart_1(a1, a2)
    --[[
      name: flattenPart
      line: 68
    ]]
    a1.Anchored = true
    a1.CanCollide = false
    a1.CanQuery = false
    a1.CanTouch = false
    a1.CastShadow = a2
end
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 108
    ]]
    return "TerrainSkin"
end
local u3 = setmetatable(tbl_3, tbl_4)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 113
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u3)
    return v4:constructor(...) or v4
end
u3.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 117
    ]]
    a1.ground = a2
    a1.water = a3
    a1.groundAuthored = a4
    a1.waterAuthored = a5
end
clonePrimaryPart_upv_1 = function(a1, a2)
    --[[
      name: clonePrimaryPart
      line: 82
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v5 = a1:Clone()
    local v6 = v5.PrimaryPart or (v5:FindFirstChildWhichIsA("BasePart", true))
    if v6 ~= nil then
        v6.Anchored = true
        v6.CanCollide = false
        v6.CanQuery = false
        v6.CanTouch = false
        v6.CastShadow = false
        v6.Parent = a2
        v6.CFrame = u1
        v5:Destroy()
        return v6
    end
    v5:Destroy()
    return nil
end
u3.create = function(a1, a2, a3, a4, a5)
    --[[
      name: create
      line: 123
      upvalues:
        clonePrimaryPart_upv_1 (copy, index: 1)
        u3 (ref,  index: 2)
    ]]
    local v7
    if a3 == nil then
        v7 = nil
    else
        v7 = clonePrimaryPart_upv_1(a3, a2)
    end
    local v8 = v7 or (a5())
    local v9
    if a4 == nil then
        v9 = nil
    else
        v9 = clonePrimaryPart_upv_1(a4, a2)
    end
    local new_1 = u3.new
    local v10 = v7 ~= nil
    return new_1(v8, v9, v10, v9 ~= nil)
end
u3.pose = function(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: pose
      line: 129
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v11
    if (a2) and a1.water ~= nil then
        v11 = a1.water
    else
        v11 = a1.ground
    end
    local v12
    if v11 ~= a1.water then
        v12 = a1.groundAuthored
    else
        v12 = a1.waterAuthored
    end
    v11.CFrame = a3
    v11.Size = a4
    v11.Color = a5
    v11.Transparency = a7
    if not (v12) then
        v11.Material = a6
    end
    if a1.water ~= nil then
        local v13
        if v11 ~= a1.water then
            v13 = a1.water
        else
            v13 = a1.ground
        end
        v13.CFrame = u1
    end
end
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 158
    ]]
    return "PropOverlay"
end
local u4 = setmetatable(tbl_5, tbl_6)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 163
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v14 = setmetatable({}, u4)
    return v14:constructor(...) or v14
end
u4.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 167
    ]]
    a1.model = a2
    a1.orient = a3
end
u4.make = function(a1, a2, a3, a4, a5)
    --[[
      name: make
      line: 171
      upvalues:
        u1 (copy, index: 1)
        u4 (ref,  index: 2)
    ]]
    local v15 = a2:Clone()
    for _, value_3 in v15:GetDescendants() do
        if value_3:IsA("BasePart") then
            value_3.Anchored = true
            value_3.CanCollide = false
            value_3.CanQuery = false
            value_3.CanTouch = false
            value_3.CastShadow = a5
        end
    end
    v15:PivotTo(u1)
    v15.Parent = a3
    return u4.new(v15, a4)
end
u4.follow = function(a1, a2)
    --[[
      name: follow
      line: 182
    ]]
    a1.model:PivotTo(a2 * a1.orient)
end
u4.park = function(a1)
    --[[
      name: park
      line: 188
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.model:PivotTo(u1)
end
local tbl_7 = {}
tbl_7.TinyWingsAssets = u2
tbl_7.TerrainSkin = u3
tbl_7.PropOverlay = u4
return tbl_7