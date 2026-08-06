-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local STICKMAN_HOOK_STYLE_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-style").STICKMAN_HOOK_STYLE
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(255, 216, 102)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 35
    ]]
    return "StickmanHookFx"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 40
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u3)
    return v2:constructor(...) or v2
end
u3.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 44
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u2 (copy, index: 3)
        STICKMAN_HOOK_STYLE_upv_1 (copy, index: 4)
        makeStagePart_upv_1 (copy, index: 5)
    ]]
    a1.shards = {}
    a1.originX = a3.X
    a1.originY = a3.Y
    a1.originZ = a3.Z
    a1.heroAnchor = makeSmoothPart_upv_1(a2)
    a1.heroAnchor.Transparency = 1
    a1.heroAnchor.Size = Vector3.new(1, 1, 1)
    a1.heroAnchor.CFrame = u1
    a1.catchBurst = a1:makeBurst(a1.heroAnchor, {lifetime = NumberRange.new(0.22, 0.4), speed = NumberRange.new(7, 15), size = NumberSequence.new(0.32, 0.05), color = ColorSequence.new(Color3.fromRGB(255, 255, 255))})
    a1.releaseBurst = a1:makeBurst(a1.heroAnchor, {lifetime = NumberRange.new(0.18, 0.34), speed = NumberRange.new(10, 22), size = NumberSequence.new(0.28, 0.04), color = ColorSequence.new(Color3.fromRGB(236, 240, 248), Color3.fromRGB(176, 196, 220))})
    a1.cleanSparkBurst = a1:makeBurst(a1.heroAnchor, {lifetime = NumberRange.new(0.3, 0.55), speed = NumberRange.new(9, 20), size = NumberSequence.new(0.34, 0.04), color = ColorSequence.new(u2)})
    a1.breakAnchorPart = makeSmoothPart_upv_1(a2)
    a1.breakAnchorPart.Transparency = 1
    a1.breakAnchorPart.Size = Vector3.new(1, 1, 1)
    a1.breakAnchorPart.CFrame = u1
    a1.breakBurst = a1:makeBurst(a1.breakAnchorPart, {lifetime = NumberRange.new(0.3, 0.55), speed = NumberRange.new(9, 18), size = NumberSequence.new(0.4, 0.08), color = ColorSequence.new(Color3.fromRGB(226, 132, 120), STICKMAN_HOOK_STYLE_upv_1.silk.dressing)})
    for _ = 0, 3 do
        local v3 = makeStagePart_upv_1(a2)
        v3.Color = STICKMAN_HOOK_STYLE_upv_1.lava.hot
        v3.Size = Vector3.new(0.5, 0.5, 0.5)
        v3.CFrame = u1
        table.insert(a1.shards, {part = v3})
    end
end
u3.catchPop = function(a1, a2, a3, a4)
    --[[
      name: catchPop
      line: 107
    ]]
    a1.heroAnchor.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ)
    a1.catchBurst.Color = ColorSequence.new(a4, Color3.fromRGB(255, 255, 255))
    a1.catchBurst:Emit(9)
end
u3.releaseSpray = function(a1, a2, a3, a4, a5)
    --[[
      name: releaseSpray
      line: 112
    ]]
    local v4 = math.atan2(a4, -a5)
    a1.heroAnchor.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ) * CFrame.Angles(0, 0, v4 + math.pi)
    a1.releaseBurst:Emit(7)
    a1.heroAnchor.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ)
end
u3.cleanSpark = function(a1, a2, a3)
    --[[
      name: cleanSpark
      line: 121
    ]]
    a1.heroAnchor.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ)
    a1.cleanSparkBurst:Emit(12)
end
u3.anchorBreak = function(a1, a2, a3)
    --[[
      name: anchorBreak
      line: 125
    ]]
    a1.breakAnchorPart.CFrame = CFrame.new(a1.originX + a2, a1.originY + a3, a1.originZ)
    a1.breakBurst:Emit(14)
    for n_1 = 0, #a1.shards - 1 do
        local v5 = a1.shards[n_1 + 1]
        local v6 = ((n_1 / 4) * math.pi) * 2 + 0.4
        v5.x = a2
        v5.y = a3
        v5.velocityX = math.cos(v6) * 26
        v5.velocityY = (math.sin(v6) * 26) + 8
        v5.spin = ((n_1 % 2 ~= 0) and -9) or 9
        v5.remaining = 0.45
    end
end
u3.update = function(a1, a2)
    --[[
      name: update
      line: 141
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_1 in a1.shards do
        if value_1.remaining <= 0 then
            continue
        end
        value_1.remaining = value_1.remaining - a2
        if value_1.remaining > 0 then
            value_1.velocityY = value_1.velocityY + (-110 * a2)
            value_1.x = value_1.x + (value_1.velocityX * a2)
            value_1.y = value_1.y + (value_1.velocityY * a2)
            value_1.part.CFrame = CFrame.new(a1.originX + value_1.x, a1.originY + value_1.y, a1.originZ) * CFrame.Angles(0, 0, value_1.spin * (0.45 - value_1.remaining))
        else
            value_1.part.CFrame = u1
        end
    end
end
u3.reset = function(a1)
    --[[
      name: reset
      line: 159
      upvalues:
        u1 (copy, index: 1)
    ]]
    for _, value_2 in a1.shards do
        value_2.remaining = 0
        value_2.part.CFrame = u1
    end
end
u3.makeBurst = function(a1, a2, a3)
    --[[
      name: makeBurst
      line: 165
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    local v7 = Instance.new("ParticleEmitter")
    v7.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v7.Rate = 0
    v7.Enabled = false
    v7.Lifetime = a3.lifetime
    v7.Speed = a3.speed
    v7.SpreadAngle = Vector2.new(a3.spread, a3.spread)
    v7.Size = a3.size
    v7.Color = a3.color
    v7.Transparency = NumberSequence.new(0.1, 1)
    v7.Acceleration = a3.acceleration
    v7.Rotation = NumberRange.new(0, 180)
    v7.RotSpeed = NumberRange.new(-120, 120)
    v7.LightEmission = 0
    v7.Parent = a2
    return v7
end
local tbl_3 = {}
tbl_3.StickmanHookFx = u3
return tbl_3