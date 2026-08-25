-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local tbl_upv_2 = {"K", "M", "B", "T", "Qa", "Qi", "Si", "Sp"}
tbl_upv_1.Deg2Rad = 0.017453292519943295
tbl_upv_1.Rad2Deg = 1 / tbl_upv_1.Deg2Rad
tbl_upv_1.Epsilon = 1e-09
tbl_upv_1.Phi = math.phi
function tbl_upv_1.Clamp(a1, a2, a3)
    --[[
      name: Clamp
      line: 13
    ]]
    return (math.clamp(a1, a2, a3))
end
function tbl_upv_1.Clamp01(a1)
    --[[
      name: Clamp01
      line: 17
    ]]
    if a1 >= 0 then
        if a1 <= 1 then
            return a1
        end
        return 1
    end
    return 0
end
function tbl_upv_1.PingPong(a1, a2)
    --[[
      name: PingPong
      line: 27
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return a2 - math.abs(tbl_upv_1.Repeat(a1, a2 * 2) - a2)
end
function tbl_upv_1.Repeat(a1, a2)
    --[[
      name: Repeat
      line: 32
    ]]
    return a1 % a2
end
function tbl_upv_1.Repeat1Up(a1, a2)
    --[[
      name: Repeat1Up
      line: 36
    ]]
    return ((a1 - 1) % a2) + 1
end
function tbl_upv_1.MapRange(a1, a2, a3, a4, a5)
    --[[
      name: MapRange
      line: 40
    ]]
    return (((a1 - a2) / (a3 - a2)) * (a5 - a4)) + a4
end
function tbl_upv_1.Lerp(a1, a2, a3)
    --[[
      name: Lerp
      line: 44
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return a1 + ((a2 - a1) * tbl_upv_1.Clamp01(a3))
end
function tbl_upv_1.LerpUnclamped(a1, a2, a3)
    --[[
      name: LerpUnclamped
      line: 48
    ]]
    return a1 + ((a2 - a1) * a3)
end
function tbl_upv_1.LerpAngle(a1, a2, a3)
    --[[
      name: LerpAngle
      line: 52
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Repeat(a2 - a1, 360)
    if v1 > 180 then
        v1 = v1 - 360
    end
    return a1 + (v1 * tbl_upv_1.Clamp01(a3))
end
function tbl_upv_1.MoveTowards(a1, a2, a3)
    --[[
      name: MoveTowards
      line: 60
    ]]
    if math.abs(a2 - a1) > a3 then
        return a1 + (math.sign(a2 - a1) * a3)
    end
    return a2
end
function tbl_upv_1.FormatSeconds(a1)
    --[[
      name: FormatSeconds
      line: 67
    ]]
    local v2 = math.floor(a1 % 60)
    local v3 = math.floor((a1 / 60) % 60)
    local v4 = math.floor((a1 / 3600) % 24)
    local v5 = math.floor(a1 / 86400)
    local v6 = ""
    if v5 > 0 then
        v6 = v6 .. tostring(v5) .. ":"
    end
    if v5 > 0 or v4 > 0 then
        v6 = v6 .. string.format("%0.2i", v4) .. ":"
    end
    v6 = (v3 and (v6 .. string.format("%0.2i", v3))) or v6
    v6 = (v2 and (v6 .. ":" .. string.format("%0.2i", v2))) or v6
    return v6
end
function tbl_upv_1.RandomFromWeightTable(a1)
    --[[
      name: RandomFromWeightTable
      line: 90
    ]]
    local v7 = 0
    for _, value_1 in pairs(a1) do
        v7 = v7 + value_1
    end
    local v8 = math.random() * v7
    local v9 = 0
    for key_1, value_2 in pairs(a1) do
        v9 = v9 + value_2
        if v8 > v9 then
            continue
        end
        return key_1
    end
    return nil
end
function tbl_upv_1.MoveTowardsAngle(a1, a2, a3)
    --[[
      name: MoveTowardsAngle
      line: 111
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v10 = tbl_upv_1.DeltaAngle(a1, a2)
    if -a3 < v10 and v10 < a3 then
        return a2
    end
    return tbl_upv_1.MoveTowards(a1, a1 + v10, a3)
end
function tbl_upv_1.DeltaAngle(a1, a2)
    --[[
      name: DeltaAngle
      line: 120
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return math.atan2(math.sin(math.rad(a2) - math.rad(a1)), math.cos(math.rad(a2) - math.rad(a1))) * tbl_upv_1.Rad2Deg
end
function tbl_upv_1.NormalizeAngle(a1, a2, a3)
    --[[
      name: NormalizeAngle
      line: 124
    ]]
    local v11 = a3 - a2
    local v12 = a1 - a2
    return (v12 - (math.floor(v12 / v11) * v11)) + a2
end
function tbl_upv_1.SmoothDamp(a1, a2, a3, a4, a5, a6)
    --[[
      name: SmoothDamp
      line: 131
    ]]
    local v13 = math.max(1e-04, a4)
    local v14 = 2 / v13
    local v15 = v14 * a6
    local v16 = 1 / (((1 + v15) + ((0.48 * v15) * v15)) + (((0.235 * v15) * v15) * v15))
    local v17 = a5 * v13
    local v18 = math.clamp(a1 - a2, -v17, v17)
    local v19 = (a3 + (v14 * v18)) * a6
    a3 = (a3 - (v14 * v19)) * v16
    local v20 = a1 - v18 + (v18 + v19) * v16
    local v21 = a2 - a1 > 0
    if v21 == (a2 < v20) then
        v20 = a2
        a3 = (a2 - a2) / a6
    end
    return v20, a3
end
function tbl_upv_1.SmoothDampAngle(a1, a2, a3, a4, a5, a6)
    --[[
      name: SmoothDampAngle
      line: 156
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.SmoothDamp(a1, a1 + tbl_upv_1.DeltaAngle(a1, a2), a3, a4, a5, a6)
end
function tbl_upv_1.TruncateNumber(a1, a2)
    --[[
      name: TruncateNumber
      line: 161
    ]]
    local v22 = 10 ^ a2
    return math.round(a1 * v22) / v22
end
function tbl_upv_1.GetDigits(a1)
    --[[
      name: GetDigits
      line: 166
    ]]
    return #tostring(math.floor(a1))
end
function tbl_upv_1.GetListChunk(a1, a2, a3)
    --[[
      name: GetListChunk
      line: 170
    ]]
    if a1 == 0 then
        return
    end
    local v23 = math.min(a2, a1)
    a3 = (a3 - 1) % v23 + 1
    local v24 = math.floor(a1 / v23)
    local v25 = a1 % v23
    local v26 = (a3 - 1) * v24 + 1
    local v27 = a3 * v24
    if a3 > v25 then
        return v26 + v25, v27 + v25
    end
    return (v26 + a3) - 1, v27 + a3
end
function tbl_upv_1.SimplifyNumber(a1, a2)
    --[[
      name: SimplifyNumber
      line: 192
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local v28 = math.min(a2 or 2, 3)
    local v29 = math.ceil((tbl_upv_1.GetDigits(a1) / 3) - 1)
    if v29 > 0 then
        return string.format("%.2f", math.floor(a1 * (10 ^ (-(v29 * 3) + v28))) * (10 ^ -v28)):gsub("%.00$", "") .. tbl_upv_2[v29]
    end
    return (tostring(math.floor(a1)))
end
return tbl_upv_1