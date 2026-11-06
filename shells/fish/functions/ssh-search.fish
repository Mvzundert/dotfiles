function ssh-search --description "Search SSH hosts and copy alias or IP to clipboard"
    # Collect SSH config files
    set -l config_files ~/.ssh/config
    for f in ~/.ssh/conf.d/*
        if test -f "$f"
            set -a config_files "$f"
        end
    end

    # Parse Host/HostName pairs robustly
    set -l hosts (awk '
        function print_host() {
            print host "\t" hostname
        }
        tolower($0) ~ /^[[:space:]]*host[[:space:]]+/ {
            if (host != "" && host !~ /^\*/) print_host()
            host = $2
            hostname = ""
        }
        tolower($0) ~ /^[[:space:]]*hostname[[:space:]]+/ {
            if (hostname == "") hostname = $2
        }
        END {
            if (host != "" && host !~ /^\*/) print_host()
        }
    ' $config_files 2>/dev/null)

    if test (count $hosts) -eq 0
        echo "No SSH hosts found in ~/.ssh/config or ~/.ssh/conf.d/"
        return 1
    end

    # Format hosts into aligned columns
    set -l formatted (printf "%-24s | %s\n" "HOST" "ADDRESS")
    for line in $hosts
        set -l parts (string split \t "$line")
        set -a formatted (printf "%-24s | %s\n" "$parts[1]" "$parts[2]")
    end

    # Present hosts in fzf
    set -l selection (printf "%s\n" $formatted | \
        fzf --header "Select a host" --header-lines 1 \
            --height 40% --reverse)

    if test -z "$selection"
        return
    end

    # Split selection back into alias and address
    set -l parts (string split " | " "$selection")
    set -l host_alias (string trim "$parts[1]")
    set -l host_address (string trim "$parts[2]")

    # Build copy options, skipping empty values
    set -l options "Host:     $host_alias"
    if test -n "$host_address"
        set -a options "Address:  $host_address"
    end

    # Choose which piece to copy
    set -l choice (printf "%s\n" $options | \
        fzf --header "Copy to clipboard" --height 15% --reverse)

    if test -z "$choice"
        return
    end

    # Extract the value after the label
    set -l final_val (string replace -r "^[A-Za-z]+:[[:space:]]+" "" "$choice")

    # Clipboard logic
    if type -q pbcopy
        echo -n "$final_val" | pbcopy
        echo "Copied $final_val to clipboard (via pbcopy)"
    else if type -q xsel
        echo -n "$final_val" | xsel -bi
        echo "Copied $final_val to clipboard (via xsel)"
    else if type -q xclip
        echo -n "$final_val" | xclip -selection clipboard
        echo "Copied $final_val to clipboard (via xclip)"
    else if type -q wl-copy
        echo -n "$final_val" | wl-copy
        echo "Copied $final_val to clipboard (via wl-copy)"
    else
        echo "Value: $final_val"
        echo "Error: No clipboard tool found (pbcopy, xsel, xclip, or wl-copy)."
    end
end
