-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local RunService_upv_1 = RuntimeLib_upv_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local v1 = RuntimeLib_upv_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v1.gameFrozenAtom
local pausedAtom_upv_1 = v1.pausedAtom
local tbl_1 = {}
tbl_1.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 21
    ]]
    a1.context = a2
    a1.timeScale = 1
    a1.renderAlpha = 1
    a1.realDelta = 0
    a1.accumulator = 0
    a1.running = false
    local stage_1 = a2.stage
    if stage_1 == nil then
        error((("[%*] world game constructed without a stage"):format(a2.gameId)))
    end
    a1.stage = stage_1
end
tbl_1.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 34
    ]]
end
tbl_1.captureResume = function(a1)
    --[[
      name: captureResume
      line: 36
    ]]
    return a1:captureRound()
end
tbl_1.restoreResume = function(a1, a2)
    --[[
      name: restoreResume
      line: 39
    ]]
    a1.accumulator = 0
    a1.timeScale = 1
    a1:resetRound()
    if a1:restoreRound(a2) then
        a1:render(0)
        return true
    end
    return false
end
tbl_1.resumeStart = function(a1)
    --[[
      name: resumeStart
      line: 49
    ]]
    a1.accumulator = 0
    a1.running = true
end
tbl_1.init = function(a1)
    --[[
      name: init
      line: 53
      upvalues:
        RunService_upv_1 (copy, index: 1)
        RuntimeLib_upv_1 (copy, index: 2)
    ]]
    a1:buildScene()
    a1:resetRound()
    a1:render(0)
    a1.context.janitor:Add(
        RunService_upv_1.RenderStepped:Connect(
            function(a2)
                --[[
                  line: 59
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:frame(a2)
            end
        )
    )
    return RuntimeLib_upv_1.Promise.resolve()
end
tbl_1.start = function(a1)
    --[[
      name: start
      line: 64
    ]]
    a1.accumulator = 0
    a1.timeScale = 1
    a1:resetRound()
    a1.running = true
end
tbl_1.destroy = function(a1)
    --[[
      name: destroy
      line: 70
    ]]
    a1.running = false
end
tbl_1.hitStop = function(a1, a2)
    --[[
      name: hitStop
      line: 73
    ]]
    a1.timeScale = 0
    task.delay(
        a2,
        function()
            --[[
              line: 75
              upvalues:
                a1 (copy, index: 1)
            ]]
            a1.timeScale = 1
        end
    )
end
tbl_1.setRunning = function(a1, a2)
    --[[
      name: setRunning
      line: 79
    ]]
    a1.running = a2
end
tbl_1.isRunning = function(a1)
    --[[
      name: isRunning
      line: 82
    ]]
    return a1.running
end
tbl_1.frame = function(a1, a2)
    --[[
      name: frame
      line: 85
      upvalues:
        pausedAtom_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
    ]]
    if pausedAtom_upv_1() or gameFrozenAtom_upv_1() then
        return nil
    end
    a1.realDelta = math.min(a2, 0.25)
    if a1.running then
        local v2 = math.min(a2, 0.25) * a1.timeScale
        a1.accumulator = a1.accumulator + v2
        while a1.accumulator >= 0.008333333333333333 do
            a1.accumulator = a1.accumulator - 0.008333333333333333
            a1:fixedUpdate(0.008333333333333333)
            if a1.running then
                continue
            end
            return nil
        end
        a1.renderAlpha = a1.accumulator / 0.008333333333333333
        a1:render(v2)
    else
        a1.renderAlpha = 1
        a1:onIdle(a2)
        return nil
    end
end
local tbl_2 = {}
tbl_2.BaseWorldGame = tbl_1
return tbl_2