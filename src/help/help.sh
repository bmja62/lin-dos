HELP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIN_DOS_SRC_DIR="$(cd "${HELP_DIR}/.." && pwd)"

function HELP() {
    local help_file="${HELP_DIR}/help-help.txt"

    if [[ "$1" == "/?" ]] || [[ -z "$1" ]]; then
        cat "$help_file"
        return 0
    fi

    local command_name
    command_name="$(echo "$1" | tr '[:upper:]' '[:lower:]')"
    local command_help_file="${LIN_DOS_SRC_DIR}/${command_name}/${command_name}-help.txt"
    if [[ -f "$command_help_file" ]]; then
        cat "$command_help_file"
        return 0
    fi

    echo "This command is not supported by the help utility."
    return 1
}
