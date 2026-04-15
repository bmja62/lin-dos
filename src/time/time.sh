TIME_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function TIME() {
    local help_file="${TIME_DIR}/time-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [[ "$1" == "/T" ]]; then
        date +"%H:%M:%S.%2N"
        return 0
    fi

    if [[ -n "$1" ]]; then
        echo "The syntax of the command is incorrect."
        return 1
    fi

    echo "The current time is: $(date +"%H:%M:%S.%2N")"
    echo "Enter the new time:"
    IFS= read -r _
    return 0
}
