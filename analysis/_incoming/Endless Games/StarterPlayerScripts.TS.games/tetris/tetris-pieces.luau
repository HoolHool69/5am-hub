-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {
    {{-1, 0, 0, 0, 1, 0, 2, 0}, {1, 1, 1, 0, 1, -1, 1, -2}, {-1, -1, 0, -1, 1, -1, 2, -1}, {0, 1, 0, 0, 0, -1, 0, -2}},
    {{-1, 1, -1, 0, 0, 0, 1, 0}, {0, 1, 1, 1, 0, 0, 0, -1}, {-1, 0, 0, 0, 1, 0, 1, -1}, {0, 1, 0, 0, 0, -1, -1, -1}},
    {{1, 1, -1, 0, 0, 0, 1, 0}, {0, 1, 0, 0, 0, -1, 1, -1}, {-1, 0, 0, 0, 1, 0, -1, -1}, {-1, 1, 0, 1, 0, 0, 0, -1}},
    {{0, 0, 1, 0, 0, 1, 1, 1}, {0, 0, 1, 0, 0, 1, 1, 1}, {0, 0, 1, 0, 0, 1, 1, 1}, {0, 0, 1, 0, 0, 1, 1, 1}},
    {{0, 1, 1, 1, -1, 0, 0, 0}, {0, 1, 0, 0, 1, 0, 1, -1}, {0, 0, 1, 0, -1, -1, 0, -1}, {-1, 1, -1, 0, 0, 0, 0, -1}},
    {{-1, 0, 0, 0, 1, 0, 0, 1}, {0, 1, 0, 0, 0, -1, 1, 0}, {1, 0, 0, 0, -1, 0, 0, -1}, {0, -1, 0, 0, 0, 1, -1, 0}},
    {{-1, 1, 0, 1, 0, 0, 1, 0}, {1, 1, 0, 0, 1, 0, 0, -1}, {-1, 0, 0, 0, 0, -1, 1, -1}, {0, 1, -1, 0, 0, 0, -1, -1}}
}
local tbl_2 = {{0, 0, -1, 0, -1, 1, 0, -2, -1, -2}, {0, 0, 1, 0, 1, -1, 0, 2, 1, 2}, {0, 0, 1, 0, 1, -1, 0, 2, 1, 2}, {0, 0, -1, 0, -1, 1, 0, -2, -1, -2}, {0, 0, 1, 0, 1, 1, 0, -2, 1, -2}, {0, 0, -1, 0, -1, -1, 0, 2, -1, 2}, {0, 0, -1, 0, -1, -1, 0, 2, -1, 2}, {0, 0, 1, 0, 1, 1, 0, -2, 1, -2}}
local tbl_3 = {{0, 0, -2, 0, 1, 0, -2, -1, 1, 2}, {0, 0, 2, 0, -1, 0, 2, 1, -1, -2}, {0, 0, -1, 0, 2, 0, -1, 2, 2, -1}, {0, 0, 1, 0, -2, 0, 1, -2, -2, 1}, {0, 0, 2, 0, -1, 0, 2, 1, -1, -2}, {0, 0, -2, 0, 1, 0, -2, -1, 1, 2}, {0, 0, 1, 0, -2, 0, 1, -2, -2, 1}, {0, 0, -1, 0, 2, 0, -1, 2, 2, -1}}
local tbl_4 = {{0, 0, 0, 1, 1, 1, -1, 1, 1, 0, -1, 0}, {0, 0, 1, 0, 1, 2, 1, 1, 0, 2, 0, 1}, {0, 0, 0, -1, -1, -1, 1, -1, -1, 0, 1, 0}, {0, 0, -1, 0, -1, 2, -1, 1, 0, 2, 0, 1}}
local tbl_5 = {{0, 0, 0, 1, -1, 0, 1, 0, -1, 1, 1, 1}, {0, 0, 1, 0, 0, 1, 0, -1, 1, 1, 1, -1}, {0, 0, 0, -1, -1, 0, 1, 0, -1, -1, 1, -1}, {0, 0, -1, 0, 0, 1, 0, -1, -1, 1, -1, -1}}
local tbl_6 = {{-1, 1, 1, 1, -1, -1, 1, -1}, {1, 1, 1, -1, -1, 1, -1, -1}, {-1, -1, 1, -1, -1, 1, 1, 1}, {-1, 1, -1, -1, 1, 1, 1, -1}}
local function refillBag_upv_1(a1, a2)
    --[[
      name: refillBag
      line: 87
    ]]
    table.insert(a1, 0)
    table.insert(a1, 1)
    table.insert(a1, 2)
    table.insert(a1, 3)
    table.insert(a1, 4)
    table.insert(a1, 5)
    table.insert(a1, 6)
    for n_1 = #a1 - 1, 1, -1 do
        local v1 = a2:NextInteger(0, n_1)
        local v2 = a1[n_1 + 1]
        a1[n_1 + 1] = a1[v1 + 1]
        a1[v1 + 1] = v2
    end
end
local tbl_7 = {}
tbl_7.kickRow = function(a1, a2)
    --[[
      name: kickRow
      line: 74
    ]]
    if a1 ~= 0 then
        if a1 ~= 1 then
            if a1 ~= 2 then
                if a2 ~= 1 then
                    return 5
                end
                return 6
            elseif a2 ~= 1 then
                return 3
            else
                return 4
            end
        end
        if a2 ~= 1 then
            return 1
        end
        return 2
    elseif a2 ~= 1 then
        return 7
    else
        return 0
    end
end
tbl_7.refillBag = refillBag_upv_1
tbl_7.refillFirstBag = function(a1, a2)
    --[[
      name: refillFirstBag
      line: 115
      upvalues:
        refillBag_upv_1 (copy, index: 1)
    ]]
    repeat
        local v3
        repeat
            table.clear(a1)
            refillBag_upv_1(a1, a2)
            v3 = a1[#a1]
        until v3 ~= 3
        if v3 == 4 then
            continue
        end
    until v3 ~= 6
    return nil
end
tbl_7.PIECE_CELLS = tbl_1
tbl_7.JLSTZ_KICKS = tbl_2
tbl_7.I_KICKS = tbl_3
tbl_7.ROTATE_180_KICKS_JLSTZ = tbl_4
tbl_7.ROTATE_180_KICKS_I = tbl_5
tbl_7.T_CORNERS = tbl_6
return tbl_7