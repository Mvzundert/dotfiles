source $ZSH/plugins/editors.zsh
source $ZSH/plugins/search.zsh
source $ZSH/plugins/system.zsh
source $ZSH/plugins/tmux.zsh

#############################
# Coding plugins
#############################

# Git Module
for file in $MODULES/development/git/*; do
    source "$file"
done

# Build modules
for file in $MODULES/development/build/*; do
    source "$file"
done

# Build modules
for file in $MODULES/docker/*; do
    source "$file"
done

#############################
# Languages
#############################

# Python modules
for file in $MODULES/development/python/*; do
    source "$file"
done

# PHP modules
for file in $MODULES/development/php/*; do
    source "$file"
done

#############################
# Frameworks
#############################
# Laravel Modules
for file in $MODULES/development/laravel/*; do
    source "$file"
done

# Drupal
for file in $MODULES/development/drupal/*; do
    source "$file"
done

# Wordpress
for file in $MODULES/development/wordpress/*; do
    source "$file"
done

#############################
# System plugins
#############################
source $ZSH/plugins/clipboard.zsh
source $ZSH/plugins/completion.zsh
source $ZSH/plugins/history.zsh
source $ZSH/plugins/z.sh
source $ZSH/plugins/extract.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
