-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.TenureCutoffs = table.freeze({Year2025End = 1767225600, LaunchMonthEnd = 1703047500, ManFaceCutoff = 1712031876, Year2024End = 1735689600})
tbl_upv_1.Windows = table.freeze(
    {
        FruitUgc2 = table.freeze({EndUnix = 1703047500, StartUnix = 1700455500, Label = "Melon Berry Glasses"}),
        FreshCutGlasses = table.freeze({EndUnix = 0, StartUnix = 1705104000, Label = "FreshCut Glasses"}),
        Valentines = table.freeze({EndUnix = 1708365600, StartUnix = 1707886800, Label = "Valentines 2024"}),
        ZENNIxFreshCut = table.freeze({EndUnix = 1717779600, StartUnix = 1717174800, Label = "ZENNI x FreshCut"}),
        TheGames = table.freeze({EndUnix = 1723402800, StartUnix = 1722528000, Label = "THE GAMES"}),
        MedalxWMG = table.freeze({EndUnix = 1731873600, StartUnix = 1731268800, Label = "Medal x WMG"})
    }
)
tbl_upv_1.UgcEventIds = table.freeze({Launch = "FruitUgc2", Zenni = "ZENNIxFreshCut", Medal = "MedalxWMG", FreshCut = "FreshCutGlasses"})
tbl_upv_1.UgcTaskTypes = table.freeze({DuelWins = "GetDuelWins", ConnectToMedal = "ConnectToMedal", Score2000 = "Get2000Score", ClickButton = "ClickButton"})
tbl_upv_1.TheGamesQuestKeys = table.freeze({"THE_GAMES_QUEST_1", "THE_GAMES_QUEST_2", "THE_GAMES_QUEST_3"})
tbl_upv_1.EraSkinPacks = table.freeze({Valentines = "Valentines24", Zenni = "Zenni", ManFace = "ManFace", TheGames = "TheGamesSkin"})
tbl_upv_1.EraBadgeIds = table.freeze({Medal = 2409847140247664, Zenni = 2977951287610323})
tbl_upv_1.PreImportFields = table.freeze({"UsedCodes", "FreshCutUsed"})
function tbl_upv_1.DescribeWindow(a1)
    --[[
      name: DescribeWindow
      line: 122
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local v1 = tbl_upv_1.Windows[a1]
    if v1 then
        if v1.EndUnix > 0 then
            return (("%* (%* to %*)"):format(v1.Label, os.date("!%Y-%m-%d", v1.StartUnix), os.date("!%Y-%m-%d", v1.EndUnix)))
        end
        return (("%* (from %*)"):format(v1.Label, os.date("!%Y-%m-%d", v1.StartUnix)))
    end
    warn((("[EraCalendar] no window named \"%*\", nothing to describe"):format(tostring(a1))))
    return (tostring(a1))
end
return tbl_upv_1