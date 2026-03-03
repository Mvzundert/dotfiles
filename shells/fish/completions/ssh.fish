# 1. Erase all existing SSH completions
complete -c ssh -e

# 2. Define the host extraction function (Fixed for Regex)
function __fish_complete_ssh_config_hosts
    if test -f ~/.ssh/config
        grep -i "^Host\s" ~/.ssh/config | awk '{print $2}' | grep -v -F "*"
    end
end

# 3. Register completions:
# '-f' or '--no-files' tells Fish NOT to autocomplete local folders/files
# '-a' provides our custom list from the SSH config
complete -c ssh -f -a "(__fish_complete_ssh_config_hosts)"
