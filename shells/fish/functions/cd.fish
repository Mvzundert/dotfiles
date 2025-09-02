# Overrides the default `cd` command to run
# the PHP version check after changing directories.
function cd
    # Call the original `cd` command with all arguments.
    builtin cd $argv

    # Get the exit status of the `cd` command.
    set -l cd_status $status

    # Check for the .php-version file only if the `cd` command was successful.
    if test $cd_status -eq 0
        if test -f ./.php-version
            set -l target_version (cat .php-version)

            # Call the main function silently.
            switchphp -q "$target_version"
        end
    end

    # Return the original exit status of the `cd` command.
    return $cd_status
end
