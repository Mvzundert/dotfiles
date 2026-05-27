
function wl-copy --description 'Pipe data to wl-copy inside the private container'
    distrobox enter private -- wl-copy $argv
end
