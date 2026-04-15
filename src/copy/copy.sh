COPY_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function COPY() {
    local help_file="${COPY_DIR}/copy-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [ "$1" == "con" ]; then
        if [ -z "$2" ]; then
            echo "No filename provided. Usage: copy con <filename>"
            return 1
        fi

        local filename="$2"
        echo "Type content and press CTRL-D at the start of a new line to finish."
        cat > "$filename"
    else
        echo "Invalid command. Usage: copy con <filename>"
    fi
}
