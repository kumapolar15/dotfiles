#!/bin/bash -xeu
if [ -e "$XDG_CONFIG_HOME/alacritty/themes" ]; then
  echo "alacritty-thems is already installed."
  exit 1
fi
git clone git@github.com:alacritty/alacritty-theme.git $XDG_CONFIG_HOME/alacritty/themes
