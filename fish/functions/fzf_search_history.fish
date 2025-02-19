# ~/.config/fish/functions/fzf_search_history.fish
function fzf_search_history
    history | fzf --preview "echo {}" | read -l selection
    if test -n "$selection"
        commandline $selection
    end
end
bind \cb fzf_search_history  # Ctrl+B for history search
