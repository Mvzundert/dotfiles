function dev-run --description 'Run a development command transparently inside the dev container on Linux'
    if test (count $argv) -eq 0
        echo "Usage: dev-run <command> [arguments]"
        return 1
    end

    set -l cmd $argv[1]
    set -l cmd_args $argv[2..-1]

    # Check if we are running on Linux (Fedora Atomic)
    if test "$HOST_OS" = "Linux"
        if type -q distrobox
            distrobox enter dev -- $argv
        else
            # Fallback to local execution if distrobox isn't available
            command $cmd $cmd_args
        end
    else
        # On macOS, execute the command natively on the host system
        command $cmd $cmd_args
    end
end
