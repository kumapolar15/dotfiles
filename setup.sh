#!/bin/bash
set -e
echo "開発環境を構築します..."

DOTFILES_REPO="$HOME/dotfiles"
if [ ! -e "$DOTFILES_REPO" ]; then
    echo "dotfilesリポジトリをcloneします..."
    git clone https://github.com/kumapolar15/dotfiles.git ~/dotfiles
fi

cd "$DOTFILES_REPO"
git ls-files | grep -e '^\.' | while read DOTFILE; do
  echo "シンボリックリンクを貼ります：$DOTFILE"
done
