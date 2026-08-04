--!strict

--[[
    5AM Hub
    File: ui/core/Flags.lua

    Central flag registry with change listeners and JSON-backed configuration
    persistence through common executor filesystem APIs.
]]

type FileApi = {
    isfolder: ((string) -> boolean)?,
    makefolder: ((string) -> ())?,
    isfile: ((string) -> boolean)?,
    readfile: ((string) -> string)?,
    writefile: ((string, string) -> ())?,
    listfiles: ((string) -> {string})?,
}

local DEFAULT_CONFIG_FOLDER = "5AMHub/configs"
local SERIALIZED_TYPE_KEY = "__5AMHubType"

local FlagConnection = {}
FlagConnection.__index = FlagConnection

local Flags = {}
Flags.__index = Flags

local function GetEnvironment(): {[string]: any}
    local success, environment = pcall(function()
        return getfenv(0)
    end)

    if success and type(environment) == "table" then
        local getGlobalEnvironment = environment.getgenv

        if type(getGlobalEnvironment) == "function" then
            local globalSuccess, globalEnvironment = pcall(getGlobalEnvironment)
            if globalSuccess and type(globalEnvironment) == "table" then
                return setmetatable({}, {
                    __index = function(_table, key)
                        local localValue = environment[key]
                        return if localValue ~= nil then localValue else globalEnvironment[key]
                    end,
                }) :: {[string]: any}
            end
        end

        return environment :: {[string]: any}
    end

    return {}
end

local function ResolveFileApi(overrides: FileApi?): FileApi
    local environment = GetEnvironment()
    local fileApi = overrides or {}

    local function Resolve(name: string): any
        local existing = (fileApi :: any)[name]
        if type(existing) == "function" then
            return existing
        end

        local candidate = environment[name]
        if type(candidate) == "function" then
            return candidate
        end

        return nil
    end

    return {
        isfolder = Resolve("isfolder"),
        makefolder = Resolve("makefolder"),
        isfile = Resolve("isfile"),
        readfile = Resolve("readfile"),
        writefile = Resolve("writefile"),
        listfiles = Resolve("listfiles"),
    }
end

local function ResolveHttpService(): any?
    local success, service = pcall(function()
        return game:GetService("HttpService")
    end)

    if success then
        return service
    end

    return nil
end

local function NormalizeConfigName(configName: any): string?
    if type(configName) ~= "string" then
        return nil
    end

    local normalized = string.match(configName, "^%s*(.-)%s*$") or ""

    if string.lower(string.sub(normalized, -5)) == ".json" then
        normalized = string.sub(normalized, 1, -6)
    end

    if normalized == "" or string.find(normalized, "%.%.", 1, false) then
        return nil
    end

    if string.find(normalized, "[\\/:*?\"<>|]") then
        return nil
    end

    return normalized
end

local function Serialize(value: any, seenTables: {[any]: boolean}): any
    local valueType = typeof(value)

    if valueType == "nil" or valueType == "boolean" or valueType == "number" or valueType == "string" then
        return value
    end

    if valueType == "Color3" then
        return {
            [SERIALIZED_TYPE_KEY] = "Color3",
            R = value.R,
            G = value.G,
            B = value.B,
        }
    end

    if valueType == "EnumItem" then
        return {
            [SERIALIZED_TYPE_KEY] = "EnumItem",
            EnumType = tostring(value.EnumType),
            Name = value.Name,
        }
    end

    if valueType == "UDim" then
        return {
            [SERIALIZED_TYPE_KEY] = "UDim",
            Scale = value.Scale,
            Offset = value.Offset,
        }
    end

    if valueType == "UDim2" then
        return {
            [SERIALIZED_TYPE_KEY] = "UDim2",
            XScale = value.X.Scale,
            XOffset = value.X.Offset,
            YScale = value.Y.Scale,
            YOffset = value.Y.Offset,
        }
    end

    if valueType == "Vector2" or valueType == "Vector3" then
        return {
            [SERIALIZED_TYPE_KEY] = valueType,
            X = value.X,
            Y = value.Y,
            Z = if valueType == "Vector3" then value.Z else nil,
        }
    end

    if valueType == "table" then
        if seenTables[value] then
            error("Cannot serialize a cyclic flag table")
        end

        seenTables[value] = true
        local serialized = {}

        for key, nestedValue in value do
            local keyType = type(key)
            if keyType ~= "string" and keyType ~= "number" then
                error("Flag tables may only use string or number keys")
            end

            serialized[key] = Serialize(nestedValue, seenTables)
        end

        seenTables[value] = nil
        return serialized
    end

    error(string.format("Unsupported flag value type: %s", valueType))
end

local function Deserialize(value: any): any
    if type(value) ~= "table" then
        return value
    end

    local serializedType = value[SERIALIZED_TYPE_KEY]

    if serializedType == "Color3" then
        return Color3.new(value.R, value.G, value.B)
    elseif serializedType == "EnumItem" then
        local enumTypeName = string.match(value.EnumType or "", "^Enum%.(.+)$")
        local enumType = if enumTypeName then (Enum :: any)[enumTypeName] else nil
        return if enumType then enumType[value.Name] else nil
    elseif serializedType == "UDim" then
        return UDim.new(value.Scale, value.Offset)
    elseif serializedType == "UDim2" then
        return UDim2.new(value.XScale, value.XOffset, value.YScale, value.YOffset)
    elseif serializedType == "Vector2" then
        return Vector2.new(value.X, value.Y)
    elseif serializedType == "Vector3" then
        return Vector3.new(value.X, value.Y, value.Z)
    end

    local deserialized = {}
    for key, nestedValue in value do
        deserialized[key] = Deserialize(nestedValue)
    end

    return deserialized
end

local function EnsureFolder(fileApi: FileApi, folderPath: string): boolean
    local isFolder = fileApi.isfolder

    if isFolder then
        local checkSuccess, folderExists = pcall(isFolder, folderPath)
        if checkSuccess and folderExists then
            return true
        end
    end

    local makeFolder = fileApi.makefolder
    if not makeFolder then
        return false
    end

    local createSuccess = pcall(makeFolder, folderPath)
    if createSuccess then
        return true
    end

    if isFolder then
        local checkSuccess, folderExists = pcall(isFolder, folderPath)
        return checkSuccess and folderExists
    end

    return true
end

local function EnsureFolderTree(fileApi: FileApi, folderPath: string): boolean
    local normalizedPath = string.gsub(folderPath, "\\", "/")
    local currentPath = ""

    for segment in string.gmatch(normalizedPath, "[^/]+") do
        currentPath = if currentPath == "" then segment else currentPath .. "/" .. segment

        if not EnsureFolder(fileApi, currentPath) then
            return false
        end
    end

    return true
end

function FlagConnection.Disconnect(self: any)
    if not self.Connected then
        return
    end

    self.Connected = false
    local owner = self._owner

    if owner then
        local listeners = owner._listeners[self._name]
        if listeners then
            listeners[self] = nil
        end
    end

    self._owner = nil
    self._callback = nil
end

function Flags.new(options: any?): any
    options = options or {}

    return setmetatable({
        _registered = {},
        _defaults = {},
        _values = {},
        _listeners = {},
        _httpService = options.HttpService or ResolveHttpService(),
        _fileApi = ResolveFileApi(options.FileApi),
        _configFolder = options.ConfigFolder or DEFAULT_CONFIG_FOLDER,
    }, Flags)
end

function Flags.Register(self: any, name: string, defaultValue: any): any
    assert(type(name) == "string" and name ~= "", "Flags:Register(name, defaultValue) expects a non-empty name")

    if self._registered[name] then
        return self._values[name]
    end

    self._registered[name] = true
    self._defaults[name] = defaultValue
    self._values[name] = defaultValue

    return defaultValue
end

function Flags.Set(self: any, name: string, value: any): boolean
    if not self._registered[name] then
        return false
    end

    local previousValue = self._values[name]
    self._values[name] = value

    if previousValue == value then
        return true
    end

    local listeners = self._listeners[name]
    if listeners then
        for connection, callback in listeners do
            if connection.Connected then
                task.spawn(function()
                    local success, message = pcall(callback, value, previousValue)
                    if not success then
                        warn(string.format("5AM Hub flag listener '%s' failed: %s", name, tostring(message)))
                    end
                end)
            end
        end
    end

    return true
end

function Flags.Get(self: any, name: string): any
    return self._values[name]
end

function Flags.OnChanged(self: any, name: string, callback: (any, any) -> ()): any?
    if not self._registered[name] or type(callback) ~= "function" then
        return nil
    end

    local listeners = self._listeners[name]
    if not listeners then
        listeners = {}
        self._listeners[name] = listeners
    end

    local connection = setmetatable({
        Connected = true,
        _owner = self,
        _name = name,
        _callback = callback,
    }, FlagConnection)

    listeners[connection] = callback
    return connection
end

function Flags.Save(self: any, configName: string): (boolean, string?)
    local normalizedName = NormalizeConfigName(configName)
    if not normalizedName then
        return false, "Invalid configuration name"
    end

    local httpService = self._httpService
    local fileApi = ResolveFileApi(self._fileApi)
    local writeFile = fileApi.writefile

    if not httpService then
        return false, "HttpService is unavailable"
    end

    if not writeFile then
        return false, "writefile is unavailable"
    end

    if not EnsureFolderTree(fileApi, self._configFolder) then
        return false, "Unable to create the configuration folder"
    end

    local encodeSuccess, encodedOrError = pcall(function()
        local serializedValues = Serialize(self._values, {})
        return httpService:JSONEncode(serializedValues)
    end)

    if not encodeSuccess then
        return false, string.format("Unable to encode configuration: %s", tostring(encodedOrError))
    end

    local filePath = string.format("%s/%s.json", self._configFolder, normalizedName)
    local writeSuccess, writeError = pcall(writeFile, filePath, encodedOrError)

    if not writeSuccess then
        return false, string.format("Unable to write configuration: %s", tostring(writeError))
    end

    self._fileApi = fileApi
    return true
end

function Flags.Load(self: any, configName: string): (boolean, string?)
    local normalizedName = NormalizeConfigName(configName)
    if not normalizedName then
        return false, "Invalid configuration name"
    end

    local httpService = self._httpService
    local fileApi = ResolveFileApi(self._fileApi)
    local readFile = fileApi.readfile
    local filePath = string.format("%s/%s.json", self._configFolder, normalizedName)

    if not httpService then
        return false, "HttpService is unavailable"
    end

    if not readFile then
        return false, "readfile is unavailable"
    end

    local isFile = fileApi.isfile
    if isFile then
        local checkSuccess, fileExists = pcall(isFile, filePath)
        if checkSuccess and not fileExists then
            return false, "Configuration file does not exist"
        end
    end

    local readSuccess, contentsOrError = pcall(readFile, filePath)
    if not readSuccess then
        return false, string.format("Unable to read configuration: %s", tostring(contentsOrError))
    end

    local decodeSuccess, decodedOrError = pcall(function()
        return httpService:JSONDecode(contentsOrError)
    end)

    if not decodeSuccess or type(decodedOrError) ~= "table" then
        return false, string.format("Unable to decode configuration: %s", tostring(decodedOrError))
    end

    local applySuccess, applyError = pcall(function()
        for name, serializedValue in decodedOrError do
            if type(name) == "string" and self._registered[name] then
                local value = Deserialize(serializedValue)
                if value ~= nil then
                    self:Set(name, value)
                end
            end
        end
    end)

    if not applySuccess then
        return false, string.format("Unable to apply configuration: %s", tostring(applyError))
    end

    self._fileApi = fileApi
    return true
end

function Flags.List(self: any): {string}
    local fileApi = ResolveFileApi(self._fileApi)
    local listFiles = fileApi.listfiles

    if not listFiles then
        return {}
    end

    local listSuccess, files = pcall(listFiles, self._configFolder)
    if not listSuccess or type(files) ~= "table" then
        return {}
    end

    local names = {}
    local seenNames = {}

    for _, filePath in files do
        if type(filePath) == "string" then
            local fileName = string.match(filePath, "([^/\\]+)$") or filePath

            if string.lower(string.sub(fileName, -5)) == ".json" then
                local name = string.sub(fileName, 1, -6)
                if name ~= "" and not seenNames[name] then
                    seenNames[name] = true
                    table.insert(names, name)
                end
            end
        end
    end

    table.sort(names)
    self._fileApi = fileApi

    return names
end

return Flags.new()
