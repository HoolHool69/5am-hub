--!strict

--[[
    5AM Hub universal game module

    This package contains only client-local features and does not depend on any
    game-specific remotes. It is loaded as the fallback layer for every place.
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")
local Workspace = game:GetService("Workspace")

local ACCENT = Color3.fromRGB(139, 92, 246)
local activeCleanup: (() -> ())? = nil
local activeWindow: any? = nil

local module = {
    Meta = {
        Name = "Universal",
        DisplayName = "Universal",
        Version = "1.0.0",
        Author = "5AM Hub",
        Universal = true,
        PlaceIds = { "*" },
        Description = "Game-independent movement, ESP, and utility features.",
    },
}

local function Disconnect(connection: RBXScriptConnection?)
    if connection then
        connection:Disconnect()
    end
end

local function SafeSet(instance: any, property: string, value: any): boolean
    return pcall(function()
        instance[property] = value
    end)
end

local function Clamp(value: number, minimum: number, maximum: number): number
    return math.max(minimum, math.min(maximum, value))
end

function module.Init(UI: any, Loader: any)
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
    if activeWindow and activeWindow.Destroy then
        activeWindow:Destroy()
        activeWindow = nil
    end

    local localPlayer = Players.LocalPlayer
    if not localPlayer then
        UI:Notify({
            Title = "5AM Hub",
            Content = "The local player is not available yet.",
            Duration = 6,
        })
        return nil
    end

    local window = UI:CreateWindow({
        Title = "5AM Hub",
        SubTitle = "Universal",
    })

    local environment = if Loader and Loader.Utils and Loader.Utils.GetEnvironment
        then Loader.Utils:GetEnvironment()
        else {}

    local runtime = {
        Destroyed = false,
        Connections = {} :: {RBXScriptConnection},
        HumanoidOriginals = {} :: {[Humanoid]: any},
        FlyConnection = nil :: RBXScriptConnection?,
        NoclipConnection = nil :: RBXScriptConnection?,
        NoclipParts = {} :: {[BasePart]: any},
        AntiAfkConnection = nil :: RBXScriptConnection?,
        EspConnections = {} :: {RBXScriptConnection},
        EspObjects = {} :: {[Player]: any},
        FpsConnections = {} :: {RBXScriptConnection},
        FpsOriginals = {} :: {[Instance]: {[string]: any}},
    }

    local function Notify(title: string, content: string, duration: number?)
        UI:Notify({
            Title = title,
            Content = content,
            Duration = duration or 4,
        })
    end

    local function Track(connection: RBXScriptConnection): RBXScriptConnection
        table.insert(runtime.Connections, connection)
        return connection
    end

    local function Flag(name: string, fallback: any?): any
        local value = UI.Flags:Get(name)
        return if value == nil then fallback else value
    end

    local function CurrentCharacter(): Model?
        return localPlayer.Character
    end

    local function CurrentHumanoid(): Humanoid?
        local character = CurrentCharacter()
        return if character then character:FindFirstChildOfClass("Humanoid") else nil
    end

    local function CurrentRoot(): BasePart?
        local character = CurrentCharacter()
        if not character then
            return nil
        end
        return character:FindFirstChild("HumanoidRootPart") :: BasePart?
    end

    local initialHumanoid = CurrentHumanoid()
    local initialWalkSpeed = Clamp(if initialHumanoid then initialHumanoid.WalkSpeed else 16, 0, 250)
    local initialJumpPower = Clamp(if initialHumanoid then initialHumanoid.JumpPower else 50, 0, 250)
    local initialGravity = Clamp(Workspace.Gravity, 0, 300)
    local originalGravity = Workspace.Gravity

    local function RememberHumanoid(humanoid: Humanoid)
        if runtime.HumanoidOriginals[humanoid] then
            return
        end

        runtime.HumanoidOriginals[humanoid] = {
            WalkSpeed = humanoid.WalkSpeed,
            JumpPower = humanoid.JumpPower,
            UseJumpPower = humanoid.UseJumpPower,
            AutoRotate = humanoid.AutoRotate,
            PlatformStand = humanoid.PlatformStand,
        }
    end

    local function ApplyMovement(humanoid: Humanoid?)
        if not humanoid then
            return
        end

        RememberHumanoid(humanoid)
        local walkSpeed = tonumber(Flag("UniversalWalkSpeed", initialWalkSpeed)) or initialWalkSpeed
        local jumpPower = tonumber(Flag("UniversalJumpPower", initialJumpPower)) or initialJumpPower

        SafeSet(humanoid, "WalkSpeed", walkSpeed)
        SafeSet(humanoid, "UseJumpPower", true)
        SafeSet(humanoid, "JumpPower", jumpPower)
    end

    local function StopFly()
        Disconnect(runtime.FlyConnection)
        runtime.FlyConnection = nil

        local humanoid = CurrentHumanoid()
        local root = CurrentRoot()
        if root then
            SafeSet(root, "AssemblyLinearVelocity", Vector3.zero)
            SafeSet(root, "AssemblyAngularVelocity", Vector3.zero)
        end
        if humanoid then
            local original = runtime.HumanoidOriginals[humanoid]
            SafeSet(humanoid, "PlatformStand", if original then original.PlatformStand else false)
            SafeSet(humanoid, "AutoRotate", if original then original.AutoRotate else true)
        end
    end

    local function StartFly()
        StopFly()
        if runtime.Destroyed then
            return
        end

        runtime.FlyConnection = RunService.RenderStepped:Connect(function()
            if runtime.Destroyed or Flag("UniversalFly", false) ~= true then
                return
            end

            local humanoid = CurrentHumanoid()
            local root = CurrentRoot()
            local camera = Workspace.CurrentCamera
            if not humanoid or not root or not camera or humanoid.Health <= 0 then
                return
            end

            RememberHumanoid(humanoid)
            humanoid.PlatformStand = true
            humanoid.AutoRotate = false

            local direction = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                direction += camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                direction -= camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                direction += camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                direction -= camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                direction += Vector3.yAxis
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
                or UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
            then
                direction -= Vector3.yAxis
            end

            local speed = tonumber(Flag("UniversalFlySpeed", 75)) or 75
            root.AssemblyLinearVelocity = if direction.Magnitude > 0
                then direction.Unit * speed
                else Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero

            local flatLook = Vector3.new(camera.CFrame.LookVector.X, 0, camera.CFrame.LookVector.Z)
            if flatLook.Magnitude > 0.001 then
                root.CFrame = CFrame.lookAt(root.Position, root.Position + flatLook.Unit)
            end
        end)
    end

    local function RestoreNoclipParts()
        for part, original in runtime.NoclipParts do
            if part.Parent then
                SafeSet(part, "CanCollide", original.CanCollide)
            end
        end
        table.clear(runtime.NoclipParts)
    end

    local function StopNoclip()
        Disconnect(runtime.NoclipConnection)
        runtime.NoclipConnection = nil
        RestoreNoclipParts()
    end

    local function StartNoclip()
        StopNoclip()
        if runtime.Destroyed then
            return
        end
        runtime.NoclipConnection = RunService.Stepped:Connect(function()
            if runtime.Destroyed or Flag("UniversalNoclip", false) ~= true then
                return
            end

            local character = CurrentCharacter()
            if not character then
                return
            end

            for _, descendant in character:GetDescendants() do
                if descendant:IsA("BasePart") and descendant.CanCollide then
                    if not runtime.NoclipParts[descendant] then
                        runtime.NoclipParts[descendant] = {
                            CanCollide = descendant.CanCollide,
                        }
                    end
                    descendant.CanCollide = false
                end
            end
        end)
    end

    Track(UserInputService.JumpRequest:Connect(function()
        if runtime.Destroyed or Flag("UniversalInfiniteJump", false) ~= true then
            return
        end

        local humanoid = CurrentHumanoid()
        if humanoid and humanoid.Health > 0 then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end))

    Track(localPlayer.CharacterAdded:Connect(function(character)
        task.defer(function()
            local humanoid = character:WaitForChild("Humanoid", 10)
            if runtime.Destroyed or not humanoid or not humanoid:IsA("Humanoid") then
                return
            end
            ApplyMovement(humanoid)
        end)
    end))

    local function StopAntiAfk()
        Disconnect(runtime.AntiAfkConnection)
        runtime.AntiAfkConnection = nil
    end

    local function StartAntiAfk()
        StopAntiAfk()
        if runtime.Destroyed then
            return
        end
        runtime.AntiAfkConnection = localPlayer.Idled:Connect(function()
            if runtime.Destroyed or Flag("UniversalAntiAfk", false) ~= true then
                return
            end

            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.zero)
            end)
        end)
    end

    local drawingLibrary = environment.Drawing
    local drawingAvailable = type(drawingLibrary) == "table" and type(drawingLibrary.new) == "function"

    local function RemoveDrawing(object: any)
        if not object then
            return
        end
        pcall(function()
            object.Visible = false
            object:Remove()
        end)
    end

    local function RemoveEspRecord(targetPlayer: Player)
        local record = runtime.EspObjects[targetPlayer]
        if not record then
            return
        end

        if record.Mode == "Drawing" then
            RemoveDrawing(record.Box)
            RemoveDrawing(record.Name)
            RemoveDrawing(record.Distance)
        else
            if record.Highlight then
                record.Highlight:Destroy()
            end
            if record.Billboard then
                record.Billboard:Destroy()
            end
        end
        runtime.EspObjects[targetPlayer] = nil
    end

    local function CreateDrawingEsp(): any?
        local ok, record = pcall(function()
            local box = drawingLibrary.new("Square")
            box.Color = ACCENT
            box.Filled = false
            box.Thickness = 1
            box.Transparency = 1
            box.Visible = false

            local nameText = drawingLibrary.new("Text")
            nameText.Center = true
            nameText.Color = Color3.new(1, 1, 1)
            nameText.Outline = true
            nameText.Size = 13
            nameText.Transparency = 1
            nameText.Visible = false

            local distanceText = drawingLibrary.new("Text")
            distanceText.Center = true
            distanceText.Color = Color3.fromRGB(205, 205, 215)
            distanceText.Outline = true
            distanceText.Size = 12
            distanceText.Transparency = 1
            distanceText.Visible = false

            return {
                Mode = "Drawing",
                Box = box,
                Name = nameText,
                Distance = distanceText,
            }
        end)

        return if ok then record else nil
    end

    local function CreateInstanceEsp(): any
        local highlight = Instance.new("Highlight")
        highlight.Name = "FiveAMUniversalESP"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.FillTransparency = 1
        highlight.OutlineColor = ACCENT
        highlight.OutlineTransparency = 0
        highlight.Enabled = false
        highlight.Parent = Workspace

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "FiveAMUniversalESPLabel"
        billboard.AlwaysOnTop = true
        billboard.Enabled = false
        billboard.LightInfluence = 0
        billboard.Size = UDim2.fromOffset(180, 42)
        billboard.StudsOffset = Vector3.new(0, 3.2, 0)
        billboard.Parent = UI.RootGui

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.GothamSemibold
        label.Size = UDim2.fromScale(1, 1)
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextSize = 13
        label.TextStrokeColor3 = Color3.new(0, 0, 0)
        label.TextStrokeTransparency = 0.25
        label.TextWrapped = true
        label.Parent = billboard

        return {
            Mode = "Instance",
            Highlight = highlight,
            Billboard = billboard,
            Label = label,
        }
    end

    local function CreateEspRecord(targetPlayer: Player)
        if targetPlayer == localPlayer or runtime.EspObjects[targetPlayer] then
            return
        end

        local record = if drawingAvailable then CreateDrawingEsp() else nil
        if not record then
            drawingAvailable = false
            record = CreateInstanceEsp()
        end
        runtime.EspObjects[targetPlayer] = record
    end

    local function HideEspRecord(record: any)
        if record.Mode == "Drawing" then
            record.Box.Visible = false
            record.Name.Visible = false
            record.Distance.Visible = false
        else
            record.Highlight.Enabled = false
            record.Billboard.Enabled = false
        end
    end

    local function UpdateEspRecord(targetPlayer: Player, record: any, camera: Camera)
        local character = targetPlayer.Character
        local humanoid = if character then character:FindFirstChildOfClass("Humanoid") else nil
        local root = if character then character:FindFirstChild("HumanoidRootPart") else nil
        local head = if character then character:FindFirstChild("Head") else nil

        if not character or not humanoid or humanoid.Health <= 0 or not root or not head then
            HideEspRecord(record)
            return
        end

        local distance = math.floor((camera.CFrame.Position - (root :: BasePart).Position).Magnitude + 0.5)
        local showBox = Flag("UniversalEspBox", true) ~= false
        local showName = Flag("UniversalEspName", true) ~= false
        local showDistance = Flag("UniversalEspDistance", true) ~= false

        if record.Mode == "Drawing" then
            local rootViewport, rootVisible = camera:WorldToViewportPoint((root :: BasePart).Position)
            local topViewport = camera:WorldToViewportPoint((head :: BasePart).Position + Vector3.new(0, 0.8, 0))
            local bottomViewport = camera:WorldToViewportPoint((root :: BasePart).Position - Vector3.new(0, 3, 0))
            if not rootVisible or rootViewport.Z <= 0 then
                HideEspRecord(record)
                return
            end

            local height = math.max(18, math.abs(bottomViewport.Y - topViewport.Y))
            local width = height * 0.55
            local left = topViewport.X - width / 2
            local top = topViewport.Y

            record.Box.Position = Vector2.new(left, top)
            record.Box.Size = Vector2.new(width, height)
            record.Box.Visible = showBox

            record.Name.Text = targetPlayer.DisplayName
            record.Name.Position = Vector2.new(rootViewport.X, top - 16)
            record.Name.Visible = showName

            record.Distance.Text = string.format("%d studs", distance)
            record.Distance.Position = Vector2.new(rootViewport.X, top + height + 2)
            record.Distance.Visible = showDistance
        else
            record.Highlight.Adornee = character
            record.Highlight.Enabled = showBox
            record.Billboard.Adornee = head

            local lines = {}
            if showName then
                table.insert(lines, targetPlayer.DisplayName)
            end
            if showDistance then
                table.insert(lines, string.format("%d studs", distance))
            end
            record.Label.Text = table.concat(lines, "\n")
            record.Billboard.Enabled = #lines > 0
        end
    end

    local function StopEsp()
        for _, connection in runtime.EspConnections do
            connection:Disconnect()
        end
        table.clear(runtime.EspConnections)

        local playersToRemove = {}
        for targetPlayer in runtime.EspObjects do
            table.insert(playersToRemove, targetPlayer)
        end
        for _, targetPlayer in playersToRemove do
            RemoveEspRecord(targetPlayer)
        end
    end

    local function StartEsp()
        StopEsp()
        if runtime.Destroyed then
            return
        end

        for _, targetPlayer in Players:GetPlayers() do
            CreateEspRecord(targetPlayer)
        end

        table.insert(runtime.EspConnections, Players.PlayerAdded:Connect(CreateEspRecord))
        table.insert(runtime.EspConnections, Players.PlayerRemoving:Connect(RemoveEspRecord))
        table.insert(runtime.EspConnections, RunService.RenderStepped:Connect(function()
            if runtime.Destroyed or Flag("UniversalPlayerEsp", false) ~= true then
                return
            end

            local camera = Workspace.CurrentCamera
            if not camera then
                return
            end

            for targetPlayer, record in runtime.EspObjects do
                UpdateEspRecord(targetPlayer, record, camera)
            end
        end))
    end

    local function RememberAndSet(instance: Instance, property: string, value: any)
        local properties = runtime.FpsOriginals[instance]
        if not properties then
            properties = {}
            runtime.FpsOriginals[instance] = properties
        end
        if properties[property] == nil then
            local ok, original = pcall(function()
                return (instance :: any)[property]
            end)
            if not ok then
                return
            end
            properties[property] = original
        end
        SafeSet(instance, property, value)
    end

    local function ApplyFpsBoostTo(instance: Instance)
        if instance:IsA("BasePart") then
            RememberAndSet(instance, "Material", Enum.Material.Plastic)
            RememberAndSet(instance, "Reflectance", 0)
            RememberAndSet(instance, "CastShadow", false)
        elseif instance:IsA("Decal") or instance:IsA("Texture") then
            RememberAndSet(instance, "Transparency", 1)
        elseif instance:IsA("ParticleEmitter")
            or instance:IsA("Trail")
            or instance:IsA("Beam")
            or instance:IsA("Smoke")
            or instance:IsA("Fire")
            or instance:IsA("Sparkles")
        then
            RememberAndSet(instance, "Enabled", false)
        elseif instance:IsA("PostEffect") then
            RememberAndSet(instance, "Enabled", false)
        end
    end

    local function StopFpsBoost()
        for _, connection in runtime.FpsConnections do
            connection:Disconnect()
        end
        table.clear(runtime.FpsConnections)

        for instance, properties in runtime.FpsOriginals do
            if instance.Parent or instance == Lighting or instance == Workspace.Terrain then
                for property, value in properties do
                    SafeSet(instance, property, value)
                end
            end
        end
        table.clear(runtime.FpsOriginals)
    end

    local function StartFpsBoost()
        StopFpsBoost()
        if runtime.Destroyed then
            return
        end

        RememberAndSet(Lighting, "GlobalShadows", false)
        RememberAndSet(Lighting, "EnvironmentDiffuseScale", 0)
        RememberAndSet(Lighting, "EnvironmentSpecularScale", 0)
        RememberAndSet(Workspace.Terrain, "WaterWaveSize", 0)
        RememberAndSet(Workspace.Terrain, "WaterWaveSpeed", 0)
        RememberAndSet(Workspace.Terrain, "WaterReflectance", 0)

        for _, descendant in Workspace:GetDescendants() do
            ApplyFpsBoostTo(descendant)
        end
        for _, descendant in Lighting:GetDescendants() do
            ApplyFpsBoostTo(descendant)
        end

        table.insert(runtime.FpsConnections, Workspace.DescendantAdded:Connect(ApplyFpsBoostTo))
        table.insert(runtime.FpsConnections, Lighting.DescendantAdded:Connect(ApplyFpsBoostTo))
    end

    local function FetchServerPage(cursor: string?): (any?, string?)
        local url = string.format(
            "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100",
            game.PlaceId
        )
        if cursor and cursor ~= "" then
            url ..= "&cursor=" .. HttpService:UrlEncode(cursor)
        end

        local ok, responseBody = pcall(function()
            return game:HttpGet(url)
        end)

        if not ok then
            local request = environment.request or environment.http_request
            if type(request) ~= "function" and type(environment.syn) == "table" then
                request = environment.syn.request
            end
            if type(request) == "function" then
                ok, responseBody = pcall(function()
                    local response = request({
                        Url = url,
                        Method = "GET",
                    })
                    return response and (response.Body or response.body)
                end)
            end
        end

        if not ok or type(responseBody) ~= "string" then
            return nil, "The executor could not request Roblox's public server list."
        end

        local decodeOk, decoded = pcall(HttpService.JSONDecode, HttpService, responseBody)
        if not decodeOk or type(decoded) ~= "table" or type(decoded.data) ~= "table" then
            return nil, "Roblox returned an invalid server-list response."
        end
        return decoded, nil
    end

    local function ServerHop()
        task.spawn(function()
            Notify("Server Hop", "Searching for an available server...", 3)
            local cursor: string? = nil

            for _ = 1, 10 do
                local page, fetchError = FetchServerPage(cursor)
                if not page then
                    Notify("Server Hop Failed", fetchError or "Unable to fetch servers.", 6)
                    return
                end

                for _, server in page.data or {} do
                    if server.id ~= game.JobId
                        and type(server.playing) == "number"
                        and type(server.maxPlayers) == "number"
                        and server.playing < server.maxPlayers
                    then
                        Notify("Server Hop", "Joining a different server...", 3)
                        local teleportOk, teleportError = pcall(
                            TeleportService.TeleportToPlaceInstance,
                            TeleportService,
                            game.PlaceId,
                            server.id,
                            localPlayer
                        )
                        if not teleportOk then
                            Notify("Server Hop Failed", tostring(teleportError), 6)
                        end
                        return
                    end
                end

                cursor = page.nextPageCursor
                if type(cursor) ~= "string" or cursor == "" then
                    break
                end
            end

            Notify("Server Hop", "No different public server is currently available.", 6)
        end)
    end

    local function Rejoin()
        task.spawn(function()
            Notify("Rejoin", "Rejoining the current server...", 3)
            local ok, teleportError
            if game.JobId ~= "" then
                ok, teleportError = pcall(
                    TeleportService.TeleportToPlaceInstance,
                    TeleportService,
                    game.PlaceId,
                    game.JobId,
                    localPlayer
                )
            else
                ok, teleportError = pcall(TeleportService.Teleport, TeleportService, game.PlaceId, localPlayer)
            end
            if not ok then
                Notify("Rejoin Failed", tostring(teleportError), 6)
            end
        end)
    end

    local movementTab = window:AddTab({ Title = "Player" })
    local movementSection = movementTab:AddSection("Movement")

    movementSection:AddSlider("UniversalFlySpeed", {
        Title = "Fly Speed",
        Min = 10,
        Max = 250,
        Default = 75,
        Increment = 5,
        Suffix = " studs/s",
        Flag = "UniversalFlySpeed",
    })

    movementSection:AddToggle("UniversalFly", {
        Title = "Fly",
        Description = "WASD to move, Space to rise, Ctrl to descend.",
        Default = false,
        Flag = "UniversalFly",
        Callback = function(enabled: boolean)
            if enabled then
                StartFly()
            else
                StopFly()
            end
        end,
    })

    movementSection:AddToggle("UniversalNoclip", {
        Title = "Noclip",
        Description = "Disables collision on the local character.",
        Default = false,
        Flag = "UniversalNoclip",
        Callback = function(enabled: boolean)
            if enabled then
                StartNoclip()
            else
                StopNoclip()
            end
        end,
    })

    movementSection:AddToggle("UniversalInfiniteJump", {
        Title = "Infinite Jump",
        Description = "Allows jumping while airborne.",
        Default = false,
        Flag = "UniversalInfiniteJump",
    })

    local attributesSection = movementTab:AddSection("Character Values")
    attributesSection:AddSlider("UniversalWalkSpeed", {
        Title = "Walkspeed",
        Min = 0,
        Max = 250,
        Default = initialWalkSpeed,
        Increment = 1,
        Flag = "UniversalWalkSpeed",
        Callback = function(value: number)
            local humanoid = CurrentHumanoid()
            if humanoid then
                RememberHumanoid(humanoid)
                SafeSet(humanoid, "WalkSpeed", value)
            end
        end,
    })

    attributesSection:AddSlider("UniversalJumpPower", {
        Title = "Jumppower",
        Min = 0,
        Max = 250,
        Default = initialJumpPower,
        Increment = 1,
        Flag = "UniversalJumpPower",
        Callback = function(value: number)
            local humanoid = CurrentHumanoid()
            if humanoid then
                RememberHumanoid(humanoid)
                SafeSet(humanoid, "UseJumpPower", true)
                SafeSet(humanoid, "JumpPower", value)
            end
        end,
    })

    attributesSection:AddSlider("UniversalGravity", {
        Title = "Gravity",
        Min = 0,
        Max = 300,
        Default = initialGravity,
        Increment = 1,
        Flag = "UniversalGravity",
        Callback = function(value: number)
            SafeSet(Workspace, "Gravity", value)
        end,
    })

    local visualsTab = window:AddTab({ Title = "Visuals" })
    local espSection = visualsTab:AddSection("Player ESP")

    espSection:AddToggle("UniversalEspBox", {
        Title = "Box",
        Default = true,
        Flag = "UniversalEspBox",
    })
    espSection:AddToggle("UniversalEspName", {
        Title = "Name",
        Default = true,
        Flag = "UniversalEspName",
    })
    espSection:AddToggle("UniversalEspDistance", {
        Title = "Distance",
        Default = true,
        Flag = "UniversalEspDistance",
    })
    espSection:AddToggle("UniversalPlayerEsp", {
        Title = "Player ESP",
        Description = "Shows other players through walls using the selected details.",
        Default = false,
        Flag = "UniversalPlayerEsp",
        Callback = function(enabled: boolean)
            if enabled then
                StartEsp()
            else
                StopEsp()
            end
        end,
    })

    local miscTab = window:AddTab({ Title = "Misc" })
    local utilitySection = miscTab:AddSection("Utilities")

    utilitySection:AddToggle("UniversalAntiAfk", {
        Title = "Anti-AFK",
        Description = "Prevents the Roblox idle timeout.",
        Default = false,
        Flag = "UniversalAntiAfk",
        Callback = function(enabled: boolean)
            if enabled then
                StartAntiAfk()
            else
                StopAntiAfk()
            end
        end,
    })

    utilitySection:AddToggle("UniversalFpsBoost", {
        Title = "FPS Boost",
        Description = "Temporarily reduces expensive materials, effects, and shadows.",
        Default = false,
        Flag = "UniversalFpsBoost",
        Callback = function(enabled: boolean)
            if enabled then
                StartFpsBoost()
            else
                StopFpsBoost()
            end
        end,
    })

    local serverSection = miscTab:AddSection("Server")
    serverSection:AddButton({
        Title = "Server Hop",
        Description = "Joins a different non-full public server.",
        Callback = ServerHop,
    })
    serverSection:AddButton({
        Title = "Rejoin",
        Description = "Reconnects to the current server instance.",
        Callback = Rejoin,
    })

    local Cleanup: () -> ()
    Cleanup = function()
        if runtime.Destroyed then
            return
        end
        runtime.Destroyed = true

        StopFly()
        StopNoclip()
        StopAntiAfk()
        StopEsp()
        StopFpsBoost()

        for humanoid, original in runtime.HumanoidOriginals do
            if humanoid.Parent then
                SafeSet(humanoid, "WalkSpeed", original.WalkSpeed)
                SafeSet(humanoid, "JumpPower", original.JumpPower)
                SafeSet(humanoid, "UseJumpPower", original.UseJumpPower)
                SafeSet(humanoid, "AutoRotate", original.AutoRotate)
                SafeSet(humanoid, "PlatformStand", original.PlatformStand)
            end
        end
        table.clear(runtime.HumanoidOriginals)
        SafeSet(Workspace, "Gravity", originalGravity)

        for _, connection in runtime.Connections do
            connection:Disconnect()
        end
        table.clear(runtime.Connections)
    end

    activeCleanup = Cleanup
    activeWindow = window
    Track(window.Instance.Destroying:Connect(function()
        Cleanup()
        if activeCleanup == Cleanup then
            activeCleanup = nil
        end
        if activeWindow == window then
            activeWindow = nil
        end
    end))

    return window
end

function module.Destroy()
    if activeCleanup then
        activeCleanup()
        activeCleanup = nil
    end
    if activeWindow and activeWindow.Destroy then
        activeWindow:Destroy()
        activeWindow = nil
    end
end

return module
