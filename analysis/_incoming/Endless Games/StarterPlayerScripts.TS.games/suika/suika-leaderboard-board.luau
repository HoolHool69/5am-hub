-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Players_upv_1 = v1.Players
local RunService_upv_1 = v1.RunService
local Workspace_upv_1 = v1.Workspace
local makeStagePart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeStagePart
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "binding")
local bindAtom_upv_1 = v2.bindAtom
local onActivated_upv_1 = v2.onActivated
local createBoardPendingLine_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "board-pending-line").createBoardPendingLine
local createInviteFriendsChip_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "invite-friends-button").createInviteFriendsChip
local cloneLeaderboardTabs_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "leaderboard-tabs").cloneLeaderboardTabs
local applyNameBadges_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "name-badges").applyNameBadges
local v3 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "views", "vote-style")
local applyVoteStyle_upv_1 = v3.applyVoteStyle
local captureVoteStyle_upv_1 = v3.captureVoteStyle
local v4 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "game-invite")
local canInviteFriendsAtom_upv_1 = v4.canInviteFriendsAtom
local promptInviteFriends_upv_1 = v4.promptInviteFriends
local refreshCanInviteFriends_upv_1 = v4.refreshCanInviteFriends
local playUiSound_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "ui", "ui-sounds").playUiSound
local formatNumber_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "format-number").formatNumber
local SUIKA_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "suika-config").SUIKA_CONFIG
local function truncateName_1(a1)
    --[[
      name: truncateName
      line: 41
    ]]
    local v5 = utf8.len(a1)
    if v5 ~= false then
        local v6 = nil
        if v5 > 12 then
            v6 = utf8.offset(a1, 12)
            if v6 ~= nil then
                return (("%*\226\128\166"):format(string.sub(a1, 1, v6 - 1)))
            end
            return a1
        end
    end
    return a1
end
local u1 = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(38, 104, 56)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 236, 162))})
local function tabSpacerHeight_1(a1, a2)
    --[[
      name: tabSpacerHeight
      line: 125
    ]]
    return ((0.04500000000000004 * a1) + (a2 * 2)) + (0.012 * a1)
end
local pinListHeights = nil
local makeStatusLabel = nil
local harvestHeaderLabels = nil
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 176
    ]]
    return "AuthoredLeaderboardBoard"
end
local u3 = setmetatable(tbl_1, tbl_2)
u3.__index = u3
u3.new = function(...)
    --[[
      name: new
      line: 181
      upvalues:
        u3 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u3)
    return v7:constructor(...) or v7
end
u3.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 185
      upvalues:
        createBoardPendingLine_upv_1 (copy, index: 1)
    ]]
    a1.rows = {}
    a1.populateGeneration = 0
    a1.scrollVelocity = 0
    a1.coasting = false
    a1.lastScrollAt = 0
    a1.canInvite = true
    a1.inviteTabActive = false
    a1.scroll = a2.scroll
    a1.templates = a2.templates
    a1.status = a2.status
    a1.pending = createBoardPendingLine_upv_1(a2.scroll, a2.templates.generic)
    a1.header = a2.header
    a1.mount = a2.mount
    a1.face = a2.face
    a1.pixelsPerStud = a2.pixelsPerStud
    a1.canvasWidth = a2.canvasWidth
    a1.canvasHeight = a2.canvasHeight
    local v8 = RaycastParams.new()
    v8.FilterType = Enum.RaycastFilterType.Include
    v8.FilterDescendantsInstances = {a2.mount}
    v8.IgnoreWater = true
    a1.raycastParams = v8
end
local function u2(a1, a2, a3, a4, a5)
    --[[
      name: adopt
      line: 209
      upvalues:
        u2 (ref,  index: 1)
        pinListHeights (ref,  index: 2)
        u3 (ref,  index: 3)
        makeStatusLabel (ref,  index: 4)
        harvestHeaderLabels (ref,  index: 5)
        RunService_upv_1 (copy, index: 6)
    ]]
    local v9 = a3:FindFirstChildOfClass("SurfaceGui")
    local v10, v11 = nil, nil
    if v9 ~= nil then
        v10 = v9:FindFirstChild("MainFrame")
        local v12
        if v10 == nil then
            v12 = v10
        else
            v12 = v10:FindFirstChild("ScrollingFrame")
        end
        local v13
        if v10 == nil then
            v13 = v10
        else
            v13 = v10:IsA("Frame")
        end
        v11 = not v13
        local v15 = nil
        if not (v11) then
            if v12 == nil then
                v15 = v12
            else
                v15 = v15:IsA("ScrollingFrame")
            end
            v11 = not v15
        end
        if v11 then
            warn("[Suika] authored board is missing MainFrame/ScrollingFrame \226\128\148 building the procedural board")
        else
            v15 = u2(v12)
            if v15 ~= nil then
                local v16 = Instance.new("SurfaceGui")
                v16.Face = a5
                v16.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
                v16.PixelsPerStud = v9.PixelsPerStud
                v16.Parent = a4
                v16.Active = false
                v16.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v10.Parent = v16
                v9:Destroy()
                local v17 = v16.PixelsPerStud * a4.Size.Y
                pinListHeights(v12, v15, (v12.Size.Y.Scale * v17) + v12.Size.Y.Offset)
                local u4 = u3.new({canvasWidth = v16.PixelsPerStud * a4.Size.X, scroll = v12, templates = v15, status = makeStatusLabel(v10, v15.generic), header = harvestHeaderLabels(v10), mount = a4, face = a5, pixelsPerStud = v16.PixelsPerStud, canvasHeight = v17})
                a2:Add(
                    RunService_upv_1.RenderStepped:Connect(
                        function(a6)
                            --[[
                              line: 281
                              upvalues:
                                u4 (copy, index: 1)
                            ]]
                            return u4:stepCoast(a6)
                        end
                    ),
                    "Disconnect"
                )
                return u4
            end
        end
    else
        warn("[Suika] LeaderboardPlane carries no SurfaceGui \226\128\148 building the procedural board")
    end
    return nil
end
u3.adopt = u2
u3.populate = function(a1, a2, a3)
    --[[
      name: populate
      line: 286
    ]]
    local entries_1 = a2.entries
    a1.populateGeneration = a1.populateGeneration + 1
    local populateGeneration_upv_1 = a1.populateGeneration
    local u5
    if #entries_1 ~= 0 then
        a1.status.Visible = false
        u5 = math.min(#entries_1, 200)
        a1:growRowsTo((math.min(u5, 25)))
        a1:paint(a2, u5)
        if u5 > #a1.rows then
            task.spawn(
                function()
                    --[[
                      line: 305
                      upvalues:
                        a1 (copy, index: 1)
                        u5 (copy, index: 2)
                        populateGeneration_upv_1 (copy, index: 3)
                        a2 (copy, index: 4)
                    ]]
                    while #a1.rows < u5 do
                        task.wait()
                        if populateGeneration_upv_1 == a1.populateGeneration and a1.scroll.Parent ~= nil then
                            a1:growRowsTo((math.min(#a1.rows + 25, u5)))
                            a1:paint(a2, u5)
                            continue
                        end
                        return nil
                    end
                end
            )
        else
            return nil
        end
    else
        a1:showStatus((a3 and "No scores yet") or "Loading\226\128\166")
        return nil
    end
end
u3.paint = function(a1, a2, a3)
    --[[
      name: paint
      line: 316
      upvalues:
        Players_upv_1 (copy, index: 1)
        formatNumber_upv_1 (copy, index: 2)
        applyNameBadges_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local entries_2 = a2.entries
    local UserId_1 = Players_upv_1.LocalPlayer.UserId
    local v18, v19 = nil, nil
    for n_1 = 0, #a1.rows - 1 do
        local v20 = a1.rows[n_1 + 1]
        local v21 = entries_2[n_1 + 1]
        if a3 <= n_1 or v21 == nil then
            v20.frame.Visible = false
            continue
        end
        local username_1 = v21.username
        local v22
        v22 = utf8.len(username_1)
        if v22 == false or v22 <= 12 then
            v18 = username_1
        else
            local v23
            v23 = utf8.offset(username_1, 12)
            if v23 ~= nil then
                v18 = ("%*\226\128\166"):format(string.sub(username_1, 1, v23 - 1))
            else
                v18 = username_1
            end
        end
        v20.frame.Visible = true
        v20.name.Text = v18
        v20.nameShadow.Text = v18
        v20.score.Text = formatNumber_upv_1(v21.score)
        applyNameBadges_upv_1(v20.name, v21.userId)
        if v20.rank ~= nil then
            v20.rank.Text = ("#%*"):format(n_1 + 1)
        end
        v19 = false
        if v21.userId == UserId_1 then
            v19 = v20.rank ~= nil
        end
        if v20.gradient == nil or v20.baseGradient == nil then
            continue
        end
        v22 = v20.gradient
        local v24
        if v19 then
            v24 = u1
        else
            v24 = v20.baseGradient
        end
        v22.Color = v24
    end
end
u3.showStatus = function(a1, a2)
    --[[
      name: showStatus
      line: 342
    ]]
    a1.status.Text = a2
    a1.status.Visible = true
    a1.pending.Visible = false
    for _, value_1 in a1.rows do
        value_1.frame.Visible = false
    end
end
u3.setPendingVisible = function(a1, a2)
    --[[
      name: setPendingVisible
      line: 351
    ]]
    a1.pending.Visible = a2
end
u3.scrollBy = function(a1, a2)
    --[[
      name: scrollBy
      line: 354
    ]]
    local v25 = os.clock()
    local v26 = v25 - a1.lastScrollAt
    a1.lastScrollAt = v25
    if v26 > 0 and v26 <= 0.1 then
        a1.scrollVelocity = a2 / v26
    end
    a1:applyScroll(a2)
end
u3.scrollByWheel = function(a1, a2)
    --[[
      name: scrollByWheel
      line: 366
    ]]
    a1.coasting = false
    a1.scrollVelocity = 0
    a1:applyScroll((a2 * 0.3) * a1.scroll.AbsoluteWindowSize.Y)
end
u3.grabScroll = function(a1)
    --[[
      name: grabScroll
      line: 374
    ]]
    a1.coasting = false
    a1.scrollVelocity = 0
    a1.lastScrollAt = os.clock()
end
u3.releaseScroll = function(a1)
    --[[
      name: releaseScroll
      line: 380
    ]]
    a1.coasting = math.abs(a1.scrollVelocity) >= 25
    if (a1.coasting) then
        return
    end
    a1.scrollVelocity = 0
end
u3.stepCoast = function(a1, a2)
    --[[
      name: stepCoast
      line: 386
    ]]
    local v28 = nil
    if a1.coasting then
        v28 = a1:applyScroll(a1.scrollVelocity * a2)
        a1.scrollVelocity = a1.scrollVelocity * math.pow(0.1, a2)
        if not (v28) or math.abs(a1.scrollVelocity) < 25 then
            a1.coasting = false
            a1.scrollVelocity = 0
        end
    else
        return nil
    end
end
u3.resetScroll = function(a1)
    --[[
      name: resetScroll
      line: 398
    ]]
    a1.coasting = false
    a1.scrollVelocity = 0
    a1.scroll.CanvasPosition = Vector2.new(a1.scroll.CanvasPosition.X, 0)
end
u3.applyHeader = function(a1, a2)
    --[[
      name: applyHeader
      line: 403
    ]]
    local v29 = a2 == "friends"
    for _, value_2 in a1.header.titles do
        value_2.Text = (v29 and "FRIENDS") or (a1.header.authoredTitle)
    end
    if a1.header.subtitle == nil then
        return
    end
    a1.header.subtitle.Text = (v29 and "YOUR FRIENDS, ALL TIME") or (a1.header.authoredSubtitle)
end
u3.applyScroll = function(a1, a2)
    --[[
      name: applyScroll
      line: 412
    ]]
    local v30 = math.max(a1.scroll.AbsoluteCanvasSize.Y - a1.scroll.AbsoluteWindowSize.Y, 0)
    local CanvasPosition_1 = a1.scroll.CanvasPosition
    local v31 = math.clamp(CanvasPosition_1.Y + a2, 0, v30)
    if v31 ~= CanvasPosition_1.Y then
        a1.scroll.CanvasPosition = Vector2.new(CanvasPosition_1.X, v31)
        return true
    end
    return false
end
u3.mountTabs = function(a1, a2, a3)
    --[[
      name: mountTabs
      line: 424
      upvalues:
        cloneLeaderboardTabs_upv_1 (copy, index: 1)
        createInviteFriendsChip_upv_1 (copy, index: 2)
        refreshCanInviteFriends_upv_1 (copy, index: 3)
        bindAtom_upv_1 (copy, index: 4)
        canInviteFriendsAtom_upv_1 (copy, index: 5)
        onActivated_upv_1 (copy, index: 6)
        playUiSound_upv_1 (copy, index: 7)
        promptInviteFriends_upv_1 (copy, index: 8)
        captureVoteStyle_upv_1 (copy, index: 9)
    ]]
    local v32 = nil
    if a1.tabStyles == nil then
        v32 = cloneLeaderboardTabs_upv_1()
        local v33 = nil
        if v32 ~= nil then
            local v34 = Instance.new("SurfaceGui")
            v34.Name = "BoardTabs"
            v34.Face = a1.face
            v34.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
            v34.PixelsPerStud = a1.pixelsPerStud
            v34.Active = true
            v34.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            v34.ZOffset = 0.05
            v34.Parent = a1.mount
            a2:Add(v34, "Destroy")
            local v35 = 0.95 * a1.canvasWidth
            local v36 = v35 / 7.311030182521586
            v32.list.AnchorPoint = Vector2.new(0.5, 1)
            v32.list.Position = UDim2.fromScale(0.5, 0.955)
            v32.list.Size = UDim2.new(0, v35, 0, v36)
            v32.list.Parent = v34
            local v37 = Instance.new("Frame")
            v37.Name = "TabBarSpacer"
            v37.BackgroundTransparency = 1
            v37.BorderSizePixel = 0
            v37.LayoutOrder = 2e+09
            local canvasHeight_1 = a1.canvasHeight
            v37.Size = UDim2.new(0.99, 0, 0, ((0.04500000000000004 * canvasHeight_1) + (v36 * 2)) + (0.012 * canvasHeight_1))
            v37.Parent = a1.scroll
            v33 = createInviteFriendsChip_upv_1(a1.templates.generic)
            if v33 ~= nil then
                v33.AnchorPoint = Vector2.new(0.5, 1)
                v33.Position = UDim2.fromScale(0.5, (0.955 - (v36 / a1.canvasHeight)) - 0.006)
                v33.Size = UDim2.new(0, v35, 0, v36)
                v33.Visible = false
                v33.Parent = v34
                a1.inviteButton = v33
                refreshCanInviteFriends_upv_1()
                bindAtom_upv_1(
                    a2,
                    canInviteFriendsAtom_upv_1,
                    function(a4)
                        --[[
                          line: 478
                          upvalues:
                            a1 (copy, index: 1)
                        ]]
                        a1.canInvite = a4
                        a1:applyInviteVisibility()
                    end
                )
                onActivated_upv_1(
                    a2,
                    v33,
                    function()
                        --[[
                          line: 482
                          upvalues:
                            playUiSound_upv_1 (copy, index: 1)
                            promptInviteFriends_upv_1 (copy, index: 2)
                        ]]
                        playUiSound_upv_1("uiTap", {})
                        promptInviteFriends_upv_1()
                    end
                )
            end
            a1.tabStyles = {top200 = captureVoteStyle_upv_1(v32.top200), friends = captureVoteStyle_upv_1(v32.friends)}
            onActivated_upv_1(
                a2,
                v32.top200,
                function()
                    --[[
                      line: 493
                      upvalues:
                        playUiSound_upv_1 (copy, index: 1)
                        a3 (copy, index: 2)
                    ]]
                    playUiSound_upv_1("uiTap", {})
                    a3("top200")
                end
            )
            onActivated_upv_1(
                a2,
                v32.friends,
                function()
                    --[[
                      line: 499
                      upvalues:
                        playUiSound_upv_1 (copy, index: 1)
                        a3 (copy, index: 2)
                    ]]
                    playUiSound_upv_1("uiTap", {})
                    a3("friends")
                end
            )
            return true
        end
        return false
    end
    return true
end
u3.showTab = function(a1, a2)
    --[[
      name: showTab
      line: 507
      upvalues:
        applyVoteStyle_upv_1 (copy, index: 1)
    ]]
    a1.inviteTabActive = a2 == "friends"
    a1:applyInviteVisibility()
    a1:applyHeader(a2)
    local tabStyles_1 = a1.tabStyles
    if tabStyles_1 ~= nil then
        applyVoteStyle_upv_1(tabStyles_1.top200, a2 == "top200")
        applyVoteStyle_upv_1(tabStyles_1.friends, a2 == "friends")
    else
        return nil
    end
end
u3.applyInviteVisibility = function(a1)
    --[[
      name: applyInviteVisibility
      line: 518
    ]]
    if a1.inviteButton ~= nil then
        a1.inviteButton.Visible = a1.canInvite and (a1.inviteTabActive)
    else
        return nil
    end
end
u3.isScreenPointOver = function(a1, a2, a3)
    --[[
      name: isScreenPointOver
      line: 524
      upvalues:
        Workspace_upv_1 (copy, index: 1)
    ]]
    local v38 = a2:ScreenPointToRay(a3.X, a3.Y)
    local v39 = Workspace_upv_1:Raycast(v38.Origin, v38.Direction * 1000, a1.raycastParams) ~= nil
    return v39
end
u3.growRowsTo = function(a1, a2)
    --[[
      name: growRowsTo
      line: 531
    ]]
    local v40 = #a1.rows
    local v41 = false
    local v42, _, v43, v44, v45, v45 = nil, nil, nil, nil, nil, nil
    local v46 = nil
    if v41 then
        v40 = v40 + 1
    else
        v41 = true
    end
    local v47 = nil
    if v40 < a2 then
        local v48 = v40 + 1
        v46 = a1:templateForRank(v48):Clone()
        v46.Name = ("Row%*"):format(v48)
        v46.LayoutOrder = v48
        v46.Visible = false
        v46.Parent = a1.scroll
        v47 = v46:FindFirstChild("PlayerName")
        local PlayerNameBackground_1 = v46:FindFirstChild("PlayerNameBackground")
        local ScoreText_1 = v46:FindFirstChild("ScoreText")
        local v49
        if v47 == nil then
            v49 = v47
        else
            v49 = v47:IsA("TextLabel")
        end
        v44 = not v49
        if not (v44) then
            if PlayerNameBackground_1 == nil then
                v42 = PlayerNameBackground_1
            else
                v42 = PlayerNameBackground_1:IsA("TextLabel")
            end
            v44 = not v42
            if not v44 then
                if ScoreText_1 == nil then
                    v43 = ScoreText_1
                else
                    v43 = ScoreText_1:IsA("TextLabel")
                end
                v44 = not v43
            end
        end
        if v44 then
            v46:Destroy()
            return nil
        else
            v42 = v46:FindFirstChild("Ranking")
            v43 = v46:FindFirstChildOfClass("UIGradient")
            local rows_1 = a1.rows
            local tbl_3 = {}
            tbl_3.frame = v46
            tbl_3.name = v47
            tbl_3.nameShadow = PlayerNameBackground_1
            tbl_3.score = ScoreText_1
            local v50
            if v42 == nil then
                v50 = v42
            else
                v50 = v42:IsA("TextLabel")
            end
            if v50 ~= true then
                v45 = nil
            else
                v45 = v42
            end
            tbl_3.rank = v45
            tbl_3.gradient = v43
            if v43 == nil then
                v45 = v43
            else
                v45 = v43.Color
            end
            tbl_3.baseGradient = v45
            table.insert(rows_1, tbl_3)
        end
    end
end
u3.templateForRank = function(a1, a2)
    --[[
      name: templateForRank
      line: 603
    ]]
    if a2 ~= 1 then
        if a2 ~= 2 then
            if a2 ~= 3 then
                return a1.templates.generic
            end
            return a1.templates.third
        end
        return a1.templates.second
    end
    return a1.templates.first
end
u2 = function(a1)
    --[[
      name: harvestTemplates
      line: 622
    ]]
    local FirstTemplate_1 = a1:FindFirstChild("FirstTemplate")
    local SecondTemplate_1 = a1:FindFirstChild("SecondTemplate")
    local ThirdTemplate_1 = a1:FindFirstChild("ThirdTemplate")
    local Template_1 = a1:FindFirstChild("Template")
    local v51
    if FirstTemplate_1 == nil then
        v51 = FirstTemplate_1
    else
        v51 = FirstTemplate_1:IsA("Frame")
    end
    local v52 = not v51
    if not (v52) then
        local v53
        if SecondTemplate_1 == nil then
            v53 = SecondTemplate_1
        else
            v53 = SecondTemplate_1:IsA("Frame")
        end
        v52 = not v53
        if not v52 then
            local v54
            if ThirdTemplate_1 == nil then
                v54 = ThirdTemplate_1
            else
                v54 = ThirdTemplate_1:IsA("Frame")
            end
            v52 = not v54
            if not v52 then
                local v55
                if Template_1 == nil then
                    v55 = Template_1
                else
                    v55 = Template_1:IsA("Frame")
                end
                v52 = not v55
            end
        end
    end
    if v52 then
        warn("[Suika] authored board is missing a row template (FirstTemplate/SecondTemplate/ThirdTemplate/Template) \226\128\148 building the procedural board")
    else
        if Template_1:FindFirstChild("Ranking") ~= nil and FirstTemplate_1:FindFirstChild("ScoreText") ~= nil then
            local tbl_4 = {}
            tbl_4.first = FirstTemplate_1:Clone()
            tbl_4.second = SecondTemplate_1:Clone()
            tbl_4.third = ThirdTemplate_1:Clone()
            tbl_4.generic = Template_1:Clone()
            for _, value_3 in a1:GetChildren() do
                if not (value_3:IsA("Frame")) or value_3.Name == "TopPadding" then
                    continue
                end
                if value_3.Name ~= "BottomPadding" then
                    value_3:Destroy()
                end
            end
            return tbl_4
        end
        warn("[Suika] authored row templates are missing Ranking/ScoreText \226\128\148 building the procedural board")
    end
    return nil
end
pinListHeights = function(a1, a2, a3)
    --[[
      name: pinListHeights
      line: 689
    ]]
    local v56 = nil
    for _, value_4 in {"TopPadding", "BottomPadding"} do
        v56 = a1:FindFirstChild(value_4)
        if v56 == nil then
            continue
        end
        if v56:IsA("Frame") then
            local Size_1 = v56.Size
            v56.Size = UDim2.new(Size_1.X.Scale, Size_1.X.Offset, 0, (Size_1.Y.Scale * a3) + Size_1.Y.Offset)
        end
    end
    local v57 = a1:FindFirstChildOfClass("UIListLayout")
    if v57 ~= nil then
        v57.Padding = UDim.new(0, (v57.Padding.Scale * a3) + v57.Padding.Offset)
    end
    local Size_2 = nil
    for _, value_5 in {a2.first, a2.second, a2.third, a2.generic} do
        Size_2 = value_5.Size
        value_5.Size = UDim2.new(Size_2.X.Scale, Size_2.X.Offset, 0, (Size_2.Y.Scale * a3) + Size_2.Y.Offset)
    end
end
harvestHeaderLabels = function(a1)
    --[[
      name: harvestHeaderLabels
      line: 724
    ]]
    local Header_1 = a1:FindFirstChild("Header")
    local tbl_5 = {}
    local v58 = nil
    for v59, v60 in {"Header", "HeaderBg"} do
        if Header_1 == nil then
            v58 = Header_1
        else
            v58 = Header_1:FindFirstChild(v60)
        end
        if v58 == nil then
            continue
        end
        if v58:IsA("TextLabel") then
            table.insert(tbl_5, v58)
        end
    end
    if Header_1 == nil then
        local Desc_1 = Header_1
    else
        local Desc_1 = Header_1:FindFirstChild("Desc")
    end
    local Desc_1, v61
    v61 = Desc_1 == nil or not (Desc_1:IsA("TextLabel")) or Desc_1
    local v59 = {}
    v59.titles = tbl_5
    v59.subtitle = v61
    v59.authoredTitle = ((#tbl_5 <= 0) and "TOP 200") or (tbl_5[1].Text)
    local v60 = nil
    if v61 == nil then
        v60 = v61
    else
        v60 = v60.Text
    end
    if v60 ~= nil then
        v58 = v60
    else
        v58 = "ALL PLAYERS, ALL TIME"
    end
    v59.authoredSubtitle = v58
    return v59
end
makeStatusLabel = function(a1, a2)
    --[[
      name: makeStatusLabel
      line: 760
    ]]
    local PlayerName_1 = a2:FindFirstChild("PlayerName")
    local v62
    if PlayerName_1 == nil then
        v62 = PlayerName_1
    else
        v62 = PlayerName_1:IsA("TextLabel")
    end
    local v63
    if v62 ~= true then
        v63 = Instance.new("TextLabel")
    else
        v63 = PlayerName_1:Clone()
    end
    v63.Name = "BoardStatus"
    v63.Text = "Loading\226\128\166"
    v63.BackgroundTransparency = 1
    v63.TextScaled = true
    v63.TextXAlignment = Enum.TextXAlignment.Center
    v63.TextYAlignment = Enum.TextYAlignment.Center
    v63.AnchorPoint = Vector2.new(0.5, 0.5)
    v63.Position = UDim2.fromScale(0.5, 0.55)
    v63.Size = UDim2.fromScale(0.8, 0.06)
    v63.ZIndex = 10
    v63.Visible = true
    v63.Parent = a1
    return v63
end
local u6 = Color3.fromRGB(104, 68, 40)
local u7 = Color3.fromRGB(70, 45, 26)
local u8 = Color3.fromRGB(128, 88, 54)
local u9 = Color3.fromRGB(255, 220, 130)
local u10 = Color3.fromRGB(245, 236, 214)
local u11 = Color3.fromRGB(222, 208, 182)
local u12 = Color3.fromRGB(255, 246, 224)
local u13 = Color3.fromRGB(120, 214, 132)
local u14 = Color3.fromRGB(28, 40, 24)
local tbl_6 = {}
local tbl_7 = {}
tbl_7.__tostring = function()
    --[[
      name: __tostring
      line: 844
    ]]
    return "ProceduralLeaderboardBoard"
end
local u16 = setmetatable(tbl_6, tbl_7)
u16.__index = u16
u16.new = function(...)
    --[[
      name: new
      line: 849
      upvalues:
        u16 (ref, index: 1)
    ]]
    local v64 = setmetatable({}, u16)
    return v64:constructor(...) or v64
end
local function u15(a1, a2, a3, a4, a5)
    --[[
      name: constructor
      line: 853
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
        u9 (copy, index: 2)
        u11 (copy, index: 3)
        u12 (copy, index: 4)
        u15 (ref,  index: 5)
    ]]
    a1.rows = {}
    local leaderboardPixelsPerStud_1 = SUIKA_CONFIG_upv_1.leaderboardPixelsPerStud
    local v65 = Instance.new("SurfaceGui")
    v65.Face = a3
    v65.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    v65.PixelsPerStud = leaderboardPixelsPerStud_1
    v65.CanvasSize = Vector2.new(a4 * leaderboardPixelsPerStud_1, a5 * leaderboardPixelsPerStud_1)
    v65.Active = false
    v65.Parent = a2
    local v66 = Instance.new("Frame")
    v66.BackgroundTransparency = 1
    v66.Size = UDim2.fromScale(1, 1)
    v66.Parent = v65
    local v67 = Instance.new("UIPadding")
    v67.PaddingLeft = UDim.new(0.05, 0)
    v67.PaddingRight = UDim.new(0.05, 0)
    v67.PaddingTop = UDim.new(0.07, 0)
    v67.PaddingBottom = UDim.new(0.05, 0)
    v67.Parent = v66
    local v68 = Instance.new("TextLabel")
    v68.BackgroundTransparency = 1
    v68.Position = UDim2.fromScale(0, 0)
    v68.Size = UDim2.fromScale(1, 0.1)
    v68.Font = Enum.Font.GothamBlack
    v68.Text = "TOP SCORES"
    v68.TextColor3 = u9
    v68.TextScaled = true
    v68.TextStrokeTransparency = 0.4
    v68.Parent = v66
    local v69 = Instance.new("UITextSizeConstraint")
    v69.MaxTextSize = 96
    v69.Parent = v68
    local v70 = Instance.new("TextLabel")
    v70.BackgroundTransparency = 1
    v70.Position = UDim2.fromScale(0, 0.48)
    v70.Size = UDim2.fromScale(1, 0.1)
    v70.Font = Enum.Font.GothamMedium
    v70.Text = "Loading\226\128\166"
    v70.TextColor3 = u11
    v70.TextScaled = true
    v70.TextStrokeTransparency = 0.6
    v70.Parent = v66
    local v71 = Instance.new("UITextSizeConstraint")
    v71.MaxTextSize = 44
    v71.Parent = v70
    a1.status = v70
    local leaderboardRowCount_1 = SUIKA_CONFIG_upv_1.leaderboardRowCount
    local v72 = 0.84 / leaderboardRowCount_1
    for n_2 = 0, leaderboardRowCount_1 - 1 do
        local v73 = Instance.new("Frame")
        v73.BorderSizePixel = 0
        v73.BackgroundColor3 = u12
        v73.BackgroundTransparency = 1
        v73.Position = UDim2.fromScale(0, 0.14 + (n_2 * v72))
        v73.Size = UDim2.fromScale(1, v72 * 0.9)
        v73.Visible = false
        v73.Parent = v66
        local v74 = Instance.new("UICorner")
        v74.CornerRadius = UDim.new(0.3, 0)
        v74.Parent = v73
        table.insert(a1.rows, {frame = v73, rank = u15(v73, UDim2.fromScale(0.03, 0), UDim2.fromScale(0.16, 1), Enum.TextXAlignment.Left, Enum.Font.GothamBold), name = u15(v73, UDim2.fromScale(0.21, 0), UDim2.fromScale(0.51, 1), Enum.TextXAlignment.Left, Enum.Font.GothamMedium), score = u15(v73, UDim2.fromScale(0.72, 0), UDim2.fromScale(0.26, 1), Enum.TextXAlignment.Right, Enum.Font.GothamBold)})
    end
end
u16.constructor = u15
u16.populate = function(a1, a2, a3)
    --[[
      name: populate
      line: 930
      upvalues:
        Players_upv_1 (copy, index: 1)
        u13 (copy, index: 2)
        u12 (copy, index: 3)
        u14 (copy, index: 4)
        u10 (copy, index: 5)
        applyNameBadges_upv_1 (copy, index: 6)
        formatNumber_upv_1 (copy, index: 7)
    ]]
    local entries_3 = a2.entries
    if #entries_3 ~= 0 then
        a1.status.Visible = false
        local UserId_2 = Players_upv_1.LocalPlayer.UserId
        local v75, v76, v77 = nil, nil, nil
        for n_3 = 0, #a1.rows - 1 do
            local v78 = a1.rows[n_3 + 1]
            local v79
            v79 = entries_3[n_3 + 1]
            if v79 == nil then
                v78.frame.Visible = false
                continue
            end
            local v80 = v79.userId == UserId_2
            local v81 = n_3 % 2 == 0
            v78.frame.Visible = true
            local frame_1 = v78.frame
            if v80 then
                v75 = u13
            else
                v75 = u12
            end
            frame_1.BackgroundColor3 = v75
            v78.frame.BackgroundTransparency = (v80 and 0.35) or ((v81 and 0.82) or 1)
            if v80 then
                v76 = u14
            else
                v76 = u10
            end
            v78.rank.Text = ("#%*"):format(n_3 + 1)
            v78.rank.TextColor3 = v76
            v75 = v78.name
            local username_2 = v79.username
            local v82
            v82 = utf8.len(username_2)
            if v82 == false or v82 <= 12 then
                v77 = username_2
                v75.Text = v77
                v78.name.TextColor3 = v76
                applyNameBadges_upv_1(v78.name, v79.userId)
                v78.score.Text = formatNumber_upv_1(v79.score)
                v78.score.TextColor3 = v76
                continue
            end
            local v83
            v83 = utf8.offset(username_2, 12)
            if v83 ~= nil then
                v77 = ("%*\226\128\166"):format(string.sub(username_2, 1, v83 - 1))
            else
                v77 = username_2
            end
            v75.Text = v77
            v78.name.TextColor3 = v76
            applyNameBadges_upv_1(v78.name, v79.userId)
            v78.score.Text = formatNumber_upv_1(v79.score)
            v78.score.TextColor3 = v76
        end
    else
        a1:showStatus((a3 and "No scores yet") or "Loading\226\128\166")
        return nil
    end
end
u16.showStatus = function(a1, a2)
    --[[
      name: showStatus
      line: 960
    ]]
    a1.status.Text = a2
    a1.status.Visible = true
    for _, value_6 in a1.rows do
        value_6.frame.Visible = false
    end
end
u16.setPendingVisible = function(a1)
    --[[
      name: setPendingVisible
      line: 967
    ]]
end
u16.scrollBy = function(a1)
    --[[
      name: scrollBy
      line: 969
    ]]
end
u16.scrollByWheel = function(a1)
    --[[
      name: scrollByWheel
      line: 971
    ]]
end
u16.grabScroll = function(a1)
    --[[
      name: grabScroll
      line: 973
    ]]
end
u16.releaseScroll = function(a1)
    --[[
      name: releaseScroll
      line: 975
    ]]
end
u16.resetScroll = function(a1)
    --[[
      name: resetScroll
      line: 977
    ]]
end
u16.isScreenPointOver = function(a1)
    --[[
      name: isScreenPointOver
      line: 979
    ]]
    return false
end
u16.mountTabs = function(a1)
    --[[
      name: mountTabs
      line: 982
    ]]
    return false
end
u16.showTab = function(a1)
    --[[
      name: showTab
      line: 985
    ]]
end
u15 = function(a1, a2, a3, a4, a5)
    --[[
      name: makeBoardLabel
      line: 989
      upvalues:
        u10 (copy, index: 1)
    ]]
    local v84 = Instance.new("TextLabel")
    v84.BackgroundTransparency = 1
    v84.Position = a2
    v84.Size = a3
    v84.Font = a5
    v84.Text = ""
    v84.TextColor3 = u10
    v84.TextScaled = true
    v84.TextXAlignment = a4
    v84.TextYAlignment = Enum.TextYAlignment.Center
    v84.TextStrokeTransparency = 0.6
    v84.Parent = a1
    local v85 = Instance.new("UITextSizeConstraint")
    v85.MaxTextSize = 48
    v85.Parent = v84
    return v84
end
local tbl_8 = {}
tbl_8.buildProceduralBoardPart = function(a1, a2)
    --[[
      name: buildProceduralBoardPart
      line: 801
      upvalues:
        SUIKA_CONFIG_upv_1 (copy, index: 1)
        makeStagePart_upv_1 (copy, index: 2)
        u7 (copy, index: 3)
        u6 (copy, index: 4)
        u8 (copy, index: 5)
    ]]
    local leaderboardCenterX_1 = SUIKA_CONFIG_upv_1.leaderboardCenterX
    local leaderboardCenterY_1 = SUIKA_CONFIG_upv_1.leaderboardCenterY
    local leaderboardWidth_1 = SUIKA_CONFIG_upv_1.leaderboardWidth
    local leaderboardHeight_1 = SUIKA_CONFIG_upv_1.leaderboardHeight
    local v86 = makeStagePart_upv_1(a1)
    v86.Color = u7
    v86.Size = Vector3.new(leaderboardWidth_1 + 1.6, leaderboardHeight_1 + 1.6, 1)
    v86.CFrame = CFrame.new(a2 + Vector3.new(leaderboardCenterX_1, leaderboardCenterY_1, 0.4))
    local v87 = makeStagePart_upv_1(a1)
    v87.Color = u6
    v87.Size = Vector3.new(leaderboardWidth_1, leaderboardHeight_1, 1)
    v87.CFrame = CFrame.new(a2 + Vector3.new(leaderboardCenterX_1, leaderboardCenterY_1, 0.9))
    local v88 = makeStagePart_upv_1(a1)
    v88.Color = u8
    v88.Size = Vector3.new(leaderboardWidth_1 + 1.2, 2.4, 1)
    v88.CFrame = CFrame.new(a2 + Vector3.new(leaderboardCenterX_1, leaderboardCenterY_1 + (leaderboardHeight_1 / 2), 1.5))
    local v89 = makeStagePart_upv_1(a1)
    v89.Color = u8
    v89.Size = Vector3.new(leaderboardWidth_1 + 1.2, 1.6, 1)
    v89.CFrame = CFrame.new(a2 + Vector3.new(leaderboardCenterX_1, leaderboardCenterY_1 - (leaderboardHeight_1 / 2), 1.5))
    return v87
end
tbl_8.AuthoredLeaderboardBoard = u3
tbl_8.ProceduralLeaderboardBoard = u16
return tbl_8