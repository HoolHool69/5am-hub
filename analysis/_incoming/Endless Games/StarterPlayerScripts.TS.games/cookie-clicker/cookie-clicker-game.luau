-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local BillboardFace_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "billboard-face").BillboardFace
local v1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory")
local makeEllipsoidPart_upv_1 = v1.makeEllipsoidPart
local makeSmoothPart_upv_1 = v1.makeSmoothPart
local SQUARE_PARTICLE_TEXTURE_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "particle-textures").SQUARE_PARTICLE_TEXTURE
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local markWorldArt_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "world-art").markWorldArt
local ClientEvents_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "network").ClientEvents
local playersAtom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "atoms").playersAtom
local v2 = RuntimeLib_1.import(script, script.Parent, "cookie-clicker-config")
local AUTOSAVE_SECONDS_upv_1 = v2.AUTOSAVE_SECONDS
local EGG_SKIN_THRESHOLDS_upv_1 = v2.EGG_SKIN_THRESHOLDS
local GOLDEN_EGG_upv_1 = v2.GOLDEN_EGG
local MAX_CLICKS_PER_SECOND_upv_1 = v2.MAX_CLICKS_PER_SECOND
local MAX_PROPS_PER_PRODUCER_upv_1 = v2.MAX_PROPS_PER_PRODUCER
local OFFLINE_CAP_SECONDS_upv_1 = v2.OFFLINE_CAP_SECONDS
local OFFLINE_RATE_FRACTION_upv_1 = v2.OFFLINE_RATE_FRACTION
local PRODUCERS_upv_1 = v2.PRODUCERS
local TROPHIES_upv_1 = v2.TROPHIES
local buildBarn_upv_1 = RuntimeLib_1.import(script, script.Parent, "egg-barn").buildBarn
local v3 = RuntimeLib_1.import(script, script.Parent, "egg-layout")
local contentHalfWidth_upv_1 = v3.contentHalfWidth
local EGG_CENTER_Y_upv_1 = v3.EGG_CENTER_Y
local EGG_HALF_DEPTH_upv_1 = v3.EGG_HALF_DEPTH
local EGG_RADIUS_X_upv_1 = v3.EGG_RADIUS_X
local EGG_RADIUS_Y_upv_1 = v3.EGG_RADIUS_Y
local FRAME_WIDTH_FLOOR_upv_1 = v3.FRAME_WIDTH_FLOOR
local freeRectCenterX_upv_1 = v3.freeRectCenterX
local freeRectCenterY_upv_1 = v3.freeRectCenterY
local producerCellX_upv_1 = v3.producerCellX
local producerCellY_upv_1 = v3.producerCellY
local producerCellZ_upv_1 = v3.producerCellZ
local propSlotOffsetX_upv_1 = v3.propSlotOffsetX
local propSlotOffsetZ_upv_1 = v3.propSlotOffsetZ
local v4 = RuntimeLib_1.import(script, script.Parent, "egg-skins")
local EGG_CRACK_COLOR_upv_1 = v4.EGG_CRACK_COLOR
local EGG_CRACK_PLATES_upv_1 = v4.EGG_CRACK_PLATES
local EGG_CRACK_START_PROGRESS_upv_1 = v4.EGG_CRACK_START_PROGRESS
local EGG_CRACKS_upv_1 = v4.EGG_CRACKS
local EGG_FRENZY_FACE_upv_1 = v4.EGG_FRENZY_FACE
local EGG_PATTERN_DOTS_upv_1 = v4.EGG_PATTERN_DOTS
local EGG_SKINS_upv_1 = v4.EGG_SKINS
local eggPatternDots_upv_1 = v4.eggPatternDots
local GOLDEN_EGG_FACE_upv_1 = v4.GOLDEN_EGG_FACE
local v5 = RuntimeLib_1.import(script, script.Parent, "egg-economy")
local clickValue_upv_1 = v5.clickValue
local collectNewTrophies_upv_1 = v5.collectNewTrophies
local deserializeFarm_upv_1 = v5.deserializeFarm
local farmEggsPerSecond_upv_1 = v5.farmEggsPerSecond
local freshFarm_upv_1 = v5.freshFarm
local goldenLingerScale_upv_1 = v5.goldenLingerScale
local goldenSpawnScale_upv_1 = v5.goldenSpawnScale
local producerPrice_upv_1 = v5.producerPrice
local serializeFarm_upv_1 = v5.serializeFarm
local tryBuyProducer_upv_1 = v5.tryBuyProducer
local tryBuyUpgrade_upv_1 = v5.tryBuyUpgrade
local trophyCount_upv_1 = v5.trophyCount
local trophyMultiplier_upv_1 = v5.trophyMultiplier
local upgradeRevealed_upv_1 = v5.upgradeRevealed
local UPGRADE_CATALOG_upv_1 = v5.UPGRADE_CATALOG
local v6 = RuntimeLib_1.import(script, script.Parent, "farm-props")
local buildProp_upv_1 = v6.buildProp
local FarmPropIdle_upv_1 = v6.FarmPropIdle
local eggFarmAtom_upv_1 = RuntimeLib_1.import(script, script.Parent, "farm-atom").eggFarmAtom
local formatEggs_upv_1 = RuntimeLib_1.import(script, script.Parent, "egg-format").formatEggs
local shopIntents_upv_1 = RuntimeLib_1.import(script, script.Parent, "shop-intents").shopIntents
local u1 = CFrame.new(0, -1000, 0)
local tbl_upv_1 = {}
local u2 = Color3.fromRGB(255, 216, 102)
local u3 = Color3.fromRGB(245, 245, 255)
local u4 = Color3.fromRGB(238, 176, 34)
local u5 = Color3.fromRGB(255, 222, 120)
local u6 = Color3.fromRGB(240, 233, 218)
local u7 = Color3.fromRGB(255, 255, 250)
local u8 = Color3.fromRGB(214, 204, 186)
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 131
    ]]
    return "CookieClickerGame"
end
tbl_3.__index = BaseWorldGame_upv_1
local u9 = setmetatable(tbl_2, tbl_3)
u9.__index = u9
u9.new = function(...)
    --[[
      name: new
      line: 137
      upvalues:
        u9 (ref, index: 1)
    ]]
    local v7 = setmetatable({}, u9)
    return v7:constructor(...) or v7
end
u9.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 141
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        freshFarm_upv_1 (copy, index: 2)
        AUTOSAVE_SECONDS_upv_1 (copy, index: 3)
        FarmPropIdle_upv_1 (copy, index: 4)
        PRODUCERS_upv_1 (copy, index: 5)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.farm = freshFarm_upv_1()
    a1.farmLoaded = false
    a1.lifetimeAtLoad = 0
    a1.simClock = 0
    a1.frenzyUntil = -1
    a1.clickFrenzyUntil = -1
    a1.nextGoldenAt = 0
    a1.goldenUntil = -1
    a1.goldenArrivedAt = -1
    a1.goldenPhase = 0
    a1.publishAt = 0
    a1.reportAt = 0
    a1.saveAt = AUTOSAVE_SECONDS_upv_1
    a1.trophyCheckAt = 0
    a1.upgradeScanAt = 0
    a1.toastSeq = 0
    a1.clickTimes = {}
    a1.comboLevel = 0
    a1.lastClickAt = -1
    a1.patternDots = {}
    a1.crackPlates = {}
    a1.eggScale = 1
    a1.eggScaleVelocity = 0
    a1.eggTilt = 0
    a1.eggTiltVelocity = 0
    a1.eggSkinTier = -1
    a1.faceTier = -2
    a1.nextBlinkAt = 0
    a1.blinkUntil = -1
    a1.squintUntil = -1
    a1.cracksShown = -1
    a1.propCountByType = {}
    a1.propIdle = FarmPropIdle_upv_1.new()
    a1.layoutWidth = -1
    a1.layoutPortrait = false
    a1.upgradeRows = {}
    a1.ownedUpgradeRows = {}
    a1.upgradeRowsRevealed = -1
    a1.trophyFlags = {}
    for _, v8 in PRODUCERS_upv_1 do
        table.insert(a1.propCountByType, 0)
    end
end
u9.buildScene = function(a1)
    --[[
      name: buildScene
      line: 187
      upvalues:
        buildBarn_upv_1 (copy, index: 1)
        u6 (copy, index: 2)
        u5 (copy, index: 3)
        PopupTextPool_upv_1 (copy, index: 4)
        shopIntents_upv_1 (copy, index: 5)
        EGG_CENTER_Y_upv_1 (copy, index: 6)
        eggFarmAtom_upv_1 (copy, index: 7)
    ]]
    local container_1 = a1.stage.container
    buildBarn_upv_1(container_1, a1.stage.origin)
    a1:buildEgg(container_1)
    a1:buildGoldenEgg(container_1)
    a1.chipBurst = a1:makeBurst(a1.eggBody, u6, 0.45, 10)
    a1.sparkBurst = a1:makeBurst(a1.eggBody, u5, 0.3, 14)
    a1.popups = PopupTextPool_upv_1.new(container_1, 10)
    a1.context.janitor:Add(
        shopIntents_upv_1.buyProducer:Connect(
            function(a2)
                --[[
                  line: 197
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onBuyProducer(a2)
            end
        )
    )
    a1.context.janitor:Add(
        shopIntents_upv_1.buyUpgrade:Connect(
            function(a3)
                --[[
                  line: 200
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:onBuyUpgrade(a3)
            end
        )
    )
    a1.context.janitor:Add(
        shopIntents_upv_1.dismissOffline:Connect(
            function()
                --[[
                  line: 203
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                a1.offlineView = nil
                a1:publish(true)
            end
        )
    )
    a1.context.janitor:Add(
        shopIntents_upv_1.sleep:Connect(
            function()
                --[[
                  line: 207
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:sleep()
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a4, a5)
                --[[
                  line: 211
                  upvalues:
                    a1 (copy, index: 1)
                    EGG_CENTER_Y_upv_1 (copy, index: 2)
                ]]
                if a5 ~= "key" then
                    local v9 = a1:screenToPlane(a4)
                    local v10 = ((a1.simClock >= a1.goldenUntil) and math.huge) or ((v9 - a1:goldenPlanePosition()).Magnitude)
                    if v10 > 5 then
                        if (v9 - Vector2.new(0, EGG_CENTER_Y_upv_1)).Magnitude <= 7.5 then
                            a1:tryClick(v9)
                        end
                    else
                        a1:collectGolden()
                        return nil
                    end
                else
                    a1:tryClick(nil)
                    return nil
                end
            end
        )
    )
    eggFarmAtom_upv_1(nil)
    a1.context.janitor:Add(
        function()
            --[[
              line: 237
              upvalues:
                eggFarmAtom_upv_1 (copy, index: 1)
            ]]
            return eggFarmAtom_upv_1(nil)
        end,
        true
    )
    a1.context.janitor:Add(
        function()
            --[[
              line: 240
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.propIdle:clear()
        end,
        true
    )
end
u9.resetRound = function(a1)
    --[[
      name: resetRound
      line: 244
    ]]
    if not (a1.farmLoaded) then
        a1.farmLoaded = true
        a1:loadFarm()
    end
    a1:applyStageLayout()
    a1:rebuildUpgradeRows()
    a1:rebuildTrophyFlags()
    a1:publish(true)
end
u9.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 256
      upvalues:
        GOLDEN_EGG_upv_1 (copy, index: 1)
        goldenLingerScale_upv_1 (copy, index: 2)
        AUTOSAVE_SECONDS_upv_1 (copy, index: 3)
    ]]
    a1.simClock = a1.simClock + a2
    local v11 = a1:currentEggsPerSecond()
    if v11 > 0 then
        local farm_1 = a1.farm
        farm_1.eggs = farm_1.eggs + (v11 * a2)
        local farm_2 = a1.farm
        farm_2.lifetime = farm_2.lifetime + (v11 * a2)
    end
    if a1.goldenUntil <= 0 or a1.goldenUntil > a1.simClock then
        if a1.goldenUntil < 0 and a1.nextGoldenAt <= a1.simClock and a1.farm.lifetime >= 100 then
            a1.goldenUntil = a1.simClock + (GOLDEN_EGG_upv_1.lingerSeconds * goldenLingerScale_upv_1(a1.farm))
            a1.goldenArrivedAt = a1.simClock
            a1.goldenPhase = (math.random() * math.pi) * 2
            a1.goldenSparkle.Enabled = true
            a1.context.audio.play("scorePing", {})
        end
    else
        a1:retireGolden()
    end
    if a1.trophyCheckAt <= a1.simClock then
        a1.trophyCheckAt = a1.simClock + 0.5
        a1:awardTrophies()
    end
    if a1.upgradeScanAt <= a1.simClock then
        a1.upgradeScanAt = a1.simClock + 1
        if a1:revealedUpgradeCount() ~= a1.upgradeRowsRevealed then
            a1:rebuildUpgradeRows()
        end
    end
    if a1.reportAt <= a1.simClock then
        a1.reportAt = a1.simClock + 1
        a1:reportLifetime()
    end
    if a1.saveAt <= a1.simClock then
        a1.saveAt = a1.simClock + AUTOSAVE_SECONDS_upv_1
        a1:saveFarm()
    end
    if a1.publishAt > a1.simClock then
        return
    end
    a1:publish(false)
end
u9.render = function(a1, a2)
    --[[
      name: render
      line: 299
      upvalues:
        EGG_CENTER_Y_upv_1 (copy, index: 1)
    ]]
    a1:applyStageLayout()
    local v12 = os.clock()
    local origin_1 = a1.stage.origin
    local v13 = origin_1 + Vector3.new(0, EGG_CENTER_Y_upv_1, 0)
    a1.eggScaleVelocity = a1.eggScaleVelocity + (((1 - a1.eggScale) * 220) * a2)
    a1.eggScaleVelocity = a1.eggScaleVelocity * math.max(1 - (16 * a2), 0)
    a1.eggScale = a1.eggScale + (a1.eggScaleVelocity * a2)
    a1.eggTiltVelocity = a1.eggTiltVelocity + ((-a1.eggTilt * 150) * a2)
    a1.eggTiltVelocity = a1.eggTiltVelocity * math.max(1 - (13 * a2), 0)
    a1.eggTilt = math.clamp(a1.eggTilt + (a1.eggTiltVelocity * a2), -0.09, 0.09)
    local v14 = math.sin(v12 * 1.6) * 0.012 + 1
    local eggScale_1 = a1.eggScale
    local v15 = (2 - eggScale_1) * v14
    local v16 = eggScale_1 * (2 - v14)
    a1.eggMesh.Scale = Vector3.new(v15, v16, 1)
    local v17 = CFrame.new(v13) * CFrame.Angles(0, 0, a1.eggTilt)
    a1.eggBody.CFrame = v17
    a1.eggShine.CFrame = a1:shellCFrame(v17, math.sin(v12 * 0.35) * 0.34, 0.34, v15, v16)
    a1.eggRim.CFrame = a1:shellCFrame(v17, -0.62, -0.1, v15, v16)
    a1:syncEggSkin(v17, v15, v16)
    a1:syncEggFace(v12)
    a1.propIdle:step(v12)
    if a1.simClock < a1.goldenUntil then
        local v18 = a1:goldenPlanePosition()
        local v19 = math.sin(v12 * 6) * 0.4
        local v20 = a1.simClock - a1.goldenArrivedAt
        local v21 = ((v20 >= 0.3) and 1) or (a1:arrivalScale(v20 / 0.3))
        a1.goldenMesh.Scale = Vector3.new(v21, v21, v21)
        a1.goldenEgg.CFrame = CFrame.new(origin_1 + Vector3.new(v18.X, v18.Y + v19, 2)) * CFrame.Angles(0, 0, math.sin(v12 * 3) * 0.25)
    end
end
u9.revive = function(a1)
    --[[
      name: revive
      line: 343
    ]]
    a1:setRunning(true)
end
u9.captureRound = function(a1)
    --[[
      name: captureRound
      line: 347
    ]]
    return nil
end
u9.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 350
    ]]
    return false
end
u9.destroy = function(a1)
    --[[
      name: destroy
      line: 353
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1:saveFarm()
    BaseWorldGame_upv_1.destroy(a1)
end
u9.buildEgg = function(a1, a2)
    --[[
      name: buildEgg
      line: 357
      upvalues:
        makeEllipsoidPart_upv_1 (copy, index: 1)
        EGG_RADIUS_X_upv_1 (copy, index: 2)
        EGG_RADIUS_Y_upv_1 (copy, index: 3)
        EGG_HALF_DEPTH_upv_1 (copy, index: 4)
        EGG_SKINS_upv_1 (copy, index: 5)
        u7 (copy, index: 6)
        u8 (copy, index: 7)
        EGG_PATTERN_DOTS_upv_1 (copy, index: 8)
        u1 (copy, index: 9)
        EGG_CRACK_PLATES_upv_1 (copy, index: 10)
        makeSmoothPart_upv_1 (copy, index: 11)
        EGG_CRACK_COLOR_upv_1 (copy, index: 12)
        markWorldArt_upv_1 (copy, index: 13)
        BillboardFace_upv_1 (copy, index: 14)
    ]]
    a1.eggBody = makeEllipsoidPart_upv_1(a2)
    a1.eggBody.Size = Vector3.new(EGG_RADIUS_X_upv_1 * 2, EGG_RADIUS_Y_upv_1 * 2, EGG_HALF_DEPTH_upv_1 * 2)
    a1.eggBody.Color = EGG_SKINS_upv_1[1].shell
    a1.eggMesh = a1:meshOf(a1.eggBody)
    a1.eggShine = makeEllipsoidPart_upv_1(a2)
    a1.eggShine.Size = Vector3.new(1.600000023841858, 2.5999999046325684, 0.6000000238418579)
    a1.eggShine.Color = u7
    a1.eggShine.Transparency = 0.35
    a1.eggRim = makeEllipsoidPart_upv_1(a2)
    a1.eggRim.Size = Vector3.new(1, 3.5999999046325684, 0.5)
    a1.eggRim.Color = u8
    a1.eggRim.Transparency = 0.55
    for _ = 0, EGG_PATTERN_DOTS_upv_1 - 1 do
        local v22 = makeEllipsoidPart_upv_1(a2)
        v22.Size = Vector3.new(0.6000000238418579, 0.6000000238418579, 0.4000000059604645)
        v22.CFrame = u1
        table.insert(a1.patternDots, v22)
    end
    for _ = 0, EGG_CRACK_PLATES_upv_1 - 1 do
        local v23 = makeSmoothPart_upv_1(a2)
        v23.Color = EGG_CRACK_COLOR_upv_1
        v23.CFrame = u1
        table.insert(a1.crackPlates, v23)
    end
    local v24 = Instance.new("BillboardGui")
    v24.LightInfluence = 0
    markWorldArt_upv_1(v24)
    v24.Parent = a1.eggBody
    a1.eggFace = BillboardFace_upv_1.new(v24)
end
u9.buildGoldenEgg = function(a1, a2)
    --[[
      name: buildGoldenEgg
      line: 393
      upvalues:
        makeEllipsoidPart_upv_1 (copy, index: 1)
        u4 (copy, index: 2)
        u1 (copy, index: 3)
        markWorldArt_upv_1 (copy, index: 4)
        BillboardFace_upv_1 (copy, index: 5)
        GOLDEN_EGG_FACE_upv_1 (copy, index: 6)
        u5 (copy, index: 7)
    ]]
    a1.goldenEgg = makeEllipsoidPart_upv_1(a2)
    a1.goldenEgg.Size = Vector3.new(2.5999999046325684, 3.4000000953674316, 2.200000047683716)
    a1.goldenEgg.Color = u4
    a1.goldenEgg.Material = Enum.Material.Neon
    a1.goldenEgg.CFrame = u1
    a1.goldenMesh = a1:meshOf(a1.goldenEgg)
    local v25 = Instance.new("BillboardGui")
    v25.LightInfluence = 0
    markWorldArt_upv_1(v25)
    v25.Parent = a1.goldenEgg
    a1.goldenFace = BillboardFace_upv_1.new(v25)
    a1.goldenFace:apply(GOLDEN_EGG_FACE_upv_1, 2.4, 1.4)
    a1.goldenSparkle = a1:makeBurst(a1.goldenEgg, u5, 0.35, 8)
    a1.goldenSparkle.Rate = 6
    a1.goldenSparkle.Enabled = false
end
u9.meshOf = function(a1, a2)
    --[[
      name: meshOf
      line: 411
    ]]
    local v26 = a2:FindFirstChildOfClass("SpecialMesh")
    if v26 == nil then
        error((("[%*] ellipsoid part built without its mesh"):format(a1.context.gameId)))
    end
    return v26
end
u9.applyStageLayout = function(a1)
    --[[
      name: applyStageLayout
      line: 418
      upvalues:
        FRAME_WIDTH_FLOOR_upv_1 (copy, index: 1)
        freeRectCenterX_upv_1 (copy, index: 2)
        freeRectCenterY_upv_1 (copy, index: 3)
    ]]
    local v27 = a1.stage.getOrientation() == "portrait"
    if a1.stage.getFrameWidth() == a1.layoutWidth and v27 == a1.layoutPortrait then
        return nil
    end
    a1.stage.setFrameWidthFloor(FRAME_WIDTH_FLOOR_upv_1)
    a1.layoutWidth = a1.stage.getFrameWidth()
    a1.layoutPortrait = v27
    a1.stage.setFrameCenter(Vector2.new(freeRectCenterX_upv_1(a1.layoutWidth, v27), freeRectCenterY_upv_1(a1.stage.getVisibleHeight(), v27)))
end
u9.tryClick = function(a1, a2)
    --[[
      name: tryClick
      line: 430
      upvalues:
        MAX_CLICKS_PER_SECOND_upv_1 (copy, index: 1)
        GOLDEN_EGG_upv_1 (copy, index: 2)
        clickValue_upv_1 (copy, index: 3)
        EGG_RADIUS_X_upv_1 (copy, index: 4)
        EGG_CENTER_Y_upv_1 (copy, index: 5)
        EGG_RADIUS_Y_upv_1 (copy, index: 6)
        formatEggs_upv_1 (copy, index: 7)
        u2 (copy, index: 8)
        u3 (copy, index: 9)
    ]]
    while #a1.clickTimes > 0 and a1.simClock - a1.clickTimes[1] > 1 do
        table.remove(a1.clickTimes, 1)
    end
    if MAX_CLICKS_PER_SECOND_upv_1 > #a1.clickTimes then
        table.insert(a1.clickTimes, a1.simClock)
        local v28 = ((a1.simClock >= a1.clickFrenzyUntil) and 1) or (GOLDEN_EGG_upv_1.clickFrenzyMultiplier)
        local v29 = clickValue_upv_1(a1.farm, a1:currentEggsPerSecond(), v28)
        local farm_3 = a1.farm
        farm_3.eggs = farm_3.eggs + v29
        local farm_4 = a1.farm
        farm_4.lifetime = farm_4.lifetime + v29
        local farm_5 = a1.farm
        farm_5.clicks = farm_5.clicks + 1
        a1.eggScaleVelocity = a1.eggScaleVelocity - 3.2
        if a2 ~= nil then
            a1.eggTiltVelocity = a1.eggTiltVelocity - (math.clamp(a2.X / EGG_RADIUS_X_upv_1, -1, 1) * 0.55)
        end
        a1.squintUntil = a1.simClock + 0.12
        a1.chipBurst:Emit(6)
        if v28 > 1 then
            a1.sparkBurst:Emit(10)
        end
        local origin_2 = a1.stage.origin
        local v30 = ((a2 == nil) and (origin_2 + Vector3.new(0, (EGG_CENTER_Y_upv_1 + EGG_RADIUS_Y_upv_1) + 1.5, 3))) or (origin_2 + Vector3.new(a2.X, a2.Y + 1.5, 3))
        local popups_1 = a1.popups
        local v31 = ("+%*"):format(formatEggs_upv_1(v29))
        local v32
        if v28 <= 1 then
            v32 = u3
        else
            v32 = u2
        end
        popups_1:show(v30, v31, v32, ((v28 <= 1) and 0.75) or 1.1)
        if a1.simClock - a1.lastClickAt <= 0.6 then
            a1.comboLevel = a1.comboLevel + 1
        else
            a1.comboLevel = 0
        end
        a1.lastClickAt = a1.simClock
        a1.context.audio.play("pop", {pitch = math.min(a1.comboLevel * 0.03, 0.45) + 1})
        a1:publish(false)
    else
        return nil
    end
end
u9.onBuyProducer = function(a1, a2)
    --[[
      name: onBuyProducer
      line: 480
      upvalues:
        tryBuyProducer_upv_1 (copy, index: 1)
    ]]
    if tryBuyProducer_upv_1(a1.farm, a2) then
        a1.context.audio.play("uiConfirm", {})
        a1:placeProp(a2)
        a1:rebuildUpgradeRows()
        a1:publish(true)
    else
        return nil
    end
end
u9.onBuyUpgrade = function(a1, a2)
    --[[
      name: onBuyUpgrade
      line: 492
      upvalues:
        tryBuyUpgrade_upv_1 (copy, index: 1)
        EGG_CENTER_Y_upv_1 (copy, index: 2)
        EGG_RADIUS_Y_upv_1 (copy, index: 3)
        UPGRADE_CATALOG_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
    ]]
    if tryBuyUpgrade_upv_1(a1.farm, a2) then
        a1.context.audio.play("perfect", {})
        a1.popups:show(a1.stage.origin + Vector3.new(0, (EGG_CENTER_Y_upv_1 + EGG_RADIUS_Y_upv_1) + 4, 3), UPGRADE_CATALOG_upv_1[a2 + 1].name, u2, 0.9)
        a1:rebuildUpgradeRows()
        a1:publish(true)
    else
        return nil
    end
end
u9.collectGolden = function(a1)
    --[[
      name: collectGolden
      line: 507
      upvalues:
        GOLDEN_EGG_upv_1 (copy, index: 1)
        EGG_CENTER_Y_upv_1 (copy, index: 2)
        EGG_RADIUS_Y_upv_1 (copy, index: 3)
        formatEggs_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
    ]]
    a1:retireGolden()
    local farm_6 = a1.farm
    farm_6.goldens = farm_6.goldens + 1
    a1.sparkBurst:Emit(24)
    a1.chipBurst:Emit(10)
    a1.stage.shake(0.5)
    local v33 = math.random() * ((GOLDEN_EGG_upv_1.weightLucky + GOLDEN_EGG_upv_1.weightFrenzy) + GOLDEN_EGG_upv_1.weightClickFrenzy)
    local v34 = a1.stage.origin + Vector3.new(0, (EGG_CENTER_Y_upv_1 + EGG_RADIUS_Y_upv_1) + 4, 3)
    if v33 >= GOLDEN_EGG_upv_1.weightLucky then
        if v33 >= GOLDEN_EGG_upv_1.weightLucky + GOLDEN_EGG_upv_1.weightFrenzy then
            a1.clickFrenzyUntil = a1.simClock + GOLDEN_EGG_upv_1.clickFrenzySeconds
            a1.popups:show(v34, ("TAP FRENZY x%*!"):format(GOLDEN_EGG_upv_1.clickFrenzyMultiplier), u2, 1.3)
        else
            a1.frenzyUntil = a1.simClock + GOLDEN_EGG_upv_1.frenzySeconds
            a1.popups:show(v34, ("FRENZY x%*!"):format(GOLDEN_EGG_upv_1.frenzyMultiplier), u2, 1.3)
        end
    else
        local v35 = math.min(a1.farm.eggs * GOLDEN_EGG_upv_1.luckyBankFraction, a1:currentEggsPerSecond() * GOLDEN_EGG_upv_1.luckyCapCpsSeconds) + 13
        local farm_7 = a1.farm
        farm_7.eggs = farm_7.eggs + v35
        local farm_8 = a1.farm
        farm_8.lifetime = farm_8.lifetime + v35
        a1.popups:show(v34, ("LUCKY! +%*"):format(formatEggs_upv_1(v35)), u2, 1.3)
    end
    a1.context.audio.play("coinSettle", {})
    a1.context.audio.play("perfect", {})
    a1:publish(true)
end
u9.retireGolden = function(a1)
    --[[
      name: retireGolden
      line: 539
      upvalues:
        u1 (copy, index: 1)
    ]]
    a1.goldenUntil = -1
    a1.goldenArrivedAt = -1
    a1.goldenEgg.CFrame = u1
    a1.goldenSparkle.Enabled = false
    a1:scheduleGolden()
end
u9.awardTrophies = function(a1)
    --[[
      name: awardTrophies
      line: 546
      upvalues:
        collectNewTrophies_upv_1 (copy, index: 1)
        TROPHIES_upv_1 (copy, index: 2)
    ]]
    local v36 = collectNewTrophies_upv_1(a1.farm, a1:currentEggsPerSecond())
    if #v36 ~= 0 then
        a1.toastSeq = a1.toastSeq + 1
        a1.pendingToast = {name = TROPHIES_upv_1[v36[#v36] + 1].name, seq = a1.toastSeq}
        a1:rebuildTrophyFlags()
        a1.context.audio.play("medalReveal", {})
        a1:publish(true)
    else
        return nil
    end
end
u9.sleep = function(a1)
    --[[
      name: sleep
      line: 563
    ]]
    a1:saveFarm()
    a1:setRunning(false)
    a1.context.endRun((math.floor(math.min(a1.farm.lifetime, 9e+15))))
end
u9.loadFarm = function(a1)
    --[[
      name: loadFarm
      line: 568
      upvalues:
        playersAtom_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
        deserializeFarm_upv_1 (copy, index: 3)
        OFFLINE_CAP_SECONDS_upv_1 (copy, index: 4)
        farmEggsPerSecond_upv_1 (copy, index: 5)
        OFFLINE_RATE_FRACTION_upv_1 (copy, index: 6)
        PRODUCERS_upv_1 (copy, index: 7)
        MAX_PROPS_PER_PRODUCER_upv_1 (copy, index: 8)
    ]]
    local eggFarm_1 = playersAtom_upv_1()[tostring(Players_upv_1.LocalPlayer.UserId)]
    if eggFarm_1 ~= nil then
        eggFarm_1 = eggFarm_1.eggFarm
    end
    if eggFarm_1 ~= nil then
        a1.farm = deserializeFarm_upv_1(eggFarm_1)
        if eggFarm_1.lastSeenUnix > 0 then
            local v37 = math.max(os.time() - eggFarm_1.lastSeenUnix, 0)
            local v38 = math.min(v37, OFFLINE_CAP_SECONDS_upv_1)
            local v39 = farmEggsPerSecond_upv_1(a1.farm) * v38 * OFFLINE_RATE_FRACTION_upv_1
            if v39 >= 1 then
                local farm_9 = a1.farm
                farm_9.eggs = farm_9.eggs + v39
                local farm_10 = a1.farm
                farm_10.lifetime = farm_10.lifetime + v39
                a1.offlineView = {eggs = v39, awaySeconds = v37}
            end
        end
    end
    a1.lifetimeAtLoad = a1.farm.lifetime
    for n_1 = 0, #PRODUCERS_upv_1 - 1 do
        local v40 = math.min(a1.farm.producers[n_1 + 1], MAX_PROPS_PER_PRODUCER_upv_1)
        while a1.propCountByType[n_1 + 1] < v40 do
            a1:placeProp(n_1, true)
        end
    end
    a1:reportLifetime()
end
u9.saveFarm = function(a1)
    --[[
      name: saveFarm
      line: 602
      upvalues:
        ClientEvents_upv_1 (copy, index: 1)
        serializeFarm_upv_1 (copy, index: 2)
    ]]
    if a1.farmLoaded then
        ClientEvents_upv_1.saveEggFarm:fire(serializeFarm_upv_1(a1.farm))
    else
        return nil
    end
end
u9.reportLifetime = function(a1)
    --[[
      name: reportLifetime
      line: 608
    ]]
    a1.context.reportScore((math.floor(math.min(a1.farm.lifetime, 9e+15))))
end
u9.currentEggsPerSecond = function(a1)
    --[[
      name: currentEggsPerSecond
      line: 611
      upvalues:
        farmEggsPerSecond_upv_1 (copy, index: 1)
        GOLDEN_EGG_upv_1 (copy, index: 2)
    ]]
    local v41 = farmEggsPerSecond_upv_1(a1.farm)
    if a1.simClock >= a1.frenzyUntil then
        return v41
    end
    return v41 * GOLDEN_EGG_upv_1.frenzyMultiplier
end
u9.revealedUpgradeCount = function(a1)
    --[[
      name: revealedUpgradeCount
      line: 615
      upvalues:
        UPGRADE_CATALOG_upv_1 (copy, index: 1)
        upgradeRevealed_upv_1 (copy, index: 2)
    ]]
    local v42 = 0
    for _, value_1 in UPGRADE_CATALOG_upv_1 do
        v42 = (upgradeRevealed_upv_1(a1.farm, value_1) and (v42 + 1)) or v42
    end
    return v42
end
u9.upgradeGlyph = function(a1, a2)
    --[[
      name: upgradeGlyph
      line: 624
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
    ]]
    if a2.kind == "tier" and a2.producerIndex ~= nil then
        return PRODUCERS_upv_1[a2.producerIndex + 1].glyph
    elseif a2.kind ~= "chickBoost" then
        if a2.kind ~= "goldenMeta" then
            if a2.kind ~= "cats" then
                if a2.kind ~= "flavor" then
                    return "\240\159\145\134"
                end
                return "\240\159\141\179"
            end
            return "\240\159\144\177"
        end
        return "\226\156\168"
    else
        return "\240\159\144\163"
    end
end
u9.rebuildUpgradeRows = function(a1)
    --[[
      name: rebuildUpgradeRows
      line: 642
      upvalues:
        UPGRADE_CATALOG_upv_1 (copy, index: 1)
        upgradeRevealed_upv_1 (copy, index: 2)
    ]]
    local tbl_4 = {}
    local tbl_5 = {}
    local tbl_6 = nil
    for _, value_2 in UPGRADE_CATALOG_upv_1 do
        tbl_6 = {}
        tbl_6.id = value_2.id
        tbl_6.name = value_2.name
        tbl_6.blurb = value_2.blurb
        tbl_6.cost = value_2.cost
        tbl_6.glyph = a1:upgradeGlyph(value_2)
        if a1.farm.upgrades[value_2.id + 1] == true then
            table.insert(tbl_5, tbl_6)
            continue
        end
        if upgradeRevealed_upv_1(a1.farm, value_2) then
            table.insert(tbl_4, tbl_6)
        end
    end
    table.sort(
        tbl_4,
        function(a2, a3)
            --[[
              line: 659
            ]]
            return a2.cost < a3.cost
        end
    )
    a1.upgradeRows = tbl_4
    a1.ownedUpgradeRows = tbl_5
    a1.upgradeRowsRevealed = #tbl_4
end
u9.rebuildTrophyFlags = function(a1)
    --[[
      name: rebuildTrophyFlags
      line: 666
      upvalues:
        TROPHIES_upv_1 (copy, index: 1)
    ]]
    local tbl_7 = {}
    for n_2 = 0, #TROPHIES_upv_1 - 1 do
        table.insert(tbl_7, a1.farm.trophies[n_2 + 1] == true)
    end
    a1.trophyFlags = tbl_7
end
u9.publish = function(a1, a2)
    --[[
      name: publish
      line: 674
      upvalues:
        PRODUCERS_upv_1 (copy, index: 1)
        producerPrice_upv_1 (copy, index: 2)
        tbl_upv_1 (copy, index: 3)
        GOLDEN_EGG_upv_1 (copy, index: 4)
        eggFarmAtom_upv_1 (copy, index: 5)
        clickValue_upv_1 (copy, index: 6)
        trophyCount_upv_1 (copy, index: 7)
        trophyMultiplier_upv_1 (copy, index: 8)
    ]]
    if not (a2) and a1.simClock < a1.publishAt then
        return nil
    end
    a1.publishAt = a1.simClock + 0.15
    local tbl_8 = {}
    local v43 = 0
    local v44 = nil
    for n_3 = 0, #PRODUCERS_upv_1 - 1 do
        local v45 = a1.farm.producers[n_3 + 1]
        v43 = v43 + v45
        v44 = true
        if n_3 == 0 then
            table.insert(tbl_8, {owned = v45, price = producerPrice_upv_1(a1.farm, n_3), revealed = v44})
            continue
        end
        local v46 = true
        if v45 > 0 then
            v44 = v46
            table.insert(tbl_8, {owned = v45, price = producerPrice_upv_1(a1.farm, n_3), revealed = v44})
            continue
        end
        local v47 = true
        if a1.farm.producers[n_3] > 0 then
            v44 = v47
        else
            v44 = PRODUCERS_upv_1[n_3 + 1].baseCost * 0.5 <= a1.farm.lifetime
        end
        table.insert(tbl_8, {owned = v45, price = producerPrice_upv_1(a1.farm, n_3), revealed = v44})
    end
    local v48
    if a1.simClock < a1.frenzyUntil or a1.simClock < a1.clickFrenzyUntil then
        local tbl_9 = {}
        if a1.simClock < a1.frenzyUntil then
            table.insert(tbl_9, {remainingSeconds = a1.frenzyUntil - a1.simClock, totalSeconds = GOLDEN_EGG_upv_1.frenzySeconds})
        end
        if a1.simClock < a1.clickFrenzyUntil then
            table.insert(tbl_9, {remainingSeconds = a1.clickFrenzyUntil - a1.simClock, totalSeconds = GOLDEN_EGG_upv_1.clickFrenzySeconds})
        end
        v48 = tbl_9
    else
        v48 = tbl_upv_1
    end
    eggFarmAtom_upv_1(
        {
            eggs = a1.farm.eggs,
            lifetime = a1.farm.lifetime,
            sessionEggs = a1.farm.lifetime - a1.lifetimeAtLoad,
            eggsPerSecond = a1:currentEggsPerSecond(),
            clickEggs = clickValue_upv_1(a1.farm, a1:currentEggsPerSecond(), ((a1.simClock >= a1.clickFrenzyUntil) and 1) or (GOLDEN_EGG_upv_1.clickFrenzyMultiplier)),
            clicks = a1.farm.clicks,
            goldens = a1.farm.goldens,
            producersTotal = v43,
            trophyCount = trophyCount_upv_1(a1.farm),
            trophyBonus = trophyMultiplier_upv_1(a1.farm) - 1,
            producers = tbl_8,
            upgrades = a1.upgradeRows,
            ownedUpgrades = a1.ownedUpgradeRows,
            trophiesEarned = a1.trophyFlags,
            buffs = v48,
            offline = a1.offlineView,
            trophyToast = a1.pendingToast
        }
    )
end
u9.shellCFrame = function(a1, a2, a3, a4, a5, a6)
    --[[
      name: shellCFrame
      line: 734
      upvalues:
        EGG_RADIUS_X_upv_1 (copy, index: 1)
        EGG_RADIUS_Y_upv_1 (copy, index: 2)
        EGG_HALF_DEPTH_upv_1 (copy, index: 3)
    ]]
    return a2 * CFrame.new((a3 * EGG_RADIUS_X_upv_1) * a5, (a4 * EGG_RADIUS_Y_upv_1) * a6, math.sqrt(math.max((1 - (a3 * a3)) - (a4 * a4), 0.04)) * EGG_HALF_DEPTH_upv_1)
end
u9.currentSkin = function(a1)
    --[[
      name: currentSkin
      line: 740
      upvalues:
        EGG_SKINS_upv_1 (copy, index: 1)
    ]]
    return EGG_SKINS_upv_1[math.clamp(a1.eggSkinTier, 0, #EGG_SKINS_upv_1 - 1) + 1]
end
u9.syncEggSkin = function(a1, a2, a3, a4)
    --[[
      name: syncEggSkin
      line: 743
      upvalues:
        EGG_SKIN_THRESHOLDS_upv_1 (copy, index: 1)
        eggPatternDots_upv_1 (copy, index: 2)
    ]]
    local v49 = 0
    for n_4 = 0, #EGG_SKIN_THRESHOLDS_upv_1 - 1 do
        if EGG_SKIN_THRESHOLDS_upv_1[n_4 + 1] <= a1.farm.lifetime then
            v49 = n_4
        end
    end
    if v49 ~= a1.eggSkinTier then
        if a1.eggSkinTier >= 0 then
            a1.chipBurst:Emit(26)
            a1.sparkBurst:Emit(14)
            a1.stage.shake(0.35)
            a1.context.audio.play("perfect", {})
        end
        a1.eggSkinTier = v49
        a1.cracksShown = -1
        a1.eggBody.Color = a1:currentSkin().shell
        a1:applyPattern()
    end
    local v50 = eggPatternDots_upv_1(a1:currentSkin().patternKind)
    for n_5 = 0, #v50 - 1 do
        local v51 = v50[n_5 + 1]
        a1.patternDots[n_5 + 1].CFrame = a1:shellCFrame(a2, v51.x, v51.y, a3, a4)
    end
    a1:syncCracks(a2, v49, a3, a4)
end
u9.applyPattern = function(a1)
    --[[
      name: applyPattern
      line: 774
      upvalues:
        eggPatternDots_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
    ]]
    local v52 = a1:currentSkin()
    local v53 = eggPatternDots_upv_1(v52.patternKind)
    for n_6 = 0, #a1.patternDots - 1 do
        local v54 = a1.patternDots[n_6 + 1]
        local v55
        v55 = v53[n_6 + 1]
        if v55 == nil then
            v54.CFrame = u1
            continue
        end
        v54.Color = v52.pattern
        local v56
        if v52.patternNeon then
            v56 = Enum.Material.Neon
        else
            v56 = Enum.Material.Plastic
        end
        v54.Material = v56
        v54.Size = Vector3.new(v55.size, v55.size, v55.size * 0.6)
    end
end
u9.syncCracks = function(a1, a2, a3, a4, a5)
    --[[
      name: syncCracks
      line: 790
      upvalues:
        EGG_SKIN_THRESHOLDS_upv_1 (copy, index: 1)
        EGG_CRACK_START_PROGRESS_upv_1 (copy, index: 2)
        EGG_CRACK_PLATES_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
        EGG_CRACKS_upv_1 (copy, index: 5)
    ]]
    local v57 = EGG_SKIN_THRESHOLDS_upv_1[a3 + 2]
    local v58 = 0
    local v59 = nil
    if v57 ~= nil then
        local v60 = math.max(EGG_SKIN_THRESHOLDS_upv_1[a3 + 1], 1)
        local v61 = math.log(math.max(v57 / v60, 1.0001), 10)
        v59 = math.clamp(math.log(math.max(a1.farm.lifetime / v60, 1), 10) / v61, 0, 1)
        if EGG_CRACK_START_PROGRESS_upv_1 < v59 then
            v58 = math.min(math.floor(((v59 - EGG_CRACK_START_PROGRESS_upv_1) / (1 - EGG_CRACK_START_PROGRESS_upv_1)) * EGG_CRACK_PLATES_upv_1) + 1, EGG_CRACK_PLATES_upv_1)
        end
    end
    if v58 ~= a1.cracksShown then
        a1.cracksShown = v58
        for n_7 = 0, #a1.crackPlates - 1 do
            local v62 = a1.crackPlates[n_7 + 1]
            if v58 > n_7 then
                local v63 = EGG_CRACKS_upv_1[n_7 + 1]
                v62.Size = Vector3.new(v63.length, v63.thickness, 0.3)
            else
                v62.CFrame = u1
            end
        end
    end
    local v61, v60
    v61, v60 = false, 0
    while true do
        if v61 then
            v60 = v60 + 1
        else
            v61 = true
        end
        if v60 >= v58 then
            break
        end
        local v64 = EGG_CRACKS_upv_1[v60 + 1]
        a1.crackPlates[v60 + 1].CFrame = a1:shellCFrame(a2, v64.x, v64.y, a4, a5) * CFrame.Angles(0, 0, v64.angle)
    end
end
u9.syncEggFace = function(a1, a2)
    --[[
      name: syncEggFace
      line: 836
      upvalues:
        EGG_FRENZY_FACE_upv_1 (copy, index: 1)
        EGG_HALF_DEPTH_upv_1 (copy, index: 2)
        EGG_CENTER_Y_upv_1 (copy, index: 3)
    ]]
    local v65 = a1.simClock < a1.frenzyUntil
    local v66
    if v65 then
        v66 = -1
    else
        v66 = a1.eggSkinTier
    end
    if v66 ~= a1.faceTier then
        a1.faceTier = v66
        local v67
        if v65 then
            v67 = EGG_FRENZY_FACE_upv_1
        else
            v67 = a1:currentSkin().face
        end
        a1.eggFace:apply(v67, 6.4, EGG_HALF_DEPTH_upv_1 + 0.3)
    end
    if a1.nextBlinkAt <= a2 then
        a1.nextBlinkAt = (a2 + 2.4) + (math.random() * 3.6)
        a1.blinkUntil = a2 + 0.11
    end
    local eggFace_1 = a1.eggFace
    local v68 = true
    if a2 >= a1.blinkUntil then
        v68 = a1.simClock < a1.squintUntil
    end
    eggFace_1:setEyesClosed(v68)
    if a1.simClock >= a1.goldenUntil then
        a1.eggFace:setPupilOffset(0, 0)
    else
        local v69 = a1:goldenPlanePosition()
        a1.eggFace:setPupilOffset(math.clamp(v69.X / 18, -1, 1) * 0.035, -math.clamp((v69.Y - EGG_CENTER_Y_upv_1) / 14, -1, 1) * 0.035)
        return nil
    end
end
u9.arrivalScale = function(a1, a2)
    --[[
      name: arrivalScale
      line: 860
    ]]
    return ((math.sin(a2 * math.pi) * 0.35) + 1) - ((1 - a2) ^ 2)
end
u9.scheduleGolden = function(a1)
    --[[
      name: scheduleGolden
      line: 863
      upvalues:
        GOLDEN_EGG_upv_1 (copy, index: 1)
        goldenSpawnScale_upv_1 (copy, index: 2)
    ]]
    a1.nextGoldenAt = a1.simClock + ((GOLDEN_EGG_upv_1.spawnMinSeconds + (math.random() * (GOLDEN_EGG_upv_1.spawnMaxSeconds - GOLDEN_EGG_upv_1.spawnMinSeconds))) * goldenSpawnScale_upv_1(a1.farm))
end
u9.goldenPlanePosition = function(a1)
    --[[
      name: goldenPlanePosition
      line: 868
      upvalues:
        contentHalfWidth_upv_1 (copy, index: 1)
    ]]
    local v70 = os.clock() * 0.35 + a1.goldenPhase
    local v71 = math.max(contentHalfWidth_upv_1(a1.layoutWidth, a1.layoutPortrait) - 6, 8)
    return Vector2.new(math.sin(v70) * math.min(v71, 15), (math.sin(v70 * 2) * 6) + 2)
end
u9.screenToPlane = function(a1, a2)
    --[[
      name: screenToPlane
      line: 874
    ]]
    local v72 = a1.stage.camera:ScreenPointToRay(a2.X, a2.Y)
    local Z_1 = v72.Direction.Z
    if math.abs(Z_1) >= 1e-04 then
        local v73 = v72.Origin + v72.Direction * ((a1.stage.origin.Z - v72.Origin.Z) / Z_1)
        return Vector2.new(v73.X - a1.stage.origin.X, v73.Y - a1.stage.origin.Y)
    end
    return Vector2.new(math.huge, math.huge)
end
u9.placeProp = function(a1, a2, a3)
    --[[
      name: placeProp
      line: 886
      upvalues:
        MAX_PROPS_PER_PRODUCER_upv_1 (copy, index: 1)
        producerCellX_upv_1 (copy, index: 2)
        propSlotOffsetX_upv_1 (copy, index: 3)
        producerCellY_upv_1 (copy, index: 4)
        producerCellZ_upv_1 (copy, index: 5)
        propSlotOffsetZ_upv_1 (copy, index: 6)
        buildProp_upv_1 (copy, index: 7)
        PRODUCERS_upv_1 (copy, index: 8)
        u3 (copy, index: 9)
    ]]
    if a3 == nil then
        a3 = false
    end
    local v74 = a1.propCountByType[a2 + 1]
    if MAX_PROPS_PER_PRODUCER_upv_1 > v74 then
        a1.propCountByType[a2 + 1] = v74 + 1
        local v75 = a1.stage.origin + Vector3.new(producerCellX_upv_1(a2) + propSlotOffsetX_upv_1(v74), producerCellY_upv_1(a2), producerCellZ_upv_1(a2) + propSlotOffsetZ_upv_1(v74))
        a1.propIdle:add(buildProp_upv_1(a2, a1.stage.container, v75, ((a2 * 3) + (v74 * 5)) * 0.37))
        if not (a3) then
            a1.context.audio.play("thud", {})
            a1.popups:show(v75 + Vector3.new(0, 3.4000000953674316, 2), PRODUCERS_upv_1[a2 + 1].name, u3, 0.6)
        end
    else
        return nil
    end
end
u9.makeBurst = function(a1, a2, a3, a4, a5)
    --[[
      name: makeBurst
      line: 910
      upvalues:
        SQUARE_PARTICLE_TEXTURE_upv_1 (copy, index: 1)
    ]]
    local v76 = Instance.new("ParticleEmitter")
    v76.Texture = SQUARE_PARTICLE_TEXTURE_upv_1
    v76.Rate = 0
    v76.Lifetime = NumberRange.new(0.25, 0.6)
    v76.Speed = NumberRange.new(a5 * 0.6, a5)
    v76.SpreadAngle = Vector2.new(180, 180)
    v76.Rotation = NumberRange.new(0, 90)
    v76.RotSpeed = NumberRange.new(-180, 180)
    v76.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, a4), NumberSequenceKeypoint.new(1, a4 * 0.25)})
    v76.Color = ColorSequence.new(a3)
    v76.Parent = a2
    return v76
end
local tbl_10 = {}
tbl_10.CookieClickerGame = u9
return tbl_10