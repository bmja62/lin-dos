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