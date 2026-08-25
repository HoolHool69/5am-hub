-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local PolicyService_upv_1 = game:GetService("PolicyService")
local RunService_upv_1 = game:GetService("RunService")
local Players_upv_1 = game:GetService("Players")
local tbl_upv_2 = {}
function tbl_1.AreAdsAllowed(a1)
    --[[
      name: AreAdsAllowed
      line: 50
    ]]
    return GetPolicy("AreAdsAllowed", a1)
end
function tbl_1.ArePaidRandomItemsRestricted(a1)
    --[[
      name: ArePaidRandomItemsRestricted
      line: 56
    ]]
    return GetPolicy("ArePaidRandomItemsRestricted", a1)
end
function tbl_1.AllowedExternalLinkReferences(a1)
    --[[
      name: AllowedExternalLinkReferences
      line: 62
    ]]
    return GetPolicy("AllowedExternalLinkReferences", a1)
end
function tbl_1.IsEligibleToPurchaseSubscription(a1)
    --[[
      name: IsEligibleToPurchaseSubscription
      line: 68
    ]]
    return GetPolicy("IsEligibleToPurchaseSubscription", a1)
end
function tbl_1.IsPaidItemTradingAllowed(a1)
    --[[
      name: IsPaidItemTradingAllowed
      line: 74
    ]]
    return GetPolicy("IsPaidItemTradingAllowed", a1)
end
function tbl_1.IsSubjectToChinaPolicies(a1)
    --[[
      name: IsSubjectToChinaPolicies
      line: 80
      upvalues:
        Players_upv_1 (copy, index: 1)
    ]]
    local v1 = a1 or (Players_upv_1.LocalPlayer)
    if v1 then
        if v1:IsInGroup(9170755) then
            return true
        end
        return GetPolicy("IsSubjectToChinaPolicies", a1)
    end
    warn("Player instance not found")
end
function GetPolicy(a1, a2)
    --[[
      name: GetPolicy
      line: 109
      upvalues:
        Players_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
        tbl_upv_2 (copy, index: 3)
    ]]
    local v2 = a2 or (Players_upv_1.LocalPlayer)
    if v2 then
        if RunService_upv_1:IsServer() and not (tbl_upv_2[v2]) then
            task.spawn(InitalizePolicy, v2)
        end
        local v3 = os.clock()
        local v4 = GetPolicyEntry(v2)
        while true do
            if v4 and v4.loaded or os.clock() - v3 >= 15 then
                break
            end
            task.wait(0.05)
            v4 = GetPolicyEntry(v2)
        end
        if v4 and v4.info then
            return v4.info[a1]
        end
        warn("Policy info not found for player: ", v2)
    else
        warn("Player instance not found")
    end
end
function GetPolicyEntry(a1)
    --[[
      name: GetPolicyEntry
      line: 150
      upvalues:
        RunService_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    if RunService_upv_1:IsServer() then
        return tbl_upv_2[a1]
    end
    return tbl_upv_2
end
function InitalizePolicy(a1)
    --[[
      name: InitalizePolicy
      line: 160
      upvalues:
        RunService_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
        PolicyService_upv_1 (copy, index: 3)
    ]]
    if RunService_upv_1:IsServer() and not (tbl_upv_2[a1]) then
        tbl_upv_2[a1] = {}
    end
    local v5 = GetPolicyEntry(a1)
    if v5 and v5.loaded then
        return
    end
    local v6 = nil
    local v7 = nil
    for n_1 = 1, 3 do
        local success_1, v7 = pcall(
            function()
                --[[
                  line: 180
                  upvalues:
                    PolicyService_upv_1 (copy, index: 1)
                    a1 (copy, index: 2)
                ]]
                return PolicyService_upv_1:GetPolicyInfoForPlayerAsync(a1)
            end
        )
        if success_1 then
            v6 = v7
            break
        end
        warn("Failed to get policy info for player -", a1, "- attempt", n_1, "of", 3, "-", v7)
        if not (a1.Parent) then
            break
        end
        if n_1 < 3 then
            task.wait(n_1 * 2)
        end
    end
    v5.info = v6 or {}
    v5.loaded = true
end
function Initialize()
    --[[
      name: Initialize
      line: 211
      upvalues:
        RunService_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
    ]]
    if RunService_upv_1:IsServer() then
        for _, value_1 in pairs(game.Players:GetPlayers()) do
            task.spawn(InitalizePolicy, value_1)
        end
        Players_upv_1.PlayerAdded:Connect(
            function(a1)
                --[[
                  line: 222
                ]]
                task.spawn(InitalizePolicy, a1)
            end
        )
    else
        task.spawn(InitalizePolicy, Players_upv_1.LocalPlayer)
    end
end
task.spawn(Initialize)
return tbl_1