-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local TweenService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local makeSmoothPart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local TOWER_BUILDER_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "tower-builder-config").TOWER_BUILDER_CONFIG
local u1 = Color3.fromRGB(38, 48, 72)
local u2 = Color3.fromRGB(168, 118, 48)
local tbl_upv_1 = {Vector3.new(-2.1, 0, (TOWER_BUILDER_CONFIG_upv_1.blockDepth / 2) + 0.09), Vector3.new(0, 0, (TOWER_BUILDER_CONFIG_upv_1.blockDepth / 2) + 0.09), Vector3.new(2.1, 0, (TOWER_BUILDER_CONFIG_upv_1.blockDepth / 2) + 0.09)}
local u3 = Color3.fromRGB(255, 205, 148)
local tbl_upv_2 = {Color3.fromRGB(226, 88, 76), Color3.fromRGB(78, 182, 166), Color3.fromRGB(255, 196, 72), Color3.fromRGB(150, 116, 220), Color3.fromRGB(112, 190, 92)}
local u4 = CFrame.new(0, 0.66, 0)
local u5 = TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local u6 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 70
    ]]
    return "WindowStrip"
end
local u7 = setmetatable(tbl_3, tbl_4)
u7.__index = u7
u7.new = function(...)
    --[[
      name: new
      line: 75
      upvalues:
        u7 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u7)
    return v1:constructor(...) or v1
end
local function windowOffsetCFrames_upv_1(a1)
    --[[
      name: windowOffsetCFrames
      line: 29
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v2 = table.create(#tbl_upv_1)
    for key_1, value_1 in tbl_upv_1 do
        v2[key_1] = CFrame.new(value_1.X, value_1.Y, value_1.Z * a1)
    end
    return v2
end
u7.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 79
      upvalues:
        windowOffsetCFrames_upv_1 (copy, index: 1)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    if a5 == nil then
        a5 = 1
    end
    a1.windows = {}
    a1.generations = {}
    a1.parkedCFrame = CFrame.new(a3 + Vector3.new(0, -600, 0))
    a1.slotOffsets = windowOffsetCFrames_upv_1(a5)
    local v3 = 0
    local v4 = false
    if v4 then
        v3 = v3 + 1
    else
        v4 = true
    end
    if v3 >= a4 then
        return
    end
    table.insert(a1.generations, 0)
    for _ = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
        local v5 = makeSmoothPart_upv_1(a2)
        v5.Size = Vector3.new(1.149999976158142, 1.0499999523162842, 0.18000000715255737)
        v5.Color = u1
        v5.CFrame = a1.parkedCFrame
        table.insert(a1.windows, v5)
    end
    if v4 then
        v3 = v3 + 1
    else
        v4 = true
    end
end
u7.assign = function(a1, a2, a3, a4)
    --[[
      name: assign
      line: 114
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local generations_1 = a1.generations
    local v6 = a2 + 1
    generations_1[v6] = generations_1[v6] + 1
    local v7 = nil
    for n_1 = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
        local v8 = a1.windows[((a2 * TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock) + n_1) + 1]
        if a4 then
            v7 = Enum.Material.Neon
        else
            v7 = Enum.Material.Plastic
        end
        v8.Material = v7
        if a4 then
            v7 = u2
        else
            v7 = u1
        end
        v8.Color = v7
        v8.CFrame = a3 * a1.slotOffsets[n_1 + 1]
    end
end
u7.pose = function(a1, a2, a3)
    --[[
      name: pose
      line: 125
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_2 = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
        a1.windows[((a2 * TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock) + n_2) + 1].CFrame = a3 * a1.slotOffsets[n_2 + 1]
    end
end
u7.lightUp = function(a1, a2)
    --[[
      name: lightUp
      line: 132
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local u8 = a1.generations[a2 + 1]
    for n_3 = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
        local u9 = a1.windows[((a2 * TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock) + n_3) + 1]
        task.delay(
            (n_3 + 1) * 0.15,
            function()
                --[[
                  line: 136
                  upvalues:
                    a1 (copy, index: 1)
                    a2 (copy, index: 2)
                    u8 (copy, index: 3)
                    u9 (copy, index: 4)
                    u2 (copy, index: 5)
                ]]
                if a1.generations[a2 + 1] == u8 then
                    u9.Material = Enum.Material.Neon
                    u9.Color = u2
                else
                    return nil
                end
            end
        )
    end
end
u7.release = function(a1, a2)
    --[[
      name: release
      line: 145
      upvalues:
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 1)
    ]]
    local generations_2 = a1.generations
    local v9 = a2 + 1
    generations_2[v9] = generations_2[v9] + 1
    for n_4 = 0, TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock - 1 do
        a1.windows[((a2 * TOWER_BUILDER_CONFIG_upv_1.windowsPerBlock) + n_4) + 1].CFrame = a1.parkedCFrame
    end
end
u7.parkAll = function(a1)
    --[[
      name: parkAll
      line: 151
    ]]
    for n_5 = 0, #a1.generations - 1 do
        a1:release(n_5)
    end
end
local tbl_5 = {}
local tbl_6 = {}
tbl_6.__tostring = function()
    --[[
      name: __tostring
      line: 167
    ]]
    return "ResidentPool"
end
local u10 = setmetatable(tbl_5, tbl_6)
u10.__index = u10
u10.new = function(...)
    --[[
      name: new
      line: 172
      upvalues:
        u10 (ref, index: 1)
    ]]
    local v10 = setmetatable({}, u10)
    return v10:constructor(...) or v10
end
u10.constructor = function(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 176
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u3 (copy, index: 2)
    ]]
    if a5 == nil then
        a5 = 1
    end
    a1.rigs = {}
    a1.index = 0
    a1.random = Random.new()
    a1.zSign = a5
    a1.parkedCFrame = CFrame.new(a3 + Vector3.new(0, -620, 0))
    local v11 = 0
    local v12 = false
    while true do
        if v12 then
            v11 = v11 + 1
        else
            v12 = true
        end
        if v11 >= a4 then
            break
        end
        local v13 = makeSmoothPart_upv_1(a2)
        v13.Size = Vector3.new(0.6600000262260437, 0.8500000238418579, 0.41999998688697815)
        v13.CFrame = a1.parkedCFrame
        local v14 = makeSmoothPart_upv_1(a2)
        v14.Size = Vector3.new(0.41999998688697815, 0.41999998688697815, 0.41999998688697815)
        v14.Color = u3
        v14.CFrame = a1.parkedCFrame
        table.insert(a1.rigs, {body = v13, head = v14})
    end
end
u10.flyIn = function(a1, a2, a3)
    --[[
      name: flyIn
      line: 216
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        TOWER_BUILDER_CONFIG_upv_1 (copy, index: 3)
        u4 (copy, index: 4)
        TweenService_upv_1 (copy, index: 5)
        u5 (copy, index: 6)
        u6 (copy, index: 7)
    ]]
    local v15 = 0
    local v16 = false
    if v16 then
        v15 = v15 + 1
    else
        v16 = true
    end
    local v17, v18 = nil, nil
    if v15 < a3 then
        local u11 = a1.rigs[a1.index + 1]
        a1.index = (a1.index + 1) % #a1.rigs
        u11.generation = u11.generation + 1
        local generation_upv_1 = u11.generation
        v17 = u11.bodyTween
        if v17 ~= nil then
            v17:Cancel()
        end
        v18 = u11.headTween
        if v18 ~= nil then
            v18:Cancel()
        end
        u11.body.Color = tbl_upv_2[a1.random:NextInteger(0, #tbl_upv_2 - 1) + 1]
        u11.body.Transparency = 0
        u11.head.Transparency = 0
        local v19 = ((a1.random:NextNumber() >= 0.5) and 1) or -1
        local v20 = a2 * CFrame.new(v19 * a1.random:NextNumber(9, 13), a1.random:NextNumber(3.5, 6), 1.5 * a1.zSign)
        local v21 = a2 * CFrame.new(tbl_upv_1[(v15 % #tbl_upv_1) + 1].X + a1.random:NextNumber(-0.4, 0.4), -0.1, ((TOWER_BUILDER_CONFIG_upv_1.blockDepth / 2) + 0.55) * a1.zSign)
        u11.body.CFrame = v20
        u11.head.CFrame = v20 * u4
        u11.bodyTween = TweenService_upv_1:Create(u11.body, u5, {CFrame = v21})
        u11.headTween = TweenService_upv_1:Create(u11.head, u5, {CFrame = v21 * u4})
        u11.bodyTween:Play()
        u11.headTween:Play()
        task.delay(
            0.7,
            function()
                --[[
                  line: 262
                  upvalues:
                    u11 (copy, index: 1)
                    generation_upv_1 (copy, index: 2)
                    TweenService_upv_1 (copy, index: 3)
                    u6 (copy, index: 4)
                ]]
                if u11.generation == generation_upv_1 then
                    TweenService_upv_1:Create(u11.body, u6, {}):Play()
                    TweenService_upv_1:Create(u11.head, u6, {}):Play()
                else
                    return nil
                end
            end
        )
        task.delay(
            1.05,
            function()
                --[[
                  line: 273
                  upvalues:
                    u11 (copy, index: 1)
                    generation_upv_1 (copy, index: 2)
                    a1 (copy, index: 3)
                ]]
                if u11.generation == generation_upv_1 then
                    u11.body.CFrame = a1.parkedCFrame
                    u11.head.CFrame = a1.parkedCFrame
                else
                    return nil
                end
            end
        )
        if v16 then
            v15 = v15 + 1
        else
            v16 = true
        end
    end
end
u10.parkAll = function(a1)
    --[[
      name: parkAll
      line: 283
    ]]
    local v22 = nil
    local v23 = nil
    for _, value_2 in a1.rigs do
        value_2.generation = value_2.generation + 1
        v22 = value_2.bodyTween
        if v22 ~= nil then
            v22:Cancel()
        end
        v23 = value_2.headTween
        if v23 ~= nil then
            v23:Cancel()
        end
        value_2.body.CFrame = a1.parkedCFrame
        value_2.head.CFrame = a1.parkedCFrame
    end
end
local tbl_7 = {}
tbl_7.windowOffsetCFrames = windowOffsetCFrames_upv_1
tbl_7.WINDOW_DARK = u1
tbl_7.WINDOW_LIT = u2
tbl_7.WINDOW_LOCAL_OFFSETS = tbl_upv_1
tbl_7.WindowStrip = u7
tbl_7.ResidentPool = u10
return tbl_7