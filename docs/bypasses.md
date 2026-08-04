# Anti-Cheat Bypass Patterns

This document is the integration reference for compatibility hooks discovered
during game analysis. Game-specific implementations belong in that game's
feature files, while remote access remains isolated in its `remotes.lua` file.
The snippets below are intentionally placeholders: record the observed check,
its call path, and the minimum hook necessary before adding implementation code.

## Metatable hooks with `newcclosure`

Some client checks inspect or depend on metamethod behavior for Roblox instances.
When analysis confirms that a metatable hook is required, wrap the callback with
`newcclosure` so the replacement has the executor-native closure boundary expected
by common hook implementations.

Document these details before implementation:

- The exact metatable and metamethod being observed.
- The caller or script that should be filtered.
- Which calls must continue to the original function unchanged.
- Hook ownership and restoration behavior during unload.

```lua
-- PLACEHOLDER: capture the original metamethod.
-- PLACEHOLDER: install the smallest filtered newcclosure wrapper.
-- PLACEHOLDER: forward every unrelated call to the original metamethod.
```

Avoid stacking anonymous wrappers on repeated initialization. Store the original
function once and make the installed hook idempotent.

## `__namecall` wrapping with `hookmetamethod`

`hookmetamethod` can wrap `__namecall` when a client-side detector routes several
instance methods through a shared interception point. Filtering should use both
the invoked method and the target instance; method-only filters are too broad and
can break unrelated game behavior.

```lua
-- PLACEHOLDER: retain the original __namecall implementation.
-- PLACEHOLDER: identify the analyzed target and method combination.
-- PLACEHOLDER: handle only the confirmed check, then forward all other calls.
```

Keep argument handling lossless. Preserve vararg count, including trailing `nil`
values, and do not yield inside a metamethod unless the original path also yields.

## Remote spy evasion

Remote spies commonly instrument `FireServer`, `InvokeServer`, or `__namecall` to
record traffic. If a game module must coexist with such instrumentation, first
identify whether the spy replaces a function, wraps a metamethod, or subscribes
to an executor callback. Evasion must stay scoped to calls made by the analyzed
feature; global suppression can hide useful diagnostics and destabilize the game.

```lua
-- PLACEHOLDER: identify the active remote-spy interception layer.
-- PLACEHOLDER: route the specific wrapped call through the verified original.
-- PLACEHOLDER: restore normal instrumentation immediately after the call.
```

All feature code still calls the game's `remotes.lua` wrapper. Any compatibility
path belongs inside that wrapper so remote behavior remains auditable.

## Kick hooks

Client checks may call `LocalPlayer:Kick()` directly or invoke it through
`__namecall`. A kick hook should distinguish the analyzed anti-cheat call from
developer/admin kicks and unrelated methods. Capture evidence such as calling
script, message shape, and stack identity before defining a filter.

```lua
-- PLACEHOLDER: capture the original Kick/__namecall path.
-- PLACEHOLDER: match only the confirmed anti-cheat kick signature.
-- PLACEHOLDER: forward every non-matching call without modification.
```

Install the hook before the detector initializes when analysis proves ordering is
relevant. Record that ordering requirement beside the game module's initialization.

## Teleport bypasses

Teleport restrictions may be implemented through `TeleportService` method hooks,
local state gates, or listeners that cancel/reverse a transition. Determine which
layer owns the restriction before changing behavior. Rejoin and server-hop actions
should continue to use `TeleportService` and report failures through the shared UI.

```lua
-- PLACEHOLDER: identify the blocked TeleportService method or local state gate.
-- PLACEHOLDER: bypass only the confirmed restriction for the requested action.
-- PLACEHOLDER: restore temporary state and listeners after the teleport begins.
```

Account for public servers, reserved/private servers, and place-to-place teleports
separately; their methods and parameters are not interchangeable.

## Implementation checklist

Before replacing any placeholder:

1. Record the source script, call path, and observed arguments.
2. Confirm the hook is client-local and specific to the target game package.
3. Preserve the original function and forward all unrelated calls.
4. Make initialization idempotent and add deterministic unload cleanup.
5. Keep remote calls inside `games/<placeid>_<name>/remotes.lua`.
6. Test respawn, rejoin, and repeated loader initialization paths.
