-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local u1 = CFrame.new()
local function padChannel_upv_1(a1, a2)
    --[[
      name: padChannel
      line: 14
      upvalues:
        u1 (copy, index: 1)
    ]]
    while true do
        local v1
        if #a1 >= a2 then
            break
        end
        if #a1 <= 0 then
            local v2 = nil
        else
            local v2 = a1[#a1]
        end
        local v2 = nil
        v1 = v2 or u1
        table.insert(a1, v1)
    end
end
local tbl_1 = {}
tbl_1.buildPoseTrack = function(a1)
    --[[
      name: buildPoseTrack
      line: 28
      upvalues:
        padChannel_upv_1 (copy, index: 1)
    ]]
    local tbl_2 = {}
    for _, value_1 in a1:GetKeyframes() do
        if value_1:IsA("Keyframe") then
            table.insert(tbl_2, value_1)
        end
    end
    table.sort(
        tbl_2,
        function(a2, a3)
            --[[
              line: 35
            ]]
            return a2.Time < a3.Time
        end
    )
    local tbl_3 = {}
    local tbl_4 = {}
    local v3 = nil
    local v4 = nil
    local v5 = nil
    for _, value_2 in tbl_2 do
        v3 = #tbl_3
        table.insert(tbl_3, value_2.Time)
        for v8, value_3 in value_2:GetDescendants() do
            v5 = value_3:IsA("Pose")
            if not (v5) then
                continue
            end
            v4 = tbl_4[value_3.Name]
            if v4 == nil then
                v4 = {}
                tbl_4[value_3.Name] = v4
            end
            padChannel_upv_1(v4, v3)
            table.insert(v4, value_3.CFrame)
        end
    end
    for _, value_4 in tbl_4 do
        padChannel_upv_1(value_4, #tbl_3)
    end
    if #tbl_3 <= 0 then
        local v6 = nil
    else
        local v6 = tbl_3[#tbl_3]
    end
    local tbl_5 = {}
    local v6, v7 = nil, nil
    if v6 ~= nil then
        v7 = v6
    else
        v7 = 0
    end
    tbl_5.length = v7
    tbl_5.times = tbl_3
    tbl_5.poses = tbl_4
    return tbl_5
end
tbl_1.findKeyframeSpan = function(a1, a2)
    --[[
      name: findKeyframeSpan
      line: 78
    ]]
    local times_1 = a1.times
    local v8 = #times_1
    local v9, v10 = nil, nil
    if v8 ~= 0 then
        v9 = times_1[1]
        if v9 == nil then
            v9 = 0
        end
        v10 = times_1[v8]
        if v10 == nil then
            v10 = 0
        end
        if a2 > v9 then
            local v11, v12 = nil, nil
            if v10 > a2 then
                local v13 = 0
                local v14 = v8 - 1
                local v15 = nil
                while v14 - v13 > 1 do
                    local v16 = math.floor((v13 + v14) / 2)
                    v15 = times_1[v16 + 1]
                    if v15 == nil then
                        v15 = 0
                    end
                    if v15 > a2 then
                        v14 = v16
                    else
                        v13 = v16
                    end
                end
                v11 = times_1[v13 + 1]
                if v11 == nil then
                    v11 = 0
                end
                v12 = times_1[v14 + 1]
                if v12 == nil then
                    v12 = v11
                end
                local v17 = v12 - v11
                local tbl_6 = {}
                tbl_6.index = nil
                tbl_6.alpha = ((v17 <= 0) and 0) or ((a2 - v11) / v17)
                return tbl_6
            else
                local tbl_7 = {}
                tbl_7.index = v8 - 1
                return tbl_7
            end
        else
            return {}
        end
    else
        return {}
    end
end
tbl_1.samplePoseAt = function(a1, a2, a3)
    --[[
      name: samplePoseAt
      line: 141
    ]]
    local v18 = a1.poses[a2]
    local v19 = nil
    if v18 ~= nil then
        v19 = v18[a3.index + 1]
        if v19 ~= nil then
            local v20 = nil
            if a3.alpha > 0 then
                v20 = v18[a3.index + 2]
                if v20 ~= nil then
                    return v19:Lerp(v20, a3.alpha)
                end
            end
            return v19
        end
    end
    return nil
end
return tbl_1