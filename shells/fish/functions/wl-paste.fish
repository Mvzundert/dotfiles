function wl-paste --description 'Get data from wl-paste, preferring the private container'
    if command -q distrobox
        distrobox enter private -- wl-paste $argv
    else if command -q wl-paste
        command wl-paste $argv
    else
        echo "Error: wl-paste is not available." >&2
        return 1
    end
end
