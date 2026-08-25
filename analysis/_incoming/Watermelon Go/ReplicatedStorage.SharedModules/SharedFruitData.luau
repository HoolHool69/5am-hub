-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.FruitTable = {[1] = {Name = "Cherry", Points = 1}, [2] = {Name = "Strawberry", Points = 3}, [3] = {Name = "Grapes", Points = 6}, [4] = {Name = "Orange", Points = 10}, [5] = {Name = "Tomato", Points = 15}, [6] = {Name = "Apple", Points = 21}, [7] = {Name = "Cantaloupe", Points = 28}, [8] = {Name = "Peach", Points = 36}, [9] = {Name = "Pineapple", Points = 45}, [10] = {Name = "Wintermelon", Points = 55}, [11] = {Name = "Watermelon", Points = 66}}
function tbl_upv_1.GetFruitIndexByName(a1)
    --[[
      name: GetFruitIndexByName
      line: 51
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    for n_1 = 1, #tbl_upv_1.FruitTable do
        if tbl_upv_1.FruitTable[n_1].Name ~= a1 then
            continue
        end
        return n_1
    end
end
return tbl_upv_1