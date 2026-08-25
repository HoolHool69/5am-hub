-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local tbl_upv_2 = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
function tbl_upv_1.CountLeapYears(a1)
    --[[
      name: CountLeapYears
      line: 10
    ]]
    local year_1 = a1.year
    if a1.month <= 2 then
        year_1 = year_1 - 1
    end
    return ((year_1 / 4) - (year_1 / 100)) + (year_1 / 400)
end
function tbl_upv_1.GetTotalDays(a1)
    --[[
      name: GetTotalDays
      line: 22
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v1 = a1.year * 365 + a1.day
    for n_1 = 1, a1.month - 1 do
        v1 = v1 + tbl_upv_2[n_1]
    end
    return (math.floor((v1 + tbl_upv_1.CountLeapYears(a1)) + 5))
end
function tbl_upv_1.GetTotalWeeks(a1)
    --[[
      name: GetTotalWeeks
      line: 33
      upvalues:
        tbl_upv_2 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    local v2 = a1.year * 365 + a1.day
    for n_2 = 1, a1.month - 1 do
        v2 = v2 + tbl_upv_2[n_2]
    end
    return (math.floor((math.floor(v2 + tbl_upv_1.CountLeapYears(a1)) / 7) + 0.7143))
end
function tbl_upv_1.GetTotalDaysFromTime(a1)
    --[[
      name: GetTotalDaysFromTime
      line: 44
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.GetTotalDays(os.date("*t", a1))
end
function tbl_upv_1.GetTotalWeeksFromTime(a1)
    --[[
      name: GetTotalWeeksFromTime
      line: 49
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.GetTotalWeeks(os.date("*t", a1))
end
function tbl_upv_1.GetDifference(a1, a2)
    --[[
      name: GetDifference
      line: 54
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.GetTotalDays(a2) - tbl_upv_1.GetTotalDays(a1)
end
function tbl_upv_1.GetDifferenceFromTimes(a1, a2)
    --[[
      name: GetDifferenceFromTimes
      line: 58
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1.GetTotalDaysFromTime(a1) - tbl_upv_1.GetTotalDaysFromTime(a2)
end
function tbl_upv_1.GetLocalOffsetFromUTC()
    --[[
      name: GetLocalOffsetFromUTC
      line: 62
    ]]
    return math.floor(tonumber(os.date("%z", os.time())) / 100) * 3600
end
function tbl_upv_1.ClampTimezoneOffset(a1)
    --[[
      name: ClampTimezoneOffset
      line: 66
    ]]
    return (math.clamp(a1, -43200, 50400))
end
function tbl_upv_1.ConvertToHMS(a1)
    --[[
      name: ConvertToHMS
      line: 70
    ]]
    local function Format(a2)
        --[[
          name: Format
          line: 72
        ]]
        return string.format("%02i", a2)
    end
    local v3 = (a1 - (a1 % 60)) / 60
    a1 = a1 - v3 * 60
    local v4 = (v3 - (v3 % 60)) / 60
    local v5 = v3 - v4 * 60
    if v4 ~= 0 then
        return string.format("%02i", v4) .. ":" .. string.format("%02i", v5) .. ":" .. string.format("%02i", a1)
    end
    return string.format("%02i", v5) .. ":" .. string.format("%02i", a1)
end
return tbl_upv_1