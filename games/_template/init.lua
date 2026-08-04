--!strict

--[[
    Game module reference
    =====================

    Copy this directory to `games/<placeid>_<game_name>/` when adding a game.
    A game package is intentionally split into three layers:

        init.lua              Composition root: metadata, window, and features.
        remotes.lua           The only file allowed to locate or call remotes.
        features/<name>.lua   One focused feature group per file.

    The loader requires this module to return a table with `Meta` and `Init`.
    `Meta` describes the package. `Init(UI, Loader)` creates the game UI and
    starts its features. Keep game logic out of the loader and UI library.
]]

local Remotes = require(script:WaitForChild("remotes"))

local featuresFolder = script:WaitForChild("features")
local featureModules = {
    require(featuresFolder:WaitForChild("combat")),
    require(featuresFolder:WaitForChild("farm")),
    require(featuresFolder:WaitForChild("esp")),
    require(featuresFolder:WaitForChild("misc")),
}

local activeCleanup: (() -> ())? = nil

local module = {
    Meta = {
        Name = "Template",
        DisplayName = "Template Reference",
        Version = "1.0.0",
        Author = "5AM Hub",
        PlaceIds = {},
        Description = "Reference package for implementing a game module.",
    },
}

--[[
    Init contract
    -------------

    UI is the shared Fluent-style UI library. Loader exposes shared services,
    configuration, utilities, and game resolution. Feature controls must bind
    a stable Flag so their state persists through UI.Flags/configuration files.

    Feature modules receive one Context table rather than many positional
    arguments. This keeps their dependency boundary obvious and easy to test.
]]
function module.Init(UI: any, Loader: any)
    -- Reloading the same package should never leave old connections running.
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end

    local window = UI:CreateWindow({
        Title = "5AM Hub",
        SubTitle = "Template Reference",
    })

    -- Register every remote path once, here or in remotes.lua. Feature files
    -- call Context.Remotes:Fire/Invoke and never access a RemoteEvent directly.
    local remotes = Remotes.new()
    -- remotes:Register("PurchaseItem", { "ReplicatedStorage", "Remotes", "PurchaseItem" })

    local cleanupTasks: {() -> ()} = {}
    local context = {
        UI = UI,
        Loader = Loader,
        Window = window,
        Flags = UI.Flags,
        Remotes = remotes,

        -- Features may register cleanup callbacks for connections or instances.
        AddCleanup = function(task: () -> ())
            table.insert(cleanupTasks, task)
        end,
    }

    for _, feature in ipairs(featureModules) do
        local ok, cleanupOrError = pcall(feature.Init, context)
        if ok and type(cleanupOrError) == "function" then
            table.insert(cleanupTasks, cleanupOrError)
        elseif not ok then
            UI:Notify({
                Title = "Template feature failed",
                Content = string.format("%s: %s", tostring(feature.Name), tostring(cleanupOrError)),
                Duration = 6,
            })
        end
    end

    local cleaned = false
    activeCleanup = function()
        if cleaned then
            return
        end
        cleaned = true

        for index = #cleanupTasks, 1, -1 do
            pcall(cleanupTasks[index])
        end
        table.clear(cleanupTasks)
    end

    -- UI:Unload() destroys the window. Tying cleanup to that lifecycle prevents
    -- feature connections from surviving after the interface is gone.
    if window.Instance and window.Instance.Destroying then
        local destroyingConnection = window.Instance.Destroying:Connect(function()
            if activeCleanup then
                activeCleanup()
                activeCleanup = nil
            end
        end)
        table.insert(cleanupTasks, function()
            destroyingConnection:Disconnect()
        end)
    end

    return window
end

function module.Destroy()
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
end

return module
