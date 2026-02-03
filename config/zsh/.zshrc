## sheldon entrypoint
_sheldon_cache="${XDG_CACHE_HOME}/sheldon/sheldon.zsh"
if [[ ! -d "${_sheldon_cache:h}" ]]; then
  mkdir -p "${_sheldon_cache:h}"
fi
if [[ ! -r "$_sheldon_cache" || "$SHELDON_CONFIG_FILE" -nt "$_sheldon_cache" ]]; then
  sheldon source > "$_sheldon_cache"
fi
source "$_sheldon_cache"

## ローカルの.zshrcが存在する場合は読み込む
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
if [[ -f "$XDG_CONFIG_HOME/zsh/.zshrc.local" ]]; then
  source "$XDG_CONFIG_HOME/zsh/.zshrc.local"
fi