function rustup --description 'Handle rustup natively on macOS and protect the Linux container stack'
    # Check if we are running on Linux (Fedora Atomic)
    if test "$HOST_OS" = "Linux"
        echo "Note: On Fedora Atomic, Rust is managed natively inside your 'dev' container via DNF."
        echo "To update your container toolchain, update your distrobox package layer."
        echo ""
        echo "If you absolutely must run a local rustup command inside the container, use: dev-run rustup <args>"
        return 1
    else
        # On macOS, execute standard rustup commands natively on the host system
        command rustup $argv
    end
end
