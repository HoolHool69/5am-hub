-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local v2 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-style")
local cellPick_upv_1 = v2.cellPick
local layerCell_upv_1 = v2.layerCell
local layerDrawX_upv_1 = v2.layerDrawX
local STICKMAN_HOOK_STYLE_upv_1 = v2.STICKMAN_HOOK_STYLE
local crust_upv_1 = STICKMAN_HOOK_STYLE_upv_1.crust
local u1 = CFrame.new(0, -1000, 0)
local u2 = CFrame.Angles(0, 1.5707963267948966, 0)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 56
    ]]
    return "StickmanHookLava"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 61
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u3)
    return v3:constructor(...) or v3
end
u3.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 65
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        STICKMAN_HOOK_STYLE_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        crust_upv_1 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 6)
    ]]
    a1.backChunks = {}
    a1.backCells = {}
    a1.frontChunks = {}
    a1.frontCells = {}
    a1.lastFloorY = math.huge
    a1.splashRemaining = 0
    a1.splashX = 0
    a1.splashY = 0
    a1.originX = a3.X
    a1.originY = a3.Y
    a1.originZ = a3.Z
    a1.rule = makeSmoothPart_upv_1(a2)
    a1.rule.Material = Enum.Material.Neon
    a1.rule.Color = STICKMAN_HOOK_STYLE_upv_1.lava.rule
    a1.rule.Transparency = 0.3
    a1.rule.Size = Vector3.new(240, 0.550000011920929, 4.400000095367432)
    a1.rule.CFrame = u1
    a1.bright = makeSmoothPart_upv_1(a2)
    a1.bright.Color = STICKMAN_HOOK_STYLE_upv_1.lava.bright
    a1.bright.Size = Vector3.new(240, 28, 4)
    a1.bright.CFrame = u1
    a1.deep = makeSmoothPart_upv_1(a2)
    a1.deep.Color = STICKMAN_HOOK_STYLE_upv_1.lava.deep
    a1.deep.Size = Vector3.new(240, 240, 4)
    a1.deep.CFrame = u1
    for _ = 0, crust_upv_1.backSlots - 1 do
        local v4 = makeStagePart_upv_1(a2)
        v4.Color = STICKMAN_HOOK_STYLE_upv_1.lava.crustRock
        v4.Size = Vector3.new(crust_upv_1.backWidths[1], 4.2, 2)
        v4.CFrame = u1
        table.insert(a1.backChunks, v4)
        table.insert(a1.backCells, math.huge)
    end
    for _ = 0, crust_upv_1.frontSlots - 1 do
        local v5 = makeStagePart_upv_1(a2)
        v5.Color = STICKMAN_HOOK_STYLE_upv_1.lava.crustDark
        v5.Size = Vector3.new(crust_upv_1.frontWidths[1], 2.6, 1.2)
        v5.CFrame = u1
        table.insert(a1.frontChunks, v5)
        table.insert(a1.frontCells, math.huge)
    end
    a1.emberBed = makeSmoothPart_upv_1(a2)
    a1.emberBed.Transparency = 1
    a1.emberBed.Size = Vector3.new(150, 1, 1)
    a1.emberBed.CFrame = u1
    a1.embers = Instance.new("ParticleEmitter")
    a1.embers.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.embers.Rate = 26
    a1.embers.Lifetime = NumberRange.new(1.1, 2.2)
    a1.embers.Speed = NumberRange.new(5, 11)
    a1.embers.EmissionDirection = Enum.NormalId.Top
    a1.embers.SpreadAngle = Vector2.new(18, 18)
    a1.embers.Acceleration = Vector3.new(2, 6, 0)
    a1.embers.Size = NumberSequence.new(0.34, 0.06)
    a1.embers.Color = ColorSequence.new(STICKMAN_HOOK_STYLE_upv_1.lava.emberHot, STICKMAN_HOOK_STYLE_upv_1.lava.emberCool)
    a1.embers.Transparency = NumberSequence.new(0.15, 1)
    a1.embers.Rotation = NumberRange.new(0, 180)
    a1.embers.RotSpeed = NumberRange.new(-90, 90)
    a1.embers.LightEmission = 0
    a1.embers.Parent = a1.emberBed
    a1.bubbles = Instance.new("ParticleEmitter")
    a1.bubbles.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.bubbles.Rate = 3
    a1.bubbles.Lifetime = NumberRange.new(0.5, 0.9)
    a1.bubbles.Speed = NumberRange.new(2, 5)
    a1.bubbles.EmissionDirection = Enum.NormalId.Top
    a1.bubbles.SpreadAngle = Vector2.new(10, 10)
    a1.bubbles.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 1.3), NumberSequenceKeypoint.new(1, 0)})
    a1.bubbles.Color = ColorSequence.new(STICKMAN_HOOK_STYLE_upv_1.lava.bright)
    a1.bubbles.Transparency = NumberSequence.new(0.25, 0.6)
    a1.bubbles.LightEmission = 0
    a1.bubbles.Parent = a1.emberBed
    a1.splashAnchor = makeSmoothPart_upv_1(a2)
    a1.splashAnchor.Transparency = 1
    a1.splashAnchor.Size = Vector3.new(1, 1, 1)
    a1.splashAnchor.CFrame = u1
    a1.splashBurst = Instance.new("ParticleEmitter")
    a1.splashBurst.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    a1.splashBurst.Rate = 0
    a1.splashBurst.Enabled = false
    a1.splashBurst.Lifetime = NumberRange.new(0.35, 0.75)
    a1.splashBurst.Speed = NumberRange.new(14, 30)
    a1.splashBurst.SpreadAngle = Vector2.new(70, 70)
    a1.splashBurst.Acceleration = Vector3.new(0, -70, 0)
    a1.splashBurst.Size = NumberSequence.new(0.5, 0.1)
    a1.splashBurst.Color = ColorSequence.new(STICKMAN_HOOK_STYLE_upv_1.lava.emberHot, STICKMAN_HOOK_STYLE_upv_1.lava.deep)
    a1.splashBurst.Transparency = NumberSequence.new(0.1, 1)
    a1.splashBurst.LightEmission = 0
    a1.splashBurst.Parent = a1.splashAnchor
    a1.splashRing = makeSmoothPart_upv_1(a2)
    a1.splashRing.Shape = Enum.PartType.Cylinder
    a1.splashRing.Color = STICKMAN_HOOK_STYLE_upv_1.lava.hot
    a1.splashRing.Size = Vector3.new(0.20000000298023224, 1, 1)
    a1.splashRing.CFrame = u1
    a1.splashRing.Transparency = 1
end
u3.invalidate = function(a1)
    --[[
      name: invalidate
      line: 179
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.lastFloorY = math.huge
    for n_1 = 0, #a1.backCells - 1 do
        a1.backCells[n_1 + 1] = math.huge
    end
    for n_2 = 0, #a1.frontCells - 1 do
        a1.frontCells[n_2 + 1] = math.huge
    end
    a1.splashRemaining = 0
    a1.splashRing.Transparency = 1
    a1.splashRing.CFrame = u1
end
u3.draw = function(a1, a2, a3, a4)
    --[[
      name: draw
      line: 191
    ]]
    local v6 = a1.originY + a3
    a1.rule.CFrame = CFrame.new(a1.originX + a2, v6, a1.originZ + 0.4)
    a1.bright.CFrame = CFrame.new(a1.originX + a2, (v6 - 14) - 0.4, a1.originZ)
    a1.deep.CFrame = CFrame.new(a1.originX + a2, ((v6 - 28) - 120) - 0.4, a1.originZ)
    a1.emberBed.CFrame = CFrame.new(a1.originX + a2, v6 + 0.6, a1.originZ - 2.2)
    a1:drawCrust(a2, a3)
    a1:drawSplash(a4)
end
u3.splash = function(a1, a2, a3)
    --[[
      name: splash
      line: 200
    ]]
    a1.splashX = a2
    a1.splashY = a3
    a1.splashRemaining = 0.35
    a1.splashAnchor.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ)
    a1.splashBurst:Emit(22)
end
u3.drawCrust = function(a1, a2, a3)
    --[[
      name: drawCrust
      line: 207
      upvalues:
        crust_upv_1 (copy, index: 1)
        layerCell_upv_1 (copy, index: 2)
        cellPick_upv_1 (copy, index: 3)
        layerDrawX_upv_1 (copy, index: 4)
    ]]
    local v7 = math.abs(a3 - a1.lastFloorY) > 0.02
    if v7 then
        a1.lastFloorY = a3
    end
    local v8 = a1.originY + a3
    for n_3 = 0, crust_upv_1.backSlots - 1 do
        local v9 = layerCell_upv_1(a2, 1, crust_upv_1.backSpacing, crust_upv_1.backSlots, n_3)
        if v7 then
            local v10
            v10 = a1.backChunks[n_3 + 1]
            if a1.backCells[n_3 + 1] ~= v9 then
                a1.backCells[n_3 + 1] = v9
                v10.Size = Vector3.new(crust_upv_1.backWidths[cellPick_upv_1(v9, 0, 21, #crust_upv_1.backWidths) + 1], 4.2, 2)
            end
            local v11 = crust_upv_1.backRises[cellPick_upv_1(v9, 0, 22, #crust_upv_1.backRises) + 1]
            v10.CFrame = CFrame.new(a1.originX + layerDrawX_upv_1(v9, a2, 1, crust_upv_1.backSpacing), (v8 + v11) - 2.1, a1.originZ + crust_upv_1.backZ)
        else
            local v10
            if a1.backCells[n_3 + 1] == v9 then
                continue
            end
            v10 = a1.backChunks[n_3 + 1]
            if a1.backCells[n_3 + 1] ~= v9 then
                a1.backCells[n_3 + 1] = v9
                v10.Size = Vector3.new(crust_upv_1.backWidths[cellPick_upv_1(v9, 0, 21, #crust_upv_1.backWidths) + 1], 4.2, 2)
            end
            local v11 = crust_upv_1.backRises[cellPick_upv_1(v9, 0, 22, #crust_upv_1.backRises) + 1]
            v10.CFrame = CFrame.new(a1.originX + layerDrawX_upv_1(v9, a2, 1, crust_upv_1.backSpacing), (v8 + v11) - 2.1, a1.originZ + crust_upv_1.backZ)
        end
    end
    for n_4 = 0, crust_upv_1.frontSlots - 1 do
        local v12 = layerCell_upv_1(a2, 1, crust_upv_1.frontSpacing, crust_upv_1.frontSlots, n_4)
        if not v7 then
            local v13
            if a1.frontCells[n_4 + 1] == v12 then
                continue
            end
        end
        local v13
        v13 = a1.frontChunks[n_4 + 1]
        if a1.frontCells[n_4 + 1] ~= v12 then
            a1.frontCells[n_4 + 1] = v12
            v13.Size = Vector3.new(crust_upv_1.frontWidths[cellPick_upv_1(v12, 0, 23, #crust_upv_1.frontWidths) + 1], 2.6, 1.2)
        end
        v13.CFrame = CFrame.new(a1.originX + layerDrawX_upv_1(v12, a2, 1, crust_upv_1.frontSpacing), (v8 - crust_upv_1.frontDrop) - 1.3, a1.originZ + crust_upv_1.frontZ)
    end
end
u3.drawSplash = function(a1, a2)
    --[[
      name: drawSplash
      line: 244
      upvalues:
        u1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    if a1.splashRemaining > 0 then
        a1.splashRemaining = a1.splashRemaining - a2
        if a1.splashRemaining > 0 then
            local v14 = 1 - a1.splashRemaining / 0.35
            local v15 = 1 + 8 * v14
            a1.splashRing.Size = Vector3.new(0.2, v15, v15)
            a1.splashRing.Transparency = 0.15 + (0.85 * v14)
            a1.splashRing.CFrame = CFrame.new(a1.originX + a1.splashX, a1.originY + a1.splashY, a1.originZ + 3.6) * u2
        else
            a1.splashRing.Transparency = 1
            a1.splashRing.CFrame = u1
            return nil
        end
    else
        return nil
    end
end
local tbl_3 = {}
tbl_3.StickmanHookLava = u3
return tbl_3