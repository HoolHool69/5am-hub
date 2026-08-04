--!strict

--[[
    Combat feature reference

    Each feature file returns a small module with a readable Name and one Init
    method. UI creation stays here; remote lookup/calls stay in remotes.lua.
]]

local Combat = {
    Name = "Combat",
}

function Combat.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Combat" })
    local section = tab:AddSection("Combat")

    -- Every stateful control receives a stable flag. The UI library registers
    -- it in UI.Flags and restores it when a saved configuration is loaded.
    section:AddToggle("TemplateCombatEnabled", {
        Title = "Example Combat Toggle",
        Description = "Reference control; replace it with analyzed game logic.",
        Default = false,
        Flag = "TemplateCombatEnabled",
        Callback = function(enabled: boolean)
            if not enabled then
                return
            end

            -- All game remote calls go through the wrapper:
            -- local result = context.Remotes:Fire("Attack", target)
            -- if not result.Success then
            --     context.UI:Notify({ Title = "Attack failed", Content = result.Message })
            -- end
        end,
    })

    -- Return a cleanup callback when the feature owns connections or instances.
    return function()
        -- Disconnect combat loops and restore any changed character state here.
    end
end

return Combat
