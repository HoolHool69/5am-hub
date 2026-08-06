-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.chooseBoardTab = function(a1)
    --[[
      name: chooseBoardTab
      line: 31
    ]]
    if a1.friendCount > 0 then
        if a1.override == nil then
            if a1.friendCount > 5 then
                if a1.isTopOfFriends and a1.alreadyShownWhileTop then
                    return "top200"
                end
                return "friends"
            end
            return "top200"
        end
        return a1.override
    end
    return "top200"
end
return tbl_1