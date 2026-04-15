CLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function CLS() {
    local help_file="${CLS_DIR}/cls-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    clear
}
