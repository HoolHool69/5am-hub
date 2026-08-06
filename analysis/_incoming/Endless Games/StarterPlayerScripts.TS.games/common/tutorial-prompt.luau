-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local Players_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local hudHiddenAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").hudHiddenAtom
local u1 = Color3.fromRGB(255, 255, 255)
local u2 = Color3.fromRGB(10, 14, 22)
local tbl_1 = {}
tbl_1.urgentColor = Color3.fromRGB(255, 216, 102)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 73
    ]]
    return "TutorialPrompt"
end
local u4 = setmetatable(tbl_2, tbl_3)
u4.__index = u4
u4.new = function(...)
    --[[
      name: new
      line: 78
      upvalues:
        u4 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u4)
    return v1:constructor(...) or v1
end
u4.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 82
      upvalues:
        u1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
        u2 (copy, index: 3)
        subscribe_upv_1 (copy, index: 4)
        hudHiddenAtom_upv_1 (copy, index: 5)
    ]]
    a1.style = a3
    a1.clock = 0
    a1.tone = "prompt"
    a1.scale = 1
    a1.targetScale = 1
    a1.transparency = 1
    a1.targetTransparency = 1
    a1.color = u1
    a1.rise = 0
    a1.targetRise = 0
    a1.isExiting = false
    a1.layer = Instance.new("ScreenGui")
    a1.layer.Name = a2
    a1.layer.ResetOnSpawn = false
    a1.layer.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    a1.layer.DisplayOrder = 1
    a1.layer.Enabled = false
    a1.layer.Parent = Players_upv_1.LocalPlayer:WaitForChild("PlayerGui")
    a1.block = Instance.new("Frame")
    a1.block.BackgroundTransparency = 1
    a1.block.AnchorPoint = Vector2.new(0.5, 0.5)
    a1.block.Position = UDim2.fromScale(0.5, a3.centerY)
    a1.block.Size = UDim2.fromScale(a3.widthScale, a3.heightScale)
    a1.block.Parent = a1.layer
    a1.uiScale = Instance.new("UIScale")
    a1.uiScale.Parent = a1.block
    a1.shadow = a1:makeLabel(u2, 1)
    a1.shadow.Position = UDim2.fromOffset(0, 3)
    a1.caption = a1:makeLabel(u1, 2)
    a1.stroke = Instance.new("UIStroke")
    a1.stroke.Thickness = 3
    a1.stroke.Color = u2
    a1.stroke.Parent = a1.caption
    a1:applyVisuals()
    a1.unsubscribeHudHidden = subscribe_upv_1(
        hudHiddenAtom_upv_1,
        function()
            --[[
              line: 118
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:applyEnabled()
        end
    )
end
u4.show = function(a1, a2, a3)
    --[[
      name: show
      line: 122
      upvalues:
        u1 (copy, index: 1)
    ]]
    local v2 = a1.isExiting or (a1.targetTransparency >= 0.999)
    a1.isExiting = false
    a1.targetTransparency = 0
    if a1.caption.Text ~= a2 then
        a1.caption.Text = a2
        a1.shadow.Text = a2
    end
    if a1.tone ~= a3 or v2 then
        a1.tone = a3
        if v2 then
            a1.scale = 1 / a1.style.overshootScale
        elseif a3 == "urgent" then
            a1.scale = a1.style.overshootScale
        end
    end
    a1.targetScale = ((a3 ~= "holding") and 1) or (a1.style.holdingScale)
    a1.targetTransparency = ((a3 ~= "holding") and 0) or (a1.style.holdingTransparency)
    a1.targetRise = ((a3 ~= "holding") and 0) or (a1.style.holdingRiseScale)
    local v3
    if a3 ~= "urgent" then
        v3 = u1
    else
        v3 = a1.style.urgentColor
    end
    a1.color = v3
    a1:applyEnabled()
end
u4.hide = function(a1)
    --[[
      name: hide
      line: 146
    ]]
    if a1.isExiting then
        return nil
    end
    a1.isExiting = true
    a1.targetTransparency = 1
    a1.targetScale = a1.style.exitScale
    a1.targetRise = 0
end
u4.reset = function(a1)
    --[[
      name: reset
      line: 155
    ]]
    a1.isExiting = false
    a1.transparency = 1
    a1.targetTransparency = 1
    a1.scale = 1
    a1.targetScale = 1
    a1.rise = 0
    a1.targetRise = 0
    a1.tone = "prompt"
    a1:applyVisuals()
    a1:applyEnabled()
end
u4.isHidden = function(a1)
    --[[
      name: isHidden
      line: 167
    ]]
    return a1.transparency >= 0.999
end
local function u3(a1, a2)
    --[[
      name: update
      line: 170
      upvalues:
        u3 (ref, index: 1)
    ]]
    if a1:isHidden() and a1.targetTransparency >= 0.999 then
        return nil
    end
    local v4
    if a1.tone ~= "urgent" then
        v4 = a1.style.pulseSeconds
    else
        v4 = a1.style.pulseUrgentSeconds
    end
    a1.clock = (a1.clock + (a2 / v4)) % 1
    local v5
    if a1.transparency >= a1.targetTransparency then
        v5 = a1.style.fadeInSeconds
    else
        v5 = a1.style.fadeOutSeconds
    end
    a1.transparency = u3(a1.transparency, a1.targetTransparency, a2 / v5)
    local v6 = math.min(a2 * a1.style.captionBlendRate, 1)
    a1.scale = a1.scale + ((a1.targetScale - a1.scale) * v6)
    a1.rise = a1.rise + ((a1.targetRise - a1.rise) * v6)
    a1.caption.TextColor3 = a1.caption.TextColor3:Lerp(a1.color, v6)
    a1:applyVisuals()
    if not a1:isHidden() then
        return
    end
    a1:applyEnabled()
end
u4.update = u3
u4.destroy = function(a1)
    --[[
      name: destroy
      line: 187
    ]]
    a1.unsubscribeHudHidden()
    a1.layer:Destroy()
end
u4.applyVisuals = function(a1)
    --[[
      name: applyVisuals
      line: 191
    ]]
    local v7 = ((a1.tone ~= "holding") and (math.sin((a1.clock * math.pi) * 2) * a1.style.pulseAmplitude)) or 0
    a1.uiScale.Scale = a1.scale * (1 + v7)
    a1.block.Position = UDim2.fromScale(0.5, a1.style.centerY - a1.rise)
    a1.caption.TextTransparency = a1.transparency
    a1.stroke.Transparency = a1.transparency
    a1.shadow.TextTransparency = math.min(a1.transparency + 0.25, 1)
end
u4.applyEnabled = function(a1)
    --[[
      name: applyEnabled
      line: 201
      upvalues:
        hudHiddenAtom_upv_1 (copy, index: 1)
    ]]
    local v8 = not a1:isHidden() and (not hudHiddenAtom_upv_1())
    if a1.layer.Enabled == v8 then
        return
    end
    a1.layer.Enabled = v8
end
u4.makeLabel = function(a1, a2, a3)
    --[[
      name: makeLabel
      line: 207
    ]]
    local v9 = Instance.new("TextLabel")
    v9.BackgroundTransparency = 1
    v9.Size = UDim2.fromScale(1, 1)
    v9.Font = Enum.Font.GothamBlack
    v9.TextScaled = true
    v9.TextColor3 = a2
    v9.TextTransparency = 1
    v9.Text = ""
    v9.ZIndex = a3
    v9.Parent = a1.block
    return v9
end
u3 = function(a1, a2, a3)
    --[[
      name: march
      line: 222
    ]]
    if a1 >= a2 then
        return (math.max(a1 - a3, a2))
    end
    return (math.min(a1 + a3, a2))
end
local tbl_4 = {}
tbl_4.DEFAULT_TUTORIAL_PROMPT_STYLE = tbl_1
tbl_4.TutorialPrompt = u4
return tbl_4