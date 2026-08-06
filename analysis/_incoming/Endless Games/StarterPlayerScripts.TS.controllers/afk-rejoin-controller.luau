-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local RunService_upv_1 = v1.RunService
local UserInputService_upv_1 = v1.UserInputService
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "network").ClientEvents
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local AFK_REJOIN_IDLE_SECONDS_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "constants").AFK_REJOIN_IDLE_SECONDS
local tbl_upv_1 = {}
tbl_upv_1[Enum.UserInputType.Keyboard] = true
tbl_upv_1[Enum.UserInputType.MouseButton1] = true
tbl_upv_1[Enum.UserInputType.MouseButton2] = true
tbl_upv_1[Enum.UserInputType.MouseButton3] = true
tbl_upv_1[Enum.UserInputType.MouseWheel] = true
tbl_upv_1[Enum.UserInputType.MouseMovement] = true
tbl_upv_1[Enum.UserInputType.Touch] = true
tbl_upv_1[Enum.UserInputType.Gamepad1] = true
tbl_upv_1[Enum.UserInputType.Gamepad2] = true
tbl_upv_1[Enum.UserInputType.Gamepad3] = true
tbl_upv_1[Enum.UserInputType.Gamepad4] = true
tbl_upv_1[Enum.UserInputType.Gamepad5] = true
tbl_upv_1[Enum.UserInputType.Gamepad6] = true
tbl_upv_1[Enum.UserInputType.Gamepad7] = true
tbl_upv_1[Enum.UserInputType.Gamepad8] = true
local tbl_upv_2 = {}
tbl_upv_2[Enum.UserInputType.Gamepad1] = true
tbl_upv_2[Enum.UserInputType.Gamepad2] = true
tbl_upv_2[Enum.UserInputType.Gamepad3] = true
tbl_upv_2[Enum.UserInputType.Gamepad4] = true
tbl_upv_2[Enum.UserInputType.Gamepad5] = true
tbl_upv_2[Enum.UserInputType.Gamepad6] = true
tbl_upv_2[Enum.UserInputType.Gamepad7] = true
tbl_upv_2[Enum.UserInputType.Gamepad8] = true
local tbl_3 = {}
local tbl_4 = {}
tbl_4.__tostring = function()
    --[[
      name: __tostring
      line: 102
    ]]
    return "AfkRejoinController"
end
local u1 = setmetatable(tbl_3, tbl_4)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 107
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v2 = setmetatable({}, u1)
    return v2:constructor(...) or v2
end
u1.constructor = function(a1)
    --[[
      name: constructor
      line: 111
    ]]
    a1.lastActivityAt = os.clock()
    a1.lastRequestAt = -math.huge
    a1.sinceCheckSeconds = 0
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 116
      upvalues:
        UserInputService_upv_1 (copy, index: 1)
        RunService_upv_1 (copy, index: 2)
    ]]
    UserInputService_upv_1.InputBegan:Connect(
        function(a2)
            --[[
              line: 117
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:noteDigital(a2)
        end
    )
    UserInputService_upv_1.InputEnded:Connect(
        function(a3)
            --[[
              line: 120
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:noteDigital(a3)
        end
    )
    UserInputService_upv_1.InputChanged:Connect(
        function(a4)
            --[[
              line: 123
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:noteAnalogue(a4)
        end
    )
    UserInputService_upv_1.WindowFocused:Connect(
        function()
            --[[
              line: 126
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:noteActivity()
        end
    )
    RunService_upv_1.Heartbeat:Connect(
        function(a5)
            --[[
              line: 129
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:tick(a5)
        end
    )
end
u1.noteDigital = function(a1, a2)
    --[[
      name: noteDigital
      line: 133
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    if tbl_upv_1[a2.UserInputType] ~= nil then
        a1:noteActivity()
    else
        return nil
    end
end
u1.noteAnalogue = function(a1, a2)
    --[[
      name: noteAnalogue
      line: 140
      upvalues:
        tbl_upv_1 (copy, index: 1)
        tbl_upv_2 (copy, index: 2)
    ]]
    local UserInputType_1 = a2.UserInputType
    if tbl_upv_1[UserInputType_1] ~= nil then
        if UserInputType_1 ~= Enum.UserInputType.MouseMovement and UserInputType_1 ~= Enum.UserInputType.Touch then
            if tbl_upv_2[UserInputType_1] == nil or a2.Position.Magnitude > 0.2 then
                a1:noteActivity()
                return
            end
            return nil
        end
        if a2.Delta.Magnitude <= 0 then
            return nil
        end
        a1:noteActivity()
    else
        return nil
    end
end
u1.noteActivity = function(a1)
    --[[
      name: noteActivity
      line: 158
    ]]
    a1.lastActivityAt = os.clock()
    a1.lastRequestAt = -math.huge
end
u1.tick = function(a1, a2)
    --[[
      name: tick
      line: 163
      upvalues:
        AFK_REJOIN_IDLE_SECONDS_upv_1 (copy, index: 1)
        sessionAtom_upv_1 (copy, index: 2)
        ClientEvents_upv_1 (copy, index: 3)
    ]]
    a1.sinceCheckSeconds = a1.sinceCheckSeconds + a2
    local v3 = nil
    if a1.sinceCheckSeconds >= 1 then
        a1.sinceCheckSeconds = 0
        v3 = os.clock()
        if v3 - a1.lastActivityAt >= AFK_REJOIN_IDLE_SECONDS_upv_1 then
            local v4 = nil
            if v3 - a1.lastRequestAt >= 45 then
                v4 = sessionAtom_upv_1()
                if v4 ~= nil then
                    v4 = v4.reviveState
                end
                if v4 ~= "purchasing" then
                    a1.lastRequestAt = v3
                    ClientEvents_upv_1.requestAfkRejoin:fire()
                else
                    return nil
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/afk-rejoin-controller@AfkRejoinController")
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_5 = {}
tbl_5.AfkRejoinController = u1
return tbl_5