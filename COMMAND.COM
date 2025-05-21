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
	else 
	    clear
	fi	

}

function VER() {
  if [[ "$1" == "/?" ]]; then
    echo "Displays the Linux version."
    echo 
    echo "VER"
    echo 
  else 
    echo
    cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'
    echo 
  fi
}

function TYPE() {
    if [ -z "$1" ]; then
        echo "The syntax of the command is incorrect."
        return 1
    fi
    if [ ! -f "$1" ]; then
        echo "The system cannot find the file specified."
        return 1
    fi
    cat "$1"
    echo
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
