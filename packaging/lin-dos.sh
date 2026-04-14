#!/usr/bin/env bash

# Load LIN-DOS command functions for interactive shells.
if [[ -n "${BASH_VERSION:-}" ]]; then
    if [[ -d "./commands" ]]; then
        source ./commands/cd/cd.sh
        source ./commands/cls/cls.sh
        source ./commands/copy/copy.sh
        source ./commands/date/date.sh
        source ./commands/md/md.sh
        source ./commands/rd/rd.sh
        source ./commands/time/time.sh
        source ./commands/tree/tree.sh
        source ./commands/type/type.sh
        source ./commands/ver/ver.sh
    else
        source /usr/lib/lin-dos/cd/cd.sh
        source /usr/lib/lin-dos/cls/cls.sh
        source /usr/lib/lin-dos/copy/copy.sh
        source /usr/lib/lin-dos/date/date.sh
        source /usr/lib/lin-dos/md/md.sh
        source /usr/lib/lin-dos/rd/rd.sh
        source /usr/lib/lin-dos/time/time.sh
        source /usr/lib/lin-dos/tree/tree.sh
        source /usr/lib/lin-dos/type/type.sh
        source /usr/lib/lin-dos/ver/ver.sh
    fi
fi
