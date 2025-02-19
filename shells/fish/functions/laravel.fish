function art
    # Find the Laravel root directory
    set -l root_dir (git rev-parse --show-toplevel 2>/dev/null || echo "")

    # If not a Git repo, search for artisan by going up the directory tree
    if test -z "$root_dir"
        set root_dir (realpath (pwd))
        while test "$root_dir" != "/"
            if test -f "$root_dir/artisan"
                break
            end
            set root_dir (realpath "$root_dir/..")
        end
    end

    # Check if artisan exists in the found root directory
    if test -f "$root_dir/artisan"
        php "$root_dir/artisan" $argv
    else
        echo "Could not find artisan. Are you in a Laravel project?"
        return 1
    end
end
