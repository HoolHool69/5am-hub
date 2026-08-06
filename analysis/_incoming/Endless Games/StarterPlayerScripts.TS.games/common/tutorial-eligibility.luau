-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "atoms").sessionAtom
local readLocalProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "daily-data").readLocalProfile
local tbl_1 = {}
tbl_1.tutorialDeclineReason = function(a1)
    --[[
      name: tutorialDeclineReason
      line: 14
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
        readLocalProfile_upv_1 (copy, index: 3)
    ]]
    local v1 = sessionAtom_upv_1()
    if v1 ~= nil then
        local v2 = nil
        if v1.mode ~= "match" then
            if not (a1.teachOnDaily) and v1.mode == "daily" then
                v2 = a1.dailyDeclineDetail
                if v2 == nil then
                    v2 = "Game of the Day \226\128\148 one seed defines one board for everybody"
                end
                return v2
            end
            if a1.alwaysTeachInStudio and RunService_upv_1:IsStudio() then
                return nil
            end
            if a1.completedThisSession then
                return "already taught earlier this session"
            end
            v2 = readLocalProfile_upv_1()
            if v2 ~= nil then
                if table.find(v2.tutorialsSeen, a1.gameId) == nil then
                    return nil
                end
                return "already recorded in tutorialsSeen for this player"
            end
            return "player profile has not replicated yet"
        end
        v2 = a1.matchDeclineDetail
        if v2 == nil then
            v2 = "duel/royale \226\128\148 tutorials never run in matches"
        end
        return v2
    end
    return "no active session"
end
tbl_1.warnTutorialDeclined = function(a1, a2)
    --[[
      name: warnTutorialDeclined
      line: 59
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    if a2 ~= nil and RunService_upv_1:IsStudio() then
        warn((("%* not teaching this round \226\128\148 %*"):format(a1, a2)))
    else
        return nil
    end
end
return tbl_1