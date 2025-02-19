rbenv() {
  eval "$(command rbenv init - --no-rehash zsh)"
  rbenv "$@"
}
