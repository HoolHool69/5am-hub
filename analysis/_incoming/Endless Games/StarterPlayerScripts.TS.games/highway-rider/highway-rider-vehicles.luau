-- Saved by UniversalSynSaveInstance (Join to Copy Games) https://discord.gg/wx4ThpAsmw

local tbl_upv_1 = {}
tbl_upv_1.Car = {}
tbl_upv_1.Truck = {}
tbl_upv_1.Car2 = {paintParts = {"BodyColor"}}
tbl_upv_1.Bus = {paintParts = {"BodyColor"}}
tbl_upv_1.Truck4 = {paintParts = {"BodyColor", "Cylinder.130"}}
tbl_upv_1.Truck2 = {paintParts = {"BodyColor1", "BodyColor2"}}
tbl_upv_1.Truck3 = {paintParts = {"BodyColor1", "Cube.073", "Cube.067", "Cube.075", "Cube.066"}}
local tbl_2 = {}
local tbl_3 = {}
tbl_3.color = Color3.fromRGB(244, 244, 246)
tbl_3.parts = {"Cube.112", "Cube.113"}
tbl_2.livery = {{color = Color3.fromRGB(226, 54, 40), parts = {"Cube.100"}}, tbl_3}
tbl_upv_1.Ambulance = tbl_2
tbl_upv_1.PoliceCar = {}
tbl_upv_1.RampTruck = {paintParts = {"BodyColor", "Cube.171", "Cube.166", "Cube.165", "Cube.157", "Cube.163"}}
tbl_upv_1.Truck5 = {paintParts = {"BodyColor", "Cube.171", "Cube.166", "Cube.165", "Cube.157", "Cube.163"}}
tbl_upv_1.OilTruck = {paintParts = {"BodyColor", "Cylinder.157"}}
tbl_upv_1.Truck6 = {paintParts = {"BodyColor", "Cylinder.157"}}
local tbl_5 = {}
local function frontFromOffset_1(a1)
    --[[
      name: frontFromOffset
      line: 163
    ]]
    local v1 = math.abs(a1.X)
    if math.abs(a1.Z) >= v1 then
        if a1.Z <= 0 then
            return "-Z"
        end
        return "+Z"
    elseif a1.X <= 0 then
        return "-X"
    else
        return "+X"
    end
end
local tbl_6 = {Color3.fromRGB(196, 62, 58), Color3.fromRGB(38, 92, 176), Color3.fromRGB(226, 184, 66), Color3.fromRGB(58, 140, 92), Color3.fromRGB(232, 232, 236), Color3.fromRGB(64, 68, 76), Color3.fromRGB(198, 104, 42)}
local tbl_7 = {"NewVehicle"}
local tbl_8 = {}
tbl_8.vehicleSpec = function(a1)
    --[[
      name: vehicleSpec
      line: 159
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    return tbl_upv_1[a1]
end
tbl_8.deriveVehicleFront = function(a1, a2)
    --[[
      name: deriveVehicleFront
      line: 189
      upvalues:
        tbl_upv_1 (copy, index: 1)
    ]]
    local front_1 = tbl_upv_1[a1.Name]
    if front_1 ~= nil then
        front_1 = front_1.front
    end
    if front_1 == nil then
        local v2
        v2 = nil
        local v3 = nil
        for v4, value_1 in a1:GetDescendants() do
            v3 = value_1:IsA("BasePart")
            if not (v3) or value_1.Material ~= Enum.Material.Neon then
                continue
            end
            if value_1.Color.G > 0.5 then
                v2 = value_1
            end
        end
        local v5
        local v4 = nil
        if v2 == nil then
            local v7 = nil
            local v8 = nil
            local v9 = nil
            local v10 = nil
            local v11 = nil
            local v12 = nil
            for _, value_2 in a1:GetDescendants() do
                v12 = value_2:IsA("BasePart")
                if not (v12) then
                    continue
                end
                v9 = value_2.Color
                v8 = math.max(v9.R, v9.G, v9.B) < 0.25
                if not (v8) or value_2.Position.Y <= a2.Y then
                    continue
                end
                v10 = value_2.Position - a2
                v11 = math.max(math.abs(v10.X), math.abs(v10.Z))
                if v7 == nil or math.max(math.abs(v7.X), math.abs(v7.Z)) < v11 then
                    v7 = v10
                end
            end
            if v7 ~= nil and math.max(math.abs(v7.X), math.abs(v7.Z)) > 1 then
                v4 = math.abs(v7.X)
                if math.abs(v7.Z) >= v4 then
                    if v7.Z <= 0 then
                        return "-Z"
                    end
                    return "+Z"
                elseif v7.X <= 0 then
                    return "-X"
                else
                    return "+X"
                end
            end
            local v15 = nil
            local v16 = nil
            local v17 = nil
            local v18 = nil
            for _, value_3 in a1:GetDescendants() do
                v18 = value_3:IsA("BasePart")
                if not (v18) or value_3.Transparency <= 0.2 or value_3.Transparency >= 0.98 or value_3.Position.Y <= a2.Y then
                    continue
                end
                v16 = value_3.Position - a2
                v17 = math.max(math.abs(v16.X), math.abs(v16.Z))
                if v15 == nil or math.max(math.abs(v15.X), math.abs(v15.Z)) < v17 then
                    v15 = v16
                end
            end
            if v15 ~= nil and math.max(math.abs(v15.X), math.abs(v15.Z)) > 1 then
                local v19 = math.abs(v15.X)
                if math.abs(v15.Z) >= v19 then
                    if v15.Z <= 0 then
                        return "-Z"
                    end
                    return "+Z"
                elseif v15.X <= 0 then
                    return "-X"
                else
                    return "+X"
                end
            end
            return nil
        end
        v5 = v2.Position - a2
        v4 = math.abs(v5.X)
        if math.abs(v5.Z) >= v4 then
            if v5.Z <= 0 then
                return "-Z"
            end
            return "+Z"
        elseif v5.X <= 0 then
            return "-X"
        else
            return "+X"
        end
    end
    return front_1
end
tbl_8.VEHICLE_SPECS = tbl_upv_1
tbl_8.RAMP_GEOMETRY = tbl_5
tbl_8.VEHICLE_PAINT_COLORS = tbl_6
tbl_8.EXTRA_TRAFFIC_FOLDERS = {fp = {"NewVehicle"}, tp = tbl_7}
return tbl_8