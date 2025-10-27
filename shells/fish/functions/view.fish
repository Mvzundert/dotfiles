function view
    if test (count $argv) -eq 0
        # If no arguments, just open nvim normally
        nvim
    else
        # Open nvim with arguments, using the -R flag for read-only
        nvim -R $argv
    end
end
