-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local makeSmoothPart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local TRAFFIC_RUSH_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-config").TRAFFIC_RUSH_CONFIG
local TRAFFIC_LANES_upv_1 = RuntimeLib_1.import(script, script.Parent, "traffic-rush-sim").TRAFFIC_LANES
local warning_upv_1 = TRAFFIC_RUSH_CONFIG_upv_1.emergency.warning
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(196, 34, 34)
local u3 = Color3.fromRGB(38, 84, 198)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 28
    ]]
    return "LaneWarning"
end
local u4 = setmetatable(tbl_1, tbl_2)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 33
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u4)
    return v1:constructor(...) or v1
end
u4.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 37
      upvalues:
        TRAFFIC_RUSH_CONFIG_upv_1 (copy, index: 1)
        warning_upv_1 (copy, index: 2)
        TRAFFIC_LANES_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
        u1 (copy, index: 6)
    ]]
    a1.rungs = {}
    a1.rungCFrames = {}
    a1.rungSizes = {}
    a1.tickCFrames = {}
    a1.tickSizes = {}
    a1.aimedLane = -1
    a1.lastBank = -1
    a1.lastStep = -1
    local v2 = TRAFFIC_RUSH_CONFIG_upv_1.laneWidth * warning_upv_1.laneWidthFactor
    local v3 = a3.Y + warning_upv_1.lift
    local v4, _, v5 = nil, nil, nil
    local tbl_3 = nil
    local value_1 = nil
    local v6 = nil
    local rungSizes_1 = nil
    local v7 = nil
    local X_1 = nil
    local Z_1 = nil
    local tickSizes_1 = nil
    local v8 = nil
    for v12, value_1 in TRAFFIC_LANES_upv_1 do
        tbl_3 = {}
        v4 = value_1
        for v4 = 0, warning_upv_1.rungCount - 1 do
            local v9 = -v4.dir * (warning_upv_1.firstRungFromCenter + (v4 * warning_upv_1.spacingStuds))
            local X_2 = a3.X
            if v4.axis ~= "x" then
                v6 = v4.lateral
            else
                v6 = v9
            end
            local v10 = X_2 + v6
            local Z_2 = a3.Z
            if v4.axis ~= "z" then
                v5 = v4.lateral
            else
                v5 = v9
            end
            table.insert(tbl_3, (CFrame.new(v10, v3, Z_2 + v5)))
        end
        table.insert(a1.rungCFrames, tbl_3)
        rungSizes_1 = a1.rungSizes
        if v4.axis ~= "z" then
            v4 = Vector3.new(warning_upv_1.rungDepthStuds, warning_upv_1.thickness, v2)
        else
            v4 = Vector3.new(v2, warning_upv_1.thickness, warning_upv_1.rungDepthStuds)
        end
        table.insert(rungSizes_1, v4)
        v7 = -value_1.dir * (warning_upv_1.firstRungFromCenter - 2.2)
        X_1 = a3.X
        if value_1.axis ~= "x" then
            v6 = value_1.lateral
        else
            v6 = v7
        end
        Z_1 = a3.Z
        if value_1.axis ~= "z" then
            v5 = value_1.lateral
        else
            v5 = v7
        end
        table.insert(a1.tickCFrames, (CFrame.new(X_1 + v6, v3, Z_1 + v5)))
        tickSizes_1 = a1.tickSizes
        if value_1.axis ~= "z" then
            v8 = Vector3.new(0.5, warning_upv_1.thickness, warning_upv_1.neonTickStuds)
        else
            v8 = Vector3.new(warning_upv_1.neonTickStuds, warning_upv_1.thickness, 0.5)
        end
        table.insert(tickSizes_1, v8)
    end
    for v13 = 0, warning_upv_1.rungCount - 1 do
        local v11 = makeSmoothPart_upv_1(a2)
        v11.Color = u2
        v11.Transparency = 1
        v11.Size = a1.rungSizes[1]
        v11.CFrame = u1
        table.insert(a1.rungs, v11)
    end
    a1.tick = makeSmoothPart_upv_1(a2)
    a1.tick.Material = Enum.Material.Neon
    a1.tick.Color = u2
    a1.tick.Transparency = 1
    a1.tick.Size = a1.tickSizes[1]
    a1.tick.CFrame = u1
end
u4.aim = function(a1, a2)
    --[[
      name: aim
      line: 89
    ]]
    if a2 ~= a1.aimedLane then
        a1.aimedLane = a2
        local v12 = a1.rungCFrames[a2 + 1]
        local v13 = a1.rungSizes[a2 + 1]
        for n_1 = 0, #a1.rungs - 1 do
            a1.rungs[n_1 + 1].Size = v13
            a1.rungs[n_1 + 1].CFrame = v12[n_1 + 1]
        end
        a1.tick.Size = a1.tickSizes[a2 + 1]
        a1.tick.CFrame = a1.tickCFrames[a2 + 1]
    else
        return nil
    end
end
u4.update = function(a1, a2, a3)
    --[[
      name: update
      line: 103
      upvalues:
        warning_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u3 (copy, index: 3)
    ]]
    if a1.aimedLane >= 0 then
        local v14 = ((a2 >= 0.5) and 1) or 0
        local v15 = math.floor((math.clamp(a3, 0, 1) * warning_upv_1.intensitySteps) + 0.5)
        if v14 == a1.lastBank and v15 == a1.lastStep then
            return nil
        end
        local v16 = v15 ~= a1.lastStep
        a1.lastBank = v14
        a1.lastStep = v15
        local v17 = 1 - (v15 / warning_upv_1.intensitySteps) * (1 - warning_upv_1.minTransparency)
        local v18 = nil
        for n_2 = 0, #a1.rungs - 1 do
            local v19 = a1.rungs[n_2 + 1]
            if (n_2 + v14) % 2 ~= 0 then
                v18 = u3
            else
                v18 = u2
            end
            v19.Color = v18
            if v16 then
                v19.Transparency = v17
            end
        end
        local tick_1 = a1.tick
        local v20
        if v14 ~= 0 then
            v20 = u3
        else
            v20 = u2
        end
        tick_1.Color = v20
        if v16 then
            a1.tick.Transparency = v17
        end
    else
        return nil
    end
end
u4.park = function(a1)
    --[[
      name: park
      line: 128
      upvalues:
        u1 (copy, index: 1)
    ]]
    if a1.aimedLane >= 0 then
        a1.aimedLane = -1
        a1.lastBank = -1
        a1.lastStep = -1
        for _, value_2 in a1.rungs do
            value_2.Transparency = 1
            value_2.CFrame = u1
        end
        a1.tick.Transparency = 1
        a1.tick.CFrame = u1
    else
        return nil
    end
end
local tbl_4 = {}
tbl_4.LaneWarning = u4
return tbl_4