# --- Nvim Abbreviations ---
abbr -a v nvim
abbr -a vi nvim
abbr -a vim nvim
abbr -a nano nvim
abbr -a emacs nvim

# -- Zoxide all the things
abbr --erase z &>/dev/null
alias z=__zoxide_z

abbr --erase zi &>/dev/null
alias zi=__zoxide_zi


# --- Navigation Abbreviations ---
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'

abbr -a cy cal -mwy
abbr -a c3 cal -3
abbr -a c6 cal -n6

# --- Useful Tmux Abbreviations ---
abbr tl 'tmux ls' # List all current tmux sessions
abbr trs 'tmux rename-session' # Rename the current tmux session (you already have this one, included for completeness)
abbr tks 'tmux kill-server' # Kill the entire tmux server (closes all sessions)
