-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.MATCH_REQUEST_COOLDOWN = 75
tbl_upv_1.MatchTypes = {Quad = "Quad", Duo = "Duo", Solo = "Solo", Trio = "Trio"}
tbl_upv_1.RankSets = {
    {rankIcon = "rbxassetid://18571868115", eloRating = 800, rankName = "Iron", rankColor = Color3.fromRGB(255, 69, 69):ToHex()},
    {rankIcon = "rbxassetid://18571867581", eloRating = 850, rankName = "Bronze", rankColor = Color3.fromRGB(159, 255, 70):ToHex()},
    {rankIcon = "rbxassetid://18571865445", eloRating = 1000, rankName = "Silver", rankColor = Color3.fromRGB(52, 123, 255):ToHex()},
    {rankIcon = "rbxassetid://18571866358", eloRating = 1250, rankName = "Gold", rankColor = Color3.fromRGB(223, 62, 255):ToHex()},
    {rankIcon = "rbxassetid://18571865766", eloRating = 1400, rankName = "Platinum", rankColor = Color3.fromRGB(241, 103, 69):ToHex()},
    {rankIcon = "rbxassetid://18571866711", eloRating = 1700, rankName = "Diamond", rankColor = Color3.fromRGB(253, 225, 67):ToHex()},
    {rankIcon = "rbxassetid://18571866967", eloRating = 2000, rankName = "Challenger", rankColor = Color3.fromRGB(68, 253, 244):ToHex()},
    {rankIcon = "rbxassetid://18571865995", eloRating = 2500, rankName = "Grandmaster", rankColor = Color3.fromRGB(206, 77, 141):ToHex()}
}
function tbl_upv_1.GetRankData(a1)
    --[[
      name: GetRankData
      line: 94
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local RankSets_1 = tbl_upv_1.RankSets
    local v1 = RankSets_1[1]
    for _, value_1 in ipairs(RankSets_1) do
        if value_1.eloRating > a1 then
            break
        else
            v1 = value_1
        end
    end
    return v1
end
function Initialize()
    --[[
      name: Initialize
      line: 112
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    for key_1, value_2 in ipairs(tbl_upv_1.RankSets) do
        value_2.rankIndex = key_1
    end
end
Initialize()
return tbl_upv_1