-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
tbl_1.collectWindTrees = function(a1, a2)
    --[[
      name: collectWindTrees
      line: 16
    ]]
    if #a1 ~= 0 then
        local v1 = Random.new()
        local v2 = 0
        for _, value_1 in a1 do
            v2 = math.max(v2, value_1.height)
        end
        local v3 = ((a2.shortTreeMaxHeight <= 0) and (v2 * a2.shortFraction)) or (a2.shortTreeMaxHeight)
        local tbl_2 = {}
        local v4 = 0
        v4 = v4
        local tbl_3 = nil
        local v5 = nil
        local tbl_4 = nil
        for _, value_2 in a1 do
            if value_2.height < a2.shortTreeMinHeight or v3 < value_2.height then
                continue
            end
            if a2.maxTrees <= #tbl_2 then
                v4 = v4 + 1
                continue
            end
            tbl_3 = {}
            for v6, value_3 in value_2.parts do
                tbl_4 = {}
                tbl_4.part = value_3.part
                tbl_4.rest = value_3.rest
                tbl_4.isLeaf = value_3.isLeaf
                if value_3.isLeaf then
                    v5 = v1:NextNumber(0, math.tau)
                else
                    v5 = 0
                end
                tbl_4.flutterPhase = v5
                table.insert(tbl_3, tbl_4)
            end
            table.insert(tbl_2, {base = value_2.base, parts = tbl_3, swayPhase = v1:NextNumber(0, math.tau)})
        end
        if a2.debug then
            local tbl_5 = {}
            for _, value_4 in a1 do
                table.insert(tbl_5, (string.format("%.1f", value_4.height)))
            end
            print(("[Timberman] wind: %* tree unit(s), tallest=%*, "):format(#a1, string.format("%.1f", v2)) .. ("cutoff=%* \226\134\146 swaying %*"):format(string.format("%.1f", v3), #tbl_2))
            print((("[Timberman] wind unit heights: %*"):format(table.concat(tbl_5, ", "))))
        end
        if v4 > 0 then
            warn((("[Timberman] wind capped at %* trees \226\128\148 %* short tree(s) left still"):format(a2.maxTrees, v4)))
        end
        if #tbl_2 == 0 then
            warn("[Timberman] wind detected trees but none under the short cutoff \226\128\148 tune shortFraction/shortTreeMaxHeight")
        end
        return tbl_2
    end
    warn("[Timberman] wind found no tree units \226\128\148 check grouping / clusterFootprintMax against the map")
    return {}
end
tbl_1.collectPineWindTrees = function(a1, a2)
    --[[
      name: collectPineWindTrees
      line: 72
    ]]
    local v6 = Random.new()
    local tbl_6 = {}
    for n_1 = 0, #a1 - 1 do
        local v7
        v7 = a1[n_1 + 1]
        local v8
        if v7 == nil then
            continue
        end
        v8 = {}
        table.insert(v8, {part = v7, rest = v7.CFrame})
        for n_2 = 0, 2 do
            local v9
            v9 = a2[((n_1 * 3) + n_2) + 1]
            if v9 ~= nil then
                table.insert(v8, {part = v9, rest = v9.CFrame, flutterPhase = v6:NextNumber(0, math.tau)})
            end
        end
        table.insert(tbl_6, {base = v7.Position - Vector3.new(0, v7.Size.Y / 2, 0), parts = v8, swayPhase = v6:NextNumber(0, math.tau)})
        local v9
    end
    return tbl_6
end
tbl_1.applyWind = function(a1, a2, a3)
    --[[
      name: applyWind
      line: 120
    ]]
    if #a1 ~= 0 then
        local v10 = math.rad(a2.swayAmplitudeDeg)
        local v11 = math.rad(a2.leafFlutterDeg)
        local v12 = nil
        local v13 = nil
        local v14 = nil
        for _, value_5 in a1 do
            v12 = v10 * (math.sin((a3 * a2.swaySpeed) + value_5.swayPhase) * 0.7 + (math.sin((a3 * a2.swaySecondarySpeed) + (value_5.swayPhase * 1.7)) * 0.3))
            v13 = CFrame.new(value_5.base)
            v14 = v13 * CFrame.Angles(v12, 0, 0) * v13:Inverse()
            for v16, value_6 in value_5.parts do
                if value_6.isLeaf then
                    local v15 = a3 * a2.leafFlutterSpeed + value_6.flutterPhase
                    value_6.part.CFrame = (v14 * value_6.rest) * CFrame.Angles(v11 * math.sin(v15), 0, (v11 * 0.6) * math.cos(v15))
                else
                    value_6.part.CFrame = v14 * value_6.rest
                end
            end
        end
    else
        return nil
    end
end
return tbl_1