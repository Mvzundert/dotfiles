#############################
# System Modules
#############################
# Search Module
for file in $MODULES/search/*; do
    source "$file"
done

# Editor Module
for file in $MODULES/editors/*; do
    source "$file"
done

# Tmux Module
for file in $MODULES/tmux/*; do
    source "$file"
done

# Clipboard Module
for file in $MODULES/clipboard/*; do
    source "$file"
done

# Completion Module
for file in $MODULES/completion/*; do
    source "$file"
done

# Completion Module
for file in $MODULES/history/*; do
    source "$file"
done

# Extract Module
for file in $MODULES/extract/*; do
    source "$file"
done

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

source $ZSH/plugins/z.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
