function tmz --description "Attach or create a tmux session from a zoxide directory"
    if not command -q zoxide
        echo "Error: zoxide is required but not installed." >&2
        return 1
    end

    if not command -q fzf
        echo "Error: fzf is required but not installed." >&2
        return 1
    end

    # Use fzf-tmux if available, otherwise plain fzf
    set -l selected_directory ""
    if command -q fzf-tmux
        set selected_directory (zoxide query -l | fzf-tmux -p 90%,90% \
            --no-sort --ansi --border-label ' zoxide ' --prompt '⚡ ' \
            --header 'Select a directory to attach or create a session.')
    else
        set selected_directory (zoxide query -l | fzf \
            --no-sort --ansi --border --border-label ' zoxide ' --prompt '⚡ ' \
            --header 'Select a directory to attach or create a session.')
    end

    # If the user cancels, exit gracefully
    if test -z "$selected_directory"
        return
    end

    # Derive the session name from the directory path
    set -l session_name (basename "$selected_directory")

    # Check if a tmux session with that name already exists
    if tmux has-session -t "$session_name" 2>/dev/null
        if test -z "$TMUX"
            # Outside of tmux, attach
            tmux attach-session -t "$session_name"
        else
            # Inside tmux, switch
            tmux switch-client -t "$session_name"
        end
    else
        # Create a new session
        if test -z "$TMUX"
            tmux new-session -s "$session_name" -c "$selected_directory"
        else
            tmux new-session -d -s "$session_name" -c "$selected_directory"
            tmux switch-client -t "$session_name"
        end
    end
end
