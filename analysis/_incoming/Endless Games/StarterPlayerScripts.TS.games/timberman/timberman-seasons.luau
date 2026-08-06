-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local readLightingFolderProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "lighting-folder").readLightingFolderProfile
local SPRING_STAGE_LIGHTING_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "lighting-profiles").SPRING_STAGE_LIGHTING
local waitForSceneryRoot_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "scenery-assets").waitForSceneryRoot
local tbl_upv_1 = {"Spring", "Autumn", "Dawn", "Winter"}
local v1 = Color3.fromRGB(70, 70, 70)
local tbl_2 = {}
tbl_2.ambient = v1
tbl_2.outdoorAmbient = v1
tbl_2.colorShiftTop = Color3.fromRGB(0, 0, 0)
tbl_2.colorShiftBottom = Color3.fromRGB(0, 0, 0)
local tbl_upv_3 = {}
local v2 = table.clone(tbl_2)
setmetatable(v2, nil)
v2.clockTime = 15.912
v2.geographicLatitude = 17.662
tbl_upv_3.Spring = v2
local v3 = table.clone(tbl_2)
setmetatable(v3, nil)
v3.clockTime = 15.912
v3.geographicLatitude = 17.662
tbl_upv_3.Autumn = v3
local v4 = table.clone(tbl_2)
setmetatable(v4, nil)
v4.clockTime = 17.662
v4.geographicLatitude = 15.912
tbl_upv_3.Dawn = v4
local v5 = table.clone(tbl_2)
setmetatable(v5, nil)
v5.clockTime = 15.551
v5.geographicLatitude = 32.395
tbl_upv_3.Winter = v5
local tbl_upv_4 = {}
tbl_upv_4.Spring = {flingColor = Color3.fromRGB(188, 118, 72), chipLight = Color3.fromRGB(214, 160, 110), chipDark = Color3.fromRGB(122, 74, 44)}
tbl_upv_4.Autumn = {flingColor = Color3.fromRGB(194, 91, 70), chipLight = Color3.fromRGB(224, 132, 88), chipDark = Color3.fromRGB(94, 37, 32)}
tbl_upv_4.Dawn = {flingColor = Color3.fromRGB(178, 116, 96), chipLight = Color3.fromRGB(208, 150, 128), chipDark = Color3.fromRGB(110, 70, 66)}
tbl_upv_4.Winter = {flingColor = Color3.fromRGB(168, 188, 187), chipLight = Color3.fromRGB(210, 224, 224), chipDark = Color3.fromRGB(110, 130, 132)}
local loadAnimationRig = nil
local function u1()
    --[[
      name: loadTimbermanScenery
      line: 110
      upvalues:
        waitForSceneryRoot_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        u1 (ref,  index: 3)
        loadAnimationRig (ref,  index: 4)
    ]]
    local v6 = waitForSceneryRoot_upv_1("Timberman", "Timberman")
    if v6 ~= nil then
        local tbl_5 = {}
        local v7 = nil
        for _, value_1 in tbl_upv_1 do
            v7 = u1(v6, value_1)
            if v7 ~= nil then
                table.insert(tbl_5, v7)
            end
        end
        if #tbl_5 ~= 0 then
            local v8 = v6:FindFirstChild("Axe")
            local tbl_6 = {}
            tbl_6.seasons = tbl_5
            tbl_6.axeTemplate = v8 == nil or not (v8:IsA("Model")) or v8
            tbl_6.animationRig = loadAnimationRig(v6)
            return tbl_6
        end
        warn("[Timberman] no complete season in Timberman \226\128\148 using the procedural look")
    end
    return nil
end
local makeTrunkTemplate = nil
local loadDuelScene = nil
u1 = function(a1, a2)
    --[[
      name: loadSeason
      line: 134
      upvalues:
        makeTrunkTemplate (ref,  index: 1)
        loadDuelScene (ref,  index: 2)
        readLightingFolderProfile_upv_1 (copy, index: 3)
        tbl_upv_3 (copy, index: 4)
        SPRING_STAGE_LIGHTING_upv_1 (copy, index: 5)
        tbl_upv_4 (copy, index: 6)
    ]]
    local v9 = a1:FindFirstChild(("%*Trunks"):format(a2))
    local BackgroundMap_1 = a1:FindFirstChild("BackgroundMap")
    if BackgroundMap_1 ~= nil then
        BackgroundMap_1 = BackgroundMap_1:FindFirstChild(a2)
    end
    local Lighting_1 = a1:FindFirstChild("Lighting")
    if Lighting_1 ~= nil then
        Lighting_1 = Lighting_1:FindFirstChild(a2)
    end
    if v9 ~= nil and BackgroundMap_1 ~= nil and BackgroundMap_1:IsA("Model") and Lighting_1 ~= nil then
        local v10 = makeTrunkTemplate(v9:FindFirstChild("Trunk"))
        local v11 = makeTrunkTemplate(v9:FindFirstChild("LeftTrunk"))
        local v12 = v9:FindFirstChild("RightTrunk") or (v9:FindFirstChild("RightBranch"))
        local v13 = makeTrunkTemplate(v12)
        if v10 ~= nil and v11 ~= nil and v13 ~= nil then
            local tbl_7 = {}
            tbl_7.name = a2
            tbl_7.map = BackgroundMap_1
            tbl_7.trunkPlain = v10
            tbl_7.trunkLeft = v11
            tbl_7.trunkRight = v13
            tbl_7.trunkRoot = makeTrunkTemplate(v9:FindFirstChild("RootTrunk"))
            tbl_7.duelScene = loadDuelScene(a1, a2)
            tbl_7.lighting = readLightingFolderProfile_upv_1(Lighting_1, tbl_upv_3[a2], SPRING_STAGE_LIGHTING_upv_1)
            tbl_7.accents = tbl_upv_4[a2]
            return tbl_7
        end
        warn((("[Timberman] season %* is missing a trunk variant \226\128\148 skipping it"):format(a2)))
        return nil
    end
    warn((("[Timberman] season %* is missing its trunks/map/lighting \226\128\148 skipping it"):format(a2)))
    return nil
end
local function listNames_upv_1(a1)
    --[[
      name: listNames
      line: 191
    ]]
    local v14 = a1:GetChildren()
    local v15 = table.create(#v14)
    for key_1, value_2 in v14 do
        v15[key_1] = ("%*[%*]"):format(value_2.Name, value_2.ClassName)
    end
    if #v15 ~= 0 then
        return (table.concat(v15, ", "))
    end
    return "<none>"
end
local function worldYExtent_1(a1)
    --[[
      name: worldYExtent
      line: 206
    ]]
    local CFrame_1 = a1.CFrame
    return ((math.abs(CFrame_1.RightVector.Y) * a1.Size.X) + (math.abs(CFrame_1.UpVector.Y) * a1.Size.Y)) + (math.abs(CFrame_1.LookVector.Y) * a1.Size.Z)
end
local function findChildInsensitive_upv_1(a1, a2)
    --[[
      name: findChildInsensitive
      line: 177
    ]]
    local v16 = a1:FindFirstChild(a2)
    if v16 == nil then
        local v17 = string.lower(a2)
        for _, value_3 in a1:GetChildren() do
            if string.lower(value_3.Name) ~= v17 then
                continue
            end
            return value_3
        end
        return nil
    end
    return v16
end
local function resolveIndicator_upv_1(a1)
    --[[
      name: resolveIndicator
      line: 217
    ]]
    local Landtype1_1 = a1:FindFirstChild("Landtype1")
    if Landtype1_1 ~= nil then
        Landtype1_1 = Landtype1_1:FindFirstChild("Grass")
        if Landtype1_1 ~= nil then
            Landtype1_1 = Landtype1_1:FindFirstChild("TrunkIndicator")
        end
    end
    if Landtype1_1 ~= nil and Landtype1_1:IsA("BasePart") then
        return Landtype1_1
    end
    local v18 = a1:FindFirstChild("TrunkIndicator", true)
    if v18 ~= nil and v18:IsA("BasePart") then
        return v18
    end
    for _, value_4 in a1:GetDescendants() do
        if not (value_4:IsA("BasePart")) or string.find(string.lower(value_4.Name), "indicator", 1, true) == nil then
            continue
        end
        return value_4
    end
    return nil
end
loadDuelScene = function(a1, a2)
    --[[
      name: loadDuelScene
      line: 252
      upvalues:
        findChildInsensitive_upv_1 (copy, index: 1)
        listNames_upv_1 (copy, index: 2)
        resolveIndicator_upv_1 (copy, index: 3)
    ]]
    local v19 = findChildInsensitive_upv_1(a1, "DuelMap")
    if v19 ~= nil then
        local v20 = findChildInsensitive_upv_1(v19, ("%*Duel"):format(a2)) or (findChildInsensitive_upv_1(v19, a2))
        if v20 ~= nil and v20:IsA("Model") then
            local tbl_8 = {}
            local v21 = 0
            local v22 = nil
            for _, v23 in v20:GetChildren() do
                v22 = v23:IsA("Model") and (string.lower(v23.Name) == "half")
                if v22 == true then
                    v21 = v21 + 1
                    tbl_8[v21] = v23
                end
            end
            local v24 = tbl_8[1]
            local v25 = tbl_8[2]
            if #tbl_8 == 2 and v24 ~= nil then
                local v26 = nil
                if v25 ~= nil then
                    v26 = resolveIndicator_upv_1(v24)
                    local v27 = resolveIndicator_upv_1(v25)
                    if v26 ~= nil then
                        local v28 = nil
                        if v27 ~= nil then
                            local v23
                            if v26.Position.Z > v27.Position.Z then
                                v23 = v27
                            else
                                v23 = v26
                            end
                            if v23 ~= v26 then
                                v22 = v26
                            else
                                v22 = v27
                            end
                            v28 = v22.Position.Z - v23.Position.Z
                            if v28 >= 1 then
                                local v29 = v20:GetPivot()
                                local CFrame_2 = v23.CFrame
                                local v30 = v23.Position + Vector3.new(0, (((math.abs(CFrame_2.RightVector.Y) * v23.Size.X) + (math.abs(CFrame_2.UpVector.Y) * v23.Size.Y)) + (math.abs(CFrame_2.LookVector.Y) * v23.Size.Z)) / 2, 0)
                                local CFrame_3 = v22.CFrame
                                local v31 = v22.Position + Vector3.new(0, (((math.abs(CFrame_3.RightVector.Y) * v22.Size.X) + (math.abs(CFrame_3.UpVector.Y) * v22.Size.Y)) + (math.abs(CFrame_3.LookVector.Y) * v22.Size.Z)) / 2, 0)
                                print((("[Timberman] %* duel scene loaded: tree spacing %* studs"):format(v20.Name, string.format("%.1f", v28))))
                                local tbl_9 = {}
                                tbl_9.model = v20
                                tbl_9.anchorFromLeftIndicatorTop = CFrame.new(v30):Inverse() * v29
                                tbl_9.anchorFromRightIndicatorTop = CFrame.new(v31):Inverse() * v29
                                tbl_9.treeSpacing = v28
                                return tbl_9
                            end
                            warn((("[Timberman] %*'s two indicators sit on top of each other \226\128\148 using the solo map"):format(v20.Name)))
                            return nil
                        end
                    end
                    warn(("[Timberman] a %* Half has no indicator \226\128\148 the duel uses the solo map. "):format(v20.Name) .. ("Half A: %* | Half B: %*"):format(listNames_upv_1(v24), listNames_upv_1(v25)))
                    return nil
                end
            end
            warn(("[Timberman] %* needs exactly two 'Half' models \226\128\148 the duel uses the solo map. "):format(v20.Name) .. ("Children: %*"):format(listNames_upv_1(v20)))
        else
            warn(("[Timberman] DuelMap has no '%*Duel' Model \226\128\148 the duel uses the solo map. "):format(a2) .. ("DuelMap children: %*"):format(listNames_upv_1(v19)))
        end
    else
        warn(("[Timberman] no 'DuelMap' under %* \226\128\148 the duel uses the solo map. "):format(a1:GetFullName()) .. ("Children present: %*"):format(listNames_upv_1(a1)))
    end
    return nil
end
makeTrunkTemplate = function(a1)
    --[[
      name: makeTrunkTemplate
      line: 315
    ]]
    if a1 ~= nil then
        local v32 = nil
        if a1:IsA("Model") then
            v32 = a1:FindFirstChild("Trunk")
            local v33
            if v32 == nil then
                v33 = a1:FindFirstChild("Union")
            else
                v33 = v32:FindFirstChild("Union")
            end
            v33 = (v33) or a1:FindFirstChildWhichIsA("UnionOperation", true)
            if v33 ~= nil and v33:IsA("BasePart") then
                local tbl_10 = {}
                tbl_10.model = a1
                tbl_10.core = v33
                tbl_10.pivotFromCore = CFrame.new(v33.Position):Inverse() * a1:GetPivot()
                return tbl_10
            end
            return nil
        end
    end
    return nil
end
loadAnimationRig = function(a1)
    --[[
      name: loadAnimationRig
      line: 337
    ]]
    local AnimationRig_1 = a1:FindFirstChild("AnimationRig")
    if AnimationRig_1 ~= nil then
        local v34 = nil
        local tbl_11 = nil
        local v35 = nil
        local v36 = nil
        for _, value_5 in AnimationRig_1:GetChildren() do
            if not (value_5:IsA("Model")) then
                continue
            end
            v34 = value_5:FindFirstChild("AnimSaves")
            if v34 == nil then
                continue
            end
            v35 = v34:FindFirstChild("Right_Idle")
            v36 = v34:FindFirstChild("Right_Swing")
            if v35 == nil or not (v35:IsA("KeyframeSequence")) or v36 == nil or not (v36:IsA("KeyframeSequence")) then
                continue
            end
            tbl_11 = {}
            tbl_11.rig = value_5
            tbl_11.rightIdle = v35
            tbl_11.rightSwing = v36
            return tbl_11
        end
        warn("[Timberman] AnimationRig has no Model with Right_Idle + Right_Swing \226\128\148 using the static axe")
    end
    return nil
end
local tbl_12 = {}
tbl_12.loadTimbermanScenery = u1
tbl_12.TIMBERMAN_SEASON_NAMES = tbl_upv_1
return tbl_12