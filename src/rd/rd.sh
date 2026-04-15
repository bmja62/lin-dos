RD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function RD() {
    local help_file="${RD_DIR}/rd-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [ -z "$1" ]; then
        echo "Usage: rd directory_name"
        return 1
    fi

    # Check if the directory is empty
    if [ "$(ls -A $1)" ]; then
        echo "Error: Directory '$1' is not empty."
        return 1
    else
        rmdir "$1"
        echo "Directory removed: $1"
    fi
}
