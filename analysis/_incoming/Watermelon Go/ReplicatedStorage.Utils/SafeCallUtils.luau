-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

function SafeCall(a1, a2, a3, ...)
    --[[
      name: SafeCall
      line: 24
    ]]
    local v1 = nil
    local v2 = nil
    v1 = v1
    for _ = 1, a2 or 5 do
        v2 = {pcall(a1, ...)}
        if v2[1] then
            v1 = v2
            break
        else
            task.wait(a3 or 1)
            v1 = v2
        end
    end
    return table.unpack(v1)
end
return SafeCall