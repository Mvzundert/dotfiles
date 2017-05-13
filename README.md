# DotFiles contains:
My most recent setup of the dotfiles I actively use. Since more and more people are actively using 
the same setup and because I want to be able to recreate it on new machines I've created an installer.

Feel free to use this as you see fit, install the entire thing or just grab stuff from all  the seperate configs
Just realize you'll need to manage all dependencies yourself when grabbing stuff without the full installer.

Most of the stuff I use makes use of powerline fonts, I'm assuming you either are able to install them yourself
or are able to switch to non-powerline themes. Both tmux (tmux/.theme/adjusted) and oh-my-vim frameworks have theme's
included that work without powerline fonts to get you started.

(https://github.com/powerline/fonts)

# Configscripts

* Homestead.yml (for laravel homestead)

* iterm SSH switcher script

# ZSH

* Zshconfig (Alias, Config options, Function, Paths, Widgets)

* Zshrc (Bundles all the config files)

# Tmux:

* tmux_config (Bindings, Config options)

* tmux.conf (Bundles all the config files)

# Oh-my-vim
Vim gets installed when on OSX using brew after that we also grab 
the framework and install it..

For more info on what's in there see the repository.
 (https://github.com/Mvzundert/oh-my-vim)

# To setup everything like i have it currently:
* cd ~/

* `git clone https://github.com/Mvzundert/dotfiles.git`

* cd ~/dotfiles/tools

* ./install.sh

* Grab a coffee and enjoy.

# Usefull tmux commands

`prefix + z`: current pane full-screen.

`prefix + ,`: rename current window.

`prefix + R`: Reload tmux configuration.

`prefix + 1`: go to first window.

`prefix + n`: go to next window.

`prefix + p`: go to previous window.

`prefix + q`: close pane.

`prefix + Q`: close window (confirmation).
