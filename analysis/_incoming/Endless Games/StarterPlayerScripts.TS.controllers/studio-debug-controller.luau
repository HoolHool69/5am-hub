-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService_upv_1 = v1.RunService
local UserInputService_upv_1 = v1.UserInputService
local Workspace_upv_1 = v1.Workspace
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local studioOrientationOverrideAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "orientation-atom").studioOrientationOverrideAtom
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v2.gameFrozenAtom
local hudHiddenAtom_upv_1 = v2.hudHiddenAtom
local v3 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "gotd-hub-experiment")
local GOTD_HUB_FORCE_ENROL_ATTRIBUTE_upv_1 = v3.GOTD_HUB_FORCE_ENROL_ATTRIBUTE
local GOTD_HUB_OVERRIDE_ATTRIBUTE_upv_1 = v3.GOTD_HUB_OVERRIDE_ATTRIBUTE
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 45
    ]]
    return "StudioDebugController"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 50
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v4 = setmetatable({}, u1)
    return v4:constructor(...) or v4
end
u1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 54
    ]]
    a1.colorSchemes = a2
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 57
      upvalues:
        RunService_upv_1 (copy, index: 1)
        UserInputService_upv_1 (copy, index: 2)
    ]]
    if RunService_upv_1:IsStudio() then
        UserInputService_upv_1.InputBegan:Connect(
            function(a2, a3)
                --[[
                  line: 63
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onInputBegan(a2, a3)
            end
        )
    else
        return nil
    end
end
u1.onInputBegan = function(a1, a2, a3)
    --[[
      name: onInputBegan
      line: 67
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        hudHiddenAtom_upv_1 (copy, index: 2)
        gameFrozenAtom_upv_1 (copy, index: 3)
    ]]
    if a3 then
        return nil
    elseif a2.KeyCode == Enum.KeyCode.T then
        a1.colorSchemes:cycleScheme()
        return nil
    elseif a2.KeyCode == Enum.KeyCode.Y then
        a1.colorSchemes:toggleGotdStyle()
        return nil
    elseif a2.KeyCode == Enum.KeyCode.O then
        a1:cycleGotdArm()
        return nil
    elseif a2.KeyCode == Enum.KeyCode.I then
        a1:toggleOrientation()
        return nil
    elseif sessionAtom_upv_1() == nil then
        return nil
    elseif a2.KeyCode == Enum.KeyCode.K then
        local u2 = not hudHiddenAtom_upv_1()
        hudHiddenAtom_upv_1(
            function()
                --[[
                  line: 95
                  upvalues:
                    u2 (copy, index: 1)
                ]]
                return u2
            end
        )
        print((("[StudioDebugController] in-game UI %* (K toggles)"):format((u2 and "hidden") or "restored")))
    elseif a2.KeyCode == Enum.KeyCode.F then
        local u3 = not gameFrozenAtom_upv_1()
        gameFrozenAtom_upv_1(
            function()
                --[[
                  line: 101
                  upvalues:
                    u3 (copy, index: 1)
                ]]
                return u3
            end
        )
        print((("[StudioDebugController] game %* (F toggles)"):format((u3 and "frozen") or "unfrozen")))
    end
end
u1.cycleGotdArm = function(a1)
    --[[
      name: cycleGotdArm
      line: 107
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        GOTD_HUB_OVERRIDE_ATTRIBUTE_upv_1 (copy, index: 2)
        GOTD_HUB_FORCE_ENROL_ATTRIBUTE_upv_1 (copy, index: 3)
    ]]
    local v5 = Workspace_upv_1:GetAttribute(GOTD_HUB_OVERRIDE_ATTRIBUTE_upv_1)
    if v5 == "g" then
        Workspace_upv_1:SetAttribute(GOTD_HUB_OVERRIDE_ATTRIBUTE_upv_1, "h")
        Workspace_upv_1:SetAttribute(GOTD_HUB_FORCE_ENROL_ATTRIBUTE_upv_1, true)
        print("[StudioDebugController] GotdHub arm: H \226\128\148 GOTD HIDDEN, grid extended (O cycles)")
    elseif v5 ~= "h" then
        Workspace_upv_1:SetAttribute(GOTD_HUB_OVERRIDE_ATTRIBUTE_upv_1, "g")
        Workspace_upv_1:SetAttribute(GOTD_HUB_FORCE_ENROL_ATTRIBUTE_upv_1, true)
        print("[StudioDebugController] GotdHub arm: G \226\128\148 GOTD SHOWN (O cycles)")
    else
        Workspace_upv_1:SetAttribute(GOTD_HUB_OVERRIDE_ATTRIBUTE_upv_1, nil)
        Workspace_upv_1:SetAttribute(GOTD_HUB_FORCE_ENROL_ATTRIBUTE_upv_1, nil)
        print("[StudioDebugController] GotdHub arm: OFF \226\128\148 real assignment, real enrolment (O cycles)")
    end
end
u1.toggleOrientation = function(a1)
    --[[
      name: toggleOrientation
      line: 129
      upvalues:
        studioOrientationOverrideAtom_upv_1 (copy, index: 1)
    ]]
    local u4 = ((studioOrientationOverrideAtom_upv_1() ~= "portrait") and "portrait") or nil
    studioOrientationOverrideAtom_upv_1(
        function()
            --[[
              line: 131
              upvalues:
                u4 (copy, index: 1)
            ]]
            return u4
        end
    )
    print((("[StudioDebugController] layout: %* (I toggles portrait)"):format(u4 or "FOLLOW VIEWPORT")))
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/studio-debug-controller@StudioDebugController")
Reflect_1.defineMetadata(u1, "flamework:parameters", {"client/controllers/color-scheme-controller@ColorSchemeController"})
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_3 = {}
tbl_3.StudioDebugController = u1
return tbl_3