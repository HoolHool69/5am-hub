--!strict

--[[
    Miscellaneous feature reference

    Buttons perform one action. Toggles own persistent state. Use UI:Notify for
    actionable feedback, and always wrap environment-dependent calls in pcall.
]]

local Misc = {
    Name = "Misc",
}

function Misc.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Misc" })
    local section = tab:AddSection("Utilities")

    section:AddButton({
        Title = "Reference Action",
        Description = "Shows the expected one-shot button pattern.",
        Callback = function()
            context.UI:Notify({
                Title = "5AM Hub",
                Content = "Replace this action with a game-specific utility.",
                Duration = 4,
            })
        end,
    })

    return function()
        -- Disconnect miscellaneous feature resources here.
    end
end

return Misc
