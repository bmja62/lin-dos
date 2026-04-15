TREE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function TREE() {
    local help_file="${TREE_DIR}/tree-help.txt"

    if [[ "$1" == "/?" ]]; then
        cat "$help_file"
        return 0
    fi

    if [ $# -eq 0 ]; then
        # If no directory is specified, use the current directory
        dir="."
    else
        # Use the given directory
        dir="$1"
    fi

    # Recursive list with indentation to mimic tree structure
    ls -R "$dir" | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
}
