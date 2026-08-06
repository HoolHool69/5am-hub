-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Reflect_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local Controller_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local subscribe_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "charm", "src").subscribe
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local ContextActionService_upv_1 = v1.ContextActionService
local Players_upv_1 = v1.Players
local UserInputService_upv_1 = v1.UserInputService
local Workspace_upv_1 = v1.Workspace
local WorldFreezer_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "common", "world-freezer").WorldFreezer
local WorldUiSweep_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "games", "common", "world-ui-sweep").WorldUiSweep
local Freecam_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "photo", "freecam").Freecam
local ObjectTool_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "photo", "object-tool").ObjectTool
local v2 = RuntimeLib_1.import(script, script.Parent.Parent, "photo", "photo-panel")
local PHOTO_FOV_MAX_upv_1 = v2.PHOTO_FOV_MAX
local PHOTO_FOV_MIN_upv_1 = v2.PHOTO_FOV_MIN
local PhotoPanel_upv_1 = v2.PhotoPanel
local sessionAtom_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "atoms").sessionAtom
local readLocalProfile_upv_1 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "daily-data").readLocalProfile
local v3 = RuntimeLib_1.import(script, script.Parent.Parent, "store", "ui-atoms")
local gameFrozenAtom_upv_1 = v3.gameFrozenAtom
local hudHiddenAtom_upv_1 = v3.hudHiddenAtom
local pausedAtom_upv_1 = v3.pausedAtom
local photoFovAtom_upv_1 = v3.photoFovAtom
local photoFreecamAtom_upv_1 = v3.photoFreecamAtom
local photoModeAtom_upv_1 = v3.photoModeAtom
local photoPanelHiddenAtom_upv_1 = v3.photoPanelHiddenAtom
local photoToolAtom_upv_1 = v3.photoToolAtom
local photoTrailAtom_upv_1 = v3.photoTrailAtom
local pushToast_upv_1 = v3.pushToast
local v4 = RuntimeLib_1.import(script, script.Parent.Parent, "ui", "layout", "input-glyphs")
local PHOTO_MODE_KEY_upv_1 = v4.PHOTO_MODE_KEY
local PHOTO_PANEL_KEY_upv_1 = v4.PHOTO_PANEL_KEY
local canUsePhotoMode_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "photo-mode").canUsePhotoMode
local tbl_upv_1 = {PHOTO_MODE_KEY_upv_1, PHOTO_PANEL_KEY_upv_1, Enum.KeyCode.P, Enum.KeyCode.K, Enum.KeyCode.F, Enum.KeyCode.C, Enum.KeyCode.G, Enum.KeyCode.R, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Q, Enum.KeyCode.E, Enum.KeyCode.Space, Enum.KeyCode.LeftShift, Enum.KeyCode.LeftAlt}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.__tostring = function()
    --[[
      name: __tostring
      line: 93
    ]]
    return "PhotoModeController"
end
local u1 = setmetatable(tbl_2, tbl_3)
u1.__index = u1
u1.new = function(...)
    --[[
      name: new
      line: 98
      upvalues:
        u1 (ref, index: 1)
    ]]
    local v5 = setmetatable({}, u1)
    return v5:constructor(...) or v5
end
u1.constructor = function(a1, a2, a3)
    --[[
      name: constructor
      line: 102
      upvalues:
        WorldFreezer_upv_1 (copy, index: 1)
        WorldUiSweep_upv_1 (copy, index: 2)
        Freecam_upv_1 (copy, index: 3)
    ]]
    a1.input = a2
    a1.session = a3
    a1.freezer = WorldFreezer_upv_1.new()
    a1.sweep = WorldUiSweep_upv_1.new()
    a1.freecam = Freecam_upv_1.new()
    a1.variants = {}
    a1.open = false
    a1.openConnections = {}
end
u1.onStart = function(a1)
    --[[
      name: onStart
      line: 112
      upvalues:
        subscribe_upv_1 (copy, index: 1)
        gameFrozenAtom_upv_1 (copy, index: 2)
        hudHiddenAtom_upv_1 (copy, index: 3)
        photoModeAtom_upv_1 (copy, index: 4)
        sessionAtom_upv_1 (copy, index: 5)
        UserInputService_upv_1 (copy, index: 6)
    ]]
    subscribe_upv_1(
        gameFrozenAtom_upv_1,
        function(a2)
            --[[
              line: 115
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.freezer:setFrozen(a2)
        end
    )
    subscribe_upv_1(
        hudHiddenAtom_upv_1,
        function(a3)
            --[[
              line: 118
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.sweep:setHidden(a3)
        end
    )
    subscribe_upv_1(
        photoModeAtom_upv_1,
        function(a4)
            --[[
              line: 121
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onModeChanged(a4)
        end
    )
    subscribe_upv_1(
        sessionAtom_upv_1,
        function(a5)
            --[[
              line: 126
              upvalues:
                photoModeAtom_upv_1 (copy, index: 1)
                a1 (copy, index: 2)
                hudHiddenAtom_upv_1 (copy, index: 3)
                gameFrozenAtom_upv_1 (copy, index: 4)
            ]]
            if photoModeAtom_upv_1() and not (a1:isEligible()) then
                photoModeAtom_upv_1(
                    function()
                        --[[
                          line: 128
                        ]]
                        return false
                    end
                )
            end
            if a5 == nil then
                if hudHiddenAtom_upv_1() then
                    hudHiddenAtom_upv_1(
                        function()
                            --[[
                              line: 137
                            ]]
                            return false
                        end
                    )
                end
                if gameFrozenAtom_upv_1() then
                    gameFrozenAtom_upv_1(
                        function()
                            --[[
                              line: 142
                            ]]
                            return false
                        end
                    )
                end
            else
                return nil
            end
        end
    )
    UserInputService_upv_1.InputBegan:Connect(
        function(a6, a7)
            --[[
              line: 147
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputBegan(a6, a7)
        end
    )
    UserInputService_upv_1.InputChanged:Connect(
        function(a8, a9)
            --[[
              line: 150
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onInputChanged(a8, a9)
        end
    )
end
u1.isEligible = function(a1)
    --[[
      name: isEligible
      line: 154
      upvalues:
        sessionAtom_upv_1 (copy, index: 1)
        Players_upv_1 (copy, index: 2)
        readLocalProfile_upv_1 (copy, index: 3)
        canUsePhotoMode_upv_1 (copy, index: 4)
    ]]
    local v6 = sessionAtom_upv_1()
    if v6 ~= nil then
        local v7 = nil
        if v6.mode == "regular" then
            local UserId_1 = Players_upv_1.LocalPlayer.UserId
            v7 = readLocalProfile_upv_1()
            if v7 ~= nil then
                v7 = v7.photoAccess
            end
            local v8
            if v7 == true then
                v8 = true
            else
                v8 = false
            end
            return canUsePhotoMode_upv_1(UserId_1, v8)
        end
    end
    return false
end
u1.onInputBegan = function(a1, a2, a3)
    --[[
      name: onInputBegan
      line: 170
      upvalues:
        photoModeAtom_upv_1 (copy, index: 1)
        PHOTO_MODE_KEY_upv_1 (copy, index: 2)
    ]]
    if not (a3) and not (photoModeAtom_upv_1()) then
        if a2.KeyCode == PHOTO_MODE_KEY_upv_1 and a1:isEligible() then
            photoModeAtom_upv_1(
                function()
                    --[[
                      line: 177
                    ]]
                    return true
                end
            )
            return
        end
        return nil
    end
    return nil
end
u1.bindKeys = function(a1)
    --[[
      name: bindKeys
      line: 181
      upvalues:
        tbl_upv_1 (copy, index: 1)
        ContextActionService_upv_1 (copy, index: 2)
    ]]
    local tbl_4 = {}
    for _, value_1 in tbl_upv_1 do
        table.insert(tbl_4, value_1)
    end
    local v9 = nil
    for _, value_2 in a1.variants do
        v9 = value_2.hotkey
        if v9 == nil then
            continue
        end
        if table.find(tbl_4, v9) == nil then
            table.insert(tbl_4, v9)
        end
    end
    ContextActionService_upv_1:BindActionAtPriority(
        "PhotoModeKeys",
        function(a2, a3, a4)
            --[[
              line: 194
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1:onPhotoKey(a3, a4)
        end,
        false,
        3000,
        unpack(tbl_4)
    )
end
u1.onPhotoKey = function(a1, a2, a3)
    --[[
      name: onPhotoKey
      line: 198
      upvalues:
        PHOTO_MODE_KEY_upv_1 (copy, index: 1)
        photoModeAtom_upv_1 (copy, index: 2)
        PHOTO_PANEL_KEY_upv_1 (copy, index: 3)
        photoPanelHiddenAtom_upv_1 (copy, index: 4)
        hudHiddenAtom_upv_1 (copy, index: 5)
        gameFrozenAtom_upv_1 (copy, index: 6)
        photoFreecamAtom_upv_1 (copy, index: 7)
        photoToolAtom_upv_1 (copy, index: 8)
    ]]
    local v10 = nil
    if a2 == Enum.UserInputState.Begin then
        v10 = a3.KeyCode
        if v10 == PHOTO_MODE_KEY_upv_1 then
            photoModeAtom_upv_1(
                function()
                    --[[
                      line: 208
                    ]]
                    return false
                end
            )
        elseif v10 == PHOTO_PANEL_KEY_upv_1 then
            photoPanelHiddenAtom_upv_1(
                function()
                    --[[
                      line: 212
                      upvalues:
                        photoPanelHiddenAtom_upv_1 (copy, index: 1)
                    ]]
                    return not photoPanelHiddenAtom_upv_1()
                end
            )
        elseif v10 == Enum.KeyCode.K then
            hudHiddenAtom_upv_1(
                function()
                    --[[
                      line: 216
                      upvalues:
                        hudHiddenAtom_upv_1 (copy, index: 1)
                    ]]
                    return not hudHiddenAtom_upv_1()
                end
            )
        elseif v10 == Enum.KeyCode.F then
            gameFrozenAtom_upv_1(
                function()
                    --[[
                      line: 220
                      upvalues:
                        gameFrozenAtom_upv_1 (copy, index: 1)
                    ]]
                    return not gameFrozenAtom_upv_1()
                end
            )
        elseif v10 == Enum.KeyCode.C then
            photoFreecamAtom_upv_1(
                function()
                    --[[
                      line: 224
                      upvalues:
                        photoFreecamAtom_upv_1 (copy, index: 1)
                    ]]
                    return not photoFreecamAtom_upv_1()
                end
            )
        elseif v10 == Enum.KeyCode.G then
            photoToolAtom_upv_1(
                function(a4)
                    --[[
                      line: 228
                    ]]
                    if a4 ~= "move" then
                        return "move"
                    end
                    return "none"
                end
            )
        elseif v10 ~= Enum.KeyCode.R then
            a1:stepVariantByKey(v10)
        else
            photoToolAtom_upv_1(
                function(a5)
                    --[[
                      line: 232
                    ]]
                    if a5 ~= "rotate" then
                        return "rotate"
                    end
                    return "none"
                end
            )
        end
    end
    return Enum.ContextActionResult.Sink
end
u1.stepVariantByKey = function(a1, a2)
    --[[
      name: stepVariantByKey
      line: 240
    ]]
    for n_1 = 0, #a1.variants - 1 do
        local v11
        if a1.variants[n_1 + 1].hotkey ~= a2 then
            continue
        end
        v11 = a1.panel
        if v11 ~= nil then
            v11:stepVariant(n_1, 1)
        end
        return nil
    end
end
u1.onInputChanged = function(a1, a2, a3)
    --[[
      name: onInputChanged
      line: 251
      upvalues:
        photoModeAtom_upv_1 (copy, index: 1)
        photoFovAtom_upv_1 (copy, index: 2)
        PHOTO_FOV_MIN_upv_1 (copy, index: 3)
        PHOTO_FOV_MAX_upv_1 (copy, index: 4)
        photoToolAtom_upv_1 (copy, index: 5)
    ]]
    if photoModeAtom_upv_1() and not (a3) then
        if a2.UserInputType ~= Enum.UserInputType.MouseWheel then
            if a2.UserInputType == Enum.UserInputType.Touch and a1.freecam:isActive() and photoToolAtom_upv_1() == "none" then
                a1.freecam:addLook(Vector2.new(a2.Delta.X, a2.Delta.Y))
            end
            return
        else
            local u2 = a2.Position.Z * -2
            photoFovAtom_upv_1(
                function(a4)
                    --[[
                      line: 258
                      upvalues:
                        u2 (copy, index: 1)
                        PHOTO_FOV_MIN_upv_1 (copy, index: 2)
                        PHOTO_FOV_MAX_upv_1 (copy, index: 3)
                    ]]
                    return (math.clamp(a4 + u2, PHOTO_FOV_MIN_upv_1, PHOTO_FOV_MAX_upv_1))
                end
            )
            return nil
        end
    end
    return nil
end
u1.onModeChanged = function(a1, a2)
    --[[
      name: onModeChanged
      line: 269
      upvalues:
        photoModeAtom_upv_1 (copy, index: 1)
    ]]
    if a2 == a1.open then
        return nil
    elseif a2 then
        if a1:isEligible() then
            a1.open = true
            a1:enter()
        else
            photoModeAtom_upv_1(
                function()
                    --[[
                      line: 277
                    ]]
                    return false
                end
            )
            return nil
        end
    else
        a1.open = false
        a1:exit()
    end
end
u1.enter = function(a1)
    --[[
      name: enter
      line: 289
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        photoFovAtom_upv_1 (copy, index: 2)
        PHOTO_FOV_MIN_upv_1 (copy, index: 3)
        PHOTO_FOV_MAX_upv_1 (copy, index: 4)
        gameFrozenAtom_upv_1 (copy, index: 5)
        hudHiddenAtom_upv_1 (copy, index: 6)
        photoToolAtom_upv_1 (copy, index: 7)
        photoFreecamAtom_upv_1 (copy, index: 8)
        photoPanelHiddenAtom_upv_1 (copy, index: 9)
        photoTrailAtom_upv_1 (copy, index: 10)
        ObjectTool_upv_1 (copy, index: 11)
        PhotoPanel_upv_1 (copy, index: 12)
        photoModeAtom_upv_1 (copy, index: 13)
        subscribe_upv_1 (copy, index: 14)
        pushToast_upv_1 (copy, index: 15)
    ]]
    a1.session:voidRunForPhotoMode()
    local CurrentCamera_1 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_1 ~= nil then
        CurrentCamera_1 = CurrentCamera_1.FieldOfView
    end
    a1.restoreFov = CurrentCamera_1
    photoFovAtom_upv_1(
        function()
            --[[
              line: 297
              upvalues:
                a1 (copy, index: 1)
                PHOTO_FOV_MIN_upv_1 (copy, index: 2)
                PHOTO_FOV_MAX_upv_1 (copy, index: 3)
            ]]
            local v12 = a1.restoreFov
            if v12 == nil then
                v12 = PHOTO_FOV_MIN_upv_1
            end
            return (math.clamp(v12, PHOTO_FOV_MIN_upv_1, PHOTO_FOV_MAX_upv_1))
        end
    )
    a1.input:setInputEnabled(false)
    local v13 = math.min(a1.freezer:setTrailHold(true), 0.5)
    if v13 > 0 then
        task.delay(
            v13,
            function()
                --[[
                  line: 316
                  upvalues:
                    a1 (copy, index: 1)
                    gameFrozenAtom_upv_1 (copy, index: 2)
                ]]
                if not a1.open then
                    return
                end
                gameFrozenAtom_upv_1(
                    function()
                        --[[
                          line: 318
                        ]]
                        return true
                    end
                )
            end
        )
    else
        gameFrozenAtom_upv_1(
            function()
                --[[
                  line: 312
                ]]
                return true
            end
        )
    end
    hudHiddenAtom_upv_1(
        function()
            --[[
              line: 324
            ]]
            return true
        end
    )
    photoToolAtom_upv_1(
        function()
            --[[
              line: 327
            ]]
            return "none"
        end
    )
    photoFreecamAtom_upv_1(
        function()
            --[[
              line: 330
            ]]
            return false
        end
    )
    photoPanelHiddenAtom_upv_1(
        function()
            --[[
              line: 333
            ]]
            return false
        end
    )
    photoTrailAtom_upv_1(
        function()
            --[[
              line: 336
            ]]
            return 1
        end
    )
    a1.variants = a1.session:photoVariants()
    a1:bindKeys()
    a1.objectTool = ObjectTool_upv_1.new(
        function(a2)
            --[[
              line: 343
              upvalues:
                a1 (copy, index: 1)
            ]]
            return a1.freezer:rebaseHold(a2)
        end
    )
    local tbl_5 = {}
    tbl_5.onExit = function()
        --[[
          name: onExit
          line: 347
          upvalues:
            photoModeAtom_upv_1 (copy, index: 1)
        ]]
        return photoModeAtom_upv_1(
            function()
                --[[
                  line: 348
                ]]
                return false
            end
        )
    end
    tbl_5.onStick = function(a3, a4)
        --[[
          name: onStick
          line: 352
          upvalues:
            a1 (copy, index: 1)
        ]]
        return a1.freecam:setExternalMove(a3, a4)
    end
    tbl_5.variants = a1.variants
    a1.panel = PhotoPanel_upv_1.new(tbl_5)
    table.insert(
        a1.openConnections,
        (subscribe_upv_1(
            photoFreecamAtom_upv_1,
            function(a5)
                --[[
                  line: 358
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:setFreecam(a5)
            end
        ))
    )
    table.insert(
        a1.openConnections,
        (subscribe_upv_1(
            photoFovAtom_upv_1,
            function(a6)
                --[[
                  line: 363
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1:applyFov(a6)
            end
        ))
    )
    table.insert(
        a1.openConnections,
        (subscribe_upv_1(
            photoTrailAtom_upv_1,
            function(a7)
                --[[
                  line: 368
                  upvalues:
                    a1 (copy, index: 1)
                ]]
                return a1.freezer:setTrailScale(a7)
            end
        ))
    )
    table.insert(
        a1.openConnections,
        (subscribe_upv_1(
            gameFrozenAtom_upv_1,
            function(a8)
                --[[
                  line: 374
                  upvalues:
                    photoFreecamAtom_upv_1 (copy, index: 1)
                ]]
                if (a8) or not photoFreecamAtom_upv_1() then
                    return
                end
                photoFreecamAtom_upv_1(
                    function()
                        --[[
                          line: 376
                        ]]
                        return false
                    end
                )
            end
        ))
    )
    pushToast_upv_1("Photo mode \226\128\148 this run no longer counts.")
end
u1.exit = function(a1)
    --[[
      name: exit
      line: 384
      upvalues:
        ContextActionService_upv_1 (copy, index: 1)
        photoFreecamAtom_upv_1 (copy, index: 2)
        photoToolAtom_upv_1 (copy, index: 3)
        photoPanelHiddenAtom_upv_1 (copy, index: 4)
        Workspace_upv_1 (copy, index: 5)
        gameFrozenAtom_upv_1 (copy, index: 6)
        hudHiddenAtom_upv_1 (copy, index: 7)
        sessionAtom_upv_1 (copy, index: 8)
        pausedAtom_upv_1 (copy, index: 9)
    ]]
    ContextActionService_upv_1:UnbindAction("PhotoModeKeys")
    for _, value_3 in a1.openConnections do
        value_3()
    end
    table.clear(a1.openConnections)
    a1:setFreecam(false)
    photoFreecamAtom_upv_1(
        function()
            --[[
              line: 391
            ]]
            return false
        end
    )
    photoToolAtom_upv_1(
        function()
            --[[
              line: 394
            ]]
            return "none"
        end
    )
    photoPanelHiddenAtom_upv_1(
        function()
            --[[
              line: 397
            ]]
            return false
        end
    )
    local objectTool_1 = a1.objectTool
    if objectTool_1 ~= nil then
        objectTool_1:destroy()
    end
    a1.objectTool = nil
    for _, v14 in a1.variants do
        v14.setPinnedIndex(nil)
    end
    a1.variants = {}
    a1.freezer:setTrailHold(false)
    local panel_1 = a1.panel
    if panel_1 ~= nil then
        panel_1:destroy()
    end
    a1.panel = nil
    local CurrentCamera_2 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_2 ~= nil and a1.restoreFov ~= nil then
        CurrentCamera_2.FieldOfView = a1.restoreFov
    end
    a1.restoreFov = nil
    gameFrozenAtom_upv_1(
        function()
            --[[
              line: 425
            ]]
            return false
        end
    )
    hudHiddenAtom_upv_1(
        function()
            --[[
              line: 428
            ]]
            return false
        end
    )
    local v15 = sessionAtom_upv_1()
    local input_1 = a1.input
    local v14
    if v15 == nil then
        v14 = v15
    else
        v14 = v15.phase
    end
    local v16
    if v14 == "playing" then
        v16 = true
    else
        v16 = false
    end
    if v16 then
        v16 = not pausedAtom_upv_1()
    end
    input_1:setInputEnabled(v16)
end
u1.setFreecam = function(a1, a2)
    --[[
      name: setFreecam
      line: 445
      upvalues:
        gameFrozenAtom_upv_1 (copy, index: 1)
        photoFovAtom_upv_1 (copy, index: 2)
    ]]
    if a2 then
        gameFrozenAtom_upv_1(
            function()
                --[[
                  line: 449
                ]]
                return true
            end
        )
        a1.freecam:start()
        a1:applyFov(photoFovAtom_upv_1())
    else
        a1.freecam:stop()
    end
end
u1.applyFov = function(a1, a2)
    --[[
      name: applyFov
      line: 458
      upvalues:
        Workspace_upv_1 (copy, index: 1)
        PHOTO_FOV_MIN_upv_1 (copy, index: 2)
        PHOTO_FOV_MAX_upv_1 (copy, index: 3)
    ]]
    local CurrentCamera_3 = Workspace_upv_1.CurrentCamera
    if CurrentCamera_3 ~= nil then
        CurrentCamera_3.FieldOfView = math.clamp(a2, PHOTO_FOV_MIN_upv_1, PHOTO_FOV_MAX_upv_1)
    else
        return nil
    end
end
Reflect_1.defineMetadata(u1, "identifier", "client/controllers/photo-mode-controller@PhotoModeController")
Reflect_1.defineMetadata(u1, "flamework:parameters", {"client/controllers/input-controller@InputController", "client/controllers/game-session-controller@GameSessionController"})
Reflect_1.defineMetadata(u1, "flamework:implements", {"$:flamework@OnStart"})
Reflect_1.decorate(u1, "$:flamework@Controller", Controller_1, {})
local tbl_6 = {}
tbl_6.PhotoModeController = u1
return tbl_6