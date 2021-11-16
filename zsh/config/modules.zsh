# -------------------------------------------------------------------
# System Modules
# -------------------------------------------------------------------
# These are always enabled

# Search Module
for file in $MODULES/search/*; do
    source "$file"
done

# Editor Module
for file in $MODULES/editors/*; do
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

source $ZSH/plugins/z.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# -------------------------------------------------------------------
# Optional Modules
# -------------------------------------------------------------------
# These can enabled using the load file.

if dotfiles::check "${GIT}"; then
  # Git Module
  for file in $MODULES/development/git/*; do
      source "$file"
  done
fi

if dotfiles::check "${BUILD}"; then
  # Build modules
  for file in $MODULES/development/build/*; do
      source "$file"
  done
fi

if dotfiles::check "${DOCKER}"; then
  # Build modules
  for file in $MODULES/docker/*; do
      source "$file"
  done
fi

if dotfiles::check "${TMUX}"; then
  # Tmux Module
  for file in $MODULES/tmux/*; do
      source "$file"
  done
fi


if dotfiles::check "${HACK}"; then
  # Hacking module
  for file in $MODULES/hack/*; do
    source "$file"
  done
fi

#############################
# Languages
#############################
if dotfiles::check "${PHP}"; then
  # PHP modules
  for file in $MODULES/development/php/*; do
      source "$file"
  done
fi

if dotfiles::check "${PYTHON}"; then
  # Python modules
  for file in $MODULES/development/python/*; do
      source "$file"
  done
fi

#############################
# Frameworks
#############################
if dotfiles::check "${LARAVEL}"; then
  # Laravel Modules
  for file in $MODULES/development/laravel/*; do
      source "$file"
  done
fi

if dotfiles::check "${DRUPAL}"; then
  # Drupal
  for file in $MODULES/development/drupal/*; do
      source "$file"
  done
fi

if dotfiles::check "${WORDPRESS}"; then
  # Wordpress
  for file in $MODULES/development/wordpress/*; do
      source "$file"
  done
fi
