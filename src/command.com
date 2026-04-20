#!/usr/bin/env bash
_LIN_DOS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${_LIN_DOS_ROOT}/cd/cd.sh"
source "${_LIN_DOS_ROOT}/cls/cls.sh"
source "${_LIN_DOS_ROOT}/copy/copy.sh"
source "${_LIN_DOS_ROOT}/date/date.sh"
source "${_LIN_DOS_ROOT}/help/help.sh"
source "${_LIN_DOS_ROOT}/md/md.sh"
source "${_LIN_DOS_ROOT}/rd/rd.sh"
source "${_LIN_DOS_ROOT}/time/time.sh"
source "${_LIN_DOS_ROOT}/tree/tree.sh"
source "${_LIN_DOS_ROOT}/type/type.sh"
source "${_LIN_DOS_ROOT}/ver/ver.sh"
unset _LIN_DOS_ROOT

# Prompt like c:/home/user/> ($PWD expands each time; Unix paths already use /)
PS1='c:${PWD}/> '

echo
echo "Use LIN-DOS commands in CAPITAL letters (for example HELP, CLS, VER)."
echo "That way they do not collide with Linux tools that use the same spelling"
echo "(cd, type, date, time, etc.): CAPS means LIN-DOS, lowercase stays Linux."
echo

echo
echo "Starting LIN-DOS..."
echo 
echo 