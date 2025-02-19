# Bat function replacing help with highlighting
help() {
    "$@" --help 2>&1 | bathelp
}

# rm -rf prompt when the folder is not empty to shortcut it with safety check
function rmrf_prompt() {
    # Check if there are any arguments provided
    if [ $# -eq 0 ]; then
        echo "Usage: rmrf_prompt <directory>"
        return 1
    fi

    # Get the directory path
    directory=$1

    # Check if the directory is not empty
    if [ "$(ls -A "$directory")" ]; then
        echo "Directory $directory is not empty."

        # Display a line break for better readability
        echo ""

        # Prompt the user for confirmation
        read "?Are you sure you want to delete $directory? (y/n): " response

        # Display a line break for better readability
        echo ""

        # Check the user's response
        case $response in
            [yY])
                # If the response is 'y' or 'Y', then proceed with deletion
                rm -rf "$directory"
                echo "Deleted $directory"
                ;;
            *)
                # If the response is anything else, cancel the operation
                echo "Deletion canceled"
                ;;
        esac
    else
        rm -rf "$directory"
        echo "Deleted $directory"
    fi
}
