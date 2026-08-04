--!strict

--[[
    5AM Hub
    File: ui/core/Drag.lua

    Mouse and touch dragging utility with explicit connection cleanup and
    support for separate moving objects and drag handles.
]]

local DragController = {}
DragController.__index = DragController

local Drag = {
    _controllers = setmetatable({}, { __mode = "k" }),
}

local function ResolveUserInputService(): any?
    local success, service = pcall(function()
        return game:GetService("UserInputService")
    end)

    if success then
        return service
    end

    return nil
end

local function IsGuiObject(value: any): boolean
    if typeof(value) ~= "Instance" then
        return false
    end

    local success, isGuiObject = pcall(function()
        return value:IsA("GuiObject")
    end)

    return success and isGuiObject
end

function DragController.Disconnect(self: any)
    if not self.Enabled then
        return
    end

    self.Enabled = false
    self._dragging = false
    self._activeInput = nil

    for _, connection in self._connections do
        pcall(function()
            connection:Disconnect()
        end)
    end

    table.clear(self._connections)

    if self._restoreHandleActive then
        pcall(function()
            self._handle.Active = self._originalHandleActive
        end)
    end

    if self._owner._controllers[self._target] == self then
        self._owner._controllers[self._target] = nil
    end

    self._target = nil
    self._handle = nil
end

DragController.Destroy = DragController.Disconnect

function Drag.Enable(self: any, targetObject: any, dragHandle: any?): any?
    local handle = dragHandle or targetObject

    if not IsGuiObject(targetObject) or not IsGuiObject(handle) then
        return nil
    end

    local userInputService = self._userInputService or ResolveUserInputService()
    if not userInputService then
        return nil
    end

    local existingController = self._controllers[targetObject]
    if existingController then
        existingController:Disconnect()
    end

    local originalHandleActive = false
    local restoreHandleActive = false

    local activeSuccess, activeValue = pcall(function()
        return handle.Active
    end)

    if activeSuccess then
        originalHandleActive = activeValue
        restoreHandleActive = true
        pcall(function()
            handle.Active = true
        end)
    end

    local controller = setmetatable({
        Enabled = true,
        _owner = self,
        _target = targetObject,
        _handle = handle,
        _connections = {},
        _dragging = false,
        _activeInput = nil,
        _dragStart = nil,
        _startPosition = nil,
        _originalHandleActive = originalHandleActive,
        _restoreHandleActive = restoreHandleActive,
    }, DragController)

    local function StopDragging()
        controller._dragging = false
        controller._activeInput = nil
        controller._dragStart = nil
        controller._startPosition = nil
    end

    local function BeginDragging(input: any)
        local inputType = input.UserInputType
        if inputType ~= Enum.UserInputType.MouseButton1 and inputType ~= Enum.UserInputType.Touch then
            return
        end

        local success, startPosition = pcall(function()
            return targetObject.Position
        end)

        if not success then
            return
        end

        controller._dragging = true
        controller._activeInput = input
        controller._dragStart = input.Position
        controller._startPosition = startPosition
    end

    local function UpdateDragging(input: any)
        if not controller.Enabled or not controller._dragging then
            return
        end

        local activeInput = controller._activeInput
        if not activeInput then
            return
        end

        local activeInputType = activeInput.UserInputType
        local isRelevantInput = if activeInputType == Enum.UserInputType.Touch
            then input == activeInput
            else input.UserInputType == Enum.UserInputType.MouseMovement

        if not isRelevantInput then
            return
        end

        local dragStart = controller._dragStart
        local startPosition = controller._startPosition
        if not dragStart or not startPosition then
            return
        end

        local delta = input.Position - dragStart
        local updateSuccess = pcall(function()
            targetObject.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end)

        if not updateSuccess then
            controller:Disconnect()
        end
    end

    local function EndDragging(input: any)
        if not controller._dragging then
            return
        end

        local activeInput = controller._activeInput
        if not activeInput then
            StopDragging()
            return
        end

        if input == activeInput or (
            activeInput.UserInputType == Enum.UserInputType.MouseButton1
            and input.UserInputType == Enum.UserInputType.MouseButton1
        ) then
            StopDragging()
        end
    end

    local connectSuccess = pcall(function()
        table.insert(controller._connections, handle.InputBegan:Connect(BeginDragging))
        table.insert(controller._connections, userInputService.InputChanged:Connect(UpdateDragging))
        table.insert(controller._connections, userInputService.InputEnded:Connect(EndDragging))
        table.insert(controller._connections, targetObject.Destroying:Connect(function()
            controller:Disconnect()
        end))

        if handle ~= targetObject then
            table.insert(controller._connections, handle.Destroying:Connect(function()
                controller:Disconnect()
            end))
        end
    end)

    if not connectSuccess then
        controller:Disconnect()
        return nil
    end

    self._userInputService = userInputService
    self._controllers[targetObject] = controller

    return controller
end

function Drag.Disable(self: any, targetObject: any): boolean
    local controller = self._controllers[targetObject]
    if not controller then
        return false
    end

    controller:Disconnect()
    return true
end

Drag._userInputService = ResolveUserInputService()

return Drag
