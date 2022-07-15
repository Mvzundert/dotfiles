function torro() {
    USAGE="\033[33mUsage:\033[0m torro [-h] [-u] [-d]

    \033[33mOptions:\033[0m
        \033[92m-h\033[0m    Show this help text.
        \033[92m-e\033[0m    Select Network interface and turn everything on.
        \033[92m-d\033[0m    Turn everything off.
    "

    # shellcheck disable=SC2034
    INTERFACE=false
    UP=false
    DOWN=false

    while getopts ':hweud' option; do
        # shellcheck disable=SC2220
        # shellcheck disable=SC2213
        case "$option" in
        h)
            echo -e "$USAGE"
            return 1
            ;;
        u)
            UP=true
            ;;
        d)
            DOWN=true
            ;;
        esac
    done

    # Remove chosen option from $@
    shift $((OPTIND - 1))

    if ! [[ ${DOWN} == false ]]; then
        turn_off
        return 1
    fi

    if ! [[ ${UP} == false ]]; then
#        echo 'Upping'
#        echo 'Determining Interface'
#        echo 'Enabling Proxy'

#        interface_list=$(networksetup -listallhardwareports | grep "Hardware Port:" | cut -f2 -d":")

        interface_list=(
            "een"
            "two"
            "3"
            "fow"
        )

        choose_from_menu "Choose an interface: " interface "${interface_list[@]}"

        echo $interface

        return 1
    fi

#    echo 'Determining Interface'

#    if ! [[ ${WIFI} == false ]]; then
#        if dotfiles::check find_wifi_network_device; then
#            INTERFACE=$("find_wifi_network_device")
#            # Set the other interface to false because reasons
#            ETHERNET=false
#        fi
#    fi
#
#    if ! [[ ${ETHERNET} == false ]]; then
#        if dotfiles::check find_ethernet_network_device; then
#            echo "Ethernet not supported (yet)"
#            return 1
#            # INTERFACE=$("find_ethernet_network_device")
#            # Set the other interface to false because reasons
#            WIFI=false
#        fi
#    fi

    # Remove leading and trailing whitespace characters.
#    export BINDING="$(echo -e "${INTERFACE}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

    # Ask for the administrator password upfront
#    sudo -v

    # # Keep-alive: update existing `sudo` time stamp until finished
#    while true; do
#        sudo -n true
#        sleep 60
#        kill -0 "$$" || exit
#    done 2>/dev/null &

#    echo 'Enabling Proxy'

    # Let's roll
#    sudo networksetup -setsocksfirewallproxy "$BINDING" 127.0.0.1 9050 off
#    sudo networksetup -setsocksfirewallproxystate "$BINDING" on
#
#    echo 'Enabling Tor Service'
#    brew services start tor
#
#    echo 'Enabling Socks Proxy'
#    export ALL_PROXY="socks4://127.0.0.1:9050"
}

# -------------------------------------------------------------------
# Find Network Devices
# -------------------------------------------------------------------
function find_network_devices() {
    # shellcheck disable=SC2034
    # shellcheck disable=SC2207
    interface_list=$(networksetup -listallhardwareports | grep "Hardware Port:" | cut -f2 -d":")

    # shellcheck disable=SC2206
    interfaces=($interface_list)

    # shellcheck disable=SC2128
    echo "$interfaces"
}

# -------------------------------------------------------------------
# Turn everything off.
# -------------------------------------------------------------------
function turn_off() {
    echo 'Disabling Tor Service'
    brew services stop tor

    echo 'Disabling Interface'
    sudo networksetup -setsocksfirewallproxystate "$BINDING" off
    unset BINDING

    echo 'Disabling Proxy'
    unset ALL_PROXY
}
