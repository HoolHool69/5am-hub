-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local setInterval_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "set-timeout", "out").setInterval
local makeSmoothPart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local RIVAL_SOURCE_PRIORITY_upv_1 = RuntimeLib_1.import(script, script.Parent, "rival-marker-types").RIVAL_SOURCE_PRIORITY
local avatarHeadshotUrl_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "avatar-url").avatarHeadshotUrl
local v1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v1.gameFrozenAtom
local pausedAtom_upv_1 = v1.pausedAtom
local applyNameBadges_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "name-badges").applyNameBadges
local formatNumber_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "format-number").formatNumber
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(235, 235, 240)
local tbl_upv_1 = {}
tbl_upv_1.friend = Color3.fromRGB(255, 196, 82)
tbl_upv_1.server = Color3.fromRGB(96, 205, 255)
tbl_upv_1.global = Color3.fromRGB(190, 150, 255)
local function headshotUrl_1(a1)
    --[[
      name: headshotUrl
      line: 33
      upvalues:
        avatarHeadshotUrl_upv_1 (copy, index: 1)
    ]]
    return avatarHeadshotUrl_upv_1(a1, 48)
end
local function linesPerSlot_1(a1)
    --[[
      name: linesPerSlot
      line: 41
    ]]
    if a1 ~= "badgeOnly" then
        if a1 ~= "marginTick" then
            return 1
        end
        return 2
    end
    return 0
end
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 63
    ]]
    return "RivalMarkerSystem"
end
local u3 = setmetatable(tbl_2, tbl_3)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 68
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u3)
    return v2:constructor(...) or v2
end
u3.constructor = function(a1, a2, a3, a4)
    --[[
      name: constructor
      line: 72
      upvalues:
        setInterval_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    a1.adapter = a3
    a1.slots = {}
    a1.clusters = {}
    a1.cachedMarginHalfSpan = -1
    a1.marginLeftCFrame = CFrame.identity
    a1.marginRightCFrame = CFrame.identity
    a1.badgeOffsetCFrame = CFrame.new(a3.badgeOffset)
    a1.postDropCFrame = CFrame.new(0, -a3.lineLength / 2, 0)
    if a3.style == "marginTick" and a3.marginHalfSpan == nil then
        warn("[RivalMarkerSystem] marginTick style registered without marginHalfSpan \226\128\148 ticks will overlap")
    end
    local v3 = Instance.new("Folder")
    v3.Name = "RivalMarkers"
    v3.Parent = a2.container
    for _ = 0, 5 do
        table.insert(a1.slots, (a1:buildSlot(v3)))
    end
    a4:Add(
        setInterval_upv_1(
            function()
                --[[
                  line: 92
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:refreshSelection()
            end,
            0.25
        )
    )
    a4:Add(
        RunService_upv_1.RenderStepped:Connect(
            function()
                --[[
                  line: 95
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onRenderStep()
            end
        )
    )
end
u3.setEntries = function(a1, a2)
    --[[
      name: setEntries
      line: 99
      upvalues:
        RIVAL_SOURCE_PRIORITY_upv_1 (copy, index: 1)
    ]]
    local tbl_4 = {}
    for v4, value_1 in a2 do
        table.insert(tbl_4, {studs = a1.adapter.scoreToStuds(value_1.score), entry = value_1})
    end
    table.sort(
        tbl_4,
        function(a3, a4)
            --[[
              line: 108
            ]]
            return a3.studs < a4.studs
        end
    )
    local tbl_5 = {}
    local v5 = 0
    while true do
        local v6, v7 = nil, nil
        if v5 >= #tbl_4 then
            break
        end
        local v8 = tbl_4[v5 + 1]
        local value_1 = 1
        local v9 = v5 + 1
        local v4
        v4 = v8
        while v9 < #tbl_4 and tbl_4[v9 + 1].studs - v8.studs <= a1.adapter.clusterStuds do
            local v10 = tbl_4[v9 + 1]
            v6 = RIVAL_SOURCE_PRIORITY_upv_1[v10.entry.source]
            v7 = RIVAL_SOURCE_PRIORITY_upv_1[v4.entry.source]
            if v7 < v6 then
                v4 = v10
                value_1 = value_1 + 1
                v9 = v9 + 1
                continue
            end
            if v6 == v7 and v4.entry.score < v10.entry.score then
                v4 = v10
            end
            value_1 = value_1 + 1
            v9 = v9 + 1
        end
        table.insert(tbl_5, {studs = v4.studs, entry = v4.entry, clusterSize = value_1})
        v5 = v9
    end
    a1.clusters = tbl_5
    a1:refreshSelection()
end
u3.refreshSelection = function(a1)
    --[[
      name: refreshSelection
      line: 141
    ]]
    local v11 = a1.adapter.getProgressStuds()
    local tbl_6 = {}
    local tbl_7 = {}
    for _, value_2 in a1.clusters do
        if value_2.studs < v11 - a1.adapter.visibleBehindStuds then
            continue
        end
        if v11 + a1.adapter.visibleAheadStuds < value_2.studs then
            break
        end
        if v11 > value_2.studs then
            table.insert(tbl_7, value_2)
        else
            table.insert(tbl_6, value_2)
        end
    end
    table.sort(
        tbl_7,
        function(a2, a3)
            --[[
              line: 160
            ]]
            return a3.studs < a2.studs
        end
    )
    local tbl_8 = {}
    for _, value_3 in tbl_6 do
        if #tbl_8 >= 6 then
            break
        else
            table.insert(tbl_8, value_3)
        end
    end
    for _, value_4 in tbl_7 do
        if #tbl_8 >= 6 then
            break
        else
            table.insert(tbl_8, value_4)
        end
    end
    a1:assignSlots(tbl_8)
end
u3.assignSlots = function(a1, a2)
    --[[
      name: assignSlots
      line: 178
    ]]
    local tbl_9 = {}
    local v12 = nil
    local v13 = nil
    local _ = nil
    local v18 = nil
    for v19, value_5 in a2 do
        tbl_9[value_5.entry.userId] = value_5
    end
    v12 = {}
    v13 = {}
    local v14 = nil
    local v15 = nil
    for v20, value_6 in a1.slots do
        v14 = value_6.current
        if v14 == nil then
            table.insert(v12, value_6)
            continue
        end
        v15 = tbl_9[v14.entry.userId]
        if v15 == nil then
            a1:hideSlot(value_6)
            table.insert(v12, value_6)
        else
            a1:applyMarker(value_6, v15, false)
            v13[v14.entry.userId] = true
        end
    end
    local v16 = nil
    local v17 = nil
    for v21, value_7 in a2 do
        if v13[value_7.entry.userId] ~= nil then
            continue
        end
        v17 = #v12
        v16 = v12[v17]
        v12[v17] = nil
        if v16 == nil then
            break
        else
            a1:applyMarker(v16, value_7, true)
        end
    end
end
u3.applyMarker = function(a1, a2, a3, a4)
    --[[
      name: applyMarker
      line: 218
      upvalues:
        avatarHeadshotUrl_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
        applyNameBadges_upv_1 (copy, index: 3)
        formatNumber_upv_1 (copy, index: 4)
    ]]
    a2.current = a3
    local entry_1 = a3.entry
    if a4 then
        a2.headshot.Image = avatarHeadshotUrl_upv_1(entry_1.userId, 48)
    end
    local v18 = ((a3.clusterSize <= 1) and "") or ((" +%*"):format(a3.clusterSize - 1))
    if a2.nameLabel == nil then
        a2.scoreLabel.Text = ("%*%*"):format(formatNumber_upv_1(entry_1.score), v18)
        a2.scoreLabel.TextColor3 = tbl_upv_1[entry_1.source]
    else
        a2.nameLabel.Text = ("%*%*"):format(entry_1.username, v18)
        a2.nameLabel.TextColor3 = tbl_upv_1[entry_1.source]
        applyNameBadges_upv_1(a2.nameLabel, entry_1.userId)
        a2.scoreLabel.Text = formatNumber_upv_1(entry_1.score)
    end
    for _, value_8 in a2.lines do
        value_8.Color = tbl_upv_1[entry_1.source]
    end
end
u3.hideSlot = function(a1, a2)
    --[[
      name: hideSlot
      line: 240
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.current = nil
    a2.billboard.Enabled = false
    a2.badgeAnchor.CFrame = u1
    for _, value_9 in a2.lines do
        value_9.Transparency = 1
        value_9.CFrame = u1
    end
end
u3.onRenderStep = function(a1)
    --[[
      name: onRenderStep
      line: 249
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    if pausedAtom_upv_1() then
        return nil
    else
        local v19 = nil
        if gameFrozenAtom_upv_1() then
            return nil
        else
            v19 = a1.adapter.style
            if v19 == "marginTick" then
                a1:refreshMarginOffsets()
            end
            local v20 = a1.adapter.getProgressStuds()
            local v21 = nil
            local v22 = nil
            for _, value_10 in a1.slots do
                v22 = value_10.current
                if v22 == nil then
                    continue
                end
                v21 = a1.adapter.poseMarker(v22.studs)
                if v21 ~= nil then
                    if v19 == "badgeOnly" then
                        value_10.badgeAnchor.CFrame = v21 * a1.badgeOffsetCFrame
                    elseif v19 == "sideLine" then
                        value_10.lines[1].CFrame = v21
                        value_10.badgeAnchor.CFrame = v21 * a1.badgeOffsetCFrame
                    elseif v19 ~= "edgePost" then
                        local v23 = v21 * a1.marginLeftCFrame
                        value_10.lines[1].CFrame = v23
                        value_10.lines[2].CFrame = v21 * a1.marginRightCFrame
                        value_10.badgeAnchor.CFrame = v23 * a1.badgeOffsetCFrame
                    else
                        value_10.lines[1].CFrame = v21 * a1.postDropCFrame
                        value_10.badgeAnchor.CFrame = v21 * a1.badgeOffsetCFrame
                    end
                    local v24 = math.clamp(math.abs(v22.studs - v20) / a1.adapter.fadeNearStuds, 0, 1)
                    for v25, value_11 in value_10.lines do
                        value_11.Transparency = 1 - (v24 * 0.65)
                    end
                    value_10.billboard.Enabled = v24 > 0.15
                    value_10.headshot.ImageTransparency = 1 - v24
                    if value_10.nameLabel ~= nil then
                        value_10.nameLabel.TextTransparency = 1 - v24
                    end
                    value_10.scoreLabel.TextTransparency = 1 - v24
                else
                    for v26, value_12 in value_10.lines do
                        value_12.Transparency = 1
                    end
                    value_10.billboard.Enabled = false
                end
            end
        end
    end
end
u3.refreshMarginOffsets = function(a1)
    --[[
      name: refreshMarginOffsets
      line: 306
    ]]
    local v25 = ((a1.adapter.marginHalfSpan == nil) and 0) or (a1.adapter.marginHalfSpan())
    if v25 ~= a1.cachedMarginHalfSpan then
        a1.cachedMarginHalfSpan = v25
        a1.marginLeftCFrame = CFrame.new(-v25, 0, 0)
        a1.marginRightCFrame = CFrame.new(v25, 0, 0)
    else
        return nil
    end
end
u3.buildSlot = function(a1, a2)
    --[[
      name: buildSlot
      line: 315
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    local v26 = ((a1.adapter.lineThickness == nil) and 0.18) or (a1.adapter.lineThickness)
    local v27
    if a1.adapter.style ~= "edgePost" then
        v27 = Vector3.new(a1.adapter.lineLength, v26, v26)
    else
        v27 = Vector3.new(v26, a1.adapter.lineLength, v26)
    end
    local tbl_10 = {}
    local v28 = 0
    local v29 = false
    v29, v28 = v29, v28
    while true do
        if v29 then
            v28 = v28 + 1
        else
            v29 = true
        end
        local style_1 = a1.adapter.style
        if v28 >= (((style_1 == "badgeOnly") and 0) or (((style_1 ~= "marginTick") and 1) or 2)) then
            break
        end
        local v30 = makeSmoothPart_upv_1(a2)
        v30.Name = "RivalLine"
        v30.Material = Enum.Material.SmoothPlastic
        v30.Transparency = 1
        v30.Size = v27
        v30.CFrame = u1
        table.insert(tbl_10, v30)
    end
    v28 = makeSmoothPart_upv_1(a2)
    v28.Name = "RivalBadgeAnchor"
    v28.Transparency = 1
    v28.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
    v28.CFrame = u1
    v29 = ((a1.adapter.badgeScale == nil) and 1) or (a1.adapter.badgeScale)
    local v31 = a1.adapter.badgeLayout == "scoreOnly"
    local v32
    if v31 then
        v32 = 96
    else
        v32 = 150
    end
    local v33 = (v31 and 34) or 40
    local v34 = Instance.new("BillboardGui")
    v34.Name = "RivalBadge"
    v34.AlwaysOnTop = true
    v34.LightInfluence = 0
    v34.Size = UDim2.new(0, math.round(v32 * v29), 0, math.round(v33 * v29))
    v34.MaxDistance = 400
    v34.Enabled = false
    v34.Adornee = v28
    if a1.adapter.style == "marginTick" then
        v34.SizeOffset = Vector2.new(0.5, 0)
    end
    v34.Parent = v28
    local v35 = math.round(((v31 and 28) or 32) * v29)
    local v36 = Instance.new("ImageLabel")
    v36.Name = "Headshot"
    v36.BackgroundTransparency = 1
    v36.Position = UDim2.new(0, math.round(2 * v29), 0.5, -math.round(v35 / 2))
    v36.Size = UDim2.new(0, v35, 0, v35)
    v36.Parent = v34
    local v37 = Instance.new("UICorner")
    v37.CornerRadius = UDim.new(1, 0)
    v37.Parent = v36
    local v38 = math.round(((v31 and 34) or 40) * v29)
    local v39
    v39 = nil
    if not (v31) then
        v39 = Instance.new("TextLabel")
        v39.Name = "RivalName"
        v39.BackgroundTransparency = 1
        v39.Font = Enum.Font.GothamBold
        v39.TextSize = math.round(14 * v29)
        v39.TextXAlignment = Enum.TextXAlignment.Left
        v39.TextTruncate = Enum.TextTruncate.AtEnd
        v39.TextStrokeTransparency = 0.6
        v39.Position = UDim2.new(0, v38, 0, math.round(3 * v29))
        v39.Size = UDim2.new(1, -(v38 + 2), 0, math.round(17 * v29))
        v39.Parent = v34
    end
    local v40 = Instance.new("TextLabel")
    v40.Name = "RivalScore"
    v40.BackgroundTransparency = 1
    local v41
    if v31 then
        v41 = Enum.Font.GothamBold
    else
        v41 = Enum.Font.GothamMedium
    end
    v40.Font = v41
    v40.TextSize = math.round(((v31 and 15) or 13) * v29)
    v40.TextXAlignment = Enum.TextXAlignment.Left
    v40.TextColor3 = u2
    v40.TextStrokeTransparency = 0.6
    if v31 then
        v40.Position = UDim2.new(0, v38, 0, 0)
        v40.Size = UDim2.new(1, -(v38 + 2), 1, 0)
    else
        v40.Position = UDim2.new(0, v38, 0, math.round(20 * v29))
        v40.Size = UDim2.new(1, -(v38 + 2), 0, math.round(16 * v29))
    end
    v40.Parent = v34
    local tbl_11 = {}
    tbl_11.lines = tbl_10
    tbl_11.badgeAnchor = v28
    tbl_11.billboard = v34
    tbl_11.headshot = v36
    tbl_11.nameLabel = v39
    tbl_11.scoreLabel = v40
    return tbl_11
end
local tbl_12 = {}
tbl_12.RivalMarkerSystem = u3
return tbl_12