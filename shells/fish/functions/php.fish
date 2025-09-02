function switchphp
    # Check the operating system type
    if test (uname) = "Darwin"
        # Set up argument parsing with the `argparse` command.
        # It automatically handles flags and assigns them to variables.
        # The 'h' and 'q' flags are for help and quiet mode.
        argparse 'h/help' 'q/quiet' -- $argv

        # Check if the user requested the help message.
        if set -q argv_h
            printf "Usage: switchphp [-h] [-q] <version>\n\n"
            printf "Options:\n"
            printf "    -h    Show this help text.\n"
            printf "    -q    Quiet mode, no feedback.\n"
            printf "\n"
            printf "Arguments:\n"
            printf "    <version>    The PHP version to switch to (e.g., 8.0, 8.1).\n"
            return 0
        end

        # Determine the target version from the first positional argument.
        # `argparse` removes the flags from $argv, so we only need to check for the version number.
        if not set -q argv[1]
            printf "Please provide a target PHP version.\n"
            printf "Use 'bspv -h' for help.\n"
            return 1
        end
        set TARGET $argv[1]

        # Get the current active PHP version.
        set CURRENT (php -v | grep ^PHP | string match -r '\d\.\d' | head -n1)

        # Check if the current version is already the target version.
        if test "$TARGET" = "$CURRENT"
            if not set -q argv_q
                printf "Using Version: %s\n" "$CURRENT"
            end
            return 0
        end

        # Proceed with switching the PHP version.
        if not set -q argv_q
            printf "Deactivating: PHP %s\n" "$CURRENT"
        end
        # Unlink the current version.
        brew unlink "php@$CURRENT"

        if not set -q argv_q
            printf "Activating: PHP %s\n" "$TARGET"
        end

        # Link the new version with force and overwrite options.
        brew link "php@$TARGET" --force --overwrite

        if not set -q argv_q
            printf "Switch complete. New version is: %s\n" "$TARGET"
        end
    end
end
