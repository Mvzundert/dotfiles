  function tmz
    # 1. Use fzf-tmux to let the user select a directory from zoxide's list
    set -l selected_directory (
      zoxide query -l | fzf-tmux -p 90%,90% \
      --no-sort --ansi --border-label ' zoxide ' --prompt '⚡ ' \
      --header 'Select a directory to attach or create a session.'
    )

    # 2. If the user cancels, exit gracefully
    if [ -z "$selected_directory" ]
      return
    end

    # 3. Derive the session name from the directory path
    set -l session_name (basename "$selected_directory")

    # 4. Check if a tmux session with that name already exists
    if tmux has-session -t "$session_name" &>/dev/null
      # Session exists, so attach to it. This command works in both contexts.
      tmux attach-session -t "$session_name"
    else
      # Session does not exist, so create a new one.
      # The command used depends on whether we are already in a tmux session.
      if [ -z "$TMUX" ]
        # We are OUTSIDE of a tmux session.
        # Create and attach to the new session directly.
        tmux new-session -s "$session_name" -c "$selected_directory"
      else
        # We are ALREADY INSIDE of a tmux session.
        # Create the new session in the background and switch the client to it.
        tmux new-session -d -s "$session_name" -c "$selected_directory"
        tmux switch-client -t "$session_name"
      end
    end
end
