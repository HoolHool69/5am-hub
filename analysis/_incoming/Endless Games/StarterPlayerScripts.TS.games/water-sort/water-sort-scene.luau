-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory")
local makeFrontalBackdrop_upv_1 = v1.makeFrontalBackdrop
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(18, 16, 21)
local u3 = Color3.fromRGB(76, 74, 82)
local u4 = Color3.fromRGB(64, 62, 70)
local u5 = Color3.fromRGB(84, 60, 38)
local u6 = Color3.fromRGB(58, 56, 64)
local u7 = Color3.fromRGB(44, 42, 50)
local u8 = Color3.fromRGB(50, 48, 56)
local u9 = Color3.fromRGB(106, 74, 44)
local u10 = Color3.fromRGB(82, 56, 36)
local u11 = Color3.fromRGB(90, 62, 40)
local u12 = Color3.fromRGB(78, 54, 36)
local u13 = Color3.fromRGB(168, 132, 72)
local u14 = Color3.fromRGB(46, 44, 52)
local u15 = Color3.fromRGB(192, 176, 148)
local u16 = Color3.fromRGB(74, 88, 56)
local u17 = Color3.fromRGB(214, 226, 224)
local u18 = Color3.fromRGB(96, 88, 82)
local u19 = Color3.fromRGB(126, 200, 56)
local tbl_upv_1 = {Color3.fromRGB(118, 74, 72), Color3.fromRGB(84, 104, 78), Color3.fromRGB(88, 82, 118), Color3.fromRGB(124, 106, 70), Color3.fromRGB(90, 108, 114)}
local u20 = Color3.fromRGB(255, 168, 64)
local u21 = Color3.fromRGB(202, 188, 160)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 65
    ]]
    return "WaterSortScene"
end
local u22 = setmetatable(tbl_2, tbl_3)
u22.__index = u22
u22.new = function(...)
    --[[
      name: new
      line: 70
      upvalues:
        u22 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u22)
    return v2:constructor(...) or v2
end
u22.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 74
      upvalues:
        makeFrontalBackdrop_upv_1 (copy, index: 1)
        u2 (copy, index: 2)
        makeStagePart_upv_1 (copy, index: 3)
        u3 (copy, index: 4)
        u4 (copy, index: 5)
        u5 (copy, index: 6)
        u6 (copy, index: 7)
        makeSmoothPart_upv_1 (copy, index: 8)
        u7 (copy, index: 9)
        u8 (copy, index: 10)
        u12 (copy, index: 11)
        u1 (copy, index: 12)
        u13 (copy, index: 13)
        u14 (copy, index: 14)
        u19 (copy, index: 15)
        u17 (copy, index: 16)
        u9 (copy, index: 17)
        u10 (copy, index: 18)
    ]]
    a1.counterSlabs = {}
    a1.counterFaces = {}
    a1.counterBrackets = {}
    a1.signPips = {}
    a1.flaskBodies = {}
    a1.flaskNecks = {}
    local origin_1 = a3.origin
    a1.originX = origin_1.X
    a1.originY = origin_1.Y
    a1.originZ = origin_1.Z
    makeFrontalBackdrop_upv_1(a3, u2, Enum.Material.SmoothPlastic)
    local v3 = makeStagePart_upv_1(a2)
    v3.Color = u3
    v3.Size = Vector3.new(200, 160, 1)
    v3.CFrame = CFrame.new(a1.originX, a1.originY, a1.originZ - 10)
    for n_1 = 0, 7 do
        local v4 = ((n_1 >= 4) and 1) or -1
        local v5 = makeStagePart_upv_1(a2)
        v5.Color = u4
        v5.Size = Vector3.new(3.4000000953674316, 160, 0.699999988079071)
        v5.CFrame = CFrame.new(a1.originX + (v4 * (((n_1 % 4) * 25) + 12.5)), a1.originY, a1.originZ - 9.1)
    end
    local v6 = makeStagePart_upv_1(a2)
    v6.Color = u5
    v6.Size = Vector3.new(200, 2.799999952316284, 0.699999988079071)
    v6.CFrame = CFrame.new(a1.originX, a1.originY + 16.5, a1.originZ - 9)
    local v7 = makeStagePart_upv_1(a2)
    v7.Color = u6
    v7.Size = Vector3.new(200, 6, 0.8999999761581421)
    v7.CFrame = CFrame.new(a1.originX, a1.originY - 16, a1.originZ - 9.35)
    local v8 = makeSmoothPart_upv_1(a2)
    v8.Color = u7
    v8.Size = Vector3.new(200, 1.399999976158142, 0.800000011920929)
    v8.CFrame = CFrame.new(a1.originX, a1.originY - 19.4, a1.originZ - 9.2)
    local v9 = makeStagePart_upv_1(a2)
    v9.Color = u8
    v9.Size = Vector3.new(200, 64, 0.8999999761581421)
    v9.CFrame = CFrame.new(a1.originX, a1.originY - 52, a1.originZ - 8.8)
    a1:buildSideCabinets(a2)
    a1.signPanel = makeStagePart_upv_1(a2)
    a1.signPanel.Color = u12
    a1.signPanel.Size = Vector3.new(17, 5.199999809265137, 0.800000011920929)
    a1.signPanel.CFrame = u1
    for _ = 0, 3 do
        local v10 = makeSmoothPart_upv_1(a2)
        v10.Color = u13
        v10.Size = Vector3.new(0.5, 0.5, 0.30000001192092896)
        v10.CFrame = u1
        table.insert(a1.signPips, v10)
    end
    local v11 = makeSmoothPart_upv_1(a2)
    v11.Color = u14
    v11.Size = Vector3.new(0.3499999940395355, 4, 0.3499999940395355)
    v11.CFrame = u1
    table.insert(a1.signPips, v11)
    local v12 = makeSmoothPart_upv_1(a2)
    v12.Color = u14
    v12.Size = Vector3.new(0.3499999940395355, 4, 0.3499999940395355)
    v12.CFrame = u1
    table.insert(a1.signPips, v12)
    a1.signAnchor = makeSmoothPart_upv_1(a2)
    a1.signAnchor.Transparency = 1
    a1.signAnchor.Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224)
    a1.signAnchor.CFrame = u1
    for _ = 0, 2 do
        local v13 = makeSmoothPart_upv_1(a2)
        v13.Color = u19
        v13.Size = Vector3.new(1.0499999523162842, 1.350000023841858, 0.699999988079071)
        v13.CFrame = u1
        table.insert(a1.flaskBodies, v13)
        local v14 = makeSmoothPart_upv_1(a2)
        v14.Color = u17
        v14.Size = Vector3.new(0.4000000059604645, 0.550000011920929, 0.4000000059604645)
        v14.CFrame = u1
        table.insert(a1.flaskNecks, v14)
    end
    for _ = 0, 1 do
        local v15 = makeStagePart_upv_1(a2)
        v15.Color = u9
        v15.Size = Vector3.new(40, 1.600000023841858, 5)
        v15.CFrame = u1
        table.insert(a1.counterSlabs, v15)
        local v16 = makeSmoothPart_upv_1(a2)
        v16.Color = u10
        v16.Size = Vector3.new(40, 1.100000023841858, 0.6000000238418579)
        v16.CFrame = u1
        table.insert(a1.counterFaces, v16)
        local v17 = makeSmoothPart_upv_1(a2)
        v17.Color = u7
        v17.Size = Vector3.new(1.2000000476837158, 2.5999999046325684, 3.4000000953674316)
        v17.CFrame = u1
        table.insert(a1.counterBrackets, v17)
        local v18 = makeSmoothPart_upv_1(a2)
        v18.Color = u7
        v18.Size = Vector3.new(1.2000000476837158, 2.5999999046325684, 3.4000000953674316)
        v18.CFrame = u1
        table.insert(a1.counterBrackets, v18)
    end
end
u22.layout = function(a1, a2, a3, a4, a5)
    --[[
      name: layout
      line: 187
      upvalues:
        u1 (copy, index: 1)
    ]]
    for n_2 = 0, 1 do
        local v19 = a1.counterSlabs[n_2 + 1]
        local v20 = a1.counterFaces[n_2 + 1]
        local v21
        v21 = a2[n_2 + 1]
        local v22, v23
        if v21 == nil then
            v19.CFrame = u1
            v20.CFrame = u1
            a1.counterBrackets[(n_2 * 2) + 1].CFrame = u1
            a1.counterBrackets[(n_2 * 2) + 2].CFrame = u1
            continue
        end
        v22 = a4 + 6
        v23 = a1.originY + v21 - a3
        v19.Size = Vector3.new(v22, 1.6, 5)
        v19.CFrame = CFrame.new(a1.originX, v23 - 0.8, a1.originZ - 0.5)
        v20.Size = Vector3.new(v22, 1.1, 0.6)
        v20.CFrame = CFrame.new(a1.originX, v23 - 0.75, a1.originZ + 1.7)
        for n_3 = 0, 1 do
            a1.counterBrackets[((n_2 * 2) + n_3) + 1].CFrame = CFrame.new(a1.originX + (((((n_3 ~= 0) and 1) or -1) * (v22 - 6)) / 2), v23 - 2.9, a1.originZ - 0.5)
        end
    end
    local v24 = a1.originY + a5
    a1.signPanel.CFrame = CFrame.new(a1.originX, v24, a1.originZ - 2)
    for n_4 = 0, 3 do
        local v20 = ((n_4 % 2 ~= 0) and 1) or -1
        a1.signPips[n_4 + 1].CFrame = CFrame.new(a1.originX + (v20 * 7.9), v24 + ((((n_4 >= 2) and -1) or 1) * 2), a1.originZ - 1.5)
    end
    for n_5 = 0, 1 do
        a1.signPips[(n_5 + 4) + 1].CFrame = CFrame.new(a1.originX + ((((n_5 ~= 0) and 1) or -1) * 6.5), v24 + 4.4, a1.originZ - 2.1)
    end
    a1.signAnchor.CFrame = CFrame.new(a1.originX + 2.8, v24, a1.originZ - 1.4)
    for n_6 = 0, 2 do
        local v25 = a1.originX - 7 + n_6 * 1.9
        a1.flaskBodies[n_6 + 1].CFrame = CFrame.new(v25, v24 - 0.35, a1.originZ - 1.45)
        a1.flaskNecks[n_6 + 1].CFrame = CFrame.new(v25, v24 + 0.6, a1.originZ - 1.45)
    end
end
u22.setLives = function(a1, a2)
    --[[
      name: setLives
      line: 229
      upvalues:
        u19 (copy, index: 1)
        u18 (copy, index: 2)
    ]]
    local v26 = nil
    for n_7 = 0, 2 do
        local v27 = n_7 < a2
        local v28 = a1.flaskBodies[n_7 + 1]
        if v27 then
            v26 = u19
        else
            v26 = u18
        end
        v28.Color = v26
        a1.flaskBodies[n_7 + 1].Transparency = (v27 and 0) or 0.35
    end
end
u22.buildSideCabinets = function(a1, a2)
    --[[
      name: buildSideCabinets
      line: 236
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u11 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u15 (copy, index: 5)
        u13 (copy, index: 6)
        u14 (copy, index: 7)
        u21 (copy, index: 8)
        u20 (copy, index: 9)
        u16 (copy, index: 10)
    ]]
    for n_8 = 0, 1 do
        local v29 = ((n_8 ~= 0) and 1) or -1
        local v30 = v29 * 29
        for n_9 = 0, 1 do
            local v31 = ((n_9 ~= 0) and -1.5) or 7
            local v32 = makeStagePart_upv_1(a2)
            v32.Color = u11
            v32.Size = Vector3.new(11, 0.8999999761581421, 2.799999952316284)
            v32.CFrame = CFrame.new(a1.originX + v30, a1.originY + v31, a1.originZ - 6.5)
            for n_10 = 0, 2 do
                local v33
                v33 = (((n_8 * 2) + (n_9 * 3)) + (n_10 * 5)) % #tbl_upv_1
                local v34
                v34 = a1.originX + v30 + (n_10 - 1) * 3.3
                if (n_9 + n_10) % 3 ~= 2 then
                    local v35 = (v33 % 3) * 0.5 + 1.9
                    local v36 = makeSmoothPart_upv_1(a2)
                    v36.Color = tbl_upv_1[v33 + 1]
                    v36.Size = Vector3.new(1.9, v35, 1.7)
                    v36.CFrame = CFrame.new(v34, ((a1.originY + v31) + 0.45) + (v35 / 2), a1.originZ - 6.3)
                    local v37 = makeSmoothPart_upv_1(a2)
                    v37.Color = u13
                    v37.Size = Vector3.new(1.2999999523162842, 0.4000000059604645, 1.2000000476837158)
                    v37.CFrame = CFrame.new(v34, ((a1.originY + v31) + 0.65) + v35, a1.originZ - 6.3)
                else
                    local v38 = makeSmoothPart_upv_1(a2)
                    v38.Color = tbl_upv_1[v33 + 1]
                    v38.Size = Vector3.new(2.200000047683716, 0.550000011920929, 1.600000023841858)
                    v38.CFrame = CFrame.new(v34, (a1.originY + v31) + 0.75, a1.originZ - 6.3)
                    local v39 = makeSmoothPart_upv_1(a2)
                    v39.Color = u15
                    v39.Size = Vector3.new(1.899999976158142, 0.44999998807907104, 1.399999976158142)
                    v39.CFrame = CFrame.new(v34 + 0.15, (a1.originY + v31) + 1.25, a1.originZ - 6.3)
                end
            end
        end
        local v40 = a1.originX + v29 * 22
        local v41 = makeSmoothPart_upv_1(a2)
        v41.Color = u14
        v41.Size = Vector3.new(1.5, 2.0999999046325684, 1.5)
        v41.CFrame = CFrame.new(v40, a1.originY + 13.6, a1.originZ - 5.5)
        local v42 = makeSmoothPart_upv_1(a2)
        v42.Color = u14
        v42.Size = Vector3.new(0.30000001192092896, 2.200000047683716, 0.30000001192092896)
        v42.CFrame = CFrame.new(v40, a1.originY + 15.7, a1.originZ - 5.5)
        local v43 = makeSmoothPart_upv_1(a2)
        v43.Color = u21
        v43.Size = Vector3.new(0.699999988079071, 0.800000011920929, 0.699999988079071)
        v43.CFrame = CFrame.new(v40, a1.originY + 13, a1.originZ - 4.5)
        local v44 = makeSmoothPart_upv_1(a2)
        v44.Material = Enum.Material.Neon
        v44.Color = u20
        v44.Size = Vector3.new(0.3499999940395355, 0.5, 0.3499999940395355)
        v44.CFrame = CFrame.new(v40, a1.originY + 13.65, a1.originZ - 4.5)
        local v45 = a1.originX + v29 * 15.5
        local v46 = makeSmoothPart_upv_1(a2)
        v46.Color = u14
        v46.Size = Vector3.new(0.18000000715255737, 2.5999999046325684, 0.18000000715255737)
        v46.CFrame = CFrame.new(v45, a1.originY + 14.3, a1.originZ - 6)
        for n_11 = 0, 2 do
            local v47
            v47 = makeSmoothPart_upv_1(a2)
            v47.Color = u16
            v47.Size = Vector3.new(0.9 - (n_11 * 0.15), 1 - (n_11 * 0.12), 0.7)
            v47.CFrame = CFrame.new(v45 + (((n_11 % 2 ~= 0) and -0.12) or 0.12), (a1.originY + 12.6) - (n_11 * 0.9), a1.originZ - 6)
        end
    end
end
local tbl_4 = {}
tbl_4.WaterSortScene = u22
return tbl_4