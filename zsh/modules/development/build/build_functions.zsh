# -------------------------------------------------------------------
# Check current directory asset building dependencies, install and build them# Compressed
# -------------------------------------------------------------------
function build_project_assets() {
    USAGE="\033[33mUsage:\033[0m build [-h] [-f] [-i] [-p] [-c] [-a]
\033[33mOptions:\033[0m
    \033[92m-h\033[0m  Show this help text.
    \033[92m-f\033[0m  Fresh install, Remove vendor/node_modules and install everything.
    \033[92m-i\033[0m  Install everything.
    \033[92m-p\033[0m  Install everything as on production.
    \033[92m-c\033[0m  Install only composer dependencies.
    \033[92m-a\033[0m  Install only npm/yarn packages.
    "

    unset COMPOSER_ARGUMENTS

    COMPOSER_INSTALL=true
    PACKAGE_INSTALL=true
    PACKAGE_BUILD=true

    PRODUCTION=false
    REFRESH=false

    while getopts ':hfipca' option; do
        case "$option" in
            h)
                echo -e "$USAGE"
                return 1
                ;;
            f)
                REFRESH=true
                ;;
            i)
                PACKAGE_BUILD=false
                ;;
            p)
                REFRESH=true
                PRODUCTION=true
                ;;
            c)
                PACKAGE_INSTALL=false
                PACKAGE_BUILD=false
                ;;
            a)
                COMPOSER_INSTALL=false
                PACKAGE_INSTALL=false
                ;;
            *)
                echo -e "$USAGE"
                return 1
                ;;
        esac
    done

    # Default build for development
    PACKAGE_ARGUMENTS="dev"

    if [[ ${PRODUCTION} == true ]]; then
        COMPOSER_ARGUMENTS="--no-dev"
        PACKAGE_ARGUMENTS="prod"

        echo "Running as on production"
    fi

    if [[ ${REFRESH} == true ]]; then
        # Check for composer install
        if [[ -d "$(pwd)/vendor" ]] && [[ ${COMPOSER_INSTALL} == true ]]; then
            rm -rf "$(pwd)/vendor" && echo "Removed 'vendor' directory"
        fi

        # Check for composer install
        if [[ -d "$(pwd)/node_modules" ]] && [[ ${PACKAGE_INSTALL} == true ]]; then
            rm -rf "$(pwd)/node_modules" && echo "Removed 'node_modules' directory"
        fi
    fi

    # Check for composer install file
    if [[ -f composer.json ]]; then
        if [[ ${COMPOSER_INSTALL} == true ]]; then
            composer install $COMPOSER_ARGUMENTS
        fi
    fi

    # Check for npm/yarn install file
    if [[ -f package.json ]]; then
        if [[ ${PACKAGE_BUILD} == true ]]; then
            # Default to NPM
            PACKAGE_MANAGER="npm"

            # Check for Yarn lock file
            if [[ -f yarn.lock ]]; then
                PACKAGE_MANAGER="yarn"
            fi

            if [[ ${PACKAGE_INSTALL} == true ]]; then
                # Install packages
                eval $PACKAGE_MANAGER install
            fi

            eval $PACKAGE_MANAGER run $PACKAGE_ARGUMENTS
        fi
    fi
}
# -------------------------------------------------------------------
# Check current directory assets building dependencies, install and watch them
# -------------------------------------------------------------------
function watch_project_assets() {
    # Check for npm/yarn install file
    if [[ -f package.json ]]; then
        PACKAGE_MANAGER="yarn"

        # Check for NPM lock file else use YARN
        if [[ -f package-lock.json ]]; then
            PACKAGE_MANAGER="npm"
        fi

        eval $PACKAGE_MANAGER run dev

        eval $PACKAGE_MANAGER run watch
    fi
}