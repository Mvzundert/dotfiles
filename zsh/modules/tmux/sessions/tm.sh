#! /bin/bash

# abort if we're already inside a TMUX session
[ "$TMUX" = "" ] || exit 0
# startup a "default" session if non currently exists
tmux has-session -t workspace || tmux new-session -s workspace -d

# present menu for user to choose which workspace to open
PS3="Please choose your session: "
options=($(tmux list-sessions -F "#S" 2>/dev/null) "New Session")

echo "Available sessions"
echo "------------------"
echo " "
select opt in "${options[@]}"
do
    case $opt in
        "New Session")
            read -rp "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            break
            ;;
        "zsh")
            zsh --login
            break;;
        *)
            tmux attach-session -t "$opt"
            break
            ;;
    esac
done
