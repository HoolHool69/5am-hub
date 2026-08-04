#!/usr/bin/env bash

set -euo pipefail

# 5AM Hub Luarmor handoff
#
# Builds dist/loader.lua and validates the artifact that will be uploaded. The
# upload invocation remains commented until the Luarmor CLI and its credentials
# are configured for this repository.

script_directory="$(cd -- "${BASH_SOURCE[0]%/*}" && pwd)"
project_root="$(cd -- "${script_directory}/.." && pwd)"
input_file="${project_root}/dist/loader.lua"
output_file="${project_root}/dist/loader.obfuscated.lua"

if ! command -v node >/dev/null 2>&1; then
    printf '%s\n' "[5AM obfuscate] Node.js is required to build the loader." >&2
    exit 1
fi

node "${project_root}/tools/build.js"

if [[ ! -s "${input_file}" ]]; then
    printf '%s\n' "[5AM obfuscate] Build artifact is missing or empty: ${input_file}" >&2
    exit 1
fi

printf '%s\n' "[5AM obfuscate] Ready for Luarmor upload: ${input_file}"
printf '%s\n' "[5AM obfuscate] Expected obfuscated output: ${output_file}"

# Future Luarmor CLI integration goes here. Replace this placeholder with the
# upload command supplied by Luarmor's project-specific upload tool:
# luarmor upload --input "${input_file}" --output "${output_file}"
