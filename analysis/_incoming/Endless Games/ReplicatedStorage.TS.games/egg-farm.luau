-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local t_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local tbl_1 = {}
tbl_1.version = t_1.integer
tbl_1.eggs = t_1.number
tbl_1.lifetime = t_1.number
tbl_1.clicks = t_1.integer
tbl_1.goldens = t_1.integer
tbl_1.producers = t_1.array(t_1.integer)
tbl_1.upgrades = t_1.array(t_1.integer)
tbl_1.trophies = t_1.array(t_1.integer)
tbl_1.lastSeenUnix = t_1.integer
local v1 = t_1.interface(tbl_1)
local tbl_2 = {}
tbl_2.isSaneEggFarm = function(a1)
    --[[
      name: isSaneEggFarm
      line: 36
    ]]
    for _, value_1 in {a1.eggs, a1.lifetime, a1.clicks, a1.goldens, a1.lastSeenUnix} do
        if value_1 == value_1 and value_1 ~= math.huge and value_1 >= 0 then
            continue
        end
        return false
    end
    if #a1.producers <= 16 then
        for _, value_2 in a1.producers do
            if value_2 < 0 or value_2 > 1e+05 then
                return false
            end
        end
        if #a1.upgrades <= 256 and #a1.trophies <= 256 then
            return true
        end
    end
    return false
end
tbl_2.eggFarmShape = tbl_1
tbl_2.eggFarmSaveCheck = v1
return tbl_2