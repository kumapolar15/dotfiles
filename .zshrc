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
# bindkey '^r' select-history

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


# . /usr/local/opt/asdf/libexec/asdf.sh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#586e75"

export ZENO_HOME=~/.config/zeno
export ZENO_ENABLE_SOCK=1
export ZENO_GIT_CAT="cat"
export ZENO_GIT_TREE="tree"

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
  bindkey '^g' zeno-ghq-cd
  bindkey '^r' zeno-history-selection
  bindkey '^x' zeno-insert-snippet
fi

