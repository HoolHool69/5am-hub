-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local RunService_upv_1 = game:GetService("RunService")
local TweenService_upv_1 = game:GetService("TweenService")
local StarterGui_upv_1 = game:GetService("StarterGui")
function tbl_upv_1.GetPlayerRootPart(a1)
    --[[
      name: GetPlayerRootPart
      line: 7
    ]]
    local Character_1 = a1.Character
    if Character_1 and Character_1.Parent == workspace then
        return Character_1:FindFirstChild("HumanoidRootPart")
    end
end
function tbl_upv_1.GetPlayerHumanoid(a1)
    --[[
      name: GetPlayerHumanoid
      line: 13
    ]]
    local Character_2 = a1.Character
    if Character_2 and Character_2.Parent == workspace then
        return Character_2:FindFirstChild("Humanoid")
    end
end
function tbl_upv_1.WaitPlayerRootPart(a1)
    --[[
      name: WaitPlayerRootPart
      line: 19
    ]]
    local v1 = a1.Character or (a1.CharacterAdded:Wait())
    return v1:WaitForChild("HumanoidRootPart")
end
function tbl_upv_1.WaitPlayerHumanoid(a1)
    --[[
      name: WaitPlayerHumanoid
      line: 24
    ]]
    local v2 = a1.Character or (a1.CharacterAdded:Wait())
    return v2:WaitForChild("Humanoid")
end
function tbl_upv_1.IsDestroyed(a1)
    --[[
      name: IsDestroyed
      line: 29
    ]]
    local u1 = a1:GetPropertyChangedSignal("Parent"):Connect(function()
        --[[
          line: 30
        ]]
    end)
    return function()
        --[[
          line: 31
          upvalues:
            u1 (copy, index: 1)
        ]]
        return not u1.Connected
    end
end
function tbl_upv_1.OnDestroyed(a1, a2)
    --[[
      name: OnDestroyed
      line: 36
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    local u2 = nil
    local v3 = a1:GetPropertyChangedSignal("Parent"):Connect(
        function()
            --[[
              line: 38
              upvalues:
                RunService_upv_1 (copy, index: 1)
                u2 (ref,  index: 2)
                a2 (copy, index: 3)
            ]]
            RunService_upv_1.Heartbeat:Wait()
            if (u2.Connected) then
                return
            end
            a2()
        end
    )
    u2 = v3
    return u2
end
function tbl_upv_1.TieConnectionToInstance(a1, a2)
    --[[
      name: TieConnectionToInstance
      line: 47
    ]]
    a2.Destroying:Connect(
        function()
            --[[
              line: 48
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1:Disconnect()
        end
    )
end
function tbl_upv_1.WaitForAttribute(a1, a2, a3)
    --[[
      name: WaitForAttribute
      line: 61
    ]]
    local v4 = a1:GetAttribute(a2)
    if v4 ~= nil then
        return v4
    end
    local u3 = coroutine.running()
    local u4 = nil
    local u5 = nil
    local v5 = a1:GetAttributeChangedSignal(a2):Connect(
        function()
            --[[
              line: 72
              upvalues:
                a1 (copy, index: 1)
                a2 (copy, index: 2)
                u4 (ref,  index: 3)
                u5 (ref,  index: 4)
                u3 (copy, index: 5)
            ]]
            if a1:GetAttribute(a2) == nil then
                return
            end
            u4:Disconnect()
            if coroutine.status(u5) == "suspended" then
                task.cancel(u5)
            end
            if coroutine.status(u3) == "suspended" then
                task.spawn(u3)
            end
        end
    )
    u4 = v5
    local v6 = task.delay(
        a3 or 5,
        function()
            --[[
              line: 91
              upvalues:
                u4 (ref,  index: 1)
                u3 (copy, index: 2)
            ]]
            u4:Disconnect()
            if coroutine.status(u3) ~= "suspended" then
                return
            end
            task.spawn(u3)
        end
    )
    u5 = v6
    coroutine.yield()
    local v7 = a1:GetAttribute(a2)
    if v7 == nil then
        warn("[CommonUtils] Timed out waiting for attribute '" .. a2 .. "' on " .. a1.Name .. ".")
    end
    return v7
end
function tbl_upv_1.WaitForAncestor(a1, a2, a3)
    --[[
      name: WaitForAncestor
      line: 109
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    local time_1 = time()
    while true do
        RunService_upv_1.Heartbeat:Wait()
        if a1:IsDescendantOf(a2) or (a3 or math.huge) < time() - time_1 then
            break
        end
    end
end
function tbl_upv_1.ConditionRaycast(a1, a2, a3, a4)
    --[[
      name: ConditionRaycast
      line: 117
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v8 = workspace:Raycast(a1, a2, a3)
    if v8 == nil or a4(v8.Instance) then
        return v8
    end
    local v9 = RaycastParams.new()
    local tbl_2 = {v8.Instance}
    for _, value_1 in pairs(a3.FilterDescendantsInstances) do
        table.insert(tbl_2, value_1)
    end
    v9.FilterDescendantsInstances = tbl_2
    local Position_1 = v8.Position
    return tbl_upv_1.ConditionRaycast(Position_1, a2 - (Position_1 - a1), v9, a4)
end
function tbl_upv_1.GetAnimatorAnimationTrack(a1, a2)
    --[[
      name: GetAnimatorAnimationTrack
      line: 139
    ]]
    for _, value_2 in pairs(a1:GetPlayingAnimationTracks()) do
        if value_2.Animation.AnimationId ~= a2 then
            continue
        end
        return value_2
    end
end
function tbl_upv_1.TweenNumberSequence(a1, a2, a3, a4)
    --[[
      name: TweenNumberSequence
      line: 147
      upvalues:
        TweenService_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    local u6 = Instance.new("NumberValue")
    local v10 = TweenService_upv_1:Create(u6, a2, {Value = a4})
    local u7
    if RunService_upv_1:IsServer() then
        u7 = RunService_upv_1.Stepped:Connect(
            function()
                --[[
                  line: 154
                  upvalues:
                    a1 (copy, index: 1)
                    a3 (copy, index: 2)
                    u6 (copy, index: 3)
                ]]
                a1[a3] = NumberSequence.new(u6.Value)
            end
        )
    else
        u7 = RunService_upv_1.RenderStepped:Connect(
            function()
                --[[
                  line: 158
                  upvalues:
                    a1 (copy, index: 1)
                    a3 (copy, index: 2)
                    u6 (copy, index: 3)
                ]]
                a1[a3] = NumberSequence.new(u6.Value)
            end
        )
    end
    local u8 = nil
    local v11 = v10.Completed:Connect(
        function()
            --[[
              line: 164
              upvalues:
                u8 (ref, index: 1)
                u7 (ref, index: 2)
            ]]
            u8:Disconnect()
            u7:Disconnect()
        end
    )
    u8 = v11
    v10:Play()
    return v10
end
function tbl_upv_1.GetPlayerCameraHeight(a1)
    --[[
      name: GetPlayerCameraHeight
      line: 173
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v12 = tbl_upv_1.GetPlayerRootPart(a1)
    if v12 then
        return v12.Position + (Vector3.new(0, 1.5, 0) + Vector3.new(0, (v12.Size.Y - 2) / 2, 0))
    end
end
function tbl_upv_1.DictionaryLength(a1)
    --[[
      name: DictionaryLength
      line: 184
    ]]
    local v13 = 0
    for _, v14 in pairs(a1) do
        v13 = v13 + 1
    end
    return v13
end
function tbl_upv_1.GetFirstDictionaryKeyValue(a1)
    --[[
      name: GetFirstDictionaryKeyValue
      line: 192
    ]]
    for key_1, value_3 in pairs(a1) do
        return key_1, value_3
    end
end
function tbl_upv_1.FindFirstChildChain(a1, ...)
    --[[
      name: FindFirstChildChain
      line: 198
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if a1 == tbl_upv_1 then
        error("Expected . not : calling FindFirstChildChain")
    end
    if not a1 then
        return nil
    end
    local v15 = a1
    for _, value_4 in pairs({...}) do
        local v16 = v15:FindFirstChild(value_4)
        if v16 then
            v15 = v16
            continue
        end
        return nil, value_4
    end
    return v15
end
function tbl_upv_1.EvaluateNumberSequence(a1, a2)
    --[[
      name: EvaluateNumberSequence
      line: 217
    ]]
    if a2 > 0 then
        if a2 < 1 then
            local v17, v18 = nil, nil
            for n_1 = 1, #a1.Keypoints - 1 do
                v17 = a1.Keypoints[n_1]
                v18 = a1.Keypoints[n_1 + 1]
                if v17.Time > a2 or a2 >= v18.Time then
                    continue
                end
                return ((v18.Value - v17.Value) * ((a2 - v17.Time) / (v18.Time - v17.Time))) + v17.Value
            end
        else
            return a1.Keypoints[#a1.Keypoints].Value
        end
    else
        return a1.Keypoints[1].Value
    end
end
function tbl_upv_1.UnseatPlayer(a1)
    --[[
      name: UnseatPlayer
      line: 232
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v19 = tbl_upv_1.GetPlayerHumanoid(a1)
    if not v19 then
        return
    end
    local SeatPart_1 = v19.SeatPart
    if not SeatPart_1 then
        return
    end
    local v20 = SeatPart_1:FindFirstChildWhichIsA("Weld")
    if not v20 then
        return
    end
    v20:Destroy()
end
function tbl_upv_1.SetResetButtonEnabledAsync(a1)
    --[[
      name: SetResetButtonEnabledAsync
      line: 245
      upvalues:
        StarterGui_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    for _ = 1, 8 do
        if not (pcall(
            function()
                --[[
                  line: 249
                  upvalues:
                    StarterGui_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                StarterGui_upv_1:SetCore("ResetButtonCallback", a1)
            end
        )) then
            RunService_upv_1.Stepped:Wait()
            continue
        end
        return
    end
end
function tbl_upv_1.LoadCharacterOnPoint(a1, a2, a3)
    --[[
      name: LoadCharacterOnPoint
      line: 261
    ]]
    a1:LoadCharacter()
    local _ = a1.Character:WaitForChild("Humanoid")
    local HumanoidRootPart_1 = a1.Character:WaitForChild("HumanoidRootPart")
    repeat
        task.wait()
    until HumanoidRootPart_1:IsDescendantOf(workspace)
    a1.Character:SetPrimaryPartCFrame(a2)
end
return tbl_upv_1