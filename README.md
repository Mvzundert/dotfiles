# THE CRANKY DEVELOPER'S MANIFESTO

I am developing this project for the sole purpose of my own enjoyment.
I make no promises about release date, features, usability, stability,
practicality, or compliance with any normal standards of software
development.

In pursuit of my unhindered enjoyment of this project, the only end-user
I choose to care about in this project is myself, and maybe a few select
friends. The timeline, the features, and the implementation are all
solely at my discretion. I reserve the right to make arbitrary decisions,
and change them at a moment's notice, without owing anyone an explanation.

If you see something here you like, you're welcome to fork the code under
the terms of the LICENSE and do as you wish with it.

If you're still intent on treating this as a viable project, you're welcome
to submit issues and pull requests. I may respond, or I may leave it sitting
indefinitely. If I ignore your bug report or brilliant contribution until
doomsday, don't take it personally.

If you decide to try and _use_ this software, you're taking your sanity
into your own hands. As long as it runs on my machine, that is all I care
about. It may be unstable, or not support your system. I offer neither
warranty nor technical support.

Long story short, I'm just coding for the love of coding!!

# DotFiles:

My most recent setup of the dotfiles I use. Since more people are actively using
the same setup and because I want to be able to recreate it on new machines I've created an installer.

Feel free to use this as you see fit, install the entire thing or just grab stuff from all the seperate configs
Just realize you'll need to manage all dependencies yourself when grabbing stuff without the full installer.

# ZSH

- Zshconfig (Alias, Config options, Function, Paths, Widgets)

- Zshrc (Bundles all the config files)

# Tmux:

- tmux_config (Bindings, Config options)

- tmux.conf (Bundles all the config files)

# Neovim

NeoVim gets installed when on OSX using brew after that we set the config in
~/.config/nvim

# To setup everything like i have it currently:

- `cd ~/`
- `git clone https://github.com/Mvzundert/dotfiles.git`
- `cd ~/dotfiles/tools/install`
- `./install.sh`

# Overwrite tmux configuration

- Copy `tools/multiplex/tmux/custom/config.local.example` to `tools/multiplex/tmux/custom/config.local`

# Usefull tmux commands

- `prefix + z`: zoom in on current pane (again to switch back).
- `prefix + ,`: rename current window.
- `prefix + R`: Reload tmux configuration.
- `prefix + 1`: go to first window.
- `prefix + n`: go to next window.
- `prefix + p`: go to previous window.
- `prefix + q`: close pane.
- `prefix + Q`: close window (confirmation).
