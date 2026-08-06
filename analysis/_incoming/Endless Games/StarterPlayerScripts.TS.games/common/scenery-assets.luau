-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local ReplicatedStorage_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants")
local SCENERY_COUNT_ATTRIBUTE_upv_1 = v1.SCENERY_COUNT_ATTRIBUTE
local SCENERY_FOLDER_NAME_upv_1 = v1.SCENERY_FOLDER_NAME
local tbl_upv_1 = {}
local function hasFullSubtree_1(a1)
    --[[
      name: hasFullSubtree
      line: 44
      upvalues:
        SCENERY_COUNT_ATTRIBUTE_upv_1 (copy, index: 1)
    ]]
    local v2 = a1:GetAttribute(SCENERY_COUNT_ATTRIBUTE_upv_1)
    if type(v2) == "number" then
        local v3 = v2 <= #a1:GetDescendants()
        return v3
    end
    return true
end
local isSceneryMirrorComplete = nil
local function waitForSceneryRoot_upv_1(a1, a2)
    --[[
      name: waitForSceneryRoot
      line: 59
      upvalues:
        tbl_upv_1 (copy, index: 1)
        ReplicatedStorage_upv_1 (copy, index: 2)
        SCENERY_FOLDER_NAME_upv_1 (copy, index: 3)
        isSceneryMirrorComplete (ref,  index: 4)
        SCENERY_COUNT_ATTRIBUTE_upv_1 (copy, index: 5)
    ]]
    local v4 = tbl_upv_1[a1]
    local v5 = nil
    if v4 == nil then
        local v6 = os.clock() + 5
        v5 = ReplicatedStorage_upv_1:WaitForChild(SCENERY_FOLDER_NAME_upv_1, 5)
        if v5 ~= nil then
            local v7 = v5:FindFirstChild(a1)
            while v7 == nil do
                if (isSceneryMirrorComplete()) then
                    warn((("[%*] missing scenery asset %*.%* \226\128\148 using procedural visuals"):format(a2, SCENERY_FOLDER_NAME_upv_1, a1)))
                    return nil
                elseif v6 > os.clock() then
                    task.wait(0.1)
                    v7 = v5:FindFirstChild(a1)
                end
            end
            while true do
                local v8 = v7:GetAttribute(SCENERY_COUNT_ATTRIBUTE_upv_1)
                local v9 = ((type(v8) ~= "number") and true) or (v8 <= #v7:GetDescendants())
                if v9 then
                    tbl_upv_1[a1] = v7
                    return v7
                end
                if v6 <= os.clock() then
                    break
                end
                task.wait(0.1)
            end
            warn(("[%*] %*.%* still replicating after %*s "):format(a2, SCENERY_FOLDER_NAME_upv_1, a1, 5) .. ("(%*/%*) \226\128\148 using procedural visuals"):format(#v7:GetDescendants(), v7:GetAttribute(SCENERY_COUNT_ATTRIBUTE_upv_1)))
        else
            warn((("[%*] missing %* \226\128\148 using procedural visuals"):format(a2, SCENERY_FOLDER_NAME_upv_1)))
        end
        return nil
    end
    return v4
end
isSceneryMirrorComplete = function()
    --[[
      name: isSceneryMirrorComplete
      line: 115
      upvalues:
        ReplicatedStorage_upv_1 (copy, index: 1)
        SCENERY_FOLDER_NAME_upv_1 (copy, index: 2)
        SCENERY_COUNT_ATTRIBUTE_upv_1 (copy, index: 3)
    ]]
    local v10 = ReplicatedStorage_upv_1:FindFirstChild(SCENERY_FOLDER_NAME_upv_1)
    if v10 ~= nil then
        local v11 = nil
        if type(v10:GetAttribute(SCENERY_COUNT_ATTRIBUTE_upv_1)) == "number" then
            v11 = v10:GetAttribute(SCENERY_COUNT_ATTRIBUTE_upv_1)
            if type(v11) == "number" then
                local v12 = v11 <= #v10:GetDescendants()
                return v12
            end
            return true
        end
    end
    return false
end
local tbl_2 = {}
tbl_2.waitForSceneryRoot = waitForSceneryRoot_upv_1
tbl_2.waitForSceneryModel = function(a1, a2)
    --[[
      name: waitForSceneryModel
      line: 96
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        SCENERY_FOLDER_NAME_upv_1 (copy, index: 2)
    ]]
    local v13 = waitForSceneryRoot_upv_1(a1, a2)
    if v13 ~= nil then
        if v13:IsA("Model") then
            return v13
        end
        warn((("[%*] %*.%* is a %*, expected a Model"):format(a2, SCENERY_FOLDER_NAME_upv_1, a1, v13.ClassName)))
    end
    return nil
end
tbl_2.isSceneryMirrorComplete = isSceneryMirrorComplete
return tbl_2