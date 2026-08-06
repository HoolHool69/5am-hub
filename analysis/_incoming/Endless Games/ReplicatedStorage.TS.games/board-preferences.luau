-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local gameIdCheck_upv_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "games", "game-id").gameIdCheck
local tbl_upv_1 = {}
tbl_upv_1.friendsShown = {}
local tbl_2 = {}
tbl_2.sanitizeBoardPreferences = function(a1)
    --[[
      name: sanitizeBoardPreferences
      line: 46
      upvalues:
        tbl_upv_1 (copy, index: 1)
        gameIdCheck_upv_1 (copy, index: 2)
    ]]
    if a1 ~= nil then
        local v1 = ((a1.hudTab == "friends") and "friends") or (((a1.hudTab == "top200") and "top200") or nil)
        local tbl_3 = {}
        local tbl_4 = {}
        for _, value_1 in a1.friendsShown do
            if #tbl_3 >= 64 then
                break
            end
            if tbl_4[value_1] ~= nil then
                continue
            end
            if value_1 == "coins" or gameIdCheck_upv_1(value_1) then
                tbl_4[value_1] = true
                table.insert(tbl_3, value_1)
            end
        end
        local tbl_5 = {}
        tbl_5.hudTab = v1
        tbl_5.friendsShown = tbl_3
        return tbl_5
    end
    return tbl_upv_1
end
tbl_2.DEFAULT_BOARD_PREFERENCES = tbl_upv_1
return tbl_2