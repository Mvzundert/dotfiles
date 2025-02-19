# ~/.config/fish/functions/fzf_search_aliases.fish
function fzf_search_aliases
    alias | fzf | read -l selection
    if test -n "$selection"
        commandline $selection
    end
end
bind \cv fzf_search_aliases  # Ctrl+V for alias search
