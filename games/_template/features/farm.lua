--!strict

--[[
    Farm feature reference

    Keep loops event-driven or cancellable. A toggle callback starts/stops the
    worker, and the returned cleanup function must stop it during UI unload.
]]

local Farm = {
    Name = "Farm",
}

function Farm.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Farm" })
    local section = tab:AddSection("Automation")
    local workerToken = 0

    section:AddToggle("TemplateAutoFarm", {
        Title = "Example Auto Farm",
        Description = "Reference lifecycle for a cancellable automation task.",
        Default = false,
        Flag = "TemplateAutoFarm",
        Callback = function(enabled: boolean)
            workerToken += 1
            local thisWorker = workerToken

            if not enabled then
                return
            end

            task.spawn(function()
                while context.Flags:Get("TemplateAutoFarm") == true and thisWorker == workerToken do
                    -- Locate targets using analyzed game state, then call only:
                    -- context.Remotes:Fire("CollectReward", targetId)
                    task.wait(0.1)
                end
            end)
        end,
    })

    return function()
        workerToken += 1
    end
end

return Farm
