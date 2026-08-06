-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "tutorial-eligibility")
local tutorialDeclineReason_upv_1 = v1.tutorialDeclineReason
local warnTutorialDeclined_upv_1 = v1.warnTutorialDeclined
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "tutorial-prompt")
local DEFAULT_TUTORIAL_PROMPT_STYLE_upv_1 = v2.DEFAULT_TUTORIAL_PROMPT_STYLE
local TutorialPrompt_upv_1 = v2.TutorialPrompt
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network").ClientEvents
local v3 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v3.gameFrozenAtom
local pausedAtom_upv_1 = v3.pausedAtom
local tutorial_upv_1 = RuntimeLib_1.import(script, script.Parent, "dunk-shot-config").DUNK_SHOT_CONFIG.tutorial
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 56
    ]]
    return "DunkShotTutorial"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 61
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u1)
    return v4:constructor(...) or v4
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 65
      upvalues:
        DEFAULT_TUTORIAL_PROMPT_STYLE_upv_1 (copy, index: 1)
        tutorial_upv_1 (copy, index: 2)
        TutorialPrompt_upv_1 (copy, index: 3)
    ]]
    a1.audio = a2
    local v5 = table.clone(DEFAULT_TUTORIAL_PROMPT_STYLE_upv_1)
    setmetatable(v5, nil)
    v5.centerY = tutorial_upv_1.promptCenterY
    a1.prompt = TutorialPrompt_upv_1.new("DunkShotTutorial", v5)
    a1.phase = "off"
    a1.idleElapsed = 0
    a1.completedThisSession = false
end
u1.arm = function(a1)
    --[[
      name: arm
      line: 75
      upvalues:
        warnTutorialDeclined_upv_1 (copy, index: 1)
    ]]
    a1.idleElapsed = 0
    a1.prompt:reset()
    local v6 = a1:declineReason()
    warnTutorialDeclined_upv_1("[DunkShotTutorial]", v6)
    a1.phase = ((v6 ~= nil) and "off") or "idle"
end
u1.disarm = function(a1)
    --[[
      name: disarm
      line: 82
    ]]
    if a1.phase ~= "off" then
        a1.phase = "off"
        a1.prompt:reset()
    else
        return nil
    end
end
u1.isActive = function(a1)
    --[[
      name: isActive
      line: 89
    ]]
    return a1.phase ~= "off"
end
u1.update = function(a1, a2, a3, a4, a5)
    --[[
      name: update
      line: 92
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    if not (pausedAtom_upv_1()) and not (gameFrozenAtom_upv_1()) then
        a1:advance(a2, a3, a4, a5)
        a1.prompt:update(a2)
    else
        return nil
    end
end
u1.destroy = function(a1)
    --[[
      name: destroy
      line: 101
    ]]
    a1.prompt:destroy()
end
u1.advance = function(a1, a2, a3, a4, a5)
    --[[
      name: advance
      line: 104
      upvalues:
        tutorial_upv_1 (copy, index: 1)
    ]]
    if a1.phase == "idle" then
        if a4 then
            a1.phase = "pulling"
        else
            if a3 then
                a1.idleElapsed = a1.idleElapsed + a2
            end
            if a3 and a1.idleElapsed >= tutorial_upv_1.promptDelaySeconds then
                a1.audio.play("whoosh", {})
                a1.phase = "pullPrompt"
            end
        end
        return nil
    elseif a1.phase == "pullPrompt" then
        a1.prompt:show("PULL BACK TO AIM", "prompt")
        if a4 then
            a1.phase = "pulling"
        end
        return nil
    elseif a1.phase == "pulling" then
        a1.prompt:show("KEEP PULLING", "holding")
        if a4 and tutorial_upv_1.releaseAimStuds <= a5 then
            a1.audio.play("whoosh", {})
            a1.phase = "releasePrompt"
            return nil
        end
        if not (a4) then
            if a3 then
                a1.phase = "pullPrompt"
            else
                a1.prompt:hide()
                a1.phase = "awaitSeat"
            end
        end
        return nil
    elseif a1.phase == "releasePrompt" then
        a1.prompt:show("RELEASE", "urgent")
        if a4 and a5 < tutorial_upv_1.releaseExitStuds then
            a1.phase = "pulling"
            return nil
        end
        if not (a4) then
            a1:complete()
        end
        return nil
    elseif a1.phase == "awaitSeat" then
        if a3 then
            a1.phase = "pullPrompt"
        end
        return nil
    elseif a1.prompt:isHidden() then
        a1.phase = "off"
    end
end
u1.complete = function(a1)
    --[[
      name: complete
      line: 183
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
    ]]
    a1.phase = "done"
    a1.completedThisSession = true
    a1.prompt:hide()
    a1.audio.play("whoosh", {})
    ClientEvents_upv_1.markTutorialSeen:fire("dunk-shot")
end
u1.declineReason = function(a1)
    --[[
      name: declineReason
      line: 193
      upvalues:
        tutorialDeclineReason_upv_1 (copy, index: 1)
    ]]
    return tutorialDeclineReason_upv_1({completedThisSession = a1.completedThisSession})
end
local tbl_3 = {}
tbl_3.DunkShotTutorial = u1
return tbl_3