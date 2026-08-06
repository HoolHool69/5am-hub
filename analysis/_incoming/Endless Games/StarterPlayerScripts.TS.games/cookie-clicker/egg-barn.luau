-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local makeStagePart_upv_1 = v1.makeStagePart
local v2 = RuntimeLib_1.import(script, script.Parent, "egg-layout")
local BRICK_BASE_Y_upv_1 = v2.BRICK_BASE_Y
local FLOOR_TOP_Y_upv_1 = v2.FLOOR_TOP_Y
local GRASS_BAND_HEIGHT_upv_1 = v2.GRASS_BAND_HEIGHT
local NEST_Y_upv_1 = v2.NEST_Y
local SHELF_COLUMN_X_upv_1 = v2.SHELF_COLUMN_X
local SHELF_ROW_BASE_Y_upv_1 = v2.SHELF_ROW_BASE_Y
local SHELF_ROW_COUNT_upv_1 = v2.SHELF_ROW_COUNT
local SHELF_ROW_STEP_upv_1 = v2.SHELF_ROW_STEP
local SHELF_WIDTH_upv_1 = v2.SHELF_WIDTH
local u1 = Color3.fromRGB(214, 207, 192)
local u2 = Color3.fromRGB(206, 198, 182)
local u3 = Color3.fromRGB(198, 189, 172)
local u4 = Color3.fromRGB(240, 236, 226)
local u5 = Color3.fromRGB(122, 84, 52)
local u6 = Color3.fromRGB(84, 58, 38)
local u7 = Color3.fromRGB(196, 160, 96)
local u8 = Color3.fromRGB(178, 142, 82)
local u9 = Color3.fromRGB(150, 118, 66)
local u10 = Color3.fromRGB(126, 205, 92)
local u11 = Color3.fromRGB(110, 190, 80)
local u12 = Color3.fromRGB(196, 156, 88)
local u13 = Color3.fromRGB(168, 128, 66)
local function buildWall(a1, a2)
    --[[
      name: buildWall
      line: 52
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        makeSmoothPart_upv_1 (copy, index: 3)
        u3 (copy, index: 4)
        u2 (copy, index: 5)
        BRICK_BASE_Y_upv_1 (copy, index: 6)
        u4 (copy, index: 7)
    ]]
    local v3 = makeStagePart_upv_1(a1)
    v3.Size = Vector3.new(220, 130, 1)
    v3.Color = u1
    v3.CFrame = CFrame.new(a2 + Vector3.new(0, 8, -9))
    for n_1 = 0, 10 do
        local v4 = ((n_1 % 2 ~= 0) and 3.95) or 0
        local v5 = nil
        for n_2 = 0, 13 do
            local v6
            v6 = makeSmoothPart_upv_1(a1)
            v6.Size = Vector3.new(7.400000095367432, 3.200000047683716, 0.30000001192092896)
            if (n_1 + n_2) % 3 ~= 0 then
                v5 = u2
            else
                v5 = u3
            end
            v6.Color = v5
            v6.CFrame = CFrame.new(a2 + Vector3.new(((v4 + -55.300000000000004) + (n_2 * 7.9)) + 3.7, BRICK_BASE_Y_upv_1 + (n_1 * 3.7), -8.6))
        end
    end
    local v7 = makeSmoothPart_upv_1(a1)
    v7.Size = Vector3.new(220, 1.2000000476837158, 0.30000001192092896)
    v7.Color = u4
    v7.CFrame = CFrame.new(a2 + Vector3.new(0, (BRICK_BASE_Y_upv_1 + 40.7) + 0.6, -8.5))
end
local function buildFloor(a1, a2)
    --[[
      name: buildFloor
      line: 94
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        GRASS_BAND_HEIGHT_upv_1 (copy, index: 2)
        u10 (copy, index: 3)
        u11 (copy, index: 4)
        FLOOR_TOP_Y_upv_1 (copy, index: 5)
        u7 (copy, index: 6)
        u8 (copy, index: 7)
        makeSmoothPart_upv_1 (copy, index: 8)
        u9 (copy, index: 9)
    ]]
    local v8 = nil
    for n_3 = 0, 13 do
        local v9 = makeStagePart_upv_1(a1)
        v9.Size = Vector3.new(17, GRASS_BAND_HEIGHT_upv_1, 5)
        if n_3 % 2 ~= 0 then
            v8 = u11
        else
            v8 = u10
        end
        v9.Color = v8
        v9.CFrame = CFrame.new(a2 + Vector3.new((n_3 * 17) + -110.5, FLOOR_TOP_Y_upv_1 + (GRASS_BAND_HEIGHT_upv_1 / 2), -6.5))
    end
    for n_4 = 0, 5 do
        local v10 = makeStagePart_upv_1(a1)
        v10.Size = Vector3.new(240, 2.4000000953674316, 12)
        if n_4 % 2 ~= 0 then
            v8 = u8
        else
            v8 = u7
        end
        v10.Color = v8
        v10.CFrame = CFrame.new(a2 + Vector3.new(0, (FLOOR_TOP_Y_upv_1 - 1.2) - (n_4 * 2.6), (n_4 * 1.2) + 2))
        local v11 = makeSmoothPart_upv_1(a1)
        v11.Size = Vector3.new(240, 0.2199999988079071, 0.30000001192092896)
        v11.Color = u9
        v11.CFrame = CFrame.new(a2 + Vector3.new(0, (FLOOR_TOP_Y_upv_1 - 2.4) - (n_4 * 2.6), (n_4 * 1.2) + 8.05))
    end
    local v12 = makeStagePart_upv_1(a1)
    v12.Size = Vector3.new(240, 90, 10)
    v12.Color = u8
    v12.CFrame = CFrame.new(a2 + Vector3.new(0, FLOOR_TOP_Y_upv_1 - 60, -2))
end
local function buildShelves(a1, a2)
    --[[
      name: buildShelves
      line: 136
      upvalues:
        SHELF_ROW_BASE_Y_upv_1 (copy, index: 1)
        SHELF_ROW_COUNT_upv_1 (copy, index: 2)
        SHELF_ROW_STEP_upv_1 (copy, index: 3)
        FLOOR_TOP_Y_upv_1 (copy, index: 4)
        SHELF_WIDTH_upv_1 (copy, index: 5)
        makeStagePart_upv_1 (copy, index: 6)
        u6 (copy, index: 7)
        SHELF_COLUMN_X_upv_1 (copy, index: 8)
        u5 (copy, index: 9)
        makeSmoothPart_upv_1 (copy, index: 10)
    ]]
    local v13 = (SHELF_ROW_BASE_Y_upv_1 + ((SHELF_ROW_COUNT_upv_1 - 1) * SHELF_ROW_STEP_upv_1)) - FLOOR_TOP_Y_upv_1 + 1.2
    local v14 = nil
    for _, value_1 in {-1, 1} do
        for v17, value_2 in {(-SHELF_WIDTH_upv_1 / 2) + 0.8, (SHELF_WIDTH_upv_1 / 2) - 0.8} do
            v14 = makeStagePart_upv_1(a1)
            v14.Size = Vector3.new(0.8, v13, 1.2)
            v14.Color = u6
            v14.CFrame = CFrame.new(a2 + Vector3.new((value_1 * SHELF_COLUMN_X_upv_1) + value_2, FLOOR_TOP_Y_upv_1 + (v13 / 2), -4.4))
        end
        for n_5 = 0, SHELF_ROW_COUNT_upv_1 - 1 do
            local v15 = SHELF_ROW_BASE_Y_upv_1 + n_5 * SHELF_ROW_STEP_upv_1
            local value_2 = makeStagePart_upv_1(a1)
            value_2.Size = Vector3.new(SHELF_WIDTH_upv_1, 1.1, 6)
            value_2.Color = u5
            value_2.CFrame = CFrame.new(a2 + Vector3.new(value_1 * SHELF_COLUMN_X_upv_1, v15, -4))
            local v16 = makeSmoothPart_upv_1(a1)
            v16.Size = Vector3.new(SHELF_WIDTH_upv_1, 0.5, 0.4)
            v16.Color = u6
            v16.CFrame = CFrame.new(a2 + Vector3.new(value_1 * SHELF_COLUMN_X_upv_1, v15 + 0.4, -0.9))
        end
    end
end
local function buildNest(a1, a2)
    --[[
      name: buildNest
      line: 166
      upvalues:
        makeStagePart_upv_1 (copy, index: 1)
        u12 (copy, index: 2)
        u13 (copy, index: 3)
        NEST_Y_upv_1 (copy, index: 4)
    ]]
    local v17 = nil
    for n_6 = 0, 11 do
        local v18 = (n_6 / 12) * math.pi * 2
        local v19 = makeStagePart_upv_1(a1)
        v19.Size = Vector3.new(3.4000000953674316, 1.2000000476837158, 1.399999976158142)
        if n_6 % 2 ~= 0 then
            v17 = u13
        else
            v17 = u12
        end
        v19.Color = v17
        v19.CFrame = CFrame.new(a2 + Vector3.new(math.cos(v18) * 4.8, NEST_Y_upv_1, (math.sin(v18) * 1.8) - 0.3)) * CFrame.Angles(0, -v18, 0.13962634015954636)
    end
end
local tbl_1 = {}
tbl_1.buildBarn = function(a1, a2)
    --[[
      name: buildBarn
      line: 39
      upvalues:
        buildWall (ref, index: 1)
        buildFloor (ref, index: 2)
        buildShelves (ref, index: 3)
        buildNest (ref, index: 4)
    ]]
    buildWall(a1, a2)
    buildFloor(a1, a2)
    buildShelves(a1, a2)
    buildNest(a1, a2)
end
return tbl_1