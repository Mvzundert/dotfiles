function build
    set -l install_mode ""
    set -l has_composer (test -f composer.json; and echo true)
    set -l has_npm (test -f package.json; and echo true)
    set -l has_yarn (test -f yarn.lock; and echo true)
    set -l has_cargo (test -f Cargo.toml; and echo true)
    set -l has_pip (test -f requirements.txt; and echo true)
    set -l has_pipenv (test -f Pipfile; and echo true)
    set -l has_mix (test -f mix.exs; and echo true)
    set -l has_zig (test -f build.zig; and echo true)
    set -l has_go (test -f go.mod; and echo true)
    set -l has_cmake (test -f CMakeLists.txt; and echo true)

    # Function to display help
    function display_help
        echo "Usage: build [OPTIONS]"
        echo "Options:"
        echo "  --all, -a       Install all dependencies for all detected package managers"
        echo "  --prod, -p      Install production dependencies for all detected package managers"
        echo "  --composer      Install dependencies using Composer"
        echo "  --npm           Install dependencies using NPM"
        echo "  --yarn          Install dependencies using Yarn"
        echo "  --cargo         Build the project using Cargo"
        echo "  --pip           Install dependencies using Pip"
        echo "  --pipenv        Install dependencies using Pipenv"
        echo "  --mix           Build the project using Mix (Elixir)"
        echo "  --zig           Build the project using Zig"
        echo "  --go            Build the project using Go"
        echo "  --cmake         Build the project using CMake"
        echo "  --fresh, -f     Clean and install dependencies for all detected package managers"
        echo "  --help, -h      Display this help message"
    end

    # Parse arguments
    if test (count $argv) -eq 0
        set install_mode "default"
    else
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
                case --yarn
                    set install_mode "yarn"
                case --cargo
                    set install_mode "cargo"
                case --pip
                    set install_mode "pip"
                case --pipenv
                    set install_mode "pipenv"
                case --mix
                    set install_mode "mix"
                case --zig
                    set install_mode "zig"
                case --go
                    set install_mode "go"
                case --cmake
                    set install_mode "cmake"
                case --fresh -f
                    set install_mode "fresh"
                case --help -h
                    display_help
                    return 0
                case '*'
                    echo "Unknown flag: $arg"
                    display_help
                    return 1
            end
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
        if test -d .venv
            rm -rf .venv
            echo "Removed .venv directory"
        end
        if test -d _build
            rm -rf _build
            echo "Removed _build directory"
        end
        if test -d zig-out
            rm -rf zig-out
            echo "Removed zig-out directory"
        end
        if test -d build
            rm -rf build
            echo "Removed build directory"
        end
    end

    # Perform actions based on the flag
    switch $install_mode
        case "all"
            test "$has_composer" = "true"; and composer install
            test "$has_npm" = "true"; and npm install
            test "$has_yarn" = "true"; and yarn install
            test "$has_cargo" = "true"; and cargo build
            test "$has_pip" = "true"; and pip install -r requirements.txt
            test "$has_pipenv" = "true"; and pipenv install
            test "$has_mix" = "true"; and mix deps.get && mix compile
            test "$has_zig" = "true"; and zig build
            test "$has_go" = "true"; and go build
            test "$has_cmake" = "true"; and cmake . && make
        case "prod"
            test "$has_composer" = "true"; and composer install --no-dev --optimize-autoloader
            test "$has_npm" = "true"; and npm install --omit=dev
            test "$has_yarn" = "true"; and yarn install --production
            test "$has_cargo" = "true"; and cargo build --release
            test "$has_pip" = "true"; and pip install -r requirements.txt --no-dev
            test "$has_pipenv" = "true"; and pipenv install --deploy --ignore-pipfile
            test "$has_mix" = "true"; and mix deps.get --only prod && mix compile
            test "$has_zig" = "true"; and zig build -Drelease=true
            test "$has_go" = "true"; and go build -ldflags="-s -w"
            test "$has_cmake" = "true"; and cmake -DCMAKE_BUILD_TYPE=Release . && make
        case "composer"
            test "$has_composer" = "true"; and composer install
        case "npm"
            test "$has_npm" = "true"; and npm install
        case "yarn"
            test "$has_yarn" = "true"; and yarn install
        case "cargo"
            test "$has_cargo" = "true"; and cargo build
        case "pip"
            test "$has_pip" = "true"; and pip install -r requirements.txt
        case "pipenv"
            test "$has_pipenv" = "true"; and pipenv install
        case "mix"
            test "$has_mix" = "true"; and mix deps.get && mix compile
        case "zig"
            test "$has_zig" = "true"; and zig build
        case "go"
            test "$has_go" = "true"; and go build
        case "cmake"
            test "$has_cmake" = "true"; and cmake . && make
        case "fresh"
            clean
            test "$has_composer" = "true"; and composer install
            test "$has_npm" = "true"; and npm install
            test "$has_yarn" = "true"; and yarn install
            test "$has_cargo" = "true"; and cargo build
            test "$has_pip" = "true"; and pip install -r requirements.txt
            test "$has_pipenv" = "true"; and pipenv install
            test "$has_mix" = "true"; and mix deps.get && mix compile
            test "$has_zig" = "true"; and zig build
            test "$has_go" = "true"; and go build
            test "$has_cmake" = "true"; and cmake . && make
        case "default"
            if test "$has_composer" = "true"
                composer install
            end
            if test "$has_npm" = "true"
                npm install
            end
            if test "$has_yarn" = "true"
                yarn install
            end
            if test "$has_cargo" = "true"
                cargo build
            end
            if test "$has_pip" = "true"
                pip install -r requirements.txt
            end
            if test "$has_pipenv" = "true"
                pipenv install
            end
            if test "$has_mix" = "true"
                mix deps.get && mix compile
            end
            if test "$has_zig" = "true"
                zig build
            end
            if test "$has_go" = "true"
                go build
            end
            if test "$has_cmake" = "true"
                cmake . && make
            end
        case '*'
            echo "No valid flag provided."
            display_help
            return 1
    end
end
