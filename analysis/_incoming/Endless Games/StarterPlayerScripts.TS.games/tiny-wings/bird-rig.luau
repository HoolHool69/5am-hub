-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local makeSmoothPart_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local u1 = Color3.fromRGB(255, 238, 186)
local u2 = Color3.fromRGB(216, 158, 36)
local u3 = Color3.fromRGB(255, 148, 56)
local u4 = Color3.fromRGB(255, 255, 255)
local u5 = Color3.fromRGB(30, 26, 22)
local u6 = Color3.fromRGB(228, 172, 44)
local u7 = CFrame.new(0.3, -0.42, 1.14)
local u8 = CFrame.new(1.35, 0.05, 0.3)
local u9 = CFrame.new(0.72, 0.45, 1.14)
local u10 = CFrame.new(0.9, 0.45, 1.27)
local u11 = CFrame.new(0.25, 1.15, 0.2) * CFrame.Angles(0, 0, 0.4886921905584123)
local u12 = CFrame.new(-1.2, 0.35, 0.1) * CFrame.Angles(0, 0, 0.6632251157578453)
local u13 = CFrame.new(-1.25, 0.05, 0.25) * CFrame.Angles(0, 0, 0.3141592653589793)
local u14 = CFrame.new(-0.1, 0.25, 1.15)
local u15 = CFrame.new(-0.55, -0.1, 0)
local u16 = CFrame.new(0.72, 0.35, 1.14)
local u17 = CFrame.new(0.72, 0.35, 1.27)
local u18 = CFrame.new(0.25, 1.15, 0.2) * CFrame.Angles(0, 0, 0.9075712110370514)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 90
    ]]
    return "BirdRig"
end
local u19 = setmetatable(tbl_1, tbl_2)
u19.__index = u19
u19.new = function(...)
    --[[
      name: new
      line: 95
      upvalues:
        u19 (ref, index: 1)
    ]]
    local v1 = setmetatable({}, u19)
    return v1:constructor(...) or v1
end
u19.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 99
      upvalues:
        u9 (copy, index: 1)
        u10 (copy, index: 2)
        u11 (copy, index: 3)
        u1 (copy, index: 4)
        u2 (copy, index: 5)
        u3 (copy, index: 6)
        u4 (copy, index: 7)
        u5 (copy, index: 8)
        u6 (copy, index: 9)
    ]]
    a1.wingAngle = -0.12
    a1.lidBlend = 0
    a1.lidTarget = 0
    a1.lidWritten = -1
    a1.breathPhase = 0
    a1.eyeOffset = u9
    a1.pupilOffset = u10
    a1.crestOffset = u11
    a3.BackSurface = Enum.SurfaceType.Smooth
    a1.belly = a1:makePiece(a2, Vector3.new(1.350000023841858, 1.0499999523162842, 0.18000000715255737), u1)
    a1.wing = a1:makePiece(a2, Vector3.new(1.5, 0.699999988079071, 0.4000000059604645), u2)
    a1.beak = a1:makePiece(a2, Vector3.new(0.75, 0.5, 0.5), u3)
    a1.eye = a1:makePiece(a2, Vector3.new(0.5199999809265137, 0.5799999833106995, 0.1599999964237213), u4)
    a1.pupil = a1:makePiece(a2, Vector3.new(0.23999999463558197, 0.2800000011920929, 0.10000000149011612), u5)
    a1.crest = a1:makePiece(a2, Vector3.new(0.550000011920929, 0.3799999952316284, 0.3199999928474426), u2)
    a1.tailHigh = a1:makePiece(a2, Vector3.new(1, 0.2800000011920929, 0.36000001430511475), u6)
    a1.tailLow = a1:makePiece(a2, Vector3.new(0.8999999761581421, 0.2800000011920929, 0.36000001430511475), u6)
end
u19.setLidTarget = function(a1, a2)
    --[[
      name: setLidTarget
      line: 120
    ]]
    a1.lidTarget = math.clamp(a2, 0, 1)
end
u19.setBreathPhase = function(a1, a2)
    --[[
      name: setBreathPhase
      line: 123
    ]]
    a1.breathPhase = a2
end
u19.reset = function(a1)
    --[[
      name: reset
      line: 126
    ]]
    a1.wingAngle = -0.12
    a1.lidBlend = 0
    a1.lidTarget = 0
    a1.breathPhase = 0
    a1:writeLid()
end
u19.pose = function(a1, a2, a3, a4)
    --[[
      name: pose
      line: 133
      upvalues:
        u7 (copy, index: 1)
        u8 (copy, index: 2)
        u12 (copy, index: 3)
        u13 (copy, index: 4)
        u14 (copy, index: 5)
        u15 (copy, index: 6)
    ]]
    a1.lidBlend = a1.lidBlend + ((a1.lidTarget - a1.lidBlend) * math.min(a3 * 5, 1))
    if math.abs(a1.lidBlend - a1.lidWritten) > 0.004 then
        a1:writeLid()
    end
    a1.belly.CFrame = a4 ~= "sleep" and a2 * u7 or a2 * u7 * CFrame.new(0, math.sin(a1.breathPhase) * 0.03, 0)
    a1.beak.CFrame = a2 * u8
    a1.eye.CFrame = a2 * a1.eyeOffset
    a1.pupil.CFrame = a2 * a1.pupilOffset
    a1.crest.CFrame = a2 * a1.crestOffset
    a1.tailHigh.CFrame = a2 * u12
    a1.tailLow.CFrame = a2 * u13
    local v3 = ((a4 == "ground") and -0.12) or (((a4 == "dive") and 0.35) or (((a4 ~= "sleep") and (-0.55 + math.sin(os.clock() * 11) * 0.4)) or (math.sin(a1.breathPhase) * 0.07 + 0.1)))
    a1.wingAngle = a1.wingAngle + ((v3 - a1.wingAngle) * math.min(a3 * 12, 1))
    a1.wing.CFrame = ((a2 * u14) * CFrame.Angles(0, 0, a1.wingAngle)) * u15
end
u19.writeLid = function(a1)
    --[[
      name: writeLid
      line: 176
      upvalues:
        u9 (copy, index: 1)
        u16 (copy, index: 2)
        u10 (copy, index: 3)
        u17 (copy, index: 4)
        u11 (copy, index: 5)
        u18 (copy, index: 6)
    ]]
    local lidBlend_1 = a1.lidBlend
    a1.lidWritten = lidBlend_1
    a1.eye.Size = (Vector3.new(0.5199999809265137, 0.5799999833106995, 0.1599999964237213)):Lerp(Vector3.new(0.5600000023841858, 0.1599999964237213, 0.1599999964237213), lidBlend_1)
    a1.pupil.Size = (Vector3.new(0.23999999463558197, 0.2800000011920929, 0.10000000149011612)):Lerp(Vector3.new(0.5, 0.10000000149011612, 0.10000000149011612), lidBlend_1)
    a1.eyeOffset = u9:Lerp(u16, lidBlend_1)
    a1.pupilOffset = u10:Lerp(u17, lidBlend_1)
    a1.crestOffset = u11:Lerp(u18, lidBlend_1)
end
u19.makePiece = function(a1, a2, a3, a4)
    --[[
      name: makePiece
      line: 185
      upvalues:
        makeSmoothPart_upv_1 (copy, index: 1)
    ]]
    local v4 = makeSmoothPart_upv_1(a2)
    v4.Size = a3
    v4.Color = a4
    v4.CastShadow = false
    v4.CFrame = CFrame.new(0, -1000, 0)
    return v4
end
local tbl_3 = {}
tbl_3.BirdRig = u19
return tbl_3