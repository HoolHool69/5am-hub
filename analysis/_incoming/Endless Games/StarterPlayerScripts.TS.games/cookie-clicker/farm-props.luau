-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local makeWedgePart_upv_1 = v1.makeWedgePart
local u1 = Color3.fromRGB(255, 214, 80)
local u2 = Color3.fromRGB(255, 148, 56)
local u3 = Color3.fromRGB(245, 242, 235)
local u4 = Color3.fromRGB(214, 60, 56)
local u5 = Color3.fromRGB(196, 156, 88)
local u6 = Color3.fromRGB(168, 128, 66)
local u7 = Color3.fromRGB(248, 244, 232)
local u8 = Color3.fromRGB(198, 84, 66)
local u9 = Color3.fromRGB(122, 84, 52)
local u10 = Color3.fromRGB(240, 236, 226)
local u11 = Color3.fromRGB(158, 162, 170)
local u12 = Color3.fromRGB(120, 124, 132)
local u13 = Color3.fromRGB(226, 226, 232)
local u14 = Color3.fromRGB(88, 132, 224)
local u15 = Color3.fromRGB(226, 228, 240)
local u16 = Color3.fromRGB(52, 50, 56)
local u17 = Color3.fromRGB(255, 202, 56)
local u18 = Color3.fromRGB(214, 156, 30)
local u19 = Color3.fromRGB(226, 228, 240)
local u20 = Color3.fromRGB(186, 190, 204)
local u21 = Color3.fromRGB(240, 240, 240)
local u22 = Color3.fromRGB(214, 92, 70)
local u23 = Color3.fromRGB(255, 158, 48)
local u24 = Color3.fromRGB(214, 236, 232)
local u25 = Color3.fromRGB(120, 200, 130)
local u26 = Color3.fromRGB(158, 86, 204)
local u27 = Color3.fromRGB(206, 148, 255)
local u28 = Color3.fromRGB(240, 236, 220)
local u29 = Color3.fromRGB(58, 50, 44)
local u30 = Color3.fromRGB(38, 30, 44)
local u31 = CFrame.Angles(0, 1.5707963267948966, 0)
local u32 = CFrame.Angles(0, -1.5707963267948966, 0)
local u33 = CFrame.Angles(0, 0, 0.7853981633974483)
local function block_1(a1, a2, a3, a4, a5)
    --[[
      name: block
      line: 83
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
    ]]
    local v2 = makeStagePart_upv_1(a1)
    v2.Size = a4
    v2.Color = a5
    v2.CFrame = CFrame.new(a2 + a3)
    return v2
end
local function plate_1(a1, a2, a3, a4, a5)
    --[[
      name: plate
      line: 93
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
    ]]
    local v3 = makeSmoothPart_upv_1(a1)
    v3.Size = a4
    v3.Color = a5
    v3.CFrame = CFrame.new(a2 + a3)
    return v3
end
local function blob_1(a1, a2, a3, a4, a5)
    --[[
      name: blob
      line: 103
      upvalues:
        makeEllipsoidPart_upv_1 (copy, index: 1)
    ]]
    local v4 = makeEllipsoidPart_upv_1(a1)
    v4.Size = a4
    v4.Color = a5
    v4.CFrame = CFrame.new(a2 + a3)
    return v4
end
local function wedge_1(a1, a2, a3, a4, a5, a6)
    --[[
      name: wedge
      line: 113
      upvalues:
        makeWedgePart_upv_1 (copy, index: 1)
    ]]
    local v5 = makeWedgePart_upv_1(a1)
    v5.Size = a4
    v5.Color = a5
    v5.CFrame = CFrame.new(a2 + a3) * a6
    return v5
end
local function beak_1(a1, a2, a3, a4)
    --[[
      name: beak
      line: 143
      upvalues:
        u2 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
        u33 (copy, index: 3)
    ]]
    local v6 = Vector3.new(a4, a4, a4 * 0.8)
    local v7 = makeSmoothPart_upv_1(a1)
    v7.Size = v6
    v7.Color = u2
    v7.CFrame = CFrame.new(a2 + a3)
    v7.CFrame = v7.CFrame * u33
    return v7
end
local function pitchedRoof_1(a1, a2, a3, a4, a5, a6)
    --[[
      name: pitchedRoof
      line: 149
      upvalues:
        u9 (copy, index: 1)
        u31 (copy, index: 2)
        makeWedgePart_upv_1 (copy, index: 3)
        u32 (copy, index: 4)
    ]]
    local v8 = Vector3.new(a4, a6, a5)
    local v9 = Vector3.new(-a5 / 2, a3, 0)
    local v10 = makeWedgePart_upv_1(a1)
    v10.Size = v8
    v10.Color = u9
    v10.CFrame = CFrame.new(a2 + v9) * u31
    local v11 = Vector3.new(a5 / 2, a3, 0)
    local v12 = makeWedgePart_upv_1(a1)
    v12.Size = v8
    v12.Color = u9
    v12.CFrame = CFrame.new(a2 + v11) * u32
end
local function dotEyes_upv_1(a1, a2, a3, a4, a5, a6, a7)
    --[[
      name: dotEyes
      line: 125
      upvalues:
        u30 (copy, index: 1)
        makeSmoothPart_upv_1 (copy, index: 2)
    ]]
    local v13 = nil
    local v14 = nil
    local v15 = nil
    for _, value_1 in {-1, 1} do
        v13 = a4 + Vector3.new(value_1 * a5, 0, a7)
        v14 = Vector3.new(a6, a6, a6 * 0.5)
        v15 = makeSmoothPart_upv_1(a1)
        v15.Size = v14
        v15.Color = u30
        v15.CFrame = CFrame.new(a3 + v13)
        table.insert(a2, v15)
    end
end
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 366
    ]]
    return "FarmPropIdle"
end
local u35 = setmetatable(tbl_1, tbl_2)
u35.__index = u35
u35.new = function(...)
    --[[
      name: new
      line: 371
      upvalues:
        u35 (ref, index: 1)
    ]]
    local v16 = setmetatable({}, u35)
    return v16:constructor(...) or v16
end
u35.constructor = function(a1)
    --[[
      name: constructor
      line: 375
    ]]
    a1.props = {}
    a1.cursor = 0
end
u35.add = function(a1, a2)
    --[[
      name: add
      line: 379
    ]]
    table.insert(a1.props, a2)
end
u35.clear = function(a1)
    --[[
      name: clear
      line: 384
    ]]
    table.clear(a1.props)
    a1.cursor = 0
end
u35.size = function(a1)
    --[[
      name: size
      line: 388
    ]]
    return #a1.props
end
local function u34(a1, a2)
    --[[
      name: step
      line: 391
      upvalues:
        u34 (ref, index: 1)
    ]]
    local v17 = #a1.props
    if v17 ~= 0 then
        local v18 = math.min(24, v17)
        local v19 = 0
        local v20 = false
        v20, v19 = v20, v19
        if v20 then
            v19 = v19 + 1
        else
            v20 = true
        end
        local v21 = nil
        if v19 < v18 then
            v21 = a1.props[a1.cursor + 1]
            a1.cursor = (a1.cursor + 1) % v17
            if v21 ~= nil then
                u34(v21, a2)
            end
            if v20 then
                v19 = v19 + 1
            else
                v20 = true
            end
        end
    else
        return nil
    end
end
u35.step = u34
u34 = function(a1, a2)
    --[[
      name: poseProp
      line: 425
    ]]
    local v22 = a2 + a1.phase
    local idle_1 = a1.idle
    local v23
    if idle_1 == "hop" then
        v23 = CFrame.new(0, math.max(math.sin(v22 * 2.6), 0) * 0.45, 0)
    elseif idle_1 == "peck" then
        local v24 = math.max(math.sin(v22 * 2.1), 0) ^ 3
        v23 = CFrame.new(v24 * 0.18, v24 * -0.55, 0) * CFrame.Angles(0, 0, -v24)
    elseif idle_1 == "jiggle" then
        v23 = CFrame.Angles(0, 0, math.sin(v22 * 5.5) * 0.13)
    elseif idle_1 == "bob" then
        v23 = CFrame.new(0, math.sin(v22 * 3.1) * 0.16, 0)
    elseif idle_1 == "spin" then
        v23 = CFrame.Angles(0, 0, v22 * 0.9)
    elseif idle_1 == "rise" then
        local v25 = v22 * 0.55 % 1
        local v26 = CFrame.new(v22 * 0.55 % 1 * 0.3, v22 * 0.55 % 1 * 1.4, 0)
        a1.moving[1].Transparency = 0.25 + (v25 * 0.7)
        v23 = v26
    elseif idle_1 ~= "flicker" then
        v23 = CFrame.Angles(0, 0, math.sin(v22 * 1.7) * 0.09)
    else
        v23 = CFrame.new(0, ((math.sin(v22 * 17) * 0.5) + (math.sin(v22 * 29) * 0.2)) * 0.12, 0)
    end
    local moving_1 = a1.moving
    local locals_1 = a1.locals
    for n_1 = 0, #moving_1 - 1 do
        moving_1[n_1 + 1].CFrame = a1.rest * v23 * locals_1[n_1 + 1]
    end
end
local tbl_3 = {}
tbl_3.buildProp = function(a1, a2, a3, a4)
    --[[
      name: buildProp
      line: 160
      upvalues:
        u1 (copy, index: 1)
        makeEllipsoidPart_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u33 (copy, index: 5)
        dotEyes_upv_1 (copy, index: 6)
        u3 (copy, index: 7)
        u31 (copy, index: 8)
        makeWedgePart_upv_1 (copy, index: 9)
        u4 (copy, index: 10)
        u5 (copy, index: 11)
        u6 (copy, index: 12)
        makeStagePart_upv_1 (copy, index: 13)
        u7 (copy, index: 14)
        u8 (copy, index: 15)
        u9 (copy, index: 16)
        u32 (copy, index: 17)
        u10 (copy, index: 18)
        u11 (copy, index: 19)
        u12 (copy, index: 20)
        u13 (copy, index: 21)
        u14 (copy, index: 22)
        u15 (copy, index: 23)
        u16 (copy, index: 24)
        u17 (copy, index: 25)
        u18 (copy, index: 26)
        u19 (copy, index: 27)
        u20 (copy, index: 28)
        u21 (copy, index: 29)
        u22 (copy, index: 30)
        u23 (copy, index: 31)
        u24 (copy, index: 32)
        u25 (copy, index: 33)
        u26 (copy, index: 34)
        u27 (copy, index: 35)
        u28 (copy, index: 36)
        u29 (copy, index: 37)
    ]]
    local v27 = Instance.new("Model")
    local tbl_4 = {}
    local v28
    if a1 == 0 then
        local v29 = makeEllipsoidPart_upv_1(v27)
        v29.Size = Vector3.new(1.5, 1.399999976158142, 1.2000000476837158)
        v29.Color = u1
        v29.CFrame = CFrame.new(a3 + Vector3.new(0, 0.75, 0))
        table.insert(tbl_4, v29)
        local v30 = makeSmoothPart_upv_1(v27)
        v30.Size = Vector3.new(0.3199999928474426, 0.3199999928474426, 0.25600001215934753)
        v30.Color = u2
        v30.CFrame = CFrame.new(a3 + Vector3.new(0, 0.7200000286102295, 0.5799999833106995))
        v30.CFrame = v30.CFrame * u33
        table.insert(tbl_4, v30)
        local v31 = makeSmoothPart_upv_1(v27)
        v31.Size = Vector3.new(0.18000000715255737, 0.4000000059604645, 0.18000000715255737)
        v31.Color = u1
        v31.CFrame = CFrame.new(a3 + Vector3.new(0, 1.5, -0.10000000149011612))
        table.insert(tbl_4, v31)
        dotEyes_upv_1(v27, tbl_4, a3, Vector3.new(0, 1.0199999809265137, 0), 0.32, 0.19, 0.55)
        v28 = "hop"
    elseif a1 == 1 then
        local v32 = makeEllipsoidPart_upv_1(v27)
        v32.Size = Vector3.new(1.899999976158142, 1.5, 1.399999976158142)
        v32.Color = u3
        v32.CFrame = CFrame.new(a3 + Vector3.new(-0.10000000149011612, 0.8500000238418579, 0))
        local v33 = makeWedgePart_upv_1(v27)
        v33.Size = Vector3.new(0.699999988079071, 0.699999988079071, 0.6000000238418579)
        v33.Color = u3
        v33.CFrame = CFrame.new(a3 + Vector3.new(-1.25, 1.2000000476837158, 0)) * u31
        local v34 = makeEllipsoidPart_upv_1(v27)
        v34.Size = Vector3.new(0.8999999761581421, 0.8999999761581421, 0.8500000238418579)
        v34.Color = u3
        v34.CFrame = CFrame.new(a3 + Vector3.new(0.6000000238418579, 1.600000023841858, 0))
        table.insert(tbl_4, v34)
        local v35 = makeSmoothPart_upv_1(v27)
        v35.Size = Vector3.new(0.5, 0.25999999046325684, 0.20000000298023224)
        v35.Color = u4
        v35.CFrame = CFrame.new(a3 + Vector3.new(0.6000000238418579, 2.069999933242798, 0))
        table.insert(tbl_4, v35)
        local v36 = makeSmoothPart_upv_1(v27)
        v36.Size = Vector3.new(0.18000000715255737, 0.25999999046325684, 0.14000000059604645)
        v36.Color = u4
        v36.CFrame = CFrame.new(a3 + Vector3.new(0.6000000238418579, 1.2599999904632568, 0.30000001192092896))
        table.insert(tbl_4, v36)
        local v37 = makeSmoothPart_upv_1(v27)
        v37.Size = Vector3.new(0.2800000011920929, 0.2800000011920929, 0.2240000069141388)
        v37.Color = u2
        v37.CFrame = CFrame.new(a3 + Vector3.new(0.6000000238418579, 1.559999942779541, 0.4399999976158142))
        v37.CFrame = v37.CFrame * u33
        table.insert(tbl_4, v37)
        dotEyes_upv_1(v27, tbl_4, a3, Vector3.new(0.6000000238418579, 1.7999999523162842, 0), 0.24, 0.17, 0.42)
        v28 = "peck"
    elseif a1 == 2 then
        local v38 = nil
        for n_2 = 0, 5 do
            local v39 = (n_2 / 6) * math.pi * 2
            local v40 = Vector3.new(math.cos(v39) * 0.72, 0.3, math.sin(v39) * 0.42)
            if n_2 % 2 ~= 0 then
                v38 = u6
            else
                v38 = u5
            end
            local v41 = makeStagePart_upv_1(v27)
            v41.Size = Vector3.new(1.100000023841858, 0.4000000059604645, 0.4000000059604645)
            v41.Color = v38
            v41.CFrame = CFrame.new(a3 + v40)
            v41.CFrame = v41.CFrame * CFrame.Angles(0, -v39, 0.17453292519943295)
        end
        local v42 = makeEllipsoidPart_upv_1(v27)
        v42.Size = Vector3.new(0.699999988079071, 0.8999999761581421, 0.6499999761581421)
        v42.Color = u7
        v42.CFrame = CFrame.new(a3 + Vector3.new(-0.3199999928474426, 0.7400000095367432, 0.10000000149011612))
        local n_2 = makeEllipsoidPart_upv_1(v27)
        n_2.Size = Vector3.new(0.699999988079071, 0.8999999761581421, 0.6499999761581421)
        n_2.Color = u7
        n_2.CFrame = CFrame.new(a3 + Vector3.new(0.3199999928474426, 0.7799999713897705, -0.10000000149011612))
        table.insert(tbl_4, n_2)
        v28 = "jiggle"
    elseif a1 == 3 then
        local v43 = makeStagePart_upv_1(v27)
        v43.Size = Vector3.new(2.200000047683716, 1.7000000476837158, 1.600000023841858)
        v43.Color = u8
        v43.CFrame = CFrame.new(a3 + Vector3.new(0, 0.8500000238418579, 0))
        local v44 = makeWedgePart_upv_1(v27)
        v44.Size = Vector3.new(1.899999976158142, 0.8999999761581421, 1.2999999523162842)
        v44.Color = u9
        v44.CFrame = CFrame.new(a3 + Vector3.new(-0.6499999761581421, 2.049999952316284, 0)) * u31
        local v45 = makeWedgePart_upv_1(v27)
        v45.Size = Vector3.new(1.899999976158142, 0.8999999761581421, 1.2999999523162842)
        v45.Color = u9
        v45.CFrame = CFrame.new(a3 + Vector3.new(0.6499999761581421, 2.049999952316284, 0)) * u32
        local v46 = makeSmoothPart_upv_1(v27)
        v46.Size = Vector3.new(0.699999988079071, 0.949999988079071, 0.11999999731779099)
        v46.Color = u9
        v46.CFrame = CFrame.new(a3 + Vector3.new(-0.5, 0.5, 0.8199999928474426))
        local v47 = makeSmoothPart_upv_1(v27)
        v47.Size = Vector3.new(0.5, 0.5, 0.11999999731779099)
        v47.Color = u10
        v47.CFrame = CFrame.new(a3 + Vector3.new(0.6000000238418579, 1.0499999523162842, 0.8199999928474426))
        local v48 = makeEllipsoidPart_upv_1(v27)
        v48.Size = Vector3.new(0.5, 0.5, 0.44999998807907104)
        v48.Color = u1
        v48.CFrame = CFrame.new(a3 + Vector3.new(-0.5, 0.6200000047683716, 0.949999988079071))
        table.insert(tbl_4, v48)
        v28 = "bob"
    elseif a1 == 4 then
        local v49 = makeStagePart_upv_1(v27)
        v49.Size = Vector3.new(2.4000000953674316, 1.2999999523162842, 1.600000023841858)
        v49.Color = u11
        v49.CFrame = CFrame.new(a3 + Vector3.new(0, 0.6499999761581421, 0))
        local v50 = makeStagePart_upv_1(v27)
        v50.Size = Vector3.new(1.399999976158142, 0.8999999761581421, 1.399999976158142)
        v50.Color = u11
        v50.CFrame = CFrame.new(a3 + Vector3.new(-0.4000000059604645, 1.75, 0))
        local v51 = makeStagePart_upv_1(v27)
        v51.Size = Vector3.new(0.44999998807907104, 1.100000023841858, 0.44999998807907104)
        v51.Color = u12
        v51.CFrame = CFrame.new(a3 + Vector3.new(0.7799999713897705, 1.850000023841858, 0))
        local v52 = makeSmoothPart_upv_1(v27)
        v52.Size = Vector3.new(2.0999999046325684, 0.1599999964237213, 0.11999999731779099)
        v52.Color = u12
        v52.CFrame = CFrame.new(a3 + Vector3.new(0, 1.340000033378601, 0.8199999928474426))
        local v53 = makeEllipsoidPart_upv_1(v27)
        v53.Size = Vector3.new(0.6000000238418579, 0.550000011920929, 0.550000011920929)
        v53.Color = u13
        v53.CFrame = CFrame.new(a3 + Vector3.new(0.7799999713897705, 2.5999999046325684, 0))
        v53.Transparency = 0.25
        table.insert(tbl_4, v53)
        v28 = "rise"
    elseif a1 == 5 then
        local v54 = makeStagePart_upv_1(v27)
        v54.Size = Vector3.new(2.4000000953674316, 0.949999988079071, 1.2999999523162842)
        v54.Color = u14
        v54.CFrame = CFrame.new(a3 + Vector3.new(0, 0.949999988079071, 0))
        table.insert(tbl_4, v54)
        local v55 = makeStagePart_upv_1(v27)
        v55.Size = Vector3.new(0.8999999761581421, 0.75, 1.2000000476837158)
        v55.Color = u15
        v55.CFrame = CFrame.new(a3 + Vector3.new(0.949999988079071, 1.75, 0))
        table.insert(tbl_4, v55)
        local v56 = makeSmoothPart_upv_1(v27)
        v56.Size = Vector3.new(0.6000000238418579, 0.41999998688697815, 0.10000000149011612)
        v56.Color = u12
        v56.CFrame = CFrame.new(a3 + Vector3.new(0.949999988079071, 1.7999999523162842, 0.6200000047683716))
        table.insert(tbl_4, v56)
        local v57 = makeSmoothPart_upv_1(v27)
        v57.Size = Vector3.new(0.6000000238418579, 0.75, 0.5)
        v57.Color = u7
        v57.CFrame = CFrame.new(a3 + Vector3.new(-0.5, 1.600000023841858, 0.5))
        table.insert(tbl_4, v57)
        local v58 = nil
        local v59 = nil
        for _, value_2 in {-0.8, 0.8} do
            v58 = Vector3.new(value_2, 0.35, 0.7)
            v59 = makeEllipsoidPart_upv_1(v27)
            v59.Size = Vector3.new(0.699999988079071, 0.699999988079071, 0.4000000059604645)
            v59.Color = u16
            v59.CFrame = CFrame.new(a3 + v58)
        end
        v28 = "bob"
    elseif a1 == 6 then
        local v60 = makeStagePart_upv_1(v27)
        v60.Size = Vector3.new(0.3499999940395355, 1.2999999523162842, 0.3499999940395355)
        v60.Color = u9
        v60.CFrame = CFrame.new(a3 + Vector3.new(0, 0.6499999761581421, 0))
        local v61 = makeStagePart_upv_1(v27)
        v61.Size = Vector3.new(1.899999976158142, 0.25, 0.5)
        v61.Color = u9
        v61.CFrame = CFrame.new(a3 + Vector3.new(0, 1.399999976158142, 0))
        local v62 = makeEllipsoidPart_upv_1(v27)
        v62.Size = Vector3.new(1.2999999523162842, 1.0499999523162842, 1)
        v62.Color = u17
        v62.CFrame = CFrame.new(a3 + Vector3.new(0, 2.049999952316284, 0))
        table.insert(tbl_4, v62)
        local v63 = makeSmoothPart_upv_1(v27)
        v63.Size = Vector3.new(0.4000000059604645, 0.2199999988079071, 0.18000000715255737)
        v63.Color = u18
        v63.CFrame = CFrame.new(a3 + Vector3.new(0, 2.619999885559082, 0))
        table.insert(tbl_4, v63)
        local v64 = makeSmoothPart_upv_1(v27)
        v64.Size = Vector3.new(0.25999999046325684, 0.25999999046325684, 0.20800000429153442)
        v64.Color = u2
        v64.CFrame = CFrame.new(a3 + Vector3.new(0, 2.0199999809265137, 0.41999998688697815))
        v64.CFrame = v64.CFrame * u33
        table.insert(tbl_4, v64)
        dotEyes_upv_1(v27, tbl_4, a3, Vector3.new(0, 2.259999990463257, 0), 0.25, 0.16, 0.42)
        v28 = "sway"
    elseif a1 == 7 then
        local v65 = makeEllipsoidPart_upv_1(v27)
        v65.Size = Vector3.new(2.200000047683716, 1.600000023841858, 1.7999999523162842)
        v65.Color = u19
        v65.CFrame = CFrame.new(a3 + Vector3.new(0, 0.6000000238418579, 0))
        table.insert(tbl_4, v65)
        local v66 = nil
        for _, value_3 in {Vector3.new(-0.550000011920929, 0.949999988079071, 0.699999988079071), Vector3.new(0.5, 0.699999988079071, 0.75), Vector3.new(0.05000000074505806, 1.149999976158142, 0.6000000238418579)} do
            v66 = makeEllipsoidPart_upv_1(v27)
            v66.Size = Vector3.new(0.41999998688697815, 0.30000001192092896, 0.20000000298023224)
            v66.Color = u20
            v66.CFrame = CFrame.new(a3 + value_3)
            table.insert(tbl_4, v66)
        end
        local v67 = makeStagePart_upv_1(v27)
        v67.Size = Vector3.new(0.11999999731779099, 1.100000023841858, 0.11999999731779099)
        v67.Color = u12
        v67.CFrame = CFrame.new(a3 + Vector3.new(0.8500000238418579, 1.5, 0))
        local v68 = makeSmoothPart_upv_1(v27)
        v68.Size = Vector3.new(0.5, 0.3400000035762787, 0.10000000149011612)
        v68.Color = u4
        v68.CFrame = CFrame.new(a3 + Vector3.new(1.1200000047683716, 1.8799999952316284, 0))
        v28 = "sway"
    elseif a1 == 8 then
        local v69 = makeStagePart_upv_1(v27)
        v69.Size = Vector3.new(0.949999988079071, 1.7000000476837158, 0.949999988079071)
        v69.Color = u21
        v69.CFrame = CFrame.new(a3 + Vector3.new(0, 1.25, 0))
        local v70 = makeWedgePart_upv_1(v27)
        v70.Size = Vector3.new(0.949999988079071, 0.800000011920929, 0.47999998927116394)
        v70.Color = u21
        v70.CFrame = CFrame.new(a3 + Vector3.new(-0.23999999463558197, 2.5, 0)) * u31
        local v71 = makeWedgePart_upv_1(v27)
        v71.Size = Vector3.new(0.949999988079071, 0.800000011920929, 0.47999998927116394)
        v71.Color = u21
        v71.CFrame = CFrame.new(a3 + Vector3.new(0.23999999463558197, 2.5, 0)) * u32
        local v72 = makeSmoothPart_upv_1(v27)
        v72.Size = Vector3.new(1.0199999809265137, 0.30000001192092896, 1.0199999809265137)
        v72.Color = u22
        v72.CFrame = CFrame.new(a3 + Vector3.new(0, 1.7999999523162842, 0))
        local v73 = makeWedgePart_upv_1(v27)
        v73.Size = Vector3.new(0.23999999463558197, 0.6499999761581421, 0.6000000238418579)
        v73.Color = u22
        v73.CFrame = CFrame.new(a3 + Vector3.new(-0.6200000047683716, 0.6000000238418579, 0)) * u31
        local v74 = makeWedgePart_upv_1(v27)
        v74.Size = Vector3.new(0.23999999463558197, 0.6499999761581421, 0.6000000238418579)
        v74.Color = u22
        v74.CFrame = CFrame.new(a3 + Vector3.new(0.6200000047683716, 0.6000000238418579, 0)) * u32
        local v75 = makeEllipsoidPart_upv_1(v27)
        v75.Size = Vector3.new(0.6000000238418579, 0.8500000238418579, 0.6000000238418579)
        v75.Color = u23
        v75.CFrame = CFrame.new(a3 + Vector3.new(0, 0.1599999964237213, 0))
        table.insert(tbl_4, v75)
        v28 = "flicker"
    elseif a1 ~= 9 then
        if a1 ~= 10 then
            local v76 = makeStagePart_upv_1(v27)
            v76.Size = Vector3.new(2.200000047683716, 1.899999976158142, 1.600000023841858)
            v76.Color = u9
            v76.CFrame = CFrame.new(a3 + Vector3.new(0, 0.949999988079071, 0))
            local v77 = makeWedgePart_upv_1(v27)
            v77.Size = Vector3.new(1.899999976158142, 0.8999999761581421, 1.2999999523162842)
            v77.Color = u9
            v77.CFrame = CFrame.new(a3 + Vector3.new(-0.6499999761581421, 2.25, 0)) * u31
            local v78 = makeWedgePart_upv_1(v27)
            v78.Size = Vector3.new(1.899999976158142, 0.8999999761581421, 1.2999999523162842)
            v78.Color = u9
            v78.CFrame = CFrame.new(a3 + Vector3.new(0.6499999761581421, 2.25, 0)) * u32
            local v79 = makeEllipsoidPart_upv_1(v27)
            v79.Size = Vector3.new(1.2000000476837158, 1.2000000476837158, 0.20000000298023224)
            v79.Color = u28
            v79.CFrame = CFrame.new(a3 + Vector3.new(0, 1.149999976158142, 0.8199999928474426))
            local v80 = makeSmoothPart_upv_1(v27)
            v80.Size = Vector3.new(0.11999999731779099, 0.8500000238418579, 0.10000000149011612)
            v80.Color = u29
            v80.CFrame = CFrame.new(a3 + Vector3.new(0, 1.149999976158142, 0.9399999976158142))
            table.insert(tbl_4, v80)
        else
            local v81 = makeStagePart_upv_1(v27)
            v81.Size = Vector3.new(1.600000023841858, 0.23999999463558197, 0.699999988079071)
            v81.Color = u9
            v81.CFrame = CFrame.new(a3 + Vector3.new(0, 0.11999999731779099, 0))
            v27 = nil
            for n_3 = 0, 7 do
                local v82 = (n_3 / 8) * math.pi * 2
                local v83 = Vector3.new(math.cos(v82) * 1.05, (math.sin(v82) * 1.05) + 1.3, 0)
                local v84
                if n_3 % 2 ~= 0 then
                    v84 = Color3.fromRGB(126, 68, 166)
                else
                    v84 = u26
                end
                local v85 = makeSmoothPart_upv_1(v27)
                v85.Size = Vector3.new(0.5, 0.5, 0.4000000059604645)
                v85.Color = v84
                v85.CFrame = CFrame.new(a3 + v83)
                v85.CFrame = v85.CFrame * CFrame.Angles(0, 0, v82)
            end
            local v86 = makeSmoothPart_upv_1(v27)
            v86.Size = Vector3.new(1, 1, 0.4000000059604645)
            v86.Color = u27
            v86.CFrame = CFrame.new(a3 + Vector3.new(0, 1.2999999523162842, -0.20000000298023224))
            v86.Material = Enum.Material.Neon
            v86.CFrame = v86.CFrame * CFrame.Angles(0, 0, 0.7853981633974483)
            table.insert(tbl_4, v86)
        end
        v28 = "spin"
    else
        local v87 = makeStagePart_upv_1(v27)
        v87.Size = Vector3.new(1.5, 0.23999999463558197, 1.100000023841858)
        v87.Color = u12
        v87.CFrame = CFrame.new(a3 + Vector3.new(0, 0.11999999731779099, 0))
        local v88 = makeEllipsoidPart_upv_1(v27)
        v88.Size = Vector3.new(1.5, 1.399999976158142, 1.2999999523162842)
        v88.Color = u24
        v88.CFrame = CFrame.new(a3 + Vector3.new(0, 1, 0))
        v88.Transparency = 0.3
        local v89 = makeSmoothPart_upv_1(v27)
        v89.Size = Vector3.new(0.4000000059604645, 0.699999988079071, 0.4000000059604645)
        v89.Color = u24
        v89.CFrame = CFrame.new(a3 + Vector3.new(0, 1.9500000476837158, 0))
        v89.Transparency = 0.3
        local v90 = makeEllipsoidPart_upv_1(v27)
        v90.Size = Vector3.new(1.149999976158142, 0.699999988079071, 1)
        v90.Color = u25
        v90.CFrame = CFrame.new(a3 + Vector3.new(0, 0.7200000286102295, 0))
        local v91 = makeEllipsoidPart_upv_1(v27)
        v91.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896)
        v91.Color = u21
        v91.CFrame = CFrame.new(a3 + Vector3.new(0.10000000149011612, 1.0499999523162842, 0.3499999940395355))
        v91.Transparency = 0.35
        table.insert(tbl_4, v91)
        v28 = "rise"
    end
    v27.Parent = a2
    local CFrame_1 = tbl_4[1].CFrame
    local v92 = CFrame_1:Inverse()
    local tbl_5 = {}
    for _, value_4 in tbl_4 do
        table.insert(tbl_5, v92 * value_4.CFrame)
    end
    local tbl_6 = {}
    tbl_6.model = v27
    tbl_6.moving = tbl_4
    tbl_6.locals = tbl_5
    tbl_6.rest = CFrame_1
    tbl_6.idle = v28
    tbl_6.phase = a4
    return tbl_6
end
tbl_3.FarmPropIdle = u35
return tbl_3