# dotfiles

[![setup script test](https://github.com/kumapolar15/dotfiles/actions/workflows/setup-test.yml/badge.svg)](https://github.com/kumapolar15/dotfiles/actions/workflows/setup-test.yml)

## Overview

### Terminal

![スクリーンショット 2023-10-04 000404](https://github.com/kumapolar15/dotfiles/assets/129534535/a62373c7-be02-4b77-9b22-ca3f67e5a742)

![スクリーンショット 2023-10-04 000639](https://github.com/kumapolar15/dotfiles/assets/129534535/eb19fc2b-a580-4f41-b295-a12441cb00d6)

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
   exec $SHELL
   ```

4. Enjoy!

## Contents

- color scheme setting
- zsh config
- NeoVim config
- tmux config
- Modern UNIX cmd config
- GitHub CLI config
- ghq config

## Color Scheme

- [Iceberg](https://github.com/cocopon/iceberg.vim/tree/master)

## Zsh

### Prompt

- [Starship](https://github.com/starship/starship)

### Plugin Manager

- [sheldon](https://github.com/rossmacarthur/sheldon)

### Zsh Plugins

- [zsh-auto-suggestions](https://github.com/zsh-users/zsh-autosuggestions): basic completions.
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting): syntax highlight.
- [zsh-abbr](https://github.com/olets/zsh-abbr): auto-expanding abbreviations.

## NeoVim

### Plugin Manager

- [packer](https://github.com/wbthomason/packer.nvim)

### Plugins

- [iceberg](): color schime
- [nvim-web-devicons](): icons
- [lualine.nvim](): status line
- [bufferline.nvim](): buffer tab
- [nvim-treesitter](): syntax highlight
- [gitsigns.nvim](): git status
- [nvim-tree.lua](): file explorer
- [telescope.nvim](): fuzzy finder
- [mason.nvim](): LSP server manager
- [mason-lspconfig.nvim](): bridge mason with mason-lspconfig
- [nvim-lspconfig](): LSP setting
- [nvim-cmp](): completions
- [lspsaga.nvim](): LSP UI
- [null-ls](): linter
- [fidget.nvim](): LSP status
- [nvim-autopairs](): autopairs
- [nvim-config-local](): local setting
- [nvim-colorizer.lua](): color viewer
- [vim-startuptime](): measure performance

## tmux

- VimLike keybinding

## Modern UNIX Commands

- [bat](https://github.com/sharkdp/bat): alternative to cat.
- [delta](https://github.com/dandavison/delta): alternative to diff.
- [exa](https://github.com/ogham/exa): alternative to ls.
- [fd](https://github.com/sharkdp/fd): alternative to find.
- [fzf](https://github.com/junegunn/fzf): fuzzy finder.
- [httpie cli](https://github.com/httpie/cli): alternative to cli.
- [procs](https://github.com/dalance/procs): alternative to ps.
- [ripgrep](https://github.com/BurntSushi/ripgrep): alternative to grep.
- [rtx](https://github.com/jdx/rtx): alternative to asdf.
- [zoxide](https://github.com/ajeetdsouza/zoxide): alternative to cd.

## GitHub CLI

- [GitHub CLI](https://github.com/cli/cli): GitHub on the command line.

## ghq

- [ghq](https://github.com/x-motemen/ghq): repository manager.
