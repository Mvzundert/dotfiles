# --- Nvim Abbreviations ---
abbr -a v nvim
abbr -a vi nvim
abbr -a vim nvim
abbr -a nano nvim
abbr -a emacs nvim

# --- Navigation Abbreviations ---
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .... 'cd ../../..'

# --- Useful Tmux Abbreviations ---
abbr tl 'tmux ls' # List all current tmux sessions
abbr trs 'tmux rename-session' # Rename the current tmux session (you already have this one, included for completeness)
abbr tks 'tmux kill-server' # Kill the entire tmux server (closes all sessions)
