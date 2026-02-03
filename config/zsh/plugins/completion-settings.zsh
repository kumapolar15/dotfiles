### 補完設定 ###
# インストール直後のコマンドを即座に認識するためにrehash
zstyle ':completion:*:commands' rehash 1
# 大文字小文字を区別しない補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# Cacheを用いた補完設定
zstyle ':completion:*' use-cache yes
_zcompcache="${XDG_CACHE_HOME}/zsh/zcompcache"
if [ ! -d "${_zcompcache:h}" ]; then
    mkdir -p "${_zcompcache:h}"
fi
zstyle ':completion:*' cache-path "${_zcompcache}"