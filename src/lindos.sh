#!/usr/bin/env bash
# Sourced from ~/.bashrc — defines the lindos command for the current shell.

lindos() {
    local root="${LIN_DOS_HOME:-$HOME/.local/share/lin-dos}"
    local sub="${1:-}"

    case "${sub}" in
        "")
            if [[ ! -f "${root}/command.com" ]]; then
                echo "LIN-DOS is not installed at ${root}. Install from the project README." >&2
                return 1
            fi
            # shellcheck source=command.com
            source "${root}/command.com"
            ;;
        update)
            local repo="${LIN_DOS_REPO:-bmja62/lin-dos}"
            local branch="${LIN_DOS_BRANCH:-main}"
            local url="${LIN_DOS_SETUP_URL:-https://raw.githubusercontent.com/${repo}/${branch}/src/setup.exe}"
            curl -fsSL "${url}" | bash || return 1
            if [[ -f "${root}/command.com" ]]; then
                # shellcheck source=command.com
                source "${root}/command.com"
            fi
            ;;
        help | -h | --help)
            printf '%s\n' \
                "lindos         Load LIN-DOS commands into this shell." \
                "lindos update  Download and install the latest LIN-DOS, then reload commands here." \
                "lindos help    Show this help."
            ;;
        *)
            echo "lindos: unknown command '${sub}' (try: lindos help)" >&2
            return 1
            ;;
    esac
}
