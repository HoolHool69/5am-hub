--!strict

local Autoplayer = {
    Name = "Autoplayer",
}

local STRATEGIES = {
    "Smart Match",
    "Tier Lanes",
    "Lowest Column",
    "Center Stack",
}

local DROP_METHODS = {
    "Game Input",
    "Adaptive Remote",
}

function Autoplayer.Init(context: any)
    local tab = context.Window:AddTab({ Title = "Auto Play" })
    local dropSection = tab:AddSection("Tier-Aware Autoplayer")
    local mergeSection = tab:AddSection("Automatic Merging")

    local destroyed = false
    local lastDrop = 0
    local lastMerge = 0
    local lastErrorNotice = 0

    local function Flag(name: string, fallback: any): any
        local value = context.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function DropOnce(showSuccess: boolean)
        local strategy = tostring(Flag("WatermelonGoDropStrategy", "Smart Match"))
        local jitter = tonumber(Flag("WatermelonGoDropJitter", 0)) or 0
        local method = tostring(Flag("WatermelonGoDropMethod", "Game Input"))
        local result = context.Runtime:DropOnce(strategy, jitter, method)
        if result.Success then
            if showSuccess then
                context.Notify(
                    "Auto Play",
                    string.format("Dropped %s using %s.", tostring(result.Value or "fruit"), strategy)
                )
            end
        elseif showSuccess or os.clock() - lastErrorNotice >= 6 then
            lastErrorNotice = os.clock()
            context.Notify("Auto Play", result.Message, 6)
        end
    end

    dropSection:AddDropdown("WatermelonGoDropStrategy", {
        Title = "Drop Strategy",
        Description = "Smart Match targets an exposed equal fruit, then falls back to the emptiest column.",
        Values = STRATEGIES,
        Default = "Smart Match",
        Flag = "WatermelonGoDropStrategy",
    })
    dropSection:AddDropdown("WatermelonGoDropMethod", {
        Title = "Drop Method",
        Description = "Game Input runs the original controller; Adaptive Remote is faster on compatible servers.",
        Values = DROP_METHODS,
        Default = "Game Input",
        Flag = "WatermelonGoDropMethod",
    })
    dropSection:AddSlider("WatermelonGoDropInterval", {
        Title = "Drop Interval",
        Description = "The server remains authoritative over its own drop cooldown.",
        Min = 0.05,
        Max = 2,
        Default = 0.28,
        Increment = 0.01,
        Suffix = "s",
        Flag = "WatermelonGoDropInterval",
    })
    dropSection:AddSlider("WatermelonGoDropJitter", {
        Title = "Position Jitter",
        Description = "Adds a small random offset to prevent identical pile geometry.",
        Min = 0,
        Max = 8,
        Default = 0,
        Increment = 0.5,
        Suffix = "%",
        Flag = "WatermelonGoDropJitter",
    })
    dropSection:AddSlider("WatermelonGoSettleSpeed", {
        Title = "Settled Speed",
        Description = "Drops wait while any fruit moves faster than this threshold.",
        Min = 0.5,
        Max = 20,
        Default = 5,
        Increment = 0.5,
        Suffix = " studs/s",
        Flag = "WatermelonGoSettleSpeed",
    })
    dropSection:AddToggle("WatermelonGoWaitForSettle", {
        Title = "Wait for Pile to Settle",
        Description = "Improves placement accuracy; disable it for maximum drop rate.",
        Default = true,
        Flag = "WatermelonGoWaitForSettle",
    })
    dropSection:AddToggle("WatermelonGoAutoPlay", {
        Title = "Auto Play",
        Description = "Continuously positions the cloud and requests real server drops.",
        Default = false,
        Flag = "WatermelonGoAutoPlay",
    })
    dropSection:AddButton({
        Title = "Drop One Fruit",
        Callback = function()
            task.spawn(DropOnce, true)
        end,
    })

    mergeSection:AddSlider("WatermelonGoMergeInterval", {
        Title = "Merge Interval",
        Min = 0.05,
        Max = 1,
        Default = 0.12,
        Increment = 0.01,
        Suffix = "s",
        Flag = "WatermelonGoMergeInterval",
    })
    mergeSection:AddSlider("WatermelonGoMergeBatch", {
        Title = "Pairs per Sweep",
        Min = 1,
        Max = 20,
        Default = 6,
        Increment = 1,
        Flag = "WatermelonGoMergeBatch",
    })
    mergeSection:AddToggle("WatermelonGoAggressiveMerge", {
        Title = "Aggressive Merge",
        Description = "Aligns matching network-owned fruit before sending the normal merge request.",
        Default = true,
        Flag = "WatermelonGoAggressiveMerge",
    })
    mergeSection:AddToggle("WatermelonGoAutoMerge", {
        Title = "Auto Merge",
        Description = "Pairs matching tiers from largest to smallest and cascades new fruit.",
        Default = false,
        Flag = "WatermelonGoAutoMerge",
    })
    mergeSection:AddButton({
        Title = "Merge Sweep Now",
        Callback = function()
            local maximumPairs = math.floor(tonumber(Flag("WatermelonGoMergeBatch", 6)) or 6)
            local aggressive = Flag("WatermelonGoAggressiveMerge", true) == true
            local merged, result = context.Runtime:MergeSweep(maximumPairs, aggressive)
            if merged > 0 then
                context.Notify("Auto Merge", string.format("Requested %d matching pair(s).", merged))
            elseif result and not result.Success then
                context.Notify("Auto Merge", result.Message, 6)
            else
                context.Notify("Auto Merge", "No eligible matching pair is currently available.")
            end
        end,
    })

    task.spawn(function()
        while not destroyed do
            local now = os.clock()
            if Flag("WatermelonGoAutoMerge", false) == true then
                local mergeInterval = math.max(
                    0.03,
                    tonumber(Flag("WatermelonGoMergeInterval", 0.12)) or 0.12
                )
                if now - lastMerge >= mergeInterval then
                    lastMerge = now
                    local maximumPairs = math.floor(
                        tonumber(Flag("WatermelonGoMergeBatch", 6)) or 6
                    )
                    context.Runtime:MergeSweep(
                        math.clamp(maximumPairs, 1, 20),
                        Flag("WatermelonGoAggressiveMerge", true) == true
                    )
                end
            end

            if Flag("WatermelonGoAutoPlay", false) == true then
                local dropInterval = math.max(
                    0.03,
                    tonumber(Flag("WatermelonGoDropInterval", 0.28)) or 0.28
                )
                if now - lastDrop >= dropInterval then
                    local shouldWait = Flag("WatermelonGoWaitForSettle", true) == true
                    local settledSpeed = tonumber(Flag("WatermelonGoSettleSpeed", 5)) or 5
                    if not shouldWait or not context.Runtime:IsPileMoving(settledSpeed) then
                        lastDrop = now
                        DropOnce(false)
                    end
                end
            end
            task.wait(0.03)
        end
    end)

    return function()
        destroyed = true
        tab:Destroy()
    end
end

return Autoplayer
