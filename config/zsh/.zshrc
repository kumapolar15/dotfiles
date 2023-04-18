eval "$(sheldon source)"

if [ -e "$HOME/.zshrc.local" ] ; then
  source "$HOME/.zshrc.local"
fi

path=(
	"$HOME/.local/bin"(N-/)
	"$CARGO_HOME/bin"(N-/)
	"$DENO_INSTALL/bin"(N-/)
	"$XDG_CONFIG_HOME/scripts/bin"(N-/)
	"$path[@]"
)

fpath=(
	"$XDG_DATA_HOME/zsh/completions"(N-/)
	"$fpath[@]"
)

export HISTFILE="$XDG_STATE_HOME/zsh_history"
export HISTSIZE=12000
export SAVEHIST=10000

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt GLOBDOTS
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INTERACTIVE_COMMENTS
setopt NO_SHARE_HISTORY
setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT
setopt NO_FLOW_CONTROL

select-history() {
  BUFFER=$(history -n -r 1 | fzf --query "$BUFFER")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

zshaddhistory() {
  local line="${1%%$'\n'}"
  [[ ! "$line" =~ "^(cd|jj?|lazygit|la|ll|ls|rm|rmdir)($| )" ]]
}

function tree_select() {
  tree -N -a --charset=o -f -I '.git|.idea|resolution-cache|target/streams|node_modules|vendor' | \
    fzf --preview 'f() {
      set -- $(echo -- "$@" | grep -o "\./.*$");
      if [ -d $1 ]; then
        ls -lh $1
      else
        head -n 100 $1
      fi
    }; f {}' | \
      sed -e "s/ ->.*\$//g" | \
      tr -d '\||`| ' | \
      tr '\n' ' ' | \
      sed -e "s/--//g" | \
      xargs echo
}

function tree_select_buffer(){
  local SELECTED_FILE=$(tree_select)
  if [ -n "$SELECTED_FILE" ]; then
    LBUFFER+="$SELECTED_FILE"
    CURSOR=$#LBUFFER
    zle reset-prompt
  fi
}
zle -N tree_select_buffer
bindkey "^t" tree_select_buffer

alias du='du -h'
alias .b='nvim ~/.bashrc'
alias .z='nvim ~/.config/zsh/.zshrc'
alias ls='ls --color=auto'
alias tmux='tmux -u'

BREWFILE="$HOME/.Brewfile"

function brew-bundle-dump() {
  command brew bundle dump --file "$BREWFILE" --force
}

brew() {
  command brew $@
  brew-bundle-dump
}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#586e75"

export ZENO_HOME=~/.config/zeno
export ZENO_ENABLE_SOCK=1
export ZENO_GIT_CAT="cat"
export ZENO_GIT_TREE="tree"

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion
  bindkey '^x' zeno-insert-snippet
fi

