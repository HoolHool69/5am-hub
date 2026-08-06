-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local SNAKE_MAP_NAME_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").SNAKE_MAP_NAME
local function partsCenter_upv_1(a1)
    --[[
      name: partsCenter
      line: 22
    ]]
    local v1 = Vector3.new(0, 0, 0)
    local v2 = 0
    local v3 = nil
    for _, value_1 in a1:GetDescendants() do
        v3 = value_1:IsA("BasePart")
        if v3 then
            v1 = v1 + value_1.Position
            v2 = v2 + 1
        end
    end
    if v2 <= 0 then
        return Vector3.new(0, 0, 0)
    end
    return v1 / v2
end
local function flattenToProp_upv_1(a1)
    --[[
      name: flattenToProp
      line: 10
    ]]
    for _, value_2 in a1:GetDescendants() do
        if value_2:IsA("BasePart") then
            value_2.Anchored = true
            value_2.CanCollide = false
            value_2.CanQuery = false
            value_2.CanTouch = false
            value_2.CastShadow = false
        end
    end
end
local tbl_1 = {}
tbl_1.resolveSnakeMap = function()
    --[[
      name: resolveSnakeMap
      line: 51
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        SNAKE_MAP_NAME_upv_1 (copy, index: 2)
    ]]
    local v4 = waitForSceneryRoot_upv_1(SNAKE_MAP_NAME_upv_1, "snake")
    if v4 ~= nil and v4:IsA("Folder") then
        return v4
    end
    return nil
end
tbl_1.resolveSnakeLighting = function()
    --[[
      name: resolveSnakeLighting
      line: 65
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        SNAKE_MAP_NAME_upv_1 (copy, index: 2)
    ]]
    local v5 = waitForSceneryRoot_upv_1(SNAKE_MAP_NAME_upv_1, "snake")
    if v5 ~= nil then
        v5 = v5:FindFirstChild("Lighting")
    end
    return v5
end
tbl_1.cloneSnakeMap = function(a1, a2, a3, a4)
    --[[
      name: cloneSnakeMap
      line: 84
      upvalues:
        flattenToProp_upv_1 (copy, index: 1)
        partsCenter_upv_1 (copy, index: 2)
    ]]
    local v6 = a1:Clone()
    local Lighting_1 = v6:FindFirstChild("Lighting")
    if Lighting_1 ~= nil then
        Lighting_1:Destroy()
    end
    flattenToProp_upv_1(v6)
    local v7 = v6:FindFirstChild("BoardFloor", true)
    local v8
    if v7 ~= nil and (v7:IsA("BasePart")) then
        v8 = v7.Position
    else
        v8 = partsCenter_upv_1(v6)
    end
    local v9 = Vector3.new(a3.X, a3.Y, a4) - v8
    for _, value_3 in v6:GetDescendants() do
        if value_3:IsA("BasePart") then
            value_3.CFrame = value_3.CFrame + v9
        end
    end
    v6.Parent = a2
    return v6
end
return tbl_1