--!strict

local RunService = game:GetService("RunService")

local FruitControl = {
    Name = "Fruit Control",
}

function FruitControl.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Fruit Physics" })
    local mergeSection = tab:AddSection("Merge Engine")
    local physicsSection = tab:AddSection("Fruit Physics")
    local lossSection = tab:AddSection("Never Lose")

    local destroyed = false
    local lastAuthority = 0
    local lastPhaseRefresh = 0
    local lastPropertyRefresh = 0
    local lastTopRefresh = 0

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    mergeSection:AddSlider("WatermelonGoMagnetStrength", {
        Title = "Merge Magnet Strength",
        Min = 1,
        Max = 80,
        Default = 28,
        Increment = 1,
        Flag = "WatermelonGoMagnetStrength",
    })
    mergeSection:AddToggle("WatermelonGoMagnetSnap", {
        Title = "Snap Matching Partners",
        Description = "Gradually translates equal tiers into contact in addition to applying velocity.",
        Default = true,
        Flag = "WatermelonGoMagnetSnap",
    })
    mergeSection:AddToggle("WatermelonGoMergeMagnet", {
        Title = "Same-Tier Merge Magnet",
        Description = "Pairs nearest equal fruit and continuously pulls them into genuine physical contact.",
        Default = false,
        Flag = "WatermelonGoMergeMagnet",
    })
    mergeSection:AddToggle("WatermelonGoTierPhasing", {
        Title = "Phase Different Tiers",
        Description = "Different fruit tiers pass through one another; equal tiers still collide and merge normally.",
        Default = false,
        Flag = "WatermelonGoTierPhasing",
        Callback = function(value: boolean)
            if not value then
                context.Runtime:UpdateTierPhasing(false)
            end
        end,
    })
    mergeSection:AddButton({
        Title = "Compact and Pair Everything",
        Description = "Places every tier at its own lane and overlaps equal fruit in merge-ready pairs.",
        Callback = function()
            local moved = context.Runtime:CompactAll()
            context.Notify("Merge Engine", string.format("Compacted %d fruit(s).", moved))
        end,
    })

    physicsSection:AddSlider("WatermelonGoDownforceStrength", {
        Title = "Downforce",
        Min = 1,
        Max = 60,
        Default = 12,
        Increment = 1,
        Suffix = " studs/s",
        Flag = "WatermelonGoDownforceStrength",
    })
    physicsSection:AddToggle("WatermelonGoDownforce", {
        Title = "Force Fruit Downward",
        Description = "Overwrites upward movement every physics frame so fruit cannot float near the ceiling.",
        Default = false,
        Flag = "WatermelonGoDownforce",
    })
    physicsSection:AddToggle("WatermelonGoLowBounce", {
        Title = "No Bounce / No Spin",
        Description = "Uses zero elasticity, high friction, and continuous angular damping.",
        Default = false,
        Flag = "WatermelonGoLowBounce",
        Callback = function(value: boolean)
            context.Runtime:SetLowBounce(value)
        end,
    })
    physicsSection:AddToggle("WatermelonGoPhysicsAuthority", {
        Title = "Maximize Physics Authority",
        Description = "Expands executor simulation radius when the supported APIs are available.",
        Default = false,
        Flag = "WatermelonGoPhysicsAuthority",
    })
    physicsSection:AddButton({
        Title = "Claim Physics Now",
        Callback = function()
            context.Notify(
                "Fruit Physics",
                if context.Runtime:ClaimPhysicsAuthority()
                    then "Simulation-radius controls were applied."
                    else "This executor does not expose simulation-radius controls."
            )
        end,
    })

    lossSection:AddToggle("WatermelonGoTopPassThrough", {
        Title = "Disable Top Wall / Sensor",
        Description = "Disables collision, touch, and query on the active board's Top part.",
        Default = false,
        Flag = "WatermelonGoTopPassThrough",
        Callback = function(value: boolean)
            context.Runtime:SetTopPassThrough(value)
        end,
    })
    lossSection:AddSlider("WatermelonGoOverflowMargin", {
        Title = "Overflow Recovery Margin",
        Min = 0,
        Max = 8,
        Default = 2,
        Increment = 0.25,
        Suffix = " studs",
        Flag = "WatermelonGoOverflowMargin",
    })
    lossSection:AddToggle("WatermelonGoOverflowGuard", {
        Title = "Continuous Overflow Recovery",
        Description = "Teleports any fruit reaching the loss line back to its merge lane every physics frame.",
        Default = false,
        Flag = "WatermelonGoOverflowGuard",
    })
    lossSection:AddToggle("WatermelonGoBlockGameEnd", {
        Title = "Block Client Game-End Signal",
        Description = "Blocks the observed GameEnded remote path when executor hook APIs are available.",
        Default = false,
        Flag = "WatermelonGoBlockGameEnd",
        Callback = function(value: boolean)
            local result = context.Remotes:SetGameEndBlocked(value, context.Environment)
            if not result.Success then
                context.Notify("Never Lose", result.Message, 7)
            end
        end,
    })
    lossSection:AddButton({
        Title = "Recover and Compact Now",
        Callback = function()
            local recovered = context.Runtime:RecoverOverflow(
                tonumber(Flag("WatermelonGoOverflowMargin", 2)) or 2
            )
            local compacted = context.Runtime:CompactAll()
            context.Notify(
                "Never Lose",
                string.format("Recovered %d overflow fruit(s); compacted %d total.", recovered, compacted)
            )
        end,
    })
    lossSection:AddButton({
        Title = "Inspect Board Physics",
        Callback = function()
            context.Notify("Board Physics", context.Runtime:GetRunSummary(), 8)
        end,
    })

    local physicsConnection = RunService.PreSimulation:Connect(function(dt: number)
        if destroyed then
            return
        end
        local now = os.clock()

        if Flag("WatermelonGoPhysicsAuthority", false) == true
            and now - lastAuthority >= 0.5
        then
            lastAuthority = now
            context.Runtime:ClaimPhysicsAuthority()
        end
        if now - lastTopRefresh >= 0.25 then
            lastTopRefresh = now
            context.Runtime:SetTopPassThrough(
                Flag("WatermelonGoTopPassThrough", false) == true
            )
        end
        if now - lastPhaseRefresh >= 0.15 then
            lastPhaseRefresh = now
            context.Runtime:UpdateTierPhasing(
                Flag("WatermelonGoTierPhasing", false) == true
            )
        end
        if now - lastPropertyRefresh >= 0.2 then
            lastPropertyRefresh = now
            context.Runtime:SetLowBounce(
                Flag("WatermelonGoLowBounce", false) == true
            )
        end

        if Flag("WatermelonGoMergeMagnet", false) == true then
            context.Runtime:Magnetize(
                dt,
                tonumber(Flag("WatermelonGoMagnetStrength", 28)) or 28,
                Flag("WatermelonGoMagnetSnap", true) == true
            )
        end
        if Flag("WatermelonGoDownforce", false) == true then
            context.Runtime:ApplyDownforce(
                tonumber(Flag("WatermelonGoDownforceStrength", 12)) or 12
            )
        end
        if Flag("WatermelonGoOverflowGuard", false) == true then
            context.Runtime:RecoverOverflow(
                tonumber(Flag("WatermelonGoOverflowMargin", 2)) or 2
            )
        end
    end)

    return function()
        destroyed = true
        physicsConnection:Disconnect()
        context.Remotes:SetGameEndBlocked(false, context.Environment)
        context.Runtime:UpdateTierPhasing(false)
        context.Runtime:SetTopPassThrough(false)
        context.Runtime:SetLowBounce(false)
        tab:Destroy()
    end
end

return FruitControl
