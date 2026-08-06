--!strict

local RunService = game:GetService("RunService")

local Automation = {
    Name = "Run Automation",
}

function Automation.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Run Automation" })
    local survivalSection = tab:AddSection("Run Protection")

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

    local lastGameId: string? = nil
    local heartbeatConnection = RunService.Heartbeat:Connect(function()
        context.Runtime:EnsureHook()
        context.Runtime:ApplyProtection()

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
