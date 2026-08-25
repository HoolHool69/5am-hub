-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local HttpService_upv_1 = game:GetService("HttpService")
local find_upv_1 = table.find
local function CopyTable(a1)
    --[[
      name: CopyTable
      line: 216
      upvalues:
        CopyTable (copy, index: 1)
    ]]
    local v1 = type(a1) == "table"
    assert(v1, "First argument must be a table")
    local v2 = table.create(#a1)
    for key_1, value_1 in pairs(a1) do
        if type(value_1) ~= "table" then
            v2[key_1] = value_1
        else
            v2[key_1] = CopyTable(value_1)
        end
    end
    return v2
end
local function Sync(a1, a2)
    --[[
      name: Sync
      line: 237
      upvalues:
        CopyTable (copy, index: 1)
        Sync (copy, index: 2)
    ]]
    local v3 = type(a1) == "table"
    assert(v3, "First argument must be a table")
    local v4 = type(a2) == "table"
    assert(v4, "Second argument must be a table")
    for key_2, value_2 in pairs(a1) do
        local v5 = a2[key_2]
        if v5 == nil then
            a1[key_2] = nil
            continue
        end
        if type(value_2) == type(v5) then
            if type(value_2) == "table" then
                Sync(value_2, v5)
            end
        elseif type(v5) ~= "table" then
            a1[key_2] = v5
        else
            a1[key_2] = CopyTable(v5)
        end
    end
    for key_3, value_3 in pairs(a2) do
        if a1[key_3] ~= nil then
            continue
        end
        if type(value_3) ~= "table" then
            a1[key_3] = value_3
        else
            a1[key_3] = CopyTable(value_3)
        end
    end
end
tbl_1.Copy = CopyTable
tbl_1.CopyShallow = function(a1)
    --[[
      name: CopyTableShallow
      line: 230
    ]]
    local v6 = table.create(#a1)
    for key_4, value_4 in pairs(a1) do
        v6[key_4] = value_4
    end
    return v6
end
tbl_1.Sync = Sync
function tbl_1.FastRemove(a1, a2)
    --[[
      name: FastRemove
      line: 286
    ]]
    local v7 = #a1
    a1[a2] = a1[v7]
    a1[v7] = nil
end
function tbl_1.FastRemoveFirstValue(a1, a2)
    --[[
      name: FastRemoveFirstValue
      line: 444
      upvalues:
        find_upv_1 (copy, index: 1)
    ]]
    local v8 = find_upv_1(a1, a2)
    if not v8 then
        return false, nil
    end
    local v9 = #a1
    a1[v8] = a1[v9]
    a1[v9] = nil
    return true, v8
end
function tbl_1.Print(a1, a2, a3)
    --[[
      name: Print
      line: 351
    ]]
    local v10 = type(a1) == "table"
    assert(v10, "First argument must be a table")
    local v11 = true
    if a2 ~= nil then
        v11 = type(a2) == "string"
    end
    assert(v11, "Second argument must be a string or nil")
    local tbl_upv_2 = {}
    local function Insert(a4, a5)
        --[[
          name: Insert
          line: 362
          upvalues:
            tbl_upv_2 (copy, index: 1)
        ]]
        tbl_upv_2[#tbl_upv_2 + 1] = (" - "):rep(a5) .. a4 .. "\n"
    end
    local function AlphaKeySort(a6, a7)
        --[[
          name: AlphaKeySort
          line: 366
        ]]
        local v12 = tostring(a6.k) < tostring(a7.k)
        return v12
    end
    local function PrintTable(a8, a9, a10)
        --[[
          name: PrintTable
          line: 370
          upvalues:
            tbl_upv_2 (copy, index: 1)
            AlphaKeySort (copy, index: 2)
            a3 (copy, index: 3)
            PrintTable (copy, index: 4)
        ]]
        tbl_upv_2[#tbl_upv_2 + 1] = (" - "):rep(a9 - 1) .. (a10 .. ":") .. "\n"
        local tbl_3 = {}
        local tbl_4 = {}
        local v13 = 0
        for key_5, value_5 in pairs(a8) do
            if type(value_5) ~= "table" then
                table.insert(tbl_3, {k = key_5, v = "[" .. typeof(value_5) .. "] " .. tostring(value_5)})
            else
                table.insert(tbl_4, {k = key_5, v = value_5})
            end
            local v14 = #tostring(key_5) + 1
            if v13 < v14 then
                v13 = v14
            end
        end
        table.sort(tbl_3, AlphaKeySort)
        table.sort(tbl_4, AlphaKeySort)
        for _, value_6 in ipairs(tbl_3) do
            local str_1 = tostring(value_6.k)
            local v15 = (" "):rep(v13 - #tostring(value_6.k))
            tbl_upv_2[#tbl_upv_2 + 1] = (" - "):rep(a9) .. (str_1 .. ":" .. v15 .. value_6.v) .. "\n"
        end
        if a3 then
            for _, value_7 in ipairs(tbl_4) do
                PrintTable(value_7.v, a9 + 1, tostring(value_7.k) .. (" "):rep(v13 - #tostring(value_7.k)) .. " [Table]")
            end
        else
            for _, value_8 in ipairs(tbl_4) do
                local v16 = tostring(value_8.k) .. ":" .. (" "):rep(v13 - #tostring(value_8.k)) .. "[Table]"
                tbl_upv_2[#tbl_upv_2 + 1] = (" - "):rep(a9) .. v16 .. "\n"
            end
        end
    end
    PrintTable(a1, 1, a2 or "TABLE")
    print(table.concat(tbl_upv_2, ""))
end
function tbl_1.Map(a1, a2)
    --[[
      name: Map
      line: 293
    ]]
    local v17 = type(a1) == "table"
    assert(v17, "First argument must be a table")
    local v18 = type(a2) == "function"
    assert(v18, "Second argument must be an array")
    local v19 = table.create(#a1)
    for key_6, value_9 in pairs(a1) do
        v19[key_6] = a2(value_9, key_6, a1)
    end
    return v19
end
function tbl_1.Filter(a1, a2)
    --[[
      name: Filter
      line: 304
    ]]
    local v20 = type(a1) == "table"
    assert(v20, "First argument must be a table")
    v20 = type(a2) == "function"
    assert(v20, "Second argument must be an array")
    local v21 = table.create(#a1)
    if #a1 <= 0 then
        for key_7, value_10 in pairs(a1) do
            if a2(value_10, key_7, a1) then
                v21[key_7] = value_10
            end
        end
    else
        local v22 = 0
        v20 = v22
        for n_1 = 1, #a1 do
            local v23 = a1[n_1]
            local v24 = a2(v23, n_1, a1)
            if v24 then
                v20 = v20 + 1
                v21[v20] = v23
            end
        end
    end
    return v21
end
function tbl_1.Reduce(a1, a2, a3)
    --[[
      name: Reduce
      line: 328
    ]]
    local v25 = type(a1) == "table"
    assert(v25, "First argument must be a table")
    local v26 = type(a2) == "function"
    assert(v26, "Second argument must be an array")
    local v27 = true
    if a3 ~= nil then
        v27 = type(a3) == "number"
    end
    assert(v27, "Third argument must be a number or nil")
    local v28 = a3 or 0
    for key_8, value_11 in pairs(a1) do
        v28 = a2(v28, value_11, key_8, a1)
    end
    return v28
end
function tbl_1.Assign(a1, ...)
    --[[
      name: Assign
      line: 341
    ]]
    for _, value_12 in ipairs({...}) do
        for key_9, value_13 in pairs(value_12) do
            a1[key_9] = value_13
        end
    end
    return a1
end
tbl_1.IndexOf = find_upv_1
function tbl_1.Reverse(a1)
    --[[
      name: Reverse
      line: 409
    ]]
    local v29 = #a1
    local v30 = table.create(v29)
    for n_2 = 1, v29 do
        v30[n_2] = a1[(v29 - n_2) + 1]
    end
    return v30
end
function tbl_1.Shuffle(a1)
    --[[
      name: Shuffle
      line: 419
    ]]
    local v31 = type(a1) == "table"
    assert(v31, "First argument must be a table")
    local v32 = Random.new()
    for n_3 = #a1, 2, -1 do
        local v33 = v32:NextInteger(1, n_3)
        local v34 = a1[n_3]
        a1[n_3] = a1[v33]
        a1[v33] = v34
    end
end
function tbl_1.IsEmpty(a1)
    --[[
      name: IsEmpty
      line: 429
    ]]
    local v35 = next(a1) == nil
    return v35
end
function tbl_1.EncodeJSON(a1)
    --[[
      name: EncodeJSON
      line: 434
      upvalues:
        HttpService_upv_1 (copy, index: 1)
    ]]
    return HttpService_upv_1:JSONEncode(a1)
end
function tbl_1.DecodeJSON(a1)
    --[[
      name: DecodeJSON
      line: 439
      upvalues:
        HttpService_upv_1 (copy, index: 1)
    ]]
    return HttpService_upv_1:JSONDecode(a1)
end
function tbl_1.GetFirstElement(a1)
    --[[
      name: GetFirstElement
      line: 453
    ]]
    for _, value_14 in pairs(a1) do
        return value_14
    end
end
function tbl_1.GetFirstKey(a1)
    --[[
      name: GetFirstKey
      line: 459
    ]]
    for key_10, _ in pairs(a1) do
        return key_10
    end
end
function tbl_1.Merge(a1, a2)
    --[[
      name: Merge
      line: 465
    ]]
    local tbl_5 = {}
    for _, value_15 in pairs(a1) do
        table.insert(tbl_5, value_15)
    end
    for _, value_16 in pairs(a2) do
        table.insert(tbl_5, value_16)
    end
    return tbl_5
end
function tbl_1.MergeDictionaries(a1, a2)
    --[[
      name: MergeDictionaries
      line: 476
    ]]
    local tbl_6 = {}
    for key_11, value_17 in pairs(a1) do
        tbl_6[key_11] = value_17
    end
    for key_12, value_18 in pairs(a2) do
        tbl_6[key_12] = value_18
    end
    return tbl_6
end
return tbl_1