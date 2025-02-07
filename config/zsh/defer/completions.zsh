# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:commands' rehash 1
zstyle ':completion:*:*:git:*' script "$XDG_CONFIG_HOME/zsh/completions/git-completion.bash"
