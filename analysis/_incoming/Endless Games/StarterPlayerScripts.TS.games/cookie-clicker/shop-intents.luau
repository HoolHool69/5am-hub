-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local Signal_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "signal").Signal
local tbl_1 = {}
tbl_1.shopIntents = {buyProducer = Signal_1.new(), buyUpgrade = Signal_1.new(), dismissOffline = Signal_1.new(), sleep = Signal_1.new()}
return tbl_1