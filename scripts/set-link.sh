#!/bin/bash -xe
source "$(dirname "$0")/common.sh"

mkdir -p \
  "$XDG_CONFIG_HOME" \
  "$XDG_STATE_HOME" \
  "$XDG_DATA_HOME"

ls "$DOTFILES_REPO/config" | xargs -I {} ln -sfv "$DOTFILES_REPO/config/"{} "$XDG_CONFIG_HOME/"{}
ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
