zstyle ':completion:*' use-cache yes
_zcompcache="${XDG_CACHE_HOME}/zsh/zcompcache"
if [ ! -d "${_zcompcache:h}" ]; then
    mkdir -p "${_zcompcache:h}"
fi
zstyle ':completion:*' cache-path "${_zcompcache}"