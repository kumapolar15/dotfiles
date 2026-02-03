autoload -Uz compinit
_zcompdump="${XDG_CACHE_HOME}/zsh/zcompdump-${HOST}-${ZSH_VERSION}"
if [ ! -d "${_zcompdump:h}" ]; then
    mkdir -p "${_zcompdump:h}"
fi
if [ -n "${_zcompdump}"(#qN.mh+24) ]; then
    autoload -Uz compinit && compinit -d "${_zcompdump}"
else
    autoload -Uz compinit && compinit -C -d "${_zcompdump}"
fi
