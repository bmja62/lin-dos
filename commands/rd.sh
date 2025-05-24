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