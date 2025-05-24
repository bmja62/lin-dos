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