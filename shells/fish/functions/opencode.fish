function opencode --description "Cross-platform OpenCode AI agent execution wrapper"
    if test "$HOST_OS" = "Linux"; and test -x "$HOME/.local/bin/opencode"
        # On Fedora Atomic, run the clean binary exported by distrobox
        "$HOME/.local/bin/opencode" $argv
    else
        # On macOS (or fallback), run the natively installed binary
        command opencode $argv
    end
end
