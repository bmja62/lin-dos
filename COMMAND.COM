echo
echo "Starting LIN-DOS..."
echo 
echo 

function CLS() {
	if [[ "$1" == "/?" ]]; then
	    echo "Clears the screen."
	    echo 
	    echo "CLS"
	    echo
	    return 0
	fi 

	clear
}

function VER() {
  if [[ "$1" == "/?" ]]; then
    echo "Displays the Linux version."
    echo 
    echo "VER"
    echo
    return 0
  fi

    echo
    cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'
    echo 
}

function TYPE() {
    if [[ "$1" == "/?" ]]; then
	    echo "Displays the contents of a text file or files."
	    echo 
	    echo "TYPE [path]filename"
	    echo
	    return 0
    fi

    if [ -z "$1" ]; then
        echo "The syntax of the command is incorrect."
	echo
        return 1
    fi

    shopt -s nullglob
    local files=(echo "$1")
    shopt -u nullglob
    local count=${#files[@]}

    if [[ $count -eq 0 ]]; then
        echo "The system cannot find the file specified."
	echo
        return 1
    fi

    if [[ $count -eq 1 ]]; then
       cat "$1"
       echo
       return 0
    fi 

     if [[ $count -gt 1 ]]; then
        for file in "${files[@]}"; do
            echo
            echo "$file"
            echo
            cat "$file"
        done
     fi
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
