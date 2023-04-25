#! /bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/code/marzun ~/code/clients ~/code/cerberos ~/code -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name $selected
fi

tmux attach-session -t $selected_name
