function wl-copy --description 'Pipe data to wl-copy, preferring the private container'
    if command -q distrobox
        distrobox enter private -- wl-copy $argv
    else if command -q wl-copy
        command wl-copy $argv
    else
        echo "Error: wl-copy is not available." >&2
        return 1
    end
end
