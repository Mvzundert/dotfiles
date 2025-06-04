# === Use bat for highlighting man pages, and less for paging ===

# Ensure LESS_FORMERL is still set if you want less to not clear screen on exit
set -x LESS_FORMERL "1"

# Define MANPAGER to pipe through col, then bat, then finally less -R
set -x MANPAGER "sh -c 'col -bx | bat -l man --color=always | less -R'"

