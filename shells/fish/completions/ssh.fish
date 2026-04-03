# 1. Erase all existing SSH completions
complete -c ssh -e

# 2. Define the host extraction function
function __fish_complete_ssh_config_hosts
    set -l files ~/.ssh/config
    if test -d ~/.ssh/conf.d
        set -a files ~/.ssh/conf.d/*
    end

    for file in $files
        if test -f $file
            # Extract Host values, ignore wildcards
            grep -i "^Host\s" $file | awk '{$1=""; print $0}' | xargs -n1 | grep -v -F "*"
        end
    end
end

# 3. Register completions (Note: No quotes around the function call)
complete -c ssh -f -a "(__fish_complete_ssh_config_hosts)"
