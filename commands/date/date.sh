function DATE() {
    if [[ "$1" == "/?" ]]; then
        echo "Displays or sets the date."
        echo
        echo "DATE [/T | date]"
        echo
        echo "Type DATE without parameters to display the current date setting and"
        echo "a prompt for a new one.  Press ENTER to keep the same date."
        echo
        echo "If Command Extensions are enabled the DATE command supports"
        echo "the /T switch which tells the command to just output the"
        echo "current date, without prompting for a new date."
        return 0
    fi

    if [[ "$1" == "/T" ]]; then
        date +"%a %m/%d/%Y"
        return 0
    fi

    if [[ -n "$1" ]]; then
        echo "The syntax of the command is incorrect."
        return 1
    fi

    echo "The current date is: $(date +"%a %m/%d/%Y")"
    echo "Enter the new date: (mm-dd-yy)"
    IFS= read -r _
    return 0
}
