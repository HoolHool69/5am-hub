#!/usr/bin/env node

/**
 * 5AM Hub standalone bundler.
 *
 * Bundles loader/*.lua, the shared UI, the universal module, and every game
 * package listed in games/manifest.json into one executable Luau artifact.
 * Static ModuleScript requires are rewritten to a lazy internal registry;
 * runtime/external requires remain untouched.
 */

"use strict";

const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const projectRoot = path.resolve(__dirname, "..");
const outputDirectory = path.join(projectRoot, "dist");
const outputFile = path.join(outputDirectory, "loader.lua");
const entryModule = "loader/init";
const uiModule = "ui/init";
const universalModule = "games/_universal/init";
const gamesDirectory = path.join(projectRoot, "games");
const manifestFile = path.join(gamesDirectory, "manifest.json");

const baseSourceGroups = [
    {
        directory: path.join(projectRoot, "loader"),
        prefix: "loader",
        recursive: false,
    },
    {
        directory: path.join(projectRoot, "ui"),
        prefix: "ui",
        recursive: true,
    },
    {
        directory: path.join(projectRoot, "games", "_universal"),
        prefix: "games/_universal",
        recursive: true,
    },
];

function Fail(message) {
    throw new Error(`[5AM build] ${message}`);
}

function EscapeRegularExpression(value) {
    return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function NormalizePath(filePath) {
    return filePath.split(path.sep).join("/");
}

function ReadGameRegistrations() {
    if (!fs.existsSync(manifestFile)) {
        Fail(`Game manifest does not exist: ${manifestFile}`);
    }

    let manifest;
    try {
        manifest = JSON.parse(fs.readFileSync(manifestFile, "utf8"));
    } catch (error) {
        Fail(`Could not parse games/manifest.json: ${error instanceof Error ? error.message : String(error)}`);
    }

    const entries = manifest && typeof manifest === "object" ? (manifest.Games || manifest) : null;
    if (!entries || typeof entries !== "object" || Array.isArray(entries)) {
        Fail("games/manifest.json must contain a Games object");
    }

    const registrations = [];
    const seenPlaceIds = new Set();

    for (const [key, entry] of Object.entries(entries)) {
        if (key.startsWith("_")) {
            continue;
        }
        if (!entry || typeof entry !== "object" || Array.isArray(entry)) {
            Fail(`Manifest entry ${key} must be an object`);
        }

        const placeId = Number(entry.PlaceId ?? entry.PlaceID ?? key);
        if (!Number.isSafeInteger(placeId) || placeId <= 0) {
            Fail(`Manifest entry ${key} has an invalid PlaceId`);
        }
        if (seenPlaceIds.has(placeId)) {
            Fail(`Manifest contains duplicate PlaceId ${placeId}`);
        }

        if (typeof entry.Module !== "string" || entry.Module.trim() === "") {
            Fail(`Manifest entry ${key} must define a Module directory`);
        }

        let moduleDirectory = NormalizePath(entry.Module.trim());
        moduleDirectory = moduleDirectory.replace(/^games\//u, "");
        moduleDirectory = moduleDirectory.replace(/\/init(?:\.lua)?$/u, "");
        if (
            moduleDirectory === ""
            || path.isAbsolute(moduleDirectory)
            || moduleDirectory.split("/").some((segment) => segment === "" || segment === "." || segment === "..")
        ) {
            Fail(`Manifest entry ${key} has an unsafe Module directory`);
        }

        seenPlaceIds.add(placeId);
        registrations.push({
            placeId,
            moduleDirectory,
            moduleName: `games/${moduleDirectory}/init`,
        });
    }

    return registrations.sort((left, right) => left.placeId - right.placeId);
}

function CollectLuaFiles(directory, recursive, relativeDirectory = "") {
    if (!fs.existsSync(directory)) {
        Fail(`Source directory does not exist: ${directory}`);
    }

    const currentDirectory = path.join(directory, relativeDirectory);
    const entries = fs.readdirSync(currentDirectory, { withFileTypes: true })
        .sort((left, right) => left.name.localeCompare(right.name));
    const files = [];

    for (const entry of entries) {
        const relativePath = path.join(relativeDirectory, entry.name);
        if (entry.isDirectory() && recursive) {
            files.push(...CollectLuaFiles(directory, true, relativePath));
        } else if (entry.isFile() && entry.name.endsWith(".lua")) {
            files.push(relativePath);
        }
    }

    return files;
}

function ReadModules(gameRegistrations) {
    const modules = new Map();
    const sourceGroups = [...baseSourceGroups];
    const includedGameDirectories = new Set();

    for (const registration of gameRegistrations) {
        if (includedGameDirectories.has(registration.moduleDirectory)) {
            continue;
        }
        includedGameDirectories.add(registration.moduleDirectory);
        sourceGroups.push({
            directory: path.join(gamesDirectory, ...registration.moduleDirectory.split("/")),
            prefix: `games/${registration.moduleDirectory}`,
            recursive: true,
        });
    }

    for (const group of sourceGroups) {
        const luaFiles = CollectLuaFiles(group.directory, group.recursive);
        for (const relativeFile of luaFiles) {
            const relativeModuleName = NormalizePath(relativeFile).replace(/\.lua$/u, "");
            const moduleName = `${group.prefix}/${relativeModuleName}`;
            const sourcePath = path.join(group.directory, relativeFile);
            const source = fs.readFileSync(sourcePath, "utf8")
                .replace(/^\uFEFF/u, "")
                .replace(/\r\n/gu, "\n");

            if (modules.has(moduleName)) {
                Fail(`Duplicate bundled module name: ${moduleName}`);
            }

            modules.set(moduleName, {
                name: moduleName,
                relativePath: NormalizePath(path.relative(projectRoot, sourcePath)),
                source,
            });
        }
    }

    for (const requiredModule of [entryModule, uiModule, universalModule]) {
        if (!modules.has(requiredModule)) {
            Fail(`Required entry module is missing: ${requiredModule}.lua`);
        }
    }
    for (const registration of gameRegistrations) {
        if (!modules.has(registration.moduleName)) {
            Fail(
                `Manifest PlaceId ${registration.placeId} points to missing module ${registration.moduleName}.lua`,
            );
        }
    }

    return modules;
}

function ScriptNodeParts(moduleRecord) {
    const parts = moduleRecord.name.split("/");
    if (parts.at(-1) === "init") {
        parts.pop();
    }
    return parts;
}

function ResolveScriptDependency(moduleRecord, segments) {
    const resolvedParts = ScriptNodeParts(moduleRecord);

    for (const segment of segments) {
        if (segment === "Parent") {
            if (resolvedParts.length === 0) {
                Fail(`${moduleRecord.relativePath} references script.Parent above the bundle root`);
            }
            resolvedParts.pop();
        } else {
            resolvedParts.push(segment);
        }
    }

    return resolvedParts.join("/");
}

function TransformModule(moduleRecord, availableModules) {
    const dependencies = new Set();
    const moduleVariables = new Map();
    let source = moduleRecord.source.replace(/^--!strict\s*\n/u, "");

    function RegisterDependency(dependencyName) {
        if (!availableModules.has(dependencyName)) {
            Fail(`${moduleRecord.relativePath} requires missing bundled module ${dependencyName}.lua`);
        }
        dependencies.add(dependencyName);
        return `__bundle_require(${JSON.stringify(dependencyName)})`;
    }

    // loader/init.lua first resolves its siblings into variables. Preserve the
    // declarations for readability while replacing their require calls below.
    source = source.replace(
        /^[ \t]*local\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*assert\(FindLoaderModule\("([A-Za-z0-9_-]+)"\),\s*"[^"\n]*"\)\s*$/gmu,
        (_match, variableName, dependencyName) => {
            const resolvedName = `loader/${dependencyName}`;
            moduleVariables.set(variableName, resolvedName);
            return `local ${variableName} = ${JSON.stringify(resolvedName)} -- bundled module reference`;
        },
    );
    source = source.replace(
        /^[ \t]*local\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*assert\(FindLoaderModule\('([A-Za-z0-9_-]+)'\),\s*'[^'\n]*'\)\s*$/gmu,
        (_match, variableName, dependencyName) => {
            const resolvedName = `loader/${dependencyName}`;
            moduleVariables.set(variableName, resolvedName);
            return `local ${variableName} = ${JSON.stringify(resolvedName)} -- bundled module reference`;
        },
    );

    for (const [variableName, dependencyName] of moduleVariables) {
        const requireVariablePattern = new RegExp(
            `\\brequire\\s*\\(\\s*${EscapeRegularExpression(variableName)}\\s*\\)`,
            "gu",
        );
        source = source.replace(requireVariablePattern, () => RegisterDependency(dependencyName));
    }

    // Resolve script.Parent:WaitForChild("name") and FindFirstChild variants.
    source = source.replace(
        /\brequire\s*\(\s*script((?:\.Parent)*):WaitForChild\(\s*["']([A-Za-z0-9_-]+)["']\s*\)\s*\)/gu,
        (_match, parentChain, childName) => {
            const segments = [...parentChain.matchAll(/\.Parent/gu)].map(() => "Parent");
            segments.push(childName);
            return RegisterDependency(ResolveScriptDependency(moduleRecord, segments));
        },
    );
    source = source.replace(
        /\brequire\s*\(\s*script((?:\.Parent)*):FindFirstChild\(\s*["']([A-Za-z0-9_-]+)["']\s*\)\s*\)/gu,
        (_match, parentChain, childName) => {
            const segments = [...parentChain.matchAll(/\.Parent/gu)].map(() => "Parent");
            segments.push(childName);
            return RegisterDependency(ResolveScriptDependency(moduleRecord, segments));
        },
    );

    // Resolve property chains such as script.core.Signal and
    // script.components.Window from the UI entry module.
    source = source.replace(
        /\brequire\s*\(\s*script((?:\.[A-Za-z_][A-Za-z0-9_]*)+)\s*\)/gu,
        (_match, propertyChain) => {
            const segments = propertyChain.split(".").filter(Boolean);
            return RegisterDependency(ResolveScriptDependency(moduleRecord, segments));
        },
    );

    // An unresolved call-form require would still expect a ModuleScript tree and
    // would make the generated artifact unsuitable for loadstring execution.
    // Function references such as pcall(require, moduleReference) remain valid.
    if (/\brequire\s*\(/u.test(source)) {
        Fail(`${moduleRecord.relativePath} contains an unresolved require(...) expression`);
    }

    return {
        ...moduleRecord,
        dependencies: [...dependencies].sort(),
        source: source.trimEnd(),
    };
}

function RenderLuaLongString(source) {
    for (let delimiterSize = 1; delimiterSize <= 12; delimiterSize += 1) {
        const equals = "=".repeat(delimiterSize);
        const closingDelimiter = `]${equals}]`;
        if (!source.includes(closingDelimiter)) {
            return `[${equals}[\n${source}\n]${equals}]`;
        }
    }

    Fail("Could not find a safe Lua long-string delimiter for a bundled module");
}

function RenderBundle(modules, gameRegistrations) {
    const transformedModules = [...modules.values()]
        .map((moduleRecord) => TransformModule(moduleRecord, modules))
        .sort((left, right) => left.name.localeCompare(right.name));

    const sourceDigest = crypto.createHash("sha256");
    for (const moduleRecord of transformedModules) {
        sourceDigest.update(moduleRecord.name);
        sourceDigest.update("\0");
        sourceDigest.update(moduleRecord.source);
        sourceDigest.update("\0");
    }
    const buildId = sourceDigest.digest("hex").slice(0, 16);

    const chunks = [
        "--!strict",
        "",
        "--[[",
        "    5AM Hub standalone bundle",
        "    Generated by tools/build.js; edit source modules instead.",
        `    Build ID: ${buildId}`,
        "]]",
        "",
        "local __FIVE_AM_BUNDLED = true",
        "local __bundle_sources = {}",
        "local __bundle_cache = {}",
        "local __bundle_loaded = {}",
        "local __bundle_loading = {}",
        "local __bundle_compiler = loadstring",
        "local __bundle_set_environment = setfenv",
        "local __bundle_base_environment = getfenv(0)",
        "local __bundle_require",
        "",
        "if type(__bundle_compiler) ~= \"function\" or type(__bundle_set_environment) ~= \"function\" then",
        "    error(\"5AM Hub requires loadstring and setfenv support\", 0)",
        "end",
        "",
    ];

    for (const moduleRecord of transformedModules) {
        const dependencyLabel = moduleRecord.dependencies.length > 0
            ? moduleRecord.dependencies.join(", ")
            : "none";
        chunks.push(`-- Module: ${moduleRecord.relativePath} (dependencies: ${dependencyLabel})`);
        chunks.push(`__bundle_sources[${JSON.stringify(moduleRecord.name)}] = ${RenderLuaLongString(moduleRecord.source)}`);
        chunks.push("");
    }

    chunks.push("__bundle_require = function(moduleName)");
    chunks.push("    if __bundle_loaded[moduleName] then");
    chunks.push("        return __bundle_cache[moduleName]");
    chunks.push("    end");
    chunks.push("");
    chunks.push("    local moduleSource = __bundle_sources[moduleName]");
    chunks.push("    if not moduleSource then");
    chunks.push("        error(string.format(\"5AM bundle module %q does not exist\", tostring(moduleName)), 2)");
    chunks.push("    end");
    chunks.push("    if __bundle_loading[moduleName] then");
    chunks.push("        error(string.format(\"Circular 5AM bundle dependency involving %q\", tostring(moduleName)), 2)");
    chunks.push("    end");
    chunks.push("");
    chunks.push("    __bundle_loading[moduleName] = true");
    chunks.push("    local moduleChunk, compileError = __bundle_compiler(moduleSource)");
    chunks.push("    if type(moduleChunk) ~= \"function\" then");
    chunks.push("        __bundle_loading[moduleName] = nil");
    chunks.push("        error(string.format(\"Failed to compile bundled module %q: %s\", tostring(moduleName), tostring(compileError)), 0)");
    chunks.push("    end");
    chunks.push("");
    chunks.push("    local moduleEnvironment = setmetatable({");
    chunks.push("        __FIVE_AM_BUNDLED = __FIVE_AM_BUNDLED,");
    chunks.push("        __bundle_require = __bundle_require,");
    chunks.push("        script = false,");
    chunks.push("    }, {");
    chunks.push("        __index = __bundle_base_environment,");
    chunks.push("        __newindex = __bundle_base_environment,");
    chunks.push("    })");
    chunks.push("    __bundle_set_environment(moduleChunk, moduleEnvironment)");
    chunks.push("");
    chunks.push("    local success, valueOrError = pcall(moduleChunk)");
    chunks.push("    __bundle_loading[moduleName] = nil");
    chunks.push("");
    chunks.push("    if not success then");
    chunks.push("        error(string.format(\"Failed to load bundled module %q: %s\", tostring(moduleName), tostring(valueOrError)), 0)");
    chunks.push("    end");
    chunks.push("    if valueOrError == nil then");
    chunks.push("        error(string.format(\"Bundled module %q returned nil\", tostring(moduleName)), 0)");
    chunks.push("    end");
    chunks.push("");
    chunks.push("    __bundle_cache[moduleName] = valueOrError");
    chunks.push("    __bundle_loaded[moduleName] = true");
    chunks.push("    return valueOrError");
    chunks.push("end");
    chunks.push("");
    chunks.push(`local __loader = __bundle_require(${JSON.stringify(entryModule)})`);
    chunks.push(`local __ui = __bundle_require(${JSON.stringify(uiModule)})`);
    chunks.push(`local __universal = __bundle_require(${JSON.stringify(universalModule)})`);
    chunks.push("local __registry = __loader.RegistryClass.new(nil)");
    chunks.push("local __registered, __registrationError = __registry:RegisterUniversal(__universal)");
    chunks.push("if not __registered then");
    chunks.push("    error(string.format(\"5AM universal module registration failed: %s\", tostring(__registrationError)), 0)");
    chunks.push("end");
    for (const [index, registration] of gameRegistrations.entries()) {
        const suffix = index + 1;
        chunks.push(`local __game_registered_${suffix}, __game_registration_error_${suffix} = __registry:Register(`);
        chunks.push(`    ${registration.placeId},`);
        chunks.push(`    __bundle_require(${JSON.stringify(registration.moduleName)})`);
        chunks.push(")");
        chunks.push(`if not __game_registered_${suffix} then`);
        chunks.push(
            `    error(string.format(\"5AM game module registration failed for PlaceId ${registration.placeId}: %s\", tostring(__game_registration_error_${suffix})), 0)`,
        );
        chunks.push("end");
    }
    chunks.push("__registry.Discover = false");
    chunks.push("");
    chunks.push("local __environment = __loader.Utils:GetEnvironment()");
    chunks.push("local __providedKey = __environment.FiveAMKey or __environment.HubKey");
    chunks.push("if (type(__providedKey) ~= \"string\" or __providedKey == \"\") and type(__environment._G) == \"table\" then");
    chunks.push("    __providedKey = __environment._G.FiveAMKey or __environment._G.HubKey");
    chunks.push("end");
    chunks.push("");
    chunks.push("local __startResult = __loader:Start({");
    chunks.push("    Key = __providedKey,");
    chunks.push("    UI = __ui,");
    chunks.push("    Registry = __registry,");
    chunks.push("})");
    chunks.push("__loader.LastStartResult = __startResult");
    chunks.push("if not __startResult.Success then");
    chunks.push("    error(string.format(\"5AM Hub startup failed [%s]: %s\", tostring(__startResult.Code), tostring(__startResult.Message)), 0)");
    chunks.push("end");
    chunks.push("if type(__startResult.Game) ~= \"table\" or __startResult.Game.Success ~= true then");
    chunks.push("    local gameMessage = if type(__startResult.Game) == \"table\" then __startResult.Game.Message else \"No game result was returned\"");
    chunks.push("    local gameErrors = if type(__startResult.Game) == \"table\" then __startResult.Game.Errors else nil");
    chunks.push("    if type(gameErrors) == \"table\" and gameErrors[1] then");
    chunks.push("        gameMessage = string.format(\"%s (%s: %s)\", tostring(gameMessage), tostring(gameErrors[1].Code), tostring(gameErrors[1].Message))");
    chunks.push("    end");
    chunks.push("    error(string.format(\"5AM Hub module initialization failed: %s\", tostring(gameMessage)), 0)");
    chunks.push("end");
    chunks.push("");
    chunks.push("return __loader");
    chunks.push("");

    return {
        buildId,
        content: chunks.join("\n"),
        modules: transformedModules,
        games: gameRegistrations,
    };
}

function WriteBundle(bundle, checkOnly) {
    const existing = fs.existsSync(outputFile) ? fs.readFileSync(outputFile, "utf8") : null;

    if (checkOnly) {
        if (existing !== bundle.content) {
            Fail("dist/loader.lua is missing or out of date; run node tools/build.js");
        }
        console.log(`[5AM build] dist/loader.lua is current (${bundle.buildId})`);
        return;
    }

    fs.mkdirSync(outputDirectory, { recursive: true });
    if (existing !== bundle.content) {
        fs.writeFileSync(outputFile, bundle.content, "utf8");
        console.log(`[5AM build] wrote dist/loader.lua (${bundle.buildId})`);
    } else {
        console.log(`[5AM build] dist/loader.lua is already current (${bundle.buildId})`);
    }
    console.log(`[5AM build] bundled ${bundle.modules.length} modules`);
    console.log(`[5AM build] registered ${bundle.games.length} game module(s)`);
}

function Main() {
    const argumentsList = process.argv.slice(2);
    if (argumentsList.includes("--help")) {
        console.log("Usage: node tools/build.js [--check]");
        return;
    }

    const unknownArguments = argumentsList.filter((argument) => argument !== "--check");
    if (unknownArguments.length > 0) {
        Fail(`Unknown argument(s): ${unknownArguments.join(", ")}`);
    }

    const gameRegistrations = ReadGameRegistrations();
    const modules = ReadModules(gameRegistrations);
    const bundle = RenderBundle(modules, gameRegistrations);
    WriteBundle(bundle, argumentsList.includes("--check"));
}

try {
    Main();
} catch (error) {
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
}
