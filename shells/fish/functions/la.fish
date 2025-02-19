# ~/.config/fish/functions/la.fish
function la
    command eza -a --icons --group-directories-first $argv
end
