--!strict

local Players = game:GetService("Players")

local Remotes = require(script.remotes)
local Runtime = require(script.runtime)
local featureModules = {
    require(script.features.session),
    require(script.features.automation),
    require(script.features.minigames),
}

local activeCleanup: (() -> ())? = nil
local activeWindow: any? = nil
local activeOwnsWindow = false
local activeLoader: any? = nil

local module = {
    Meta = {
        Name = "Endless Games",
        DisplayName = "Endless Games",
        Version = "1.0.0",
        Author = "5AM Hub",
        PlaceIds = { 89035794510548 },
        Description = "Session, score, survival, and per-minigame automation for Endless Games.",
    },
}

function module.Init(UI: any, Loader: any)
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
    if activeOwnsWindow and activeWindow and activeWindow.Destroy then
        activeWindow:Destroy()
    end
    activeWindow = nil
    activeOwnsWindow = false
    activeLoader = nil

    local localPlayer = Players.LocalPlayer
    if not localPlayer then
        UI:Notify({
            Title = "Endless Games",
            Content = "The local player is not available yet.",
            Duration = 6,
        })
        return nil
    end

    local sharedWindow = if Loader then Loader.ActiveWindow else nil
    local hasSharedWindow = sharedWindow
        and sharedWindow.Instance
        and sharedWindow.Instance.Parent ~= nil
    local window = if hasSharedWindow
        then sharedWindow
        else UI:CreateWindow({
            Title = "5AM Hub",
            SubTitle = "Endless Games",
        })
    local ownsWindow = not hasSharedWindow
    if window.SetSubTitle then
        window:SetSubTitle("Endless Games")
    end
    if Loader then
        Loader.ActiveWindow = window
    end

    local cleanupTasks: {() -> ()} = {}
    local remotes = Remotes.new()
    local environment = if Loader and Loader.Utils and Loader.Utils.GetEnvironment
        then Loader.Utils:GetEnvironment()
        else {}
    local context: any = {
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
    }
    local runtime = Runtime.new(context)
    context.Runtime = runtime

    if type(environment.getgc) ~= "function" then
        context.Notify(
            "Limited Executor Support",
            "This game module needs getgc to locate Endless Games' live session controller.",
            8
        )
    end

    for _, feature in featureModules do
        local ok, cleanupOrError = pcall(feature.Init, context)
        if ok and type(cleanupOrError) == "function" then
            table.insert(cleanupTasks, cleanupOrError)
        elseif not ok then
            context.Notify(
                "Endless Games feature failed",
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
        runtime:Destroy()
        remotes:ClearCache()
    end

    activeCleanup = Cleanup
    activeWindow = window
    activeOwnsWindow = ownsWindow
    activeLoader = Loader

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
            activeOwnsWindow = false
            if activeLoader and activeLoader.ActiveWindow == window then
                activeLoader.ActiveWindow = nil
            end
            activeLoader = nil
        end)
    end

    return window
end

function module.Destroy()
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
    if activeLoader and activeLoader.ActiveWindow == activeWindow and activeOwnsWindow then
        activeLoader.ActiveWindow = nil
    end
    activeLoader = nil
    if activeOwnsWindow and activeWindow and activeWindow.Destroy then
        activeWindow:Destroy()
    elseif activeWindow and activeWindow.SetSubTitle then
        activeWindow:SetSubTitle("Universal")
    end
    activeWindow = nil
    activeOwnsWindow = false
end

return module
