-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_1 = {}
local u1 = Instance.new("BindableEvent")
function tbl_1.PersistentCall(a1, ...)
    --[[
      name: PersistentCall
      line: 7
      upvalues:
        u1 (copy, index: 1)
    ]]
    u1:Fire(a1, ...)
end
function InternalCallFunction(a1, ...)
    --[[
      name: InternalCallFunction
      line: 12
    ]]
    a1(...)
end
function Initialize()
    --[[
      name: Initialize
      line: 16
      upvalues:
        u1 (copy, index: 1)
    ]]
    u1.Event:Connect(InternalCallFunction)
end
Initialize()
return tbl_1