-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local ONET_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "onet-config").ONET_CONFIG
local v1 = RuntimeLib_1.import(script, script.Parent, "onet-sim")
local createBoard_upv_1 = v1.createBoard
local dealBoard_upv_1 = v1.dealBoard
local findAnyMove_upv_1 = v1.findAnyMove
local forcePlaceMatch_upv_1 = v1.forcePlaceMatch
local reshuffleRemaining_upv_1 = v1.reshuffleRemaining
local function ensureMoveAvailable_upv_1(a1, a2, a3)
    --[[
      name: ensureMoveAvailable
      line: 83
      upvalues:
        findAnyMove_upv_1 (copy, index: 1)
        ONET_CONFIG_upv_1 (copy, index: 2)
        forcePlaceMatch_upv_1 (copy, index: 3)
        reshuffleRemaining_upv_1 (copy, index: 4)
        deriveRandom_upv_1 (copy, index: 5)
    ]]
    local board_1 = a3.board
    if board_1.remaining ~= 0 then
        local v2 = 0
        while findAnyMove_upv_1(board_1) == nil do
            if ONET_CONFIG_upv_1.reshuffleBound > v2 then
                reshuffleRemaining_upv_1(board_1, deriveRandom_upv_1(a1, (5e+06 + (a2 * 1000)) + a3.shuffleIndex))
                a3.shuffleIndex = a3.shuffleIndex + 1
                v2 = v2 + 1
                continue
            end
            forcePlaceMatch_upv_1(board_1)
            local tbl_1 = {}
            tbl_1.reshuffles = v2
            return tbl_1
        end
        local tbl_2 = {}
        tbl_2.reshuffles = v2
        return tbl_2
    end
    return {}
end
local function levelBand_upv_1(a1)
    --[[
      name: levelBand
      line: 43
      upvalues:
        ONET_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v3 = math.min(math.max(a1, 1), ONET_CONFIG_upv_1.plateauLevel)
    local v4 = 14
    local v5 = 8
    local v6 = 28
    if v3 > 3 then
        if v3 <= 7 then
            v4, v5, v6 = 12, 7, 21
        end
    else
        v4, v5, v6 = 10, 6, 15
    end
    local v7 = ONET_CONFIG_upv_1.secondsPerTileStart - (ONET_CONFIG_upv_1.secondsPerTileStart - ONET_CONFIG_upv_1.secondsPerTileFloor) * ((v3 - 1) / (ONET_CONFIG_upv_1.plateauLevel - 1))
    if ONET_CONFIG_upv_1.plateauLevel < a1 then
        v7 = math.max(ONET_CONFIG_upv_1.secondsPerTileFloor * math.pow(ONET_CONFIG_upv_1.endgameDecayPerLevel, a1 - ONET_CONFIG_upv_1.plateauLevel), ONET_CONFIG_upv_1.secondsPerTileMinimum)
    end
    local tbl_3 = {}
    tbl_3.columns = v4
    tbl_3.rows = v5
    tbl_3.kinds = v6
    tbl_3.secondsPerTile = v7
    tbl_3.timeLimitSeconds = (v4 * v5) * v7
    return tbl_3
end
local tbl_4 = {}
tbl_4.levelBand = levelBand_upv_1
tbl_4.ensureMoveAvailable = ensureMoveAvailable_upv_1
tbl_4.dealLevel = function(a1, a2)
    --[[
      name: dealLevel
      line: 110
      upvalues:
        levelBand_upv_1 (copy, index: 1)
        createBoard_upv_1 (copy, index: 2)
        dealBoard_upv_1 (copy, index: 3)
        deriveRandom_upv_1 (copy, index: 4)
        ensureMoveAvailable_upv_1 (copy, index: 5)
    ]]
    local v8 = levelBand_upv_1(a2)
    local v9 = createBoard_upv_1(v8.columns, v8.rows)
    dealBoard_upv_1(v9, v8.kinds, deriveRandom_upv_1(a1, 5e+06 + (a2 * 1000)))
    local tbl_5 = {}
    tbl_5.board = v9
    tbl_5.band = v8
    local tbl_6 = {}
    tbl_6.dealt = tbl_5
    tbl_6.ensure = ensureMoveAvailable_upv_1(a1, a2, tbl_5)
    return tbl_6
end
return tbl_4