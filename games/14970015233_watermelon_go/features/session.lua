--!strict

local Session = {
    Name = "Session",
}

local DELETABLE_FRUITS = {
    "Cherry",
    "Strawberry",
    "Grapes",
    "Orange",
    "Tomato",
}

function Session.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Watermelon Go" })
    local runSection = tab:AddSection("Game Session")
    local utilitySection = tab:AddSection("Run Utilities")

    local function ReportResult(title: string, result: any, successMessage: string)
        if result.Success then
            context.Notify(title, successMessage)
        else
            context.Notify(title, result.Message, 6)
        end
    end

    runSection:AddButton({
        Title = "Start Single Player",
        Description = "Requests the SinglePlayer mode exposed by SharedEnums.",
        Callback = function()
            ReportResult(
                "Watermelon Go",
                context.Remotes:RequestSinglePlayer(),
                "Single-player mode requested."
            )
        end,
    })
    runSection:AddToggle("WatermelonGoPaused", {
        Title = "Pause Game",
        Description = "Uses the analyzed GamemodeManager pause endpoint.",
        Default = false,
        Flag = "WatermelonGoPaused",
        Callback = function(value: boolean)
            local result = context.Remotes:SetPaused(value)
            if not result.Success then
                context.Notify("Pause Failed", result.Message, 6)
            end
        end,
    })
    runSection:AddButton({
        Title = "Rollback Last Drop",
        Description = "Requests the game's rollback action for the current run.",
        Callback = function()
            ReportResult(
                "Watermelon Go",
                context.Remotes:Rollback(),
                "Rollback requested."
            )
        end,
    })
    runSection:AddButton({
        Title = "Inspect Current Run",
        Callback = function()
            context.Notify("Watermelon Go", context.Runtime:GetRunSummary(), 7)
        end,
    })

    utilitySection:AddDropdown("WatermelonGoDeleteFruit", {
        Title = "Fruit Type",
        Description = "The game's delete endpoint only applies to the five normal drop fruits.",
        Values = DELETABLE_FRUITS,
        Default = "Cherry",
        Flag = "WatermelonGoDeleteFruit",
    })
    utilitySection:AddButton({
        Title = "Delete Selected Fruit Type",
        Description = "Requests the server's observed RequestFruitTypeDelete action.",
        Callback = function()
            local selected = context.Flags:Get("WatermelonGoDeleteFruit") or "Cherry"
            local result = context.Remotes:DeleteFruitType(tostring(selected))
            if result.Success and result.Value ~= false then
                context.Notify("Fruit Type", string.format("Delete requested for %s.", selected))
            else
                context.Notify(
                    "Fruit Type",
                    if result.Success then "The server rejected that delete request." else result.Message,
                    6
                )
            end
        end,
    })

    return function()
        tab:Destroy()
    end
end

return Session
