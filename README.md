# dotfiles

[![setup script test](https://github.com/kumapolar15/dotfiles/actions/workflows/setup-test.yml/badge.svg)](https://github.com/kumapolar15/dotfiles/actions/workflows/setup-test.yml)

## Overview

### Terminal

![スクリーンショット 2023-09-26 003401](https://github.com/kumapolar15/dotfiles/assets/129534535/f4e9d253-d698-498e-88aa-aa0f85605970)

## Supported OS

- Ubuntu(recommend)
- MacOS
- WSL
- Alpine Linux
- Arch Linux

## Install

1. Download

   ```shell
   git clone https://github.com/kumapolar15/dotfiles.git
   cd dotfiles
   ```

2. Setup

   ```shell
   make setup
   ```

3. Restart shell

   ```shell
   source ~/.zshenv
   source ~/.config/zsh/.zshrc
   exec $SHELL
   ```

4. Enjoy!

## Contents

- iceberg colorscheme
- zsh config
- neovim config
- tmux config
- modern unix cmd config
  - bat
  - delta
  - exa
  - fd
  - fzf
  - httpie
  - procs
  - ripgrep
  - rtx
- github cli config
- ghq config

## ColorScheme

- [iceberg](https://github.com/cocopon/iceberg.vim/tree/master)

## Zsh Setup

### Prompt

- [Starship](https://github.com/starship/starship)

### Plugin Manager

- [sheldon](https://github.com/rossmacarthur/sheldon)

### Zsh Plugins

- nothing yet

## NeoVim

### Plugin Manager

- origin

### Plugins

- nothing yet

## tmux

- VimLike keybinding
