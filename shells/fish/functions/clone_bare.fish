function clone_bare_repo
    function usage
        echo "Usage: (basename (status filename)) [-h] [-v] [-l] repository"
        echo ""
        echo "Clone a bare git repo and set up environment for working comfortably and exclusively from worktrees."
        echo ""
        echo "Available options:"
        echo ""
        echo "-h, --help      Print this help and exit"
        echo "-v, --verbose   Print script debug info"
        echo "-l, --location  Location of the bare repo contents (default: .bare)"
        exit
    end

    function cleanup
        functions -e -t SIGINT SIGTERM EXIT
    end

    function setup_colors
        if test -t 2 -a -z "$NO_COLOR" -a "$TERM" != "dumb"
            set -g NOFORMAT '\e[0m'
            set -g RED '\e[0;31m'
            set -g GREEN '\e[0;32m'
            set -g ORANGE '\e[0;33m'
            set -g BLUE '\e[0;34m'
            set -g PURPLE '\e[0;35m'
            set -g CYAN '\e[0;36m'
            set -g YELLOW '\e[1;33m'
        else
            set -g NOFORMAT ''
            set -g RED ''
            set -g GREEN ''
            set -g ORANGE ''
            set -g BLUE ''
            set -g PURPLE ''
            set -g CYAN ''
            set -g YELLOW ''
        end
    end

    function msg
        echo -e $argv[1] >&2
    end

    function die
        set -l msg $argv[1]
        set -l code (math "$argv[2] ?: 1")
        msg $msg
        exit $code
    end

    function parse_params
        set -g location '.bare'
        set -g args

        for arg in $argv
            switch $arg
                case '-h' '--help'
                    usage
                case '-v' '--verbose'
                    set -x
                case '--no-color'
                    set -g NO_COLOR '1'
                case '-l' '--location'
                    set -g location $argv[2]
                    set argv (string sub -s 2 $argv)
                case '*'
                    if test (string match -qr '^-' $arg)
                        die "Unknown option: $arg"
                    else
                        set -g args $args $arg
                    end
            end
            set argv (string sub -s 2 $argv)
        end

        if test (count $args) -eq 0
            die "Missing script arguments"
        end

        return 0
    end

    trap cleanup SIGINT SIGTERM EXIT

    parse_params $argv
    setup_colors

    msg "$YELLOW Cloning bare repository to $location... $NOFORMAT"
    git clone --bare $args $location
    if test $status -ne 0
        die "Failed to clone repository"
    end

    pushd $location > /dev/null
    msg "$YELLOW Adjusting origin fetch locations... $NOFORMAT"
    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
    if test $status -ne 0
        die "Failed to adjust origin fetch locations"
    end

    popd > /dev/null
    msg "$YELLOW Setting .git file contents... $NOFORMAT"
    echo "gitdir: ./$location" > .git
    if test $status -ne 0
        die "Failed to set .git file contents"
    end

    msg "$GREEN Success. $NOFORMAT"
end
