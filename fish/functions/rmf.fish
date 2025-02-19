function rmf
    if test (count $argv) -ne 1
        echo "Usage: rmf <folder>"
        return 1
    end

    # Ensure folder path is properly formatted (remove trailing slashes)
    set -l folder (string trim --right --chars=/ -- $argv[1])

    if not test -d "$folder"
        echo "Error: '$folder' is not a directory!"
        return 1
    end

    # Check if the folder is empty
    if test (count (ls -A "$folder" 2>/dev/null)) -eq 0
        rmdir "$folder"
        echo "Removed empty folder: $folder"
    else
        read --prompt-str "'$folder' is not empty. Are you sure you want to delete it? (y/N) " confirm
        if test "$confirm" = "y" -o "$confirm" = "Y"
            rm -rf "$folder"
            echo "Deleted '$folder'."
        else
            echo "Aborted."
        end
    end
end

