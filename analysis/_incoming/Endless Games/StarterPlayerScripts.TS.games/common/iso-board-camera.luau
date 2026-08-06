-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local portraitCameraDistance_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "camera-framing").portraitCameraDistance
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 43
    ]]
    return "IsoBoardCamera"
end
local u1 = setmetatable(tbl_1, tbl_2)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 48
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u1)
    return v1:constructor(...) or v1
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 52
    ]]
    a1.stage = a2
    a1.spec = a3
    a1.boardExtentStuds = 0
    a1.lastViewportX = -1
    a1.lastViewportY = -1
    a1.dirty = true
    a1.cameraCFrame = CFrame.new()
    a1.focus = a2.origin
end
u1.setBoardExtent = function(a1, a2)
    --[[
      name: setBoardExtent
      line: 62
    ]]
    if a2 ~= a1.boardExtentStuds then
        a1.boardExtentStuds = a2
        a1.dirty = true
    else
        return nil
    end
end
u1.setFocus = function(a1, a2)
    --[[
      name: setFocus
      line: 69
    ]]
    if a2 ~= a1.focus then
        a1.focus = a2
        a1.dirty = true
    else
        return nil
    end
end
u1.setResolveListener = function(a1, a2)
    --[[
      name: setResolveListener
      line: 76
    ]]
    a1.resolveListener = a2
    a1.dirty = true
end
u1.update = function(a1)
    --[[
      name: update
      line: 80
      upvalues:
        portraitCameraDistance_upv_1 (copy, index: 1)
    ]]
    local camera_1 = a1.stage.camera
    local ViewportSize_1 = camera_1.ViewportSize
    if ViewportSize_1.X ~= a1.lastViewportX or ViewportSize_1.Y ~= a1.lastViewportY or a1.dirty then
        a1.lastViewportX = ViewportSize_1.X
        a1.lastViewportY = ViewportSize_1.Y
        a1.dirty = false
        camera_1.FieldOfView = a1.spec.fieldOfView
        a1.cameraCFrame = CFrame.lookAt(a1.focus - (a1.spec.lookDirection.Unit * portraitCameraDistance_upv_1(a1.spec.distanceBase + (a1.boardExtentStuds * a1.spec.distancePerExtent), a1.spec.portraitZoomOut, ViewportSize_1, a1.spec.portraitMaxZoomOut)), a1.focus)
        local resolveListener_1 = a1.resolveListener
        if resolveListener_1 ~= nil then
            resolveListener_1(a1.cameraCFrame, ViewportSize_1)
        end
    end
    a1.stage.setCameraCFrame(a1.cameraCFrame)
end
local tbl_3 = {}
tbl_3.IsoBoardCamera = u1
return tbl_3