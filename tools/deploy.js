#!/usr/bin/env node

/**
 * Builds, commits, and pushes the current 5AM Hub branch.
 *
 * The script uses argument arrays instead of a shell, refuses detached HEAD,
 * and never force-pushes. Run with --dry-run to inspect the deployment plan.
 */

"use strict";

const { spawnSync } = require("node:child_process");
const path = require("node:path");

const projectRoot = path.resolve(__dirname, "..");

function Fail(message) {
    throw new Error(`[5AM deploy] ${message}`);
}

function FormatCommand(command, argumentsList) {
    const renderedArguments = argumentsList.map((argument) => {
        const text = String(argument);
        return /[\s"]/u.test(text) ? JSON.stringify(text) : text;
    });
    return [command, ...renderedArguments].join(" ");
}

function Run(command, argumentsList, options = {}) {
    const allowedStatuses = options.allowedStatuses || [0];
    if (options.announce !== false) {
        console.log(`[5AM deploy] + ${FormatCommand(command, argumentsList)}`);
    }

    const result = spawnSync(command, argumentsList, {
        cwd: projectRoot,
        encoding: "utf8",
        stdio: options.capture ? "pipe" : "inherit",
        windowsHide: true,
    });

    if (result.error) {
        Fail(`${command} could not be started: ${result.error.message}`);
    }
    if (!allowedStatuses.includes(result.status)) {
        const detail = options.capture ? (result.stderr || result.stdout || "").trim() : "";
        Fail(`${FormatCommand(command, argumentsList)} exited with ${result.status}${detail ? `: ${detail}` : ""}`);
    }

    return result;
}

function ReadGit(argumentsList) {
    return Run("git", argumentsList, { capture: true, announce: false }).stdout.trim();
}

function ParseArguments(argumentsList) {
    const options = {
        dryRun: false,
        runBuild: true,
        remote: "origin",
        message: "chore: deploy 5AM Hub",
    };

    for (let index = 0; index < argumentsList.length; index += 1) {
        const argument = argumentsList[index];
        if (argument === "--dry-run") {
            options.dryRun = true;
        } else if (argument === "--no-build") {
            options.runBuild = false;
        } else if (argument === "--remote") {
            options.remote = argumentsList[++index];
            if (!options.remote) {
                Fail("--remote requires a remote name");
            }
        } else if (argument === "--message" || argument === "-m") {
            options.message = argumentsList[++index];
            if (!options.message) {
                Fail(`${argument} requires a commit message`);
            }
        } else if (argument === "--help") {
            options.help = true;
        } else {
            Fail(`Unknown argument: ${argument}`);
        }
    }

    return options;
}

function GithubCoordinates(remoteUrl) {
    const match = remoteUrl.match(/github\.com[/:]([^/]+)\/([^/]+?)(?:\.git)?$/iu);
    if (!match) {
        return null;
    }

    return {
        owner: match[1],
        repository: match[2],
    };
}

function EncodePath(value) {
    return value.split("/").map(encodeURIComponent).join("/");
}

function Main() {
    const options = ParseArguments(process.argv.slice(2));
    if (options.help) {
        console.log("Usage: node tools/deploy.js [--dry-run] [--no-build] [--remote origin] [-m message]");
        return;
    }

    const repositoryRoot = ReadGit(["rev-parse", "--show-toplevel"]);
    if (path.resolve(repositoryRoot) !== projectRoot) {
        Fail(`Expected Git root ${projectRoot}, received ${repositoryRoot}`);
    }

    const branch = ReadGit(["branch", "--show-current"]);
    if (!branch) {
        Fail("Refusing to deploy from a detached HEAD");
    }

    const remoteUrl = ReadGit(["remote", "get-url", options.remote]);
    const coordinates = GithubCoordinates(remoteUrl);
    const rawGithackUrl = coordinates
        ? `https://raw.githack.com/${EncodePath(coordinates.owner)}/${EncodePath(coordinates.repository)}/${EncodePath(branch)}/dist/loader.lua`
        : null;

    if (options.dryRun) {
        if (options.runBuild) {
            console.log(`[5AM deploy] would run: ${FormatCommand(process.execPath, ["tools/build.js"])}`);
        }
        console.log("[5AM deploy] would run: git add --all");
        console.log(`[5AM deploy] would commit staged changes with: ${options.message}`);
        console.log(`[5AM deploy] would run: git push ${options.remote} ${branch}`);
        if (rawGithackUrl) {
            console.log(`[5AM deploy] raw.githack URL: ${rawGithackUrl}`);
        }
        return;
    }

    if (options.runBuild) {
        Run(process.execPath, [path.join("tools", "build.js")]);
    }

    Run("git", ["add", "--all"]);
    const stagedStatus = Run("git", ["diff", "--cached", "--quiet"], {
        allowedStatuses: [0, 1],
        announce: false,
        capture: true,
    }).status;

    if (stagedStatus === 1) {
        Run("git", ["commit", "-m", options.message]);
    } else {
        console.log("[5AM deploy] no changes to commit; pushing the current branch");
    }

    Run("git", ["push", options.remote, branch]);
    console.log(`[5AM deploy] pushed ${branch} to ${options.remote}`);
    if (rawGithackUrl) {
        console.log(`[5AM deploy] loader URL: ${rawGithackUrl}`);
    } else {
        console.log("[5AM deploy] remote is not a GitHub URL, so a raw.githack URL could not be generated");
    }
}

try {
    Main();
} catch (error) {
    console.error(error instanceof Error ? error.message : String(error));
    process.exitCode = 1;
}
