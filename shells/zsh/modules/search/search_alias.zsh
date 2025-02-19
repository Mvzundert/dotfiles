fzf_aliases() {
  alias | fzf \
        --preview 'echo {}' \
        --preview-window=up:3:hidden \
        --border \
        --height=50%
}

alias ag=fzf_aliases
