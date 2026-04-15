MD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function MD() {
    local help_file="${MD_DIR}/md-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [ -z "$1" ]; then
        echo "Usage: Md directory_name"
        return 1
    fi

    mkdir -p "$@"
    echo "Directory created: $@"
}
