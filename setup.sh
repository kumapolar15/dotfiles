#!/bin/bash -xeu
export DOTFILES_REPO="$HOME/dotfiles"
if [ ! -e "$DOTFILES_REPO" ]; then
  git clone https://github.com/kumapolar15/dotfiles.git "$DOTFILES_REPO"
fi

cd "$DOTFILES_REPO/scripts"
source "$(dirname "$0")/install.sh"
source "$(dirname "$0")/set-link.sh"
