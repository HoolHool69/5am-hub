# 5AM Hub

## Overview

5AM Hub is a modular Roblox client-side script framework organized around a shared loader, a Fluent-style UI library, and isolated modules for supported games.

## Installation

Replace `OWNER` with the repository owner, then run the loader through a compatible client environment:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/OWNER/5am-hub/main/loader/init.lua"))()
```

## Features

- Reusable loading and game-registration architecture
- Shared Fluent-style UI components and persistent flags
- Theme support with the 5AM Hub visual identity
- Per-game remote and feature isolation
- Universal movement, player ESP, anti-AFK, server, and FPS utilities

## Supported Games

No game-specific modules are implemented yet. Every place receives the working `games/_universal/` fallback. Use the fully commented `games/_template/` package as the starting structure for future integrations.

## Building

Bundle the loader modules into the publishable artifact:

```text
node tools/build.js
```

Use `node tools/build.js --check` to verify that `dist/loader.lua` is current.
`tools/obfuscate.sh` prepares that artifact for the project-specific Luarmor CLI,
and `node tools/deploy.js --dry-run` previews the commit and push workflow. Running
`node tools/deploy.js -m "your commit message"` builds, stages the repository,
commits any changes, and pushes the current branch.
