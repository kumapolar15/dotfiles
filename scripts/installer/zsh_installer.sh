#!/bin/bash -xe
if [ ! type "brew" > /dev/null 2>&1 ]; then
  echo "homebrew is not installed. please install homebrew!"
  exit 1
fi

brew install zsh
