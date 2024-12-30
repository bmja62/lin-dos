echo "Starting Lin-DOS"

function CLS() {
	clear
}

function RD() {
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

function TREE() {
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

function COPY() {
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

function VER() {
    echo "Bash version: $BASH_VERSION"
    echo "OS Information:"
    uname -a
}

function TYPE() {
    if [ -z "$1" ]; then
        echo "Usage: Type filename"
        return 1
    fi

    local filename="$1"

    if [ ! -f "$filename" ]; then
        echo "Error: '$filename' does not exist."
        return 1
    fi

    cat "$filename"
}


function MD() {
    if [ -z "$1" ]; then
        echo "Usage: Md directory_name"
        return 1
    fi

    mkdir -p "$@"
    echo "Directory created: $@"
}


function CD() {
    if [ $# -eq 0 ]; then
        # If no arguments, print the current directory
        pwd
    else
        # Otherwise, change to the directory provided as the argument
        builtin cd "$@" && pwd
    fi
}
