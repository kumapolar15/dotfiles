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

# default editor
export EDITOR="nvim"

### OPTION ###
# Changing Directories
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Completion
setopt AUTO_MENU
setopt NO_LIST_BEEP

# Expansion and Globbing
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt MAGIC_EQUAL_SUBST

# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt NO_SHARE_HISTORY

# Input/Output
setopt NO_FLOW_CONTROL
#setopt PRINT_EIGHT_BIT
