# 5AM Hub Repository Instructions

5AM Hub is a Roblox client-side modification framework for executor environments. Maintain it as a modular Luau codebase with shared loading and UI infrastructure plus isolated game integrations.

## Game Modules

- Add new games only beneath `games/<placeid>_<name>/`; do not modify `loader/` or `ui/` while adding game support.
- Every game module must return a table containing a `Meta` table and an `Init = function(UI, Loader)` function.
- Route every game remote call through that game's `remotes.lua` module.
- Persist every feature toggle through `UI.Flags`.
- Use the shared UI library rather than defining inline UI components in game modules.

## UI Contract

Use the Fluent-style API: `Window:AddTab()`, `Tab:AddSection()`, and the section methods `AddToggle()`, `AddSlider()`, `AddButton()`, `AddDropdown()`, `AddKeybind()`, `AddColorpicker()`, and `AddTextbox()`.

## Code Style

Use `--!strict` where practical, four-space indentation, no tabs, PascalCase for functions and classes, camelCase for local variables, and descriptive names.

## Branding

Use the name `5AM Hub`, deep-purple accent `#8B5CF6`, a soft dark-grey background, `Title = "5AM Hub"`, and the current game name as `SubTitle`.

