# ~/.config/fish/functions/ls.fish
function ls
    command eza --icons --group-directories-first $argv
end
