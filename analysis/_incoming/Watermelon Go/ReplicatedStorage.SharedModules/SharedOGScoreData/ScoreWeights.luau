-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local EraCalendar_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("SharedModules"):WaitForChild("SharedOGScoreData"):WaitForChild("EraCalendar"))
tbl_1.Tenure = {
    {Key = "LaunchMonth", Label = "Launch cohort", Points = 40, Detail = "First joined before the launch UGC event closed, 2023-12-20", JoinedBeforeUnix = EraCalendar_1.TenureCutoffs.LaunchMonthEnd},
    {Key = "ManFaceEra", Label = "ManFace era", Points = 30, Detail = "First joined before the free ManFace grant ended, 2024-04-02", JoinedBeforeUnix = EraCalendar_1.TenureCutoffs.ManFaceCutoff},
    {Key = "Year2024", Label = "Joined in 2024", Points = 20, Detail = "First joined at some point during 2024", JoinedBeforeUnix = EraCalendar_1.TenureCutoffs.Year2024End},
    {Key = "Year2025", Label = "Joined in 2025", Points = 10, Detail = "First joined at some point during 2025", JoinedBeforeUnix = EraCalendar_1.TenureCutoffs.Year2025End}
}
tbl_1.Era = {
    LaunchEvent = {Points = 25, Detail = "Melon Berry Glasses task progress, earnable only in Nov and Dec 2023", Label = "Launch event"},
    FreshCutEra = {Points = 10, Detail = "A pre-import code fingerprint, or FreshCut Glasses task progress", Label = "FreshCut campaign"},
    Valentines = {Points = 15, Detail = "Dueled a friend in-window, or owns the unbuyable Valentines24 pack", Label = "Valentines 2024"},
    Zenni = {Points = 15, Detail = "Owns the Zenni pack, has its duel-wins progress, or holds its badge", Label = "ZENNI x FreshCut"},
    TheGamesQuest = {Detail = "Per quest claimed during the Roblox Summer Games, three existed", Points = 5, MaxRepeats = 3, Label = "THE GAMES quest"},
    TheGamesItem = {Detail = "Per hidden item found in-window, five existed and none can be found now", Points = 2, MaxRepeats = 5, Label = "THE GAMES shine"},
    TheGamesSkin = {Points = 5, Detail = "Owns TheGamesSkin, granted to anyone who played during the event", Label = "THE GAMES skin"},
    Medal = {Points = 10, Detail = "Connected a verified Medal account, or holds the event badge", Label = "Medal x WMG"},
    PreImport = {Points = 10, Detail = "Carries a fingerprint only the pre-import game ever wrote", Label = "Pre-2024 player"}
}
local tbl_2 = {Detail = "Their highest score ever, from any gamemode", Label = "All-time best score"}
tbl_2.Bands = {{AtLeast = 1000, Points = 5}, {AtLeast = 2000, Points = 10}, {AtLeast = 3500, Points = 15}}
local tbl_3 = {Detail = "Wins plus losses across public and ranked duels", Label = "Duels played"}
tbl_3.Bands = {{AtLeast = 10, Points = 5}}
local tbl_4 = {Detail = "Days between their first join and their most recent save", Label = "Account lifespan"}
tbl_4.Bands = {{AtLeast = 180, Points = 5}}
tbl_1.Intensity = {Sessions = {Detail = "Profile session loads. Inflated by duel teleports, so banded coarsely", Label = "Lifetime sessions", Bands = {{AtLeast = 25, Points = 5}, {AtLeast = 100, Points = 10}, {AtLeast = 300, Points = 15}}}, BestScore = tbl_2, Duels = tbl_3, Lifespan = tbl_4}
tbl_1.IntensityCap = 40
local tbl_5 = {Detail = "Ever bought a donation product", Label = "Donated"}
tbl_5.Bands = {{AtLeast = 1, Points = 4}}
local tbl_6 = {Detail = "Distinct skin packs owned, however they were obtained", Label = "Skin pack breadth"}
tbl_6.Bands = {{AtLeast = 5, Points = 4}}
tbl_1.Supporter = {RobuxSpent = {Detail = "Summed across every non-gift receipt in the purchase ledger", Label = "Robux spent", Bands = {{AtLeast = 100, Points = 4}, {AtLeast = 500, Points = 8}, {AtLeast = 2000, Points = 12}}}, Donations = tbl_5, PacksOwned = tbl_6}
tbl_1.SupporterCap = 20
return tbl_1