-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
local ReplicatedStorage_upv_1 = game:GetService("ReplicatedStorage")
local HttpService_upv_1 = game:GetService("HttpService")
local u1 = nil
function tbl_upv_1.GetPlayerFruitProfile(a1)
    --[[
      name: GetPlayerFruitProfile
      line: 24
      upvalues:
        HttpService_upv_1 (copy, index: 1)
    ]]
    local v1 = game.Players:FindFirstChild(tostring(a1))
    if v1 then
        local v2 = v1:GetAttribute("FruitProfile")
        if v2 then
            return HttpService_upv_1:JSONDecode(v2)
        end
        warn(v1, "DOES NOT HAVE A FRUIT PROFILE YET")
    else
        print("GetPlayerFruitProfile requires a player")
    end
end
function tbl_upv_1.GetActiveDuelInfo(a1)
    --[[
      name: GetActiveDuelInfo
      line: 44
      upvalues:
        HttpService_upv_1 (copy, index: 1)
    ]]
    local v3 = game.Players:FindFirstChild(tostring(a1))
    if v3 then
        local v4 = v3:GetAttribute("DuelUniqueId")
        if v4 then
            local v5 = GetReplicatedDuelInfo()
            if not v5 then
                return
            end
            local v6 = v5:GetAttribute(v4)
            if v6 then
                return HttpService_upv_1:JSONDecode(v6)
            end
            warn(v3, "could not get active duel info")
        else
            print(v3, "is missing a duel unique id")
        end
    else
        print("GetActiveDuelInfo requires a player")
    end
end
function tbl_upv_1.GetDuelsOpponentName(a1)
    --[[
      name: GetDuelsOpponentName
      line: 74
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v7 = game.Players:FindFirstChild(tostring(a1))
    if v7 then
        local v8 = tbl_upv_1.GetActiveDuelInfo(v7)
        if not v8 then
            return
        end
        for _, value_1 in pairs(v8.players) do
            if value_1 == v7.Name then
                continue
            end
            return value_1
        end
    else
        print("GetDuelsOpponentName requires a player")
    end
end
function tbl_upv_1.DuelsStartTimerActive(a1)
    --[[
      name: DuelsStartTimerActive
      line: 100
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v9 = game.Players:FindFirstChild(tostring(a1))
    if v9 then
        local v10 = tbl_upv_1.GetActiveDuelInfo(v9)
        if not v10 then
            return
        end
        local v11 = workspace:GetServerTimeNow() - v10.startTime < v10.startTimerDuration
        return v11
    end
    print("GetDuelsOpponentName requires a player")
end
function GetReplicatedDuelInfo()
    --[[
      name: GetReplicatedDuelInfo
      line: 130
      upvalues:
        u1 (ref,  index: 1)
        ReplicatedStorage_upv_1 (copy, index: 2)
    ]]
    if not u1 then
        u1 = ReplicatedStorage_upv_1:WaitForChild("ReplicatedDuelsInfo", 30)
        if not (u1) then
            warn("[SharedGamemodeUtils] ReplicatedStorage.ReplicatedDuelsInfo is missing, duel info is unavailable")
        end
    end
    return u1
end
return tbl_upv_1