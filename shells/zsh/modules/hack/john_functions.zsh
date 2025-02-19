# -------------------------------------------------------------------
# Crack Zip, Rar, DMG files with John the Ripper
# -------------------------------------------------------------------
function crack() {
    USAGE="\033[33mUsage:\033[0m crack [-h] [-d] [-r] [-z] [-w]

    \033[33mOptions:\033[0m
        \033[92m-h\033[0m    Show this help text.
        \033[92m-d\033[0m    Crack DMG file password.
        \033[92m-r\033[0m    Crack RAR file password.
        \033[92m-z\033[0m    Crack ZIP file password.
        \033[92m-w\033[0m    With Wordlist
    "
    DMG=false
    RAR=false
    ZIP=false
    WORDLIST=false

    while getopts ':hdrzw:' option; do
        # shellcheck disable=SC2220
        case "$option" in
        h)
            echo -e "$USAGE"
            return 1
            ;;
        d)
            DMG=true
            ;;
        r)
            RAR=true
            ;;
        z)
            ZIP=true
            ;;
        w)
            WORDLIST=${OPTARG}
            ;;
        esac
    done

    # Remove chosen option from $@
    shift $((OPTIND - 1))

    TARGET=$1

    generate_hash

    if ! [[ ${DMG} == false ]]; then
        john --format=dmg-opencl "${TARGET}.hash"
    fi

    if ! [[ ${RAR} == false ]]; then
        john --format=rar-opencl "${TARGET}.hash"
    fi

    if ! [[ ${ZIP} == false ]]; then
        john "${TARGET}.hash"
    fi

    password=$(john --show "${TARGET}.hash" | sed '1q;d' | cut -d':' -f2)

    echo "The password for $1 is $password"
}

# -------------------------------------------------------------------
# Generate hash from Zip, Rar, Dmg with John The Ripper.
# -------------------------------------------------------------------
function generate_hash() {
    echo "Generating HASH"

    if ! [[ ${DMG} == false ]]; then
        dmg2john "${TARGET}" >"${TARGET}.hash" 2>/dev/null
    fi

    if ! [[ ${RAR} == false ]]; then
        rar2john "${TARGET}" >"${TARGET}.hash" 2>/dev/null
    fi

    if ! [[ ${ZIP} == false ]]; then
        zip2john "${TARGET}" >"${TARGET}.hash" 2>/dev/null
    fi
}
