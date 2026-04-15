function TIME() {
    if [[ "$1" == "/?" ]]; then
        echo "Displays or sets the system time."
        echo
        echo "TIME [/T | time]"
        echo
        echo "Type TIME with no parameters to display the current time setting and a prompt"
        echo "for a new one.  Press ENTER to keep the same time."
        echo
        echo "If Command Extensions are enabled the TIME command supports"
        echo "the /T switch which tells the command to just output the"
        echo "current time, without prompting for a new time."
        return 0
    fi

    if [[ "$1" == "/T" ]]; then
        date +"%H:%M:%S.%2N"
        return 0
    fi

    if [[ -n "$1" ]]; then
        echo "The syntax of the command is incorrect."
        return 1
    fi

    echo "The current time is: $(date +"%H:%M:%S.%2N")"
    echo "Enter the new time:"
    IFS= read -r _
    return 0
}
