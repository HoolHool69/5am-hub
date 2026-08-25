--!strict

local FruitControl = {
    Name = "Fruit Control",
}

function FruitControl.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Fruit Control" })
    local physicsSection = tab:AddSection("Pile Physics")
    local overflowSection = tab:AddSection("Overflow Protection")

    local destroyed = false

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    physicsSection:AddSlider("WatermelonGoLanePull", {
        Title = "Tier Lane Pull",
        Description = "Pulls equal tiers toward the same lane so physics creates natural merge contact.",
        Min = 0,
        Max = 100,
        Default = 35,
        Increment = 5,
        Suffix = "%",
        Flag = "WatermelonGoLanePull",
    })
    physicsSection:AddSlider("WatermelonGoDownforce", {
        Title = "Pile Downforce",
        Min = 0,
        Max = 30,
        Default = 3,
        Increment = 1,
        Suffix = " studs/s",
        Flag = "WatermelonGoDownforce",
    })
    physicsSection:AddToggle("WatermelonGoStabilize", {
        Title = "Stabilize Pile",
        Description = "Cancels spin, damps sideways motion, and guides equal fruit into tier lanes.",
        Default = false,
        Flag = "WatermelonGoStabilize",
    })
    physicsSection:AddButton({
        Title = "Stabilize Once",
        Callback = function()
            context.Runtime:Stabilize(
                tonumber(Flag("WatermelonGoLanePull", 35)) or 35,
                tonumber(Flag("WatermelonGoDownforce", 3)) or 3
            )
            context.Notify("Fruit Control", "Applied one stabilization pass.")
        end,
    })

    overflowSection:AddSlider("WatermelonGoOverflowMargin", {
        Title = "Ceiling Margin",
        Description = "Fruit entering this area below the top marker is recovered into its tier lane.",
        Min = 0,
        Max = 8,
        Default = 2,
        Increment = 0.25,
        Suffix = " studs",
        Flag = "WatermelonGoOverflowMargin",
    })
    overflowSection:AddToggle("WatermelonGoOverflowGuard", {
        Title = "No Overflow",
        Description = "Recovers network-owned fruit before it remains above the loss line.",
        Default = false,
        Flag = "WatermelonGoOverflowGuard",
    })
    overflowSection:AddButton({
        Title = "Recover Overflow Now",
        Callback = function()
            local recovered = context.Runtime:RecoverOverflow(
                tonumber(Flag("WatermelonGoOverflowMargin", 2)) or 2
            )
            context.Notify(
                "Overflow Guard",
                if recovered > 0
                    then string.format("Recovered %d fruit(s).", recovered)
                    else "No fruit is currently above the selected ceiling margin."
            )
        end,
    })

    task.spawn(function()
        while not destroyed do
            if Flag("WatermelonGoStabilize", false) == true then
                context.Runtime:Stabilize(
                    tonumber(Flag("WatermelonGoLanePull", 35)) or 35,
                    tonumber(Flag("WatermelonGoDownforce", 3)) or 3
                )
            end
            if Flag("WatermelonGoOverflowGuard", false) == true then
                context.Runtime:RecoverOverflow(
                    tonumber(Flag("WatermelonGoOverflowMargin", 2)) or 2
                )
            end
            task.wait(0.08)
        end
    end)

    return function()
        destroyed = true
        tab:Destroy()
    end
end

return FruitControl
