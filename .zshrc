eval "$(sheldon source)"

alias du='du -h'
alias .b='nvim ~/.bashrc'
alias .z='nvim ~/.zshrc'
alias ls='ls --color=auto'

select-history() {
  BUFFER=$(history -n -r 1 | fzf --query "$BUFFER")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

BREWFILE="$HOME/.Brewfile"

function brew-bundle-dump() {
  command brew bundle dump --file "$BREWFILE" --force
}

brew() {
  command brew $@
  brew-bundle-dump
}

zshaddhistory() {
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}
