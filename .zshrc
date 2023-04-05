eval "$(sheldon source)"

alias du='du -h'
alias .b='nvim ~/.bashrc'
alias .z='nvim ~/.zshrc'

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
