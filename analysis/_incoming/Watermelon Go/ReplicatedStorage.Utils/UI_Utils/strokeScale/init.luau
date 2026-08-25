-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local signal_1 = require(script:WaitForChild("signal"))
local Heartbeat_upv_1 = game:GetService("RunService").Heartbeat
local CurrentCamera_upv_1 = workspace.CurrentCamera
local u1 = signal_1.new()
local tbl_upv_1 = {}
local CurrentCamera_upv_2 = workspace.CurrentCamera
local u2 = Vector2.new(2070, 1045)
function GetOriginalThickness(a1)
    --[[
      name: GetOriginalThickness
      line: 82
    ]]
    local v1 = a1:GetAttribute("StrokeScaleOriginalThickness")
    if v1 then
        return v1
    end
    a1:SetAttribute("StrokeScaleOriginalThickness", a1.Thickness)
    return a1.Thickness
end
local function average(a1)
    --[[
      name: average
      line: 100
    ]]
    return (a1.X + a1.Y) / 2
end
local function getScreenRatio()
    --[[
      name: getScreenRatio
      line: 105
      upvalues:
        CurrentCamera_upv_2 (copy, index: 1)
        u2 (copy, index: 2)
    ]]
    local ViewportSize_1 = CurrentCamera_upv_2.ViewportSize
    return ((ViewportSize_1.X + ViewportSize_1.Y) / 2) / ((u2.X + u2.Y) / 2)
end
function scaleGuiObject(a1, a2, a3, a4)
    --[[
      name: scaleGuiObject
      line: 109
      upvalues:
        tbl_upv_1 (copy, index: 1)
        CurrentCamera_upv_2 (copy, index: 2)
        u2 (copy, index: 3)
        CurrentCamera_upv_1 (copy, index: 4)
        u1 (copy, index: 5)
    ]]
    local u3 = GetOriginalThickness(a2)
    assert(a1 == tbl_upv_1, "Expected ':' not '.' calling member function ScaleGuiObject")
    local u4 = nil
    local tbl_upv_2 = {}
    local v2 = function()
        --[[
          line: 117
          upvalues:
            a2 (copy, index: 1)
            u3 (copy, index: 2)
            CurrentCamera_upv_2 (copy, index: 3)
            u2 (copy, index: 4)
            u4 (ref,  index: 5)
        ]]
        if a2:GetFullName() == a2.Name then
            u4()
        else
            local ViewportSize_2 = CurrentCamera_upv_2.ViewportSize
            a2.Thickness = u3 * (((ViewportSize_2.X + ViewportSize_2.Y) / 2) / ((u2.X + u2.Y) / 2))
        end
    end
    coroutine.wrap(v2)(CurrentCamera_upv_1.ViewportSize)
    local u5 = u1:Connect(v2)
    u4 = function()
        --[[
          line: 125
          upvalues:
            u5 (ref,  index: 1)
            tbl_upv_2 (copy, index: 2)
        ]]
        if not u5 then
            return
        end
        u5:Disconnect()
        u5 = nil
        for key_1, _ in pairs(tbl_upv_2) do
            tbl_upv_2[key_1] = nil
        end
    end
    tbl_upv_2.Disconnect = u4
    tbl_upv_2.disconnect = u4
    return tbl_upv_2
end
tbl_upv_1.scaleGuiObject = scaleGuiObject
tbl_upv_1.ScaleGuiObject = scaleGuiObject
local u6 = nil
CurrentCamera_upv_1:GetPropertyChangedSignal("ViewportSize"):Connect(
    function()
        --[[
          line: 145
          upvalues:
            u6 (ref,  index: 1)
            Heartbeat_upv_1 (copy, index: 2)
            u1 (copy, index: 3)
            CurrentCamera_upv_1 (copy, index: 4)
        ]]
        local time_1 = tick()
        u6 = time_1
        Heartbeat_upv_1:Wait()
        if u6 ~= time_1 then
            return
        end
        u1:Fire(CurrentCamera_upv_1.ViewportSize)
    end
)
return tbl_upv_1