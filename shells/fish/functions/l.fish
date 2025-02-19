# ~/.config/fish/functions/l.fish
function l
    command eza --icons --group-directories-first $argv
end
