CD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function CD() {
    local help_file="${CD_DIR}/cd-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [ $# -eq 0 ]; then
        # If no arguments, print the current directory
        pwd
    else
        # Otherwise, change to the directory provided as the argument
        builtin cd "$@" && pwd
    fi
}
