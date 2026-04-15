VER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function VER() {
  local help_file="${VER_DIR}/ver-help.txt"

  if [[ "$1" == "/?" ]]; then
    cat "$help_file"
    return 0
  fi

    echo
    cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'
    echo 
}
