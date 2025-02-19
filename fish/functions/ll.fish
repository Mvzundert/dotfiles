# ~/.config/fish/functions/ll.fish
function ll
    command eza -lah --icons --group-directories-first --git $argv
end
