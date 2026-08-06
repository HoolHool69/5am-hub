-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent, "interpolate").lerp
local MATCH_SNAPSHOT_INTERVAL_SECONDS_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "match-constants").MATCH_SNAPSHOT_INTERVAL_SECONDS
local u1 = MATCH_SNAPSHOT_INTERVAL_SECONDS_1 * 1.5
local u2 = MATCH_SNAPSHOT_INTERVAL_SECONDS_1 * 1.5
local u3 = Color3.fromRGB(255, 255, 255)
local u4 = Color3.fromRGB(120, 124, 134)
local function ghostColor_1(a1)
    --[[
      name: ghostColor
      line: 44
    ]]
    return Color3.fromHSV(((a1 * 37) % 359) / 359, 0.65, 1)
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 58
    ]]
    return "GhostPool"
end
local u5 = setmetatable(tbl_1, tbl_2)
u5.__index = u5
u5.new = function(...)
    --[[
      name: new
      line: 63
      upvalues:
        u5 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u5)
    return v1:constructor(...) or v1
end
u5.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 67
    ]]
    a1.container = a2
    a1.options = a3
    a1.ghosts = {}
end
u5.show = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: show
      line: 72
      upvalues:
        u2 (copy, index: 1)
    ]]
    local v2 = a1.ghosts[a2]
    if v2 == nil then
        v2 = a1:createGhost(a2, a3)
    end
    v2.facing = a6
    local v3 = a4 - v2.target
    if v3.Magnitude <= 0.001 then
        if u2 < os.clock() - v2.targetChangedAt then
            v2.velocity = Vector3.new(0, 0, 0)
        end
    else
        local v4 = os.clock()
        local v5 = v4 - v2.targetChangedAt
        if v3.Magnitude <= 40 and v2.initialized then
            if v5 <= 0.02 or v5 >= 1 then
                v2.velocity = Vector3.new(0, 0, 0)
            else
                v2.velocity = (a4 - v2.target) / v5
            end
        else
            v2.velocity = Vector3.new(0, 0, 0)
        end
        v2.target = a4
        v2.targetChangedAt = v4
    end
    v2.shownThisFrame = true
    if v2.aliveLook ~= a5 then
        v2.aliveLook = a5
        a1:applyLook(v2, a2, a5)
        local label_1 = v2.label
        local v6
        if a5 then
            v6 = a3
        else
            v6 = ("%* (out)"):format(a3)
        end
        label_1.Text = v6
    end
end
u5.step = function(a1, a2)
    --[[
      name: step
      line: 116
      upvalues:
        u1 (copy, index: 1)
        lerp_upv_1 (copy, index: 2)
    ]]
    local v7 = a1.options.followRate
    if v7 == nil then
        v7 = 14
    end
    local v8 = math.min(a2 * v7, 1)
    local v9 = os.clock()
    for _, value_1 in a1.ghosts do
        if value_1.shownThisFrame then
            value_1.shownThisFrame = false
            local v10 = value_1.target + value_1.velocity * math.min(v9 - value_1.targetChangedAt, u1)
            if not (value_1.initialized) then
                value_1.initialized = true
                value_1.current = v10
                value_1.body.pose(value_1.current, value_1.velocity, a2, value_1.facing)
                continue
            end
            if (value_1.current - v10).Magnitude <= 40 then
                value_1.current = Vector3.new(lerp_upv_1(value_1.current.X, v10.X, v8), lerp_upv_1(value_1.current.Y, v10.Y, v8), lerp_upv_1(value_1.current.Z, v10.Z, v8))
            else
                value_1.initialized = true
                value_1.current = v10
            end
            value_1.body.pose(value_1.current, value_1.velocity, a2, value_1.facing)
        elseif value_1.initialized then
            value_1.initialized = false
            value_1.body.pose(Vector3.new(0, -2000, 0), Vector3.new(0, 0, 0), 0)
        end
    end
end
u5.hideAll = function(a1)
    --[[
      name: hideAll
      line: 146
    ]]
    for _, value_2 in a1.ghosts do
        value_2.body.pose(Vector3.new(0, -2000, 0), Vector3.new(0, 0, 0), 0)
        value_2.shownThisFrame = false
        value_2.initialized = false
    end
end
u5.destroy = function(a1)
    --[[
      name: destroy
      line: 153
    ]]
    for _, value_3 in a1.ghosts do
        value_3.body.destroy()
    end
    table.clear(a1.ghosts)
end
u5.createGhost = function(a1, a2, a3)
    --[[
      name: createGhost
      line: 159
      upvalues:
        u3 (copy, index: 1)
    ]]
    local createBody_1 = a1.options.createBody
    if createBody_1 ~= nil then
        createBody_1 = createBody_1(a2)
    end
    local v11
    if createBody_1 ~= nil then
        v11 = createBody_1
    else
        v11 = a1:createPrimitiveBody()
    end
    local tbl_upv_3 = {}
    local function v12(a4)
        --[[
          line: 172
          upvalues:
            tbl_upv_3 (copy, index: 1)
        ]]
        if not (a4:IsA("ParticleEmitter")) and not (a4:IsA("Trail")) and not (a4:IsA("Beam")) and not (a4:IsA("PointLight")) and not (a4:IsA("SpotLight")) and not (a4:IsA("Sound")) and not (a4:IsA("BillboardGui")) then
            if a4:IsA("BasePart") then
                a4.Anchored = true
                a4.CanCollide = false
                a4.CanQuery = false
                a4.CanTouch = false
                a4.CastShadow = false
                table.insert(tbl_upv_3, {part = a4, baseColor = a4.Color, baseTransparency = a4.Transparency})
            end
            return
        end
        a4:Destroy()
        return nil
    end
    v12(v11.root)
    for _, value_4 in v11.root:GetDescendants() do
        v12(value_4)
    end
    local v13 = Instance.new("BillboardGui")
    v13.Size = UDim2.fromOffset(120, 18)
    v13.StudsOffsetWorldSpace = Vector3.new(0, (a1.options.size.Y / 2) + 1.6, 0)
    v13.AlwaysOnTop = true
    v13.Parent = v11.anchor
    local v14 = Instance.new("TextLabel")
    v14.BackgroundTransparency = 1
    v14.Size = UDim2.fromScale(1, 1)
    v14.Font = Enum.Font.GothamBold
    v14.Text = a3
    v14.TextColor3 = u3
    v14.TextStrokeTransparency = 0.4
    v14.TextSize = 13
    v14.Parent = v13
    local tbl_4 = {}
    tbl_4.body = v11
    tbl_4.label = v14
    tbl_4.parts = tbl_upv_3
    tbl_4.targetChangedAt = os.clock()
    a1.ghosts[a2] = tbl_4
    return tbl_4
end
u5.applyLook = function(a1, a2, a3, a4)
    --[[
      name: applyLook
      line: 225
      upvalues:
        u4 (copy, index: 1)
    ]]
    local v15
    if a4 then
        v15 = Color3.fromHSV(((a3 * 37) % 359) / 359, 0.65, 1)
    else
        v15 = u4
    end
    for _, value_5 in a2.parts do
        value_5.part.Color = value_5.baseColor:Lerp(v15, 0.55)
        value_5.part.Transparency = math.max(value_5.baseTransparency, 0.45)
    end
end
u5.createPrimitiveBody = function(a1)
    --[[
      name: createPrimitiveBody
      line: 232
    ]]
    local u6 = Instance.new("Part")
    u6.Name = "Ghost"
    u6.Shape = a1.options.shape or (Enum.PartType.Block)
    u6.Size = a1.options.size
    u6.Material = Enum.Material.Neon
    u6.Anchored = true
    u6.CanCollide = false
    u6.CFrame = CFrame.new(Vector3.new(0, -2000, 0))
    u6.Parent = a1.container
    local u7 = (a1.options.shape or (Enum.PartType.Block)) == Enum.PartType.Ball
    local u8 = math.max(a1.options.size.Y / 2, 0.1)
    local identity_upv_1 = CFrame.identity
    local tbl_5 = {}
    tbl_5.root = u6
    tbl_5.anchor = u6
    tbl_5.pose = function(a2, a3, a4)
        --[[
          name: pose
          line: 249
          upvalues:
            u7 (copy, index: 1)
            u8 (copy, index: 2)
            identity_upv_1 (ref,  index: 3)
            u6 (copy, index: 4)
        ]]
        if u7 then
            local v16 = nil
            if a4 > 0 then
                local v17 = Vector3.new(a3.X, 0, a3.Z)
                v16 = v17.Magnitude
                if v16 > 0.05 then
                    identity_upv_1 = CFrame.fromAxisAngle(Vector3.new(v17.Z, 0, -v17.X).Unit, (v16 * a4) / u8) * identity_upv_1
                end
                u6.CFrame = CFrame.new(a2) * identity_upv_1
                return nil
            end
        end
        u6.CFrame = CFrame.new(a2)
    end
    tbl_5.destroy = function()
        --[[
          name: destroy
          line: 266
          upvalues:
            u6 (copy, index: 1)
        ]]
        return u6:Destroy()
    end
    return tbl_5
end
local tbl_6 = {}
tbl_6.GhostPool = u5
return tbl_6