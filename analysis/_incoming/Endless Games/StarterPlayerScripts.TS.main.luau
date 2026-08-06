-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Flamework_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react")
local v2 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "react-roblox")
local Players_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local App_1 = RuntimeLib_1.import(script, script.Parent, "ui", "app").App
print("[OfflineGames] client main: boot")
Flamework_1._addPaths({{"StarterPlayer", "StarterPlayerScripts", "TS", "controllers"}})
Flamework_1.ignite()
print("[OfflineGames] client main: ignited")
local PlayerGui_1 = Players_1.LocalPlayer:WaitForChild("PlayerGui")
v2.createRoot(Instance.new("Folder")):render(v1.createElement(v1.StrictMode, nil, v2.createPortal(v1.createElement(App_1), PlayerGui_1)))