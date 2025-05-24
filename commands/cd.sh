function CD() {
    if [ $# -eq 0 ]; then
        # If no arguments, print the current directory
        pwd
    else
        # Otherwise, change to the directory provided as the argument
        builtin cd "$@" && pwd
    fi
}