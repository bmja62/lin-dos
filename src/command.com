#!/usr/bin/env bash

# Load LIN-DOS command functions for interactive shells.
if [[ -n "${BASH_VERSION:-}" ]]; then
    local_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [[ -f "${local_root}/cd/cd.sh" ]]; then
        source "${local_root}/cd/cd.sh"
        source "${local_root}/cls/cls.sh"
        source "${local_root}/copy/copy.sh"
        source "${local_root}/date/date.sh"
        source "${local_root}/help/help.sh"
        source "${local_root}/md/md.sh"
        source "${local_root}/rd/rd.sh"
        source "${local_root}/time/time.sh"
        source "${local_root}/tree/tree.sh"
        source "${local_root}/type/type.sh"
        source "${local_root}/ver/ver.sh"
    else
        source /usr/lib/lin-dos/cd/cd.sh
        source /usr/lib/lin-dos/cls/cls.sh
        source /usr/lib/lin-dos/copy/copy.sh
        source /usr/lib/lin-dos/date/date.sh
        source /usr/lib/lin-dos/help/help.sh
        source /usr/lib/lin-dos/md/md.sh
        source /usr/lib/lin-dos/rd/rd.sh
        source /usr/lib/lin-dos/time/time.sh
        source /usr/lib/lin-dos/tree/tree.sh
        source /usr/lib/lin-dos/type/type.sh
        source /usr/lib/lin-dos/ver/ver.sh
    fi
fi
