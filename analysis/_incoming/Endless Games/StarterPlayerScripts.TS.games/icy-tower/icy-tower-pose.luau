-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.wholeBodyPivot = function(a1, a2, a3)
    --[[
      name: wholeBodyPivot
      line: 33
    ]]
    if a2.state ~= "spin" then
        if a2.state ~= "run" then
            if a2.state ~= "idle" then
                if a2.state ~= "teeter" then
                    return a1
                end
                return a1 * CFrame.Angles(0, 0, math.rad(a2.facing * 9))
            end
            return a1 * CFrame.new(0, math.sin(a2.clock * 2.6) * 0.05, 0)
        end
        return (a1 * CFrame.new(0, math.abs(math.sin(a2.runPhase)) * 0.09, 0)) * CFrame.Angles(0, 0, math.rad(-a2.facing * 7))
    end
    return ((a1 * CFrame.new(0, a3, 0)) * CFrame.Angles(0, 0, math.rad(a2.spinDegrees))) * CFrame.new(0, -a3, 0)
end
tbl_1.limbAngles = function(a1, a2)
    --[[
      name: limbAngles
      line: 64
    ]]
    if a1.state == "run" then
        a2.armSwing = math.sin(a1.runPhase) * 42
        a2.armRaise = 8
        a2.legSwing = math.sin(a1.runPhase) * 52
        a2.legSplit = 2
    elseif a1.state == "rise" then
        a2.armSwing = 0
        a2.armRaise = 152
        a2.legSwing = 24
        a2.legSplit = 8
    elseif a1.state == "hang" then
        a2.armSwing = 0
        a2.armRaise = 98
        a2.legSwing = 8
        a2.legSplit = 12
    elseif a1.state == "fall" then
        a2.armSwing = math.sin(a1.clock * 18) * 9
        a2.armRaise = 142
        a2.legSwing = -10
        a2.legSplit = 18
    elseif a1.state == "spin" then
        a2.armSwing = 0
        a2.armRaise = 92
        a2.legSwing = 0
        a2.legSplit = 26
    elseif a1.state == "teeter" then
        a2.armSwing = 0
        a2.armRaise = (math.sin(a1.clock * 14) * 45) + 120
        a2.legSwing = 4
        a2.legSplit = 6
    elseif a1.state ~= "panic" then
        a2.armSwing = math.sin(a1.clock * 2.6) * 4
        a2.armRaise = 6
        a2.legSwing = 0
        a2.legSplit = 2
    else
        a2.armSwing = math.sin(a1.clock * 34) * 7
        a2.armRaise = 158
        a2.legSwing = 0
        a2.legSplit = 5
    end
end
return tbl_1