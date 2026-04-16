#!/usr/bin/env bash
_LIN_DOS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo
echo "Starting LIN-DOS..."
echo 
echo 

# DOS-style prompt; use \\ so bash prompt expansion still shows one backslash
PS1='c:\\> '

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
