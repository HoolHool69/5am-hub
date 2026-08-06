-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local BaseWorldGame_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "base-world-game").BaseWorldGame
local DistanceScore_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "distance-score").DistanceScore
local gamepadInput_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "gamepad-input").gamepadInput
local lerp_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "interpolate").lerp
local makeSmoothPart_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "part-factory").makeSmoothPart
local PopupTextPool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "common", "popup-text").PopupTextPool
local publishCombo_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent.Parent, "store", "ui-atoms").publishCombo
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "resume-codec")
local readResume_upv_1 = v1.readResume
local writeResume_upv_1 = v1.writeResume
local SpiderRig_upv_1 = RuntimeLib_1.import(script, script.Parent, "spider-rig").SpiderRig
local STICKMAN_HOOK_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-config").STICKMAN_HOOK_CONFIG
local StickmanHookFx_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-fx").StickmanHookFx
local StickmanHookLava_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-lava").StickmanHookLava
local StickmanHookScenery_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-scenery").StickmanHookScenery
local v2 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-style")
local anchorTetherContactY_upv_1 = v2.anchorTetherContactY
local STICKMAN_HOOK_STYLE_upv_1 = v2.STICKMAN_HOOK_STYLE
local anchorSpecFor_upv_1 = RuntimeLib_1.import(script, script.Parent, "stickman-hook-anchors").anchorSpecFor
local u1 = CFrame.new(0, -1000, 0)
local u2 = Color3.fromRGB(250, 250, 255)
local u3 = Color3.fromRGB(126, 226, 255)
local u4 = Color3.fromRGB(86, 168, 196)
local u5 = Color3.fromRGB(196, 246, 255)
local u6 = Color3.fromRGB(255, 196, 92)
local u7 = Color3.fromRGB(226, 132, 120)
local u8 = CFrame.Angles(0, 1.5707963267948966, 0)
local anchorTether_upv_1 = STICKMAN_HOOK_STYLE_upv_1.depth.anchorTether
local u9 = Color3.fromRGB(255, 216, 102)
local u10 = Color3.fromRGB(255, 90, 100)
local u11 = Color3.fromRGB(126, 226, 255)
local tbl_1 = {}
local tbl_2 = {}
tbl_2.__tostring = function()
    --[[
      name: __tostring
      line: 111
    ]]
    return "StickmanHookGame"
end
tbl_2.__index = BaseWorldGame_upv_1
local u12 = setmetatable(tbl_1, tbl_2)
u12.__index = u12
u12.new = function(...)
    --[[
      name: new
      line: 117
      upvalues:
        u12 (ref, index: 1)
    ]]
    local v3 = setmetatable({}, u12)
    return v3:constructor(...) or v3
end
u12.constructor = function(a1, a2)
    --[[
      name: constructor
      line: 121
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
        DistanceScore_upv_1 (copy, index: 2)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 3)
    ]]
    BaseWorldGame_upv_1.constructor(a1, a2)
    a1.distance = DistanceScore_upv_1.new(STICKMAN_HOOK_CONFIG_upv_1.studsPerMetre)
    a1.chain = {}
    a1.mode = "waiting"
    a1.x = 0
    a1.y = 0
    a1.velocityX = 0
    a1.velocityY = 0
    a1.swingAnchorIndex = 0
    a1.ropeLength = 10
    a1.swingAngle = 0
    a1.swingVelocity = 0
    a1.breakawayRemaining = 0
    a1.simClock = 0
    a1.maxX = 0
    a1.chainCount = 0
    a1.lastReleasedIndex = -1
    a1.recatchCooldown = 0
    a1.invulnRemaining = 0
    a1.dead = false
    a1.roundToken = 0
    a1.renderPrevX = 0
    a1.renderPrevY = 0
    a1.pointerHeld = false
    a1.keyHeld = false
    a1.heldPrevious = false
    a1.wantAttach = false
    a1.windowCursor = 0
    a1.floorY = -STICKMAN_HOOK_CONFIG_upv_1.floorDropStuds
    a1.floorTargetY = -STICKMAN_HOOK_CONFIG_upv_1.floorDropStuds
    a1.anchors = {}
    a1.candidateIndex = -1
    a1.cameraX = 0
    a1.cameraY = 0
end
u12.buildScene = function(a1)
    --[[
      name: buildScene
      line: 157
      upvalues:
        StickmanHookScenery_upv_1 (copy, index: 1)
        StickmanHookFx_upv_1 (copy, index: 2)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 3)
        makeSmoothPart_upv_1 (copy, index: 4)
        u2 (copy, index: 5)
        u1 (copy, index: 6)
        u3 (copy, index: 7)
        STICKMAN_HOOK_STYLE_upv_1 (copy, index: 8)
        SpiderRig_upv_1 (copy, index: 9)
        StickmanHookLava_upv_1 (copy, index: 10)
        PopupTextPool_upv_1 (copy, index: 11)
    ]]
    local container_1 = a1.stage.container
    a1.scenery = StickmanHookScenery_upv_1.new(container_1, a1.stage.origin)
    a1.fx = StickmanHookFx_upv_1.new(container_1, a1.stage.origin)
    for _ = 0, STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize - 1 do
        local v4 = makeSmoothPart_upv_1(container_1)
        v4.Shape = Enum.PartType.Ball
        v4.Color = u2
        v4.Size = Vector3.new(1.600000023841858, 1.600000023841858, 1.600000023841858)
        v4.CFrame = u1
        local v5 = makeSmoothPart_upv_1(container_1)
        v5.Shape = Enum.PartType.Cylinder
        v5.Material = Enum.Material.Neon
        v5.Color = u3
        v5.Transparency = 0.55
        v5.Size = Vector3.new(0.14000000059604645, 2.5999999046325684, 2.5999999046325684)
        v5.CFrame = u1
        local v6 = makeSmoothPart_upv_1(container_1)
        v6.Color = STICKMAN_HOOK_STYLE_upv_1.silk.dressing
        v6.Transparency = STICKMAN_HOOK_STYLE_upv_1.silk.strandTransparency
        v6.Size = Vector3.new(0.12999999523162842, 1, 0.12999999523162842)
        v6.CFrame = u1
        local v7 = makeSmoothPart_upv_1(container_1)
        v7.Color = STICKMAN_HOOK_STYLE_upv_1.silk.dressing
        v7.Transparency = STICKMAN_HOOK_STYLE_upv_1.silk.strandTransparency
        v7.Size = Vector3.new(0.12999999523162842, 1, 0.12999999523162842)
        v7.CFrame = u1
        local v8 = makeSmoothPart_upv_1(container_1)
        v8.Color = STICKMAN_HOOK_STYLE_upv_1.silk.dressing
        v8.Transparency = STICKMAN_HOOK_STYLE_upv_1.silk.sacTransparency
        v8.Size = Vector3.new(4, 0.6000000238418579, 0.5)
        v8.CFrame = u1
        table.insert(a1.anchors, {orb = v4, ring = v5, tetherLeft = v6, tetherRight = v7, tetherPatch = v8})
    end
    a1.spider = SpiderRig_upv_1.new(container_1, a1.stage.origin)
    a1.lava = StickmanHookLava_upv_1.new(container_1, a1.stage.origin)
    a1.popups = PopupTextPool_upv_1.new(container_1, 6)
    a1.stage.setFrameWidthFloor(44)
    a1.context.janitor:Add(
        a1.context.input.pressBegan:Connect(
            function(a2, a3)
                --[[
                  line: 212
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a3 ~= "pointer" then
                    a1.keyHeld = true
                else
                    a1.pointerHeld = true
                end
            end
        )
    )
    a1.context.janitor:Add(
        a1.context.input.pressEnded:Connect(
            function(a4, a5, a6)
                --[[
                  line: 219
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                if a6 ~= "pointer" then
                    a1.keyHeld = false
                else
                    a1.pointerHeld = false
                end
            end
        )
    )
end
u12.resetRound = function(a1)
    --[[
      name: resetRound
      line: 227
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.mode = "waiting"
    table.clear(a1.chain)
    a1.simClock = 0
    a1.x = 0
    a1.y = 8
    a1.velocityX = 0
    a1.velocityY = 0
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1.maxX = 0
    a1.chainCount = 0
    a1.lastReleasedIndex = -1
    a1.recatchCooldown = 0
    a1.invulnRemaining = 0
    a1.pointerHeld = false
    a1.keyHeld = false
    a1.heldPrevious = false
    a1.wantAttach = false
    a1.distance:reset()
    a1.windowCursor = 0
    for _, value_1 in a1.anchors do
        a1:dressAnchor(value_1, a1.windowCursor)
        a1.windowCursor = a1.windowCursor + 1
    end
    a1.swingAnchorIndex = 0
    a1.ropeLength = STICKMAN_HOOK_CONFIG_upv_1.startRopeLength
    a1.swingAngle = 0
    a1.swingVelocity = 0
    a1.candidateIndex = -1
    local v9 = a1:anchorPosition(0)
    a1.x = v9.X
    a1.y = v9.Y - a1.ropeLength
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1.spider:snapPose(a1.swingAngle, true)
    a1:updateFloorTarget()
    a1.floorY = a1.floorTargetY
    a1.cameraX = a1.x + STICKMAN_HOOK_CONFIG_upv_1.cameraLeadX
    a1.cameraY = a1.y + STICKMAN_HOOK_CONFIG_upv_1.cameraHeightOffset
    a1.scenery:invalidate()
    a1.lava:invalidate()
    a1.fx:reset()
    a1.popups:hideAll()
    a1.context.reportScore(0)
end
u12.revive = function(a1)
    --[[
      name: revive
      line: 276
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.dead = false
    a1.invulnRemaining = STICKMAN_HOOK_CONFIG_upv_1.reviveInvulnSeconds
    local v10 = a1:nearestReviveAnchor()
    if v10 == nil then
        a1.mode = "free"
        a1.velocityX = 10
        a1.velocityY = 22
    else
        a1.mode = "waiting"
        a1.swingAnchorIndex = v10
        a1.ropeLength = STICKMAN_HOOK_CONFIG_upv_1.startRopeLength
        local v11 = math.sqrt(-STICKMAN_HOOK_CONFIG_upv_1.gravity / a1.ropeLength)
        local v12 = a1.simClock * v11
        a1.swingAngle = STICKMAN_HOOK_CONFIG_upv_1.startSwingAmplitudeRadians * math.sin(v12)
        a1.swingVelocity = (STICKMAN_HOOK_CONFIG_upv_1.startSwingAmplitudeRadians * v11) * math.cos(v12)
        local v13 = a1:anchorPosition(v10)
        a1.x = v13.X + (a1.ropeLength * math.sin(a1.swingAngle))
        a1.y = v13.Y - (a1.ropeLength * math.cos(a1.swingAngle))
    end
    a1.pointerHeld = false
    a1.keyHeld = false
    a1.heldPrevious = false
    a1.wantAttach = false
    a1.candidateIndex = -1
    a1.renderPrevX = a1.x
    a1.renderPrevY = a1.y
    a1.spider:snapPose(a1.swingAngle, a1.mode == "waiting")
end
u12.nearestReviveAnchor = function(a1)
    --[[
      name: nearestReviveAnchor
      line: 314
    ]]
    local v14 = nil
    local v15 = nil
    local v16 = math.huge
    local v17 = math.huge
    v16, v15, v14 = v16, v15, v14
    local v18 = nil
    local v19 = nil
    local v20 = nil
    local v21 = nil
    local v22 = nil
    local v23 = nil
    for _, value_2 in a1.anchors do
        if value_2.globalIndex < 0 or value_2.broken then
            continue
        end
        v20 = a1:anchorPosition(value_2.globalIndex)
        v21 = v20.X - a1.x
        v22 = v20.Y - a1.y
        v19 = math.sqrt((v21 * v21) + (v22 * v22))
        if v19 < v16 then
            v16, v14 = v19, value_2.globalIndex
        end
        v23 = a1.chain[value_2.globalIndex + 1]
        v18 = false
        if v23 ~= nil then
            v18 = false
            if v23.movingAmplitude <= 0 then
                v18 = v23.breakawaySeconds <= 0
            end
        end
        if not (v18) then
            continue
        end
        if v19 < v17 then
            v17, v15 = v19, value_2.globalIndex
        end
    end
    if v15 == nil then
        return v14
    end
    return v15
end
u12.captureRound = function(a1)
    --[[
      name: captureRound
      line: 340
      upvalues:
        writeResume_upv_1 (copy, index: 1)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 2)
    ]]
    if not (a1.dead) then
        local v24 = nil
        if a1.mode == "swinging" then
            v24 = a1.chain[a1.swingAnchorIndex + 1]
            if v24 ~= nil and v24.movingAmplitude <= 0 and v24.breakawaySeconds <= 0 then
                return writeResume_upv_1(
                    function(a2)
                        --[[
                          line: 349
                          upvalues:
                            a1 (copy, index: 1)
                            STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 2)
                        ]]
                        a2:int(a1.swingAnchorIndex):int(a1.windowCursor):int(a1.chainCount)
                        a2:num(a1.ropeLength):num(a1.swingAngle):num(a1.swingVelocity)
                        a2:num(a1.maxX):num(a1.distance:studs()):num(a1.simClock)
                        local tbl_3 = {}
                        for n_1 = 0, STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize - 1 do
                            table.insert(tbl_3, ((a1.anchors[((a1.windowCursor - STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize + n_1) % STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize) + 1].broken) and "1") or "0")
                        end
                        a2:str(table.concat(tbl_3, ""))
                    end
                )
            end
            return nil
        end
    end
    return nil
end
u12.restoreRound = function(a1, a2)
    --[[
      name: restoreRound
      line: 365
      upvalues:
        readResume_upv_1 (copy, index: 1)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 2)
        u1 (copy, index: 3)
    ]]
    local v25 = readResume_upv_1(
        a2.state,
        function(a3)
            --[[
              line: 366
            ]]
            local tbl_4 = {}
            tbl_4.anchorIndex = a3:int()
            tbl_4.cursor = a3:int()
            tbl_4.chainCount = a3:int()
            tbl_4.ropeLength = a3:num()
            tbl_4.swingAngle = a3:num()
            tbl_4.swingVelocity = a3:num()
            tbl_4.maxX = a3:num()
            tbl_4.distanceStuds = a3:num()
            tbl_4.simClock = a3:num()
            tbl_4.states = a3:str()
            return tbl_4
        end
    )
    if v25 ~= nil and v25.cursor >= STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize and #v25.states == STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize and v25.anchorIndex >= v25.cursor - STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize and v25.cursor > v25.anchorIndex then
        a1.windowCursor = 0
        table.clear(a1.chain)
        for n_2 = 0, STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize - 1 do
            local v26 = v25.cursor - STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize + n_2
            local v27 = a1.anchors[(v26 % STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize) + 1]
            a1:dressAnchor(v27, v26)
            v27.broken = string.sub(v25.states, n_2 + 1, n_2 + 1) == "1"
            if v27.broken then
                v27.orb.CFrame = u1
                v27.ring.CFrame = u1
            end
        end
        a1.windowCursor = v25.cursor
        a1.simClock = math.max(v25.simClock, 0)
        a1.chainCount = math.max(v25.chainCount, 0)
        a1.mode = "swinging"
        a1.swingAnchorIndex = v25.anchorIndex
        a1.ropeLength = math.clamp(v25.ropeLength, STICKMAN_HOOK_CONFIG_upv_1.ropeMinLength, STICKMAN_HOOK_CONFIG_upv_1.ropeMaxLength)
        a1.swingAngle = v25.swingAngle
        a1.swingVelocity = v25.swingVelocity
        a1.breakawayRemaining = 0
        a1.maxX = math.max(v25.maxX, 0)
        a1.distance:restore((math.max(v25.distanceStuds, 0)))
        local v29 = a1:anchorPosition(a1.swingAnchorIndex)
        a1.x = v29.X + (a1.ropeLength * math.sin(a1.swingAngle))
        a1.y = v29.Y - (a1.ropeLength * math.cos(a1.swingAngle))
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1.spider:snapPose(a1.swingAngle, true)
        a1:updateFloorTarget()
        a1.floorY = a1.floorTargetY
        a1.cameraX = a1.x + STICKMAN_HOOK_CONFIG_upv_1.cameraLeadX
        a1.cameraY = a1.y + STICKMAN_HOOK_CONFIG_upv_1.cameraHeightOffset
        a1.scenery:invalidate()
        a1.lava:invalidate()
        a1.fx:reset()
        a1.context.reportScore(a2.score)
        return true
    end
    return false
end
u12.fixedUpdate = function(a1, a2)
    --[[
      name: fixedUpdate
      line: 434
      upvalues:
        gamepadInput_upv_1 (copy, index: 1)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1.simClock = a1.simClock + a2
        if a1.invulnRemaining > 0 then
            a1.invulnRemaining = a1.invulnRemaining - a2
        end
        if a1.recatchCooldown > 0 then
            a1.recatchCooldown = a1.recatchCooldown - a2
        end
        local v30 = a1.pointerHeld or (a1.keyHeld or (gamepadInput_upv_1:isDown(Enum.KeyCode.ButtonA)))
        if v30 and not (a1.heldPrevious) then
            a1.wantAttach = true
        end
        if not (v30) and a1.heldPrevious and a1.mode == "swinging" then
            a1:release()
        end
        if not (v30) then
            a1.wantAttach = false
        end
        a1.heldPrevious = v30
        local v31 = nil
        if a1.mode ~= "waiting" then
            local v32 = nil
            if a1.mode ~= "swinging" then
                a1:stepFree(a2)
                v32 = a1:nearestAttachable(a1.x, a1.y, STICKMAN_HOOK_CONFIG_upv_1.attachRadius)
                if v32 == nil then
                    v31 = -1
                else
                    v31 = v32
                end
                a1.candidateIndex = v31
                if a1.wantAttach then
                    a1:tryAttach()
                end
            else
                a1:stepSwing(a2)
                a1.candidateIndex = -1
            end
            if a1.maxX < a1.x then
                a1.maxX = a1.x
                if a1.distance:advance(a1.x - a1.maxX) then
                    a1.context.reportScore(a1.distance:current())
                end
            end
            local v33 = a1.windowCursor - STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize
            v31 = a1.chain[v33 + 1]
            if v31 ~= nil and v31.x < a1.x - 70 and v33 ~= a1.swingAnchorIndex then
                a1:dressAnchor(a1.anchors[(v33 % STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize) + 1], a1.windowCursor)
                a1.windowCursor = a1.windowCursor + 1
                a1:updateFloorTarget()
            end
            a1.floorY = a1.floorY + ((a1.floorTargetY - a1.floorY) * math.min(a2 * 2, 1))
            if a1.invulnRemaining <= 0 and a1.y < a1.floorY then
                a1:die()
            end
        else
            local v34 = math.sqrt(-STICKMAN_HOOK_CONFIG_upv_1.gravity / a1.ropeLength)
            v31 = a1.simClock * v34
            a1.swingAngle = STICKMAN_HOOK_CONFIG_upv_1.startSwingAmplitudeRadians * math.sin(v31)
            a1.swingVelocity = (STICKMAN_HOOK_CONFIG_upv_1.startSwingAmplitudeRadians * v34) * math.cos(v31)
            local v35 = a1:anchorPosition(a1.swingAnchorIndex)
            a1.x = v35.X + (a1.ropeLength * math.sin(a1.swingAngle))
            a1.y = v35.Y - (a1.ropeLength * math.cos(a1.swingAngle))
            if a1.wantAttach then
                a1.wantAttach = false
                a1.mode = "swinging"
                a1.chainCount = 0
                local v36 = a1.chain[a1.swingAnchorIndex + 1]
                a1.breakawayRemaining = ((v36 == nil) and 0) or (v36.breakawaySeconds)
            end
            return nil
        end
    end
end
u12.stepSwing = function(a1, a2)
    --[[
      name: stepSwing
      line: 517
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v37 = a1.chain[a1.swingAnchorIndex + 1]
    a1.swingVelocity = a1.swingVelocity + ((((STICKMAN_HOOK_CONFIG_upv_1.gravity * ((((a1.swingAngle * a1.swingVelocity) >= 0) and 1) or (STICKMAN_HOOK_CONFIG_upv_1.downswingGravityBoost))) / a1.ropeLength) * math.sin(a1.swingAngle)) * a2)
    a1.swingVelocity = a1.swingVelocity * (1 - (STICKMAN_HOOK_CONFIG_upv_1.swingDamping * a2))
    a1.swingAngle = a1.swingAngle + (a1.swingVelocity * a2)
    local v38 = a1:anchorPosition(a1.swingAnchorIndex)
    a1.x = v38.X + (a1.ropeLength * math.sin(a1.swingAngle))
    a1.y = v38.Y - (a1.ropeLength * math.cos(a1.swingAngle))
    if v37 == nil then
        return
    end
    if v37.breakawaySeconds > 0 then
        a1.breakawayRemaining = a1.breakawayRemaining - a2
        local v39
        if a1.breakawayRemaining > 0 then
            return
        end
        v39 = a1.anchors[(a1.swingAnchorIndex % STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize) + 1]
        if v39.globalIndex == a1.swingAnchorIndex then
            a1:breakAnchor(v39)
        end
        a1.context.audio.play("woodBreak", {})
        a1:release()
    end
end
u12.stepFree = function(a1, a2)
    --[[
      name: stepFree
      line: 547
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    a1.velocityY = a1.velocityY + (STICKMAN_HOOK_CONFIG_upv_1.gravity * a2)
    a1.velocityX = a1.velocityX - (((STICKMAN_HOOK_CONFIG_upv_1.airDragQuadratic * a1.velocityX) * math.abs(a1.velocityX)) * a2)
    a1.velocityY = a1.velocityY - (((STICKMAN_HOOK_CONFIG_upv_1.airDragQuadratic * a1.velocityY) * math.abs(a1.velocityY)) * a2)
    a1.x = a1.x + (a1.velocityX * a2)
    a1.y = a1.y + (a1.velocityY * a2)
end
u12.tryAttach = function(a1)
    --[[
      name: tryAttach
      line: 554
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
        publishCombo_upv_1 (copy, index: 2)
        u11 (copy, index: 3)
    ]]
    local v40 = a1:nearestAttachable(a1.x, a1.y, STICKMAN_HOOK_CONFIG_upv_1.attachRadius)
    local v41 = nil
    if v40 ~= nil then
        a1.wantAttach = false
        local v42 = a1:anchorPosition(v40)
        local v43 = a1.x - v42.X
        local v44 = a1.y - v42.Y
        a1:startSwing(v40, math.clamp(math.max(math.sqrt((v43 * v43) + (v44 * v44)), 0.1), STICKMAN_HOOK_CONFIG_upv_1.ropeMinLength, STICKMAN_HOOK_CONFIG_upv_1.ropeMaxLength), nil)
        local v45 = ((a1.velocityX * math.cos(a1.swingAngle)) + (a1.velocityY * math.sin(a1.swingAngle))) / a1.ropeLength
        local v46 = math.abs((a1.velocityX * math.sin(a1.swingAngle)) - (a1.velocityY * math.cos(a1.swingAngle)))
        local v47 = ((v45 == 0) and 1) or (math.sign(v45))
        a1.swingVelocity = v45 + ((v47 * (v46 * STICKMAN_HOOK_CONFIG_upv_1.catchRadialKeep)) / a1.ropeLength)
        a1.chainCount = a1.chainCount + 1
        if STICKMAN_HOOK_CONFIG_upv_1.comboStampFrom <= a1.chainCount then
            publishCombo_upv_1({count = a1.chainCount, color = u11})
        end
        v41 = a1.anchors[(v40 % STICKMAN_HOOK_CONFIG_upv_1.anchorPoolSize) + 1]
        if v41.globalIndex == v40 then
            v41.flash = 1
            a1.fx:catchPop(v42.X, v42.Y, v41.orb.Color)
        end
        a1.spider:onCatch()
        a1.context.audio.play("thud", {})
        a1.context.audio.play("whoosh", {})
    else
        return nil
    end
end
u12.startSwing = function(a1, a2, a3, a4)
    --[[
      name: startSwing
      line: 600
    ]]
    a1.mode = "swinging"
    a1.swingAnchorIndex = a2
    a1.ropeLength = a3
    local v48 = a1:anchorPosition(a2)
    a1.swingAngle = math.atan2(a1.x - v48.X, -(a1.y - v48.Y))
    if a4 ~= nil then
        a1.swingVelocity = a4
    end
    local v49 = a1.chain[a2 + 1]
    a1.breakawayRemaining = ((v49 == nil) and 0) or (v49.breakawaySeconds)
    a1.x = v48.X + (a3 * math.sin(a1.swingAngle))
    a1.y = v48.Y - (a3 * math.cos(a1.swingAngle))
end
u12.release = function(a1)
    --[[
      name: release
      line: 614
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
        u9 (copy, index: 2)
    ]]
    local v50 = nil
    if a1.mode == "swinging" then
        v50 = math.abs(a1.swingVelocity) * a1.ropeLength
        local v51 = math.cos(a1.swingAngle)
        local v52 = math.sin(a1.swingAngle)
        a1.velocityX = ((a1.swingVelocity * a1.ropeLength) * v51) * STICKMAN_HOOK_CONFIG_upv_1.releaseBoost
        a1.velocityY = ((a1.swingVelocity * a1.ropeLength) * v52) * STICKMAN_HOOK_CONFIG_upv_1.releaseBoost
        a1.lastReleasedIndex = a1.swingAnchorIndex
        a1.recatchCooldown = 0.4
        a1.mode = "free"
        a1.spider:onRelease(a1.swingVelocity, a1.swingAngle)
        if v50 > 20 then
            a1.fx:releaseSpray(a1.x, a1.y, a1.velocityX, a1.velocityY)
        end
        if math.abs(a1.swingAngle) >= 0.22 or v50 <= 34 or a1.velocityX <= 0 then
            if v50 > 20 then
                a1.context.audio.play("whoosh", {})
            end
        else
            a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.y + 3.5, 0), "CLEAN!", u9, 0.8)
            a1.fx:cleanSpark(a1.x, a1.y)
            a1.context.audio.play("perfect", {})
            return
        end
    else
        return nil
    end
end
u12.nearestAttachable = function(a1, a2, a3, a4)
    --[[
      name: nearestAttachable
      line: 652
    ]]
    local v53 = nil
    local v54, v53 = a4, v53
    for _, value_3 in a1.anchors do
        if value_3.globalIndex < 0 or value_3.broken then
            continue
        end
        if value_3.globalIndex ~= a1.lastReleasedIndex then
            local v55 = a1:anchorPosition(value_3.globalIndex)
            local v56 = v55.X - a2
            local v57 = v55.Y - a3
            local v58
            v58 = math.sqrt((v56 * v56) + (v57 * v57))
            if v58 < v54 then
                v54, v53 = v58, value_3.globalIndex
            end
        else
            local v58
            if a1.recatchCooldown > 0 then
                continue
            end
            local v55 = a1:anchorPosition(value_3.globalIndex)
            local v56 = v55.X - a2
            local v57 = v55.Y - a3
            v58 = math.sqrt((v56 * v56) + (v57 * v57))
            if v58 < v54 then
                v54, v53 = v58, value_3.globalIndex
            end
        end
    end
    return v53
end
u12.isAnchorInReach = function(a1, a2)
    --[[
      name: isAnchorInReach
      line: 673
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    if a2 == a1.lastReleasedIndex and a1.recatchCooldown > 0 then
        return false
    end
    local v59 = a1:anchorPosition(a2)
    local v60 = v59.X - a1.x
    local v61 = v59.Y - a1.y
    local v62 = math.sqrt((v60 * v60) + (v61 * v61)) <= STICKMAN_HOOK_CONFIG_upv_1.attachRadius
    return v62
end
u12.anchorPosition = function(a1, a2)
    --[[
      name: anchorPosition
      line: 682
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v63 = a1:ensureChain(a2)
    if v63.movingAmplitude <= 0 then
        return Vector2.new(v63.x, v63.y)
    end
    return Vector2.new(v63.x, v63.y + (v63.movingAmplitude * math.sin((a1.simClock * STICKMAN_HOOK_CONFIG_upv_1.movingRate) + v63.movingPhase)))
end
u12.ensureChain = function(a1, a2)
    --[[
      name: ensureChain
      line: 689
      upvalues:
        anchorSpecFor_upv_1 (copy, index: 1)
    ]]
    while true do
        local v64
        if #a1.chain > a2 then
            break
        end
        if #a1.chain <= 0 then
            v64 = nil
        else
            v64 = a1.chain[#a1.chain]
        end
        table.insert(a1.chain, (anchorSpecFor_upv_1(a1.context.getRunSeed(), #a1.chain, v64)))
    end
    return a1.chain[a2 + 1]
end
u12.dressAnchor = function(a1, a2, a3)
    --[[
      name: dressAnchor
      line: 698
      upvalues:
        u7 (copy, index: 1)
        u6 (copy, index: 2)
        u2 (copy, index: 3)
        u3 (copy, index: 4)
    ]]
    local v65 = a1:ensureChain(a3)
    a2.globalIndex = a3
    a2.broken = false
    a2.moving = v65.movingAmplitude > 0
    a2.flash = 0
    local orb_1 = a2.orb
    local v66
    if v65.breakawaySeconds <= 0 then
        if v65.movingAmplitude <= 0 then
            v66 = u2
        else
            v66 = u6
        end
    else
        v66 = u7
    end
    orb_1.Color = v66
    local ring_1 = a2.ring
    if v65.breakawaySeconds <= 0 then
        v66 = u3
    else
        v66 = u7
    end
    ring_1.Color = v66
    local v67 = a1:anchorPosition(a3)
    a1:poseAnchor(a2, v67.X, v67.Y)
end
u12.poseAnchor = function(a1, a2, a3, a4)
    --[[
      name: poseAnchor
      line: 710
      upvalues:
        u8 (copy, index: 1)
        anchorTetherContactY_upv_1 (copy, index: 2)
        anchorTether_upv_1 (copy, index: 3)
        u1 (copy, index: 4)
    ]]
    local origin_1 = a1.stage.origin
    a2.orb.CFrame = CFrame.new(origin_1.X + a3, origin_1.Y + a4, origin_1.Z)
    a2.ring.CFrame = CFrame.new(origin_1.X + a3, origin_1.Y + a4, origin_1.Z - 0.4) * u8
    local v68 = anchorTetherContactY_upv_1(a4)
    local v69 = v68 - a4
    local v70 = origin_1.Z + anchorTether_upv_1
    if v69 >= 3 and v69 <= 24 then
        a2.tetherPatch.CFrame = CFrame.new(origin_1.X + a3, origin_1.Y + v68, v70)
        local v71 = math.sqrt((v69 * v69) + 2.5600000000000005)
        for n_3 = 0, 1 do
            local v72 = ((n_3 ~= 0) and 1) or -1
            local v73
            if n_3 ~= 0 then
                v73 = a2.tetherRight
            else
                v73 = a2.tetherLeft
            end
            if v73.Size.Y ~= v71 then
                v73.Size = Vector3.new(0.13, v71, 0.13)
            end
            v73.CFrame = CFrame.new((origin_1.X + a3) + ((v72 * 1.6) / 2), (origin_1.Y + a4) + (v69 / 2), v70) * CFrame.Angles(0, 0, math.atan2(-v72 * 1.6, v69))
        end
    else
        a2.tetherLeft.CFrame = u1
        a2.tetherRight.CFrame = u1
        local v74
        if v69 >= 3 then
            v74 = a4 + 1.1
        else
            v74 = v68
        end
        a2.tetherPatch.CFrame = CFrame.new(origin_1.X + a3, origin_1.Y + v74, v70)
        return nil
    end
end
u12.breakAnchor = function(a1, a2)
    --[[
      name: breakAnchor
      line: 745
      upvalues:
        u1 (copy, index: 1)
    ]]
    a2.broken = true
    local v75 = a1:anchorPosition(a2.globalIndex)
    a2.orb.CFrame = u1
    a2.ring.CFrame = u1
    a1.fx:anchorBreak(v75.X, v75.Y)
    a1.stage.shake(0.35)
end
u12.updateFloorTarget = function(a1)
    --[[
      name: updateFloorTarget
      line: 753
      upvalues:
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v76 = math.huge
    local v77 = nil
    for _, value_4 in a1.anchors do
        if value_4.globalIndex < 0 then
            continue
        end
        v77 = a1.chain[value_4.globalIndex + 1]
        if v77 == nil then
            continue
        end
        if v77.y < v76 then
            v76 = v77.y
        end
    end
    if v76 == math.huge then
        v76 = 12
    end
    a1.floorTargetY = v76 - STICKMAN_HOOK_CONFIG_upv_1.floorDropStuds
end
u12.die = function(a1)
    --[[
      name: die
      line: 769
      upvalues:
        u10 (copy, index: 1)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 2)
    ]]
    if a1.dead then
        return nil
    else
        a1.dead = true
        a1.renderPrevX = a1.x
        a1.renderPrevY = a1.y
        a1.stage.shake(1)
        a1.spider:setDead(true)
        a1.lava:splash(a1.x, a1.floorY)
        a1.context.audio.play("buzz", {})
        a1.context.audio.play("flameIgnite", {})
        a1.popups:show(a1.stage.origin + Vector3.new(a1.x, a1.floorY + 4, 0), "BURNED!", u10, 1.2)
        local u13 = a1.distance:current()
        local roundToken_upv_1 = a1.roundToken
        task.delay(
            STICKMAN_HOOK_CONFIG_upv_1.endRunDelaySeconds,
            function()
                --[[
                  line: 798
                  upvalues:
                    a1 (copy, index: 1)
                    roundToken_upv_1 (copy, index: 2)
                    u13 (copy, index: 3)
                ]]
                if a1.roundToken ~= roundToken_upv_1 then
                    return
                end
                a1.context.endRun(u13)
            end
        )
    end
end
u12.render = function(a1, a2)
    --[[
      name: render
      line: 804
    ]]
    a1:drawScene(a2)
end
u12.onIdle = function(a1, a2)
    --[[
      name: onIdle
      line: 807
    ]]
    a1:drawScene(a2)
end
u12.drawScene = function(a1, a2)
    --[[
      name: drawScene
      line: 810
      upvalues:
        lerp_upv_1 (copy, index: 1)
        u5 (copy, index: 2)
        u3 (copy, index: 3)
        u4 (copy, index: 4)
        STICKMAN_HOOK_CONFIG_upv_1 (copy, index: 5)
    ]]
    local renderAlpha_1 = a1.renderAlpha
    local v78 = lerp_upv_1(a1.renderPrevX, a1.x, renderAlpha_1)
    local v79 = lerp_upv_1(a1.renderPrevY, a1.y, renderAlpha_1)
    local v80
    if a1.mode == "swinging" then
        v80 = not a1.dead
    else
        v80 = false
        if a1.mode == "waiting" then
            v80 = not a1.dead
        end
    end
    local v81
    if v80 then
        v81 = math.abs(a1.swingVelocity) * a1.ropeLength
    else
        v81 = math.sqrt((a1.velocityX * a1.velocityX) + (a1.velocityY * a1.velocityY))
    end
    local v82
    if v80 then
        v82 = a1:anchorPosition(a1.swingAnchorIndex)
    else
        v82 = Vector2.zero
    end
    local v83 = ((not v80) and 0) or (math.atan2(v78 - v82.X, -(v79 - v82.Y)))
    local v84 = a1.velocityX
    local v85 = a1.velocityY
    if v80 then
        local v86 = ((a1.swingVelocity < 0) and -1) or 1
        v84, v85 = math.cos(a1.swingAngle) * v86, math.sin(a1.swingAngle) * v86
    elseif a1.candidateIndex >= 0 then
        local v87 = a1:anchorPosition(a1.candidateIndex)
        v84, v85 = v87.X - v78, v87.Y - v79
    end
    a1.spider:pose({x = v78, y = v79, anchorX = v82.X, anchorY = v82.Y, ropeAngle = v83, swingAngle = a1.swingAngle, swingVelocity = a1.swingVelocity, ropeLength = a1.ropeLength, velocityX = a1.velocityX, velocityY = a1.velocityY, speed = v81, attached = v80, lookX = v84, lookY = v85, simClock = a1.simClock + (renderAlpha_1 * 0.008333333333333333), deltaTime = a2})
    local v88 = false
    if a1.mode == "free" then
        v88 = not a1.dead
    end
    local v89 = math.min(a2 * 6, 1)
    local v90, v91, v92 = nil, nil, nil
    local v93 = nil
    local v94 = nil
    local value_5 = nil
    local v95 = nil
    for _, value_5 in a1.anchors do
        if value_5.globalIndex < 0 or value_5.broken then
            continue
        end
        if value_5.moving then
            v93 = a1:anchorPosition(value_5.globalIndex)
            a1:poseAnchor(value_5, v93.X, v93.Y)
        end
        v93 = value_5.globalIndex == a1.candidateIndex
        v94 = v88 and (not v93 and (a1:isAnchorInReach(value_5.globalIndex)))
        if v93 then
            v90 = math.sin(a1.simClock * 9) * 0.5 + 4.2
            v91 = 0.1
        elseif v94 then
            v90 = math.sin(a1.simClock * 6) * 0.25 + 3.4
            v91 = 0.36
        else
            v90, v91 = 2.6, 0.68
        end
        if value_5.flash > 0 then
            value_5.flash = value_5.flash - (value_5.flash * v89)
            if value_5.flash < 0.01 then
                value_5.flash = 0
            end
            v90 = v90 + (6 - v90) * value_5.flash
            v91 = v91 + (0.05 - v91) * value_5.flash
        end
        if v93 then
            v92 = u5
        elseif v88 then
            v92 = u3
        else
            v92 = u4
        end
        if value_5.ring.Color ~= v92 and a1.chain[value_5.globalIndex + 1].breakawaySeconds <= 0 then
            value_5.ring.Color = v92
        end
        if math.abs(v90 - value_5.lastRingSize) > 0.004 then
            value_5.lastRingSize = v90
            value_5.ring.Size = Vector3.new(0.14, v90, v90)
        end
        if math.abs(v91 - value_5.lastRingTransparency) > 0.004 then
            value_5.lastRingTransparency = v91
            value_5.ring.Transparency = v91
        end
        v95 = (v93 and 1.9) or 1.6
        if value_5.orb.Size.X ~= v95 then
            value_5.orb.Size = Vector3.new(v95, v95, v95)
        end
    end
    a1.cameraX = a1.cameraX + (((v78 + STICKMAN_HOOK_CONFIG_upv_1.cameraLeadX) - a1.cameraX) * math.min(a2 * STICKMAN_HOOK_CONFIG_upv_1.cameraFollowRateX, 1))
    a1.cameraY = a1.cameraY + (((v79 + STICKMAN_HOOK_CONFIG_upv_1.cameraHeightOffset) - a1.cameraY) * math.min(a2 * STICKMAN_HOOK_CONFIG_upv_1.cameraFollowRateY, 1))
    a1.stage.setFrameCenter(Vector2.new(a1.cameraX, a1.cameraY))
    if a1.stage.camera.FieldOfView ~= STICKMAN_HOOK_CONFIG_upv_1.fieldOfView then
        a1.stage.camera.FieldOfView = STICKMAN_HOOK_CONFIG_upv_1.fieldOfView
    end
    a1.lava:draw(a1.cameraX, a1.floorY, a1.realDelta)
    a1.scenery:draw(a1.cameraX, a1.cameraY)
    a1.fx:update(a1.realDelta)
end
u12.destroy = function(a1)
    --[[
      name: destroy
      line: 933
      upvalues:
        BaseWorldGame_upv_1 (copy, index: 1)
    ]]
    a1.roundToken = a1.roundToken + 1
    a1.spider:destroy()
    BaseWorldGame_upv_1.destroy(a1)
end
local tbl_5 = {}
tbl_5.StickmanHookGame = u12
return tbl_5