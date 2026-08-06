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
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 70
    ]]
    return "TrafficRushTutorial"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 75
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u1)
    return v4:constructor(...) or v4
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 79
      upvalues:
        DEFAULT_TUTORIAL_PROMPT_STYLE_upv_1 (copy, index: 1)
        TutorialPrompt_upv_1 (copy, index: 2)
    ]]
    a1.audio = a2
    local v5 = table.clone(DEFAULT_TUTORIAL_PROMPT_STYLE_upv_1)
    setmetatable(v5, nil)
    v5.centerY = 0.32
    v5.widthScale = 0.74
    a1.prompt = TutorialPrompt_upv_1.new("TrafficRushTutorial", v5)
    a1.phase = "off"
    a1.scale = 1
    a1.betweenElapsed = 0
    a1.completedThisSession = false
end
u1.arm = function(a1)
    --[[
      name: arm
      line: 91
      upvalues:
        warnTutorialDeclined_upv_1 (copy, index: 1)
    ]]
    a1.scale = 1
    a1.betweenElapsed = 0
    a1.prompt:reset()
    local v6 = a1:declineReason()
    warnTutorialDeclined_upv_1("[TrafficRushTutorial]", v6)
    a1.phase = ((v6 ~= nil) and "off") or "idle"
end
u1.disarm = function(a1)
    --[[
      name: disarm
      line: 99
    ]]
    if a1.phase ~= "off" then
        a1.phase = "off"
        a1.scale = 1
        a1.prompt:reset()
    else
        return nil
    end
end
u1.isActive = function(a1)
    --[[
      name: isActive
      line: 107
    ]]
    return a1.phase ~= "off"
end
u1.noteStopped = function(a1)
    --[[
      name: noteStopped
      line: 110
    ]]
    if a1.phase ~= "idle" and a1.phase ~= "tapPrompt" then
        return nil
    end
    a1.prompt:hide()
    a1.betweenElapsed = 0
    a1.phase = "betweenBeats"
end
u1.noteDashed = function(a1)
    --[[
      name: noteDashed
      line: 118
    ]]
    if a1.phase ~= "betweenBeats" and a1.phase ~= "swipePrompt" then
        return nil
    end
    a1:complete()
end
u1.update = function(a1, a2, a3)
    --[[
      name: update
      line: 124
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    if not (pausedAtom_upv_1()) and not (gameFrozenAtom_upv_1()) then
        a1:advance(a2, a3)
        a1.prompt:update(a2)
    end
    return a1.scale
end
u1.destroy = function(a1)
    --[[
      name: destroy
      line: 134
    ]]
    a1.prompt:destroy()
end
u1.advance = function(a1, a2, a3)
    --[[
      name: advance
      line: 137
    ]]
    if a1.phase == "idle" then
        if a3 >= -16 then
            a1.audio.play("whoosh", {})
            a1.phase = "tapPrompt"
        end
        return nil
    elseif a1.phase == "tapPrompt" then
        a1:ease(0.2, 5, a2)
        a1.prompt:show("TAP A CAR TO STOP IT", "prompt")
        return nil
    elseif a1.phase == "betweenBeats" then
        a1:ease(1, 4.5, a2)
        a1.betweenElapsed = a1.betweenElapsed + a2
        if a1.betweenElapsed >= 0.9 then
            a1.audio.play("whoosh", {})
            a1.phase = "swipePrompt"
        end
        return nil
    elseif a1.phase ~= "swipePrompt" then
        a1:ease(1, 4.5, a2)
        if a1.scale >= 1 and a1.prompt:isHidden() then
            a1.phase = "off"
        end
    else
        a1:ease(0.2, 5, a2)
        a1.prompt:show("SWIPE A CAR TO SEND IT", "prompt")
        return nil
    end
end
u1.complete = function(a1)
    --[[
      name: complete
      line: 178
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
    ]]
    a1.phase = "done"
    a1.completedThisSession = true
    a1.prompt:hide()
    a1.audio.play("whoosh", {})
    ClientEvents_upv_1.markTutorialSeen:fire("traffic-rush")
end
u1.ease = function(a1, a2, a3, a4)
    --[[
      name: ease
      line: 188
    ]]
    a1.scale = a1.scale + ((a2 - a1.scale) * math.min(a4 * a3, 1))
    if math.abs(a1.scale - a2) >= 0.005 then
        return
    end
    a1.scale = a2
end
u1.declineReason = function(a1)
    --[[
      name: declineReason
      line: 194
      upvalues:
        tutorialDeclineReason_upv_1 (copy, index: 1)
    ]]
    return tutorialDeclineReason_upv_1({completedThisSession = a1.completedThisSession})
end
local tbl_3 = {}
tbl_3.TrafficRushTutorial = u1
return tbl_3