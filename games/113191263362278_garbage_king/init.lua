--!strict

local Players = game:GetService("Players")

local Remotes = require(script:WaitForChild("remotes"))
local featuresFolder = script:WaitForChild("features")
local featureModules = {
    require(featuresFolder:WaitForChild("farm")),
    require(featuresFolder:WaitForChild("inventory")),
    require(featuresFolder:WaitForChild("teleports")),
    require(featuresFolder:WaitForChild("visuals")),
}

local activeCleanup: (() -> ())? = nil
local activeWindow: any? = nil

local module = {
    Meta = {
        Name = "Garbage King",
        DisplayName = "Garbage King",
        Version = "1.0.0",
        Author = "5AM Hub",
        PlaceIds = { 113191263362278 },
        Description = "Trash searching, selling, inventory, ESP, and location tools for Garbage King.",
    },
}

function module.Init(UI: any, Loader: any)
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
    if activeWindow and activeWindow.Destroy then
        activeWindow:Destroy()
        activeWindow = nil
    end

    local localPlayer = Players.LocalPlayer
    if not localPlayer then
        UI:Notify({
            Title = "Garbage King",
            Content = "The local player is not available yet.",
            Duration = 6,
        })
        return nil
    end

    local window = UI:CreateWindow({
        Title = "5AM Hub",
        SubTitle = "Garbage King",
    })
    local cleanupTasks: {() -> ()} = {}
    local remotes = Remotes.new()
    local environment = if Loader and Loader.Utils and Loader.Utils.GetEnvironment
        then Loader.Utils:GetEnvironment()
        else {}

    local context = {
        UI = UI,
        Loader = Loader,
        Window = window,
        Flags = UI.Flags,
        Remotes = remotes,
        Environment = environment,
        LocalPlayer = localPlayer,

        Notify = function(title: string, content: string, duration: number?)
            UI:Notify({
                Title = title,
                Content = content,
                Duration = duration or 4,
            })
        end,

        GetCharacter = function(): Model?
            return localPlayer.Character
        end,

        GetRoot = function(): BasePart?
            local character = localPlayer.Character
            return if character then character:FindFirstChild("HumanoidRootPart") :: BasePart? else nil
        end,

        GetInventory = function(): Instance?
            return localPlayer:FindFirstChild("Inventory")
        end,
    }

    for _, feature in featureModules do
        local ok, cleanupOrError = pcall(feature.Init, context)
        if ok and type(cleanupOrError) == "function" then
            table.insert(cleanupTasks, cleanupOrError)
        elseif not ok then
            context.Notify(
                "Garbage King feature failed",
                string.format("%s: %s", tostring(feature.Name), tostring(cleanupOrError)),
                7
            )
        end
    end

    local cleaned = false
    local Cleanup: () -> ()
    Cleanup = function()
        if cleaned then
            return
        end
        cleaned = true

        for index = #cleanupTasks, 1, -1 do
            pcall(cleanupTasks[index])
        end
        table.clear(cleanupTasks)
        remotes:ClearCache()
    end

    activeCleanup = Cleanup
    activeWindow = window

    if window.Instance and window.Instance.Destroying then
        local destroyingConnection: RBXScriptConnection?
        destroyingConnection = window.Instance.Destroying:Connect(function()
            Cleanup()
            if destroyingConnection then
                destroyingConnection:Disconnect()
                destroyingConnection = nil
            end
            if activeCleanup == Cleanup then
                activeCleanup = nil
            end
            if activeWindow == window then
                activeWindow = nil
            end
        end)
    end

    return window
end

function module.Destroy()
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
    if activeWindow and activeWindow.Destroy then
        activeWindow:Destroy()
        activeWindow = nil
    end
end

return module
