# -------------------------------------------------------------------
# Alias Python 3 and pip3 because we also have
# Python 2 and Pip installed for legacy stuff.
# -------------------------------------------------------------------
alias python="python3"
alias pip="pip3"

# -------------------------------------------------------------------
# Some default commands
# -------------------------------------------------------------------
alias pserve="python -m http.server 80"   # Start a webserver with the current Dir as root.
alias pup="pip3 install --user --upgrade" # to upgrade installed packages.
