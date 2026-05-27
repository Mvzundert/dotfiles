function opencode --description 'Cross-platform OpenCode AI agent execution wrapper'
    if test "$KITTY_PLATFORM" = "Linux"
        if type -q distrobox
            if test (count $argv) -eq 0
                # Call standalone without dangling empty strings
                distrobox enter ai -- bash -c 'eval "$HOME/.npm-global/bin/opencode"'
            else
                # Safely escape and pass through all extra arguments
                distrobox enter ai -- bash -c "eval \"\$HOME/.npm-global/bin/opencode $argv\""
            end
        else
            command opencode $argv
        end
    else
        command opencode $argv
    end
end
