#!/bin/bash
set -euxC

if [[ ! -d "$HOME/.local/bin" ]]; then
  mkdir -p "$HOME/.local/bin"
fi
# fdfindをfdで実行できるようにする
if fdfind --version >/dev/null 2>&1; then
  if [[ ! -f "$HOME/.local/bin/fd" ]]; then
    ln -s "$(which fdfind)" "$HOME/.local/bin/fd"
  fi
fi
# batをbatcatで実行できるようにする
if batcat --version >/dev/null 2>&1; then
  if [[ ! -f "$HOME/.local/bin/bat" ]]; then
    ln -s "$(which batcat)" "$HOME/.local/bin/bat"
  fi
fi