# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#########################################################
### Custom aliases ###
#########################################################

PRODUCTION="$HOME/<project production folder>"
STAGING="$HOME/<project staging folder>"

### Go up 1 directory ###
alias ..="cd .."

### List everything in directory ###
alias ll="ls -lah"

### Reload Bash ###
alias reload=". ~/.bashrc"

### List files by size ###
alias size='du -sh * | sort -r -n | grep "[0-9][G|M]"'

### Go to staging directory ###
alias acc="cd $STAGING"

### Go to production directory ###
alias prd="cd $PRODUCTION"

### Composer dump autoload ###
alias cda="composer dump-autoload"

### Shortcode for artisan ###
alias art="php artisan"

### PHP 71 Alias ###
alias php71="/opt/cpanel/ea-php71/root/usr/bin/php"

### PHP 71 Composer Alias ###
alias composer="php71 /opt/cpanel/composer/bin/composer"

### Alias VIM for the nerds to make server easier to edit ###
alias vim="vi"



