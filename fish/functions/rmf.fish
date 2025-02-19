function rmrf
    if not set -q argv[1]
        echo "Usage: rmrf <directory> [directory...]"
        return 1
    end

    set -l delete_all false

    for directory in $argv
        if not test -e "$directory"
            echo "Error: '$directory' does not exist"
            continue
        end

        # Use fd to check if directory has contents (including hidden files)
        if test -n (fd --hidden --no-ignore --min-depth 1 --max-depth 1 . "$directory" -1)
            if test "$delete_all" = true
                rm -rf "$directory"
                echo "Deleted '$directory'"
            else
                echo "Directory '$directory' is not empty"
                read -P "Delete '$directory'? (y/n/a): " -l response
                switch (string lower $response)
                    case y
                        rm -rf "$directory"
                        echo "Deleted '$directory'"
                    case a
                        rm -rf "$directory"
                        echo "Deleted '$directory'"
                        set delete_all true
                    case '*'
                        echo "Skipped '$directory'"
                end
            end
        else
            rm -rf "$directory"
            echo "Deleted '$directory'"
        end
    end
end
