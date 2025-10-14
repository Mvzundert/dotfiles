# NOTE: The variable $__fish_current_php_version is used to cache the active version.
#       You will need to initialize this variable when your shell starts (see below).
function cd
    # Call the original `cd` command with all arguments.
    builtin cd $argv

    set -l cd_status $status

    # Check for the .php-version file only if the `cd` command was successful.
    if test $cd_status -eq 0
        if test -f ./.php-version
            set -l target_version (cat .php-version)

            # Extract the major.minor version using the efficient string match
            set -l major_minor_version (string match -r '^\d+\.\d+' "$target_version" | string trim)

            # Check if the target version is different from the cached version.
            # Only run the external 'switchphp' command if a change is needed.
            if test "$major_minor_version" != "$__fish_current_php_version"
                # Check if we actually found a version number
                if test -n "$major_minor_version"
                    # Call the main function silently.
                    switchphp -q "$major_minor_version"
                    # Update the global cache variable to prevent unnecessary calls next time
                    set -g __fish_current_php_version "$major_minor_version"
                    echo "PHP switched to $major_minor_version"
                end
            end
        end
    end

    return $cd_status
end
