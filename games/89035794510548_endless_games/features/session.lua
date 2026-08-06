--!strict

local Session = {
    Name = "Session",
}

local GAMES = {
    ["2048"] = "2048",
    ["Bike Rush"] = "traffic-rush",
    ["Block Rush"] = "block-blast",
    ["Chop Chop"] = "timberman",
    ["Crossy Traffic"] = "crossy-road",
    ["Drop Numbers"] = "number-merge",
    ["Flappy Wings"] = "flappy-bird",
    ["Frozen Tower"] = "icy-tower",
    ["Helix Drop"] = "helix-jump",
    ["Highway Rush"] = "highway-rider-tp",
    ["Knife Combo"] = "knife-hit",
    ["Melon Merge"] = "suika",
    ["Sharp Turns"] = "zig-zag",
    ["Slice Fruits"] = "fruit-ninja",
    ["Speedy Wings"] = "tiny-wings",
    ["Stack It"] = "stack",
    ["Tower Builder"] = "tower-builder",
}

local GAME_NAMES = {
    "Flappy Wings",
    "Helix Drop",
    "Stack It",
    "Knife Combo",
    "Melon Merge",
    "Chop Chop",
    "Drop Numbers",
    "Sharp Turns",
    "Slice Fruits",
    "Bike Rush",
    "Crossy Traffic",
    "Highway Rush",
    "2048",
    "Speedy Wings",
    "Block Rush",
    "Frozen Tower",
    "Tower Builder",
}

function Session.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Endless Games" })
    local launchSection = tab:AddSection("Game Session")
    local runSection = tab:AddSection("Current Run")

    launchSection:AddDropdown("EndlessSelectedGame", {
        Title = "Minigame",
        Description = "The 17 currently playable games found in the client registry.",
        Values = GAME_NAMES,
        Default = "Flappy Wings",
        Searchable = true,
        Flag = "EndlessSelectedGame",
    })
    launchSection:AddButton({
        Title = "Launch Selected Minigame",
        Description = "Uses the live GameSessionController and its normal start-run flow.",
        Callback = function()
            local selectedName = context.Flags:Get("EndlessSelectedGame") or "Flappy Wings"
            local gameId = GAMES[selectedName]
            if not gameId then
                context.Notify("Endless Games", "Select a supported minigame first.")
                return
            end
            local success, message = context.Runtime:Launch(gameId)
            context.Notify(if success then "Launching" else "Launch Failed", message, if success then 4 else 7)
        end,
    })
    launchSection:AddButton({
        Title = "Show Supported Minigames",
        Callback = function()
            context.Notify("17 Supported Minigames", table.concat(GAME_NAMES, ", "), 12)
        end,
    })

    runSection:AddButton({
        Title = "Restart Current Run",
        Callback = function()
            local success, message = context.Runtime:Restart()
            context.Notify(if success then "Restart" else "Restart Failed", message, if success then 4 else 7)
        end,
    })
    runSection:AddButton({
        Title = "Show Session Status",
        Callback = function()
            local gameId, runSeed, score = context.Runtime:GetStatus()
            context.Notify(
                "Endless Games Session",
                string.format("Game: %s | Seed: %s | Score: %d", gameId, runSeed, math.floor(score)),
                7
            )
        end,
    })

    return function()
        tab:Destroy()
    end
end

return Session
