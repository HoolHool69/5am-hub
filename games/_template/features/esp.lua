--!strict

--[[
    ESP feature reference

    Visual features normally own Drawing objects, Highlights, adornments, and a
    render connection. Create them only while enabled and remove every object in
    both the toggle-off path and the feature cleanup callback.
]]

local Esp = {
    Name = "ESP",
}

function Esp.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Visuals" })
    local section = tab:AddSection("ESP")
    local renderConnection: RBXScriptConnection? = nil

    local function StopEsp()
        if renderConnection then
            renderConnection:Disconnect()
            renderConnection = nil
        end
        -- Remove Drawing/Highlight instances owned by this feature here.
    end

    section:AddToggle("TemplateEspEnabled", {
        Title = "Example ESP",
        Description = "Reference start/stop lifecycle for render-based visuals.",
        Default = false,
        Flag = "TemplateEspEnabled",
        Callback = function(enabled: boolean)
            StopEsp()
            if enabled then
                -- renderConnection = RunService.RenderStepped:Connect(UpdateEsp)
            end
        end,
    })

    return StopEsp
end

return Esp
