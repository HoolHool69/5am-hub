-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local RuntimeLib_1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local deriveRandom_upv_1 = RuntimeLib_1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "seeded-random").deriveRandom
local BALLZ_CONFIG_upv_1 = RuntimeLib_1.import(script, script.Parent, "ballz-config").BALLZ_CONFIG
local u1 = BALLZ_CONFIG_upv_1.columns * BALLZ_CONFIG_upv_1.cellSize / 2
local u2 = (BALLZ_CONFIG_upv_1.rows + 1) * BALLZ_CONFIG_upv_1.cellSize
local tbl_1 = {}
tbl_1.cellIndex = function(a1, a2)
    --[[
      name: cellIndex
      line: 26
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    return a1 + (a2 * BALLZ_CONFIG_upv_1.columns)
end
tbl_1.specForTurn = function(a1, a2)
    --[[
      name: specForTurn
      line: 38
      upvalues:
        deriveRandom_upv_1 (copy, index: 1)
        BALLZ_CONFIG_upv_1 (copy, index: 2)
    ]]
    local v1 = deriveRandom_upv_1(a1, 1000 + a2)
    local tbl_2 = {}
    local v2 = 0
    for v3 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
        local v4
        v4 = v1:NextNumber()
        local v5 = v1:NextNumber()
        if v4 >= BALLZ_CONFIG_upv_1.brickChance then
            table.insert(tbl_2, 0)
            continue
        end
        local v6
        if v5 >= BALLZ_CONFIG_upv_1.doubleChance then
            v6 = a2
        else
            v6 = a2 * 2
        end
        table.insert(tbl_2, v6)
        v2 = v2 + 1
    end
    local v7 = v1:NextNumber()
    local v8 = v1:NextInteger(0, BALLZ_CONFIG_upv_1.columns - 1)
    local v3 = v1:NextInteger(0, BALLZ_CONFIG_upv_1.columns - 1)
    if v2 == 0 then
        tbl_2[v3 + 1] = a2
    end
    local v9 = -1
    if v7 < BALLZ_CONFIG_upv_1.dotChance then
        for n_1 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
            local v10
            v10 = (v8 + n_1) % BALLZ_CONFIG_upv_1.columns
            if tbl_2[v10 + 1] == 0 then
                v9 = v10
                break
            end
        end
    end
    local tbl_3 = {}
    tbl_3.hp = tbl_2
    tbl_3.dotColumn = v9
    return tbl_3
end
tbl_1.stepBall = function(a1, a2, a3, a4, a5)
    --[[
      name: stepBall
      line: 87
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
        u1 (copy, index: 2)
        u2 (copy, index: 3)
    ]]
    a5.brickHit = -1
    a5.brickCleared = false
    a5.dotCollected = -1
    a5.landed = false
    local v11, v12 = nil, nil
    if a1.active then
        a1.x = a1.x + (a1.velocityX * a4)
        a1.y = a1.y + (a1.velocityY * a4)
        local ballRadius_1 = BALLZ_CONFIG_upv_1.ballRadius
        v11 = u1 - ballRadius_1
        if v11 >= a1.x or a1.velocityX <= 0 then
            if a1.x < -v11 and a1.velocityX < 0 then
                a1.x = -v11 + (-v11 - a1.x)
                a1.velocityX = -a1.velocityX
            end
        else
            a1.x = v11 - (a1.x - v11)
            a1.velocityX = -a1.velocityX
        end
        v12 = u2 - ballRadius_1
        if v12 < a1.y and a1.velocityY > 0 then
            a1.y = v12 - (a1.y - v12)
            a1.velocityY = -a1.velocityY
        end
        if a1.y < ballRadius_1 and a1.velocityY < 0 then
            a1.y = ballRadius_1
            a1.active = false
            a5.landed = true
            return nil
        end
        local cellSize_1 = BALLZ_CONFIG_upv_1.cellSize
        local v13 = math.max(math.floor(((a1.x - ballRadius_1) + u1) / cellSize_1), 0)
        local v14 = math.min(math.floor(((a1.x + ballRadius_1) + u1) / cellSize_1), BALLZ_CONFIG_upv_1.columns - 1)
        local v15 = math.max(math.floor((a1.y - ballRadius_1) / cellSize_1), 0)
        local v16 = math.min(math.floor((a1.y + ballRadius_1) / cellSize_1), BALLZ_CONFIG_upv_1.rows - 1)
        local v17 = false
        local v17, v18 = v17, v15
        if v17 then
            v18 = v18 + 1
        else
            v17 = true
        end
        local v19, v20, v21 = nil, nil, nil
        if v18 <= v16 then
            local v22 = false
            local v22, v23 = v22, v13
            local v24, v25, v26 = nil, nil, nil
            if v22 then
                v23 = v23 + 1
            else
                v22 = true
            end
            local v27, v28, v29
            if v23 > v14 then
                return
            end
            v24 = v23 + v18 * BALLZ_CONFIG_upv_1.columns
            v27 = (v23 + 0.5) * cellSize_1 - u1
            v28 = (v18 + 0.5) * cellSize_1
            v29 = cellSize_1 * BALLZ_CONFIG_upv_1.brickFill / 2
            if a3[v24 + 1] then
                v19 = a1.x - v27
                v20 = a1.y - v28
                if (v19 * v19) + (v20 * v20) < (ballRadius_1 + (cellSize_1 * 0.22)) ^ 2 then
                    a3[v24 + 1] = false
                    a5.dotCollected = v24
                end
            end
            if a2[v24 + 1] > 0 then
                local v30 = math.clamp(a1.x, v27 - v29, v27 + v29)
                local v31 = math.clamp(a1.y, v28 - v29, v28 + v29)
                v25 = a1.x - v30
                v26 = a1.y - v31
                local v32, v33 = nil, nil
                if ballRadius_1 * ballRadius_1 > (v25 * v25) + (v26 * v26) then
                    v32 = ballRadius_1 - math.abs(v25)
                    v33 = ballRadius_1 - math.abs(v26)
                    v21 = math.abs(v25)
                    if math.abs(v26) >= v21 then
                        local v34 = ((v26 < 0) and -1) or 1
                        a1.y = a1.y + (v34 * v33)
                        if a1.velocityY * v34 < 0 then
                            a1.velocityY = -a1.velocityY
                        end
                    else
                        local v35 = ((v25 < 0) and -1) or 1
                        a1.x = a1.x + (v35 * v32)
                        if a1.velocityX * v35 < 0 then
                            a1.velocityX = -a1.velocityX
                        end
                    end
                    local v36 = v24 + 1
                    a2[v36] = a2[v36] - 1
                    a5.brickHit = v24
                    a5.brickCleared = a2[v24 + 1] <= 0
                    return nil
                end
            end
        end
    else
        return nil
    end
end
tbl_1.descendAndSpawn = function(a1, a2, a3)
    --[[
      name: descendAndSpawn
      line: 207
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    for n_2 = 0, BALLZ_CONFIG_upv_1.rows - 2 do
        for n_3 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
            a1[(n_3 + (n_2 * BALLZ_CONFIG_upv_1.columns)) + 1] = a1[(n_3 + ((n_2 + 1) * BALLZ_CONFIG_upv_1.columns)) + 1]
            a2[(n_3 + (n_2 * BALLZ_CONFIG_upv_1.columns)) + 1] = a2[(n_3 + ((n_2 + 1) * BALLZ_CONFIG_upv_1.columns)) + 1]
        end
    end
    local v37 = BALLZ_CONFIG_upv_1.rows - 1
    for n_4 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
        a1[(n_4 + (v37 * BALLZ_CONFIG_upv_1.columns)) + 1] = a3.hp[n_4 + 1]
        a2[(n_4 + (v37 * BALLZ_CONFIG_upv_1.columns)) + 1] = a3.dotColumn == n_4
    end
    for n_5 = 0, BALLZ_CONFIG_upv_1.columns - 1 do
        if a1[(n_5 + (0 * BALLZ_CONFIG_upv_1.columns)) + 1] <= 0 then
            continue
        end
        return true
    end
    return false
end
tbl_1.clampAim = function(a1, a2)
    --[[
      name: clampAim
      line: 227
      upvalues:
        BALLZ_CONFIG_upv_1 (copy, index: 1)
    ]]
    local v38 = math.max(math.sqrt((a1 * a1) + (a2 * a2)), 1e-04)
    local v39 = a1 / v38
    local v40 = a2 / v38
    if v40 < 0 then
        v40 = 0
    end
    local v41 = math.sin(math.rad(BALLZ_CONFIG_upv_1.aimMinAngleDegrees))
    if v40 < v41 then
        v39 = (v39 < 0 and -1 or 1) * math.sqrt(math.max(1 - v41 * v41, 0))
        v40 = v41
    end
    local tbl_4 = {}
    tbl_4.x = v39
    tbl_4.y = v40
    return tbl_4
end
tbl_1.CELL_COUNT = BALLZ_CONFIG_upv_1.columns * BALLZ_CONFIG_upv_1.rows
tbl_1.BOARD_HALF_WIDTH = u1
tbl_1.CEILING_Y = u2
return tbl_1