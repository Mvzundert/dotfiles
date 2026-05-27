function wl-paste --description 'Get data from wl-paste inside the private container'
    distrobox enter private -- wl-paste $argv
end
