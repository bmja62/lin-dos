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