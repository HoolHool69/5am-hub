--!strict

local Minigames = {
    Name = "Minigames",
}

function Minigames.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Minigame Auto" })
    local autoSection = tab:AddSection("Universal Autopilot")
    local behaviorSection = tab:AddSection("Game-Specific Behavior")

    autoSection:AddSlider("EndlessAutoActionInterval", {
        Title = "Maximum Action Interval",
        Description = "Precision games automatically poll faster when their state requires it.",
        Min = 0.02,
        Max = 1,
        Default = 0.08,
        Increment = 0.01,
        Suffix = "s",
        Flag = "EndlessAutoActionInterval",
    })
    autoSection:AddToggle("EndlessAutoPlay", {
        Title = "Auto Play Current Minigame",
        Description = "Selects the matching strategy from the active game ID.",
        Default = false,
        Flag = "EndlessAutoPlay",
    })
    autoSection:AddButton({
        Title = "Run One Automatic Action",
        Callback = function()
            if not context.Runtime:AutoStep() then
                context.Notify("Minigame Auto", "No supported active minigame was found.", 5)
            end
        end,
    })

    behaviorSection:AddButton({
        Title = "Precision / Arcade Games",
        Description = "Predictive Flappy flight, gap-centered Helix drops, exact Stack It drops, branch lookahead, and path-aware Sharp Turns.",
        Callback = function()
            context.Notify("Autopilot Profiles", "Flappy Wings, Helix Drop, Stack It, Knife Combo, Chop Chop, and Sharp Turns are enabled through Auto Play.", 8)
        end,
    })
    behaviorSection:AddButton({
        Title = "Puzzle Games",
        Description = "Depth-searched 2048, tier-aware Melon Merge, chain-planned Drop Numbers, and line-clear Block Rush placement.",
        Callback = function()
            context.Notify("Autopilot Profiles", "2048, Melon Merge, Drop Numbers, and Block Rush are enabled through Auto Play.", 8)
        end,
    })
    behaviorSection:AddButton({
        Title = "Action / Traffic Games",
        Description = "Non-bomb slicing, Bike Rush clearing, Crossy forwarding, real Highway near-miss tracking, and slope-aware Speedy Wings piloting.",
        Callback = function()
            context.Notify("Autopilot Profiles", "Slice Fruits, Bike Rush, Crossy Traffic, Highway Rush, and Speedy Wings are enabled through Auto Play.", 8)
        end,
    })
    behaviorSection:AddButton({
        Title = "Tower Games",
        Description = "Multi-floor Frozen Tower routing and sway-compensated perfect Tower Builder releases.",
        Callback = function()
            context.Notify("Autopilot Profiles", "Frozen Tower and Tower Builder are enabled through Auto Play.", 8)
        end,
    })

    local destroyed = false
    task.spawn(function()
        while not destroyed do
            if context.Flags:Get("EndlessAutoPlay") == true then
                context.Runtime:AutoStep()
            end
            local interval = tonumber(context.Flags:Get("EndlessAutoActionInterval")) or 0.08
            task.wait(context.Runtime:GetStepInterval(interval))
        end
    end)

    return function()
        destroyed = true
        tab:Destroy()
    end
end

return Minigames
