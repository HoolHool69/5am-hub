--!strict

--[[
    5AM Hub
    File: loader/keysystem.lua

    Temporary development authentication isolated from loader startup so it
    can be replaced by the production key provider without changing callers.
]]

local Utils = require(script.Parent:WaitForChild("utils"))

local KeySystem = {
    DevelopmentKey = "5AM-DEV",
}

local function Result(success: boolean, code: string, message: string): any
    return {
        Success = success,
        Code = code,
        Message = message,
    }
end

local function NormalizeKey(key: any): string?
    if type(key) ~= "string" then
        return nil
    end

    local normalized = string.match(key, "^%s*(.-)%s*$") or ""
    return if normalized == "" then nil else normalized
end

function KeySystem:IsDevelopmentMode(): boolean
    return Utils:GetEnvironment().FiveAMDevMode == true
end

function KeySystem:ValidateDevelopmentKey(key: any): any
    local normalizedKey = NormalizeKey(key)

    if normalizedKey == self.DevelopmentKey then
        return Result(true, "DEVELOPMENT_KEY_ACCEPTED", "Development key accepted")
    end

    return Result(false, "INVALID_DEVELOPMENT_KEY", "Invalid key. Use the current development key.")
end

function KeySystem:ValidateKey(key: any): any
    -- Future Luarmor authentication request should be integrated here,
    -- replacing only this development validator while preserving the result contract.
    return self:ValidateDevelopmentKey(key)
end

function KeySystem:PromptForKey(): any
    local screenGui = Utils:Create("ScreenGui", {
        Name = "FiveAMHubKeyPrompt",
        DisplayOrder = 1000,
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
    })

    local parentSuccess, parentError = Utils:ParentGui(screenGui)
    if not parentSuccess then
        screenGui:Destroy()
        return Result(false, "KEY_UI_UNAVAILABLE", parentError or "Unable to display the key prompt")
    end

    local overlay = Utils:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(10, 10, 14),
        BackgroundTransparency = 0.28,
        Size = UDim2.fromScale(1, 1),
        ZIndex = 1,
    }, screenGui)

    local card = Utils:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(24, 22, 31),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(360, 224),
        ZIndex = 2,
    }, overlay)
    Utils:Create("UICorner", { CornerRadius = UDim.new(0, 10) }, card)
    Utils:Create("UIStroke", {
        Color = Color3.fromRGB(68, 55, 88),
        Thickness = 1,
    }, card)

    Utils:Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        Position = UDim2.fromOffset(18, 15),
        Size = UDim2.new(1, -56, 0, 24),
        Text = "5AM Hub",
        TextColor3 = Color3.fromRGB(247, 244, 252),
        TextSize = 17,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 3,
    }, card)

    Utils:Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        Position = UDim2.fromOffset(18, 43),
        Size = UDim2.new(1, -36, 0, 35),
        Text = "Enter the temporary development key to continue.",
        TextColor3 = Color3.fromRGB(190, 179, 207),
        TextSize = 12,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        ZIndex = 3,
    }, card)

    local closeButton = Utils:Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0),
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        Position = UDim2.new(1, -10, 0, 10),
        Size = UDim2.fromOffset(28, 28),
        Text = "×",
        TextColor3 = Color3.fromRGB(190, 179, 207),
        TextSize = 20,
        ZIndex = 4,
    }, card)

    local keyInput = Utils:Create("TextBox", {
        BackgroundColor3 = Color3.fromRGB(37, 29, 52),
        ClearTextOnFocus = false,
        Font = Enum.Font.Gotham,
        PlaceholderColor3 = Color3.fromRGB(112, 101, 128),
        PlaceholderText = "Development key",
        Position = UDim2.fromOffset(18, 86),
        Size = UDim2.new(1, -36, 0, 40),
        Text = "",
        TextColor3 = Color3.fromRGB(247, 244, 252),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 3,
    }, card)
    Utils:Create("UICorner", { CornerRadius = UDim.new(0, 7) }, keyInput)
    Utils:Create("UIPadding", {
        PaddingLeft = UDim.new(0, 11),
        PaddingRight = UDim.new(0, 11),
    }, keyInput)

    local statusLabel = Utils:Create("TextLabel", {
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        Position = UDim2.fromOffset(18, 130),
        Size = UDim2.new(1, -36, 0, 24),
        Text = "",
        TextColor3 = Color3.fromRGB(248, 113, 113),
        TextSize = 12,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 3,
    }, card)

    local submitButton = Utils:Create("TextButton", {
        AutoButtonColor = false,
        BackgroundColor3 = Color3.fromRGB(139, 92, 246),
        Font = Enum.Font.GothamBold,
        Position = UDim2.fromOffset(18, 166),
        Size = UDim2.new(1, -36, 0, 40),
        Text = "Continue",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        ZIndex = 3,
    }, card)
    Utils:Create("UICorner", { CornerRadius = UDim.new(0, 7) }, submitButton)

    local resultEvent = Instance.new("BindableEvent")
    local connections = {}
    local completed = false
    local finalResult = Result(false, "KEY_PROMPT_CLOSED", "Authentication was cancelled")

    local function Complete(result: any)
        if completed then
            return
        end

        completed = true
        finalResult = result
        resultEvent:Fire()
    end

    local function Submit()
        local validationResult = self:ValidateKey(keyInput.Text)

        if validationResult.Success then
            statusLabel.Text = validationResult.Message
            statusLabel.TextColor3 = Color3.fromRGB(52, 211, 153)
            Complete(validationResult)
        else
            statusLabel.Text = validationResult.Message
            statusLabel.TextColor3 = Color3.fromRGB(248, 113, 113)
            keyInput:CaptureFocus()
        end
    end

    table.insert(connections, submitButton.Activated:Connect(Submit))
    table.insert(connections, closeButton.Activated:Connect(function()
        Complete(Result(false, "KEY_PROMPT_CANCELLED", "Authentication was cancelled"))
    end))
    table.insert(connections, keyInput.FocusLost:Connect(function(enterPressed: boolean)
        if enterPressed then
            Submit()
        end
    end))
    table.insert(connections, screenGui.Destroying:Connect(function()
        Complete(Result(false, "KEY_PROMPT_DESTROYED", "The authentication prompt was closed"))
    end))

    task.defer(function()
        if not completed and keyInput.Parent then
            keyInput:CaptureFocus()
        end
    end)

    resultEvent.Event:Wait()
    Utils:DisconnectAll(connections)
    resultEvent:Destroy()
    screenGui:Destroy()

    return finalResult
end

function KeySystem:Authenticate(providedKey: any?): any
    if self:IsDevelopmentMode() then
        return Result(true, "DEVELOPMENT_MODE_ENABLED", "Authenticated through FiveAMDevMode")
    end

    local normalizedKey = NormalizeKey(providedKey)
    if not normalizedKey then
        return self:PromptForKey()
    end

    return self:ValidateKey(normalizedKey)
end

return KeySystem
