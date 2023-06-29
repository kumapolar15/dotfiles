# ======================================================================
# .zshrc
# ======================================================================

eval "$(sheldon source)"


# ----------------------------------------------------------------------
# Base Configuration
# ----------------------------------------------------------------------
source "$ZRCDIR/base.zsh"

# ----------------------------------------------------------------------
# Options
# ----------------------------------------------------------------------
source "$ZRCDIR/option.zsh"

# ----------------------------------------------------------------------
# Completion
# ----------------------------------------------------------------------
source "$ZRCDIR/completion.zsh"

# ----------------------------------------------------------------------
# Function
# ----------------------------------------------------------------------
source "$ZRCDIR/function.zsh"

# ----------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------
source "$ZRCDIR/alias.zsh"

# ----------------------------------------------------------------------
# Key Bindings
# ----------------------------------------------------------------------
source "$ZRCDIR/bindkey.zsh"


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
bindkey "^p" tree_select_buffer

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

