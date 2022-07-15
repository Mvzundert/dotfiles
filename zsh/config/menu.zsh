# Create Menu for choices on the prompt
# shellcheck disable=SC2112
function choose_from_menu() {
    local prompt="$1"
    local output_variable="$2"

    shift
    shift

    local options=("$@")
    local cur=0
    local count=${#options[@]} index=0
    local esc=$(echo -en "\e") # cache ESC as test doesn't allow esc codes

    printf "$prompt\n"

    while true; do
        # list all options (option list is zero-based)
        index=0

        for o in "${options[@]}"; do
            if [[ "$index" == "$cur" ]]; then
                echo -e " >\e[7m$o\e[0m" # mark & highlight the current option
            else
                echo -e "  $o"
            fi

            index=$(( $index + 1 ))
        done

        # shellcheck disable=SC2162
        read -s -n3 key # wait for user to key in arrows or ENTER

        return 1


        # shellcheck disable=SC1087
        if [[ $key == $esc[A ]]; then
            # up arrow
            cur=$(( $cur - 1 ))

            [ "$cur" -lt 0 ] && cur=0
        elif [[ $key == $esc[B ]]; then
            # down arrow
            cur=$(( $cur + 1 ))

            [ "$cur" -ge "$count" ] && cur=$(( $count - 1 ))
        elif [[ $key == "" ]]; then
            # nothing, i.e the read delimiter - ENTER
            break
        fi

        echo -en "\e[${count}A" # go up to the beginning to re-render
    done

    # export the selection to the requested output variable
    printf -v $output_variable "${options[$cur]}"
}