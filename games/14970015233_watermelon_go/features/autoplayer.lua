--!strict

local Autoplayer = {
    Name = "Autoplayer",
}

local STRATEGIES = {
    "Smart Match",
    "Lowest Column",
    "Tier Lane",
    "Center",
}

function Autoplayer.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Auto Play" })
    local dropSection = tab:AddSection("Live HUD Autoplayer")
    local safetySection = tab:AddSection("Drop Safety")

    local destroyed = false
    local lastDrop = 0
    local lastCompact = 0
    local lastErrorNotice = 0
    local lastCooldownReset = 0

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function DropOnce(showSuccess: boolean)
        local strategy = tostring(Flag("WatermelonGoDropStrategy", "Smart Match"))
        local jitter = tonumber(Flag("WatermelonGoDropJitter", 0)) or 0
        local movePointer = Flag("WatermelonGoPositionController", true) == true
        local removeCooldown = Flag("WatermelonGoRemoveDropCooldown", false) == true
        local result = context.Runtime:TriggerDrop(
            strategy,
            jitter,
            movePointer,
            removeCooldown
        )
        if result.Success then
            if showSuccess then
                context.Notify(
                    "Auto Play",
                    string.format("Dropped %s through the live HUD controller.", result.Value or "fruit")
                )
            end
        elseif showSuccess or os.clock() - lastErrorNotice >= 8 then
            lastErrorNotice = os.clock()
            context.Notify("Auto Play", result.Message, 7)
        end
    end

    dropSection:AddDropdown("WatermelonGoDropStrategy", {
        Title = "Placement Strategy",
        Description = "Smart Match targets the highest exposed equal fruit, then the emptiest column.",
        Values = STRATEGIES,
        Default = "Smart Match",
        Flag = "WatermelonGoDropStrategy",
    })
    dropSection:AddSlider("WatermelonGoDropInterval", {
        Title = "Drop Interval",
        Min = 0.02,
        Max = 3,
        Default = 0.1,
        Increment = 0.01,
        Suffix = "s",
        Flag = "WatermelonGoDropInterval",
    })
    dropSection:AddSlider("WatermelonGoDropJitter", {
        Title = "Position Jitter",
        Min = 0,
        Max = 6,
        Default = 0,
        Increment = 0.5,
        Suffix = "%",
        Flag = "WatermelonGoDropJitter",
    })
    dropSection:AddToggle("WatermelonGoPositionController", {
        Title = "Update Controller Position",
        Description = "Temporarily moves only the pointer's horizontal coordinate, then restores it after the drop.",
        Default = true,
        Flag = "WatermelonGoPositionController",
    })
    dropSection:AddToggle("WatermelonGoRemoveDropCooldown", {
        Title = "Remove Drop Cooldown",
        Description = "Continuously resets the live DropButton callback and controller debounce state.",
        Default = false,
        Flag = "WatermelonGoRemoveDropCooldown",
    })
    dropSection:AddToggle("WatermelonGoAutoPlay", {
        Title = "Auto Drop",
        Description = "Activates the game's real DropButton instead of guessing remote arguments.",
        Default = false,
        Flag = "WatermelonGoAutoPlay",
    })
    dropSection:AddButton({
        Title = "Drop One Fruit",
        Callback = function()
            task.spawn(DropOnce, true)
        end,
    })
    dropSection:AddButton({
        Title = "Check Drop Controller",
        Callback = function()
            local button = context.Runtime:FindDropButton()
            context.Notify(
                "Drop Controller",
                if button
                    then string.format("Found %s", button:GetFullName())
                    else "No live DropButton is present in PlayerGui.",
                6
            )
        end,
    })

    safetySection:AddSlider("WatermelonGoSettleSpeed", {
        Title = "Settled Speed",
        Min = 0.5,
        Max = 15,
        Default = 3,
        Increment = 0.5,
        Suffix = " studs/s",
        Flag = "WatermelonGoSettleSpeed",
    })
    safetySection:AddToggle("WatermelonGoWaitForSettle", {
        Title = "Wait for Settling",
        Description = "Prevents a fast series of new fruit from occupying the loss line.",
        Default = true,
        Flag = "WatermelonGoWaitForSettle",
    })
    safetySection:AddSlider("WatermelonGoMaximumFill", {
        Title = "Maximum Fill Before Compaction",
        Min = 40,
        Max = 95,
        Default = 72,
        Increment = 1,
        Suffix = "%",
        Flag = "WatermelonGoMaximumFill",
    })
    safetySection:AddToggle("WatermelonGoAutoCompact", {
        Title = "Auto Compact Near Top",
        Description = "Moves equal tiers into overlapping pairs when the board reaches the selected fill level.",
        Default = true,
        Flag = "WatermelonGoAutoCompact",
    })

    task.spawn(function()
        while not destroyed do
            local now = os.clock()
            if Flag("WatermelonGoRemoveDropCooldown", false) == true
                and now - lastCooldownReset >= 0.04
            then
                lastCooldownReset = now
                context.Runtime:ResetDropCooldown()
            end
            if Flag("WatermelonGoAutoPlay", false) == true then
                local maximumFill = tonumber(Flag("WatermelonGoMaximumFill", 72)) or 72
                local fillPercent = context.Runtime:GetBoardFillPercent()
                if Flag("WatermelonGoAutoCompact", true) == true
                    and fillPercent >= maximumFill
                    and now - lastCompact >= 0.5
                then
                    lastCompact = now
                    context.Runtime:CompactAll()
                end

                local interval = math.max(
                    0.01,
                    tonumber(Flag("WatermelonGoDropInterval", 0.1)) or 0.1
                )
                if now - lastDrop >= interval then
                    local waitForSettle = Flag("WatermelonGoWaitForSettle", true) == true
                    local settleSpeed = tonumber(Flag("WatermelonGoSettleSpeed", 3)) or 3
                    if not waitForSettle or not context.Runtime:IsPileMoving(settleSpeed) then
                        lastDrop = now
                        DropOnce(false)
                    end
                end
            end
            task.wait(0.04)
        end
    end)

    return function()
        destroyed = true
        tab:Destroy()
    end
end

return Autoplayer
