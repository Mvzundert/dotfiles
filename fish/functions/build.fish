function build
    set -l install_mode ""
    set -l has_composer (test -f composer.json; and echo true)
    set -l has_npm (test -f package.json; and echo true)
    set -l has_cargo (test -f Cargo.toml; and echo true)

    # Parse arguments
    for arg in $argv
        switch $arg
            case --all -a
                set install_mode "all"
            case --prod -p
                set install_mode "prod"
            case --composer
                set install_mode "composer"
            case --npm
                set install_mode "npm"
            case --cargo
                set install_mode "cargo"
            case --fresh -f
                set install_mode "fresh"
            case '*'
                echo "Unknown flag: $arg"
                return 1
        end
    end

    # Function to remove folders
    function clean
        if test -d vendor
            rm -rf vendor
            echo "Removed vendor directory"
        end
        if test -d node_modules
            rm -rf node_modules
            echo "Removed node_modules directory"
        end
        if test -d target
            rm -rf target
            echo "Removed target directory"
        end
    end

    # Perform actions based on the flag
    switch $install_mode
        case "all"
            test "$has_composer" = "true"; and composer install
            test "$has_npm" = "true"; and npm install
            test "$has_cargo" = "true"; and cargo build
        case "prod"
            test "$has_composer" = "true"; and composer install --no-dev --optimize-autoloader
            test "$has_npm" = "true"; and npm install --omit=dev
            test "$has_cargo" = "true"; and cargo build --release
        case "composer"
            test "$has_composer" = "true"; and composer install
        case "npm"
            test "$has_npm" = "true"; and npm install
        case "cargo"
            test "$has_cargo" = "true"; and cargo build
        case "fresh"
            clean
            test "$has_composer" = "true"; and composer install
            test "$has_npm" = "true"; and npm install
            test "$has_cargo" = "true"; and cargo build
        case '*'
            echo "No valid flag provided."
            return 1
    end
end

