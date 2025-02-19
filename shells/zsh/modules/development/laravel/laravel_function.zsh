# -------------------------------------------------------------------
# First get location of current folders Artisan file and run it with given arguments
# -------------------------------------------------------------------
function run_laravel_artisan() {
    # Set default artisan location to current dir
    export ARTISAN_APP=./artisan

    # If default isn't found, go look for it
    if [[ ! -f ${ARTISAN_APP} ]]; then
        find_laravel_artisan
    fi

    LOCATION='\033[33martisan not found\033[0m'

    if [[ "$ARTISAN_APP" != "" ]] && [[ -f ${ARTISAN_APP} ]]; then
        LOCATION="\033[33m$ARTISAN_APP\033[0m"
    fi

    USAGE="\033[33mUsage:\033[0m art [-h]

Run artisan command from anywhere in your projects.

Currently using: $LOCATION

\033[33mOptions:\033[0m
    \033[92m-h\033[0m  Show this help text.
    "

    while getopts ':h' option; do
        # shellcheck disable=SC2220
        case "$option" in
        h)
            echo -e "$USAGE"
            return 1
            ;;
        esac
    done

    if [[ "$ARTISAN_APP" != "" ]] && [[ -f ${ARTISAN_APP} ]]; then
        php -d memory_limit=512M $ARTISAN_APP $@
    else
        echo -e "$USAGE"
    fi
}

# -------------------------------------------------------------------
# Do magic to find current projects artisan file
# -------------------------------------------------------------------
function find_laravel_artisan() {
    # Check current folder for artisan, then parent, then parents parent, etc., etc.
    DIRECTORY=..
    until [[ -e ${DIRECTORY}/artisan || ${DIRECTORY} -ef / ]]; do DIRECTORY+=/..; done

    # Convert path to absolute path
    DIRECTORY=$(
        cd "$DIRECTORY"
        pwd
    )

    # Add artisan to path
    APP=${DIRECTORY}/artisan

    # Update global variable
    if [[ "$APP" != "" ]]; then
        ARTISAN_APP=$APP
    fi
}

# -------------------------------------------------------------------
# Alias Artisan to Art
# -------------------------------------------------------------------
function art() {
    _artisan=$(_artisan_find)

    if [ "$_artisan" = "" ]; then
        echo >&2 "Artisan: You seem to have upset the delicate internal balance of my housekeeper."
        return 1
    fi

    _artisan_start_time=$(date +%s)
    php $_artisan $*
    _artisan_exit_status=$? # Store the exit status so we can return it later

    if [[ $1 == "make:"* && $ARTISAN_OPEN_ON_MAKE_EDITOR != "" ]]; then
        # Find and open files created by artisan
        _artisan_laravel_path=$(dirname $_artisan)
        find \
            "$_artisan_laravel_path/app" \
            "$_artisan_laravel_path/tests" \
            "$_artisan_laravel_path/database" \
            -type f \
            -newermt "-$(($(date +%s) - $_artisan_start_time + 1)) seconds" \
            -exec $ARTISAN_OPEN_ON_MAKE_EDITOR {} \; 2>/dev/null
    fi

    return $_artisan_exit_status
}

compdef _artisan_add_completion art

# -------------------------------------------------------------------
# Look for artisan up the file tree until the root directory
# -------------------------------------------------------------------
function _artisan_find() {
    dir=.
    until [ $dir -ef / ]; do
        if [ -f "$dir/artisan" ]; then
            echo "$dir/artisan"
            return 0
        fi

        dir+=/..
    done

    return 1
}

# -------------------------------------------------------------------
# Add Artisan complation to ZSH
# -------------------------------------------------------------------
function _artisan_add_completion() {
    if [ "$(_artisan_find)" != "" ]; then
        # shellcheck disable=SC2046
        compadd $(_artisan_get_command_list)
    fi
}

# -------------------------------------------------------------------
# Get the artisan command list
# -------------------------------------------------------------------
function _artisan_get_command_list() {
    art --raw --no-ansi list | sed "s/[[:space:]].*//g"
}
