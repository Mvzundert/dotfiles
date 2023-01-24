# -------------------------------------------------------------------
# System Modules
# -------------------------------------------------------------------
# These are always enabled

# Search Module
# shellcheck disable=SC2231
for file in $MODULES/search/*; do
    # shellcheck disable=SC1090
    source "$file"
done

# Editor Module
# shellcheck disable=SC2231
for file in $MODULES/editors/*; do
    # shellcheck disable=SC1090
    source "$file"
done

# Clipboard Module
# shellcheck disable=SC2231
for file in $MODULES/clipboard/*; do
    # shellcheck disable=SC1090
    source "$file"
done

# Completion Module
# shellcheck disable=SC2231
for file in $MODULES/completion/*; do
    # shellcheck disable=SC1090
    source "$file"
done

# Completion Module
# shellcheck disable=SC2231
for file in $MODULES/history/*; do
    # shellcheck disable=SC1090
    source "$file"
done

# Extract Module
# shellcheck disable=SC2231
for file in $MODULES/extract/*; do
    # shellcheck disable=SC1090
    source "$file"
done

source "$ZSH"/plugins/z.sh
# shellcheck disable=SC1090
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# -------------------------------------------------------------------
# Optional Modules
# -------------------------------------------------------------------
# These can enabled using the load file.

if dotfiles::check "${PROMPT}"; then
    # Prompt Module
    # shellcheck disable=SC2231
    source "$ZSH"/prompt/prompt.zsh;
    source "$ZSH"/prompt/gitprompt.zsh;
    source "$ZSH"/prompt/nodeprompt.zsh;
elif dotfiles::check "${POWERLEVEL}"; then
    source "$ZSH"/plugins/powerlevel10k/powerlevel10k.zsh-theme
else
    # shellcheck disable=SC2231
    source "$ZSH"/prompt/minimal_prompt.zsh;
    source "$ZSH"/prompt/gitprompt.zsh;    
fi

if dotfiles::check "${GIT}"; then
    # Git Module
    # shellcheck disable=SC2231
    for file in $MODULES/development/git/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

if dotfiles::check "${BUILD}"; then
    # Build modules
    # shellcheck disable=SC2231
    for file in $MODULES/development/build/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

if dotfiles::check "${DOCKER}"; then
    # Build modules
    # shellcheck disable=SC2231
    for file in $MODULES/docker/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

if dotfiles::check "${TMUX}"; then
    # Tmux Module
    # shellcheck disable=SC2231
    for file in $MODULES/tmux/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

if dotfiles::check "${HACK}"; then
    # Hacking module
    # shellcheck disable=SC2231
    for file in $MODULES/hack/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

#############################
# Languages
#############################
if dotfiles::check "${PHP}"; then
    # PHP modules
    for file in $MODULES/development/php/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

if dotfiles::check "${PYTHON}"; then
    # Python modules
    for file in $MODULES/development/python/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi

#############################
# Frameworks
#############################
if dotfiles::check "${LARAVEL}"; then
    # Laravel Modules
    # shellcheck disable=SC1090
    for file in $MODULES/development/laravel/*; do
        source "$file"
    done
fi

if dotfiles::check "${DRUPAL}"; then
    # shellcheck disable=SC1090
    # Drupal
    for file in $MODULES/development/drupal/*; do
        source "$file"
    done
fi

if dotfiles::check "${WORDPRESS}"; then
    # Wordpress
    for file in $MODULES/development/wordpress/*; do
        # shellcheck disable=SC1090
        source "$file"
    done
fi
