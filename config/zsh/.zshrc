## sheldon entrypoint
eval "$(sheldon source)"

## ローカルの.zshrcが存在する場合は読み込む
if [[ -f "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
if [[ -f "$XDG_CONFIG_HOME/zsh/.zshrc.local" ]]; then
  source "$XDG_CONFIG_HOME/zsh/.zshrc.local"
fi