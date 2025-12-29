function ssh-search
    # 1. Search and select the entry (Host and HostName)
    set -l selection (rg -i '^Host [^*]|^[ \t]*HostName' ~/.ssh/config | \
        paste - - | \
        awk '{print $2 " | " $4}' | \
        fzf --header "Select Host" --height 40% --reverse)

    if test -n "$selection"
        # 2. Split selection into variables
        set -l host_alias (echo $selection | awk -F' | ' '{print $1}')
        set -l host_ip (echo $selection | awk -F' | ' '{print $3}')

        # 3. Choose which piece of data to grab
        set -l choice (printf "Alias: $host_alias\nIP: $host_ip" | \
            fzf --header "Copy to clipboard?" --height 15% --reverse)

        if test -n "$choice"
            # Extract the actual value after the label "Alias: " or "IP: "
            set -l final_val (echo $choice | awk '{print $2}')

            # 4. Clipboard Logic (Check pbcopy, then xsel, then xclip)
            if type -q pbcopy
                echo -n $final_val | pbcopy
                echo "Copied $final_val to clipboard (via pbcopy)"
            else if type -q xsel
                echo -n $final_val | xsel -bi
                echo "Copied $final_val to clipboard (via xsel)"
            else if type -q xclip
                echo -n $final_val | xclip -selection clipboard
                echo "Copied $final_val to clipboard (via xclip)"
            else
                echo "Value: $final_val"
                echo "Error: No clipboard tool found (pbcopy, xsel, or xclip)."
            end
        end
    end
end
