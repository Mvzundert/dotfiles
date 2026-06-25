function theme --description "Switch dotfiles theme (kitty, nvim, bat, doom-emacs)"
    if test (count $argv) -eq 0
        echo "Usage: theme <gruvbox|doom-one|tokyonight>"
        echo ""
        echo "Current themes:"
        test -f ~/.config/nvim/current-theme.lua && echo "  nvim:   "(cat ~/.config/nvim/current-theme.lua | string match -r "'([^']+)'")
        test -f ~/.config/kitty/current-theme.conf && echo "  kitty:  "(head -2 ~/.config/kitty/current-theme.conf | string match -r 'name: (.+)' | head -1)
        return 1
    end

    set -l script "$DOTFILES/tools/scripts/theme-switch.sh"
    if test -f "$script"
        bash "$script" $argv[1]
        test -f ~/.config/fish/conf.d/theme_bat.fish && source ~/.config/fish/conf.d/theme_bat.fish
    else
        echo "Error: $script not found"
        return 1
    end
end
