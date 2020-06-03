# fixme - the load process here seems a bit bizarre
zmodload -i zsh/complist

zstyle ":completion:*:commands" rehash 1

WORDCHARS=''

unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end

# should this be in keybindings?
bindkey -M menuselect '^o' accept-and-infer-next-history
zstyle ':completion:*:*:*:*:*' menu select

# case insensitive (all), partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

if [[ "$OSTYPE" = solaris* ]]; then
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm"
else
  zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
fi

# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

# Load SSH completion from ssh config
hosts_completion=()

# Get hosts from ssh config file
if [[ -r ~/.ssh/config ]]; then
    hosts_completion=(${hosts_completion} ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi

# If hosts are found, add them to the completions
if [[ $#hosts_completion -gt 0 ]]; then
    zstyle ':completion:*:(ssh|scp|rsync|slogin):*' hosts ${hosts_completion}
fi

function art() {
    _artisan=`_artisan_find`

    if [ "$_artisan" = "" ]; then
        >&2 echo "Artisan: You seem to have upset the delicate internal balance of my housekeeper."
        return 1
    fi

    _artisan_start_time=`date +%s`
    php $_artisan $*
    _artisan_exit_status=$? # Store the exit status so we can return it later

    if [[ $1 = "make:"* && $ARTISAN_OPEN_ON_MAKE_EDITOR != "" ]]; then
        # Find and open files created by artisan
        _artisan_laravel_path=`dirname $_artisan`
        find \
            "$_artisan_laravel_path/app" \
            "$_artisan_laravel_path/tests" \
            "$_artisan_laravel_path/database" \
            -type f \
            -newermt "-$((`date +%s` - $_artisan_start_time + 1)) seconds" \
            -exec $ARTISAN_OPEN_ON_MAKE_EDITOR {} \; 2>/dev/null
    fi

    return $_artisan_exit_status
}

compdef _artisan_add_completion art

function _artisan_find() {
    # Look for artisan up the file tree until the root directory
    dir=.
    until [ $dir -ef / ]; do
        if [ -f "$dir/artisan" ]; then
            echo "$dir/artisan"
            return 0
        fi

        dir+=/..
    done

    return 1
}

function _artisan_add_completion() {
    if [ "`_artisan_find`" != "" ]; then
        compadd `_artisan_get_command_list`
    fi
}

function _artisan_get_command_list() {
    art --raw --no-ansi list | sed "s/[[:space:]].*//g"
}