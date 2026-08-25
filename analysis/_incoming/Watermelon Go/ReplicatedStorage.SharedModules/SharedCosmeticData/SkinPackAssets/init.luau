-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local ReplicatedStorage_upv_1 = game:GetService("ReplicatedStorage")
local tbl_upv_2 = {"Background", "Dropper", "FruitBox", "Fruits"}
local tbl_upv_3 = {}
local tbl_upv_4 = {}
local tbl_upv_5 = {}
function tbl_upv_1.Get(a1)
    --[[
      name: Get
      line: 182
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return tbl_upv_3[a1]
    end
    return nil
end
function tbl_upv_1.Resolve(a1)
    --[[
      name: Resolve
      line: 197
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    local v1 = tbl_upv_1.Get(a1)
    if v1 then
        return v1
    end
    local Classic_1 = tbl_upv_3.Classic
    if Classic_1 then
        return Classic_1
    end
    warn(string.format("[SkinPackAssets] No module for pack '%s' and no '%s' fallback", tostring(a1), "Classic"))
    return nil
end
function tbl_upv_1.GetFruit(a1, a2)
    --[[
      name: GetFruit
      line: 220
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_3 (copy, index: 2)
    ]]
    if type(a2) == "number" then
        local v2 = tbl_upv_1.Resolve(a1)
        if not v2 then
            return nil
        end
        local v3 = v2.Fruits and (v2.Fruits[a2])
        if v3 then
            return v3
        end
        local Classic_2 = tbl_upv_3.Classic
        if Classic_2 and Classic_2.Fruits and Classic_2.Fruits[a2] then
            return Classic_2.Fruits[a2]
        end
        warn(string.format("[SkinPackAssets] No fruit %d in pack '%s'", a2, tostring(a1)))
    else
        warn(string.format("[SkinPackAssets] GetFruit needs a numeric fruit index, got '%s'", tostring(a2)))
    end
    return nil
end
function tbl_upv_1.GetHud(a1)
    --[[
      name: GetHud
      line: 256
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v4 = tbl_upv_1.Resolve(a1)
    if v4 then
        return v4.Hud
    end
    return nil
end
function tbl_upv_1.HasSlot(a1, a2)
    --[[
      name: HasSlot
      line: 273
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v5 = tbl_upv_1.Get(a1)
    if not v5 or type(a2) ~= "string" or not v5.Slots then
        return false
    end
    local v6 = table.find(v5.Slots, a2) ~= nil
    return v6
end
function tbl_upv_1.GetPackIds()
    --[[
      name: GetPackIds
      line: 299
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    local tbl_6 = {}
    for key_1 in pairs(tbl_upv_3) do
        table.insert(tbl_6, key_1)
    end
    table.sort(tbl_6)
    return tbl_6
end
function tbl_upv_1.GetLegacySlots()
    --[[
      name: GetLegacySlots
      line: 317
      upvalues:
        tbl_upv_2 (copy, index: 1)
    ]]
    return tbl_upv_2
end
function tbl_upv_1.IsDesignerExport(a1)
    --[[
      name: IsDesignerExport
      line: 326
      upvalues:
        tbl_upv_4 (copy, index: 1)
    ]]
    if type(a1) == "string" then
        return tbl_upv_4[a1] == true
    end
    return false
end
function tbl_upv_1.OnPackRegistered(a1)
    --[[
      name: OnPackRegistered
      line: 344
      upvalues:
        tbl_upv_5 (copy, index: 1)
    ]]
    if type(a1) == "function" then
        table.insert(tbl_upv_5, a1)
    else
        warn("[SkinPackAssets] OnPackRegistered needs a function")
    end
end
function DiscoverPacks()
    --[[
      name: DiscoverPacks
      line: 362
      upvalues:
        tbl_upv_3 (copy, index: 1)
    ]]
    for _, value_1 in script:GetChildren() do
        if not (value_1:IsA("ModuleScript")) then
            continue
        end
        local v7 = require(value_1)
        if type(v7) == "table" then
            tbl_upv_3[value_1.Name] = v7
        else
            warn(string.format("[SkinPackAssets] Pack module '%s' did not return a table, skipping", value_1.Name))
        end
    end
end
function RegisterExportedPack(a1)
    --[[
      name: RegisterExportedPack
      line: 391
      upvalues:
        tbl_upv_3 (copy, index: 1)
        tbl_upv_4 (copy, index: 2)
        tbl_upv_5 (copy, index: 3)
    ]]
    local Name_1 = a1.Name
    local success_1, v8 = pcall(require, a1)
    if success_1 then
        if type(v8) == "table" then
            local v9 = tbl_upv_3[Name_1] ~= nil
            tbl_upv_3[Name_1] = v8
            tbl_upv_4[Name_1] = true
            warn(string.format("[SkinPackAssets] %s IS NOT IN THE REPO, PROGRAMMER MUST MANUALLY IMPORT TO REPO: copy ReplicatedStorage.%s.%s into src/ReplicatedStorage/SharedModules/SharedCosmeticData/SkinPackAssets/%s.lua, then delete the export instance", Name_1, "SkinPackDesignerExports", Name_1, Name_1))
            if v9 then
                warn(string.format("[SkinPackAssets] The '%s' export OVERRIDES the repo pack of the same name until it is imported", Name_1))
            end
            for _, value_2 in tbl_upv_5 do
                local success_2, v10 = pcall(value_2, Name_1, v8)
                if not (success_2) then
                    warn(string.format("[SkinPackAssets] OnPackRegistered subscriber failed for '%s': %s", Name_1, tostring(v10)))
                end
            end
        else
            warn(string.format("[SkinPackAssets] Designer export '%s' did not return a table, skipping", Name_1))
        end
    else
        warn(string.format("[SkinPackAssets] Designer export '%s' failed to load and was skipped: %s", Name_1, tostring(v8)))
    end
end
function RegisterExportedPacksIn(a1)
    --[[
      name: RegisterExportedPacksIn
      line: 433
    ]]
    for _, value_3 in a1:GetChildren() do
        if value_3:IsA("ModuleScript") then
            RegisterExportedPack(value_3)
        end
    end
end
function DiscoverExportedPacks()
    --[[
      name: DiscoverExportedPacks
      line: 454
      upvalues:
        ReplicatedStorage_upv_1 (copy, index: 1)
    ]]
    local SkinPackDesignerExports_1 = ReplicatedStorage_upv_1:FindFirstChild("SkinPackDesignerExports")
    if SkinPackDesignerExports_1 then
        RegisterExportedPacksIn(SkinPackDesignerExports_1)
    else
        task.spawn(
            function()
                --[[
                  line: 462
                  upvalues:
                    ReplicatedStorage_upv_1 (copy, index: 1)
                ]]
                local v11 = ReplicatedStorage_upv_1:WaitForChild("SkinPackDesignerExports", 10)
                if not v11 then
                    return
                end
                RegisterExportedPacksIn(v11)
            end
        )
    end
end
function Initialize()
    --[[
      name: Initialize
      line: 484
    ]]
    DiscoverPacks()
    DiscoverExportedPacks()
end
Initialize()
tbl_upv_1.Assets = tbl_upv_3
return tbl_upv_1