# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# github cli completion
eval "$(gh completion -s zsh)"
