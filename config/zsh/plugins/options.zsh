### ENV ###
# zsh config
export HISTFILE="$XDG_STATE_HOME/zsh_history"
if [ ! -d "${HISTFILE:h}" ]; then
    mkdir -p "${HISTFILE:h}"
fi
export HISTSIZE=12000
export SAVEHIST=10000

# less config
export LESSCHARSET=utf-8

### OPTION ###
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
setopt EXTENDED_GLOB