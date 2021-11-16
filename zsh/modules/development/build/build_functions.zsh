# -------------------------------------------------------------------
# Check current directory asset building dependencies, install and build them# Compressed
# -------------------------------------------------------------------
function build_project_assets() {
    USAGE="\033[33mUsage:\033[0m build [-h] [-f] [-i] [-c] [-a]

\033[33mOptions:\033[0m
    \033[92m-h\033[0m  Show this help text.
    \033[92m-f\033[0m  Force, Remove vendor/node_modules and install everything.
    \033[92m-i\033[0m  Install everything.
    \033[92m-c\033[0m  Install only composer packages.
    \033[92m-a\033[0m  Install only npm/yarn packages.
    "

    REFRESH=false
    COMPOSER_INSTALL=false
    COMPOSER_UPDATE=false
    PACKAGE_INSTALL=false
    PACKAGE_UPDATE=false

    while getopts ':hfica' option; do
      # shellcheck disable=SC2220
        case "$option" in
            h)
                echo -e "$USAGE"
                return 1
                ;;
            f)
                REFRESH=true
                PACKAGE_INSTALL=true
                COMPOSER_INSTALL=true
                ;;
            i)
                PACKAGE_INSTALL=true
                COMPOSER_INSTALL=true
                ;;
            c)
                COMPOSER_INSTALL=true
                ;;
            a)
                PACKAGE_INSTALL=true
                ;;
        esac
    done

    # Remove chosen option from $@
    shift $((OPTIND - 1))

    if [[ ${REFRESH} == true ]]; then
        # Check for composer install
        if [[ -d "$(pwd)/vendor" ]]; then
            echo "Removing 'vendor' Folder"

            rm -rf "$(pwd)/vendor"
        fi

        # Check for composer install
        if [[ -d "$(pwd)/node_modules" ]]; then
            echo "Removing 'node_modules' Folder"

            rm -rf "$(pwd)/node_modules"
        fi
    fi

    # Check for composer install
    if [[ -f composer.json ]]; then
        if [[ ${COMPOSER_INSTALL} == true ]]; then
            # Install dependencies
            composer install
        fi

        if [[ ${COMPOSER_UPDATE} == true ]]; then
            # Install dependencies
            composer update
        fi
    fi

    # Check for NPM lock file else use YARN
    if [[ -f package-lock.json ]]; then
        if [[ ${PACKAGE_INSTALL} == true ]]; then
            # Install packages
            npm install
        fi

        if [[ ${PACKAGE_UPDATE} == true ]]; then
            # Install dependencies
            npm update
        fi

        # Compile assets
        npm run dev
    elif [[ -f yarn.lock ]]; then
        if [[ ${PACKAGE_INSTALL} == true ]]; then
            # Install packages
            yarn install
        fi

        if [[ ${PACKAGE_UPDATE} == true ]]; then
            # Update packages
            yarn update
        fi

        # Compile assets
        yarn run dev
    elif [[ -f package.json ]]; then
        if [[ ${PACKAGE_INSTALL} == true ]]; then
            # Install packages
            yarn install
        fi

        if [[ ${PACKAGE_UPDATE} == true ]]; then
            # Update packages
            yarn update
        fi

        # Compile assets
        yarn run dev
    fi
}

# -------------------------------------------------------------------
# Check current directory assets building dependencies, install and watch them
# -------------------------------------------------------------------
function watch_project_assets() {
    # Check for NPM lock file else use YARN
    if [[ -f package-lock.json ]]; then
        # Install dependencies
        npm run dev

        # Run watch task
        npm run watch
    elif [[ -f package.json ]]; then
        # Install dependencies
        yarn run dev

        # Run watch task
        yarn run watch
    fi
}