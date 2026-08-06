--!strict

local RunService = game:GetService("RunService")

local Automation = {
    Name = "Run Automation",
}

function Automation.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Run Automation" })
    local survivalSection = tab:AddSection("Run Protection")
    local scoreSection = tab:AddSection("Score Automation")

    survivalSection:AddToggle("EndlessInvincible", {
        Title = "Invincible Run",
        Description = "Suppresses game-over callbacks and neutralizes each minigame's local failure state.",
        Default = false,
        Flag = "EndlessInvincible",
    })
    survivalSection:AddToggle("EndlessAnnounceGame", {
        Title = "Announce Detected Game",
        Description = "Shows the internal game ID when a new minigame session becomes active.",
        Default = true,
        Flag = "EndlessAnnounceGame",
    })

    scoreSection:AddSlider("EndlessScoreMultiplier", {
        Title = "Score Multiplier",
        Min = 1,
        Max = 100,
        Default = 1,
        Increment = 1,
        Suffix = "x",
        Flag = "EndlessScoreMultiplier",
    })
    scoreSection:AddSlider("EndlessScoreRate", {
        Title = "Auto Score Rate",
        Min = 1,
        Max = 5000,
        Default = 100,
        Increment = 25,
        Suffix = "/s",
        Flag = "EndlessScoreRate",
    })
    scoreSection:AddToggle("EndlessAutoScore", {
        Title = "Auto Score",
        Description = "Feeds a steadily increasing score through the active game's reportScore callback.",
        Default = false,
        Flag = "EndlessAutoScore",
    })
    scoreSection:AddSlider("EndlessTargetScore", {
        Title = "Target Score",
        Min = 100,
        Max = 1000000,
        Default = 10000,
        Increment = 100,
        Flag = "EndlessTargetScore",
    })
    scoreSection:AddToggle("EndlessFinishAtTarget", {
        Title = "Finish at Target",
        Description = "Ends the run once Auto Score reaches the selected target.",
        Default = false,
        Flag = "EndlessFinishAtTarget",
    })

    local lastGameId: string? = nil
    local heartbeatConnection = RunService.Heartbeat:Connect(function(deltaTime)
        context.Runtime:EnsureHook()
        context.Runtime:ApplyProtection()

        if context.Flags:Get("EndlessAutoScore") == true then
            context.Runtime:AddAutomaticScore(deltaTime)
        end

        local gameId = context.Runtime:GetGameId()
        if gameId and gameId ~= lastGameId then
            lastGameId = gameId
            if context.Flags:Get("EndlessAnnounceGame") == true then
                context.Notify("Minigame Detected", gameId, 4)
            end
        end
    end)

    return function()
        heartbeatConnection:Disconnect()
        tab:Destroy()
    end
end

return Automation
