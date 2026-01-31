#!/bin/bash
set -euxC

# shellcheck source=scripts/common.sh
source "$(dirname "$0")/common.sh"

if [[ -L "$HOME/.zshenv" ]]; then
  unlink "$HOME/.zshenv"
fi
find "$XDG_CONFIG_HOME" -type l -maxdepth 1 | while read -r link; do
  target="$(readlink "$link")"
  if [[ "$target" == "$DOTFILES_REPO/"* ]]; then
    unlink "$link"
  fi
done
