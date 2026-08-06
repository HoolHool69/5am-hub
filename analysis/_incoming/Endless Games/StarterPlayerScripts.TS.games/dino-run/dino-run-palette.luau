-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "dino-run-style")
local ANIMATED_ROLES_upv_1 = v1.ANIMATED_ROLES
local DINO_STYLE_upv_1 = v1.DINO_STYLE
local SNAP_ROLES_upv_1 = v1.SNAP_ROLES
local tbl_upv_1 = {}
local v2 = #tbl_upv_1
local v3 = #ANIMATED_ROLES_upv_1
table.move(ANIMATED_ROLES_upv_1, 1, v3, v2 + 1, tbl_upv_1)
table.move(SNAP_ROLES_upv_1, 1, #SNAP_ROLES_upv_1, (v2 + v3) + 1, tbl_upv_1)
local u1 = Color3.fromRGB(0, 0, 0)
local function smoothstep_1(a1)
    --[[
      name: smoothstep
      line: 16
    ]]
    return (a1 * a1) * (3 - (2 * a1))
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 31
    ]]
    return "TonePalette"
end
local u2 = setmetatable(tbl_2, tbl_3)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 36
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u2)
    return v4:constructor(...) or v4
end
u2.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 40
    ]]
    a1.parts = {}
    a1.currentColors = {}
    a1.startColors = {}
    a1.remaining = 0
    a1.snapped = true
    a1.targetLadder = a2
    a1:snapTo(a2)
end
u2.register = function(a1, a2, a3)
    --[[
      name: register
      line: 49
    ]]
    local v5 = a1.parts[a2]
    if v5 == nil then
        v5 = {}
        a1.parts[a2] = v5
    end
    table.insert(v5, a3)
    a3.Color = a1:color(a2)
end
u2.snapTo = function(a1, a2)
    --[[
      name: snapTo
      line: 66
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    a1.targetLadder = a2
    a1.remaining = 0
    a1.snapped = true
    for _, value_1 in tbl_upv_1 do
        a1:applyRole(value_1, a2[value_1])
    end
end
u2.beginTransition = function(a1, a2)
    --[[
      name: beginTransition
      line: 74
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.targetLadder = a2
    a1.remaining = DINO_STYLE_upv_1.transitionSeconds
    a1.snapped = false
    for _, value_2 in tbl_upv_1 do
        a1.startColors[value_2] = a1:color(value_2)
    end
end
u2.update = function(a1, a2)
    --[[
      name: update
      line: 84
      upvalues:
        ANIMATED_ROLES_upv_1 (copy, index: 1)
        SNAP_ROLES_upv_1 (copy, index: 2)
        DINO_STYLE_upv_1 (copy, index: 3)
    ]]
    if a1.remaining > 0 then
        a1.remaining = math.max(0, a1.remaining - a2)
        if a1.remaining > 0 then
            local v6 = 1 - a1.remaining / DINO_STYLE_upv_1.transitionSeconds
            for _, value_3 in ANIMATED_ROLES_upv_1 do
                a1:applyRole(value_3, (a1.startColors[value_3] or (a1.targetLadder[value_3])):Lerp(a1.targetLadder[value_3], (v6 * v6) * (3 - (2 * v6))))
            end
            if not (a1.snapped) and DINO_STYLE_upv_1.snapFraction <= v6 then
                for _, value_4 in SNAP_ROLES_upv_1 do
                    a1:applyRole(value_4, a1.targetLadder[value_4])
                end
                a1.snapped = true
            end
        else
            for _, value_5 in ANIMATED_ROLES_upv_1 do
                a1:applyRole(value_5, a1.targetLadder[value_5])
            end
            if not (a1.snapped) then
                for _, value_6 in SNAP_ROLES_upv_1 do
                    a1:applyRole(value_6, a1.targetLadder[value_6])
                end
                a1.snapped = true
            end
            return nil
        end
    else
        return nil
    end
end
u2.color = function(a1, a2)
    --[[
      name: color
      line: 115
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v7 = a1.currentColors[a2]
    if v7 == nil then
        v7 = u1
    end
    return v7
end
u2.isTransitioning = function(a1)
    --[[
      name: isTransitioning
      line: 124
    ]]
    return a1.remaining > 0
end
u2.progress = function(a1)
    --[[
      name: progress
      line: 127
      upvalues:
        DINO_STYLE_upv_1 (copy, index: 1)
    ]]
    if a1.remaining > 0 then
        return 1 - (a1.remaining / DINO_STYLE_upv_1.transitionSeconds)
    end
    return 1
end
u2.applyRole = function(a1, a2, a3)
    --[[
      name: applyRole
      line: 133
    ]]
    a1.currentColors[a2] = a3
    local v8 = a1.parts[a2]
    if v8 ~= nil then
        for _, value_7 in v8 do
            value_7.Color = a3
        end
    else
        return nil
    end
end
local tbl_4 = {}
tbl_4.TonePalette = u2
return tbl_4