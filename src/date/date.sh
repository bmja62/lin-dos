DATE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function DATE() {
    local help_file="${DATE_DIR}/date-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [[ "$1" == "/T" ]]; then
        date +"%a %m/%d/%Y"
        return 0
    fi

    if [[ -n "$1" ]]; then
        echo "The syntax of the command is incorrect."
        return 1
    fi

    echo "The current date is: $(date +"%a %m/%d/%Y")"
    echo "Enter the new date: (mm-dd-yy)"
    IFS= read -r _
    return 0
}
