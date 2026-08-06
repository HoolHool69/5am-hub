-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local Lighting_upv_1 = v1.Lighting
local RunService_upv_1 = v1.RunService
local Workspace_upv_1 = v1.Workspace
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "lighting-profiles")
local DEFAULT_GAME_LIGHTING_upv_1 = v2.DEFAULT_GAME_LIGHTING
local DEFAULT_STAGE_SKYBOX_upv_1 = v2.DEFAULT_STAGE_SKYBOX
local LIGHTING_PROFILES_upv_1 = v2.LIGHTING_PROFILES
local photoFreecamAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms").photoFreecamAtom
local orientationOf_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "use-px").orientationOf
local u1 = Vector2.new(1280, 720)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 38
    ]]
    return "StageController"
end
local u2 = setmetatable(tbl_1, tbl_2)
u2.__index = u2
u2.new = function(...)
    --[[
      name: new
      line: 43
      upvalues:
        u2 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u2)
    return v3:constructor(...) or v3
end
u2.constructor = function(a1)
    --[[
      name: constructor
      line: 47
    ]]
    a1.basePose = CFrame.identity
    a1.shakeMagnitude = 0
    a1.hasActiveStage = false
    a1.frameWidthFloor = 0
    a1.frontalFraming = true
    a1.lastFrameCenter = Vector2.zero
    a1.framedViewport = Vector2.zero
    a1.cameraZSign = 1
    a1.framePitch = 0
    a1.stageEffectInstances = {}
end
u2.onStart = function(a1)
    --[[
      name: onStart
      line: 59
      upvalues:
        RunService_upv_1 (copy, index: 1)
    ]]
    a1:parkCamera()
    RunService_upv_1.RenderStepped:Connect(
        function(a2)
            --[[
              line: 62
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:updateCamera(a2)
        end
    )
end
u2.acquire = function(a1, a2, a3, a4)
    --[[
      name: acquire
      line: 66
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        LIGHTING_PROFILES_upv_1 (copy, index: 2)
        DEFAULT_GAME_LIGHTING_upv_1 (copy, index: 3)
        orientationOf_upv_1 (copy, index: 4)
    ]]
    local CurrentCamera_upv_1 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_upv_1 == nil then
        error("[StageController] no CurrentCamera")
    end
    local u3 = Instance.new("Folder")
    u3.Name = "GameStage"
    u3.Parent = Workspace_upv_1
    local v4 = LIGHTING_PROFILES_upv_1[a3] or DEFAULT_GAME_LIGHTING_upv_1
    a1:applyLightingProfile(a2, v4)
    a1.hasActiveStage = true
    a1.shakeMagnitude = 0
    a1.frameWidthFloor = 0
    a1.frontalFraming = true
    a1.lastFrameCenter = Vector2.zero
    a1.framedViewport = Vector2.zero
    a1.viewRect = a4
    a1.cameraZSign = 1
    a1:setFrameCenter(Vector2.zero)
    local tbl_3 = {}
    tbl_3.getViewRect = function()
        --[[
          name: getViewRect
          line: 85
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.viewRect
    end
    tbl_3.getPeerWindowOffsetX = function()
        --[[
          name: getPeerWindowOffsetX
          line: 88
          upvalues:
            a1 (copy, index: 1)
            CurrentCamera_upv_1 (copy, index: 2)
        ]]
        return a1:peerWindowOffsetX(CurrentCamera_upv_1)
    end
    tbl_3.container = u3
    tbl_3.camera = CurrentCamera_upv_1
    tbl_3.getFrameWidth = function()
        --[[
          name: getFrameWidth
          line: 95
          upvalues:
            a1 (copy, index: 1)
            CurrentCamera_upv_1 (copy, index: 2)
        ]]
        return a1:frameHalfWidth(a1:activeViewport(CurrentCamera_upv_1)) * 2
    end
    tbl_3.getVisibleHeight = function()
        --[[
          name: getVisibleHeight
          line: 98
          upvalues:
            a1 (copy, index: 1)
            CurrentCamera_upv_1 (copy, index: 2)
        ]]
        return a1:planeHalfHeight(a1:activeViewport(CurrentCamera_upv_1)) * 2
    end
    tbl_3.getOrientation = function()
        --[[
          name: getOrientation
          line: 101
          upvalues:
            orientationOf_upv_1 (copy, index: 1)
            a1 (copy, index: 2)
            CurrentCamera_upv_1 (copy, index: 3)
        ]]
        return orientationOf_upv_1(a1:activeViewport(CurrentCamera_upv_1))
    end
    tbl_3.setFrameWidthFloor = function(a5)
        --[[
          name: setFrameWidthFloor
          line: 104
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.frameWidthFloor = math.max(a5, 0)
        a1.framedViewport = Vector2.zero
    end
    tbl_3.setFrameCenter = function(a6)
        --[[
          name: setFrameCenter
          line: 109
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1:setFrameCenter(a6)
    end
    tbl_3.setFramePitch = function(a7)
        --[[
          name: setFramePitch
          line: 112
          upvalues:
            a1 (copy, index: 1)
        ]]
        local v5 = math.clamp(a7, 0, 0.7853981633974483)
        if a1.framePitch ~= v5 then
            a1.framePitch = v5
            a1.framedViewport = Vector2.zero
            if a1.frontalFraming then
                a1:setFrameCenter(a1.lastFrameCenter)
            end
        else
            return nil
        end
    end
    tbl_3.setCameraZSign = function(a8)
        --[[
          name: setCameraZSign
          line: 125
          upvalues:
            a1 (copy, index: 1)
        ]]
        if a1.cameraZSign ~= a8 then
            a1.cameraZSign = a8
            if a1.frontalFraming then
                a1:setFrameCenter(a1.lastFrameCenter)
            end
        else
            return nil
        end
    end
    tbl_3.setCameraCFrame = function(a9)
        --[[
          name: setCameraCFrame
          line: 136
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.frontalFraming = false
        a1.basePose = a9
    end
    tbl_3.shake = function(a10)
        --[[
          name: shake
          line: 140
          upvalues:
            a1 (copy, index: 1)
        ]]
        a1.shakeMagnitude = math.max(a1.shakeMagnitude, a10)
    end
    tbl_3.setLighting = function(a11)
        --[[
          name: setLighting
          line: 143
          upvalues:
            a1 (copy, index: 1)
        ]]
        if not a1.hasActiveStage then
            return
        end
        a1:applyStageLightingValues(a11)
    end
    a2:Add(
        function()
            --[[
              line: 149
              upvalues:
                a1 (copy, index: 1)
                u3 (copy, index: 2)
            ]]
            a1.hasActiveStage = false
            a1.shakeMagnitude = 0
            a1.frameWidthFloor = 0
            a1.frontalFraming = true
            a1.viewRect = nil
            a1.cameraZSign = 1
            u3:Destroy()
            a1:parkCamera()
        end
    )
    return tbl_3
end
u2.activeViewport = function(a1, a2)
    --[[
      name: activeViewport
      line: 161
      upvalues:
        Workspace_upv_1 (copy, index: 1)
    ]]
    return (Workspace_upv_1.CurrentCamera or a2).ViewportSize
end
u2.stripFraction = function(a1)
    --[[
      name: stripFraction
      line: 164
    ]]
    local viewRect_1 = a1.viewRect
    if viewRect_1 ~= nil then
        return (math.clamp(viewRect_1.x1 - viewRect_1.x0, 0.05, 1))
    end
    return 1
end
u2.stripAspect = function(a1, a2)
    --[[
      name: stripAspect
      line: 168
    ]]
    return a2.X / math.max(a2.Y, 1) * a1:stripFraction()
end
u2.frameHalfWidth = function(a1, a2)
    --[[
      name: frameHalfWidth
      line: 171
    ]]
    return (math.max(20 * a1:stripAspect(a2), a1.frameWidthFloor / 2))
end
u2.frameHalfHeight = function(a1, a2)
    --[[
      name: frameHalfHeight
      line: 174
    ]]
    return (math.max(20, a1:frameHalfWidth(a2) / a1:stripAspect(a2)))
end
u2.planeHalfHeight = function(a1, a2)
    --[[
      name: planeHalfHeight
      line: 177
    ]]
    return a1:frameHalfHeight(a2) / math.cos(a1.framePitch)
end
u2.stripShiftX = function(a1, a2)
    --[[
      name: stripShiftX
      line: 180
    ]]
    local viewRect_2 = a1.viewRect
    if viewRect_2 ~= nil then
        return (-(((viewRect_2.x0 + viewRect_2.x1) / 2) - 0.5) * ((a1:frameHalfHeight(a2) * 2) * (a2.X / math.max(a2.Y, 1)))) * a1.cameraZSign
    end
    return 0
end
u2.frameDistance = function(a1, a2)
    --[[
      name: frameDistance
      line: 189
    ]]
    return a1:frameHalfHeight(a2) / 0.17632698070846498
end
u2.peerWindowOffsetX = function(a1, a2)
    --[[
      name: peerWindowOffsetX
      line: 192
    ]]
    local viewRect_3 = a1.viewRect
    if viewRect_3 ~= nil then
        local v6 = a1:activeViewport(a2)
        return ((1 - (2 * ((viewRect_3.x0 + viewRect_3.x1) / 2))) * ((a1:frameHalfHeight(v6) * 2) * (v6.X / math.max(v6.Y, 1)))) * a1.cameraZSign
    end
    return nil
end
u2.applyLightingProfile = function(a1, a2, a3)
    --[[
      name: applyLightingProfile
      line: 202
      upvalues:
        Lighting_upv_1 (copy, index: 1)
    ]]
    local tbl_upv_4 = {}
    tbl_upv_4.clockTime = Lighting_upv_1.ClockTime
    tbl_upv_4.latitude = Lighting_upv_1.GeographicLatitude
    tbl_upv_4.brightness = Lighting_upv_1.Brightness
    tbl_upv_4.globalShadows = Lighting_upv_1.GlobalShadows
    tbl_upv_4.ambient = Lighting_upv_1.Ambient
    tbl_upv_4.outdoorAmbient = Lighting_upv_1.OutdoorAmbient
    tbl_upv_4.environmentDiffuseScale = Lighting_upv_1.EnvironmentDiffuseScale
    tbl_upv_4.environmentSpecularScale = Lighting_upv_1.EnvironmentSpecularScale
    tbl_upv_4.exposureCompensation = Lighting_upv_1.ExposureCompensation
    tbl_upv_4.fogColor = Lighting_upv_1.FogColor
    tbl_upv_4.fogStart = Lighting_upv_1.FogStart
    tbl_upv_4.fogEnd = Lighting_upv_1.FogEnd
    tbl_upv_4.colorShiftTop = Lighting_upv_1.ColorShift_Top
    tbl_upv_4.colorShiftBottom = Lighting_upv_1.ColorShift_Bottom
    local tbl_upv_5 = {}
    local tbl_upv_6 = {}
    for _, value_1 in Lighting_upv_1:GetChildren() do
        if (a3.hideCustomSky) and (value_1:IsA("Sky")) then
            table.insert(tbl_upv_5, {instance = value_1, parent = Lighting_upv_1})
            value_1.Parent = nil
        elseif (a3.disablePostEffects) and (value_1:IsA("Atmosphere")) then
            table.insert(tbl_upv_5, {instance = value_1, parent = Lighting_upv_1})
            value_1.Parent = nil
        elseif (a3.disablePostEffects) and (value_1:IsA("PostEffect")) then
            if value_1.Enabled then
                table.insert(tbl_upv_6, value_1)
                value_1.Enabled = false
            end
        end
    end
    a1:applyStageLightingValues(a3)
    a2:Add(
        function()
            --[[
              line: 249
              upvalues:
                a1 (copy, index: 1)
                tbl_upv_5 (copy, index: 2)
                tbl_upv_6 (copy, index: 3)
                Lighting_upv_1 (copy, index: 4)
                tbl_upv_4 (copy, index: 5)
            ]]
            local stageSky_1 = a1.stageSky
            if stageSky_1 ~= nil then
                stageSky_1:Destroy()
            end
            a1.stageSky = nil
            for _, value_2 in a1.stageEffectInstances do
                value_2:Destroy()
            end
            a1.stageEffectInstances = {}
            for _, value_3 in tbl_upv_5 do
                value_3.instance.Parent = value_3.parent
            end
            for _, value_4 in tbl_upv_6 do
                value_4.Enabled = true
            end
            Lighting_upv_1.ClockTime = tbl_upv_4.clockTime
            Lighting_upv_1.GeographicLatitude = tbl_upv_4.latitude
            Lighting_upv_1.Brightness = tbl_upv_4.brightness
            Lighting_upv_1.GlobalShadows = tbl_upv_4.globalShadows
            Lighting_upv_1.Ambient = tbl_upv_4.ambient
            Lighting_upv_1.OutdoorAmbient = tbl_upv_4.outdoorAmbient
            Lighting_upv_1.EnvironmentDiffuseScale = tbl_upv_4.environmentDiffuseScale
            Lighting_upv_1.EnvironmentSpecularScale = tbl_upv_4.environmentSpecularScale
            Lighting_upv_1.ExposureCompensation = tbl_upv_4.exposureCompensation
            Lighting_upv_1.FogColor = tbl_upv_4.fogColor
            Lighting_upv_1.FogStart = tbl_upv_4.fogStart
            Lighting_upv_1.FogEnd = tbl_upv_4.fogEnd
            Lighting_upv_1.ColorShift_Top = tbl_upv_4.colorShiftTop
            Lighting_upv_1.ColorShift_Bottom = tbl_upv_4.colorShiftBottom
        end
    )
end
u2.applyStageLightingValues = function(a1, a2)
    --[[
      name: applyStageLightingValues
      line: 285
      upvalues:
        Lighting_upv_1 (copy, index: 1)
        DEFAULT_STAGE_SKYBOX_upv_1 (copy, index: 2)
    ]]
    Lighting_upv_1.ClockTime = a2.clockTime
    Lighting_upv_1.GeographicLatitude = a2.geographicLatitude
    Lighting_upv_1.Brightness = a2.brightness
    Lighting_upv_1.GlobalShadows = a2.globalShadows
    Lighting_upv_1.Ambient = a2.ambient
    Lighting_upv_1.OutdoorAmbient = a2.outdoorAmbient
    Lighting_upv_1.EnvironmentDiffuseScale = a2.environmentDiffuseScale
    Lighting_upv_1.EnvironmentSpecularScale = a2.environmentSpecularScale
    Lighting_upv_1.ExposureCompensation = a2.exposureCompensation
    Lighting_upv_1.FogColor = a2.fogColor
    Lighting_upv_1.FogStart = a2.fogStart
    Lighting_upv_1.FogEnd = a2.fogEnd
    Lighting_upv_1.ColorShift_Top = a2.colorShiftTop
    Lighting_upv_1.ColorShift_Bottom = a2.colorShiftBottom
    local stageSky_2 = a1.stageSky
    if stageSky_2 ~= nil then
        stageSky_2:Destroy()
    end
    a1.stageSky = nil
    for v7, v8 in a1.stageEffectInstances do
        v8:Destroy()
    end
    a1.stageEffectInstances = {}
    local v9 = a2.skybox
    if not (v9) then
        if a2.hideCustomSky then
            v9 = DEFAULT_STAGE_SKYBOX_upv_1
        else
            v9 = nil
        end
    end
    local v10 = nil
    if v9 ~= nil then
        local stageEffects_1 = Instance.new("Sky")
        stageEffects_1.Name = "StageSky"
        stageEffects_1.SkyboxBk = v9.bk
        stageEffects_1.SkyboxDn = v9.dn
        stageEffects_1.SkyboxFt = v9.ft
        stageEffects_1.SkyboxLf = v9.lf
        stageEffects_1.SkyboxRt = v9.rt
        stageEffects_1.SkyboxUp = v9.up
        v10 = v9.celestialBodiesShown
        if v10 == nil then
            v10 = false
        end
        stageEffects_1.CelestialBodiesShown = v10
        if v9.sunTextureId ~= nil then
            stageEffects_1.SunTextureId = v9.sunTextureId
        end
        if v9.sunAngularSize ~= nil then
            stageEffects_1.SunAngularSize = v9.sunAngularSize
        end
        if v9.moonTextureId ~= nil then
            stageEffects_1.MoonTextureId = v9.moonTextureId
        end
        if v9.moonAngularSize ~= nil then
            stageEffects_1.MoonAngularSize = v9.moonAngularSize
        end
        if v9.starCount ~= nil then
            stageEffects_1.StarCount = v9.starCount
        end
        stageEffects_1.Parent = Lighting_upv_1
        a1.stageSky = stageEffects_1
    end
    local stageEffects_1 = a2.stageEffects
    if stageEffects_1 == nil then
        v10 = stageEffects_1
    else
        v10 = stageEffects_1.atmosphere
    end
    if v10 ~= nil then
        local v7 = stageEffects_1.atmosphere
        local v8 = Instance.new("Atmosphere")
        v8.Name = "StageAtmosphere"
        v8.Density = v7.density
        v8.Offset = v7.offset
        v8.Color = v7.color
        v8.Decay = v7.decay
        v8.Glare = v7.glare
        v8.Haze = v7.haze
        v8.Parent = Lighting_upv_1
        table.insert(a1.stageEffectInstances, v8)
    end
    local v7
    if stageEffects_1 == nil then
        v7 = stageEffects_1
    else
        v7 = stageEffects_1.bloom
    end
    if v7 ~= nil then
        local v8 = Instance.new("BloomEffect")
        v8.Name = "StageBloom"
        v8.Intensity = stageEffects_1.bloom.intensity
        v8.Size = stageEffects_1.bloom.size
        v8.Threshold = stageEffects_1.bloom.threshold
        v8.Parent = Lighting_upv_1
        table.insert(a1.stageEffectInstances, v8)
    end
    local v8
    if stageEffects_1 == nil then
        v8 = stageEffects_1
    else
        v8 = stageEffects_1.colorCorrection
    end
    if v8 ~= nil then
        local v11 = Instance.new("ColorCorrectionEffect")
        v11.Name = "StageColorCorrection"
        v11.Brightness = stageEffects_1.colorCorrection.brightness
        v11.Contrast = stageEffects_1.colorCorrection.contrast
        v11.Saturation = stageEffects_1.colorCorrection.saturation
        v11.TintColor = stageEffects_1.colorCorrection.tintColor
        v11.Parent = Lighting_upv_1
        table.insert(a1.stageEffectInstances, v11)
    end
    local v11
    if stageEffects_1 == nil then
        v11 = stageEffects_1
    else
        v11 = stageEffects_1.sunRays
    end
    if v11 ~= nil then
        local v12 = Instance.new("SunRaysEffect")
        v12.Name = "StageSunRays"
        v12.Intensity = stageEffects_1.sunRays.intensity
        v12.Spread = stageEffects_1.sunRays.spread
        v12.Parent = Lighting_upv_1
        table.insert(a1.stageEffectInstances, v12)
    end
end
u2.setFrameCenter = function(a1, a2)
    --[[
      name: setFrameCenter
      line: 410
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    a1.lastFrameCenter = a2
    a1.frontalFraming = true
    local CurrentCamera_2 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_2 ~= nil then
        CurrentCamera_2 = CurrentCamera_2.ViewportSize
    end
    local v13 = CurrentCamera_2
    if v13 == nil then
        v13 = u1
    end
    u1 = v13
    a1.framedViewport = u1
    local v14 = Vector3.new(0, 5000, 0) + Vector3.new(a2.X + a1:stripShiftX(u1), a2.Y, 0)
    local v15 = a1:frameDistance(u1)
    a1.basePose = CFrame.lookAt(v14 + Vector3.new(0, v15 * math.sin(a1.framePitch), (a1.cameraZSign * v15) * math.cos(a1.framePitch)), v14)
end
u2.updateCamera = function(a1, a2)
    --[[
      name: updateCamera
      line: 437
      upvalues:
        photoFreecamAtom_upv_1 (copy, index: 1)
        Workspace_upv_1 (copy, index: 2)
    ]]
    if a1.hasActiveStage then
        local v16
        if photoFreecamAtom_upv_1() then
            return nil
        end
        v16 = Workspace_upv_1.CurrentCamera
        if v16 ~= nil then
            if v16.CameraType ~= Enum.CameraType.Scriptable then
                v16.CameraType = Enum.CameraType.Scriptable
            end
            if a1.frontalFraming and v16.ViewportSize ~= a1.framedViewport then
                a1.framedViewport = v16.ViewportSize
                local basePose_1 = a1.cameraZSign * a1:frameDistance(v16.ViewportSize)
                local v17 = Vector3.new(0, 5000, 0) + Vector3.new(a1.lastFrameCenter.X + a1:stripShiftX(v16.ViewportSize), a1.lastFrameCenter.Y, 0)
                a1.basePose = CFrame.lookAt(v17 + Vector3.new(0, 0, basePose_1), v17)
            end
            local basePose_1 = a1.basePose
            if a1.shakeMagnitude > 0.01 then
                local v18 = os.clock()
                basePose_1 = basePose_1 * CFrame.new((math.noise(v18 * 13, 0) * a1.shakeMagnitude) * 2, (math.noise(0, v18 * 17) * a1.shakeMagnitude) * 2, 0)
                a1.shakeMagnitude = a1.shakeMagnitude * math.exp(-8 * a2)
            end
            v16.CFrame = basePose_1
        else
            return nil
        end
    else
        return nil
    end
end
u2.parkCamera = function(a1)
    --[[
      name: parkCamera
      line: 477
      upvalues:
        Workspace_upv_1 (copy, index: 1)
    ]]
    local CurrentCamera_3 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_3 ~= nil then
        CurrentCamera_3.CameraType = Enum.CameraType.Scriptable
        CurrentCamera_3.FieldOfView = 20
        CurrentCamera_3.CFrame = CFrame.lookAt(Vector3.new(0, 5000, 0) + Vector3.new(0, 0, a1:frameDistance(CurrentCamera_3.ViewportSize)), Vector3.new(0, 5000, 0))
    else
        return nil
    end
end
Reflect_1.defineMetadata(u2, "identifier", "client/controllers/stage-controller@StageController")
Reflect_1.defineMetadata(u2, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u2, "$:flamework@Controller", Controller_1, {})
local tbl_7 = {}
tbl_7.StageController = u2
return tbl_7