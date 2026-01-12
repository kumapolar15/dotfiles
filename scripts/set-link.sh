#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/common.sh"

ls "$DOTFILES_REPO/config" | xargs -I {} sh -c 'if [ -d "$XDG_CONFIG_HOME/"{} ]; then mv "$XDG_CONFIG_HOME/"{} "$XDG_CONFIG_HOME/{}.bak"; fi' || true
ls "$DOTFILES_REPO/config" | xargs -I {} ln -sv "$DOTFILES_REPO/config/"{} "$XDG_CONFIG_HOME/"{}
if [ "$KERNEL_NAME" = "darwin" ]; then
    ls "$DOTFILES_REPO/config-mac" | xargs -I {} sh -c 'if [ -d "$XDG_CONFIG_HOME/"{} ]; then mv "$XDG_CONFIG_HOME/"{} "$XDG_CONFIG_HOME/{}.bak"; fi' || true
    ls "$DOTFILES_REPO/config-mac" | xargs -I {} ln -sv "$DOTFILES_REPO/config-mac/"{} "$XDG_CONFIG_HOME/"{}
fi
ln -sbv --suffix=.bak "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"