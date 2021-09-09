# Create and CD into the just created folder
function take() {
    mkdir -p $@ && cd ${@:$#}
}

# Which commands do you use the most
function zsh_stats() {
    fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

# Open files.
function open_command() {
    local open_cmd

    # define the open command
    case "$OSTYPE" in
        darwin*)  open_cmd='open' ;;
        cygwin*)  open_cmd='cygstart' ;;
        linux*)   ! [[ $(uname -a) =~ "Microsoft" ]] && open_cmd='xdg-open' || {
            open_cmd='cmd.exe /c start ""'
        [[ -e "$1" ]] && { 1="$(wslpath -w "${1:a}")" || return 1 }
    } ;;
msys*)    open_cmd='start ""' ;;
*)        echo "Platform $OSTYPE not supported"
    return 1
    ;;
  esac

  # don't use nohup on OSX
  if [[ "$OSTYPE" == darwin* ]]; then
      ${=open_cmd} "$@" &>/dev/null
  else
      nohup ${=open_cmd} "$@" &>/dev/null
  fi
}

####################################
# OS specific functions
####################################

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux functions can go here.
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Custom MAC OSX functions

    #Fix displaying of ugly user.
    prompt_context() {
        if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
            prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
        fi
    }
fi
