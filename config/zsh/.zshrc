export HISTFILE="$XDG_STATE_HOME/zsh/history"
if [ ! -d "${HISTFILE:h}" ]; then
    mkdir -p "${HISTFILE:h}"
fi
autoload -Uz compinit
_zcompdump="${XDG_CACHE_HOME}/zsh/zcompdump-${HOST}-${ZSH_VERSION}"
if [ ! -d "${_zcompdump:h}" ]; then
    mkdir -p "${_zcompdump:h}"
fi
setopt extendedglob
if [ -n "${_zcompdump}"(#qN.mh+24) ]; then
    autoload -Uz compinit && compinit -d "${_zcompdump}"
else
    autoload -Uz compinit && compinit -C -d "${_zcompdump}"
fi
zstyle ':completion:*' use-cache yes
_zcompcache="${XDG_CACHE_HOME}/zsh/zcompcache"
if [ ! -d "${_zcompcache:h}" ]; then
    mkdir -p "${_zcompcache:h}"
fi
zstyle ':completion:*' cache-path "${_zcompcache}"
