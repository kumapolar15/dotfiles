#!/bin/bash
set -euxC

# shellcheck source=scripts/common.sh
source "$(dirname "$0")/common.sh"

function backup_existing() {
  local target_path
  target_path="$1"
  if [[ -e "$target_path" ]] && [[ ! -L "$target_path" ]]; then
    mv "$target_path" "$target_path.bak"
  elif [[ -L "$target_path" ]]; then
    unlink "$target_path"
  fi
}
function main() {
  local config_dirs
  config_dirs="$(find "$DOTFILES_REPO/config" -maxdepth 1 -mindepth 1 -type d | awk -F/ '{print $NF}')"
  for dir in $config_dirs; do
    backup_existing "$XDG_CONFIG_HOME/$dir"
    ln -sv "$DOTFILES_REPO/config/$dir" "$XDG_CONFIG_HOME/$dir"
  done
  if [[ "$KERNEL_NAME" == "darwin" ]]; then
    local config_mac_dirs
    config_mac_dirs="$(find "$DOTFILES_REPO/config-mac" -maxdepth 1 -mindepth 1 -type d | awk -F/ '{print $NF}')"
    for dir in $config_mac_dirs; do
      backup_existing "$XDG_CONFIG_HOME/$dir"
      ln -sv "$DOTFILES_REPO/config-mac/$dir" "$XDG_CONFIG_HOME/$dir"
    done
  fi
  backup_existing "$HOME/.zshenv"
  ln -sv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
}

main
