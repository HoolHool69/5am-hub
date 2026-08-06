-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "tutorial-eligibility")
local tutorialDeclineReason_upv_1 = v1.tutorialDeclineReason
local warnTutorialDeclined_upv_1 = v1.warnTutorialDeclined
local TutorialPrompt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "tutorial-prompt").TutorialPrompt
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network").ClientEvents
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "atoms").sessionAtom
local v2 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v2.gameFrozenAtom
local pausedAtom_upv_1 = v2.pausedAtom
local v3 = RuntimeLib_1.import(script, script.Parent, "terrain")
local TERRAIN_PAD_END_X_upv_1 = v3.TERRAIN_PAD_END_X
local TERRAIN_TEACHING_FALL_END_X_upv_1 = v3.TERRAIN_TEACHING_FALL_END_X
local TERRAIN_TUTORIAL_FALL_END_X_upv_1 = v3.TERRAIN_TUTORIAL_FALL_END_X
local TERRAIN_TUTORIAL_PAD_END_X_upv_1 = v3.TERRAIN_TUTORIAL_PAD_END_X
local TINY_WINGS_CONFIG_1 = RuntimeLib_1.import(script, script.Parent, "tiny-wings-config").TINY_WINGS_CONFIG
local tutorial_upv_1 = TINY_WINGS_CONFIG_1.tutorial
local tbl_upv_1 = {}
tbl_upv_1.centerY = tutorial_upv_1.promptCenterY
tbl_upv_1.widthScale = tutorial_upv_1.promptWidthScale
tbl_upv_1.heightScale = tutorial_upv_1.promptHeightScale
tbl_upv_1.fadeInSeconds = tutorial_upv_1.fadeInSeconds
tbl_upv_1.fadeOutSeconds = tutorial_upv_1.fadeOutSeconds
tbl_upv_1.captionBlendRate = tutorial_upv_1.captionBlendRate
tbl_upv_1.pulseSeconds = tutorial_upv_1.pulseSeconds
tbl_upv_1.pulseUrgentSeconds = tutorial_upv_1.pulseUrgentSeconds
tbl_upv_1.pulseAmplitude = tutorial_upv_1.pulseAmplitude
tbl_upv_1.holdingScale = tutorial_upv_1.holdingScale
tbl_upv_1.holdingTransparency = tutorial_upv_1.holdingTransparency
tbl_upv_1.holdingRiseScale = tutorial_upv_1.holdingRiseScale
tbl_upv_1.overshootScale = tutorial_upv_1.overshootScale
tbl_upv_1.exitScale = tutorial_upv_1.exitScale
tbl_upv_1.urgentColor = Color3.fromRGB(255, 216, 102)
local u1 = TINY_WINGS_CONFIG_1.startX + TINY_WINGS_CONFIG_1.startSpeed * ((2 * TINY_WINGS_CONFIG_1.nestHopVelocityY) / -TINY_WINGS_CONFIG_1.gravity)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 92
    ]]
    return "TinyWingsTutorial"
end
local u2 = setmetatable(tbl_2, tbl_3)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 97
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u2)
    return v4:constructor(...) or v4
end
u2.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 101
      upvalues:
        TutorialPrompt_upv_1 (copy, index: 1)
        tbl_upv_1 (copy, index: 2)
    ]]
    a1.audio = a2
    a1.onCompleted = a3
    a1.prompt = TutorialPrompt_upv_1.new("TinyWingsTutorial", tbl_upv_1)
    a1.phase = "off"
    a1.scale = 1
    a1.diveElapsed = 0
    a1.curated = false
    a1.holdGateX = 0
    a1.releaseGateX = 0
    a1.freezeStartX = 0
    a1.freezeAnchorX = 0
    a1.completedThisSession = false
end
u2.arm = function(a1)
    --[[
      name: arm
      line: 115
      upvalues:
        warnTutorialDeclined_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
        tutorial_upv_1 (copy, index: 4)
        TERRAIN_TUTORIAL_PAD_END_X_upv_1 (copy, index: 5)
        TERRAIN_TUTORIAL_FALL_END_X_upv_1 (copy, index: 6)
        TERRAIN_PAD_END_X_upv_1 (copy, index: 7)
        TERRAIN_TEACHING_FALL_END_X_upv_1 (copy, index: 8)
    ]]
    a1.scale = 1
    a1.diveElapsed = 0
    a1.prompt:reset()
    local v5 = a1:declineReason()
    warnTutorialDeclined_upv_1("[TinyWingsTutorial]", v5)
    a1.phase = ((v5 ~= nil) and "off") or "idle"
    local v6 = a1.phase ~= "off"
    local v7 = nil
    if v6 then
        v7 = sessionAtom_upv_1()
        if v7 ~= nil then
            v7 = v7.mode
        end
        if v7 ~= "daily" then
            v6 = true
        else
            v6 = false
        end
    end
    a1.curated = v6
    if a1.curated then
        a1.holdGateX = u1 + tutorial_upv_1.curatedSettleStuds
        a1.freezeAnchorX = TERRAIN_TUTORIAL_PAD_END_X_upv_1
        a1.releaseGateX = TERRAIN_TUTORIAL_FALL_END_X_upv_1 - tutorial_upv_1.releaseGateLeadStuds
    else
        a1.holdGateX = TERRAIN_PAD_END_X_upv_1 - tutorial_upv_1.holdGateLeadStuds
        a1.freezeAnchorX = TERRAIN_TEACHING_FALL_END_X_upv_1
        a1.releaseGateX = TERRAIN_TEACHING_FALL_END_X_upv_1 - tutorial_upv_1.releaseGateLeadStuds
    end
    a1.freezeStartX = a1.freezeAnchorX - tutorial_upv_1.freezeLeadStuds
end
u2.usesCuratedTerrain = function(a1)
    --[[
      name: usesCuratedTerrain
      line: 151
    ]]
    return a1.curated
end
u2.disarm = function(a1)
    --[[
      name: disarm
      line: 154
    ]]
    if a1.phase ~= "off" then
        a1.phase = "off"
        a1.scale = 1
        a1.prompt:reset()
    else
        return nil
    end
end
u2.isActive = function(a1)
    --[[
      name: isActive
      line: 162
    ]]
    return a1.phase ~= "off"
end
u2.update = function(a1, a2, a3, a4, a5)
    --[[
      name: update
      line: 165
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    if not (pausedAtom_upv_1()) and not (gameFrozenAtom_upv_1()) then
        a1:advance(a2, a3, a4, a5)
        a1.prompt:update(a2)
    end
    return a1.scale
end
u2.destroy = function(a1)
    --[[
      name: destroy
      line: 175
    ]]
    a1.prompt:destroy()
end
u2.advance = function(a1, a2, a3, a4, a5)
    --[[
      name: advance
      line: 178
      upvalues:
        tutorial_upv_1 (copy, index: 1)
    ]]
    if a1.phase == "idle" then
        if a3 >= a1.holdGateX then
            if a5 then
                a1:enterDive()
            else
                a1.audio.play("whoosh", {})
                a1:enterHoldPrompt()
            end
        end
        return nil
    elseif a1.phase == "holdPrompt" then
        local v8 = a1:valleyApproach(a3)
        local v9 = tutorial_upv_1.slowScale + ((((a4 and 0) or (tutorial_upv_1.airborneFloorScale)) - tutorial_upv_1.slowScale) * v8)
        local v10
        if v8 <= 0 then
            v10 = tutorial_upv_1.slowEaseInRate
        else
            v10 = tutorial_upv_1.freezeEaseRate
        end
        a1:ease(v9, v10, a2)
        a1.prompt:show("PRESS & HOLD", "prompt")
        if a5 then
            a1:enterDive()
        end
        return nil
    elseif a1.phase == "dive" then
        a1.diveElapsed = a1.diveElapsed + a2
        a1:ease(1, tutorial_upv_1.slowEaseOutRate, a2)
        a1.prompt:show("KEEP HOLDING", "holding")
        if a5 then
            if a1.releaseGateX <= a3 and a4 and tutorial_upv_1.minDiveSeconds <= a1.diveElapsed then
                a1:enterReleasePrompt()
            end
        else
            a1:enterHoldPrompt()
        end
        return nil
    elseif a1.phase ~= "releasePrompt" then
        a1:ease(1, tutorial_upv_1.slowEaseOutRate, a2)
        if a1.scale >= 1 and a1.prompt:isHidden() then
            a1.phase = "off"
        end
    else
        a1:ease(0, tutorial_upv_1.freezeEaseRate, a2)
        a1.prompt:show("RELEASE", "urgent")
        if not (a5) then
            a1:complete()
        end
        return nil
    end
end
u2.valleyApproach = function(a1, a2)
    --[[
      name: valleyApproach
      line: 239
      upvalues:
        tutorial_upv_1 (copy, index: 1)
    ]]
    return (math.clamp((a2 - a1.freezeStartX) / tutorial_upv_1.freezeLeadStuds, 0, 1))
end
u2.enterHoldPrompt = function(a1)
    --[[
      name: enterHoldPrompt
      line: 242
    ]]
    a1.phase = "holdPrompt"
    a1.diveElapsed = 0
end
u2.enterDive = function(a1)
    --[[
      name: enterDive
      line: 246
    ]]
    a1.phase = "dive"
    a1.diveElapsed = 0
end
u2.enterReleasePrompt = function(a1)
    --[[
      name: enterReleasePrompt
      line: 250
    ]]
    a1.phase = "releasePrompt"
    a1.audio.play("whoosh", {})
end
u2.complete = function(a1)
    --[[
      name: complete
      line: 257
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
    ]]
    a1.phase = "done"
    a1.completedThisSession = true
    a1.prompt:hide()
    a1.audio.play("whoosh", {})
    a1.onCompleted()
    ClientEvents_upv_1.markTutorialSeen:fire("tiny-wings")
end
u2.ease = function(a1, a2, a3, a4)
    --[[
      name: ease
      line: 268
    ]]
    a1.scale = a1.scale + ((a2 - a1.scale) * math.min(a4 * a3, 1))
    if math.abs(a1.scale - a2) >= 0.005 then
        return
    end
    a1.scale = a2
end
u2.declineReason = function(a1)
    --[[
      name: declineReason
      line: 274
      upvalues:
        tutorialDeclineReason_upv_1 (copy, index: 1)
    ]]
    return tutorialDeclineReason_upv_1({completedThisSession = a1.completedThisSession})
end
local tbl_4 = {}
tbl_4.TinyWingsTutorial = u2
return tbl_4