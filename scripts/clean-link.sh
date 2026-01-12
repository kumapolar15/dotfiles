#!/bin/bash -xe
# shellcheck source=scripts/common.sh
source "$(dirname "$0")/common.sh"

cd "$(dirname "$0")/.."
DOTFILES_DIR="$(pwd)"
if [ -f "$HOME/.zshenv" ]; then
    unlink "$HOME/.zshenv"
fi
ls -l "$XDG_CONFIG_HOME" | grep "$DOTFILES_DIR" | awk '{print $9}' | xargs -I {} unlink "$XDG_CONFIG_HOME/"{}