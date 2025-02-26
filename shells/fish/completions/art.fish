function __find_artisan_dir
    set -l root_dir (git rev-parse --show-toplevel 2>/dev/null)
    if test -z "$root_dir"
        set root_dir (realpath (pwd))
        while test "$root_dir" != "/"
            if test -f "$root_dir/artisan"
                echo $root_dir
                return
            end
            set root_dir (realpath "$root_dir/..")
        end
    else
        if test -f "$root_dir/artisan"
            echo $root_dir
            return
        end
    end
    return 1
end

function __fish_art_get_commands
    set -l artisan_dir (__find_artisan_dir)
    if test -n "$artisan_dir"
        php "$artisan_dir/artisan" list --format=json | jq -r '.commands[].name'
    end
end

function __fish_art_get_options
    set -l artisan_dir (__find_artisan_dir)
    if test -z "$artisan_dir"
        return
    end
    set -l tokens (commandline -opc)
    set -l cmd $tokens[2]
    if test -n "$cmd"
        php "$artisan_dir/artisan" list --format=json | jq -r --arg cmd "$cmd" '
            .commands[] | select(.name == $cmd) | .options[] |
            if .shortcut != null and .shortcut != "" then
                "-" + .shortcut + "\t" + (.description // "") + "\n--" + .name + "\t" + (.description // "")
            else
                "--" + .name + "\t" + (.description // "")
            end
        '
    end
end

# Complete commands when the first argument is being entered
complete -c art -f -n 'test (count (commandline -opc)) -eq 1' -a '(__fish_art_get_commands)'

# Complete options after the command
complete -c art -f -n 'test (count (commandline -opc)) -ge 2' -a '(__fish_art_get_options)'
