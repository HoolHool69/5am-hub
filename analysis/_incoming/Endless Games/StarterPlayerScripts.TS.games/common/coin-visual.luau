-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local waitForSceneryModel_upv_1 = RuntimeLib_1.import(script, script.Parent, "scenery-assets").waitForSceneryModel
local COIN_UNIVERSAL_NAME_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").COIN_UNIVERSAL_NAME
local u1 = CFrame.new(0, -1000, 0)
local identity_upv_1 = CFrame.identity
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 36
    ]]
    return "CoinVisual"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 41
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u2)
    return v1:constructor(...) or v1
end
u2.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 45
    ]]
    a1.model = a2
end
u2.make = function(a1, a2, a3, a4)
    --[[
      name: make
      line: 48
      upvalues:
        u1 (copy, index: 1)
        u2 (ref,  index: 2)
    ]]
    local v2 = a2:Clone()
    local _, v3 = v2:GetBoundingBox()
    local v4 = math.max(v3.Y, v3.Z)
    if v4 > 0 then
        v2:ScaleTo(v2:GetScale() * (a4.diameter / v4))
    end
    for v8, value_1 in v2:GetDescendants() do
        if not (value_1:IsA("BasePart")) then
            continue
        end
        value_1.Anchored = true
        value_1.CanCollide = false
        value_1.CanQuery = false
        value_1.CanTouch = false
        value_1.CastShadow = false
        if a4.tint ~= nil then
            local v5, v6 = a4.tint:ToHSV()
            local v9, v10, v7 = value_1.Color:ToHSV()
            value_1.Color = Color3.fromHSV(v5, v6, v7)
        end
    end
    v2:PivotTo(u1)
    v2.Parent = a3
    return u2.new(v2)
end
u2.pose = function(a1, a2)
    --[[
      name: pose
      line: 76
      upvalues:
        identity_upv_1 (copy, index: 1)
    ]]
    a1.model:PivotTo(a2 * identity_upv_1)
end
u2.park = function(a1)
    --[[
      name: park
      line: 79
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.model:PivotTo(u1)
end
u2.destroy = function(a1)
    --[[
      name: destroy
      line: 82
    ]]
    a1.model:Destroy()
end
local tbl_3 = {}
tbl_3.findCoinTemplate = function()
    --[[
      name: findCoinTemplate
      line: 22
      upvalues:
        waitForSceneryModel_upv_1 (copy, index: 1)
        COIN_UNIVERSAL_NAME_upv_1 (copy, index: 2)
    ]]
    return waitForSceneryModel_upv_1(COIN_UNIVERSAL_NAME_upv_1, "coin-visual")
end
tbl_3.CoinVisual = u2
return tbl_3