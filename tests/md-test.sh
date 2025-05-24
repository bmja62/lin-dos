function MD() {
    if [ -z "$1" ]; then
        echo "Usage: Md directory_name"
        return 1
    fi

    mkdir -p "$@"
    echo "Directory created: $@"
}