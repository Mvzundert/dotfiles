#!/bin/bash
set -euo pipefail

MISSING=()

check() { command -v "$1" >/dev/null 2>&1 || MISSING+=("$1"); }

check git
check gcc
check node
check tree-sitter

if [ ${#MISSING[@]} -gt 0 ]; then
  echo "Missing prerequisites: ${MISSING[*]}"
  case "$(uname -s)" in
    Darwin)
      echo "Install: brew install ${MISSING[*]}"
      ;;
    Linux)
      if [ -f /run/ostree-booted ]; then
        echo "Install: rpm-ostree install ${MISSING[*]} && systemctl reboot"
      else
        if command -v pacman >/dev/null 2>&1; then
          echo "Install: sudo pacman -S ${MISSING[*]}"
        else
          echo "Install: use your package manager to install: ${MISSING[*]}"
        fi
      fi
      ;;
  esac
  exit 1
fi

echo "Installing all treesitter parsers..."
nvim --headless -c \
  "TSInstallSync bash eex elixir erlang go heex javascript lua luadoc markdown php python ruby rust vim vimdoc" \
  -c q

echo "Done. Parsers installed to ~/.local/share/nvim/site/parser/"
