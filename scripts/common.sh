#!/bin/bash
set -euxC

DOTFILES_REPO="$(
  cd "$(dirname "$0")/.." || exit 1
  pwd
)"
export DOTFILES_REPO
KERNEL_NAME="$(uname -s | tr '[:upper:]' '[:lower:]')"
export KERNEL_NAME
MACHINE_ARCH="$(uname -m | tr '[:upper:]' '[:lower:]')"
export MACHINE_ARCH

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  mkdir -p "$XDG_CONFIG_HOME"
fi

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
if [[ ! -d "$XDG_DATA_HOME" ]]; then
  mkdir -p "$XDG_DATA_HOME"
fi

export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
if [[ ! -d "$XDG_STATE_HOME" ]]; then
  mkdir -p "$XDG_STATE_HOME"
fi

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
if [[ ! -d "$XDG_CACHE_HOME" ]]; then
  mkdir -p "$XDG_CACHE_HOME"
fi

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$PATH:$HOME/.local/bin"
fi

if [[ ! -d "$HOME/.local/bin" ]]; then
  mkdir -p "$HOME/.local/bin"
fi
