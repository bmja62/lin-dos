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