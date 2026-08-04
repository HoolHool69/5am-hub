#!/usr/bin/env node

/**
 * 5AM Hub loader bundler.
 *
 * Collects every direct `loader/*.lua` module, rewrites static sibling-module
 * requires to an internal lazy module registry, and emits `dist/loader.lua`.
 * Runtime requires performed by loader utilities are intentionally preserved.
 */

"use strict";

const crypto = require("node:crypto");
const fs = require("node:fs");
const path = require("node:path");

const projectRoot = path.resolve(__dirname, "..");
const loaderDirectory = path.join(projectRoot, "loader");
const outputDirectory = path.join(projectRoot, "dist");
const outputFile = path.join(outputDirectory, "loader.lua");
const entryModule = "init";

function Fail(message) {
    throw new Error(`[5AM build] ${message}`);
}

function EscapeRegularExpression(value) {
    return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function ReadModules() {
    if (!fs.existsSync(loaderDirectory)) {
        Fail(`Loader directory does not exist: ${loaderDirectory}`);
    }

    const moduleFiles = fs.readdirSync(loaderDirectory, { withFileTypes: true })
        .filter((entry) => entry.isFile() && entry.name.endsWith(".lua"))
        .sort((left, right) => left.name.localeCompare(right.name));

    if (moduleFiles.length === 0) {
        Fail("No loader/*.lua modules were found");
    }

    const modules = new Map();
    for (const moduleFile of moduleFiles) {
        const moduleName = path.basename(moduleFile.name, ".lua");
        const sourcePath = path.join(loaderDirectory, moduleFile.name);
        const source = fs.readFileSync(sourcePath, "utf8")
            .replace(/^\uFEFF/, "")
            .replace(/\r\n/g, "\n");

        if (modules.has(moduleName)) {
            Fail(`Duplicate loader module name: ${moduleName}`);
        }

        modules.set(moduleName, {
            name: moduleName,
            fileName: moduleFile.name,
            source,
        });
    }

    if (!modules.has(entryModule)) {
        Fail(`Entry module loader/${entryModule}.lua is missing`);
    }

    return modules;
}

function TransformModule(moduleRecord, availableModules) {
    const dependencies = new Set();
    const moduleVariables = new Map();
    let source = moduleRecord.source.replace(/^--!strict\s*\n/, "");

    function RegisterDependency(dependencyName) {
        if (!availableModules.has(dependencyName)) {
            Fail(`${moduleRecord.fileName} requires missing loader module ${dependencyName}.lua`);
        }
        dependencies.add(dependencyName);
        return `__bundle_require(${JSON.stringify(dependencyName)})`;
    }

    // loader/init.lua resolves sibling ModuleScripts through FindLoaderModule
    // before passing the resulting variable to require. Convert those locator
    // declarations into stable bundle identifiers, then resolve their requires.
    source = source.replace(
        /^[ \t]*local\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*assert\(FindLoaderModule\("([A-Za-z0-9_-]+)"\),\s*"[^"\n]*"\)\s*$/gm,
        (_match, variableName, dependencyName) => {
            moduleVariables.set(variableName, dependencyName);
            return `local ${variableName} = ${JSON.stringify(dependencyName)} -- bundled module reference`;
        },
    );

    source = source.replace(
        /^[ \t]*local\s+([A-Za-z_][A-Za-z0-9_]*)\s*=\s*assert\(FindLoaderModule\('([A-Za-z0-9_-]+)'\),\s*'[^'\n]*'\)\s*$/gm,
        (_match, variableName, dependencyName) => {
            moduleVariables.set(variableName, dependencyName);
            return `local ${variableName} = ${JSON.stringify(dependencyName)} -- bundled module reference`;
        },
    );

    for (const [variableName, dependencyName] of moduleVariables) {
        const requireVariablePattern = new RegExp(
            `\\brequire\\s*\\(\\s*${EscapeRegularExpression(variableName)}\\s*\\)`,
            "g",
        );
        source = source.replace(requireVariablePattern, () => RegisterDependency(dependencyName));
    }

    // Resolve direct sibling patterns used by loader/keysystem.lua and
    // loader/registry.lua. Parent depth is irrelevant because every loader file
    // is bundled into the same internal namespace.
    source = source.replace(
        /\brequire\s*\(\s*script(?:\.Parent)*:WaitForChild\(\s*["']([A-Za-z0-9_-]+)["']\s*\)\s*\)/g,
        (_match, dependencyName) => RegisterDependency(dependencyName),
    );
    source = source.replace(
        /\brequire\s*\(\s*script(?:\.Parent)*:FindFirstChild\(\s*["']([A-Za-z0-9_-]+)["']\s*\)\s*\)/g,
        (_match, dependencyName) => RegisterDependency(dependencyName),
    );
    source = source.replace(
        /\brequire\s*\(\s*script(?:\.Parent)*\.([A-Za-z_][A-Za-z0-9_]*)\s*\)/g,
        (_match, dependencyName) => RegisterDependency(dependencyName),
    );

    // A call-form require that remains here is ambiguous and would make the
    // supposedly standalone artifact depend on an unresolved loader ModuleScript.
    // Function references such as pcall(require, moduleReference) remain valid.
    const unresolvedRequire = source.match(/\brequire\s*\(/);
    if (unresolvedRequire) {
        Fail(`${moduleRecord.fileName} contains an unresolved require(...) expression`);
    }

    return {
        ...moduleRecord,
        dependencies: [...dependencies].sort(),
        source: source.trimEnd(),
    };
}

function RenderBundle(modules) {
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
        "    5AM Hub bundled loader",
        "    Generated by tools/build.js; edit loader/*.lua instead.",
        `    Build ID: ${buildId}`,
        "]]",
        "",
        "local __bundle_modules = {}",
        "local __bundle_cache = {}",
        "local __bundle_loaded = {}",
        "local __bundle_loading = {}",
        "local __bundle_require",
        "",
    ];

    for (const moduleRecord of transformedModules) {
        const dependencyLabel = moduleRecord.dependencies.length > 0
            ? moduleRecord.dependencies.join(", ")
            : "none";

        chunks.push(`-- Module: loader/${moduleRecord.fileName} (dependencies: ${dependencyLabel})`);
        chunks.push(`__bundle_modules[${JSON.stringify(moduleRecord.name)}] = function()`);
        chunks.push(moduleRecord.source);
        chunks.push("end");
        chunks.push("");
    }

    chunks.push("__bundle_require = function(moduleName)");
    chunks.push("    if __bundle_loaded[moduleName] then");
    chunks.push("        return __bundle_cache[moduleName]");
    chunks.push("    end");
    chunks.push("");
    chunks.push("    local moduleFactory = __bundle_modules[moduleName]");
    chunks.push("    if not moduleFactory then");
    chunks.push("        error(string.format(\"5AM bundle module %q does not exist\", tostring(moduleName)), 2)");
    chunks.push("    end");
    chunks.push("    if __bundle_loading[moduleName] then");
    chunks.push("        error(string.format(\"Circular 5AM bundle dependency involving %q\", tostring(moduleName)), 2)");
    chunks.push("    end");
    chunks.push("");
    chunks.push("    __bundle_loading[moduleName] = true");
    chunks.push("    local success, valueOrError = pcall(moduleFactory)");
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
    chunks.push(`return __bundle_require(${JSON.stringify(entryModule)})`);
    chunks.push("");

    return {
        buildId,
        content: chunks.join("\n"),
        modules: transformedModules,
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

    console.log(`[5AM build] bundled modules: ${bundle.modules.map((record) => record.name).join(", ")}`);
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

    const modules = ReadModules();
    const bundle = RenderBundle(modules);
    WriteBundle(bundle, argumentsList.includes("--check"));
}

try {
    Main();
} catch (error) {
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
}
